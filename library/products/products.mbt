// Translated from upstream Library/products.ml; edit this file directly.

///|
/// Library/products.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// NPRODUCT_SUPPORT
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([@iterate.nproduct(), @iterate.iterate_support()]),
  )
  nproduct_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, nproduct(support(op_star, f, s), f) == nproduct(s, f)"),
      t1,
    ),
  )
}

///|
let nproduct_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_SUPPORT",
)

///|
/// `NPRODUCT_SUPPORT`
pub fn nproduct_support() -> @kernel.Thm {
  nproduct_support_c.get()
}

///|
/// NPRODUCT_UNION
fn step_3() -> Unit raise {
  let t2 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct(),
      @iterate.iterate_union(),
      @iterate.monoidal_mul(),
    ]),
  )
  nproduct_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → nproduct(UNION(s, t), f) == nproduct(s, f) * nproduct(t, f)"),
      t2,
    ),
  )
}

///|
let nproduct_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_UNION")

///|
/// `NPRODUCT_UNION`
pub fn nproduct_union() -> @kernel.Thm {
  nproduct_union_c.get()
}

///|
/// NPRODUCT_IMAGE
fn step_4() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([@iterate.monoidal_mul()]))
  let t3 = @tactics.match_mp_tac(@iterate.iterate_image())
  let t5 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@iterate.nproduct(), @equal.gsym(@iterate.neutral_mul())]),
      ),
      t3,
    ),
    t4,
  )
  nproduct_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → nproduct(IMAGE(f, s), g) == nproduct(s, o(g, f))"),
      t5,
    ),
  )
}

///|
let nproduct_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_IMAGE")

///|
/// `NPRODUCT_IMAGE`
pub fn nproduct_image() -> @kernel.Thm {
  nproduct_image_c.get()
}

///|
/// NPRODUCT_INJECTION
fn step_5() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([@iterate.monoidal_mul()]))
  let t6 = @tactics.match_mp_tac(@iterate.iterate_injection())
  let t8 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.nproduct()])), t6),
    t7,
  )
  nproduct_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ p : (_) -> _, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → IN(p(x), s)) && (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → nproduct(s, o(f, p)) == nproduct(s, f)"),
      t8,
    ),
  )
}

///|
let nproduct_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_INJECTION",
)

///|
/// `NPRODUCT_INJECTION`
pub fn nproduct_injection() -> @kernel.Thm {
  nproduct_injection_c.get()
}

///|
/// NPRODUCT_ADD_SPLIT
fn step_6() -> Unit raise {
  let t9 = @simp.simp_tac(
    @list.List([
      @iterate.numseg_add_split(),
      nproduct_union(),
      @iterate.disjoint_numseg(),
      @iterate.finite_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < x + 1")),
    ]),
  )
  nproduct_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → nproduct(op_dot_dot(m, n + p), f) == nproduct(op_dot_dot(m, n), f) * nproduct(op_dot_dot(n + 1, n + p), f)"),
      t9,
    ),
  )
}

///|
let nproduct_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_ADD_SPLIT",
)

///|
/// `NPRODUCT_ADD_SPLIT`
pub fn nproduct_add_split() -> @kernel.Thm {
  nproduct_add_split_c.get()
}

///|
/// NPRODUCT_POS_LT
fn step_7() -> Unit raise {
  let t11 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      @calc_num.arith(),
      @sets.in_insert(),
      @arith.lt_mult(),
    ]),
  )
  let t10 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t12 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
      ),
      t10,
    ),
    t11,
  )
  nproduct_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → 0 < f(x)) → 0 < nproduct(s, f)"),
      t12,
    ),
  )
}

///|
let nproduct_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_POS_LT",
)

///|
/// `NPRODUCT_POS_LT`
pub fn nproduct_pos_lt() -> @kernel.Thm {
  nproduct_pos_lt_c.get()
}

///|
/// NPRODUCT_POS_LT_NUMSEG
fn step_8() -> Unit raise {
  let t13 = @simp.simp_tac(
    @list.List([
      nproduct_pos_lt(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  nproduct_pos_lt_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → 0 < f(x)) → 0 < nproduct(op_dot_dot(m, n), f)"),
      t13,
    ),
  )
}

///|
let nproduct_pos_lt_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_POS_LT_NUMSEG",
)

///|
/// `NPRODUCT_POS_LT_NUMSEG`
pub fn nproduct_pos_lt_numseg() -> @kernel.Thm {
  nproduct_pos_lt_numseg_c.get()
}

///|
/// NPRODUCT_OFFSET
fn step_9() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t15 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @iterate.numseg_offset_image(),
        nproduct_image(),
        @arith.eq_add_rcancel(),
        @iterate.finite_numseg(),
      ]),
    ),
    t14,
  )
  nproduct_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ p : Num, nproduct(op_dot_dot(m + p, (n : Num) + p), f) == nproduct(op_dot_dot(m, n), (i : Num) => f(i + p))"),
      t15,
    ),
  )
}

///|
let nproduct_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_OFFSET",
)

///|
/// `NPRODUCT_OFFSET`
pub fn nproduct_offset() -> @kernel.Thm {
  nproduct_offset_c.get()
}

///|
/// NPRODUCT_SING
fn step_10() -> Unit raise {
  let t16 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      @sets.finite_rules(),
      @sets.not_in_empty(),
      @arith.mult_clauses(),
    ]),
  )
  nproduct_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Num, ∀ x : _, nproduct({x}, f) == f(x)"), t16),
  )
}

///|
let nproduct_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_SING")

///|
/// `NPRODUCT_SING`
pub fn nproduct_sing() -> @kernel.Thm {
  nproduct_sing_c.get()
}

///|
/// NPRODUCT_SING_NUMSEG
fn step_11() -> Unit raise {
  let t17 = @simp.rewrite_tac(
    @list.List([@iterate.numseg_sing(), nproduct_sing()]),
  )
  nproduct_sing_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Num, ∀ n : Num, nproduct(op_dot_dot(n, n), f) == f(n)"), t17),
  )
}

///|
let nproduct_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_SING_NUMSEG",
)

///|
/// `NPRODUCT_SING_NUMSEG`
pub fn nproduct_sing_numseg() -> @kernel.Thm {
  nproduct_sing_numseg_c.get()
}

///|
/// NPRODUCT_CLAUSES_NUMSEG
fn step_12() -> Unit raise {
  let t20 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
      @arith.mult_ac(),
    ]),
  )
  let t19 = @simp.asm_simp_tac(
    @list.List([
      nproduct_sing(),
      @iterate.nproduct_clauses(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  let t18 = @tactics.repeat_tac(@tactics.strip_tac)
  let t21 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])),
          t18,
        ),
        @class.cond_cases_tac,
      ),
      t19,
    ),
    t20,
  )
  nproduct_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, nproduct(op_dot_dot(m, 0), (f : (Num) -> Num)) == (if m == 0 { f(0) } else { 1 })) && (∀ m : Num, ∀ n : Num, nproduct(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { nproduct(op_dot_dot(m, n), f) * f(SUC(n)) } else { nproduct(op_dot_dot(m, n), f) }))"),
      t21,
    ),
  )
}

///|
let nproduct_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLAUSES_NUMSEG",
)

///|
/// `NPRODUCT_CLAUSES_NUMSEG`
pub fn nproduct_clauses_numseg() -> @kernel.Thm {
  nproduct_clauses_numseg_c.get()
}

///|
/// NPRODUCT_EQ
fn step_13() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([@iterate.monoidal_mul()]))
  let t22 = @tactics.match_mp_tac(@iterate.iterate_eq())
  let t24 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.nproduct()])), t22),
    t23,
  )
  nproduct_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → nproduct(s, f) == nproduct(s, g)"),
      t24,
    ),
  )
}

///|
let nproduct_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_EQ")

///|
/// `NPRODUCT_EQ`
pub fn nproduct_eq() -> @kernel.Thm {
  nproduct_eq_c.get()
}

///|
/// NPRODUCT_EQ_NUMSEG
fn step_14() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([nproduct_eq(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  nproduct_eq_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → nproduct(op_dot_dot(m, n), f) == nproduct(op_dot_dot(m, n), g)"),
      t25,
    ),
  )
}

///|
let nproduct_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_EQ_NUMSEG",
)

///|
/// `NPRODUCT_EQ_NUMSEG`
pub fn nproduct_eq_numseg() -> @kernel.Thm {
  nproduct_eq_numseg_c.get()
}

///|
/// NPRODUCT_EQ_0
fn step_15() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([]))
  let t26 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      @arith.mult_eq_0(),
      @sets.in_insert(),
      @calc_num.arith(),
      @sets.not_in_empty(),
    ]),
  )
  let t28 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t26,
    ),
    t27,
  )
  nproduct_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) → (nproduct(s, f) == 0) == (∃ x : _, IN(x, s) && f(x) == 0)"),
      t28,
    ),
  )
}

///|
let nproduct_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_EQ_0")

///|
/// `NPRODUCT_EQ_0`
pub fn nproduct_eq_0() -> @kernel.Thm {
  nproduct_eq_0_c.get()
}

///|
/// NPRODUCT_EQ_0_NUMSEG
fn step_16() -> Unit raise {
  let t29 = @simp.simp_tac(
    @list.List([
      nproduct_eq_0(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  nproduct_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (nproduct(op_dot_dot(m, n), f) == 0) == (∃ x : Num, m <= x && x <= n && f(x) == 0)"),
      t29,
    ),
  )
}

///|
let nproduct_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_EQ_0_NUMSEG",
)

///|
/// `NPRODUCT_EQ_0_NUMSEG`
pub fn nproduct_eq_0_numseg() -> @kernel.Thm {
  nproduct_eq_0_numseg_c.get()
}

///|
/// NPRODUCT_RESTRICT
fn step_17() -> Unit raise {
  let t31 = @simp.asm_simp_tac(@list.List([]))
  let t30 = @tactics.match_mp_tac(nproduct_eq())
  let t32 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t30),
    t31,
  )
  nproduct_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) → nproduct(s, (i : _) => if IN(i, s) { f(i) } else { 1 }) == nproduct(s, f)"),
      t32,
    ),
  )
}

///|
let nproduct_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_RESTRICT",
)

///|
/// `NPRODUCT_RESTRICT`
pub fn nproduct_restrict() -> @kernel.Thm {
  nproduct_restrict_c.get()
}

///|
/// NPRODUCT_RESTRICT_SET
fn step_18() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([@iterate.monoidal_mul()]))
  let t33 = @tactics.match_mp_tac(@iterate.iterate_restrict_set())
  let t35 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@iterate.nproduct(), @equal.gsym(@iterate.neutral_mul())]),
      ),
      t33,
    ),
    t34,
  )
  nproduct_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Num, nproduct({(i : A) | IN(i, s) && P(i)}, f) == nproduct(s, (i : A) => if P(i) { f(i) } else { 1 })"),
      t35,
    ),
  )
}

///|
let nproduct_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_RESTRICT_SET",
)

///|
/// `NPRODUCT_RESTRICT_SET`
pub fn nproduct_restrict_set() -> @kernel.Thm {
  nproduct_restrict_set_c.get()
}

///|
/// NPRODUCT_LE
fn step_19() -> Unit raise {
  let t38 = @meson.meson_tac(@list.List([@arith.le_mult2(), @arith.le_0()]))
  let t37 = @simp.simp_tac(
    @list.List([
      @sets.in_insert(),
      @iterate.nproduct_clauses(),
      @sets.not_in_empty(),
      @arith.le_refl(),
    ]),
  )
  let t36 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t39 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
        ),
        t36,
      ),
      t37,
    ),
    t38,
  )
  nproduct_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → f(x) <= (g : (_) -> Num)(x)) → nproduct(s, f) <= nproduct(s, g)"),
      t39,
    ),
  )
}

///|
let nproduct_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_LE")

///|
/// `NPRODUCT_LE`
pub fn nproduct_le() -> @kernel.Thm {
  nproduct_le_c.get()
}

///|
/// NPRODUCT_LE_NUMSEG
fn step_20() -> Unit raise {
  let t40 = @simp.simp_tac(
    @list.List([nproduct_le(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  nproduct_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) <= (g : (Num) -> Num)(i)) → nproduct(op_dot_dot(m, n), f) <= nproduct(op_dot_dot(m, n), g)"),
      t40,
    ),
  )
}

///|
let nproduct_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_LE_NUMSEG",
)

///|
/// `NPRODUCT_LE_NUMSEG`
pub fn nproduct_le_numseg() -> @kernel.Thm {
  nproduct_le_numseg_c.get()
}

///|
/// NPRODUCT_EQ_1
fn step_21() -> Unit raise {
  let t41 = @simp.simp_tac(
    @list.List([@iterate.iterate_eq_neutral(), @iterate.monoidal_mul()]),
  )
  let t42 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.nproduct(), @equal.gsym(@iterate.neutral_mul())]),
    ),
    t41,
  )
  nproduct_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == 1) → nproduct(s, f) == 1"),
      t42,
    ),
  )
}

///|
let nproduct_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_EQ_1")

///|
/// `NPRODUCT_EQ_1`
pub fn nproduct_eq_1() -> @kernel.Thm {
  nproduct_eq_1_c.get()
}

///|
/// NPRODUCT_EQ_1_NUMSEG
fn step_22() -> Unit raise {
  let t43 = @simp.simp_tac(@list.List([nproduct_eq_1(), @iterate.in_numseg()]))
  nproduct_eq_1_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == 1) → nproduct(op_dot_dot(m, n), f) == 1"),
      t43,
    ),
  )
}

///|
let nproduct_eq_1_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_EQ_1_NUMSEG",
)

///|
/// `NPRODUCT_EQ_1_NUMSEG`
pub fn nproduct_eq_1_numseg() -> @kernel.Thm {
  nproduct_eq_1_numseg_c.get()
}

///|
/// NPRODUCT_MUL_GEN
fn step_23() -> Unit raise {
  let t46 = @tactics.accept_tac(@iterate.monoidal_mul())
  let t45 = @tactics.match_mp_tac(@iterate.iterate_op_gen())
  let t44 = @equal.gsym(@iterate.support())
  let t47 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@iterate.neutral_mul()),
          t44,
          @iterate.nproduct(),
        ]),
      ),
      t45,
    ),
    t46,
  )
  nproduct_mul_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, FINITE({(x : _) | IN(x, s) && !(f(x) == 1)}) && FINITE({(x : _) | IN(x, s) && !(g(x) == 1)}) → nproduct(s, (x : _) => f(x) * g(x)) == nproduct(s, f) * nproduct(s, g)"),
      t47,
    ),
  )
}

///|
let nproduct_mul_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_MUL_GEN",
)

///|
/// `NPRODUCT_MUL_GEN`
pub fn nproduct_mul_gen() -> @kernel.Thm {
  nproduct_mul_gen_c.get()
}

///|
/// NPRODUCT_MUL
fn step_24() -> Unit raise {
  let t49 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      @arith.mult_ac(),
      @arith.mult_clauses(),
    ]),
  )
  let t48 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t50 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t48,
    ),
    t49,
  )
  nproduct_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) → nproduct(s, (x : _) => f(x) * g(x)) == nproduct(s, f) * nproduct(s, g)"),
      t50,
    ),
  )
}

///|
let nproduct_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_MUL")

///|
/// `NPRODUCT_MUL`
pub fn nproduct_mul() -> @kernel.Thm {
  nproduct_mul_c.get()
}

///|
/// NPRODUCT_MUL_NUMSEG
fn step_25() -> Unit raise {
  let t51 = @simp.simp_tac(
    @list.List([nproduct_mul(), @iterate.finite_numseg()]),
  )
  nproduct_mul_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ m : Num, ∀ n : Num, nproduct(op_dot_dot(m, n), (x : Num) => f(x) * g(x)) == nproduct(op_dot_dot(m, n), f) * nproduct(op_dot_dot(m, n), g)"),
      t51,
    ),
  )
}

///|
let nproduct_mul_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_MUL_NUMSEG",
)

///|
/// `NPRODUCT_MUL_NUMSEG`
pub fn nproduct_mul_numseg() -> @kernel.Thm {
  nproduct_mul_numseg_c.get()
}

///|
/// NPRODUCT_CONST
fn step_26() -> Unit raise {
  let t52 = @simp.simp_tac(
    @list.List([@iterate.nproduct_clauses(), @sets.card_clauses(), @arith.exp()]),
  )
  let t53 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t52,
  )
  nproduct_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ s : (_) -> Bool, FINITE(s) → nproduct(s, (x : _) => c) == EXP(c, CARD(s))"),
      t53,
    ),
  )
}

///|
let nproduct_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_CONST")

///|
/// `NPRODUCT_CONST`
pub fn nproduct_const() -> @kernel.Thm {
  nproduct_const_c.get()
}

///|
/// NPRODUCT_CONST_NUMSEG
fn step_27() -> Unit raise {
  let t54 = @simp.simp_tac(
    @list.List([
      nproduct_const(),
      @iterate.card_numseg(),
      @iterate.finite_numseg(),
    ]),
  )
  nproduct_const_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ m : Num, ∀ n : Num, nproduct(op_dot_dot(m, n), (x : Num) => c) == EXP(c, n + 1 - m)"),
      t54,
    ),
  )
}

///|
let nproduct_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CONST_NUMSEG",
)

///|
/// `NPRODUCT_CONST_NUMSEG`
pub fn nproduct_const_numseg() -> @kernel.Thm {
  nproduct_const_numseg_c.get()
}

///|
/// NPRODUCT_CONST_NUMSEG_1
fn step_28() -> Unit raise {
  let t55 = @simp.simp_tac(
    @list.List([
      nproduct_const(),
      @iterate.card_numseg_1(),
      @iterate.finite_numseg(),
    ]),
  )
  nproduct_const_numseg_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, ∀ n : Num, nproduct(op_dot_dot(1, n), (x : Num) => c) == EXP(c, n)"),
      t55,
    ),
  )
}

///|
let nproduct_const_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CONST_NUMSEG_1",
)

///|
/// `NPRODUCT_CONST_NUMSEG_1`
pub fn nproduct_const_numseg_1() -> @kernel.Thm {
  nproduct_const_numseg_1_c.get()
}

///|
/// NPRODUCT_ONE
fn step_29() -> Unit raise {
  let t56 = @simp.simp_tac(@list.List([nproduct_eq_1()]))
  nproduct_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, nproduct(s, (n : _) => 1) == 1"), t56),
  )
}

///|
let nproduct_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_ONE")

///|
/// `NPRODUCT_ONE`
pub fn nproduct_one() -> @kernel.Thm {
  nproduct_one_c.get()
}

///|
/// NPRODUCT_CLOSED
fn step_30() -> Unit raise {
  let t65 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_mul(), @equal.gsym(@iterate.nproduct())]),
  )
  let t61 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t64 = @tactics.disch_then(fn(
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
    (fn(
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
      let s59 = @tactics.mp_tac(x58)
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
    })(((x62 : @kernel.Thm) => @bool.spec(t61, x62))(x63))
  })
  let t57 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed())(@iterate.monoidal_mul()),
  )
  let t66 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t57),
      t64,
    ),
    t65,
  )
  nproduct_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ f : (A) -> Num, ∀ s : (A) -> Bool, P(1) && (∀ x : Num, ∀ y : Num, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(nproduct(s, f))"),
      t66,
    ),
  )
}

///|
let nproduct_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLOSED",
)

///|
/// `NPRODUCT_CLOSED`
pub fn nproduct_closed() -> @kernel.Thm {
  nproduct_closed_c.get()
}

///|
/// NPRODUCT_RELATED
fn step_31() -> Unit raise {
  let t71 = @meson.asm_meson_tac(@list.List([]))
  let t70 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.nproduct()), @iterate.neutral_mul()]),
  )
  let t68 = @drule.match_mp(@iterate.iterate_related())(@iterate.monoidal_mul())
  let t69 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Num, Num) -> Bool)"), t68),
  )
  let t67 = @tactics.repeat_tac(@tactics.disch_tac)
  let t72 = @tactics.then_tac(
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
          t67,
        ),
        t69,
      ),
      t70,
    ),
    t71,
  )
  nproduct_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, R(1, 1) && (∀ m : Num, ∀ n : Num, ∀ m' : Num, ∀ n' : Num, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(nproduct(s, f), nproduct(s, g))"),
      t72,
    ),
  )
}

///|
let nproduct_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_RELATED",
)

///|
/// `NPRODUCT_RELATED`
pub fn nproduct_related() -> @kernel.Thm {
  nproduct_related_c.get()
}

///|
/// NPRODUCT_CLOSED_NONEMPTY
fn step_32() -> Unit raise {
  let t81 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_mul(), @equal.gsym(@iterate.nproduct())]),
  )
  let t77 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t80 = @tactics.disch_then(fn(
    x79 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x74 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s75 = @tactics.mp_tac(x74)
      fn(
        x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s75(x76)
      }
    })(((x78 : @kernel.Thm) => @bool.spec(t77, x78))(x79))
  })
  let t73 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed_nonempty())(@iterate.monoidal_mul()),
  )
  let t82 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t73),
      t80,
    ),
    t81,
  )
  nproduct_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Num, ∀ y : Num, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(nproduct(s, f))"),
      t82,
    ),
  )
}

///|
let nproduct_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLOSED_NONEMPTY",
)

///|
/// `NPRODUCT_CLOSED_NONEMPTY`
pub fn nproduct_closed_nonempty() -> @kernel.Thm {
  nproduct_closed_nonempty_c.get()
}

///|
/// NPRODUCT_RELATED_NONEMPTY
fn step_33() -> Unit raise {
  let t87 = @meson.asm_meson_tac(@list.List([]))
  let t86 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.nproduct()), @iterate.neutral_mul()]),
  )
  let t84 = @drule.match_mp(@iterate.iterate_related_nonempty())(
    @iterate.monoidal_mul(),
  )
  let t85 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Num, Num) -> Bool)"), t84),
  )
  let t83 = @tactics.repeat_tac(@tactics.disch_tac)
  let t88 = @tactics.then_tac(
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
          t83,
        ),
        t85,
      ),
      t86,
    ),
    t87,
  )
  nproduct_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, (∀ m : Num, ∀ n : Num, ∀ m' : Num, ∀ n' : Num, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && !(s == {}) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(nproduct(s, f), nproduct(s, g))"),
      t88,
    ),
  )
}

///|
let nproduct_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_RELATED_NONEMPTY",
)

///|
/// `NPRODUCT_RELATED_NONEMPTY`
pub fn nproduct_related_nonempty() -> @kernel.Thm {
  nproduct_related_nonempty_c.get()
}

///|
/// CONG_NPRODUCT
fn step_34() -> Unit raise {
  let t95 = @tactics.conv_tac(@int.number_rule)
  let t94 = @tactics.disch_then(@tactics.match_mp_tac)
  let t93 = @simp.asm_rewrite_tac(@list.List([]))
  let t89 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t90 = @term_syntax.parse_term("(g : (A) -> Num)")
  let t91 = @term_syntax.parse_term("(f : (A) -> Num)")
  let t92 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(x : Num) => (y : Num) => op_eq_eq(x, y, mod((n : Num)))"),
        t91,
        t90,
        t89,
      ]),
      nproduct_related(),
    ),
  )
  let t96 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t92),
        t93,
      ),
      t94,
    ),
    t95,
  )
  cong_nproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → op_eq_eq(f(x), g(x), mod(n))) → op_eq_eq(nproduct(s, f), nproduct(s, g), mod(n))"),
      t96,
    ),
  )
}

///|
let cong_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_NPRODUCT")

///|
/// `CONG_NPRODUCT`
pub fn cong_nproduct() -> @kernel.Thm {
  cong_nproduct_c.get()
}

///|
/// NPRODUCT_CLAUSES_LEFT
fn step_35() -> Unit raise {
  let t97 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @equal.gsym(@iterate.numseg_lrec()),
        @iterate.nproduct_clauses(),
        @iterate.finite_numseg(),
        @iterate.in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  nproduct_clauses_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, m <= n → nproduct(op_dot_dot(m, n), f) == f(m) * nproduct(op_dot_dot(m + 1, n), f)"),
      t97,
    ),
  )
}

///|
let nproduct_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLAUSES_LEFT",
)

///|
/// `NPRODUCT_CLAUSES_LEFT`
pub fn nproduct_clauses_left() -> @kernel.Thm {
  nproduct_clauses_left_c.get()
}

///|
/// NPRODUCT_CLAUSES_RIGHT
fn step_36() -> Unit raise {
  let t98 = @simp.simp_tac(
    @list.List([@arith.lt_refl(), nproduct_clauses_numseg(), @arith.suc_sub1()]),
  )
  let t99 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t98,
  )
  nproduct_clauses_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, 0 < n && m <= n → nproduct(op_dot_dot(m, n), f) == nproduct(op_dot_dot(m, n - 1), f) * f(n)"),
      t99,
    ),
  )
}

///|
let nproduct_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_CLAUSES_RIGHT",
)

///|
/// `NPRODUCT_CLAUSES_RIGHT`
pub fn nproduct_clauses_right() -> @kernel.Thm {
  nproduct_clauses_right_c.get()
}

///|
/// NPRODUCT_SUPERSET
fn step_37() -> Unit raise {
  let t100 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct(),
      @equal.gsym(@iterate.neutral_mul()),
      @iterate.iterate_superset(),
      @iterate.monoidal_mul(),
    ]),
  )
  nproduct_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == 1) → nproduct(v, f) == nproduct(u, f)"),
      t100,
    ),
  )
}

///|
let nproduct_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_SUPERSET",
)

///|
/// `NPRODUCT_SUPERSET`
pub fn nproduct_superset() -> @kernel.Thm {
  nproduct_superset_c.get()
}

///|
/// NPRODUCT_UNIV
fn step_38() -> Unit raise {
  let t102 = @simp.rewrite_tac(@list.List([@iterate.monoidal_mul()]))
  let t101 = @tactics.match_mp_tac(@iterate.iterate_univ())
  let t103 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.nproduct()])),
      t101,
    ),
    t102,
  )
  nproduct_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, SUBSET(support(op_star, f, UNIV), s) → nproduct(s, f) == nproduct(UNIV, f)"),
      t103,
    ),
  )
}

///|
let nproduct_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_UNIV")

///|
/// `NPRODUCT_UNIV`
pub fn nproduct_univ() -> @kernel.Thm {
  nproduct_univ_c.get()
}

///|
/// NPRODUCT_PAIR
fn step_39() -> Unit raise {
  let t104 = @simp.rewrite_tac(
    @list.List([@iterate.nproduct(), @iterate.neutral_mul()]),
  )
  let t105 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(@iterate.iterate_pair())(@iterate.monoidal_mul()),
    ),
    t104,
  )
  nproduct_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ m : Num, ∀ n : Num, nproduct(op_dot_dot(2 * m, 2 * n + 1), f) == nproduct(op_dot_dot(m, n), (i : Num) => f(2 * i) * f(2 * i + 1))"),
      t105,
    ),
  )
}

///|
let nproduct_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_PAIR")

///|
/// `NPRODUCT_PAIR`
pub fn nproduct_pair() -> @kernel.Thm {
  nproduct_pair_c.get()
}

///|
/// NPRODUCT_REFLECT
fn step_40() -> Unit raise {
  let t111 = @simp.rewrite_tac(@list.List([@iterate.neutral_mul()]))
  let t110 = @simp.gen_rewrite_tac(
    fn(
      x107 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s108 = @equal.land_conv(x107)
      fn(x109 : @kernel.Term) -> @kernel.Thm raise { s108(x109) }
    },
    @list.List([
      @drule.match_mp(@iterate.iterate_reflect())(@iterate.monoidal_mul()),
    ]),
  )
  let t106 = @simp.rewrite_tac(@list.List([@iterate.nproduct()]))
  let t112 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t106),
      t110,
    ),
    t111,
  )
  nproduct_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Num, ∀ m : Num, ∀ n : Num, nproduct(op_dot_dot(m, n), x) == (if n < m { 1 } else { nproduct(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"),
      t112,
    ),
  )
}

///|
let nproduct_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_REFLECT",
)

///|
/// `NPRODUCT_REFLECT`
pub fn nproduct_reflect() -> @kernel.Thm {
  nproduct_reflect_c.get()
}

///|
/// NPRODUCT_DELETE
fn step_41() -> Unit raise {
  let t113 = @simp.simp_tac(
    @list.List([
      @iterate.nproduct(),
      @iterate.iterate_delete(),
      @iterate.monoidal_mul(),
    ]),
  )
  nproduct_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ s : (_) -> Bool, ∀ a : _, FINITE(s) && IN(a, s) → f(a) * nproduct(DELETE(s, a), f) == nproduct(s, f)"),
      t113,
    ),
  )
}

///|
let nproduct_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NPRODUCT_DELETE",
)

///|
/// `NPRODUCT_DELETE`
pub fn nproduct_delete() -> @kernel.Thm {
  nproduct_delete_c.get()
}

///|
/// NPRODUCT_FACT
fn step_42() -> Unit raise {
  let t114 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      @arith.mult_sym(),
    ]),
  )
  let t115 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.rewrite_tac(
        @list.List([nproduct_clauses_numseg(), @arith.fact(), @calc_num.arith()]),
      ),
    ),
    t114,
  )
  nproduct_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, nproduct(op_dot_dot(1, n), (m : Num) => m) == FACT(n)"),
      t115,
    ),
  )
}

///|
let nproduct_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_FACT")

///|
/// `NPRODUCT_FACT`
pub fn nproduct_fact() -> @kernel.Thm {
  nproduct_fact_c.get()
}

///|
/// NPRODUCT_DELTA
fn step_43() -> Unit raise {
  let t116 = @simp.simp_tac(
    @list.List([@iterate.iterate_delta(), @iterate.monoidal_mul()]),
  )
  let t117 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.nproduct(), @equal.gsym(@iterate.neutral_mul())]),
    ),
    t116,
  )
  nproduct_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ a : _, nproduct(s, (x : _) => if x == a { (b : Num) } else { 1 }) == (if IN(a, s) { b } else { 1 })"),
      t117,
    ),
  )
}

///|
let nproduct_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_DELTA")

///|
/// `NPRODUCT_DELTA`
pub fn nproduct_delta() -> @kernel.Thm {
  nproduct_delta_c.get()
}

///|
/// EXP_NSUM
fn step_44() -> Unit raise {
  let t119 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @iterate.nproduct_clauses(),
      @arith.exp(),
      @arith.exp_add(),
    ]),
  )
  let t118 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t120 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t118,
    ),
    t119,
  )
  exp_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → EXP(m, nsum(s, n)) == nproduct(s, (i : A) => EXP(m, n(i)))"),
      t120,
    ),
  )
}

///|
let exp_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_NSUM")

///|
/// `EXP_NSUM`
pub fn exp_nsum() -> @kernel.Thm {
  exp_nsum_c.get()
}

///|
/// HAS_SIZE_CART
fn step_45() -> Unit raise {
  let t185 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t184 = @tactics.match_mp_tac(@sets.has_size_product())
  let t183 = @simp.gen_rewrite_tac(
    fn(
      x180 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s181 = @equal.rand_conv(x180)
      fn(x182 : @kernel.Term) -> @kernel.Thm raise { s181(x182) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t186 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]),
            ),
            t183,
          ),
          t184,
        ),
        @tactics.conj_tac,
      ),
      t185,
    ),
    @int.asm_arith_tac,
  )
  let t177 = @meson.asm_meson_tac(@list.List([]))
  let t176 = @tactics.try_tac(@int.asm_arith_tac)
  let t175 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t174 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < (i : Num)"))
  let t173 = @simp.asm_rewrite_tac(@list.List([]))
  let t169 = @term_syntax.parse_term("(i : Num)")
  let t172 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
      (fn(
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
        let s167 = @tactics.mp_tac(x166)
        fn(
          x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s167(x168)
        }
      })(((x170 : @kernel.Thm) => @bool.spec(t169, x170))(x171))
    }),
  )
  let t178 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")),
                @tactics.strip_tac,
              ),
              t172,
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
  )
  let t165 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]),
  )
  let t162 = @term_syntax.parse_term("SUC((n : Num))")
  let t179 = @list.List([
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.first_x_assum(fn(
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
            let s160 = @tactics.mp_tac(x159)
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
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          })(((x163 : @kernel.Thm) => @bool.spec(t162, x163))(x164))
        }),
      ),
      t165,
    ),
    t178,
  ])
  let t158 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[A, N])"))
  let t157 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : A)"))
  let t156 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[A, N])"))
  let t155 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t154 = @simp.simp_tac(@list.List([@cart.lambda_beta()]))
  let t153 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @pair.pair_eq(), @cart.cart_eq()]),
  )
  let t187 = @list.List([
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
                            @simp.rewrite_tac(
                              @list.List([
                                @theorems.imp_conj(),
                                @theorems.right_forall_imp_thm(),
                                @sets.forall_in_gspec(),
                              ]),
                            ),
                            t153,
                          ),
                          t154,
                        ),
                        t155,
                      ),
                      @tactics.disch_tac,
                    ),
                    t156,
                  ),
                  @tactics.strip_tac,
                ),
                t157,
              ),
              @tactics.disch_tac,
            ),
            t158,
          ),
          @tactics.strip_tac,
        ),
        @tactics.conj_tac,
      ),
      t179,
    ),
    t186,
  ])
  let t188 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(@sets.has_size_image_inj()),
      @tactics.conj_tac,
    ),
    t187,
  )
  let t149 = @int.arith_rule(
    @term_syntax.parse_term("(n : Num) < (i : Num) && !(i == SUC(n)) → SUC(n) < i"),
  )
  let t150 = @meson.asm_meson_tac(
    @list.List([
      @arith.le(),
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      t149,
    ]),
  )
  let t148 = @simp.simp_tac(
    @list.List([
      @cart.cart_eq(),
      @cart.lambda_beta(),
      @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (n : Num) → !(i == SUC(n))")),
    ]),
  )
  let t147 = @tactics.exists_tac(
    @term_syntax.parse_term("(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { (select : ((A) -> Bool) -> A)((x : A) => false) } else { (op_dollar : (Cart[A, N], Num) -> A)((v : Cart[A, N]), i) })"),
  )
  let t146 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((v : Cart[A, N]), SUC((n : Num)))"))
  let t145 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t144 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[A, N])"))
  let t151 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @sets.subset(),
                    @sets.in_image(),
                    @sets.in_elim_pair_thm(),
                    @pair.exists_pair_thm(),
                  ]),
                ),
                t144,
              ),
              t145,
            ),
            @tactics.strip_tac,
          ),
          t146,
        ),
        t147,
      ),
      t148,
    ),
    t150,
  )
  let t143 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t142 = @tactics.try_tac(@int.asm_arith_tac)
  let t141 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t140 = @tactics.repeat_tac(@tactics.strip_tac)
  let t139 = @tactics.repeat_tac(@tactics.gen_tac)
  let t138 = @simp.simp_tac(
    @list.List([@sets.in_elim_thm(), @cart.lambda_beta()]),
  )
  let t152 = @list.List([
    @tactics.then_tac(
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
                            @sets.subset(),
                            @sets.forall_in_image(),
                            @sets.forall_in_gspec(),
                          ]),
                        ),
                        t138,
                      ),
                      t139,
                    ),
                    @tactics.strip_tac,
                  ),
                  @tactics.conj_tac,
                ),
                t140,
              ),
              @class.cond_cases_tac,
            ),
            t141,
          ),
          t142,
        ),
        t143,
      ),
      @int.asm_arith_tac,
    ),
    t151,
  ])
  let t189 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])),
        @tactics.conj_tac,
      ),
      t152,
    ),
    t188,
  ])
  let t137 = @tactics.exists_tac(
    @term_syntax.parse_term("(IMAGE : (((A, Cart[A, N])) -> Cart[A, N], ((A, Cart[A, N])) -> Bool, Cart[A, N]) -> Bool)(fn { ((x : A), (v : Cart[A, N])) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { x } else { (op_dollar : (Cart[A, N], Num) -> A)(v, i) }) }, {((x : A), (v : Cart[A, N])) | (IN : (A, (A) -> Bool) -> Bool)(x, {(x : A) | (P : (Num, A) -> Bool)(SUC(n), x)}) && (IN : (Cart[A, N], (Cart[A, N]) -> Bool) -> Bool)(v, {(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})})"),
  )
  let t136 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ t : (_) -> Bool, t == (s : (_) -> Bool) && HAS_SIZE(t, (n : Num)) → HAS_SIZE(s, n)"),
    ),
  )
  let t134 = @simp.simp_tac(
    @list.List([
      @sets.extension(),
      @sets.in_sing(),
      @sets.in_elim_thm(),
      @cart.cart_eq(),
      @cart.lambda_beta(),
    ]),
  )
  let t133 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false)} == {(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (select : ((A) -> Bool) -> A)((x : A) => false))}"),
    fn(
      x131 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x131
      @simp.simp_tac(
        @list.List([
          th,
          @sets.has_size(),
          @sets.finite_sing(),
          @sets.card_sing(),
        ]),
      )
    },
  )
  let t130 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(1 <= (i : Num) && i <= (n : Num) && 0 < i) == (1 <= i && i <= n)"),
      ),
    ]),
  )
  let t135 = @list.List([
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
          t130,
        ),
        t133,
      ),
      t134,
    ),
    @tactics.disch_tac,
  ])
  let t129 = @simp.rewrite_tac(
    @list.List([nproduct_clauses_numseg(), @calc_num.arith_eq()]),
  )
  let t128 = @simp.rewrite_tac(
    @list.List([@arith.le_refl(), @arith.let_antisym()]),
  )
  let t124 = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let t127 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, n <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (HAS_SIZE : ((Cart[A, N]) -> Bool, Num) -> Bool)({(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → (P : (Num, A) -> Bool)(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))}, (nproduct : ((Num) -> Bool, (Num) -> Num) -> Num)(op_dot_dot(1, n), (m : (Num) -> Num)))"),
    fn(
      x126 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x121 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s122 = @tactics.mp_tac(x121)
        fn(
          x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s122(x123)
        }
      })(((x125 : @kernel.Thm) => @bool.spec(t124, x125))(x126))
    },
  )
  let t190 = @tactics.thenl(
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
                      @tactics.disch_tac,
                    ),
                    t127,
                  ),
                  t128,
                ),
                @nums.induct_tac,
              ),
              t129,
            ),
            t135,
          ),
          t136,
        ),
        t137,
      ),
      @tactics.conj_tac,
    ),
    t189,
  )
  has_size_cart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ m : (Num) -> Num, (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (HAS_SIZE : ((A) -> Bool, Num) -> Bool)({(x : A) | P(i, x)}, m(i))) → (HAS_SIZE : ((Cart[A, N]) -> Bool, Num) -> Bool)({(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))}, (nproduct : ((Num) -> Bool, (Num) -> Num) -> Num)(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), m))"),
      t190,
    ),
  )
}

///|
let has_size_cart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_CART")

///|
/// `HAS_SIZE_CART`
pub fn has_size_cart() -> @kernel.Thm {
  has_size_cart_c.get()
}

///|
/// CARD_CART
fn step_46() -> Unit raise {
  let t193 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@sets.finite_has_size())]),
  )
  let t192 = @tactics.match_mp_tac(has_size_cart())
  let t191 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@sets.has_size()]),
      @term_syntax.parse_term("HAS_SIZE((s : (_) -> Bool), (n : Num)) → CARD(s) == n"),
    ),
  )
  let t194 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t191),
      t192,
    ),
    t193,
  )
  card_cart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (FINITE : ((A) -> Bool) -> Bool)({(x : A) | P(i, x)})) → (CARD : ((Cart[A, N]) -> Bool) -> Num)({(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))}) == (nproduct : ((Num) -> Bool, (Num) -> Num) -> Num)(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (i : Num) => (CARD : ((A) -> Bool) -> Num)({(x : A) | P(i, x)}))"),
      t194,
    ),
  )
}

///|
let card_cart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_CART")

///|
/// `CARD_CART`
pub fn card_cart() -> @kernel.Thm {
  card_cart_c.get()
}

///|
/// Library/products.ml:342
fn step_47() -> Unit raise {
  let t196 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t195 = @tactics.match_mp_tac(nproduct_eq())
  let t197 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t195),
    t196,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → nproduct(s, (i : _) => f(i)) == nproduct(s, g)) && (∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → nproduct(op_dot_dot(a, b), (i : Num) => f(i)) == nproduct(op_dot_dot(a, b), g)) && (∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → nproduct({(y : _) | p(y)}, (i : _) => f(i)) == nproduct({(y : _) | p(y)}, g))"),
    t197,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
}

///|
/// IPRODUCT_SUPPORT
fn step_48() -> Unit raise {
  let t198 = @simp.rewrite_tac(
    @list.List([@iterate.iproduct(), @iterate.iterate_support()]),
  )
  iproduct_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, iproduct(support(op_star, f, s), f) == iproduct(s, f)"),
      t198,
    ),
  )
}

///|
let iproduct_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_SUPPORT",
)

///|
/// `IPRODUCT_SUPPORT`
pub fn iproduct_support() -> @kernel.Thm {
  iproduct_support_c.get()
}

///|
/// IPRODUCT_UNION
fn step_49() -> Unit raise {
  let t199 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct(),
      @iterate.iterate_union(),
      @iterate.monoidal_int_mul(),
    ]),
  )
  iproduct_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → iproduct(UNION(s, t), f) == iproduct(s, f) * iproduct(t, f)"),
      t199,
    ),
  )
}

///|
let iproduct_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_UNION")

///|
/// `IPRODUCT_UNION`
pub fn iproduct_union() -> @kernel.Thm {
  iproduct_union_c.get()
}

///|
/// IPRODUCT_IMAGE
fn step_50() -> Unit raise {
  let t201 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_mul()]))
  let t200 = @tactics.match_mp_tac(@iterate.iterate_image())
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @iterate.iproduct(),
          @equal.gsym(@iterate.neutral_int_mul()),
        ]),
      ),
      t200,
    ),
    t201,
  )
  iproduct_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → iproduct(IMAGE(f, s), g) == iproduct(s, o(g, f))"),
      t202,
    ),
  )
}

///|
let iproduct_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_IMAGE")

///|
/// `IPRODUCT_IMAGE`
pub fn iproduct_image() -> @kernel.Thm {
  iproduct_image_c.get()
}

///|
/// IPRODUCT_INJECTION
fn step_51() -> Unit raise {
  let t204 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_mul()]))
  let t203 = @tactics.match_mp_tac(@iterate.iterate_injection())
  let t205 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.iproduct()])),
      t203,
    ),
    t204,
  )
  iproduct_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ p : (_) -> _, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → IN(p(x), s)) && (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → iproduct(s, o(f, p)) == iproduct(s, f)"),
      t205,
    ),
  )
}

///|
let iproduct_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_INJECTION",
)

///|
/// `IPRODUCT_INJECTION`
pub fn iproduct_injection() -> @kernel.Thm {
  iproduct_injection_c.get()
}

///|
/// IPRODUCT_ADD_SPLIT
fn step_52() -> Unit raise {
  let t206 = @simp.simp_tac(
    @list.List([
      @iterate.numseg_add_split(),
      iproduct_union(),
      @iterate.disjoint_numseg(),
      @iterate.finite_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < x + 1")),
    ]),
  )
  iproduct_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → iproduct(op_dot_dot(m, n + p), f) == iproduct(op_dot_dot(m, n), f) * iproduct(op_dot_dot(n + 1, n + p), f)"),
      t206,
    ),
  )
}

///|
let iproduct_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_ADD_SPLIT",
)

///|
/// `IPRODUCT_ADD_SPLIT`
pub fn iproduct_add_split() -> @kernel.Thm {
  iproduct_add_split_c.get()
}

///|
/// IPRODUCT_POS_LE
fn step_53() -> Unit raise {
  let t208 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_pos(),
      @sets.in_insert(),
      @int.int_le_mul(),
    ]),
  )
  let t207 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t209 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
      ),
      t207,
    ),
    t208,
  )
  iproduct_pos_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → int_of_num(0) <= f(x)) → int_of_num(0) <= iproduct(s, f)"),
      t209,
    ),
  )
}

///|
let iproduct_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_POS_LE",
)

///|
/// `IPRODUCT_POS_LE`
pub fn iproduct_pos_le() -> @kernel.Thm {
  iproduct_pos_le_c.get()
}

///|
/// IPRODUCT_POS_LE_NUMSEG
fn step_54() -> Unit raise {
  let t210 = @simp.simp_tac(
    @list.List([
      iproduct_pos_le(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  iproduct_pos_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → int_of_num(0) <= f(x)) → int_of_num(0) <= iproduct(op_dot_dot(m, n), f)"),
      t210,
    ),
  )
}

///|
let iproduct_pos_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_POS_LE_NUMSEG",
)

///|
/// `IPRODUCT_POS_LE_NUMSEG`
pub fn iproduct_pos_le_numseg() -> @kernel.Thm {
  iproduct_pos_le_numseg_c.get()
}

///|
/// IPRODUCT_POS_LT
fn step_55() -> Unit raise {
  let t212 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_lt_01(),
      @sets.in_insert(),
      @int.int_lt_mul(),
    ]),
  )
  let t211 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t213 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
      ),
      t211,
    ),
    t212,
  )
  iproduct_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → int_of_num(0) < f(x)) → int_of_num(0) < iproduct(s, f)"),
      t213,
    ),
  )
}

///|
let iproduct_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_POS_LT",
)

///|
/// `IPRODUCT_POS_LT`
pub fn iproduct_pos_lt() -> @kernel.Thm {
  iproduct_pos_lt_c.get()
}

///|
/// IPRODUCT_POS_LT_NUMSEG
fn step_56() -> Unit raise {
  let t214 = @simp.simp_tac(
    @list.List([
      iproduct_pos_lt(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  iproduct_pos_lt_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → int_of_num(0) < f(x)) → int_of_num(0) < iproduct(op_dot_dot(m, n), f)"),
      t214,
    ),
  )
}

///|
let iproduct_pos_lt_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_POS_LT_NUMSEG",
)

///|
/// `IPRODUCT_POS_LT_NUMSEG`
pub fn iproduct_pos_lt_numseg() -> @kernel.Thm {
  iproduct_pos_lt_numseg_c.get()
}

///|
/// IPRODUCT_OFFSET
fn step_57() -> Unit raise {
  let t215 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t216 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @iterate.numseg_offset_image(),
        iproduct_image(),
        @arith.eq_add_rcancel(),
        @iterate.finite_numseg(),
      ]),
    ),
    t215,
  )
  iproduct_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ p : Num, iproduct(op_dot_dot(m + p, (n : Num) + p), f) == iproduct(op_dot_dot(m, n), (i : Num) => f(i + p))"),
      t216,
    ),
  )
}

///|
let iproduct_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_OFFSET",
)

///|
/// `IPRODUCT_OFFSET`
pub fn iproduct_offset() -> @kernel.Thm {
  iproduct_offset_c.get()
}

///|
/// IPRODUCT_SING
fn step_58() -> Unit raise {
  let t217 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @sets.finite_rules(),
      @sets.not_in_empty(),
      @int.int_mul_rid(),
    ]),
  )
  iproduct_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Int, ∀ x : _, iproduct({x}, f) == f(x)"), t217),
  )
}

///|
let iproduct_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_SING")

///|
/// `IPRODUCT_SING`
pub fn iproduct_sing() -> @kernel.Thm {
  iproduct_sing_c.get()
}

///|
/// IPRODUCT_SING_NUMSEG
fn step_59() -> Unit raise {
  let t218 = @simp.rewrite_tac(
    @list.List([@iterate.numseg_sing(), iproduct_sing()]),
  )
  iproduct_sing_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Int, ∀ n : Num, iproduct(op_dot_dot(n, n), f) == f(n)"), t218),
  )
}

///|
let iproduct_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_SING_NUMSEG",
)

///|
/// `IPRODUCT_SING_NUMSEG`
pub fn iproduct_sing_numseg() -> @kernel.Thm {
  iproduct_sing_numseg_c.get()
}

///|
/// IPRODUCT_CLAUSES_NUMSEG
fn step_60() -> Unit raise {
  let t221 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
      @int.int_mul_ac(),
    ]),
  )
  let t220 = @simp.asm_simp_tac(
    @list.List([
      iproduct_sing(),
      @iterate.iproduct_clauses(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  let t219 = @tactics.repeat_tac(@tactics.strip_tac)
  let t222 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])),
          t219,
        ),
        @class.cond_cases_tac,
      ),
      t220,
    ),
    t221,
  )
  iproduct_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, iproduct(op_dot_dot(m, 0), (f : (Num) -> Int)) == (if m == 0 { f(0) } else { int_of_num(1) })) && (∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { iproduct(op_dot_dot(m, n), f) * f(SUC(n)) } else { iproduct(op_dot_dot(m, n), f) }))"),
      t222,
    ),
  )
}

///|
let iproduct_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLAUSES_NUMSEG",
)

///|
/// `IPRODUCT_CLAUSES_NUMSEG`
pub fn iproduct_clauses_numseg() -> @kernel.Thm {
  iproduct_clauses_numseg_c.get()
}

///|
/// IPRODUCT_EQ
fn step_61() -> Unit raise {
  let t224 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_mul()]))
  let t223 = @tactics.match_mp_tac(@iterate.iterate_eq())
  let t225 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.iproduct()])),
      t223,
    ),
    t224,
  )
  iproduct_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → iproduct(s, f) == iproduct(s, g)"),
      t225,
    ),
  )
}

///|
let iproduct_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_EQ")

///|
/// `IPRODUCT_EQ`
pub fn iproduct_eq() -> @kernel.Thm {
  iproduct_eq_c.get()
}

///|
/// IPRODUCT_EQ_NUMSEG
fn step_62() -> Unit raise {
  let t226 = @meson.meson_tac(
    @list.List([iproduct_eq(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  iproduct_eq_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ g : (Num) -> Int, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → iproduct(op_dot_dot(m, n), f) == iproduct(op_dot_dot(m, n), g)"),
      t226,
    ),
  )
}

///|
let iproduct_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_EQ_NUMSEG",
)

///|
/// `IPRODUCT_EQ_NUMSEG`
pub fn iproduct_eq_numseg() -> @kernel.Thm {
  iproduct_eq_numseg_c.get()
}

///|
/// IPRODUCT_EQ_0
fn step_63() -> Unit raise {
  let t228 = @meson.meson_tac(@list.List([]))
  let t227 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_entire(),
      @sets.in_insert(),
      @int.int_of_num_eq(),
      @calc_num.arith(),
      @sets.not_in_empty(),
    ]),
  )
  let t229 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t227,
    ),
    t228,
  )
  iproduct_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) → (iproduct(s, f) == int_of_num(0)) == (∃ x : _, IN(x, s) && f(x) == int_of_num(0))"),
      t229,
    ),
  )
}

///|
let iproduct_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_EQ_0")

///|
/// `IPRODUCT_EQ_0`
pub fn iproduct_eq_0() -> @kernel.Thm {
  iproduct_eq_0_c.get()
}

///|
/// IPRODUCT_EQ_0_NUMSEG
fn step_64() -> Unit raise {
  let t230 = @simp.simp_tac(
    @list.List([
      iproduct_eq_0(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  iproduct_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, (iproduct(op_dot_dot(m, n), f) == int_of_num(0)) == (∃ x : Num, m <= x && x <= n && f(x) == int_of_num(0))"),
      t230,
    ),
  )
}

///|
let iproduct_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_EQ_0_NUMSEG",
)

///|
/// `IPRODUCT_EQ_0_NUMSEG`
pub fn iproduct_eq_0_numseg() -> @kernel.Thm {
  iproduct_eq_0_numseg_c.get()
}

///|
/// IPRODUCT_RESTRICT
fn step_65() -> Unit raise {
  let t232 = @simp.asm_simp_tac(@list.List([]))
  let t231 = @tactics.match_mp_tac(iproduct_eq())
  let t233 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t231),
    t232,
  )
  iproduct_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) → iproduct(s, (i : _) => if IN(i, s) { f(i) } else { int_of_num(1) }) == iproduct(s, f)"),
      t233,
    ),
  )
}

///|
let iproduct_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_RESTRICT",
)

///|
/// `IPRODUCT_RESTRICT`
pub fn iproduct_restrict() -> @kernel.Thm {
  iproduct_restrict_c.get()
}

///|
/// IPRODUCT_RESTRICT_SET
fn step_66() -> Unit raise {
  let t235 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_mul()]))
  let t234 = @tactics.match_mp_tac(@iterate.iterate_restrict_set())
  let t236 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @iterate.iproduct(),
          @equal.gsym(@iterate.neutral_int_mul()),
        ]),
      ),
      t234,
    ),
    t235,
  )
  iproduct_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Int, iproduct({(i : A) | IN(i, s) && P(i)}, f) == iproduct(s, (i : A) => if P(i) { f(i) } else { int_of_num(1) })"),
      t236,
    ),
  )
}

///|
let iproduct_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_RESTRICT_SET",
)

///|
/// `IPRODUCT_RESTRICT_SET`
pub fn iproduct_restrict_set() -> @kernel.Thm {
  iproduct_restrict_set_c.get()
}

///|
/// IPRODUCT_LE
fn step_67() -> Unit raise {
  let t239 = @meson.meson_tac(
    @list.List([@int.int_le_mul2(), iproduct_pos_le()]),
  )
  let t238 = @simp.simp_tac(
    @list.List([
      @sets.in_insert(),
      @iterate.iproduct_clauses(),
      @sets.not_in_empty(),
      @int.int_le_refl(),
    ]),
  )
  let t237 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t240 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
        ),
        t237,
      ),
      t238,
    ),
    t239,
  )
  iproduct_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → int_of_num(0) <= f(x) && f(x) <= (g : (_) -> Int)(x)) → iproduct(s, f) <= iproduct(s, g)"),
      t240,
    ),
  )
}

///|
let iproduct_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_LE")

///|
/// `IPRODUCT_LE`
pub fn iproduct_le() -> @kernel.Thm {
  iproduct_le_c.get()
}

///|
/// IPRODUCT_LE_NUMSEG
fn step_68() -> Unit raise {
  let t241 = @simp.simp_tac(
    @list.List([iproduct_le(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  iproduct_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → int_of_num(0) <= f(i) && f(i) <= (g : (Num) -> Int)(i)) → iproduct(op_dot_dot(m, n), f) <= iproduct(op_dot_dot(m, n), g)"),
      t241,
    ),
  )
}

///|
let iproduct_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_LE_NUMSEG",
)

///|
/// `IPRODUCT_LE_NUMSEG`
pub fn iproduct_le_numseg() -> @kernel.Thm {
  iproduct_le_numseg_c.get()
}

///|
/// IPRODUCT_EQ_1
fn step_69() -> Unit raise {
  let t242 = @simp.simp_tac(
    @list.List([@iterate.iterate_eq_neutral(), @iterate.monoidal_int_mul()]),
  )
  let t243 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.iproduct(), @equal.gsym(@iterate.neutral_int_mul())]),
    ),
    t242,
  )
  iproduct_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == int_of_num(1)) → iproduct(s, f) == int_of_num(1)"),
      t243,
    ),
  )
}

///|
let iproduct_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_EQ_1")

///|
/// `IPRODUCT_EQ_1`
pub fn iproduct_eq_1() -> @kernel.Thm {
  iproduct_eq_1_c.get()
}

///|
/// IPRODUCT_EQ_1_NUMSEG
fn step_70() -> Unit raise {
  let t244 = @simp.simp_tac(@list.List([iproduct_eq_1(), @iterate.in_numseg()]))
  iproduct_eq_1_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == int_of_num(1)) → iproduct(op_dot_dot(m, n), f) == int_of_num(1)"),
      t244,
    ),
  )
}

///|
let iproduct_eq_1_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_EQ_1_NUMSEG",
)

///|
/// `IPRODUCT_EQ_1_NUMSEG`
pub fn iproduct_eq_1_numseg() -> @kernel.Thm {
  iproduct_eq_1_numseg_c.get()
}

///|
/// IPRODUCT_MUL_GEN
fn step_71() -> Unit raise {
  let t247 = @tactics.accept_tac(@iterate.monoidal_int_mul())
  let t246 = @tactics.match_mp_tac(@iterate.iterate_op_gen())
  let t245 = @equal.gsym(@iterate.support())
  let t248 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@iterate.neutral_int_mul()),
          t245,
          @iterate.iproduct(),
        ]),
      ),
      t246,
    ),
    t247,
  )
  iproduct_mul_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, FINITE({(x : _) | IN(x, s) && !(f(x) == int_of_num(1))}) && FINITE({(x : _) | IN(x, s) && !(g(x) == int_of_num(1))}) → iproduct(s, (x : _) => f(x) * g(x)) == iproduct(s, f) * iproduct(s, g)"),
      t248,
    ),
  )
}

///|
let iproduct_mul_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_MUL_GEN",
)

///|
/// `IPRODUCT_MUL_GEN`
pub fn iproduct_mul_gen() -> @kernel.Thm {
  iproduct_mul_gen_c.get()
}

///|
/// IPRODUCT_MUL
fn step_72() -> Unit raise {
  let t250 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_mul_ac(),
      @int.int_mul_lid(),
    ]),
  )
  let t249 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t251 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t249,
    ),
    t250,
  )
  iproduct_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) → iproduct(s, (x : _) => f(x) * g(x)) == iproduct(s, f) * iproduct(s, g)"),
      t251,
    ),
  )
}

///|
let iproduct_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_MUL")

///|
/// `IPRODUCT_MUL`
pub fn iproduct_mul() -> @kernel.Thm {
  iproduct_mul_c.get()
}

///|
/// IPRODUCT_MUL_NUMSEG
fn step_73() -> Unit raise {
  let t252 = @simp.simp_tac(
    @list.List([iproduct_mul(), @iterate.finite_numseg()]),
  )
  iproduct_mul_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ g : (Num) -> Int, ∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(m, n), (x : Num) => f(x) * g(x)) == iproduct(op_dot_dot(m, n), f) * iproduct(op_dot_dot(m, n), g)"),
      t252,
    ),
  )
}

///|
let iproduct_mul_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_MUL_NUMSEG",
)

///|
/// `IPRODUCT_MUL_NUMSEG`
pub fn iproduct_mul_numseg() -> @kernel.Thm {
  iproduct_mul_numseg_c.get()
}

///|
/// IPRODUCT_CONST
fn step_74() -> Unit raise {
  let t253 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @sets.card_clauses(),
      @int.int_pow_v1(),
    ]),
  )
  let t254 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t253,
  )
  iproduct_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Int, ∀ s : (_) -> Bool, FINITE(s) → iproduct(s, (x : _) => c) == pow(c, CARD(s))"),
      t254,
    ),
  )
}

///|
let iproduct_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_CONST")

///|
/// `IPRODUCT_CONST`
pub fn iproduct_const() -> @kernel.Thm {
  iproduct_const_c.get()
}

///|
/// IPRODUCT_CONST_NUMSEG
fn step_75() -> Unit raise {
  let t255 = @simp.simp_tac(
    @list.List([
      iproduct_const(),
      @iterate.card_numseg(),
      @iterate.finite_numseg(),
    ]),
  )
  iproduct_const_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Int, ∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(m, n), (x : Num) => c) == pow(c, n + 1 - m)"),
      t255,
    ),
  )
}

///|
let iproduct_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CONST_NUMSEG",
)

///|
/// `IPRODUCT_CONST_NUMSEG`
pub fn iproduct_const_numseg() -> @kernel.Thm {
  iproduct_const_numseg_c.get()
}

///|
/// IPRODUCT_CONST_NUMSEG_1
fn step_76() -> Unit raise {
  let t256 = @simp.simp_tac(
    @list.List([
      iproduct_const(),
      @iterate.card_numseg_1(),
      @iterate.finite_numseg(),
    ]),
  )
  iproduct_const_numseg_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Int, ∀ n : Num, iproduct(op_dot_dot(1, n), (x : Num) => c) == pow(c, n)"),
      t256,
    ),
  )
}

///|
let iproduct_const_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CONST_NUMSEG_1",
)

///|
/// `IPRODUCT_CONST_NUMSEG_1`
pub fn iproduct_const_numseg_1() -> @kernel.Thm {
  iproduct_const_numseg_1_c.get()
}

///|
/// IPRODUCT_NEG
fn step_77() -> Unit raise {
  let t258 = @simp.rewrite_tac(
    @list.List([@int.int_mul_lneg(), @int.int_mul_lid()]),
  )
  let t257 = @equal.gsym(iproduct_mul())
  let t259 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@equal.gsym(iproduct_const()), t257])),
    t258,
  )
  iproduct_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ s : (A) -> Bool, FINITE(s) → iproduct(s, (i : A) => -f(i)) == pow(-int_of_num(1), CARD(s)) * iproduct(s, f)"),
      t259,
    ),
  )
}

///|
let iproduct_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_NEG")

///|
/// `IPRODUCT_NEG`
pub fn iproduct_neg() -> @kernel.Thm {
  iproduct_neg_c.get()
}

///|
/// IPRODUCT_NEG_NUMSEG
fn step_78() -> Unit raise {
  let t260 = @simp.simp_tac(
    @list.List([
      iproduct_neg(),
      @iterate.card_numseg(),
      @iterate.finite_numseg(),
    ]),
  )
  iproduct_neg_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(m, n), (i : Num) => -f(i)) == pow(-int_of_num(1), n + 1 - m) * iproduct(op_dot_dot(m, n), f)"),
      t260,
    ),
  )
}

///|
let iproduct_neg_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_NEG_NUMSEG",
)

///|
/// `IPRODUCT_NEG_NUMSEG`
pub fn iproduct_neg_numseg() -> @kernel.Thm {
  iproduct_neg_numseg_c.get()
}

///|
/// IPRODUCT_NEG_NUMSEG_1
fn step_79() -> Unit raise {
  let t261 = @simp.rewrite_tac(
    @list.List([iproduct_neg_numseg(), @arith.add_sub()]),
  )
  iproduct_neg_numseg_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ n : Num, iproduct(op_dot_dot(1, n), (i : Num) => -f(i)) == pow(-int_of_num(1), n) * iproduct(op_dot_dot(1, n), f)"),
      t261,
    ),
  )
}

///|
let iproduct_neg_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_NEG_NUMSEG_1",
)

///|
/// `IPRODUCT_NEG_NUMSEG_1`
pub fn iproduct_neg_numseg_1() -> @kernel.Thm {
  iproduct_neg_numseg_1_c.get()
}

///|
/// IPRODUCT_ONE
fn step_80() -> Unit raise {
  let t262 = @simp.simp_tac(@list.List([iproduct_eq_1()]))
  iproduct_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, iproduct(s, (n : _) => int_of_num(1)) == int_of_num(1)"), t262),
  )
}

///|
let iproduct_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_ONE")

///|
/// `IPRODUCT_ONE`
pub fn iproduct_one() -> @kernel.Thm {
  iproduct_one_c.get()
}

///|
/// IPRODUCT_LE_1
fn step_81() -> Unit raise {
  let t271 = @simp.asm_simp_tac(@list.List([iproduct_pos_le()]))
  let t270 = @tactics.match_mp_tac(@int.int_le_mul2())
  let t269 = @simp.gen_rewrite_tac(
    fn(
      x266 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s267 = @equal.rand_conv(x266)
      fn(x268 : @kernel.Term) -> @kernel.Thm raise { s267(x268) }
    },
    @list.List([@equal.gsym(@int.int_mul_lid())]),
  )
  let t265 = @tactics.repeat_tac(@tactics.strip_tac)
  let t264 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_le_refl(),
      @sets.in_insert(),
    ]),
  )
  let t263 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t272 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
              ),
              t263,
            ),
            t264,
          ),
          t265,
        ),
        t269,
      ),
      t270,
    ),
    t271,
  )
  iproduct_le_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → int_of_num(0) <= f(x) && f(x) <= int_of_num(1)) → iproduct(s, f) <= int_of_num(1)"),
      t272,
    ),
  )
}

///|
let iproduct_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_LE_1")

///|
/// `IPRODUCT_LE_1`
pub fn iproduct_le_1() -> @kernel.Thm {
  iproduct_le_1_c.get()
}

///|
/// IPRODUCT_ABS
fn step_82() -> Unit raise {
  let t273 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @int.int_abs_mul(),
      @int.int_abs_num(),
    ]),
  )
  let t274 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t273,
  )
  iproduct_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, FINITE(s) → iproduct(s, (x : _) => abs(f(x))) == abs(iproduct(s, f))"),
      t274,
    ),
  )
}

///|
let iproduct_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_ABS")

///|
/// `IPRODUCT_ABS`
pub fn iproduct_abs() -> @kernel.Thm {
  iproduct_abs_c.get()
}

///|
/// IPRODUCT_CLOSED
fn step_83() -> Unit raise {
  let t283 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_int_mul(), @equal.gsym(@iterate.iproduct())]),
  )
  let t279 = @term_syntax.parse_term("(P : (Int) -> Bool)")
  let t282 = @tactics.disch_then(fn(
    x281 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s277 = @tactics.mp_tac(x276)
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
    })(((x280 : @kernel.Thm) => @bool.spec(t279, x280))(x281))
  })
  let t275 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed())(@iterate.monoidal_int_mul()),
  )
  let t284 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t275),
      t282,
    ),
    t283,
  )
  iproduct_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ f : (A) -> Int, ∀ s : (A) -> Bool, P(int_of_num(1)) && (∀ x : Int, ∀ y : Int, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(iproduct(s, f))"),
      t284,
    ),
  )
}

///|
let iproduct_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLOSED",
)

///|
/// `IPRODUCT_CLOSED`
pub fn iproduct_closed() -> @kernel.Thm {
  iproduct_closed_c.get()
}

///|
/// IPRODUCT_RELATED
fn step_84() -> Unit raise {
  let t289 = @meson.asm_meson_tac(@list.List([]))
  let t288 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.iproduct()), @iterate.neutral_int_mul()]),
  )
  let t286 = @drule.match_mp(@iterate.iterate_related())(
    @iterate.monoidal_int_mul(),
  )
  let t287 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Int, Int) -> Bool)"), t286),
  )
  let t285 = @tactics.repeat_tac(@tactics.disch_tac)
  let t290 = @tactics.then_tac(
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
          t285,
        ),
        t287,
      ),
      t288,
    ),
    t289,
  )
  iproduct_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Int, Int) -> Bool, ∀ f : (A) -> Int, ∀ g : (A) -> Int, ∀ s : (A) -> Bool, R(int_of_num(1), int_of_num(1)) && (∀ m : Int, ∀ n : Int, ∀ m' : Int, ∀ n' : Int, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(iproduct(s, f), iproduct(s, g))"),
      t290,
    ),
  )
}

///|
let iproduct_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_RELATED",
)

///|
/// `IPRODUCT_RELATED`
pub fn iproduct_related() -> @kernel.Thm {
  iproduct_related_c.get()
}

///|
/// IPRODUCT_CLOSED_NONEMPTY
fn step_85() -> Unit raise {
  let t299 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_int_mul(), @equal.gsym(@iterate.iproduct())]),
  )
  let t295 = @term_syntax.parse_term("(P : (Int) -> Bool)")
  let t298 = @tactics.disch_then(fn(
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
    })(((x296 : @kernel.Thm) => @bool.spec(t295, x296))(x297))
  })
  let t291 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed_nonempty())(
      @iterate.monoidal_int_mul(),
    ),
  )
  let t300 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t291),
      t298,
    ),
    t299,
  )
  iproduct_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ f : (A) -> Int, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Int, ∀ y : Int, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(iproduct(s, f))"),
      t300,
    ),
  )
}

///|
let iproduct_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLOSED_NONEMPTY",
)

///|
/// `IPRODUCT_CLOSED_NONEMPTY`
pub fn iproduct_closed_nonempty() -> @kernel.Thm {
  iproduct_closed_nonempty_c.get()
}

///|
/// IPRODUCT_RELATED_NONEMPTY
fn step_86() -> Unit raise {
  let t305 = @meson.asm_meson_tac(@list.List([]))
  let t304 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.iproduct()), @iterate.neutral_int_mul()]),
  )
  let t302 = @drule.match_mp(@iterate.iterate_related_nonempty())(
    @iterate.monoidal_int_mul(),
  )
  let t303 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Int, Int) -> Bool)"), t302),
  )
  let t301 = @tactics.repeat_tac(@tactics.disch_tac)
  let t306 = @tactics.then_tac(
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
          t301,
        ),
        t303,
      ),
      t304,
    ),
    t305,
  )
  iproduct_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Int, Int) -> Bool, ∀ f : (A) -> Int, ∀ g : (A) -> Int, ∀ s : (A) -> Bool, (∀ m : Int, ∀ n : Int, ∀ m' : Int, ∀ n' : Int, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && !(s == {}) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(iproduct(s, f), iproduct(s, g))"),
      t306,
    ),
  )
}

///|
let iproduct_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_RELATED_NONEMPTY",
)

///|
/// `IPRODUCT_RELATED_NONEMPTY`
pub fn iproduct_related_nonempty() -> @kernel.Thm {
  iproduct_related_nonempty_c.get()
}

///|
/// IPRODUCT_CLAUSES_LEFT
fn step_87() -> Unit raise {
  let t307 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @equal.gsym(@iterate.numseg_lrec()),
        @iterate.iproduct_clauses(),
        @iterate.finite_numseg(),
        @iterate.in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  iproduct_clauses_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, m <= n → iproduct(op_dot_dot(m, n), f) == f(m) * iproduct(op_dot_dot(m + 1, n), f)"),
      t307,
    ),
  )
}

///|
let iproduct_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLAUSES_LEFT",
)

///|
/// `IPRODUCT_CLAUSES_LEFT`
pub fn iproduct_clauses_left() -> @kernel.Thm {
  iproduct_clauses_left_c.get()
}

///|
/// IPRODUCT_CLAUSES_RIGHT
fn step_88() -> Unit raise {
  let t308 = @simp.simp_tac(
    @list.List([@arith.lt_refl(), iproduct_clauses_numseg(), @arith.suc_sub1()]),
  )
  let t309 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t308,
  )
  iproduct_clauses_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, 0 < n && m <= n → iproduct(op_dot_dot(m, n), f) == iproduct(op_dot_dot(m, n - 1), f) * f(n)"),
      t309,
    ),
  )
}

///|
let iproduct_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_CLAUSES_RIGHT",
)

///|
/// `IPRODUCT_CLAUSES_RIGHT`
pub fn iproduct_clauses_right() -> @kernel.Thm {
  iproduct_clauses_right_c.get()
}

///|
/// INT_OF_NUM_NPRODUCT
fn step_89() -> Unit raise {
  let t310 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct_clauses(),
      @iterate.nproduct_clauses(),
      @equal.gsym(@int.int_of_num_mul()),
    ]),
  )
  let t311 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t310,
  )
  int_of_num_nproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → int_of_num(nproduct(s, f)) == iproduct(s, (x : A) => int_of_num(f(x)))"),
      t311,
    ),
  )
}

///|
let int_of_num_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_NPRODUCT",
)

///|
/// `INT_OF_NUM_NPRODUCT`
pub fn int_of_num_nproduct() -> @kernel.Thm {
  int_of_num_nproduct_c.get()
}

///|
/// IPRODUCT_SUPERSET
fn step_90() -> Unit raise {
  let t312 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct(),
      @equal.gsym(@iterate.neutral_int_mul()),
      @iterate.iterate_superset(),
      @iterate.monoidal_int_mul(),
    ]),
  )
  iproduct_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == int_of_num(1)) → iproduct(v, f) == iproduct(u, f)"),
      t312,
    ),
  )
}

///|
let iproduct_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_SUPERSET",
)

///|
/// `IPRODUCT_SUPERSET`
pub fn iproduct_superset() -> @kernel.Thm {
  iproduct_superset_c.get()
}

///|
/// IPRODUCT_UNIV
fn step_91() -> Unit raise {
  let t314 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_mul()]))
  let t313 = @tactics.match_mp_tac(@iterate.iterate_univ())
  let t315 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.iproduct()])),
      t313,
    ),
    t314,
  )
  iproduct_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ s : (A) -> Bool, SUBSET(support(op_star, f, UNIV), s) → iproduct(s, f) == iproduct(UNIV, f)"),
      t315,
    ),
  )
}

///|
let iproduct_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_UNIV")

///|
/// `IPRODUCT_UNIV`
pub fn iproduct_univ() -> @kernel.Thm {
  iproduct_univ_c.get()
}

///|
/// IPRODUCT_PAIR
fn step_92() -> Unit raise {
  let t316 = @simp.rewrite_tac(
    @list.List([@iterate.iproduct(), @iterate.neutral_int_mul()]),
  )
  let t317 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(@iterate.iterate_pair())(@iterate.monoidal_int_mul()),
    ),
    t316,
  )
  iproduct_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Int, ∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(2 * m, 2 * n + 1), f) == iproduct(op_dot_dot(m, n), (i : Num) => f(2 * i) * f(2 * i + 1))"),
      t317,
    ),
  )
}

///|
let iproduct_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_PAIR")

///|
/// `IPRODUCT_PAIR`
pub fn iproduct_pair() -> @kernel.Thm {
  iproduct_pair_c.get()
}

///|
/// IPRODUCT_REFLECT
fn step_93() -> Unit raise {
  let t323 = @simp.rewrite_tac(@list.List([@iterate.neutral_int_mul()]))
  let t322 = @simp.gen_rewrite_tac(
    fn(
      x319 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s320 = @equal.land_conv(x319)
      fn(x321 : @kernel.Term) -> @kernel.Thm raise { s320(x321) }
    },
    @list.List([
      @drule.match_mp(@iterate.iterate_reflect())(@iterate.monoidal_int_mul()),
    ]),
  )
  let t318 = @simp.rewrite_tac(@list.List([@iterate.iproduct()]))
  let t324 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t318),
      t322,
    ),
    t323,
  )
  iproduct_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Int, ∀ m : Num, ∀ n : Num, iproduct(op_dot_dot(m, n), x) == (if n < m { int_of_num(1) } else { iproduct(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"),
      t324,
    ),
  )
}

///|
let iproduct_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_REFLECT",
)

///|
/// `IPRODUCT_REFLECT`
pub fn iproduct_reflect() -> @kernel.Thm {
  iproduct_reflect_c.get()
}

///|
/// IPRODUCT_DELETE
fn step_94() -> Unit raise {
  let t325 = @simp.simp_tac(
    @list.List([
      @iterate.iproduct(),
      @iterate.iterate_delete(),
      @iterate.monoidal_int_mul(),
    ]),
  )
  iproduct_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, ∀ a : _, FINITE(s) && IN(a, s) → f(a) * iproduct(DELETE(s, a), f) == iproduct(s, f)"),
      t325,
    ),
  )
}

///|
let iproduct_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IPRODUCT_DELETE",
)

///|
/// `IPRODUCT_DELETE`
pub fn iproduct_delete() -> @kernel.Thm {
  iproduct_delete_c.get()
}

///|
/// IPRODUCT_DELTA
fn step_95() -> Unit raise {
  let t326 = @simp.simp_tac(
    @list.List([@iterate.iterate_delta(), @iterate.monoidal_int_mul()]),
  )
  let t327 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.iproduct(), @equal.gsym(@iterate.neutral_int_mul())]),
    ),
    t326,
  )
  iproduct_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ a : _, iproduct(s, (x : _) => if x == a { (b : Int) } else { int_of_num(1) }) == (if IN(a, s) { b } else { int_of_num(1) })"),
      t327,
    ),
  )
}

///|
let iproduct_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IPRODUCT_DELTA")

///|
/// `IPRODUCT_DELTA`
pub fn iproduct_delta() -> @kernel.Thm {
  iproduct_delta_c.get()
}

///|
/// INT_POW_NSUM
fn step_96() -> Unit raise {
  let t329 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @iterate.iproduct_clauses(),
      @int.int_pow_v1(),
      @int.int_pow_add(),
    ]),
  )
  let t328 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t330 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t328,
    ),
    t329,
  )
  int_pow_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → pow(x, nsum(s, n)) == iproduct(s, (i : A) => pow(x, n(i)))"),
      t330,
    ),
  )
}

///|
let int_pow_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_NSUM")

///|
/// `INT_POW_NSUM`
pub fn int_pow_nsum() -> @kernel.Thm {
  int_pow_nsum_c.get()
}

///|
/// Library/products.ml:647
fn step_97() -> Unit raise {
  let t332 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t331 = @tactics.match_mp_tac(iproduct_eq())
  let t333 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t331),
    t332,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → iproduct(s, (i : _) => f(i)) == iproduct(s, g)) && (∀ f : (Num) -> Int, ∀ g : (Num) -> Int, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → iproduct(op_dot_dot(a, b), (i : Num) => f(i)) == iproduct(op_dot_dot(a, b), g)) && (∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → iproduct({(y : _) | p(y)}, (i : _) => f(i)) == iproduct({(y : _) | p(y)}, g))"),
    t333,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
}

///|
/// Library/products.ml:662
fn step_98() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// PRODUCT_SUPPORT
fn step_99() -> Unit raise {
  let t334 = @simp.rewrite_tac(
    @list.List([@iterate.product(), @iterate.iterate_support()]),
  )
  product_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, product(support(op_star, f, s), f) == product(s, f)"),
      t334,
    ),
  )
}

///|
let product_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_SUPPORT",
)

///|
/// `PRODUCT_SUPPORT`
pub fn product_support() -> @kernel.Thm {
  product_support_c.get()
}

///|
/// PRODUCT_UNION
fn step_100() -> Unit raise {
  let t335 = @simp.simp_tac(
    @list.List([
      @iterate.product(),
      @iterate.iterate_union(),
      @iterate.monoidal_real_mul(),
    ]),
  )
  product_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → product(UNION(s, t), f) == product(s, f) * product(t, f)"),
      t335,
    ),
  )
}

///|
let product_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_UNION")

///|
/// `PRODUCT_UNION`
pub fn product_union() -> @kernel.Thm {
  product_union_c.get()
}

///|
/// PRODUCT_IMAGE
fn step_101() -> Unit raise {
  let t337 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_mul()]))
  let t336 = @tactics.match_mp_tac(@iterate.iterate_image())
  let t338 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @iterate.product(),
          @equal.gsym(@iterate.neutral_real_mul()),
        ]),
      ),
      t336,
    ),
    t337,
  )
  product_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → product(IMAGE(f, s), g) == product(s, o(g, f))"),
      t338,
    ),
  )
}

///|
let product_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_IMAGE")

///|
/// `PRODUCT_IMAGE`
pub fn product_image() -> @kernel.Thm {
  product_image_c.get()
}

///|
/// PRODUCT_INJECTION
fn step_102() -> Unit raise {
  let t340 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_mul()]))
  let t339 = @tactics.match_mp_tac(@iterate.iterate_injection())
  let t341 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.product()])), t339),
    t340,
  )
  product_injection_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ p : (_) -> _, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → IN(p(x), s)) && (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → product(s, o(f, p)) == product(s, f)"),
      t341,
    ),
  )
}

///|
let product_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_INJECTION",
)

///|
/// `PRODUCT_INJECTION`
pub fn product_injection() -> @kernel.Thm {
  product_injection_c.get()
}

///|
/// PRODUCT_ADD_SPLIT
fn step_103() -> Unit raise {
  let t342 = @simp.simp_tac(
    @list.List([
      @iterate.numseg_add_split(),
      product_union(),
      @iterate.disjoint_numseg(),
      @iterate.finite_numseg(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < x + 1")),
    ]),
  )
  product_add_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → product(op_dot_dot(m, n + p), f) == product(op_dot_dot(m, n), f) * product(op_dot_dot(n + 1, n + p), f)"),
      t342,
    ),
  )
}

///|
let product_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_ADD_SPLIT",
)

///|
/// `PRODUCT_ADD_SPLIT`
pub fn product_add_split() -> @kernel.Thm {
  product_add_split_c.get()
}

///|
/// PRODUCT_POS_LE
fn step_104() -> Unit raise {
  let t344 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @realarith.real_pos(),
      @sets.in_insert(),
      @realax.real_le_mul(),
    ]),
  )
  let t343 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t345 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
      ),
      t343,
    ),
    t344,
  )
  product_pos_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → real_of_num(0) <= f(x)) → real_of_num(0) <= product(s, f)"),
      t345,
    ),
  )
}

///|
let product_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_POS_LE")

///|
/// `PRODUCT_POS_LE`
pub fn product_pos_le() -> @kernel.Thm {
  product_pos_le_c.get()
}

///|
/// PRODUCT_POS_LE_NUMSEG
fn step_105() -> Unit raise {
  let t346 = @simp.simp_tac(
    @list.List([
      product_pos_le(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  product_pos_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → real_of_num(0) <= f(x)) → real_of_num(0) <= product(op_dot_dot(m, n), f)"),
      t346,
    ),
  )
}

///|
let product_pos_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_POS_LE_NUMSEG",
)

///|
/// `PRODUCT_POS_LE_NUMSEG`
pub fn product_pos_le_numseg() -> @kernel.Thm {
  product_pos_le_numseg_c.get()
}

///|
/// PRODUCT_POS_LT
fn step_106() -> Unit raise {
  let t348 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @real.real_lt_01(),
      @sets.in_insert(),
      @real.real_lt_mul(),
    ]),
  )
  let t347 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t349 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
      ),
      t347,
    ),
    t348,
  )
  product_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → real_of_num(0) < f(x)) → real_of_num(0) < product(s, f)"),
      t349,
    ),
  )
}

///|
let product_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_POS_LT")

///|
/// `PRODUCT_POS_LT`
pub fn product_pos_lt() -> @kernel.Thm {
  product_pos_lt_c.get()
}

///|
/// PRODUCT_POS_LT_NUMSEG
fn step_107() -> Unit raise {
  let t350 = @simp.simp_tac(
    @list.List([
      product_pos_lt(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  product_pos_lt_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → real_of_num(0) < f(x)) → real_of_num(0) < product(op_dot_dot(m, n), f)"),
      t350,
    ),
  )
}

///|
let product_pos_lt_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_POS_LT_NUMSEG",
)

///|
/// `PRODUCT_POS_LT_NUMSEG`
pub fn product_pos_lt_numseg() -> @kernel.Thm {
  product_pos_lt_numseg_c.get()
}

///|
/// PRODUCT_OFFSET
fn step_108() -> Unit raise {
  let t351 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t352 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @iterate.numseg_offset_image(),
        product_image(),
        @arith.eq_add_rcancel(),
        @iterate.finite_numseg(),
      ]),
    ),
    t351,
  )
  product_offset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ p : Num, product(op_dot_dot(m + p, (n : Num) + p), f) == product(op_dot_dot(m, n), (i : Num) => f(i + p))"),
      t352,
    ),
  )
}

///|
let product_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_OFFSET")

///|
/// `PRODUCT_OFFSET`
pub fn product_offset() -> @kernel.Thm {
  product_offset_c.get()
}

///|
/// PRODUCT_SING
fn step_109() -> Unit raise {
  let t353 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @sets.finite_rules(),
      @sets.not_in_empty(),
      @realarith.real_mul_rid(),
    ]),
  )
  product_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Real, ∀ x : _, product({x}, f) == f(x)"), t353),
  )
}

///|
let product_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_SING")

///|
/// `PRODUCT_SING`
pub fn product_sing() -> @kernel.Thm {
  product_sing_c.get()
}

///|
/// PRODUCT_SING_NUMSEG
fn step_110() -> Unit raise {
  let t354 = @simp.rewrite_tac(
    @list.List([@iterate.numseg_sing(), product_sing()]),
  )
  product_sing_numseg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ n : Num, product(op_dot_dot(n, n), f) == f(n)"), t354),
  )
}

///|
let product_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_SING_NUMSEG",
)

///|
/// `PRODUCT_SING_NUMSEG`
pub fn product_sing_numseg() -> @kernel.Thm {
  product_sing_numseg_c.get()
}

///|
/// PRODUCT_CLAUSES_NUMSEG
fn step_111() -> Unit raise {
  let t357 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
      @real.real_mul_ac(),
    ]),
  )
  let t356 = @simp.asm_simp_tac(
    @list.List([
      product_sing(),
      @iterate.product_clauses(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  let t355 = @tactics.repeat_tac(@tactics.strip_tac)
  let t358 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])),
          t355,
        ),
        @class.cond_cases_tac,
      ),
      t356,
    ),
    t357,
  )
  product_clauses_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, product(op_dot_dot(m, 0), (f : (Num) -> Real)) == (if m == 0 { f(0) } else { real_of_num(1) })) && (∀ m : Num, ∀ n : Num, product(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { product(op_dot_dot(m, n), f) * f(SUC(n)) } else { product(op_dot_dot(m, n), f) }))"),
      t358,
    ),
  )
}

///|
let product_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CLAUSES_NUMSEG",
)

///|
/// `PRODUCT_CLAUSES_NUMSEG`
pub fn product_clauses_numseg() -> @kernel.Thm {
  product_clauses_numseg_c.get()
}

///|
/// PRODUCT_EQ
fn step_112() -> Unit raise {
  let t360 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_mul()]))
  let t359 = @tactics.match_mp_tac(@iterate.iterate_eq())
  let t361 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.product()])), t359),
    t360,
  )
  product_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → product(s, f) == product(s, g)"),
      t361,
    ),
  )
}

///|
let product_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_EQ")

///|
/// `PRODUCT_EQ`
pub fn product_eq() -> @kernel.Thm {
  product_eq_c.get()
}

///|
/// PRODUCT_EQ_NUMSEG
fn step_113() -> Unit raise {
  let t362 = @meson.meson_tac(
    @list.List([product_eq(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  product_eq_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → product(op_dot_dot(m, n), f) == product(op_dot_dot(m, n), g)"),
      t362,
    ),
  )
}

///|
let product_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_EQ_NUMSEG",
)

///|
/// `PRODUCT_EQ_NUMSEG`
pub fn product_eq_numseg() -> @kernel.Thm {
  product_eq_numseg_c.get()
}

///|
/// PRODUCT_EQ_0
fn step_114() -> Unit raise {
  let t364 = @meson.meson_tac(@list.List([]))
  let t363 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @realarith.real_entire(),
      @sets.in_insert(),
      @realax.real_of_num_eq(),
      @calc_num.arith(),
      @sets.not_in_empty(),
    ]),
  )
  let t365 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@sets.finite_induct_strong()),
      ),
      t363,
    ),
    t364,
  )
  product_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → (product(s, f) == real_of_num(0)) == (∃ x : _, IN(x, s) && f(x) == real_of_num(0))"),
      t365,
    ),
  )
}

///|
let product_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_EQ_0")

///|
/// `PRODUCT_EQ_0`
pub fn product_eq_0() -> @kernel.Thm {
  product_eq_0_c.get()
}

///|
/// PRODUCT_EQ_0_NUMSEG
fn step_115() -> Unit raise {
  let t366 = @simp.simp_tac(
    @list.List([
      product_eq_0(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  product_eq_0_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (product(op_dot_dot(m, n), f) == real_of_num(0)) == (∃ x : Num, m <= x && x <= n && f(x) == real_of_num(0))"),
      t366,
    ),
  )
}

///|
let product_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_EQ_0_NUMSEG",
)

///|
/// `PRODUCT_EQ_0_NUMSEG`
pub fn product_eq_0_numseg() -> @kernel.Thm {
  product_eq_0_numseg_c.get()
}

///|
/// PRODUCT_RESTRICT
fn step_116() -> Unit raise {
  let t368 = @simp.asm_simp_tac(@list.List([]))
  let t367 = @tactics.match_mp_tac(product_eq())
  let t369 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t367),
    t368,
  )
  product_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (i : _) => if IN(i, s) { f(i) } else { real_of_num(1) }) == product(s, f)"),
      t369,
    ),
  )
}

///|
let product_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_RESTRICT",
)

///|
/// `PRODUCT_RESTRICT`
pub fn product_restrict() -> @kernel.Thm {
  product_restrict_c.get()
}

///|
/// PRODUCT_RESTRICT_SET
fn step_117() -> Unit raise {
  let t371 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_mul()]))
  let t370 = @tactics.match_mp_tac(@iterate.iterate_restrict_set())
  let t372 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @iterate.product(),
          @equal.gsym(@iterate.neutral_real_mul()),
        ]),
      ),
      t370,
    ),
    t371,
  )
  product_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Real, product({(i : A) | IN(i, s) && P(i)}, f) == product(s, (i : A) => if P(i) { f(i) } else { real_of_num(1) })"),
      t372,
    ),
  )
}

///|
let product_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_RESTRICT_SET",
)

///|
/// `PRODUCT_RESTRICT_SET`
pub fn product_restrict_set() -> @kernel.Thm {
  product_restrict_set_c.get()
}

///|
/// PRODUCT_LE
fn step_118() -> Unit raise {
  let t375 = @meson.meson_tac(
    @list.List([@real.real_le_mul2(), product_pos_le()]),
  )
  let t374 = @simp.simp_tac(
    @list.List([
      @sets.in_insert(),
      @iterate.product_clauses(),
      @sets.not_in_empty(),
      @realax.real_le_refl(),
    ]),
  )
  let t373 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t376 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
        ),
        t373,
      ),
      t374,
    ),
    t375,
  )
  product_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → real_of_num(0) <= f(x) && f(x) <= (g : (_) -> Real)(x)) → product(s, f) <= product(s, g)"),
      t376,
    ),
  )
}

///|
let product_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LE")

///|
/// `PRODUCT_LE`
pub fn product_le() -> @kernel.Thm {
  product_le_c.get()
}

///|
/// PRODUCT_LE_NUMSEG
fn step_119() -> Unit raise {
  let t377 = @simp.simp_tac(
    @list.List([product_le(), @iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  product_le_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → real_of_num(0) <= f(i) && f(i) <= (g : (Num) -> Real)(i)) → product(op_dot_dot(m, n), f) <= product(op_dot_dot(m, n), g)"),
      t377,
    ),
  )
}

///|
let product_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_LE_NUMSEG",
)

///|
/// `PRODUCT_LE_NUMSEG`
pub fn product_le_numseg() -> @kernel.Thm {
  product_le_numseg_c.get()
}

///|
/// PRODUCT_EQ_1
fn step_120() -> Unit raise {
  let t378 = @simp.simp_tac(
    @list.List([@iterate.iterate_eq_neutral(), @iterate.monoidal_real_mul()]),
  )
  let t379 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.product(), @equal.gsym(@iterate.neutral_real_mul())]),
    ),
    t378,
  )
  product_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == real_of_num(1)) → product(s, f) == real_of_num(1)"),
      t379,
    ),
  )
}

///|
let product_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_EQ_1")

///|
/// `PRODUCT_EQ_1`
pub fn product_eq_1() -> @kernel.Thm {
  product_eq_1_c.get()
}

///|
/// PRODUCT_EQ_1_NUMSEG
fn step_121() -> Unit raise {
  let t380 = @simp.simp_tac(@list.List([product_eq_1(), @iterate.in_numseg()]))
  product_eq_1_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == real_of_num(1)) → product(op_dot_dot(m, n), f) == real_of_num(1)"),
      t380,
    ),
  )
}

///|
let product_eq_1_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_EQ_1_NUMSEG",
)

///|
/// `PRODUCT_EQ_1_NUMSEG`
pub fn product_eq_1_numseg() -> @kernel.Thm {
  product_eq_1_numseg_c.get()
}

///|
/// PRODUCT_MUL_GEN
fn step_122() -> Unit raise {
  let t383 = @tactics.accept_tac(@iterate.monoidal_real_mul())
  let t382 = @tactics.match_mp_tac(@iterate.iterate_op_gen())
  let t381 = @equal.gsym(@iterate.support())
  let t384 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@iterate.neutral_real_mul()),
          t381,
          @iterate.product(),
        ]),
      ),
      t382,
    ),
    t383,
  )
  product_mul_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, FINITE({(x : _) | IN(x, s) && !(f(x) == real_of_num(1))}) && FINITE({(x : _) | IN(x, s) && !(g(x) == real_of_num(1))}) → product(s, (x : _) => f(x) * g(x)) == product(s, f) * product(s, g)"),
      t384,
    ),
  )
}

///|
let product_mul_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_MUL_GEN",
)

///|
/// `PRODUCT_MUL_GEN`
pub fn product_mul_gen() -> @kernel.Thm {
  product_mul_gen_c.get()
}

///|
/// PRODUCT_MUL
fn step_123() -> Unit raise {
  let t386 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @real.real_mul_ac(),
      @realax.real_mul_lid(),
    ]),
  )
  let t385 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t387 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t385,
    ),
    t386,
  )
  product_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (x : _) => f(x) * g(x)) == product(s, f) * product(s, g)"),
      t387,
    ),
  )
}

///|
let product_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_MUL")

///|
/// `PRODUCT_MUL`
pub fn product_mul() -> @kernel.Thm {
  product_mul_c.get()
}

///|
/// PRODUCT_MUL_NUMSEG
fn step_124() -> Unit raise {
  let t388 = @simp.simp_tac(
    @list.List([product_mul(), @iterate.finite_numseg()]),
  )
  product_mul_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(m, n), (x : Num) => f(x) * g(x)) == product(op_dot_dot(m, n), f) * product(op_dot_dot(m, n), g)"),
      t388,
    ),
  )
}

///|
let product_mul_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_MUL_NUMSEG",
)

///|
/// `PRODUCT_MUL_NUMSEG`
pub fn product_mul_numseg() -> @kernel.Thm {
  product_mul_numseg_c.get()
}

///|
/// PRODUCT_CONST
fn step_125() -> Unit raise {
  let t389 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @sets.card_clauses(),
      @realax.real_pow(),
    ]),
  )
  let t390 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t389,
  )
  product_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (x : _) => c) == pow(c, CARD(s))"),
      t390,
    ),
  )
}

///|
let product_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_CONST")

///|
/// `PRODUCT_CONST`
pub fn product_const() -> @kernel.Thm {
  product_const_c.get()
}

///|
/// PRODUCT_CONST_NUMSEG
fn step_126() -> Unit raise {
  let t391 = @simp.simp_tac(
    @list.List([
      product_const(),
      @iterate.card_numseg(),
      @iterate.finite_numseg(),
    ]),
  )
  product_const_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(m, n), (x : Num) => c) == pow(c, n + 1 - m)"),
      t391,
    ),
  )
}

///|
let product_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CONST_NUMSEG",
)

///|
/// `PRODUCT_CONST_NUMSEG`
pub fn product_const_numseg() -> @kernel.Thm {
  product_const_numseg_c.get()
}

///|
/// PRODUCT_CONST_NUMSEG_1
fn step_127() -> Unit raise {
  let t392 = @simp.simp_tac(
    @list.List([
      product_const(),
      @iterate.card_numseg_1(),
      @iterate.finite_numseg(),
    ]),
  )
  product_const_numseg_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ n : Num, product(op_dot_dot(1, n), (x : Num) => c) == pow(c, n)"),
      t392,
    ),
  )
}

///|
let product_const_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CONST_NUMSEG_1",
)

///|
/// `PRODUCT_CONST_NUMSEG_1`
pub fn product_const_numseg_1() -> @kernel.Thm {
  product_const_numseg_1_c.get()
}

///|
/// PRODUCT_NEG
fn step_128() -> Unit raise {
  let t394 = @simp.rewrite_tac(
    @list.List([@calc_int.real_mul_lneg(), @realax.real_mul_lid()]),
  )
  let t393 = @equal.gsym(product_mul())
  let t395 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@equal.gsym(product_const()), t393])),
    t394,
  )
  product_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) → product(s, (i : A) => -f(i)) == pow(-real_of_num(1), CARD(s)) * product(s, f)"),
      t395,
    ),
  )
}

///|
let product_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_NEG")

///|
/// `PRODUCT_NEG`
pub fn product_neg() -> @kernel.Thm {
  product_neg_c.get()
}

///|
/// PRODUCT_NEG_NUMSEG
fn step_129() -> Unit raise {
  let t396 = @simp.simp_tac(
    @list.List([product_neg(), @iterate.card_numseg(), @iterate.finite_numseg()]),
  )
  product_neg_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(m, n), (i : Num) => -f(i)) == pow(-real_of_num(1), n + 1 - m) * product(op_dot_dot(m, n), f)"),
      t396,
    ),
  )
}

///|
let product_neg_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_NEG_NUMSEG",
)

///|
/// `PRODUCT_NEG_NUMSEG`
pub fn product_neg_numseg() -> @kernel.Thm {
  product_neg_numseg_c.get()
}

///|
/// PRODUCT_NEG_NUMSEG_1
fn step_130() -> Unit raise {
  let t397 = @simp.rewrite_tac(
    @list.List([product_neg_numseg(), @arith.add_sub()]),
  )
  product_neg_numseg_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ n : Num, product(op_dot_dot(1, n), (i : Num) => -f(i)) == pow(-real_of_num(1), n) * product(op_dot_dot(1, n), f)"),
      t397,
    ),
  )
}

///|
let product_neg_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_NEG_NUMSEG_1",
)

///|
/// `PRODUCT_NEG_NUMSEG_1`
pub fn product_neg_numseg_1() -> @kernel.Thm {
  product_neg_numseg_1_c.get()
}

///|
/// PRODUCT_INV
fn step_131() -> Unit raise {
  let t398 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @real.real_inv_1(),
      @real.real_inv_mul(),
    ]),
  )
  let t399 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t398,
  )
  product_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (x : _) => inv(f(x))) == inv(product(s, f))"),
      t399,
    ),
  )
}

///|
let product_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_INV")

///|
/// `PRODUCT_INV`
pub fn product_inv() -> @kernel.Thm {
  product_inv_c.get()
}

///|
/// PRODUCT_DIV
fn step_132() -> Unit raise {
  let t400 = @simp.simp_tac(
    @list.List([@realax.real_div(), product_mul(), product_inv()]),
  )
  product_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (x : _) => f(x) / g(x)) == product(s, f) / product(s, g)"),
      t400,
    ),
  )
}

///|
let product_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_DIV")

///|
/// `PRODUCT_DIV`
pub fn product_div() -> @kernel.Thm {
  product_div_c.get()
}

///|
/// PRODUCT_DIV_NUMSEG
fn step_133() -> Unit raise {
  let t401 = @simp.simp_tac(
    @list.List([product_div(), @iterate.finite_numseg()]),
  )
  product_div_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(m, n), (x : Num) => f(x) / g(x)) == product(op_dot_dot(m, n), f) / product(op_dot_dot(m, n), g)"),
      t401,
    ),
  )
}

///|
let product_div_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_DIV_NUMSEG",
)

///|
/// `PRODUCT_DIV_NUMSEG`
pub fn product_div_numseg() -> @kernel.Thm {
  product_div_numseg_c.get()
}

///|
/// PRODUCT_ONE
fn step_134() -> Unit raise {
  let t402 = @simp.simp_tac(@list.List([product_eq_1()]))
  product_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, product(s, (n : _) => real_of_num(1)) == real_of_num(1)"), t402),
  )
}

///|
let product_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_ONE")

///|
/// `PRODUCT_ONE`
pub fn product_one() -> @kernel.Thm {
  product_one_c.get()
}

///|
/// PRODUCT_LE_1
fn step_135() -> Unit raise {
  let t411 = @simp.asm_simp_tac(@list.List([product_pos_le()]))
  let t410 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t409 = @simp.gen_rewrite_tac(
    fn(
      x406 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s407 = @equal.rand_conv(x406)
      fn(x408 : @kernel.Term) -> @kernel.Thm raise { s407(x408) }
    },
    @list.List([@equal.gsym(@realax.real_mul_lid())]),
  )
  let t405 = @tactics.repeat_tac(@tactics.strip_tac)
  let t404 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @realax.real_le_refl(),
      @sets.in_insert(),
    ]),
  )
  let t403 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t412 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
              ),
              t403,
            ),
            t404,
          ),
          t405,
        ),
        t409,
      ),
      t410,
    ),
    t411,
  )
  product_le_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → real_of_num(0) <= f(x) && f(x) <= real_of_num(1)) → product(s, f) <= real_of_num(1)"),
      t412,
    ),
  )
}

///|
let product_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_LE_1")

///|
/// `PRODUCT_LE_1`
pub fn product_le_1() -> @kernel.Thm {
  product_le_1_c.get()
}

///|
/// PRODUCT_ABS
fn step_136() -> Unit raise {
  let t413 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @real.real_abs_mul(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t414 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t413,
  )
  product_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, FINITE(s) → product(s, (x : _) => abs(f(x))) == abs(product(s, f))"),
      t414,
    ),
  )
}

///|
let product_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_ABS")

///|
/// `PRODUCT_ABS`
pub fn product_abs() -> @kernel.Thm {
  product_abs_c.get()
}

///|
/// PRODUCT_CLOSED
fn step_137() -> Unit raise {
  let t423 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_real_mul(), @equal.gsym(@iterate.product())]),
  )
  let t419 = @term_syntax.parse_term("(P : (Real) -> Bool)")
  let t422 = @tactics.disch_then(fn(
    x421 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x416 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s417 = @tactics.mp_tac(x416)
      fn(
        x418 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s417(x418)
      }
    })(((x420 : @kernel.Thm) => @bool.spec(t419, x420))(x421))
  })
  let t415 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed())(@iterate.monoidal_real_mul()),
  )
  let t424 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t415),
      t422,
    ),
    t423,
  )
  product_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (A) -> Real, ∀ s : (A) -> Bool, P(real_of_num(1)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(product(s, f))"),
      t424,
    ),
  )
}

///|
let product_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_CLOSED")

///|
/// `PRODUCT_CLOSED`
pub fn product_closed() -> @kernel.Thm {
  product_closed_c.get()
}

///|
/// PRODUCT_RELATED
fn step_138() -> Unit raise {
  let t429 = @meson.asm_meson_tac(@list.List([]))
  let t428 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.product()), @iterate.neutral_real_mul()]),
  )
  let t426 = @drule.match_mp(@iterate.iterate_related())(
    @iterate.monoidal_real_mul(),
  )
  let t427 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Real, Real) -> Bool)"), t426),
  )
  let t425 = @tactics.repeat_tac(@tactics.disch_tac)
  let t430 = @tactics.then_tac(
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
          t425,
        ),
        t427,
      ),
      t428,
    ),
    t429,
  )
  product_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Real, Real) -> Bool, ∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, R(real_of_num(1), real_of_num(1)) && (∀ m : Real, ∀ n : Real, ∀ m' : Real, ∀ n' : Real, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(product(s, f), product(s, g))"),
      t430,
    ),
  )
}

///|
let product_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_RELATED",
)

///|
/// `PRODUCT_RELATED`
pub fn product_related() -> @kernel.Thm {
  product_related_c.get()
}

///|
/// PRODUCT_CLOSED_NONEMPTY
fn step_139() -> Unit raise {
  let t439 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_real_mul(), @equal.gsym(@iterate.product())]),
  )
  let t435 = @term_syntax.parse_term("(P : (Real) -> Bool)")
  let t438 = @tactics.disch_then(fn(
    x437 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s433 = @tactics.mp_tac(x432)
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
    })(((x436 : @kernel.Thm) => @bool.spec(t435, x436))(x437))
  })
  let t431 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed_nonempty())(
      @iterate.monoidal_real_mul(),
    ),
  )
  let t440 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t431),
      t438,
    ),
    t439,
  )
  product_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x * y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(product(s, f))"),
      t440,
    ),
  )
}

///|
let product_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CLOSED_NONEMPTY",
)

///|
/// `PRODUCT_CLOSED_NONEMPTY`
pub fn product_closed_nonempty() -> @kernel.Thm {
  product_closed_nonempty_c.get()
}

///|
/// PRODUCT_RELATED_NONEMPTY
fn step_140() -> Unit raise {
  let t445 = @meson.asm_meson_tac(@list.List([]))
  let t444 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.product()), @iterate.neutral_real_mul()]),
  )
  let t442 = @drule.match_mp(@iterate.iterate_related_nonempty())(
    @iterate.monoidal_real_mul(),
  )
  let t443 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Real, Real) -> Bool)"), t442),
  )
  let t441 = @tactics.repeat_tac(@tactics.disch_tac)
  let t446 = @tactics.then_tac(
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
          t441,
        ),
        t443,
      ),
      t444,
    ),
    t445,
  )
  product_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Real, Real) -> Bool, ∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ s : (A) -> Bool, (∀ m : Real, ∀ n : Real, ∀ m' : Real, ∀ n' : Real, R(m, n) && R(m', n') → R(m * m', n * n')) && FINITE(s) && !(s == {}) && (∀ i : A, IN(i, s) → R(f(i), g(i))) → R(product(s, f), product(s, g))"),
      t446,
    ),
  )
}

///|
let product_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_RELATED_NONEMPTY",
)

///|
/// `PRODUCT_RELATED_NONEMPTY`
pub fn product_related_nonempty() -> @kernel.Thm {
  product_related_nonempty_c.get()
}

///|
/// PRODUCT_CLAUSES_LEFT
fn step_141() -> Unit raise {
  let t447 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @equal.gsym(@iterate.numseg_lrec()),
        @iterate.product_clauses(),
        @iterate.finite_numseg(),
        @iterate.in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  product_clauses_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n → product(op_dot_dot(m, n), f) == f(m) * product(op_dot_dot(m + 1, n), f)"),
      t447,
    ),
  )
}

///|
let product_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CLAUSES_LEFT",
)

///|
/// `PRODUCT_CLAUSES_LEFT`
pub fn product_clauses_left() -> @kernel.Thm {
  product_clauses_left_c.get()
}

///|
/// PRODUCT_CLAUSES_RIGHT
fn step_142() -> Unit raise {
  let t448 = @simp.simp_tac(
    @list.List([@arith.lt_refl(), product_clauses_numseg(), @arith.suc_sub1()]),
  )
  let t449 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t448,
  )
  product_clauses_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, 0 < n && m <= n → product(op_dot_dot(m, n), f) == product(op_dot_dot(m, n - 1), f) * f(n)"),
      t449,
    ),
  )
}

///|
let product_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_CLAUSES_RIGHT",
)

///|
/// `PRODUCT_CLAUSES_RIGHT`
pub fn product_clauses_right() -> @kernel.Thm {
  product_clauses_right_c.get()
}

///|
/// REAL_OF_NUM_NPRODUCT
fn step_143() -> Unit raise {
  let t450 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @iterate.nproduct_clauses(),
      @equal.gsym(@realax.real_of_num_mul()),
    ]),
  )
  let t451 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@sets.finite_induct_strong()),
    ),
    t450,
  )
  real_of_num_nproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → real_of_num(nproduct(s, f)) == product(s, (x : A) => real_of_num(f(x)))"),
      t451,
    ),
  )
}

///|
let real_of_num_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_NPRODUCT",
)

///|
/// `REAL_OF_NUM_NPRODUCT`
pub fn real_of_num_nproduct() -> @kernel.Thm {
  real_of_num_nproduct_c.get()
}

///|
/// PRODUCT_SUPERSET
fn step_144() -> Unit raise {
  let t452 = @simp.simp_tac(
    @list.List([
      @iterate.product(),
      @equal.gsym(@iterate.neutral_real_mul()),
      @iterate.iterate_superset(),
      @iterate.monoidal_real_mul(),
    ]),
  )
  product_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == real_of_num(1)) → product(v, f) == product(u, f)"),
      t452,
    ),
  )
}

///|
let product_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_SUPERSET",
)

///|
/// `PRODUCT_SUPERSET`
pub fn product_superset() -> @kernel.Thm {
  product_superset_c.get()
}

///|
/// PRODUCT_UNIV
fn step_145() -> Unit raise {
  let t454 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_mul()]))
  let t453 = @tactics.match_mp_tac(@iterate.iterate_univ())
  let t455 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.product()])), t453),
    t454,
  )
  product_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, SUBSET(support(op_star, f, UNIV), s) → product(s, f) == product(UNIV, f)"),
      t455,
    ),
  )
}

///|
let product_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_UNIV")

///|
/// `PRODUCT_UNIV`
pub fn product_univ() -> @kernel.Thm {
  product_univ_c.get()
}

///|
/// PRODUCT_PAIR
fn step_146() -> Unit raise {
  let t456 = @simp.rewrite_tac(
    @list.List([@iterate.product(), @iterate.neutral_real_mul()]),
  )
  let t457 = @tactics.then_tac(
    @tactics.mp_tac(
      @drule.match_mp(@iterate.iterate_pair())(@iterate.monoidal_real_mul()),
    ),
    t456,
  )
  product_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(2 * m, 2 * n + 1), f) == product(op_dot_dot(m, n), (i : Num) => f(2 * i) * f(2 * i + 1))"),
      t457,
    ),
  )
}

///|
let product_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_PAIR")

///|
/// `PRODUCT_PAIR`
pub fn product_pair() -> @kernel.Thm {
  product_pair_c.get()
}

///|
/// PRODUCT_REFLECT
fn step_147() -> Unit raise {
  let t463 = @simp.rewrite_tac(@list.List([@iterate.neutral_real_mul()]))
  let t462 = @simp.gen_rewrite_tac(
    fn(
      x459 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s460 = @equal.land_conv(x459)
      fn(x461 : @kernel.Term) -> @kernel.Thm raise { s460(x461) }
    },
    @list.List([
      @drule.match_mp(@iterate.iterate_reflect())(@iterate.monoidal_real_mul()),
    ]),
  )
  let t458 = @simp.rewrite_tac(@list.List([@iterate.product()]))
  let t464 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t458),
      t462,
    ),
    t463,
  )
  product_reflect_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Num) -> Real, ∀ m : Num, ∀ n : Num, product(op_dot_dot(m, n), x) == (if n < m { real_of_num(1) } else { product(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"),
      t464,
    ),
  )
}

///|
let product_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_REFLECT",
)

///|
/// `PRODUCT_REFLECT`
pub fn product_reflect() -> @kernel.Thm {
  product_reflect_c.get()
}

///|
/// PRODUCT_DELETE
fn step_148() -> Unit raise {
  let t465 = @simp.simp_tac(
    @list.List([
      @iterate.product(),
      @iterate.iterate_delete(),
      @iterate.monoidal_real_mul(),
    ]),
  )
  product_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ s : (_) -> Bool, ∀ a : _, FINITE(s) && IN(a, s) → f(a) * product(DELETE(s, a), f) == product(s, f)"),
      t465,
    ),
  )
}

///|
let product_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_DELETE")

///|
/// `PRODUCT_DELETE`
pub fn product_delete() -> @kernel.Thm {
  product_delete_c.get()
}

///|
/// PRODUCT_DELTA
fn step_149() -> Unit raise {
  let t466 = @simp.simp_tac(
    @list.List([@iterate.iterate_delta(), @iterate.monoidal_real_mul()]),
  )
  let t467 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@iterate.product(), @equal.gsym(@iterate.neutral_real_mul())]),
    ),
    t466,
  )
  product_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ a : _, product(s, (x : _) => if x == a { (b : Real) } else { real_of_num(1) }) == (if IN(a, s) { b } else { real_of_num(1) })"),
      t467,
    ),
  )
}

///|
let product_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_DELTA")

///|
/// `PRODUCT_DELTA`
pub fn product_delta() -> @kernel.Thm {
  product_delta_c.get()
}

///|
/// REAL_POW_NSUM
fn step_150() -> Unit raise {
  let t469 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @iterate.product_clauses(),
      @realax.real_pow(),
      @real.real_pow_add(),
    ]),
  )
  let t468 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t470 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t468,
    ),
    t469,
  )
  real_pow_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : (A) -> Num, ∀ s : (A) -> Bool, FINITE(s) → pow(x, nsum(s, n)) == product(s, (i : A) => pow(x, n(i)))"),
      t470,
    ),
  )
}

///|
let real_pow_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_NSUM")

///|
/// `REAL_POW_NSUM`
pub fn real_pow_nsum() -> @kernel.Thm {
  real_pow_nsum_c.get()
}

///|
/// POLYNOMIAL_FUNCTION_PRODUCT
fn step_151() -> Unit raise {
  let t473 = @simp.simp_tac(
    @list.List([@sets.forall_in_insert(), @iterate.polynomial_function_mul()]),
  )
  let t472 = @simp.simp_tac(
    @list.List([
      @iterate.product_clauses(),
      @iterate.polynomial_function_const(),
    ]),
  )
  let t471 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t474 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
        ),
        t471,
      ),
      t472,
    ),
    t473,
  )
  polynomial_function_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (Real, A) -> Real, FINITE(s) && (∀ i : A, IN(i, s) → polynomial_function((x : Real) => p(x, i))) → polynomial_function((x : Real) => product(s, p(x)))"),
      t474,
    ),
  )
}

///|
let polynomial_function_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLYNOMIAL_FUNCTION_PRODUCT",
)

///|
/// `POLYNOMIAL_FUNCTION_PRODUCT`
pub fn polynomial_function_product() -> @kernel.Thm {
  polynomial_function_product_c.get()
}

///|
/// Library/products.ml:974
fn step_152() -> Unit raise {
  let t476 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t475 = @tactics.match_mp_tac(product_eq())
  let t477 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t475),
    t476,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → product(s, (i : _) => f(i)) == product(s, g)) && (∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → product(op_dot_dot(a, b), (i : Num) => f(i)) == product(op_dot_dot(a, b), g)) && (∀ f : (_) -> Real, ∀ g : (_) -> Real, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → product({(y : _) | p(y)}, (i : _) => f(i)) == product({(y : _) | p(y)}, g))"),
    t477,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
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
}
