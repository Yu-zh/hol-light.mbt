// Translated from upstream calc_num.ml; edit this file directly.

///|
/// DENUMERAL
fn step_1() -> Unit raise {
  denumeral_c.set(
    @simp.gen_rewrite_rule(
      fn(
        x1 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2 = @equal.depth_conv(x1)
        fn(x3 : @kernel.Term) -> @kernel.Thm raise { s2(x3) }
      },
      @list.List([@nums.numeral()]),
    ),
  )
}

///|
let denumeral_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "DENUMERAL",
)

///|
/// `DENUMERAL`
pub fn denumeral(x : @kernel.Thm) -> @kernel.Thm raise {
  denumeral_c.get()(x)
}

///|
/// ARITH_ZERO
fn step_2() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([@nums.numeral(), @arith.bit0(), denumeral(@arith.add_clauses())]),
  )
  arith_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("NUMERAL(0) == 0 && BIT0(_0) == _0"),
      t4,
    ),
  )
}

///|
let arith_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_ZERO")

///|
/// `ARITH_ZERO`
pub fn arith_zero() -> @kernel.Thm {
  arith_zero_c.get()
}

///|
/// BIT0_0
fn step_3() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([@nums.numeral(), arith_zero()]))
  bit0_0_c.set(@tactics.prove(@term_syntax.parse_term("BIT0(0) == 0"), t5))
}

///|
let bit0_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT0_0")

///|
/// `BIT0_0`
pub fn bit0_0() -> @kernel.Thm {
  bit0_0_c.get()
}

///|
/// BIT1_0
fn step_4() -> Unit raise {
  let t6 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  bit1_0_c.set(@tactics.prove(@term_syntax.parse_term("BIT1(0) == 1"), t6))
}

///|
let bit1_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT1_0")

///|
/// `BIT1_0`
pub fn bit1_0() -> @kernel.Thm {
  bit1_0_c.get()
}

///|
/// ARITH_SUC
fn step_5() -> Unit raise {
  let t7 = @simp.rewrite_tac(
    @list.List([
      @nums.numeral(),
      @arith.bit0(),
      @arith.bit1(),
      denumeral(@arith.add_clauses()),
    ]),
  )
  arith_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, SUC(NUMERAL(n)) == NUMERAL(SUC(n))) && SUC(_0) == BIT1(_0) && (∀ n : Num, SUC(BIT0(n)) == BIT1(n)) && (∀ n : Num, SUC(BIT1(n)) == BIT0(SUC(n)))"),
      t7,
    ),
  )
}

///|
let arith_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_SUC")

///|
/// `ARITH_SUC`
pub fn arith_suc() -> @kernel.Thm {
  arith_suc_c.get()
}

///|
/// ARITH_PRE
fn step_6() -> Unit raise {
  let t8 = denumeral(@nums.not_suc())
  let t9 = denumeral(@arith.add_clauses())
  let t10 = @simp.rewrite_tac(
    @list.List([@nums.numeral(), denumeral(@arith.pre()), t9, t8, arith_zero()]),
  )
  let t11 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @nums.numeral(),
          @arith.bit1(),
          @arith.bit0(),
          denumeral(@arith.pre()),
        ]),
      ),
      @nums.induct_tac,
    ),
    t10,
  )
  arith_pre_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, PRE(NUMERAL(n)) == NUMERAL(PRE(n))) && PRE(_0) == _0 && (∀ n : Num, PRE(BIT0(n)) == (if n == _0 { _0 } else { BIT1(PRE(n)) })) && (∀ n : Num, PRE(BIT1(n)) == BIT0(n))"),
      t11,
    ),
  )
}

///|
let arith_pre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PRE")

///|
/// `ARITH_PRE`
pub fn arith_pre() -> @kernel.Thm {
  arith_pre_c.get()
}

///|
/// ARITH_ADD
fn step_7() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
  let t13 = @tactics.then_tac(
    @simp.pure_rewrite_tac(
      @list.List([
        @nums.numeral(),
        @arith.bit0(),
        @arith.bit1(),
        denumeral(@arith.add_clauses()),
        @nums.suc_inj(),
      ]),
    ),
    t12,
  )
  arith_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, NUMERAL(m) + NUMERAL(n) == NUMERAL(m + n)) && _0 + _0 == _0 && (∀ n : Num, _0 + BIT0(n) == BIT0(n)) && (∀ n : Num, _0 + BIT1(n) == BIT1(n)) && (∀ n : Num, BIT0(n) + _0 == BIT0(n)) && (∀ n : Num, BIT1(n) + _0 == BIT1(n)) && (∀ m : Num, ∀ n : Num, BIT0(m) + BIT0(n) == BIT0(m + n)) && (∀ m : Num, ∀ n : Num, BIT0(m) + BIT1(n) == BIT1(m + n)) && (∀ m : Num, ∀ n : Num, BIT1(m) + BIT0(n) == BIT1(m + n)) && (∀ m : Num, ∀ n : Num, BIT1(m) + BIT1(n) == BIT0(SUC(m + n)))"),
      t13,
    ),
  )
}

///|
let arith_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_ADD")

///|
/// `ARITH_ADD`
pub fn arith_add() -> @kernel.Thm {
  arith_add_c.get()
}

///|
/// ARITH_MULT
fn step_8() -> Unit raise {
  let t15 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.add_ac(),
    ]),
  )
  let t14 = denumeral(@arith.add_clauses())
  let t16 = @tactics.then_tac(
    @simp.pure_rewrite_tac(
      @list.List([
        @nums.numeral(),
        @arith.bit0(),
        @arith.bit1(),
        denumeral(@arith.mult_clauses()),
        t14,
        @nums.suc_inj(),
      ]),
    ),
    t15,
  )
  arith_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, NUMERAL(m) * NUMERAL(n) == NUMERAL(m * n)) && _0 * _0 == _0 && (∀ n : Num, _0 * BIT0(n) == _0) && (∀ n : Num, _0 * BIT1(n) == _0) && (∀ n : Num, BIT0(n) * _0 == _0) && (∀ n : Num, BIT1(n) * _0 == _0) && (∀ m : Num, ∀ n : Num, BIT0(m) * BIT0(n) == BIT0(BIT0(m * n))) && (∀ m : Num, ∀ n : Num, BIT0(m) * BIT1(n) == BIT0(m) + BIT0(BIT0(m * n))) && (∀ m : Num, ∀ n : Num, BIT1(m) * BIT0(n) == BIT0(n) + BIT0(BIT0(m * n))) && (∀ m : Num, ∀ n : Num, BIT1(m) * BIT1(n) == BIT1(m) + (BIT0(n) + BIT0(BIT0(m * n))))"),
      t16,
    ),
  )
}

///|
let arith_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_MULT")

///|
/// `ARITH_MULT`
pub fn arith_mult() -> @kernel.Thm {
  arith_mult_c.get()
}

///|
/// ARITH_EXP
fn step_9() -> Unit raise {
  let t26 = denumeral(@arith.mult_clauses())
  let t27 = @simp.rewrite_tac(
    @list.List([denumeral(@arith.exp()), t26, @arith.exp_add()]),
  )
  let t25 = @tactics.try_tac(
    @simp.gen_rewrite_tac(
      fn(
        x24 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x18 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s19 = @equal.land_conv(x18)
          fn(x20 : @kernel.Term) -> @kernel.Thm raise { s19(x20) }
        })(
          (fn(
            x21 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s22 = @equal.rand_conv(x21)
            fn(x23 : @kernel.Term) -> @kernel.Thm raise { s22(x23) }
          })(x24),
        )
      },
      @list.List([@arith.bit0(), @arith.bit1()]),
    ),
  )
  let t17 = @tactics.repeat_tac(@tactics.strip_tac)
  let t28 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral()])), t17),
      t25,
    ),
    t27,
  )
  arith_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, EXP(NUMERAL(m), NUMERAL(n)) == NUMERAL(EXP(m, n))) && EXP(_0, _0) == BIT1(_0) && (∀ m : Num, EXP(BIT0(m), _0) == BIT1(_0)) && (∀ m : Num, EXP(BIT1(m), _0) == BIT1(_0)) && (∀ n : Num, EXP(_0, BIT0(n)) == EXP(_0, n) * EXP(_0, n)) && (∀ m : Num, ∀ n : Num, EXP(BIT0(m), BIT0(n)) == EXP(BIT0(m), n) * EXP(BIT0(m), n)) && (∀ m : Num, ∀ n : Num, EXP(BIT1(m), BIT0(n)) == EXP(BIT1(m), n) * EXP(BIT1(m), n)) && (∀ n : Num, EXP(_0, BIT1(n)) == _0) && (∀ m : Num, ∀ n : Num, EXP(BIT0(m), BIT1(n)) == BIT0(m) * (EXP(BIT0(m), n) * EXP(BIT0(m), n))) && (∀ m : Num, ∀ n : Num, EXP(BIT1(m), BIT1(n)) == BIT1(m) * (EXP(BIT1(m), n) * EXP(BIT1(m), n)))"),
      t28,
    ),
  )
}

///|
let arith_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_EXP")

///|
/// `ARITH_EXP`
pub fn arith_exp() -> @kernel.Thm {
  arith_exp_c.get()
}

///|
/// ARITH_EVEN
fn step_10() -> Unit raise {
  let t29 = @simp.rewrite_tac(
    @list.List([
      @nums.numeral(),
      @arith.bit1(),
      @arith.bit0(),
      denumeral(@arith.even()),
      @arith.even_add(),
    ]),
  )
  arith_even_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, EVEN(NUMERAL(n)) == EVEN(n)) && EVEN(_0) == true && (∀ n : Num, EVEN(BIT0(n)) == true) && (∀ n : Num, EVEN(BIT1(n)) == false)"),
      t29,
    ),
  )
}

///|
let arith_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_EVEN")

///|
/// `ARITH_EVEN`
pub fn arith_even() -> @kernel.Thm {
  arith_even_c.get()
}

///|
/// ARITH_ODD
fn step_11() -> Unit raise {
  let t30 = @simp.rewrite_tac(
    @list.List([
      @nums.numeral(),
      @arith.bit1(),
      @arith.bit0(),
      denumeral(@arith.odd()),
      @arith.odd_add(),
    ]),
  )
  arith_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, ODD(NUMERAL(n)) == ODD(n)) && ODD(_0) == false && (∀ n : Num, ODD(BIT0(n)) == false) && (∀ n : Num, ODD(BIT1(n)) == true)"),
      t30,
    ),
  )
}

///|
let arith_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_ODD")

///|
/// `ARITH_ODD`
pub fn arith_odd() -> @kernel.Thm {
  arith_odd_c.get()
}

///|
/// ARITH_LE
fn step_12() -> Unit raise {
  let t56 = @simp.rewrite_tac(
    @list.List([
      @arith.even_mult(),
      @arith.even_add(),
      @nums.numeral(),
      @arith.bit1(),
      @arith.even(),
    ]),
  )
  let t52 = @term_syntax.parse_term("EVEN")
  let t55 = @tactics.disch_then(fn(
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
      x49 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s50 = @tactics.mp_tac(x49)
      fn(
        x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s50(x51)
      }
    })(((x53 : @kernel.Thm) => @equal.ap_term(t52, x53))(x54))
  })
  let t48 = @tactics.subgoal_then(
    @term_syntax.parse_term("!(SUC(1) * (m : Num) == SUC(SUC(1) * (n : Num)))"),
    fn(
      x46 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x46
      @simp.rewrite_tac(@list.List([th_1]))
    },
  )
  let t44 = @term_syntax.parse_term("(n : Num)")
  let t45 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t44]),
  )
  let t43 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@theorems.disj_sym()]))(
        @arith.le_lt(),
      ),
    ]),
  )
  let t57 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                denumeral(@nums.not_suc()),
                @nums.not_suc(),
                @arith.eq_mult_lcancel(),
              ]),
            ),
            t43,
          ),
          t45,
        ),
        t48,
      ),
      t55,
    ),
    t56,
  )
  let t58 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @nums.numeral(),
        @arith.bit0(),
        @arith.bit1(),
        denumeral(@arith.add_clauses()),
      ]),
    ),
    t57,
  ])
  let t42 = @tactics.subgoal_then(@term_syntax.parse_term("2 == SUC(1)"), fn(
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
    let th = x40
    @simp.rewrite_tac(@list.List([th]))
  })
  let t39 = @simp.rewrite_tac(@list.List([@arith.lt_mult_lcancel()]))
  let t38 = @simp.rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t37 = @simp.rewrite_tac(@list.List([denumeral(@nums.not_suc())]))
  let t35 = denumeral(@nums.not_suc())
  let t36 = @simp.rewrite_tac(
    @list.List([
      @arith.le_mult_lcancel(),
      @nums.suc_inj(),
      denumeral(@arith.mult_eq_0()),
      t35,
    ]),
  )
  let t33 = @equal.gsym(@arith.mult_2())
  let t34 = @simp.rewrite_tac(@list.List([denumeral(@arith.le()), t33]))
  let t32 = @simp.rewrite_tac(@list.List([denumeral(@arith.le_0())]))
  let t31 = denumeral(@equal.gsym(@nums.not_suc()))
  let t59 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @nums.numeral(),
                      @arith.bit1(),
                      @arith.bit0(),
                      denumeral(@nums.not_suc()),
                      t31,
                      @nums.suc_inj(),
                    ]),
                  ),
                  t32,
                ),
                t34,
              ),
              t36,
            ),
            t37,
          ),
          t38,
        ),
        t39,
      ),
      t42,
    ),
    t58,
  )
  arith_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (NUMERAL(m) <= NUMERAL(n)) == (m <= n)) && (_0 <= _0) == true && (∀ n : Num, (BIT0(n) <= _0) == (n <= _0)) && (∀ n : Num, (BIT1(n) <= _0) == false) && (∀ n : Num, (_0 <= BIT0(n)) == true) && (∀ n : Num, (_0 <= BIT1(n)) == true) && (∀ m : Num, ∀ n : Num, (BIT0(m) <= BIT0(n)) == (m <= n)) && (∀ m : Num, ∀ n : Num, (BIT0(m) <= BIT1(n)) == (m <= n)) && (∀ m : Num, ∀ n : Num, (BIT1(m) <= BIT0(n)) == (m < n)) && (∀ m : Num, ∀ n : Num, (BIT1(m) <= BIT1(n)) == (m <= n))"),
      t59,
    ),
  )
}

///|
let arith_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_LE")

///|
/// `ARITH_LE`
pub fn arith_le() -> @kernel.Thm {
  arith_le_c.get()
}

///|
/// ARITH_LT
fn step_13() -> Unit raise {
  let t60 = @simp.rewrite_tac(@list.List([denumeral(@arith.le())]))
  let t61 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@nums.numeral(), @equal.gsym(@arith.not_le()), arith_le()]),
    ),
    t60,
  )
  arith_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (NUMERAL(m) < NUMERAL(n)) == (m < n)) && (_0 < _0) == false && (∀ n : Num, (BIT0(n) < _0) == false) && (∀ n : Num, (BIT1(n) < _0) == false) && (∀ n : Num, (_0 < BIT0(n)) == (_0 < n)) && (∀ n : Num, (_0 < BIT1(n)) == true) && (∀ m : Num, ∀ n : Num, (BIT0(m) < BIT0(n)) == (m < n)) && (∀ m : Num, ∀ n : Num, (BIT0(m) < BIT1(n)) == (m <= n)) && (∀ m : Num, ∀ n : Num, (BIT1(m) < BIT0(n)) == (m < n)) && (∀ m : Num, ∀ n : Num, (BIT1(m) < BIT1(n)) == (m < n))"),
      t61,
    ),
  )
}

///|
let arith_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_LT")

///|
/// `ARITH_LT`
pub fn arith_lt() -> @kernel.Thm {
  arith_lt_c.get()
}

///|
/// ARITH_GE
fn step_14() -> Unit raise {
  let t62 = @equal.gsym(@arith.gt())
  arith_ge_c.set(
    @simp.rewrite_rule(@list.List([@equal.gsym(@arith.ge()), t62]))(arith_le()),
  )
}

///|
let arith_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_GE")

///|
/// `ARITH_GE`
pub fn arith_ge() -> @kernel.Thm {
  arith_ge_c.get()
}

///|
/// ARITH_GT
fn step_15() -> Unit raise {
  let t63 = @equal.gsym(@arith.gt())
  arith_gt_c.set(
    @simp.rewrite_rule(@list.List([@equal.gsym(@arith.ge()), t63]))(arith_lt()),
  )
}

///|
let arith_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_GT")

///|
/// `ARITH_GT`
pub fn arith_gt() -> @kernel.Thm {
  arith_gt_c.get()
}

///|
/// ARITH_EQ
fn step_16() -> Unit raise {
  let t64 = @simp.rewrite_tac(
    @list.List([
      @arith.let_antisym(),
      @arith.lte_antisym(),
      denumeral(@arith.le_0()),
    ]),
  )
  let t65 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@nums.numeral(), @equal.gsym(@arith.le_antisym()), arith_le()]),
    ),
    t64,
  )
  arith_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, (NUMERAL(m) == NUMERAL(n)) == (m == n)) && (_0 == _0) == true && (∀ n : Num, (BIT0(n) == _0) == (n == _0)) && (∀ n : Num, (BIT1(n) == _0) == false) && (∀ n : Num, (_0 == BIT0(n)) == (_0 == n)) && (∀ n : Num, (_0 == BIT1(n)) == false) && (∀ m : Num, ∀ n : Num, (BIT0(m) == BIT0(n)) == (m == n)) && (∀ m : Num, ∀ n : Num, (BIT0(m) == BIT1(n)) == false) && (∀ m : Num, ∀ n : Num, (BIT1(m) == BIT0(n)) == false) && (∀ m : Num, ∀ n : Num, (BIT1(m) == BIT1(n)) == (m == n))"),
      t65,
    ),
  )
}

///|
let arith_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_EQ")

///|
/// `ARITH_EQ`
pub fn arith_eq() -> @kernel.Thm {
  arith_eq_c.get()
}

///|
/// ARITH_SUB
fn step_17() -> Unit raise {
  let t81 = @simp.rewrite_tac(
    @list.List([@arith.add_sub2(), @equal.gsym(@arith.add_assoc())]),
  )
  let t80 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @arith.left_add_distrib()]),
  )
  let t76 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t77 = @tactics.choose_then(fn(
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
    let s74 = @tactics.subst1_tac(x73)
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
  })
  let t79 = @tactics.pop_assum(fn(
    x78 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t77(t76(x78))
  })
  let t72 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_suc_lt(), @arith.lt_mult_lcancel(), arith_eq()]),
  )
  let t71 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.not_le()])),
  )
  let t70 = @simp.rewrite_tac(@list.List([denumeral(@arith.sub_eq_0())]))
  let t69 = @tactics.repeat_tac(@tactics.gen_tac)
  let t68 = @simp.rewrite_tac(@list.List([@arith.sub()]))
  let t67 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.mult_2()),
      @arith.sub_suc(),
      @arith.left_sub_distrib(),
    ]),
  )
  let t66 = @simp.pure_rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()]))
  let t82 = @tactics.then_tac(
    @tactics.then_tac(
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
                            @nums.numeral(),
                            denumeral(@arith.sub_0()),
                          ]),
                        ),
                        t66,
                      ),
                      t67,
                    ),
                    t68,
                  ),
                  t69,
                ),
                @class.cond_cases_tac,
              ),
              t70,
            ),
            t71,
          ),
          t72,
        ),
        t79,
      ),
      t80,
    ),
    t81,
  )
  arith_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, NUMERAL(m) - NUMERAL(n) == NUMERAL(m - n)) && _0 - _0 == _0 && (∀ n : Num, _0 - BIT0(n) == _0) && (∀ n : Num, _0 - BIT1(n) == _0) && (∀ n : Num, BIT0(n) - _0 == BIT0(n)) && (∀ n : Num, BIT1(n) - _0 == BIT1(n)) && (∀ m : Num, ∀ n : Num, BIT0(m) - BIT0(n) == BIT0(m - n)) && (∀ m : Num, ∀ n : Num, BIT0(m) - BIT1(n) == PRE(BIT0(m - n))) && (∀ m : Num, ∀ n : Num, BIT1(m) - BIT0(n) == (if n <= m { BIT1(m - n) } else { _0 })) && (∀ m : Num, ∀ n : Num, BIT1(m) - BIT1(n) == BIT0(m - n))"),
      t82,
    ),
  )
}

///|
let arith_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_SUB")

///|
/// `ARITH_SUB`
pub fn arith_sub() -> @kernel.Thm {
  arith_sub_c.get()
}

///|
/// ARITH
fn step_18() -> Unit raise {
  arith_c.set(
    @lib.end_itlist(
      @bool.conj,
      @list.List([
        arith_zero(),
        arith_suc(),
        arith_pre(),
        arith_add(),
        arith_mult(),
        arith_exp(),
        arith_even(),
        arith_odd(),
        arith_eq(),
        arith_le(),
        arith_lt(),
        arith_ge(),
        arith_gt(),
        arith_sub(),
      ]),
    ),
  )
}

///|
let arith_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH")

///|
/// `ARITH`
pub fn arith() -> @kernel.Thm {
  arith_c.get()
}

///|
/// EXP_2_NE_0
fn step_19() -> Unit raise {
  let t83 = @simp.rewrite_tac(@list.List([@arith.exp_eq_0(), arith_eq()]))
  exp_2_ne_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(EXP(2, n) == 0)"), t83),
  )
}

///|
let exp_2_ne_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_2_NE_0")

///|
/// `EXP_2_NE_0`
pub fn exp_2_ne_0() -> @kernel.Thm {
  exp_2_ne_0_c.get()
}

///|
/// NUM_EVEN_CONV
fn step_20() -> Unit raise {
  let (tth, rths) = @bool.conj_pair(arith_even())
  let t86 = @simp.gen_rewrite_conv(
    fn(
      x85 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x85
    },
    @list.List([rths]),
  )
  num_even_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x84 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x84
        },
        @list.List([tth]),
      ),
      t86,
    ),
  )
}

///|
let num_even_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_EVEN_CONV")

///|
/// `NUM_EVEN_CONV`
pub fn num_even_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_even_conv_c.get()(x)
}

///|
/// NUM_ODD_CONV
fn step_21() -> Unit raise {
  let (tth, rths) = @bool.conj_pair(arith_odd())
  let t89 = @simp.gen_rewrite_conv(
    fn(
      x88 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x88
    },
    @list.List([rths]),
  )
  num_odd_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x87 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x87
        },
        @list.List([tth]),
      ),
      t89,
    ),
  )
}

///|
let num_odd_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_ODD_CONV")

///|
/// `NUM_ODD_CONV`
pub fn num_odd_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_odd_conv_c.get()(x)
}

///|
let num_suc_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_SUC_CONV",
)

///|
/// `NUM_SUC_CONV`
pub fn num_suc_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_suc_conv_c.get()(x)
}

///|
let num_add_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_ADD_CONV",
)

///|
/// `NUM_ADD_CONV`
pub fn num_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_add_conv_c.get()(x)
}

///|
let num_mult_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_MULT_CONV",
)

///|
/// `NUM_MULT_CONV`
pub fn num_mult_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_mult_conv_c.get()(x)
}

///|
let num_exp_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_EXP_CONV",
)

///|
/// `NUM_EXP_CONV`
pub fn num_exp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_exp_conv_c.get()(x)
}

///|
let num_lt_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_LT_CONV",
)

///|
/// `NUM_LT_CONV`
pub fn num_lt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_lt_conv_c.get()(x)
}

///|
let num_le_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_LE_CONV",
)

///|
/// `NUM_LE_CONV`
pub fn num_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_le_conv_c.get()(x)
}

///|
let num_eq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_EQ_CONV",
)

///|
/// `NUM_EQ_CONV`
pub fn num_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_eq_conv_c.get()(x)
}

///|
/// NUM_SUC_CONV, NUM_ADD_CONV, NUM_MULT_CONV, NUM_EXP_CONV, NUM_LT_CONV, NUM_LE_CONV, NUM_EQ_CONV
fn step_22() -> Unit raise {
  let num_ty = @kernel.type_of(@equal.lhand(@kernel.concl(@nums.zero_def())))
  let (
    num_suc_conv_1,
    num_add_conv_1,
    num_mult_conv_1,
    num_exp_conv_2,
    num_lt_conv_1,
    num_le_conv_1,
    num_eq_conv_1,
  ) = match @nums.mk_small_numeral(2L) {
    @kernel.Term::Comb(
      numeral_tm,
      @kernel.Term::Comb(bit0_tm, @kernel.Term::Comb(bit1_tm, zero_tm))
    ) => {
      let suc_tm = @kernel.rator(@kernel.rand(@kernel.concl(@arith.two())))
      let one_tm = @kernel.rand(@nums.mk_small_numeral(1L))
      let add_tm = @kernel.rator(
        @kernel.rator(
          @equal.lhand(@basics.strip_forall(@kernel.concl(@arith.add_0())).1),
        ),
      )
      let mul_tm = @kernel.rator(
        @kernel.rator(
          @kernel.rand(@basics.strip_forall(@kernel.concl(@arith.exp_2())).1),
        ),
      )
      let exp_tm = @kernel.rator(
        @kernel.rator(
          @equal.lhand(@basics.strip_forall(@kernel.concl(@arith.exp_2())).1),
        ),
      )
      let eq_tm = @kernel.rator(@kernel.rator(@kernel.concl(@arith.two())))
      let num_0 = @num.num_of_int64(0L)
      let num_1 = @num.num_of_int64(1L)
      let num_2 = @num.num_of_int64(2L)
      let a_tm = @kernel.mk_var("a", num_ty)
      let b_tm = @kernel.mk_var("b", num_ty)
      let c_tm = @kernel.mk_var("c", num_ty)
      let d_tm = @kernel.mk_var("d", num_ty)
      let e_tm = @kernel.mk_var("e", num_ty)
      let h_tm = @kernel.mk_var("h", num_ty)
      let l_tm = @kernel.mk_var("l", num_ty)
      let m_tm = @kernel.mk_var("m", num_ty)
      let n_tm = @kernel.mk_var("n", num_ty)
      let p_tm = @kernel.mk_var("p", num_ty)
      let ilist = @list.List([
        (bit0_tm, bit0_tm),
        (bit1_tm, bit1_tm),
        (zero_tm, zero_tm),
        (suc_tm, suc_tm),
        (add_tm, add_tm),
        (mul_tm, mul_tm),
        (exp_tm, exp_tm),
        (eq_tm, eq_tm),
        (numeral_tm, numeral_tm),
        (a_tm, a_tm),
        (b_tm, b_tm),
        (c_tm, c_tm),
        (d_tm, d_tm),
        (e_tm, e_tm),
        (h_tm, h_tm),
        (l_tm, l_tm),
        (m_tm, m_tm),
        (n_tm, n_tm),
        (p_tm, p_tm),
      ])
      fn replace(x90 : @kernel.Term) -> @kernel.Term raise {
        let tm = x90
        match tm {
          @kernel.Term::Var(_, _) | @kernel.Term::Const(_, _) =>
            @lib.rev_assocd(tm, ilist, tm)
          @kernel.Term::Comb(s, t) => {
            let t91 = replace(t)
            @kernel.mk_comb(replace(s), t91)
          }
          @kernel.Term::Abs(_, _) => raise Failure("replace")
        }
      }
      let standardize : (@kernel.Thm) -> @kernel.Thm raise = fn(
        x92 : @kernel.Thm,
      ) -> @kernel.Thm raise {
        let th = x92
        let tm_p = replace(@kernel.concl(th))
        @kernel.eq_mp(@kernel.refl(tm_p), th)
      }
      let refl_bit0 = standardize(@kernel.refl(bit0_tm))
      let refl_bit1 = standardize(@kernel.refl(bit1_tm))
      let ap_bit0 : (@kernel.Thm) -> @kernel.Thm raise = fn(
        x93 : @kernel.Thm,
      ) -> @kernel.Thm raise {
        let th_1 = x93
        @kernel.mk_comb_rule(refl_bit0, th_1)
      }
      let ap_bit1 : (@kernel.Thm) -> @kernel.Thm raise = fn(
        x94 : @kernel.Thm,
      ) -> @kernel.Thm raise {
        let th_2 = x94
        @kernel.mk_comb_rule(refl_bit1, th_2)
      }
      let quick_prove_hyp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
        x95 : @kernel.Thm,
      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let ath = x95
        fn(x96 : @kernel.Thm) -> @kernel.Thm raise {
          let bth = x96
          @kernel.eq_mp(@kernel.deduct_antisym_rule(ath, bth), ath)
        }
      }
      fn dest_raw_numeral(x97 : @kernel.Term) -> @num.Num raise {
        let tm_1 = x97
        match tm_1 {
          @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), t_1) =>
            @num.add_num(@num.mult_num(num_2, dest_raw_numeral(t_1)), num_1)
          @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), t_2) =>
            @num.mult_num(num_2, dest_raw_numeral(t_2))
          @kernel.Term::Const("_0", _) => num_0
          _ => raise @lib.MatchFailure("tscript.ml:259")
        }
      }
      fn bctr(
        x98 : Int64,
        x99 : Int64,
        x100 : @kernel.Term,
      ) -> (Int64, Int64) raise {
        let w = x98
        let z = x99
        let tm_2 = x100
        match tm_2 {
          @kernel.Term::Const("_0", _) => (w, z)
          @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), t_3) =>
            bctr(w, @lib.add63(z, 1L), t_3)
          @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), t_4) =>
            bctr(@lib.add63(w, 1L), z, t_4)
          _ => raise Failure("malformed numeral")
        }
      }
      let bitcounts : (@kernel.Term) -> (Int64, Int64) raise = (
        x101 : @kernel.Term,
      ) => bctr(0L, 0L, x101)
      fn wellformed(x102 : @kernel.Term) -> Bool raise {
        let tm_3 = x102
        match tm_3 {
          @kernel.Term::Const("_0", _) => true
          @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), t_5)
          | @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), t_5) =>
            wellformed(t_5)
          _ => false
        }
      }
      fn orderrelation(
        x103 : @kernel.Term,
        x104 : @kernel.Term,
      ) -> Int64 raise {
        let mtm = x103
        let ntm = x104
        if physical_equal(mtm, ntm) {
          if wellformed(mtm) {
            0L
          } else {
            raise Failure("orderrelation")
          }
        } else {
          match (mtm, ntm) {
            (@kernel.Term::Const("_0", _), @kernel.Term::Const("_0", _)) => 0L
            (@kernel.Term::Const("_0", _), _) =>
              if wellformed(ntm) {
                -1L
              } else {
                raise Failure("orderrelation")
              }
            (_, @kernel.Term::Const("_0", _)) =>
              if wellformed(ntm) {
                1L
              } else {
                raise Failure("orderrelation")
              }
            (
              @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt),
              @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt),
            )
            | (
              @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt),
              @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt),
            ) => orderrelation(mt, nt)
            (
              @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_1),
              @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt_1),
            ) => if orderrelation(mt_1, nt_1) > 0L { 1L } else { -1L }
            (
              @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_2),
              @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt_2),
            ) => if orderrelation(mt_2, nt_2) < 0L { -1L } else { 1L }
            _ => raise @lib.MatchFailure("tscript.ml:280")
          }
        }
      }
      let doublebn : (@kernel.Term) -> @kernel.Term raise = fn(
        x105 : @kernel.Term,
      ) -> @kernel.Term raise {
        let tm_4 = x105
        if tm_4 == zero_tm {
          tm_4
        } else {
          @kernel.mk_comb(bit0_tm, tm_4)
        }
      }
      let subbn = (x106 : @kernel.Term, x107 : @kernel.Term) => {
        subbn_l(doublebn, bit1_tm, x106, x107)
      }
      let sbcbn = (x108 : @kernel.Term, x109 : @kernel.Term) => {
        sbcbn_l(doublebn, bit1_tm, x108, x109)
      }
      let topsplit : (@kernel.Term) -> (Int64, @kernel.Term) raise = fn(
        x110 : @kernel.Term,
      ) -> (Int64, @kernel.Term) raise {
        let tm_5 = x110
        match tm_5 {
          @kernel.Term::Const("_0", _) => (0L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Const("_0", _)
          ) => (1L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Const("_0", _)
            )
          ) => (2L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Const("_0", _)
            )
          ) => (3L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Const("_0", _)
              )
            )
          ) => (4L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Const("_0", _)
              )
            )
          ) => (5L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Const("_0", _)
              )
            )
          ) => (6L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Const("_0", _)
              )
            )
          ) => (7L, zero_tm)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n)
              )
            )
          ) => (0L, n)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_1)
              )
            )
          ) => (1L, n_1)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_2)
              )
            )
          ) => (2L, n_2)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_3)
              )
            )
          ) => (3L, n_3)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_4)
              )
            )
          ) => (4L, n_4)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_5)
              )
            )
          ) => (5L, n_5)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_6)
              )
            )
          ) => (6L, n_6)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), n_7)
              )
            )
          ) => (7L, n_7)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_8)
              )
            )
          ) => (8L, n_8)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_9)
              )
            )
          ) => (9L, n_9)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_10)
              )
            )
          ) => (10L, n_10)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_11)
              )
            )
          ) => (11L, n_11)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_12)
              )
            )
          ) => (12L, n_12)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT0", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_13)
              )
            )
          ) => (13L, n_13)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT0", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_14)
              )
            )
          ) => (14L, n_14)
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Comb(
                @kernel.Term::Const("BIT1", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), n_15)
              )
            )
          ) => (15L, n_15)
          _ => raise Failure("malformed numeral")
        }
      }
      fn mk_compnumeral(
        x111 : Int64,
        x112 : @kernel.Term,
      ) -> @kernel.Term raise {
        let k = x111
        let base = x112
        if k == 0L {
          base
        } else {
          let t_6 = mk_compnumeral(@lib.div63(k, 2L), base)
          if @lib.mod63(k, 2L) == 1L {
            @kernel.mk_comb(bit1_tm, t_6)
          } else {
            @kernel.mk_comb(bit0_tm, t_6)
          }
        }
      }
      let bases : (@kernel.Term) -> @list.List[@kernel.Term] raise = fn(
        x113 : @kernel.Term,
      ) -> @list.List[@kernel.Term] raise {
        let v = x113
        let part2 = @lib.map(
          fn(x114 : Int64) -> @kernel.Term raise {
            let k_1 = x114
            mk_compnumeral(k_1, v)
          },
          @lib.range(8L, 15L),
        )
        let t115 = @kernel.mk_comb(bit1_tm, v)
        let t116 = @list.List([(@kernel.mk_comb(bit0_tm, v), t115)])
        let part1 = @lib.map(
          (x117 : @kernel.Term) => @basics.subst(t116, x117),
          part2,
        )
        let part0 = @lib.map(
          fn(x118 : Int64) -> @kernel.Term raise {
            let k_2 = x118
            mk_compnumeral(k_2, zero_tm)
          },
          @lib.range(0L, 15L),
        )
        part0.concat(part1.concat(part2))
      }
      let t121 = bases(n_tm)
      let starts = @lib.allpairs(
        fn(x119 : @kernel.Term, x120 : @kernel.Term) -> @kernel.Term raise {
          let mtm_3 = x119
          let ntm_3 = x120
          @kernel.mk_comb(@kernel.mk_comb(add_tm, mtm_3), ntm_3)
        },
        bases(m_tm),
        t121,
      )
      let t124 = @simp.rewrite_tac(
        @list.List([@nums.suc_inj(), @arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t123 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t125 = @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()])),
          t123,
        ),
        t124,
      )
      let t126 = (
        @term_syntax.parse_term("(BIT0((m : Num)) == BIT0((n : Num))) == (m == n) && (BIT1(m) == BIT1(n)) == (m == n)"),
        t125,
      )
      let bits_inj = standardize(
        (fn(
          x122 : (
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
          @tactics.prove(x122.0, x122.1)
        })(t126),
      )
      let t128 = @term_syntax.parse_term("(m : Num) + _0 == m && _0 + (n : Num) == n")
      let arith_0 = standardize(
        ((x127 : @kernel.Term) => {
          @meson.meson(
            @list.List([@nums.numeral(), @arith.add_clauses()]),
            x127,
          )
        })(t128),
      )
      let t130 = @term_syntax.parse_term("SUC((n : Num))")
      let t131 = (@term_syntax.parse_term("SUC(_0 + (n : Num))"), t130)
      let t129 = @term_syntax.parse_term("SUC((m : Num))")
      let t132 = @list.List([(@term_syntax.parse_term("SUC((m : Num) + _0)"), t129), t131])
      let patadj : (@kernel.Term) -> @kernel.Term raise = (x133 : @kernel.Term) => {
        @basics.subst(t132, x133)
      }
      let mkclauses : (Bool) -> ((@kernel.Term) -> (@kernel.Thm, Int64) raise) raise = fn(
        x134 : Bool,
      ) -> ((@kernel.Term) -> (@kernel.Thm, Int64) raise) raise {
        let sucflag = x134
        fn(x135 : @kernel.Term) -> (@kernel.Thm, Int64) raise {
          let t_7 = x135
          let tm_6 = if sucflag { @kernel.mk_comb(suc_tm, t_7) } else { t_7 }
          let th1 = @simp.pure_rewrite_conv(
            @list.List([arith_add(), arith_suc(), arith_0]),
          )(tm_6)
          let tm1 = patadj(@kernel.rand(@kernel.concl(th1)))
          if !@basics.free_in(add_tm, tm1) {
            (th1, if @basics.free_in(m_tm, tm1) { 0L } else { 1L })
          } else {
            let ptm = @kernel.rand(
              @kernel.rand(@kernel.rand(@kernel.rand(tm1))),
            )
            let t136 = @basics.mk_eq(
              tm_6,
              @basics.subst(@list.List([(p_tm, ptm)]), tm1),
            )
            let tmc = @basics.mk_eq(@basics.mk_eq(ptm, p_tm), t136)
            let t137 = if @basics.free_in(suc_tm, tm1) { 3L } else { 2L }
            (
              @bool.eqt_elim(
                @simp.rewrite_conv(
                  @list.List([arith_add(), arith_suc(), arith_0, bits_inj]),
                )(tmc),
              ),
              t137,
            )
          }
        }
      }
      let (l1, l2) = @lib.unzip(@lib.map(mkclauses(false), starts))
      let t138 = @lib.array_of_list(l2)
      let (add_clauses, add_flags) = (
        @lib.array_of_list(@lib.map(standardize, l1)),
        t138,
      )
      let (l1_1, l2_1) = @lib.unzip(@lib.map(mkclauses(true), starts))
      let t139 = @lib.array_of_list(l2_1)
      let (adc_clauses, adc_flags) = (
        @lib.array_of_list(@lib.map(standardize, l1_1)),
        t139,
      )
      let num_add_rule = (x140 : @kernel.Term, x141 : @kernel.Term) => {
        num_add_rule_l(
          topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses,
          adc_flags, x140, x141,
        )
      }
      let num_adc_rule = (x142 : @kernel.Term, x143 : @kernel.Term) => {
        num_adc_rule_l(
          topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses,
          adc_flags, x142, x143,
        )
      }
      let (num_add_rule_1, num_adc_rule_1) = (
        fn(x144 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x145 : @kernel.Term) -> @kernel.Thm raise {
            num_add_rule(x144, x145)
          }
        },
        fn(x146 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x147 : @kernel.Term) -> @kernel.Thm raise {
            num_adc_rule(x146, x147)
          }
        },
      )
      let t152 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t149 = @equal.gsym(@arith.left_add_distrib())
      let t150 = @equal.gsym(@arith.mult_assoc())
      let t151 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.mult_2()), t150, t149]),
      )
      let t153 = @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()])),
          t151,
        ),
        t152,
      )
      let t154 = (
        @term_syntax.parse_term("((n : Num) == (a : Num) + (p : Num) * (b : Num)) == (BIT0(n) == BIT0(a) + BIT0(p) * b)"),
        t153,
      )
      let pth_0 = standardize(
        (fn(
          x148 : (
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
          @tactics.prove(x148.0, x148.1)
        })(t154),
      )
      let t158 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@arith.mult_assoc()),
          @arith.eq_mult_lcancel(),
          arith_eq(),
        ]),
      )
      let t157 = @simp.rewrite_tac(
        @list.List([@arith.add_clauses(), @equal.gsym(@arith.mult_2())]),
      )
      let t156 = @simp.rewrite_tac(@list.List([@arith.bit1(), @arith.bit0()]))
      let t159 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.subst1_tac(
              @equal.sym(@bool.spec(@term_syntax.parse_term("_0"), @nums.numeral())),
            ),
            t156,
          ),
          t157,
        ),
        t158,
      )
      let t160 = (
        @term_syntax.parse_term("((n : Num) == _0 + (p : Num) * (b : Num)) == (BIT0(n) == _0 + BIT0(p) * b)"),
        t159,
      )
      let pth_z = standardize(
        (fn(
          x155 : (
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
          @tactics.prove(x155.0, x155.1)
        })(t160),
      )
      let t165 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t162 = @equal.gsym(@arith.left_add_distrib())
      let t163 = @equal.gsym(@arith.mult_assoc())
      let t164 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@arith.mult_2()),
          t163,
          t162,
          @arith.add_clauses(),
          @nums.suc_inj(),
        ]),
      )
      let t166 = @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()])),
          t164,
        ),
        t165,
      )
      let t167 = (
        @term_syntax.parse_term("((n : Num) == (a : Num) + (p : Num) * (b : Num)) == (BIT1(n) == BIT1(a) + BIT0(p) * b)"),
        t166,
      )
      let pth_1 = standardize(
        (fn(
          x161 : (
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
          @tactics.prove(x161.0, x161.1)
        })(t167),
      )
      let t169 = @meson.meson_tac(
        @list.List([
          @arith.add_clauses(),
          @arith.mult_clauses(),
          @nums.numeral(),
        ]),
      )
      let t170 = (@term_syntax.parse_term("(n : Num) == _0 + BIT1(_0) * n"), t169)
      let pth_base = standardize(
        (fn(
          x168 : (
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
          @tactics.prove(x168.0, x168.1)
        })(t170),
      )
      let t173 = @simp.rewrite_tac(
        @list.List([@arith.add_eq_0(), @arith.mult_eq_0(), @arith.bit0()]),
      )
      let t172 = @tactics.subst1_tac(
        @equal.sym(@bool.spec(@term_syntax.parse_term("_0"), @nums.numeral())),
      )
      let t174 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.conv_tac(@equal.binop_conv(@equal.sym_conv)),
          t172,
        ),
        t173,
      )
      let t175 = (
        @term_syntax.parse_term("(_0 == (a : Num) + (p : Num) * (b : Num)) == (_0 == a + BIT0(p) * b)"),
        t174,
      )
      let pth_triv = standardize(
        (fn(
          x171 : (
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
          @tactics.prove(x171.0, x171.1)
        })(t175),
      )
      let t193 = @equal.gsym(@arith.mult_assoc())
      let t194 = @simp.rewrite_tac(
        @list.List([
          @arith.add_clauses(),
          @nums.suc_inj(),
          @arith.eq_mult_lcancel(),
          arith_eq(),
          @equal.gsym(@arith.left_add_distrib()),
          t193,
        ]),
      )
      let t192 = @tactics.first_x_assum(fn(
        x191 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
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
          let s189 = @tactics.subst1_tac(x188)
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
        })(@equal.sym(x191))
      })
      let t187 = @tactics.disch_then(fn(
        x185 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_4 = x185
        @simp.rewrite_tac(@list.List([th_4]))
      })
      let t184 = @tactics.disch_then(fn(
        x182 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_3 = x182
        @simp.rewrite_tac(@list.List([th_3]))
      })
      let t181 = @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2"))
      let t180 = @tactics.mp_tac(
        @simp.rewrite_rule(@list.List([@equal.gsym(@arith.mult_2())]))(
          @arith.bit1(),
        ),
      )
      let t195 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.mp_tac(
                    @simp.rewrite_rule(
                      @list.List([@equal.gsym(@arith.mult_2())]),
                    )(@arith.bit0()),
                  ),
                  t180,
                ),
                t181,
              ),
              t184,
            ),
            t187,
          ),
          t192,
        ),
        t194,
      )
      let t196 = (
        @term_syntax.parse_term("((n : Num) == (a : Num) + (p : Num) * (b : Num)) == (BIT0(BIT0(BIT0(BIT0(n)))) == BIT0(BIT0(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT0(BIT0(BIT0(n)))) == BIT1(BIT0(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT1(BIT0(BIT0(n)))) == BIT0(BIT1(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT1(BIT0(BIT0(n)))) == BIT1(BIT1(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT0(BIT1(BIT0(n)))) == BIT0(BIT0(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT0(BIT1(BIT0(n)))) == BIT1(BIT0(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT1(BIT1(BIT0(n)))) == BIT0(BIT1(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT1(BIT1(BIT0(n)))) == BIT1(BIT1(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT0(BIT0(BIT1(n)))) == BIT0(BIT0(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT0(BIT0(BIT1(n)))) == BIT1(BIT0(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT1(BIT0(BIT1(n)))) == BIT0(BIT1(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT1(BIT0(BIT1(n)))) == BIT1(BIT1(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT0(BIT1(BIT1(n)))) == BIT0(BIT0(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT0(BIT1(BIT1(n)))) == BIT1(BIT0(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT0(BIT1(BIT1(BIT1(n)))) == BIT0(BIT1(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == a + p * b) == (BIT1(BIT1(BIT1(BIT1(n)))) == BIT1(BIT1(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b)"),
        t195,
      )
      let pths_1 = (fn(x178 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
        (fn(x177 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
          (fn(x176 : @list.List[@kernel.Thm]) -> FixedArray[@kernel.Thm] raise {
            @lib.array_of_list(x176)
          })(@bool.conjuncts_rule(x177))
        })(standardize(x178))
      })(
        (fn(
          x179 : (
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
          @tactics.prove(x179.0, x179.1)
        })(t196),
      )
      let t215 = @equal.gsym(@arith.mult_assoc())
      let t216 = @simp.rewrite_tac(
        @list.List([
          @arith.add_clauses(),
          @nums.suc_inj(),
          @arith.eq_mult_lcancel(),
          arith_eq(),
          @equal.gsym(@arith.left_add_distrib()),
          t215,
        ]),
      )
      let t214 = @tactics.first_x_assum(fn(
        x213 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
          let s211 = @tactics.subst1_tac(x210)
          fn(
            x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s211(x212)
          }
        })(@equal.sym(x213))
      })
      let t209 = @tactics.disch_then(fn(
        x207 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_6 = x207
        @simp.rewrite_tac(@list.List([th_6]))
      })
      let t206 = @tactics.disch_then(fn(
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
        let th_5 = x204
        @simp.rewrite_tac(@list.List([th_5]))
      })
      let t203 = @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2"))
      let t202 = @tactics.mp_tac(
        @simp.rewrite_rule(@list.List([@equal.gsym(@arith.mult_2())]))(
          @arith.bit1(),
        ),
      )
      let t201 = @tactics.mp_tac(
        @simp.rewrite_rule(@list.List([@equal.gsym(@arith.mult_2())]))(
          @arith.bit0(),
        ),
      )
      let t217 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.subst1_tac(
                      @meson.meson(
                        @list.List([@nums.numeral()]),
                        @term_syntax.parse_term("_0 == 0"),
                      ),
                    ),
                    t201,
                  ),
                  t202,
                ),
                t203,
              ),
              t206,
            ),
            t209,
          ),
          t214,
        ),
        t216,
      )
      let t218 = (
        @term_syntax.parse_term("((n : Num) == _0 + (p : Num) * (b : Num)) == (BIT0(BIT0(BIT0(BIT0(n)))) == _0 + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT0(BIT0(BIT0(n)))) == BIT1(_0) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT1(BIT0(BIT0(n)))) == BIT0(BIT1(_0)) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT1(BIT0(BIT0(n)))) == BIT1(BIT1(_0)) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT0(BIT1(BIT0(n)))) == BIT0(BIT0(BIT1(_0))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT0(BIT1(BIT0(n)))) == BIT1(BIT0(BIT1(_0))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT1(BIT1(BIT0(n)))) == BIT0(BIT1(BIT1(_0))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT1(BIT1(BIT0(n)))) == BIT1(BIT1(BIT1(_0))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT0(BIT0(BIT1(n)))) == BIT0(BIT0(BIT0(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT0(BIT0(BIT1(n)))) == BIT1(BIT0(BIT0(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT1(BIT0(BIT1(n)))) == BIT0(BIT1(BIT0(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT1(BIT0(BIT1(n)))) == BIT1(BIT1(BIT0(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT0(BIT1(BIT1(n)))) == BIT0(BIT0(BIT1(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT0(BIT1(BIT1(n)))) == BIT1(BIT0(BIT1(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT0(BIT1(BIT1(BIT1(n)))) == BIT0(BIT1(BIT1(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b) && (n == _0 + p * b) == (BIT1(BIT1(BIT1(BIT1(n)))) == BIT1(BIT1(BIT1(BIT1(_0)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b)"),
        t217,
      )
      let pths_0 = (fn(x199 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
        (fn(x198 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
          (fn(x197 : @list.List[@kernel.Thm]) -> FixedArray[@kernel.Thm] raise {
            @lib.array_of_list(x197)
          })(@bool.conjuncts_rule(x198))
        })(standardize(x199))
      })(
        (fn(
          x200 : (
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
          @tactics.prove(x200.0, x200.1)
        })(t218),
      )
      fn num_shift_conv(
        x219 : Int64,
        x220 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let k_3 = x219
        let tm_7 = x220
        if k_3 <= 0L {
          @kernel.inst_rule(@list.List([(tm_7, n_tm)]), pth_base)
        } else {
          match tm_7 {
            @kernel.Term::Comb(
              _,
              @kernel.Term::Comb(
                _,
                @kernel.Term::Comb(_, @kernel.Term::Comb(_, _))
              )
            ) if k_3 >= 4L => {
              let (i, ntm_6) = topsplit(tm_7)
              let th1_3 = num_shift_conv(@lib.sub63(k_3, 4L), ntm_6)
              match @kernel.concl(th1_3) {
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, @kernel.Term::Const("_0", _)),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_5), btm)
                  )
                ) => {
                  let th2_4 = @lib.array_get(pths_0, @lib.int63_to_int(i))
                  let th3_4 = @kernel.inst_rule(
                    @list.List([(ntm_6, n_tm), (btm, b_tm), (ptm_5, p_tm)]),
                    th2_4,
                  )
                  @kernel.eq_mp(th3_4, th1_3)
                }
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, atm),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_6), btm_1)
                  )
                ) => {
                  let th2_5 = @lib.array_get(pths_1, @lib.int63_to_int(i))
                  let th3_5 = @kernel.inst_rule(
                    @list.List([
                      (ntm_6, n_tm),
                      (atm, a_tm),
                      (btm_1, b_tm),
                      (ptm_6, p_tm),
                    ]),
                    th2_5,
                  )
                  @kernel.eq_mp(th3_5, th1_3)
                }
                _ => raise @lib.MatchFailure("tscript.ml:573")
              }
            }
            @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_7) => {
              let th1_4 = num_shift_conv(@lib.sub63(k_3, 1L), ntm_7)
              match @kernel.concl(th1_4) {
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, @kernel.Term::Const("_0", _)),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_7), btm_2)
                  )
                ) =>
                  @kernel.eq_mp(
                    @kernel.inst_rule(
                      @list.List([(ntm_7, n_tm), (btm_2, b_tm), (ptm_7, p_tm)]),
                      pth_z,
                    ),
                    th1_4,
                  )
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, atm_1),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_8), btm_3)
                  )
                ) =>
                  @kernel.eq_mp(
                    @kernel.inst_rule(
                      @list.List([
                        (ntm_7, n_tm),
                        (atm_1, a_tm),
                        (btm_3, b_tm),
                        (ptm_8, p_tm),
                      ]),
                      pth_0,
                    ),
                    th1_4,
                  )
                _ => raise @lib.MatchFailure("tscript.ml:584")
              }
            }
            @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_8) => {
              let th1_5 = num_shift_conv(@lib.sub63(k_3, 1L), ntm_8)
              match @kernel.concl(th1_5) {
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, atm_2),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_9), btm_4)
                  )
                ) =>
                  @kernel.eq_mp(
                    @kernel.inst_rule(
                      @list.List([
                        (ntm_8, n_tm),
                        (atm_2, a_tm),
                        (btm_4, b_tm),
                        (ptm_9, p_tm),
                      ]),
                      pth_1,
                    ),
                    th1_5,
                  )
                _ => raise @lib.MatchFailure("tscript.ml:592")
              }
            }
            @kernel.Term::Const("_0", _) => {
              let th1_6 = num_shift_conv(@lib.sub63(k_3, 1L), tm_7)
              match @kernel.concl(th1_6) {
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Comb(_, atm_3),
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_10), btm_5)
                  )
                ) =>
                  @kernel.eq_mp(
                    @kernel.inst_rule(
                      @list.List([(atm_3, a_tm), (btm_5, b_tm), (ptm_10, p_tm)]),
                      pth_triv,
                    ),
                    th1_6,
                  )
                _ => raise @lib.MatchFailure("tscript.ml:598")
              }
            }
            _ => raise Failure("malformed numeral")
          }
        }
      }
      let num_shift_conv_1 : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
        x221 : Int64,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        fn(x222 : @kernel.Term) -> @kernel.Thm raise {
          num_shift_conv(x221, x222)
        }
      }
      let t224 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
      )
      let t225 = @tactics.then_tac(
        @tactics.subst1_tac(
          @equal.sym(@bool.spec(@term_syntax.parse_term("_0"), @nums.numeral())),
        ),
        t224,
      )
      let t226 = (@term_syntax.parse_term("(a : Num) + (p : Num) * _0 == a"), t225)
      let pth_triv_1 = standardize(
        (fn(
          x223 : (
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
          @tactics.prove(x223.0, x223.1)
        })(t226),
      )
      let t228 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
      )
      let t229 = @tactics.then_tac(
        @tactics.subst1_tac(
          @equal.sym(@bool.spec(@term_syntax.parse_term("BIT1(_0)"), @nums.numeral())),
        ),
        t228,
      )
      let t230 = (@term_syntax.parse_term("(a : Num) + BIT1(_0) * (b : Num) == a + b"), t229)
      let pth_base_1 = standardize(
        (fn(
          x227 : (
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
          @tactics.prove(x227.0, x227.1)
        })(t230),
      )
      let t233 = @equal.gsym(@arith.left_add_distrib())
      let t234 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.mult_assoc()), t233]),
      )
      let t232 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t235 = @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.bit0()])), t232),
        t234,
      )
      let t236 = (
        @term_syntax.parse_term("BIT0((a : Num)) + BIT0((p : Num)) * (b : Num) == BIT0(a + p * b)"),
        t235,
      )
      let pth_0_1 = standardize(
        (fn(
          x231 : (
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
          @tactics.prove(x231.0, x231.1)
        })(t236),
      )
      let t242 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t240 = @equal.gsym(@arith.left_add_distrib())
      let t241 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.mult_assoc()), t240]),
      )
      let t239 = @simp.rewrite_tac(
        @list.List([@arith.add_clauses(), @nums.suc_inj()]),
      )
      let t238 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t243 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()])),
              t238,
            ),
            t239,
          ),
          t241,
        ),
        t242,
      )
      let t244 = (
        @term_syntax.parse_term("BIT1((a : Num)) + BIT0((p : Num)) * (b : Num) == BIT1(a + p * b)"),
        t243,
      )
      let pth_1_1 = standardize(
        (fn(
          x237 : (
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
          @tactics.prove(x237.0, x237.1)
        })(t244),
      )
      let t248 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
      let t247 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
      let t246 = @simp.rewrite_tac(@list.List([@arith.bit1(), @arith.bit0()]))
      let t249 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.subst1_tac(
              @equal.sym(@bool.spec(@term_syntax.parse_term("_0"), @nums.numeral())),
            ),
            t246,
          ),
          t247,
        ),
        t248,
      )
      let t250 = (
        @term_syntax.parse_term("_0 + BIT0((p : Num)) * (b : Num) == BIT0(_0 + p * b)"),
        t249,
      )
      let pth_z_1 = standardize(
        (fn(
          x245 : (
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
          @tactics.prove(x245.0, x245.1)
        })(t250),
      )
      let t269 = @equal.gsym(@arith.mult_assoc())
      let t270 = @simp.rewrite_tac(
        @list.List([
          @arith.add_clauses(),
          @nums.suc_inj(),
          @arith.eq_mult_lcancel(),
          arith_eq(),
          @equal.gsym(@arith.left_add_distrib()),
          t269,
        ]),
      )
      let t268 = @tactics.first_x_assum(fn(
        x267 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x264 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s265 = @tactics.subst1_tac(x264)
          fn(
            x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s265(x266)
          }
        })(@equal.sym(x267))
      })
      let t263 = @tactics.disch_then(fn(
        x261 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_8 = x261
        @simp.rewrite_tac(@list.List([th_8]))
      })
      let t260 = @tactics.disch_then(fn(
        x258 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_7 = x258
        @simp.rewrite_tac(@list.List([th_7]))
      })
      let t257 = @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2"))
      let t256 = @tactics.mp_tac(
        @simp.rewrite_rule(@list.List([@equal.gsym(@arith.mult_2())]))(
          @arith.bit1(),
        ),
      )
      let t255 = @tactics.mp_tac(
        @simp.rewrite_rule(@list.List([@equal.gsym(@arith.mult_2())]))(
          @arith.bit0(),
        ),
      )
      let t271 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.subst1_tac(
                      @meson.meson(
                        @list.List([@nums.numeral()]),
                        @term_syntax.parse_term("_0 == 0"),
                      ),
                    ),
                    t255,
                  ),
                  t256,
                ),
                t257,
              ),
              t260,
            ),
            t263,
          ),
          t268,
        ),
        t270,
      )
      let t272 = (
        @term_syntax.parse_term("((a : Num) + (p : Num) * (b : Num) == (n : Num)) == (BIT0(BIT0(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT0(BIT0(BIT0(n))))) && (a + p * b == n) == (BIT1(BIT0(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT0(BIT0(BIT0(n))))) && (a + p * b == n) == (BIT0(BIT1(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT1(BIT0(BIT0(n))))) && (a + p * b == n) == (BIT1(BIT1(BIT0(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT1(BIT0(BIT0(n))))) && (a + p * b == n) == (BIT0(BIT0(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT0(BIT1(BIT0(n))))) && (a + p * b == n) == (BIT1(BIT0(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT0(BIT1(BIT0(n))))) && (a + p * b == n) == (BIT0(BIT1(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT1(BIT1(BIT0(n))))) && (a + p * b == n) == (BIT1(BIT1(BIT1(BIT0(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT1(BIT1(BIT0(n))))) && (a + p * b == n) == (BIT0(BIT0(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT0(BIT0(BIT1(n))))) && (a + p * b == n) == (BIT1(BIT0(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT0(BIT0(BIT1(n))))) && (a + p * b == n) == (BIT0(BIT1(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT1(BIT0(BIT1(n))))) && (a + p * b == n) == (BIT1(BIT1(BIT0(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT1(BIT0(BIT1(n))))) && (a + p * b == n) == (BIT0(BIT0(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT0(BIT1(BIT1(n))))) && (a + p * b == n) == (BIT1(BIT0(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT0(BIT1(BIT1(n))))) && (a + p * b == n) == (BIT0(BIT1(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT0(BIT1(BIT1(BIT1(n))))) && (a + p * b == n) == (BIT1(BIT1(BIT1(BIT1(a)))) + BIT0(BIT0(BIT0(BIT0(p)))) * b == BIT1(BIT1(BIT1(BIT1(n)))))"),
        t271,
      )
      let puths_1 = (fn(x253 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
        (fn(x252 : @kernel.Thm) -> FixedArray[@kernel.Thm] raise {
          (fn(x251 : @list.List[@kernel.Thm]) -> FixedArray[@kernel.Thm] raise {
            @lib.array_of_list(x251)
          })(@bool.conjuncts_rule(x252))
        })(standardize(x253))
      })(
        (fn(
          x254 : (
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
          @tactics.prove(x254.0, x254.1)
        })(t272),
      )
      let puths_2 = @lib.array_of_list(
        @lib.map(
          fn(x273 : Int64) -> @kernel.Thm raise {
            let i_1 = x273
            let th1_7 = @lib.array_get(
              puths_1,
              @lib.int63_to_int(@lib.mod63(i_1, 16L)),
            )
            let th2_6 = @lib.array_get(
              puths_1,
              @lib.int63_to_int(@lib.div63(i_1, 16L)),
            )
            let th3_6 = @simp.gen_rewrite_rule(
              fn(
                x274 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s275 = @equal.rand_conv(x274)
                fn(x276 : @kernel.Term) -> @kernel.Thm raise { s275(x276) }
              },
              @list.List([th1_7]),
            )(th2_6)
            standardize(th3_6)
          },
          @lib.range(0L, 255L),
        ),
      )
      fn num_unshift_conv(x277 : @kernel.Term) -> @kernel.Thm raise {
        let tm_8 = x277
        match tm_8 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("+", _), atm_4),
            @kernel.Term::Comb(
              @kernel.Term::Comb(@kernel.Term::Const("*", _), ptm_11),
              btm_6
            )
          ) =>
            match (atm_4, ptm_11, btm_6) {
              (_, _, @kernel.Term::Const("_0", _)) =>
                @kernel.inst_rule(
                  @list.List([(atm_4, a_tm), (ptm_11, p_tm)]),
                  pth_triv_1,
                )
              (
                _,
                @kernel.Term::Comb(
                  @kernel.Term::Const("BIT1", _),
                  @kernel.Term::Const("_0", _)
                ),
                _,
              ) => {
                let th1_8 = @kernel.inst_rule(
                  @list.List([(atm_4, a_tm), (btm_6, b_tm)]),
                  pth_base_1,
                )
                match @kernel.concl(th1_8) {
                  @kernel.Term::Comb(
                    _,
                    @kernel.Term::Comb(@kernel.Term::Comb(_, mtm_6), ntm_9)
                  ) => @kernel.trans(th1_8, num_add_rule_1(mtm_6)(ntm_9))
                  _ => raise @lib.MatchFailure("tscript.ml:699")
                }
              }
              (
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    _,
                    @kernel.Term::Comb(_, @kernel.Term::Comb(_, atm_p))
                  )
                ),
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    _,
                    @kernel.Term::Comb(
                      _,
                      @kernel.Term::Comb(_, @kernel.Term::Comb(_, _) as ptm_p)
                    )
                  )
                ),
                _,
              ) => {
                let (i_2, _) = topsplit(atm_4)
                match (atm_p, ptm_p) {
                  (
                    @kernel.Term::Comb(
                      _,
                      @kernel.Term::Comb(
                        _,
                        @kernel.Term::Comb(_, @kernel.Term::Comb(_, atm_p_p))
                      )
                    ),
                    @kernel.Term::Comb(
                      _,
                      @kernel.Term::Comb(
                        _,
                        @kernel.Term::Comb(
                          _,
                          @kernel.Term::Comb(
                            _,
                            @kernel.Term::Comb(_, _) as ptm_p_p
                          )
                        )
                      )
                    ),
                  ) => {
                    let (j, _) = topsplit(atm_p)
                    let t278 = @kernel.mk_comb(
                      @kernel.mk_comb(mul_tm, ptm_p_p),
                      btm_6,
                    )
                    let tm_p_1 = @kernel.mk_comb(
                      @kernel.mk_comb(add_tm, atm_p_p),
                      t278,
                    )
                    let th1_9 = num_unshift_conv(tm_p_1)
                    let t279 = @lib.array_get(
                      puths_2,
                      @lib.int63_to_int(@lib.add63(@lib.mul63(16L, j), i_2)),
                    )
                    let th2_7 = @kernel.inst_rule(
                      @list.List([
                        (atm_p_p, a_tm),
                        (ptm_p_p, p_tm),
                        (btm_6, b_tm),
                        (@kernel.rand(@kernel.concl(th1_9)), n_tm),
                      ]),
                      t279,
                    )
                    @kernel.eq_mp(th2_7, th1_9)
                  }
                  _ => {
                    let t280 = @kernel.mk_comb(
                      @kernel.mk_comb(mul_tm, ptm_p),
                      btm_6,
                    )
                    let tm_p_2 = @kernel.mk_comb(
                      @kernel.mk_comb(add_tm, atm_p),
                      t280,
                    )
                    let th1_10 = num_unshift_conv(tm_p_2)
                    let t281 = @lib.array_get(puths_1, @lib.int63_to_int(i_2))
                    let th2_8 = @kernel.inst_rule(
                      @list.List([
                        (atm_p, a_tm),
                        (ptm_p, p_tm),
                        (btm_6, b_tm),
                        (@kernel.rand(@kernel.concl(th1_10)), n_tm),
                      ]),
                      t281,
                    )
                    @kernel.eq_mp(th2_8, th1_10)
                  }
                }
              }
              (
                @kernel.Term::Const("_0", _),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), qtm),
                _,
              ) => {
                let th1_11 = @kernel.inst_rule(
                  @list.List([(btm_6, b_tm), (qtm, p_tm)]),
                  pth_z_1,
                )
                @equal.conv_rule(
                  @equal.rand_conv(@equal.rand_conv(num_unshift_conv)),
                  th1_11,
                )
              }
              (
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ctm),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), qtm_1),
                _,
              ) => {
                let th1_12 = @kernel.inst_rule(
                  @list.List([(ctm, a_tm), (btm_6, b_tm), (qtm_1, p_tm)]),
                  pth_0_1,
                )
                @equal.conv_rule(
                  @equal.rand_conv(@equal.rand_conv(num_unshift_conv)),
                  th1_12,
                )
              }
              (
                @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ctm_1),
                @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), qtm_2),
                _,
              ) => {
                let th1_13 = @kernel.inst_rule(
                  @list.List([(ctm_1, a_tm), (btm_6, b_tm), (qtm_2, p_tm)]),
                  pth_1_1,
                )
                @equal.conv_rule(
                  @equal.rand_conv(@equal.rand_conv(num_unshift_conv)),
                  th1_13,
                )
              }
              _ => raise Failure("malformed numeral")
            }
          _ => raise Failure("malformed numeral")
        }
      }
      let num_unshift_conv_1 : (@kernel.Term) -> @kernel.Thm raise = num_unshift_conv
      let t283 = @term_syntax.parse_term("EXP(0, 2)")
      let t284 = @meson.meson_tac(
        @list.List([
          @nums.numeral(),
          @simp.rewrite_conv(@list.List([arith()]))(t283),
        ]),
      )
      let t285 = (@term_syntax.parse_term("EXP(_0, 2) == _0"), t284)
      let pth_0_2 = standardize(
        (fn(
          x282 : (
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
          @tactics.prove(x282.0, x282.1)
        })(t285),
      )
      let t287 = @term_syntax.parse_term("EXP(1, 2)")
      let t288 = @meson.meson_tac(
        @list.List([
          @nums.numeral(),
          @simp.rewrite_conv(@list.List([arith()]))(t287),
        ]),
      )
      let t289 = (@term_syntax.parse_term("EXP(BIT1(_0), 2) == BIT1(_0)"), t288)
      let pth_1_2 = standardize(
        (fn(
          x286 : (
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
          @tactics.prove(x286.0, x286.1)
        })(t289),
      )
      let t297 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t295 = @term_syntax.parse_term("2 * (m : Num) * (2 * (n : Num)) == 2 * (2 * (m * n))")
      let t296 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.mult_ac())(t295)]),
      )
      let t294 = @simp.rewrite_tac(@list.List([@arith.exp_2()]))
      let t293 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t292 = @simp.expand_tac("two")
      let t291 = @simp.rewrite_tac(@list.List([@arith.bit0()]))
      let t298 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2")),
                  t291,
                ),
                t292,
              ),
              t293,
            ),
            t294,
          ),
          t296,
        ),
        t297,
      )
      let t299 = (
        @term_syntax.parse_term("(EXP((m : Num), 2) == (n : Num)) == (EXP(BIT0(m), 2) == BIT0(BIT0(n)))"),
        t298,
      )
      let pth_even = standardize(
        (fn(
          x290 : (
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
          @tactics.prove(x290.0, x290.1)
        })(t299),
      )
      let t323 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
      let t322 = @simp.gen_rewrite_tac(
        fn(
          x321 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x315 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s316 = @equal.rand_conv(x315)
            fn(x317 : @kernel.Term) -> @kernel.Thm raise { s316(x317) }
          })(
            (fn(
              x318 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s319 = @equal.rand_conv(x318)
              fn(x320 : @kernel.Term) -> @kernel.Thm raise { s319(x320) }
            })(x321),
          )
        },
        @list.List([@arith.add_sym()]),
      )
      let t314 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t312 = @equal.gsym(@arith.left_add_distrib())
      let t313 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.mult_assoc()), t312]),
      )
      let t309 = @term_syntax.parse_term("(m : Num) * (2 * m) == 2 * (m * m)")
      let t310 = @theorems.ac(@arith.mult_ac())(t309)
      let t311 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.mult_2()), t310]),
      )
      let t307 = @term_syntax.parse_term("(m : Num) + m * (2 * m) + m == m * (2 * m) + (m + m)")
      let t308 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.add_ac())(t307)]),
      )
      let t305 = @equal.gsym(@arith.left_add_distrib())
      let t306 = @simp.rewrite_tac(
        @list.List([@nums.suc_inj(), @equal.gsym(@arith.mult_assoc()), t305]),
      )
      let t304 = @simp.rewrite_tac(
        @list.List([@arith.exp_2(), @arith.mult_clauses(), @arith.add_clauses()]),
      )
      let t303 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t302 = @simp.expand_tac("two")
      let t301 = @simp.rewrite_tac(
        @list.List([@nums.numeral(), @arith.bit0(), @arith.bit1()]),
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2")),
                            t301,
                          ),
                          t302,
                        ),
                        t303,
                      ),
                      t304,
                    ),
                    t306,
                  ),
                  t308,
                ),
                t311,
              ),
              t313,
            ),
            t314,
          ),
          t322,
        ),
        t323,
      )
      let t325 = (
        @term_syntax.parse_term("(EXP((m : Num), 2) == (n : Num)) == (EXP(BIT1(m), 2) == BIT1(BIT0(m + n)))"),
        t324,
      )
      let pth_odd = standardize(
        (fn(
          x300 : (
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
          @tactics.prove(x300.0, x300.1)
        })(t325),
      )
      let t366 = @simp.rewrite_tac(@list.List([arith()]))
      let t365 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.right_add_distrib())]),
      )
      let t363 = @term_syntax.parse_term("(a : Num) + ((b : Num) + (c : Num)) == b + (a + c)")
      let t364 = @simp.once_rewrite_tac(
        @list.List([@theorems.ac(@arith.add_ac())(t363)]),
      )
      let t361 = @equal.gsym(@arith.mult_2())
      let t362 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.add_assoc()), t361, @arith.mult_assoc()]),
      )
      let t360 = @simp.rewrite_tac(
        @list.List([@arith.add_assoc(), @arith.eq_add_rcancel()]),
      )
      let t359 = @simp.rewrite_tac(@list.List([arith()]))
      let t358 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.add_assoc())]),
      )
      let t356 = @term_syntax.parse_term("(n : Num) + 16 + ((p : Num) + ((q : Num) + 49)) == n + (p + q) + (16 + 49)")
      let t357 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.add_ac())(t356)]),
      )
      let t355 = @simp.rewrite_tac(@list.List([arith()]))
      let t353 = @term_syntax.parse_term("8 * (n : Num) * NUMERAL((p : Num)) == 8 * NUMERAL(p) * n")
      let t354 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.mult_ac())(t353)]),
      )
      let t352 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.mult_assoc()]),
      )
      let t351 = @simp.rewrite_tac(
        @list.List([@arith.left_add_distrib(), @arith.right_add_distrib()]),
      )
      let t350 = @simp.rewrite_tac(@list.List([@arith.exp_2()]))
      let t349 = @simp.expand_tac("two")
      let t348 = @simp.asm_rewrite_tac(
        @list.List([@arith.add_assoc(), @equal.gsym(@arith.left_add_distrib())]),
      )
      let t347 = @tactics.exists_tac(@term_syntax.parse_term("16 * ((n : Num) + 1)"))
      let t346 = @tactics.match_mp_tac(
        @meson.meson(
          @list.List([@arith.eq_add_lcancel()]),
          @term_syntax.parse_term("∀ m : Num, m + (n : Num) == m + (p : Num) → n == p"),
        ),
      )
      let t345 = @tactics.disch_then(fn(
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
        (fn(
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
          let s342 = @tactics.subst1_tac(x341)
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
        })(@equal.sym(x344))
      })
      let t340 = @tactics.disch_then(fn(
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
        (fn(
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
          let s337 = @tactics.subst1_tac(x336)
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
        })(@equal.sym(x339))
      })
      let t335 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
      let t334 = @simp.rewrite_tac(@list.List([arith()]))
      let t333 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
      let t332 = @simp.rewrite_tac(
        @list.List([
          @arith.add1(),
          @arith.left_add_distrib(),
          @equal.gsym(@arith.add_assoc()),
        ]),
      )
      let t331 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t330 = @simp.expand_tac("two")
      let t329 = @simp.rewrite_tac(@list.List([@arith.bit1(), @arith.bit0()]))
      let t328 = @tactics.subst1_tac(
        @meson.meson(
          @list.List([@nums.numeral()]),
          @term_syntax.parse_term("_0 == 0"),
        ),
      )
      let t367 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.then_tac(
                                                              @simp.abbrev_tac(
                                                                @term_syntax.parse_term("(two : Num) == 2"),
                                                              ),
                                                              t328,
                                                            ),
                                                            t329,
                                                          ),
                                                          t330,
                                                        ),
                                                        t331,
                                                      ),
                                                      t332,
                                                    ),
                                                    t333,
                                                  ),
                                                  t334,
                                                ),
                                                t335,
                                              ),
                                              t340,
                                            ),
                                            t345,
                                          ),
                                          @tactics.disch_tac,
                                        ),
                                        t346,
                                      ),
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
                            t352,
                          ),
                          t354,
                        ),
                        t355,
                      ),
                      t357,
                    ),
                    t358,
                  ),
                  t359,
                ),
                t360,
              ),
              t362,
            ),
            t364,
          ),
          t365,
        ),
        t366,
      )
      let t368 = (
        @term_syntax.parse_term("(n : Num) + BIT1(_0) == (m : Num) && EXP(m, 2) == (p : Num) && m + (a : Num) == BIT0(BIT0(p)) → EXP(BIT1(BIT1(BIT1(n))), 2) == BIT1(BIT0(BIT0(BIT0(a))))"),
        t367,
      )
      let pth_qstep = (fn(x326 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x326))
      })(
        (fn(
          x327 : (
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
          @tactics.prove(x327.0, x327.1)
        })(t368),
      )
      let t389 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
      let t388 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
      let t387 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
      let t386 = @tactics.disch_then(fn(
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
        let s384 = @tactics.subst1_tac(x383)
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
          s384(x385)
        }
      })
      let t382 = @tactics.conv_tac(@equal.binop_conv(@arith.num_cancel_conv))
      let t381 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
      let t380 = @simp.rewrite_tac(
        @list.List([
          @arith.exp_2(),
          @arith.left_add_distrib(),
          @arith.right_add_distrib(),
        ]),
      )
      let t379 = @tactics.replicate_tac(
        5,
        @tactics.disch_then(fn(
          x378 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x375 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s376 = @tactics.subst1_tac(x375)
            fn(
              x377 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s376(x377)
            }
          })(@equal.sym(x378))
        }),
      )
      let t374 = @tactics.disch_then(fn(
        x371 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s372 = @tactics.subst1_tac(x371)
        fn(
          x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s372(x373)
        }
      })
      let t390 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
                        t374,
                      ),
                      t379,
                    ),
                    t380,
                  ),
                  t381,
                ),
                t382,
              ),
              t386,
            ),
            t387,
          ),
          t388,
        ),
        t389,
      )
      let t391 = (
        @term_syntax.parse_term("(n : Num) == (l : Num) + (p : Num) * (h : Num) && h + l == (m : Num) && EXP(h, 2) == (a : Num) && EXP(l, 2) == (c : Num) && EXP(m, 2) == (d : Num) && a + c == (e : Num) && e + (b : Num) == d → EXP(n, 2) == c + p * (b + p * a)"),
        t390,
      )
      let pth_rec = (fn(x369 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x369))
      })(
        (fn(
          x370 : (
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
          @tactics.prove(x370.0, x370.1)
        })(t391),
      )
      let t463 = @simp.simp_tac(
        @list.List([@arith.eq_mult_lcancel(), @nums.not_suc()]),
      )
      let t462 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@lib.el(4, @bool.conjuncts_rule(@arith.mult_clauses()))),
        ]),
      )
      let t461 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
      let t460 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t459 = @tactics.conv_tac(
        @equal.land_conv(@equal.binop_conv(@arith.num_cancel_conv)),
      )
      let t458 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
      )
      let t457 = @simp.rewrite_tac(
        @lib.map(
          fn(x455 : Int64) -> @kernel.Thm raise {
            let k_5 = x455
            let t456 = @kernel.mk_comb(
              suc_tm,
              @nums.mk_small_numeral(@lib.sub63(k_5, 1L)),
            )
            @equal.sym(@simp.rewrite_conv(@list.List([arith_suc()]))(t456))
          },
          @lib.range(1L, 4L),
        ),
      )
      let t454 = @simp.rewrite_tac(
        @list.List([@arith.left_add_distrib(), @arith.mult_assoc()]),
      )
      let t451 = @drule.match_mp(
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(b : Num) == (b' : Num) && (c : _) == (c' : _) && (d : Num) == (d' : Num) → b + d' == b' + d && 4 * b + d' == 4 * b' + d"),
        ),
      )
      let t453 = @tactics.first_assum(fn(
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
        (fn(
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
        })(t451(x452))
      })
      let t447 = @tactics.disch_then(fn(
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
        let s445 = @tactics.subst_all_tac(x444)
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
      })
      let t443 = @tactics.conv_tac(@equal.land_conv(@arith.num_cancel_conv))
      let t442 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
      )
      let t441 = @simp.rewrite_tac(
        @lib.map(
          fn(x439 : Int64) -> @kernel.Thm raise {
            let k_4 = x439
            let t440 = @kernel.mk_comb(
              suc_tm,
              @nums.mk_small_numeral(@lib.sub63(k_4, 1L)),
            )
            @equal.sym(@simp.rewrite_conv(@list.List([arith_suc()]))(t440))
          },
          @lib.range(1L, 5L),
        ),
      )
      let t438 = @simp.rewrite_tac(
        @list.List([@arith.left_add_distrib(), @arith.mult_assoc()]),
      )
      let t435 = @drule.match_mp(
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(b : Num) == (b' : Num) && (c : Num) == (c' : Num) && (d : Num) == (d' : Num) → 5 * b + (c' + d') == 5 * b' + (c + d)"),
        ),
      )
      let t437 = @tactics.first_assum(fn(
        x436 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
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
        })(t435(x436))
      })
      let t431 = @simp.rewrite_tac(
        @list.List([@equal.gsym(@arith.add_assoc())]),
      )
      let t430 = @simp.rewrite_tac(
        @list.List([@arith.add_assoc(), @arith.eq_add_rcancel()]),
      )
      let t429 = @simp.rewrite_tac(
        @list.List([@arith.mult_clauses(), @arith.eq_add_lcancel()]),
      )
      let t428 = @simp.rewrite_tac(@list.List([arith()]))
      let t427 = @simp.rewrite_tac(
        @list.List([@arith.left_add_distrib(), @arith.mult_assoc()]),
      )
      let t426 = @simp.rewrite_tac(
        @list.List([@arith.eq_add_lcancel(), @arith.eq_mult_lcancel()]),
      )
      let t425 = @tactics.pop_assum_list(fn(
        x424 : @list.List[@kernel.Thm],
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let t423 = @simp.asm_rewrite_tac(@list.List([]))
      let t422 = @class.asm_cases_tac(@term_syntax.parse_term("(e' : Num) == (e : Num)"))
      let t421 = @simp.asm_rewrite_tac(@list.List([]))
      let t420 = @class.asm_cases_tac(@term_syntax.parse_term("(a' : Num) == (a : Num)"))
      let t419 = @tactics.pop_assum_list(fn(
        x418 : @list.List[@kernel.Thm],
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let t417 = @simp.expand_tac("two")
      let t416 = @simp.asm_rewrite_tac(@list.List([]))
      let t414 = @term_syntax.parse_term("2 * ((h : Num) * (m : Num)) == 2 * (m * h)")
      let t415 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t414))
      let t412 = @term_syntax.parse_term("2 * ((h : Num) * (l : Num)) == 2 * (l * h)")
      let t413 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t412))
      let t410 = @term_syntax.parse_term("2 * ((m : Num) * (l : Num)) == 2 * (l * m)")
      let t411 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t410))
      let t405 = @term_syntax.parse_term("(e' : Num) == (h : Num) * h")
      let t406 = @term_syntax.parse_term("(d' : Num) == 2 * ((m : Num) * (h : Num))")
      let t407 = @term_syntax.parse_term("(c' : Num) == 2 * ((l : Num) * (h : Num)) + (m : Num) * m")
      let t408 = @term_syntax.parse_term("(b' : Num) == 2 * ((l : Num) * (m : Num))")
      let t409 = @tactics.map_every(
        @simp.abbrev_tac,
        @list.List([
          @term_syntax.parse_term("(a' : Num) == (l : Num) * l"),
          t408,
          t407,
          t406,
          t405,
        ]),
      )
      let t403 = @simp.rewrite_tac(@list.List([@arith.exp_2()]))
      let t402 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
      let t401 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
      let t404 = @list.List([
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @arith.exp_2(),
                @arith.mult_2(),
                @arith.left_add_distrib(),
                @arith.right_add_distrib(),
              ]),
            ),
            t401,
          ),
          t402,
        ),
        t403,
      ])
      let t400 = @tactics.subgoal_then(
        @term_syntax.parse_term("∀ p : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, EXP(x + p * (y + p * z), 2) == x * x + p * (2 * (x * y) + p * (2 * (x * z) + y * y + p * (2 * (y * z) + p * (z * z))))"),
        fn(
          x398 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th_9 = x398
          @simp.rewrite_tac(@list.List([th_9]))
        },
      )
      let t397 = @simp.rewrite_tac(@list.List([arith()]))
      let t396 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t395 = @simp.expand_tac("two")
      let t394 = @simp.rewrite_tac(@list.List([@arith.bit1(), @arith.bit0()]))
      let t393 = @tactics.subst1_tac(
        @meson.meson(
          @list.List([@nums.numeral()]),
          @term_syntax.parse_term("_0 == 0"),
        ),
      )
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
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
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
                                                                                        @simp.abbrev_tac(
                                                                                          @term_syntax.parse_term("(two : Num) == 2"),
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
                                                                              ),
                                                                              t400,
                                                                            ),
                                                                            t404,
                                                                          ),
                                                                          t409,
                                                                        ),
                                                                        t411,
                                                                      ),
                                                                      t413,
                                                                    ),
                                                                    t415,
                                                                  ),
                                                                  t416,
                                                                ),
                                                                t417,
                                                              ),
                                                              t419,
                                                            ),
                                                            t420,
                                                          ),
                                                          t421,
                                                        ),
                                                        t422,
                                                      ),
                                                      t423,
                                                    ),
                                                    t425,
                                                  ),
                                                  t426,
                                                ),
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
                                      @tactics.disch_tac,
                                    ),
                                    t437,
                                  ),
                                  t438,
                                ),
                                t441,
                              ),
                              t442,
                            ),
                            t443,
                          ),
                          t447,
                        ),
                        t453,
                      ),
                      t454,
                    ),
                    t457,
                  ),
                  t458,
                ),
                t459,
              ),
              t460,
            ),
            t461,
          ),
          t462,
        ),
        t463,
      )
      let t465 = (
        @term_syntax.parse_term("EXP((h : Num), 2) == (e : Num) && EXP((l : Num), 2) == (a : Num) && EXP(l + BIT1(_0) * ((m : Num) + BIT1(_0) * h), 2) == a + BIT1(_0) * ((b : Num) + BIT1(_0) * ((c : Num) + BIT1(_0) * ((d : Num) + BIT1(_0) * e))) && EXP(l + BIT0(BIT1(_0)) * (m + BIT0(BIT1(_0)) * h), 2) == a + BIT0(BIT1(_0)) * (b + BIT0(BIT1(_0)) * (c + BIT0(BIT1(_0)) * (d + BIT0(BIT1(_0)) * e))) && EXP(h + BIT0(BIT1(_0)) * (m + BIT0(BIT1(_0)) * l), 2) == e + BIT0(BIT1(_0)) * (d + BIT0(BIT1(_0)) * (c + BIT0(BIT1(_0)) * (b + BIT0(BIT1(_0)) * a))) → EXP(l + (p : Num) * (m + p * h), 2) == a + p * (b + p * (c + p * (d + p * e)))"),
        t464,
      )
      let pth_toom3 = standardize(
        (fn(
          x392 : (
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
          @tactics.prove(x392.0, x392.1)
        })(t465),
      )
      let t473 = @simp.rewrite_tac(
        @list.List([@arith.eq_mult_lcancel(), arith_eq()]),
      )
      let t471 = @term_syntax.parse_term("2 * (2 * (2 * (m : Num))) * (2 * (2 * (2 * m))) == 2 * (2 * (2 * (2 * (2 * (2 * (m * m))))))")
      let t472 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.mult_ac())(t471)]),
      )
      let t470 = @simp.rewrite_tac(@list.List([@arith.exp_2()]))
      let t469 = @simp.expand_tac("two")
      let t468 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t467 = @simp.rewrite_tac(@list.List([@arith.bit0()]))
      let t474 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2")),
                  t467,
                ),
                t468,
              ),
              t469,
            ),
            t470,
          ),
          t472,
        ),
        t473,
      )
      let t475 = (
        @term_syntax.parse_term("(EXP((m : Num), 2) == (n : Num)) == (EXP(BIT0(BIT0(BIT0(m))), 2) == BIT0(BIT0(BIT0(BIT0(BIT0(BIT0(n)))))))"),
        t474,
      )
      let pth_even3 = standardize(
        (fn(
          x466 : (
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
          @tactics.prove(x466.0, x466.1)
        })(t475),
      )
      let num_unshift2_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
        @equal.rand_conv(@equal.rand_conv(num_unshift_conv_1)),
        num_unshift_conv_1,
      )
      let num_unshift3_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
        @equal.rand_conv(@equal.rand_conv(num_unshift2_conv)),
        num_unshift_conv_1,
      )
      let num_unshift4_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
        @equal.rand_conv(@equal.rand_conv(num_unshift3_conv)),
        num_unshift_conv_1,
      )
      let binop2_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
        (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(
        x476 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
        let conv1 = x476
        fn(
          x477 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let conv2 = x477
          @equal.comb2_conv(@equal.rand_conv(conv1), conv2)
        }
      }
      let toom3_conv : (@kernel.Term) -> @kernel.Thm raise = binop2_conv(
        @equal.land_conv(num_unshift2_conv),
      )(num_unshift4_conv)
      let gen_num_square_rule = (
        x479 : Int64,
        x480 : Int64,
        x481 : @kernel.Term,
      ) => {
        gen_num_square_rule_l(
          pth_0_2, m_tm, n_tm, pth_even3, pth_even, zero_tm, pth_1_2, num_add_rule_1,
          one_tm, subbn, bit0_tm, a_tm, p_tm, pth_qstep, quick_prove_hyp, pth_odd,
          ap_bit1, ap_bit0, num_shift_conv_1, b_tm, c_tm, d_tm, e_tm, h_tm, l_tm,
          pth_rec, num_unshift_conv_1, dest_raw_numeral, num_2, pth_toom3, binop2_conv,
          toom3_conv, bitcounts, x479, x480, x481,
        )
      }
      let num_square_rule = (x485 : @kernel.Term) => {
        num_square_rule_l(
          pth_0_2, m_tm, n_tm, pth_even3, pth_even, zero_tm, pth_1_2, num_add_rule_1,
          one_tm, subbn, bit0_tm, a_tm, p_tm, pth_qstep, quick_prove_hyp, pth_odd,
          ap_bit1, ap_bit0, num_shift_conv_1, b_tm, c_tm, d_tm, e_tm, h_tm, l_tm,
          pth_rec, num_unshift_conv_1, dest_raw_numeral, num_2, pth_toom3, binop2_conv,
          toom3_conv, bitcounts, x485,
        )
      }
      let num_square_rule_1 : (@kernel.Term) -> @kernel.Thm raise = num_square_rule
      let quick_prove_hyp_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
        x486 : @kernel.Thm,
      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let ath_1 = x486
        fn(x487 : @kernel.Thm) -> @kernel.Thm raise {
          let bth_1 = x487
          @kernel.eq_mp(@kernel.deduct_antisym_rule(ath_1, bth_1), ath_1)
        }
      }
      let t490 = @meson.meson_tac(
        @list.List([@nums.numeral(), @arith.mult_clauses()]),
      )
      let t491 = (@term_syntax.parse_term("_0 * (n : Num) == _0 && (m : Num) * _0 == _0"), t490)
      let (pth_0l, pth_0r) = (fn(
        x488 : @kernel.Thm,
      ) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x488))
      })(
        (fn(
          x489 : (
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
          @tactics.prove(x489.0, x489.1)
        })(t491),
      )
      let t494 = @meson.meson_tac(
        @list.List([@nums.numeral(), @arith.mult_clauses()]),
      )
      let t495 = (
        @term_syntax.parse_term("BIT1(_0) * (n : Num) == n && (m : Num) * BIT1(_0) == m"),
        t494,
      )
      let (pth_1l, pth_1r) = (fn(
        x492 : @kernel.Thm,
      ) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x492))
      })(
        (fn(
          x493 : (
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
          @tactics.prove(x493.0, x493.1)
        })(t495),
      )
      let t501 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@arith.mult_assoc()),
          @arith.eq_mult_lcancel(),
          arith_eq(),
        ]),
      )
      let t499 = @term_syntax.parse_term("(m : Num) * (2 * (n : Num)) == 2 * (m * n)")
      let t500 = @simp.rewrite_tac(
        @list.List([@theorems.ac(@arith.mult_ac())(t499)]),
      )
      let t498 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t502 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@arith.bit0()])),
            t498,
          ),
          t500,
        ),
        t501,
      )
      let t503 = (
        @term_syntax.parse_term("((m : Num) * (n : Num) == (p : Num)) == (BIT0(m) * n == BIT0(p)) && (m * n == p) == (m * BIT0(n) == BIT0(p))"),
        t502,
      )
      let (pth_evenl, pth_evenr) = (fn(
        x496 : @kernel.Thm,
      ) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x496))
      })(
        (fn(
          x497 : (
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
          @tactics.prove(x497.0, x497.1)
        })(t503),
      )
      let t510 = @simp.rewrite_tac(@list.List([arith_eq()]))
      let t509 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@arith.mult_assoc()),
          @arith.eq_mult_lcancel(),
          @arith.eq_add_rcancel(),
        ]),
      )
      let t508 = @simp.rewrite_tac(
        @list.List([
          @meson.meson(
            @list.List([@arith.mult_ac(), @arith.add_sym()]),
            @term_syntax.parse_term("(m : Num) + m * (2 * (n : Num)) == 2 * (m * n) + m"),
          ),
        ]),
      )
      let t507 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
      let t506 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t511 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@arith.bit0(), @arith.bit1()])),
                t506,
              ),
              t507,
            ),
            t508,
          ),
          t509,
        ),
        t510,
      )
      let t512 = (
        @term_syntax.parse_term("((m : Num) * (n : Num) == (p : Num)) == (BIT1(m) * n == BIT0(p) + n) && (m * n == p) == (m * BIT1(n) == BIT0(p) + m)"),
        t511,
      )
      let (pth_oddl, pth_oddr) = (fn(
        x504 : @kernel.Thm,
      ) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x504))
      })(
        (fn(
          x505 : (
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
          @tactics.prove(x505.0, x505.1)
        })(t512),
      )
      let t538 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
      let t537 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
      let t536 = @simp.rewrite_tac(
        @list.List([
          @arith.mult_2(),
          @arith.left_add_distrib(),
          @arith.right_add_distrib(),
        ]),
      )
      let t535 = @tactics.disch_then(fn(
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
        let s533 = @tactics.subst1_tac(x532)
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
      })
      let t531 = @simp.rewrite_tac(
        @list.List([
          @equal.gsym(@arith.add_assoc()),
          @arith.mult_clauses(),
          @arith.eq_add_lcancel(),
        ]),
      )
      let t530 = @simp.rewrite_tac(
        @list.List([@arith.left_add_distrib(), @arith.right_add_distrib()]),
      )
      let t529 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
      let t527 = @term_syntax.parse_term("(n : Num) + (p : Num) + n + 1 == p + (n + n) + 1")
      let t528 = @simp.rewrite_tac(
        @list.List([@arith.add1(), @theorems.ac(@arith.add_ac())(t527)]),
      )
      let t526 = @tactics.replicate_tac(
        4,
        @tactics.disch_then(fn(
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
          (fn(
            x522 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s523 = @tactics.subst1_tac(x522)
            fn(
              x524 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s523(x524)
            }
          })(@equal.sym(x525))
        }),
      )
      let t521 = @simp.rewrite_tac(
        @list.List([@arith.exp_2(), @equal.gsym(@arith.mult_2())]),
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
        })(@equal.sym(x519))
      })
      let t515 = @simp.rewrite_tac(
        @list.List([@arith.bit1(), @theorems.imp_conj()]),
      )
      let t539 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @simp.abbrev_tac(@term_syntax.parse_term("(two : Num) == 2")),
                              t515,
                            ),
                            t520,
                          ),
                          t521,
                        ),
                        t526,
                      ),
                      t528,
                    ),
                    t529,
                  ),
                  t530,
                ),
                t531,
              ),
              t535,
            ),
            t536,
          ),
          t537,
        ),
        t538,
      )
      let t540 = (
        @term_syntax.parse_term("(n : Num) + (p : Num) == (m : Num) && SUC(m + n) == (a : Num) && EXP(p, 2) == (b : Num) && EXP(a, 2) == (c : Num) && b + (d : Num) == c → BIT1(m) * BIT1(n) == d"),
        t539,
      )
      let pth_oo1 = (fn(x513 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(standardize(x513))
      })(
        (fn(
          x514 : (
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
          @tactics.prove(x514.0, x514.1)
        })(t540),
      )
      let t541 = @kernel.inst_rule(
        @list.List([(n_tm, m_tm), (m_tm, n_tm)]),
        pth_oo1,
      )
      let pth_oo2 = @simp.pure_once_rewrite_rule(
        @list.List([@arith.mult_sym()]),
      )(t541)
      let t549 = @simp.rewrite_tac(
        @list.List([
          @arith.add_clauses(),
          @arith.mult_clauses(),
          @arith.eq_add_rcancel(),
        ]),
      )
      let t548 = @tactics.disch_then(fn(
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
        (fn(
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
          let s545 = @tactics.subst1_tac(x544)
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
        })(@equal.sym(x547))
      })
      let t550 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.subst1_tac(
            @meson.meson(
              @list.List([@nums.numeral()]),
              @term_syntax.parse_term("_0 == 0"),
            ),
          ),
          t548,
        ),
        t549,
      )
      let t551 = (
        @term_syntax.parse_term("SUC(_0 + (m : Num)) == (p : Num) → (p * (n : Num) == (a : Num) + n) == (m * n == a)"),
        t550,
      )
      let pth_recodel = (fn(x542 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(standardize(x542))
      })(
        (fn(
          x543 : (
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
          @tactics.prove(x543.0, x543.1)
        })(t551),
      )
      let t560 = @simp.rewrite_tac(
        @list.List([
          @arith.add_clauses(),
          @arith.mult_clauses(),
          @arith.eq_add_rcancel(),
        ]),
      )
      let t559 = @tactics.disch_then(fn(
        x558 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
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
          let s556 = @tactics.subst1_tac(x555)
          fn(
            x557 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s556(x557)
          }
        })(@equal.sym(x558))
      })
      let t554 = @tactics.subst1_tac(
        @meson.meson(
          @list.List([@nums.numeral()]),
          @term_syntax.parse_term("_0 == 0"),
        ),
      )
      let t561 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
            t554,
          ),
          t559,
        ),
        t560,
      )
      let t562 = (
        @term_syntax.parse_term("SUC(_0 + (n : Num)) == (p : Num) → ((m : Num) * p == (a : Num) + m) == (m * n == a)"),
        t561,
      )
      let pth_recoder = (fn(x552 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(standardize(x552))
      })(
        (fn(
          x553 : (
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
          @tactics.prove(x553.0, x553.1)
        })(t562),
      )
      fn num_mul_rule(
        x563 : Int64,
        x564 : Int64,
        x565 : @kernel.Term,
        x566 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let k_6 = x563
        let l = x564
        let tm_11 = x565
        let tm_p_3 = x566
        match (tm_11, tm_p_3) {
          (@kernel.Term::Const("_0", _), _) =>
            @kernel.inst_rule(@list.List([(tm_p_3, n_tm)]), pth_0l)
          (_, @kernel.Term::Const("_0", _)) =>
            @kernel.inst_rule(@list.List([(tm_11, m_tm)]), pth_0r)
          (
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Const("_0", _)
            ),
            _,
          ) => @kernel.inst_rule(@list.List([(tm_p_3, n_tm)]), pth_1l)
          (
            _,
            @kernel.Term::Comb(
              @kernel.Term::Const("BIT1", _),
              @kernel.Term::Const("_0", _)
            ),
          ) => @kernel.inst_rule(@list.List([(tm_11, m_tm)]), pth_1r)
          (@kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mtm_12), _) => {
            let th0_1 = num_mul_rule(@lib.sub63(k_6, 1L), l, mtm_12, tm_p_3)
            let th1_20 = @kernel.inst_rule(
              @list.List([
                (mtm_12, m_tm),
                (tm_p_3, n_tm),
                (@kernel.rand(@kernel.concl(th0_1)), p_tm),
              ]),
              pth_evenl,
            )
            @kernel.eq_mp(th1_20, th0_1)
          }
          (_, @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_14)) => {
            let th0_2 = num_mul_rule(k_6, @lib.sub63(l, 1L), tm_11, ntm_14)
            let th1_21 = @kernel.inst_rule(
              @list.List([
                (tm_11, m_tm),
                (ntm_14, n_tm),
                (@kernel.rand(@kernel.concl(th0_2)), p_tm),
              ]),
              pth_evenr,
            )
            @kernel.eq_mp(th1_21, th0_2)
          }
          (
            @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mtm_13),
            @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_15),
          ) =>
            if k_6 <= 50L ||
              (if l <= 50L {
                true
              } else {
                let t568 = @num.num_of_int64(l)
                let t567 = @num.num_of_int64(k_6)
                if @num.le_num(
                    @num.mult_num(@num.num_of_int64(k_6), t567),
                    t568,
                  ) {
                  true
                } else {
                  let t570 = @num.num_of_int64(k_6)
                  let t569 = @num.num_of_int64(l)
                  @num.le_num(@num.mult_num(@num.num_of_int64(l), t569), t570)
                }
              }) {
              match (mtm_13, ntm_15) {
                (
                  @kernel.Term::Comb(
                    @kernel.Term::Const("BIT1", _),
                    @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), _)
                  ),
                  _,
                ) => {
                  let th1_22 = num_adc_rule_1(zero_tm)(tm_11)
                  let ptm_17 = @kernel.rand(@kernel.concl(th1_22))
                  let th2_13 = num_mul_rule(k_6, l, ptm_17, tm_p_3)
                  let atm_8 = subbn(@kernel.rand(@kernel.concl(th2_13)), tm_p_3)
                  let th3_11 = @kernel.inst_rule(
                    @list.List([
                      (tm_11, m_tm),
                      (tm_p_3, n_tm),
                      (ptm_17, p_tm),
                      (atm_8, a_tm),
                    ]),
                    pth_recodel,
                  )
                  let th4_3 = @bool.prove_hyp(th1_22, th3_11)
                  @kernel.eq_mp(
                    th4_3,
                    @kernel.trans(
                      th2_13,
                      @equal.sym(num_add_rule_1(atm_8)(tm_p_3)),
                    ),
                  )
                }
                (
                  _,
                  @kernel.Term::Comb(
                    @kernel.Term::Const("BIT1", _),
                    @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), _)
                  ),
                ) => {
                  let th1_23 = num_adc_rule_1(zero_tm)(tm_p_3)
                  let ptm_18 = @kernel.rand(@kernel.concl(th1_23))
                  let th2_14 = num_mul_rule(k_6, l, tm_11, ptm_18)
                  let atm_9 = subbn(@kernel.rand(@kernel.concl(th2_14)), tm_11)
                  let th3_12 = @kernel.inst_rule(
                    @list.List([
                      (tm_11, m_tm),
                      (tm_p_3, n_tm),
                      (ptm_18, p_tm),
                      (atm_9, a_tm),
                    ]),
                    pth_recoder,
                  )
                  let th4_4 = @bool.prove_hyp(th1_23, th3_12)
                  @kernel.eq_mp(
                    th4_4,
                    @kernel.trans(
                      th2_14,
                      @equal.sym(num_add_rule_1(atm_9)(tm_11)),
                    ),
                  )
                }
                _ =>
                  if k_6 <= l {
                    let th0_3 = num_mul_rule(
                      @lib.sub63(k_6, 1L),
                      l,
                      mtm_13,
                      tm_p_3,
                    )
                    let ptm_19 = @kernel.rand(@kernel.concl(th0_3))
                    let th1_24 = @kernel.eq_mp(
                      @kernel.inst_rule(
                        @list.List([
                          (mtm_13, m_tm),
                          (tm_p_3, n_tm),
                          (ptm_19, p_tm),
                        ]),
                        pth_oddl,
                      ),
                      th0_3,
                    )
                    let tm1_1 = @equal.lhand(
                      @kernel.rand(@kernel.concl(th1_24)),
                    )
                    @kernel.trans(th1_24, num_add_rule_1(tm1_1)(tm_p_3))
                  } else {
                    let th0_4 = num_mul_rule(
                      k_6,
                      @lib.sub63(l, 1L),
                      tm_11,
                      ntm_15,
                    )
                    let ptm_20 = @kernel.rand(@kernel.concl(th0_4))
                    let th1_25 = @kernel.eq_mp(
                      @kernel.inst_rule(
                        @list.List([
                          (tm_11, m_tm),
                          (ntm_15, n_tm),
                          (ptm_20, p_tm),
                        ]),
                        pth_oddr,
                      ),
                      th0_4,
                    )
                    let tm1_2 = @equal.lhand(
                      @kernel.rand(@kernel.concl(th1_25)),
                    )
                    @kernel.trans(th1_25, num_add_rule_1(tm1_2)(tm_11))
                  }
              }
            } else {
              let mval = dest_raw_numeral(mtm_13)
              let nval = dest_raw_numeral(ntm_15)
              if @num.le_num(nval, mval) {
                let ptm_21 = @kernel.rand(
                  @nums.mk_numeral(@num.sub_num(mval, nval)),
                )
                let th2_15 = num_add_rule_1(ntm_15)(ptm_21)
                let th3_13 = num_adc_rule_1(mtm_13)(ntm_15)
                let atm_10 = @kernel.rand(@kernel.concl(th3_13))
                let th4_5 = num_square_rule_1(ptm_21)
                let btm_9 = @kernel.rand(@kernel.concl(th4_5))
                let th5_2 = num_square_rule_1(atm_10)
                let ctm_4 = @kernel.rand(@kernel.concl(th5_2))
                let dtm_3 = subbn(ctm_4, btm_9)
                let th6_1 = num_add_rule_1(btm_9)(dtm_3)
                let th1_26 = @kernel.inst_rule(
                  @list.List([
                    (atm_10, a_tm),
                    (btm_9, b_tm),
                    (ctm_4, c_tm),
                    (dtm_3, d_tm),
                    (mtm_13, m_tm),
                    (ntm_15, n_tm),
                    (ptm_21, p_tm),
                  ]),
                  pth_oo1,
                )
                quick_prove_hyp_1(
                  @lib.end_itlist(
                    @bool.conj,
                    @list.List([th2_15, th3_13, th4_5, th5_2, th6_1]),
                  ),
                )(th1_26)
              } else {
                let ptm_22 = @kernel.rand(
                  @nums.mk_numeral(@num.sub_num(nval, mval)),
                )
                let th2_16 = num_add_rule_1(mtm_13)(ptm_22)
                let th3_14 = num_adc_rule_1(ntm_15)(mtm_13)
                let atm_11 = @kernel.rand(@kernel.concl(th3_14))
                let th4_6 = num_square_rule_1(ptm_22)
                let btm_10 = @kernel.rand(@kernel.concl(th4_6))
                let th5_3 = num_square_rule_1(atm_11)
                let ctm_5 = @kernel.rand(@kernel.concl(th5_3))
                let dtm_4 = subbn(ctm_5, btm_10)
                let th6_2 = num_add_rule_1(btm_10)(dtm_4)
                let th1_27 = @kernel.inst_rule(
                  @list.List([
                    (atm_11, a_tm),
                    (btm_10, b_tm),
                    (ctm_5, c_tm),
                    (dtm_4, d_tm),
                    (mtm_13, m_tm),
                    (ntm_15, n_tm),
                    (ptm_22, p_tm),
                  ]),
                  pth_oo2,
                )
                quick_prove_hyp_1(
                  @lib.end_itlist(
                    @bool.conj,
                    @list.List([th2_16, th3_14, th4_6, th5_3, th6_2]),
                  ),
                )(th1_27)
              }
            }
          _ => raise Failure("NUM_MUL_RULE")
        }
      }
      let num_mul_rule_1 : (Int64) -> ((Int64) -> ((@kernel.Term) -> ((
        @kernel.Term,
      ) -> @kernel.Thm raise) raise) raise) raise = fn(
        x571 : Int64,
      ) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
        fn(
          x572 : Int64,
        ) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
          fn(
            x573 : @kernel.Term,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x574 : @kernel.Term) -> @kernel.Thm raise {
              num_mul_rule(x571, x572, x573, x574)
            }
          }
        }
      }
      let t576 = @term_syntax.parse_term("(EXP((m : Num), 2) == (p : Num)) == (m * m == p)")
      let pth_refl = standardize(
        ((x575 : @kernel.Term) => {
          @meson.meson(@list.List([@arith.exp_2()]), x575)
        })(t576),
      )
      let num_mult_conv_p : (@kernel.Term) -> @kernel.Thm raise = fn(
        x577 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_12 = x577
        match tm_12 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("*", _), mtm_14),
            ntm_16
          ) =>
            if Int::to_int64(@lib.compare(mtm_14, ntm_16)) == 0L {
              let th1_28 = num_square_rule_1(mtm_14)
              let ptm_23 = @kernel.rand(@kernel.concl(th1_28))
              @kernel.eq_mp(
                @kernel.inst_rule(
                  @list.List([(mtm_14, m_tm), (ptm_23, p_tm)]),
                  pth_refl,
                ),
                th1_28,
              )
            } else {
              let (w1, z1) = bitcounts(mtm_14)
              let (w2, z2) = bitcounts(ntm_16)
              let t578 = @lib.add63(w2, z2)
              num_mul_rule_1(@lib.add63(w1, z1))(t578)(mtm_14)(ntm_16)
            }
          _ => raise Failure("NUM_MULT_CONV'")
        }
      }
      let t580 = @tactics.then_tac(
        @tactics.binop_tac,
        @meson.meson_tac(@list.List([@nums.numeral(), @arith.add_clauses()])),
      )
      let t581 = (
        @term_syntax.parse_term("(SUC(_0 + (m : Num)) == (n : Num)) == (SUC(NUMERAL(m)) == NUMERAL(n))"),
        t580,
      )
      let pth = standardize(
        (fn(
          x579 : (
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
          @tactics.prove(x579.0, x579.1)
        })(t581),
      )
      let num_suc_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x582 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_13 = x582
        match tm_13 {
          @kernel.Term::Comb(
            @kernel.Term::Const("SUC", _),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_15)
          ) if wellformed(mtm_15) => {
            let th1_29 = num_adc_rule_1(zero_tm)(mtm_15)
            let ntm_17 = @kernel.rand(@kernel.concl(th1_29))
            @kernel.eq_mp(
              @kernel.inst_rule(
                @list.List([(mtm_15, m_tm), (ntm_17, n_tm)]),
                pth,
              ),
              th1_29,
            )
          }
          _ => raise Failure("NUM_SUC_CONV")
        }
      }
      let t584 = @term_syntax.parse_term("((m : Num) + (n : Num) == (p : Num)) == (NUMERAL(m) + NUMERAL(n) == NUMERAL(p))")
      let topthm_add = standardize(
        ((x583 : @kernel.Term) => {
          @meson.meson(@list.List([@nums.numeral()]), x583)
        })(t584),
      )
      let num_add_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x585 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_14 = x585
        match tm_14 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("+", _),
              @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_16)
            ),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_18)
          ) if wellformed(mtm_16) && wellformed(ntm_18) => {
            let th1_30 = num_add_rule_1(mtm_16)(ntm_18)
            let ptm_24 = @kernel.rand(@kernel.concl(th1_30))
            let th2_17 = @kernel.inst_rule(
              @list.List([(mtm_16, m_tm), (ntm_18, n_tm), (ptm_24, p_tm)]),
              topthm_add,
            )
            @kernel.eq_mp(th2_17, th1_30)
          }
          _ => raise Failure("NUM_ADD_CONV")
        }
      }
      let t587 = @term_syntax.parse_term("((m : Num) * (n : Num) == (p : Num)) == (NUMERAL(m) * NUMERAL(n) == NUMERAL(p))")
      let topthm_mul = standardize(
        ((x586 : @kernel.Term) => {
          @meson.meson(@list.List([@nums.numeral()]), x586)
        })(t587),
      )
      let t589 = @term_syntax.parse_term("(EXP((m : Num), 2) == (p : Num)) == (NUMERAL(m) * NUMERAL(m) == NUMERAL(p))")
      let pth_refl_1 = standardize(
        ((x588 : @kernel.Term) => {
          @meson.meson(@list.List([@nums.numeral(), @arith.exp_2()]), x588)
        })(t589),
      )
      let num_mult_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x590 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_15 = x590
        match tm_15 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("*", _),
              @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_17)
            ),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_19)
          ) =>
            if Int::to_int64(@lib.compare(mtm_17, ntm_19)) == 0L {
              let th1_31 = num_square_rule_1(mtm_17)
              let ptm_25 = @kernel.rand(@kernel.concl(th1_31))
              @kernel.eq_mp(
                @kernel.inst_rule(
                  @list.List([(mtm_17, m_tm), (ptm_25, p_tm)]),
                  pth_refl_1,
                ),
                th1_31,
              )
            } else {
              let (w1_1, z1_1) = bitcounts(mtm_17)
              let (w2_1, z2_1) = bitcounts(ntm_19)
              let t591 = @lib.add63(w2_1, z2_1)
              let th1_32 = num_mul_rule_1(@lib.add63(w1_1, z1_1))(t591)(mtm_17)(
                ntm_19,
              )
              let ptm_26 = @kernel.rand(@kernel.concl(th1_32))
              let th2_18 = @kernel.inst_rule(
                @list.List([(mtm_17, m_tm), (ntm_19, n_tm), (ptm_26, p_tm)]),
                topthm_mul,
              )
              @kernel.eq_mp(th2_18, th1_32)
            }
          _ => raise Failure("NUM_MULT_CONV")
        }
      }
      let t597 = @simp.rewrite_tac(
        @list.List([@arith.bit0(), @arith.exp_add()]),
      )
      let t598 = @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.disch_then(fn(
            x596 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
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
              let s594 = @tactics.subst1_tac(x593)
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
            })(@equal.sym(x596))
          }),
        ),
        t597,
      )
      let t599 = (
        @term_syntax.parse_term("EXP((m : Num), (n : Num)) == (p : Num) → p * p == (a : Num) → EXP(m, BIT0(n)) == a"),
        t598,
      )
      let pth0 = standardize(
        (fn(
          x592 : (
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
          @tactics.prove(x592.0, x592.1)
        })(t599),
      )
      let t605 = @simp.rewrite_tac(
        @list.List([@arith.bit1(), @arith.exp_add(), @arith.exp()]),
      )
      let t606 = @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.disch_then(fn(
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
            (fn(
              x601 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s602 = @tactics.subst1_tac(x601)
              fn(
                x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s602(x603)
              }
            })(@equal.sym(x604))
          }),
        ),
        t605,
      )
      let t607 = (
        @term_syntax.parse_term("EXP((m : Num), (n : Num)) == (p : Num) → p * p == (b : Num) → m * b == (a : Num) → EXP(m, BIT1(n)) == a"),
        t606,
      )
      let pth1 = standardize(
        (fn(
          x600 : (
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
          @tactics.prove(x600.0, x600.1)
        })(t607),
      )
      let t613 = @tactics.disch_then(fn(
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
        let s611 = @tactics.match_accept_tac(x610)
        fn(
          x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s611(x612)
        }
      })
      let t609 = @simp.rewrite_tac(@list.List([@nums.numeral(), @arith.bit1()]))
      let t614 = @tactics.then_tac(
        @tactics.then_tac(@tactics.mp_tac(@bool.conjunct1(@arith.exp())), t609),
        t613,
      )
      let t615 = (@term_syntax.parse_term("EXP((m : Num), _0) == BIT1(_0)"), t614)
      let pth_2 = standardize(
        (fn(
          x608 : (
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
          @tactics.prove(x608.0, x608.1)
        })(t615),
      )
      let t617 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
      let t618 = (
        @term_syntax.parse_term("EXP(NUMERAL((m : Num)), NUMERAL((n : Num))) == EXP(m, n)"),
        t617,
      )
      let tth = standardize(
        (fn(
          x616 : (
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
          @tactics.prove(x616.0, x616.1)
        })(t618),
      )
      let t620 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
      let t621 = (@term_syntax.parse_term("(m : Num) == NUMERAL(m)"), t620)
      let fth = standardize(
        (fn(
          x619 : (
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
          @tactics.prove(x619.0, x619.1)
        })(t621),
      )
      let tconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
        fn(
          x622 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x622
        },
        @list.List([tth]),
      )
      fn num_exp_conv(
        x623 : @kernel.Term,
        x624 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let l_1 = x623
        let r = x624
        if r == zero_tm {
          @kernel.inst_rule(@list.List([(l_1, m_tm)]), pth_2)
        } else {
          let (b, r_p) = @kernel.dest_comb(r)
          if b == bit0_tm {
            let th1_33 = num_exp_conv(l_1, r_p)
            let tm1_3 = @kernel.rand(@kernel.concl(th1_33))
            let th2_19 = num_mult_conv_p(@basics.mk_binop(mul_tm, tm1_3, tm1_3))
            let tm2 = @kernel.rand(@kernel.concl(th2_19))
            @bool.mp(
              @bool.mp(
                @kernel.inst_rule(
                  @list.List([
                    (l_1, m_tm),
                    (r_p, n_tm),
                    (tm1_3, p_tm),
                    (tm2, a_tm),
                  ]),
                  pth0,
                ),
                th1_33,
              ),
              th2_19,
            )
          } else {
            let th1_34 = num_exp_conv(l_1, r_p)
            let tm1_4 = @kernel.rand(@kernel.concl(th1_34))
            let th2_20 = num_mult_conv_p(@basics.mk_binop(mul_tm, tm1_4, tm1_4))
            let tm2_1 = @kernel.rand(@kernel.concl(th2_20))
            let th3_15 = num_mult_conv_p(@basics.mk_binop(mul_tm, l_1, tm2_1))
            let tm3_1 = @kernel.rand(@kernel.concl(th3_15))
            @bool.mp(
              @bool.mp(
                @bool.mp(
                  @kernel.inst_rule(
                    @list.List([
                      (l_1, m_tm),
                      (r_p, n_tm),
                      (tm1_4, p_tm),
                      (tm2_1, b_tm),
                      (tm3_1, a_tm),
                    ]),
                    pth1,
                  ),
                  th1_34,
                ),
                th2_20,
              ),
              th3_15,
            )
          }
        }
      }
      let num_exp_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(
        x625 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_16 = x625
        try {
          let th_11 = tconv(tm_16)
          let (lop, r_1) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th_11)))
          let (_, l_2) = @kernel.dest_comb(lop)
          if !(wellformed(l_2) && wellformed(r_1)) {
            raise Failure("")
          } else {
            let th_p_1 = num_exp_conv(l_2, r_1)
            let tm_p_4 = @kernel.rand(@kernel.concl(th_p_1))
            let t626 = @kernel.inst_rule(@list.List([(tm_p_4, m_tm)]), fth)
            @kernel.trans(@kernel.trans(th_11, th_p_1), t626)
          }
        } catch {
          Failure(_) => raise Failure("NUM_EXP_CONV")
          e => raise e
        }
      }
      let t629 = @meson.meson_tac(@list.List([@arith.add_sym()]))
      let t630 = @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@nums.numeral(), @arith.lt_exists(), @arith.add_clauses()]),
        ),
        t629,
      )
      let t631 = (
        @term_syntax.parse_term("SUC((m : Num) + (n : Num)) == (p : Num) → (NUMERAL(n) < NUMERAL(p)) == true"),
        t630,
      )
      let pth_3 = (fn(x627 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x627))
      })(
        (fn(
          x628 : (
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
          @tactics.prove(x628.0, x628.1)
        })(t631),
      )
      let t639 = @meson.meson_tac(
        @list.List([@arith.le_add(), @arith.add_sym()]),
      )
      let t638 = @simp.rewrite_tac(
        @list.List([@arith.not_lt(), @nums.numeral()]),
      )
      let t640 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x637 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x634 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s635 = @tactics.subst1_tac(x634)
              fn(
                x636 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s635(x636)
              }
            })(@equal.sym(x637))
          }),
          t638,
        ),
        t639,
      )
      let t641 = (
        @term_syntax.parse_term("(m : Num) + (p : Num) == (n : Num) → (NUMERAL(n) < NUMERAL(p)) == false"),
        t640,
      )
      let qth = (fn(x632 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x632))
      })(
        (fn(
          x633 : (
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
          @tactics.prove(x633.0, x633.1)
        })(t641),
      )
      let t643 = @meson.meson_tac(@list.List([@arith.lt_refl()]))
      let t644 = (@term_syntax.parse_term("(NUMERAL((n : Num)) < NUMERAL(n)) == false"), t643)
      let rth = standardize(
        (fn(
          x642 : (
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
          @tactics.prove(x642.0, x642.1)
        })(t644),
      )
      let num_lt_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x645 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_17 = x645
        match tm_17 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("<", _),
              @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_18)
            ),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_20)
          ) => {
            let rel = orderrelation(mtm_18, ntm_20)
            if rel == 0L {
              @kernel.inst_rule(@list.List([(ntm_20, n_tm)]), rth)
            } else if rel < 0L {
              let dtm_5 = sbcbn(ntm_20, mtm_18)
              let th_12 = num_adc_rule_1(dtm_5)(mtm_18)
              let t646 = @kernel.inst_rule(
                @list.List([(dtm_5, m_tm), (mtm_18, n_tm), (ntm_20, p_tm)]),
                pth_3,
              )
              quick_prove_hyp(th_12)(t646)
            } else {
              let dtm_6 = subbn(mtm_18, ntm_20)
              let th_13 = num_add_rule_1(dtm_6)(ntm_20)
              let t647 = @kernel.inst_rule(
                @list.List([(dtm_6, m_tm), (mtm_18, n_tm), (ntm_20, p_tm)]),
                qth,
              )
              quick_prove_hyp(th_13)(t647)
            }
          }
          _ => raise Failure("NUM_LT_CONV")
        }
      }
      let t655 = @meson.meson_tac(
        @list.List([@arith.le_add(), @arith.add_sym()]),
      )
      let t654 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
      let t656 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
              x650 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s651 = @tactics.subst1_tac(x650)
              fn(
                x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s651(x652)
              }
            })(@equal.sym(x653))
          }),
          t654,
        ),
        t655,
      )
      let t657 = (
        @term_syntax.parse_term("(m : Num) + (n : Num) == (p : Num) → (NUMERAL(n) <= NUMERAL(p)) == true"),
        t656,
      )
      let pth_4 = (fn(x648 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x648))
      })(
        (fn(
          x649 : (
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
          @tactics.prove(x649.0, x649.1)
        })(t657),
      )
      let t665 = @meson.meson_tac(@list.List([@arith.add_sym()]))
      let t664 = @simp.rewrite_tac(
        @list.List([
          @nums.numeral(),
          @arith.not_le(),
          @arith.add_clauses(),
          @arith.lt_exists(),
        ]),
      )
      let t666 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
              let s661 = @tactics.subst1_tac(x660)
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
          }),
          t664,
        ),
        t665,
      )
      let t667 = (
        @term_syntax.parse_term("SUC((m : Num) + (p : Num)) == (n : Num) → (NUMERAL(n) <= NUMERAL(p)) == false"),
        t666,
      )
      let qth_1 = (fn(x658 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x658))
      })(
        (fn(
          x659 : (
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
          @tactics.prove(x659.0, x659.1)
        })(t667),
      )
      let t669 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
      let t670 = (@term_syntax.parse_term("(NUMERAL((n : Num)) <= NUMERAL(n)) == true"), t669)
      let rth_1 = standardize(
        (fn(
          x668 : (
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
          @tactics.prove(x668.0, x668.1)
        })(t670),
      )
      let num_le_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x671 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_18 = x671
        match tm_18 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("<=", _),
              @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_19)
            ),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_21)
          ) => {
            let rel_1 = orderrelation(mtm_19, ntm_21)
            if rel_1 == 0L {
              @kernel.inst_rule(@list.List([(ntm_21, n_tm)]), rth_1)
            } else if rel_1 < 0L {
              let dtm_7 = subbn(ntm_21, mtm_19)
              let th_14 = num_add_rule_1(dtm_7)(mtm_19)
              let t672 = @kernel.inst_rule(
                @list.List([(dtm_7, m_tm), (mtm_19, n_tm), (ntm_21, p_tm)]),
                pth_4,
              )
              quick_prove_hyp(th_14)(t672)
            } else {
              let dtm_8 = sbcbn(mtm_19, ntm_21)
              let th_15 = num_adc_rule_1(dtm_8)(ntm_21)
              let t673 = @kernel.inst_rule(
                @list.List([(dtm_8, m_tm), (mtm_19, n_tm), (ntm_21, p_tm)]),
                qth_1,
              )
              quick_prove_hyp(th_15)(t673)
            }
          }
          _ => raise Failure("NUM_LE_CONV")
        }
      }
      let t682 = @meson.meson_tac(@list.List([@arith.add_sym()]))
      let t681 = @simp.rewrite_tac(
        @list.List([@arith.not_le(), @arith.lt_exists(), @arith.add_clauses()]),
      )
      let t680 = @simp.rewrite_tac(
        @list.List([
          @nums.numeral(),
          @equal.gsym(@arith.le_antisym()),
          @class.de_morgan_thm(),
        ]),
      )
      let t683 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(fn(
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
              (fn(
                x676 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s677 = @tactics.subst1_tac(x676)
                fn(
                  x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s677(x678)
                }
              })(@equal.sym(x679))
            }),
            t680,
          ),
          t681,
        ),
        t682,
      )
      let t684 = (
        @term_syntax.parse_term("SUC((m : Num) + (n : Num)) == (p : Num) → (NUMERAL(n) == NUMERAL(p)) == false"),
        t683,
      )
      let pth_5 = (fn(x674 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x674))
      })(
        (fn(
          x675 : (
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
          @tactics.prove(x675.0, x675.1)
        })(t684),
      )
      let t693 = @meson.meson_tac(@list.List([@arith.add_sym()]))
      let t692 = @simp.rewrite_tac(
        @list.List([@arith.not_le(), @arith.lt_exists(), @arith.add_clauses()]),
      )
      let t691 = @simp.rewrite_tac(
        @list.List([
          @nums.numeral(),
          @equal.gsym(@arith.le_antisym()),
          @class.de_morgan_thm(),
        ]),
      )
      let t694 = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(fn(
              x690 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x687 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s688 = @tactics.subst1_tac(x687)
                fn(
                  x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s688(x689)
                }
              })(@equal.sym(x690))
            }),
            t691,
          ),
          t692,
        ),
        t693,
      )
      let t695 = (
        @term_syntax.parse_term("SUC((m : Num) + (p : Num)) == (n : Num) → (NUMERAL(n) == NUMERAL(p)) == false"),
        t694,
      )
      let qth_2 = (fn(x685 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch(standardize(x685))
      })(
        (fn(
          x686 : (
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
          @tactics.prove(x686.0, x686.1)
        })(t695),
      )
      let t697 = @simp.rewrite_tac(@list.List([]))
      let t698 = (@term_syntax.parse_term("(NUMERAL((n : Num)) == NUMERAL(n)) == true"), t697)
      let rth_2 = standardize(
        (fn(
          x696 : (
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
          @tactics.prove(x696.0, x696.1)
        })(t698),
      )
      let num_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
        x699 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let tm_19 = x699
        match tm_19 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(
              @kernel.Term::Const("=", _),
              @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), mtm_20)
            ),
            @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_22)
          ) => {
            let rel_2 = orderrelation(mtm_20, ntm_22)
            if rel_2 == 0L {
              @kernel.inst_rule(@list.List([(ntm_22, n_tm)]), rth_2)
            } else if rel_2 < 0L {
              let dtm_9 = sbcbn(ntm_22, mtm_20)
              let th_16 = num_adc_rule_1(dtm_9)(mtm_20)
              let t700 = @kernel.inst_rule(
                @list.List([(dtm_9, m_tm), (mtm_20, n_tm), (ntm_22, p_tm)]),
                pth_5,
              )
              quick_prove_hyp(th_16)(t700)
            } else {
              let dtm_10 = sbcbn(mtm_20, ntm_22)
              let th_17 = num_adc_rule_1(dtm_10)(ntm_22)
              let t701 = @kernel.inst_rule(
                @list.List([(dtm_10, m_tm), (mtm_20, n_tm), (ntm_22, p_tm)]),
                qth_2,
              )
              quick_prove_hyp(th_17)(t701)
            }
          }
          _ => raise Failure("NUM_EQ_CONV")
        }
      }
      (
        num_suc_conv, num_add_conv, num_mult_conv, num_exp_conv_1, num_lt_conv, num_le_conv,
        num_eq_conv,
      )
    }
    _ => raise @lib.MatchFailure("tscript.ml:222")
  }
  num_suc_conv_c.set(num_suc_conv_1)
  num_add_conv_c.set(num_add_conv_1)
  num_mult_conv_c.set(num_mult_conv_1)
  num_exp_conv_c.set(num_exp_conv_2)
  num_lt_conv_c.set(num_lt_conv_1)
  num_le_conv_c.set(num_le_conv_1)
  num_eq_conv_c.set(num_eq_conv_1)
}

///|
fn subbn_l(
  doublebn : (@kernel.Term) -> @kernel.Term raise,
  bit1_tm : @kernel.Term,
  x106 : @kernel.Term,
  x107 : @kernel.Term,
) -> @kernel.Term raise {
  let subbn = (x106 : @kernel.Term, x107 : @kernel.Term) => {
    subbn_l(doublebn, bit1_tm, x106, x107)
  }
  let sbcbn = (x108 : @kernel.Term, x109 : @kernel.Term) => {
    sbcbn_l(doublebn, bit1_tm, x108, x109)
  }
  let mtm_1 = x106
  let ntm_1 = x107
  match (mtm_1, ntm_1) {
    (_, @kernel.Term::Const("_0", _)) => mtm_1
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_3),
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt_3),
    ) => doublebn(subbn(mt_3, nt_3))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_4),
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt_4),
    ) => doublebn(subbn(mt_4, nt_4))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_5),
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt_5),
    ) => @kernel.mk_comb(bit1_tm, subbn(mt_5, nt_5))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_6),
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt_6),
    ) => @kernel.mk_comb(bit1_tm, sbcbn(mt_6, nt_6))
    _ => raise Failure("malformed numeral or wrong relation")
  }
}

///|
fn sbcbn_l(
  doublebn : (@kernel.Term) -> @kernel.Term raise,
  bit1_tm : @kernel.Term,
  x108 : @kernel.Term,
  x109 : @kernel.Term,
) -> @kernel.Term raise {
  let subbn = (x106 : @kernel.Term, x107 : @kernel.Term) => {
    subbn_l(doublebn, bit1_tm, x106, x107)
  }
  let sbcbn = (x108 : @kernel.Term, x109 : @kernel.Term) => {
    sbcbn_l(doublebn, bit1_tm, x108, x109)
  }
  let mtm_2 = x108
  let ntm_2 = x109
  match (mtm_2, ntm_2) {
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_7),
      @kernel.Term::Const("_0", _),
    ) => @kernel.mk_comb(bit1_tm, sbcbn(mt_7, ntm_2))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_8),
      @kernel.Term::Const("_0", _),
    ) => doublebn(mt_8)
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_9),
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt_7),
    ) => @kernel.mk_comb(bit1_tm, sbcbn(mt_9, nt_7))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_10),
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt_8),
    ) => @kernel.mk_comb(bit1_tm, sbcbn(mt_10, nt_8))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mt_11),
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), nt_9),
    ) => doublebn(subbn(mt_11, nt_9))
    (
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mt_12),
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), nt_10),
    ) => doublebn(sbcbn(mt_12, nt_10))
    _ => raise Failure("malformed numeral or wrong relation")
  }
}

///|
fn num_add_rule_l(
  topsplit : (@kernel.Term) -> (Int64, @kernel.Term) raise,
  zero_tm : @kernel.Term,
  add_clauses : FixedArray[@kernel.Thm],
  add_flags : FixedArray[Int64],
  m_tm : @kernel.Term,
  n_tm : @kernel.Term,
  p_tm : @kernel.Term,
  adc_clauses : FixedArray[@kernel.Thm],
  adc_flags : FixedArray[Int64],
  x140 : @kernel.Term,
  x141 : @kernel.Term,
) -> @kernel.Thm raise {
  let num_add_rule = (x140 : @kernel.Term, x141 : @kernel.Term) => {
    num_add_rule_l(
      topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses, adc_flags,
      x140, x141,
    )
  }
  let num_adc_rule = (x142 : @kernel.Term, x143 : @kernel.Term) => {
    num_adc_rule_l(
      topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses, adc_flags,
      x142, x143,
    )
  }
  let mtm_4 = x140
  let ntm_4 = x141
  let (m_lo, m_hi) = topsplit(mtm_4)
  let (n_lo, n_hi) = topsplit(ntm_4)
  let m_ind = if m_hi == zero_tm { m_lo } else { @lib.add63(m_lo, 16L) }
  let n_ind = if n_hi == zero_tm { n_lo } else { @lib.add63(n_lo, 16L) }
  let ind = @lib.add63(@lib.mul63(32L, m_ind), n_ind)
  let th1_1 = @lib.array_get(add_clauses, @lib.int63_to_int(ind))
  let fl = @lib.array_get(add_flags, @lib.int63_to_int(ind))
  match fl {
    0L => @kernel.inst_rule(@list.List([(m_hi, m_tm)]), th1_1)
    1L => @kernel.inst_rule(@list.List([(n_hi, n_tm)]), th1_1)
    2L => {
      let th2 = num_add_rule(m_hi, n_hi)
      match @kernel.concl(th2) {
        @kernel.Term::Comb(_, ptm_1) => {
          let th3 = @kernel.inst_rule(
            @list.List([(m_hi, m_tm), (n_hi, n_tm), (ptm_1, p_tm)]),
            th1_1,
          )
          @kernel.eq_mp(th3, th2)
        }
        _ => raise @lib.MatchFailure("tscript.ml:399")
      }
    }
    3L => {
      let th2_1 = num_adc_rule(m_hi, n_hi)
      match @kernel.concl(th2_1) {
        @kernel.Term::Comb(_, ptm_2) => {
          let th3_1 = @kernel.inst_rule(
            @list.List([(m_hi, m_tm), (n_hi, n_tm), (ptm_2, p_tm)]),
            th1_1,
          )
          @kernel.eq_mp(th3_1, th2_1)
        }
        _ => raise @lib.MatchFailure("tscript.ml:403")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:395")
  }
}

///|
fn num_adc_rule_l(
  topsplit : (@kernel.Term) -> (Int64, @kernel.Term) raise,
  zero_tm : @kernel.Term,
  add_clauses : FixedArray[@kernel.Thm],
  add_flags : FixedArray[Int64],
  m_tm : @kernel.Term,
  n_tm : @kernel.Term,
  p_tm : @kernel.Term,
  adc_clauses : FixedArray[@kernel.Thm],
  adc_flags : FixedArray[Int64],
  x142 : @kernel.Term,
  x143 : @kernel.Term,
) -> @kernel.Thm raise {
  let num_add_rule = (x140 : @kernel.Term, x141 : @kernel.Term) => {
    num_add_rule_l(
      topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses, adc_flags,
      x140, x141,
    )
  }
  let num_adc_rule = (x142 : @kernel.Term, x143 : @kernel.Term) => {
    num_adc_rule_l(
      topsplit, zero_tm, add_clauses, add_flags, m_tm, n_tm, p_tm, adc_clauses, adc_flags,
      x142, x143,
    )
  }
  let mtm_5 = x142
  let ntm_5 = x143
  let (m_lo_1, m_hi_1) = topsplit(mtm_5)
  let (n_lo_1, n_hi_1) = topsplit(ntm_5)
  let m_ind_1 = if m_hi_1 == zero_tm { m_lo_1 } else { @lib.add63(m_lo_1, 16L) }
  let n_ind_1 = if n_hi_1 == zero_tm { n_lo_1 } else { @lib.add63(n_lo_1, 16L) }
  let ind_1 = @lib.add63(@lib.mul63(32L, m_ind_1), n_ind_1)
  let th1_2 = @lib.array_get(adc_clauses, @lib.int63_to_int(ind_1))
  let fl_1 = @lib.array_get(adc_flags, @lib.int63_to_int(ind_1))
  match fl_1 {
    0L => @kernel.inst_rule(@list.List([(m_hi_1, m_tm)]), th1_2)
    1L => @kernel.inst_rule(@list.List([(n_hi_1, n_tm)]), th1_2)
    2L => {
      let th2_2 = num_add_rule(m_hi_1, n_hi_1)
      match @kernel.concl(th2_2) {
        @kernel.Term::Comb(_, ptm_3) => {
          let th3_2 = @kernel.inst_rule(
            @list.List([(m_hi_1, m_tm), (n_hi_1, n_tm), (ptm_3, p_tm)]),
            th1_2,
          )
          @kernel.eq_mp(th3_2, th2_2)
        }
        _ => raise @lib.MatchFailure("tscript.ml:418")
      }
    }
    3L => {
      let th2_3 = num_adc_rule(m_hi_1, n_hi_1)
      match @kernel.concl(th2_3) {
        @kernel.Term::Comb(_, ptm_4) => {
          let th3_3 = @kernel.inst_rule(
            @list.List([(m_hi_1, m_tm), (n_hi_1, n_tm), (ptm_4, p_tm)]),
            th1_2,
          )
          @kernel.eq_mp(th3_3, th2_3)
        }
        _ => raise @lib.MatchFailure("tscript.ml:422")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:414")
  }
}

///|
fn gen_num_square_rule_l(
  pth_0_2 : @kernel.Thm,
  m_tm : @kernel.Term,
  n_tm : @kernel.Term,
  pth_even3 : @kernel.Thm,
  pth_even : @kernel.Thm,
  zero_tm : @kernel.Term,
  pth_1_2 : @kernel.Thm,
  num_add_rule_1 : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  one_tm : @kernel.Term,
  subbn : (@kernel.Term, @kernel.Term) -> @kernel.Term raise,
  bit0_tm : @kernel.Term,
  a_tm : @kernel.Term,
  p_tm : @kernel.Term,
  pth_qstep : @kernel.Thm,
  quick_prove_hyp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
  pth_odd : @kernel.Thm,
  ap_bit1 : (@kernel.Thm) -> @kernel.Thm raise,
  ap_bit0 : (@kernel.Thm) -> @kernel.Thm raise,
  num_shift_conv_1 : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  b_tm : @kernel.Term,
  c_tm : @kernel.Term,
  d_tm : @kernel.Term,
  e_tm : @kernel.Term,
  h_tm : @kernel.Term,
  l_tm : @kernel.Term,
  pth_rec : @kernel.Thm,
  num_unshift_conv_1 : (@kernel.Term) -> @kernel.Thm raise,
  dest_raw_numeral : (@kernel.Term) -> @num.Num raise,
  num_2 : @num.Num,
  pth_toom3 : @kernel.Thm,
  binop2_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
    (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
  toom3_conv : (@kernel.Term) -> @kernel.Thm raise,
  bitcounts : (@kernel.Term) -> (Int64, Int64) raise,
  x479 : Int64,
  x480 : Int64,
  x481 : @kernel.Term,
) -> @kernel.Thm raise {
  let gen_num_square_rule = (x479 : Int64, x480 : Int64, x481 : @kernel.Term) => {
    gen_num_square_rule_l(
      pth_0_2, m_tm, n_tm, pth_even3, pth_even, zero_tm, pth_1_2, num_add_rule_1,
      one_tm, subbn, bit0_tm, a_tm, p_tm, pth_qstep, quick_prove_hyp, pth_odd, ap_bit1,
      ap_bit0, num_shift_conv_1, b_tm, c_tm, d_tm, e_tm, h_tm, l_tm, pth_rec, num_unshift_conv_1,
      dest_raw_numeral, num_2, pth_toom3, binop2_conv, toom3_conv, bitcounts, x479,
      x480, x481,
    )
  }
  let num_square_rule = (x485 : @kernel.Term) => {
    num_square_rule_l(
      pth_0_2, m_tm, n_tm, pth_even3, pth_even, zero_tm, pth_1_2, num_add_rule_1,
      one_tm, subbn, bit0_tm, a_tm, p_tm, pth_qstep, quick_prove_hyp, pth_odd, ap_bit1,
      ap_bit0, num_shift_conv_1, b_tm, c_tm, d_tm, e_tm, h_tm, l_tm, pth_rec, num_unshift_conv_1,
      dest_raw_numeral, num_2, pth_toom3, binop2_conv, toom3_conv, bitcounts, x485,
    )
  }
  let w_1 = x479
  let z_1 = x480
  let tm_9 = x481
  match tm_9 {
    @kernel.Term::Const("_0", _) => pth_0_2
    @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), mtm_7) =>
      match mtm_7 {
        @kernel.Term::Comb(
          @kernel.Term::Const("BIT0", _),
          @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ptm_12)
        ) => {
          let th1_14 = gen_num_square_rule(w_1, @lib.sub63(z_1, 3L), ptm_12)
          let ntm_10 = @kernel.rand(@kernel.concl(th1_14))
          @kernel.eq_mp(
            @kernel.inst_rule(
              @list.List([(ptm_12, m_tm), (ntm_10, n_tm)]),
              pth_even3,
            ),
            th1_14,
          )
        }
        _ => {
          let th1_15 = gen_num_square_rule(w_1, @lib.sub63(z_1, 1L), mtm_7)
          let ntm_11 = @kernel.rand(@kernel.concl(th1_15))
          @kernel.eq_mp(
            @kernel.inst_rule(
              @list.List([(mtm_7, m_tm), (ntm_11, n_tm)]),
              pth_even,
            ),
            th1_15,
          )
        }
      }
    @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), mtm_8) =>
      if mtm_8 == zero_tm {
        pth_1_2
      } else if (w_1 < 100L || z_1 < 20L) && @lib.add63(w_1, z_1) < 150L {
        match mtm_8 {
          @kernel.Term::Comb(
            @kernel.Term::Const("BIT1", _),
            @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_12)
          ) => {
            let th1_16 = num_add_rule_1(ntm_12)(one_tm)
            let mtm_9 = @kernel.rand(@kernel.concl(th1_16))
            let th2_9 = num_square_rule(mtm_9)
            let ptm_13 = @kernel.rand(@kernel.concl(th2_9))
            let atm_5 = subbn(
              @kernel.mk_comb(bit0_tm, @kernel.mk_comb(bit0_tm, ptm_13)),
              mtm_9,
            )
            let th3_7 = num_add_rule_1(mtm_9)(atm_5)
            let th4 = @kernel.inst_rule(
              @list.List([
                (atm_5, a_tm),
                (mtm_9, m_tm),
                (ntm_12, n_tm),
                (ptm_13, p_tm),
              ]),
              pth_qstep,
            )
            quick_prove_hyp(@bool.conj(th1_16, @bool.conj(th2_9, th3_7)))(th4)
          }
          _ => {
            let th1_17 = gen_num_square_rule(@lib.sub63(w_1, 1L), z_1, mtm_8)
            let ntm_13 = @kernel.rand(@kernel.concl(th1_17))
            let th2_10 = @kernel.eq_mp(
              @kernel.inst_rule(
                @list.List([(mtm_8, m_tm), (ntm_13, n_tm)]),
                pth_odd,
              ),
              th1_17,
            )
            match @kernel.concl(th2_10) {
              @kernel.Term::Comb(
                _,
                @kernel.Term::Comb(
                  _,
                  @kernel.Term::Comb(
                    _,
                    @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_14), qtm_3)
                  )
                )
              ) => {
                let th3_8 = num_add_rule_1(ptm_14)(qtm_3)
                @kernel.trans(th2_10, ap_bit1(ap_bit0(th3_8)))
              }
              _ => raise @lib.MatchFailure("tscript.ml:926")
            }
          }
        }
      } else if @lib.add63(w_1, z_1) < 800L {
        let k2 = @lib.div63(@lib.add63(w_1, z_1), 2L)
        let th1_18 = num_shift_conv_1(k2)(tm_9)
        match @kernel.rand(@kernel.concl(th1_18)) {
          @kernel.Term::Comb(
            @kernel.Term::Comb(_, ltm),
            @kernel.Term::Comb(@kernel.Term::Comb(_, ptm_15), htm)
          ) => {
            let th2_11 = num_add_rule_1(htm)(ltm)
            let mtm_10 = @kernel.rand(@kernel.concl(th2_11))
            let th3_9 = num_square_rule(htm)
            let th4_1 = num_square_rule(ltm)
            let th5 = num_square_rule(mtm_10)
            let atm_6 = @kernel.rand(@kernel.concl(th3_9))
            let ctm_2 = @kernel.rand(@kernel.concl(th4_1))
            let dtm = @kernel.rand(@kernel.concl(th5))
            let th6 = num_add_rule_1(atm_6)(ctm_2)
            let etm = @kernel.rand(@kernel.concl(th6))
            let btm_7 = subbn(dtm, etm)
            let th7 = num_add_rule_1(etm)(btm_7)
            let dtm_1 = @kernel.rand(@kernel.concl(th7))
            let th8 = @kernel.inst_rule(
              @list.List([
                (atm_6, a_tm),
                (btm_7, b_tm),
                (ctm_2, c_tm),
                (dtm_1, d_tm),
                (etm, e_tm),
                (htm, h_tm),
                (ltm, l_tm),
                (mtm_10, m_tm),
                (tm_9, n_tm),
                (ptm_15, p_tm),
              ]),
              pth_rec,
            )
            let th9 = quick_prove_hyp(
              @lib.end_itlist(
                @bool.conj,
                @list.List([th1_18, th2_11, th3_9, th4_1, th5, th6, th7]),
              ),
            )(th8)
            @equal.conv_rule(
              @equal.rand_conv(
                @equal.thenc(
                  @equal.rand_conv(@equal.rand_conv(num_unshift_conv_1)),
                  num_unshift_conv_1,
                ),
              ),
              th9,
            )
          }
          _ => raise @lib.MatchFailure("tscript.ml:933")
        }
      } else {
        let k3 = @lib.div63(@lib.add63(w_1, z_1), 3L)
        let t482 = @equal.rand_conv(@equal.rand_conv(num_shift_conv_1(k3)))
        let th0 = @equal.thenc(num_shift_conv_1(k3), t482)(tm_9)
        match @kernel.rand(@kernel.concl(th0)) {
          @kernel.Term::Comb(
            @kernel.Term::Comb(_, ltm_1),
            @kernel.Term::Comb(
              @kernel.Term::Comb(_, ptm_16),
              @kernel.Term::Comb(
                @kernel.Term::Comb(_, mtm_11),
                @kernel.Term::Comb(@kernel.Term::Comb(_, _), htm_1)
              )
            )
          ) => {
            let th1_19 = num_square_rule(htm_1)
            let th2_12 = num_square_rule(ltm_1)
            let atm_7 = @kernel.rand(@kernel.concl(th2_12))
            let etm_1 = @kernel.rand(@kernel.concl(th1_19))
            let lnum = dest_raw_numeral(ltm_1)
            let mnum = dest_raw_numeral(mtm_11)
            let hnum = dest_raw_numeral(htm_1)
            let btm_8 = @kernel.rand(
              @nums.mk_numeral(@num.mult_num(@num.mult_num(num_2, lnum), mnum)),
            )
            let t483 = @num.mult_num(@num.mult_num(num_2, lnum), hnum)
            let ctm_3 = @kernel.rand(
              @nums.mk_numeral(@num.add_num(@num.mult_num(mnum, mnum), t483)),
            )
            let dtm_2 = @kernel.rand(
              @nums.mk_numeral(@num.mult_num(@num.mult_num(num_2, hnum), mnum)),
            )
            let th_10 = @kernel.inst_rule(
              @list.List([
                (atm_7, a_tm),
                (btm_8, b_tm),
                (ctm_3, c_tm),
                (dtm_2, d_tm),
                (etm_1, e_tm),
                (htm_1, h_tm),
                (mtm_11, m_tm),
                (ltm_1, l_tm),
                (ptm_16, p_tm),
              ]),
              pth_toom3,
            )
            let t484 = binop2_conv(toom3_conv)(toom3_conv)
            let th_p = @equal.conv_rule(
              binop2_conv(
                @equal.rand_conv(
                  @equal.rand_conv(binop2_conv(toom3_conv)(t484)),
                ),
              )(toom3_conv),
              th_10,
            )
            match
              @basics.conjuncts(
                @kernel.rand(@kernel.rand(@equal.lhand(@kernel.concl(th_p)))),
              ) {
              More(tm3, tail=More(tm4, tail=More(tm5, tail=Empty))) => {
                let th3_10 = num_square_rule(@equal.lhand(@equal.lhand(tm3)))
                let th4_2 = num_square_rule(@equal.lhand(@equal.lhand(tm4)))
                let th5_1 = num_square_rule(@equal.lhand(@equal.lhand(tm5)))
                @bool.mp(
                  th_p,
                  @lib.end_itlist(
                    @bool.conj,
                    @list.List([th1_19, th2_12, th3_10, th4_2, th5_1]),
                  ),
                )
              }
              _ => raise @lib.MatchFailure("tscript.ml:977")
            }
          }
          _ => raise @lib.MatchFailure("tscript.ml:958")
        }
      }
    _ => raise @lib.MatchFailure("tscript.ml:895")
  }
}

///|
fn num_square_rule_l(
  pth_0_2 : @kernel.Thm,
  m_tm : @kernel.Term,
  n_tm : @kernel.Term,
  pth_even3 : @kernel.Thm,
  pth_even : @kernel.Thm,
  zero_tm : @kernel.Term,
  pth_1_2 : @kernel.Thm,
  num_add_rule_1 : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  one_tm : @kernel.Term,
  subbn : (@kernel.Term, @kernel.Term) -> @kernel.Term raise,
  bit0_tm : @kernel.Term,
  a_tm : @kernel.Term,
  p_tm : @kernel.Term,
  pth_qstep : @kernel.Thm,
  quick_prove_hyp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
  pth_odd : @kernel.Thm,
  ap_bit1 : (@kernel.Thm) -> @kernel.Thm raise,
  ap_bit0 : (@kernel.Thm) -> @kernel.Thm raise,
  num_shift_conv_1 : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  b_tm : @kernel.Term,
  c_tm : @kernel.Term,
  d_tm : @kernel.Term,
  e_tm : @kernel.Term,
  h_tm : @kernel.Term,
  l_tm : @kernel.Term,
  pth_rec : @kernel.Thm,
  num_unshift_conv_1 : (@kernel.Term) -> @kernel.Thm raise,
  dest_raw_numeral : (@kernel.Term) -> @num.Num raise,
  num_2 : @num.Num,
  pth_toom3 : @kernel.Thm,
  binop2_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
    (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
  toom3_conv : (@kernel.Term) -> @kernel.Thm raise,
  bitcounts : (@kernel.Term) -> (Int64, Int64) raise,
  x485 : @kernel.Term,
) -> @kernel.Thm raise {
  let gen_num_square_rule = (x479 : Int64, x480 : Int64, x481 : @kernel.Term) => {
    gen_num_square_rule_l(
      pth_0_2, m_tm, n_tm, pth_even3, pth_even, zero_tm, pth_1_2, num_add_rule_1,
      one_tm, subbn, bit0_tm, a_tm, p_tm, pth_qstep, quick_prove_hyp, pth_odd, ap_bit1,
      ap_bit0, num_shift_conv_1, b_tm, c_tm, d_tm, e_tm, h_tm, l_tm, pth_rec, num_unshift_conv_1,
      dest_raw_numeral, num_2, pth_toom3, binop2_conv, toom3_conv, bitcounts, x479,
      x480, x481,
    )
  }
  let tm_10 = x485
  let (w_2, z_2) = bitcounts(tm_10)
  gen_num_square_rule(w_2, z_2, tm_10)
}

///|
/// NUM_GT_CONV
fn step_23() -> Unit raise {
  num_gt_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x702 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x702
        },
        @list.List([@arith.gt()]),
      ),
      num_lt_conv,
    ),
  )
}

///|
let num_gt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_GT_CONV")

///|
/// `NUM_GT_CONV`
pub fn num_gt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_gt_conv_c.get()(x)
}

///|
/// NUM_GE_CONV
fn step_24() -> Unit raise {
  num_ge_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x703 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x703
        },
        @list.List([@arith.ge()]),
      ),
      num_le_conv,
    ),
  )
}

///|
let num_ge_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_GE_CONV")

///|
/// `NUM_GE_CONV`
pub fn num_ge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_ge_conv_c.get()(x)
}

///|
/// NUM_PRE_CONV
fn step_25() -> Unit raise {
  let t704 = @simp.rewrite_tac(@list.List([@arith.pre()]))
  let tth = @tactics.prove(@term_syntax.parse_term("PRE(0) == 0"), t704)
  let t709 = @simp.rewrite_tac(@list.List([@arith.pre()]))
  let t710 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x708 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x705 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s706 = @tactics.subst1_tac(x705)
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
      })(@equal.sym(x708))
    }),
    t709,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("SUC((m : Num)) == (n : Num) → PRE(n) == m"),
    t710,
  )
  let m = @term_syntax.parse_term("(m : Num)")
  let n = @term_syntax.parse_term("(n : Num)")
  let suc = @term_syntax.parse_term("SUC")
  let pre = @term_syntax.parse_term("PRE")
  num_pre_conv_c.set(fn(x711 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x711
    try {
      let (l, r) = @kernel.dest_comb(tm)
      if !(l == pre) {
        @lib.failure()
      } else {
        let x = @basics.dest_numeral(r)
        if @num.eq_num(x, @num.num_of_int64(0L)) {
          tth
        } else {
          let tm_p = @nums.mk_numeral(@num.sub_num(x, @num.num_of_int64(1L)))
          let th1 = num_suc_conv(@kernel.mk_comb(suc, tm_p))
          @bool.mp(@kernel.inst_rule(@list.List([(tm_p, m), (r, n)]), pth), th1)
        }
      }
    } catch {
      Failure(_) => raise Failure("NUM_PRE_CONV")
      e => raise e
    }
  })
}

///|
let num_pre_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_PRE_CONV",
)

///|
/// `NUM_PRE_CONV`
pub fn num_pre_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_pre_conv_c.get()(x)
}

///|
/// NUM_SUB_CONV
fn step_26() -> Unit raise {
  let t712 = @simp.rewrite_tac(@list.List([@arith.sub_eq_0()]))
  let pth0 = @tactics.prove(@term_syntax.parse_term("(p : Num) <= (n : Num) → p - n == 0"), t712)
  let t717 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t718 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x716 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x713 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s714 = @tactics.subst1_tac(x713)
        fn(
          x715 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s714(x715)
        }
      })(@equal.sym(x716))
    }),
    t717,
  )
  let pth1 = @tactics.prove(
    @term_syntax.parse_term("(m : Num) + (n : Num) == (p : Num) → p - n == m"),
    t718,
  )
  let m = @term_syntax.parse_term("(m : Num)")
  let n = @term_syntax.parse_term("(n : Num)")
  let p = @term_syntax.parse_term("(p : Num)")
  let minus = @term_syntax.parse_term("op_minus")
  let plus = @term_syntax.parse_term("op_plus")
  let le = @term_syntax.parse_term("op_lt_eq")
  num_sub_conv_c.set(fn(x719 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x719
    try {
      let (l, r) = @basics.dest_binop(minus, tm)
      let ln = @basics.dest_numeral(l)
      let rn = @basics.dest_numeral(r)
      if @num.le_num(ln, rn) {
        let pth = @kernel.inst_rule(@list.List([(l, p), (r, n)]), pth0)
        let th0 = @bool.eqt_elim(num_le_conv(@basics.mk_binop(le, l, r)))
        @bool.mp(pth, th0)
      } else {
        let kn = @num.sub_num(ln, rn)
        let k = @nums.mk_numeral(kn)
        let pth_1 = @kernel.inst_rule(
          @list.List([(k, m), (l, p), (r, n)]),
          pth1,
        )
        let th0_1 = num_add_conv(@basics.mk_binop(plus, k, r))
        @bool.mp(pth_1, th0_1)
      }
    } catch {
      Failure(_) => raise Failure("NUM_SUB_CONV")
      e => raise e
    }
  })
}

///|
let num_sub_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_SUB_CONV",
)

///|
/// `NUM_SUB_CONV`
pub fn num_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_sub_conv_c.get()(x)
}

///|
let num_div_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_DIV_CONV",
)

///|
/// `NUM_DIV_CONV`
pub fn num_div_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_div_conv_c.get()(x)
}

///|
let num_mod_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_MOD_CONV",
)

///|
/// `NUM_MOD_CONV`
pub fn num_mod_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_mod_conv_c.get()(x)
}

///|
/// NUM_DIV_CONV, NUM_MOD_CONV
fn step_27() -> Unit raise {
  let t720 = @meson.meson_tac(@list.List([@arith.divmod_uniq()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("(q : Num) * (n : Num) + (r : Num) == (m : Num) → r < n → DIV(m, n) == q && MOD(m, n) == r"),
    t720,
  )
  let t721 = @simp.rewrite_tac(
    @list.List([@arith.div_zero(), @arith.mod_zero()]),
  )
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, DIV(m, 0) == 0 && MOD(m, 0) == m"),
    t721,
  )
  let m = @term_syntax.parse_term("(m : Num)")
  let n = @term_syntax.parse_term("(n : Num)")
  let q = @term_syntax.parse_term("(q : Num)")
  let r = @term_syntax.parse_term("(r : Num)")
  let dtm = @term_syntax.parse_term("DIV")
  let mtm = @term_syntax.parse_term("MOD")
  let num_divmod_conv : (@num.Num) -> ((@num.Num) -> @kernel.Thm raise) raise = fn(
    x722 : @num.Num,
  ) -> ((@num.Num) -> @kernel.Thm raise) raise {
    let x = x722
    fn(x723 : @num.Num) -> @kernel.Thm raise {
      let y = x723
      if @num.eq_num(y, @num.num_0) {
        @bool.spec(@nums.mk_numeral(x), pth0)
      } else {
        let k = @num.quo_num(x, y)
        let l = @num.mod_num(x, y)
        let t724 = (@nums.mk_numeral(l), r)
        let t725 = (@nums.mk_numeral(k), q)
        let t726 = (@nums.mk_numeral(y), n)
        let th0 = @kernel.inst_rule(
          @list.List([(@nums.mk_numeral(x), m), t726, t725, t724]),
          pth,
        )
        let tm0 = @equal.lhand(@equal.lhand(@kernel.concl(th0)))
        let th1 = @equal.thenc(@equal.land_conv(num_mult_conv), num_add_conv)(
          tm0,
        )
        let th2 = @bool.mp(th0, th1)
        let tm2 = @equal.lhand(@kernel.concl(th2))
        @bool.mp(th2, @bool.eqt_elim(num_lt_conv(tm2)))
      }
    }
  }
  let (num_div_conv, num_mod_conv) = (
    fn(x727 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x727
      try {
        let (xt, yt) = @basics.dest_binop(dtm, tm)
        let t728 = @basics.dest_numeral(yt)
        @bool.conjunct1(num_divmod_conv(@basics.dest_numeral(xt))(t728))
      } catch {
        Failure(_) => raise Failure("NUM_DIV_CONV")
        e => raise e
      }
    },
    fn(x729 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x729
      try {
        let (xt_1, yt_1) = @basics.dest_binop(mtm, tm_1)
        let t730 = @basics.dest_numeral(yt_1)
        @bool.conjunct2(num_divmod_conv(@basics.dest_numeral(xt_1))(t730))
      } catch {
        Failure(_) => raise Failure("NUM_MOD_CONV")
        e => raise e
      }
    },
  )
  num_div_conv_c.set(num_div_conv)
  num_mod_conv_c.set(num_mod_conv)
}

///|
/// NUM_FACT_CONV
fn step_28() -> Unit raise {
  let suc = @term_syntax.parse_term("SUC")
  let mul = @term_syntax.parse_term("op_star")
  let t731 = @simp.rewrite_tac(@list.List([@arith.fact()]))
  let pth_0 = @tactics.prove(@term_syntax.parse_term("FACT(0) == 1"), t731)
  let t736 = @simp.rewrite_tac(@list.List([@arith.fact()]))
  let t737 = @tactics.then_tac(
    @tactics.repeat_tac(
      @tactics.disch_then(fn(
        x735 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x732 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s733 = @tactics.subst1_tac(x732)
          fn(
            x734 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s733(x734)
          }
        })(@equal.sym(x735))
      }),
    ),
    t736,
  )
  let pth_suc = @tactics.prove(
    @term_syntax.parse_term("SUC((x : Num)) == (y : Num) → FACT(x) == (w : Num) → y * w == (z : Num) → FACT(y) == z"),
    t737,
  )
  let w = @term_syntax.parse_term("(w : Num)")
  let x = @term_syntax.parse_term("(x : Num)")
  let y = @term_syntax.parse_term("(y : Num)")
  let z = @term_syntax.parse_term("(z : Num)")
  let mksuc : (@num.Num) -> @kernel.Thm raise = fn(
    x738 : @num.Num,
  ) -> @kernel.Thm raise {
    let n = x738
    let n_p = @num.sub_num(n, @num.num_of_int64(1L))
    num_suc_conv(@kernel.mk_comb(suc, @nums.mk_numeral(n_p)))
  }
  fn num_fact_conv_1(x739 : @num.Num) -> @kernel.Thm raise {
    let n_1 = x739
    if @num.eq_num(n_1, @num.num_of_int64(0L)) {
      pth_0
    } else {
      let th0 = mksuc(n_1)
      let tmx = @kernel.rand(@equal.lhand(@kernel.concl(th0)))
      let tm0 = @kernel.rand(@kernel.concl(th0))
      let th1 = num_fact_conv_1(@num.sub_num(n_1, @num.num_of_int64(1L)))
      let tm1 = @kernel.rand(@kernel.concl(th1))
      let th2 = num_mult_conv(@basics.mk_binop(mul, tm0, tm1))
      let tm2 = @kernel.rand(@kernel.concl(th2))
      let pth = @kernel.inst_rule(
        @list.List([(tmx, x), (tm0, y), (tm1, w), (tm2, z)]),
        pth_suc,
      )
      @bool.mp(@bool.mp(@bool.mp(pth, th0), th1), th2)
    }
  }
  num_fact_conv_c.set(fn(x740 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x740
    try {
      let (l, r) = @kernel.dest_comb(tm)
      if @kernel.dest_const(l).0 == "FACT" {
        num_fact_conv_1(@basics.dest_numeral(r))
      } else {
        @lib.failure()
      }
    } catch {
      Failure(_) => raise Failure("NUM_FACT_CONV")
      e => raise e
    }
  })
}

///|
let num_fact_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_FACT_CONV",
)

///|
/// `NUM_FACT_CONV`
pub fn num_fact_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_fact_conv_c.get()(x)
}

///|
/// NUM_MAX_CONV
fn step_29() -> Unit raise {
  let t743 = @simp.gen_rewrite_conv(
    fn(
      x742 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x742
    },
    @list.List([@class.cond_clauses()]),
  )
  let t741 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(num_le_conv)))
  num_max_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(@arith.max()), t741), t743),
  )
}

///|
let num_max_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_MAX_CONV")

///|
/// `NUM_MAX_CONV`
pub fn num_max_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_max_conv_c.get()(x)
}

///|
/// NUM_MIN_CONV
fn step_30() -> Unit raise {
  let t746 = @simp.gen_rewrite_conv(
    fn(
      x745 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x745
    },
    @list.List([@class.cond_clauses()]),
  )
  let t744 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(num_le_conv)))
  num_min_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(@arith.min()), t744), t746),
  )
}

///|
let num_min_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NUM_MIN_CONV")

///|
/// `NUM_MIN_CONV`
pub fn num_min_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_min_conv_c.get()(x)
}

///|
/// NUM_REL_CONV
fn step_31() -> Unit raise {
  let t758 = @simp.basic_net()
  let t754 = (@term_syntax.parse_term("NUMERAL((m : Num)) == NUMERAL((n : Num))"), num_eq_conv)
  let t755 = (@term_syntax.parse_term("NUMERAL((m : Num)) >= NUMERAL((n : Num))"), num_ge_conv)
  let t756 = (@term_syntax.parse_term("NUMERAL((m : Num)) > NUMERAL((n : Num))"), num_gt_conv)
  let t757 = (@term_syntax.parse_term("NUMERAL((m : Num)) <= NUMERAL((n : Num))"), num_le_conv)
  let gconv_net = @lib.itlist(
    fn(
      x751 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x752 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s753 = ((x750 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x747 : @kernel.Term,
            x748 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x749 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x747, x748, x749)
            }
          },
          x750,
        )
      })(x751)
      s753(x752)
    },
    @list.List([
      (@term_syntax.parse_term("NUMERAL((m : Num)) < NUMERAL((n : Num))"), num_lt_conv),
      t757,
      t756,
      t755,
      t754,
    ]),
    t758,
  )
  num_rel_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let num_rel_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_REL_CONV",
)

///|
/// `NUM_REL_CONV`
pub fn num_rel_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_rel_conv_c.get()(x)
}

///|
/// num_red_conv_list
fn step_32() -> Unit raise {
  let t759 = (@term_syntax.parse_term("MIN(NUMERAL((m : Num)), NUMERAL((n : Num)))"), num_min_conv)
  let t760 = (@term_syntax.parse_term("MAX(NUMERAL((m : Num)), NUMERAL((n : Num)))"), num_max_conv)
  let t761 = (@term_syntax.parse_term("MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))"), num_mod_conv)
  let t762 = (@term_syntax.parse_term("DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))"), num_div_conv)
  let t763 = (@term_syntax.parse_term("EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))"), num_exp_conv)
  let t764 = (@term_syntax.parse_term("NUMERAL((m : Num)) * NUMERAL((n : Num))"), num_mult_conv)
  let t765 = (@term_syntax.parse_term("NUMERAL((m : Num)) - NUMERAL((n : Num))"), num_sub_conv)
  let t766 = (@term_syntax.parse_term("NUMERAL((m : Num)) + NUMERAL((n : Num))"), num_add_conv)
  let t767 = (@term_syntax.parse_term("ODD(NUMERAL((n : Num)))"), num_odd_conv)
  let t768 = (@term_syntax.parse_term("EVEN(NUMERAL((n : Num)))"), num_even_conv)
  let t769 = (@term_syntax.parse_term("NUMERAL((m : Num)) == NUMERAL((n : Num))"), num_eq_conv)
  let t770 = (@term_syntax.parse_term("NUMERAL((m : Num)) >= NUMERAL((n : Num))"), num_ge_conv)
  let t771 = (@term_syntax.parse_term("NUMERAL((m : Num)) > NUMERAL((n : Num))"), num_gt_conv)
  let t772 = (@term_syntax.parse_term("NUMERAL((m : Num)) <= NUMERAL((n : Num))"), num_le_conv)
  let t773 = (@term_syntax.parse_term("NUMERAL((m : Num)) < NUMERAL((n : Num))"), num_lt_conv)
  let t774 = (@term_syntax.parse_term("FACT(NUMERAL((n : Num)))"), num_fact_conv)
  let t775 = (@term_syntax.parse_term("PRE(NUMERAL((n : Num)))"), num_pre_conv)
  num_red_conv_list_c.set(
    @list.List([
      (@term_syntax.parse_term("SUC(NUMERAL((n : Num)))"), num_suc_conv),
      t775,
      t774,
      t773,
      t772,
      t771,
      t770,
      t769,
      t768,
      t767,
      t766,
      t765,
      t764,
      t763,
      t762,
      t761,
      t760,
      t759,
    ]),
  )
}

///|
let num_red_conv_list_c : @lib.Cell[@list.List[(@kernel.Term, @equal.Conv)]] = @lib.Cell::new(
  "num_red_conv_list",
)

///|
/// `num_red_conv_list`
pub fn num_red_conv_list() -> @list.List[(@kernel.Term, @equal.Conv)] {
  num_red_conv_list_c.get()
}

///|
/// NUM_RED_CONV
fn step_33() -> Unit raise {
  let gconv_net = @lib.itlist(
    fn(
      x780 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x781 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s782 = ((x779 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x776 : @kernel.Term,
            x777 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x778 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x776, x777, x778)
            }
          },
          x779,
        )
      })(x780)
      s782(x781)
    },
    num_red_conv_list(),
    @simp.basic_net(),
  )
  num_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let num_red_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_RED_CONV",
)

///|
/// `NUM_RED_CONV`
pub fn num_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_red_conv_c.get()(x)
}

///|
/// NUM_REDUCE_CONV
fn step_34() -> Unit raise {
  num_reduce_conv_c.set(@equal.depth_conv(num_red_conv))
}

///|
let num_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "NUM_REDUCE_CONV",
)

///|
/// `NUM_REDUCE_CONV`
pub fn num_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_reduce_conv_c.get()(x)
}

///|
/// num_compute_add_convs
fn step_35() -> Unit raise {
  let convlist = @lib.map(
    fn(
      x783 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
    ) -> (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise) raise {
      let (pat, the_conv) = x783
      let (c, args) = @basics.strip_comb(pat)
      (c, Int::to_int64(@lib.length(args)), the_conv)
    },
    num_red_conv_list(),
  )
  num_compute_add_convs_c.set(fn(x784 : @compute.Compset) -> Unit raise {
    let _ as compset = x784
    @lib.itlist(
      fn(
        x785 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
        x786 : Unit,
      ) -> Unit raise {
        let newc = x785
        let _ = x786
        @compute.add_conv(newc, compset)
      },
      convlist,
      (),
    )
  })
}

///|
let num_compute_add_convs_c : @lib.Cell[(@compute.Compset) -> Unit raise] = @lib.Cell::new(
  "num_compute_add_convs",
)

///|
/// `num_compute_add_convs`
pub fn num_compute_add_convs(x : @compute.Compset) -> Unit raise {
  num_compute_add_convs_c.get()(x)
}

///|
/// NUM_COMPUTE_CONV
fn step_36() -> Unit raise {
  let cs = @compute.bool_compset(())
  let t787 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), t787)
  num_compute_add_convs(cs)
  num_compute_conv_c.set(@compute.weak_cbv_conv(cs))
}

///|
let num_compute_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_COMPUTE_CONV",
)

///|
/// `NUM_COMPUTE_CONV`
pub fn num_compute_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_compute_conv_c.get()(x)
}

///|
/// NUM_REDUCE_TAC
fn step_37() -> Unit raise {
  num_reduce_tac_c.set(@tactics.conv_tac(num_reduce_conv))
}

///|
let num_reduce_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "NUM_REDUCE_TAC",
)

///|
/// `NUM_REDUCE_TAC`
pub fn num_reduce_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  num_reduce_tac_c.get()(x)
}

///|
/// num_CONV
fn step_38() -> Unit raise {
  let suc_tm = @term_syntax.parse_term("SUC")
  num_conv_c.set(fn(x788 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x788
    let t789 = @num.num_of_int64(1L)
    let n = @num.sub_num(@basics.dest_numeral(tm), t789)
    if @num.lt_num(n, @num.num_of_int64(0L)) {
      raise Failure("num_CONV")
    } else {
      let tm_p = @nums.mk_numeral(n)
      @equal.sym(num_suc_conv(@kernel.mk_comb(suc_tm, tm_p)))
    }
  })
}

///|
let num_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "num_CONV",
)

///|
/// `num_CONV`
pub fn num_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_conv_c.get()(x)
}

///|
/// EXPAND_CASES_CONV
fn step_39() -> Unit raise {
  let t790 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let pth_base = @tactics.prove(
    @term_syntax.parse_term("(∀ n : Num, n < 0 → (P : (Num) -> Bool)(n)) == true"),
    t790,
  )
  let t791 = @meson.meson_tac(@list.List([]))
  let t792 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.lt()])),
    t791,
  )
  let pth_step = @tactics.prove(
    @term_syntax.parse_term("(∀ n : Num, n < SUC((k : Num)) → (P : (Num) -> Bool)(n)) == ((∀ n : Num, n < k → P(n)) && P(k))"),
    t792,
  )
  let base_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x793 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x793
    },
    @list.List([pth_base]),
  )
  let t795 = @simp.gen_rewrite_conv(
    fn(
      x794 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x794
    },
    @list.List([pth_step]),
  )
  let step_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.binder_conv(@equal.land_conv(@equal.rand_conv(num_conv))),
    t795,
  )
  fn conv(x796 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x796
    @equal.orelsec(base_conv, @equal.thenc(step_conv, @equal.land_conv(conv)))(
      tm,
    )
  }
  expand_cases_conv_c.set(
    @equal.thenc(
      conv,
      @simp.rewrite_conv(@list.List([@equal.gsym(@theorems.conj_assoc())])),
    ),
  )
}

///|
let expand_cases_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "EXPAND_CASES_CONV",
)

///|
/// `EXPAND_CASES_CONV`
pub fn expand_cases_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_cases_conv_c.get()(x)
}

///|
/// EXP_MOD_CONV
fn step_40() -> Unit raise {
  let t801 = @simp.rewrite_tac(@list.List([]))
  let t800 = @tactics.conv_tac(@arith.mod_down_conv)
  let t799 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.exp_add()]))
  let t798 = @simp.rewrite_tac(
    @list.List([@arith.bit0(), @arith.bit1(), @nums.numeral()]),
  )
  let t802 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@arith.exp(), @arith.exp_2()])),
          t798,
        ),
        t799,
      ),
      t800,
    ),
    t801,
  )
  let t803 = (
    @term_syntax.parse_term("MOD(EXP((a : Num), 0), (n : Num)) == MOD(1, n) && MOD(EXP(a, NUMERAL(BIT0((k : Num)))), n) == MOD(EXP(MOD(EXP(a, NUMERAL(k)), n), 2), n) && MOD(EXP(a, NUMERAL(BIT1(k))), n) == MOD(a * MOD(EXP(MOD(EXP(a, NUMERAL(k)), n), 2), n), n)"),
    t802,
  )
  exp_mod_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x797 : (
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
          @tactics.prove(x797.0, x797.1)
        })(t803),
      ) {
      More(pth_0, tail=More(pth_even, tail=More(pth_odd, tail=Empty))) => {
        let conv_zero : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
          fn(
            x804 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x804
          },
          @list.List([@arith.mod_zero()]),
        )
        let conv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
          fn(
            x805 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x805
          },
          @list.List([pth_0]),
        )
        let conv_even : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
          fn(
            x806 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x806
          },
          @list.List([pth_even]),
        )
        let conv_odd : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
          fn(
            x807 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x807
          },
          @list.List([pth_odd]),
        )
        fn conv(x808 : @kernel.Term) -> @kernel.Thm raise {
          let tm = x808
          let t810 = @equal.thenc(
            @equal.thenc(
              conv_odd,
              @equal.land_conv(
                @equal.thenc(
                  @equal.rand_conv(
                    @equal.thenc(
                      @equal.land_conv(
                        @equal.thenc(@equal.land_conv(conv), num_exp_conv),
                      ),
                      num_mod_conv,
                    ),
                  ),
                  num_mult_conv,
                ),
              ),
            ),
            num_mod_conv,
          )
          let t809 = @equal.thenc(
            @equal.thenc(
              conv_even,
              @equal.land_conv(
                @equal.thenc(@equal.land_conv(conv), num_exp_conv),
              ),
            ),
            num_mod_conv,
          )
          @equal.orelsec(
            @equal.orelsec(@equal.thenc(conv_0, num_mod_conv), t809),
            t810,
          )(tm)
        }
        let fullconv : (@kernel.Term) -> @kernel.Thm raise = @equal.orelsec(
          @equal.thenc(conv_zero, num_exp_conv),
          conv,
        )
        fn(x811 : @kernel.Term) -> @kernel.Thm raise {
          let tm_1 = x811
          match tm_1 {
            @kernel.Term::Comb(
              @kernel.Term::Comb(
                @kernel.Term::Const("MOD", _),
                @kernel.Term::Comb(
                  @kernel.Term::Comb(@kernel.Term::Const("EXP", _), m),
                  k
                )
              ),
              n
            ) if @nums.is_numeral(m) &&
              @nums.is_numeral(k) &&
              @nums.is_numeral(n) => fullconv(tm_1)
            _ => raise Failure("EXP_MOD_CONV")
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:1531")
    },
  )
}

///|
let exp_mod_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "EXP_MOD_CONV",
)

///|
/// `EXP_MOD_CONV`
pub fn exp_mod_conv(x : @kernel.Term) -> @kernel.Thm raise {
  exp_mod_conv_c.get()(x)
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
}
