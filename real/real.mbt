// Translated from upstream real.ml; edit this file directly.

///|
/// REAL_OF_NUM_LT
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([
      @realax.real_lt(),
      @equal.gsym(@arith.not_le()),
      @realax.real_of_num_le(),
    ]),
  )
  real_of_num_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (real_of_num(m) < real_of_num(n)) == (m < n)"), t1),
  )
}

///|
let real_of_num_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_NUM_LT")

///|
/// `REAL_OF_NUM_LT`
pub fn real_of_num_lt() -> @kernel.Thm {
  real_of_num_lt_c.get()
}

///|
/// REAL_OF_NUM_GE
fn step_2() -> Unit raise {
  let t2 = @simp.rewrite_tac(
    @list.List([@arith.ge(), @realax.real_ge(), @realax.real_of_num_le()]),
  )
  real_of_num_ge_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (real_of_num(m) >= real_of_num(n)) == (m >= n)"), t2),
  )
}

///|
let real_of_num_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_NUM_GE")

///|
/// `REAL_OF_NUM_GE`
pub fn real_of_num_ge() -> @kernel.Thm {
  real_of_num_ge_c.get()
}

///|
/// REAL_OF_NUM_GT
fn step_3() -> Unit raise {
  let t3 = @simp.rewrite_tac(
    @list.List([@arith.gt(), @realax.real_gt(), real_of_num_lt()]),
  )
  real_of_num_gt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (real_of_num(m) > real_of_num(n)) == (m > n)"), t3),
  )
}

///|
let real_of_num_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_NUM_GT")

///|
/// `REAL_OF_NUM_GT`
pub fn real_of_num_gt() -> @kernel.Thm {
  real_of_num_gt_c.get()
}

///|
/// REAL_OF_NUM_MAX
fn step_4() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_le(),
      @arith.max(),
      @realax.real_max(),
      @equal.gsym(@class.cond_rand()),
    ]),
  )
  real_of_num_max_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, max(real_of_num(m), real_of_num(n)) == real_of_num(MAX(m, n))"), t4),
  )
}

///|
let real_of_num_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_MAX",
)

///|
/// `REAL_OF_NUM_MAX`
pub fn real_of_num_max() -> @kernel.Thm {
  real_of_num_max_c.get()
}

///|
/// REAL_OF_NUM_MIN
fn step_5() -> Unit raise {
  let t5 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_le(),
      @arith.min(),
      @realax.real_min(),
      @equal.gsym(@class.cond_rand()),
    ]),
  )
  real_of_num_min_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, min(real_of_num(m), real_of_num(n)) == real_of_num(MIN(m, n))"), t5),
  )
}

///|
let real_of_num_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_MIN",
)

///|
/// `REAL_OF_NUM_MIN`
pub fn real_of_num_min() -> @kernel.Thm {
  real_of_num_min_c.get()
}

///|
/// REAL_OF_NUM_SUC
fn step_6() -> Unit raise {
  let t6 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @realax.real_of_num_add()]),
  )
  real_of_num_suc_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(n) + real_of_num(1) == real_of_num(SUC(n))"), t6),
  )
}

///|
let real_of_num_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUC",
)

///|
/// `REAL_OF_NUM_SUC`
pub fn real_of_num_suc() -> @kernel.Thm {
  real_of_num_suc_c.get()
}

///|
/// REAL_OF_NUM_SUB
fn step_7() -> Unit raise {
  let t12 = @meson.meson_tac(
    @list.List([
      @realax.real_add_linv(),
      @realax.real_add_sym(),
      @realax.real_add_lid(),
    ]),
  )
  let t11 = @simp.rewrite_tac(
    @list.List([@realax.real_sub(), @equal.gsym(@realax.real_add_assoc())]),
  )
  let t10 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t9 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_add())]),
  )
  let t8 = @simp.asm_rewrite_tac(@list.List([@arith.add_sub2()]))
  let t7 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t13 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t7),
              @tactics.strip_tac,
            ),
            t8,
          ),
          t9,
        ),
        t10,
      ),
      t11,
    ),
    t12,
  )
  real_of_num_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → real_of_num(n) - real_of_num(m) == real_of_num(n - m)"),
      t13,
    ),
  )
}

///|
let real_of_num_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUB",
)

///|
/// `REAL_OF_NUM_SUB`
pub fn real_of_num_sub() -> @kernel.Thm {
  real_of_num_sub_c.get()
}

///|
/// REAL_OF_NUM_SUB_CASES
fn step_8() -> Unit raise {
  let t20 = @meson.asm_meson_tac(@list.List([@arith.le_cases()]))
  let t19 = @tactics.match_mp_tac(real_of_num_sub())
  let t18 = @simp.gen_rewrite_tac(
    fn(
      x15 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s16 = @equal.land_conv(x15)
      fn(x17 : @kernel.Term) -> @kernel.Thm raise { s16(x17) }
    },
    @list.List([@equal.gsym(@realarith.real_neg_sub())]),
  )
  let t14 = @simp.asm_simp_tac(@list.List([real_of_num_sub()]))
  let t21 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @class.cond_cases_tac,
            ),
            t14,
          ),
          t18,
        ),
        @tactics.ap_term_tac,
      ),
      t19,
    ),
    t20,
  )
  real_of_num_sub_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_of_num(m) - real_of_num(n) == (if n <= m { real_of_num(m - n) } else { -real_of_num(n - m) })"),
      t21,
    ),
  )
}

///|
let real_of_num_sub_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_SUB_CASES",
)

///|
/// `REAL_OF_NUM_SUB_CASES`
pub fn real_of_num_sub_cases() -> @kernel.Thm {
  real_of_num_sub_cases_c.get()
}

///|
/// REAL_OF_NUM_CLAUSES
fn step_9() -> Unit raise {
  let t22 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_eq(),
      real_of_num_ge(),
      real_of_num_gt(),
      @realax.real_of_num_le(),
      real_of_num_lt(),
      real_of_num_max(),
      real_of_num_min(),
      @realax.real_of_num_add(),
      @realax.real_of_num_mul(),
      @calc_int.real_of_num_pow(),
    ]),
  )
  real_of_num_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (real_of_num(m) == real_of_num(n)) == (m == n)) && (∀ m : Num, ∀ n : Num, (real_of_num(m) >= real_of_num(n)) == (m >= n)) && (∀ m : Num, ∀ n : Num, (real_of_num(m) > real_of_num(n)) == (m > n)) && (∀ m : Num, ∀ n : Num, (real_of_num(m) <= real_of_num(n)) == (m <= n)) && (∀ m : Num, ∀ n : Num, (real_of_num(m) < real_of_num(n)) == (m < n)) && (∀ m : Num, ∀ n : Num, max(real_of_num(m), real_of_num(n)) == real_of_num(MAX(m, n))) && (∀ m : Num, ∀ n : Num, min(real_of_num(m), real_of_num(n)) == real_of_num(MIN(m, n))) && (∀ m : Num, ∀ n : Num, real_of_num(m) + real_of_num(n) == real_of_num(m + n)) && (∀ m : Num, ∀ n : Num, real_of_num(m) * real_of_num(n) == real_of_num(m * n)) && (∀ x : Num, ∀ n : Num, pow(real_of_num(x), n) == real_of_num(EXP(x, n)))"),
      t22,
    ),
  )
}

///|
let real_of_num_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_CLAUSES",
)

///|
/// `REAL_OF_NUM_CLAUSES`
pub fn real_of_num_clauses() -> @kernel.Thm {
  real_of_num_clauses_c.get()
}

///|
/// REAL_MUL_AC
fn step_10() -> Unit raise {
  let t23 = @tactics.match_accept_tac(@realax.real_mul_sym())
  let t24 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @realax.real_mul_assoc(),
            @bool.eqt_intro(@bool.spec_all(@realax.real_mul_sym())),
          ]),
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t23,
  )
  real_mul_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(m : Real) * (n : Real) == n * m && m * n * (p : Real) == m * (n * p) && m * (n * p) == n * (m * p)"),
      t24,
    ),
  )
}

///|
let real_mul_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_AC")

///|
/// `REAL_MUL_AC`
pub fn real_mul_ac() -> @kernel.Thm {
  real_mul_ac_c.get()
}

///|
/// REAL_ADD_RDISTRIB
fn step_11() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([@realax.real_mul_sym(), @realax.real_add_ldistrib()]),
  )
  real_add_rdistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y) * z == x * z + y * z"),
      t25,
    ),
  )
}

///|
let real_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ADD_RDISTRIB",
)

///|
/// `REAL_ADD_RDISTRIB`
pub fn real_add_rdistrib() -> @kernel.Thm {
  real_add_rdistrib_c.get()
}

///|
/// REAL_LT_LADD_IMP
fn step_12() -> Unit raise {
  let t41 = @simp.rewrite_tac(
    @list.List([
      @realax.real_add_assoc(),
      @realax.real_add_linv(),
      @realax.real_add_lid(),
    ]),
  )
  let t37 = @term_syntax.parse_term("-(x : Real)")
  let t40 = @tactics.disch_then(fn(
    x39 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x34 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s35 = @tactics.mp_tac(x34)
      fn(
        x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s35(x36)
      }
    })(((x38 : @kernel.Thm) => @bool.spec(t37, x38))(x39))
  })
  let t31 = @drule.match_mp(@realax.real_le_ladd_imp())
  let t33 = @tactics.disch_then(fn(
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
    (fn(
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
    })(t31(x32))
  })
  let t27 = @simp.rewrite_tac(@list.List([@realax.real_lt()]))
  let t26 = @tactics.conv_tac(@class.contrapos_conv)
  let t42 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t26),
          t27,
        ),
        t33,
      ),
      t40,
    ),
    t41,
  )
  real_lt_ladd_imp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, y < z → x + y < x + z"), t42),
  )
}

///|
let real_lt_ladd_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_LADD_IMP",
)

///|
/// `REAL_LT_LADD_IMP`
pub fn real_lt_ladd_imp() -> @kernel.Thm {
  real_lt_ladd_imp_c.get()
}

///|
/// REAL_LT_MUL
fn step_13() -> Unit raise {
  let t47 = @simp.asm_rewrite_tac(@list.List([]))
  let t46 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t45 = @simp.asm_rewrite_tac(@list.List([@realarith.real_entire()]))
  let t44 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t43 = @simp.rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t48 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t43),
            t44,
          ),
          @tactics.strip_tac,
        ),
        t45,
      ),
      t46,
    ),
    t47,
  )
  real_lt_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) < y → real_of_num(0) < x * y"),
      t48,
    ),
  )
}

///|
let real_lt_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_MUL")

///|
/// `REAL_LT_MUL`
pub fn real_lt_mul() -> @kernel.Thm {
  real_lt_mul_c.get()
}

///|
/// REAL_ARITH_TAC
fn step_14() -> Unit raise {
  real_arith_tac_c.set(@tactics.conv_tac(@realarith.real_arith))
}

///|
let real_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "REAL_ARITH_TAC",
)

///|
/// `REAL_ARITH_TAC`
pub fn real_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  real_arith_tac_c.get()(x)
}

///|
/// REAL_EQ_ADD_LCANCEL_0
fn step_15() -> Unit raise {
  real_eq_add_lcancel_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + y == x) == (y == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_add_lcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_ADD_LCANCEL_0",
)

///|
/// `REAL_EQ_ADD_LCANCEL_0`
pub fn real_eq_add_lcancel_0() -> @kernel.Thm {
  real_eq_add_lcancel_0_c.get()
}

///|
/// REAL_EQ_ADD_RCANCEL_0
fn step_16() -> Unit raise {
  real_eq_add_rcancel_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + y == y) == (x == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_add_rcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_ADD_RCANCEL_0",
)

///|
/// `REAL_EQ_ADD_RCANCEL_0`
pub fn real_eq_add_rcancel_0() -> @kernel.Thm {
  real_eq_add_rcancel_0_c.get()
}

///|
/// REAL_LNEG_UNIQ
fn step_17() -> Unit raise {
  real_lneg_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + y == real_of_num(0)) == (x == -y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LNEG_UNIQ")

///|
/// `REAL_LNEG_UNIQ`
pub fn real_lneg_uniq() -> @kernel.Thm {
  real_lneg_uniq_c.get()
}

///|
/// REAL_RNEG_UNIQ
fn step_18() -> Unit raise {
  real_rneg_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + y == real_of_num(0)) == (y == -x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_rneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_RNEG_UNIQ")

///|
/// `REAL_RNEG_UNIQ`
pub fn real_rneg_uniq() -> @kernel.Thm {
  real_rneg_uniq_c.get()
}

///|
/// REAL_NEG_LMUL
fn step_19() -> Unit raise {
  real_neg_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, -(x * y) == -x * y"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_LMUL")

///|
/// `REAL_NEG_LMUL`
pub fn real_neg_lmul() -> @kernel.Thm {
  real_neg_lmul_c.get()
}

///|
/// REAL_NEG_RMUL
fn step_20() -> Unit raise {
  real_neg_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, -(x * y) == x * -y"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_RMUL")

///|
/// `REAL_NEG_RMUL`
pub fn real_neg_rmul() -> @kernel.Thm {
  real_neg_rmul_c.get()
}

///|
/// REAL_NEG_MUL2
fn step_21() -> Unit raise {
  real_neg_mul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x * -y == x * y"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_MUL2")

///|
/// `REAL_NEG_MUL2`
pub fn real_neg_mul2() -> @kernel.Thm {
  real_neg_mul2_c.get()
}

///|
/// REAL_LT_LADD
fn step_22() -> Unit raise {
  real_lt_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y < x + z) == (y < z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LADD")

///|
/// `REAL_LT_LADD`
pub fn real_lt_ladd() -> @kernel.Thm {
  real_lt_ladd_c.get()
}

///|
/// REAL_LT_RADD
fn step_23() -> Unit raise {
  real_lt_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + z < y + z) == (x < y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_RADD")

///|
/// `REAL_LT_RADD`
pub fn real_lt_radd() -> @kernel.Thm {
  real_lt_radd_c.get()
}

///|
/// REAL_LT_ANTISYM
fn step_24() -> Unit raise {
  real_lt_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x < y && y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_ANTISYM",
)

///|
/// `REAL_LT_ANTISYM`
pub fn real_lt_antisym() -> @kernel.Thm {
  real_lt_antisym_c.get()
}

///|
/// REAL_LT_GT
fn step_25() -> Unit raise {
  real_lt_gt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → !(y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_GT")

///|
/// `REAL_LT_GT`
pub fn real_lt_gt() -> @kernel.Thm {
  real_lt_gt_c.get()
}

///|
/// REAL_NOT_EQ
fn step_26() -> Unit raise {
  real_not_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x == y) == (x < y || y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_not_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NOT_EQ")

///|
/// `REAL_NOT_EQ`
pub fn real_not_eq() -> @kernel.Thm {
  real_not_eq_c.get()
}

///|
/// REAL_NOT_LE
fn step_27() -> Unit raise {
  real_not_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x <= y) == (y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_not_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NOT_LE")

///|
/// `REAL_NOT_LE`
pub fn real_not_le() -> @kernel.Thm {
  real_not_le_c.get()
}

///|
/// REAL_LET_ANTISYM
fn step_28() -> Unit raise {
  real_let_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x <= y && y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_let_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LET_ANTISYM",
)

///|
/// `REAL_LET_ANTISYM`
pub fn real_let_antisym() -> @kernel.Thm {
  real_let_antisym_c.get()
}

///|
/// REAL_NEG_LT0
fn step_29() -> Unit raise {
  real_neg_lt0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (-x < real_of_num(0)) == (real_of_num(0) < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_lt0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_LT0")

///|
/// `REAL_NEG_LT0`
pub fn real_neg_lt0() -> @kernel.Thm {
  real_neg_lt0_c.get()
}

///|
/// REAL_NEG_GT0
fn step_30() -> Unit raise {
  real_neg_gt0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (real_of_num(0) < -x) == (x < real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_gt0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_GT0")

///|
/// `REAL_NEG_GT0`
pub fn real_neg_gt0() -> @kernel.Thm {
  real_neg_gt0_c.get()
}

///|
/// REAL_NEG_LE0
fn step_31() -> Unit raise {
  real_neg_le0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (-x <= real_of_num(0)) == (real_of_num(0) <= x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_le0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_LE0")

///|
/// `REAL_NEG_LE0`
pub fn real_neg_le0() -> @kernel.Thm {
  real_neg_le0_c.get()
}

///|
/// REAL_NEG_GE0
fn step_32() -> Unit raise {
  real_neg_ge0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= -x) == (x <= real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_ge0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_GE0")

///|
/// `REAL_NEG_GE0`
pub fn real_neg_ge0() -> @kernel.Thm {
  real_neg_ge0_c.get()
}

///|
/// REAL_LT_TOTAL
fn step_33() -> Unit raise {
  real_lt_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x == y || x < y || y < x"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_TOTAL")

///|
/// `REAL_LT_TOTAL`
pub fn real_lt_total() -> @kernel.Thm {
  real_lt_total_c.get()
}

///|
/// REAL_LT_NEGTOTAL
fn step_34() -> Unit raise {
  real_lt_negtotal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, x == real_of_num(0) || real_of_num(0) < x || real_of_num(0) < -x"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_negtotal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_NEGTOTAL",
)

///|
/// `REAL_LT_NEGTOTAL`
pub fn real_lt_negtotal() -> @kernel.Thm {
  real_lt_negtotal_c.get()
}

///|
/// REAL_LE_01
fn step_35() -> Unit raise {
  real_le_01_c.set(
    @tactics.prove(@term_syntax.parse_term("real_of_num(0) <= real_of_num(1)"), real_arith_tac),
  )
}

///|
let real_le_01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_01")

///|
/// `REAL_LE_01`
pub fn real_le_01() -> @kernel.Thm {
  real_le_01_c.get()
}

///|
/// REAL_LT_01
fn step_36() -> Unit raise {
  real_lt_01_c.set(
    @tactics.prove(@term_syntax.parse_term("real_of_num(0) < real_of_num(1)"), real_arith_tac),
  )
}

///|
let real_lt_01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_01")

///|
/// `REAL_LT_01`
pub fn real_lt_01() -> @kernel.Thm {
  real_lt_01_c.get()
}

///|
/// REAL_LE_LADD
fn step_37() -> Unit raise {
  real_le_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y <= x + z) == (y <= z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LADD")

///|
/// `REAL_LE_LADD`
pub fn real_le_ladd() -> @kernel.Thm {
  real_le_ladd_c.get()
}

///|
/// REAL_LE_RADD
fn step_38() -> Unit raise {
  real_le_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + z <= y + z) == (x <= y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_RADD")

///|
/// `REAL_LE_RADD`
pub fn real_le_radd() -> @kernel.Thm {
  real_le_radd_c.get()
}

///|
/// REAL_LT_ADD2
fn step_39() -> Unit raise {
  real_lt_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, w < x && y < z → w + y < x + z"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADD2")

///|
/// `REAL_LT_ADD2`
pub fn real_lt_add2() -> @kernel.Thm {
  real_lt_add2_c.get()
}

///|
/// REAL_LE_ADD2
fn step_40() -> Unit raise {
  real_le_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, w <= x && y <= z → w + y <= x + z"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_ADD2")

///|
/// `REAL_LE_ADD2`
pub fn real_le_add2() -> @kernel.Thm {
  real_le_add2_c.get()
}

///|
/// REAL_LT_LNEG
fn step_41() -> Unit raise {
  let t49 = @simp.rewrite_tac(
    @list.List([
      @realax.real_lt(),
      @calc_int.real_le_rneg(),
      @calc_int.real_add_ac(),
    ]),
  )
  real_lt_lneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x < y) == (real_of_num(0) < x + y)"), t49),
  )
}

///|
let real_lt_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LNEG")

///|
/// `REAL_LT_LNEG`
pub fn real_lt_lneg() -> @kernel.Thm {
  real_lt_lneg_c.get()
}

///|
/// REAL_LT_RNEG
fn step_42() -> Unit raise {
  let t50 = @simp.rewrite_tac(
    @list.List([
      @realax.real_lt(),
      @calc_int.real_le_lneg(),
      @calc_int.real_add_ac(),
    ]),
  )
  real_lt_rneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x < -y) == (x + y < real_of_num(0))"), t50),
  )
}

///|
let real_lt_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_RNEG")

///|
/// `REAL_LT_RNEG`
pub fn real_lt_rneg() -> @kernel.Thm {
  real_lt_rneg_c.get()
}

///|
/// REAL_LT_ADDNEG
fn step_43() -> Unit raise {
  real_lt_addneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (y < x + -z) == (y + z < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_addneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADDNEG")

///|
/// `REAL_LT_ADDNEG`
pub fn real_lt_addneg() -> @kernel.Thm {
  real_lt_addneg_c.get()
}

///|
/// REAL_LT_ADDNEG2
fn step_44() -> Unit raise {
  real_lt_addneg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + -y < z) == (x < z + y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_addneg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_ADDNEG2",
)

///|
/// `REAL_LT_ADDNEG2`
pub fn real_lt_addneg2() -> @kernel.Thm {
  real_lt_addneg2_c.get()
}

///|
/// REAL_LT_ADD1
fn step_45() -> Unit raise {
  real_lt_add1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y → x < y + real_of_num(1)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_add1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADD1")

///|
/// `REAL_LT_ADD1`
pub fn real_lt_add1() -> @kernel.Thm {
  real_lt_add1_c.get()
}

///|
/// REAL_SUB_ADD
fn step_46() -> Unit raise {
  real_sub_add_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x - y + y == x"), real_arith_tac),
  )
}

///|
let real_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_ADD")

///|
/// `REAL_SUB_ADD`
pub fn real_sub_add() -> @kernel.Thm {
  real_sub_add_c.get()
}

///|
/// REAL_SUB_ADD2
fn step_47() -> Unit raise {
  real_sub_add2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, y + (x - y) == x"), real_arith_tac),
  )
}

///|
let real_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_ADD2")

///|
/// `REAL_SUB_ADD2`
pub fn real_sub_add2() -> @kernel.Thm {
  real_sub_add2_c.get()
}

///|
/// REAL_SUB_REFL
fn step_48() -> Unit raise {
  real_sub_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, x - x == real_of_num(0)"), real_arith_tac),
  )
}

///|
let real_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_REFL")

///|
/// `REAL_SUB_REFL`
pub fn real_sub_refl() -> @kernel.Thm {
  real_sub_refl_c.get()
}

///|
/// REAL_LE_DOUBLE
fn step_49() -> Unit raise {
  real_le_double_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= x + x) == (real_of_num(0) <= x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_DOUBLE")

///|
/// `REAL_LE_DOUBLE`
pub fn real_le_double() -> @kernel.Thm {
  real_le_double_c.get()
}

///|
/// REAL_LE_NEGL
fn step_50() -> Unit raise {
  real_le_negl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (-x <= x) == (real_of_num(0) <= x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_negl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_NEGL")

///|
/// `REAL_LE_NEGL`
pub fn real_le_negl() -> @kernel.Thm {
  real_le_negl_c.get()
}

///|
/// REAL_LE_NEGR
fn step_51() -> Unit raise {
  real_le_negr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (x <= -x) == (x <= real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_negr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_NEGR")

///|
/// `REAL_LE_NEGR`
pub fn real_le_negr() -> @kernel.Thm {
  real_le_negr_c.get()
}

///|
/// REAL_NEG_EQ_0
fn step_52() -> Unit raise {
  real_neg_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (-x == real_of_num(0)) == (x == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_EQ_0")

///|
/// `REAL_NEG_EQ_0`
pub fn real_neg_eq_0() -> @kernel.Thm {
  real_neg_eq_0_c.get()
}

///|
/// REAL_ADD_SUB
fn step_53() -> Unit raise {
  real_add_sub_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x + y - x == y"), real_arith_tac),
  )
}

///|
let real_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_SUB")

///|
/// `REAL_ADD_SUB`
pub fn real_add_sub() -> @kernel.Thm {
  real_add_sub_c.get()
}

///|
/// REAL_NEG_EQ
fn step_54() -> Unit raise {
  real_neg_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x == y) == (x == -y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_EQ")

///|
/// `REAL_NEG_EQ`
pub fn real_neg_eq() -> @kernel.Thm {
  real_neg_eq_c.get()
}

///|
/// REAL_NEG_MINUS1
fn step_55() -> Unit raise {
  real_neg_minus1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, -x == -real_of_num(1) * x"), real_arith_tac),
  )
}

///|
let real_neg_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_NEG_MINUS1",
)

///|
/// `REAL_NEG_MINUS1`
pub fn real_neg_minus1() -> @kernel.Thm {
  real_neg_minus1_c.get()
}

///|
/// REAL_LT_IMP_NE
fn step_56() -> Unit raise {
  real_lt_imp_ne_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → !(x == y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_imp_ne_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_IMP_NE")

///|
/// `REAL_LT_IMP_NE`
pub fn real_lt_imp_ne() -> @kernel.Thm {
  real_lt_imp_ne_c.get()
}

///|
/// REAL_LE_ADDR
fn step_57() -> Unit raise {
  real_le_addr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= x + y) == (real_of_num(0) <= y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_ADDR")

///|
/// `REAL_LE_ADDR`
pub fn real_le_addr() -> @kernel.Thm {
  real_le_addr_c.get()
}

///|
/// REAL_LE_ADDL
fn step_58() -> Unit raise {
  real_le_addl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (y <= x + y) == (real_of_num(0) <= x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_ADDL")

///|
/// `REAL_LE_ADDL`
pub fn real_le_addl() -> @kernel.Thm {
  real_le_addl_c.get()
}

///|
/// REAL_LT_ADDR
fn step_59() -> Unit raise {
  real_lt_addr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x < x + y) == (real_of_num(0) < y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADDR")

///|
/// `REAL_LT_ADDR`
pub fn real_lt_addr() -> @kernel.Thm {
  real_lt_addr_c.get()
}

///|
/// REAL_LT_ADDL
fn step_60() -> Unit raise {
  real_lt_addl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (y < x + y) == (real_of_num(0) < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADDL")

///|
/// `REAL_LT_ADDL`
pub fn real_lt_addl() -> @kernel.Thm {
  real_lt_addl_c.get()
}

///|
/// REAL_SUB_SUB
fn step_61() -> Unit raise {
  real_sub_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x - y - x == -y"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_SUB")

///|
/// `REAL_SUB_SUB`
pub fn real_sub_sub() -> @kernel.Thm {
  real_sub_sub_c.get()
}

///|
/// REAL_LT_ADD_SUB
fn step_62() -> Unit raise {
  real_lt_add_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y < z) == (x < z - y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_ADD_SUB",
)

///|
/// `REAL_LT_ADD_SUB`
pub fn real_lt_add_sub() -> @kernel.Thm {
  real_lt_add_sub_c.get()
}

///|
/// REAL_LT_SUB_RADD
fn step_63() -> Unit raise {
  real_lt_sub_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x - y < z) == (x < z + y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_SUB_RADD",
)

///|
/// `REAL_LT_SUB_RADD`
pub fn real_lt_sub_radd() -> @kernel.Thm {
  real_lt_sub_radd_c.get()
}

///|
/// REAL_LT_SUB_LADD
fn step_64() -> Unit raise {
  real_lt_sub_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x < y - z) == (x + z < y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_SUB_LADD",
)

///|
/// `REAL_LT_SUB_LADD`
pub fn real_lt_sub_ladd() -> @kernel.Thm {
  real_lt_sub_ladd_c.get()
}

///|
/// REAL_LE_SUB_LADD
fn step_65() -> Unit raise {
  real_le_sub_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x <= y - z) == (x + z <= y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_SUB_LADD",
)

///|
/// `REAL_LE_SUB_LADD`
pub fn real_le_sub_ladd() -> @kernel.Thm {
  real_le_sub_ladd_c.get()
}

///|
/// REAL_LE_SUB_RADD
fn step_66() -> Unit raise {
  real_le_sub_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x - y <= z) == (x <= z + y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_SUB_RADD",
)

///|
/// `REAL_LE_SUB_RADD`
pub fn real_le_sub_radd() -> @kernel.Thm {
  real_le_sub_radd_c.get()
}

///|
/// REAL_ADD2_SUB2
fn step_67() -> Unit raise {
  real_add2_sub2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, a + b - (c + d) == a - c + (b - d)"),
      real_arith_tac,
    ),
  )
}

///|
let real_add2_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD2_SUB2")

///|
/// `REAL_ADD2_SUB2`
pub fn real_add2_sub2() -> @kernel.Thm {
  real_add2_sub2_c.get()
}

///|
/// REAL_SUB_LZERO
fn step_68() -> Unit raise {
  real_sub_lzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) - x == -x"), real_arith_tac),
  )
}

///|
let real_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_LZERO")

///|
/// `REAL_SUB_LZERO`
pub fn real_sub_lzero() -> @kernel.Thm {
  real_sub_lzero_c.get()
}

///|
/// REAL_SUB_RZERO
fn step_69() -> Unit raise {
  real_sub_rzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, x - real_of_num(0) == x"), real_arith_tac),
  )
}

///|
let real_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_RZERO")

///|
/// `REAL_SUB_RZERO`
pub fn real_sub_rzero() -> @kernel.Thm {
  real_sub_rzero_c.get()
}

///|
/// REAL_LET_ADD2
fn step_70() -> Unit raise {
  real_let_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, w <= x && y < z → w + y < x + z"),
      real_arith_tac,
    ),
  )
}

///|
let real_let_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LET_ADD2")

///|
/// `REAL_LET_ADD2`
pub fn real_let_add2() -> @kernel.Thm {
  real_let_add2_c.get()
}

///|
/// REAL_LTE_ADD2
fn step_71() -> Unit raise {
  real_lte_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, w < x && y <= z → w + y < x + z"),
      real_arith_tac,
    ),
  )
}

///|
let real_lte_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LTE_ADD2")

///|
/// `REAL_LTE_ADD2`
pub fn real_lte_add2() -> @kernel.Thm {
  real_lte_add2_c.get()
}

///|
/// REAL_SUB_LNEG
fn step_72() -> Unit raise {
  real_sub_lneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x - y == -(x + y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_LNEG")

///|
/// `REAL_SUB_LNEG`
pub fn real_sub_lneg() -> @kernel.Thm {
  real_sub_lneg_c.get()
}

///|
/// REAL_SUB_RNEG
fn step_73() -> Unit raise {
  real_sub_rneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x - -y == x + y"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_RNEG")

///|
/// `REAL_SUB_RNEG`
pub fn real_sub_rneg() -> @kernel.Thm {
  real_sub_rneg_c.get()
}

///|
/// REAL_SUB_NEG2
fn step_74() -> Unit raise {
  real_sub_neg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x - -y == y - x"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_NEG2")

///|
/// `REAL_SUB_NEG2`
pub fn real_sub_neg2() -> @kernel.Thm {
  real_sub_neg2_c.get()
}

///|
/// REAL_SUB_TRIANGLE
fn step_75() -> Unit raise {
  real_sub_triangle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, a - b + (b - c) == a - c"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_TRIANGLE",
)

///|
/// `REAL_SUB_TRIANGLE`
pub fn real_sub_triangle() -> @kernel.Thm {
  real_sub_triangle_c.get()
}

///|
/// REAL_EQ_SUB_LADD
fn step_76() -> Unit raise {
  real_eq_sub_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x == y - z) == (x + z == y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_SUB_LADD",
)

///|
/// `REAL_EQ_SUB_LADD`
pub fn real_eq_sub_ladd() -> @kernel.Thm {
  real_eq_sub_ladd_c.get()
}

///|
/// REAL_EQ_SUB_RADD
fn step_77() -> Unit raise {
  real_eq_sub_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x - y == z) == (x == z + y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_SUB_RADD",
)

///|
/// `REAL_EQ_SUB_RADD`
pub fn real_eq_sub_radd() -> @kernel.Thm {
  real_eq_sub_radd_c.get()
}

///|
/// REAL_SUB_SUB2
fn step_78() -> Unit raise {
  real_sub_sub2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x - (x - y) == y"), real_arith_tac),
  )
}

///|
let real_sub_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_SUB2")

///|
/// `REAL_SUB_SUB2`
pub fn real_sub_sub2() -> @kernel.Thm {
  real_sub_sub2_c.get()
}

///|
/// REAL_ADD_SUB2
fn step_79() -> Unit raise {
  real_add_sub2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x - (x + y) == -y"),
      real_arith_tac,
    ),
  )
}

///|
let real_add_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_SUB2")

///|
/// `REAL_ADD_SUB2`
pub fn real_add_sub2() -> @kernel.Thm {
  real_add_sub2_c.get()
}

///|
/// REAL_EQ_IMP_LE
fn step_80() -> Unit raise {
  real_eq_imp_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x == y → x <= y"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EQ_IMP_LE")

///|
/// `REAL_EQ_IMP_LE`
pub fn real_eq_imp_le() -> @kernel.Thm {
  real_eq_imp_le_c.get()
}

///|
/// REAL_LT_IMP_NZ
fn step_81() -> Unit raise {
  real_lt_imp_nz_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → !(x == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_imp_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_IMP_NZ")

///|
/// `REAL_LT_IMP_NZ`
pub fn real_lt_imp_nz() -> @kernel.Thm {
  real_lt_imp_nz_c.get()
}

///|
/// REAL_DIFFSQ
fn step_82() -> Unit raise {
  real_diffsq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + y) * (x - y) == x * x - y * y"),
      real_arith_tac,
    ),
  )
}

///|
let real_diffsq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFSQ")

///|
/// `REAL_DIFFSQ`
pub fn real_diffsq() -> @kernel.Thm {
  real_diffsq_c.get()
}

///|
/// REAL_EQ_NEG2
fn step_83() -> Unit raise {
  real_eq_neg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x == -y) == (x == y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_eq_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EQ_NEG2")

///|
/// `REAL_EQ_NEG2`
pub fn real_eq_neg2() -> @kernel.Thm {
  real_eq_neg2_c.get()
}

///|
/// REAL_LT_NEG2
fn step_84() -> Unit raise {
  real_lt_neg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x < -y) == (y < x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_NEG2")

///|
/// `REAL_LT_NEG2`
pub fn real_lt_neg2() -> @kernel.Thm {
  real_lt_neg2_c.get()
}

///|
/// REAL_SUB_LDISTRIB
fn step_85() -> Unit raise {
  real_sub_ldistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x * (y - z) == x * y - x * z"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_LDISTRIB",
)

///|
/// `REAL_SUB_LDISTRIB`
pub fn real_sub_ldistrib() -> @kernel.Thm {
  real_sub_ldistrib_c.get()
}

///|
/// REAL_SUB_RDISTRIB
fn step_86() -> Unit raise {
  real_sub_rdistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x - y) * z == x * z - y * z"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SUB_RDISTRIB",
)

///|
/// `REAL_SUB_RDISTRIB`
pub fn real_sub_rdistrib() -> @kernel.Thm {
  real_sub_rdistrib_c.get()
}

///|
/// REAL_ABS_ZERO
fn step_87() -> Unit raise {
  real_abs_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (abs(x) == real_of_num(0)) == (x == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_ZERO")

///|
/// `REAL_ABS_ZERO`
pub fn real_abs_zero() -> @kernel.Thm {
  real_abs_zero_c.get()
}

///|
/// REAL_ABS_0
fn step_88() -> Unit raise {
  real_abs_0_c.set(
    @tactics.prove(@term_syntax.parse_term("abs(real_of_num(0)) == real_of_num(0)"), real_arith_tac),
  )
}

///|
let real_abs_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_0")

///|
/// `REAL_ABS_0`
pub fn real_abs_0() -> @kernel.Thm {
  real_abs_0_c.get()
}

///|
/// REAL_ABS_1
fn step_89() -> Unit raise {
  real_abs_1_c.set(
    @tactics.prove(@term_syntax.parse_term("abs(real_of_num(1)) == real_of_num(1)"), real_arith_tac),
  )
}

///|
let real_abs_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_1")

///|
/// `REAL_ABS_1`
pub fn real_abs_1() -> @kernel.Thm {
  real_abs_1_c.get()
}

///|
/// REAL_ABS_TRIANGLE
fn step_90() -> Unit raise {
  real_abs_triangle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x + y) <= abs(x) + abs(y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_TRIANGLE",
)

///|
/// `REAL_ABS_TRIANGLE`
pub fn real_abs_triangle() -> @kernel.Thm {
  real_abs_triangle_c.get()
}

///|
/// REAL_ABS_TRIANGLE_LE
fn step_91() -> Unit raise {
  real_abs_triangle_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, abs(x) + abs(y - x) <= z → abs(y) <= z"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_triangle_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_TRIANGLE_LE",
)

///|
/// `REAL_ABS_TRIANGLE_LE`
pub fn real_abs_triangle_le() -> @kernel.Thm {
  real_abs_triangle_le_c.get()
}

///|
/// REAL_ABS_TRIANGLE_LT
fn step_92() -> Unit raise {
  real_abs_triangle_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, abs(x) + abs(y - x) < z → abs(y) < z"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_triangle_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_TRIANGLE_LT",
)

///|
/// `REAL_ABS_TRIANGLE_LT`
pub fn real_abs_triangle_lt() -> @kernel.Thm {
  real_abs_triangle_lt_c.get()
}

///|
/// REAL_ABS_POS
fn step_93() -> Unit raise {
  real_abs_pos_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= abs(x)"), real_arith_tac),
  )
}

///|
let real_abs_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_POS")

///|
/// `REAL_ABS_POS`
pub fn real_abs_pos() -> @kernel.Thm {
  real_abs_pos_c.get()
}

///|
/// REAL_ABS_SUB
fn step_94() -> Unit raise {
  real_abs_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x - y) == abs(y - x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SUB")

///|
/// `REAL_ABS_SUB`
pub fn real_abs_sub() -> @kernel.Thm {
  real_abs_sub_c.get()
}

///|
/// REAL_ABS_NZ
fn step_95() -> Unit raise {
  real_abs_nz_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) == (real_of_num(0) < abs(x))"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_NZ")

///|
/// `REAL_ABS_NZ`
pub fn real_abs_nz() -> @kernel.Thm {
  real_abs_nz_c.get()
}

///|
/// REAL_ABS_ABS
fn step_96() -> Unit raise {
  real_abs_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, abs(abs(x)) == abs(x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_ABS")

///|
/// `REAL_ABS_ABS`
pub fn real_abs_abs() -> @kernel.Thm {
  real_abs_abs_c.get()
}

///|
/// REAL_ABS_LE
fn step_97() -> Unit raise {
  real_abs_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, x <= abs(x)"), real_arith_tac),
  )
}

///|
let real_abs_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_LE")

///|
/// `REAL_ABS_LE`
pub fn real_abs_le() -> @kernel.Thm {
  real_abs_le_c.get()
}

///|
/// REAL_ABS_REFL
fn step_98() -> Unit raise {
  real_abs_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (abs(x) == x) == (real_of_num(0) <= x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_REFL")

///|
/// `REAL_ABS_REFL`
pub fn real_abs_refl() -> @kernel.Thm {
  real_abs_refl_c.get()
}

///|
/// REAL_ABS_BETWEEN
fn step_99() -> Unit raise {
  real_abs_between_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ d : Real, (real_of_num(0) < d && x - d < y && y < x + d) == (abs(y - x) < d)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_BETWEEN",
)

///|
/// `REAL_ABS_BETWEEN`
pub fn real_abs_between() -> @kernel.Thm {
  real_abs_between_c.get()
}

///|
/// REAL_ABS_BOUND
fn step_100() -> Unit raise {
  real_abs_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ d : Real, abs(x - y) < d → y < x + d"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_BOUND")

///|
/// `REAL_ABS_BOUND`
pub fn real_abs_bound() -> @kernel.Thm {
  real_abs_bound_c.get()
}

///|
/// REAL_ABS_STILLNZ
fn step_101() -> Unit raise {
  real_abs_stillnz_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x - y) < abs(y) → !(x == real_of_num(0))"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_stillnz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_STILLNZ",
)

///|
/// `REAL_ABS_STILLNZ`
pub fn real_abs_stillnz() -> @kernel.Thm {
  real_abs_stillnz_c.get()
}

///|
/// REAL_ABS_CASES
fn step_102() -> Unit raise {
  real_abs_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, x == real_of_num(0) || real_of_num(0) < abs(x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_CASES")

///|
/// `REAL_ABS_CASES`
pub fn real_abs_cases() -> @kernel.Thm {
  real_abs_cases_c.get()
}

///|
/// REAL_ABS_BETWEEN1
fn step_103() -> Unit raise {
  real_abs_between1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x < z && abs(y - x) < z - x → y < z"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_between1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_BETWEEN1",
)

///|
/// `REAL_ABS_BETWEEN1`
pub fn real_abs_between1() -> @kernel.Thm {
  real_abs_between1_c.get()
}

///|
/// REAL_ABS_SIGN
fn step_104() -> Unit raise {
  real_abs_sign_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x - y) < y → real_of_num(0) < x"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_sign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SIGN")

///|
/// `REAL_ABS_SIGN`
pub fn real_abs_sign() -> @kernel.Thm {
  real_abs_sign_c.get()
}

///|
/// REAL_ABS_SIGN2
fn step_105() -> Unit raise {
  real_abs_sign2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x - y) < -y → x < real_of_num(0)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_sign2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SIGN2")

///|
/// `REAL_ABS_SIGN2`
pub fn real_abs_sign2() -> @kernel.Thm {
  real_abs_sign2_c.get()
}

///|
/// REAL_ABS_CIRCLE
fn step_106() -> Unit raise {
  real_abs_circle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ h : Real, abs(h) < abs(y) - abs(x) → abs(x + h) < abs(y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_circle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_CIRCLE",
)

///|
/// `REAL_ABS_CIRCLE`
pub fn real_abs_circle() -> @kernel.Thm {
  real_abs_circle_c.get()
}

///|
/// REAL_SUB_ABS
fn step_107() -> Unit raise {
  real_sub_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x) - abs(y) <= abs(x - y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_sub_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_ABS")

///|
/// `REAL_SUB_ABS`
pub fn real_sub_abs() -> @kernel.Thm {
  real_sub_abs_c.get()
}

///|
/// REAL_ABS_SUB_ABS
fn step_108() -> Unit raise {
  real_abs_sub_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(abs(x) - abs(y)) <= abs(x - y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_sub_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_SUB_ABS",
)

///|
/// `REAL_ABS_SUB_ABS`
pub fn real_abs_sub_abs() -> @kernel.Thm {
  real_abs_sub_abs_c.get()
}

///|
/// REAL_ABS_BETWEEN2
fn step_109() -> Unit raise {
  real_abs_between2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x0 : Real, ∀ x : Real, ∀ y0 : Real, ∀ y : Real, x0 < y0 && real_of_num(2) * abs(x - x0) < y0 - x0 && real_of_num(2) * abs(y - y0) < y0 - x0 → x < y"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_between2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_BETWEEN2",
)

///|
/// `REAL_ABS_BETWEEN2`
pub fn real_abs_between2() -> @kernel.Thm {
  real_abs_between2_c.get()
}

///|
/// REAL_ABS_BOUNDS
fn step_110() -> Unit raise {
  real_abs_bounds_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ k : Real, (abs(x) <= k) == (-k <= x && x <= k)"),
      real_arith_tac,
    ),
  )
}

///|
let real_abs_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_BOUNDS",
)

///|
/// `REAL_ABS_BOUNDS`
pub fn real_abs_bounds() -> @kernel.Thm {
  real_abs_bounds_c.get()
}

///|
/// REAL_BOUNDS_LE
fn step_111() -> Unit raise {
  real_bounds_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ k : Real, (-k <= x && x <= k) == (abs(x) <= k)"),
      real_arith_tac,
    ),
  )
}

///|
let real_bounds_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_BOUNDS_LE")

///|
/// `REAL_BOUNDS_LE`
pub fn real_bounds_le() -> @kernel.Thm {
  real_bounds_le_c.get()
}

///|
/// REAL_BOUNDS_LT
fn step_112() -> Unit raise {
  real_bounds_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ k : Real, (-k < x && x < k) == (abs(x) < k)"),
      real_arith_tac,
    ),
  )
}

///|
let real_bounds_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_BOUNDS_LT")

///|
/// `REAL_BOUNDS_LT`
pub fn real_bounds_lt() -> @kernel.Thm {
  real_bounds_lt_c.get()
}

///|
/// REAL_MIN_MAX
fn step_113() -> Unit raise {
  real_min_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, min(x, y) == -max(-x, -y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_MAX")

///|
/// `REAL_MIN_MAX`
pub fn real_min_max() -> @kernel.Thm {
  real_min_max_c.get()
}

///|
/// REAL_MAX_MIN
fn step_114() -> Unit raise {
  real_max_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, max(x, y) == -min(-x, -y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_MIN")

///|
/// `REAL_MAX_MIN`
pub fn real_max_min() -> @kernel.Thm {
  real_max_min_c.get()
}

///|
/// REAL_MAX_MAX
fn step_115() -> Unit raise {
  real_max_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= max(x, y) && y <= max(x, y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_MAX")

///|
/// `REAL_MAX_MAX`
pub fn real_max_max() -> @kernel.Thm {
  real_max_max_c.get()
}

///|
/// REAL_MIN_MIN
fn step_116() -> Unit raise {
  real_min_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, min(x, y) <= x && min(x, y) <= y"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_MIN")

///|
/// `REAL_MIN_MIN`
pub fn real_min_min() -> @kernel.Thm {
  real_min_min_c.get()
}

///|
/// REAL_MAX_SYM
fn step_117() -> Unit raise {
  real_max_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, max(x, y) == max(y, x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_SYM")

///|
/// `REAL_MAX_SYM`
pub fn real_max_sym() -> @kernel.Thm {
  real_max_sym_c.get()
}

///|
/// REAL_MIN_SYM
fn step_118() -> Unit raise {
  real_min_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, min(x, y) == min(y, x)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_SYM")

///|
/// `REAL_MIN_SYM`
pub fn real_min_sym() -> @kernel.Thm {
  real_min_sym_c.get()
}

///|
/// REAL_LE_MAX
fn step_119() -> Unit raise {
  real_le_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (z <= max(x, y)) == (z <= x || z <= y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_MAX")

///|
/// `REAL_LE_MAX`
pub fn real_le_max() -> @kernel.Thm {
  real_le_max_c.get()
}

///|
/// REAL_LE_MIN
fn step_120() -> Unit raise {
  real_le_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (z <= min(x, y)) == (z <= x && z <= y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_le_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_MIN")

///|
/// `REAL_LE_MIN`
pub fn real_le_min() -> @kernel.Thm {
  real_le_min_c.get()
}

///|
/// REAL_LT_MAX
fn step_121() -> Unit raise {
  real_lt_max_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (z < max(x, y)) == (z < x || z < y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_MAX")

///|
/// `REAL_LT_MAX`
pub fn real_lt_max() -> @kernel.Thm {
  real_lt_max_c.get()
}

///|
/// REAL_LT_MIN
fn step_122() -> Unit raise {
  real_lt_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (z < min(x, y)) == (z < x && z < y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_lt_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_MIN")

///|
/// `REAL_LT_MIN`
pub fn real_lt_min() -> @kernel.Thm {
  real_lt_min_c.get()
}

///|
/// REAL_MAX_LE
fn step_123() -> Unit raise {
  real_max_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (max(x, y) <= z) == (x <= z && y <= z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_LE")

///|
/// `REAL_MAX_LE`
pub fn real_max_le() -> @kernel.Thm {
  real_max_le_c.get()
}

///|
/// REAL_MIN_LE
fn step_124() -> Unit raise {
  real_min_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (min(x, y) <= z) == (x <= z || y <= z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_LE")

///|
/// `REAL_MIN_LE`
pub fn real_min_le() -> @kernel.Thm {
  real_min_le_c.get()
}

///|
/// REAL_MAX_LT
fn step_125() -> Unit raise {
  real_max_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (max(x, y) < z) == (x < z && y < z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_LT")

///|
/// `REAL_MAX_LT`
pub fn real_max_lt() -> @kernel.Thm {
  real_max_lt_c.get()
}

///|
/// REAL_MIN_LT
fn step_126() -> Unit raise {
  real_min_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (min(x, y) < z) == (x < z || y < z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_LT")

///|
/// `REAL_MIN_LT`
pub fn real_min_lt() -> @kernel.Thm {
  real_min_lt_c.get()
}

///|
/// REAL_MAX_ASSOC
fn step_127() -> Unit raise {
  real_max_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, max(x, max(y, z)) == max(max(x, y), z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_ASSOC")

///|
/// `REAL_MAX_ASSOC`
pub fn real_max_assoc() -> @kernel.Thm {
  real_max_assoc_c.get()
}

///|
/// REAL_MIN_ASSOC
fn step_128() -> Unit raise {
  real_min_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, min(x, min(y, z)) == min(min(x, y), z)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_ASSOC")

///|
/// `REAL_MIN_ASSOC`
pub fn real_min_assoc() -> @kernel.Thm {
  real_min_assoc_c.get()
}

///|
/// REAL_MAX_ACI
fn step_129() -> Unit raise {
  real_max_aci_c.set(
    @tactics.prove(
      @term_syntax.parse_term("max((x : Real), (y : Real)) == max(y, x) && max(max(x, y), (z : Real)) == max(x, max(y, z)) && max(x, max(y, z)) == max(y, max(x, z)) && max(x, x) == x && max(x, max(x, y)) == max(x, y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_max_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MAX_ACI")

///|
/// `REAL_MAX_ACI`
pub fn real_max_aci() -> @kernel.Thm {
  real_max_aci_c.get()
}

///|
/// REAL_MIN_ACI
fn step_130() -> Unit raise {
  real_min_aci_c.set(
    @tactics.prove(
      @term_syntax.parse_term("min((x : Real), (y : Real)) == min(y, x) && min(min(x, y), (z : Real)) == min(x, min(y, z)) && min(x, min(y, z)) == min(y, min(x, z)) && min(x, x) == x && min(x, min(x, y)) == min(x, y)"),
      real_arith_tac,
    ),
  )
}

///|
let real_min_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MIN_ACI")

///|
/// `REAL_MIN_ACI`
pub fn real_min_aci() -> @kernel.Thm {
  real_min_aci_c.get()
}

///|
/// REAL_LE_IMP
fn step_131() -> Unit raise {
  let pth = @simp.pure_once_rewrite_rule(@list.List([@theorems.imp_conj()]))(
    @realax.real_le_trans(),
  )
  real_le_imp_c.set(fn(x51 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x51
    let t52 = @bool.spec_all(th)
    @bool.gen_all(@drule.match_mp(pth)(t52))
  })
}

///|
let real_le_imp_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_LE_IMP",
)

///|
/// `REAL_LE_IMP`
pub fn real_le_imp(x : @kernel.Thm) -> @kernel.Thm raise {
  real_le_imp_c.get()(x)
}

///|
/// REAL_LET_IMP
fn step_132() -> Unit raise {
  let pth = @simp.pure_once_rewrite_rule(@list.List([@theorems.imp_conj()]))(
    @realarith.real_let_trans(),
  )
  real_let_imp_c.set(fn(x53 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x53
    let t54 = @bool.spec_all(th)
    @bool.gen_all(@drule.match_mp(pth)(t54))
  })
}

///|
let real_let_imp_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_LET_IMP",
)

///|
/// `REAL_LET_IMP`
pub fn real_let_imp(x : @kernel.Thm) -> @kernel.Thm raise {
  real_let_imp_c.get()(x)
}

///|
/// REAL_ABS_MUL
fn step_133() -> Unit raise {
  let t92 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_abs(),
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_neg_neg(),
    ]),
  )
  let t90 = @simp.gen_rewrite_tac(
    fn(
      x87 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s88 = @equal.land_conv(x87)
      fn(x89 : @kernel.Term) -> @kernel.Thm raise { s88(x89) }
    },
    @list.List([@equal.gsym(@calc_int.real_abs_neg())]),
  )
  let t91 = @list.List([
    @tactics.all_tac,
    @simp.gen_rewrite_tac(
      fn(
        x84 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s85 = @equal.land_conv(x84)
        fn(x86 : @kernel.Term) -> @kernel.Thm raise { s85(x86) }
      },
      @list.List([@equal.gsym(@calc_int.real_abs_neg())]),
    ),
    t90,
    @tactics.all_tac,
  ])
  let t83 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_neg_neg(),
    ]),
  )
  let t76 = @drule.match_mp(@realax.real_le_mul())
  let t82 = @tactics.assum_list(fn(
    x81 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x79 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x77 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x73 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s74 = @tactics.mp_tac(x73)
          fn(
            x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s74(x75)
          }
        })(t76(x77))
      })(
        ((x78 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x78))(
          x79,
        ),
      )
    })(
      (fn(x80 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
        @lib.rev(x80)
      })(x81),
    )
  })
  let t71 = @list.List([
    @tactics.all_tac,
    @simp.gen_rewrite_tac(
      fn(
        x70 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x64 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s65 = @equal.rand_conv(x64)
          fn(x66 : @kernel.Term) -> @kernel.Thm raise { s65(x66) }
        })(
          (fn(
            x67 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s68 = @equal.rand_conv(x67)
            fn(x69 : @kernel.Term) -> @kernel.Thm raise { s68(x69) }
          })(x70),
        )
      },
      @list.List([@equal.gsym(@calc_int.real_abs_neg())]),
    ),
  ])
  let t72 = @tactics.thenl(
    @tactics.disj_cases_tac(
      @bool.spec(@term_syntax.parse_term("(y : Real)"), @realarith.real_le_negtotal()),
    ),
    t71,
  )
  let t63 = @list.List([
    @tactics.all_tac,
    @simp.gen_rewrite_tac(
      fn(
        x62 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x56 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s57 = @equal.rand_conv(x56)
          fn(x58 : @kernel.Term) -> @kernel.Thm raise { s57(x58) }
        })(
          (fn(
            x59 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s60 = @equal.land_conv(x59)
            fn(x61 : @kernel.Term) -> @kernel.Thm raise { s60(x61) }
          })(x62),
        )
      },
      @list.List([@equal.gsym(@calc_int.real_abs_neg())]),
    ),
  ])
  let t55 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), @realarith.real_le_negtotal()),
  )
  let t93 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t55),
                t63,
              ),
              t72,
            ),
            t82,
          ),
          t83,
        ),
        @tactics.disch_tac,
      ),
      t91,
    ),
    t92,
  )
  real_abs_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x * y) == abs(x) * abs(y)"),
      t93,
    ),
  )
}

///|
let real_abs_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_MUL")

///|
/// `REAL_ABS_MUL`
pub fn real_abs_mul() -> @kernel.Thm {
  real_abs_mul_c.get()
}

///|
/// REAL_POW_LE
fn step_134() -> Unit raise {
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t97 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t96 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realarith.real_pos()]),
  )
  let t94 = @term_syntax.parse_term("(n : Num)")
  let t95 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t94)
  let t99 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t95),
          @nums.induct_tac,
        ),
        t96,
      ),
      t97,
    ),
    t98,
  )
  real_pow_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x → real_of_num(0) <= pow(x, n)"), t99),
  )
}

///|
let real_pow_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LE")

///|
/// `REAL_POW_LE`
pub fn real_pow_le() -> @kernel.Thm {
  real_pow_le_c.get()
}

///|
/// REAL_POW_LT
fn step_135() -> Unit raise {
  let t104 = @simp.asm_rewrite_tac(@list.List([]))
  let t103 = @tactics.match_mp_tac(real_lt_mul())
  let t102 = @simp.rewrite_tac(@list.List([@realax.real_pow(), real_lt_01()]))
  let t100 = @term_syntax.parse_term("(n : Num)")
  let t101 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t100)
  let t105 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t101),
          @nums.induct_tac,
        ),
        t102,
      ),
      t103,
    ),
    t104,
  )
  real_pow_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) < x → real_of_num(0) < pow(x, n)"), t105),
  )
}

///|
let real_pow_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LT")

///|
/// `REAL_POW_LT`
pub fn real_pow_lt() -> @kernel.Thm {
  real_pow_lt_c.get()
}

///|
/// REAL_ABS_POW
fn step_136() -> Unit raise {
  let t106 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @calc_int.real_abs_num(), real_abs_mul()]),
  )
  let t107 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t106,
  )
  real_abs_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, abs(pow(x, n)) == pow(abs(x), n)"),
      t107,
    ),
  )
}

///|
let real_abs_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_POW")

///|
/// `REAL_ABS_POW`
pub fn real_abs_pow() -> @kernel.Thm {
  real_abs_pow_c.get()
}

///|
/// REAL_LE_LMUL
fn step_137() -> Unit raise {
  let t108 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(real_sub_ldistrib()),
      real_sub_rzero(),
      @realax.real_le_mul(),
    ]),
  )
  let t109 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @realarith.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real)) == (real_of_num(0) <= y - x)")),
      ]),
    ),
    t108,
  )
  real_le_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= x && y <= z → x * y <= x * z"),
      t109,
    ),
  )
}

///|
let real_le_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LMUL")

///|
/// `REAL_LE_LMUL`
pub fn real_le_lmul() -> @kernel.Thm {
  real_le_lmul_c.get()
}

///|
/// REAL_LE_RMUL
fn step_138() -> Unit raise {
  let t110 = @meson.meson_tac(
    @list.List([@realax.real_mul_sym(), real_le_lmul()]),
  )
  real_le_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x <= y && real_of_num(0) <= z → x * z <= y * z"),
      t110,
    ),
  )
}

///|
let real_le_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_RMUL")

///|
/// `REAL_LE_RMUL`
pub fn real_le_rmul() -> @kernel.Thm {
  real_le_rmul_c.get()
}

///|
/// REAL_LT_LMUL
fn step_139() -> Unit raise {
  let t111 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(real_sub_ldistrib()),
      real_sub_rzero(),
      real_lt_mul(),
    ]),
  )
  let t112 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @realarith.real_arith(@term_syntax.parse_term("((x : Real) < (y : Real)) == (real_of_num(0) < y - x)")),
      ]),
    ),
    t111,
  )
  real_lt_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < x && y < z → x * y < x * z"),
      t112,
    ),
  )
}

///|
let real_lt_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LMUL")

///|
/// `REAL_LT_LMUL`
pub fn real_lt_lmul() -> @kernel.Thm {
  real_lt_lmul_c.get()
}

///|
/// REAL_LT_RMUL
fn step_140() -> Unit raise {
  let t113 = @meson.meson_tac(
    @list.List([@realax.real_mul_sym(), real_lt_lmul()]),
  )
  real_lt_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x < y && real_of_num(0) < z → x * z < y * z"),
      t113,
    ),
  )
}

///|
let real_lt_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_RMUL")

///|
/// `REAL_LT_RMUL`
pub fn real_lt_rmul() -> @kernel.Thm {
  real_lt_rmul_c.get()
}

///|
/// REAL_EQ_MUL_LCANCEL
fn step_141() -> Unit raise {
  let t115 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(real_sub_ldistrib()),
      @realarith.real_entire(),
      real_sub_rzero(),
    ]),
  )
  let t114 = @simp.once_rewrite_tac(
    @list.List([
      @realarith.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real)) == (x - y == real_of_num(0))")),
    ]),
  )
  let t116 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114),
    t115,
  )
  real_eq_mul_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x * y == x * z) == (x == real_of_num(0) || y == z)"),
      t116,
    ),
  )
}

///|
let real_eq_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_MUL_LCANCEL",
)

///|
/// `REAL_EQ_MUL_LCANCEL`
pub fn real_eq_mul_lcancel() -> @kernel.Thm {
  real_eq_mul_lcancel_c.get()
}

///|
/// REAL_EQ_MUL_RCANCEL
fn step_142() -> Unit raise {
  let t118 = @meson.meson_tac(@list.List([]))
  let t117 = @simp.rewrite_tac(@list.List([real_eq_mul_lcancel()]))
  let t119 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
      t117,
    ),
    t118,
  )
  real_eq_mul_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x * z == y * z) == (x == y || z == real_of_num(0))"),
      t119,
    ),
  )
}

///|
let real_eq_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_MUL_RCANCEL",
)

///|
/// `REAL_EQ_MUL_RCANCEL`
pub fn real_eq_mul_rcancel() -> @kernel.Thm {
  real_eq_mul_rcancel_c.get()
}

///|
/// REAL_MUL_LINV_UNIQ
fn step_143() -> Unit raise {
  let t134 = @tactics.disch_then(fn(
    x133 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s131 = @tactics.accept_tac(x130)
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
    })(@equal.sym(x133))
  })
  let t129 = @simp.asm_rewrite_tac(@list.List([real_eq_mul_rcancel()]))
  let t126 = @drule.match_mp(@realax.real_mul_linv())
  let t128 = @tactics.first_assum(fn(
    x127 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      })(@equal.sym(x125))
    })(t126(x127))
  })
  let t121 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_int.real_mul_rzero(),
      @realax.real_of_num_eq(),
      @calc_num.arith_eq(),
    ]),
  )
  let t120 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Real) == real_of_num(0)"))
  let t135 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t120),
          t121,
        ),
        t128,
      ),
      t129,
    ),
    t134,
  )
  real_mul_linv_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x * y == real_of_num(1) → inv(y) == x"),
      t135,
    ),
  )
}

///|
let real_mul_linv_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MUL_LINV_UNIQ",
)

///|
/// `REAL_MUL_LINV_UNIQ`
pub fn real_mul_linv_uniq() -> @kernel.Thm {
  real_mul_linv_uniq_c.get()
}

///|
/// REAL_MUL_RINV_UNIQ
fn step_144() -> Unit raise {
  let t136 = @tactics.match_accept_tac(real_mul_linv_uniq())
  let t137 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t136,
  )
  real_mul_rinv_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x * y == real_of_num(1) → inv(x) == y"),
      t137,
    ),
  )
}

///|
let real_mul_rinv_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MUL_RINV_UNIQ",
)

///|
/// `REAL_MUL_RINV_UNIQ`
pub fn real_mul_rinv_uniq() -> @kernel.Thm {
  real_mul_rinv_uniq_c.get()
}

///|
/// REAL_INV_INV
fn step_145() -> Unit raise {
  let t141 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t139 = @tactics.match_mp_tac(real_mul_rinv_uniq())
  let t138 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0()]))
  let t142 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)")),
          ),
          t138,
        ),
        t139,
      ),
      t140,
    ),
    t141,
  )
  real_inv_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, inv(inv(x)) == x"), t142),
  )
}

///|
let real_inv_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_INV")

///|
/// `REAL_INV_INV`
pub fn real_inv_inv() -> @kernel.Thm {
  real_inv_inv_c.get()
}

///|
/// REAL_EQ_INV2
fn step_146() -> Unit raise {
  let t143 = @meson.meson_tac(@list.List([real_inv_inv()]))
  real_eq_inv2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (inv(x) == inv(y)) == (x == y)"), t143),
  )
}

///|
let real_eq_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EQ_INV2")

///|
/// `REAL_EQ_INV2`
pub fn real_eq_inv2() -> @kernel.Thm {
  real_eq_inv2_c.get()
}

///|
/// REAL_INV_EQ_0
fn step_147() -> Unit raise {
  let t146 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0()]))
  let t145 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_inv_inv())]))
  let t144 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0()]))
  let t147 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
          @tactics.disch_tac,
        ),
        t144,
      ),
      t145,
    ),
    t146,
  )
  real_inv_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (inv(x) == real_of_num(0)) == (x == real_of_num(0))"), t147),
  )
}

///|
let real_inv_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_EQ_0")

///|
/// `REAL_INV_EQ_0`
pub fn real_inv_eq_0() -> @kernel.Thm {
  real_inv_eq_0_c.get()
}

///|
/// REAL_LT_INV
fn step_148() -> Unit raise {
  let t167 = @simp.rewrite_tac(
    @list.List([
      real_lt_rneg(),
      @realax.real_add_lid(),
      real_of_num_lt(),
      @calc_num.arith(),
    ]),
  )
  let t166 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (x : Real)"))
  let t168 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@realax.real_mul_linv()), t166),
      real_arith_tac,
    ),
    t167,
  ])
  let t165 = @tactics.subgoal_then(@term_syntax.parse_term("inv((x : Real)) * x == real_of_num(1)"), fn(
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
    let s163 = @tactics.subst1_tac(x162)
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  })
  let t158 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg()]))
  let t157 = @simp.asm_rewrite_tac(@list.List([]))
  let t159 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_lt_mul()), t157),
    t158,
  ])
  let t160 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < -inv((x : Real)) * x"), fn(
        x154 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s155 = @tactics.mp_tac(x154)
        fn(
          x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s155(x156)
        }
      }),
    ),
    t159,
  )
  let t153 = @simp.asm_rewrite_tac(@list.List([]))
  let t161 = @list.List([
    @tactics.then_tac(
      @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([real_inv_eq_0()]))),
      t153,
    ),
    t160,
  ])
  let t152 = @simp.asm_rewrite_tac(@list.List([]))
  let t151 = @bool.spec(@term_syntax.parse_term("inv((x : Real))"), real_lt_negtotal())
  let t169 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
              x148 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s149 = @tactics.assume_tac(x148)
              fn(
                x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s149(x150)
              }
            })(t151),
          ),
          t152,
        ),
        t161,
      ),
      t165,
    ),
    t168,
  )
  real_lt_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_of_num(0) < inv(x)"), t169),
  )
}

///|
let real_lt_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_INV")

///|
/// `REAL_LT_INV`
pub fn real_lt_inv() -> @kernel.Thm {
  real_lt_inv_c.get()
}

///|
/// REAL_LT_INV_EQ
fn step_149() -> Unit raise {
  let t176 = @simp.rewrite_tac(@list.List([real_lt_inv()]))
  let t175 = @simp.gen_rewrite_tac(
    (x174 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x171 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s172 = @equal.rand_conv(x171)
          fn(x173 : @kernel.Term) -> @kernel.Thm raise { s172(x173) }
        },
        x174,
      )
    },
    @list.List([@equal.gsym(real_inv_inv())]),
  )
  let t170 = @simp.rewrite_tac(@list.List([real_lt_inv()]))
  let t177 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
        t170,
      ),
      t175,
    ),
    t176,
  )
  real_lt_inv_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) < inv(x)) == (real_of_num(0) < x)"), t177),
  )
}

///|
let real_lt_inv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_INV_EQ")

///|
/// `REAL_LT_INV_EQ`
pub fn real_lt_inv_eq() -> @kernel.Thm {
  real_lt_inv_eq_c.get()
}

///|
/// REAL_INV_NEG
fn step_150() -> Unit raise {
  let t182 = @simp.asm_rewrite_tac(@list.List([]))
  let t181 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t180 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_neg_neg(),
    ]),
  )
  let t179 = @tactics.match_mp_tac(real_mul_linv_uniq())
  let t178 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_neg_0(), @realax.real_inv_0()]),
  )
  let t183 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)")),
            ),
            t178,
          ),
          t179,
        ),
        t180,
      ),
      t181,
    ),
    t182,
  )
  real_inv_neg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, inv(-x) == -inv(x)"), t183),
  )
}

///|
let real_inv_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_NEG")

///|
/// `REAL_INV_NEG`
pub fn real_inv_neg() -> @kernel.Thm {
  real_inv_neg_c.get()
}

///|
/// REAL_LE_INV_EQ
fn step_151() -> Unit raise {
  let t184 = @meson.meson_tac(@list.List([real_inv_eq_0()]))
  let t185 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@realarith.real_le_lt(), real_lt_inv_eq(), real_inv_eq_0()]),
    ),
    t184,
  )
  real_le_inv_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= inv(x)) == (real_of_num(0) <= x)"), t185),
  )
}

///|
let real_le_inv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_INV_EQ")

///|
/// `REAL_LE_INV_EQ`
pub fn real_le_inv_eq() -> @kernel.Thm {
  real_le_inv_eq_c.get()
}

///|
/// REAL_LE_INV
fn step_152() -> Unit raise {
  let t186 = @simp.rewrite_tac(@list.List([real_le_inv_eq()]))
  real_le_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → real_of_num(0) <= inv(x)"), t186),
  )
}

///|
let real_le_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_INV")

///|
/// `REAL_LE_INV`
pub fn real_le_inv() -> @kernel.Thm {
  real_le_inv_c.get()
}

///|
/// REAL_MUL_RINV
fn step_153() -> Unit raise {
  let t187 = @simp.rewrite_tac(@list.List([@realax.real_mul_linv()]))
  let t188 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t187,
  )
  real_mul_rinv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) → x * inv(x) == real_of_num(1)"),
      t188,
    ),
  )
}

///|
let real_mul_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RINV")

///|
/// `REAL_MUL_RINV`
pub fn real_mul_rinv() -> @kernel.Thm {
  real_mul_rinv_c.get()
}

///|
/// REAL_INV_1
fn step_154() -> Unit raise {
  let t189 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t190 = @tactics.then_tac(
    @tactics.match_mp_tac(real_mul_rinv_uniq()),
    t189,
  )
  real_inv_1_c.set(@tactics.prove(@term_syntax.parse_term("inv(real_of_num(1)) == real_of_num(1)"), t190))
}

///|
let real_inv_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_1")

///|
/// `REAL_INV_1`
pub fn real_inv_1() -> @kernel.Thm {
  real_inv_1_c.get()
}

///|
/// REAL_INV_EQ_1
fn step_155() -> Unit raise {
  let t191 = @meson.meson_tac(@list.List([real_inv_inv(), real_inv_1()]))
  real_inv_eq_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (inv(x) == real_of_num(1)) == (x == real_of_num(1))"), t191),
  )
}

///|
let real_inv_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_EQ_1")

///|
/// `REAL_INV_EQ_1`
pub fn real_inv_eq_1() -> @kernel.Thm {
  real_inv_eq_1_c.get()
}

///|
/// REAL_DIV_1
fn step_156() -> Unit raise {
  let t192 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_inv_1(), @realarith.real_mul_rid()]),
  )
  real_div_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, x / real_of_num(1) == x"), t192))
}

///|
let real_div_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_1")

///|
/// `REAL_DIV_1`
pub fn real_div_1() -> @kernel.Thm {
  real_div_1_c.get()
}

///|
/// REAL_DIV_REFL
fn step_157() -> Unit raise {
  let t193 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(@list.List([@realax.real_div(), real_mul_rinv()])),
  )
  real_div_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) → x / x == real_of_num(1)"), t193),
  )
}

///|
let real_div_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_REFL")

///|
/// `REAL_DIV_REFL`
pub fn real_div_refl() -> @kernel.Thm {
  real_div_refl_c.get()
}

///|
/// REAL_DIV_RMUL
fn step_158() -> Unit raise {
  let t194 = @simp.simp_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      @realax.real_mul_linv(),
      @realarith.real_mul_rid(),
    ]),
  )
  real_div_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(y == real_of_num(0)) → x / y * y == x"),
      t194,
    ),
  )
}

///|
let real_div_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_RMUL")

///|
/// `REAL_DIV_RMUL`
pub fn real_div_rmul() -> @kernel.Thm {
  real_div_rmul_c.get()
}

///|
/// REAL_DIV_LMUL
fn step_159() -> Unit raise {
  let t195 = @simp.rewrite_tac(@list.List([real_div_rmul()]))
  let t196 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t195,
  )
  real_div_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(y == real_of_num(0)) → y * (x / y) == x"),
      t196,
    ),
  )
}

///|
let real_div_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_LMUL")

///|
/// `REAL_DIV_LMUL`
pub fn real_div_lmul() -> @kernel.Thm {
  real_div_lmul_c.get()
}

///|
/// REAL_DIV_EQ_1
fn step_160() -> Unit raise {
  let t211 = @simp.asm_simp_tac(
    @list.List([real_div_lmul(), @realarith.real_mul_rid()]),
  )
  let t207 = @term_syntax.parse_term("op_star((y : Real))")
  let t210 = @tactics.disch_then(fn(
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
      let s205 = @tactics.mp_tac(x204)
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
    })(((x208 : @kernel.Thm) => @equal.ap_term(t207, x208))(x209))
  })
  let t203 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@realax.real_div()), real_div_refl()]),
  )
  let t202 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @calc_num.arith()]),
  )
  let t201 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_inv_0(), @calc_int.real_mul_rzero()]),
  )
  let t200 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Real) == real_of_num(0)"))
  let t199 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero()]))
  let t198 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t197 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t212 = @tactics.then_tac(
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
                      t197,
                    ),
                    t198,
                  ),
                  t199,
                ),
                t200,
              ),
              t201,
            ),
            t202,
          ),
          @tactics.eq_tac,
        ),
        t203,
      ),
      t210,
    ),
    t211,
  )
  real_div_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / y == real_of_num(1)) == (x == y && !(x == real_of_num(0)) && !(y == real_of_num(0)))"),
      t212,
    ),
  )
}

///|
let real_div_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_EQ_1")

///|
/// `REAL_DIV_EQ_1`
pub fn real_div_eq_1() -> @kernel.Thm {
  real_div_eq_1_c.get()
}

///|
/// REAL_ABS_INV
fn step_161() -> Unit raise {
  let t223 = @simp.rewrite_tac(@list.List([real_abs_1()]))
  let t220 = @drule.match_mp(real_mul_rinv())
  let t222 = @tactics.pop_assum(fn(
    x221 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x217 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s218 = @tactics.subst1_tac(x217)
      fn(
        x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s218(x219)
      }
    })(t220(x221))
  })
  let t216 = @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_mul())]))
  let t215 = @tactics.match_mp_tac(real_mul_rinv_uniq())
  let t214 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_inv_0(), real_abs_0()]),
  )
  let t213 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t224 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.conv_tac(@equal.sym_conv),
              ),
              t213,
            ),
            t214,
          ),
          t215,
        ),
        t216,
      ),
      t222,
    ),
    t223,
  )
  real_abs_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(inv(x)) == inv(abs(x))"), t224),
  )
}

///|
let real_abs_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_INV")

///|
/// `REAL_ABS_INV`
pub fn real_abs_inv() -> @kernel.Thm {
  real_abs_inv_c.get()
}

///|
/// REAL_ABS_DIV
fn step_162() -> Unit raise {
  let t225 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_abs_inv(), real_abs_mul()]),
  )
  real_abs_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(x / y) == abs(x) / abs(y)"),
      t225,
    ),
  )
}

///|
let real_abs_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_DIV")

///|
/// `REAL_ABS_DIV`
pub fn real_abs_div() -> @kernel.Thm {
  real_abs_div_c.get()
}

///|
/// REAL_INV_MUL
fn step_163() -> Unit raise {
  let t238 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t235 = @drule.match_mp(@realax.real_mul_linv())
  let t237 = @tactics.every_assum(fn(
    x236 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
    })(t235(x236))
  })
  let t230 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)")
  let t231 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(real_mul_ac())(t230)]),
  )
  let t229 = @tactics.match_mp_tac(real_mul_linv_uniq())
  let t228 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_inv_0(),
      @calc_int.real_mul_lzero(),
      @calc_int.real_mul_rzero(),
    ]),
  )
  let t226 = @term_syntax.parse_term("(y : Real) == real_of_num(0)")
  let t227 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(x : Real) == real_of_num(0)"), t226]),
  )
  let t239 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t227),
            t228,
          ),
          t229,
        ),
        t231,
      ),
      t237,
    ),
    t238,
  )
  real_inv_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, inv(x * y) == inv(x) * inv(y)"),
      t239,
    ),
  )
}

///|
let real_inv_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_MUL")

///|
/// `REAL_INV_MUL`
pub fn real_inv_mul() -> @kernel.Thm {
  real_inv_mul_c.get()
}

///|
/// REAL_INV_DIV
fn step_164() -> Unit raise {
  let t240 = @tactics.match_accept_tac(@realax.real_mul_sym())
  let t241 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@realax.real_div(), real_inv_inv(), real_inv_mul()]),
    ),
    t240,
  )
  real_inv_div_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, inv(x / y) == y / x"), t241),
  )
}

///|
let real_inv_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_DIV")

///|
/// `REAL_INV_DIV`
pub fn real_inv_div() -> @kernel.Thm {
  real_inv_div_c.get()
}

///|
/// REAL_POW_MUL
fn step_165() -> Unit raise {
  let t242 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @realax.real_mul_lid(), real_mul_ac()]),
  )
  let t243 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t242,
  )
  real_pow_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ n : Num, pow(x * y, n) == pow(x, n) * pow(y, n)"),
      t243,
    ),
  )
}

///|
let real_pow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_MUL")

///|
/// `REAL_POW_MUL`
pub fn real_pow_mul() -> @kernel.Thm {
  real_pow_mul_c.get()
}

///|
/// REAL_POW_INV
fn step_166() -> Unit raise {
  let t244 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), real_inv_1(), real_inv_mul()]),
  )
  let t245 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t244,
  )
  real_pow_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, pow(inv(x), n) == inv(pow(x, n))"),
      t245,
    ),
  )
}

///|
let real_pow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_INV")

///|
/// `REAL_POW_INV`
pub fn real_pow_inv() -> @kernel.Thm {
  real_pow_inv_c.get()
}

///|
/// REAL_INV_POW
fn step_167() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([real_pow_inv()]))
  real_inv_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, inv(pow(x, n)) == pow(inv(x), n)"),
      t246,
    ),
  )
}

///|
let real_inv_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_POW")

///|
/// `REAL_INV_POW`
pub fn real_inv_pow() -> @kernel.Thm {
  real_inv_pow_c.get()
}

///|
/// REAL_POW_DIV
fn step_168() -> Unit raise {
  let t247 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_pow_mul(), real_pow_inv()]),
  )
  real_pow_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ n : Num, pow(x / y, n) == pow(x, n) / pow(y, n)"),
      t247,
    ),
  )
}

///|
let real_pow_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_DIV")

///|
/// `REAL_POW_DIV`
pub fn real_pow_div() -> @kernel.Thm {
  real_pow_div_c.get()
}

///|
/// REAL_DIV_EQ_0
fn step_169() -> Unit raise {
  let t248 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_inv_eq_0(), @realarith.real_entire()]),
  )
  real_div_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / y == real_of_num(0)) == (x == real_of_num(0) || y == real_of_num(0))"),
      t248,
    ),
  )
}

///|
let real_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_EQ_0")

///|
/// `REAL_DIV_EQ_0`
pub fn real_div_eq_0() -> @kernel.Thm {
  real_div_eq_0_c.get()
}

///|
/// REAL_POW_ADD
fn step_170() -> Unit raise {
  let t249 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.add_clauses(),
      @realax.real_pow(),
      @realax.real_mul_lid(),
      @realax.real_mul_assoc(),
    ]),
  )
  let t250 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t249,
  )
  real_pow_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, pow(x, m + n) == pow(x, m) * pow(x, n)"),
      t250,
    ),
  )
}

///|
let real_pow_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_ADD")

///|
/// `REAL_POW_ADD`
pub fn real_pow_add() -> @kernel.Thm {
  real_pow_add_c.get()
}

///|
/// REAL_POW_NZ
fn step_171() -> Unit raise {
  let t252 = @meson.asm_meson_tac(@list.List([@realarith.real_entire()]))
  let t251 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realax.real_of_num_eq(), @calc_num.arith()]),
  )
  let t253 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t251,
    ),
    t252,
  )
  real_pow_nz_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, !(x == real_of_num(0)) → !(pow(x, n) == real_of_num(0))"),
      t253,
    ),
  )
}

///|
let real_pow_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_NZ")

///|
/// `REAL_POW_NZ`
pub fn real_pow_nz() -> @kernel.Thm {
  real_pow_nz_c.get()
}

///|
/// REAL_POW_SUB
fn step_172() -> Unit raise {
  let t278 = @simp.asm_rewrite_tac(@list.List([]))
  let t277 = @tactics.match_mp_tac(real_pow_nz())
  let t276 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t275 = @tactics.conv_tac(@equal.sym_conv)
  let t274 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t273 = @simp.gen_rewrite_tac(
    fn(
      x270 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s271 = @equal.land_conv(x270)
      fn(x272 : @kernel.Term) -> @kernel.Thm raise { s271(x272) }
    },
    @list.List([@equal.gsym(@realax.real_mul_lid())]),
  )
  let t269 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t268 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t267 = @simp.rewrite_tac(@list.List([real_pow_add()]))
  let t266 = @simp.rewrite_tac(@list.List([@arith.add_sub2()]))
  let t265 = @tactics.disch_then(
    @tactics.choose_then(fn(
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
      let s263 = @tactics.subst1_tac(x262)
      fn(
        x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s263(x264)
      }
    }),
  )
  let t261 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t260 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s255 = @tactics.assume_tac(x254)
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
      },
      fn(
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
      },
    ),
  )
  let t279 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
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
                                t260,
                              ),
                              t261,
                            ),
                            t265,
                          ),
                          t266,
                        ),
                        t267,
                      ),
                      t268,
                    ),
                    t269,
                  ),
                  t273,
                ),
                t274,
              ),
              @tactics.ap_thm_tac,
            ),
            @tactics.ap_term_tac,
          ),
          t275,
        ),
        t276,
      ),
      t277,
    ),
    t278,
  )
  real_pow_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, !(x == real_of_num(0)) && m <= n → pow(x, n - m) == pow(x, n) / pow(x, m)"),
      t279,
    ),
  )
}

///|
let real_pow_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_SUB")

///|
/// `REAL_POW_SUB`
pub fn real_pow_sub() -> @kernel.Thm {
  real_pow_sub_c.get()
}

///|
/// REAL_LT_LCANCEL_IMP
fn step_173() -> Unit raise {
  let t310 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_mul_assoc(), @realax.real_mul_lid()]),
  )
  let t307 = @drule.match_mp(real_lt_imp_nz())
  let t305 = @drule.match_mp(@realax.real_mul_linv())
  let t309 = @tactics.pop_assum(fn(
    x308 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      (fn(
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
        let s303 = @tactics.assume_tac(x302)
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
      })(t305(x306))
    })(t307(x308))
  })
  let t299 = @drule.match_mp(real_lt_lmul())
  let t301 = @tactics.disch_then(fn(
    x300 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s297 = @tactics.mp_tac(x296)
      fn(
        x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s297(x298)
      }
    })(t299(x300))
  })
  let t290 = @drule.match_mp(real_lt_inv())
  let t295 = @tactics.disch_then(fn(
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
    (fn(
      x293 : (@kernel.Thm, @kernel.Thm),
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x288 : (@kernel.Thm, @kernel.Thm),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x284 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s285 = @tactics.mp_tac(x284)
          fn(
            x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s285(x286)
          }
        })(
          ((x287 : (@kernel.Thm, @kernel.Thm)) => @lib.uncurry(@bool.conj, x287))(
            x288,
          ),
        )
      })(
        (fn(
          x291 : (@kernel.Thm, @kernel.Thm),
        ) -> (@kernel.Thm, @kernel.Thm) raise {
          let t292 = (fn(x289 : @kernel.Thm) -> @kernel.Thm raise { x289 })(
            x291.1,
          )
          (t290(x291.0), t292)
        })(x293),
      )
    })(@bool.conj_pair(x294))
  })
  let t283 = @tactics.disch_then(fn(
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
    let t282 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(@bool.conjunct1(th)), t282)
  })
  let t311 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t283),
          t295,
        ),
        t301,
      ),
      t309,
    ),
    t310,
  )
  real_lt_lcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < x && x * y < x * z → y < z"),
      t311,
    ),
  )
}

///|
let real_lt_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_LCANCEL_IMP",
)

///|
/// `REAL_LT_LCANCEL_IMP`
pub fn real_lt_lcancel_imp() -> @kernel.Thm {
  real_lt_lcancel_imp_c.get()
}

///|
/// REAL_LT_RCANCEL_IMP
fn step_174() -> Unit raise {
  let t312 = @simp.rewrite_tac(@list.List([real_lt_lcancel_imp()]))
  let t313 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t312,
  )
  real_lt_rcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z && x * z < y * z → x < y"),
      t313,
    ),
  )
}

///|
let real_lt_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_RCANCEL_IMP",
)

///|
/// `REAL_LT_RCANCEL_IMP`
pub fn real_lt_rcancel_imp() -> @kernel.Thm {
  real_lt_rcancel_imp_c.get()
}

///|
/// REAL_LE_LCANCEL_IMP
fn step_175() -> Unit raise {
  let t320 = @simp.asm_rewrite_tac(@list.List([]))
  let t319 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t318 = @tactics.match_mp_tac(real_lt_lcancel_imp())
  let t317 = @simp.asm_rewrite_tac(@list.List([]))
  let t316 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t315 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t314 = @simp.rewrite_tac(
    @list.List([@realarith.real_le_lt(), real_eq_mul_lcancel()]),
  )
  let t321 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t314),
                  t315,
                ),
                t316,
              ),
              @tactics.strip_tac,
            ),
            t317,
          ),
          @tactics.disj1_tac,
        ),
        t318,
      ),
      t319,
    ),
    t320,
  )
  real_le_lcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < x && x * y <= x * z → y <= z"),
      t321,
    ),
  )
}

///|
let real_le_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_LCANCEL_IMP",
)

///|
/// `REAL_LE_LCANCEL_IMP`
pub fn real_le_lcancel_imp() -> @kernel.Thm {
  real_le_lcancel_imp_c.get()
}

///|
/// REAL_LE_RCANCEL_IMP
fn step_176() -> Unit raise {
  let t322 = @simp.rewrite_tac(@list.List([real_le_lcancel_imp()]))
  let t323 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t322,
  )
  real_le_rcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z && x * z <= y * z → x <= y"),
      t323,
    ),
  )
}

///|
let real_le_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_RCANCEL_IMP",
)

///|
/// `REAL_LE_RCANCEL_IMP`
pub fn real_le_rcancel_imp() -> @kernel.Thm {
  real_le_rcancel_imp_c.get()
}

///|
/// REAL_LE_RMUL_EQ
fn step_177() -> Unit raise {
  let t324 = @meson.meson_tac(
    @list.List([
      real_le_rmul(),
      real_le_rcancel_imp(),
      @realarith.real_lt_imp_le(),
    ]),
  )
  real_le_rmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x * z <= y * z) == (x <= y)"),
      t324,
    ),
  )
}

///|
let real_le_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_RMUL_EQ",
)

///|
/// `REAL_LE_RMUL_EQ`
pub fn real_le_rmul_eq() -> @kernel.Thm {
  real_le_rmul_eq_c.get()
}

///|
/// REAL_LE_LMUL_EQ
fn step_178() -> Unit raise {
  let t325 = @meson.meson_tac(
    @list.List([real_le_rmul_eq(), @realax.real_mul_sym()]),
  )
  real_le_lmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (z * x <= z * y) == (x <= y)"),
      t325,
    ),
  )
}

///|
let real_le_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_LMUL_EQ",
)

///|
/// `REAL_LE_LMUL_EQ`
pub fn real_le_lmul_eq() -> @kernel.Thm {
  real_le_lmul_eq_c.get()
}

///|
/// REAL_LT_RMUL_EQ
fn step_179() -> Unit raise {
  let t326 = @simp.simp_tac(
    @list.List([@equal.gsym(real_not_le()), real_le_rmul_eq()]),
  )
  real_lt_rmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x * z < y * z) == (x < y)"),
      t326,
    ),
  )
}

///|
let real_lt_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_RMUL_EQ",
)

///|
/// `REAL_LT_RMUL_EQ`
pub fn real_lt_rmul_eq() -> @kernel.Thm {
  real_lt_rmul_eq_c.get()
}

///|
/// REAL_LT_LMUL_EQ
fn step_180() -> Unit raise {
  let t327 = @simp.simp_tac(
    @list.List([@equal.gsym(real_not_le()), real_le_lmul_eq()]),
  )
  real_lt_lmul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (z * x < z * y) == (x < y)"),
      t327,
    ),
  )
}

///|
let real_lt_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_LMUL_EQ",
)

///|
/// `REAL_LT_LMUL_EQ`
pub fn real_lt_lmul_eq() -> @kernel.Thm {
  real_lt_lmul_eq_c.get()
}

///|
/// REAL_LE_MUL_EQ
fn step_181() -> Unit raise {
  let t328 = @meson.meson_tac(
    @list.List([
      real_le_lmul_eq(),
      real_le_rmul_eq(),
      @calc_int.real_mul_lzero(),
      @calc_int.real_mul_rzero(),
    ]),
  )
  real_le_mul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, real_of_num(0) < x → (real_of_num(0) <= x * y) == (real_of_num(0) <= y)) && (∀ x : Real, ∀ y : Real, real_of_num(0) < y → (real_of_num(0) <= x * y) == (real_of_num(0) <= x))"),
      t328,
    ),
  )
}

///|
let real_le_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_MUL_EQ")

///|
/// `REAL_LE_MUL_EQ`
pub fn real_le_mul_eq() -> @kernel.Thm {
  real_le_mul_eq_c.get()
}

///|
/// REAL_LT_MUL_EQ
fn step_182() -> Unit raise {
  let t329 = @meson.meson_tac(
    @list.List([
      real_lt_lmul_eq(),
      real_lt_rmul_eq(),
      @calc_int.real_mul_lzero(),
      @calc_int.real_mul_rzero(),
    ]),
  )
  real_lt_mul_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, real_of_num(0) < x → (real_of_num(0) < x * y) == (real_of_num(0) < y)) && (∀ x : Real, ∀ y : Real, real_of_num(0) < y → (real_of_num(0) < x * y) == (real_of_num(0) < x))"),
      t329,
    ),
  )
}

///|
let real_lt_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_MUL_EQ")

///|
/// `REAL_LT_MUL_EQ`
pub fn real_lt_mul_eq() -> @kernel.Thm {
  real_lt_mul_eq_c.get()
}

///|
/// REAL_MUL_POS_LT
fn step_183() -> Unit raise {
  let t344 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x341 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s342 = @tactics.mp_tac(x341)
      fn(
        x343 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s342(x343)
      }
    }),
  )
  let t336 = @drule.match_mp(real_lt_mul())
  let t340 = @tactics.assum_list(fn(
    x339 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      (fn(
        x333 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s334 = @tactics.mp_tac(x333)
        fn(
          x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s334(x335)
        }
      })(t336(x337))
    })(
      ((x338 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x338))(
        x339,
      ),
    )
  })
  let t332 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_int.real_mul_lzero(),
      @calc_int.real_mul_rzero(),
      @realarith.real_lt_refl(),
    ]),
  )
  let t331 = @tactics.strip_assume_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real)"), real_lt_negtotal()),
  )
  let t330 = @tactics.strip_assume_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), real_lt_negtotal()),
  )
  let t345 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t330),
            t331,
          ),
          t332,
        ),
        t340,
      ),
      t344,
    ),
    real_arith_tac,
  )
  real_mul_pos_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) < x * y) == (real_of_num(0) < x && real_of_num(0) < y || x < real_of_num(0) && y < real_of_num(0))"),
      t345,
    ),
  )
}

///|
let real_mul_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MUL_POS_LT",
)

///|
/// `REAL_MUL_POS_LT`
pub fn real_mul_pos_lt() -> @kernel.Thm {
  real_mul_pos_lt_c.get()
}

///|
/// REAL_MUL_POS_LE
fn step_184() -> Unit raise {
  let t346 = @simp.rewrite_tac(
    @list.List([real_mul_pos_lt(), @realarith.real_entire()]),
  )
  let t347 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @realarith.real_arith(
            @term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (x == real_of_num(0) || real_of_num(0) < x)"),
          ),
        ]),
      ),
      t346,
    ),
    real_arith_tac,
  )
  real_mul_pos_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) <= x * y) == (x == real_of_num(0) || y == real_of_num(0) || real_of_num(0) < x && real_of_num(0) < y || x < real_of_num(0) && y < real_of_num(0))"),
      t347,
    ),
  )
}

///|
let real_mul_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MUL_POS_LE",
)

///|
/// `REAL_MUL_POS_LE`
pub fn real_mul_pos_le() -> @kernel.Thm {
  real_mul_pos_le_c.get()
}

///|
/// REAL_LE_RDIV_EQ
fn step_185() -> Unit raise {
  let t354 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      @realax.real_mul_linv(),
      @realarith.real_mul_rid(),
      real_lt_imp_nz(),
    ]),
  )
  let t353 = @tactics.first_assum(fn(
    x348 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x348
    @simp.gen_rewrite_tac(
      fn(
        x350 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s351 = @equal.land_conv(x350)
        fn(x352 : @kernel.Term) -> @kernel.Thm raise { s351(x352) }
      },
      @list.List([@equal.gsym(@drule.match_mp(real_le_rmul_eq())(th))]),
    )
  })
  let t355 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t353),
    t354,
  )
  real_le_rdiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x <= y / z) == (x * z <= y)"),
      t355,
    ),
  )
}

///|
let real_le_rdiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_RDIV_EQ",
)

///|
/// `REAL_LE_RDIV_EQ`
pub fn real_le_rdiv_eq() -> @kernel.Thm {
  real_le_rdiv_eq_c.get()
}

///|
/// REAL_LE_LDIV_EQ
fn step_186() -> Unit raise {
  let t362 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      @realax.real_mul_linv(),
      @realarith.real_mul_rid(),
      real_lt_imp_nz(),
    ]),
  )
  let t361 = @tactics.first_assum(fn(
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
    let th = x356
    @simp.gen_rewrite_tac(
      fn(
        x358 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s359 = @equal.land_conv(x358)
        fn(x360 : @kernel.Term) -> @kernel.Thm raise { s359(x360) }
      },
      @list.List([@equal.gsym(@drule.match_mp(real_le_rmul_eq())(th))]),
    )
  })
  let t363 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t361),
    t362,
  )
  real_le_ldiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x / z <= y) == (x <= y * z)"),
      t363,
    ),
  )
}

///|
let real_le_ldiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_LDIV_EQ",
)

///|
/// `REAL_LE_LDIV_EQ`
pub fn real_le_ldiv_eq() -> @kernel.Thm {
  real_le_ldiv_eq_c.get()
}

///|
/// REAL_LT_RDIV_EQ
fn step_187() -> Unit raise {
  let t364 = @simp.simp_tac(
    @list.List([@equal.gsym(real_not_le()), real_le_ldiv_eq()]),
  )
  real_lt_rdiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x < y / z) == (x * z < y)"),
      t364,
    ),
  )
}

///|
let real_lt_rdiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_RDIV_EQ",
)

///|
/// `REAL_LT_RDIV_EQ`
pub fn real_lt_rdiv_eq() -> @kernel.Thm {
  real_lt_rdiv_eq_c.get()
}

///|
/// REAL_LT_LDIV_EQ
fn step_188() -> Unit raise {
  let t365 = @simp.simp_tac(
    @list.List([@equal.gsym(real_not_le()), real_le_rdiv_eq()]),
  )
  real_lt_ldiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x / z < y) == (x < y * z)"),
      t365,
    ),
  )
}

///|
let real_lt_ldiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_LDIV_EQ",
)

///|
/// `REAL_LT_LDIV_EQ`
pub fn real_lt_ldiv_eq() -> @kernel.Thm {
  real_lt_ldiv_eq_c.get()
}

///|
/// REAL_EQ_RDIV_EQ
fn step_189() -> Unit raise {
  let t366 = @simp.simp_tac(@list.List([real_le_rdiv_eq(), real_le_ldiv_eq()]))
  let t367 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())])),
    t366,
  )
  real_eq_rdiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x == y / z) == (x * z == y)"),
      t367,
    ),
  )
}

///|
let real_eq_rdiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_RDIV_EQ",
)

///|
/// `REAL_EQ_RDIV_EQ`
pub fn real_eq_rdiv_eq() -> @kernel.Thm {
  real_eq_rdiv_eq_c.get()
}

///|
/// REAL_EQ_LDIV_EQ
fn step_190() -> Unit raise {
  let t368 = @simp.simp_tac(@list.List([real_le_rdiv_eq(), real_le_ldiv_eq()]))
  let t369 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())])),
    t368,
  )
  real_eq_ldiv_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x / z == y) == (x == y * z)"),
      t369,
    ),
  )
}

///|
let real_eq_ldiv_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_LDIV_EQ",
)

///|
/// `REAL_EQ_LDIV_EQ`
pub fn real_eq_ldiv_eq() -> @kernel.Thm {
  real_eq_ldiv_eq_c.get()
}

///|
/// REAL_LT_DIV2_EQ
fn step_191() -> Unit raise {
  let t370 = @simp.simp_tac(
    @list.List([@realax.real_div(), real_lt_rmul_eq(), real_lt_inv_eq()]),
  )
  real_lt_div2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x / z < y / z) == (x < y)"),
      t370,
    ),
  )
}

///|
let real_lt_div2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_DIV2_EQ",
)

///|
/// `REAL_LT_DIV2_EQ`
pub fn real_lt_div2_eq() -> @kernel.Thm {
  real_lt_div2_eq_c.get()
}

///|
/// REAL_LE_DIV2_EQ
fn step_192() -> Unit raise {
  let t371 = @simp.simp_tac(
    @list.List([@realax.real_div(), real_le_rmul_eq(), real_lt_inv_eq()]),
  )
  real_le_div2_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z → (x / z <= y / z) == (x <= y)"),
      t371,
    ),
  )
}

///|
let real_le_div2_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_DIV2_EQ",
)

///|
/// `REAL_LE_DIV2_EQ`
pub fn real_le_div2_eq() -> @kernel.Thm {
  real_le_div2_eq_c.get()
}

///|
/// REAL_MUL_2
fn step_193() -> Unit raise {
  real_mul_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(2) * x == x + x"), real_arith_tac),
  )
}

///|
let real_mul_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_2")

///|
/// `REAL_MUL_2`
pub fn real_mul_2() -> @kernel.Thm {
  real_mul_2_c.get()
}

///|
/// REAL_POW_EQ_0
fn step_194() -> Unit raise {
  let t373 = @list.List([real_arith_tac, @tactics.conv_tac(@class.taut)])
  let t372 = @simp.asm_rewrite_tac(
    @list.List([@nums.not_suc(), @realax.real_pow(), @realarith.real_entire()]),
  )
  let t374 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t372,
    ),
    t373,
  )
  real_pow_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, (pow(x, n) == real_of_num(0)) == (x == real_of_num(0) && !(n == 0))"),
      t374,
    ),
  )
}

///|
let real_pow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_EQ_0")

///|
/// `REAL_POW_EQ_0`
pub fn real_pow_eq_0() -> @kernel.Thm {
  real_pow_eq_0_c.get()
}

///|
/// REAL_LE_MUL2
fn step_195() -> Unit raise {
  let t382 = @simp.asm_rewrite_tac(@list.List([]))
  let t381 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real)"))
  let t380 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t379 = @simp.asm_rewrite_tac(@list.List([]))
  let t377 = @tactics.match_mp_tac(real_le_rmul())
  let t378 = @list.List([@tactics.match_mp_tac(real_le_lmul()), t377])
  let t376 = @tactics.exists_tac(@term_syntax.parse_term("(w : Real) * (z : Real)"))
  let t375 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t383 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t375),
                t376,
              ),
              @tactics.conj_tac,
            ),
            t378,
          ),
          t379,
        ),
        t380,
      ),
      t381,
    ),
    t382,
  )
  real_le_mul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= w && w <= x && real_of_num(0) <= y && y <= z → w * y <= x * z"),
      t383,
    ),
  )
}

///|
let real_le_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_MUL2")

///|
/// `REAL_LE_MUL2`
pub fn real_le_mul2() -> @kernel.Thm {
  real_le_mul2_c.get()
}

///|
/// REAL_LT_MUL2
fn step_196() -> Unit raise {
  let t391 = @simp.asm_rewrite_tac(@list.List([]))
  let t390 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real)"))
  let t392 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@realarith.real_let_trans()), t390),
    t391,
  )
  let t389 = @simp.asm_rewrite_tac(@list.List([]))
  let t393 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@realarith.real_lt_imp_le()), t389),
    t392,
  ])
  let t388 = @simp.asm_rewrite_tac(@list.List([]))
  let t386 = @tactics.match_mp_tac(real_lt_rmul())
  let t387 = @list.List([@tactics.match_mp_tac(real_le_lmul()), t386])
  let t385 = @tactics.exists_tac(@term_syntax.parse_term("(w : Real) * (z : Real)"))
  let t384 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t394 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t384),
            t385,
          ),
          @tactics.conj_tac,
        ),
        t387,
      ),
      t388,
    ),
    t393,
  )
  real_lt_mul2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= w && w < x && real_of_num(0) <= y && y < z → w * y < x * z"),
      t394,
    ),
  )
}

///|
let real_lt_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_MUL2")

///|
/// `REAL_LT_MUL2`
pub fn real_lt_mul2() -> @kernel.Thm {
  real_lt_mul2_c.get()
}

///|
/// REAL_LT_SQUARE
fn step_197() -> Unit raise {
  let t403 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t402 = @simp.gen_rewrite_tac(
    fn(
      x401 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x395 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s396 = @equal.land_conv(x395)
        fn(x397 : @kernel.Term) -> @kernel.Thm raise { s396(x397) }
      })(
        (fn(
          x398 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s399 = @equal.rand_conv(x398)
          fn(x400 : @kernel.Term) -> @kernel.Thm raise { s399(x400) }
        })(x401),
      )
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t404 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([@realarith.real_lt_le(), @realarith.real_le_square()]),
        ),
      ),
      t402,
    ),
    t403,
  )
  real_lt_square_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) < x * x) == !(x == real_of_num(0))"), t404),
  )
}

///|
let real_lt_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_SQUARE")

///|
/// `REAL_LT_SQUARE`
pub fn real_lt_square() -> @kernel.Thm {
  real_lt_square_c.get()
}

///|
/// REAL_POW_1
fn step_198() -> Unit raise {
  let t405 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realarith.real_mul_rid()]),
  )
  let t406 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))])),
    t405,
  )
  real_pow_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, pow(x, 1) == x"), t406))
}

///|
let real_pow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_1")

///|
/// `REAL_POW_1`
pub fn real_pow_1() -> @kernel.Thm {
  real_pow_1_c.get()
}

///|
/// REAL_POW_ONE
fn step_199() -> Unit raise {
  let t407 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([@realax.real_pow(), @realax.real_mul_lid()]),
    ),
  )
  real_pow_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, pow(real_of_num(1), n) == real_of_num(1)"), t407),
  )
}

///|
let real_pow_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_ONE")

///|
/// `REAL_POW_ONE`
pub fn real_pow_one() -> @kernel.Thm {
  real_pow_one_c.get()
}

///|
/// REAL_LT_INV2
fn step_200() -> Unit raise {
  let t433 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@realax.real_mul_assoc()),
      @realarith.real_mul_rid(),
    ]),
  )
  let t432 = @simp.gen_rewrite_tac(
    fn(
      x431 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x425 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s426 = @equal.land_conv(x425)
        fn(x427 : @kernel.Term) -> @kernel.Thm raise { s426(x427) }
      })(
        (fn(
          x428 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s429 = @equal.land_conv(x428)
          fn(x430 : @kernel.Term) -> @kernel.Thm raise { s429(x430) }
        })(x431),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t434 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@realax.real_mul_assoc(), @realax.real_mul_lid()]),
      ),
      t432,
    ),
    t433,
  )
  let t424 = @tactics.pop_assum_list(fn(
    x423 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s420 = @tactics.mp_tac(x419)
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
    })(
      ((x422 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x422))(
        x423,
      ),
    )
  })
  let t435 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.conj_tac,
          @tactics.match_mp_tac(@realax.real_mul_linv()),
        ),
        t424,
      ),
      real_arith_tac,
    ),
    t434,
  ])
  let t436 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("inv((x : Real)) * x == real_of_num(1) && inv((y : Real)) * y == real_of_num(1)"),
      fn(
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
        let s417 = @tactics.assume_tac(x416)
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
      },
    ),
    t435,
  )
  let t415 = @tactics.pop_assum_list(fn(
    x414 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x410 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s411 = @tactics.mp_tac(x410)
      fn(
        x412 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s411(x412)
      }
    })(
      ((x413 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x413))(
        x414,
      ),
    )
  })
  let t437 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(real_lt_mul()), t415),
      real_arith_tac,
    ),
    t436,
  ])
  let t409 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) * (y : Real)"))
  let t408 = @tactics.match_mp_tac(real_lt_rcancel_imp())
  let t438 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t408),
        t409,
      ),
      @tactics.conj_tac,
    ),
    t437,
  )
  real_lt_inv2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && x < y → inv(y) < inv(x)"),
      t438,
    ),
  )
}

///|
let real_lt_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_INV2")

///|
/// `REAL_LT_INV2`
pub fn real_lt_inv2() -> @kernel.Thm {
  real_lt_inv2_c.get()
}

///|
/// REAL_LE_INV2
fn step_201() -> Unit raise {
  let t443 = @simp.asm_rewrite_tac(@list.List([]))
  let t442 = @tactics.match_mp_tac(real_lt_inv2())
  let t441 = @simp.asm_rewrite_tac(@list.List([]))
  let t440 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (y : Real)"))
  let t439 = @simp.rewrite_tac(@list.List([@realarith.real_le_lt()]))
  let t444 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t439),
              t440,
            ),
            t441,
          ),
          @tactics.strip_tac,
        ),
        @tactics.disj1_tac,
      ),
      t442,
    ),
    t443,
  )
  real_le_inv2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && x <= y → inv(y) <= inv(x)"),
      t444,
    ),
  )
}

///|
let real_le_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_INV2")

///|
/// `REAL_LE_INV2`
pub fn real_le_inv2() -> @kernel.Thm {
  real_le_inv2_c.get()
}

///|
/// REAL_LT_LINV
fn step_202() -> Unit raise {
  let t449 = @simp.asm_rewrite_tac(@list.List([real_inv_inv()]))
  let t447 = @term_syntax.parse_term("(x : Real)")
  let t448 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("inv((y : Real))"), t447]),
      real_lt_inv2(),
    ),
  )
  let t446 = @simp.asm_rewrite_tac(@list.List([]))
  let t445 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real)"), real_lt_inv()),
  )
  let t450 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t445),
          t446,
        ),
        @tactics.disch_tac,
      ),
      t448,
    ),
    t449,
  )
  real_lt_linv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < y && inv(y) < x → inv(x) < y"),
      t450,
    ),
  )
}

///|
let real_lt_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LINV")

///|
/// `REAL_LT_LINV`
pub fn real_lt_linv() -> @kernel.Thm {
  real_lt_linv_c.get()
}

///|
/// REAL_LT_RINV
fn step_203() -> Unit raise {
  let t455 = @simp.asm_rewrite_tac(@list.List([real_inv_inv()]))
  let t453 = @term_syntax.parse_term("inv((y : Real))")
  let t454 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t453]),
      real_lt_inv2(),
    ),
  )
  let t452 = @simp.asm_rewrite_tac(@list.List([]))
  let t451 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), real_lt_inv()),
  )
  let t456 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t451),
          t452,
        ),
        @tactics.disch_tac,
      ),
      t454,
    ),
    t455,
  )
  real_lt_rinv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && x < inv(y) → y < inv(x)"),
      t456,
    ),
  )
}

///|
let real_lt_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_RINV")

///|
/// `REAL_LT_RINV`
pub fn real_lt_rinv() -> @kernel.Thm {
  real_lt_rinv_c.get()
}

///|
/// REAL_LE_LINV
fn step_204() -> Unit raise {
  let t461 = @simp.asm_rewrite_tac(@list.List([real_inv_inv()]))
  let t459 = @term_syntax.parse_term("(x : Real)")
  let t460 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("inv((y : Real))"), t459]),
      real_le_inv2(),
    ),
  )
  let t458 = @simp.asm_rewrite_tac(@list.List([]))
  let t457 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real)"), real_lt_inv()),
  )
  let t462 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t457),
          t458,
        ),
        @tactics.disch_tac,
      ),
      t460,
    ),
    t461,
  )
  real_le_linv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < y && inv(y) <= x → inv(x) <= y"),
      t462,
    ),
  )
}

///|
let real_le_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LINV")

///|
/// `REAL_LE_LINV`
pub fn real_le_linv() -> @kernel.Thm {
  real_le_linv_c.get()
}

///|
/// REAL_LE_RINV
fn step_205() -> Unit raise {
  let t467 = @simp.asm_rewrite_tac(@list.List([real_inv_inv()]))
  let t465 = @term_syntax.parse_term("inv((y : Real))")
  let t466 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real)"), t465]),
      real_le_inv2(),
    ),
  )
  let t464 = @simp.asm_rewrite_tac(@list.List([]))
  let t463 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), real_lt_inv()),
  )
  let t468 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t463),
          t464,
        ),
        @tactics.disch_tac,
      ),
      t466,
    ),
    t467,
  )
  real_le_rinv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && x <= inv(y) → y <= inv(x)"),
      t468,
    ),
  )
}

///|
let real_le_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_RINV")

///|
/// `REAL_LE_RINV`
pub fn real_le_rinv() -> @kernel.Thm {
  real_le_rinv_c.get()
}

///|
/// REAL_INV_LE_1
fn step_206() -> Unit raise {
  let t471 = @simp.asm_rewrite_tac(@list.List([real_lt_01()]))
  let t470 = @tactics.match_mp_tac(real_le_inv2())
  let t469 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_inv_1())]))
  let t472 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t469),
      t470,
    ),
    t471,
  )
  real_inv_le_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(1) <= x → inv(x) <= real_of_num(1)"), t472),
  )
}

///|
let real_inv_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_LE_1")

///|
/// `REAL_INV_LE_1`
pub fn real_inv_le_1() -> @kernel.Thm {
  real_inv_le_1_c.get()
}

///|
/// REAL_INV_1_LE
fn step_207() -> Unit raise {
  let t475 = @simp.asm_rewrite_tac(@list.List([real_lt_01()]))
  let t474 = @tactics.match_mp_tac(real_le_inv2())
  let t473 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_inv_1())]))
  let t476 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t473),
      t474,
    ),
    t475,
  )
  real_inv_1_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) < x && x <= real_of_num(1) → real_of_num(1) <= inv(x)"),
      t476,
    ),
  )
}

///|
let real_inv_1_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_1_LE")

///|
/// `REAL_INV_1_LE`
pub fn real_inv_1_le() -> @kernel.Thm {
  real_inv_1_le_c.get()
}

///|
/// REAL_INV_LT_1
fn step_208() -> Unit raise {
  let t479 = @simp.asm_rewrite_tac(@list.List([real_lt_01()]))
  let t478 = @tactics.match_mp_tac(real_lt_inv2())
  let t477 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_inv_1())]))
  let t480 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t477),
      t478,
    ),
    t479,
  )
  real_inv_lt_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(1) < x → inv(x) < real_of_num(1)"), t480),
  )
}

///|
let real_inv_lt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_LT_1")

///|
/// `REAL_INV_LT_1`
pub fn real_inv_lt_1() -> @kernel.Thm {
  real_inv_lt_1_c.get()
}

///|
/// REAL_INV_1_LT
fn step_209() -> Unit raise {
  let t483 = @simp.asm_rewrite_tac(@list.List([real_lt_01()]))
  let t482 = @tactics.match_mp_tac(real_lt_inv2())
  let t481 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_inv_1())]))
  let t484 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t481),
      t482,
    ),
    t483,
  )
  real_inv_1_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) < x && x < real_of_num(1) → real_of_num(1) < inv(x)"),
      t484,
    ),
  )
}

///|
let real_inv_1_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_1_LT")

///|
/// `REAL_INV_1_LT`
pub fn real_inv_1_lt() -> @kernel.Thm {
  real_inv_1_lt_c.get()
}

///|
/// REAL_SUB_INV
fn step_210() -> Unit raise {
  let t488 = @simp.simp_tac(@list.List([real_div_lmul()]))
  let t487 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t486 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t485 = @simp.simp_tac(
    @list.List([
      @realax.real_mul_assoc(),
      real_mul_rinv(),
      @realax.real_mul_lid(),
    ]),
  )
  let t489 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@realax.real_div(), real_sub_rdistrib(), real_inv_mul()]),
          ),
          t485,
        ),
        t486,
      ),
      t487,
    ),
    t488,
  )
  real_sub_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x == real_of_num(0)) && !(y == real_of_num(0)) → inv(x) - inv(y) == (y - x) / (x * y)"),
      t489,
    ),
  )
}

///|
let real_sub_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_INV")

///|
/// `REAL_SUB_INV`
pub fn real_sub_inv() -> @kernel.Thm {
  real_sub_inv_c.get()
}

///|
/// REAL_DOWN
fn step_211() -> Unit raise {
  let t497 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (d : Real)"))
  let t496 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      @realarith.real_mul_rid(),
    ]),
  )
  let t495 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2)"))
  let t494 = @tactics.match_mp_tac(real_lt_rcancel_imp())
  let t492 = @realarith.real_arith(@term_syntax.parse_term("!(real_of_num(2) == real_of_num(0))"))
  let t493 = @tactics.assume_tac(@drule.match_mp(@realax.real_mul_linv())(t492))
  let t491 = @tactics.assume_tac(
    @realarith.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)")),
  )
  let t490 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) / real_of_num(2)"))
  let t498 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                    t490,
                  ),
                  t491,
                ),
                t493,
              ),
              @tactics.conj_tac,
            ),
            t494,
          ),
          t495,
        ),
        t496,
      ),
      t497,
    ),
    real_arith_tac,
  )
  real_down_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Real, real_of_num(0) < d → (∃ e : Real, real_of_num(0) < e && e < d)"),
      t498,
    ),
  )
}

///|
let real_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DOWN")

///|
/// `REAL_DOWN`
pub fn real_down() -> @kernel.Thm {
  real_down_c.get()
}

///|
/// REAL_DOWN2
fn step_212() -> Unit raise {
  let t511 = @tactics.pop_assum_list(fn(
    x510 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s507 = @tactics.mp_tac(x506)
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
    })(
      ((x509 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x509))(
        x510,
      ),
    )
  })
  let t505 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real)"))
  let t504 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t503 = @simp.asm_rewrite_tac(@list.List([]))
  let t501 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(d2 : Real)"), real_down()),
  )
  let t502 = @list.List([
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(d1 : Real)"), real_down())),
    t501,
  ])
  let t499 = @term_syntax.parse_term("(d2 : Real)")
  let t500 = @tactics.disj_cases_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(d1 : Real)"), t499]),
      @realax.real_le_total(),
    ),
  )
  let t512 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @tactics.strip_tac,
                ),
                t500,
              ),
              t502,
            ),
            t503,
          ),
          t504,
        ),
        t505,
      ),
      t511,
    ),
    real_arith_tac,
  )
  real_down2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d1 : Real, ∀ d2 : Real, real_of_num(0) < d1 && real_of_num(0) < d2 → (∃ e : Real, real_of_num(0) < e && e < d1 && e < d2)"),
      t512,
    ),
  )
}

///|
let real_down2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DOWN2")

///|
/// `REAL_DOWN2`
pub fn real_down2() -> @kernel.Thm {
  real_down2_c.get()
}

///|
/// REAL_POW_LE2
fn step_213() -> Unit raise {
  let t517 = @simp.asm_rewrite_tac(@list.List([]))
  let t518 = @tactics.then_tac(
    @tactics.first_assum(@tactics.match_mp_tac),
    t517,
  )
  let t516 = @simp.asm_rewrite_tac(@list.List([]))
  let t519 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_pow_le()), t516),
    t518,
  ])
  let t515 = @simp.asm_rewrite_tac(@list.List([]))
  let t514 = @tactics.match_mp_tac(real_le_mul2())
  let t513 = @tactics.repeat_tac(@tactics.strip_tac)
  let t520 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @nums.induct_tac,
              @simp.rewrite_tac(
                @list.List([@realax.real_pow(), @realax.real_le_refl()]),
              ),
            ),
            t513,
          ),
          t514,
        ),
        t515,
      ),
      @tactics.conj_tac,
    ),
    t519,
  )
  real_pow_le2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, real_of_num(0) <= x && x <= y → pow(x, n) <= pow(y, n)"),
      t520,
    ),
  )
}

///|
let real_pow_le2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LE2")

///|
/// `REAL_POW_LE2`
pub fn real_pow_le2() -> @kernel.Thm {
  real_pow_le2_c.get()
}

///|
/// REAL_POW_LE_1
fn step_214() -> Unit raise {
  let t524 = @simp.asm_rewrite_tac(
    @list.List([real_pow_one(), @realarith.real_pos()]),
  )
  let t521 = @term_syntax.parse_term("(x : Real)")
  let t522 = @term_syntax.parse_term("real_of_num(1)")
  let t523 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t522, t521]),
      real_pow_le2(),
    ),
  )
  let t525 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t523),
    t524,
  )
  real_pow_le_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, real_of_num(1) <= x → real_of_num(1) <= pow(x, n)"), t525),
  )
}

///|
let real_pow_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LE_1")

///|
/// `REAL_POW_LE_1`
pub fn real_pow_le_1() -> @kernel.Thm {
  real_pow_le_1_c.get()
}

///|
/// REAL_POW_1_LE
fn step_215() -> Unit raise {
  let t529 = @simp.asm_rewrite_tac(@list.List([real_pow_one()]))
  let t526 = @term_syntax.parse_term("real_of_num(1)")
  let t527 = @term_syntax.parse_term("(x : Real)")
  let t528 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t527, t526]),
      real_pow_le2(),
    ),
  )
  let t530 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t528),
    t529,
  )
  real_pow_1_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, real_of_num(0) <= x && x <= real_of_num(1) → pow(x, n) <= real_of_num(1)"),
      t530,
    ),
  )
}

///|
let real_pow_1_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_1_LE")

///|
/// `REAL_POW_1_LE`
pub fn real_pow_1_le() -> @kernel.Thm {
  real_pow_1_le_c.get()
}

///|
/// REAL_POW_MONO
fn step_216() -> Unit raise {
  let t553 = @simp.asm_rewrite_tac(@list.List([]))
  let t554 = @tactics.then_tac(@tactics.match_mp_tac(real_pow_le_1()), t553)
  let t552 = @simp.asm_rewrite_tac(@list.List([]))
  let t551 = @tactics.match_mp_tac(real_pow_le_1())
  let t550 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t555 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@realax.real_le_trans()),
            t549,
          ),
          t550,
        ),
        t551,
      ),
      t552,
    ),
    t554,
  ])
  let t548 = @tactics.match_mp_tac(real_le_lmul())
  let t547 = @simp.gen_rewrite_tac(
    fn(
      x544 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s545 = @equal.land_conv(x544)
      fn(x546 : @kernel.Term) -> @kernel.Thm raise { s545(x546) }
    },
    @list.List([@equal.gsym(@realarith.real_mul_rid())]),
  )
  let t543 = @simp.rewrite_tac(@list.List([real_pow_add()]))
  let t542 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
      x539 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s540 = @tactics.subst1_tac(x539)
      fn(
        x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s540(x541)
      }
    }),
  )
  let t538 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x532 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s533 = @tactics.assume_tac(x532)
        fn(
          x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s533(x534)
        }
      },
      fn(
        x535 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s536 = @tactics.mp_tac(x535)
        fn(
          x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s536(x537)
        }
      },
    ),
  )
  let t531 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t556 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t531),
                t538,
              ),
              t542,
            ),
            t543,
          ),
          t547,
        ),
        t548,
      ),
      @tactics.conj_tac,
    ),
    t555,
  )
  real_pow_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Real, real_of_num(1) <= x && m <= n → pow(x, m) <= pow(x, n)"),
      t556,
    ),
  )
}

///|
let real_pow_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_MONO")

///|
/// `REAL_POW_MONO`
pub fn real_pow_mono() -> @kernel.Thm {
  real_pow_mono_c.get()
}

///|
/// REAL_POW_LT2
fn step_217() -> Unit raise {
  let t563 = @simp.asm_rewrite_tac(@list.List([]))
  let t564 = @tactics.then_tac(
    @tactics.first_assum(@tactics.match_mp_tac),
    t563,
  )
  let t562 = @simp.asm_rewrite_tac(@list.List([]))
  let t565 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_pow_le()), t562),
    t564,
  ])
  let t561 = @simp.asm_rewrite_tac(@list.List([]))
  let t560 = @tactics.match_mp_tac(real_lt_mul2())
  let t559 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @realarith.real_mul_rid()]),
  )
  let t558 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t557 = @tactics.repeat_tac(@tactics.strip_tac)
  let t566 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @nums.induct_tac,
                  @simp.rewrite_tac(
                    @list.List([@nums.not_suc(), @realax.real_pow()]),
                  ),
                ),
                t557,
              ),
              t558,
            ),
            t559,
          ),
          t560,
        ),
        t561,
      ),
      @tactics.conj_tac,
    ),
    t565,
  )
  real_pow_lt2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, !(n == 0) && real_of_num(0) <= x && x < y → pow(x, n) < pow(y, n)"),
      t566,
    ),
  )
}

///|
let real_pow_lt2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LT2")

///|
/// `REAL_POW_LT2`
pub fn real_pow_lt2() -> @kernel.Thm {
  real_pow_lt2_c.get()
}

///|
/// REAL_POW_LT_1
fn step_218() -> Unit raise {
  let t570 = @simp.asm_rewrite_tac(
    @list.List([real_pow_one(), @realarith.real_pos()]),
  )
  let t567 = @term_syntax.parse_term("(x : Real)")
  let t568 = @term_syntax.parse_term("real_of_num(1)")
  let t569 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t568, t567]),
      real_pow_lt2(),
    ),
  )
  let t571 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t569),
    t570,
  )
  real_pow_lt_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, !(n == 0) && real_of_num(1) < x → real_of_num(1) < pow(x, n)"),
      t571,
    ),
  )
}

///|
let real_pow_lt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_LT_1")

///|
/// `REAL_POW_LT_1`
pub fn real_pow_lt_1() -> @kernel.Thm {
  real_pow_lt_1_c.get()
}

///|
/// REAL_POW_1_LT
fn step_219() -> Unit raise {
  let t575 = @simp.asm_rewrite_tac(@list.List([real_pow_one()]))
  let t572 = @term_syntax.parse_term("real_of_num(1)")
  let t573 = @term_syntax.parse_term("(x : Real)")
  let t574 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t573, t572]),
      real_pow_lt2(),
    ),
  )
  let t576 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t574),
    t575,
  )
  real_pow_1_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, !(n == 0) && real_of_num(0) <= x && x < real_of_num(1) → pow(x, n) < real_of_num(1)"),
      t576,
    ),
  )
}

///|
let real_pow_1_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_1_LT")

///|
/// `REAL_POW_1_LT`
pub fn real_pow_1_lt() -> @kernel.Thm {
  real_pow_1_lt_c.get()
}

///|
/// REAL_POW_MONO_LT
fn step_220() -> Unit raise {
  let t606 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_of_num_le(), @calc_num.arith()]),
  )
  let t605 = @tactics.match_mp_tac(real_lt_mul2())
  let t604 = @simp.gen_rewrite_tac(
    fn(
      x601 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s602 = @equal.land_conv(x601)
      fn(x603 : @kernel.Term) -> @kernel.Thm raise { s602(x603) }
    },
    @list.List([@equal.gsym(@realax.real_mul_lid())]),
  )
  let t600 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@realax.real_pow(), @realarith.real_mul_rid()]),
    ),
    @tactics.all_tac,
  ])
  let t599 = @simp.once_rewrite_tac(@list.List([@realax.real_pow()]))
  let t598 = @term_syntax.parse_term("(d : Num)")
  let t607 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t598),
              @nums.induct_tac,
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
  )
  let t597 = @simp.asm_rewrite_tac(
    @list.List([real_of_num_lt(), @calc_num.arith()]),
  )
  let t596 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t595 = @tactics.match_mp_tac(@realarith.real_lt_trans())
  let t608 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(real_pow_lt()), t595),
        t596,
      ),
      t597,
    ),
    t607,
  ])
  let t594 = @tactics.match_mp_tac(real_lt_lmul())
  let t593 = @simp.gen_rewrite_tac(
    fn(
      x590 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s591 = @equal.land_conv(x590)
      fn(x592 : @kernel.Term) -> @kernel.Thm raise { s591(x592) }
    },
    @list.List([@equal.gsym(@realarith.real_mul_rid())]),
  )
  let t589 = @simp.rewrite_tac(@list.List([real_pow_add()]))
  let t588 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x585 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s586 = @tactics.subst_all_tac(x585)
      fn(
        x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s586(x587)
      }
    }),
  )
  let t584 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x578 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s579 = @tactics.assume_tac(x578)
        fn(
          x580 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s579(x580)
        }
      },
      fn(
        x581 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s582 = @tactics.mp_tac(x581)
        fn(
          x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s582(x583)
        }
      },
    ),
  )
  let t577 = @simp.rewrite_tac(@list.List([@arith.lt_exists()]))
  let t609 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t577),
                t584,
              ),
              t588,
            ),
            t589,
          ),
          t593,
        ),
        t594,
      ),
      @tactics.conj_tac,
    ),
    t608,
  )
  real_pow_mono_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Real, real_of_num(1) < x && m < n → pow(x, m) < pow(x, n)"),
      t609,
    ),
  )
}

///|
let real_pow_mono_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_MONO_LT",
)

///|
/// `REAL_POW_MONO_LT`
pub fn real_pow_mono_lt() -> @kernel.Thm {
  real_pow_mono_lt_c.get()
}

///|
/// REAL_POW_POW
fn step_221() -> Unit raise {
  let t610 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @arith.mult_clauses(), real_pow_add()]),
  )
  let t611 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t610,
  )
  real_pow_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, pow(pow(x, m), n) == pow(x, m * n)"),
      t611,
    ),
  )
}

///|
let real_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_POW")

///|
/// `REAL_POW_POW`
pub fn real_pow_pow() -> @kernel.Thm {
  real_pow_pow_c.get()
}

///|
/// REAL_EQ_RCANCEL_IMP
fn step_222() -> Unit raise {
  let t614 = @tactics.conv_tac(@class.taut)
  let t613 = @simp.rewrite_tac(
    @list.List([
      real_sub_rzero(),
      @equal.gsym(real_sub_rdistrib()),
      @realarith.real_entire(),
    ]),
  )
  let t612 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_sub_0())]),
  )
  let t615 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t612),
      t613,
    ),
    t614,
  )
  real_eq_rcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, !(z == real_of_num(0)) && x * z == y * z → x == y"),
      t615,
    ),
  )
}

///|
let real_eq_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_RCANCEL_IMP",
)

///|
/// `REAL_EQ_RCANCEL_IMP`
pub fn real_eq_rcancel_imp() -> @kernel.Thm {
  real_eq_rcancel_imp_c.get()
}

///|
/// REAL_EQ_LCANCEL_IMP
fn step_223() -> Unit raise {
  let t616 = @tactics.match_accept_tac(real_eq_rcancel_imp())
  let t617 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])),
    t616,
  )
  real_eq_lcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, !(z == real_of_num(0)) && z * x == z * y → x == y"),
      t617,
    ),
  )
}

///|
let real_eq_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_LCANCEL_IMP",
)

///|
/// `REAL_EQ_LCANCEL_IMP`
pub fn real_eq_lcancel_imp() -> @kernel.Thm {
  real_eq_lcancel_imp_c.get()
}

///|
/// REAL_LT_DIV
fn step_224() -> Unit raise {
  let t618 = @simp.simp_tac(
    @list.List([real_lt_mul(), real_lt_inv_eq(), @realax.real_div()]),
  )
  real_lt_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) < y → real_of_num(0) < x / y"),
      t618,
    ),
  )
}

///|
let real_lt_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_DIV")

///|
/// `REAL_LT_DIV`
pub fn real_lt_div() -> @kernel.Thm {
  real_lt_div_c.get()
}

///|
/// REAL_LE_DIV
fn step_225() -> Unit raise {
  let t619 = @simp.simp_tac(
    @list.List([@realax.real_le_mul(), real_le_inv_eq(), @realax.real_div()]),
  )
  real_le_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → real_of_num(0) <= x / y"),
      t619,
    ),
  )
}

///|
let real_le_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_DIV")

///|
/// `REAL_LE_DIV`
pub fn real_le_div() -> @kernel.Thm {
  real_le_div_c.get()
}

///|
/// REAL_DIV_POW2
fn step_226() -> Unit raise {
  let t635 = @simp.asm_simp_tac(@list.List([real_pow_sub()]))
  let t632 = @drule.match_mp(@arith.lt_imp_le())
  let t634 = @tactics.disch_then(fn(
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
    (fn(
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
      let s630 = @tactics.mp_tac(x629)
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
    })(t632(x633))
  })
  let t628 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t627 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) <= (m : Num))"))
  let t626 = @simp.rewrite_tac(@list.List([real_inv_div()]))
  let t625 = @simp.gen_rewrite_tac(
    fn(
      x622 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s623 = @equal.land_conv(x622)
      fn(x624 : @kernel.Term) -> @kernel.Thm raise { s623(x624) }
    },
    @list.List([@equal.gsym(real_inv_inv())]),
  )
  let t621 = @simp.asm_simp_tac(@list.List([real_pow_sub()]))
  let t620 = @simp.asm_rewrite_tac(@list.List([]))
  let t636 = @tactics.then_tac(
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
                      @class.cond_cases_tac,
                    ),
                    t620,
                  ),
                  t621,
                ),
                t625,
              ),
              @tactics.ap_term_tac,
            ),
            t626,
          ),
          t627,
        ),
        t628,
      ),
      t634,
    ),
    t635,
  )
  real_div_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, !(x == real_of_num(0)) → pow(x, m) / pow(x, n) == (if n <= m { pow(x, m - n) } else { inv(pow(x, n - m)) })"),
      t636,
    ),
  )
}

///|
let real_div_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_POW2")

///|
/// `REAL_DIV_POW2`
pub fn real_div_pow2() -> @kernel.Thm {
  real_div_pow2_c.get()
}

///|
/// REAL_DIV_POW2_ALT
fn step_227() -> Unit raise {
  let t644 = @simp.asm_rewrite_tac(@list.List([real_inv_inv()]))
  let t643 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t642 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.not_le()), real_div_pow2()]),
  )
  let t641 = @simp.once_rewrite_tac(@list.List([real_inv_div()]))
  let t640 = @simp.gen_rewrite_tac(
    fn(
      x637 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s638 = @equal.land_conv(x637)
      fn(x639 : @kernel.Term) -> @kernel.Thm raise { s638(x639) }
    },
    @list.List([@equal.gsym(real_inv_inv())]),
  )
  let t645 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t640),
          t641,
        ),
        t642,
      ),
      t643,
    ),
    t644,
  )
  real_div_pow2_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, !(x == real_of_num(0)) → pow(x, m) / pow(x, n) == (if n < m { pow(x, m - n) } else { inv(pow(x, n - m)) })"),
      t645,
    ),
  )
}

///|
let real_div_pow2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_DIV_POW2_ALT",
)

///|
/// `REAL_DIV_POW2_ALT`
pub fn real_div_pow2_alt() -> @kernel.Thm {
  real_div_pow2_alt_c.get()
}

///|
/// REAL_LT_POW2
fn step_228() -> Unit raise {
  let t646 = @simp.simp_tac(
    @list.List([real_pow_lt(), real_of_num_lt(), @calc_num.arith()]),
  )
  real_lt_pow2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < pow(real_of_num(2), n)"), t646),
  )
}

///|
let real_lt_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_POW2")

///|
/// `REAL_LT_POW2`
pub fn real_lt_pow2() -> @kernel.Thm {
  real_lt_pow2_c.get()
}

///|
/// REAL_LE_POW2
fn step_229() -> Unit raise {
  let t649 = @simp.rewrite_tac(
    @list.List([@realax.real_pow(), @realax.real_le_refl()]),
  )
  let t648 = @simp.simp_tac(
    @list.List([
      real_pow_mono(),
      @arith.le_0(),
      @realax.real_of_num_le(),
      @calc_num.arith(),
    ]),
  )
  let t647 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(2), 0)"))
  let t650 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.match_mp_tac(@realax.real_le_trans()),
        ),
        t647,
      ),
      t648,
    ),
    t649,
  )
  real_le_pow2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(1) <= pow(real_of_num(2), n)"), t650),
  )
}

///|
let real_le_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_POW2")

///|
/// `REAL_LE_POW2`
pub fn real_le_pow2() -> @kernel.Thm {
  real_le_pow2_c.get()
}

///|
/// REAL_POW2_ABS
fn step_230() -> Unit raise {
  let t651 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_pow_neg(), @calc_num.arith_even()]),
  )
  let t652 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@realax.real_abs()])),
      ),
      @class.cond_cases_tac,
    ),
    t651,
  )
  real_pow2_abs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, pow(abs(x), 2) == pow(x, 2)"), t652),
  )
}

///|
let real_pow2_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW2_ABS")

///|
/// `REAL_POW2_ABS`
pub fn real_pow2_abs() -> @kernel.Thm {
  real_pow2_abs_c.get()
}

///|
/// REAL_LE_SQUARE_ABS
fn step_231() -> Unit raise {
  let t654 = @meson.meson_tac(
    @list.List([
      real_pow_le2(),
      real_abs_pos(),
      @calc_num.num_eq_conv(@term_syntax.parse_term("2 == 0")),
      real_pow_lt2(),
      real_not_le(),
    ]),
  )
  let t653 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_pow2_abs())]))
  let t655 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t653),
    t654,
  )
  real_le_square_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (abs(x) <= abs(y)) == (pow(x, 2) <= pow(y, 2))"),
      t655,
    ),
  )
}

///|
let real_le_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_SQUARE_ABS",
)

///|
/// `REAL_LE_SQUARE_ABS`
pub fn real_le_square_abs() -> @kernel.Thm {
  real_le_square_abs_c.get()
}

///|
/// REAL_LT_SQUARE_ABS
fn step_232() -> Unit raise {
  let t656 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_not_le()), real_le_square_abs()]),
  )
  real_lt_square_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (abs(x) < abs(y)) == (pow(x, 2) < pow(y, 2))"),
      t656,
    ),
  )
}

///|
let real_lt_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LT_SQUARE_ABS",
)

///|
/// `REAL_LT_SQUARE_ABS`
pub fn real_lt_square_abs() -> @kernel.Thm {
  real_lt_square_abs_c.get()
}

///|
/// REAL_EQ_SQUARE_ABS
fn step_233() -> Unit raise {
  let t657 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym()), real_le_square_abs()]),
  )
  real_eq_square_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (abs(x) == abs(y)) == (pow(x, 2) == pow(y, 2))"),
      t657,
    ),
  )
}

///|
let real_eq_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_SQUARE_ABS",
)

///|
/// `REAL_EQ_SQUARE_ABS`
pub fn real_eq_square_abs() -> @kernel.Thm {
  real_eq_square_abs_c.get()
}

///|
/// REAL_LE_POW_2
fn step_234() -> Unit raise {
  let t658 = @simp.rewrite_tac(
    @list.List([@realarith.real_pow_2(), @realarith.real_le_square()]),
  )
  real_le_pow_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= pow(x, 2)"), t658),
  )
}

///|
let real_le_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_POW_2")

///|
/// `REAL_LE_POW_2`
pub fn real_le_pow_2() -> @kernel.Thm {
  real_le_pow_2_c.get()
}

///|
/// REAL_LT_POW_2
fn step_235() -> Unit raise {
  let t659 = @simp.rewrite_tac(@list.List([real_pow_eq_0(), @calc_num.arith()]))
  let t660 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        real_le_pow_2(),
        @realarith.real_arith(
          @term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))"),
        ),
      ]),
    ),
    t659,
  )
  real_lt_pow_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) < pow(x, 2)) == !(x == real_of_num(0))"), t660),
  )
}

///|
let real_lt_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_POW_2")

///|
/// `REAL_LT_POW_2`
pub fn real_lt_pow_2() -> @kernel.Thm {
  real_lt_pow_2_c.get()
}

///|
/// REAL_SOS_EQ_0
fn step_236() -> Unit raise {
  let t668 = @simp.rewrite_tac(
    @list.List([@realarith.real_le_square(), @realarith.real_entire()]),
  )
  let t665 = @drule.match_mp(
    @realarith.real_arith(
      @term_syntax.parse_term("(x : Real) + (y : Real) == real_of_num(0) → real_of_num(0) <= x && real_of_num(0) <= y → x == real_of_num(0) && y == real_of_num(0)"),
    ),
  )
  let t667 = @tactics.disch_then(fn(
    x666 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s663 = @tactics.mp_tac(x662)
      fn(
        x664 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s663(x664)
      }
    })(t665(x666))
  })
  let t661 = @simp.simp_tac(
    @list.List([
      @realarith.real_pow_2(),
      @calc_int.real_mul_lzero(),
      @realax.real_add_lid(),
    ]),
  )
  let t669 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        t661,
      ),
      t667,
    ),
    t668,
  )
  real_sos_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (pow(x, 2) + pow(y, 2) == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))"),
      t669,
    ),
  )
}

///|
let real_sos_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SOS_EQ_0")

///|
/// `REAL_SOS_EQ_0`
pub fn real_sos_eq_0() -> @kernel.Thm {
  real_sos_eq_0_c.get()
}

///|
/// REAL_POW_ZERO
fn step_237() -> Unit raise {
  let t670 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.rewrite_tac(
      @list.List([
        @realax.real_pow(),
        @nums.not_suc(),
        @calc_int.real_mul_lzero(),
      ]),
    ),
  )
  real_pow_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, pow(real_of_num(0), n) == (if n == 0 { real_of_num(1) } else { real_of_num(0) })"),
      t670,
    ),
  )
}

///|
let real_pow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_ZERO")

///|
/// `REAL_POW_ZERO`
pub fn real_pow_zero() -> @kernel.Thm {
  real_pow_zero_c.get()
}

///|
/// REAL_POW_MONO_INV
fn step_238() -> Unit raise {
  let t685 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t682 = @tactics.match_mp_tac(real_inv_1_le())
  let t681 = @simp.asm_rewrite_tac(@list.List([]))
  let t683 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(real_pow_mono()), t681),
    t682,
  )
  let t680 = @simp.rewrite_tac(@list.List([real_lt_inv_eq()]))
  let t684 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_pow_lt()), t680),
    t683,
  ])
  let t679 = @simp.rewrite_tac(@list.List([@equal.gsym(real_pow_inv())]))
  let t678 = @tactics.match_mp_tac(real_le_inv2())
  let t686 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x675 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s676 = @equal.binop_conv(x675)
                fn(x677 : @kernel.Term) -> @kernel.Thm raise { s676(x677) }
              },
              @list.List([@equal.gsym(real_inv_inv())]),
            ),
            t678,
          ),
          t679,
        ),
        @tactics.conj_tac,
      ),
      t684,
    ),
    t685,
  )
  let t674 = @simp.asm_rewrite_tac(@list.List([@arith.le()]))
  let t673 = @tactics.undisch_tac(@term_syntax.parse_term("(n : Num) <= (m : Num)"))
  let t672 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.rewrite_tac(
        @list.List([@realarith.real_pos(), @realax.real_le_refl()]),
      ),
    ),
  )
  let t687 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([real_pow_zero()])),
          t672,
        ),
        t673,
      ),
      t674,
    ),
    t686,
  ])
  let t671 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t688 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t671),
    t687,
  )
  real_pow_mono_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : Real, real_of_num(0) <= x && x <= real_of_num(1) && n <= m → pow(x, m) <= pow(x, n)"),
      t688,
    ),
  )
}

///|
let real_pow_mono_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_MONO_INV",
)

///|
/// `REAL_POW_MONO_INV`
pub fn real_pow_mono_inv() -> @kernel.Thm {
  real_pow_mono_inv_c.get()
}

///|
/// REAL_POW_LE2_REV
fn step_239() -> Unit raise {
  let t689 = @meson.meson_tac(@list.List([real_pow_lt2(), real_not_le()]))
  real_pow_le2_rev_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, !(n == 0) && real_of_num(0) <= y && pow(x, n) <= pow(y, n) → x <= y"),
      t689,
    ),
  )
}

///|
let real_pow_le2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LE2_REV",
)

///|
/// `REAL_POW_LE2_REV`
pub fn real_pow_le2_rev() -> @kernel.Thm {
  real_pow_le2_rev_c.get()
}

///|
/// REAL_POW_LT2_REV
fn step_240() -> Unit raise {
  let t690 = @meson.meson_tac(@list.List([real_pow_le2(), real_not_le()]))
  real_pow_lt2_rev_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, real_of_num(0) <= y && pow(x, n) < pow(y, n) → x < y"),
      t690,
    ),
  )
}

///|
let real_pow_lt2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LT2_REV",
)

///|
/// `REAL_POW_LT2_REV`
pub fn real_pow_lt2_rev() -> @kernel.Thm {
  real_pow_lt2_rev_c.get()
}

///|
/// REAL_POW_EQ
fn step_241() -> Unit raise {
  let t691 = @meson.meson_tac(@list.List([real_pow_le2_rev()]))
  let t692 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())])),
    t691,
  )
  real_pow_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, !(n == 0) && real_of_num(0) <= x && real_of_num(0) <= y && pow(x, n) == pow(y, n) → x == y"),
      t692,
    ),
  )
}

///|
let real_pow_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_EQ")

///|
/// `REAL_POW_EQ`
pub fn real_pow_eq() -> @kernel.Thm {
  real_pow_eq_c.get()
}

///|
/// REAL_POW_EQ_ABS
fn step_242() -> Unit raise {
  let t695 = @simp.asm_rewrite_tac(
    @list.List([real_abs_pos(), @equal.gsym(real_abs_pow())]),
  )
  let t694 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t693 = @tactics.match_mp_tac(real_pow_eq())
  let t696 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t693),
      t694,
    ),
    t695,
  )
  real_pow_eq_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, !(n == 0) && pow(x, n) == pow(y, n) → abs(x) == abs(y)"),
      t696,
    ),
  )
}

///|
let real_pow_eq_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_EQ_ABS",
)

///|
/// `REAL_POW_EQ_ABS`
pub fn real_pow_eq_abs() -> @kernel.Thm {
  real_pow_eq_abs_c.get()
}

///|
/// REAL_POW_EQ_1_IMP
fn step_243() -> Unit raise {
  let t703 = @simp.asm_rewrite_tac(@list.List([real_pow_one()]))
  let t702 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t701 = @tactics.match_mp_tac(real_pow_eq_abs())
  let t700 = @simp.gen_rewrite_tac(
    fn(
      x697 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s698 = @equal.rand_conv(x697)
      fn(x699 : @kernel.Term) -> @kernel.Thm raise { s698(x699) }
    },
    @list.List([@equal.gsym(@calc_int.real_abs_num())]),
  )
  let t704 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t700),
        t701,
      ),
      t702,
    ),
    t703,
  )
  real_pow_eq_1_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, !(n == 0) && pow(x, n) == real_of_num(1) → abs(x) == real_of_num(1)"),
      t704,
    ),
  )
}

///|
let real_pow_eq_1_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_EQ_1_IMP",
)

///|
/// `REAL_POW_EQ_1_IMP`
pub fn real_pow_eq_1_imp() -> @kernel.Thm {
  real_pow_eq_1_imp_c.get()
}

///|
/// REAL_POW_EQ_1
fn step_244() -> Unit raise {
  let t719 = @simp.asm_rewrite_tac(@list.List([]))
  let t718 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t717 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_pow_neg(), real_pow_one()]),
  )
  let t713 = @drule.match_mp(
    @realarith.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")),
  )
  let t714 = @tactics.disj_cases_then(fn(
    x710 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s711 = @tactics.subst1_tac(x710)
    fn(
      x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s711(x712)
    }
  })
  let t716 = @tactics.first_x_assum(fn(
    x715 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t714(t713(x715))
  })
  let t709 = @simp.asm_rewrite_tac(@list.List([]))
  let t708 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([real_pow_eq_1_imp()])),
  ])
  let t707 = @class.asm_cases_tac(@term_syntax.parse_term("abs((x : Real)) == real_of_num(1)"))
  let t706 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t705 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t720 = @tactics.then_tac(
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
            t716,
          ),
          t717,
        ),
        t718,
      ),
      t719,
    ),
    real_arith_tac,
  )
  real_pow_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, (pow(x, n) == real_of_num(1)) == (abs(x) == real_of_num(1) && (x < real_of_num(0) → EVEN(n)) || n == 0)"),
      t720,
    ),
  )
}

///|
let real_pow_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_EQ_1")

///|
/// `REAL_POW_EQ_1`
pub fn real_pow_eq_1() -> @kernel.Thm {
  real_pow_eq_1_c.get()
}

///|
/// REAL_POW_LT2_ODD
fn step_245() -> Unit raise {
  let t740 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x737 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s738 = @tactics.mp_tac(x737)
      fn(
        x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s738(x739)
      }
    }),
  )
  let t735 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_pow_neg(), @equal.gsym(@arith.not_odd())]),
  )
  let t734 = @simp.asm_rewrite_tac(@list.List([]))
  let t736 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(real_pow_lt2()), t734),
    t735,
  ])
  let t741 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.subgoal_then(@term_syntax.parse_term("pow(-(y : Real), (n : Num)) < pow(-(x : Real), n)"), fn(
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
        }),
        t736,
      ),
      t740,
    ),
    real_arith_tac,
  )
  let t729 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([@calc_int.real_pow_neg(), @equal.gsym(@arith.not_odd())]),
    ),
    real_arith_tac,
  )
  let t730 = @list.List([
    @simp.asm_simp_tac(@list.List([real_pow_le(), real_pow_lt()])),
    t729,
  ])
  let t728 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(0) < pow(-(x : Real), (n : Num)) && real_of_num(0) <= pow((y : Real), n)"),
    fn(
      x725 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s726 = @tactics.mp_tac(x725)
      fn(
        x727 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s726(x727)
      }
    },
  )
  let t724 = @simp.asm_simp_tac(@list.List([real_pow_lt2()]))
  let t742 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disj_cases_tac(
            @realarith.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) || real_of_num(0) < -x")),
          ),
          t724,
        ),
        t728,
      ),
      t730,
    ),
    t741,
  ])
  let t723 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(y : Real)"), @realarith.real_le_negtotal()),
  )
  let t722 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t721 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t743 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t721),
          t722,
        ),
        @tactics.strip_tac,
      ),
      t723,
    ),
    t742,
  )
  real_pow_lt2_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, x < y && ODD(n) → pow(x, n) < pow(y, n)"),
      t743,
    ),
  )
}

///|
let real_pow_lt2_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LT2_ODD",
)

///|
/// `REAL_POW_LT2_ODD`
pub fn real_pow_lt2_odd() -> @kernel.Thm {
  real_pow_lt2_odd_c.get()
}

///|
/// REAL_POW_LE2_ODD
fn step_246() -> Unit raise {
  let t745 = @simp.asm_simp_tac(@list.List([real_pow_lt2_odd()]))
  let t744 = @tactics.repeat_tac(@tactics.strip_tac)
  let t746 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@realarith.real_le_lt()])),
      t744,
    ),
    t745,
  )
  real_pow_le2_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, x <= y && ODD(n) → pow(x, n) <= pow(y, n)"),
      t746,
    ),
  )
}

///|
let real_pow_le2_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LE2_ODD",
)

///|
/// `REAL_POW_LE2_ODD`
pub fn real_pow_le2_odd() -> @kernel.Thm {
  real_pow_le2_odd_c.get()
}

///|
/// REAL_POW_LT2_ODD_EQ
fn step_247() -> Unit raise {
  let t747 = @meson.meson_tac(
    @list.List([real_pow_lt2_odd(), real_pow_le2_odd(), real_not_le()]),
  )
  real_pow_lt2_odd_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, ODD(n) → (pow(x, n) < pow(y, n)) == (x < y)"),
      t747,
    ),
  )
}

///|
let real_pow_lt2_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LT2_ODD_EQ",
)

///|
/// `REAL_POW_LT2_ODD_EQ`
pub fn real_pow_lt2_odd_eq() -> @kernel.Thm {
  real_pow_lt2_odd_eq_c.get()
}

///|
/// REAL_POW_LE2_ODD_EQ
fn step_248() -> Unit raise {
  let t748 = @meson.meson_tac(
    @list.List([real_pow_lt2_odd(), real_pow_le2_odd(), real_not_le()]),
  )
  real_pow_le2_odd_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, ODD(n) → (pow(x, n) <= pow(y, n)) == (x <= y)"),
      t748,
    ),
  )
}

///|
let real_pow_le2_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LE2_ODD_EQ",
)

///|
/// `REAL_POW_LE2_ODD_EQ`
pub fn real_pow_le2_odd_eq() -> @kernel.Thm {
  real_pow_le2_odd_eq_c.get()
}

///|
/// REAL_POW_EQ_ODD_EQ
fn step_249() -> Unit raise {
  let t749 = @simp.simp_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym()), real_pow_le2_odd_eq()]),
  )
  real_pow_eq_odd_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, ODD(n) → (pow(x, n) == pow(y, n)) == (x == y)"),
      t749,
    ),
  )
}

///|
let real_pow_eq_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_EQ_ODD_EQ",
)

///|
/// `REAL_POW_EQ_ODD_EQ`
pub fn real_pow_eq_odd_eq() -> @kernel.Thm {
  real_pow_eq_odd_eq_c.get()
}

///|
/// REAL_POW_EQ_ODD
fn step_250() -> Unit raise {
  let t750 = @meson.meson_tac(@list.List([real_pow_eq_odd_eq()]))
  real_pow_eq_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, ODD(n) && pow(x, n) == pow(y, n) → x == y"),
      t750,
    ),
  )
}

///|
let real_pow_eq_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_EQ_ODD",
)

///|
/// `REAL_POW_EQ_ODD`
pub fn real_pow_eq_odd() -> @kernel.Thm {
  real_pow_eq_odd_c.get()
}

///|
/// REAL_POW_EQ_EQ
fn step_251() -> Unit raise {
  let t763 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(real_pow_pow())]))
  let t759 = @simp.rewrite_rule(@list.List([@arith.even_exists()]))
  let t760 = @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
    x756 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s757 = @tactics.subst1_tac(x756)
    fn(
      x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s757(x758)
    }
  })
  let t762 = @tactics.first_x_assum(fn(
    x761 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t760(t759(x761))
  })
  let t755 = @simp.rewrite_tac(@list.List([real_eq_square_abs()]))
  let t754 = @list.List([
    @meson.asm_meson_tac(@list.List([real_pow_eq_abs()])),
    @tactics.all_tac,
  ])
  let t753 = @simp.asm_simp_tac(
    @list.List([real_pow_eq_odd_eq(), @equal.gsym(@arith.not_even())]),
  )
  let t752 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @calc_num.arith()]),
  )
  let t751 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t764 = @tactics.then_tac(
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
                      t751,
                    ),
                    t752,
                  ),
                  @class.cond_cases_tac,
                ),
                t753,
              ),
              @tactics.eq_tac,
            ),
            t754,
          ),
          t755,
        ),
        @tactics.disch_tac,
      ),
      t762,
    ),
    t763,
  )
  real_pow_eq_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ y : Real, (pow(x, n) == pow(y, n)) == (if EVEN(n) { n == 0 || abs(x) == abs(y) } else { x == y })"),
      t764,
    ),
  )
}

///|
let real_pow_eq_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_EQ_EQ")

///|
/// `REAL_POW_EQ_EQ`
pub fn real_pow_eq_eq() -> @kernel.Thm {
  real_pow_eq_eq_c.get()
}

///|
/// REAL_EVENPOW_ABS
fn step_252() -> Unit raise {
  let t765 = @simp.simp_tac(@list.List([real_pow_eq_eq(), real_abs_abs()]))
  real_evenpow_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, EVEN(n) → pow(abs(x), n) == pow(x, n)"),
      t765,
    ),
  )
}

///|
let real_evenpow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EVENPOW_ABS",
)

///|
/// `REAL_EVENPOW_ABS`
pub fn real_evenpow_abs() -> @kernel.Thm {
  real_evenpow_abs_c.get()
}

///|
/// REAL_OF_NUM_MOD
fn step_253() -> Unit raise {
  let t768 = @meson.meson_tac(
    @list.List([@arith.division_simp(), @arith.add_sym()]),
  )
  let t767 = @simp.rewrite_tac(@list.List([real_of_num_clauses()]))
  let t766 = @simp.rewrite_tac(@list.List([real_eq_sub_ladd()]))
  let t769 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t766),
      t767,
    ),
    t768,
  )
  real_of_num_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_of_num(MOD(m, n)) == real_of_num(m) - real_of_num(DIV(m, n)) * real_of_num(n)"),
      t769,
    ),
  )
}

///|
let real_of_num_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_MOD",
)

///|
/// `REAL_OF_NUM_MOD`
pub fn real_of_num_mod() -> @kernel.Thm {
  real_of_num_mod_c.get()
}

///|
/// REAL_OF_NUM_DIV
fn step_254() -> Unit raise {
  let t773 = @simp.rewrite_tac(@list.List([real_of_num_mod()]))
  let t772 = @simp.asm_simp_tac(
    @list.List([real_sub_ldistrib(), real_div_lmul(), @realax.real_of_num_eq()]),
  )
  let t771 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num))"))
  let t774 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(real_eq_lcancel_imp()), t771),
        t772,
      ),
      t773,
    ),
    real_arith_tac,
  )
  let t775 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @arith.div_zero(),
        @realax.real_div(),
        @realax.real_inv_0(),
        @calc_int.real_mul_rzero(),
        real_sub_refl(),
      ]),
    ),
    t774,
  ])
  let t770 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t776 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t770),
    t775,
  )
  real_of_num_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_of_num(DIV(m, n)) == real_of_num(m) / real_of_num(n) - real_of_num(MOD(m, n)) / real_of_num(n)"),
      t776,
    ),
  )
}

///|
let real_of_num_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_DIV",
)

///|
/// `REAL_OF_NUM_DIV`
pub fn real_of_num_div() -> @kernel.Thm {
  real_of_num_div_c.get()
}

///|
/// REAL_CONVEX_BOUND2_LT
fn step_255() -> Unit raise {
  let t787 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x784 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s785 = @tactics.mp_tac(x784)
      fn(
        x786 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s785(x786)
      }
    }),
  )
  let t783 = @tactics.match_mp_tac(real_lt_lmul())
  let t780 = @simp.asm_simp_tac(
    @list.List([real_le_lmul(), @realarith.real_lt_imp_le()]),
  )
  let t779 = @tactics.match_mp_tac(real_lte_add2())
  let t781 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t779),
    t780,
  )
  let t778 = @tactics.repeat_tac(@tactics.strip_tac)
  let t782 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@calc_int.real_mul_lzero(), @realax.real_add_lid()]),
      ),
      t778,
    ),
    t781,
  ])
  let t777 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0)"))
  let t788 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t777),
          t782,
        ),
        t783,
      ),
      t787,
    ),
    real_arith_tac,
  )
  real_convex_bound2_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, x < a && y < (b : Real) && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → u * x + v * y < u * a + v * b"),
      t788,
    ),
  )
}

///|
let real_convex_bound2_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND2_LT",
)

///|
/// `REAL_CONVEX_BOUND2_LT`
pub fn real_convex_bound2_lt() -> @kernel.Thm {
  real_convex_bound2_lt_c.get()
}

///|
/// REAL_CONVEX_BOUND2_LE
fn step_256() -> Unit raise {
  let t794 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
      let s792 = @tactics.mp_tac(x791)
      fn(
        x793 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s792(x793)
      }
    }),
  )
  let t790 = @tactics.match_mp_tac(real_le_lmul())
  let t789 = @tactics.match_mp_tac(real_le_add2())
  let t795 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t789),
          @tactics.conj_tac,
        ),
        t790,
      ),
      t794,
    ),
    real_arith_tac,
  )
  real_convex_bound2_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, x <= a && y <= (b : Real) && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → u * x + v * y <= u * a + v * b"),
      t795,
    ),
  )
}

///|
let real_convex_bound2_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND2_LE",
)

///|
/// `REAL_CONVEX_BOUND2_LE`
pub fn real_convex_bound2_le() -> @kernel.Thm {
  real_convex_bound2_le_c.get()
}

///|
/// REAL_CONVEX_BOUND_LT
fn step_257() -> Unit raise {
  let t796 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_lt(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bound_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, x < a && y < a && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → u * x + v * y < a"),
      t796,
    ),
  )
}

///|
let real_convex_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND_LT",
)

///|
/// `REAL_CONVEX_BOUND_LT`
pub fn real_convex_bound_lt() -> @kernel.Thm {
  real_convex_bound_lt_c.get()
}

///|
/// REAL_CONVEX_BOUND_LE
fn step_258() -> Unit raise {
  let t797 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_le(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bound_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, x <= a && y <= a && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → u * x + v * y <= a"),
      t797,
    ),
  )
}

///|
let real_convex_bound_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND_LE",
)

///|
/// `REAL_CONVEX_BOUND_LE`
pub fn real_convex_bound_le() -> @kernel.Thm {
  real_convex_bound_le_c.get()
}

///|
/// REAL_CONVEX_BOUND_GT
fn step_259() -> Unit raise {
  let t798 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_lt(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bound_gt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, a < x && a < y && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → a < u * x + v * y"),
      t798,
    ),
  )
}

///|
let real_convex_bound_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND_GT",
)

///|
/// `REAL_CONVEX_BOUND_GT`
pub fn real_convex_bound_gt() -> @kernel.Thm {
  real_convex_bound_gt_c.get()
}

///|
/// REAL_CONVEX_BOUND_GE
fn step_260() -> Unit raise {
  let t799 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_le(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bound_ge_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ u : Real, ∀ v : Real, a <= x && a <= y && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → a <= u * x + v * y"),
      t799,
    ),
  )
}

///|
let real_convex_bound_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUND_GE",
)

///|
/// `REAL_CONVEX_BOUND_GE`
pub fn real_convex_bound_ge() -> @kernel.Thm {
  real_convex_bound_ge_c.get()
}

///|
/// REAL_CONVEX_BOUNDS_LE
fn step_261() -> Unit raise {
  let t800 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_le(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bounds_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ b : Real, ∀ u : Real, ∀ v : Real, a <= x && x <= b && a <= y && y <= b && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → a <= u * x + v * y && u * x + v * y <= b"),
      t800,
    ),
  )
}

///|
let real_convex_bounds_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUNDS_LE",
)

///|
/// `REAL_CONVEX_BOUNDS_LE`
pub fn real_convex_bounds_le() -> @kernel.Thm {
  real_convex_bounds_le_c.get()
}

///|
/// REAL_CONVEX_BOUNDS_LT
fn step_262() -> Unit raise {
  let t801 = @meson.meson_tac(
    @list.List([
      real_convex_bound2_lt(),
      @meson.meson(
        @list.List([@realax.real_mul_lid(), real_add_rdistrib()]),
        @term_syntax.parse_term("(u : Real) + (v : Real) == real_of_num(1) → u * (a : Real) + v * a == a"),
      ),
    ]),
  )
  real_convex_bounds_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ a : Real, ∀ b : Real, ∀ u : Real, ∀ v : Real, a < x && x < b && a < y && y < b && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) → a < u * x + v * y && u * x + v * y < b"),
      t801,
    ),
  )
}

///|
let real_convex_bounds_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_CONVEX_BOUNDS_LT",
)

///|
/// `REAL_CONVEX_BOUNDS_LT`
pub fn real_convex_bounds_lt() -> @kernel.Thm {
  real_convex_bounds_lt_c.get()
}

///|
/// REAL_ARCH_SIMPLE
fn step_263() -> Unit raise {
  let t802 = @meson.meson_tac(@list.List([]))
  let lemma = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Real, (∃ n : Num, x == real_of_num(n)) → (P : (Real) -> Bool)(x)) == (∀ n : Num, P(real_of_num(n)))"),
    t802,
  )
  let t804 = @meson.meson_tac(
    @list.List([
      real_le_sub_ladd(),
      @realax.real_of_num_add(),
      @realax.real_le_total(),
      @realarith.real_arith(@term_syntax.parse_term("!((M : Real) <= M - real_of_num(1))")),
    ]),
  )
  let t803 = @simp.rewrite_tac(@list.List([lemma]))
  let t805 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.spec(
          @term_syntax.parse_term("(y : Real) => ∃ n : Num, y == real_of_num(n)"),
          @realax.real_complete(),
        ),
      ),
      t803,
    ),
    t804,
  )
  real_arch_simple_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ n : Num, x <= real_of_num(n)"), t805),
  )
}

///|
let real_arch_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ARCH_SIMPLE",
)

///|
/// `REAL_ARCH_SIMPLE`
pub fn real_arch_simple() -> @kernel.Thm {
  real_arch_simple_c.get()
}

///|
/// REAL_ARCH_LT
fn step_264() -> Unit raise {
  let t806 = @meson.meson_tac(
    @list.List([
      real_arch_simple(),
      @realax.real_of_num_add(),
      @realarith.real_arith(@term_syntax.parse_term("(x : Real) <= (n : Real) → x < n + real_of_num(1)")),
    ]),
  )
  real_arch_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ n : Num, x < real_of_num(n)"), t806))
}

///|
let real_arch_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_LT")

///|
/// `REAL_ARCH_LT`
pub fn real_arch_lt() -> @kernel.Thm {
  real_arch_lt_c.get()
}

///|
/// REAL_ARCH
fn step_265() -> Unit raise {
  let t807 = @meson.meson_tac(@list.List([real_arch_lt(), real_lt_ldiv_eq()]))
  real_arch_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → (∀ y : Real, ∃ n : Num, y < real_of_num(n) * x)"),
      t807,
    ),
  )
}

///|
let real_arch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH")

///|
/// `REAL_ARCH`
pub fn real_arch() -> @kernel.Thm {
  real_arch_c.get()
}

///|
/// REAL_ARCH_INV
fn step_266() -> Unit raise {
  let t811 = @meson.asm_meson_tac(
    @list.List([
      real_lt_inv2(),
      real_inv_inv(),
      real_lt_inv_eq(),
      @realarith.real_lt_trans(),
      real_lt_antisym(),
    ]),
  )
  let t810 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t809 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("inv((e : Real))"), real_arch_lt()),
  )
  let t808 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@realarith.real_lt_trans()])),
  ])
  let t812 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t808,
          ),
          @tactics.disch_tac,
        ),
        t809,
      ),
      t810,
    ),
    t811,
  )
  real_arch_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ e : Real, (real_of_num(0) < e) == (∃ n : Num, !(n == 0) && real_of_num(0) < inv(real_of_num(n)) && inv(real_of_num(n)) < e)"),
      t812,
    ),
  )
}

///|
let real_arch_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_INV")

///|
/// `REAL_ARCH_INV`
pub fn real_arch_inv() -> @kernel.Thm {
  real_arch_inv_c.get()
}

///|
/// REAL_POW_LBOUND
fn step_267() -> Unit raise {
  let t818 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_le_mul(),
      @realarith.real_pos(),
      @realarith.real_arith(
        @term_syntax.parse_term("(real_of_num(1) + ((n : Real) + real_of_num(1)) * (x : Real) <= (real_of_num(1) + x) * (real_of_num(1) + n * x)) == (real_of_num(0) <= n * (x * x))"),
      ),
    ]),
  )
  let t817 = @simp.asm_simp_tac(
    @list.List([
      real_le_lmul(),
      @realarith.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) <= real_of_num(1) + x")),
    ]),
  )
  let t816 = @tactics.exists_tac(@term_syntax.parse_term("(real_of_num(1) + (x : Real)) * (real_of_num(1) + real_of_num((n : Num)) * x)"))
  let t815 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t814 = @simp.rewrite_tac(@list.List([@equal.gsym(real_of_num_suc())]))
  let t813 = @simp.rewrite_tac(
    @list.List([
      @realax.real_pow(),
      @calc_int.real_mul_lzero(),
      @calc_int.real_add_rid(),
      @realax.real_le_refl(),
    ]),
  )
  let t819 = @tactics.then_tac(
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
                      @list.List([@theorems.right_forall_imp_thm()]),
                    ),
                  ),
                  @tactics.disch_tac,
                ),
                @nums.induct_tac,
              ),
              t813,
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
  )
  real_pow_lbound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x → real_of_num(1) + real_of_num(n) * x <= pow(real_of_num(1) + x, n)"),
      t819,
    ),
  )
}

///|
let real_pow_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POW_LBOUND",
)

///|
/// `REAL_POW_LBOUND`
pub fn real_pow_lbound() -> @kernel.Thm {
  real_pow_lbound_c.get()
}

///|
/// REAL_ARCH_POW
fn step_268() -> Unit raise {
  let t834 = @meson.asm_meson_tac(
    @list.List([
      real_pow_lbound(),
      real_sub_add2(),
      @realarith.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) → real_of_num(0) <= x - real_of_num(1)")),
    ]),
  )
  let t833 = @simp.asm_simp_tac(
    @list.List([
      @realarith.real_arith(@term_syntax.parse_term("(x : Real) < (y : Real) → x < real_of_num(1) + y")),
    ]),
  )
  let t832 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + real_of_num((n : Num)) * ((x : Real) - real_of_num(1))"))
  let t831 = @tactics.match_mp_tac(@realarith.real_lte_trans())
  let t830 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t829 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t825 = @term_syntax.parse_term("(y : Real)")
  let t828 = @tactics.disch_then(fn(
    x827 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x822 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s823 = @tactics.mp_tac(x822)
      fn(
        x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s823(x824)
      }
    })(((x826 : @kernel.Thm) => @bool.spec(t825, x826))(x827))
  })
  let t821 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t820 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real) - real_of_num(1)"), real_arch()),
  )
  let t835 = @tactics.then_tac(
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
                      t820,
                    ),
                    t821,
                  ),
                  t828,
                ),
                t829,
              ),
              t830,
            ),
            @tactics.disch_tac,
          ),
          t831,
        ),
        t832,
      ),
      t833,
    ),
    t834,
  )
  real_arch_pow_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(1) < x → (∃ n : Num, y < pow(x, n))"), t835),
  )
}

///|
let real_arch_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_POW")

///|
/// `REAL_ARCH_POW`
pub fn real_arch_pow() -> @kernel.Thm {
  real_arch_pow_c.get()
}

///|
/// REAL_ARCH_POW2
fn step_269() -> Unit raise {
  let t836 = @simp.simp_tac(
    @list.List([real_arch_pow(), real_of_num_lt(), @calc_num.arith()]),
  )
  real_arch_pow2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∃ n : Num, x < pow(real_of_num(2), n)"), t836),
  )
}

///|
let real_arch_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_POW2")

///|
/// `REAL_ARCH_POW2`
pub fn real_arch_pow2() -> @kernel.Thm {
  real_arch_pow2_c.get()
}

///|
/// REAL_ARCH_POW_INV
fn step_270() -> Unit raise {
  let t859 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(real_pow_inv()), real_lt_inv(), real_lt_inv2()]),
  )
  let t858 = @simp.gen_rewrite_tac(
    fn(
      x855 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s856 = @equal.binop_conv(x855)
      fn(x857 : @kernel.Term) -> @kernel.Thm raise { s856(x857) }
    },
    @list.List([@equal.gsym(real_inv_inv())]),
  )
  let t854 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t851 = @drule.match_mp(real_arch_pow())
  let t848 = @term_syntax.parse_term("inv((y : Real))")
  let t853 = @tactics.disch_then(fn(
    x852 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x850 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x845 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s846 = @tactics.mp_tac(x845)
        fn(
          x847 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s846(x847)
        }
      })(((x849 : @kernel.Thm) => @bool.spec(t848, x849))(x850))
    })(t851(x852))
  })
  let t843 = @simp.rewrite_tac(@list.List([real_inv_1()]))
  let t844 = @list.List([@simp.asm_simp_tac(@list.List([real_lt_inv2()])), t843])
  let t842 = @tactics.subgoal_then(@term_syntax.parse_term("inv(real_of_num(1)) < inv((x : Real))"), fn(
    x839 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s840 = @tactics.mp_tac(x839)
    fn(
      x841 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s840(x841)
    }
  })
  let t838 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(
      @list.List([
        real_pow_1(),
        @realarith.real_let_trans(),
        @realarith.real_not_lt(),
      ]),
    ),
  ])
  let t837 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (x : Real)"))
  let t860 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t837,
                    ),
                    t838,
                  ),
                  t842,
                ),
                t844,
              ),
              t853,
            ),
            t854,
          ),
          @tactics.gen_tac,
        ),
        @tactics.disch_tac,
      ),
      t858,
    ),
    t859,
  )
  real_arch_pow_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < y && x < real_of_num(1) → (∃ n : Num, pow(x, n) < y)"),
      t860,
    ),
  )
}

///|
let real_arch_pow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ARCH_POW_INV",
)

///|
/// `REAL_ARCH_POW_INV`
pub fn real_arch_pow_inv() -> @kernel.Thm {
  real_arch_pow_inv_c.get()
}

///|
/// real_sgn
fn step_271() -> Unit raise {
  real_sgn_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_sgn : (Real) -> Real)((x : Real)) == (if real_of_num(0) < x { real_of_num(1) } else { if x < real_of_num(0) { -real_of_num(1) } else { real_of_num(0) } })"),
    ),
  )
}

///|
let real_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_sgn")

///|
/// `real_sgn`
pub fn real_sgn() -> @kernel.Thm {
  real_sgn_c.get()
}

///|
/// REAL_SGN_0
fn step_272() -> Unit raise {
  let t861 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_0_c.set(
    @tactics.prove(@term_syntax.parse_term("real_sgn(real_of_num(0)) == real_of_num(0)"), t861),
  )
}

///|
let real_sgn_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_0")

///|
/// `REAL_SGN_0`
pub fn real_sgn_0() -> @kernel.Thm {
  real_sgn_0_c.get()
}

///|
/// REAL_SGN_NEG
fn step_273() -> Unit raise {
  let t862 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(-x) == -real_sgn(x)"),
      t862,
    ),
  )
}

///|
let real_sgn_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_NEG")

///|
/// `REAL_SGN_NEG`
pub fn real_sgn_neg() -> @kernel.Thm {
  real_sgn_neg_c.get()
}

///|
/// REAL_SGN_ABS
fn step_274() -> Unit raise {
  let t863 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_abs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_sgn(x) * abs(x) == x"), t863),
  )
}

///|
let real_sgn_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_ABS")

///|
/// `REAL_SGN_ABS`
pub fn real_sgn_abs() -> @kernel.Thm {
  real_sgn_abs_c.get()
}

///|
/// REAL_SGN_ABS_ALT
fn step_275() -> Unit raise {
  let t864 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([real_sgn()])),
    ),
    real_arith_tac,
  )
  real_sgn_abs_alt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_sgn(x) * x == abs(x)"), t864),
  )
}

///|
let real_sgn_abs_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SGN_ABS_ALT",
)

///|
/// `REAL_SGN_ABS_ALT`
pub fn real_sgn_abs_alt() -> @kernel.Thm {
  real_sgn_abs_alt_c.get()
}

///|
/// REAL_EQ_SGN_ABS
fn step_276() -> Unit raise {
  let t865 = @meson.meson_tac(@list.List([real_sgn_abs()]))
  real_eq_sgn_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x == y) == (real_sgn(x) == real_sgn(y) && abs(x) == abs(y))"),
      t865,
    ),
  )
}

///|
let real_eq_sgn_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_SGN_ABS",
)

///|
/// `REAL_EQ_SGN_ABS`
pub fn real_eq_sgn_abs() -> @kernel.Thm {
  real_eq_sgn_abs_c.get()
}

///|
/// REAL_ABS_SGN
fn step_277() -> Unit raise {
  let t866 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_abs_sgn_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, abs(real_sgn(x)) == real_sgn(abs(x))"),
      t866,
    ),
  )
}

///|
let real_abs_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SGN")

///|
/// `REAL_ABS_SGN`
pub fn real_abs_sgn() -> @kernel.Thm {
  real_abs_sgn_c.get()
}

///|
/// REAL_SGN
fn step_278() -> Unit raise {
  let t874 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_div(),
      @equal.gsym(@realax.real_mul_assoc()),
      real_abs_zero(),
      real_mul_rinv(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t875 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
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
            let s871 = @equal.land_conv(x870)
            fn(x872 : @kernel.Term) -> @kernel.Thm raise { s871(x872) }
          })(x873),
        )
      },
      @list.List([@equal.gsym(real_sgn_abs())]),
    ),
    t874,
  )
  let t876 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@realax.real_div(), @calc_int.real_mul_lzero(), real_sgn_0()]),
    ),
    t875,
  ])
  let t877 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.gen_tac,
      @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)")),
    ),
    t876,
  )
  real_sgn_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_sgn(x) == x / abs(x)"), t877),
  )
}

///|
let real_sgn_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN")

///|
/// `REAL_SGN`
pub fn real_sgn_v1() -> @kernel.Thm {
  real_sgn_v1_c.get()
}

///|
/// REAL_SGN_MUL
fn step_279() -> Unit raise {
  let t878 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        real_sgn_v1(),
        real_abs_mul(),
        @realax.real_div(),
        real_inv_mul(),
      ]),
    ),
    real_arith_tac,
  )
  real_sgn_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_sgn(x * y) == real_sgn(x) * real_sgn(y)"),
      t878,
    ),
  )
}

///|
let real_sgn_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_MUL")

///|
/// `REAL_SGN_MUL`
pub fn real_sgn_mul() -> @kernel.Thm {
  real_sgn_mul_c.get()
}

///|
/// REAL_SGN_INV
fn step_280() -> Unit raise {
  let t879 = @realarith.real_arith(@term_syntax.parse_term("((x : Real) < real_of_num(0)) == (real_of_num(0) < -x)"))
  let t880 = @simp.rewrite_tac(
    @list.List([real_sgn(), real_lt_inv_eq(), @equal.gsym(real_inv_neg()), t879]),
  )
  real_sgn_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_sgn(inv(x)) == real_sgn(x)"), t880),
  )
}

///|
let real_sgn_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_INV")

///|
/// `REAL_SGN_INV`
pub fn real_sgn_inv() -> @kernel.Thm {
  real_sgn_inv_c.get()
}

///|
/// REAL_SGN_DIV
fn step_281() -> Unit raise {
  let t881 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_inv_mul(), real_inv_inv()]),
  )
  let t882 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([real_sgn_v1(), real_abs_div()])),
      t881,
    ),
    real_arith_tac,
  )
  real_sgn_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_sgn(x / y) == real_sgn(x) / real_sgn(y)"),
      t882,
    ),
  )
}

///|
let real_sgn_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_DIV")

///|
/// `REAL_SGN_DIV`
pub fn real_sgn_div() -> @kernel.Thm {
  real_sgn_div_c.get()
}

///|
/// REAL_SGN_EQ
fn step_282() -> Unit raise {
  let t883 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, (real_sgn(x) == real_of_num(0)) == (x == real_of_num(0))) && (∀ x : Real, (real_sgn(x) == real_of_num(1)) == (x > real_of_num(0))) && (∀ x : Real, (real_sgn(x) == -real_of_num(1)) == (x < real_of_num(0)))"),
      t883,
    ),
  )
}

///|
let real_sgn_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_EQ")

///|
/// `REAL_SGN_EQ`
pub fn real_sgn_eq() -> @kernel.Thm {
  real_sgn_eq_c.get()
}

///|
/// REAL_SGN_CASES
fn step_283() -> Unit raise {
  let t884 = @meson.meson_tac(@list.List([]))
  let t885 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    t884,
  )
  real_sgn_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(x) == real_of_num(0) || real_sgn(x) == real_of_num(1) || real_sgn(x) == -real_of_num(1)"),
      t885,
    ),
  )
}

///|
let real_sgn_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_CASES")

///|
/// `REAL_SGN_CASES`
pub fn real_sgn_cases() -> @kernel.Thm {
  real_sgn_cases_c.get()
}

///|
/// REAL_SGN_INEQS
fn step_284() -> Unit raise {
  let t886 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_ineqs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, (real_of_num(0) <= real_sgn(x)) == (real_of_num(0) <= x)) && (∀ x : Real, (real_of_num(0) < real_sgn(x)) == (real_of_num(0) < x)) && (∀ x : Real, (real_of_num(0) >= real_sgn(x)) == (real_of_num(0) >= x)) && (∀ x : Real, (real_of_num(0) > real_sgn(x)) == (real_of_num(0) > x)) && (∀ x : Real, (real_of_num(0) == real_sgn(x)) == (real_of_num(0) == x)) && (∀ x : Real, (real_sgn(x) <= real_of_num(0)) == (x <= real_of_num(0))) && (∀ x : Real, (real_sgn(x) < real_of_num(0)) == (x < real_of_num(0))) && (∀ x : Real, (real_sgn(x) >= real_of_num(0)) == (x >= real_of_num(0))) && (∀ x : Real, (real_sgn(x) > real_of_num(0)) == (x > real_of_num(0))) && (∀ x : Real, (real_sgn(x) == real_of_num(0)) == (x == real_of_num(0)))"),
      t886,
    ),
  )
}

///|
let real_sgn_ineqs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_INEQS")

///|
/// `REAL_SGN_INEQS`
pub fn real_sgn_ineqs() -> @kernel.Thm {
  real_sgn_ineqs_c.get()
}

///|
/// REAL_SGN_POW
fn step_285() -> Unit raise {
  let t888 = @simp.rewrite_tac(@list.List([real_sgn(), real_lt_01()]))
  let t887 = @simp.asm_rewrite_tac(
    @list.List([real_sgn_mul(), @realax.real_pow()]),
  )
  let t889 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t887,
    ),
    t888,
  )
  real_sgn_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_sgn(pow(x, n)) == pow(real_sgn(x), n)"),
      t889,
    ),
  )
}

///|
let real_sgn_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_POW")

///|
/// `REAL_SGN_POW`
pub fn real_sgn_pow() -> @kernel.Thm {
  real_sgn_pow_c.get()
}

///|
/// REAL_SGN_POW_2
fn step_286() -> Unit raise {
  let t892 = @simp.rewrite_tac(
    @list.List([real_pow_eq_0(), real_abs_zero(), @calc_num.arith()]),
  )
  let t890 = @realarith.real_arith(
    @term_syntax.parse_term("real_of_num(0) <= (x : Real) → (x <= real_of_num(0)) == (x == real_of_num(0))"),
  )
  let t891 = @simp.simp_tac(
    @list.List([
      @equal.gsym(real_not_le()),
      real_abs_pos(),
      real_le_pow_2(),
      t890,
    ]),
  )
  let t893 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([real_sgn()])), t891),
    t892,
  )
  real_sgn_pow_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(pow(x, 2)) == real_sgn(abs(x))"),
      t893,
    ),
  )
}

///|
let real_sgn_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_POW_2")

///|
/// `REAL_SGN_POW_2`
pub fn real_sgn_pow_2() -> @kernel.Thm {
  real_sgn_pow_2_c.get()
}

///|
/// REAL_SGN_REAL_SGN
fn step_287() -> Unit raise {
  let t894 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_real_sgn_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(real_sgn(x)) == real_sgn(x)"),
      t894,
    ),
  )
}

///|
let real_sgn_real_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SGN_REAL_SGN",
)

///|
/// `REAL_SGN_REAL_SGN`
pub fn real_sgn_real_sgn() -> @kernel.Thm {
  real_sgn_real_sgn_c.get()
}

///|
/// REAL_INV_SGN
fn step_288() -> Unit raise {
  let t896 = @simp.rewrite_tac(
    @list.List([@realax.real_inv_0(), real_inv_1(), real_inv_neg()]),
  )
  let t895 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t897 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([real_sgn()])),
      ),
      t895,
    ),
    t896,
  )
  real_inv_sgn_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, inv(real_sgn(x)) == real_sgn(x)"),
      t897,
    ),
  )
}

///|
let real_inv_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_SGN")

///|
/// `REAL_INV_SGN`
pub fn real_inv_sgn() -> @kernel.Thm {
  real_inv_sgn_c.get()
}

///|
/// REAL_SGN_EQ_INEQ
fn step_289() -> Unit raise {
  let t898 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgn_eq_ineq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_sgn(x) == real_sgn(y)) == (x == y || abs(x - y) < max(abs(x), abs(y)))"),
      t898,
    ),
  )
}

///|
let real_sgn_eq_ineq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SGN_EQ_INEQ",
)

///|
/// `REAL_SGN_EQ_INEQ`
pub fn real_sgn_eq_ineq() -> @kernel.Thm {
  real_sgn_eq_ineq_c.get()
}

///|
/// REAL_SGNS_EQ
fn step_290() -> Unit raise {
  let t899 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgns_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_sgn(x) == real_sgn(y)) == ((x == real_of_num(0)) == (y == real_of_num(0)) && (x > real_of_num(0)) == (y > real_of_num(0)) && (x < real_of_num(0)) == (y < real_of_num(0)))"),
      t899,
    ),
  )
}

///|
let real_sgns_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGNS_EQ")

///|
/// `REAL_SGNS_EQ`
pub fn real_sgns_eq() -> @kernel.Thm {
  real_sgns_eq_c.get()
}

///|
/// REAL_SGNS_EQ_ALT
fn step_291() -> Unit raise {
  let t900 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([real_sgn()])),
    real_arith_tac,
  )
  real_sgns_eq_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_sgn(x) == real_sgn(y)) == ((x == real_of_num(0) → y == real_of_num(0)) && (x > real_of_num(0) → y > real_of_num(0)) && (x < real_of_num(0) → y < real_of_num(0)))"),
      t900,
    ),
  )
}

///|
let real_sgns_eq_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SGNS_EQ_ALT",
)

///|
/// `REAL_SGNS_EQ_ALT`
pub fn real_sgns_eq_alt() -> @kernel.Thm {
  real_sgns_eq_alt_c.get()
}

///|
/// REAL_WLOG_LE
fn step_292() -> Unit raise {
  let t901 = @meson.meson_tac(@list.List([@realax.real_le_total()]))
  real_wlog_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, (P : (Real, Real) -> Bool)(x, y) == P(y, x)) && (∀ x : Real, ∀ y : Real, x <= y → P(x, y)) → (∀ x : Real, ∀ y : Real, P(x, y))"),
      t901,
    ),
  )
}

///|
let real_wlog_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_WLOG_LE")

///|
/// `REAL_WLOG_LE`
pub fn real_wlog_le() -> @kernel.Thm {
  real_wlog_le_c.get()
}

///|
/// REAL_WLOG_LT
fn step_293() -> Unit raise {
  let t902 = @meson.meson_tac(@list.List([real_lt_total()]))
  real_wlog_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, (P : (Real, Real) -> Bool)(x, x)) && (∀ x : Real, ∀ y : Real, P(x, y) == P(y, x)) && (∀ x : Real, ∀ y : Real, x < y → P(x, y)) → (∀ x : Real, ∀ y : Real, P(x, y))"),
      t902,
    ),
  )
}

///|
let real_wlog_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_WLOG_LT")

///|
/// `REAL_WLOG_LT`
pub fn real_wlog_lt() -> @kernel.Thm {
  real_wlog_lt_c.get()
}

///|
/// REAL_WLOG_LE_3
fn step_294() -> Unit raise {
  let t903 = @meson.meson_tac(@list.List([@realax.real_le_total()]))
  real_wlog_le_3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real, Real, Real) -> Bool, (∀ x : Real, ∀ y : Real, ∀ z : Real, P(x, y, z) → P(y, x, z) && P(x, z, y)) && (∀ x : Real, ∀ y : Real, ∀ z : Real, x <= y && y <= z → P(x, y, z)) → (∀ x : Real, ∀ y : Real, ∀ z : Real, P(x, y, z))"),
      t903,
    ),
  )
}

///|
let real_wlog_le_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_WLOG_LE_3")

///|
/// `REAL_WLOG_LE_3`
pub fn real_wlog_le_3() -> @kernel.Thm {
  real_wlog_le_3_c.get()
}

///|
/// sqrt
fn step_295() -> Unit raise {
  sqrt_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(sqrt : (Real) -> Real)((x : Real)) == select((y : Real) => real_sgn(y) == real_sgn(x) && pow(y, 2) == abs(x))"),
    ),
  )
}

///|
let sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sqrt")

///|
/// `sqrt`
pub fn sqrt() -> @kernel.Thm {
  sqrt_c.get()
}

///|
/// SQRT_UNIQUE
fn step_296() -> Unit raise {
  let t919 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x916 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s917 = @tactics.mp_tac(x916)
      fn(
        x918 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s917(x918)
      }
    }),
  )
  let t915 = @simp.rewrite_tac(@list.List([real_sgn()]))
  let t914 = @simp.rewrite_tac(
    @list.List([
      @realarith.real_entire(),
      @realarith.real_sub_0(),
      @realarith.real_arith(
        @term_syntax.parse_term("(pow((x : Real), 2) == pow((y : Real), 2)) == ((x - y) * (x - -y) == real_of_num(0))"),
      ),
    ]),
  )
  let t913 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs()]))
  let t912 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)"))
  let t911 = @simp.rewrite_tac(@list.List([real_sgn_pow_2(), real_abs_pow()]))
  let t910 = @tactics.first_x_assum(fn(
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
    (fn(
      x906 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s907 = @tactics.subst1_tac(x906)
      fn(
        x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s907(x908)
      }
    })(@equal.sym(x909))
  })
  let t905 = @tactics.match_mp_tac(@class.select_unique())
  let t904 = @simp.rewrite_tac(@list.List([sqrt()]))
  let t920 = @tactics.then_tac(
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
                      t904,
                    ),
                    t905,
                  ),
                  t910,
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
      t919,
    ),
    real_arith_tac,
  )
  sqrt_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= y && pow(y, 2) == x → sqrt(x) == y"),
      t920,
    ),
  )
}

///|
let sqrt_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_UNIQUE")

///|
/// `SQRT_UNIQUE`
pub fn sqrt_unique() -> @kernel.Thm {
  sqrt_unique_c.get()
}

///|
/// POW_2_SQRT
fn step_297() -> Unit raise {
  let t921 = @meson.meson_tac(@list.List([sqrt_unique()]))
  pow_2_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → sqrt(pow(x, 2)) == x"),
      t921,
    ),
  )
}

///|
let pow_2_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POW_2_SQRT")

///|
/// `POW_2_SQRT`
pub fn pow_2_sqrt() -> @kernel.Thm {
  pow_2_sqrt_c.get()
}

///|
/// SQRT_0
fn step_298() -> Unit raise {
  let t922 = @meson.meson_tac(
    @list.List([
      sqrt_unique(),
      @realarith.real_pow_2(),
      @calc_int.real_mul_lzero(),
      @realarith.real_pos(),
    ]),
  )
  sqrt_0_c.set(@tactics.prove(@term_syntax.parse_term("sqrt(real_of_num(0)) == real_of_num(0)"), t922))
}

///|
let sqrt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_0")

///|
/// `SQRT_0`
pub fn sqrt_0() -> @kernel.Thm {
  sqrt_0_c.get()
}

///|
/// SQRT_1
fn step_299() -> Unit raise {
  let t923 = @meson.meson_tac(
    @list.List([
      sqrt_unique(),
      @realarith.real_pow_2(),
      @realax.real_mul_lid(),
      @realarith.real_pos(),
    ]),
  )
  sqrt_1_c.set(@tactics.prove(@term_syntax.parse_term("sqrt(real_of_num(1)) == real_of_num(1)"), t923))
}

///|
let sqrt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_1")

///|
/// `SQRT_1`
pub fn sqrt_1() -> @kernel.Thm {
  sqrt_1_c.get()
}

///|
/// POW_2_SQRT_ABS
fn step_300() -> Unit raise {
  let t925 = @simp.rewrite_tac(
    @list.List([@realax.real_abs(), @realarith.real_le_square()]),
  )
  let t924 = @simp.rewrite_tac(
    @list.List([
      real_abs_pos(),
      @realarith.real_pow_2(),
      @equal.gsym(real_abs_mul()),
    ]),
  )
  let t926 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(sqrt_unique())),
      t924,
    ),
    t925,
  )
  pow_2_sqrt_abs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, sqrt(pow(x, 2)) == abs(x)"), t926),
  )
}

///|
let pow_2_sqrt_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POW_2_SQRT_ABS")

///|
/// `POW_2_SQRT_ABS`
pub fn pow_2_sqrt_abs() -> @kernel.Thm {
  pow_2_sqrt_abs_c.get()
}

///|
/// SQRT_WORKS_GEN
fn step_301() -> Unit raise {
  let t938 = @simp.asm_simp_tac(
    @list.List([real_lt_ldiv_eq(), real_lt_lmul_eq(), @realarith.real_sub_lt()]),
  )
  let t937 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t939 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @realax.real_div(),
            @realarith.real_arith(
              @term_syntax.parse_term("(a : Real) * inv((b : Real)) * (c : Real) == a * c * inv(b)"),
            ),
          ]),
        ),
        t937,
      ),
      t938,
    ),
    real_arith_tac,
  )
  let t936 = @simp.rewrite_tac(
    @list.List([real_le_ladd(), real_min_le(), @realax.real_le_refl()]),
  )
  let t935 = @simp.asm_simp_tac(
    @list.List([
      @realarith.real_le_add(),
      @realarith.real_pos(),
      @realax.real_le_mul(),
      real_abs_pos(),
      @realarith.real_lt_imp_le(),
      real_lt_div(),
      @realarith.real_sub_lt(),
      real_le_min(),
    ]),
  )
  let t934 = @simp.rewrite_tac(
    @list.List([
      real_le_min(),
      @realarith.real_pos(),
      real_min_le(),
      @realax.real_le_refl(),
    ]),
  )
  let t940 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(real_le_mul2()), t934),
        t935,
      ),
      t936,
    ),
    t939,
  ])
  let t932 = @term_syntax.parse_term("((y : Real) - pow((x : Real), 2)) / (real_of_num(2) * abs(x) + real_of_num(2)) * (real_of_num(2) * abs(x) + real_of_num(1))")
  let t933 = @tactics.trans_tac(@realarith.real_let_trans())(t932)
  let t931 = @simp.rewrite_tac(
    @list.List([real_pow2_abs(), @equal.gsym(real_lt_sub_ladd())]),
  )
  let t930 = @simp.rewrite_tac(
    @list.List([
      @realarith.real_arith(
        @term_syntax.parse_term("pow((x : Real) + (e : Real), 2) == e * (real_of_num(2) * x + e) + pow(x, 2)"),
      ),
    ]),
  )
  let t929 = @simp.asm_simp_tac(
    @list.List([
      real_lt_div(),
      @realarith.real_sub_lt(),
      @realarith.real_arith(
        @term_syntax.parse_term("real_of_num(0) < (y : Real) → (x : Real) < abs(x) + min(real_of_num(1), y)"),
      ),
    ]),
  )
  let t928 = @tactics.assume_tac(
    @realarith.real_arith(
      @term_syntax.parse_term("real_of_num(0) < real_of_num(2) * abs((x : Real)) + real_of_num(1) && real_of_num(0) < real_of_num(2) * abs(x) + real_of_num(2)"),
    ),
  )
  let t927 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((x : Real)) + min(real_of_num(1), ((y : Real) - pow(x, 2)) / (real_of_num(2) * abs(x) + real_of_num(2)))"),
  )
  let t941 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t927),
                t928,
              ),
              t929,
            ),
            t930,
          ),
          t931,
        ),
        t933,
      ),
      @tactics.conj_tac,
    ),
    t940,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, pow(x, 2) < y → (∃ x' : Real, x < x' && pow(x', 2) < y)"),
    t941,
  )
  let t971 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
      let s969 = @tactics.mp_tac(x968)
      fn(
        x970 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
  )
  let t967 = @simp.asm_rewrite_tac(
    @list.List([real_lt_inv_eq(), real_lt_pow_2()]),
  )
  let t966 = @tactics.thenl(
    @tactics.conj_tac,
    @list.List([
      @tactics.all_tac,
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.pop_assum(fn(
            x963 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s964 = @tactics.mp_tac(x963)
            fn(
              x965 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s964(x965)
            }
          }),
        ),
        real_arith_tac,
      ),
    ]),
  )
  let t962 = @tactics.match_mp_tac(real_lt_inv2())
  let t959 = @simp.gen_rewrite_tac(
    fn(
      x956 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s957 = @equal.land_conv(x956)
      fn(x958 : @kernel.Term) -> @kernel.Thm raise { s957(x958) }
    },
    @list.List([@equal.gsym(real_inv_inv())]),
  )
  let t960 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.repeat_tac(
            @tactics.pop_assum(fn(
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
              let s954 = @tactics.mp_tac(x953)
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
            }),
          ),
          real_arith_tac,
        ),
        @tactics.all_tac,
      ]),
    ),
    t959,
  )
  let t961 = @list.List([
    @simp.gen_rewrite_tac(
      fn(
        x950 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s951 = @equal.rand_conv(x950)
        fn(x952 : @kernel.Term) -> @kernel.Thm raise { s951(x952) }
      },
      @list.List([@equal.gsym(real_inv_inv())]),
    ),
    t960,
  ])
  let t949 = @simp.rewrite_tac(@list.List([real_lt_inv_eq()]))
  let t948 = @simp.rewrite_tac(@list.List([real_pow_inv()]))
  let t947 = @tactics.exists_tac(@term_syntax.parse_term("inv((x' : Real))"))
  let t946 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x' : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t945 = @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_inv())]))
  let t944 = @simp.asm_simp_tac(
    @list.List([real_pow_inv(), real_pow2_abs(), real_lt_inv2()]),
  )
  let t942 = @term_syntax.parse_term("inv((y : Real))")
  let t943 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("inv(abs((x : Real)))"), t942]),
      lemma,
    ),
  )
  let t972 = @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.strip_tac),
                              t943,
                            ),
                            t944,
                          ),
                          t945,
                        ),
                        t946,
                      ),
                      t947,
                    ),
                    t948,
                  ),
                  t949,
                ),
                @tactics.conj_tac,
              ),
              t961,
            ),
            t962,
          ),
          t966,
        ),
        t967,
      ),
      t971,
    ),
    real_arith_tac,
  )
  let lemma_p = @tactics.prove(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) < y && y < pow(x, 2) → (∃ x' : Real, x' < x && real_of_num(0) < x' && y < pow(x', 2))"),
    t972,
  )
  let t1058 = @simp.asm_simp_tac(
    @list.List([real_abs_pos(), real_pow2_abs(), @realarith.real_lt_imp_le()]),
  )
  let t1057 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1056 = @tactics.match_mp_tac(
    @realarith.real_arith(@term_syntax.parse_term("abs((z : Real)) <= (s : Real) → s < z → false")),
  )
  let t1054 = @tactics.conjuncts_then2(
    fn(
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
    },
    fn(
      x1051 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1052 = @tactics.assume_tac(x1051)
      fn(
        x1053 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1052(x1053)
      }
    },
  )
  let t1055 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(z : Real)"))(t1054),
  )
  let t1047 = @simp.asm_rewrite_tac(@list.List([]))
  let t1046 = @term_syntax.parse_term("(y : Real)")
  let t1059 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(
              @bool.ispecl(
                @list.List([@term_syntax.parse_term("(s : Real)"), t1046]),
                lemma,
              ),
            ),
            t1047,
          ),
          t1055,
        ),
        t1056,
      ),
      t1057,
    ),
    t1058,
  )
  let t1043 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1040 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1041 = @tactics.mp_tac(x1040)
      fn(
        x1042 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1041(x1042)
      }
    }),
  )
  let t1039 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(real_le_square_abs())]),
  )
  let t1037 = @term_syntax.parse_term("pow((z : Real), 2)")
  let t1038 = @tactics.trans_tac(@realarith.real_lte_trans())(t1037)
  let t1036 = @simp.rewrite_tac(@list.List([real_not_le()]))
  let t1035 = @simp.gen_rewrite_tac(
    fn(
      x1034 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1034
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t1033 = @tactics.disch_then(
    @tactics.conjuncts_then2(
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
        let s1028 = @tactics.assume_tac(x1027)
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
        let s1031 = @tactics.mp_tac(x1030)
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
      },
    ),
  )
  let t1026 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1025 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1024 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt()]))
  let t1023 = @tactics.conjuncts_then2(
    fn(
      x1020 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1021 = @tactics.mp_tac(x1020)
      fn(
        x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1021(x1022)
      }
    },
    @tactics.strip_assume_tac,
  )
  let t1044 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.disch_then(
                          @tactics.x_choose_then(@term_syntax.parse_term("(z : Real)"))(
                            t1023,
                          ),
                        ),
                        t1024,
                      ),
                      t1025,
                    ),
                    t1026,
                  ),
                  t1033,
                ),
                t1035,
              ),
              t1036,
            ),
            @tactics.disch_tac,
          ),
          t1038,
        ),
        t1039,
      ),
      t1043,
    ),
    real_arith_tac,
  )
  let t1019 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (y : Real)"))
  let t1018 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1017 = @simp.asm_rewrite_tac(@list.List([real_not_le()]))
  let t1016 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1015 = @simp.rewrite_tac(@list.List([real_pow_zero()]))
  let t1014 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t1013 = @class.asm_cases_tac(@term_syntax.parse_term("(s : Real) == real_of_num(0)"))
  let t1045 = @list.List([
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
                        @term_syntax.parse_term("(y : Real) < pow((s : Real), 2)"),
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
            @tactics.strip_tac,
          ),
          t1018,
        ),
        t1019,
      ),
      real_arith_tac,
    ),
    t1044,
  ])
  let t1012 = @simp.asm_rewrite_tac(@list.List([@class.not_imp()]))
  let t1011 = @term_syntax.parse_term("(y : Real)")
  let t1060 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("(s : Real)"), t1011]),
              lemma_p,
            ),
          ),
          t1012,
        ),
        @tactics.conj_tac,
      ),
      t1045,
    ),
    t1059,
  ])
  let t1010 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1008 = @equal.gsym(@realarith.real_not_lt())
  let t1009 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym()), t1008]),
  )
  let t1005 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Real)"))
  let t1006 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1005),
    @tactics.strip_tac,
  )
  let t1004 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1001 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1002 = @tactics.mp_tac(x1001)
      fn(
        x1003 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1002(x1003)
      }
    }),
  )
  let t999 = @realarith.real_arith(
    @term_syntax.parse_term("real_of_num(0) < (y : Real) && real_of_num(0) < pow(y, 2) → y <= pow(y + real_of_num(1), 2)"),
  )
  let t1000 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(real_lt_square_abs()), real_pow_lt(), t999]),
  )
  let t997 = @term_syntax.parse_term("pow((y : Real) + real_of_num(1), 2)")
  let t998 = @tactics.trans_tac(@realarith.real_let_trans())(t997)
  let t996 = @simp.rewrite_tac(@list.List([real_not_le()]))
  let t995 = @simp.gen_rewrite_tac(
    fn(
      x994 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x994
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t993 = @tactics.disch_then(
    @tactics.conjuncts_then2(
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
        let s988 = @tactics.assume_tac(x987)
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
      fn(
        x990 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s991 = @tactics.mp_tac(x990)
        fn(
          x992 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s991(x992)
        }
      },
    ),
  )
  let t986 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t985 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) + real_of_num(1)"))
  let t984 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
    }),
  )
  let t1007 = @list.List([
    @tactics.then_tac(
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
                          @tactics.conj_tac,
                          @list.List([
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")),
                                t984,
                              ),
                              real_arith_tac,
                            ),
                            @tactics.all_tac,
                          ]),
                        ),
                        t985,
                      ),
                      t986,
                    ),
                    t993,
                  ),
                  t995,
                ),
                t996,
              ),
              @tactics.disch_tac,
            ),
            t998,
          ),
          t1000,
        ),
        t1004,
      ),
      real_arith_tac,
    ),
    t1006,
  ])
  let t980 = @simp.rewrite_tac(@list.List([]))
  let t979 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(x : Real) => real_of_num(0) <= x && pow(x, 2) <= (y : Real)"),
      @realax.real_complete(),
    ),
  )
  let t976 = @drule.match_mp(real_lt_imp_nz())
  let t978 = @tactics.first_assum(fn(
    x977 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x973 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s974 = @tactics.assume_tac(x973)
      fn(
        x975 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s974(x975)
      }
    })(t976(x977))
  })
  let t1061 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t978),
                t979,
              ),
              t980,
            ),
            @tactics.ants_tac,
          ),
          t1007,
        ),
        t1009,
      ),
      t1010,
    ),
    t1060,
  )
  let main_lemma = @tactics.prove(
    @term_syntax.parse_term("∀ y : Real, real_of_num(0) < y → (∃ x : Real, pow(x, 2) == y)"),
    t1061,
  )
  let t1095 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_lid(), @realarith.real_mul_rid()]),
  )
  let t1094 = @simp.asm_simp_tac(
    @list.List([
      real_sgn(),
      @realarith.real_arith(@term_syntax.parse_term("(real_of_num(0) < abs((x : Real))) == !(x == real_of_num(0))")),
    ]),
  )
  let t1093 = @simp.rewrite_tac(
    @list.List([real_sgn_mul(), real_sgn_real_sgn()]),
  )
  let t1092 = @simp.asm_rewrite_tac(
    @list.List([real_pow_mul(), @equal.gsym(real_sgn_pow()), real_sgn_pow_2()]),
  )
  let t1091 = @tactics.exists_tac(@term_syntax.parse_term("real_sgn((x : Real)) * (y : Real)"))
  let t1090 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(y : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1089 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(real_abs_nz())]))
  let t1085 = @term_syntax.parse_term("abs((x : Real))")
  let t1088 = @tactics.first_x_assum(fn(
    x1087 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s1083 = @tactics.mp_tac(x1082)
      fn(
        x1084 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1083(x1084)
      }
    })(((x1086 : @kernel.Thm) => @bool.spec(t1085, x1086))(x1087))
  })
  let t1081 = @simp.rewrite_tac(
    @list.List([@calc_int.real_abs_num(), real_pow_zero(), @calc_num.arith()]),
  )
  let t1080 = @simp.asm_rewrite_tac(
    @list.List([real_sgn_0(), real_sgn_eq(), @theorems.unwind_thm2()]),
  )
  let t1096 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)")),
                      t1080,
                    ),
                    t1081,
                  ),
                  t1088,
                ),
                t1089,
              ),
              t1090,
            ),
            t1091,
          ),
          t1092,
        ),
        t1093,
      ),
      t1094,
    ),
    t1095,
  )
  let t1079 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1076 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1077 = @tactics.mp_tac(x1076)
      fn(
        x1078 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1077(x1078)
      }
    }),
  )
  let t1075 = @tactics.disch_then(fn(
    x1072 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1073 = @tactics.subst_all_tac(x1072)
    fn(
      x1074 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1073(x1074)
    }
  })
  let t1071 = @simp.asm_rewrite_tac(
    @list.List([real_pow2_abs(), @equal.gsym(real_abs_nz())]),
  )
  let t1070 = @tactics.exists_tac(@term_syntax.parse_term("abs((y : Real))"))
  let t1069 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t1068 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t1067 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), main_lemma),
  )
  let t1097 = @list.List([
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
                      t1067,
                    ),
                    t1068,
                  ),
                  t1069,
                ),
                @tactics.strip_tac,
              ),
              t1070,
            ),
            t1071,
          ),
          t1075,
        ),
        t1079,
      ),
      real_arith_tac,
    ),
    t1096,
  ])
  let t1066 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → (∃ y : Real, real_of_num(0) < y && pow(y, 2) == x)"),
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
      let s1064 = @tactics.assume_tac(x1063)
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
  let t1062 = @tactics.conv_tac(@class.select_conv)
  let t1098 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([sqrt()])),
        ),
        t1062,
      ),
      t1066,
    ),
    t1097,
  )
  sqrt_works_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(sqrt(x)) == real_sgn(x) && pow(sqrt(x), 2) == abs(x)"),
      t1098,
    ),
  )
}

///|
let sqrt_works_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_WORKS_GEN")

///|
/// `SQRT_WORKS_GEN`
pub fn sqrt_works_gen() -> @kernel.Thm {
  sqrt_works_gen_c.get()
}

///|
/// SQRT_UNIQUE_GEN
fn step_302() -> Unit raise {
  let t1105 = @simp.simp_tac(
    @list.List([
      @realarith.real_arith(@term_syntax.parse_term("(-(x : Real) == x) == (x == real_of_num(0))")),
      real_sgn_eq(),
      @calc_int.real_neg_0(),
      sqrt_0(),
    ]),
  )
  let t1104 = @simp.asm_rewrite_tac(@list.List([real_sgn_neg()]))
  let t1103 = @simp.rewrite_tac(@list.List([@theorems.imp_conj_alt()]))
  let t1102 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t1100 = @simp.simp_tac(
    @list.List([
      @realarith.real_entire(),
      @realarith.real_sub_0(),
      @realarith.real_arith(
        @term_syntax.parse_term("(pow((x : Real), 2) == pow((y : Real), 2)) == ((x - y) * (x - -y) == real_of_num(0))"),
      ),
    ]),
  )
  let t1099 = @tactics.mp_tac(
    @equal.gsym(@bool.spec(@term_syntax.parse_term("(x : Real)"), sqrt_works_gen())),
  )
  let t1106 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1099),
              t1100,
            ),
            t1102,
          ),
          t1103,
        ),
        @tactics.strip_tac,
      ),
      t1104,
    ),
    t1105,
  )
  sqrt_unique_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_sgn(y) == real_sgn(x) && pow(y, 2) == abs(x) → sqrt(x) == y"),
      t1106,
    ),
  )
}

///|
let sqrt_unique_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQRT_UNIQUE_GEN",
)

///|
/// `SQRT_UNIQUE_GEN`
pub fn sqrt_unique_gen() -> @kernel.Thm {
  sqrt_unique_gen_c.get()
}

///|
/// SQRT_NEG
fn step_303() -> Unit raise {
  let t1108 = @simp.rewrite_tac(@list.List([sqrt_works_gen()]))
  let t1107 = @simp.rewrite_tac(
    @list.List([
      real_sgn_neg(),
      @calc_int.real_pow_neg(),
      @calc_int.real_abs_neg(),
      @calc_num.arith(),
    ]),
  )
  let t1109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(sqrt_unique_gen()),
      ),
      t1107,
    ),
    t1108,
  )
  sqrt_neg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, sqrt(-x) == -sqrt(x)"), t1109),
  )
}

///|
let sqrt_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_NEG")

///|
/// `SQRT_NEG`
pub fn sqrt_neg() -> @kernel.Thm {
  sqrt_neg_c.get()
}

///|
/// REAL_SGN_SQRT
fn step_304() -> Unit raise {
  let t1110 = @simp.rewrite_tac(@list.List([sqrt_works_gen()]))
  real_sgn_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_sgn(sqrt(x)) == real_sgn(x)"),
      t1110,
    ),
  )
}

///|
let real_sgn_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_SQRT")

///|
/// `REAL_SGN_SQRT`
pub fn real_sgn_sqrt() -> @kernel.Thm {
  real_sgn_sqrt_c.get()
}

///|
/// SQRT_WORKS
fn step_305() -> Unit raise {
  let t1116 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1113 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1114 = @tactics.mp_tac(x1113)
      fn(
        x1115 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1114(x1115)
      }
    }),
  )
  let t1112 = @simp.rewrite_tac(@list.List([real_sgn()]))
  let t1111 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real)"), sqrt_works_gen()),
  )
  let t1117 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1111),
        t1112,
      ),
      t1116,
    ),
    real_arith_tac,
  )
  sqrt_works_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → real_of_num(0) <= sqrt(x) && pow(sqrt(x), 2) == x"),
      t1117,
    ),
  )
}

///|
let sqrt_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_WORKS")

///|
/// `SQRT_WORKS`
pub fn sqrt_works() -> @kernel.Thm {
  sqrt_works_c.get()
}

///|
/// REAL_POS_EQ_SQUARE
fn step_306() -> Unit raise {
  let t1118 = @meson.meson_tac(@list.List([real_le_pow_2(), sqrt_works()]))
  real_pos_eq_square_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= x) == (∃ y : Real, pow(y, 2) == x)"), t1118),
  )
}

///|
let real_pos_eq_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POS_EQ_SQUARE",
)

///|
/// `REAL_POS_EQ_SQUARE`
pub fn real_pos_eq_square() -> @kernel.Thm {
  real_pos_eq_square_c.get()
}

///|
/// SQRT_POS_LE
fn step_307() -> Unit raise {
  let t1119 = @meson.meson_tac(@list.List([sqrt_works()]))
  sqrt_pos_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → real_of_num(0) <= sqrt(x)"), t1119),
  )
}

///|
let sqrt_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_POS_LE")

///|
/// `SQRT_POS_LE`
pub fn sqrt_pos_le() -> @kernel.Thm {
  sqrt_pos_le_c.get()
}

///|
/// SQRT_POW_2
fn step_308() -> Unit raise {
  let t1120 = @meson.meson_tac(@list.List([sqrt_works()]))
  sqrt_pow_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → pow(sqrt(x), 2) == x"),
      t1120,
    ),
  )
}

///|
let sqrt_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_POW_2")

///|
/// `SQRT_POW_2`
pub fn sqrt_pow_2() -> @kernel.Thm {
  sqrt_pow_2_c.get()
}

///|
/// SQRT_POW2
fn step_309() -> Unit raise {
  let t1121 = @meson.meson_tac(
    @list.List([
      @realarith.real_pow_2(),
      @realarith.real_le_square(),
      sqrt_pow_2(),
    ]),
  )
  sqrt_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (pow(sqrt(x), 2) == x) == (real_of_num(0) <= x)"),
      t1121,
    ),
  )
}

///|
let sqrt_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_POW2")

///|
/// `SQRT_POW2`
pub fn sqrt_pow2() -> @kernel.Thm {
  sqrt_pow2_c.get()
}

///|
/// SQRT_MUL
fn step_310() -> Unit raise {
  let t1123 = @simp.rewrite_tac(
    @list.List([
      real_sgn_mul(),
      real_pow_mul(),
      sqrt_works_gen(),
      real_abs_mul(),
    ]),
  )
  let t1122 = @tactics.match_mp_tac(sqrt_unique_gen())
  let t1124 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1122),
    t1123,
  )
  sqrt_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, sqrt(x * y) == sqrt(x) * sqrt(y)"),
      t1124,
    ),
  )
}

///|
let sqrt_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_MUL")

///|
/// `SQRT_MUL`
pub fn sqrt_mul() -> @kernel.Thm {
  sqrt_mul_c.get()
}

///|
/// SQRT_INV
fn step_311() -> Unit raise {
  let t1125 = @simp.rewrite_tac(
    @list.List([
      real_sgn_inv(),
      real_pow_inv(),
      real_abs_inv(),
      sqrt_works_gen(),
    ]),
  )
  let t1126 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(sqrt_unique_gen()),
    ),
    t1125,
  )
  sqrt_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, sqrt(inv(x)) == inv(sqrt(x))"), t1126),
  )
}

///|
let sqrt_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_INV")

///|
/// `SQRT_INV`
pub fn sqrt_inv() -> @kernel.Thm {
  sqrt_inv_c.get()
}

///|
/// SQRT_DIV
fn step_312() -> Unit raise {
  let t1127 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), sqrt_mul(), sqrt_inv()]),
  )
  sqrt_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, sqrt(x / y) == sqrt(x) / sqrt(y)"),
      t1127,
    ),
  )
}

///|
let sqrt_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_DIV")

///|
/// `SQRT_DIV`
pub fn sqrt_div() -> @kernel.Thm {
  sqrt_div_c.get()
}

///|
/// SQRT_LT_0
fn step_313() -> Unit raise {
  let t1128 = @equal.gsym(real_sgn_eq())
  let t1129 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_gt()), t1128, real_sgn_sqrt()]),
  )
  sqrt_lt_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) < sqrt(x)) == (real_of_num(0) < x)"), t1129),
  )
}

///|
let sqrt_lt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_LT_0")

///|
/// `SQRT_LT_0`
pub fn sqrt_lt_0() -> @kernel.Thm {
  sqrt_lt_0_c.get()
}

///|
/// SQRT_EQ_0
fn step_314() -> Unit raise {
  let t1130 = @simp.rewrite_tac(@list.List([real_sgn_sqrt()]))
  let t1131 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@equal.gsym(real_sgn_eq())])),
    t1130,
  )
  sqrt_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (sqrt(x) == real_of_num(0)) == (x == real_of_num(0))"), t1131),
  )
}

///|
let sqrt_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_EQ_0")

///|
/// `SQRT_EQ_0`
pub fn sqrt_eq_0() -> @kernel.Thm {
  sqrt_eq_0_c.get()
}

///|
/// SQRT_LE_0
fn step_315() -> Unit raise {
  let t1132 = @simp.rewrite_tac(@list.List([sqrt_lt_0(), sqrt_eq_0()]))
  let t1133 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @realarith.real_arith(
          @term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (real_of_num(0) < x || x == real_of_num(0))"),
        ),
      ]),
    ),
    t1132,
  )
  sqrt_le_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (real_of_num(0) <= sqrt(x)) == (real_of_num(0) <= x)"), t1133),
  )
}

///|
let sqrt_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_LE_0")

///|
/// `SQRT_LE_0`
pub fn sqrt_le_0() -> @kernel.Thm {
  sqrt_le_0_c.get()
}

///|
/// REAL_ABS_SQRT
fn step_316() -> Unit raise {
  let t1134 = @simp.asm_rewrite_tac(@list.List([sqrt_neg()]))
  let t1135 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@realax.real_abs(), sqrt_le_0()])),
      ),
      @class.cond_cases_tac,
    ),
    t1134,
  )
  real_abs_sqrt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(sqrt(x)) == sqrt(abs(x))"), t1135),
  )
}

///|
let real_abs_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SQRT")

///|
/// `REAL_ABS_SQRT`
pub fn real_abs_sqrt() -> @kernel.Thm {
  real_abs_sqrt_c.get()
}

///|
/// SQRT_MONO_LT
fn step_317() -> Unit raise {
  let t1162 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1159 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1160 = @tactics.mp_tac(x1159)
      fn(
        x1161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1160(x1161)
      }
    }),
  )
  let t1158 = @simp.rewrite_tac(@list.List([sqrt_neg()]))
  let t1154 = @term_syntax.parse_term("-(x : Real)")
  let t1155 = @list.List([@term_syntax.parse_term("-(y : Real)"), t1154])
  let t1163 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
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
            let s1152 = @tactics.mp_tac(x1151)
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
          })(((x1156 : @kernel.Thm) => @bool.specl(t1155, x1156))(x1157))
        }),
        t1158,
      ),
      t1162,
    ),
    real_arith_tac,
  )
  let t1150 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(real_not_le()), sqrt_le_0()]),
  )
  let t1149 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t1164 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@realarith.real_lte_trans()),
        t1149,
      ),
      t1150,
    ),
    t1163,
  ])
  let t1148 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (y : Real)"))
  let t1147 = @simp.asm_simp_tac(@list.List([]))
  let t1146 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (x : Real)"))
  let t1165 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1146),
        t1147,
      ),
      t1148,
    ),
    t1164,
  )
  let t1145 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1142 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1143 = @tactics.mp_tac(x1142)
      fn(
        x1144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1143(x1144)
      }
    }),
  )
  let t1141 = @simp.asm_rewrite_tac(@list.List([sqrt_works_gen(), sqrt_le_0()]))
  let t1140 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t1139 = @tactics.match_mp_tac(real_pow_lt2_rev())
  let t1166 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1139),
            t1140,
          ),
          t1141,
        ),
        t1145,
      ),
      real_arith_tac,
    ),
    t1165,
  ])
  let t1167 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && x < y → sqrt(x) < sqrt(y)"),
      fn(
        x1136 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1137 = @tactics.assume_tac(x1136)
        fn(
          x1138 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1137(x1138)
        }
      },
    ),
    t1166,
  )
  sqrt_mono_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → sqrt(x) < sqrt(y)"),
      t1167,
    ),
  )
}

///|
let sqrt_mono_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_MONO_LT")

///|
/// `SQRT_MONO_LT`
pub fn sqrt_mono_lt() -> @kernel.Thm {
  sqrt_mono_lt_c.get()
}

///|
/// SQRT_MONO_LE
fn step_318() -> Unit raise {
  let t1168 = @meson.meson_tac(
    @list.List([@realarith.real_le_lt(), sqrt_mono_lt()]),
  )
  sqrt_mono_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y → sqrt(x) <= sqrt(y)"),
      t1168,
    ),
  )
}

///|
let sqrt_mono_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_MONO_LE")

///|
/// `SQRT_MONO_LE`
pub fn sqrt_mono_le() -> @kernel.Thm {
  sqrt_mono_le_c.get()
}

///|
/// SQRT_MONO_LT_EQ
fn step_319() -> Unit raise {
  let t1169 = @meson.meson_tac(
    @list.List([@realarith.real_not_lt(), sqrt_mono_lt(), sqrt_mono_le()]),
  )
  sqrt_mono_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (sqrt(x) < sqrt(y)) == (x < y)"),
      t1169,
    ),
  )
}

///|
let sqrt_mono_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQRT_MONO_LT_EQ",
)

///|
/// `SQRT_MONO_LT_EQ`
pub fn sqrt_mono_lt_eq() -> @kernel.Thm {
  sqrt_mono_lt_eq_c.get()
}

///|
/// SQRT_MONO_LE_EQ
fn step_320() -> Unit raise {
  let t1170 = @meson.meson_tac(
    @list.List([@realarith.real_not_lt(), sqrt_mono_lt(), sqrt_mono_le()]),
  )
  sqrt_mono_le_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (sqrt(x) <= sqrt(y)) == (x <= y)"),
      t1170,
    ),
  )
}

///|
let sqrt_mono_le_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SQRT_MONO_LE_EQ",
)

///|
/// `SQRT_MONO_LE_EQ`
pub fn sqrt_mono_le_eq() -> @kernel.Thm {
  sqrt_mono_le_eq_c.get()
}

///|
/// SQRT_INJ
fn step_321() -> Unit raise {
  let t1171 = @simp.simp_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym()), sqrt_mono_le_eq()]),
  )
  sqrt_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (sqrt(x) == sqrt(y)) == (x == y)"),
      t1171,
    ),
  )
}

///|
let sqrt_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_INJ")

///|
/// `SQRT_INJ`
pub fn sqrt_inj() -> @kernel.Thm {
  sqrt_inj_c.get()
}

///|
/// SQRT_EQ_1
fn step_322() -> Unit raise {
  let t1172 = @meson.meson_tac(@list.List([sqrt_inj(), sqrt_1()]))
  sqrt_eq_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, (sqrt(x) == real_of_num(1)) == (x == real_of_num(1))"), t1172),
  )
}

///|
let sqrt_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_EQ_1")

///|
/// `SQRT_EQ_1`
pub fn sqrt_eq_1() -> @kernel.Thm {
  sqrt_eq_1_c.get()
}

///|
/// SQRT_POS_LT
fn step_323() -> Unit raise {
  let t1173 = @meson.meson_tac(
    @list.List([@realarith.real_lt_le(), sqrt_pos_le(), sqrt_eq_0()]),
  )
  sqrt_pos_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_of_num(0) < sqrt(x)"), t1173),
  )
}

///|
let sqrt_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_POS_LT")

///|
/// `SQRT_POS_LT`
pub fn sqrt_pos_lt() -> @kernel.Thm {
  sqrt_pos_lt_c.get()
}

///|
/// REAL_LE_LSQRT
fn step_324() -> Unit raise {
  let t1174 = @meson.meson_tac(
    @list.List([sqrt_mono_le(), real_pow_le(), pow_2_sqrt()]),
  )
  real_le_lsqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= y && x <= pow(y, 2) → sqrt(x) <= y"),
      t1174,
    ),
  )
}

///|
let real_le_lsqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LSQRT")

///|
/// `REAL_LE_LSQRT`
pub fn real_le_lsqrt() -> @kernel.Thm {
  real_le_lsqrt_c.get()
}

///|
/// REAL_LE_RSQRT
fn step_325() -> Unit raise {
  let t1175 = @meson.meson_tac(
    @list.List([
      @realax.real_le_total(),
      sqrt_mono_le(),
      sqrt_pos_le(),
      @realarith.real_pow_2(),
      @realarith.real_le_square(),
      @realax.real_le_trans(),
      pow_2_sqrt(),
    ]),
  )
  real_le_rsqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, pow(x, 2) <= y → x <= sqrt(y)"),
      t1175,
    ),
  )
}

///|
let real_le_rsqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_RSQRT")

///|
/// `REAL_LE_RSQRT`
pub fn real_le_rsqrt() -> @kernel.Thm {
  real_le_rsqrt_c.get()
}

///|
/// REAL_LT_LSQRT
fn step_326() -> Unit raise {
  let t1176 = @meson.meson_tac(
    @list.List([sqrt_mono_lt(), real_pow_le(), pow_2_sqrt()]),
  )
  real_lt_lsqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= y && x < pow(y, 2) → sqrt(x) < y"),
      t1176,
    ),
  )
}

///|
let real_lt_lsqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LSQRT")

///|
/// `REAL_LT_LSQRT`
pub fn real_lt_lsqrt() -> @kernel.Thm {
  real_lt_lsqrt_c.get()
}

///|
/// REAL_LT_RSQRT
fn step_327() -> Unit raise {
  let t1180 = @simp.asm_rewrite_tac(
    @list.List([@realarith.real_pow_2(), @realarith.real_le_square()]),
  )
  let t1179 = @tactics.match_mp_tac(sqrt_mono_lt())
  let t1178 = @simp.rewrite_tac(@list.List([@equal.gsym(pow_2_sqrt_abs())]))
  let t1177 = @tactics.match_mp_tac(
    @realarith.real_arith(@term_syntax.parse_term("abs((x : Real)) < (a : Real) → x < a")),
  )
  let t1181 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1177),
        t1178,
      ),
      t1179,
    ),
    t1180,
  )
  real_lt_rsqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, pow(x, 2) < y → x < sqrt(y)"),
      t1181,
    ),
  )
}

///|
let real_lt_rsqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_RSQRT")

///|
/// `REAL_LT_RSQRT`
pub fn real_lt_rsqrt() -> @kernel.Thm {
  real_lt_rsqrt_c.get()
}

///|
/// SQRT_EVEN_POW2
fn step_328() -> Unit raise {
  let t1182 = @meson.meson_tac(
    @list.List([
      sqrt_unique(),
      real_pow_pow(),
      @arith.mult_sym(),
      real_pow_le(),
      @realarith.real_pos(),
    ]),
  )
  let t1183 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @arith.even_exists(),
        @theorems.left_imp_exists_thm(),
        @arith.div_mult(),
        @calc_num.arith_eq(),
      ]),
    ),
    t1182,
  )
  sqrt_even_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, EVEN(n) → sqrt(pow(real_of_num(2), n)) == pow(real_of_num(2), DIV(n, 2))"),
      t1183,
    ),
  )
}

///|
let sqrt_even_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_EVEN_POW2")

///|
/// `SQRT_EVEN_POW2`
pub fn sqrt_even_pow2() -> @kernel.Thm {
  sqrt_even_pow2_c.get()
}

///|
/// REAL_DIV_SQRT
fn step_329() -> Unit raise {
  let t1187 = @simp.asm_simp_tac(
    @list.List([sqrt_pow_2(), @realarith.real_lt_imp_le()]),
  )
  let t1186 = @simp.asm_simp_tac(
    @list.List([
      real_eq_ldiv_eq(),
      sqrt_pos_lt(),
      @equal.gsym(@realarith.real_pow_2()),
    ]),
  )
  let t1185 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(
      @list.List([sqrt_0(), @realax.real_div(), @calc_int.real_mul_lzero()]),
    ),
  ])
  let t1184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1188 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@realarith.real_le_lt()])),
          t1184,
        ),
        t1185,
      ),
      t1186,
    ),
    t1187,
  )
  real_div_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → x / sqrt(x) == sqrt(x)"),
      t1188,
    ),
  )
}

///|
let real_div_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIV_SQRT")

///|
/// `REAL_DIV_SQRT`
pub fn real_div_sqrt() -> @kernel.Thm {
  real_div_sqrt_c.get()
}

///|
/// REAL_RSQRT_LE
fn step_330() -> Unit raise {
  let t1189 = @meson.meson_tac(@list.List([real_pow_le2(), sqrt_pow_2()]))
  real_rsqrt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y && x <= sqrt(y) → pow(x, 2) <= y"),
      t1189,
    ),
  )
}

///|
let real_rsqrt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_RSQRT_LE")

///|
/// `REAL_RSQRT_LE`
pub fn real_rsqrt_le() -> @kernel.Thm {
  real_rsqrt_le_c.get()
}

///|
/// REAL_LSQRT_LE
fn step_331() -> Unit raise {
  let t1190 = @meson.meson_tac(
    @list.List([
      real_pow_le2(),
      sqrt_pos_le(),
      @realax.real_le_trans(),
      sqrt_pow_2(),
    ]),
  )
  real_lsqrt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && sqrt(x) <= y → x <= pow(y, 2)"),
      t1190,
    ),
  )
}

///|
let real_lsqrt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LSQRT_LE")

///|
/// `REAL_LSQRT_LE`
pub fn real_lsqrt_le() -> @kernel.Thm {
  real_lsqrt_le_c.get()
}

///|
/// REAL_SQRT_POW_2
fn step_332() -> Unit raise {
  let t1191 = @simp.rewrite_tac(@list.List([sqrt_works_gen()]))
  real_sqrt_pow_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, pow(sqrt(x), 2) == abs(x)"), t1191),
  )
}

///|
let real_sqrt_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SQRT_POW_2",
)

///|
/// `REAL_SQRT_POW_2`
pub fn real_sqrt_pow_2() -> @kernel.Thm {
  real_sqrt_pow_2_c.get()
}

///|
/// REAL_ABS_LE_SQRT_POS
fn step_333() -> Unit raise {
  let t1200 = @simp.asm_simp_tac(
    @list.List([sqrt_pow_2(), @realax.real_le_refl()]),
  )
  let t1199 = @realarith.real_arith(
    @term_syntax.parse_term("((x : Real) - (y : Real)) * (x + y) == pow(x, 2) - pow(y, 2)"),
  )
  let t1201 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(real_abs_mul()), t1199])),
    t1200,
  )
  let t1198 = @simp.asm_simp_tac(@list.List([sqrt_pos_le()]))
  let t1197 = @tactics.match_mp_tac(
    @realarith.real_arith(
      @term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → abs(x - y) <= abs(x + y)"),
    ),
  )
  let t1196 = @simp.rewrite_tac(@list.List([real_abs_pos()]))
  let t1202 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(real_le_lmul()), t1196),
        t1197,
      ),
      t1198,
    ),
    t1201,
  ])
  let t1194 = @term_syntax.parse_term("abs(sqrt((x : Real)) - sqrt((y : Real))) * abs(sqrt(x) + sqrt(y))")
  let t1195 = @tactics.trans_tac(@realax.real_le_trans())(t1194)
  let t1193 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t1192 = @tactics.match_mp_tac(real_le_rsqrt())
  let t1203 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1192),
          t1193,
        ),
        t1195,
      ),
      @tactics.conj_tac,
    ),
    t1202,
  )
  real_abs_le_sqrt_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → abs(sqrt(x) - sqrt(y)) <= sqrt(abs(x - y))"),
      t1203,
    ),
  )
}

///|
let real_abs_le_sqrt_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_LE_SQRT_POS",
)

///|
/// `REAL_ABS_LE_SQRT_POS`
pub fn real_abs_le_sqrt_pos() -> @kernel.Thm {
  real_abs_le_sqrt_pos_c.get()
}

///|
/// REAL_ABS_LE_SQRT
fn step_334() -> Unit raise {
  let t1236 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
      let s1234 = @tactics.mp_tac(x1233)
      fn(
        x1235 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1234(x1235)
      }
    }),
  )
  let t1232 = @simp.rewrite_tac(
    @list.List([sqrt_neg(), @calc_int.real_abs_neg()]),
  )
  let t1231 = @simp.rewrite_tac(@list.List([real_sqrt_pow_2()]))
  let t1230 = @simp.rewrite_tac(
    @list.List([
      @realarith.real_arith(
        @term_syntax.parse_term("pow((x : Real) - (y : Real), 2) == pow(x, 2) + pow(y, 2) - real_of_num(2) * (x * y)"),
      ),
    ]),
  )
  let t1229 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("sqrt(-(x : Real)) - sqrt((y : Real))"), real_le_pow_2()),
  )
  let t1228 = @tactics.match_mp_tac(real_le_rsqrt())
  let t1227 = @simp.asm_simp_tac(
    @list.List([
      sqrt_le_0(),
      @realarith.real_arith(
        @term_syntax.parse_term("!(real_of_num(0) <= (x : Real)) && real_of_num(0) <= (y : Real) → abs(x - y) == y - x"),
      ),
    ]),
  )
  let t1225 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1222 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1223 = @tactics.mp_tac(x1222)
      fn(
        x1224 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1223(x1224)
      }
    }),
  )
  let t1221 = @tactics.match_mp_tac(real_abs_le_sqrt_pos())
  let t1220 = @simp.rewrite_tac(
    @list.List([
      sqrt_mono_le_eq(),
      @realarith.real_arith(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(2) * abs(x)")),
    ]),
  )
  let t1218 = @term_syntax.parse_term("sqrt(abs(-(x : Real) - -(y : Real)))")
  let t1219 = @tactics.trans_tac(@realax.real_le_trans())(t1218)
  let t1217 = @simp.rewrite_tac(@list.List([@equal.gsym(sqrt_neg())]))
  let t1226 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.once_rewrite_tac(
                  @list.List([
                    @realarith.real_arith(
                      @term_syntax.parse_term("abs((x : Real) - (y : Real)) == abs(-x - -y)"),
                    ),
                  ]),
                ),
                t1217,
              ),
              t1219,
            ),
            t1220,
          ),
          t1221,
        ),
        t1225,
      ),
      real_arith_tac,
    ),
  ])
  let t1216 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (y : Real)"))
  let t1214 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1211 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1212 = @tactics.mp_tac(x1211)
      fn(
        x1213 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1212(x1213)
      }
    }),
  )
  let t1210 = @tactics.match_mp_tac(real_abs_le_sqrt_pos())
  let t1209 = @simp.rewrite_tac(
    @list.List([
      sqrt_mono_le_eq(),
      @realarith.real_arith(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(2) * abs(x)")),
    ]),
  )
  let t1208 = @term_syntax.parse_term("sqrt(abs((x : Real) - (y : Real)))")
  let t1215 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.trans_tac(@realax.real_le_trans())(t1208),
            t1209,
          ),
          t1210,
        ),
        t1214,
      ),
      real_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1207 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (x : Real)"))
  let t1205 = @term_syntax.parse_term("(y : Real)")
  let t1206 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Real)"), t1205]),
  )
  let t1204 = @list.List([
    @simp.rewrite_tac(@list.List([real_abs_sub()])),
    @tactics.all_tac,
  ])
  let t1237 = @tactics.then_tac(
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
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.match_mp_tac(real_wlog_le()),
                                  @tactics.conj_tac,
                                ),
                                t1204,
                              ),
                              t1206,
                            ),
                            @tactics.disch_tac,
                          ),
                          t1207,
                        ),
                        t1215,
                      ),
                      t1216,
                    ),
                    t1226,
                  ),
                  t1227,
                ),
                t1228,
              ),
              t1229,
            ),
            t1230,
          ),
          t1231,
        ),
        t1232,
      ),
      t1236,
    ),
    real_arith_tac,
  )
  real_abs_le_sqrt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, abs(sqrt(x) - sqrt(y)) <= sqrt(real_of_num(2) * abs(x - y))"),
      t1237,
    ),
  )
}

///|
let real_abs_le_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_LE_SQRT",
)

///|
/// `REAL_ABS_LE_SQRT`
pub fn real_abs_le_sqrt() -> @kernel.Thm {
  real_abs_le_sqrt_c.get()
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
}
