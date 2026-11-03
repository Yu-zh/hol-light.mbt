// Translated from upstream realarith.ml; edit this file directly.

///|
/// REAL_LTE_TOTAL
fn step_1() -> Unit raise {
  let t1 = @tactics.conv_tac(@class.taut)
  let t2 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_lt()])),
    t1,
  )
  real_lte_total_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y || y <= x"), t2),
  )
}

///|
let real_lte_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LTE_TOTAL")

///|
/// `REAL_LTE_TOTAL`
pub fn real_lte_total() -> @kernel.Thm {
  real_lte_total_c.get()
}

///|
/// REAL_LET_TOTAL
fn step_2() -> Unit raise {
  let t3 = @tactics.conv_tac(@class.taut)
  let t4 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_lt()])),
    t3,
  )
  real_let_total_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y || y < x"), t4),
  )
}

///|
let real_let_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LET_TOTAL")

///|
/// `REAL_LET_TOTAL`
pub fn real_let_total() -> @kernel.Thm {
  real_let_total_c.get()
}

///|
/// REAL_LT_IMP_LE
fn step_3() -> Unit raise {
  let t5 = @meson.meson_tac(
    @list.List([@realax.real_lt(), @realax.real_le_total()]),
  )
  real_lt_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y → x <= y"), t5),
  )
}

///|
let real_lt_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_IMP_LE")

///|
/// `REAL_LT_IMP_LE`
pub fn real_lt_imp_le() -> @kernel.Thm {
  real_lt_imp_le_c.get()
}

///|
/// REAL_LTE_TRANS
fn step_4() -> Unit raise {
  let t6 = @meson.meson_tac(
    @list.List([@realax.real_lt(), @realax.real_le_trans()]),
  )
  real_lte_trans_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x < y && y <= z → x < z"), t6),
  )
}

///|
let real_lte_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LTE_TRANS")

///|
/// `REAL_LTE_TRANS`
pub fn real_lte_trans() -> @kernel.Thm {
  real_lte_trans_c.get()
}

///|
/// REAL_LET_TRANS
fn step_5() -> Unit raise {
  let t7 = @meson.meson_tac(
    @list.List([@realax.real_lt(), @realax.real_le_trans()]),
  )
  real_let_trans_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x <= y && y < z → x < z"), t7),
  )
}

///|
let real_let_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LET_TRANS")

///|
/// `REAL_LET_TRANS`
pub fn real_let_trans() -> @kernel.Thm {
  real_let_trans_c.get()
}

///|
/// REAL_LT_TRANS
fn step_6() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([real_lte_trans(), real_lt_imp_le()]))
  real_lt_trans_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x < y && y < z → x < z"), t8),
  )
}

///|
let real_lt_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_TRANS")

///|
/// `REAL_LT_TRANS`
pub fn real_lt_trans() -> @kernel.Thm {
  real_lt_trans_c.get()
}

///|
/// REAL_LE_ADD
fn step_7() -> Unit raise {
  let t9 = @meson.meson_tac(
    @list.List([
      @realax.real_le_ladd_imp(),
      @calc_int.real_add_rid(),
      @realax.real_le_trans(),
    ]),
  )
  real_le_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → real_of_num(0) <= x + y"),
      t9,
    ),
  )
}

///|
let real_le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_ADD")

///|
/// `REAL_LE_ADD`
pub fn real_le_add() -> @kernel.Thm {
  real_le_add_c.get()
}

///|
/// REAL_LTE_ANTISYM
fn step_8() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([@realax.real_lt()]))
  real_lte_antisym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x < y && y <= x)"), t10),
  )
}

///|
let real_lte_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LTE_ANTISYM",
)

///|
/// `REAL_LTE_ANTISYM`
pub fn real_lte_antisym() -> @kernel.Thm {
  real_lte_antisym_c.get()
}

///|
/// REAL_SUB_LE
fn step_9() -> Unit raise {
  let t11 = @simp.rewrite_tac(
    @list.List([
      @realax.real_sub(),
      @equal.gsym(@calc_int.real_le_lneg()),
      @calc_int.real_le_neg2(),
    ]),
  )
  real_sub_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) <= x - y) == (y <= x)"), t11),
  )
}

///|
let real_sub_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_LE")

///|
/// `REAL_SUB_LE`
pub fn real_sub_le() -> @kernel.Thm {
  real_sub_le_c.get()
}

///|
/// REAL_NEG_SUB
fn step_10() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t13 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @realax.real_sub(),
        @calc_int.real_neg_add(),
        @calc_int.real_neg_neg(),
      ]),
    ),
    t12,
  )
  real_neg_sub_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -(x - y) == y - x"), t13),
  )
}

///|
let real_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_SUB")

///|
/// `REAL_NEG_SUB`
pub fn real_neg_sub() -> @kernel.Thm {
  real_neg_sub_c.get()
}

///|
/// REAL_LE_LT
fn step_11() -> Unit raise {
  let t14 = @meson.meson_tac(
    @list.List([@realax.real_le_antisym(), @realax.real_le_total()]),
  )
  let t15 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@realax.real_lt()])),
    t14,
  )
  real_le_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= y) == (x < y || x == y)"),
      t15,
    ),
  )
}

///|
let real_le_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LT")

///|
/// `REAL_LE_LT`
pub fn real_le_lt() -> @kernel.Thm {
  real_le_lt_c.get()
}

///|
/// REAL_SUB_LT
fn step_12() -> Unit raise {
  let t17 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_le_lneg(),
      @calc_int.real_add_rid(),
      real_sub_le(),
    ]),
  )
  let t16 = @simp.once_rewrite_tac(@list.List([@equal.gsym(real_neg_sub())]))
  let t18 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_lt()])), t16),
    t17,
  )
  real_sub_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) < x - y) == (y < x)"), t18),
  )
}

///|
let real_sub_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_LT")

///|
/// `REAL_SUB_LT`
pub fn real_sub_lt() -> @kernel.Thm {
  real_sub_lt_c.get()
}

///|
/// REAL_NOT_LT
fn step_13() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([@realax.real_lt()]))
  real_not_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x < y) == (y <= x)"), t19),
  )
}

///|
let real_not_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NOT_LT")

///|
/// `REAL_NOT_LT`
pub fn real_not_lt() -> @kernel.Thm {
  real_not_lt_c.get()
}

///|
/// REAL_SUB_0
fn step_14() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([real_not_lt()]))
  let t29 = @simp.rewrite_tac(@list.List([real_sub_le(), real_sub_lt()]))
  let t28 = @simp.gen_rewrite_tac(
    fn(
      x27 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x21 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s22 = @equal.land_conv(x21)
        fn(x23 : @kernel.Term) -> @kernel.Thm raise { s22(x23) }
      })(
        (fn(
          x24 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s25 = @equal.land_conv(x24)
          fn(x26 : @kernel.Term) -> @kernel.Thm raise { s25(x26) }
        })(x27),
      )
    },
    @list.List([@equal.gsym(real_not_lt())]),
  )
  let t20 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym())]),
  )
  let t31 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t20),
        t28,
      ),
      t29,
    ),
    t30,
  )
  real_sub_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x - y == real_of_num(0)) == (x == y)"), t31),
  )
}

///|
let real_sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUB_0")

///|
/// `REAL_SUB_0`
pub fn real_sub_0() -> @kernel.Thm {
  real_sub_0_c.get()
}

///|
/// REAL_LT_LE
fn step_15() -> Unit raise {
  let t32 = @meson.meson_tac(
    @list.List([
      @realax.real_lt(),
      @realax.real_le_total(),
      @realax.real_le_antisym(),
    ]),
  )
  real_lt_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x < y) == (x <= y && !(x == y))"),
      t32,
    ),
  )
}

///|
let real_lt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_LE")

///|
/// `REAL_LT_LE`
pub fn real_lt_le() -> @kernel.Thm {
  real_lt_le_c.get()
}

///|
/// REAL_LT_REFL
fn step_16() -> Unit raise {
  let t33 = @simp.rewrite_tac(
    @list.List([@realax.real_lt(), @realax.real_le_refl()]),
  )
  real_lt_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !(x < x)"), t33))
}

///|
let real_lt_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_REFL")

///|
/// `REAL_LT_REFL`
pub fn real_lt_refl() -> @kernel.Thm {
  real_lt_refl_c.get()
}

///|
/// REAL_LTE_ADD
fn step_17() -> Unit raise {
  let t34 = @meson.meson_tac(
    @list.List([
      @realax.real_le_ladd_imp(),
      @calc_int.real_add_rid(),
      real_lte_trans(),
    ]),
  )
  real_lte_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) <= y → real_of_num(0) < x + y"),
      t34,
    ),
  )
}

///|
let real_lte_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LTE_ADD")

///|
/// `REAL_LTE_ADD`
pub fn real_lte_add() -> @kernel.Thm {
  real_lte_add_c.get()
}

///|
/// REAL_LET_ADD
fn step_18() -> Unit raise {
  let t35 = @meson.meson_tac(
    @list.List([real_lte_add(), @realax.real_add_sym()]),
  )
  real_let_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) < y → real_of_num(0) < x + y"),
      t35,
    ),
  )
}

///|
let real_let_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LET_ADD")

///|
/// `REAL_LET_ADD`
pub fn real_let_add() -> @kernel.Thm {
  real_let_add_c.get()
}

///|
/// REAL_LT_ADD
fn step_19() -> Unit raise {
  let t36 = @meson.meson_tac(@list.List([real_lt_imp_le(), real_lte_add()]))
  real_lt_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x && real_of_num(0) < y → real_of_num(0) < x + y"),
      t36,
    ),
  )
}

///|
let real_lt_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_ADD")

///|
/// `REAL_LT_ADD`
pub fn real_lt_add() -> @kernel.Thm {
  real_lt_add_c.get()
}

///|
/// REAL_ENTIRE
fn step_20() -> Unit raise {
  let t51 = @simp.rewrite_tac(
    @list.List([@realax.real_mul_lid(), @calc_int.real_mul_rzero()]),
  )
  let t50 = @tactics.first_assum(fn(
    x48 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x48
    @simp.rewrite_tac(
      @list.List([@drule.match_mp(@realax.real_mul_linv())(th)]),
    )
  })
  let t47 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t43 = @term_syntax.parse_term("op_star(inv((x : Real)))")
  let t46 = @tactics.first_assum(fn(
    x45 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s41 = @tactics.mp_tac(x40)
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
    })(((x44 : @kernel.Thm) => @equal.ap_term(t43, x44))(x45))
  })
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t37 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]),
  )
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
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
                t37,
              ),
              t38,
            ),
            t39,
          ),
          t46,
        ),
        t47,
      ),
      t50,
    ),
    t51,
  )
  real_entire_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x * y == real_of_num(0)) == (x == real_of_num(0) || y == real_of_num(0))"),
      t52,
    ),
  )
}

///|
let real_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ENTIRE")

///|
/// `REAL_ENTIRE`
pub fn real_entire() -> @kernel.Thm {
  real_entire_c.get()
}

///|
/// REAL_LE_NEGTOTAL
fn step_21() -> Unit raise {
  let t53 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_le_rneg(),
      @realax.real_add_lid(),
      @realax.real_le_total(),
    ]),
  )
  real_le_negtotal_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x || real_of_num(0) <= -x"), t53),
  )
}

///|
let real_le_negtotal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_NEGTOTAL",
)

///|
/// `REAL_LE_NEGTOTAL`
pub fn real_le_negtotal() -> @kernel.Thm {
  real_le_negtotal_c.get()
}

///|
/// REAL_LE_SQUARE
fn step_22() -> Unit raise {
  let t58 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_neg_neg(),
    ]),
  )
  let t57 = @tactics.pop_assum(fn(
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
    let th = x54
    let t56 = @bool.conj(th, th)
    @tactics.mp_tac(@drule.match_mp(@realax.real_le_mul())(t56))
  })
  let t59 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.disj_cases_tac(
          @bool.spec(@term_syntax.parse_term("(x : Real)"), real_le_negtotal()),
        ),
      ),
      t57,
    ),
    t58,
  )
  real_le_square_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x * x"), t59),
  )
}

///|
let real_le_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_SQUARE")

///|
/// `REAL_LE_SQUARE`
pub fn real_le_square() -> @kernel.Thm {
  real_le_square_c.get()
}

///|
/// REAL_MUL_RID
fn step_23() -> Unit raise {
  let t60 = @meson.meson_tac(
    @list.List([@realax.real_mul_lid(), @realax.real_mul_sym()]),
  )
  real_mul_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, x * real_of_num(1) == x"), t60))
}

///|
let real_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RID")

///|
/// `REAL_MUL_RID`
pub fn real_mul_rid() -> @kernel.Thm {
  real_mul_rid_c.get()
}

///|
/// REAL_POW_2
fn step_24() -> Unit raise {
  let t62 = @simp.rewrite_tac(@list.List([@realax.real_pow(), real_mul_rid()]))
  let t61 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t63 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t61]),
    ),
    t62,
  )
  real_pow_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, pow(x, 2) == x * x"), t63),
  )
}

///|
let real_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_2")

///|
/// `REAL_POW_2`
pub fn real_pow_2() -> @kernel.Thm {
  real_pow_2_c.get()
}

///|
/// REAL_POLY_CLAUSES
fn step_25() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t65 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t64 = @simp.rewrite_tac(
    @list.List([
      @realax.real_mul_assoc(),
      @realax.real_add_lid(),
      @realax.real_mul_lid(),
    ]),
  )
  let t67 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @realax.real_pow(),
            @realax.real_add_ldistrib(),
            @calc_int.real_mul_lzero(),
          ]),
        ),
        t64,
      ),
      t65,
    ),
    t66,
  )
  real_poly_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ y : Real, ∀ z : Real, x + (y + z) == x + y + z) && (∀ x : Real, ∀ y : Real, x + y == y + x) && (∀ x : Real, real_of_num(0) + x == x) && (∀ x : Real, ∀ y : Real, ∀ z : Real, x * (y * z) == x * y * z) && (∀ x : Real, ∀ y : Real, x * y == y * x) && (∀ x : Real, real_of_num(1) * x == x) && (∀ x : Real, real_of_num(0) * x == real_of_num(0)) && (∀ x : Real, ∀ y : Real, ∀ z : Real, x * (y + z) == x * y + x * z) && (∀ x : Real, pow(x, 0) == real_of_num(1)) && (∀ x : Real, ∀ n : Num, pow(x, SUC(n)) == x * pow(x, n))"),
      t67,
    ),
  )
}

///|
let real_poly_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLY_CLAUSES",
)

///|
/// `REAL_POLY_CLAUSES`
pub fn real_poly_clauses() -> @kernel.Thm {
  real_poly_clauses_c.get()
}

///|
/// REAL_POLY_NEG_CLAUSES
fn step_26() -> Unit raise {
  let t68 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @realax.real_sub(),
      @realax.real_mul_lid(),
    ]),
  )
  real_poly_neg_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, -x == -real_of_num(1) * x) && (∀ x : Real, ∀ y : Real, x - y == x + -real_of_num(1) * y)"),
      t68,
    ),
  )
}

///|
let real_poly_neg_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLY_NEG_CLAUSES",
)

///|
/// `REAL_POLY_NEG_CLAUSES`
pub fn real_poly_neg_clauses() -> @kernel.Thm {
  real_poly_neg_clauses_c.get()
}

///|
/// REAL_POS
fn step_27() -> Unit raise {
  let t69 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_le(), @arith.le_0()]),
  )
  real_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) <= real_of_num(n)"), t69))
}

///|
let real_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POS")

///|
/// `REAL_POS`
pub fn real_pos() -> @kernel.Thm {
  real_pos_c.get()
}

///|
/// REAL_LT_NZ
fn step_28() -> Unit raise {
  let t72 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_le_refl(), real_pos()]),
  )
  let t71 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num((n : Num)) == real_of_num(0)"))
  let t70 = @tactics.conv_tac(
    @equal.rand_conv(@equal.once_depth_conv(@equal.sym_conv)),
  )
  let t73 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([real_lt_le()])),
        ),
        t70,
      ),
      t71,
    ),
    t72,
  )
  real_lt_nz_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(real_of_num(n) == real_of_num(0)) == (real_of_num(0) < real_of_num(n))"), t73),
  )
}

///|
let real_lt_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LT_NZ")

///|
/// `REAL_LT_NZ`
pub fn real_lt_nz() -> @kernel.Thm {
  real_lt_nz_c.get()
}

///|
/// REAL_POS_LT
fn step_29() -> Unit raise {
  let t75 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.lt_nz()), @arith.lt_0()]),
  )
  let t74 = @equal.gsym(real_lt_nz())
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(
        @list.List([
          @bool.spec(@term_syntax.parse_term("SUC((n : Num))"), t74),
          @realax.real_of_num_eq(),
        ]),
      ),
    ),
    t75,
  )
  real_pos_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < real_of_num(SUC(n))"), t76),
  )
}

///|
let real_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POS_LT")

///|
/// `REAL_POS_LT`
pub fn real_pos_lt() -> @kernel.Thm {
  real_pos_lt_c.get()
}

///|
/// `positivstellensatz`
#derive(Eq, Debug)
pub(all) enum Positivstellensatz {
  Axiom_eq(Int64)
  Axiom_le(Int64)
  Axiom_lt(Int64)
  Rational_eq(@num.Num)
  Rational_le(@num.Num)
  Rational_lt(@num.Num)
  Square(@kernel.Term)
  Eqmul(@kernel.Term, Positivstellensatz)
  Sum(Positivstellensatz, Positivstellensatz)
  Product(Positivstellensatz, Positivstellensatz)
}

///|
pub extend Positivstellensatz with Eq::{not_equal, equal}

///|
pub extend Positivstellensatz with Debug::{to_repr}

///|
pub extend Positivstellensatz with @lib.OCompare::{ocompare}

///|
pub extend Positivstellensatz with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Positivstellensatz(x : Positivstellensatz) -> Int {
  match x {
    Axiom_eq(_) => 1000000
    Axiom_le(_) => 1000001
    Axiom_lt(_) => 1000002
    Rational_eq(_) => 1000003
    Rational_le(_) => 1000004
    Rational_lt(_) => 1000005
    Square(_) => 1000006
    Eqmul(_, _) => 1000007
    Sum(_, _) => 1000008
    Product(_, _) => 1000009
  }
}

///|
pub impl @lib.OCompare for Positivstellensatz with fn ocompare(self, other) {
  match (self, other) {
    (Axiom_eq(a0), Axiom_eq(b0)) => @lib.compare(a0, b0)
    (Axiom_le(a0), Axiom_le(b0)) => @lib.compare(a0, b0)
    (Axiom_lt(a0), Axiom_lt(b0)) => @lib.compare(a0, b0)
    (Rational_eq(a0), Rational_eq(b0)) => @lib.compare(a0, b0)
    (Rational_le(a0), Rational_le(b0)) => @lib.compare(a0, b0)
    (Rational_lt(a0), Rational_lt(b0)) => @lib.compare(a0, b0)
    (Square(a0), Square(b0)) => @lib.compare(a0, b0)
    (Eqmul(a0, a1), Eqmul(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Sum(a0, a1), Sum(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Product(a0, a1), Product(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ =>
      ocaml_rank_Positivstellensatz(self).compare(
        ocaml_rank_Positivstellensatz(other),
      )
  }
}

///|
pub impl @lib.OHash for Positivstellensatz with fn ohash_visit(self, h) {
  match self {
    Axiom_eq(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Axiom_le(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Axiom_lt(a0) => {
      h.block(2, 1)
      h.field(a0)
    }
    Rational_eq(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
    Rational_le(a0) => {
      h.block(4, 1)
      h.field(a0)
    }
    Rational_lt(a0) => {
      h.block(5, 1)
      h.field(a0)
    }
    Square(a0) => {
      h.block(6, 1)
      h.field(a0)
    }
    Eqmul(a0, a1) => {
      h.block(7, 2)
      h.field(a0)
      h.field(a1)
    }
    Sum(a0, a1) => {
      h.block(8, 2)
      h.field(a0)
      h.field(a1)
    }
    Product(a0, a1) => {
      h.block(9, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// GEN_REAL_ARITH
fn step_30() -> Unit raise {
  let t78 = @meson.meson_tac(@list.List([@realax.real_le_antisym()]))
  let t77 = @simp.rewrite_tac(@list.List([real_sub_0(), @realax.real_lt()]))
  let t79 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @realax.real_gt(),
          @realax.real_ge(),
          real_sub_lt(),
          real_sub_le(),
          real_neg_sub(),
        ]),
      ),
      t77,
    ),
    t78,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("((x : Real) < (y : Real)) == (y - x > real_of_num(0)) && (x <= y) == (y - x >= real_of_num(0)) && (x > y) == (x - y > real_of_num(0)) && (x >= y) == (x - y >= real_of_num(0)) && (x == y) == (x - y == real_of_num(0)) && !(x < y) == (x - y >= real_of_num(0)) && !(x <= y) == (x - y > real_of_num(0)) && !(x > y) == (y - x >= real_of_num(0)) && !(x >= y) == (y - x > real_of_num(0)) && !(x == y) == (x - y > real_of_num(0) || -(x - y) > real_of_num(0))"),
    t79,
  )
  let pth_final = @class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p"))
  let t81 = @meson.meson_tac(
    @list.List([@realax.real_add_lid(), @calc_int.real_add_rid(), real_lt_add()]),
  )
  let t80 = @simp.rewrite_tac(@list.List([real_le_lt()]))
  let t82 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @realax.real_add_lid(),
          @calc_int.real_add_rid(),
          @realax.real_ge(),
          @realax.real_gt(),
        ]),
      ),
      t80,
    ),
    t81,
  )
  let pth_add = @tactics.prove(
    @term_syntax.parse_term("((x : Real) == real_of_num(0) && (y : Real) == real_of_num(0) → x + y == real_of_num(0)) && (x == real_of_num(0) && y >= real_of_num(0) → x + y >= real_of_num(0)) && (x == real_of_num(0) && y > real_of_num(0) → x + y > real_of_num(0)) && (x >= real_of_num(0) && y == real_of_num(0) → x + y >= real_of_num(0)) && (x >= real_of_num(0) && y >= real_of_num(0) → x + y >= real_of_num(0)) && (x >= real_of_num(0) && y > real_of_num(0) → x + y > real_of_num(0)) && (x > real_of_num(0) && y == real_of_num(0) → x + y > real_of_num(0)) && (x > real_of_num(0) && y >= real_of_num(0) → x + y > real_of_num(0)) && (x > real_of_num(0) && y > real_of_num(0) → x + y > real_of_num(0))"),
    t82,
  )
  let t84 = @meson.meson_tac(@list.List([real_entire()]))
  let t83 = @simp.simp_tac(@list.List([real_lt_le(), @realax.real_le_mul()]))
  let t85 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @calc_int.real_mul_lzero(),
          @calc_int.real_mul_rzero(),
          @realax.real_ge(),
          @realax.real_gt(),
        ]),
      ),
      t83,
    ),
    t84,
  )
  let pth_mul = @tactics.prove(
    @term_syntax.parse_term("((x : Real) == real_of_num(0) && (y : Real) == real_of_num(0) → x * y == real_of_num(0)) && (x == real_of_num(0) && y >= real_of_num(0) → x * y == real_of_num(0)) && (x == real_of_num(0) && y > real_of_num(0) → x * y == real_of_num(0)) && (x >= real_of_num(0) && y == real_of_num(0) → x * y == real_of_num(0)) && (x >= real_of_num(0) && y >= real_of_num(0) → x * y >= real_of_num(0)) && (x >= real_of_num(0) && y > real_of_num(0) → x * y >= real_of_num(0)) && (x > real_of_num(0) && y == real_of_num(0) → x * y == real_of_num(0)) && (x > real_of_num(0) && y >= real_of_num(0) → x * y >= real_of_num(0)) && (x > real_of_num(0) && y > real_of_num(0) → x * y > real_of_num(0))"),
    t85,
  )
  let t86 = @simp.simp_tac(@list.List([@calc_int.real_mul_rzero()]))
  let pth_emul = @tactics.prove(
    @term_syntax.parse_term("(y : Real) == real_of_num(0) → (∀ x : Real, x * y == real_of_num(0))"),
    t86,
  )
  let t87 = @simp.rewrite_tac(
    @list.List([@realax.real_ge(), real_pow_2(), real_le_square()]),
  )
  let pth_square = @tactics.prove(@term_syntax.parse_term("∀ x : Real, x * x >= real_of_num(0)"), t87)
  let match_mp_rule : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x88 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th = x88
    let net = @lib.itlist(
      fn(
        x90 : @kernel.Thm,
        x91 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
      ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        let th_1 = x90
        let t92 = @drule.part_match(@equal.lhand, th_1)
        let t93 = @equal.lhand(@kernel.concl(th_1))
        (fn(
          x95 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
        ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
          ((x94 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) => {
            @simp.net_of_conv(t93, t92, x94)
          })(x95)
        })(x91)
      },
      @bool.conjuncts_rule(th),
      @nets.empty_net(),
    )
    fn(x96 : @kernel.Thm) -> @kernel.Thm raise {
      let th_2 = x96
      let t97 = @kernel.concl(th_2)
      @bool.mp(@simp.rewrites_conv(net)(t97), th_2)
    }
  }
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let y_tm = @term_syntax.parse_term("(y : Real)")
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let gt_tm = @term_syntax.parse_term("real_gt")
  let ge_tm = @term_syntax.parse_term("real_ge")
  let eq_tm = @term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)")
  let p_tm = @term_syntax.parse_term("(p : Bool)")
  let or_tm = @term_syntax.parse_term("op_bslash_slash")
  let false_tm = @term_syntax.parse_term("false")
  let z_tm = @term_syntax.parse_term("real_of_num(0)")
  let xy_lt = @term_syntax.parse_term("(x : Real) < (y : Real)")
  let xy_nlt = @term_syntax.parse_term("!((x : Real) < (y : Real))")
  let xy_le = @term_syntax.parse_term("(x : Real) <= (y : Real)")
  let xy_nle = @term_syntax.parse_term("!((x : Real) <= (y : Real))")
  let xy_gt = @term_syntax.parse_term("(x : Real) > (y : Real)")
  let xy_ngt = @term_syntax.parse_term("!((x : Real) > (y : Real))")
  let xy_ge = @term_syntax.parse_term("(x : Real) >= (y : Real)")
  let xy_nge = @term_syntax.parse_term("!((x : Real) >= (y : Real))")
  let xy_eq = @term_syntax.parse_term("(x : Real) == (y : Real)")
  let xy_ne = @term_syntax.parse_term("!((x : Real) == (y : Real))")
  let is_ge : (@kernel.Term) -> Bool raise = fn(
    x99 : @kernel.Term,
  ) -> Bool raise {
    ((x98 : @kernel.Term) => @basics.is_binop(ge_tm, x98))(x99)
  }
  let is_gt : (@kernel.Term) -> Bool raise = fn(
    x101 : @kernel.Term,
  ) -> Bool raise {
    ((x100 : @kernel.Term) => @basics.is_binop(gt_tm, x100))(x101)
  }
  let is_req : (@kernel.Term) -> Bool raise = fn(
    x103 : @kernel.Term,
  ) -> Bool raise {
    ((x102 : @kernel.Term) => @basics.is_binop(eq_tm, x102))(x103)
  }
  gen_real_arith_v1_c.set(fn(
    x104 : (
      (@num.Num) -> @kernel.Term raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (
        (
          (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
      ) -> ((
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> @kernel.Thm raise) raise,
    ),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let (
      mk_numeric,
      numeric_eq_conv,
      numeric_ge_conv,
      numeric_gt_conv,
      poly_conv,
      poly_neg_conv,
      poly_add_conv,
      poly_mul_conv,
      absconv1,
      absconv2,
      prover,
    ) = x104
    let real_ineq_conv : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
      x106 : @kernel.Thm,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let pth_1 = x106
      fn(x107 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x107
        let (lop, r) = @kernel.dest_comb(tm)
        let th_3 = @kernel.inst_rule(
          @list.List([(@kernel.rand(lop), x_tm), (r, y_tm)]),
          pth_1,
        )
        let t108 = @kernel.rand(@kernel.concl(th_3))
        @kernel.trans(th_3, @equal.land_conv(poly_conv)(t108))
      }
    }
    match @lib.map(real_ineq_conv, @bool.conjuncts_rule(pth)) {
      More(
        real_lt_conv,
        tail=More(
          real_le_conv,
          tail=More(
            real_gt_conv,
            tail=More(
              real_ge_conv,
              tail=More(
                real_eq_conv,
                tail=More(
                  real_not_lt_conv,
                  tail=More(
                    real_not_le_conv,
                    tail=More(
                      real_not_gt_conv,
                      tail=More(real_not_ge_conv, tail=More(_, tail=Empty))
                    )
                  )
                )
              )
            )
          )
        )
      ) => {
        let pth_2 = @lib.last(@bool.conjuncts_rule(pth))
        let real_not_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
          x109 : @kernel.Term,
        ) -> @kernel.Thm raise {
          let tm_1 = x109
          let (l, r_1) = @kernel.dest_eq(tm_1)
          let th_4 = @kernel.inst_rule(
            @list.List([(l, x_tm), (r_1, y_tm)]),
            pth_2,
          )
          let th_p = poly_conv(
            @equal.lhand(@equal.lhand(@kernel.rand(@kernel.concl(th_4)))),
          )
          let th_x = @equal.ap_term(neg_tm, th_p)
          let th_n = @equal.conv_rule(@equal.rand_conv(poly_neg_conv), th_x)
          let t110 = @equal.ap_thm(@equal.ap_term(gt_tm, th_n), z_tm)
          let th_p_1 = @drule.mk_disj_rule(
            @equal.ap_thm(@equal.ap_term(gt_tm, th_p), z_tm),
            t110,
          )
          @kernel.trans(th_4, th_p_1)
        }
        let net_single = @lib.itlist(
          fn(
            x115 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
            x116 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
          ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
            let s117 = ((
              x114 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
            ) => {
              @lib.uncurry(
                fn(
                  x111 : @kernel.Term,
                  x112 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((
                  @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
                ) -> @nets.Net[
                  @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
                ] raise) raise {
                  fn(
                    x113 : @nets.Net[
                      @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
                    ],
                  ) -> @nets.Net[
                    @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
                  ] raise {
                    @simp.net_of_conv(x111, x112, x113)
                  }
                },
                x114,
              )
            })(x115)
            s117(x116)
          },
          @list.List([
            (xy_lt, real_lt_conv),
            (
              xy_nlt,
              fn(x118 : @kernel.Term) -> @kernel.Thm raise {
                let t = x118
                real_not_lt_conv(@kernel.rand(t))
              },
            ),
            (xy_le, real_le_conv),
            (
              xy_nle,
              fn(x119 : @kernel.Term) -> @kernel.Thm raise {
                let t_1 = x119
                real_not_le_conv(@kernel.rand(t_1))
              },
            ),
            (xy_gt, real_gt_conv),
            (
              xy_ngt,
              fn(x120 : @kernel.Term) -> @kernel.Thm raise {
                let t_2 = x120
                real_not_gt_conv(@kernel.rand(t_2))
              },
            ),
            (xy_ge, real_ge_conv),
            (
              xy_nge,
              fn(x121 : @kernel.Term) -> @kernel.Thm raise {
                let t_3 = x121
                real_not_ge_conv(@kernel.rand(t_3))
              },
            ),
            (xy_eq, real_eq_conv),
            (
              xy_ne,
              fn(x122 : @kernel.Term) -> @kernel.Thm raise {
                let t_4 = x122
                real_not_eq_conv(@kernel.rand(t_4))
              },
            ),
          ]),
          @nets.empty_net(),
        )
        let net_double = @lib.itlist(
          fn(
            x127 : (
              @kernel.Term,
              (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
            ),
            x128 : @nets.Net[
              @simp.GconvOf[(@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise],
            ],
          ) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise],
          ] raise {
            let s129 = ((
              x126 : (
                @kernel.Term,
                (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
              ),
            ) => {
              @lib.uncurry(
                fn(
                  x123 : @kernel.Term,
                  x124 : (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
                ) -> ((
                  @nets.Net[
                    @simp.GconvOf[
                      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
                    ],
                  ],
                ) -> @nets.Net[
                  @simp.GconvOf[
                    (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
                  ],
                ] raise) raise {
                  fn(
                    x125 : @nets.Net[
                      @simp.GconvOf[
                        (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
                      ],
                    ],
                  ) -> @nets.Net[
                    @simp.GconvOf[
                      (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise,
                    ],
                  ] raise {
                    @simp.net_of_conv(x123, x124, x125)
                  }
                },
                x126,
              )
            })(x127)
            s129(x128)
          },
          @list.List([
            (
              xy_lt,
              fn(x130 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
                let t_5 = x130
                let t131 = real_not_lt_conv(t_5)
                (real_lt_conv(t_5), t131)
              },
            ),
            (
              xy_le,
              fn(x132 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
                let t_6 = x132
                let t133 = real_not_le_conv(t_6)
                (real_le_conv(t_6), t133)
              },
            ),
            (
              xy_gt,
              fn(x134 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
                let t_7 = x134
                let t135 = real_not_gt_conv(t_7)
                (real_gt_conv(t_7), t135)
              },
            ),
            (
              xy_ge,
              fn(x136 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
                let t_8 = x136
                let t137 = real_not_ge_conv(t_8)
                (real_ge_conv(t_8), t137)
              },
            ),
            (
              xy_eq,
              fn(x138 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
                let t_9 = x138
                let t139 = real_not_eq_conv(t_9)
                (real_eq_conv(t_9), t139)
              },
            ),
          ]),
          @nets.empty_net(),
        )
        let real_ineq_norm_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrites_conv(
          net_single,
        )
        let real_ineq_norm_dconv : (@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise = @simp.rewrites_conv(
          net_double,
        )
        let nnf_norm_conv : (@kernel.Term) -> @kernel.Thm raise = @canon.gen_nnf_conv(
          false,
        )((real_ineq_norm_conv, real_ineq_norm_dconv))
        let rules : (@kernel.Thm) -> @kernel.Thm raise = match_mp_rule(pth_mul)
        let mul_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
          x140 : @kernel.Thm,
        ) -> @kernel.Thm raise {
          let th_5 = x140
          let t141 = rules(th_5)
          @equal.conv_rule(@equal.land_conv(poly_mul_conv), t141)
        }
        let rules_1 : (@kernel.Thm) -> @kernel.Thm raise = match_mp_rule(
          pth_add,
        )
        let add_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
          x142 : @kernel.Thm,
        ) -> @kernel.Thm raise {
          let th_6 = x142
          let t143 = rules_1(th_6)
          @equal.conv_rule(@equal.land_conv(poly_add_conv), t143)
        }
        let rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
          pth_emul,
        )
        let emul_rule : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
          x144 : @kernel.Term,
        ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          let tm_2 = x144
          fn(x145 : @kernel.Thm) -> @kernel.Thm raise {
            let th_7 = x145
            let t146 = @bool.spec(tm_2, rule(th_7))
            @equal.conv_rule(@equal.land_conv(poly_mul_conv), t146)
          }
        }
        let square_rule : (@kernel.Term) -> @kernel.Thm raise = fn(
          x147 : @kernel.Term,
        ) -> @kernel.Thm raise {
          let t_10 = x147
          let t148 = @bool.spec(t_10, pth_square)
          @equal.conv_rule(@equal.land_conv(poly_mul_conv), t148)
        }
        let hol_of_positivstellensatz : (
          (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise = fn(
          x149 : (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise {
          let (eqs, les, lts) = x149
          fn translate(x151 : Positivstellensatz) -> @kernel.Thm raise {
            let prf = x151
            match prf {
              Positivstellensatz::Axiom_eq(n) =>
                @lib.el(@lib.int63_to_int(n), eqs)
              Positivstellensatz::Axiom_le(n_1) =>
                @lib.el(@lib.int63_to_int(n_1), les)
              Positivstellensatz::Axiom_lt(n_2) =>
                @lib.el(@lib.int63_to_int(n_2), lts)
              Positivstellensatz::Rational_eq(x) =>
                @bool.eqt_elim(
                  numeric_eq_conv(
                    @kernel.mk_comb(@kernel.mk_comb(eq_tm, mk_numeric(x)), z_tm),
                  ),
                )
              Positivstellensatz::Rational_le(x_1) =>
                @bool.eqt_elim(
                  numeric_ge_conv(
                    @kernel.mk_comb(
                      @kernel.mk_comb(ge_tm, mk_numeric(x_1)),
                      z_tm,
                    ),
                  ),
                )
              Positivstellensatz::Rational_lt(x_2) =>
                @bool.eqt_elim(
                  numeric_gt_conv(
                    @kernel.mk_comb(
                      @kernel.mk_comb(gt_tm, mk_numeric(x_2)),
                      z_tm,
                    ),
                  ),
                )
              Positivstellensatz::Square(t_11) => square_rule(t_11)
              Positivstellensatz::Eqmul(t_12, p) => {
                let t152 = translate(p)
                emul_rule(t_12)(t152)
              }
              Positivstellensatz::Sum(p1, p2) => {
                let t153 = translate(p2)
                add_rule(@bool.conj(translate(p1), t153))
              }
              Positivstellensatz::Product(p1_1, p2_1) => {
                let t154 = translate(p2_1)
                mul_rule(@bool.conj(translate(p1_1), t154))
              }
            }
          }
          fn(x155 : Positivstellensatz) -> @kernel.Thm raise {
            let prf_1 = x155
            let t156 = translate(prf_1)
            @equal.conv_rule(
              @equal.first_conv(
                @list.List([numeric_ge_conv, numeric_gt_conv, numeric_eq_conv]),
              ),
              t156,
            )
          }
        }
        let t157 = @equal.depth_binop_conv(or_tm, @canon.conds_elim_conv)
        let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @equal.thenc(
                @equal.thenc(
                  @equal.thenc(
                    @equal.thenc(
                      @equal.top_depth_conv(@equal.beta_conv),
                      @canon.presimp_conv,
                    ),
                    @canon.nnf_conv,
                  ),
                  t157,
                ),
                nnf_norm_conv,
              ),
              @canon.skolem_conv,
            ),
            @canon.prenex_conv,
          ),
          @canon.weak_dnf_conv,
        )
        fn overall(
          x158 : @list.List[@kernel.Thm],
          x159 : @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise {
          let dun = x158
          let ths = x159
          match ths {
            Empty => {
              let (eq, ne) = @lib.partition(
                fn(x161 : @kernel.Thm) -> Bool raise {
                  is_req(
                    (fn(x160 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x160)
                    })(x161),
                  )
                },
                dun,
              )
              let (le, nl) = @lib.partition(
                fn(x163 : @kernel.Thm) -> Bool raise {
                  is_ge(
                    (fn(x162 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x162)
                    })(x163),
                  )
                },
                ne,
              )
              let lt = @lib.filter(
                fn(x165 : @kernel.Thm) -> Bool raise {
                  is_gt(
                    (fn(x164 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x164)
                    })(x165),
                  )
                },
                nl,
              )
              prover(hol_of_positivstellensatz)((eq, le, lt))
            }
            More(th_8, tail=oths) => {
              let tm_3 = @kernel.concl(th_8)
              if @basics.is_conj(tm_3) {
                let (th1, th2) = @bool.conj_pair(th_8)
                overall(dun, oths.prepend(th2).prepend(th1))
              } else if @basics.is_disj(tm_3) {
                let th1_1 = overall(
                  dun,
                  oths.prepend(@kernel.assume_rule(@equal.lhand(tm_3))),
                )
                let th2_1 = overall(
                  dun,
                  oths.prepend(@kernel.assume_rule(@kernel.rand(tm_3))),
                )
                @bool.disj_cases(th_8, th1_1, th2_1)
              } else {
                overall(dun.prepend(th_8), oths)
              }
            }
          }
        }
        fn(x166 : @kernel.Term) -> @kernel.Thm raise {
          let tm_4 = x166
          let t168 = (
            @equal.cache_conv(real_ineq_norm_conv),
            fn(x167 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
              let t_13 = x167
              raise Failure("")
            },
          )
          let nnf_norm_conv_p : (@kernel.Term) -> @kernel.Thm raise = @canon.gen_nnf_conv(
            false,
          )(t168)
          fn absremover(x169 : @kernel.Term) -> @kernel.Thm raise {
            let t_14 = x169
            let t170 = @equal.binop_conv(absremover)
            let t171 = @equal.try_conv(
              @equal.thenc(@equal.thenc(absconv2, nnf_norm_conv_p), t170),
            )
            @equal.thenc(
              @equal.top_depth_conv(
                @equal.thenc(
                  absconv1,
                  @equal.binop_conv(@equal.land_conv(poly_conv)),
                ),
              ),
              t171,
            )(t_14)
          }
          let th0 = init_conv(@bool.mk_neg(tm_4))
          let tm0 = @kernel.rand(@kernel.concl(th0))
          let th_9 = if tm0 == false_tm {
            @bool.eq_imp_rule(th0).0
          } else {
            let (evs, bod) = @basics.strip_exists(tm0)
            let (avs, ibod) = @basics.strip_forall(bod)
            let th1_2 = @lib.itlist(
              @drule.mk_forall_rule,
              avs,
              @equal.depth_binop_conv(or_tm, absremover)(ibod),
            )
            let th2_2 = overall(
              @list.List([]),
              @list.List([
                @bool.specl(
                  avs,
                  @kernel.assume_rule(@kernel.rand(@kernel.concl(th1_2))),
                ),
              ]),
            )
            let th3 = @lib.itlist(
              @bool.simple_choose,
              evs,
              @bool.prove_hyp(
                @kernel.eq_mp(th1_2, @kernel.assume_rule(bod)),
                th2_2,
              ),
            )
            @bool.disch_all(
              @bool.prove_hyp(
                @kernel.eq_mp(th0, @kernel.assume_rule(@bool.mk_neg(tm_4))),
                th3,
              ),
            )
          }
          @bool.mp(
            @kernel.inst_rule(@list.List([(tm_4, p_tm)]), pth_final),
            th_9,
          )
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:266")
    }
  })
}

///|
let gen_real_arith_v1_c : @lib.Cell[
  (
    (
      (@num.Num) -> @kernel.Term raise,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      (
        (
          (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
      ) -> ((
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> @kernel.Thm raise) raise,
    ),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("GEN_REAL_ARITH")

///|
/// `GEN_REAL_ARITH`
pub fn gen_real_arith_v1(
  x : (
    (@num.Num) -> @kernel.Term raise,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    (
      (
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
    ) -> ((
      (
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
      ),
    ) -> @kernel.Thm raise) raise,
  ),
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  gen_real_arith_v1_c.get()(x)
}

///|
/// REAL_LINEAR_PROVER
fn step_31() -> Unit raise {
  let linear_add : (@lib.Func[@kernel.Term, @num.Num]) -> ((
    @lib.Func[@kernel.Term, @num.Num],
  ) -> @lib.Func[@kernel.Term, @num.Num] raise) raise = fn(
    x177 : @lib.Func[@kernel.Term, @num.Num],
  ) -> ((@lib.Func[@kernel.Term, @num.Num]) -> @lib.Func[@kernel.Term, @num.Num] raise) raise {
    fn(
      x178 : @lib.Func[@kernel.Term, @num.Num],
    ) -> @lib.Func[@kernel.Term, @num.Num] raise {
      ((
        x175 : @lib.Func[@kernel.Term, @num.Num],
        x176 : @lib.Func[@kernel.Term, @num.Num],
      ) => {
        @lib.combine(
          fn(x172 : @num.Num, x173 : @num.Num) -> @num.Num raise {
            @num.add_num(x172, x173)
          },
          fn(x174 : @num.Num) -> Bool raise {
            let z = x174
            @num.eq_num(z, @num.num_0)
          },
          x175,
          x176,
        )
      })(x177, x178)
    }
  }
  let one_tm = @term_syntax.parse_term("real_of_num(1)")
  fn linear_ineqs(
    x185 : @list.List[@kernel.Term],
    x186 : (
      @list.List[(@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)],
      @list.List[(@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)],
    ),
  ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
    let vars = x185
    let (les, lts) = x186
    @lib.find(
      (x188 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)) => {
        ((x183, x184) => contradictory_l(one_tm, x183, x184))(
          fn(x187 : @num.Num) -> Bool raise {
            let x_1 = x187
            @num.gt_num(x_1, @num.num_0)
          },
          x188,
        )
      },
      lts,
    ) catch {
      Failure(_) =>
        @lib.find(
          (x190 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)) => {
            ((x183, x184) => contradictory_l(one_tm, x183, x184))(
              fn(x189 : @num.Num) -> Bool raise {
                let x_2 = x189
                @num.ge_num(x_2, @num.num_0)
              },
              x190,
            )
          },
          les,
        ) catch {
          Failure(_) =>
            if vars == @list.List([]) {
              raise Failure("linear_ineqs: no contradiction")
            } else {
              let ineqs = les.concat(lts)
              let blowup : (@kernel.Term) -> Int64 raise = fn(
                x191 : @kernel.Term,
              ) -> Int64 raise {
                let v = x191
                let t194 = Int::to_int64(
                  @lib.length(
                    @lib.filter(
                      fn(
                        x193 : (
                          @lib.Func[@kernel.Term, @num.Num],
                          Positivstellensatz,
                        ),
                      ) -> Bool raise {
                        let (e_2, _) = x193
                        @num.lt_num(
                          @lib.tryapplyd(e_2, v, @num.num_0),
                          @num.num_0,
                        )
                      },
                      ineqs,
                    ),
                  ),
                )
                @lib.mul63(
                  Int::to_int64(
                    @lib.length(
                      @lib.filter(
                        fn(
                          x192 : (
                            @lib.Func[@kernel.Term, @num.Num],
                            Positivstellensatz,
                          ),
                        ) -> Bool raise {
                          let (e_1, _) = x192
                          @num.gt_num(
                            @lib.tryapplyd(e_1, v, @num.num_0),
                            @num.num_0,
                          )
                        },
                        ineqs,
                      ),
                    ),
                  ),
                  t194,
                )
              }
              let v_2 = @lib.hd(
                  @lib.sort(
                    fn(
                      x195 : (@kernel.Term, Int64),
                      x196 : (@kernel.Term, Int64),
                    ) -> Bool raise {
                      let (_, i) = x195
                      let (_, j) = x196
                      i < j
                    },
                    @lib.map(
                      fn(x197 : @kernel.Term) -> (@kernel.Term, Int64) raise {
                        let v_1 = x197
                        (v_1, blowup(v_1))
                      },
                      vars,
                    ),
                  ),
                ).0
              let addup : (
                (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ) -> (((@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)) -> ((
                @list.List[
                  (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ],
              ) -> @list.List[
                (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ] raise) raise) raise = fn(
                x198 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ) -> (((@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)) -> ((
                @list.List[
                  (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ],
              ) -> @list.List[
                (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ] raise) raise) raise {
                let (e1, p1) = x198
                fn(
                  x199 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ) -> ((
                  @list.List[
                    (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  ],
                ) -> @list.List[
                  (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ] raise) raise {
                  let (e2, p2) = x199
                  fn(
                    x200 : @list.List[
                      (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                    ],
                  ) -> @list.List[
                    (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  ] raise {
                    let acc = x200
                    let c1 = @lib.tryapplyd(e1, v_2, @num.num_0)
                    let c2 = @lib.tryapplyd(e2, v_2, @num.num_0)
                    if @num.ge_num(@num.mult_num(c1, c2), @num.num_0) {
                      acc
                    } else {
                      let e1_p = linear_cmul_l(@num.abs_num(c2))(e1)
                      let e2_p = linear_cmul_l(@num.abs_num(c1))(e2)
                      let p1_p = Positivstellensatz::Product(
                        Positivstellensatz::Rational_lt(@num.abs_num(c2)),
                        p1,
                      )
                      let p2_p = Positivstellensatz::Product(
                        Positivstellensatz::Rational_lt(@num.abs_num(c1)),
                        p2,
                      )
                      let t201 = Positivstellensatz::Sum(p1_p, p2_p)
                      acc.prepend((linear_add(e1_p)(e2_p), t201))
                    }
                  }
                }
              }
              let (les0, les1) = @lib.partition(
                fn(
                  x202 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ) -> Bool raise {
                  let (e_3, _) = x202
                  @num.eq_num(@lib.tryapplyd(e_3, v_2, @num.num_0), @num.num_0)
                },
                les,
              )
              let (lts0, lts1) = @lib.partition(
                fn(
                  x203 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ) -> Bool raise {
                  let (e_4, _) = x203
                  @num.eq_num(@lib.tryapplyd(e_4, v_2, @num.num_0), @num.num_0)
                },
                lts,
              )
              let (lesp, lesn) = @lib.partition(
                fn(
                  x204 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ) -> Bool raise {
                  let (e_5, _) = x204
                  @num.gt_num(@lib.tryapplyd(e_5, v_2, @num.num_0), @num.num_0)
                },
                les1,
              )
              let (ltsp, ltsn) = @lib.partition(
                fn(
                  x205 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ) -> Bool raise {
                  let (e_6, _) = x205
                  @num.gt_num(@lib.tryapplyd(e_6, v_2, @num.num_0), @num.num_0)
                },
                lts1,
              )
              let les_p = @lib.itlist(
                fn(
                  x206 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  x207 : @list.List[
                    (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  ],
                ) -> @list.List[
                  (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ] raise {
                  let ep1 = x206
                  let t208 = addup(ep1)
                  ((
                    x212 : @list.List[
                      (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                    ],
                  ) => {
                    @lib.itlist(
                      fn(
                        x209 : (
                          @lib.Func[@kernel.Term, @num.Num],
                          Positivstellensatz,
                        ),
                        x210 : @list.List[
                          (
                            @lib.Func[@kernel.Term, @num.Num],
                            Positivstellensatz,
                          ),
                        ],
                      ) -> @list.List[
                        (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                      ] raise {
                        let s211 = t208(x209)
                        s211(x210)
                      },
                      lesp,
                      x212,
                    )
                  })(x207)
                },
                lesn,
                les0,
              )
              let lts_p = @lib.itlist(
                fn(
                  x213 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  x214 : @list.List[
                    (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  ],
                ) -> @list.List[
                  (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                ] raise {
                  let ep1_1 = x213
                  let t215 = addup(ep1_1)
                  ((
                    x219 : @list.List[
                      (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                    ],
                  ) => {
                    @lib.itlist(
                      fn(
                        x216 : (
                          @lib.Func[@kernel.Term, @num.Num],
                          Positivstellensatz,
                        ),
                        x217 : @list.List[
                          (
                            @lib.Func[@kernel.Term, @num.Num],
                            Positivstellensatz,
                          ),
                        ],
                      ) -> @list.List[
                        (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                      ] raise {
                        let s218 = t215(x216)
                        s218(x217)
                      },
                      lesp.concat(ltsp),
                      x219,
                    )
                  })(x214)
                },
                ltsn,
                @lib.itlist(
                  fn(
                    x220 : (
                      @lib.Func[@kernel.Term, @num.Num],
                      Positivstellensatz,
                    ),
                    x221 : @list.List[
                      (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                    ],
                  ) -> @list.List[
                    (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  ] raise {
                    let ep1_2 = x220
                    let t222 = addup(ep1_2)
                    ((
                      x226 : @list.List[
                        (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                      ],
                    ) => {
                      @lib.itlist(
                        fn(
                          x223 : (
                            @lib.Func[@kernel.Term, @num.Num],
                            Positivstellensatz,
                          ),
                          x224 : @list.List[
                            (
                              @lib.Func[@kernel.Term, @num.Num],
                              Positivstellensatz,
                            ),
                          ],
                        ) -> @list.List[
                          (
                            @lib.Func[@kernel.Term, @num.Num],
                            Positivstellensatz,
                          ),
                        ] raise {
                          let s225 = t222(x223)
                          s225(x224)
                        },
                        lesn.concat(ltsn),
                        x226,
                      )
                    })(x221)
                  },
                  ltsp,
                  lts0,
                ),
              )
              linear_ineqs(
                @lib.subtract(vars, @list.List([v_2])),
                (les_p, lts_p),
              )
            }
          e => raise e
        }
      e => raise e
    }
  }
  fn linear_eqs(
    x227 : @list.List[(@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)],
    x228 : @list.List[(@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)],
    x229 : @list.List[(@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)],
  ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
    let (eqs, les_1, lts_1) = (x227, x228, x229)
    @lib.find(
      (x231 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz)) => {
        ((x183, x184) => contradictory_l(one_tm, x183, x184))(
          fn(x230 : @num.Num) -> Bool raise {
            let x_3 = x230
            @num.eq_num(x_3, @num.num_0)
          },
          x231,
        )
      },
      eqs,
    ) catch {
      Failure(_) =>
        match eqs {
          Empty => {
            let vars_1 = @lib.subtract(
              @lib.itlist(
                fn(
                  x237 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
                  x238 : @list.List[@kernel.Term],
                ) -> @list.List[@kernel.Term] raise {
                  (fn(
                    x235 : @lib.Func[@kernel.Term, @num.Num],
                  ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
                    (fn(
                      x232 : @list.List[@kernel.Term],
                    ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
                      fn(
                        x233 : @list.List[@kernel.Term],
                      ) -> @list.List[@kernel.Term] raise {
                        @lib.union(x232, x233)
                      }
                    })(
                      (fn(
                        x234 : @lib.Func[@kernel.Term, @num.Num],
                      ) -> @list.List[@kernel.Term] raise {
                        @lib.dom(x234)
                      })(x235),
                    )
                  })(
                    (fn(
                      x236 : (
                        @lib.Func[@kernel.Term, @num.Num],
                        Positivstellensatz,
                      ),
                    ) -> @lib.Func[@kernel.Term, @num.Num] raise {
                      x236.0
                    })(x237),
                  )(x238)
                },
                les_1.concat(lts_1),
                @list.List([]),
              ),
              @list.List([one_tm]),
            )
            linear_ineqs(vars_1, (les_1, lts_1))
          }
          More((e_7, p_1), tail=es) =>
            if @lib.is_undefined(e_7) {
              linear_eqs(es, les_1, lts_1)
            } else {
              let (x_4, c_1) = @lib.choose(@lib.undefine(one_tm, e_7))
              let xform : (
                (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise = fn(
                x239 : (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz),
              ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
                let (t, q) as inp = x239
                let d = @lib.tryapplyd(t, x_4, @num.num_0)
                if @num.eq_num(d, @num.num_0) {
                  inp
                } else {
                  let t240 = @num.abs_num(c_1)
                  let k = @num.div_num(
                    @num.mult_num(@num.minus_num(d), t240),
                    c_1,
                  )
                  let e_p = linear_cmul_l(k)(e_7)
                  let t_p = linear_cmul_l(@num.abs_num(c_1))(t)
                  let p_p = Positivstellensatz::Eqmul(
                    @calc_int.term_of_rat(k),
                    p_1,
                  )
                  let q_p = Positivstellensatz::Product(
                    Positivstellensatz::Rational_lt(@num.abs_num(c_1)),
                    q,
                  )
                  let t241 = Positivstellensatz::Sum(p_p, q_p)
                  (linear_add(e_p)(t_p), t241)
                }
              }
              let t242 = @lib.map(xform, lts_1)
              let t243 = @lib.map(xform, les_1)
              linear_eqs(@lib.map(xform, es), t243, t242)
            }
        }
      e => raise e
    }
  }
  let linear_prover : (
    (
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
    ),
  ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise = fn(
    x244 : (
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
      @list.List[@lib.Func[@kernel.Term, @num.Num]],
    ),
  ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
    let (eq, le, lt) = x244
    let eqs_1 = @lib.map2(
      fn(
        x245 : @lib.Func[@kernel.Term, @num.Num],
        x246 : Int64,
      ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
        let p_2 = x245
        let n = x246
        (p_2, Positivstellensatz::Axiom_eq(n))
      },
      eq,
      @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(eq)), 1L)),
    )
    let les_2 = @lib.map2(
      fn(
        x247 : @lib.Func[@kernel.Term, @num.Num],
        x248 : Int64,
      ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
        let p_3 = x247
        let n_1 = x248
        (p_3, Positivstellensatz::Axiom_le(n_1))
      },
      le,
      @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(le)), 1L)),
    )
    let lts_2 = @lib.map2(
      fn(
        x249 : @lib.Func[@kernel.Term, @num.Num],
        x250 : Int64,
      ) -> (@lib.Func[@kernel.Term, @num.Num], Positivstellensatz) raise {
        let p_4 = x249
        let n_2 = x250
        (p_4, Positivstellensatz::Axiom_lt(n_2))
      },
      lt,
      @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(lt)), 1L)),
    )
    linear_eqs(eqs_1, les_2, lts_2)
  }
  let one_tm_1 = @term_syntax.parse_term("real_of_num(1)")
  let zero_tm = @term_syntax.parse_term("real_of_num(0)")
  let add_tm = @term_syntax.parse_term("real_add")
  let mul_tm = @term_syntax.parse_term("real_mul")
  fn lin_of_hol(
    x251 : @kernel.Term,
  ) -> @lib.Func[@kernel.Term, @num.Num] raise {
    let tm = x251
    if tm == zero_tm {
      @lib.undefined()
    } else if !@kernel.is_comb(tm) {
      @lib.single(tm, @num.num_of_int64(1L))
    } else if @calc_int.is_ratconst(tm) {
      @lib.single(one_tm_1, @calc_int.rat_of_term(tm))
    } else {
      let (lop, r) = @kernel.dest_comb(tm)
      if !@kernel.is_comb(lop) {
        @lib.single(tm, @num.num_of_int64(1L))
      } else {
        let (op, l) = @kernel.dest_comb(lop)
        if op == add_tm {
          let t252 = lin_of_hol(r)
          linear_add(lin_of_hol(l))(t252)
        } else if op == mul_tm && @calc_int.is_ratconst(l) {
          @lib.single(r, @calc_int.rat_of_term(l))
        } else {
          @lib.single(tm, @num.num_of_int64(1L))
        }
      }
    }
  }
  let lin_of_hol_1 : (@kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise = lin_of_hol
  let is_alien : (@kernel.Term) -> Bool raise = fn(
    x253 : @kernel.Term,
  ) -> Bool raise {
    let tm_1 = x253
    match tm_1 {
      @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n_3) if !@nums.is_numeral(
          n_3,
        ) => true
      _ => false
    }
  }
  let is_suc_alien : (@kernel.Term) -> Bool raise = fn(
    x254 : @kernel.Term,
  ) -> Bool raise {
    let tm_2 = x254
    match tm_2 {
      @kernel.Term::Comb(
        @kernel.Term::Const("real_of_num", _),
        @kernel.Term::Comb(@kernel.Term::Const("SUC", _), _)
      ) => true
      _ => false
    }
  }
  let dest_suc_alien : (@kernel.Term) -> @kernel.Term raise = fn(
    x255 : @kernel.Term,
  ) -> @kernel.Term raise {
    let tm_3 = x255
    match tm_3 {
      @kernel.Term::Comb(
        @kernel.Term::Const("real_of_num", _),
        @kernel.Term::Comb(@kernel.Term::Const("SUC", _), n_4)
      ) => n_4
      _ => raise Failure("")
    }
  }
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let t256 = @bool.spec(n_tm, real_pos())
  let pth = @simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_ge())]))(
    t256,
  )
  let t257 = @bool.spec(n_tm, real_pos_lt())
  let pth_suc = @simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_gt())]))(
    t257,
  )
  real_linear_prover_c.set(x258 => {
    let translator = x258
    (
      x259 : (
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
      ),
    ) => {
      let (eq_1, le_1, lt_1) = x259
      let eq_pols = @lib.map(
        fn(x262 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
          (fn(x260 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
            lin_of_hol_1(@equal.lhand(x260))
          })(
            (fn(x261 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x261)
            })(x262),
          )
        },
        eq_1,
      )
      let le_pols = @lib.map(
        fn(x265 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
          (fn(x263 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
            lin_of_hol_1(@equal.lhand(x263))
          })(
            (fn(x264 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x264)
            })(x265),
          )
        },
        le_1,
      )
      let lt_pols = @lib.map(
        fn(x268 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
          (fn(x266 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
            lin_of_hol_1(@equal.lhand(x266))
          })(
            (fn(x267 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x267)
            })(x268),
          )
        },
        lt_1,
      )
      let all_aliens = @lib.filter(
        is_alien,
        @lib.itlist(
          fn(
            x272 : @lib.Func[@kernel.Term, @num.Num],
            x273 : @list.List[@kernel.Term],
          ) -> @list.List[@kernel.Term] raise {
            (fn(
              x269 : @list.List[@kernel.Term],
            ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
              fn(
                x270 : @list.List[@kernel.Term],
              ) -> @list.List[@kernel.Term] raise {
                @lib.union(x269, x270)
              }
            })(
              (fn(
                x271 : @lib.Func[@kernel.Term, @num.Num],
              ) -> @list.List[@kernel.Term] raise {
                @lib.dom(x271)
              })(x272),
            )(x273)
          },
          eq_pols.concat(le_pols.concat(lt_pols)),
          @list.List([]),
        ),
      )
      let (suc_aliens, aliens) = @lib.partition(is_suc_alien, all_aliens)
      let le_pols_p = le_pols.concat(
        @lib.map(
          fn(x274 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
            let v_3 = x274
            @lib.single(v_3, @num.num_of_int64(1L))
          },
          aliens,
        ),
      )
      let lt_pols_p = lt_pols.concat(
        @lib.map(
          fn(x275 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
            let v_4 = x275
            @lib.single(v_4, @num.num_of_int64(1L))
          },
          suc_aliens,
        ),
      )
      let (_, proof) = linear_prover((eq_pols, le_pols_p, lt_pols_p))
      let le_p = le_1.concat(
        @lib.map(
          fn(x276 : @kernel.Term) -> @kernel.Thm raise {
            let a = x276
            @kernel.inst_rule(@list.List([(@kernel.rand(a), n_tm)]), pth)
          },
          aliens,
        ),
      )
      let lt_p = lt_1.concat(
        @lib.map(
          fn(x277 : @kernel.Term) -> @kernel.Thm raise {
            let a_1 = x277
            @kernel.inst_rule(
              @list.List([(dest_suc_alien(a_1), n_tm)]),
              pth_suc,
            )
          },
          suc_aliens,
        ),
      )
      translator((eq_1, le_p, lt_p))(proof)
    }
  })
}

///|
let real_linear_prover_c : @lib.Cell[
  (
    (
      (
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
      ),
    ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
  ) -> ((
    (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm]),
  ) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("REAL_LINEAR_PROVER")

///|
/// `REAL_LINEAR_PROVER`
pub fn real_linear_prover(
  x : (
    (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm]),
  ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
) -> ((
  (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm]),
) -> @kernel.Thm raise) raise {
  real_linear_prover_c.get()(x)
}

///|
fn[TB] linear_cmul_l(
  x179 : @num.Num,
) -> ((@lib.Func[TB, @num.Num]) -> @lib.Func[TB, @num.Num] raise) raise {
  let c = x179
  (x182 : @lib.Func[TB, @num.Num]) => {
    @lib.mapf(
      fn(x181 : @num.Num) -> @num.Num raise {
        let x = x181
        @num.mult_num(c, x)
      },
      x182,
    )
  }
}

///|
fn[TC] contradictory_l(
  one_tm : @kernel.Term,
  x183 : (@num.Num) -> Bool raise,
  x184 : (@lib.Func[@kernel.Term, @num.Num], TC),
) -> Bool raise {
  let p = x183
  let (e, _) = x184
  (@lib.is_undefined(e) && !p(@num.num_0)) ||
  (@lib.dom(e) == @list.List([one_tm]) && !p(@lib.apply(e, one_tm)))
}

///|
/// REAL_ARITH
fn step_32() -> Unit raise {
  let (
    real_poly_neg_conv,
    real_poly_add_conv,
    real_poly_sub_conv,
    real_poly_mul_conv,
    real_poly_pow_conv,
    real_poly_conv,
  ) = @normalizer.semiring_normalizers_conv(real_poly_clauses())(
    real_poly_neg_clauses(),
  )(
    (
      @calc_int.is_realintconst, @calc_int.real_int_add_conv, @calc_int.real_int_mul_conv,
      @calc_int.real_int_pow_conv,
    ),
  )(fn(x278 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x279 : @kernel.Term) -> Bool raise { @lib.compare(x278, x279) < 0 }
  })
  let rule : (@kernel.Term) -> @kernel.Thm raise = gen_real_arith_v1(
    (
      @calc_int.mk_realintconst, @calc_int.real_int_eq_conv, @calc_int.real_int_ge_conv,
      @calc_int.real_int_gt_conv, real_poly_conv, real_poly_neg_conv, real_poly_add_conv,
      real_poly_mul_conv, @equal.no_conv, @equal.no_conv, real_linear_prover,
    ),
  )
  let deabs_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(
    @list.List([@realax.real_abs(), @realax.real_max(), @realax.real_min()]),
  )
  real_arith_v1_c.set(fn(x280 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x280
    let th1 = deabs_conv(tm)
    let t281 = rule(@kernel.rand(@kernel.concl(th1)))
    @kernel.eq_mp(@equal.sym(th1), t281)
  })
}

///|
let real_arith_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_ARITH",
)

///|
/// `REAL_ARITH`
pub fn real_arith_v1(x : @kernel.Term) -> @kernel.Thm raise {
  real_arith_v1_c.get()(x)
}

///|
/// GEN_REAL_ARITH
fn step_33() -> Unit raise {
  let absmaxmin_elim_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x282 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x282
    },
    @list.List([
      @lib.time(
        real_arith_v1,
        @term_syntax.parse_term("(-real_of_num(1) * abs((x : Real)) >= (r : Real)) == (-real_of_num(1) * x >= r && real_of_num(1) * x >= r) && (-real_of_num(1) * abs(x) + (a : Real) >= r) == (a + -real_of_num(1) * x >= r && a + real_of_num(1) * x >= r) && (a + -real_of_num(1) * abs(x) >= r) == (a + -real_of_num(1) * x >= r && a + real_of_num(1) * x >= r) && (a + (-real_of_num(1) * abs(x) + (b : Real)) >= r) == (a + (-real_of_num(1) * x + b) >= r && a + (real_of_num(1) * x + b) >= r) && (a + (b + -real_of_num(1) * abs(x)) >= r) == (a + (b + -real_of_num(1) * x) >= r && a + (b + real_of_num(1) * x) >= r) && (a + (b + (-real_of_num(1) * abs(x) + (c : Real))) >= r) == (a + (b + (-real_of_num(1) * x + c)) >= r && a + (b + (real_of_num(1) * x + c)) >= r) && (-real_of_num(1) * max(x, (y : Real)) >= r) == (-real_of_num(1) * x >= r && -real_of_num(1) * y >= r) && (-real_of_num(1) * max(x, y) + a >= r) == (a + -real_of_num(1) * x >= r && a + -real_of_num(1) * y >= r) && (a + -real_of_num(1) * max(x, y) >= r) == (a + -real_of_num(1) * x >= r && a + -real_of_num(1) * y >= r) && (a + (-real_of_num(1) * max(x, y) + b) >= r) == (a + (-real_of_num(1) * x + b) >= r && a + (-real_of_num(1) * y + b) >= r) && (a + (b + -real_of_num(1) * max(x, y)) >= r) == (a + (b + -real_of_num(1) * x) >= r && a + (b + -real_of_num(1) * y) >= r) && (a + (b + (-real_of_num(1) * max(x, y) + c)) >= r) == (a + (b + (-real_of_num(1) * x + c)) >= r && a + (b + (-real_of_num(1) * y + c)) >= r) && (real_of_num(1) * min(x, y) >= r) == (real_of_num(1) * x >= r && real_of_num(1) * y >= r) && (real_of_num(1) * min(x, y) + a >= r) == (a + real_of_num(1) * x >= r && a + real_of_num(1) * y >= r) && (a + real_of_num(1) * min(x, y) >= r) == (a + real_of_num(1) * x >= r && a + real_of_num(1) * y >= r) && (a + (real_of_num(1) * min(x, y) + b) >= r) == (a + (real_of_num(1) * x + b) >= r && a + (real_of_num(1) * y + b) >= r) && (a + (b + real_of_num(1) * min(x, y)) >= r) == (a + (b + real_of_num(1) * x) >= r && a + (b + real_of_num(1) * y) >= r) && (a + (b + (real_of_num(1) * min(x, y) + c)) >= r) == (a + (b + (real_of_num(1) * x + c)) >= r && a + (b + (real_of_num(1) * y + c)) >= r) && (min(x, y) >= r) == (x >= r && y >= r) && (min(x, y) + a >= r) == (a + x >= r && a + y >= r) && (a + min(x, y) >= r) == (a + x >= r && a + y >= r) && (a + (min(x, y) + b) >= r) == (a + (x + b) >= r && a + (y + b) >= r) && (a + (b + min(x, y)) >= r) == (a + (b + x) >= r && a + (b + y) >= r) && (a + (b + (min(x, y) + c)) >= r) == (a + (b + (x + c)) >= r && a + (b + (y + c)) >= r) && (-real_of_num(1) * abs(x) > r) == (-real_of_num(1) * x > r && real_of_num(1) * x > r) && (-real_of_num(1) * abs(x) + a > r) == (a + -real_of_num(1) * x > r && a + real_of_num(1) * x > r) && (a + -real_of_num(1) * abs(x) > r) == (a + -real_of_num(1) * x > r && a + real_of_num(1) * x > r) && (a + (-real_of_num(1) * abs(x) + b) > r) == (a + (-real_of_num(1) * x + b) > r && a + (real_of_num(1) * x + b) > r) && (a + (b + -real_of_num(1) * abs(x)) > r) == (a + (b + -real_of_num(1) * x) > r && a + (b + real_of_num(1) * x) > r) && (a + (b + (-real_of_num(1) * abs(x) + c)) > r) == (a + (b + (-real_of_num(1) * x + c)) > r && a + (b + (real_of_num(1) * x + c)) > r) && (-real_of_num(1) * max(x, y) > r) == (-real_of_num(1) * x > r && -real_of_num(1) * y > r) && (-real_of_num(1) * max(x, y) + a > r) == (a + -real_of_num(1) * x > r && a + -real_of_num(1) * y > r) && (a + -real_of_num(1) * max(x, y) > r) == (a + -real_of_num(1) * x > r && a + -real_of_num(1) * y > r) && (a + (-real_of_num(1) * max(x, y) + b) > r) == (a + (-real_of_num(1) * x + b) > r && a + (-real_of_num(1) * y + b) > r) && (a + (b + -real_of_num(1) * max(x, y)) > r) == (a + (b + -real_of_num(1) * x) > r && a + (b + -real_of_num(1) * y) > r) && (a + (b + (-real_of_num(1) * max(x, y) + c)) > r) == (a + (b + (-real_of_num(1) * x + c)) > r && a + (b + (-real_of_num(1) * y + c)) > r) && (min(x, y) > r) == (x > r && y > r) && (min(x, y) + a > r) == (a + x > r && a + y > r) && (a + min(x, y) > r) == (a + x > r && a + y > r) && (a + (min(x, y) + b) > r) == (a + (x + b) > r && a + (y + b) > r) && (a + (b + min(x, y)) > r) == (a + (b + x) > r && a + (b + y) > r) && (a + (b + (min(x, y) + c)) > r) == (a + (b + (x + c)) > r && a + (b + (y + c)) > r)"),
      ),
    ]),
  )
  let t283 = @simp.asm_rewrite_tac(@list.List([@realax.real_lt()]))
  let t284 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@realax.real_abs(), @realax.real_gt(), @realax.real_ge()]),
      ),
      @class.cond_cases_tac,
    ),
    t283,
  )
  let pth_abs = @tactics.prove(
    @term_syntax.parse_term("(P : (Real) -> Bool)(abs((x : Real))) == (x >= real_of_num(0) && P(x) || real_of_num(0) > x && P(-x))"),
    t284,
  )
  let t285 = @simp.asm_rewrite_tac(@list.List([@realax.real_lt()]))
  let t286 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@realax.real_max(), @realax.real_gt(), @realax.real_ge()]),
      ),
      @class.cond_cases_tac,
    ),
    t285,
  )
  let pth_max = @tactics.prove(
    @term_syntax.parse_term("(P : (Real) -> Bool)(max((x : Real), (y : Real))) == (y >= x && P(y) || x > y && P(x))"),
    t286,
  )
  let t287 = @simp.asm_rewrite_tac(@list.List([@realax.real_lt()]))
  let t288 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@realax.real_min(), @realax.real_gt(), @realax.real_ge()]),
      ),
      @class.cond_cases_tac,
    ),
    t287,
  )
  let pth_min = @tactics.prove(
    @term_syntax.parse_term("(P : (Real) -> Bool)(min((x : Real), (y : Real))) == (y >= x && P(x) || x > y && P(y))"),
    t288,
  )
  let abs_tm = @term_syntax.parse_term("abs")
  let p_tm = @term_syntax.parse_term("(P : (Real) -> Bool)")
  let x_tm = @term_syntax.parse_term("(x : Real)")
  let y_tm = @term_syntax.parse_term("(y : Real)")
  let t289 = @term_syntax.parse_term("max")
  let is_max : (@kernel.Term) -> Bool raise = fn(
    x291 : @kernel.Term,
  ) -> Bool raise {
    ((x290 : @kernel.Term) => @basics.is_binop(t289, x290))(x291)
  }
  let t292 = @term_syntax.parse_term("min")
  let is_min : (@kernel.Term) -> Bool raise = fn(
    x294 : @kernel.Term,
  ) -> Bool raise {
    ((x293 : @kernel.Term) => @basics.is_binop(t292, x293))(x294)
  }
  let is_abs : (@kernel.Term) -> Bool raise = fn(
    x295 : @kernel.Term,
  ) -> Bool raise {
    let t = x295
    @kernel.is_comb(t) && @kernel.rator(t) == abs_tm
  }
  let eliminate_construct : ((@kernel.Term) -> Bool raise) -> ((
    (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(
    x296 : (@kernel.Term) -> Bool raise,
  ) -> (((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((
    @kernel.Term,
  ) -> @kernel.Thm raise) raise) raise {
    let p = x296
    fn(
      x297 : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let c = x297
      fn(x298 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x298
        let t_2 = @basics.find_term(
          fn(x299 : @kernel.Term) -> Bool raise {
            let t_1 = x299
            p(t_1) && @basics.free_in(t_1, tm)
          },
          tm,
        )
        let v = @basics.genvar(@kernel.type_of(t_2))
        let th0 = @equal.sym(
          @equal.beta_conv(
            @kernel.mk_comb(
              @kernel.mk_abs(v, @basics.subst(@list.List([(v, t_2)]), tm)),
              t_2,
            ),
          ),
        )
        let (p_1, ax) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th0)))
        let t300 = @kernel.trans(th0, c(p_1)(ax))
        @equal.conv_rule(
          @equal.rand_conv(
            @equal.binop_conv(@equal.rand_conv(@equal.beta_conv)),
          ),
          t300,
        )
      }
    }
  }
  let elim_abs : (@kernel.Term) -> @kernel.Thm raise = eliminate_construct(
    is_abs,
  )(fn(x301 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let p_2 = x301
    fn(x302 : @kernel.Term) -> @kernel.Thm raise {
      let ax_1 = x302
      @kernel.inst_rule(
        @list.List([(p_2, p_tm), (@kernel.rand(ax_1), x_tm)]),
        pth_abs,
      )
    }
  })
  let elim_max : (@kernel.Term) -> @kernel.Thm raise = eliminate_construct(
    is_max,
  )(fn(x303 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let p_3 = x303
    fn(x304 : @kernel.Term) -> @kernel.Thm raise {
      let ax_2 = x304
      let (ax_3, y) = @kernel.dest_comb(ax_2)
      @kernel.inst_rule(
        @list.List([(p_3, p_tm), (@kernel.rand(ax_3), x_tm), (y, y_tm)]),
        pth_max,
      )
    }
  })
  let elim_min : (@kernel.Term) -> @kernel.Thm raise = eliminate_construct(
    is_min,
  )(fn(x305 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let p_4 = x305
    fn(x306 : @kernel.Term) -> @kernel.Thm raise {
      let ax_4 = x306
      let (ax_5, y_1) = @kernel.dest_comb(ax_4)
      @kernel.inst_rule(
        @list.List([(p_4, p_tm), (@kernel.rand(ax_5), x_tm), (y_1, y_tm)]),
        pth_min,
      )
    }
  })
  let absmaxmin_elim_conv2 : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
    @list.List([elim_abs, elim_max, elim_min]),
  )
  gen_real_arith_c.set(fn(
    x307 : (
      (@num.Num) -> @kernel.Term raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (
        (
          (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
      ) -> ((
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> @kernel.Thm raise) raise,
    ),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let (mkconst, eq, ge, gt, norm, neg, add, mul, prover) = x307
    gen_real_arith_v1(
      (
        mkconst, eq, ge, gt, norm, neg, add, mul, absmaxmin_elim_conv1, absmaxmin_elim_conv2,
        prover,
      ),
    )
  })
}

///|
let gen_real_arith_c : @lib.Cell[
  (
    (
      (@num.Num) -> @kernel.Term raise,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      @equal.Conv,
      (
        (
          (
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
            @list.List[@kernel.Thm],
          ),
        ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
      ) -> ((
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> @kernel.Thm raise) raise,
    ),
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("GEN_REAL_ARITH")

///|
/// `GEN_REAL_ARITH`
pub fn gen_real_arith(
  x : (
    (@num.Num) -> @kernel.Term raise,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    @equal.Conv,
    (
      (
        (
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
          @list.List[@kernel.Thm],
        ),
      ) -> ((Positivstellensatz) -> @kernel.Thm raise) raise,
    ) -> ((
      (
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
      ),
    ) -> @kernel.Thm raise) raise,
  ),
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  gen_real_arith_c.get()(x)
}

///|
/// REAL_ARITH
fn step_34() -> Unit raise {
  let (
    real_poly_neg_conv,
    real_poly_add_conv,
    real_poly_sub_conv,
    real_poly_mul_conv,
    real_poly_pow_conv,
    real_poly_conv,
  ) = @normalizer.semiring_normalizers_conv(real_poly_clauses())(
    real_poly_neg_clauses(),
  )(
    (
      @calc_int.is_realintconst, @calc_int.real_int_add_conv, @calc_int.real_int_mul_conv,
      @calc_int.real_int_pow_conv,
    ),
  )(fn(x309 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x310 : @kernel.Term) -> Bool raise { @lib.compare(x309, x310) < 0 }
  })
  real_arith_c.set(
    gen_real_arith(
      (
        @calc_int.mk_realintconst, @calc_int.real_int_eq_conv, @calc_int.real_int_ge_conv,
        @calc_int.real_int_gt_conv, real_poly_conv, real_poly_neg_conv, real_poly_add_conv,
        real_poly_mul_conv, real_linear_prover,
      ),
    ),
  )
}

///|
let real_arith_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_ARITH",
)

///|
/// `REAL_ARITH`
pub fn real_arith(x : @kernel.Term) -> @kernel.Thm raise {
  real_arith_c.get()(x)
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
}
