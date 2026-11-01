// Translated from upstream calc_int.ml; edit this file directly.

///|
/// `is_realintconst`
pub fn is_realintconst(x1 : @kernel.Term) -> Bool raise {
  let tm = x1
  match tm {
    @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n) =>
      @nums.is_numeral(n)
    @kernel.Term::Comb(
      @kernel.Term::Const("real_neg", _),
      @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n_1)
    ) =>
      @nums.is_numeral(n_1) &&
      !@num.eq_num(@basics.dest_numeral(n_1), @num.num_0)
    _ => false
  }
}

///|
/// `dest_realintconst`
pub fn dest_realintconst(x2 : @kernel.Term) -> @num.Num raise {
  let tm = x2
  match tm {
    @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n) =>
      @basics.dest_numeral(n)
    @kernel.Term::Comb(
      @kernel.Term::Const("real_neg", _),
      @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n_1)
    ) => {
      let nn = @basics.dest_numeral(n_1)
      if @num.neq_num(nn, @num.num_0) {
        @num.minus_num(@basics.dest_numeral(n_1))
      } else {
        raise Failure("dest_realintconst")
      }
    }
    _ => raise Failure("dest_realintconst")
  }
}

///|
/// mk_realintconst
fn step_1() -> Unit raise {
  let cast_tm = @term_syntax.parse_term("real_of_num")
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let mk_numconst : (@num.Num) -> @kernel.Term raise = fn(
    x3 : @num.Num,
  ) -> @kernel.Term raise {
    let n = x3
    @kernel.mk_comb(cast_tm, @nums.mk_numeral(n))
  }
  mk_realintconst_c.set(fn(x4 : @num.Num) -> @kernel.Term raise {
    let x = x4
    if @num.lt_num(x, @num.num_0) {
      @kernel.mk_comb(neg_tm, mk_numconst(@num.minus_num(x)))
    } else {
      mk_numconst(x)
    }
  })
}

///|
let mk_realintconst_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_realintconst",
)

///|
/// `mk_realintconst`
pub fn mk_realintconst(x : @num.Num) -> @kernel.Term raise {
  mk_realintconst_c.get()(x)
}

///|
/// `is_ratconst`
pub fn is_ratconst(x5 : @kernel.Term) -> Bool raise {
  let tm = x5
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("real_div", _), p),
      q
    ) =>
      is_realintconst(p) &&
      (if is_realintconst(q) {
        let m = dest_realintconst(p)
        let n = dest_realintconst(q)
        @num.gt_num(n, @num.num_1) &&
        @num.eq_num(@num.gcd_num(m, n), @num.num_1)
      } else {
        false
      })
    _ => is_realintconst(tm)
  }
}

///|
/// `rat_of_term`
pub fn rat_of_term(x6 : @kernel.Term) -> @num.Num raise {
  let tm = x6
  match tm {
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("real_div", _), p),
      q
    ) => {
      let m = dest_realintconst(p)
      let n = dest_realintconst(q)
      if @num.gt_num(n, @num.num_1) &&
        @num.eq_num(@num.gcd_num(m, n), @num.num_1) {
        @num.div_num(m, n)
      } else {
        raise Failure("rat_of_term")
      }
    }
    _ => dest_realintconst(tm)
  }
}

///|
/// term_of_rat
fn step_2() -> Unit raise {
  let div_tm = @term_syntax.parse_term("op_slash")
  term_of_rat_c.set(fn(x7 : @num.Num) -> @kernel.Term raise {
    let x = x7
    let (p, q) = @num.numdom(x)
    let ptm = mk_realintconst(p)
    if @num.eq_num(q, @num.num_1) {
      ptm
    } else {
      let t8 = mk_realintconst(q)
      @kernel.mk_comb(@kernel.mk_comb(div_tm, ptm), t8)
    }
  })
}

///|
let term_of_rat_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new(
  "term_of_rat",
)

///|
/// `term_of_rat`
pub fn term_of_rat(x : @num.Num) -> @kernel.Term raise {
  term_of_rat_c.get()(x)
}

///|
/// REAL_ADD_AC
fn step_3() -> Unit raise {
  let t9 = @meson.meson_tac(
    @list.List([@realax.real_add_assoc(), @realax.real_add_sym()]),
  )
  real_add_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(m : Real) + (n : Real) == n + m && m + n + (p : Real) == m + (n + p) && m + (n + p) == n + (m + p)"),
      t9,
    ),
  )
}

///|
let real_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_AC")

///|
/// `REAL_ADD_AC`
pub fn real_add_ac() -> @kernel.Thm {
  real_add_ac_c.get()
}

///|
/// REAL_ADD_RINV
fn step_4() -> Unit raise {
  let t10 = @meson.meson_tac(
    @list.List([@realax.real_add_sym(), @realax.real_add_linv()]),
  )
  real_add_rinv_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, x + -x == real_of_num(0)"), t10),
  )
}

///|
let real_add_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_RINV")

///|
/// `REAL_ADD_RINV`
pub fn real_add_rinv() -> @kernel.Thm {
  real_add_rinv_c.get()
}

///|
/// REAL_EQ_ADD_LCANCEL
fn step_5() -> Unit raise {
  let t19 = @simp.rewrite_tac(
    @list.List([
      @realax.real_add_assoc(),
      @realax.real_add_linv(),
      @realax.real_add_lid(),
    ]),
  )
  let t15 = @term_syntax.parse_term("op_plus(-(x : Real))")
  let t18 = @tactics.pop_assum(fn(
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
  })
  let t11 = @simp.asm_rewrite_tac(@list.List([]))
  let t20 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          @tactics.disch_tac,
        ),
        t11,
      ),
      t18,
    ),
    t19,
  )
  real_eq_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y == x + z) == (y == z)"),
      t20,
    ),
  )
}

///|
let real_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_ADD_LCANCEL",
)

///|
/// `REAL_EQ_ADD_LCANCEL`
pub fn real_eq_add_lcancel() -> @kernel.Thm {
  real_eq_add_lcancel_c.get()
}

///|
/// REAL_EQ_ADD_RCANCEL
fn step_6() -> Unit raise {
  let t21 = @meson.meson_tac(
    @list.List([@realax.real_add_sym(), real_eq_add_lcancel()]),
  )
  real_eq_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, (x + z == y + z) == (x == y)"),
      t21,
    ),
  )
}

///|
let real_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_EQ_ADD_RCANCEL",
)

///|
/// `REAL_EQ_ADD_RCANCEL`
pub fn real_eq_add_rcancel() -> @kernel.Thm {
  real_eq_add_rcancel_c.get()
}

///|
/// REAL_MUL_RZERO
fn step_7() -> Unit raise {
  let t22 = @meson.meson_tac(
    @list.List([
      real_eq_add_rcancel(),
      @realax.real_add_ldistrib(),
      @realax.real_add_lid(),
    ]),
  )
  real_mul_rzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, x * real_of_num(0) == real_of_num(0)"), t22),
  )
}

///|
let real_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RZERO")

///|
/// `REAL_MUL_RZERO`
pub fn real_mul_rzero() -> @kernel.Thm {
  real_mul_rzero_c.get()
}

///|
/// REAL_MUL_LZERO
fn step_8() -> Unit raise {
  let t23 = @meson.meson_tac(
    @list.List([@realax.real_mul_sym(), real_mul_rzero()]),
  )
  real_mul_lzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) * x == real_of_num(0)"), t23),
  )
}

///|
let real_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_LZERO")

///|
/// `REAL_MUL_LZERO`
pub fn real_mul_lzero() -> @kernel.Thm {
  real_mul_lzero_c.get()
}

///|
/// REAL_NEG_NEG
fn step_9() -> Unit raise {
  let t24 = @meson.meson_tac(
    @list.List([
      real_eq_add_rcancel(),
      @realax.real_add_linv(),
      @realax.real_add_sym(),
      @realax.real_add_linv(),
    ]),
  )
  real_neg_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, --x == x"), t24))
}

///|
let real_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_NEG")

///|
/// `REAL_NEG_NEG`
pub fn real_neg_neg() -> @kernel.Thm {
  real_neg_neg_c.get()
}

///|
/// REAL_MUL_RNEG
fn step_10() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([
      real_eq_add_rcancel(),
      @realax.real_add_ldistrib(),
      @realax.real_add_linv(),
      real_mul_rzero(),
    ]),
  )
  real_mul_rneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x * -y == -(x * y)"), t25),
  )
}

///|
let real_mul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_RNEG")

///|
/// `REAL_MUL_RNEG`
pub fn real_mul_rneg() -> @kernel.Thm {
  real_mul_rneg_c.get()
}

///|
/// REAL_MUL_LNEG
fn step_11() -> Unit raise {
  let t26 = @meson.meson_tac(
    @list.List([@realax.real_mul_sym(), real_mul_rneg()]),
  )
  real_mul_lneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x * y == -(x * y)"), t26),
  )
}

///|
let real_mul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_LNEG")

///|
/// `REAL_MUL_LNEG`
pub fn real_mul_lneg() -> @kernel.Thm {
  real_mul_lneg_c.get()
}

///|
/// REAL_NEG_ADD
fn step_12() -> Unit raise {
  let t32 = @simp.rewrite_tac(
    @list.List([@realax.real_add_linv(), @realax.real_add_lid()]),
  )
  let t30 = @term_syntax.parse_term("(a : Real) + (b : Real) + ((c : Real) + (d : Real)) == a + c + (b + d)")
  let t31 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(real_add_ac())(t30)]),
  )
  let t29 = @simp.rewrite_tac(@list.List([@realax.real_add_linv()]))
  let t28 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) + (y : Real)"))
  let t27 = @tactics.match_mp_tac(
    @bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(real_eq_add_rcancel())).0),
  )
  let t33 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t27),
          t28,
        ),
        t29,
      ),
      t31,
    ),
    t32,
  )
  real_neg_add_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -(x + y) == -x + -y"), t33),
  )
}

///|
let real_neg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_ADD")

///|
/// `REAL_NEG_ADD`
pub fn real_neg_add() -> @kernel.Thm {
  real_neg_add_c.get()
}

///|
/// REAL_ADD_RID
fn step_13() -> Unit raise {
  let t34 = @meson.meson_tac(
    @list.List([@realax.real_add_sym(), @realax.real_add_lid()]),
  )
  real_add_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, x + real_of_num(0) == x"), t34))
}

///|
let real_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_RID")

///|
/// `REAL_ADD_RID`
pub fn real_add_rid() -> @kernel.Thm {
  real_add_rid_c.get()
}

///|
/// REAL_NEG_0
fn step_14() -> Unit raise {
  let t35 = @meson.meson_tac(
    @list.List([@realax.real_add_linv(), real_add_rid()]),
  )
  real_neg_0_c.set(@tactics.prove(@term_syntax.parse_term("-real_of_num(0) == real_of_num(0)"), t35))
}

///|
let real_neg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NEG_0")

///|
/// `REAL_NEG_0`
pub fn real_neg_0() -> @kernel.Thm {
  real_neg_0_c.get()
}

///|
/// REAL_LE_LNEG
fn step_15() -> Unit raise {
  let t55 = @simp.rewrite_tac(
    @list.List([
      @realax.real_add_linv(),
      @realax.real_add_assoc(),
      @realax.real_add_lid(),
      @simp.once_rewrite_rule(@list.List([@realax.real_add_sym()]))(
        @realax.real_add_lid(),
      ),
    ]),
  )
  let t52 = @term_syntax.parse_term("-(x : Real)")
  let t56 = @tactics.then_tac(
    @tactics.disch_then(fn(
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
      })(((x53 : @kernel.Thm) => @bool.spec(t52, x53))(x54))
    }),
    t55,
  )
  let t48 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@realax.real_add_sym()]))(
        @realax.real_add_linv(),
      ),
    ]),
  )
  let t45 = @term_syntax.parse_term("(x : Real)")
  let t57 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x47 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x42 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s43 = @tactics.mp_tac(x42)
          fn(
            x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s43(x44)
          }
        })(((x46 : @kernel.Thm) => @bool.spec(t45, x46))(x47))
      }),
      t48,
    ),
    t56,
  ])
  let t39 = @drule.match_mp(@realax.real_le_ladd_imp())
  let t41 = @tactics.disch_then(fn(
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
    (fn(
      x36 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s37 = @tactics.mp_tac(x36)
      fn(
        x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s37(x38)
      }
    })(t39(x40))
  })
  let t58 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t41,
    ),
    t57,
  )
  real_le_lneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x <= y) == (real_of_num(0) <= x + y)"), t58),
  )
}

///|
let real_le_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_LNEG")

///|
/// `REAL_LE_LNEG`
pub fn real_le_lneg() -> @kernel.Thm {
  real_le_lneg_c.get()
}

///|
/// REAL_LE_NEG2
fn step_16() -> Unit raise {
  let t68 = @tactics.match_accept_tac(@realax.real_add_sym())
  let t67 = @simp.rewrite_tac(@list.List([real_le_lneg()]))
  let t66 = @simp.gen_rewrite_tac(
    fn(
      x65 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x59 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s60 = @equal.rand_conv(x59)
        fn(x61 : @kernel.Term) -> @kernel.Thm raise { s60(x61) }
      })(
        (fn(
          x62 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s63 = @equal.land_conv(x62)
          fn(x64 : @kernel.Term) -> @kernel.Thm raise { s63(x64) }
        })(x65),
      )
    },
    @list.List([@equal.gsym(real_neg_neg())]),
  )
  let t69 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t66),
        t67,
      ),
      @tactics.ap_term_tac,
    ),
    t68,
  )
  real_le_neg2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (-x <= -y) == (y <= x)"), t69),
  )
}

///|
let real_le_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_NEG2")

///|
/// `REAL_LE_NEG2`
pub fn real_le_neg2() -> @kernel.Thm {
  real_le_neg2_c.get()
}

///|
/// REAL_LE_RNEG
fn step_17() -> Unit raise {
  let t85 = @tactics.match_accept_tac(@realax.real_add_sym())
  let t84 = @simp.rewrite_tac(@list.List([real_neg_add(), real_neg_neg()]))
  let t83 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_linv())]),
  )
  let t82 = @simp.gen_rewrite_tac(
    fn(
      x79 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s80 = @equal.rand_conv(x79)
      fn(x81 : @kernel.Term) -> @kernel.Thm raise { s80(x81) }
    },
    @list.List([@equal.gsym(real_le_neg2())]),
  )
  let t78 = @simp.rewrite_tac(
    @list.List([real_le_lneg(), @equal.gsym(real_neg_add())]),
  )
  let t77 = @simp.gen_rewrite_tac(
    fn(
      x76 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x70 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s71 = @equal.land_conv(x70)
        fn(x72 : @kernel.Term) -> @kernel.Thm raise { s71(x72) }
      })(
        (fn(
          x73 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s74 = @equal.land_conv(x73)
          fn(x75 : @kernel.Term) -> @kernel.Thm raise { s74(x75) }
        })(x76),
      )
    },
    @list.List([@equal.gsym(real_neg_neg())]),
  )
  let t86 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t77),
                t78,
              ),
              t82,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t83,
      ),
      t84,
    ),
    t85,
  )
  real_le_rneg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= -y) == (x + y <= real_of_num(0))"), t86),
  )
}

///|
let real_le_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_RNEG")

///|
/// `REAL_LE_RNEG`
pub fn real_le_rneg() -> @kernel.Thm {
  real_le_rneg_c.get()
}

///|
/// REAL_OF_NUM_POW
fn step_18() -> Unit raise {
  let t87 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @arith.exp(), @realax.real_of_num_mul()]),
  )
  let t88 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t87,
  )
  real_of_num_pow_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : Num, pow(real_of_num(x), n) == real_of_num(EXP(x, n))"), t88),
  )
}

///|
let real_of_num_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_POW",
)

///|
/// `REAL_OF_NUM_POW`
pub fn real_of_num_pow() -> @kernel.Thm {
  real_of_num_pow_c.get()
}

///|
/// REAL_POW_NEG
fn step_19() -> Unit raise {
  let t91 = @simp.asm_rewrite_tac(
    @list.List([real_mul_rneg(), real_mul_lneg(), real_neg_neg()]),
  )
  let t90 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t89 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_pow(), @arith.even()]),
  )
  let t92 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
        t89,
      ),
      t90,
    ),
    t91,
  )
  real_pow_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Num, pow(-x, n) == (if EVEN(n) { pow(x, n) } else { -pow(x, n) })"),
      t92,
    ),
  )
}

///|
let real_pow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_NEG")

///|
/// `REAL_POW_NEG`
pub fn real_pow_neg() -> @kernel.Thm {
  real_pow_neg_c.get()
}

///|
/// REAL_ABS_NUM
fn step_20() -> Unit raise {
  let t93 = @simp.rewrite_tac(
    @list.List([@realax.real_abs(), @realax.real_of_num_le(), @arith.le_0()]),
  )
  real_abs_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, abs(real_of_num(n)) == real_of_num(n)"), t93),
  )
}

///|
let real_abs_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_NUM")

///|
/// `REAL_ABS_NUM`
pub fn real_abs_num() -> @kernel.Thm {
  real_abs_num_c.get()
}

///|
/// REAL_ABS_NEG
fn step_21() -> Unit raise {
  let t94 = @meson.meson_tac(
    @list.List([
      @realax.real_le_total(),
      @realax.real_le_antisym(),
      real_neg_0(),
    ]),
  )
  let t95 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @realax.real_abs(),
        real_le_rneg(),
        real_neg_neg(),
        @realax.real_add_lid(),
      ]),
    ),
    t94,
  )
  real_abs_neg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(-x) == abs(x)"), t95),
  )
}

///|
let real_abs_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_NEG")

///|
/// `REAL_ABS_NEG`
pub fn real_abs_neg() -> @kernel.Thm {
  real_abs_neg_c.get()
}

///|
let real_int_le_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_LE_CONV",
)

///|
/// `REAL_INT_LE_CONV`
pub fn real_int_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_le_conv_c.get()(x)
}

///|
let real_int_lt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_LT_CONV",
)

///|
/// `REAL_INT_LT_CONV`
pub fn real_int_lt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_lt_conv_c.get()(x)
}

///|
let real_int_ge_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_GE_CONV",
)

///|
/// `REAL_INT_GE_CONV`
pub fn real_int_ge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_ge_conv_c.get()(x)
}

///|
let real_int_gt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_GT_CONV",
)

///|
/// `REAL_INT_GT_CONV`
pub fn real_int_gt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_gt_conv_c.get()(x)
}

///|
let real_int_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_EQ_CONV",
)

///|
/// `REAL_INT_EQ_CONV`
pub fn real_int_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_eq_conv_c.get()(x)
}

///|
/// REAL_INT_LE_CONV, REAL_INT_LT_CONV, REAL_INT_GE_CONV, REAL_INT_GT_CONV, REAL_INT_EQ_CONV
fn step_22() -> Unit raise {
  let tth = @class.taut(
    @term_syntax.parse_term("(false && false) == false && (false && true) == false && (true && false) == false && (true && true) == true"),
  )
  let nth = @class.taut(@term_syntax.parse_term("!true == false && !false == true"))
  let t97 = @simp.gen_rewrite_conv(
    fn(
      x96 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x96
    },
    @list.List([tth]),
  )
  let num2_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.binop_conv(@calc_num.num_eq_conv),
    t97,
  )
  let t99 = @simp.gen_rewrite_conv(
    fn(
      x98 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x98
    },
    @list.List([nth]),
  )
  let num2_ne_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.rand_conv(num2_eq_conv),
    t99,
  )
  let t103 = @simp.rewrite_tac(@list.List([@arith.le(), @arith.add_eq_0()]))
  let t102 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_add(),
      @realax.real_of_num_le(),
      @arith.le_0(),
    ]),
  )
  let t101 = @simp.rewrite_tac(@list.List([real_le_lneg(), real_le_rneg()]))
  let t104 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([real_le_neg2()])), t101),
      t102,
    ),
    t103,
  )
  let t105 = (
    @term_syntax.parse_term("(-real_of_num((m : Num)) <= real_of_num((n : Num))) == true && (real_of_num(m) <= real_of_num(n)) == (m <= n) && (-real_of_num(m) <= -real_of_num(n)) == (n <= m) && (real_of_num(m) <= -real_of_num(n)) == (m == 0 && n == 0)"),
    t104,
  )
  let (
    real_int_le_conv_1,
    real_int_lt_conv_1,
    real_int_ge_conv_1,
    real_int_gt_conv_1,
    real_int_eq_conv_1,
  ) = match
    @bool.conjuncts_rule(
      (fn(
        x100 : (
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
        @tactics.prove(x100.0, x100.1)
      })(t105),
    ) {
    More(
      pth_le1,
      tail=More(pth_le2a, tail=More(pth_le2b, tail=More(pth_le3, tail=Empty)))
    ) => {
      let t109 = @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x108 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x108
          },
          @list.List([pth_le3]),
        ),
        num2_eq_conv,
      )
      let t110 = @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x107 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x107
          },
          @list.List([pth_le2a, pth_le2b]),
        ),
        @calc_num.num_le_conv,
      )
      let real_int_le_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
        @list.List([
          @simp.gen_rewrite_conv(
            fn(
              x106 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x106
            },
            @list.List([pth_le1]),
          ),
          t110,
          t109,
        ]),
      )
      let t112 = @tactics.conv_tac(@class.taut)
      let t113 = @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            pth_le1,
            pth_le2a,
            pth_le2b,
            pth_le3,
            @equal.gsym(@arith.not_le()),
            @realax.real_lt(),
          ]),
        ),
        t112,
      )
      let t114 = (
        @term_syntax.parse_term("(real_of_num((m : Num)) < -real_of_num((n : Num))) == false && (real_of_num(m) < real_of_num(n)) == (m < n) && (-real_of_num(m) < -real_of_num(n)) == (n < m) && (-real_of_num(m) < real_of_num(n)) == !(m == 0 && n == 0)"),
        t113,
      )
      match
        @bool.conjuncts_rule(
          (fn(
            x111 : (
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
            @tactics.prove(x111.0, x111.1)
          })(t114),
        ) {
        More(
          pth_lt1,
          tail=More(
            pth_lt2a,
            tail=More(pth_lt2b, tail=More(pth_lt3, tail=Empty))
          )
        ) => {
          let t118 = @equal.thenc(
            @simp.gen_rewrite_conv(
              fn(
                x117 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x117
              },
              @list.List([pth_lt3]),
            ),
            num2_ne_conv,
          )
          let t119 = @equal.thenc(
            @simp.gen_rewrite_conv(
              fn(
                x116 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x116
              },
              @list.List([pth_lt2a, pth_lt2b]),
            ),
            @calc_num.num_lt_conv,
          )
          let real_int_lt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
            @list.List([
              @simp.gen_rewrite_conv(
                fn(
                  x115 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  x115
                },
                @list.List([pth_lt1]),
              ),
              t119,
              t118,
            ]),
          )
          let t121 = @tactics.conv_tac(@class.taut)
          let t122 = @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                pth_le1,
                pth_le2a,
                pth_le2b,
                pth_le3,
                @realax.real_ge(),
              ]),
            ),
            t121,
          )
          let t123 = (
            @term_syntax.parse_term("(real_of_num((m : Num)) >= -real_of_num((n : Num))) == true && (real_of_num(m) >= real_of_num(n)) == (n <= m) && (-real_of_num(m) >= -real_of_num(n)) == (m <= n) && (-real_of_num(m) >= real_of_num(n)) == (m == 0 && n == 0)"),
            t122,
          )
          match
            @bool.conjuncts_rule(
              (fn(
                x120 : (
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
                  ) raise,
                ),
              ) -> @kernel.Thm raise {
                @tactics.prove(x120.0, x120.1)
              })(t123),
            ) {
            More(
              pth_ge1,
              tail=More(
                pth_ge2a,
                tail=More(pth_ge2b, tail=More(pth_ge3, tail=Empty))
              )
            ) => {
              let t127 = @equal.thenc(
                @simp.gen_rewrite_conv(
                  fn(
                    x126 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x126
                  },
                  @list.List([pth_ge3]),
                ),
                num2_eq_conv,
              )
              let t128 = @equal.thenc(
                @simp.gen_rewrite_conv(
                  fn(
                    x125 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x125
                  },
                  @list.List([pth_ge2a, pth_ge2b]),
                ),
                @calc_num.num_le_conv,
              )
              let real_int_ge_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                @list.List([
                  @simp.gen_rewrite_conv(
                    fn(
                      x124 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      x124
                    },
                    @list.List([pth_ge1]),
                  ),
                  t128,
                  t127,
                ]),
              )
              let t130 = @tactics.conv_tac(@class.taut)
              let t131 = @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    pth_lt1,
                    pth_lt2a,
                    pth_lt2b,
                    pth_lt3,
                    @realax.real_gt(),
                  ]),
                ),
                t130,
              )
              let t132 = (
                @term_syntax.parse_term("(-real_of_num((m : Num)) > real_of_num((n : Num))) == false && (real_of_num(m) > real_of_num(n)) == (n < m) && (-real_of_num(m) > -real_of_num(n)) == (m < n) && (real_of_num(m) > -real_of_num(n)) == !(m == 0 && n == 0)"),
                t131,
              )
              match
                @bool.conjuncts_rule(
                  (fn(
                    x129 : (
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
                      ) raise,
                    ),
                  ) -> @kernel.Thm raise {
                    @tactics.prove(x129.0, x129.1)
                  })(t132),
                ) {
                More(
                  pth_gt1,
                  tail=More(
                    pth_gt2a,
                    tail=More(pth_gt2b, tail=More(pth_gt3, tail=Empty))
                  )
                ) => {
                  let t136 = @equal.thenc(
                    @simp.gen_rewrite_conv(
                      fn(
                        x135 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x135
                      },
                      @list.List([pth_gt3]),
                    ),
                    num2_ne_conv,
                  )
                  let t137 = @equal.thenc(
                    @simp.gen_rewrite_conv(
                      fn(
                        x134 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x134
                      },
                      @list.List([pth_gt2a, pth_gt2b]),
                    ),
                    @calc_num.num_lt_conv,
                  )
                  let real_int_gt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                    @list.List([
                      @simp.gen_rewrite_conv(
                        fn(
                          x133 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          x133
                        },
                        @list.List([pth_gt1]),
                      ),
                      t137,
                      t136,
                    ]),
                  )
                  let t141 = @tactics.conv_tac(@class.taut)
                  let t140 = @simp.rewrite_tac(
                    @list.List([
                      pth_le1,
                      pth_le2a,
                      pth_le2b,
                      pth_le3,
                      @arith.le(),
                      @arith.le_0(),
                    ]),
                  )
                  let t139 = @equal.gsym(@arith.le_antisym())
                  let t142 = @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([
                          @equal.gsym(@realax.real_le_antisym()),
                          t139,
                        ]),
                      ),
                      t140,
                    ),
                    t141,
                  )
                  let t143 = (
                    @term_syntax.parse_term("(real_of_num((m : Num)) == real_of_num((n : Num))) == (m == n) && (-real_of_num(m) == -real_of_num(n)) == (m == n) && (-real_of_num(m) == real_of_num(n)) == (m == 0 && n == 0) && (real_of_num(m) == -real_of_num(n)) == (m == 0 && n == 0)"),
                    t142,
                  )
                  match
                    @bool.conjuncts_rule(
                      (fn(
                        x138 : (
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
                          ) raise,
                        ),
                      ) -> @kernel.Thm raise {
                        @tactics.prove(x138.0, x138.1)
                      })(t143),
                    ) {
                    More(
                      pth_eq1a,
                      tail=More(
                        pth_eq1b,
                        tail=More(pth_eq2a, tail=More(pth_eq2b, tail=Empty))
                      )
                    ) => {
                      let t146 = @equal.thenc(
                        @simp.gen_rewrite_conv(
                          fn(
                            x145 : (@kernel.Term) -> @kernel.Thm raise,
                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            x145
                          },
                          @list.List([pth_eq2a, pth_eq2b]),
                        ),
                        num2_eq_conv,
                      )
                      let real_int_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                        @list.List([
                          @equal.thenc(
                            @simp.gen_rewrite_conv(
                              fn(
                                x144 : (@kernel.Term) -> @kernel.Thm raise,
                              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                x144
                              },
                              @list.List([pth_eq1a, pth_eq1b]),
                            ),
                            @calc_num.num_eq_conv,
                          ),
                          t146,
                        ]),
                      )
                      (
                        real_int_le_conv, real_int_lt_conv, real_int_ge_conv, real_int_gt_conv,
                        real_int_eq_conv,
                      )
                    }
                    _ => raise @lib.MatchFailure("tscript.ml:234")
                  }
                }
                _ => raise @lib.MatchFailure("tscript.ml:223")
              }
            }
            _ => raise @lib.MatchFailure("tscript.ml:212")
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:200")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:187")
  }
  real_int_le_conv_c.set(real_int_le_conv_1)
  real_int_lt_conv_c.set(real_int_lt_conv_1)
  real_int_ge_conv_c.set(real_int_ge_conv_1)
  real_int_gt_conv_c.set(real_int_gt_conv_1)
  real_int_eq_conv_c.set(real_int_eq_conv_1)
}

///|
/// REAL_INT_NEG_CONV
fn step_23() -> Unit raise {
  let t147 = @simp.rewrite_tac(@list.List([real_neg_neg(), real_neg_0()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("-real_of_num(0) == real_of_num(0) && --real_of_num((x : Num)) == real_of_num(x)"),
    t147,
  )
  real_int_neg_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x148 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x148
      },
      @list.List([pth]),
    ),
  )
}

///|
let real_int_neg_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_NEG_CONV",
)

///|
/// `REAL_INT_NEG_CONV`
pub fn real_int_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_neg_conv_c.get()(x)
}

///|
/// REAL_INT_MUL_CONV
fn step_24() -> Unit raise {
  let t149 = @simp.rewrite_tac(@list.List([real_mul_lzero(), real_mul_rzero()]))
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) * real_of_num((x : Num)) == real_of_num(0) && real_of_num(0) * -real_of_num(x) == real_of_num(0) && real_of_num(x) * real_of_num(0) == real_of_num(0) && -real_of_num(x) * real_of_num(0) == real_of_num(0)"),
    t149,
  )
  let t151 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul()]))
  let t152 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([real_mul_lneg(), real_mul_rneg(), real_neg_neg()]),
    ),
    t151,
  )
  let t153 = (
    @term_syntax.parse_term("(real_of_num((m : Num)) * real_of_num((n : Num)) == real_of_num(m * n) && -real_of_num(m) * -real_of_num(n) == real_of_num(m * n)) && -real_of_num(m) * real_of_num(n) == -real_of_num(m * n) && real_of_num(m) * -real_of_num(n) == -real_of_num(m * n)"),
    t152,
  )
  let (pth1, pth2) = @bool.conj_pair(
    (fn(
      x150 : (
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
      @tactics.prove(x150.0, x150.1)
    })(t153),
  )
  let t158 = @equal.rand_conv(@equal.rand_conv(@calc_num.num_mult_conv))
  let t159 = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x157 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x157
      },
      @list.List([pth2]),
    ),
    t158,
  )
  let t156 = @equal.rand_conv(@calc_num.num_mult_conv)
  let t160 = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x155 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x155
      },
      @list.List([pth1]),
    ),
    t156,
  )
  real_int_mul_conv_c.set(
    @equal.first_conv(
      @list.List([
        @simp.gen_rewrite_conv(
          fn(
            x154 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x154
          },
          @list.List([pth0]),
        ),
        t160,
        t159,
      ]),
    ),
  )
}

///|
let real_int_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_MUL_CONV",
)

///|
/// `REAL_INT_MUL_CONV`
pub fn real_int_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_mul_conv_c.get()(x)
}

///|
/// REAL_INT_ADD_CONV
fn step_25() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let amp_tm = @term_syntax.parse_term("real_of_num")
  let add_tm = @term_syntax.parse_term("real_add")
  let t161 = @term_syntax.parse_term("real_add")
  let dest : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x162 : @kernel.Term,
  ) => @basics.dest_binop(t161, x162)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let t163 = @simp.rewrite_tac(
    @list.List([@realax.real_add_linv(), real_add_rinv()]),
  )
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("-real_of_num((m : Num)) + real_of_num(m) == real_of_num(0) && real_of_num(m) + -real_of_num(m) == real_of_num(0)"),
    t163,
  )
  let t169 = @simp.rewrite_tac(
    @list.List([real_add_rinv(), @realax.real_add_lid()]),
  )
  let t168 = @simp.rewrite_tac(
    @list.List([
      @realax.real_add_assoc(),
      @realax.real_add_linv(),
      @realax.real_add_lid(),
    ]),
  )
  let t167 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t166 = @simp.rewrite_tac(
    @list.List([real_add_rinv(), @realax.real_add_lid()]),
  )
  let t165 = @simp.rewrite_tac(
    @list.List([
      @realax.real_add_assoc(),
      @realax.real_add_linv(),
      @realax.real_add_lid(),
    ]),
  )
  let t170 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @equal.gsym(@realax.real_of_num_add()),
                real_neg_add(),
              ]),
            ),
            t165,
          ),
          t166,
        ),
        t167,
      ),
      t168,
    ),
    t169,
  )
  let t171 = (
    @term_syntax.parse_term("-real_of_num((m : Num)) + -real_of_num((n : Num)) == -real_of_num(m + n) && -real_of_num(m) + real_of_num(m + n) == real_of_num(n) && -real_of_num(m + n) + real_of_num(m) == -real_of_num(n) && real_of_num(m + n) + -real_of_num(m) == real_of_num(n) && real_of_num(m) + -real_of_num(m + n) == -real_of_num(n) && real_of_num(m) + real_of_num(n) == real_of_num(m + n)"),
    t170,
  )
  real_int_add_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x164 : (
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
          @tactics.prove(x164.0, x164.1)
        })(t171),
      ) {
      More(
        pth1,
        tail=More(
          pth2,
          tail=More(
            pth3,
            tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=Empty)))
          )
        )
      ) =>
        @equal.orelsec(
          @simp.gen_rewrite_conv(
            fn(
              x172 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x172
            },
            @list.List([pth0]),
          ),
          fn(x173 : @kernel.Term) -> @kernel.Thm raise {
            let tm = x173
            try {
              let (l, r) = dest(tm)
              if !is_realintconst(l) || !is_realintconst(r) {
                raise Failure("")
              } else if @kernel.rator(l) == neg_tm {
                if @kernel.rator(r) == neg_tm {
                  let t174 = (@kernel.rand(@kernel.rand(r)), n_tm)
                  let th1 = @kernel.inst_rule(
                    @list.List([(@kernel.rand(@kernel.rand(l)), m_tm), t174]),
                    pth1,
                  )
                  let tm1 = @kernel.rand(
                    @kernel.rand(@kernel.rand(@kernel.concl(th1))),
                  )
                  let th2 = @equal.ap_term(
                    neg_tm,
                    @equal.ap_term(amp_tm, @calc_num.num_add_conv(tm1)),
                  )
                  @kernel.trans(th1, th2)
                } else {
                  let m = @kernel.rand(@kernel.rand(l))
                  let n = @kernel.rand(r)
                  let m_p = @basics.dest_numeral(m)
                  let n_p = @basics.dest_numeral(n)
                  if @num.le_num(m_p, n_p) {
                    let p = @nums.mk_numeral(@num.sub_num(n_p, m_p))
                    let th1_1 = @kernel.inst_rule(
                      @list.List([(m, m_tm), (p, n_tm)]),
                      pth2,
                    )
                    let th2_1 = @calc_num.num_add_conv(
                      @kernel.rand(
                        @kernel.rand(@equal.lhand(@kernel.concl(th1_1))),
                      ),
                    )
                    let t175 = @equal.ap_term(amp_tm, @equal.sym(th2_1))
                    let th3 = @equal.ap_term(@kernel.rator(tm), t175)
                    @kernel.trans(th3, th1_1)
                  } else {
                    let p_1 = @nums.mk_numeral(@num.sub_num(m_p, n_p))
                    let th1_2 = @kernel.inst_rule(
                      @list.List([(n, m_tm), (p_1, n_tm)]),
                      pth3,
                    )
                    let th2_2 = @calc_num.num_add_conv(
                      @kernel.rand(
                        @kernel.rand(
                          @equal.lhand(@equal.lhand(@kernel.concl(th1_2))),
                        ),
                      ),
                    )
                    let th3_1 = @equal.ap_term(
                      neg_tm,
                      @equal.ap_term(amp_tm, @equal.sym(th2_2)),
                    )
                    let t176 = @kernel.rand(tm)
                    let th4 = @equal.ap_thm(@equal.ap_term(add_tm, th3_1), t176)
                    @kernel.trans(th4, th1_2)
                  }
                }
              } else if @kernel.rator(r) == neg_tm {
                let m_1 = @kernel.rand(l)
                let n_1 = @kernel.rand(@kernel.rand(r))
                let m_p_1 = @basics.dest_numeral(m_1)
                let n_p_1 = @basics.dest_numeral(n_1)
                if @num.le_num(n_p_1, m_p_1) {
                  let p_2 = @nums.mk_numeral(@num.sub_num(m_p_1, n_p_1))
                  let th1_3 = @kernel.inst_rule(
                    @list.List([(n_1, m_tm), (p_2, n_tm)]),
                    pth4,
                  )
                  let th2_3 = @calc_num.num_add_conv(
                    @kernel.rand(
                      @equal.lhand(@equal.lhand(@kernel.concl(th1_3))),
                    ),
                  )
                  let th3_2 = @equal.ap_term(
                    add_tm,
                    @equal.ap_term(amp_tm, @equal.sym(th2_3)),
                  )
                  let th4_1 = @equal.ap_thm(th3_2, @kernel.rand(tm))
                  @kernel.trans(th4_1, th1_3)
                } else {
                  let p_3 = @nums.mk_numeral(@num.sub_num(n_p_1, m_p_1))
                  let th1_4 = @kernel.inst_rule(
                    @list.List([(m_1, m_tm), (p_3, n_tm)]),
                    pth5,
                  )
                  let th2_4 = @calc_num.num_add_conv(
                    @kernel.rand(
                      @kernel.rand(
                        @kernel.rand(@equal.lhand(@kernel.concl(th1_4))),
                      ),
                    ),
                  )
                  let th3_3 = @equal.ap_term(
                    neg_tm,
                    @equal.ap_term(amp_tm, @equal.sym(th2_4)),
                  )
                  let th4_2 = @equal.ap_term(@kernel.rator(tm), th3_3)
                  @kernel.trans(th4_2, th1_4)
                }
              } else {
                let t177 = (@kernel.rand(r), n_tm)
                let th1_5 = @kernel.inst_rule(
                  @list.List([(@kernel.rand(l), m_tm), t177]),
                  pth6,
                )
                let tm1_1 = @kernel.rand(@kernel.rand(@kernel.concl(th1_5)))
                let th2_5 = @equal.ap_term(
                  amp_tm,
                  @calc_num.num_add_conv(tm1_1),
                )
                @kernel.trans(th1_5, th2_5)
              }
            } catch {
              Failure(_) => raise Failure("REAL_INT_ADD_CONV")
              e => raise e
            }
          },
        )
      _ => raise @lib.MatchFailure("tscript.ml:284")
    },
  )
}

///|
let real_int_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_ADD_CONV",
)

///|
/// `REAL_INT_ADD_CONV`
pub fn real_int_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_add_conv_c.get()(x)
}

///|
/// REAL_INT_SUB_CONV
fn step_26() -> Unit raise {
  let t179 = @equal.try_conv(@equal.rand_conv(real_int_neg_conv))
  real_int_sub_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x178 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x178
          },
          @list.List([@realax.real_sub()]),
        ),
        t179,
      ),
      real_int_add_conv,
    ),
  )
}

///|
let real_int_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_SUB_CONV",
)

///|
/// `REAL_INT_SUB_CONV`
pub fn real_int_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_sub_conv_c.get()(x)
}

///|
/// REAL_INT_POW_CONV
fn step_27() -> Unit raise {
  let t181 = @simp.rewrite_tac(@list.List([real_of_num_pow(), real_pow_neg()]))
  let t182 = (
    @term_syntax.parse_term("pow(real_of_num((x : Num)), (n : Num)) == real_of_num(EXP(x, n)) && pow(-real_of_num(x), n) == (if EVEN(n) { real_of_num(EXP(x, n)) } else { -real_of_num(EXP(x, n)) })"),
    t181,
  )
  let (pth1, pth2) = @bool.conj_pair(
    (fn(
      x180 : (
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
      @tactics.prove(x180.0, x180.1)
    })(t182),
  )
  let t183 = @simp.rewrite_tac(@list.List([]))
  let tth = @tactics.prove(
    @term_syntax.parse_term("(if true { (x : Real) } else { (y : Real) }) == x && (if false { x } else { y }) == y"),
    t183,
  )
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let t189 = @simp.gen_rewrite_conv(
    fn(
      x188 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x188
    },
    @list.List([tth]),
  )
  let t187 = @equal.rator_conv(
    @equal.rator_conv(@equal.rand_conv(@calc_num.num_even_conv)),
  )
  let t191 = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x186 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x186
          },
          @list.List([pth2]),
        ),
        t187,
      ),
      t189,
    ),
    fn(x190 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x190
      if @kernel.rator(tm) == neg_tm {
        @equal.rand_conv(@equal.rand_conv(@calc_num.num_exp_conv))(tm)
      } else {
        @equal.rand_conv(@calc_num.num_exp_conv)(tm)
      }
    },
  )
  let t185 = @equal.rand_conv(@calc_num.num_exp_conv)
  real_int_pow_conv_c.set(
    @equal.orelsec(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x184 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x184
          },
          @list.List([pth1]),
        ),
        t185,
      ),
      t191,
    ),
  )
}

///|
let real_int_pow_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_POW_CONV",
)

///|
/// `REAL_INT_POW_CONV`
pub fn real_int_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_pow_conv_c.get()(x)
}

///|
/// REAL_INT_ABS_CONV
fn step_28() -> Unit raise {
  let t192 = @simp.rewrite_tac(@list.List([real_abs_neg(), real_abs_num()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("abs(-real_of_num((x : Num))) == real_of_num(x) && abs(real_of_num(x)) == real_of_num(x)"),
    t192,
  )
  real_int_abs_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x193 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x193
      },
      @list.List([pth]),
    ),
  )
}

///|
let real_int_abs_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_ABS_CONV",
)

///|
/// `REAL_INT_ABS_CONV`
pub fn real_int_abs_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_abs_conv_c.get()(x)
}

///|
/// real_int_red_conv_list
fn step_29() -> Unit raise {
  let t195 = (@term_syntax.parse_term("pow((x : Real), (n : Num))"), real_int_pow_conv)
  let t196 = (@term_syntax.parse_term("(x : Real) * (y : Real)"), real_int_mul_conv)
  let t197 = (@term_syntax.parse_term("(x : Real) - (y : Real)"), real_int_sub_conv)
  let t198 = (@term_syntax.parse_term("(x : Real) + (y : Real)"), real_int_add_conv)
  let t199 = (@term_syntax.parse_term("abs((x : Real))"), real_int_abs_conv)
  let t194 = @equal.changed_conv(real_int_neg_conv)
  let t200 = (@term_syntax.parse_term("-(x : Real)"), t194)
  let t201 = (@term_syntax.parse_term("(x : Real) == (y : Real)"), real_int_eq_conv)
  let t202 = (@term_syntax.parse_term("(x : Real) > (y : Real)"), real_int_gt_conv)
  let t203 = (@term_syntax.parse_term("(x : Real) >= (y : Real)"), real_int_ge_conv)
  let t204 = (@term_syntax.parse_term("(x : Real) < (y : Real)"), real_int_lt_conv)
  real_int_red_conv_list_c.set(
    @list.List([
      (@term_syntax.parse_term("(x : Real) <= (y : Real)"), real_int_le_conv),
      t204,
      t203,
      t202,
      t201,
      t200,
      t199,
      t198,
      t197,
      t196,
      t195,
    ]),
  )
}

///|
let real_int_red_conv_list_c : @lib.Cell[
  @list.List[(@kernel.Term, @equal.Conv)],
] = @lib.Cell::new("real_int_red_conv_list")

///|
/// `real_int_red_conv_list`
pub fn real_int_red_conv_list() -> @list.List[(@kernel.Term, @equal.Conv)] {
  real_int_red_conv_list_c.get()
}

///|
/// REAL_INT_RED_CONV
fn step_30() -> Unit raise {
  let gconv_net = @lib.itlist(
    fn(
      x209 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x210 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s211 = ((x208 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x205 : @kernel.Term,
            x206 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x207 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x205, x206, x207)
            }
          },
          x208,
        )
      })(x209)
      s211(x210)
    },
    real_int_red_conv_list(),
    @simp.basic_net(),
  )
  real_int_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let real_int_red_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_INT_RED_CONV",
)

///|
/// `REAL_INT_RED_CONV`
pub fn real_int_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_red_conv_c.get()(x)
}

///|
/// REAL_INT_REDUCE_CONV
fn step_31() -> Unit raise {
  real_int_reduce_conv_c.set(@equal.depth_conv(real_int_red_conv))
}

///|
let real_int_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_REDUCE_CONV",
)

///|
/// `REAL_INT_REDUCE_CONV`
pub fn real_int_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_reduce_conv_c.get()(x)
}

///|
/// real_int_compute_add_convs
fn step_32() -> Unit raise {
  let convlist = @lib.map(
    fn(
      x212 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
    ) -> (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise) raise {
      let (pat, the_conv) = x212
      let (c, args) = @basics.strip_comb(pat)
      (c, Int::to_int64(@lib.length(args)), the_conv)
    },
    real_int_red_conv_list(),
  )
  real_int_compute_add_convs_c.set(fn(x213 : @compute.Compset) -> Unit raise {
    let _ as compset = x213
    @lib.itlist(
      fn(
        x214 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
        x215 : Unit,
      ) -> Unit raise {
        let newc = x214
        let _ = x215
        @compute.add_conv(newc, compset)
      },
      convlist,
      (),
    )
  })
}

///|
let real_int_compute_add_convs_c : @lib.Cell[(@compute.Compset) -> Unit raise] = @lib.Cell::new(
  "real_int_compute_add_convs",
)

///|
/// `real_int_compute_add_convs`
pub fn real_int_compute_add_convs(x : @compute.Compset) -> Unit raise {
  real_int_compute_add_convs_c.get()(x)
}

///|
/// REAL_INT_COMPUTE_CONV
fn step_33() -> Unit raise {
  let cs = @compute.bool_compset(())
  let t216 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), t216)
  real_int_compute_add_convs(cs)
  real_int_compute_conv_c.set(@compute.weak_cbv_conv(cs))
}

///|
let real_int_compute_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_INT_COMPUTE_CONV",
)

///|
/// `REAL_INT_COMPUTE_CONV`
pub fn real_int_compute_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_compute_conv_c.get()(x)
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
}
