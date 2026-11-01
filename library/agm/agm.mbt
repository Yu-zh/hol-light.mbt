// Translated from upstream Library/agm.ml; edit this file directly.

///|
/// Library/agm.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// FORALL_2
fn step_2() -> Unit raise {
  let t1 = @meson.meson_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(1 <= (i : Num) && i <= 2) == (i == 1 || i == 2)"),
      ),
    ]),
  )
  forall_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ i : Num, 1 <= i && i <= 2 → P(i)) == (P(1) && P(2))"),
      t1,
    ),
  )
}

///|
let forall_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_2")

///|
/// `FORALL_2`
pub fn forall_2() -> @kernel.Thm {
  forall_2_c.get()
}

///|
/// NUMSEG_2
fn step_3() -> Unit raise {
  let t2 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_insert(),
        @sets.not_in_empty(),
        @iterate.in_numseg(),
      ]),
    ),
    @int.arith_tac,
  )
  numseg_2_c.set(@tactics.prove(@term_syntax.parse_term("op_dot_dot(1, 2) == {1, 2}"), t2))
}

///|
let numseg_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_2")

///|
/// `NUMSEG_2`
pub fn numseg_2() -> @kernel.Thm {
  numseg_2_c.get()
}

///|
/// AGM_2
fn step_4() -> Unit raise {
  let t3 = @simp.rewrite_tac(
    @list.List([
      @realarith.real_le_square(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) * (y : Real) <= pow((x + y) / real_of_num(2), 2)) == (real_of_num(0) <= (x - y) * (x - y))"),
      ),
    ]),
  )
  agm_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, x * y <= pow((x + y) / real_of_num(2), 2)"),
      t3,
    ),
  )
}

///|
let agm_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AGM_2")

///|
/// `AGM_2`
pub fn agm_2() -> @kernel.Thm {
  agm_2_c.get()
}

///|
/// SUM_SPLIT_2
fn step_5() -> Unit raise {
  let t4 = @simp.simp_tac(
    @list.List([
      @arith.mult_2(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1")),
      @iterate.sum_add_split(),
    ]),
  )
  sum_split_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("sum(op_dot_dot(1, 2 * (n : Num)), (f : (Num) -> Real)) == sum(op_dot_dot(1, n), f) + sum(op_dot_dot(n + 1, 2 * n), f)"),
      t4,
    ),
  )
}

///|
let sum_split_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_SPLIT_2")

///|
/// `SUM_SPLIT_2`
pub fn sum_split_2() -> @kernel.Thm {
  sum_split_2_c.get()
}

///|
/// PRODUCT_SPLIT_2
fn step_6() -> Unit raise {
  let t5 = @simp.simp_tac(
    @list.List([
      @arith.mult_2(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1")),
      @products.product_add_split(),
    ]),
  )
  product_split_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("product(op_dot_dot(1, 2 * (n : Num)), (f : (Num) -> Real)) == product(op_dot_dot(1, n), f) * product(op_dot_dot(n + 1, 2 * n), f)"),
      t5,
    ),
  )
}

///|
let product_split_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRODUCT_SPLIT_2",
)

///|
/// `PRODUCT_SPLIT_2`
pub fn product_split_2() -> @kernel.Thm {
  product_split_2_c.get()
}

///|
/// CAUCHY_INDUCT
fn step_7() -> Unit raise {
  let t27 = @int.arith_rule(@term_syntax.parse_term("SUC(2 * (m : Num)) + 1 == 2 * (m + 1)"))
  let t28 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("SUC(2 * (m : Num)) == 1 || m + 1 < SUC(2 * m)"),
      ),
      t27,
    ]),
  )
  let t26 = @simp.simp_tac(
    @list.List([@arith.odd_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t23 = @simp.gen_rewrite_rule(
    fn(
      x22 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x22
    },
    @list.List([@arith.not_even()]),
  )
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
      x19 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s20 = @tactics.mp_tac(x19)
      fn(
        x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s20(x21)
      }
    })(t23(x24))
  })
  let t17 = @meson.asm_meson_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 * (n : Num) == 0 || n < 2 * n"))]),
  )
  let t15 = @simp.gen_rewrite_rule(
    fn(
      x14 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x14
    },
    @list.List([@arith.even_exists()]),
  )
  let t18 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
        x16 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x11 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s12 = @tactics.mp_tac(x11)
          fn(
            x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s12(x13)
          }
        })(t15(x16))
      }),
      t17,
    ),
    @tactics.all_tac,
  ])
  let t10 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t9 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("1 == 0 + 1 && 2 == 1 + 1")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t8 = @tactics.subgoal_then(
    @term_syntax.parse_term("(P : (Num) -> Bool)(0) && P(1)"),
    @tactics.strip_assume_tac,
  )
  let t7 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t6 = @tactics.match_mp_tac(@arith.num_wf())
  let t29 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
                      t6,
                    ),
                    t7,
                  ),
                  @tactics.disch_tac,
                ),
                t8,
              ),
              t9,
            ),
            t10,
          ),
          t18,
        ),
        t25,
      ),
      t26,
    ),
    t28,
  )
  cauchy_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(2) && (∀ n : Num, P(n) → P(2 * n)) && (∀ n : Num, P(n + 1) → P(n)) → (∀ n : Num, P(n))"),
      t29,
    ),
  )
}

///|
let cauchy_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_INDUCT")

///|
/// `CAUCHY_INDUCT`
pub fn cauchy_induct() -> @kernel.Thm {
  cauchy_induct_c.get()
}

///|
/// AGM
fn step_8() -> Unit raise {
  let t141 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      @calc_int.real_mul_rzero(),
      @realax.real_le_refl(),
    ]),
  )
  let t140 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_pow(),
      @calc_int.real_mul_lzero(),
      @products.product_clauses_numseg(),
    ]),
  )
  let t139 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x136 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s137 = @tactics.subst_all_tac(x136)
      fn(
        x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s137(x138)
      }
    }),
  )
  let t135 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 + (n : Num) == SUC(n)"))]),
  )
  let t132 = @simp.gen_rewrite_rule(
    fn(
      x131 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x131
    },
    @list.List([@arith.le_exists()]),
  )
  let t134 = @tactics.first_x_assum(fn(
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
      x128 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s129 = @tactics.mp_tac(x128)
      fn(
        x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s129(x130)
      }
    })(t132(x133))
  })
  let t127 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t123 = @term_syntax.parse_term("(n : Num)")
  let t126 = @tactics.disch_then(fn(
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
    })(((x124 : @kernel.Thm) => @bool.spec(t123, x124))(x125))
  })
  let t119 = @simp.asm_simp_tac(@list.List([]))
  let t116 = @term_syntax.parse_term("(n : Num)")
  let t117 = @term_syntax.parse_term("1")
  let t118 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : (Num) -> Real)"), t117, t116]),
      @iterate.sum_pos_eq_0_numseg(),
    ),
  )
  let t115 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t113 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → !(n == 0)"))]),
  )
  let t112 = @simp.rewrite_tac(
    @list.List([
      @realax.real_div(),
      @realarith.real_entire(),
      @real.real_inv_eq_0(),
      @realax.real_of_num_eq(),
    ]),
  )
  let t111 = @simp.expand_tac("A")
  let t109 = @simp.asm_simp_tac(
    @list.List([
      @iterate.sum_pos_le(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  let t108 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t107 = @tactics.match_mp_tac(@real.real_le_div())
  let t106 = @simp.expand_tac("A")
  let t105 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt()]))
  let t104 = @equal.gsym(@realarith.real_not_lt())
  let t110 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.asm_rewrite_tac(
                @list.List([@equal.gsym(@realax.real_le_antisym()), t104]),
              ),
              t105,
            ),
            t106,
          ),
          t107,
        ),
        t108,
      ),
      t109,
    ),
    @tactics.all_tac,
  ])
  let t103 = @tactics.subgoal_then(@term_syntax.parse_term("(A : Real) == real_of_num(0)"), fn(
    x100 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s101 = @tactics.mp_tac(x100)
    fn(
      x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s101(x102)
    }
  })
  let t99 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t98 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (A : Real)"))
  let t97 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow()]))
  let t96 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t94 = @calc_rat.real_field(
    @term_syntax.parse_term("real_of_num(1) <= real_of_num((n : Num)) → ((s : Real) + s / real_of_num(n)) / (real_of_num(n) + real_of_num(1)) == s / real_of_num(n)"),
  )
  let t95 = @simp.simp_tac(
    @list.List([
      @realax.real_of_num_le(),
      @kernel.assume_rule(@term_syntax.parse_term("1 <= (n : Num)")),
      t94,
    ]),
  )
  let t93 = @simp.expand_tac("A")
  let t92 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_of_num_suc())]),
  )
  let t91 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num)) && !(SUC(n) <= n)")),
    ]),
  )
  let t90 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@arith.add1()),
      @products.product_clauses_numseg(),
      @iterate.sum_clauses_numseg(),
    ]),
  )
  let t89 = @simp.abbrev_tac(@term_syntax.parse_term("(A : Real) == sum(op_dot_dot(1, (n : Num)), (a : (Num) -> Real)) / real_of_num(n)"))
  let t87 = @simp.asm_simp_tac(
    @list.List([
      @iterate.sum_pos_le(),
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
    ]),
  )
  let t86 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t85 = @tactics.match_mp_tac(@real.real_le_div())
  let t84 = @simp.asm_simp_tac(@list.List([]))
  let t88 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.strip_tac),
              @class.cond_cases_tac,
            ),
            t84,
          ),
          t85,
        ),
        t86,
      ),
      t87,
    ),
    @tactics.all_tac,
  ])
  let t83 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]),
  )
  let t79 = @term_syntax.parse_term("(i : Num) => if i <= (n : Num) { (a : (Num) -> Real)(i) } else { sum(op_dot_dot(1, n), a) / real_of_num(n) }")
  let t82 = @tactics.first_x_assum(fn(
    x81 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x76 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s77 = @tactics.mp_tac(x76)
      fn(
        x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s77(x78)
      }
    })(((x80 : @kernel.Thm) => @bool.spec(t79, x80))(x81))
  })
  let t75 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : (Num) -> Real)"))
  let t142 = @tactics.then_tac(
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
                                                                      @tactics.x_gen_tac(
                                                                        @term_syntax.parse_term("(n : Num)"),
                                                                      ),
                                                                      @tactics.disch_tac,
                                                                    ),
                                                                    t75,
                                                                  ),
                                                                  @tactics.strip_tac,
                                                                ),
                                                                t82,
                                                              ),
                                                              t83,
                                                            ),
                                                            @tactics.ants_tac,
                                                          ),
                                                          t88,
                                                        ),
                                                        t89,
                                                      ),
                                                      t90,
                                                    ),
                                                    t91,
                                                  ),
                                                  t92,
                                                ),
                                                t93,
                                              ),
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
                                    t103,
                                  ),
                                  t110,
                                ),
                                t111,
                              ),
                              t112,
                            ),
                            t113,
                          ),
                          @tactics.disch_tac,
                        ),
                        t115,
                      ),
                      t118,
                    ),
                    t119,
                  ),
                  t126,
                ),
                t127,
              ),
              @tactics.disch_tac,
            ),
            t134,
          ),
          t135,
        ),
        t139,
      ),
      t140,
    ),
    t141,
  )
  let t74 = @tactics.pop_assum_list(fn(
    x73 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x69 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s70 = @tactics.mp_tac(x69)
      fn(
        x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s70(x71)
      }
    })(
      ((x72 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x72))(x73),
    )
  })
  let t68 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t67 = @tactics.repeat_tac(@tactics.strip_tac)
  let t66 = @simp.rewrite_tac(
    @list.List([@iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  let t65 = @tactics.match_mp_tac(@iterate.sum_pos_le())
  let t64 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t63 = @tactics.match_mp_tac(@real.real_le_div())
  let t62 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t61 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_div()), agm_2()]),
  )
  let t60 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) + (y : Real)) * ((a : Real) * (b : Real)) == (x * a + y * a) * b"),
      ),
    ]),
  )
  let t59 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), @real.real_inv_mul()]),
  )
  let t58 = @tactics.subst1_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * real_of_num((n : Num)) == real_of_num(n) * real_of_num(2)")),
  )
  let t57 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_of_num_mul())]),
  )
  let t56 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t54 = @equal.gsym(@real.real_pow_pow())
  let t55 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@real.real_pow_mul()), t54]),
  )
  let t47 = @int.arith_rule(@term_syntax.parse_term("1 <= 2 * (n : Num) → 1 <= n"))
  let t48 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("1 <= (i : Num) && i <= (n : Num) → 1 <= i + n && i + n <= 2 * n"),
      ),
      t47,
    ]),
  )
  let t46 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t45 = @simp.rewrite_tac(
    @list.List([@products.product_offset(), @iterate.sum_offset()]),
  )
  let t44 = @simp.rewrite_tac(@list.List([@arith.mult_2()]))
  let t49 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([@arith.add_sym()])),
          t44,
        ),
        t45,
      ),
      t46,
    ),
    t48,
  )
  let t43 = @meson.asm_meson_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 <= (i : Num) → 1 <= i"))]),
  )
  let t42 = @simp.rewrite_tac(
    @list.List([@iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  let t50 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@products.product_pos_le()), t42),
    t43,
  )
  let t40 = @int.arith_rule(@term_syntax.parse_term("1 <= 2 * (n : Num) → 1 <= n"))
  let t41 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (n : Num) → i <= 2 * n")),
      t40,
    ]),
  )
  let t51 = @tactics.then_tac(
    @tactics.first_x_assum(@tactics.match_mp_tac),
    t41,
  )
  let t39 = @meson.asm_meson_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) <= (n : Num) → i <= 2 * n"))]),
  )
  let t38 = @simp.rewrite_tac(
    @list.List([@iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  let t52 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@products.product_pos_le()), t38),
      t39,
    ),
    t51,
    t50,
    t49,
  ])
  let t37 = @tactics.repeat_tac(@tactics.conj_tac)
  let t53 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@tactics.match_mp_tac(@real.real_le_mul2()), t37),
      t52,
    ),
    @tactics.all_tac,
  ])
  let t36 = @tactics.exists_tac(
    @term_syntax.parse_term("pow(sum(op_dot_dot(1, (n : Num)), (a : (Num) -> Real)) / real_of_num(n), n) * pow(sum(op_dot_dot(n + 1, 2 * n), a) / real_of_num(n), n)"),
  )
  let t35 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t34 = @simp.rewrite_tac(@list.List([sum_split_2(), product_split_2()]))
  let t33 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : (Num) -> Real)"))
  let t143 = @tactics.then_tac(
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
                                                  @tactics.then_tac(
                                                    @tactics.x_gen_tac(
                                                      @term_syntax.parse_term("(n : Num)"),
                                                    ),
                                                    @tactics.disch_tac,
                                                  ),
                                                  t33,
                                                ),
                                                @tactics.strip_tac,
                                              ),
                                              t34,
                                            ),
                                            t35,
                                          ),
                                          t36,
                                        ),
                                        @tactics.conj_tac,
                                      ),
                                      t53,
                                    ),
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
                        t61,
                      ),
                      t62,
                    ),
                    @tactics.conj_tac,
                  ),
                  t63,
                ),
                t64,
              ),
              t65,
            ),
            t66,
          ),
          t67,
        ),
        t68,
      ),
      t74,
    ),
    @int.arith_tac,
  )
  let t32 = @simp.rewrite_tac(@list.List([agm_2()]))
  let t31 = @simp.simp_tac(
    @list.List([
      @iterate.sum_clauses(),
      @iterate.product_clauses(),
      @sets.finite_rules(),
      @sets.in_insert(),
      @sets.not_in_empty(),
      @calc_num.arith(),
      @realarith.real_mul_rid(),
      @calc_int.real_add_rid(),
    ]),
  )
  let t144 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([forall_2(), numseg_2()])),
        t31,
      ),
      t32,
    ),
    t143,
    t142,
  ])
  let t30 = @tactics.repeat_tac(@tactics.conj_tac)
  let t145 = @tactics.thenl(
    @tactics.then_tac(@tactics.match_mp_tac(cauchy_induct()), t30),
    t144,
  )
  agm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : (Num) -> Real, 1 <= n && (∀ i : Num, 1 <= i && i <= n → real_of_num(0) <= a(i)) → product(op_dot_dot(1, n), a) <= pow(sum(op_dot_dot(1, n), a) / real_of_num(n), n)"),
      t145,
    ),
  )
}

///|
let agm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AGM")

///|
/// `AGM`
pub fn agm() -> @kernel.Thm {
  agm_c.get()
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
}
