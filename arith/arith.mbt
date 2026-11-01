// Translated from upstream arith.ml; edit this file directly.

///|
/// arith.ml:23
fn step_1() -> Unit raise {
  @printer.parse_as_infix("<", (12L, "right"))
}

///|
/// arith.ml:24
fn step_2() -> Unit raise {
  @printer.parse_as_infix("<=", (12L, "right"))
}

///|
/// arith.ml:25
fn step_3() -> Unit raise {
  @printer.parse_as_infix(">", (12L, "right"))
}

///|
/// arith.ml:26
fn step_4() -> Unit raise {
  @printer.parse_as_infix(">=", (12L, "right"))
}

///|
/// arith.ml:28
fn step_5() -> Unit raise {
  @printer.parse_as_infix("+", (16L, "right"))
}

///|
/// arith.ml:29
fn step_6() -> Unit raise {
  @printer.parse_as_infix("-", (18L, "left"))
}

///|
/// arith.ml:30
fn step_7() -> Unit raise {
  @printer.parse_as_infix("*", (20L, "right"))
}

///|
/// arith.ml:31
fn step_8() -> Unit raise {
  @printer.parse_as_infix("EXP", (24L, "left"))
}

///|
/// arith.ml:33
fn step_9() -> Unit raise {
  @printer.parse_as_infix("DIV", (22L, "left"))
}

///|
/// arith.ml:34
fn step_10() -> Unit raise {
  @printer.parse_as_infix("MOD", (22L, "left"))
}

///|
/// PRE
fn step_11() -> Unit raise {
  let t1 = @term_syntax.parse_term("(PRE : (Num) -> Num)(0) == 0 && (∀ n : Num, PRE(SUC(n)) == n)")
  pre_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t1))
}

///|
let pre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE")

///|
/// `PRE`
pub fn pre() -> @kernel.Thm {
  pre_c.get()
}

///|
/// ADD
fn step_12() -> Unit raise {
  let t2 = @term_syntax.parse_term("(∀ n : Num, (op_plus : (Num, Num) -> Num)(0, n) == n) && (∀ m : Num, ∀ n : Num, op_plus(SUC(m), n) == SUC(op_plus(m, n)))")
  add_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t2))
}

///|
let add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD")

///|
/// `ADD`
pub fn add() -> @kernel.Thm {
  add_c.get()
}

///|
/// ADD_0
fn step_13() -> Unit raise {
  let t3 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add()])),
  )
  add_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, m + 0 == m"), t3))
}

///|
let add_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_0")

///|
/// `ADD_0`
pub fn add_0() -> @kernel.Thm {
  add_0_c.get()
}

///|
/// ADD_SUC
fn step_14() -> Unit raise {
  let t4 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add()])),
  )
  add_suc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m + SUC(n) == SUC(m + n)"), t4),
  )
}

///|
let add_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SUC")

///|
/// `ADD_SUC`
pub fn add_suc() -> @kernel.Thm {
  add_suc_c.get()
}

///|
/// ADD_CLAUSES
fn step_15() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([add(), add_0(), add_suc()]))
  add_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, 0 + n == n) && (∀ m : Num, m + 0 == m) && (∀ m : Num, ∀ n : Num, SUC(m) + n == SUC(m + n)) && (∀ m : Num, ∀ n : Num, m + SUC(n) == SUC(m + n))"),
      t5,
    ),
  )
}

///|
let add_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_CLAUSES")

///|
/// `ADD_CLAUSES`
pub fn add_clauses() -> @kernel.Thm {
  add_clauses_c.get()
}

///|
/// ADD_SYM
fn step_16() -> Unit raise {
  let t6 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses()])),
  )
  add_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m + n == n + m"), t6))
}

///|
let add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SYM")

///|
/// `ADD_SYM`
pub fn add_sym() -> @kernel.Thm {
  add_sym_c.get()
}

///|
/// ADD_ASSOC
fn step_17() -> Unit raise {
  let t7 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses()])),
  )
  add_assoc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m + (n + p) == m + n + p"), t7),
  )
}

///|
let add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_ASSOC")

///|
/// `ADD_ASSOC`
pub fn add_assoc() -> @kernel.Thm {
  add_assoc_c.get()
}

///|
/// ADD_AC
fn step_18() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([add_assoc(), add_sym()]))
  add_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(m : Num) + (n : Num) == n + m && m + n + (p : Num) == m + (n + p) && m + (n + p) == n + (m + p)"),
      t8,
    ),
  )
}

///|
let add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_AC")

///|
/// `ADD_AC`
pub fn add_ac() -> @kernel.Thm {
  add_ac_c.get()
}

///|
/// ADD_EQ_0
fn step_19() -> Unit raise {
  let t9 = @simp.rewrite_tac(@list.List([add_clauses(), @nums.not_suc()]))
  let t10 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t9)
  add_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m + n == 0) == (m == 0 && n == 0)"),
      t10,
    ),
  )
}

///|
let add_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_EQ_0")

///|
/// `ADD_EQ_0`
pub fn add_eq_0() -> @kernel.Thm {
  add_eq_0_c.get()
}

///|
/// EQ_ADD_LCANCEL
fn step_20() -> Unit raise {
  let t11 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses(), @nums.suc_inj()])),
  )
  eq_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + n == m + p) == (n == p)"),
      t11,
    ),
  )
}

///|
let eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_ADD_LCANCEL")

///|
/// `EQ_ADD_LCANCEL`
pub fn eq_add_lcancel() -> @kernel.Thm {
  eq_add_lcancel_c.get()
}

///|
/// EQ_ADD_RCANCEL
fn step_21() -> Unit raise {
  let t12 = @tactics.match_accept_tac(eq_add_lcancel())
  let t13 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t12,
  )
  eq_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + p == n + p) == (m == n)"),
      t13,
    ),
  )
}

///|
let eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_ADD_RCANCEL")

///|
/// `EQ_ADD_RCANCEL`
pub fn eq_add_rcancel() -> @kernel.Thm {
  eq_add_rcancel_c.get()
}

///|
/// EQ_ADD_LCANCEL_0
fn step_22() -> Unit raise {
  let t14 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses(), @nums.suc_inj()])),
  )
  eq_add_lcancel_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m + n == m) == (n == 0)"), t14),
  )
}

///|
let eq_add_lcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_ADD_LCANCEL_0",
)

///|
/// `EQ_ADD_LCANCEL_0`
pub fn eq_add_lcancel_0() -> @kernel.Thm {
  eq_add_lcancel_0_c.get()
}

///|
/// EQ_ADD_RCANCEL_0
fn step_23() -> Unit raise {
  let t15 = @tactics.match_accept_tac(eq_add_lcancel_0())
  let t16 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t15,
  )
  eq_add_rcancel_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m + n == n) == (m == 0)"), t16),
  )
}

///|
let eq_add_rcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_ADD_RCANCEL_0",
)

///|
/// `EQ_ADD_RCANCEL_0`
pub fn eq_add_rcancel_0() -> @kernel.Thm {
  eq_add_rcancel_0_c.get()
}

///|
/// BIT0
fn step_24() -> Unit raise {
  let t17 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([@nums.bit0_def(), add_clauses()])),
  )
  bit0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, BIT0(n) == n + n"), t17))
}

///|
let bit0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT0")

///|
/// `BIT0`
pub fn bit0() -> @kernel.Thm {
  bit0_c.get()
}

///|
/// BIT1
fn step_25() -> Unit raise {
  let t18 = @simp.rewrite_tac(@list.List([@nums.bit1_def(), bit0()]))
  bit1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, BIT1(n) == SUC(n + n)"), t18))
}

///|
let bit1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT1")

///|
/// `BIT1`
pub fn bit1() -> @kernel.Thm {
  bit1_c.get()
}

///|
/// BIT0_THM
fn step_26() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([@nums.numeral(), bit0()]))
  bit0_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, NUMERAL(BIT0(n)) == NUMERAL(n) + NUMERAL(n)"),
      t19,
    ),
  )
}

///|
let bit0_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT0_THM")

///|
/// `BIT0_THM`
pub fn bit0_thm() -> @kernel.Thm {
  bit0_thm_c.get()
}

///|
/// BIT1_THM
fn step_27() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@nums.numeral(), bit1()]))
  bit1_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, NUMERAL(BIT1(n)) == SUC(NUMERAL(n) + NUMERAL(n))"),
      t20,
    ),
  )
}

///|
let bit1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT1_THM")

///|
/// `BIT1_THM`
pub fn bit1_thm() -> @kernel.Thm {
  bit1_thm_c.get()
}

///|
/// ONE
fn step_28() -> Unit raise {
  let t21 = @simp.rewrite_tac(
    @list.List([
      bit1(),
      @simp.rewrite_rule(@list.List([@nums.numeral()]))(add_clauses()),
      @nums.numeral(),
    ]),
  )
  one_c.set(@tactics.prove(@term_syntax.parse_term("1 == SUC(0)"), t21))
}

///|
let one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONE")

///|
/// `ONE`
pub fn one() -> @kernel.Thm {
  one_c.get()
}

///|
/// TWO
fn step_29() -> Unit raise {
  let t22 = @simp.rewrite_tac(
    @list.List([
      bit0(),
      bit1(),
      @simp.rewrite_rule(@list.List([@nums.numeral()]))(add_clauses()),
      @nums.numeral(),
    ]),
  )
  two_c.set(@tactics.prove(@term_syntax.parse_term("2 == SUC(1)"), t22))
}

///|
let two_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWO")

///|
/// `TWO`
pub fn two() -> @kernel.Thm {
  two_c.get()
}

///|
/// ADD1
fn step_30() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([bit1_thm(), add_clauses()]))
  add1_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, SUC(m) == m + 1"), t23))
}

///|
let add1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD1")

///|
/// `ADD1`
pub fn add1() -> @kernel.Thm {
  add1_c.get()
}

///|
/// MULT
fn step_31() -> Unit raise {
  let t24 = @term_syntax.parse_term("(∀ n : Num, (op_star : (Num, Num) -> Num)(0, n) == 0) && (∀ m : Num, ∀ n : Num, op_star(SUC(m), n) == op_star(m, n) + n)")
  mult_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t24))
}

///|
let mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT")

///|
/// `MULT`
pub fn mult() -> @kernel.Thm {
  mult_c.get()
}

///|
/// MULT_0
fn step_32() -> Unit raise {
  let t25 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([mult(), add_clauses()])),
  )
  mult_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, m * 0 == 0"), t25))
}

///|
let mult_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_0")

///|
/// `MULT_0`
pub fn mult_0() -> @kernel.Thm {
  mult_0_c.get()
}

///|
/// MULT_SUC
fn step_33() -> Unit raise {
  let t26 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([mult(), add_clauses(), add_assoc()])),
  )
  mult_suc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m * SUC(n) == m + m * n"), t26),
  )
}

///|
let mult_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_SUC")

///|
/// `MULT_SUC`
pub fn mult_suc() -> @kernel.Thm {
  mult_suc_c.get()
}

///|
/// MULT_CLAUSES
fn step_34() -> Unit raise {
  let t27 = @simp.rewrite_tac(
    @list.List([bit1_thm(), mult(), mult_0(), mult_suc(), add_clauses()]),
  )
  mult_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, 0 * n == 0) && (∀ m : Num, m * 0 == 0) && (∀ n : Num, 1 * n == n) && (∀ m : Num, m * 1 == m) && (∀ m : Num, ∀ n : Num, SUC(m) * n == m * n + n) && (∀ m : Num, ∀ n : Num, m * SUC(n) == m + m * n)"),
      t27,
    ),
  )
}

///|
let mult_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_CLAUSES")

///|
/// `MULT_CLAUSES`
pub fn mult_clauses() -> @kernel.Thm {
  mult_clauses_c.get()
}

///|
/// MULT_SYM
fn step_35() -> Unit raise {
  let t28 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([mult_clauses(), @bool.eqt_intro(@bool.spec_all(add_sym()))]),
    ),
  )
  mult_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m * n == n * m"), t28))
}

///|
let mult_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_SYM")

///|
/// `MULT_SYM`
pub fn mult_sym() -> @kernel.Thm {
  mult_sym_c.get()
}

///|
/// LEFT_ADD_DISTRIB
fn step_36() -> Unit raise {
  let t29 = @simp.asm_rewrite_tac(
    @list.List([add(), mult_clauses(), add_assoc()]),
  )
  let t30 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t29,
  )
  left_add_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m * (n + p) == m * n + m * p"),
      t30,
    ),
  )
}

///|
let left_add_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_ADD_DISTRIB",
)

///|
/// `LEFT_ADD_DISTRIB`
pub fn left_add_distrib() -> @kernel.Thm {
  left_add_distrib_c.get()
}

///|
/// RIGHT_ADD_DISTRIB
fn step_37() -> Unit raise {
  let t31 = @tactics.match_accept_tac(left_add_distrib())
  let t32 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym()])),
    t31,
  )
  right_add_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + n) * p == m * p + n * p"),
      t32,
    ),
  )
}

///|
let right_add_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_ADD_DISTRIB",
)

///|
/// `RIGHT_ADD_DISTRIB`
pub fn right_add_distrib() -> @kernel.Thm {
  right_add_distrib_c.get()
}

///|
/// MULT_ASSOC
fn step_38() -> Unit raise {
  let t33 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([mult_clauses(), right_add_distrib()])),
  )
  mult_assoc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m * (n * p) == m * n * p"), t33),
  )
}

///|
let mult_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_ASSOC")

///|
/// `MULT_ASSOC`
pub fn mult_assoc() -> @kernel.Thm {
  mult_assoc_c.get()
}

///|
/// MULT_AC
fn step_39() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([mult_assoc(), mult_sym()]))
  mult_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(m : Num) * (n : Num) == n * m && m * n * (p : Num) == m * (n * p) && m * (n * p) == n * (m * p)"),
      t34,
    ),
  )
}

///|
let mult_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_AC")

///|
/// `MULT_AC`
pub fn mult_ac() -> @kernel.Thm {
  mult_ac_c.get()
}

///|
/// MULT_EQ_0
fn step_40() -> Unit raise {
  let t35 = @simp.rewrite_tac(
    @list.List([mult_clauses(), add_clauses(), @nums.not_suc()]),
  )
  let t36 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t35)
  mult_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m * n == 0) == (m == 0 || n == 0)"),
      t36,
    ),
  )
}

///|
let mult_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_EQ_0")

///|
/// `MULT_EQ_0`
pub fn mult_eq_0() -> @kernel.Thm {
  mult_eq_0_c.get()
}

///|
/// EQ_MULT_LCANCEL
fn step_41() -> Unit raise {
  let t39 = @simp.asm_rewrite_tac(
    @list.List([@nums.suc_inj(), @equal.gsym(add_assoc()), eq_add_lcancel()]),
  )
  let t38 = @simp.asm_rewrite_tac(
    @list.List([
      mult_clauses(),
      add_clauses(),
      @equal.gsym(@nums.not_suc()),
      @nums.not_suc(),
    ]),
  )
  let t37 = @tactics.repeat_tac(@nums.induct_tac)
  let t40 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @nums.induct_tac,
          @simp.rewrite_tac(@list.List([mult_clauses(), @nums.not_suc()])),
        ),
        t37,
      ),
      t38,
    ),
    t39,
  )
  eq_mult_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * n == m * p) == (m == 0 || n == p)"),
      t40,
    ),
  )
}

///|
let eq_mult_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_MULT_LCANCEL",
)

///|
/// `EQ_MULT_LCANCEL`
pub fn eq_mult_lcancel() -> @kernel.Thm {
  eq_mult_lcancel_c.get()
}

///|
/// EQ_MULT_RCANCEL
fn step_42() -> Unit raise {
  let t41 = @tactics.match_accept_tac(eq_mult_lcancel())
  let t42 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym(), @theorems.disj_sym()])),
    t41,
  )
  eq_mult_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * p == n * p) == (m == n || p == 0)"),
      t42,
    ),
  )
}

///|
let eq_mult_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EQ_MULT_RCANCEL",
)

///|
/// `EQ_MULT_RCANCEL`
pub fn eq_mult_rcancel() -> @kernel.Thm {
  eq_mult_rcancel_c.get()
}

///|
/// MULT_2
fn step_43() -> Unit raise {
  let t43 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(
      @list.List([bit0_thm(), mult_clauses(), right_add_distrib()]),
    ),
  )
  mult_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 2 * n == n + n"), t43))
}

///|
let mult_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_2")

///|
/// `MULT_2`
pub fn mult_2() -> @kernel.Thm {
  mult_2_c.get()
}

///|
/// MULT_EQ_1
fn step_44() -> Unit raise {
  let t46 = @tactics.conv_tac(@class.taut)
  let t45 = @simp.rewrite_tac(
    @list.List([@nums.suc_inj(), add_eq_0(), mult_eq_0()]),
  )
  let t44 = @simp.rewrite_tac(
    @list.List([
      mult_clauses(),
      add_clauses(),
      bit0_thm(),
      bit1_thm(),
      @equal.gsym(@nums.not_suc()),
    ]),
  )
  let t47 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@nums.induct_tac, @nums.induct_tac),
        t44,
      ),
      t45,
    ),
    t46,
  )
  mult_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m * n == 1) == (m == 1 && n == 1)"),
      t47,
    ),
  )
}

///|
let mult_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_EQ_1")

///|
/// `MULT_EQ_1`
pub fn mult_eq_1() -> @kernel.Thm {
  mult_eq_1_c.get()
}

///|
/// EXP
fn step_45() -> Unit raise {
  let t48 = @term_syntax.parse_term("(∀ m : Num, (EXP : (Num, Num) -> Num)(m, 0) == 1) && (∀ m : Num, ∀ n : Num, EXP(m, SUC(n)) == m * EXP(m, n))")
  exp_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t48))
}

///|
let exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP")

///|
/// `EXP`
pub fn exp() -> @kernel.Thm {
  exp_c.get()
}

///|
/// EXP_EQ_0
fn step_46() -> Unit raise {
  let t49 = @simp.asm_rewrite_tac(
    @list.List([
      bit1_thm(),
      @nums.not_suc(),
      @nums.not_suc(),
      exp(),
      mult_clauses(),
      add_clauses(),
      add_eq_0(),
    ]),
  )
  let t50 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t49)
  exp_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (EXP(m, n) == 0) == (m == 0 && !(n == 0))"),
      t50,
    ),
  )
}

///|
let exp_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_EQ_0")

///|
/// `EXP_EQ_0`
pub fn exp_eq_0() -> @kernel.Thm {
  exp_eq_0_c.get()
}

///|
/// EXP_EQ_1
fn step_47() -> Unit raise {
  let t52 = @tactics.conv_tac(@class.taut)
  let t51 = @simp.asm_rewrite_tac(
    @list.List([exp(), mult_eq_1(), @nums.not_suc()]),
  )
  let t53 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t51,
    ),
    t52,
  )
  exp_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, (EXP(x, n) == 1) == (x == 1 || n == 0)"),
      t53,
    ),
  )
}

///|
let exp_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_EQ_1")

///|
/// `EXP_EQ_1`
pub fn exp_eq_1() -> @kernel.Thm {
  exp_eq_1_c.get()
}

///|
/// EXP_ZERO
fn step_48() -> Unit raise {
  let t54 = @simp.asm_rewrite_tac(@list.List([exp_eq_0(), exp_eq_1()]))
  let t55 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
    t54,
  )
  exp_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, EXP(0, n) == (if n == 0 { 1 } else { 0 })"),
      t55,
    ),
  )
}

///|
let exp_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_ZERO")

///|
/// `EXP_ZERO`
pub fn exp_zero() -> @kernel.Thm {
  exp_zero_c.get()
}

///|
/// EXP_ADD
fn step_49() -> Unit raise {
  let t56 = @simp.asm_rewrite_tac(
    @list.List([exp(), add_clauses(), mult_clauses(), mult_ac()]),
  )
  let t57 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t56,
  )
  exp_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, EXP(m, n + p) == EXP(m, n) * EXP(m, p)"),
      t57,
    ),
  )
}

///|
let exp_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_ADD")

///|
/// `EXP_ADD`
pub fn exp_add() -> @kernel.Thm {
  exp_add_c.get()
}

///|
/// EXP_ONE
fn step_50() -> Unit raise {
  let t58 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([exp(), mult_clauses()])),
  )
  exp_one_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, EXP(1, n) == 1"), t58))
}

///|
let exp_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_ONE")

///|
/// `EXP_ONE`
pub fn exp_one() -> @kernel.Thm {
  exp_one_c.get()
}

///|
/// EXP_1
fn step_51() -> Unit raise {
  let t59 = @simp.rewrite_tac(
    @list.List([one(), exp(), mult_clauses(), add_clauses()]),
  )
  exp_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, EXP(n, 1) == n"), t59))
}

///|
let exp_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_1")

///|
/// `EXP_1`
pub fn exp_1() -> @kernel.Thm {
  exp_1_c.get()
}

///|
/// EXP_2
fn step_52() -> Unit raise {
  let t60 = @simp.rewrite_tac(
    @list.List([
      bit0_thm(),
      bit1_thm(),
      exp(),
      exp_add(),
      mult_clauses(),
      add_clauses(),
    ]),
  )
  exp_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, EXP(n, 2) == n * n"), t60))
}

///|
let exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_2")

///|
/// `EXP_2`
pub fn exp_2() -> @kernel.Thm {
  exp_2_c.get()
}

///|
/// MULT_EXP
fn step_53() -> Unit raise {
  let t61 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([exp(), mult_clauses(), mult_ac()])),
  )
  mult_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, EXP(m * n, p) == EXP(m, p) * EXP(n, p)"),
      t61,
    ),
  )
}

///|
let mult_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_EXP")

///|
/// `MULT_EXP`
pub fn mult_exp() -> @kernel.Thm {
  mult_exp_c.get()
}

///|
/// EXP_MULT
fn step_54() -> Unit raise {
  let t64 = @tactics.match_accept_tac(mult_sym())
  let t65 = @tactics.then_tac(@simp.rewrite_tac(@list.List([mult_exp()])), t64)
  let t63 = @simp.asm_rewrite_tac(@list.List([exp(), mult_clauses()]))
  let t66 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv)),
        @nums.induct_tac,
      ),
      t63,
    ),
    t65,
  ])
  let t62 = @simp.asm_rewrite_tac(
    @list.List([exp_add(), exp(), mult_clauses()]),
  )
  let t67 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t62,
    ),
    t66,
  )
  exp_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, EXP(m, n * p) == EXP(EXP(m, n), p)"),
      t67,
    ),
  )
}

///|
let exp_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_MULT")

///|
/// `EXP_MULT`
pub fn exp_mult() -> @kernel.Thm {
  exp_mult_c.get()
}

///|
/// EXP_EXP
fn step_55() -> Unit raise {
  let t68 = @simp.rewrite_tac(@list.List([exp_mult()]))
  exp_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ m : Num, ∀ n : Num, EXP(EXP(x, m), n) == EXP(x, m * n)"),
      t68,
    ),
  )
}

///|
let exp_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_EXP")

///|
/// `EXP_EXP`
pub fn exp_exp() -> @kernel.Thm {
  exp_exp_c.get()
}

///|
/// LE
fn step_56() -> Unit raise {
  let t69 = @term_syntax.parse_term("(∀ m : Num, (op_lt_eq : (Num, Num) -> Bool)(m, 0) == (m == 0)) && (∀ m : Num, ∀ n : Num, op_lt_eq(m, SUC(n)) == (m == SUC(n) || op_lt_eq(m, n)))")
  le_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t69))
}

///|
let le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE")

///|
/// `LE`
pub fn le() -> @kernel.Thm {
  le_c.get()
}

///|
/// LT
fn step_57() -> Unit raise {
  let t70 = @term_syntax.parse_term("(∀ m : Num, (op_lt : (Num, Num) -> Bool)(m, 0) == false) && (∀ m : Num, ∀ n : Num, op_lt(m, SUC(n)) == (m == n || op_lt(m, n)))")
  lt_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t70))
}

///|
let lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT")

///|
/// `LT`
pub fn lt() -> @kernel.Thm {
  lt_c.get()
}

///|
/// GE
fn step_58() -> Unit raise {
  ge_c.set(@pair.new_definition(@term_syntax.parse_term("(op_gt_eq : (Num, Num) -> Bool)((m : Num), (n : Num)) == (n <= m)")))
}

///|
let ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GE")

///|
/// `GE`
pub fn ge() -> @kernel.Thm {
  ge_c.get()
}

///|
/// GT
fn step_59() -> Unit raise {
  gt_c.set(@pair.new_definition(@term_syntax.parse_term("(op_gt : (Num, Num) -> Bool)((m : Num), (n : Num)) == (n < m)")))
}

///|
let gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GT")

///|
/// `GT`
pub fn gt() -> @kernel.Thm {
  gt_c.get()
}

///|
/// MAX
fn step_60() -> Unit raise {
  max_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MAX : (Num, Num) -> Num)(m, n) == (if m <= n { n } else { m })"),
    ),
  )
}

///|
let max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX")

///|
/// `MAX`
pub fn max() -> @kernel.Thm {
  max_c.get()
}

///|
/// MIN
fn step_61() -> Unit raise {
  min_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MIN : (Num, Num) -> Num)(m, n) == (if m <= n { m } else { n })"),
    ),
  )
}

///|
let min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MIN")

///|
/// `MIN`
pub fn min() -> @kernel.Thm {
  min_c.get()
}

///|
/// LE_SUC_LT
fn step_62() -> Unit raise {
  let t71 = @simp.asm_rewrite_tac(
    @list.List([le(), lt(), @nums.not_suc(), @nums.suc_inj()]),
  )
  let t72 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t71,
  )
  le_suc_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (SUC(m) <= n) == (m < n)"), t72),
  )
}

///|
let le_suc_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_SUC_LT")

///|
/// `LE_SUC_LT`
pub fn le_suc_lt() -> @kernel.Thm {
  le_suc_lt_c.get()
}

///|
/// LT_SUC_LE
fn step_63() -> Unit raise {
  let t75 = @simp.rewrite_tac(@list.List([lt()]))
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @simp.once_rewrite_tac(@list.List([lt(), le()]))
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
        t73,
      ),
      t74,
    ),
    t75,
  )
  lt_suc_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m < SUC(n)) == (m <= n)"), t76),
  )
}

///|
let lt_suc_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_SUC_LE")

///|
/// `LT_SUC_LE`
pub fn lt_suc_le() -> @kernel.Thm {
  lt_suc_le_c.get()
}

///|
/// LE_SUC
fn step_64() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([le_suc_lt(), lt_suc_le()]))
  le_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (SUC(m) <= SUC(n)) == (m <= n)"),
      t77,
    ),
  )
}

///|
let le_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_SUC")

///|
/// `LE_SUC`
pub fn le_suc() -> @kernel.Thm {
  le_suc_c.get()
}

///|
/// LT_SUC
fn step_65() -> Unit raise {
  let t78 = @simp.rewrite_tac(@list.List([lt_suc_le(), le_suc_lt()]))
  lt_suc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (SUC(m) < SUC(n)) == (m < n)"), t78),
  )
}

///|
let lt_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_SUC")

///|
/// `LT_SUC`
pub fn lt_suc() -> @kernel.Thm {
  lt_suc_c.get()
}

///|
/// LE_0
fn step_66() -> Unit raise {
  let t79 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([le()])),
  )
  le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 0 <= n"), t79))
}

///|
let le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_0")

///|
/// `LE_0`
pub fn le_0() -> @kernel.Thm {
  le_0_c.get()
}

///|
/// LT_0
fn step_67() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([lt_suc_le(), le_0()]))
  lt_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 0 < SUC(n)"), t80))
}

///|
let lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_0")

///|
/// `LT_0`
pub fn lt_0() -> @kernel.Thm {
  lt_0_c.get()
}

///|
/// LE_REFL
fn step_68() -> Unit raise {
  let t81 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.rewrite_tac(@list.List([le()])),
  )
  le_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= n"), t81))
}

///|
let le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_REFL")

///|
/// `LE_REFL`
pub fn le_refl() -> @kernel.Thm {
  le_refl_c.get()
}

///|
/// LT_REFL
fn step_69() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([lt()]))
  let t83 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(@list.List([lt_suc()])),
    ),
    t82,
  )
  lt_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n < n)"), t83))
}

///|
let lt_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_REFL")

///|
/// `LT_REFL`
pub fn lt_refl() -> @kernel.Thm {
  lt_refl_c.get()
}

///|
/// LT_IMP_NE
fn step_70() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([lt_refl()]))
  lt_imp_ne_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → !(m == n)"), t84),
  )
}

///|
let lt_imp_ne_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_IMP_NE")

///|
/// `LT_IMP_NE`
pub fn lt_imp_ne() -> @kernel.Thm {
  lt_imp_ne_c.get()
}

///|
/// LE_ANTISYM
fn step_71() -> Unit raise {
  let t86 = @simp.rewrite_tac(
    @list.List([le(), @nums.not_suc(), @equal.gsym(@nums.not_suc())]),
  )
  let t85 = @simp.asm_rewrite_tac(@list.List([le_suc(), @nums.suc_inj()]))
  let t87 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t85),
    t86,
  )
  le_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m <= n && n <= m) == (m == n)"),
      t87,
    ),
  )
}

///|
let le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ANTISYM")

///|
/// `LE_ANTISYM`
pub fn le_antisym() -> @kernel.Thm {
  le_antisym_c.get()
}

///|
/// LT_ANTISYM
fn step_72() -> Unit raise {
  let t89 = @simp.rewrite_tac(@list.List([lt()]))
  let t88 = @simp.asm_rewrite_tac(@list.List([lt_suc()]))
  let t90 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t88),
    t89,
  )
  lt_antisym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m < n && n < m)"), t90),
  )
}

///|
let lt_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ANTISYM")

///|
/// `LT_ANTISYM`
pub fn lt_antisym() -> @kernel.Thm {
  lt_antisym_c.get()
}

///|
/// LET_ANTISYM
fn step_73() -> Unit raise {
  let t92 = @simp.rewrite_tac(@list.List([le(), lt(), @nums.not_suc()]))
  let t91 = @simp.asm_rewrite_tac(@list.List([le_suc(), lt_suc()]))
  let t93 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t91),
    t92,
  )
  let_antisym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m <= n && n < m)"), t93),
  )
}

///|
let let_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_ANTISYM")

///|
/// `LET_ANTISYM`
pub fn let_antisym() -> @kernel.Thm {
  let_antisym_c.get()
}

///|
/// LTE_ANTISYM
fn step_74() -> Unit raise {
  let t94 = @simp.rewrite_tac(@list.List([let_antisym()]))
  let t95 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])),
    t94,
  )
  lte_antisym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m < n && n <= m)"), t95),
  )
}

///|
let lte_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LTE_ANTISYM")

///|
/// `LTE_ANTISYM`
pub fn lte_antisym() -> @kernel.Thm {
  lte_antisym_c.get()
}

///|
/// LE_TRANS
fn step_75() -> Unit raise {
  let t97 = @simp.rewrite_tac(@list.List([le(), @nums.not_suc()]))
  let t96 = @simp.asm_rewrite_tac(@list.List([le_suc(), le_0()]))
  let t98 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t96),
    t97,
  )
  le_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n && n <= p → m <= p"),
      t98,
    ),
  )
}

///|
let le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_TRANS")

///|
/// `LE_TRANS`
pub fn le_trans() -> @kernel.Thm {
  le_trans_c.get()
}

///|
/// LT_TRANS
fn step_76() -> Unit raise {
  let t100 = @simp.rewrite_tac(@list.List([lt(), @nums.not_suc()]))
  let t99 = @simp.asm_rewrite_tac(@list.List([lt_suc(), lt_0()]))
  let t101 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t99),
    t100,
  )
  lt_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m < n && n < p → m < p"),
      t101,
    ),
  )
}

///|
let lt_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_TRANS")

///|
/// `LT_TRANS`
pub fn lt_trans() -> @kernel.Thm {
  lt_trans_c.get()
}

///|
/// LET_TRANS
fn step_77() -> Unit raise {
  let t103 = @simp.rewrite_tac(@list.List([lt(), le(), @nums.not_suc()]))
  let t102 = @simp.asm_rewrite_tac(@list.List([le_suc(), lt_suc(), lt_0()]))
  let t104 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t102),
    t103,
  )
  let_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n && n < p → m < p"),
      t104,
    ),
  )
}

///|
let let_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_TRANS")

///|
/// `LET_TRANS`
pub fn let_trans() -> @kernel.Thm {
  let_trans_c.get()
}

///|
/// LTE_TRANS
fn step_78() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([lt(), le(), @nums.not_suc()]))
  let t105 = @simp.asm_rewrite_tac(@list.List([le_suc(), lt_suc(), lt_0()]))
  let t107 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t105),
    t106,
  )
  lte_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m < n && n <= p → m < p"),
      t107,
    ),
  )
}

///|
let lte_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LTE_TRANS")

///|
/// `LTE_TRANS`
pub fn lte_trans() -> @kernel.Thm {
  lte_trans_c.get()
}

///|
/// LE_CASES
fn step_79() -> Unit raise {
  let t108 = @simp.asm_rewrite_tac(@list.List([le_0(), le_suc()]))
  let t109 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t108)
  le_cases_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n || n <= m"), t109),
  )
}

///|
let le_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_CASES")

///|
/// `LE_CASES`
pub fn le_cases() -> @kernel.Thm {
  le_cases_c.get()
}

///|
/// LT_CASES
fn step_80() -> Unit raise {
  let t128 = @simp.rewrite_tac(@list.List([lt_0()]))
  let t111 = @simp.rewrite_tac(
    @list.List([lt(), @nums.not_suc(), @equal.gsym(@nums.not_suc())]),
  )
  let t110 = @simp.asm_rewrite_tac(@list.List([lt_suc(), @nums.suc_inj()]))
  let t129 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t110),
          t111,
        ),
        fn(
          x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x124 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x122 : @list.List[@kernel.Term],
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x121 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
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
                  ) -> ((@kernel.Term) -> ((
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
                  ) raise) raise) raise {
                    fn(
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
                      let s119 = ((x115 : @kernel.Term, x116 : @kernel.Term) => {
                        @lib.curry(
                          fn(
                            x112 : (@kernel.Term, @kernel.Term),
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
                            let s113 = @tactics.spec_tac(x112.0, x112.1)
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
                              s113(x114)
                            }
                          },
                          x115,
                          x116,
                        )
                      })(x117, x118)
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
                        s119(x120)
                      }
                    }
                  })(x121)(x121)
                })(@lib.hd(x122))
              })(
                (fn(x123 : @kernel.Term) -> @list.List[@kernel.Term] raise {
                  @kernel.frees(x123)
                })(x124),
              )
            })(
              (fn(
                x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x125.1
              })(x126),
            )
          })(x127)(x127)
        },
      ),
      @nums.induct_tac,
    ),
    t128,
  )
  lt_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n || n < m || m == n"),
      t129,
    ),
  )
}

///|
let lt_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_CASES")

///|
/// `LT_CASES`
pub fn lt_cases() -> @kernel.Thm {
  lt_cases_c.get()
}

///|
/// LET_CASES
fn step_81() -> Unit raise {
  let t130 = @simp.asm_rewrite_tac(
    @list.List([le_suc_lt(), lt_suc_le(), le_0()]),
  )
  let t131 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t130)
  let_cases_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n || n < m"), t131),
  )
}

///|
let let_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_CASES")

///|
/// `LET_CASES`
pub fn let_cases() -> @kernel.Thm {
  let_cases_c.get()
}

///|
/// LTE_CASES
fn step_82() -> Unit raise {
  let t132 = @tactics.match_accept_tac(let_cases())
  let t133 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()])),
    t132,
  )
  lte_cases_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n || n <= m"), t133),
  )
}

///|
let lte_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LTE_CASES")

///|
/// `LTE_CASES`
pub fn lte_cases() -> @kernel.Thm {
  lte_cases_c.get()
}

///|
/// LE_LT
fn step_83() -> Unit raise {
  let t135 = @simp.rewrite_tac(@list.List([le(), lt()]))
  let t134 = @simp.asm_rewrite_tac(
    @list.List([le_suc(), lt_suc(), @nums.suc_inj(), le_0(), lt_0()]),
  )
  let t136 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t134),
    t135,
  )
  le_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m <= n) == (m < n || m == n)"),
      t136,
    ),
  )
}

///|
let le_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_LT")

///|
/// `LE_LT`
pub fn le_lt() -> @kernel.Thm {
  le_lt_c.get()
}

///|
/// LT_LE
fn step_84() -> Unit raise {
  let t150 = @simp.asm_rewrite_tac(@list.List([]))
  let t151 = @tactics.then_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(
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
      }),
    ),
    t150,
  )
  let t146 = @simp.rewrite_tac(@list.List([lt_refl()]))
  let t145 = @tactics.pop_assum(fn(
    x142 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s143 = @tactics.mp_tac(x142)
    fn(
      x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s143(x144)
    }
  })
  let t141 = @tactics.disch_then(fn(
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
    let s139 = @tactics.subst_all_tac(x138)
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
  })
  let t152 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_tac,
            @simp.asm_rewrite_tac(@list.List([])),
          ),
          t141,
        ),
        t145,
      ),
      t146,
    ),
    t151,
  ])
  let t137 = @tactics.repeat_tac(@tactics.gen_tac)
  let t153 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([le_lt()])), t137),
      @tactics.eq_tac,
    ),
    t152,
  )
  lt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m < n) == (m <= n && !(m == n))"),
      t153,
    ),
  )
}

///|
let lt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_LE")

///|
/// `LT_LE`
pub fn lt_le() -> @kernel.Thm {
  lt_le_c.get()
}

///|
/// NOT_LE
fn step_85() -> Unit raise {
  let t172 = @simp.rewrite_tac(@list.List([lt_0()]))
  let t155 = @simp.rewrite_tac(
    @list.List([
      le(),
      lt(),
      @nums.not_suc(),
      @equal.gsym(@nums.not_suc()),
      le_0(),
    ]),
  )
  let t154 = @simp.asm_rewrite_tac(@list.List([le_suc(), lt_suc()]))
  let t173 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t154),
          t155,
        ),
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
          (fn(
            x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x168 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x166 : @list.List[@kernel.Term],
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x165 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x161 : @kernel.Term,
                  ) -> ((@kernel.Term) -> ((
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
                  ) raise) raise) raise {
                    fn(
                      x162 : @kernel.Term,
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
                      let s163 = ((x159 : @kernel.Term, x160 : @kernel.Term) => {
                        @lib.curry(
                          fn(
                            x156 : (@kernel.Term, @kernel.Term),
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
                            let s157 = @tactics.spec_tac(x156.0, x156.1)
                            fn(
                              x158 : (
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
                              s157(x158)
                            }
                          },
                          x159,
                          x160,
                        )
                      })(x161, x162)
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
                        s163(x164)
                      }
                    }
                  })(x165)(x165)
                })(@lib.hd(x166))
              })(
                (fn(x167 : @kernel.Term) -> @list.List[@kernel.Term] raise {
                  @kernel.frees(x167)
                })(x168),
              )
            })(
              (fn(
                x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x169.1
              })(x170),
            )
          })(x171)(x171)
        },
      ),
      @nums.induct_tac,
    ),
    t172,
  )
  not_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m <= n) == (n < m)"), t173),
  )
}

///|
let not_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LE")

///|
/// `NOT_LE`
pub fn not_le() -> @kernel.Thm {
  not_le_c.get()
}

///|
/// NOT_LT
fn step_86() -> Unit raise {
  let t192 = @simp.rewrite_tac(@list.List([lt_0()]))
  let t175 = @simp.rewrite_tac(
    @list.List([
      le(),
      lt(),
      @nums.not_suc(),
      @equal.gsym(@nums.not_suc()),
      le_0(),
    ]),
  )
  let t174 = @simp.asm_rewrite_tac(@list.List([le_suc(), lt_suc()]))
  let t193 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t174),
          t175,
        ),
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
          (fn(
            x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x188 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x186 : @list.List[@kernel.Term],
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x185 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x181 : @kernel.Term,
                  ) -> ((@kernel.Term) -> ((
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
                  ) raise) raise) raise {
                    fn(
                      x182 : @kernel.Term,
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
                      let s183 = ((x179 : @kernel.Term, x180 : @kernel.Term) => {
                        @lib.curry(
                          fn(
                            x176 : (@kernel.Term, @kernel.Term),
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
                            let s177 = @tactics.spec_tac(x176.0, x176.1)
                            fn(
                              x178 : (
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
                              s177(x178)
                            }
                          },
                          x179,
                          x180,
                        )
                      })(x181, x182)
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
                        s183(x184)
                      }
                    }
                  })(x185)(x185)
                })(@lib.hd(x186))
              })(
                (fn(x187 : @kernel.Term) -> @list.List[@kernel.Term] raise {
                  @kernel.frees(x187)
                })(x188),
              )
            })(
              (fn(
                x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x189.1
              })(x190),
            )
          })(x191)(x191)
        },
      ),
      @nums.induct_tac,
    ),
    t192,
  )
  not_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m < n) == (n <= m)"), t193),
  )
}

///|
let not_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LT")

///|
/// `NOT_LT`
pub fn not_lt() -> @kernel.Thm {
  not_lt_c.get()
}

///|
/// LT_IMP_LE
fn step_87() -> Unit raise {
  let t195 = @simp.asm_rewrite_tac(@list.List([]))
  let t194 = @tactics.repeat_tac(@tactics.strip_tac)
  let t196 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([lt_le()])), t194),
    t195,
  )
  lt_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → m <= n"), t196),
  )
}

///|
let lt_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_IMP_LE")

///|
/// `LT_IMP_LE`
pub fn lt_imp_le() -> @kernel.Thm {
  lt_imp_le_c.get()
}

///|
/// EQ_IMP_LE
fn step_88() -> Unit raise {
  let t197 = @simp.asm_rewrite_tac(@list.List([le_refl()]))
  let t198 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t197)
  eq_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m == n → m <= n"), t198),
  )
}

///|
let eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_IMP_LE")

///|
/// `EQ_IMP_LE`
pub fn eq_imp_le() -> @kernel.Thm {
  eq_imp_le_c.get()
}

///|
/// LT_NZ
fn step_89() -> Unit raise {
  let t199 = @tactics.conv_tac(@class.taut)
  let t200 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(
        @list.List([@nums.not_suc(), lt(), @theorems.eq_sym_eq()]),
      ),
    ),
    t199,
  )
  lt_nz_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, (0 < n) == !(n == 0)"), t200),
  )
}

///|
let lt_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_NZ")

///|
/// `LT_NZ`
pub fn lt_nz() -> @kernel.Thm {
  lt_nz_c.get()
}

///|
/// LE_1
fn step_90() -> Unit raise {
  let t201 = @simp.rewrite_tac(
    @list.List([lt_nz(), @equal.gsym(not_lt()), one(), lt()]),
  )
  le_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, !(n == 0) → 0 < n) && (∀ n : Num, !(n == 0) → 1 <= n) && (∀ n : Num, 0 < n → !(n == 0)) && (∀ n : Num, 0 < n → 1 <= n) && (∀ n : Num, 1 <= n → 0 < n) && (∀ n : Num, 1 <= n → !(n == 0))"),
      t201,
    ),
  )
}

///|
let le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_1")

///|
/// `LE_1`
pub fn le_1() -> @kernel.Thm {
  le_1_c.get()
}

///|
/// LE_EXISTS
fn step_91() -> Unit raise {
  let t225 = @simp.rewrite_tac(
    @list.List([eq_add_lcancel(), @equal.gsym(@theorems.exists_refl())]),
  )
  let t224 = @simp.rewrite_tac(@list.List([]))
  let t223 = @tactics.disch_then(fn(
    x220 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s221 = @tactics.subst1_tac(x220)
    fn(
      x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s221(x222)
    }
  })
  let t219 = @simp.rewrite_tac(@list.List([add_clauses(), @nums.suc_inj()]))
  let t226 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(
                @list.List([@theorems.left_imp_exists_thm()]),
              ),
              @nums.induct_tac,
            ),
            t219,
          ),
          t223,
        ),
        t224,
      ),
      @tactics.disj2_tac,
    ),
    t225,
  )
  let t216 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t215 = @tactics.exists_tac(@term_syntax.parse_term("SUC((d : Num))"))
  let t217 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
          x212 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s213 = @tactics.subst1_tac(x212)
          fn(
            x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s213(x214)
          }
        }),
      ),
      t215,
    ),
    t216,
  )
  let t211 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t218 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t211),
    t217,
  ])
  let t227 = @tactics.thenl(
    @tactics.eq_tac,
    @list.List([
      @tactics.thenl(
        @tactics.disch_then(
          @tactics.disj_cases_then2(
            fn(
              x205 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s206 = @tactics.subst1_tac(x205)
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
                s206(x207)
              }
            },
            fn(
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
              let s209 = @tactics.mp_tac(x208)
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
            },
          ),
        ),
        t218,
      ),
      t226,
    ]),
  )
  let t204 = @simp.rewrite_tac(
    @list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl()]),
  )
  let t203 = @bool.spec_all(add_eq_0())
  let t228 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.conv_rule(@equal.land_conv(@equal.sym_conv), t203)]),
      ),
      t204,
    ),
    t227,
  ])
  let t202 = @simp.asm_rewrite_tac(@list.List([le()]))
  let t229 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t202,
    ),
    t228,
  )
  le_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m <= n) == (∃ d : Num, n == m + d)"),
      t229,
    ),
  )
}

///|
let le_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_EXISTS")

///|
/// `LE_EXISTS`
pub fn le_exists() -> @kernel.Thm {
  le_exists_c.get()
}

///|
/// LT_EXISTS
fn step_92() -> Unit raise {
  let t252 = @simp.rewrite_tac(
    @list.List([
      @nums.suc_inj(),
      eq_add_lcancel(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t251 = @simp.rewrite_tac(@list.List([]))
  let t250 = @tactics.disch_then(fn(
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
    let s248 = @tactics.subst1_tac(x247)
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
  let t246 = @simp.rewrite_tac(@list.List([add_clauses(), @nums.suc_inj()]))
  let t253 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(
                @list.List([@theorems.left_imp_exists_thm()]),
              ),
              @nums.induct_tac,
            ),
            t246,
          ),
          t250,
        ),
        t251,
      ),
      @tactics.disj2_tac,
    ),
    t252,
  )
  let t243 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t242 = @tactics.exists_tac(@term_syntax.parse_term("SUC((d : Num))"))
  let t244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
          x239 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s240 = @tactics.subst1_tac(x239)
          fn(
            x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s240(x241)
          }
        }),
      ),
      t242,
    ),
    t243,
  )
  let t238 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t245 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t238),
    t244,
  ])
  let t254 = @list.List([
    @tactics.thenl(
      @tactics.disch_then(
        @tactics.disj_cases_then2(
          fn(
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
          },
          fn(
            x235 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s236 = @tactics.mp_tac(x235)
            fn(
              x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s236(x237)
            }
          },
        ),
      ),
      t245,
    ),
    t253,
  ])
  let t231 = @simp.asm_rewrite_tac(@list.List([@nums.suc_inj()]))
  let t230 = @simp.rewrite_tac(
    @list.List([lt(), add_clauses(), @equal.gsym(@nums.not_suc())]),
  )
  let t255 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
          t230,
        ),
        t231,
      ),
      @tactics.eq_tac,
    ),
    t254,
  )
  lt_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m < n) == (∃ d : Num, n == m + SUC(d))"),
      t255,
    ),
  )
}

///|
let lt_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_EXISTS")

///|
/// `LT_EXISTS`
pub fn lt_exists() -> @kernel.Thm {
  lt_exists_c.get()
}

///|
/// LE_ADD
fn step_93() -> Unit raise {
  let t256 = @simp.asm_rewrite_tac(@list.List([le(), add_clauses(), le_refl()]))
  let t257 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t256,
  )
  le_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= m + n"), t257))
}

///|
let le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ADD")

///|
/// `LE_ADD`
pub fn le_add() -> @kernel.Thm {
  le_add_c.get()
}

///|
/// LE_ADDR
fn step_94() -> Unit raise {
  let t258 = @tactics.match_accept_tac(le_add())
  let t259 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t258,
  )
  le_addr_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n <= m + n"), t259))
}

///|
let le_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ADDR")

///|
/// `LE_ADDR`
pub fn le_addr() -> @kernel.Thm {
  le_addr_c.get()
}

///|
/// LT_ADD
fn step_95() -> Unit raise {
  let t260 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses(), lt_suc()])),
  )
  lt_add_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m < m + n) == (0 < n)"), t260),
  )
}

///|
let lt_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ADD")

///|
/// `LT_ADD`
pub fn lt_add() -> @kernel.Thm {
  lt_add_c.get()
}

///|
/// LT_ADDR
fn step_96() -> Unit raise {
  let t261 = @tactics.match_accept_tac(lt_add())
  let t262 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t261,
  )
  lt_addr_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (n < m + n) == (0 < m)"), t262),
  )
}

///|
let lt_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ADDR")

///|
/// `LT_ADDR`
pub fn lt_addr() -> @kernel.Thm {
  lt_addr_c.get()
}

///|
/// LE_ADD_LCANCEL
fn step_97() -> Unit raise {
  let t263 = @simp.rewrite_tac(
    @list.List([le_exists(), @equal.gsym(add_assoc()), eq_add_lcancel()]),
  )
  le_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + n <= m + p) == (n <= p)"),
      t263,
    ),
  )
}

///|
let le_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ADD_LCANCEL")

///|
/// `LE_ADD_LCANCEL`
pub fn le_add_lcancel() -> @kernel.Thm {
  le_add_lcancel_c.get()
}

///|
/// LE_ADD_RCANCEL
fn step_98() -> Unit raise {
  let t264 = @tactics.match_accept_tac(le_add_lcancel())
  let t265 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t264,
  )
  le_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + p <= n + p) == (m <= n)"),
      t265,
    ),
  )
}

///|
let le_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ADD_RCANCEL")

///|
/// `LE_ADD_RCANCEL`
pub fn le_add_rcancel() -> @kernel.Thm {
  le_add_rcancel_c.get()
}

///|
/// LT_ADD_LCANCEL
fn step_99() -> Unit raise {
  let t266 = @simp.rewrite_tac(
    @list.List([
      lt_exists(),
      @equal.gsym(add_assoc()),
      eq_add_lcancel(),
      @nums.suc_inj(),
    ]),
  )
  lt_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + n < m + p) == (n < p)"),
      t266,
    ),
  )
}

///|
let lt_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ADD_LCANCEL")

///|
/// `LT_ADD_LCANCEL`
pub fn lt_add_lcancel() -> @kernel.Thm {
  lt_add_lcancel_c.get()
}

///|
/// LT_ADD_RCANCEL
fn step_100() -> Unit raise {
  let t267 = @tactics.match_accept_tac(lt_add_lcancel())
  let t268 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t267,
  )
  lt_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m + p < n + p) == (m < n)"),
      t268,
    ),
  )
}

///|
let lt_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ADD_RCANCEL")

///|
/// `LT_ADD_RCANCEL`
pub fn lt_add_rcancel() -> @kernel.Thm {
  lt_add_rcancel_c.get()
}

///|
/// LE_ADD2
fn step_101() -> Unit raise {
  let t276 = @simp.asm_rewrite_tac(@list.List([add_ac()]))
  let t275 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) + (b : Num)"))
  let t272 = @term_syntax.parse_term("(b : Num)")
  let t270 = @term_syntax.parse_term("(a : Num)")
  let t274 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x271 : @kernel.Thm) => @tactics.x_choose_tac(t270, x271),
      (x273 : @kernel.Thm) => @tactics.x_choose_tac(t272, x273),
    ),
  )
  let t269 = @simp.rewrite_tac(@list.List([le_exists()]))
  let t277 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t269),
        t274,
      ),
      t275,
    ),
    t276,
  )
  le_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m <= p && n <= q → m + n <= p + q"),
      t277,
    ),
  )
}

///|
let le_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_ADD2")

///|
/// `LE_ADD2`
pub fn le_add2() -> @kernel.Thm {
  le_add2_c.get()
}

///|
/// LET_ADD2
fn step_102() -> Unit raise {
  let t285 = @simp.asm_rewrite_tac(
    @list.List([@nums.suc_inj(), add_clauses(), add_ac()]),
  )
  let t284 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) + (b : Num)"))
  let t281 = @term_syntax.parse_term("(b : Num)")
  let t279 = @term_syntax.parse_term("(a : Num)")
  let t283 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x280 : @kernel.Thm) => @tactics.x_choose_tac(t279, x280),
      (x282 : @kernel.Thm) => @tactics.x_choose_tac(t281, x282),
    ),
  )
  let t278 = @simp.rewrite_tac(@list.List([le_exists(), lt_exists()]))
  let t286 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t278),
        t283,
      ),
      t284,
    ),
    t285,
  )
  let_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m <= p && n < q → m + n < p + q"),
      t286,
    ),
  )
}

///|
let let_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_ADD2")

///|
/// `LET_ADD2`
pub fn let_add2() -> @kernel.Thm {
  let_add2_c.get()
}

///|
/// LTE_ADD2
fn step_103() -> Unit raise {
  let t287 = @tactics.match_accept_tac(let_add2())
  let t288 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym(), @theorems.conj_sym()])),
    t287,
  )
  lte_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m < p && n <= q → m + n < p + q"),
      t288,
    ),
  )
}

///|
let lte_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LTE_ADD2")

///|
/// `LTE_ADD2`
pub fn lte_add2() -> @kernel.Thm {
  lte_add2_c.get()
}

///|
/// LT_ADD2
fn step_104() -> Unit raise {
  let t292 = @simp.asm_rewrite_tac(@list.List([]))
  let t291 = @tactics.match_mp_tac(lt_imp_le())
  let t290 = @simp.asm_rewrite_tac(@list.List([]))
  let t289 = @tactics.match_mp_tac(lte_add2())
  let t293 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t289),
        t290,
      ),
      t291,
    ),
    t292,
  )
  lt_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m < p && n < q → m + n < p + q"),
      t293,
    ),
  )
}

///|
let lt_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_ADD2")

///|
/// `LT_ADD2`
pub fn lt_add2() -> @kernel.Thm {
  lt_add2_c.get()
}

///|
/// LT_MULT
fn step_105() -> Unit raise {
  let t294 = @simp.rewrite_tac(
    @list.List([mult_clauses(), add_clauses(), lt_0()]),
  )
  let t295 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t294)
  lt_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (0 < m * n) == (0 < m && 0 < n)"),
      t295,
    ),
  )
}

///|
let lt_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_MULT")

///|
/// `LT_MULT`
pub fn lt_mult() -> @kernel.Thm {
  lt_mult_c.get()
}

///|
/// LE_MULT2
fn step_106() -> Unit raise {
  let t304 = @simp.rewrite_tac(
    @list.List([left_add_distrib(), right_add_distrib(), add_assoc()]),
  )
  let t303 = @simp.asm_rewrite_tac(@list.List([left_add_distrib()]))
  let t302 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (p : Num) + ((m : Num) * (b : Num) + a * b)"))
  let t299 = @term_syntax.parse_term("(b : Num)")
  let t297 = @term_syntax.parse_term("(a : Num)")
  let t301 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x298 : @kernel.Thm) => @tactics.x_choose_tac(t297, x298),
      (x300 : @kernel.Thm) => @tactics.x_choose_tac(t299, x300),
    ),
  )
  let t296 = @simp.rewrite_tac(@list.List([le_exists()]))
  let t305 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t296),
          t301,
        ),
        t302,
      ),
      t303,
    ),
    t304,
  )
  le_mult2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m <= n && p <= q → m * p <= n * q"),
      t305,
    ),
  )
}

///|
let le_mult2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_MULT2")

///|
/// `LE_MULT2`
pub fn le_mult2() -> @kernel.Thm {
  le_mult2_c.get()
}

///|
/// LT_LMULT
fn step_107() -> Unit raise {
  let t308 = @simp.asm_rewrite_tac(@list.List([eq_mult_lcancel()]))
  let t307 = @simp.asm_rewrite_tac(@list.List([le_refl()]))
  let t309 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(le_mult2()), t307),
    t308,
  ])
  let t306 = @simp.rewrite_tac(@list.List([lt_le()]))
  let t310 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t306),
        @tactics.strip_tac,
      ),
      @tactics.conj_tac,
    ),
    t309,
  )
  lt_lmult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, !(m == 0) && n < p → m * n < m * p"),
      t310,
    ),
  )
}

///|
let lt_lmult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_LMULT")

///|
/// `LT_LMULT`
pub fn lt_lmult() -> @kernel.Thm {
  lt_lmult_c.get()
}

///|
/// LE_MULT_LCANCEL
fn step_108() -> Unit raise {
  let t314 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@lib.el(4, @bool.conjuncts_rule(mult_clauses()))),
      @nums.not_suc(),
    ]),
  )
  let t313 = @simp.rewrite_tac(
    @list.List([le(), le_add_lcancel(), @equal.gsym(add_assoc())]),
  )
  let t312 = @simp.rewrite_tac(@list.List([le_suc()]))
  let t311 = @simp.asm_rewrite_tac(
    @list.List([
      mult_clauses(),
      add_clauses(),
      le_refl(),
      le_0(),
      @nums.not_suc(),
    ]),
  )
  let t315 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t311),
        t312,
      ),
      t313,
    ),
    t314,
  )
  le_mult_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * n <= m * p) == (m == 0 || n <= p)"),
      t315,
    ),
  )
}

///|
let le_mult_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LE_MULT_LCANCEL",
)

///|
/// `LE_MULT_LCANCEL`
pub fn le_mult_lcancel() -> @kernel.Thm {
  le_mult_lcancel_c.get()
}

///|
/// LE_MULT_RCANCEL
fn step_109() -> Unit raise {
  let t316 = @tactics.match_accept_tac(le_mult_lcancel())
  let t317 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym(), @theorems.disj_sym()])),
    t316,
  )
  le_mult_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * p <= n * p) == (m <= n || p == 0)"),
      t317,
    ),
  )
}

///|
let le_mult_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LE_MULT_RCANCEL",
)

///|
/// `LE_MULT_RCANCEL`
pub fn le_mult_rcancel() -> @kernel.Thm {
  le_mult_rcancel_c.get()
}

///|
/// LT_MULT_LCANCEL
fn step_110() -> Unit raise {
  let t321 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@lib.el(4, @bool.conjuncts_rule(mult_clauses()))),
      @nums.not_suc(),
    ]),
  )
  let t320 = @simp.rewrite_tac(
    @list.List([lt(), lt_add_lcancel(), @equal.gsym(add_assoc())]),
  )
  let t319 = @simp.rewrite_tac(@list.List([lt_suc()]))
  let t318 = @simp.asm_rewrite_tac(
    @list.List([
      mult_clauses(),
      add_clauses(),
      lt_refl(),
      lt_0(),
      @nums.not_suc(),
    ]),
  )
  let t322 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t318),
        t319,
      ),
      t320,
    ),
    t321,
  )
  lt_mult_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * n < m * p) == (!(m == 0) && n < p)"),
      t322,
    ),
  )
}

///|
let lt_mult_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LT_MULT_LCANCEL",
)

///|
/// `LT_MULT_LCANCEL`
pub fn lt_mult_lcancel() -> @kernel.Thm {
  lt_mult_lcancel_c.get()
}

///|
/// LT_MULT_RCANCEL
fn step_111() -> Unit raise {
  let t323 = @tactics.match_accept_tac(lt_mult_lcancel())
  let t324 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym(), @theorems.conj_sym()])),
    t323,
  )
  lt_mult_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m * p < n * p) == (m < n && !(p == 0))"),
      t324,
    ),
  )
}

///|
let lt_mult_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LT_MULT_RCANCEL",
)

///|
/// `LT_MULT_RCANCEL`
pub fn lt_mult_rcancel() -> @kernel.Thm {
  lt_mult_rcancel_c.get()
}

///|
/// LT_MULT2
fn step_112() -> Unit raise {
  let t330 = @simp.simp_tac(@list.List([lt()]))
  let t329 = @tactics.conv_tac(@class.contrapos_conv)
  let t328 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) < (n : Num)"))
  let t327 = @simp.asm_simp_tac(
    @list.List([le_mult_rcancel(), lt_imp_le(), lt_mult_lcancel()]),
  )
  let t326 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) * (p : Num)"))
  let t325 = @tactics.match_mp_tac(let_trans())
  let t331 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t325),
            t326,
          ),
          t327,
        ),
        t328,
      ),
      t329,
    ),
    t330,
  )
  lt_mult2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m < n && p < q → m * p < n * q"),
      t331,
    ),
  )
}

///|
let lt_mult2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_MULT2")

///|
/// `LT_MULT2`
pub fn lt_mult2() -> @kernel.Thm {
  lt_mult2_c.get()
}

///|
/// LE_SQUARE_REFL
fn step_113() -> Unit raise {
  let t332 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.rewrite_tac(@list.List([mult_clauses(), le_0(), le_addr()])),
  )
  le_square_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, n <= n * n"), t332),
  )
}

///|
let le_square_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_SQUARE_REFL")

///|
/// `LE_SQUARE_REFL`
pub fn le_square_refl() -> @kernel.Thm {
  le_square_refl_c.get()
}

///|
/// LT_POW2_REFL
fn step_114() -> Unit raise {
  let t337 = @meson.meson_tac(@list.List([exp_eq_0(), le_1(), @nums.not_suc()]))
  let t336 = @simp.asm_rewrite_tac(@list.List([le_suc_lt(), two()]))
  let t335 = @tactics.match_mp_tac(lte_add2())
  let t334 = @simp.rewrite_tac(@list.List([one(), lt()]))
  let t333 = @simp.rewrite_tac(@list.List([mult_2(), add1()]))
  let t338 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @nums.induct_tac,
              @simp.rewrite_tac(@list.List([exp()])),
            ),
            t333,
          ),
          t334,
        ),
        t335,
      ),
      t336,
    ),
    t337,
  )
  lt_pow2_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, n < EXP(2, n)"), t338),
  )
}

///|
let lt_pow2_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_POW2_REFL")

///|
/// `LT_POW2_REFL`
pub fn lt_pow2_refl() -> @kernel.Thm {
  lt_pow2_refl_c.get()
}

///|
/// WLOG_LE
fn step_115() -> Unit raise {
  let t339 = @meson.meson_tac(@list.List([le_cases()]))
  wlog_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (P : (Num, Num) -> Bool)(m, n) == P(n, m)) && (∀ m : Num, ∀ n : Num, m <= n → P(m, n)) → (∀ m : Num, ∀ n : Num, P(m, n))"),
      t339,
    ),
  )
}

///|
let wlog_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WLOG_LE")

///|
/// `WLOG_LE`
pub fn wlog_le() -> @kernel.Thm {
  wlog_le_c.get()
}

///|
/// WLOG_LT
fn step_116() -> Unit raise {
  let t340 = @meson.meson_tac(@list.List([lt_cases()]))
  wlog_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, (P : (Num, Num) -> Bool)(m, m)) && (∀ m : Num, ∀ n : Num, P(m, n) == P(n, m)) && (∀ m : Num, ∀ n : Num, m < n → P(m, n)) → (∀ m : Num, ∀ y : Num, P(m, y))"),
      t340,
    ),
  )
}

///|
let wlog_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WLOG_LT")

///|
/// `WLOG_LT`
pub fn wlog_lt() -> @kernel.Thm {
  wlog_lt_c.get()
}

///|
/// WLOG_LE_3
fn step_117() -> Unit raise {
  let t341 = @meson.meson_tac(@list.List([le_cases()]))
  wlog_le_3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, Num, Num) -> Bool, (∀ x : Num, ∀ y : Num, ∀ z : Num, P(x, y, z) → P(y, x, z) && P(x, z, y)) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x <= y && y <= z → P(x, y, z)) → (∀ x : Num, ∀ y : Num, ∀ z : Num, P(x, y, z))"),
      t341,
    ),
  )
}

///|
let wlog_le_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WLOG_LE_3")

///|
/// `WLOG_LE_3`
pub fn wlog_le_3() -> @kernel.Thm {
  wlog_le_3_c.get()
}

///|
/// num_WF
fn step_118() -> Unit raise {
  let t343 = @meson.meson_tac(@list.List([lt()]))
  let t342 = @simp.rewrite_tac(@list.List([lt(), @theorems.beta_thm()]))
  let t344 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.mp_tac(
          @bool.spec(
            @term_syntax.parse_term("(n : Num) => ∀ m : Num, m < n → (P : (Num) -> Bool)(m)"),
            @nums.num_induction(),
          ),
        ),
      ),
      t342,
    ),
    t343,
  )
  num_wf_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ n : Num, (∀ m : Num, m < n → P(m)) → P(n)) → (∀ n : Num, P(n))"),
      t344,
    ),
  )
}

///|
let num_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_WF")

///|
/// `num_WF`
pub fn num_wf() -> @kernel.Thm {
  num_wf_c.get()
}

///|
/// num_WOP
fn step_119() -> Unit raise {
  let t349 = @meson.asm_meson_tac(@list.List([]))
  let t348 = @tactics.match_mp_tac(num_wf())
  let t347 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t346 = @tactics.conv_tac(@class.contrapos_conv)
  let t345 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t350 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
              t345,
            ),
            t346,
          ),
          t347,
        ),
        @tactics.disch_tac,
      ),
      t348,
    ),
    t349,
  )
  num_wop_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∃ n : Num, P(n)) == (∃ n : Num, P(n) && (∀ m : Num, m < n → !P(m)))"),
      t350,
    ),
  )
}

///|
let num_wop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_WOP")

///|
/// `num_WOP`
pub fn num_wop() -> @kernel.Thm {
  num_wop_c.get()
}

///|
/// num_MAX
fn step_120() -> Unit raise {
  let t404 = @simp.asm_rewrite_tac(@list.List([]))
  let t403 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t405 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t403),
    t404,
  )
  let t400 = @simp.asm_rewrite_tac(@list.List([]))
  let t399 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == SUC((m : Num))"))
  let t398 = @simp.rewrite_tac(@list.List([le()]))
  let t394 = @term_syntax.parse_term("(p : Num)")
  let t397 = @tactics.first_assum(fn(
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
    (fn(
      x391 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s392 = @tactics.mp_tac(x391)
      fn(
        x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s392(x393)
      }
    })(((x395 : @kernel.Thm) => @bool.spec(t394, x395))(x396))
  })
  let t390 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t389 = @simp.rewrite_tac(@list.List([]))
  let t388 = @tactics.conv_tac(@class.contrapos_conv)
  let t387 = @simp.rewrite_tac(@list.List([lt()]))
  let t384 = @term_syntax.parse_term("(m : Num)")
  let t401 = @tactics.then_tac(
    @tactics.then_tac(
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
                          x378 : @kernel.Thm,
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
                          let s379 = @tactics.assume_tac(x378)
                          fn(
                            x380 : (
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
                            s379(x380)
                          }
                        },
                        fn(
                          x386 : @kernel.Thm,
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
                            x381 : @kernel.Thm,
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
                            let s382 = @tactics.mp_tac(x381)
                            fn(
                              x383 : (
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
                              s382(x383)
                            }
                          })(
                            ((x385 : @kernel.Thm) => @bool.spec(t384, x385))(
                              x386,
                            ),
                          )
                        },
                      ),
                    ),
                    t387,
                  ),
                  t388,
                ),
                @tactics.disch_tac,
              ),
              t389,
            ),
            t390,
          ),
          t397,
        ),
        t398,
      ),
      t399,
    ),
    t400,
  )
  let t377 = @tactics.pop_assum(fn(
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
    let s375 = @tactics.accept_tac(x374)
    fn(
      x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s375(x376)
    }
  })
  let t373 = @tactics.disch_then(
    @tactics.imp_res_then(fn(
      x370 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s371 = @tactics.subst_all_tac(x370)
      fn(
        x372 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s371(x372)
      }
    }),
  )
  let t402 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([le(), lt()])), t373),
      t377,
    ),
    t401,
  ])
  let t368 = @term_syntax.parse_term("(m : Num)")
  let t369 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t368)
  let t367 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool) && a) == (a && b → c)"),
      ),
    ]),
  )
  let t366 = @tactics.disch_then(fn(
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
    let th = x363
    let t365 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(m : Num)")), t365)
  })
  let t359 = @simp.once_rewrite_rule(@list.List([num_wop()]))
  let t360 = @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
    x356 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s357 = @tactics.mp_tac(x356)
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s357(x358)
    }
  })
  let t362 = @tactics.disch_then(fn(
    x361 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t360(t359(x361))
  })
  let t351 = @term_syntax.parse_term("(a : Num)")
  let t406 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_then(
                  @tactics.conjuncts_then2(
                    (x352 : @kernel.Thm) => @tactics.x_choose_tac(t351, x352),
                    fn(
                      x353 : @kernel.Thm,
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
                      let s354 = @tactics.mp_tac(x353)
                      fn(
                        x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s354(x355)
                      }
                    },
                  ),
                ),
                t362,
              ),
              t366,
            ),
            t367,
          ),
          t369,
        ),
        @nums.induct_tac,
      ),
      t402,
    ),
    t405,
  ])
  let t407 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
    t406,
  )
  num_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ((∃ x : Num, P(x)) && (∃ M : Num, ∀ x : Num, P(x) → x <= M)) == (∃ m : Num, P(m) && (∀ x : Num, P(x) → x <= m))"),
      t407,
    ),
  )
}

///|
let num_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_MAX")

///|
/// `num_MAX`
pub fn num_max() -> @kernel.Thm {
  num_max_c.get()
}

///|
/// LE_INDUCT
fn step_121() -> Unit raise {
  let t409 = @simp.asm_simp_tac(@list.List([add_clauses()]))
  let t408 = @tactics.repeat_tac(@tactics.disch_tac)
  let t410 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(
              @list.List([
                @theorems.imp_conj(),
                @meson.meson(
                  @list.List([le_exists()]),
                  @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, m <= n → (R : (Num, Num) -> Bool)(m, n)) == (∀ m : Num, ∀ d : Num, R(m, m + d))"),
                ),
              ]),
            ),
          ),
          t408,
        ),
        @tactics.gen_tac,
      ),
      @nums.induct_tac,
    ),
    t409,
  )
  le_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, Num) -> Bool, (∀ m : Num, P(m, m)) && (∀ m : Num, ∀ n : Num, m <= n && P(m, n) → P(m, SUC(n))) → (∀ m : Num, ∀ n : Num, m <= n → P(m, n))"),
      t410,
    ),
  )
}

///|
let le_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_INDUCT")

///|
/// `LE_INDUCT`
pub fn le_induct() -> @kernel.Thm {
  le_induct_c.get()
}

///|
/// num_INDUCTION_DOWN
fn step_122() -> Unit raise {
  let t426 = @meson.asm_meson_tac(@list.List([lte_cases(), lt(), lt_imp_le()]))
  let t425 = @simp.rewrite_tac(
    @list.List([
      @class.not_exists_thm(),
      @class.taut(@term_syntax.parse_term("!(!(p : Bool) && (q : Bool)) == (q → p)")),
      not_le(),
    ]),
  )
  let t424 = @simp.once_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("(!(p : Bool) → (q : Bool)) == (!q → p)"))]),
  )
  let t423 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(q : Bool) && !(r : Bool) → ((p : Bool) && q) == r → !p")),
  )
  let t417 = @drule.part_match(
    fn(x416 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@equal.lhand(x416))
    },
    num_max(),
  )
  let t412 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x)) == !(∃ x : _, !P(x))"),
      ),
    ]),
  )
  let t411 = @tactics.repeat_tac(@tactics.gen_tac)
  let t427 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@equal.gsym(add1())])),
                  t411,
                ),
                @tactics.strip_tac,
              ),
              t412,
            ),
            fn(
              x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x419 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x418 : @kernel.Term,
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
                      x413 : @kernel.Thm,
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
                      let s414 = @tactics.mp_tac(x413)
                      fn(
                        x415 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s414(x415)
                      }
                    })(t417(x418))
                  })(@kernel.rand(x419))
                })(
                  (fn(
                    x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x420.1
                  })(x421),
                )
              })(x422)(x422)
            },
          ),
          t423,
        ),
        t424,
      ),
      t425,
    ),
    t426,
  )
  num_induction_down_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ m : Num, (∀ n : Num, m <= n → P(n)) && (∀ n : Num, n < m && P(n + 1) → P(n)) → (∀ n : Num, P(n))"),
      t427,
    ),
  )
}

///|
let num_induction_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "num_INDUCTION_DOWN",
)

///|
/// `num_INDUCTION_DOWN`
pub fn num_induction_down() -> @kernel.Thm {
  num_induction_down_c.get()
}

///|
/// EVEN
fn step_123() -> Unit raise {
  let t428 = @term_syntax.parse_term("(EVEN : (Num) -> Bool)(0) == true && (∀ n : Num, EVEN(SUC(n)) == !EVEN(n))")
  even_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t428))
}

///|
let even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN")

///|
/// `EVEN`
pub fn even() -> @kernel.Thm {
  even_c.get()
}

///|
/// ODD
fn step_124() -> Unit raise {
  let t429 = @term_syntax.parse_term("(ODD : (Num) -> Bool)(0) == false && (∀ n : Num, ODD(SUC(n)) == !ODD(n))")
  odd_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t429))
}

///|
let odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD")

///|
/// `ODD`
pub fn odd() -> @kernel.Thm {
  odd_c.get()
}

///|
/// NOT_EVEN
fn step_125() -> Unit raise {
  let t430 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([even(), odd()])),
  )
  not_even_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !EVEN(n) == ODD(n)"), t430),
  )
}

///|
let not_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_EVEN")

///|
/// `NOT_EVEN`
pub fn not_even() -> @kernel.Thm {
  not_even_c.get()
}

///|
/// NOT_ODD
fn step_126() -> Unit raise {
  let t431 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([even(), odd()])),
  )
  not_odd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !ODD(n) == EVEN(n)"), t431),
  )
}

///|
let not_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_ODD")

///|
/// `NOT_ODD`
pub fn not_odd() -> @kernel.Thm {
  not_odd_c.get()
}

///|
/// EVEN_OR_ODD
fn step_127() -> Unit raise {
  let t433 = @simp.asm_rewrite_tac(@list.List([]))
  let t432 = @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()]))
  let t434 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @nums.induct_tac,
        @simp.rewrite_tac(@list.List([even(), odd(), not_even(), not_odd()])),
      ),
      t432,
    ),
    t433,
  )
  even_or_odd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, EVEN(n) || ODD(n)"), t434),
  )
}

///|
let even_or_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_OR_ODD")

///|
/// `EVEN_OR_ODD`
pub fn even_or_odd() -> @kernel.Thm {
  even_or_odd_c.get()
}

///|
/// EVEN_AND_ODD
fn step_128() -> Unit raise {
  let t435 = @itab.itaut(@term_syntax.parse_term("!((p : Bool) && !p)"))
  let t436 = @simp.rewrite_tac(@list.List([@equal.gsym(not_even()), t435]))
  even_and_odd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(EVEN(n) && ODD(n))"), t436),
  )
}

///|
let even_and_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_AND_ODD")

///|
/// `EVEN_AND_ODD`
pub fn even_and_odd() -> @kernel.Thm {
  even_and_odd_c.get()
}

///|
/// EVEN_ADD
fn step_129() -> Unit raise {
  let t449 = @simp.asm_rewrite_tac(@list.List([]))
  let t448 = @simp.rewrite_tac(@list.List([@equal.gsym(not_even())]))
  let t446 = @bool.spec(@term_syntax.parse_term("(p : Num)"), even_or_odd())
  let t447 = @tactics.disj_cases_then(fn(
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
  })(t446)
  let t441 = @bool.spec(@term_syntax.parse_term("(n : Num)"), even_or_odd())
  let t442 = @tactics.disj_cases_then(fn(
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
  })(t441)
  let t437 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t450 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.asm_rewrite_tac(@list.List([even(), add_clauses()])),
              ),
              t437,
            ),
            t442,
          ),
          t447,
        ),
        t448,
      ),
      @tactics.disch_tac,
    ),
    t449,
  )
  even_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(m + n) == (EVEN(m) == EVEN(n))"),
      t450,
    ),
  )
}

///|
let even_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_ADD")

///|
/// `EVEN_ADD`
pub fn even_add() -> @kernel.Thm {
  even_add_c.get()
}

///|
/// EVEN_MULT
fn step_130() -> Unit raise {
  let t463 = @simp.asm_rewrite_tac(@list.List([]))
  let t462 = @simp.rewrite_tac(@list.List([@equal.gsym(not_even())]))
  let t460 = @bool.spec(@term_syntax.parse_term("(p : Num)"), even_or_odd())
  let t461 = @tactics.disj_cases_then(fn(
    x457 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s458 = @tactics.mp_tac(x457)
    fn(
      x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s458(x459)
    }
  })(t460)
  let t455 = @bool.spec(@term_syntax.parse_term("(n : Num)"), even_or_odd())
  let t456 = @tactics.disj_cases_then(fn(
    x452 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s453 = @tactics.mp_tac(x452)
    fn(
      x454 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s453(x454)
    }
  })(t455)
  let t451 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t464 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.asm_rewrite_tac(
                  @list.List([mult_clauses(), even_add(), even()]),
                ),
              ),
              t451,
            ),
            t456,
          ),
          t461,
        ),
        t462,
      ),
      @tactics.disch_tac,
    ),
    t463,
  )
  even_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(m * n) == (EVEN(m) || EVEN(n))"),
      t464,
    ),
  )
}

///|
let even_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_MULT")

///|
/// `EVEN_MULT`
pub fn even_mult() -> @kernel.Thm {
  even_mult_c.get()
}

///|
/// EVEN_EXP
fn step_131() -> Unit raise {
  let t466 = @tactics.conv_tac(@itab.itaut)
  let t465 = @simp.asm_rewrite_tac(
    @list.List([even(), exp(), one(), even_mult(), @nums.not_suc()]),
  )
  let t467 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t465,
    ),
    t466,
  )
  even_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(EXP(m, n)) == (EVEN(m) && !(n == 0))"),
      t467,
    ),
  )
}

///|
let even_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_EXP")

///|
/// `EVEN_EXP`
pub fn even_exp() -> @kernel.Thm {
  even_exp_c.get()
}

///|
/// ODD_ADD
fn step_132() -> Unit raise {
  let t469 = @tactics.conv_tac(@itab.itaut)
  let t468 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_even()), even_add()]),
  )
  let t470 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t468),
    t469,
  )
  odd_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m + n) == !(ODD(m) == ODD(n))"),
      t470,
    ),
  )
}

///|
let odd_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_ADD")

///|
/// `ODD_ADD`
pub fn odd_add() -> @kernel.Thm {
  odd_add_c.get()
}

///|
/// ODD_MULT
fn step_133() -> Unit raise {
  let t472 = @tactics.conv_tac(@itab.itaut)
  let t471 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_even()), even_mult()]),
  )
  let t473 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t471),
    t472,
  )
  odd_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m * n) == (ODD(m) && ODD(n))"),
      t473,
    ),
  )
}

///|
let odd_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_MULT")

///|
/// `ODD_MULT`
pub fn odd_mult() -> @kernel.Thm {
  odd_mult_c.get()
}

///|
/// ODD_EXP
fn step_134() -> Unit raise {
  let t475 = @tactics.conv_tac(@itab.itaut)
  let t474 = @simp.asm_rewrite_tac(
    @list.List([odd(), exp(), one(), odd_mult(), @nums.not_suc()]),
  )
  let t476 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t474,
    ),
    t475,
  )
  odd_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(EXP(m, n)) == (ODD(m) || n == 0)"),
      t476,
    ),
  )
}

///|
let odd_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_EXP")

///|
/// `ODD_EXP`
pub fn odd_exp() -> @kernel.Thm {
  odd_exp_c.get()
}

///|
/// EVEN_DOUBLE
fn step_135() -> Unit raise {
  let t478 = @simp.rewrite_tac(@list.List([even(), even_add()]))
  let t477 = @simp.pure_rewrite_tac(@list.List([bit0_thm(), bit1_thm()]))
  let t479 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([even_mult()])),
        ),
        @tactics.disj1_tac,
      ),
      t477,
    ),
    t478,
  )
  even_double_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, EVEN(2 * n)"), t479))
}

///|
let even_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_DOUBLE")

///|
/// `EVEN_DOUBLE`
pub fn even_double() -> @kernel.Thm {
  even_double_c.get()
}

///|
/// ODD_DOUBLE
fn step_136() -> Unit raise {
  let t480 = @simp.rewrite_tac(@list.List([not_odd(), even_double()]))
  let t481 = @tactics.then_tac(@simp.rewrite_tac(@list.List([odd()])), t480)
  odd_double_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(SUC(2 * n))"), t481),
  )
}

///|
let odd_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_DOUBLE")

///|
/// `ODD_DOUBLE`
pub fn odd_double() -> @kernel.Thm {
  odd_double_c.get()
}

///|
/// EVEN_EXISTS_LEMMA
fn step_137() -> Unit raise {
  let t489 = @simp.asm_rewrite_tac(@list.List([]))
  let t490 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(m : Num)")),
    t489,
  )
  let t488 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t487 = @simp.rewrite_tac(@list.List([mult_2()]))
  let t486 = @simp.asm_rewrite_tac(@list.List([]))
  let t491 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("SUC((m : Num))")),
          t486,
        ),
        t487,
      ),
      t488,
    ),
    t490,
  ])
  let t483 = @term_syntax.parse_term("(m : Num)")
  let t485 = @tactics.disch_then(
    @tactics.ante_res_then((x484 : @kernel.Thm) => {
      @tactics.x_choose_tac(t483, x484)
    }),
  )
  let t492 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.pop_assum(@tactics.strip_assume_tac),
        @tactics.conj_tac,
      ),
      t485,
    ),
    t491,
  )
  let t482 = @simp.rewrite_tac(@list.List([mult_clauses()]))
  let t493 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t482),
    t492,
  ])
  let t494 = @tactics.thenl(
    @tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([even()]))),
    t493,
  )
  even_exists_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (EVEN(n) → (∃ m : Num, n == 2 * m)) && (!EVEN(n) → (∃ m : Num, n == SUC(2 * m)))"),
      t494,
    ),
  )
}

///|
let even_exists_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVEN_EXISTS_LEMMA",
)

///|
/// `EVEN_EXISTS_LEMMA`
pub fn even_exists_lemma() -> @kernel.Thm {
  even_exists_lemma_c.get()
}

///|
/// EVEN_EXISTS
fn step_138() -> Unit raise {
  let t499 = @simp.rewrite_tac(@list.List([even_double()]))
  let t500 = @tactics.then_tac(
    @tactics.pop_assum(
      @tactics.choose_then(fn(
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
        let s497 = @tactics.subst1_tac(x496)
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
    ),
    t499,
  )
  let t495 = @simp.asm_rewrite_tac(@list.List([]))
  let t501 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @bool.conjunct1(@bool.spec_all(even_exists_lemma())),
      ),
      t495,
    ),
    t500,
  ])
  let t502 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t501,
  )
  even_exists_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, EVEN(n) == (∃ m : Num, n == 2 * m)"), t502),
  )
}

///|
let even_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_EXISTS")

///|
/// `EVEN_EXISTS`
pub fn even_exists() -> @kernel.Thm {
  even_exists_c.get()
}

///|
/// ODD_EXISTS
fn step_139() -> Unit raise {
  let t507 = @simp.rewrite_tac(@list.List([odd_double()]))
  let t508 = @tactics.then_tac(
    @tactics.pop_assum(
      @tactics.choose_then(fn(
        x504 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s505 = @tactics.subst1_tac(x504)
        fn(
          x506 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s505(x506)
        }
      }),
    ),
    t507,
  )
  let t503 = @simp.asm_rewrite_tac(@list.List([not_even()]))
  let t509 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @bool.conjunct2(@bool.spec_all(even_exists_lemma())),
      ),
      t503,
    ),
    t508,
  ])
  let t510 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t509,
  )
  odd_exists_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(n) == (∃ m : Num, n == SUC(2 * m))"), t510),
  )
}

///|
let odd_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_EXISTS")

///|
/// `ODD_EXISTS`
pub fn odd_exists() -> @kernel.Thm {
  odd_exists_c.get()
}

///|
/// EVEN_ODD_DECOMPOSITION
fn step_140() -> Unit raise {
  let t550 = @simp.asm_rewrite_tac(@list.List([exp(), mult_assoc()]))
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("SUC((k : Num))"))
  let t548 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t547 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t546 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t545 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t544 = @simp.rewrite_tac(@list.List([@equal.gsym(two())]))
  let t543 = @simp.rewrite_tac(@list.List([two(), @nums.not_suc()]))
  let t541 = @simp.asm_rewrite_tac(@list.List([lt_mult_rcancel(), two(), lt()]))
  let t542 = @list.List([
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x538 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s539 = @equal.land_conv(x538)
          fn(x540 : @kernel.Term) -> @kernel.Thm raise { s539(x540) }
        },
        @list.List([
          @equal.gsym(@lib.el(2, @bool.conjuncts_rule(mult_clauses()))),
        ]),
      ),
      t541,
    ),
    @tactics.all_tac,
  ])
  let t536 = @meson.meson_tac(@list.List([odd()]))
  let t535 = @simp.rewrite_tac(
    @list.List([exp_eq_0(), mult_eq_0(), two(), @nums.not_suc()]),
  )
  let t534 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t537 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([mult_clauses(), lt()])),
          t534,
        ),
        t535,
      ),
      t536,
    ),
    @tactics.all_tac,
  ])
  let t533 = @simp.asm_rewrite_tac(@list.List([mult_eq_0()]))
  let t532 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t528 = @term_syntax.parse_term("(m : Num)")
  let t531 = @tactics.first_x_assum(fn(
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
    (fn(
      x525 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s526 = @tactics.mp_tac(x525)
      fn(
        x527 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s526(x527)
      }
    })(((x529 : @kernel.Thm) => @bool.spec(t528, x529))(x530))
  })
  let t524 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
      x521 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s522 = @tactics.subst_all_tac(x521)
      fn(
        x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s522(x523)
      }
    }),
  )
  let t518 = @simp.gen_rewrite_rule(
    fn(
      x517 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x517
    },
    @list.List([even_exists()]),
  )
  let t520 = @tactics.first_x_assum(fn(
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
    (fn(
      x514 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s515 = @tactics.mp_tac(x514)
      fn(
        x516 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s515(x516)
      }
    })(t518(x519))
  })
  let t513 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([odd(), exp(), mult_clauses()])),
  ])
  let t512 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), even_or_odd()),
  )
  let t511 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t551 = @tactics.then_tac(
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
                                          @tactics.match_mp_tac(num_wf()),
                                          t511,
                                        ),
                                        @tactics.disch_tac,
                                      ),
                                      t512,
                                    ),
                                    t513,
                                  ),
                                  t520,
                                ),
                                t524,
                              ),
                              t531,
                            ),
                            t532,
                          ),
                          t533,
                        ),
                        t537,
                      ),
                      @tactics.ants_tac,
                    ),
                    t542,
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
  )
  even_odd_decomposition_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (∃ k : Num, ∃ m : Num, ODD(m) && n == EXP(2, k) * m) == !(n == 0)"),
      t551,
    ),
  )
}

///|
let even_odd_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVEN_ODD_DECOMPOSITION",
)

///|
/// `EVEN_ODD_DECOMPOSITION`
pub fn even_odd_decomposition() -> @kernel.Thm {
  even_odd_decomposition_c.get()
}

///|
/// SUB
fn step_141() -> Unit raise {
  let t552 = @term_syntax.parse_term("(∀ m : Num, (op_minus : (Num, Num) -> Num)(m, 0) == m) && (∀ m : Num, ∀ n : Num, op_minus(m, SUC(n)) == PRE(op_minus(m, n)))")
  sub_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t552))
}

///|
let sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB")

///|
/// `SUB`
pub fn sub() -> @kernel.Thm {
  sub_c.get()
}

///|
/// SUB_0
fn step_142() -> Unit raise {
  let t553 = @simp.asm_rewrite_tac(@list.List([sub(), pre()]))
  let t554 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([sub()])), @nums.induct_tac),
    t553,
  )
  sub_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, 0 - m == 0 && m - 0 == m"), t554),
  )
}

///|
let sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_0")

///|
/// `SUB_0`
pub fn sub_0() -> @kernel.Thm {
  sub_0_c.get()
}

///|
/// SUB_PRESUC
fn step_143() -> Unit raise {
  let t555 = @simp.asm_rewrite_tac(@list.List([sub(), pre()]))
  let t556 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t555,
  )
  sub_presuc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, PRE(SUC(m) - n) == m - n"), t556),
  )
}

///|
let sub_presuc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_PRESUC")

///|
/// `SUB_PRESUC`
pub fn sub_presuc() -> @kernel.Thm {
  sub_presuc_c.get()
}

///|
/// SUB_SUC
fn step_144() -> Unit raise {
  let t557 = @simp.asm_rewrite_tac(@list.List([sub(), pre(), sub_presuc()]))
  let t558 = @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t557)
  sub_suc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, SUC(m) - SUC(n) == m - n"), t558),
  )
}

///|
let sub_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_SUC")

///|
/// `SUB_SUC`
pub fn sub_suc() -> @kernel.Thm {
  sub_suc_c.get()
}

///|
/// SUB_REFL
fn step_145() -> Unit raise {
  let t559 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([sub_suc(), sub_0()])),
  )
  sub_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, n - n == 0"), t559))
}

///|
let sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_REFL")

///|
/// `SUB_REFL`
pub fn sub_refl() -> @kernel.Thm {
  sub_refl_c.get()
}

///|
/// ADD_SUB
fn step_146() -> Unit raise {
  let t560 = @simp.asm_rewrite_tac(
    @list.List([add_clauses(), sub_suc(), sub_0()]),
  )
  let t561 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t560,
  )
  add_sub_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m + n - n == m"), t561),
  )
}

///|
let add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SUB")

///|
/// `ADD_SUB`
pub fn add_sub() -> @kernel.Thm {
  add_sub_c.get()
}

///|
/// ADD_SUB2
fn step_147() -> Unit raise {
  let t562 = @tactics.match_accept_tac(add_sub())
  let t563 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t562,
  )
  add_sub2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m + n - m == n"), t563),
  )
}

///|
let add_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SUB2")

///|
/// `ADD_SUB2`
pub fn add_sub2() -> @kernel.Thm {
  add_sub2_c.get()
}

///|
/// SUB_EQ_0
fn step_148() -> Unit raise {
  let t565 = @simp.rewrite_tac(@list.List([le(), le_0()]))
  let t564 = @simp.asm_rewrite_tac(@list.List([sub_suc(), le_suc(), sub_0()]))
  let t566 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t564),
    t565,
  )
  sub_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m - n == 0) == (m <= n)"), t566),
  )
}

///|
let sub_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_EQ_0")

///|
/// `SUB_EQ_0`
pub fn sub_eq_0() -> @kernel.Thm {
  sub_eq_0_c.get()
}

///|
/// ADD_SUBR2
fn step_149() -> Unit raise {
  let t567 = @simp.rewrite_tac(@list.List([sub_eq_0(), le_add()]))
  add_subr2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m - (m + n) == 0"), t567),
  )
}

///|
let add_subr2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SUBR2")

///|
/// `ADD_SUBR2`
pub fn add_subr2() -> @kernel.Thm {
  add_subr2_c.get()
}

///|
/// ADD_SUBR
fn step_150() -> Unit raise {
  let t568 = @tactics.match_accept_tac(add_subr2())
  let t569 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t568,
  )
  add_subr_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n - (m + n) == 0"), t569),
  )
}

///|
let add_subr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SUBR")

///|
/// `ADD_SUBR`
pub fn add_subr() -> @kernel.Thm {
  add_subr_c.get()
}

///|
/// SUB_ADD
fn step_151() -> Unit raise {
  let t572 = @tactics.match_accept_tac(add_sym())
  let t571 = @simp.asm_rewrite_tac(
    @list.List([@simp.once_rewrite_rule(@list.List([add_sym()]))(add_sub())]),
  )
  let t570 = @tactics.repeat_tac(@tactics.strip_tac)
  let t573 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([le_exists()])), t570),
      t571,
    ),
    t572,
  )
  sub_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, n <= m → m - n + n == m"),
      t573,
    ),
  )
}

///|
let sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_ADD")

///|
/// `SUB_ADD`
pub fn sub_add() -> @kernel.Thm {
  sub_add_c.get()
}

///|
/// SUB_ADD_LCANCEL
fn step_152() -> Unit raise {
  let t574 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([add_clauses(), sub_0(), sub_suc()])),
  )
  sub_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m + n - (m + p) == n - p"),
      t574,
    ),
  )
}

///|
let sub_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUB_ADD_LCANCEL",
)

///|
/// `SUB_ADD_LCANCEL`
pub fn sub_add_lcancel() -> @kernel.Thm {
  sub_add_lcancel_c.get()
}

///|
/// SUB_ADD_RCANCEL
fn step_153() -> Unit raise {
  let t575 = @tactics.match_accept_tac(sub_add_lcancel())
  let t576 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([add_sym()])),
    t575,
  )
  sub_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m + p - (n + p) == m - n"),
      t576,
    ),
  )
}

///|
let sub_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUB_ADD_RCANCEL",
)

///|
/// `SUB_ADD_RCANCEL`
pub fn sub_add_rcancel() -> @kernel.Thm {
  sub_add_rcancel_c.get()
}

///|
/// LEFT_SUB_DISTRIB
fn step_154() -> Unit raise {
  let t590 = @simp.rewrite_tac(
    @list.List([@simp.once_rewrite_rule(@list.List([add_sym()]))(add_sub())]),
  )
  let t589 = @simp.rewrite_tac(@list.List([left_add_distrib()]))
  let t586 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t587 = @tactics.choose_then(fn(
    x583 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s584 = @tactics.subst1_tac(x583)
    fn(
      x585 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s584(x585)
    }
  })
  let t591 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.pop_assum(fn(
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
        t587(t586(x588))
      }),
      t589,
    ),
    t590,
  )
  let t582 = @simp.asm_rewrite_tac(
    @list.List([mult_clauses(), sub_eq_0(), le_mult_lcancel()]),
  )
  let t592 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x580 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th = x580
        @simp.rewrite_tac(
          @list.List([
            @simp.rewrite_rule(@list.List([@equal.gsym(sub_eq_0())]))(th),
          ]),
        )
      }),
      t582,
    ),
    t591,
  ])
  let t578 = @term_syntax.parse_term("(p : Num)")
  let t579 = @tactics.disj_cases_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t578]), le_cases()),
  )
  let t577 = @tactics.conv_tac(@equal.sym_conv)
  let t593 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t577),
      t579,
    ),
    t592,
  )
  left_sub_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m * (n - p) == m * n - m * p"),
      t593,
    ),
  )
}

///|
let left_sub_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_SUB_DISTRIB",
)

///|
/// `LEFT_SUB_DISTRIB`
pub fn left_sub_distrib() -> @kernel.Thm {
  left_sub_distrib_c.get()
}

///|
/// RIGHT_SUB_DISTRIB
fn step_155() -> Unit raise {
  let t594 = @tactics.match_accept_tac(left_sub_distrib())
  let t595 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym()])),
    t594,
  )
  right_sub_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (m - n) * p == m * p - n * p"),
      t595,
    ),
  )
}

///|
let right_sub_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_SUB_DISTRIB",
)

///|
/// `RIGHT_SUB_DISTRIB`
pub fn right_sub_distrib() -> @kernel.Thm {
  right_sub_distrib_c.get()
}

///|
/// SUC_SUB1
fn step_156() -> Unit raise {
  let t596 = @simp.rewrite_tac(@list.List([one(), sub_suc(), sub_0()]))
  suc_sub1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, SUC(n) - 1 == n"), t596))
}

///|
let suc_sub1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_SUB1")

///|
/// `SUC_SUB1`
pub fn suc_sub1() -> @kernel.Thm {
  suc_sub1_c.get()
}

///|
/// EVEN_SUB
fn step_157() -> Unit raise {
  let t611 = @meson.asm_meson_tac(@list.List([even_add()]))
  let t608 = @drule.match_mp(sub_add())
  let t605 = @term_syntax.parse_term("EVEN")
  let t610 = @tactics.first_assum(fn(
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
    (fn(
      x607 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x602 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s603 = @tactics.mp_tac(x602)
        fn(
          x604 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s603(x604)
        }
      })(((x606 : @kernel.Thm) => @equal.ap_term(t605, x606))(x607))
    })(t608(x609))
  })
  let t601 = @simp.asm_simp_tac(@list.List([]))
  let t599 = @term_syntax.parse_term("(n : Num)")
  let t600 = @tactics.disj_cases_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t599]), le_cases()),
  )
  let t598 = @list.List([
    @meson.asm_meson_tac(@list.List([sub_eq_0(), even()])),
    @tactics.all_tac,
  ])
  let t597 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t612 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t597),
            t598,
          ),
          t600,
        ),
        t601,
      ),
      t610,
    ),
    t611,
  )
  even_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(m - n) == (m <= n || EVEN(m) == EVEN(n))"),
      t612,
    ),
  )
}

///|
let even_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_SUB")

///|
/// `EVEN_SUB`
pub fn even_sub() -> @kernel.Thm {
  even_sub_c.get()
}

///|
/// ODD_SUB
fn step_158() -> Unit raise {
  let t613 = @tactics.conv_tac(@class.taut)
  let t614 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @equal.gsym(not_even()),
        even_sub(),
        @class.de_morgan_thm(),
        not_le(),
      ]),
    ),
    t613,
  )
  odd_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m - n) == (n < m && !(ODD(m) == ODD(n)))"),
      t614,
    ),
  )
}

///|
let odd_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_SUB")

///|
/// `ODD_SUB`
pub fn odd_sub() -> @kernel.Thm {
  odd_sub_c.get()
}

///|
/// FACT
fn step_159() -> Unit raise {
  let t615 = @term_syntax.parse_term("(FACT : (Num) -> Num)(0) == 1 && (∀ n : Num, FACT(SUC(n)) == SUC(n) * FACT(n))")
  fact_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t615))
}

///|
let fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT")

///|
/// `FACT`
pub fn fact() -> @kernel.Thm {
  fact_c.get()
}

///|
/// FACT_LT
fn step_160() -> Unit raise {
  let t616 = @simp.rewrite_tac(@list.List([one(), lt_0()]))
  let t617 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(@list.List([fact(), lt_mult()])),
    ),
    t616,
  )
  fact_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 0 < FACT(n)"), t617))
}

///|
let fact_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_LT")

///|
/// `FACT_LT`
pub fn fact_lt() -> @kernel.Thm {
  fact_lt_c.get()
}

///|
/// FACT_LE
fn step_161() -> Unit raise {
  let t618 = @simp.rewrite_tac(@list.List([one(), le_suc_lt(), fact_lt()]))
  fact_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= FACT(n)"), t618))
}

///|
let fact_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_LE")

///|
/// `FACT_LE`
pub fn fact_le() -> @kernel.Thm {
  fact_le_c.get()
}

///|
/// FACT_NZ
fn step_162() -> Unit raise {
  let t619 = @simp.rewrite_tac(@list.List([@equal.gsym(lt_nz()), fact_lt()]))
  fact_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(FACT(n) == 0)"), t619))
}

///|
let fact_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_NZ")

///|
/// `FACT_NZ`
pub fn fact_nz() -> @kernel.Thm {
  fact_nz_c.get()
}

///|
/// FACT_MONO
fn step_163() -> Unit raise {
  let t639 = @simp.rewrite_tac(@list.List([one(), le_suc(), le_0()]))
  let t638 = @simp.rewrite_tac(@list.List([le_mult_rcancel()]))
  let t637 = @simp.gen_rewrite_tac(
    fn(
      x634 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s635 = @equal.land_conv(x634)
      fn(x636 : @kernel.Term) -> @kernel.Thm raise { s635(x636) }
    },
    @list.List([@equal.gsym(@lib.el(2, @bool.conjuncts_rule(mult_clauses())))]),
  )
  let t633 = @simp.asm_rewrite_tac(@list.List([]))
  let t632 = @tactics.exists_tac(@term_syntax.parse_term("FACT((m : Num) + (d : Num))"))
  let t631 = @tactics.match_mp_tac(le_trans())
  let t630 = @simp.rewrite_tac(@list.List([fact()]))
  let t629 = @simp.rewrite_tac(@list.List([add_clauses(), le_refl()]))
  let t627 = @term_syntax.parse_term("(d : Num)")
  let t628 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t627)
  let t623 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t624 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x620 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s621 = @tactics.subst1_tac(x620)
    fn(
      x622 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s621(x622)
    }
  })
  let t626 = @tactics.disch_then(fn(
    x625 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t624(t623(x625))
  })
  let t640 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t626,
                      ),
                      t628,
                    ),
                    @nums.induct_tac,
                  ),
                  t629,
                ),
                t630,
              ),
              t631,
            ),
            t632,
          ),
          t633,
        ),
        t637,
      ),
      t638,
    ),
    t639,
  )
  fact_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → FACT(m) <= FACT(n)"),
      t640,
    ),
  )
}

///|
let fact_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_MONO")

///|
/// `FACT_MONO`
pub fn fact_mono() -> @kernel.Thm {
  fact_mono_c.get()
}

///|
/// EXP_LT_0
fn step_164() -> Unit raise {
  let t641 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_le()), le(), exp_eq_0(), @class.de_morgan_thm()]),
  )
  exp_lt_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, (0 < EXP(x, n)) == (!(x == 0) || n == 0)"),
      t641,
    ),
  )
}

///|
let exp_lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_LT_0")

///|
/// `EXP_LT_0`
pub fn exp_lt_0() -> @kernel.Thm {
  exp_lt_0_c.get()
}

///|
/// LT_EXP
fn step_165() -> Unit raise {
  let t694 = @simp.rewrite_tac(@list.List([one(), lt()]))
  let t693 = @simp.rewrite_tac(@list.List([not_le()]))
  let t692 = @tactics.conv_tac(@class.contrapos_conv)
  let t691 = @tactics.undisch_tac(@term_syntax.parse_term("!((x : Num) == 0)"))
  let t695 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([le_mult_lcancel()])),
            @tactics.disj2_tac,
          ),
          t691,
        ),
        t692,
      ),
      t693,
    ),
    t694,
  )
  let t696 = @list.List([
    @simp.rewrite_tac(@list.List([mult_clauses(), le_refl()])),
    t695,
  ])
  let t690 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) * 1"))
  let t689 = @tactics.match_mp_tac(le_trans())
  let t688 = @simp.rewrite_tac(
    @list.List([add_clauses(), exp(), mult_assoc(), le_mult_rcancel()]),
  )
  let t687 = @simp.asm_rewrite_tac(@list.List([]))
  let t686 = @tactics.exists_tac(@term_syntax.parse_term("EXP((x : Num), (m : Num) + SUC((d : Num)))"))
  let t697 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.match_mp_tac(lte_trans()), t686),
                t687,
              ),
              t688,
            ),
            @tactics.disj1_tac,
          ),
          t689,
        ),
        t690,
      ),
      @tactics.conj_tac,
    ),
    t696,
  )
  let t684 = @simp.asm_rewrite_tac(@list.List([le_mult_rcancel()]))
  let t685 = @list.List([
    @simp.asm_rewrite_tac(@list.List([mult_2(), lt_add(), exp_lt_0()])),
    t684,
  ])
  let t683 = @tactics.exists_tac(@term_syntax.parse_term("2 * EXP((x : Num), (m : Num))"))
  let t698 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(lte_trans()), t683),
        @tactics.conj_tac,
      ),
      t685,
    ),
    t697,
  ])
  let t682 = @simp.rewrite_tac(@list.List([add_clauses(), exp()]))
  let t680 = @term_syntax.parse_term("(d : Num)")
  let t681 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t680)
  let t677 = @simp.rewrite_rule(@list.List([lt_exists()]))
  let t678 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x674 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s675 = @tactics.subst1_tac(x674)
    fn(
      x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s675(x676)
    }
  })
  let t699 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.strip_tac,
            @tactics.first_assum(fn(
              x679 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              t678(t677(x679))
            }),
          ),
          t681,
        ),
        @nums.induct_tac,
      ),
      t682,
    ),
    t698,
  )
  let t671 = @simp.rewrite_tac(@list.List([one(), lt()]))
  let t670 = @simp.rewrite_tac(@list.List([not_le()]))
  let t669 = @tactics.conv_tac(@class.contrapos_conv)
  let t668 = @tactics.undisch_tac(@term_syntax.parse_term("!((x : Num) == 0)"))
  let t672 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([le_mult_rcancel()])),
            @tactics.disj1_tac,
          ),
          t668,
        ),
        t669,
      ),
      t670,
    ),
    t671,
  )
  let t673 = @list.List([
    @simp.asm_rewrite_tac(@list.List([mult_clauses()])),
    t672,
  ])
  let t667 = @tactics.exists_tac(@term_syntax.parse_term("1 * EXP((x : Num), (n : Num) + (d : Num))"))
  let t666 = @tactics.match_mp_tac(le_trans())
  let t665 = @simp.rewrite_tac(@list.List([add_clauses(), exp(), le_refl()]))
  let t663 = @term_syntax.parse_term("(d : Num)")
  let t664 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t663)
  let t659 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t660 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x656 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s657 = @tactics.subst1_tac(x656)
    fn(
      x658 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s657(x658)
    }
  })
  let t662 = @tactics.first_assum(fn(
    x661 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t660(t659(x661))
  })
  let t655 = @simp.asm_rewrite_tac(@list.List([exp_one(), le_refl()]))
  let t654 = @simp.asm_rewrite_tac(@list.List([@equal.sym(one())]))
  let t653 = @simp.rewrite_tac(@list.List([two(), one(), lt()]))
  let t652 = @simp.rewrite_tac(
    @list.List([not_lt(), @class.de_morgan_thm(), not_le()]),
  )
  let t700 = @list.List([
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
                              @tactics.conv_tac(@class.contrapos_conv),
                              t652,
                            ),
                            t653,
                          ),
                          t654,
                        ),
                        @tactics.strip_tac,
                      ),
                      t655,
                    ),
                    t662,
                  ),
                  t664,
                ),
                @nums.induct_tac,
              ),
              t665,
            ),
            t666,
          ),
          t667,
        ),
        @tactics.conj_tac,
      ),
      t673,
    ),
    t699,
  ])
  let t650 = @simp.rewrite_tac(@list.List([one(), lt_0()]))
  let t649 = @simp.rewrite_tac(
    @list.List([exp(), mult_clauses(), @nums.not_suc(), lt_refl(), lt()]),
  )
  let t647 = @term_syntax.parse_term("(m : Num)")
  let t648 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t647)
  let t646 = @simp.rewrite_tac(
    @list.List([exp(), @nums.not_suc(), mult_clauses(), lt()]),
  )
  let t644 = @term_syntax.parse_term("(n : Num)")
  let t645 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t644)
  let t651 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@equal.gsym(not_lt()), two(), one(), lt()]),
                  ),
                  t645,
                ),
                @nums.induct_tac,
              ),
              t646,
            ),
            t648,
          ),
          @nums.induct_tac,
        ),
        t649,
      ),
      t650,
    ),
    @tactics.all_tac,
  ])
  let t643 = @simp.asm_rewrite_tac(@list.List([]))
  let t642 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t701 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t642),
          t643,
        ),
        t651,
      ),
      @tactics.eq_tac,
    ),
    t700,
  )
  lt_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ m : Num, ∀ n : Num, (EXP(x, m) < EXP(x, n)) == (2 <= x && m < n || x == 0 && !(m == 0) && n == 0)"),
      t701,
    ),
  )
}

///|
let lt_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_EXP")

///|
/// `LT_EXP`
pub fn lt_exp() -> @kernel.Thm {
  lt_exp_c.get()
}

///|
/// LE_EXP
fn step_166() -> Unit raise {
  let t705 = @tactics.conv_tac(fn(x704 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(@class.taut(x704))
  })
  let t703 = @simp.asm_rewrite_tac(@list.List([two(), lt(), one()]))
  let t702 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_lt()), lt_exp(), @class.de_morgan_thm()]),
  )
  let t706 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t702),
        @class.cond_cases_tac,
      ),
      t703,
    ),
    t705,
  )
  le_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ m : Num, ∀ n : Num, (EXP(x, m) <= EXP(x, n)) == (if x == 0 { m == 0 → n == 0 } else { x == 1 || m <= n })"),
      t706,
    ),
  )
}

///|
let le_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_EXP")

///|
/// `LE_EXP`
pub fn le_exp() -> @kernel.Thm {
  le_exp_c.get()
}

///|
/// EQ_EXP
fn step_167() -> Unit raise {
  let t713 = @tactics.conv_tac(@class.taut)
  let t712 = @simp.rewrite_tac(@list.List([@equal.gsym(le_antisym())]))
  let t711 = @simp.asm_rewrite_tac(@list.List([le_exp()]))
  let t710 = @simp.gen_rewrite_tac(
    fn(
      x707 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s708 = @equal.land_conv(x707)
      fn(x709 : @kernel.Term) -> @kernel.Thm raise { s708(x709) }
    },
    @list.List([@equal.gsym(le_antisym()), le_exp()]),
  )
  let t714 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t710),
          @class.cond_cases_tac,
        ),
        t711,
      ),
      t712,
    ),
    t713,
  )
  eq_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ m : Num, ∀ n : Num, (EXP(x, m) == EXP(x, n)) == (if x == 0 { (m == 0) == (n == 0) } else { x == 1 || m == n })"),
      t714,
    ),
  )
}

///|
let eq_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EXP")

///|
/// `EQ_EXP`
pub fn eq_exp() -> @kernel.Thm {
  eq_exp_c.get()
}

///|
/// EXP_MONO_LE_IMP
fn step_168() -> Unit raise {
  let t716 = @simp.asm_simp_tac(@list.List([le_mult2(), exp(), le_refl()]))
  let t715 = @tactics.repeat_tac(@tactics.gen_tac)
  let t717 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
          t715,
        ),
        @tactics.disch_tac,
      ),
      @nums.induct_tac,
    ),
    t716,
  )
  exp_mono_le_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, x <= y → EXP(x, n) <= EXP(y, n)"),
      t717,
    ),
  )
}

///|
let exp_mono_le_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXP_MONO_LE_IMP",
)

///|
/// `EXP_MONO_LE_IMP`
pub fn exp_mono_le_imp() -> @kernel.Thm {
  exp_mono_le_imp_c.get()
}

///|
/// EXP_MONO_LT_IMP
fn step_169() -> Unit raise {
  let t722 = @meson.asm_meson_tac(@list.List([@bool.conjunct1(lt())]))
  let t721 = @simp.asm_simp_tac(
    @list.List([
      lt_imp_le(),
      le_mult_lcancel(),
      lt_mult_rcancel(),
      exp_mono_le_imp(),
      exp_eq_0(),
    ]),
  )
  let t720 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) * EXP((y : Num), (n : Num))"))
  let t719 = @tactics.match_mp_tac(let_trans())
  let t718 = @simp.rewrite_tac(@list.List([@nums.not_suc(), exp()]))
  let t723 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                @nums.induct_tac,
              ),
              t718,
            ),
            @tactics.disch_tac,
          ),
          t719,
        ),
        t720,
      ),
      t721,
    ),
    t722,
  )
  exp_mono_lt_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, x < y && !(n == 0) → EXP(x, n) < EXP(y, n)"),
      t723,
    ),
  )
}

///|
let exp_mono_lt_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXP_MONO_LT_IMP",
)

///|
/// `EXP_MONO_LT_IMP`
pub fn exp_mono_lt_imp() -> @kernel.Thm {
  exp_mono_lt_imp_c.get()
}

///|
/// EXP_MONO_LE
fn step_170() -> Unit raise {
  let t725 = @meson.asm_meson_tac(@list.List([not_le(), exp_mono_lt_imp()]))
  let t724 = @simp.asm_simp_tac(
    @list.List([exp(), le_refl(), exp_mono_le_imp()]),
  )
  let t726 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        @tactics.strip_tac,
      ),
      t724,
    ),
    t725,
  )
  exp_mono_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, (EXP(x, n) <= EXP(y, n)) == (x <= y || n == 0)"),
      t726,
    ),
  )
}

///|
let exp_mono_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_MONO_LE")

///|
/// `EXP_MONO_LE`
pub fn exp_mono_le() -> @kernel.Thm {
  exp_mono_le_c.get()
}

///|
/// EXP_MONO_LT
fn step_171() -> Unit raise {
  let t727 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_le()), exp_mono_le(), @class.de_morgan_thm()]),
  )
  exp_mono_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, (EXP(x, n) < EXP(y, n)) == (x < y && !(n == 0))"),
      t727,
    ),
  )
}

///|
let exp_mono_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_MONO_LT")

///|
/// `EXP_MONO_LT`
pub fn exp_mono_lt() -> @kernel.Thm {
  exp_mono_lt_c.get()
}

///|
/// EXP_MONO_EQ
fn step_172() -> Unit raise {
  let t728 = @tactics.conv_tac(@class.taut)
  let t729 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(le_antisym()), exp_mono_le()])),
    t728,
  )
  exp_mono_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, (EXP(x, n) == EXP(y, n)) == (x == y || n == 0)"),
      t729,
    ),
  )
}

///|
let exp_mono_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_MONO_EQ")

///|
/// `EXP_MONO_EQ`
pub fn exp_mono_eq() -> @kernel.Thm {
  exp_mono_eq_c.get()
}

///|
/// DIVMOD_EXIST
fn step_173() -> Unit raise {
  let t781 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(not_le()), le()]))
  let t780 = @simp.rewrite_tac(
    @list.List([mult_clauses(), add_assoc(), lt_addr()]),
  )
  let t779 = @simp.rewrite_tac(@list.List([right_add_distrib()]))
  let t778 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num) + 1"))
  let t777 = @simp.rewrite_tac(
    @list.List([@class.not_imp(), @theorems.right_and_exists_thm()]),
  )
  let t776 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t775 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t771 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t772 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
    let s769 = @tactics.subst_all_tac(x768)
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
  })
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
    t772(t771(x773))
  })
  let t767 = @simp.asm_rewrite_tac(@list.List([not_lt()]))
  let t766 = @tactics.conv_tac(@class.contrapos_conv)
  let t765 = @tactics.disch_then(fn(
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
    let th = x758
    let t764 = @tactics.mp_tac(th)
    let t763 = @term_syntax.parse_term("(r : Num)")
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x760 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s761 = @tactics.exists_tac(x760)
          fn(
            x762 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s761(x762)
          }
        },
        @list.List([@term_syntax.parse_term("(q : Num)"), t763]),
      ),
      t764,
    )
  })
  let t752 = @term_syntax.parse_term("(q : Num)")
  let t757 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x753 : @kernel.Thm) => @tactics.x_choose_tac(t752, x753),
      fn(
        x754 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s755 = @tactics.mp_tac(x754)
        fn(
          x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s755(x756)
        }
      },
    ),
  )
  let t751 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(
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
      let s749 = @tactics.mp_tac(x748)
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
    }),
  )
  let t747 = @simp.rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t742 = @term_syntax.parse_term("0")
  let t743 = @list.List([@term_syntax.parse_term("(m : Num)"), t742])
  let t746 = @tactics.disch_then(fn(
    x745 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x739 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s740 = @tactics.mp_tac(x739)
      fn(
        x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s740(x741)
      }
    })(((x744 : @kernel.Thm) => @bool.specl(t743, x744))(x745))
  })
  let t738 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t737 = @tactics.disch_then(fn(
    x736 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x735 : (@kernel.Thm, @kernel.Thm),
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x731 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s732 = @tactics.mp_tac(x731)
        fn(
          x733 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s732(x733)
        }
      })(
        (fn(x734 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise { x734.0 })(
          x735,
        ),
      )
    })(@bool.eq_imp_rule(x736))
  })
  let t730 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(r : Num) => ∃ q : Num, (m : Num) == q * (n : Num) + r"), num_wop()),
  )
  let t782 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
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
                                        t730,
                                      ),
                                      @tactics.beta_tac,
                                    ),
                                    t737,
                                  ),
                                  t738,
                                ),
                                t746,
                              ),
                              t747,
                            ),
                            t751,
                          ),
                          t757,
                        ),
                        t765,
                      ),
                      t766,
                    ),
                    t767,
                  ),
                  t774,
                ),
                t775,
              ),
              t776,
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
  )
  divmod_exist_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) → (∃ q : Num, ∃ r : Num, m == q * n + r && r < n)"),
      t782,
    ),
  )
}

///|
let divmod_exist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVMOD_EXIST")

///|
/// `DIVMOD_EXIST`
pub fn divmod_exist() -> @kernel.Thm {
  divmod_exist_c.get()
}

///|
/// DIVMOD_EXIST_0
fn step_174() -> Unit raise {
  let t784 = @simp.asm_simp_tac(
    @list.List([
      divmod_exist(),
      @theorems.right_exists_and_thm(),
      @theorems.exists_refl(),
    ]),
  )
  let t783 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t785 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t783),
    t784,
  )
  divmod_exist_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∃ q : Num, ∃ r : Num, (if n == 0 { q == 0 && r == m } else { m == q * n + r && r < n })"),
      t785,
    ),
  )
}

///|
let divmod_exist_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVMOD_EXIST_0")

///|
/// `DIVMOD_EXIST_0`
pub fn divmod_exist_0() -> @kernel.Thm {
  divmod_exist_0_c.get()
}

///|
/// DIVISION_0
fn step_175() -> Unit raise {
  let t786 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(
    divmod_exist_0(),
  )
  division_0_c.set(@nums.new_specification(@list.List(["DIV", "MOD"]))(t786))
}

///|
let division_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISION_0")

///|
/// `DIVISION_0`
pub fn division_0() -> @kernel.Thm {
  division_0_c.get()
}

///|
/// DIVISION
fn step_176() -> Unit raise {
  let t787 = @meson.meson_tac(@list.List([division_0()]))
  division_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) → m == DIV(m, n) * n + MOD(m, n) && MOD(m, n) < n"),
      t787,
    ),
  )
}

///|
let division_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISION")

///|
/// `DIVISION`
pub fn division() -> @kernel.Thm {
  division_c.get()
}

///|
/// DIV_ZERO
fn step_177() -> Unit raise {
  let t788 = @meson.meson_tac(@list.List([division_0()]))
  div_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, DIV(n, 0) == 0"), t788))
}

///|
let div_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ZERO")

///|
/// `DIV_ZERO`
pub fn div_zero() -> @kernel.Thm {
  div_zero_c.get()
}

///|
/// MOD_ZERO
fn step_178() -> Unit raise {
  let t789 = @meson.meson_tac(@list.List([division_0()]))
  mod_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, MOD(n, 0) == n"), t789))
}

///|
let mod_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ZERO")

///|
/// `MOD_ZERO`
pub fn mod_zero() -> @kernel.Thm {
  mod_zero_c.get()
}

///|
/// DIVISION_SIMP
fn step_179() -> Unit raise {
  let t792 = @meson.asm_meson_tac(@list.List([division(), mult_sym()]))
  let t791 = @simp.asm_simp_tac(
    @list.List([div_zero(), mod_zero(), mult_clauses(), add_clauses()]),
  )
  let t790 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t793 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t790),
      t791,
    ),
    t792,
  )
  division_simp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, DIV(m, n) * n + MOD(m, n) == m) && (∀ m : Num, ∀ n : Num, n * DIV(m, n) + MOD(m, n) == m)"),
      t793,
    ),
  )
}

///|
let division_simp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISION_SIMP")

///|
/// `DIVISION_SIMP`
pub fn division_simp() -> @kernel.Thm {
  division_simp_c.get()
}

///|
/// EQ_DIVMOD
fn step_180() -> Unit raise {
  let t794 = @meson.meson_tac(@list.List([division_simp()]))
  eq_divmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, (DIV(m, p) == DIV(n, p) && MOD(m, p) == MOD(n, p)) == (m == n)"),
      t794,
    ),
  )
}

///|
let eq_divmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_DIVMOD")

///|
/// `EQ_DIVMOD`
pub fn eq_divmod() -> @kernel.Thm {
  eq_divmod_c.get()
}

///|
/// MOD_LT_EQ
fn step_181() -> Unit raise {
  let t795 = @meson.meson_tac(
    @list.List([division(), le_1(), @bool.conjunct1(lt())]),
  )
  mod_lt_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MOD(m, n) < n) == !(n == 0)"), t795),
  )
}

///|
let mod_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_LT_EQ")

///|
/// `MOD_LT_EQ`
pub fn mod_lt_eq() -> @kernel.Thm {
  mod_lt_eq_c.get()
}

///|
/// MOD_LT_EQ_LT
fn step_182() -> Unit raise {
  let t796 = @meson.meson_tac(
    @list.List([division(), le_1(), @bool.conjunct1(lt())]),
  )
  mod_lt_eq_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MOD(m, n) < n) == (0 < n)"), t796),
  )
}

///|
let mod_lt_eq_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_LT_EQ_LT")

///|
/// `MOD_LT_EQ_LT`
pub fn mod_lt_eq_lt() -> @kernel.Thm {
  mod_lt_eq_lt_c.get()
}

///|
/// DIVMOD_UNIQ_LEMMA
fn step_183() -> Unit raise {
  let t838 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(not_le()), le_0()]))
  let t837 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t836 = @tactics.repeat_tac(
    @tactics.undisch_tac(@term_syntax.parse_term("(r2 : Num) < (n : Num)")),
  )
  let t835 = @simp.asm_rewrite_tac(
    @list.List([eq_add_rcancel(), eq_mult_rcancel()]),
  )
  let t834 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) == (q1 : Num) * (n : Num) + (r2 : Num)"))
  let t833 = @tactics.conv_tac(@equal.sym_conv)
  let t832 = @simp.rewrite_tac(@list.List([]))
  let t839 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_then(fn(
                  x829 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s830 = @tactics.subst_all_tac(x829)
                  fn(
                    x831 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s830(x831)
                  }
                }),
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
      t837,
    ),
    t838,
  )
  let t827 = @equal.gsym(add_assoc())
  let t828 = @simp.rewrite_tac(
    @list.List([
      add_clauses(),
      mult_clauses(),
      @equal.gsym(not_le()),
      le_add(),
      t827,
    ]),
  )
  let t825 = @term_syntax.parse_term("(d : Num)")
  let t826 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t825)
  let t824 = @simp.once_rewrite_tac(@list.List([mult_sym()]))
  let t823 = @simp.asm_rewrite_tac(@list.List([]))
  let t820 = @tactics.undisch_tac(@term_syntax.parse_term("(r2 : Num) < (n : Num)"))
  let t821 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x819 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x816 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s817 = @tactics.assume_tac(x816)
        fn(
          x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s817(x818)
        }
      })(@equal.sym(x819))
    }),
    t820,
  )
  let t822 = @list.List([
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.undisch_tac(@term_syntax.parse_term("(r1 : Num) < (n : Num)")),
    ),
    t821,
  ])
  let t815 = @simp.rewrite_tac(
    @list.List([right_add_distrib(), @equal.gsym(add_assoc()), eq_add_lcancel()]),
  )
  let t811 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t812 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
    let s809 = @tactics.subst1_tac(x808)
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
  })
  let t814 = @tactics.disch_then(fn(
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
    t812(t811(x813))
  })
  let t805 = @term_syntax.parse_term("(q2 : Num)")
  let t806 = @bool.specl(
    @list.List([@term_syntax.parse_term("(q1 : Num)"), t805]),
    le_cases(),
  )
  let t807 = @tactics.disj_cases_then(fn(
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
    let s803 = @tactics.mp_tac(x802)
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
  })(t806)
  let t801 = @simp.asm_rewrite_tac(@list.List([]))
  let t840 = @list.List([
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
                        @tactics.undisch_tac(
                          @term_syntax.parse_term("(m : Num) == (q2 : Num) * (n : Num) + (r2 : Num)"),
                        ),
                        t801,
                      ),
                      t807,
                    ),
                    t814,
                  ),
                  t815,
                ),
                t822,
              ),
              t823,
            ),
            t824,
          ),
          t826,
        ),
        @nums.induct_tac,
      ),
      t828,
    ),
    t839,
  ])
  let t800 = @tactics.subgoal_then(@term_syntax.parse_term("(r1 : Num) == (r2 : Num)"), fn(
    x797 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s798 = @tactics.mp_tac(x797)
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
  })
  let t841 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @tactics.strip_tac,
      ),
      t800,
    ),
    t840,
  )
  divmod_uniq_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ q1 : Num, ∀ r1 : Num, ∀ q2 : Num, ∀ r2 : Num, (m == q1 * n + r1 && r1 < n) && m == q2 * n + r2 && r2 < n → q1 == q2 && r1 == r2"),
      t841,
    ),
  )
}

///|
let divmod_uniq_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVMOD_UNIQ_LEMMA",
)

///|
/// `DIVMOD_UNIQ_LEMMA`
pub fn divmod_uniq_lemma() -> @kernel.Thm {
  divmod_uniq_lemma_c.get()
}

///|
/// DIVMOD_UNIQ
fn step_184() -> Unit raise {
  let t857 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(not_le()), le_0()]))
  let t856 = @tactics.undisch_tac(@term_syntax.parse_term("(r : Num) < (n : Num)"))
  let t855 = @tactics.match_mp_tac(division())
  let t854 = @simp.asm_rewrite_tac(@list.List([]))
  let t852 = @term_syntax.parse_term("(n : Num)")
  let t853 = @tactics.map_every(
    fn(
      x849 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s850 = @tactics.exists_tac(x849)
      fn(
        x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s850(x851)
      }
    },
    @list.List([@term_syntax.parse_term("(m : Num)"), t852]),
  )
  let t848 = @tactics.match_mp_tac(divmod_uniq_lemma())
  let t845 = @tactics.conjuncts_then(fn(
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
    let s843 = @tactics.assume_tac(x842)
    fn(
      x844 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s843(x844)
    }
  })
  let t847 = @tactics.disch_then(fn(
    x846 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t845(@equal.gsym(x846))
  })
  let t858 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t847),
                t848,
              ),
              t853,
            ),
            t854,
          ),
          t855,
        ),
        @tactics.disch_tac,
      ),
      t856,
    ),
    t857,
  )
  divmod_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, m == q * n + r && r < n → DIV(m, n) == q && MOD(m, n) == r"),
      t858,
    ),
  )
}

///|
let divmod_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVMOD_UNIQ")

///|
/// `DIVMOD_UNIQ`
pub fn divmod_uniq() -> @kernel.Thm {
  divmod_uniq_c.get()
}

///|
/// MOD_UNIQ
fn step_185() -> Unit raise {
  let t861 = @tactics.disch_then(fn(
    x859 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x859
    @simp.rewrite_tac(@list.List([@drule.match_mp(divmod_uniq())(th)]))
  })
  let t862 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t861)
  mod_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, m == q * n + r && r < n → MOD(m, n) == r"),
      t862,
    ),
  )
}

///|
let mod_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_UNIQ")

///|
/// `MOD_UNIQ`
pub fn mod_uniq() -> @kernel.Thm {
  mod_uniq_c.get()
}

///|
/// DIV_UNIQ
fn step_186() -> Unit raise {
  let t865 = @tactics.disch_then(fn(
    x863 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x863
    @simp.rewrite_tac(@list.List([@drule.match_mp(divmod_uniq())(th)]))
  })
  let t866 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t865)
  div_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ q : Num, ∀ r : Num, m == q * n + r && r < n → DIV(m, n) == q"),
      t866,
    ),
  )
}

///|
let div_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_UNIQ")

///|
/// `DIV_UNIQ`
pub fn div_uniq() -> @kernel.Thm {
  div_uniq_c.get()
}

///|
let div_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_0")

///|
/// `DIV_0`
pub fn div_0() -> @kernel.Thm {
  div_0_c.get()
}

///|
let mod_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_0")

///|
/// `MOD_0`
pub fn mod_0() -> @kernel.Thm {
  mod_0_c.get()
}

///|
/// DIV_0, MOD_0
fn step_187() -> Unit raise {
  let t871 = @simp.asm_rewrite_tac(
    @list.List([mult_clauses(), add_clauses(), lt_nz()]),
  )
  let t870 = @tactics.match_mp_tac(divmod_uniq())
  let t869 = @simp.asm_rewrite_tac(@list.List([div_zero(), mod_zero()]))
  let t868 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t872 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
            @tactics.gen_tac,
          ),
          t868,
        ),
        t869,
      ),
      t870,
    ),
    t871,
  )
  let t873 = (
    @term_syntax.parse_term("(∀ n : Num, DIV(0, n) == 0) && (∀ n : Num, MOD(0, n) == 0)"),
    t872,
  )
  let (div_0, mod_0) = @bool.conj_pair(
    (fn(
      x867 : (
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
      @tactics.prove(x867.0, x867.1)
    })(t873),
  )
  div_0_c.set(div_0)
  mod_0_c.set(mod_0)
}

///|
let div_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MULT")

///|
/// `DIV_MULT`
pub fn div_mult() -> @kernel.Thm {
  div_mult_c.get()
}

///|
let mod_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT")

///|
/// `MOD_MULT`
pub fn mod_mult() -> @kernel.Thm {
  mod_mult_c.get()
}

///|
/// DIV_MULT, MOD_MULT
fn step_188() -> Unit raise {
  let t879 = @simp.asm_rewrite_tac(
    @list.List([mult_clauses(), add_clauses(), mult_ac(), lt_nz()]),
  )
  let t878 = @tactics.match_mp_tac(divmod_uniq())
  let t877 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), mod_0()]))
  let t876 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t875 = @tactics.repeat_tac(@tactics.gen_tac)
  let t880 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
            t875,
          ),
          t876,
        ),
        t877,
      ),
      t878,
    ),
    t879,
  )
  let t881 = (
    @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, !(m == 0) → DIV(m * n, m) == n) && (∀ m : Num, ∀ n : Num, MOD(m * n, m) == 0)"),
    t880,
  )
  let (div_mult, mod_mult) = @bool.conj_pair(
    (fn(
      x874 : (
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
      @tactics.prove(x874.0, x874.1)
    })(t881),
  )
  div_mult_c.set(div_mult)
  mod_mult_c.set(mod_mult)
}

///|
/// MOD_LT
fn step_189() -> Unit raise {
  let t884 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t883 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t882 = @tactics.match_mp_tac(mod_uniq())
  let t885 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t882),
      t883,
    ),
    t884,
  )
  mod_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → MOD(m, n) == m"), t885),
  )
}

///|
let mod_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_LT")

///|
/// `MOD_LT`
pub fn mod_lt() -> @kernel.Thm {
  mod_lt_c.get()
}

///|
/// MOD_EQ_SELF
fn step_190() -> Unit raise {
  let t886 = @meson.meson_tac(
    @list.List([mod_zero(), mod_lt(), division(), le_1()]),
  )
  mod_eq_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MOD(m, n) == m) == (n == 0 || m < n)"),
      t886,
    ),
  )
}

///|
let mod_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EQ_SELF")

///|
/// `MOD_EQ_SELF`
pub fn mod_eq_self() -> @kernel.Thm {
  mod_eq_self_c.get()
}

///|
/// MOD_CASES
fn step_191() -> Unit raise {
  let t892 = @meson.asm_meson_tac(
    @list.List([lt_add_rcancel(), sub_add(), mult_2(), lt_add2()]),
  )
  let t891 = @meson.asm_meson_tac(@list.List([sub_add(), add_sym()]))
  let t893 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([mult_clauses()])), t891),
    t892,
  ])
  let t890 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([not_lt()])))
  let t889 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t888 = @tactics.match_mp_tac(mod_uniq())
  let t887 = @simp.asm_simp_tac(@list.List([mod_lt()]))
  let t894 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.strip_tac),
                @class.cond_cases_tac,
              ),
              t887,
            ),
            t888,
          ),
          t889,
        ),
        t890,
      ),
      @tactics.conj_tac,
    ),
    t893,
  )
  mod_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, n < 2 * p → MOD(n, p) == (if n < p { n } else { n - p })"),
      t894,
    ),
  )
}

///|
let mod_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_CASES")

///|
/// `MOD_CASES`
pub fn mod_cases() -> @kernel.Thm {
  mod_cases_c.get()
}

///|
/// MOD_ADD_CASES
fn step_192() -> Unit raise {
  let t897 = @meson.asm_meson_tac(@list.List([lt_add2()]))
  let t896 = @simp.rewrite_tac(@list.List([mult_2()]))
  let t895 = @tactics.match_mp_tac(mod_cases())
  let t898 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t895),
      t896,
    ),
    t897,
  )
  mod_add_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m < p && n < p → MOD(m + n, p) == (if m + n < p { m + n } else { m + n - p })"),
      t898,
    ),
  )
}

///|
let mod_add_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ADD_CASES")

///|
/// `MOD_ADD_CASES`
pub fn mod_add_cases() -> @kernel.Thm {
  mod_add_cases_c.get()
}

///|
/// MOD_EQ
fn step_193() -> Unit raise {
  let t921 = @tactics.match_accept_tac(add_sym())
  let t920 = @simp.asm_rewrite_tac(
    @list.List([right_add_distrib(), @equal.gsym(add_assoc())]),
  )
  let t916 = @term_syntax.parse_term("(n : Num)")
  let t919 = @tactics.disch_then(fn(
    x918 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x915 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x915))
    })(((x917 : @kernel.Thm) => @bool.spec(t916, x917))(x918))
  })
  let t912 = @drule.match_mp(division())
  let t914 = @tactics.pop_assum(fn(
    x913 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x909 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s910 = @tactics.mp_tac(x909)
      fn(
        x911 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s910(x911)
      }
    })(t912(x913))
  })
  let t908 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num) + DIV((n : Num), (p : Num))"))
  let t907 = @tactics.match_mp_tac(mod_uniq())
  let t922 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(fn(
                x904 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s905 = @tactics.subst1_tac(x904)
                fn(
                  x906 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s905(x906)
                }
              }),
              t907,
            ),
            t908,
          ),
          t914,
        ),
        t919,
      ),
      t920,
    ),
    t921,
  )
  let t903 = @tactics.disch_then(fn(
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
    let s901 = @tactics.subst1_tac(x900)
    fn(
      x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s901(x902)
    }
  })
  let t923 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(@list.List([mult_clauses(), add_clauses()])),
        t903,
      ),
      @tactics.refl_tac,
    ),
    t922,
  ])
  let t899 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t924 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t899),
    t923,
  )
  mod_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, m == n + q * p → MOD(m, p) == MOD(n, p)"),
      t924,
    ),
  )
}

///|
let mod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EQ")

///|
/// `MOD_EQ`
pub fn mod_eq() -> @kernel.Thm {
  mod_eq_c.get()
}

///|
/// DIV_LE
fn step_194() -> Unit raise {
  let t936 = @simp.rewrite_tac(
    @list.List([mult_clauses(), @equal.gsym(add_assoc()), le_add()]),
  )
  let t934 = @term_syntax.parse_term("(n : Num)")
  let t935 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t934)
  let t933 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t932 = @tactics.first_assum(fn(
    x927 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x927
    @simp.gen_rewrite_tac(
      fn(
        x929 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s930 = @equal.rand_conv(x929)
        fn(x931 : @kernel.Term) -> @kernel.Thm raise { s930(x931) }
      },
      @list.List([@drule.match_mp(division())(th)]),
    )
  })
  let t926 = @simp.asm_rewrite_tac(@list.List([div_zero(), le_0()]))
  let t925 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t937 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t925),
              t926,
            ),
            t932,
          ),
          t933,
        ),
        t935,
      ),
      @nums.induct_tac,
    ),
    t936,
  )
  div_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, DIV(m, n) <= m"), t937))
}

///|
let div_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_LE")

///|
/// `DIV_LE`
pub fn div_le() -> @kernel.Thm {
  div_le_c.get()
}

///|
/// DIV_MUL_LE
fn step_195() -> Unit raise {
  let t955 = @simp.rewrite_tac(@list.List([le_add(), mult_ac()]))
  let t954 = @tactics.disch_then(fn(
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
    let th = x949
    @simp.gen_rewrite_tac(
      fn(
        x951 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s952 = @equal.rand_conv(x951)
        fn(x953 : @kernel.Term) -> @kernel.Thm raise { s952(x953) }
      },
      @list.List([@bool.conjunct1(th)]),
    )
  })
  let t946 = @drule.match_mp(division())
  let t943 = @term_syntax.parse_term("(m : Num)")
  let t948 = @tactics.pop_assum(fn(
    x947 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x945 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x940 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s941 = @tactics.mp_tac(x940)
        fn(
          x942 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s941(x942)
        }
      })(((x944 : @kernel.Thm) => @bool.spec(t943, x944))(x945))
    })(t946(x947))
  })
  let t939 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), le_0()]))
  let t938 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t956 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t938),
          t939,
        ),
        t948,
      ),
      t954,
    ),
    t955,
  )
  div_mul_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n * DIV(m, n) <= m"), t956),
  )
}

///|
let div_mul_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MUL_LE")

///|
/// `DIV_MUL_LE`
pub fn div_mul_le() -> @kernel.Thm {
  div_mul_le_c.get()
}

///|
/// MOD_LE_TWICE
fn step_196() -> Unit raise {
  let t974 = @simp.asm_simp_tac(@list.List([@equal.gsym(mult_2()), sub_add()]))
  let t973 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([lt_add_rcancel()]),
        @term_syntax.parse_term("((n : Num) - (m : Num) < m) == (n - m + m < m + m)"),
      ),
    ]),
  )
  let t972 = @simp.asm_simp_tac(@list.List([mult_clauses(), sub_add()]))
  let t971 = @simp.once_rewrite_tac(@list.List([add_sym()]))
  let t970 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t969 = @tactics.match_mp_tac(mod_uniq())
  let t968 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((n : Num), (m : Num)) == n - m"), fn(
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
    let th = x966
    @simp.asm_simp_tac(@list.List([le_refl(), sub_add(), th]))
  })
  let t965 = @simp.once_rewrite_tac(@list.List([add_sym()]))
  let t964 = @simp.asm_simp_tac(
    @list.List([mult_2(), le_add_rcancel(), division(), lt_imp_le(), le_1()]),
  )
  let t962 = @term_syntax.parse_term("(m : Num) + MOD((n : Num), m)")
  let t963 = @tactics.trans_tac(le_trans())(t962)
  let t960 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([not_le()])))
  let t959 = @simp.asm_simp_tac(
    @list.List([le_mult_lcancel(), division(), lt_imp_le(), le_1()]),
  )
  let t958 = @term_syntax.parse_term("2 * (m : Num)")
  let t961 = @list.List([
    @tactics.then_tac(@tactics.trans_tac(le_trans())(t958), t959),
    t960,
  ])
  let t957 = @class.asm_cases_tac(@term_syntax.parse_term("2 * (m : Num) <= (n : Num)"))
  let t975 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t957,
                        ),
                        t961,
                      ),
                      t963,
                    ),
                    t964,
                  ),
                  t965,
                ),
                t968,
              ),
              t969,
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
  )
  mod_le_twice_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, 0 < m && m <= n → 2 * MOD(n, m) <= n"),
      t975,
    ),
  )
}

///|
let mod_le_twice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_LE_TWICE")

///|
/// `MOD_LE_TWICE`
pub fn mod_le_twice() -> @kernel.Thm {
  mod_le_twice_c.get()
}

///|
let div_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_1")

///|
/// `DIV_1`
pub fn div_1() -> @kernel.Thm {
  div_1_c.get()
}

///|
let mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_1")

///|
/// `MOD_1`
pub fn mod_1() -> @kernel.Thm {
  mod_1_c.get()
}

///|
/// DIV_1, MOD_1
fn step_197() -> Unit raise {
  let t979 = @simp.rewrite_tac(@list.List([one(), lt()]))
  let t978 = @simp.rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t977 = @tactics.match_mp_tac(divmod_uniq())
  let t980 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(@list.List([@theorems.and_forall_thm()])),
          @tactics.gen_tac,
        ),
        t977,
      ),
      t978,
    ),
    t979,
  )
  let t981 = (
    @term_syntax.parse_term("(∀ n : Num, DIV(n, 1) == n) && (∀ n : Num, MOD(n, 1) == 0)"),
    t980,
  )
  let (div_1, mod_1) = @bool.conj_pair(
    (fn(
      x976 : (
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
      @tactics.prove(x976.0, x976.1)
    })(t981),
  )
  div_1_c.set(div_1)
  mod_1_c.set(mod_1)
}

///|
/// DIV_LT
fn step_198() -> Unit raise {
  let t984 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t983 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t982 = @tactics.match_mp_tac(div_uniq())
  let t985 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t982),
      t983,
    ),
    t984,
  )
  div_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → DIV(m, n) == 0"), t985),
  )
}

///|
let div_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_LT")

///|
/// `DIV_LT`
pub fn div_lt() -> @kernel.Thm {
  div_lt_c.get()
}

///|
/// MOD_MOD
fn step_199() -> Unit raise {
  let t998 = @tactics.disch_then(fn(
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
    let th = x996
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t995 = @simp.asm_rewrite_tac(
    @list.List([mult_eq_0(), mult_ac(), add_ac()]),
  )
  let t993 = @term_syntax.parse_term("(n : Num) * (p : Num)")
  let t994 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t993]), division()),
  )
  let t992 = @tactics.exists_tac(@term_syntax.parse_term("DIV((m : Num), (n : Num) * (p : Num)) * p"))
  let t991 = @tactics.match_mp_tac(mod_eq())
  let t990 = @tactics.conv_tac(@equal.sym_conv)
  let t989 = @simp.asm_rewrite_tac(@list.List([mod_zero(), mult_clauses()]))
  let t988 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t987 = @simp.asm_rewrite_tac(@list.List([mod_zero(), mult_clauses()]))
  let t986 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t999 = @tactics.then_tac(
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
                      t986,
                    ),
                    t987,
                  ),
                  t988,
                ),
                t989,
              ),
              t990,
            ),
            t991,
          ),
          t992,
        ),
        t994,
      ),
      t995,
    ),
    t998,
  )
  mod_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(MOD(m, n * p), n) == MOD(m, n)"),
      t999,
    ),
  )
}

///|
let mod_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MOD")

///|
/// `MOD_MOD`
pub fn mod_mod() -> @kernel.Thm {
  mod_mod_c.get()
}

///|
/// MOD_MOD_REFL
fn step_200() -> Unit raise {
  let t1006 = @simp.rewrite_tac(@list.List([one(), @nums.not_suc()]))
  let t1005 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), mult_eq_0()]))
  let t1002 = @term_syntax.parse_term("1")
  let t1003 = @term_syntax.parse_term("(n : Num)")
  let t1004 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t1003, t1002]),
      mod_mod(),
    ),
  )
  let t1001 = @simp.asm_rewrite_tac(@list.List([mod_zero()]))
  let t1000 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1007 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1000),
          t1001,
        ),
        t1004,
      ),
      t1005,
    ),
    t1006,
  )
  mod_mod_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, MOD(MOD(m, n), n) == MOD(m, n)"), t1007),
  )
}

///|
let mod_mod_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MOD_REFL")

///|
/// `MOD_MOD_REFL`
pub fn mod_mod_refl() -> @kernel.Thm {
  mod_mod_refl_c.get()
}

///|
/// MOD_MOD_LE
fn step_201() -> Unit raise {
  let t1009 = @meson.asm_meson_tac(@list.List([division(), lte_trans()]))
  let t1008 = @tactics.match_mp_tac(mod_lt())
  let t1010 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1008),
    t1009,
  )
  mod_mod_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, !(n == 0) && n <= p → MOD(MOD(m, n), p) == MOD(m, n)"),
      t1010,
    ),
  )
}

///|
let mod_mod_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MOD_LE")

///|
/// `MOD_MOD_LE`
pub fn mod_mod_le() -> @kernel.Thm {
  mod_mod_le_c.get()
}

///|
/// MOD_EVEN_2
fn step_202() -> Unit raise {
  let t1011 = @simp.simp_tac(
    @list.List([even_exists(), @theorems.left_imp_exists_thm(), mod_mod()]),
  )
  mod_even_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(n) → MOD(MOD(m, n), 2) == MOD(m, 2)"),
      t1011,
    ),
  )
}

///|
let mod_even_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EVEN_2")

///|
/// `MOD_EVEN_2`
pub fn mod_even_2() -> @kernel.Thm {
  mod_even_2_c.get()
}

///|
/// DIV_MULT2
fn step_203() -> Unit raise {
  let t1020 = @simp.asm_simp_tac(@list.List([@equal.gsym(division())]))
  let t1019 = @simp.rewrite_tac(
    @list.List([@equal.gsym(left_add_distrib()), eq_mult_lcancel()]),
  )
  let t1017 = @term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) == b * (a * c)")
  let t1018 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(mult_ac())(t1017)]),
  )
  let t1016 = @simp.asm_simp_tac(@list.List([lt_mult_lcancel(), division()]))
  let t1015 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) * MOD((n : Num), (p : Num))"))
  let t1014 = @tactics.match_mp_tac(div_uniq())
  let t1013 = @simp.asm_rewrite_tac(@list.List([div_zero(), mult_clauses()]))
  let t1012 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1021 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
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
        t1018,
      ),
      t1019,
    ),
    t1020,
  )
  div_mult2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, !(m == 0) → DIV(m * n, m * p) == DIV(n, p)"),
      t1021,
    ),
  )
}

///|
let div_mult2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MULT2")

///|
/// `DIV_MULT2`
pub fn div_mult2() -> @kernel.Thm {
  div_mult2_c.get()
}

///|
/// MOD_MULT2
fn step_204() -> Unit raise {
  let t1032 = @simp.asm_simp_tac(@list.List([@equal.gsym(division())]))
  let t1031 = @simp.rewrite_tac(
    @list.List([@equal.gsym(left_add_distrib()), eq_mult_lcancel()]),
  )
  let t1029 = @term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) == b * (a * c)")
  let t1030 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(mult_ac())(t1029)]),
  )
  let t1028 = @simp.asm_simp_tac(@list.List([lt_mult_lcancel(), division()]))
  let t1027 = @tactics.exists_tac(@term_syntax.parse_term("DIV((n : Num), (p : Num))"))
  let t1026 = @tactics.match_mp_tac(mod_uniq())
  let t1025 = @simp.asm_rewrite_tac(@list.List([mod_zero(), mult_clauses()]))
  let t1024 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1023 = @simp.asm_rewrite_tac(@list.List([mod_zero(), mult_clauses()]))
  let t1022 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1033 = @tactics.then_tac(
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
                      t1022,
                    ),
                    t1023,
                  ),
                  t1024,
                ),
                t1025,
              ),
              t1026,
            ),
            t1027,
          ),
          t1028,
        ),
        t1030,
      ),
      t1031,
    ),
    t1032,
  )
  mod_mult2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(m * n, m * p) == m * MOD(n, p)"),
      t1033,
    ),
  )
}

///|
let mod_mult2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT2")

///|
/// `MOD_MULT2`
pub fn mod_mult2() -> @kernel.Thm {
  mod_mult2_c.get()
}

///|
/// MOD_EXISTS
fn step_205() -> Unit raise {
  let t1043 = @simp.asm_rewrite_tac(@list.List([add_clauses(), mult_ac()]))
  let t1044 = @list.List([@meson.asm_meson_tac(@list.List([division()])), t1043])
  let t1042 = @tactics.subgoal_then(
    @term_syntax.parse_term("(m : Num) == DIV(m, (n : Num)) * n + MOD(m, n)"),
    fn(
      x1037 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1037
      @simp.gen_rewrite_tac(
        fn(
          x1039 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1040 = @equal.land_conv(x1039)
          fn(x1041 : @kernel.Term) -> @kernel.Thm raise { s1040(x1041) }
        },
        @list.List([th]),
      )
    },
  )
  let t1036 = @tactics.exists_tac(@term_syntax.parse_term("DIV((m : Num), (n : Num))"))
  let t1035 = @simp.asm_simp_tac(@list.List([mod_mult()]))
  let t1034 = @simp.asm_rewrite_tac(@list.List([mult_clauses()]))
  let t1045 = @tactics.thenl(
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
                t1034,
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t1035,
        ),
        t1036,
      ),
      t1042,
    ),
    t1044,
  )
  mod_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (∃ q : Num, m == n * q) == (if n == 0 { m == 0 } else { MOD(m, n) == 0 })"),
      t1045,
    ),
  )
}

///|
let mod_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EXISTS")

///|
/// `MOD_EXISTS`
pub fn mod_exists() -> @kernel.Thm {
  mod_exists_c.get()
}

///|
/// LE_RDIV_EQ
fn step_206() -> Unit raise {
  let t1055 = @simp.asm_rewrite_tac(
    @list.List([lt_mult_lcancel(), @equal.gsym(add1()), lt_suc_le()]),
  )
  let t1054 = @meson.asm_meson_tac(@list.List([division()]))
  let t1053 = @simp.simp_tac(
    @list.List([
      left_add_distrib(),
      mult_sym(),
      mult_clauses(),
      lt_add_lcancel(),
    ]),
  )
  let t1052 = @list.List([
    @meson.asm_meson_tac(@list.List([division()])),
    @tactics.all_tac,
  ])
  let t1051 = @tactics.exists_tac(@term_syntax.parse_term("DIV((b : Num), (a : Num)) * a + MOD(b, a)"))
  let t1056 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(let_trans()), t1051),
            @tactics.conj_tac,
          ),
          t1052,
        ),
        t1053,
      ),
      t1054,
    ),
    t1055,
  ])
  let t1057 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("(a : Num) * (n : Num) < a * (DIV((b : Num), a) + 1)"), fn(
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
      let s1049 = @tactics.mp_tac(x1048)
      fn(
        x1050 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1049(x1050)
      }
    }),
    t1056,
  )
  let t1047 = @simp.asm_rewrite_tac(
    @list.List([div_mul_le(), le_mult_lcancel()]),
  )
  let t1046 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * DIV((b : Num), a)"))
  let t1058 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(le_trans()), t1046),
      t1047,
    ),
    t1057,
  ])
  let t1059 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t1058,
  )
  le_rdiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(a == 0) → (n <= DIV(b, a)) == (a * n <= b)"),
      t1059,
    ),
  )
}

///|
let le_rdiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_RDIV_EQ")

///|
/// `LE_RDIV_EQ`
pub fn le_rdiv_eq() -> @kernel.Thm {
  le_rdiv_eq_c.get()
}

///|
/// RDIV_LT_EQ
fn step_207() -> Unit raise {
  let t1060 = @simp.simp_tac(@list.List([@equal.gsym(not_le()), le_rdiv_eq()]))
  rdiv_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(a == 0) → (DIV(b, a) < n) == (b < a * n)"),
      t1060,
    ),
  )
}

///|
let rdiv_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RDIV_LT_EQ")

///|
/// `RDIV_LT_EQ`
pub fn rdiv_lt_eq() -> @kernel.Thm {
  rdiv_lt_eq_c.get()
}

///|
/// LE_LDIV_EQ
fn step_208() -> Unit raise {
  let t1071 = @simp.rewrite_tac(@list.List([not_lt(), not_le(), add1()]))
  let t1070 = @simp.asm_simp_tac(@list.List([le_rdiv_eq()]))
  let t1069 = @simp.gen_rewrite_tac(
    fn(
      x1068 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1062 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1063 = @equal.land_conv(x1062)
        fn(x1064 : @kernel.Term) -> @kernel.Thm raise { s1063(x1064) }
      })(
        (fn(
          x1065 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1066 = @equal.rand_conv(x1065)
          fn(x1067 : @kernel.Term) -> @kernel.Thm raise { s1066(x1067) }
        })(x1068),
      )
    },
    @list.List([@equal.gsym(le_suc_lt())]),
  )
  let t1061 = @simp.once_rewrite_tac(@list.List([@equal.gsym(not_lt())]))
  let t1072 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1061),
        t1069,
      ),
      t1070,
    ),
    t1071,
  )
  le_ldiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(a == 0) → (DIV(b, a) <= n) == (b < a * (n + 1))"),
      t1072,
    ),
  )
}

///|
let le_ldiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_LDIV_EQ")

///|
/// `LE_LDIV_EQ`
pub fn le_ldiv_eq() -> @kernel.Thm {
  le_ldiv_eq_c.get()
}

///|
/// LDIV_LT_EQ
fn step_209() -> Unit raise {
  let t1073 = @simp.simp_tac(@list.List([@equal.gsym(not_le()), le_ldiv_eq()]))
  ldiv_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(a == 0) → (n < DIV(b, a)) == (a * (n + 1) <= b)"),
      t1073,
    ),
  )
}

///|
let ldiv_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LDIV_LT_EQ")

///|
/// `LDIV_LT_EQ`
pub fn ldiv_lt_eq() -> @kernel.Thm {
  ldiv_lt_eq_c.get()
}

///|
/// LE_LDIV
fn step_210() -> Unit raise {
  let t1074 = @meson.meson_tac(@list.List([lt_add(), lt_nz(), let_trans()]))
  let t1075 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([le_ldiv_eq(), left_add_distrib(), mult_clauses()]),
    ),
    t1074,
  )
  le_ldiv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(a == 0) && b <= a * n → DIV(b, a) <= n"),
      t1075,
    ),
  )
}

///|
let le_ldiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_LDIV")

///|
/// `LE_LDIV`
pub fn le_ldiv() -> @kernel.Thm {
  le_ldiv_c.get()
}

///|
/// DIV_MONO
fn step_211() -> Unit raise {
  let t1080 = @meson.asm_meson_tac(@list.List([le_trans()]))
  let t1079 = @simp.asm_simp_tac(@list.List([le_rdiv_eq()]))
  let t1078 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([le_refl()]),
      @term_syntax.parse_term("(∀ k : Num, k <= (a : Num) → k <= (b : Num)) → a <= b"),
    ),
  )
  let t1077 = @simp.asm_rewrite_tac(@list.List([div_zero(), le_refl()]))
  let t1076 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1081 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1076),
          t1077,
        ),
        t1078,
      ),
      t1079,
    ),
    t1080,
  )
  div_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n → DIV(m, p) <= DIV(n, p)"),
      t1081,
    ),
  )
}

///|
let div_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MONO")

///|
/// `DIV_MONO`
pub fn div_mono() -> @kernel.Thm {
  div_mono_c.get()
}

///|
/// DIV_MONO_LT
fn step_212() -> Unit raise {
  let t1084 = @meson.asm_meson_tac(
    @list.List([le_refl(), le_trans(), le_add2(), add_sym()]),
  )
  let t1083 = @simp.asm_simp_tac(
    @list.List([le_rdiv_eq(), left_add_distrib(), mult_clauses()]),
  )
  let t1082 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([add1(), le_suc_lt(), le_refl()]),
      @term_syntax.parse_term("(∀ k : Num, k <= (a : Num) → k + 1 <= (b : Num)) → a < b"),
    ),
  )
  let t1085 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1082),
      t1083,
    ),
    t1084,
  )
  div_mono_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, !(p == 0) && m + p <= n → DIV(m, p) < DIV(n, p)"),
      t1085,
    ),
  )
}

///|
let div_mono_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MONO_LT")

///|
/// `DIV_MONO_LT`
pub fn div_mono_lt() -> @kernel.Thm {
  div_mono_lt_c.get()
}

///|
/// DIV_EQ_0
fn step_213() -> Unit raise {
  let t1097 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t1096 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t1098 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(div_uniq()), t1096),
    t1097,
  )
  let t1095 = @simp.asm_simp_tac(
    @list.List([mult_clauses(), add_clauses(), division()]),
  )
  let t1093 = @drule.match_mp(division())
  let t1090 = @term_syntax.parse_term("(m : Num)")
  let t1099 = @list.List([
    @tactics.then_tac(
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
          x1092 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
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
            (fn(
              x1086 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s1087 = @tactics.subst1_tac(x1086)
              fn(
                x1088 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s1087(x1088)
              }
            })(@bool.conjunct1(x1089))
          })(((x1091 : @kernel.Thm) => @bool.spec(t1090, x1091))(x1092))
        })(t1093(x1094))
      }),
      t1095,
    ),
    t1098,
  ])
  let t1100 = @tactics.thenl(
    @tactics.repeat_tac(
      @tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac),
    ),
    t1099,
  )
  div_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) → (DIV(m, n) == 0) == (m < n)"),
      t1100,
    ),
  )
}

///|
let div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_EQ_0")

///|
/// `DIV_EQ_0`
pub fn div_eq_0() -> @kernel.Thm {
  div_eq_0_c.get()
}

///|
/// MOD_DIV_EQ_0
fn step_214() -> Unit raise {
  let t1103 = @tactics.disch_then(fn(
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
    let th = x1101
    @impconv.imp_rewrite_tac(@list.List([th, div_eq_0(), mod_lt_eq()]))
  })
  let t1104 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1103)
  mod_div_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) → DIV(MOD(m, n), n) == 0"),
      t1104,
    ),
  )
}

///|
let mod_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_DIV_EQ_0")

///|
/// `MOD_DIV_EQ_0`
pub fn mod_div_eq_0() -> @kernel.Thm {
  mod_div_eq_0_c.get()
}

///|
/// MOD_EQ_0
fn step_215() -> Unit raise {
  let t1120 = @meson.asm_meson_tac(
    @list.List([not_le(), @bool.conjunct1(le())]),
  )
  let t1119 = @simp.asm_simp_tac(@list.List([add_clauses(), mult_ac()]))
  let t1121 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(mod_uniq()), t1119),
    t1120,
  )
  let t1118 = @meson.meson_tac(@list.List([]))
  let t1117 = @simp.asm_simp_tac(
    @list.List([mult_clauses(), add_clauses(), division()]),
  )
  let t1115 = @drule.match_mp(division())
  let t1112 = @term_syntax.parse_term("(m : Num)")
  let t1122 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
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
              (fn(
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
                let s1109 = @tactics.subst1_tac(x1108)
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
              })(@bool.conjunct1(x1111))
            })(((x1113 : @kernel.Thm) => @bool.spec(t1112, x1113))(x1114))
          })(t1115(x1116))
        }),
        t1117,
      ),
      t1118,
    ),
    t1121,
  ])
  let t1107 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac),
  )
  let t1106 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), mod_zero()]))
  let t1105 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1123 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1105),
        t1106,
      ),
      t1107,
    ),
    t1122,
  )
  mod_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MOD(m, n) == 0) == (∃ q : Num, m == q * n)"),
      t1123,
    ),
  )
}

///|
let mod_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EQ_0")

///|
/// `MOD_EQ_0`
pub fn mod_eq_0() -> @kernel.Thm {
  mod_eq_0_c.get()
}

///|
/// DIV_EQ_SELF
fn step_216() -> Unit raise {
  let t1138 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(one())]))
  let t1137 = @simp.rewrite_tac(
    @list.List([@equal.gsym(not_le()), one(), le()]),
  )
  let t1136 = @simp.asm_rewrite_tac(@list.List([lt_mult_rcancel()]))
  let t1135 = @simp.gen_rewrite_tac(
    fn(
      x1132 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1133 = @equal.land_conv(x1132)
      fn(x1134 : @kernel.Term) -> @kernel.Thm raise { s1133(x1134) }
    },
    @list.List([@equal.gsym(@lib.el(2, @bool.conjuncts_rule(mult_clauses())))]),
  )
  let t1131 = @simp.asm_simp_tac(@list.List([rdiv_lt_eq()]))
  let t1130 = @tactics.match_mp_tac(lt_imp_ne())
  let t1129 = @simp.asm_rewrite_tac(@list.List([div_zero()]))
  let t1128 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1127 = @simp.asm_rewrite_tac(@list.List([div_1()]))
  let t1126 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1125 = @simp.asm_rewrite_tac(@list.List([div_0()]))
  let t1124 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1139 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
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
                          t1124,
                        ),
                        t1125,
                      ),
                      t1126,
                    ),
                    t1127,
                  ),
                  t1128,
                ),
                t1129,
              ),
              t1130,
            ),
            t1131,
          ),
          t1135,
        ),
        t1136,
      ),
      t1137,
    ),
    t1138,
  )
  div_eq_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (DIV(m, n) == m) == (m == 0 || n == 1)"),
      t1139,
    ),
  )
}

///|
let div_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_EQ_SELF")

///|
/// `DIV_EQ_SELF`
pub fn div_eq_self() -> @kernel.Thm {
  div_eq_self_c.get()
}

///|
/// MOD_REFL
fn step_217() -> Unit raise {
  let t1140 = @meson.meson_tac(@list.List([mult_clauses()]))
  let t1141 = @tactics.then_tac(@simp.simp_tac(@list.List([mod_eq_0()])), t1140)
  mod_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, MOD(n, n) == 0"), t1141))
}

///|
let mod_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_REFL")

///|
/// `MOD_REFL`
pub fn mod_refl() -> @kernel.Thm {
  mod_refl_c.get()
}

///|
/// EVEN_MOD
fn step_218() -> Unit raise {
  let t1142 = @meson.meson_tac(@list.List([mult_sym()]))
  let t1143 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([even_exists(), mod_eq_0()])),
    t1142,
  )
  even_mod_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, EVEN(n) == (MOD(n, 2) == 0)"), t1143),
  )
}

///|
let even_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_MOD")

///|
/// `EVEN_MOD`
pub fn even_mod() -> @kernel.Thm {
  even_mod_c.get()
}

///|
/// ODD_MOD
fn step_219() -> Unit raise {
  let t1152 = @meson.meson_tac(@list.List([@nums.not_suc()]))
  let t1151 = @simp.rewrite_tac(@list.List([two(), one(), lt()]))
  let t1149 = @term_syntax.parse_term("(n : Num)")
  let t1150 = @tactics.spec_tac(@term_syntax.parse_term("MOD((n : Num), 2)"), t1149)
  let t1148 = @list.List([
    @simp.simp_tac(@list.List([division(), two(), @nums.not_suc()])),
    @tactics.all_tac,
  ])
  let t1147 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((n : Num), 2) < 2"), fn(
    x1144 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1145 = @tactics.mp_tac(x1144)
    fn(
      x1146 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1145(x1146)
    }
  })
  let t1153 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(
                @list.List([@equal.gsym(not_even()), even_mod()]),
              ),
            ),
            t1147,
          ),
          t1148,
        ),
        t1150,
      ),
      t1151,
    ),
    t1152,
  )
  odd_mod_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ODD(n) == (MOD(n, 2) == 1)"), t1153),
  )
}

///|
let odd_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_MOD")

///|
/// `ODD_MOD`
pub fn odd_mod() -> @kernel.Thm {
  odd_mod_c.get()
}

///|
/// MOD_2_CASES
fn step_220() -> Unit raise {
  let t1154 = @meson.meson_tac(@list.List([even_mod(), odd_mod(), not_odd()]))
  mod_2_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, MOD(n, 2) == (if EVEN(n) { 0 } else { 1 })"),
      t1154,
    ),
  )
}

///|
let mod_2_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_2_CASES")

///|
/// `MOD_2_CASES`
pub fn mod_2_cases() -> @kernel.Thm {
  mod_2_cases_c.get()
}

///|
/// EVEN_MOD_EVEN
fn step_221() -> Unit raise {
  let t1156 = @simp.asm_simp_tac(@list.List([mod_even_2()]))
  let t1155 = @simp.rewrite_tac(@list.List([even_mod()]))
  let t1157 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1155),
    t1156,
  )
  even_mod_even_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(n) → EVEN(MOD(m, n)) == EVEN(m)"),
      t1157,
    ),
  )
}

///|
let even_mod_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_MOD_EVEN")

///|
/// `EVEN_MOD_EVEN`
pub fn even_mod_even() -> @kernel.Thm {
  even_mod_even_c.get()
}

///|
/// ODD_MOD_EVEN
fn step_222() -> Unit raise {
  let t1158 = @simp.simp_tac(
    @list.List([@equal.gsym(not_even()), even_mod_even()]),
  )
  odd_mod_even_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(n) → ODD(MOD(m, n)) == ODD(m)"),
      t1158,
    ),
  )
}

///|
let odd_mod_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_MOD_EVEN")

///|
/// `ODD_MOD_EVEN`
pub fn odd_mod_even() -> @kernel.Thm {
  odd_mod_even_c.get()
}

///|
/// HALF_DOUBLE
fn step_223() -> Unit raise {
  let t1166 = @simp.simp_tac(@list.List([div_mult(), two(), @nums.not_suc()]))
  let t1167 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x1165 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1159 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1160 = @equal.rand_conv(x1159)
          fn(x1161 : @kernel.Term) -> @kernel.Thm raise { s1160(x1161) }
        })(
          (fn(
            x1162 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1163 = @equal.once_depth_conv(x1162)
            fn(x1164 : @kernel.Term) -> @kernel.Thm raise { s1163(x1164) }
          })(x1165),
        )
      },
      @list.List([mult_sym()]),
    ),
    t1166,
  )
  half_double_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, DIV(2 * n, 2) == n) && (∀ n : Num, DIV(n * 2, 2) == n)"),
      t1167,
    ),
  )
}

///|
let half_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HALF_DOUBLE")

///|
/// `HALF_DOUBLE`
pub fn half_double() -> @kernel.Thm {
  half_double_c.get()
}

///|
/// DOUBLE_HALF
fn step_224() -> Unit raise {
  let t1168 = @simp.rewrite_tac(@list.List([mult_sym()]))
  let t1169 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([even_exists(), @theorems.left_imp_exists_thm(), half_double()]),
    ),
    t1168,
  )
  double_half_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, EVEN(n) → 2 * DIV(n, 2) == n) && (∀ n : Num, EVEN(n) → DIV(n, 2) * 2 == n)"),
      t1169,
    ),
  )
}

///|
let double_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOUBLE_HALF")

///|
/// `DOUBLE_HALF`
pub fn double_half() -> @kernel.Thm {
  double_half_c.get()
}

///|
/// MOD_MULT_RMOD
fn step_225() -> Unit raise {
  let t1179 = @simp.asm_simp_tac(@list.List([division()]))
  let t1178 = @simp.once_rewrite_tac(@list.List([add_sym()]))
  let t1177 = @simp.rewrite_tac(@list.List([eq_mult_lcancel()]))
  let t1175 = @equal.gsym(left_add_distrib())
  let t1176 = @simp.rewrite_tac(@list.List([@equal.gsym(mult_assoc()), t1175]))
  let t1174 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) * DIV((p : Num), (n : Num))"))
  let t1173 = @tactics.match_mp_tac(mod_eq())
  let t1172 = @tactics.conv_tac(@equal.sym_conv)
  let t1171 = @simp.asm_rewrite_tac(@list.List([mod_zero()]))
  let t1170 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1180 = @tactics.then_tac(
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
                      t1170,
                    ),
                    t1171,
                  ),
                  t1172,
                ),
                t1173,
              ),
              t1174,
            ),
            t1176,
          ),
          t1177,
        ),
        @tactics.disj2_tac,
      ),
      t1178,
    ),
    t1179,
  )
  mod_mult_rmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(m * MOD(p, n), n) == MOD(m * p, n)"),
      t1180,
    ),
  )
}

///|
let mod_mult_rmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_RMOD")

///|
/// `MOD_MULT_RMOD`
pub fn mod_mult_rmod() -> @kernel.Thm {
  mod_mult_rmod_c.get()
}

///|
/// MOD_MULT_LMOD
fn step_226() -> Unit raise {
  let t1181 = @simp.simp_tac(@list.List([mod_mult_rmod()]))
  let t1182 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([mult_sym()])),
    t1181,
  )
  mod_mult_lmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(MOD(m, n) * p, n) == MOD(m * p, n)"),
      t1182,
    ),
  )
}

///|
let mod_mult_lmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_LMOD")

///|
/// `MOD_MULT_LMOD`
pub fn mod_mult_lmod() -> @kernel.Thm {
  mod_mult_lmod_c.get()
}

///|
/// MOD_MULT_MOD2
fn step_227() -> Unit raise {
  let t1183 = @simp.simp_tac(@list.List([mod_mult_rmod(), mod_mult_lmod()]))
  mod_mult_mod2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(MOD(m, n) * MOD(p, n), n) == MOD(m * p, n)"),
      t1183,
    ),
  )
}

///|
let mod_mult_mod2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_MOD2")

///|
/// `MOD_MULT_MOD2`
pub fn mod_mult_mod2() -> @kernel.Thm {
  mod_mult_mod2_c.get()
}

///|
/// MOD_EXP_MOD
fn step_228() -> Unit raise {
  let t1193 = @simp.asm_simp_tac(@list.List([mod_mult_rmod()]))
  let t1192 = @list.List([
    @tactics.all_tac,
    @simp.asm_rewrite_tac(@list.List([])),
  ])
  let t1191 = @tactics.exists_tac(
    @term_syntax.parse_term("MOD((m : Num) * MOD(EXP(MOD(m, (n : Num)), (p : Num)), n), n)"),
  )
  let t1190 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1189 = @simp.asm_simp_tac(@list.List([mod_mult_lmod()]))
  let t1188 = @simp.asm_rewrite_tac(@list.List([exp()]))
  let t1186 = @term_syntax.parse_term("(p : Num)")
  let t1187 = @tactics.spec_tac(@term_syntax.parse_term("(p : Num)"), t1186)
  let t1185 = @simp.asm_rewrite_tac(@list.List([mod_zero()]))
  let t1184 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1194 = @tactics.then_tac(
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
                        t1184,
                      ),
                      t1185,
                    ),
                    t1187,
                  ),
                  @nums.induct_tac,
                ),
                t1188,
              ),
              t1189,
            ),
            t1190,
          ),
          t1191,
        ),
        @tactics.conj_tac,
      ),
      t1192,
    ),
    t1193,
  )
  mod_exp_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(EXP(MOD(m, n), p), n) == MOD(EXP(m, p), n)"),
      t1194,
    ),
  )
}

///|
let mod_exp_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EXP_MOD")

///|
/// `MOD_EXP_MOD`
pub fn mod_exp_mod() -> @kernel.Thm {
  mod_exp_mod_c.get()
}

///|
/// MOD_MULT_ADD
fn step_229() -> Unit raise {
  let t1201 = @simp.asm_simp_tac(
    @list.List([
      right_add_distrib(),
      @equal.gsym(add_assoc()),
      eq_add_lcancel(),
      division(),
    ]),
  )
  let t1200 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) + DIV((p : Num), (n : Num))"))
  let t1199 = @tactics.match_mp_tac(mod_uniq())
  let t1198 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), add_clauses()]))
  let t1197 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1195 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1196 = @list.List([
    @simp.simp_tac(@list.List([mult_ac(), add_ac()])),
    t1195,
  ])
  let t1202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.match_mp_tac(
                  @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")),
                ),
                @tactics.conj_tac,
              ),
              t1196,
            ),
            t1197,
          ),
          t1198,
        ),
        t1199,
      ),
      t1200,
    ),
    t1201,
  )
  mod_mult_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(m * n + p, n) == MOD(p, n)) && (∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(n * m + p, n) == MOD(p, n)) && (∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(p + m * n, n) == MOD(p, n)) && (∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(p + n * m, n) == MOD(p, n))"),
      t1202,
    ),
  )
}

///|
let mod_mult_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_ADD")

///|
/// `MOD_MULT_ADD`
pub fn mod_mult_add() -> @kernel.Thm {
  mod_mult_add_c.get()
}

///|
/// DIV_MULT_ADD
fn step_230() -> Unit raise {
  let t1208 = @meson.asm_meson_tac(@list.List([division()]))
  let t1207 = @simp.rewrite_tac(
    @list.List([right_add_distrib(), @equal.gsym(add_assoc())]),
  )
  let t1206 = @tactics.exists_tac(@term_syntax.parse_term("MOD((b : Num), (n : Num))"))
  let t1205 = @tactics.match_mp_tac(div_uniq())
  let t1203 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1204 = @list.List([
    @simp.simp_tac(@list.List([mult_ac(), add_ac()])),
    t1203,
  ])
  let t1209 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.match_mp_tac(
                @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")),
              ),
              @tactics.conj_tac,
            ),
            t1204,
          ),
          t1205,
        ),
        t1206,
      ),
      t1207,
    ),
    t1208,
  )
  div_mult_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, ∀ b : Num, ∀ n : Num, !(n == 0) → DIV(a * n + b, n) == a + DIV(b, n)) && (∀ a : Num, ∀ b : Num, ∀ n : Num, !(n == 0) → DIV(n * a + b, n) == a + DIV(b, n)) && (∀ a : Num, ∀ b : Num, ∀ n : Num, !(n == 0) → DIV(b + a * n, n) == DIV(b, n) + a) && (∀ a : Num, ∀ b : Num, ∀ n : Num, !(n == 0) → DIV(b + n * a, n) == DIV(b, n) + a)"),
      t1209,
    ),
  )
}

///|
let div_mult_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MULT_ADD")

///|
/// `DIV_MULT_ADD`
pub fn div_mult_add() -> @kernel.Thm {
  div_mult_add_c.get()
}

///|
/// MOD_ADD_MOD
fn step_231() -> Unit raise {
  let t1218 = @simp.asm_simp_tac(@list.List([division()]))
  let t1216 = @term_syntax.parse_term("(a : Num) + (b : Num) + ((c : Num) + (d : Num)) == c + a + (d + b)")
  let t1217 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(add_ac())(t1216)]),
  )
  let t1215 = @simp.rewrite_tac(@list.List([right_add_distrib()]))
  let t1214 = @tactics.exists_tac(@term_syntax.parse_term("DIV((a : Num), (n : Num)) + DIV((b : Num), n)"))
  let t1213 = @tactics.match_mp_tac(mod_eq())
  let t1212 = @tactics.conv_tac(@equal.sym_conv)
  let t1211 = @simp.asm_rewrite_tac(@list.List([mod_zero()]))
  let t1210 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1219 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
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
        t1217,
      ),
      @tactics.binop_tac,
    ),
    t1218,
  )
  mod_add_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, MOD(MOD(a, n) + MOD(b, n), n) == MOD(a + b, n)"),
      t1219,
    ),
  )
}

///|
let mod_add_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ADD_MOD")

///|
/// `MOD_ADD_MOD`
pub fn mod_add_mod() -> @kernel.Thm {
  mod_add_mod_c.get()
}

///|
/// DIV_ADD_MOD
fn step_232() -> Unit raise {
  let t1259 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t1258 = @simp.asm_rewrite_tac(
    @list.List([eq_add_rcancel(), eq_add_lcancel(), eq_mult_rcancel()]),
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
    let th_2 = x1254
    let t1256 = @tactics.mp_tac(th_2)
    @tactics.then_tac(
      @tactics.then_tac(@tactics.eq_tac, @tactics.disch_tac),
      t1256,
    )
  })
  let t1253 = @simp.rewrite_tac(@list.List([@equal.gsym(right_add_distrib())]))
  let t1251 = @term_syntax.parse_term("(a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)")
  let t1252 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(add_ac())(t1251)]),
  )
  let t1250 = @tactics.disch_then(fn(
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
    let th_1 = x1244
    @simp.gen_rewrite_tac(
      (x1249 : (@kernel.Term) -> @kernel.Thm raise) => {
        @lib.funpow(
          2,
          fn(
            x1246 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1247 = @equal.land_conv(x1246)
            fn(x1248 : @kernel.Term) -> @kernel.Thm raise { s1247(x1248) }
          },
          x1249,
        )
      },
      @list.List([th_1]),
    )
  })
  let t1243 = @tactics.disch_then(fn(
    x1239 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th1 = x1239
    @tactics.disch_then(fn(
      x1241 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th2 = x1241
      @tactics.mp_tac(
        @kernel.mk_comb_rule(
          @equal.ap_term(@term_syntax.parse_term("op_plus"), th2),
          th1,
        ),
      )
    })
  })
  let t1238 = @tactics.disch_then(fn(
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
    let th = x1226
    let t1236 = @term_syntax.parse_term("(b : Num)")
    let t1237 = @term_syntax.parse_term("(a : Num)")
    @tactics.map_every(
      fn(
        x1235 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x1231 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
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
            let s1229 = @tactics.mp_tac(x1228)
            fn(
              x1230 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1229(x1230)
            }
          })(@bool.conjunct1(x1231))
        })(
          (fn(x1234 : @kernel.Term) -> @kernel.Thm raise {
            (fn(
              x1232 : @kernel.Term,
            ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
              fn(x1233 : @kernel.Thm) -> @kernel.Thm raise {
                @bool.spec(x1232, x1233)
              }
            })(x1234)(th)
          })(x1235),
        )
      },
      @list.List([@term_syntax.parse_term("(a : Num) + (b : Num)"), t1237, t1236]),
    )
  })
  let t1223 = @drule.match_mp(division())
  let t1225 = @tactics.first_assum(fn(
    x1224 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1220 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1221 = @tactics.mp_tac(x1220)
      fn(
        x1222 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1221(x1222)
      }
    })(t1223(x1224))
  })
  let t1260 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t1225,
                  ),
                  t1238,
                ),
                t1243,
              ),
              t1250,
            ),
            t1252,
          ),
          t1253,
        ),
        t1257,
      ),
      t1258,
    ),
    t1259,
  )
  div_add_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, !(n == 0) → (MOD(a + b, n) == MOD(a, n) + MOD(b, n)) == (DIV(a + b, n) == DIV(a, n) + DIV(b, n))"),
      t1260,
    ),
  )
}

///|
let div_add_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ADD_MOD")

///|
/// `DIV_ADD_MOD`
pub fn div_add_mod() -> @kernel.Thm {
  div_add_mod_c.get()
}

///|
/// MOD_ADD_EQ_EQ
fn step_233() -> Unit raise {
  let t1261 = @meson.meson_tac(
    @list.List([mod_zero(), mod_eq_self(), mod_add_mod()]),
  )
  mod_add_eq_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, (MOD(x + y, n) == MOD(x, n) + MOD(y, n)) == (n == 0 || MOD(x, n) + MOD(y, n) < n)"),
      t1261,
    ),
  )
}

///|
let mod_add_eq_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ADD_EQ_EQ")

///|
/// `MOD_ADD_EQ_EQ`
pub fn mod_add_eq_eq() -> @kernel.Thm {
  mod_add_eq_eq_c.get()
}

///|
/// DIV_ADD_EQ_EQ
fn step_234() -> Unit raise {
  let t1262 = @metis.metis_tac(
    @list.List([div_zero(), add_clauses(), div_add_mod(), mod_add_eq_eq()]),
  )
  div_add_eq_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, (DIV(x + y, n) == DIV(x, n) + DIV(y, n)) == (n == 0 || MOD(x, n) + MOD(y, n) < n)"),
      t1262,
    ),
  )
}

///|
let div_add_eq_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ADD_EQ_EQ")

///|
/// `DIV_ADD_EQ_EQ`
pub fn div_add_eq_eq() -> @kernel.Thm {
  div_add_eq_eq_c.get()
}

///|
/// DIV_ADD_EQ
fn step_235() -> Unit raise {
  let t1263 = @simp.simp_tac(@list.List([div_add_eq_eq()]))
  div_add_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, MOD(x, n) + MOD(y, n) < n → DIV(x + y, n) == DIV(x, n) + DIV(y, n)"),
      t1263,
    ),
  )
}

///|
let div_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ADD_EQ")

///|
/// `DIV_ADD_EQ`
pub fn div_add_eq() -> @kernel.Thm {
  div_add_eq_c.get()
}

///|
/// MOD_ADD_EQ
fn step_236() -> Unit raise {
  let t1264 = @simp.simp_tac(@list.List([mod_add_eq_eq()]))
  mod_add_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, MOD(x, n) + MOD(y, n) < n → MOD(x + y, n) == MOD(x, n) + MOD(y, n)"),
      t1264,
    ),
  )
}

///|
let mod_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ADD_EQ")

///|
/// `MOD_ADD_EQ`
pub fn mod_add_eq() -> @kernel.Thm {
  mod_add_eq_c.get()
}

///|
/// DIV_REFL
fn step_237() -> Unit raise {
  let t1274 = @simp.rewrite_tac(@list.List([lt_0()]))
  let t1272 = @term_syntax.parse_term("(n : Num)")
  let t1273 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1272)
  let t1271 = @tactics.pop_assum(fn(
    x1268 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1269 = @tactics.mp_tac(x1268)
    fn(
      x1270 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1269(x1270)
    }
  })
  let t1267 = @simp.rewrite_tac(@list.List([add_clauses(), mult_clauses()]))
  let t1266 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1265 = @tactics.match_mp_tac(div_uniq())
  let t1275 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1265),
              t1266,
            ),
            t1267,
          ),
          t1271,
        ),
        t1273,
      ),
      @nums.induct_tac,
    ),
    t1274,
  )
  div_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → DIV(n, n) == 1"), t1275),
  )
}

///|
let div_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_REFL")

///|
/// `DIV_REFL`
pub fn div_refl() -> @kernel.Thm {
  div_refl_c.get()
}

///|
/// MOD_LE
fn step_238() -> Unit raise {
  let t1285 = @simp.rewrite_tac(@list.List([le_add()]))
  let t1284 = @simp.once_rewrite_tac(@list.List([add_sym()]))
  let t1283 = @tactics.first_assum(fn(
    x1278 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1278
    @simp.gen_rewrite_tac(
      fn(
        x1280 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1281 = @equal.rand_conv(x1280)
        fn(x1282 : @kernel.Term) -> @kernel.Thm raise { s1281(x1282) }
      },
      @list.List([@drule.match_mp(division())(th)]),
    )
  })
  let t1277 = @simp.asm_rewrite_tac(@list.List([mod_zero(), le_refl()]))
  let t1276 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1286 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1276),
          t1277,
        ),
        t1283,
      ),
      t1284,
    ),
    t1285,
  )
  mod_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, MOD(m, n) <= m"), t1286))
}

///|
let mod_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_LE")

///|
/// `MOD_LE`
pub fn mod_le() -> @kernel.Thm {
  mod_le_c.get()
}

///|
/// DIV_MONO2
fn step_239() -> Unit raise {
  let t1294 = @meson.asm_meson_tac(@list.List([le_add(), le()]))
  let t1292 = @term_syntax.parse_term("(m : Num)")
  let t1293 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1292]), division()),
  )
  let t1291 = @simp.once_rewrite_tac(@list.List([mult_sym()]))
  let t1290 = @simp.asm_rewrite_tac(@list.List([le_mult_rcancel()]))
  let t1289 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) * DIV((n : Num), m)"))
  let t1288 = @tactics.match_mp_tac(le_trans())
  let t1287 = @simp.asm_simp_tac(@list.List([le_rdiv_eq()]))
  let t1295 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1287),
              t1288,
            ),
            t1289,
          ),
          t1290,
        ),
        t1291,
      ),
      t1293,
    ),
    t1294,
  )
  div_mono2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, !(p == 0) && p <= m → DIV(n, m) <= DIV(n, p)"),
      t1295,
    ),
  )
}

///|
let div_mono2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MONO2")

///|
/// `DIV_MONO2`
pub fn div_mono2() -> @kernel.Thm {
  div_mono2_c.get()
}

///|
/// DIV_LE_EXCLUSION
fn step_240() -> Unit raise {
  let t1307 = @simp.rewrite_tac(@list.List([@equal.gsym(add1()), lt_suc_le()]))
  let t1306 = @simp.asm_simp_tac(
    @list.List([le_mult_lcancel(), lt_mult_rcancel(), le_rdiv_eq()]),
  )
  let t1305 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1304 = @list.List([
    @meson.asm_meson_tac(@list.List([let_trans(), mult_ac()])),
    @tactics.all_tac,
  ])
  let t1303 = @tactics.subgoal_then(
    @term_syntax.parse_term("(b : Num) * ((d : Num) * (k : Num)) <= b * (c : Num) → b * k * d < ((a : Num) + 1) * d"),
    fn(
      x1300 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1301 = @tactics.mp_tac(x1300)
      fn(
        x1302 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1301(x1302)
      }
    },
  )
  let t1299 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1298 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([le_refl()]),
      @term_syntax.parse_term("(∀ k : Num, k <= (a : Num) → k <= (b : Num)) → a <= b"),
    ),
  )
  let t1297 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), lt()]))
  let t1296 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1308 = @tactics.then_tac(
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
                      t1296,
                    ),
                    t1297,
                  ),
                  @tactics.strip_tac,
                ),
                t1298,
              ),
              t1299,
            ),
            t1303,
          ),
          t1304,
        ),
        t1305,
      ),
      t1306,
    ),
    t1307,
  )
  div_le_exclusion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, !(b == 0) && b * c < (a + 1) * d → DIV(c, d) <= DIV(a, b)"),
      t1308,
    ),
  )
}

///|
let div_le_exclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIV_LE_EXCLUSION",
)

///|
/// `DIV_LE_EXCLUSION`
pub fn div_le_exclusion() -> @kernel.Thm {
  div_le_exclusion_c.get()
}

///|
/// DIV_EQ_EXCLUSION
fn step_241() -> Unit raise {
  let t1313 = @meson.asm_meson_tac(
    @list.List([mult_sym(), le_antisym(), div_le_exclusion()]),
  )
  let t1312 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), lt()]))
  let t1311 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1310 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), lt()]))
  let t1309 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == 0"))
  let t1314 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1309),
          t1310,
        ),
        t1311,
      ),
      t1312,
    ),
    t1313,
  )
  div_eq_exclusion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, b * c < (a + 1) * d && a * d < (c + 1) * b → DIV(a, b) == DIV(c, d)"),
      t1314,
    ),
  )
}

///|
let div_eq_exclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIV_EQ_EXCLUSION",
)

///|
/// `DIV_EQ_EXCLUSION`
pub fn div_eq_exclusion() -> @kernel.Thm {
  div_eq_exclusion_c.get()
}

///|
/// MULT_DIV_LE
fn step_242() -> Unit raise {
  let t1338 = @simp.rewrite_tac(@list.List([mult_ac(), le_add()]))
  let t1337 = @simp.rewrite_tac(@list.List([left_add_distrib()]))
  let t1336 = @tactics.disch_then(fn(
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
    let th = x1327
    @simp.gen_rewrite_tac(
      fn(
        x1335 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1329 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1330 = @equal.rand_conv(x1329)
          fn(x1331 : @kernel.Term) -> @kernel.Thm raise { s1330(x1331) }
        })(
          (fn(
            x1332 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1333 = @equal.rand_conv(x1332)
            fn(x1334 : @kernel.Term) -> @kernel.Thm raise { s1333(x1334) }
          })(x1335),
        )
      },
      @list.List([@bool.conjunct1(th)]),
    )
  })
  let t1324 = @drule.match_mp(division())
  let t1321 = @term_syntax.parse_term("(n : Num)")
  let t1326 = @tactics.first_assum(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1323 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1318 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1319 = @tactics.mp_tac(x1318)
        fn(
          x1320 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1319(x1320)
        }
      })(((x1322 : @kernel.Thm) => @bool.spec(t1321, x1322))(x1323))
    })(t1324(x1325))
  })
  let t1317 = @simp.asm_simp_tac(@list.List([le_rdiv_eq()]))
  let t1316 = @simp.asm_rewrite_tac(
    @list.List([le_refl(), div_zero(), mult_clauses()]),
  )
  let t1315 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1339 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1315),
              t1316,
            ),
            t1317,
          ),
          t1326,
        ),
        t1336,
      ),
      t1337,
    ),
    t1338,
  )
  mult_div_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m * DIV(n, p) <= DIV(m * n, p)"),
      t1339,
    ),
  )
}

///|
let mult_div_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_DIV_LE")

///|
/// `MULT_DIV_LE`
pub fn mult_div_le() -> @kernel.Thm {
  mult_div_le_c.get()
}

///|
/// DIV_DIV
fn step_243() -> Unit raise {
  let t1347 = @simp.asm_simp_tac(
    @list.List([le_rdiv_eq(), mult_eq_0(), mult_assoc()]),
  )
  let t1346 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([le_antisym()]),
      @term_syntax.parse_term("(∀ k : Num, (k <= (m : Num)) == (k <= (n : Num))) → m == n"),
    ),
  )
  let t1345 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1344 = @simp.rewrite_tac(
    @list.List([mult_eq_0(), @class.de_morgan_thm()]),
  )
  let t1343 = @simp.asm_rewrite_tac(
    @list.List([div_0(), mult_clauses(), div_zero()]),
  )
  let t1342 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1341 = @simp.asm_rewrite_tac(@list.List([mult_clauses(), div_zero()]))
  let t1340 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1348 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1340),
                t1341,
              ),
              t1342,
            ),
            t1343,
          ),
          t1344,
        ),
        t1345,
      ),
      t1346,
    ),
    t1347,
  )
  div_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, DIV(DIV(m, n), p) == DIV(m, n * p)"),
      t1348,
    ),
  )
}

///|
let div_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_DIV")

///|
/// `DIV_DIV`
pub fn div_div() -> @kernel.Thm {
  div_div_c.get()
}

///|
/// DIV_MOD
fn step_244() -> Unit raise {
  let t1364 = @meson.meson_tac(
    @list.List([add_sym(), mult_sym(), le_add_rcancel()]),
  )
  let t1363 = @simp.rewrite_tac(@list.List([mult_ac()]))
  let t1360 = @simp.asm_simp_tac(
    @list.List([le_rdiv_eq(), mult_eq_0(), div_div(), left_add_distrib()]),
  )
  let t1359 = @term_syntax.parse_term("(n : Num) * (p : Num)")
  let t1361 = @tactics.then_tac(
    @tactics.mp_tac(
      @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1359]), division()),
    ),
    t1360,
  )
  let t1358 = @simp.asm_rewrite_tac(@list.List([]))
  let t1357 = @term_syntax.parse_term("(p : Num)")
  let t1362 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.specl(
          @list.List([@term_syntax.parse_term("DIV((m : Num), (n : Num))"), t1357]),
          division(),
        ),
      ),
      t1358,
    ),
    t1361,
  ])
  let t1356 = @tactics.exists_tac(
    @term_syntax.parse_term("(k : Num) + (p : Num) * DIV(DIV((m : Num), (n : Num)), p) <= DIV(m, n)"),
  )
  let t1355 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1354 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1353 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([le_antisym()]),
      @term_syntax.parse_term("(∀ k : Num, (k <= (m : Num)) == (k <= (n : Num))) → m == n"),
    ),
  )
  let t1352 = @simp.asm_rewrite_tac(
    @list.List([mod_0(), mult_clauses(), div_zero()]),
  )
  let t1351 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1350 = @simp.asm_rewrite_tac(@list.List([mod_zero(), mult_clauses()]))
  let t1349 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1365 = @tactics.then_tac(
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
                          t1349,
                        ),
                        t1350,
                      ),
                      t1351,
                    ),
                    t1352,
                  ),
                  t1353,
                ),
                t1354,
              ),
              t1355,
            ),
            t1356,
          ),
          @tactics.conj_tac,
        ),
        t1362,
      ),
      t1363,
    ),
    t1364,
  )
  div_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(DIV(m, n), p) == DIV(MOD(m, n * p), n)"),
      t1365,
    ),
  )
}

///|
let div_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_MOD")

///|
/// `DIV_MOD`
pub fn div_mod() -> @kernel.Thm {
  div_mod_c.get()
}

///|
/// MOD_MULT_MOD
fn step_245() -> Unit raise {
  let t1378 = @simp.rewrite_tac(@list.List([division_simp()]))
  let t1376 = @equal.gsym(div_div())
  let t1377 = @simp.rewrite_tac(
    @list.List([@equal.gsym(left_add_distrib()), add_assoc(), t1376]),
  )
  let t1374 = @term_syntax.parse_term("(d : Num) * ((n : Num) * (p : Num)) == n * (d * p)")
  let t1375 = @simp.rewrite_tac(@list.List([@theorems.ac(mult_ac())(t1374)]))
  let t1373 = @simp.rewrite_tac(@list.List([division_simp(), div_div()]))
  let t1372 = @tactics.exists_tac(@term_syntax.parse_term("DIV(DIV((m : Num), (n : Num)), (p : Num)) * (n * p)"))
  let t1371 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([eq_add_lcancel()]),
      @term_syntax.parse_term("(∃ a : Num, a + (x : Num) == a + (y : Num)) → x == y"),
    ),
  )
  let t1369 = @metis.asm_metis_tac(@list.List([division(), mult_sym()]))
  let t1370 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([mult_clauses(), mod_zero()])),
      t1369,
    ),
    @tactics.all_tac,
  ])
  let t1368 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1367 = @simp.asm_rewrite_tac(
    @list.List([mult_clauses(), mod_zero(), add_clauses()]),
  )
  let t1366 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1379 = @tactics.then_tac(
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
                      t1366,
                    ),
                    t1367,
                  ),
                  t1368,
                ),
                t1370,
              ),
              t1371,
            ),
            t1372,
          ),
          t1373,
        ),
        t1375,
      ),
      t1377,
    ),
    t1378,
  )
  mod_mult_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, MOD(m, n * p) == n * MOD(DIV(m, n), p) + MOD(m, n)"),
      t1379,
    ),
  )
}

///|
let mod_mult_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MULT_MOD")

///|
/// `MOD_MULT_MOD`
pub fn mod_mult_mod() -> @kernel.Thm {
  mod_mult_mod_c.get()
}

///|
/// MOD_MOD_EXP_MIN
fn step_246() -> Unit raise {
  let t1406 = @simp.asm_simp_tac(
    @list.List([exp_add(), mod_mod(), mult_eq_0(), exp_eq_0()]),
  )
  let t1407 = @list.List([
    @meson.asm_meson_tac(@list.List([le_cases(), le_exists()])),
    t1406,
  ])
  let t1405 = @tactics.choose_then(fn(
    x1402 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1403 = @tactics.subst1_tac(x1402)
    fn(
      x1404 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1403(x1404)
    }
  })
  let t1408 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Num, (m : Num) == (n : Num) + d"), t1405),
    t1407,
  )
  let t1401 = @simp.asm_simp_tac(
    @list.List([division(), exp_eq_0(), le_exp(), le_add()]),
  )
  let t1400 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (m : Num))"))
  let t1399 = @tactics.match_mp_tac(lte_trans())
  let t1398 = @tactics.match_mp_tac(mod_lt())
  let t1395 = @simp.gen_rewrite_rule(
    fn(
      x1394 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1394
    },
    @list.List([le_exists()]),
  )
  let t1396 = @tactics.choose_then(fn(
    x1391 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1392 = @tactics.subst1_tac(x1391)
    fn(
      x1393 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1392(x1393)
    }
  })
  let t1409 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_x_assum(fn(
              x1397 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              t1396(t1395(x1397))
            }),
            t1398,
          ),
          t1399,
        ),
        t1400,
      ),
      t1401,
    ),
    t1408,
  ])
  let t1390 = @simp.asm_rewrite_tac(@list.List([]))
  let t1389 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t1387 = @simp.rewrite_tac(@list.List([min()]))
  let t1386 = @meson.asm_meson_tac(@list.List([le()]))
  let t1385 = @simp.asm_rewrite_tac(@list.List([]))
  let t1384 = @simp.asm_rewrite_tac(@list.List([]))
  let t1383 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t1382 = @simp.asm_rewrite_tac(
    @list.List([mod_zero(), mod_1(), mod_0(), le_0()]),
  )
  let t1381 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1388 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.asm_rewrite_tac(@list.List([exp_zero(), min()])),
                  t1381,
                ),
                t1382,
              ),
              t1383,
            ),
            t1384,
          ),
          @class.cond_cases_tac,
        ),
        t1385,
      ),
      t1386,
    ),
    t1387,
  ])
  let t1380 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1410 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1380),
          t1388,
        ),
        t1389,
      ),
      t1390,
    ),
    t1409,
  )
  mod_mod_exp_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ p : Num, ∀ m : Num, ∀ n : Num, MOD(MOD(x, EXP(p, m)), EXP(p, n)) == MOD(x, EXP(p, MIN(m, n)))"),
      t1410,
    ),
  )
}

///|
let mod_mod_exp_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MOD_MOD_EXP_MIN",
)

///|
/// `MOD_MOD_EXP_MIN`
pub fn mod_mod_exp_min() -> @kernel.Thm {
  mod_mod_exp_min_c.get()
}

///|
let div_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_EXP")

///|
/// `DIV_EXP`
pub fn div_exp() -> @kernel.Thm {
  div_exp_c.get()
}

///|
let mod_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_EXP")

///|
/// `MOD_EXP`
pub fn mod_exp() -> @kernel.Thm {
  mod_exp_c.get()
}

///|
/// DIV_EXP, MOD_EXP
fn step_247() -> Unit raise {
  let t1421 = @equal.gsym(not_le())
  let t1422 = @simp.asm_rewrite_tac(@list.List([@equal.sym(one()), t1421]))
  let t1420 = @simp.rewrite_tac(
    @list.List([lt(), @equal.gsym(not_lt()), one(), two()]),
  )
  let t1419 = @simp.asm_rewrite_tac(
    @list.List([exp_one(), add_clauses(), mult_clauses(), lt_exp()]),
  )
  let t1418 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t1417 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(exp_add()), exp_lt_0(), sub_add(), add_clauses()]),
  )
  let t1416 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) <= (n : Num)"))
  let t1415 = @tactics.match_mp_tac(divmod_uniq())
  let t1414 = @simp.asm_rewrite_tac(@list.List([]))
  let t1413 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1412 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1423 = @tactics.then_tac(
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
                        @list.List([@theorems.and_forall_thm()]),
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
          ),
          t1418,
        ),
        t1419,
      ),
      t1420,
    ),
    t1422,
  )
  let t1424 = (
    @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, ∀ p : Num, !(m == 0) → DIV(EXP(m, n), EXP(m, p)) == (if p <= n { EXP(m, n - p) } else { if m == 1 { 1 } else { 0 } })) && (∀ m : Num, ∀ n : Num, ∀ p : Num, !(m == 0) → MOD(EXP(m, n), EXP(m, p)) == (if p <= n || m == 1 { 0 } else { EXP(m, n) }))"),
    t1423,
  )
  let (div_exp, mod_exp) = @bool.conj_pair(
    (fn(
      x1411 : (
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
      @tactics.prove(x1411.0, x1411.1)
    })(t1424),
  )
  div_exp_c.set(div_exp)
  mod_exp_c.set(mod_exp)
}

///|
/// FORALL_LT_MOD_THM
fn step_248() -> Unit raise {
  let t1425 = @meson.meson_tac(@list.List([lt(), mod_eq_self(), mod_lt_eq()]))
  forall_lt_mod_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, (∀ a : Num, a < n → P(a)) == (n == 0 || (∀ a : Num, P(MOD(a, n))))"),
      t1425,
    ),
  )
}

///|
let forall_lt_mod_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_LT_MOD_THM",
)

///|
/// `FORALL_LT_MOD_THM`
pub fn forall_lt_mod_thm() -> @kernel.Thm {
  forall_lt_mod_thm_c.get()
}

///|
/// FORALL_MOD_THM
fn step_249() -> Unit raise {
  let t1426 = @simp.simp_tac(@list.List([forall_lt_mod_thm()]))
  forall_mod_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, !(n == 0) → (∀ a : Num, P(MOD(a, n))) == (∀ a : Num, a < n → P(a))"),
      t1426,
    ),
  )
}

///|
let forall_mod_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_MOD_THM")

///|
/// `FORALL_MOD_THM`
pub fn forall_mod_thm() -> @kernel.Thm {
  forall_mod_thm_c.get()
}

///|
/// EXISTS_LT_MOD_THM
fn step_250() -> Unit raise {
  let t1427 = @meson.meson_tac(@list.List([lt(), mod_eq_self(), mod_lt_eq()]))
  exists_lt_mod_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, (∃ a : Num, a < n && P(a)) == (!(n == 0) && (∃ a : Num, P(MOD(a, n))))"),
      t1427,
    ),
  )
}

///|
let exists_lt_mod_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_LT_MOD_THM",
)

///|
/// `EXISTS_LT_MOD_THM`
pub fn exists_lt_mod_thm() -> @kernel.Thm {
  exists_lt_mod_thm_c.get()
}

///|
/// EXISTS_MOD_THM
fn step_251() -> Unit raise {
  let t1428 = @simp.simp_tac(@list.List([exists_lt_mod_thm()]))
  exists_mod_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, !(n == 0) → (∃ a : Num, P(MOD(a, n))) == (∃ a : Num, a < n && P(a))"),
      t1428,
    ),
  )
}

///|
let exists_mod_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MOD_THM")

///|
/// `EXISTS_MOD_THM`
pub fn exists_mod_thm() -> @kernel.Thm {
  exists_mod_thm_c.get()
}

///|
/// PRE_ELIM_THM
fn step_252() -> Unit raise {
  let t1431 = @meson.meson_tac(@list.List([]))
  let t1430 = @simp.rewrite_tac(
    @list.List([@nums.not_suc(), @nums.suc_inj(), pre()]),
  )
  let t1429 = @term_syntax.parse_term("(n : Num)")
  let t1432 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1429),
        @nums.induct_tac,
      ),
      t1430,
    ),
    t1431,
  )
  pre_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num) -> Bool)(PRE((n : Num))) == (∀ m : Num, n == SUC(m) || m == 0 && n == 0 → P(m))"),
      t1432,
    ),
  )
}

///|
let pre_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_ELIM_THM")

///|
/// `PRE_ELIM_THM`
pub fn pre_elim_thm() -> @kernel.Thm {
  pre_elim_thm_c.get()
}

///|
/// PRE_ELIM_THM'
fn step_253() -> Unit raise {
  let t1434 = @meson.meson_tac(@list.List([]))
  let t1433 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t1435 = @tactics.then_tac(
    @tactics.mp_tac(
      @kernel.inst_rule(
        @list.List([(@term_syntax.parse_term("(x : Num) => !(P : (Num) -> Bool)(x)"), t1433)]),
        pre_elim_thm(),
      ),
    ),
    t1434,
  )
  pre_elim_thm_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num) -> Bool)(PRE((n : Num))) == (∃ m : Num, (n == SUC(m) || m == 0 && n == 0) && P(m))"),
      t1435,
    ),
  )
}

///|
let pre_elim_thm_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_ELIM_THM'")

///|
/// `PRE_ELIM_THM'`
pub fn pre_elim_thm_p() -> @kernel.Thm {
  pre_elim_thm_p_c.get()
}

///|
/// SUB_ELIM_THM
fn step_254() -> Unit raise {
  let t1446 = @meson.meson_tac(@list.List([]))
  let t1445 = @simp.simp_tac(
    @list.List([add_sub2(), @equal.gsym(not_le()), le_add(), eq_add_lcancel()]),
  )
  let t1441 = @simp.rewrite_rule(@list.List([le_exists()]))
  let t1442 = @tactics.x_choose_then(@term_syntax.parse_term("(e : Num)"))(fn(
    x1438 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1439 = @tactics.subst1_tac(x1438)
    fn(
      x1440 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1439(x1440)
    }
  })
  let t1444 = @tactics.first_assum(fn(
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
    t1442(t1441(x1443))
  })
  let t1437 = @list.List([
    @meson.asm_meson_tac(
      @list.List([not_lt(), sub_eq_0(), lt_imp_le(), le_add()]),
    ),
    @tactics.all_tac,
  ])
  let t1436 = @term_syntax.parse_term("(b : Num)")
  let t1447 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.disj_cases_tac(
            @bool.specl(
              @list.List([@term_syntax.parse_term("(a : Num)"), t1436]),
              lte_cases(),
            ),
          ),
          t1437,
        ),
        t1444,
      ),
      t1445,
    ),
    t1446,
  )
  sub_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num) -> Bool)((a : Num) - (b : Num)) == (∀ d : Num, a == b + d || a < b && d == 0 → P(d))"),
      t1447,
    ),
  )
}

///|
let sub_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_ELIM_THM")

///|
/// `SUB_ELIM_THM`
pub fn sub_elim_thm() -> @kernel.Thm {
  sub_elim_thm_c.get()
}

///|
/// SUB_ELIM_THM'
fn step_255() -> Unit raise {
  let t1449 = @meson.meson_tac(@list.List([]))
  let t1448 = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let t1450 = @tactics.then_tac(
    @tactics.mp_tac(
      @kernel.inst_rule(
        @list.List([(@term_syntax.parse_term("(x : Num) => !(P : (Num) -> Bool)(x)"), t1448)]),
        sub_elim_thm(),
      ),
    ),
    t1449,
  )
  sub_elim_thm_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num) -> Bool)((a : Num) - (b : Num)) == (∃ d : Num, (a == b + d || a < b && d == 0) && P(d))"),
      t1450,
    ),
  )
}

///|
let sub_elim_thm_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_ELIM_THM'")

///|
/// `SUB_ELIM_THM'`
pub fn sub_elim_thm_p() -> @kernel.Thm {
  sub_elim_thm_p_c.get()
}

///|
/// DIVMOD_ELIM_THM
fn step_256() -> Unit raise {
  let t1457 = @meson.meson_tac(@list.List([divmod_uniq()]))
  let t1455 = @drule.match_mp(division())
  let t1458 = @tactics.then_tac(
    @tactics.first_assum(fn(
      x1456 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1452 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1453 = @tactics.mp_tac(x1452)
        fn(
          x1454 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1453(x1454)
        }
      })(t1455(x1456))
    }),
    t1457,
  )
  let t1459 = @list.List([
    @meson.asm_meson_tac(@list.List([division_0(), lt()])),
    t1458,
  ])
  let t1451 = @simp.asm_rewrite_tac(@list.List([]))
  let t1460 = @tactics.thenl(
    @tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")), t1451),
    t1459,
  )
  divmod_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num, Num) -> Bool)(DIV((m : Num), (n : Num)), MOD(m, n)) == (∀ q : Num, ∀ r : Num, n == 0 && q == 0 && r == m || m == q * n + r && r < n → P(q, r))"),
      t1460,
    ),
  )
}

///|
let divmod_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVMOD_ELIM_THM",
)

///|
/// `DIVMOD_ELIM_THM`
pub fn divmod_elim_thm() -> @kernel.Thm {
  divmod_elim_thm_c.get()
}

///|
/// DIVMOD_ELIM_THM'
fn step_257() -> Unit raise {
  let t1462 = @meson.meson_tac(@list.List([]))
  let t1461 = @term_syntax.parse_term("(P : (Num, Num) -> Bool)")
  let t1463 = @tactics.then_tac(
    @tactics.mp_tac(
      @kernel.inst_rule(
        @list.List([(@term_syntax.parse_term("(x : Num) => (y : Num) => !(P : (Num, Num) -> Bool)(x, y)"), t1461)]),
        divmod_elim_thm(),
      ),
    ),
    t1462,
  )
  divmod_elim_thm_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num, Num) -> Bool)(DIV((m : Num), (n : Num)), MOD(m, n)) == (∃ q : Num, ∃ r : Num, (n == 0 && q == 0 && r == m || m == q * n + r && r < n) && P(q, r))"),
      t1463,
    ),
  )
}

///|
let divmod_elim_thm_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVMOD_ELIM_THM'",
)

///|
/// `DIVMOD_ELIM_THM'`
pub fn divmod_elim_thm_p() -> @kernel.Thm {
  divmod_elim_thm_p_c.get()
}

///|
/// MOD_DOWN_CONV
fn step_258() -> Unit raise {
  let mod_suc_mod = @metis.metis(
    @list.List([add1(), mod_add_mod(), mod_mod_refl()]),
    @term_syntax.parse_term("MOD(SUC(MOD((m : Num), (n : Num))), n) == MOD(SUC(m), n)"),
  )
  let t1465 = @equal.gsym(mod_exp_mod())
  let t1466 = @equal.gsym(mod_mult_mod2())
  let t1467 = @equal.gsym(mod_add_mod())
  let addmul_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1464 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1464
    },
    @list.List([@equal.gsym(mod_suc_mod), t1467, t1466, t1465]),
  )
  let mod_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1468 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1468
    },
    @list.List([mod_mod_refl()]),
  )
  let upconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1469 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1470 = @equal.depth_conv(x1469)
      fn(x1471 : @kernel.Term) -> @kernel.Thm raise { s1470(x1471) }
    },
    @list.List([
      mod_suc_mod,
      mod_add_mod(),
      mod_mult_mod2(),
      mod_exp_mod(),
      mod_mod_refl(),
    ]),
  )
  fn downconv(x1472 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1472
    let t1474 = @equal.sub_conv(downconv)
    let t1473 = @equal.thenc(mod_conv, downconv)
    @equal.orelsec(
      @equal.orelsec(
        @equal.thenc(addmul_conv, @equal.land_conv(downconv)),
        t1473,
      ),
      t1474,
    )(tm)
  }
  mod_down_conv_c.set(@equal.thenc(downconv, upconv))
}

///|
let mod_down_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("MOD_DOWN_CONV")

///|
/// `MOD_DOWN_CONV`
pub fn mod_down_conv(x : @kernel.Term) -> @kernel.Thm raise {
  mod_down_conv_c.get()(x)
}

///|
/// NUM_CANCEL_CONV
fn step_259() -> Unit raise {
  let add_tm = @term_syntax.parse_term("op_plus")
  let eq_tm = @term_syntax.parse_term("(op_eq : (Num, Num) -> Bool)")
  let eq_add_lcancel_0_p = @simp.gen_rewrite_rule(
    fn(
      x1488 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      ((x1484 : (@kernel.Term) -> @kernel.Thm raise) => {
        @lib.funpow(
          2,
          fn(
            x1481 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1482 = @equal.binder_conv(x1481)
            fn(x1483 : @kernel.Term) -> @kernel.Thm raise { s1482(x1483) }
          },
          x1484,
        )
      })(
        (fn(
          x1485 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1486 = @equal.land_conv(x1485)
          fn(x1487 : @kernel.Term) -> @kernel.Thm raise { s1486(x1487) }
        })(x1488),
      )
    },
    @list.List([@theorems.eq_sym_eq()]),
  )(eq_add_lcancel_0())
  let ac_rule : (@kernel.Term) -> @kernel.Thm raise = @theorems.ac(add_ac())
  num_cancel_conv_c.set(fn(x1489 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1489
    let (l, r) = @kernel.dest_eq(tm)
    let lats = @lib.sort(
      fn(x1492 : @kernel.Term, x1493 : @kernel.Term) -> Bool raise {
        let s1494 = (fn(
          x1490 : @kernel.Term,
        ) -> ((@kernel.Term) -> Bool raise) raise {
          fn(x1491 : @kernel.Term) -> Bool raise {
            @lib.compare(x1490, x1491) <= 0
          }
        })(x1492)
        s1494(x1493)
      },
      @basics.binops(@term_syntax.parse_term("op_plus"), l),
    )
    let rats = @lib.sort(
      fn(x1497 : @kernel.Term, x1498 : @kernel.Term) -> Bool raise {
        let s1499 = (fn(
          x1495 : @kernel.Term,
        ) -> ((@kernel.Term) -> Bool raise) raise {
          fn(x1496 : @kernel.Term) -> Bool raise {
            @lib.compare(x1495, x1496) <= 0
          }
        })(x1497)
        s1499(x1498)
      },
      @basics.binops(@term_syntax.parse_term("op_plus"), r),
    )
    let (i_1, lats_p, rats_p) = minter_l(
      @list.List([]),
      @list.List([]),
      @list.List([]),
      lats,
      rats,
    )
    let l_p = @basics.list_mk_binop(add_tm, i_1.concat(lats_p))
    let r_p = @basics.list_mk_binop(add_tm, i_1.concat(rats_p))
    let lth = ac_rule(@basics.mk_eq(l, l_p))
    let rth = ac_rule(@basics.mk_eq(r, r_p))
    let eth = @kernel.mk_comb_rule(@equal.ap_term(eq_tm, lth), rth)
    @simp.gen_rewrite_rule(
      fn(
        x1506 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1500 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1501 = @equal.rand_conv(x1500)
          fn(x1502 : @kernel.Term) -> @kernel.Thm raise { s1501(x1502) }
        })(
          (fn(
            x1503 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1504 = @equal.repeatc(x1503)
            fn(x1505 : @kernel.Term) -> @kernel.Thm raise { s1504(x1505) }
          })(x1506),
        )
      },
      @list.List([eq_add_lcancel(), eq_add_lcancel_0(), eq_add_lcancel_0_p]),
    )(eth)
  })
}

///|
let num_cancel_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_CANCEL_CONV",
)

///|
/// `NUM_CANCEL_CONV`
pub fn num_cancel_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_cancel_conv_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] minter_l(
  x1475 : @list.List[TA],
  x1476 : @list.List[TA],
  x1477 : @list.List[TA],
  x1478 : @list.List[TA],
  x1479 : @list.List[TA],
) -> (@list.List[TA], @list.List[TA], @list.List[TA]) raise {
  let i = x1475
  let l1_p = x1476
  let l2_p = x1477
  let l1 = x1478
  let l2 = x1479
  if l1 == @list.List([]) {
    (i, l1_p, l2_p.concat(l2))
  } else if l2 == @list.List([]) {
    (i, l1.concat(l1_p), l2_p)
  } else {
    let h1 = @lib.hd(l1)
    let h2 = @lib.hd(l2)
    if h1 == h2 {
      let t1480 = @lib.tl(l2)
      minter_l(i.prepend(h1), l1_p, l2_p, @lib.tl(l1), t1480)
    } else if @lib.compare(h1, h2) < 0 {
      minter_l(i, l1_p.prepend(h1), l2_p, @lib.tl(l1), l2)
    } else {
      minter_l(i, l1_p, l2_p.prepend(h2), l1, @lib.tl(l2))
    }
  }
}

///|
/// LE_IMP
fn step_260() -> Unit raise {
  let pth = @simp.pure_once_rewrite_rule(@list.List([@theorems.imp_conj()]))(
    le_trans(),
  )
  le_imp_c.set(fn(x1507 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x1507
    let t1508 = @bool.spec_all(th)
    @bool.gen_all(@drule.match_mp(pth)(t1508))
  })
}

///|
let le_imp_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "LE_IMP",
)

///|
/// `LE_IMP`
pub fn le_imp(x : @kernel.Thm) -> @kernel.Thm raise {
  le_imp_c.get()(x)
}

///|
/// arith.ml:1770
fn step_261() -> Unit raise {
  @printer.parse_as_binder("minimal")
}

///|
/// minimal
fn step_262() -> Unit raise {
  minimal_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(minimal : ((Num) -> Bool) -> Num)((P : (Num) -> Bool)) == select((n : Num) => P(n) && (∀ m : Num, m < n → !P(m)))"),
    ),
  )
}

///|
let minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("minimal")

///|
/// `minimal`
pub fn minimal() -> @kernel.Thm {
  minimal_c.get()
}

///|
/// MINIMAL
fn step_263() -> Unit raise {
  let t1510 = @simp.rewrite_tac(@list.List([@equal.gsym(num_wop())]))
  let t1509 = @tactics.conv_tac(@equal.rand_conv(@class.select_conv))
  let t1511 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([minimal()])),
      ),
      t1509,
    ),
    t1510,
  )
  minimal_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∃ n : Num, P(n)) == (P(minimal(P)) && (∀ m : Num, m < minimal(P) → !P(m)))"),
      t1511,
    ),
  )
}

///|
let minimal_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL")

///|
/// `MINIMAL`
pub fn minimal_v1() -> @kernel.Thm {
  minimal_v1_c.get()
}

///|
/// MINIMAL_UNIQUE
fn step_264() -> Unit raise {
  let t1514 = @meson.asm_meson_tac(@list.List([lt_cases()]))
  let t1513 = @tactics.match_mp_tac(@class.select_unique())
  let t1512 = @simp.rewrite_tac(@list.List([minimal()]))
  let t1515 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1512),
      t1513,
    ),
    t1514,
  )
  minimal_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, P(n) && (∀ m : Num, m < n → !P(m)) → minimal(P) == n"),
      t1515,
    ),
  )
}

///|
let minimal_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_UNIQUE")

///|
/// `MINIMAL_UNIQUE`
pub fn minimal_unique() -> @kernel.Thm {
  minimal_unique_c.get()
}

///|
/// LE_MINIMAL
fn step_265() -> Unit raise {
  let t1520 = @meson.meson_tac(@list.List([not_le(), le_trans()]))
  let t1519 = @simp.gen_rewrite_tac(
    fn(
      x1516 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1517 = @equal.land_conv(x1516)
      fn(x1518 : @kernel.Term) -> @kernel.Thm raise { s1517(x1518) }
    },
    @list.List([minimal_v1()]),
  )
  let t1521 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1519),
    t1520,
  )
  le_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, (∃ r : Num, P(r)) → (n <= minimal(P)) == (∀ i : Num, P(i) → n <= i)"),
      t1521,
    ),
  )
}

///|
let le_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_MINIMAL")

///|
/// `LE_MINIMAL`
pub fn le_minimal() -> @kernel.Thm {
  le_minimal_c.get()
}

///|
/// MINIMAL_LE
fn step_266() -> Unit raise {
  let t1524 = @meson.meson_tac(@list.List([]))
  let t1523 = @simp.simp_tac(@list.List([le_minimal()]))
  let t1522 = @simp.rewrite_tac(@list.List([@equal.gsym(le_suc_lt())]))
  let t1525 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(not_lt())])),
        t1522,
      ),
      t1523,
    ),
    t1524,
  )
  minimal_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, (∃ r : Num, P(r)) → (minimal(P) <= n) == (∃ i : Num, i <= n && P(i))"),
      t1525,
    ),
  )
}

///|
let minimal_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_LE")

///|
/// `MINIMAL_LE`
pub fn minimal_le() -> @kernel.Thm {
  minimal_le_c.get()
}

///|
/// MINIMAL_UBOUND
fn step_267() -> Unit raise {
  let t1526 = @meson.meson_tac(@list.List([minimal_v1(), not_lt()]))
  minimal_ubound_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, P(n) → minimal(P) <= n"), t1526),
  )
}

///|
let minimal_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_UBOUND")

///|
/// `MINIMAL_UBOUND`
pub fn minimal_ubound() -> @kernel.Thm {
  minimal_ubound_c.get()
}

///|
/// MINIMAL_LBOUND
fn step_268() -> Unit raise {
  let t1527 = @meson.meson_tac(@list.List([not_lt()]))
  let t1528 = @tactics.then_tac(
    @simp.simp_tac(@list.List([le_minimal()])),
    t1527,
  )
  minimal_lbound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, (∃ r : Num, P(r)) && (∀ m : Num, m < n → !P(m)) → n <= minimal(P)"),
      t1528,
    ),
  )
}

///|
let minimal_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_LBOUND")

///|
/// `MINIMAL_LBOUND`
pub fn minimal_lbound() -> @kernel.Thm {
  minimal_lbound_c.get()
}

///|
/// MINIMAL_MONO
fn step_269() -> Unit raise {
  let t1539 = @simp.asm_simp_tac(@list.List([le_minimal()]))
  let t1538 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([le_trans(), le_refl()]),
      @term_syntax.parse_term("(∀ p : Num, p <= (m : Num) → p <= (n : Num)) → m <= n"),
    ),
  )
  let t1537 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1536 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, (Q : (Num) -> Bool)(n)"), fn(
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
    let s1534 = @tactics.assume_tac(x1533)
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
  })
  let t1532 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x1529 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1530 = @tactics.assume_tac(x1529)
      fn(
        x1531 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1530(x1531)
      }
    }),
  )
  let t1540 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1532),
          t1536,
        ),
        t1537,
      ),
      t1538,
    ),
    t1539,
  )
  minimal_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ Q : (Num) -> Bool, (∃ n : Num, P(n)) && (∀ n : Num, P(n) → Q(n)) → minimal(Q) <= minimal(P)"),
      t1540,
    ),
  )
}

///|
let minimal_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINIMAL_MONO")

///|
/// `MINIMAL_MONO`
pub fn minimal_mono() -> @kernel.Thm {
  minimal_mono_c.get()
}

///|
/// TRANSITIVE_STEPWISE_LT_EQ
fn step_270() -> Unit raise {
  let t1546 = @meson.asm_meson_tac(@list.List([]))
  let t1545 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t1544 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_forall_imp_thm(),
      @theorems.exists_refl(),
      add_clauses(),
    ]),
  )
  let t1543 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1542 = @simp.simp_tac(
    @list.List([lt_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t1541 = @simp.asm_simp_tac(@list.List([lt()]))
  let t1547 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    t1541,
                  ),
                  @tactics.disch_tac,
                ),
                t1542,
              ),
              @tactics.gen_tac,
            ),
            t1543,
          ),
          t1544,
        ),
        @nums.induct_tac,
      ),
      t1545,
    ),
    t1546,
  )
  transitive_stepwise_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)) → (∀ m : Num, ∀ n : Num, m < n → R(m, n)) == (∀ n : Num, R(n, SUC(n)))"),
      t1547,
    ),
  )
}

///|
let transitive_stepwise_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSITIVE_STEPWISE_LT_EQ",
)

///|
/// `TRANSITIVE_STEPWISE_LT_EQ`
pub fn transitive_stepwise_lt_eq() -> @kernel.Thm {
  transitive_stepwise_lt_eq_c.get()
}

///|
/// TRANSITIVE_STEPWISE_LT
fn step_271() -> Unit raise {
  let t1549 = @tactics.match_accept_tac(transitive_stepwise_lt_eq())
  let t1548 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (c : Bool) == (b : Bool)) → a && b → c")),
  )
  let t1550 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1548),
    t1549,
  )
  transitive_stepwise_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)) && (∀ n : Num, R(n, SUC(n))) → (∀ m : Num, ∀ n : Num, m < n → R(m, n))"),
      t1550,
    ),
  )
}

///|
let transitive_stepwise_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSITIVE_STEPWISE_LT",
)

///|
/// `TRANSITIVE_STEPWISE_LT`
pub fn transitive_stepwise_lt() -> @kernel.Thm {
  transitive_stepwise_lt_c.get()
}

///|
/// TRANSITIVE_STEPWISE_LE_EQ
fn step_272() -> Unit raise {
  let t1556 = @meson.asm_meson_tac(@list.List([]))
  let t1555 = @simp.rewrite_tac(@list.List([add_clauses()]))
  let t1554 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_forall_imp_thm(),
      @theorems.exists_refl(),
      add_clauses(),
    ]),
  )
  let t1553 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1552 = @simp.simp_tac(
    @list.List([le_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t1551 = @simp.asm_simp_tac(@list.List([le(), le_refl()]))
  let t1557 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    t1551,
                  ),
                  @tactics.disch_tac,
                ),
                t1552,
              ),
              @tactics.gen_tac,
            ),
            t1553,
          ),
          t1554,
        ),
        @nums.induct_tac,
      ),
      t1555,
    ),
    t1556,
  )
  transitive_stepwise_le_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, (∀ x : Num, R(x, x)) && (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)) → (∀ m : Num, ∀ n : Num, m <= n → R(m, n)) == (∀ n : Num, R(n, SUC(n)))"),
      t1557,
    ),
  )
}

///|
let transitive_stepwise_le_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSITIVE_STEPWISE_LE_EQ",
)

///|
/// `TRANSITIVE_STEPWISE_LE_EQ`
pub fn transitive_stepwise_le_eq() -> @kernel.Thm {
  transitive_stepwise_le_eq_c.get()
}

///|
/// TRANSITIVE_STEPWISE_LE
fn step_273() -> Unit raise {
  let t1559 = @tactics.match_accept_tac(transitive_stepwise_le_eq())
  let t1558 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((a : Bool) && (a' : Bool) → (c : Bool) == (b : Bool)) → a && a' && b → c"),
    ),
  )
  let t1560 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1558),
    t1559,
  )
  transitive_stepwise_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Num, Num) -> Bool, (∀ x : Num, R(x, x)) && (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)) && (∀ n : Num, R(n, SUC(n))) → (∀ m : Num, ∀ n : Num, m <= n → R(m, n))"),
      t1560,
    ),
  )
}

///|
let transitive_stepwise_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSITIVE_STEPWISE_LE",
)

///|
/// `TRANSITIVE_STEPWISE_LE`
pub fn transitive_stepwise_le() -> @kernel.Thm {
  transitive_stepwise_le_c.get()
}

///|
/// DEPENDENT_CHOICE_FIXED
fn step_274() -> Unit raise {
  let t1574 = @meson.asm_meson_tac(@list.List([]))
  let t1573 = @simp.asm_rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t1572 = @simp.gen_rewrite_tac(
    fn(
      x1569 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1570 = @equal.land_conv(x1569)
      fn(x1571 : @kernel.Term) -> @kernel.Thm raise { s1570(x1571) }
    },
    @list.List([
      @meson.meson(
        @list.List([@nums.num_cases()]),
        @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (∀ n : Num, P(SUC(n))))"),
      ),
    ]),
  )
  let t1568 = @simp.asm_rewrite_tac(@list.List([]))
  let t1567 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1564 = @term_syntax.parse_term("(f : (Num) -> A)(0) == (a : A) && (∀ n : Num, f(SUC(n)) == select((y : A) => (P : (Num, A) -> Bool)(SUC(n), y) && (R : (Num, A, A) -> Bool)(n, f(n), y)))")
  let t1565 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t1566 = (fn(
    x1561 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1562 = @tactics.mp_tac(x1561)
    fn(
      x1563 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1562(x1563)
    }
  })(t1565(t1564))
  let t1575 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t1566,
                  ),
                  t1567,
                ),
                @tactics.gen_tac,
              ),
              @tactics.strip_tac,
            ),
            t1568,
          ),
          t1572,
        ),
        t1573,
      ),
      @nums.induct_tac,
    ),
    t1574,
  )
  dependent_choice_fixed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ R : (Num, A, A) -> Bool, ∀ a : A, P(0, a) && (∀ n : Num, ∀ x : A, P(n, x) → (∃ y : A, P(SUC(n), y) && R(n, x, y))) → (∃ f : (Num) -> A, f(0) == a && (∀ n : Num, P(n, f(n))) && (∀ n : Num, R(n, f(n), f(SUC(n)))))"),
      t1575,
    ),
  )
}

///|
let dependent_choice_fixed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DEPENDENT_CHOICE_FIXED",
)

///|
/// `DEPENDENT_CHOICE_FIXED`
pub fn dependent_choice_fixed() -> @kernel.Thm {
  dependent_choice_fixed_c.get()
}

///|
/// DEPENDENT_CHOICE
fn step_275() -> Unit raise {
  let t1576 = @meson.meson_tac(@list.List([dependent_choice_fixed()]))
  dependent_choice_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ R : (Num, A, A) -> Bool, (∃ a : A, P(0, a)) && (∀ n : Num, ∀ x : A, P(n, x) → (∃ y : A, P(SUC(n), y) && R(n, x, y))) → (∃ f : (Num) -> A, (∀ n : Num, P(n, f(n))) && (∀ n : Num, R(n, f(n), f(SUC(n)))))"),
      t1576,
    ),
  )
}

///|
let dependent_choice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DEPENDENT_CHOICE",
)

///|
/// `DEPENDENT_CHOICE`
pub fn dependent_choice() -> @kernel.Thm {
  dependent_choice_c.get()
}

///|
/// BITS_ELIM_CONV
fn step_276() -> Unit raise {
  let t1577 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let numeral_pth = @tactics.prove(
    @term_syntax.parse_term("((m : Num) == (n : Num)) == (NUMERAL(m) == n)"),
    t1577,
  )
  let t1578 = @term_syntax.parse_term("0")
  let zero_pth = @equal.gsym(
    @simp.rewrite_conv(@list.List([@nums.numeral()]))(t1578),
  )
  let t1588 = @simp.rewrite_tac(@list.List([two(), @nums.not_suc()]))
  let t1587 = @simp.rewrite_tac(@list.List([eq_mult_lcancel()]))
  let t1586 = @simp.rewrite_tac(
    @list.List([add1(), eq_add_rcancel(), @equal.gsym(mult_2())]),
  )
  let t1589 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.conj_tac,
          @simp.gen_rewrite_tac(
            fn(
              x1585 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(
                x1579 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s1580 = @equal.rand_conv(x1579)
                fn(x1581 : @kernel.Term) -> @kernel.Thm raise { s1580(x1581) }
              })(
                (fn(
                  x1582 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s1583 = @equal.land_conv(x1582)
                  fn(x1584 : @kernel.Term) -> @kernel.Thm raise { s1583(x1584) }
                })(x1585),
              )
            },
            @list.List([bit0(), bit1()]),
          ),
        ),
        t1586,
      ),
      t1587,
    ),
    t1588,
  )
  let (bit0_pth, bit1_pth) = @bool.conj_pair(
    @tactics.prove(
      @term_syntax.parse_term("((m : Num) == (n : Num)) == (BIT0(m) == 2 * n) && (m == n) == (BIT1(m) == 2 * n + 1)"),
      t1589,
    ),
  )
  let t1590 = @term_syntax.parse_term("(n : Num)")
  let (mvar, nvar) = (@term_syntax.parse_term("(m : Num)"), t1590)
  fn bits_elim_conv_1(x1591 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1591
    match tm {
      @kernel.Term::Const("_0", _) => zero_pth
      @kernel.Term::Var(_, _) | @kernel.Term::Const(_, _) => @kernel.refl(tm)
      @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm) =>
        if @nums.is_numeral(tm) {
          @kernel.refl(tm)
        } else {
          let th = bits_elim_conv_1(mtm)
          @kernel.eq_mp(
            @kernel.inst_rule(
              @list.List([(mtm, mvar), (@kernel.rand(@kernel.concl(th)), nvar)]),
              numeral_pth,
            ),
            th,
          )
        }
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mtm_1) => {
        let th_1 = bits_elim_conv_1(mtm_1)
        @kernel.eq_mp(
          @kernel.inst_rule(
            @list.List([
              (mtm_1, mvar),
              (@kernel.rand(@kernel.concl(th_1)), nvar),
            ]),
            bit0_pth,
          ),
          th_1,
        )
      }
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mtm_2) => {
        let th_2 = bits_elim_conv_1(mtm_2)
        @kernel.eq_mp(
          @kernel.inst_rule(
            @list.List([
              (mtm_2, mvar),
              (@kernel.rand(@kernel.concl(th_2)), nvar),
            ]),
            bit1_pth,
          ),
          th_2,
        )
      }
      @kernel.Term::Comb(_, _) => @equal.comb_conv(bits_elim_conv_1)(tm)
      @kernel.Term::Abs(_, _) => @equal.abs_conv(bits_elim_conv_1)(tm)
    }
  }
  bits_elim_conv_c.set(bits_elim_conv_1)
}

///|
let bits_elim_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("BITS_ELIM_CONV")

///|
/// `BITS_ELIM_CONV`
pub fn bits_elim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  bits_elim_conv_c.get()(x)
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
}
