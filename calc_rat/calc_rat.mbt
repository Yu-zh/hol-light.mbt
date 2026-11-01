// Translated from upstream calc_rat.ml; edit this file directly.

///|
/// DECIMAL
fn step_1() -> Unit raise {
  decimal_c.set(
    @pair.new_definition(@term_syntax.parse_term("(DECIMAL : (Num, Num) -> Real)((x : Num), (y : Num)) == real_of_num(x) / real_of_num(y)")),
  )
}

///|
let decimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DECIMAL")

///|
/// `DECIMAL`
pub fn decimal() -> @kernel.Thm {
  decimal_c.get()
}

///|
/// RAT_LEMMA1
fn step_2() -> Unit raise {
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t12 = @tactics.match_mp_tac(@real.real_mul_rinv())
  let t11 = @tactics.conv_tac(@equal.sym_conv)
  let t10 = @simp.rewrite_tac(@list.List([@real.real_eq_mul_lcancel()]))
  let t9 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t8 = @simp.gen_rewrite_tac(
    fn(
      x5 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s6 = @equal.land_conv(x5)
      fn(x7 : @kernel.Term) -> @kernel.Thm raise { s6(x7) }
    },
    @list.List([@equal.gsym(@realarith.real_mul_rid())]),
  )
  let t3 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
      @tactics.ap_thm_tac,
    ),
    @tactics.ap_term_tac,
  )
  let t1 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * a * c")
  let t2 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t1)]),
  )
  let t4 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())])),
        @tactics.ap_term_tac,
      ),
      t2,
    ),
    t3,
  ])
  let t14 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.strip_tac,
                      @simp.rewrite_tac(
                        @list.List([
                          @realax.real_div(),
                          @real.real_add_rdistrib(),
                        ]),
                      ),
                    ),
                    @tactics.binop_tac,
                  ),
                  t4,
                ),
                t8,
              ),
              t9,
            ),
            t10,
          ),
          @tactics.disj2_tac,
        ),
        t11,
      ),
      t12,
    ),
    t13,
  )
  rat_lemma1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("!((y1 : Real) == real_of_num(0)) && !((y2 : Real) == real_of_num(0)) → (x1 : Real) / y1 + (x2 : Real) / y2 == (x1 * y2 + x2 * y1) * (inv(y1) * inv(y2))"),
      t14,
    ),
  )
}

///|
let rat_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA1")

///|
/// `RAT_LEMMA1`
pub fn rat_lemma1() -> @kernel.Thm {
  rat_lemma1_c.get()
}

///|
/// RAT_LEMMA2
fn step_3() -> Unit raise {
  let t21 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t20 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t19 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t18 = @tactics.pop_assum(fn(
    x15 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s16 = @tactics.mp_tac(x15)
    fn(
      x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s16(x17)
    }
  })
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @tactics.match_mp_tac(rat_lemma1()),
            ),
            t18,
          ),
          t19,
        ),
        t20,
      ),
      @tactics.strip_tac,
    ),
    t21,
  )
  rat_lemma2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_of_num(0) < (y1 : Real) && real_of_num(0) < (y2 : Real) → (x1 : Real) / y1 + (x2 : Real) / y2 == (x1 * y2 + x2 * y1) * (inv(y1) * inv(y2))"),
      t22,
    ),
  )
}

///|
let rat_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA2")

///|
/// `RAT_LEMMA2`
pub fn rat_lemma2() -> @kernel.Thm {
  rat_lemma2_c.get()
}

///|
/// RAT_LEMMA3
fn step_4() -> Unit raise {
  let t30 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_sub(), @equal.gsym(@calc_int.real_mul_lneg())]),
  )
  let t29 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t27 = @drule.match_mp(rat_lemma2())
  let t31 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
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
          (fn(
            x26 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x23 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s24 = @tactics.mp_tac(x23)
              fn(
                x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s24(x25)
              }
            })(@bool.gen_all(x26))
          })(t27(x28))
        }),
        t29,
      ),
      @tactics.disch_tac,
    ),
    t30,
  )
  rat_lemma3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_of_num(0) < (y1 : Real) && real_of_num(0) < (y2 : Real) → (x1 : Real) / y1 - (x2 : Real) / y2 == (x1 * y2 - x2 * y1) * (inv(y1) * inv(y2))"),
      t31,
    ),
  )
}

///|
let rat_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA3")

///|
/// `RAT_LEMMA3`
pub fn rat_lemma3() -> @kernel.Thm {
  rat_lemma3_c.get()
}

///|
/// RAT_LEMMA4
fn step_5() -> Unit raise {
  let t48 = @simp.asm_rewrite_tac(@list.List([]))
  let t47 = @tactics.match_mp_tac(@realarith.real_lt_imp_le())
  let t46 = @simp.asm_rewrite_tac(@list.List([]))
  let t49 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t46),
      t47,
    ),
    t48,
  )
  let t43 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (y : Real)"))
  let t42 = @tactics.match_mp_tac(@real.real_mul_rinv())
  let t44 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.subgoal_then(@term_syntax.parse_term("(y : Real) * inv(y) == real_of_num(1)"), fn(
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
          @simp.rewrite_tac(@list.List([th, @realarith.real_mul_rid()]))
        }),
        t42,
      ),
      t43,
    ),
    @real.real_arith_tac,
  )
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @tactics.match_mp_tac(@realarith.real_lt_imp_le())
  let t37 = @tactics.match_mp_tac(@real.real_le_inv())
  let t36 = @simp.asm_rewrite_tac(@list.List([]))
  let t35 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t45 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
              t35,
            ),
            t36,
          ),
          t37,
        ),
        t38,
      ),
      t39,
    ),
    t44,
  ])
  let t50 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (x : Real) * ((y : Real) * inv(y))"), fn(
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
        let s33 = @tactics.mp_tac(x32)
        fn(
          x34 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s33(x34)
        }
      }),
      t45,
    ),
    t49,
  ])
  let t51 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.disch_tac, @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t50,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (y : Real) → (real_of_num(0) <= (x : Real) * y) == (real_of_num(0) <= x)"),
    t51,
  )
  let t61 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @tactics.match_mp_tac(@real.real_lt_inv())
  let t59 = @tactics.match_mp_tac(lemma)
  let t58 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t57 = @tactics.exists_tac(
    @term_syntax.parse_term("real_of_num(0) <= ((x2 : Real) * (y1 : Real) - (x1 : Real) * (y2 : Real)) * inv(y2)"),
  )
  let t56 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t55 = @tactics.first_assum(fn(
    x53 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x53
    @simp.rewrite_tac(@list.List([@drule.match_mp(rat_lemma3())(th_1)]))
  })
  let t52 = @simp.once_rewrite_tac(
    @list.List([
      @realarith.real_arith(@term_syntax.parse_term("((a : Real) <= (b : Real)) == (real_of_num(0) <= b - a)")),
    ]),
  )
  let t62 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])),
                      @tactics.disch_tac,
                    ),
                    t52,
                  ),
                  t55,
                ),
                t56,
              ),
              t57,
            ),
            t58,
          ),
          @tactics.conj_tac,
        ),
        t59,
      ),
      t60,
    ),
    t61,
  )
  rat_lemma4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_of_num(0) < (y1 : Real) && real_of_num(0) < (y2 : Real) → ((x1 : Real) / y1 <= (x2 : Real) / y2) == (x1 * y2 <= x2 * y1)"),
      t62,
    ),
  )
}

///|
let rat_lemma4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA4")

///|
/// `RAT_LEMMA4`
pub fn rat_lemma4() -> @kernel.Thm {
  rat_lemma4_c.get()
}

///|
/// RAT_LEMMA5
fn step_6() -> Unit raise {
  let t66 = @simp.asm_rewrite_tac(@list.List([]))
  let t65 = @tactics.match_mp_tac(rat_lemma4())
  let t64 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(a : Bool) == (a' : Bool) && (b : Bool) == (b' : Bool) → (a && b) == (a' && b')"),
    ),
  )
  let t63 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym())]),
  )
  let t67 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t63),
          t64,
        ),
        @tactics.conj_tac,
      ),
      t65,
    ),
    t66,
  )
  rat_lemma5_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_of_num(0) < (y1 : Real) && real_of_num(0) < (y2 : Real) → ((x1 : Real) / y1 == (x2 : Real) / y2) == (x1 * y2 == x2 * y1)"),
      t67,
    ),
  )
}

///|
let rat_lemma5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA5")

///|
/// `RAT_LEMMA5`
pub fn rat_lemma5() -> @kernel.Thm {
  rat_lemma5_c.get()
}

///|
/// REAL_INT_RAT_CONV
fn step_7() -> Unit raise {
  let t68 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @calc_int.real_mul_lneg()]),
  )
  let t69 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@real.real_div_1(), decimal()])),
    t68,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("real_of_num((x : Num)) == real_of_num(x) / real_of_num(1) && -real_of_num(x) == -real_of_num(x) / real_of_num(1) && DECIMAL(x, (y : Num)) == real_of_num(x) / real_of_num(y) && -DECIMAL(x, y) == -real_of_num(x) / real_of_num(y)"),
    t69,
  )
  real_int_rat_conv_c.set(
    @equal.try_conv(
      @simp.gen_rewrite_conv(
        fn(
          x70 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x70
        },
        @list.List([pth]),
      ),
    ),
  )
}

///|
let real_int_rat_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_INT_RAT_CONV",
)

///|
/// `REAL_INT_RAT_CONV`
pub fn real_int_rat_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_int_rat_conv_c.get()(x)
}

///|
/// REAL_RAT_LE_CONV
fn step_8() -> Unit raise {
  let t71 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), rat_lemma4()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (y1 : Real) → real_of_num(0) < (y2 : Real) → ((x1 : Real) / y1 <= (x2 : Real) / y2) == (x1 * y2 <= x2 * y1)"),
    t71,
  )
  let x1 = @term_syntax.parse_term("(x1 : Real)")
  let x2 = @term_syntax.parse_term("(x2 : Real)")
  let y1 = @term_syntax.parse_term("(y1 : Real)")
  let y2 = @term_syntax.parse_term("(y2 : Real)")
  let t72 = @term_syntax.parse_term("real_le")
  let dest_le : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x73 : @kernel.Term,
  ) => @basics.dest_binop(t72, x73)
  let t74 = @term_syntax.parse_term("op_slash")
  let dest_div : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x75 : @kernel.Term,
  ) => @basics.dest_binop(t74, x75)
  let raw_real_rat_le_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x76 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x76
    let (l, r) = dest_le(tm)
    let (lx, ly) = dest_div(l)
    let (rx, ry) = dest_div(r)
    let th0 = @kernel.inst_rule(
      @list.List([(lx, x1), (ly, y1), (rx, x2), (ry, y2)]),
      pth,
    )
    let th1 = @lib.funpow(
      2,
      (x77 : @kernel.Thm) => @drule.mp_conv(@calc_int.real_int_lt_conv, x77),
      th0,
    )
    let t78 = @kernel.rand(@kernel.concl(th1))
    let th2 = @equal.thenc(
      @equal.binop_conv(@calc_int.real_int_mul_conv),
      @calc_int.real_int_le_conv,
    )(t78)
    @kernel.trans(th1, th2)
  }
  real_rat_le_conv_c.set(
    @equal.thenc(@equal.binop_conv(real_int_rat_conv), raw_real_rat_le_conv),
  )
}

///|
let real_rat_le_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_LE_CONV",
)

///|
/// `REAL_RAT_LE_CONV`
pub fn real_rat_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_le_conv_c.get()(x)
}

///|
/// REAL_RAT_LT_CONV
fn step_9() -> Unit raise {
  let t87 = @simp.simp_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("(!(a : Bool) == !(b : Bool)) == (a == b)")),
      rat_lemma4(),
    ]),
  )
  let t86 = @simp.gen_rewrite_tac(
    fn(
      x85 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x79 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s80 = @equal.rand_conv(x79)
        fn(x81 : @kernel.Term) -> @kernel.Thm raise { s80(x81) }
      })(
        (fn(
          x82 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s83 = @equal.once_depth_conv(x82)
          fn(x84 : @kernel.Term) -> @kernel.Thm raise { s83(x84) }
        })(x85),
      )
    },
    @list.List([@equal.gsym(@real.real_not_le())]),
  )
  let t88 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_imp()])), t86),
    t87,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (y1 : Real) → real_of_num(0) < (y2 : Real) → ((x1 : Real) / y1 < (x2 : Real) / y2) == (x1 * y2 < x2 * y1)"),
    t88,
  )
  let x1 = @term_syntax.parse_term("(x1 : Real)")
  let x2 = @term_syntax.parse_term("(x2 : Real)")
  let y1 = @term_syntax.parse_term("(y1 : Real)")
  let y2 = @term_syntax.parse_term("(y2 : Real)")
  let t89 = @term_syntax.parse_term("real_lt")
  let dest_lt : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x90 : @kernel.Term,
  ) => @basics.dest_binop(t89, x90)
  let t91 = @term_syntax.parse_term("op_slash")
  let dest_div : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x92 : @kernel.Term,
  ) => @basics.dest_binop(t91, x92)
  let raw_real_rat_lt_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x93 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x93
    let (l, r) = dest_lt(tm)
    let (lx, ly) = dest_div(l)
    let (rx, ry) = dest_div(r)
    let th0 = @kernel.inst_rule(
      @list.List([(lx, x1), (ly, y1), (rx, x2), (ry, y2)]),
      pth,
    )
    let th1 = @lib.funpow(
      2,
      (x94 : @kernel.Thm) => @drule.mp_conv(@calc_int.real_int_lt_conv, x94),
      th0,
    )
    let t95 = @kernel.rand(@kernel.concl(th1))
    let th2 = @equal.thenc(
      @equal.binop_conv(@calc_int.real_int_mul_conv),
      @calc_int.real_int_lt_conv,
    )(t95)
    @kernel.trans(th1, th2)
  }
  real_rat_lt_conv_c.set(
    @equal.thenc(@equal.binop_conv(real_int_rat_conv), raw_real_rat_lt_conv),
  )
}

///|
let real_rat_lt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_LT_CONV",
)

///|
/// `REAL_RAT_LT_CONV`
pub fn real_rat_lt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_lt_conv_c.get()(x)
}

///|
/// REAL_RAT_GE_CONV
fn step_10() -> Unit raise {
  real_rat_ge_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x96 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x96
        },
        @list.List([@realax.real_ge()]),
      ),
      real_rat_le_conv,
    ),
  )
}

///|
let real_rat_ge_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_GE_CONV",
)

///|
/// `REAL_RAT_GE_CONV`
pub fn real_rat_ge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_ge_conv_c.get()(x)
}

///|
/// REAL_RAT_GT_CONV
fn step_11() -> Unit raise {
  real_rat_gt_conv_c.set(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x97 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x97
        },
        @list.List([@realax.real_gt()]),
      ),
      real_rat_lt_conv,
    ),
  )
}

///|
let real_rat_gt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_GT_CONV",
)

///|
/// `REAL_RAT_GT_CONV`
pub fn real_rat_gt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_gt_conv_c.get()(x)
}

///|
/// REAL_RAT_EQ_CONV
fn step_12() -> Unit raise {
  let t98 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), rat_lemma5()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (y1 : Real) → real_of_num(0) < (y2 : Real) → ((x1 : Real) / y1 == (x2 : Real) / y2) == (x1 * y2 == x2 * y1)"),
    t98,
  )
  let x1 = @term_syntax.parse_term("(x1 : Real)")
  let x2 = @term_syntax.parse_term("(x2 : Real)")
  let y1 = @term_syntax.parse_term("(y1 : Real)")
  let y2 = @term_syntax.parse_term("(y2 : Real)")
  let t99 = @term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)")
  let dest_eq : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x100 : @kernel.Term,
  ) => @basics.dest_binop(t99, x100)
  let t101 = @term_syntax.parse_term("op_slash")
  let dest_div : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x102 : @kernel.Term,
  ) => @basics.dest_binop(t101, x102)
  let raw_real_rat_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x103 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x103
    let (l, r) = dest_eq(tm)
    let (lx, ly) = dest_div(l)
    let (rx, ry) = dest_div(r)
    let th0 = @kernel.inst_rule(
      @list.List([(lx, x1), (ly, y1), (rx, x2), (ry, y2)]),
      pth,
    )
    let th1 = @lib.funpow(
      2,
      (x104 : @kernel.Thm) => @drule.mp_conv(@calc_int.real_int_lt_conv, x104),
      th0,
    )
    let t105 = @kernel.rand(@kernel.concl(th1))
    let th2 = @equal.thenc(
      @equal.binop_conv(@calc_int.real_int_mul_conv),
      @calc_int.real_int_eq_conv,
    )(t105)
    @kernel.trans(th1, th2)
  }
  real_rat_eq_conv_c.set(
    @equal.thenc(@equal.binop_conv(real_int_rat_conv), raw_real_rat_eq_conv),
  )
}

///|
let real_rat_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_EQ_CONV",
)

///|
/// `REAL_RAT_EQ_CONV`
pub fn real_rat_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_eq_conv_c.get()(x)
}

///|
/// REAL_RAT_SGN_CONV
fn step_13() -> Unit raise {
  let t112 = @simp.gen_rewrite_conv(
    fn(
      x111 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x111
    },
    @list.List([@class.cond_clauses()]),
  )
  let t110 = @equal.rator_conv(@equal.land_conv(real_rat_lt_conv))
  let t113 = @equal.thenc(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x109 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x109
        },
        @list.List([@bool.conjunct2(@bool.spec_all(@class.cond_clauses()))]),
      ),
      t110,
    ),
    t112,
  )
  let t114 = @equal.orelsec(
    @simp.gen_rewrite_conv(
      fn(
        x108 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x108
      },
      @list.List([@bool.conjunct1(@bool.spec_all(@class.cond_clauses()))]),
    ),
    t113,
  )
  let t107 = @equal.rator_conv(@equal.land_conv(real_rat_lt_conv))
  real_rat_sgn_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x106 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x106
          },
          @list.List([@real.real_sgn()]),
        ),
        t107,
      ),
      t114,
    ),
  )
}

///|
let real_rat_sgn_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_SGN_CONV",
)

///|
/// `REAL_RAT_SGN_CONV`
pub fn real_rat_sgn_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_sgn_conv_c.get()(x)
}

///|
/// REAL_RAT_NEG_CONV
fn step_14() -> Unit raise {
  let t115 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_inv_neg(),
      @calc_int.real_mul_lneg(),
      @calc_int.real_neg_neg(),
      @calc_int.real_neg_0(),
      decimal(),
    ]),
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("-real_of_num(0) == real_of_num(0) && --real_of_num((n : Num)) == real_of_num(n) && -(real_of_num((m : Num)) / real_of_num(n)) == -real_of_num(m) / real_of_num(n) && -(-real_of_num(m) / real_of_num(n)) == real_of_num(m) / real_of_num(n) && -DECIMAL(m, n) == -real_of_num(m) / real_of_num(n)"),
    t115,
  )
  let ptm = @term_syntax.parse_term("op_minus_minus")
  let conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x116 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x116
    },
    @list.List([pth]),
  )
  real_rat_neg_conv_c.set(fn(x117 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x117
    conv1(tm) catch {
      Failure(_) =>
        try {
          let (l, r) = @kernel.dest_comb(tm)
          if l == ptm &&
            @calc_int.is_realintconst(r) &&
            @num.gt_num(@calc_int.dest_realintconst(r), @num.num_0) {
            @kernel.refl(tm)
          } else {
            @lib.failure()
          }
        } catch {
          Failure(_) => raise Failure("REAL_RAT_NEG_CONV")
          e => raise e
        }
      e => raise e
    }
  })
}

///|
let real_rat_neg_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_RAT_NEG_CONV",
)

///|
/// `REAL_RAT_NEG_CONV`
pub fn real_rat_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_neg_conv_c.get()(x)
}

///|
/// REAL_RAT_ABS_CONV
fn step_15() -> Unit raise {
  let t118 = @simp.rewrite_tac(
    @list.List([
      decimal(),
      @real.real_abs_div(),
      @calc_int.real_abs_neg(),
      @calc_int.real_abs_num(),
    ]),
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("abs(real_of_num((n : Num))) == real_of_num(n) && abs(-real_of_num(n)) == real_of_num(n) && abs(real_of_num((m : Num)) / real_of_num(n)) == real_of_num(m) / real_of_num(n) && abs(-real_of_num(m) / real_of_num(n)) == real_of_num(m) / real_of_num(n) && abs(DECIMAL(m, n)) == real_of_num(m) / real_of_num(n) && abs(-DECIMAL(m, n)) == real_of_num(m) / real_of_num(n)"),
    t118,
  )
  real_rat_abs_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x119 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x119
      },
      @list.List([pth]),
    ),
  )
}

///|
let real_rat_abs_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_ABS_CONV",
)

///|
/// `REAL_RAT_ABS_CONV`
pub fn real_rat_abs_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_abs_conv_c.get()(x)
}

///|
/// REAL_RAT_INV_CONV
fn step_16() -> Unit raise {
  let t120 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @real.real_inv_neg(),
      @calc_int.real_mul_rneg(),
      @real.real_inv_1(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t121 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @realax.real_inv_0(),
        @real.real_inv_1(),
        @real.real_inv_neg(),
        @real.real_inv_div(),
        @real.real_div_1(),
      ]),
    ),
    t120,
  )
  let pth1 = @tactics.prove(
    @term_syntax.parse_term("inv(real_of_num(0)) == real_of_num(0) && inv(real_of_num(1)) == real_of_num(1) && inv(-real_of_num(1)) == -real_of_num(1) && inv(real_of_num(1) / real_of_num((n : Num))) == real_of_num(n) && inv(-real_of_num(1) / real_of_num(n)) == -real_of_num(n)"),
    t121,
  )
  let t122 = @simp.rewrite_tac(
    @list.List([
      @real.real_inv_neg(),
      @realax.real_div(),
      @calc_int.real_mul_rneg(),
      @real.real_mul_ac(),
      @realax.real_mul_lid(),
      @calc_int.real_mul_lneg(),
      @real.real_inv_mul(),
      @real.real_inv_inv(),
    ]),
  )
  let t123 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([decimal(), @real.real_inv_div()])),
    t122,
  )
  let pth2 = @tactics.prove(
    @term_syntax.parse_term("inv(real_of_num((n : Num))) == real_of_num(1) / real_of_num(n) && inv(-real_of_num(n)) == -real_of_num(1) / real_of_num(n) && inv(real_of_num((m : Num)) / real_of_num(n)) == real_of_num(n) / real_of_num(m) && inv(-real_of_num(m) / real_of_num(n)) == -real_of_num(n) / real_of_num(m) && inv(DECIMAL(m, n)) == real_of_num(n) / real_of_num(m) && inv(-DECIMAL(m, n)) == -real_of_num(n) / real_of_num(m)"),
    t123,
  )
  let t126 = @simp.gen_rewrite_conv(
    fn(
      x125 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x125
    },
    @list.List([pth2]),
  )
  real_rat_inv_conv_c.set(
    @equal.orelsec(
      @simp.gen_rewrite_conv(
        fn(
          x124 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x124
        },
        @list.List([pth1]),
      ),
      t126,
    ),
  )
}

///|
let real_rat_inv_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_INV_CONV",
)

///|
/// `REAL_RAT_INV_CONV`
pub fn real_rat_inv_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_inv_conv_c.get()(x)
}

///|
/// REAL_RAT_ADD_CONV
fn step_17() -> Unit raise {
  let t143 = @tactics.disch_then(fn(
    x141 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x141
    @simp.asm_rewrite_tac(@list.List([@drule.match_mp(rat_lemma5())(th)]))
  })
  let t140 = @simp.asm_rewrite_tac(@list.List([]))
  let t139 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t144 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t139),
      t140,
    ),
    t143,
  ])
  let t138 = @tactics.subgoal_then(
    @term_syntax.parse_term("real_of_num(0) < (y1 : Real) * (y2 : Real) && real_of_num(0) < (y3 : Real)"),
    fn(
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
      let s136 = @tactics.mp_tac(x135)
      fn(
        x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s136(x137)
      }
    },
  )
  let t133 = @equal.gsym(@realax.real_div())
  let t134 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_inv_mul()), t133]),
  )
  let t132 = @tactics.disch_then(fn(
    x129 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s130 = @tactics.subst1_tac(x129)
    fn(
      x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s130(x131)
    }
  })
  let t128 = @simp.asm_rewrite_tac(@list.List([]))
  let t127 = @tactics.mp_tac(rat_lemma2())
  let t145 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t127),
            t128,
          ),
          t132,
        ),
        t134,
      ),
      t138,
    ),
    t144,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("real_of_num(0) < (y1 : Real) → real_of_num(0) < (y2 : Real) → real_of_num(0) < (y3 : Real) → ((x1 : Real) * y2 + (x2 : Real) * y1) * y3 == (x3 : Real) * (y1 * y2) → x1 / y1 + x2 / y2 == x3 / y3"),
    t145,
  )
  let t146 = @term_syntax.parse_term("op_slash")
  let dest_divop : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x147 : @kernel.Term,
  ) => @basics.dest_binop(t146, x147)
  let t148 = @term_syntax.parse_term("real_add")
  let dest_addop : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x149 : @kernel.Term,
  ) => @basics.dest_binop(t148, x149)
  let x1 = @term_syntax.parse_term("(x1 : Real)")
  let x2 = @term_syntax.parse_term("(x2 : Real)")
  let x3 = @term_syntax.parse_term("(x3 : Real)")
  let y1 = @term_syntax.parse_term("(y1 : Real)")
  let y2 = @term_syntax.parse_term("(y2 : Real)")
  let y3 = @term_syntax.parse_term("(y3 : Real)")
  let raw_real_rat_add_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x150 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x150
    let (r1, r2) = dest_addop(tm)
    let (x1_p, y1_p) = dest_divop(r1)
    let (x2_p, y2_p) = dest_divop(r2)
    let x1n = @calc_int.dest_realintconst(x1_p)
    let y1n = @calc_int.dest_realintconst(y1_p)
    let x2n = @calc_int.dest_realintconst(x2_p)
    let y2n = @calc_int.dest_realintconst(y2_p)
    let t151 = @num.mult_num(x2n, y1n)
    let x3n = @num.add_num(@num.mult_num(x1n, y2n), t151)
    let y3n = @num.mult_num(y1n, y2n)
    let d = @num.gcd_num(x3n, y3n)
    let x3n_p = @num.quo_num(x3n, d)
    let y3n_p = @num.quo_num(y3n, d)
    let (x3n_p_p, y3n_p_p) = if @num.gt_num(y3n_p, @num.num_of_int64(0L)) {
      (x3n_p, y3n_p)
    } else {
      let t152 = @num.minus_num(y3n_p)
      (@num.minus_num(x3n_p), t152)
    }
    let x3_p = @calc_int.mk_realintconst(x3n_p_p)
    let y3_p = @calc_int.mk_realintconst(y3n_p_p)
    let th0 = @kernel.inst_rule(
      @list.List([
        (x1_p, x1),
        (y1_p, y1),
        (x2_p, x2),
        (y2_p, y2),
        (x3_p, x3),
        (y3_p, y3),
      ]),
      pth,
    )
    let th1 = @lib.funpow(
      3,
      (x153 : @kernel.Thm) => @drule.mp_conv(@calc_int.real_int_lt_conv, x153),
      th0,
    )
    let (tm2, tm3) = @kernel.dest_eq(@basics.dest_imp(@kernel.concl(th1)).0)
    let th2 = @equal.thenc(
      @equal.land_conv(
        @equal.thenc(
          @equal.binop_conv(@calc_int.real_int_mul_conv),
          @calc_int.real_int_add_conv,
        ),
      ),
      @calc_int.real_int_mul_conv,
    )(tm2)
    let th3 = @equal.thenc(
      @equal.rand_conv(@calc_int.real_int_mul_conv),
      @calc_int.real_int_mul_conv,
    )(tm3)
    @bool.mp(th1, @kernel.trans(th2, @equal.sym(th3)))
  }
  let t155 = @equal.try_conv(
    @simp.gen_rewrite_conv(
      fn(
        x154 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x154
      },
      @list.List([@real.real_div_1()]),
    ),
  )
  real_rat_add_conv_c.set(
    @equal.thenc(
      @equal.thenc(@equal.binop_conv(real_int_rat_conv), raw_real_rat_add_conv),
      t155,
    ),
  )
}

///|
let real_rat_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_ADD_CONV",
)

///|
/// `REAL_RAT_ADD_CONV`
pub fn real_rat_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_add_conv_c.get()(x)
}

///|
/// REAL_RAT_SUB_CONV
fn step_18() -> Unit raise {
  let t156 = @simp.rewrite_tac(@list.List([@realax.real_sub()]))
  let pth = @tactics.prove(@term_syntax.parse_term("(x : Real) - (y : Real) == x + -y"), t156)
  let t158 = @equal.rand_conv(real_rat_neg_conv)
  real_rat_sub_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x157 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x157
          },
          @list.List([pth]),
        ),
        t158,
      ),
      real_rat_add_conv,
    ),
  )
}

///|
let real_rat_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_SUB_CONV",
)

///|
/// `REAL_RAT_SUB_CONV`
pub fn real_rat_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_sub_conv_c.get()(x)
}

///|
/// REAL_RAT_MUL_CONV
fn step_19() -> Unit raise {
  let t159 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_mul_ac()]),
  )
  let pth_nocancel = @tactics.prove(
    @term_syntax.parse_term("(x1 : Real) / (y1 : Real) * ((x2 : Real) / (y2 : Real)) == x1 * x2 / (y1 * y2)"),
    t159,
  )
  let t181 = @simp.asm_simp_tac(
    @list.List([@realax.real_mul_linv(), @realarith.real_mul_rid()]),
  )
  let t179 = @term_syntax.parse_term("(d1 : Real) * (u1 : Real) * ((id2 : Real) * (iv1 : Real)) * ((d2 : Real) * (u2 : Real) * ((id1 : Real) * (iv2 : Real))) == u1 * u2 * (iv1 * iv2 * (id2 * d2 * (id1 * d1)))")
  let t180 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@real.real_mul_ac())(t179)]),
  )
  let t178 = @simp.asm_rewrite_tac(
    @list.List([@realax.real_div(), @real.real_inv_mul()]),
  )
  let t177 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x176 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x173 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s174 = @tactics.subst1_tac(x173)
        fn(
          x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s174(x175)
        }
      })(@equal.sym(x176))
    }),
  )
  let t172 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s167 = @tactics.assume_tac(x166)
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
      },
      fn(
        x169 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s170 = @tactics.mp_tac(x169)
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
          s170(x171)
        }
      },
    ),
  )
  let t182 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.conjuncts_then2(
                fn(
                  x160 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s161 = @tactics.assume_tac(x160)
                  fn(
                    x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s161(x162)
                  }
                },
                fn(
                  x163 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s164 = @tactics.mp_tac(x163)
                  fn(
                    x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s164(x165)
                  }
                },
              ),
            ),
            t172,
          ),
          t177,
        ),
        t178,
      ),
      t180,
    ),
    t181,
  )
  let pth_cancel = @tactics.prove(
    @term_syntax.parse_term("!((d1 : Real) == real_of_num(0)) && !((d2 : Real) == real_of_num(0)) && d1 * (u1 : Real) == (x1 : Real) && d2 * (u2 : Real) == (x2 : Real) && d2 * (v1 : Real) == (y1 : Real) && d1 * (v2 : Real) == (y2 : Real) → x1 / y1 * (x2 / y2) == u1 * u2 / (v1 * v2)"),
    t182,
  )
  let t183 = @term_syntax.parse_term("op_slash")
  let dest_divop : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x184 : @kernel.Term,
  ) => @basics.dest_binop(t183, x184)
  let t185 = @term_syntax.parse_term("real_mul")
  let dest_mulop : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x186 : @kernel.Term,
  ) => @basics.dest_binop(t185, x186)
  let x1 = @term_syntax.parse_term("(x1 : Real)")
  let x2 = @term_syntax.parse_term("(x2 : Real)")
  let y1 = @term_syntax.parse_term("(y1 : Real)")
  let y2 = @term_syntax.parse_term("(y2 : Real)")
  let u1 = @term_syntax.parse_term("(u1 : Real)")
  let u2 = @term_syntax.parse_term("(u2 : Real)")
  let v1 = @term_syntax.parse_term("(v1 : Real)")
  let v2 = @term_syntax.parse_term("(v2 : Real)")
  let d1 = @term_syntax.parse_term("(d1 : Real)")
  let d2 = @term_syntax.parse_term("(d2 : Real)")
  let raw_real_rat_mul_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x187 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x187
    let (r1, r2) = dest_mulop(tm)
    let (x1_p, y1_p) = dest_divop(r1)
    let (x2_p, y2_p) = dest_divop(r2)
    let x1n = @calc_int.dest_realintconst(x1_p)
    let y1n = @calc_int.dest_realintconst(y1_p)
    let x2n = @calc_int.dest_realintconst(x2_p)
    let y2n = @calc_int.dest_realintconst(y2_p)
    let d1n = @num.gcd_num(x1n, y2n)
    let d2n = @num.gcd_num(x2n, y1n)
    if @num.eq_num(d1n, @num.num_1) && @num.eq_num(d2n, @num.num_1) {
      let th0 = @kernel.inst_rule(
        @list.List([(x1_p, x1), (y1_p, y1), (x2_p, x2), (y2_p, y2)]),
        pth_nocancel,
      )
      let t188 = @kernel.rand(@kernel.concl(th0))
      let th1 = @equal.binop_conv(@calc_int.real_int_mul_conv)(t188)
      @kernel.trans(th0, th1)
    } else {
      let u1n = @num.quo_num(x1n, d1n)
      let u2n = @num.quo_num(x2n, d2n)
      let v1n = @num.quo_num(y1n, d2n)
      let v2n = @num.quo_num(y2n, d1n)
      let u1_p = @calc_int.mk_realintconst(u1n)
      let u2_p = @calc_int.mk_realintconst(u2n)
      let v1_p = @calc_int.mk_realintconst(v1n)
      let v2_p = @calc_int.mk_realintconst(v2n)
      let d1_p = @calc_int.mk_realintconst(d1n)
      let d2_p = @calc_int.mk_realintconst(d2n)
      let th0_1 = @kernel.inst_rule(
        @list.List([
          (x1_p, x1),
          (y1_p, y1),
          (x2_p, x2),
          (y2_p, y2),
          (u1_p, u1),
          (v1_p, v1),
          (u2_p, u2),
          (v2_p, v2),
          (d1_p, d1),
          (d2_p, d2),
        ]),
        pth_cancel,
      )
      let th1_1 = @bool.eqt_elim(
        @calc_int.real_int_reduce_conv(@equal.lhand(@kernel.concl(th0_1))),
      )
      let th2 = @bool.mp(th0_1, th1_1)
      let t189 = @kernel.rand(@kernel.concl(th2))
      let th3 = @equal.binop_conv(@calc_int.real_int_mul_conv)(t189)
      @kernel.trans(th2, th3)
    }
  }
  let t191 = @equal.try_conv(
    @simp.gen_rewrite_conv(
      fn(
        x190 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x190
      },
      @list.List([@real.real_div_1()]),
    ),
  )
  real_rat_mul_conv_c.set(
    @equal.thenc(
      @equal.thenc(@equal.binop_conv(real_int_rat_conv), raw_real_rat_mul_conv),
      t191,
    ),
  )
}

///|
let real_rat_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_MUL_CONV",
)

///|
/// `REAL_RAT_MUL_CONV`
pub fn real_rat_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_mul_conv_c.get()(x)
}

///|
/// REAL_RAT_DIV_CONV
fn step_20() -> Unit raise {
  let t192 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let pth = @tactics.prove(@term_syntax.parse_term("(x : Real) / (y : Real) == x * inv(y)"), t192)
  let t194 = @equal.rand_conv(real_rat_inv_conv)
  real_rat_div_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x193 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x193
          },
          @list.List([pth]),
        ),
        t194,
      ),
      real_rat_mul_conv,
    ),
  )
}

///|
let real_rat_div_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_DIV_CONV",
)

///|
/// `REAL_RAT_DIV_CONV`
pub fn real_rat_div_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_div_conv_c.get()(x)
}

///|
/// REAL_RAT_POW_CONV
fn step_21() -> Unit raise {
  let t195 = @simp.rewrite_tac(@list.List([@real.real_pow_div()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("pow((x : Real) / (y : Real), (n : Num)) == pow(x, n) / pow(y, n)"),
    t195,
  )
  let t198 = @equal.binop_conv(@calc_int.real_int_pow_conv)
  let t197 = @simp.gen_rewrite_conv(
    fn(
      x196 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x196
    },
    @list.List([pth]),
  )
  real_rat_pow_conv_c.set(
    @equal.orelsec(
      @calc_int.real_int_pow_conv,
      @equal.thenc(
        @equal.thenc(@equal.land_conv(real_int_rat_conv), t197),
        t198,
      ),
    ),
  )
}

///|
let real_rat_pow_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_POW_CONV",
)

///|
/// `REAL_RAT_POW_CONV`
pub fn real_rat_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_pow_conv_c.get()(x)
}

///|
/// REAL_RAT_MAX_CONV
fn step_22() -> Unit raise {
  let t201 = @simp.gen_rewrite_conv(
    fn(
      x200 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x200
    },
    @list.List([@class.cond_clauses()]),
  )
  let t199 = @equal.rator_conv(
    @equal.rator_conv(@equal.rand_conv(real_rat_le_conv)),
  )
  real_rat_max_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(@realax.real_max()), t199), t201),
  )
}

///|
let real_rat_max_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_MAX_CONV",
)

///|
/// `REAL_RAT_MAX_CONV`
pub fn real_rat_max_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_max_conv_c.get()(x)
}

///|
/// REAL_RAT_MIN_CONV
fn step_23() -> Unit raise {
  let t204 = @simp.gen_rewrite_conv(
    fn(
      x203 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x203
    },
    @list.List([@class.cond_clauses()]),
  )
  let t202 = @equal.rator_conv(
    @equal.rator_conv(@equal.rand_conv(real_rat_le_conv)),
  )
  real_rat_min_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(@realax.real_min()), t202), t204),
  )
}

///|
let real_rat_min_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_MIN_CONV",
)

///|
/// `REAL_RAT_MIN_CONV`
pub fn real_rat_min_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_min_conv_c.get()(x)
}

///|
/// real_rat_red_conv_list
fn step_24() -> Unit raise {
  let t207 = (@term_syntax.parse_term("min((x : Real), (y : Real))"), real_rat_min_conv)
  let t208 = (@term_syntax.parse_term("max((x : Real), (y : Real))"), real_rat_max_conv)
  let t209 = (@term_syntax.parse_term("pow((x : Real), (n : Num))"), real_rat_pow_conv)
  let t206 = @equal.changed_conv(real_rat_div_conv)
  let t210 = (@term_syntax.parse_term("(x : Real) / (y : Real)"), t206)
  let t211 = (@term_syntax.parse_term("(x : Real) * (y : Real)"), real_rat_mul_conv)
  let t212 = (@term_syntax.parse_term("(x : Real) - (y : Real)"), real_rat_sub_conv)
  let t213 = (@term_syntax.parse_term("(x : Real) + (y : Real)"), real_rat_add_conv)
  let t214 = (@term_syntax.parse_term("inv((x : Real))"), real_rat_inv_conv)
  let t215 = (@term_syntax.parse_term("abs((x : Real))"), real_rat_abs_conv)
  let t216 = (@term_syntax.parse_term("real_sgn((x : Real))"), real_rat_sgn_conv)
  let t205 = @equal.changed_conv(real_rat_neg_conv)
  let t217 = (@term_syntax.parse_term("-(x : Real)"), t205)
  let t218 = (@term_syntax.parse_term("(x : Real) == (y : Real)"), real_rat_eq_conv)
  let t219 = (@term_syntax.parse_term("(x : Real) > (y : Real)"), real_rat_gt_conv)
  let t220 = (@term_syntax.parse_term("(x : Real) >= (y : Real)"), real_rat_ge_conv)
  let t221 = (@term_syntax.parse_term("(x : Real) < (y : Real)"), real_rat_lt_conv)
  real_rat_red_conv_list_c.set(
    @list.List([
      (@term_syntax.parse_term("(x : Real) <= (y : Real)"), real_rat_le_conv),
      t221,
      t220,
      t219,
      t218,
      t217,
      t216,
      t215,
      t214,
      t213,
      t212,
      t211,
      t210,
      t209,
      t208,
      t207,
    ]),
  )
}

///|
let real_rat_red_conv_list_c : @lib.Cell[
  @list.List[(@kernel.Term, @equal.Conv)],
] = @lib.Cell::new("real_rat_red_conv_list")

///|
/// `real_rat_red_conv_list`
pub fn real_rat_red_conv_list() -> @list.List[(@kernel.Term, @equal.Conv)] {
  real_rat_red_conv_list_c.get()
}

///|
/// REAL_RAT_RED_CONV
fn step_25() -> Unit raise {
  let gconv_net = @lib.itlist(
    fn(
      x226 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x227 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s228 = ((x225 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x222 : @kernel.Term,
            x223 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x224 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x222, x223, x224)
            }
          },
          x225,
        )
      })(x226)
      s228(x227)
    },
    real_rat_red_conv_list(),
    @simp.basic_net(),
  )
  real_rat_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let real_rat_red_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_RAT_RED_CONV",
)

///|
/// `REAL_RAT_RED_CONV`
pub fn real_rat_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_red_conv_c.get()(x)
}

///|
/// REAL_RAT_REDUCE_CONV
fn step_26() -> Unit raise {
  real_rat_reduce_conv_c.set(@equal.depth_conv(real_rat_red_conv))
}

///|
let real_rat_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "REAL_RAT_REDUCE_CONV",
)

///|
/// `REAL_RAT_REDUCE_CONV`
pub fn real_rat_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_reduce_conv_c.get()(x)
}

///|
/// real_rat_compute_add_convs
fn step_27() -> Unit raise {
  let convlist = @lib.map(
    fn(
      x229 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
    ) -> (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise) raise {
      let (pat, the_conv) = x229
      let (c, args) = @basics.strip_comb(pat)
      (c, Int::to_int64(@lib.length(args)), the_conv)
    },
    real_rat_red_conv_list(),
  )
  real_rat_compute_add_convs_c.set(fn(x230 : @compute.Compset) -> Unit raise {
    let _ as compset = x230
    @lib.itlist(
      fn(
        x231 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
        x232 : Unit,
      ) -> Unit raise {
        let newc = x231
        let _ = x232
        @compute.add_conv(newc, compset)
      },
      convlist,
      (),
    )
  })
}

///|
let real_rat_compute_add_convs_c : @lib.Cell[(@compute.Compset) -> Unit raise] = @lib.Cell::new(
  "real_rat_compute_add_convs",
)

///|
/// `real_rat_compute_add_convs`
pub fn real_rat_compute_add_convs(x : @compute.Compset) -> Unit raise {
  real_rat_compute_add_convs_c.get()(x)
}

///|
/// REAL_RAT_COMPUTE_CONV
fn step_28() -> Unit raise {
  let cs = @compute.bool_compset(())
  let t233 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), t233)
  real_rat_compute_add_convs(cs)
  real_rat_compute_conv_c.set(@compute.weak_cbv_conv(cs))
}

///|
let real_rat_compute_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_RAT_COMPUTE_CONV",
)

///|
/// `REAL_RAT_COMPUTE_CONV`
pub fn real_rat_compute_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_rat_compute_conv_c.get()(x)
}

///|
let real_poly_neg_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_NEG_CONV",
)

///|
/// `REAL_POLY_NEG_CONV`
pub fn real_poly_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_neg_conv_c.get()(x)
}

///|
let real_poly_add_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_ADD_CONV",
)

///|
/// `REAL_POLY_ADD_CONV`
pub fn real_poly_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_add_conv_c.get()(x)
}

///|
let real_poly_sub_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_SUB_CONV",
)

///|
/// `REAL_POLY_SUB_CONV`
pub fn real_poly_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_sub_conv_c.get()(x)
}

///|
let real_poly_mul_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_MUL_CONV",
)

///|
/// `REAL_POLY_MUL_CONV`
pub fn real_poly_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_mul_conv_c.get()(x)
}

///|
let real_poly_pow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_POW_CONV",
)

///|
/// `REAL_POLY_POW_CONV`
pub fn real_poly_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_pow_conv_c.get()(x)
}

///|
let real_poly_conv_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_CONV",
)

///|
/// `REAL_POLY_CONV`
pub fn real_poly_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_conv_v1_c.get()(x)
}

///|
/// REAL_POLY_NEG_CONV, REAL_POLY_ADD_CONV, REAL_POLY_SUB_CONV, REAL_POLY_MUL_CONV, REAL_POLY_POW_CONV, REAL_POLY_CONV
fn step_29() -> Unit raise {
  let (
    real_poly_neg_conv,
    real_poly_add_conv,
    real_poly_sub_conv,
    real_poly_mul_conv,
    real_poly_pow_conv,
    real_poly_conv,
  ) = @normalizer.semiring_normalizers_conv(@realarith.real_poly_clauses())(
    @realarith.real_poly_neg_clauses(),
  )(
    (
      @calc_int.is_ratconst, real_rat_add_conv, real_rat_mul_conv, real_rat_pow_conv,
    ),
  )(fn(x234 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x235 : @kernel.Term) -> Bool raise { @lib.compare(x234, x235) < 0 }
  })
  real_poly_neg_conv_c.set(real_poly_neg_conv)
  real_poly_add_conv_c.set(real_poly_add_conv)
  real_poly_sub_conv_c.set(real_poly_sub_conv)
  real_poly_mul_conv_c.set(real_poly_mul_conv)
  real_poly_pow_conv_c.set(real_poly_pow_conv)
  real_poly_conv_v1_c.set(real_poly_conv)
}

///|
/// REAL_POLY_CONV
fn step_30() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let inv_tm = @term_syntax.parse_term("inv")
  let add_tm = @term_syntax.parse_term("real_add")
  let sub_tm = @term_syntax.parse_term("real_sub")
  let mul_tm = @term_syntax.parse_term("real_mul")
  let div_tm = @term_syntax.parse_term("op_slash")
  let pow_tm = @term_syntax.parse_term("pow")
  let abs_tm = @term_syntax.parse_term("abs")
  let max_tm = @term_syntax.parse_term("max")
  let min_tm = @term_syntax.parse_term("min")
  let div_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @realax.real_div(),
  )
  fn real_poly_conv_1(x236 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x236
    if !@kernel.is_comb(tm) || @calc_int.is_ratconst(tm) {
      @kernel.refl(tm)
    } else {
      let (lop, r) = @kernel.dest_comb(tm)
      if lop == neg_tm {
        let th1 = @equal.ap_term(lop, real_poly_conv_1(r))
        @kernel.trans(th1, real_poly_neg_conv(@kernel.rand(@kernel.concl(th1))))
      } else if lop == inv_tm {
        let th1_1 = @equal.ap_term(lop, real_poly_conv_1(r))
        let t237 = @kernel.rand(@kernel.concl(th1_1))
        @kernel.trans(th1_1, @equal.try_conv(real_rat_inv_conv)(t237))
      } else if lop == abs_tm {
        @equal.ap_term(lop, real_poly_conv_1(r))
      } else if !@kernel.is_comb(lop) {
        @kernel.refl(tm)
      } else {
        let (op, l) = @kernel.dest_comb(lop)
        if op == pow_tm {
          let th1_2 = @equal.ap_thm(@equal.ap_term(op, real_poly_conv_1(l)), r)
          let t238 = @kernel.rand(@kernel.concl(th1_2))
          @kernel.trans(th1_2, @equal.try_conv(real_poly_pow_conv)(t238))
        } else if op == add_tm || op == mul_tm || op == sub_tm {
          let t239 = real_poly_conv_1(r)
          let th1_3 = @kernel.mk_comb_rule(
            @equal.ap_term(op, real_poly_conv_1(l)),
            t239,
          )
          let fn_ : (@kernel.Term) -> @kernel.Thm raise = if op == add_tm {
            real_poly_add_conv
          } else if op == mul_tm {
            real_poly_mul_conv
          } else {
            real_poly_sub_conv
          }
          @kernel.trans(th1_3, fn_(@kernel.rand(@kernel.concl(th1_3))))
        } else if op == div_tm {
          let th1_4 = div_conv(tm)
          @kernel.trans(
            th1_4,
            real_poly_conv_1(@kernel.rand(@kernel.concl(th1_4))),
          )
        } else if op == min_tm || op == max_tm {
          let t240 = real_poly_conv_1(r)
          @kernel.mk_comb_rule(@equal.ap_term(op, real_poly_conv_1(l)), t240)
        } else {
          @kernel.refl(tm)
        }
      }
    }
  }
  real_poly_conv_c.set(real_poly_conv_1)
}

///|
let real_poly_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_POLY_CONV",
)

///|
/// `REAL_POLY_CONV`
pub fn real_poly_conv(x : @kernel.Term) -> @kernel.Thm raise {
  real_poly_conv_c.get()(x)
}

///|
let real_ring_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_RING",
)

///|
/// `REAL_RING`
pub fn real_ring(x : @kernel.Term) -> @kernel.Thm raise {
  real_ring_c.get()(x)
}

///|
let real_ideal_cofactors_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise,
] = @lib.Cell::new("real_ideal_cofactors")

///|
/// `real_ideal_cofactors`
pub fn real_ideal_cofactors(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
  real_ideal_cofactors_c.get()(x)
}

///|
/// REAL_RING, real_ideal_cofactors
fn step_31() -> Unit raise {
  let t245 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_entire())]),
  )
  let t244 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_sub_0())]),
  )
  let t241 = @equal.gsym(@realax.real_of_num_mul())
  let t242 = @equal.gsym(@realax.real_of_num_add())
  let t243 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_eq()), t242, t241]),
  )
  let t246 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@arith.mult_clauses(), @arith.eq_add_lcancel()]),
          ),
          t243,
        ),
        t244,
      ),
      t245,
    ),
    @real.real_arith_tac,
  )
  let real_integral = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Real, real_of_num(0) * x == real_of_num(0)) && (∀ x : Real, ∀ y : Real, ∀ z : Real, (x + y == x + z) == (y == z)) && (∀ w : Real, ∀ x : Real, ∀ y : Real, ∀ z : Real, (w * y + x * z == w * z + x * y) == (w == x || y == z))"),
    t246,
  )
  let t255 = @meson.meson_tac(
    @list.List([
      @real.real_mul_rinv(),
      @calc_int.real_mul_lzero(),
      @realarith.real_arith(@term_syntax.parse_term("!(real_of_num(1) == real_of_num(0))")),
    ]),
  )
  let t254 = @simp.gen_rewrite_tac(
    fn(
      x253 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x247 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s248 = @equal.land_conv(x247)
        fn(x249 : @kernel.Term) -> @kernel.Thm raise { s248(x249) }
      })(
        (fn(
          x250 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s251 = @equal.rand_conv(x250)
          fn(x252 : @kernel.Term) -> @kernel.Thm raise { s251(x252) }
        })(x253),
      )
    },
    @list.List([@equal.gsym(@realarith.real_sub_0())]),
  )
  let t256 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t254),
    t255,
  )
  let real_rabinowitsch = @tactics.prove(
    @term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(x == y) == (∃ z : Real, (x - y) * z == real_of_num(1))"),
    t256,
  )
  let init_ : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x257 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s258 = @equal.once_depth_conv(x257)
      fn(x259 : @kernel.Term) -> @kernel.Thm raise { s258(x259) }
    },
    @list.List([decimal()]),
  )
  let real_ty = @parser.parse_type("real")
  let t260 = @term_syntax.parse_term("pow")
  let t261 = @term_syntax.parse_term("op_slash")
  let t262 = @term_syntax.parse_term("real_mul")
  let t263 = @term_syntax.parse_term("inv")
  let t264 = @term_syntax.parse_term("real_sub")
  let t265 = @term_syntax.parse_term("real_add")
  let (pure_, ideal) = @grobner.ring_and_ideal_conv(
    (
      @calc_int.rat_of_term,
      @calc_int.term_of_rat,
      real_rat_eq_conv,
      @term_syntax.parse_term("op_minus_minus"),
      t265,
      t264,
      t263,
      t262,
      t261,
      t260,
      real_integral,
      real_rabinowitsch,
      real_poly_conv,
    ),
  )
  let (real_ring, real_ideal_cofactors) = (
    fn(x266 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x266
      let th = init_(tm)
      let t267 = pure_(@kernel.rand(@kernel.concl(th)))
      @kernel.eq_mp(@equal.sym(th), t267)
    },
    fn(
      x268 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
      let tms = x268
      fn(x269 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        let tm_1 = x269
        if @lib.forall(
            fn(x270 : @kernel.Term) -> Bool raise {
              let t = x270
              @kernel.type_of(t) == real_ty
            },
            tms.prepend(tm_1),
          ) {
          ideal(tms)(tm_1)
        } else {
          raise Failure("real_ideal_cofactors: not all terms have type :real")
        }
      }
    },
  )
  real_ring_c.set(real_ring)
  real_ideal_cofactors_c.set(real_ideal_cofactors)
}

///|
/// REAL_IDEAL_CONV
fn step_32() -> Unit raise {
  let t271 = @term_syntax.parse_term("real_add")
  let mk_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x274 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x275 : @kernel.Term) -> @kernel.Term raise {
      ((x272 : @kernel.Term, x273 : @kernel.Term) => {
        @basics.mk_binop(t271, x272, x273)
      })(x274, x275)
    }
  }
  let t276 = @term_syntax.parse_term("real_mul")
  let mk_mul : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x279 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x280 : @kernel.Term) -> @kernel.Term raise {
      ((x277 : @kernel.Term, x278 : @kernel.Term) => {
        @basics.mk_binop(t276, x277, x278)
      })(x279, x280)
    }
  }
  real_ideal_conv_c.set(fn(
    x281 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let tms = x281
    fn(x282 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x282
      let cfs = real_ideal_cofactors(tms)(tm)
      let tm_p = @lib.end_itlist(
        fn(x283 : @kernel.Term, x284 : @kernel.Term) -> @kernel.Term raise {
          let s285 = mk_add(x283)
          s285(x284)
        },
        @lib.map2(
          fn(x286 : @kernel.Term, x287 : @kernel.Term) -> @kernel.Term raise {
            let s288 = mk_mul(x286)
            s288(x287)
          },
          cfs,
          tms,
        ),
      )
      let th = real_poly_conv(tm)
      let th_p = real_poly_conv(tm_p)
      @kernel.trans(th, @equal.sym(th_p))
    }
  })
}

///|
let real_ideal_conv_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("REAL_IDEAL_CONV")

///|
/// `REAL_IDEAL_CONV`
pub fn real_ideal_conv(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  real_ideal_conv_c.get()(x)
}

///|
/// `GEN_REAL_ARITH`
pub fn gen_real_arith(
  x289 : (
    (
      (
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
        @list.List[@kernel.Thm],
      ),
    ) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise,
  ) -> ((
    (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm]),
  ) -> @kernel.Thm raise) raise,
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let prover = x289
  @realarith.gen_real_arith(
    (
      @calc_int.term_of_rat, real_rat_eq_conv, real_rat_ge_conv, real_rat_gt_conv,
      real_poly_conv, real_poly_neg_conv, real_poly_add_conv, real_poly_mul_conv,
      prover,
    ),
  )
}

///|
/// REAL_ARITH
fn step_33() -> Unit raise {
  let init_ : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x291 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s292 = @equal.once_depth_conv(x291)
      fn(x293 : @kernel.Term) -> @kernel.Thm raise { s292(x293) }
    },
    @list.List([decimal()]),
  )
  let pure_ : (@kernel.Term) -> @kernel.Thm raise = gen_real_arith(
    @realarith.real_linear_prover,
  )
  real_arith_c.set(fn(x294 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x294
    try {
      let th = init_(tm)
      let t295 = pure_(@kernel.rand(@kernel.concl(th)))
      @kernel.eq_mp(@equal.sym(th), t295)
    } catch {
      Failure(m) => {
        let t296 = "`: " + m
        raise Failure("REAL_ARITH `" + (@printer.string_of_term(tm) + t296))
      }
      e => raise e
    }
  })
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
/// REAL_ARITH_TAC
fn step_34() -> Unit raise {
  real_arith_tac_c.set(@tactics.conv_tac(real_arith))
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
/// ASM_REAL_ARITH_TAC
fn step_35() -> Unit raise {
  asm_real_arith_tac_c.set(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.first_x_assum(fn(
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
            let s298 = @tactics.mp_tac(x297)
            fn(
              x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s298(x299)
            }
          })(
            ((x305 : @kernel.Thm) => {
              @lib.check(
                fn(x304 : @kernel.Thm) -> Bool raise {
                  (fn(x302 : @kernel.Term) -> Bool raise {
                    (fn(x300 : Bool) -> Bool raise { !x300 })(
                      (fn(x301 : @kernel.Term) -> Bool raise {
                        @basics.is_forall(x301)
                      })(x302),
                    )
                  })(
                    (fn(x303 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x303)
                    })(x304),
                  )
                },
                x305,
              )
            })(x306),
          )
        }),
      ),
      real_arith_tac,
    ),
  )
}

///|
let asm_real_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "ASM_REAL_ARITH_TAC",
)

///|
/// `ASM_REAL_ARITH_TAC`
pub fn asm_real_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  asm_real_arith_tac_c.get()(x)
}

///|
/// REAL_LE_TRANS_LE
fn step_36() -> Unit raise {
  let t307 = @meson.meson_tac(
    @list.List([@realax.real_le_trans(), @realax.real_le_refl()]),
  )
  real_le_trans_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= y) == (∀ z : Real, y <= z → x <= z)"),
      t307,
    ),
  )
}

///|
let real_le_trans_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_TRANS_LE",
)

///|
/// `REAL_LE_TRANS_LE`
pub fn real_le_trans_le() -> @kernel.Thm {
  real_le_trans_le_c.get()
}

///|
/// REAL_LE_TRANS_LTE
fn step_37() -> Unit raise {
  let t311 = @term_syntax.parse_term("(y : Real) + ((x : Real) - y) / real_of_num(2)")
  let t314 = @tactics.disch_then(fn(
    x313 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
      let s309 = @tactics.mp_tac(x308)
      fn(
        x310 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s309(x310)
      }
    })(((x312 : @kernel.Thm) => @bool.spec(t311, x312))(x313))
  })
  let t315 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        @list.List([real_arith_tac, @tactics.all_tac]),
      ),
      t314,
    ),
    real_arith_tac,
  )
  real_le_trans_lte_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= y) == (∀ z : Real, y < z → x <= z)"),
      t315,
    ),
  )
}

///|
let real_le_trans_lte_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_TRANS_LTE",
)

///|
/// `REAL_LE_TRANS_LTE`
pub fn real_le_trans_lte() -> @kernel.Thm {
  real_le_trans_lte_c.get()
}

///|
/// REAL_LE_TRANS_LT
fn step_38() -> Unit raise {
  let t319 = @term_syntax.parse_term("(y : Real) + ((x : Real) - y) / real_of_num(2)")
  let t322 = @tactics.disch_then(fn(
    x321 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x316 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s317 = @tactics.mp_tac(x316)
      fn(
        x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s317(x318)
      }
    })(((x320 : @kernel.Thm) => @bool.spec(t319, x320))(x321))
  })
  let t323 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        @list.List([real_arith_tac, @tactics.all_tac]),
      ),
      t322,
    ),
    real_arith_tac,
  )
  real_le_trans_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= y) == (∀ z : Real, y < z → x < z)"),
      t323,
    ),
  )
}

///|
let real_le_trans_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_TRANS_LT",
)

///|
/// `REAL_LE_TRANS_LT`
pub fn real_le_trans_lt() -> @kernel.Thm {
  real_le_trans_lt_c.get()
}

///|
/// REAL_FIELD
fn step_39() -> Unit raise {
  let t333 = @simp.rewr_conv(@equal.gsym(@real.real_pow_inv()))
  let norm_net = @lib.itlist(
    fn(
      x328 : @kernel.Thm,
      x329 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      (fn(
        x326 : @kernel.Thm,
      ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
        @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
      ] raise) raise {
        fn(
          x327 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
        ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
          ((
            x324 : @kernel.Thm,
            x325 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
          ) => @simp.net_of_thm(false, x324, x325))(x326, x327)
        }
      })(@bool.spec_all(x328))(x329)
    },
    @list.List([
      @theorems.forall_simp(),
      @theorems.exists_simp(),
      @realax.real_div(),
      @real.real_inv_inv(),
      @real.real_inv_mul(),
      @real.real_pow_add(),
    ]),
    @simp.net_of_conv(
      @term_syntax.parse_term("inv(pow((x : Real), (n : Num)))"),
      fn(x334 : @kernel.Term) -> @kernel.Thm raise {
        t333(
          ((x332 : @kernel.Term) => {
            @lib.check(
              fn(x331 : @kernel.Term) -> Bool raise {
                (fn(x330 : @kernel.Term) -> Bool raise {
                  @nums.is_numeral(@kernel.rand(x330))
                })(@kernel.rand(x331))
              },
              x332,
            )
          })(x334),
        )
      },
      @nets.empty_net(),
    ),
  )
  let t339 = @simp.gen_rewrite_conv(
    fn(
      x338 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x338
    },
    @list.List([@class.taut(@term_syntax.parse_term("(true → (p : Bool)) == p"))]),
  )
  let t340 = @equal.try_conv(
    @equal.thenc(@equal.land_conv(real_rat_reduce_conv), t339),
  )
  let easy_nz_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.land_conv(
      @simp.gen_rewrite_conv(
        fn(
          x335 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s336 = @equal.try_conv(x335)
          fn(x337 : @kernel.Term) -> @kernel.Thm raise { s336(x337) }
        },
        @list.List([
          @meson.meson(
            @list.List([@real.real_pow_eq_0(), @realax.real_of_num_eq()]),
            @term_syntax.parse_term("!(pow((x : Real), (n : Num)) == real_of_num(0)) == (!(x == real_of_num(0)) || real_of_num(n) == real_of_num(0) || !(pow(x, n) == real_of_num(0)))"),
          ),
        ]),
      ),
    ),
    t340,
  )
  let t343 = @simp.once_rewrite_conv(
    @list.List([real_arith(@term_syntax.parse_term("((x : Real) < (y : Real)) == (x < y && !(x == y))"))]),
  )
  let t342 = @equal.depth_binop_conv(
    @term_syntax.parse_term("op_slash_bslash"),
    @canon.conds_celim_conv,
  )
  let t341 = @equal.top_depth_conv(@simp.rewrites_conv(norm_net))
  let prenex_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @equal.top_depth_conv(@equal.beta_conv),
              @calc_num.num_reduce_conv,
            ),
            t341,
          ),
          @canon.nnfc_conv,
        ),
        t342,
      ),
      @canon.prenex_conv,
    ),
    t343,
  )
  let setup_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(@canon.nnf_conv, @canon.weak_cnf_conv),
    @canon.conj_canon_conv,
  )
  let core_rule : (@kernel.Term) -> @kernel.Thm raise = fn(
    x344 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let t = x344
    real_ring(t) catch {
      Failure(_) => real_arith(t)
      e => raise e
    }
  }
  let inv_tm = @term_syntax.parse_term("inv")
  let t345 = @term_syntax.parse_term("op_slash")
  let is_div : (@kernel.Term) -> Bool raise = fn(
    x347 : @kernel.Term,
  ) -> Bool raise {
    ((x346 : @kernel.Term) => @basics.is_binop(t345, x346))(x347)
  }
  let is_inv : (@kernel.Term) -> Bool raise = fn(
    x348 : @kernel.Term,
  ) -> Bool raise {
    let tm = x348
    (is_div(tm) || (@kernel.is_comb(tm) && @kernel.rator(tm) == inv_tm)) &&
    !@calc_int.is_ratconst(@kernel.rand(tm))
  }
  let basic_real_field : (@kernel.Term) -> @kernel.Thm raise = fn(
    x349 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x349
    let is_freeinv : (@kernel.Term) -> Bool raise = fn(
      x350 : @kernel.Term,
    ) -> Bool raise {
      let t_1 = x350
      is_inv(t_1) && @basics.free_in(t_1, tm_1)
    }
    let itms = @lib.setify(
      @lib.map(@kernel.rand, @basics.find_terms(is_freeinv, tm_1)),
    )
    let hyps = @lib.map(
      fn(x351 : @kernel.Term) -> @kernel.Thm raise {
        let t_2 = x351
        @equal.conv_rule(easy_nz_conv, @bool.spec(t_2, @real.real_mul_rinv()))
      },
      itms,
    )
    let tm_p = @lib.itlist(
      fn(x352 : @kernel.Thm, x353 : @kernel.Term) -> @kernel.Term raise {
        let th = x352
        let t_3 = x353
        @bool.mk_imp(@kernel.concl(th), t_3)
      },
      hyps,
      tm_1,
    )
    let th1 = setup_conv(tm_p)
    let cjs = @basics.conjuncts(@kernel.rand(@kernel.concl(th1)))
    let ths = @lib.map(core_rule, cjs)
    let t354 = @lib.end_itlist(@bool.conj, ths)
    let th2 = @kernel.eq_mp(@equal.sym(th1), t354)
    @lib.rev_itlist(
      fn(x357 : @kernel.Thm, x358 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x355 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          fn(x356 : @kernel.Thm) -> @kernel.Thm raise { @bool.mp(x355, x356) }
        })(x358)(x357)
      },
      hyps,
      th2,
    )
  }
  real_field_c.set(fn(x359 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x359
    let th0 = prenex_conv(tm_2)
    let tm0 = @kernel.rand(@kernel.concl(th0))
    let (avs, bod) = @basics.strip_forall(tm0)
    let th1_1 = setup_conv(bod)
    let ths_1 = @lib.map(
      basic_real_field,
      @basics.conjuncts(@kernel.rand(@kernel.concl(th1_1))),
    )
    let t360 = @lib.end_itlist(@bool.conj, ths_1)
    let t361 = @bool.genl(avs, @kernel.eq_mp(@equal.sym(th1_1), t360))
    @kernel.eq_mp(@equal.sym(th0), t361)
  })
}

///|
let real_field_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_FIELD",
)

///|
/// `REAL_FIELD`
pub fn real_field(x : @kernel.Term) -> @kernel.Thm raise {
  real_field_c.get()(x)
}

///|
/// REAL_SHRINK_RANGE
fn step_40() -> Unit raise {
  let t362 = @simp.simp_tac(
    @list.List([
      @real.real_lt_ldiv_eq(),
      real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + abs((x : Real))")),
    ]),
  )
  let t363 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([
            @real.real_abs_div(),
            real_arith(@term_syntax.parse_term("abs(real_of_num(1) + abs((x : Real))) == real_of_num(1) + abs(x)")),
          ]),
        ),
      ),
      t362,
    ),
    real_arith_tac,
  )
  real_shrink_range_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(x / (real_of_num(1) + abs(x))) < real_of_num(1)"), t363),
  )
}

///|
let real_shrink_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SHRINK_RANGE",
)

///|
/// `REAL_SHRINK_RANGE`
pub fn real_shrink_range() -> @kernel.Thm {
  real_shrink_range_c.get()
}

///|
/// REAL_SHRINK_LT
fn step_41() -> Unit raise {
  let t375 = @simp.simp_tac(
    @list.List([
      @real.real_lt_ldiv_eq(),
      real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + abs((x : Real))")),
    ]),
  )
  let t374 = @simp.once_rewrite_tac(
    @list.List([real_arith(@term_syntax.parse_term("(a : Real) / (b : Real) * (c : Real) == a * c / b"))]),
  )
  let t373 = @simp.simp_tac(
    @list.List([
      @real.real_lt_rdiv_eq(),
      real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + abs((x : Real))")),
    ]),
  )
  let t372 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_div(),
      real_arith(@term_syntax.parse_term("abs(real_of_num(1) + abs((x : Real))) == real_of_num(1) + abs(x)")),
    ]),
  )
  let t371 = @tactics.repeat_tac(@tactics.gen_tac)
  let t370 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) && P(y, x)) == (∀ x : _, ∀ y : _, P(x, y))"),
      ),
    ]),
  )
  let t368 = @term_syntax.parse_term("(x : Real)")
  let t369 = @tactics.map_every(
    fn(
      x366 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x366
      @tactics.spec_tac(t, t)
    },
    @list.List([@term_syntax.parse_term("(y : Real)"), t368]),
  )
  let t365 = @simp.simp_tac(
    @list.List([
      @real.real_lt_rdiv_eq(),
      real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + abs((x : Real))")),
      @calc_int.real_mul_lzero(),
    ]),
  )
  let t364 = @tactics.match_mp_tac(
    real_arith(
      @term_syntax.parse_term("(real_of_num(0) < (x' : Real)) == (real_of_num(0) < (x : Real)) && (real_of_num(0) < (y' : Real)) == (real_of_num(0) < (y : Real)) && (abs(x') < abs(y')) == (abs(x) < abs(y)) && (abs(y') < abs(x')) == (abs(y) < abs(x)) → (x' < y') == (x < y)"),
    ),
  )
  let t376 = @tactics.then_tac(
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
                      t364,
                    ),
                    t365,
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
        t374,
      ),
      t375,
    ),
    real_arith_tac,
  )
  real_shrink_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / (real_of_num(1) + abs(x)) < y / (real_of_num(1) + abs(y))) == (x < y)"),
      t376,
    ),
  )
}

///|
let real_shrink_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SHRINK_LT")

///|
/// `REAL_SHRINK_LT`
pub fn real_shrink_lt() -> @kernel.Thm {
  real_shrink_lt_c.get()
}

///|
/// REAL_SHRINK_LE
fn step_42() -> Unit raise {
  let t377 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realarith.real_not_lt()), real_shrink_lt()]),
  )
  real_shrink_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / (real_of_num(1) + abs(x)) <= y / (real_of_num(1) + abs(y))) == (x <= y)"),
      t377,
    ),
  )
}

///|
let real_shrink_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SHRINK_LE")

///|
/// `REAL_SHRINK_LE`
pub fn real_shrink_le() -> @kernel.Thm {
  real_shrink_le_c.get()
}

///|
/// REAL_SHRINK_EQ
fn step_43() -> Unit raise {
  let t378 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_le_antisym()), real_shrink_le()]),
  )
  real_shrink_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / (real_of_num(1) + abs(x)) == y / (real_of_num(1) + abs(y))) == (x == y)"),
      t378,
    ),
  )
}

///|
let real_shrink_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SHRINK_EQ")

///|
/// `REAL_SHRINK_EQ`
pub fn real_shrink_eq() -> @kernel.Thm {
  real_shrink_eq_c.get()
}

///|
/// REAL_SHRINK_GALOIS
fn step_44() -> Unit raise {
  let t393 = @tactics.conv_tac(real_field)
  let t392 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x389 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s390 = @tactics.mp_tac(x389)
      fn(
        x391 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s390(x391)
      }
    }),
  )
  let t388 = @tactics.match_mp_tac(
    real_field(@term_syntax.parse_term("(x : Real) * (y : Real) == real_of_num(1) → inv(x) * inv(y) == real_of_num(1)")),
  )
  let t387 = @tactics.match_mp_tac(
    real_arith(
      @term_syntax.parse_term("(x : Real) * (inv((y : Real)) * inv((z : Real))) == x * real_of_num(1) → x / y / z == x"),
    ),
  )
  let t385 = real_arith(
    @term_syntax.parse_term("abs((y : Real)) < real_of_num(1) → abs(real_of_num(1) - abs(y)) == real_of_num(1) - abs(y)"),
  )
  let t386 = @simp.asm_simp_tac(
    @list.List([
      @real.real_abs_div(),
      real_arith(@term_syntax.parse_term("abs(real_of_num(1) + abs((x : Real))) == real_of_num(1) + abs(x)")),
      t385,
    ]),
  )
  let t384 = @simp.asm_rewrite_tac(@list.List([real_shrink_range()]))
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
      x379 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s380 = @tactics.subst1_tac(x379)
      fn(
        x381 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s380(x381)
      }
    })(@equal.sym(x382))
  })
  let t394 = @tactics.then_tac(
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
                      @tactics.eq_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t383,
                ),
                t384,
              ),
              t386,
            ),
            t387,
          ),
          @tactics.ap_term_tac,
        ),
        t388,
      ),
      t392,
    ),
    t393,
  )
  real_shrink_galois_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x / (real_of_num(1) + abs(x)) == y) == (abs(y) < real_of_num(1) && y / (real_of_num(1) - abs(y)) == x)"),
      t394,
    ),
  )
}

///|
let real_shrink_galois_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SHRINK_GALOIS",
)

///|
/// `REAL_SHRINK_GALOIS`
pub fn real_shrink_galois() -> @kernel.Thm {
  real_shrink_galois_c.get()
}

///|
/// REAL_GROW_SHRINK
fn step_45() -> Unit raise {
  let t395 = @meson.meson_tac(
    @list.List([real_shrink_galois(), real_shrink_range()]),
  )
  real_grow_shrink_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, x / (real_of_num(1) + abs(x)) / (real_of_num(1) - abs(x / (real_of_num(1) + abs(x)))) == x"),
      t395,
    ),
  )
}

///|
let real_grow_shrink_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_GROW_SHRINK",
)

///|
/// `REAL_GROW_SHRINK`
pub fn real_grow_shrink() -> @kernel.Thm {
  real_grow_shrink_c.get()
}

///|
/// REAL_SHRINK_GROW_EQ
fn step_46() -> Unit raise {
  let t396 = @meson.meson_tac(
    @list.List([real_shrink_galois(), real_shrink_range()]),
  )
  real_shrink_grow_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, (x / (real_of_num(1) - abs(x)) / (real_of_num(1) + abs(x / (real_of_num(1) - abs(x)))) == x) == (abs(x) < real_of_num(1))"),
      t396,
    ),
  )
}

///|
let real_shrink_grow_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SHRINK_GROW_EQ",
)

///|
/// `REAL_SHRINK_GROW_EQ`
pub fn real_shrink_grow_eq() -> @kernel.Thm {
  real_shrink_grow_eq_c.get()
}

///|
/// REAL_SHRINK_GROW
fn step_47() -> Unit raise {
  let t397 = @simp.rewrite_tac(@list.List([real_shrink_grow_eq()]))
  real_shrink_grow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, abs(x) < real_of_num(1) → x / (real_of_num(1) - abs(x)) / (real_of_num(1) + abs(x / (real_of_num(1) - abs(x)))) == x"),
      t397,
    ),
  )
}

///|
let real_shrink_grow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_SHRINK_GROW",
)

///|
/// `REAL_SHRINK_GROW`
pub fn real_shrink_grow() -> @kernel.Thm {
  real_shrink_grow_c.get()
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
}
