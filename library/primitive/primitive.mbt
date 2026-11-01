// Translated from upstream Library/primitive.ml; edit this file directly.

///|
/// INT_PRIME
fn step_1() -> Unit raise {
  let t13 = @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac)
  let t9 = @term_syntax.parse_term("2")
  let t12 = @tactics.disch_then(fn(
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
    (fn(
      x6 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s7 = @tactics.mp_tac(x6)
      fn(
        x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s7(x8)
      }
    })(((x10 : @kernel.Thm) => @bool.spec(t9, x10))(x11))
  })
  let t14 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @prime.divides_0()])),
      t12,
    ),
    t13,
  ])
  let t5 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t4 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_gt(), @int.int_of_num_eq()]),
  )
  let t2 = @equal.gsym(@int.num_divides())
  let t3 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_forall_abs()), t2, @int.int_abs_num()]),
  )
  let t1 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@int.int_divides_labs())]),
  )
  let t15 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(
                  @list.List([@int.prime(), @integer.int_prime()]),
                ),
              ),
              t1,
            ),
            t3,
          ),
          t4,
        ),
        t5,
      ),
      t14,
    ),
    @int.asm_arith_tac,
  )
  int_prime_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, int_prime(int_of_num(p)) == prime(p)"), t15),
  )
}

///|
let int_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_PRIME")

///|
/// `INT_PRIME`
pub fn int_prime() -> @kernel.Thm {
  int_prime_c.get()
}

///|
/// REAL_POLY_DIFF_EXPLICIT
fn step_2() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t30 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_pair_thm(),
      @pair.forall_pair_thm(),
      @real.real_mul_ac(),
    ]),
  )
  let t29 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ a : Num, ∀ b : Num, GEQ(f((a, b)), (b, a)))")),
  )
  let t28 = @tactics.match_mp_tac(@iterate.sum_eq_general_inverses())
  let t26 = @equal.gsym(@iterate.sum_rmul())
  let t27 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@iterate.sum_lmul()),
      t26,
      @iterate.sum_sum_product(),
      @iterate.finite_numseg(),
    ]),
  )
  let t25 = @simp.rewrite_tac(@list.List([@iterate.sum_lmul()]))
  let t24 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)")),
    ]),
  )
  let t23 = @simp.simp_tac(@list.List([@iterate.real_sub_pow()]))
  let t22 = @simp.rewrite_tac(
    @list.List([
      @real.real_sub_refl(),
      @calc_int.real_mul_rzero(),
      @realax.real_add_lid(),
      @realax.real_pow(),
    ]),
  )
  let t21 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t19 = @simp.simp_tac(
    @list.List([@iterate.sum_clauses_left(), @arith.add_clauses()]),
  )
  let t18 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(n : Num)"), @arith.le_0()),
  )
  let t16 = @equal.gsym(@real.real_sub_ldistrib())
  let t17 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@iterate.sum_sub_numseg()), t16]),
  )
  let t32 = @tactics.then_tac(
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
                                t17,
                              ),
                              t18,
                            ),
                            t19,
                          ),
                          t21,
                        ),
                        t22,
                      ),
                      t23,
                    ),
                    t24,
                  ),
                  t25,
                ),
                @tactics.ap_term_tac,
              ),
              t27,
            ),
            t28,
          ),
          t29,
        ),
        t30,
      ),
      t31,
    ),
    @int.arith_tac,
  )
  real_poly_diff_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : (Num) -> Real, ∀ x : Real, ∀ y : Real, sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)) - sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(y, i)) == (x - y) * sum(op_dot_dot(0, n - 1), (i : Num) => sum(op_dot_dot(i + 1, n), (j : Num) => a(j) * pow(y, j - 1 - i)) * pow(x, i))"),
      t32,
    ),
  )
}

///|
let real_poly_diff_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_POLY_DIFF_EXPLICIT",
)

///|
/// `REAL_POLY_DIFF_EXPLICIT`
pub fn real_poly_diff_explicit() -> @kernel.Thm {
  real_poly_diff_explicit_c.get()
}

///|
/// INT_POLY_DIFF_EXPLICIT
fn step_3() -> Unit raise {
  int_poly_diff_explicit_c.set(@isum.int_of_real_thm(real_poly_diff_explicit()))
}

///|
let int_poly_diff_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POLY_DIFF_EXPLICIT",
)

///|
/// `INT_POLY_DIFF_EXPLICIT`
pub fn int_poly_diff_explicit() -> @kernel.Thm {
  int_poly_diff_explicit_c.get()
}

///|
/// FINITE_INTSEG_RESTRICT
fn step_4() -> Unit raise {
  let t33 = @simp.simp_tac(
    @list.List([
      @sets.finite_restrict(),
      @iterate.finite_int_seg(),
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == {(x : _) | IN(x, {(x : _) | P(x) && Q(x)}) && R(x)}"),
      ),
    ]),
  )
  finite_intseg_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ a : Int, ∀ b : Int, FINITE({(x : Int) | a <= x && x <= b && P(x)})"),
      t33,
    ),
  )
}

///|
let finite_intseg_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INTSEG_RESTRICT",
)

///|
/// `FINITE_INTSEG_RESTRICT`
pub fn finite_intseg_restrict() -> @kernel.Thm {
  finite_intseg_restrict_c.get()
}

///|
/// INT_POLY_LAGRANGE
fn step_5() -> Unit raise {
  let t109 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_v1(), @int.int_mul_rid()]),
  )
  let t108 = @simp.asm_simp_tac(
    @list.List([
      @arith.le_refl(),
      @arith.sub_add(),
      @arith.le_1(),
      @isum.isum_sing_numseg(),
      @arith.sub_refl(),
    ]),
  )
  let t104 = @term_syntax.parse_term("(n : Num) - 1")
  let t107 = @tactics.disch_then(fn(
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
    (fn(
      x101 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s102 = @tactics.mp_tac(x101)
      fn(
        x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s102(x103)
      }
    })(((x105 : @kernel.Thm) => @bool.spec(t104, x105))(x106))
  })
  let t100 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)"))]),
  )
  let t99 = @tactics.first_assum(@tactics.match_mp_tac)
  let t98 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]),
    ),
  )
  let t97 = @simp.asm_rewrite_tac(@list.List([]))
  let t96 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((n : Num) == 0) && (x : Num) <= n - 1 → (if (p : Bool) { x } else { SUC(x) }) <= n"),
    ),
  )
  let t95 = @simp.simp_tac(
    @list.List([@sets.card_clauses(), finite_intseg_restrict()]),
  )
  let t94 = @simp.rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("UNION({(a : _)}, (s : (_) -> Bool)) == INSERT(a, s)"))]),
  )
  let t90 = @drule.match_mp(@integer.int_divides_le())
  let t92 = @tactics.disch_then(fn(
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
    (fn(
      x87 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s88 = @tactics.mp_tac(x87)
      fn(
        x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s88(x89)
      }
    })(t90(x91))
  })
  let t86 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @integer.int_cong(),
        @integer.int_cong_sym(),
        @integer.int_cong_trans(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t85 = @tactics.subgoal_then(@term_syntax.parse_term("divides((p : Int), (u : Int) - (v : Int))"), fn(
    x82 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s83 = @tactics.mp_tac(x82)
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
  })
  let t80 = @term_syntax.parse_term("(v : Int)")
  let t81 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(u : Int)"), t80]),
  )
  let t79 = @simp.asm_rewrite_tac(
    @list.List([@int.int_sub_refl(), @integer.int_divides_0()]),
  )
  let t93 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(
                    @sets.set_rule(
                      @term_syntax.parse_term("(P : (_) -> Bool)((c : _)) && (∀ x : _, ∀ y : _, P(x) && P(y) → x == y) → {(x : _) | P(x)} == {c}"),
                    ),
                  ),
                  t79,
                ),
                t81,
              ),
              @tactics.strip_tac,
            ),
            t85,
          ),
          t86,
        ),
        t92,
      ),
      @int.asm_int_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t78 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : Int) | (l : Int) <= x && x <= (r : Int) && divides((p : Int), x - (c : Int))} == {c}"),
    fn(
      x75 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s76 = @tactics.subst1_tac(x75)
      fn(
        x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s76(x77)
      }
    },
  )
  let t74 = @simp.asm_rewrite_tac(
    @list.List([
      @theorems.left_or_distrib(),
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (q : (_) -> Bool)(x) || (r : (_) -> Bool)(x)} == UNION({(x : _) | q(x)}, {(x : _) | r(x)})"),
      ),
    ]),
  )
  let t73 = @tactics.disch_then(fn(
    x72 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t71 = @simp.asm_simp_tac(@list.List([@integer.int_prime_divprod_eq()]))
  let t65 = @term_syntax.parse_term("(c : Int)")
  let t66 = @term_syntax.parse_term("(x : Int)")
  let t67 = @term_syntax.parse_term("(a : (Num) -> Int)")
  let t68 = @bool.ispecl(
    @list.List([@term_syntax.parse_term("(n : Num)"), t67, t66, t65]),
    int_poly_diff_explicit(),
  )
  let t69 = @drule.match_mp(
    @int.integer_rule(
      @term_syntax.parse_term("(a : Int) - (b : Int) == (c : Int) → divides((p : Int), b) → divides(p, a) == divides(p, c)"),
    ),
  )(t68)
  let t70 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(x : Int)"), t69))
  let t63 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((i : Num) <= (n : Num)) == (i <= n - 1 || i == n)")),
    ]),
  )
  let t62 = @tactics.disch_then(@tactics.match_mp_tac)
  let t61 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 < n) == !(n == 0)"))]),
  )
  let t57 = @term_syntax.parse_term("(n : Num) - 1")
  let t60 = @tactics.first_x_assum(fn(
    x59 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s55 = @tactics.mp_tac(x54)
      fn(
        x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s55(x56)
      }
    })(((x58 : @kernel.Thm) => @bool.spec(t57, x58))(x59))
  })
  let t53 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (n : Num) - 1 → x <= n")),
  )
  let t52 = @simp.asm_simp_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("divides((p : Int), (y : Int)) → divides(p, (x : Int) + y * (z : Int)) == divides(p, x)"),
      ),
    ]),
  )
  let t64 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.asm_simp_tac(
                  @list.List([
                    @isum.isum_clauses_right(),
                    @arith.le_0(),
                    @arith.le_1(),
                  ]),
                ),
                t52,
              ),
              t53,
            ),
            t60,
          ),
          t61,
        ),
        t62,
      ),
      t63,
    ),
    @tactics.all_tac,
  ])
  let t51 = @class.asm_cases_tac(
    @term_syntax.parse_term("divides((p : Int), (a : (Num) -> Int)((n : Num)))"),
  )
  let t49 = @tactics.conv_tac(@class.taut)
  let t48 = @simp.rewrite_tac(
    @list.List([
      @int.int_pow_v1(),
      @theorems.left_forall_imp_thm(),
      @theorems.exists_refl(),
      @int.int_mul_rid(),
    ]),
  )
  let t47 = @simp.asm_simp_tac(
    @list.List([@bool.conjunct1(@arith.le()), @isum.isum_clauses_numseg()]),
  )
  let t46 = @term_syntax.parse_term("divides((p : Int), isum(op_dot_dot(0, (n : Num)), (i : Num) => (a : (Num) -> Int)(i) * pow((c : Int), i)))")
  let t50 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            fn(
              x43 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s44 = @tactics.undisch_tac(x43)
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
            },
            @list.List([
              @term_syntax.parse_term("!(∀ i : Num, i <= (n : Num) → divides((p : Int), (a : (Num) -> Int)(i)))"),
              t46,
            ]),
          ),
          t47,
        ),
        t48,
      ),
      t49,
    ),
    @tactics.all_tac,
  ])
  let t42 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t41 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Int)"))
  let t40 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@sets.member_not_empty()),
      @theorems.left_imp_exists_thm(),
      @sets.in_elim_thm(),
    ]),
  )
  let t39 = @simp.rewrite_tac(@list.List([@arith.le_0(), @sets.card_clauses()]))
  let t38 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Int) -> Bool)"))
  let t37 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ a : (_) -> Bool, (!((s : (_) -> Bool) == a) → CARD(s) <= (n : Num)) && CARD(a) <= n → CARD(s) <= n"),
    ),
  )
  let t36 = @tactics.repeat_tac(@tactics.strip_tac)
  let t35 = @tactics.match_mp_tac(@arith.num_wf())
  let t34 = @simp.rewrite_tac(@list.List([@integer.int_cong_0_divides()]))
  let t110 = @tactics.then_tac(
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
                                                              @tactics.repeat_tac(
                                                                @tactics.gen_tac,
                                                              ),
                                                              @tactics.strip_tac,
                                                            ),
                                                            t34,
                                                          ),
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
                                                t40,
                                              ),
                                              t41,
                                            ),
                                            @tactics.strip_tac,
                                          ),
                                          t42,
                                        ),
                                        t50,
                                      ),
                                      t51,
                                    ),
                                    t64,
                                  ),
                                  t70,
                                ),
                                t71,
                              ),
                              t73,
                            ),
                            t74,
                          ),
                          t78,
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
              ),
              t98,
            ),
            t99,
          ),
          t100,
        ),
        t107,
      ),
      t108,
    ),
    t109,
  )
  int_poly_lagrange_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Int, ∀ l : Int, ∀ r : Int, int_prime(p) && r - l < p → (∀ n : Num, ∀ a : (Num) -> Int, !(∀ i : Num, i <= n → op_eq_eq(a(i), int_of_num(0), mod(p))) → CARD({(x : Int) | l <= x && x <= r && op_eq_eq(isum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)), int_of_num(0), mod(p))}) <= n)"),
      t110,
    ),
  )
}

///|
let int_poly_lagrange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POLY_LAGRANGE",
)

///|
/// `INT_POLY_LAGRANGE`
pub fn int_poly_lagrange() -> @kernel.Thm {
  int_poly_lagrange_c.get()
}

///|
/// NUM_LAGRANGE_LEMMA
fn step_6() -> Unit raise {
  let t150 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@int.num_congruent())]),
  )
  let t149 = @simp.asm_rewrite_tac(
    @list.List([
      @int.num_of_int_of_num(),
      @int.int_of_num_le(),
      @int.int_of_num_pow(),
    ]),
  )
  let t148 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num((n : Num))"))
  let t147 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t146 = @simp.rewrite_tac(
    @list.List([
      finite_intseg_restrict(),
      @sets.subset(),
      @sets.in_image(),
      @sets.in_elim_thm(),
    ]),
  )
  let t145 = @tactics.exists_tac(@term_syntax.parse_term("num_of_int"))
  let t144 = @tactics.match_mp_tac(@sets.card_subset_image())
  let t143 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq((x : Int) - (a : Int), int_of_num(0), mod((p : Int))) == op_eq_eq(x, a, mod(p))"),
      ),
    ]),
  )
  let t142 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(@term_syntax.parse_term("int_of_num(1) * (x : Int) + -int_of_num(1) * int_of_num(1) == x - int_of_num(1)")),
    ]),
  )
  let t141 = @simp.rewrite_tac(
    @list.List([@sets.sing_gspec(), @isum.isum_sing()]),
  )
  let t139 = @int.arith_rule(
    @term_syntax.parse_term("1 <= (d : Num) → (((0 <= (i : Num) && i <= d) && !(i == d)) && i == 0) == (i == 0)"),
  )
  let t140 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((0 <= (i : Num) && i <= (d : Num)) && i == d) == (i == d)"),
      ),
      t139,
    ]),
  )
  let t138 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t137 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) → y <= (d : Num) → x <= d")),
  )
  let t136 = @simp.rewrite_tac(
    @list.List([
      @int.int_pow_v1(),
      @int.int_mul_lzero(),
      @isum.isum_0(),
      @int.int_add_rid(),
    ]),
  )
  let t135 = @simp.simp_tac(
    @list.List([
      @isum.isum_cases(),
      @iterate.finite_numseg(),
      @sets.finite_restrict(),
    ]),
  )
  let t134 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(if (p : Bool) { (x : Int) } else { (y : Int) }) * (z : Int) == (if p { x * z } else { y * z })"),
      ),
    ]),
  )
  let t132 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t131 = @simp.rewrite_tac(
    @list.List([
      @integer.int_cong_0_divides(),
      @equal.gsym(@int.num_divides()),
      @int.divides_one(),
    ]),
  )
  let t130 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t127 = @term_syntax.parse_term("(d : Num)")
  let t133 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
            (fn(
              x124 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s125 = @tactics.mp_tac(x124)
              fn(
                x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s125(x126)
              }
            })(((x128 : @kernel.Thm) => @bool.spec(t127, x128))(x129))
          }),
          t130,
        ),
        t131,
      ),
      t132,
    ),
    @tactics.all_tac,
  ])
  let t123 = @simp.rewrite_tac(@list.List([]))
  let t118 = @term_syntax.parse_term("(i : Num) => if i == (d : Num) { int_of_num(1) } else { if i == 0 { -int_of_num(1) } else { int_of_num(0) } }")
  let t119 = @list.List([@term_syntax.parse_term("(d : Num)"), t118])
  let t122 = @tactics.disch_then(fn(
    x121 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x115 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s116 = @tactics.mp_tac(x115)
      fn(
        x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s116(x117)
      }
    })(((x120 : @kernel.Thm) => @bool.specl(t119, x120))(x121))
  })
  let t114 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          int_prime(),
          @int.int_lt_sub_radd(),
          @int.int_of_num_add(),
          @int.int_of_num_lt(),
        ]),
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t111 = @term_syntax.parse_term("int_of_num((p : Num) - 1)")
  let t112 = @term_syntax.parse_term("int_of_num(1)")
  let t113 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("int_of_num((p : Num))"), t112, t111]),
      int_poly_lagrange(),
    ),
  )
  let t151 = @tactics.then_tac(
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
                                            @tactics.thenl(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.repeat_tac(
                                                    @tactics.strip_tac,
                                                  ),
                                                  t113,
                                                ),
                                                @tactics.ants_tac,
                                              ),
                                              t114,
                                            ),
                                            t122,
                                          ),
                                          t123,
                                        ),
                                        @tactics.ants_tac,
                                      ),
                                      t133,
                                    ),
                                    t134,
                                  ),
                                  t135,
                                ),
                                t136,
                              ),
                              t137,
                            ),
                            t138,
                          ),
                          t140,
                        ),
                        t141,
                      ),
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
          ),
          @tactics.disch_tac,
        ),
        t148,
      ),
      t149,
    ),
    t150,
  )
  num_lagrange_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ d : Num, prime(p) && 1 <= d → CARD({(x : Num) | IN(x, op_dot_dot(1, p - 1)) && op_eq_eq(EXP(x, d), 1, mod(p))}) <= d"),
      t151,
    ),
  )
}

///|
let num_lagrange_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUM_LAGRANGE_LEMMA",
)

///|
/// `NUM_LAGRANGE_LEMMA`
pub fn num_lagrange_lemma() -> @kernel.Thm {
  num_lagrange_lemma_c.get()
}

///|
/// COUNT_ORDERS_MODULO_PRIME
fn step_7() -> Unit raise {
  let t152 = @meson.meson_tac(
    @list.List([@iterate.nsum_le(), @iterate.nsum_lt(), @arith.not_le()]),
  )
  let t153 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_antisym())])),
    t152,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, ∀ g : (A) -> Num, FINITE(s) && (∀ x : A, IN(x, s) → f(x) <= g(x)) && nsum(s, f) == nsum(s, g) → (∀ x : A, IN(x, s) → f(x) == g(x))"),
    t153,
  )
  let t300 = @simp.asm_rewrite_tac(@list.List([]))
  let t299 = @tactics.undisch_tac(@term_syntax.parse_term("(e : Num) * (d' : Num) == (d : Num)"))
  let t298 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((e : Num) <= 1) == (e == 0 || e == 1)")),
    ]),
  )
  let t297 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t296 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((d : Num) < (e : Num) * d) == (e * d <= 1 * d)")),
    ]),
  )
  let t301 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@simp.expand_tac("d"), t296),
              t297,
            ),
            t298,
          ),
          @tactics.strip_tac,
        ),
        t299,
      ),
      t300,
    ),
    @int.asm_arith_tac,
  )
  let t295 = @meson.asm_meson_tac(@list.List([@pocklington.order_v1()]))
  let t294 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t293 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.cong_v1()), @prime.prime_imp_nz()]),
  )
  let t292 = @tactics.subst1_tac(
    @equal.sym(@bool.spec(@term_syntax.parse_term("(m' : Num)"), @arith.exp_one())),
  )
  let t291 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t290 = @simp.asm_rewrite_tac(@list.List([]))
  let t289 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(e : Num) * (m' : Num) * (d' : Num) == e * d' * m'")),
    ]),
  )
  let t288 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t287 = @simp.expand_tac("m")
  let t286 = @simp.asm_simp_tac(
    @list.List([@int.cong_v1(), @prime.prime_imp_nz(), @arith.mod_exp_mod()]),
  )
  let t302 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(@simp.expand_tac("b"), t286),
                    t287,
                  ),
                  t288,
                ),
                t289,
              ),
              t290,
            ),
            t291,
          ),
          t292,
        ),
        t293,
      ),
      t294,
    ),
    t295,
  )
  let t285 = @simp.simp_tac(
    @list.List([
      @class.de_morgan_thm(),
      @int.arith_rule(@term_syntax.parse_term("(0 < (d : Num)) == !(d == 0)")),
    ]),
  )
  let t284 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (d : Num)) == !(d == 0)")),
      @arith.mult_eq_0(),
    ]),
  )
  let t283 = @simp.expand_tac("d")
  let t303 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(@term_syntax.parse_term("1 <= (d : Num)")),
          t283,
        ),
        t284,
      ),
      t285,
    ),
    t302,
    t301,
  ])
  let t282 = @tactics.repeat_tac(@tactics.conj_tac)
  let t281 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(a : Bool) && (c : Bool) && (!(b : Bool) → (d : Bool)) → (a && b → !c) → d"),
    ),
  )
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t276 = @term_syntax.parse_term("(d' : Num)")
  let t279 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s271 = @tactics.assume_tac(x270)
        fn(
          x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s271(x272)
        }
      },
      fn(
        x278 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x273 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s274 = @tactics.mp_tac(x273)
          fn(
            x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s274(x275)
          }
        })(((x277 : @kernel.Thm) => @bool.spec(t276, x277))(x278))
      },
    ),
  )
  let t268 = @term_syntax.parse_term("(b : Num)")
  let t269 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t268]),
      @pocklington.order_works(),
    ),
  )
  let t266 = @tactics.x_choose_then(@term_syntax.parse_term("(d' : Num)"))(fn(
    x265 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s263 = @tactics.assume_tac(x262)
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
    })(@equal.sym(x265))
  })
  let t267 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(m' : Num)"))(fn(
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
        (fn(
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
          let s259 = @tactics.assume_tac(x258)
          fn(
            x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s259(x260)
          }
        })(@equal.sym(x261))
      }),
      t266,
    ),
  )
  let t257 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Num)"))
  let t256 = @simp.rewrite_tac(@list.List([@int.coprime(), @int.divides()]))
  let t255 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Num) == MOD(EXP((a : Num), (m : Num)), (p : Num))"))
  let t254 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t253 = @list.List([
    @meson.meson_tac(@list.List([@pocklington.order_v1()])),
    @tactics.all_tac,
  ])
  let t252 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t304 = @tactics.thenl(
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
                                @tactics.match_mp_tac(
                                  @sets.set_rule(
                                    @term_syntax.parse_term("SUBSET((s' : (_) -> Bool), (s : (_) -> Bool)) && (∀ x : _, IN(x, (t : (_) -> Bool)) && IN((f : (_) -> _)(x), s') → IN(x, (t' : (_) -> Bool))) → s == IMAGE(f, t) → SUBSET(s', IMAGE(f, t'))"),
                                  ),
                                ),
                                t252,
                              ),
                              @tactics.conj_tac,
                            ),
                            t253,
                          ),
                          t254,
                        ),
                        t255,
                      ),
                      @tactics.strip_tac,
                    ),
                    t256,
                  ),
                  t257,
                ),
                t267,
              ),
              t269,
            ),
            t279,
          ),
          t280,
        ),
        t281,
      ),
      t282,
    ),
    t303,
  )
  let t249 = @simp.rewrite_tac(@list.List([@pocklington.cong_imp_eq()]))
  let t248 = @simp.asm_simp_tac(
    @list.List([@pocklington.order_divides_expdiff()]),
  )
  let t247 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.cong_v1()),
      @prime.prime_imp_nz(),
      @sets.finite_numseg_lt(),
      @sets.in_elim_thm(),
    ]),
  )
  let t246 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t245 = @tactics.conv_tac(@equal.sym_conv)
  let t244 = @tactics.match_mp_tac(@arith.eq_imp_le())
  let t243 = @simp.gen_rewrite_tac(
    fn(
      x240 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s241 = @equal.land_conv(x240)
      fn(x242 : @kernel.Term) -> @kernel.Thm raise { s241(x242) }
    },
    @list.List([@equal.gsym(@sets.card_numseg_lt())]),
  )
  let t239 = @simp.asm_simp_tac(@list.List([num_lagrange_lemma()]))
  let t238 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t250 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.match_mp_tac(@arith.le_trans()),
                    t238,
                  ),
                  t239,
                ),
                t243,
              ),
              t244,
            ),
            t245,
          ),
          t246,
        ),
        t247,
      ),
      t248,
    ),
    t249,
  )
  let t235 = @meson.asm_meson_tac(@list.List([@pocklington.order_v1()]))
  let t234 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t233 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.cong_v1()), @prime.prime_imp_nz()]),
  )
  let t232 = @tactics.subst1_tac(
    @equal.sym(@bool.spec(@term_syntax.parse_term("(m : Num)"), @arith.exp_one())),
  )
  let t231 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t230 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t229 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t236 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.asm_simp_tac(
                  @list.List([
                    @int.cong_v1(),
                    @prime.prime_imp_nz(),
                    @arith.mod_exp_mod(),
                  ]),
                ),
                t229,
              ),
              t230,
            ),
            t231,
          ),
          t232,
        ),
        t233,
      ),
      t234,
    ),
    t235,
  )
  let t228 = @meson.asm_meson_tac(
    @list.List([@prime.prime_divexp(), @prime.prime_coprime_eq()]),
  )
  let t227 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.divides_mod()), @prime.prime_imp_nz()]),
  )
  let t237 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
          ]),
        ),
        t227,
      ),
      t228,
    ),
    t236,
  ])
  let t226 = @simp.asm_simp_tac(
    @list.List([@arith.division(), @prime.prime_imp_nz()]),
  )
  let t225 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("!((p : Num) - 1 == 0) → ((x : Num) <= p - 1) == (x < p)"),
      ),
    ]),
  )
  let t224 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t223 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t251 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @sets.subset(),
                      @sets.forall_in_image(),
                      @sets.in_elim_thm(),
                    ]),
                  ),
                  t223,
                ),
                @tactics.disch_tac,
              ),
              t224,
            ),
            t225,
          ),
          t226,
        ),
        @tactics.conj_tac,
      ),
      t237,
    ),
    t250,
  ])
  let t222 = @simp.simp_tac(
    @list.List([@sets.finite_restrict(), @iterate.finite_numseg()]),
  )
  let t221 = @tactics.match_mp_tac(@sets.card_subset_le())
  let t305 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t221),
          t222,
        ),
        @tactics.conj_tac,
      ),
      t251,
    ),
    t304,
  ])
  let t220 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : Num) | IN(x, op_dot_dot(1, (p : Num) - 1)) && op_eq_eq(EXP(x, (d : Num)), 1, mod(p))} == IMAGE((m : Num) => MOD(EXP((a : Num), m), p), {(m : Num) | m < d})"),
    fn(
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
      let s218 = @tactics.mp_tac(x217)
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
    },
  )
  let t215 = @simp.asm_rewrite_tac(@list.List([]))
  let t214 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t216 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
          t214,
        ),
        t215,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t213 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((p : Num), (a : Num)))"), fn(
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
    let s211 = @tactics.assume_tac(x210)
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
  })
  let t209 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.le_1(), @prime.divides_zero()])),
    @tactics.all_tac,
  ])
  let t208 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (d : Num)"), fn(
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
    let s206 = @tactics.assume_tac(x205)
    fn(
      x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s206(x207)
    }
  })
  let t204 = @simp.rewrite_tac(@list.List([@pocklington.phi_finite_lemma()]))
  let t203 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => MOD(EXP((a : Num), m), (p : Num))"))
  let t202 = @tactics.match_mp_tac(@sets.card_subset_image())
  let t201 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t200 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t199 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t198 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t195 = @simp.gen_rewrite_rule(
    fn(
      x194 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x194
    },
    @list.List([@equal.gsym(@sets.member_not_empty())]),
  )
  let t197 = @tactics.first_x_assum(fn(
    x196 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s192 = @tactics.mp_tac(x191)
      fn(
        x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s192(x193)
      }
    })(t195(x196))
  })
  let t190 = @simp.asm_rewrite_tac(
    @list.List([@sets.card_clauses(), @arith.le_0()]),
  )
  let t189 = @class.asm_cases_tac(
    @term_syntax.parse_term("{(x : Num) | IN(x, op_dot_dot(1, (p : Num) - 1)) && order(p, x) == (d : Num)} == {}"),
  )
  let t188 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t187 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t185 = @simp.asm_rewrite_tac(@list.List([]))
  let t184 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t183 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t182 = @tactics.match_mp_tac(@pocklington.order_divides_phi())
  let t181 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@pocklington.phi_prime())]),
  )
  let t180 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t179 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.forall_in_image(),
      @sets.in_elim_thm(),
      @iterate.in_numseg(),
    ]),
  )
  let t178 = @tactics.disch_then(@tactics.match_mp_tac)
  let t177 = @simp.rewrite_tac(
    @list.List([
      @iterate.nsum_const_numseg(),
      @iterate.finite_numseg(),
      @arith.add_sub(),
      @arith.mult_clauses(),
    ]),
  )
  let t171 = @drule.part_match(
    fn(x170 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(@kernel.rand(x170))
    },
    @iterate.nsum_group(),
  )
  let t186 = @list.List([
    @tactics.all_tac,
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
                            @simp.simp_tac(
                              @list.List([
                                @iterate.card_eq_nsum(),
                                @sets.finite_restrict(),
                                @iterate.finite_numseg(),
                              ]),
                            ),
                            fn(
                              x176 : (
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
                              (fn(
                                x175 : (
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
                                    @list.List[(@kernel.Term, @kernel.Term)],
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
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise) raise {
                                (fn(
                                  x173 : @kernel.Term,
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
                                      @list.List[(@kernel.Term, @kernel.Term)],
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
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  (fn(
                                    x172 : @kernel.Term,
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
                                        @list.List[(@kernel.Term, @kernel.Term)],
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
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise) raise {
                                    (fn(
                                      x167 : @kernel.Thm,
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
                                      let s168 = @tactics.mp_tac(x167)
                                      fn(
                                        x169 : (
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
                                        s168(x169)
                                      }
                                    })(t171(x172))
                                  })(@equal.lhs(x173))
                                })(
                                  (fn(
                                    x174 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> @kernel.Term raise {
                                    x174.1
                                  })(x175),
                                )
                              })(x176)(x176)
                            },
                          ),
                          t177,
                        ),
                        t178,
                      ),
                      t179,
                    ),
                    t180,
                  ),
                  @tactics.strip_tac,
                ),
                t181,
              ),
              t182,
            ),
            t183,
          ),
          t184,
        ),
        t185,
      ),
      @int.asm_arith_tac,
    ),
  ])
  let t166 = @simp.asm_simp_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@class.eta_ax()]))(
        @multiplicative.phi_divisorsum(),
      ),
      @prime.finite_divisors(),
    ]),
  )
  let t163 = @drule.match_mp(@prime.prime_ge_2())
  let t165 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x164 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          let s161 = @tactics.mp_tac(x160)
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
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        })(t163(x164))
      }),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t159 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) - 1 == 0)"), fn(
    x156 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s157 = @tactics.assume_tac(x156)
    fn(
      x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s157(x158)
    }
  })
  let t155 = @tactics.match_mp_tac(lemma)
  let t154 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("(∀ x : _, (p : (_) -> Bool)(x) → (q : (_) -> Bool)(x)) == (∀ x : _, IN(x, {(x : _) | p(x)}) → q(x))"),
      ),
    ]),
  )
  let t306 = @tactics.thenl(
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
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.thenl(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @simp.rewrite_tac(
                                                              @list.List([
                                                                @theorems.imp_conj(),
                                                                @theorems.right_forall_imp_thm(),
                                                              ]),
                                                            ),
                                                            @tactics.gen_tac,
                                                          ),
                                                          @tactics.disch_tac,
                                                        ),
                                                        t154,
                                                      ),
                                                      t155,
                                                    ),
                                                    t159,
                                                  ),
                                                  t165,
                                                ),
                                                t166,
                                              ),
                                              @tactics.conj_tac,
                                            ),
                                            t186,
                                          ),
                                          t187,
                                        ),
                                        t188,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    t189,
                                  ),
                                  t190,
                                ),
                                t197,
                              ),
                              t198,
                            ),
                            t199,
                          ),
                          t200,
                        ),
                        @tactics.strip_tac,
                      ),
                      t201,
                    ),
                    t202,
                  ),
                  t203,
                ),
                t204,
              ),
              t208,
            ),
            t209,
          ),
          t213,
        ),
        t216,
      ),
      t220,
    ),
    t305,
  )
  count_orders_modulo_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ d : Num, prime(p) && divides(d, p - 1) → CARD({(x : Num) | IN(x, op_dot_dot(1, p - 1)) && order(p, x) == d}) == phi(d)"),
      t306,
    ),
  )
}

///|
let count_orders_modulo_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ORDERS_MODULO_PRIME",
)

///|
/// `COUNT_ORDERS_MODULO_PRIME`
pub fn count_orders_modulo_prime() -> @kernel.Thm {
  count_orders_modulo_prime_c.get()
}

///|
/// PRIMITIVE_ROOTS_MODULO_PRIME
fn step_8() -> Unit raise {
  let t309 = @simp.asm_rewrite_tac(@list.List([@prime.divides_refl()]))
  let t307 = @term_syntax.parse_term("(p : Num) - 1")
  let t308 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t307]),
      count_orders_modulo_prime(),
    ),
  )
  let t310 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t308),
    t309,
  )
  primitive_roots_modulo_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → CARD({(x : Num) | IN(x, op_dot_dot(1, p - 1)) && order(p, x) == p - 1}) == phi(p - 1)"),
      t310,
    ),
  )
}

///|
let primitive_roots_modulo_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOTS_MODULO_PRIME",
)

///|
/// `PRIMITIVE_ROOTS_MODULO_PRIME`
pub fn primitive_roots_modulo_prime() -> @kernel.Thm {
  primitive_roots_modulo_prime_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_PRIME
fn step_9() -> Unit raise {
  let t328 = @drule.match_mp(@prime.prime_ge_2())
  let t330 = @tactics.first_x_assum(fn(
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
    (fn(
      x325 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s326 = @tactics.mp_tac(x325)
      fn(
        x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s326(x327)
      }
    })(t328(x329))
  })
  let t324 = @tactics.match_mp_tac(@pocklington.phi_lowerbound_1_strong())
  let t323 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("1 <= (p : Num) → !(0 == p)")),
  )
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
    @tactics.all_tac
  })
  let t320 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t318 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t319 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@sets.card_clauses()])),
    t318,
  ])
  let t317 = @class.asm_cases_tac(
    @term_syntax.parse_term("{(x : Num) | IN(x, op_dot_dot(1, (p : Num) - 1)) && order(p, x) == p - 1} == {}"),
  )
  let t314 = @drule.match_mp(primitive_roots_modulo_prime())
  let t316 = @tactics.first_assum(fn(
    x315 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(t314(x315))
  })
  let t331 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t316,
                  ),
                  t317,
                ),
                t319,
              ),
              t320,
            ),
            t322,
          ),
          t323,
        ),
        t324,
      ),
      t330,
    ),
    @int.arith_tac,
  )
  primitive_root_modulo_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → (∃ x : Num, IN(x, op_dot_dot(1, p - 1)) && order(p, x) == p - 1)"),
      t331,
    ),
  )
}

///|
let primitive_root_modulo_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_PRIME",
)

///|
/// `PRIMITIVE_ROOT_MODULO_PRIME`
pub fn primitive_root_modulo_prime() -> @kernel.Thm {
  primitive_root_modulo_prime_c.get()
}

///|
/// COPRIME_1_PLUS_POWER_STEP
fn step_10() -> Unit raise {
  let t370 = @list.List([
    @int.asm_arith_tac,
    @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()])),
  ])
  let t369 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) * 2"))
  let t368 = @tactics.match_mp_tac(@arith.le_trans())
  let t371 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_simp_tac(
            @list.List([
              @prime.divides_exp_le(),
              @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 2 <= p")),
            ]),
          ),
          t368,
        ),
        t369,
      ),
      @tactics.conj_tac,
    ),
    t370,
  )
  let t367 = @simp.asm_rewrite_tac(@list.List([]))
  let t372 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@binomial.divides_prime_binom()),
        t367,
      ),
      @int.asm_arith_tac,
    ),
    t371,
  ])
  let t366 = @tactics.match_mp_tac(@prime.divides_mul2())
  let t365 = @simp.rewrite_tac(
    @list.List([
      @arith.exp(),
      @int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 == SUC(k + 1)")),
    ]),
  )
  let t373 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(@list.List([@arith.mult_sym()])),
          t365,
        ),
        t366,
      ),
      @tactics.conj_tac,
    ),
    t372,
  )
  let t364 = @list.List([
    @int.asm_arith_tac,
    @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()])),
  ])
  let t363 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) * 3"))
  let t362 = @tactics.match_mp_tac(@arith.le_trans())
  let t361 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_exp_le(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 2 <= p")),
    ]),
  )
  let t374 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(@prime.divides_rmul()),
              t361,
            ),
            t362,
          ),
          t363,
        ),
        @tactics.conj_tac,
      ),
      t364,
    ),
    t373,
  ])
  let t360 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) == (p : Num)"))
  let t359 = @tactics.match_mp_tac(@prime.divides_lmul())
  let t358 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t357 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) == b * (c * a)")),
    ]),
  )
  let t356 = @simp.rewrite_tac(@list.List([@arith.mult_exp()]))
  let t355 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t354 = @simp.rewrite_tac(
    @list.List([@prime.divides_0(), @prime.divides_add(), @iterate.in_numseg()]),
  )
  let t353 = @tactics.match_mp_tac(@iterate.nsum_closed())
  let t351 = @simp.rewrite_tac(@list.List([@arith.exp_add()]))
  let t350 = @simp.asm_rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((z : Num) + (p : Num) * (d : Num), p)) == coprime((z, p))"),
      ),
    ]),
  )
  let t349 = @tactics.exists_tac(@term_syntax.parse_term("(z : Num) + (p : Num) * (d : Num)"))
  let t348 = @tactics.disch_then(fn(
    x345 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s346 = @tactics.subst1_tac(x345)
    fn(
      x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s346(x347)
    }
  })
  let t344 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t352 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
                ),
                t344,
              ),
              t348,
            ),
            t349,
          ),
          t350,
        ),
        t351,
      ),
      @int.arith_tac,
    ),
  ])
  let t343 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(EXP((p : Num), (k : Num) + 2), nsum(op_dot_dot(2, p), (i : Num) => binom((p, i)) * EXP((z : Num) * EXP(p, k), i)))"),
    fn(
      x340 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s341 = @tactics.mp_tac(x340)
      fn(
        x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s341(x342)
      }
    },
  )
  let t339 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses_left(),
      @binomial.binom_1(),
      @arith.exp_1(),
      @calc_num.arith(),
    ]),
  )
  let t338 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (p : Num)"), fn(
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
    let s336 = @tactics.mp_tac(x335)
    fn(
      x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s336(x337)
    }
  })
  let t334 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_clauses_left(),
      @arith.le_0(),
      @arith.exp(),
      @binomial.binom(),
      @arith.mult_clauses(),
      @arith.add_clauses(),
    ]),
  )
  let t333 = @simp.rewrite_tac(
    @list.List([
      @binomial.binomial_theorem(),
      @arith.exp_one(),
      @arith.mult_clauses(),
    ]),
  )
  let t332 = @simp.once_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 + (a : Num) * (b : Num) == a * b + 1"))]),
  )
  let t375 = @tactics.thenl(
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
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t332,
                                      ),
                                      t333,
                                    ),
                                    t334,
                                  ),
                                  t338,
                                ),
                                @list.List([
                                  @int.asm_arith_tac, @tactics.all_tac,
                                ]),
                              ),
                              t339,
                            ),
                            @tactics.disch_tac,
                          ),
                          t343,
                        ),
                        t352,
                      ),
                      t353,
                    ),
                    t354,
                  ),
                  t355,
                ),
                @tactics.strip_tac,
              ),
              t356,
            ),
            t357,
          ),
          t358,
        ),
        t359,
      ),
      t360,
    ),
    t374,
  )
  coprime_1_plus_power_step_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ z : Num, ∀ k : Num, prime(p) && coprime((z, p)) && 3 <= p && 1 <= k → (∃ w : Num, coprime((w, p)) && EXP(1 + z * EXP(p, k), p) == 1 + w * EXP(p, k + 1))"),
      t375,
    ),
  )
}

///|
let coprime_1_plus_power_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_1_PLUS_POWER_STEP",
)

///|
/// `COPRIME_1_PLUS_POWER_STEP`
pub fn coprime_1_plus_power_step() -> @kernel.Thm {
  coprime_1_plus_power_step_c.get()
}

///|
/// COPRIME_1_PLUS_POWER
fn step_11() -> Unit raise {
  let t392 = @simp.rewrite_tac(
    @list.List([@arith.exp_add(), @arith.exp_1(), @arith.mult_ac()]),
  )
  let t391 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) + 1"))]),
  )
  let t388 = @term_syntax.parse_term("(k : Num) + 1")
  let t389 = @term_syntax.parse_term("(w : Num)")
  let t390 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t389, t388]),
      coprime_1_plus_power_step(),
    ),
  )
  let t387 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(w : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t386 = @simp.asm_rewrite_tac(@list.List([]))
  let t385 = @tactics.disch_then(fn(
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
    let th = x379
    let t384 = @tactics.strip_assume_tac(th)
    @tactics.then_tac(
      @tactics.pop_assum(fn(
        x381 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s382 = @tactics.mp_tac(x381)
        fn(
          x383 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s382(x383)
        }
      }),
      t384,
    )
  })
  let t378 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(
        @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(
          @arith.exp_exp(),
        ),
      ),
    ]),
  )
  let t377 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t376 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.exp_1(), @arith.exp()]),
  )
  let t393 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                      @nums.induct_tac,
                    ),
                    t376,
                  ),
                  t377,
                ),
                t378,
              ),
              t385,
            ),
            t386,
          ),
          t387,
        ),
        t390,
      ),
      t391,
    ),
    t392,
  )
  coprime_1_plus_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ z : Num, ∀ k : Num, prime(p) && coprime((z, p)) && 3 <= p → (∃ w : Num, coprime((w, p)) && EXP(1 + z * p, EXP(p, k)) == 1 + w * EXP(p, k + 1))"),
      t393,
    ),
  )
}

///|
let coprime_1_plus_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_1_PLUS_POWER",
)

///|
/// `COPRIME_1_PLUS_POWER`
pub fn coprime_1_plus_power() -> @kernel.Thm {
  coprime_1_plus_power_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_PRIMEPOWS
fn step_12() -> Unit raise {
  let t537 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) <= (j : Num) - 1"))
  let t536 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_exp_le(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 2 <= p")),
    ]),
  )
  let t535 = @simp.asm_rewrite_tac(@list.List([]))
  let t534 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t530 = @term_syntax.parse_term("EXP((p : Num), (k : Num) + 1)")
  let t531 = @term_syntax.parse_term("(w : Num)")
  let t532 = @term_syntax.parse_term("(j : Num)")
  let t533 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t532, t531, t530]),
      @prime.coprime_exp_divprod(),
    ),
  )
  let t529 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t528 = @simp.asm_rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq(1 + (x : Num), 1, mod((n : Num))) == divides(n, x)"),
      ),
    ]),
  )
  let t538 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.undisch_tac(
                      @term_syntax.parse_term("op_eq_eq(EXP((g : Num) + (p : Num) * (x : Num), (p - 1) * EXP(p, (k : Num))), 1, mod(EXP(p, (j : Num))))"),
                    ),
                    t528,
                  ),
                  t529,
                ),
                @tactics.disch_tac,
              ),
              t533,
            ),
            t534,
          ),
          t535,
        ),
        t536,
      ),
      t537,
    ),
    @int.arith_tac,
  )
  let t527 = @simp.asm_rewrite_tac(@list.List([]))
  let t526 = @tactics.match_mp_tac(coprime_1_plus_power())
  let t525 = @simp.gen_rewrite_tac(
    fn(
      x524 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x517 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s518 = @equal.binder_conv(x517)
        fn(x519 : @kernel.Term) -> @kernel.Thm raise { s518(x519) }
      })(
        ((x523 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            3,
            fn(
              x520 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s521 = @equal.rand_conv(x520)
              fn(x522 : @kernel.Term) -> @kernel.Thm raise { s521(x522) }
            },
            x523,
          )
        })(x524),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t516 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t539 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())])),
            t516,
          ),
          t525,
        ),
        t526,
      ),
      t527,
    ),
    t538,
  ])
  let t515 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ w : Num, EXP((g : Num) + (p : Num) * (x : Num), (p - 1) * EXP(p, (k : Num))) == 1 + EXP(p, k + 1) * w && coprime((w, p))"),
    @tactics.strip_assume_tac,
  )
  let t513 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t512 = @tactics.match_mp_tac(@prime.divides_rexp())
  let t511 = @tactics.match_mp_tac(@prime.divides_rmul())
  let t510 = @tactics.replicate_tac(
    2,
    @tactics.match_mp_tac(@prime.divides_lmul()),
  )
  let t509 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t508 = @simp.rewrite_tac(
    @list.List([@prime.divides_0(), @prime.divides_add(), @iterate.in_numseg()]),
  )
  let t507 = @tactics.match_mp_tac(@iterate.nsum_closed())
  let t506 = @simp.asm_rewrite_tac(@list.List([]))
  let t505 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("coprime(((p : Num), (y : Num) + (x : Num))) && divides(p, (z : Num)) → coprime((y + (z + x), p))"),
    ),
  )
  let t503 = @list.List([
    @int.asm_arith_tac,
    @simp.rewrite_tac(@list.List([@binomial.binom_penult()])),
  ])
  let t504 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) - 1 == SUC(p - 2)"), fn(
        x500 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s501 = @tactics.subst1_tac(x500)
        fn(
          x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s501(x502)
        }
      }),
      t503,
    ),
    @tactics.all_tac,
  ])
  let t499 = @tactics.subgoal_then(
    @term_syntax.parse_term("binom(((p : Num) - 1, p - 2)) == p - 1"),
    fn(
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
    },
  )
  let t495 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp_1(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → p - 1 - (p - 2) == 1")),
    ]),
  )
  let t494 = @simp.rewrite_tac(
    @list.List([
      @binomial.binom_refl(),
      @arith.sub_refl(),
      @arith.exp(),
      @arith.mult_clauses(),
    ]),
  )
  let t493 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_clauses_right(),
      @arith.le_0(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 0 < p - 2")),
    ]),
  )
  let t491 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@arith.exp()))]),
  )
  let t490 = @simp.rewrite_tac(@list.List([@arith.mult_exp()]))
  let t489 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(p : Num) * ((b : Num) * ((g : Num) * ((pp : Num) * (x : Num)))) == b * (g * (p * pp * x))"),
      ),
    ]),
  )
  let t488 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t487 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t486 = @tactics.match_mp_tac(@iterate.nsum_eq())
  let t492 = @list.List([
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
                                @list.List([@equal.gsym(@iterate.nsum_lmul())]),
                              ),
                              t486,
                            ),
                            t487,
                          ),
                          t488,
                        ),
                        @tactics.strip_tac,
                      ),
                      t489,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  @tactics.ap_term_tac,
                ),
                t490,
              ),
              t491,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.ap_term_tac,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t485 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((s : Num) + (1 + (y : Num) * (p : Num)) == 1 + (y + (t : Num)) * p) == (s == p * t)"),
      ),
    ]),
  )
  let t484 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) - 1 - 1 == n - 2"))]),
  )
  let t483 = @tactics.exists_tac(
    @term_syntax.parse_term("(y : Num) + nsum(op_dot_dot(0, (p : Num) - 2), (k : Num) => binom((p - 1, k)) * (EXP((g : Num), k) * (EXP(p, p - 2 - k) * EXP((x : Num), p - 1 - k))))"),
  )
  let t482 = @simp.rewrite_tac(
    @list.List([
      @binomial.binom_refl(),
      @arith.sub_refl(),
      @arith.exp(),
      @arith.mult_clauses(),
    ]),
  )
  let t481 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_clauses_right(),
      @arith.le_0(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 0 < p - 1")),
    ]),
  )
  let t514 = @list.List([
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
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @simp.rewrite_tac(
                                                    @list.List([
                                                      @binomial.binomial_theorem(),
                                                    ]),
                                                  ),
                                                  t481,
                                                ),
                                                t482,
                                              ),
                                              t483,
                                            ),
                                            t484,
                                          ),
                                          t485,
                                        ),
                                        @tactics.conj_tac,
                                      ),
                                      t492,
                                    ),
                                    t493,
                                  ),
                                  t494,
                                ),
                                t495,
                              ),
                              t499,
                            ),
                            t504,
                          ),
                          t505,
                        ),
                        t506,
                      ),
                      t507,
                    ),
                    t508,
                  ),
                  t509,
                ),
                @tactics.strip_tac,
              ),
              t510,
            ),
            t511,
          ),
          t512,
        ),
        t513,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t480 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ z : Num, EXP((g : Num) + (p : Num) * (x : Num), p - 1) == 1 + z * p && coprime((z, p))"),
    @tactics.strip_assume_tac,
  )
  let t478 = @tactics.conjuncts_then2(
    fn(
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
      let s473 = @tactics.assume_tac(x472)
      fn(
        x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s473(x474)
      }
    },
    fn(
      x475 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s476 = @tactics.subst_all_tac(x475)
      fn(
        x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s476(x477)
      }
    },
  )
  let t479 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t478),
  )
  let t471 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_primepow(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p - 1 == 0)")),
    ]),
  )
  let t468 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("divides((a : Num) * (x : Num), a * (y : Num)) → !(a == 0) → divides(x, y)"),
    ),
  )
  let t470 = @tactics.disch_then(fn(
    x469 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x465 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s466 = @tactics.mp_tac(x465)
      fn(
        x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s466(x467)
      }
    })(t468(x469))
  })
  let t463 = @simp.rewrite_tac(
    @list.List([@arith.exp(), @arith.right_sub_distrib()]),
  )
  let t462 = @simp.rewrite_tac(
    @list.List([@calc_num.arith(), @arith.suc_sub1()]),
  )
  let t460 = @term_syntax.parse_term("(j : Num)")
  let t461 = @tactics.spec_tac(@term_syntax.parse_term("(j : Num)"), t460)
  let t464 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.undisch_tac(@term_syntax.parse_term("1 <= (j : Num)")),
              t461,
            ),
            @nums.induct_tac,
          ),
          t462,
        ),
        t463,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t459 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP((p : Num), (j : Num)) - EXP(p, j - 1) == (p - 1) * EXP(p, j - 1)"),
    fn(
      x456 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s457 = @tactics.subst1_tac(x456)
      fn(
        x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s457(x458)
      }
    },
  )
  let t454 = @simp.asm_rewrite_tac(@list.List([]))
  let t453 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t455 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.number_rule(
                @term_syntax.parse_term("coprime(((p : Num), (g : Num) + p * (x : Num))) == coprime((g, p))"),
              ),
            ]),
          ),
          t453,
        ),
        t454,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t452 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.phi_primepow(),
      @arith.le_1(),
      @prime.coprime_lexp(),
    ]),
  )
  let t450 = @term_syntax.parse_term("EXP((p : Num), (j : Num))")
  let t451 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(g : Num) + (p : Num) * (x : Num)"), t450]),
      @pocklington.order_divides_phi(),
    ),
  )
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
    let th = x444
    let t446 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.subst_all_tac(th), t446)
  })
  let t443 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t448 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
      ),
      t443,
    ),
    t447,
  )
  let t442 = @simp.asm_simp_tac(
    @list.List([@prime.divides_refl(), @prime.divides_rexp(), @arith.le_1()]),
  )
  let t441 = @simp.asm_rewrite_tac(@list.List([]))
  let t440 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (j : Num))"))
  let t449 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @int.number_rule(
              @term_syntax.parse_term("∀ y : Num, op_eq_eq((a : Num), 1, mod(y)) && divides((x : Num), y) → op_eq_eq(a, 1, mod(x))"),
            ),
          ),
          t440,
        ),
        t441,
      ),
      t442,
    ),
    t448,
  ])
  let t439 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) && ((b : Bool) → (c : Bool)) → a == b → c")),
  )
  let t438 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @pocklington.order_cong(),
        @int.number_rule(@term_syntax.parse_term("op_eq_eq((g : Num), g + (p : Num) * (x : Num), mod(p))")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t437 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((p : Num), (g : Num) + p * (x : Num)) == p - 1"),
    fn(
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
      let s435 = @tactics.subst1_tac(x434)
      fn(
        x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s435(x436)
      }
    },
  )
  let t431 = @term_syntax.parse_term("order(EXP((p : Num), (j : Num)), (g : Num) + p * (x : Num))")
  let t432 = @term_syntax.parse_term("(g : Num) + (p : Num) * (x : Num)")
  let t433 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t432, t431]),
      @pocklington.order_divides(),
    ),
  )
  let t429 = @term_syntax.parse_term("(g : Num) + (p : Num) * (x : Num)")
  let t430 = @tactics.strip_assume_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("EXP((p : Num), (j : Num))"), t429]),
      @pocklington.order_works(),
    ),
  )
  let t428 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t427 = @tactics.exists_tac(@term_syntax.parse_term("(g : Num) + (p : Num) * (x : Num)"))
  let t423 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t421 = @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 1 <= p"))
  let t422 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_sub(),
      @int.int_of_num_pow(),
      @int.int_of_num_mul(),
      @int.int_of_num_add(),
      @equal.gsym(@int.num_coprime()),
      t421,
    ]),
  )
  let t418 = @drule.match_mp(
    @int.integer_rule(
      @term_syntax.parse_term("op_eq_eq((x : Int), int_of_num(1) - (y : Int), mod((n : Int))) → coprime((n, y + x))"),
    ),
  )
  let t420 = @tactics.disch_then(fn(
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
      x415 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s416 = @tactics.mp_tac(x415)
      fn(
        x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s416(x417)
      }
    })(t418(x419))
  })
  let t414 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t424 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_exists_pos())])),
            t414,
          ),
          @tactics.gen_tac,
        ),
        t420,
      ),
      t422,
    ),
    t423,
  )
  let t413 = @simp.asm_rewrite_tac(@list.List([]))
  let t412 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t411 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_eq(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p == 0)")),
    ]),
  )
  let t409 = @equal.gsym(@int.num_coprime())
  let t410 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(@term_syntax.parse_term("coprime(((p : Int) - int_of_num(1), p))")),
      t409,
    ]),
  )
  let t425 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @integer.int_coprime_lmul(),
                    @integer.int_coprime_lpow(),
                  ]),
                ),
                t410,
              ),
              t411,
            ),
            @tactics.disj1_tac,
          ),
          t412,
        ),
        t413,
      ),
      @int.asm_arith_tac,
    ),
    t424,
  ])
  let t407 = @term_syntax.parse_term("int_of_num((p : Num))")
  let t408 = @term_syntax.parse_term("int_of_num(1) - int_of_num((y : Num))")
  let t426 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([
              @term_syntax.parse_term("(int_of_num((p : Num)) - int_of_num(1)) * pow(int_of_num((g : Num)), p - 2)"),
              t408,
              t407,
            ]),
            @integer.int_cong_solve_pos(),
          ),
        ),
        @tactics.ants_tac,
      ),
      t425,
    ),
    @tactics.all_tac,
  ])
  let t406 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : Num, coprime(((p : Num), (y : Num) + (p - 1) * (EXP((g : Num), p - 2) * x)))"),
    @tactics.choose_tac,
  )
  let t405 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t404 = @simp.asm_simp_tac(
    @list.List([@pocklington.cong_to_1(), @arith.exp_eq_0(), @arith.le_1()]),
  )
  let t402 = @term_syntax.parse_term("(g : Num)")
  let t403 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t402]),
      @pocklington.order_v1(),
    ),
  )
  let t401 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(g : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t400 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t397 = @drule.match_mp(primitive_root_modulo_prime())
  let t399 = @tactics.first_assum(fn(
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
    (fn(
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
      let s395 = @tactics.mp_tac(x394)
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
    })(t397(x398))
  })
  let t540 = @tactics.thenl(
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
                                                                    @tactics.repeat_tac(
                                                                      @tactics.strip_tac,
                                                                    ),
                                                                    t399,
                                                                  ),
                                                                  t400,
                                                                ),
                                                                t401,
                                                              ),
                                                              t403,
                                                            ),
                                                            t404,
                                                          ),
                                                          t405,
                                                        ),
                                                        t406,
                                                      ),
                                                      t426,
                                                    ),
                                                    t427,
                                                  ),
                                                  t428,
                                                ),
                                                @tactics.disch_tac,
                                              ),
                                              t430,
                                            ),
                                            t433,
                                          ),
                                          t437,
                                        ),
                                        t438,
                                      ),
                                      t439,
                                    ),
                                    @tactics.conj_tac,
                                  ),
                                  t449,
                                ),
                                t451,
                              ),
                              t452,
                            ),
                            @tactics.ants_tac,
                          ),
                          t455,
                        ),
                        t459,
                      ),
                      t464,
                    ),
                    t470,
                  ),
                  t471,
                ),
                t479,
              ),
              @tactics.ap_term_tac,
            ),
            @tactics.ap_term_tac,
          ),
          t480,
        ),
        t514,
      ),
      t515,
    ),
    t539,
  )
  primitive_root_modulo_primepows_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) && 3 <= p → (∃ g : Num, ∀ j : Num, 1 <= j → order(EXP(p, j), g) == phi(EXP(p, j)))"),
      t540,
    ),
  )
}

///|
let primitive_root_modulo_primepows_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_PRIMEPOWS",
)

///|
/// `PRIMITIVE_ROOT_MODULO_PRIMEPOWS`
pub fn primitive_root_modulo_primepows() -> @kernel.Thm {
  primitive_root_modulo_primepows_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_PRIMEPOW
fn step_13() -> Unit raise {
  let t584 = @simp.rewrite_tac(@list.List([@pocklington.cong_mod()]))
  let t583 = @tactics.match_mp_tac(@pocklington.order_cong())
  let t582 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t581 = @tactics.exists_tac(@term_syntax.parse_term("order(EXP((p : Num), (k : Num)), (x : Num))"))
  let t585 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t581),
          @tactics.conj_tac,
        ),
        t582,
      ),
      t583,
    ),
    t584,
  )
  let t578 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p == 0)")),
    ]),
  )
  let t576 = @term_syntax.parse_term("EXP((p : Num), (k : Num))")
  let t577 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Num)"), t576]),
      @arith.division(),
    ),
  )
  let t579 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @int.arith_rule(@term_syntax.parse_term("(a : Num) < (b : Num) → a <= b - 1")),
      ),
      t577,
    ),
    t578,
  )
  let t575 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0()]))
  let t574 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → 1 <= p")),
  )
  let t573 = @tactics.match_mp_tac(@pocklington.phi_lowerbound_1_strong())
  let t572 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("1 <= (p : Num) → !(p == 0)")),
  )
  let t571 = @simp.asm_rewrite_tac(@list.List([]))
  let t570 = @tactics.match_mp_tac(@prime.divides_rexp())
  let t569 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p == 1)"))]),
  )
  let t568 = @simp.asm_simp_tac(
    @list.List([@arith.exp_eq_1(), @int.divides_one(), @arith.le_1()]),
  )
  let t565 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((x : Num), 1, mod((p : Num))) → divides(p, x) → divides(p, 1)"),
    ),
  )
  let t567 = @tactics.disch_then(fn(
    x566 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x562 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s563 = @tactics.mp_tac(x562)
      fn(
        x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s563(x564)
      }
    })(t565(x566))
  })
  let t560 = @term_syntax.parse_term("(x : Num)")
  let t561 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("EXP((p : Num), (k : Num))"), t560]),
      @pocklington.order_v1(),
    ),
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
  let t554 = @simp.asm_simp_tac(
    @list.List([
      @arith.exp_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p == 0)")),
    ]),
  )
  let t553 = @term_syntax.parse_term("(x : Num)")
  let t580 = @list.List([
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
                                @tactics.mp_tac(
                                  @bool.ispecl(
                                    @list.List([
                                      @term_syntax.parse_term("EXP((p : Num), (k : Num))"),
                                      t553,
                                    ]),
                                    @int.divides_mod(),
                                  ),
                                ),
                                t554,
                              ),
                              t559,
                            ),
                            @tactics.disch_tac,
                          ),
                          t561,
                        ),
                        t567,
                      ),
                      t568,
                    ),
                    t569,
                  ),
                  t570,
                ),
                t571,
              ),
              t572,
            ),
            t573,
          ),
          t574,
        ),
        t575,
      ),
      @int.asm_arith_tac,
    ),
    t579,
  ])
  let t586 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @iterate.in_numseg(),
            @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
          ]),
        ),
        @tactics.conj_tac,
      ),
      t580,
    ),
    t585,
  ])
  let t552 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), EXP((p : Num), (k : Num)))"))
  let t551 = @simp.asm_rewrite_tac(@list.List([]))
  let t547 = @term_syntax.parse_term("(k : Num)")
  let t550 = @tactics.disch_then(fn(
    x549 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x548 : @kernel.Thm) => @bool.spec(t547, x548))(x549))
  })
  let t543 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t542 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t541 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(p : Num)"), primitive_root_modulo_primepows()),
  )
  let t587 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t541,
                  ),
                  t542,
                ),
                t543,
              ),
              t550,
            ),
            t551,
          ),
          @tactics.disch_tac,
        ),
        t552,
      ),
      @tactics.conj_tac,
    ),
    t586,
  )
  primitive_root_modulo_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) && 3 <= p && 1 <= k → (∃ x : Num, IN(x, op_dot_dot(1, EXP(p, k) - 1)) && order(EXP(p, k), x) == phi(EXP(p, k)))"),
      t587,
    ),
  )
}

///|
let primitive_root_modulo_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_PRIMEPOW",
)

///|
/// `PRIMITIVE_ROOT_MODULO_PRIMEPOW`
pub fn primitive_root_modulo_primepow() -> @kernel.Thm {
  primitive_root_modulo_primepow_c.get()
}

///|
/// PRIME_DIVISOR_ORDER_EXISTS
fn step_14() -> Unit raise {
  let t676 = @simp.asm_simp_tac(
    @list.List([
      @int.div_by_div(),
      @int.divides_div_self(),
      @pocklington.phi_eq_0(),
      @arith.div_eq_0(),
      @arith.not_lt(),
      @prime.prime_imp_nz(),
    ]),
  )
  let t673 = @drule.match_mp(@int.divides_le())
  let t675 = @tactics.first_assum(fn(
    x674 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s671 = @tactics.mp_tac(x670)
      fn(
        x672 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s671(x672)
      }
    })(t673(x674))
  })
  let t664 = @drule.part_match(
    fn(x663 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x663))
    },
    @pocklington.order_exp(),
  )
  let t659 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP((x : Num), DIV(phi(EXP((q : Num), (k : Num))), (p : Num)))"),
  )
  let t658 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t657 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.odd_prime(), @prime.prime_odd()])),
    @tactics.all_tac,
  ])
  let t656 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t654 = @term_syntax.parse_term("(k : Num)")
  let t655 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(q : Num)"), t654]),
      primitive_root_modulo_primepow(),
    ),
  )
  let t652 = @tactics.repeat_tac(@tactics.strip_tac)
  let t651 = @simp.simp_tac(
    @list.List([@prime.divides_exp_le(), @arith.le_refl()]),
  )
  let t650 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((p : Num), 2, mod(p)) == divides(p, EXP(2, 1))"),
      ),
    ]),
  )
  let t649 = @simp.simp_tac(
    @list.List([
      @arith.sub_add(),
      @arith.le_1(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
    ]),
  )
  let t646 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq((a : Num), 1, mod((p : Num))) → op_eq_eq(a + 1, 2, mod(p))"),
    ),
  )
  let t648 = @tactics.disch_then(fn(
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
      x643 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s644 = @tactics.mp_tac(x643)
      fn(
        x645 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s644(x645)
      }
    })(t646(x647))
  })
  let t642 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.order_unique_prime(),
      @pocklington.cong_minus1_squared(),
    ]),
  )
  let t641 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (k : Num)) - 1"))
  let t640 = @tactics.repeat_tac(@tactics.strip_tac)
  let t639 = @simp.asm_simp_tac(
    @list.List([
      @prime.prime_divexp_eq(),
      @arith.mult_clauses(),
      @prime.divides_prime_prime(),
    ]),
  )
  let t638 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t653 = @list.List([
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
                        @simp.asm_simp_tac(
                          @list.List([@pocklington.phi_primepow_alt()]),
                        ),
                        t638,
                      ),
                      t639,
                    ),
                    t640,
                  ),
                  t641,
                ),
                t642,
              ),
              t648,
            ),
            t649,
          ),
          t650,
        ),
        t651,
      ),
      @int.asm_arith_tac,
    ),
    t652,
  ])
  let t637 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 2"))
  let t635 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t636 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([@pocklington.phi_1(), @arith.exp(), @int.divides_one()]),
      ),
      t635,
    ),
    @tactics.all_tac,
  ])
  let t634 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t631 = @term_syntax.parse_term("(k : Num)")
  let t632 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q : Num)"), t631]),
  )
  let t630 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.order_1(), @prime.lcm_1()]),
  )
  let t627 = @drule.match_mp(@pocklington.order_cong())
  let t629 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x628 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(t627(x628))
    }),
  )
  let t623 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Num)"))
  let t622 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t621 = @simp.asm_rewrite_tac(@list.List([]))
  let t617 = @term_syntax.parse_term("1")
  let t618 = @term_syntax.parse_term("(a : Num)")
  let t619 = @term_syntax.parse_term("(n : Num)")
  let t620 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t619, t618, t617]),
      @pocklington.chinese_remainder_usual(),
    ),
  )
  let t614 = @term_syntax.parse_term("(a : Num)")
  let t616 = @tactics.first_x_assum((x615 : @kernel.Thm) => {
    @tactics.x_choose_tac(t614, x615)
  })
  let t613 = @tactics.first_x_assum(fn(
    x612 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x607 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(
      ((x611 : @kernel.Thm) => {
        @lib.check(
          fn(x610 : @kernel.Thm) -> Bool raise {
            (fn(x608 : @kernel.Term) -> Bool raise { @basics.is_imp(x608) })(
              (fn(x609 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x609)
              })(x610),
            )
          },
          x611,
        )
      })(x612),
    )
  })
  let t606 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
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
      let s604 = @tactics.assume_tac(x603)
      fn(
        x605 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s604(x605)
      }
    }),
  )
  let t602 = @simp.asm_rewrite_tac(@list.List([]))
  let t600 = @term_syntax.parse_term("(n : Num) == 0")
  let t601 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t600]),
  )
  let t598 = @term_syntax.parse_term("(n : Num)")
  let t599 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t598]),
  )
  let t597 = @list.List([
    @simp.rewrite_tac(
      @list.List([@theorems.conj_aci(), @prime.coprime_sym(), @prime.lcm_sym()]),
    ),
    @tactics.all_tac,
  ])
  let t596 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, ∀ y : _, (R : (_, _) -> Bool)(x, y) == R(y, x)) && (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) → R(x, y)) → (∀ x : _, ∀ y : _, P(x) || P(y) → R(x, y))"),
    ),
  )
  let t595 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj_alt()]))
  let t594 = @simp.asm_simp_tac(
    @list.List([
      @prime.prime_divprod_eq(),
      @class.de_morgan_thm(),
      @theorems.imp_imp(),
      @theorems.conj_assoc(),
    ]),
  )
  let t633 = @list.List([
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
                                        @simp.simp_tac(
                                          @list.List([
                                            @pocklington.order_mul_lcm(),
                                            @pocklington.phi_multiplicative(),
                                            @arith.mult_eq_0(),
                                          ]),
                                        ),
                                        t594,
                                      ),
                                      t595,
                                    ),
                                    t596,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t597,
                              ),
                              t599,
                            ),
                            @tactics.disch_tac,
                          ),
                          t601,
                        ),
                        t602,
                      ),
                      t606,
                    ),
                    t613,
                  ),
                  t616,
                ),
                t620,
              ),
              t621,
            ),
            t622,
          ),
          t623,
        ),
        t629,
      ),
      t630,
    ),
    t632,
  ])
  let t593 = @simp.rewrite_tac(@list.List([]))
  let t592 = @tactics.match_mp_tac(@prime.induct_coprime_alt())
  let t591 = @simp.asm_rewrite_tac(@list.List([]))
  let t590 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t589 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t677 = @tactics.then_tac(
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @simp.gen_rewrite_tac(
                                            fn(
                                              x588 : (@kernel.Term) -> @kernel.Thm raise,
                                            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                              x588
                                            },
                                            @list.List([
                                              @theorems.swap_forall_thm(),
                                            ]),
                                          ),
                                          t589,
                                        ),
                                        t590,
                                      ),
                                      t591,
                                    ),
                                    t592,
                                  ),
                                  t593,
                                ),
                                @tactics.conj_tac,
                              ),
                              t633,
                            ),
                            t634,
                          ),
                          t636,
                        ),
                        t637,
                      ),
                      t653,
                    ),
                    t655,
                  ),
                  t656,
                ),
                @tactics.ants_tac,
              ),
              t657,
            ),
            t658,
          ),
          t659,
        ),
        fn(
          x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x668 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x666 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x665 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    s661(x662)
                  }
                })(t664(x665))
              })(@equal.lhand(x666))
            })(
              (fn(
                x667 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x667.1
              })(x668),
            )
          })(x669)(x669)
        },
      ),
      t675,
    ),
    t676,
  )
  prime_divisor_order_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : Num, !(n == 0) && prime(p) && divides(p, phi(n)) → (∃ x : Num, order(n, x) == p)"),
      t677,
    ),
  )
}

///|
let prime_divisor_order_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_DIVISOR_ORDER_EXISTS",
)

///|
/// `PRIME_DIVISOR_ORDER_EXISTS`
pub fn prime_divisor_order_exists() -> @kernel.Thm {
  prime_divisor_order_exists_c.get()
}

///|
/// INJECTIVE_EXP_MODULO_EQ
fn step_15() -> Unit raise {
  let t699 = @meson.asm_meson_tac(
    @list.List([
      @prime.prime_0(),
      @prime.prime_1(),
      @pocklington.order_eq_0(),
      @pocklington.order_eq_1(),
      @pocklington.order_divides(),
    ]),
  )
  let t698 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_1(), @arith.exp_one()]),
  )
  let t697 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t696 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t695 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t694 = @simp.asm_rewrite_tac(@list.List([]))
  let t692 = @term_syntax.parse_term("(p : Num)")
  let t693 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t692]),
      prime_divisor_order_exists(),
    ),
  )
  let t691 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t690 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t689 = @simp.rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm(), @class.not_forall_thm()]),
  )
  let t688 = @simp.gen_rewrite_tac(
    fn(
      x687 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x681 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s682 = @equal.land_conv(x681)
        fn(x683 : @kernel.Term) -> @kernel.Thm raise { s682(x683) }
      })(
        (fn(
          x684 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s685 = @equal.rand_conv(x684)
          fn(x686 : @kernel.Term) -> @kernel.Thm raise { s685(x686) }
        })(x687),
      )
    },
    @list.List([@prime.coprime_prime_eq()]),
  )
  let t680 = @simp.gen_rewrite_tac(
    fn(
      x679 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x679
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t678 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@pocklington.injective_exp_modulo()])),
  ])
  let t700 = @tactics.then_tac(
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
                                  @tactics.repeat_tac(@tactics.strip_tac),
                                  @tactics.eq_tac,
                                ),
                                t678,
                              ),
                              t680,
                            ),
                            t688,
                          ),
                          t689,
                        ),
                        t690,
                      ),
                      @tactics.strip_tac,
                    ),
                    t691,
                  ),
                  t693,
                ),
                t694,
              ),
              t695,
            ),
            t696,
          ),
          @tactics.strip_tac,
        ),
        t697,
      ),
      t698,
    ),
    t699,
  )
  injective_exp_modulo_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) → (∀ a : Num, ∀ b : Num, coprime((n, a)) && coprime((n, b)) && op_eq_eq(EXP(a, k), EXP(b, k), mod(n)) → op_eq_eq(a, b, mod(n))) == coprime((k, phi(n)))"),
      t700,
    ),
  )
}

///|
let injective_exp_modulo_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INJECTIVE_EXP_MODULO_EQ",
)

///|
/// `INJECTIVE_EXP_MODULO_EQ`
pub fn injective_exp_modulo_eq() -> @kernel.Thm {
  injective_exp_modulo_eq_c.get()
}

///|
/// POWER_RESIDUE_MODULO_EQ_ALT
fn step_16() -> Unit raise {
  let t719 = @simp.asm_rewrite_tac(@list.List([]))
  let t718 = @tactics.match_mp_tac(injective_exp_modulo_eq())
  let t717 = @tactics.disch_then(fn(
    x714 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s715 = @tactics.subst1_tac(x714)
    fn(
      x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s715(x716)
    }
  })
  let t713 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t712 = @tactics.conv_tac(@arith.mod_down_conv)
  let t711 = @simp.asm_simp_tac(
    @list.List([@arith.mod_lt_eq(), @prime.coprime_rexp()]),
  )
  let t710 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @theorems.imp_imp(),
      @equal.gsym(@theorems.conj_assoc()),
      @int.coprime_rmod(),
    ]),
  )
  let t708 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.forall_in_image(),
      @theorems.right_imp_forall_thm(),
    ]),
  )
  let t707 = @sets.set_tac(@list.List([]))
  let t706 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t705 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Num) | a < (n : Num)}"))
  let t709 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t705),
        t706,
      ),
      t707,
    ),
    t708,
  ])
  let t704 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@theorems.conj_assoc()),
      @arith.forall_lt_mod_thm(),
      @arith.exists_lt_mod_thm(),
    ]),
  )
  let t703 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @sets.in_elim_thm(),
    ]),
  )
  let t701 = @term_syntax.parse_term("(a : Num) => MOD(EXP(a, (k : Num)), (n : Num))")
  let t702 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("{(a : Num) | a < (n : Num) && coprime((n, a))}"), t701]),
      @sets.surjective_iff_injective(),
    ),
  )
  let t720 = @tactics.then_tac(
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
                          t702,
                        ),
                        t703,
                      ),
                      t704,
                    ),
                    @tactics.ants_tac,
                  ),
                  t709,
                ),
                t710,
              ),
              t711,
            ),
            t712,
          ),
          t713,
        ),
        t717,
      ),
      t718,
    ),
    t719,
  )
  power_residue_modulo_eq_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) → (∀ a : Num, coprime((n, a)) → (∃ x : Num, coprime((n, x)) && op_eq_eq(EXP(x, k), a, mod(n)))) == coprime((k, phi(n)))"),
      t720,
    ),
  )
}

///|
let power_residue_modulo_eq_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_EQ_ALT",
)

///|
/// `POWER_RESIDUE_MODULO_EQ_ALT`
pub fn power_residue_modulo_eq_alt() -> @kernel.Thm {
  power_residue_modulo_eq_alt_c.get()
}

///|
/// POWER_RESIDUE_MODULO_EQ
fn step_17() -> Unit raise {
  let t752 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t749 = @drule.match_mp(@pocklington.cong_coprime())
  let t751 = @tactics.first_assum(fn(
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
      x746 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s747 = @tactics.mp_tac(x746)
      fn(
        x748 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s747(x748)
      }
    })(t749(x750))
  })
  let t745 = @simp.asm_rewrite_tac(@list.List([]))
  let t744 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t743 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t742 = @simp.asm_rewrite_tac(@list.List([]))
  let t738 = @term_syntax.parse_term("(a : Num)")
  let t741 = @tactics.first_x_assum(fn(
    x740 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s736 = @tactics.mp_tac(x735)
      fn(
        x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s736(x737)
      }
    })(((x739 : @kernel.Thm) => @bool.spec(t738, x739))(x740))
  })
  let t734 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t732 = @meson.meson_tac(@list.List([@prime.coprime_1()]))
  let t733 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@arith.exp(), @prime.coprime_0()])),
      t732,
    ),
    @tactics.all_tac,
  ])
  let t731 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t728 = @drule.match_mp(power_residue_modulo_eq_alt())
  let t725 = @term_syntax.parse_term("(k : Num)")
  let t730 = @tactics.first_assum(fn(
    x729 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x727 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x724 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x721 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s722 = @tactics.subst1_tac(x721)
          fn(
            x723 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s722(x723)
          }
        })(@equal.sym(x724))
      })(((x726 : @kernel.Thm) => @bool.spec(t725, x726))(x727))
    })(t728(x729))
  })
  let t753 = @tactics.then_tac(
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
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  @tactics.disch_tac,
                                ),
                                t730,
                              ),
                              t731,
                            ),
                            t733,
                          ),
                          @tactics.eq_tac,
                        ),
                        @tactics.disch_tac,
                      ),
                      t734,
                    ),
                    @tactics.disch_tac,
                  ),
                  t741,
                ),
                t742,
              ),
              t743,
            ),
            t744,
          ),
          @tactics.strip_tac,
        ),
        t745,
      ),
      t751,
    ),
    t752,
  )
  power_residue_modulo_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) → (∀ a : Num, coprime((n, a)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n)))) == coprime((k, phi(n)))"),
      t753,
    ),
  )
}

///|
let power_residue_modulo_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_EQ",
)

///|
/// `POWER_RESIDUE_MODULO_EQ`
pub fn power_residue_modulo_eq() -> @kernel.Thm {
  power_residue_modulo_eq_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_2
fn step_18() -> Unit raise {
  let t761 = @simp.rewrite_tac(@list.List([]))
  let t760 = @tactics.conv_tac(@equal.once_depth_conv(@pocklington.cong_conv))
  let t759 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t758 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!(0 < (m : Num) && m < 1)"))]),
  )
  let t757 = @tactics.match_mp_tac(@pocklington.order_unique())
  let t756 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t755 = @simp.simp_tac(
    @list.List([@pocklington.phi_prime(), @prime.prime_2()]),
  )
  let t754 = @simp.rewrite_tac(
    @list.List([@iterate.in_numseg(), @calc_num.arith()]),
  )
  let t762 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.exists_tac(@term_syntax.parse_term("1")),
                  t754,
                ),
                t755,
              ),
              t756,
            ),
            t757,
          ),
          t758,
        ),
        t759,
      ),
      t760,
    ),
    t761,
  )
  primitive_root_modulo_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, 1)) && order(2, x) == phi(2)"),
      t762,
    ),
  )
}

///|
let primitive_root_modulo_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_2",
)

///|
/// `PRIMITIVE_ROOT_MODULO_2`
pub fn primitive_root_modulo_2() -> @kernel.Thm {
  primitive_root_modulo_2_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_4
fn step_19() -> Unit raise {
  let t771 = @simp.rewrite_tac(@list.List([]))
  let t770 = @tactics.conv_tac(@equal.once_depth_conv(@pocklington.cong_conv))
  let t769 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t768 = @simp.rewrite_tac(
    @list.List([
      @theorems.forall_unwind_thm2(),
      @int.arith_rule(@term_syntax.parse_term("(0 < (m : Num) && m < 2) == (m == 1)")),
    ]),
  )
  let t767 = @tactics.match_mp_tac(@pocklington.order_unique())
  let t766 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t765 = @simp.simp_tac(
    @list.List([@pocklington.phi_primepow(), @prime.prime_2()]),
  )
  let t764 = @tactics.subst1_tac(
    @int.arith_rule(@term_syntax.parse_term("4 == EXP(2, 2)")),
  )
  let t763 = @simp.rewrite_tac(
    @list.List([@iterate.in_numseg(), @calc_num.arith()]),
  )
  let t772 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.exists_tac(@term_syntax.parse_term("3")),
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
        t769,
      ),
      t770,
    ),
    t771,
  )
  primitive_root_modulo_4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, 3)) && order(4, x) == phi(4)"),
      t772,
    ),
  )
}

///|
let primitive_root_modulo_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_4",
)

///|
/// `PRIMITIVE_ROOT_MODULO_4`
pub fn primitive_root_modulo_4() -> @kernel.Thm {
  primitive_root_modulo_4_c.get()
}

///|
/// PRIMITIVE_ROOT_DOUBLE_LEMMA
fn step_20() -> Unit raise {
  let t777 = @meson.asm_meson_tac(@list.List([@pocklington.order_works()]))
  let t778 = @meson.asm_meson_tac(@list.List([@pocklington.order_works()]))
  let t779 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@pocklington.odd_mod_2()), @arith.odd_exp()]),
  )
  let t780 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @arith.odd(),
        @arith.le_1(),
        @pocklington.phi_lowerbound_1_strong(),
      ]),
    ),
    t779,
    t778,
    t777,
  ])
  let t776 = @tactics.repeat_tac(@tactics.conj_tac)
  let t775 = @simp.rewrite_tac(
    @list.List([@pocklington.phi_2(), @arith.mult_clauses()]),
  )
  let t774 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.cong_chinese_eq(),
      @prime.coprime_2(),
      @pocklington.phi_multiplicative(),
    ]),
  )
  let t773 = @tactics.match_mp_tac(@pocklington.order_unique())
  let t781 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t773),
          t774,
        ),
        t775,
      ),
      t776,
    ),
    t780,
  )
  primitive_root_double_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ODD(n) && ODD(a) && order(n, a) == phi(n) → order(2 * n, a) == phi(2 * n)"),
      t781,
    ),
  )
}

///|
let primitive_root_double_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_DOUBLE_LEMMA",
)

///|
/// `PRIMITIVE_ROOT_DOUBLE_LEMMA`
pub fn primitive_root_double_lemma() -> @kernel.Thm {
  primitive_root_double_lemma_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_DOUBLE_PRIMEPOW
fn step_21() -> Unit raise {
  let t809 = @tactics.conv_tac(@int.number_rule)
  let t808 = @tactics.match_mp_tac(@pocklington.order_cong())
  let t807 = @tactics.first_x_assum(fn(
    x806 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x803 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s804 = @tactics.subst1_tac(x803)
      fn(
        x805 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s804(x805)
      }
    })(@equal.sym(x806))
  })
  let t802 = @simp.asm_rewrite_tac(
    @list.List([@arith.odd_add(), @arith.odd_exp(), @arith.not_odd()]),
  )
  let t801 = @tactics.match_mp_tac(primitive_root_double_lemma())
  let t799 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(g : Num)")),
      @tactics.conj_tac,
    ),
    @list.List([@int.asm_arith_tac, @tactics.all_tac]),
  )
  let t797 = @simp.asm_rewrite_tac(@list.List([@arith.le_exp()]))
  let t796 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(g : Num) <= (x : Num) - 1 && EXP((p : Num), 1) <= x → g + p <= 2 * x - 1"),
    ),
  )
  let t798 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.conj_tac,
            @list.List([@int.asm_arith_tac, @tactics.all_tac]),
          ),
          t796,
        ),
        t797,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t800 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(g : Num) + EXP((p : Num), (k : Num))")),
        @tactics.conj_tac,
      ),
      t798,
    ),
    t799,
  ])
  let t795 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(g : Num)"), @arith.even_or_odd()),
  )
  let t794 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t793 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(g : Num)"))(fn(
      x790 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s791 = @tactics.mp_tac(x790)
      fn(
        x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s791(x792)
      }
    }),
  )
  let t787 = @drule.match_mp(primitive_root_modulo_primepow())
  let t789 = @tactics.first_assum(fn(
    x788 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(t787(x788))
  })
  let t783 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → !(p == 2)"))]),
  )
  let t782 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(p : Num)"), @prime.prime_odd()),
  )
  let t810 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.gen_tac),
                                @tactics.disch_tac,
                              ),
                              t782,
                            ),
                            t783,
                          ),
                          @tactics.disch_tac,
                        ),
                        t789,
                      ),
                      t793,
                    ),
                    t794,
                  ),
                  @tactics.strip_tac,
                ),
                t795,
              ),
              t800,
            ),
            t801,
          ),
          t802,
        ),
        t807,
      ),
      t808,
    ),
    t809,
  )
  primitive_root_modulo_double_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) && 3 <= p && 1 <= k → (∃ x : Num, IN(x, op_dot_dot(1, 2 * EXP(p, k) - 1)) && order(2 * EXP(p, k), x) == phi(2 * EXP(p, k)))"),
      t810,
    ),
  )
}

///|
let primitive_root_modulo_double_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_DOUBLE_PRIMEPOW",
)

///|
/// `PRIMITIVE_ROOT_MODULO_DOUBLE_PRIMEPOW`
pub fn primitive_root_modulo_double_primepow() -> @kernel.Thm {
  primitive_root_modulo_double_primepow_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_0
fn step_22() -> Unit raise {
  let t811 = @simp.rewrite_tac(
    @list.List([
      @pocklington.phi_0(),
      @pocklington.order_eq_0(),
      @prime.coprime_2(),
      @arith.odd(),
    ]),
  )
  let t812 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("2")),
    t811,
  )
  primitive_root_modulo_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∃ x : Num, order(0, x) == phi(0)"), t812),
  )
}

///|
let primitive_root_modulo_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_0",
)

///|
/// `PRIMITIVE_ROOT_MODULO_0`
pub fn primitive_root_modulo_0() -> @kernel.Thm {
  primitive_root_modulo_0_c.get()
}

///|
/// PRIMITIVE_ROOT_MODULO_1
fn step_23() -> Unit raise {
  let t815 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(0 < (m : Num) && m < 1) == false")),
      @arith.exp_1(),
      @pocklington.cong_refl(),
    ]),
  )
  let t814 = @tactics.match_mp_tac(@pocklington.order_unique())
  let t813 = @simp.rewrite_tac(@list.List([@pocklington.phi_1()]))
  let t816 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t813),
        t814,
      ),
      t815,
    ),
    @int.arith_tac,
  )
  primitive_root_modulo_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∃ x : Num, order(1, x) == phi(1)"), t816),
  )
}

///|
let primitive_root_modulo_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_MODULO_1",
)

///|
/// `PRIMITIVE_ROOT_MODULO_1`
pub fn primitive_root_modulo_1() -> @kernel.Thm {
  primitive_root_modulo_1_c.get()
}

///|
/// CONG_TO_1_POW2
fn step_24() -> Unit raise {
  let t842 = @simp.rewrite_tac(
    @list.List([
      @arith.even_mult(),
      @arith.even_add(),
      @arith.even_exp(),
      @calc_num.arith(),
    ]),
  )
  let t840 = @int.arith_rule(
    @term_syntax.parse_term("(EXP(1 + (m : Num) * (n : Num), 2) == 1 + (q : Num) * (2 * n)) == (n * (m * (2 + m * n)) == n * (2 * q))"),
  )
  let t841 = @simp.rewrite_tac(
    @list.List([
      @arith.eq_mult_lcancel(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
      @equal.gsym(@arith.even_exists()),
      t840,
    ]),
  )
  let t839 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
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
      let s837 = @tactics.subst1_tac(x836)
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
    }),
  )
  let t835 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t834 = @simp.rewrite_tac(
    @list.List([
      @pocklington.cong_to_1(),
      @arith.exp_eq_1(),
      @arith.add_eq_0(),
      @arith.mult_eq_1(),
    ]),
  )
  let t833 = @simp.asm_simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(
        @arith.exp_mult(),
      ),
      @arith.le_1(),
    ]),
  )
  let t830 = @term_syntax.parse_term("(x : Num)")
  let t843 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.strip_tac,
                  @tactics.first_x_assum(fn(
                    x832 : @kernel.Thm,
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
                      let s828 = @tactics.mp_tac(x827)
                      fn(
                        x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s828(x829)
                      }
                    })(((x831 : @kernel.Thm) => @bool.spec(t830, x831))(x832))
                  }),
                ),
                t833,
              ),
              t834,
            ),
            t835,
          ),
          t839,
        ),
        t841,
      ),
      t842,
    ),
    @int.arith_tac,
  )
  let t826 = @tactics.conv_tac(@class.taut)
  let t825 = @simp.rewrite_tac(
    @list.List([@arith.even_mult(), @arith.even_add(), @calc_num.arith()]),
  )
  let t823 = @int.arith_rule(
    @term_syntax.parse_term("(EXP(SUC(2 * (m : Num)), 2) == 1 + (q : Num) * 8) == (m * (m + 1) == 2 * q)"),
  )
  let t824 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.even_exists()), t823]),
  )
  let t822 = @simp.rewrite_tac(@list.List([@pocklington.cong_to_1()]))
  let t821 = @tactics.repeat_tac(@tactics.strip_tac)
  let t820 = @simp.simp_tac(
    @list.List([@arith.odd_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t819 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t844 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t819),
                  t820,
                ),
                t821,
              ),
              t822,
            ),
            @tactics.disj2_tac,
          ),
          t824,
        ),
        t825,
      ),
      t826,
    ),
    t843,
  ])
  let t818 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t817 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t845 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @nums.induct_tac,
            @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.exp()])),
          ),
          t817,
        ),
        @tactics.gen_tac,
      ),
      t818,
    ),
    t844,
  )
  cong_to_1_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ x : Num, ODD(x) && 1 <= k → op_eq_eq(EXP(x, EXP(2, k)), 1, mod(EXP(2, k + 2)))"),
      t845,
    ),
  )
}

///|
let cong_to_1_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_TO_1_POW2")

///|
/// `CONG_TO_1_POW2`
pub fn cong_to_1_pow2() -> @kernel.Thm {
  cong_to_1_pow2_c.get()
}

///|
/// NO_PRIMITIVE_ROOT_MODULO_POW2
fn step_25() -> Unit raise {
  let t882 = @simp.rewrite_tac(
    @list.List([@arith.exp_eq_0(), @calc_num.arith()]),
  )
  let t881 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((x : Num) + x * 2 < x * 4) == !(x == 0)")),
    ]),
  )
  let t880 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t879 = @simp.rewrite_tac(@list.List([@arith.exp_add()]))
  let t878 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) < (c : Num) → a < c - b")),
  )
  let t877 = @simp.rewrite_tac(
    @list.List([@arith.exp_eq_0(), @calc_num.arith()]),
  )
  let t876 = @simp.asm_simp_tac(
    @list.List([
      cong_to_1_pow2(),
      @int.arith_rule(@term_syntax.parse_term("(0 < (x : Num)) == !(x == 0)")),
    ]),
  )
  let t875 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (j : Num)"), fn(
    x872 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s873 = @tactics.assume_tac(x872)
    fn(
      x874 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s873(x874)
    }
  })
  let t871 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) == (j : Num) + 2"), fn(
    x868 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s869 = @tactics.subst1_tac(x868)
    fn(
      x870 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s869(x870)
    }
  })
  let t867 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) - 1 == (j : Num) + 1"), fn(
    x864 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s865 = @tactics.subst1_tac(x864)
    fn(
      x866 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s865(x866)
    }
  })
  let t863 = @simp.abbrev_tac(@term_syntax.parse_term("(j : Num) == (k : Num) - 2"))
  let t862 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.phi_primepow(),
      @prime.prime_2(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (k : Num) → !(k == 0)")),
    ]),
  )
  let t858 = @term_syntax.parse_term("EXP(2, (k : Num) - 2)")
  let t861 = @tactics.disch_then(fn(
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
    (fn(
      x855 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s856 = @tactics.mp_tac(x855)
      fn(
        x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s856(x857)
      }
    })(((x859 : @kernel.Thm) => @bool.spec(t858, x859))(x860))
  })
  let t854 = @simp.asm_rewrite_tac(@list.List([]))
  let t853 = @term_syntax.parse_term("(x : Num)")
  let t883 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.mp_tac(
                                      @bool.conjunct2(
                                        @bool.ispecl(
                                          @list.List([
                                            @term_syntax.parse_term("EXP(2, (k : Num))"),
                                            t853,
                                          ]),
                                          @pocklington.order_works(),
                                        ),
                                      ),
                                    ),
                                    t854,
                                  ),
                                  t861,
                                ),
                                t862,
                              ),
                              t863,
                            ),
                            t867,
                          ),
                          @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                        ),
                        t871,
                      ),
                      @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                    ),
                    t875,
                  ),
                  @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                ),
                t876,
              ),
              t877,
            ),
            t878,
          ),
          t879,
        ),
        t880,
      ),
      t881,
    ),
    t882,
  )
  let t852 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.order_eq_0(),
      @pocklington.phi_lowerbound_1_strong(),
      @arith.le_1(),
      @arith.exp_eq_0(),
      @calc_num.arith(),
      @prime.coprime_lexp(),
      @prime.coprime_2(),
      @class.de_morgan_thm(),
      @arith.not_odd(),
    ]),
  )
  let t850 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) == (b : Num) → 1 <= b && a == 0 → false")),
  )
  let t884 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
          x851 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x847 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s848 = @tactics.mp_tac(x847)
            fn(
              x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s848(x849)
            }
          })(t850(x851))
        }),
        t852,
      ),
      @int.asm_arith_tac,
    ),
    t883,
  ])
  let t846 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(x : Num)"), @arith.even_or_odd()),
  )
  let t885 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t846),
    t884,
  )
  no_primitive_root_modulo_pow2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, 3 <= k → !(∃ x : Num, order(EXP(2, k), x) == phi(EXP(2, k)))"),
      t885,
    ),
  )
}

///|
let no_primitive_root_modulo_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NO_PRIMITIVE_ROOT_MODULO_POW2",
)

///|
/// `NO_PRIMITIVE_ROOT_MODULO_POW2`
pub fn no_primitive_root_modulo_pow2() -> @kernel.Thm {
  no_primitive_root_modulo_pow2_c.get()
}

///|
/// NO_PRIMITIVE_ROOT_MODULO_COMPOSITE
fn step_26() -> Unit raise {
  let t928 = @tactics.conv_tac(@int.number_rule)
  let t927 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_eq_0(),
      @arith.le_1(),
      @pocklington.phi_lowerbound_1_strong(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → 1 <= p")),
    ]),
  )
  let t925 = @term_syntax.parse_term("(x : Num)")
  let t926 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(a : Num) * (b : Num)"), t925]),
      @pocklington.order_eq_0(),
    ),
  )
  let t924 = @tactics.match_mp_tac(@pocklington.fermat_little())
  let t923 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t922 = @tactics.subst1_tac(
    @equal.sym(@bool.spec(@term_syntax.parse_term("(m : Num)"), @arith.exp_one())),
  )
  let t921 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t920 = @tactics.disch_then(fn(
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
  })
  let t916 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t912 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("DIV(2 * (a : Num) * (b : Num), 2) == b * a")),
    ]),
  )
  let t910 = @simp.simp_tac(
    @list.List([@arith.even_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t911 = @list.List([
    @simp.asm_simp_tac(@list.List([@pocklington.even_phi()])),
    t910,
  ])
  let t913 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("EVEN(phi((a : Num)))"), fn(
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
        let s908 = @tactics.mp_tac(x907)
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
      }),
      t911,
    ),
    t912,
  )
  let t906 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("DIV((a : Num) * (2 * (b : Num)), 2) == a * b")),
    ]),
  )
  let t904 = @simp.simp_tac(
    @list.List([@arith.even_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t905 = @list.List([
    @simp.asm_simp_tac(@list.List([@pocklington.even_phi()])),
    t904,
  ])
  let t914 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("EVEN(phi((b : Num)))"), fn(
        x901 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s902 = @tactics.mp_tac(x901)
        fn(
          x903 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s902(x903)
        }
      }),
      t905,
    ),
    t906,
  )
  let t900 = @simp.asm_simp_tac(@list.List([@pocklington.phi_lowerbound_2()]))
  let t899 = @tactics.match_mp_tac(@arith.le_mult2())
  let t915 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @int.arith_rule(@term_syntax.parse_term("2 * 2 <= (x : Num) → 2 <= x")),
        ),
        t899,
      ),
      t900,
    ),
    t914,
    t913,
  ])
  let t898 = @tactics.repeat_tac(@tactics.conj_tac)
  let t897 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(0 < DIV((a : Num), 2) && DIV(a, 2) < a) == (2 <= a)"),
      ),
      @class.not_imp(),
    ]),
  )
  let t893 = @term_syntax.parse_term("DIV(phi((a : Num)) * phi((b : Num)), 2)")
  let t896 = @tactics.first_x_assum(fn(
    x895 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s891 = @tactics.mp_tac(x890)
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
    })(((x894 : @kernel.Thm) => @bool.spec(t893, x894))(x895))
  })
  let t889 = @simp.asm_simp_tac(@list.List([@pocklington.cong_chinese_eq()]))
  let t887 = @term_syntax.parse_term("(x : Num)")
  let t888 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num) * (b : Num)"), t887]),
      @pocklington.order_works(),
    ),
  )
  let t886 = @tactics.repeat_tac(@tactics.strip_tac)
  let t929 = @tactics.then_tac(
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
                                    @simp.simp_tac(
                                      @list.List([
                                        @pocklington.phi_multiplicative(),
                                      ]),
                                    ),
                                    t886,
                                  ),
                                  t888,
                                ),
                                t889,
                              ),
                              @tactics.strip_tac,
                            ),
                            t896,
                          ),
                          t897,
                        ),
                        t898,
                      ),
                      t915,
                    ),
                    t916,
                  ),
                  t920,
                ),
                t921,
              ),
              t922,
            ),
            t923,
          ),
          t924,
        ),
        t926,
      ),
      t927,
    ),
    t928,
  )
  no_primitive_root_modulo_composite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, 3 <= a && 3 <= b && coprime((a, b)) → !(∃ x : Num, order(a * b, x) == phi(a * b))"),
      t929,
    ),
  )
}

///|
let no_primitive_root_modulo_composite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NO_PRIMITIVE_ROOT_MODULO_COMPOSITE",
)

///|
/// `NO_PRIMITIVE_ROOT_MODULO_COMPOSITE`
pub fn no_primitive_root_modulo_composite() -> @kernel.Thm {
  no_primitive_root_modulo_composite_c.get()
}

///|
/// PRIMITIVE_ROOT_EXISTS
fn step_27() -> Unit raise {
  let t1096 = @simp.asm_rewrite_tac(@list.List([@arith.exp_1()]))
  let t1095 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_exp(), @calc_num.arith(), @class.cond_id()]),
  )
  let t1094 = @tactics.exists_tac(@term_syntax.parse_term("EXP((q : Num), 1)"))
  let t1093 = @tactics.match_mp_tac(@arith.le_trans())
  let t1092 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(3 <= (r : Num) * 2) == !(r == 0 || r == 1)")),
    ]),
  )
  let t1091 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1090 = @simp.rewrite_tac(
    @list.List([@arith.mult_ac(), @class.not_exists_thm()]),
  )
  let t1089 = @simp.asm_rewrite_tac(@list.List([]))
  let t1088 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1087 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_2()]))
  let t1086 = @simp.rewrite_tac(
    @list.List([@prime.coprime_lmul(), @prime.coprime_rexp()]),
  )
  let t1084 = @term_syntax.parse_term("EXP((q : Num), (j : Num))")
  let t1085 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("2 * (r : Num)"), t1084]),
      no_primitive_root_modulo_composite(),
    ),
  )
  let t1083 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1082 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 1"))
  let t1077 = @term_syntax.parse_term("(j : Num)")
  let t1078 = @list.List([@term_syntax.parse_term("(q : Num)"), t1077])
  let t1081 = @tactics.first_x_assum(fn(
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
    (fn(
      x1074 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1075 = @tactics.mp_tac(x1074)
      fn(
        x1076 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1075(x1076)
      }
    })(((x1079 : @kernel.Thm) => @bool.specl(t1078, x1079))(x1080))
  })
  let t1072 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t1071 = @tactics.undisch_tac(@term_syntax.parse_term("ODD((q : Num))"))
  let t1070 = @simp.asm_simp_tac(@list.List([@prime.prime_ge_2()]))
  let t1073 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @int.arith_rule(
                @term_syntax.parse_term("!((p : Num) == 2) && 2 <= p → 3 <= p"),
              ),
            ),
            t1070,
          ),
          @tactics.disch_tac,
        ),
        t1071,
      ),
      t1072,
    ),
    @tactics.all_tac,
  ])
  let t1069 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (q : Num)"), fn(
    x1066 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1067 = @tactics.assume_tac(x1066)
    fn(
      x1068 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1067(x1068)
    }
  })
  let t1065 = @simp.rewrite_tac(@list.List([@prime.coprime_2()]))
  let t1064 = @simp.asm_simp_tac(
    @list.List([@prime.coprime_rmul(), @prime.coprime_rexp(), @arith.le_1()]),
  )
  let t1063 = @tactics.undisch_tac(@term_syntax.parse_term("coprime((2, (m : Num)))"))
  let t1062 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1061 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t1058 = @term_syntax.parse_term("(r : Num)")
  let t1059 = @term_syntax.parse_term("(j : Num)")
  let t1060 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(q : Num)"), t1059, t1058]),
  )
  let t1057 = @list.List([
    @int.asm_arith_tac,
    @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
  ])
  let t1056 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(m : Num)"), @prime.primepow_factor()),
  )
  let t1055 = @simp.rewrite_tac(@list.List([@arith.exp_1()]))
  let t1054 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.exp_1()])),
  )
  let t1049 = @drule.match_mp(@prime.prime_ge_2())
  let t1051 = @tactics.first_assum(fn(
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
    (fn(
      x1046 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1047 = @tactics.mp_tac(x1046)
      fn(
        x1048 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1047(x1048)
      }
    })(t1049(x1050))
  })
  let t1045 = @simp.rewrite_tac(@list.List([@arith.exp_1()]))
  let t1044 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t1043 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1042 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1041 = @term_syntax.parse_term("(m : Num)")
  let t1052 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("EXP((p : Num), 1)"), t1041]),
                  no_primitive_root_modulo_composite(),
                ),
              ),
              t1042,
            ),
            t1043,
          ),
          t1044,
        ),
        t1045,
      ),
      t1051,
    ),
    @int.asm_arith_tac,
  )
  let t1053 = @list.List([
    @tactics.undisch_then(@term_syntax.parse_term("(p : Num) == 2"), fn(
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
      let s1039 = @tactics.subst_all_tac(x1038)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
    t1052,
  ])
  let t1037 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t1034 = @simp.asm_simp_tac(
    @list.List([@prime.prime_ge_2(), @prime.prime_imp_nz()]),
  )
  let t1033 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_mono_le(), @arith.le_exp()]),
  )
  let t1032 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), 2)"))
  let t1031 = @tactics.match_mp_tac(@arith.le_trans())
  let t1030 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("EXP(2, 2) <= (x : Num) → 3 <= x")),
  )
  let t1029 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t1028 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1027 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1026 = @term_syntax.parse_term("(m : Num)")
  let t1035 = @tactics.then_tac(
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
                        @tactics.mp_tac(
                          @bool.specl(
                            @list.List([@term_syntax.parse_term("EXP((p : Num), (k : Num))"), t1026]),
                            no_primitive_root_modulo_composite(),
                          ),
                        ),
                        t1027,
                      ),
                      t1028,
                    ),
                    t1029,
                  ),
                  @tactics.conj_tac,
                ),
                @list.List([@tactics.all_tac, @int.asm_arith_tac]),
              ),
              t1030,
            ),
            t1031,
          ),
          t1032,
        ),
        t1033,
      ),
      t1034,
    ),
    @int.asm_arith_tac,
  )
  let t1036 = @list.List([
    @tactics.undisch_then(@term_syntax.parse_term("(k : Num) == 1"), fn(
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
      let s1024 = @tactics.subst_all_tac(x1023)
      fn(
        x1025 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1024(x1025)
      }
    }),
    t1035,
  ])
  let t1022 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1"))
  let t1021 = @simp.asm_rewrite_tac(@list.List([]))
  let t1019 = @meson.asm_meson_tac(@list.List([@arith.mult_sym()]))
  let t1018 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (p : Num)"), fn(
    x1015 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1016 = @tactics.assume_tac(x1015)
    fn(
      x1017 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1016(x1017)
    }
  })
  let t1012 = @drule.match_mp(@prime.prime_ge_2())
  let t1014 = @tactics.first_assum(fn(
    x1013 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1009 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1010 = @tactics.assume_tac(x1009)
      fn(
        x1011 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1010(x1011)
      }
    })(t1012(x1013))
  })
  let t1008 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t1007 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t1020 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.asm_rewrite_tac(@list.List([@prime.coprime_2()])),
                  t1007,
                ),
                t1008,
              ),
              @tactics.strip_tac,
            ),
            t1014,
          ),
          t1018,
        ),
        @list.List([@int.asm_arith_tac, @tactics.all_tac]),
      ),
      t1019,
    ),
    @tactics.all_tac,
  ])
  let t1006 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 2"))
  let t1004 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1003 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
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
      let s1001 = @tactics.mp_tac(x1000)
      fn(
        x1002 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1001(x1002)
      }
    }),
  )
  let t999 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x996 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s997 = @tactics.subst_all_tac(x996)
      fn(
        x998 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s997(x998)
      }
    }),
  )
  let t995 = @simp.asm_rewrite_tac(@list.List([]))
  let t992 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("!(3 <= (k : Num)) → 1 <= k → k == 1 || k == 2"),
    ),
  )
  let t994 = @tactics.first_x_assum(fn(
    x993 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x989 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s990 = @tactics.mp_tac(x989)
      fn(
        x991 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s990(x991)
      }
    })(t992(x993))
  })
  let t988 = @list.List([
    @meson.asm_meson_tac(@list.List([no_primitive_root_modulo_pow2()])),
    @tactics.all_tac,
  ])
  let t987 = @class.asm_cases_tac(@term_syntax.parse_term("3 <= (k : Num)"))
  let t986 = @tactics.disch_then(fn(
    x983 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s984 = @tactics.subst_all_tac(x983)
    fn(
      x985 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s984(x985)
    }
  })
  let t982 = @simp.asm_simp_tac(
    @list.List([
      @prime.prime_ge_2(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(3 <= p) == (p == 2)")),
    ]),
  )
  let t977 = @term_syntax.parse_term("(k : Num)")
  let t978 = @list.List([@term_syntax.parse_term("(p : Num)"), t977])
  let t981 = @tactics.first_x_assum(fn(
    x980 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x974 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s975 = @tactics.mp_tac(x974)
      fn(
        x976 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s975(x976)
      }
    })(((x979 : @kernel.Thm) => @bool.specl(t978, x979))(x980))
  })
  let t973 = @tactics.disch_then(fn(
    x970 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s971 = @tactics.subst_all_tac(x970)
    fn(
      x972 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s971(x972)
    }
  })
  let t969 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
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
        fn(
          x966 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s967 = @tactics.mp_tac(x966)
          fn(
            x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s967(x968)
          }
        },
      ),
    ),
  )
  let t1005 = @list.List([
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
                            @simp.asm_rewrite_tac(
                              @list.List([@arith.mult_clauses()]),
                            ),
                            t969,
                          ),
                          t973,
                        ),
                        t981,
                      ),
                      t982,
                    ),
                    t986,
                  ),
                  t987,
                ),
                t988,
              ),
              t994,
            ),
            t995,
          ),
          t999,
        ),
        t1003,
      ),
      t1004,
    ),
    @tactics.all_tac,
  ])
  let t962 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t961 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t960 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t957 = @term_syntax.parse_term("(m : Num)")
  let t958 = @term_syntax.parse_term("(k : Num)")
  let t959 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t958, t957]),
  )
  let t956 = @list.List([
    @int.asm_arith_tac,
    @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
  ])
  let t955 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(n : Num)"), @prime.primepow_factor()),
  )
  let t954 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t953 = @simp.rewrite_tac(
    @list.List([
      @class.not_exists_thm(),
      @class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool) && (c : Bool)) == (a && b → !c)")),
    ]),
  )
  let t952 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t950 = @meson.asm_meson_tac(
    @list.List([
      @arith.le_1(),
      primitive_root_modulo_primepow(),
      primitive_root_modulo_double_primepow(),
    ]),
  )
  let t949 = @simp.asm_rewrite_tac(@list.List([]))
  let t948 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @arith.mult_clauses()]),
  )
  let t947 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t945 = @term_syntax.parse_term("(k : Num)")
  let t946 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t945]),
  )
  let t951 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
                t946,
              ),
              t947,
            ),
            t948,
          ),
          @tactics.strip_tac,
        ),
        t949,
      ),
      t950,
    ),
  ])
  let t943 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t942 = @tactics.conv_tac(@equal.once_depth_conv(@pocklington.prime_conv))
  let t940 = @term_syntax.parse_term("0")
  let t941 = @tactics.map_every(
    fn(
      x937 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s938 = @tactics.exists_tac(x937)
      fn(
        x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s938(x939)
      }
    },
    @list.List([@term_syntax.parse_term("3"), t940]),
  )
  let t944 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([primitive_root_modulo_1()])),
          t941,
        ),
        t942,
      ),
      t943,
    ),
    @tactics.all_tac,
  ])
  let t936 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t935 = @simp.asm_rewrite_tac(@list.List([]))
  let t934 = @list.List([
    @meson.asm_meson_tac(@list.List([primitive_root_modulo_4()])),
    @tactics.all_tac,
  ])
  let t933 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 4"))
  let t932 = @list.List([
    @meson.asm_meson_tac(@list.List([primitive_root_modulo_2()])),
    @tactics.all_tac,
  ])
  let t931 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t930 = @simp.asm_rewrite_tac(@list.List([primitive_root_modulo_0()]))
  let t1097 = @tactics.then_tac(
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
                                                  @tactics.then_tac(
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
                                                                        @tactics.then_tac(
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
                                                                                                @tactics.then_tac(
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
                                                                                                                      @tactics.thenl(
                                                                                                                        @tactics.then_tac(
                                                                                                                          @tactics.then_tac(
                                                                                                                            @tactics.then_tac(
                                                                                                                              @tactics.gen_tac,
                                                                                                                              @class.asm_cases_tac(
                                                                                                                                @term_syntax.parse_term("(n : Num) == 0"),
                                                                                                                              ),
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
                                                                                                                t936,
                                                                                                              ),
                                                                                                              t944,
                                                                                                            ),
                                                                                                            @tactics.eq_tac,
                                                                                                          ),
                                                                                                          t951,
                                                                                                        ),
                                                                                                        t952,
                                                                                                      ),
                                                                                                      t953,
                                                                                                    ),
                                                                                                    t954,
                                                                                                  ),
                                                                                                  @tactics.strip_tac,
                                                                                                ),
                                                                                                t955,
                                                                                              ),
                                                                                              @tactics.ants_tac,
                                                                                            ),
                                                                                            t956,
                                                                                          ),
                                                                                          t959,
                                                                                        ),
                                                                                        t960,
                                                                                      ),
                                                                                      t961,
                                                                                    ),
                                                                                    t962,
                                                                                  ),
                                                                                  t1005,
                                                                                ),
                                                                                t1006,
                                                                              ),
                                                                              t1020,
                                                                            ),
                                                                            @tactics.strip_tac,
                                                                          ),
                                                                          t1021,
                                                                        ),
                                                                        t1022,
                                                                      ),
                                                                      t1036,
                                                                    ),
                                                                    t1037,
                                                                  ),
                                                                  t1053,
                                                                ),
                                                                t1054,
                                                              ),
                                                              t1055,
                                                            ),
                                                            t1056,
                                                          ),
                                                          @tactics.ants_tac,
                                                        ),
                                                        t1057,
                                                      ),
                                                      t1060,
                                                    ),
                                                    t1061,
                                                  ),
                                                  t1062,
                                                ),
                                                @tactics.strip_tac,
                                              ),
                                              t1063,
                                            ),
                                            t1064,
                                          ),
                                          t1065,
                                        ),
                                        @tactics.strip_tac,
                                      ),
                                      t1069,
                                    ),
                                    t1073,
                                  ),
                                  t1081,
                                ),
                                t1082,
                              ),
                              t1083,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1085,
                        ),
                        t1086,
                      ),
                      t1087,
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
    ),
    t1096,
  )
  primitive_root_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (∃ x : Num, order(n, x) == phi(n)) == (n == 0 || n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && (n == EXP(p, k) || n == 2 * EXP(p, k))))"),
      t1097,
    ),
  )
}

///|
let primitive_root_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_EXISTS",
)

///|
/// `PRIMITIVE_ROOT_EXISTS`
pub fn primitive_root_exists() -> @kernel.Thm {
  primitive_root_exists_c.get()
}

///|
/// PRIMITIVE_ROOT_EXISTS_NONTRIVIAL
fn step_28() -> Unit raise {
  let t1147 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t1146 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1145 = @tactics.conv_tac(
    @equal.binop_conv(@equal.once_depth_conv(@equal.sym_conv)),
  )
  let t1144 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1143 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1142 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1141 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1140 = @simp.asm_rewrite_tac(@list.List([]))
  let t1139 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 4"))
  let t1138 = @simp.asm_rewrite_tac(@list.List([]))
  let t1137 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t1148 = @tactics.then_tac(
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
                                @simp.asm_rewrite_tac(
                                  @list.List([primitive_root_exists()]),
                                ),
                                t1137,
                              ),
                              t1138,
                            ),
                            t1139,
                          ),
                          t1140,
                        ),
                        @tactics.ap_term_tac,
                      ),
                      t1141,
                    ),
                    t1142,
                  ),
                  @tactics.ap_term_tac,
                ),
                t1143,
              ),
              t1144,
            ),
            t1145,
          ),
          t1146,
        ),
        t1147,
      ),
      @tactics.ap_term_tac,
    ),
    @int.asm_arith_tac,
  )
  let t1134 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mod()]))
  let t1133 = @tactics.match_mp_tac(@pocklington.order_cong())
  let t1135 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x1132 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1129 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1130 = @tactics.subst1_tac(x1129)
          fn(
            x1131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1130(x1131)
          }
        })(@equal.sym(x1132))
      }),
      t1133,
    ),
    t1134,
  )
  let t1128 = @simp.asm_rewrite_tac(@list.List([@prime.divides_refl()]))
  let t1124 = @term_syntax.parse_term("(n : Num)")
  let t1127 = @tactics.disch_then(fn(
    x1126 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1121 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1122 = @tactics.mp_tac(x1121)
      fn(
        x1123 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1122(x1123)
      }
    })(((x1125 : @kernel.Thm) => @bool.spec(t1124, x1125))(x1126))
  })
  let t1120 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1119 = @simp.asm_simp_tac(
    @list.List([@arith.le_1(), @pocklington.phi_lowerbound_1_strong()]),
  )
  let t1117 = @term_syntax.parse_term("(x : Num)")
  let t1118 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1117]),
      @pocklington.order_eq_0(),
    ),
  )
  let t1116 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.divides_mod())]))
  let t1136 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
                    ]),
                  ),
                  t1116,
                ),
                @tactics.disch_tac,
              ),
              t1118,
            ),
            t1119,
          ),
          t1120,
        ),
        t1127,
      ),
      t1128,
    ),
    t1135,
  ])
  let t1115 = @simp.asm_simp_tac(
    @list.List([
      @iterate.in_numseg(),
      @arith.division(),
      @int.arith_rule(
        @term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → ((x : Num) <= n - 1) == (x < n)"),
      ),
    ]),
  )
  let t1114 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (n : Num))"))
  let t1111 = @term_syntax.parse_term("(x : Num)")
  let t1113 = @tactics.disch_then((x1112 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1111, x1112)
  })
  let t1149 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.eq_tac,
                @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac]),
              ),
              t1113,
            ),
            t1114,
          ),
          t1115,
        ),
        @tactics.conj_tac,
      ),
      t1136,
    ),
    t1148,
  ])
  let t1110 = @tactics.exists_tac(@term_syntax.parse_term("∃ x : Num, order((n : Num), x) == phi(n)"))
  let t1109 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1107 = @simp.rewrite_tac(
    @list.List([@arith.mult_eq_1(), @arith.exp_eq_1()]),
  )
  let t1106 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t1105 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(a : Bool) && !(b : Bool) → a == b")),
  )
  let t1104 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1108 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg()])),
              t1104,
            ),
            t1105,
          ),
          t1106,
        ),
        t1107,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1103 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1101 = @simp.rewrite_tac(
    @list.List([@arith.mult_eq_0(), @arith.exp_eq_0()]),
  )
  let t1100 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t1099 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(a : Bool) && !(b : Bool) → a == b")),
  )
  let t1098 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1102 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg()])),
              t1098,
            ),
            t1099,
          ),
          t1100,
        ),
        t1101,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t1150 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
                ),
                t1102,
              ),
              t1103,
            ),
            t1108,
          ),
          t1109,
        ),
        t1110,
      ),
      @tactics.conj_tac,
    ),
    t1149,
  )
  primitive_root_exists_nontrivial_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (∃ x : Num, IN(x, op_dot_dot(1, n - 1)) && order(n, x) == phi(n)) == (n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && 1 <= k && (n == EXP(p, k) || n == 2 * EXP(p, k))))"),
      t1150,
    ),
  )
}

///|
let primitive_root_exists_nontrivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMITIVE_ROOT_EXISTS_NONTRIVIAL",
)

///|
/// `PRIMITIVE_ROOT_EXISTS_NONTRIVIAL`
pub fn primitive_root_exists_nontrivial() -> @kernel.Thm {
  primitive_root_exists_nontrivial_c.get()
}

///|
/// COUNT_PRIMITIVE_ROOTS_ALT
fn step_29() -> Unit raise {
  let t1222 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.phi_eq_0(), @prime.coprime_gcd()]),
  )
  let t1219 = @drule.match_mp(
    @grobner.num_ring(@term_syntax.parse_term("(d : Num) * (p : Num) == p → d == 1 || p == 0")),
  )
  let t1221 = @tactics.first_assum(fn(
    x1220 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1216 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1217 = @tactics.mp_tac(x1216)
      fn(
        x1218 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1217(x1218)
      }
    })(t1219(x1220))
  })
  let t1215 = @tactics.disch_then(fn(
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
    let s1213 = @tactics.subst_all_tac(x1212)
    fn(
      x1214 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1213(x1214)
    }
  })
  let t1211 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t1210 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@arith.mult_clauses(), @pocklington.phi_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1209 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1208 = @tactics.disch_then(fn(
    x1205 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1205
    let t1207 = @tactics.assume_tac(@equal.sym(th))
    @tactics.then_tac(@tactics.subst1_tac(th), t1207)
  })
  let t1204 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Num) == gcd((phi((n : Num)), (a : Num)))"))
  let t1203 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Num)"))
  let t1202 = @simp.rewrite_tac(
    @list.List([@int.divides(), @theorems.left_imp_exists_thm()]),
  )
  let t1201 = @tactics.mp_tac(
    @int.number_rule(@term_syntax.parse_term("divides(gcd((phi((n : Num)), (a : Num))), phi(n))")),
  )
  let t1200 = @simp.simp_tac(@list.List([@prime.gcd_one(), @arith.div_1()]))
  let t1199 = @simp.gen_rewrite_tac(
    fn(
      x1196 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1197 = @equal.rand_conv(x1196)
      fn(x1198 : @kernel.Term) -> @kernel.Thm raise { s1197(x1198) }
    },
    @list.List([@prime.coprime_sym()]),
  )
  let t1195 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_0()])),
    @tactics.all_tac,
  ])
  let t1194 = @simp.asm_rewrite_tac(@list.List([@pocklington.order_exp_gen()]))
  let t1193 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) < phi((n : Num))"))
  let t1192 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1191 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Num)"))
  let t1190 = @simp.gen_rewrite_tac(
    fn(
      x1189 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1189
    },
    @list.List([@sets.extension()]),
  )
  let t1187 = @sets.set_tac(@list.List([]))
  let t1186 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t1185 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Num) | a < phi((n : Num))}"))
  let t1184 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1188 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.has_size(), @equal.gsym(@pocklington.phi_alt())]),
            ),
            t1184,
          ),
          t1185,
        ),
        t1186,
      ),
      t1187,
    ),
  ])
  let t1183 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(a : Num) | a < phi((n : Num)) && order(n, EXP((g : Num), a)) == phi(n)} == {(a : Num) | coprime((a, phi(n))) && a < phi(n)}"),
    fn(
      x1180 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1181 = @tactics.subst1_tac(x1180)
      fn(
        x1182 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1181(x1182)
      }
    },
  )
  let t1175 = @simp.rewrite_tac(@list.List([@pocklington.order_mod()]))
  let t1174 = @simp.rewrite_tac(@list.List([@pocklington.cong_imp_eq()]))
  let t1173 = @simp.asm_simp_tac(
    @list.List([@pocklington.order_divides_expdiff()]),
  )
  let t1176 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())])),
      t1173,
    ),
    t1174,
  )
  let t1172 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_rexp(), @int.coprime_rmod()]),
  )
  let t1177 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([
        @sets.subset(),
        @sets.forall_in_image(),
        @sets.in_elim_thm(),
        @arith.mod_lt_eq(),
      ]),
    ),
    t1172,
  )
  let t1171 = @sets.set_tac(@list.List([]))
  let t1170 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t1178 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
        t1170,
      ),
      @tactics.ap_term_tac,
    ),
    t1171,
  )
  let t1169 = @simp.simp_tac(
    @list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]),
  )
  let t1179 = @list.List([
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"),
          ),
        ]),
      ),
      t1169,
    ),
    t1178,
    t1177,
    t1176,
    t1175,
  ])
  let t1168 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1167 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.finite_numseg_lt(),
      @sets.card_numseg_lt(),
    ]),
  )
  let t1166 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | i < phi((n : Num))}"))
  let t1165 = @tactics.match_mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(i : Num) => MOD(EXP((g : Num), i), (n : Num))"),
      @sets.has_size_image_inj_restrict(),
    ),
  )
  let t1164 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y) && Q(y)}) && R(x)}"),
      ),
    ]),
  )
  let t1163 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@pocklington.order_eq_0(), @pocklington.phi_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1162 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((n : Num), (g : Num)))"), fn(
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
    let s1160 = @tactics.assume_tac(x1159)
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
  })
  let t1156 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.empty_gspec(),
      @sets.has_size(),
      @sets.card_clauses(),
      @sets.finite_empty(),
    ]),
  )
  let t1157 = @tactics.then_tac(
    @tactics.rule_assum_tac(
      @simp.rewrite_rule(@list.List([@class.not_exists_thm()])),
    ),
    t1156,
  )
  let t1154 = @term_syntax.parse_term("(g : Num)")
  let t1158 = @list.List([
    @tactics.first_x_assum((x1155 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1154, x1155)
    }),
    t1157,
  ])
  let t1152 = @simp.rewrite_tac(
    @list.List([@equal.gsym(primitive_root_exists())]),
  )
  let t1151 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), @sets.card_clauses(), @sets.finite_empty()]),
  )
  let t1153 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([
          @arith.lt(),
          @pocklington.phi_0(),
          @class.cond_id(),
          @sets.empty_gspec(),
        ]),
      ),
      t1151,
    ),
    t1152,
  ])
  let t1223 = @tactics.then_tac(
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
                              @tactics.thenl(
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
                                                            @tactics.thenl(
                                                              @tactics.then_tac(
                                                                @tactics.thenl(
                                                                  @tactics.then_tac(
                                                                    @tactics.thenl(
                                                                      @tactics.then_tac(
                                                                        @tactics.gen_tac,
                                                                        @class.asm_cases_tac(
                                                                          @term_syntax.parse_term("(n : Num) == 0"),
                                                                        ),
                                                                      ),
                                                                      t1153,
                                                                    ),
                                                                    @class.cond_cases_tac,
                                                                  ),
                                                                  t1158,
                                                                ),
                                                                t1162,
                                                              ),
                                                              t1163,
                                                            ),
                                                            t1164,
                                                          ),
                                                          t1165,
                                                        ),
                                                        t1166,
                                                      ),
                                                      t1167,
                                                    ),
                                                    t1168,
                                                  ),
                                                  t1179,
                                                ),
                                                t1183,
                                              ),
                                              t1188,
                                            ),
                                            t1190,
                                          ),
                                          t1191,
                                        ),
                                        t1192,
                                      ),
                                      t1193,
                                    ),
                                    t1194,
                                  ),
                                  @class.cond_cases_tac,
                                ),
                                t1195,
                              ),
                              t1199,
                            ),
                            @tactics.eq_tac,
                          ),
                          t1200,
                        ),
                        t1201,
                      ),
                      t1202,
                    ),
                    t1203,
                  ),
                  t1204,
                ),
                t1208,
              ),
              t1209,
            ),
            t1210,
          ),
          t1211,
        ),
        t1215,
      ),
      t1221,
    ),
    t1222,
  )
  count_primitive_roots_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, HAS_SIZE({(a : Num) | a < n && coprime((n, a)) && order(n, a) == phi(n)}, if n == 0 || n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && (n == EXP(p, k) || n == 2 * EXP(p, k))) { phi(phi(n)) } else { 0 })"),
      t1223,
    ),
  )
}

///|
let count_primitive_roots_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_PRIMITIVE_ROOTS_ALT",
)

///|
/// `COUNT_PRIMITIVE_ROOTS_ALT`
pub fn count_primitive_roots_alt() -> @kernel.Thm {
  count_primitive_roots_alt_c.get()
}

///|
/// COUNT_PRIMITIVE_ROOTS
fn step_30() -> Unit raise {
  let t1226 = @meson.meson_tac(
    @list.List([@pocklington.order_eq_0(), @pocklington.phi_eq_0(), @arith.lt()]),
  )
  let t1225 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1224 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1227 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @tactics.mp_tac(
                @bool.spec(
                  @term_syntax.parse_term("(n : Num)"),
                  count_primitive_roots_alt(),
                ),
              ),
            ),
            t1224,
          ),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t1225,
    ),
    t1226,
  )
  count_primitive_roots_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, HAS_SIZE({(x : Num) | x < n && order(n, x) == phi(n)}, if n == 0 || n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && (n == EXP(p, k) || n == 2 * EXP(p, k))) { phi(phi(n)) } else { 0 })"),
      t1227,
    ),
  )
}

///|
let count_primitive_roots_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_PRIMITIVE_ROOTS",
)

///|
/// `COUNT_PRIMITIVE_ROOTS`
pub fn count_primitive_roots() -> @kernel.Thm {
  count_primitive_roots_c.get()
}

///|
/// COUNT_ROOTS_MODULO_PRIMITIVE_GEN_ALT
fn step_31() -> Unit raise {
  let t1344 = @meson.asm_meson_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("gcd(((k : Num), (n : Num))) == (d : Num) && d * (p : Num) == n → gcd((n, k)) == d"),
      ),
    ]),
  )
  let t1343 = @simp.asm_simp_tac(@list.List([@prime.divides_rmul2_eq()]))
  let t1342 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@arith.mult_clauses(), @pocklington.phi_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1341 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1340 = @tactics.subst1_tac(
    @equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(d : Num) * (p : Num) == phi((n : Num))"))),
  )
  let t1339 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1338 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t1337 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@prime.gcd_zero(), @pocklington.phi_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1336 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1335 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
      x1332 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_2 = x1332
      let t1334 = @tactics.subst1_tac(th_2)
      @tactics.then_tac(@tactics.assume_tac(@equal.sym(th_2)), t1334)
    }),
  )
  let t1331 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Num) == gcd(((k : Num), phi((n : Num))))"))
  let t1330 = @simp.gen_rewrite_tac(
    fn(
      x1327 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1328 = @equal.land_conv(x1327)
      fn(x1329 : @kernel.Term) -> @kernel.Thm raise { s1328(x1329) }
    },
    @list.List([@int.divides()]),
  )
  let t1326 = @tactics.mp_tac(
    @int.number_rule(@term_syntax.parse_term("divides(gcd(((k : Num), phi((n : Num)))), phi(n))")),
  )
  let t1325 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.phi_eq_0(), @pocklington.order_divides()]),
  )
  let t1324 = @simp.rewrite_tac(
    @list.List([
      @sets.has_size(),
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        @pocklington.count_cong_solve(),
      ),
    ]),
  )
  let t1323 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1321 = @meson.asm_meson_tac(@list.List([@arith.mod_exp_mod()]))
  let t1320 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@int.cong_v1()])),
  )
  let t1319 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.exp_exp()), @int.cong_v1()]),
  )
  let t1322 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")),
          t1319,
        ),
        t1320,
      ),
      t1321,
    ),
    @tactics.all_tac,
  ])
  let t1318 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, op_eq_eq(EXP((a : Num), i), 1, mod((n : Num))) == op_eq_eq(EXP((g : Num), (r : Num) * i), 1, mod(n))"),
    fn(
      x1316 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x1316
      @simp.rewrite_tac(@list.List([th_1]))
    },
  )
  let t1314 = @simp.asm_simp_tac(
    @list.List([@pocklington.order_divides_expdiff()]),
  )
  let t1315 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        @pocklington.cong_sym(),
        @pocklington.cong_refl(),
        @pocklington.cong_trans(),
      ]),
    ),
    t1314,
  ])
  let t1313 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : Num, op_eq_eq(EXP((g : Num), d * (k : Num)), (a : Num), mod((n : Num))) == op_eq_eq(EXP(g, d * k), EXP(g, (r : Num)), mod(n))"),
    fn(
      x1311 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1311
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t1305 = @simp.asm_rewrite_tac(
    @list.List([@arith.mod_lt_eq(), @int.coprime_rmod(), @int.cong_v1()]),
  )
  let t1302 = @term_syntax.parse_term("MOD((a : Num), (n : Num))")
  let t1306 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x1304 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1299 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1300 = @tactics.mp_tac(x1299)
        fn(
          x1301 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1300(x1301)
        }
      })(((x1303 : @kernel.Thm) => @bool.spec(t1302, x1303))(x1304))
    }),
    t1305,
  )
  let t1298 = @simp.rewrite_tac(@list.List([@pocklington.cong_imp_eq()]))
  let t1297 = @simp.asm_simp_tac(
    @list.List([@pocklington.order_divides_expdiff()]),
  )
  let t1307 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())])),
        t1297,
      ),
      t1298,
    ),
    t1306,
  ])
  let t1308 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x1296 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1295 : (@kernel.Thm, @kernel.Thm),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            let s1292 = @tactics.mp_tac(x1291)
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
          })(
            (fn(x1294 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
              x1294.1
            })(x1295),
          )
        })(@bool.eq_imp_rule(x1296))
      }),
      @tactics.ants_tac,
    ),
    t1307,
  )
  let t1287 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_rexp(), @int.coprime_rmod()]),
  )
  let t1288 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([
        @sets.subset(),
        @sets.forall_in_image(),
        @sets.in_elim_thm(),
        @arith.mod_lt_eq(),
      ]),
    ),
    t1287,
  )
  let t1286 = @sets.set_tac(@list.List([]))
  let t1285 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t1289 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
        t1285,
      ),
      @tactics.ap_term_tac,
    ),
    t1286,
  )
  let t1284 = @simp.simp_tac(
    @list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]),
  )
  let t1290 = @list.List([
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"),
          ),
        ]),
      ),
      t1284,
    ),
    t1289,
    t1288,
  ])
  let t1309 = @list.List([
    @tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1290),
    t1308,
  ])
  let t1283 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.finite_numseg_lt(),
      @sets.card_numseg_lt(),
    ]),
  )
  let t1281 = @term_syntax.parse_term("(i : Num) => MOD(EXP((g : Num), i), (n : Num))")
  let t1282 = @term_syntax.parse_term("{(x : Num) | x < (n : Num) && coprime((n, x))}")
  let t1310 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([@term_syntax.parse_term("{(i : Num) | i < phi((n : Num))}"), t1282, t1281]),
              @sets.surjective_iff_injective_gen(),
            ),
          ),
          t1283,
        ),
        @tactics.ants_tac,
      ),
      t1309,
    ),
    @tactics.all_tac,
  ])
  let t1280 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ r : Num, r < phi((n : Num)) && op_eq_eq(EXP((g : Num), r), (a : Num), mod(n))"),
    @tactics.strip_assume_tac,
  )
  let t1274 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.cong_v1()), @arith.exp_exp()]),
  )
  let t1275 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.cong_v1(), @arith.mod_exp_mod()])),
    t1274,
  )
  let t1273 = @simp.rewrite_tac(@list.List([@pocklington.cong_imp_eq()]))
  let t1272 = @simp.asm_simp_tac(
    @list.List([@pocklington.order_divides_expdiff()]),
  )
  let t1276 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())])),
      t1272,
    ),
    t1273,
  )
  let t1271 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_rexp(), @int.coprime_rmod()]),
  )
  let t1277 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([
        @sets.subset(),
        @sets.forall_in_image(),
        @sets.in_elim_thm(),
        @arith.mod_lt_eq(),
      ]),
    ),
    t1271,
  )
  let t1270 = @sets.set_tac(@list.List([]))
  let t1269 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t1278 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
        t1269,
      ),
      @tactics.ap_term_tac,
    ),
    t1270,
  )
  let t1268 = @simp.simp_tac(
    @list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]),
  )
  let t1279 = @list.List([
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"),
          ),
        ]),
      ),
      t1268,
    ),
    t1278,
    t1277,
    t1276,
    t1275,
  ])
  let t1267 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1266 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @sets.finite_numseg_lt(),
      @sets.card_numseg_lt(),
    ]),
  )
  let t1265 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | i < phi((n : Num))}"))
  let t1264 = @tactics.match_mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(i : Num) => MOD(EXP((g : Num), i), (n : Num))"),
      @sets.has_size_image_inj_restrict(),
    ),
  )
  let t1263 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y) && Q(y)}) && R(x)}"),
      ),
    ]),
  )
  let t1262 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@pocklington.order_eq_0(), @pocklington.phi_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1261 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((n : Num), (g : Num)))"), fn(
    x1258 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1259 = @tactics.assume_tac(x1258)
    fn(
      x1260 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1259(x1260)
    }
  })
  let t1256 = @sets.set_tac(@list.List([]))
  let t1255 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@arith.not_le()),
      @prime.gcd_le(),
      @pocklington.phi_eq_0(),
      @sets.has_size_0(),
    ]),
  )
  let t1254 = @simp.asm_simp_tac(
    @list.List([@arith.div_eq_0(), @prime.gcd_zero()]),
  )
  let t1253 = @simp.asm_rewrite_tac(
    @list.List([@prime.coprime_rexp(), @prime.coprime_1()]),
  )
  let t1257 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(
              @list.List([
                @meson.meson(
                  @list.List([@pocklington.cong_coprime()]),
                  @term_syntax.parse_term("op_eq_eq((x : Num), (a : Num), mod((n : Num))) == (op_eq_eq(x, a, mod(n)) && coprime((n, x)) == coprime((n, a)))"),
                ),
              ]),
            ),
            t1253,
          ),
          t1254,
        ),
        t1255,
      ),
      t1256,
    ),
  ])
  let t1252 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((n : Num), (a : Num)))"))
  let t1248 = @term_syntax.parse_term("(g : Num)")
  let t1250 = @tactics.disch_then((x1249 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1248, x1249)
  })
  let t1245 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t1244 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1246 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])),
      t1244,
    ),
    t1245,
  )
  let t1243 = @sets.set_tac(@list.List([]))
  let t1242 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t1241 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Num) | x < (n : Num)}"))
  let t1247 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1241),
        t1242,
      ),
      t1243,
    ),
    t1246,
  ])
  let t1240 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.empty_gspec(),
      @sets.has_size(),
      @sets.finite_empty(),
      @sets.card_clauses(),
    ]),
  )
  let t1239 = @class.asm_cases_tac(@term_syntax.parse_term("op_eq_eq((a : Num), 1, mod((n : Num)))"))
  let t1238 = @simp.once_rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq(1, (a : Num), mod((n : Num))) == op_eq_eq(a, 1, mod(n))"),
      ),
    ]),
  )
  let t1237 = @simp.asm_simp_tac(
    @list.List([
      @prime.gcd_0(),
      @arith.div_refl(),
      @pocklington.phi_eq_0(),
      @arith.exp_1(),
      @arith.exp(),
    ]),
  )
  let t1251 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_then(fn(
                  x1236 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                }),
                t1237,
              ),
              t1238,
            ),
            t1239,
          ),
          t1240,
        ),
        @tactics.conj_tac,
      ),
      t1247,
    ),
    t1250,
  ])
  let t1235 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1234 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1228 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1229 = @tactics.assume_tac(x1228)
        fn(
          x1230 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1229(x1230)
        }
      },
      fn(
        x1231 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1232 = @tactics.mp_tac(x1231)
        fn(
          x1233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1232(x1233)
        }
      },
    ),
  )
  let t1345 = @tactics.then_tac(
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
                                                                  @tactics.thenl(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.repeat_tac(
                                                                          @tactics.gen_tac,
                                                                        ),
                                                                        t1234,
                                                                      ),
                                                                      t1235,
                                                                    ),
                                                                    t1251,
                                                                  ),
                                                                  t1252,
                                                                ),
                                                                t1257,
                                                              ),
                                                              t1261,
                                                            ),
                                                            t1262,
                                                          ),
                                                          t1263,
                                                        ),
                                                        t1264,
                                                      ),
                                                      t1265,
                                                    ),
                                                    t1266,
                                                  ),
                                                  t1267,
                                                ),
                                                t1279,
                                              ),
                                              t1280,
                                            ),
                                            t1310,
                                          ),
                                          t1313,
                                        ),
                                        t1315,
                                      ),
                                      t1318,
                                    ),
                                    t1322,
                                  ),
                                  t1323,
                                ),
                                t1324,
                              ),
                              t1325,
                            ),
                            t1326,
                          ),
                          t1330,
                        ),
                        t1331,
                      ),
                      t1335,
                    ),
                    t1336,
                  ),
                  t1337,
                ),
                t1338,
              ),
              t1339,
            ),
            t1340,
          ),
          t1341,
        ),
        t1342,
      ),
      t1343,
    ),
    t1344,
  )
  count_roots_modulo_primitive_gen_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, !(n == 0) && (∃ x : Num, order(n, x) == phi(n)) → HAS_SIZE({(x : Num) | x < n && coprime((n, x)) && op_eq_eq(EXP(x, k), a, mod(n))}, if op_eq_eq(EXP(a, DIV(phi(n), gcd((k, phi(n))))), 1, mod(n)) { gcd((k, phi(n))) } else { 0 })"),
      t1345,
    ),
  )
}

///|
let count_roots_modulo_primitive_gen_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_PRIMITIVE_GEN_ALT",
)

///|
/// `COUNT_ROOTS_MODULO_PRIMITIVE_GEN_ALT`
pub fn count_roots_modulo_primitive_gen_alt() -> @kernel.Thm {
  count_roots_modulo_primitive_gen_alt_c.get()
}

///|
/// COUNT_ROOTS_MODULO_PRIMITIVE_GEN
fn step_32() -> Unit raise {
  let t1365 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t1362 = @drule.match_mp(@pocklington.cong_coprime())
  let t1364 = @tactics.first_x_assum(fn(
    x1363 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1359 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1360 = @tactics.mp_tac(x1359)
      fn(
        x1361 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1360(x1361)
      }
    })(t1362(x1363))
  })
  let t1358 = @simp.asm_rewrite_tac(@list.List([]))
  let t1357 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1356 = @simp.gen_rewrite_tac(
    fn(
      x1355 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1355
    },
    @list.List([@sets.extension()]),
  )
  let t1354 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1353 = @simp.asm_rewrite_tac(@list.List([]))
  let t1350 = @term_syntax.parse_term("(k : Num)")
  let t1351 = @term_syntax.parse_term("(a : Num)")
  let t1352 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1351, t1350]),
      count_roots_modulo_primitive_gen_alt(),
    ),
  )
  let t1349 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x1346 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1347 = @tactics.assume_tac(x1346)
      fn(
        x1348 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1347(x1348)
      }
    }),
  )
  let t1366 = @tactics.then_tac(
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
                              t1349,
                            ),
                            t1352,
                          ),
                          t1353,
                        ),
                        t1354,
                      ),
                      @tactics.ap_thm_tac,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t1356,
                ),
                t1357,
              ),
              @tactics.gen_tac,
            ),
            @tactics.eq_tac,
          ),
          @tactics.strip_tac,
        ),
        t1358,
      ),
      t1364,
    ),
    t1365,
  )
  count_roots_modulo_primitive_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, !(n == 0) && !(k == 0) && coprime((n, a)) && (∃ x : Num, order(n, x) == phi(n)) → HAS_SIZE({(x : Num) | x < n && op_eq_eq(EXP(x, k), a, mod(n))}, if op_eq_eq(EXP(a, DIV(phi(n), gcd((k, phi(n))))), 1, mod(n)) { gcd((k, phi(n))) } else { 0 })"),
      t1366,
    ),
  )
}

///|
let count_roots_modulo_primitive_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_PRIMITIVE_GEN",
)

///|
/// `COUNT_ROOTS_MODULO_PRIMITIVE_GEN`
pub fn count_roots_modulo_primitive_gen() -> @kernel.Thm {
  count_roots_modulo_primitive_gen_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIMITIVE
fn step_33() -> Unit raise {
  let t1401 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t1400 = @simp.rewrite_tac(@list.List([@arith.mod_exp_mod()]))
  let t1399 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t1398 = @simp.asm_rewrite_tac(@list.List([@arith.mod_lt_eq()]))
  let t1397 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (n : Num))"))
  let t1394 = @term_syntax.parse_term("(x : Num)")
  let t1396 = @tactics.disch_then((x1395 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1394, x1395)
  })
  let t1393 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.not_exists_thm()), @class.contrapos_thm()]),
  )
  let t1402 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @sets.has_size_0(),
                    @sets.extension(),
                    @sets.in_elim_thm(),
                    @sets.not_in_empty(),
                  ]),
                ),
                t1393,
              ),
              t1396,
            ),
            t1397,
          ),
          t1398,
        ),
        t1399,
      ),
      t1400,
    ),
    t1401,
  )
  let t1392 = @meson.asm_meson_tac(
    @list.List([@prime.gcd_zero(), @pocklington.phi_eq_0()]),
  )
  let t1391 = @simp.rewrite_tac(
    @list.List([
      @sets.has_size(),
      @sets.empty_gspec(),
      @sets.card_clauses(),
      @sets.finite_empty(),
    ]),
  )
  let t1390 = @simp.asm_rewrite_tac(@list.List([]))
  let t1389 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1403 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.gen_rewrite_tac(
                fn(
                  x1388 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  x1388
                },
                @list.List([@equal.gsym(@class.contrapos_thm())]),
              ),
              t1389,
            ),
            @tactics.disch_tac,
          ),
          t1390,
        ),
        t1391,
      ),
      t1392,
    ),
    t1402,
  ])
  let t1387 = @simp.asm_rewrite_tac(@list.List([]))
  let t1386 = @simp.asm_rewrite_tac(@list.List([]))
  let t1383 = @term_syntax.parse_term("(k : Num)")
  let t1384 = @term_syntax.parse_term("(a : Num)")
  let t1385 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1384, t1383]),
      count_roots_modulo_primitive_gen(),
    ),
  )
  let t1381 = @simp.rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t1382 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @prime.gcd_0(),
          @arith.div_refl(),
          @pocklington.phi_eq_0(),
          @arith.exp_1(),
          @arith.exp(),
        ]),
      ),
      t1381,
    ),
    @tactics.all_tac,
  ])
  let t1380 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1378 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x1375 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1376 = @tactics.assume_tac(x1375)
      fn(
        x1377 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1376(x1377)
      }
    }),
  )
  let t1374 = @meson.meson_tac(@list.List([@arith.exp_one()]))
  let t1373 = @simp.rewrite_tac(
    @list.List([@arith.exp_one(), @pocklington.cong_mod_0()]),
  )
  let t1372 = @tactics.disch_then(fn(
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
    (fn(
      x1368 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1369 = @tactics.subst1_tac(x1368)
      fn(
        x1370 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1369(x1370)
      }
    })(@bool.conjunct1(x1371))
  })
  let t1379 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([@prime.coprime_0()])),
          t1372,
        ),
        t1373,
      ),
      t1374,
    ),
    t1378,
  ])
  let t1367 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1404 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    t1367,
                  ),
                  t1379,
                ),
                t1380,
              ),
              t1382,
            ),
            t1385,
          ),
          t1386,
        ),
        @class.cond_cases_tac,
      ),
      t1387,
    ),
    t1403,
  )
  power_residue_modulo_primitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, coprime((n, a)) && (∃ x : Num, order(n, x) == phi(n)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == op_eq_eq(EXP(a, DIV(phi(n), gcd((k, phi(n))))), 1, mod(n))"),
      t1404,
    ),
  )
}

///|
let power_residue_modulo_primitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIMITIVE",
)

///|
/// `POWER_RESIDUE_MODULO_PRIMITIVE`
pub fn power_residue_modulo_primitive() -> @kernel.Thm {
  power_residue_modulo_primitive_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIME_EQ
fn step_34() -> Unit raise {
  let t1409 = @meson.asm_meson_tac(@list.List([primitive_root_modulo_prime()]))
  let t1408 = @simp.asm_simp_tac(
    @list.List([@pocklington.phi_prime(), @prime.prime_coprime_eq()]),
  )
  let t1405 = @term_syntax.parse_term("(k : Num)")
  let t1406 = @term_syntax.parse_term("(a : Num)")
  let t1407 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t1406, t1405]),
      power_residue_modulo_primitive(),
    ),
  )
  let t1410 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1407),
      t1408,
    ),
    t1409,
  )
  power_residue_modulo_prime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ k : Num, prime(p) && !divides(p, a) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(p))) == op_eq_eq(EXP(a, DIV(p - 1, gcd((k, p - 1)))), 1, mod(p))"),
      t1410,
    ),
  )
}

///|
let power_residue_modulo_prime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIME_EQ",
)

///|
/// `POWER_RESIDUE_MODULO_PRIME_EQ`
pub fn power_residue_modulo_prime_eq() -> @kernel.Thm {
  power_residue_modulo_prime_eq_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIMITIVE_ORDER_ALT
fn step_35() -> Unit raise {
  let t1411 = @simp.simp_tac(
    @list.List([power_residue_modulo_primitive(), @pocklington.order_divides()]),
  )
  power_residue_modulo_primitive_order_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, coprime((n, a)) && (∃ x : Num, order(n, x) == phi(n)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == divides(order(n, a), DIV(phi(n), gcd((k, phi(n)))))"),
      t1411,
    ),
  )
}

///|
let power_residue_modulo_primitive_order_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIMITIVE_ORDER_ALT",
)

///|
/// `POWER_RESIDUE_MODULO_PRIMITIVE_ORDER_ALT`
pub fn power_residue_modulo_primitive_order_alt() -> @kernel.Thm {
  power_residue_modulo_primitive_order_alt_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIMITIVE_ORDER
fn step_36() -> Unit raise {
  let t1413 = @simp.rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1412 = @simp.simp_tac(
    @list.List([
      @int.divides_divides_div(),
      @int.gcd(),
      @pocklington.order_divides_phi(),
    ]),
  )
  let t1414 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([power_residue_modulo_primitive_order_alt()]),
      ),
      t1412,
    ),
    t1413,
  )
  power_residue_modulo_primitive_order_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, coprime((n, a)) && (∃ x : Num, order(n, x) == phi(n)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == divides(gcd((k, phi(n))), DIV(phi(n), order(n, a)))"),
      t1414,
    ),
  )
}

///|
let power_residue_modulo_primitive_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIMITIVE_ORDER",
)

///|
/// `POWER_RESIDUE_MODULO_PRIMITIVE_ORDER`
pub fn power_residue_modulo_primitive_order() -> @kernel.Thm {
  power_residue_modulo_primitive_order_c.get()
}

///|
/// QUADRATIC_RESIDUE_MODULO_PRIMITIVE_ORDER
fn step_37() -> Unit raise {
  let t1416 = @int.number_rule(
    @term_syntax.parse_term("divides((a : Num), (b : Num)) → gcd((a, b)) == a"),
  )
  let t1417 = @simp.rewrite_rule(@list.List([@equal.gsym(@prime.divides_2())]))(
    @pocklington.even_phi(),
  )
  let t1418 = @simp.simp_tac(
    @list.List([@equal.gsym(@prime.divides_2()), t1417, t1416]),
  )
  let t1415 = @simp.simp_tac(
    @list.List([power_residue_modulo_primitive_order()]),
  )
  let t1419 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1415),
    t1418,
  )
  quadratic_residue_modulo_primitive_order_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, coprime((n, a)) && 3 <= n && (∃ x : Num, order(n, x) == phi(n)) → (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n))) == EVEN(DIV(phi(n), order(n, a)))"),
      t1419,
    ),
  )
}

///|
let quadratic_residue_modulo_primitive_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_RESIDUE_MODULO_PRIMITIVE_ORDER",
)

///|
/// `QUADRATIC_RESIDUE_MODULO_PRIMITIVE_ORDER`
pub fn quadratic_residue_modulo_primitive_order() -> @kernel.Thm {
  quadratic_residue_modulo_primitive_order_c.get()
}

///|
/// POWER_RESIDUE_MODULO_PRIMITIVE_POWER
fn step_38() -> Unit raise {
  let t1440 = @tactics.conv_tac(@int.number_rule)
  let t1439 = @simp.asm_simp_tac(
    @list.List([@int.div_by_div(), @pocklington.phi_eq_0(), @int.gcd()]),
  )
  let t1438 = @simp.asm_rewrite_tac(
    @list.List([@int.gcd(), @arith.div_1(), @prime.divides_0()]),
  )
  let t1437 = @simp.asm_rewrite_tac(@list.List([@pocklington.order_exp_gen()]))
  let t1435 = @tactics.disch_then(fn(
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
    let s1433 = @tactics.subst1_tac(x1432)
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
  })
  let t1436 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_rexp()])),
    t1435,
  ])
  let t1426 = @drule.part_match(
    fn(x1425 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1425))
    },
    power_residue_modulo_primitive_order(),
  )
  let t1421 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@pocklington.phi_eq_0(), @pocklington.order_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1420 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1441 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t1420,
                    ),
                    t1421,
                  ),
                  fn(
                    x1431 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    (fn(
                      x1430 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        x1428 : @kernel.Term,
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
                          x1427 : @kernel.Term,
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
                          (fn(
                            x1422 : @kernel.Thm,
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
                            let s1423 = @tactics.mp_tac(x1422)
                            fn(
                              x1424 : (
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
                              s1423(x1424)
                            }
                          })(t1426(x1427))
                        })(@equal.lhand(x1428))
                      })(
                        (fn(
                          x1429 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
                        ) -> @kernel.Term raise {
                          x1429.1
                        })(x1430),
                      )
                    })(x1431)(x1431)
                  },
                ),
                @tactics.ants_tac,
              ),
              t1436,
            ),
            t1437,
          ),
          @class.cond_cases_tac,
        ),
        t1438,
      ),
      t1439,
    ),
    t1440,
  )
  power_residue_modulo_primitive_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, ∀ m : Num, ∀ k : Num, coprime((n, g)) && order(n, g) == phi(n) → (∃ x : Num, op_eq_eq(EXP(x, k), EXP(g, m), mod(n))) == divides(gcd((k, phi(n))), m)"),
      t1441,
    ),
  )
}

///|
let power_residue_modulo_primitive_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_PRIMITIVE_POWER",
)

///|
/// `POWER_RESIDUE_MODULO_PRIMITIVE_POWER`
pub fn power_residue_modulo_primitive_power() -> @kernel.Thm {
  power_residue_modulo_primitive_power_c.get()
}

///|
/// QUADRATIC_RESIDUE_MODULO_PRIMITIVE_POWER
fn step_39() -> Unit raise {
  let t1447 = @simp.asm_rewrite_tac(
    @list.List([@prime.divides_1(), @prime.divides_2()]),
  )
  let t1446 = @class.asm_cases_tac(@term_syntax.parse_term("3 <= (n : Num)"))
  let t1445 = @simp.asm_rewrite_tac(
    @list.List([@prime.gcd_2_cases(), @pocklington.even_phi_eq()]),
  )
  let t1444 = @simp.asm_simp_tac(
    @list.List([power_residue_modulo_primitive_power()]),
  )
  let t1443 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@pocklington.phi_eq_0(), @pocklington.order_eq_0()]),
    ),
    @tactics.all_tac,
  ])
  let t1442 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1448 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1442),
            t1443,
          ),
          t1444,
        ),
        t1445,
      ),
      t1446,
    ),
    t1447,
  )
  quadratic_residue_modulo_primitive_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ g : Num, ∀ m : Num, coprime((n, g)) && order(n, g) == phi(n) → (∃ x : Num, op_eq_eq(EXP(x, 2), EXP(g, m), mod(n))) == (3 <= n → EVEN(m))"),
      t1448,
    ),
  )
}

///|
let quadratic_residue_modulo_primitive_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_RESIDUE_MODULO_PRIMITIVE_POWER",
)

///|
/// `QUADRATIC_RESIDUE_MODULO_PRIMITIVE_POWER`
pub fn quadratic_residue_modulo_primitive_power() -> @kernel.Thm {
  quadratic_residue_modulo_primitive_power_c.get()
}

///|
/// COUNT_POWER_RESIDUES_MODULO_PRIMITIVE
fn step_40() -> Unit raise {
  let t1458 = @simp.simp_tac(@list.List([@int.divides_div_self(), @int.gcd()]))
  let t1457 = @simp.rewrite_tac(
    @list.List([
      @arith.exp_one(),
      @pocklington.cong_refl(),
      @equal.gsym(@prime.divides_gcd_left()),
    ]),
  )
  let t1455 = @simp.rewrite_rule(@list.List([@sets.has_size()]))(
    count_roots_modulo_primitive_gen_alt(),
  )
  let t1456 = @simp.asm_simp_tac(
    @list.List([
      @class.not_imp(),
      @equal.gsym(@theorems.conj_assoc()),
      @sets.has_size(),
      t1455,
    ]),
  )
  let t1454 = @simp.asm_simp_tac(@list.List([power_residue_modulo_primitive()]))
  let t1453 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == {(x : _) | !(P(x) && Q(x) → !R(x))}"),
      ),
    ]),
  )
  let t1452 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x1449 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1450 = @tactics.assume_tac(x1449)
      fn(
        x1451 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1450(x1451)
      }
    }),
  )
  let t1459 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1452),
            t1453,
          ),
          t1454,
        ),
        t1456,
      ),
      t1457,
    ),
    t1458,
  )
  count_power_residues_modulo_primitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) && (∃ g : Num, order(n, g) == phi(n)) → HAS_SIZE({(a : Num) | a < n && coprime((n, a)) && (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n)))}, DIV(phi(n), gcd((k, phi(n)))))"),
      t1459,
    ),
  )
}

///|
let count_power_residues_modulo_primitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_POWER_RESIDUES_MODULO_PRIMITIVE",
)

///|
/// `COUNT_POWER_RESIDUES_MODULO_PRIMITIVE`
pub fn count_power_residues_modulo_primitive() -> @kernel.Thm {
  count_power_residues_modulo_primitive_c.get()
}

///|
/// COUNT_QUADRATIC_RESIDUES_MODULO_PRIMITIVE
fn step_41() -> Unit raise {
  let t1463 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1462 = @simp.asm_simp_tac(
    @list.List([@prime.gcd_2_cases(), @pocklington.even_phi_eq()]),
  )
  let t1460 = @term_syntax.parse_term("2")
  let t1461 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1460]),
      count_power_residues_modulo_primitive(),
    ),
  )
  let t1464 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
          t1461,
        ),
        t1462,
      ),
      t1463,
    ),
    @int.asm_arith_tac,
  )
  count_quadratic_residues_modulo_primitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, 3 <= n && (∃ g : Num, order(n, g) == phi(n)) → HAS_SIZE({(a : Num) | a < n && coprime((n, a)) && (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n)))}, DIV(phi(n), 2))"),
      t1464,
    ),
  )
}

///|
let count_quadratic_residues_modulo_primitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_QUADRATIC_RESIDUES_MODULO_PRIMITIVE",
)

///|
/// `COUNT_QUADRATIC_RESIDUES_MODULO_PRIMITIVE`
pub fn count_quadratic_residues_modulo_primitive() -> @kernel.Thm {
  count_quadratic_residues_modulo_primitive_c.get()
}

///|
/// INT_OF_NUM_POWER_RESIDUE
fn step_42() -> Unit raise {
  let t1483 = @simp.asm_simp_tac(@list.List([@integer.int_cong_pow()]))
  let t1482 = @tactics.exists_tac(@term_syntax.parse_term("pow((x : Int), (k : Num))"))
  let t1481 = @tactics.match_mp_tac(@integer.int_cong_trans())
  let t1480 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1479 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1478 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_eq()]))
  let t1476 = @term_syntax.parse_term("int_of_num((n : Num))")
  let t1477 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Int)"), t1476]),
      @int.int_cong_num_exists(),
    ),
  )
  let t1473 = @term_syntax.parse_term("(x : Int)")
  let t1475 = @tactics.disch_then((x1474 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1473, x1474)
  })
  let t1472 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t1470 = @simp.rewrite_tac(
    @list.List([@int.num_congruent(), @equal.gsym(@int.int_of_num_pow())]),
  )
  let t1469 = @meson.meson_tac(@list.List([]))
  let t1468 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_of_num_pow(),
      @int.int_of_num_eq(),
      @int.int_arith(
        @term_syntax.parse_term("(-int_of_num((m : Num)) == int_of_num((n : Num))) == (int_of_num(m) == int_of_num(n) && int_of_num(n) == int_of_num(0))"),
      ),
    ]),
  )
  let t1467 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((k : Num))"))
  let t1466 = @simp.rewrite_tac(
    @list.List([@int.exists_int_cases(), @int.int_pow_neg()]),
  )
  let t1471 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(
              @list.List([@pocklington.cong_mod_0(), @integer.int_cong_mod_0()]),
            ),
            t1466,
          ),
          t1467,
        ),
        t1468,
      ),
      t1469,
    ),
    t1470,
  ])
  let t1465 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1484 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t1465,
                          ),
                          t1471,
                        ),
                        @tactics.eq_tac,
                      ),
                      t1472,
                    ),
                    t1475,
                  ),
                  t1477,
                ),
                t1478,
              ),
              t1479,
            ),
            t1480,
          ),
          @tactics.disch_tac,
        ),
        t1481,
      ),
      t1482,
    ),
    t1483,
  )
  int_of_num_power_residue_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, ∀ a : Num, (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == (∃ x : Int, op_eq_eq(pow(x, k), int_of_num(a), mod(int_of_num(n))))"),
      t1484,
    ),
  )
}

///|
let int_of_num_power_residue_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_POWER_RESIDUE",
)

///|
/// `INT_OF_NUM_POWER_RESIDUE`
pub fn int_of_num_power_residue() -> @kernel.Thm {
  int_of_num_power_residue_c.get()
}

///|
/// QUADRATIC_RESIDUE_MODULO_ODD_POWER
fn step_43() -> Unit raise {
  let t1531 = @tactics.match_mp_tac(@integer.int_divides_pow_le_imp())
  let t1530 = @simp.asm_rewrite_tac(@list.List([]))
  let t1529 = @tactics.match_mp_tac(
    @int.integer_rule(
      @term_syntax.parse_term("pow((x : Int), 2) - (a : Int) == (m : Int) * (z : Int) && op_eq_eq(int_of_num(2) * x * (y : Int), -z, mod((n : Int))) && divides(pow(n, 1), m) → op_eq_eq(pow(x + y * m, 2), a, mod(n * m))"),
    ),
  )
  let t1528 = @tactics.exists_tac(@term_syntax.parse_term("(x : Int) + (y : Int) * pow(int_of_num((n : Num)), (k : Num))"))
  let t1526 = @term_syntax.parse_term("(y : Int)")
  let t1532 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then((x1527 : @kernel.Thm) => {
              @tactics.x_choose_tac(t1526, x1527)
            }),
            t1528,
          ),
          t1529,
        ),
        t1530,
      ),
      t1531,
    ),
    @int.asm_arith_tac,
  )
  let t1525 = @tactics.match_mp_tac(@integer.int_divides_pow_le_imp())
  let t1524 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@int.num_coprime())]),
  )
  let t1521 = @drule.match_mp(
    @int.integer_rule(
      @term_syntax.parse_term("pow((x : Int), 2) - (a : Int) == (nk : Int) * (z : Int) → coprime(((n : Int), a)) && divides(pow(n, 1), nk) → coprime((x, n))"),
    ),
  )
  let t1523 = @tactics.first_x_assum(fn(
    x1522 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t1521(x1522))
  })
  let t1533 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(
              @list.List([
                @integer.int_coprime_lmul(),
                @equal.gsym(@int.num_coprime()),
                @prime.coprime_2(),
              ]),
            ),
            t1523,
          ),
          t1524,
        ),
        t1525,
      ),
      @int.asm_arith_tac,
    ),
    t1532,
  ])
  let t1518 = @term_syntax.parse_term("int_of_num((n : Num))")
  let t1519 = @term_syntax.parse_term("-(z : Int)")
  let t1520 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("int_of_num(2) * (x : Int)"), t1519, t1518]),
      @integer.int_cong_solve(),
    ),
  )
  let t1515 = @term_syntax.parse_term("(z : Int)")
  let t1517 = @tactics.disch_then((x1516 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1515, x1516)
  })
  let t1512 = @simp.rewrite_rule(@list.List([@int.int_congruent()]))
  let t1514 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : Int)"))(fn(
      x1513 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1509 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1510 = @tactics.mp_tac(x1509)
        fn(
          x1511 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1510(x1511)
        }
      })(t1512(x1513))
    }),
  )
  let t1507 = @equal.gsym(@int.int_of_num_pow())
  let t1508 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_mul()), t1507]),
  )
  let t1506 = @simp.rewrite_tac(@list.List([int_of_num_power_residue()]))
  let t1505 = @tactics.first_x_assum(fn(
    x1504 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1499 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(
      ((x1503 : @kernel.Thm) => {
        @lib.check(
          fn(x1502 : @kernel.Thm) -> Bool raise {
            (fn(x1500 : @kernel.Term) -> Bool raise { @basics.is_exists(x1500) })(
              (fn(x1501 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x1501)
              })(x1502),
            )
          },
          x1503,
        )
      })(x1504),
    )
  })
  let t1498 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @arith.mult_clauses(), @nums.not_suc()]),
  )
  let t1497 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1496 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1495 = @simp.rewrite_tac(@list.List([]))
  let t1494 = @tactics.match_mp_tac(@nums.num_induction())
  let t1490 = @term_syntax.parse_term("(k : Num)")
  let t1491 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t1490)
  let t1492 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) == 0)")),
    ),
    t1491,
  )
  let t1489 = @tactics.match_mp_tac(@prime.divides_exp_le_imp())
  let t1488 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides(EXP((p : Num), 1), (q : Num)) → op_eq_eq((x : Num), (a : Num), mod(q)) → op_eq_eq(x, a, mod(p))"),
    ),
  )
  let t1487 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1493 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@theorems.mono_exists()),
            t1487,
          ),
          t1488,
        ),
        t1489,
      ),
      @int.asm_arith_tac,
    ),
    t1492,
  ])
  let t1486 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), @pocklington.cong_mod_1()]),
  )
  let t1485 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1534 = @tactics.thenl(
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
                                    @tactics.repeat_tac(@tactics.strip_tac),
                                    t1485,
                                  ),
                                  t1486,
                                ),
                                @tactics.eq_tac,
                              ),
                              t1493,
                            ),
                            t1494,
                          ),
                          t1495,
                        ),
                        t1496,
                      ),
                      t1497,
                    ),
                    t1498,
                  ),
                  t1505,
                ),
                t1506,
              ),
              t1508,
            ),
            t1514,
          ),
          t1517,
        ),
        t1520,
      ),
      @tactics.ants_tac,
    ),
    t1533,
  )
  quadratic_residue_modulo_odd_power_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, ODD(n) && coprime((n, a)) → (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(EXP(n, k)))) == (k == 0 || (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n))))"),
      t1534,
    ),
  )
}

///|
let quadratic_residue_modulo_odd_power_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_RESIDUE_MODULO_ODD_POWER",
)

///|
/// `QUADRATIC_RESIDUE_MODULO_ODD_POWER`
pub fn quadratic_residue_modulo_odd_power() -> @kernel.Thm {
  quadratic_residue_modulo_odd_power_c.get()
}

///|
/// QUADRATIC_RESIDUE_MODULO_POWER_2_STABLE
fn step_44() -> Unit raise {
  let t1593 = @simp.asm_rewrite_tac(
    @list.List([@int.int_2_divides_add(), @int.int_2_divides_mul()]),
  )
  let t1592 = @tactics.match_mp_tac(
    @int.integer_rule(
      @term_syntax.parse_term("divides((t : Int), (c : Int) * (x : Int) + (b : Int)) → divides((k : Int) * t, k * b + x * (c * k))"),
    ),
  )
  let t1591 = @simp.rewrite_tac(
    @list.List([@int.int_pow_add(), @int.int_pow_1()]),
  )
  let t1590 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("3 <= (k : Num) → SUC(k - 1) == k")),
    ]),
  )
  let t1588 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@int.int_pow_v1()))]),
  )
  let t1587 = @tactics.match_mp_tac(@integer.int_divides_pow_le_imp())
  let t1589 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@integer.int_divides_lmul()),
        t1587,
      ),
      @int.asm_arith_tac,
    ),
    t1588,
  ])
  let t1586 = @tactics.match_mp_tac(@integer.int_divides_add())
  let t1585 = @simp.rewrite_tac(
    @list.List([@int.int_pow_mul(), @int.int_pow_pow(), @arith.add1()]),
  )
  let t1584 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq((a : Int) + (b : Int) + ((d : Int) + int_of_num(2) * ((x : Int) * ((c : Int) * (p : Int)))), a, mod((n : Int))) == divides(n, d + (b + x * (c * (int_of_num(2) * p))))"),
      ),
    ]),
  )
  let t1583 = @simp.asm_rewrite_tac(@list.List([]))
  let t1582 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("pow((x : Int) + (y : Int), 2) == pow(x, 2) + (pow(y, 2) + int_of_num(2) * (x * y))"),
      ),
    ]),
  )
  let t1581 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Int) + (b : Int) * pow(int_of_num(2), (k : Num) - 1)"),
  )
  let t1580 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1579 = @simp.asm_simp_tac(
    @list.List([
      @integer.int_divides_refl(),
      @int.arith_rule(@term_syntax.parse_term("3 <= (k : Num) → !(k == 0)")),
    ]),
  )
  let t1578 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_2_divides_pow(),
      @int.int_2_divides_add(),
      @int.int_2_divides_mul(),
    ]),
  )
  let t1574 = @term_syntax.parse_term("(x : Int) => divides(int_of_num(2), x)")
  let t1577 = @tactics.first_assum(fn(
    x1576 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1571 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1572 = @tactics.mp_tac(x1571)
      fn(
        x1573 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1572(x1573)
      }
    })(((x1575 : @kernel.Thm) => @equal.ap_term(t1574, x1575))(x1576))
  })
  let t1568 = @term_syntax.parse_term("(b : Int)")
  let t1570 = @tactics.disch_then((x1569 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1568, x1569)
  })
  let t1567 = @simp.rewrite_tac(
    @list.List([
      @int.int_arith(@term_syntax.parse_term("((a : Int) - (b : Int) == (c : Int)) == (a == b + c)")),
    ]),
  )
  let t1564 = @simp.gen_rewrite_rule(
    fn(
      x1563 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1563
    },
    @list.List([@int.int_congruent()]),
  )
  let t1566 = @tactics.first_x_assum(fn(
    x1565 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1560 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1561 = @tactics.mp_tac(x1560)
      fn(
        x1562 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1561(x1562)
      }
    })(t1564(x1565))
  })
  let t1557 = @term_syntax.parse_term("(x : Int)")
  let t1559 = @tactics.disch_then((x1558 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1557, x1558)
  })
  let t1555 = @equal.gsym(@prime.divides_2())
  let t1556 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_even()), t1555, @int.num_divides()]),
  )
  let t1554 = @simp.rewrite_tac(
    @list.List([int_of_num_power_residue(), @equal.gsym(@int.int_of_num_pow())]),
  )
  let t1553 = @simp.asm_rewrite_tac(@list.List([]))
  let t1552 = @class.asm_cases_tac(@term_syntax.parse_term("3 <= (k : Num)"))
  let t1551 = @tactics.pop_assum_list(fn(
    x1550 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t1549 = @tactics.undisch_tac(@term_syntax.parse_term("ODD((a : Num))"))
  let t1548 = @simp.asm_rewrite_tac(@list.List([]))
  let t1547 = @class.asm_cases_tac(@term_syntax.parse_term("SUC((k : Num)) == 3"))
  let t1546 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(3 <= SUC((k : Num))) == (SUC(k) == 3 || 3 <= k)")),
    ]),
  )
  let t1545 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1544 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1543 = @tactics.match_mp_tac(@nums.num_induction())
  let t1541 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])),
    @tactics.disch_tac,
  )
  let t1540 = @simp.asm_rewrite_tac(@list.List([]))
  let t1539 = @tactics.match_mp_tac(@prime.divides_exp_le_imp())
  let t1538 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides((m : Num), (n : Num)) → op_eq_eq((a : Num), (b : Num), mod(n)) → op_eq_eq(a, b, mod(m))"),
    ),
  )
  let t1537 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1542 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
              t1537,
            ),
            @tactics.gen_tac,
          ),
          t1538,
        ),
        t1539,
      ),
      t1540,
    ),
    t1541,
  ])
  let t1535 = @class.taut(
    @term_syntax.parse_term("((p : Bool) → (q : Bool) == (r : Bool)) == ((p → q → r) && (r → p → q))"),
  )
  let t1536 = @simp.rewrite_tac(
    @list.List([
      @theorems.forall_and_thm(),
      @int.arith_rule(@term_syntax.parse_term("8 == EXP(2, 3)")),
      t1535,
    ]),
  )
  let t1594 = @tactics.then_tac(
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
                                                                                @simp.rewrite_tac(
                                                                                  @list.List([
                                                                                      @theorems.imp_conj(),
                                                                                      @theorems.right_forall_imp_thm(),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                @tactics.gen_tac,
                                                                              ),
                                                                              @tactics.disch_tac,
                                                                            ),
                                                                            t1536,
                                                                          ),
                                                                          @tactics.conj_tac,
                                                                        ),
                                                                        t1542,
                                                                      ),
                                                                      t1543,
                                                                    ),
                                                                    t1544,
                                                                  ),
                                                                  t1545,
                                                                ),
                                                                t1546,
                                                              ),
                                                              t1547,
                                                            ),
                                                            t1548,
                                                          ),
                                                          t1549,
                                                        ),
                                                        t1551,
                                                      ),
                                                      t1552,
                                                    ),
                                                    t1553,
                                                  ),
                                                  t1554,
                                                ),
                                                t1556,
                                              ),
                                              @tactics.disch_tac,
                                            ),
                                            t1559,
                                          ),
                                          t1566,
                                        ),
                                        t1567,
                                      ),
                                      t1570,
                                    ),
                                    t1577,
                                  ),
                                  t1578,
                                ),
                                t1579,
                              ),
                              t1580,
                            ),
                            @tactics.disch_tac,
                          ),
                          t1581,
                        ),
                        t1582,
                      ),
                      t1583,
                    ),
                    t1584,
                  ),
                  t1585,
                ),
                t1586,
              ),
              @tactics.conj_tac,
            ),
            t1589,
          ),
          t1590,
        ),
        t1591,
      ),
      t1592,
    ),
    t1593,
  )
  quadratic_residue_modulo_power_2_stable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ k : Num, ODD(a) && 3 <= k → (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(EXP(2, k)))) == (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(8)))"),
      t1594,
    ),
  )
}

///|
let quadratic_residue_modulo_power_2_stable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_RESIDUE_MODULO_POWER_2_STABLE",
)

///|
/// `QUADRATIC_RESIDUE_MODULO_POWER_2_STABLE`
pub fn quadratic_residue_modulo_power_2_stable() -> @kernel.Thm {
  quadratic_residue_modulo_power_2_stable_c.get()
}

///|
/// QUADRATIC_RESIDUE_MODULO_POWER_2
fn step_45() -> Unit raise {
  let t1618 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1617 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t1616 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1615 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1614 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t1612 = @term_syntax.parse_term("(a : Num)")
  let t1613 = @tactics.spec_tac(@term_syntax.parse_term("MOD((a : Num), 8)"), t1612)
  let t1611 = @tactics.mp_tac(
    @int.arith_rule(@term_syntax.parse_term("MOD((a : Num), 8) < 8")),
  )
  let t1609 = @term_syntax.parse_term("(n : Num)")
  let t1610 = @tactics.spec_tac(@term_syntax.parse_term("MOD((n : Num), 8)"), t1609)
  let t1608 = @tactics.mp_tac(
    @int.arith_rule(@term_syntax.parse_term("MOD((n : Num), 8) < 8")),
  )
  let t1607 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.odd_mod_even(), @calc_num.arith()])),
    @tactics.all_tac,
  ])
  let t1606 = @tactics.subgoal_then(@term_syntax.parse_term("ODD(MOD((a : Num), 8))"), fn(
    x1603 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1604 = @tactics.mp_tac(x1603)
    fn(
      x1605 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1604(x1605)
    }
  })
  let t1602 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@arith.mod_exp_mod())]),
  )
  let t1601 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t1600 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(
      x1597 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1598 = @tactics.mp_tac(x1597)
      fn(
        x1599 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1598(x1599)
      }
    }),
  )
  let t1596 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([@arith.exp_one(), @pocklington.cong_sym()])),
  ])
  let t1595 = @simp.asm_simp_tac(
    @list.List([quadratic_residue_modulo_power_2_stable()]),
  )
  let t1619 = @tactics.then_tac(
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
                                    @tactics.repeat_tac(@tactics.strip_tac),
                                    t1595,
                                  ),
                                  @tactics.eq_tac,
                                ),
                                t1596,
                              ),
                              t1600,
                            ),
                            t1601,
                          ),
                          t1602,
                        ),
                        t1606,
                      ),
                      t1607,
                    ),
                    t1608,
                  ),
                  t1610,
                ),
                t1611,
              ),
              t1613,
            ),
            t1614,
          ),
          t1615,
        ),
        t1616,
      ),
      t1617,
    ),
    t1618,
  )
  quadratic_residue_modulo_power_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ k : Num, ODD(a) && 3 <= k → (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(EXP(2, k)))) == op_eq_eq(a, 1, mod(8))"),
      t1619,
    ),
  )
}

///|
let quadratic_residue_modulo_power_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_RESIDUE_MODULO_POWER_2",
)

///|
/// `QUADRATIC_RESIDUE_MODULO_POWER_2`
pub fn quadratic_residue_modulo_power_2() -> @kernel.Thm {
  quadratic_residue_modulo_power_2_c.get()
}

///|
/// GENERALIZED_EULER_CRITERION
fn step_46() -> Unit raise {
  let t1628 = @simp.asm_rewrite_tac(@list.List([primitive_root_exists()]))
  let t1627 = @tactics.match_mp_tac(power_residue_modulo_primitive())
  let t1629 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
          x1624 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1625 = @tactics.assume_tac(x1624)
          fn(
            x1626 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1625(x1626)
          }
        }),
      ),
      t1627,
    ),
    t1628,
  )
  let t1623 = @meson.meson_tac(@list.List([@arith.exp_one()]))
  let t1630 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([
          @pocklington.cong_mod_0(),
          @pocklington.phi_0(),
          @arith.div_0(),
          @prime.coprime_0(),
          @arith.exp(),
        ]),
      ),
      t1623,
    ),
    t1629,
  ])
  let t1622 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1621 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_mod_1()]))
  let t1620 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1631 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1620),
        t1621,
      ),
      t1622,
    ),
    t1630,
  )
  generalized_euler_criterion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, (n == 0 || n == 1 || n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && (n == EXP(p, k) || n == 2 * EXP(p, k)))) && coprime((n, a)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == op_eq_eq(EXP(a, DIV(phi(n), gcd((k, phi(n))))), 1, mod(n))"),
      t1631,
    ),
  )
}

///|
let generalized_euler_criterion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GENERALIZED_EULER_CRITERION",
)

///|
/// `GENERALIZED_EULER_CRITERION`
pub fn generalized_euler_criterion() -> @kernel.Thm {
  generalized_euler_criterion_c.get()
}

///|
/// GENERALIZED_EULER_CRITERION_PRIME
fn step_47() -> Unit raise {
  let t1660 = @drule.match_mp(@prime.prime_ge_2())
  let t1662 = @tactics.first_x_assum(fn(
    x1661 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1657 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1658 = @tactics.mp_tac(x1657)
      fn(
        x1659 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1658(x1659)
      }
    })(t1660(x1661))
  })
  let t1656 = @simp.asm_simp_tac(@list.List([@arith.exp_1()]))
  let t1654 = @term_syntax.parse_term("1")
  let t1655 = @tactics.map_every(
    fn(
      x1651 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1652 = @tactics.exists_tac(x1651)
      fn(
        x1653 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1652(x1653)
      }
    },
    @list.List([@term_syntax.parse_term("(p : Num)"), t1654]),
  )
  let t1650 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t1649 = @simp.asm_rewrite_tac(@list.List([]))
  let t1648 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t1647 = @simp.asm_simp_tac(@list.List([@prime.prime_coprime_eq()]))
  let t1646 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1645 = @simp.asm_simp_tac(@list.List([@pocklington.phi_prime()]))
  let t1643 = @term_syntax.parse_term("(k : Num)")
  let t1644 = @term_syntax.parse_term("(a : Num)")
  let t1663 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.mp_tac(
                        @bool.specl(
                          @list.List([@term_syntax.parse_term("(p : Num)"), t1644, t1643]),
                          generalized_euler_criterion(),
                        ),
                      ),
                      t1645,
                    ),
                    t1646,
                  ),
                  t1647,
                ),
                t1648,
              ),
              t1649,
            ),
            t1650,
          ),
          t1655,
        ),
        t1656,
      ),
      t1662,
    ),
    @int.asm_arith_tac,
  )
  let t1640 = @simp.asm_simp_tac(
    @list.List([@prime.prime_divexp_eq(), @prime.divides_0()]),
  )
  let t1639 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("divides((p : Num), (a : Num)) → op_eq_eq((x : Num), a, mod(p)) == divides(p, x)"),
      ),
    ]),
  )
  let t1641 = @tactics.then_tac(
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1639),
    t1640,
  )
  let t1638 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t1636 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("op_eq_eq(1, (a : Num), mod((p : Num))) → divides(p, a) → p == 1"),
    ),
  )
  let t1642 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x1637 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1633 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1634 = @tactics.mp_tac(x1633)
          fn(
            x1635 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1634(x1635)
          }
        })(t1636(x1637))
      }),
      t1638,
    ),
    t1641,
  ])
  let t1632 = @simp.asm_rewrite_tac(@list.List([@arith.exp()]))
  let t1664 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0")),
        t1632,
      ),
      t1642,
    ),
    t1663,
  ])
  let t1665 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.repeat_tac(@tactics.strip_tac),
      @class.cond_cases_tac,
    ),
    t1664,
  )
  generalized_euler_criterion_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ k : Num, prime(p) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(p))) == (if divides(p, a) { !(k == 0) } else { op_eq_eq(EXP(a, DIV(p - 1, gcd((k, p - 1)))), 1, mod(p)) })"),
      t1665,
    ),
  )
}

///|
let generalized_euler_criterion_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GENERALIZED_EULER_CRITERION_PRIME",
)

///|
/// `GENERALIZED_EULER_CRITERION_PRIME`
pub fn generalized_euler_criterion_prime() -> @kernel.Thm {
  generalized_euler_criterion_prime_c.get()
}

///|
/// EULER_CRITERION
fn step_48() -> Unit raise {
  let t1684 = @meson.asm_meson_tac(@list.List([@prime.prime_odd()]))
  let t1683 = @simp.rewrite_tac(
    @list.List([@calc_num.arith(), @arith.not_even()]),
  )
  let t1682 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@prime.divides_gcd_left()),
      @prime.divides_2(),
      @arith.even_sub(),
    ]),
  )
  let t1685 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.subgoal_then(@term_syntax.parse_term("gcd((2, (p : Num) - 1)) == 2"), fn(
            x1680 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let th = x1680
            @simp.rewrite_tac(@list.List([th]))
          }),
          t1682,
        ),
        @tactics.disj2_tac,
      ),
      t1683,
    ),
    t1684,
  )
  let t1679 = @simp.rewrite_tac(
    @list.List([@arith.not_even(), @arith.exp(), @calc_num.arith()]),
  )
  let t1678 = @simp.simp_tac(
    @list.List([
      @prime.gcd_1(),
      @arith.div_refl(),
      @calc_num.arith_eq(),
      @arith.exp_1(),
      @equal.gsym(@pocklington.odd_mod_2()),
    ]),
  )
  let t1677 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1676 = @simp.asm_rewrite_tac(@list.List([@prime.divides_2()]))
  let t1686 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.undisch_tac(@term_syntax.parse_term("!divides((p : Num), (a : Num))")),
            t1676,
          ),
          t1677,
        ),
        t1678,
      ),
      t1679,
    ),
    t1685,
  ])
  let t1675 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t1674 = @tactics.disch_then(fn(
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
    let s1672 = @tactics.subst1_tac(x1671)
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
  })
  let t1670 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t1669 = @class.asm_cases_tac(@term_syntax.parse_term("divides((p : Num), (a : Num))"))
  let t1666 = @term_syntax.parse_term("2")
  let t1667 = @term_syntax.parse_term("(a : Num)")
  let t1668 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t1667, t1666]),
      generalized_euler_criterion_prime(),
    ),
  )
  let t1687 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1668),
            t1669,
          ),
          t1670,
        ),
        t1674,
      ),
      t1675,
    ),
    t1686,
  )
  euler_criterion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) → (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(p))) == (divides(p, a) || op_eq_eq(EXP(a, DIV(p - 1, 2)), 1, mod(p)))"),
      t1687,
    ),
  )
}

///|
let euler_criterion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EULER_CRITERION",
)

///|
/// `EULER_CRITERION`
pub fn euler_criterion() -> @kernel.Thm {
  euler_criterion_c.get()
}

///|
/// COUNT_ROOTS_MODULO_ODD_GEN
fn step_49() -> Unit raise {
  let t1789 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(p <= 1)")),
      @arith.mult_clauses(),
    ]),
  )
  let t1788 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.phi_primepow_alt(),
      @prime.index_exp(),
      @prime.index_refl(),
    ]),
  )
  let t1786 = @drule.match_mp(@prime.prime_ge_2())
  let t1790 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x1787 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1783 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1784 = @tactics.assume_tac(x1783)
          fn(
            x1785 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1784(x1785)
          }
        })(t1786(x1787))
      }),
      t1788,
    ),
    t1789,
  )
  let t1782 = @meson.asm_meson_tac(@list.List([@prime.odd_prime()]))
  let t1781 = @simp.asm_rewrite_tac(@list.List([primitive_root_exists()]))
  let t1780 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t1791 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.conj_tac,
            @list.List([
              @meson.asm_meson_tac(@list.List([@prime.prime_0()])),
              @tactics.all_tac,
            ]),
          ),
          t1780,
        ),
        t1781,
      ),
      t1782,
    ),
    t1790,
  ])
  let t1779 = @simp.asm_rewrite_tac(@list.List([@arith.exp_eq_0()]))
  let t1773 = @drule.part_match(
    fn(x1772 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1772))
    },
    count_roots_modulo_primitive_gen(),
  )
  let t1768 = @simp.rewrite_tac(
    @list.List([
      @sets.sing_gspec(),
      @drule.match_mp(@iterate.iterate_sing())(@iterate.monoidal_mul()),
    ]),
  )
  let t1767 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2()]))
  let t1766 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_divexp_eq(), @prime.divides_prime_prime()]),
        @term_syntax.parse_term("!((n : Num) == 0) && prime((p : Num)) → (prime((q : Num)) && divides(q, EXP(p, n))) == (q == p)"),
      ),
    ]),
  )
  let t1765 = @simp.asm_rewrite_tac(
    @list.List([@arith.odd_exp(), @prime.coprime_lexp()]),
  )
  let t1764 = @term_syntax.parse_term("(j : Num)")
  let t1792 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.map_every(
                        @tactics.x_gen_tac,
                        @list.List([@term_syntax.parse_term("(p : Num)"), t1764]),
                      ),
                      @tactics.strip_tac,
                    ),
                    t1765,
                  ),
                  @tactics.strip_tac,
                ),
                t1766,
              ),
              t1767,
            ),
            t1768,
          ),
          fn(
            x1778 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x1777 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x1775 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x1774 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x1769 : @kernel.Thm,
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
                    let s1770 = @tactics.mp_tac(x1769)
                    fn(
                      x1771 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1770(x1771)
                    }
                  })(t1773(x1774))
                })(@equal.lhand(x1775))
              })(
                (fn(
                  x1776 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x1776.1
                })(x1777),
              )
            })(x1778)(x1778)
          },
        ),
        t1779,
      ),
      @tactics.ants_tac,
    ),
    t1791,
  )
  let t1763 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t1762 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_eq())(@iterate.monoidal_mul()),
  )
  let t1761 = @simp.asm_rewrite_tac(@list.List([]))
  let t1758 = @drule.match_mp(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("HAS_SIZE((s : (_) -> Bool), (m : Num)) → (n : Num) == m → HAS_SIZE(s, n)"),
    ),
  )
  let t1760 = @tactics.first_x_assum(fn(
    x1759 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t1758(x1759))
  })
  let t1756 = @simp.asm_simp_tac(@list.List([]))
  let t1755 = @meson.asm_meson_tac(@list.List([@prime.coprime_prime_eq()]))
  let t1754 = @simp.rewrite_tac(@list.List([@prime.index_eq_0()]))
  let t1753 = @simp.rewrite_tac(
    @list.List([@arith.eq_add_lcancel_0(), @arith.eq_add_rcancel_0()]),
  )
  let t1757 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_simp_tac(
            @list.List([
              @prime.index_mul(),
              @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)")),
            ]),
          ),
          t1753,
        ),
        t1754,
      ),
      t1755,
    ),
    t1756,
  ])
  let t1752 = @tactics.subgoal_then(
    @term_syntax.parse_term("(∀ p : Num, prime(p) && divides(p, (a : Num)) → index(p, a * (b : Num)) == index(p, a)) && (∀ p : Num, prime(p) && divides(p, b) → index(p, a * b) == index(p, b))"),
    @tactics.strip_assume_tac,
  )
  let t1751 = @list.List([
    @simp.rewrite_tac(@list.List([@int.cong_v1(), @arith.mod_exp_mod()])),
    @tactics.all_tac,
  ])
  let t1750 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((a : Num), (b : Num))) → op_eq_eq((x : Num), (y : Num), mod(a * b)) == (op_eq_eq(x, y, mod(a)) && op_eq_eq(x, y, mod(b)))"),
      ),
    ]),
  )
  let t1749 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => op_eq_eq(EXP(x, (k : Num)), (z : Num), mod((b : Num)))"),
  )
  let t1748 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Num) => op_eq_eq(EXP(x, (k : Num)), (z : Num), mod((a : Num)))"),
  )
  let t1747 = @tactics.match_mp_tac(@pocklington.chinese_remainder_count())
  let t1746 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@arith.mult_clauses()]),
        @term_syntax.parse_term("(if (p : Bool) && (q : Bool) { (a : Num) * (b : Num) } else { 0 }) == (if p { a } else { 0 }) * (if q { b } else { 0 })"),
      ),
    ]),
  )
  let t1745 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∀ p : Num, prime(p) && ((P : (Num) -> Bool)(p) || (Q : (Num) -> Bool)(p)) → (R : (Num) -> Bool)(p)) == ((∀ p : Num, prime(p) && P(p) → R(p)) && (∀ p : Num, prime(p) && Q(p) → R(p)))"),
      ),
    ]),
  )
  let t1743 = @tactics.disch_then(fn(
    x1740 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1741 = @tactics.subst1_tac(x1740)
    fn(
      x1742 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1741(x1742)
    }
  })
  let t1737 = @meson.asm_meson_tac(@list.List([@prime.coprime_prime()]))
  let t1736 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1738 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("DISJOINT((s : (_) -> Bool), (t : (_) -> Bool)) == (∀ x : _, !(IN(x, s) && IN(x, t)))"),
          ),
        ]),
      ),
      t1736,
    ),
    t1737,
  )
  let t1735 = @sets.set_tac(@list.List([]))
  let t1734 = @simp.asm_simp_tac(
    @list.List([
      @prime.finite_divisors(),
      @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)")),
    ]),
  )
  let t1739 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.conj_tac,
          @tactics.match_mp_tac(
            @meson.meson(
              @list.List([@sets.finite_subset()]),
              @term_syntax.parse_term("FINITE({(d : Num) | divides(d, (a : Num))}) && SUBSET({(p : Num) | prime(p) && divides(p, a)}, {(d : Num) | divides(d, a)}) → FINITE({(p : Num) | prime(p) && divides(p, a)})"),
            ),
          ),
        ),
        t1734,
      ),
      t1735,
    ),
    t1738,
  ])
  let t1744 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@theorems.conj_assoc()])),
        @tactics.conj_tac,
      ),
      t1739,
    ),
    t1743,
  ])
  let t1727 = @drule.part_match(
    fn(x1726 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1726))
    },
    @drule.match_mp(@iterate.iterate_union())(@iterate.monoidal_mul()),
  )
  let t1722 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && ((Q : (_) -> Bool)(x) || (R : (_) -> Bool)(x))} == UNION({(x : _) | P(x) && Q(x)}, {(x : _) | P(x) && R(x)})"),
      ),
    ]),
  )
  let t1721 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_divprod_eq()]),
        @term_syntax.parse_term("(prime((p : Num)) && divides(p, (a : Num) * (b : Num))) == (prime(p) && (divides(p, a) || divides(p, b)))"),
      ),
    ]),
  )
  let t1720 = @simp.asm_rewrite_tac(@list.List([]))
  let t1719 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((b : Num), (z : Num)))"))
  let t1718 = @simp.asm_rewrite_tac(@list.List([]))
  let t1717 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((a : Num), (z : Num)))"))
  let t1716 = @simp.rewrite_tac(@list.List([@prime.coprime_lmul()]))
  let t1715 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1714 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((b : Num))"))
  let t1713 = @simp.asm_rewrite_tac(@list.List([]))
  let t1712 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((a : Num))"))
  let t1711 = @simp.rewrite_tac(@list.List([@arith.odd_mult()]))
  let t1710 = @term_syntax.parse_term("(b : Num)")
  let t1793 = @list.List([
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
                                                                    @tactics.map_every(
                                                                      @tactics.x_gen_tac,
                                                                      @list.List([
                                                                          @term_syntax.parse_term("(a : Num)"),
                                                                          t1710,
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    t1711,
                                                                  ),
                                                                  t1712,
                                                                ),
                                                                t1713,
                                                              ),
                                                              t1714,
                                                            ),
                                                            t1715,
                                                          ),
                                                          t1716,
                                                        ),
                                                        t1717,
                                                      ),
                                                      t1718,
                                                    ),
                                                    t1719,
                                                  ),
                                                  t1720,
                                                ),
                                                @tactics.strip_tac,
                                              ),
                                              t1721,
                                            ),
                                            t1722,
                                          ),
                                          fn(
                                            x1733 : (
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
                                            (fn(
                                              x1732 : (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
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
                                              (fn(
                                                x1730 : @kernel.Term,
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
                                              ) raise) raise {
                                                (fn(
                                                  x1729 : @kernel.Term,
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
                                                ) raise) raise {
                                                  (fn(
                                                    x1728 : @kernel.Term,
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
                                                  ) raise) raise {
                                                    (fn(
                                                      x1723 : @kernel.Thm,
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
                                                            (
                                                              Int64,
                                                              @kernel.Term,
                                                            ),
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
                                                            (
                                                              String,
                                                              @kernel.Thm,
                                                            ),
                                                          ],
                                                          @kernel.Term,
                                                        ),
                                                      ],
                                                      (
                                                        (
                                                          @list.List[
                                                            (
                                                              Int64,
                                                              @kernel.Term,
                                                            ),
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
                                                    ) raise) raise {
                                                      let s1724 = @tactics.mp_tac(
                                                        x1723,
                                                      )
                                                      fn(
                                                        x1725 : (
                                                          @list.List[
                                                            (
                                                              String,
                                                              @kernel.Thm,
                                                            ),
                                                          ],
                                                          @kernel.Term,
                                                        ),
                                                      ) -> (
                                                        (
                                                          @list.List[
                                                            @kernel.Term,
                                                          ],
                                                          (
                                                            @list.List[
                                                              (
                                                                Int64,
                                                                @kernel.Term,
                                                              ),
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
                                                              (
                                                                String,
                                                                @kernel.Thm,
                                                              ),
                                                            ],
                                                            @kernel.Term,
                                                          ),
                                                        ],
                                                        (
                                                          (
                                                            @list.List[
                                                              (
                                                                Int64,
                                                                @kernel.Term,
                                                              ),
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
                                                          @list.List[
                                                            @kernel.Thm,
                                                          ],
                                                        ) -> @kernel.Thm raise,
                                                      ) raise {
                                                        s1724(x1725)
                                                      }
                                                    })(t1727(x1728))
                                                  })(@equal.lhand(x1729))
                                                })(@kernel.rand(x1730))
                                              })(
                                                (fn(
                                                  x1731 : (
                                                    @list.List[
                                                      (String, @kernel.Thm),
                                                    ],
                                                    @kernel.Term,
                                                  ),
                                                ) -> @kernel.Term raise {
                                                  x1731.1
                                                })(x1732),
                                              )
                                            })(x1733)(x1733)
                                          },
                                        ),
                                        @tactics.ants_tac,
                                      ),
                                      t1744,
                                    ),
                                    t1745,
                                  ),
                                  t1746,
                                ),
                                t1747,
                              ),
                              t1748,
                            ),
                            t1749,
                          ),
                          t1750,
                        ),
                        @tactics.conj_tac,
                      ),
                      t1751,
                    ),
                    t1752,
                  ),
                  t1757,
                ),
                @tactics.conj_tac,
              ),
              t1760,
            ),
            @class.cond_cases_tac,
          ),
          t1761,
        ),
        t1762,
      ),
      t1763,
    ),
    t1792,
  ])
  let t1709 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t1707 = @term_syntax.parse_term("(n : Num)")
  let t1708 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1707)
  let t1706 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(!((n : Num) == 0) && !(n == 1)) == (1 < n)")),
    ]),
  )
  let t1705 = @simp.gen_rewrite_tac(
    fn(
      x1704 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1704
    },
    @list.List([@theorems.imp_imp()]),
  )
  let t1701 = @term_syntax.parse_term("!((n : Num) == 0)")
  let t1702 = @tactics.map_every(
    fn(
      x1698 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1699 = @tactics.undisch_tac(x1698)
      fn(
        x1700 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1699(x1700)
      }
    },
    @list.List([@term_syntax.parse_term("!((n : Num) == 1)"), t1701]),
  )
  let t1697 = @simp.rewrite_tac(
    @list.List([
      @pocklington.cong_mod_1(),
      @iterate.neutral_mul(),
      @sets.has_size_numseg_lt(),
    ]),
  )
  let t1696 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.empty_gspec(),
      @drule.match_mp(@iterate.iterate_clauses())(@iterate.monoidal_mul()),
    ]),
  )
  let t1703 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            @meson.meson(
              @list.List([@prime.prime_1(), @int.divides_one()]),
              @term_syntax.parse_term("!(prime((p : Num)) && divides(p, 1))"),
            ),
          ]),
        ),
        t1696,
      ),
      t1697,
    ),
    t1702,
  ])
  let t1695 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1694 = @simp.asm_rewrite_tac(@list.List([@arith.odd()]))
  let t1693 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1692 = @simp.asm_rewrite_tac(@list.List([]))
  let t1691 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1690 = @simp.rewrite_tac(@list.List([@iterate.nproduct()]))
  let t1688 = @term_syntax.parse_term("(k : Num)")
  let t1689 = @term_syntax.parse_term("(z : Num)")
  let t1794 = @tactics.thenl(
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
                            @tactics.map_every(
                              @tactics.x_gen_tac,
                              @list.List([
                                @term_syntax.parse_term("(n : Num)"),
                                t1689,
                                t1688,
                              ]),
                            ),
                            t1690,
                          ),
                          t1691,
                        ),
                        t1692,
                      ),
                      t1693,
                    ),
                    t1694,
                  ),
                  t1695,
                ),
                t1703,
              ),
              t1705,
            ),
            t1706,
          ),
          t1708,
        ),
        t1709,
      ),
      @tactics.conj_tac,
    ),
    t1793,
  )
  count_roots_modulo_odd_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, ODD(n) && coprime((n, a)) && !(k == 0) → HAS_SIZE({(x : Num) | x < n && op_eq_eq(EXP(x, k), a, mod(n))}, if (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(EXP(a, DIV(EXP(p, index(p, n) - 1) * (p - 1), gcd((k, EXP(p, index(p, n) - 1) * (p - 1))))), 1, mod(EXP(p, index(p, n))))) { nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => gcd((k, EXP(p, index(p, n) - 1) * (p - 1)))) } else { 0 })"),
      t1794,
    ),
  )
}

///|
let count_roots_modulo_odd_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_ODD_GEN",
)

///|
/// `COUNT_ROOTS_MODULO_ODD_GEN`
pub fn count_roots_modulo_odd_gen() -> @kernel.Thm {
  count_roots_modulo_odd_gen_c.get()
}

///|
/// COUNT_ROOTS_MODULO_ODD_ALT_GEN
fn step_50() -> Unit raise {
  let t1849 = @drule.match_mp(@prime.prime_ge_2())
  let t1851 = @tactics.first_x_assum(fn(
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
  let t1845 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_eq_0(), @arith.mult_eq_0()]),
  )
  let t1844 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.not_le()), @prime.gcd_le()]),
  )
  let t1843 = @simp.asm_simp_tac(
    @list.List([@arith.div_eq_0(), @prime.gcd_zero()]),
  )
  let t1842 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@arith.odd()])),
  ])
  let t1841 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t1840 = @simp.asm_rewrite_tac(
    @list.List([@prime.divides_refl(), @prime.index_eq_0()]),
  )
  let t1839 = @simp.asm_simp_tac(
    @list.List([@class.not_imp(), @int.divides_one(), @prime.prime_divexp_eq()]),
  )
  let t1836 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("∀ p : Num, op_eq_eq((a : Num), 1, mod((n : Num))) → divides(p, a) && divides(p, n) → divides(p, 1)"),
    ),
  )
  let t1833 = @term_syntax.parse_term("(p : Num)")
  let t1838 = @tactics.disch_then(fn(
    x1837 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
        x1830 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1831 = @tactics.mp_tac(x1830)
        fn(
          x1832 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1831(x1832)
        }
      })(((x1834 : @kernel.Thm) => @bool.spec(t1833, x1834))(x1835))
    })(t1836(x1837))
  })
  let t1829 = @simp.asm_rewrite_tac(@list.List([]))
  let t1828 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1827 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1826 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t1824 = @simp.gen_rewrite_rule(
    fn(
      x1821 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1822 = @equal.rand_conv(x1821)
      fn(x1823 : @kernel.Term) -> @kernel.Thm raise { s1822(x1823) }
    },
    @list.List([@prime.coprime_prime_eq()]),
  )
  let t1852 = @tactics.then_tac(
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
                                  @tactics.first_x_assum(fn(
                                    x1825 : @kernel.Thm,
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
                                        @list.List[(@kernel.Term, @kernel.Term)],
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
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise) raise {
                                    (fn(
                                      x1818 : @kernel.Thm,
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
                                      let s1819 = @tactics.mp_tac(x1818)
                                      fn(
                                        x1820 : (
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
                                        s1819(x1820)
                                      }
                                    })(t1824(x1825))
                                  }),
                                  t1826,
                                ),
                                t1827,
                              ),
                              t1828,
                            ),
                            @tactics.strip_tac,
                          ),
                          t1829,
                        ),
                        t1838,
                      ),
                      t1839,
                    ),
                    t1840,
                  ),
                  t1841,
                ),
                @tactics.conj_tac,
              ),
              t1842,
            ),
            t1843,
          ),
          t1844,
        ),
        t1845,
      ),
      t1851,
    ),
    @int.arith_tac,
  )
  let t1817 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t1814 = @drule.match_mp(@pocklington.cong_coprime())
  let t1816 = @tactics.first_x_assum(fn(
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
  let t1810 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1853 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @sets.extension(),
              @sets.in_elim_thm(),
              @sets.not_in_empty(),
            ]),
          ),
          t1810,
        ),
        t1816,
      ),
      t1817,
    ),
    t1852,
  ])
  let t1854 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @meson.meson(
          @list.List([@sets.has_size_0()]),
          @term_syntax.parse_term("(s : (_) -> Bool) == {} && !(p : Bool) → HAS_SIZE(s, if p { (n : Num) } else { 0 })"),
        ),
      ),
      @tactics.conj_tac,
    ),
    t1853,
  )
  let t1809 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t1806 = @drule.match_mp(@pocklington.cong_coprime())
  let t1808 = @tactics.first_x_assum(fn(
    x1807 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1803 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1804 = @tactics.mp_tac(x1803)
      fn(
        x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1804(x1805)
      }
    })(t1806(x1807))
  })
  let t1802 = @simp.asm_rewrite_tac(@list.List([]))
  let t1801 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1800 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1799 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1798 = @simp.asm_rewrite_tac(@list.List([]))
  let t1796 = @term_syntax.parse_term("(k : Num)")
  let t1797 = @term_syntax.parse_term("(a : Num)")
  let t1855 = @list.List([
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
                          @tactics.mp_tac(
                            @bool.specl(
                              @list.List([
                                @term_syntax.parse_term("(n : Num)"),
                                t1797,
                                t1796,
                              ]),
                              count_roots_modulo_odd_gen(),
                            ),
                          ),
                          t1798,
                        ),
                        t1799,
                      ),
                      @tactics.ap_thm_tac,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t1800,
                ),
                t1801,
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t1802,
        ),
        t1808,
      ),
      t1809,
    ),
    t1854,
  ])
  let t1795 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((n : Num), (a : Num)))"))
  let t1856 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1795),
    t1855,
  )
  count_roots_modulo_odd_alt_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, ODD(n) && !(k == 0) → HAS_SIZE({(x : Num) | x < n && coprime((n, x)) && op_eq_eq(EXP(x, k), a, mod(n))}, if (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(EXP(a, DIV(EXP(p, index(p, n) - 1) * (p - 1), gcd((k, EXP(p, index(p, n) - 1) * (p - 1))))), 1, mod(EXP(p, index(p, n))))) { nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => gcd((k, EXP(p, index(p, n) - 1) * (p - 1)))) } else { 0 })"),
      t1856,
    ),
  )
}

///|
let count_roots_modulo_odd_alt_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_ODD_ALT_GEN",
)

///|
/// `COUNT_ROOTS_MODULO_ODD_ALT_GEN`
pub fn count_roots_modulo_odd_alt_gen() -> @kernel.Thm {
  count_roots_modulo_odd_alt_gen_c.get()
}

///|
/// POWER_RESIDUE_MODULO_ODD
fn step_51() -> Unit raise {
  let t1887 = @meson.asm_meson_tac(@list.List([@arith.odd()]))
  let t1886 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t1885 = @simp.rewrite_tac(@list.List([@arith.mod_exp_mod()]))
  let t1884 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t1883 = @simp.asm_rewrite_tac(@list.List([@arith.mod_lt_eq()]))
  let t1882 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (n : Num))"))
  let t1879 = @term_syntax.parse_term("(x : Num)")
  let t1881 = @tactics.disch_then((x1880 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1879, x1880)
  })
  let t1878 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.not_exists_thm()), @class.contrapos_thm()]),
  )
  let t1888 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @sets.has_size_0(),
                      @sets.extension(),
                      @sets.in_elim_thm(),
                      @sets.not_in_empty(),
                    ]),
                  ),
                  t1878,
                ),
                t1881,
              ),
              t1882,
            ),
            t1883,
          ),
          t1884,
        ),
        t1885,
      ),
      t1886,
    ),
    t1887,
  )
  let t1877 = @simp.asm_simp_tac(
    @list.List([@arith.mult_eq_0(), @prime.gcd_zero()]),
  )
  let t1876 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(@iterate.monoidal_mul()),
      @iterate.neutral_mul(),
    ]),
  )
  let t1875 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1872 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t1873 = @tactics.spec_tac(
    @term_syntax.parse_term("{(p : Num) | prime(p) && divides(p, (n : Num))}"),
    t1872,
  )
  let t1871 = @meson.asm_meson_tac(@list.List([@arith.odd()]))
  let t1874 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@prime.finite_special_divisors()),
      t1871,
    ),
    t1873,
  ])
  let t1870 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE({(p : Num) | prime(p) && divides(p, (n : Num))})"),
    fn(
      x1867 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1868 = @tactics.mp_tac(x1867)
      fn(
        x1869 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1868(x1869)
      }
    },
  )
  let t1866 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t1865 = @simp.rewrite_tac(
    @list.List([
      @sets.has_size(),
      @sets.empty_gspec(),
      @sets.card_clauses(),
      @sets.finite_empty(),
    ]),
  )
  let t1864 = @simp.asm_rewrite_tac(@list.List([]))
  let t1863 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1889 = @list.List([
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
                          @simp.gen_rewrite_tac(
                            fn(
                              x1862 : (@kernel.Term) -> @kernel.Thm raise,
                            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                              x1862
                            },
                            @list.List([@equal.gsym(@class.contrapos_thm())]),
                          ),
                          t1863,
                        ),
                        @tactics.disch_tac,
                      ),
                      t1864,
                    ),
                    t1865,
                  ),
                  t1866,
                ),
                t1870,
              ),
              t1874,
            ),
            t1875,
          ),
          t1876,
        ),
        t1877,
      ),
      @int.arith_tac,
    ),
    t1888,
  ])
  let t1861 = @simp.asm_rewrite_tac(@list.List([]))
  let t1860 = @simp.asm_rewrite_tac(@list.List([@iterate.nproduct()]))
  let t1857 = @term_syntax.parse_term("(k : Num)")
  let t1858 = @term_syntax.parse_term("(a : Num)")
  let t1859 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1858, t1857]),
      count_roots_modulo_odd_gen(),
    ),
  )
  let t1890 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1859),
          t1860,
        ),
        @class.cond_cases_tac,
      ),
      t1861,
    ),
    t1889,
  )
  power_residue_modulo_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, ODD(n) && !(k == 0) && coprime((n, a)) → (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))) == (∀ p : Num, prime(p) && divides(p, n) → op_eq_eq(EXP(a, DIV(EXP(p, index(p, n) - 1) * (p - 1), gcd((k, EXP(p, index(p, n) - 1) * (p - 1))))), 1, mod(EXP(p, index(p, n)))))"),
      t1890,
    ),
  )
}

///|
let power_residue_modulo_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_MODULO_ODD",
)

///|
/// `POWER_RESIDUE_MODULO_ODD`
pub fn power_residue_modulo_odd() -> @kernel.Thm {
  power_residue_modulo_odd_c.get()
}

///|
/// COUNT_ROOTS_MODULO_PRIMITIVE_ALT
fn step_52() -> Unit raise {
  let t1900 = @sets.set_tac(@list.List([]))
  let t1899 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t1901 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
        t1899,
      ),
      @tactics.ap_term_tac,
    ),
    t1900,
  )
  let t1898 = @simp.simp_tac(
    @list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]),
  )
  let t1902 = @list.List([
    @tactics.then_tac(
      @simp.once_rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"),
          ),
        ]),
      ),
      t1898,
    ),
    t1901,
  ])
  let t1897 = @simp.rewrite_tac(
    @list.List([
      @prime.gcd_0(),
      @arith.exp(),
      @pocklington.cong_refl(),
      @sets.has_size(),
    ]),
  )
  let t1896 = @simp.asm_rewrite_tac(@list.List([]))
  let t1895 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1894 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_one(), @pocklington.cong_refl()]),
  )
  let t1891 = @term_syntax.parse_term("(k : Num)")
  let t1892 = @term_syntax.parse_term("1")
  let t1893 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1892, t1891]),
      count_roots_modulo_primitive_gen_alt(),
    ),
  )
  let t1903 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @tactics.disch_tac,
                ),
                t1893,
              ),
              t1894,
            ),
            t1895,
          ),
          t1896,
        ),
        t1897,
      ),
      @tactics.conj_tac,
    ),
    t1902,
  )
  count_roots_modulo_primitive_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) && (∃ x : Num, order(n, x) == phi(n)) → HAS_SIZE({(x : Num) | x < n && coprime((n, x)) && op_eq_eq(EXP(x, k), 1, mod(n))}, gcd((k, phi(n))))"),
      t1903,
    ),
  )
}

///|
let count_roots_modulo_primitive_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_PRIMITIVE_ALT",
)

///|
/// `COUNT_ROOTS_MODULO_PRIMITIVE_ALT`
pub fn count_roots_modulo_primitive_alt() -> @kernel.Thm {
  count_roots_modulo_primitive_alt_c.get()
}

///|
/// COUNT_ROOTS_MODULO_PRIMITIVE
fn step_53() -> Unit raise {
  let t1922 = @simp.rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1921 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t1918 = @drule.match_mp(
    @int.number_rule(@term_syntax.parse_term("op_eq_eq((x : Num), 1, mod((n : Num))) → coprime((x, n))")),
  )
  let t1920 = @tactics.first_x_assum(fn(
    x1919 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1915 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1916 = @tactics.mp_tac(x1915)
      fn(
        x1917 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1916(x1917)
      }
    })(t1918(x1919))
  })
  let t1914 = @simp.asm_rewrite_tac(@list.List([]))
  let t1913 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1912 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t1911 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1910 = @simp.asm_rewrite_tac(@list.List([]))
  let t1908 = @term_syntax.parse_term("(k : Num)")
  let t1909 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1908]),
      count_roots_modulo_primitive_alt(),
    ),
  )
  let t1907 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x1904 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1905 = @tactics.assume_tac(x1904)
      fn(
        x1906 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1905(x1906)
      }
    }),
  )
  let t1923 = @tactics.then_tac(
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
                              t1907,
                            ),
                            t1909,
                          ),
                          t1910,
                        ),
                        t1911,
                      ),
                      @tactics.ap_thm_tac,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t1912,
                ),
                t1913,
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t1914,
        ),
        t1920,
      ),
      t1921,
    ),
    t1922,
  )
  count_roots_modulo_primitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) && !(k == 0) && (∃ x : Num, order(n, x) == phi(n)) → HAS_SIZE({(x : Num) | x < n && op_eq_eq(EXP(x, k), 1, mod(n))}, gcd((k, phi(n))))"),
      t1923,
    ),
  )
}

///|
let count_roots_modulo_primitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_PRIMITIVE",
)

///|
/// `COUNT_ROOTS_MODULO_PRIMITIVE`
pub fn count_roots_modulo_primitive() -> @kernel.Thm {
  count_roots_modulo_primitive_c.get()
}

///|
/// COUNT_ROOTS_MODULO_ODD_ALT
fn step_54() -> Unit raise {
  let t1927 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_one(), @pocklington.cong_refl(), @prime.coprime_1()]),
  )
  let t1924 = @term_syntax.parse_term("(k : Num)")
  let t1925 = @term_syntax.parse_term("1")
  let t1926 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1925, t1924]),
      count_roots_modulo_odd_alt_gen(),
    ),
  )
  let t1928 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1926),
    t1927,
  )
  count_roots_modulo_odd_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, ODD(n) && !(k == 0) → HAS_SIZE({(x : Num) | x < n && coprime((n, x)) && op_eq_eq(EXP(x, k), 1, mod(n))}, nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => gcd((k, EXP(p, index(p, n) - 1) * (p - 1)))))"),
      t1928,
    ),
  )
}

///|
let count_roots_modulo_odd_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_ODD_ALT",
)

///|
/// `COUNT_ROOTS_MODULO_ODD_ALT`
pub fn count_roots_modulo_odd_alt() -> @kernel.Thm {
  count_roots_modulo_odd_alt_c.get()
}

///|
/// COUNT_ROOTS_MODULO_ODD
fn step_55() -> Unit raise {
  let t1932 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_one(), @pocklington.cong_refl(), @prime.coprime_1()]),
  )
  let t1929 = @term_syntax.parse_term("(k : Num)")
  let t1930 = @term_syntax.parse_term("1")
  let t1931 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1930, t1929]),
      count_roots_modulo_odd_gen(),
    ),
  )
  let t1933 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1931),
    t1932,
  )
  count_roots_modulo_odd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, ODD(n) && !(k == 0) → HAS_SIZE({(x : Num) | x < n && op_eq_eq(EXP(x, k), 1, mod(n))}, nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => gcd((k, EXP(p, index(p, n) - 1) * (p - 1)))))"),
      t1933,
    ),
  )
}

///|
let count_roots_modulo_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COUNT_ROOTS_MODULO_ODD",
)

///|
/// `COUNT_ROOTS_MODULO_ODD`
pub fn count_roots_modulo_odd() -> @kernel.Thm {
  count_roots_modulo_odd_c.get()
}

///|
/// POWER_RESIDUE_EXISTS
fn step_56() -> Unit raise {
  let t1938 = @simp.rewrite_tac(
    @list.List([@arith.exp_one(), @pocklington.cong_refl()]),
  )
  let t1937 = @list.List([
    @int.asm_arith_tac,
    @tactics.exists_tac(@term_syntax.parse_term("1")),
  ])
  let t1936 = @simp.rewrite_tac(@list.List([@prime.coprime_1()]))
  let t1939 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t1936),
        @tactics.conj_tac,
      ),
      t1937,
    ),
    t1938,
  )
  let t1935 = @simp.asm_rewrite_tac(
    @list.List([
      @prime.coprime_1(),
      @pocklington.cong_mod_1(),
      @calc_num.arith(),
    ]),
  )
  let t1940 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1935),
    t1939,
  ])
  let t1934 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1941 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1934),
    t1940,
  )
  power_residue_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, !(n == 0) → (∃ a : Num, a < n && coprime((n, a)) && (∃ x : Num, op_eq_eq(EXP(x, k), a, mod(n))))"),
      t1941,
    ),
  )
}

///|
let power_residue_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POWER_RESIDUE_EXISTS",
)

///|
/// `POWER_RESIDUE_EXISTS`
pub fn power_residue_exists() -> @kernel.Thm {
  power_residue_exists_c.get()
}

///|
/// QUADRATIC_NONRESIDUE_EXISTS
fn step_57() -> Unit raise {
  let t2050 = @meson.asm_meson_tac(@list.List([@prime.prime_0()]))
  let t2049 = @simp.rewrite_tac(
    @list.List([
      @pocklington.phi_eq_0(),
      @arith.exp_eq_0(),
      @calc_num.arith_eq(),
    ]),
  )
  let t2048 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(DIV((n : Num), 2) < n) == !(n == 0)"))]),
  )
  let t2047 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@pocklington.phi_alt())]),
  )
  let t2046 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t2045 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t2044 = @tactics.disch_then(fn(
    x2043 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x2040 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s2041 = @tactics.subst1_tac(x2040)
      fn(
        x2042 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s2041(x2042)
      }
    })(@bool.conjunct2(x2043))
  })
  let t2039 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.odd_prime(), @prime.prime_odd()])),
    @tactics.all_tac,
  ])
  let t2038 = @simp.asm_rewrite_tac(
    @list.List([primitive_root_exists(), @sets.has_size()]),
  )
  let t2037 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("EXP((p : Num), (k : Num))"),
      count_quadratic_residues_modulo_primitive(),
    ),
  )
  let t2035 = @tactics.match_mp_tac(@arith.lt_imp_ne())
  let t2036 = @list.List([@sets.set_tac(@list.List([])), t2035])
  let t2034 = @tactics.match_mp_tac(@sets.card_psubset_imp())
  let t2033 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("PSUBSET({(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)}, {(x : _) | P(x) && Q(x)}) → (∃ a : _, P(a) && Q(a) && !R(a))"),
    ),
  )
  let t2051 = @tactics.then_tac(
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
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.repeat_tac(@tactics.disch_tac),
                                t2033,
                              ),
                              t2034,
                            ),
                            @tactics.conj_tac,
                          ),
                          t2036,
                        ),
                        t2037,
                      ),
                      t2038,
                    ),
                    @tactics.ants_tac,
                  ),
                  t2039,
                ),
                t2044,
              ),
              t2045,
            ),
            t2046,
          ),
          t2047,
        ),
        t2048,
      ),
      t2049,
    ),
    t2050,
  )
  let t2030 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2029 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2028 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let t2026 = @term_syntax.parse_term("(k : Num)")
  let t2027 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("3"), t2026]),
      quadratic_residue_modulo_power_2(),
    ),
  )
  let t2025 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2024 = @tactics.conv_tac(@equal.once_depth_conv(@prime.coprime_conv))
  let t2023 = @simp.rewrite_tac(@list.List([@prime.coprime_lexp()]))
  let t2022 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@prime.coprime_refl()]),
      @term_syntax.parse_term("!((a : Num) == 1) && coprime(((n : Num), a)) && (P : (Num, Num) -> Bool)(a, n) → !(a == n) && coprime((n, a)) && P(a, n)"),
    ),
  )
  let t2021 = @simp.asm_rewrite_tac(@list.List([@arith.lt_le()]))
  let t2031 = @tactics.then_tac(
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
                        @tactics.disch_tac,
                        @tactics.exists_tac(@term_syntax.parse_term("3")),
                      ),
                      t2021,
                    ),
                    t2022,
                  ),
                  t2023,
                ),
                t2024,
              ),
              t2025,
            ),
            t2027,
          ),
          t2028,
        ),
        t2029,
      ),
      t2030,
    ),
    @int.asm_arith_tac,
  )
  let t2020 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2019 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t2017 = @term_syntax.parse_term("(n : Num)")
  let t2018 = @tactics.spec_tac(@term_syntax.parse_term("MOD((n : Num), 4)"), t2017)
  let t2016 = @tactics.mp_tac(
    @int.arith_rule(@term_syntax.parse_term("MOD((n : Num), 4) < 4")),
  )
  let t2015 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@arith.mod_exp_mod())]),
  )
  let t2014 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2013 = @simp.rewrite_tac(
    @list.List([@int.cong_v1(), @class.not_exists_thm()]),
  )
  let t2012 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2011 = @tactics.conv_tac(@equal.once_depth_conv(@prime.coprime_conv))
  let t2032 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.exists_tac(@term_syntax.parse_term("3")),
                      t2011,
                    ),
                    t2012,
                  ),
                  t2013,
                ),
                t2014,
              ),
              t2015,
            ),
            t2016,
          ),
          t2018,
        ),
        t2019,
      ),
      t2020,
    ),
    t2031,
  ])
  let t2010 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t2009 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 2"))
  let t2008 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t2007 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1"))
  let t2006 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t2005 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2052 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.asm_rewrite_tac(@list.List([@prime.prime_2()])),
                  t2005,
                ),
                t2006,
              ),
              t2007,
            ),
            t2008,
          ),
          t2009,
        ),
        t2010,
      ),
      t2032,
    ),
    t2051,
  ])
  let t2004 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t2002 = @term_syntax.parse_term("(k : Num)")
  let t2003 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t2002]),
  )
  let t2000 = @tactics.conv_tac(@int.number_rule)
  let t1999 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((u : Num), (t : Num), mod((b : Num)))"))
  let t1998 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1997 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.not_exists_thm()), @class.contrapos_thm()]),
  )
  let t1994 = @simp.gen_rewrite_rule(
    fn(
      x1993 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1993
    },
    @list.List([@class.not_exists_thm()]),
  )
  let t1996 = @tactics.first_x_assum(fn(
    x1995 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1990 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1991 = @tactics.mp_tac(x1990)
      fn(
        x1992 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1991(x1992)
      }
    })(t1994(x1995))
  })
  let t1989 = @list.List([
    @meson.asm_meson_tac(@list.List([@pocklington.cong_coprime()])),
    @tactics.all_tac,
  ])
  let t1988 = @simp.asm_simp_tac(
    @list.List([
      @int.number_rule(@term_syntax.parse_term("op_eq_eq((u : Num), 1, mod((a : Num))) → coprime((a, u))")),
    ]),
  )
  let t1987 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_lmul()]))
  let t1986 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Num)"))
  let t1985 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1984 = @list.List([
    @int.asm_arith_tac,
    @tactics.disch_then(fn(
      x1983 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s1981 = @tactics.mp_tac(x1980)
        fn(
          x1982 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1981(x1982)
        }
      })(@bool.existence(x1983))
    }),
  ])
  let t1979 = @simp.asm_rewrite_tac(@list.List([]))
  let t1975 = @term_syntax.parse_term("(t : Num)")
  let t1976 = @term_syntax.parse_term("1")
  let t1977 = @term_syntax.parse_term("(b : Num)")
  let t1978 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t1977, t1976, t1975]),
      @pocklington.chinese_remainder_unique(),
    ),
  )
  let t1974 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1973 = @tactics.disch_then(fn(
    x1972 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1969 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1970 = @tactics.mp_tac(x1969)
      fn(
        x1971 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1970(x1971)
      }
    })(@bool.conjunct2(x1972))
  })
  let t1968 = @tactics.replicate_tac(
    3,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x1962 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1963 = @tactics.assume_tac(x1962)
          fn(
            x1964 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1963(x1964)
          }
        },
        fn(
          x1965 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1966 = @tactics.mp_tac(x1965)
          fn(
            x1967 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1966(x1967)
          }
        },
      ),
    ),
  )
  let t1958 = @term_syntax.parse_term("(b : Num)")
  let t1959 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : Num)"), t1958]),
  )
  let t1957 = @meson.meson_tac(@list.List([]))
  let t1960 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.mult_sym(), @prime.coprime_sym()])),
    t1957,
  )
  let t1956 = @meson.meson_tac(@list.List([@arith.lt_refl()]))
  let t1961 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@prime.coprime_refl()])),
      t1956,
    ),
    t1960,
    t1959,
  ])
  let t1955 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2001 = @list.List([
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
                                                  @tactics.thenl(
                                                    @tactics.then_tac(
                                                      @tactics.match_mp_tac(
                                                        @arith.wlog_lt(),
                                                      ),
                                                      t1955,
                                                    ),
                                                    t1961,
                                                  ),
                                                  @tactics.disch_tac,
                                                ),
                                                t1968,
                                              ),
                                              t1973,
                                            ),
                                            @tactics.ants_tac,
                                          ),
                                          @list.List([
                                            @int.asm_arith_tac, @tactics.all_tac,
                                          ]),
                                        ),
                                        t1974,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    t1978,
                                  ),
                                  t1979,
                                ),
                                @tactics.ants_tac,
                              ),
                              t1984,
                            ),
                            t1985,
                          ),
                          t1986,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1987,
                    ),
                    t1988,
                  ),
                  @tactics.conj_tac,
                ),
                t1989,
              ),
              t1996,
            ),
            t1997,
          ),
          t1998,
        ),
        t1999,
      ),
      t2000,
    ),
    @tactics.all_tac,
  ])
  let t1954 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1953 = @tactics.match_mp_tac(@prime.induct_coprime_alt())
  let t1949 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1948 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1947 = @simp.rewrite_tac(
    @list.List([
      @prime.coprime_0(),
      @prime.coprime_1(),
      @int.cong_v1(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1946 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t1950 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @class.not_exists_thm(),
              @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)")),
            ]),
          ),
          t1946,
        ),
        t1947,
      ),
      t1948,
    ),
    t1949,
  )
  let t1945 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1944 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1943 = @simp.rewrite_tac(
    @list.List([@prime.coprime_1(), @int.cong_v1()]),
  )
  let t1951 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.arith_rule(@term_syntax.parse_term("((a : Num) < 1) == (a == 0)")),
              @theorems.unwind_thm2(),
            ]),
          ),
          t1943,
        ),
        t1944,
      ),
      t1945,
    ),
    t1950,
  ])
  let t1942 = @simp.asm_rewrite_tac(@list.List([@arith.lt()]))
  let t1952 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @int.arith_rule(
                  @term_syntax.parse_term("!(3 <= (n : Num)) == (n == 0 || n == 1 || n == 2)"),
                ),
              ]),
            ),
            @tactics.gen_tac,
          ),
          @tactics.strip_tac,
        ),
        t1942,
      ),
      t1951,
    ),
    @tactics.all_tac,
  ])
  let t2053 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([
                        @theorems.forall_and_thm(),
                        @class.taut(
                          @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((!q → !p) && (q → p))"),
                        ),
                      ]),
                    ),
                    @tactics.conj_tac,
                  ),
                  t1952,
                ),
                t1953,
              ),
              t1954,
            ),
            @tactics.conj_tac,
          ),
          t2001,
        ),
        t2003,
      ),
      t2004,
    ),
    t2052,
  )
  quadratic_nonresidue_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (∃ a : Num, a < n && coprime((n, a)) && !(∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n)))) == (3 <= n)"),
      t2053,
    ),
  )
}

///|
let quadratic_nonresidue_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QUADRATIC_NONRESIDUE_EXISTS",
)

///|
/// `QUADRATIC_NONRESIDUE_EXISTS`
pub fn quadratic_nonresidue_exists() -> @kernel.Thm {
  quadratic_nonresidue_exists_c.get()
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
}
