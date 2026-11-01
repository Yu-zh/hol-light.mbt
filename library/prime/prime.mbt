// Translated from upstream Library/prime.ml; edit this file directly.

///|
/// Library/prime.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// DIVIDES_0
fn step_2() -> Unit raise {
  divides_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Num, divides(x, 0)"), @int.number_tac),
  )
}

///|
let divides_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_0")

///|
/// `DIVIDES_0`
pub fn divides_0() -> @kernel.Thm {
  divides_0_c.get()
}

///|
/// DIVIDES_ZERO
fn step_3() -> Unit raise {
  divides_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, divides(0, x) == (x == 0)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ZERO")

///|
/// `DIVIDES_ZERO`
pub fn divides_zero() -> @kernel.Thm {
  divides_zero_c.get()
}

///|
/// DIVIDES_1
fn step_4() -> Unit raise {
  divides_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Num, divides(1, x)"), @int.number_tac),
  )
}

///|
let divides_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_1")

///|
/// `DIVIDES_1`
pub fn divides_1() -> @kernel.Thm {
  divides_1_c.get()
}

///|
/// DIVIDES_REFL
fn step_5() -> Unit raise {
  divides_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Num, divides(x, x)"), @int.number_tac),
  )
}

///|
let divides_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_REFL")

///|
/// `DIVIDES_REFL`
pub fn divides_refl() -> @kernel.Thm {
  divides_refl_c.get()
}

///|
/// DIVIDES_TRANS
fn step_6() -> Unit raise {
  divides_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, divides(a, b) && divides(b, c) → divides(a, c)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_TRANS")

///|
/// `DIVIDES_TRANS`
pub fn divides_trans() -> @kernel.Thm {
  divides_trans_c.get()
}

///|
/// DIVIDES_ADD
fn step_7() -> Unit raise {
  divides_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a) && divides(d, b) → divides(d, a + b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ADD")

///|
/// `DIVIDES_ADD`
pub fn divides_add() -> @kernel.Thm {
  divides_add_c.get()
}

///|
/// DIVIDES_SUB_EQ
fn step_8() -> Unit raise {
  let t6 = @simp.simp_tac(@list.List([]))
  let t4 = @int.arith_rule(
    @term_syntax.parse_term("(a : Num) < (b : Num) && a - b == 0 || !(a < b) && a - b + b == a"),
  )
  let t5 = @tactics.disj_cases_then(fn(
    x1 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2 = @tactics.mp_tac(x1)
    fn(
      x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2(x3)
    }
  })(t4)
  let t7 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t5),
      t6,
    ),
    @int.number_tac,
  )
  divides_sub_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a - b) == (a < b || op_eq_eq(a, b, mod(d)))"),
      t7,
    ),
  )
}

///|
let divides_sub_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_SUB_EQ")

///|
/// `DIVIDES_SUB_EQ`
pub fn divides_sub_eq() -> @kernel.Thm {
  divides_sub_eq_c.get()
}

///|
/// DIVIDES_SUB
fn step_9() -> Unit raise {
  let t12 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t8 = @simp.rewrite_tac(@list.List([divides_sub_eq()]))
  let t13 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t8),
        @tactics.disj2_tac,
      ),
      t12,
    ),
    @int.number_tac,
  )
  divides_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a) && divides(d, b) → divides(d, a - b)"),
      t13,
    ),
  )
}

///|
let divides_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_SUB")

///|
/// `DIVIDES_SUB`
pub fn divides_sub() -> @kernel.Thm {
  divides_sub_c.get()
}

///|
/// DIVIDES_SUB_1
fn step_10() -> Unit raise {
  let t14 = @simp.rewrite_tac(
    @list.List([
      divides_sub_eq(),
      @int.arith_rule(@term_syntax.parse_term("((n : Num) < 1) == (n == 0)")),
    ]),
  )
  divides_sub_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ n : Num, divides(d, n - 1) == (n == 0 || op_eq_eq(n, 1, mod(d)))"),
      t14,
    ),
  )
}

///|
let divides_sub_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_SUB_1")

///|
/// `DIVIDES_SUB_1`
pub fn divides_sub_1() -> @kernel.Thm {
  divides_sub_1_c.get()
}

///|
/// DIVIDES_LMUL
fn step_11() -> Unit raise {
  divides_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ x : Num, divides(d, a) → divides(d, x * a)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LMUL")

///|
/// `DIVIDES_LMUL`
pub fn divides_lmul() -> @kernel.Thm {
  divides_lmul_c.get()
}

///|
/// DIVIDES_RMUL
fn step_12() -> Unit raise {
  divides_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ x : Num, divides(d, a) → divides(d, a * x)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_RMUL")

///|
/// `DIVIDES_RMUL`
pub fn divides_rmul() -> @kernel.Thm {
  divides_rmul_c.get()
}

///|
/// DIVIDES_ADD_REVR
fn step_13() -> Unit raise {
  divides_add_revr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a) && divides(d, a + b) → divides(d, b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_add_revr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ADD_REVR",
)

///|
/// `DIVIDES_ADD_REVR`
pub fn divides_add_revr() -> @kernel.Thm {
  divides_add_revr_c.get()
}

///|
/// DIVIDES_ADD_REVL
fn step_14() -> Unit raise {
  divides_add_revl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, b) && divides(d, a + b) → divides(d, a)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_add_revl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ADD_REVL",
)

///|
/// `DIVIDES_ADD_REVL`
pub fn divides_add_revl() -> @kernel.Thm {
  divides_add_revl_c.get()
}

///|
/// DIVIDES_MUL_L
fn step_15() -> Unit raise {
  divides_mul_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, divides(a, b) → divides(c * a, c * b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_mul_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_MUL_L")

///|
/// `DIVIDES_MUL_L`
pub fn divides_mul_l() -> @kernel.Thm {
  divides_mul_l_c.get()
}

///|
/// DIVIDES_MUL_R
fn step_16() -> Unit raise {
  divides_mul_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, divides(a, b) → divides(a * c, b * c)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_mul_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_MUL_R")

///|
/// `DIVIDES_MUL_R`
pub fn divides_mul_r() -> @kernel.Thm {
  divides_mul_r_c.get()
}

///|
/// DIVIDES_LMUL2
fn step_17() -> Unit raise {
  divides_lmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ x : Num, divides(x * d, a) → divides(d, a)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_lmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LMUL2")

///|
/// `DIVIDES_LMUL2`
pub fn divides_lmul2() -> @kernel.Thm {
  divides_lmul2_c.get()
}

///|
/// DIVIDES_RMUL2
fn step_18() -> Unit raise {
  divides_rmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ x : Num, divides(d * x, a) → divides(d, a)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_rmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_RMUL2")

///|
/// `DIVIDES_RMUL2`
pub fn divides_rmul2() -> @kernel.Thm {
  divides_rmul2_c.get()
}

///|
/// DIVIDES_CMUL2
fn step_19() -> Unit raise {
  divides_cmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, divides(c * a, c * b) && !(c == 0) → divides(a, b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_cmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_CMUL2")

///|
/// `DIVIDES_CMUL2`
pub fn divides_cmul2() -> @kernel.Thm {
  divides_cmul2_c.get()
}

///|
/// DIVIDES_LMUL2_EQ
fn step_20() -> Unit raise {
  divides_lmul2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, !(c == 0) → divides(c * a, c * b) == divides(a, b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_lmul2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LMUL2_EQ",
)

///|
/// `DIVIDES_LMUL2_EQ`
pub fn divides_lmul2_eq() -> @kernel.Thm {
  divides_lmul2_eq_c.get()
}

///|
/// DIVIDES_RMUL2_EQ
fn step_21() -> Unit raise {
  divides_rmul2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, !(c == 0) → divides(a * c, b * c) == divides(a, b)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_rmul2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_RMUL2_EQ",
)

///|
/// `DIVIDES_RMUL2_EQ`
pub fn divides_rmul2_eq() -> @kernel.Thm {
  divides_rmul2_eq_c.get()
}

///|
/// DIVIDES_EQ_ZERO
fn step_22() -> Unit raise {
  let t15 = @meson.meson_tac(
    @list.List([
      divides_0(),
      @int.divides_le_strong(),
      @arith.not_le(),
      @arith.lt(),
    ]),
  )
  divides_eq_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, n < p → divides(p, n) == (n == 0)"),
      t15,
    ),
  )
}

///|
let divides_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EQ_ZERO",
)

///|
/// `DIVIDES_EQ_ZERO`
pub fn divides_eq_zero() -> @kernel.Thm {
  divides_eq_zero_c.get()
}

///|
/// DIVIDES_CASES
fn step_23() -> Unit raise {
  let t17 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_eq_0(),
      @arith.eq_mult_lcancel(),
      @arith.le_mult_lcancel(),
    ]),
  )
  let t16 = @simp.simp_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t18 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @int.arith_rule(
              @term_syntax.parse_term("((m : Num) == (n : Num) || 2 * n <= m) == (m == n * 1 || n * 2 <= m)"),
            ),
          ]),
        ),
        t16,
      ),
      t17,
    ),
    @int.arith_tac,
  )
  divides_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(n, m) → m == 0 || m == n || 2 * n <= m"),
      t18,
    ),
  )
}

///|
let divides_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_CASES")

///|
/// `DIVIDES_CASES`
pub fn divides_cases() -> @kernel.Thm {
  divides_cases_c.get()
}

///|
/// DIVIDES_DIV_NOT
fn step_24() -> Unit raise {
  let t23 = @drule.match_mp(@int.divides_le())
  let t25 = @tactics.first_x_assum(fn(
    x24 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
    })(t23(x24))
  })
  let t19 = @tactics.repeat_tac(@tactics.strip_tac)
  let t26 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @int.number_rule(
              @term_syntax.parse_term("divides((n : Num), (q : Num) * n + (r : Num)) == divides(n, r)"),
            ),
          ]),
        ),
        t19,
      ),
      t25,
    ),
    @int.asm_arith_tac,
  )
  divides_div_not_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ q : Num, ∀ r : Num, x == q * n + r && 0 < r && r < n → !divides(n, x)"),
      t26,
    ),
  )
}

///|
let divides_div_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIV_NOT",
)

///|
/// `DIVIDES_DIV_NOT`
pub fn divides_div_not() -> @kernel.Thm {
  divides_div_not_c.get()
}

///|
/// DIVIDES_MUL2
fn step_25() -> Unit raise {
  divides_mul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, divides(a, b) && divides(c, d) → divides(a * c, b * d)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_MUL2")

///|
/// `DIVIDES_MUL2`
pub fn divides_mul2() -> @kernel.Thm {
  divides_mul2_c.get()
}

///|
/// DIVIDES_EXP
fn step_26() -> Unit raise {
  let t33 = @tactics.match_accept_tac(@arith.mult_exp())
  let t32 = @tactics.exists_tac(@term_syntax.parse_term("EXP((d : Num), (n : Num))"))
  let t31 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
      let s29 = @tactics.subst1_tac(x28)
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
    }),
  )
  let t27 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t34 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t27),
        t31,
      ),
      t32,
    ),
    t33,
  )
  divides_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, divides(x, y) → divides(EXP(x, n), EXP(y, n))"),
      t34,
    ),
  )
}

///|
let divides_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_EXP")

///|
/// `DIVIDES_EXP`
pub fn divides_exp() -> @kernel.Thm {
  divides_exp_c.get()
}

///|
/// DIVIDES_EXP2
fn step_27() -> Unit raise {
  let t35 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.rewrite_tac(@list.List([@nums.not_suc(), @arith.exp()])),
    ),
    @int.number_tac,
  )
  divides_exp2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ y : Num, !(n == 0) && divides(EXP(x, n), y) → divides(x, y)"),
      t35,
    ),
  )
}

///|
let divides_exp2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_EXP2")

///|
/// `DIVIDES_EXP2`
pub fn divides_exp2() -> @kernel.Thm {
  divides_exp2_c.get()
}

///|
/// DIVIDES_EXP_LE_IMP
fn step_28() -> Unit raise {
  let t36 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @arith.le_exists(),
        @theorems.left_imp_exists_thm(),
        @arith.exp_add(),
      ]),
    ),
    @int.number_tac,
  )
  divides_exp_le_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, m <= n → divides(EXP(p, m), EXP(p, n))"),
      t36,
    ),
  )
}

///|
let divides_exp_le_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EXP_LE_IMP",
)

///|
/// `DIVIDES_EXP_LE_IMP`
pub fn divides_exp_le_imp() -> @kernel.Thm {
  divides_exp_le_imp_c.get()
}

///|
/// DIVIDES_EXP_LE
fn step_29() -> Unit raise {
  let t47 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @arith.le_exists(),
        @theorems.left_imp_exists_thm(),
        @arith.exp_add(),
      ]),
    ),
    @int.number_tac,
  )
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
  let t42 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_exp(), @arith.exp_eq_0()]),
  )
  let t40 = @drule.match_mp(@int.divides_le())
  let t48 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x41 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x37 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s38 = @tactics.mp_tac(x37)
              fn(
                x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s38(x39)
              }
            })(t40(x41))
          }),
          t42,
        ),
        t46,
      ),
      @int.arith_tac,
    ),
    t47,
  ])
  let t49 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac),
    t48,
  )
  divides_exp_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, 2 <= p → divides(EXP(p, m), EXP(p, n)) == (m <= n)"),
      t49,
    ),
  )
}

///|
let divides_exp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_EXP_LE")

///|
/// `DIVIDES_EXP_LE`
pub fn divides_exp_le() -> @kernel.Thm {
  divides_exp_le_c.get()
}

///|
/// DIVIDES_TRIVIAL_UPPERBOUND
fn step_30() -> Unit raise {
  let t63 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_mono_le(), @nums.not_suc()]),
  )
  let t61 = @term_syntax.parse_term("(n : Num)")
  let t62 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t61)
  let t60 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t59 = @simp.rewrite_tac(@list.List([@arith.lt_pow2_refl()]))
  let t58 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (n : Num))"))
  let t57 = @tactics.match_mp_tac(@arith.lte_trans())
  let t56 = @simp.asm_rewrite_tac(@list.List([@arith.not_le()]))
  let t53 = @drule.match_mp(@int.divides_le())
  let t55 = @tactics.first_assum(fn(
    x54 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x50 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s51 = @tactics.mp_tac(x50)
      fn(
        x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s51(x52)
      }
    })(t53(x54))
  })
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
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
        t62,
      ),
      @nums.induct_tac,
    ),
    t63,
  )
  divides_trivial_upperbound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, !(n == 0) && 2 <= p → !divides(EXP(p, n), n)"),
      t64,
    ),
  )
}

///|
let divides_trivial_upperbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_TRIVIAL_UPPERBOUND",
)

///|
/// `DIVIDES_TRIVIAL_UPPERBOUND`
pub fn divides_trivial_upperbound() -> @kernel.Thm {
  divides_trivial_upperbound_c.get()
}

///|
/// DIVIDES_FACT
fn step_31() -> Unit raise {
  let t65 = @list.List([
    @int.arith_tac,
    @meson.asm_meson_tac(
      @list.List([divides_lmul(), divides_rmul(), divides_refl()]),
    ),
  ])
  let t66 = @tactics.thenl(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.rewrite_tac(@list.List([@arith.fact(), @arith.le()])),
    ),
    t65,
  )
  divides_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, 1 <= p && p <= n → divides(p, FACT(n))"),
      t66,
    ),
  )
}

///|
let divides_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_FACT")

///|
/// `DIVIDES_FACT`
pub fn divides_fact() -> @kernel.Thm {
  divides_fact_c.get()
}

///|
/// DIVIDES_2
fn step_32() -> Unit raise {
  let t67 = @simp.rewrite_tac(
    @list.List([@int.divides(), @arith.even_exists()]),
  )
  divides_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, divides(2, n) == EVEN(n)"), t67),
  )
}

///|
let divides_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_2")

///|
/// `DIVIDES_2`
pub fn divides_2() -> @kernel.Thm {
  divides_2_c.get()
}

///|
/// DIVIDES_REXP_SUC
fn step_33() -> Unit raise {
  let t68 = @simp.rewrite_tac(@list.List([@arith.exp(), divides_rmul()]))
  divides_rexp_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, divides(x, y) → divides(x, EXP(y, SUC(n)))"),
      t68,
    ),
  )
}

///|
let divides_rexp_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_REXP_SUC",
)

///|
/// `DIVIDES_REXP_SUC`
pub fn divides_rexp_suc() -> @kernel.Thm {
  divides_rexp_suc_c.get()
}

///|
/// DIVIDES_REXP
fn step_34() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([divides_rexp_suc()]))
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t69,
  )
  divides_rexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, divides(x, y) && !(n == 0) → divides(x, EXP(y, n))"),
      t70,
    ),
  )
}

///|
let divides_rexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_REXP")

///|
/// `DIVIDES_REXP`
pub fn divides_rexp() -> @kernel.Thm {
  divides_rexp_c.get()
}

///|
/// FINITE_DIVISORS
fn step_35() -> Unit raise {
  let t75 = @meson.asm_meson_tac(@list.List([@int.divides_le()]))
  let t74 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t73 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_le()]))
  let t72 = @tactics.exists_tac(@term_syntax.parse_term("{(d : Num) | d <= (n : Num)}"))
  let t71 = @tactics.match_mp_tac(@sets.finite_subset())
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t71),
          t72,
        ),
        t73,
      ),
      t74,
    ),
    t75,
  )
  finite_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → FINITE({(d : Num) | divides(d, n)})"),
      t76,
    ),
  )
}

///|
let finite_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_DIVISORS",
)

///|
/// `FINITE_DIVISORS`
pub fn finite_divisors() -> @kernel.Thm {
  finite_divisors_c.get()
}

///|
/// FINITE_SPECIAL_DIVISORS
fn step_36() -> Unit raise {
  let t80 = @sets.set_tac(@list.List([]))
  let t79 = @simp.asm_simp_tac(@list.List([finite_divisors()]))
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("{(d : Num) | divides(d, (n : Num))}"))
  let t77 = @tactics.match_mp_tac(@sets.finite_subset())
  let t81 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t77),
        t78,
      ),
      t79,
    ),
    t80,
  )
  finite_special_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → FINITE({(d : Num) | (P : (Num) -> Bool)(d) && divides(d, n)})"),
      t81,
    ),
  )
}

///|
let finite_special_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_SPECIAL_DIVISORS",
)

///|
/// `FINITE_SPECIAL_DIVISORS`
pub fn finite_special_divisors() -> @kernel.Thm {
  finite_special_divisors_c.get()
}

///|
/// DIVISORS_EQ
fn step_37() -> Unit raise {
  let t82 = @meson.meson_tac(@list.List([divides_refl(), divides_trans()]))
  let t83 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_antisym())])),
    t82,
  )
  divisors_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == n) == (∀ d : Num, divides(d, m) == divides(d, n))"),
      t83,
    ),
  )
}

///|
let divisors_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISORS_EQ")

///|
/// `DIVISORS_EQ`
pub fn divisors_eq() -> @kernel.Thm {
  divisors_eq_c.get()
}

///|
/// MULTIPLES_EQ
fn step_38() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([divides_refl(), divides_trans()]))
  let t85 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_antisym())])),
    t84,
  )
  multiples_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == n) == (∀ d : Num, divides(m, d) == divides(n, d))"),
      t85,
    ),
  )
}

///|
let multiples_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIPLES_EQ")

///|
/// `MULTIPLES_EQ`
pub fn multiples_eq() -> @kernel.Thm {
  multiples_eq_c.get()
}

///|
/// DIVIDES_NSUM
fn step_39() -> Unit raise {
  let t88 = @simp.asm_simp_tac(
    @list.List([
      divides_0(),
      @iterate.nsum_clauses(),
      @sets.forall_in_insert(),
      divides_add(),
    ]),
  )
  let t87 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t86 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t89 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        t86,
      ),
      t87,
    ),
    t88,
  )
  divides_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ f : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) && (∀ i : _, IN(i, s) → divides(n, f(i))) → divides(n, nsum(s, f))"),
      t89,
    ),
  )
}

///|
let divides_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_NSUM")

///|
/// `DIVIDES_NSUM`
pub fn divides_nsum() -> @kernel.Thm {
  divides_nsum_c.get()
}

///|
/// DIVIDES_GCD
fn step_40() -> Unit raise {
  divides_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ d : Num, divides(d, gcd((a, b))) == (divides(d, a) && divides(d, b))"),
      @int.number_tac,
    ),
  )
}

///|
let divides_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_GCD")

///|
/// `DIVIDES_GCD`
pub fn divides_gcd() -> @kernel.Thm {
  divides_gcd_c.get()
}

///|
/// GCD_0
fn step_41() -> Unit raise {
  gcd_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, gcd((0, a)) == a) && (∀ a : Num, gcd((a, 0)) == a)"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_0")

///|
/// `GCD_0`
pub fn gcd_0() -> @kernel.Thm {
  gcd_0_c.get()
}

///|
/// GCD_ZERO
fn step_42() -> Unit raise {
  gcd_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, (gcd((a, b)) == 0) == (a == 0 && b == 0)"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_ZERO")

///|
/// `GCD_ZERO`
pub fn gcd_zero() -> @kernel.Thm {
  gcd_zero_c.get()
}

///|
/// GCD_REFL
fn step_43() -> Unit raise {
  gcd_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, gcd((a, a)) == a"), @int.number_tac),
  )
}

///|
let gcd_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_REFL")

///|
/// `GCD_REFL`
pub fn gcd_refl() -> @kernel.Thm {
  gcd_refl_c.get()
}

///|
/// GCD_1
fn step_44() -> Unit raise {
  gcd_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, gcd((1, a)) == 1) && (∀ a : Num, gcd((a, 1)) == 1)"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_1")

///|
/// `GCD_1`
pub fn gcd_1() -> @kernel.Thm {
  gcd_1_c.get()
}

///|
/// GCD_MULTIPLE
fn step_45() -> Unit raise {
  gcd_multiple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, gcd((b, a * b)) == b"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_multiple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_MULTIPLE")

///|
/// `GCD_MULTIPLE`
pub fn gcd_multiple() -> @kernel.Thm {
  gcd_multiple_c.get()
}

///|
/// GCD_ADD
fn step_46() -> Unit raise {
  gcd_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, ∀ b : Num, gcd((a + b, b)) == gcd((a, b))) && (∀ a : Num, ∀ b : Num, gcd((b + a, b)) == gcd((a, b))) && (∀ a : Num, ∀ b : Num, gcd((a, a + b)) == gcd((a, b))) && (∀ a : Num, ∀ b : Num, gcd((a, b + a)) == gcd((a, b)))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_ADD")

///|
/// `GCD_ADD`
pub fn gcd_add() -> @kernel.Thm {
  gcd_add_c.get()
}

///|
/// GCD_SUB
fn step_47() -> Unit raise {
  let t90 = @meson.meson_tac(@list.List([@arith.sub_add(), gcd_add()]))
  gcd_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, ∀ b : Num, b <= a → gcd((a - b, b)) == gcd((a, b))) && (∀ a : Num, ∀ b : Num, a <= b → gcd((a, b - a)) == gcd((a, b)))"),
      t90,
    ),
  )
}

///|
let gcd_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_SUB")

///|
/// `GCD_SUB`
pub fn gcd_sub() -> @kernel.Thm {
  gcd_sub_c.get()
}

///|
/// DIVIDES_GCD_LEFT
fn step_48() -> Unit raise {
  divides_gcd_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, n) == (gcd((m, n)) == m)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_gcd_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_GCD_LEFT",
)

///|
/// `DIVIDES_GCD_LEFT`
pub fn divides_gcd_left() -> @kernel.Thm {
  divides_gcd_left_c.get()
}

///|
/// DIVIDES_GCD_RIGHT
fn step_49() -> Unit raise {
  divides_gcd_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(n, m) == (gcd((m, n)) == n)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_gcd_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_GCD_RIGHT",
)

///|
/// `DIVIDES_GCD_RIGHT`
pub fn divides_gcd_right() -> @kernel.Thm {
  divides_gcd_right_c.get()
}

///|
/// GCD_COPRIME_LMUL
fn step_50() -> Unit raise {
  gcd_coprime_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) → gcd((a * b, c)) == gcd((a, c)) * gcd((b, c))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_coprime_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_COPRIME_LMUL",
)

///|
/// `GCD_COPRIME_LMUL`
pub fn gcd_coprime_lmul() -> @kernel.Thm {
  gcd_coprime_lmul_c.get()
}

///|
/// GCD_COPRIME_RMUL
fn step_51() -> Unit raise {
  gcd_coprime_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) → gcd((c, a * b)) == gcd((c, a)) * gcd((c, b))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_coprime_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_COPRIME_RMUL",
)

///|
/// `GCD_COPRIME_RMUL`
pub fn gcd_coprime_rmul() -> @kernel.Thm {
  gcd_coprime_rmul_c.get()
}

///|
/// DIVIDES_LMUL_GCD
fn step_52() -> Unit raise {
  divides_lmul_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, gcd((d, a)) * b) == divides(d, a * b)) && (∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, gcd((a, d)) * b) == divides(d, a * b))"),
      @int.number_tac,
    ),
  )
}

///|
let divides_lmul_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LMUL_GCD",
)

///|
/// `DIVIDES_LMUL_GCD`
pub fn divides_lmul_gcd() -> @kernel.Thm {
  divides_lmul_gcd_c.get()
}

///|
/// DIVIDES_RMUL_GCD
fn step_53() -> Unit raise {
  divides_rmul_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a * gcd((d, b))) == divides(d, a * b)) && (∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a * gcd((b, d))) == divides(d, a * b))"),
      @int.number_tac,
    ),
  )
}

///|
let divides_rmul_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_RMUL_GCD",
)

///|
/// `DIVIDES_RMUL_GCD`
pub fn divides_rmul_gcd() -> @kernel.Thm {
  divides_rmul_gcd_c.get()
}

///|
/// GCD_MUL_COPRIME
fn step_54() -> Unit raise {
  gcd_mul_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) → gcd((a, b * c)) == gcd((a, c))) && (∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, c)) → gcd((a, b * c)) == gcd((a, b))) && (∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((b, c)) → gcd((a, b * c)) == gcd((a, b)) * gcd((a, c))) && (∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, c)) → gcd((a * b, c)) == gcd((b, c))) && (∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((b, c)) → gcd((a * b, c)) == gcd((a, c))) && (∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) → gcd((a * b, c)) == gcd((a, c)) * gcd((b, c)))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_mul_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_MUL_COPRIME",
)

///|
/// `GCD_MUL_COPRIME`
pub fn gcd_mul_coprime() -> @kernel.Thm {
  gcd_mul_coprime_c.get()
}

///|
/// GCD_SYM
fn step_55() -> Unit raise {
  gcd_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, gcd((a, b)) == gcd((b, a))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_SYM")

///|
/// `GCD_SYM`
pub fn gcd_sym() -> @kernel.Thm {
  gcd_sym_c.get()
}

///|
/// GCD_ASSOC
fn step_56() -> Unit raise {
  gcd_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, gcd((a, gcd((b, c)))) == gcd((gcd((a, b)), c))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_ASSOC")

///|
/// `GCD_ASSOC`
pub fn gcd_assoc() -> @kernel.Thm {
  gcd_assoc_c.get()
}

///|
/// GCD_LMUL
fn step_57() -> Unit raise {
  gcd_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, gcd((c * a, c * b)) == c * gcd((a, b))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_LMUL")

///|
/// `GCD_LMUL`
pub fn gcd_lmul() -> @kernel.Thm {
  gcd_lmul_c.get()
}

///|
/// GCD_RMUL
fn step_58() -> Unit raise {
  gcd_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, gcd((a * c, b * c)) == c * gcd((a, b))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_RMUL")

///|
/// `GCD_RMUL`
pub fn gcd_rmul() -> @kernel.Thm {
  gcd_rmul_c.get()
}

///|
/// GCD_BEZOUT_SUM
fn step_59() -> Unit raise {
  gcd_bezout_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ d : Num, ∀ x : Num, ∀ y : Num, a * x + b * y == d → divides(gcd((a, b)), d)"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_bezout_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_BEZOUT_SUM")

///|
/// `GCD_BEZOUT_SUM`
pub fn gcd_bezout_sum() -> @kernel.Thm {
  gcd_bezout_sum_c.get()
}

///|
/// GCD_COPRIME_DIVIDES_LMUL
fn step_60() -> Unit raise {
  gcd_coprime_divides_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) && divides(a, c) → gcd((a * b, c)) == a * gcd((b, c))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_coprime_divides_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_COPRIME_DIVIDES_LMUL",
)

///|
/// `GCD_COPRIME_DIVIDES_LMUL`
pub fn gcd_coprime_divides_lmul() -> @kernel.Thm {
  gcd_coprime_divides_lmul_c.get()
}

///|
/// GCD_COPRIME_DIVIDES_RMUL
fn step_61() -> Unit raise {
  let t91 = @simp.rewrite_tac(@list.List([gcd_coprime_divides_lmul()]))
  let t92 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([gcd_sym()])),
    t91,
  )
  gcd_coprime_divides_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((b, c)) && divides(b, a) → gcd((a, b * c)) == b * gcd((a, c))"),
      t92,
    ),
  )
}

///|
let gcd_coprime_divides_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_COPRIME_DIVIDES_RMUL",
)

///|
/// `GCD_COPRIME_DIVIDES_RMUL`
pub fn gcd_coprime_divides_rmul() -> @kernel.Thm {
  gcd_coprime_divides_rmul_c.get()
}

///|
/// GCD_UNIQUE
fn step_62() -> Unit raise {
  let t97 = @simp.rewrite_tac(@list.List([@int.gcd()]))
  let t96 = @tactics.first_assum(@tactics.match_mp_tac)
  let t95 = @simp.asm_rewrite_tac(@list.List([divides_gcd()]))
  let t94 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t93 = @simp.asm_rewrite_tac(@list.List([@int.gcd()]))
  let t98 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              @tactics.strip_tac,
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
  )
  gcd_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, ((divides(d, a) && divides(d, b)) && (∀ e : Num, divides(e, a) && divides(e, b) → divides(e, d))) == (d == gcd((a, b)))"),
      t98,
    ),
  )
}

///|
let gcd_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_UNIQUE")

///|
/// `GCD_UNIQUE`
pub fn gcd_unique() -> @kernel.Thm {
  gcd_unique_c.get()
}

///|
/// GCD_EQ
fn step_63() -> Unit raise {
  let t99 = @meson.meson_tac(@list.List([@int.gcd()]))
  let t100 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([divides_gcd(), @equal.gsym(@int.divides_antisym())]),
    ),
    t99,
  )
  gcd_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : Num, (divides(d, (x : Num)) && divides(d, (y : Num))) == (divides(d, (u : Num)) && divides(d, (v : Num)))) → gcd((x, y)) == gcd((u, v))"),
      t100,
    ),
  )
}

///|
let gcd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_EQ")

///|
/// `GCD_EQ`
pub fn gcd_eq() -> @kernel.Thm {
  gcd_eq_c.get()
}

///|
/// BEZOUT_GCD_STRONG
fn step_64() -> Unit raise {
  let t127 = @simp.asm_rewrite_tac(
    @list.List([@int.int_of_num_eq(), @arith.add_eq_0(), gcd_zero()]),
  )
  let t126 = @simp.rewrite_tac(
    @list.List([
      @int.int_mul_rneg(),
      @int.int_of_num_mul(),
      @int.int_arith(
        @term_syntax.parse_term("(int_of_num((x : Num)) == -int_of_num((y : Num))) == (int_of_num(x) == int_of_num(0) && int_of_num(y) == int_of_num(0))"),
      ),
    ]),
  )
  let t125 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@int.num_gcd_v1()),
      @int.int_of_num_mul(),
      @int.int_of_num_add(),
      @int.int_of_num_eq(),
    ]),
  )
  let t124 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t123 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x120 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s121 = @tactics.mp_tac(x120)
      fn(
        x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s121(x122)
      }
    }),
  )
  let t128 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(
              @list.List([@int.int_divides(), @int.exists_int_cases()]),
            ),
            t123,
          ),
          t124,
        ),
        t125,
      ),
      t126,
    ),
    t127,
  )
  let t119 = @tactics.conv_tac(@int.integer_rule)
  let t129 = @list.List([
    @tactics.then_tac(
      @tactics.replicate_tac(
        2,
        @tactics.pop_assum(fn(
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
          let s117 = @tactics.mp_tac(x116)
          fn(
            x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s117(x118)
          }
        }),
      ),
      t119,
    ),
    t128,
  ])
  let t115 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(int_of_num((a : Num)), int_of_num((b : Num)) * int_of_num((r : Num)) + gcd((int_of_num(a), int_of_num(b))))"),
    fn(
      x112 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  )
  let t111 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t110 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t109 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_eq()]))
  let t107 = @term_syntax.parse_term("int_of_num((a : Num))")
  let t108 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(y : Int)"), t107]),
      @int.int_cong_num_exists(),
    ),
  )
  let t105 = @term_syntax.parse_term("(y : Int)")
  let t106 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Int)"), t105]),
  )
  let t104 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t103 = @tactics.mp_tac(
    @int.integer_rule(
      @term_syntax.parse_term("∃ x : Int, ∃ y : Int, int_of_num((a : Num)) * x == int_of_num((b : Num)) * y + gcd((int_of_num(a), int_of_num(b)))"),
    ),
  )
  let t102 = @simp.gen_rewrite_tac(
    fn(
      x101 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x101
    },
    @list.List([@theorems.swap_exists_thm()]),
  )
  let t130 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
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
                          t102,
                        ),
                        t103,
                      ),
                      t104,
                    ),
                    t106,
                  ),
                  @tactics.strip_tac,
                ),
                t108,
              ),
              t109,
            ),
            t110,
          ),
          t111,
        ),
        @tactics.disch_tac,
      ),
      t115,
    ),
    t129,
  )
  bezout_gcd_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, !(a == 0) → (∃ x : Num, ∃ y : Num, a * x == b * y + gcd((a, b)))"),
      t130,
    ),
  )
}

///|
let bezout_gcd_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BEZOUT_GCD_STRONG",
)

///|
/// `BEZOUT_GCD_STRONG`
pub fn bezout_gcd_strong() -> @kernel.Thm {
  bezout_gcd_strong_c.get()
}

///|
/// BEZOUT_ADD_STRONG
fn step_65() -> Unit raise {
  let t131 = @meson.meson_tac(@list.List([bezout_gcd_strong(), @int.gcd()]))
  bezout_add_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, !(a == 0) → (∃ d : Num, ∃ x : Num, ∃ y : Num, divides(d, a) && divides(d, b) && a * x == b * y + d)"),
      t131,
    ),
  )
}

///|
let bezout_add_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BEZOUT_ADD_STRONG",
)

///|
/// `BEZOUT_ADD_STRONG`
pub fn bezout_add_strong() -> @kernel.Thm {
  bezout_add_strong_c.get()
}

///|
/// BEZOUT_GCD
fn step_66() -> Unit raise {
  let t143 = @simp.rewrite_tac(@list.List([gcd_sym()]))
  let t142 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_exists()),
      @tactics.gen_tac,
    ),
  )
  let t141 = @simp.asm_rewrite_tac(@list.List([]))
  let t138 = @term_syntax.parse_term("(a : Num)")
  let t139 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(b : Num)"), t138]),
      bezout_gcd_strong(),
    ),
  )
  let t137 = @term_syntax.parse_term("(b : Num)")
  let t140 = @list.List([
    @tactics.mp_tac(
      @bool.specl(
        @list.List([@term_syntax.parse_term("(a : Num)"), t137]),
        bezout_gcd_strong(),
      ),
    ),
    t139,
  ])
  let t134 = @simp.rewrite_rule(@list.List([@class.de_morgan_thm()]))
  let t136 = @tactics.first_x_assum(fn(
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
    @tactics.disj_cases_tac(t134(x135))
  })
  let t133 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), gcd_0(), @arith.sub_0()]),
  )
  let t132 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0 && (b : Num) == 0"))
  let t144 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t132),
                t133,
              ),
              t136,
            ),
            t140,
          ),
          t141,
        ),
        t142,
      ),
      t143,
    ),
    @int.arith_tac,
  )
  bezout_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∃ x : Num, ∃ y : Num, a * x - b * y == gcd((a, b)) || b * x - a * y == gcd((a, b))"),
      t144,
    ),
  )
}

///|
let bezout_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEZOUT_GCD")

///|
/// `BEZOUT_GCD`
pub fn bezout_gcd() -> @kernel.Thm {
  bezout_gcd_c.get()
}

///|
/// BEZOUT_ADD
fn step_67() -> Unit raise {
  let t147 = @meson.asm_meson_tac(
    @list.List([bezout_add_strong(), @arith.mult_sym(), @arith.add_sym()]),
  )
  let t146 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.add_clauses(),
      divides_0(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t145 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0 && (b : Num) == 0"))
  let t148 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t145),
      t146,
    ),
    t147,
  )
  bezout_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∃ d : Num, ∃ x : Num, ∃ y : Num, (divides(d, a) && divides(d, b)) && (a * x == b * y + d || b * x == a * y + d)"),
      t148,
    ),
  )
}

///|
let bezout_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEZOUT_ADD")

///|
/// `BEZOUT_ADD`
pub fn bezout_add() -> @kernel.Thm {
  bezout_add_c.get()
}

///|
/// BEZOUT
fn step_68() -> Unit raise {
  let t149 = @meson.meson_tac(@list.List([bezout_gcd(), @int.gcd()]))
  bezout_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∃ d : Num, ∃ x : Num, ∃ y : Num, (divides(d, a) && divides(d, b)) && (a * x - b * y == d || b * x - a * y == d)"),
      t149,
    ),
  )
}

///|
let bezout_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEZOUT")

///|
/// `BEZOUT`
pub fn bezout() -> @kernel.Thm {
  bezout_c.get()
}

///|
/// GCD_BEZOUT
fn step_69() -> Unit raise {
  let t175 = @simp.rewrite_tac(@list.List([]))
  let t174 = @tactics.first_assum(
    @tactics.disj_cases_then(fn(
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
      let s172 = @tactics.subst1_tac(x171)
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
    }),
  )
  let t170 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.right_sub_distrib()), @arith.mult_assoc()]),
  )
  let t168 = @term_syntax.parse_term("(y : Num) * (k : Num)")
  let t169 = @tactics.map_every(
    fn(
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
      let s166 = @tactics.exists_tac(x165)
      fn(
        x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s166(x167)
      }
    },
    @list.List([@term_syntax.parse_term("(x : Num) * (k : Num)"), t168]),
  )
  let t163 = @term_syntax.parse_term("(b : Num)")
  let t164 = @tactics.strip_assume_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t163]), bezout_gcd()),
  )
  let t160 = @simp.rewrite_rule(@list.List([@int.divides()]))
  let t161 = @tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(
    x157 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s158 = @tactics.subst1_tac(x157)
    fn(
      x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s158(x159)
    }
  })
  let t176 = @tactics.then_tac(
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
              t161(t160(x162))
            }),
            t164,
          ),
          t169,
        ),
        t170,
      ),
      t174,
    ),
    t175,
  )
  let t156 = @simp.rewrite_tac(@list.List([@int.gcd()]))
  let t155 = @tactics.match_mp_tac(divides_rmul())
  let t154 = @tactics.match_mp_tac(divides_sub())
  let t177 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.strip_tac,
              @tactics.pop_assum(fn(
                x153 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
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
                  let s151 = @tactics.subst1_tac(x150)
                  fn(
                    x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s151(x152)
                  }
                })(@equal.sym(x153))
              }),
            ),
            t154,
          ),
          @tactics.conj_tac,
        ),
        t155,
      ),
      t156,
    ),
    t176,
  ])
  let t178 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t177,
  )
  gcd_bezout_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ d : Num, (∃ x : Num, ∃ y : Num, a * x - b * y == d || b * x - a * y == d) == divides(gcd((a, b)), d)"),
      t178,
    ),
  )
}

///|
let gcd_bezout_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_BEZOUT")

///|
/// `GCD_BEZOUT`
pub fn gcd_bezout() -> @kernel.Thm {
  gcd_bezout_c.get()
}

///|
/// GCD_LE
fn step_70() -> Unit raise {
  let t183 = @simp.asm_rewrite_tac(@list.List([@int.gcd()]))
  let t182 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t181 = @simp.asm_rewrite_tac(
    @list.List([gcd_0(), @arith.le_refl(), @arith.le()]),
  )
  let t179 = @term_syntax.parse_term("(n : Num) == 0")
  let t180 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t179]),
  )
  let t184 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t180),
        t181,
      ),
      t182,
    ),
    t183,
  )
  gcd_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (gcd((m, n)) <= m) == (m == 0 → n == 0)) && (∀ m : Num, ∀ n : Num, (gcd((m, n)) <= n) == (n == 0 → m == 0))"),
      t184,
    ),
  )
}

///|
let gcd_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_LE")

///|
/// `GCD_LE`
pub fn gcd_le() -> @kernel.Thm {
  gcd_le_c.get()
}

///|
/// GCD_LE_MIN_EQ
fn step_71() -> Unit raise {
  let t193 = @simp.asm_rewrite_tac(@list.List([@int.gcd()]))
  let t192 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t191 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((p : Num) <= MIN((m : Num), (n : Num))) == (p <= m && p <= n)")),
    ]),
  )
  let t189 = @int.arith_rule(@term_syntax.parse_term("MIN(0, (n : Num)) == 0"))
  let t190 = @simp.asm_rewrite_tac(
    @list.List([gcd_0(), @bool.conjunct1(@arith.le()), t189]),
  )
  let t188 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t186 = @int.arith_rule(@term_syntax.parse_term("MIN((m : Num), 0) == 0"))
  let t187 = @simp.asm_rewrite_tac(
    @list.List([gcd_0(), @bool.conjunct1(@arith.le()), t186]),
  )
  let t185 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t194 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t185),
                t187,
              ),
              t188,
            ),
            t190,
          ),
          t191,
        ),
        @tactics.conj_tac,
      ),
      t192,
    ),
    t193,
  )
  gcd_le_min_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (gcd((m, n)) <= MIN(m, n)) == ((m == 0) == (n == 0))"),
      t194,
    ),
  )
}

///|
let gcd_le_min_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_LE_MIN_EQ")

///|
/// `GCD_LE_MIN_EQ`
pub fn gcd_le_min_eq() -> @kernel.Thm {
  gcd_le_min_eq_c.get()
}

///|
/// GCD_LE_MIN
fn step_72() -> Unit raise {
  let t195 = @simp.rewrite_tac(@list.List([gcd_le_min_eq()]))
  gcd_le_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == 0) == (n == 0) → gcd((m, n)) <= MIN(m, n)"),
      t195,
    ),
  )
}

///|
let gcd_le_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_LE_MIN")

///|
/// `GCD_LE_MIN`
pub fn gcd_le_min() -> @kernel.Thm {
  gcd_le_min_c.get()
}

///|
/// GCD_LE_MAX
fn step_73() -> Unit raise {
  let t201 = @simp.asm_rewrite_tac(@list.List([gcd_le_min_eq()]))
  let t200 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(p : Num) <= MIN((m : Num), (n : Num)) → p <= MAX(m, n)")),
  )
  let t199 = @simp.asm_rewrite_tac(
    @list.List([
      gcd_0(),
      @int.arith_rule(@term_syntax.parse_term("MAX(0, (n : Num)) == n")),
      @arith.le_refl(),
    ]),
  )
  let t198 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t197 = @simp.asm_rewrite_tac(
    @list.List([
      gcd_0(),
      @int.arith_rule(@term_syntax.parse_term("MAX((m : Num), 0) == m")),
      @arith.le_refl(),
    ]),
  )
  let t196 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t196),
            t197,
          ),
          t198,
        ),
        t199,
      ),
      t200,
    ),
    t201,
  )
  gcd_le_max_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, gcd((m, n)) <= MAX(m, n)"), t202),
  )
}

///|
let gcd_le_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_LE_MAX")

///|
/// `GCD_LE_MAX`
pub fn gcd_le_max() -> @kernel.Thm {
  gcd_le_max_c.get()
}

///|
/// COPRIME
fn step_74() -> Unit raise {
  let t213 = @simp.asm_rewrite_tac(@list.List([]))
  let t211 = @tactics.then_tac(
    @tactics.first_assum(fn(
      x210 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x209 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x206 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s207 = @tactics.conv_tac(x206)
          fn(
            x208 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s207(x208)
          }
        })(@simp.rewr_conv(x209))
      })(@equal.gsym(x210))
    }),
    @tactics.conj_tac,
  )
  let t212 = @list.List([@tactics.first_assum(@tactics.match_mp_tac), t211])
  let t205 = @simp.asm_rewrite_tac(@list.List([divides_1()]))
  let t204 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.eq_tac, @tactics.strip_tac),
  )
  let t203 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t214 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t203),
          t204,
        ),
        t205,
      ),
      t212,
    ),
    t213,
  )
  coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) == (∀ d : Num, (divides(d, a) && divides(d, b)) == (d == 1))"),
      t214,
    ),
  )
}

///|
let coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME")

///|
/// `COPRIME`
pub fn coprime() -> @kernel.Thm {
  coprime_c.get()
}

///|
/// COPRIME_GCD
fn step_75() -> Unit raise {
  let t215 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_one())])),
    @int.number_tac,
  )
  coprime_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) == (gcd((a, b)) == 1)"),
      t215,
    ),
  )
}

///|
let coprime_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_GCD")

///|
/// `COPRIME_GCD`
pub fn coprime_gcd() -> @kernel.Thm {
  coprime_gcd_c.get()
}

///|
/// GCD_ONE
fn step_76() -> Unit raise {
  gcd_one_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) → gcd((a, b)) == 1"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_ONE")

///|
/// `GCD_ONE`
pub fn gcd_one() -> @kernel.Thm {
  gcd_one_c.get()
}

///|
/// COPRIME_SYM
fn step_77() -> Unit raise {
  coprime_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) == coprime((b, a))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_SYM")

///|
/// `COPRIME_SYM`
pub fn coprime_sym() -> @kernel.Thm {
  coprime_sym_c.get()
}

///|
/// COPRIME_BEZOUT
fn step_78() -> Unit raise {
  let t216 = @simp.rewrite_tac(
    @list.List([gcd_bezout(), @int.divides_one(), coprime_gcd()]),
  )
  coprime_bezout_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) == (∃ x : Num, ∃ y : Num, a * x - b * y == 1 || b * x - a * y == 1)"),
      t216,
    ),
  )
}

///|
let coprime_bezout_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_BEZOUT")

///|
/// `COPRIME_BEZOUT`
pub fn coprime_bezout() -> @kernel.Thm {
  coprime_bezout_c.get()
}

///|
/// COPRIME_DIVPROD
fn step_79() -> Unit raise {
  coprime_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a * b) && coprime((d, a)) → divides(d, b)"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_DIVPROD",
)

///|
/// `COPRIME_DIVPROD`
pub fn coprime_divprod() -> @kernel.Thm {
  coprime_divprod_c.get()
}

///|
/// COPRIME_1
fn step_80() -> Unit raise {
  coprime_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, coprime((a, 1))) && (∀ a : Num, coprime((1, a)))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_1")

///|
/// `COPRIME_1`
pub fn coprime_1() -> @kernel.Thm {
  coprime_1_c.get()
}

///|
/// GCD_COPRIME
fn step_81() -> Unit raise {
  gcd_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ a' : Num, ∀ b' : Num, !(gcd((a, b)) == 0) && a == a' * gcd((a, b)) && b == b' * gcd((a, b)) → coprime((a', b'))"),
      @int.number_tac,
    ),
  )
}

///|
let gcd_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_COPRIME")

///|
/// `GCD_COPRIME`
pub fn gcd_coprime() -> @kernel.Thm {
  gcd_coprime_c.get()
}

///|
/// GCD_COPRIME_EXISTS
fn step_82() -> Unit raise {
  let t234 = @meson.asm_meson_tac(
    @list.List([gcd_coprime(), @arith.mult_sym()]),
  )
  let t233 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_exists()),
      @tactics.gen_tac,
    ),
  )
  let t232 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t231 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_and_exists_thm()]),
  )
  let t230 = @term_syntax.parse_term("(b : Num)")
  let t235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.conjunct1(
              @bool.specl(
                @list.List([@term_syntax.parse_term("(a : Num)"), t230]),
                @int.gcd(),
              ),
            ),
          ),
          t231,
        ),
        t232,
      ),
      t233,
    ),
    t234,
  )
  let t229 = @tactics.conv_tac(@int.number_rule)
  let t228 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t226 = @term_syntax.parse_term("1")
  let t227 = @tactics.map_every(
    fn(
      x223 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s224 = @tactics.exists_tac(x223)
      fn(
        x225 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s224(x225)
      }
    },
    @list.List([@term_syntax.parse_term("0"), t226]),
  )
  let t221 = @simp.rewrite_rule(@list.List([gcd_zero()]))
  let t236 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_assum(fn(
            x222 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
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
              let s219 = @tactics.assume_tac(x218)
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
            })(t221(x222))
          }),
          t227,
        ),
        t228,
      ),
      t229,
    ),
    t235,
  ])
  let t217 = @class.asm_cases_tac(@term_syntax.parse_term("gcd(((a : Num), (b : Num))) == 0"))
  let t237 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t217),
    t236,
  )
  gcd_coprime_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∃ a' : Num, ∃ b' : Num, a == a' * gcd((a, b)) && b == b' * gcd((a, b)) && coprime((a', b'))"),
      t237,
    ),
  )
}

///|
let gcd_coprime_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_COPRIME_EXISTS",
)

///|
/// `GCD_COPRIME_EXISTS`
pub fn gcd_coprime_exists() -> @kernel.Thm {
  gcd_coprime_exists_c.get()
}

///|
/// COPRIME_DIVPROD_IFF
fn step_83() -> Unit raise {
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
  let t247 = @term_syntax.parse_term("(a' : Num)")
  let t250 = @tactics.disch_then(fn(
    x249 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x244 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s245 = @tactics.mp_tac(x244)
      fn(
        x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s245(x246)
      }
    })(((x248 : @kernel.Thm) => @bool.spec(t247, x248))(x249))
  })
  let t242 = @term_syntax.parse_term("(b' : Num)")
  let t243 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a' : Num)"), t242]),
  )
  let t241 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t239 = @term_syntax.parse_term("(a : Num)")
  let t240 = @tactics.mp_tac(
    @equal.gsym(
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(d : Num)"), t239]),
        gcd_coprime_exists(),
      ),
    ),
  )
  let t238 = @list.List([@tactics.all_tac, @tactics.conv_tac(@int.number_rule)])
  let t255 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    t238,
                  ),
                  t240,
                ),
                t241,
              ),
              t243,
            ),
            @tactics.strip_tac,
          ),
          t250,
        ),
        @tactics.ants_tac,
      ),
      t254,
    ),
    @int.number_tac,
  )
  coprime_divprod_iff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, !(d == 0) → (∀ b : Num, divides(d, a * b) → divides(d, b)) == coprime((d, a))"),
      t255,
    ),
  )
}

///|
let coprime_divprod_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_DIVPROD_IFF",
)

///|
/// `COPRIME_DIVPROD_IFF`
pub fn coprime_divprod_iff() -> @kernel.Thm {
  coprime_divprod_iff_c.get()
}

///|
/// CONG_MULT_LCANCEL_IFF
fn step_84() -> Unit raise {
  let t265 = @tactics.conv_tac(@int.number_rule)
  let t264 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_clauses(),
      @int.number_rule(@term_syntax.parse_term("op_eq_eq(0, (x : Num), mod((n : Num))) == divides(n, x)")),
      coprime_divprod_iff(),
    ]),
  )
  let t260 = @term_syntax.parse_term("0")
  let t263 = @tactics.disch_then(fn(
    x262 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s258 = @tactics.mp_tac(x257)
      fn(
        x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s258(x259)
      }
    })(((x261 : @kernel.Thm) => @bool.spec(t260, x261))(x262))
  })
  let t256 = @list.List([@tactics.all_tac, @tactics.conv_tac(@int.number_rule)])
  let t266 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.strip_tac),
            @tactics.eq_tac,
          ),
          t256,
        ),
        t263,
      ),
      t264,
    ),
    t265,
  )
  cong_mult_lcancel_iff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(n == 0) → (∀ x : Num, ∀ y : Num, op_eq_eq(a * x, a * y, mod(n)) → op_eq_eq(x, y, mod(n))) == coprime((a, n))"),
      t266,
    ),
  )
}

///|
let cong_mult_lcancel_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_LCANCEL_IFF",
)

///|
/// `CONG_MULT_LCANCEL_IFF`
pub fn cong_mult_lcancel_iff() -> @kernel.Thm {
  cong_mult_lcancel_iff_c.get()
}

///|
/// CONG_MULT_RCANCEL_IFF
fn step_85() -> Unit raise {
  let t267 = @simp.rewrite_tac(@list.List([cong_mult_lcancel_iff()]))
  let t268 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
    t267,
  )
  cong_mult_rcancel_iff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(n == 0) → (∀ x : Num, ∀ y : Num, op_eq_eq(x * a, y * a, mod(n)) → op_eq_eq(x, y, mod(n))) == coprime((a, n))"),
      t268,
    ),
  )
}

///|
let cong_mult_rcancel_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_RCANCEL_IFF",
)

///|
/// `CONG_MULT_RCANCEL_IFF`
pub fn cong_mult_rcancel_iff() -> @kernel.Thm {
  cong_mult_rcancel_iff_c.get()
}

///|
/// COPRIME_0
fn step_86() -> Unit raise {
  coprime_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : Num, coprime((d, 0)) == (d == 1)) && (∀ d : Num, coprime((0, d)) == (d == 1))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_0")

///|
/// `COPRIME_0`
pub fn coprime_0() -> @kernel.Thm {
  coprime_0_c.get()
}

///|
/// COPRIME_MUL
fn step_87() -> Unit raise {
  coprime_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, coprime((d, a)) && coprime((d, b)) → coprime((d, a * b))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_MUL")

///|
/// `COPRIME_MUL`
pub fn coprime_mul() -> @kernel.Thm {
  coprime_mul_c.get()
}

///|
/// COPRIME_LMUL2
fn step_88() -> Unit raise {
  coprime_lmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, coprime((d, a * b)) → coprime((d, b))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_lmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_LMUL2")

///|
/// `COPRIME_LMUL2`
pub fn coprime_lmul2() -> @kernel.Thm {
  coprime_lmul2_c.get()
}

///|
/// COPRIME_RMUL2
fn step_89() -> Unit raise {
  coprime_rmul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, coprime((d, a * b)) → coprime((d, a))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_rmul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_RMUL2")

///|
/// `COPRIME_RMUL2`
pub fn coprime_rmul2() -> @kernel.Thm {
  coprime_rmul2_c.get()
}

///|
/// COPRIME_LMUL
fn step_90() -> Unit raise {
  coprime_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, coprime((a * b, d)) == (coprime((a, d)) && coprime((b, d)))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_LMUL")

///|
/// `COPRIME_LMUL`
pub fn coprime_lmul() -> @kernel.Thm {
  coprime_lmul_c.get()
}

///|
/// COPRIME_RMUL
fn step_91() -> Unit raise {
  coprime_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, coprime((d, a * b)) == (coprime((d, a)) && coprime((d, b)))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_RMUL")

///|
/// `COPRIME_RMUL`
pub fn coprime_rmul() -> @kernel.Thm {
  coprime_rmul_c.get()
}

///|
/// COPRIME_EXP
fn step_92() -> Unit raise {
  let t273 = @simp.asm_rewrite_tac(@list.List([]))
  let t272 = @tactics.first_assum(@tactics.match_mp_tac)
  let t271 = @simp.asm_rewrite_tac(@list.List([]))
  let t270 = @tactics.match_mp_tac(coprime_mul())
  let t269 = @tactics.repeat_tac(@tactics.gen_tac)
  let t274 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @nums.induct_tac,
                @simp.rewrite_tac(@list.List([@arith.exp(), coprime_1()])),
              ),
              t269,
            ),
            @tactics.disch_tac,
          ),
          t270,
        ),
        t271,
      ),
      t272,
    ),
    t273,
  )
  coprime_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ d : Num, coprime((d, a)) → coprime((d, EXP(a, n)))"),
      t274,
    ),
  )
}

///|
let coprime_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_EXP")

///|
/// `COPRIME_EXP`
pub fn coprime_exp() -> @kernel.Thm {
  coprime_exp_c.get()
}

///|
/// COPRIME_EXP_IMP
fn step_93() -> Unit raise {
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t278 = @simp.once_rewrite_tac(@list.List([coprime_sym()]))
  let t277 = @tactics.match_mp_tac(coprime_exp())
  let t276 = @simp.once_rewrite_tac(@list.List([coprime_sym()]))
  let t275 = @tactics.match_mp_tac(coprime_exp())
  let t280 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @tactics.disch_tac,
            ),
            t275,
          ),
          t276,
        ),
        t277,
      ),
      t278,
    ),
    t279,
  )
  coprime_exp_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, coprime((a, b)) → coprime((EXP(a, n), EXP(b, n)))"),
      t280,
    ),
  )
}

///|
let coprime_exp_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_EXP_IMP",
)

///|
/// `COPRIME_EXP_IMP`
pub fn coprime_exp_imp() -> @kernel.Thm {
  coprime_exp_imp_c.get()
}

///|
/// COPRIME_REXP
fn step_94() -> Unit raise {
  let t285 = @tactics.conv_tac(@int.number_rule)
  let t284 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t283 = @simp.asm_simp_tac(@list.List([coprime_exp(), @nums.not_suc()]))
  let t282 = @tactics.repeat_tac(@tactics.strip_tac)
  let t281 = @simp.rewrite_tac(
    @list.List([@bool.conjunct1(@arith.exp()), coprime_1()]),
  )
  let t286 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                @nums.induct_tac,
              ),
              t281,
            ),
            t282,
          ),
          @tactics.eq_tac,
        ),
        t283,
      ),
      t284,
    ),
    t285,
  )
  coprime_rexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ k : Num, coprime((m, EXP(n, k))) == (coprime((m, n)) || k == 0)"),
      t286,
    ),
  )
}

///|
let coprime_rexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_REXP")

///|
/// `COPRIME_REXP`
pub fn coprime_rexp() -> @kernel.Thm {
  coprime_rexp_c.get()
}

///|
/// COPRIME_LEXP
fn step_95() -> Unit raise {
  let t287 = @simp.rewrite_tac(@list.List([coprime_rexp()]))
  let t288 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([coprime_sym()])),
    t287,
  )
  coprime_lexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ k : Num, coprime((EXP(m, k), n)) == (coprime((m, n)) || k == 0)"),
      t288,
    ),
  )
}

///|
let coprime_lexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_LEXP")

///|
/// `COPRIME_LEXP`
pub fn coprime_lexp() -> @kernel.Thm {
  coprime_lexp_c.get()
}

///|
/// COPRIME_EXP2
fn step_96() -> Unit raise {
  let t289 = @simp.rewrite_tac(
    @list.List([coprime_rexp(), coprime_lexp(), @theorems.disj_aci()]),
  )
  coprime_exp2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ k : Num, coprime((EXP(m, k), EXP(n, k))) == (coprime((m, n)) || k == 0)"),
      t289,
    ),
  )
}

///|
let coprime_exp2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_EXP2")

///|
/// `COPRIME_EXP2`
pub fn coprime_exp2() -> @kernel.Thm {
  coprime_exp2_c.get()
}

///|
/// COPRIME_EXP2_SUC
fn step_97() -> Unit raise {
  let t290 = @simp.rewrite_tac(@list.List([coprime_exp2(), @nums.not_suc()]))
  coprime_exp2_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, coprime((EXP(a, SUC(n)), EXP(b, SUC(n)))) == coprime((a, b))"),
      t290,
    ),
  )
}

///|
let coprime_exp2_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_EXP2_SUC",
)

///|
/// `COPRIME_EXP2_SUC`
pub fn coprime_exp2_suc() -> @kernel.Thm {
  coprime_exp2_suc_c.get()
}

///|
/// COPRIME_NPRODUCT_EQ
fn step_98() -> Unit raise {
  let t301 = @simp.simp_tac(
    @list.List([coprime_rmul(), @sets.forall_in_insert()]),
  )
  let t300 = @simp.simp_tac(
    @list.List([@iterate.nproduct_clauses(), @sets.not_in_empty(), coprime_1()]),
  )
  let t299 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t298 = @simp.rewrite_tac(@list.List([]))
  let t302 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x297 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x291 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s292 = @equal.rand_conv(x291)
                    fn(x293 : @kernel.Term) -> @kernel.Thm raise { s292(x293) }
                  })(
                    (fn(
                      x294 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s295 = @equal.once_depth_conv(x294)
                      fn(x296 : @kernel.Term) -> @kernel.Thm raise {
                        s295(x296)
                      }
                    })(x297),
                  )
                },
                @list.List([coprime_sym()]),
              ),
              t298,
            ),
            @tactics.gen_tac,
          ),
          @tactics.gen_tac,
        ),
        t299,
      ),
      t300,
    ),
    t301,
  )
  coprime_nproduct_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (A) -> Num, ∀ a : Num, ∀ s : (A) -> Bool, FINITE(s) → coprime((a, nproduct(s, f))) == (∀ i : A, IN(i, s) → coprime((a, f(i))))) && (∀ f : (A) -> Num, ∀ b : Num, ∀ s : (A) -> Bool, FINITE(s) → coprime((nproduct(s, f), b)) == (∀ i : A, IN(i, s) → coprime((f(i), b))))"),
      t302,
    ),
  )
}

///|
let coprime_nproduct_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_NPRODUCT_EQ",
)

///|
/// `COPRIME_NPRODUCT_EQ`
pub fn coprime_nproduct_eq() -> @kernel.Thm {
  coprime_nproduct_eq_c.get()
}

///|
/// COPRIME_NPRODUCT
fn step_99() -> Unit raise {
  let t303 = @simp.simp_tac(@list.List([coprime_nproduct_eq()]))
  coprime_nproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ n : Num, FINITE(s) && (∀ x : _, IN(x, s) → coprime((n, (a : (_) -> Num)(x)))) → coprime((n, nproduct(s, a)))"),
      t303,
    ),
  )
}

///|
let coprime_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_NPRODUCT",
)

///|
/// `COPRIME_NPRODUCT`
pub fn coprime_nproduct() -> @kernel.Thm {
  coprime_nproduct_c.get()
}

///|
/// COPRIME_DIVISORS
fn step_100() -> Unit raise {
  coprime_divisors_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ d : Num, ∀ e : Num, divides(d, a) && divides(e, b) && coprime((a, b)) → coprime((d, e))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_DIVISORS",
)

///|
/// `COPRIME_DIVISORS`
pub fn coprime_divisors() -> @kernel.Thm {
  coprime_divisors_c.get()
}

///|
/// COPRIME_REFL
fn step_101() -> Unit raise {
  coprime_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, coprime((n, n)) == (n == 1)"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_REFL")

///|
/// `COPRIME_REFL`
pub fn coprime_refl() -> @kernel.Thm {
  coprime_refl_c.get()
}

///|
/// COPRIME_PLUS1
fn step_102() -> Unit raise {
  coprime_plus1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, coprime((n + 1, n))"), @int.number_tac),
  )
}

///|
let coprime_plus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_PLUS1")

///|
/// `COPRIME_PLUS1`
pub fn coprime_plus1() -> @kernel.Thm {
  coprime_plus1_c.get()
}

///|
/// COPRIME_MINUS1
fn step_103() -> Unit raise {
  let t312 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n - (n - 1) == 1")),
      @int.divides_one(),
    ]),
  )
  let t309 = @drule.match_mp(divides_sub())
  let t311 = @tactics.disch_then(fn(
    x310 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x306 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s307 = @tactics.mp_tac(x306)
      fn(
        x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s307(x308)
      }
    })(t309(x310))
  })
  let t305 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t304 = @simp.simp_tac(@list.List([@int.coprime()]))
  let t313 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t304),
          t305,
        ),
        @tactics.gen_tac,
      ),
      t311,
    ),
    t312,
  )
  coprime_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → coprime((n - 1, n))"),
      t313,
    ),
  )
}

///|
let coprime_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_MINUS1")

///|
/// `COPRIME_MINUS1`
pub fn coprime_minus1() -> @kernel.Thm {
  coprime_minus1_c.get()
}

///|
/// GCD_EXP
fn step_104() -> Unit raise {
  let t323 = @simp.asm_rewrite_tac(@list.List([coprime_lexp(), coprime_rexp()]))
  let t322 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(coprime_gcd()), @arith.exp_eq_1()]),
  )
  let t321 = @tactics.match_mp_tac(
    @grobner.num_ring(@term_syntax.parse_term("(x : Num) == 1 && (y : Num) == 1 → (a : Num) * x == a * y")),
  )
  let t320 = @simp.rewrite_tac(@list.List([@arith.mult_exp(), gcd_rmul()]))
  let t319 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t317 = @term_syntax.parse_term("(b' : Num)")
  let t318 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a' : Num)"), t317]),
  )
  let t316 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t314 = @term_syntax.parse_term("(b : Num)")
  let t315 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t314]),
      gcd_coprime_exists(),
    ),
  )
  let t324 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t315,
                  ),
                  t316,
                ),
                t318,
              ),
              @tactics.strip_tac,
            ),
            t319,
          ),
          t320,
        ),
        t321,
      ),
      t322,
    ),
    t323,
  )
  gcd_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, gcd((EXP(a, n), EXP(b, n))) == EXP(gcd((a, b)), n)"),
      t324,
    ),
  )
}

///|
let gcd_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_EXP")

///|
/// `GCD_EXP`
pub fn gcd_exp() -> @kernel.Thm {
  gcd_exp_c.get()
}

///|
/// DIVIDES_EXP2_REV
fn step_105() -> Unit raise {
  let t325 = @meson.meson_tac(@list.List([]))
  let t326 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([divides_gcd_left(), gcd_exp(), @arith.exp_mono_eq()]),
    ),
    t325,
  )
  divides_exp2_rev_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, divides(EXP(a, n), EXP(b, n)) && !(n == 0) → divides(a, b)"),
      t326,
    ),
  )
}

///|
let divides_exp2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EXP2_REV",
)

///|
/// `DIVIDES_EXP2_REV`
pub fn divides_exp2_rev() -> @kernel.Thm {
  divides_exp2_rev_c.get()
}

///|
/// DIVIDES_EXP2_EQ
fn step_106() -> Unit raise {
  let t327 = @meson.meson_tac(@list.List([divides_exp2_rev(), divides_exp()]))
  divides_exp2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, !(n == 0) → divides(EXP(a, n), EXP(b, n)) == divides(a, b)"),
      t327,
    ),
  )
}

///|
let divides_exp2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EXP2_EQ",
)

///|
/// `DIVIDES_EXP2_EQ`
pub fn divides_exp2_eq() -> @kernel.Thm {
  divides_exp2_eq_c.get()
}

///|
/// DIVIDES_MUL
fn step_107() -> Unit raise {
  divides_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ r : Num, divides(m, r) && divides(n, r) && coprime((m, n)) → divides(m * n, r)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_MUL")

///|
/// `DIVIDES_MUL`
pub fn divides_mul() -> @kernel.Thm {
  divides_mul_c.get()
}

///|
/// DIVISION_DECOMP
fn step_108() -> Unit raise {
  let t340 = @tactics.conv_tac(@int.number_rule)
  let t339 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t335 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t334 = @term_syntax.parse_term("(b : Num)")
  let t341 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.specl(
            @list.List([@term_syntax.parse_term("(a : Num)"), t334]),
            gcd_coprime_exists(),
          ),
        ),
        t335,
      ),
      t339,
    ),
    t340,
  )
  let t333 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), divides_1()]),
  )
  let t332 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([gcd_zero()])),
  )
  let t331 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t342 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t331),
        t332,
      ),
      t333,
    ),
    t341,
  ])
  let t330 = @class.asm_cases_tac(@term_syntax.parse_term("gcd(((a : Num), (b : Num))) == 0"))
  let t329 = @simp.rewrite_tac(@list.List([@int.gcd()]))
  let t328 = @tactics.exists_tac(@term_syntax.parse_term("gcd(((a : Num), (b : Num)))"))
  let t343 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.disch_tac,
          ),
          t328,
        ),
        t329,
      ),
      t330,
    ),
    t342,
  )
  division_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, divides(a, b * c) → (∃ b' : Num, ∃ c' : Num, a == b' * c' && divides(b', b) && divides(c', c))"),
      t343,
    ),
  )
}

///|
let division_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVISION_DECOMP",
)

///|
/// `DIVISION_DECOMP`
pub fn division_decomp() -> @kernel.Thm {
  division_decomp_c.get()
}

///|
/// PRIME_0
fn step_109() -> Unit raise {
  let t352 = @simp.rewrite_tac(@list.List([divides_0(), @calc_num.arith()]))
  let t347 = @term_syntax.parse_term("2")
  let t351 = @tactics.disch_then(fn(
    x350 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      (fn(
        x344 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s345 = @tactics.mp_tac(x344)
        fn(
          x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s345(x346)
        }
      })(((x348 : @kernel.Thm) => @bool.spec(t347, x348))(x349))
    })(@bool.conjunct2(x350))
  })
  let t353 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.prime()])), t351),
    t352,
  )
  prime_0_c.set(@tactics.prove(@term_syntax.parse_term("!prime(0)"), t353))
}

///|
let prime_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_0")

///|
/// `PRIME_0`
pub fn prime_0() -> @kernel.Thm {
  prime_0_c.get()
}

///|
/// PRIME_1
fn step_110() -> Unit raise {
  let t354 = @simp.rewrite_tac(@list.List([@int.prime()]))
  prime_1_c.set(@tactics.prove(@term_syntax.parse_term("!prime(1)"), t354))
}

///|
let prime_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_1")

///|
/// `PRIME_1`
pub fn prime_1() -> @kernel.Thm {
  prime_1_c.get()
}

///|
/// PRIME_ALT
fn step_111() -> Unit raise {
  let t357 = @meson.asm_meson_tac(
    @list.List([@int.divides_le_strong(), divides_0(), @arith.le_1()]),
  )
  let t356 = @simp.rewrite_tac(@list.List([@int.prime(), @arith.lt_le()]))
  let t355 = @simp.asm_rewrite_tac(@list.List([prime_0()]))
  let t358 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")),
        ),
        t355,
      ),
      t356,
    ),
    t357,
  )
  prime_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) == (!(p == 0) && !(p == 1) && (∀ n : Num, 1 < n && n < p → !divides(n, p)))"),
      t358,
    ),
  )
}

///|
let prime_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_ALT")

///|
/// `PRIME_ALT`
pub fn prime_alt() -> @kernel.Thm {
  prime_alt_c.get()
}

///|
/// PRIME_2
fn step_112() -> Unit raise {
  let t359 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([prime_alt()])),
    @int.arith_tac,
  )
  prime_2_c.set(@tactics.prove(@term_syntax.parse_term("prime(2)"), t359))
}

///|
let prime_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_2")

///|
/// `PRIME_2`
pub fn prime_2() -> @kernel.Thm {
  prime_2_c.get()
}

///|
/// PRIME_COPRIME_STRONG
fn step_113() -> Unit raise {
  let t360 = @meson.meson_tac(@list.List([]))
  let t361 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.prime(), @int.coprime()])),
    t360,
  )
  prime_coprime_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) → divides(p, n) || coprime((p, n))"),
      t361,
    ),
  )
}

///|
let prime_coprime_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_COPRIME_STRONG",
)

///|
/// `PRIME_COPRIME_STRONG`
pub fn prime_coprime_strong() -> @kernel.Thm {
  prime_coprime_strong_c.get()
}

///|
/// PRIME_COPRIME
fn step_114() -> Unit raise {
  let t362 = @meson.meson_tac(@list.List([prime_coprime_strong()]))
  prime_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) → n == 1 || divides(p, n) || coprime((p, n))"),
      t362,
    ),
  )
}

///|
let prime_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_COPRIME")

///|
/// `PRIME_COPRIME`
pub fn prime_coprime() -> @kernel.Thm {
  prime_coprime_c.get()
}

///|
/// PRIME_COPRIME_EQ
fn step_115() -> Unit raise {
  let t363 = @simp.simp_tac(@list.List([@int.prime_coprime_eq_nondivisible()]))
  prime_coprime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(p) → coprime((p, n)) == !divides(p, n)"),
      t363,
    ),
  )
}

///|
let prime_coprime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_COPRIME_EQ",
)

///|
/// `PRIME_COPRIME_EQ`
pub fn prime_coprime_eq() -> @kernel.Thm {
  prime_coprime_eq_c.get()
}

///|
/// COPRIME_PRIME
fn step_116() -> Unit raise {
  let t364 = @meson.meson_tac(@list.List([@int.coprime(), prime_1()]))
  coprime_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, coprime((a, b)) → !(prime(p) && divides(p, a) && divides(p, b))"),
      t364,
    ),
  )
}

///|
let coprime_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_PRIME")

///|
/// `COPRIME_PRIME`
pub fn coprime_prime() -> @kernel.Thm {
  coprime_prime_c.get()
}

///|
/// PRIME_DIVPROD
fn step_117() -> Unit raise {
  let t365 = @meson.meson_tac(
    @list.List([prime_coprime_strong(), coprime_divprod()]),
  )
  prime_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && divides(p, a * b) → divides(p, a) || divides(p, b)"),
      t365,
    ),
  )
}

///|
let prime_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_DIVPROD")

///|
/// `PRIME_DIVPROD`
pub fn prime_divprod() -> @kernel.Thm {
  prime_divprod_c.get()
}

///|
/// PRIME_DIVPROD_EQ
fn step_118() -> Unit raise {
  let t366 = @meson.meson_tac(
    @list.List([prime_divprod(), divides_lmul(), divides_rmul()]),
  )
  prime_divprod_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) → divides(p, a * b) == (divides(p, a) || divides(p, b))"),
      t366,
    ),
  )
}

///|
let prime_divprod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVPROD_EQ",
)

///|
/// `PRIME_DIVPROD_EQ`
pub fn prime_divprod_eq() -> @kernel.Thm {
  prime_divprod_eq_c.get()
}

///|
/// PRIME_INT_DIVPROD_EQ
fn step_119() -> Unit raise {
  let t368 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@int.num_divides()),
      prime_divprod_eq(),
      @int.int_of_num_clauses(),
    ]),
  )
  let t367 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("divides((a : Int), -(b : Int)) == divides(a, b)"),
      ),
    ]),
  )
  let t369 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @int.forall_int_cases(),
          @int.int_mul_lneg(),
          @int.int_mul_rneg(),
          @int.int_neg_neg(),
        ]),
      ),
      t367,
    ),
    t368,
  )
  prime_int_divprod_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Int, ∀ b : Int, prime(p) → divides(int_of_num(p), a * b) == (divides(int_of_num(p), a) || divides(int_of_num(p), b))"),
      t369,
    ),
  )
}

///|
let prime_int_divprod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_INT_DIVPROD_EQ",
)

///|
/// `PRIME_INT_DIVPROD_EQ`
pub fn prime_int_divprod_eq() -> @kernel.Thm {
  prime_int_divprod_eq_c.get()
}

///|
/// PRIME_GE_2
fn step_120() -> Unit raise {
  let t370 = @meson.meson_tac(@list.List([prime_0(), prime_1()]))
  let t371 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("(2 <= (p : Num)) == (!(p == 0) && !(p == 1))")),
      ]),
    ),
    t370,
  )
  prime_ge_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → 2 <= p"), t371),
  )
}

///|
let prime_ge_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_GE_2")

///|
/// `PRIME_GE_2`
pub fn prime_ge_2() -> @kernel.Thm {
  prime_ge_2_c.get()
}

///|
/// PRIME_FACTOR
fn step_121() -> Unit raise {
  let t387 = @meson.asm_meson_tac(
    @list.List([divides_trans(), @arith.lt_refl()]),
  )
  let t386 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_2(), divides_0()])),
    @tactics.all_tac,
  ])
  let t385 = @simp.asm_rewrite_tac(
    @list.List([
      @class.de_morgan_thm(),
      @class.not_forall_thm(),
      @class.not_imp(),
    ]),
  )
  let t382 = @simp.gen_rewrite_rule(
    fn(
      x379 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s380 = @equal.rand_conv(x379)
      fn(x381 : @kernel.Term) -> @kernel.Thm raise { s380(x381) }
    },
    @list.List([prime_alt()]),
  )
  let t384 = @tactics.first_x_assum(fn(
    x383 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(t382(x383))
  })
  let t375 = @list.List([
    @meson.asm_meson_tac(@list.List([divides_refl()])),
    @tactics.all_tac,
  ])
  let t374 = @class.asm_cases_tac(@term_syntax.parse_term("prime((n : Num))"))
  let t373 = @tactics.repeat_tac(@tactics.strip_tac)
  let t372 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t388 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.match_mp_tac(@arith.num_wf()),
                    t372,
                  ),
                  t373,
                ),
                t374,
              ),
              t375,
            ),
            t384,
          ),
          t385,
        ),
        @tactics.strip_tac,
      ),
      t386,
    ),
    t387,
  )
  prime_factor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 1) → (∃ p : Num, prime(p) && divides(p, n))"),
      t388,
    ),
  )
}

///|
let prime_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_FACTOR")

///|
/// `PRIME_FACTOR`
pub fn prime_factor() -> @kernel.Thm {
  prime_factor_c.get()
}

///|
/// PRIME
fn step_122() -> Unit raise {
  let t416 = @meson.meson_tac(@list.List([@arith.le_1()]))
  let t415 = @simp.asm_rewrite_tac(
    @list.List([@arith.mod_lt_eq(), @int.coprime_rmod(), @int.divides_mod()]),
  )
  let t412 = @term_syntax.parse_term("MOD((n : Num), (p : Num))")
  let t417 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
        x414 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
          let s410 = @tactics.mp_tac(x409)
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
        })(((x413 : @kernel.Thm) => @bool.spec(t412, x413))(x414))
      }),
      t415,
    ),
    t416,
  )
  let t406 = @drule.match_mp(@int.divides_le_strong())
  let t408 = @tactics.first_x_assum(fn(
    x407 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x403 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s404 = @tactics.mp_tac(x403)
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
        s404(x405)
      }
    })(t406(x407))
  })
  let t402 = @simp.asm_rewrite_tac(@list.List([]))
  let t399 = @term_syntax.parse_term("(n : Num)")
  let t418 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.strip_tac,
            @tactics.first_x_assum(fn(
              x401 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              @tactics.disj_cases_tac(
                ((x400 : @kernel.Thm) => @bool.spec(t399, x400))(x401),
              )
            }),
          ),
          t402,
        ),
        t408,
      ),
      @int.asm_arith_tac,
    ),
    t417,
  ])
  let t398 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t397 = @tactics.disch_then(fn(
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
    let s395 = @tactics.subst1_tac(x394)
    fn(
      x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s395(x396)
    }
  })
  let t393 = @simp.asm_rewrite_tac(@list.List([]))
  let t392 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(p : Num)"),
      @int.one_or_prime_divides_or_coprime(),
    ),
  )
  let t391 = @simp.asm_rewrite_tac(@list.List([prime_1()]))
  let t390 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t389 = @simp.asm_rewrite_tac(@list.List([prime_0()]))
  let t419 = @tactics.thenl(
    @tactics.then_tac(
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
                        @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")),
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
            t397,
          ),
          @tactics.eq_tac,
        ),
        @tactics.disch_tac,
      ),
      t398,
    ),
    t418,
  )
  prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) == (!(p == 0) && !(p == 1) && (∀ m : Num, 0 < m && m < p → coprime((p, m))))"),
      t419,
    ),
  )
}

///|
let prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME")

///|
/// `PRIME`
pub fn prime() -> @kernel.Thm {
  prime_c.get()
}

///|
/// PRIME_PRIME_FACTOR
fn step_123() -> Unit raise {
  let t433 = @meson.asm_meson_tac(
    @list.List([divides_trans(), @int.divides_antisym()]),
  )
  let t429 = @drule.match_mp(prime_factor())
  let t430 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
    @tactics.strip_assume_tac,
  )
  let t432 = @tactics.first_assum(fn(
    x431 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t430(t429(x431))
  })
  let t428 = @simp.asm_rewrite_tac(@list.List([]))
  let t427 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t426 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t425 = @list.List([
    @meson.meson_tac(@list.List([prime_1()])),
    @tactics.all_tac,
  ])
  let t424 = @simp.asm_rewrite_tac(@list.List([]))
  let t423 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t434 = @tactics.then_tac(
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
                          @tactics.gen_tac,
                          @simp.gen_rewrite_tac(
                            fn(
                              x420 : (@kernel.Term) -> @kernel.Thm raise,
                            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                              let s421 = @equal.land_conv(x420)
                              fn(x422 : @kernel.Term) -> @kernel.Thm raise {
                                s421(x422)
                              }
                            },
                            @list.List([@int.prime()]),
                          ),
                        ),
                        t423,
                      ),
                      t424,
                    ),
                    @tactics.eq_tac,
                  ),
                  t425,
                ),
                @tactics.strip_tac,
              ),
              t426,
            ),
            t427,
          ),
          t428,
        ),
        @tactics.disch_tac,
      ),
      t432,
    ),
    t433,
  )
  prime_prime_factor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, prime(n) == (!(n == 1) && (∀ p : Num, prime(p) && divides(p, n) → p == n))"),
      t434,
    ),
  )
}

///|
let prime_prime_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_PRIME_FACTOR",
)

///|
/// `PRIME_PRIME_FACTOR`
pub fn prime_prime_factor() -> @kernel.Thm {
  prime_prime_factor_c.get()
}

///|
/// PRIME_FACTOR_LT
fn step_124() -> Unit raise {
  let t444 = @drule.match_mp(prime_ge_2())
  let t446 = @tactics.first_x_assum(fn(
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
    (fn(
      x441 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s442 = @tactics.mp_tac(x441)
      fn(
        x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s442(x443)
      }
    })(t444(x445))
  })
  let t440 = @simp.asm_simp_tac(
    @list.List([
      @arith.lt_mult_rcancel(),
      @int.arith_rule(@term_syntax.parse_term("((m : Num) < (p : Num) * m) == (1 * m < p * m)")),
    ]),
  )
  let t439 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()])),
  )
  let t438 = @tactics.first_x_assum(fn(
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
    let s436 = @tactics.subst_all_tac(x435)
    fn(
      x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s436(x437)
    }
  })
  let t447 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t438),
          t439,
        ),
        t440,
      ),
      t446,
    ),
    @int.arith_tac,
  )
  prime_factor_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ p : Num, prime(p) && !(n == 0) && n == p * m → m < n"),
      t447,
    ),
  )
}

///|
let prime_factor_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTOR_LT",
)

///|
/// `PRIME_FACTOR_LT`
pub fn prime_factor_lt() -> @kernel.Thm {
  prime_factor_lt_c.get()
}

///|
/// COPRIME_PRIME_EQ
fn step_125() -> Unit raise {
  let t463 = @simp.asm_rewrite_tac(@list.List([]))
  let t462 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t461 = @tactics.match_mp_tac(divides_trans())
  let t460 = @simp.asm_rewrite_tac(@list.List([]))
  let t459 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t456 = @drule.match_mp(prime_factor())
  let t454 = @term_syntax.parse_term("(p : Num)")
  let t458 = @tactics.first_assum(fn(
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
    ((x455 : @kernel.Thm) => @tactics.x_choose_tac(t454, x455))(t456(x457))
  })
  let t453 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t452 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t451 = @simp.once_rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t450 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t464 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t450,
                      ),
                      t451,
                    ),
                    t452,
                  ),
                  t453,
                ),
                t458,
              ),
              t459,
            ),
            t460,
          ),
          @tactics.conj_tac,
        ),
        t461,
      ),
      t462,
    ),
    t463,
  )
  let t465 = @list.List([
    @tactics.disch_then(fn(
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
      let th = x448
      @simp.rewrite_tac(@list.List([@drule.match_mp(coprime_prime())(th)]))
    }),
    t464,
  ])
  let t466 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t465,
  )
  coprime_prime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) == (∀ p : Num, !(prime(p) && divides(p, a) && divides(p, b)))"),
      t466,
    ),
  )
}

///|
let coprime_prime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_PRIME_EQ",
)

///|
/// `COPRIME_PRIME_EQ`
pub fn coprime_prime_eq() -> @kernel.Thm {
  coprime_prime_eq_c.get()
}

///|
/// GCD_PRIME_CASES
fn step_126() -> Unit raise {
  let t478 = @meson.asm_meson_tac(@list.List([prime_coprime_eq()]))
  let t477 = @simp.rewrite_tac(@list.List([@equal.gsym(coprime_gcd())]))
  let t476 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(divides_gcd_left())]),
  )
  let t475 = @tactics.repeat_tac(@tactics.gen_tac)
  let t474 = @simp.rewrite_tac(@list.List([]))
  let t479 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x473 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x467 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s468 = @equal.rand_conv(x467)
                    fn(x469 : @kernel.Term) -> @kernel.Thm raise { s468(x469) }
                  })(
                    (fn(
                      x470 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s471 = @equal.once_depth_conv(x470)
                      fn(x472 : @kernel.Term) -> @kernel.Thm raise {
                        s471(x472)
                      }
                    })(x473),
                  )
                },
                @list.List([gcd_sym()]),
              ),
              t474,
            ),
            t475,
          ),
          @class.cond_cases_tac,
        ),
        t476,
      ),
      t477,
    ),
    t478,
  )
  gcd_prime_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Num, ∀ n : Num, prime(p) → gcd((p, n)) == (if divides(p, n) { p } else { 1 })) && (∀ p : Num, ∀ n : Num, prime(p) → gcd((n, p)) == (if divides(p, n) { p } else { 1 }))"),
      t479,
    ),
  )
}

///|
let gcd_prime_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_PRIME_CASES",
)

///|
/// `GCD_PRIME_CASES`
pub fn gcd_prime_cases() -> @kernel.Thm {
  gcd_prime_cases_c.get()
}

///|
/// GCD_2_CASES
fn step_127() -> Unit raise {
  let t480 = @simp.simp_tac(
    @list.List([gcd_prime_cases(), prime_2(), divides_2()]),
  )
  gcd_2_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, gcd((2, n)) == (if EVEN(n) { 2 } else { 1 })) && (∀ n : Num, gcd((n, 2)) == (if EVEN(n) { 2 } else { 1 }))"),
      t480,
    ),
  )
}

///|
let gcd_2_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_2_CASES")

///|
/// `GCD_2_CASES`
pub fn gcd_2_cases() -> @kernel.Thm {
  gcd_2_cases_c.get()
}

///|
/// COPRIME_PRIMEPOW
fn step_128() -> Unit raise {
  let t482 = @simp.simp_tac(@list.List([prime_coprime_eq()]))
  let t481 = @simp.once_rewrite_tac(@list.List([coprime_sym()]))
  let t483 = @tactics.then_tac(
    @tactics.then_tac(@simp.simp_tac(@list.List([coprime_rexp()])), t481),
    t482,
  )
  coprime_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, ∀ m : Num, prime(p) && !(k == 0) → coprime((m, EXP(p, k))) == !divides(p, m)"),
      t483,
    ),
  )
}

///|
let coprime_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_PRIMEPOW",
)

///|
/// `COPRIME_PRIMEPOW`
pub fn coprime_primepow() -> @kernel.Thm {
  coprime_primepow_c.get()
}

///|
/// COPRIME_BEZOUT_STRONG
fn step_129() -> Unit raise {
  let t497 = @meson.asm_meson_tac(@list.List([coprime_0(), coprime_sym()]))
  let t496 = @tactics.match_mp_tac(bezout_gcd_strong())
  let t495 = @tactics.disch_then(fn(
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
      let s492 = @tactics.subst1_tac(x491)
      fn(
        x493 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s492(x493)
      }
    })(@equal.sym(x494))
  })
  let t488 = @simp.gen_rewrite_rule(
    fn(
      x487 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x487
    },
    @list.List([coprime_gcd()]),
  )
  let t490 = @tactics.first_assum(fn(
    x489 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s485 = @tactics.mp_tac(x484)
      fn(
        x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s485(x486)
      }
    })(t488(x489))
  })
  let t498 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t490,
        ),
        t495,
      ),
      t496,
    ),
    t497,
  )
  coprime_bezout_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) && !(b == 1) → (∃ x : Num, ∃ y : Num, a * x == b * y + 1)"),
      t498,
    ),
  )
}

///|
let coprime_bezout_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_BEZOUT_STRONG",
)

///|
/// `COPRIME_BEZOUT_STRONG`
pub fn coprime_bezout_strong() -> @kernel.Thm {
  coprime_bezout_strong_c.get()
}

///|
/// COPRIME_BEZOUT_ALT
fn step_130() -> Unit raise {
  let t512 = @meson.asm_meson_tac(@list.List([coprime_0(), coprime_sym()]))
  let t511 = @tactics.match_mp_tac(bezout_gcd_strong())
  let t510 = @tactics.disch_then(fn(
    x509 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s507 = @tactics.subst1_tac(x506)
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
    })(@equal.sym(x509))
  })
  let t503 = @simp.gen_rewrite_rule(
    fn(
      x502 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x502
    },
    @list.List([coprime_gcd()]),
  )
  let t505 = @tactics.first_assum(fn(
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
    (fn(
      x499 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s500 = @tactics.mp_tac(x499)
      fn(
        x501 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s500(x501)
      }
    })(t503(x504))
  })
  let t513 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t505,
        ),
        t510,
      ),
      t511,
    ),
    t512,
  )
  coprime_bezout_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) && !(a == 0) → (∃ x : Num, ∃ y : Num, a * x == b * y + 1)"),
      t513,
    ),
  )
}

///|
let coprime_bezout_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_BEZOUT_ALT",
)

///|
/// `COPRIME_BEZOUT_ALT`
pub fn coprime_bezout_alt() -> @kernel.Thm {
  coprime_bezout_alt_c.get()
}

///|
/// BEZOUT_PRIME
fn step_131() -> Unit raise {
  let t514 = @meson.meson_tac(
    @list.List([
      prime_coprime_strong(),
      coprime_sym(),
      coprime_bezout_strong(),
      prime_1(),
    ]),
  )
  bezout_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && !divides(p, a) → (∃ x : Num, ∃ y : Num, a * x == p * y + 1)"),
      t514,
    ),
  )
}

///|
let bezout_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEZOUT_PRIME")

///|
/// `BEZOUT_PRIME`
pub fn bezout_prime() -> @kernel.Thm {
  bezout_prime_c.get()
}

///|
/// PRIME_DIVEXP
fn step_132() -> Unit raise {
  let t529 = @simp.asm_rewrite_tac(@list.List([]))
  let t528 = @tactics.first_assum(@tactics.match_mp_tac)
  let t527 = @simp.asm_rewrite_tac(@list.List([]))
  let t524 = @drule.match_mp(prime_divprod())
  let t526 = @tactics.disch_then(fn(
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
    @tactics.disj_cases_tac(t524(x525))
  })
  let t530 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
            let th = x521
            let t523 = @tactics.mp_tac(th)
            @tactics.then_tac(@tactics.assume_tac(@bool.conjunct1(th)), t523)
          }),
          t526,
        ),
        t527,
      ),
      t528,
    ),
    t529,
  )
  let t520 = @simp.rewrite_tac(@list.List([divides_1()]))
  let t531 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
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
          x516 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s517 = @tactics.subst1_tac(x516)
          fn(
            x518 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s517(x518)
          }
        })(@bool.conjunct2(x519))
      }),
      t520,
    ),
    t530,
  ])
  let t515 = @simp.rewrite_tac(@list.List([@arith.exp(), @int.divides_one()]))
  let t532 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@nums.induct_tac, @tactics.repeat_tac(@tactics.gen_tac)),
      t515,
    ),
    t531,
  )
  prime_divexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ x : Num, prime(p) && divides(p, EXP(x, n)) → divides(p, x)"),
      t532,
    ),
  )
}

///|
let prime_divexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_DIVEXP")

///|
/// `PRIME_DIVEXP`
pub fn prime_divexp() -> @kernel.Thm {
  prime_divexp_c.get()
}

///|
/// PRIME_DIVEXP_N
fn step_133() -> Unit raise {
  let t539 = @tactics.match_accept_tac(divides_exp())
  let t536 = @drule.match_mp(prime_divexp())
  let t538 = @tactics.disch_then(fn(
    x537 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s534 = @tactics.mp_tac(x533)
      fn(
        x535 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s534(x535)
      }
    })(t536(x537))
  })
  let t540 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t538),
    t539,
  )
  prime_divexp_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ x : Num, prime(p) && divides(p, EXP(x, n)) → divides(EXP(p, n), EXP(x, n))"),
      t540,
    ),
  )
}

///|
let prime_divexp_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_DIVEXP_N")

///|
/// `PRIME_DIVEXP_N`
pub fn prime_divexp_n() -> @kernel.Thm {
  prime_divexp_n_c.get()
}

///|
/// PRIME_DIVEXP_EQ
fn step_134() -> Unit raise {
  let t543 = @meson.asm_meson_tac(
    @list.List([prime_divexp(), divides_rexp(), prime_1()]),
  )
  let t542 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @int.divides_one()]),
  )
  let t541 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t544 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t541),
      t542,
    ),
    t543,
  )
  prime_divexp_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ x : Num, prime(p) → divides(p, EXP(x, n)) == (divides(p, x) && !(n == 0))"),
      t544,
    ),
  )
}

///|
let prime_divexp_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVEXP_EQ",
)

///|
/// `PRIME_DIVEXP_EQ`
pub fn prime_divexp_eq() -> @kernel.Thm {
  prime_divexp_eq_c.get()
}

///|
/// COPRIME_SOS
fn step_135() -> Unit raise {
  coprime_sos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, coprime((x, y)) → coprime((x * y, EXP(x, 2) + EXP(y, 2)))"),
      @int.number_tac,
    ),
  )
}

///|
let coprime_sos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_SOS")

///|
/// `COPRIME_SOS`
pub fn coprime_sos() -> @kernel.Thm {
  coprime_sos_c.get()
}

///|
/// PRIME_IMP_NZ
fn step_136() -> Unit raise {
  let t545 = @meson.meson_tac(@list.List([prime_0()]))
  prime_imp_nz_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → !(p == 0)"), t545),
  )
}

///|
let prime_imp_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_IMP_NZ")

///|
/// `PRIME_IMP_NZ`
pub fn prime_imp_nz() -> @kernel.Thm {
  prime_imp_nz_c.get()
}

///|
/// DISTINCT_PRIME_COPRIME
fn step_137() -> Unit raise {
  let t546 = @meson.meson_tac(
    @list.List([@int.prime(), @int.coprime(), prime_1()]),
  )
  distinct_prime_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ q : Num, prime(p) && prime(q) && !(p == q) → coprime((p, q))"),
      t546,
    ),
  )
}

///|
let distinct_prime_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DISTINCT_PRIME_COPRIME",
)

///|
/// `DISTINCT_PRIME_COPRIME`
pub fn distinct_prime_coprime() -> @kernel.Thm {
  distinct_prime_coprime_c.get()
}

///|
/// PRIME_COPRIME_LT
fn step_138() -> Unit raise {
  let t547 = @meson.meson_tac(
    @list.List([@arith.lt_refl(), @int.divides_le(), @arith.not_lt(), prime_0()]),
  )
  let t548 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.coprime(), @int.prime()])),
    t547,
  )
  prime_coprime_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ p : Num, prime(p) && 0 < x && x < p → coprime((x, p))"),
      t548,
    ),
  )
}

///|
let prime_coprime_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_COPRIME_LT",
)

///|
/// `PRIME_COPRIME_LT`
pub fn prime_coprime_lt() -> @kernel.Thm {
  prime_coprime_lt_c.get()
}

///|
/// DIVIDES_PRIME_PRIME
fn step_139() -> Unit raise {
  let t549 = @meson.meson_tac(
    @list.List([divides_refl(), distinct_prime_coprime(), prime_coprime_eq()]),
  )
  divides_prime_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ q : Num, prime(p) && prime(q) → divides(p, q) == (p == q)"),
      t549,
    ),
  )
}

///|
let divides_prime_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_PRIME_PRIME",
)

///|
/// `DIVIDES_PRIME_PRIME`
pub fn divides_prime_prime() -> @kernel.Thm {
  divides_prime_prime_c.get()
}

///|
/// COPRIME_PRIME_PRIME
fn step_140() -> Unit raise {
  let t550 = @meson.meson_tac(
    @list.List([prime_coprime_eq(), divides_prime_prime(), coprime_sym()]),
  )
  coprime_prime_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ q : Num, prime(p) && prime(q) → coprime((p, q)) == !(p == q)"),
      t550,
    ),
  )
}

///|
let coprime_prime_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_PRIME_PRIME",
)

///|
/// `COPRIME_PRIME_PRIME`
pub fn coprime_prime_prime() -> @kernel.Thm {
  coprime_prime_prime_c.get()
}

///|
/// DIVIDES_PRIME_EXP_LE
fn step_141() -> Unit raise {
  let t556 = @meson.asm_meson_tac(
    @list.List([
      prime_divexp(),
      divides_prime_prime(),
      @arith.exp(),
      divides_rmul2(),
    ]),
  )
  let t555 = @simp.asm_simp_tac(
    @list.List([
      divides_exp_le(),
      prime_ge_2(),
      @equal.gsym(@bool.conjunct2(@arith.exp())),
    ]),
  )
  let t554 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == (q : Num)"))
  let t553 = @list.List([
    @meson.meson_tac(
      @list.List([
        prime_1(),
        @int.arith_rule(@term_syntax.parse_term("!(SUC((m : Num)) <= 0)")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t552 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp(),
      divides_1(),
      @int.divides_one(),
      @arith.mult_eq_1(),
      @nums.not_suc(),
    ]),
  )
  let t551 = @tactics.repeat_tac(@nums.induct_tac)
  let t557 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
              t551,
            ),
            t552,
          ),
          t553,
        ),
        t554,
      ),
      t555,
    ),
    t556,
  )
  divides_prime_exp_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ m : Num, ∀ n : Num, prime(p) && prime(q) → divides(EXP(p, m), EXP(q, n)) == (m == 0 || p == q && m <= n)"),
      t557,
    ),
  )
}

///|
let divides_prime_exp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_PRIME_EXP_LE",
)

///|
/// `DIVIDES_PRIME_EXP_LE`
pub fn divides_prime_exp_le() -> @kernel.Thm {
  divides_prime_exp_le_c.get()
}

///|
/// EQ_PRIME_EXP
fn step_142() -> Unit raise {
  let t562 = @simp.asm_simp_tac(@list.List([divides_prime_exp_le()]))
  let t561 = @simp.gen_rewrite_tac(
    fn(
      x558 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s559 = @equal.land_conv(x558)
      fn(x560 : @kernel.Term) -> @kernel.Thm raise { s559(x560) }
    },
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t563 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t561),
      t562,
    ),
    @int.arith_tac,
  )
  eq_prime_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ m : Num, ∀ n : Num, prime(p) && prime(q) → (EXP(p, m) == EXP(q, n)) == (m == 0 && n == 0 || p == q && m == n)"),
      t563,
    ),
  )
}

///|
let eq_prime_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_PRIME_EXP")

///|
/// `EQ_PRIME_EXP`
pub fn eq_prime_exp() -> @kernel.Thm {
  eq_prime_exp_c.get()
}

///|
/// PRIME_ODD
fn step_143() -> Unit raise {
  let t575 = @meson.meson_tac(@list.List([]))
  let t574 = @simp.rewrite_tac(@list.List([@int.divides(), @calc_num.arith()]))
  let t570 = @term_syntax.parse_term("2")
  let t573 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x564 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s565 = @tactics.assume_tac(x564)
        fn(
          x566 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s565(x566)
        }
      },
      fn(
        x572 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x567 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s568 = @tactics.mp_tac(x567)
          fn(
            x569 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s568(x569)
          }
        })(((x571 : @kernel.Thm) => @bool.spec(t570, x571))(x572))
      },
    ),
  )
  let t576 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([
              @int.prime(),
              @equal.gsym(@arith.not_even()),
              @arith.even_exists(),
            ]),
          ),
        ),
        t573,
      ),
      t574,
    ),
    t575,
  )
  prime_odd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → p == 2 || ODD(p)"), t576),
  )
}

///|
let prime_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_ODD")

///|
/// `PRIME_ODD`
pub fn prime_odd() -> @kernel.Thm {
  prime_odd_c.get()
}

///|
/// ODD_PRIME
fn step_144() -> Unit raise {
  let t587 = @simp.asm_simp_tac(@list.List([@calc_num.arith()]))
  let t586 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t583 = @drule.match_mp(prime_odd())
  let t585 = @tactics.disch_then(fn(
    x584 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s581 = @tactics.mp_tac(x580)
      fn(
        x582 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s581(x582)
      }
    })(t583(x584))
  })
  let t579 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_1()])),
    @tactics.all_tac,
  ])
  let t578 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t577 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_0()])),
    @tactics.all_tac,
  ])
  let t588 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")),
                ),
                t577,
              ),
              t578,
            ),
            t579,
          ),
          t585,
        ),
        t586,
      ),
      t587,
    ),
    @int.asm_arith_tac,
  )
  odd_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → ODD(p) == (3 <= p)"),
      t588,
    ),
  )
}

///|
let odd_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_PRIME")

///|
/// `ODD_PRIME`
pub fn odd_prime() -> @kernel.Thm {
  odd_prime_c.get()
}

///|
/// DIVIDES_FACT_PRIME
fn step_145() -> Unit raise {
  let t590 = @meson.asm_meson_tac(
    @list.List([
      prime_divprod_eq(),
      @int.divides_le(),
      @nums.not_suc(),
      divides_refl(),
      @int.arith_rule(
        @term_syntax.parse_term("!((p : Num) <= (n : Num)) && p <= SUC(n) → p == SUC(n)"),
      ),
    ]),
  )
  let t591 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides_one(), prime_0(), prime_1()])),
    t590,
  ])
  let t589 = @simp.rewrite_tac(@list.List([@arith.fact(), @arith.le()]))
  let t592 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        @nums.induct_tac,
      ),
      t589,
    ),
    t591,
  )
  divides_fact_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → (∀ n : Num, divides(p, FACT(n)) == (p <= n))"),
      t592,
    ),
  )
}

///|
let divides_fact_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_FACT_PRIME",
)

///|
/// `DIVIDES_FACT_PRIME`
pub fn divides_fact_prime() -> @kernel.Thm {
  divides_fact_prime_c.get()
}

///|
/// EQ_PRIMEPOW
fn step_146() -> Unit raise {
  let t594 = @meson.meson_tac(@list.List([prime_1()]))
  let t593 = @simp.simp_tac(@list.List([@arith.le_exp(), prime_imp_nz()]))
  let t595 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())])),
      t593,
    ),
    t594,
  )
  eq_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, prime(p) → (EXP(p, m) == EXP(p, n)) == (m == n)"),
      t595,
    ),
  )
}

///|
let eq_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_PRIMEPOW")

///|
/// `EQ_PRIMEPOW`
pub fn eq_primepow() -> @kernel.Thm {
  eq_primepow_c.get()
}

///|
/// COPRIME_2
fn step_147() -> Unit raise {
  let t603 = @simp.simp_tac(
    @list.List([prime_coprime_eq(), prime_2(), divides_2(), @arith.not_even()]),
  )
  let t604 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x602 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x596 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s597 = @equal.rand_conv(x596)
          fn(x598 : @kernel.Term) -> @kernel.Thm raise { s597(x598) }
        })(
          (fn(
            x599 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s600 = @equal.once_depth_conv(x599)
            fn(x601 : @kernel.Term) -> @kernel.Thm raise { s600(x601) }
          })(x602),
        )
      },
      @list.List([coprime_sym()]),
    ),
    t603,
  )
  coprime_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, coprime((2, n)) == ODD(n)) && (∀ n : Num, coprime((n, 2)) == ODD(n))"),
      t604,
    ),
  )
}

///|
let coprime_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_2")

///|
/// `COPRIME_2`
pub fn coprime_2() -> @kernel.Thm {
  coprime_2_c.get()
}

///|
/// DIVIDES_EXP_PLUS1
fn step_148() -> Unit raise {
  let t614 = @tactics.pop_assum(fn(
    x611 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s612 = @tactics.mp_tac(x611)
    fn(
      x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s612(x613)
    }
  })
  let t610 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.exp_2()]))
  let t609 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("SUC(2 * SUC((n : Num))) == SUC(2 * n) + 2")),
    ]),
  )
  let t608 = @simp.rewrite_tac(@list.List([@arith.exp_1(), divides_refl()]))
  let t607 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t606 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2()]))
  let t605 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t615 = @tactics.then_tac(
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
                          @arith.odd_exists(),
                          @theorems.left_imp_exists_thm(),
                        ]),
                      ),
                    ),
                    t605,
                  ),
                  t606,
                ),
                @nums.induct_tac,
              ),
              t607,
            ),
            t608,
          ),
          t609,
        ),
        t610,
      ),
      t614,
    ),
    @int.number_tac,
  )
  divides_exp_plus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, ODD(k) → divides(n + 1, EXP(n, k) + 1)"),
      t615,
    ),
  )
}

///|
let divides_exp_plus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EXP_PLUS1",
)

///|
/// `DIVIDES_EXP_PLUS1`
pub fn divides_exp_plus1() -> @kernel.Thm {
  divides_exp_plus1_c.get()
}

///|
/// DIVIDES_EXP_MINUS1
fn step_149() -> Unit raise {
  let t630 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x627 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s628 = @tactics.mp_tac(x627)
      fn(
        x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s628(x629)
      }
    }),
  )
  let t626 = @simp.rewrite_tac(@list.List([@int.int_pow_v1()]))
  let t624 = @term_syntax.parse_term("(k : Num)")
  let t625 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t624)
  let t623 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_pow())]))
  let t622 = @tactics.pop_assum(fn(
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
    @tactics.all_tac
  })
  let t620 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_sub()),
      @arith.le_1(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
    ]),
  )
  let t631 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@int.num_divides()])),
                  t620,
                ),
                t622,
              ),
              t623,
            ),
            t625,
          ),
          @nums.induct_tac,
        ),
        t626,
      ),
      t630,
    ),
    @int.integer_tac,
  )
  let t619 = @simp.rewrite_tac(@list.List([divides_refl()]))
  let t618 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t617 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @arith.mult_clauses()]),
  )
  let t632 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.struct_cases_tac(
            @bool.spec(@term_syntax.parse_term("(k : Num)"), @nums.num_cases()),
          ),
          t617,
        ),
        t618,
      ),
      t619,
    ),
    t631,
  ])
  let t616 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t633 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t616),
    t632,
  )
  divides_exp_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ n : Num, divides(n - 1, EXP(n, k) - 1)"),
      t633,
    ),
  )
}

///|
let divides_exp_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_EXP_MINUS1",
)

///|
/// `DIVIDES_EXP_MINUS1`
pub fn divides_exp_minus1() -> @kernel.Thm {
  divides_exp_minus1_c.get()
}

///|
/// PRIME_IRREDUCIBLE
fn step_150() -> Unit raise {
  let t635 = @meson.meson_tac(@list.List([prime_0(), prime_1()]))
  let t634 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((p : Num) > 1) == (!(p == 0) && !(p == 1))")),
    ]),
  )
  let t636 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@equal.gsym(@int.zero_one_or_prime())])),
      ),
      t634,
    ),
    t635,
  )
  prime_irreducible_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) == (p > 1 && (∀ a : Num, ∀ b : Num, divides(p, a * b) → divides(p, a) || divides(p, b)))"),
      t636,
    ),
  )
}

///|
let prime_irreducible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_IRREDUCIBLE",
)

///|
/// `PRIME_IRREDUCIBLE`
pub fn prime_irreducible() -> @kernel.Thm {
  prime_irreducible_c.get()
}

///|
/// COPRIME_EXP_DIVPROD
fn step_151() -> Unit raise {
  let t637 = @meson.meson_tac(
    @list.List([coprime_divprod(), coprime_exp(), coprime_sym()]),
  )
  coprime_exp_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ n : Num, ∀ a : Num, ∀ b : Num, divides(EXP(d, n), a * b) && coprime((d, a)) → divides(EXP(d, n), b)"),
      t637,
    ),
  )
}

///|
let coprime_exp_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_EXP_DIVPROD",
)

///|
/// `COPRIME_EXP_DIVPROD`
pub fn coprime_exp_divprod() -> @kernel.Thm {
  coprime_exp_divprod_c.get()
}

///|
/// PRIME_COPRIME_CASES
fn step_152() -> Unit raise {
  let t638 = @meson.meson_tac(@list.List([coprime_prime(), prime_coprime_eq()]))
  prime_coprime_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && coprime((a, b)) → coprime((p, a)) || coprime((p, b))"),
      t638,
    ),
  )
}

///|
let prime_coprime_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_COPRIME_CASES",
)

///|
/// `PRIME_COPRIME_CASES`
pub fn prime_coprime_cases() -> @kernel.Thm {
  prime_coprime_cases_c.get()
}

///|
/// PRIME_DIVPROD_POW_GEN
fn step_153() -> Unit raise {
  let t650 = @meson.asm_meson_tac(
    @list.List([coprime_lexp(), coprime_divprod(), @arith.mult_sym()]),
  )
  let t649 = @simp.asm_simp_tac(
    @list.List([@class.de_morgan_thm(), @equal.gsym(prime_coprime_eq())]),
  )
  let t646 = @simp.gen_rewrite_rule(
    fn(
      x643 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s644 = @equal.rand_conv(x643)
      fn(x645 : @kernel.Term) -> @kernel.Thm raise { s644(x645) }
    },
    @list.List([divides_gcd()]),
  )
  let t648 = @tactics.first_x_assum(fn(
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
      x640 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s641 = @tactics.mp_tac(x640)
      fn(
        x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s641(x642)
      }
    })(t646(x647))
  })
  let t639 = @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()]))
  let t651 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t639),
        t648,
      ),
      t649,
    ),
    t650,
  )
  prime_divprod_pow_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && !divides(p, gcd((a, b))) && divides(EXP(p, n), a * b) → divides(EXP(p, n), a) || divides(EXP(p, n), b)"),
      t651,
    ),
  )
}

///|
let prime_divprod_pow_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVPROD_POW_GEN",
)

///|
/// `PRIME_DIVPROD_POW_GEN`
pub fn prime_divprod_pow_gen() -> @kernel.Thm {
  prime_divprod_pow_gen_c.get()
}

///|
/// PRIME_DIVPROD_POW_GEN_EQ
fn step_154() -> Unit raise {
  let t652 = @meson.meson_tac(
    @list.List([prime_divprod_pow_gen(), divides_rmul(), divides_lmul()]),
  )
  prime_divprod_pow_gen_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && !divides(p, gcd((a, b))) → divides(EXP(p, n), a * b) == (divides(EXP(p, n), a) || divides(EXP(p, n), b))"),
      t652,
    ),
  )
}

///|
let prime_divprod_pow_gen_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVPROD_POW_GEN_EQ",
)

///|
/// `PRIME_DIVPROD_POW_GEN_EQ`
pub fn prime_divprod_pow_gen_eq() -> @kernel.Thm {
  prime_divprod_pow_gen_eq_c.get()
}

///|
/// PRIME_DIVPROD_POW
fn step_155() -> Unit raise {
  let t653 = @meson.meson_tac(
    @list.List([coprime_exp_divprod(), prime_coprime_cases(), @arith.mult_sym()]),
  )
  prime_divprod_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && coprime((a, b)) && divides(EXP(p, n), a * b) → divides(EXP(p, n), a) || divides(EXP(p, n), b)"),
      t653,
    ),
  )
}

///|
let prime_divprod_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVPROD_POW",
)

///|
/// `PRIME_DIVPROD_POW`
pub fn prime_divprod_pow() -> @kernel.Thm {
  prime_divprod_pow_c.get()
}

///|
/// PRIME_DIVPROD_POW_EQ
fn step_156() -> Unit raise {
  let t654 = @meson.meson_tac(
    @list.List([prime_divprod_pow(), divides_rmul(), divides_lmul()]),
  )
  prime_divprod_pow_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ a : Num, ∀ b : Num, prime(p) && coprime((a, b)) → divides(EXP(p, n), a * b) == (divides(EXP(p, n), a) || divides(EXP(p, n), b))"),
      t654,
    ),
  )
}

///|
let prime_divprod_pow_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVPROD_POW_EQ",
)

///|
/// `PRIME_DIVPROD_POW_EQ`
pub fn prime_divprod_pow_eq() -> @kernel.Thm {
  prime_divprod_pow_eq_c.get()
}

///|
/// PRIME_FACTOR_INDUCT
fn step_157() -> Unit raise {
  let t684 = @meson.asm_meson_tac(
    @list.List([prime_factor_lt(), @arith.mult_eq_0()]),
  )
  let t683 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t682 = @simp.asm_rewrite_tac(@list.List([]))
  let t681 = @tactics.disch_then(@tactics.match_mp_tac)
  let t680 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()])),
  )
  let t675 = @term_syntax.parse_term("(d : Num)")
  let t676 = @list.List([@term_syntax.parse_term("(p : Num)"), t675])
  let t679 = @tactics.first_x_assum(fn(
    x678 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x672 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s673 = @tactics.mp_tac(x672)
      fn(
        x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s673(x674)
      }
    })(((x677 : @kernel.Thm) => @bool.specl(t676, x677))(x678))
  })
  let t668 = @simp.gen_rewrite_rule(
    fn(
      x667 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x667
    },
    @list.List([@int.divides()]),
  )
  let t669 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
    x664 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s665 = @tactics.subst_all_tac(x664)
    fn(
      x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s665(x666)
    }
  })
  let t671 = @tactics.first_x_assum(fn(
    x670 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t669(t668(x670))
  })
  let t660 = @drule.match_mp(prime_factor())
  let t661 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
    @tactics.strip_assume_tac,
  )
  let t663 = @tactics.first_assum(fn(
    x662 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t661(t660(x662))
  })
  let t659 = @simp.asm_rewrite_tac(@list.List([]))
  let t657 = @term_syntax.parse_term("(n : Num) == 1")
  let t658 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(n : Num) == 0"), t657]),
  )
  let t656 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t655 = @tactics.match_mp_tac(@arith.num_wf())
  let t685 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                            t655,
                          ),
                          t656,
                        ),
                        @tactics.disch_tac,
                      ),
                      t658,
                    ),
                    t659,
                  ),
                  t663,
                ),
                t671,
              ),
              t679,
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
  )
  prime_factor_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(0) && P(1) && (∀ p : Num, ∀ n : Num, prime(p) && !(n == 0) && P(n) → P(p * n)) → (∀ n : Num, P(n))"),
      t685,
    ),
  )
}

///|
let prime_factor_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTOR_INDUCT",
)

///|
/// `PRIME_FACTOR_INDUCT`
pub fn prime_factor_induct() -> @kernel.Thm {
  prime_factor_induct_c.get()
}

///|
/// COMPLETE_FACTOR_INDUCT
fn step_158() -> Unit raise {
  let t687 = @simp.asm_simp_tac(@list.List([]))
  let t686 = @tactics.match_mp_tac(prime_factor_induct())
  let t688 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
      t686,
    ),
    t687,
  )
  complete_factor_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(0) && P(1) && (∀ p : Num, prime(p) → P(p)) && (∀ m : Num, ∀ n : Num, P(m) && P(n) → P(m * n)) → (∀ n : Num, P(n))"),
      t688,
    ),
  )
}

///|
let complete_factor_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COMPLETE_FACTOR_INDUCT",
)

///|
/// `COMPLETE_FACTOR_INDUCT`
pub fn complete_factor_induct() -> @kernel.Thm {
  complete_factor_induct_c.get()
}

///|
/// PRIME_FACTOR_PARTITION
fn step_159() -> Unit raise {
  let t719 = @meson.asm_meson_tac(@list.List([]))
  let t718 = @simp.asm_simp_tac(@list.List([divides_prime_prime()]))
  let t717 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t716 = @simp.expand_tac("n")
  let t715 = @simp.asm_simp_tac(
    @list.List([@theorems.imp_conj(), prime_divprod_eq()]),
  )
  let t712 = @term_syntax.parse_term("(p : Num) * (n2 : Num)")
  let t713 = @tactics.map_every(
    fn(
      x709 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s710 = @tactics.exists_tac(x709)
      fn(
        x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s710(x711)
      }
    },
    @list.List([@term_syntax.parse_term("(n1 : Num)"), t712]),
  )
  let t708 = @term_syntax.parse_term("(n2 : Num)")
  let t714 = @list.List([
    @tactics.map_every(
      fn(
        x705 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s706 = @tactics.exists_tac(x705)
        fn(
          x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s706(x707)
        }
      },
      @list.List([@term_syntax.parse_term("(p : Num) * (n1 : Num)"), t708]),
    ),
    t713,
  ])
  let t704 = @class.asm_cases_tac(@term_syntax.parse_term("(Q : (Num) -> Bool)((p : Num))"))
  let t703 = @tactics.repeat_tac(@tactics.strip_tac)
  let t701 = @term_syntax.parse_term("(n2 : Num)")
  let t702 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n1 : Num)"), t701]),
  )
  let t700 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_0(), @theorems.left_imp_exists_thm()]),
  )
  let t699 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s694 = @tactics.assume_tac(x693)
          fn(
            x695 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s694(x695)
          }
        },
        fn(
          x696 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s697 = @tactics.mp_tac(x696)
          fn(
            x698 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s697(x698)
          }
        },
      ),
    ),
  )
  let t691 = @term_syntax.parse_term("(n : Num)")
  let t692 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t691]),
  )
  let t690 = @list.List([
    @meson.meson_tac(@list.List([prime_1()])),
    @tactics.all_tac,
  ])
  let t689 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_eq_1(),
      @equal.gsym(@theorems.conj_assoc()),
      @theorems.unwind_thm2(),
      @theorems.right_exists_and_thm(),
      @int.divides_one(),
    ]),
  )
  let t720 = @tactics.then_tac(
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
                                  @tactics.gen_tac,
                                  @tactics.match_mp_tac(prime_factor_induct()),
                                ),
                                t689,
                              ),
                              @tactics.conj_tac,
                            ),
                            t690,
                          ),
                          t692,
                        ),
                        t699,
                      ),
                      t700,
                    ),
                    t702,
                  ),
                  t703,
                ),
                t704,
              ),
              t714,
            ),
            t715,
          ),
          t716,
        ),
        t717,
      ),
      t718,
    ),
    t719,
  )
  prime_factor_partition_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ Q : (Num) -> Bool, ∀ n : Num, !(n == 0) → (∃ n1 : Num, ∃ n2 : Num, n1 * n2 == n && (∀ p : Num, prime(p) && divides(p, n1) → Q(p)) && (∀ p : Num, prime(p) && divides(p, n2) → !Q(p)))"),
      t720,
    ),
  )
}

///|
let prime_factor_partition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTOR_PARTITION",
)

///|
/// `PRIME_FACTOR_PARTITION`
pub fn prime_factor_partition() -> @kernel.Thm {
  prime_factor_partition_c.get()
}

///|
/// COPRIME_PAIR_DECOMP
fn step_160() -> Unit raise {
  let t733 = @meson.meson_tac(@list.List([]))
  let t732 = @simp.rewrite_tac(@list.List([coprime_prime_eq()]))
  let t731 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x728 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s729 = @tactics.mp_tac(x728)
      fn(
        x730 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s729(x730)
      }
    }),
  )
  let t727 = @tactics.x_gen_tac(@term_syntax.parse_term("(m2 : Num)"))
  let t726 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t725 = @tactics.x_gen_tac(@term_syntax.parse_term("(m1 : Num)"))
  let t724 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t723 = @simp.asm_rewrite_tac(@list.List([]))
  let t721 = @term_syntax.parse_term("(m : Num)")
  let t722 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num) => divides(p, (n2 : Num))"), t721]),
      prime_factor_partition(),
    ),
  )
  let t734 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
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
          t727,
        ),
        t731,
      ),
      t732,
    ),
    t733,
  )
  coprime_pair_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n1 : Num, ∀ n2 : Num, ∀ m : Num, coprime((n1, n2)) && !(m == 0) → (∃ m1 : Num, ∃ m2 : Num, coprime((m1, n1)) && coprime((m2, n2)) && coprime((m1, m2)) && m1 * m2 == m)"),
      t734,
    ),
  )
}

///|
let coprime_pair_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_PAIR_DECOMP",
)

///|
/// `COPRIME_PAIR_DECOMP`
pub fn coprime_pair_decomp() -> @kernel.Thm {
  coprime_pair_decomp_c.get()
}

///|
/// EXP_MULT_EXISTS
fn step_161() -> Unit raise {
  let t753 = @meson.meson_tac(@list.List([]))
  let t752 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.mult_exp(),
      @equal.gsym(@arith.mult_assoc()),
      @arith.eq_mult_lcancel(),
      @arith.exp_eq_0(),
    ]),
  )
  let t751 = @tactics.first_x_assum(fn(
    x750 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x747 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s748 = @tactics.mp_tac(x747)
      fn(
        x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s748(x749)
      }
    })(@equal.sym(x750))
  })
  let t746 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x743 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s744 = @tactics.subst_all_tac(x743)
      fn(
        x745 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s744(x745)
      }
    }),
  )
  let t742 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t741 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides(), @arith.mult_sym()])),
    @tactics.all_tac,
  ])
  let t740 = @simp.asm_rewrite_tac(@list.List([]))
  let t737 = @term_syntax.parse_term("(p : Num)")
  let t738 = @term_syntax.parse_term("(m : Num)")
  let t739 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(k : Num)"), t738, t737]),
      divides_exp2_rev(),
    ),
  )
  let t736 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @arith.mult_clauses()]),
  )
  let t735 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t754 = @tactics.then_tac(
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
                          t735,
                        ),
                        t736,
                      ),
                      @tactics.strip_tac,
                    ),
                    t739,
                  ),
                  t740,
                ),
                @tactics.ants_tac,
              ),
              t741,
            ),
            t742,
          ),
          t746,
        ),
        t751,
      ),
      t752,
    ),
    t753,
  )
  exp_mult_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ k : Num, !(m == 0) && EXP(m, k) * n == EXP(p, k) → (∃ q : Num, n == EXP(q, k))"),
      t754,
    ),
  )
}

///|
let exp_mult_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXP_MULT_EXISTS",
)

///|
/// `EXP_MULT_EXISTS`
pub fn exp_mult_exists() -> @kernel.Thm {
  exp_mult_exists_c.get()
}

///|
/// COPRIME_POW
fn step_162() -> Unit raise {
  let t810 = @meson.meson_tac(@list.List([]))
  let t811 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp())])),
    ),
    t810,
  )
  let t809 = @tactics.conv_tac(@grobner.num_ring)
  let t808 = @tactics.first_x_assum(fn(
    x807 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x804 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s805 = @tactics.mp_tac(x804)
      fn(
        x806 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s805(x806)
      }
    })(@equal.sym(x807))
  })
  let t803 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), prime_imp_nz()]))
  let t802 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (n : Num))"))
  let t812 = @tactics.thenl(
    @tactics.ants_tac,
    @list.List([
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(
                @grobner.num_ring(
                  @term_syntax.parse_term("∀ p : Num, !(p == 0) && (a : Num) * p == (b : Num) * p → a == b"),
                ),
              ),
              t802,
            ),
            t803,
          ),
          t808,
        ),
        t809,
      ),
      t811,
    ]),
  )
  let t801 = @simp.asm_rewrite_tac(@list.List([]))
  let t795 = @term_syntax.parse_term("(a : Num)")
  let t796 = @list.List([@term_syntax.parse_term("(d : Num)"), t795])
  let t799 = @tactics.first_x_assum(fn(
    x798 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
    })(((x797 : @kernel.Thm) => @bool.specl(t796, x797))(x798))
  })
  let t788 = @term_syntax.parse_term("(d : Num)")
  let t789 = @list.List([@term_syntax.parse_term("(b : Num)"), t788])
  let t800 = @list.List([
    @tactics.first_x_assum(fn(
      x791 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x785 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s786 = @tactics.mp_tac(x785)
        fn(
          x787 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s786(x787)
        }
      })(((x790 : @kernel.Thm) => @bool.specl(t789, x790))(x791))
    }),
    t799,
  ])
  let t784 = @simp.asm_simp_tac(
    @list.List([coprime_rmul(), coprime_lmul(), coprime_lexp(), coprime_rexp()]),
  )
  let t781 = @simp.gen_rewrite_rule(
    fn(
      x780 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x780
    },
    @list.List([coprime_sym()]),
  )
  let t783 = @tactics.first_x_assum(fn(
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
    (fn(
      x777 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s778 = @tactics.mp_tac(x777)
      fn(
        x779 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s778(x779)
      }
    })(t781(x782))
  })
  let t776 = @tactics.disch_then(
    @tactics.disj_cases_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
        let s774 = @tactics.subst_all_tac(x773)
        fn(
          x775 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s774(x775)
        }
      }),
    ),
  )
  let t772 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t771 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_divprod_pow(), @int.divides()])),
    @tactics.all_tac,
  ])
  let t770 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(EXP((p : Num), (n : Num)), (a : Num)) || divides(EXP(p, n), (b : Num))"),
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
      let s768 = @tactics.mp_tac(x767)
      fn(
        x769 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s768(x769)
      }
    },
  )
  let t766 = @tactics.repeat_tac(@tactics.strip_tac)
  let t813 = @tactics.then_tac(
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
                        @simp.rewrite_tac(@list.List([@arith.mult_exp()])),
                        t766,
                      ),
                      t770,
                    ),
                    t771,
                  ),
                  t772,
                ),
                t776,
              ),
              t783,
            ),
            t784,
          ),
          @tactics.strip_tac,
        ),
        t800,
      ),
      t801,
    ),
    t812,
  )
  let t765 = @meson.meson_tac(@list.List([@arith.exp_one()]))
  let t814 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@arith.exp_one(), @arith.mult_eq_1()])),
    t765,
  )
  let t764 = @meson.asm_meson_tac(
    @list.List([coprime_0(), @arith.exp_zero(), coprime_0(), @arith.exp_one()]),
  )
  let t815 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@arith.exp_zero(), @arith.mult_eq_0()])),
      t764,
    ),
    t814,
    t813,
  ])
  let t763 = @tactics.repeat_tac(@tactics.conj_tac)
  let t762 = @tactics.match_mp_tac(prime_factor_induct())
  let t761 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mult_eq_1()]))
  let t760 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t759 = @simp.gen_rewrite_tac(
    fn(
      x758 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x758
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t816 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.gen_rewrite_tac(
                  fn(
                    x755 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s756 = @equal.binder_conv(x755)
                    fn(x757 : @kernel.Term) -> @kernel.Thm raise { s756(x757) }
                  },
                  @list.List([@theorems.swap_forall_thm()]),
                ),
              ),
              t759,
            ),
            t760,
          ),
          t761,
        ),
        t762,
      ),
      t763,
    ),
    t815,
  )
  coprime_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, ∀ c : Num, coprime((a, b)) && a * b == EXP(c, n) → (∃ r : Num, ∃ s : Num, a == EXP(r, n) && b == EXP(s, n))"),
      t816,
    ),
  )
}

///|
let coprime_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_POW")

///|
/// `COPRIME_POW`
pub fn coprime_pow() -> @kernel.Thm {
  coprime_pow_c.get()
}

///|
/// PRIME_EXP
fn step_163() -> Unit raise {
  let t849 = @term_syntax.parse_term("!((p : Num) == 1)")
  let t850 = @tactics.map_every(
    fn(
      x846 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s847 = @tactics.undisch_tac(x846)
      fn(
        x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s847(x848)
      }
    },
    @list.List([@term_syntax.parse_term("!((p : Num) == 0)"), t849]),
  )
  let t845 = @simp.asm_rewrite_tac(
    @list.List([@arith.lt_exp(), @calc_num.arith_eq()]),
  )
  let t844 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]),
  )
  let t843 = @simp.gen_rewrite_tac(
    fn(
      x840 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s841 = @equal.land_conv(x840)
      fn(x842 : @kernel.Term) -> @kernel.Thm raise { s841(x842) }
    },
    @list.List([@equal.gsym(@arith.exp_1())]),
  )
  let t839 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(p : Num) < (pn : Num) → !(p == pn)")),
  )
  let t838 = @list.List([
    @meson.meson_tac(@list.List([@arith.exp(), @int.divides()])),
    @tactics.all_tac,
  ])
  let t837 = @simp.asm_rewrite_tac(@list.List([@class.not_imp()]))
  let t833 = @term_syntax.parse_term("(p : Num)")
  let t836 = @tactics.disch_then(fn(
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
    (fn(
      x830 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s831 = @tactics.mp_tac(x830)
      fn(
        x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s831(x832)
      }
    })(((x834 : @kernel.Thm) => @bool.spec(t833, x834))(x835))
  })
  let t829 = @simp.asm_rewrite_tac(
    @list.List([@class.not_imp(), @class.de_morgan_thm()]),
  )
  let t828 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t827 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_1(), @arith.exp_eq_1()]),
  )
  let t826 = @simp.rewrite_tac(
    @list.List([@int.prime(), @class.de_morgan_thm()]),
  )
  let t825 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!(SUC(SUC((n : Num))) == 1)"))]),
  )
  let t824 = @simp.rewrite_tac(
    @list.List([
      @calc_num.arith(),
      @arith.exp_1(),
      @arith.exp(),
      @arith.mult_clauses(),
    ]),
  )
  let t823 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([prime_0(), @arith.exp(), @arith.mult_clauses()]),
    ),
    @tactics.all_tac,
  ])
  let t822 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t820 = @term_syntax.parse_term("(n : Num)")
  let t821 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t820)
  let t819 = @tactics.pop_assum_list(fn(
    x818 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t817 = @simp.rewrite_tac(
    @list.List([@arith.exp(), prime_1(), @calc_num.arith_eq()]),
  )
  let t851 = @tactics.then_tac(
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
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.gen_tac, @nums.induct_tac,
                                              ),
                                              t817,
                                            ),
                                            t819,
                                          ),
                                          t821,
                                        ),
                                        t822,
                                      ),
                                      t823,
                                    ),
                                    @nums.induct_tac,
                                  ),
                                  t824,
                                ),
                                t825,
                              ),
                              t826,
                            ),
                            t827,
                          ),
                          t828,
                        ),
                        t829,
                      ),
                      t836,
                    ),
                    t837,
                  ),
                  @tactics.conj_tac,
                ),
                t838,
              ),
              t839,
            ),
            t843,
          ),
          t844,
        ),
        t845,
      ),
      t850,
    ),
    @int.arith_tac,
  )
  prime_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(EXP(p, n)) == (prime(p) && n == 1)"),
      t851,
    ),
  )
}

///|
let prime_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_EXP")

///|
/// `PRIME_EXP`
pub fn prime_exp() -> @kernel.Thm {
  prime_exp_c.get()
}

///|
/// PRIME_POWER_MULT
fn step_164() -> Unit raise {
  let t900 = @meson.meson_tac(@list.List([@arith.exp()]))
  let t899 = @simp.asm_rewrite_tac(@list.List([]))
  let t892 = @term_syntax.parse_term("(p : Num)")
  let t893 = @term_syntax.parse_term("(x : Num)")
  let t894 = @list.List([@term_syntax.parse_term("(d : Num)"), t893, t892])
  let t897 = @tactics.first_x_assum(fn(
    x896 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x889 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s890 = @tactics.mp_tac(x889)
      fn(
        x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s890(x891)
      }
    })(((x895 : @kernel.Thm) => @bool.specl(t894, x895))(x896))
  })
  let t884 = @term_syntax.parse_term("(p : Num)")
  let t885 = @term_syntax.parse_term("(y : Num)")
  let t886 = @list.List([@term_syntax.parse_term("(d : Num)"), t885, t884])
  let t898 = @list.List([
    @tactics.first_x_assum(fn(
      x888 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x881 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s882 = @tactics.mp_tac(x881)
        fn(
          x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s882(x883)
        }
      })(((x887 : @kernel.Thm) => @bool.specl(t886, x887))(x888))
    }),
    t897,
  ])
  let t880 = @simp.asm_rewrite_tac(@list.List([@arith.eq_mult_lcancel()]))
  let t879 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t876 = @simp.gen_rewrite_tac(
    fn(
      x875 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x869 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s870 = @equal.land_conv(x869)
        fn(x871 : @kernel.Term) -> @kernel.Thm raise { s870(x871) }
      })(
        (fn(
          x872 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s873 = @equal.land_conv(x872)
          fn(x874 : @kernel.Term) -> @kernel.Thm raise { s873(x874) }
        })(x875),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t877 = @tactics.then_tac(
    @tactics.undisch_tac(@term_syntax.parse_term("(x : Num) * ((p : Num) * (d : Num)) == p * EXP(p, (k : Num))")),
    t876,
  )
  let t878 = @list.List([
    @tactics.undisch_tac(@term_syntax.parse_term("(p : Num) * (d : Num) * (y : Num) == p * EXP(p, (k : Num))")),
    t877,
  ])
  let t868 = @tactics.disch_then(
    @tactics.disj_cases_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
        x865 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s866 = @tactics.subst_all_tac(x865)
        fn(
          x867 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s866(x867)
        }
      }),
    ),
  )
  let t864 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_0()])),
    @tactics.all_tac,
  ])
  let t863 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(
    x860 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s861 = @tactics.assume_tac(x860)
    fn(
      x862 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s861(x862)
    }
  })
  let t859 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t858 = @list.List([
    @meson.asm_meson_tac(
      @list.List([prime_divprod(), @int.divides(), @arith.mult_ac()]),
    ),
    @tactics.all_tac,
  ])
  let t857 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides((p : Num), (x : Num)) || divides(p, (y : Num))"),
    fn(
      x854 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s855 = @tactics.mp_tac(x854)
      fn(
        x856 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s855(x856)
      }
    },
  )
  let t853 = @tactics.repeat_tac(@tactics.strip_tac)
  let t852 = @list.List([
    @meson.meson_tac(@list.List([@arith.exp()])),
    @tactics.all_tac,
  ])
  let t901 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
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
                                  @nums.induct_tac,
                                  @simp.rewrite_tac(
                                    @list.List([
                                      @arith.exp(),
                                      @arith.mult_eq_1(),
                                    ]),
                                  ),
                                ),
                                t852,
                              ),
                              t853,
                            ),
                            t857,
                          ),
                          t858,
                        ),
                        t859,
                      ),
                      t863,
                    ),
                    t864,
                  ),
                  t868,
                ),
                t878,
              ),
              t879,
            ),
            t880,
          ),
          @tactics.disch_tac,
        ),
        t898,
      ),
      t899,
    ),
    t900,
  )
  prime_power_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ x : Num, ∀ y : Num, ∀ p : Num, prime(p) && x * y == EXP(p, k) → (∃ i : Num, ∃ j : Num, x == EXP(p, i) && y == EXP(p, j))"),
      t901,
    ),
  )
}

///|
let prime_power_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_POWER_MULT",
)

///|
/// `PRIME_POWER_MULT`
pub fn prime_power_mult() -> @kernel.Thm {
  prime_power_mult_c.get()
}

///|
/// PRIME_POWER_EXP
fn step_165() -> Unit raise {
  let t906 = @meson.asm_meson_tac(@list.List([prime_power_mult()]))
  let t905 = @simp.asm_rewrite_tac(@list.List([@arith.exp()]))
  let t904 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t903 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t902 = @tactics.repeat_tac(@tactics.gen_tac)
  let t907 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @nums.induct_tac,
              @simp.rewrite_tac(@list.List([@arith.exp()])),
            ),
            t902,
          ),
          t903,
        ),
        t904,
      ),
      t905,
    ),
    t906,
  )
  prime_power_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Num, ∀ p : Num, ∀ k : Num, prime(p) && !(n == 0) && EXP(x, n) == EXP(p, k) → (∃ i : Num, x == EXP(p, i))"),
      t907,
    ),
  )
}

///|
let prime_power_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_POWER_EXP",
)

///|
/// `PRIME_POWER_EXP`
pub fn prime_power_exp() -> @kernel.Thm {
  prime_power_exp_c.get()
}

///|
/// DIVIDES_PRIMEPOW
fn step_166() -> Unit raise {
  let t937 = @meson.meson_tac(@list.List([divides_rmul(), divides_refl()]))
  let t936 = @simp.asm_rewrite_tac(@list.List([@arith.exp_add()]))
  let t938 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@arith.le_exists()])),
        @tactics.strip_tac,
      ),
      t936,
    ),
    t937,
  )
  let t935 = @meson.meson_tac(@list.List([@arith.le_add()]))
  let t934 = @simp.asm_rewrite_tac(@list.List([prime_1(), @arith.le_antisym()]))
  let t933 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t932 = @simp.asm_simp_tac(@list.List([prime_0()]))
  let t931 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t930 = @tactics.pop_assum(fn(
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
    let s928 = @tactics.mp_tac(x927)
    fn(
      x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s928(x929)
    }
  })
  let t926 = @simp.rewrite_tac(@list.List([@arith.le_antisym()]))
  let t925 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.le_antisym()), @arith.le_exp()]),
  )
  let t924 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t923 = @tactics.first_x_assum(fn(
    x922 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s920 = @tactics.mp_tac(x919)
      fn(
        x921 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s920(x921)
      }
    })(@equal.sym(x922))
  })
  let t917 = @tactics.conjuncts_then(fn(
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
    let s915 = @tactics.subst_all_tac(x914)
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
  })
  let t918 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.choose_then)(t917),
  )
  let t913 = @simp.asm_rewrite_tac(@list.List([]))
  let t909 = @term_syntax.parse_term("(p : Num)")
  let t910 = @term_syntax.parse_term("(e : Num)")
  let t911 = @term_syntax.parse_term("(d : Num)")
  let t912 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(k : Num)"), t911, t910, t909]),
      prime_power_mult(),
    ),
  )
  let t908 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Num)"))
  let t939 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
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
                                      @int.divides(),
                                      @theorems.left_imp_exists_thm(),
                                    ]),
                                  ),
                                  t908,
                                ),
                                @tactics.disch_tac,
                              ),
                              t912,
                            ),
                            t913,
                          ),
                          t918,
                        ),
                        t923,
                      ),
                      t924,
                    ),
                    t925,
                  ),
                  t926,
                ),
                t930,
              ),
              t931,
            ),
            t932,
          ),
          t933,
        ),
        t934,
      ),
      t935,
    ),
    t938,
  ])
  let t940 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        @tactics.gen_tac,
      ),
      @tactics.eq_tac,
    ),
    t939,
  )
  divides_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → (∀ d : Num, divides(d, EXP(p, (k : Num))) == (∃ i : Num, i <= k && d == EXP(p, i)))"),
      t940,
    ),
  )
}

///|
let divides_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_PRIMEPOW",
)

///|
/// `DIVIDES_PRIMEPOW`
pub fn divides_primepow() -> @kernel.Thm {
  divides_primepow_c.get()
}

///|
/// PRIMEPOW_DIVIDES_PROD
fn step_167() -> Unit raise {
  let t948 = @meson.asm_meson_tac(
    @list.List([@arith.exp_add(), eq_primepow(), divides_primepow()]),
  )
  let t947 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("((a : Num) == (b : Num) * (c : Num)) == (divides(b, a) && divides(c, a) && b * c == a)"),
      ),
    ]),
  )
  let t944 = @drule.match_mp(division_decomp())
  let t946 = @tactics.first_assum(fn(
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
      x941 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s942 = @tactics.mp_tac(x941)
      fn(
        x943 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s942(x943)
      }
    })(t944(x945))
  })
  let t949 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t946),
      t947,
    ),
    t948,
  )
  primepow_divides_prod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, ∀ m : Num, ∀ n : Num, prime(p) && divides(EXP(p, k), m * n) → (∃ i : Num, ∃ j : Num, divides(EXP(p, i), m) && divides(EXP(p, j), n) && k == i + j)"),
      t949,
    ),
  )
}

///|
let primepow_divides_prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_PROD",
)

///|
/// `PRIMEPOW_DIVIDES_PROD`
pub fn primepow_divides_prod() -> @kernel.Thm {
  primepow_divides_prod_c.get()
}

///|
/// EUCLID_BOUND
fn step_168() -> Unit raise {
  let t954 = @meson.asm_meson_tac(
    @list.List([
      @int.divides_le(),
      @int.arith_rule(@term_syntax.parse_term("!((x : Num) + 1 == 0)")),
    ]),
  )
  let t955 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        divides_add_revr(),
        @int.divides_one(),
        prime_1(),
        @arith.not_lt(),
        prime_0(),
        @int.arith_rule(@term_syntax.parse_term("(p : Num) == 0 || 1 <= p")),
        divides_fact(),
      ]),
    ),
    t954,
  ])
  let t953 = @simp.asm_rewrite_tac(@list.List([]))
  let t952 = @tactics.repeat_tac(@tactics.strip_tac)
  let t951 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t950 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) → !(n + 1 == 1)")),
      @arith.add1(),
      @arith.fact_lt(),
    ]),
  )
  let t956 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @tactics.mp_tac(
                @bool.spec(@term_syntax.parse_term("FACT((n : Num)) + 1"), prime_factor()),
              ),
            ),
            t950,
          ),
          t951,
        ),
        t952,
      ),
      t953,
    ),
    t955,
  )
  euclid_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∃ p : Num, prime(p) && n < p && p <= SUC(FACT(n))"),
      t956,
    ),
  )
}

///|
let euclid_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EUCLID_BOUND")

///|
/// `EUCLID_BOUND`
pub fn euclid_bound() -> @kernel.Thm {
  euclid_bound_c.get()
}

///|
/// EUCLID
fn step_169() -> Unit raise {
  let t957 = @meson.meson_tac(@list.List([euclid_bound()]))
  let t958 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.gt()])),
    t957,
  )
  euclid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∃ p : Num, prime(p) && p > n"), t958),
  )
}

///|
let euclid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EUCLID")

///|
/// `EUCLID`
pub fn euclid() -> @kernel.Thm {
  euclid_c.get()
}

///|
/// PRIMES_INFINITE
fn step_170() -> Unit raise {
  let t959 = @meson.meson_tac(
    @list.List([euclid(), @arith.not_le(), @arith.gt()]),
  )
  let t960 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.infinite(), @sets.num_finite(), @sets.in_elim_thm()]),
    ),
    t959,
  )
  primes_infinite_c.set(
    @tactics.prove(@term_syntax.parse_term("INFINITE({(p : Num) | prime(p)})"), t960),
  )
}

///|
let primes_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMES_INFINITE",
)

///|
/// `PRIMES_INFINITE`
pub fn primes_infinite() -> @kernel.Thm {
  primes_infinite_c.get()
}

///|
/// FACTORIZATION_INDEX
fn step_171() -> Unit raise {
  let t977 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_num.arith(),
      @bool.conjunct1(@arith.exp()),
      @arith.exp_mono_le(),
      @nums.not_suc(),
    ]),
  )
  let t975 = @term_syntax.parse_term("(l : Num)")
  let t976 = @tactics.spec_tac(@term_syntax.parse_term("(l : Num)"), t975)
  let t974 = @simp.simp_tac(
    @list.List([@arith.lt_pow2_refl(), @arith.lt_imp_le()]),
  )
  let t973 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (l : Num))"))
  let t972 = @tactics.match_mp_tac(@arith.le_trans())
  let t971 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@arith.le_trans()),
  )
  let t970 = @simp.asm_rewrite_tac(@list.List([]))
  let t967 = @drule.match_mp(@int.divides_le())
  let t969 = @tactics.disch_then(fn(
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
      x964 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s965 = @tactics.mp_tac(x964)
      fn(
        x966 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s965(x966)
      }
    })(t967(x968))
  })
  let t978 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.exists_tac(@term_syntax.parse_term("(n : Num)")),
                      @tactics.gen_tac,
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
        ),
        t976,
      ),
      @nums.induct_tac,
    ),
    t977,
  )
  let t963 = @simp.rewrite_tac(@list.List([@arith.exp(), divides_1()]))
  let t979 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t963),
    t978,
  ])
  let t962 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.num_max())]))
  let t961 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_le()), @class.contrapos_thm()]),
  )
  let t980 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t961),
        t962,
      ),
      @tactics.conj_tac,
    ),
    t979,
  )
  factorization_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, !(n == 0) && 2 <= p → (∃ k : Num, divides(EXP(p, k), n) && (∀ l : Num, k < l → !divides(EXP(p, l), n)))"),
      t980,
    ),
  )
}

///|
let factorization_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FACTORIZATION_INDEX",
)

///|
/// `FACTORIZATION_INDEX`
pub fn factorization_index() -> @kernel.Thm {
  factorization_index_c.get()
}

///|
/// PRIMEPOW_FACTOR
fn step_172() -> Unit raise {
  let t1010 = @meson.asm_meson_tac(@list.List([prime_coprime_strong()]))
  let t1009 = @simp.asm_simp_tac(
    @list.List([@arith.exp(), @arith.mult_clauses(), @arith.le_1()]),
  )
  let t1008 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1007 = @simp.asm_rewrite_tac(@list.List([]))
  let t1006 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t1005 = @simp.rewrite_tac(
    @list.List([@arith.exp_1(), @equal.gsym(@int.divides())]),
  )
  let t1004 = @simp.asm_simp_tac(
    @list.List([@arith.eq_mult_lcancel(), @arith.exp_eq_0(), prime_imp_nz()]),
  )
  let t1002 = @equal.gsym(@arith.mult_assoc())
  let t1003 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 1")),
      @arith.exp_add(),
      t1002,
    ]),
  )
  let t998 = @term_syntax.parse_term("(k : Num) + 1")
  let t1001 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x992 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s993 = @tactics.assume_tac(x992)
        fn(
          x994 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s993(x994)
        }
      },
      fn(
        x1000 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
          let s996 = @tactics.mp_tac(x995)
          fn(
            x997 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s996(x997)
          }
        })(((x999 : @kernel.Thm) => @bool.spec(t998, x999))(x1000))
      },
    ),
  )
  let t991 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t990 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t989 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_and_exists_thm()]),
  )
  let t988 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t987 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t986 = @simp.asm_simp_tac(
    @list.List([
      prime_ge_2(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t984 = @term_syntax.parse_term("(p : Num)")
  let t985 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t984]),
      factorization_index(),
    ),
  )
  let t983 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t982 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t981 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(n : Num)"), prime_factor()),
  )
  let t1011 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
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
                                              @tactics.repeat_tac(
                                                @tactics.strip_tac,
                                              ),
                                              t981,
                                            ),
                                            @tactics.ants_tac,
                                          ),
                                          @list.List([
                                            @int.asm_arith_tac, @tactics.all_tac,
                                          ]),
                                        ),
                                        t982,
                                      ),
                                      t983,
                                    ),
                                    @tactics.strip_tac,
                                  ),
                                  t985,
                                ),
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
                    t1001,
                  ),
                  t1003,
                ),
                t1004,
              ),
              t1005,
            ),
            t1006,
          ),
          t1007,
        ),
        t1008,
      ),
      t1009,
    ),
    t1010,
  )
  primepow_factor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, 2 <= n → (∃ p : Num, ∃ k : Num, ∃ m : Num, prime(p) && 1 <= k && coprime((p, m)) && n == EXP(p, k) * m)"),
      t1011,
    ),
  )
}

///|
let primepow_factor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_FACTOR",
)

///|
/// `PRIMEPOW_FACTOR`
pub fn primepow_factor() -> @kernel.Thm {
  primepow_factor_c.get()
}

///|
/// PRIMEPOW_DIVISORS_DIVIDES
fn step_173() -> Unit raise {
  let t1108 = @meson.asm_meson_tac(@list.List([distinct_prime_coprime()]))
  let t1107 = @tactics.match_mp_tac(coprime_exp())
  let t1104 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      coprime_exp_divprod(),
    ),
  )
  let t1106 = @tactics.disch_then(fn(
    x1105 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t1104(x1105))
  })
  let t1103 = @simp.asm_simp_tac(@list.List([divides_lmul()]))
  let t1099 = @term_syntax.parse_term("(l : Num)")
  let t1100 = @list.List([@term_syntax.parse_term("(q : Num)"), t1099])
  let t1109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x1102 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x1096 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s1097 = @tactics.mp_tac(x1096)
              fn(
                x1098 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s1097(x1098)
              }
            })(((x1101 : @kernel.Thm) => @bool.specl(t1100, x1101))(x1102))
          }),
          t1103,
        ),
        t1106,
      ),
      t1107,
    ),
    t1108,
  )
  let t1095 = @meson.asm_meson_tac(@list.List([divides_rexp(), divides_refl()]))
  let t1093 = @term_syntax.parse_term("EXP((p : Num), (l : Num))")
  let t1094 = @tactics.trans_tac(divides_trans())(t1093)
  let t1092 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) → !p → (q : Bool)")),
  )
  let t1091 = @simp.asm_simp_tac(
    @list.List([
      divides_refl(),
      prime_ge_2(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(p == 1)")),
    ]),
  )
  let t1087 = @term_syntax.parse_term("(p : Num)")
  let t1090 = @tactics.disch_then(fn(
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
    })(((x1088 : @kernel.Thm) => @bool.spec(t1087, x1088))(x1089))
  })
  let t1083 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1082 = @tactics.first_x_assum(fn(
    x1079 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1080 = @tactics.subst_all_tac(x1079)
    fn(
      x1081 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1080(x1081)
    }
  })
  let t1110 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.undisch_tac(@term_syntax.parse_term("coprime(((p : Num), (r : Num)))")),
                  t1082,
                ),
                t1083,
              ),
              t1090,
            ),
            t1091,
          ),
          t1092,
        ),
        t1094,
      ),
      t1095,
    ),
    t1109,
  ])
  let t1078 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == (p : Num)"))
  let t1077 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), divides_1()]))
  let t1076 = @class.asm_cases_tac(@term_syntax.parse_term("(l : Num) == 0"))
  let t1074 = @term_syntax.parse_term("(l : Num)")
  let t1075 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q : Num)"), t1074]),
  )
  let t1073 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1072 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_0(), prime_1(), @arith.le_1()])),
    @tactics.all_tac,
  ])
  let t1071 = @simp.rewrite_tac(
    @list.List([@arith.exp_eq_0(), @arith.exp_eq_1()]),
  )
  let t1070 = @simp.asm_simp_tac(
    @list.List([
      @arith.lt_mult_rcancel(),
      @int.arith_rule(@term_syntax.parse_term("(1 < (p : Num)) == !(p == 0 || p == 1)")),
    ]),
  )
  let t1069 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((q : Num) < (p : Num) * q) == (1 * q < p * q)")),
    ]),
  )
  let t1068 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.mult_clauses()])),
    @tactics.all_tac,
  ])
  let t1067 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t1063 = @term_syntax.parse_term("(r : Num)")
  let t1066 = @tactics.remove_then("*", fn(
    x1065 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1060 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1061 = @tactics.mp_tac(x1060)
      fn(
        x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1061(x1062)
      }
    })(((x1064 : @kernel.Thm) => @bool.spec(t1063, x1064))(x1065))
  })
  let t1059 = @tactics.match_mp_tac(divides_mul_l())
  let t1058 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.divides())]))
  let t1057 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Num)"))
  let t1056 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t1055 = @tactics.disch_then(fn(
    x1050 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1050
    let t1054 = @tactics.assume_tac(th)
    let t1053 = @simp.asm_rewrite_tac(
      @list.List([@int.number_rule(@term_syntax.parse_term("divides((a : Num), a * (b : Num))"))]),
    )
    let t1052 = @term_syntax.parse_term("(k : Num)")
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1052]), th),
        ),
        t1053,
      ),
      t1054,
    )
  })
  let t1047 = @term_syntax.parse_term("(r : Num)")
  let t1048 = @term_syntax.parse_term("(k : Num)")
  let t1049 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t1048, t1047]),
  )
  let t1046 = @list.List([
    @int.asm_arith_tac,
    @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
  ])
  let t1045 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : Num)"), primepow_factor()),
  )
  let t1044 = @simp.asm_rewrite_tac(@list.List([divides_1()]))
  let t1043 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t1041 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.not_lt()), divides_refl()]),
  )
  let t1038 = @drule.match_mp(@int.divides_le())
  let t1040 = @tactics.disch_then(fn(
    x1039 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1036 = @tactics.mp_tac(x1035)
      fn(
        x1037 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1036(x1037)
      }
    })(t1038(x1039))
  })
  let t1034 = @simp.asm_rewrite_tac(@list.List([@arith.exp_1()]))
  let t1029 = @term_syntax.parse_term("1")
  let t1030 = @list.List([@term_syntax.parse_term("(p : Num)"), t1029])
  let t1033 = @tactics.disch_then(fn(
    x1032 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s1027 = @tactics.mp_tac(x1026)
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
    })(((x1031 : @kernel.Thm) => @bool.specl(t1030, x1031))(x1032))
  })
  let t1025 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1024 = @simp.rewrite_tac(@list.List([@arith.gt()]))
  let t1042 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.mp_tac(
                  @bool.spec(@term_syntax.parse_term("(n : Num)"), euclid()),
                ),
                t1024,
              ),
              t1025,
            ),
            t1033,
          ),
          t1034,
        ),
        t1040,
      ),
      t1041,
    ),
    @tactics.all_tac,
  ])
  let t1023 = @simp.asm_rewrite_tac(@list.List([divides_0()]))
  let t1022 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1021 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1020 = @tactics.disch_then(fn(
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
    let s1018 = ((x1016 : @kernel.Thm) => @tactics.label_tac("*", x1016))(x1017)
    fn(
      x1019 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1018(x1019)
    }
  })
  let t1015 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1014 = @tactics.match_mp_tac(@arith.num_wf())
  let t1013 = @list.List([
    @meson.meson_tac(@list.List([divides_trans()])),
    @tactics.all_tac,
  ])
  let t1012 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t1111 = @tactics.thenl(
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
                                                                              @simp.rewrite_tac(
                                                                                @list.List([
                                                                                    @class.taut(
                                                                                      @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p → q) && (q → p))"),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              t1012,
                                                                            ),
                                                                            @tactics.conj_tac,
                                                                          ),
                                                                          t1013,
                                                                        ),
                                                                        t1014,
                                                                      ),
                                                                      t1015,
                                                                    ),
                                                                    t1020,
                                                                  ),
                                                                  t1021,
                                                                ),
                                                                t1022,
                                                              ),
                                                              t1023,
                                                            ),
                                                            t1042,
                                                          ),
                                                          t1043,
                                                        ),
                                                        t1044,
                                                      ),
                                                      t1045,
                                                    ),
                                                    @tactics.ants_tac,
                                                  ),
                                                  t1046,
                                                ),
                                                t1049,
                                              ),
                                              @tactics.strip_tac,
                                            ),
                                            t1055,
                                          ),
                                          t1056,
                                        ),
                                        t1057,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    t1058,
                                  ),
                                  t1059,
                                ),
                                t1066,
                              ),
                              t1067,
                            ),
                            t1068,
                          ),
                          t1069,
                        ),
                        t1070,
                      ),
                      t1071,
                    ),
                    @tactics.ants_tac,
                  ),
                  t1072,
                ),
                t1073,
              ),
              t1075,
            ),
            t1076,
          ),
          t1077,
        ),
        @tactics.strip_tac,
      ),
      t1078,
    ),
    t1110,
  )
  primepow_divisors_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, n) == (∀ p : Num, ∀ k : Num, prime(p) && divides(EXP(p, k), m) → divides(EXP(p, k), n))"),
      t1111,
    ),
  )
}

///|
let primepow_divisors_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVISORS_DIVIDES",
)

///|
/// `PRIMEPOW_DIVISORS_DIVIDES`
pub fn primepow_divisors_divides() -> @kernel.Thm {
  primepow_divisors_divides_c.get()
}

///|
/// PRIMEPOW_DIVISORS_EQ
fn step_174() -> Unit raise {
  let t1112 = @meson.meson_tac(
    @list.List([@int.divides_antisym(), primepow_divisors_divides()]),
  )
  primepow_divisors_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == n) == (∀ p : Num, ∀ k : Num, prime(p) → divides(EXP(p, k), m) == divides(EXP(p, k), n))"),
      t1112,
    ),
  )
}

///|
let primepow_divisors_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVISORS_EQ",
)

///|
/// `PRIMEPOW_DIVISORS_EQ`
pub fn primepow_divisors_eq() -> @kernel.Thm {
  primepow_divisors_eq_c.get()
}

///|
/// CHINESE_REMAINDER
fn step_175() -> Unit raise {
  let t1113 = @meson.meson_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("(∃ d : Num, ∃ x : _, ∃ y : _, d == 1 && (P : (_, _, Num) -> Bool)(x, y, d)) == (∃ x : _, ∃ y : _, P(x, y, 1))"),
    t1113,
  )
  let t1138 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
  let t1137 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1136 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.mult_clauses(),
    ]),
  )
  let t1134 = @tactics.subst1_tac(
    @kernel.assume_rule(@term_syntax.parse_term("(a : Num) * (x1 : Num) == (b : Num) * (y1 : Num) + 1")),
  )
  let t1135 = @list.List([
    @tactics.subst1_tac(
      @kernel.assume_rule(@term_syntax.parse_term("(b : Num) * (x2 : Num) == (a : Num) * (y2 : Num) + 1")),
    ),
    t1134,
  ])
  let t1133 = @tactics.exists_tac(@term_syntax.parse_term("(v : Num) * (y1 : Num) + (u : Num) * (x2 : Num)"))
  let t1132 = @tactics.exists_tac(@term_syntax.parse_term("(v : Num) * (x1 : Num) + (u : Num) * (y2 : Num)"))
  let t1131 = @tactics.exists_tac(
    @term_syntax.parse_term("(v : Num) * ((a : Num) * (x1 : Num)) + (u : Num) * ((b : Num) * (x2 : Num))"),
  )
  let t1128 = @term_syntax.parse_term("(y2 : Num)")
  let t1130 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x2 : Num)"))((x1129 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1128, x1129)
    }),
  )
  let t1125 = @term_syntax.parse_term("(y1 : Num)")
  let t1127 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x1 : Num)"))((x1126 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1125, x1126)
    }),
  )
  let t1124 = @simp.rewrite_tac(@list.List([lemma]))
  let t1122 = @simp.simp_tac(
    @list.List([@equal.gsym(divides_gcd()), coprime_gcd(), @int.divides_one()]),
  )
  let t1123 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("coprime(((a : Num), (b : Num)))")),
      t1122,
    ),
    @tactics.all_tac,
  ])
  let t1121 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : Num, (divides(d, (a : Num)) && divides(d, (b : Num))) == (d == 1)"),
    fn(
      x1119 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1119
      @simp.rewrite_tac(
        @list.List([
          th,
          @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(th),
        ]),
      )
    },
  )
  let t1118 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1116 = @term_syntax.parse_term("(b : Num)")
  let t1117 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t1116]),
      bezout_add_strong(),
    ),
  )
  let t1114 = @term_syntax.parse_term("(a : Num)")
  let t1115 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(b : Num)"), t1114]),
      bezout_add_strong(),
    ),
  )
  let t1139 = @tactics.then_tac(
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
                                  @tactics.repeat_tac(@tactics.strip_tac),
                                  t1115,
                                ),
                                t1117,
                              ),
                              t1118,
                            ),
                            t1121,
                          ),
                          t1123,
                        ),
                        t1124,
                      ),
                      t1127,
                    ),
                    t1130,
                  ),
                  t1131,
                ),
                t1132,
              ),
              t1133,
            ),
            @tactics.conj_tac,
          ),
          t1135,
        ),
        t1136,
      ),
      t1137,
    ),
    t1138,
  )
  chinese_remainder_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ u : Num, ∀ v : Num, coprime((a, b)) && !(a == 0) && !(b == 0) → (∃ x : Num, ∃ q1 : Num, ∃ q2 : Num, x == u + q1 * a && x == v + q2 * b)"),
      t1139,
    ),
  )
}

///|
let chinese_remainder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHINESE_REMAINDER",
)

///|
/// `CHINESE_REMAINDER`
pub fn chinese_remainder() -> @kernel.Thm {
  chinese_remainder_c.get()
}

///|
/// FINITE_EXP_LE
fn step_176() -> Unit raise {
  let t1149 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp_mono_le_imp(),
      @arith.lt_pow2_refl(),
      @arith.lt_imp_le(),
    ]),
  )
  let t1147 = @term_syntax.parse_term("EXP(2, (i : Num))")
  let t1148 = @tactics.trans_tac(@arith.le_trans())(t1147)
  let t1146 = @simp.asm_rewrite_tac(@list.List([]))
  let t1144 = @term_syntax.parse_term("EXP((p : Num), (i : Num))")
  let t1145 = @tactics.trans_tac(@arith.le_trans())(t1144)
  let t1143 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1142 = @simp.simp_tac(
    @list.List([
      @iterate.finite_numseg(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @arith.le_0(),
      @iterate.in_numseg(),
    ]),
  )
  let t1141 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t1140 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1150 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t1140,
                  ),
                  t1141,
                ),
                t1142,
              ),
              t1143,
            ),
            @tactics.strip_tac,
          ),
          t1145,
        ),
        t1146,
      ),
      t1148,
    ),
    t1149,
  )
  finite_exp_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ p : Num, ∀ n : Num, 2 <= p → FINITE({(j : Num) | P(j) && EXP(p, j) <= n})"),
      t1150,
    ),
  )
}

///|
let finite_exp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_EXP_LE")

///|
/// `FINITE_EXP_LE`
pub fn finite_exp_le() -> @kernel.Thm {
  finite_exp_le_c.get()
}

///|
/// FINITE_INDICES
fn step_177() -> Unit raise {
  let t1155 = @meson.asm_meson_tac(@list.List([@int.divides_le()]))
  let t1154 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t1153 = @simp.asm_simp_tac(@list.List([finite_exp_le()]))
  let t1152 = @tactics.exists_tac(
    @term_syntax.parse_term("{(j : Num) | (P : (Num) -> Bool)(j) && EXP((p : Num), j) <= (n : Num)}"),
  )
  let t1151 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1156 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1151),
          t1152,
        ),
        t1153,
      ),
      t1154,
    ),
    t1155,
  )
  finite_indices_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ p : Num, ∀ n : Num, 2 <= p && !(n == 0) → FINITE({(j : Num) | P(j) && divides(EXP(p, j), n)})"),
      t1156,
    ),
  )
}

///|
let finite_indices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INDICES")

///|
/// `FINITE_INDICES`
pub fn finite_indices() -> @kernel.Thm {
  finite_indices_c.get()
}

///|
/// index_def
fn step_178() -> Unit raise {
  index_def_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(index : (Num, Num) -> Num)((p : Num), (n : Num)) == (if p <= 1 || n == 0 { 0 } else { CARD({(j : Num) | 1 <= j && divides(EXP(p, j), n)}) })"),
    ),
  )
}

///|
let index_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("index_def")

///|
/// `index_def`
pub fn index_def() -> @kernel.Thm {
  index_def_c.get()
}

///|
/// INDEX_0
fn step_179() -> Unit raise {
  let t1157 = @simp.rewrite_tac(@list.List([index_def()]))
  index_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, index(p, 0) == 0"), t1157))
}

///|
let index_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_0")

///|
/// `INDEX_0`
pub fn index_0() -> @kernel.Thm {
  index_0_c.get()
}

///|
/// PRIMEPOW_DIVIDES_INDEX
fn step_180() -> Unit raise {
  let t1182 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.numseg()), @iterate.card_numseg_1()]),
  )
  let t1181 = @simp.asm_simp_tac(@list.List([divides_exp_le()]))
  let t1179 = @term_syntax.parse_term("EXP((p : Num), (a : Num))")
  let t1180 = @tactics.trans_tac(divides_trans())(t1179)
  let t1178 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.not_le()])),
    @tactics.all_tac,
  ])
  let t1183 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t1178,
          ),
          @tactics.disch_tac,
        ),
        t1180,
      ),
      t1181,
    ),
    t1182,
  ])
  let t1177 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ k : Num, divides(EXP((p : Num), k), (n : Num)) == (k <= (a : Num))"),
    fn(
      x1174 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1175 = @tactics.assume_tac(x1174)
      fn(
        x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1175(x1176)
      }
    },
  )
  let t1173 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t1172 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1170 = @term_syntax.parse_term("(p : Num)")
  let t1171 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1170]),
      factorization_index(),
    ),
  )
  let t1169 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= (p : Num)"), fn(
    x1166 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1167 = @tactics.assume_tac(x1166)
    fn(
      x1168 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1167(x1168)
    }
  })
  let t1165 = @simp.asm_rewrite_tac(@list.List([@arith.exp_one(), divides_1()]))
  let t1164 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1163 = @simp.simp_tac(
    @list.List([@bool.conjunct1(@arith.le()), @class.cond_id()]),
  )
  let t1162 = @simp.asm_simp_tac(
    @list.List([
      @arith.le_0(),
      divides_1(),
      @calc_num.arith(),
      index_def(),
      divides_zero(),
    ]),
  )
  let t1161 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_zero(), @class.cond_rand(), @class.cond_rator()]),
  )
  let t1160 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1159 = @simp.asm_rewrite_tac(
    @list.List([index_0(), divides_0(), @arith.exp_eq_0()]),
  )
  let t1158 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1184 = @tactics.thenl(
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
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t1158,
                                    ),
                                    t1159,
                                  ),
                                  t1160,
                                ),
                                t1161,
                              ),
                              t1162,
                            ),
                            t1163,
                          ),
                          t1164,
                        ),
                        t1165,
                      ),
                      @class.cond_cases_tac,
                    ),
                    @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                  ),
                  t1169,
                ),
                @list.List([@int.asm_arith_tac, @tactics.all_tac]),
              ),
              t1171,
            ),
            t1172,
          ),
          t1173,
        ),
        @tactics.strip_tac,
      ),
      t1177,
    ),
    t1183,
  )
  primepow_divides_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, divides(EXP(p, k), n) == (n == 0 || p == 1 || k <= index(p, n))"),
      t1184,
    ),
  )
}

///|
let primepow_divides_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_INDEX",
)

///|
/// `PRIMEPOW_DIVIDES_INDEX`
pub fn primepow_divides_index() -> @kernel.Thm {
  primepow_divides_index_c.get()
}

///|
/// LE_INDEX
fn step_181() -> Unit raise {
  let t1190 = @simp.rewrite_tac(
    @list.List([index_def(), @calc_num.arith(), @bool.conjunct1(@arith.le())]),
  )
  let t1189 = @simp.asm_rewrite_tac(@list.List([]))
  let t1188 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1187 = @simp.asm_rewrite_tac(
    @list.List([index_0(), @bool.conjunct1(@arith.le())]),
  )
  let t1186 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1185 = @simp.rewrite_tac(@list.List([primepow_divides_index()]))
  let t1191 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1185),
            t1186,
          ),
          t1187,
        ),
        t1188,
      ),
      t1189,
    ),
    t1190,
  )
  le_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, (k <= index(p, n)) == ((n == 0 || p == 1 → k == 0) && divides(EXP(p, k), n))"),
      t1191,
    ),
  )
}

///|
let le_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_INDEX")

///|
/// `LE_INDEX`
pub fn le_index() -> @kernel.Thm {
  le_index_c.get()
}

///|
/// EXP_INDEX_DIVIDES
fn step_182() -> Unit raise {
  let t1192 = @meson.meson_tac(@list.List([le_index(), @arith.le_refl()]))
  exp_index_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, divides(EXP(p, index(p, n)), n)"),
      t1192,
    ),
  )
}

///|
let exp_index_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXP_INDEX_DIVIDES",
)

///|
/// `EXP_INDEX_DIVIDES`
pub fn exp_index_divides() -> @kernel.Thm {
  exp_index_divides_c.get()
}

///|
/// INDEX_LT
fn step_183() -> Unit raise {
  let t1206 = @simp.asm_simp_tac(@list.List([]))
  let t1205 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1202 = @drule.match_mp(@int.divides_le_strong())
  let t1204 = @tactics.disch_then(
    @tactics.conjuncts_then2(
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
          let s1200 = @tactics.mp_tac(x1199)
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
        })(t1202(x1203))
      },
    ),
  )
  let t1195 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t1193 = @equal.gsym(@arith.not_le())
  let t1194 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.de_morgan_thm()), t1193, le_index()]),
  )
  let t1207 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1194),
          t1195,
        ),
        t1204,
      ),
      t1205,
    ),
    t1206,
  )
  index_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, (!(n == 0) || !(k == 0)) && n < EXP(p, k) → index(p, n) < k"),
      t1207,
    ),
  )
}

///|
let index_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_LT")

///|
/// `INDEX_LT`
pub fn index_lt() -> @kernel.Thm {
  index_lt_c.get()
}

///|
/// INDEX_1
fn step_184() -> Unit raise {
  let t1209 = @int.arith_rule(@term_syntax.parse_term("!(1 <= (j : Num) && j == 0)"))
  let t1210 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((p : Num) <= 1) → !(p == 1)")),
      t1209,
      @sets.empty_gspec(),
      @sets.card_clauses(),
    ]),
  )
  let t1208 = @simp.rewrite_tac(
    @list.List([@int.divides_one(), @arith.exp_eq_1()]),
  )
  let t1211 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([index_def(), @calc_num.arith()])),
        ),
        @class.cond_cases_tac,
      ),
      t1208,
    ),
    t1210,
  )
  index_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, index(p, 1) == 0"), t1211))
}

///|
let index_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_1")

///|
/// `INDEX_1`
pub fn index_1() -> @kernel.Thm {
  index_1_c.get()
}

///|
/// INDEX_MUL
fn step_185() -> Unit raise {
  let t1222 = @meson.asm_meson_tac(@list.List([le_index(), @arith.le_refl()]))
  let t1221 = @tactics.match_mp_tac(divides_mul2())
  let t1223 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([le_index(), @arith.mult_eq_0(), @arith.exp_add()]),
      ),
      t1221,
    ),
    t1222,
  )
  let t1220 = @meson.asm_meson_tac(@list.List([@arith.le_add2(), le_index()]))
  let t1219 = @simp.asm_rewrite_tac(
    @list.List([le_index(), @arith.mult_eq_0()]),
  )
  let t1218 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(p : Num)"), primepow_divides_prod()),
  )
  let t1224 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @meson.meson(
              @list.List([@arith.le_refl()]),
              @term_syntax.parse_term("(∀ k : Num, k <= (m : Num) → k <= (n : Num)) → m <= n"),
            ),
          ),
          t1218,
        ),
        t1219,
      ),
      t1220,
    ),
    t1223,
  ])
  let t1217 = @list.List([
    @meson.asm_meson_tac(@list.List([prime_1()])),
    @tactics.all_tac,
  ])
  let t1216 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 1)"), fn(
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
  })
  let t1212 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())]))
  let t1225 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1212),
          t1216,
        ),
        t1217,
      ),
      @tactics.conj_tac,
    ),
    t1224,
  )
  index_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, prime((p : Num)) && !(m == 0) && !(n == 0) → index(p, m * n) == index(p, m) + index(p, n)"),
      t1225,
    ),
  )
}

///|
let index_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_MUL")

///|
/// `INDEX_MUL`
pub fn index_mul() -> @kernel.Thm {
  index_mul_c.get()
}

///|
/// INDEX_EXP
fn step_186() -> Unit raise {
  let t1228 = @simp.asm_simp_tac(
    @list.List([
      index_mul(),
      @arith.exp_eq_0(),
      @arith.exp(),
      index_1(),
      @arith.mult_clauses(),
    ]),
  )
  let t1227 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.exp_zero(),
      index_0(),
      @class.cond_rand(),
      @class.cond_rator(),
      index_1(),
      @arith.mult_clauses(),
      @class.cond_id(),
    ]),
  )
  let t1226 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1229 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@theorems.right_forall_imp_thm()]),
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.disch_tac,
              ),
              @tactics.gen_tac,
            ),
            t1226,
          ),
          t1227,
        ),
        @nums.induct_tac,
      ),
      t1228,
    ),
    @int.arith_tac,
  )
  index_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, ∀ k : Num, prime(p) → index(p, EXP(n, k)) == k * index(p, n)"),
      t1229,
    ),
  )
}

///|
let index_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_EXP")

///|
/// `INDEX_EXP`
pub fn index_exp() -> @kernel.Thm {
  index_exp_c.get()
}

///|
/// INDEX_FACT
fn step_187() -> Unit raise {
  let t1231 = @simp.asm_simp_tac(
    @list.List([index_mul(), @nums.not_suc(), @arith.fact_nz()]),
  )
  let t1230 = @simp.rewrite_tac(
    @list.List([
      @arith.fact(),
      @iterate.nsum_clauses_numseg(),
      index_1(),
      @calc_num.arith(),
    ]),
  )
  let t1232 = @tactics.then_tac(
    @tactics.then_tac(
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
        t1230,
      ),
      t1231,
    ),
    @int.arith_tac,
  )
  index_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(p) → index(p, FACT(n)) == nsum(op_dot_dot(1, n), (m : Num) => index(p, m))"),
      t1232,
    ),
  )
}

///|
let index_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_FACT")

///|
/// `INDEX_FACT`
pub fn index_fact() -> @kernel.Thm {
  index_fact_c.get()
}

///|
/// INDEX_FACT_ALT
fn step_188() -> Unit raise {
  let t1276 = @simp.asm_simp_tac(
    @list.List([
      @arith.le_rdiv_eq(),
      @arith.exp_eq_0(),
      prime_imp_nz(),
      @arith.mult_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
    ]),
  )
  let t1275 = @simp.asm_rewrite_tac(@list.List([]))
  let t1274 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == EXP((p : Num), (j : Num)) * (q : Num)"))
  let t1273 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t1272 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1271 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t1270 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1269 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.in_image(),
      @iterate.in_numseg(),
      @sets.in_elim_thm(),
      @int.divides(),
    ]),
  )
  let t1268 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(m : Num) | IN(m, op_dot_dot(1, (n : Num))) && divides(EXP((p : Num), (j : Num)), m)} == IMAGE((q : Num) => EXP(p, j) * q, op_dot_dot(1, DIV(n, EXP(p, j))))"),
    fn(
      x1266 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1266
      @simp.asm_simp_tac(
        @list.List([
          @sets.card_image_inj(),
          @iterate.finite_numseg(),
          @arith.eq_mult_lcancel(),
          th,
          @arith.exp_eq_0(),
          prime_imp_nz(),
          @iterate.card_numseg_1(),
        ]),
      )
    },
  )
  let t1265 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_const(),
      @iterate.finite_numseg(),
      @sets.finite_restrict(),
      @arith.mult_clauses(),
    ]),
  )
  let t1264 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @equal.gsym(@iterate.nsum_restrict_set())]),
  )
  let t1263 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t1262 = @tactics.match_mp_tac(@iterate.nsum_eq())
  let t1261 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t1259 = @simp.asm_simp_tac(
    @list.List([@iterate.finite_numseg(), finite_exp_le()]),
  )
  let t1253 = @drule.part_match(
    fn(x1252 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(@kernel.rand(x1252))
    },
    @iterate.nsum_swap(),
  )
  let t1277 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    fn(
                                      x1258 : (
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
                                      (fn(
                                        x1257 : (
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
                                          x1255 : @kernel.Term,
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
                                            x1254 : @kernel.Term,
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
                                            (fn(
                                              x1249 : @kernel.Thm,
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
                                              let s1250 = @tactics.mp_tac(x1249)
                                              fn(
                                                x1251 : (
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
                                                s1250(x1251)
                                              }
                                            })(t1253(x1254))
                                          })(@equal.lhand(x1255))
                                        })(
                                          (fn(
                                            x1256 : (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ) -> @kernel.Term raise {
                                            x1256.1
                                          })(x1257),
                                        )
                                      })(x1258)(x1258)
                                    },
                                    t1259,
                                  ),
                                  t1261,
                                ),
                                t1262,
                              ),
                              t1263,
                            ),
                            t1264,
                          ),
                          @tactics.strip_tac,
                        ),
                        t1265,
                      ),
                      t1268,
                    ),
                    t1269,
                  ),
                  t1270,
                ),
                t1271,
              ),
              @tactics.ap_term_tac,
            ),
            t1272,
          ),
          t1273,
        ),
        t1274,
      ),
      t1275,
    ),
    t1276,
  )
  let t1248 = @meson.asm_meson_tac(
    @list.List([@int.divides_le(), @arith.le_1(), @arith.le_trans()]),
  )
  let t1247 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1246 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_const(),
      finite_indices(),
      @arith.le_1(),
      @arith.mult_clauses(),
    ]),
  )
  let t1245 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.nsum_restrict_set()), @sets.in_elim_thm()]),
  )
  let t1244 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1278 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@iterate.nsum_eq_numseg()),
                  t1244,
                ),
                @tactics.strip_tac,
              ),
              t1245,
            ),
            t1246,
          ),
          @tactics.ap_term_tac,
        ),
        t1247,
      ),
      t1248,
    ),
    t1277,
  ])
  let t1242 = @term_syntax.parse_term("nsum(op_dot_dot(1, (n : Num)), (m : Num) => nsum({(j : Num) | 1 <= j && EXP((p : Num), j) <= n}, (j : Num) => if divides(EXP(p, j), m) { 1 } else { 0 }))")
  let t1243 = @tactics.trans_tac(@theorems.eq_trans())(t1242)
  let t1241 = @simp.asm_simp_tac(@list.List([index_def(), @arith.le_1()]))
  let t1238 = @drule.match_mp(prime_ge_2())
  let t1240 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
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
        (fn(
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
          let s1236 = @tactics.mp_tac(x1235)
          fn(
            x1237 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1236(x1237)
          }
        })(t1238(x1239))
      }),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1234 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) && 2 <= p && !(p <= 1)"),
    @tactics.strip_assume_tac,
  )
  let t1233 = @simp.asm_simp_tac(@list.List([index_fact()]))
  let t1279 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1233),
              t1234,
            ),
            t1240,
          ),
          t1241,
        ),
        t1243,
      ),
      @tactics.conj_tac,
    ),
    t1278,
  )
  index_fact_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(p) → index(p, FACT(n)) == nsum({(j : Num) | 1 <= j && EXP(p, j) <= n}, (j : Num) => DIV(n, EXP(p, j)))"),
      t1279,
    ),
  )
}

///|
let index_fact_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_FACT_ALT")

///|
/// `INDEX_FACT_ALT`
pub fn index_fact_alt() -> @kernel.Thm {
  index_fact_alt_c.get()
}

///|
/// INDEX_FACT_UNBOUNDED
fn step_189() -> Unit raise {
  let t1283 = @simp.asm_simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @theorems.imp_conj(),
      @arith.div_eq_0(),
      @arith.exp_eq_0(),
      prime_imp_nz(),
      @arith.not_le(),
    ]),
  )
  let t1282 = @tactics.match_mp_tac(@iterate.nsum_superset())
  let t1281 = @tactics.conv_tac(@equal.sym_conv)
  let t1280 = @simp.asm_simp_tac(@list.List([index_fact_alt()]))
  let t1284 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1280),
        t1281,
      ),
      t1282,
    ),
    t1283,
  )
  index_fact_unbounded_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(p) → index(p, FACT(n)) == nsum({(j : Num) | 1 <= j}, (j : Num) => DIV(n, EXP(p, j)))"),
      t1284,
    ),
  )
}

///|
let index_fact_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_FACT_UNBOUNDED",
)

///|
/// `INDEX_FACT_UNBOUNDED`
pub fn index_fact_unbounded() -> @kernel.Thm {
  index_fact_unbounded_c.get()
}

///|
/// PRIMEPOW_DIVIDES_FACT
fn step_190() -> Unit raise {
  let t1285 = @meson.meson_tac(@list.List([prime_1()]))
  let t1286 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([primepow_divides_index(), index_fact_alt(), @arith.fact_nz()]),
    ),
    t1285,
  )
  primepow_divides_fact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, ∀ k : Num, prime(p) → divides(EXP(p, k), FACT(n)) == (k <= nsum({(j : Num) | 1 <= j && EXP(p, j) <= n}, (j : Num) => DIV(n, EXP(p, j))))"),
      t1286,
    ),
  )
}

///|
let primepow_divides_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_FACT",
)

///|
/// `PRIMEPOW_DIVIDES_FACT`
pub fn primepow_divides_fact() -> @kernel.Thm {
  primepow_divides_fact_c.get()
}

///|
/// INDEX_REFL
fn step_191() -> Unit raise {
  let t1292 = @simp.asm_simp_tac(
    @list.List([
      divides_exp_le(),
      @equal.gsym(@iterate.numseg()),
      @iterate.card_numseg_1(),
    ]),
  )
  let t1291 = @class.asm_cases_tac(@term_syntax.parse_term("2 <= (n : Num)"))
  let t1290 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@arith.exp_1()]),
        @term_syntax.parse_term("divides((a : Num), (b : Num)) == divides(a, EXP(b, 1))"),
      ),
    ]),
  )
  let t1289 = @list.List([
    @int.asm_arith_tac,
    @simp.asm_rewrite_tac(@list.List([])),
  ])
  let t1288 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1287 = @simp.asm_rewrite_tac(@list.List([index_def()]))
  let t1293 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
                t1287,
              ),
              t1288,
            ),
            t1289,
          ),
          t1290,
        ),
        t1291,
      ),
      @list.List([@tactics.all_tac, @int.asm_arith_tac]),
    ),
    t1292,
  )
  index_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, index(n, n) == (if n <= 1 { 0 } else { 1 })"),
      t1293,
    ),
  )
}

///|
let index_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_REFL")

///|
/// `INDEX_REFL`
pub fn index_refl() -> @kernel.Thm {
  index_refl_c.get()
}

///|
/// INDEX_EQ_0
fn step_192() -> Unit raise {
  let t1299 = @meson.meson_tac(@list.List([]))
  let t1298 = @simp.rewrite_tac(
    @list.List([le_index(), @arith.exp_1(), @calc_num.arith()]),
  )
  let t1297 = @simp.gen_rewrite_tac(
    fn(
      x1294 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1295 = @equal.land_conv(x1294)
      fn(x1296 : @kernel.Term) -> @kernel.Thm raise { s1295(x1296) }
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) == 0) == !(1 <= n)"))]),
  )
  let t1300 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1297),
      t1298,
    ),
    t1299,
  )
  index_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, (index(p, n) == 0) == (n == 0 || p == 1 || !divides(p, n))"),
      t1300,
    ),
  )
}

///|
let index_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_EQ_0")

///|
/// `INDEX_EQ_0`
pub fn index_eq_0() -> @kernel.Thm {
  index_eq_0_c.get()
}

///|
/// INDEX_ZERO
fn step_193() -> Unit raise {
  let t1301 = @simp.simp_tac(@list.List([index_eq_0()]))
  index_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, !divides(p, n) → index(p, n) == 0"),
      t1301,
    ),
  )
}

///|
let index_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_ZERO")

///|
/// `INDEX_ZERO`
pub fn index_zero() -> @kernel.Thm {
  index_zero_c.get()
}

///|
/// INDEX_POW
fn step_194() -> Unit raise {
  let t1308 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_0(), @arith.exp_eq_1()]),
  )
  let t1307 = @simp.asm_simp_tac(
    @list.List([le_index(), @arith.le_rdiv_eq(), @arith.exp_exp()]),
  )
  let t1306 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1305 = @simp.gen_rewrite_tac(
    fn(
      x1304 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1304
    },
    @list.List([
      @meson.meson(
        @list.List([@arith.le_trans(), @arith.le_antisym()]),
        @term_syntax.parse_term("((m : Num) == (n : Num)) == (∀ d : Num, (d <= m) == (d <= n))"),
      ),
    ]),
  )
  let t1303 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@arith.div_zero(), index_eq_0(), @arith.exp()]),
    ),
    @tactics.all_tac,
  ])
  let t1302 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1309 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1302),
            t1303,
          ),
          t1305,
        ),
        t1306,
      ),
      t1307,
    ),
    t1308,
  )
  index_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, ∀ k : Num, index(EXP(p, k), n) == DIV(index(p, n), k)"),
      t1309,
    ),
  )
}

///|
let index_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_POW")

///|
/// `INDEX_POW`
pub fn index_pow() -> @kernel.Thm {
  index_pow_c.get()
}

///|
/// INDEX_PRIME
fn step_195() -> Unit raise {
  let t1311 = @meson.asm_meson_tac(
    @list.List([
      @int.prime(),
      prime_0(),
      prime_1(),
      @int.arith_rule(@term_syntax.parse_term("((p : Num) <= 1) == (p == 0 || p == 1)")),
    ]),
  )
  let t1310 = @simp.asm_rewrite_tac(@list.List([index_refl(), index_eq_0()]))
  let t1312 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @class.cond_cases_tac,
      ),
      t1310,
    ),
    t1311,
  )
  index_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) → index(a, p) == (if p == a { 1 } else { 0 })"),
      t1312,
    ),
  )
}

///|
let index_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_PRIME")

///|
/// `INDEX_PRIME`
pub fn index_prime() -> @kernel.Thm {
  index_prime_c.get()
}

///|
/// INDEX_TRIVIAL_BOUND
fn step_196() -> Unit raise {
  let t1337 = @tactics.match_mp_tac(@arith.exp_mono_le_imp())
  let t1336 = @simp.rewrite_tac(@list.List([@arith.lt_pow2_refl()]))
  let t1335 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (n : Num))"))
  let t1334 = @tactics.match_mp_tac(@arith.lte_trans())
  let t1333 = @simp.asm_rewrite_tac(@list.List([@arith.not_le()]))
  let t1330 = @drule.match_mp(@int.divides_le())
  let t1332 = @tactics.disch_then(fn(
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
    (fn(
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
      let s1328 = @tactics.mp_tac(x1327)
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
    })(t1330(x1331))
  })
  let t1326 = @simp.asm_rewrite_tac(@list.List([]))
  let t1325 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("!((m : Num) <= (n : Num)) → n <= m")),
  )
  let t1324 = @tactics.disch_then(fn(
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
      x1320 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1321 = @tactics.assume_tac(x1320)
      fn(
        x1322 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1321(x1322)
      }
    })(@equal.sym(x1323))
  })
  let t1319 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 < (p : Num) → !(p == 1)"))]),
  )
  let t1318 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.de_morgan_thm(), @arith.not_le()])),
  )
  let t1317 = @simp.rewrite_tac(@list.List([@arith.le_0()]))
  let t1316 = @simp.rewrite_tac(@list.List([index_def()]))
  let t1313 = @term_syntax.parse_term("(n : Num)")
  let t1314 = @term_syntax.parse_term("(p : Num)")
  let t1315 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1314, t1313]),
      primepow_divides_index(),
    ),
  )
  let t1338 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
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
                                  t1315,
                                ),
                                t1316,
                              ),
                              @class.cond_cases_tac,
                            ),
                            t1317,
                          ),
                          t1318,
                        ),
                        t1319,
                      ),
                      t1324,
                    ),
                    t1325,
                  ),
                  t1326,
                ),
                t1332,
              ),
              t1333,
            ),
            t1334,
          ),
          t1335,
        ),
        t1336,
      ),
      t1337,
    ),
    @int.asm_arith_tac,
  )
  index_trivial_bound_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : Num, index(p, n) <= n"), t1338),
  )
}

///|
let index_trivial_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_TRIVIAL_BOUND",
)

///|
/// `INDEX_TRIVIAL_BOUND`
pub fn index_trivial_bound() -> @kernel.Thm {
  index_trivial_bound_c.get()
}

///|
/// INDEX_DECOMPOSITION
fn step_197() -> Unit raise {
  let t1373 = @tactics.pop_assum_list(fn(
    x1372 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1367 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1368 = @tactics.mp_tac(x1367)
      fn(
        x1369 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1368(x1369)
      }
    })(@equal.sym(x1370))
  })
  let t1366 = @simp.rewrite_tac(
    @list.List([@arith.exp_add(), @arith.exp_1(), @class.contrapos_thm()]),
  )
  let t1365 = @simp.asm_rewrite_tac(@list.List([]))
  let t1364 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1363 = @simp.asm_rewrite_tac(@list.List([]))
  let t1362 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1361 = @simp.rewrite_tac(
    @list.List([
      @arith.add_eq_0(),
      @calc_num.arith_eq(),
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) + 1 <= n)")),
    ]),
  )
  let t1358 = @term_syntax.parse_term("index((p : Num), (n : Num)) + 1")
  let t1359 = @term_syntax.parse_term("(p : Num)")
  let t1360 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1359, t1358]),
      le_index(),
    ),
  )
  let t1357 = @simp.asm_rewrite_tac(@list.List([]))
  let t1356 = @tactics.disch_then(fn(
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
    (fn(
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
    })(@equal.sym(x1355))
  })
  let t1351 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1350 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1347 = @simp.gen_rewrite_rule(
    fn(
      x1346 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1346
    },
    @list.List([@int.divides()]),
  )
  let t1349 = @tactics.first_x_assum(fn(
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
    (fn(
      x1343 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1344 = @tactics.mp_tac(x1343)
      fn(
        x1345 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1344(x1345)
      }
    })(t1347(x1348))
  })
  let t1342 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t1339 = @term_syntax.parse_term("index((p : Num), (n : Num))")
  let t1340 = @term_syntax.parse_term("(p : Num)")
  let t1341 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1340, t1339]),
      le_index(),
    ),
  )
  let t1374 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
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
                                      t1341,
                                    ),
                                    t1342,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t1349,
                              ),
                              t1350,
                            ),
                            t1351,
                          ),
                          t1356,
                        ),
                        t1357,
                      ),
                      t1360,
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
          t1366,
        ),
        t1371,
      ),
      t1373,
    ),
    @int.number_tac,
  )
  index_decomposition_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∃ m : Num, EXP(p, index(p, n)) * m == n && (n == 0 || p == 1 || !divides(p, m))"),
      t1374,
    ),
  )
}

///|
let index_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_DECOMPOSITION",
)

///|
/// `INDEX_DECOMPOSITION`
pub fn index_decomposition() -> @kernel.Thm {
  index_decomposition_c.get()
}

///|
/// INDEX_DECOMPOSITION_PRIME
fn step_198() -> Unit raise {
  let t1384 = @meson.asm_meson_tac(@list.List([prime_coprime_strong()]))
  let t1383 = @simp.asm_rewrite_tac(@list.List([]))
  let t1382 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1380 = @simp.asm_rewrite_tac(@list.List([]))
  let t1381 = @list.List([@meson.asm_meson_tac(@list.List([prime_1()])), t1380])
  let t1379 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1378 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1377 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1375 = @term_syntax.parse_term("(p : Num)")
  let t1376 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1375]),
      index_decomposition(),
    ),
  )
  let t1385 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1376,
                ),
                t1377,
              ),
              t1378,
            ),
            t1379,
          ),
          t1381,
        ),
        t1382,
      ),
      t1383,
    ),
    t1384,
  )
  index_decomposition_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) → (∃ m : Num, EXP(p, index(p, n)) * m == n && (n == 0 || coprime((p, m))))"),
      t1385,
    ),
  )
}

///|
let index_decomposition_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_DECOMPOSITION_PRIME",
)

///|
/// `INDEX_DECOMPOSITION_PRIME`
pub fn index_decomposition_prime() -> @kernel.Thm {
  index_decomposition_prime_c.get()
}

///|
/// INDEX_DECOMPOSITION_LE
fn step_199() -> Unit raise {
  let t1400 = @tactics.conv_tac(@int.number_rule)
  let t1399 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t1398 = @tactics.disch_then(fn(
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
    (fn(
      x1394 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1395 = @tactics.subst1_tac(x1394)
      fn(
        x1396 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1395(x1396)
      }
    })(@equal.sym(x1397))
  })
  let t1393 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.exp_add(),
      @equal.gsym(@arith.mult_assoc()),
      @arith.eq_mult_lcancel(),
      @arith.exp_eq_0(),
    ]),
  )
  let t1392 = @tactics.disch_then(fn(
    x1389 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1390 = @tactics.subst1_tac(x1389)
    fn(
      x1391 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1390(x1391)
    }
  })
  let t1388 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1387 = @simp.rewrite_tac(
    @list.List([
      @arith.not_le(),
      @arith.lt_exists(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1386 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((p : Bool) && !(q : Bool) && !(r : Bool) → (s : Bool)) == (!q → !s → p → r)"),
      ),
    ]),
  )
  let t1401 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t1386,
                  ),
                  @tactics.disch_tac,
                ),
                t1387,
              ),
              t1388,
            ),
            t1392,
          ),
          t1393,
        ),
        t1398,
      ),
      t1399,
    ),
    t1400,
  )
  index_decomposition_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ e1 : Num, ∀ m1 : Num, ∀ e2 : Num, ∀ m2 : Num, EXP(p, e1) * m1 == EXP(p, e2) * m2 && !(p == 0) && !divides(p, m2) → e1 <= e2"),
      t1401,
    ),
  )
}

///|
let index_decomposition_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_DECOMPOSITION_LE",
)

///|
/// `INDEX_DECOMPOSITION_LE`
pub fn index_decomposition_le() -> @kernel.Thm {
  index_decomposition_le_c.get()
}

///|
/// INDEX_DECOMPOSITION_UNIQUE
fn step_200() -> Unit raise {
  let t1403 = @meson.asm_meson_tac(@list.List([index_decomposition_le()]))
  let t1402 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())]))
  let t1404 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1402),
    t1403,
  )
  index_decomposition_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ e1 : Num, ∀ m1 : Num, ∀ e2 : Num, ∀ m2 : Num, EXP(p, e1) * m1 == EXP(p, e2) * m2 && !(p == 0) && !divides(p, m1) && !divides(p, m2) → e1 == e2"),
      t1404,
    ),
  )
}

///|
let index_decomposition_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_DECOMPOSITION_UNIQUE",
)

///|
/// `INDEX_DECOMPOSITION_UNIQUE`
pub fn index_decomposition_unique() -> @kernel.Thm {
  index_decomposition_unique_c.get()
}

///|
/// INDEX_UNIQUE
fn step_201() -> Unit raise {
  let t1425 = @simp.asm_simp_tac(
    @list.List([divides_lmul2_eq(), @arith.exp_eq_0(), @arith.exp_1()]),
  )
  let t1424 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_add(),
      @int.number_rule(@term_syntax.parse_term("divides((p : Num), p * (q : Num))")),
    ]),
  )
  let t1423 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.exp_zero(),
      @arith.mult_clauses(),
      @calc_num.arith(),
      divides_1(),
      divides_zero(),
    ]),
  )
  let t1422 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_eq_0(), divides_zero()]),
  )
  let t1421 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1420 = @simp.asm_rewrite_tac(
    @list.List([divides_0(), @arith.mult_eq_0()]),
  )
  let t1419 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1418 = @simp.asm_rewrite_tac(@list.List([divides_1()]))
  let t1417 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1416 = @tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 0 → (e : Num) == 0"))
  let t1415 = @tactics.pop_assum(fn(
    x1412 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1413 = @tactics.mp_tac(x1412)
    fn(
      x1414 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1413(x1414)
    }
  })
  let t1411 = @tactics.first_x_assum(fn(
    x1410 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1407 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1408 = @tactics.subst1_tac(x1407)
      fn(
        x1409 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1408(x1409)
      }
    })(@equal.sym(x1410))
  })
  let t1406 = @simp.rewrite_tac(
    @list.List([le_index(), @int.arith_rule(@term_syntax.parse_term("!((e : Num) + 1 == 0)"))]),
  )
  let t1405 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((i : Num) == (e : Num)) == (e <= i && !(e + 1 <= i))")),
    ]),
  )
  let t1426 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
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
                                t1405,
                              ),
                              t1406,
                            ),
                            t1411,
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
            ),
            t1422,
          ),
          @tactics.disch_tac,
        ),
        t1423,
      ),
      t1424,
    ),
    t1425,
  )
  index_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, ∀ e : Num, EXP(p, e) * m == n && (p == 0 → e == 0) && !divides(p, m) → index(p, n) == e"),
      t1426,
    ),
  )
}

///|
let index_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_UNIQUE")

///|
/// `INDEX_UNIQUE`
pub fn index_unique() -> @kernel.Thm {
  index_unique_c.get()
}

///|
/// INDEX_UNIQUE_EQ
fn step_202() -> Unit raise {
  let t1431 = @meson.meson_tac(@list.List([@arith.le_antisym()]))
  let t1430 = @simp.asm_rewrite_tac(@list.List([primepow_divides_index()]))
  let t1428 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.de_morgan_thm()])),
  )
  let t1427 = @meson.asm_meson_tac(@list.List([@arith.le_refl()]))
  let t1429 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([index_def()])), t1427),
    t1428,
  ])
  let t1432 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @class.cond_cases_tac,
        ),
        t1429,
      ),
      t1430,
    ),
    t1431,
  )
  index_unique_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, (index(p, n) == k) == (if p == 1 || n == 0 { k == 0 } else { ∀ j : Num, divides(EXP(p, j), n) == (j <= k) })"),
      t1432,
    ),
  )
}

///|
let index_unique_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_UNIQUE_EQ",
)

///|
/// `INDEX_UNIQUE_EQ`
pub fn index_unique_eq() -> @kernel.Thm {
  index_unique_eq_c.get()
}

///|
/// INDEX_UNIQUE_ALT
fn step_203() -> Unit raise {
  let t1441 = @meson.asm_meson_tac(
    @list.List([divides_exp_le_imp(), divides_trans()]),
  )
  let t1440 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) < (j : Num)) == (k + 1 <= j)"))]),
  )
  let t1439 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_lt()), @class.contrapos_thm()]),
  )
  let t1438 = @tactics.undisch_tac(
    @term_syntax.parse_term("!divides(EXP((p : Num), (k : Num) + 1), (n : Num))"),
  )
  let t1437 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([divides_exp_le_imp(), divides_trans()])),
  ])
  let t1436 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t1435 = @simp.asm_rewrite_tac(@list.List([]))
  let t1434 = @simp.asm_rewrite_tac(@list.List([]))
  let t1433 = @simp.rewrite_tac(@list.List([index_unique_eq()]))
  let t1442 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.gen_tac),
                                t1433,
                              ),
                              @class.cond_cases_tac,
                            ),
                            t1434,
                          ),
                          @tactics.eq_tac,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1435,
                    ),
                    @list.List([@int.arith_tac, @tactics.all_tac]),
                  ),
                  t1436,
                ),
                @tactics.eq_tac,
              ),
              @tactics.disch_tac,
            ),
            t1437,
          ),
          t1438,
        ),
        t1439,
      ),
      t1440,
    ),
    t1441,
  )
  index_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, ∀ k : Num, (index(p, n) == k) == (if p == 1 || n == 0 { k == 0 } else { divides(EXP(p, k), n) && !divides(EXP(p, k + 1), n) })"),
      t1442,
    ),
  )
}

///|
let index_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_UNIQUE_ALT",
)

///|
/// `INDEX_UNIQUE_ALT`
pub fn index_unique_alt() -> @kernel.Thm {
  index_unique_alt_c.get()
}

///|
/// INDEX_ADD_MIN
fn step_204() -> Unit raise {
  let t1452 = @tactics.match_mp_tac(divides_exp_le_imp())
  let t1451 = @simp.rewrite_tac(@list.List([exp_index_divides()]))
  let t1449 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), index(p, (n : Num)))"))
  let t1450 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), index(p, (m : Num)))")),
    t1449,
  ])
  let t1448 = @tactics.match_mp_tac(divides_trans())
  let t1447 = @tactics.match_mp_tac(divides_add())
  let t1446 = @simp.asm_simp_tac(
    @list.List([
      @arith.add_eq_0(),
      index_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("(MIN((a : Num), (b : Num)) == 0) == (a == 0 || b == 0)")),
    ]),
  )
  let t1444 = @simp.rewrite_tac(@list.List([le_index()]))
  let t1445 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([index_def()])),
      @int.arith_tac,
    ),
    t1444,
  ])
  let t1443 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1453 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t1443,
                    ),
                    t1445,
                  ),
                  t1446,
                ),
                t1447,
              ),
              @tactics.conj_tac,
            ),
            t1448,
          ),
          t1450,
        ),
        t1451,
      ),
      t1452,
    ),
    @int.arith_tac,
  )
  index_add_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, MIN(index(p, m), index(p, n)) <= index(p, m + n)"),
      t1453,
    ),
  )
}

///|
let index_add_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_ADD_MIN")

///|
/// `INDEX_ADD_MIN`
pub fn index_add_min() -> @kernel.Thm {
  index_add_min_c.get()
}

///|
/// INDEX_SUB_MIN
fn step_205() -> Unit raise {
  let t1465 = @tactics.match_mp_tac(divides_exp_le_imp())
  let t1464 = @simp.rewrite_tac(@list.List([exp_index_divides()]))
  let t1462 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), index(p, (m : Num)))"))
  let t1463 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), index(p, (n : Num)))")),
    t1462,
  ])
  let t1461 = @tactics.match_mp_tac(divides_trans())
  let t1460 = @simp.asm_simp_tac(
    @list.List([@arith.sub_add(), @arith.lt_imp_le()]),
  )
  let t1459 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1458 = @tactics.match_mp_tac(divides_add_revl())
  let t1457 = @simp.asm_simp_tac(
    @list.List([@arith.sub_eq_0(), @equal.gsym(@arith.not_lt())]),
  )
  let t1455 = @simp.rewrite_tac(@list.List([le_index()]))
  let t1456 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([index_def()])),
      @int.arith_tac,
    ),
    t1455,
  ])
  let t1454 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1466 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t1454,
                        ),
                        t1456,
                      ),
                      t1457,
                    ),
                    t1458,
                  ),
                  t1459,
                ),
                t1460,
              ),
              @tactics.conj_tac,
            ),
            t1461,
          ),
          t1463,
        ),
        t1464,
      ),
      t1465,
    ),
    @int.arith_tac,
  )
  index_sub_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ m : Num, ∀ n : Num, n < m → MIN(index(p, m), index(p, n)) <= index(p, m - n)"),
      t1466,
    ),
  )
}

///|
let index_sub_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_SUB_MIN")

///|
/// `INDEX_SUB_MIN`
pub fn index_sub_min() -> @kernel.Thm {
  index_sub_min_c.get()
}

///|
/// INDEX_ADD
fn step_206() -> Unit raise {
  let t1475 = @simp.asm_rewrite_tac(@list.List([primepow_divides_index()]))
  let t1473 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([divides_add_revr()]),
      @term_syntax.parse_term("divides((p : Num), (m : Num)) && !divides(p, (n : Num)) → !divides(p, m + n)"),
    ),
  )
  let t1474 = @list.List([@tactics.match_mp_tac(divides_add()), t1473])
  let t1472 = @simp.asm_rewrite_tac(
    @list.List([index_unique_alt(), @arith.add_eq_0()]),
  )
  let t1470 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1471 = @list.List([
    @meson.asm_meson_tac(@list.List([index_eq_0(), @arith.lt_refl()])),
    t1470,
  ])
  let t1469 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1468 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1467 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1476 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t1467,
                  ),
                  t1468,
                ),
                t1469,
              ),
              t1471,
            ),
            t1472,
          ),
          @tactics.conj_tac,
        ),
        t1474,
      ),
      t1475,
    ),
    @int.asm_arith_tac,
  )
  index_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, ∀ m : Num, !(n == 0) && (!(m == 0) → index(p, n) < index(p, m)) → index(p, m + n) == index(p, n)"),
      t1476,
    ),
  )
}

///|
let index_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_ADD")

///|
/// `INDEX_ADD`
pub fn index_add() -> @kernel.Thm {
  index_add_c.get()
}

///|
/// INDEX_MULT_BASE
fn step_207() -> Unit raise {
  let t1492 = @meson.asm_meson_tac(
    @list.List([index_decomposition(), @arith.le_refl()]),
  )
  let t1491 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_1(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t1490 = @simp.asm_simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.exp_add()),
    ]),
  )
  let t1489 = @simp.asm_rewrite_tac(@list.List([]))
  let t1488 = @tactics.match_mp_tac(index_unique())
  let t1487 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t1486 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1483 = @tactics.pop_assum(fn(
    x1480 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1481 = @tactics.mp_tac(x1480)
    fn(
      x1482 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1481(x1482)
    }
  })
  let t1484 = @tactics.then_tac(
    @tactics.rule_assum_tac(
      @simp.rewrite_rule(@list.List([@class.de_morgan_thm()])),
    ),
    t1483,
  )
  let t1479 = @meson.asm_meson_tac(@list.List([@arith.mult_eq_0()]))
  let t1485 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([index_def()])), t1479),
    t1484,
  ])
  let t1477 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1478 = @list.List([
    @meson.meson_tac(@list.List([@arith.mult_sym()])),
    t1477,
  ])
  let t1493 = @tactics.then_tac(
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
                          @tactics.match_mp_tac(
                            @class.taut(
                              @term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q"),
                            ),
                          ),
                          @tactics.conj_tac,
                        ),
                        t1478,
                      ),
                      @class.cond_cases_tac,
                    ),
                    t1485,
                  ),
                  t1486,
                ),
                t1487,
              ),
              @tactics.strip_tac,
            ),
            t1488,
          ),
          t1489,
        ),
        t1490,
      ),
      t1491,
    ),
    t1492,
  )
  index_mult_base_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Num, ∀ n : Num, index(p, p * n) == (if p <= 1 || n == 0 { 0 } else { index(p, n) + 1 })) && (∀ p : Num, ∀ n : Num, index(p, n * p) == (if p <= 1 || n == 0 { 0 } else { index(p, n) + 1 }))"),
      t1493,
    ),
  )
}

///|
let index_mult_base_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_MULT_BASE",
)

///|
/// `INDEX_MULT_BASE`
pub fn index_mult_base() -> @kernel.Thm {
  index_mult_base_c.get()
}

///|
/// INDEX_MULT_EXP
fn step_208() -> Unit raise {
  let t1505 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_0(), @arith.exp_eq_0()]),
  )
  let t1504 = @simp.asm_rewrite_tac(
    @list.List([index_mult_base(), @arith.add1(), @arith.add_clauses()]),
  )
  let t1503 = @simp.rewrite_tac(
    @list.List([
      @arith.exp(),
      @arith.mult_clauses(),
      @equal.gsym(@arith.mult_assoc()),
    ]),
  )
  let t1501 = @simp.asm_rewrite_tac(@list.List([]))
  let t1502 = @list.List([
    @simp.asm_rewrite_tac(@list.List([index_def(), @arith.mult_clauses()])),
    t1501,
  ])
  let t1500 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1499 = @list.List([
    @simp.asm_rewrite_tac(@list.List([index_def()])),
    @tactics.all_tac,
  ])
  let t1498 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) <= 1"))
  let t1497 = @list.List([
    @simp.asm_rewrite_tac(@list.List([index_def(), @calc_num.arith()])),
    @tactics.all_tac,
  ])
  let t1496 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1494 = @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac)
  let t1495 = @list.List([
    @simp.rewrite_tac(
      @list.List([@arith.mult_sym(), @arith.add_sym(), @theorems.disj_sym()]),
    ),
    t1494,
  ])
  let t1506 = @tactics.then_tac(
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
                            @tactics.match_mp_tac(
                              @class.taut(
                                @term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q"),
                              ),
                            ),
                            @tactics.conj_tac,
                          ),
                          t1495,
                        ),
                        t1496,
                      ),
                      t1497,
                    ),
                    t1498,
                  ),
                  t1499,
                ),
                t1500,
              ),
              t1502,
            ),
            @nums.induct_tac,
          ),
          t1503,
        ),
        t1504,
      ),
      t1505,
    ),
    @int.arith_tac,
  )
  index_mult_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Num, ∀ n : Num, ∀ k : Num, index(p, EXP(p, k) * n) == (if p <= 1 || n == 0 { 0 } else { k + index(p, n) })) && (∀ p : Num, ∀ n : Num, ∀ k : Num, index(p, n * EXP(p, k)) == (if n == 0 || p <= 1 { 0 } else { index(p, n) + k }))"),
      t1506,
    ),
  )
}

///|
let index_mult_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_MULT_EXP")

///|
/// `INDEX_MULT_EXP`
pub fn index_mult_exp() -> @kernel.Thm {
  index_mult_exp_c.get()
}

///|
/// INDEX_MULT_ADD
fn step_209() -> Unit raise {
  let t1514 = @simp.asm_rewrite_tac(@list.List([]))
  let t1513 = @simp.rewrite_tac(@list.List([index_mult_exp()]))
  let t1512 = @simp.asm_simp_tac(
    @list.List([@arith.mult_eq_0(), @arith.exp_eq_0(), @class.de_morgan_thm()]),
  )
  let t1511 = @tactics.match_mp_tac(index_add())
  let t1510 = @list.List([
    @simp.asm_rewrite_tac(@list.List([index_def()])),
    @tactics.all_tac,
  ])
  let t1509 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) <= 1"))
  let t1507 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1508 = @list.List([
    @simp.rewrite_tac(
      @list.List([@arith.mult_sym(), @arith.add_sym(), @theorems.disj_sym()]),
    ),
    t1507,
  ])
  let t1515 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
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
                    t1508,
                  ),
                  t1509,
                ),
                t1510,
              ),
              @tactics.strip_tac,
            ),
            t1511,
          ),
          t1512,
        ),
        t1513,
      ),
      t1514,
    ),
    @int.asm_arith_tac,
  )
  index_mult_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Num, ∀ m : Num, ∀ n : Num, ∀ k : Num, !(n == 0) && index(p, n) < k → index(p, EXP(p, k) * m + n) == index(p, n)) && (∀ p : Num, ∀ m : Num, ∀ n : Num, ∀ k : Num, !(n == 0) && index(p, n) < k → index(p, m * EXP(p, k) + n) == index(p, n)) && (∀ p : Num, ∀ m : Num, ∀ n : Num, ∀ k : Num, !(n == 0) && index(p, n) < k → index(p, n + m * EXP(p, k)) == index(p, n)) && (∀ p : Num, ∀ m : Num, ∀ n : Num, ∀ k : Num, !(n == 0) && index(p, n) < k → index(p, n + EXP(p, k) * m) == index(p, n))"),
      t1515,
    ),
  )
}

///|
let index_mult_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_MULT_ADD")

///|
/// `INDEX_MULT_ADD`
pub fn index_mult_add() -> @kernel.Thm {
  index_mult_add_c.get()
}

///|
/// INDEX_NSUM_LE
fn step_210() -> Unit raise {
  let t1524 = @drule.part_match(@kernel.rand, index_add_min())
  let t1520 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1519 = @simp.asm_rewrite_tac(@list.List([]))
  let t1518 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1517 = @simp.rewrite_tac(@list.List([]))
  let t1516 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(m : Num) => (n : Num) <= index((p : Num), m)"),
      @iterate.nsum_closed_nonempty(),
    ),
  )
  let t1530 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1516),
              t1517,
            ),
            t1518,
          ),
          t1519,
        ),
        t1520,
      ),
      fn(
        x1529 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1528 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x1526 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x1525 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x1521 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s1522 = @tactics.mp_tac(x1521)
                fn(
                  x1523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s1522(x1523)
                }
              })(t1524(x1525))
            })(@kernel.rand(x1526))
          })(
            (fn(
              x1527 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x1527.1
            })(x1528),
          )
        })(x1529)(x1529)
      },
    ),
    @int.asm_arith_tac,
  )
  index_nsum_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Num, ∀ p : Num, ∀ n : Num, ∀ k : (A) -> Bool, FINITE(k) && !(k == {}) && (∀ a : A, IN(a, k) → n <= index(p, f(a))) → n <= index(p, nsum(k, f))"),
      t1530,
    ),
  )
}

///|
let index_nsum_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_NSUM_LE")

///|
/// `INDEX_NSUM_LE`
pub fn index_nsum_le() -> @kernel.Thm {
  index_nsum_le_c.get()
}

///|
/// DIVIDES_INDEX
fn step_211() -> Unit raise {
  let t1542 = @meson.meson_tac(@list.List([]))
  let t1541 = @simp.gen_rewrite_tac(
    fn(
      x1538 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1539 = @equal.land_conv(x1538)
      fn(x1540 : @kernel.Term) -> @kernel.Thm raise { s1539(x1540) }
    },
    @list.List([primepow_divisors_divides()]),
  )
  let t1537 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t1536 = @simp.rewrite_tac(@list.List([le_index()]))
  let t1535 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@arith.le_refl(), @arith.le_antisym(), @arith.le_trans()]),
        @term_syntax.parse_term("((m : Num) <= (n : Num)) == (∀ k : Num, k <= m → k <= n)"),
      ),
    ]),
  )
  let t1534 = @simp.asm_rewrite_tac(@list.List([divides_zero()]))
  let t1533 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1532 = @simp.asm_rewrite_tac(@list.List([divides_0()]))
  let t1531 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1543 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t1531,
                  ),
                  t1532,
                ),
                t1533,
              ),
              t1534,
            ),
            t1535,
          ),
          t1536,
        ),
        t1537,
      ),
      t1541,
    ),
    t1542,
  )
  divides_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, n) == (n == 0 || !(m == 0) && (∀ p : Num, prime(p) → index(p, m) <= index(p, n)))"),
      t1543,
    ),
  )
}

///|
let divides_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_INDEX")

///|
/// `DIVIDES_INDEX`
pub fn divides_index() -> @kernel.Thm {
  divides_index_c.get()
}

///|
/// EQ_INDEX
fn step_212() -> Unit raise {
  let t1552 = @meson.meson_tac(@list.List([@arith.le_antisym()]))
  let t1551 = @simp.asm_rewrite_tac(@list.List([]))
  let t1549 = @term_syntax.parse_term("(n : Num) == 0")
  let t1550 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1549]),
  )
  let t1548 = @simp.rewrite_tac(@list.List([divides_index()]))
  let t1547 = @simp.gen_rewrite_tac(
    fn(
      x1544 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1545 = @equal.land_conv(x1544)
      fn(x1546 : @kernel.Term) -> @kernel.Thm raise { s1545(x1546) }
    },
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t1553 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1547),
          t1548,
        ),
        t1550,
      ),
      t1551,
    ),
    t1552,
  )
  eq_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == n) == ((m == 0) == (n == 0) && (∀ p : Num, prime(p) → index(p, m) == index(p, n)))"),
      t1553,
    ),
  )
}

///|
let eq_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_INDEX")

///|
/// `EQ_INDEX`
pub fn eq_index() -> @kernel.Thm {
  eq_index_c.get()
}

///|
/// COPRIME_INDEX
fn step_213() -> Unit raise {
  let t1557 = @meson.meson_tac(@list.List([coprime_prime_eq()]))
  let t1556 = @simp.asm_simp_tac(
    @list.List([
      index_eq_0(),
      coprime_0(),
      @meson.meson(
        @list.List([prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t1554 = @term_syntax.parse_term("(n : Num) == 0")
  let t1555 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1554]),
  )
  let t1558 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1555),
      t1556,
    ),
    t1557,
  )
  coprime_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, coprime((m, n)) == ((m == 0 → n == 1) && (n == 0 → m == 1) && (∀ p : Num, prime(p) → index(p, m) == 0 || index(p, n) == 0))"),
      t1558,
    ),
  )
}

///|
let coprime_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_INDEX")

///|
/// `COPRIME_INDEX`
pub fn coprime_index() -> @kernel.Thm {
  coprime_index_c.get()
}

///|
/// INDEX_GCD
fn step_214() -> Unit raise {
  let t1571 = @meson.meson_tac(
    @list.List([@arith.le_refl(), @arith.le_antisym(), @arith.le_trans()]),
  )
  let t1570 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((k : Num) <= (m : Num) && k <= (n : Num)) == (k <= MIN(m, n))")),
    ]),
  )
  let t1569 = @simp.asm_rewrite_tac(@list.List([gcd_zero()]))
  let t1568 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t1567 = @simp.asm_rewrite_tac(@list.List([primepow_divides_index()]))
  let t1563 = @term_syntax.parse_term("EXP((p : Num), (k : Num))")
  let t1564 = @term_syntax.parse_term("(n : Num)")
  let t1565 = @bool.specl(
    @list.List([@term_syntax.parse_term("(m : Num)"), t1564, t1563]),
    divides_gcd(),
  )
  let t1566 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(k : Num)"), t1565))
  let t1562 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("MIN(0, (n : Num)) == 0 && MIN((m : Num), 0) == 0")),
    ]),
  )
  let t1561 = @simp.asm_simp_tac(@list.List([gcd_0(), index_0()]))
  let t1559 = @term_syntax.parse_term("(n : Num) == 0")
  let t1560 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1559]),
  )
  let t1572 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t1560,
                  ),
                  t1561,
                ),
                t1562,
              ),
              t1566,
            ),
            t1567,
          ),
          t1568,
        ),
        t1569,
      ),
      t1570,
    ),
    t1571,
  )
  index_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, prime(p) → index(p, gcd((m, n))) == (if m == 0 { index(p, n) } else { if n == 0 { index(p, m) } else { MIN(index(p, m), index(p, n)) } })"),
      t1572,
    ),
  )
}

///|
let index_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_GCD")

///|
/// `INDEX_GCD`
pub fn index_gcd() -> @kernel.Thm {
  index_gcd_c.get()
}

///|
/// FORALL_PRIME_INDEX
fn step_215() -> Unit raise {
  let t1587 = @drule.match_mp(prime_ge_2())
  let t1589 = @tactics.first_x_assum(fn(
    x1588 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1585 = @tactics.mp_tac(x1584)
      fn(
        x1586 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1585(x1586)
      }
    })(t1587(x1588))
  })
  let t1583 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1582 = @simp.asm_simp_tac(
    @list.List([index_exp(), index_refl(), @arith.exp_eq_0(), prime_imp_nz()]),
  )
  let t1578 = @term_syntax.parse_term("EXP((p : Num), (k : Num))")
  let t1581 = @tactics.first_x_assum(fn(
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
      let s1576 = @tactics.mp_tac(x1575)
      fn(
        x1577 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1576(x1577)
      }
    })(((x1579 : @kernel.Thm) => @bool.spec(t1578, x1579))(x1580))
  })
  let t1574 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1573 = @simp.asm_rewrite_tac(@list.List([]))
  let t1590 = @tactics.then_tac(
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
                    @tactics.strip_tac,
                  ),
                  t1573,
                ),
                t1574,
              ),
              t1581,
            ),
            t1582,
          ),
          t1583,
        ),
        @tactics.ap_term_tac,
      ),
      t1589,
    ),
    @int.arith_tac,
  )
  forall_prime_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Num, prime(p) → (∀ P : (Num) -> Bool, (∀ x : Num, P(index(p, x))) == (∀ k : Num, P(k)))) && (∀ p : Num, prime(p) → (∀ P : (Num) -> Bool, (∀ x : Num, !(x == 0) → P(index(p, x))) == (∀ k : Num, P(k))))"),
      t1590,
    ),
  )
}

///|
let forall_prime_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_PRIME_INDEX",
)

///|
/// `FORALL_PRIME_INDEX`
pub fn forall_prime_index() -> @kernel.Thm {
  forall_prime_index_c.get()
}

///|
/// INDEX_FACT_PRIME_MULT
fn step_216() -> Unit raise {
  let t1607 = @drule.match_mp(prime_ge_2())
  let t1609 = @tactics.first_x_assum(fn(
    x1608 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1604 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1605 = @tactics.mp_tac(x1604)
      fn(
        x1606 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1605(x1606)
      }
    })(t1607(x1608))
  })
  let t1603 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1602 = @simp.rewrite_tac(@list.List([index_refl()]))
  let t1601 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_const(),
      @iterate.finite_numseg(),
      @iterate.card_numseg_1(),
    ]),
  )
  let t1600 = @simp.rewrite_tac(
    @list.List([@class.eta_ax(), @arith.eq_add_rcancel()]),
  )
  let t1599 = @simp.asm_simp_tac(
    @list.List([
      index_mul(),
      @arith.le_1(),
      prime_imp_nz(),
      @iterate.nsum_add_numseg(),
    ]),
  )
  let t1610 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.asm_simp_tac(
                    @list.List([
                      @iterate.nsum_image(),
                      @arith.eq_mult_lcancel(),
                      prime_imp_nz(),
                      @trivia.o_def(),
                    ]),
                  ),
                  t1599,
                ),
                t1600,
              ),
              t1601,
            ),
            t1602,
          ),
          @class.cond_cases_tac,
        ),
        t1603,
      ),
      t1609,
    ),
    @int.asm_arith_tac,
  )
  let t1598 = @meson.asm_meson_tac(@list.List([prime_0()]))
  let t1597 = @simp.rewrite_tac(
    @list.List([
      @iterate.in_numseg(),
      @arith.le_mult_lcancel(),
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
      @arith.mult_eq_0(),
      @sets.in_image(),
      @sets.in_univ(),
      index_eq_0(),
      @int.divides(),
    ]),
  )
  let t1596 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, IN((f : (_) -> _)(x), (t : (_) -> Bool)) == IN(x, (s : (_) -> Bool))) && (∀ y : _, !(P : (_) -> Bool)(y) → IN(y, IMAGE(f, UNIV))) → SUBSET(IMAGE(f, s), t) && (∀ y : _, IN(y, t) && !IN(y, IMAGE(f, s)) → P(y))"),
    ),
  )
  let t1611 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@iterate.nsum_superset()),
          t1596,
        ),
        t1597,
      ),
      t1598,
    ),
    t1610,
  ])
  let t1594 = @term_syntax.parse_term("nsum(IMAGE((i : Num) => (p : Num) * i, op_dot_dot(1, (n : Num))), (m : Num) => index(p, m))")
  let t1595 = @tactics.trans_tac(@theorems.eq_trans())(t1594)
  let t1593 = @simp.asm_simp_tac(
    @list.List([index_fact(), @arith.mult_eq_0(), prime_imp_nz(), index_mul()]),
  )
  let t1592 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.fact(),
      index_1(),
      @arith.add_clauses(),
    ]),
  )
  let t1591 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1612 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1591),
            t1592,
          ),
          t1593,
        ),
        t1595,
      ),
      @tactics.conj_tac,
    ),
    t1611,
  )
  index_fact_prime_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ n : Num, prime(p) → index(p, FACT(p * n)) == n + index(p, FACT(n))"),
      t1612,
    ),
  )
}

///|
let index_fact_prime_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDEX_FACT_PRIME_MULT",
)

///|
/// `INDEX_FACT_PRIME_MULT`
pub fn index_fact_prime_mult() -> @kernel.Thm {
  index_fact_prime_mult_c.get()
}

///|
/// PRIME_FACTORIZATION_INDEX
fn step_217() -> Unit raise {
  let t1656 = @simp.asm_simp_tac(
    @list.List([index_eq_0(), divides_prime_prime()]),
  )
  let t1657 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_tac,
      @simp.rewrite_tac(
        @list.List([@arith.eq_add_rcancel_0(), @arith.mult_eq_0()]),
      ),
    ),
    t1656,
  )
  let t1653 = @drule.match_mp(prime_ge_2())
  let t1655 = @tactics.first_assum(fn(
    x1654 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1650 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1651 = @tactics.mp_tac(x1650)
      fn(
        x1652 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1651(x1652)
      }
    })(t1653(x1654))
  })
  let t1658 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @class.cond_cases_tac,
          @simp.rewrite_tac(
            @list.List([@arith.add_clauses(), @arith.mult_clauses()]),
          ),
        ),
        t1655,
      ),
      @int.asm_arith_tac,
    ),
    t1657,
  ])
  let t1649 = @simp.asm_simp_tac(@list.List([index_refl()]))
  let t1645 = @term_syntax.parse_term("(q : Num)")
  let t1648 = @tactics.first_x_assum(fn(
    x1647 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1643 = @tactics.mp_tac(x1642)
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
    })(((x1646 : @kernel.Thm) => @bool.spec(t1645, x1646))(x1647))
  })
  let t1641 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t1640 = @simp.asm_simp_tac(
    @list.List([index_mul(), @arith.mult_eq_0(), @arith.exp_eq_0(), index_exp()]),
  )
  let t1639 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : (Num) -> Num)(p)) * (n : Num)"))
  let t1638 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1635 = @drule.match_mp(prime_imp_nz())
  let t1637 = @tactics.first_assum(fn(
    x1636 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1632 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1633 = @tactics.assume_tac(x1632)
      fn(
        x1634 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1633(x1634)
      }
    })(t1635(x1636))
  })
  let t1631 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1630 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t1629 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t1628 = @simp.rewrite_tac(@list.List([]))
  let t1624 = @term_syntax.parse_term("(i : Num) => if i == (p : Num) { 0 } else { (k : (Num) -> Num)(i) }")
  let t1627 = @tactics.first_x_assum(fn(
    x1626 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(((x1625 : @kernel.Thm) => @bool.spec(t1624, x1625))(x1626))
  })
  let t1620 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (Num) -> Num)"))
  let t1619 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t1659 = @tactics.thenl(
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
                                        @tactics.map_every(
                                          @tactics.x_gen_tac,
                                          @list.List([
                                            @term_syntax.parse_term("(p : Num)"),
                                            t1619,
                                          ]),
                                        ),
                                        @tactics.strip_tac,
                                      ),
                                      t1620,
                                    ),
                                    @tactics.strip_tac,
                                  ),
                                  t1627,
                                ),
                                t1628,
                              ),
                              @tactics.ants_tac,
                            ),
                            t1629,
                          ),
                          t1630,
                        ),
                        t1631,
                      ),
                      t1637,
                    ),
                    t1638,
                  ),
                  t1639,
                ),
                t1640,
              ),
              t1641,
            ),
            @tactics.disch_tac,
          ),
          t1648,
        ),
        @class.cond_cases_tac,
      ),
      t1649,
    ),
    t1658,
  )
  let t1618 = @meson.meson_tac(
    @list.List([index_1(), @int.arith_rule(@term_syntax.parse_term("!(1 == 0)"))]),
  )
  let t1660 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("SUBSET({(p : Num) | prime(p) && !(Z : (Num) -> Bool)(p)}, {}) == (∀ p : Num, prime(p) → Z(p))"),
          ),
        ]),
      ),
      t1618,
    ),
    t1659,
  ])
  let t1617 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1616 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@sets.subset_refl()])),
  ])
  let t1661 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → (∀ k : (Num) -> Num, SUBSET({(p : Num) | prime(p) && !(k(p) == 0)}, s) → (∃ n : Num, !(n == 0) && (∀ p : Num, prime(p) → index(p, n) == k(p))))"),
            fn(
              x1613 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s1614 = @tactics.mp_tac(x1613)
              fn(
                x1615 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s1614(x1615)
              }
            },
          ),
          t1616,
        ),
        t1617,
      ),
      @tactics.conj_tac,
    ),
    t1660,
  )
  prime_factorization_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (Num) -> Num, FINITE({(p : Num) | prime(p) && !(k(p) == 0)}) → (∃ n : Num, !(n == 0) && (∀ p : Num, prime(p) → index(p, n) == k(p)))"),
      t1661,
    ),
  )
}

///|
let prime_factorization_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTORIZATION_INDEX",
)

///|
/// `PRIME_FACTORIZATION_INDEX`
pub fn prime_factorization_index() -> @kernel.Thm {
  prime_factorization_index_c.get()
}

///|
/// PRIME_POWER_EXISTS
fn step_218() -> Unit raise {
  let t1707 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t1706 = @tactics.conv_tac(
    @equal.once_depth_conv(@calc_num.expand_cases_conv),
  )
  let t1705 = @simp.rewrite_tac(
    @list.List([prime_alt(), @theorems.imp_conj_alt(), @int.divides_mod()]),
  )
  let t1704 = @simp.asm_rewrite_tac(@list.List([divides_0(), @class.not_imp()]))
  let t1703 = @tactics.first_x_assum(fn(
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
    let th = x1700
    let t1702 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("2"), th))
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("3"), th)),
      t1702,
    )
  })
  let t1699 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([prime_1()])),
  ])
  let t1698 = @simp.asm_rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t1696 = @tactics.disch_then(fn(
    x1693 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1694 = @tactics.subst_all_tac(x1693)
    fn(
      x1695 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1694(x1695)
    }
  })
  let t1697 = @list.List([
    @meson.asm_meson_tac(@list.List([divides_exp2()])),
    t1696,
  ])
  let t1689 = @term_syntax.parse_term("(p : Num)")
  let t1692 = @tactics.first_assum(fn(
    x1691 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1686 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1687 = @tactics.mp_tac(x1686)
      fn(
        x1688 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1687(x1688)
      }
    })(((x1690 : @kernel.Thm) => @bool.spec(t1689, x1690))(x1691))
  })
  let t1685 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1684 = @class.asm_cases_tac(@term_syntax.parse_term("divides(EXP((p : Num), (k : Num)), (n : Num))"))
  let t1683 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), divides_1(), le_index()]),
  )
  let t1682 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1680 = @term_syntax.parse_term("(k : Num)")
  let t1681 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t1680]),
  )
  let t1708 = @tactics.then_tac(
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.exists_tac(
                                          @term_syntax.parse_term("index((q : Num), (n : Num))"),
                                        ),
                                        t1681,
                                      ),
                                      @tactics.strip_tac,
                                    ),
                                    t1682,
                                  ),
                                  t1683,
                                ),
                                t1684,
                              ),
                              t1685,
                            ),
                            t1692,
                          ),
                          @tactics.ants_tac,
                        ),
                        t1697,
                      ),
                      t1698,
                    ),
                    @tactics.conj_tac,
                  ),
                  t1699,
                ),
                @tactics.disch_tac,
              ),
              t1703,
            ),
            t1704,
          ),
          t1705,
        ),
        t1706,
      ),
      t1707,
    ),
    @int.arith_tac,
  )
  let t1679 = @simp.asm_simp_tac(
    @list.List([@arith.exp_1(), @calc_num.arith_eq()]),
  )
  let t1674 = @term_syntax.parse_term("1")
  let t1675 = @list.List([@term_syntax.parse_term("(p : Num)"), t1674])
  let t1678 = @tactics.first_x_assum(
    @tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(fn(
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
      (fn(
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
        let s1672 = @tactics.mp_tac(x1671)
        fn(
          x1673 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1672(x1673)
        }
      })(((x1676 : @kernel.Thm) => @bool.specl(t1675, x1676))(x1677))
    }),
  )
  let t1709 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")),
          @tactics.disch_tac,
        ),
        t1678,
      ),
      t1679,
    ),
    t1708,
  ])
  let t1670 = @simp.asm_simp_tac(@list.List([divides_prime_exp_le()]))
  let t1669 = @simp.gen_rewrite_tac(
    fn(
      x1668 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1662 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1663 = @equal.land_conv(x1662)
        fn(x1664 : @kernel.Term) -> @kernel.Thm raise { s1663(x1664) }
      })(
        (fn(
          x1665 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1666 = @equal.binder_conv(x1665)
          fn(x1667 : @kernel.Term) -> @kernel.Thm raise { s1666(x1667) }
        })(x1668),
      )
    },
    @list.List([primepow_divisors_eq()]),
  )
  let t1710 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1669),
          t1670,
        ),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t1709,
  )
  prime_power_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ q : Num, prime(q) → (∃ i : Num, n == EXP(q, i)) == (∀ p : Num, prime(p) && divides(p, n) → p == q)"),
      t1710,
    ),
  )
}

///|
let prime_power_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_POWER_EXISTS",
)

///|
/// `PRIME_POWER_EXISTS`
pub fn prime_power_exists() -> @kernel.Thm {
  prime_power_exists_c.get()
}

///|
/// PRIME_POWER_EXISTS_ALT
fn step_219() -> Unit raise {
  let t1711 = @meson.meson_tac(
    @list.List([
      divides_trans(),
      divides_prime_prime(),
      prime_factor(),
      prime_1(),
    ]),
  )
  let t1712 = @tactics.then_tac(
    @simp.simp_tac(@list.List([prime_power_exists()])),
    t1711,
  )
  prime_power_exists_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, prime(p) → (∃ i : Num, n == EXP(p, i)) == (∀ d : Num, divides(d, n) → d == 1 || divides(p, d))"),
      t1712,
    ),
  )
}

///|
let prime_power_exists_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_POWER_EXISTS_ALT",
)

///|
/// `PRIME_POWER_EXISTS_ALT`
pub fn prime_power_exists_alt() -> @kernel.Thm {
  prime_power_exists_alt_c.get()
}

///|
/// PRIME_FACTORIZATION_ALT
fn step_220() -> Unit raise {
  let t1756 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), index_mul(), @arith.exp_add()]),
  )
  let t1754 = @drule.match_mp(@iterate.iterate_eq())(@iterate.monoidal_mul())
  let t1755 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@equal.gsym(@iterate.nproduct())]))(t1754),
  )
  let t1752 = @tactics.disch_then(fn(
    x1751 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1748 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1749 = @tactics.subst1_tac(x1748)
      fn(
        x1750 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1749(x1750)
      }
    })(@equal.sym(x1751))
  })
  let t1747 = @simp.asm_simp_tac(
    @list.List([
      @class.de_morgan_thm(),
      @theorems.conj_assoc(),
      finite_special_divisors(),
    ]),
  )
  let t1753 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@sets.in_elim_thm(), @arith.exp_eq_1(), index_eq_0()]),
      ),
      t1747,
    ),
    t1752,
  ])
  let t1746 = @simp.rewrite_tac(
    @list.List([@iterate.support(), @iterate.neutral_mul()]),
  )
  let t1739 = @drule.match_mp(@iterate.iterate_op_gen())(
    @iterate.monoidal_mul(),
  )
  let t1740 = @drule.part_match(
    fn(x1738 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x1738))
    },
    @simp.rewrite_rule(@list.List([@equal.gsym(@iterate.nproduct())]))(t1739),
  )
  let t1734 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(x : Num) * (y : Num) == (z : Num) → x == (m : Num) && y == (n : Num) → z == m * n"),
    ),
  )
  let t1733 = @simp.asm_rewrite_tac(@list.List([]))
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
  let t1729 = @term_syntax.parse_term("(n : Num)")
  let t1757 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.map_every(
                      @tactics.x_gen_tac,
                      @list.List([@term_syntax.parse_term("(m : Num)"), t1729]),
                    ),
                    t1732,
                  ),
                  t1733,
                ),
                t1734,
              ),
              fn(
                x1745 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x1744 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1742 : @kernel.Term,
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
                      x1741 : @kernel.Term,
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
                        let s1736 = @tactics.mp_tac(x1735)
                        fn(
                          x1737 : (
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
                          s1736(x1737)
                        }
                      })(t1740(x1741))
                    })(@equal.lhand(x1742))
                  })(
                    (fn(
                      x1743 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> @kernel.Term raise {
                      x1743.1
                    })(x1744),
                  )
                })(x1745)(x1745)
              },
            ),
            t1746,
          ),
          @tactics.ants_tac,
        ),
        t1753,
      ),
      t1755,
    ),
    t1756,
  )
  let t1727 = @drule.match_mp(@iterate.iterate_delta())(@iterate.monoidal_mul())
  let t1728 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @simp.rewrite_rule(
        @list.List([@equal.gsym(@iterate.nproduct()), @iterate.neutral_mul()]),
      )(t1727),
    ]),
  )
  let t1726 = @simp.gen_rewrite_tac(
    fn(
      x1725 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1719 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1720 = @equal.land_conv(x1719)
        fn(x1721 : @kernel.Term) -> @kernel.Thm raise { s1720(x1721) }
      })(
        (fn(
          x1722 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1723 = @equal.once_depth_conv(x1722)
          fn(x1724 : @kernel.Term) -> @kernel.Thm raise { s1723(x1724) }
        })(x1725),
      )
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t1718 = @simp.rewrite_tac(
    @list.List([@class.cond_rand(), @arith.exp(), @arith.exp_1()]),
  )
  let t1717 = @simp.asm_simp_tac(@list.List([index_prime()]))
  let t1716 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1758 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")),
              t1716,
            ),
            t1717,
          ),
          t1718,
        ),
        t1726,
      ),
      t1728,
    ),
    t1757,
  ])
  let t1714 = @drule.match_mp(@iterate.iterate_eq_neutral())(
    @iterate.monoidal_mul(),
  )
  let t1715 = @simp.simp_tac(
    @list.List([
      @simp.rewrite_rule(
        @list.List([@equal.gsym(@iterate.nproduct()), @iterate.neutral_mul()]),
      )(t1714),
    ]),
  )
  let t1713 = @simp.rewrite_tac(
    @list.List([
      index_0(),
      index_1(),
      @arith.mult_eq_0(),
      @calc_num.arith_eq(),
      @class.de_morgan_thm(),
      @arith.exp(),
    ]),
  )
  let t1759 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(complete_factor_induct()),
          t1713,
        ),
        t1715,
      ),
      @tactics.conj_tac,
    ),
    t1758,
  )
  prime_factorization_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → nproduct({(p : Num) | prime(p)}, (p : Num) => EXP(p, index(p, n))) == n"),
      t1759,
    ),
  )
}

///|
let prime_factorization_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTORIZATION_ALT",
)

///|
/// `PRIME_FACTORIZATION_ALT`
pub fn prime_factorization_alt() -> @kernel.Thm {
  prime_factorization_alt_c.get()
}

///|
/// PRIME_FACTORIZATION
fn step_221() -> Unit raise {
  let t1770 = @sets.set_tac(@list.List([]))
  let t1769 = @simp.simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @theorems.imp_conj(),
      @iterate.neutral_mul(),
      @arith.exp_eq_1(),
      index_eq_0(),
    ]),
  )
  let t1768 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_superset())(@iterate.monoidal_mul()),
  )
  let t1767 = @simp.rewrite_tac(@list.List([@iterate.nproduct()]))
  let t1766 = @tactics.conv_tac(@equal.sym_conv)
  let t1765 = @tactics.first_x_assum(fn(
    x1760 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1760
    @simp.gen_rewrite_tac(
      fn(
        x1762 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1763 = @equal.rand_conv(x1762)
        fn(x1764 : @kernel.Term) -> @kernel.Thm raise { s1763(x1764) }
      },
      @list.List([@equal.sym(@drule.match_mp(prime_factorization_alt())(th))]),
    )
  })
  let t1771 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1765),
            t1766,
          ),
          t1767,
        ),
        t1768,
      ),
      t1769,
    ),
    t1770,
  )
  prime_factorization_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(p, index(p, n))) == n"),
      t1771,
    ),
  )
}

///|
let prime_factorization_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_FACTORIZATION",
)

///|
/// `PRIME_FACTORIZATION`
pub fn prime_factorization() -> @kernel.Thm {
  prime_factorization_c.get()
}

///|
/// lcm
fn step_222() -> Unit raise {
  let t1774 = @simp.rewrite_tac(
    @list.List([
      @int.int_of_num_mul(),
      @int.int_of_num_div(),
      @int.int_abs_num(),
      @equal.gsym(@int.num_gcd_v1()),
    ]),
  )
  let t1773 = @simp.asm_rewrite_tac(@list.List([]))
  let t1772 = @equal.gsym(@int.int_of_num_mul())
  let t1775 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @equal.gsym(@int.int_of_num_eq()),
            t1772,
            @int.num_lcm_v1(),
            @int.int_lcm(),
          ]),
        ),
        @class.cond_cases_tac,
      ),
      t1773,
    ),
    t1774,
  )
  lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("lcm(((m : Num), (n : Num))) == (if m * n == 0 { 0 } else { DIV(m * n, gcd((m, n))) })"),
      t1775,
    ),
  )
}

///|
let lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lcm")

///|
/// `lcm`
pub fn lcm() -> @kernel.Thm {
  lcm_c.get()
}

///|
/// LCM_DIVIDES
fn step_223() -> Unit raise {
  lcm_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ d : Num, divides(lcm((m, n)), d) == (divides(m, d) && divides(n, d))"),
      @int.number_tac,
    ),
  )
}

///|
let lcm_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_DIVIDES")

///|
/// `LCM_DIVIDES`
pub fn lcm_divides() -> @kernel.Thm {
  lcm_divides_c.get()
}

///|
/// LCM
fn step_224() -> Unit raise {
  lcm_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, lcm((m, n))) && divides(n, lcm((m, n))) && (∀ d : Num, divides(m, d) && divides(n, d) → divides(lcm((m, n)), d))"),
      @int.number_tac,
    ),
  )
}

///|
let lcm_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM")

///|
/// `LCM`
pub fn lcm_v1() -> @kernel.Thm {
  lcm_v1_c.get()
}

///|
/// LCM_DIVIDES_MUL
fn step_225() -> Unit raise {
  let t1776 = @tactics.conv_tac(@int.number_rule)
  let t1777 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([lcm_divides()])),
    t1776,
  )
  lcm_divides_mul_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(lcm((m, n)), m * n)"), t1777),
  )
}

///|
let lcm_divides_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LCM_DIVIDES_MUL",
)

///|
/// `LCM_DIVIDES_MUL`
pub fn lcm_divides_mul() -> @kernel.Thm {
  lcm_divides_mul_c.get()
}

///|
/// DIVIDES_LCM
fn step_226() -> Unit raise {
  let t1781 = @meson.asm_meson_tac(@list.List([lcm_v1()]))
  let t1778 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(divides_trans()),
  )
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
    @tactics.match_mp_tac(t1778(x1779))
  })
  let t1782 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1780),
    t1781,
  )
  divides_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ r : Num, divides(r, m) || divides(r, n) → divides(r, lcm((m, n)))"),
      t1782,
    ),
  )
}

///|
let divides_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LCM")

///|
/// `DIVIDES_LCM`
pub fn divides_lcm() -> @kernel.Thm {
  divides_lcm_c.get()
}

///|
/// LCM_0
fn step_227() -> Unit raise {
  let t1783 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([lcm(), @arith.mult_clauses()])),
    @int.arith_tac,
  )
  lcm_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, lcm((0, n)) == 0) && (∀ n : Num, lcm((n, 0)) == 0)"),
      t1783,
    ),
  )
}

///|
let lcm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_0")

///|
/// `LCM_0`
pub fn lcm_0() -> @kernel.Thm {
  lcm_0_c.get()
}

///|
/// LCM_1
fn step_228() -> Unit raise {
  let t1784 = @meson.meson_tac(@list.List([]))
  let t1785 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([lcm(), @arith.mult_clauses(), gcd_1(), @arith.div_1()]),
    ),
    t1784,
  )
  lcm_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, lcm((1, n)) == n) && (∀ n : Num, lcm((n, 1)) == n)"),
      t1785,
    ),
  )
}

///|
let lcm_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_1")

///|
/// `LCM_1`
pub fn lcm_1() -> @kernel.Thm {
  lcm_1_c.get()
}

///|
/// LCM_SYM
fn step_229() -> Unit raise {
  let t1786 = @simp.rewrite_tac(
    @list.List([
      lcm(),
      @arith.mult_sym(),
      gcd_sym(),
      @int.arith_rule(@term_syntax.parse_term("MAX((m : Num), (n : Num)) == MAX(n, m)")),
    ]),
  )
  lcm_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, lcm((m, n)) == lcm((n, m))"), t1786),
  )
}

///|
let lcm_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_SYM")

///|
/// `LCM_SYM`
pub fn lcm_sym() -> @kernel.Thm {
  lcm_sym_c.get()
}

///|
/// DIVIDES_LCM_GCD
fn step_230() -> Unit raise {
  divides_lcm_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ d : Num, divides(d, lcm((m, n))) == divides(d * gcd((m, n)), m * n)"),
      @int.number_tac,
    ),
  )
}

///|
let divides_lcm_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LCM_GCD",
)

///|
/// `DIVIDES_LCM_GCD`
pub fn divides_lcm_gcd() -> @kernel.Thm {
  divides_lcm_gcd_c.get()
}

///|
/// PRIMEPOW_DIVIDES_LCM
fn step_231() -> Unit raise {
  let t1855 = @simp.asm_simp_tac(@list.List([divides_exp_le(), prime_ge_2()]))
  let t1854 = @tactics.match_mp_tac(divides_rmul())
  let t1853 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1852 = @tactics.match_mp_tac(@theorems.mono_or())
  let t1849 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(k : Num) + MIN((a : Num), (b : Num)) <= a + b → k <= a || k <= b"),
    ),
  )
  let t1851 = @tactics.disch_then(fn(
    x1850 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s1847 = @tactics.mp_tac(x1846)
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
    })(t1849(x1850))
  })
  let t1856 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_simp_tac(@list.List([divides_exp_le(), prime_ge_2()])),
            t1851,
          ),
          t1852,
        ),
        t1853,
      ),
      t1854,
    ),
    t1855,
  )
  let t1845 = @meson.meson_tac(@list.List([@arith.mult_ac()]))
  let t1844 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(a : Num) < a + 1")),
      @arith.exp_add(),
      @arith.exp_1(),
    ]),
  )
  let t1838 = @term_syntax.parse_term("(b : Num) + 1")
  let t1841 = @tactics.disch_then(fn(
    x1840 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1835 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1836 = @tactics.mp_tac(x1835)
      fn(
        x1837 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1836(x1837)
      }
    })(((x1839 : @kernel.Thm) => @bool.spec(t1838, x1839))(x1840))
  })
  let t1842 = @tactics.then_tac(
    @tactics.undisch_tac(
      @term_syntax.parse_term("∀ l : Num, (b : Num) < l → !(∃ x : Num, (n : Num) == EXP((p : Num), l) * x)"),
    ),
    t1841,
  )
  let t1831 = @term_syntax.parse_term("(a : Num) + 1")
  let t1834 = @tactics.disch_then(fn(
    x1833 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1828 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1829 = @tactics.mp_tac(x1828)
      fn(
        x1830 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1829(x1830)
      }
    })(((x1832 : @kernel.Thm) => @bool.spec(t1831, x1832))(x1833))
  })
  let t1843 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(
        @term_syntax.parse_term("∀ l : Num, (a : Num) < l → !(∃ x : Num, (m : Num) == EXP((p : Num), l) * x)"),
      ),
      t1834,
    ),
    t1842,
  ])
  let t1827 = @simp.asm_rewrite_tac(@list.List([@int.divides()]))
  let t1826 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([prime_coprime_strong()]),
      @term_syntax.parse_term("prime((p : Num)) && !divides(p, (n : Num)) → coprime((p, n))"),
    ),
  )
  let t1857 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(coprime_mul()),
                  @tactics.conj_tac,
                ),
                t1826,
              ),
              t1827,
            ),
            @tactics.strip_tac,
          ),
          t1843,
        ),
        t1844,
      ),
      t1845,
    ),
    t1856,
  ])
  let t1822 = @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(
    coprime_exp_divprod(),
  )
  let t1823 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(t1822),
  )
  let t1825 = @tactics.disch_then(fn(
    x1824 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1819 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1820 = @tactics.mp_tac(x1819)
      fn(
        x1821 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1820(x1821)
      }
    })(t1823(x1824))
  })
  let t1818 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t1817 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(a : Num) * (b : Num) * (c : Num) * (d : Num) == a * c * (b * d)"),
      ),
    ]),
  )
  let t1814 = @drule.match_mp(
    @int.number_rule(@term_syntax.parse_term("divides((a : Num) * (b : Num), (c : Num)) → divides(a, c)")),
  )
  let t1816 = @tactics.disch_then(fn(
    x1815 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1812 = @tactics.mp_tac(x1811)
      fn(
        x1813 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1812(x1813)
      }
    })(t1814(x1815))
  })
  let t1809 = @simp.rewrite_tac(
    @list.List([@arith.mult_assoc(), @equal.gsym(@arith.exp_add())]),
  )
  let t1808 = @equal.gsym(@arith.exp_add())
  let t1810 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @equal.gsym(gcd_lmul()),
                    @arith.mult_assoc(),
                    t1808,
                  ]),
                ),
                @tactics.ap_term_tac,
              ),
              @tactics.binop_tac,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.ap_term_tac,
      ),
      @int.arith_tac,
    ),
    t1809,
  ])
  let t1807 = @tactics.subgoal_then(
    @term_syntax.parse_term("gcd((EXP((p : Num), (a : Num)) * (q : Num), EXP(p, (b : Num)) * (r : Num))) == EXP(p, MIN(a, b)) * gcd((EXP(p, a - MIN(a, b)) * q, EXP(p, b - MIN(a, b)) * r))"),
    fn(
      x1804 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1805 = @tactics.subst1_tac(x1804)
      fn(
        x1806 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1805(x1806)
      }
    },
  )
  let t1803 = @simp.asm_rewrite_tac(@list.List([divides_lcm_gcd()]))
  let t1802 = @tactics.undisch_tac(
    @term_syntax.parse_term("divides(EXP((p : Num), (k : Num)), lcm(((m : Num), (n : Num))))"),
  )
  let t1801 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides())]))
  let t1799 = @term_syntax.parse_term("(r : Num)")
  let t1800 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(b : Num)"), t1799]),
  )
  let t1797 = @term_syntax.parse_term("(q : Num)")
  let t1798 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : Num)"), t1797]),
  )
  let t1796 = @simp.asm_simp_tac(
    @list.List([
      prime_ge_2(),
      @theorems.left_imp_exists_thm(),
      @int.divides(),
      @theorems.left_and_exists_thm(),
    ]),
  )
  let t1794 = @term_syntax.parse_term("(p : Num)")
  let t1795 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t1794]),
      factorization_index(),
    ),
  )
  let t1792 = @term_syntax.parse_term("(p : Num)")
  let t1793 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1792]),
      factorization_index(),
    ),
  )
  let t1791 = @simp.asm_rewrite_tac(@list.List([lcm_0(), divides_0()]))
  let t1790 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1789 = @simp.asm_rewrite_tac(@list.List([lcm_0(), divides_0()]))
  let t1788 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1787 = @list.List([
    @tactics.strip_tac,
    @meson.meson_tac(@list.List([divides_lcm()])),
  ])
  let t1858 = @tactics.thenl(
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
                                                  @tactics.repeat_tac(
                                                    @tactics.strip_tac,
                                                  ),
                                                  @tactics.eq_tac,
                                                ),
                                                t1787,
                                              ),
                                              t1788,
                                            ),
                                            t1789,
                                          ),
                                          t1790,
                                        ),
                                        t1791,
                                      ),
                                      t1793,
                                    ),
                                    t1795,
                                  ),
                                  t1796,
                                ),
                                t1798,
                              ),
                              @tactics.strip_tac,
                            ),
                            t1800,
                          ),
                          @tactics.strip_tac,
                        ),
                        t1801,
                      ),
                      t1802,
                    ),
                    t1803,
                  ),
                  t1807,
                ),
                t1810,
              ),
              t1816,
            ),
            t1817,
          ),
          t1818,
        ),
        t1825,
      ),
      @tactics.ants_tac,
    ),
    t1857,
  )
  primepow_divides_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ k : Num, prime(p) → divides(EXP(p, k), lcm((m, n))) == (divides(EXP(p, k), m) || divides(EXP(p, k), n))"),
      t1858,
    ),
  )
}

///|
let primepow_divides_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_LCM",
)

///|
/// `PRIMEPOW_DIVIDES_LCM`
pub fn primepow_divides_lcm() -> @kernel.Thm {
  primepow_divides_lcm_c.get()
}

///|
/// PRIME_DIVIDES_LCM
fn step_232() -> Unit raise {
  let t1863 = @simp.rewrite_tac(@list.List([@arith.exp_1()]))
  let t1859 = @term_syntax.parse_term("1")
  let t1860 = @term_syntax.parse_term("(p : Num)")
  let t1861 = @term_syntax.parse_term("(n : Num)")
  let t1862 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t1861, t1860, t1859]),
      primepow_divides_lcm(),
    ),
  )
  let t1864 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1862),
    t1863,
  )
  prime_divides_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, prime(p) → divides(p, lcm((m, n))) == (divides(p, m) || divides(p, n))"),
      t1864,
    ),
  )
}

///|
let prime_divides_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVIDES_LCM",
)

///|
/// `PRIME_DIVIDES_LCM`
pub fn prime_divides_lcm() -> @kernel.Thm {
  prime_divides_lcm_c.get()
}

///|
/// LCM_ZERO
fn step_233() -> Unit raise {
  let t1873 = @meson.asm_meson_tac(
    @list.List([
      divides_refl(),
      @arith.mult_eq_0(),
      divides_lmul(),
      divides_rmul(),
    ]),
  )
  let t1872 = @simp.asm_rewrite_tac(@list.List([divides_zero()]))
  let t1870 = @term_syntax.parse_term("(n : Num) == 0")
  let t1871 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1870]),
  )
  let t1869 = @simp.rewrite_tac(@list.List([lcm_divides(), divides_zero()]))
  let t1868 = @simp.gen_rewrite_tac(
    fn(
      x1865 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1866 = @equal.land_conv(x1865)
      fn(x1867 : @kernel.Term) -> @kernel.Thm raise { s1866(x1867) }
    },
    @list.List([multiples_eq()]),
  )
  let t1874 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1868),
          t1869,
        ),
        t1871,
      ),
      t1872,
    ),
    t1873,
  )
  lcm_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (lcm((m, n)) == 0) == (m == 0 || n == 0)"),
      t1874,
    ),
  )
}

///|
let lcm_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_ZERO")

///|
/// `LCM_ZERO`
pub fn lcm_zero() -> @kernel.Thm {
  lcm_zero_c.get()
}

///|
/// INDEX_LCM
fn step_234() -> Unit raise {
  let t1891 = @meson.meson_tac(
    @list.List([@arith.le_refl(), @arith.le_antisym(), @arith.le_trans()]),
  )
  let t1890 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((k : Num) <= (m : Num) || k <= (n : Num)) == (k <= MAX(m, n))")),
    ]),
  )
  let t1889 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t1888 = @simp.asm_rewrite_tac(
    @list.List([primepow_divides_index(), lcm_zero()]),
  )
  let t1885 = @drule.match_mp(primepow_divides_lcm())
  let t1881 = @term_syntax.parse_term("(n : Num)")
  let t1882 = @list.List([@term_syntax.parse_term("(m : Num)"), t1881])
  let t1887 = @tactics.first_assum(fn(
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
    (fn(
      x1884 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x1878 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1879 = @tactics.mp_tac(x1878)
        fn(
          x1880 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1879(x1880)
        }
      })(((x1883 : @kernel.Thm) => @bool.specl(t1882, x1883))(x1884))
    })(t1885(x1886))
  })
  let t1877 = @simp.asm_simp_tac(@list.List([lcm_0(), index_0()]))
  let t1875 = @term_syntax.parse_term("(n : Num) == 0")
  let t1876 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1875]),
  )
  let t1892 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1876),
              t1877,
            ),
            t1887,
          ),
          t1888,
        ),
        t1889,
      ),
      t1890,
    ),
    t1891,
  )
  index_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, prime(p) → index(p, lcm((m, n))) == (if m == 0 || n == 0 { 0 } else { MAX(index(p, m), index(p, n)) })"),
      t1892,
    ),
  )
}

///|
let index_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_LCM")

///|
/// `INDEX_LCM`
pub fn index_lcm() -> @kernel.Thm {
  index_lcm_c.get()
}

///|
/// LCM_ASSOC
fn step_235() -> Unit raise {
  let t1897 = @tactics.conv_tac(@class.taut)
  let t1896 = @simp.rewrite_tac(@list.List([lcm_zero()]))
  let t1895 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t1894 = @simp.rewrite_tac(@list.List([lcm_divides()]))
  let t1893 = @simp.rewrite_tac(@list.List([multiples_eq()]))
  let t1898 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1893),
          t1894,
        ),
        t1895,
      ),
      t1896,
    ),
    t1897,
  )
  lcm_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, lcm((m, lcm((n, p)))) == lcm((lcm((m, n)), p))"),
      t1898,
    ),
  )
}

///|
let lcm_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_ASSOC")

///|
/// `LCM_ASSOC`
pub fn lcm_assoc() -> @kernel.Thm {
  lcm_assoc_c.get()
}

///|
/// LCM_REFL
fn step_236() -> Unit raise {
  let t1900 = @meson.meson_tac(@list.List([]))
  let t1899 = @simp.simp_tac(@list.List([@arith.div_mult()]))
  let t1901 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          lcm(),
          gcd_refl(),
          @arith.mult_eq_0(),
          @int.arith_rule(@term_syntax.parse_term("MAX((n : Num), n) == n")),
        ]),
      ),
      t1899,
    ),
    t1900,
  )
  lcm_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, lcm((n, n)) == n"), t1901))
}

///|
let lcm_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_REFL")

///|
/// `LCM_REFL`
pub fn lcm_refl() -> @kernel.Thm {
  lcm_refl_c.get()
}

///|
/// LCM_MULTIPLE
fn step_237() -> Unit raise {
  let t1902 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([multiples_eq(), lcm_divides()])),
    @int.number_tac,
  )
  lcm_multiple_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, lcm((b, a * b)) == a * b"), t1902),
  )
}

///|
let lcm_multiple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_MULTIPLE")

///|
/// `LCM_MULTIPLE`
pub fn lcm_multiple() -> @kernel.Thm {
  lcm_multiple_c.get()
}

///|
/// LCM_GCD_DISTRIB
fn step_238() -> Unit raise {
  let t1904 = @tactics.conv_tac(@class.taut)
  let t1903 = @simp.simp_tac(
    @list.List([primepow_divides_lcm(), divides_gcd()]),
  )
  let t1905 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([primepow_divisors_eq()])),
      t1903,
    ),
    t1904,
  )
  lcm_gcd_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, lcm((a, gcd((b, c)))) == gcd((lcm((a, b)), lcm((a, c))))"),
      t1905,
    ),
  )
}

///|
let lcm_gcd_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LCM_GCD_DISTRIB",
)

///|
/// `LCM_GCD_DISTRIB`
pub fn lcm_gcd_distrib() -> @kernel.Thm {
  lcm_gcd_distrib_c.get()
}

///|
/// GCD_LCM_DISTRIB
fn step_239() -> Unit raise {
  let t1907 = @tactics.conv_tac(@class.taut)
  let t1906 = @simp.simp_tac(
    @list.List([primepow_divides_lcm(), divides_gcd()]),
  )
  let t1908 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([primepow_divisors_eq()])),
      t1906,
    ),
    t1907,
  )
  gcd_lcm_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, gcd((a, lcm((b, c)))) == lcm((gcd((a, b)), gcd((a, c))))"),
      t1908,
    ),
  )
}

///|
let gcd_lcm_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GCD_LCM_DISTRIB",
)

///|
/// `GCD_LCM_DISTRIB`
pub fn gcd_lcm_distrib() -> @kernel.Thm {
  gcd_lcm_distrib_c.get()
}

///|
/// LCM_UNIQUE
fn step_240() -> Unit raise {
  let t1909 = @meson.meson_tac(@list.List([divides_refl(), divides_trans()]))
  let t1910 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([multiples_eq(), lcm_divides()])),
    t1909,
  )
  lcm_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ m : Num, ∀ n : Num, (divides(m, d) && divides(n, d) && (∀ e : Num, divides(m, e) && divides(n, e) → divides(d, e))) == (d == lcm((m, n)))"),
      t1910,
    ),
  )
}

///|
let lcm_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_UNIQUE")

///|
/// `LCM_UNIQUE`
pub fn lcm_unique() -> @kernel.Thm {
  lcm_unique_c.get()
}

///|
/// LCM_EQ
fn step_241() -> Unit raise {
  let t1911 = @simp.simp_tac(@list.List([multiples_eq(), lcm_divides()]))
  lcm_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ u : Num, ∀ v : Num, (∀ d : Num, (divides(x, d) && divides(y, d)) == (divides(u, d) && divides(v, d))) → lcm((x, y)) == lcm((u, v))"),
      t1911,
    ),
  )
}

///|
let lcm_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_EQ")

///|
/// `LCM_EQ`
pub fn lcm_eq() -> @kernel.Thm {
  lcm_eq_c.get()
}

///|
/// LCM_EQ_1
fn step_242() -> Unit raise {
  let t1916 = @simp.rewrite_tac(
    @list.List([@equal.gsym(lcm_unique()), divides_1(), @int.divides_one()]),
  )
  let t1915 = @simp.gen_rewrite_tac(
    fn(
      x1912 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1913 = @equal.land_conv(x1912)
      fn(x1914 : @kernel.Term) -> @kernel.Thm raise { s1913(x1914) }
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t1917 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1915),
    t1916,
  )
  lcm_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (lcm((m, n)) == 1) == (m == 1 && n == 1)"),
      t1917,
    ),
  )
}

///|
let lcm_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_EQ_1")

///|
/// `LCM_EQ_1`
pub fn lcm_eq_1() -> @kernel.Thm {
  lcm_eq_1_c.get()
}

///|
/// DIVIDES_LCM_LEFT
fn step_243() -> Unit raise {
  let t1922 = @simp.simp_tac(
    @list.List([@equal.gsym(lcm_unique()), divides_refl()]),
  )
  let t1921 = @simp.gen_rewrite_tac(
    fn(
      x1918 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1919 = @equal.rand_conv(x1918)
      fn(x1920 : @kernel.Term) -> @kernel.Thm raise { s1919(x1920) }
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t1923 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1921),
    t1922,
  )
  divides_lcm_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(n, m) == (lcm((m, n)) == m)"),
      t1923,
    ),
  )
}

///|
let divides_lcm_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LCM_LEFT",
)

///|
/// `DIVIDES_LCM_LEFT`
pub fn divides_lcm_left() -> @kernel.Thm {
  divides_lcm_left_c.get()
}

///|
/// DIVIDES_LCM_RIGHT
fn step_244() -> Unit raise {
  let t1928 = @simp.simp_tac(
    @list.List([@equal.gsym(lcm_unique()), divides_refl()]),
  )
  let t1927 = @simp.gen_rewrite_tac(
    fn(
      x1924 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1925 = @equal.rand_conv(x1924)
      fn(x1926 : @kernel.Term) -> @kernel.Thm raise { s1925(x1926) }
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t1929 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1927),
    t1928,
  )
  divides_lcm_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, n) == (lcm((m, n)) == n)"),
      t1929,
    ),
  )
}

///|
let divides_lcm_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LCM_RIGHT",
)

///|
/// `DIVIDES_LCM_RIGHT`
pub fn divides_lcm_right() -> @kernel.Thm {
  divides_lcm_right_c.get()
}

///|
/// MULT_LCM_GCD
fn step_245() -> Unit raise {
  let t1934 = @tactics.conv_tac(@int.number_rule)
  let t1933 = @simp.asm_rewrite_tac(
    @list.List([lcm(), @arith.mult_eq_0(), @equal.gsym(@int.divides_div_mult())]),
  )
  let t1932 = @simp.asm_rewrite_tac(
    @list.List([gcd_0(), lcm_0(), @arith.mult_clauses()]),
  )
  let t1930 = @term_syntax.parse_term("(n : Num) == 0")
  let t1931 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1930]),
  )
  let t1935 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1931),
        t1932,
      ),
      t1933,
    ),
    t1934,
  )
  mult_lcm_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, lcm((m, n)) * gcd((m, n)) == m * n"),
      t1935,
    ),
  )
}

///|
let mult_lcm_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_LCM_GCD")

///|
/// `MULT_LCM_GCD`
pub fn mult_lcm_gcd() -> @kernel.Thm {
  mult_lcm_gcd_c.get()
}

///|
/// MULT_GCD_LCM
fn step_246() -> Unit raise {
  let t1936 = @meson.meson_tac(@list.List([@arith.mult_sym(), mult_lcm_gcd()]))
  mult_gcd_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, gcd((m, n)) * lcm((m, n)) == m * n"),
      t1936,
    ),
  )
}

///|
let mult_gcd_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_GCD_LCM")

///|
/// `MULT_GCD_LCM`
pub fn mult_gcd_lcm() -> @kernel.Thm {
  mult_gcd_lcm_c.get()
}

///|
/// LCM_LMUL
fn step_247() -> Unit raise {
  let t1948 = @tactics.conv_tac(@int.number_rule)
  let t1947 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.divides_div_mult())]),
  )
  let t1946 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((a : Num) * ((c : Num) * (b : Num)) == c * (d : Num) * (g : Num)) == (c * (d * g) == c * (a * b))"),
      ),
    ]),
  )
  let t1945 = @simp.asm_simp_tac(
    @list.List([@arith.add_clauses(), @arith.le_1(), gcd_zero()]),
  )
  let t1944 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1943 = @tactics.match_mp_tac(@arith.div_uniq())
  let t1942 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@arith.mult_assoc()),
      @arith.div_mult2(),
      @arith.mult_eq_0(),
      gcd_zero(),
    ]),
  )
  let t1941 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.de_morgan_thm()])),
  )
  let t1940 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1939 = @simp.asm_rewrite_tac(
    @list.List([lcm(), gcd_lmul(), @arith.mult_eq_0(), @theorems.disj_aci()]),
  )
  let t1938 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), lcm_0()]),
  )
  let t1937 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Num) == 0"))
  let t1949 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                              t1937,
                            ),
                            t1938,
                          ),
                          t1939,
                        ),
                        @class.cond_cases_tac,
                      ),
                      t1940,
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
          t1946,
        ),
        @tactics.ap_term_tac,
      ),
      t1947,
    ),
    t1948,
  )
  lcm_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, lcm((c * a, c * b)) == c * lcm((a, b))"),
      t1949,
    ),
  )
}

///|
let lcm_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_LMUL")

///|
/// `LCM_LMUL`
pub fn lcm_lmul() -> @kernel.Thm {
  lcm_lmul_c.get()
}

///|
/// LCM_RMUL
fn step_248() -> Unit raise {
  let t1950 = @meson.meson_tac(@list.List([lcm_lmul(), @arith.mult_sym()]))
  lcm_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, lcm((a * c, b * c)) == c * lcm((a, b))"),
      t1950,
    ),
  )
}

///|
let lcm_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_RMUL")

///|
/// `LCM_RMUL`
pub fn lcm_rmul() -> @kernel.Thm {
  lcm_rmul_c.get()
}

///|
/// LCM_EXP
fn step_249() -> Unit raise {
  let t1965 = @tactics.conv_tac(@int.number_rule)
  let t1964 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.divides_div_mult())]),
  )
  let t1963 = @tactics.conv_tac(@equal.sym_conv)
  let t1962 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp())]))
  let t1961 = @simp.asm_simp_tac(
    @list.List([
      @arith.add_clauses(),
      @arith.le_1(),
      gcd_zero(),
      @arith.exp_eq_0(),
    ]),
  )
  let t1960 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1959 = @tactics.match_mp_tac(@arith.div_uniq())
  let t1958 = @simp.rewrite_tac(
    @list.List([gcd_exp(), @equal.gsym(@arith.mult_exp())]),
  )
  let t1957 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@class.de_morgan_thm()])),
  )
  let t1956 = @list.List([
    @meson.asm_meson_tac(@list.List([@nums.num_cases(), @arith.exp_zero()])),
    @tactics.all_tac,
  ])
  let t1955 = @simp.asm_rewrite_tac(@list.List([]))
  let t1954 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), gcd_refl(), @arith.div_1(), @arith.mult_clauses()]),
  )
  let t1953 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1952 = @simp.rewrite_tac(
    @list.List([@arith.mult_eq_0(), @arith.exp_eq_0()]),
  )
  let t1951 = @simp.rewrite_tac(@list.List([lcm()]))
  let t1966 = @tactics.then_tac(
    @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t1951,
                                    ),
                                    t1952,
                                  ),
                                  t1953,
                                ),
                                t1954,
                              ),
                              @class.cond_cases_tac,
                            ),
                            t1955,
                          ),
                          t1956,
                        ),
                        t1957,
                      ),
                      t1958,
                    ),
                    t1959,
                  ),
                  t1960,
                ),
                t1961,
              ),
              t1962,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t1963,
      ),
      t1964,
    ),
    t1965,
  )
  lcm_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ b : Num, lcm((EXP(a, n), EXP(b, n))) == EXP(lcm((a, b)), n)"),
      t1966,
    ),
  )
}

///|
let lcm_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_EXP")

///|
/// `LCM_EXP`
pub fn lcm_exp() -> @kernel.Thm {
  lcm_exp_c.get()
}

///|
/// LCM_COPRIME_DECOMP
fn step_250() -> Unit raise {
  let t2005 = @tactics.conv_tac(@grobner.num_ring)
  let t2004 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t2000 = @simp.asm_rewrite_tac(@list.List([mult_lcm_gcd(), gcd_zero()]))
  let t1999 = @tactics.exists_tac(@term_syntax.parse_term("gcd(((m : Num), (n : Num)))"))
  let t1998 = @tactics.match_mp_tac(
    @grobner.num_ring(
      @term_syntax.parse_term("∀ d : Num, !(d == 0) && (a : Num) * d == (b : Num) * d → a == b"),
    ),
  )
  let t1997 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        divides_mul_l(),
        divides_refl(),
        divides_rmul(),
        divides_lmul(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1996 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1995 = @simp.once_rewrite_tac(@list.List([coprime_sym()]))
  let t1994 = @simp.asm_rewrite_tac(@list.List([]))
  let t1993 = @simp.rewrite_tac(
    @list.List([
      coprime_lmul(),
      coprime_rmul(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t1991 = @term_syntax.parse_term("(n' : Num) * (n'' : Num)")
  let t1992 = @tactics.map_every(
    fn(
      x1988 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1989 = @tactics.exists_tac(x1988)
      fn(
        x1990 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1989(x1990)
      }
    },
    @list.List([@term_syntax.parse_term("(m' : Num) * (m'' : Num)"), t1991]),
  )
  let t1986 = @term_syntax.parse_term("(m'' : Num)")
  let t1987 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n'' : Num)"), t1986]),
  )
  let t1985 = @simp.asm_rewrite_tac(
    @list.List([gcd_zero(), @theorems.left_imp_exists_thm()]),
  )
  let t1982 = @term_syntax.parse_term("gcd(((m : Num), (n : Num)))")
  let t1983 = @term_syntax.parse_term("(n' : Num)")
  let t1984 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m' : Num)"), t1983, t1982]),
      coprime_pair_decomp(),
    ),
  )
  let t1981 = @tactics.disch_then(fn(
    x1980 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1980))
  })
  let t1978 = @term_syntax.parse_term("(n' : Num)")
  let t1979 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m' : Num)"), t1978]),
  )
  let t1977 = @simp.asm_rewrite_tac(
    @list.List([gcd_zero(), @theorems.left_imp_exists_thm()]),
  )
  let t1975 = @term_syntax.parse_term("(n : Num)")
  let t1976 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t1975]),
      gcd_coprime_exists(),
    ),
  )
  let t1973 = @tactics.conv_tac(@int.number_rule)
  let t1971 = @term_syntax.parse_term("1")
  let t1972 = @tactics.map_every(
    fn(
      x1968 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1969 = @tactics.exists_tac(x1968)
      fn(
        x1970 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1969(x1970)
      }
    },
    @list.List([@term_syntax.parse_term("0"), t1971]),
  )
  let t1974 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([divides_0(), coprime_0(), gcd_0(), lcm_0()]),
        ),
        t1972,
      ),
      t1973,
    ),
    @tactics.all_tac,
  ])
  let t1967 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t2006 = @tactics.then_tac(
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
                                              @tactics.repeat_tac(
                                                @tactics.gen_tac,
                                              ),
                                              t1967,
                                            ),
                                            t1974,
                                          ),
                                          t1976,
                                        ),
                                        t1977,
                                      ),
                                      t1979,
                                    ),
                                    t1981,
                                  ),
                                  t1984,
                                ),
                                t1985,
                              ),
                              t1987,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1992,
                        ),
                        t1993,
                      ),
                      t1994,
                    ),
                    t1995,
                  ),
                  t1996,
                ),
                @tactics.conj_tac,
              ),
              t1997,
            ),
            t1998,
          ),
          t1999,
        ),
        t2000,
      ),
      t2004,
    ),
    t2005,
  )
  lcm_coprime_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∃ m' : Num, ∃ n' : Num, divides(m', m) && divides(n', n) && coprime((m', n')) && m' * n' == lcm((m, n))"),
      t2006,
    ),
  )
}

///|
let lcm_coprime_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LCM_COPRIME_DECOMP",
)

///|
/// `LCM_COPRIME_DECOMP`
pub fn lcm_coprime_decomp() -> @kernel.Thm {
  lcm_coprime_decomp_c.get()
}

///|
/// LE_LCM
fn step_251() -> Unit raise {
  let t2011 = @simp.asm_rewrite_tac(@list.List([lcm_v1(), lcm_zero()]))
  let t2010 = @tactics.match_mp_tac(@int.divides_le_imp())
  let t2009 = @simp.asm_rewrite_tac(
    @list.List([lcm_0(), @arith.le_refl(), @arith.le()]),
  )
  let t2007 = @term_syntax.parse_term("(n : Num) == 0")
  let t2008 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t2007]),
  )
  let t2012 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2008),
        t2009,
      ),
      t2010,
    ),
    t2011,
  )
  le_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (m <= lcm((m, n))) == (n == 0 → m == 0)) && (∀ m : Num, ∀ n : Num, (n <= lcm((m, n))) == (m == 0 → n == 0))"),
      t2012,
    ),
  )
}

///|
let le_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_LCM")

///|
/// `LE_LCM`
pub fn le_lcm() -> @kernel.Thm {
  le_lcm_c.get()
}

///|
/// LCM_LE_MULT
fn step_252() -> Unit raise {
  let t2014 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_refl(), @arith.div_le()]),
  )
  let t2013 = @simp.rewrite_tac(@list.List([lcm()]))
  let t2015 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2013),
      @class.cond_cases_tac,
    ),
    t2014,
  )
  lcm_le_mult_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, lcm((m, n)) <= m * n"), t2015),
  )
}

///|
let lcm_le_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_LE_MULT")

///|
/// `LCM_LE_MULT`
pub fn lcm_le_mult() -> @kernel.Thm {
  lcm_le_mult_c.get()
}

///|
/// LCM_EQ_MULT
fn step_253() -> Unit raise {
  let t2019 = @simp.asm_rewrite_tac(
    @list.List([lcm(), @arith.div_eq_self(), @arith.mult_eq_0(), coprime_gcd()]),
  )
  let t2018 = @simp.asm_rewrite_tac(
    @list.List([lcm_0(), @arith.mult_clauses()]),
  )
  let t2016 = @term_syntax.parse_term("(n : Num) == 0")
  let t2017 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t2016]),
  )
  let t2020 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2017),
      t2018,
    ),
    t2019,
  )
  lcm_eq_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (lcm((m, n)) == m * n) == (m == 0 || n == 0 || coprime((m, n)))"),
      t2020,
    ),
  )
}

///|
let lcm_eq_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCM_EQ_MULT")

///|
/// `LCM_EQ_MULT`
pub fn lcm_eq_mult() -> @kernel.Thm {
  lcm_eq_mult_c.get()
}

///|
/// MAX_LE_LCM_EQ
fn step_254() -> Unit raise {
  let t2022 = @simp.asm_rewrite_tac(@list.List([le_lcm()]))
  let t2021 = @simp.rewrite_tac(@list.List([@arith.max()]))
  let t2023 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2021),
        @class.cond_cases_tac,
      ),
      t2022,
    ),
    @int.asm_arith_tac,
  )
  max_le_lcm_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (MAX(m, n) <= lcm((m, n))) == ((m == 0) == (n == 0))"),
      t2023,
    ),
  )
}

///|
let max_le_lcm_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_LE_LCM_EQ")

///|
/// `MAX_LE_LCM_EQ`
pub fn max_le_lcm_eq() -> @kernel.Thm {
  max_le_lcm_eq_c.get()
}

///|
/// MAX_LE_LCM
fn step_255() -> Unit raise {
  let t2024 = @simp.rewrite_tac(@list.List([max_le_lcm_eq()]))
  max_le_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m == 0) == (n == 0) → MAX(m, n) <= lcm((m, n))"),
      t2024,
    ),
  )
}

///|
let max_le_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_LE_LCM")

///|
/// `MAX_LE_LCM`
pub fn max_le_lcm() -> @kernel.Thm {
  max_le_lcm_c.get()
}

///|
/// NEUTRAL_GCD
fn step_256() -> Unit raise {
  let t2026 = @meson.meson_tac(@list.List([gcd_0()]))
  let t2025 = @tactics.match_mp_tac(@class.select_unique())
  let t2027 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.neutral()])),
      t2025,
    ),
    t2026,
  )
  neutral_gcd_c.set(
    @tactics.prove(@term_syntax.parse_term("neutral((m : Num) => (n : Num) => gcd((m, n))) == 0"), t2027),
  )
}

///|
let neutral_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_GCD")

///|
/// `NEUTRAL_GCD`
pub fn neutral_gcd() -> @kernel.Thm {
  neutral_gcd_c.get()
}

///|
/// MONOIDAL_GCD
fn step_257() -> Unit raise {
  let t2028 = @meson.meson_tac(@list.List([gcd_assoc(), gcd_sym()]))
  let t2029 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_gcd(), gcd_0()])),
    t2028,
  )
  monoidal_gcd_c.set(
    @tactics.prove(@term_syntax.parse_term("monoidal((m : Num) => (n : Num) => gcd((m, n)))"), t2029),
  )
}

///|
let monoidal_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_GCD")

///|
/// `MONOIDAL_GCD`
pub fn monoidal_gcd() -> @kernel.Thm {
  monoidal_gcd_c.get()
}

///|
/// NEUTRAL_LCM
fn step_258() -> Unit raise {
  let t2031 = @meson.meson_tac(@list.List([lcm_1()]))
  let t2030 = @tactics.match_mp_tac(@class.select_unique())
  let t2032 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@iterate.neutral()])),
      t2030,
    ),
    t2031,
  )
  neutral_lcm_c.set(
    @tactics.prove(@term_syntax.parse_term("neutral((m : Num) => (n : Num) => lcm((m, n))) == 1"), t2032),
  )
}

///|
let neutral_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_LCM")

///|
/// `NEUTRAL_LCM`
pub fn neutral_lcm() -> @kernel.Thm {
  neutral_lcm_c.get()
}

///|
/// MONOIDAL_LCM
fn step_259() -> Unit raise {
  let t2033 = @meson.meson_tac(@list.List([lcm_assoc(), lcm_sym()]))
  let t2034 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_lcm(), lcm_1()])),
    t2033,
  )
  monoidal_lcm_c.set(
    @tactics.prove(@term_syntax.parse_term("monoidal((m : Num) => (n : Num) => lcm((m, n)))"), t2034),
  )
}

///|
let monoidal_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_LCM")

///|
/// `MONOIDAL_LCM`
pub fn monoidal_lcm() -> @kernel.Thm {
  monoidal_lcm_c.get()
}

///|
/// ITERATE_GCD_DIVIDES
fn step_260() -> Unit raise {
  let t2037 = @meson.meson_tac(
    @list.List([
      @sets.not_in_empty(),
      @int.gcd(),
      divides_refl(),
      divides_trans(),
    ]),
  )
  let t2036 = @simp.simp_tac(
    @list.List([
      @sets.forall_in_insert(),
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_gcd()),
    ]),
  )
  let t2035 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2038 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
          ),
        ),
        t2035,
      ),
      t2036,
    ),
    t2037,
  )
  iterate_gcd_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ i : K, FINITE(k) && IN(i, k) → divides(iterate((m : Num) => (n : Num) => gcd((m, n)), k, f), f(i))"),
      t2038,
    ),
  )
}

///|
let iterate_gcd_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_GCD_DIVIDES",
)

///|
/// `ITERATE_GCD_DIVIDES`
pub fn iterate_gcd_divides() -> @kernel.Thm {
  iterate_gcd_divides_c.get()
}

///|
/// ITERATE_GCD_DIVIDES_EQ
fn step_261() -> Unit raise {
  let t2045 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2044 = @tactics.match_mp_tac(iterate_gcd_divides())
  let t2043 = @simp.asm_rewrite_tac(@list.List([divides_zero()]))
  let t2042 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_gcd()]))
  let t2041 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2040 = @simp.asm_rewrite_tac(@list.List([divides_0()]))
  let t2039 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (K) -> Num)((i : K)) == 0"))
  let t2046 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2039,
                ),
                t2040,
              ),
              t2041,
            ),
            t2042,
          ),
          @class.cond_cases_tac,
        ),
        t2043,
      ),
      t2044,
    ),
    t2045,
  )
  iterate_gcd_divides_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ i : K, IN(i, k) → divides(iterate((m : Num) => (n : Num) => gcd((m, n)), k, f), f(i)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) || f(i) == 0)"),
      t2046,
    ),
  )
}

///|
let iterate_gcd_divides_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_GCD_DIVIDES_EQ",
)

///|
/// `ITERATE_GCD_DIVIDES_EQ`
pub fn iterate_gcd_divides_eq() -> @kernel.Thm {
  iterate_gcd_divides_eq_c.get()
}

///|
/// DIVIDES_ITERATE_GCD
fn step_262() -> Unit raise {
  let t2049 = @simp.simp_tac(
    @list.List([neutral_gcd(), divides_0(), @sets.not_in_empty(), divides_gcd()]),
  )
  let t2048 = @simp.simp_tac(
    @list.List([
      @sets.forall_in_insert(),
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_gcd()),
    ]),
  )
  let t2047 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2050 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
        ),
        t2047,
      ),
      t2048,
    ),
    t2049,
  )
  divides_iterate_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ d : Num, FINITE(k) → divides(d, iterate((m : Num) => (n : Num) => gcd((m, n)), k, f)) == (∀ i : K, IN(i, k) → divides(d, f(i)))"),
      t2050,
    ),
  )
}

///|
let divides_iterate_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ITERATE_GCD",
)

///|
/// `DIVIDES_ITERATE_GCD`
pub fn divides_iterate_gcd() -> @kernel.Thm {
  divides_iterate_gcd_c.get()
}

///|
/// DIVIDES_ITERATE_GCD_GEN
fn step_263() -> Unit raise {
  let t2055 = @meson.meson_tac(@list.List([divides_0()]))
  let t2054 = @simp.asm_simp_tac(
    @list.List([divides_iterate_gcd(), @sets.in_elim_thm()]),
  )
  let t2053 = @simp.asm_rewrite_tac(@list.List([divides_0()]))
  let t2052 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_gcd()]))
  let t2051 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2056 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2051),
            t2052,
          ),
          @class.cond_cases_tac,
        ),
        t2053,
      ),
      t2054,
    ),
    t2055,
  )
  divides_iterate_gcd_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ d : Num, divides(d, iterate((m : Num) => (n : Num) => gcd((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) → (∀ i : K, IN(i, k) → divides(d, f(i))))"),
      t2056,
    ),
  )
}

///|
let divides_iterate_gcd_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ITERATE_GCD_GEN",
)

///|
/// `DIVIDES_ITERATE_GCD_GEN`
pub fn divides_iterate_gcd_gen() -> @kernel.Thm {
  divides_iterate_gcd_gen_c.get()
}

///|
/// DIVIDES_ITERATE_LCM
fn step_264() -> Unit raise {
  let t2059 = @simp.asm_simp_tac(
    @list.List([@sets.not_in_empty(), divides_lcm(), divides_refl()]),
  )
  let t2058 = @simp.simp_tac(
    @list.List([
      @sets.forall_in_insert(),
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_lcm()),
    ]),
  )
  let t2057 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2060 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
          ),
        ),
        t2057,
      ),
      t2058,
    ),
    t2059,
  )
  divides_iterate_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ i : K, FINITE(k) && IN(i, k) → divides(f(i), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f))"),
      t2060,
    ),
  )
}

///|
let divides_iterate_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ITERATE_LCM",
)

///|
/// `DIVIDES_ITERATE_LCM`
pub fn divides_iterate_lcm() -> @kernel.Thm {
  divides_iterate_lcm_c.get()
}

///|
/// DIVIDES_ITERATE_LCM_GEN
fn step_265() -> Unit raise {
  let t2067 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2066 = @tactics.match_mp_tac(divides_iterate_lcm())
  let t2065 = @simp.asm_rewrite_tac(@list.List([@int.divides_one()]))
  let t2064 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_lcm()]))
  let t2063 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2062 = @simp.asm_rewrite_tac(@list.List([divides_1()]))
  let t2061 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (K) -> Num)((i : K)) == 1"))
  let t2068 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2061,
                ),
                t2062,
              ),
              t2063,
            ),
            t2064,
          ),
          @class.cond_cases_tac,
        ),
        t2065,
      ),
      t2066,
    ),
    t2067,
  )
  divides_iterate_lcm_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ i : K, IN(i, k) → divides(f(i), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) || f(i) == 1)"),
      t2068,
    ),
  )
}

///|
let divides_iterate_lcm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ITERATE_LCM_GEN",
)

///|
/// `DIVIDES_ITERATE_LCM_GEN`
pub fn divides_iterate_lcm_gen() -> @kernel.Thm {
  divides_iterate_lcm_gen_c.get()
}

///|
/// ITERATE_LCM_DIVIDES
fn step_266() -> Unit raise {
  let t2071 = @simp.simp_tac(
    @list.List([neutral_lcm(), divides_1(), @sets.not_in_empty(), lcm_divides()]),
  )
  let t2070 = @simp.simp_tac(
    @list.List([
      @sets.forall_in_insert(),
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_lcm()),
    ]),
  )
  let t2069 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2072 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
        ),
        t2069,
      ),
      t2070,
    ),
    t2071,
  )
  iterate_lcm_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ n : Num, FINITE(k) → divides(iterate((m : Num) => (n : Num) => lcm((m, n)), k, f), n) == (∀ i : K, IN(i, k) → divides(f(i), n))"),
      t2072,
    ),
  )
}

///|
let iterate_lcm_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_DIVIDES",
)

///|
/// `ITERATE_LCM_DIVIDES`
pub fn iterate_lcm_divides() -> @kernel.Thm {
  iterate_lcm_divides_c.get()
}

///|
/// ITERATE_LCM_DIVIDES_GEN
fn step_267() -> Unit raise {
  let t2076 = @meson.meson_tac(@list.List([divides_1()]))
  let t2075 = @simp.asm_simp_tac(
    @list.List([iterate_lcm_divides(), divides_1(), @sets.in_elim_thm()]),
  )
  let t2074 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_lcm()]))
  let t2073 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2077 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2073),
          t2074,
        ),
        @class.cond_cases_tac,
      ),
      t2075,
    ),
    t2076,
  )
  iterate_lcm_divides_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ n : Num, divides(iterate((m : Num) => (n : Num) => lcm((m, n)), k, f), n) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) → (∀ i : K, IN(i, k) → divides(f(i), n)))"),
      t2077,
    ),
  )
}

///|
let iterate_lcm_divides_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_DIVIDES_GEN",
)

///|
/// `ITERATE_LCM_DIVIDES_GEN`
pub fn iterate_lcm_divides_gen() -> @kernel.Thm {
  iterate_lcm_divides_gen_c.get()
}

///|
/// PRIMEPOW_DIVIDES_ITERATE_LCM
fn step_268() -> Unit raise {
  let t2080 = @meson.meson_tac(
    @list.List([@int.divides_one(), @arith.exp_eq_1(), prime_1()]),
  )
  let t2079 = @simp.simp_tac(
    @list.List([
      @sets.exists_in_insert(),
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_lcm()),
      primepow_divides_lcm(),
      @sets.not_in_empty(),
      neutral_lcm(),
    ]),
  )
  let t2078 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2081 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
          ),
        ),
        t2078,
      ),
      t2079,
    ),
    t2080,
  )
  primepow_divides_iterate_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ p : Num, ∀ m : Num, FINITE(k) && prime(p) → divides(EXP(p, m), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (m == 0 || (∃ i : K, IN(i, k) && divides(EXP(p, m), f(i))))"),
      t2081,
    ),
  )
}

///|
let primepow_divides_iterate_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_ITERATE_LCM",
)

///|
/// `PRIMEPOW_DIVIDES_ITERATE_LCM`
pub fn primepow_divides_iterate_lcm() -> @kernel.Thm {
  primepow_divides_iterate_lcm_c.get()
}

///|
/// PRIMEPOW_DIVIDES_ITERATE_LCM_GEN
fn step_269() -> Unit raise {
  let t2088 = @meson.asm_meson_tac(
    @list.List([divides_1(), @int.divides_one(), prime_1(), @arith.exp_eq_1()]),
  )
  let t2087 = @simp.asm_simp_tac(
    @list.List([primepow_divides_iterate_lcm(), @sets.in_elim_thm()]),
  )
  let t2086 = @simp.asm_rewrite_tac(
    @list.List([@int.divides_one(), @arith.exp_eq_1()]),
  )
  let t2085 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_lcm()]))
  let t2084 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2083 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), divides_1()]))
  let t2082 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t2089 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2082,
                ),
                t2083,
              ),
              t2084,
            ),
            t2085,
          ),
          @class.cond_cases_tac,
        ),
        t2086,
      ),
      t2087,
    ),
    t2088,
  )
  primepow_divides_iterate_lcm_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ p : Num, ∀ m : Num, prime(p) → divides(EXP(p, m), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (m == 0 || FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (∃ i : K, IN(i, k) && divides(EXP(p, m), f(i))))"),
      t2089,
    ),
  )
}

///|
let primepow_divides_iterate_lcm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEPOW_DIVIDES_ITERATE_LCM_GEN",
)

///|
/// `PRIMEPOW_DIVIDES_ITERATE_LCM_GEN`
pub fn primepow_divides_iterate_lcm_gen() -> @kernel.Thm {
  primepow_divides_iterate_lcm_gen_c.get()
}

///|
/// PRIME_DIVIDES_ITERATE_LCM_GEN
fn step_270() -> Unit raise {
  let t2094 = @simp.rewrite_tac(
    @list.List([@arith.exp_1(), @calc_num.arith_eq()]),
  )
  let t2090 = @term_syntax.parse_term("1")
  let t2091 = @term_syntax.parse_term("(p : Num)")
  let t2092 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t2093 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (K) -> Num)"), t2092, t2091, t2090]),
      primepow_divides_iterate_lcm_gen(),
    ),
  )
  let t2095 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2093),
    t2094,
  )
  prime_divides_iterate_lcm_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ p : Num, prime(p) → divides(p, iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (∃ i : K, IN(i, k) && divides(p, f(i))))"),
      t2095,
    ),
  )
}

///|
let prime_divides_iterate_lcm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVIDES_ITERATE_LCM_GEN",
)

///|
/// `PRIME_DIVIDES_ITERATE_LCM_GEN`
pub fn prime_divides_iterate_lcm_gen() -> @kernel.Thm {
  prime_divides_iterate_lcm_gen_c.get()
}

///|
/// PRIME_DIVIDES_ITERATE_LCM
fn step_271() -> Unit raise {
  let t2096 = @simp.simp_tac(
    @list.List([prime_divides_iterate_lcm_gen(), @sets.finite_restrict()]),
  )
  prime_divides_iterate_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (K) -> Num, ∀ k : (K) -> Bool, ∀ p : Num, FINITE(k) && prime(p) → divides(p, iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (∃ i : K, IN(i, k) && divides(p, f(i)))"),
      t2096,
    ),
  )
}

///|
let prime_divides_iterate_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVIDES_ITERATE_LCM",
)

///|
/// `PRIME_DIVIDES_ITERATE_LCM`
pub fn prime_divides_iterate_lcm() -> @kernel.Thm {
  prime_divides_iterate_lcm_c.get()
}

///|
/// ITERATE_LCM_EQ_0_GEN
fn step_272() -> Unit raise {
  let t2118 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2117 = @simp.simp_tac(
    @list.List([
      neutral_lcm(),
      lcm_zero(),
      @sets.exists_in_insert(),
      @sets.not_in_empty(),
    ]),
  )
  let t2116 = @simp.simp_tac(
    @list.List([@drule.match_mp(@iterate.iterate_clauses())(monoidal_lcm())]),
  )
  let t2115 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2113 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t2114 = @tactics.spec_tac(
    @term_syntax.parse_term("{(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 1)}"),
    t2113,
  )
  let t2112 = @tactics.pop_assum(fn(
    x2109 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2110 = @tactics.mp_tac(x2109)
    fn(
      x2111 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2110(x2111)
    }
  })
  let t2108 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(IN((j : _), (k : (_) -> Bool)) && !((f : (_) -> Num)(j) == 1) && f(j) == 0) == (IN(j, {(j : _) | IN(j, k) && !(f(j) == 1)}) && f(j) == 0)"),
      ),
    ]),
  )
  let t2107 = @simp.gen_rewrite_tac(
    fn(
      x2106 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2100 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2101 = @equal.rand_conv(x2100)
        fn(x2102 : @kernel.Term) -> @kernel.Thm raise { s2101(x2102) }
      })(
        (fn(
          x2103 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2104 = @equal.once_depth_conv(x2103)
          fn(x2105 : @kernel.Term) -> @kernel.Thm raise { s2104(x2105) }
        })(x2106),
      )
    },
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) == 0) == (!(n == 1) && n == 0)")),
    ]),
  )
  let t2099 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t2098 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_lcm()]))
  let t2097 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2119 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
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
                          t2097,
                        ),
                        t2098,
                      ),
                      @class.cond_cases_tac,
                    ),
                    t2099,
                  ),
                  t2107,
                ),
                t2108,
              ),
              t2112,
            ),
            t2114,
          ),
          t2115,
        ),
        t2116,
      ),
      t2117,
    ),
    t2118,
  )
  iterate_lcm_eq_0_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 0) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (∃ j : K, IN(j, k) && f(j) == 0))"),
      t2119,
    ),
  )
}

///|
let iterate_lcm_eq_0_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_EQ_0_GEN",
)

///|
/// `ITERATE_LCM_EQ_0_GEN`
pub fn iterate_lcm_eq_0_gen() -> @kernel.Thm {
  iterate_lcm_eq_0_gen_c.get()
}

///|
/// ITERATE_LCM_EQ_0
fn step_273() -> Unit raise {
  let t2120 = @simp.simp_tac(
    @list.List([iterate_lcm_eq_0_gen(), @sets.finite_restrict()]),
  )
  iterate_lcm_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, FINITE(k) → (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 0) == (∃ j : K, IN(j, k) && f(j) == 0)"),
      t2120,
    ),
  )
}

///|
let iterate_lcm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_EQ_0",
)

///|
/// `ITERATE_LCM_EQ_0`
pub fn iterate_lcm_eq_0() -> @kernel.Thm {
  iterate_lcm_eq_0_c.get()
}

///|
/// ITERATE_LCM_EQ_1_GEN
fn step_274() -> Unit raise {
  let t2134 = @sets.set_tac(@list.List([]))
  let t2133 = @simp.simp_tac(
    @list.List([neutral_lcm(), lcm_eq_1(), @sets.not_in_empty()]),
  )
  let t2132 = @simp.simp_tac(
    @list.List([@drule.match_mp(@iterate.iterate_clauses())(monoidal_lcm())]),
  )
  let t2131 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2129 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t2130 = @tactics.spec_tac(
    @term_syntax.parse_term("{(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 1)}"),
    t2129,
  )
  let t2128 = @tactics.pop_assum(fn(
    x2125 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2126 = @tactics.mp_tac(x2125)
    fn(
      x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2126(x2127)
    }
  })
  let t2124 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(∀ j : _, IN(j, (k : (_) -> Bool)) → (f : (_) -> Num)(j) == 1) == (∀ j : _, IN(j, {(j : _) | IN(j, k) && !(f(j) == 1)}) → f(j) == 1)"),
      ),
    ]),
  )
  let t2123 = @simp.asm_rewrite_tac(@list.List([]))
  let t2122 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_lcm()]))
  let t2121 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2135 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t2121,
                      ),
                      t2122,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t2123,
                ),
                t2124,
              ),
              t2128,
            ),
            t2130,
          ),
          t2131,
        ),
        t2132,
      ),
      t2133,
    ),
    t2134,
  )
  iterate_lcm_eq_1_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 1) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) → (∀ j : K, IN(j, k) → f(j) == 1))"),
      t2135,
    ),
  )
}

///|
let iterate_lcm_eq_1_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_EQ_1_GEN",
)

///|
/// `ITERATE_LCM_EQ_1_GEN`
pub fn iterate_lcm_eq_1_gen() -> @kernel.Thm {
  iterate_lcm_eq_1_gen_c.get()
}

///|
/// ITERATE_LCM_EQ_1
fn step_275() -> Unit raise {
  let t2136 = @simp.simp_tac(
    @list.List([iterate_lcm_eq_1_gen(), @sets.finite_restrict()]),
  )
  iterate_lcm_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, FINITE(k) → (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 1) == (∀ j : K, IN(j, k) → f(j) == 1)"),
      t2136,
    ),
  )
}

///|
let iterate_lcm_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_LCM_EQ_1",
)

///|
/// `ITERATE_LCM_EQ_1`
pub fn iterate_lcm_eq_1() -> @kernel.Thm {
  iterate_lcm_eq_1_c.get()
}

///|
/// ITERATE_GCD_EQ_0_GEN
fn step_276() -> Unit raise {
  let t2150 = @sets.set_tac(@list.List([]))
  let t2149 = @simp.simp_tac(
    @list.List([neutral_gcd(), gcd_zero(), @sets.not_in_empty()]),
  )
  let t2148 = @simp.simp_tac(
    @list.List([@drule.match_mp(@iterate.iterate_clauses())(monoidal_gcd())]),
  )
  let t2147 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2145 = @term_syntax.parse_term("(k : (K) -> Bool)")
  let t2146 = @tactics.spec_tac(
    @term_syntax.parse_term("{(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 0)}"),
    t2145,
  )
  let t2144 = @tactics.pop_assum(fn(
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
  })
  let t2140 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(∀ j : _, IN(j, (k : (_) -> Bool)) → (f : (_) -> Num)(j) == 0) == (∀ j : _, IN(j, {(j : _) | IN(j, k) && !(f(j) == 0)}) → f(j) == 0)"),
      ),
    ]),
  )
  let t2139 = @simp.asm_rewrite_tac(@list.List([]))
  let t2138 = @simp.rewrite_tac(@list.List([@iterate.support(), neutral_gcd()]))
  let t2137 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t2151 = @tactics.then_tac(
    @tactics.then_tac(
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
                        t2137,
                      ),
                      t2138,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t2139,
                ),
                t2140,
              ),
              t2144,
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
  )
  iterate_gcd_eq_0_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, (iterate((m : Num) => (n : Num) => gcd((m, n)), k, f) == 0) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) → (∀ j : K, IN(j, k) → f(j) == 0))"),
      t2151,
    ),
  )
}

///|
let iterate_gcd_eq_0_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_GCD_EQ_0_GEN",
)

///|
/// `ITERATE_GCD_EQ_0_GEN`
pub fn iterate_gcd_eq_0_gen() -> @kernel.Thm {
  iterate_gcd_eq_0_gen_c.get()
}

///|
/// ITERATE_GCD_EQ_0
fn step_277() -> Unit raise {
  let t2152 = @simp.simp_tac(
    @list.List([iterate_gcd_eq_0_gen(), @sets.finite_restrict()]),
  )
  iterate_gcd_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (K) -> Bool, ∀ f : (K) -> Num, FINITE(k) → (iterate((m : Num) => (n : Num) => gcd((m, n)), k, f) == 0) == (∀ j : K, IN(j, k) → f(j) == 0)"),
      t2152,
    ),
  )
}

///|
let iterate_gcd_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_GCD_EQ_0",
)

///|
/// `ITERATE_GCD_EQ_0`
pub fn iterate_gcd_eq_0() -> @kernel.Thm {
  iterate_gcd_eq_0_c.get()
}

///|
/// INDUCT_COPRIME
fn step_278() -> Unit raise {
  let t2234 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t2233 = @simp.gen_rewrite_tac(
    fn(
      x2230 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2231 = @equal.land_conv(x2230)
      fn(x2232 : @kernel.Term) -> @kernel.Thm raise { s2231(x2232) }
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) == 1 * m"))]),
  )
  let t2235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.first_x_assum(@tactics.match_mp_tac),
      ),
      t2233,
    ),
    t2234,
  )
  let t2229 = @meson.asm_meson_tac(@list.List([prime_coprime(), coprime_sym()]))
  let t2228 = @tactics.match_mp_tac(coprime_exp())
  let t2227 = @simp.once_rewrite_tac(@list.List([coprime_sym()]))
  let t2226 = @simp.asm_simp_tac(
    @list.List([@arith.exp_eq_0(), prime_imp_nz(), @equal.gsym(@int.divides())]),
  )
  let t2225 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_add(),
      @arith.exp_1(),
      @equal.gsym(@arith.mult_assoc()),
      @arith.eq_mult_lcancel(),
    ]),
  )
  let t2222 = @int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 1"))
  let t2236 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.first_x_assum(fn(
                  x2224 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x2219 : @kernel.Thm,
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
                    let s2220 = @tactics.mp_tac(x2219)
                    fn(
                      x2221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s2220(x2221)
                    }
                  })(
                    (fn(x2223 : @kernel.Thm) -> @kernel.Thm raise {
                      @drule.match_mp(x2223)(t2222)
                    })(x2224),
                  )
                }),
                t2225,
              ),
              t2226,
            ),
            @tactics.disch_tac,
          ),
          t2227,
        ),
        t2228,
      ),
      t2229,
    ),
    t2235,
  ])
  let t2214 = @drule.match_mp(prime_ge_2())
  let t2217 = @tactics.first_x_assum(fn(
    x2216 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x2215 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x2211 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2212 = @tactics.mp_tac(x2211)
        fn(
          x2213 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2212(x2213)
        }
      })(t2214(x2215))
    })(@bool.conjunct1(x2216))
  })
  let t2210 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.exp_eq_0(),
      @arith.exp_eq_1(),
      @arith.mult_eq_0(),
      @arith.mult_eq_1(),
    ]),
  )
  let t2209 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 < (x : Num)) == (!(x == 0) && !(x == 1))")),
    ]),
  )
  let t2218 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.undisch_tac(@term_syntax.parse_term("1 < EXP((p : Num), (k : Num)) * (m : Num)")),
            t2209,
          ),
          t2210,
        ),
        t2217,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t2207 = @simp.rewrite_tac(
    @list.List([
      @arith.exp(),
      @arith.exp_1(),
      @arith.mult_clauses(),
      @int.divides(),
    ]),
  )
  let t2206 = @tactics.first_x_assum(fn(
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
    (fn(
      x2202 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2203 = @tactics.mp_tac(x2202)
      fn(
        x2204 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2203(x2204)
      }
    })(@bool.conjunct2(x2205))
  })
  let t2198 = @int.arith_rule(@term_syntax.parse_term("0 < 1"))
  let t2201 = @tactics.first_x_assum(fn(
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
      x2195 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2196 = @tactics.mp_tac(x2195)
      fn(
        x2197 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2196(x2197)
      }
    })(
      (fn(x2199 : @kernel.Thm) -> @kernel.Thm raise {
        @drule.match_mp(x2199)(t2198)
      })(x2200),
    )
  })
  let t2208 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
            let s2193 = @tactics.subst_all_tac(x2192)
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
          }),
          t2201,
        ),
        t2206,
      ),
      t2207,
    ),
    @tactics.all_tac,
  ])
  let t2191 = @tactics.subgoal_then(@term_syntax.parse_term("!((k : Num) == 0)"), fn(
    x2188 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s2189 = @tactics.assume_tac(x2188)
    fn(
      x2190 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s2189(x2190)
    }
  })
  let t2187 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t2186 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("∀ p : Bool, ((a : Bool) && (b : Bool) && !p) && (c : Bool) && (a && !p → b → (d : Bool)) → a && b && c && d"),
    ),
  )
  let t2185 = @tactics.disch_then(fn(
    x2184 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t2183 = @simp.asm_simp_tac(@list.List([]))
  let t2182 = @tactics.first_x_assum(
    @tactics.conjuncts_then2(@tactics.match_mp_tac, fn(
      x2179 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2180 = @tactics.mp_tac(x2179)
      fn(
        x2181 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2180(x2181)
      }
    }),
  )
  let t2178 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses()]))
  let t2177 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t2176 = @tactics.first_x_assum(fn(
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
    let s2174 = @tactics.subst_all_tac(x2173)
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
  })
  let t2171 = @term_syntax.parse_term("(m : Num)")
  let t2172 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k : Num)"), t2171]),
  )
  let t2170 = @simp.rewrite_tac(
    @list.List([
      @int.divides(),
      @theorems.left_imp_exists_thm(),
      @theorems.left_and_exists_thm(),
    ]),
  )
  let t2169 = @simp.asm_simp_tac(
    @list.List([
      prime_ge_2(),
      @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)")),
    ]),
  )
  let t2167 = @term_syntax.parse_term("(p : Num)")
  let t2168 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t2167]),
      factorization_index(),
    ),
  )
  let t2164 = @drule.match_mp(prime_factor())
  let t2162 = @term_syntax.parse_term("(p : Num)")
  let t2166 = @tactics.disch_then(fn(
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
    ((x2163 : @kernel.Thm) => @tactics.x_choose_tac(t2162, x2163))(t2164(x2165))
  })
  let t2159 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 1)")),
  )
  let t2161 = @tactics.first_assum(fn(
    x2160 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s2157 = @tactics.mp_tac(x2156)
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
    })(t2159(x2160))
  })
  let t2155 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2154 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2153 = @tactics.match_mp_tac(@arith.num_wf())
  let t2237 = @tactics.thenl(
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
                                                    @tactics.gen_tac, @tactics.disch_tac,
                                                  ),
                                                  t2153,
                                                ),
                                                t2154,
                                              ),
                                              t2155,
                                            ),
                                            t2161,
                                          ),
                                          t2166,
                                        ),
                                        t2168,
                                      ),
                                      t2169,
                                    ),
                                    t2170,
                                  ),
                                  t2172,
                                ),
                                @tactics.strip_tac,
                              ),
                              t2176,
                            ),
                            t2177,
                          ),
                          t2178,
                        ),
                        t2182,
                      ),
                      t2183,
                    ),
                    t2185,
                  ),
                  t2186,
                ),
                t2187,
              ),
              t2191,
            ),
            t2208,
          ),
          @tactics.conj_tac,
        ),
        t2218,
      ),
      @tactics.conj_tac,
    ),
    t2236,
  )
  induct_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ a : Num, ∀ b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) → P(a * b)) && (∀ p : Num, ∀ k : Num, prime(p) → P(EXP(p, k))) → (∀ n : Num, 1 < n → P(n))"),
      t2237,
    ),
  )
}

///|
let induct_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDUCT_COPRIME")

///|
/// `INDUCT_COPRIME`
pub fn induct_coprime() -> @kernel.Thm {
  induct_coprime_c.get()
}

///|
/// INDUCT_COPRIME_STRONG
fn step_279() -> Unit raise {
  let t2243 = @meson.asm_meson_tac(@list.List([]))
  let t2242 = @simp.asm_rewrite_tac(
    @list.List([@arith.lt_refl(), @arith.exp()]),
  )
  let t2241 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2240 = @term_syntax.parse_term("(k : Num)")
  let t2244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          @tactics.x_gen_tac,
          @list.List([@term_syntax.parse_term("(p : Num)"), t2240]),
        ),
        t2241,
      ),
      t2242,
    ),
    t2243,
  )
  let t2245 = @list.List([@meson.asm_meson_tac(@list.List([])), t2244])
  let t2239 = @tactics.match_mp_tac(induct_coprime())
  let t2238 = @simp.once_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (a → a → b)"))]),
  )
  let t2246 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
          t2238,
        ),
        t2239,
      ),
      @tactics.conj_tac,
    ),
    t2245,
  )
  induct_coprime_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ a : Num, ∀ b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) → P(a * b)) && (∀ p : Num, ∀ k : Num, prime(p) && !(k == 0) → P(EXP(p, k))) → (∀ n : Num, 1 < n → P(n))"),
      t2246,
    ),
  )
}

///|
let induct_coprime_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDUCT_COPRIME_STRONG",
)

///|
/// `INDUCT_COPRIME_STRONG`
pub fn induct_coprime_strong() -> @kernel.Thm {
  induct_coprime_strong_c.get()
}

///|
/// INDUCT_COPRIME_ALT
fn step_280() -> Unit raise {
  let t2250 = @meson.asm_meson_tac(@list.List([prime_2(), @arith.exp()]))
  let t2249 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2251 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @int.arith_rule(@term_syntax.parse_term("!(1 < (n : Num)) == (n == 0 || n == 1)")),
        ]),
      ),
      t2249,
    ),
    t2250,
  )
  let t2248 = @simp.asm_rewrite_tac(@list.List([]))
  let t2252 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(induct_coprime()), t2248),
    t2251,
  ])
  let t2247 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ n : Num, 1 < n → (P : (Num) -> Bool)(n)) && (∀ n : Num, !(1 < n) → P(n)) → (∀ n : Num, P(n))"),
    ),
  )
  let t2253 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
        t2247,
      ),
      @tactics.conj_tac,
    ),
    t2252,
  )
  induct_coprime_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(0) && (∀ a : Num, ∀ b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) → P(a * b)) && (∀ p : Num, ∀ k : Num, prime(p) → P(EXP(p, k))) → (∀ n : Num, P(n))"),
      t2253,
    ),
  )
}

///|
let induct_coprime_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INDUCT_COPRIME_ALT",
)

///|
/// `INDUCT_COPRIME_ALT`
pub fn induct_coprime_alt() -> @kernel.Thm {
  induct_coprime_alt_c.get()
}

///|
/// DIVIDES_CONV
fn step_281() -> Unit raise {
  let pth_0 = @bool.spec(@term_syntax.parse_term("(b : Num)"), divides_zero())
  let t2254 = @simp.rewrite_tac(@list.List([@int.divides_mod()]))
  let pth_1 = @tactics.prove(
    @term_syntax.parse_term("!((a : Num) == 0) → divides(a, (b : Num)) == (MOD(b, a) == 0)"),
    t2254,
  )
  let a_tm = @term_syntax.parse_term("(a : Num)")
  let b_tm = @term_syntax.parse_term("(b : Num)")
  let zero_tm = @term_syntax.parse_term("0")
  let t2255 = @term_syntax.parse_term("divides")
  let dest_divides : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x2256 : @kernel.Term,
  ) => @basics.dest_binop(t2255, x2256)
  divides_conv_c.set(fn(x2257 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2257
    let (a, b) = dest_divides(tm)
    if a == zero_tm {
      let t2258 = @kernel.inst_rule(@list.List([(b, b_tm)]), pth_0)
      @equal.conv_rule(@equal.rand_conv(@calc_num.num_eq_conv), t2258)
    } else {
      let th1 = @kernel.inst_rule(@list.List([(a, a_tm), (b, b_tm)]), pth_1)
      let th2 = @bool.mp(
        th1,
        @bool.eqf_elim(
          @calc_num.num_eq_conv(@kernel.rand(@equal.lhand(@kernel.concl(th1)))),
        ),
      )
      @equal.conv_rule(
        @equal.rand_conv(
          @equal.thenc(
            @equal.land_conv(@calc_num.num_mod_conv),
            @calc_num.num_eq_conv,
          ),
        ),
        th2,
      )
    }
  })
}

///|
let divides_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "DIVIDES_CONV",
)

///|
/// `DIVIDES_CONV`
pub fn divides_conv(x : @kernel.Term) -> @kernel.Thm raise {
  divides_conv_c.get()(x)
}

///|
/// COPRIME_CONV
fn step_282() -> Unit raise {
  let t2259 = @meson.meson_tac(
    @list.List([
      @int.coprime(),
      divides_rmul(),
      divides_add_revr(),
      @int.divides_one(),
    ]),
  )
  let pth_yes_l = @tactics.prove(
    @term_syntax.parse_term("(m : Num) * (x : Num) == (n : Num) * (y : Num) + 1 → coprime((m, n)) == true"),
    t2259,
  )
  let t2260 = @meson.meson_tac(
    @list.List([
      @int.coprime(),
      divides_rmul(),
      divides_add_revr(),
      @int.divides_one(),
    ]),
  )
  let pth_yes_r = @tactics.prove(
    @term_syntax.parse_term("(m : Num) * (x : Num) == (n : Num) * (y : Num) + 1 → coprime((n, m)) == true"),
    t2260,
  )
  let t2261 = @meson.meson_tac(@list.List([@arith.mult_ac()]))
  let t2262 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.coprime(), @int.divides()])),
    t2261,
  )
  let pth_no = @tactics.prove(
    @term_syntax.parse_term("(m : Num) == (x : Num) * (d : Num) && (n : Num) == (y : Num) * d && !(d == 1) → coprime((m, n)) == false"),
    t2262,
  )
  let t2263 = @meson.meson_tac(
    @list.List([
      @int.coprime(),
      divides_refl(),
      @calc_num.num_reduce_conv(@term_syntax.parse_term("1 == 0")),
    ]),
  )
  let pth_oo = @tactics.prove(@term_syntax.parse_term("coprime((0, 0)) == false"), t2263)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let x_tm = @term_syntax.parse_term("(x : Num)")
  let y_tm = @term_syntax.parse_term("(y : Num)")
  let d_tm = @term_syntax.parse_term("(d : Num)")
  let coprime_tm = @term_syntax.parse_term("coprime")
  fn bezout_1(
    x2264 : @num.Num,
    x2265 : @num.Num,
  ) -> (@num.Num, @num.Num) raise {
    let (m, n) = (x2264, x2265)
    if @num.eq_num(m, @num.num_of_int64(0L)) {
      let t2266 = @num.num_of_int64(1L)
      (@num.num_of_int64(0L), t2266)
    } else if @num.eq_num(n, @num.num_of_int64(0L)) {
      let t2267 = @num.num_of_int64(0L)
      (@num.num_of_int64(1L), t2267)
    } else if @num.le_num(m, n) {
      let q = @num.quo_num(n, m)
      let r = @num.mod_num(n, m)
      let (x, y) = bezout_1(m, r)
      (@num.sub_num(x, @num.mult_num(q, y)), y)
    } else {
      let (x_1, y_1) = bezout_1(n, m)
      (y_1, x_1)
    }
  }
  coprime_conv_c.set(fn(x2268 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2268
    let (pop, ptm) = @kernel.dest_comb(tm)
    if pop != coprime_tm {
      raise Failure("COPRIME_CONV")
    } else {
      let (l, r_1) = @pair.dest_pair(ptm)
      let m_1 = @basics.dest_numeral(l)
      let n_1 = @basics.dest_numeral(r_1)
      if @num.eq_num(m_1, @num.num_of_int64(0L)) &&
        @num.eq_num(n_1, @num.num_of_int64(0L)) {
        pth_oo
      } else {
        let (x_2, y_2) = bezout_1(m_1, n_1)
        let t2269 = @num.mult_num(y_2, n_1)
        let d = @num.add_num(@num.mult_num(x_2, m_1), t2269)
        let th = if @num.eq_num(d, @num.num_of_int64(1L)) {
          if @num.gt_num(x_2, @num.num_of_int64(0L)) {
            let t2270 = (@nums.mk_numeral(@num.minus_num(y_2)), y_tm)
            @kernel.inst_rule(
              @list.List([
                (l, m_tm),
                (r_1, n_tm),
                (@nums.mk_numeral(x_2), x_tm),
                t2270,
              ]),
              pth_yes_l,
            )
          } else {
            let t2271 = (@nums.mk_numeral(y_2), x_tm)
            @kernel.inst_rule(
              @list.List([
                (r_1, m_tm),
                (l, n_tm),
                (@nums.mk_numeral(@num.minus_num(x_2)), y_tm),
                t2271,
              ]),
              pth_yes_r,
            )
          }
        } else {
          let t2272 = (@nums.mk_numeral(@num.div_num(n_1, d)), y_tm)
          let t2273 = (@nums.mk_numeral(@num.div_num(m_1, d)), x_tm)
          @kernel.inst_rule(
            @list.List([
              (l, m_tm),
              (r_1, n_tm),
              (@nums.mk_numeral(d), d_tm),
              t2273,
              t2272,
            ]),
            pth_no,
          )
        }
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
let coprime_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "COPRIME_CONV",
)

///|
/// `COPRIME_CONV`
pub fn coprime_conv(x : @kernel.Term) -> @kernel.Thm raise {
  coprime_conv_c.get()(x)
}

///|
/// GCD_CONV
fn step_283() -> Unit raise {
  let t2274 = @simp.rewrite_tac(@list.List([gcd_0()]))
  let pth0 = @tactics.prove(@term_syntax.parse_term("gcd((0, 0)) == 0"), t2274)
  let t2281 = @meson.asm_meson_tac(
    @list.List([
      divides_lmul(),
      divides_rmul(),
      divides_add_revr(),
      divides_refl(),
    ]),
  )
  let t2280 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(gcd_unique())]))
  let t2279 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t2278 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2275 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s2276 = @tactics.mp_tac(x2275)
        fn(
          x2277 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s2276(x2277)
        }
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t2282 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2278),
        t2279,
      ),
      t2280,
    ),
    t2281,
  )
  let pth1 = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, ∀ d : Num, ∀ m' : Num, ∀ n' : Num, m * x == n * y + d && m == m' * d && n == n' * d → gcd((m, n)) == d"),
    t2282,
  )
  let t2283 = @meson.meson_tac(@list.List([pth1, gcd_sym()]))
  let pth2 = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, ∀ d : Num, ∀ m' : Num, ∀ n' : Num, n * y == m * x + d && m == m' * d && n == n' * d → gcd((m, n)) == d"),
    t2283,
  )
  let gcd_tm = @term_syntax.parse_term("gcd")
  fn bezout_1(
    x2284 : @num.Num,
    x2285 : @num.Num,
  ) -> (@num.Num, @num.Num) raise {
    let (m, n) = (x2284, x2285)
    if @num.eq_num(m, @num.num_of_int64(0L)) {
      let t2286 = @num.num_of_int64(1L)
      (@num.num_of_int64(0L), t2286)
    } else if @num.eq_num(n, @num.num_of_int64(0L)) {
      let t2287 = @num.num_of_int64(0L)
      (@num.num_of_int64(1L), t2287)
    } else if @num.le_num(m, n) {
      let q = @num.quo_num(n, m)
      let r = @num.mod_num(n, m)
      let (x, y) = bezout_1(m, r)
      (@num.sub_num(x, @num.mult_num(q, y)), y)
    } else {
      let (x_1, y_1) = bezout_1(n, m)
      (y_1, x_1)
    }
  }
  gcd_conv_c.set(fn(x2288 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2288
    let (gt, lr) = @kernel.dest_comb(tm)
    if gt != gcd_tm {
      raise Failure("GCD_CONV")
    } else {
      let (mtm, ntm) = @pair.dest_pair(lr)
      let m_1 = @basics.dest_numeral(mtm)
      let n_1 = @basics.dest_numeral(ntm)
      if @num.eq_num(m_1, @num.num_of_int64(0L)) &&
        @num.eq_num(n_1, @num.num_of_int64(0L)) {
        pth0
      } else {
        let (x0, y0) = bezout_1(m_1, n_1)
        let x_2 = @num.abs_num(x0)
        let y_2 = @num.abs_num(y0)
        let xtm = @nums.mk_numeral(x_2)
        let ytm = @nums.mk_numeral(y_2)
        let t2289 = @num.mult_num(y_2, n_1)
        let d = @num.abs_num(@num.sub_num(@num.mult_num(x_2, m_1), t2289))
        let dtm = @nums.mk_numeral(d)
        let m_p = @num.div_num(m_1, d)
        let n_p = @num.div_num(n_1, d)
        let mtm_p = @nums.mk_numeral(m_p)
        let ntm_p = @nums.mk_numeral(n_p)
        let t2290 = @num.add_num(@num.mult_num(n_1, y_2), d)
        let th = @bool.specl(
          @list.List([mtm, ntm, xtm, ytm, dtm, mtm_p, ntm_p]),
          if @num.eq_num(@num.mult_num(m_1, x_2), t2290) {
            pth1
          } else {
            pth2
          },
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
let gcd_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "GCD_CONV",
)

///|
/// `GCD_CONV`
pub fn gcd_conv(x : @kernel.Term) -> @kernel.Thm raise {
  gcd_conv_c.get()(x)
}

///|
/// LCM_CONV
fn step_284() -> Unit raise {
  let t2295 = @equal.comb2_conv(
    @equal.rand_conv(@calc_num.num_mult_conv),
    gcd_conv,
  )
  let t2296 = @equal.thenc(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x2294 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x2294
        },
        @list.List([@bool.conjunct2(@bool.spec_all(@class.cond_clauses()))]),
      ),
      t2295,
    ),
    @calc_num.num_div_conv,
  )
  let t2297 = @equal.orelsec(
    @simp.gen_rewrite_conv(
      fn(
        x2293 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x2293
      },
      @list.List([@bool.conjunct1(@bool.spec_all(@class.cond_clauses()))]),
    ),
    t2296,
  )
  let t2292 = @equal.rator_conv(
    @equal.land_conv(
      @equal.thenc(
        @equal.land_conv(@calc_num.num_mult_conv),
        @calc_num.num_eq_conv,
      ),
    ),
  )
  lcm_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x2291 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x2291
          },
          @list.List([lcm()]),
        ),
        t2292,
      ),
      t2297,
    ),
  )
}

///|
let lcm_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LCM_CONV")

///|
/// `LCM_CONV`
pub fn lcm_conv(x : @kernel.Term) -> @kernel.Thm raise {
  lcm_conv_c.get()(x)
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
}
