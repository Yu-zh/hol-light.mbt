// Translated from upstream Library/modmul_group.ml; edit this file directly.

///|
/// MULT_EQ_2
fn step_1() -> Unit raise {
  let t10 = @tactics.match_mp_tac(@arith.le_mult2())
  let t9 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("2 * 2 <= (p : Num) → !(p == 2)")),
  )
  let t8 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_num.arith()]),
  )
  let t7 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t6 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_num.arith()]),
  )
  let t5 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t4 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_num.arith()]),
  )
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @calc_num.arith()]),
  )
  let t1 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
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
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t1,
                      ),
                      t2,
                    ),
                    t3,
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
    ),
    @int.asm_arith_tac,
  )
  mult_eq_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (m * n == 2) == (m == 1 && n == 2 || m == 2 && n == 1)"),
      t11,
    ),
  )
}

///|
let mult_eq_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_EQ_2")

///|
/// `MULT_EQ_2`
pub fn mult_eq_2() -> @kernel.Thm {
  mult_eq_2_c.get()
}

///|
/// modmul_group
fn step_2() -> Unit raise {
  modmul_group_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(modmul_group : (Num) -> Group[Num])((n : Num)) == (if n <= 1 { singleton_group(1) } else { group(({(m : Num) | m < n && coprime((m, n))}, 1, inverse_mod(n), (a : Num) => (b : Num) => MOD(a * b, n))) })"),
    ),
  )
}

///|
let modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("modmul_group")

///|
/// `modmul_group`
pub fn modmul_group() -> @kernel.Thm {
  modmul_group_c.get()
}

///|
/// MODMUL_GROUP
fn step_3() -> Unit raise {
  let t36 = @meson.meson_tac(@list.List([@prime.coprime_sym()]))
  let t35 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 < n"))]),
  )
  let t37 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @pocklington.mod_unique(),
          @pocklington.inverse_mod_rmul_eq(),
          @pocklington.inverse_mod_lmul_eq(),
        ]),
      ),
      t35,
    ),
    t36,
  )
  let t38 = @simp.simp_tac(@list.List([@arith.mult_clauses(), @arith.mod_lt()]))
  let t34 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t33 = @simp.rewrite_tac(@list.List([@arith.mod_mult_mod2()]))
  let t32 = @simp.rewrite_tac(@list.List([@arith.mod_mod_refl()]))
  let t31 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@arith.mod_mult_mod2())]),
  )
  let t39 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t31),
        t32,
      ),
      t33,
    ),
    t34,
  )
  let t30 = @simp.asm_simp_tac(
    @list.List([
      @arith.mod_lt_eq(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
    ]),
  )
  let t40 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.coprime_lmod(), @prime.coprime_lmul()])),
    t30,
  )
  let t29 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t28 = @simp.rewrite_tac(@list.List([@pocklington.inverse_mod_lmul_eq()]))
  let t27 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t26 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("∀ m : Num, op_eq_eq((a : Num) * m, 1, mod((n : Num))) → coprime((a, n))"),
    ),
  )
  let t25 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.inverse_mod_bound()]),
  )
  let t41 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)")),
                @tactics.strip_tac,
              ),
              t25,
            ),
            t26,
          ),
          t27,
        ),
        t28,
      ),
      t29,
    ),
    t40,
    t39,
    t38,
    t37,
  ])
  let t24 = @tactics.repeat_tac(@tactics.conj_tac)
  let t23 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(@term_syntax.parse_term("coprime((1, (n : Num)))")),
      @pair.pair_eq(),
    ]),
  )
  let t22 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.in_elim_thm(),
      @int.arith_rule(@term_syntax.parse_term("(1 < (n : Num)) == (2 <= n)")),
    ]),
  )
  let t20 = @equal.gsym(@bool.conjunct2(@grouptheory.group_tybij()))
  let t21 = @simp.rewrite_tac(@list.List([@equal.gsym(@pair.pair_eq()), t20]))
  let t19 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.group_carrier(),
      @grouptheory.group_id(),
      @grouptheory.group_inv(),
      @grouptheory.group_mul(),
    ]),
  )
  let t17 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) <= 1) == (2 <= n)"))]),
    ),
  )
  let t16 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pocklington.inverse_mod()]),
  )
  let t18 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@grouptheory.singleton_group_v1()])),
      t16,
    ),
    t17,
  ])
  let t15 = @simp.asm_rewrite_tac(@list.List([]))
  let t14 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) <= 1"))
  let t13 = @simp.rewrite_tac(@list.List([modmul_group()]))
  let t12 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t42 = @tactics.thenl(
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
                          @list.List([@theorems.and_forall_thm()]),
                        ),
                        t12,
                      ),
                      t13,
                    ),
                    t14,
                  ),
                  t15,
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
    t41,
  )
  modmul_group_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, group_carrier(modmul_group(n)) == (if n <= 1 { {1} } else { {(m : Num) | m < n && coprime((m, n))} })) && (∀ n : Num, group_id(modmul_group(n)) == 1) && (∀ n : Num, group_inv(modmul_group(n)) == inverse_mod(n)) && (∀ n : Num, group_mul(modmul_group(n)) == (if n <= 1 { (a : Num) => (b : Num) => 1 } else { (a : Num) => (b : Num) => MOD(a * b, n) }))"),
      t42,
    ),
  )
}

///|
let modmul_group_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODMUL_GROUP")

///|
/// `MODMUL_GROUP`
pub fn modmul_group_v1() -> @kernel.Thm {
  modmul_group_v1_c.get()
}

///|
/// FINITE_MODMUL_GROUP
fn step_4() -> Unit raise {
  let t46 = @simp.rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @sets.subset(),
      @sets.in_elim_thm(),
      @iterate.in_numseg(),
    ]),
  )
  let t45 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t44 = @tactics.match_mp_tac(@sets.finite_subset())
  let t43 = @simp.asm_rewrite_tac(@list.List([@sets.finite_sing()]))
  let t47 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(@list.List([modmul_group_v1()])),
              ),
              @class.cond_cases_tac,
            ),
            t43,
          ),
          t44,
        ),
        t45,
      ),
      t46,
    ),
    @int.arith_tac,
  )
  finite_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, FINITE(group_carrier(modmul_group(n)))"),
      t47,
    ),
  )
}

///|
let finite_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_MODMUL_GROUP",
)

///|
/// `FINITE_MODMUL_GROUP`
pub fn finite_modmul_group() -> @kernel.Thm {
  finite_modmul_group_c.get()
}

///|
/// ORDER_MODMUL_GROUP
fn step_5() -> Unit raise {
  let t53 = @simp.rewrite_tac(@list.List([@pocklington.phi_alt()]))
  let t52 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t51 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)")),
    ]),
  )
  let t50 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_refl(), @pocklington.phi_1(), @sets.card_sing()]),
  )
  let t49 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t48 = @simp.asm_rewrite_tac(
    @list.List([modmul_group_v1(), @arith.le_0(), @sets.card_sing()]),
  )
  let t54 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac),
              t48,
            ),
            t49,
          ),
          t50,
        ),
        t51,
      ),
      t52,
    ),
    t53,
  )
  order_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, CARD(group_carrier(modmul_group(n))) == (if n == 0 { 1 } else { phi(n) })"),
      t54,
    ),
  )
}

///|
let order_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDER_MODMUL_GROUP",
)

///|
/// `ORDER_MODMUL_GROUP`
pub fn order_modmul_group() -> @kernel.Thm {
  order_modmul_group_c.get()
}

///|
/// HAS_SIZE_MODMUL_GROUP
fn step_6() -> Unit raise {
  let t55 = @simp.simp_tac(@list.List([order_modmul_group()]))
  let t56 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@sets.has_size(), finite_modmul_group()])),
    t55,
  )
  has_size_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → HAS_SIZE(group_carrier(modmul_group(n)), phi(n))"),
      t56,
    ),
  )
}

///|
let has_size_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_MODMUL_GROUP",
)

///|
/// `HAS_SIZE_MODMUL_GROUP`
pub fn has_size_modmul_group() -> @kernel.Thm {
  has_size_modmul_group_c.get()
}

///|
/// ABELIAN_MODMUL_GROUP
fn step_7() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([@arith.mult_sym()]))
  let t58 = @simp.asm_rewrite_tac(@list.List([]))
  let t57 = @tactics.repeat_tac(@tactics.gen_tac)
  let t60 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(
              @list.List([@grouptheory.abelian_group(), modmul_group_v1()]),
            ),
          ),
          t57,
        ),
        @class.cond_cases_tac,
      ),
      t58,
    ),
    t59,
  )
  abelian_modmul_group_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, abelian_group(modmul_group(n))"), t60),
  )
}

///|
let abelian_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ABELIAN_MODMUL_GROUP",
)

///|
/// `ABELIAN_MODMUL_GROUP`
pub fn abelian_modmul_group() -> @kernel.Thm {
  abelian_modmul_group_c.get()
}

///|
/// TRIVIAL_MODMUL_GROUP
fn step_8() -> Unit raise {
  let t69 = @list.List([
    @tactics.all_tac,
    @tactics.match_mp_tac(@pocklington.phi_lowerbound_2()),
  ])
  let t68 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((n : Num) <= 2) && 2 <= (p : Num) → (p == 1) == (n <= 2)"),
    ),
  )
  let t67 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.phi_2(), @calc_num.arith()]),
  )
  let t66 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t65 = @simp.asm_rewrite_tac(
    @list.List([@pocklington.phi_1(), @calc_num.arith()]),
  )
  let t64 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t63 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t62 = @simp.rewrite_tac(@list.List([order_modmul_group()]))
  let t61 = @simp.rewrite_tac(@list.List([finite_modmul_group()]))
  let t70 = @tactics.then_tac(
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
                            @tactics.gen_tac,
                            @simp.rewrite_tac(
                              @list.List([
                                @grouptheory.trivial_group_has_size_1(),
                                @sets.has_size(),
                              ]),
                            ),
                          ),
                          t61,
                        ),
                        t62,
                      ),
                      @class.cond_cases_tac,
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
        @tactics.conj_tac,
      ),
      t69,
    ),
    @int.asm_arith_tac,
  )
  trivial_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, trivial_group(modmul_group(n)) == (n <= 2)"),
      t70,
    ),
  )
}

///|
let trivial_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIVIAL_MODMUL_GROUP",
)

///|
/// `TRIVIAL_MODMUL_GROUP`
pub fn trivial_modmul_group() -> @kernel.Thm {
  trivial_modmul_group_c.get()
}

///|
/// GROUP_HOMOMORPHISM_PROD_MODMUL_GROUP
fn step_9() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([@arith.mod_mult_mod2()]))
  let t76 = @simp.simp_tac(
    @list.List([
      @prime.coprime_rmul(),
      @arith.mod_mod(),
      @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(@arith.mod_mod()),
    ]),
  )
  let t75 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_eq_0(),
      @arith.mult_eq_1(),
      @sets.in_elim_thm(),
      @arith.mod_lt_eq(),
      @int.coprime_lmod(),
      @pair.pair_eq(),
      @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0) && !(n == 1)")),
    ]),
  )
  let t74 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)")),
    ]),
  )
  let t73 = @simp.rewrite_tac(@list.List([modmul_group_v1()]))
  let t72 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_image(),
      @pair.forall_pair_thm(),
      @sets.in_cross(),
    ]),
  )
  let t71 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.group_homomorphism_v1(),
      @grouptheory.prod_group_v1(),
      @sets.subset(),
    ]),
  )
  let t78 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t71),
              t72,
            ),
            t73,
          ),
          t74,
        ),
        t75,
      ),
      t76,
    ),
    t77,
  )
  group_homomorphism_prod_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, 2 <= m && 2 <= n → group_homomorphism((modmul_group(m * n), prod_group(modmul_group(m), modmul_group(n))), (a : Num) => (MOD(a, m), MOD(a, n)))"),
      t78,
    ),
  )
}

///|
let group_homomorphism_prod_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GROUP_HOMOMORPHISM_PROD_MODMUL_GROUP",
)

///|
/// `GROUP_HOMOMORPHISM_PROD_MODMUL_GROUP`
pub fn group_homomorphism_prod_modmul_group() -> @kernel.Thm {
  group_homomorphism_prod_modmul_group_c.get()
}

///|
/// GROUP_ISOMORPHISM_PROD_MODMUL_GROUP
fn step_10() -> Unit raise {
  let t103 = @meson.asm_meson_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("coprime(((m : Num), (n : Num))) && op_eq_eq((x : Num), (y : Num), mod(m)) && op_eq_eq(x, y, mod(n)) → op_eq_eq(x, y, mod(m * n))"),
      ),
    ]),
  )
  let t102 = @simp.asm_rewrite_tac(@list.List([]))
  let t101 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) * (n : Num)"))
  let t100 = @tactics.match_mp_tac(@pocklington.cong_imp_eq())
  let t99 = @tactics.repeat_tac(@tactics.strip_tac)
  let t98 = @simp.rewrite_tac(
    @list.List([
      @pair.pair_eq(),
      @sets.in_elim_thm(),
      @equal.gsym(@int.cong_v1()),
    ]),
  )
  let t96 = @int.arith_rule(
    @term_syntax.parse_term("2 <= (n : Num) → !(n == 0) && !(n == 1)"),
  )
  let t97 = @simp.asm_simp_tac(
    @list.List([
      modmul_group_v1(),
      @arith.mult_eq_0(),
      @arith.mult_eq_1(),
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)")),
      t96,
    ]),
  )
  let t95 = @simp.asm_simp_tac(
    @list.List([group_homomorphism_prod_modmul_group()]),
  )
  let t94 = @simp.rewrite_tac(@list.List([@grouptheory.group_monomorphism()]))
  let t93 = @tactics.disch_then(fn(
    x90 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s91 = @tactics.subst1_tac(x90)
    fn(
      x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s91(x92)
    }
  })
  let t88 = @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)"))
  let t89 = @simp.asm_simp_tac(
    @list.List([
      order_modmul_group(),
      @grouptheory.finite_prod_group(),
      finite_modmul_group(),
      @arith.mult_eq_0(),
      @bool.conjunct1(@grouptheory.prod_group_v1()),
      @sets.card_cross(),
      @pocklington.phi_multiplicative(),
      t88,
    ]),
  )
  let t83 = @drule.part_match(
    fn(x82 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x82))
    },
    @grouptheory.group_isomorphism_eq_monomorphism_finite(),
  )
  let t104 = @tactics.then_tac(
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
                          fn(
                            x87 : (
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
                            (fn(
                              x86 : (
                                @list.List[(String, @kernel.Thm)],
                                @kernel.Term,
                              ),
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
                              (fn(
                                x84 : @kernel.Term,
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
                                  x79 : @kernel.Thm,
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
                                  let s80 = @tactics.mp_tac(x79)
                                  fn(
                                    x81 : (
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
                                    s80(x81)
                                  }
                                })(t83(x84))
                              })(
                                (fn(
                                  x85 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> @kernel.Term raise {
                                  x85.1
                                })(x86),
                              )
                            })(x87)(x87)
                          },
                        ),
                        t89,
                      ),
                      t93,
                    ),
                    t94,
                  ),
                  t95,
                ),
                t97,
              ),
              t98,
            ),
            t99,
          ),
          t100,
        ),
        t101,
      ),
      t102,
    ),
    t103,
  )
  group_isomorphism_prod_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, 2 <= m && 2 <= n && coprime((m, n)) → group_isomorphism((modmul_group(m * n), prod_group(modmul_group(m), modmul_group(n))), (a : Num) => (MOD(a, m), MOD(a, n)))"),
      t104,
    ),
  )
}

///|
let group_isomorphism_prod_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GROUP_ISOMORPHISM_PROD_MODMUL_GROUP",
)

///|
/// `GROUP_ISOMORPHISM_PROD_MODMUL_GROUP`
pub fn group_isomorphism_prod_modmul_group() -> @kernel.Thm {
  group_isomorphism_prod_modmul_group_c.get()
}

///|
/// ISOMORPHIC_GROUP_MODMUL_GROUP
fn step_11() -> Unit raise {
  let t128 = @simp.asm_rewrite_tac(@list.List([]))
  let t127 = @tactics.match_mp_tac(group_isomorphism_prod_modmul_group())
  let t126 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) => (MOD(a, (m : Num)), MOD(a, (n : Num)))"))
  let t125 = @simp.rewrite_tac(@list.List([@grouptheory.isomorphic_group()]))
  let t124 = @simp.once_rewrite_tac(
    @list.List([@grouptheory.isomorphic_group_sym()]),
  )
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
    @tactics.all_tac
  })
  let t123 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_refl()])),
    t122,
  ])
  let t120 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_eq_0(), @arith.mult_eq_1(), mult_eq_2()]),
  )
  let t119 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((n : Num) <= 2) == (n == 0 || n == 1 || n == 2)"),
      ),
    ]),
  )
  let t118 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_clauses(),
      @grouptheory.isomorphic_prod_trivial_group(),
      trivial_modmul_group(),
      @calc_num.arith(),
    ]),
  )
  let t117 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t116 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_clauses(),
      @grouptheory.isomorphic_prod_trivial_group(),
      trivial_modmul_group(),
      @calc_num.arith(),
    ]),
  )
  let t115 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t114 = @simp.asm_simp_tac(
    @list.List([@prime.coprime_0(), @calc_num.arith()]),
  )
  let t113 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t112 = @simp.asm_simp_tac(
    @list.List([@prime.coprime_0(), @calc_num.arith()]),
  )
  let t111 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t110 = @tactics.pop_assum(fn(
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
  })
  let t106 = @simp.rewrite_tac(
    @list.List([@grouptheory.trivial_prod_group(), trivial_modmul_group()]),
  )
  let t105 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@grouptheory.isomorphic_trivial_groups()]),
      @term_syntax.parse_term("trivial_group((G : Group[_])) == trivial_group((H : Group[_])) && (!trivial_group(G) && !trivial_group(H) → isomorphic_group(G, H)) → isomorphic_group(G, H)"),
    ),
  )
  let t129 = @tactics.then_tac(
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
                                              @tactics.repeat_tac(
                                                @tactics.strip_tac,
                                              ),
                                              t105,
                                            ),
                                            t106,
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
                                @tactics.disch_tac,
                              ),
                              t115,
                            ),
                            t116,
                          ),
                          t117,
                        ),
                        t118,
                      ),
                      t119,
                    ),
                    t120,
                  ),
                  @tactics.conj_tac,
                ),
                t123,
              ),
              t124,
            ),
            t125,
          ),
          t126,
        ),
        t127,
      ),
      t128,
    ),
    @int.asm_arith_tac,
  )
  isomorphic_group_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, coprime((m, n)) → isomorphic_group(prod_group(modmul_group(m), modmul_group(n)), modmul_group(m * n))"),
      t129,
    ),
  )
}

///|
let isomorphic_group_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISOMORPHIC_GROUP_MODMUL_GROUP",
)

///|
/// `ISOMORPHIC_GROUP_MODMUL_GROUP`
pub fn isomorphic_group_modmul_group() -> @kernel.Thm {
  isomorphic_group_modmul_group_c.get()
}

///|
/// GROUP_POW_MODMUL_GROUP
fn step_12() -> Unit raise {
  let t133 = @meson.meson_tac(
    @list.List([
      @arith.mod_mult_mod2(),
      @arith.mod_mod_refl(),
      @arith.mod_exp_mod(),
    ]),
  )
  let t132 = @tactics.match_mp_tac(@arith.mod_lt())
  let t134 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t132),
      @int.asm_arith_tac,
    ),
    t133,
  ])
  let t131 = @simp.asm_rewrite_tac(@list.List([@arith.exp()]))
  let t130 = @simp.asm_rewrite_tac(
    @list.List([@grouptheory.group_pow(), modmul_group_v1()]),
  )
  let t135 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
            @nums.induct_tac,
          ),
          t130,
        ),
        @class.cond_cases_tac,
      ),
      t131,
    ),
    t134,
  )
  group_pow_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, ∀ k : Num, group_pow(modmul_group(n), a, k) == (if n <= 1 { 1 } else { MOD(EXP(a, k), n) })"),
      t135,
    ),
  )
}

///|
let group_pow_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GROUP_POW_MODMUL_GROUP",
)

///|
/// `GROUP_POW_MODMUL_GROUP`
pub fn group_pow_modmul_group() -> @kernel.Thm {
  group_pow_modmul_group_c.get()
}

///|
/// GROUP_ELEMENT_ORDER_MODMUL_GROUP
fn step_13() -> Unit raise {
  let t149 = @simp.asm_simp_tac(@list.List([@arith.mod_lt()]))
  let t148 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.not_le()])),
  )
  let t147 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t145 = @simp.asm_simp_tac(
    @list.List([@sets.in_sing(), @arith.exp_one(), @int.cong_v1()]),
  )
  let t144 = @simp.rewrite_tac(@list.List([modmul_group_v1()]))
  let t143 = @simp.rewrite_tac(@list.List([group_pow_modmul_group()]))
  let t142 = @tactics.pop_assum(fn(
    x139 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s140 = @tactics.mp_tac(x139)
    fn(
      x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s140(x141)
    }
  })
  let t138 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t137 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@pocklington.order_divides())]),
  )
  let t136 = @simp.asm_simp_tac(
    @list.List([@grouptheory.group_element_order_unique()]),
  )
  let t150 = @tactics.then_tac(
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
                        t136,
                      ),
                      t137,
                    ),
                    t138,
                  ),
                  t142,
                ),
                t143,
              ),
              t144,
            ),
            @class.cond_cases_tac,
          ),
          t145,
        ),
        t147,
      ),
      t148,
    ),
    t149,
  )
  group_element_order_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, IN(a, group_carrier(modmul_group(n))) → group_element_order(modmul_group(n), a) == order(n, a)"),
      t150,
    ),
  )
}

///|
let group_element_order_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "GROUP_ELEMENT_ORDER_MODMUL_GROUP",
)

///|
/// `GROUP_ELEMENT_ORDER_MODMUL_GROUP`
pub fn group_element_order_modmul_group() -> @kernel.Thm {
  group_element_order_modmul_group_c.get()
}

///|
/// CYCLIC_MODMUL_GROUP
fn step_14() -> Unit raise {
  let t186 = @simp.rewrite_tac(
    @list.List([@int.cong_lmod(), @pocklington.cong_refl()]),
  )
  let t185 = @tactics.match_mp_tac(@pocklington.order_cong())
  let t184 = @tactics.first_x_assum(fn(
    x183 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x180 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s181 = @tactics.subst1_tac(x180)
      fn(
        x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s181(x182)
      }
    })(@equal.sym(x183))
  })
  let t179 = @simp.asm_simp_tac(
    @list.List([
      @pocklington.phi_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("2 < (n : Num) → !(n == 0)")),
    ]),
  )
  let t178 = @simp.gen_rewrite_tac(
    fn(
      x177 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x171 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s172 = @equal.land_conv(x171)
        fn(x173 : @kernel.Term) -> @kernel.Thm raise { s172(x173) }
      })(
        (fn(
          x174 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s175 = @equal.once_depth_conv(x174)
          fn(x176 : @kernel.Term) -> @kernel.Thm raise { s175(x176) }
        })(x177),
      )
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t170 = @simp.simp_tac(
    @list.List([@equal.gsym(@pocklington.order_eq_0())]),
  )
  let t169 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t168 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(!(p : Bool) → !(q : Bool)) && q → p && q")),
  )
  let t167 = @simp.asm_simp_tac(
    @list.List([
      @arith.mod_lt_eq(),
      @int.arith_rule(@term_syntax.parse_term("2 < (n : Num) → !(n == 0)")),
    ]),
  )
  let t166 = @tactics.exists_tac(@term_syntax.parse_term("MOD((k : Num), (n : Num))"))
  let t165 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t164 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t163 = @tactics.disch_then(fn(
    x162 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s160 = @tactics.subst1_tac(x159)
      fn(
        x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s160(x161)
      }
    })(@equal.sym(x162))
  })
  let t158 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @class.not_imp()]),
  )
  let t157 = @simp.asm_simp_tac(
    @list.List([
      order_modmul_group(),
      finite_modmul_group(),
      modmul_group_v1(),
      @int.arith_rule(
        @term_syntax.parse_term("2 < (n : Num) → !(n == 0) && !(n == 1) && !(n <= 1)"),
      ),
    ]),
  )
  let t156 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), @primitive.primitive_root_exists()),
  )
  let t155 = @simp.simp_tac(@list.List([group_element_order_modmul_group()]))
  let t154 = @simp.once_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == !(p → !q)"))]),
  )
  let t153 = @simp.simp_tac(
    @list.List([
      @grouptheory.cyclic_group_element_order(),
      finite_modmul_group(),
    ]),
  )
  let t151 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.not_le()])),
  )
  let t152 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          trivial_modmul_group(),
          @grouptheory.trivial_imp_cyclic_group(),
        ]),
      ),
      @int.asm_arith_tac,
    ),
    t151,
  ])
  let t187 = @tactics.then_tac(
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
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.gen_tac,
                                              @class.asm_cases_tac(
                                                @term_syntax.parse_term("(n : Num) <= 2"),
                                              ),
                                            ),
                                            t152,
                                          ),
                                          t153,
                                        ),
                                        t154,
                                      ),
                                      t155,
                                    ),
                                    t156,
                                  ),
                                  t157,
                                ),
                                t158,
                              ),
                              t163,
                            ),
                            @tactics.eq_tac,
                          ),
                          t164,
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
              ),
              t170,
            ),
            t178,
          ),
          t179,
        ),
        t184,
      ),
      t185,
    ),
    t186,
  )
  cyclic_modmul_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, cyclic_group(modmul_group(n)) == (n == 0 || n == 1 || n == 2 || n == 4 || (∃ p : Num, ∃ k : Num, prime(p) && 3 <= p && (n == EXP(p, k) || n == 2 * EXP(p, k))))"),
      t187,
    ),
  )
}

///|
let cyclic_modmul_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CYCLIC_MODMUL_GROUP",
)

///|
/// `CYCLIC_MODMUL_GROUP`
pub fn cyclic_modmul_group() -> @kernel.Thm {
  cyclic_modmul_group_c.get()
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
}
