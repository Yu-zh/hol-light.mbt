// Translated from upstream Library/floor.ml; edit this file directly.

///|
/// Library/floor.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// INTEGER_CASES
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([@int.is_int(), @theorems.or_exists_thm()]),
  )
  integer_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("integer((x : Real)) == ((∃ n : Num, x == real_of_num(n)) || (∃ n : Num, x == -real_of_num(n)))"),
      t1,
    ),
  )
}

///|
let integer_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_CASES")

///|
/// `INTEGER_CASES`
pub fn integer_cases() -> @kernel.Thm {
  integer_cases_c.get()
}

///|
/// REAL_ABS_INTEGER_LEMMA
fn step_3() -> Unit raise {
  let t14 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @realax.real_of_num_le()]),
  )
  let t13 = @tactics.pop_assum(
    @tactics.choose_then(fn(
      x10 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s11 = @tactics.subst1_tac(x10)
      fn(
        x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s11(x12)
      }
    }),
  )
  let t9 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == real_of_num(0)) == (abs(x) == real_of_num(0))")),
    ]),
  )
  let t8 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s3 = @tactics.assume_tac(x2)
        fn(
          x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s3(x4)
        }
      },
      fn(
        x5 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s6 = @tactics.mp_tac(x5)
        fn(
          x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s6(x7)
        }
      },
    ),
  )
  let t15 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(@list.List([@int.integer()])),
            ),
            t8,
          ),
          t9,
        ),
        t13,
      ),
      t14,
    ),
    @int.arith_tac,
  )
  real_abs_integer_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, integer(x) && !(x == real_of_num(0)) → real_of_num(1) <= abs(x)"),
      t15,
    ),
  )
}

///|
let real_abs_integer_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_INTEGER_LEMMA",
)

///|
/// `REAL_ABS_INTEGER_LEMMA`
pub fn real_abs_integer_lemma() -> @kernel.Thm {
  real_abs_integer_lemma_c.get()
}

///|
/// INTEGER_CLOSED
fn step_4() -> Unit raise {
  let t40 = @meson.meson_tac(
    @list.List([@arith.le_exists(), @arith.add_sym(), @arith.le_cases()]),
  )
  let t39 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]),
  )
  let t37 = @calc_rat.real_arith(
    @term_syntax.parse_term("((a : Real) + -(b : Real) == (c : Real)) == (b + c == a)"),
  )
  let t38 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(-(a : Real) + (b : Real) == (c : Real)) == (a + c == b)")),
      t37,
    ]),
  )
  let t35 = @meson.meson_tac(@list.List([]))
  let t36 = @list.List([
    @meson.meson_tac(@list.List([])),
    @tactics.all_tac,
    @tactics.all_tac,
    t35,
  ])
  let t34 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@calc_int.real_neg_add()),
      @realax.real_of_num_add(),
    ]),
  )
  let t33 = @tactics.repeat_tac(@tactics.strip_tac)
  let t32 = @simp.simp_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("real_of_num(0) <= (a : Real) → (abs((x : Real)) == a) == (x == a || x == -a)"),
      ),
      @realarith.real_pos(),
    ]),
  )
  let t23 = @meson.meson_tac(@list.List([]))
  let t24 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_sub()])),
    t23,
  )
  let t25 = @simp.rewrite_tac(@list.List([@real.real_abs_abs()]))
  let t26 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg()]))
  let t22 = @meson.meson_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t27 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@real.real_abs_pow()])),
    t22,
  )
  let t21 = @meson.meson_tac(@list.List([@realax.real_of_num_mul()]))
  let t28 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@real.real_abs_mul()])),
    t21,
  )
  let t20 = @meson.meson_tac(@list.List([]))
  let t29 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@calc_int.real_abs_num()])),
    t20,
  )
  let t19 = @meson.meson_tac(@list.List([]))
  let t30 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_min()])),
    t19,
  )
  let t18 = @meson.meson_tac(@list.List([]))
  let t31 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_max()])), t18),
    t30,
    t29,
    t28,
    t27,
    t26,
    t25,
    t24,
    @tactics.all_tac,
  ])
  let t17 = @tactics.repeat_tac(@tactics.conj_tac)
  let t16 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(g : Bool) && (h : Bool) && (x : Bool) && (c : Bool) && (d : Bool) && (e : Bool) && (f : Bool) && ((a : Bool) && e → (b : Bool)) && a → x && a && b && c && d && e && f && g && h"),
    ),
  )
  let t41 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([@int.integer()])),
                      t16,
                    ),
                    t17,
                  ),
                  t31,
                ),
                t32,
              ),
              t33,
            ),
            t34,
          ),
          t36,
        ),
        t38,
      ),
      t39,
    ),
    t40,
  )
  integer_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, integer(real_of_num(n))) && (∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x + y)) && (∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x - y)) && (∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x * y)) && (∀ x : Real, ∀ r : Num, integer(x) → integer(pow(x, r))) && (∀ x : Real, integer(x) → integer(-x)) && (∀ x : Real, integer(x) → integer(abs(x))) && (∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(max(x, y))) && (∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(min(x, y)))"),
      t41,
    ),
  )
}

///|
let integer_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_CLOSED")

///|
/// `INTEGER_CLOSED`
pub fn integer_closed() -> @kernel.Thm {
  integer_closed_c.get()
}

///|
/// INTEGER_ADD
fn step_5() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([integer_closed()]))
  integer_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x + y)"),
      t42,
    ),
  )
}

///|
let integer_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_ADD")

///|
/// `INTEGER_ADD`
pub fn integer_add() -> @kernel.Thm {
  integer_add_c.get()
}

///|
/// INTEGER_SUB
fn step_6() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([integer_closed()]))
  integer_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x - y)"),
      t43,
    ),
  )
}

///|
let integer_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_SUB")

///|
/// `INTEGER_SUB`
pub fn integer_sub() -> @kernel.Thm {
  integer_sub_c.get()
}

///|
/// INTEGER_MUL
fn step_7() -> Unit raise {
  let t44 = @simp.rewrite_tac(@list.List([integer_closed()]))
  integer_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → integer(x * y)"),
      t44,
    ),
  )
}

///|
let integer_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_MUL")

///|
/// `INTEGER_MUL`
pub fn integer_mul() -> @kernel.Thm {
  integer_mul_c.get()
}

///|
/// INTEGER_POW
fn step_8() -> Unit raise {
  let t45 = @simp.rewrite_tac(@list.List([integer_closed()]))
  integer_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, integer(x) → integer(pow(x, n))"),
      t45,
    ),
  )
}

///|
let integer_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_POW")

///|
/// `INTEGER_POW`
pub fn integer_pow() -> @kernel.Thm {
  integer_pow_c.get()
}

///|
/// REAL_LE_INTEGERS
fn step_9() -> Unit raise {
  let t47 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t46 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real) - (x : Real)"), real_abs_integer_lemma()),
  )
  let t48 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t46),
      t47,
    ),
    @calc_rat.real_arith_tac,
  )
  real_le_integers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → (x <= y) == (x == y || x + real_of_num(1) <= y)"),
      t48,
    ),
  )
}

///|
let real_le_integers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_INTEGERS",
)

///|
/// `REAL_LE_INTEGERS`
pub fn real_le_integers() -> @kernel.Thm {
  real_le_integers_c.get()
}

///|
/// REAL_LE_CASES_INTEGERS
fn step_10() -> Unit raise {
  let t50 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t49 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real) - (x : Real)"), real_abs_integer_lemma()),
  )
  let t51 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49),
      t50,
    ),
    @calc_rat.real_arith_tac,
  )
  real_le_cases_integers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → x <= y || y + real_of_num(1) <= x"),
      t51,
    ),
  )
}

///|
let real_le_cases_integers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_CASES_INTEGERS",
)

///|
/// `REAL_LE_CASES_INTEGERS`
pub fn real_le_cases_integers() -> @kernel.Thm {
  real_le_cases_integers_c.get()
}

///|
/// REAL_LE_REVERSE_INTEGERS
fn step_11() -> Unit raise {
  let t52 = @meson.meson_tac(@list.List([real_le_cases_integers()]))
  real_le_reverse_integers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) && !(y + real_of_num(1) <= x) → x <= y"),
      t52,
    ),
  )
}

///|
let real_le_reverse_integers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_REVERSE_INTEGERS",
)

///|
/// `REAL_LE_REVERSE_INTEGERS`
pub fn real_le_reverse_integers() -> @kernel.Thm {
  real_le_reverse_integers_c.get()
}

///|
/// REAL_LT_INTEGERS
fn step_12() -> Unit raise {
  let t53 = @meson.meson_tac(
    @list.List([
      @realarith.real_not_lt(),
      real_le_cases_integers(),
      @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) <= (y : Real) → x < y")),
    ]),
  )
  real_lt_integers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → (x < y) == (x + real_of_num(1) <= y)"),
      t53,
    ),
  )
}

///|
let real_lt_integers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_INTEGERS",
)

///|
/// `REAL_LT_INTEGERS`
pub fn real_lt_integers() -> @kernel.Thm {
  real_lt_integers_c.get()
}

///|
/// REAL_EQ_INTEGERS
fn step_13() -> Unit raise {
  let t54 = @simp.simp_tac(@list.List([real_lt_integers()]))
  let t55 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @calc_rat.real_arith(
            @term_syntax.parse_term("((x : Real) == (y : Real)) == !(x < y || y < x)"),
          ),
        ]),
      ),
      t54,
    ),
    @calc_rat.real_arith_tac,
  )
  real_eq_integers_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → (x == y) == (abs(x - y) < real_of_num(1))"),
      t55,
    ),
  )
}

///|
let real_eq_integers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_INTEGERS",
)

///|
/// `REAL_EQ_INTEGERS`
pub fn real_eq_integers() -> @kernel.Thm {
  real_eq_integers_c.get()
}

///|
/// REAL_EQ_INTEGERS_IMP
fn step_14() -> Unit raise {
  let t56 = @simp.simp_tac(@list.List([real_eq_integers()]))
  real_eq_integers_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) && abs(x - y) < real_of_num(1) → x == y"),
      t56,
    ),
  )
}

///|
let real_eq_integers_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_INTEGERS_IMP",
)

///|
/// `REAL_EQ_INTEGERS_IMP`
pub fn real_eq_integers_imp() -> @kernel.Thm {
  real_eq_integers_imp_c.get()
}

///|
/// INTEGER_NEG
fn step_15() -> Unit raise {
  let t57 = @meson.meson_tac(
    @list.List([integer_closed(), @calc_int.real_neg_neg()]),
  )
  integer_neg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(-x) == integer(x)"), t57),
  )
}

///|
let integer_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_NEG")

///|
/// `INTEGER_NEG`
pub fn integer_neg() -> @kernel.Thm {
  integer_neg_c.get()
}

///|
/// INTEGER_ABS
fn step_16() -> Unit raise {
  let t58 = @simp.rewrite_tac(@list.List([integer_neg()]))
  let t59 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@realax.real_abs()])),
      ),
      @class.cond_cases_tac,
    ),
    t58,
  )
  integer_abs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(abs(x)) == integer(x)"), t59),
  )
}

///|
let integer_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_ABS")

///|
/// `INTEGER_ABS`
pub fn integer_abs() -> @kernel.Thm {
  integer_abs_c.get()
}

///|
/// INTEGER_POS
fn step_17() -> Unit raise {
  let t60 = @simp.simp_tac(@list.List([@int.integer(), @realax.real_abs()]))
  integer_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → integer(x) == (∃ n : Num, x == real_of_num(n))"),
      t60,
    ),
  )
}

///|
let integer_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_POS")

///|
/// `INTEGER_POS`
pub fn integer_pos() -> @kernel.Thm {
  integer_pos_c.get()
}

///|
/// NONNEGATIVE_INTEGER
fn step_18() -> Unit raise {
  let t61 = @meson.meson_tac(
    @list.List([integer_pos(), integer_closed(), @realarith.real_pos()]),
  )
  nonnegative_integer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (integer(x) && real_of_num(0) <= x) == (∃ n : Num, x == real_of_num(n))"),
      t61,
    ),
  )
}

///|
let nonnegative_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NONNEGATIVE_INTEGER",
)

///|
/// `NONNEGATIVE_INTEGER`
pub fn nonnegative_integer() -> @kernel.Thm {
  nonnegative_integer_c.get()
}

///|
/// NONPOSITIVE_INTEGER
fn step_19() -> Unit raise {
  let t62 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_and_exists_thm(),
      @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) == real_of_num(0)) == (a == -b)")),
    ]),
  )
  let t63 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([@int.is_int()])),
          ),
          t62,
        ),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  nonpositive_integer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (integer(x) && x <= real_of_num(0)) == (∃ n : Num, x == -real_of_num(n))"),
      t63,
    ),
  )
}

///|
let nonpositive_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NONPOSITIVE_INTEGER",
)

///|
/// `NONPOSITIVE_INTEGER`
pub fn nonpositive_integer() -> @kernel.Thm {
  nonpositive_integer_c.get()
}

///|
/// NONPOSITIVE_INTEGER_ALT
fn step_20() -> Unit raise {
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([nonpositive_integer()])),
        ),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  nonpositive_integer_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (integer(x) && x <= real_of_num(0)) == (∃ n : Num, x + real_of_num(n) == real_of_num(0))"),
      t64,
    ),
  )
}

///|
let nonpositive_integer_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NONPOSITIVE_INTEGER_ALT",
)

///|
/// `NONPOSITIVE_INTEGER_ALT`
pub fn nonpositive_integer_alt() -> @kernel.Thm {
  nonpositive_integer_alt_c.get()
}

///|
/// INTEGER_ADD_EQ
fn step_21() -> Unit raise {
  let t65 = @meson.meson_tac(
    @list.List([@real.real_add_sub(), @realax.real_add_sym(), integer_closed()]),
  )
  integer_add_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, integer(x) → integer(x + y) == integer(y)) && (∀ x : Real, ∀ y : Real, integer(y) → integer(x + y) == integer(x))"),
      t65,
    ),
  )
}

///|
let integer_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_ADD_EQ")

///|
/// `INTEGER_ADD_EQ`
pub fn integer_add_eq() -> @kernel.Thm {
  integer_add_eq_c.get()
}

///|
/// INTEGER_SUB_EQ
fn step_22() -> Unit raise {
  let t66 = @meson.meson_tac(
    @list.List([
      @real.real_sub_add(),
      @realarith.real_neg_sub(),
      integer_closed(),
    ]),
  )
  integer_sub_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, integer(x) → integer(x - y) == integer(y)) && (∀ x : Real, ∀ y : Real, integer(y) → integer(x - y) == integer(x))"),
      t66,
    ),
  )
}

///|
let integer_sub_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_SUB_EQ")

///|
/// `INTEGER_SUB_EQ`
pub fn integer_sub_eq() -> @kernel.Thm {
  integer_sub_eq_c.get()
}

///|
/// FORALL_INTEGER
fn step_23() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([integer_cases()]))
  forall_integer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ n : Num, P(real_of_num(n))) && (∀ x : Real, P(x) → P(-x)) → (∀ x : Real, integer(x) → P(x))"),
      t67,
    ),
  )
}

///|
let forall_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_INTEGER")

///|
/// `FORALL_INTEGER`
pub fn forall_integer() -> @kernel.Thm {
  forall_integer_c.get()
}

///|
/// INTEGER_SUM
fn step_24() -> Unit raise {
  let t69 = @simp.asm_rewrite_tac(@list.List([integer_closed()]))
  let t68 = @tactics.match_mp_tac(@iterate.sum_closed())
  let t70 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t68),
    t69,
  )
  integer_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → integer(f(x))) → integer(sum(s, f))"),
      t70,
    ),
  )
}

///|
let integer_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_SUM")

///|
/// `INTEGER_SUM`
pub fn integer_sum() -> @kernel.Thm {
  integer_sum_c.get()
}

///|
/// INTEGER_ABS_MUL_EQ_1
fn step_25() -> Unit raise {
  let t73 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_eq(),
      @realax.real_of_num_mul(),
      @arith.mult_eq_1(),
    ]),
  )
  let t72 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t71 = @tactics.repeat_tac(@tactics.strip_tac)
  let t74 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.integer()])), t71),
      t72,
    ),
    t73,
  )
  integer_abs_mul_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, integer(x) && integer(y) → (abs(x * y) == real_of_num(1)) == (abs(x) == real_of_num(1) && abs(y) == real_of_num(1))"),
      t74,
    ),
  )
}

///|
let integer_abs_mul_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_ABS_MUL_EQ_1",
)

///|
/// `INTEGER_ABS_MUL_EQ_1`
pub fn integer_abs_mul_eq_1() -> @kernel.Thm {
  integer_abs_mul_eq_1_c.get()
}

///|
/// INTEGER_DIV
fn step_26() -> Unit raise {
  let t77 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_mul(), @realax.real_of_num_eq()]),
  )
  let t76 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_of_num_eq(),
      @calc_rat.real_field(
        @term_syntax.parse_term("!((n : Real) == real_of_num(0)) → ((x : Real) / n == (y : Real)) == (x == n * y)"),
      ),
    ]),
  )
  let t78 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          integer_pos(),
          @realarith.real_pos(),
          @real.real_le_div(),
          @int.divides(),
        ]),
      ),
      t76,
    ),
    t77,
  )
  let t79 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @realax.real_div(),
        @realax.real_inv_0(),
        @calc_int.real_mul_rzero(),
        integer_closed(),
      ]),
    ),
    t78,
  ])
  let t75 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t80 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t75),
    t79,
  )
  integer_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, integer(real_of_num(m) / real_of_num(n)) == (n == 0 || divides(n, m))"),
      t80,
    ),
  )
}

///|
let integer_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_DIV")

///|
/// `INTEGER_DIV`
pub fn integer_div() -> @kernel.Thm {
  integer_div_c.get()
}

///|
/// rational
fn step_27() -> Unit raise {
  rational_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(rational : (Real) -> Bool)((x : Real)) == (∃ m : Real, ∃ n : Real, integer(m) && integer(n) && !(n == real_of_num(0)) && x == m / n)"),
    ),
  )
}

///|
let rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rational")

///|
/// `rational`
pub fn rational() -> @kernel.Thm {
  rational_c.get()
}

///|
/// RATIONAL_INTEGER
fn step_28() -> Unit raise {
  let t88 = @tactics.conv_tac(@calc_rat.real_field)
  let t87 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t85 = @term_syntax.parse_term("real_of_num(1)")
  let t86 = @tactics.map_every(
    fn(
      x82 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s83 = @tactics.exists_tac(x82)
      fn(
        x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s83(x84)
      }
    },
    @list.List([@term_syntax.parse_term("(x : Real)"), t85]),
  )
  let t81 = @simp.rewrite_tac(@list.List([rational()]))
  let t89 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
          t81,
        ),
        t86,
      ),
      t87,
    ),
    t88,
  )
  rational_integer_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(x) → rational(x)"), t89),
  )
}

///|
let rational_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_INTEGER",
)

///|
/// `RATIONAL_INTEGER`
pub fn rational_integer() -> @kernel.Thm {
  rational_integer_c.get()
}

///|
/// RATIONAL_NUM
fn step_29() -> Unit raise {
  let t90 = @simp.simp_tac(@list.List([rational_integer(), integer_closed()]))
  rational_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, rational(real_of_num(n))"), t90),
  )
}

///|
let rational_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_NUM")

///|
/// `RATIONAL_NUM`
pub fn rational_num() -> @kernel.Thm {
  rational_num_c.get()
}

///|
/// RATIONAL_NEG
fn step_30() -> Unit raise {
  let t100 = @tactics.conv_tac(@calc_rat.real_field)
  let t99 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t97 = @term_syntax.parse_term("(n : Real)")
  let t98 = @tactics.map_every(
    fn(
      x94 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s95 = @tactics.exists_tac(x94)
      fn(
        x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s95(x96)
      }
    },
    @list.List([@term_syntax.parse_term("-(m : Real)"), t97]),
  )
  let t91 = @term_syntax.parse_term("(n : Real)")
  let t92 = @term_syntax.parse_term("(m : Real)")
  let t93 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Real)"), t92, t91]),
  )
  let t101 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([rational(), @theorems.left_imp_exists_thm()]),
            ),
            t93,
          ),
          @tactics.strip_tac,
        ),
        t98,
      ),
      t99,
    ),
    t100,
  )
  rational_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(x) → rational(-x)"),
      t101,
    ),
  )
}

///|
let rational_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_NEG")

///|
/// `RATIONAL_NEG`
pub fn rational_neg() -> @kernel.Thm {
  rational_neg_c.get()
}

///|
/// RATIONAL_ABS
fn step_31() -> Unit raise {
  let t102 = @meson.meson_tac(@list.List([rational_neg()]))
  let t103 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_abs()])),
    t102,
  )
  rational_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(x) → rational(abs(x))"),
      t103,
    ),
  )
}

///|
let rational_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_ABS")

///|
/// `RATIONAL_ABS`
pub fn rational_abs() -> @kernel.Thm {
  rational_abs_c.get()
}

///|
/// RATIONAL_INV
fn step_32() -> Unit raise {
  let t118 = @tactics.conv_tac(@calc_rat.real_field)
  let t117 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t113 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t111 = @term_syntax.parse_term("(m : Real)")
  let t112 = @tactics.map_every(
    fn(
      x108 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s109 = @tactics.exists_tac(x108)
      fn(
        x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s109(x110)
      }
    },
    @list.List([@term_syntax.parse_term("(n : Real)"), t111]),
  )
  let t106 = @term_syntax.parse_term("(n : Real)")
  let t107 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Real)"), t106]),
  )
  let t105 = @simp.rewrite_tac(
    @list.List([rational(), @theorems.left_imp_exists_thm()]),
  )
  let t104 = @simp.asm_simp_tac(
    @list.List([@realax.real_inv_0(), rational_num()]),
  )
  let t119 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)")),
                  ),
                  t104,
                ),
                t105,
              ),
              t107,
            ),
            @tactics.strip_tac,
          ),
          t112,
        ),
        t113,
      ),
      t117,
    ),
    t118,
  )
  rational_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(x) → rational(inv(x))"),
      t119,
    ),
  )
}

///|
let rational_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_INV")

///|
/// `RATIONAL_INV`
pub fn rational_inv() -> @kernel.Thm {
  rational_inv_c.get()
}

///|
/// RATIONAL_ADD
fn step_33() -> Unit raise {
  let t136 = @tactics.conv_tac(@calc_rat.real_field)
  let t135 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t131 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t129 = @term_syntax.parse_term("(n1 : Real) * (n2 : Real)")
  let t130 = @tactics.map_every(
    fn(
      x126 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s127 = @tactics.exists_tac(x126)
      fn(
        x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s127(x128)
      }
    },
    @list.List([@term_syntax.parse_term("(m1 : Real) * (n2 : Real) + (m2 : Real) * (n1 : Real)"), t129]),
  )
  let t122 = @term_syntax.parse_term("(n2 : Real)")
  let t123 = @term_syntax.parse_term("(m2 : Real)")
  let t124 = @term_syntax.parse_term("(n1 : Real)")
  let t125 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m1 : Real)"), t124, t123, t122]),
  )
  let t121 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_and_exists_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t120 = @simp.rewrite_tac(
    @list.List([rational(), @theorems.left_and_exists_thm()]),
  )
  let t137 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t120),
                t121,
              ),
              t125,
            ),
            @tactics.strip_tac,
          ),
          t130,
        ),
        t131,
      ),
      t135,
    ),
    t136,
  )
  rational_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x + y)"),
      t137,
    ),
  )
}

///|
let rational_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_ADD")

///|
/// `RATIONAL_ADD`
pub fn rational_add() -> @kernel.Thm {
  rational_add_c.get()
}

///|
/// RATIONAL_SUB
fn step_34() -> Unit raise {
  let t138 = @simp.simp_tac(
    @list.List([@realax.real_sub(), rational_neg(), rational_add()]),
  )
  rational_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x - y)"),
      t138,
    ),
  )
}

///|
let rational_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_SUB")

///|
/// `RATIONAL_SUB`
pub fn rational_sub() -> @kernel.Thm {
  rational_sub_c.get()
}

///|
/// RATIONAL_MUL
fn step_35() -> Unit raise {
  let t155 = @tactics.conv_tac(@calc_rat.real_field)
  let t154 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x151 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s152 = @tactics.mp_tac(x151)
      fn(
        x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s152(x153)
      }
    }),
  )
  let t150 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t148 = @term_syntax.parse_term("(n1 : Real) * (n2 : Real)")
  let t149 = @tactics.map_every(
    fn(
      x145 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s146 = @tactics.exists_tac(x145)
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
    },
    @list.List([@term_syntax.parse_term("(m1 : Real) * (m2 : Real)"), t148]),
  )
  let t141 = @term_syntax.parse_term("(n2 : Real)")
  let t142 = @term_syntax.parse_term("(m2 : Real)")
  let t143 = @term_syntax.parse_term("(n1 : Real)")
  let t144 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m1 : Real)"), t143, t142, t141]),
  )
  let t140 = @simp.rewrite_tac(
    @list.List([
      @theorems.right_and_exists_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t139 = @simp.rewrite_tac(
    @list.List([rational(), @theorems.left_and_exists_thm()]),
  )
  let t156 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t139),
                t140,
              ),
              t144,
            ),
            @tactics.strip_tac,
          ),
          t149,
        ),
        t150,
      ),
      t154,
    ),
    t155,
  )
  rational_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x * y)"),
      t156,
    ),
  )
}

///|
let rational_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_MUL")

///|
/// `RATIONAL_MUL`
pub fn rational_mul() -> @kernel.Thm {
  rational_mul_c.get()
}

///|
/// RATIONAL_DIV
fn step_36() -> Unit raise {
  let t157 = @simp.simp_tac(
    @list.List([@realax.real_div(), rational_inv(), rational_mul()]),
  )
  rational_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x / y)"),
      t157,
    ),
  )
}

///|
let rational_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_DIV")

///|
/// `RATIONAL_DIV`
pub fn rational_div() -> @kernel.Thm {
  rational_div_c.get()
}

///|
/// RATIONAL_POW
fn step_37() -> Unit raise {
  let t158 = @simp.asm_simp_tac(
    @list.List([@realax.real_pow(), rational_num(), rational_mul()]),
  )
  let t159 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t158,
  )
  rational_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, rational(x) → rational(pow(x, n))"),
      t159,
    ),
  )
}

///|
let rational_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_POW")

///|
/// `RATIONAL_POW`
pub fn rational_pow() -> @kernel.Thm {
  rational_pow_c.get()
}

///|
/// RATIONAL_CLOSED
fn step_38() -> Unit raise {
  let t160 = @simp.simp_tac(
    @list.List([
      rational_num(),
      rational_neg(),
      rational_abs(),
      rational_inv(),
      rational_add(),
      rational_sub(),
      rational_mul(),
      rational_div(),
      rational_pow(),
      rational_integer(),
    ]),
  )
  rational_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, rational(real_of_num(n))) && (∀ x : Real, integer(x) → rational(x)) && (∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x + y)) && (∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x - y)) && (∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x * y)) && (∀ x : Real, ∀ y : Real, rational(x) && rational(y) → rational(x / y)) && (∀ x : Real, ∀ r : Num, rational(x) → rational(pow(x, r))) && (∀ x : Real, rational(x) → rational(-x)) && (∀ x : Real, rational(x) → rational(inv(x))) && (∀ x : Real, rational(x) → rational(abs(x)))"),
      t160,
    ),
  )
}

///|
let rational_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_CLOSED",
)

///|
/// `RATIONAL_CLOSED`
pub fn rational_closed() -> @kernel.Thm {
  rational_closed_c.get()
}

///|
/// RATIONAL_NEG_EQ
fn step_39() -> Unit raise {
  let t161 = @meson.meson_tac(
    @list.List([@calc_int.real_neg_neg(), rational_neg()]),
  )
  rational_neg_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, rational(-x) == rational(x)"), t161),
  )
}

///|
let rational_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_NEG_EQ",
)

///|
/// `RATIONAL_NEG_EQ`
pub fn rational_neg_eq() -> @kernel.Thm {
  rational_neg_eq_c.get()
}

///|
/// RATIONAL_ABS_EQ
fn step_40() -> Unit raise {
  let t162 = @meson.meson_tac(@list.List([rational_neg_eq(), rational_num()]))
  let t163 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_abs()])),
    t162,
  )
  rational_abs_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(abs(x)) == rational(x)"),
      t163,
    ),
  )
}

///|
let rational_abs_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_ABS_EQ",
)

///|
/// `RATIONAL_ABS_EQ`
pub fn rational_abs_eq() -> @kernel.Thm {
  rational_abs_eq_c.get()
}

///|
/// RATIONAL_INV_EQ
fn step_41() -> Unit raise {
  let t164 = @meson.meson_tac(
    @list.List([@real.real_inv_inv(), rational_inv()]),
  )
  rational_inv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(inv(x)) == rational(x)"),
      t164,
    ),
  )
}

///|
let rational_inv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_INV_EQ",
)

///|
/// `RATIONAL_INV_EQ`
pub fn rational_inv_eq() -> @kernel.Thm {
  rational_inv_eq_c.get()
}

///|
/// RATIONAL_SUM
fn step_42() -> Unit raise {
  let t166 = @simp.asm_simp_tac(@list.List([rational_closed()]))
  let t165 = @tactics.match_mp_tac(@iterate.sum_closed())
  let t167 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t165),
    t166,
  )
  rational_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, ∀ x : (_) -> Real, (∀ i : _, IN(i, s) → rational(x(i))) → rational(sum(s, x))"),
      t167,
    ),
  )
}

///|
let rational_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_SUM")

///|
/// `RATIONAL_SUM`
pub fn rational_sum() -> @kernel.Thm {
  rational_sum_c.get()
}

///|
/// RATIONAL_ALT
fn step_43() -> Unit raise {
  let t178 = @meson.asm_meson_tac(
    @list.List([integer_closed(), @realax.real_of_num_eq()]),
  )
  let t177 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t176 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_div(), @equal.gsym(@calc_int.real_mul_lneg())]),
  )
  let t173 = @drule.match_mp(
    @calc_rat.real_arith(
      @term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a"),
    ),
  )
  let t174 = @tactics.disj_cases_then(fn(
    x170 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s171 = @tactics.subst1_tac(x170)
    fn(
      x172 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s171(x172)
    }
  })
  let t179 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @tactics.first_x_assum(fn(
            x175 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            t174(t173(x175))
          }),
        ),
        t176,
      ),
      t177,
    ),
    t178,
  )
  let t169 = @meson.asm_meson_tac(
    @list.List([@realax.real_of_num_eq(), @real.real_abs_zero()]),
  )
  let t168 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_div()]))
  let t180 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@int.integer()])),
          @tactics.strip_tac,
        ),
        t168,
      ),
      t169,
    ),
    t179,
  ])
  let t181 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([rational()])),
      ),
      @tactics.eq_tac,
    ),
    t180,
  )
  rational_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, rational(x) == (∃ p : Num, ∃ q : Num, !(q == 0) && abs(x) == real_of_num(p) / real_of_num(q))"),
      t181,
    ),
  )
}

///|
let rational_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_ALT")

///|
/// `RATIONAL_ALT`
pub fn rational_alt() -> @kernel.Thm {
  rational_alt_c.get()
}

///|
/// REAL_TRUNCATE_POS
fn step_44() -> Unit raise {
  let t220 = @simp.rewrite_tac(
    @list.List([@real.real_add_sub(), @equal.gsym(@real.real_of_num_suc())]),
  )
  let t219 = @term_syntax.parse_term("(x : Real) - real_of_num(SUC((n : Num)))")
  let t221 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x216 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s217 = @tactics.exists_tac(x216)
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
        @list.List([@term_syntax.parse_term("SUC((n : Num))"), t219]),
      ),
      t220,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  let t215 = @term_syntax.parse_term("(x : Real) - real_of_num((n : Num))")
  let t222 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x212 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s213 = @tactics.exists_tac(x212)
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
        },
        @list.List([@term_syntax.parse_term("(n : Num)"), t215]),
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t221,
  ])
  let t208 = @simp.rewrite_rule(@list.List([@realarith.real_le_lt()]))
  let t209 = @tactics.disj_cases_then(@tactics.strip_assume_tac)
  let t211 = @tactics.first_x_assum(fn(
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
    t209(t208(x210))
  })
  let t207 = @simp.rewrite_tac(
    @list.List([@arith.le_refl(), @real.real_not_le()]),
  )
  let t203 = @term_syntax.parse_term("(n : Num)")
  let t206 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x197 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s198 = @tactics.assume_tac(x197)
        fn(
          x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      },
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
        (fn(
          x200 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s201 = @tactics.mp_tac(x200)
          fn(
            x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s201(x202)
          }
        })(((x204 : @kernel.Thm) => @bool.spec(t203, x204))(x205))
      },
    ),
  )
  let t196 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_of_num_suc())]),
  )
  let t194 = @tactics.pop_assum_list(fn(
    x193 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t192 = @term_syntax.parse_term("real_of_num(0)")
  let t195 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.map_every(
          fn(
            x189 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s190 = @tactics.exists_tac(x189)
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
              s190(x191)
            }
          },
          @list.List([@term_syntax.parse_term("0"), t192]),
        ),
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t194,
  ])
  let t188 = @simp.rewrite_tac(
    @list.List([@arith.lt_suc_le(), @bool.conjunct1(@arith.lt())]),
  )
  let t187 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t186 = @simp.gen_rewrite_tac(
    fn(
      x183 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s184 = @equal.land_conv(x183)
      fn(x185 : @kernel.Term) -> @kernel.Thm raise { s184(x185) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t182 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), @real.real_arch_simple()),
  )
  let t223 = @tactics.thenl(
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
                          t182,
                        ),
                        t186,
                      ),
                      t187,
                    ),
                    @nums.induct_tac,
                  ),
                  t188,
                ),
                t195,
              ),
              t196,
            ),
            t206,
          ),
          t207,
        ),
        @tactics.disch_tac,
      ),
      t211,
    ),
    t222,
  )
  real_truncate_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → (∃ n : Num, ∃ r : Real, real_of_num(0) <= r && r < real_of_num(1) && x == real_of_num(n) + r)"),
      t223,
    ),
  )
}

///|
let real_truncate_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_TRUNCATE_POS",
)

///|
/// `REAL_TRUNCATE_POS`
pub fn real_truncate_pos() -> @kernel.Thm {
  real_truncate_pos_c.get()
}

///|
/// REAL_TRUNCATE
fn step_45() -> Unit raise {
  let t234 = @meson.asm_meson_tac(
    @list.List([@int.integer(), integer_closed(), real_truncate_pos()]),
  )
  let t232 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((a : Real) + (b : Real) == (c : Real) + (d : Real)) == (a == c - b + d)"),
      ),
    ]),
  )
  let t229 = @drule.match_mp(real_truncate_pos())
  let t231 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(
      x230 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x226 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s227 = @tactics.mp_tac(x226)
        fn(
          x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s227(x228)
        }
      })(t229(x230))
    }),
  )
  let t225 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(-(a : Real) <= (b : Real)) == (real_of_num(0) <= a + b)")),
    ]),
  )
  let t233 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.spec(@term_syntax.parse_term("-(x : Real)"), @real.real_arch_simple()),
          ),
          t225,
        ),
        t231,
      ),
      t232,
    ),
    @tactics.all_tac,
  ])
  let t224 = @term_syntax.parse_term("real_of_num(0)")
  let t235 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.disj_cases_tac(
          @bool.specl(
            @list.List([@term_syntax.parse_term("(x : Real)"), t224]),
            @realax.real_le_total(),
          ),
        ),
      ),
      t233,
    ),
    t234,
  )
  real_truncate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∃ n : Real, ∃ r : Real, integer(n) && real_of_num(0) <= r && r < real_of_num(1) && x == n + r"),
      t235,
    ),
  )
}

///|
let real_truncate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_TRUNCATE")

///|
/// `REAL_TRUNCATE`
pub fn real_truncate() -> @kernel.Thm {
  real_truncate_c.get()
}

///|
/// FLOOR_FRAC
fn step_46() -> Unit raise {
  let t236 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(
    real_truncate(),
  )
  floor_frac_c.set(@nums.new_specification(@list.List(["floor", "frac"]))(t236))
}

///|
let floor_frac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_FRAC")

///|
/// `FLOOR_FRAC`
pub fn floor_frac() -> @kernel.Thm {
  floor_frac_c.get()
}

///|
/// FLOOR_UNIQUE
fn step_47() -> Unit raise {
  let t250 = @simp.simp_tac(@list.List([]))
  let t249 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), floor_frac()),
  )
  let t251 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x248 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
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
            let s246 = @tactics.subst1_tac(x245)
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
          })(@equal.sym(x248))
        }),
        t249,
      ),
      t250,
    ),
    @calc_rat.real_arith_tac,
  )
  let t244 = @list.List([
    @meson.asm_meson_tac(@list.List([integer_closed()])),
    @calc_rat.asm_real_arith_tac,
  ])
  let t243 = @tactics.match_mp_tac(real_abs_integer_lemma())
  let t242 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt()]))
  let t241 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t240 = @tactics.subgoal_then(
    @term_syntax.parse_term("abs(floor((x : Real)) - (a : Real)) < real_of_num(1)"),
    fn(
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
      let s238 = @tactics.mp_tac(x237)
      fn(
        x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s238(x239)
      }
    },
  )
  let t252 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.strip_tac,
                      @tactics.strip_assume_tac(
                        @bool.spec(@term_syntax.parse_term("(x : Real)"), floor_frac()),
                      ),
                    ),
                    t240,
                  ),
                  @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]),
                ),
                t241,
              ),
              @tactics.disch_tac,
            ),
            t242,
          ),
          t243,
        ),
        @tactics.conj_tac,
      ),
      t244,
    ),
    t251,
  ])
  let t253 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t252,
  )
  floor_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ a : Real, (integer(a) && a <= x && x < a + real_of_num(1)) == (floor(x) == a)"),
      t253,
    ),
  )
}

///|
let floor_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_UNIQUE")

///|
/// `FLOOR_UNIQUE`
pub fn floor_unique() -> @kernel.Thm {
  floor_unique_c.get()
}

///|
/// FLOOR_EQ_0
fn step_48() -> Unit raise {
  let t254 = @simp.rewrite_tac(
    @list.List([integer_closed(), @realax.real_add_lid()]),
  )
  let t255 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([@equal.gsym(floor_unique())])),
    ),
    t254,
  )
  floor_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (floor(x) == real_of_num(0)) == (real_of_num(0) <= x && x < real_of_num(1))"),
      t255,
    ),
  )
}

///|
let floor_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_EQ_0")

///|
/// `FLOOR_EQ_0`
pub fn floor_eq_0() -> @kernel.Thm {
  floor_eq_0_c.get()
}

///|
/// FLOOR
fn step_49() -> Unit raise {
  let t263 = @simp.asm_rewrite_tac(@list.List([]))
  let t262 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x256 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s257 = @tactics.assume_tac(x256)
        fn(
          x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s257(x258)
        }
      },
      fn(
        x259 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s260 = @tactics.mp_tac(x259)
        fn(
          x261 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s260(x261)
        }
      },
    ),
  )
  let t264 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.mp_tac(
            @bool.spec(@term_syntax.parse_term("(x : Real)"), floor_frac()),
          ),
        ),
        t262,
      ),
      t263,
    ),
    @calc_rat.real_arith_tac,
  )
  floor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, integer(floor(x)) && floor(x) <= x && x < floor(x) + real_of_num(1)"),
      t264,
    ),
  )
}

///|
let floor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR")

///|
/// `FLOOR`
pub fn floor() -> @kernel.Thm {
  floor_c.get()
}

///|
/// FLOOR_DOUBLE
fn step_50() -> Unit raise {
  let t268 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(2) * (u : Real)"), floor()))
  let t267 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(u : Real)"), floor()))
  let t266 = @simp.simp_tac(@list.List([integer_closed(), floor()]))
  let t265 = @tactics.match_mp_tac(real_le_reverse_integers())
  let t269 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t265),
          t266,
        ),
        t267,
      ),
      t268,
    ),
    @calc_rat.real_arith_tac,
  )
  floor_double_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ u : Real, real_of_num(2) * floor(u) <= floor(real_of_num(2) * u) && floor(real_of_num(2) * u) <= real_of_num(2) * floor(u) + real_of_num(1)"),
      t269,
    ),
  )
}

///|
let floor_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_DOUBLE")

///|
/// `FLOOR_DOUBLE`
pub fn floor_double() -> @kernel.Thm {
  floor_double_c.get()
}

///|
/// FRAC_FLOOR
fn step_51() -> Unit raise {
  let t270 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t271 = @tactics.then_tac(
    @tactics.then_tac(@tactics.mp_tac(floor_frac()), t270),
    @calc_rat.real_arith_tac,
  )
  frac_floor_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, frac(x) == x - floor(x)"), t271),
  )
}

///|
let frac_floor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAC_FLOOR")

///|
/// `FRAC_FLOOR`
pub fn frac_floor() -> @kernel.Thm {
  frac_floor_c.get()
}

///|
/// FLOOR_NUM
fn step_52() -> Unit raise {
  let t272 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(floor_unique()), integer_closed()]),
    ),
    @calc_rat.real_arith_tac,
  )
  floor_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, floor(real_of_num(n)) == real_of_num(n)"), t272),
  )
}

///|
let floor_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_NUM")

///|
/// `FLOOR_NUM`
pub fn floor_num() -> @kernel.Thm {
  floor_num_c.get()
}

///|
/// REAL_LE_FLOOR
fn step_53() -> Unit raise {
  let t276 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), floor()))
  let t275 = @simp.asm_simp_tac(@list.List([real_lt_integers(), floor()]))
  let t274 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_not_lt())]),
  )
  let t273 = @list.List([
    @meson.asm_meson_tac(@list.List([floor(), @realax.real_le_trans()])),
    @tactics.all_tac,
  ])
  let t277 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.strip_tac),
              @tactics.eq_tac,
            ),
            t273,
          ),
          t274,
        ),
        t275,
      ),
      t276,
    ),
    @calc_rat.real_arith_tac,
  )
  real_le_floor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Real, integer(n) → (n <= floor(x)) == (n <= x)"),
      t277,
    ),
  )
}

///|
let real_le_floor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_FLOOR")

///|
/// `REAL_LE_FLOOR`
pub fn real_le_floor() -> @kernel.Thm {
  real_le_floor_c.get()
}

///|
/// REAL_FLOOR_LE
fn step_54() -> Unit raise {
  let t281 = @simp.asm_simp_tac(
    @list.List([@realarith.real_not_lt(), real_le_floor(), integer_closed()]),
  )
  let t280 = @simp.once_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (!p == !q)"))]),
  )
  let t279 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(real_lt_integers()), floor(), integer_closed()]),
  )
  let t278 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real)) == (x + real_of_num(1) <= y + real_of_num(1))")),
    ]),
  )
  let t282 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t278),
          t279,
        ),
        t280,
      ),
      t281,
    ),
    @calc_rat.real_arith_tac,
  )
  real_floor_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Real, integer(n) → (floor(x) <= n) == (x - real_of_num(1) < n)"),
      t282,
    ),
  )
}

///|
let real_floor_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FLOOR_LE")

///|
/// `REAL_FLOOR_LE`
pub fn real_floor_le() -> @kernel.Thm {
  real_floor_le_c.get()
}

///|
/// REAL_FLOOR_LT
fn step_55() -> Unit raise {
  let t283 = @simp.simp_tac(
    @list.List([@equal.gsym(@real.real_not_le()), real_le_floor()]),
  )
  real_floor_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Real, integer(n) → (floor(x) < n) == (x < n)"),
      t283,
    ),
  )
}

///|
let real_floor_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FLOOR_LT")

///|
/// `REAL_FLOOR_LT`
pub fn real_floor_lt() -> @kernel.Thm {
  real_floor_lt_c.get()
}

///|
/// REAL_LT_FLOOR
fn step_56() -> Unit raise {
  let t284 = @simp.simp_tac(
    @list.List([@equal.gsym(@real.real_not_le()), real_floor_le()]),
  )
  real_lt_floor_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Real, integer(n) → (n < floor(x)) == (n <= x - real_of_num(1))"),
      t284,
    ),
  )
}

///|
let real_lt_floor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_FLOOR")

///|
/// `REAL_LT_FLOOR`
pub fn real_lt_floor() -> @kernel.Thm {
  real_lt_floor_c.get()
}

///|
/// FLOOR_POS
fn step_57() -> Unit raise {
  let t287 = @simp.asm_simp_tac(
    @list.List([@realax.real_abs(), real_le_floor(), floor(), integer_closed()]),
  )
  let t286 = @simp.rewrite_tac(@list.List([@int.integer()]))
  let t285 = @tactics.mp_tac(
    @bool.conjunct1(@bool.spec(@term_syntax.parse_term("(x : Real)"), floor())),
  )
  let t288 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t285),
      t286,
    ),
    t287,
  )
  floor_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → (∃ n : Num, floor(x) == real_of_num(n))"),
      t288,
    ),
  )
}

///|
let floor_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_POS")

///|
/// `FLOOR_POS`
pub fn floor_pos() -> @kernel.Thm {
  floor_pos_c.get()
}

///|
/// FLOOR_DIV_DIV
fn step_58() -> Unit raise {
  let t297 = @drule.match_mp(@arith.division())
  let t294 = @term_syntax.parse_term("(n : Num)")
  let t299 = @tactics.first_x_assum(fn(
    x298 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      (fn(
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
      })(((x295 : @kernel.Thm) => @bool.spec(t294, x295))(x296))
    })(t297(x298))
  })
  let t290 = @simp.asm_simp_tac(
    @list.List([
      @real.real_le_rdiv_eq(),
      @real.real_lt_ldiv_eq(),
      @real.real_of_num_lt(),
      @realax.real_of_num_le(),
      @realax.real_of_num_mul(),
      @realax.real_of_num_add(),
      @arith.lt_nz(),
    ]),
  )
  let t289 = @simp.rewrite_tac(
    @list.List([@equal.gsym(floor_unique()), integer_closed()]),
  )
  let t300 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t289),
        t290,
      ),
      t299,
    ),
    @int.arith_tac,
  )
  floor_div_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(m == 0) → floor(real_of_num(n) / real_of_num(m)) == real_of_num(DIV(n, m))"),
      t300,
    ),
  )
}

///|
let floor_div_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_DIV_DIV")

///|
/// `FLOOR_DIV_DIV`
pub fn floor_div_div() -> @kernel.Thm {
  floor_div_div_c.get()
}

///|
/// FLOOR_MONO
fn step_59() -> Unit raise {
  let t310 = @term_syntax.parse_term("(y : Real)")
  let t311 = @tactics.map_every(
    fn(
      x309 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x303 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s304 = @tactics.mp_tac(x303)
        fn(
          x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s304(x305)
        }
      })(
        (fn(x308 : @kernel.Term) -> @kernel.Thm raise {
          (fn(
            x306 : @kernel.Term,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x307 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.spec(x306, x307)
            }
          })(x308)(floor())
        })(x309),
      )
    },
    @list.List([@term_syntax.parse_term("(x : Real)"), t310]),
  )
  let t302 = @simp.simp_tac(@list.List([floor(), real_lt_integers()]))
  let t301 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_not_lt())]),
  )
  let t312 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t301),
        t302,
      ),
      t311,
    ),
    @calc_rat.real_arith_tac,
  )
  floor_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y → floor(x) <= floor(y)"),
      t312,
    ),
  )
}

///|
let floor_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_MONO")

///|
/// `FLOOR_MONO`
pub fn floor_mono() -> @kernel.Thm {
  floor_mono_c.get()
}

///|
/// REAL_FLOOR_EQ
fn step_60() -> Unit raise {
  let t313 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < x + real_of_num(1)"))
  let t314 = @simp.rewrite_tac(
    @list.List([@equal.gsym(floor_unique()), @realax.real_le_refl(), t313]),
  )
  real_floor_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (floor(x) == x) == integer(x)"), t314),
  )
}

///|
let real_floor_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FLOOR_EQ")

///|
/// `REAL_FLOOR_EQ`
pub fn real_floor_eq() -> @kernel.Thm {
  real_floor_eq_c.get()
}

///|
/// REAL_FLOOR_LT_REFL
fn step_61() -> Unit raise {
  let t315 = @meson.meson_tac(
    @list.List([@realarith.real_lt_le(), real_floor_eq(), floor()]),
  )
  real_floor_lt_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (floor(x) < x) == !integer(x)"), t315),
  )
}

///|
let real_floor_lt_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_FLOOR_LT_REFL",
)

///|
/// `REAL_FLOOR_LT_REFL`
pub fn real_floor_lt_refl() -> @kernel.Thm {
  real_floor_lt_refl_c.get()
}

///|
/// REAL_FRAC_EQ_0
fn step_62() -> Unit raise {
  let t316 = @meson.meson_tac(@list.List([real_floor_eq()]))
  let t317 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([frac_floor(), @realarith.real_sub_0()])),
    t316,
  )
  real_frac_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (frac(x) == real_of_num(0)) == integer(x)"), t317),
  )
}

///|
let real_frac_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FRAC_EQ_0")

///|
/// `REAL_FRAC_EQ_0`
pub fn real_frac_eq_0() -> @kernel.Thm {
  real_frac_eq_0_c.get()
}

///|
/// REAL_FRAC_POS_LT
fn step_63() -> Unit raise {
  let t318 = @simp.rewrite_tac(
    @list.List([frac_floor(), @realarith.real_sub_lt(), real_floor_lt_refl()]),
  )
  real_frac_pos_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) < frac(x)) == !integer(x)"), t318),
  )
}

///|
let real_frac_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_FRAC_POS_LT",
)

///|
/// `REAL_FRAC_POS_LT`
pub fn real_frac_pos_lt() -> @kernel.Thm {
  real_frac_pos_lt_c.get()
}

///|
/// FRAC_NUM
fn step_64() -> Unit raise {
  let t319 = @simp.rewrite_tac(@list.List([real_frac_eq_0(), integer_closed()]))
  frac_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, frac(real_of_num(n)) == real_of_num(0)"), t319))
}

///|
let frac_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAC_NUM")

///|
/// `FRAC_NUM`
pub fn frac_num() -> @kernel.Thm {
  frac_num_c.get()
}

///|
/// REAL_FLOOR_REFL
fn step_65() -> Unit raise {
  let t320 = @simp.rewrite_tac(@list.List([real_floor_eq()]))
  real_floor_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(x) → floor(x) == x"), t320),
  )
}

///|
let real_floor_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_FLOOR_REFL",
)

///|
/// `REAL_FLOOR_REFL`
pub fn real_floor_refl() -> @kernel.Thm {
  real_floor_refl_c.get()
}

///|
/// REAL_FRAC_ZERO
fn step_66() -> Unit raise {
  let t321 = @simp.rewrite_tac(@list.List([real_frac_eq_0()]))
  real_frac_zero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, integer(x) → frac(x) == real_of_num(0)"), t321),
  )
}

///|
let real_frac_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FRAC_ZERO")

///|
/// `REAL_FRAC_ZERO`
pub fn real_frac_zero() -> @kernel.Thm {
  real_frac_zero_c.get()
}

///|
/// REAL_FLOOR_ADD
fn step_67() -> Unit raise {
  let t331 = @term_syntax.parse_term("(x : Real) + (y : Real)")
  let t332 = @term_syntax.parse_term("(y : Real)")
  let t333 = @tactics.map_every(
    fn(
      x330 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x324 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s325 = @tactics.mp_tac(x324)
        fn(
          x326 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s325(x326)
        }
      })(
        (fn(x329 : @kernel.Term) -> @kernel.Thm raise {
          (fn(
            x327 : @kernel.Term,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x328 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.spec(x327, x328)
            }
          })(x329)(floor_frac())
        })(x330),
      )
    },
    @list.List([@term_syntax.parse_term("(x : Real)"), t332, t331]),
  )
  let t323 = @list.List([
    @meson.asm_meson_tac(@list.List([integer_closed(), floor()])),
    @tactics.all_tac,
  ])
  let t322 = @simp.rewrite_tac(@list.List([@equal.gsym(floor_unique())]))
  let t334 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t322),
          @tactics.conj_tac,
        ),
        t323,
      ),
      t333,
    ),
    @calc_rat.real_arith_tac,
  )
  real_floor_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, floor(x + y) == (if frac(x) + frac(y) < real_of_num(1) { floor(x) + floor(y) } else { floor(x) + floor(y) + real_of_num(1) })"),
      t334,
    ),
  )
}

///|
let real_floor_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FLOOR_ADD")

///|
/// `REAL_FLOOR_ADD`
pub fn real_floor_add() -> @kernel.Thm {
  real_floor_add_c.get()
}

///|
/// REAL_FLOOR_TRIANGLE
fn step_68() -> Unit raise {
  let t336 = @simp.asm_rewrite_tac(@list.List([]))
  let t335 = @simp.rewrite_tac(@list.List([real_floor_add()]))
  let t337 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t335),
        @class.cond_cases_tac,
      ),
      t336,
    ),
    @calc_rat.real_arith_tac,
  )
  real_floor_triangle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, floor(x) + floor(y) <= floor(x + y) && floor(x + y) <= floor(x) + floor(y) + real_of_num(1)"),
      t337,
    ),
  )
}

///|
let real_floor_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_FLOOR_TRIANGLE",
)

///|
/// `REAL_FLOOR_TRIANGLE`
pub fn real_floor_triangle() -> @kernel.Thm {
  real_floor_triangle_c.get()
}

///|
/// REAL_FLOOR_NEG
fn step_69() -> Unit raise {
  let t341 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t340 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), real_floor_eq()),
  )
  let t339 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), floor()))
  let t338 = @simp.rewrite_tac(@list.List([@equal.gsym(floor_unique())]))
  let t342 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
            t338,
          ),
          t339,
        ),
        t340,
      ),
      t341,
    ),
    @calc_rat.real_arith_tac,
  )
  real_floor_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, floor(-x) == (if integer(x) { -x } else { -(floor(x) + real_of_num(1)) })"),
      t342,
    ),
  )
}

///|
let real_floor_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FLOOR_NEG")

///|
/// `REAL_FLOOR_NEG`
pub fn real_floor_neg() -> @kernel.Thm {
  real_floor_neg_c.get()
}

///|
/// REAL_FRAC_ADD
fn step_70() -> Unit raise {
  let t343 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([frac_floor(), real_floor_add()])),
    @calc_rat.real_arith_tac,
  )
  real_frac_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, frac(x + y) == (if frac(x) + frac(y) < real_of_num(1) { frac(x) + frac(y) } else { frac(x) + frac(y) - real_of_num(1) })"),
      t343,
    ),
  )
}

///|
let real_frac_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FRAC_ADD")

///|
/// `REAL_FRAC_ADD`
pub fn real_frac_add() -> @kernel.Thm {
  real_frac_add_c.get()
}

///|
/// FLOOR_POS_LE
fn step_71() -> Unit raise {
  let t344 = @simp.simp_tac(@list.List([real_le_floor(), integer_closed()]))
  floor_pos_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= floor(x)) == (real_of_num(0) <= x)"), t344),
  )
}

///|
let floor_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOOR_POS_LE")

///|
/// `FLOOR_POS_LE`
pub fn floor_pos_le() -> @kernel.Thm {
  floor_pos_le_c.get()
}

///|
/// FRAC_UNIQUE
fn step_72() -> Unit raise {
  let t346 = @simp.rewrite_tac(@list.List([@equal.gsym(floor_unique())]))
  let t345 = @tactics.repeat_tac(@tactics.gen_tac)
  let t347 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              frac_floor(),
              @calc_rat.real_arith(
                @term_syntax.parse_term("((x : Real) - (f : Real) == (a : Real)) == (f == x - a)"),
              ),
            ]),
          ),
          t345,
        ),
        t346,
      ),
      @tactics.ap_term_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  frac_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ a : Real, (integer(x - a) && real_of_num(0) <= a && a < real_of_num(1)) == (frac(x) == a)"),
      t347,
    ),
  )
}

///|
let frac_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAC_UNIQUE")

///|
/// `FRAC_UNIQUE`
pub fn frac_unique() -> @kernel.Thm {
  frac_unique_c.get()
}

///|
/// REAL_FRAC_EQ
fn step_73() -> Unit raise {
  let t348 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(frac_unique()),
      @real.real_sub_refl(),
      integer_closed(),
    ]),
  )
  real_frac_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (frac(x) == x) == (real_of_num(0) <= x && x < real_of_num(1))"),
      t348,
    ),
  )
}

///|
let real_frac_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_FRAC_EQ")

///|
/// `REAL_FRAC_EQ`
pub fn real_frac_eq() -> @kernel.Thm {
  real_frac_eq_c.get()
}

///|
/// INTEGER_ROUND
fn step_74() -> Unit raise {
  let t351 = @simp.simp_tac(@list.List([integer_closed()]))
  let t350 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real)"), floor()))
  let t349 = @tactics.exists_tac(@term_syntax.parse_term("floor((x : Real))"))
  let t352 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.match_mp_tac(
              @meson.meson(
                @list.List([]),
                @term_syntax.parse_term("∀ a : Real, (P : (Real) -> Bool)(a) || P(a + real_of_num(1)) → (∃ x : Real, P(x))"),
              ),
            ),
          ),
          t349,
        ),
        t350,
      ),
      t351,
    ),
    @calc_rat.real_arith_tac,
  )
  integer_round_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∃ n : Real, integer(n) && abs(x - n) <= real_of_num(1) / real_of_num(2)"),
      t352,
    ),
  )
}

///|
let integer_round_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_ROUND")

///|
/// `INTEGER_ROUND`
pub fn integer_round() -> @kernel.Thm {
  integer_round_c.get()
}

///|
/// FRAC_DIV_MOD
fn step_75() -> Unit raise {
  let t377 = @calc_rat.real_field(
    @term_syntax.parse_term("!((n : Real) == real_of_num(0)) → (x : Real) * n / n == x"),
  )
  let t378 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@realax.real_of_num_mul()),
      @realax.real_of_num_eq(),
      integer_closed(),
      t377,
    ]),
  )
  let t376 = @simp.simp_tac(
    @list.List([
      @real.real_of_num_sub(),
      @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add()),
      @arith.add_sub(),
    ]),
  )
  let t375 = @tactics.disch_then(fn(
    x358 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x358
    @simp.gen_rewrite_tac(
      fn(
        x374 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x370 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x366 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            (fn(
              x360 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s361 = @equal.rand_conv(x360)
              fn(x362 : @kernel.Term) -> @kernel.Thm raise { s361(x362) }
            })(
              (fn(
                x363 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s364 = @equal.land_conv(x363)
                fn(x365 : @kernel.Term) -> @kernel.Thm raise { s364(x365) }
              })(x366),
            )
          })(
            (fn(
              x367 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s368 = @equal.land_conv(x367)
              fn(x369 : @kernel.Term) -> @kernel.Thm raise { s368(x369) }
            })(x370),
          )
        })(
          (fn(
            x371 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s372 = @equal.rand_conv(x371)
            fn(x373 : @kernel.Term) -> @kernel.Thm raise { s372(x373) }
          })(x374),
        )
      },
      @list.List([@bool.conjunct1(th)]),
    )
  })
  let t357 = @simp.asm_simp_tac(
    @list.List([@real.real_of_num_lt(), @realax.real_mul_lid()]),
  )
  let t355 = @term_syntax.parse_term("(n : Num)")
  let t356 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t355]),
      @arith.division(),
    ),
  )
  let t354 = @simp.asm_simp_tac(
    @list.List([
      @real.real_le_div(),
      @realarith.real_pos(),
      @real.real_lt_ldiv_eq(),
      @real.real_of_num_lt(),
      @arith.le_1(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("(x : Real) / (a : Real) - (y : Real) / a == (x - y) / a"),
      ),
    ]),
  )
  let t353 = @simp.rewrite_tac(@list.List([@equal.gsym(frac_unique())]))
  let t379 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t353),
              t354,
            ),
            t356,
          ),
          t357,
        ),
        t375,
      ),
      t376,
    ),
    t378,
  )
  frac_div_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) → frac(real_of_num(m) / real_of_num(n)) == real_of_num(MOD(m, n)) / real_of_num(n)"),
      t379,
    ),
  )
}

///|
let frac_div_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAC_DIV_MOD")

///|
/// `FRAC_DIV_MOD`
pub fn frac_div_mod() -> @kernel.Thm {
  frac_div_mod_c.get()
}

///|
/// FRAC_NEG
fn step_76() -> Unit raise {
  let t380 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([frac_floor(), real_floor_neg()])),
      ),
      @class.cond_cases_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  frac_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, frac(-x) == (if integer(x) { real_of_num(0) } else { real_of_num(1) - frac(x) })"),
      t380,
    ),
  )
}

///|
let frac_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAC_NEG")

///|
/// `FRAC_NEG`
pub fn frac_neg() -> @kernel.Thm {
  frac_neg_c.get()
}

///|
/// REAL_FLOOR_FLOOR_DIV
fn step_77() -> Unit raise {
  let t387 = @equal.gsym(@real.real_le_rdiv_eq())
  let t388 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@real.real_lt_ldiv_eq()),
      t387,
      @real.real_of_num_lt(),
      @arith.le_1(),
      floor(),
    ]),
  )
  let t386 = @simp.simp_tac(
    @list.List([real_floor_lt(), real_le_floor(), floor(), integer_closed()]),
  )
  let t385 = @simp.asm_simp_tac(
    @list.List([
      @real.real_lt_ldiv_eq(),
      @real.real_le_rdiv_eq(),
      @real.real_of_num_lt(),
      @arith.le_1(),
    ]),
  )
  let t383 = @equal.gsym(floor_unique())
  let t384 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_div()), t383, floor()]),
  )
  let t382 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realax.real_inv_0(),
      @calc_int.real_mul_rzero(),
    ]),
  )
  let t381 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t389 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t381),
            t382,
          ),
          t384,
        ),
        t385,
      ),
      t386,
    ),
    t388,
  )
  real_floor_floor_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, floor(floor(x) / real_of_num(n)) == floor(x / real_of_num(n))"),
      t389,
    ),
  )
}

///|
let real_floor_floor_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_FLOOR_FLOOR_DIV",
)

///|
/// `REAL_FLOOR_FLOOR_DIV`
pub fn real_floor_floor_div() -> @kernel.Thm {
  real_floor_floor_div_c.get()
}

///|
/// INTEGER_EXISTS_BETWEEN_ALT
fn step_78() -> Unit raise {
  let t392 = @simp.simp_tac(@list.List([]))
  let t391 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : Real)"), floor()))
  let t390 = @tactics.exists_tac(@term_syntax.parse_term("floor((y : Real))"))
  let t393 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t390),
        t391,
      ),
      t392,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  integer_exists_between_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x + real_of_num(1) <= y → (∃ n : Real, integer(n) && x < n && n <= y)"),
      t393,
    ),
  )
}

///|
let integer_exists_between_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_EXISTS_BETWEEN_ALT",
)

///|
/// `INTEGER_EXISTS_BETWEEN_ALT`
pub fn integer_exists_between_alt() -> @kernel.Thm {
  integer_exists_between_alt_c.get()
}

///|
/// INTEGER_EXISTS_BETWEEN_LT
fn step_79() -> Unit raise {
  let t406 = @meson.asm_meson_tac(@list.List([]))
  let t405 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t404 = @tactics.repeat_tac(@tactics.strip_tac)
  let t403 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t401 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t399 = @drule.match_mp(integer_exists_between_alt())
  let t407 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_assum(fn(
            x402 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x400 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
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
              })(t399(x400))
            })(t401(x402))
          }),
          t403,
        ),
        t404,
      ),
      t405,
    ),
    t406,
  )
  let t395 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t408 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(y : Real) - real_of_num(1)")),
        t395,
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t407,
  ])
  let t394 = @class.asm_cases_tac(@term_syntax.parse_term("integer((y : Real))"))
  let t409 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t394),
    t408,
  )
  integer_exists_between_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x + real_of_num(1) < y → (∃ n : Real, integer(n) && x < n && n < y)"),
      t409,
    ),
  )
}

///|
let integer_exists_between_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_EXISTS_BETWEEN_LT",
)

///|
/// `INTEGER_EXISTS_BETWEEN_LT`
pub fn integer_exists_between_lt() -> @kernel.Thm {
  integer_exists_between_lt_c.get()
}

///|
/// INTEGER_EXISTS_BETWEEN
fn step_80() -> Unit raise {
  let t420 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @meson.asm_meson_tac(@list.List([])),
  ])
  let t419 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t418 = @tactics.repeat_tac(@tactics.strip_tac)
  let t417 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t415 = @drule.match_mp(integer_exists_between_alt())
  let t421 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_assum(fn(
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
            (fn(
              x412 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s413 = @tactics.mp_tac(x412)
              fn(
                x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s413(x414)
              }
            })(t415(x416))
          }),
          t417,
        ),
        t418,
      ),
      t419,
    ),
    t420,
  )
  let t411 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t422 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(y : Real) - real_of_num(1)")),
        t411,
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t421,
  ])
  let t410 = @class.asm_cases_tac(@term_syntax.parse_term("integer((y : Real))"))
  let t423 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t410),
    t422,
  )
  integer_exists_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x + real_of_num(1) <= y → (∃ n : Real, integer(n) && x <= n && n < y)"),
      t423,
    ),
  )
}

///|
let integer_exists_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_EXISTS_BETWEEN",
)

///|
/// `INTEGER_EXISTS_BETWEEN`
pub fn integer_exists_between() -> @kernel.Thm {
  integer_exists_between_c.get()
}

///|
/// INTEGER_EXISTS_BETWEEN_ABS
fn step_81() -> Unit raise {
  let t432 = @simp.asm_rewrite_tac(@list.List([]))
  let t431 = @tactics.repeat_tac(@tactics.strip_tac)
  let t430 = @tactics.thenl(
    @tactics.ants_tac,
    @list.List([
      @calc_rat.asm_real_arith_tac,
      @tactics.match_mp_tac(@theorems.mono_exists()),
    ]),
  )
  let t427 = @term_syntax.parse_term("(y : Real)")
  let t428 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t427]),
      integer_exists_between(),
    ),
  )
  let t426 = @term_syntax.parse_term("(x : Real)")
  let t429 = @list.List([
    @tactics.mp_tac(
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(y : Real)"), t426]),
        integer_exists_between(),
      ),
    ),
    t428,
  ])
  let t425 = @simp.asm_rewrite_tac(@list.List([]))
  let t424 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t433 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t424),
                @class.cond_cases_tac,
              ),
              t425,
            ),
            @tactics.disch_tac,
          ),
          t429,
        ),
        t430,
      ),
      t431,
    ),
    t432,
  )
  integer_exists_between_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(1) <= abs(x - y) → (∃ n : Real, integer(n) && (x <= n && n < y || y <= n && n < x))"),
      t433,
    ),
  )
}

///|
let integer_exists_between_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_EXISTS_BETWEEN_ABS",
)

///|
/// `INTEGER_EXISTS_BETWEEN_ABS`
pub fn integer_exists_between_abs() -> @kernel.Thm {
  integer_exists_between_abs_c.get()
}

///|
/// INTEGER_EXISTS_BETWEEN_ABS_LT
fn step_82() -> Unit raise {
  let t442 = @simp.asm_rewrite_tac(@list.List([]))
  let t441 = @tactics.repeat_tac(@tactics.strip_tac)
  let t440 = @tactics.thenl(
    @tactics.ants_tac,
    @list.List([
      @calc_rat.asm_real_arith_tac,
      @tactics.match_mp_tac(@theorems.mono_exists()),
    ]),
  )
  let t437 = @term_syntax.parse_term("(y : Real)")
  let t438 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t437]),
      integer_exists_between_lt(),
    ),
  )
  let t436 = @term_syntax.parse_term("(x : Real)")
  let t439 = @list.List([
    @tactics.mp_tac(
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(y : Real)"), t436]),
        integer_exists_between_lt(),
      ),
    ),
    t438,
  ])
  let t435 = @simp.asm_rewrite_tac(@list.List([]))
  let t434 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t443 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t434),
                @class.cond_cases_tac,
              ),
              t435,
            ),
            @tactics.disch_tac,
          ),
          t439,
        ),
        t440,
      ),
      t441,
    ),
    t442,
  )
  integer_exists_between_abs_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(1) < abs(x - y) → (∃ n : Real, integer(n) && (x < n && n < y || y < n && n < x))"),
      t443,
    ),
  )
}

///|
let integer_exists_between_abs_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_EXISTS_BETWEEN_ABS_LT",
)

///|
/// `INTEGER_EXISTS_BETWEEN_ABS_LT`
pub fn integer_exists_between_abs_lt() -> @kernel.Thm {
  integer_exists_between_abs_lt_c.get()
}

///|
/// REAL_OF_INT_OF_REAL
fn step_83() -> Unit raise {
  let t444 = @simp.simp_tac(@list.List([@int.int_rep()]))
  real_of_int_of_real_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, integer(x) → real_of_int(int_of_real(x)) == x"),
      t444,
    ),
  )
}

///|
let real_of_int_of_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_INT_OF_REAL",
)

///|
/// `REAL_OF_INT_OF_REAL`
pub fn real_of_int_of_real() -> @kernel.Thm {
  real_of_int_of_real_c.get()
}

///|
/// IMAGE_REAL_OF_INT_UNIV
fn step_84() -> Unit raise {
  let t446 = @meson.meson_tac(@list.List([@int.int_tybij()]))
  let t445 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t447 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@sets.extension(), @sets.in_image(), @sets.in_univ()]),
      ),
      t445,
    ),
    t446,
  )
  image_real_of_int_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("IMAGE(real_of_int, UNIV) == integer"),
      t447,
    ),
  )
}

///|
let image_real_of_int_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_REAL_OF_INT_UNIV",
)

///|
/// `IMAGE_REAL_OF_INT_UNIV`
pub fn image_real_of_int_univ() -> @kernel.Thm {
  image_real_of_int_univ_c.get()
}

///|
/// HAS_SIZE_INTSEG_NUM
fn step_85() -> Unit raise {
  let t462 = @simp.simp_tac(@list.List([@realax.real_of_num_eq()]))
  let t461 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg()]))
  let t463 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), t461),
    t462,
  )
  let t459 = @meson.asm_meson_tac(
    @list.List([
      integer_pos(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) <= (x : Real) → real_of_num(0) <= x")),
    ]),
  )
  let t458 = @simp.rewrite_tac(
    @list.List([@theorems.unwind_thm1(), @iterate.in_numseg()]),
  )
  let t457 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_le(),
      integer_closed(),
      @realax.real_of_num_eq(),
    ]),
  )
  let t460 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(
          @tactics.choose_then(fn(
            x454 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s455 = @tactics.subst_all_tac(x454)
            fn(
              x456 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s455(x456)
            }
          }),
        ),
        t457,
      ),
      t458,
    ),
    t459,
  ])
  let t453 = @class.asm_cases_tac(@term_syntax.parse_term("∃ k : Num, (x : Real) == real_of_num(k)"))
  let t452 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t464 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @sets.extension(),
              @sets.in_image(),
              @sets.in_elim_thm(),
            ]),
          ),
          t452,
        ),
        t453,
      ),
      t460,
    ),
    t463,
  ])
  let t451 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : Real) | integer(x) && real_of_num((m : Num)) <= x && x <= real_of_num((n : Num))} == IMAGE(real_of_num, op_dot_dot(m, n))"),
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
      let s449 = @tactics.subst1_tac(x448)
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
  )
  let t465 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t451),
    t464,
  )
  has_size_intseg_num_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, HAS_SIZE({(x : Real) | integer(x) && real_of_num(m) <= x && x <= real_of_num(n)}, n + 1 - m)"),
      t465,
    ),
  )
}

///|
let has_size_intseg_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_INTSEG_NUM",
)

///|
/// `HAS_SIZE_INTSEG_NUM`
pub fn has_size_intseg_num() -> @kernel.Thm {
  has_size_intseg_num_c.get()
}

///|
/// FINITE_INTSEG
fn step_86() -> Unit raise {
  let t483 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_le())]),
  )
  let t482 = @simp.rewrite_tac(
    @list.List([@theorems.unwind_thm1(), @iterate.in_numseg()]),
  )
  let t481 = @simp.rewrite_tac(
    @list.List([
      @sets.in_union(),
      @sets.in_image(),
      @realax.real_of_num_eq(),
      @real.real_eq_neg2(),
    ]),
  )
  let t480 = @tactics.first_x_assum(fn(
    x477 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s478 = @tactics.subst_all_tac(x477)
    fn(
      x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s478(x479)
    }
  })
  let t476 = @tactics.repeat_tac(@tactics.strip_tac)
  let t475 = @simp.rewrite_tac(
    @list.List([integer_cases(), @sets.subset(), @sets.in_elim_thm()]),
  )
  let t474 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_union(),
      @sets.finite_image(),
      @iterate.finite_numseg(),
    ]),
  )
  let t473 = @tactics.exists_tac(
    @term_syntax.parse_term("UNION(IMAGE((x : Num) => real_of_num(x), op_dot_dot(0, (n : Num))), IMAGE((x : Num) => -real_of_num(x), op_dot_dot(0, n)))"),
  )
  let t472 = @tactics.match_mp_tac(@sets.finite_subset())
  let t471 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])),
      @calc_rat.asm_real_arith_tac,
    ),
  ])
  let t470 = @tactics.exists_tac(
    @term_syntax.parse_term("{(x : Real) | integer(x) && abs(x) <= real_of_num((n : Num))}"),
  )
  let t469 = @tactics.match_mp_tac(@sets.finite_subset())
  let t468 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t467 = @simp.rewrite_tac(
    @list.List([@real.real_max_le(), @theorems.left_imp_exists_thm()]),
  )
  let t466 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("max(abs((a : Real)), abs((b : Real)))"),
      @real.real_arch_simple(),
    ),
  )
  let t484 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.strip_tac),
                                      t466,
                                    ),
                                    t467,
                                  ),
                                  t468,
                                ),
                                @tactics.strip_tac,
                              ),
                              t469,
                            ),
                            t470,
                          ),
                          @tactics.conj_tac,
                        ),
                        t471,
                      ),
                      t472,
                    ),
                    t473,
                  ),
                  t474,
                ),
                t475,
              ),
              t476,
            ),
            t480,
          ),
          t481,
        ),
        t482,
      ),
      t483,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  finite_intseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, FINITE({(x : Real) | integer(x) && a <= x && x <= b})"),
      t484,
    ),
  )
}

///|
let finite_intseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INTSEG")

///|
/// `FINITE_INTSEG`
pub fn finite_intseg() -> @kernel.Thm {
  finite_intseg_c.get()
}

///|
/// HAS_SIZE_INTSEG_INT
fn step_87() -> Unit raise {
  let t500 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_add(),
      @realax.real_of_num_le(),
      @equal.gsym(@int.int_of_num()),
      @int.num_of_int_of_num(),
      @sets.has_size_numseg_le(),
    ]),
  )
  let t501 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        integer_pos(),
        integer_closed(),
        @realarith.real_not_lt(),
        @realarith.real_sub_le(),
      ]),
    ),
    t500,
  ])
  let t499 = @tactics.choose_then(fn(
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
  })
  let t502 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, (b : Real) - (a : Real) == real_of_num(m)"), t499),
    t501,
  )
  let t495 = @simp.rewrite_tac(
    @list.List([@sets.has_size_0(), @sets.empty_gspec()]),
  )
  let t503 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @calc_rat.real_arith(@term_syntax.parse_term("(b : Real) < (a : Real) → !(real_of_num((n : Num)) <= b - a)")),
        ]),
      ),
      t495,
    ),
    t502,
  ])
  let t494 = @simp.simp_tac(
    @list.List([@calc_int.real_eq_add_lcancel(), @realax.real_of_num_eq()]),
  )
  let t504 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), t494),
      @class.cond_cases_tac,
    ),
    t503,
  )
  let t493 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(integer_pos()),
      @realarith.real_sub_le(),
      integer_closed(),
    ]),
  )
  let t492 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (x : Real) == (y : Real)) == (y - a == x)")),
    ]),
  )
  let t491 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t490 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), integer_closed()]),
  )
  let t489 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t505 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t489),
                  t490,
                ),
                @tactics.conj_tac,
              ),
              @list.List([@tactics.all_tac, @calc_rat.real_arith_tac]),
            ),
            t491,
          ),
          @tactics.strip_tac,
        ),
        t492,
      ),
      t493,
    ),
    t504,
  ])
  let t488 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : Real) | integer(x) && (a : Real) <= x && x <= (b : Real)} == IMAGE((n : Num) => a + real_of_num(n), {(n : Num) | real_of_num(n) <= b - a})"),
    fn(
      x485 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s486 = @tactics.subst1_tac(x485)
      fn(
        x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s486(x487)
      }
    },
  )
  let t506 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t488),
    t505,
  )
  has_size_intseg_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, integer(a) && integer(b) → HAS_SIZE({(x : Real) | integer(x) && a <= x && x <= b}, if b < a { 0 } else { num_of_int(int_of_real(b - a + real_of_num(1))) })"),
      t506,
    ),
  )
}

///|
let has_size_intseg_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_INTSEG_INT",
)

///|
/// `HAS_SIZE_INTSEG_INT`
pub fn has_size_intseg_int() -> @kernel.Thm {
  has_size_intseg_int_c.get()
}

///|
/// CARD_INTSEG_INT
fn step_88() -> Unit raise {
  let t513 = @simp.simp_tac(@list.List([@sets.has_size()]))
  let t510 = @drule.match_mp(has_size_intseg_int())
  let t512 = @tactics.disch_then(fn(
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
    (fn(
      x507 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s508 = @tactics.mp_tac(x507)
      fn(
        x509 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s508(x509)
      }
    })(t510(x511))
  })
  let t514 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t512),
    t513,
  )
  card_intseg_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, integer(a) && integer(b) → CARD({(x : Real) | integer(x) && a <= x && x <= b}) == (if b < a { 0 } else { num_of_int(int_of_real(b - a + real_of_num(1))) })"),
      t514,
    ),
  )
}

///|
let card_intseg_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_INTSEG_INT",
)

///|
/// `CARD_INTSEG_INT`
pub fn card_intseg_int() -> @kernel.Thm {
  card_intseg_int_c.get()
}

///|
/// REAL_CARD_INTSEG_INT
fn step_89() -> Unit raise {
  let t540 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t539 = @tactics.match_mp_tac(real_of_int_of_real())
  let t541 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
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
        let s537 = @tactics.subst1_tac(x536)
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
      t539,
    ),
    t540,
  )
  let t542 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @int.int_le(),
          @int.int_of_num_th(),
          real_of_int_of_real(),
          integer_closed(),
        ]),
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t541,
  ])
  let t529 = @drule.part_match(
    fn(x528 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(@kernel.rand(x528))
    },
    @int.int_of_num_of_int(),
  )
  let t524 = @simp.gen_rewrite_tac(
    fn(
      x523 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x517 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s518 = @equal.land_conv(x517)
        fn(x519 : @kernel.Term) -> @kernel.Thm raise { s518(x519) }
      })(
        (fn(
          x520 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s521 = @equal.once_depth_conv(x520)
          fn(x522 : @kernel.Term) -> @kernel.Thm raise { s521(x522) }
        })(x523),
      )
    },
    @list.List([@equal.gsym(@int.int_of_num_th())]),
  )
  let t516 = @simp.asm_simp_tac(@list.List([real_of_int_of_real()]))
  let t515 = @simp.asm_simp_tac(@list.List([card_intseg_int()]))
  let t543 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t515),
              @class.cond_cases_tac,
            ),
            t516,
          ),
          t524,
        ),
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
          (fn(
            x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x532 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x531 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x530 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
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
                      s526(x527)
                    }
                  })(t529(x530))
                })(@kernel.rand(x531))
              })(@equal.lhand(x532))
            })(
              (fn(
                x533 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x533.1
              })(x534),
            )
          })(x535)(x535)
        },
      ),
      @tactics.ants_tac,
    ),
    t542,
  )
  real_card_intseg_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, integer(a) && integer(b) → real_of_num(CARD({(x : Real) | integer(x) && a <= x && x <= b})) == (if b < a { real_of_num(0) } else { b - a + real_of_num(1) })"),
      t543,
    ),
  )
}

///|
let real_card_intseg_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CARD_INTSEG_INT",
)

///|
/// `REAL_CARD_INTSEG_INT`
pub fn real_card_intseg_int() -> @kernel.Thm {
  real_card_intseg_int_c.get()
}

///|
/// INFINITE_INTEGER
fn step_90() -> Unit raise {
  let t551 = @simp.rewrite_tac(@list.List([@sets.in_(), integer_closed()]))
  let t550 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_univ()]),
  )
  let t549 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.finite_subset(),
    ),
  )
  let t548 = @simp.rewrite_tac(
    @list.List([@sets.infinite(), @class.contrapos_thm()]),
  )
  let t547 = @list.List([
    @simp.simp_tac(
      @list.List([
        @sets.infinite_image_inj(),
        @realax.real_of_num_eq(),
        @sets.num_infinite(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t552 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("INFINITE(IMAGE(real_of_num, UNIV))"),
              fn(
                x544 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s545 = @tactics.mp_tac(x544)
                fn(
                  x546 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s545(x546)
                }
              },
            ),
            t547,
          ),
          t548,
        ),
        t549,
      ),
      t550,
    ),
    t551,
  )
  infinite_integer_c.set(
    @tactics.prove(@term_syntax.parse_term("INFINITE(integer)"), t552),
  )
}

///|
let infinite_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_INTEGER",
)

///|
/// `INFINITE_INTEGER`
pub fn infinite_integer() -> @kernel.Thm {
  infinite_integer_c.get()
}

///|
/// INFINITE_RATIONAL
fn step_91() -> Unit raise {
  let t555 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_(), rational_integer()]),
  )
  let t554 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.finite_subset(),
    ),
  )
  let t553 = @simp.rewrite_tac(
    @list.List([@sets.infinite(), @class.contrapos_thm()]),
  )
  let t556 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.mp_tac(infinite_integer()), t553),
      t554,
    ),
    t555,
  )
  infinite_rational_c.set(
    @tactics.prove(@term_syntax.parse_term("INFINITE(rational)"), t556),
  )
}

///|
let infinite_rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_RATIONAL",
)

///|
/// `INFINITE_RATIONAL`
pub fn infinite_rational() -> @kernel.Thm {
  infinite_rational_c.get()
}

///|
/// PADIC_RATIONAL_APPROXIMATION_STRADDLE
fn step_92() -> Unit raise {
  let t581 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("pow((p : Real), (n : Num)) * (x : Real)"), floor()),
  )
  let t580 = @simp.asm_simp_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → abs(p) == p")),
    ]),
  )
  let t579 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_div(),
      @real.real_abs_pow(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t578 = @simp.asm_simp_tac(
    @list.List([
      floor(),
      integer_closed(),
      @real.real_lt_ldiv_eq(),
      @real.real_lt_rdiv_eq(),
      @real.real_pow_lt(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) < p")),
    ]),
  )
  let t577 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("abs(((x : Real) - real_of_num(1)) / (p : Real) - (x + real_of_num(1)) / p) == abs(real_of_num(2) / p)"),
      ),
    ]),
  )
  let t575 = @term_syntax.parse_term("floor(pow((p : Real), (n : Num)) * (x : Real)) + real_of_num(1)")
  let t576 = @tactics.map_every(
    fn(
      x572 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s573 = @tactics.exists_tac(x572)
      fn(
        x574 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s573(x574)
      }
    },
    @list.List([@term_syntax.parse_term("floor(pow((p : Real), (n : Num)) * (x : Real)) - real_of_num(1)"), t575]),
  )
  let t570 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) < p"))
  let t571 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@real.real_lt_ldiv_eq()), @real.real_pow_lt(), t570]),
  )
  let t569 = @simp.gen_rewrite_tac(
    fn(
      x568 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x562 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s563 = @equal.land_conv(x562)
        fn(x564 : @kernel.Term) -> @kernel.Thm raise { s563(x564) }
      })(
        (fn(
          x565 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s566 = @equal.rand_conv(x565)
          fn(x567 : @kernel.Term) -> @kernel.Thm raise { s566(x567) }
        })(x568),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t561 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t560 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t559 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq()]))
  let t557 = @term_syntax.parse_term("real_of_num(2) / (e : Real)")
  let t558 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Real)"), t557]),
      @real.real_arch_pow(),
    ),
  )
  let t582 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
                              t558,
                            ),
                            t559,
                          ),
                          t560,
                        ),
                        t561,
                      ),
                      t569,
                    ),
                    t571,
                  ),
                  @tactics.disch_tac,
                ),
                t576,
              ),
              t577,
            ),
            t578,
          ),
          t579,
        ),
        t580,
      ),
      t581,
    ),
    @calc_rat.real_arith_tac,
  )
  padic_rational_approximation_straddle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Real, ∀ x : Real, ∀ e : Real, real_of_num(0) < e && real_of_num(1) < p → (∃ n : Num, ∃ q : Real, ∃ r : Real, integer(q) && integer(r) && q / pow(p, n) < x && x < r / pow(p, n) && abs(q / pow(p, n) - r / pow(p, n)) < e)"),
      t582,
    ),
  )
}

///|
let padic_rational_approximation_straddle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PADIC_RATIONAL_APPROXIMATION_STRADDLE",
)

///|
/// `PADIC_RATIONAL_APPROXIMATION_STRADDLE`
pub fn padic_rational_approximation_straddle() -> @kernel.Thm {
  padic_rational_approximation_straddle_c.get()
}

///|
let padic_rational_approximation_straddle_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS",
)

///|
/// `PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS`
pub fn padic_rational_approximation_straddle_pos() -> @kernel.Thm {
  padic_rational_approximation_straddle_pos_c.get()
}

///|
let padic_rational_approximation_straddle_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS_LE",
)

///|
/// `PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS_LE`
pub fn padic_rational_approximation_straddle_pos_le() -> @kernel.Thm {
  padic_rational_approximation_straddle_pos_le_c.get()
}

///|
/// PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS, PADIC_RATIONAL_APPROXIMATION_STRADDLE_POS_LE
fn step_93() -> Unit raise {
  let t629 = @simp.asm_simp_tac(
    @list.List([@real.real_lt_inv_eq(), @real.real_pow_lt()]),
  )
  let t628 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t627 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @calc_int.real_mul_lzero(),
      @equal.gsym(@calc_int.real_mul_lneg()),
    ]),
  )
  let t626 = @simp.asm_simp_tac(
    @list.List([@real.real_lt_div(), @real.real_pow_lt()]),
  )
  let t623 = @drule.match_mp(
    @calc_rat.real_arith(
      @term_syntax.parse_term("abs((q : Real) - (r : Real)) < (e : Real) → real_of_num(0) < -q && (z : Real) == real_of_num(0) && real_of_num(0) < r → abs(z - r) < e"),
    ),
  )
  let t625 = @tactics.first_x_assum(fn(
    x624 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t623(x624))
  })
  let t622 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_le_mul(),
      @real.real_lt_mul(),
      @real.real_pow_le(),
      @real.real_pow_lt(),
    ]),
  )
  let t621 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t620 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("max((q : Real), real_of_num(0)) == (if real_of_num(0) <= q { q } else { real_of_num(0) })"),
      ),
    ]),
  )
  let t619 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
        let s616 = @tactics.subst1_tac(x615)
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
      })(@equal.sym(x618))
    }),
  )
  let t613 = @simp.asm_simp_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (r : Real) → abs(r) == r")),
    ]),
  )
  let t612 = @tactics.match_mp_tac(@real.real_pow_le())
  let t611 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t610 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t608 = @drule.match_mp(
    @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (r : Real) → real_of_num(0) <= a → real_of_num(0) < r")),
  )
  let t614 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_x_assum(fn(
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
              @tactics.match_mp_tac(t608(x609))
            }),
            t610,
          ),
          t611,
        ),
        t612,
      ),
      @calc_rat.asm_real_arith_tac,
    ),
    t613,
  ])
  let t607 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (r : Real)"), fn(
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
    let s605 = @tactics.assume_tac(x604)
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
  })
  let t603 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("abs(max((q : Real), real_of_num(0))) == max(q, real_of_num(0))")),
    ]),
  )
  let t602 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Num)"))
  let t601 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t600 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t599 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t598 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t597 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @theorems.left_and_exists_thm()]),
  )
  let t596 = @simp.asm_simp_tac(@list.List([integer_closed()]))
  let t595 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("max((q : Real), real_of_num(0))"), @int.integer()),
  )
  let t594 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(r : Real)"), @int.integer()),
  )
  let t592 = @term_syntax.parse_term("(r : Real)")
  let t593 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q : Real)"), t592]),
  )
  let t591 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t590 = @simp.asm_simp_tac(
    @list.List([
      @real.real_lt_ldiv_eq(),
      @real.real_lt_rdiv_eq(),
      @real.real_pow_lt(),
      @real.real_le_ldiv_eq(),
      @real.real_le_rdiv_eq(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t589 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t588 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t587 = @simp.asm_rewrite_tac(@list.List([]))
  let t584 = @term_syntax.parse_term("(e : Real)")
  let t585 = @term_syntax.parse_term("(x : Real)")
  let t586 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Real)"), t585, t584]),
      padic_rational_approximation_straddle(),
    ),
  )
  let t630 = @tactics.then_tac(
    @tactics.then_tac(
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
                                                                @tactics.thenl(
                                                                  @tactics.subgoal_then(
                                                                    @term_syntax.parse_term("real_of_num(0) < (p : Real) && real_of_num(0) <= p"),
                                                                    @tactics.strip_assume_tac,
                                                                  ),
                                                                  @list.List([
                                                                    @calc_rat.asm_real_arith_tac,
                                                                    @tactics.all_tac,
                                                                  ]),
                                                                ),
                                                                t586,
                                                              ),
                                                              t587,
                                                            ),
                                                            t588,
                                                          ),
                                                          t589,
                                                        ),
                                                        t590,
                                                      ),
                                                      t591,
                                                    ),
                                                    t593,
                                                  ),
                                                  @tactics.strip_tac,
                                                ),
                                                t594,
                                              ),
                                              t595,
                                            ),
                                            t596,
                                          ),
                                          t597,
                                        ),
                                        t598,
                                      ),
                                      t599,
                                    ),
                                    t600,
                                  ),
                                  t601,
                                ),
                                t602,
                              ),
                              t603,
                            ),
                            t607,
                          ),
                          t614,
                        ),
                        t619,
                      ),
                      t620,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t621,
                ),
                t622,
              ),
              t625,
            ),
            t626,
          ),
          t627,
        ),
        t628,
      ),
      t629,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  let t631 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t630)
  let t632 = (
    @term_syntax.parse_term("(∀ p : Real, ∀ x : Real, ∀ e : Real, real_of_num(0) < e && real_of_num(1) < p && real_of_num(0) < x → (∃ n : Num, ∃ q : Num, ∃ r : Num, real_of_num(q) / pow(p, n) < x && x < real_of_num(r) / pow(p, n) && abs(real_of_num(q) / pow(p, n) - real_of_num(r) / pow(p, n)) < e)) && (∀ p : Real, ∀ x : Real, ∀ e : Real, real_of_num(0) < e && real_of_num(1) < p && real_of_num(0) <= x → (∃ n : Num, ∃ q : Num, ∃ r : Num, real_of_num(q) / pow(p, n) <= x && x < real_of_num(r) / pow(p, n) && abs(real_of_num(q) / pow(p, n) - real_of_num(r) / pow(p, n)) < e))"),
    t631,
  )
  let (
    padic_rational_approximation_straddle_pos,
    padic_rational_approximation_straddle_pos_le,
  ) = @bool.conj_pair(
    (fn(
      x583 : (
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
      @tactics.prove(x583.0, x583.1)
    })(t632),
  )
  padic_rational_approximation_straddle_pos_c.set(
    padic_rational_approximation_straddle_pos,
  )
  padic_rational_approximation_straddle_pos_le_c.set(
    padic_rational_approximation_straddle_pos_le,
  )
}

///|
/// RATIONAL_APPROXIMATION
fn step_94() -> Unit raise {
  let t641 = @simp.asm_simp_tac(@list.List([rational_closed()]))
  let t640 = @tactics.exists_tac(@term_syntax.parse_term("(q : Real) / pow(real_of_num(2), (n : Num))"))
  let t637 = @term_syntax.parse_term("(r : Real)")
  let t638 = @term_syntax.parse_term("(q : Real)")
  let t639 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t638, t637]),
  )
  let t636 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
  ])
  let t633 = @term_syntax.parse_term("(e : Real)")
  let t634 = @term_syntax.parse_term("(x : Real)")
  let t635 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("real_of_num(2)"), t634, t633]),
      padic_rational_approximation_straddle(),
    ),
  )
  let t642 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t635),
                @tactics.ants_tac,
              ),
              t636,
            ),
            t639,
          ),
          @tactics.strip_tac,
        ),
        t640,
      ),
      t641,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  rational_approximation_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ r : Real, rational(r) && abs(r - x) < e)"),
      t642,
    ),
  )
}

///|
let rational_approximation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_APPROXIMATION",
)

///|
/// `RATIONAL_APPROXIMATION`
pub fn rational_approximation() -> @kernel.Thm {
  rational_approximation_c.get()
}

///|
/// RATIONAL_BETWEEN
fn step_95() -> Unit raise {
  let t645 = @simp.simp_tac(@list.List([]))
  let t646 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t645),
  ])
  let t643 = @term_syntax.parse_term("((b : Real) - (a : Real)) / real_of_num(4)")
  let t644 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("((a : Real) + (b : Real)) / real_of_num(2)"), t643]),
      rational_approximation(),
    ),
  )
  let t647 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t644),
        @tactics.ants_tac,
      ),
      t646,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  rational_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, a < b → (∃ q : Real, rational(q) && a < q && q < b)"),
      t647,
    ),
  )
}

///|
let rational_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_BETWEEN",
)

///|
/// `RATIONAL_BETWEEN`
pub fn rational_between() -> @kernel.Thm {
  rational_between_c.get()
}

///|
/// RATIONAL_BETWEEN_EQ
fn step_96() -> Unit raise {
  let t648 = @meson.meson_tac(
    @list.List([rational_between(), @realarith.real_lt_trans()]),
  )
  rational_between_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, (∃ q : Real, rational(q) && a < q && q < b) == (a < b)"),
      t648,
    ),
  )
}

///|
let rational_between_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_BETWEEN_EQ",
)

///|
/// `RATIONAL_BETWEEN_EQ`
pub fn rational_between_eq() -> @kernel.Thm {
  rational_between_eq_c.get()
}

///|
/// RATIONAL_APPROXIMATION_STRADDLE
fn step_97() -> Unit raise {
  let t655 = @simp.asm_rewrite_tac(@list.List([]))
  let t654 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@theorems.mono_exists()),
        @tactics.gen_tac,
      ),
      @tactics.strip_tac,
    ),
  ])
  let t652 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t653 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real) + (e : Real) / real_of_num(4)"), t652]),
      rational_approximation(),
    ),
  )
  let t651 = @list.List([
    @calc_rat.asm_real_arith_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@theorems.mono_exists()),
        @tactics.gen_tac,
      ),
      @tactics.strip_tac,
    ),
  ])
  let t649 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t650 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Real) - (e : Real) / real_of_num(4)"), t649]),
      rational_approximation(),
    ),
  )
  let t656 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t650),
                @tactics.ants_tac,
              ),
              t651,
            ),
            t653,
          ),
          @tactics.ants_tac,
        ),
        t654,
      ),
      t655,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  rational_approximation_straddle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ a : Real, ∃ b : Real, rational(a) && rational(b) && a < x && x < b && abs(b - a) < e)"),
      t656,
    ),
  )
}

///|
let rational_approximation_straddle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_APPROXIMATION_STRADDLE",
)

///|
/// `RATIONAL_APPROXIMATION_STRADDLE`
pub fn rational_approximation_straddle() -> @kernel.Thm {
  rational_approximation_straddle_c.get()
}

///|
/// RATIONAL_APPROXIMATION_ABOVE
fn step_98() -> Unit raise {
  let t663 = @simp.asm_rewrite_tac(@list.List([]))
  let t662 = @tactics.repeat_tac(@tactics.strip_tac)
  let t661 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t660 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t659 = @simp.asm_rewrite_tac(@list.List([]))
  let t657 = @term_syntax.parse_term("(e : Real)")
  let t658 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t657]),
      rational_approximation_straddle(),
    ),
  )
  let t664 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t658),
              t659,
            ),
            t660,
          ),
          t661,
        ),
        t662,
      ),
      t663,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  rational_approximation_above_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ q : Real, rational(q) && x < q && q < x + e)"),
      t664,
    ),
  )
}

///|
let rational_approximation_above_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_APPROXIMATION_ABOVE",
)

///|
/// `RATIONAL_APPROXIMATION_ABOVE`
pub fn rational_approximation_above() -> @kernel.Thm {
  rational_approximation_above_c.get()
}

///|
/// RATIONAL_APPROXIMATION_BELOW
fn step_99() -> Unit raise {
  let t670 = @simp.asm_rewrite_tac(@list.List([]))
  let t669 = @tactics.repeat_tac(@tactics.strip_tac)
  let t668 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t667 = @simp.asm_rewrite_tac(@list.List([]))
  let t665 = @term_syntax.parse_term("(e : Real)")
  let t666 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t665]),
      rational_approximation_straddle(),
    ),
  )
  let t671 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t666),
            t667,
          ),
          t668,
        ),
        t669,
      ),
      t670,
    ),
    @calc_rat.asm_real_arith_tac,
  )
  rational_approximation_below_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ e : Real, real_of_num(0) < e → (∃ q : Real, rational(q) && x - e < q && q < x)"),
      t671,
    ),
  )
}

///|
let rational_approximation_below_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RATIONAL_APPROXIMATION_BELOW",
)

///|
/// `RATIONAL_APPROXIMATION_BELOW`
pub fn rational_approximation_below() -> @kernel.Thm {
  rational_approximation_below_c.get()
}

///|
/// INFINITE_RATIONAL_IN_RANGE
fn step_100() -> Unit raise {
  let t686 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_trans()]))
  let t685 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t684 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (q : (Num) -> Real)(n) < q(m)"),
    fn(
      x682 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x682
      @meson.meson_tac(
        @list.List([@arith.lt_cases(), th, @realarith.real_lt_refl()]),
      )
    },
  )
  let t681 = @simp.rewrite_tac(
    @list.List([@sets.num_infinite(), @sets.in_univ()]),
  )
  let t680 = @tactics.match_mp_tac(@sets.infinite_image())
  let t679 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t678 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE((q : (Num) -> Real), UNIV)"),
  )
  let t687 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@sets.infinite_superset()),
                  t678,
                ),
                @tactics.conj_tac,
              ),
              t679,
            ),
            t680,
          ),
          t681,
        ),
        t684,
      ),
      t685,
    ),
    t686,
  )
  let t677 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t676 = @tactics.match_mp_tac(rational_between())
  let t675 = @tactics.repeat_tac(@tactics.strip_tac)
  let t673 = @equal.gsym(@real.real_lt_min())
  let t674 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.conj_assoc()), t673]),
  )
  let t688 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@arith.dependent_choice()),
            t674,
          ),
          t675,
        ),
        t676,
      ),
      t677,
    ),
    t687,
  ])
  let t672 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ q : (Num) -> Real, (∀ n : Num, rational(q(n)) && (a : Real) < q(n) && q(n) < (b : Real)) && (∀ n : Num, q(SUC(n)) < q(n))"),
    @tactics.strip_assume_tac,
  )
  let t689 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t672),
    t688,
  )
  infinite_rational_in_range_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, a < b → INFINITE({(q : Real) | rational(q) && a < q && q < b})"),
      t689,
    ),
  )
}

///|
let infinite_rational_in_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INFINITE_RATIONAL_IN_RANGE",
)

///|
/// `INFINITE_RATIONAL_IN_RANGE`
pub fn infinite_rational_in_range() -> @kernel.Thm {
  infinite_rational_in_range_c.get()
}

///|
/// REAL_CONGRUENCE
fn step_101() -> Unit raise {
  let t704 = @meson.meson_tac(@list.List([]))
  let t703 = @simp.rewrite_tac(
    @list.List([@int.num_congruent(), @int.int_congruent()]),
  )
  let t700 = @equal.gsym(@int.int_eq())
  let t701 = @equal.gsym(@int.int_mul_th())
  let t702 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_sub_th()), t701, t700]),
  )
  let t699 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_th())]))
  let t698 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_of_num_eq(),
      @calc_rat.real_field(
        @term_syntax.parse_term("!((n : Real) == real_of_num(0)) → ((x : Real) / n == (y : Real)) == (n * y == x)"),
      ),
    ]),
  )
  let t697 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_univ()]))
  let t696 = @simp.gen_rewrite_tac(
    fn(
      x693 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s694 = @equal.rand_conv(x693)
      fn(x695 : @kernel.Term) -> @kernel.Thm raise { s694(x695) }
    },
    @list.List([@equal.gsym(@sets.in_())]),
  )
  let t692 = @simp.rewrite_tac(
    @list.List([@equal.gsym(image_real_of_int_univ())]),
  )
  let t691 = @list.List([@tactics.conv_tac(@int.number_rule), @tactics.all_tac])
  let t690 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t705 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.gen_tac),
                        @class.cond_cases_tac,
                      ),
                      t690,
                    ),
                    t691,
                  ),
                  t692,
                ),
                t696,
              ),
              t697,
            ),
            t698,
          ),
          t699,
        ),
        t702,
      ),
      t703,
    ),
    t704,
  )
  real_congruence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, op_eq_eq(a, b, mod(n)) == (if n == 0 { real_of_num(a) == real_of_num(b) } else { integer((real_of_num(a) - real_of_num(b)) / real_of_num(n)) })"),
      t705,
    ),
  )
}

///|
let real_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONGRUENCE",
)

///|
/// `REAL_CONGRUENCE`
pub fn real_congruence() -> @kernel.Thm {
  real_congruence_c.get()
}

///|
/// REAL_INT_CONGRUENCE
fn step_102() -> Unit raise {
  let t720 = @tactics.conv_tac(@int.integer_rule)
  let t717 = @equal.gsym(@int.int_eq())
  let t718 = @equal.gsym(@int.int_sub_th())
  let t719 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_mul_th()), t718, t717]),
  )
  let t714 = @calc_rat.real_field(
    @term_syntax.parse_term("!((n : Real) == real_of_num(0)) → ((x : Real) / n == (y : Real)) == (n * y == x)"),
  )
  let t715 = @equal.gsym(@int.int_eq())
  let t716 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.int_of_num_th()), t715, t714]),
  )
  let t713 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_univ()]))
  let t712 = @simp.gen_rewrite_tac(
    fn(
      x709 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s710 = @equal.rand_conv(x709)
      fn(x711 : @kernel.Term) -> @kernel.Thm raise { s710(x711) }
    },
    @list.List([@equal.gsym(@sets.in_())]),
  )
  let t708 = @simp.rewrite_tac(
    @list.List([@equal.gsym(image_real_of_int_univ())]),
  )
  let t707 = @list.List([@tactics.conv_tac(@int.integer_rule), @tactics.all_tac])
  let t706 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.int_eq())]))
  let t721 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    @class.cond_cases_tac,
                  ),
                  t706,
                ),
                t707,
              ),
              t708,
            ),
            t712,
          ),
          t713,
        ),
        t716,
      ),
      t719,
    ),
    t720,
  )
  real_int_congruence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, op_eq_eq(a, b, mod(n)) == (if n == int_of_num(0) { real_of_int(a) == real_of_int(b) } else { integer((real_of_int(a) - real_of_int(b)) / real_of_int(n)) })"),
      t721,
    ),
  )
}

///|
let real_int_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_INT_CONGRUENCE",
)

///|
/// `REAL_INT_CONGRUENCE`
pub fn real_int_congruence() -> @kernel.Thm {
  real_int_congruence_c.get()
}

///|
/// REAL_INTEGER_TAC
fn step_103() -> Unit raise {
  let t722 = @tactics.match_accept_tac(@int.integer_real_of_int())
  let base : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.orelse_tac(
    @tactics.match_accept_tac(@bool.conjunct1(integer_closed())),
    t722,
  )
  let t723 = @tactics.try_tac(@tactics.conj_tac)
  let step : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
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
    @tactics.map_first(
      @tactics.match_mp_tac,
      @bool.conjuncts_rule(@bool.conjunct2(integer_closed())),
    ),
    t723,
  )
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
  ) raise = @tactics.then_tac(@tactics.repeat_tac(step), base)
  real_integer_tac_c.set(fn(
    x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) = x724
    match w {
      @kernel.Term::Comb(@kernel.Term::Const("integer", _), t) =>
        @tactics.orelse_tac(
          tac,
          @tactics.then_tac(
            @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_poly_conv)),
            tac,
          ),
        )((asl, w))
      _ => raise Failure("REAL_INTEGER_TAC: Goal not of expected form")
    }
  })
}

///|
let real_integer_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "REAL_INTEGER_TAC",
)

///|
/// `REAL_INTEGER_TAC`
pub fn real_integer_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  real_integer_tac_c.get()(x)
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
}
