// Translated from upstream Library/rabin_test.ml; edit this file directly.

///|
/// RING_DIVIDES_POW_ITERATE
fn step_1() -> Unit raise {
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @simp.asm_rewrite_tac(@list.List([]))
  let t33 = @tactics.match_mp_tac(@ringtheory.ring_divides_sub_pow())
  let t32 = @simp.asm_rewrite_tac(@list.List([]))
  let t31 = @tactics.exists_tac(
    @term_syntax.parse_term("ring_sub((r : Ring[A]), ring_pow(r, (x : A), EXP((m : Num), (k : Num))), x)"),
  )
  let t36 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(@ringtheory.ring_divides_trans()),
              t31,
            ),
            t32,
          ),
          t33,
        ),
        t34,
      ),
      @int.asm_arith_tac,
    ),
    t35,
  ])
  let t30 = @tactics.match_mp_tac(@ringtheory.ring_divides_add())
  let t28 = @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_v1()]))
  let t29 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@equal.gsym(@ringtheory.ring_sub_telescope())),
      t28,
    ),
    @tactics.all_tac,
  ])
  let t27 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_sub((r : Ring[A]), ring_pow(r, ring_pow(r, (x : A), EXP((m : Num), (k : Num))), m), x) == ring_add(r, ring_sub(r, ring_pow(r, ring_pow(r, x, EXP(m, k)), m), ring_pow(r, x, m)), ring_sub(r, ring_pow(r, x, m), x))"),
    fn(
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
      let s25 = @tactics.subst1_tac(x24)
      fn(
        x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s25(x26)
      }
    },
  )
  let t22 = @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_pow()]))
  let t21 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t23 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.exp()])), t21),
      t22,
    ),
    @tactics.all_tac,
  ])
  let t20 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_pow((r : Ring[A]), (x : A), EXP((m : Num), SUC((k : Num)))) == ring_pow(r, ring_pow(r, x, EXP(m, k)), m)"),
    fn(
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
      let s18 = @tactics.subst1_tac(x17)
      fn(
        x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s18(x19)
      }
    },
  )
  let t15 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@ringtheory.ring_pow_v1()), t15),
    @tactics.all_tac,
  ])
  let t14 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(ring_pow((r : Ring[A]), (x : A), EXP((m : Num), (k : Num))), ring_carrier(r))"),
    fn(
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
      let s12 = @tactics.assume_tac(x11)
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
    },
  )
  let t9 = @simp.asm_rewrite_tac(@list.List([]))
  let t10 = @list.List([
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t9),
    @tactics.all_tac,
  ])
  let t8 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((r : Ring[A]), (p : A), ring_sub(r, ring_pow(r, (x : A), EXP((m : Num), (k : Num))), x))"),
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
      let s6 = @tactics.assume_tac(x5)
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
  )
  let t4 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@arith.exp(), @arith.exp_1(), @arith.mult_clauses()]),
    ),
    @tactics.all_tac,
  ])
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t1 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t37 = @tactics.thenl(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.gen_tac, @tactics.gen_tac,
                                        ),
                                        @tactics.gen_tac,
                                      ),
                                      @tactics.gen_tac,
                                    ),
                                    @nums.induct_tac,
                                  ),
                                  t1,
                                ),
                                t2,
                              ),
                              @tactics.disch_tac,
                            ),
                            t3,
                          ),
                          t4,
                        ),
                        t8,
                      ),
                      t10,
                    ),
                    t14,
                  ),
                  t16,
                ),
                t20,
              ),
              t23,
            ),
            t27,
          ),
          t29,
        ),
        t30,
      ),
      @tactics.conj_tac,
    ),
    t36,
  )
  ring_divides_pow_iterate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : Ring[A], ∀ p : A, ∀ x : A, ∀ m : Num, ∀ k : Num, integral_domain(r) && IN(p, ring_carrier(r)) && IN(x, ring_carrier(r)) && ring_divides(r, p, ring_sub(r, ring_pow(r, x, m), x)) && !(k == 0) && 1 <= m → ring_divides(r, p, ring_sub(r, ring_pow(r, x, EXP(m, k)), x))"),
      t37,
    ),
  )
}

///|
let ring_divides_pow_iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RING_DIVIDES_POW_ITERATE",
)

///|
/// `RING_DIVIDES_POW_ITERATE`
pub fn ring_divides_pow_iterate() -> @kernel.Thm {
  ring_divides_pow_iterate_c.get()
}

///|
/// POLY_NONUNIT_DEGREE_GE_1
fn step_2() -> Unit raise {
  let t39 = @meson.meson_tac(
    @list.List([
      @ringtheory.ring_unit_poly_const(),
      @ringtheory.field_unit(),
      @ringtheory.poly_const_0(),
      @ringtheory.poly_ring_v1(),
    ]),
  )
  let t38 = @simp.simp_tac(@list.List([@ringtheory.poly_deg_eq_0()]))
  let t40 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @ringtheory.in_poly_ring_carrier(),
          @int.arith_rule(@term_syntax.parse_term("(1 <= (d : Num)) == !(d == 0)")),
        ]),
      ),
      t38,
    ),
    t39,
  )
  poly_nonunit_degree_ge_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((V) -> Num) -> A, ∀ s : (V) -> Bool, field(f) && IN(p, ring_carrier(poly_ring(f, s))) && !(p == ring_0(poly_ring(f, s))) && !ring_unit(poly_ring(f, s), p) → 1 <= poly_deg(f, p)"),
      t40,
    ),
  )
}

///|
let poly_nonunit_degree_ge_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_NONUNIT_DEGREE_GE_1",
)

///|
/// `POLY_NONUNIT_DEGREE_GE_1`
pub fn poly_nonunit_degree_ge_1() -> @kernel.Thm {
  poly_nonunit_degree_ge_1_c.get()
}

///|
/// RING_DIVIDES_REDUCE
fn step_3() -> Unit raise {
  let t64 = @simp.asm_simp_tac(
    @list.List([
      @ringtheory.ring_pow_v1(),
      @ringtheory.ring_rule(
        @term_syntax.parse_term("ring_sub((r : Ring[A]), ring_sub(r, (a : A), (b : A)), ring_sub(r, a, (c : A))) == ring_sub(r, c, b)"),
      ),
    ]),
  )
  let t63 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_sub((r : Ring[A]), ring_sub(r, ring_pow(r, (u : A), (m : Num)), (x : A)), ring_sub(r, ring_pow(r, u, m), ring_pow(r, x, m))) == ring_sub(r, ring_pow(r, x, m), x)"),
    fn(
      x61 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x61
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t59 = @simp.asm_simp_tac(
    @list.List([@ringtheory.ring_pow_v1(), @ringtheory.ring_sub_v1()]),
  )
  let t60 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@ringtheory.ring_divides_sub()),
      t59,
    ),
    @tactics.all_tac,
  ])
  let t58 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((r : Ring[A]), (p : A), ring_sub(r, ring_sub(r, ring_pow(r, (u : A), (m : Num)), (x : A)), ring_sub(r, ring_pow(r, u, m), ring_pow(r, x, m))))"),
    fn(
      x55 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s56 = @tactics.mp_tac(x55)
      fn(
        x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s56(x57)
      }
    },
  )
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.match_mp_tac(@ringtheory.ring_divides_sub_pow())
  let t51 = @simp.asm_rewrite_tac(@list.List([]))
  let t50 = @tactics.exists_tac(@term_syntax.parse_term("ring_sub((r : Ring[A]), (u : A), (x : A))"))
  let t54 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@ringtheory.ring_divides_trans()),
            t50,
          ),
          t51,
        ),
        t52,
      ),
      t53,
    ),
    @tactics.all_tac,
  ])
  let t49 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((r : Ring[A]), (p : A), ring_sub(r, ring_pow(r, (u : A), (m : Num)), ring_pow(r, (x : A), m)))"),
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
      let s47 = @tactics.assume_tac(x46)
      fn(
        x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s47(x48)
      }
    },
  )
  let t45 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_divides()])),
    @tactics.all_tac,
  ])
  let t44 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((p : A), ring_carrier((r : Ring[A])))"),
    fn(
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
      let s42 = @tactics.assume_tac(x41)
      fn(
        x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s42(x43)
      }
    },
  )
  let t65 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    @tactics.strip_tac,
                  ),
                  t44,
                ),
                t45,
              ),
              t49,
            ),
            t54,
          ),
          t58,
        ),
        t60,
      ),
      t63,
    ),
    t64,
  )
  ring_divides_reduce_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : Ring[A], ∀ p : A, ∀ u : A, ∀ x : A, ∀ m : Num, IN(u, ring_carrier(r)) && IN(x, ring_carrier(r)) && ring_divides(r, p, ring_sub(r, u, x)) && ring_divides(r, p, ring_sub(r, ring_pow(r, u, m), x)) && !(m == 0) → ring_divides(r, p, ring_sub(r, ring_pow(r, x, m), x))"),
      t65,
    ),
  )
}

///|
let ring_divides_reduce_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RING_DIVIDES_REDUCE",
)

///|
/// `RING_DIVIDES_REDUCE`
pub fn ring_divides_reduce() -> @kernel.Thm {
  ring_divides_reduce_c.get()
}

///|
/// FIELD_NONZERO_PRODUCT_PERMUTE
fn step_4() -> Unit raise {
  let t75 = @simp.asm_simp_tac(
    @list.List([
      @ringtheory.ring_mul_assoc(),
      @ringtheory.field_mul_linv(),
      @ringtheory.ring_mul_lid(),
    ]),
  )
  let t76 = @simp.asm_simp_tac(@list.List([@ringtheory.field_mul_eq_0()]))
  let t77 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_mul_v1()]))
  let t78 = @simp.asm_simp_tac(
    @list.List([
      @ringtheory.ring_mul_assoc(),
      @ringtheory.field_mul_rinv(),
      @ringtheory.ring_mul_lid(),
    ]),
  )
  let t79 = @simp.asm_simp_tac(@list.List([@ringtheory.field_mul_eq_0()]))
  let t80 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_mul_v1()])),
    t79,
    t78,
    t77,
    t76,
    t75,
  ])
  let t74 = @tactics.repeat_tac(@tactics.conj_tac)
  let t73 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t72 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t71 = @simp.rewrite_tac(@list.List([]))
  let t70 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @ringtheory.ring_inv_v1(),
        @ringtheory.field_unit(),
        @ringtheory.ring_unit_inv(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t69 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(ring_inv((f : Ring[A]), (x : A)), ring_carrier(f)) && !(ring_inv(f, x) == ring_0(f))"),
    @tactics.strip_assume_tac,
  )
  let t68 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : A) => ring_mul((f : Ring[A]), ring_inv(f, (x : A)), y)"),
  )
  let t67 = @tactics.exists_tac(@term_syntax.parse_term("(y : A) => ring_mul((f : Ring[A]), (x : A), y)"))
  let t66 = @tactics.match_mp_tac(
    @ringtheory.ring_product_eq_general_inverses(),
  )
  let t81 = @tactics.thenl(
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
                          t66,
                        ),
                        t67,
                      ),
                      t68,
                    ),
                    t69,
                  ),
                  t70,
                ),
                t71,
              ),
              @tactics.conj_tac,
            ),
            t72,
          ),
          t73,
        ),
        @tactics.strip_tac,
      ),
      t74,
    ),
    t80,
  )
  field_nonzero_product_permute_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ x : A, field(f) && FINITE(ring_carrier(f)) && IN(x, ring_carrier(f)) && !(x == ring_0(f)) → ring_product(f, DELETE(ring_carrier(f), ring_0(f)), (y : A) => ring_mul(f, x, y)) == ring_product(f, DELETE(ring_carrier(f), ring_0(f)), (y : A) => y)"),
      t81,
    ),
  )
}

///|
let field_nonzero_product_permute_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FIELD_NONZERO_PRODUCT_PERMUTE",
)

///|
/// `FIELD_NONZERO_PRODUCT_PERMUTE`
pub fn field_nonzero_product_permute() -> @kernel.Thm {
  field_nonzero_product_permute_c.get()
}

///|
/// FINITE_FIELD_ELEMENT_POW
fn step_5() -> Unit raise {
  let t140 = @meson.asm_meson_tac(@list.List([]))
  let t139 = @simp.asm_simp_tac(
    @list.List([
      @ringtheory.field_imp_integral_domain(),
      @ringtheory.ring_pow_v1(),
      @ringtheory.ring_1_v1(),
      @ringtheory.ring_mul_lid(),
      @ringtheory.ring_product_v1(),
    ]),
  )
  let t135 = @term_syntax.parse_term("ring_1((f : Ring[A]))")
  let t136 = @term_syntax.parse_term("ring_pow((f : Ring[A]), (x : A), CARD((s : (A) -> Bool)))")
  let t137 = @term_syntax.parse_term("ring_product((f : Ring[A]), (s : (A) -> Bool), (y : A) => y)")
  let t138 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t137, t136, t135]),
      @ringtheory.integral_domain_mul_rcancel(),
    ),
  )
  let t134 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_pow((f : Ring[A]), (x : A), CARD((s : (A) -> Bool))) == ring_1(f)"),
    fn(
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
      let th_1 = x132
      @meson.asm_meson_tac(@list.List([th_1]))
    },
  )
  let t130 = @meson.asm_meson_tac(@list.List([]))
  let t129 = @simp.asm_rewrite_tac(@list.List([]))
  let t131 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@ringtheory.ring_product_lmul()),
        t129,
      ),
      t130,
    ),
    @tactics.all_tac,
  ])
  let t128 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_product((f : Ring[A]), (s : (A) -> Bool), (y : A) => ring_mul(f, (x : A), y)) == ring_mul(f, ring_pow(f, x, CARD(s)), ring_product(f, s, (y : A) => y))"),
    fn(
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
      let s126 = @tactics.assume_tac(x125)
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
        s126(x127)
      }
    },
  )
  let t123 = @simp.asm_rewrite_tac(@list.List([]))
  let t122 = @tactics.match_mp_tac(field_nonzero_product_permute())
  let t124 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t122), t123),
    @tactics.all_tac,
  ])
  let t121 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_product((f : Ring[A]), (s : (A) -> Bool), (y : A) => ring_mul(f, (x : A), y)) == ring_product(f, s, (y : A) => y)"),
    fn(
      x118 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s119 = @tactics.assume_tac(x118)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    },
  )
  let t116 = @meson.asm_meson_tac(@list.List([]))
  let t117 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @ringtheory.integral_domain_product_eq_0(),
          @ringtheory.field_imp_integral_domain(),
        ]),
      ),
      t116,
    ),
    @tactics.all_tac,
  ])
  let t115 = @tactics.subgoal_then(
    @term_syntax.parse_term("!(ring_product((f : Ring[A]), (s : (A) -> Bool), (y : A) => y) == ring_0(f))"),
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
      let s113 = @tactics.assume_tac(x112)
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
  let t110 = @simp.simp_tac(@list.List([@sets.in_delete()]))
  let t111 = @list.List([
    @tactics.then_tac(@simp.expand_tac("s"), t110),
    @tactics.all_tac,
  ])
  let t109 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : A, IN(y, (s : (A) -> Bool)) → IN(y, ring_carrier((f : Ring[A]))) && !(y == ring_0(f))"),
    fn(
      x106 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s107 = @tactics.assume_tac(x106)
      fn(
        x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s107(x108)
      }
    },
  )
  let t104 = @simp.asm_rewrite_tac(@list.List([@sets.in_delete()]))
  let t105 = @list.List([
    @tactics.then_tac(@simp.expand_tac("s"), t104),
    @tactics.all_tac,
  ])
  let t103 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"), fn(
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
    let s101 = @tactics.assume_tac(x100)
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
  let t98 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_delete(),
      @sets.card_delete(),
      @ringtheory.ring_0_v1(),
    ]),
  )
  let t99 = @list.List([
    @tactics.then_tac(@simp.expand_tac("s"), t98),
    @tactics.all_tac,
  ])
  let t97 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE((s : (A) -> Bool)) && CARD(s) == CARD(ring_carrier((f : Ring[A]))) - 1"),
    @tactics.strip_assume_tac,
  )
  let t96 = @simp.abbrev_tac(
    @term_syntax.parse_term("(s : (A) -> Bool) == DELETE(ring_carrier((f : Ring[A])), ring_0(f))"),
  )
  let t95 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_pow((f : Ring[A]), (x : A), CARD(ring_carrier(f)) - 1) == ring_1(f)"),
    fn(
      x93 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x93
      @simp.asm_simp_tac(
        @list.List([
          th,
          @ringtheory.ring_mul_rid(),
          @ringtheory.ring_mul_lid(),
          @ringtheory.ring_pow_1(),
          @ringtheory.ring_pow_v1(),
        ]),
      )
    },
  )
  let t92 = @simp.rewrite_tac(
    @list.List([@ringtheory.ring_pow(), @ringtheory.ring_mul_rid()]),
  )
  let t91 = @simp.asm_simp_tac(
    @list.List([@ringtheory.ring_pow_add(), @ringtheory.ring_pow_v1()]),
  )
  let t89 = @meson.asm_meson_tac(
    @list.List([@sets.card_eq_0(), @ringtheory.ring_carrier_nonempty()]),
  )
  let t90 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == n - 1 + 1")),
      ),
      t89,
    ),
    @tactics.all_tac,
  ])
  let t88 = @tactics.subgoal_then(
    @term_syntax.parse_term("CARD(ring_carrier((f : Ring[A]))) == CARD(ring_carrier(f)) - 1 + 1"),
    fn(
      x85 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s86 = @tactics.subst1_tac(x85)
      fn(
        x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s86(x87)
      }
    },
  )
  let t83 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@sets.card_eq_0(), @ringtheory.ring_carrier_nonempty()]),
    ),
    @tactics.refl_tac,
  ])
  let t84 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_zero()])),
        @class.cond_cases_tac,
      ),
      t83,
    ),
    @tactics.all_tac,
  ])
  let t82 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == ring_0((f : Ring[A]))"))
  let t141 = @tactics.then_tac(
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
                                              @tactics.thenl(
                                                @tactics.then_tac(
                                                  @tactics.repeat_tac(
                                                    @tactics.strip_tac,
                                                  ),
                                                  t82,
                                                ),
                                                t84,
                                              ),
                                              t88,
                                            ),
                                            t90,
                                          ),
                                          t91,
                                        ),
                                        t92,
                                      ),
                                      t95,
                                    ),
                                    t96,
                                  ),
                                  t97,
                                ),
                                t99,
                              ),
                              t103,
                            ),
                            t105,
                          ),
                          t109,
                        ),
                        t111,
                      ),
                      t115,
                    ),
                    t117,
                  ),
                  t121,
                ),
                t124,
              ),
              t128,
            ),
            t131,
          ),
          t134,
        ),
        t138,
      ),
      t139,
    ),
    t140,
  )
  finite_field_element_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], field(f) && FINITE(ring_carrier(f)) → (∀ x : A, IN(x, ring_carrier(f)) → ring_pow(f, x, CARD(ring_carrier(f))) == x)"),
      t141,
    ),
  )
}

///|
let finite_field_element_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_FIELD_ELEMENT_POW",
)

///|
/// `FINITE_FIELD_ELEMENT_POW`
pub fn finite_field_element_pow() -> @kernel.Thm {
  finite_field_element_pow_c.get()
}

///|
/// QUOTIENT_POLY_RING_FINITE_CARD
fn step_6() -> Unit raise {
  let t490 = @simp.asm_rewrite_tac(@list.List([]))
  let t489 = @simp.expand_tac("d")
  let t485 = @meson.asm_meson_tac(@list.List([]))
  let t483 = @simp.rewrite_tac(@list.List([@ringtheory.poly_ring_clauses()]))
  let t484 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t483),
    @tactics.all_tac,
  ])
  let t482 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_mul((f : Ring[A]), (p : ((Unit) -> Num) -> A), ring_0((R : Ring[((Unit) -> Num) -> A]))) == ring_mul(R, p, ring_0(R))"),
    fn(
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
      let s480 = @tactics.assume_tac(x479)
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
    },
  )
  let t477 = @simp.asm_rewrite_tac(@list.List([]))
  let t478 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@ringtheory.ring_mul_rzero()), t477),
    @tactics.all_tac,
  ])
  let t486 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.disch_tac,
            @tactics.subgoal_then(
              @term_syntax.parse_term("ring_mul((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_0(R)) == ring_0(R)"),
              fn(
                x474 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s475 = @tactics.assume_tac(x474)
                fn(
                  x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s475(x476)
                }
              },
            ),
          ),
          t478,
        ),
        t482,
      ),
      t484,
    ),
    t485,
  )
  let t487 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t486])
  let t471 = @simp.gen_rewrite_rule(
    fn(
      x470 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x470
    },
    @list.List([@ringtheory.ring_irreducible()]),
  )
  let t473 = @tactics.first_x_assum(fn(
    x472 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(t471(x472))
  })
  let t469 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) && !(q : Bool) → p == q")),
  )
  let t467 = @simp.rewrite_tac(@list.List([@ringtheory.poly_ring_clauses()]))
  let t468 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t467),
    @tactics.all_tac,
  ])
  let t466 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_0((f : Ring[A])) == ring_0((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x464 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_7 = x464
      @simp.rewrite_tac(@list.List([th_7]))
    },
  )
  let t463 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t462 = @tactics.match_mp_tac(@ringtheory.poly_deg_mul())
  let t461 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t488 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.subgoal_then(
                        @term_syntax.parse_term("(q : ((Unit) -> Num) -> A) == poly_mul((f : Ring[A]), (p : ((Unit) -> Num) -> A), (s : ((Unit) -> Num) -> A))"),
                        fn(
                          x458 : @kernel.Thm,
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
                          let s459 = @tactics.subst1_tac(x458)
                          fn(
                            x460 : (
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
                            s459(x460)
                          }
                        },
                      ),
                      t461,
                    ),
                    t462,
                  ),
                  t463,
                ),
                t466,
              ),
              t468,
            ),
            t469,
          ),
          t473,
        ),
        @tactics.conj_tac,
      ),
      t487,
    ),
    @tactics.all_tac,
  ])
  let t457 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (q : ((Unit) -> Num) -> A)) == poly_deg(f, (p : ((Unit) -> Num) -> A)) + poly_deg(f, (s : ((Unit) -> Num) -> A))"),
    fn(
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
      let s455 = @tactics.mp_tac(x454)
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
    },
  )
  let t453 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x447 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s448 = @tactics.assume_tac(x447)
        fn(
          x449 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s448(x449)
        }
      },
      @tactics.conjuncts_then2(
        fn(
          x450 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s451 = @tactics.assume_tac(x450)
          fn(
            x452 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s451(x452)
          }
        },
        @tactics.x_choose_then(@term_syntax.parse_term("(s : ((Unit) -> Num) -> A)"))(
          @tactics.strip_assume_tac,
        ),
      ),
    ),
  )
  let t446 = @simp.rewrite_tac(
    @list.List([
      @ringtheory.poly_ring_clauses(),
      @sets.subset_univ(),
      @sets.in_elim_thm(),
    ]),
  )
  let t445 = @simp.expand_tac("R")
  let t442 = @simp.gen_rewrite_rule(
    fn(
      x441 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x441
    },
    @list.List([@ringtheory.ring_divides()]),
  )
  let t444 = @tactics.first_x_assum(fn(
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
    (fn(
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
    })(t442(x443))
  })
  let t491 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@simp.expand_tac("d"), t444),
                  t445,
                ),
                t446,
              ),
              t453,
            ),
            t457,
          ),
          t488,
        ),
        t489,
      ),
      @int.arith_tac,
    ),
    t490,
  ])
  let t436 = @term_syntax.parse_term("poly_deg((f : Ring[A]), (q : ((Unit) -> Num) -> A))")
  let t437 = @tactics.trans_tac(@arith.le_trans())(t436)
  let t434 = @tactics.disch_then(fn(
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
    let th_6 = x432
    @simp.asm_rewrite_tac(@list.List([@equal.gsym(th_6)]))
  })
  let t431 = @simp.asm_rewrite_tac(@list.List([]))
  let t429 = @term_syntax.parse_term("(q : ((Unit) -> Num) -> A)")
  let t430 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t435 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([@term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"), t430, t429]),
            @ringtheory.in_ideal_generated_sing_eq(),
          ),
        ),
        t431,
      ),
      t434,
    ),
    @tactics.all_tac,
  ])
  let t428 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), (q : ((Unit) -> Num) -> A))"),
    fn(
      x425 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s426 = @tactics.assume_tac(x425)
      fn(
        x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s426(x427)
      }
    },
  )
  let t423 = @meson.asm_meson_tac(@list.List([]))
  let t422 = @simp.rewrite_tac(
    @list.List([@ringtheory.ring_kernel(), @sets.in_elim_thm()]),
  )
  let t420 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_kernel_ring_coset()]),
  )
  let t421 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t420),
    @tactics.all_tac,
  ])
  let t424 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("ring_kernel(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool))) == J"),
            fn(
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
              (fn(
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
                let s417 = @tactics.subst1_tac(x416)
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
              })(@equal.sym(x419))
            },
          ),
          t421,
        ),
        t422,
      ),
      t423,
    ),
    @tactics.all_tac,
  ])
  let t415 = @tactics.subgoal_then(@term_syntax.parse_term("IN((q : ((Unit) -> Num) -> A), (J : (((Unit) -> Num) -> A) -> Bool))"), fn(
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
    let s413 = @tactics.assume_tac(x412)
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
  })
  let t410 = @simp.asm_rewrite_tac(@list.List([]))
  let t409 = @tactics.disch_then(fn(
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
      x405 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s406 = @tactics.subst1_tac(x405)
      fn(
        x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s406(x407)
      }
    })(@equal.sym(x408))
  })
  let t404 = @simp.asm_rewrite_tac(@list.List([]))
  let t411 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
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
            let th_5 = x402
            @tactics.mp_tac(
              @bool.spec(@term_syntax.parse_term("(q : ((Unit) -> Num) -> A)"), th_5),
            )
          }),
          t404,
        ),
        t409,
      ),
      t410,
    ),
    @tactics.all_tac,
  ])
  let t401 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), (q : ((Unit) -> Num) -> A)) == ring_0((K : Ring[(((Unit) -> Num) -> A) -> Bool]))"),
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
      let s399 = @tactics.assume_tac(x398)
      fn(
        x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s399(x400)
      }
    },
  )
  let t397 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t396 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((q : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x393 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s394 = @tactics.assume_tac(x393)
      fn(
        x395 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s394(x395)
      }
    },
  )
  let t392 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : ((Unit) -> Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t391 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@sets.has_size(), @sets.subset_refl()])),
    @tactics.all_tac,
  ])
  let t385 = @term_syntax.parse_term("CARD((b : ((((Unit) -> Num) -> A) -> Bool) -> Bool))")
  let t386 = @term_syntax.parse_term("(b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)")
  let t387 = @term_syntax.parse_term("(a : (((Unit) -> Num) -> A) -> Bool)")
  let t388 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t389 = @term_syntax.parse_term("(f : Ring[A])")
  let t390 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
        t389,
        t388,
        t387,
        t386,
        t385,
      ]),
      @fieldtheory.finite_imp_algebraic_extension_explicit(),
    ),
  )
  let t384 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@fieldtheory.ring_basis(), @fieldtheory.ring_independent()]),
    ),
    @tactics.all_tac,
  ])
  let t383 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((b : ((((Unit) -> Num) -> A) -> Bool) -> Bool), ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])))"),
    fn(
      x380 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s381 = @tactics.assume_tac(x380)
      fn(
        x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s381(x382)
      }
    },
  )
  let t379 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@fieldtheory.ring_basis(), @fieldtheory.ring_spanning()]),
    ),
    @tactics.all_tac,
  ])
  let t492 = @tactics.thenl(
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
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.subgoal_then(
                                        @term_syntax.parse_term("ring_span(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)) == ring_carrier(K)"),
                                        fn(
                                          x376 : @kernel.Thm,
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
                                          let s377 = @tactics.assume_tac(x376)
                                          fn(
                                            x378 : (
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
                                          ) raise {
                                            s377(x378)
                                          }
                                        },
                                      ),
                                      t379,
                                    ),
                                    t383,
                                  ),
                                  t384,
                                ),
                                t390,
                              ),
                              @tactics.ants_tac,
                            ),
                            t391,
                          ),
                          t392,
                        ),
                        t396,
                      ),
                      t397,
                    ),
                    t401,
                  ),
                  t411,
                ),
                t415,
              ),
              t424,
            ),
            t428,
          ),
          t435,
        ),
        t437,
      ),
      @tactics.conj_tac,
    ),
    t491,
  )
  let t374 = @simp.rewrite_tac(
    @list.List([@sets.card_numseg_lt(), @arith.le_refl()]),
  )
  let t373 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t375 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@sets.card_image_le()), t373),
    t374,
  ])
  let t371 = @term_syntax.parse_term("CARD({(n : Num) | n < (d : Num)})")
  let t372 = @tactics.trans_tac(@arith.le_trans())(t371)
  let t370 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t369 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(b : Num) <= (c : Num) → (a : Num) <= b → a <= c")),
  )
  let t368 = @tactics.disch_then(fn(
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
    let th_4 = x366
    @tactics.mp_tac(@bool.conjunct2(th_4))
  })
  let t358 = @simp.asm_rewrite_tac(@list.List([]))
  let t357 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t359 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("ring_span(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), {ring_pow(K, (a : (((Unit) -> Num) -> A) -> Bool), (n : Num)) | n < (d : Num)}) == ring_carrier(K)"),
        fn(
          x355 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th_3 = x355
          @simp.rewrite_tac(@list.List([th_3]))
        },
      ),
      t357,
    ),
    t358,
  )
  let t360 = @simp.asm_rewrite_tac(@list.List([]))
  let t354 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t353 = @tactics.match_mp_tac(@sets.finite_image())
  let t361 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()])),
      t353,
    ),
    t354,
  )
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @tactics.match_mp_tac(@ringtheory.ring_pow_v1())
  let t350 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t362 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@sets.subset(), @sets.forall_in_gspec()]),
          ),
          t350,
        ),
        @tactics.disch_tac,
      ),
      t351,
    ),
    t352,
  )
  let t363 = @simp.asm_rewrite_tac(@list.List([]))
  let t364 = @list.List([
    @simp.asm_rewrite_tac(@list.List([])),
    t363,
    t362,
    t361,
    t360,
    t359,
  ])
  let t365 = @list.List([
    @tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t364),
    @tactics.all_tac,
  ])
  let t345 = @term_syntax.parse_term("{ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), (a : (((Unit) -> Num) -> A) -> Bool), (n : Num)) | n < (d : Num)}")
  let t346 = @term_syntax.parse_term("(b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)")
  let t347 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t348 = @term_syntax.parse_term("(f : Ring[A])")
  let t349 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
        t348,
        t347,
        t346,
        t345,
      ]),
      @fieldtheory.ring_independent_le_span(),
    ),
  )
  let t344 = @simp.asm_rewrite_tac(@list.List([]))
  let t339 = @term_syntax.parse_term("(a : (((Unit) -> Num) -> A) -> Bool)")
  let t340 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t341 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t342 = @term_syntax.parse_term("(f : Ring[A])")
  let t343 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
        t342,
        t341,
        t340,
        t339,
      ]),
      @fieldtheory.ring_simple_algebraic_extension_span(),
    ),
  )
  let t338 = @list.List([
    @meson.asm_meson_tac(@list.List([@fieldtheory.ring_independent()])),
    @tactics.all_tac,
  ])
  let t337 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((b : ((((Unit) -> Num) -> A) -> Bool) -> Bool), ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])))"),
    fn(
      x334 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s335 = @tactics.assume_tac(x334)
      fn(
        x336 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s335(x336)
      }
    },
  )
  let t333 = @list.List([
    @meson.asm_meson_tac(@list.List([@fieldtheory.ring_basis()])),
    @tactics.all_tac,
  ])
  let t332 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_independent(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (b : ((((Unit) -> Num) -> A) -> Bool) -> Bool))"),
    fn(
      x329 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s330 = @tactics.assume_tac(x329)
      fn(
        x331 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s330(x331)
      }
    },
  )
  let t327 = @simp.asm_rewrite_tac(@list.List([]))
  let t326 = @list.List([@simp.asm_simp_tac(@list.List([])), @tactics.all_tac])
  let t328 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.subgoal_then(
          @term_syntax.parse_term("poly_extend(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (v : Unit) => (a : (((Unit) -> Num) -> A) -> Bool), (p : ((Unit) -> Num) -> A)) == ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), p)"),
          fn(
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
            let s324 = @tactics.subst1_tac(x323)
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
          },
        ),
        t326,
      ),
      t327,
    ),
    @tactics.all_tac,
  ])
  let t322 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_extend(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (v : Unit) => (a : (((Unit) -> Num) -> A) -> Bool), (p : ((Unit) -> Num) -> A)) == ring_0(K)"),
    fn(
      x319 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s320 = @tactics.assume_tac(x319)
      fn(
        x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s320(x321)
      }
    },
  )
  let t318 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t493 = @list.List([
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
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.thenl(
                                          @tactics.subgoal_then(
                                            @term_syntax.parse_term("!((p : ((Unit) -> Num) -> A) == ring_0((R : Ring[((Unit) -> Num) -> A])))"),
                                            fn(
                                              x315 : @kernel.Thm,
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
                                              let s316 = @tactics.assume_tac(
                                                x315,
                                              )
                                              fn(
                                                x317 : (
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
                                                s316(x317)
                                              }
                                            },
                                          ),
                                          t318,
                                        ),
                                        t322,
                                      ),
                                      t328,
                                    ),
                                    t332,
                                  ),
                                  t333,
                                ),
                                t337,
                              ),
                              t338,
                            ),
                            t343,
                          ),
                          t344,
                        ),
                        @tactics.disch_tac,
                      ),
                      t349,
                    ),
                    @tactics.ants_tac,
                  ),
                  t365,
                ),
                t368,
              ),
              t369,
            ),
            t370,
          ),
          t372,
        ),
        @tactics.conj_tac,
      ),
      t375,
    ),
    t492,
  ])
  let t314 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())]))
  let t313 = @simp.abbrev_tac(
    @term_syntax.parse_term("(d : Num) == poly_deg((f : Ring[A]), (p : ((Unit) -> Num) -> A))"),
  )
  let t312 = @tactics.subgoal_then(
    @term_syntax.parse_term("CARD((b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)) == poly_deg((f : Ring[A]), (p : ((Unit) -> Num) -> A))"),
    fn(
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
      let th_2 = x310
      @simp.rewrite_tac(@list.List([th_2]))
    },
  )
  let t309 = @simp.asm_rewrite_tac(@list.List([]))
  let t308 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s304 = @tactics.assume_tac(x303)
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
      },
      fn(
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
        let th_1 = x306
        @simp.rewrite_tac(@list.List([th_1]))
      },
    ),
  )
  let t302 = @simp.rewrite_tac(@list.List([@sets.has_size()]))
  let t301 = @simp.asm_rewrite_tac(@list.List([]))
  let t297 = @term_syntax.parse_term("(b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)")
  let t298 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t299 = @term_syntax.parse_term("(f : Ring[A])")
  let t300 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
        t299,
        t298,
        t297,
      ]),
      @fieldtheory.has_size_finite_extension(),
    ),
  )
  let t296 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t295 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        @tactics.all_tac
      },
      @tactics.x_choose_then(
        @term_syntax.parse_term("(b : ((((Unit) -> Num) -> A) -> Bool) -> Bool)"),
      )(@tactics.strip_assume_tac),
    ),
  )
  let t290 = @simp.gen_rewrite_rule(
    fn(
      x289 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x289
    },
    @list.List([@fieldtheory.finite_extension_basis()]),
  )
  let t292 = @tactics.first_x_assum(fn(
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
    (fn(
      x286 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s287 = @tactics.mp_tac(x286)
      fn(
        x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s287(x288)
      }
    })(t290(x291))
  })
  let t284 = @simp.asm_rewrite_tac(@list.List([]))
  let t281 = @term_syntax.parse_term("(a : (((Unit) -> Num) -> A) -> Bool)")
  let t282 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t283 = @term_syntax.parse_term("(f : Ring[A])")
  let t285 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
            t283,
            t282,
            t281,
          ]),
          @fieldtheory.finite_simple_algebraic_extension(),
        ),
      ),
      t284,
    ),
    @tactics.all_tac,
  ])
  let t280 = @tactics.subgoal_then(
    @term_syntax.parse_term("finite_extension(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x277 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s278 = @tactics.assume_tac(x277)
      fn(
        x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s278(x279)
      }
    },
  )
  let t275 = @simp.asm_simp_tac(@list.List([]))
  let t274 = @tactics.exists_tac(@term_syntax.parse_term("(g : ((Unit) -> Num) -> A)"))
  let t273 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((Unit) -> Num) -> A)"))
  let t272 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_gspec(), @sets.in_image()]),
  )
  let t270 = @simp.asm_simp_tac(
    @list.List([@ringtheory.quotient_ring_carrier()]),
  )
  let t271 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t270),
    @tactics.all_tac,
  ])
  let t269 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])) == {ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), x) | x : ((Unit) -> Num) -> A | IN(x, ring_carrier(R))}"),
    fn(
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
      let s267 = @tactics.subst1_tac(x266)
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
    },
  )
  let t265 = @tactics.disch_then(fn(
    x263 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x263
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t262 = @simp.asm_rewrite_tac(@list.List([]))
  let t258 = @term_syntax.parse_term("(a : (((Unit) -> Num) -> A) -> Bool)")
  let t259 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t260 = @term_syntax.parse_term("(f : Ring[A])")
  let t261 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)"),
        t260,
        t259,
        t258,
      ]),
      @ringtheory.image_poly_extend_1(),
    ),
  )
  let t276 = @list.List([
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
                        @simp.rewrite_tac(
                          @list.List([@ringtheory.subring_generated_superset()]),
                        ),
                        t261,
                      ),
                      t262,
                    ),
                    t265,
                  ),
                  t269,
                ),
                t271,
              ),
              t272,
            ),
            t273,
          ),
          @tactics.disch_tac,
        ),
        t274,
      ),
      t275,
    ),
    @tactics.all_tac,
  ])
  let t257 = @tactics.subgoal_then(
    @term_syntax.parse_term("subring_generated((K : Ring[(((Unit) -> Num) -> A) -> Bool]), INSERT((a : (((Unit) -> Num) -> A) -> Bool), IMAGE((h : (A, ((Unit) -> Num) -> A) -> Bool), ring_carrier((f : Ring[A]))))) == K"),
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
  )
  let t252 = @simp.asm_rewrite_tac(@list.List([]))
  let t251 = @list.List([@simp.asm_simp_tac(@list.List([])), @tactics.all_tac])
  let t250 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_extend(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (v : Unit) => (a : (((Unit) -> Num) -> A) -> Bool), (p : ((Unit) -> Num) -> A)) == ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), p)"),
    fn(
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
    },
  )
  let t246 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @ringtheory.ring_irreducible(),
        @ringtheory.poly_ring_clauses(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t245 = @simp.asm_rewrite_tac(@list.List([]))
  let t244 = @tactics.exists_tac(@term_syntax.parse_term("(p : ((Unit) -> Num) -> A)"))
  let t243 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t253 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([@fieldtheory.algebraic_over()]),
                      ),
                      @tactics.conj_tac,
                    ),
                    t243,
                  ),
                  t244,
                ),
                t245,
              ),
              @tactics.conj_tac,
            ),
            t246,
          ),
          t250,
        ),
        t251,
      ),
      t252,
    ),
    @tactics.all_tac,
  ])
  let t242 = @tactics.subgoal_then(
    @term_syntax.parse_term("algebraic_over(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (a : (((Unit) -> Num) -> A) -> Bool))"),
    fn(
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
      let s240 = @tactics.assume_tac(x239)
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
    },
  )
  let t237 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_coset_eq_ideal()]),
  )
  let t236 = @simp.asm_simp_tac(@list.List([@ringtheory.quotient_ring_0()]))
  let t238 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("K"), t236), t237),
    @tactics.all_tac,
  ])
  let t235 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), (p : ((Unit) -> Num) -> A)) == ring_0((K : Ring[(((Unit) -> Num) -> A) -> Bool]))"),
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
      let s233 = @tactics.assume_tac(x232)
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
  )
  let t230 = @simp.asm_rewrite_tac(@list.List([]))
  let t229 = @simp.rewrite_tac(
    @list.List([@ringtheory.in_ideal_generated_self()]),
  )
  let t231 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("J"), t229), t230),
    @tactics.all_tac,
  ])
  let t228 = @tactics.subgoal_then(@term_syntax.parse_term("IN((p : ((Unit) -> Num) -> A), (J : (((Unit) -> Num) -> A) -> Bool))"), fn(
    x225 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s226 = @tactics.assume_tac(x225)
    fn(
      x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s226(x227)
    }
  })
  let t221 = @simp.expand_tac("a")
  let t220 = @list.List([
    @meson.meson_tac(@list.List([@trivia.one()])),
    @tactics.all_tac,
  ])
  let t219 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Unit) == one"), fn(
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
    let s217 = @tactics.subst1_tac(x216)
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
  })
  let t215 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t222 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Unit)")), t215),
          t219,
        ),
        t220,
      ),
      t221,
    ),
    @tactics.refl_tac,
  )
  let t214 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t213 = @simp.expand_tac("h")
  let t223 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(c : A)")),
          @tactics.disch_tac,
        ),
        t213,
      ),
      t214,
    ),
    t222,
  ])
  let t212 = @tactics.disch_then(@tactics.match_mp_tac)
  let t211 = @simp.asm_rewrite_tac(@list.List([]))
  let t204 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t205 = @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))")
  let t206 = @term_syntax.parse_term("(v : Unit) => (a : (((Unit) -> Num) -> A) -> Bool)")
  let t207 = @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool)")
  let t208 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t209 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t210 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(f : Ring[A])"),
        t209,
        t208,
        t207,
        t206,
        t205,
        t204,
      ]),
      @ringtheory.poly_extend_unique(),
    ),
  )
  let t224 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.x_gen_tac(@term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")),
                @tactics.disch_tac,
              ),
              t210,
            ),
            t211,
          ),
          t212,
        ),
        @tactics.conj_tac,
      ),
      t223,
    ),
    @tactics.all_tac,
  ])
  let t203 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ g : ((Unit) -> Num) -> A, IN(g, ring_carrier((R : Ring[((Unit) -> Num) -> A]))) → poly_extend(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool), (v : Unit) => (a : (((Unit) -> Num) -> A) -> Bool), g) == ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool), g)"),
    fn(
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
      let s201 = @tactics.assume_tac(x200)
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
    },
  )
  let t198 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.ring_homomorphism(),
      @sets.in_image(),
      @sets.subset(),
    ]),
  )
  let t196 = @simp.rewrite_tac(@list.List([@ringtheory.poly_var_univ()]))
  let t197 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t196),
    @tactics.all_tac,
  ])
  let t199 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.subgoal_then(
          @term_syntax.parse_term("IN(poly_var((f : Ring[A]), one), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
          fn(
            x193 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s194 = @tactics.assume_tac(x193)
            fn(
              x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s194(x195)
            }
          },
        ),
        t197,
      ),
      t198,
    ),
    @tactics.all_tac,
  ])
  let t192 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((a : (((Unit) -> Num) -> A) -> Bool), ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])))"),
    fn(
      x189 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s190 = @tactics.assume_tac(x189)
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
  )
  let t188 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @fieldtheory.field_extension(),
        @ringtheory.ring_monomorphism_imp_homomorphism(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t187 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x184 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s185 = @tactics.assume_tac(x184)
      fn(
        x186 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s185(x186)
      }
    },
  )
  let t182 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_homomorphism_ring_coset()]),
  )
  let t183 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t182),
    @tactics.all_tac,
  ])
  let t181 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool)))"),
    fn(
      x178 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s179 = @tactics.assume_tac(x178)
      fn(
        x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s179(x180)
      }
    },
  )
  let t176 = @meson.asm_meson_tac(@list.List([]))
  let t175 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t174 = @tactics.match_mp_tac(@fieldtheory.kronecker_field_extension())
  let t173 = @simp.expand_tac("R")
  let t172 = @simp.expand_tac("J")
  let t171 = @simp.expand_tac("h")
  let t177 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@simp.expand_tac("K"), t171),
                t172,
              ),
              t173,
            ),
            t174,
          ),
          @tactics.conj_tac,
        ),
        t175,
      ),
      t176,
    ),
    @tactics.all_tac,
  ])
  let t170 = @tactics.subgoal_then(
    @term_syntax.parse_term("field_extension(((f : Ring[A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (h : (A, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x167 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s168 = @tactics.assume_tac(x167)
      fn(
        x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s168(x169)
      }
    },
  )
  let t165 = @meson.asm_meson_tac(
    @list.List([@ringtheory.field_quotient_ring()]),
  )
  let t166 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t165),
    @tactics.all_tac,
  ])
  let t164 = @tactics.subgoal_then(
    @term_syntax.parse_term("field((K : Ring[(((Unit) -> Num) -> A) -> Bool]))"),
    fn(
      x161 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s162 = @tactics.assume_tac(x161)
      fn(
        x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s162(x163)
      }
    },
  )
  let t159 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.ring_irreducible_eq_maximal_ideal(),
      @ringtheory.maximal_imp_ring_ideal(),
    ]),
  )
  let t160 = @list.List([
    @tactics.then_tac(@simp.expand_tac("J"), t159),
    @tactics.all_tac,
  ])
  let t158 = @tactics.subgoal_then(
    @term_syntax.parse_term("maximal_ideal((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool)) && ring_ideal(R, J)"),
    @tactics.strip_assume_tac,
  )
  let t156 = @meson.asm_meson_tac(@list.List([@ringtheory.pid_poly_ring()]))
  let t157 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t156),
    @tactics.all_tac,
  ])
  let t155 = @tactics.subgoal_then(
    @term_syntax.parse_term("PID((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x152 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s153 = @tactics.assume_tac(x152)
      fn(
        x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s153(x154)
      }
    },
  )
  let t151 = @simp.abbrev_tac(
    @term_syntax.parse_term("(a : (((Unit) -> Num) -> A) -> Bool) == ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), poly_var((f : Ring[A]), one))"),
  )
  let t150 = @simp.abbrev_tac(
    @term_syntax.parse_term("(h : (A, ((Unit) -> Num) -> A) -> Bool) == o(ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool)), poly_const((f : Ring[A])))"),
  )
  let t149 = @simp.abbrev_tac(
    @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool]) == quotient_ring((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))"),
  )
  let t148 = @simp.abbrev_tac(
    @term_syntax.parse_term("(J : (((Unit) -> Num) -> A) -> Bool) == ideal_generated((R : Ring[((Unit) -> Num) -> A]), {(p : ((Unit) -> Num) -> A)})"),
  )
  let t147 = @simp.abbrev_tac(
    @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A]) == poly_ring((f : Ring[A]), UNIV)"),
  )
  let t146 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t145 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((p : ((Unit) -> Num) -> A), ring_carrier(poly_ring((f : Ring[A]), UNIV)))"),
    fn(
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
      let s143 = @tactics.assume_tac(x142)
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
    },
  )
  let t494 = @tactics.thenl(
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
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.thenl(
                                                @tactics.then_tac(
                                                  @tactics.thenl(
                                                    @tactics.then_tac(
                                                      @tactics.thenl(
                                                        @tactics.then_tac(
                                                          @tactics.thenl(
                                                            @tactics.then_tac(
                                                              @tactics.thenl(
                                                                @tactics.then_tac(
                                                                  @tactics.thenl(
                                                                    @tactics.then_tac(
                                                                      @tactics.thenl(
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
                                                                                            @tactics.thenl(
                                                                                              @tactics.then_tac(
                                                                                                @tactics.then_tac(
                                                                                                  @tactics.repeat_tac(
                                                                                                    @tactics.gen_tac,
                                                                                                  ),
                                                                                                  @tactics.strip_tac,
                                                                                                ),
                                                                                                t145,
                                                                                              ),
                                                                                              t146,
                                                                                            ),
                                                                                            t147,
                                                                                          ),
                                                                                          t148,
                                                                                        ),
                                                                                        t149,
                                                                                      ),
                                                                                      t150,
                                                                                    ),
                                                                                    t151,
                                                                                  ),
                                                                                  t155,
                                                                                ),
                                                                                t157,
                                                                              ),
                                                                              t158,
                                                                            ),
                                                                            t160,
                                                                          ),
                                                                          t164,
                                                                        ),
                                                                        t166,
                                                                      ),
                                                                      t170,
                                                                    ),
                                                                    t177,
                                                                  ),
                                                                  t181,
                                                                ),
                                                                t183,
                                                              ),
                                                              t187,
                                                            ),
                                                            t188,
                                                          ),
                                                          t192,
                                                        ),
                                                        t199,
                                                      ),
                                                      t203,
                                                    ),
                                                    t224,
                                                  ),
                                                  t228,
                                                ),
                                                t231,
                                              ),
                                              t235,
                                            ),
                                            t238,
                                          ),
                                          t242,
                                        ),
                                        t253,
                                      ),
                                      t257,
                                    ),
                                    t276,
                                  ),
                                  t280,
                                ),
                                t285,
                              ),
                              t292,
                            ),
                            t295,
                          ),
                          @tactics.conj_tac,
                        ),
                        t296,
                      ),
                      t300,
                    ),
                    t301,
                  ),
                  t302,
                ),
                t308,
              ),
              t309,
            ),
            t312,
          ),
          t313,
        ),
        t314,
      ),
      @tactics.conj_tac,
    ),
    t493,
  )
  quotient_poly_ring_finite_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, field(f) && FINITE(ring_carrier(f)) && ring_irreducible(poly_ring(f, UNIV), p) → field(quotient_ring(poly_ring(f, UNIV), ideal_generated(poly_ring(f, UNIV), {p}))) && FINITE(ring_carrier(quotient_ring(poly_ring(f, UNIV), ideal_generated(poly_ring(f, UNIV), {p})))) && CARD(ring_carrier(quotient_ring(poly_ring(f, UNIV), ideal_generated(poly_ring(f, UNIV), {p})))) == EXP(CARD(ring_carrier(f)), poly_deg(f, p))"),
      t494,
    ),
  )
}

///|
let quotient_poly_ring_finite_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUOTIENT_POLY_RING_FINITE_CARD",
)

///|
/// `QUOTIENT_POLY_RING_FINITE_CARD`
pub fn quotient_poly_ring_finite_card() -> @kernel.Thm {
  quotient_poly_ring_finite_card_c.get()
}

///|
/// IRREDUCIBLE_DIVIDES_XQ_MINUS_X_GEN
fn step_7() -> Unit raise {
  let t664 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
      @arith.exp_eq_0(),
    ]),
  )
  let t662 = @simp.asm_rewrite_tac(@list.List([]))
  let t661 = @simp.simp_tac(
    @list.List([
      @sets.card_clauses(),
      @sets.finite_insert(),
      @sets.finite_empty(),
      @sets.in_insert(),
      @sets.not_in_empty(),
    ]),
  )
  let t660 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.finite_insert(),
      @sets.finite_empty(),
      @sets.insert_subset(),
      @sets.empty_subset(),
      @ringtheory.ring_0_v1(),
      @ringtheory.ring_1_v1(),
    ]),
  )
  let t658 = @term_syntax.parse_term("ring_carrier((f : Ring[A]))")
  let t659 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("{ring_0((f : Ring[A])), ring_1(f)}"), t658]),
      @sets.card_subset(),
    ),
  )
  let t656 = @simp.asm_rewrite_tac(@list.List([@ringtheory.trivial_ring_10()]))
  let t657 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispec(
          @term_syntax.parse_term("(f : Ring[A])"),
          @ringtheory.field_nontrivial(),
        ),
      ),
      t656,
    ),
    @tactics.all_tac,
  ])
  let t663 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.subgoal_then(
                  @term_syntax.parse_term("!(ring_1((f : Ring[A])) == ring_0(f))"),
                  fn(
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
                    let s654 = @tactics.assume_tac(x653)
                    fn(
                      x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s654(x655)
                    }
                  },
                ),
                t657,
              ),
              t659,
            ),
            t660,
          ),
          t661,
        ),
        t662,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t652 = @tactics.subgoal_then(
    @term_syntax.parse_term("2 <= CARD(ring_carrier((f : Ring[A])))"),
    fn(
      x649 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s650 = @tactics.assume_tac(x649)
      fn(
        x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s650(x651)
      }
    },
  )
  let t648 = @simp.asm_rewrite_tac(@list.List([]))
  let t647 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @ringtheory.field_imp_integral_domain(),
        @ringtheory.integral_domain_poly_ring(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t646 = @simp.asm_rewrite_tac(@list.List([]))
  let t645 = @tactics.disch_then(@tactics.match_mp_tac)
  let t644 = @simp.asm_rewrite_tac(@list.List([]))
  let t639 = @term_syntax.parse_term("(k : Num)")
  let t640 = @term_syntax.parse_term("EXP(CARD(ring_carrier((f : Ring[A]))), poly_deg(f, (p : ((Unit) -> Num) -> A)))")
  let t641 = @term_syntax.parse_term("poly_var((f : Ring[A]), one)")
  let t642 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t643 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"),
        t642,
        t641,
        t640,
        t639,
      ]),
      ring_divides_pow_iterate(),
    ),
  )
  let t637 = @simp.asm_rewrite_tac(@list.List([]))
  let t638 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@arith.exp_exp()])),
        @tactics.ap_term_tac,
      ),
      t637,
    ),
    @tactics.all_tac,
  ])
  let t636 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP(CARD(ring_carrier((f : Ring[A]))), (n : Num)) == EXP(EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A))), (k : Num))"),
    fn(
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
      let s634 = @tactics.subst1_tac(x633)
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
    },
  )
  let t631 = @meson.asm_meson_tac(@list.List([]))
  let t630 = @simp.rewrite_tac(@list.List([@ringtheory.ring_divides_0()]))
  let t628 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_sub_refl()]))
  let t629 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_1()])),
      t628,
    ),
    @tactics.all_tac,
  ])
  let t627 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_sub((R : Ring[((Unit) -> Num) -> A]), ring_pow(R, poly_var((f : Ring[A]), one), 1), poly_var(f, one)) == ring_0(R)"),
    fn(
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
      let s625 = @tactics.subst1_tac(x624)
      fn(
        x626 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s625(x626)
      }
    },
  )
  let t623 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t622 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()])),
    @tactics.all_tac,
  ])
  let t632 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == 0"), fn(
                  x619 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s620 = @tactics.subst_all_tac(x619)
                  fn(
                    x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s620(x621)
                  }
                }),
                t622,
              ),
              t623,
            ),
            t627,
          ),
          t629,
        ),
        t630,
      ),
      t631,
    ),
    @tactics.all_tac,
  ])
  let t618 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t615 = @term_syntax.parse_term("(k : Num)")
  let t617 = @tactics.disch_then((x616 : @kernel.Thm) => {
    @tactics.x_choose_tac(t615, x616)
  })
  let t612 = @simp.gen_rewrite_rule(
    fn(
      x611 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x611
    },
    @list.List([@int.divides()]),
  )
  let t614 = @tactics.first_x_assum(fn(
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
    (fn(
      x608 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s609 = @tactics.mp_tac(x608)
      fn(
        x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s609(x610)
      }
    })(t612(x613))
  })
  let t606 = @simp.asm_rewrite_tac(@list.List([]))
  let t605 = @tactics.disch_then(fn(
    x603 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x603
    @simp.rewrite_tac(@list.List([@equal.gsym(th_2)]))
  })
  let t602 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t600 = @term_syntax.parse_term("ring_sub((R : Ring[((Unit) -> Num) -> A]), ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A)))), poly_var(f, one))")
  let t601 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t607 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.mp_tac(
              @bool.ispecl(
                @list.List([
                  @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"),
                  t601,
                  t600,
                ]),
                @ringtheory.in_ideal_generated_sing_eq(),
              ),
            ),
            @tactics.ants_tac,
          ),
          t602,
        ),
        t605,
      ),
      t606,
    ),
    @tactics.all_tac,
  ])
  let t599 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), poly_deg(f, p))), poly_var(f, one)))"),
    fn(
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
      let s597 = @tactics.assume_tac(x596)
      fn(
        x598 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s597(x598)
      }
    },
  )
  let t593 = @simp.asm_rewrite_tac(@list.List([]))
  let t594 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@ringtheory.ring_sub_v1(), @ringtheory.ring_pow_v1()]),
    ),
    t593,
  ])
  let t592 = @simp.rewrite_tac(
    @list.List([@ringtheory.ring_kernel(), @sets.in_elim_thm()]),
  )
  let t590 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_kernel_ring_coset()]),
  )
  let t591 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t590),
    @tactics.all_tac,
  ])
  let t595 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("ring_kernel(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool))) == J"),
              fn(
                x589 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x586 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s587 = @tactics.subst1_tac(x586)
                  fn(
                    x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s587(x588)
                  }
                })(@equal.sym(x589))
              },
            ),
            t591,
          ),
          t592,
        ),
        @tactics.conj_tac,
      ),
      t594,
    ),
    @tactics.all_tac,
  ])
  let t585 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(ring_sub((R : Ring[((Unit) -> Num) -> A]), ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A)))), poly_var(f, one)), (J : (((Unit) -> Num) -> A) -> Bool))"),
    fn(
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
      let s583 = @tactics.assume_tac(x582)
      fn(
        x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s583(x584)
      }
    },
  )
  let t580 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_sub_refl()]))
  let t579 = @simp.asm_rewrite_tac(@list.List([]))
  let t578 = @tactics.disch_then(fn(
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
    let s576 = @tactics.subst1_tac(x575)
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
  })
  let t574 = @simp.asm_rewrite_tac(@list.List([]))
  let t573 = @tactics.disch_then(fn(
    x570 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x570
    let t572 = @term_syntax.parse_term("EXP(CARD(ring_carrier((f : Ring[A]))), poly_deg(f, (p : ((Unit) -> Num) -> A)))")
    @tactics.mp_tac(
      @bool.specl(
        @list.List([@term_syntax.parse_term("poly_var((f : Ring[A]), one)"), t572]),
        th_1,
      ),
    )
  })
  let t569 = @tactics.first_assum(fn(
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
    let hom_1 = x567
    @tactics.mp_tac(@drule.match_mp(@ringtheory.ring_homomorphism_pow())(hom_1))
  })
  let t566 = @tactics.disch_then(fn(
    x563 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s564 = @tactics.subst1_tac(x563)
    fn(
      x565 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s564(x565)
    }
  })
  let t562 = @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_v1()]))
  let t561 = @tactics.disch_then(fn(
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
    let th = x558
    let t560 = @term_syntax.parse_term("poly_var((f : Ring[A]), one)")
    @tactics.mp_tac(
      @bool.specl(
        @list.List([
          @term_syntax.parse_term("ring_pow((R : Ring[((Unit) -> Num) -> A]), poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A))))"),
          t560,
        ]),
        th,
      ),
    )
  })
  let t581 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.first_assum(fn(
                        x556 : @kernel.Thm,
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
                        let hom = x556
                        @tactics.mp_tac(
                          @drule.match_mp(@ringtheory.ring_homomorphism_sub())(
                            hom,
                          ),
                        )
                      }),
                      t561,
                    ),
                    t562,
                  ),
                  t566,
                ),
                t569,
              ),
              t573,
            ),
            t574,
          ),
          t578,
        ),
        t579,
      ),
      t580,
    ),
    @tactics.all_tac,
  ])
  let t555 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), ring_sub(R, ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A)))), poly_var(f, one))) == ring_0((K : Ring[(((Unit) -> Num) -> A) -> Bool]))"),
    fn(
      x552 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s553 = @tactics.assume_tac(x552)
      fn(
        x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s553(x554)
      }
    },
  )
  let t550 = @simp.asm_rewrite_tac(@list.List([]))
  let t546 = @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), poly_var((f : Ring[A]), one))")
  let t549 = @tactics.disch_then(fn(
    x548 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x543 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s544 = @tactics.mp_tac(x543)
      fn(
        x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s544(x545)
      }
    })(((x547 : @kernel.Thm) => @bool.spec(t546, x547))(x548))
  })
  let t542 = @simp.asm_rewrite_tac(@list.List([]))
  let t541 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])"),
      finite_field_element_pow(),
    ),
  )
  let t540 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t551 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("EXP(CARD(ring_carrier((f : Ring[A]))), poly_deg(f, (p : ((Unit) -> Num) -> A))) == CARD(ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])))"),
                fn(
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
                  let s538 = @tactics.subst1_tac(x537)
                  fn(
                    x539 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s538(x539)
                  }
                },
              ),
              t540,
            ),
            t541,
          ),
          t542,
        ),
        t549,
      ),
      t550,
    ),
    @tactics.all_tac,
  ])
  let t536 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), poly_var((f : Ring[A]), one)), EXP(CARD(ring_carrier(f)), poly_deg(f, (p : ((Unit) -> Num) -> A)))) == ring_coset(R, J, poly_var(f, one))"),
    fn(
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
      let s534 = @tactics.assume_tac(x533)
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
    },
  )
  let t532 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @ringtheory.ring_homomorphism(),
        @sets.in_image(),
        @sets.subset(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t531 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool), poly_var((f : Ring[A]), one)), ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool])))"),
    fn(
      x528 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s529 = @tactics.assume_tac(x528)
      fn(
        x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s529(x530)
      }
    },
  )
  let t526 = @simp.rewrite_tac(@list.List([@ringtheory.poly_var_univ()]))
  let t527 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t526),
    @tactics.all_tac,
  ])
  let t525 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(poly_var((f : Ring[A]), one), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
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
      let s523 = @tactics.assume_tac(x522)
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
    },
  )
  let t520 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_homomorphism_ring_coset()]),
  )
  let t521 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t520),
    @tactics.all_tac,
  ])
  let t519 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool)))"),
    fn(
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
      let s517 = @tactics.assume_tac(x516)
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
    },
  )
  let t514 = @simp.asm_rewrite_tac(@list.List([]))
  let t513 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t515 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(f : Ring[A])"), t513]),
          quotient_poly_ring_finite_card(),
        ),
      ),
      t514,
    ),
    @tactics.all_tac,
  ])
  let t512 = @tactics.subgoal_then(
    @term_syntax.parse_term("field((K : Ring[(((Unit) -> Num) -> A) -> Bool])) && FINITE(ring_carrier(K)) && CARD(ring_carrier(K)) == EXP(CARD(ring_carrier((f : Ring[A]))), poly_deg(f, (p : ((Unit) -> Num) -> A)))"),
    @tactics.strip_assume_tac,
  )
  let t510 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.ring_irreducible_eq_maximal_ideal(),
      @ringtheory.maximal_imp_ring_ideal(),
    ]),
  )
  let t511 = @list.List([
    @tactics.then_tac(@simp.expand_tac("J"), t510),
    @tactics.all_tac,
  ])
  let t509 = @tactics.subgoal_then(
    @term_syntax.parse_term("maximal_ideal((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool)) && ring_ideal(R, J)"),
    @tactics.strip_assume_tac,
  )
  let t507 = @meson.asm_meson_tac(@list.List([@ringtheory.pid_poly_ring()]))
  let t508 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t507),
    @tactics.all_tac,
  ])
  let t506 = @tactics.subgoal_then(
    @term_syntax.parse_term("PID((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x503 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s504 = @tactics.assume_tac(x503)
      fn(
        x505 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s504(x505)
      }
    },
  )
  let t502 = @simp.abbrev_tac(
    @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool]) == quotient_ring((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))"),
  )
  let t501 = @simp.abbrev_tac(
    @term_syntax.parse_term("(J : (((Unit) -> Num) -> A) -> Bool) == ideal_generated((R : Ring[((Unit) -> Num) -> A]), {(p : ((Unit) -> Num) -> A)})"),
  )
  let t500 = @simp.abbrev_tac(
    @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A]) == poly_ring((f : Ring[A]), UNIV)"),
  )
  let t499 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t498 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((p : ((Unit) -> Num) -> A), ring_carrier(poly_ring((f : Ring[A]), UNIV)))"),
    fn(
      x495 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s496 = @tactics.assume_tac(x495)
      fn(
        x497 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s496(x497)
      }
    },
  )
  let t665 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.thenl(
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
                                                    @tactics.thenl(
                                                      @tactics.then_tac(
                                                        @tactics.thenl(
                                                          @tactics.then_tac(
                                                            @tactics.thenl(
                                                              @tactics.then_tac(
                                                                @tactics.thenl(
                                                                  @tactics.then_tac(
                                                                    @tactics.thenl(
                                                                      @tactics.then_tac(
                                                                        @tactics.thenl(
                                                                          @tactics.then_tac(
                                                                            @tactics.then_tac(
                                                                              @tactics.then_tac(
                                                                                @tactics.then_tac(
                                                                                  @tactics.thenl(
                                                                                    @tactics.then_tac(
                                                                                      @tactics.then_tac(
                                                                                        @tactics.repeat_tac(
                                                                                          @tactics.gen_tac,
                                                                                        ),
                                                                                        @tactics.strip_tac,
                                                                                      ),
                                                                                      t498,
                                                                                    ),
                                                                                    t499,
                                                                                  ),
                                                                                  t500,
                                                                                ),
                                                                                t501,
                                                                              ),
                                                                              t502,
                                                                            ),
                                                                            t506,
                                                                          ),
                                                                          t508,
                                                                        ),
                                                                        t509,
                                                                      ),
                                                                      t511,
                                                                    ),
                                                                    t512,
                                                                  ),
                                                                  t515,
                                                                ),
                                                                t519,
                                                              ),
                                                              t521,
                                                            ),
                                                            t525,
                                                          ),
                                                          t527,
                                                        ),
                                                        t531,
                                                      ),
                                                      t532,
                                                    ),
                                                    t536,
                                                  ),
                                                  t551,
                                                ),
                                                t555,
                                              ),
                                              t581,
                                            ),
                                            t585,
                                          ),
                                          t595,
                                        ),
                                        t599,
                                      ),
                                      t607,
                                    ),
                                    t614,
                                  ),
                                  t617,
                                ),
                                t618,
                              ),
                              t632,
                            ),
                            t636,
                          ),
                          t638,
                        ),
                        t643,
                      ),
                      t644,
                    ),
                    t645,
                  ),
                  t646,
                ),
                @tactics.conj_tac,
              ),
              t647,
            ),
            t648,
          ),
          t652,
        ),
        t663,
      ),
      t664,
    ),
    @int.asm_arith_tac,
  )
  irreducible_divides_xq_minus_x_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && ring_irreducible(poly_ring(f, UNIV), p) && divides(poly_deg(f, p), n) → ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one)))"),
      t665,
    ),
  )
}

///|
let irreducible_divides_xq_minus_x_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRREDUCIBLE_DIVIDES_XQ_MINUS_X_GEN",
)

///|
/// `IRREDUCIBLE_DIVIDES_XQ_MINUS_X_GEN`
pub fn irreducible_divides_xq_minus_x_gen() -> @kernel.Thm {
  irreducible_divides_xq_minus_x_gen_c.get()
}

///|
/// IRREDUCIBLE_DIVIDES_XQ_MINUS_X
fn step_8() -> Unit raise {
  let t671 = @meson.meson_tac(
    @list.List([@int.divides(), @arith.mult_clauses()]),
  )
  let t670 = @tactics.disch_then(@tactics.match_mp_tac)
  let t669 = @simp.asm_rewrite_tac(@list.List([]))
  let t666 = @term_syntax.parse_term("poly_deg((f : Ring[A]), (p : ((Unit) -> Num) -> A))")
  let t667 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t668 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t667, t666]),
      irreducible_divides_xq_minus_x_gen(),
    ),
  )
  let t672 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t668,
        ),
        t669,
      ),
      t670,
    ),
    t671,
  )
  irreducible_divides_xq_minus_x_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, field(f) && FINITE(ring_carrier(f)) && ring_irreducible(poly_ring(f, UNIV), p) → ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), poly_deg(f, p))), poly_var(f, one)))"),
      t672,
    ),
  )
}

///|
let irreducible_divides_xq_minus_x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRREDUCIBLE_DIVIDES_XQ_MINUS_X",
)

///|
/// `IRREDUCIBLE_DIVIDES_XQ_MINUS_X`
pub fn irreducible_divides_xq_minus_x() -> @kernel.Thm {
  irreducible_divides_xq_minus_x_c.get()
}

///|
/// FINITE_FIELD_POW_ITERATE
fn step_9() -> Unit raise {
  let t675 = @simp.asm_rewrite_tac(@list.List([]))
  let t674 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t673 = @simp.asm_simp_tac(
    @list.List([@ringtheory.ring_pow_mul(), finite_field_element_pow()]),
  )
  let t676 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @simp.rewrite_tac(@list.List([@arith.exp()])),
        ),
        t673,
      ),
      t674,
    ),
    t675,
  )
  let t677 = @list.List([
    @simp.simp_tac(@list.List([@arith.exp(), @ringtheory.ring_pow_1()])),
    t676,
  ])
  let t678 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t677,
  )
  finite_field_pow_iterate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ x : A, ∀ r : Num, field(f) && FINITE(ring_carrier(f)) && IN(x, ring_carrier(f)) → ring_pow(f, x, EXP(CARD(ring_carrier(f)), r)) == x"),
      t678,
    ),
  )
}

///|
let finite_field_pow_iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_FIELD_POW_ITERATE",
)

///|
/// `FINITE_FIELD_POW_ITERATE`
pub fn finite_field_pow_iterate() -> @kernel.Thm {
  finite_field_pow_iterate_c.get()
}

///|
/// RING_ENDOMORPHISM_FROBENIUS_ITERATE
fn step_10() -> Unit raise {
  let t701 = @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_pow()]))
  let t700 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t699 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @arith.exp()]))
  let t698 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t697 = @tactics.disch_then(@tactics.match_mp_tac)
  let t696 = @simp.asm_rewrite_tac(@list.List([]))
  let t693 = @term_syntax.parse_term("(x : A) => ring_pow((r : Ring[A]), x, EXP(ring_char(r), SUC((k : Num))))")
  let t694 = @term_syntax.parse_term("o((x : A) => ring_pow((r : Ring[A]), x, ring_char(r)), (x : A) => ring_pow(r, x, EXP(ring_char(r), (k : Num))))")
  let t695 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(r : Ring[A])"), t694, t693]),
      @ringtheory.ring_endomorphism_eq(),
    ),
  )
  let t690 = @simp.asm_simp_tac(
    @list.List([@ringtheory.ring_endomorphism_frobenius()]),
  )
  let t689 = @simp.asm_rewrite_tac(@list.List([]))
  let t691 = @list.List([
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t689),
    t690,
  ])
  let t688 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@ringtheory.ring_endomorphism())]),
  )
  let t687 = @tactics.exists_tac(@term_syntax.parse_term("(r : Ring[A])"))
  let t686 = @tactics.match_mp_tac(@ringtheory.ring_homomorphism_compose())
  let t692 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@ringtheory.ring_endomorphism()])),
              t686,
            ),
            t687,
          ),
          t688,
        ),
        @tactics.conj_tac,
      ),
      t691,
    ),
    @tactics.all_tac,
  ])
  let t702 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.disch_tac,
                      @tactics.subgoal_then(
                        @term_syntax.parse_term("ring_endomorphism((r : Ring[A]), o((x : A) => ring_pow(r, x, ring_char(r)), (x : A) => ring_pow(r, x, EXP(ring_char(r), (k : Num)))))"),
                        fn(
                          x683 : @kernel.Thm,
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
                          let s684 = @tactics.assume_tac(x683)
                          fn(
                            x685 : (
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
                            s684(x685)
                          }
                        },
                      ),
                    ),
                    t692,
                  ),
                  t695,
                ),
                t696,
              ),
              t697,
            ),
            t698,
          ),
          @tactics.disch_tac,
        ),
        t699,
      ),
      t700,
    ),
    t701,
  )
  let t682 = @simp.simp_tac(
    @list.List([
      @ringtheory.ring_endomorphism(),
      @ringtheory.ring_homomorphism_id(),
      @ringtheory.ring_pow_1(),
    ]),
  )
  let t679 = @term_syntax.parse_term("(x : A) => ring_pow((r : Ring[A]), x, 1)")
  let t680 = @term_syntax.parse_term("(x : A) => x")
  let t681 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(r : Ring[A])"), t680, t679]),
      @ringtheory.ring_endomorphism_eq(),
    ),
  )
  let t703 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @simp.rewrite_tac(@list.List([@arith.exp()])),
        ),
        t681,
      ),
      t682,
    ),
    t702,
  ])
  let t704 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t703,
  )
  ring_endomorphism_frobenius_iterate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : Ring[A], ∀ k : Num, prime(ring_char(r)) → ring_endomorphism(r, (x : A) => ring_pow(r, x, EXP(ring_char(r), k)))"),
      t704,
    ),
  )
}

///|
let ring_endomorphism_frobenius_iterate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RING_ENDOMORPHISM_FROBENIUS_ITERATE",
)

///|
/// `RING_ENDOMORPHISM_FROBENIUS_ITERATE`
pub fn ring_endomorphism_frobenius_iterate() -> @kernel.Thm {
  ring_endomorphism_frobenius_iterate_c.get()
}

///|
/// FIELD_ROOTS_BOUND
fn step_11() -> Unit raise {
  let t777 = @simp.asm_rewrite_tac(@list.List([]))
  let t775 = @term_syntax.parse_term("{(x : A) | IN(x, ring_carrier((r : Ring[A]))) && poly_eval(r, (g : ((Unit) -> Num) -> A), x) == ring_0(r)}")
  let t776 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("ring_carrier((r : Ring[A]))"), t775]),
      @sets.card_subset(),
    ),
  )
  let t773 = @simp.asm_rewrite_tac(@list.List([]))
  let t772 = @simp.expand_tac("P")
  let t774 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([@ringtheory.field_imp_integral_domain()]),
        ),
        t772,
      ),
      t773,
    ),
    @tactics.all_tac,
  ])
  let t770 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t771 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(r : Ring[A])"), t770]),
      @ringtheory.poly_root_bound(),
    ),
  )
  let t768 = @simp.asm_simp_tac(
    @list.List([@ringtheory.ring_sub_eq_0(), @ringtheory.ring_pow_v1()]),
  )
  let t767 = @simp.asm_simp_tac(
    @list.List([
      @ringtheory.poly_eval_sub(),
      @ringtheory.ring_polynomial_var(),
      @sets.in_univ(),
      @ringtheory.ring_polynomial_pow(),
      @ringtheory.poly_eval_pow(),
      @ringtheory.poly_eval_var(),
    ]),
  )
  let t766 = @simp.rewrite_tac(@list.List([@ringtheory.poly_ring_clauses()]))
  let t765 = @simp.expand_tac("P")
  let t764 = @simp.expand_tac("g")
  let t763 = @simp.asm_rewrite_tac(@list.List([]))
  let t762 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t769 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([@sets.subset(), @sets.in_elim_thm()]),
                    ),
                    t762,
                  ),
                  @tactics.disch_tac,
                ),
                t763,
              ),
              t764,
            ),
            t765,
          ),
          t766,
        ),
        t767,
      ),
      t768,
    ),
    @tactics.all_tac,
  ])
  let t761 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET(ring_carrier((r : Ring[A])), {(x : A) | IN(x, ring_carrier(r)) && poly_eval(r, (g : ((Unit) -> Num) -> A), x) == ring_0(r)})"),
    fn(
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
      let s759 = @tactics.assume_tac(x758)
      fn(
        x760 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s759(x760)
      }
    },
  )
  let t756 = @simp.asm_rewrite_tac(@list.List([]))
  let t755 = @simp.rewrite_tac(
    @list.List([
      @ringtheory.poly_ring_clauses(),
      @ringtheory.poly_deg_var_pow(),
      @ringtheory.poly_deg_var(),
    ]),
  )
  let t753 = @simp.rewrite_tac(
    @list.List([@ringtheory.ring_polynomial_var(), @sets.in_univ()]),
  )
  let t752 = @tactics.match_mp_tac(@ringtheory.ring_polynomial_pow())
  let t754 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @ringtheory.poly_ring_clauses(),
            @ringtheory.ring_polynomial_var(),
            @sets.in_univ(),
          ]),
        ),
        t752,
      ),
      t753,
    ),
    @tactics.all_tac,
  ])
  let t749 = @term_syntax.parse_term("poly_var((r : Ring[A]), one)")
  let t750 = @term_syntax.parse_term("ring_pow(poly_ring((r : Ring[A]), UNIV), poly_var(r, one), (n : Num))")
  let t751 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(r : Ring[A])"), t750, t749]),
      @ringtheory.poly_deg_sub_le(),
    ),
  )
  let t748 = @simp.expand_tac("P")
  let t757 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@simp.expand_tac("g"), t748),
                t751,
              ),
              @tactics.ants_tac,
            ),
            t754,
          ),
          t755,
        ),
        t756,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t747 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((r : Ring[A]), (g : ((Unit) -> Num) -> A)) <= (n : Num)"),
    fn(
      x744 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s745 = @tactics.assume_tac(x744)
      fn(
        x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s745(x746)
      }
    },
  )
  let t742 = @simp.asm_rewrite_tac(@list.List([]))
  let t741 = @simp.rewrite_tac(
    @list.List([@ringtheory.poly_deg_var_pow(), @ringtheory.poly_deg_var()]),
  )
  let t740 = @simp.expand_tac("P")
  let t736 = @term_syntax.parse_term("(poly_deg : (Ring[A], ((Unit) -> Num) -> A) -> Num)((r : Ring[A]))")
  let t739 = @tactics.disch_then(fn(
    x738 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x733 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s734 = @tactics.mp_tac(x733)
      fn(
        x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s734(x735)
      }
    })(((x737 : @kernel.Thm) => @equal.ap_term(t736, x737))(x738))
  })
  let t731 = @simp.simp_tac(
    @list.List([
      @ringtheory.ring_sub_eq_0(),
      @ringtheory.ring_pow_v1(),
      @ringtheory.poly_var_univ(),
    ]),
  )
  let t730 = @simp.expand_tac("P")
  let t729 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t732 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("ring_sub((P : Ring[((Unit) -> Num) -> A]), ring_pow(P, poly_var((r : Ring[A]), one), (n : Num)), poly_var(r, one)) == ring_0(P)"),
            fn(
              x726 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s727 = @tactics.mp_tac(x726)
              fn(
                x728 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s727(x728)
              }
            },
          ),
          t729,
        ),
        t730,
      ),
      t731,
    ),
    @tactics.all_tac,
  ])
  let t743 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.disch_tac,
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("ring_pow((P : Ring[((Unit) -> Num) -> A]), poly_var((r : Ring[A]), one), (n : Num)) == poly_var(r, one)"),
                    fn(
                      x723 : @kernel.Thm,
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
                      let s724 = @tactics.mp_tac(x723)
                      fn(
                        x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s724(x725)
                      }
                    },
                  ),
                ),
                t732,
              ),
              t739,
            ),
            t740,
          ),
          t741,
        ),
        t742,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t722 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((g : ((Unit) -> Num) -> A) == ring_0((P : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x719 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s720 = @tactics.assume_tac(x719)
      fn(
        x721 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s720(x721)
      }
    },
  )
  let t717 = @simp.simp_tac(
    @list.List([
      @ringtheory.ring_sub_v1(),
      @ringtheory.ring_pow_v1(),
      @ringtheory.poly_var_univ(),
    ]),
  )
  let t716 = @simp.expand_tac("P")
  let t718 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("g"), t716), t717),
    @tactics.all_tac,
  ])
  let t715 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((g : ((Unit) -> Num) -> A), ring_carrier((P : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x712 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s713 = @tactics.assume_tac(x712)
      fn(
        x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s713(x714)
      }
    },
  )
  let t711 = @simp.abbrev_tac(
    @term_syntax.parse_term("(g : ((Unit) -> Num) -> A) == ring_sub((P : Ring[((Unit) -> Num) -> A]), ring_pow(P, poly_var((r : Ring[A]), one), (n : Num)), poly_var(r, one))"),
  )
  let t710 = @simp.abbrev_tac(
    @term_syntax.parse_term("(P : Ring[((Unit) -> Num) -> A]) == poly_ring((r : Ring[A]), UNIV)"),
  )
  let t709 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@ringtheory.field_nontrivial(), @ringtheory.trivial_ring_10()]),
    ),
    @tactics.all_tac,
  ])
  let t708 = @tactics.subgoal_then(
    @term_syntax.parse_term("!(ring_1((r : Ring[A])) == ring_0(r))"),
    fn(
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
      let s706 = @tactics.assume_tac(x705)
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
  )
  let t778 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t708,
                                      ),
                                      t709,
                                    ),
                                    t710,
                                  ),
                                  t711,
                                ),
                                t715,
                              ),
                              t718,
                            ),
                            t722,
                          ),
                          t743,
                        ),
                        t747,
                      ),
                      t757,
                    ),
                    t761,
                  ),
                  t769,
                ),
                t771,
              ),
              @tactics.ants_tac,
            ),
            t774,
          ),
          @tactics.strip_tac,
        ),
        t776,
      ),
      t777,
    ),
    @int.asm_arith_tac,
  )
  field_roots_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : Ring[A], ∀ n : Num, field(r) && FINITE(ring_carrier(r)) && 2 <= n && (∀ a : A, IN(a, ring_carrier(r)) → ring_pow(r, a, n) == a) → CARD(ring_carrier(r)) <= n"),
      t778,
    ),
  )
}

///|
let field_roots_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FIELD_ROOTS_BOUND",
)

///|
/// `FIELD_ROOTS_BOUND`
pub fn field_roots_bound() -> @kernel.Thm {
  field_roots_bound_c.get()
}

///|
/// FINITE_FIELD_CARD_CHAR_POWER
fn step_12() -> Unit raise {
  let t800 = @simp.asm_simp_tac(@list.List([@prime.divides_prime_prime()]))
  let t799 = @tactics.disch_then(fn(
    x796 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x796
    let t798 = @bool.conj(
      @kernel.assume_rule(@term_syntax.parse_term("prime(ring_char((f : Ring[A])))")),
      th_1,
    )
    @tactics.mp_tac(@drule.match_mp(@prime.prime_divexp())(t798))
  })
  let t795 = @simp.asm_rewrite_tac(@list.List([]))
  let t794 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(f : Ring[A])"),
      @ringtheory.ring_char_divides_order(),
    ),
  )
  let t793 = @tactics.subgoal_then(
    @term_syntax.parse_term("(pp : Num) == ring_char((f : Ring[A]))"),
    fn(
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
      let th = x791
      @simp.asm_rewrite_tac(@list.List([th]))
    },
  )
  let t790 = @simp.asm_rewrite_tac(@list.List([]))
  let t789 = @tactics.exists_tac(@term_syntax.parse_term("(ee : Num)"))
  let t787 = @tactics.x_choose_then(@term_syntax.parse_term("(ee : Num)"))(
    @tactics.strip_assume_tac,
  )
  let t788 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(pp : Num)"))(t787),
  )
  let t786 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t785 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(f : Ring[A])"),
      @fieldtheory.finite_integral_domain_size(),
    ),
  )
  let t783 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t784 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@ringtheory.finite_integral_domain_char()),
      t783,
    ),
    @tactics.all_tac,
  ])
  let t782 = @tactics.subgoal_then(
    @term_syntax.parse_term("prime(ring_char((f : Ring[A])))"),
    fn(
      x779 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s780 = @tactics.assume_tac(x779)
      fn(
        x781 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s780(x781)
      }
    },
  )
  let t801 = @tactics.then_tac(
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
                          t782,
                        ),
                        t784,
                      ),
                      t785,
                    ),
                    t786,
                  ),
                  t788,
                ),
                t789,
              ),
              t790,
            ),
            t793,
          ),
          t794,
        ),
        t795,
      ),
      t799,
    ),
    t800,
  )
  finite_field_card_char_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], field(f) && FINITE(ring_carrier(f)) → (∃ e : Num, !(e == 0) && CARD(ring_carrier(f)) == EXP(ring_char(f), e))"),
      t801,
    ),
  )
}

///|
let finite_field_card_char_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_FIELD_CARD_CHAR_POWER",
)

///|
/// `FINITE_FIELD_CARD_CHAR_POWER`
pub fn finite_field_card_char_power() -> @kernel.Thm {
  finite_field_card_char_power_c.get()
}

///|
/// IRREDUCIBLE_DIVIDES_DEGREE_BOUND
fn step_13() -> Unit raise {
  let t1067 = @simp.rewrite_tac(@list.List([@arith.le_exp()]))
  let t1066 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1065 = @tactics.subgoal_then(@term_syntax.parse_term("EXP((q : Num), (d : Num)) <= EXP(q, (n : Num))"), fn(
    x1062 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1063 = @tactics.mp_tac(x1062)
    fn(
      x1064 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1063(x1064)
    }
  })
  let t1060 = @simp.asm_rewrite_tac(@list.List([]))
  let t1059 = @term_syntax.parse_term("EXP((q : Num), (n : Num))")
  let t1061 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])"), t1059]),
          field_roots_bound(),
        ),
      ),
      t1060,
    ),
    @tactics.all_tac,
  ])
  let t1058 = @tactics.subgoal_then(
    @term_syntax.parse_term("CARD(ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool]))) <= EXP((q : Num), (n : Num))"),
    fn(
      x1055 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1056 = @tactics.assume_tac(x1055)
      fn(
        x1057 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1056(x1057)
      }
    },
  )
  let t1053 = @list.List([
    @int.asm_arith_tac,
    @tactics.then_tac(@class.cond_cases_tac, @int.asm_arith_tac),
  ])
  let t1052 = @simp.rewrite_tac(@list.List([@arith.exp_1(), @arith.le_exp()]))
  let t1051 = @tactics.exists_tac(@term_syntax.parse_term("EXP((q : Num), 1)"))
  let t1054 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1051),
          t1052,
        ),
        @tactics.conj_tac,
      ),
      t1053,
    ),
    @tactics.all_tac,
  ])
  let t1050 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= EXP((q : Num), (n : Num))"), fn(
    x1047 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1048 = @tactics.assume_tac(x1047)
    fn(
      x1049 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1048(x1049)
    }
  })
  let t1044 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @kernel.assume_rule(
            @term_syntax.parse_term("(q : Num) == EXP(ring_char((f : Ring[A])), (e : Num))"),
          ),
          @arith.le_exp(),
        ]),
      ),
      @class.cond_cases_tac,
    ),
    @int.asm_arith_tac,
  )
  let t1045 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@arith.exp_1()])),
      @int.asm_arith_tac,
    ),
    t1044,
  ])
  let t1043 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP(ring_char((f : Ring[A])), 1)"),
  )
  let t1042 = @tactics.match_mp_tac(@arith.le_trans())
  let t1041 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.prime_ge_2()])),
    @tactics.all_tac,
  ])
  let t1046 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("2 <= ring_char((f : Ring[A]))"),
                fn(
                  x1038 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s1039 = @tactics.assume_tac(x1038)
                  fn(
                    x1040 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s1039(x1040)
                  }
                },
              ),
              t1041,
            ),
            t1042,
          ),
          t1043,
        ),
        @tactics.conj_tac,
      ),
      t1045,
    ),
    @tactics.all_tac,
  ])
  let t1037 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= (q : Num)"), fn(
    x1034 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1035 = @tactics.assume_tac(x1034)
    fn(
      x1036 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1035(x1036)
    }
  })
  let t1032 = @simp.asm_rewrite_tac(@list.List([]))
  let t1031 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1029 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1030 = @list.List([
    @tactics.then_tac(@simp.expand_tac("frob"), t1029),
    @tactics.all_tac,
  ])
  let t1028 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)((x : ((Unit) -> Num) -> A)), EXP((q : Num), (n : Num))) == o((frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool), proj, x)"),
    fn(
      x1025 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1026 = @tactics.subst1_tac(x1025)
      fn(
        x1027 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1026(x1027)
      }
    },
  )
  let t1024 = @tactics.first_x_assum(fn(
    x1023 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s1021 = @tactics.subst_all_tac(x1020)
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
    })(@equal.sym(x1023))
  })
  let t1018 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1017 = @simp.rewrite_tac(@list.List([@ringtheory.ring_epimorphism()]))
  let t1019 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @kernel.assume_rule(
            @term_syntax.parse_term("ring_epimorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool))"),
          ),
        ),
        t1017,
      ),
      t1018,
    ),
    @tactics.all_tac,
  ])
  let t1016 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : ((Unit) -> Num) -> A, IN(x, ring_carrier((R : Ring[((Unit) -> Num) -> A]))) && (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)(x) == (y : (((Unit) -> Num) -> A) -> Bool)"),
    @tactics.strip_assume_tac,
  )
  let t1033 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.x_gen_tac(
                      @term_syntax.parse_term("(y : (((Unit) -> Num) -> A) -> Bool)"),
                    ),
                    @tactics.disch_tac,
                  ),
                  t1016,
                ),
                t1019,
              ),
              t1024,
            ),
            t1028,
          ),
          t1030,
        ),
        t1031,
      ),
      t1032,
    ),
    @tactics.all_tac,
  ])
  let t1015 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : (((Unit) -> Num) -> A) -> Bool, IN(y, ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool]))) → ring_pow(K, y, EXP((q : Num), (n : Num))) == y"),
    fn(
      x1012 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1013 = @tactics.assume_tac(x1012)
      fn(
        x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1013(x1014)
      }
    },
  )
  let t1011 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @sets.univ_1(),
        @sets.forall_in_insert(),
        @sets.not_in_empty(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1010 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(@term_syntax.parse_term("poly_ring((f : Ring[A]), UNIV) == (R : Ring[((Unit) -> Num) -> A])")),
    ]),
  )
  let t1005 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t1006 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1007 = @term_syntax.parse_term("(f : Ring[A])")
  let t1008 = @term_syntax.parse_term("(proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)")
  let t1009 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("o((frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool))"),
        t1008,
        t1007,
        t1006,
        t1005,
      ]),
      @ringtheory.ring_homomorphisms_eq_from_poly_ring(),
    ),
  )
  let t1003 = @meson.asm_meson_tac(@list.List([]))
  let t1002 = @tactics.match_mp_tac(@ringtheory.in_ideal_generated_sing())
  let t1001 = @simp.expand_tac("J")
  let t1000 = @tactics.disch_then(fn(
    x998 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_5 = x998
    @simp.rewrite_tac(@list.List([th_5]))
  })
  let t997 = @list.List([
    @simp.asm_simp_tac(@list.List([@ringtheory.ring_pow_v1()])),
    @tactics.all_tac,
  ])
  let t993 = @term_syntax.parse_term("poly_var((f : Ring[A]), one)")
  let t994 = @term_syntax.parse_term("ring_pow((R : Ring[((Unit) -> Num) -> A]), poly_var((f : Ring[A]), one), EXP((q : Num), (n : Num)))")
  let t995 = @term_syntax.parse_term("(J : (((Unit) -> Num) -> A) -> Bool)")
  let t996 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"), t995, t994, t993]),
      @ringtheory.ring_coset_eq(),
    ),
  )
  let t992 = @simp.expand_tac("proj")
  let t991 = @tactics.disch_then(fn(
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
    (fn(
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
      let s988 = @tactics.subst1_tac(x987)
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
    })(@equal.sym(x990))
  })
  let t986 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("IN(poly_var((f : Ring[A]), one), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
      ),
    ]),
  )
  let t985 = @tactics.disch_then(fn(
    x982 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_4 = x982
    let t984 = @term_syntax.parse_term("EXP((q : Num), (n : Num))")
    @tactics.mp_tac(
      @bool.specl(
        @list.List([@term_syntax.parse_term("poly_var((f : Ring[A]), one)"), t984]),
        th_4,
      ),
    )
  })
  let t981 = @tactics.first_assum(fn(
    x979 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let hom_2 = x979
    @tactics.mp_tac(@drule.match_mp(@ringtheory.ring_homomorphism_pow())(hom_2))
  })
  let t977 = @simp.rewrite_tac(@list.List([@ringtheory.poly_var_univ()]))
  let t978 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t977),
    @tactics.all_tac,
  ])
  let t976 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(poly_var((f : Ring[A]), one), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
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
    },
  )
  let t971 = @simp.rewrite_tac(@list.List([]))
  let t972 = @list.List([
    @tactics.then_tac(@simp.expand_tac("frob"), t971),
    @tactics.all_tac,
  ])
  let t970 = @tactics.subgoal_then(
    @term_syntax.parse_term("(frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool)((proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)(poly_var((f : Ring[A]), one))) == ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), proj(poly_var(f, one)), EXP((q : Num), (n : Num)))"),
    fn(
      x967 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s968 = @tactics.subst1_tac(x967)
      fn(
        x969 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s968(x969)
      }
    },
  )
  let t1004 = @list.List([
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @simp.rewrite_tac(
                                      @list.List([@trivia.o_thm()]),
                                    ),
                                    t970,
                                  ),
                                  t972,
                                ),
                                t976,
                              ),
                              t978,
                            ),
                            t981,
                          ),
                          t985,
                        ),
                        t986,
                      ),
                      t991,
                    ),
                    t992,
                  ),
                  t996,
                ),
                @tactics.ants_tac,
              ),
              t997,
            ),
            t1000,
          ),
          t1001,
        ),
        t1002,
      ),
      t1003,
    ),
    @tactics.all_tac,
  ])
  let t966 = @tactics.subgoal_then(
    @term_syntax.parse_term("o((frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool), poly_var((f : Ring[A]), one)) == proj(poly_var(f, one))"),
    fn(
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
      let s964 = @tactics.assume_tac(x963)
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
    },
  )
  let t961 = @simp.asm_rewrite_tac(@list.List([]))
  let t960 = @tactics.match_mp_tac(finite_field_pow_iterate())
  let t959 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(
        @kernel.assume_rule(
          @term_syntax.parse_term("CARD(ring_carrier((f : Ring[A]))) == (q : Num)"),
        ),
      ),
    ]),
  )
  let t958 = @tactics.disch_then(fn(
    x957 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x954 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s955 = @tactics.subst1_tac(x954)
      fn(
        x956 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s955(x956)
      }
    })(@equal.sym(x957))
  })
  let t953 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("IN((c : A), ring_carrier((f : Ring[A])))"),
      ),
    ]),
  )
  let t952 = @tactics.disch_then(fn(
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
    let th_3 = x949
    let t951 = @term_syntax.parse_term("EXP((q : Num), (n : Num))")
    @tactics.mp_tac(
      @bool.specl(@list.List([@term_syntax.parse_term("(c : A)"), t951]), th_3),
    )
  })
  let t948 = @tactics.disch_then(fn(
    x946 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let hom_1 = x946
    @tactics.mp_tac(@drule.match_mp(@ringtheory.ring_homomorphism_pow())(hom_1))
  })
  let t945 = @simp.expand_tac("R")
  let t943 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t944 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t943]),
      @ringtheory.ring_homomorphism_poly_const(),
    ),
  )
  let t942 = @tactics.disch_then(fn(
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
    (fn(
      x938 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s939 = @tactics.subst1_tac(x938)
      fn(
        x940 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s939(x940)
      }
    })(@equal.sym(x941))
  })
  let t937 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("IN(poly_const((f : Ring[A]), (c : A)), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
      ),
    ]),
  )
  let t936 = @tactics.disch_then(fn(
    x933 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x933
    let t935 = @term_syntax.parse_term("EXP((q : Num), (n : Num))")
    @tactics.mp_tac(
      @bool.specl(
        @list.List([
          @term_syntax.parse_term("(poly_const : (Ring[A], A, (Unit) -> Num) -> A)((f : Ring[A]), (c : A))"),
          t935,
        ]),
        th_2,
      ),
    )
  })
  let t932 = @tactics.first_assum(fn(
    x930 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let hom = x930
    @tactics.mp_tac(@drule.match_mp(@ringtheory.ring_homomorphism_pow())(hom))
  })
  let t928 = @simp.asm_rewrite_tac(@list.List([]))
  let t927 = @simp.rewrite_tac(@list.List([@ringtheory.poly_const_v1()]))
  let t929 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("R"), t927), t928),
    @tactics.all_tac,
  ])
  let t926 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(poly_const((f : Ring[A]), (c : A)), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x923 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s924 = @tactics.assume_tac(x923)
      fn(
        x925 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s924(x925)
      }
    },
  )
  let t921 = @simp.rewrite_tac(@list.List([]))
  let t922 = @list.List([
    @tactics.then_tac(@simp.expand_tac("frob"), t921),
    @tactics.all_tac,
  ])
  let t920 = @tactics.subgoal_then(
    @term_syntax.parse_term("(frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool)((proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)(poly_const((f : Ring[A]), (c : A)))) == ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), proj(poly_const(f, c)), EXP((q : Num), (n : Num)))"),
    fn(
      x917 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s918 = @tactics.subst1_tac(x917)
      fn(
        x919 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s918(x919)
      }
    },
  )
  let t916 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t962 = @list.List([
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
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.x_gen_tac(
                                                @term_syntax.parse_term("(c : A)"),
                                              ),
                                              @tactics.disch_tac,
                                            ),
                                            t916,
                                          ),
                                          t920,
                                        ),
                                        t922,
                                      ),
                                      t926,
                                    ),
                                    t929,
                                  ),
                                  t932,
                                ),
                                t936,
                              ),
                              t937,
                            ),
                            t942,
                          ),
                          t944,
                        ),
                        t945,
                      ),
                      t948,
                    ),
                    t952,
                  ),
                  t953,
                ),
                t958,
              ),
              @tactics.ap_term_tac,
            ),
            @tactics.ap_term_tac,
          ),
          t959,
        ),
        t960,
      ),
      t961,
    ),
    @tactics.all_tac,
  ])
  let t915 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ c : A, IN(c, ring_carrier((f : Ring[A]))) → o((frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool), poly_const(f, c)) == proj(poly_const(f, c))"),
    fn(
      x912 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s913 = @tactics.assume_tac(x912)
      fn(
        x914 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s913(x914)
      }
    },
  )
  let t911 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_epimorphism()])),
    @tactics.all_tac,
  ])
  let t910 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x907 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s908 = @tactics.assume_tac(x907)
      fn(
        x909 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s908(x909)
      }
    },
  )
  let t905 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@ringtheory.ring_endomorphism())]),
  )
  let t904 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_epimorphism()])),
    @tactics.all_tac,
  ])
  let t903 = @tactics.exists_tac(
    @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])"),
  )
  let t902 = @tactics.match_mp_tac(@ringtheory.ring_homomorphism_compose())
  let t906 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@ringtheory.ring_endomorphism()])),
              t902,
            ),
            t903,
          ),
          @tactics.conj_tac,
        ),
        t904,
      ),
      t905,
    ),
    @tactics.all_tac,
  ])
  let t901 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), o((frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool)))"),
    fn(
      x898 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s899 = @tactics.assume_tac(x898)
      fn(
        x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s899(x900)
      }
    },
  )
  let t896 = @simp.asm_rewrite_tac(@list.List([]))
  let t895 = @tactics.match_mp_tac(@ringtheory.ring_epimorphism_ring_coset())
  let t894 = @simp.expand_tac("proj")
  let t897 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("K"), t894), t895),
      t896,
    ),
    @tactics.all_tac,
  ])
  let t893 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_epimorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), (proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x890 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s891 = @tactics.assume_tac(x890)
      fn(
        x892 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s891(x892)
      }
    },
  )
  let t889 = @simp.abbrev_tac(
    @term_syntax.parse_term("(proj : (((Unit) -> Num) -> A, ((Unit) -> Num) -> A) -> Bool) == ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))"),
  )
  let t887 = @simp.asm_rewrite_tac(@list.List([]))
  let t886 = @tactics.match_mp_tac(ring_endomorphism_frobenius_iterate())
  let t884 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("EXP((q : Num), (n : Num)) == EXP(ring_char((K : Ring[(((Unit) -> Num) -> A) -> Bool])), (e : Num) * n)"),
      ),
    ]),
  )
  let t885 = @list.List([
    @tactics.then_tac(@simp.expand_tac("frob"), t884),
    @tactics.all_tac,
  ])
  let t888 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("(frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool) == ((y : (((Unit) -> Num) -> A) -> Bool) => ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), y, EXP(ring_char(K), (e : Num) * (n : Num))))"),
            fn(
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
              let s882 = @tactics.subst1_tac(x881)
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
            },
          ),
          t885,
        ),
        t886,
      ),
      t887,
    ),
    @tactics.all_tac,
  ])
  let t880 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_endomorphism((K : Ring[(((Unit) -> Num) -> A) -> Bool]), (frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool))"),
    fn(
      x877 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s878 = @tactics.assume_tac(x877)
      fn(
        x879 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s878(x879)
      }
    },
  )
  let t876 = @simp.abbrev_tac(
    @term_syntax.parse_term("(frob : ((((Unit) -> Num) -> A) -> Bool, ((Unit) -> Num) -> A) -> Bool) == ((y : (((Unit) -> Num) -> A) -> Bool) => ring_pow((K : Ring[(((Unit) -> Num) -> A) -> Bool]), y, EXP((q : Num), (n : Num))))"),
  )
  let t875 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@arith.exp_exp()])),
    @tactics.all_tac,
  ])
  let t874 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP((q : Num), (n : Num)) == EXP(ring_char((K : Ring[(((Unit) -> Num) -> A) -> Bool])), (e : Num) * n)"),
    fn(
      x871 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s872 = @tactics.assume_tac(x871)
      fn(
        x873 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s872(x873)
      }
    },
  )
  let t869 = @simp.asm_rewrite_tac(@list.List([]))
  let t870 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispec(
          @term_syntax.parse_term("(f : Ring[A])"),
          finite_field_card_char_power(),
        ),
      ),
      t869,
    ),
    @tactics.all_tac,
  ])
  let t868 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ e : Num, !(e == 0) && (q : Num) == EXP(ring_char((f : Ring[A])), e)"),
    @tactics.strip_assume_tac,
  )
  let t866 = @meson.asm_meson_tac(@list.List([]))
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
    let th_1 = x863
    @simp.rewrite_tac(@list.List([@equal.gsym(th_1)]))
  })
  let t862 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.field_imp_integral_domain()])),
    @tactics.all_tac,
  ])
  let t860 = @term_syntax.parse_term("ring_char((f : Ring[A]))")
  let t861 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])"), t860]),
      @ringtheory.ring_char_divides_prime(),
    ),
  )
  let t859 = @simp.asm_rewrite_tac(@list.List([]))
  let t857 = @term_syntax.parse_term("ring_coset((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))")
  let t858 = @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool])")
  let t867 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.mp_tac(
                    @bool.ispecl(
                      @list.List([
                        @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"),
                        t858,
                        t857,
                      ]),
                      @ringtheory.ring_char_homomorphic_image(),
                    ),
                  ),
                  t859,
                ),
                @tactics.disch_tac,
              ),
              t861,
            ),
            @tactics.ants_tac,
          ),
          t862,
        ),
        t865,
      ),
      t866,
    ),
    @tactics.all_tac,
  ])
  let t856 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_char((K : Ring[(((Unit) -> Num) -> A) -> Bool])) == ring_char((f : Ring[A]))"),
    fn(
      x853 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s854 = @tactics.assume_tac(x853)
      fn(
        x855 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s854(x855)
      }
    },
  )
  let t851 = @simp.simp_tac(@list.List([]))
  let t850 = @tactics.disch_then(fn(
    x848 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x848
    @tactics.mp_tac(
      @drule.match_mp(@ringtheory.ring_char_monomorphic_image())(th),
    )
  })
  let t847 = @simp.expand_tac("R")
  let t846 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t852 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("(f : Ring[A])"), t846]),
              @ringtheory.ring_monomorphism_poly_const(),
            ),
          ),
          t847,
        ),
        t850,
      ),
      t851,
    ),
    @tactics.all_tac,
  ])
  let t845 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_char((R : Ring[((Unit) -> Num) -> A])) == ring_char((f : Ring[A]))"),
    fn(
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
    },
  )
  let t840 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_homomorphism_ring_coset()]),
  )
  let t841 = @list.List([
    @tactics.then_tac(@simp.expand_tac("K"), t840),
    @tactics.all_tac,
  ])
  let t839 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_homomorphism(((R : Ring[((Unit) -> Num) -> A]), (K : Ring[(((Unit) -> Num) -> A) -> Bool])), ring_coset(R, (J : (((Unit) -> Num) -> A) -> Bool)))"),
    fn(
      x836 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s837 = @tactics.assume_tac(x836)
      fn(
        x838 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s837(x838)
      }
    },
  )
  let t834 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t835 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@ringtheory.finite_integral_domain_char()),
      t834,
    ),
    @tactics.all_tac,
  ])
  let t833 = @tactics.subgoal_then(
    @term_syntax.parse_term("prime(ring_char((f : Ring[A])))"),
    fn(
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
      let s831 = @tactics.assume_tac(x830)
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
    },
  )
  let t829 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t828 = @tactics.subgoal_then(
    @term_syntax.parse_term("CARD(ring_carrier((K : Ring[(((Unit) -> Num) -> A) -> Bool]))) == EXP((q : Num), (d : Num))"),
    fn(
      x825 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s826 = @tactics.assume_tac(x825)
      fn(
        x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s826(x827)
      }
    },
  )
  let t823 = @simp.asm_rewrite_tac(@list.List([]))
  let t822 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t824 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(f : Ring[A])"), t822]),
          quotient_poly_ring_finite_card(),
        ),
      ),
      t823,
    ),
    @tactics.all_tac,
  ])
  let t821 = @tactics.subgoal_then(
    @term_syntax.parse_term("field((K : Ring[(((Unit) -> Num) -> A) -> Bool])) && FINITE(ring_carrier(K)) && CARD(ring_carrier(K)) == EXP(CARD(ring_carrier((f : Ring[A]))), poly_deg(f, (p : ((Unit) -> Num) -> A)))"),
    @tactics.strip_assume_tac,
  )
  let t819 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.ring_irreducible_eq_maximal_ideal(),
      @ringtheory.maximal_imp_ring_ideal(),
    ]),
  )
  let t820 = @list.List([
    @tactics.then_tac(@simp.expand_tac("J"), t819),
    @tactics.all_tac,
  ])
  let t818 = @tactics.subgoal_then(
    @term_syntax.parse_term("maximal_ideal((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool)) && ring_ideal(R, J)"),
    @tactics.strip_assume_tac,
  )
  let t816 = @meson.asm_meson_tac(@list.List([@ringtheory.pid_poly_ring()]))
  let t817 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t816),
    @tactics.all_tac,
  ])
  let t815 = @tactics.subgoal_then(
    @term_syntax.parse_term("PID((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x812 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s813 = @tactics.assume_tac(x812)
      fn(
        x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s813(x814)
      }
    },
  )
  let t811 = @simp.abbrev_tac(
    @term_syntax.parse_term("(K : Ring[(((Unit) -> Num) -> A) -> Bool]) == quotient_ring((R : Ring[((Unit) -> Num) -> A]), (J : (((Unit) -> Num) -> A) -> Bool))"),
  )
  let t810 = @simp.abbrev_tac(
    @term_syntax.parse_term("(J : (((Unit) -> Num) -> A) -> Bool) == ideal_generated((R : Ring[((Unit) -> Num) -> A]), {(p : ((Unit) -> Num) -> A)})"),
  )
  let t809 = @simp.abbrev_tac(
    @term_syntax.parse_term("(d : Num) == poly_deg((f : Ring[A]), (p : ((Unit) -> Num) -> A))"),
  )
  let t808 = @simp.abbrev_tac(
    @term_syntax.parse_term("(q : Num) == CARD(ring_carrier((f : Ring[A])))"),
  )
  let t807 = @simp.abbrev_tac(
    @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A]) == poly_ring((f : Ring[A]), UNIV)"),
  )
  let t806 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t805 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((p : ((Unit) -> Num) -> A), ring_carrier(poly_ring((f : Ring[A]), UNIV)))"),
    fn(
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
      let s803 = @tactics.assume_tac(x802)
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
    },
  )
  let t1068 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
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
                                                      @tactics.thenl(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.thenl(
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
                                                                                  @tactics.thenl(
                                                                                    @tactics.then_tac(
                                                                                      @tactics.thenl(
                                                                                        @tactics.then_tac(
                                                                                          @tactics.thenl(
                                                                                            @tactics.then_tac(
                                                                                              @tactics.thenl(
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
                                                                                                                    @tactics.thenl(
                                                                                                                      @tactics.then_tac(
                                                                                                                        @tactics.then_tac(
                                                                                                                          @tactics.repeat_tac(
                                                                                                                            @tactics.gen_tac,
                                                                                                                          ),
                                                                                                                          @tactics.strip_tac,
                                                                                                                        ),
                                                                                                                        t805,
                                                                                                                      ),
                                                                                                                      t806,
                                                                                                                    ),
                                                                                                                    t807,
                                                                                                                  ),
                                                                                                                  t808,
                                                                                                                ),
                                                                                                                t809,
                                                                                                              ),
                                                                                                              t810,
                                                                                                            ),
                                                                                                            t811,
                                                                                                          ),
                                                                                                          t815,
                                                                                                        ),
                                                                                                        t817,
                                                                                                      ),
                                                                                                      t818,
                                                                                                    ),
                                                                                                    t820,
                                                                                                  ),
                                                                                                  t821,
                                                                                                ),
                                                                                                t824,
                                                                                              ),
                                                                                              t828,
                                                                                            ),
                                                                                            t829,
                                                                                          ),
                                                                                          t833,
                                                                                        ),
                                                                                        t835,
                                                                                      ),
                                                                                      t839,
                                                                                    ),
                                                                                    t841,
                                                                                  ),
                                                                                  t845,
                                                                                ),
                                                                                t852,
                                                                              ),
                                                                              t856,
                                                                            ),
                                                                            t867,
                                                                          ),
                                                                          t868,
                                                                        ),
                                                                        t870,
                                                                      ),
                                                                      t874,
                                                                    ),
                                                                    t875,
                                                                  ),
                                                                  t876,
                                                                ),
                                                                t880,
                                                              ),
                                                              t888,
                                                            ),
                                                            t889,
                                                          ),
                                                          t893,
                                                        ),
                                                        t897,
                                                      ),
                                                      t901,
                                                    ),
                                                    t906,
                                                  ),
                                                  t910,
                                                ),
                                                t911,
                                              ),
                                              t915,
                                            ),
                                            t962,
                                          ),
                                          t966,
                                        ),
                                        t1004,
                                      ),
                                      t1009,
                                    ),
                                    t1010,
                                  ),
                                  @tactics.ants_tac,
                                ),
                                t1011,
                              ),
                              @tactics.disch_tac,
                            ),
                            t1015,
                          ),
                          t1033,
                        ),
                        t1037,
                      ),
                      t1046,
                    ),
                    t1050,
                  ),
                  t1054,
                ),
                t1058,
              ),
              t1061,
            ),
            t1065,
          ),
          t1066,
        ),
        t1067,
      ),
      @class.cond_cases_tac,
    ),
    @int.asm_arith_tac,
  )
  irreducible_divides_degree_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && ring_irreducible(poly_ring(f, UNIV), p) && ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one))) && 1 <= n → poly_deg(f, p) <= n"),
      t1068,
    ),
  )
}

///|
let irreducible_divides_degree_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRREDUCIBLE_DIVIDES_DEGREE_BOUND",
)

///|
/// `IRREDUCIBLE_DIVIDES_DEGREE_BOUND`
pub fn irreducible_divides_degree_bound() -> @kernel.Thm {
  irreducible_divides_degree_bound_c.get()
}

///|
/// IRREDUCIBLE_DIVIDES_DEGREE
fn step_14() -> Unit raise {
  let t1197 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @int.asm_arith_tac),
    @tactics.all_tac,
  ])
  let t1194 = @term_syntax.parse_term("(r : Num)")
  let t1195 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1196 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1195, t1194]),
      irreducible_divides_degree_bound(),
    ),
  )
  let t1192 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num)"))
  let t1193 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.divides()])), t1192),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1191 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t1189 = @simp.asm_rewrite_tac(@list.List([]))
  let t1185 = @term_syntax.parse_term("EXP((q : Num), (r : Num))")
  let t1186 = @term_syntax.parse_term("(x : ((Unit) -> Num) -> A)")
  let t1187 = @term_syntax.parse_term("(u : ((Unit) -> Num) -> A)")
  let t1188 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1190 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"),
            t1188,
            t1187,
            t1186,
            t1185,
          ]),
          ring_divides_reduce(),
        ),
      ),
      t1189,
    ),
    @tactics.all_tac,
  ])
  let t1184 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, (x : ((Unit) -> Num) -> A), EXP((q : Num), (r : Num))), x))"),
    fn(
      x1181 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1182 = @tactics.assume_tac(x1181)
      fn(
        x1183 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1182(x1183)
      }
    },
  )
  let t1180 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@arith.exp_eq_0()])),
    @tactics.all_tac,
  ])
  let t1179 = @tactics.subgoal_then(@term_syntax.parse_term("!(EXP((q : Num), (r : Num)) == 0)"), fn(
    x1176 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1177 = @tactics.assume_tac(x1176)
    fn(
      x1178 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1177(x1178)
    }
  })
  let t1173 = @tactics.first_assum(fn(
    x1170 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1171 = @tactics.accept_tac(x1170)
    fn(
      x1172 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1171(x1172)
    }
  })
  let t1169 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t1168 = @tactics.disch_then(fn(
    x1165 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1166 = @tactics.subst1_tac(x1165)
    fn(
      x1167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1166(x1167)
    }
  })
  let t1164 = @list.List([
    @simp.asm_rewrite_tac(@list.List([])),
    @tactics.all_tac,
  ])
  let t1160 = @term_syntax.parse_term("EXP((q : Num), (r : Num))")
  let t1161 = @term_syntax.parse_term("EXP((q : Num), (k : Num) * (d : Num))")
  let t1162 = @term_syntax.parse_term("(x : ((Unit) -> Num) -> A)")
  let t1163 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"),
        t1162,
        t1161,
        t1160,
      ]),
      @ringtheory.ring_pow_pow(),
    ),
  )
  let t1174 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(@simp.expand_tac("u"), t1163),
                  @tactics.ants_tac,
                ),
                t1164,
              ),
              t1168,
            ),
            @tactics.ap_term_tac,
          ),
          t1169,
        ),
        @tactics.ap_term_tac,
      ),
      @int.asm_arith_tac,
    ),
    t1173,
  ])
  let t1175 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("ring_pow((R : Ring[((Unit) -> Num) -> A]), (u : ((Unit) -> Num) -> A), EXP((q : Num), (r : Num))) == ring_pow(R, (x : ((Unit) -> Num) -> A), EXP(q, (n : Num)))"),
        fn(
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
          let s1158 = @tactics.subst1_tac(x1157)
          fn(
            x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1158(x1159)
          }
        },
      ),
      t1174,
    ),
    @tactics.all_tac,
  ])
  let t1156 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, (u : ((Unit) -> Num) -> A), EXP((q : Num), (r : Num))), (x : ((Unit) -> Num) -> A)))"),
    fn(
      x1153 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1154 = @tactics.assume_tac(x1153)
      fn(
        x1155 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1154(x1155)
      }
    },
  )
  let t1151 = @simp.asm_rewrite_tac(@list.List([]))
  let t1150 = @tactics.match_mp_tac(@ringtheory.ring_pow_v1())
  let t1152 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("u"), t1150), t1151),
    @tactics.all_tac,
  ])
  let t1149 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((u : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x1146 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1147 = @tactics.assume_tac(x1146)
      fn(
        x1148 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1147(x1148)
      }
    },
  )
  let t1145 = @simp.abbrev_tac(
    @term_syntax.parse_term("(u : ((Unit) -> Num) -> A) == ring_pow((R : Ring[((Unit) -> Num) -> A]), (x : ((Unit) -> Num) -> A), EXP((q : Num), (k : Num) * (d : Num)))"),
  )
  let t1143 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num)"))
  let t1142 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t1141 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1140 = @simp.asm_rewrite_tac(@list.List([]))
  let t1138 = @term_syntax.parse_term("(k : Num) * (d : Num)")
  let t1139 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1144 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.ispecl(
                  @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1139, t1138]),
                  irreducible_divides_xq_minus_x_gen(),
                ),
              ),
              t1140,
            ),
            t1141,
          ),
          t1142,
        ),
        t1143,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1137 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, (x : ((Unit) -> Num) -> A), EXP((q : Num), (k : Num) * (d : Num))), x))"),
    fn(
      x1134 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1135 = @tactics.assume_tac(x1134)
      fn(
        x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1135(x1136)
      }
    },
  )
  let t1132 = @simp.rewrite_tac(@list.List([@arith.mod_lt_eq()]))
  let t1133 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.expand_tac("r"), t1132),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1131 = @tactics.subgoal_then(@term_syntax.parse_term("(r : Num) < (d : Num)"), fn(
    x1128 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1129 = @tactics.assume_tac(x1128)
    fn(
      x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1129(x1130)
    }
  })
  let t1126 = @meson.meson_tac(
    @list.List([@arith.division_simp(), @arith.add_sym()]),
  )
  let t1127 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x1123 : String,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1124 = @simp.expand_tac(x1123)
          fn(
            x1125 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1124(x1125)
          }
        },
        @list.List(["k", "r"]),
      ),
      t1126,
    ),
    @tactics.all_tac,
  ])
  let t1122 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == (k : Num) * (d : Num) + (r : Num)"), fn(
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
    let s1120 = @tactics.assume_tac(x1119)
    fn(
      x1121 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1120(x1121)
    }
  })
  let t1118 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Num) == MOD((n : Num), (d : Num))"))
  let t1117 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Num) == DIV((n : Num), (d : Num))"))
  let t1115 = @simp.asm_rewrite_tac(@list.List([]))
  let t1114 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1116 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1114]),
          irreducible_divides_xq_minus_x(),
        ),
      ),
      t1115,
    ),
    @tactics.all_tac,
  ])
  let t1113 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, (x : ((Unit) -> Num) -> A), EXP((q : Num), (d : Num))), x))"),
    fn(
      x1110 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1111 = @tactics.assume_tac(x1110)
      fn(
        x1112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1111(x1112)
      }
    },
  )
  let t1108 = @meson.asm_meson_tac(
    @list.List([@sets.card_eq_0(), @ringtheory.ring_carrier_nonempty()]),
  )
  let t1109 = @list.List([
    @tactics.then_tac(@simp.expand_tac("q"), t1108),
    @tactics.all_tac,
  ])
  let t1107 = @tactics.subgoal_then(@term_syntax.parse_term("!((q : Num) == 0)"), fn(
    x1104 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1105 = @tactics.assume_tac(x1104)
    fn(
      x1106 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1105(x1106)
    }
  })
  let t1102 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.integral_domain_poly_ring(),
      @ringtheory.field_imp_integral_domain(),
    ]),
  )
  let t1103 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t1102),
    @tactics.all_tac,
  ])
  let t1101 = @tactics.subgoal_then(
    @term_syntax.parse_term("integral_domain((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x1098 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1099 = @tactics.assume_tac(x1098)
      fn(
        x1100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1099(x1100)
      }
    },
  )
  let t1096 = @simp.rewrite_tac(@list.List([@ringtheory.poly_var_univ()]))
  let t1095 = @simp.expand_tac("R")
  let t1097 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("x"), t1095), t1096),
    @tactics.all_tac,
  ])
  let t1094 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((x : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x1091 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1092 = @tactics.assume_tac(x1091)
      fn(
        x1093 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1092(x1093)
      }
    },
  )
  let t1088 = @simp.rewrite_tac(@list.List([]))
  let t1087 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()]))
  let t1089 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1087),
    t1088,
  ])
  let t1084 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1085 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1086 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1085, t1084]),
      poly_nonunit_degree_ge_1(),
    ),
  )
  let t1090 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@simp.expand_tac("d"), t1086),
        @tactics.ants_tac,
      ),
      t1089,
    ),
    @tactics.all_tac,
  ])
  let t1083 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (d : Num)"), fn(
    x1080 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1081 = @tactics.assume_tac(x1080)
    fn(
      x1082 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1081(x1082)
    }
  })
  let t1079 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@prime.divides_0()])),
    @tactics.all_tac,
  ])
  let t1078 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1077 = @simp.abbrev_tac(
    @term_syntax.parse_term("(x : ((Unit) -> Num) -> A) == poly_var((f : Ring[A]), one)"),
  )
  let t1076 = @simp.abbrev_tac(
    @term_syntax.parse_term("(d : Num) == poly_deg((f : Ring[A]), (p : ((Unit) -> Num) -> A))"),
  )
  let t1075 = @simp.abbrev_tac(
    @term_syntax.parse_term("(q : Num) == CARD(ring_carrier((f : Ring[A])))"),
  )
  let t1074 = @simp.abbrev_tac(
    @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A]) == poly_ring((f : Ring[A]), UNIV)"),
  )
  let t1073 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t1072 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((p : ((Unit) -> Num) -> A), ring_carrier(poly_ring((f : Ring[A]), UNIV)))"),
    fn(
      x1069 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1070 = @tactics.assume_tac(x1069)
      fn(
        x1071 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1070(x1071)
      }
    },
  )
  let t1198 = @tactics.then_tac(
    @tactics.thenl(
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
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.thenl(
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
                                                                                      @tactics.repeat_tac(
                                                                                        @tactics.gen_tac,
                                                                                      ),
                                                                                      @tactics.strip_tac,
                                                                                    ),
                                                                                    t1072,
                                                                                  ),
                                                                                  t1073,
                                                                                ),
                                                                                t1074,
                                                                              ),
                                                                              t1075,
                                                                            ),
                                                                            t1076,
                                                                          ),
                                                                          t1077,
                                                                        ),
                                                                        t1078,
                                                                      ),
                                                                      t1079,
                                                                    ),
                                                                    t1083,
                                                                  ),
                                                                  t1090,
                                                                ),
                                                                t1094,
                                                              ),
                                                              t1097,
                                                            ),
                                                            t1101,
                                                          ),
                                                          t1103,
                                                        ),
                                                        t1107,
                                                      ),
                                                      t1109,
                                                    ),
                                                    t1113,
                                                  ),
                                                  t1116,
                                                ),
                                                t1117,
                                              ),
                                              t1118,
                                            ),
                                            t1122,
                                          ),
                                          t1127,
                                        ),
                                        t1131,
                                      ),
                                      t1133,
                                    ),
                                    t1137,
                                  ),
                                  t1144,
                                ),
                                t1145,
                              ),
                              t1149,
                            ),
                            t1152,
                          ),
                          t1156,
                        ),
                        t1175,
                      ),
                      t1179,
                    ),
                    t1180,
                  ),
                  t1184,
                ),
                t1190,
              ),
              t1191,
            ),
            t1193,
          ),
          t1196,
        ),
        @tactics.ants_tac,
      ),
      t1197,
    ),
    @int.asm_arith_tac,
  )
  irreducible_divides_degree_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && ring_irreducible(poly_ring(f, UNIV), p) && ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one))) → divides(poly_deg(f, p), n)"),
      t1198,
    ),
  )
}

///|
let irreducible_divides_degree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IRREDUCIBLE_DIVIDES_DEGREE",
)

///|
/// `IRREDUCIBLE_DIVIDES_DEGREE`
pub fn irreducible_divides_degree() -> @kernel.Thm {
  irreducible_divides_degree_c.get()
}

///|
/// RABIN_IRREDUCIBILITY_NECESSARY
fn step_15() -> Unit raise {
  let t1226 = @term_syntax.parse_term("(q : Num)")
  let t1227 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(k : Num)"), t1226]),
      @arith.mult_eq_1(),
    ),
  )
  let t1225 = @simp.asm_rewrite_tac(@list.List([]))
  let t1224 = @simp.rewrite_tac(@list.List([@arith.eq_mult_lcancel()]))
  let t1222 = @simp.asm_rewrite_tac(@list.List([]))
  let t1221 = @tactics.undisch_tac(@term_syntax.parse_term("(n : Num) == DIV(n, (q : Num)) * q"))
  let t1223 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@arith.mult_clauses()])),
          t1221,
        ),
        t1222,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1220 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) * ((k : Num) * (q : Num)) == n * 1"), fn(
    x1217 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1218 = @tactics.mp_tac(x1217)
    fn(
      x1219 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1218(x1219)
    }
  })
  let t1214 = @term_syntax.parse_term("(k : Num)")
  let t1216 = @tactics.disch_then((x1215 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1214, x1215)
  })
  let t1211 = @simp.gen_rewrite_rule(
    fn(
      x1210 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1210
    },
    @list.List([@int.divides()]),
  )
  let t1213 = @tactics.first_x_assum(fn(
    x1212 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1207 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1208 = @tactics.mp_tac(x1207)
      fn(
        x1209 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1208(x1209)
      }
    })(t1211(x1212))
  })
  let t1206 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides_div_mult()])),
    @tactics.all_tac,
  ])
  let t1205 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == DIV(n, (q : Num)) * q"), fn(
    x1202 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1203 = @tactics.assume_tac(x1202)
    fn(
      x1204 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1203(x1204)
    }
  })
  let t1200 = @simp.asm_rewrite_tac(@list.List([]))
  let t1201 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.spec(@term_syntax.parse_term("(q : Num)"), @prime.prime_ge_2()),
        ),
        t1200,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1199 = @tactics.subgoal_then(
    @term_syntax.parse_term("2 <= (q : Num) && !(q == 0)"),
    @tactics.strip_assume_tac,
  )
  let t1228 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.gen_tac),
                              @tactics.strip_tac,
                            ),
                            t1199,
                          ),
                          t1201,
                        ),
                        t1205,
                      ),
                      t1206,
                    ),
                    t1213,
                  ),
                  t1216,
                ),
                t1220,
              ),
              t1223,
            ),
            t1224,
          ),
          t1225,
        ),
        @tactics.disch_tac,
      ),
      t1227,
    ),
    @int.asm_arith_tac,
  )
  let divides_div_prime_absurd = @tactics.prove(
    @term_syntax.parse_term("∀ n : Num, ∀ q : Num, prime(q) && divides(q, n) && !(n == 0) && divides(n, DIV(n, q)) → false"),
    t1228,
  )
  let t1247 = @simp.asm_rewrite_tac(@list.List([]))
  let t1246 = @simp.asm_rewrite_tac(@list.List([]))
  let t1244 = @term_syntax.parse_term("(q' : Num)")
  let t1245 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1244]),
      divides_div_prime_absurd,
    ),
  )
  let t1243 = @simp.asm_rewrite_tac(@list.List([]))
  let t1241 = @term_syntax.parse_term("DIV((n : Num), (q' : Num))")
  let t1242 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1248 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(
              @bool.ispecl(
                @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1242, t1241]),
                irreducible_divides_degree(),
              ),
            ),
            t1243,
          ),
          @tactics.disch_tac,
        ),
        t1245,
      ),
      t1246,
    ),
    t1247,
  ])
  let t1240 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t1238 = @simp.rewrite_tac(@list.List([@ringtheory.poly_var_univ()]))
  let t1237 = @list.List([
    @tactics.match_mp_tac(@ringtheory.ring_pow_v1()),
    @tactics.all_tac,
  ])
  let t1236 = @tactics.match_mp_tac(@ringtheory.ring_sub_v1())
  let t1239 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1236),
          @tactics.conj_tac,
        ),
        t1237,
      ),
      t1238,
    ),
    @tactics.all_tac,
  ])
  let t1233 = @term_syntax.parse_term("ring_sub(poly_ring((f : Ring[A]), UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), DIV((n : Num), (q' : Num)))), poly_var(f, one))")
  let t1234 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1235 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(poly_ring : (Ring[A], (Unit) -> Bool) -> Ring[((Unit) -> Num) -> A])((f : Ring[A]), (UNIV : (Unit) -> Bool))"), t1234, t1233]),
      @ringtheory.ring_irreducible_divides_or_coprime(),
    ),
  )
  let t1232 = @tactics.x_gen_tac(@term_syntax.parse_term("(q' : Num)"))
  let t1230 = @simp.asm_rewrite_tac(@list.List([]))
  let t1229 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1231 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1229]),
          irreducible_divides_xq_minus_x(),
        ),
      ),
      t1230,
    ),
    @tactics.all_tac,
  ])
  let t1249 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
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
                    @tactics.conj_tac,
                  ),
                  t1231,
                ),
                t1232,
              ),
              @tactics.strip_tac,
            ),
            t1235,
          ),
          @tactics.ants_tac,
        ),
        t1239,
      ),
      t1240,
    ),
    t1248,
  )
  rabin_irreducibility_necessary_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && IN(p, ring_carrier(poly_ring(f, UNIV))) && poly_deg(f, p) == n && !(n == 0) && ring_irreducible(poly_ring(f, UNIV), p) → ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one))) && (∀ q : Num, prime(q) && divides(q, n) → ring_coprime(poly_ring(f, UNIV), (p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), DIV(n, q))), poly_var(f, one)))))"),
      t1249,
    ),
  )
}

///|
let rabin_irreducibility_necessary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RABIN_IRREDUCIBILITY_NECESSARY",
)

///|
/// `RABIN_IRREDUCIBILITY_NECESSARY`
pub fn rabin_irreducibility_necessary() -> @kernel.Thm {
  rabin_irreducibility_necessary_c.get()
}

///|
/// RABIN_IRREDUCIBILITY_SUFFICIENT
fn step_16() -> Unit raise {
  let t1282 = @meson.asm_meson_tac(@list.List([@arith.mult_sym()]))
  let t1281 = @tactics.disch_then(fn(
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
    let s1279 = @tactics.subst1_tac(x1278)
    fn(
      x1280 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1279(x1280)
    }
  })
  let t1277 = @simp.asm_rewrite_tac(@list.List([]))
  let t1274 = @term_syntax.parse_term("(d : Num)")
  let t1275 = @term_syntax.parse_term("(r : Num)")
  let t1276 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1275, t1274]),
      @int.divides_divides_div(),
    ),
  )
  let t1273 = @simp.asm_rewrite_tac(@list.List([]))
  let t1272 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@prime.divides_trans(), @int.divides_div_self()]),
    ),
    @tactics.all_tac,
  ])
  let t1271 = @tactics.subgoal_then(@term_syntax.parse_term("divides((r : Num), (n : Num))"), fn(
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
    let s1269 = @tactics.assume_tac(x1268)
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
  let t1267 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([@equal.gsym(@int.divides_divides_div_eq())]),
    ),
    @tactics.all_tac,
  ])
  let t1266 = @tactics.subgoal_then(@term_syntax.parse_term("divides((d : Num) * (r : Num), (n : Num))"), fn(
    x1263 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1264 = @tactics.assume_tac(x1263)
    fn(
      x1265 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1264(x1265)
    }
  })
  let t1262 = @tactics.exists_tac(@term_syntax.parse_term("(r : Num)"))
  let t1261 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1259 = @simp.asm_rewrite_tac(@list.List([]))
  let t1258 = @term_syntax.parse_term("(n : Num)")
  let t1260 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.specl(
            @list.List([@term_syntax.parse_term("(d : Num)"), t1258]),
            @int.divides_div_mult(),
          ),
        ),
        t1259,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1257 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("DIV((n : Num), (d : Num))"), @prime.prime_factor()),
  )
  let t1255 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1254 = @term_syntax.parse_term("(n : Num)")
  let t1256 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @tactics.mp_tac(
            @bool.specl(
              @list.List([@term_syntax.parse_term("(d : Num)"), t1254]),
              @int.divides_div_mult(),
            ),
          ),
        ),
        t1255,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1253 = @tactics.subgoal_then(@term_syntax.parse_term("!(DIV((n : Num), (d : Num)) == 1)"), fn(
    x1250 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1251 = @tactics.assume_tac(x1250)
    fn(
      x1252 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1251(x1252)
    }
  })
  let t1283 = @tactics.then_tac(
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
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.repeat_tac(@tactics.gen_tac),
                                    @tactics.strip_tac,
                                  ),
                                  t1253,
                                ),
                                t1256,
                              ),
                              t1257,
                            ),
                            @tactics.ants_tac,
                          ),
                          t1260,
                        ),
                        t1261,
                      ),
                      t1262,
                    ),
                    t1266,
                  ),
                  t1267,
                ),
                t1271,
              ),
              t1272,
            ),
            t1273,
          ),
          t1276,
        ),
        t1277,
      ),
      t1281,
    ),
    t1282,
  )
  let proper_divisor_prime_factor = @tactics.prove(
    @term_syntax.parse_term("∀ d : Num, ∀ n : Num, divides(d, n) && 1 <= d && d < n → (∃ q : Num, prime(q) && divides(q, n) && divides(d, DIV(n, q)))"),
    t1283,
  )
  let t1507 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()]))
  let t1505 = @meson.asm_meson_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1504 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1503 = @simp.asm_rewrite_tac(@list.List([]))
  let t1499 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t1502 = @tactics.disch_then(fn(
    x1501 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1496 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1497 = @tactics.mp_tac(x1496)
      fn(
        x1498 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1497(x1498)
      }
    })(((x1500 : @kernel.Thm) => @bool.spec(t1499, x1500))(x1501))
  })
  let t1495 = @tactics.disch_then(fn(
    x1494 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1493 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1490 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1491 = @tactics.mp_tac(x1490)
        fn(
          x1492 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1491(x1492)
        }
      })(@bool.conjunct2(x1493))
    })(@bool.conjunct2(x1494))
  })
  let t1489 = @simp.rewrite_tac(@list.List([@ringtheory.ring_coprime()]))
  let t1488 = @simp.asm_rewrite_tac(@list.List([]))
  let t1485 = @term_syntax.parse_term("(l : Num)")
  let t1506 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.first_x_assum(fn(
                    x1487 : @kernel.Thm,
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
                      x1482 : @kernel.Thm,
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
                      let s1483 = @tactics.mp_tac(x1482)
                      fn(
                        x1484 : (
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
                        s1483(x1484)
                      }
                    })(
                      ((x1486 : @kernel.Thm) => @bool.spec(t1485, x1486))(x1487),
                    )
                  }),
                  t1488,
                ),
                t1489,
              ),
              t1495,
            ),
            t1502,
          ),
          t1503,
        ),
        t1504,
      ),
      t1505,
    ),
    @tactics.all_tac,
  ])
  let t1481 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_unit((R : Ring[((Unit) -> Num) -> A]), (g : ((Unit) -> Num) -> A))"),
    fn(
      x1478 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1479 = @tactics.mp_tac(x1478)
      fn(
        x1480 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1479(x1480)
      }
    },
  )
  let t1476 = @meson.asm_meson_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1475 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1474 = @simp.asm_rewrite_tac(@list.List([]))
  let t1472 = @term_syntax.parse_term("DIV((n : Num), (l : Num))")
  let t1473 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t1477 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1473, t1472]),
              irreducible_divides_xq_minus_x_gen(),
            ),
          ),
          t1474,
        ),
        t1475,
      ),
      t1476,
    ),
    @tactics.all_tac,
  ])
  let t1471 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (g : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), DIV((n : Num), (l : Num)))), poly_var(f, one)))"),
    fn(
      x1468 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1469 = @tactics.assume_tac(x1468)
      fn(
        x1470 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1469(x1470)
      }
    },
  )
  let t1467 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(l : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1466 = @simp.asm_rewrite_tac(@list.List([]))
  let t1464 = @term_syntax.parse_term("(n : Num)")
  let t1465 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("poly_deg((f : Ring[A]), (g : ((Unit) -> Num) -> A))"), t1464]),
      proper_divisor_prime_factor,
    ),
  )
  let t1463 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (g : ((Unit) -> Num) -> A)) < (n : Num)"),
    fn(
      x1460 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1461 = @tactics.assume_tac(x1460)
      fn(
        x1462 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1461(x1462)
      }
    },
  )
  let t1457 = @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()]))
  let t1455 = @simp.rewrite_tac(@list.List([@ringtheory.poly_ring_clauses()]))
  let t1456 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t1455),
    @tactics.all_tac,
  ])
  let t1454 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_0((R : Ring[((Unit) -> Num) -> A])) == poly_0((f : Ring[A]))"),
    fn(
      x1453 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1450 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1451 = @tactics.subst1_tac(x1450)
        fn(
          x1452 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1451(x1452)
        }
      })(@equal.sym(x1453))
    },
  )
  let t1448 = @simp.simp_tac(@list.List([]))
  let t1447 = @simp.rewrite_tac(
    @list.List([@ringtheory.poly_ring_clauses(), @sets.in_elim_thm()]),
  )
  let t1446 = @simp.expand_tac("R")
  let t1449 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(
            @term_syntax.parse_term("IN((h : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
          ),
          t1446,
        ),
        t1447,
      ),
      t1448,
    ),
    @tactics.all_tac,
  ])
  let t1444 = @simp.simp_tac(@list.List([]))
  let t1443 = @simp.rewrite_tac(
    @list.List([@ringtheory.poly_ring_clauses(), @sets.in_elim_thm()]),
  )
  let t1442 = @simp.expand_tac("R")
  let t1445 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(
            @term_syntax.parse_term("IN((g : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
          ),
          t1442,
        ),
        t1443,
      ),
      t1444,
    ),
    @tactics.all_tac,
  ])
  let t1441 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t1440 = @tactics.match_mp_tac(@ringtheory.poly_deg_mul())
  let t1439 = @list.List([
    @tactics.then_tac(
      @tactics.ap_term_tac,
      @meson.asm_meson_tac(@list.List([@ringtheory.poly_ring_clauses()])),
    ),
    @tactics.all_tac,
  ])
  let t1458 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.thenl(
                        @tactics.subgoal_then(
                          @term_syntax.parse_term("poly_deg((f : Ring[A]), (a : ((Unit) -> Num) -> A)) == poly_deg(f, poly_mul(f, (g : ((Unit) -> Num) -> A), (h : ((Unit) -> Num) -> A)))"),
                          fn(
                            x1436 : @kernel.Thm,
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
                            let s1437 = @tactics.subst1_tac(x1436)
                            fn(
                              x1438 : (
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
                              s1437(x1438)
                            }
                          },
                        ),
                        t1439,
                      ),
                      t1440,
                    ),
                    t1441,
                  ),
                  @tactics.conj_tac,
                ),
                t1445,
              ),
              @tactics.conj_tac,
            ),
            t1449,
          ),
          t1454,
        ),
        t1456,
      ),
      t1457,
    ),
    @int.arith_tac,
  ])
  let t1435 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (a : ((Unit) -> Num) -> A)) == poly_deg(f, (g : ((Unit) -> Num) -> A)) + poly_deg(f, (h : ((Unit) -> Num) -> A))"),
    fn(
      x1432 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1433 = @tactics.mp_tac(x1432)
      fn(
        x1434 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1433(x1434)
      }
    },
  )
  let t1431 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_mul_rzero()])),
    @tactics.all_tac,
  ])
  let t1430 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((h : ((Unit) -> Num) -> A) == ring_0((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x1427 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1428 = @tactics.assume_tac(x1427)
      fn(
        x1429 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1428(x1429)
      }
    },
  )
  let t1426 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1420 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1421 = @tactics.assume_tac(x1420)
        fn(
          x1422 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1421(x1422)
        }
      },
      @tactics.conjuncts_then2(
        fn(
          x1423 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1424 = @tactics.assume_tac(x1423)
          fn(
            x1425 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1424(x1425)
          }
        },
        @tactics.x_choose_then(@term_syntax.parse_term("(h : ((Unit) -> Num) -> A)"))(
          @tactics.strip_assume_tac,
        ),
      ),
    ),
  )
  let t1419 = @simp.rewrite_tac(@list.List([@ringtheory.ring_divides()]))
  let t1459 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.undisch_tac(
                  @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (g : ((Unit) -> Num) -> A), (a : ((Unit) -> Num) -> A))"),
                ),
                t1419,
              ),
              t1426,
            ),
            t1430,
          ),
          t1431,
        ),
        t1435,
      ),
      t1458,
    ),
    @tactics.all_tac,
  ])
  let t1418 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (g : ((Unit) -> Num) -> A)) <= poly_deg(f, (a : ((Unit) -> Num) -> A))"),
    fn(
      x1415 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1416 = @tactics.assume_tac(x1415)
      fn(
        x1417 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1416(x1417)
      }
    },
  )
  let t1412 = @simp.simp_tac(@list.List([]))
  let t1411 = @meson.asm_meson_tac(
    @list.List([@ringtheory.ring_irreducible(), @ringtheory.poly_ring_clauses()]),
  )
  let t1413 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1411),
    t1412,
  ])
  let t1409 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1410 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t1414 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1410, t1409]),
            poly_nonunit_degree_ge_1(),
          ),
        ),
        @tactics.ants_tac,
      ),
      t1413,
    ),
    @tactics.all_tac,
  ])
  let t1408 = @tactics.subgoal_then(
    @term_syntax.parse_term("1 <= poly_deg((f : Ring[A]), (g : ((Unit) -> Num) -> A))"),
    fn(
      x1405 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1406 = @tactics.assume_tac(x1405)
      fn(
        x1407 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1406(x1407)
      }
    },
  )
  let t1403 = @meson.asm_meson_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1402 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1401 = @simp.asm_rewrite_tac(@list.List([]))
  let t1399 = @term_syntax.parse_term("(n : Num)")
  let t1400 = @term_syntax.parse_term("(g : ((Unit) -> Num) -> A)")
  let t1404 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1400, t1399]),
              irreducible_divides_degree(),
            ),
          ),
          t1401,
        ),
        t1402,
      ),
      t1403,
    ),
    @tactics.all_tac,
  ])
  let t1398 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(poly_deg((f : Ring[A]), (g : ((Unit) -> Num) -> A)), (n : Num))"),
    fn(
      x1395 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1396 = @tactics.assume_tac(x1395)
      fn(
        x1397 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1396(x1397)
      }
    },
  )
  let t1394 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.ring_irreducible()])),
    @tactics.all_tac,
  ])
  let t1393 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((g : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
    fn(
      x1390 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1391 = @tactics.assume_tac(x1390)
      fn(
        x1392 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1391(x1392)
      }
    },
  )
  let t1388 = @meson.asm_meson_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1387 = @simp.asm_rewrite_tac(@list.List([]))
  let t1386 = @tactics.exists_tac(@term_syntax.parse_term("(p : ((Unit) -> Num) -> A)"))
  let t1389 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@ringtheory.ring_divides_trans()),
          t1386,
        ),
        t1387,
      ),
      t1388,
    ),
    @tactics.all_tac,
  ])
  let t1385 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (g : ((Unit) -> Num) -> A), ring_sub(R, ring_pow(R, poly_var((f : Ring[A]), one), EXP(CARD(ring_carrier(f)), (n : Num))), poly_var(f, one)))"),
    fn(
      x1382 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1383 = @tactics.assume_tac(x1382)
      fn(
        x1384 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1383(x1384)
      }
    },
  )
  let t1380 = @simp.asm_rewrite_tac(@list.List([]))
  let t1379 = @tactics.exists_tac(@term_syntax.parse_term("(b : ((Unit) -> Num) -> A)"))
  let t1378 = @simp.asm_rewrite_tac(@list.List([]))
  let t1377 = @simp.rewrite_tac(@list.List([@ringtheory.ring_divides()]))
  let t1376 = @simp.asm_rewrite_tac(@list.List([]))
  let t1375 = @tactics.exists_tac(@term_syntax.parse_term("(a : ((Unit) -> Num) -> A)"))
  let t1381 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.match_mp_tac(@ringtheory.ring_divides_trans()),
                t1375,
              ),
              t1376,
            ),
            t1377,
          ),
          t1378,
        ),
        t1379,
      ),
      t1380,
    ),
    @tactics.all_tac,
  ])
  let t1374 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_divides((R : Ring[((Unit) -> Num) -> A]), (g : ((Unit) -> Num) -> A), (p : ((Unit) -> Num) -> A))"),
    fn(
      x1371 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1372 = @tactics.assume_tac(x1371)
      fn(
        x1373 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1372(x1373)
      }
    },
  )
  let t1370 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(g : ((Unit) -> Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1368 = @meson.asm_meson_tac(@list.List([]))
  let t1369 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1368),
    @tactics.all_tac,
  ])
  let t1366 = @term_syntax.parse_term("(a : ((Unit) -> Num) -> A)")
  let t1367 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A])"), t1366]),
      @ringtheory.noetherian_domain_irreducible_factor_exists(),
    ),
  )
  let t1364 = @meson.asm_meson_tac(
    @list.List([@ringtheory.pid_imp_ufd(), @ringtheory.pid_poly_ring()]),
  )
  let t1365 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t1364),
    @tactics.all_tac,
  ])
  let t1363 = @tactics.subgoal_then(
    @term_syntax.parse_term("UFD((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x1360 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1361 = @tactics.assume_tac(x1360)
      fn(
        x1362 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1361(x1362)
      }
    },
  )
  let t1359 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (a : ((Unit) -> Num) -> A)) < (n : Num)"),
    fn(
      x1356 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1357 = @tactics.assume_tac(x1356)
      fn(
        x1358 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1357(x1358)
      }
    },
  )
  let t1353 = @simp.simp_tac(@list.List([]))
  let t1352 = @meson.asm_meson_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1354 = @tactics.thenl(
    @tactics.ants_tac,
    @list.List([
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1352),
      t1353,
    ]),
  )
  let t1349 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1350 = @term_syntax.parse_term("(b : ((Unit) -> Num) -> A)")
  let t1351 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1350, t1349]),
      poly_nonunit_degree_ge_1(),
    ),
  )
  let t1347 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1348 = @term_syntax.parse_term("(a : ((Unit) -> Num) -> A)")
  let t1355 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.conj_tac,
        @list.List([
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1348, t1347]),
              poly_nonunit_degree_ge_1(),
            ),
          ),
          t1351,
        ]),
      ),
      t1354,
    ),
    @tactics.all_tac,
  ])
  let t1346 = @tactics.subgoal_then(
    @term_syntax.parse_term("1 <= poly_deg((f : Ring[A]), (a : ((Unit) -> Num) -> A)) && 1 <= poly_deg(f, (b : ((Unit) -> Num) -> A))"),
    @tactics.strip_assume_tac,
  )
  let t1344 = @meson.asm_meson_tac(@list.List([]))
  let t1343 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.poly_ring_clauses()])),
    @tactics.all_tac,
  ])
  let t1345 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.subgoal_then(
          @term_syntax.parse_term("poly_mul((f : Ring[A]), (a : ((Unit) -> Num) -> A), (b : ((Unit) -> Num) -> A)) == (p : ((Unit) -> Num) -> A)"),
          fn(
            x1340 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1341 = @tactics.assume_tac(x1340)
            fn(
              x1342 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1341(x1342)
            }
          },
        ),
        t1343,
      ),
      t1344,
    ),
    @tactics.all_tac,
  ])
  let t1339 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), (a : ((Unit) -> Num) -> A)) + poly_deg(f, (b : ((Unit) -> Num) -> A)) == (n : Num)"),
    fn(
      x1336 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1337 = @tactics.assume_tac(x1336)
      fn(
        x1338 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1337(x1338)
      }
    },
  )
  let t1334 = @simp.asm_rewrite_tac(@list.List([]))
  let t1332 = @simp.rewrite_tac(@list.List([@ringtheory.poly_ring_clauses()]))
  let t1333 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t1332),
    @tactics.all_tac,
  ])
  let t1331 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_0((R : Ring[((Unit) -> Num) -> A])) == poly_0((f : Ring[A]))"),
    fn(
      x1330 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s1328 = @tactics.subst1_tac(x1327)
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
      })(@equal.sym(x1330))
    },
  )
  let t1326 = @simp.asm_simp_tac(
    @list.List([@ringtheory.field_imp_integral_domain()]),
  )
  let t1335 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@ringtheory.poly_deg_mul()),
            t1326,
          ),
          t1331,
        ),
        t1333,
      ),
      t1334,
    ),
    @tactics.all_tac,
  ])
  let t1325 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_deg((f : Ring[A]), poly_mul(f, (a : ((Unit) -> Num) -> A), (b : ((Unit) -> Num) -> A))) == poly_deg(f, a) + poly_deg(f, b)"),
    fn(
      x1322 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1323 = @tactics.assume_tac(x1322)
      fn(
        x1324 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1323(x1324)
      }
    },
  )
  let t1320 = @simp.simp_tac(@list.List([]))
  let t1319 = @simp.rewrite_tac(
    @list.List([@ringtheory.poly_ring_clauses(), @sets.in_elim_thm()]),
  )
  let t1318 = @simp.expand_tac("R")
  let t1317 = @tactics.undisch_tac(
    @term_syntax.parse_term("IN((b : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
  )
  let t1321 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.conj_tac,
            @list.List([
              @tactics.undisch_tac(
                @term_syntax.parse_term("IN((a : ((Unit) -> Num) -> A), ring_carrier((R : Ring[((Unit) -> Num) -> A])))"),
              ),
              t1317,
            ]),
          ),
          t1318,
        ),
        t1319,
      ),
      t1320,
    ),
    @tactics.all_tac,
  ])
  let t1316 = @tactics.subgoal_then(
    @term_syntax.parse_term("ring_polynomial((f : Ring[A]), (a : ((Unit) -> Num) -> A)) && ring_polynomial(f, (b : ((Unit) -> Num) -> A))"),
    @tactics.strip_assume_tac,
  )
  let t1315 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@ringtheory.ring_mul_lzero(), @ringtheory.ring_mul_rzero()]),
    ),
    @tactics.all_tac,
  ])
  let t1314 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((a : ((Unit) -> Num) -> A) == ring_0((R : Ring[((Unit) -> Num) -> A]))) && !((b : ((Unit) -> Num) -> A) == ring_0(R))"),
    @tactics.strip_assume_tac,
  )
  let t1312 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@ringtheory.poly_ring_clauses())]),
  )
  let t1310 = @term_syntax.parse_term("(b : ((Unit) -> Num) -> A)")
  let t1311 = @tactics.map_every(
    fn(
      x1307 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1308 = @tactics.exists_tac(x1307)
      fn(
        x1309 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1308(x1309)
      }
    },
    @list.List([@term_syntax.parse_term("(a : ((Unit) -> Num) -> A)"), t1310]),
  )
  let t1306 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) || (b : Bool)) == (!a && !b)"))]),
  )
  let t1305 = @simp.asm_rewrite_tac(
    @list.List([@ringtheory.poly_ring_clauses()]),
  )
  let t1304 = @simp.rewrite_tac(
    @list.List([
      @ringtheory.ring_irreducible(),
      @class.de_morgan_thm(),
      @class.not_forall_thm(),
      @class.not_imp(),
    ]),
  )
  let t1313 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.undisch_tac(
                  @term_syntax.parse_term("!ring_irreducible((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A))"),
                ),
                t1304,
              ),
              t1305,
            ),
            t1306,
          ),
          @tactics.strip_tac,
        ),
        t1311,
      ),
      t1312,
    ),
    @tactics.all_tac,
  ])
  let t1303 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ a : ((Unit) -> Num) -> A, ∃ b : ((Unit) -> Num) -> A, IN(a, ring_carrier((R : Ring[((Unit) -> Num) -> A]))) && IN(b, ring_carrier(R)) && ring_mul(R, a, b) == (p : ((Unit) -> Num) -> A) && !ring_unit(R, a) && !ring_unit(R, b)"),
    @tactics.strip_assume_tac,
  )
  let t1302 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")),
  )
  let t1300 = @meson.asm_meson_tac(@list.List([@ringtheory.poly_deg_const()]))
  let t1299 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : A)"))(@tactics.strip_assume_tac),
  )
  let t1298 = @simp.asm_rewrite_tac(@list.List([]))
  let t1297 = @list.List([
    @meson.asm_meson_tac(@list.List([@ringtheory.field_imp_integral_domain()])),
    @tactics.all_tac,
  ])
  let t1295 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1296 = @term_syntax.parse_term("(UNIV : (Unit) -> Bool)")
  let t1301 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_tac,
                @tactics.mp_tac(
                  @bool.ispecl(
                    @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1296, t1295]),
                    @ringtheory.ring_unit_poly_domain(),
                  ),
                ),
              ),
              @tactics.ants_tac,
            ),
            t1297,
          ),
          t1298,
        ),
        t1299,
      ),
      t1300,
    ),
    @tactics.all_tac,
  ])
  let t1294 = @tactics.subgoal_then(
    @term_syntax.parse_term("!ring_unit((R : Ring[((Unit) -> Num) -> A]), (p : ((Unit) -> Num) -> A))"),
    fn(
      x1291 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1292 = @tactics.assume_tac(x1291)
      fn(
        x1293 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1292(x1293)
      }
    },
  )
  let t1289 = @meson.asm_meson_tac(
    @list.List([
      @ringtheory.integral_domain_poly_ring(),
      @ringtheory.field_imp_integral_domain(),
    ]),
  )
  let t1290 = @list.List([
    @tactics.then_tac(@simp.expand_tac("R"), t1289),
    @tactics.all_tac,
  ])
  let t1288 = @tactics.subgoal_then(
    @term_syntax.parse_term("integral_domain((R : Ring[((Unit) -> Num) -> A]))"),
    fn(
      x1285 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1286 = @tactics.assume_tac(x1285)
      fn(
        x1287 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1286(x1287)
      }
    },
  )
  let t1284 = @simp.abbrev_tac(
    @term_syntax.parse_term("(R : Ring[((Unit) -> Num) -> A]) == poly_ring((f : Ring[A]), UNIV)"),
  )
  let t1508 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
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
                                  @tactics.thenl(
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
                                                          @tactics.thenl(
                                                            @tactics.then_tac(
                                                              @tactics.thenl(
                                                                @tactics.then_tac(
                                                                  @tactics.thenl(
                                                                    @tactics.then_tac(
                                                                      @tactics.thenl(
                                                                        @tactics.then_tac(
                                                                          @tactics.thenl(
                                                                            @tactics.then_tac(
                                                                              @tactics.thenl(
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
                                                                                                    @tactics.then_tac(
                                                                                                      @tactics.repeat_tac(
                                                                                                        @tactics.gen_tac,
                                                                                                      ),
                                                                                                      @tactics.strip_tac,
                                                                                                    ),
                                                                                                    t1284,
                                                                                                  ),
                                                                                                  t1288,
                                                                                                ),
                                                                                                t1290,
                                                                                              ),
                                                                                              t1294,
                                                                                            ),
                                                                                            t1301,
                                                                                          ),
                                                                                          t1302,
                                                                                        ),
                                                                                        @tactics.disch_tac,
                                                                                      ),
                                                                                      t1303,
                                                                                    ),
                                                                                    t1313,
                                                                                  ),
                                                                                  t1314,
                                                                                ),
                                                                                t1315,
                                                                              ),
                                                                              t1316,
                                                                            ),
                                                                            t1321,
                                                                          ),
                                                                          t1325,
                                                                        ),
                                                                        t1335,
                                                                      ),
                                                                      t1339,
                                                                    ),
                                                                    t1345,
                                                                  ),
                                                                  t1346,
                                                                ),
                                                                t1355,
                                                              ),
                                                              t1359,
                                                            ),
                                                            @list.List([
                                                              @int.asm_arith_tac,
                                                              @tactics.all_tac,
                                                            ]),
                                                          ),
                                                          t1363,
                                                        ),
                                                        t1365,
                                                      ),
                                                      t1367,
                                                    ),
                                                    @tactics.ants_tac,
                                                  ),
                                                  t1369,
                                                ),
                                                t1370,
                                              ),
                                              t1374,
                                            ),
                                            t1381,
                                          ),
                                          t1385,
                                        ),
                                        t1389,
                                      ),
                                      t1393,
                                    ),
                                    t1394,
                                  ),
                                  t1398,
                                ),
                                t1404,
                              ),
                              t1408,
                            ),
                            t1414,
                          ),
                          t1418,
                        ),
                        t1459,
                      ),
                      t1463,
                    ),
                    @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                  ),
                  t1465,
                ),
                t1466,
              ),
              t1467,
            ),
            t1471,
          ),
          t1477,
        ),
        t1481,
      ),
      t1506,
    ),
    t1507,
  )
  rabin_irreducibility_sufficient_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && IN(p, ring_carrier(poly_ring(f, UNIV))) && !(p == ring_0(poly_ring(f, UNIV))) && poly_deg(f, p) == n && !(n == 0) && ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one))) && (∀ q : Num, prime(q) && divides(q, n) → ring_coprime(poly_ring(f, UNIV), (p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), DIV(n, q))), poly_var(f, one))))) → ring_irreducible(poly_ring(f, UNIV), p)"),
      t1508,
    ),
  )
}

///|
let rabin_irreducibility_sufficient_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RABIN_IRREDUCIBILITY_SUFFICIENT",
)

///|
/// `RABIN_IRREDUCIBILITY_SUFFICIENT`
pub fn rabin_irreducibility_sufficient() -> @kernel.Thm {
  rabin_irreducibility_sufficient_c.get()
}

///|
/// RABIN_IRREDUCIBILITY_TEST
fn step_17() -> Unit raise {
  let t1514 = @simp.asm_rewrite_tac(@list.List([]))
  let t1512 = @term_syntax.parse_term("(n : Num)")
  let t1513 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1515 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1513, t1512]),
          rabin_irreducibility_sufficient(),
        ),
      ),
    ),
    t1514,
  )
  let t1511 = @simp.asm_rewrite_tac(@list.List([]))
  let t1509 = @term_syntax.parse_term("(n : Num)")
  let t1510 = @term_syntax.parse_term("(p : ((Unit) -> Num) -> A)")
  let t1516 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([@term_syntax.parse_term("(f : Ring[A])"), t1510, t1509]),
            rabin_irreducibility_necessary(),
          ),
        ),
      ),
      t1511,
    ),
    t1515,
  ])
  let t1517 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @tactics.strip_tac,
      ),
      @tactics.eq_tac,
    ),
    t1516,
  )
  rabin_irreducibility_test_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Ring[A], ∀ p : ((Unit) -> Num) -> A, ∀ n : Num, field(f) && FINITE(ring_carrier(f)) && IN(p, ring_carrier(poly_ring(f, UNIV))) && !(p == ring_0(poly_ring(f, UNIV))) && !ring_unit(poly_ring(f, UNIV), p) && poly_deg(f, p) == n && !(n == 0) → ring_irreducible(poly_ring(f, UNIV), p) == (ring_divides(poly_ring(f, UNIV), p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), n)), poly_var(f, one))) && (∀ q : Num, prime(q) && divides(q, n) → ring_coprime(poly_ring(f, UNIV), (p, ring_sub(poly_ring(f, UNIV), ring_pow(poly_ring(f, UNIV), poly_var(f, one), EXP(CARD(ring_carrier(f)), DIV(n, q))), poly_var(f, one))))))"),
      t1517,
    ),
  )
}

///|
let rabin_irreducibility_test_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RABIN_IRREDUCIBILITY_TEST",
)

///|
/// `RABIN_IRREDUCIBILITY_TEST`
pub fn rabin_irreducibility_test() -> @kernel.Thm {
  rabin_irreducibility_test_c.get()
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
}
