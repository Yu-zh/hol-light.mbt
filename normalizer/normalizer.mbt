// Translated from upstream normalizer.ml; edit this file directly.

///|
/// SEMIRING_NORMALIZERS_CONV
fn step_1() -> Unit raise {
  let t29 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t28 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ m : Num, ∀ n : Num, (pwr : (A, Num) -> A)(pwr(x, m), n) == pwr(x, m * n)"),
    fn(
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
      let th = x26
      @meson.asm_meson_tac(@list.List([th]))
    },
  )
  let t24 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        @nums.induct_tac,
      ),
      t24,
    ),
    @tactics.all_tac,
  ])
  let t23 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, ∀ n : Num, (pwr : (A, Num) -> A)((mul : (A, A) -> A)(x, y), n) == mul(pwr(x, n), pwr(y, n))"),
    fn(
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
      let s21 = @tactics.assume_tac(x20)
      fn(
        x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s21(x22)
      }
    },
  )
  let t18 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t19 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t18,
    ),
    @tactics.all_tac,
  ])
  let t17 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : A, (pwr : (A, Num) -> A)(x, m + n) == (mul : (A, A) -> A)(pwr(x, m), pwr(x, n))"),
    fn(
      x14 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s15 = @tactics.assume_tac(x14)
      fn(
        x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s15(x16)
      }
    },
  )
  let t12 = @calc_num.num_conv(@term_syntax.parse_term("1"))
  let t13 = @simp.asm_rewrite_tac(
    @list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), t12]),
  )
  let t7 = @term_syntax.parse_term("∀ x : A, ∀ y : A, (mul : (A, A) -> A)(x, y) == mul(y, x)")
  let t8 = @term_syntax.parse_term("∀ x : A, ∀ y : A, ∀ z : A, (mul : (A, A) -> A)(x, mul(y, z)) == mul(mul(x, y), z)")
  let t9 = @term_syntax.parse_term("∀ x : A, ∀ y : A, (add : (A, A) -> A)(x, y) == add(y, x)")
  let t10 = @tactics.then_tac(
    @tactics.map_every(
      fn(
        x4 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let t = x4
        @tactics.undisch_then(t, fn(
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
          @tactics.all_tac
        })
      },
      @list.List([
        @term_syntax.parse_term("∀ x : A, ∀ y : A, ∀ z : A, (add : (A, A) -> A)(x, add(y, z)) == add(add(x, y), z)"),
        t9,
        t8,
        t7,
      ]),
    ),
    @tactics.strip_tac,
  )
  let t11 = @list.List([@meson.asm_meson_tac(@list.List([])), t10])
  let t30 = @tactics.then_tac(
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
                          @tactics.strip_tac,
                          @tactics.subgoal_then(
                            @term_syntax.parse_term("(∀ m : A, ∀ n : A, (add : (A, A) -> A)(m, n) == add(n, m)) && (∀ m : A, ∀ n : A, ∀ p : A, add(add(m, n), p) == add(m, add(n, p))) && (∀ m : A, ∀ n : A, ∀ p : A, add(m, add(n, p)) == add(n, add(m, p))) && (∀ x : A, add(x, (r0 : A)) == x) && (∀ m : A, ∀ n : A, (mul : (A, A) -> A)(m, n) == mul(n, m)) && (∀ m : A, ∀ n : A, ∀ p : A, mul(mul(m, n), p) == mul(m, mul(n, p))) && (∀ m : A, ∀ n : A, ∀ p : A, mul(m, mul(n, p)) == mul(n, mul(m, p))) && (∀ m : A, ∀ n : A, ∀ p : A, mul(add(m, n), p) == add(mul(m, p), mul(n, p))) && (∀ x : A, mul(x, (r1 : A)) == x) && (∀ x : A, mul(x, r0) == r0)"),
                            fn(
                              x1 : @kernel.Thm,
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
                              let s2 = @tactics.mp_tac(x1)
                              fn(
                                x3 : (
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
                                s2(x3)
                              }
                            },
                          ),
                        ),
                        t11,
                      ),
                      t13,
                    ),
                    t17,
                  ),
                  t19,
                ),
                t23,
              ),
              t25,
            ),
            t28,
          ),
          @tactics.gen_tac,
        ),
        @tactics.gen_tac,
      ),
      @nums.induct_tac,
    ),
    t29,
  )
  let semiring_pths = @tactics.prove(
    @term_syntax.parse_term("(∀ x : A, ∀ y : A, ∀ z : A, (add : (A, A) -> A)(x, add(y, z)) == add(add(x, y), z)) && (∀ x : A, ∀ y : A, add(x, y) == add(y, x)) && (∀ x : A, add((r0 : A), x) == x) && (∀ x : A, ∀ y : A, ∀ z : A, (mul : (A, A) -> A)(x, mul(y, z)) == mul(mul(x, y), z)) && (∀ x : A, ∀ y : A, mul(x, y) == mul(y, x)) && (∀ x : A, mul((r1 : A), x) == x) && (∀ x : A, mul(r0, x) == r0) && (∀ x : A, ∀ y : A, ∀ z : A, mul(x, add(y, z)) == add(mul(x, y), mul(x, z))) && (∀ x : A, (pwr : (A, Num) -> A)(x, 0) == r1) && (∀ x : A, ∀ n : Num, pwr(x, SUC(n)) == mul(x, pwr(x, n))) → mul(r1, (x : A)) == x && add(mul((a : A), (m : A)), mul((b : A), m)) == mul(add(a, b), m) && add(mul(a, m), m) == mul(add(a, r1), m) && add(m, mul(a, m)) == mul(add(a, r1), m) && add(m, m) == mul(add(r1, r1), m) && mul(r0, m) == r0 && add(r0, a) == a && add(a, r0) == a && mul(a, b) == mul(b, a) && mul(add(a, b), (c : A)) == add(mul(a, c), mul(b, c)) && mul(r0, a) == r0 && mul(a, r0) == r0 && mul(r1, a) == a && mul(a, r1) == a && mul(mul((lx : A), (ly : A)), mul((rx : A), (ry : A))) == mul(mul(lx, rx), mul(ly, ry)) && mul(mul(lx, ly), mul(rx, ry)) == mul(lx, mul(ly, mul(rx, ry))) && mul(mul(lx, ly), mul(rx, ry)) == mul(rx, mul(mul(lx, ly), ry)) && mul(mul(lx, ly), rx) == mul(mul(lx, rx), ly) && mul(mul(lx, ly), rx) == mul(lx, mul(ly, rx)) && mul(lx, rx) == mul(rx, lx) && mul(lx, mul(rx, ry)) == mul(mul(lx, rx), ry) && mul(lx, mul(rx, ry)) == mul(rx, mul(lx, ry)) && add(add(a, b), add(c, (d : A))) == add(add(a, c), add(b, d)) && add(add(a, b), c) == add(a, add(b, c)) && add(a, add(c, d)) == add(c, add(a, d)) && add(add(a, b), c) == add(add(a, c), b) && add(a, c) == add(c, a) && add(a, add(c, d)) == add(add(a, c), d) && mul(pwr(x, (p : Num)), pwr(x, (q : Num))) == pwr(x, p + q) && mul(x, pwr(x, q)) == pwr(x, SUC(q)) && mul(pwr(x, q), x) == pwr(x, SUC(q)) && mul(x, x) == pwr(x, 2) && pwr(mul(x, (y : A)), q) == mul(pwr(x, q), pwr(y, q)) && pwr(pwr(x, p), q) == pwr(x, p * q) && pwr(x, 0) == r1 && pwr(x, 1) == x && mul(x, add(y, (z : A))) == add(mul(x, y), mul(x, z)) && pwr(x, SUC(q)) == mul(x, pwr(x, q))"),
    t30,
  )
  let true_tm = @kernel.concl(@bool.truth())
  semiring_normalizers_conv_c.set(fn(
    x31 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> ((
    (
      (@kernel.Term) -> Bool raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
    ),
  ) -> (((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> (
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
  ) raise) raise) raise) raise {
    let sth = x31
    fn(
      x32 : @kernel.Thm,
    ) -> ((
      (
        (@kernel.Term) -> Bool raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
      ),
    ) -> (((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> (
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
    ) raise) raise) raise {
      let rth = x32
      fn(
        x33 : (
          (@kernel.Term) -> Bool raise,
          (@kernel.Term) -> @kernel.Thm raise,
          (@kernel.Term) -> @kernel.Thm raise,
          (@kernel.Term) -> @kernel.Thm raise,
        ),
      ) -> (((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> (
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
        (@kernel.Term) -> @kernel.Thm raise,
      ) raise) raise {
        let (
          is_semiring_constant,
          semiring_add_conv,
          semiring_mul_conv,
          semiring_pow_conv,
        ) = x33
        match @bool.conjuncts_rule(@drule.match_mp(semiring_pths)(sth)) {
          More(
            pthm_01,
            tail=More(
              pthm_02,
              tail=More(
                pthm_03,
                tail=More(
                  pthm_04,
                  tail=More(
                    pthm_05,
                    tail=More(
                      pthm_06,
                      tail=More(
                        pthm_07,
                        tail=More(
                          pthm_08,
                          tail=More(
                            pthm_09,
                            tail=More(
                              pthm_10,
                              tail=More(
                                pthm_11,
                                tail=More(
                                  pthm_12,
                                  tail=More(
                                    pthm_13,
                                    tail=More(
                                      pthm_14,
                                      tail=More(
                                        pthm_15,
                                        tail=More(
                                          pthm_16,
                                          tail=More(
                                            pthm_17,
                                            tail=More(
                                              pthm_18,
                                              tail=More(
                                                pthm_19,
                                                tail=More(
                                                  pthm_20,
                                                  tail=More(
                                                    pthm_21,
                                                    tail=More(
                                                      pthm_22,
                                                      tail=More(
                                                        pthm_23,
                                                        tail=More(
                                                          pthm_24,
                                                          tail=More(
                                                            pthm_25,
                                                            tail=More(
                                                              pthm_26,
                                                              tail=More(
                                                                pthm_27,
                                                                tail=More(
                                                                  pthm_28,
                                                                  tail=More(
                                                                    pthm_29,
                                                                    tail=More(
                                                                      pthm_30,
                                                                      tail=More(
                                                                        pthm_31,
                                                                        tail=More(
                                                                          pthm_32,
                                                                          tail=More(
                                                                            pthm_33,
                                                                            tail=More(
                                                                              pthm_34,
                                                                              tail=More(
                                                                                pthm_35,
                                                                                tail=More(
                                                                                  pthm_36,
                                                                                  tail=More(
                                                                                    pthm_37,
                                                                                    tail=More(
                                                                                      pthm_38,
                                                                                      tail=Empty
                                                                                    )
                                                                                  )
                                                                                )
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          )
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          ) => {
            let add_tm = @kernel.rator(
              @kernel.rator(@equal.lhand(@kernel.concl(pthm_07))),
            )
            let mul_tm = @kernel.rator(
              @kernel.rator(@equal.lhand(@kernel.concl(pthm_13))),
            )
            let pow_tm = @kernel.rator(
              @kernel.rator(@kernel.rand(@kernel.concl(pthm_32))),
            )
            let zero_tm = @kernel.rand(@kernel.concl(pthm_06))
            let one_tm = @kernel.rand(@equal.lhand(@kernel.concl(pthm_14)))
            let ty = @kernel.type_of(@kernel.rand(@kernel.concl(pthm_01)))
            let p_tm = @term_syntax.parse_term("(p : Num)")
            let q_tm = @term_syntax.parse_term("(q : Num)")
            let zeron_tm = @term_syntax.parse_term("0")
            let onen_tm = @term_syntax.parse_term("1")
            let a_tm = @kernel.mk_var("a", ty)
            let b_tm = @kernel.mk_var("b", ty)
            let c_tm = @kernel.mk_var("c", ty)
            let d_tm = @kernel.mk_var("d", ty)
            let lx_tm = @kernel.mk_var("lx", ty)
            let ly_tm = @kernel.mk_var("ly", ty)
            let m_tm = @kernel.mk_var("m", ty)
            let rx_tm = @kernel.mk_var("rx", ty)
            let ry_tm = @kernel.mk_var("ry", ty)
            let x_tm = @kernel.mk_var("x", ty)
            let y_tm = @kernel.mk_var("y", ty)
            let z_tm = @kernel.mk_var("z", ty)
            let dest_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
              x35 : @kernel.Term,
            ) => @basics.dest_binop(add_tm, x35)
            let dest_mul : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
              x36 : @kernel.Term,
            ) => @basics.dest_binop(mul_tm, x36)
            let dest_pow : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(
              x37 : @kernel.Term,
            ) -> (@kernel.Term, @kernel.Term) raise {
              let tm = x37
              let (l, r) = @basics.dest_binop(pow_tm, tm)
              if @nums.is_numeral(r) {
                (l, r)
              } else {
                raise Failure("dest_pow")
              }
            }
            let is_add : (@kernel.Term) -> Bool raise = fn(
              x39 : @kernel.Term,
            ) -> Bool raise {
              ((x38 : @kernel.Term) => @basics.is_binop(add_tm, x38))(x39)
            }
            let is_mul : (@kernel.Term) -> Bool raise = fn(
              x41 : @kernel.Term,
            ) -> Bool raise {
              ((x40 : @kernel.Term) => @basics.is_binop(mul_tm, x40))(x41)
            }
            let (nthm_1_1, nthm_2_1, sub_tm_1, neg_tm_1, dest_sub_1, is_sub_1) = if @kernel.concl(
                rth,
              ) ==
              true_tm {
              (
                rth,
                rth,
                true_tm,
                true_tm,
                fn(x42 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
                  let t_1 = x42
                  (t_1, t_1)
                },
                fn(x43 : @kernel.Term) -> Bool raise { false },
              )
            } else {
              let nthm_1 = @bool.spec(x_tm, @bool.conjunct1(rth))
              let nthm_2 = @bool.specl(
                @list.List([x_tm, y_tm]),
                @bool.conjunct2(rth),
              )
              let sub_tm = @kernel.rator(
                @kernel.rator(@equal.lhand(@kernel.concl(nthm_2))),
              )
              let neg_tm = @kernel.rator(@equal.lhand(@kernel.concl(nthm_1)))
              let dest_sub : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
                x44 : @kernel.Term,
              ) => @basics.dest_binop(sub_tm, x44)
              let is_sub : (@kernel.Term) -> Bool raise = fn(
                x46 : @kernel.Term,
              ) -> Bool raise {
                ((x45 : @kernel.Term) => @basics.is_binop(sub_tm, x45))(x46)
              }
              (nthm_1, nthm_2, sub_tm, neg_tm, dest_sub, is_sub)
            }
            fn(
              x47 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise,
            ) -> (
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> @kernel.Thm raise,
              (@kernel.Term) -> @kernel.Thm raise,
            ) raise {
              let variable_order = x47
              let powvar_mul_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x48 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_1 = x48
                let (l_1, r_1) = dest_mul(tm_1)
                if is_semiring_constant(l_1) && is_semiring_constant(r_1) {
                  semiring_mul_conv(tm_1)
                } else {
                  try {
                    let (lx, ln) = dest_pow(l_1)
                    try {
                      let (rx, rn) = dest_pow(r_1)
                      let th1 = @kernel.inst_rule(
                        @list.List([(lx, x_tm), (ln, p_tm), (rn, q_tm)]),
                        pthm_29,
                      )
                      let (tm1, tm2) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1)),
                      )
                      @kernel.trans(
                        th1,
                        @equal.ap_term(tm1, @calc_num.num_add_conv(tm2)),
                      )
                    } catch {
                      Failure(_) => {
                        let th1_1 = @kernel.inst_rule(
                          @list.List([(lx, x_tm), (ln, q_tm)]),
                          pthm_31,
                        )
                        let (tm1_1, tm2_1) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_1)),
                        )
                        @kernel.trans(
                          th1_1,
                          @equal.ap_term(tm1_1, @calc_num.num_suc_conv(tm2_1)),
                        )
                      }
                      e => raise e
                    }
                  } catch {
                    Failure(_) =>
                      try {
                        let (rx_1, rn_1) = dest_pow(r_1)
                        let th1_2 = @kernel.inst_rule(
                          @list.List([(rx_1, x_tm), (rn_1, q_tm)]),
                          pthm_30,
                        )
                        let (tm1_2, tm2_2) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_2)),
                        )
                        @kernel.trans(
                          th1_2,
                          @equal.ap_term(tm1_2, @calc_num.num_suc_conv(tm2_2)),
                        )
                      } catch {
                        Failure(_) =>
                          @kernel.inst_rule(@list.List([(l_1, x_tm)]), pthm_32)
                        e => raise e
                      }
                    e => raise e
                  }
                }
              }
              let monomial_deone : (@kernel.Thm) -> @kernel.Thm raise = fn(
                x49 : @kernel.Thm,
              ) -> @kernel.Thm raise {
                let th_1 = x49
                try {
                  let (l_2, r_2) = dest_mul(@kernel.rand(@kernel.concl(th_1)))
                  if l_2 == one_tm {
                    @kernel.trans(
                      th_1,
                      @kernel.inst_rule(@list.List([(r_2, x_tm)]), pthm_01),
                    )
                  } else {
                    th_1
                  }
                } catch {
                  Failure(_) => th_1
                  e => raise e
                }
              }
              fn monomial_pow(
                x50 : @kernel.Term,
                x51 : @kernel.Term,
                x52 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_2 = x50
                let bod = x51
                let ntm = x52
                if !@kernel.is_comb(bod) {
                  @kernel.refl(tm_2)
                } else if is_semiring_constant(bod) {
                  semiring_pow_conv(tm_2)
                } else {
                  let (lop, r_3) = @kernel.dest_comb(bod)
                  if !@kernel.is_comb(lop) {
                    @kernel.refl(tm_2)
                  } else {
                    let (op, l_3) = @kernel.dest_comb(lop)
                    if op == pow_tm && @nums.is_numeral(r_3) {
                      let th1_3 = @kernel.inst_rule(
                        @list.List([(l_3, x_tm), (r_3, p_tm), (ntm, q_tm)]),
                        pthm_34,
                      )
                      let (l_4, r_4) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_3)),
                      )
                      @kernel.trans(
                        th1_3,
                        @equal.ap_term(l_4, @calc_num.num_mult_conv(r_4)),
                      )
                    } else if op == mul_tm {
                      let th1_4 = @kernel.inst_rule(
                        @list.List([(l_3, x_tm), (r_3, y_tm), (ntm, q_tm)]),
                        pthm_33,
                      )
                      let (xy, z) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_4)),
                      )
                      let (x, y) = @kernel.dest_comb(xy)
                      let thl = monomial_pow(y, l_3, ntm)
                      let thr = monomial_pow(z, r_3, ntm)
                      @kernel.trans(
                        th1_4,
                        @kernel.mk_comb_rule(@equal.ap_term(x, thl), thr),
                      )
                    } else {
                      @kernel.refl(tm_2)
                    }
                  }
                }
              }
              let monomial_pow_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x53 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_3 = x53
                let (lop_1, r_5) = @kernel.dest_comb(tm_3)
                let (op_1, l_5) = @kernel.dest_comb(lop_1)
                if op_1 != pow_tm || !@nums.is_numeral(r_5) {
                  raise Failure("MONOMIAL_POW_CONV")
                } else if r_5 == zeron_tm {
                  @kernel.inst_rule(@list.List([(l_5, x_tm)]), pthm_35)
                } else if r_5 == onen_tm {
                  @kernel.inst_rule(@list.List([(l_5, x_tm)]), pthm_36)
                } else {
                  monomial_deone(monomial_pow(tm_3, l_5, r_5))
                }
              }
              let powvar : (@kernel.Term) -> @kernel.Term raise = fn(
                x54 : @kernel.Term,
              ) -> @kernel.Term raise {
                let tm_4 = x54
                if is_semiring_constant(tm_4) {
                  one_tm
                } else {
                  try {
                    let (lop_2, r_6) = @kernel.dest_comb(tm_4)
                    let (op_2, l_6) = @kernel.dest_comb(lop_2)
                    if op_2 == pow_tm && @nums.is_numeral(r_6) {
                      l_6
                    } else {
                      raise Failure("")
                    }
                  } catch {
                    Failure(_) => tm_4
                    e => raise e
                  }
                }
              }
              let vorder : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise = fn(
                x55 : @kernel.Term,
              ) -> ((@kernel.Term) -> Int64 raise) raise {
                let x_1 = x55
                fn(x56 : @kernel.Term) -> Int64 raise {
                  let y_1 = x56
                  if x_1 == y_1 {
                    0L
                  } else if x_1 == one_tm {
                    -1L
                  } else if y_1 == one_tm {
                    1L
                  } else if variable_order(x_1)(y_1) {
                    -1L
                  } else {
                    1L
                  }
                }
              }
              fn monomial_mul(
                x57 : @kernel.Term,
                x58 : @kernel.Term,
                x59 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_5 = x57
                let l_7 = x58
                let r_7 = x59
                try {
                  let (lx_1, ly) = dest_mul(l_7)
                  let vl = powvar(lx_1)
                  try {
                    let (rx_2, ry) = dest_mul(r_7)
                    let vr = powvar(rx_2)
                    let ord = vorder(vl)(vr)
                    if ord == 0L {
                      let th1_5 = @kernel.inst_rule(
                        @list.List([
                          (lx_1, lx_tm),
                          (ly, ly_tm),
                          (rx_2, rx_tm),
                          (ry, ry_tm),
                        ]),
                        pthm_15,
                      )
                      let (tm1_3, tm2_3) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_5)),
                      )
                      let (tm3, tm4) = @kernel.dest_comb(tm1_3)
                      let th2 = @equal.ap_thm(
                        @equal.ap_term(tm3, powvar_mul_conv(tm4)),
                        tm2_3,
                      )
                      let th3 = @kernel.trans(th1_5, th2)
                      let (tm5, tm6) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th3)),
                      )
                      let (tm7, tm8) = @kernel.dest_comb(tm6)
                      let th4 = monomial_mul(tm6, @kernel.rand(tm7), tm8)
                      @kernel.trans(th3, @equal.ap_term(tm5, th4))
                    } else {
                      let th0 = if ord < 0L { pthm_16 } else { pthm_17 }
                      let th1_6 = @kernel.inst_rule(
                        @list.List([
                          (lx_1, lx_tm),
                          (ly, ly_tm),
                          (rx_2, rx_tm),
                          (ry, ry_tm),
                        ]),
                        th0,
                      )
                      let (tm1_4, tm2_4) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_6)),
                      )
                      let (tm3_1, tm4_1) = @kernel.dest_comb(tm2_4)
                      @kernel.trans(
                        th1_6,
                        @equal.ap_term(
                          tm1_4,
                          monomial_mul(tm2_4, @kernel.rand(tm3_1), tm4_1),
                        ),
                      )
                    }
                  } catch {
                    Failure(_) => {
                      let vr_1 = powvar(r_7)
                      let ord_1 = vorder(vl)(vr_1)
                      if ord_1 == 0L {
                        let th1_7 = @kernel.inst_rule(
                          @list.List([(lx_1, lx_tm), (ly, ly_tm), (r_7, rx_tm)]),
                          pthm_18,
                        )
                        let (tm1_5, tm2_5) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_7)),
                        )
                        let (tm3_2, tm4_2) = @kernel.dest_comb(tm1_5)
                        let th2_1 = @equal.ap_thm(
                          @equal.ap_term(tm3_2, powvar_mul_conv(tm4_2)),
                          tm2_5,
                        )
                        @kernel.trans(th1_7, th2_1)
                      } else if ord_1 < 0L {
                        let th1_8 = @kernel.inst_rule(
                          @list.List([(lx_1, lx_tm), (ly, ly_tm), (r_7, rx_tm)]),
                          pthm_19,
                        )
                        let (tm1_6, tm2_6) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_8)),
                        )
                        let (tm3_3, tm4_3) = @kernel.dest_comb(tm2_6)
                        @kernel.trans(
                          th1_8,
                          @equal.ap_term(
                            tm1_6,
                            monomial_mul(tm2_6, @kernel.rand(tm3_3), tm4_3),
                          ),
                        )
                      } else {
                        @kernel.inst_rule(
                          @list.List([(l_7, lx_tm), (r_7, rx_tm)]),
                          pthm_20,
                        )
                      }
                    }
                    e => raise e
                  }
                } catch {
                  Failure(_) => {
                    let vl_1 = powvar(l_7)
                    try {
                      let (rx_3, ry_1) = dest_mul(r_7)
                      let vr_2 = powvar(rx_3)
                      let ord_2 = vorder(vl_1)(vr_2)
                      if ord_2 == 0L {
                        let th1_9 = @kernel.inst_rule(
                          @list.List([
                            (l_7, lx_tm),
                            (rx_3, rx_tm),
                            (ry_1, ry_tm),
                          ]),
                          pthm_21,
                        )
                        let (tm1_7, tm2_7) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_9)),
                        )
                        let (tm3_4, tm4_4) = @kernel.dest_comb(tm1_7)
                        @kernel.trans(
                          th1_9,
                          @equal.ap_thm(
                            @equal.ap_term(tm3_4, powvar_mul_conv(tm4_4)),
                            tm2_7,
                          ),
                        )
                      } else if ord_2 > 0L {
                        let th1_10 = @kernel.inst_rule(
                          @list.List([
                            (l_7, lx_tm),
                            (rx_3, rx_tm),
                            (ry_1, ry_tm),
                          ]),
                          pthm_22,
                        )
                        let (tm1_8, tm2_8) = @kernel.dest_comb(
                          @kernel.rand(@kernel.concl(th1_10)),
                        )
                        let (tm3_5, tm4_5) = @kernel.dest_comb(tm2_8)
                        @kernel.trans(
                          th1_10,
                          @equal.ap_term(
                            tm1_8,
                            monomial_mul(tm2_8, @kernel.rand(tm3_5), tm4_5),
                          ),
                        )
                      } else {
                        @kernel.refl(tm_5)
                      }
                    } catch {
                      Failure(_) => {
                        let vr_3 = powvar(r_7)
                        let ord_3 = vorder(vl_1)(vr_3)
                        if ord_3 == 0L {
                          powvar_mul_conv(tm_5)
                        } else if ord_3 > 0L {
                          @kernel.inst_rule(
                            @list.List([(l_7, lx_tm), (r_7, rx_tm)]),
                            pthm_20,
                          )
                        } else {
                          @kernel.refl(tm_5)
                        }
                      }
                      e => raise e
                    }
                  }
                  e => raise e
                }
              }
              let monomial_mul_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x60 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_6 = x60
                let (l_8, r_8) = dest_mul(tm_6)
                monomial_deone(monomial_mul(tm_6, l_8, r_8))
              }
              fn pmm_conv(x61 : @kernel.Term) -> @kernel.Thm raise {
                let tm_7 = x61
                let (l_9, r_9) = dest_mul(tm_7)
                try {
                  let (y_2, z_1) = dest_add(r_9)
                  let th1_11 = @kernel.inst_rule(
                    @list.List([(l_9, x_tm), (y_2, y_tm), (z_1, z_tm)]),
                    pthm_37,
                  )
                  let (tm1_9, tm2_9) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th1_11)),
                  )
                  let (tm3_6, tm4_6) = @kernel.dest_comb(tm1_9)
                  let t62 = pmm_conv(tm2_9)
                  let th2_2 = @kernel.mk_comb_rule(
                    @equal.ap_term(tm3_6, monomial_mul_conv(tm4_6)),
                    t62,
                  )
                  @kernel.trans(th1_11, th2_2)
                } catch {
                  Failure(_) => monomial_mul_conv(tm_7)
                  e => raise e
                }
              }
              let polynomial_monomial_mul_conv : (@kernel.Term) -> @kernel.Thm raise = pmm_conv
              let monomial_add_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x63 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_8 = x63
                let (l_10, r_10) = dest_add(tm_8)
                if is_semiring_constant(l_10) && is_semiring_constant(r_10) {
                  semiring_add_conv(tm_8)
                } else {
                  let th1_12 = if is_mul(l_10) &&
                    is_semiring_constant(@equal.lhand(l_10)) {
                    if is_mul(r_10) && is_semiring_constant(@equal.lhand(r_10)) {
                      let t64 = (@kernel.rand(r_10), m_tm)
                      let t65 = (@equal.lhand(r_10), b_tm)
                      @kernel.inst_rule(
                        @list.List([(@equal.lhand(l_10), a_tm), t65, t64]),
                        pthm_02,
                      )
                    } else {
                      @kernel.inst_rule(
                        @list.List([(@equal.lhand(l_10), a_tm), (r_10, m_tm)]),
                        pthm_03,
                      )
                    }
                  } else if is_mul(r_10) &&
                    is_semiring_constant(@equal.lhand(r_10)) {
                    @kernel.inst_rule(
                      @list.List([(@equal.lhand(r_10), a_tm), (l_10, m_tm)]),
                      pthm_04,
                    )
                  } else {
                    @kernel.inst_rule(@list.List([(r_10, m_tm)]), pthm_05)
                  }
                  let (tm1_10, tm2_10) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th1_12)),
                  )
                  let (tm3_7, tm4_7) = @kernel.dest_comb(tm1_10)
                  let th2_3 = @equal.ap_term(tm3_7, semiring_add_conv(tm4_7))
                  let th3_1 = @kernel.trans(
                    th1_12,
                    @equal.ap_thm(th2_3, tm2_10),
                  )
                  let tm5_1 = @kernel.rand(@kernel.concl(th3_1))
                  if @equal.lhand(tm5_1) == zero_tm {
                    @kernel.trans(
                      th3_1,
                      @kernel.inst_rule(
                        @list.List([(@kernel.rand(tm5_1), m_tm)]),
                        pthm_06,
                      ),
                    )
                  } else {
                    monomial_deone(th3_1)
                  }
                }
              }
              let powervars : (@kernel.Term) -> @list.List[@kernel.Term] raise = fn(
                x66 : @kernel.Term,
              ) -> @list.List[@kernel.Term] raise {
                let tm_9 = x66
                let ptms = @lib.striplist(dest_mul, tm_9)
                if is_semiring_constant(@lib.hd(ptms)) {
                  @lib.tl(ptms)
                } else {
                  ptms
                }
              }
              let dest_varpow : (@kernel.Term) -> (@kernel.Term, @num.Num) raise = fn(
                x67 : @kernel.Term,
              ) -> (@kernel.Term, @num.Num) raise {
                let tm_10 = x67
                try {
                  let (x_2, n) = dest_pow(tm_10)
                  (x_2, @basics.dest_numeral(n))
                } catch {
                  Failure(_) =>
                    (
                      tm_10,
                      if is_semiring_constant(tm_10) {
                        @num.num_0
                      } else {
                        @num.num_1
                      },
                    )
                  e => raise e
                }
              }
              fn lexorder(
                x68 : @list.List[(@kernel.Term, @num.Num)],
                x69 : @list.List[(@kernel.Term, @num.Num)],
              ) -> Int64 raise {
                let l1 = x68
                let l2 = x69
                match (l1, l2) {
                  (Empty, Empty) => 0L
                  (vps, Empty) => -1L
                  (Empty, vps_1) => 1L
                  (More((x1_1, n1), tail=vs1), More((x2, n2), tail=vs2)) =>
                    if variable_order(x1_1)(x2) {
                      1L
                    } else if variable_order(x2)(x1_1) {
                      -1L
                    } else if @num.lt_num(n1, n2) {
                      -1L
                    } else if @num.lt_num(n2, n1) {
                      1L
                    } else {
                      lexorder(vs1, vs2)
                    }
                }
              }
              let morder : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise = fn(
                x70 : @kernel.Term,
              ) -> ((@kernel.Term) -> Int64 raise) raise {
                let tm1_11 = x70
                fn(x71 : @kernel.Term) -> Int64 raise {
                  let tm2_11 = x71
                  let vdegs1 = @lib.map(dest_varpow, powervars(tm1_11))
                  let vdegs2 = @lib.map(dest_varpow, powervars(tm2_11))
                  let deg1 = @lib.itlist(
                    fn(
                      x75 : (@kernel.Term, @num.Num),
                      x76 : @num.Num,
                    ) -> @num.Num raise {
                      (fn(
                        x72 : @num.Num,
                      ) -> ((@num.Num) -> @num.Num raise) raise {
                        fn(x73 : @num.Num) -> @num.Num raise {
                          @num.add_num(x72, x73)
                        }
                      })(
                        (fn(x74 : (@kernel.Term, @num.Num)) -> @num.Num raise {
                          x74.1
                        })(x75),
                      )(x76)
                    },
                    vdegs1,
                    @num.num_0,
                  )
                  let deg2 = @lib.itlist(
                    fn(
                      x80 : (@kernel.Term, @num.Num),
                      x81 : @num.Num,
                    ) -> @num.Num raise {
                      (fn(
                        x77 : @num.Num,
                      ) -> ((@num.Num) -> @num.Num raise) raise {
                        fn(x78 : @num.Num) -> @num.Num raise {
                          @num.add_num(x77, x78)
                        }
                      })(
                        (fn(x79 : (@kernel.Term, @num.Num)) -> @num.Num raise {
                          x79.1
                        })(x80),
                      )(x81)
                    },
                    vdegs2,
                    @num.num_0,
                  )
                  if @num.lt_num(deg1, deg2) {
                    -1L
                  } else if @num.gt_num(deg1, deg2) {
                    1L
                  } else {
                    lexorder(vdegs1, vdegs2)
                  }
                }
              }
              let dezero_rule : (@kernel.Thm) -> @kernel.Thm raise = fn(
                x82 : @kernel.Thm,
              ) -> @kernel.Thm raise {
                let th_2 = x82
                let tm_11 = @kernel.rand(@kernel.concl(th_2))
                if !is_add(tm_11) {
                  th_2
                } else {
                  let (lop_3, r_11) = @kernel.dest_comb(tm_11)
                  let l_11 = @kernel.rand(lop_3)
                  if l_11 == zero_tm {
                    @kernel.trans(
                      th_2,
                      @kernel.inst_rule(@list.List([(r_11, a_tm)]), pthm_07),
                    )
                  } else if r_11 == zero_tm {
                    @kernel.trans(
                      th_2,
                      @kernel.inst_rule(@list.List([(l_11, a_tm)]), pthm_08),
                    )
                  } else {
                    th_2
                  }
                }
              }
              fn padd(x83 : @kernel.Term) -> @kernel.Thm raise {
                let tm_12 = x83
                let (l_12, r_12) = dest_add(tm_12)
                if l_12 == zero_tm {
                  @kernel.inst_rule(@list.List([(r_12, a_tm)]), pthm_07)
                } else if r_12 == zero_tm {
                  @kernel.inst_rule(@list.List([(l_12, a_tm)]), pthm_08)
                } else if is_add(l_12) {
                  let (a, b) = dest_add(l_12)
                  if is_add(r_12) {
                    let (c, d) = dest_add(r_12)
                    let ord_4 = morder(a)(c)
                    if ord_4 == 0L {
                      let th1_13 = @kernel.inst_rule(
                        @list.List([(a, a_tm), (b, b_tm), (c, c_tm), (d, d_tm)]),
                        pthm_23,
                      )
                      let (tm1_12, tm2_12) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_13)),
                      )
                      let (tm3_8, tm4_8) = @kernel.dest_comb(tm1_12)
                      let th2_4 = @equal.ap_term(
                        tm3_8,
                        monomial_add_conv(tm4_8),
                      )
                      dezero_rule(
                        @kernel.trans(
                          th1_13,
                          @kernel.mk_comb_rule(th2_4, padd(tm2_12)),
                        ),
                      )
                    } else {
                      let th1_14 = if ord_4 > 0L {
                        @kernel.inst_rule(
                          @list.List([(a, a_tm), (b, b_tm), (r_12, c_tm)]),
                          pthm_24,
                        )
                      } else {
                        @kernel.inst_rule(
                          @list.List([(l_12, a_tm), (c, c_tm), (d, d_tm)]),
                          pthm_25,
                        )
                      }
                      let (tm1_13, tm2_13) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_14)),
                      )
                      dezero_rule(
                        @kernel.trans(
                          th1_14,
                          @equal.ap_term(tm1_13, padd(tm2_13)),
                        ),
                      )
                    }
                  } else {
                    let ord_5 = morder(a)(r_12)
                    if ord_5 == 0L {
                      let th1_15 = @kernel.inst_rule(
                        @list.List([(a, a_tm), (b, b_tm), (r_12, c_tm)]),
                        pthm_26,
                      )
                      let (tm1_14, tm2_14) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_15)),
                      )
                      let (tm3_9, tm4_9) = @kernel.dest_comb(tm1_14)
                      let th2_5 = @equal.ap_thm(
                        @equal.ap_term(tm3_9, monomial_add_conv(tm4_9)),
                        tm2_14,
                      )
                      dezero_rule(@kernel.trans(th1_15, th2_5))
                    } else if ord_5 > 0L {
                      let th1_16 = @kernel.inst_rule(
                        @list.List([(a, a_tm), (b, b_tm), (r_12, c_tm)]),
                        pthm_24,
                      )
                      let (tm1_15, tm2_15) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th1_16)),
                      )
                      dezero_rule(
                        @kernel.trans(
                          th1_16,
                          @equal.ap_term(tm1_15, padd(tm2_15)),
                        ),
                      )
                    } else {
                      dezero_rule(
                        @kernel.inst_rule(
                          @list.List([(l_12, a_tm), (r_12, c_tm)]),
                          pthm_27,
                        ),
                      )
                    }
                  }
                } else if is_add(r_12) {
                  let (c_1, d_1) = dest_add(r_12)
                  let ord_6 = morder(l_12)(c_1)
                  if ord_6 == 0L {
                    let th1_17 = @kernel.inst_rule(
                      @list.List([(l_12, a_tm), (c_1, c_tm), (d_1, d_tm)]),
                      pthm_28,
                    )
                    let (tm1_16, tm2_16) = @kernel.dest_comb(
                      @kernel.rand(@kernel.concl(th1_17)),
                    )
                    let (tm3_10, tm4_10) = @kernel.dest_comb(tm1_16)
                    let th2_6 = @equal.ap_thm(
                      @equal.ap_term(tm3_10, monomial_add_conv(tm4_10)),
                      tm2_16,
                    )
                    dezero_rule(@kernel.trans(th1_17, th2_6))
                  } else if ord_6 > 0L {
                    @kernel.refl(tm_12)
                  } else {
                    let th1_18 = @kernel.inst_rule(
                      @list.List([(l_12, a_tm), (c_1, c_tm), (d_1, d_tm)]),
                      pthm_25,
                    )
                    let (tm1_17, tm2_17) = @kernel.dest_comb(
                      @kernel.rand(@kernel.concl(th1_18)),
                    )
                    dezero_rule(
                      @kernel.trans(
                        th1_18,
                        @equal.ap_term(tm1_17, padd(tm2_17)),
                      ),
                    )
                  }
                } else {
                  let ord_7 = morder(l_12)(r_12)
                  if ord_7 == 0L {
                    monomial_add_conv(tm_12)
                  } else if ord_7 > 0L {
                    dezero_rule(@kernel.refl(tm_12))
                  } else {
                    dezero_rule(
                      @kernel.inst_rule(
                        @list.List([(l_12, a_tm), (r_12, c_tm)]),
                        pthm_27,
                      ),
                    )
                  }
                }
              }
              let polynomial_add_conv : (@kernel.Term) -> @kernel.Thm raise = padd
              fn pmul(x84 : @kernel.Term) -> @kernel.Thm raise {
                let tm_13 = x84
                let (l_13, r_13) = dest_mul(tm_13)
                if !is_add(l_13) {
                  polynomial_monomial_mul_conv(tm_13)
                } else if !is_add(r_13) {
                  let th1_19 = @kernel.inst_rule(
                    @list.List([(l_13, a_tm), (r_13, b_tm)]),
                    pthm_09,
                  )
                  @kernel.trans(
                    th1_19,
                    polynomial_monomial_mul_conv(
                      @kernel.rand(@kernel.concl(th1_19)),
                    ),
                  )
                } else {
                  let (a_1, b_1) = dest_add(l_13)
                  let th1_20 = @kernel.inst_rule(
                    @list.List([(a_1, a_tm), (b_1, b_tm), (r_13, c_tm)]),
                    pthm_10,
                  )
                  let (tm1_18, tm2_18) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th1_20)),
                  )
                  let (tm3_11, tm4_11) = @kernel.dest_comb(tm1_18)
                  let th2_7 = @equal.ap_term(
                    tm3_11,
                    polynomial_monomial_mul_conv(tm4_11),
                  )
                  let th3_2 = @kernel.trans(
                    th1_20,
                    @kernel.mk_comb_rule(th2_7, pmul(tm2_18)),
                  )
                  @kernel.trans(
                    th3_2,
                    polynomial_add_conv(@kernel.rand(@kernel.concl(th3_2))),
                  )
                }
              }
              let polynomial_mul_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x85 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_14 = x85
                let (l_14, r_14) = dest_mul(tm_14)
                if l_14 == zero_tm {
                  @kernel.inst_rule(@list.List([(r_14, a_tm)]), pthm_11)
                } else if r_14 == zero_tm {
                  @kernel.inst_rule(@list.List([(l_14, a_tm)]), pthm_12)
                } else if l_14 == one_tm {
                  @kernel.inst_rule(@list.List([(r_14, a_tm)]), pthm_13)
                } else if r_14 == one_tm {
                  @kernel.inst_rule(@list.List([(l_14, a_tm)]), pthm_14)
                } else {
                  pmul(tm_14)
                }
              }
              fn ppow(x86 : @kernel.Term) -> @kernel.Thm raise {
                let tm_15 = x86
                let (l_15, n_1) = dest_pow(tm_15)
                if n_1 == zeron_tm {
                  @kernel.inst_rule(@list.List([(l_15, x_tm)]), pthm_35)
                } else if n_1 == onen_tm {
                  @kernel.inst_rule(@list.List([(l_15, x_tm)]), pthm_36)
                } else {
                  let th1_21 = @calc_num.num_conv(n_1)
                  let th2_8 = @kernel.inst_rule(
                    @list.List([
                      (l_15, x_tm),
                      (@kernel.rand(@kernel.rand(@kernel.concl(th1_21))), q_tm),
                    ]),
                    pthm_38,
                  )
                  let (tm1_19, tm2_19) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th2_8)),
                  )
                  let th3_3 = @kernel.trans(
                    th2_8,
                    @equal.ap_term(tm1_19, ppow(tm2_19)),
                  )
                  let th4_1 = @kernel.trans(
                    @equal.ap_term(@kernel.rator(tm_15), th1_21),
                    th3_3,
                  )
                  @kernel.trans(
                    th4_1,
                    polynomial_mul_conv(@kernel.rand(@kernel.concl(th4_1))),
                  )
                }
              }
              let polynomial_pow_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x87 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_16 = x87
                if is_add(@equal.lhand(tm_16)) {
                  ppow(tm_16)
                } else {
                  monomial_pow_conv(tm_16)
                }
              }
              let polynomial_neg_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x88 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_17 = x88
                let (l_16, r_15) = @kernel.dest_comb(tm_17)
                if l_16 != neg_tm_1 {
                  raise Failure("POLYNOMIAL_NEG_CONV")
                } else {
                  let th1_22 = @kernel.inst_rule(
                    @list.List([(r_15, x_tm)]),
                    nthm_1_1,
                  )
                  @kernel.trans(
                    th1_22,
                    polynomial_monomial_mul_conv(
                      @kernel.rand(@kernel.concl(th1_22)),
                    ),
                  )
                }
              }
              let polynomial_sub_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
                x89 : @kernel.Term,
              ) -> @kernel.Thm raise {
                let tm_18 = x89
                let (l_17, r_16) = dest_sub_1(tm_18)
                let th1_23 = @kernel.inst_rule(
                  @list.List([(l_17, x_tm), (r_16, y_tm)]),
                  nthm_2_1,
                )
                let (tm1_20, tm2_20) = @kernel.dest_comb(
                  @kernel.rand(@kernel.concl(th1_23)),
                )
                let th2_9 = @equal.ap_term(
                  tm1_20,
                  polynomial_monomial_mul_conv(tm2_20),
                )
                @kernel.trans(
                  th1_23,
                  @kernel.trans(
                    th2_9,
                    polynomial_add_conv(@kernel.rand(@kernel.concl(th2_9))),
                  ),
                )
              }
              fn polynomial_conv(x90 : @kernel.Term) -> @kernel.Thm raise {
                let tm_19 = x90
                if !@kernel.is_comb(tm_19) || is_semiring_constant(tm_19) {
                  @kernel.refl(tm_19)
                } else {
                  let (lop_4, r_17) = @kernel.dest_comb(tm_19)
                  if lop_4 == neg_tm_1 {
                    let th1_24 = @equal.ap_term(lop_4, polynomial_conv(r_17))
                    @kernel.trans(
                      th1_24,
                      polynomial_neg_conv(@kernel.rand(@kernel.concl(th1_24))),
                    )
                  } else if !@kernel.is_comb(lop_4) {
                    @kernel.refl(tm_19)
                  } else {
                    let (op_3, l_18) = @kernel.dest_comb(lop_4)
                    if op_3 == pow_tm && @nums.is_numeral(r_17) {
                      let th1_25 = @equal.ap_thm(
                        @equal.ap_term(op_3, polynomial_conv(l_18)),
                        r_17,
                      )
                      @kernel.trans(
                        th1_25,
                        polynomial_pow_conv(@kernel.rand(@kernel.concl(th1_25))),
                      )
                    } else if op_3 == add_tm ||
                      op_3 == mul_tm ||
                      op_3 == sub_tm_1 {
                      let t91 = polynomial_conv(r_17)
                      let th1_26 = @kernel.mk_comb_rule(
                        @equal.ap_term(op_3, polynomial_conv(l_18)),
                        t91,
                      )
                      let fn_ : (@kernel.Term) -> @kernel.Thm raise = if op_3 ==
                        add_tm {
                        polynomial_add_conv
                      } else if op_3 == mul_tm {
                        polynomial_mul_conv
                      } else {
                        polynomial_sub_conv
                      }
                      @kernel.trans(
                        th1_26,
                        fn_(@kernel.rand(@kernel.concl(th1_26))),
                      )
                    } else {
                      @kernel.refl(tm_19)
                    }
                  }
                }
              }
              (
                polynomial_neg_conv, polynomial_add_conv, polynomial_sub_conv, polynomial_mul_conv,
                polynomial_pow_conv, polynomial_conv,
              )
            }
          }
          _ => raise @lib.MatchFailure("tscript.ml:95")
        }
      }
    }
  })
}

///|
let semiring_normalizers_conv_c : @lib.Cell[
  (@kernel.Thm) -> ((@kernel.Thm) -> ((
    (
      (@kernel.Term) -> Bool raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
      (@kernel.Term) -> @kernel.Thm raise,
    ),
  ) -> (((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> (
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
  ) raise) raise) raise) raise,
] = @lib.Cell::new("SEMIRING_NORMALIZERS_CONV")

///|
/// `SEMIRING_NORMALIZERS_CONV`
pub fn semiring_normalizers_conv(
  x : @kernel.Thm,
) -> ((@kernel.Thm) -> ((
  (
    (@kernel.Term) -> Bool raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
    (@kernel.Term) -> @kernel.Thm raise,
  ),
) -> (((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> (
  (@kernel.Term) -> @kernel.Thm raise,
  (@kernel.Term) -> @kernel.Thm raise,
  (@kernel.Term) -> @kernel.Thm raise,
  (@kernel.Term) -> @kernel.Thm raise,
  (@kernel.Term) -> @kernel.Thm raise,
  (@kernel.Term) -> @kernel.Thm raise,
) raise) raise) raise) raise {
  semiring_normalizers_conv_c.get()(x)
}

///|
/// NUM_NORMALIZE_CONV
fn step_2() -> Unit raise {
  let t92 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t93 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @arith.exp(),
        @arith.mult_clauses(),
        @arith.add_clauses(),
        @arith.left_add_distrib(),
      ]),
    ),
    t92,
  )
  let sth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Num, ∀ y : Num, ∀ z : Num, x + (y + z) == x + y + z) && (∀ x : Num, ∀ y : Num, x + y == y + x) && (∀ x : Num, 0 + x == x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y * z) == x * y * z) && (∀ x : Num, ∀ y : Num, x * y == y * x) && (∀ x : Num, 1 * x == x) && (∀ x : Num, 0 * x == 0) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y + z) == x * y + x * z) && (∀ x : Num, EXP(x, 0) == 1) && (∀ x : Num, ∀ n : Num, EXP(x, SUC(n)) == x * EXP(x, n))"),
    t93,
  )
  let rth = @bool.truth()
  let is_semiring_constant : (@kernel.Term) -> Bool raise = @nums.is_numeral
  let semiring_add_conv : (@kernel.Term) -> @kernel.Thm raise = @calc_num.num_add_conv
  let semiring_mul_conv : (@kernel.Term) -> @kernel.Thm raise = @calc_num.num_mult_conv
  let semiring_pow_conv : (@kernel.Term) -> @kernel.Thm raise = @calc_num.num_exp_conv
  let (_, _, _, _, _, num_normalize_conv_1) = semiring_normalizers_conv(sth)(
    rth,
  )(
    (
      is_semiring_constant, semiring_add_conv, semiring_mul_conv, semiring_pow_conv,
    ),
  )(fn(x94 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x95 : @kernel.Term) -> Bool raise { @lib.compare(x94, x95) < 0 }
  })
  num_normalize_conv_c.set(num_normalize_conv_1)
}

///|
let num_normalize_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_NORMALIZE_CONV",
)

///|
/// `NUM_NORMALIZE_CONV`
pub fn num_normalize_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_normalize_conv_c.get()(x)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
