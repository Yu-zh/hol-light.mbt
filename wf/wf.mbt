// Translated from upstream wf.ml; edit this file directly.

///|
/// wf.ml:16
fn step_1() -> Unit raise {
  @printer.parse_as_infix("<<", (12L, "right"))
}

///|
/// WF
fn step_2() -> Unit raise {
  wf_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(WF : ((A, A) -> Bool) -> Bool)((op_lt_lt : (A, A) -> Bool)) == (∀ P : (A) -> Bool, (∃ x : A, P(x)) → (∃ x : A, P(x) && (∀ y : A, op_lt_lt(y, x) → !P(y))))"),
    ),
  )
}

///|
let wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF")

///|
/// `WF`
pub fn wf() -> @kernel.Thm {
  wf_c.get()
}

///|
/// WF_EQ
fn step_3() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([wf()])), t1)
  wf_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) == (∀ P : (A) -> Bool, (∃ x : A, P(x)) == (∃ x : A, P(x) && (∀ y : A, op_lt_lt(y, x) → !P(y))))"),
      t2,
    ),
  )
}

///|
let wf_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_EQ")

///|
/// `WF_EQ`
pub fn wf_eq() -> @kernel.Thm {
  wf_eq_c.get()
}

///|
/// WF_IND
fn step_4() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([]))
  let t10 = @simp.rewrite_tac(@list.List([]))
  let t6 = @term_syntax.parse_term("(x : A) => !(P : (A) -> Bool)(x)")
  let t9 = @tactics.pop_assum(fn(
    x8 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x3 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s4 = @tactics.mp_tac(x3)
      fn(
        x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s4(x5)
      }
    })(((x7 : @kernel.Thm) => @bool.spec(t6, x7))(x8))
  })
  let t12 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([wf()])),
              @tactics.eq_tac,
            ),
            @tactics.disch_tac,
          ),
          @tactics.gen_tac,
        ),
        t9,
      ),
      t10,
    ),
    t11,
  )
  wf_ind_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) == (∀ P : (A) -> Bool, (∀ x : A, (∀ y : A, op_lt_lt(y, x) → P(y)) → P(x)) → (∀ x : A, P(x)))"),
      t12,
    ),
  )
}

///|
let wf_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_IND")

///|
/// `WF_IND`
pub fn wf_ind() -> @kernel.Thm {
  wf_ind_c.get()
}

///|
/// WF_DCHAIN
fn step_5() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([]))
  let t41 = @simp.rewrite_tac(@list.List([]))
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(y : A) => ∃ n : Num, y == (s : (Num) -> A)(n)")),
      t41,
    ),
    t42,
  )
  let t40 = @meson.asm_meson_tac(@list.List([]))
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, (P : (A) -> Bool)((s : (Num) -> A)(n)) && (op_lt_lt : (A, A) -> Bool)(s(SUC(n)), s(n))"),
    fn(
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
      let th = x36
      @meson.asm_meson_tac(@list.List([th]))
    },
  )
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> A)"))
  let t32 = @term_syntax.parse_term("(s : (Num) -> A)(0) == (a : A) && (∀ n : Num, s(SUC(n)) == (f : (A) -> A)(s(n)))")
  let t33 = @tactics.choose_tac(
    @recursion.prove_recursive_functions_exist(@nums.num_recursion())(t32),
  )
  let t31 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t29 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t30 = @list.List([@meson.asm_meson_tac(@list.List([])), t29])
  let t28 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∃ y : A, (P : (A) -> Bool)(x) → P(y) && (op_lt_lt : (A, A) -> Bool)(y, x)"),
    fn(
      x25 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s26 = @tactics.mp_tac(x25)
      fn(
        x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s26(x27)
      }
    },
  )
  let t19 = @term_syntax.parse_term("(a : A)")
  let t24 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x20 : @kernel.Thm) => @tactics.x_choose_tac(t19, x20),
      fn(
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
        let s22 = @tactics.assume_tac(x21)
        fn(
          x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s22(x23)
        }
      },
    ),
  )
  let t17 = @simp.rewrite_rule(@list.List([@class.not_imp()]))
  let t44 = @list.List([
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
                          @tactics.pop_assum(fn(
                            x18 : @kernel.Thm,
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
                              x14 : @kernel.Thm,
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
                              let s15 = @tactics.mp_tac(x14)
                              fn(
                                x16 : (
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
                                s15(x16)
                              }
                            })(t17(x18))
                          }),
                          t24,
                        ),
                        t28,
                      ),
                      t30,
                    ),
                    t31,
                  ),
                  t33,
                ),
                t34,
              ),
              t35,
            ),
            t38,
          ),
          @nums.induct_tac,
        ),
        t39,
      ),
      t40,
    ),
    t43,
  ])
  let t13 = @tactics.disch_then(@tactics.choose_tac)
  let t45 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            wf(),
            @class.taut(@term_syntax.parse_term("((a : Bool) == !(b : Bool)) == (!a == b)")),
            @class.not_forall_thm(),
          ]),
        ),
        @tactics.eq_tac,
      ),
      t13,
    ),
    t44,
  )
  wf_dchain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) == !(∃ s : (Num) -> A, ∀ n : Num, op_lt_lt(s(SUC(n)), s(n)))"),
      t45,
    ),
  )
}

///|
let wf_dchain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_DCHAIN")

///|
/// `WF_DCHAIN`
pub fn wf_dchain() -> @kernel.Thm {
  wf_dchain_c.get()
}

///|
/// WF_DHAIN_TRANSITIVE
fn step_6() -> Unit raise {
  let t51 = @meson.asm_meson_tac(@list.List([]))
  let t50 = @tactics.match_mp_tac(@arith.transitive_stepwise_lt())
  let t49 = @simp.simp_tac(@list.List([@arith.lt()]))
  let t48 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> A)"))
  let t47 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t46 = @simp.rewrite_tac(@list.List([wf_dchain()]))
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                    t46,
                  ),
                  @tactics.ap_term_tac,
                ),
                @tactics.eq_tac,
              ),
              t47,
            ),
            t48,
          ),
          t49,
        ),
        @tactics.disch_tac,
      ),
      t50,
    ),
    t51,
  )
  wf_dhain_transitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, (∀ x : A, ∀ y : A, ∀ z : A, `<<`(x, y) && `<<`(y, z) → `<<`(x, z)) → WF(`<<`) == !(∃ s : (Num) -> A, ∀ i : Num, ∀ j : Num, i < j → `<<`(s(j), s(i)))"),
      t52,
    ),
  )
}

///|
let wf_dhain_transitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_DHAIN_TRANSITIVE",
)

///|
/// `WF_DHAIN_TRANSITIVE`
pub fn wf_dhain_transitive() -> @kernel.Thm {
  wf_dhain_transitive_c.get()
}

///|
/// WF_UREC
fn step_7() -> Unit raise {
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t59 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x56 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s57 = @tactics.mp_tac(x56)
      fn(
        x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s57(x58)
      }
    }),
  )
  let t55 = @tactics.first_assum(@tactics.match_mp_tac)
  let t54 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t53 = @tactics.repeat_tac(@tactics.strip_tac)
  let t61 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@simp.rewrite_tac(@list.List([wf_ind()])), t53),
            t54,
          ),
          t55,
        ),
        @tactics.gen_tac,
      ),
      t59,
    ),
    t60,
  )
  wf_urec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) → (∀ H : ((A) -> B, A) -> B, (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) → (∀ f : (A) -> B, ∀ g : (A) -> B, (∀ x : A, f(x) == H(f, x)) && (∀ x : A, g(x) == H(g, x)) → f == g))"),
      t61,
    ),
  )
}

///|
let wf_urec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_UREC")

///|
/// `WF_UREC`
pub fn wf_urec() -> @kernel.Thm {
  wf_urec_c.get()
}

///|
/// WF_UREC_WF
fn step_8() -> Unit raise {
  let t90 = @meson.asm_meson_tac(@list.List([]))
  let t89 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t85 = @term_syntax.parse_term("(x : A) => true")
  let t86 = @list.List([@term_syntax.parse_term("(P : (A) -> Bool)"), t85])
  let t91 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x88 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        })(((x87 : @kernel.Thm) => @bool.specl(t86, x87))(x88))
      }),
      t89,
    ),
    t90,
  )
  let t92 = @list.List([@meson.meson_tac(@list.List([])), t91])
  let t69 = @simp.rewrite_tac(@list.List([]))
  let t65 = @term_syntax.parse_term("(f : (A) -> Bool) => (x : A) => (P : (A) -> Bool)(x) || (∀ z : A, (op_lt_lt : (A, A) -> Bool)(z, x) → f(z))")
  let t68 = @tactics.first_x_assum(fn(
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
    (fn(
      x62 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s63 = @tactics.mp_tac(x62)
      fn(
        x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s63(x64)
      }
    })(((x66 : @kernel.Thm) => @bool.spec(t65, x66))(x67))
  })
  let t93 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([wf_ind()])),
                @tactics.disch_tac,
              ),
              @tactics.gen_tac,
            ),
            @tactics.disch_tac,
          ),
          t68,
        ),
        t69,
      ),
      fn(
        x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x78 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x76 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x70 : @kernel.Term,
              ) -> ((
                (@kernel.Thm) -> ((
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
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise) raise {
                fn(
                  x71 : (@kernel.Thm) -> ((
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
                  ) raise) raise,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s72 = @tactics.subgoal_then(x70, x71)
                  fn(
                    x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s72(x73)
                  }
                }
              })(x76)(fn(
                x74 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let t = x74
                @simp.rewrite_tac(@list.List([t]))
              })
            })(((x77 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x77))(x78))
          })(
            (fn(
              x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x79.1
            })(x80),
          )
        })(x81)(x81)
      },
    ),
    t92,
  )
  wf_urec_wf_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ H : ((A) -> Bool, A) -> Bool, (∀ f : (A) -> Bool, ∀ g : (A) -> Bool, ∀ x : A, (∀ z : A, (op_lt_lt : (A, A) -> Bool)(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) → (∀ f : (A) -> Bool, ∀ g : (A) -> Bool, (∀ x : A, f(x) == H(f, x)) && (∀ x : A, g(x) == H(g, x)) → f == g)) → WF(op_lt_lt)"),
      t93,
    ),
  )
}

///|
let wf_urec_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_UREC_WF")

///|
/// `WF_UREC_WF`
pub fn wf_urec_wf() -> @kernel.Thm {
  wf_urec_wf_c.get()
}

///|
/// WF_REC_INVARIANT
fn step_9() -> Unit raise {
  let lemma = @ind_defs.prove_inductive_relations_exist(
    @term_syntax.parse_term("∀ f : (A) -> B, ∀ x : A, (∀ z : A, (op_lt_lt : (A, A) -> Bool)(z, x) → (R : (A, B) -> Bool)(z, f(z))) → R(x, (H : ((A) -> B, A) -> B)(f, x))"),
  )
  let t111 = @meson.asm_meson_tac(@list.List([]))
  let t110 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : B, (R : (A, B) -> Bool)(x, y) → (S : (A, B) -> Bool)(x, y)"),
    fn(
      x107 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s108 = @tactics.mp_tac(x107)
      fn(
        x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s108(x109)
      }
    },
  )
  let t106 = @tactics.first_x_assum(fn(
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
    let th_1 = x101
    @simp.gen_rewrite_tac(
      fn(
        x103 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s104 = @equal.binder_conv(x103)
        fn(x105 : @kernel.Term) -> @kernel.Thm raise { s104(x105) }
      },
      @list.List([th_1]),
    )
  })
  let t100 = @tactics.repeat_tac(@tactics.strip_tac)
  let t99 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t98 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, existsunique((y : B) => (R : (A, B) -> Bool)(x, y))"), fn(
    x96 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x96
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t95 = @tactics.x_choose_then(@term_syntax.parse_term("(R : (A, B) -> Bool)"))(
    @tactics.strip_assume_tac,
  )(lemma)
  let t94 = @tactics.repeat_tac(@tactics.strip_tac)
  let t112 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([wf_ind()])),
                  t94,
                ),
                t95,
              ),
              t98,
            ),
            t99,
          ),
          t100,
        ),
        t106,
      ),
      t110,
    ),
    t111,
  )
  wf_rec_invariant_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) → (∀ H : ((A) -> B, A) -> B, ∀ S : (A, B) -> Bool, (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z) && S(z, f(z))) → H(f, x) == H(g, x) && S(x, H(f, x))) → (∃ f : (A) -> B, ∀ x : A, f(x) == H(f, x)))"),
      t112,
    ),
  )
}

///|
let wf_rec_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_REC_INVARIANT",
)

///|
/// `WF_REC_INVARIANT`
pub fn wf_rec_invariant() -> @kernel.Thm {
  wf_rec_invariant_c.get()
}

///|
/// WF_REC
fn step_10() -> Unit raise {
  let t117 = @simp.asm_rewrite_tac(@list.List([]))
  let t116 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (y : B) => true"))
  let t113 = @drule.match_mp(wf_rec_invariant())
  let t115 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t113(x114))
  })
  let t118 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t115),
      t116,
    ),
    t117,
  )
  wf_rec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) → (∀ H : ((A) -> B, A) -> B, (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) → (∃ f : (A) -> B, ∀ x : A, f(x) == H(f, x)))"),
      t118,
    ),
  )
}

///|
let wf_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC")

///|
/// `WF_REC`
pub fn wf_rec() -> @kernel.Thm {
  wf_rec_c.get()
}

///|
/// WF_REC_WF
fn step_11() -> Unit raise {
  let t177 = @meson.asm_meson_tac(@list.List([]))
  let t176 = @simp.rewrite_tac(@list.List([]))
  let t178 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.spec(
          @term_syntax.parse_term("(n : Num) => ∃ i : Num, n == (f : (A) -> Num)((x : (Num) -> A)(i))"),
          @arith.num_wop(),
        ),
      ),
      t176,
    ),
    t177,
  )
  let t175 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t174 = @tactics.first_assum(fn(
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
    let th_1 = x169
    @simp.gen_rewrite_tac(
      fn(
        x171 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s172 = @equal.rand_conv(x171)
        fn(x173 : @kernel.Term) -> @kernel.Thm raise { s172(x173) }
      },
      @list.List([th_1]),
    )
  })
  let t179 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.exists_tac(@term_syntax.parse_term("select((m : Num) => (op_lt_lt : (A, A) -> Bool)((x : (Num) -> A)(m), x((n : Num))))")),
        ),
        t174,
      ),
      t175,
    ),
    t178,
  ])
  let t168 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∃ k : Num, (f : (A) -> Num)((x : (Num) -> A)(k)) < f(x(n))"),
    fn(
      x165 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s166 = @tactics.assume_tac(x165)
      fn(
        x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s166(x167)
      }
    },
  )
  let t164 = @list.List([@meson.meson_tac(@list.List([])), @tactics.disch_tac])
  let t163 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∃ p : Num, (x : (Num) -> A)(n) == x(p)"),
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
      let th = x161
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t157 = @term_syntax.parse_term("(x : (Num) -> A)((n : Num))")
  let t154 = @term_syntax.parse_term("(n : Num)")
  let t160 = @tactics.disch_then(fn(
    x159 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
        x151 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s152 = @tactics.mp_tac(x151)
        fn(
          x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s152(x153)
        }
      })(((x155 : @kernel.Thm) => @bool.gen(t154, x155))(x156))
    })(((x158 : @kernel.Thm) => @bool.spec(t157, x158))(x159))
  })
  let t150 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : (A) -> Num)"))(fn(
      x147 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s148 = @tactics.mp_tac(x147)
      fn(
        x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s148(x149)
      }
    }),
  )
  let t145 = @tactics.first_assum(fn(
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
    let s143 = @tactics.match_accept_tac(x142)
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
  })
  let t141 = @tactics.first_assum(@tactics.match_mp_tac)
  let t140 = @tactics.first_assum(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
      x137 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s138 = @tactics.subst_all_tac(x137)
      fn(
        x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s138(x139)
      }
    }),
  )
  let t136 = @simp.rewrite_tac(@list.List([]))
  let t146 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.strip_tac),
                @class.cond_cases_tac,
              ),
              t136,
            ),
            t140,
          ),
          @tactics.ap_term_tac,
        ),
        t141,
      ),
      t145,
    ),
    @tactics.all_tac,
  ])
  let t135 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t131 = @term_syntax.parse_term("(f : (A) -> Num) => (y : A) => if (∃ p : Num, y == (x : (Num) -> A)(p)) { SUC(f(x(select((m : Num) => (op_lt_lt : (A, A) -> Bool)(x(m), y))))) } else { 0 }")
  let t134 = @tactics.first_assum(fn(
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
    })(((x132 : @kernel.Thm) => @bool.spec(t131, x132))(x133))
  })
  let t126 = @meson.asm_meson_tac(@list.List([]))
  let t127 = @list.List([
    @tactics.then_tac(
      @tactics.conv_tac(@equal.binder_conv(@class.select_conv)),
      t126,
    ),
    @tactics.all_tac,
  ])
  let t125 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, (op_lt_lt : (A, A) -> Bool)((x : (Num) -> A)(select((m : Num) => op_lt_lt(x(m), x(n)))), x(n))"),
    fn(
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
      let s123 = @tactics.assume_tac(x122)
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
    },
  )
  let t119 = @term_syntax.parse_term("(x : (Num) -> A)")
  let t121 = @tactics.disch_then((x120 : @kernel.Thm) => {
    @tactics.x_choose_tac(t119, x120)
  })
  let t180 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
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
                              @tactics.disch_tac,
                              @simp.rewrite_tac(@list.List([wf_dchain()])),
                            ),
                            t121,
                          ),
                          t125,
                        ),
                        t127,
                      ),
                      t134,
                    ),
                    t135,
                  ),
                  @tactics.conj_tac,
                ),
                t146,
              ),
              t150,
            ),
            t160,
          ),
          t163,
        ),
        t164,
      ),
      t168,
    ),
    t179,
  )
  wf_rec_wf_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ H : ((A) -> Num, A) -> Num, (∀ f : (A) -> Num, ∀ g : (A) -> Num, ∀ x : A, (∀ z : A, (op_lt_lt : (A, A) -> Bool)(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) → (∃ f : (A) -> Num, ∀ x : A, f(x) == H(f, x))) → WF(op_lt_lt)"),
      t180,
    ),
  )
}

///|
let wf_rec_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_WF")

///|
/// `WF_REC_WF`
pub fn wf_rec_wf() -> @kernel.Thm {
  wf_rec_wf_c.get()
}

///|
/// WF_EREC
fn step_12() -> Unit raise {
  let t181 = @meson.meson_tac(@list.List([wf_rec(), wf_urec()]))
  wf_erec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) → (∀ H : ((A) -> B, A) -> B, (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) → existsunique((f : (A) -> B) => ∀ x : A, f(x) == H(f, x)))"),
      t181,
    ),
  )
}

///|
let wf_erec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_EREC")

///|
/// `WF_EREC`
pub fn wf_erec() -> @kernel.Thm {
  wf_erec_c.get()
}

///|
/// WF_REC_EXISTS
fn step_13() -> Unit raise {
  let t201 = @meson.asm_meson_tac(@list.List([]))
  let t198 = @simp.gen_rewrite_rule(
    fn(
      x197 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x197
    },
    @list.List([wf_ind()]),
  )
  let t200 = @tactics.first_assum(fn(
    x199 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t198(x199))
  })
  let t196 = @tactics.conv_tac(@equal.binder_conv(@class.select_conv))
  let t195 = @tactics.disch_then(fn(
    x192 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x192
    let t194 = @tactics.assume_tac(@equal.gsym(th))
    @tactics.then_tac(@simp.once_rewrite_tac(@list.List([th])), t194)
  })
  let t191 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@theorems.mono_exists()),
            t191,
          ),
          t195,
        ),
        t196,
      ),
      t200,
    ),
    t201,
  )
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t189 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t188 = @tactics.repeat_tac(@tactics.strip_tac)
  let t186 = @drule.match_mp(wf_rec())
  let t203 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.first_assum(fn(
                x187 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                @tactics.match_mp_tac(t186(x187))
              }),
              t188,
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.abs_tac,
        ),
        t189,
      ),
      t190,
    ),
    t202,
  ])
  let t185 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : (A) -> B, ∀ x : A, f(x) == select((y : B) => (P : ((A) -> B, A, B) -> Bool)(f, x, y))"),
    fn(
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
      let s183 = @tactics.mp_tac(x182)
      fn(
        x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s183(x184)
      }
    },
  )
  let t204 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t185),
    t203,
  )
  wf_rec_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) → (∀ P : ((A) -> B, A, B) -> Bool, (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, ∀ y : B, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → P(f, x, y) == P(g, x, y)) && (∀ f : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → P(f, z, f(z))) → (∃ y : B, P(f, x, y))) → (∃ f : (A) -> B, ∀ x : A, P(f, x, f(x))))"),
      t204,
    ),
  )
}

///|
let wf_rec_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_EXISTS")

///|
/// `WF_REC_EXISTS`
pub fn wf_rec_exists() -> @kernel.Thm {
  wf_rec_exists_c.get()
}

///|
/// wf.ml:186
fn step_14() -> Unit raise {
  @printer.parse_as_infix("<<<", (12L, "right"))
}

///|
/// WF_SUBSET
fn step_15() -> Unit raise {
  let t218 = @meson.meson_tac(@list.List([]))
  let t217 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, (op_lt_lt : (A, A) -> Bool)(x, y) → (op_lt_lt_lt : (A, A) -> Bool)(x, y)"),
  )
  let t216 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
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
      let s214 = @tactics.mp_tac(x213)
      fn(
        x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s214(x215)
      }
    }),
  )
  let t212 = @simp.rewrite_tac(@list.List([wf()]))
  let t211 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
      },
      fn(
        x208 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s209 = @tactics.mp_tac(x208)
        fn(
          x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s209(x210)
        }
      },
    ),
  )
  let t219 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t211),
              t212,
            ),
            @tactics.disch_tac,
          ),
          @tactics.gen_tac,
        ),
        t216,
      ),
      t217,
    ),
    t218,
  )
  wf_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ `<<<` : (A, A) -> Bool, (∀ x : A, ∀ y : A, `<<`(x, y) → `<<<`(x, y)) && WF(`<<<`) → WF(`<<`)"),
      t219,
    ),
  )
}

///|
let wf_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_SUBSET")

///|
/// `WF_SUBSET`
pub fn wf_subset() -> @kernel.Thm {
  wf_subset_c.get()
}

///|
/// WF_RESTRICT
fn step_16() -> Unit raise {
  let t221 = @simp.simp_tac(@list.List([]))
  let t220 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(wf_subset()),
  )
  let t222 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t220),
    t221,
  )
  wf_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ P : (A) -> Bool, WF(`<<`) → WF((x : A) => (y : A) => P(x) && P(y) && `<<`(x, y))"),
      t222,
    ),
  )
}

///|
let wf_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_RESTRICT")

///|
/// `WF_RESTRICT`
pub fn wf_restrict() -> @kernel.Thm {
  wf_restrict_c.get()
}

///|
/// WF_MEASURE_GEN
fn step_17() -> Unit raise {
  let t234 = @meson.meson_tac(@list.List([]))
  let t233 = @simp.rewrite_tac(@list.List([]))
  let t232 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ x : A, (∀ y : A, (op_lt_lt : (B, B) -> Bool)((m : (A) -> B)(y), m(x)) → (P : (A) -> Bool)(y)) → P(x)"),
  )
  let t228 = @term_syntax.parse_term("(y : B) => ∀ x : A, (m : (A) -> B)(x) == y → (P : (A) -> Bool)(x)")
  let t231 = @tactics.first_assum(fn(
    x230 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s226 = @tactics.mp_tac(x225)
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
    })(((x229 : @kernel.Thm) => @bool.spec(t228, x229))(x230))
  })
  let t224 = @tactics.repeat_tac(@tactics.strip_tac)
  let t223 = @simp.rewrite_tac(@list.List([wf_ind()]))
  let t235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t223),
            t224,
          ),
          t231,
        ),
        t232,
      ),
      t233,
    ),
    t234,
  )
  wf_measure_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (B, B) -> Bool, ∀ m : (A) -> B, WF(`<<`) → WF((x : A) => (x' : A) => `<<`(m(x), m(x')))"),
      t235,
    ),
  )
}

///|
let wf_measure_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MEASURE_GEN")

///|
/// `WF_MEASURE_GEN`
pub fn wf_measure_gen() -> @kernel.Thm {
  wf_measure_gen_c.get()
}

///|
/// WF_LEX_DEPENDENT
fn step_18() -> Unit raise {
  let t299 = @meson.asm_meson_tac(@list.List([]))
  let t298 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t297 = @simp.asm_rewrite_tac(@list.List([]))
  let t296 = @tactics.exists_tac(@term_syntax.parse_term("((a : A), (b : B))"))
  let t294 = @tactics.conjuncts_then2(
    fn(
      x288 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s289 = @tactics.mp_tac(x288)
      fn(
        x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s289(x290)
      }
    },
    fn(
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
      let s292 = @tactics.assume_tac(x291)
      fn(
        x293 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s292(x293)
      }
    },
  )
  let t295 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : B)"))(t294),
  )
  let t287 = @simp.asm_rewrite_tac(@list.List([]))
  let t283 = @term_syntax.parse_term("(b1 : B)")
  let t286 = @tactics.disch_then(fn(
    x285 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s281 = @tactics.mp_tac(x280)
      fn(
        x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s281(x282)
      }
    })(((x284 : @kernel.Thm) => @bool.spec(t283, x284))(x285))
  })
  let t279 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t274 = @term_syntax.parse_term("(b : B) => (P : ((A, B)) -> Bool)(((a : A), b))")
  let t275 = @list.List([@term_syntax.parse_term("(a : A)"), t274])
  let t278 = @tactics.first_x_assum(fn(
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
    (fn(
      x271 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s272 = @tactics.mp_tac(x271)
      fn(
        x273 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s272(x273)
      }
    })(((x276 : @kernel.Thm) => @bool.specl(t275, x276))(x277))
  })
  let t268 = @term_syntax.parse_term("(b1 : B)")
  let t270 = @tactics.disch_then((x269 : @kernel.Thm) => {
    @tactics.x_choose_tac(t268, x269)
  })
  let t266 = @tactics.conjuncts_then2(
    fn(
      x260 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s261 = @tactics.mp_tac(x260)
      fn(
        x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s261(x262)
      }
    },
    fn(
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
      let s264 = @tactics.assume_tac(x263)
      fn(
        x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s264(x265)
      }
    },
  )
  let t267 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(t266),
  )
  let t259 = @simp.asm_rewrite_tac(@list.List([]))
  let t254 = @term_syntax.parse_term("(b0 : B)")
  let t255 = @list.List([@term_syntax.parse_term("(a0 : A)"), t254])
  let t258 = @tactics.disch_then(fn(
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
    (fn(
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
      let s252 = @tactics.mp_tac(x251)
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
    })(((x256 : @kernel.Thm) => @bool.specl(t255, x256))(x257))
  })
  let t250 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t246 = @term_syntax.parse_term("(a : A) => ∃ b : B, (P : ((A, B)) -> Bool)((a, b))")
  let t249 = @tactics.first_x_assum(fn(
    x248 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x243 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s244 = @tactics.mp_tac(x243)
      fn(
        x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s244(x245)
      }
    })(((x247 : @kernel.Thm) => @bool.spec(t246, x247))(x248))
  })
  let t241 = @term_syntax.parse_term("(b0 : B)")
  let t242 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a0 : A)"), t241]),
  )
  let t240 = @simp.gen_rewrite_tac(
    fn(
      x239 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x239
    },
    @list.List([@pair.forall_pair_thm()]),
  )
  let t238 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t237 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : ((A, B)) -> Bool)"))
  let t236 = @simp.rewrite_tac(@list.List([wf()]))
  let t300 = @tactics.then_tac(
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
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t236,
                                              ),
                                              @tactics.strip_tac,
                                            ),
                                            t237,
                                          ),
                                          t238,
                                        ),
                                        t240,
                                      ),
                                      t242,
                                    ),
                                    @tactics.disch_tac,
                                  ),
                                  t249,
                                ),
                                t250,
                              ),
                              t258,
                            ),
                            t259,
                          ),
                          t267,
                        ),
                        t270,
                      ),
                      t278,
                    ),
                    t279,
                  ),
                  t286,
                ),
                t287,
              ),
              t295,
            ),
            @tactics.disch_tac,
          ),
          t296,
        ),
        t297,
      ),
      t298,
    ),
    t299,
  )
  wf_lex_dependent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, B, B) -> Bool, WF(R) && (∀ a : A, WF(S(a))) → WF(fn { (r1, s1) => fn { (r2, s2) => R(r1, r2) || r1 == r2 && S(r1, s1, s2) } })"),
      t300,
    ),
  )
}

///|
let wf_lex_dependent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_LEX_DEPENDENT",
)

///|
/// `WF_LEX_DEPENDENT`
pub fn wf_lex_dependent() -> @kernel.Thm {
  wf_lex_dependent_c.get()
}

///|
/// WF_LEX
fn step_19() -> Unit raise {
  let t301 = @simp.simp_tac(@list.List([wf_lex_dependent(), @class.eta_ax()]))
  wf_lex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (B, B) -> Bool, WF(R) && WF(S) → WF(fn { (r1, s1) => fn { (r2, s2) => R(r1, r2) || r1 == r2 && S(s1, s2) } })"),
      t301,
    ),
  )
}

///|
let wf_lex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_LEX")

///|
/// `WF_LEX`
pub fn wf_lex() -> @kernel.Thm {
  wf_lex_c.get()
}

///|
/// WF_POINTWISE
fn step_20() -> Unit raise {
  let t304 = @simp.asm_rewrite_tac(@list.List([]))
  let t305 = @tactics.then_tac(@tactics.match_mp_tac(wf_lex()), t304)
  let t303 = @tactics.conv_tac(@class.taut)
  let t306 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()])),
      t303,
    ),
    t305,
  ])
  let t302 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (x1, y1) => fn { (x2, y2) => (op_lt_lt : (A, A) -> Bool)(x1, x2) || x1 == x2 && (op_lt_lt_lt : (B, B) -> Bool)(y1, y2) } }"),
  )
  let t307 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @tactics.match_mp_tac(wf_subset()),
        ),
        t302,
      ),
      @tactics.conj_tac,
    ),
    t306,
  )
  wf_pointwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) && WF((op_lt_lt_lt : (B, B) -> Bool)) → WF(fn { (x1, y1) => fn { (x2, y2) => op_lt_lt(x1, x2) && op_lt_lt_lt(y1, y2) } })"),
      t307,
    ),
  )
}

///|
let wf_pointwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_POINTWISE")

///|
/// `WF_POINTWISE`
pub fn wf_pointwise() -> @kernel.Thm {
  wf_pointwise_c.get()
}

///|
/// WF_num
fn step_21() -> Unit raise {
  let t308 = @simp.rewrite_tac(@list.List([wf_ind(), @arith.num_wf()]))
  wf_num_c.set(@tactics.prove(@term_syntax.parse_term("WF(op_lt)"), t308))
}

///|
let wf_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_num")

///|
/// `WF_num`
pub fn wf_num() -> @kernel.Thm {
  wf_num_c.get()
}

///|
/// WF_REC_num
fn step_22() -> Unit raise {
  let t309 = @tactics.match_accept_tac(@drule.match_mp(wf_rec())(wf_num()))
  wf_rec_num_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ H : ((Num) -> A, Num) -> A, (∀ f : (Num) -> A, ∀ g : (Num) -> A, ∀ n : Num, (∀ m : Num, m < n → f(m) == g(m)) → H(f, n) == H(g, n)) → (∃ f : (Num) -> A, ∀ n : Num, f(n) == H(f, n))"),
      t309,
    ),
  )
}

///|
let wf_rec_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_num")

///|
/// `WF_REC_num`
pub fn wf_rec_num() -> @kernel.Thm {
  wf_rec_num_c.get()
}

///|
/// MEASURE
fn step_23() -> Unit raise {
  measure_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(MEASURE : ((A) -> Num, A, A) -> Bool)((m : (A) -> Num)) == ((x : A) => (y : A) => m(x) < m(y))"),
    ),
  )
}

///|
let measure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURE")

///|
/// `MEASURE`
pub fn measure() -> @kernel.Thm {
  measure_c.get()
}

///|
/// WF_MEASURE
fn step_24() -> Unit raise {
  let t312 = @tactics.match_accept_tac(wf_num())
  let t311 = @tactics.match_mp_tac(wf_measure_gen())
  let t310 = @simp.rewrite_tac(@list.List([measure()]))
  let t313 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t310),
      t311,
    ),
    t312,
  )
  wf_measure_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : (A) -> Num, WF(MEASURE(m))"), t313),
  )
}

///|
let wf_measure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MEASURE")

///|
/// `WF_MEASURE`
pub fn wf_measure() -> @kernel.Thm {
  wf_measure_c.get()
}

///|
/// MEASURE_LE
fn step_25() -> Unit raise {
  let t314 = @meson.meson_tac(
    @list.List([@arith.not_le(), @arith.lte_trans(), @arith.lt_refl()]),
  )
  let t315 = @tactics.then_tac(@simp.rewrite_tac(@list.List([measure()])), t314)
  measure_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : (A) -> Num, (∀ y : A, MEASURE(m, y, (a : A)) → MEASURE(m, y, (b : A))) == (m(a) <= m(b))"),
      t315,
    ),
  )
}

///|
let measure_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURE_LE")

///|
/// `MEASURE_LE`
pub fn measure_le() -> @kernel.Thm {
  measure_le_c.get()
}

///|
/// WF_ANTISYM
fn step_26() -> Unit raise {
  let t330 = @meson.asm_meson_tac(@list.List([]))
  let t326 = @term_syntax.parse_term("(z : A) => z == (x : A) || z == (y : A)")
  let t329 = @tactics.disch_then(fn(
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
    (fn(
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
      let s324 = @tactics.mp_tac(x323)
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
    })(((x327 : @kernel.Thm) => @bool.spec(t326, x327))(x328))
  })
  let t320 = @simp.gen_rewrite_rule(
    fn(
      x319 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x319
    },
    @list.List([wf()]),
  )
  let t322 = @tactics.first_x_assum(fn(
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
    })(t320(x321))
  })
  let t331 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t322),
      t329,
    ),
    t330,
  )
  wf_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ x : A, ∀ y : A, WF(`<<`) → !(`<<`(x, y) && `<<`(y, x))"),
      t331,
    ),
  )
}

///|
let wf_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_ANTISYM")

///|
/// `WF_ANTISYM`
pub fn wf_antisym() -> @kernel.Thm {
  wf_antisym_c.get()
}

///|
/// WF_REFL
fn step_27() -> Unit raise {
  let t332 = @meson.meson_tac(@list.List([wf_antisym()]))
  wf_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, WF((op_lt_lt : (A, A) -> Bool)) → !op_lt_lt(x, x)"), t332),
  )
}

///|
let wf_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REFL")

///|
/// `WF_REFL`
pub fn wf_refl() -> @kernel.Thm {
  wf_refl_c.get()
}

///|
/// WF_FALSE
fn step_28() -> Unit raise {
  let t333 = @simp.rewrite_tac(@list.List([wf()]))
  wf_false_c.set(@tactics.prove(@term_syntax.parse_term("WF((x : A) => (y : A) => false)"), t333))
}

///|
let wf_false_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_FALSE")

///|
/// `WF_FALSE`
pub fn wf_false() -> @kernel.Thm {
  wf_false_c.get()
}

///|
/// MINIMAL_BAD_SEQUENCE
fn step_29() -> Unit raise {
  let t359 = @meson.meson_tac(@list.List([]))
  let t358 = @simp.simp_tac(@list.List([@arith.lt()]))
  let t356 = @term_syntax.parse_term("(n : Num)")
  let t357 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t356)
  let t355 = @tactics.pop_assum_list(fn(
    x354 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x350 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s351 = @tactics.mp_tac(x350)
      fn(
        x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s351(x352)
      }
    })(
      ((x353 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x353))(
        x354,
      ),
    )
  })
  let t349 = @tactics.disch_then(@tactics.match_mp_tac)
  let t348 = @simp.rewrite_tac(@list.List([wf()]))
  let t347 = @simp.asm_rewrite_tac(@list.List([]))
  let t345 = @term_syntax.parse_term("(x : (Num) -> A) => x((n : Num))")
  let t346 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(op_lt_lt : (A, A) -> Bool)"), t345]),
      wf_measure_gen(),
    ),
  )
  let t344 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ a : _, (∃ y : _, (P : (_) -> Bool)(y) && (Q : (_) -> Bool)(y) && (f : (_) -> _)(y) == a) && (∀ z : _, (A : (_) -> Bool)(z) → !(B : (_, _) -> Bool)(a, z))) == (∃ y : _, (P(y) && Q(y)) && (∀ z : _, B(f(y), z) → !A(z)))"),
      ),
    ]),
  )
  let t342 = @term_syntax.parse_term("(n : Num)")
  let t343 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : (Num) -> A)"), t342]),
  )
  let t339 = @meson.asm_meson_tac(@list.List([]))
  let t340 = @tactics.then_tac(
    @tactics.match_mp_tac(@theorems.mono_exists()),
    t339,
  )
  let t338 = @simp.simp_tac(@list.List([]))
  let t341 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@drule.match_mp(wf_rec_exists())(wf_num())),
      t338,
    ),
    t340,
  ])
  let t337 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : (Num) -> A, ∀ n : Num, (∃ y : (Num) -> A, (bad : ((Num) -> A) -> Bool)(y) && (∀ k : Num, k < n → y(k) == x(k)) && y(n) == x(n)) && (∀ z : (Num) -> A, bad(z) && (∀ k : Num, k < n → z(k) == x(k)) → !(op_lt_lt : (A, A) -> Bool)(z(n), x(n)))"),
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
      let s335 = @tactics.mp_tac(x334)
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
  let t360 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.gen_tac),
                                @tactics.disch_tac,
                              ),
                              t337,
                            ),
                            t341,
                          ),
                          t343,
                        ),
                        @tactics.disch_tac,
                      ),
                      t344,
                    ),
                    t346,
                  ),
                  t347,
                ),
                t348,
              ),
              t349,
            ),
            t355,
          ),
          t357,
        ),
        @nums.induct_tac,
      ),
      t358,
    ),
    t359,
  )
  minimal_bad_sequence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ bad : ((Num) -> A) -> Bool, WF(`<<`) && (∀ x : (Num) -> A, !bad(x) → (∃ n : Num, ∀ y : (Num) -> A, (∀ k : Num, k < n → y(k) == x(k)) → !bad(y))) && (∃ x : (Num) -> A, bad(x)) → (∃ y : (Num) -> A, bad(y) && (∀ z : (Num) -> A, ∀ n : Num, bad(z) && (∀ k : Num, k < n → z(k) == y(k)) → !`<<`(z(n), y(n))))"),
      t360,
    ),
  )
}

///|
let minimal_bad_sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MINIMAL_BAD_SEQUENCE",
)

///|
/// `MINIMAL_BAD_SEQUENCE`
pub fn minimal_bad_sequence() -> @kernel.Thm {
  minimal_bad_sequence_c.get()
}

///|
/// WF_REC_TAIL
fn step_30() -> Unit raise {
  let t361 = @meson.meson_tac(@list.List([@nums.num_cases(), @nums.not_suc()]))
  let lemma1 = @tactics.prove(
    @term_syntax.parse_term("!(P : (Num) -> Bool)(0) → (∃ n : Num, P(SUC(n))) == (∃ n : Num, P(n))"),
    t361,
  )
  let t362 = @meson.asm_meson_tac(@list.List([@arith.lt_suc(), @arith.lt_0()]))
  let t363 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.orelse_tac(@tactics.disch_tac, @tactics.eq_tac),
      ),
      @nums.induct_tac,
    ),
    t362,
  )
  let lemma2 = @tactics.prove(
    @term_syntax.parse_term("(P : (Num) -> Bool)(0) → (∀ m : Num, m < (n : Num) → P(SUC(m))) == (∀ m : Num, m < SUC(n) → P(m))"),
    t363,
  )
  let t388 = @meson.asm_meson_tac(@list.List([@arith.lt()]))
  let t387 = @meson.asm_meson_tac(@list.List([@arith.lt_0()]))
  let t386 = @simp.asm_rewrite_tac(@list.List([]))
  let t389 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()])),
          @nums.induct_tac,
        ),
        t386,
      ),
      t387,
    ),
    t388,
  ])
  let t385 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t384 = @simp.rewrite_tac(@list.List([]))
  let t383 = @tactics.match_mp_tac(@class.select_unique())
  let t390 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @class.cond_cases_tac,
                @list.List([
                  @tactics.all_tac,
                  @meson.asm_meson_tac(@list.List([])),
                ]),
              ),
              @tactics.ap_term_tac,
            ),
            t383,
          ),
          t384,
        ),
        t385,
      ),
      @tactics.eq_tac,
    ),
    t389,
  )
  let t382 = @simp.asm_simp_tac(@list.List([lemma2, lemma1]))
  let t381 = @tactics.conv_tac(@equal.sym_conv)
  let t380 = @simp.asm_rewrite_tac(@list.List([]))
  let t391 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_simp_tac(@list.List([lemma1])),
            @class.cond_cases_tac,
          ),
          t380,
        ),
        t381,
      ),
      t382,
    ),
    t390,
  ])
  let t379 = @simp.asm_rewrite_tac(@list.List([]))
  let t378 = @class.asm_cases_tac(@term_syntax.parse_term("(P : (A) -> Bool)((x : A))"))
  let t376 = @tactics.undisch_then(
    @term_syntax.parse_term("∀ x : A, ∀ n : Num, (s : (A, Num) -> A)(x, SUC(n)) == (g : (A) -> A)(s(x, n))"),
    fn(
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
      @tactics.all_tac
    },
  )
  let t377 = @list.List([
    @tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([]))),
    t376,
  ])
  let t374 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∀ x : A, (s : (A, Num) -> A)((g : (A) -> A)(x), n) == s(x, SUC(n))"),
    fn(
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
      let s372 = @tactics.assume_tac(x371)
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
    },
  )
  let t370 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t369 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => if (∃ n : Num, !(P : (A) -> Bool)((s : (A, Num) -> A)(x, n))) { (h : (A) -> B)(select((y : A) => ∃ n : Num, y == s(x, n) && !P(s(x, n)) && (∀ m : Num, m < n → P(s(x, m))))) } else { (something_arbitrary : B) }"),
  )
  let t368 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : (A, Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t367 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.forall_and_thm()]),
  )
  let t364 = @term_syntax.parse_term("(y : A) => (n : Num) => (g : (A) -> A)(y)")
  let t365 = @bool.ispecl(
    @list.List([@term_syntax.parse_term("(x : A)"), t364]),
    @nums.num_recursion(),
  )
  let t366 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(x : A)"), t365))
  let t392 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t366,
                    ),
                    t367,
                  ),
                  t368,
                ),
                t369,
              ),
              t370,
            ),
            t374,
          ),
          t377,
        ),
        t378,
      ),
      t379,
    ),
    t391,
  )
  wf_rec_tail_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ g : (A) -> A, ∀ h : (A) -> B, ∃ f : (A) -> B, ∀ x : A, f(x) == (if P(x) { f(g(x)) } else { h(x) })"),
      t392,
    ),
  )
}

///|
let wf_rec_tail_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_TAIL")

///|
/// `WF_REC_TAIL`
pub fn wf_rec_tail() -> @kernel.Thm {
  wf_rec_tail_c.get()
}

///|
/// WF_REC_TAIL_GENERAL
fn step_31() -> Unit raise {
  let t441 = @meson.asm_meson_tac(@list.List([]))
  let t440 = @class.asm_cases_tac(@term_syntax.parse_term("(P : ((A) -> B, A) -> Bool)((f : (A) -> B), (x : A))"))
  let t439 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t438 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t437 = @tactics.disch_then(fn(
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
    let th_3 = x434
    let t436 = @tactics.mp_tac(th_3)
    @tactics.then_tac(@tactics.assume_tac(@equal.gsym(th_3)), t436)
  })
  let t442 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(@theorems.mono_exists()),
              @tactics.gen_tac,
            ),
            t437,
          ),
          t438,
        ),
        t439,
      ),
      t440,
    ),
    t441,
  )
  let t430 = @meson.asm_meson_tac(@list.List([]))
  let t429 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t428 = @tactics.subgoal_then(
    @parser.parse_term(
      "forall f:A->B. (forall x:A y:A. P f x /\\ y << G f x ==> y << x)\n         ==> forall x. terminates f x ==> forall y. y << while_ f x ==> y << x",
    ),
    fn(
      x426 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_2 = x426
      @meson.asm_meson_tac(@list.List([th_2]))
    },
  )
  let t431 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t428),
          @tactics.gen_tac,
        ),
        @tactics.disch_tac,
      ),
      t429,
    ),
    t430,
  )
  let t425 = @meson.asm_meson_tac(@list.List([]))
  let t424 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t423 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t432 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.subgoal_then(
          @parser.parse_term(
            "forall x:A. terminates (f:A->B) x /\\\n              (forall y:A. (forall z:A. z << y ==> z << x)\n                     ==> (P f y <=> P g y) /\\ (G f y :A = G g y))\n              ==> (while_ f x :A = while_ g x)",
          ),
          fn(
            x420 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let th_1 = x420
            let t422 = @meson.asm_meson_tac(@list.List([]))
            @tactics.then_tac(@tactics.match_mp_tac(th_1), t422)
          },
        ),
        t423,
      ),
      t424,
    ),
    t425,
  )
  let t419 = @meson.asm_meson_tac(@list.List([]))
  let t418 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t417 = @simp.once_rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (c : Bool)) == (b → a → c)")),
    ]),
  )
  let t416 = @simp.rewrite_tac(
    @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
  )
  let t433 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ x : A, ∀ y : A, (P : ((A) -> B, A) -> Bool)(f, x) && (op_lt_lt : (A, A) -> Bool)(y, (G : ((A) -> B, A) -> A)(f, x)) → op_lt_lt(y, x)) && (∀ y : A, (∀ z : A, op_lt_lt(z, y) → op_lt_lt(z, x)) → P(f, y) == P(g, y) && G(f, y) == G(g, y)) → (terminates : ((A) -> B, A) -> Bool)(f, x) → terminates(g, x)"),
                    fn(
                      x413 : @kernel.Thm,
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
                      let th = x413
                      let t415 = @meson.asm_meson_tac(@list.List([]))
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.eq_tac,
                          @tactics.match_mp_tac(th),
                        ),
                        t415,
                      )
                    },
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.gen_tac,
              ),
              t416,
            ),
            @tactics.disch_tac,
          ),
          t417,
        ),
        t418,
      ),
      t419,
    ),
    t432,
    t431,
  ])
  let t412 = @tactics.repeat_tac(@tactics.strip_tac)
  let t411 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(a : Bool) == (b : Bool) && (a && b → (x : _) == (y : _) && (f : (_) -> _)(x) == (g : (_) -> _)(x)) → (if a { f(x) } else { (d : _) }) == (if b { g(y) } else { d })"),
    ),
  )
  let t410 = @tactics.repeat_tac(@tactics.strip_tac)
  let t408 = @drule.match_mp(wf_rec())
  let t443 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_assum(fn(
              x409 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              @tactics.match_mp_tac(t408(x409))
            }),
            t410,
          ),
          t411,
        ),
        t412,
      ),
      t433,
    ),
    t442,
  ])
  let t407 = @tactics.subgoal_then(
    @parser.parse_term(
      "?f:A->B. forall x. f x = if terminates f x then H f (while_ f x :A) else anything",
    ),
    fn(
      x404 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s405 = @tactics.mp_tac(x404)
      fn(
        x406 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s405(x406)
      }
    },
  )
  let t403 = @list.List([
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@class.skolem_thm()), wf_rec_tail()]),
    ),
    @tactics.all_tac,
  ])
  let t402 = @tactics.subgoal_then(
    @parser.parse_term(
      "?while_. forall f:A->B x:A. while_ f x = if P f x then while_ f (G f x) else x",
    ),
    fn(
      x401 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.strip_assume_tac(@equal.gsym(x401))
    },
  )
  let t400 = @tactics.disch_then(fn(
    x399 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x399))
  })
  let t398 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t396 = @ind_defs.prove_inductive_relations_exist(
    @term_syntax.parse_term("(∀ x : A, !(P : ((A) -> B, A) -> Bool)((f : (A) -> B), x) → (terminates : ((A) -> B, A) -> Bool)(f, x)) && (∀ x : A, P(f, x) && terminates(f, (G : ((A) -> B, A) -> A)(f, x)) → terminates(f, x))"),
  )
  let t397 = @tactics.choose_then(fn(
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
    let s394 = @tactics.mp_tac(x393)
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
  })(t396)
  let t444 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t397),
              t398,
            ),
            t400,
          ),
          t402,
        ),
        t403,
      ),
      t407,
    ),
    t443,
  )
  wf_rec_tail_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> B, A) -> Bool, ∀ G : ((A) -> B, A) -> A, ∀ H : ((A) -> B, A) -> B, WF((op_lt_lt : (A, A) -> Bool)) && (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → P(f, x) == P(g, x) && G(f, x) == G(g, x) && H(f, x) == H(g, x)) && (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, (∀ z : A, op_lt_lt(z, x) → f(z) == g(z)) → H(f, x) == H(g, x)) && (∀ f : (A) -> B, ∀ x : A, ∀ y : A, P(f, x) && op_lt_lt(y, G(f, x)) → op_lt_lt(y, x)) → (∃ f : (A) -> B, ∀ x : A, f(x) == (if P(f, x) { f(G(f, x)) } else { H(f, x) }))"),
      t444,
    ),
  )
}

///|
let wf_rec_tail_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_REC_TAIL_GENERAL",
)

///|
/// `WF_REC_TAIL_GENERAL`
pub fn wf_rec_tail_general() -> @kernel.Thm {
  wf_rec_tail_general_c.get()
}

///|
/// WF_INDUCT_TAC
fn step_32() -> Unit raise {
  let t445 = @meson.meson_tac(@list.List([]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → (∀ y : _, (Q : (_, _) -> Bool)(x, y))) == (∀ y : _, ∀ x : _, P(x) → Q(x, y))"),
    t445,
  )
  let qqconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x446 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x446
    },
    @list.List([pth]),
  )
  let t447 = @meson.meson_tac(@list.List([]))
  let pth_1 = @tactics.prove(
    @term_syntax.parse_term("(∀ m : _, (P : (_) -> Bool)(m) → m == (e : _) → (Q : Bool)) == (P(e) → Q)"),
    t447,
  )
  let eqconv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth_1)
  fn qqconvs(x448 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x448
    @equal.thenc(qqconv, @equal.binder_conv(qqconvs))(tm) catch {
      Failure(_) => eqconv(tm)
      e => raise e
    }
  }
  wf_induct_tac_c.set(fn(
    x449 : @kernel.Term,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let tm_1 = x449
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
      let (asl, w) as gl = x450
      let fvs = @kernel.frees(tm_1)
      let gv = @basics.genvar(@kernel.type_of(tm_1))
      let pat = @bool.list_mk_forall(
        fvs.prepend(gv),
        @bool.mk_imp(@basics.mk_eq(gv, tm_1), w),
      )
      let th0 = @bool.undisch(
        @drule.part_match(@kernel.rand, @arith.num_wf())(pat),
      )
      let t451 = @kernel.refl(tm_1)
      let th1 = @bool.mp(@bool.specl(fvs.prepend(tm_1), th0), t451)
      let t452 = @bool.disch_all(th1)
      let th2 = @equal.conv_rule(@equal.land_conv(qqconvs), t452)
      let t458 = @tactics.disch_then(fn(
        x455 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s456 = @tactics.assume_tac(x455)
        fn(
          x457 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s456(x457)
        }
      })
      let t454 = @tactics.conv_tac(@equal.land_conv(qqconvs))
      let t453 = @tactics.map_every(@tactics.x_gen_tac, fvs)
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(th2), t453),
          t454,
        ),
        t458,
      )(gl)
    }
  })
}

///|
let wf_induct_tac_c : @lib.Cell[
  (@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise,
] = @lib.Cell::new("WF_INDUCT_TAC")

///|
/// `WF_INDUCT_TAC`
pub fn wf_induct_tac(
  x : @kernel.Term,
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  wf_induct_tac_c.get()(x)
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
}
