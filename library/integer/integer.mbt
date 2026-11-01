// Translated from upstream Library/integer.ml; edit this file directly.

///|
/// Library/integer.ml:7
fn step_1() -> Unit raise {
  @int.prioritize_int(())
}

///|
/// INT_DIVIDES_REFL
fn step_2() -> Unit raise {
  int_divides_refl_c.set(
    @int.integer_rule(@term_syntax.parse_term("∀ d : Int, divides(d, d)")),
  )
}

///|
let int_divides_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_REFL",
)

///|
/// `INT_DIVIDES_REFL`
pub fn int_divides_refl() -> @kernel.Thm {
  int_divides_refl_c.get()
}

///|
/// INT_DIVIDES_TRANS
fn step_3() -> Unit raise {
  int_divides_trans_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, divides(x, y) && divides(y, z) → divides(x, z)"),
    ),
  )
}

///|
let int_divides_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_TRANS",
)

///|
/// `INT_DIVIDES_TRANS`
pub fn int_divides_trans() -> @kernel.Thm {
  int_divides_trans_c.get()
}

///|
/// INT_DIVIDES_ADD
fn step_4() -> Unit raise {
  int_divides_add_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, b) → divides(d, a + b)"),
    ),
  )
}

///|
let int_divides_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ADD",
)

///|
/// `INT_DIVIDES_ADD`
pub fn int_divides_add() -> @kernel.Thm {
  int_divides_add_c.get()
}

///|
/// INT_DIVIDES_SUB
fn step_5() -> Unit raise {
  int_divides_sub_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, b) → divides(d, a - b)"),
    ),
  )
}

///|
let int_divides_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_SUB",
)

///|
/// `INT_DIVIDES_SUB`
pub fn int_divides_sub() -> @kernel.Thm {
  int_divides_sub_c.get()
}

///|
/// INT_DIVIDES_0
fn step_6() -> Unit raise {
  int_divides_0_c.set(@int.integer_rule(@term_syntax.parse_term("∀ d : Int, divides(d, int_of_num(0))")))
}

///|
let int_divides_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVIDES_0")

///|
/// `INT_DIVIDES_0`
pub fn int_divides_0() -> @kernel.Thm {
  int_divides_0_c.get()
}

///|
/// INT_DIVIDES_ZERO
fn step_7() -> Unit raise {
  int_divides_zero_c.set(
    @int.integer_rule(@term_syntax.parse_term("∀ x : Int, divides(int_of_num(0), x) == (x == int_of_num(0))")),
  )
}

///|
let int_divides_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ZERO",
)

///|
/// `INT_DIVIDES_ZERO`
pub fn int_divides_zero() -> @kernel.Thm {
  int_divides_zero_c.get()
}

///|
/// INT_DIVIDES_LNEG
fn step_8() -> Unit raise {
  int_divides_lneg_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ x : Int, divides(-d, x) == divides(d, x)"),
    ),
  )
}

///|
let int_divides_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LNEG",
)

///|
/// `INT_DIVIDES_LNEG`
pub fn int_divides_lneg() -> @kernel.Thm {
  int_divides_lneg_c.get()
}

///|
/// INT_DIVIDES_RNEG
fn step_9() -> Unit raise {
  int_divides_rneg_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ x : Int, divides(d, -x) == divides(d, x)"),
    ),
  )
}

///|
let int_divides_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RNEG",
)

///|
/// `INT_DIVIDES_RNEG`
pub fn int_divides_rneg() -> @kernel.Thm {
  int_divides_rneg_c.get()
}

///|
/// INT_DIVIDES_RMUL
fn step_10() -> Unit raise {
  int_divides_rmul_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ x : Int, ∀ y : Int, divides(d, x) → divides(d, x * y)"),
    ),
  )
}

///|
let int_divides_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RMUL",
)

///|
/// `INT_DIVIDES_RMUL`
pub fn int_divides_rmul() -> @kernel.Thm {
  int_divides_rmul_c.get()
}

///|
/// INT_DIVIDES_LMUL
fn step_11() -> Unit raise {
  int_divides_lmul_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ x : Int, ∀ y : Int, divides(d, y) → divides(d, x * y)"),
    ),
  )
}

///|
let int_divides_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LMUL",
)

///|
/// `INT_DIVIDES_LMUL`
pub fn int_divides_lmul() -> @kernel.Thm {
  int_divides_lmul_c.get()
}

///|
/// INT_DIVIDES_1
fn step_12() -> Unit raise {
  int_divides_1_c.set(@int.integer_rule(@term_syntax.parse_term("∀ x : Int, divides(int_of_num(1), x)")))
}

///|
let int_divides_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVIDES_1")

///|
/// `INT_DIVIDES_1`
pub fn int_divides_1() -> @kernel.Thm {
  int_divides_1_c.get()
}

///|
/// INT_DIVIDES_ADD_REVR
fn step_13() -> Unit raise {
  int_divides_add_revr_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, a + b) → divides(d, b)"),
    ),
  )
}

///|
let int_divides_add_revr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ADD_REVR",
)

///|
/// `INT_DIVIDES_ADD_REVR`
pub fn int_divides_add_revr() -> @kernel.Thm {
  int_divides_add_revr_c.get()
}

///|
/// INT_DIVIDES_ADD_REVL
fn step_14() -> Unit raise {
  int_divides_add_revl_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, b) && divides(d, a + b) → divides(d, a)"),
    ),
  )
}

///|
let int_divides_add_revl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ADD_REVL",
)

///|
/// `INT_DIVIDES_ADD_REVL`
pub fn int_divides_add_revl() -> @kernel.Thm {
  int_divides_add_revl_c.get()
}

///|
/// INT_DIVIDES_MUL_L
fn step_15() -> Unit raise {
  int_divides_mul_l_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, divides(a, b) → divides(c * a, c * b)"),
    ),
  )
}

///|
let int_divides_mul_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_MUL_L",
)

///|
/// `INT_DIVIDES_MUL_L`
pub fn int_divides_mul_l() -> @kernel.Thm {
  int_divides_mul_l_c.get()
}

///|
/// INT_DIVIDES_MUL_R
fn step_16() -> Unit raise {
  int_divides_mul_r_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, divides(a, b) → divides(a * c, b * c)"),
    ),
  )
}

///|
let int_divides_mul_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_MUL_R",
)

///|
/// `INT_DIVIDES_MUL_R`
pub fn int_divides_mul_r() -> @kernel.Thm {
  int_divides_mul_r_c.get()
}

///|
/// INT_DIVIDES_LMUL2
fn step_17() -> Unit raise {
  int_divides_lmul2_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ x : Int, divides(x * d, a) → divides(d, a)"),
    ),
  )
}

///|
let int_divides_lmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LMUL2",
)

///|
/// `INT_DIVIDES_LMUL2`
pub fn int_divides_lmul2() -> @kernel.Thm {
  int_divides_lmul2_c.get()
}

///|
/// INT_DIVIDES_RMUL2
fn step_18() -> Unit raise {
  int_divides_rmul2_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ x : Int, divides(d * x, a) → divides(d, a)"),
    ),
  )
}

///|
let int_divides_rmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RMUL2",
)

///|
/// `INT_DIVIDES_RMUL2`
pub fn int_divides_rmul2() -> @kernel.Thm {
  int_divides_rmul2_c.get()
}

///|
/// INT_DIVIDES_CMUL2
fn step_19() -> Unit raise {
  int_divides_cmul2_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, divides(c * a, c * b) && !(c == int_of_num(0)) → divides(a, b)"),
    ),
  )
}

///|
let int_divides_cmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_CMUL2",
)

///|
/// `INT_DIVIDES_CMUL2`
pub fn int_divides_cmul2() -> @kernel.Thm {
  int_divides_cmul2_c.get()
}

///|
/// INT_DIVIDES_LMUL2_EQ
fn step_20() -> Unit raise {
  int_divides_lmul2_eq_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, !(c == int_of_num(0)) → divides(c * a, c * b) == divides(a, b)"),
    ),
  )
}

///|
let int_divides_lmul2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LMUL2_EQ",
)

///|
/// `INT_DIVIDES_LMUL2_EQ`
pub fn int_divides_lmul2_eq() -> @kernel.Thm {
  int_divides_lmul2_eq_c.get()
}

///|
/// INT_DIVIDES_RMUL2_EQ
fn step_21() -> Unit raise {
  int_divides_rmul2_eq_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, !(c == int_of_num(0)) → divides(a * c, b * c) == divides(a, b)"),
    ),
  )
}

///|
let int_divides_rmul2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RMUL2_EQ",
)

///|
/// `INT_DIVIDES_RMUL2_EQ`
pub fn int_divides_rmul2_eq() -> @kernel.Thm {
  int_divides_rmul2_eq_c.get()
}

///|
/// INT_DIVIDES_MUL2
fn step_22() -> Unit raise {
  int_divides_mul2_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, ∀ d : Int, divides(a, b) && divides(c, d) → divides(a * c, b * d)"),
    ),
  )
}

///|
let int_divides_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_MUL2",
)

///|
/// `INT_DIVIDES_MUL2`
pub fn int_divides_mul2() -> @kernel.Thm {
  int_divides_mul2_c.get()
}

///|
/// INT_DIVIDES_POW
fn step_23() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@int.int_pow_mul()]))
  let t2 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_divides()])),
    t1,
  )
  int_divides_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Num, divides(x, y) → divides(pow(x, n), pow(y, n))"),
      t2,
    ),
  )
}

///|
let int_divides_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW",
)

///|
/// `INT_DIVIDES_POW`
pub fn int_divides_pow() -> @kernel.Thm {
  int_divides_pow_c.get()
}

///|
/// INT_DIVIDES_POW2
fn step_24() -> Unit raise {
  let t3 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.rewrite_tac(@list.List([@nums.not_suc(), @int.int_pow_v1()])),
    ),
    @int.integer_tac,
  )
  int_divides_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Int, ∀ y : Int, !(n == 0) && divides(pow(x, n), y) → divides(x, y)"),
      t3,
    ),
  )
}

///|
let int_divides_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW2",
)

///|
/// `INT_DIVIDES_POW2`
pub fn int_divides_pow2() -> @kernel.Thm {
  int_divides_pow2_c.get()
}

///|
/// INT_DIVIDES_RPOW
fn step_25() -> Unit raise {
  let t4 = @simp.simp_tac(@list.List([int_divides_rmul(), @int.int_pow_v1()]))
  let t5 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t4,
  )
  int_divides_rpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Num, divides(x, y) && !(n == 0) → divides(x, pow(y, n))"),
      t5,
    ),
  )
}

///|
let int_divides_rpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RPOW",
)

///|
/// `INT_DIVIDES_RPOW`
pub fn int_divides_rpow() -> @kernel.Thm {
  int_divides_rpow_c.get()
}

///|
/// INT_DIVIDES_RPOW_SUC
fn step_26() -> Unit raise {
  let t6 = @simp.simp_tac(@list.List([int_divides_rpow(), @nums.not_suc()]))
  int_divides_rpow_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Num, divides(x, y) → divides(x, pow(y, SUC(n)))"),
      t6,
    ),
  )
}

///|
let int_divides_rpow_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RPOW_SUC",
)

///|
/// `INT_DIVIDES_RPOW_SUC`
pub fn int_divides_rpow_suc() -> @kernel.Thm {
  int_divides_rpow_suc_c.get()
}

///|
/// INT_DIVIDES_POW_LE_IMP
fn step_27() -> Unit raise {
  let t7 = @tactics.conv_tac(@int.integer_rule)
  let t8 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @arith.le_exists(),
        @int.int_pow_add(),
        @theorems.left_imp_exists_thm(),
      ]),
    ),
    t7,
  )
  int_divides_pow_le_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ m : Num, ∀ n : Num, m <= n → divides(pow(p, m), pow(p, n))"),
      t8,
    ),
  )
}

///|
let int_divides_pow_le_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW_LE_IMP",
)

///|
/// `INT_DIVIDES_POW_LE_IMP`
pub fn int_divides_pow_le_imp() -> @kernel.Thm {
  int_divides_pow_le_imp_c.get()
}

///|
/// INT_DIVIDES_ANTISYM_DIVISORS
fn step_28() -> Unit raise {
  let t9 = @meson.meson_tac(
    @list.List([int_divides_refl(), int_divides_trans()]),
  )
  int_divides_antisym_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, (divides(a, b) && divides(b, a)) == (∀ d : Int, divides(d, a) == divides(d, b))"),
      t9,
    ),
  )
}

///|
let int_divides_antisym_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM_DIVISORS",
)

///|
/// `INT_DIVIDES_ANTISYM_DIVISORS`
pub fn int_divides_antisym_divisors() -> @kernel.Thm {
  int_divides_antisym_divisors_c.get()
}

///|
/// INT_DIVIDES_ANTISYM_MULTIPLES
fn step_29() -> Unit raise {
  let t10 = @meson.meson_tac(
    @list.List([int_divides_refl(), int_divides_trans()]),
  )
  int_divides_antisym_multiples_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, (divides(a, b) && divides(b, a)) == (∀ d : Int, divides(a, d) == divides(b, d))"),
      t10,
    ),
  )
}

///|
let int_divides_antisym_multiples_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM_MULTIPLES",
)

///|
/// `INT_DIVIDES_ANTISYM_MULTIPLES`
pub fn int_divides_antisym_multiples() -> @kernel.Thm {
  int_divides_antisym_multiples_c.get()
}

///|
/// INT_DIVIDES_ONE_POS
fn step_30() -> Unit raise {
  let t21 = @simp.asm_simp_tac(@list.List([@int.int_abs_v1()]))
  let t20 = @simp.simp_tac(
    @list.List([@int.int_abs_num(), @int.int_abs_mul_1()]),
  )
  let t15 = @term_syntax.parse_term("abs")
  let t19 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x18 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
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
        (fn(
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
          let s13 = @tactics.mp_tac(x12)
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
        })(((x16 : @kernel.Thm) => @equal.ap_term(t15, x16))(x17))
      })(@equal.sym(x18))
    }),
  )
  let t11 = @list.List([
    @simp.rewrite_tac(@list.List([@int.int_divides()])),
    @int.integer_tac,
  ])
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.strip_tac),
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
  int_divides_one_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, int_of_num(0) <= x → divides(x, int_of_num(1)) == (x == int_of_num(1))"),
      t22,
    ),
  )
}

///|
let int_divides_one_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ONE_POS",
)

///|
/// `INT_DIVIDES_ONE_POS`
pub fn int_divides_one_pos() -> @kernel.Thm {
  int_divides_one_pos_c.get()
}

///|
/// INT_DIVIDES_ONE_ABS
fn step_31() -> Unit raise {
  let t23 = @meson.meson_tac(
    @list.List([
      @int.int_divides_labs(),
      int_divides_one_pos(),
      @int.int_abs_pos(),
    ]),
  )
  int_divides_one_abs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ d : Int, divides(d, int_of_num(1)) == (abs(d) == int_of_num(1))"), t23),
  )
}

///|
let int_divides_one_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ONE_ABS",
)

///|
/// `INT_DIVIDES_ONE_ABS`
pub fn int_divides_one_abs() -> @kernel.Thm {
  int_divides_one_abs_c.get()
}

///|
/// INT_DIVIDES_ONE
fn step_32() -> Unit raise {
  let t24 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_divides_one_abs()])),
    @int.int_arith_tac,
  )
  int_divides_one_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, divides(d, int_of_num(1)) == (d == int_of_num(1) || d == -int_of_num(1))"),
      t24,
    ),
  )
}

///|
let int_divides_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ONE",
)

///|
/// `INT_DIVIDES_ONE`
pub fn int_divides_one() -> @kernel.Thm {
  int_divides_one_c.get()
}

///|
/// INT_DIVIDES_ANTISYM_ASSOCIATED
fn step_33() -> Unit raise {
  let t27 = @meson.asm_meson_tac(
    @list.List([
      @int.int_divides(),
      int_divides_refl(),
      @int.integer_rule(
        @term_syntax.parse_term("(y : Int) == (x : Int) * (d : Int) && x == y * (e : Int) && !(y == int_of_num(0)) → divides(d, int_of_num(1))"),
      ),
    ]),
  )
  let t26 = @simp.asm_simp_tac(
    @list.List([int_divides_zero(), @int.int_mul_lzero()]),
  )
  let t25 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Int) == int_of_num(0)"))
  let t28 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          @list.List([@tactics.all_tac, @int.integer_tac]),
        ),
        t25,
      ),
      t26,
    ),
    t27,
  )
  int_divides_antisym_associated_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (divides(x, y) && divides(y, x)) == (∃ u : Int, divides(u, int_of_num(1)) && x == y * u)"),
      t28,
    ),
  )
}

///|
let int_divides_antisym_associated_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM_ASSOCIATED",
)

///|
/// `INT_DIVIDES_ANTISYM_ASSOCIATED`
pub fn int_divides_antisym_associated() -> @kernel.Thm {
  int_divides_antisym_associated_c.get()
}

///|
/// INT_DIVIDES_ANTISYM
fn step_34() -> Unit raise {
  let t29 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_or_distrib(),
      @theorems.exists_or_thm(),
      @theorems.unwind_thm2(),
    ]),
  )
  let t30 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([int_divides_antisym_associated(), int_divides_one()]),
      ),
      t29,
    ),
    @int.int_arith_tac,
  )
  int_divides_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (divides(x, y) && divides(y, x)) == (x == y || x == -y)"),
      t30,
    ),
  )
}

///|
let int_divides_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM",
)

///|
/// `INT_DIVIDES_ANTISYM`
pub fn int_divides_antisym() -> @kernel.Thm {
  int_divides_antisym_c.get()
}

///|
/// INT_DIVIDES_ANTISYM_ABS
fn step_35() -> Unit raise {
  let t31 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_divides_antisym()])),
    @int.int_arith_tac,
  )
  int_divides_antisym_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (divides(x, y) && divides(y, x)) == (abs(x) == abs(y))"),
      t31,
    ),
  )
}

///|
let int_divides_antisym_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM_ABS",
)

///|
/// `INT_DIVIDES_ANTISYM_ABS`
pub fn int_divides_antisym_abs() -> @kernel.Thm {
  int_divides_antisym_abs_c.get()
}

///|
/// INT_DIVIDES_ANTISYM_POS
fn step_36() -> Unit raise {
  let t32 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_divides_antisym_abs()])),
    @int.int_arith_tac,
  )
  int_divides_antisym_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_of_num(0) <= x && int_of_num(0) <= y → (divides(x, y) && divides(y, x)) == (x == y)"),
      t32,
    ),
  )
}

///|
let int_divides_antisym_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ANTISYM_POS",
)

///|
/// `INT_DIVIDES_ANTISYM_POS`
pub fn int_divides_antisym_pos() -> @kernel.Thm {
  int_divides_antisym_pos_c.get()
}

///|
/// INT_GCD_POS
fn step_37() -> Unit raise {
  let t33 = @simp.rewrite_tac(@list.List([@int.int_gcd()]))
  int_gcd_pos_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, int_of_num(0) <= gcd((a, b))"), t33),
  )
}

///|
let int_gcd_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_POS")

///|
/// `INT_GCD_POS`
pub fn int_gcd_pos() -> @kernel.Thm {
  int_gcd_pos_c.get()
}

///|
/// INT_ABS_GCD
fn step_38() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([@int.int_abs_v1(), int_gcd_pos()]))
  int_abs_gcd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, abs(gcd((a, b))) == gcd((a, b))"), t34),
  )
}

///|
let int_abs_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_GCD")

///|
/// `INT_ABS_GCD`
pub fn int_abs_gcd() -> @kernel.Thm {
  int_abs_gcd_c.get()
}

///|
/// INT_GCD_DIVIDES
fn step_39() -> Unit raise {
  int_gcd_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, divides(gcd((a, b)), a) && divides(gcd((a, b)), b)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_gcd_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_DIVIDES",
)

///|
/// `INT_GCD_DIVIDES`
pub fn int_gcd_divides() -> @kernel.Thm {
  int_gcd_divides_c.get()
}

///|
/// INT_COPRIME_GCD
fn step_40() -> Unit raise {
  let t35 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([@equal.gsym(int_divides_one_pos()), int_gcd_pos()]),
    ),
    @int.integer_tac,
  )
  int_coprime_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == (gcd((a, b)) == int_of_num(1))"),
      t35,
    ),
  )
}

///|
let int_coprime_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_GCD",
)

///|
/// `INT_COPRIME_GCD`
pub fn int_coprime_gcd() -> @kernel.Thm {
  int_coprime_gcd_c.get()
}

///|
/// INT_GCD_BEZOUT
fn step_41() -> Unit raise {
  int_gcd_bezout_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ x : Int, ∃ y : Int, gcd((a, b)) == a * x + b * y"),
      @int.integer_tac,
    ),
  )
}

///|
let int_gcd_bezout_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_BEZOUT")

///|
/// `INT_GCD_BEZOUT`
pub fn int_gcd_bezout() -> @kernel.Thm {
  int_gcd_bezout_c.get()
}

///|
/// INT_DIVIDES_GCD
fn step_42() -> Unit raise {
  int_divides_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ d : Int, divides(d, gcd((a, b))) == (divides(d, a) && divides(d, b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_divides_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_GCD",
)

///|
/// `INT_DIVIDES_GCD`
pub fn int_divides_gcd() -> @kernel.Thm {
  int_divides_gcd_c.get()
}

///|
/// INT_GCD
fn step_43() -> Unit raise {
  int_gcd_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, (divides(gcd((a, b)), a) && divides(gcd((a, b)), b)) && (∀ e : Int, divides(e, a) && divides(e, b) → divides(e, gcd((a, b))))"),
    ),
  )
}

///|
let int_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD")

///|
/// `INT_GCD`
pub fn int_gcd() -> @kernel.Thm {
  int_gcd_c.get()
}

///|
/// INT_GCD_UNIQUE
fn step_44() -> Unit raise {
  let t39 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t38 = @tactics.repeat_tac(@tactics.strip_tac)
  let t37 = @simp.asm_simp_tac(
    @list.List([
      int_gcd_pos(),
      @equal.gsym(int_divides_antisym_pos()),
      int_divides_gcd(),
    ]),
  )
  let t36 = @list.List([
    @meson.meson_tac(@list.List([int_gcd(), int_gcd_pos()])),
    @tactics.all_tac,
  ])
  let t40 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @tactics.eq_tac,
            ),
            t36,
          ),
          t37,
        ),
        t38,
      ),
      t39,
    ),
    @int.integer_tac,
  )
  int_gcd_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ d : Int, (gcd((a, b)) == d) == (int_of_num(0) <= d && divides(d, a) && divides(d, b) && (∀ e : Int, divides(e, a) && divides(e, b) → divides(e, d)))"),
      t40,
    ),
  )
}

///|
let int_gcd_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_UNIQUE")

///|
/// `INT_GCD_UNIQUE`
pub fn int_gcd_unique() -> @kernel.Thm {
  int_gcd_unique_c.get()
}

///|
/// INT_GCD_UNIQUE_ABS
fn step_45() -> Unit raise {
  let t41 = @simp.rewrite_tac(
    @list.List([int_gcd_unique(), @int.int_abs_pos(), @int.int_divides_abs()]),
  )
  int_gcd_unique_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ d : Int, (gcd((a, b)) == abs(d)) == (divides(d, a) && divides(d, b) && (∀ e : Int, divides(e, a) && divides(e, b) → divides(e, d)))"),
      t41,
    ),
  )
}

///|
let int_gcd_unique_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_UNIQUE_ABS",
)

///|
/// `INT_GCD_UNIQUE_ABS`
pub fn int_gcd_unique_abs() -> @kernel.Thm {
  int_gcd_unique_abs_c.get()
}

///|
/// INT_GCD_REFL
fn step_46() -> Unit raise {
  let t42 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_gcd_unique_abs()])),
    @int.integer_tac,
  )
  int_gcd_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, gcd((a, a)) == abs(a)"), t42),
  )
}

///|
let int_gcd_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_REFL")

///|
/// `INT_GCD_REFL`
pub fn int_gcd_refl() -> @kernel.Thm {
  int_gcd_refl_c.get()
}

///|
/// INT_GCD_SYM
fn step_47() -> Unit raise {
  let t43 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([int_gcd_pos(), @equal.gsym(int_divides_antisym_pos())]),
    ),
    @int.integer_tac,
  )
  int_gcd_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((a, b)) == gcd((b, a))"), t43),
  )
}

///|
let int_gcd_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_SYM")

///|
/// `INT_GCD_SYM`
pub fn int_gcd_sym() -> @kernel.Thm {
  int_gcd_sym_c.get()
}

///|
/// INT_GCD_ASSOC
fn step_48() -> Unit raise {
  let t44 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([int_gcd_pos(), @equal.gsym(int_divides_antisym_pos())]),
    ),
    @int.integer_tac,
  )
  int_gcd_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, gcd((a, gcd((b, c)))) == gcd((gcd((a, b)), c))"),
      t44,
    ),
  )
}

///|
let int_gcd_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_ASSOC")

///|
/// `INT_GCD_ASSOC`
pub fn int_gcd_assoc() -> @kernel.Thm {
  int_gcd_assoc_c.get()
}

///|
/// INT_GCD_1
fn step_49() -> Unit raise {
  let t45 = @simp.simp_tac(
    @list.List([int_gcd_unique(), @int.int_pos(), int_divides_1()]),
  )
  int_gcd_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, gcd((a, int_of_num(1))) == int_of_num(1) && gcd((int_of_num(1), a)) == int_of_num(1)"),
      t45,
    ),
  )
}

///|
let int_gcd_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_1")

///|
/// `INT_GCD_1`
pub fn int_gcd_1() -> @kernel.Thm {
  int_gcd_1_c.get()
}

///|
/// INT_GCD_0
fn step_50() -> Unit raise {
  let t46 = @tactics.then_tac(
    @simp.simp_tac(@list.List([int_gcd_unique_abs()])),
    @int.integer_tac,
  )
  int_gcd_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, gcd((a, int_of_num(0))) == abs(a) && gcd((int_of_num(0), a)) == abs(a)"),
      t46,
    ),
  )
}

///|
let int_gcd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_0")

///|
/// `INT_GCD_0`
pub fn int_gcd_0() -> @kernel.Thm {
  int_gcd_0_c.get()
}

///|
/// INT_GCD_EQ_0
fn step_51() -> Unit raise {
  int_gcd_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, (gcd((a, b)) == int_of_num(0)) == (a == int_of_num(0) && b == int_of_num(0))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_gcd_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_EQ_0")

///|
/// `INT_GCD_EQ_0`
pub fn int_gcd_eq_0() -> @kernel.Thm {
  int_gcd_eq_0_c.get()
}

///|
/// INT_GCD_ABS
fn step_52() -> Unit raise {
  let t47 = @simp.rewrite_tac(
    @list.List([
      int_gcd_unique(),
      @int.int_divides_abs(),
      int_gcd_pos(),
      int_gcd(),
    ]),
  )
  int_gcd_abs_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((abs(a), b)) == gcd((a, b)) && gcd((a, abs(b))) == gcd((a, b))"),
      t47,
    ),
  )
}

///|
let int_gcd_abs_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_ABS")

///|
/// `INT_GCD_ABS`
pub fn int_gcd_abs_v1() -> @kernel.Thm {
  int_gcd_abs_v1_c.get()
}

///|
/// INT_GCD_MULTIPLE
fn step_53() -> Unit raise {
  let t48 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_gcd_unique_abs()])),
    @int.integer_tac,
  )
  int_gcd_multiple_c.set(
    (
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((a, a * b)) == abs(a) && gcd((b, a * b)) == abs(b)"),
      t48,
    ),
  )
}

///|
let int_gcd_multiple_c : @lib.Cell[(@kernel.Term, @tactics.Tactic)] = @lib.Cell::new(
  "INT_GCD_MULTIPLE",
)

///|
/// `INT_GCD_MULTIPLE`
pub fn int_gcd_multiple() -> (@kernel.Term, @tactics.Tactic) {
  int_gcd_multiple_c.get()
}

///|
/// INT_GCD_ADD
fn step_54() -> Unit raise {
  let t49 = @tactics.then_tac(
    @simp.simp_tac(@list.List([int_gcd_unique(), int_gcd_pos()])),
    @int.integer_tac,
  )
  int_gcd_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, gcd((a + b, b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((b + a, b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, a + b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, b + a)) == gcd((a, b)))"),
      t49,
    ),
  )
}

///|
let int_gcd_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_ADD")

///|
/// `INT_GCD_ADD`
pub fn int_gcd_add() -> @kernel.Thm {
  int_gcd_add_c.get()
}

///|
/// INT_GCD_SUB
fn step_55() -> Unit raise {
  let t50 = @tactics.then_tac(
    @simp.simp_tac(@list.List([int_gcd_unique(), int_gcd_pos()])),
    @int.integer_tac,
  )
  int_gcd_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, gcd((a - b, b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((b - a, b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, a - b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, b - a)) == gcd((a, b)))"),
      t50,
    ),
  )
}

///|
let int_gcd_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_SUB")

///|
/// `INT_GCD_SUB`
pub fn int_gcd_sub() -> @kernel.Thm {
  int_gcd_sub_c.get()
}

///|
/// INT_DIVIDES_GCD_LEFT
fn step_56() -> Unit raise {
  let t51 = @meson.meson_tac(
    @list.List([int_divides_refl(), int_divides_trans()]),
  )
  let t52 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        int_gcd_unique(),
        @int.int_abs_pos(),
        @int.int_divides_abs(),
        int_divides_refl(),
      ]),
    ),
    t51,
  )
  int_divides_gcd_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(m, n) == (gcd((m, n)) == abs(m))"),
      t52,
    ),
  )
}

///|
let int_divides_gcd_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_GCD_LEFT",
)

///|
/// `INT_DIVIDES_GCD_LEFT`
pub fn int_divides_gcd_left() -> @kernel.Thm {
  int_divides_gcd_left_c.get()
}

///|
/// INT_DIVIDES_GCD_RIGHT
fn step_57() -> Unit raise {
  let t53 = @meson.meson_tac(
    @list.List([int_divides_refl(), int_divides_trans()]),
  )
  let t54 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        int_gcd_unique(),
        @int.int_abs_pos(),
        @int.int_divides_abs(),
        int_divides_refl(),
      ]),
    ),
    t53,
  )
  int_divides_gcd_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(n, m) == (gcd((m, n)) == abs(n))"),
      t54,
    ),
  )
}

///|
let int_divides_gcd_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_GCD_RIGHT",
)

///|
/// `INT_DIVIDES_GCD_RIGHT`
pub fn int_divides_gcd_right() -> @kernel.Thm {
  int_divides_gcd_right_c.get()
}

///|
/// INT_GCD_EQ
fn step_58() -> Unit raise {
  let t60 = @simp.rewrite_tac(@list.List([int_gcd_divides()]))
  let t59 = @tactics.first_x_assum(fn(
    x57 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x57
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t56 = @simp.asm_rewrite_tac(
    @list.List([int_divides_gcd(), int_gcd_divides()]),
  )
  let t55 = @simp.simp_tac(
    @list.List([@equal.gsym(int_divides_antisym_pos()), int_gcd_pos()]),
  )
  let t61 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t55),
        t56,
      ),
      t59,
    ),
    t60,
  )
  int_gcd_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ u : Int, ∀ v : Int, (∀ d : Int, (divides(d, x) && divides(d, y)) == (divides(d, u) && divides(d, v))) → gcd((x, y)) == gcd((u, v))"),
      t61,
    ),
  )
}

///|
let int_gcd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_EQ")

///|
/// `INT_GCD_EQ`
pub fn int_gcd_eq() -> @kernel.Thm {
  int_gcd_eq_c.get()
}

///|
/// INT_GCD_LNEG
fn step_59() -> Unit raise {
  let t62 = @tactics.match_mp_tac(int_gcd_eq())
  let t63 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t62),
    @int.integer_tac,
  )
  int_gcd_lneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((-a, b)) == gcd((a, b))"), t63),
  )
}

///|
let int_gcd_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_LNEG")

///|
/// `INT_GCD_LNEG`
pub fn int_gcd_lneg() -> @kernel.Thm {
  int_gcd_lneg_c.get()
}

///|
/// INT_GCD_RNEG
fn step_60() -> Unit raise {
  let t64 = @tactics.match_mp_tac(int_gcd_eq())
  let t65 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64),
    @int.integer_tac,
  )
  int_gcd_rneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((a, -b)) == gcd((a, b))"), t65),
  )
}

///|
let int_gcd_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_RNEG")

///|
/// `INT_GCD_RNEG`
pub fn int_gcd_rneg() -> @kernel.Thm {
  int_gcd_rneg_c.get()
}

///|
/// INT_GCD_NEG
fn step_61() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([int_gcd_lneg(), int_gcd_rneg()]))
  int_gcd_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, gcd((-a, b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, -b)) == gcd((a, b)))"),
      t66,
    ),
  )
}

///|
let int_gcd_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_NEG")

///|
/// `INT_GCD_NEG`
pub fn int_gcd_neg() -> @kernel.Thm {
  int_gcd_neg_c.get()
}

///|
/// INT_GCD_LABS
fn step_62() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([int_gcd_lneg()]))
  let t68 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t67,
  )
  int_gcd_labs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((abs(a), b)) == gcd((a, b))"), t68),
  )
}

///|
let int_gcd_labs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_LABS")

///|
/// `INT_GCD_LABS`
pub fn int_gcd_labs() -> @kernel.Thm {
  int_gcd_labs_c.get()
}

///|
/// INT_GCD_RABS
fn step_63() -> Unit raise {
  let t69 = @meson.meson_tac(@list.List([int_gcd_rneg()]))
  let t70 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t69,
  )
  int_gcd_rabs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, gcd((a, abs(b))) == gcd((a, b))"), t70),
  )
}

///|
let int_gcd_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_RABS")

///|
/// `INT_GCD_RABS`
pub fn int_gcd_rabs() -> @kernel.Thm {
  int_gcd_rabs_c.get()
}

///|
/// INT_GCD_ABS
fn step_64() -> Unit raise {
  let t71 = @simp.rewrite_tac(@list.List([int_gcd_labs(), int_gcd_rabs()]))
  int_gcd_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, gcd((abs(a), b)) == gcd((a, b))) && (∀ a : Int, ∀ b : Int, gcd((a, abs(b))) == gcd((a, b)))"),
      t71,
    ),
  )
}

///|
let int_gcd_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_ABS")

///|
/// `INT_GCD_ABS`
pub fn int_gcd_abs() -> @kernel.Thm {
  int_gcd_abs_c.get()
}

///|
/// INT_GCD_LMUL
fn step_65() -> Unit raise {
  let t74 = @tactics.conv_tac(@int.integer_rule)
  let t73 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_divides_antisym_abs())]),
  )
  let t72 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_abs_mul())]))
  let t75 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_gcd())])),
        t72,
      ),
      t73,
    ),
    t74,
  )
  int_gcd_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, gcd((c * a, c * b)) == abs(c) * gcd((a, b))"),
      t75,
    ),
  )
}

///|
let int_gcd_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_LMUL")

///|
/// `INT_GCD_LMUL`
pub fn int_gcd_lmul() -> @kernel.Thm {
  int_gcd_lmul_c.get()
}

///|
/// INT_GCD_RMUL
fn step_66() -> Unit raise {
  let t76 = @simp.rewrite_tac(@list.List([int_gcd_lmul()]))
  let t77 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@int.int_mul_sym()])),
    t76,
  )
  int_gcd_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, gcd((a * c, b * c)) == gcd((a, b)) * abs(c)"),
      t77,
    ),
  )
}

///|
let int_gcd_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_RMUL")

///|
/// `INT_GCD_RMUL`
pub fn int_gcd_rmul() -> @kernel.Thm {
  int_gcd_rmul_c.get()
}

///|
/// INT_GCD_COPRIME_LMUL
fn step_67() -> Unit raise {
  let t80 = @tactics.conv_tac(@int.integer_rule)
  let t79 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_divides_antisym_abs())]),
  )
  let t78 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_abs_mul())]))
  let t81 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_gcd())])),
        t78,
      ),
      t79,
    ),
    t80,
  )
  int_gcd_coprime_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, coprime((a, b)) → gcd((a * b, c)) == gcd((a, c)) * gcd((b, c))"),
      t81,
    ),
  )
}

///|
let int_gcd_coprime_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME_LMUL",
)

///|
/// `INT_GCD_COPRIME_LMUL`
pub fn int_gcd_coprime_lmul() -> @kernel.Thm {
  int_gcd_coprime_lmul_c.get()
}

///|
/// INT_GCD_COPRIME_RMUL
fn step_68() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([int_gcd_coprime_lmul()]))
  let t83 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([int_gcd_sym()])),
    t82,
  )
  int_gcd_coprime_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, coprime((b, c)) → gcd((a, b * c)) == gcd((a, b)) * gcd((a, c))"),
      t83,
    ),
  )
}

///|
let int_gcd_coprime_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME_RMUL",
)

///|
/// `INT_GCD_COPRIME_RMUL`
pub fn int_gcd_coprime_rmul() -> @kernel.Thm {
  int_gcd_coprime_rmul_c.get()
}

///|
/// INT_GCD_COPRIME_DIVIDES_LMUL
fn step_69() -> Unit raise {
  let t86 = @tactics.conv_tac(@int.integer_rule)
  let t85 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_divides_antisym_abs())]),
  )
  let t84 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_abs_mul())]))
  let t87 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_gcd())])),
        t84,
      ),
      t85,
    ),
    t86,
  )
  int_gcd_coprime_divides_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, coprime((a, b)) && divides(a, c) → gcd((a * b, c)) == abs(a) * gcd((b, c))"),
      t87,
    ),
  )
}

///|
let int_gcd_coprime_divides_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME_DIVIDES_LMUL",
)

///|
/// `INT_GCD_COPRIME_DIVIDES_LMUL`
pub fn int_gcd_coprime_divides_lmul() -> @kernel.Thm {
  int_gcd_coprime_divides_lmul_c.get()
}

///|
/// INT_GCD_COPRIME_DIVIDES_RMUL
fn step_70() -> Unit raise {
  let t88 = @simp.rewrite_tac(@list.List([int_gcd_coprime_divides_lmul()]))
  let t89 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([int_gcd_sym()])),
    t88,
  )
  int_gcd_coprime_divides_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, coprime((b, c)) && divides(b, a) → gcd((a, b * c)) == abs(b) * gcd((a, c))"),
      t89,
    ),
  )
}

///|
let int_gcd_coprime_divides_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME_DIVIDES_RMUL",
)

///|
/// `INT_GCD_COPRIME_DIVIDES_RMUL`
pub fn int_gcd_coprime_divides_rmul() -> @kernel.Thm {
  int_gcd_coprime_divides_rmul_c.get()
}

///|
/// INT_GCD_COPRIME_EXISTS
fn step_71() -> Unit raise {
  let t100 = @tactics.conv_tac(@int.integer_rule)
  let t99 = @tactics.conv_tac(@int.int_reduce_conv)
  let t98 = @simp.asm_rewrite_tac(@list.List([int_gcd_0()]))
  let t97 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("int_of_num(1)")),
  )
  let t96 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([int_gcd_eq_0()])),
  )
  let t94 = @tactics.conv_tac(@int.integer_rule)
  let t95 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.pop_assum(fn(
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
      }),
      t94,
    ),
  ])
  let t90 = @class.asm_cases_tac(@term_syntax.parse_term("gcd(((a : Int), (b : Int))) == int_of_num(0)"))
  let t101 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t90),
              t95,
            ),
            t96,
          ),
          t97,
        ),
        t98,
      ),
      t99,
    ),
    t100,
  )
  int_gcd_coprime_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ a' : Int, ∃ b' : Int, a == a' * gcd((a, b)) && b == b' * gcd((a, b)) && coprime((a', b'))"),
      t101,
    ),
  )
}

///|
let int_gcd_coprime_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME_EXISTS",
)

///|
/// `INT_GCD_COPRIME_EXISTS`
pub fn int_gcd_coprime_exists() -> @kernel.Thm {
  int_gcd_coprime_exists_c.get()
}

///|
/// INT_ABS_LCM
fn step_72() -> Unit raise {
  let t102 = @simp.rewrite_tac(
    @list.List([@int.int_abs_v1(), @int.int_lcm_pos()]),
  )
  int_abs_lcm_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, abs(lcm((a, b))) == lcm((a, b))"), t102),
  )
}

///|
let int_abs_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_LCM")

///|
/// `INT_ABS_LCM`
pub fn int_abs_lcm() -> @kernel.Thm {
  int_abs_lcm_c.get()
}

///|
/// INT_LCM_EQ_0
fn step_73() -> Unit raise {
  let t103 = @simp.rewrite_tac(@list.List([@int.int_divides_lcm_gcd()]))
  let t104 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @int.integer_rule(@term_syntax.parse_term("((n : Int) == int_of_num(0)) == divides(int_of_num(0), n)")),
        ]),
      ),
      t103,
    ),
    @int.integer_tac,
  )
  int_lcm_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, (lcm((m, n)) == int_of_num(0)) == (m == int_of_num(0) || n == int_of_num(0))"),
      t104,
    ),
  )
}

///|
let int_lcm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_EQ_0")

///|
/// `INT_LCM_EQ_0`
pub fn int_lcm_eq_0() -> @kernel.Thm {
  int_lcm_eq_0_c.get()
}

///|
/// INT_DIVIDES_LCM
fn step_74() -> Unit raise {
  let t105 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_divides_lcm_gcd()])),
    @int.integer_tac,
  )
  int_divides_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ r : Int, divides(r, m) || divides(r, n) → divides(r, lcm((m, n)))"),
      t105,
    ),
  )
}

///|
let int_divides_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LCM",
)

///|
/// `INT_DIVIDES_LCM`
pub fn int_divides_lcm() -> @kernel.Thm {
  int_divides_lcm_c.get()
}

///|
/// INT_LCM_0
fn step_75() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([int_lcm_eq_0()]))
  int_lcm_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, lcm((int_of_num(0), n)) == int_of_num(0)) && (∀ n : Int, lcm((n, int_of_num(0))) == int_of_num(0))"),
      t106,
    ),
  )
}

///|
let int_lcm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_0")

///|
/// `INT_LCM_0`
pub fn int_lcm_0() -> @kernel.Thm {
  int_lcm_0_c.get()
}

///|
/// INT_LCM_1
fn step_76() -> Unit raise {
  let t107 = @simp.asm_rewrite_tac(
    @list.List([@int.int_div_1(), @int.int_abs_num()]),
  )
  let t108 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @int.int_lcm(),
            @int.int_mul_lid(),
            @int.int_mul_rid(),
            int_gcd_1(),
          ]),
        ),
        @tactics.gen_tac,
      ),
      @class.cond_cases_tac,
    ),
    t107,
  )
  int_lcm_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, lcm((int_of_num(1), n)) == abs(n)) && (∀ n : Int, lcm((n, int_of_num(1))) == abs(n))"),
      t108,
    ),
  )
}

///|
let int_lcm_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_1")

///|
/// `INT_LCM_1`
pub fn int_lcm_1() -> @kernel.Thm {
  int_lcm_1_c.get()
}

///|
/// INT_LCM_UNIQUE_ABS
fn step_77() -> Unit raise {
  let t112 = @meson.meson_tac(
    @list.List([int_divides_refl(), int_divides_trans()]),
  )
  let t111 = @simp.rewrite_tac(@list.List([@int.int_lcm_divides()]))
  let t110 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_divides_antisym_abs()),
      int_divides_antisym_multiples(),
    ]),
  )
  let t109 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_lcm())]))
  let t113 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t109),
        t110,
      ),
      t111,
    ),
    t112,
  )
  int_lcm_unique_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, (lcm((a, b)) == abs(m)) == (divides(a, m) && divides(b, m) && (∀ n : Int, divides(a, n) && divides(b, n) → divides(m, n)))"),
      t113,
    ),
  )
}

///|
let int_lcm_unique_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LCM_UNIQUE_ABS",
)

///|
/// `INT_LCM_UNIQUE_ABS`
pub fn int_lcm_unique_abs() -> @kernel.Thm {
  int_lcm_unique_abs_c.get()
}

///|
/// INT_LCM_UNIQUE
fn step_78() -> Unit raise {
  let t115 = @term_syntax.parse_term("(b : Int)")
  let t116 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Int)"), t115]),
      @int.int_lcm_pos(),
    ),
  )
  let t114 = @simp.rewrite_tac(@list.List([@equal.gsym(int_lcm_unique_abs())]))
  let t117 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114),
      t116,
    ),
    @int.int_arith_tac,
  )
  int_lcm_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, (lcm((a, b)) == m) == (int_of_num(0) <= m && divides(a, m) && divides(b, m) && (∀ n : Int, divides(a, n) && divides(b, n) → divides(m, n)))"),
      t117,
    ),
  )
}

///|
let int_lcm_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_UNIQUE")

///|
/// `INT_LCM_UNIQUE`
pub fn int_lcm_unique() -> @kernel.Thm {
  int_lcm_unique_c.get()
}

///|
/// INT_LCM_EQ
fn step_79() -> Unit raise {
  let t120 = @simp.asm_rewrite_tac(@list.List([@int.int_lcm_divides()]))
  let t119 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_divides_antisym_abs()),
      int_divides_antisym_multiples(),
    ]),
  )
  let t118 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_lcm())]))
  let t121 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t118),
      t119,
    ),
    t120,
  )
  int_lcm_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ u : Int, ∀ v : Int, (∀ m : Int, (divides(x, m) && divides(y, m)) == (divides(u, m) && divides(v, m))) → lcm((x, y)) == lcm((u, v))"),
      t121,
    ),
  )
}

///|
let int_lcm_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_EQ")

///|
/// `INT_LCM_EQ`
pub fn int_lcm_eq() -> @kernel.Thm {
  int_lcm_eq_c.get()
}

///|
/// INT_LCM_REFL
fn step_80() -> Unit raise {
  let t123 = @simp.asm_simp_tac(
    @list.List([@int.int_div_mul(), @int.int_abs_zero()]),
  )
  let t122 = @simp.asm_rewrite_tac(
    @list.List([@int.int_abs_num(), @int.int_abs_mul()]),
  )
  let t124 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@int.int_lcm(), int_gcd_refl(), @int.int_entire()]),
          ),
          @tactics.gen_tac,
        ),
        @class.cond_cases_tac,
      ),
      t122,
    ),
    t123,
  )
  int_lcm_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Int, lcm((n, n)) == abs(n)"), t124),
  )
}

///|
let int_lcm_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_REFL")

///|
/// `INT_LCM_REFL`
pub fn int_lcm_refl() -> @kernel.Thm {
  int_lcm_refl_c.get()
}

///|
/// INT_LCM_SYM
fn step_81() -> Unit raise {
  let t125 = @simp.rewrite_tac(
    @list.List([@int.int_lcm(), int_gcd_sym(), @int.int_mul_sym()]),
  )
  int_lcm_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, lcm((m, n)) == lcm((n, m))"), t125),
  )
}

///|
let int_lcm_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_SYM")

///|
/// `INT_LCM_SYM`
pub fn int_lcm_sym() -> @kernel.Thm {
  int_lcm_sym_c.get()
}

///|
/// INT_LCM_ASSOC
fn step_82() -> Unit raise {
  let t129 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t128 = @simp.rewrite_tac(@list.List([@int.int_lcm_divides()]))
  let t127 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_divides_antisym_abs()),
      int_divides_antisym_multiples(),
    ]),
  )
  let t126 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_abs_lcm())]))
  let t130 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t126),
        t127,
      ),
      t128,
    ),
    t129,
  )
  int_lcm_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, lcm((m, lcm((n, p)))) == lcm((lcm((m, n)), p))"),
      t130,
    ),
  )
}

///|
let int_lcm_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_ASSOC")

///|
/// `INT_LCM_ASSOC`
pub fn int_lcm_assoc() -> @kernel.Thm {
  int_lcm_assoc_c.get()
}

///|
/// INT_LCM_LNEG
fn step_83() -> Unit raise {
  let t131 = @simp.simp_tac(
    @list.List([
      @int.int_lcm(),
      @int.int_mul_lneg(),
      @int.int_abs_neg(),
      int_gcd_lneg(),
      @int.int_neg_eq_0(),
    ]),
  )
  int_lcm_lneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, lcm((-a, b)) == lcm((a, b))"), t131),
  )
}

///|
let int_lcm_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_LNEG")

///|
/// `INT_LCM_LNEG`
pub fn int_lcm_lneg() -> @kernel.Thm {
  int_lcm_lneg_c.get()
}

///|
/// INT_LCM_RNEG
fn step_84() -> Unit raise {
  let t132 = @simp.simp_tac(
    @list.List([
      @int.int_lcm(),
      @int.int_mul_rneg(),
      @int.int_abs_neg(),
      int_gcd_rneg(),
      @int.int_neg_eq_0(),
    ]),
  )
  int_lcm_rneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, lcm((a, -b)) == lcm((a, b))"), t132),
  )
}

///|
let int_lcm_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_RNEG")

///|
/// `INT_LCM_RNEG`
pub fn int_lcm_rneg() -> @kernel.Thm {
  int_lcm_rneg_c.get()
}

///|
/// INT_LCM_NEG
fn step_85() -> Unit raise {
  let t133 = @simp.rewrite_tac(@list.List([int_lcm_lneg(), int_lcm_rneg()]))
  int_lcm_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, lcm((-a, b)) == lcm((a, b))) && (∀ a : Int, ∀ b : Int, lcm((a, -b)) == lcm((a, b)))"),
      t133,
    ),
  )
}

///|
let int_lcm_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_NEG")

///|
/// `INT_LCM_NEG`
pub fn int_lcm_neg() -> @kernel.Thm {
  int_lcm_neg_c.get()
}

///|
/// INT_LCM_LABS
fn step_86() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([int_lcm_lneg()]))
  let t135 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t134,
  )
  int_lcm_labs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, lcm((abs(a), b)) == lcm((a, b))"), t135),
  )
}

///|
let int_lcm_labs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_LABS")

///|
/// `INT_LCM_LABS`
pub fn int_lcm_labs() -> @kernel.Thm {
  int_lcm_labs_c.get()
}

///|
/// INT_LCM_RABS
fn step_87() -> Unit raise {
  let t136 = @meson.meson_tac(@list.List([int_lcm_rneg()]))
  let t137 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t136,
  )
  int_lcm_rabs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, lcm((a, abs(b))) == lcm((a, b))"), t137),
  )
}

///|
let int_lcm_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_RABS")

///|
/// `INT_LCM_RABS`
pub fn int_lcm_rabs() -> @kernel.Thm {
  int_lcm_rabs_c.get()
}

///|
/// INT_LCM_ABS
fn step_88() -> Unit raise {
  let t138 = @simp.rewrite_tac(@list.List([int_lcm_labs(), int_lcm_rabs()]))
  int_lcm_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, lcm((abs(a), b)) == lcm((a, b))) && (∀ a : Int, ∀ b : Int, lcm((a, abs(b))) == lcm((a, b)))"),
      t138,
    ),
  )
}

///|
let int_lcm_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_ABS")

///|
/// `INT_LCM_ABS`
pub fn int_lcm_abs() -> @kernel.Thm {
  int_lcm_abs_c.get()
}

///|
/// INT_LCM_LMUL
fn step_89() -> Unit raise {
  let t147 = @simp.rewrite_tac(
    @list.List([@int.int_abs_mul(), @int.int_mul_ac()]),
  )
  let t146 = @simp.rewrite_tac(
    @list.List([
      int_gcd_lmul(),
      @int.int_mul_lcm_gcd(),
      @int.int_arith(@term_syntax.parse_term("(x : Int) * (a : Int) * (x * (b : Int)) == x * (x * (a * b))")),
    ]),
  )
  let t145 = @simp.asm_rewrite_tac(
    @list.List([int_gcd_eq_0(), @int.int_entire(), @int.int_mul_lcm_gcd()]),
  )
  let t144 = @tactics.exists_tac(@term_syntax.parse_term("gcd(((c : Int) * (a : Int), c * (b : Int)))"))
  let t143 = @tactics.match_mp_tac(
    @int.int_ring(
      @term_syntax.parse_term("∀ x : Int, !(x == int_of_num(0)) && (a : Int) * x == (b : Int) * x → a == b"),
    ),
  )
  let t142 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_mul_lzero(),
      @int.int_mul_rzero(),
      @int.int_abs_num(),
      int_lcm_0(),
    ]),
  )
  let t139 = @term_syntax.parse_term("(c : Int) == int_of_num(0)")
  let t140 = @term_syntax.parse_term("(b : Int) == int_of_num(0)")
  let t141 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(a : Int) == int_of_num(0)"), t140, t139]),
  )
  let t148 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t141),
              t142,
            ),
            t143,
          ),
          t144,
        ),
        t145,
      ),
      t146,
    ),
    t147,
  )
  int_lcm_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, lcm((c * a, c * b)) == abs(c) * lcm((a, b))"),
      t148,
    ),
  )
}

///|
let int_lcm_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_LMUL")

///|
/// `INT_LCM_LMUL`
pub fn int_lcm_lmul() -> @kernel.Thm {
  int_lcm_lmul_c.get()
}

///|
/// INT_LCM_RMUL
fn step_90() -> Unit raise {
  let t149 = @simp.rewrite_tac(@list.List([int_lcm_lmul()]))
  let t150 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@int.int_mul_sym()])),
    t149,
  )
  int_lcm_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, lcm((a * c, b * c)) == lcm((a, b)) * abs(c)"),
      t150,
    ),
  )
}

///|
let int_lcm_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_RMUL")

///|
/// `INT_LCM_RMUL`
pub fn int_lcm_rmul() -> @kernel.Thm {
  int_lcm_rmul_c.get()
}

///|
/// INT_COPRIME
fn step_91() -> Unit raise {
  let t151 = @simp.rewrite_tac(
    @list.List([
      int_coprime_gcd(),
      int_gcd_unique(),
      @int.int_pos(),
      int_divides_1(),
    ]),
  )
  int_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == (∀ d : Int, divides(d, a) && divides(d, b) → divides(d, int_of_num(1)))"),
      t151,
    ),
  )
}

///|
let int_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_COPRIME")

///|
/// `INT_COPRIME`
pub fn int_coprime() -> @kernel.Thm {
  int_coprime_c.get()
}

///|
/// INT_COPRIME_ALT
fn step_92() -> Unit raise {
  let t152 = @meson.meson_tac(
    @list.List([int_divides_1(), int_divides_trans(), int_coprime()]),
  )
  int_coprime_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == (∀ d : Int, (divides(d, a) && divides(d, b)) == divides(d, int_of_num(1)))"),
      t152,
    ),
  )
}

///|
let int_coprime_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_ALT",
)

///|
/// `INT_COPRIME_ALT`
pub fn int_coprime_alt() -> @kernel.Thm {
  int_coprime_alt_c.get()
}

///|
/// INT_COPRIME_SYM
fn step_93() -> Unit raise {
  int_coprime_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == coprime((b, a))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_SYM",
)

///|
/// `INT_COPRIME_SYM`
pub fn int_coprime_sym() -> @kernel.Thm {
  int_coprime_sym_c.get()
}

///|
/// INT_COPRIME_DIVPROD
fn step_94() -> Unit raise {
  int_coprime_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a * b) && coprime((d, a)) → divides(d, b)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_DIVPROD",
)

///|
/// `INT_COPRIME_DIVPROD`
pub fn int_coprime_divprod() -> @kernel.Thm {
  int_coprime_divprod_c.get()
}

///|
/// INT_COPRIME_1
fn step_95() -> Unit raise {
  int_coprime_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, coprime((a, int_of_num(1))) && coprime((int_of_num(1), a))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_COPRIME_1")

///|
/// `INT_COPRIME_1`
pub fn int_coprime_1() -> @kernel.Thm {
  int_coprime_1_c.get()
}

///|
/// INT_GCD_COPRIME
fn step_96() -> Unit raise {
  int_gcd_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ a' : Int, ∀ b' : Int, !(gcd((a, b)) == int_of_num(0)) && a == a' * gcd((a, b)) && b == b' * gcd((a, b)) → coprime((a', b'))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_gcd_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_COPRIME",
)

///|
/// `INT_GCD_COPRIME`
pub fn int_gcd_coprime() -> @kernel.Thm {
  int_gcd_coprime_c.get()
}

///|
/// INT_COPRIME_0
fn step_97() -> Unit raise {
  int_coprime_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, coprime((a, int_of_num(0))) == divides(a, int_of_num(1))) && (∀ a : Int, coprime((int_of_num(0), a)) == divides(a, int_of_num(1)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_COPRIME_0")

///|
/// `INT_COPRIME_0`
pub fn int_coprime_0() -> @kernel.Thm {
  int_coprime_0_c.get()
}

///|
/// INT_COPRIME_MUL
fn step_98() -> Unit raise {
  int_coprime_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, coprime((d, a)) && coprime((d, b)) → coprime((d, a * b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_MUL",
)

///|
/// `INT_COPRIME_MUL`
pub fn int_coprime_mul() -> @kernel.Thm {
  int_coprime_mul_c.get()
}

///|
/// INT_COPRIME_LMUL2
fn step_99() -> Unit raise {
  int_coprime_lmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, coprime((d, a * b)) → coprime((d, b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_lmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LMUL2",
)

///|
/// `INT_COPRIME_LMUL2`
pub fn int_coprime_lmul2() -> @kernel.Thm {
  int_coprime_lmul2_c.get()
}

///|
/// INT_COPRIME_RMUL2
fn step_100() -> Unit raise {
  int_coprime_rmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, coprime((d, a * b)) → coprime((d, a))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_rmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RMUL2",
)

///|
/// `INT_COPRIME_RMUL2`
pub fn int_coprime_rmul2() -> @kernel.Thm {
  int_coprime_rmul2_c.get()
}

///|
/// INT_COPRIME_LMUL
fn step_101() -> Unit raise {
  int_coprime_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, coprime((a * b, d)) == (coprime((a, d)) && coprime((b, d)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LMUL",
)

///|
/// `INT_COPRIME_LMUL`
pub fn int_coprime_lmul() -> @kernel.Thm {
  int_coprime_lmul_c.get()
}

///|
/// INT_COPRIME_RMUL
fn step_102() -> Unit raise {
  int_coprime_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, coprime((d, a * b)) == (coprime((d, a)) && coprime((d, b)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RMUL",
)

///|
/// `INT_COPRIME_RMUL`
pub fn int_coprime_rmul() -> @kernel.Thm {
  int_coprime_rmul_c.get()
}

///|
/// INT_COPRIME_REFL
fn step_103() -> Unit raise {
  int_coprime_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, coprime((n, n)) == divides(n, int_of_num(1))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_REFL",
)

///|
/// `INT_COPRIME_REFL`
pub fn int_coprime_refl() -> @kernel.Thm {
  int_coprime_refl_c.get()
}

///|
/// INT_COPRIME_PLUS1
fn step_104() -> Unit raise {
  int_coprime_plus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, coprime((n + int_of_num(1), n)) && coprime((n, n + int_of_num(1)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_plus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_PLUS1",
)

///|
/// `INT_COPRIME_PLUS1`
pub fn int_coprime_plus1() -> @kernel.Thm {
  int_coprime_plus1_c.get()
}

///|
/// INT_COPRIME_MINUS1
fn step_105() -> Unit raise {
  int_coprime_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, coprime((n - int_of_num(1), n)) && coprime((n, n - int_of_num(1)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_MINUS1",
)

///|
/// `INT_COPRIME_MINUS1`
pub fn int_coprime_minus1() -> @kernel.Thm {
  int_coprime_minus1_c.get()
}

///|
/// INT_COPRIME_RPOW
fn step_106() -> Unit raise {
  let t154 = @tactics.conv_tac(@class.taut)
  let t153 = @simp.asm_simp_tac(
    @list.List([
      @int.int_pow_v1(),
      int_coprime_1(),
      int_coprime_rmul(),
      @nums.not_suc(),
    ]),
  )
  let t155 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        @nums.induct_tac,
      ),
      t153,
    ),
    t154,
  )
  int_coprime_rpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ k : Num, coprime((m, pow(n, k))) == (coprime((m, n)) || k == 0)"),
      t155,
    ),
  )
}

///|
let int_coprime_rpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RPOW",
)

///|
/// `INT_COPRIME_RPOW`
pub fn int_coprime_rpow() -> @kernel.Thm {
  int_coprime_rpow_c.get()
}

///|
/// INT_COPRIME_LPOW
fn step_107() -> Unit raise {
  let t156 = @simp.rewrite_tac(@list.List([int_coprime_rpow()]))
  let t157 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([int_coprime_sym()])),
    t156,
  )
  int_coprime_lpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ k : Num, coprime((pow(m, k), n)) == (coprime((m, n)) || k == 0)"),
      t157,
    ),
  )
}

///|
let int_coprime_lpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LPOW",
)

///|
/// `INT_COPRIME_LPOW`
pub fn int_coprime_lpow() -> @kernel.Thm {
  int_coprime_lpow_c.get()
}

///|
/// INT_COPRIME_POW2
fn step_108() -> Unit raise {
  let t158 = @simp.rewrite_tac(
    @list.List([int_coprime_rpow(), int_coprime_lpow(), @theorems.disj_aci()]),
  )
  int_coprime_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ k : Num, coprime((pow(m, k), pow(n, k))) == (coprime((m, n)) || k == 0)"),
      t158,
    ),
  )
}

///|
let int_coprime_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW2",
)

///|
/// `INT_COPRIME_POW2`
pub fn int_coprime_pow2() -> @kernel.Thm {
  int_coprime_pow2_c.get()
}

///|
/// INT_COPRIME_POW
fn step_109() -> Unit raise {
  let t159 = @simp.simp_tac(@list.List([int_coprime_rpow()]))
  int_coprime_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ d : Int, coprime((d, a)) → coprime((d, pow(a, n)))"),
      t159,
    ),
  )
}

///|
let int_coprime_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW",
)

///|
/// `INT_COPRIME_POW`
pub fn int_coprime_pow() -> @kernel.Thm {
  int_coprime_pow_c.get()
}

///|
/// INT_COPRIME_POW_IMP
fn step_110() -> Unit raise {
  let t160 = @meson.meson_tac(
    @list.List([int_coprime_pow(), int_coprime_sym()]),
  )
  int_coprime_pow_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ b : Int, coprime((a, b)) → coprime((pow(a, n), pow(b, n)))"),
      t160,
    ),
  )
}

///|
let int_coprime_pow_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW_IMP",
)

///|
/// `INT_COPRIME_POW_IMP`
pub fn int_coprime_pow_imp() -> @kernel.Thm {
  int_coprime_pow_imp_c.get()
}

///|
/// INT_GCD_POW
fn step_111() -> Unit raise {
  let t168 = @simp.asm_simp_tac(
    @list.List([
      @bool.eq_imp_rule(@bool.spec_all(int_coprime_gcd())).0,
      int_coprime_pow2(),
      @int.int_pow_one(),
    ]),
  )
  let t167 = @simp.rewrite_tac(
    @list.List([@int.int_pow_mul(), int_gcd_rmul(), @int.int_abs_pow()]),
  )
  let t166 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t164 = @term_syntax.parse_term("(b' : Int)")
  let t165 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a' : Int)"), t164]),
  )
  let t163 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t161 = @term_syntax.parse_term("(b : Int)")
  let t162 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Int)"), t161]),
      int_gcd_coprime_exists(),
    ),
  )
  let t169 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t162),
              t163,
            ),
            t165,
          ),
          @tactics.strip_tac,
        ),
        t166,
      ),
      t167,
    ),
    t168,
  )
  int_gcd_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Num, gcd((pow(a, n), pow(b, n))) == pow(gcd((a, b)), n)"),
      t169,
    ),
  )
}

///|
let int_gcd_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_POW")

///|
/// `INT_GCD_POW`
pub fn int_gcd_pow() -> @kernel.Thm {
  int_gcd_pow_c.get()
}

///|
/// INT_LCM_POW
fn step_112() -> Unit raise {
  let t179 = @simp.rewrite_tac(
    @list.List([@int.int_mul_lcm_gcd(), @int.int_abs_pow()]),
  )
  let t178 = @simp.rewrite_tac(
    @list.List([int_gcd_pow(), @equal.gsym(@int.int_pow_mul())]),
  )
  let t177 = @simp.asm_rewrite_tac(
    @list.List([int_gcd_eq_0(), @int.int_pow_eq_0(), @int.int_mul_lcm_gcd()]),
  )
  let t176 = @tactics.exists_tac(
    @term_syntax.parse_term("gcd((pow((a : Int), (n : Num)), pow((b : Int), n)))"),
  )
  let t175 = @tactics.match_mp_tac(
    @int.int_ring(
      @term_syntax.parse_term("∀ x : Int, !(x == int_of_num(0)) && (a : Int) * x == (b : Int) * x → a == b"),
    ),
  )
  let t174 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_zero(), int_lcm_0()]),
  )
  let t172 = @term_syntax.parse_term("(b : Int) == int_of_num(0)")
  let t173 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(a : Int) == int_of_num(0)"), t172]),
  )
  let t171 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_pow_v1(),
      int_lcm_1(),
      @int.int_pow_one(),
      @int.int_abs_num(),
    ]),
  )
  let t170 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t180 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t170),
                  t171,
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
  )
  int_lcm_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Num, lcm((pow(a, n), pow(b, n))) == pow(lcm((a, b)), n)"),
      t180,
    ),
  )
}

///|
let int_lcm_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_POW")

///|
/// `INT_LCM_POW`
pub fn int_lcm_pow() -> @kernel.Thm {
  int_lcm_pow_c.get()
}

///|
/// INT_DIVISION_DECOMP
fn step_113() -> Unit raise {
  let t189 = @meson.meson_tac(@list.List([int_divides_refl()]))
  let t188 = @simp.rewrite_tac(@list.List([@int.int_mul_lzero()]))
  let t187 = @list.List([
    @simp.simp_tac(
      @list.List([int_gcd_eq_0(), int_gcd_0(), @int.int_abs_num()]),
    ),
    @int.integer_tac,
  ])
  let t186 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t182 = @class.asm_cases_tac(@term_syntax.parse_term("gcd(((a : Int), (b : Int))) == int_of_num(0)"))
  let t181 = @tactics.exists_tac(@term_syntax.parse_term("gcd(((a : Int), (b : Int)))"))
  let t190 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t181),
            t182,
          ),
          t186,
        ),
        t187,
      ),
      t188,
    ),
    t189,
  )
  int_division_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, divides(a, b * c) → (∃ b' : Int, ∃ c' : Int, a == b' * c' && divides(b', b) && divides(c', c))"),
      t190,
    ),
  )
}

///|
let int_division_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVISION_DECOMP",
)

///|
/// `INT_DIVISION_DECOMP`
pub fn int_division_decomp() -> @kernel.Thm {
  int_division_decomp_c.get()
}

///|
/// INT_DIVIDES_MUL
fn step_114() -> Unit raise {
  int_divides_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ r : Int, divides(m, r) && divides(n, r) && coprime((m, n)) → divides(m * n, r)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_divides_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_MUL",
)

///|
/// `INT_DIVIDES_MUL`
pub fn int_divides_mul() -> @kernel.Thm {
  int_divides_mul_c.get()
}

///|
/// INT_CHINESE_REMAINDER
fn step_115() -> Unit raise {
  int_chinese_remainder_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ u : Int, ∀ v : Int, coprime((a, b)) && !(a == int_of_num(0)) && !(b == int_of_num(0)) → (∃ x : Int, ∃ q1 : Int, ∃ q2 : Int, x == u + q1 * a && x == v + q2 * b)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_chinese_remainder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CHINESE_REMAINDER",
)

///|
/// `INT_CHINESE_REMAINDER`
pub fn int_chinese_remainder() -> @kernel.Thm {
  int_chinese_remainder_c.get()
}

///|
/// INT_CHINESE_REMAINDER_USUAL
fn step_116() -> Unit raise {
  int_chinese_remainder_usual_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ u : Int, ∀ v : Int, coprime((a, b)) → (∃ x : Int, op_eq_eq(x, u, mod(a)) && op_eq_eq(x, v, mod(b)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_chinese_remainder_usual_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CHINESE_REMAINDER_USUAL",
)

///|
/// `INT_CHINESE_REMAINDER_USUAL`
pub fn int_chinese_remainder_usual() -> @kernel.Thm {
  int_chinese_remainder_usual_c.get()
}

///|
/// INT_COPRIME_DIVISORS
fn step_117() -> Unit raise {
  int_coprime_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ d : Int, ∀ e : Int, divides(d, a) && divides(e, b) && coprime((a, b)) → coprime((d, e))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_DIVISORS",
)

///|
/// `INT_COPRIME_DIVISORS`
pub fn int_coprime_divisors() -> @kernel.Thm {
  int_coprime_divisors_c.get()
}

///|
/// INT_COPRIME_LNEG
fn step_118() -> Unit raise {
  int_coprime_lneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((-a, b)) == coprime((a, b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LNEG",
)

///|
/// `INT_COPRIME_LNEG`
pub fn int_coprime_lneg() -> @kernel.Thm {
  int_coprime_lneg_c.get()
}

///|
/// INT_COPRIME_RNEG
fn step_119() -> Unit raise {
  int_coprime_rneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, -b)) == coprime((a, b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RNEG",
)

///|
/// `INT_COPRIME_RNEG`
pub fn int_coprime_rneg() -> @kernel.Thm {
  int_coprime_rneg_c.get()
}

///|
/// INT_COPRIME_NEG
fn step_120() -> Unit raise {
  int_coprime_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, coprime((-a, b)) == coprime((a, b))) && (∀ a : Int, ∀ b : Int, coprime((a, -b)) == coprime((a, b)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_NEG",
)

///|
/// `INT_COPRIME_NEG`
pub fn int_coprime_neg() -> @kernel.Thm {
  int_coprime_neg_c.get()
}

///|
/// INT_COPRIME_LABS
fn step_121() -> Unit raise {
  let t191 = @meson.meson_tac(@list.List([int_coprime_lneg()]))
  let t192 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t191,
  )
  int_coprime_labs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((abs(a), b)) == coprime((a, b))"),
      t192,
    ),
  )
}

///|
let int_coprime_labs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LABS",
)

///|
/// `INT_COPRIME_LABS`
pub fn int_coprime_labs() -> @kernel.Thm {
  int_coprime_labs_c.get()
}

///|
/// INT_COPRIME_RABS
fn step_122() -> Unit raise {
  let t193 = @meson.meson_tac(@list.List([int_coprime_rneg()]))
  let t194 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
    t193,
  )
  int_coprime_rabs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, abs(b))) == coprime((a, b))"),
      t194,
    ),
  )
}

///|
let int_coprime_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RABS",
)

///|
/// `INT_COPRIME_RABS`
pub fn int_coprime_rabs() -> @kernel.Thm {
  int_coprime_rabs_c.get()
}

///|
/// INT_COPRIME_ABS
fn step_123() -> Unit raise {
  let t195 = @simp.rewrite_tac(
    @list.List([int_coprime_labs(), int_coprime_rabs()]),
  )
  int_coprime_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ b : Int, coprime((abs(a), b)) == coprime((a, b))) && (∀ a : Int, ∀ b : Int, coprime((a, abs(b))) == coprime((a, b)))"),
      t195,
    ),
  )
}

///|
let int_coprime_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_ABS",
)

///|
/// `INT_COPRIME_ABS`
pub fn int_coprime_abs() -> @kernel.Thm {
  int_coprime_abs_c.get()
}

///|
/// INT_CONG_MOD_0
fn step_124() -> Unit raise {
  int_cong_mod_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, op_eq_eq(x, y, mod(int_of_num(0))) == (x == y)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mod_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_MOD_0")

///|
/// `INT_CONG_MOD_0`
pub fn int_cong_mod_0() -> @kernel.Thm {
  int_cong_mod_0_c.get()
}

///|
/// INT_CONG_MOD_1
fn step_125() -> Unit raise {
  int_cong_mod_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, op_eq_eq(x, y, mod(int_of_num(1)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_MOD_1")

///|
/// `INT_CONG_MOD_1`
pub fn int_cong_mod_1() -> @kernel.Thm {
  int_cong_mod_1_c.get()
}

///|
/// INT_CONG
fn step_126() -> Unit raise {
  int_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) == divides(n, x - y)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG")

///|
/// `INT_CONG`
pub fn int_cong() -> @kernel.Thm {
  int_cong_c.get()
}

///|
/// INT_CONG_MOD_ABS
fn step_127() -> Unit raise {
  let t196 = @simp.rewrite_tac(
    @list.List([int_cong(), @int.int_divides_labs()]),
  )
  int_cong_mod_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, op_eq_eq(a, b, mod(abs(n))) == op_eq_eq(a, b, mod(n))"),
      t196,
    ),
  )
}

///|
let int_cong_mod_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MOD_ABS",
)

///|
/// `INT_CONG_MOD_ABS`
pub fn int_cong_mod_abs() -> @kernel.Thm {
  int_cong_mod_abs_c.get()
}

///|
/// INT_CONG_MUL_LCANCEL
fn step_128() -> Unit raise {
  int_cong_mul_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, coprime((a, n)) && op_eq_eq(a * x, a * y, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MUL_LCANCEL",
)

///|
/// `INT_CONG_MUL_LCANCEL`
pub fn int_cong_mul_lcancel() -> @kernel.Thm {
  int_cong_mul_lcancel_c.get()
}

///|
/// INT_CONG_MUL_RCANCEL
fn step_129() -> Unit raise {
  int_cong_mul_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, coprime((a, n)) && op_eq_eq(x * a, y * a, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MUL_RCANCEL",
)

///|
/// `INT_CONG_MUL_RCANCEL`
pub fn int_cong_mul_rcancel() -> @kernel.Thm {
  int_cong_mul_rcancel_c.get()
}

///|
/// INT_CONG_MULT_LCANCEL_ALL
fn step_130() -> Unit raise {
  int_cong_mult_lcancel_all_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(a * x, a * y, mod(a * n)) == (a == int_of_num(0) || op_eq_eq(x, y, mod(n)))"),
    ),
  )
}

///|
let int_cong_mult_lcancel_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MULT_LCANCEL_ALL",
)

///|
/// `INT_CONG_MULT_LCANCEL_ALL`
pub fn int_cong_mult_lcancel_all() -> @kernel.Thm {
  int_cong_mult_lcancel_all_c.get()
}

///|
/// INT_CONG_LMUL
fn step_131() -> Unit raise {
  int_cong_lmul_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ a : Int, ∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → op_eq_eq(a * x, a * y, mod(n))"),
    ),
  )
}

///|
let int_cong_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_LMUL")

///|
/// `INT_CONG_LMUL`
pub fn int_cong_lmul() -> @kernel.Thm {
  int_cong_lmul_c.get()
}

///|
/// INT_CONG_RMUL
fn step_132() -> Unit raise {
  int_cong_rmul_c.set(
    @int.integer_rule(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ a : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → op_eq_eq(x * a, y * a, mod(n))"),
    ),
  )
}

///|
let int_cong_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_RMUL")

///|
/// `INT_CONG_RMUL`
pub fn int_cong_rmul() -> @kernel.Thm {
  int_cong_rmul_c.get()
}

///|
/// INT_CONG_REFL
fn step_133() -> Unit raise {
  int_cong_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : Int, op_eq_eq(x, x, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_REFL")

///|
/// `INT_CONG_REFL`
pub fn int_cong_refl() -> @kernel.Thm {
  int_cong_refl_c.get()
}

///|
/// INT_EQ_IMP_CONG
fn step_134() -> Unit raise {
  int_eq_imp_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, a == b → op_eq_eq(a, b, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_eq_imp_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_IMP_CONG",
)

///|
/// `INT_EQ_IMP_CONG`
pub fn int_eq_imp_cong() -> @kernel.Thm {
  int_eq_imp_cong_c.get()
}

///|
/// INT_CONG_SYM
fn step_135() -> Unit raise {
  int_cong_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) == op_eq_eq(y, x, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_SYM")

///|
/// `INT_CONG_SYM`
pub fn int_cong_sym() -> @kernel.Thm {
  int_cong_sym_c.get()
}

///|
/// INT_CONG_TRANS
fn step_136() -> Unit raise {
  int_cong_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) && op_eq_eq(y, z, mod(n)) → op_eq_eq(x, z, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_TRANS")

///|
/// `INT_CONG_TRANS`
pub fn int_cong_trans() -> @kernel.Thm {
  int_cong_trans_c.get()
}

///|
/// INT_CONG_ADD
fn step_137() -> Unit raise {
  int_cong_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ x' : Int, ∀ y : Int, ∀ y' : Int, op_eq_eq(x, x', mod((n : Int))) && op_eq_eq(y, y', mod(n)) → op_eq_eq(x + y, x' + y', mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_ADD")

///|
/// `INT_CONG_ADD`
pub fn int_cong_add() -> @kernel.Thm {
  int_cong_add_c.get()
}

///|
/// INT_CONG_SUB
fn step_138() -> Unit raise {
  int_cong_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ x' : Int, ∀ y : Int, ∀ y' : Int, op_eq_eq(x, x', mod((n : Int))) && op_eq_eq(y, y', mod(n)) → op_eq_eq(x - y, x' - y', mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_SUB")

///|
/// `INT_CONG_SUB`
pub fn int_cong_sub() -> @kernel.Thm {
  int_cong_sub_c.get()
}

///|
/// INT_CONG_MUL
fn step_139() -> Unit raise {
  int_cong_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ x' : Int, ∀ y : Int, ∀ y' : Int, op_eq_eq(x, x', mod((n : Int))) && op_eq_eq(y, y', mod(n)) → op_eq_eq(x * y, x' * y', mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_MUL")

///|
/// `INT_CONG_MUL`
pub fn int_cong_mul() -> @kernel.Thm {
  int_cong_mul_c.get()
}

///|
/// INT_CONG_POW
fn step_140() -> Unit raise {
  let t197 = @simp.asm_simp_tac(
    @list.List([int_cong_mul(), @int.int_pow_v1(), int_cong_refl()]),
  )
  let t198 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t197,
  )
  int_cong_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ k : Num, ∀ x : Int, ∀ y : Int, op_eq_eq(x, y, mod(n)) → op_eq_eq(pow(x, k), pow(y, k), mod(n))"),
      t198,
    ),
  )
}

///|
let int_cong_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_POW")

///|
/// `INT_CONG_POW`
pub fn int_cong_pow() -> @kernel.Thm {
  int_cong_pow_c.get()
}

///|
/// INT_CONG_MUL_1
fn step_141() -> Unit raise {
  let t199 = @meson.meson_tac(@list.List([int_cong_mul(), @int.int_mul_lid()]))
  int_cong_mul_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ x : Int, ∀ y : Int, op_eq_eq(x, int_of_num(1), mod(n)) && op_eq_eq(y, int_of_num(1), mod(n)) → op_eq_eq(x * y, int_of_num(1), mod(n))"),
      t199,
    ),
  )
}

///|
let int_cong_mul_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_MUL_1")

///|
/// `INT_CONG_MUL_1`
pub fn int_cong_mul_1() -> @kernel.Thm {
  int_cong_mul_1_c.get()
}

///|
/// INT_CONG_POW_1
fn step_142() -> Unit raise {
  let t200 = @meson.meson_tac(@list.List([int_cong_pow(), @int.int_pow_one()]))
  int_cong_pow_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ k : Num, ∀ n : Int, op_eq_eq(a, int_of_num(1), mod(n)) → op_eq_eq(pow(a, k), int_of_num(1), mod(n))"),
      t200,
    ),
  )
}

///|
let int_cong_pow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_POW_1")

///|
/// `INT_CONG_POW_1`
pub fn int_cong_pow_1() -> @kernel.Thm {
  int_cong_pow_1_c.get()
}

///|
/// INT_CONG_MUL_LCANCEL_EQ
fn step_143() -> Unit raise {
  int_cong_mul_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, coprime((a, n)) → op_eq_eq(a * x, a * y, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mul_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MUL_LCANCEL_EQ",
)

///|
/// `INT_CONG_MUL_LCANCEL_EQ`
pub fn int_cong_mul_lcancel_eq() -> @kernel.Thm {
  int_cong_mul_lcancel_eq_c.get()
}

///|
/// INT_CONG_MUL_RCANCEL_EQ
fn step_144() -> Unit raise {
  int_cong_mul_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, coprime((a, n)) → op_eq_eq(x * a, y * a, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_mul_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_MUL_RCANCEL_EQ",
)

///|
/// `INT_CONG_MUL_RCANCEL_EQ`
pub fn int_cong_mul_rcancel_eq() -> @kernel.Thm {
  int_cong_mul_rcancel_eq_c.get()
}

///|
/// INT_CONG_ADD_LCANCEL_EQ
fn step_145() -> Unit raise {
  int_cong_add_lcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, op_eq_eq(a + x, a + y, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_lcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_LCANCEL_EQ",
)

///|
/// `INT_CONG_ADD_LCANCEL_EQ`
pub fn int_cong_add_lcancel_eq() -> @kernel.Thm {
  int_cong_add_lcancel_eq_c.get()
}

///|
/// INT_CONG_ADD_RCANCEL_EQ
fn step_146() -> Unit raise {
  int_cong_add_rcancel_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, op_eq_eq(x + a, y + a, mod(n)) == op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_rcancel_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_RCANCEL_EQ",
)

///|
/// `INT_CONG_ADD_RCANCEL_EQ`
pub fn int_cong_add_rcancel_eq() -> @kernel.Thm {
  int_cong_add_rcancel_eq_c.get()
}

///|
/// INT_CONG_ADD_RCANCEL
fn step_147() -> Unit raise {
  int_cong_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, op_eq_eq(x + a, y + a, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_RCANCEL",
)

///|
/// `INT_CONG_ADD_RCANCEL`
pub fn int_cong_add_rcancel() -> @kernel.Thm {
  int_cong_add_rcancel_c.get()
}

///|
/// INT_CONG_ADD_LCANCEL
fn step_148() -> Unit raise {
  int_cong_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, op_eq_eq(a + x, a + y, mod(n)) → op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_LCANCEL",
)

///|
/// `INT_CONG_ADD_LCANCEL`
pub fn int_cong_add_lcancel() -> @kernel.Thm {
  int_cong_add_lcancel_c.get()
}

///|
/// INT_CONG_ADD_LCANCEL_EQ_0
fn step_149() -> Unit raise {
  int_cong_add_lcancel_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : _, op_eq_eq(a + x, a, mod(n)) == op_eq_eq(x, int_of_num(0), mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_lcancel_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_LCANCEL_EQ_0",
)

///|
/// `INT_CONG_ADD_LCANCEL_EQ_0`
pub fn int_cong_add_lcancel_eq_0() -> @kernel.Thm {
  int_cong_add_lcancel_eq_0_c.get()
}

///|
/// INT_CONG_ADD_RCANCEL_EQ_0
fn step_150() -> Unit raise {
  int_cong_add_rcancel_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ x : Int, ∀ y : _, op_eq_eq(x + a, a, mod(n)) == op_eq_eq(x, int_of_num(0), mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_add_rcancel_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_ADD_RCANCEL_EQ_0",
)

///|
/// `INT_CONG_ADD_RCANCEL_EQ_0`
pub fn int_cong_add_rcancel_eq_0() -> @kernel.Thm {
  int_cong_add_rcancel_eq_0_c.get()
}

///|
/// INT_CONG_INT_DIVIDES_MODULUS
fn step_151() -> Unit raise {
  int_cong_int_divides_modulus_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ m : Int, ∀ n : Int, op_eq_eq(x, y, mod(m)) && divides(n, m) → op_eq_eq(x, y, mod(n))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_int_divides_modulus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_INT_DIVIDES_MODULUS",
)

///|
/// `INT_CONG_INT_DIVIDES_MODULUS`
pub fn int_cong_int_divides_modulus() -> @kernel.Thm {
  int_cong_int_divides_modulus_c.get()
}

///|
/// INT_CONG_0_DIVIDES
fn step_152() -> Unit raise {
  int_cong_0_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ x : Int, op_eq_eq(x, int_of_num(0), mod(n)) == divides(n, x)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_0_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_0_DIVIDES",
)

///|
/// `INT_CONG_0_DIVIDES`
pub fn int_cong_0_divides() -> @kernel.Thm {
  int_cong_0_divides_c.get()
}

///|
/// INT_CONG_1_DIVIDES
fn step_153() -> Unit raise {
  int_cong_1_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ x : Int, op_eq_eq(x, int_of_num(1), mod(n)) → divides(n, x - int_of_num(1))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_1_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_1_DIVIDES",
)

///|
/// `INT_CONG_1_DIVIDES`
pub fn int_cong_1_divides() -> @kernel.Thm {
  int_cong_1_divides_c.get()
}

///|
/// INT_CONG_DIVIDES
fn step_154() -> Unit raise {
  int_cong_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → divides(n, x) == divides(n, y)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_DIVIDES",
)

///|
/// `INT_CONG_DIVIDES`
pub fn int_cong_divides() -> @kernel.Thm {
  int_cong_divides_c.get()
}

///|
/// INT_CONG_COPRIME
fn step_155() -> Unit raise {
  int_cong_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → coprime((n, x)) == coprime((n, y))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_COPRIME",
)

///|
/// `INT_CONG_COPRIME`
pub fn int_cong_coprime() -> @kernel.Thm {
  int_cong_coprime_c.get()
}

///|
/// INT_COPRIME_RREM
fn step_156() -> Unit raise {
  let t201 = @meson.meson_tac(
    @list.List([int_cong_coprime(), @int.int_cong_rrem(), int_cong_refl()]),
  )
  int_coprime_rrem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, coprime((m, rem(n, m))) == coprime((m, n))"),
      t201,
    ),
  )
}

///|
let int_coprime_rrem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_RREM",
)

///|
/// `INT_COPRIME_RREM`
pub fn int_coprime_rrem() -> @kernel.Thm {
  int_coprime_rrem_c.get()
}

///|
/// INT_COPRIME_LREM
fn step_157() -> Unit raise {
  let t202 = @meson.meson_tac(
    @list.List([int_coprime_rrem(), int_coprime_sym()]),
  )
  int_coprime_lrem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : _, coprime((rem(a, (n : Int)), n)) == coprime((a, n))"),
      t202,
    ),
  )
}

///|
let int_coprime_lrem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_LREM",
)

///|
/// `INT_COPRIME_LREM`
pub fn int_coprime_lrem() -> @kernel.Thm {
  int_coprime_lrem_c.get()
}

///|
/// INT_CONG_GCD_RIGHT
fn step_158() -> Unit raise {
  let t203 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_gcd_unique(), int_gcd_pos()])),
    @int.integer_tac,
  )
  int_cong_gcd_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → gcd((n, x)) == gcd((n, y))"),
      t203,
    ),
  )
}

///|
let int_cong_gcd_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_GCD_RIGHT",
)

///|
/// `INT_CONG_GCD_RIGHT`
pub fn int_cong_gcd_right() -> @kernel.Thm {
  int_cong_gcd_right_c.get()
}

///|
/// INT_CONG_GCD_LEFT
fn step_159() -> Unit raise {
  let t204 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_gcd_unique(), int_gcd_pos()])),
    @int.integer_tac,
  )
  int_cong_gcd_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, mod(n)) → gcd((x, n)) == gcd((y, n))"),
      t204,
    ),
  )
}

///|
let int_cong_gcd_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_GCD_LEFT",
)

///|
/// `INT_CONG_GCD_LEFT`
pub fn int_cong_gcd_left() -> @kernel.Thm {
  int_cong_gcd_left_c.get()
}

///|
/// INT_CONG_TO_1
fn step_160() -> Unit raise {
  int_cong_to_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, op_eq_eq(a, int_of_num(1), mod(n)) == (∃ m : Int, a == int_of_num(1) + m * n)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_to_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_TO_1")

///|
/// `INT_CONG_TO_1`
pub fn int_cong_to_1() -> @kernel.Thm {
  int_cong_to_1_c.get()
}

///|
/// INT_CONG_SOLVE
fn step_161() -> Unit raise {
  int_cong_solve_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, coprime((a, n)) → (∃ x : Int, op_eq_eq(a * x, b, mod(n)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_solve_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_SOLVE")

///|
/// `INT_CONG_SOLVE`
pub fn int_cong_solve() -> @kernel.Thm {
  int_cong_solve_c.get()
}

///|
/// INT_CONG_SOLVE_EQ
fn step_162() -> Unit raise {
  int_cong_solve_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ a : Int, ∀ b : Int, (∃ x : Int, op_eq_eq(a * x, b, mod(n))) == divides(gcd((a, n)), b)"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_solve_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_SOLVE_EQ",
)

///|
/// `INT_CONG_SOLVE_EQ`
pub fn int_cong_solve_eq() -> @kernel.Thm {
  int_cong_solve_eq_c.get()
}

///|
/// INT_CONG_SOLVE_UNIQUE
fn step_163() -> Unit raise {
  int_cong_solve_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, coprime((a, n)) → (∀ x : Int, ∀ y : Int, op_eq_eq(a * x, b, mod(n)) && op_eq_eq(a * y, b, mod(n)) → op_eq_eq(x, y, mod(n)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_solve_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_SOLVE_UNIQUE",
)

///|
/// `INT_CONG_SOLVE_UNIQUE`
pub fn int_cong_solve_unique() -> @kernel.Thm {
  int_cong_solve_unique_c.get()
}

///|
/// INT_CONG_CHINESE
fn step_164() -> Unit raise {
  int_cong_chinese_c.set(
    @tactics.prove(
      @term_syntax.parse_term("coprime(((a : Int), (b : Int))) && op_eq_eq((x : Int), (y : Int), mod(a)) && op_eq_eq(x, y, mod(b)) → op_eq_eq(x, y, mod(a * b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_cong_chinese_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_CHINESE",
)

///|
/// `INT_CONG_CHINESE`
pub fn int_cong_chinese() -> @kernel.Thm {
  int_cong_chinese_c.get()
}

///|
/// INT_CHINESE_REMAINDER_COPRIME
fn step_165() -> Unit raise {
  int_chinese_remainder_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, ∀ n : Int, coprime((a, b)) && !(a == int_of_num(0)) && !(b == int_of_num(0)) && coprime((m, a)) && coprime((n, b)) → (∃ x : Int, coprime((x, a * b)) && op_eq_eq(x, m, mod(a)) && op_eq_eq(x, n, mod(b)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_chinese_remainder_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CHINESE_REMAINDER_COPRIME",
)

///|
/// `INT_CHINESE_REMAINDER_COPRIME`
pub fn int_chinese_remainder_coprime() -> @kernel.Thm {
  int_chinese_remainder_coprime_c.get()
}

///|
/// INT_CHINESE_REMAINDER_COPRIME_UNIQUE
fn step_166() -> Unit raise {
  int_chinese_remainder_coprime_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, ∀ n : Int, ∀ x : Int, ∀ y : Int, coprime((a, b)) && op_eq_eq(x, m, mod(a)) && op_eq_eq(x, n, mod(b)) && op_eq_eq(y, m, mod(a)) && op_eq_eq(y, n, mod(b)) → op_eq_eq(x, y, mod(a * b))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_chinese_remainder_coprime_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CHINESE_REMAINDER_COPRIME_UNIQUE",
)

///|
/// `INT_CHINESE_REMAINDER_COPRIME_UNIQUE`
pub fn int_chinese_remainder_coprime_unique() -> @kernel.Thm {
  int_chinese_remainder_coprime_unique_c.get()
}

///|
/// SOLVABLE_GCD
fn step_167() -> Unit raise {
  solvable_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, divides(gcd((a, n)), b) → (∃ x : Int, op_eq_eq(a * x, b, mod(n)))"),
      @int.integer_tac,
    ),
  )
}

///|
let solvable_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVABLE_GCD")

///|
/// `SOLVABLE_GCD`
pub fn solvable_gcd() -> @kernel.Thm {
  solvable_gcd_c.get()
}

///|
/// INT_LINEAR_CONG_POS
fn step_168() -> Unit raise {
  let t208 = @simp.rewrite_tac(@list.List([@int.int_divides_rabs()]))
  let t209 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @int.integer_rule(
          @term_syntax.parse_term("divides((n : Int), (y : Int)) → op_eq_eq((a : Int) * (x : Int), a * (x + y), mod(n))"),
        ),
      ),
      t208,
    ),
    @int.integer_tac,
  )
  let t207 = @tactics.match_mp_tac(@int.int_le_lmul())
  let t206 = @simp.rewrite_tac(@list.List([@int.int_abs_mul()]))
  let t210 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @int.int_arith(
              @term_syntax.parse_term("abs((x : Int)) * int_of_num(1) <= (y : Int) → int_of_num(0) <= x + y"),
            ),
          ),
          t206,
        ),
        t207,
      ),
      @int.asm_int_arith_tac,
    ),
    t209,
  ])
  let t205 = @tactics.exists_tac(@term_syntax.parse_term("(x : Int) + abs(x * (n : Int))"))
  let t211 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t205),
      @tactics.conj_tac,
    ),
    t210,
  )
  int_linear_cong_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ a : Int, ∀ x : Int, !(n == int_of_num(0)) → (∃ y : Int, int_of_num(0) <= y && op_eq_eq(a * x, a * y, mod(n)))"),
      t211,
    ),
  )
}

///|
let int_linear_cong_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LINEAR_CONG_POS",
)

///|
/// `INT_LINEAR_CONG_POS`
pub fn int_linear_cong_pos() -> @kernel.Thm {
  int_linear_cong_pos_c.get()
}

///|
/// INT_CONG_SOLVE_POS
fn step_169() -> Unit raise {
  let t214 = @list.List([
    @int.int_arith_tac,
    @meson.asm_meson_tac(
      @list.List([
        int_linear_cong_pos(),
        int_cong_solve(),
        int_cong_trans(),
        int_cong_sym(),
      ]),
    ),
  ])
  let t213 = @simp.asm_rewrite_tac(
    @list.List([int_coprime_0(), int_divides_one()]),
  )
  let t212 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t215 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t212),
      t213,
    ),
    t214,
  )
  int_cong_solve_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, coprime((a, n)) && !(n == int_of_num(0) && abs(a) == int_of_num(1)) → (∃ x : Int, int_of_num(0) <= x && op_eq_eq(a * x, b, mod(n)))"),
      t215,
    ),
  )
}

///|
let int_cong_solve_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_SOLVE_POS",
)

///|
/// `INT_CONG_SOLVE_POS`
pub fn int_cong_solve_pos() -> @kernel.Thm {
  int_cong_solve_pos_c.get()
}

///|
/// INT_CONG_IMP_EQ
fn step_170() -> Unit raise {
  let t238 = @tactics.match_mp_tac(@int.int_le_mul())
  let t237 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t236 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t235 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("(abs((n : Int)) * (q : Int) < abs(n) * int_of_num(1)) == !(int_of_num(0) <= abs(n) * (q - int_of_num(1)))"),
      ),
    ]),
  )
  let t234 = @simp.rewrite_tac(
    @list.List([@int.int_abs_mul(), @int.int_entire()]),
  )
  let t231 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("abs((n : Int) * (q : Int)) < n → abs(n * q) < abs(n) * int_of_num(1)"),
    ),
  )
  let t233 = @tactics.first_x_assum(fn(
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
    (fn(
      x228 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s229 = @tactics.mp_tac(x228)
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
        s229(x230)
      }
    })(t231(x232))
  })
  let t227 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : Int)"))(fn(
      x224 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s225 = @tactics.subst_all_tac(x224)
      fn(
        x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s225(x226)
      }
    }),
  )
  let t223 = @simp.once_rewrite_tac(
    @list.List([@int.int_congruent(), @equal.gsym(@int.int_sub_0())]),
  )
  let t222 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x216 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s217 = @tactics.assume_tac(x216)
        fn(
          x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s217(x218)
        }
      },
      fn(
        x219 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s220 = @tactics.mp_tac(x219)
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      },
    ),
  )
  let t239 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t222,
                      ),
                      t223,
                    ),
                    t227,
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
    @int.asm_int_arith_tac,
  )
  int_cong_imp_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, abs(x - y) < n && op_eq_eq(x, y, mod(n)) → x == y"),
      t239,
    ),
  )
}

///|
let int_cong_imp_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_IMP_EQ",
)

///|
/// `INT_CONG_IMP_EQ`
pub fn int_cong_imp_eq() -> @kernel.Thm {
  int_cong_imp_eq_c.get()
}

///|
/// INT_CONG_DIV
fn step_171() -> Unit raise {
  let t240 = @metis.metis_tac(
    @list.List([@int.int_cong_div2(), @int.int_div_mul(), @int.int_lt_le()]),
  )
  int_cong_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ a : Int, ∀ b : Int, !(m == int_of_num(0)) && op_eq_eq(a, m * b, mod(m * n)) → op_eq_eq(div(a, m), b, mod(n))"),
      t240,
    ),
  )
}

///|
let int_cong_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_DIV")

///|
/// `INT_CONG_DIV`
pub fn int_cong_div() -> @kernel.Thm {
  int_cong_div_c.get()
}

///|
/// INT_CONG_DIV_COPRIME
fn step_172() -> Unit raise {
  let t249 = @tactics.conv_tac(@int.integer_rule)
  let t248 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x245 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s246 = @tactics.mp_tac(x245)
      fn(
        x247 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s246(x247)
      }
    }),
  )
  let t244 = @tactics.match_mp_tac(int_cong_div())
  let t243 = @simp.asm_rewrite_tac(@list.List([]))
  let t242 = @simp.asm_simp_tac(@list.List([int_coprime_0(), int_cong_mod_1()]))
  let t241 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Int) == int_of_num(0)"))
  let t250 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t241),
              t242,
            ),
            @list.List([@int.integer_tac, @tactics.strip_tac]),
          ),
          t243,
        ),
        t244,
      ),
      t248,
    ),
    t249,
  )
  int_cong_div_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ a : Int, ∀ b : Int, coprime((m, n)) && divides(m, a) && op_eq_eq(a, m * b, mod(n)) → op_eq_eq(div(a, m), b, mod(n))"),
      t250,
    ),
  )
}

///|
let int_cong_div_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_DIV_COPRIME",
)

///|
/// `INT_CONG_DIV_COPRIME`
pub fn int_cong_div_coprime() -> @kernel.Thm {
  int_cong_div_coprime_c.get()
}

///|
/// INT_CRT_STRONG
fn step_173() -> Unit raise {
  int_crt_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a1 : Int, ∀ a2 : Int, ∀ n1 : Int, ∀ n2 : Int, op_eq_eq(a1, a2, mod(gcd((n1, n2)))) → (∃ x : Int, op_eq_eq(x, a1, mod(n1)) && op_eq_eq(x, a2, mod(n2)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_crt_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CRT_STRONG")

///|
/// `INT_CRT_STRONG`
pub fn int_crt_strong() -> @kernel.Thm {
  int_crt_strong_c.get()
}

///|
/// INT_CRT_STRONG_IFF
fn step_174() -> Unit raise {
  int_crt_strong_iff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a1 : Int, ∀ a2 : Int, ∀ n1 : Int, ∀ n2 : Int, (∃ x : Int, op_eq_eq(x, a1, mod(n1)) && op_eq_eq(x, a2, mod(n2))) == op_eq_eq(a1, a2, mod(gcd((n1, n2))))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_crt_strong_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CRT_STRONG_IFF",
)

///|
/// `INT_CRT_STRONG_IFF`
pub fn int_crt_strong_iff() -> @kernel.Thm {
  int_crt_strong_iff_c.get()
}

///|
/// EVEN_SQUARE_MOD4
fn step_175() -> Unit raise {
  even_square_mod4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("op_eq_eq(pow(int_of_num(2) * (n : Int), 2), int_of_num(0), mod(int_of_num(4)))"),
      @int.integer_tac,
    ),
  )
}

///|
let even_square_mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVEN_SQUARE_MOD4",
)

///|
/// `EVEN_SQUARE_MOD4`
pub fn even_square_mod4() -> @kernel.Thm {
  even_square_mod4_c.get()
}

///|
/// ODD_SQUARE_MOD4
fn step_176() -> Unit raise {
  odd_square_mod4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("op_eq_eq(pow(int_of_num(2) * (n : Int) + int_of_num(1), 2), int_of_num(1), mod(int_of_num(4)))"),
      @int.integer_tac,
    ),
  )
}

///|
let odd_square_mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ODD_SQUARE_MOD4",
)

///|
/// `ODD_SQUARE_MOD4`
pub fn odd_square_mod4() -> @kernel.Thm {
  odd_square_mod4_c.get()
}

///|
/// INT_DIVIDES_LE
fn step_177() -> Unit raise {
  let t264 = @tactics.match_mp_tac(@int.int_le_mul())
  let t263 = @simp.asm_rewrite_tac(@list.List([]))
  let t262 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Int) == int_of_num(0)"))
  let t261 = @simp.asm_rewrite_tac(@list.List([]))
  let t260 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Int) == int_of_num(0)"))
  let t259 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(@term_syntax.parse_term("((x : Int) <= x * (z : Int)) == (int_of_num(0) <= x * (z - int_of_num(1)))")),
    ]),
  )
  let t258 = @simp.rewrite_tac(
    @list.List([@int.int_abs_mul(), @int.int_entire()]),
  )
  let t257 = @tactics.disch_then(fn(
    x254 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s255 = @tactics.subst1_tac(x254)
    fn(
      x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s255(x256)
    }
  })
  let t251 = @term_syntax.parse_term("(z : Int)")
  let t252 = @term_syntax.parse_term("(y : Int)")
  let t253 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Int)"), t252, t251]),
  )
  let t265 = @tactics.then_tac(
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
                          @int.int_divides(),
                          @theorems.left_imp_exists_thm(),
                        ]),
                      ),
                      t253,
                    ),
                    t257,
                  ),
                  t258,
                ),
                t259,
              ),
              t260,
            ),
            t261,
          ),
          t262,
        ),
        t263,
      ),
      t264,
    ),
    @int.asm_int_arith_tac,
  )
  int_divides_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, divides(x, y) → abs(x) <= abs(y) || y == int_of_num(0)"),
      t265,
    ),
  )
}

///|
let int_divides_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVIDES_LE")

///|
/// `INT_DIVIDES_LE`
pub fn int_divides_le() -> @kernel.Thm {
  int_divides_le_c.get()
}

///|
/// INT_DIVIDES_POW_LE
fn step_178() -> Unit raise {
  let t275 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @arith.le_exists(),
        @theorems.left_imp_exists_thm(),
        @int.int_pow_add(),
      ]),
    ),
    @int.integer_tac,
  )
  let t274 = @meson.asm_meson_tac(
    @list.List([
      @int.int_pow_mono_lt(),
      @int.arith_rule(@term_syntax.parse_term("int_of_num(2) <= (x : Int) → int_of_num(1) < x")),
    ]),
  )
  let t273 = @simp.rewrite_tac(
    @list.List([@int.int_not_le(), @arith.not_le(), @int.int_abs_pow()]),
  )
  let t272 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t271 = @simp.asm_simp_tac(
    @list.List([
      @int.int_pow_eq_0(),
      @int.int_arith(@term_syntax.parse_term("int_of_num(2) <= abs((p : Int)) → !(p == int_of_num(0))")),
    ]),
  )
  let t269 = @drule.match_mp(int_divides_le())
  let t276 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(fn(
              x270 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x266 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s267 = @tactics.mp_tac(x266)
                fn(
                  x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s267(x268)
                }
              })(t269(x270))
            }),
            t271,
          ),
          t272,
        ),
        t273,
      ),
      t274,
    ),
    t275,
  ])
  let t277 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac),
    t276,
  )
  int_divides_pow_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ m : Num, ∀ n : Num, int_of_num(2) <= abs(p) → divides(pow(p, m), pow(p, n)) == (m <= n)"),
      t277,
    ),
  )
}

///|
let int_divides_pow_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW_LE",
)

///|
/// `INT_DIVIDES_POW_LE`
pub fn int_divides_pow_le() -> @kernel.Thm {
  int_divides_pow_le_c.get()
}

///|
/// int_prime
fn step_179() -> Unit raise {
  int_prime_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_prime : (Int) -> Bool)((p : Int)) == (abs(p) > int_of_num(1) && (∀ x : Int, divides(x, p) → abs(x) == int_of_num(1) || abs(x) == abs(p)))"),
    ),
  )
}

///|
let int_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_prime")

///|
/// `int_prime`
pub fn int_prime() -> @kernel.Thm {
  int_prime_c.get()
}

///|
/// INT_PRIME_NEG
fn step_180() -> Unit raise {
  let t278 = @simp.rewrite_tac(
    @list.List([int_prime(), int_divides_rneg(), @int.int_abs_neg()]),
  )
  int_prime_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, int_prime(-p) == int_prime(p)"),
      t278,
    ),
  )
}

///|
let int_prime_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_NEG")

///|
/// `INT_PRIME_NEG`
pub fn int_prime_neg() -> @kernel.Thm {
  int_prime_neg_c.get()
}

///|
/// INT_PRIME_ABS
fn step_181() -> Unit raise {
  let t279 = @simp.asm_rewrite_tac(@list.List([int_prime_neg()]))
  let t280 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@int.int_abs_v1()])),
      ),
      @class.cond_cases_tac,
    ),
    t279,
  )
  int_prime_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, int_prime(abs(p)) == int_prime(p)"),
      t280,
    ),
  )
}

///|
let int_prime_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_ABS")

///|
/// `INT_PRIME_ABS`
pub fn int_prime_abs() -> @kernel.Thm {
  int_prime_abs_c.get()
}

///|
/// INT_PRIME_GE_2
fn step_182() -> Unit raise {
  let t281 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_prime()])),
    @int.int_arith_tac,
  )
  int_prime_ge_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Int, int_prime(p) → int_of_num(2) <= abs(p)"), t281),
  )
}

///|
let int_prime_ge_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_GE_2")

///|
/// `INT_PRIME_GE_2`
pub fn int_prime_ge_2() -> @kernel.Thm {
  int_prime_ge_2_c.get()
}

///|
/// INT_PRIME_0
fn step_183() -> Unit raise {
  let t282 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_prime()])),
    @int.int_arith_tac,
  )
  int_prime_0_c.set(
    @tactics.prove(@term_syntax.parse_term("!int_prime(int_of_num(0))"), t282),
  )
}

///|
let int_prime_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_0")

///|
/// `INT_PRIME_0`
pub fn int_prime_0() -> @kernel.Thm {
  int_prime_0_c.get()
}

///|
/// INT_PRIME_1
fn step_184() -> Unit raise {
  let t283 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_prime()])),
    @int.int_arith_tac,
  )
  int_prime_1_c.set(
    @tactics.prove(@term_syntax.parse_term("!int_prime(int_of_num(1))"), t283),
  )
}

///|
let int_prime_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_1")

///|
/// `INT_PRIME_1`
pub fn int_prime_1() -> @kernel.Thm {
  int_prime_1_c.get()
}

///|
/// INT_PRIME_2
fn step_185() -> Unit raise {
  let t292 = @drule.match_mp(int_divides_le())
  let t294 = @tactics.disch_then(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x289 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s290 = @tactics.mp_tac(x289)
      fn(
        x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s290(x291)
      }
    })(t292(x293))
  })
  let t288 = @tactics.conv_tac(@int.int_reduce_conv)
  let t287 = @simp.asm_rewrite_tac(@list.List([int_divides_zero()]))
  let t286 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Int) == int_of_num(0)"))
  let t285 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Int)"))
  let t284 = @tactics.conv_tac(@int.int_reduce_conv)
  let t295 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([int_prime()])),
                t284,
              ),
              t285,
            ),
            t286,
          ),
          t287,
        ),
        t288,
      ),
      t294,
    ),
    @int.asm_int_arith_tac,
  )
  int_prime_2_c.set(@tactics.prove(@term_syntax.parse_term("int_prime(int_of_num(2))"), t295))
}

///|
let int_prime_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME_2")

///|
/// `INT_PRIME_2`
pub fn int_prime_2() -> @kernel.Thm {
  int_prime_2_c.get()
}

///|
/// INT_PRIME_FACTOR
fn step_186() -> Unit raise {
  let t337 = @tactics.undisch_tac(@term_syntax.parse_term("divides((y : Int), (x : Int))"))
  let t336 = @simp.simp_tac(@list.List([]))
  let t338 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@theorems.mono_exists()),
          @tactics.gen_tac,
        ),
        t336,
      ),
      t337,
    ),
    @int.integer_tac,
  )
  let t334 = @drule.match_mp(int_divides_le())
  let t339 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
        x335 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x331 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s332 = @tactics.mp_tac(x331)
          fn(
            x333 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s332(x333)
          }
        })(t334(x335))
      }),
      @int.asm_int_arith_tac,
    ),
    t338,
  ])
  let t330 = @simp.asm_rewrite_tac(@list.List([]))
  let t326 = @term_syntax.parse_term("(y : Int)")
  let t329 = @tactics.first_x_assum(fn(
    x328 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x323 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s324 = @tactics.mp_tac(x323)
      fn(
        x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s324(x325)
      }
    })(((x327 : @kernel.Thm) => @bool.spec(t326, x327))(x328))
  })
  let t322 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(y : Int)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t321 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @class.not_imp(),
      @class.de_morgan_thm(),
    ]),
  )
  let t320 = @simp.asm_simp_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("!((x : Int) == int_of_num(0)) && !(abs(x) == int_of_num(1)) → abs(x) > int_of_num(1)"),
      ),
    ]),
  )
  let t317 = @simp.gen_rewrite_rule(
    fn(
      x314 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s315 = @equal.rand_conv(x314)
      fn(x316 : @kernel.Term) -> @kernel.Thm raise { s315(x316) }
    },
    @list.List([int_prime()]),
  )
  let t319 = @tactics.first_x_assum(fn(
    x318 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s312 = @tactics.mp_tac(x311)
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
    })(t317(x318))
  })
  let t309 = @simp.asm_rewrite_tac(@list.List([int_prime_2(), int_divides_0()]))
  let t310 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("int_of_num(2)")), t309),
    @tactics.all_tac,
  ])
  let t308 = @simp.asm_rewrite_tac(@list.List([]))
  let t307 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Int) == int_of_num(0)"))
  let t305 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x302 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s303 = @tactics.mp_tac(x302)
      fn(
        x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s303(x304)
      }
    }),
  )
  let t301 = @simp.asm_rewrite_tac(@list.List([]))
  let t306 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("(x : Int)")),
          t301,
        ),
        t305,
      ),
      @int.integer_tac,
    ),
    @tactics.all_tac,
  ])
  let t300 = @class.asm_cases_tac(@term_syntax.parse_term("int_prime((x : Int))"))
  let t299 = @tactics.repeat_tac(@tactics.strip_tac)
  let t298 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Int)"))
  let t297 = @simp.rewrite_tac(@list.List([@int.int_abs_pos()]))
  let t296 = @tactics.exists_tac(@term_syntax.parse_term("abs"))
  let t340 = @tactics.thenl(
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
                                  @tactics.then_tac(
                                    @tactics.match_mp_tac(@int.wf_int_measure()),
                                    t296,
                                  ),
                                  t297,
                                ),
                                t298,
                              ),
                              t299,
                            ),
                            t300,
                          ),
                          t306,
                        ),
                        t307,
                      ),
                      t308,
                    ),
                    t310,
                  ),
                  t319,
                ),
                t320,
              ),
              t321,
            ),
            t322,
          ),
          t329,
        ),
        t330,
      ),
      @tactics.ants_tac,
    ),
    t339,
  )
  int_prime_factor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, !(abs(x) == int_of_num(1)) → (∃ p : Int, int_prime(p) && divides(p, x))"),
      t340,
    ),
  )
}

///|
let int_prime_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_FACTOR",
)

///|
/// `INT_PRIME_FACTOR`
pub fn int_prime_factor() -> @kernel.Thm {
  int_prime_factor_c.get()
}

///|
/// INT_PRIME_FACTOR_LT
fn step_187() -> Unit raise {
  let t352 = @drule.match_mp(int_prime_ge_2())
  let t354 = @tactics.first_assum(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(t352(x353))
  })
  let t348 = @tactics.disch_then(fn(
    x347 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t346 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_rzero()]))
  let t345 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Int) == int_of_num(0)"))
  let t344 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Int) == int_of_num(0))"))
  let t343 = @tactics.match_mp_tac(@int.int_lt_mul())
  let t342 = @tactics.match_mp_tac(
    @int.int_arith(@term_syntax.parse_term("int_of_num(0) < (m : Int) * ((p : Int) - int_of_num(1)) → m < p * m")),
  )
  let t341 = @simp.asm_rewrite_tac(@list.List([@int.int_abs_mul()]))
  let t355 = @tactics.then_tac(
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
              t346,
            ),
            t348,
          ),
          @tactics.conj_tac,
        ),
        @list.List([@int.asm_int_arith_tac, @tactics.all_tac]),
      ),
      t354,
    ),
    @int.int_arith_tac,
  )
  int_prime_factor_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ m : Int, ∀ p : Int, int_prime(p) && !(n == int_of_num(0)) && n == p * m → abs(m) < abs(n)"),
      t355,
    ),
  )
}

///|
let int_prime_factor_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_FACTOR_LT",
)

///|
/// `INT_PRIME_FACTOR_LT`
pub fn int_prime_factor_lt() -> @kernel.Thm {
  int_prime_factor_lt_c.get()
}

///|
/// INT_PRIME_FACTOR_INDUCT
fn step_188() -> Unit raise {
  let t388 = @meson.asm_meson_tac(
    @list.List([int_prime_factor_lt(), @int.int_entire()]),
  )
  let t387 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t386 = @simp.asm_rewrite_tac(@list.List([]))
  let t385 = @tactics.disch_then(@tactics.match_mp_tac)
  let t384 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@int.int_entire(), @class.de_morgan_thm()])),
  )
  let t379 = @term_syntax.parse_term("(d : Int)")
  let t380 = @list.List([@term_syntax.parse_term("(p : Int)"), t379])
  let t383 = @tactics.first_x_assum(fn(
    x382 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(((x381 : @kernel.Thm) => @bool.specl(t380, x381))(x382))
  })
  let t372 = @simp.gen_rewrite_rule(
    fn(
      x371 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x371
    },
    @list.List([@int.int_divides()]),
  )
  let t373 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Int)"))(fn(
    x368 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s369 = @tactics.subst_all_tac(x368)
    fn(
      x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s369(x370)
    }
  })
  let t375 = @tactics.first_x_assum(fn(
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
    t373(t372(x374))
  })
  let t364 = @drule.match_mp(int_prime_factor())
  let t365 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Int)"))(
    @tactics.strip_assume_tac,
  )
  let t367 = @tactics.first_assum(fn(
    x366 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t365(t364(x366))
  })
  let t363 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @int.int_arith(
          @term_syntax.parse_term("(abs((x : Int)) == int_of_num((a : Num))) == (x == int_of_num(a) || x == -int_of_num(a))"),
        ),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t362 = @class.asm_cases_tac(@term_syntax.parse_term("abs((n : Int)) == int_of_num(1)"))
  let t361 = @simp.asm_rewrite_tac(@list.List([]))
  let t360 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t359 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Int)"))
  let t358 = @simp.rewrite_tac(@list.List([@int.int_abs_pos()]))
  let t357 = @tactics.exists_tac(@term_syntax.parse_term("abs"))
  let t356 = @tactics.match_mp_tac(@int.wf_int_measure())
  let t389 = @tactics.then_tac(
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
                                      @tactics.gen_tac, @tactics.strip_tac,
                                    ),
                                    t356,
                                  ),
                                  t357,
                                ),
                                t358,
                              ),
                              t359,
                            ),
                            @tactics.disch_tac,
                          ),
                          t360,
                        ),
                        t361,
                      ),
                      t362,
                    ),
                    t363,
                  ),
                  t367,
                ),
                t375,
              ),
              t383,
            ),
            t384,
          ),
          t385,
        ),
        t386,
      ),
      t387,
    ),
    t388,
  )
  int_prime_factor_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, P(int_of_num(0)) && P(int_of_num(1)) && P(-int_of_num(1)) && (∀ p : Int, ∀ n : Int, int_prime(p) && !(n == int_of_num(0)) && P(n) → P(p * n)) → (∀ n : Int, P(n))"),
      t389,
    ),
  )
}

///|
let int_prime_factor_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_FACTOR_INDUCT",
)

///|
/// `INT_PRIME_FACTOR_INDUCT`
pub fn int_prime_factor_induct() -> @kernel.Thm {
  int_prime_factor_induct_c.get()
}

///|
/// INT_DIVIDES_FACT
fn step_189() -> Unit raise {
  let t397 = @meson.asm_meson_tac(
    @list.List([@int.int_divides_labs(), int_divides_refl()]),
  )
  let t396 = @tactics.match_mp_tac(int_divides_rmul())
  let t395 = @simp.asm_simp_tac(@list.List([int_divides_lmul()]))
  let t394 = @tactics.repeat_tac(@tactics.strip_tac)
  let t393 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_suc(), @equal.gsym(@int.int_of_num_mul())]),
  )
  let t391 = @int.int_arith(@term_syntax.parse_term("((x : Int) < int_of_num((m : Num)) + int_of_num(1)) == (x <= int_of_num(m))"))
  let t392 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_suc()), t391]),
  )
  let t390 = @simp.rewrite_tac(
    @list.List([
      @arith.fact(),
      @int.int_arith(@term_syntax.parse_term("((x : Int) <= int_of_num((n : Num))) == (x == int_of_num(n) || x < int_of_num(n))")),
    ]),
  )
  let t398 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @nums.induct_tac,
                  @list.List([@int.int_arith_tac, @tactics.all_tac]),
                ),
                t390,
              ),
              t392,
            ),
            t393,
          ),
          t394,
        ),
        t395,
      ),
      t396,
    ),
    t397,
  )
  int_divides_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Int, int_of_num(1) <= abs(x) && abs(x) <= int_of_num(n) → divides(x, int_of_num(FACT(n)))"),
      t398,
    ),
  )
}

///|
let int_divides_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_FACT",
)

///|
/// `INT_DIVIDES_FACT`
pub fn int_divides_fact() -> @kernel.Thm {
  int_divides_fact_c.get()
}

///|
/// INT_EUCLID_BOUND
fn step_190() -> Unit raise {
  let t423 = @meson.asm_meson_tac(@list.List([int_prime_neg(), int_prime_1()]))
  let t424 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_divides_one()])),
    t423,
  )
  let t425 = @list.List([
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.pop_assum(fn(
          x420 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s421 = @tactics.mp_tac(x420)
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
            s421(x422)
          }
        }),
      ),
      @int.integer_tac,
    ),
    t424,
  ])
  let t419 = @tactics.subgoal_then(@term_syntax.parse_term("divides((p : Int), int_of_num(1))"), fn(
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
  })
  let t415 = @simp.asm_simp_tac(
    @list.List([
      int_prime_ge_2(),
      @int.int_arith(@term_syntax.parse_term("int_of_num(2) <= (p : Int) → int_of_num(1) <= p")),
    ]),
  )
  let t413 = @term_syntax.parse_term("(p : Int)")
  let t414 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t413]),
      int_divides_fact(),
    ),
  )
  let t412 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_not_le())]))
  let t409 = @equal.gsym(@int.int_of_num_suc())
  let t410 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_add()), t409]),
  )
  let t407 = @drule.match_mp(int_divides_le())
  let t411 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x408 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x404 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s405 = @tactics.mp_tac(x404)
            fn(
              x406 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s405(x406)
            }
          })(t407(x408))
        }),
        t410,
      ),
      @int.int_arith_tac,
    ),
  ])
  let t403 = @simp.asm_rewrite_tac(@list.List([int_prime_abs()]))
  let t402 = @tactics.exists_tac(@term_syntax.parse_term("abs((p : Int))"))
  let t401 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Int)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t400 = @simp.rewrite_tac(
    @list.List([
      @arith.eq_add_rcancel_0(),
      @arith.fact_nz(),
      @equal.gsym(@int.int_of_num_add()),
    ]),
  )
  let t399 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_add(), @int.int_abs_num(), @int.int_of_num_eq()]),
  )
  let t426 = @tactics.thenl(
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
                                @tactics.gen_tac,
                                @tactics.mp_tac(
                                  @bool.spec(
                                    @term_syntax.parse_term("int_of_num(FACT((n : Num))) + int_of_num(1)"),
                                    int_prime_factor(),
                                  ),
                                ),
                              ),
                              t399,
                            ),
                            t400,
                          ),
                          t401,
                        ),
                        t402,
                      ),
                      t403,
                    ),
                    @tactics.conj_tac,
                  ),
                  t411,
                ),
                t412,
              ),
              @tactics.disch_tac,
            ),
            t414,
          ),
          t415,
        ),
        @tactics.disch_tac,
      ),
      t419,
    ),
    t425,
  )
  int_euclid_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∃ p : Int, int_prime(p) && int_of_num(n) < p && p <= int_of_num(FACT(n)) + int_of_num(1)"),
      t426,
    ),
  )
}

///|
let int_euclid_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EUCLID_BOUND",
)

///|
/// `INT_EUCLID_BOUND`
pub fn int_euclid_bound() -> @kernel.Thm {
  int_euclid_bound_c.get()
}

///|
/// INT_EUCLID
fn step_191() -> Unit raise {
  let t442 = @tactics.first_x_assum(
    @tactics.disj_cases_then(fn(
      x439 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s440 = @tactics.subst1_tac(x439)
      fn(
        x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s440(x441)
      }
    }),
  )
  let t438 = @simp.simp_tac(@list.List([]))
  let t437 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t436 = @tactics.disch_then(fn(
    x434 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x434
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t433 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t432 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t431 = @tactics.mp_tac(int_euclid_bound())
  let t430 = @simp.asm_rewrite_tac(
    @list.List([@theorems.or_exists_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t429 = @simp.rewrite_tac(@list.List([@int.int_gt_v1()]))
  let t428 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Int)"))
  let t427 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t443 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.mp_tac(@int.int_image()),
                          t427,
                        ),
                        t428,
                      ),
                      t429,
                    ),
                    t430,
                  ),
                  t431,
                ),
                t432,
              ),
              t433,
            ),
            t436,
          ),
          t437,
        ),
        t438,
      ),
      t442,
    ),
    @int.int_arith_tac,
  )
  int_euclid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Int, ∃ p : Int, int_prime(p) && p > n"), t443),
  )
}

///|
let int_euclid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EUCLID")

///|
/// `INT_EUCLID`
pub fn int_euclid() -> @kernel.Thm {
  int_euclid_c.get()
}

///|
/// INT_PRIMES_INFINITE
fn step_192() -> Unit raise {
  let t455 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_eq(), @sets.in_elim_thm()]),
  )
  let t454 = @term_syntax.parse_term("{(p : Int) | int_prime(p)}")
  let t456 = @tactics.then_tac(
    @tactics.mp_tac(
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("int_of_num"), t454]),
        @sets.finite_image_inj(),
      ),
    ),
    t455,
  )
  let t453 = @simp.simp_tac(@list.List([]))
  let t452 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t451 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t450 = @tactics.mp_tac(int_euclid_bound())
  let t449 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_lt()), @int.int_exists_pos()]),
  )
  let t448 = @simp.rewrite_tac(
    @list.List([
      @class.not_exists_thm(),
      @class.not_forall_thm(),
      @class.not_imp(),
      @arith.not_le(),
    ]),
  )
  let t457 = @list.List([
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
                        @list.List([@sets.num_finite(), @sets.in_elim_thm()]),
                      ),
                      t448,
                    ),
                    t449,
                  ),
                  t450,
                ),
                t451,
              ),
              @tactics.gen_tac,
            ),
            t452,
          ),
          @tactics.gen_tac,
        ),
        t453,
      ),
      @int.int_arith_tac,
    ),
    t456,
  ])
  let t447 = @simp.rewrite_tac(
    @list.List([@sets.infinite(), @class.contrapos_thm()]),
  )
  let t458 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.subgoal_then(
        @term_syntax.parse_term("INFINITE({(n : Num) | int_prime(int_of_num(n))})"),
        fn(
          x444 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s445 = @tactics.mp_tac(x444)
          fn(
            x446 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s445(x446)
          }
        },
      ),
      t447,
    ),
    t457,
  )
  int_primes_infinite_c.set(
    @tactics.prove(@term_syntax.parse_term("INFINITE({(p : Int) | int_prime(p)})"), t458),
  )
}

///|
let int_primes_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIMES_INFINITE",
)

///|
/// `INT_PRIMES_INFINITE`
pub fn int_primes_infinite() -> @kernel.Thm {
  int_primes_infinite_c.get()
}

///|
/// INT_COPRIME_PRIME
fn step_193() -> Unit raise {
  let t459 = @meson.meson_tac(
    @list.List([int_divides_one(), int_prime_neg(), int_prime_1()]),
  )
  let t460 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_coprime()])),
    t459,
  )
  int_coprime_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ a : Int, ∀ b : Int, coprime((a, b)) → !(int_prime(p) && divides(p, a) && divides(p, b))"),
      t460,
    ),
  )
}

///|
let int_coprime_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_PRIME",
)

///|
/// `INT_COPRIME_PRIME`
pub fn int_coprime_prime() -> @kernel.Thm {
  int_coprime_prime_c.get()
}

///|
/// INT_COPRIME_PRIME_EQ
fn step_194() -> Unit raise {
  let t473 = @meson.asm_meson_tac(@list.List([int_divides_trans()]))
  let t472 = @tactics.exists_tac(@term_syntax.parse_term("(p : Int)"))
  let t469 = @drule.match_mp(int_prime_factor())
  let t467 = @term_syntax.parse_term("(p : Int)")
  let t471 = @tactics.first_assum(fn(
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
    ((x468 : @kernel.Thm) => @tactics.x_choose_tac(t467, x468))(t469(x470))
  })
  let t466 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Int)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t465 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t464 = @simp.once_rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t463 = @simp.rewrite_tac(
    @list.List([int_coprime(), int_divides_one_abs()]),
  )
  let t462 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t461 = @list.List([
    @meson.meson_tac(@list.List([int_coprime_prime()])),
    @tactics.all_tac,
  ])
  let t474 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    t461,
                  ),
                  t462,
                ),
                t463,
              ),
              t464,
            ),
            t465,
          ),
          t466,
        ),
        t471,
      ),
      t472,
    ),
    t473,
  )
  int_coprime_prime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == (∀ p : Int, !(int_prime(p) && divides(p, a) && divides(p, b)))"),
      t474,
    ),
  )
}

///|
let int_coprime_prime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_PRIME_EQ",
)

///|
/// `INT_COPRIME_PRIME_EQ`
pub fn int_coprime_prime_eq() -> @kernel.Thm {
  int_coprime_prime_eq_c.get()
}

///|
/// INT_PRIME_COPRIME
fn step_195() -> Unit raise {
  let t495 = @meson.asm_meson_tac(
    @list.List([
      int_divides_trans(),
      @int.int_divides_labs(),
      @int.int_divides_rabs(),
    ]),
  )
  let t494 = @simp.asm_rewrite_tac(@list.List([]))
  let t489 = @term_syntax.parse_term("(d : Int)")
  let t493 = @tactics.disch_then(fn(
    x492 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x491 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
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
      })(((x490 : @kernel.Thm) => @bool.spec(t489, x490))(x491))
    })(@bool.conjunct2(x492))
  })
  let t483 = @simp.gen_rewrite_rule(
    fn(
      x482 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x482
    },
    @list.List([int_prime()]),
  )
  let t485 = @tactics.first_x_assum(fn(
    x484 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x479 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s480 = @tactics.mp_tac(x479)
      fn(
        x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s480(x481)
      }
    })(t483(x484))
  })
  let t478 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Int)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t477 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @class.not_imp(),
      int_divides_one_abs(),
    ]),
  )
  let t476 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(!(b : Bool) → (a : Bool)) → a || b")),
  )
  let t475 = @simp.rewrite_tac(@list.List([int_coprime()]))
  let t496 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t475),
                t476,
              ),
              t477,
            ),
            t478,
          ),
          t485,
        ),
        t493,
      ),
      t494,
    ),
    t495,
  )
  int_prime_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ p : Int, int_prime(p) → divides(p, x) || coprime((p, x))"),
      t496,
    ),
  )
}

///|
let int_prime_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_COPRIME",
)

///|
/// `INT_PRIME_COPRIME`
pub fn int_prime_coprime() -> @kernel.Thm {
  int_prime_coprime_c.get()
}

///|
/// INT_PRIME_COPRIME_EQ
fn step_196() -> Unit raise {
  let t499 = @meson.asm_meson_tac(
    @list.List([int_divides_refl(), int_prime_1(), int_prime_abs()]),
  )
  let t498 = @simp.asm_simp_tac(
    @list.List([int_prime_coprime(), int_coprime(), int_divides_one_abs()]),
  )
  let t497 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((b : Bool) || (a : Bool)) && !(a && b) → a == !b")),
  )
  let t500 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t497),
      t498,
    ),
    t499,
  )
  int_prime_coprime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ n : Int, int_prime(p) → coprime((p, n)) == !divides(p, n)"),
      t500,
    ),
  )
}

///|
let int_prime_coprime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_COPRIME_EQ",
)

///|
/// `INT_PRIME_COPRIME_EQ`
pub fn int_prime_coprime_eq() -> @kernel.Thm {
  int_prime_coprime_eq_c.get()
}

///|
/// INT_COPRIME_PRIMEPOW
fn step_197() -> Unit raise {
  let t502 = @simp.simp_tac(@list.List([int_prime_coprime_eq()]))
  let t501 = @simp.once_rewrite_tac(@list.List([int_coprime_sym()]))
  let t503 = @tactics.then_tac(
    @tactics.then_tac(@simp.simp_tac(@list.List([int_coprime_rpow()])), t501),
    t502,
  )
  int_coprime_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ k : Num, ∀ m : Int, int_prime(p) && !(k == 0) → coprime((m, pow(p, k))) == !divides(p, m)"),
      t503,
    ),
  )
}

///|
let int_coprime_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_PRIMEPOW",
)

///|
/// `INT_COPRIME_PRIMEPOW`
pub fn int_coprime_primepow() -> @kernel.Thm {
  int_coprime_primepow_c.get()
}

///|
/// INT_COPRIME_BEZOUT
fn step_198() -> Unit raise {
  int_coprime_bezout_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) == (∃ x : Int, ∃ y : Int, a * x + b * y == int_of_num(1))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_bezout_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_BEZOUT",
)

///|
/// `INT_COPRIME_BEZOUT`
pub fn int_coprime_bezout() -> @kernel.Thm {
  int_coprime_bezout_c.get()
}

///|
/// INT_COPRIME_BEZOUT_ALT
fn step_199() -> Unit raise {
  int_coprime_bezout_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, coprime((a, b)) → (∃ x : Int, ∃ y : Int, a * x == b * y + int_of_num(1))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_bezout_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_BEZOUT_ALT",
)

///|
/// `INT_COPRIME_BEZOUT_ALT`
pub fn int_coprime_bezout_alt() -> @kernel.Thm {
  int_coprime_bezout_alt_c.get()
}

///|
/// INT_BEZOUT_PRIME
fn step_200() -> Unit raise {
  let t504 = @meson.meson_tac(
    @list.List([
      int_coprime_bezout_alt(),
      int_coprime_sym(),
      int_prime_coprime_eq(),
    ]),
  )
  int_bezout_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ p : Int, int_prime(p) && !divides(p, a) → (∃ x : Int, ∃ y : Int, a * x == p * y + int_of_num(1))"),
      t504,
    ),
  )
}

///|
let int_bezout_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_BEZOUT_PRIME",
)

///|
/// `INT_BEZOUT_PRIME`
pub fn int_bezout_prime() -> @kernel.Thm {
  int_bezout_prime_c.get()
}

///|
/// INT_PRIME_DIVPROD
fn step_201() -> Unit raise {
  let t505 = @simp.simp_tac(@list.List([@equal.gsym(int_prime_coprime_eq())]))
  let t506 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @class.taut(
            @term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool) || (d : Bool)) == (a → !c && !d → !b)"),
          ),
        ]),
      ),
      t505,
    ),
    @int.integer_tac,
  )
  int_prime_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ a : Int, ∀ b : Int, int_prime(p) && divides(p, a * b) → divides(p, a) || divides(p, b)"),
      t506,
    ),
  )
}

///|
let int_prime_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_DIVPROD",
)

///|
/// `INT_PRIME_DIVPROD`
pub fn int_prime_divprod() -> @kernel.Thm {
  int_prime_divprod_c.get()
}

///|
/// INT_PRIME_DIVPROD_EQ
fn step_202() -> Unit raise {
  let t507 = @meson.meson_tac(
    @list.List([int_prime_divprod(), int_divides_lmul(), int_divides_rmul()]),
  )
  int_prime_divprod_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ a : Int, ∀ b : Int, int_prime(p) → divides(p, a * b) == (divides(p, a) || divides(p, b))"),
      t507,
    ),
  )
}

///|
let int_prime_divprod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_DIVPROD_EQ",
)

///|
/// `INT_PRIME_DIVPROD_EQ`
pub fn int_prime_divprod_eq() -> @kernel.Thm {
  int_prime_divprod_eq_c.get()
}

///|
/// INT_PRIME_DIVPOW
fn step_203() -> Unit raise {
  let t516 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(int_prime_coprime_eq()), int_coprime_pow()]),
  )
  let t515 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t514 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x508 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s509 = @tactics.assume_tac(x508)
        fn(
          x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s509(x510)
        }
      },
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
        let s512 = @tactics.mp_tac(x511)
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
    ),
  )
  let t517 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t514),
      t515,
    ),
    t516,
  )
  int_prime_divpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Int, ∀ x : Int, int_prime(p) && divides(p, pow(x, n)) → divides(p, x)"),
      t517,
    ),
  )
}

///|
let int_prime_divpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_DIVPOW",
)

///|
/// `INT_PRIME_DIVPOW`
pub fn int_prime_divpow() -> @kernel.Thm {
  int_prime_divpow_c.get()
}

///|
/// INT_PRIME_DIVPOW_N
fn step_204() -> Unit raise {
  let t518 = @meson.meson_tac(
    @list.List([int_prime_divpow(), int_divides_pow()]),
  )
  int_prime_divpow_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Int, ∀ x : Int, int_prime(p) && divides(p, pow(x, n)) → divides(pow(p, n), pow(x, n))"),
      t518,
    ),
  )
}

///|
let int_prime_divpow_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_DIVPOW_N",
)

///|
/// `INT_PRIME_DIVPOW_N`
pub fn int_prime_divpow_n() -> @kernel.Thm {
  int_prime_divpow_n_c.get()
}

///|
/// INT_COPRIME_SOS
fn step_205() -> Unit raise {
  int_coprime_sos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, coprime((x, y)) → coprime((x * y, pow(x, 2) + pow(y, 2)))"),
      @int.integer_tac,
    ),
  )
}

///|
let int_coprime_sos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_SOS",
)

///|
/// `INT_COPRIME_SOS`
pub fn int_coprime_sos() -> @kernel.Thm {
  int_coprime_sos_c.get()
}

///|
/// INT_PRIME_IMP_NZ
fn step_206() -> Unit raise {
  let t522 = @drule.match_mp(int_prime_ge_2())
  let t524 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.disch_then(fn(
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
          let s520 = @tactics.mp_tac(x519)
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
        })(t522(x523))
      }),
    ),
    @int.int_arith_tac,
  )
  int_prime_imp_nz_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Int, int_prime(p) → !(p == int_of_num(0))"), t524),
  )
}

///|
let int_prime_imp_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_IMP_NZ",
)

///|
/// `INT_PRIME_IMP_NZ`
pub fn int_prime_imp_nz() -> @kernel.Thm {
  int_prime_imp_nz_c.get()
}

///|
/// INT_DISTINCT_PRIME_COPRIME
fn step_207() -> Unit raise {
  let t525 = @meson.meson_tac(
    @list.List([int_coprime_sym(), int_prime_coprime_eq()]),
  )
  let t526 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(int_divides_antisym_abs())])),
    t525,
  )
  int_distinct_prime_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ q : Int, int_prime(p) && int_prime(q) && !(abs(p) == abs(q)) → coprime((p, q))"),
      t526,
    ),
  )
}

///|
let int_distinct_prime_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DISTINCT_PRIME_COPRIME",
)

///|
/// `INT_DISTINCT_PRIME_COPRIME`
pub fn int_distinct_prime_coprime() -> @kernel.Thm {
  int_distinct_prime_coprime_c.get()
}

///|
/// INT_PRIME_COPRIME_LT
fn step_208() -> Unit raise {
  let t532 = @drule.match_mp(int_divides_le())
  let t534 = @tactics.disch_then(fn(
    x533 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x529 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s530 = @tactics.mp_tac(x529)
      fn(
        x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s530(x531)
      }
    })(t532(x533))
  })
  let t528 = @tactics.repeat_tac(@tactics.gen_tac)
  let t527 = @simp.simp_tac(@list.List([int_prime_coprime_eq()]))
  let t535 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(@list.List([int_coprime_sym()])),
            t527,
          ),
          t528,
        ),
        @tactics.strip_tac,
      ),
      t534,
    ),
    @int.asm_int_arith_tac,
  )
  int_prime_coprime_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ p : Int, int_prime(p) && int_of_num(0) < abs(x) && abs(x) < abs(p) → coprime((x, p))"),
      t535,
    ),
  )
}

///|
let int_prime_coprime_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_COPRIME_LT",
)

///|
/// `INT_PRIME_COPRIME_LT`
pub fn int_prime_coprime_lt() -> @kernel.Thm {
  int_prime_coprime_lt_c.get()
}

///|
/// INT_DIVIDES_PRIME_PRIME
fn step_209() -> Unit raise {
  let t537 = @simp.simp_tac(
    @list.List([@equal.gsym(int_divides_antisym_abs())]),
  )
  let t536 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(int_prime_coprime_eq()),
      int_distinct_prime_coprime(),
    ]),
  )
  let t538 = @list.List([
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())])),
      t536,
    ),
    t537,
  ])
  let t539 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac),
    t538,
  )
  int_divides_prime_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ q : Int, int_prime(p) && int_prime(q) → divides(p, q) == (abs(p) == abs(q))"),
      t539,
    ),
  )
}

///|
let int_divides_prime_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_PRIME_PRIME",
)

///|
/// `INT_DIVIDES_PRIME_PRIME`
pub fn int_divides_prime_prime() -> @kernel.Thm {
  int_divides_prime_prime_c.get()
}

///|
/// INT_COPRIME_POW_DIVPROD
fn step_210() -> Unit raise {
  let t540 = @meson.meson_tac(
    @list.List([int_coprime_divprod(), int_coprime_pow(), int_coprime_sym()]),
  )
  int_coprime_pow_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(pow(d, (n : Num)), a * b) && coprime((d, a)) → divides(pow(d, n), b)"),
      t540,
    ),
  )
}

///|
let int_coprime_pow_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW_DIVPROD",
)

///|
/// `INT_COPRIME_POW_DIVPROD`
pub fn int_coprime_pow_divprod() -> @kernel.Thm {
  int_coprime_pow_divprod_c.get()
}

///|
/// INT_PRIME_COPRIME_CASES
fn step_211() -> Unit raise {
  let t541 = @meson.meson_tac(
    @list.List([int_coprime_prime(), int_prime_coprime_eq()]),
  )
  int_prime_coprime_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ a : Int, ∀ b : Int, int_prime(p) && coprime((a, b)) → coprime((p, a)) || coprime((p, b))"),
      t541,
    ),
  )
}

///|
let int_prime_coprime_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_COPRIME_CASES",
)

///|
/// `INT_PRIME_COPRIME_CASES`
pub fn int_prime_coprime_cases() -> @kernel.Thm {
  int_prime_coprime_cases_c.get()
}

///|
/// INT_PRIME_DIVPROD_POW
fn step_212() -> Unit raise {
  let t542 = @meson.meson_tac(
    @list.List([
      int_coprime_pow_divprod(),
      int_prime_coprime_cases(),
      @int.int_mul_sym(),
    ]),
  )
  int_prime_divprod_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Int, ∀ a : Int, ∀ b : Int, int_prime(p) && coprime((a, b)) && divides(pow(p, n), a * b) → divides(pow(p, n), a) || divides(pow(p, n), b)"),
      t542,
    ),
  )
}

///|
let int_prime_divprod_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_PRIME_DIVPROD_POW",
)

///|
/// `INT_PRIME_DIVPROD_POW`
pub fn int_prime_divprod_pow() -> @kernel.Thm {
  int_prime_divprod_pow_c.get()
}

///|
/// INT_DIVIDES_POW2_REV
fn step_213() -> Unit raise {
  let t564 = @meson.asm_meson_tac(
    @list.List([int_divides_pow2(), int_divides_trans(), int_divides_1()]),
  )
  let t563 = @simp.asm_simp_tac(@list.List([int_coprime_pow2()]))
  let t560 = @drule.match_mp(
    @int.integer_rule(
      @term_syntax.parse_term("divides((a : Int), (b : Int)) → coprime((a, b)) → divides(a, int_of_num(1))"),
    ),
  )
  let t562 = @tactics.disch_then(fn(
    x561 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s558 = @tactics.mp_tac(x557)
      fn(
        x559 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s558(x559)
      }
    })(t560(x561))
  })
  let t556 = @simp.asm_simp_tac(
    @list.List([@int.int_pow_eq_0(), int_divides_rmul2_eq()]),
  )
  let t555 = @simp.rewrite_tac(@list.List([@int.int_pow_mul()]))
  let t554 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t553 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x547 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s548 = @tactics.mp_tac(x547)
        fn(
          x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s548(x549)
        }
      },
      fn(
        x550 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s551 = @tactics.assume_tac(x550)
        fn(
          x552 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s551(x552)
        }
      },
    ),
  )
  let t545 = @term_syntax.parse_term("(b : Int)")
  let t546 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Int)"), t545]),
      int_gcd_coprime_exists(),
    ),
  )
  let t544 = @list.List([
    @meson.asm_meson_tac(@list.List([int_gcd_eq_0(), int_divides_refl()])),
    @tactics.all_tac,
  ])
  let t543 = @class.asm_cases_tac(@term_syntax.parse_term("gcd(((a : Int), (b : Int))) == int_of_num(0)"))
  let t565 = @tactics.then_tac(
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
                        t543,
                      ),
                      t544,
                    ),
                    t546,
                  ),
                  @tactics.strip_tac,
                ),
                t553,
              ),
              t554,
            ),
            t555,
          ),
          t556,
        ),
        t562,
      ),
      t563,
    ),
    t564,
  )
  int_divides_pow2_rev_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ b : Int, divides(pow(a, n), pow(b, n)) && !(n == 0) → divides(a, b)"),
      t565,
    ),
  )
}

///|
let int_divides_pow2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW2_REV",
)

///|
/// `INT_DIVIDES_POW2_REV`
pub fn int_divides_pow2_rev() -> @kernel.Thm {
  int_divides_pow2_rev_c.get()
}

///|
/// INT_DIVIDES_POW2_EQ
fn step_214() -> Unit raise {
  let t566 = @meson.meson_tac(
    @list.List([int_divides_pow2_rev(), int_divides_pow()]),
  )
  int_divides_pow2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ b : Int, !(n == 0) → divides(pow(a, n), pow(b, n)) == divides(a, b)"),
      t566,
    ),
  )
}

///|
let int_divides_pow2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_POW2_EQ",
)

///|
/// `INT_DIVIDES_POW2_EQ`
pub fn int_divides_pow2_eq() -> @kernel.Thm {
  int_divides_pow2_eq_c.get()
}

///|
/// INT_POW_MUL_EXISTS
fn step_215() -> Unit raise {
  let t585 = @meson.meson_tac(@list.List([]))
  let t584 = @simp.asm_simp_tac(
    @list.List([
      @int.int_pow_mul(),
      @int.int_eq_mul_lcancel(),
      @int.int_pow_eq_0(),
    ]),
  )
  let t583 = @tactics.first_x_assum(fn(
    x582 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x579 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s580 = @tactics.mp_tac(x579)
      fn(
        x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s580(x581)
      }
    })(@equal.sym(x582))
  })
  let t578 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x575 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s576 = @tactics.subst_all_tac(x575)
      fn(
        x577 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s576(x577)
      }
    }),
  )
  let t574 = @simp.rewrite_tac(@list.List([@int.int_divides()]))
  let t573 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.int_divides(), @int.int_mul_sym()])),
    @tactics.all_tac,
  ])
  let t572 = @simp.asm_rewrite_tac(@list.List([]))
  let t569 = @term_syntax.parse_term("(p : Int)")
  let t570 = @term_syntax.parse_term("(m : Int)")
  let t571 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(k : Num)"), t570, t569]),
      int_divides_pow2_rev(),
    ),
  )
  let t568 = @simp.asm_simp_tac(
    @list.List([@int.int_pow_v1(), @int.int_mul_lid()]),
  )
  let t567 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t586 = @tactics.then_tac(
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
                          t567,
                        ),
                        t568,
                      ),
                      @tactics.strip_tac,
                    ),
                    t571,
                  ),
                  t572,
                ),
                @tactics.ants_tac,
              ),
              t573,
            ),
            t574,
          ),
          t578,
        ),
        t583,
      ),
      t584,
    ),
    t585,
  )
  int_pow_mul_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, ∀ k : Num, !(m == int_of_num(0)) && pow(m, k) * n == pow(p, k) → (∃ q : Int, n == pow(q, k))"),
      t586,
    ),
  )
}

///|
let int_pow_mul_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_MUL_EXISTS",
)

///|
/// `INT_POW_MUL_EXISTS`
pub fn int_pow_mul_exists() -> @kernel.Thm {
  int_pow_mul_exists_c.get()
}

///|
/// INT_COPRIME_POW_ABS
fn step_216() -> Unit raise {
  let t666 = @meson.meson_tac(@list.List([]))
  let t667 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      @simp.asm_rewrite_tac(
        @list.List([
          @int.int_abs_pow(),
          @equal.gsym(@int.int_pow_mul()),
          @int.int_abs_mul(),
        ]),
      ),
    ),
    t666,
  )
  let t665 = @tactics.conv_tac(@int.int_ring)
  let t664 = @tactics.first_x_assum(fn(
    x663 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x660 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s661 = @tactics.mp_tac(x660)
      fn(
        x662 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s661(x662)
      }
    })(@equal.sym(x663))
  })
  let t659 = @simp.asm_simp_tac(
    @list.List([@int.int_pow_eq_0(), int_prime_imp_nz()]),
  )
  let t658 = @tactics.exists_tac(@term_syntax.parse_term("pow((p : Int), (n : Num))"))
  let t668 = @tactics.thenl(
    @tactics.ants_tac,
    @list.List([
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(
                @int.int_ring(
                  @term_syntax.parse_term("∀ p : Int, !(p == int_of_num(0)) && (a : Int) * p == (b : Int) * p → a == b"),
                ),
              ),
              t658,
            ),
            t659,
          ),
          t664,
        ),
        t665,
      ),
      t667,
    ]),
  )
  let t657 = @simp.asm_rewrite_tac(@list.List([]))
  let t651 = @term_syntax.parse_term("(a : Int)")
  let t652 = @list.List([@term_syntax.parse_term("(d : Int)"), t651])
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
      x648 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s649 = @tactics.mp_tac(x648)
      fn(
        x650 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s649(x650)
      }
    })(((x653 : @kernel.Thm) => @bool.specl(t652, x653))(x654))
  })
  let t644 = @term_syntax.parse_term("(d : Int)")
  let t645 = @list.List([@term_syntax.parse_term("(b : Int)"), t644])
  let t656 = @list.List([
    @tactics.first_x_assum(fn(
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
      (fn(
        x641 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s642 = @tactics.mp_tac(x641)
        fn(
          x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s642(x643)
        }
      })(((x646 : @kernel.Thm) => @bool.specl(t645, x646))(x647))
    }),
    t655,
  ])
  let t640 = @simp.asm_simp_tac(
    @list.List([
      int_coprime_rmul(),
      int_coprime_lmul(),
      int_coprime_lpow(),
      int_coprime_rpow(),
    ]),
  )
  let t637 = @simp.gen_rewrite_rule(
    fn(
      x636 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x636
    },
    @list.List([int_coprime_sym()]),
  )
  let t639 = @tactics.first_x_assum(fn(
    x638 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s634 = @tactics.mp_tac(x633)
      fn(
        x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s634(x635)
      }
    })(t637(x638))
  })
  let t632 = @tactics.disch_then(
    @tactics.disj_cases_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(d : Int)"))(fn(
        x629 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s630 = @tactics.subst_all_tac(x629)
        fn(
          x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s630(x631)
        }
      }),
    ),
  )
  let t628 = @simp.rewrite_tac(@list.List([@int.int_divides()]))
  let t627 = @list.List([
    @meson.asm_meson_tac(
      @list.List([int_prime_divprod_pow(), @int.int_divides()]),
    ),
    @tactics.all_tac,
  ])
  let t626 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(pow((p : Int), (n : Num)), (a : Int)) || divides(pow(p, n), (b : Int))"),
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
      let s624 = @tactics.mp_tac(x623)
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
  )
  let t622 = @tactics.repeat_tac(@tactics.strip_tac)
  let t669 = @tactics.then_tac(
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
                        @simp.rewrite_tac(@list.List([@int.int_pow_mul()])),
                        t622,
                      ),
                      t626,
                    ),
                    t627,
                  ),
                  t628,
                ),
                t632,
              ),
              t639,
            ),
            t640,
          ),
          @tactics.strip_tac,
        ),
        t656,
      ),
      t657,
    ),
    t668,
  )
  let t621 = @meson.meson_tac(@list.List([@int.int_pow_one()]))
  let t620 = @simp.simp_tac(
    @list.List([
      @int.int_pow_one(),
      @int.int_abs_pow(),
      @int.int_abs_neg(),
      @int.int_abs_num(),
      @int.int_abs_mul_1(),
    ]),
  )
  let t616 = @term_syntax.parse_term("abs")
  let t619 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s614 = @tactics.mp_tac(x613)
      fn(
        x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s614(x615)
      }
    })(((x617 : @kernel.Thm) => @equal.ap_term(t616, x617))(x618))
  })
  let t670 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t619),
      t620,
    ),
    t621,
  )
  let t612 = @meson.meson_tac(@list.List([@int.int_pow_one()]))
  let t611 = @simp.simp_tac(
    @list.List([@int.int_pow_one(), @int.int_abs_num(), @int.int_abs_mul_1()]),
  )
  let t607 = @term_syntax.parse_term("abs")
  let t610 = @tactics.first_x_assum(fn(
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
      x604 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s605 = @tactics.mp_tac(x604)
      fn(
        x606 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s605(x606)
      }
    })(((x608 : @kernel.Thm) => @equal.ap_term(t607, x608))(x609))
  })
  let t671 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t610),
      t611,
    ),
    t612,
  )
  let t603 = @meson.asm_meson_tac(
    @list.List([@int.int_pow_one(), @int.int_pow_zero()]),
  )
  let t602 = @simp.asm_simp_tac(
    @list.List([int_coprime_0(), int_divides_one_abs(), @int.int_abs_num()]),
  )
  let t601 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x598 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s599 = @tactics.mp_tac(x598)
        fn(
          x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s599(x600)
        }
      },
      @tactics.disj_cases_tac,
    ),
  )
  let t597 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_zero(), @int.int_entire()]),
  )
  let t672 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t597),
          t601,
        ),
        t602,
      ),
      t603,
    ),
    t671,
    t670,
    t669,
  ])
  let t596 = @tactics.repeat_tac(@tactics.conj_tac)
  let t595 = @tactics.match_mp_tac(int_prime_factor_induct())
  let t593 = @meson.meson_tac(
    @list.List([@int.int_abs_mul_1(), @int.int_abs_num()]),
  )
  let t594 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@int.int_pow_v1()])),
      t593,
    ),
    @tactics.all_tac,
  ])
  let t592 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t591 = @simp.gen_rewrite_tac(
    fn(
      x590 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x590
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t673 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.gen_rewrite_tac(
                  fn(
                    x587 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s588 = @equal.binder_conv(x587)
                    fn(x589 : @kernel.Term) -> @kernel.Thm raise { s588(x589) }
                  },
                  @list.List([@theorems.swap_forall_thm()]),
                ),
              ),
              t591,
            ),
            t592,
          ),
          t594,
        ),
        t595,
      ),
      t596,
    ),
    t672,
  )
  int_coprime_pow_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ b : Int, ∀ c : Int, coprime((a, b)) && a * b == pow(c, n) → (∃ r : Int, ∃ s : Int, abs(a) == pow(r, n) && abs(b) == pow(s, n))"),
      t673,
    ),
  )
}

///|
let int_coprime_pow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW_ABS",
)

///|
/// `INT_COPRIME_POW_ABS`
pub fn int_coprime_pow_abs() -> @kernel.Thm {
  int_coprime_pow_abs_c.get()
}

///|
/// INT_COPRIME_POW_ODD
fn step_217() -> Unit raise {
  let t682 = @meson.asm_meson_tac(
    @list.List([@int.int_pow_neg(), @int.int_neg_neg(), @arith.not_odd()]),
  )
  let t681 = @simp.rewrite_tac(@list.List([@int.int_abs_v1()]))
  let t680 = @tactics.match_mp_tac(@theorems.mono_and())
  let t679 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_exists_and_thm(),
      @theorems.left_exists_and_thm(),
    ]),
  )
  let t678 = @simp.asm_rewrite_tac(@list.List([@int.int_abs_v1()]))
  let t674 = @term_syntax.parse_term("(c : Int)")
  let t675 = @term_syntax.parse_term("(b : Int)")
  let t676 = @term_syntax.parse_term("(a : Int)")
  let t677 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t676, t675, t674]),
      int_coprime_pow_abs(),
    ),
  )
  let t683 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t677),
            t678,
          ),
          t679,
        ),
        t680,
      ),
      t681,
    ),
    t682,
  )
  int_coprime_pow_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Int, ∀ b : Int, ∀ c : Int, ODD(n) && coprime((a, b)) && a * b == pow(c, n) → (∃ r : Int, ∃ s : Int, a == pow(r, n) && b == pow(s, n))"),
      t683,
    ),
  )
}

///|
let int_coprime_pow_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_COPRIME_POW_ODD",
)

///|
/// `INT_COPRIME_POW_ODD`
pub fn int_coprime_pow_odd() -> @kernel.Thm {
  int_coprime_pow_odd_c.get()
}

///|
/// INT_DIVIDES_PRIME_POW_LE
fn step_218() -> Unit raise {
  let t696 = @meson.asm_meson_tac(
    @list.List([
      int_divides_pow_le(),
      int_prime_ge_2(),
      int_prime_divpow(),
      @int.int_abs_abs(),
      int_prime_abs(),
      int_divides_pow2(),
      int_divides_prime_prime(),
    ]),
  )
  let t695 = @list.List([
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.match_mp_tac(
        @class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")),
      ),
    ),
    @tactics.all_tac,
  ])
  let t694 = @simp.rewrite_tac(@list.List([@int.int_abs_pow()]))
  let t693 = @simp.gen_rewrite_tac(
    fn(
      x690 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s691 = @equal.land_conv(x690)
      fn(x692 : @kernel.Term) -> @kernel.Thm raise { s691(x692) }
    },
    @list.List([@equal.gsym(@int.int_divides_rabs())]),
  )
  let t689 = @simp.gen_rewrite_tac(
    fn(
      x686 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s687 = @equal.land_conv(x686)
      fn(x688 : @kernel.Term) -> @kernel.Thm raise { s687(x688) }
    },
    @list.List([@equal.gsym(@int.int_divides_labs())]),
  )
  let t685 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_v1(), int_divides_1()]),
  )
  let t684 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t697 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t684),
                t685,
              ),
              t689,
            ),
            t693,
          ),
          t694,
        ),
        @tactics.eq_tac,
      ),
      t695,
    ),
    t696,
  )
  int_divides_prime_pow_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ q : Int, ∀ m : Num, ∀ n : Num, int_prime(p) && int_prime(q) → divides(pow(p, m), pow(q, n)) == (m == 0 || abs(p) == abs(q) && m <= n)"),
      t697,
    ),
  )
}

///|
let int_divides_prime_pow_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_PRIME_POW_LE",
)

///|
/// `INT_DIVIDES_PRIME_POW_LE`
pub fn int_divides_prime_pow_le() -> @kernel.Thm {
  int_divides_prime_pow_le_c.get()
}

///|
/// INT_EQ_PRIME_POW_ABS
fn step_219() -> Unit raise {
  let t705 = @simp.asm_rewrite_tac(@list.List([]))
  let t704 = @class.asm_cases_tac(@term_syntax.parse_term("abs((p : Int)) == abs((q : Int))"))
  let t703 = @simp.asm_simp_tac(
    @list.List([int_divides_prime_pow_le(), int_prime_abs()]),
  )
  let t702 = @simp.gen_rewrite_tac(
    fn(
      x699 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s700 = @equal.land_conv(x699)
      fn(x701 : @kernel.Term) -> @kernel.Thm raise { s700(x701) }
    },
    @list.List([@equal.gsym(int_divides_antisym_abs())]),
  )
  let t698 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_abs_pow())]))
  let t706 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t698),
            t702,
          ),
          t703,
        ),
        t704,
      ),
      t705,
    ),
    @int.arith_tac,
  )
  int_eq_prime_pow_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ q : Int, ∀ m : Num, ∀ n : Num, int_prime(p) && int_prime(q) → (pow(abs(p), m) == pow(abs(q), n)) == (m == 0 && n == 0 || abs(p) == abs(q) && m == n)"),
      t706,
    ),
  )
}

///|
let int_eq_prime_pow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_PRIME_POW_ABS",
)

///|
/// `INT_EQ_PRIME_POW_ABS`
pub fn int_eq_prime_pow_abs() -> @kernel.Thm {
  int_eq_prime_pow_abs_c.get()
}

///|
/// INT_EQ_PRIME_POW_POS
fn step_220() -> Unit raise {
  let t711 = @simp.asm_simp_tac(@list.List([@int.int_abs_v1()]))
  let t707 = @term_syntax.parse_term("(n : Num)")
  let t708 = @term_syntax.parse_term("(m : Num)")
  let t709 = @term_syntax.parse_term("(q : Int)")
  let t710 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Int)"), t709, t708, t707]),
      int_eq_prime_pow_abs(),
    ),
  )
  let t712 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t710),
    t711,
  )
  int_eq_prime_pow_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ q : Int, ∀ m : Num, ∀ n : Num, int_prime(p) && int_prime(q) && int_of_num(0) <= p && int_of_num(0) <= q → (pow(p, m) == pow(q, n)) == (m == 0 && n == 0 || p == q && m == n)"),
      t712,
    ),
  )
}

///|
let int_eq_prime_pow_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_PRIME_POW_POS",
)

///|
/// `INT_EQ_PRIME_POW_POS`
pub fn int_eq_prime_pow_pos() -> @kernel.Thm {
  int_eq_prime_pow_pos_c.get()
}

///|
/// INT_DIVIDES_FACT_PRIME
fn step_221() -> Unit raise {
  let t716 = @int.int_arith(@term_syntax.parse_term("abs(int_of_num((n : Num)) + int_of_num(1)) == int_of_num(n) + int_of_num(1)"))
  let t717 = @int.int_arith(@term_syntax.parse_term("!(int_of_num((n : Num)) + int_of_num(1) == int_of_num(0))"))
  let t718 = @int.int_arith(
    @term_syntax.parse_term("(p : Int) <= (n : Int) + int_of_num(1) → p <= n || p == n + int_of_num(1)"),
  )
  let t719 = @meson.asm_meson_tac(
    @list.List([
      int_divides_le(),
      @int.int_arith(@term_syntax.parse_term("(x : Int) <= (n : Int) → x <= n + int_of_num(1)")),
      int_divides_refl(),
      @int.int_divides_labs(),
      t718,
      t717,
      t716,
    ]),
  )
  let t715 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_suc())]))
  let t720 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([int_prime_divprod_eq(), @equal.gsym(@int.int_of_num_mul())]),
      ),
      t715,
    ),
    t719,
  )
  let t714 = @meson.asm_meson_tac(
    @list.List([
      int_divides_one(),
      int_prime_neg(),
      int_prime_0(),
      int_prime_1(),
    ]),
  )
  let t721 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @int.int_arith(@term_syntax.parse_term("(abs((x : Int)) <= int_of_num(0)) == (x == int_of_num(0))")),
        ]),
      ),
      t714,
    ),
    t720,
  ])
  let t713 = @simp.rewrite_tac(@list.List([@arith.fact()]))
  let t722 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        @nums.induct_tac,
      ),
      t713,
    ),
    t721,
  )
  int_divides_fact_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, int_prime(p) → (∀ n : Num, divides(p, int_of_num(FACT(n))) == (abs(p) <= int_of_num(n)))"),
      t722,
    ),
  )
}

///|
let int_divides_fact_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_FACT_PRIME",
)

///|
/// `INT_DIVIDES_FACT_PRIME`
pub fn int_divides_fact_prime() -> @kernel.Thm {
  int_divides_fact_prime_c.get()
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
}
