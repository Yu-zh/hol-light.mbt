// Translated from upstream Library/multiplicative.ml; edit this file directly.

///|
/// multiplicative
fn step_1() -> Unit raise {
  multiplicative_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(multiplicative : ((Num) -> Num) -> Bool)((f : (Num) -> Num)) == (f(1) == 1 && (∀ m : Num, ∀ n : Num, coprime((m, n)) → f(m * n) == f(m) * f(n)))"),
    ),
  )
}

///|
let multiplicative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multiplicative")

///|
/// `multiplicative`
pub fn multiplicative() -> @kernel.Thm {
  multiplicative_c.get()
}

///|
/// MULTIPLICATIVE_1
fn step_2() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([multiplicative()]))
  multiplicative_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Num, multiplicative(f) → f(1) == 1"), t1),
  )
}

///|
let multiplicative_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_1",
)

///|
/// `MULTIPLICATIVE_1`
pub fn multiplicative_1() -> @kernel.Thm {
  multiplicative_1_c.get()
}

///|
/// MULTIPLICATIVE
fn step_3() -> Unit raise {
  let t10 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_sym(),
      @prime.coprime_0(),
      @int.divides_one(),
      @arith.mult_clauses(),
    ]),
  )
  let t9 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses()]))
  let t8 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t7 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t6 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses()]))
  let t5 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t3 = @term_syntax.parse_term("(n : Num)")
  let t4 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t3]),
  )
  let t2 = @simp.asm_simp_tac(@list.List([]))
  let t11 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([multiplicative()])),
                      @tactics.eq_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t2,
                ),
                t4,
              ),
              t5,
            ),
            t6,
          ),
          t7,
        ),
        t8,
      ),
      t9,
    ),
    t10,
  )
  multiplicative_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("multiplicative((f : (Num) -> Num)) == (f(1) == 1 && (∀ m : Num, ∀ n : Num, !(m == 0) && !(n == 0) && coprime((m, n)) → f(m * n) == f(m) * f(n)))"),
      t11,
    ),
  )
}

///|
let multiplicative_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE",
)

///|
/// `MULTIPLICATIVE`
pub fn multiplicative_v1() -> @kernel.Thm {
  multiplicative_v1_c.get()
}

///|
/// MULTIPLICATIVE_IGNOREZERO
fn step_4() -> Unit raise {
  let t25 = @meson.asm_meson_tac(@list.List([@arith.mult_eq_0()]))
  let t24 = @simp.asm_rewrite_tac(@list.List([]))
  let t23 = @tactics.disch_then(fn(
    x21 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x21
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t20 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t19 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x13 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s14 = @tactics.assume_tac(x13)
          fn(
            x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s14(x15)
          }
        },
        fn(
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
          let s17 = @tactics.mp_tac(x16)
          fn(
            x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s17(x18)
          }
        },
      ),
    ),
  )
  let t12 = @simp.simp_tac(
    @list.List([multiplicative_v1(), @calc_num.arith_eq()]),
  )
  let t26 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t12),
            t19,
          ),
          t20,
        ),
        t23,
      ),
      t24,
    ),
    t25,
  )
  multiplicative_ignorezero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, (∀ n : Num, !(n == 0) → g(n) == f(n)) && multiplicative(f) → multiplicative(g)"),
      t26,
    ),
  )
}

///|
let multiplicative_ignorezero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_IGNOREZERO",
)

///|
/// `MULTIPLICATIVE_IGNOREZERO`
pub fn multiplicative_ignorezero() -> @kernel.Thm {
  multiplicative_ignorezero_c.get()
}

///|
/// MULTIPLICATIVE_EXPAND
fn step_5() -> Unit raise {
  let t83 = @meson.asm_meson_tac(
    @list.List([@prime.prime_0(), @prime.prime_1(), @arith.mult_clauses()]),
  )
  let t82 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((p : Num) <= 1) == (p == 0 || p == 1)")),
    ]),
  )
  let t81 = @simp.simp_tac(
    @list.List([@prime.index_exp(), @prime.index_refl()]),
  )
  let t80 = @simp.rewrite_tac(
    @list.List([@sets.sing_gspec(), @products.nproduct_sing()]),
  )
  let t84 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(
            @list.List([
              @meson.meson(
                @list.List([
                  @prime.prime_divexp_eq(),
                  @prime.divides_prime_prime(),
                ]),
                @term_syntax.parse_term("prime((p : Num)) → (prime((q : Num)) && divides(q, EXP(p, (k : Num)))) == (q == p && !(k == 0))"),
              ),
            ]),
          ),
          t80,
        ),
        t81,
      ),
      t82,
    ),
    t83,
  )
  let t79 = @meson.asm_meson_tac(@list.List([@prime.coprime_prime_eq()]))
  let t78 = @simp.rewrite_tac(@list.List([@prime.index_eq_0()]))
  let t77 = @simp.rewrite_tac(
    @list.List([@arith.eq_add_lcancel_0(), @arith.eq_add_rcancel_0()]),
  )
  let t76 = @simp.asm_simp_tac(
    @list.List([
      @prime.index_mul(),
      @int.arith_rule(@term_syntax.parse_term("1 < (p : Num) → !(p == 0)")),
    ]),
  )
  let t75 = @tactics.conv_tac(@equal.sym_conv)
  let t74 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t73 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t72 = @tactics.match_mp_tac(@products.nproduct_eq())
  let t70 = @tactics.disch_then(fn(
    x67 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s68 = @tactics.subst1_tac(x67)
    fn(
      x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s68(x69)
    }
  })
  let t66 = @meson.asm_meson_tac(@list.List([@prime.coprime_prime_eq()]))
  let t71 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.disjoint(),
          @sets.extension(),
          @sets.in_elim_thm(),
          @sets.in_inter(),
          @sets.not_in_empty(),
        ]),
      ),
      t66,
    ),
    t70,
  ])
  let t65 = @simp.asm_simp_tac(
    @list.List([
      @prime.finite_special_divisors(),
      @int.arith_rule(@term_syntax.parse_term("1 < (p : Num) → !(p == 0)")),
    ]),
  )
  let t59 = @drule.part_match(
    fn(x58 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x58))
    },
    @products.nproduct_union(),
  )
  let t54 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)} == UNION({(x : _) | P(x)}, {(x : _) | Q(x)})"),
      ),
    ]),
  )
  let t53 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_divprod_eq()]),
        @term_syntax.parse_term("(prime((p : Num)) && divides(p, (a : Num) * (b : Num))) == (prime(p) && divides(p, a) || prime(p) && divides(p, b))"),
      ),
    ]),
  )
  let t52 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
      let s50 = @tactics.subst1_tac(x49)
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
    }),
  )
  let t48 = @tactics.replicate_tac(
    3,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s43 = @tactics.assume_tac(x42)
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
        },
        fn(
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
          let s46 = @tactics.mp_tac(x45)
          fn(
            x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s46(x47)
          }
        },
      ),
    ),
  )
  let t41 = @simp.asm_simp_tac(@list.List([]))
  let t40 = @term_syntax.parse_term("(b : Num)")
  let t85 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                                              @tactics.map_every(
                                                @tactics.x_gen_tac,
                                                @list.List([
                                                  @term_syntax.parse_term("(a : Num)"),
                                                  t40,
                                                ]),
                                              ),
                                              t41,
                                            ),
                                            t48,
                                          ),
                                          t52,
                                        ),
                                        t53,
                                      ),
                                      t54,
                                    ),
                                    fn(
                                      x64 : (
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
                                        x63 : (
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
                                          x61 : @kernel.Term,
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
                                            x60 : @kernel.Term,
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
                                              x55 : @kernel.Thm,
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
                                              let s56 = @tactics.mp_tac(x55)
                                              fn(
                                                x57 : (
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
                                                s56(x57)
                                              }
                                            })(t59(x60))
                                          })(@kernel.rand(x61))
                                        })(
                                          (fn(
                                            x62 : (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ) -> @kernel.Term raise {
                                            x62.1
                                          })(x63),
                                        )
                                      })(x64)(x64)
                                    },
                                  ),
                                  t65,
                                ),
                                @tactics.ants_tac,
                              ),
                              t71,
                            ),
                            @tactics.binop_tac,
                          ),
                          t72,
                        ),
                        t73,
                      ),
                      t74,
                    ),
                    @tactics.strip_tac,
                  ),
                  @tactics.ap_term_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t75,
            ),
            t76,
          ),
          t77,
        ),
        t78,
      ),
      t79,
    ),
    t84,
  ])
  let t39 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t37 = @term_syntax.parse_term("(n : Num)")
  let t38 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t37)
  let t34 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_imp(),
      @int.arith_rule(@term_syntax.parse_term("(!((n : Num) == 0) && !(n == 1)) == (1 < n)")),
    ]),
  )
  let t33 = @term_syntax.parse_term("!((n : Num) == 0)")
  let t35 = @tactics.then_tac(
    @tactics.map_every(
      fn(
        x30 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s31 = @tactics.undisch_tac(x30)
        fn(
          x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s31(x32)
        }
      },
      @list.List([@term_syntax.parse_term("!((n : Num) == 1)"), t33]),
    ),
    t34,
  )
  let t29 = @simp.asm_rewrite_tac(
    @list.List([@sets.empty_gspec(), @iterate.nproduct_clauses()]),
  )
  let t36 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([
          @meson.meson(
            @list.List([@prime.prime_1(), @int.divides_one()]),
            @term_syntax.parse_term("!(prime((p : Num)) && divides(p, 1))"),
          ),
        ]),
      ),
      t29,
    ),
    t35,
  ])
  let t28 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t27 = @tactics.repeat_tac(@tactics.strip_tac)
  let t86 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([multiplicative()])),
                t27,
              ),
              t28,
            ),
            t36,
          ),
          t38,
        ),
        t39,
      ),
      @tactics.conj_tac,
    ),
    t85,
  )
  multiplicative_expand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ n : Num, multiplicative(f) && !(n == 0) → f(n) == nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => f(EXP(p, index(p, n))))"),
      t86,
    ),
  )
}

///|
let multiplicative_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_EXPAND",
)

///|
/// `MULTIPLICATIVE_EXPAND`
pub fn multiplicative_expand() -> @kernel.Thm {
  multiplicative_expand_c.get()
}

///|
/// MULTIPLICATIVE_CONVOLUTION
fn step_6() -> Unit raise {
  let t166 = @simp.asm_simp_tac(@list.List([]))
  let t163 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("coprime(((a : Num) * (b : Num), (c : Num) * (d : Num))) → coprime((c, a)) && coprime((d, b))"),
    ),
  )
  let t165 = @tactics.first_assum(fn(
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  })
  let t159 = @simp.asm_simp_tac(
    @list.List([@arith.div_mult(), @arith.mult_eq_0()]),
  )
  let t157 = @term_syntax.parse_term("(e : Num) * (e' : Num) * ((d : Num) * (d' : Num)) == d * e * (d' * e')")
  let t158 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.mult_ac())(t157)]),
  )
  let t156 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()])),
  )
  let t155 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(e' : Num)"))(fn(
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
      let s153 = @tactics.subst_all_tac(x152)
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
    }),
  )
  let t150 = @kernel.assume_rule(@term_syntax.parse_term("divides((e : Num), (m : Num))"))
  let t151 = @tactics.mp_tac(
    @simp.rewrite_rule(@list.List([@int.divides()]))(t150),
  )
  let t149 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d' : Num)"))(fn(
      x146 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s147 = @tactics.subst_all_tac(x146)
      fn(
        x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s147(x148)
      }
    }),
  )
  let t144 = @kernel.assume_rule(@term_syntax.parse_term("divides((d : Num), (n : Num))"))
  let t145 = @tactics.mp_tac(
    @simp.rewrite_rule(@list.List([@int.divides()]))(t144),
  )
  let t143 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.divides_mul2(), @arith.mult_sym()])),
    @tactics.all_tac,
  ])
  let t142 = @term_syntax.parse_term("(e : Num)")
  let t167 = @tactics.then_tac(
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
                            @tactics.map_every(
                              @tactics.x_gen_tac,
                              @list.List([@term_syntax.parse_term("(d : Num)"), t142]),
                            ),
                            @tactics.strip_tac,
                          ),
                          @tactics.conj_tac,
                        ),
                        t143,
                      ),
                      t145,
                    ),
                    t149,
                  ),
                  t151,
                ),
                t155,
              ),
              t156,
            ),
            t158,
          ),
          t159,
        ),
        t165,
      ),
      t166,
    ),
    @int.arith_tac,
  )
  let t141 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_divisors(),
      @prime.divides_refl(),
      @prime.divides_rmul(),
      @prime.coprime_sym(),
      @arith.mult_sym(),
    ]),
  )
  let t137 = @term_syntax.parse_term("(a1 : Num)")
  let t138 = @term_syntax.parse_term("(a2 : Num)")
  let t139 = @term_syntax.parse_term("(b1 : Num)")
  let t140 = @lib.map(
    fn(
      x134 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s135 = @tactics.exists_tac(x134)
      fn(
        x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s135(x136)
      }
    },
    @list.List([@term_syntax.parse_term("(b2 : Num)"), t139, t138, t137]),
  )
  let t133 = @tactics.match_mp_tac(@prime.coprime_divprod())
  let t132 = @tactics.repeat_tac(@tactics.conj_tac)
  let t131 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t130 = @tactics.first_x_assum(fn(
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
      x126 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s127 = @tactics.subst_all_tac(x126)
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
    })(@equal.sym(x129))
  })
  let t122 = @term_syntax.parse_term("(b2 : Num)")
  let t123 = @term_syntax.parse_term("(a2 : Num)")
  let t124 = @term_syntax.parse_term("(b1 : Num)")
  let t125 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a1 : Num)"), t124, t123, t122]),
  )
  let t121 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.mult_sym()])),
    @tactics.all_tac,
  ])
  let t119 = @drule.match_mp(@prime.division_decomp())
  let t168 = @list.List([
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
                          @tactics.gen_tac,
                          @tactics.disch_then(fn(
                            x120 : @kernel.Thm,
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
                              x116 : @kernel.Thm,
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
                            ) raise) raise {
                              let s117 = @tactics.assume_tac(x116)
                              fn(
                                x118 : (
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
                              ) raise {
                                s117(x118)
                              }
                            })(t119(x120))
                          }),
                        ),
                        @tactics.conj_tac,
                      ),
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
            t132,
          ),
          t133,
        ),
        t140,
      ),
      t141,
    ),
    t167,
  ])
  let t115 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t114 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t113 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t112 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t111 = @simp.rewrite_tac(@list.List([@bool.exists_unique_def()]))
  let t110 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ a : Num, ∀ b : Num, GEQ(f((a, b)), a * b))"))
  let t109 = @tactics.match_mp_tac(@iterate.nsum_eq_general())
  let t108 = @tactics.conv_tac(@equal.sym_conv)
  let t107 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@iterate.nsum_lmul()),
      @iterate.nsum_nsum_product(),
      @prime.finite_divisors(),
    ]),
  )
  let t106 = @simp.gen_rewrite_tac(
    fn(
      x105 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x99 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s100 = @equal.rand_conv(x99)
        fn(x101 : @kernel.Term) -> @kernel.Thm raise { s100(x101) }
      })(
        (fn(
          x102 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s103 = @equal.once_depth_conv(x102)
          fn(x104 : @kernel.Term) -> @kernel.Thm raise { s103(x104) }
        })(x105),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t97 = @term_syntax.parse_term("(n : Num)")
  let t98 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t97]),
  )
  let t96 = @simp.asm_rewrite_tac(
    @list.List([
      @int.divides_one(),
      @arith.div_1(),
      @sets.sing_gspec(),
      @iterate.nsum_sing(),
      @arith.mult_clauses(),
    ]),
  )
  let t95 = @simp.rewrite_tac(
    @list.List([multiplicative_v1(), @equal.gsym(@iterate.nsum_lmul())]),
  )
  let t94 = @simp.gen_rewrite_tac(
    fn(
      x93 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x87 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s88 = @equal.land_conv(x87)
        fn(x89 : @kernel.Term) -> @kernel.Thm raise { s88(x89) }
      })(
        (fn(
          x90 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s91 = @equal.binop_conv(x90)
          fn(x92 : @kernel.Term) -> @kernel.Thm raise { s91(x92) }
        })(x93),
      )
    },
    @list.List([multiplicative()]),
  )
  let t169 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
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
                                      t94,
                                    ),
                                    t95,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t96,
                              ),
                              t98,
                            ),
                            @tactics.strip_tac,
                          ),
                          t106,
                        ),
                        t107,
                      ),
                      t108,
                    ),
                    t109,
                  ),
                  t110,
                ),
                t111,
              ),
              t112,
            ),
            t113,
          ),
          t114,
        ),
        t115,
      ),
      @tactics.conj_tac,
    ),
    t168,
  )
  multiplicative_convolution_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, multiplicative(f) && multiplicative(g) → multiplicative((n : Num) => nsum({(d : Num) | divides(d, n)}, (d : Num) => f(d) * g(DIV(n, d))))"),
      t169,
    ),
  )
}

///|
let multiplicative_convolution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_CONVOLUTION",
)

///|
/// `MULTIPLICATIVE_CONVOLUTION`
pub fn multiplicative_convolution() -> @kernel.Thm {
  multiplicative_convolution_c.get()
}

///|
/// MULTIPLICATIVE_CONST
fn step_7() -> Unit raise {
  let t171 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t170 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Num) == 1"))
  let t172 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([multiplicative()])),
      ),
      t170,
    ),
    t171,
  )
  multiplicative_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Num, multiplicative((n : Num) => c) == (c == 1)"),
      t172,
    ),
  )
}

///|
let multiplicative_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_CONST",
)

///|
/// `MULTIPLICATIVE_CONST`
pub fn multiplicative_const() -> @kernel.Thm {
  multiplicative_const_c.get()
}

///|
/// MULTIPLICATIVE_DELTA
fn step_8() -> Unit raise {
  let t173 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([multiplicative_v1(), @arith.mult_eq_1()])),
    @int.arith_tac,
  )
  multiplicative_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("multiplicative((n : Num) => if n == 1 { 1 } else { 0 })"),
      t173,
    ),
  )
}

///|
let multiplicative_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_DELTA",
)

///|
/// `MULTIPLICATIVE_DELTA`
pub fn multiplicative_delta() -> @kernel.Thm {
  multiplicative_delta_c.get()
}

///|
/// MULTIPLICATIVE_DIVISORSUM
fn step_9() -> Unit raise {
  let t176 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), multiplicative_const(), @class.eta_ax()]),
  )
  let t174 = @term_syntax.parse_term("(n : Num) => 1")
  let t175 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t174]),
      multiplicative_convolution(),
    ),
  )
  let t177 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t175),
    t176,
  )
  multiplicative_divisorsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, multiplicative(f) → multiplicative((n : Num) => nsum({(d : Num) | divides(d, n)}, f))"),
      t177,
    ),
  )
}

///|
let multiplicative_divisorsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_DIVISORSUM",
)

///|
/// `MULTIPLICATIVE_DIVISORSUM`
pub fn multiplicative_divisorsum() -> @kernel.Thm {
  multiplicative_divisorsum_c.get()
}

///|
/// MULTIPLICATIVE_ID
fn step_10() -> Unit raise {
  let t178 = @simp.rewrite_tac(@list.List([multiplicative()]))
  multiplicative_id_c.set(
    @tactics.prove(@term_syntax.parse_term("multiplicative((n : Num) => n)"), t178),
  )
}

///|
let multiplicative_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_ID",
)

///|
/// `MULTIPLICATIVE_ID`
pub fn multiplicative_id() -> @kernel.Thm {
  multiplicative_id_c.get()
}

///|
/// MULTIPLICATIVE_POWERSUM
fn step_11() -> Unit raise {
  let t179 = @simp.rewrite_tac(
    @list.List([multiplicative_v1(), @arith.exp_one(), @arith.mult_exp()]),
  )
  let t180 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(multiplicative_divisorsum()),
    ),
    t179,
  )
  multiplicative_powersum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, multiplicative((n : Num) => nsum({(d : Num) | divides(d, n)}, (d : Num) => EXP(d, k)))"),
      t180,
    ),
  )
}

///|
let multiplicative_powersum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_POWERSUM",
)

///|
/// `MULTIPLICATIVE_POWERSUM`
pub fn multiplicative_powersum() -> @kernel.Thm {
  multiplicative_powersum_c.get()
}

///|
/// sigma
fn step_12() -> Unit raise {
  sigma_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(sigma : (Num) -> Num)((n : Num)) == (if n == 0 { 0 } else { nsum({(d : Num) | divides(d, n)}, (i : Num) => i) })"),
    ),
  )
}

///|
let sigma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sigma")

///|
/// `sigma`
pub fn sigma() -> @kernel.Thm {
  sigma_c.get()
}

///|
/// tau
fn step_13() -> Unit raise {
  tau_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(tau : (Num) -> Num)((n : Num)) == (if n == 0 { 0 } else { CARD({(d : Num) | divides(d, n)}) })"),
    ),
  )
}

///|
let tau_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tau")

///|
/// `tau`
pub fn tau() -> @kernel.Thm {
  tau_c.get()
}

///|
/// MULTIPLICATIVE_SIGMA
fn step_14() -> Unit raise {
  let t182 = @simp.simp_tac(@list.List([sigma(), @arith.exp_1()]))
  let t181 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))(
      multiplicative_ignorezero(),
    ),
  )
  let t183 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.spec(@term_syntax.parse_term("1"), multiplicative_powersum()),
      ),
      t181,
    ),
    t182,
  )
  multiplicative_sigma_c.set(
    @tactics.prove(@term_syntax.parse_term("multiplicative(sigma)"), t183),
  )
}

///|
let multiplicative_sigma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_SIGMA",
)

///|
/// `MULTIPLICATIVE_SIGMA`
pub fn multiplicative_sigma() -> @kernel.Thm {
  multiplicative_sigma_c.get()
}

///|
/// MULTIPLICATIVE_TAU
fn step_15() -> Unit raise {
  let t185 = @simp.simp_tac(
    @list.List([
      tau(),
      @arith.exp(),
      @iterate.nsum_const(),
      @arith.mult_clauses(),
      @prime.finite_divisors(),
    ]),
  )
  let t184 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))(
      multiplicative_ignorezero(),
    ),
  )
  let t186 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.spec(@term_syntax.parse_term("0"), multiplicative_powersum()),
      ),
      t184,
    ),
    t185,
  )
  multiplicative_tau_c.set(
    @tactics.prove(@term_syntax.parse_term("multiplicative(tau)"), t186),
  )
}

///|
let multiplicative_tau_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_TAU",
)

///|
/// `MULTIPLICATIVE_TAU`
pub fn multiplicative_tau() -> @kernel.Thm {
  multiplicative_tau_c.get()
}

///|
/// MULTIPLICATIVE_PHI
fn step_16() -> Unit raise {
  let t187 = @simp.rewrite_tac(
    @list.List([
      multiplicative(),
      @pocklington.phi_multiplicative(),
      @pocklington.phi_1(),
    ]),
  )
  multiplicative_phi_c.set(
    @tactics.prove(@term_syntax.parse_term("multiplicative(phi)"), t187),
  )
}

///|
let multiplicative_phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_PHI",
)

///|
/// `MULTIPLICATIVE_PHI`
pub fn multiplicative_phi() -> @kernel.Thm {
  multiplicative_phi_c.get()
}

///|
/// MULTIPLICATIVE_GCD
fn step_17() -> Unit raise {
  let t188 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t189 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          multiplicative(),
          @simp.once_rewrite_rule(@list.List([@prime.gcd_sym()]))(
            @prime.gcd_1(),
          ),
        ]),
      ),
      t188,
    ),
    @int.number_tac,
  )
  multiplicative_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, multiplicative((m : Num) => gcd((n, m)))"),
      t189,
    ),
  )
}

///|
let multiplicative_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_GCD",
)

///|
/// `MULTIPLICATIVE_GCD`
pub fn multiplicative_gcd() -> @kernel.Thm {
  multiplicative_gcd_c.get()
}

///|
/// PHI_EXPAND
fn step_18() -> Unit raise {
  let t201 = @meson.meson_tac(@list.List([@prime.prime_1()]))
  let t200 = @simp.asm_simp_tac(@list.List([@prime.index_eq_0()]))
  let t199 = @simp.simp_tac(
    @list.List([@sets.in_elim_thm(), @pocklington.phi_primepow_alt()]),
  )
  let t198 = @tactics.match_mp_tac(@products.nproduct_eq())
  let t197 = @tactics.disch_then(fn(
    x194 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s195 = @tactics.subst1_tac(x194)
    fn(
      x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s195(x196)
    }
  })
  let t193 = @simp.asm_rewrite_tac(@list.List([multiplicative_phi()]))
  let t191 = @term_syntax.parse_term("(n : Num)")
  let t192 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("phi"), t191]),
      multiplicative_expand(),
    ),
  )
  let t190 = @simp.asm_rewrite_tac(@list.List([@pocklington.phi_0()]))
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
                  t190,
                ),
                t192,
              ),
              t193,
            ),
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
  phi_expand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, phi(n) == (if n == 0 { 0 } else { nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(p, index(p, n) - 1) * (p - 1)) })"),
      t202,
    ),
  )
}

///|
let phi_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_EXPAND")

///|
/// `PHI_EXPAND`
pub fn phi_expand() -> @kernel.Thm {
  phi_expand_c.get()
}

///|
/// MULTIPLICATIVE_UNIQUE
fn step_19() -> Unit raise {
  let t220 = @meson.asm_meson_tac(@list.List([multiplicative()]))
  let t219 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t217 = @term_syntax.parse_term("(n : Num)")
  let t218 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t217)
  let t216 = @list.List([
    @meson.asm_meson_tac(@list.List([multiplicative()])),
    @tactics.all_tac,
  ])
  let t212 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == 1 || 1 < n")),
  )
  let t213 = @tactics.disj_cases_then2(
    fn(
      x206 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s207 = @tactics.assume_tac(x206)
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
    },
    fn(
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
      let s210 = @tactics.mp_tac(x209)
      fn(
        x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s210(x211)
      }
    },
  )
  let t215 = @tactics.first_x_assum(fn(
    x214 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t213(t212(x214))
  })
  let t205 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t203 = @tactics.match_mp_tac(@arith.num_wf())
  let t221 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    @tactics.strip_tac,
                  ),
                  t203,
                ),
                t204,
              ),
              t205,
            ),
            t215,
          ),
          t216,
        ),
        t218,
      ),
      t219,
    ),
    t220,
  )
  multiplicative_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, multiplicative(f) && multiplicative(g) && (∀ p : Num, ∀ k : Num, prime(p) → f(EXP(p, k)) == g(EXP(p, k))) → (∀ n : Num, !(n == 0) → f(n) == g(n))"),
      t221,
    ),
  )
}

///|
let multiplicative_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MULTIPLICATIVE_UNIQUE",
)

///|
/// `MULTIPLICATIVE_UNIQUE`
pub fn multiplicative_unique() -> @kernel.Thm {
  multiplicative_unique_c.get()
}

///|
/// PHI_DIVISORSUM
fn step_20() -> Unit raise {
  let t234 = @simp.asm_simp_tac(
    @list.List([@arith.le_exp(), @prime.prime_imp_nz()]),
  )
  let t233 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → b - a + a == b")),
  )
  let t232 = @simp.rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @arith.suc_sub1(),
      @int.arith_rule(@term_syntax.parse_term("!(SUC((k : Num)) <= k)")),
    ]),
  )
  let t231 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nsum_clauses(),
      @sets.finite_numseg_le(),
      @nums.not_suc(),
    ]),
  )
  let t230 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(i : Num) | i == (a : Num) || i <= (b : Num)} == INSERT(a, {(i : Num) | i <= b})"),
      ),
    ]),
  )
  let t228 = @sets.set_rule(@term_syntax.parse_term("{(x : Num) | x == 0} == {0}"))
  let t229 = @simp.rewrite_tac(
    @list.List([@bool.conjunct1(@arith.exp()), t228, @iterate.nsum_sing()]),
  )
  let t227 = @simp.rewrite_tac(@list.List([@arith.le(), @nums.not_suc()]))
  let t226 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t225 = @simp.simp_tac(
    @list.List([
      @iterate.nsum_image(),
      @prime.eq_primepow(),
      @trivia.o_def(),
      @pocklington.phi_primepow(),
    ]),
  )
  let t224 = @simp.simp_tac(
    @list.List([
      @prime.divides_primepow(),
      @sets.set_rule(
        @term_syntax.parse_term("{(d : Num) | ∃ i : Num, i <= (k : Num) && d == EXP((p : Num), i)} == IMAGE((i : Num) => EXP(p, i), {(i : Num) | i <= k})"),
      ),
    ]),
  )
  let t223 = @simp.simp_tac(
    @list.List([
      multiplicative_divisorsum(),
      @class.eta_ax(),
      multiplicative_phi(),
    ]),
  )
  let t222 = @simp.rewrite_tac(@list.List([multiplicative_id()]))
  let t235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.match_mp_tac(multiplicative_unique()),
                                  t222,
                                ),
                                t223,
                              ),
                              t224,
                            ),
                            t225,
                          ),
                          t226,
                        ),
                        @tactics.gen_tac,
                      ),
                      @tactics.disch_tac,
                    ),
                    @nums.induct_tac,
                  ),
                  t227,
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
    @int.arith_tac,
  )
  phi_divisorsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → nsum({(d : Num) | divides(d, n)}, (d : Num) => phi(d)) == n"),
      t235,
    ),
  )
}

///|
let phi_divisorsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_DIVISORSUM")

///|
/// `PHI_DIVISORSUM`
pub fn phi_divisorsum() -> @kernel.Thm {
  phi_divisorsum_c.get()
}

///|
/// real_multiplicative
fn step_21() -> Unit raise {
  real_multiplicative_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_multiplicative : ((Num) -> Real) -> Bool)((f : (Num) -> Real)) == (f(1) == real_of_num(1) && (∀ m : Num, ∀ n : Num, coprime((m, n)) → f(m * n) == f(m) * f(n)))"),
    ),
  )
}

///|
let real_multiplicative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "real_multiplicative",
)

///|
/// `real_multiplicative`
pub fn real_multiplicative() -> @kernel.Thm {
  real_multiplicative_c.get()
}

///|
/// REAL_MULTIPLICATIVE
fn step_22() -> Unit raise {
  let t244 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_sym(),
      @prime.coprime_0(),
      @int.divides_one(),
      @arith.mult_clauses(),
    ]),
  )
  let t243 = @simp.asm_simp_tac(
    @list.List([
      @prime.coprime_0(),
      @arith.mult_clauses(),
      @realarith.real_mul_rid(),
    ]),
  )
  let t242 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t241 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t240 = @simp.asm_simp_tac(
    @list.List([
      @prime.coprime_0(),
      @arith.mult_clauses(),
      @realax.real_mul_lid(),
    ]),
  )
  let t239 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t237 = @term_syntax.parse_term("(n : Num)")
  let t238 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t237]),
  )
  let t236 = @simp.asm_simp_tac(@list.List([]))
  let t245 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([real_multiplicative()])),
                      @tactics.eq_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t236,
                ),
                t238,
              ),
              t239,
            ),
            t240,
          ),
          t241,
        ),
        t242,
      ),
      t243,
    ),
    t244,
  )
  real_multiplicative_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_multiplicative((f : (Num) -> Real)) == (f(1) == real_of_num(1) && (∀ m : Num, ∀ n : Num, !(m == 0) && !(n == 0) && coprime((m, n)) → f(m * n) == f(m) * f(n)))"),
      t245,
    ),
  )
}

///|
let real_multiplicative_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE",
)

///|
/// `REAL_MULTIPLICATIVE`
pub fn real_multiplicative_v1() -> @kernel.Thm {
  real_multiplicative_v1_c.get()
}

///|
/// REAL_MULTIPLICATIVE_CONST
fn step_23() -> Unit raise {
  let t247 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t246 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Real) == real_of_num(1)"))
  let t248 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([real_multiplicative()])),
      ),
      t246,
    ),
    t247,
  )
  real_multiplicative_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, real_multiplicative((n : Num) => c) == (c == real_of_num(1))"),
      t248,
    ),
  )
}

///|
let real_multiplicative_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_CONST",
)

///|
/// `REAL_MULTIPLICATIVE_CONST`
pub fn real_multiplicative_const() -> @kernel.Thm {
  real_multiplicative_const_c.get()
}

///|
/// REAL_MULTIPLICATIVE_DELTA
fn step_24() -> Unit raise {
  let t249 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([real_multiplicative_v1(), @arith.mult_eq_1()]),
    ),
    @calc_rat.real_arith_tac,
  )
  real_multiplicative_delta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("real_multiplicative((n : Num) => if n == 1 { real_of_num(1) } else { real_of_num(0) })"),
      t249,
    ),
  )
}

///|
let real_multiplicative_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_DELTA",
)

///|
/// `REAL_MULTIPLICATIVE_DELTA`
pub fn real_multiplicative_delta() -> @kernel.Thm {
  real_multiplicative_delta_c.get()
}

///|
/// REAL_MULTIPLICATIVE_IGNOREZERO
fn step_25() -> Unit raise {
  let t263 = @meson.asm_meson_tac(@list.List([@arith.mult_eq_0()]))
  let t262 = @simp.asm_rewrite_tac(@list.List([]))
  let t261 = @tactics.disch_then(fn(
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
    let th = x259
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t258 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t257 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s252 = @tactics.assume_tac(x251)
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
        },
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
          let s255 = @tactics.mp_tac(x254)
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
      ),
    ),
  )
  let t250 = @simp.simp_tac(
    @list.List([real_multiplicative_v1(), @calc_num.arith_eq()]),
  )
  let t264 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t250),
            t257,
          ),
          t258,
        ),
        t261,
      ),
      t262,
    ),
    t263,
  )
  real_multiplicative_ignorezero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, (∀ n : Num, !(n == 0) → g(n) == f(n)) && real_multiplicative(f) → real_multiplicative(g)"),
      t264,
    ),
  )
}

///|
let real_multiplicative_ignorezero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_IGNOREZERO",
)

///|
/// `REAL_MULTIPLICATIVE_IGNOREZERO`
pub fn real_multiplicative_ignorezero() -> @kernel.Thm {
  real_multiplicative_ignorezero_c.get()
}

///|
/// REAL_MULTIPLICATIVE_CONVOLUTION
fn step_26() -> Unit raise {
  let t342 = @simp.asm_simp_tac(@list.List([]))
  let t339 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("coprime(((a : Num) * (b : Num), (c : Num) * (d : Num))) → coprime((c, a)) && coprime((d, b))"),
    ),
  )
  let t341 = @tactics.first_assum(fn(
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
      let s337 = @tactics.assume_tac(x336)
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
    })(t339(x340))
  })
  let t335 = @simp.asm_simp_tac(
    @list.List([@arith.div_mult(), @arith.mult_eq_0()]),
  )
  let t333 = @term_syntax.parse_term("(e : Num) * (e' : Num) * ((d : Num) * (d' : Num)) == d * e * (d' * e')")
  let t334 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.mult_ac())(t333)]),
  )
  let t332 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()])),
  )
  let t331 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(e' : Num)"))(fn(
      x328 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s329 = @tactics.subst_all_tac(x328)
      fn(
        x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s329(x330)
      }
    }),
  )
  let t326 = @kernel.assume_rule(@term_syntax.parse_term("divides((e : Num), (m : Num))"))
  let t327 = @tactics.mp_tac(
    @simp.rewrite_rule(@list.List([@int.divides()]))(t326),
  )
  let t325 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d' : Num)"))(fn(
      x322 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s323 = @tactics.subst_all_tac(x322)
      fn(
        x324 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s323(x324)
      }
    }),
  )
  let t320 = @kernel.assume_rule(@term_syntax.parse_term("divides((d : Num), (n : Num))"))
  let t321 = @tactics.mp_tac(
    @simp.rewrite_rule(@list.List([@int.divides()]))(t320),
  )
  let t319 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.divides_mul2(), @arith.mult_sym()])),
    @tactics.all_tac,
  ])
  let t318 = @term_syntax.parse_term("(e : Num)")
  let t343 = @tactics.then_tac(
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
                            @tactics.map_every(
                              @tactics.x_gen_tac,
                              @list.List([@term_syntax.parse_term("(d : Num)"), t318]),
                            ),
                            @tactics.strip_tac,
                          ),
                          @tactics.conj_tac,
                        ),
                        t319,
                      ),
                      t321,
                    ),
                    t325,
                  ),
                  t327,
                ),
                t331,
              ),
              t332,
            ),
            t334,
          ),
          t335,
        ),
        t341,
      ),
      t342,
    ),
    @calc_rat.real_arith_tac,
  )
  let t317 = @meson.asm_meson_tac(
    @list.List([
      @prime.coprime_divisors(),
      @prime.divides_refl(),
      @prime.divides_rmul(),
      @prime.coprime_sym(),
      @arith.mult_sym(),
    ]),
  )
  let t313 = @term_syntax.parse_term("(a1 : Num)")
  let t314 = @term_syntax.parse_term("(a2 : Num)")
  let t315 = @term_syntax.parse_term("(b1 : Num)")
  let t316 = @lib.map(
    fn(
      x310 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s311 = @tactics.exists_tac(x310)
      fn(
        x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s311(x312)
      }
    },
    @list.List([@term_syntax.parse_term("(b2 : Num)"), t315, t314, t313]),
  )
  let t309 = @tactics.match_mp_tac(@prime.coprime_divprod())
  let t308 = @tactics.repeat_tac(@tactics.conj_tac)
  let t307 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.divides_antisym())]),
  )
  let t306 = @tactics.first_x_assum(fn(
    x305 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
      let s303 = @tactics.subst_all_tac(x302)
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
    })(@equal.sym(x305))
  })
  let t298 = @term_syntax.parse_term("(b2 : Num)")
  let t299 = @term_syntax.parse_term("(a2 : Num)")
  let t300 = @term_syntax.parse_term("(b1 : Num)")
  let t301 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a1 : Num)"), t300, t299, t298]),
  )
  let t297 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.mult_sym()])),
    @tactics.all_tac,
  ])
  let t295 = @drule.match_mp(@prime.division_decomp())
  let t344 = @list.List([
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
                          @tactics.gen_tac,
                          @tactics.disch_then(fn(
                            x296 : @kernel.Thm,
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
                              x292 : @kernel.Thm,
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
                            ) raise) raise {
                              let s293 = @tactics.assume_tac(x292)
                              fn(
                                x294 : (
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
                              ) raise {
                                s293(x294)
                              }
                            })(t295(x296))
                          }),
                        ),
                        @tactics.conj_tac,
                      ),
                      t297,
                    ),
                    t301,
                  ),
                  @tactics.strip_tac,
                ),
                t306,
              ),
              t307,
            ),
            t308,
          ),
          t309,
        ),
        t316,
      ),
      t317,
    ),
    t343,
  ])
  let t291 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @pair.pair_eq()]),
  )
  let t290 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t289 = @simp.rewrite_tac(@list.List([@bool.exists_unique_def()]))
  let t288 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ a : Num, ∀ b : Num, GEQ(f((a, b)), a * b))"))
  let t287 = @tactics.match_mp_tac(@iterate.sum_eq_general())
  let t286 = @tactics.conv_tac(@equal.sym_conv)
  let t285 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@iterate.sum_lmul()),
      @iterate.sum_sum_product(),
      @prime.finite_divisors(),
    ]),
  )
  let t284 = @simp.gen_rewrite_tac(
    fn(
      x283 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x277 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s278 = @equal.rand_conv(x277)
        fn(x279 : @kernel.Term) -> @kernel.Thm raise { s278(x279) }
      })(
        (fn(
          x280 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s281 = @equal.once_depth_conv(x280)
          fn(x282 : @kernel.Term) -> @kernel.Thm raise { s281(x282) }
        })(x283),
      )
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t275 = @term_syntax.parse_term("(n : Num)")
  let t276 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t275]),
  )
  let t274 = @simp.asm_rewrite_tac(
    @list.List([
      @int.divides_one(),
      @arith.div_1(),
      @sets.sing_gspec(),
      @iterate.sum_sing(),
      @realax.real_mul_lid(),
    ]),
  )
  let t273 = @simp.rewrite_tac(
    @list.List([real_multiplicative_v1(), @equal.gsym(@iterate.sum_lmul())]),
  )
  let t272 = @simp.gen_rewrite_tac(
    fn(
      x271 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x265 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s266 = @equal.land_conv(x265)
        fn(x267 : @kernel.Term) -> @kernel.Thm raise { s266(x267) }
      })(
        (fn(
          x268 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s269 = @equal.binop_conv(x268)
          fn(x270 : @kernel.Term) -> @kernel.Thm raise { s269(x270) }
        })(x271),
      )
    },
    @list.List([real_multiplicative()]),
  )
  let t345 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
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
                                  t272,
                                ),
                                t273,
                              ),
                              @tactics.strip_tac,
                            ),
                            t274,
                          ),
                          t276,
                        ),
                        @tactics.strip_tac,
                      ),
                      t284,
                    ),
                    t285,
                  ),
                  t286,
                ),
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
      @tactics.conj_tac,
    ),
    t344,
  )
  real_multiplicative_convolution_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, real_multiplicative(f) && real_multiplicative(g) → real_multiplicative((n : Num) => sum({(d : Num) | divides(d, n)}, (d : Num) => f(d) * g(DIV(n, d))))"),
      t345,
    ),
  )
}

///|
let real_multiplicative_convolution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_CONVOLUTION",
)

///|
/// `REAL_MULTIPLICATIVE_CONVOLUTION`
pub fn real_multiplicative_convolution() -> @kernel.Thm {
  real_multiplicative_convolution_c.get()
}

///|
/// REAL_MULTIPLICATIVE_DIVISORSUM
fn step_27() -> Unit raise {
  let t348 = @simp.asm_rewrite_tac(
    @list.List([
      @realarith.real_mul_rid(),
      real_multiplicative_const(),
      @class.eta_ax(),
    ]),
  )
  let t346 = @term_syntax.parse_term("(n : Num) => real_of_num(1)")
  let t347 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t346]),
      real_multiplicative_convolution(),
    ),
  )
  let t349 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t347),
    t348,
  )
  real_multiplicative_divisorsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, real_multiplicative(f) → real_multiplicative((n : Num) => sum({(d : Num) | divides(d, n)}, f))"),
      t349,
    ),
  )
}

///|
let real_multiplicative_divisorsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_DIVISORSUM",
)

///|
/// `REAL_MULTIPLICATIVE_DIVISORSUM`
pub fn real_multiplicative_divisorsum() -> @kernel.Thm {
  real_multiplicative_divisorsum_c.get()
}

///|
/// Library/multiplicative.ml:326
fn step_28() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// mobius
fn step_29() -> Unit raise {
  mobius_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(mobius : (Num) -> Real)((n : Num)) == (if squarefree(n) { pow(-real_of_num(1), CARD({(p : Num) | prime(p) && divides(p, n)})) } else { real_of_num(0) })"),
    ),
  )
}

///|
let mobius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mobius")

///|
/// `mobius`
pub fn mobius() -> @kernel.Thm {
  mobius_c.get()
}

///|
/// MOBIUS_ALT
fn step_30() -> Unit raise {
  let t351 = @equal.gsym(mobius())
  let t352 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@pocklington.squarefree_prime()), t351]),
  )
  let t350 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == (∀ x : _, P(x) → !Q(x))"),
      ),
    ]),
  )
  let t353 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.cond_swap())])),
      t350,
    ),
    t352,
  )
  mobius_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, mobius(n) == (if (∃ p : Num, prime(p) && divides(EXP(p, 2), n)) { real_of_num(0) } else { pow(-real_of_num(1), CARD({(p : Num) | prime(p) && divides(p, n)})) })"),
      t353,
    ),
  )
}

///|
let mobius_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOBIUS_ALT")

///|
/// `MOBIUS_ALT`
pub fn mobius_alt() -> @kernel.Thm {
  mobius_alt_c.get()
}

///|
/// MOBIUS_0
fn step_31() -> Unit raise {
  let t354 = @simp.rewrite_tac(
    @list.List([mobius(), @pocklington.squarefree_0()]),
  )
  mobius_0_c.set(@tactics.prove(@term_syntax.parse_term("mobius(0) == real_of_num(0)"), t354))
}

///|
let mobius_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOBIUS_0")

///|
/// `MOBIUS_0`
pub fn mobius_0() -> @kernel.Thm {
  mobius_0_c.get()
}

///|
/// MOBIUS_1
fn step_32() -> Unit raise {
  let t358 = @sets.set_tac(@list.List([@prime.prime_1()]))
  let t357 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(p : Num) | prime(p) && p == 1} == {}"),
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
      let th = x355
      @simp.simp_tac(@list.List([th, @sets.card_clauses(), @realax.real_pow()]))
    },
  )
  let t359 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([mobius(), @pocklington.squarefree_1(), @int.divides_one()]),
      ),
      t357,
    ),
    t358,
  )
  mobius_1_c.set(@tactics.prove(@term_syntax.parse_term("mobius(1) == real_of_num(1)"), t359))
}

///|
let mobius_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOBIUS_1")

///|
/// `MOBIUS_1`
pub fn mobius_1() -> @kernel.Thm {
  mobius_1_c.get()
}

///|
/// REAL_ABS_MOBIUS
fn step_33() -> Unit raise {
  let t361 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t360 = @simp.rewrite_tac(
    @list.List([
      @real.real_abs_pow(),
      @calc_int.real_abs_neg(),
      @real.real_pow_one(),
      @calc_int.real_abs_num(),
    ]),
  )
  let t362 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([mobius()])),
        ),
        @class.cond_cases_tac,
      ),
      t360,
    ),
    t361,
  )
  real_abs_mobius_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, abs(mobius(n)) <= real_of_num(1)"), t362),
  )
}

///|
let real_abs_mobius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ABS_MOBIUS",
)

///|
/// `REAL_ABS_MOBIUS`
pub fn real_abs_mobius() -> @kernel.Thm {
  real_abs_mobius_c.get()
}

///|
/// MOBIUS_MULT
fn step_34() -> Unit raise {
  let t381 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t382 = @tactics.then_tac(@tactics.mp_tac(@prime.prime_divprod_eq()), t381)
  let t380 = @sets.set_tac(@list.List([]))
  let t378 = @drule.match_mp(@prime.coprime_prime())
  let t383 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
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
          let s376 = @tactics.mp_tac(x375)
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
        })(t378(x379))
      }),
      t380,
    ),
    t382,
  ])
  let t374 = @simp.asm_simp_tac(
    @list.List([@prime.finite_special_divisors(), @arith.mult_eq_0()]),
  )
  let t373 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t372 = @tactics.conv_tac(@equal.sym_conv)
  let t371 = @list.List([
    @meson.asm_meson_tac(@list.List([@pocklington.squarefree_0()])),
    @tactics.all_tac,
  ])
  let t370 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == 0"))
  let t369 = @list.List([
    @meson.asm_meson_tac(@list.List([@pocklington.squarefree_0()])),
    @tactics.all_tac,
  ])
  let t368 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t367 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t366 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]),
  )
  let t364 = @term_syntax.parse_term("squarefree((b : Num))")
  let t365 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("squarefree((a : Num))"), t364]),
  )
  let t363 = @simp.rewrite_tac(
    @list.List([mobius(), @pocklington.squarefree_mul()]),
  )
  let t384 = @tactics.thenl(
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
                              @tactics.repeat_tac(@tactics.strip_tac),
                              t363,
                            ),
                            t365,
                          ),
                          t366,
                        ),
                        t367,
                      ),
                      @tactics.ap_term_tac,
                    ),
                    t368,
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
      @tactics.conj_tac,
    ),
    t383,
  )
  mobius_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, coprime((a, b)) → mobius(a * b) == mobius(a) * mobius(b)"),
      t384,
    ),
  )
}

///|
let mobius_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOBIUS_MULT")

///|
/// `MOBIUS_MULT`
pub fn mobius_mult() -> @kernel.Thm {
  mobius_mult_c.get()
}

///|
/// REAL_MULTIPLICATIVE_MOBIUS
fn step_35() -> Unit raise {
  let t385 = @simp.simp_tac(
    @list.List([real_multiplicative(), mobius_1(), mobius_mult()]),
  )
  real_multiplicative_mobius_c.set(
    @tactics.prove(@term_syntax.parse_term("real_multiplicative(mobius)"), t385),
  )
}

///|
let real_multiplicative_mobius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_MULTIPLICATIVE_MOBIUS",
)

///|
/// `REAL_MULTIPLICATIVE_MOBIUS`
pub fn real_multiplicative_mobius() -> @kernel.Thm {
  real_multiplicative_mobius_c.get()
}

///|
/// MOBIUS_PRIME
fn step_36() -> Unit raise {
  let t393 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t392 = @simp.rewrite_tac(@list.List([@sets.card_sing()]))
  let t391 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([@prime.divides_prime_prime()])),
    @tactics.all_tac,
  ])
  let t390 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(q : Num) | prime(q) && divides(q, (p : Num))} == {p}"),
    fn(
      x387 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s388 = @tactics.subst1_tac(x387)
      fn(
        x389 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s388(x389)
      }
    },
  )
  let t386 = @simp.asm_simp_tac(
    @list.List([mobius(), @pocklington.prime_imp_squarefree()]),
  )
  let t394 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t386),
          t390,
        ),
        t391,
      ),
      t392,
    ),
    t393,
  )
  mobius_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) → mobius(p) == -real_of_num(1)"),
      t394,
    ),
  )
}

///|
let mobius_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOBIUS_PRIME")

///|
/// `MOBIUS_PRIME`
pub fn mobius_prime() -> @kernel.Thm {
  mobius_prime_c.get()
}

///|
/// MOBIUS_PRIMEPOW
fn step_37() -> Unit raise {
  let t398 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t397 = @simp.asm_rewrite_tac(
    @list.List([mobius(), @pocklington.squarefree_exp()]),
  )
  let t396 = @simp.asm_simp_tac(@list.List([mobius_prime(), @arith.exp_1()]))
  let t395 = @simp.asm_rewrite_tac(@list.List([mobius_1(), @arith.exp()]))
  let t399 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.strip_tac),
              @class.cond_cases_tac,
            ),
            t395,
          ),
          @class.cond_cases_tac,
        ),
        t396,
      ),
      t397,
    ),
    t398,
  )
  mobius_primepow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) → mobius(EXP(p, k)) == (if k == 0 { real_of_num(1) } else { if k == 1 { -real_of_num(1) } else { real_of_num(0) } })"),
      t399,
    ),
  )
}

///|
let mobius_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MOBIUS_PRIMEPOW",
)

///|
/// `MOBIUS_PRIMEPOW`
pub fn mobius_primepow() -> @kernel.Thm {
  mobius_primepow_c.get()
}

///|
/// DIVISORSUM_MOBIUS
fn step_38() -> Unit raise {
  let t417 = @meson.asm_meson_tac(@list.List([@arith.exp(), @arith.exp_1()]))
  let t418 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([mobius_primepow()])),
    t417,
  )
  let t419 = @meson.asm_meson_tac(@list.List([@arith.exp_1(), @arith.le_1()]))
  let t420 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.exp(), @arith.le_0()])),
    t419,
    t418,
  ])
  let t416 = @simp.asm_rewrite_tac(@list.List([]))
  let t415 = @tactics.repeat_tac(@tactics.strip_tac)
  let t414 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @sets.in_insert(),
      @sets.not_in_empty(),
      @class.de_morgan_thm(),
    ]),
  )
  let t413 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow()]))
  let t412 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t410 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t411 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @iterate.sum_clauses(),
          @sets.finite_rules(),
          @sets.not_in_empty(),
          @sets.in_sing(),
          mobius_prime(),
          mobius_1(),
          @calc_int.real_add_rid(),
          @calc_int.real_add_rinv(),
        ]),
      ),
      t410,
    ),
  ])
  let t409 = @tactics.exists_tac(
    @term_syntax.parse_term("sum({1, (p : Num)}, (d : Num) => mobius(d))"),
  )
  let t408 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t406 = @term_syntax.parse_term("(k : Num)")
  let t407 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t406]),
  )
  let t404 = @simp.simp_tac(
    @list.List([
      real_multiplicative(),
      @class.eta_ax(),
      @calc_int.real_mul_lzero(),
    ]),
  )
  let t405 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @drule.match_mp(real_multiplicative_divisorsum())(
          real_multiplicative_mobius(),
        ),
      ),
      t404,
    ),
    @tactics.all_tac,
  ])
  let t403 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t402 = @simp.simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 1)"))]),
  )
  let t401 = @simp.simp_tac(
    @list.List([
      @int.divides_one(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}")),
      @iterate.sum_sing(),
      mobius_1(),
    ]),
  )
  let t400 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"),
      ),
    ]),
  )
  let t421 = @tactics.thenl(
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
                                    @tactics.then_tac(
                                      @simp.rewrite_tac(
                                        @list.List([
                                          @int.arith_rule(
                                            @term_syntax.parse_term("(1 <= (n : Num)) == (n == 1 || 1 < n)"),
                                          ),
                                        ]),
                                      ),
                                      t400,
                                    ),
                                    t401,
                                  ),
                                  t402,
                                ),
                                t403,
                              ),
                              @tactics.conj_tac,
                            ),
                            t405,
                          ),
                          t407,
                        ),
                        @tactics.strip_tac,
                      ),
                      t408,
                    ),
                    t409,
                  ),
                  @tactics.conj_tac,
                ),
                t411,
              ),
              t412,
            ),
            t413,
          ),
          t414,
        ),
        t415,
      ),
      t416,
    ),
    t420,
  )
  divisorsum_mobius_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, 1 <= n → sum({(d : Num) | divides(d, n)}, (d : Num) => mobius(d)) == (if n == 1 { real_of_num(1) } else { real_of_num(0) })"),
      t421,
    ),
  )
}

///|
let divisorsum_mobius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVISORSUM_MOBIUS",
)

///|
/// `DIVISORSUM_MOBIUS`
pub fn divisorsum_mobius() -> @kernel.Thm {
  divisorsum_mobius_c.get()
}

///|
/// MOBIUS_INVERSION
fn step_39() -> Unit raise {
  let t467 = @meson.asm_meson_tac(
    @list.List([
      @int.divides_divides_div(),
      @arith.mult_sym(),
      @int.number_rule(
        @term_syntax.parse_term("divides((a : Num) * (b : Num), (c : Num)) → divides(b, c)"),
      ),
    ]),
  )
  let t466 = @simp.rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t465 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x459 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s460 = @tactics.assume_tac(x459)
        fn(
          x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s460(x461)
        }
      },
      fn(
        x462 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s463 = @tactics.mp_tac(x462)
        fn(
          x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s463(x464)
        }
      },
    ),
  )
  let t458 = @tactics.repeat_tac(@tactics.gen_tac)
  let t457 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]),
  )
  let t456 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ m : Num, ∀ n : Num, GEQ(f((m, n)), (n, m)))")),
  )
  let t455 = @tactics.match_mp_tac(@iterate.sum_eq_general_inverses())
  let t454 = @simp.asm_simp_tac(
    @list.List([
      @iterate.sum_sum_product(),
      @prime.finite_divisors(),
      @arith.le_1(),
      @sets.in_elim_thm(),
    ]),
  )
  let t453 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t468 = @tactics.then_tac(
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
                        @list.List([
                          @equal.gsym(divisorsum_mobius()),
                          @arith.le_1(),
                        ]),
                      ),
                      t453,
                    ),
                    t454,
                  ),
                  t455,
                ),
                t456,
              ),
              t457,
            ),
            @tactics.conj_tac,
          ),
          t458,
        ),
        t465,
      ),
      t466,
    ),
    t467,
  )
  let t452 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_int.real_mul_rzero()]),
  )
  let t451 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s446 = @tactics.mp_tac(x445)
        fn(
          x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s446(x447)
        }
      },
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
        let s449 = @tactics.assume_tac(x448)
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
    ),
  )
  let t444 = @simp.rewrite_tac(@list.List([@int.divides_div_mult()]))
  let t443 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t442 = @simp.simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_sing(),
      @sets.in_elim_thm(),
      @prime.divides_refl(),
    ]),
  )
  let t441 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t440 = @tactics.conv_tac(@equal.sym_conv)
  let t439 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @iterate.sum_sing(),
        @arith.div_refl(),
        @arith.le_1(),
        @realarith.real_mul_rid(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t438 = @tactics.exists_tac(
    @term_syntax.parse_term("sum({(n : Num)}, (d : Num) => (f : (Num) -> Real)(d) * (if DIV(n, d) == 1 { real_of_num(1) } else { real_of_num(0) }))"),
  )
  let t469 = @list.List([
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
                          @tactics.match_mp_tac(@theorems.eq_trans()),
                          t438,
                        ),
                        @tactics.conj_tac,
                      ),
                      t439,
                    ),
                    t440,
                  ),
                  t441,
                ),
                t442,
              ),
              t443,
            ),
            t444,
          ),
          t451,
        ),
        @class.cond_cases_tac,
      ),
      t452,
    ),
    t468,
  ])
  let t437 = @tactics.exists_tac(
    @term_syntax.parse_term("sum({(d : Num) | divides(d, (n : Num))}, (d : Num) => (f : (Num) -> Real)(d) * (if DIV(n, d) == 1 { real_of_num(1) } else { real_of_num(0) }))"),
  )
  let t436 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t435 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t433 = @simp.asm_simp_tac(
    @list.List([@arith.le_1(), @arith.not_lt(), @arith.div_eq_0()]),
  )
  let t430 = @drule.match_mp(@int.divides_le())
  let t432 = @tactics.disch_then(fn(
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
    (fn(
      x427 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s428 = @tactics.mp_tac(x427)
      fn(
        x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s428(x429)
      }
    })(t430(x431))
  })
  let t426 = @simp.asm_simp_tac(
    @list.List([@prime.divides_zero(), @arith.le_1()]),
  )
  let t434 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0")),
          ),
          t426,
        ),
        t432,
      ),
      t433,
    ),
    @tactics.all_tac,
  ])
  let t425 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : Num, divides(d, (n : Num)) → !(DIV(n, d) == 0)"),
    fn(
      x422 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s423 = @tactics.assume_tac(x422)
      fn(
        x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s423(x424)
      }
    },
  )
  let t470 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t425),
              t434,
            ),
            t435,
          ),
          t436,
        ),
        t437,
      ),
      @tactics.conj_tac,
    ),
    t469,
  )
  mobius_inversion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, (∀ n : Num, 1 <= n → g(n) == sum({(d : Num) | divides(d, n)}, f)) → (∀ n : Num, 1 <= n → f(n) == sum({(d : Num) | divides(d, n)}, (d : Num) => mobius(d) * g(DIV(n, d))))"),
      t470,
    ),
  )
}

///|
let mobius_inversion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MOBIUS_INVERSION",
)

///|
/// `MOBIUS_INVERSION`
pub fn mobius_inversion() -> @kernel.Thm {
  mobius_inversion_c.get()
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
}
