// Translated from upstream Library/iter.ml; edit this file directly.

///|
/// ITER
fn step_1() -> Unit raise {
  iter_c.set(
    @define.define_(
      @term_syntax.parse_term("(∀ f : (_) -> _, (ITER : (Num, (_) -> _, _) -> _)(0, f, (x : _)) == x) && (∀ f : (_) -> _, ∀ n : Num, ITER(SUC(n), f, x) == f(ITER(n, f, x)))"),
    ),
  )
}

///|
let iter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER")

///|
/// `ITER`
pub fn iter() -> @kernel.Thm {
  iter_c.get()
}

///|
/// ITER_POINTLESS
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.i_thm(), @trivia.o_thm(), iter()]),
  )
  iter_pointless_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (_) -> _, ITER(0, f) == I) && (∀ f : (_) -> _, ∀ n : Num, ITER(SUC(n), f) == o(f, ITER(n, f)))"),
      t1,
    ),
  )
}

///|
let iter_pointless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_POINTLESS")

///|
/// `ITER_POINTLESS`
pub fn iter_pointless() -> @kernel.Thm {
  iter_pointless_c.get()
}

///|
/// ITER_ALT
fn step_3() -> Unit raise {
  let t2 = @simp.asm_rewrite_tac(@list.List([iter()]))
  let t3 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([iter()])),
        @tactics.gen_tac,
      ),
      @nums.induct_tac,
    ),
    t2,
  )
  iter_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (_) -> _, ∀ x : _, ITER(0, f, x) == x) && (∀ f : (_) -> _, ∀ n : Num, ∀ x : _, ITER(SUC(n), f, x) == ITER(n, f, f(x)))"),
      t3,
    ),
  )
}

///|
let iter_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_ALT")

///|
/// `ITER_ALT`
pub fn iter_alt() -> @kernel.Thm {
  iter_alt_c.get()
}

///|
/// ITER_ALT_POINTLESS
fn step_4() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @trivia.i_thm(),
      @trivia.o_thm(),
      iter_alt(),
    ]),
  )
  iter_alt_pointless_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (_) -> _, ITER(0, f) == I) && (∀ f : (_) -> _, ∀ n : Num, ITER(SUC(n), f) == o(ITER(n, f), f))"),
      t4,
    ),
  )
}

///|
let iter_alt_pointless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITER_ALT_POINTLESS",
)

///|
/// `ITER_ALT_POINTLESS`
pub fn iter_alt_pointless() -> @kernel.Thm {
  iter_alt_pointless_c.get()
}

///|
/// ITER_1
fn step_5() -> Unit raise {
  let t5 = @simp.rewrite_tac(
    @list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), iter()]),
  )
  iter_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ x : _, ITER(1, f, x) == f(x)"), t5))
}

///|
let iter_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_1")

///|
/// `ITER_1`
pub fn iter_1() -> @kernel.Thm {
  iter_1_c.get()
}

///|
/// ITER_ADD
fn step_6() -> Unit raise {
  let t6 = @simp.asm_rewrite_tac(@list.List([iter(), @arith.add()]))
  let t7 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t6,
  )
  iter_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ n : Num, ∀ m : Num, ∀ x : _, ITER(n, f, ITER(m, f, x)) == ITER(n + m, f, x)"),
      t7,
    ),
  )
}

///|
let iter_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_ADD")

///|
/// `ITER_ADD`
pub fn iter_add() -> @kernel.Thm {
  iter_add_c.get()
}

///|
/// ITER_ADD_POINTLESS
fn step_7() -> Unit raise {
  let t8 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), iter_add()]),
  )
  iter_add_pointless_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ITER(m + n, (f : (_) -> _)) == o(ITER(m, f), ITER(n, f))"),
      t8,
    ),
  )
}

///|
let iter_add_pointless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITER_ADD_POINTLESS",
)

///|
/// `ITER_ADD_POINTLESS`
pub fn iter_add_pointless() -> @kernel.Thm {
  iter_add_pointless_c.get()
}

///|
/// ITER_MUL
fn step_8() -> Unit raise {
  let t9 = @simp.asm_rewrite_tac(
    @list.List([iter(), @arith.mult(), iter_add(), @arith.add_ac()]),
  )
  let t10 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t9,
  )
  iter_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ n : Num, ∀ m : Num, ∀ x : _, ITER(n, ITER(m, f), x) == ITER(n * m, f, x)"),
      t10,
    ),
  )
}

///|
let iter_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_MUL")

///|
/// `ITER_MUL`
pub fn iter_mul() -> @kernel.Thm {
  iter_mul_c.get()
}

///|
/// ITER_FIXPOINT
fn step_9() -> Unit raise {
  let t11 = @simp.asm_simp_tac(@list.List([iter_alt()]))
  let t12 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t11,
  )
  iter_fixpoint_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ n : Num, ∀ x : _, f(x) == x → ITER(n, f, x) == x"),
      t12,
    ),
  )
}

///|
let iter_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_FIXPOINT")

///|
/// `ITER_FIXPOINT`
pub fn iter_fixpoint() -> @kernel.Thm {
  iter_fixpoint_c.get()
}

///|
/// ORDER_EXISTENCE_GEN
fn step_10() -> Unit raise {
  let t51 = @list.List([
    @int.asm_arith_tac,
    @meson.asm_meson_tac(@list.List([@arith.add_sym()])),
  ])
  let t47 = @term_syntax.parse_term("(m : Num)")
  let t50 = @tactics.first_x_assum(fn(
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
    (fn(
      x44 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s45 = @tactics.mp_tac(x44)
      fn(
        x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s45(x46)
      }
    })(((x48 : @kernel.Thm) => @bool.spec(t47, x48))(x49))
  })
  let t43 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("divides((d : Num), (m : Num) + d) == divides(d, m)"),
      ),
    ]),
  )
  let t42 = @list.List([
    @int.asm_arith_tac,
    @simp.abbrev_tac(@term_syntax.parse_term("(m : Num) == (n : Num) - (d : Num)")),
  ])
  let t41 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == n - (d : Num) + d"), fn(
    x38 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s39 = @tactics.subst1_tac(x38)
    fn(
      x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s39(x40)
    }
  })
  let t37 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@arith.not_lt(), @int.divides_le()])),
  ])
  let t36 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) <= (n : Num)"))
  let t35 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@int.number_rule(@term_syntax.parse_term("divides((n : Num), 0)"))]),
    ),
    @tactics.all_tac,
  ])
  let t34 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t33 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t32 = @tactics.match_mp_tac(@arith.num_wf())
  let t31 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.imp_conj_alt())]),
  )
  let t30 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t29 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t28 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t27 = @simp.gen_rewrite_tac(
    fn(
      x24 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s25 = @equal.land_conv(x24)
      fn(x26 : @kernel.Term) -> @kernel.Thm raise { s25(x26) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t20 = @simp.gen_rewrite_rule(
    fn(
      x19 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x19
    },
    @list.List([@class.not_forall_thm()]),
  )
  let t22 = @tactics.first_x_assum(fn(
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
    (fn(
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
    })(t20(x21))
  })
  let t15 = @meson.asm_meson_tac(@list.List([]))
  let t14 = @simp.rewrite_tac(
    @list.List([@int.number_rule(@term_syntax.parse_term("divides(0, (n : Num)) == (n == 0)"))]),
  )
  let t23 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t14),
      t15,
    ),
    t22,
  ])
  let t13 = @class.asm_cases_tac(
    @term_syntax.parse_term("∀ n : Num, !(n == 0) → !(P : (A) -> Bool)((f : (Num) -> A)(n))"),
  )
  let t52 = @tactics.thenl(
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.thenl(
                                          @tactics.then_tac(
                                            @tactics.repeat_tac(
                                              @tactics.strip_tac,
                                            ),
                                            t13,
                                          ),
                                          t23,
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
                              @tactics.strip_tac,
                            ),
                            t32,
                          ),
                          t33,
                        ),
                        @tactics.disch_tac,
                      ),
                      t34,
                    ),
                    t35,
                  ),
                  t36,
                ),
                t37,
              ),
              t41,
            ),
            t42,
          ),
          t43,
        ),
        t50,
      ),
      @tactics.ants_tac,
    ),
    t51,
  )
  order_existence_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ f : (Num) -> A, P(f(0)) && (∀ m : Num, ∀ n : Num, P(f(m)) && !(m == 0) → P(f(m + n)) == P(f(n))) → (∃ d : Num, ∀ n : Num, P(f(n)) == divides(d, n))"),
      t52,
    ),
  )
}

///|
let order_existence_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_EXISTENCE_GEN",
)

///|
/// `ORDER_EXISTENCE_GEN`
pub fn order_existence_gen() -> @kernel.Thm {
  order_existence_gen_c.get()
}

///|
/// ORDER_EXISTENCE_ITER
fn step_11() -> Unit raise {
  let t65 = @meson.asm_meson_tac(@list.List([]))
  let t64 = @simp.asm_rewrite_tac(@list.List([iter()]))
  let t63 = @simp.asm_rewrite_tac(@list.List([]))
  let t62 = @tactics.disch_then(@tactics.match_mp_tac)
  let t61 = @tactics.mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ a : (Num) -> A, ∀ b : (Num) -> A, (∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ n : Num, R(a(n), b(n))) → (∀ n : Num, R(a(n), (z : A)) == R(b(n), z))"),
    ),
  )
  let t60 = @simp.rewrite_tac(@list.List([@equal.gsym(iter_add())]))
  let t59 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t58 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t57 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t56 = @tactics.disch_then(@tactics.match_mp_tac)
  let t55 = @simp.asm_rewrite_tac(@list.List([iter()]))
  let t53 = @term_syntax.parse_term("(n : Num) => ITER(n, (f : (A) -> A), (z : A))")
  let t54 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : A) => (R : (A, A) -> Bool)(x, (z : A))"), t53]),
      order_existence_gen(),
    ),
  )
  let t66 = @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.strip_tac),
                              t54,
                            ),
                            t55,
                          ),
                          t56,
                        ),
                        t57,
                      ),
                      t58,
                    ),
                    @tactics.strip_tac,
                  ),
                  t59,
                ),
                t60,
              ),
              t61,
            ),
            t62,
          ),
          t63,
        ),
        @nums.induct_tac,
      ),
      t64,
    ),
    t65,
  )
  order_existence_iter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ f : (A) -> A, ∀ z : A, R(z, z) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, ∀ y : A, R(x, y) → R(f(x), f(y))) → (∃ d : Num, ∀ n : Num, R(ITER(n, f, z), z) == divides(d, n))"),
      t66,
    ),
  )
}

///|
let order_existence_iter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_EXISTENCE_ITER",
)

///|
/// `ORDER_EXISTENCE_ITER`
pub fn order_existence_iter() -> @kernel.Thm {
  order_existence_iter_c.get()
}

///|
/// ORDER_EXISTENCE_CARD
fn step_12() -> Unit raise {
  let t135 = @drule.match_mp(@int.divides_le())
  let t137 = @tactics.disch_then(fn(
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
    (fn(
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
      let s133 = @tactics.mp_tac(x132)
      fn(
        x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s133(x134)
      }
    })(t135(x136))
  })
  let t131 = @simp.asm_simp_tac(
    @list.List([
      @arith.le_1(),
      @int.number_rule(@term_syntax.parse_term("∀ n : Num, divides(0, n) == (n == 0)")),
    ]),
  )
  let t127 = @term_syntax.parse_term("(m : Num)")
  let t130 = @tactics.disch_then(fn(
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
  })
  let t123 = @simp.asm_simp_tac(@list.List([]))
  let t122 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t121 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t120 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t119 = @simp.asm_rewrite_tac(@list.List([]))
  let t117 = @term_syntax.parse_term("(z : A)")
  let t118 = @term_syntax.parse_term("(f : (A) -> A)")
  let t138 = @tactics.then_tac(
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
                          @term_syntax.parse_term("(R : (A, A) -> Bool)"),
                          t118,
                          t117,
                        ]),
                        order_existence_iter(),
                      ),
                    ),
                    t119,
                  ),
                  t120,
                ),
                t121,
              ),
              t122,
            ),
            t123,
          ),
          t130,
        ),
        t131,
      ),
      t137,
    ),
    @int.asm_arith_tac,
  )
  let t112 = @meson.asm_meson_tac(@list.List([]))
  let t111 = @simp.rewrite_tac(
    @list.List([@arith.le_refl(), @arith.sub_refl(), iter()]),
  )
  let t108 = @term_syntax.parse_term("(p : Num)")
  let t113 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x110 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x105 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s106 = @tactics.mp_tac(x105)
          fn(
            x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s106(x107)
          }
        })(((x109 : @kernel.Thm) => @bool.spec(t108, x109))(x110))
      }),
      t111,
    ),
    t112,
  )
  let t102 = @simp.asm_rewrite_tac(@list.List([iter()]))
  let t101 = @tactics.subgoal_then(
    @term_syntax.parse_term("(q : Num) - (d : Num) == SUC(q - SUC(d)) && (p : Num) - d == SUC(p - SUC(d))"),
    fn(
      x99 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x99
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t103 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @tactics.first_x_assum(fn(
                x98 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  let s92 = @tactics.mp_tac(x91)
                  fn(
                    x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s92(x93)
                  }
                })(
                  ((x97 : @kernel.Thm) => {
                    @lib.check(
                      fn(x96 : @kernel.Thm) -> Bool raise {
                        (fn(x94 : @kernel.Term) -> Bool raise {
                          @basics.is_imp(x94)
                        })(
                          (fn(x95 : @kernel.Thm) -> @kernel.Term raise {
                            @kernel.concl(x95)
                          })(x96),
                        )
                      },
                      x97,
                    )
                  })(x98),
                )
              }),
            ),
            @tactics.ants_tac,
          ),
          @list.List([@int.asm_arith_tac, @tactics.all_tac]),
        ),
        t101,
      ),
      @list.List([@int.asm_arith_tac, @tactics.all_tac]),
    ),
    t102,
  )
  let t90 = @simp.asm_rewrite_tac(@list.List([iter()]))
  let t89 = @term_syntax.parse_term("(q : Num)")
  let t104 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.spec_tac(@term_syntax.parse_term("(q : Num)"), t89),
        @nums.induct_tac,
      ),
      t90,
    ),
    t103,
  ])
  let t114 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @nums.induct_tac,
        @simp.asm_rewrite_tac(@list.List([@arith.sub_0()])),
      ),
      t104,
    ),
    t113,
  ])
  let t88 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : Num, d <= (p : Num) → (R : (A, A) -> Bool)(ITER(p - d, (f : (A) -> A), (z : A)), ITER((q : Num) - d, f, z))"),
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
      let s86 = @tactics.mp_tac(x85)
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
  let t84 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([@int.asm_arith_tac, @tactics.all_tac]),
    ),
  )
  let t83 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num) - (p : Num)"))
  let t82 = @tactics.repeat_tac(@tactics.strip_tac)
  let t81 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t79 = @term_syntax.parse_term("(q : Num)")
  let t80 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t79]),
  )
  let t78 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t77 = @simp.rewrite_tac(@list.List([]))
  let t76 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t115 = @tactics.thenl(
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
                        @simp.rewrite_tac(
                          @list.List([
                            @class.not_forall_thm(),
                            @class.not_imp(),
                            @theorems.left_imp_exists_thm(),
                          ]),
                        ),
                        t76,
                      ),
                      t77,
                    ),
                    @tactics.conj_tac,
                  ),
                  t78,
                ),
                t80,
              ),
              t81,
            ),
            t82,
          ),
          t83,
        ),
        t84,
      ),
      t88,
    ),
    t114,
  )
  let t75 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @tactics.match_mp_tac(@sets.card_subset())
  let t71 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(c : Num) <= (k : Num) → (s : Num) <= c → !(s == k + 1)")),
  )
  let t116 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
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
            @tactics.match_mp_tac(t71(x72))
          }),
          t73,
        ),
        t74,
      ),
      t75,
    ),
    t115,
  ])
  let t70 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) && (!(q : Bool) → (r : Bool)) → p == q → r")),
  )
  let t69 = @simp.rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @iterate.card_numseg(),
      @arith.sub_0(),
    ]),
  )
  let t68 = @term_syntax.parse_term("op_dot_dot(0, (k : Num))")
  let t139 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(
              @bool.ispecl(
                @list.List([
                  @term_syntax.parse_term("(n : Num) => (R : (A, A) -> Bool)(ITER(n, (f : (A) -> A), (z : A)))"),
                  t68,
                ]),
                @sets.card_image_eq_inj(),
              ),
            ),
            t69,
          ),
          t70,
        ),
        @tactics.conj_tac,
      ),
      t116,
    ),
    t138,
  ])
  let t67 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ m : Num, 0 < m && m <= (k : Num) && (R : (A, A) -> Bool)(ITER(m, (f : (A) -> A), (z : A)), z)"),
    @tactics.strip_assume_tac,
  )
  let t140 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t67),
    t139,
  )
  order_existence_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ f : (A) -> A, ∀ z : A, ∀ k : Num, FINITE({R(ITER((n : Num), f, z)) | IN(n, UNIV)}) && CARD({R(ITER((n : Num), f, z)) | IN(n, UNIV)}) <= k && R(z, z) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, ∀ y : A, R(f(x), f(y)) == R(x, y)) → (∃ d : Num, 0 < d && d <= k && (∀ n : Num, R(ITER(n, f, z), z) == divides(d, n)))"),
      t140,
    ),
  )
}

///|
let order_existence_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_EXISTENCE_CARD",
)

///|
/// `ORDER_EXISTENCE_CARD`
pub fn order_existence_card() -> @kernel.Thm {
  order_existence_card_c.get()
}

///|
/// ORDER_EXISTENCE_FINITE
fn step_13() -> Unit raise {
  let t146 = @meson.meson_tac(@list.List([]))
  let t145 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t141 = @term_syntax.parse_term("CARD({(R : (A, A) -> Bool)(ITER((n : Num), (f : (A) -> A), (z : A))) | IN(n, UNIV)})")
  let t142 = @term_syntax.parse_term("(z : A)")
  let t143 = @term_syntax.parse_term("(f : (A) -> A)")
  let t144 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(R : (A, A) -> Bool)"), t143, t142, t141]),
      order_existence_card(),
    ),
  )
  let t147 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t144),
      t145,
    ),
    t146,
  )
  order_existence_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ f : (A) -> A, ∀ z : A, FINITE({R(ITER((n : Num), f, z)) | IN(n, UNIV)}) && R(z, z) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, ∀ y : A, R(f(x), f(y)) == R(x, y)) → (∃ d : Num, 0 < d && (∀ n : Num, R(ITER(n, f, z), z) == divides(d, n)))"),
      t147,
    ),
  )
}

///|
let order_existence_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_EXISTENCE_FINITE",
)

///|
/// `ORDER_EXISTENCE_FINITE`
pub fn order_existence_finite() -> @kernel.Thm {
  order_existence_finite_c.get()
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
}
