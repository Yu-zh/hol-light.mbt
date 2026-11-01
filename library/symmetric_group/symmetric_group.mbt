// Translated from upstream Library/symmetric_group.ml; edit this file directly.

///|
/// symmetric_group
fn step_1() -> Unit raise {
  symmetric_group_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(symmetric_group : ((A) -> Bool) -> Group[(A) -> A])((s : (A) -> Bool)) == group(({(p : (A) -> A) | permutes(p, s)}, I, inverse, o))"),
    ),
  )
}

///|
let symmetric_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "symmetric_group",
)

///|
/// `symmetric_group`
pub fn symmetric_group() -> @kernel.Thm {
  symmetric_group_c.get()
}

///|
/// SYMMETRIC_GROUP
fn step_2() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([@permutations.permutes_inverses_o()]))
  let t3 = @simp.simp_tac(
    @list.List([
      @trivia.o_assoc(),
      @trivia.i_o_id(),
      @sets.in_elim_thm(),
      @permutations.permutes_compose(),
      @permutations.permutes_i(),
      @permutations.permutes_inverse(),
    ]),
  )
  let t2 = @simp.rewrite_tac(
    @list.List([
      symmetric_group(),
      @equal.gsym(@bool.conjunct2(@grouptheory.group_tybij())),
    ]),
  )
  let t1 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.group_carrier(),
      @grouptheory.group_id(),
      @grouptheory.group_inv(),
      @grouptheory.group_mul(),
    ]),
  )
  let t5 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @theorems.and_forall_thm(),
              @equal.gsym(@pair.pair_eq()),
            ]),
          ),
          t1,
        ),
        t2,
      ),
      t3,
    ),
    t4,
  )
  symmetric_group_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (A) -> Bool, group_carrier(symmetric_group(s)) == {(p : (A) -> A) | permutes(p, s)}) && (∀ s : (A) -> Bool, group_id(symmetric_group(s)) == I) && (∀ s : (A) -> Bool, group_inv(symmetric_group(s)) == inverse) && (∀ s : (A) -> Bool, group_mul(symmetric_group(s)) == o)"),
      t5,
    ),
  )
}

///|
let symmetric_group_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP",
)

///|
/// `SYMMETRIC_GROUP`
pub fn symmetric_group_v1() -> @kernel.Thm {
  symmetric_group_v1_c.get()
}

///|
/// FINITE_SYMMETRIC_GROUP
fn step_3() -> Unit raise {
  let t6 = @simp.simp_tac(
    @list.List([symmetric_group_v1(), @permutations.finite_permutations()]),
  )
  finite_symmetric_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → FINITE(group_carrier(symmetric_group(s)))"),
      t6,
    ),
  )
}

///|
let finite_symmetric_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_SYMMETRIC_GROUP",
)

///|
/// `FINITE_SYMMETRIC_GROUP`
pub fn finite_symmetric_group() -> @kernel.Thm {
  finite_symmetric_group_c.get()
}

///|
/// CARD_SYMMETRIC_GROUP
fn step_4() -> Unit raise {
  let t7 = @simp.simp_tac(
    @list.List([symmetric_group_v1(), @permutations.card_permutations()]),
  )
  card_symmetric_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → CARD(group_carrier(symmetric_group(s))) == FACT(CARD(s))"),
      t7,
    ),
  )
}

///|
let card_symmetric_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_SYMMETRIC_GROUP",
)

///|
/// `CARD_SYMMETRIC_GROUP`
pub fn card_symmetric_group() -> @kernel.Thm {
  card_symmetric_group_c.get()
}

///|
/// SYMMETRIC_GROUP_MUL
fn step_5() -> Unit raise {
  let t8 = @simp.rewrite_tac(@list.List([symmetric_group_v1()]))
  symmetric_group_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, ∀ q : (A) -> A, group_mul(symmetric_group(s), p, q) == o(p, q)"),
      t8,
    ),
  )
}

///|
let symmetric_group_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_MUL",
)

///|
/// `SYMMETRIC_GROUP_MUL`
pub fn symmetric_group_mul() -> @kernel.Thm {
  symmetric_group_mul_c.get()
}

///|
/// SYMMETRIC_GROUP_INV
fn step_6() -> Unit raise {
  let t9 = @simp.rewrite_tac(@list.List([symmetric_group_v1()]))
  symmetric_group_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, group_inv(symmetric_group(s), p) == inverse(p)"),
      t9,
    ),
  )
}

///|
let symmetric_group_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_INV",
)

///|
/// `SYMMETRIC_GROUP_INV`
pub fn symmetric_group_inv() -> @kernel.Thm {
  symmetric_group_inv_c.get()
}

///|
/// SYMMETRIC_GROUP_ID
fn step_7() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([symmetric_group_v1()]))
  symmetric_group_id_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, group_id(symmetric_group(s)) == I"),
      t10,
    ),
  )
}

///|
let symmetric_group_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_ID",
)

///|
/// `SYMMETRIC_GROUP_ID`
pub fn symmetric_group_id() -> @kernel.Thm {
  symmetric_group_id_c.get()
}

///|
/// SWAP_IN_SYMMETRIC_GROUP
fn step_8() -> Unit raise {
  let t11 = @simp.simp_tac(
    @list.List([
      symmetric_group_v1(),
      @sets.in_elim_thm(),
      @permutations.permutes_swap(),
    ]),
  )
  swap_in_symmetric_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, IN(a, s) && IN(b, s) → IN(swap((a, b)), group_carrier(symmetric_group(s)))"),
      t11,
    ),
  )
}

///|
let swap_in_symmetric_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_IN_SYMMETRIC_GROUP",
)

///|
/// `SWAP_IN_SYMMETRIC_GROUP`
pub fn swap_in_symmetric_group() -> @kernel.Thm {
  swap_in_symmetric_group_c.get()
}

///|
/// THREE_CYCLE_IN_SYMMETRIC
fn step_9() -> Unit raise {
  let t12 = @simp.simp_tac(
    @list.List([
      symmetric_group_v1(),
      @sets.in_elim_thm(),
      @permutations.permutes_three_cycle(),
    ]),
  )
  three_cycle_in_symmetric_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, ∀ c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) → IN(three_cycle(a, b, c), group_carrier(symmetric_group(s)))"),
      t12,
    ),
  )
}

///|
let three_cycle_in_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_IN_SYMMETRIC",
)

///|
/// `THREE_CYCLE_IN_SYMMETRIC`
pub fn three_cycle_in_symmetric() -> @kernel.Thm {
  three_cycle_in_symmetric_c.get()
}

///|
/// CAYLEY_THEOREM_EXPLICIT
fn step_10() -> Unit raise {
  let t25 = @simp.asm_rewrite_tac(@list.List([]))
  let t20 = @tactics.repeat_tac(@tactics.strip_tac)
  let t19 = @simp.asm_simp_tac(
    @list.List([@grouptheory.group_mul_v1(), @grouptheory.group_inv_v1()]),
  )
  let t18 = @tactics.exists_tac(
    @term_syntax.parse_term("group_mul((G : Group[A]), group_inv(G, (a : A)))"),
  )
  let t17 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t16 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(
      @list.List([
        @grouptheory.group_mul_assoc(),
        @grouptheory.group_mul_rid(),
        @grouptheory.group_mul_v1(),
        @grouptheory.group_id_v1(),
      ]),
    ),
  ])
  let t15 = @simp.simp_tac(
    @list.List([
      @permutations.permutes_inverse_function(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t14 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @trivia.o_thm(),
      @sets.in_elim_thm(),
      @trivia.i_thm(),
    ]),
  )
  let t13 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.forall_in_image(), symmetric_group_v1()]),
  )
  let t26 = @tactics.then_tac(
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
                            @tactics.gen_tac,
                            @simp.rewrite_tac(
                              @list.List([
                                @grouptheory.group_monomorphism_alt(),
                                @grouptheory.group_homomorphism_v1(),
                              ]),
                            ),
                          ),
                          t13,
                        ),
                        t14,
                      ),
                      t15,
                    ),
                    @tactics.conj_tac,
                  ),
                  t16,
                ),
                t17,
              ),
              @tactics.disch_tac,
            ),
            t18,
          ),
          t19,
        ),
        t20,
      ),
      fn(
        x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x21 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            @tactics.match_mp_tac(@grouptheory.group_rule(x21))
          })(
            (fn(
              x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x22.1
            })(x23),
          )
        })(x24)(x24)
      },
    ),
    t25,
  )
  cayley_theorem_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ G : Group[A], group_monomorphism((G, symmetric_group(group_carrier(G))), (a : A) => (x : A) => if IN(x, group_carrier(G)) { group_mul(G, a, x) } else { x })"),
      t26,
    ),
  )
}

///|
let cayley_theorem_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CAYLEY_THEOREM_EXPLICIT",
)

///|
/// `CAYLEY_THEOREM_EXPLICIT`
pub fn cayley_theorem_explicit() -> @kernel.Thm {
  cayley_theorem_explicit_c.get()
}

///|
/// CAYLEY_THEOREM
fn step_11() -> Unit raise {
  let t31 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.group_isomorphism_onto_image(),
      cayley_theorem_explicit(),
    ]),
  )
  let t30 = @tactics.exists_tac(
    @term_syntax.parse_term("(a : A) => (x : A) => if IN(x, group_carrier((G : Group[A]))) { group_mul(G, a, x) } else { x }"),
  )
  let t32 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@grouptheory.isomorphic_group()])),
      t30,
    ),
    t31,
  )
  let t29 = @simp.rewrite_tac(@list.List([cayley_theorem_explicit()]))
  let t28 = @tactics.match_mp_tac(
    @grouptheory.group_monomorphism_imp_homomorphism(),
  )
  let t33 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@grouptheory.subgroup_group_image()),
        t28,
      ),
      t29,
    ),
    t32,
  ])
  let t27 = @tactics.exists_tac(
    @term_syntax.parse_term("group_image(((G : Group[A]), symmetric_group(group_carrier(G))), (a : A) => (x : A) => if IN(x, group_carrier(G)) { group_mul(G, a, x) } else { x })"),
  )
  let t34 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.once_rewrite_tac(
            @list.List([@grouptheory.isomorphic_group_sym()]),
          ),
        ),
        t27,
      ),
      @tactics.conj_tac,
    ),
    t33,
  )
  cayley_theorem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ G : Group[A], ∃ h : ((A) -> A) -> Bool, subgroup_of(h, symmetric_group(group_carrier(G))) && isomorphic_group(subgroup_generated(symmetric_group(group_carrier(G)), h), G)"),
      t34,
    ),
  )
}

///|
let cayley_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAYLEY_THEOREM")

///|
/// `CAYLEY_THEOREM`
pub fn cayley_theorem() -> @kernel.Thm {
  cayley_theorem_c.get()
}

///|
/// SYMMETRIC_GROUP_ACTION
fn step_12() -> Unit raise {
  let t37 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t38 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t37)
  let t39 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(@list.List([@trivia.i_thm()])),
  )
  let t40 = @list.List([
    @meson.meson_tac(@list.List([@permutations.permutes_in_image()])),
    t39,
    t38,
  ])
  let t36 = @tactics.repeat_tac(@tactics.conj_tac)
  let t35 = @simp.simp_tac(@list.List([]))
  let t41 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([
              @grouptheory.group_action(),
              symmetric_group_v1(),
              @sets.in_elim_thm(),
            ]),
          ),
        ),
        t35,
      ),
      t36,
    ),
    t40,
  )
  symmetric_group_action_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, group_action(symmetric_group(s), s, (f : (A) -> A) => (x : A) => f(x))"),
      t41,
    ),
  )
}

///|
let symmetric_group_action_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_ACTION",
)

///|
/// `SYMMETRIC_GROUP_ACTION`
pub fn symmetric_group_action() -> @kernel.Thm {
  symmetric_group_action_c.get()
}

///|
/// CHAIN_STEP_THREE_CYCLES_GEN
fn step_13() -> Unit raise {
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @meson.asm_meson_tac(@list.List([]))
  let t79 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@permutations.three_cycle_commutator()),
      t77,
    ),
    t78,
  ])
  let t76 = @tactics.subgoal_then(
    @term_syntax.parse_term("three_cycle((a : A), (b : A), (c : A)) == o(inverse(three_cycle((d : A), a, c)), o(inverse(three_cycle(c, (e : A), b)), o(three_cycle(d, a, c), three_cycle(c, e, b))))"),
    fn(
      x73 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s74 = @tactics.subst1_tac(x73)
      fn(
        x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s74(x75)
      }
    },
  )
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t71 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t67 = @term_syntax.parse_term("three_cycle((c : A), (e : A), (b : A))")
  let t68 = @term_syntax.parse_term("three_cycle((d : A), (a : A), (c : A))")
  let t69 = @term_syntax.parse_term("(n : ((A) -> A) -> Bool)")
  let t70 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(H : Group[(A) -> A])"), t69, t68, t67]),
      @grouptheory.abelian_quotient_commutator(),
    ),
  )
  let t62 = @term_syntax.parse_term("(d : A)")
  let t63 = @term_syntax.parse_term("(c : A)")
  let t64 = @term_syntax.parse_term("(b : A)")
  let t65 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(a : A)"), t64, t63, t62]),
      @sets.card_le_4(),
    ),
  )
  let t61 = @simp.rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.finite_empty()]),
  )
  let t58 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.card_subset()),
  )
  let t60 = @tactics.disch_then(fn(
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
    })(t58(x59))
  })
  let t66 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @sets.set_rule(
                @term_syntax.parse_term("!SUBSET((s : (A) -> Bool), {(a : A), (b : A), (c : A), (d : A)}) → (∃ e : A, IN(e, s) && !(e == a) && !(e == b) && !(e == c) && !(e == d))"),
              ),
            ),
            t60,
          ),
          t61,
        ),
        t65,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t54 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ e : A, IN(e, (s : (A) -> Bool)) && !(e == (a : A)) && !(e == (b : A)) && !(e == (c : A)) && !(e == (d : A))"),
    @tactics.strip_assume_tac,
  )
  let t50 = @term_syntax.parse_term("(c : A)")
  let t51 = @term_syntax.parse_term("(b : A)")
  let t52 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(a : A)"), t51, t50]),
      @sets.card_le_3(),
    ),
  )
  let t49 = @simp.rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.finite_empty()]),
  )
  let t46 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.card_subset()),
  )
  let t48 = @tactics.disch_then(fn(
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
      x43 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s44 = @tactics.mp_tac(x43)
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
    })(t46(x47))
  })
  let t53 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @sets.set_rule(
                @term_syntax.parse_term("!SUBSET((s : (A) -> Bool), {(a : A), (b : A), (c : A)}) → (∃ d : A, IN(d, s) && !(d == a) && !(d == b) && !(d == c))"),
              ),
            ),
            t48,
          ),
          t49,
        ),
        t52,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t42 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ d : A, IN(d, (s : (A) -> Bool)) && !(d == (a : A)) && !(d == (b : A)) && !(d == (c : A))"),
    @tactics.strip_assume_tac,
  )
  let t80 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t42,
                      ),
                      t53,
                    ),
                    t54,
                  ),
                  t66,
                ),
                t70,
              ),
              @tactics.ants_tac,
            ),
            t71,
          ),
          t72,
        ),
        @tactics.disch_tac,
      ),
      t76,
    ),
    t79,
  )
  chain_step_three_cycles_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ H : Group[(A) -> A], ∀ n : ((A) -> A) -> Bool, 5 <= CARD(s) && FINITE(s) && normal_subgroup_of(n, H) && abelian_group(quotient_group(H, n)) && group_mul(H) == o && group_inv(H) == inverse && (∀ a : A, ∀ b : A, ∀ c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) → IN(three_cycle(a, b, c), group_carrier(H))) → (∀ a : A, ∀ b : A, ∀ c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) → IN(three_cycle(a, b, c), n))"),
      t80,
    ),
  )
}

///|
let chain_step_three_cycles_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHAIN_STEP_THREE_CYCLES_GEN",
)

///|
/// `CHAIN_STEP_THREE_CYCLES_GEN`
pub fn chain_step_three_cycles_gen() -> @kernel.Thm {
  chain_step_three_cycles_gen_c.get()
}

///|
/// NOT_SOLVABLE_SYMMETRIC_GROUP
fn step_14() -> Unit raise {
  let t192 = @meson.asm_meson_tac(
    @list.List([@permutations.three_cycle_not_i()]),
  )
  let t189 = @term_syntax.parse_term("(z : A)")
  let t190 = @term_syntax.parse_term("(y : A)")
  let t191 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : A)"), t190, t189]),
      @permutations.three_cycle_not_i(),
    ),
  )
  let t188 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing()]))
  let t182 = @term_syntax.parse_term("(z : A)")
  let t183 = @term_syntax.parse_term("(y : A)")
  let t184 = @list.List([@term_syntax.parse_term("(x : A)"), t183, t182])
  let t187 = @tactics.first_x_assum(fn(
    x186 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x179 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s180 = @tactics.mp_tac(x179)
      fn(
        x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s180(x181)
      }
    })(((x185 : @kernel.Thm) => @bool.specl(t184, x185))(x186))
  })
  let t176 = @term_syntax.parse_term("(y : A)")
  let t177 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : A)"), t176]),
      @sets.card_le_2(),
    ),
  )
  let t175 = @simp.rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.finite_empty()]),
  )
  let t172 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.card_subset()),
  )
  let t174 = @tactics.disch_then(fn(
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
    (fn(
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
    })(t172(x173))
  })
  let t178 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @sets.set_rule(
                @term_syntax.parse_term("!SUBSET((s : (A) -> Bool), {(x : A), (y : A)}) → (∃ z : A, IN(z, s) && !(z == x) && !(z == y))"),
              ),
            ),
            t174,
          ),
          t175,
        ),
        t177,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t168 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ z : A, IN(z, (s : (A) -> Bool)) && !(z == (x : A)) && !(z == (y : A))"),
    @tactics.strip_assume_tac,
  )
  let t166 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(x : A)"), @sets.card_sing()),
  )
  let t165 = @simp.rewrite_tac(
    @list.List([@sets.finite_insert(), @sets.finite_empty()]),
  )
  let t162 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.card_subset()),
  )
  let t164 = @tactics.disch_then(fn(
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
      let s160 = @tactics.mp_tac(x159)
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
    })(t162(x163))
  })
  let t167 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @sets.set_rule(
                @term_syntax.parse_term("!SUBSET((s : (A) -> Bool), {(x : A)}) → (∃ y : A, IN(y, s) && !(y == x))"),
              ),
            ),
            t164,
          ),
          t165,
        ),
        t166,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t158 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ y : A, IN(y, (s : (A) -> Bool)) && !(y == (x : A))"),
    @tactics.strip_assume_tac,
  )
  let t156 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.card_clauses()])),
  )
  let t155 = @tactics.disch_then(fn(
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
  })
  let t157 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@sets.member_not_empty()])),
          t155,
        ),
        t156,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t151 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : A, IN(x, (s : (A) -> Bool))"),
    @tactics.strip_assume_tac,
  )
  let t150 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t147 = @term_syntax.parse_term("(k : Num)")
  let t193 = @tactics.then_tac(
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
                            @tactics.disch_then(fn(
                              x149 : @kernel.Thm,
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
                                x144 : @kernel.Thm,
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
                                let s145 = @tactics.mp_tac(x144)
                                fn(
                                  x146 : (
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
                                  s145(x146)
                                }
                              })(
                                ((x148 : @kernel.Thm) => @bool.spec(t147, x148))(
                                  x149,
                                ),
                              )
                            }),
                            t150,
                          ),
                          @tactics.strip_tac,
                        ),
                        t151,
                      ),
                      t157,
                    ),
                    t158,
                  ),
                  t167,
                ),
                t168,
              ),
              t178,
            ),
            t187,
          ),
          t188,
        ),
        @tactics.disch_tac,
      ),
      t191,
    ),
    t192,
  )
  let t139 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @tactics.then_tac(
    @simp.asm_simp_tac(
      @list.List([@grouptheory.carrier_subgroup_generated_subgroup()]),
    ),
    t139,
  )
  let t141 = @simp.rewrite_tac(
    @list.List([@grouptheory.subgroup_generated_v1(), symmetric_group_v1()]),
  )
  let t142 = @list.List([
    @simp.rewrite_tac(
      @list.List([@grouptheory.subgroup_generated_v1(), symmetric_group_v1()]),
    ),
    t141,
    t140,
  ])
  let t138 = @tactics.repeat_tac(@tactics.conj_tac)
  let t137 = @simp.asm_rewrite_tac(@list.List([]))
  let t136 = @tactics.exists_tac(
    @term_syntax.parse_term("subgroup_generated(symmetric_group((s : (A) -> Bool)), (c : (Num, (A) -> A) -> Bool)((i : Num)))"),
  )
  let t135 = @tactics.match_mp_tac(chain_step_three_cycles_gen())
  let t134 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.asm_rewrite_tac(@list.List([]))
  let t129 = @term_syntax.parse_term("(c : (Num, (A) -> A) -> Bool)((i : Num))")
  let t130 = @term_syntax.parse_term("(c : (Num, (A) -> A) -> Bool)(SUC((i : Num)))")
  let t133 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([
              @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
              t130,
              t129,
            ]),
            @grouptheory.subgroup_of_subgroup_generated_subgroup_eq(),
          ),
        ),
        t131,
      ),
      t132,
    ),
    @tactics.all_tac,
  ])
  let t128 = @tactics.subgoal_then(
    @term_syntax.parse_term("subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), symmetric_group((s : (A) -> Bool))) && SUBSET(c(SUC(i)), c(i))"),
    @tactics.strip_assume_tac,
  )
  let t127 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@grouptheory.normal_subgroup_imp_subgroup()]),
    ),
    @tactics.all_tac,
  ])
  let t126 = @tactics.subgoal_then(
    @term_syntax.parse_term("subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), subgroup_generated(symmetric_group((s : (A) -> Bool)), c(i)))"),
    fn(
      x123 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s124 = @tactics.assume_tac(x123)
      fn(
        x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s124(x125)
      }
    },
  )
  let t121 = @simp.asm_rewrite_tac(@list.List([]))
  let t118 = @term_syntax.parse_term("(i : Num)")
  let t122 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
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
        })(((x119 : @kernel.Thm) => @bool.spec(t118, x119))(x120))
      }),
      t121,
    ),
    @tactics.all_tac,
  ])
  let t114 = @tactics.subgoal_then(
    @term_syntax.parse_term("normal_subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), subgroup_generated(symmetric_group((s : (A) -> Bool)), c(i))) && abelian_group(quotient_group(subgroup_generated(symmetric_group(s), c(i)), c(SUC(i))))"),
    @tactics.strip_assume_tac,
  )
  let t113 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) < (k : Num)"), fn(
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
    let s111 = @tactics.assume_tac(x110)
    fn(
      x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s111(x112)
    }
  })
  let t109 = @simp.asm_rewrite_tac(@list.List([]))
  let t108 = @tactics.first_x_assum(fn(
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
    (fn(
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
    })(
      ((x106 : @kernel.Thm) => {
        @lib.check(
          fn(x105 : @kernel.Thm) -> Bool raise {
            (fn(x103 : @kernel.Term) -> Bool raise { @basics.is_imp(x103) })(
              (fn(x104 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x104)
              })(x105),
            )
          },
          x106,
        )
      })(x107),
    )
  })
  let t143 = @tactics.thenl(
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.disch_tac,
                                          @tactics.subgoal_then(
                                            @term_syntax.parse_term("(i : Num) <= (k : Num)"),
                                            fn(
                                              x97 : @kernel.Thm,
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
                                              let s98 = @tactics.assume_tac(x97)
                                              fn(
                                                x99 : (
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
                                                s98(x99)
                                              }
                                            },
                                          ),
                                        ),
                                        @list.List([
                                          @int.asm_arith_tac, @tactics.all_tac,
                                        ]),
                                      ),
                                      t108,
                                    ),
                                    t109,
                                  ),
                                  @tactics.strip_tac,
                                ),
                                t113,
                              ),
                              @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                            ),
                            t114,
                          ),
                          t122,
                        ),
                        t126,
                      ),
                      t127,
                    ),
                    t128,
                  ),
                  t133,
                ),
                @tactics.conj_tac,
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
    t142,
  )
  let t96 = @simp.simp_tac(@list.List([three_cycle_in_symmetric()]))
  let t95 = @simp.rewrite_tac(@list.List([@grouptheory.carrier_subgroup_of()]))
  let t194 = @list.List([
    @tactics.thenl(
      @nums.induct_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @simp.asm_rewrite_tac(@list.List([])),
            ),
            t95,
          ),
          t96,
        ),
        t143,
      ]),
    ),
    t193,
  ])
  let t94 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ i : Num, i <= (k : Num) → subgroup_of((c : (Num, (A) -> A) -> Bool)(i), symmetric_group((s : (A) -> Bool))) && (∀ a : A, ∀ b : A, ∀ c' : A, IN(a, s) && IN(b, s) && IN(c', s) && !(a == b) && !(b == c') && !(a == c') → IN(three_cycle(a, b, c'), c(i)))"),
    fn(
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    },
  )
  let t89 = @tactics.x_choose_then(@term_syntax.parse_term("(c : (Num, (A) -> A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t90 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t89),
  )
  let t88 = @simp.rewrite_tac(@list.List([symmetric_group_id()]))
  let t85 = @simp.gen_rewrite_rule(
    fn(
      x84 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x84
    },
    @list.List([@grouptheory.solvable_group()]),
  )
  let t87 = @tactics.first_x_assum(fn(
    x86 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s82 = @tactics.mp_tac(x81)
      fn(
        x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s82(x83)
      }
    })(t85(x86))
  })
  let t195 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t87),
          t88,
        ),
        t90,
      ),
      t94,
    ),
    t194,
  )
  not_solvable_symmetric_group_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) && 5 <= CARD(s) → !solvable_group(symmetric_group(s))"),
      t195,
    ),
  )
}

///|
let not_solvable_symmetric_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_SOLVABLE_SYMMETRIC_GROUP",
)

///|
/// `NOT_SOLVABLE_SYMMETRIC_GROUP`
pub fn not_solvable_symmetric_group() -> @kernel.Thm {
  not_solvable_symmetric_group_c.get()
}

///|
/// POINT_TRANSPOSITIONS_GENERATE_ALL
fn step_15() -> Unit raise {
  let t207 = @meson.asm_meson_tac(@list.List([@permutations.swap_triple_alt()]))
  let t206 = @tactics.subgoal_then(
    @term_syntax.parse_term("swap(((x : A), (y : A))) == o(swap(((a : A), x)), o(swap((a, y)), swap((a, x))))"),
    fn(
      x203 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s204 = @tactics.subst1_tac(x203)
      fn(
        x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s204(x205)
      }
    },
  )
  let t202 = @list.List([
    @meson.asm_meson_tac(@list.List([@permutations.swap_refl()])),
    @tactics.all_tac,
  ])
  let t201 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t200 = @list.List([
    @meson.asm_meson_tac(@list.List([@permutations.swap_sym()])),
    @tactics.all_tac,
  ])
  let t199 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (a : A)"))
  let t198 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t197 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (a : A)"))
  let t196 = @tactics.repeat_tac(@tactics.strip_tac)
  let t208 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([
                        @grouptheory.subgroup_of(),
                        symmetric_group_v1(),
                      ]),
                    ),
                    t196,
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
        ),
        t202,
      ),
      t206,
    ),
    t207,
  )
  point_transpositions_generate_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ h : ((A) -> A) -> Bool, IN(a, s) && subgroup_of(h, symmetric_group(s)) && (∀ x : A, IN(x, s) && !(x == a) → IN(swap((a, x)), h)) → (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) → IN(swap((x, y)), h))"),
      t208,
    ),
  )
}

///|
let point_transpositions_generate_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POINT_TRANSPOSITIONS_GENERATE_ALL",
)

///|
/// `POINT_TRANSPOSITIONS_GENERATE_ALL`
pub fn point_transpositions_generate_all() -> @kernel.Thm {
  point_transpositions_generate_all_c.get()
}

///|
/// RESTRICT_SYMMETRIC_GROUP_HOMOMORPHISM
fn step_16() -> Unit raise {
  let t240 = @simp.asm_simp_tac(@list.List([]))
  let t236 = @term_syntax.parse_term("(g : (A) -> A)")
  let t237 = @term_syntax.parse_term("(f : (A) -> A)")
  let t238 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t239 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t238, t237, t236]),
      @permutations.restrict_compose(),
    ),
  )
  let t235 = @term_syntax.parse_term("(g : (A) -> A)")
  let t241 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          @tactics.x_gen_tac,
          @list.List([@term_syntax.parse_term("(f : (A) -> A)"), t235]),
        ),
        @tactics.strip_tac,
      ),
      t239,
    ),
    t240,
  )
  let t234 = @simp.asm_simp_tac(@list.List([]))
  let t231 = @term_syntax.parse_term("(f : (A) -> A)")
  let t232 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t233 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t232, t231]),
      @permutations.restrict_inverse(),
    ),
  )
  let t242 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> A)")),
        @tactics.disch_tac,
      ),
      t233,
    ),
    t234,
  )
  let t243 = @simp.rewrite_tac(@list.List([@permutations.restrict_i()]))
  let t230 = @simp.asm_simp_tac(@list.List([]))
  let t227 = @term_syntax.parse_term("(f : (A) -> A)")
  let t228 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t229 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t228, t227]),
      @permutations.restrict_permutes_subset(),
    ),
  )
  let t226 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> A)"))
  let t244 = @list.List([
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
            t226,
          ),
          @tactics.disch_tac,
        ),
        t229,
      ),
      t230,
    ),
    t243,
    t242,
    t241,
  ])
  let t225 = @tactics.repeat_tac(@tactics.conj_tac)
  let t224 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t223 = @simp.rewrite_tac(
    @list.List([@grouptheory.subgroup_generated_v1(), symmetric_group_v1()]),
  )
  let t222 = @simp.asm_rewrite_tac(@list.List([]))
  let t221 = @simp.rewrite_tac(@list.List([@grouptheory.group_homomorphism()]))
  let t219 = @meson.asm_meson_tac(@list.List([]))
  let t218 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @grouptheory.subgroup_of(),
        symmetric_group_v1(),
        @sets.subset(),
        @sets.in_elim_thm(),
      ]),
    ),
  )
  let t220 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        t218,
      ),
      t219,
    ),
    @tactics.all_tac,
  ])
  let t217 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ f : (A) -> A, IN(f, (h : ((A) -> A) -> Bool)) → permutes(f, (s : (A) -> Bool))"),
    fn(
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
      let s215 = @tactics.assume_tac(x214)
      fn(
        x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s215(x216)
      }
    },
  )
  let t213 = @list.List([
    @simp.asm_simp_tac(
      @list.List([@grouptheory.carrier_subgroup_generated_subgroup()]),
    ),
    @tactics.all_tac,
  ])
  let t212 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_carrier(subgroup_generated(symmetric_group((s : (A) -> Bool)), (h : ((A) -> A) -> Bool))) == h"),
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
      let s210 = @tactics.assume_tac(x209)
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
  let t245 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t212,
                    ),
                    t213,
                  ),
                  t217,
                ),
                t220,
              ),
              t221,
            ),
            t222,
          ),
          t223,
        ),
        t224,
      ),
      t225,
    ),
    t244,
  )
  restrict_symmetric_group_homomorphism_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ h : ((A) -> A) -> Bool, FINITE(t) && SUBSET(t, s) && subgroup_of(h, symmetric_group(s)) && (∀ f : (A) -> A, IN(f, h) → IMAGE(f, t) == t) → group_homomorphism((subgroup_generated(symmetric_group(s), h), symmetric_group(t)), (f : (A) -> A) => (x : A) => if IN(x, t) { f(x) } else { x })"),
      t245,
    ),
  )
}

///|
let restrict_symmetric_group_homomorphism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RESTRICT_SYMMETRIC_GROUP_HOMOMORPHISM",
)

///|
/// `RESTRICT_SYMMETRIC_GROUP_HOMOMORPHISM`
pub fn restrict_symmetric_group_homomorphism() -> @kernel.Thm {
  restrict_symmetric_group_homomorphism_c.get()
}

///|
/// SUBGROUP_RESTRICT_PERMUTES
fn step_17() -> Unit raise {
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t278 = @tactics.then_tac(
    @tactics.match_mp_tac(@permutations.permutes_compose()),
    t277,
  )
  let t276 = @simp.asm_rewrite_tac(@list.List([]))
  let t275 = @tactics.match_mp_tac(@grouptheory.in_subgroup_mul())
  let t274 = @list.List([
    @simp.rewrite_tac(@list.List([symmetric_group_v1()])),
    @tactics.all_tac,
  ])
  let t273 = @tactics.subgoal_then(
    @term_syntax.parse_term("o((p : (A) -> A), (q : (A) -> A)) == group_mul(symmetric_group((s : (A) -> Bool)), p, q)"),
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
      let s271 = @tactics.subst1_tac(x270)
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
  )
  let t268 = @simp.asm_rewrite_tac(@list.List([]))
  let t267 = @tactics.exists_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t266 = @tactics.match_mp_tac(@permutations.permutes_subset())
  let t269 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
            ),
            @tactics.conj_tac,
          ),
          t266,
        ),
        t267,
      ),
      t268,
    ),
    @tactics.all_tac,
  ])
  let t279 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("IN((p : (A) -> A), group_carrier(symmetric_group((s : (A) -> Bool)))) && IN((q : (A) -> A), group_carrier(symmetric_group(s)))"),
                @tactics.strip_assume_tac,
              ),
              t269,
            ),
            t273,
          ),
          t274,
        ),
        t275,
      ),
      t276,
    ),
    t278,
  ])
  let t265 = @term_syntax.parse_term("(q : (A) -> A)")
  let t280 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          @tactics.x_gen_tac,
          @list.List([@term_syntax.parse_term("(p : (A) -> A)"), t265]),
        ),
        @tactics.strip_tac,
      ),
      @tactics.conj_tac,
    ),
    t279,
  )
  let t262 = @simp.asm_rewrite_tac(@list.List([]))
  let t263 = @tactics.then_tac(
    @tactics.match_mp_tac(@permutations.permutes_inverse()),
    t262,
  )
  let t261 = @meson.asm_meson_tac(@list.List([@grouptheory.in_subgroup_inv()]))
  let t260 = @list.List([
    @simp.rewrite_tac(@list.List([symmetric_group_v1()])),
    @tactics.all_tac,
  ])
  let t259 = @tactics.subgoal_then(
    @term_syntax.parse_term("inverse((p : (A) -> A)) == group_inv(symmetric_group((s : (A) -> Bool)), p)"),
    fn(
      x256 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s257 = @tactics.subst1_tac(x256)
      fn(
        x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s257(x258)
      }
    },
  )
  let t254 = @simp.asm_rewrite_tac(@list.List([]))
  let t253 = @tactics.exists_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t252 = @tactics.match_mp_tac(@permutations.permutes_subset())
  let t255 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
          ),
          t252,
        ),
        t253,
      ),
      t254,
    ),
    @tactics.all_tac,
  ])
  let t264 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("IN((p : (A) -> A), group_carrier(symmetric_group((s : (A) -> Bool))))"),
              fn(
                x249 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s250 = @tactics.assume_tac(x249)
                fn(
                  x251 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s250(x251)
                }
              },
            ),
            t255,
          ),
          t259,
        ),
        t260,
      ),
      t261,
    ),
    t263,
  ])
  let t281 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(p : (A) -> A)")),
        @tactics.strip_tac,
      ),
      @tactics.conj_tac,
    ),
    t264,
  )
  let t282 = @simp.rewrite_tac(@list.List([@permutations.permutes_i()]))
  let t283 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@grouptheory.subgroup_of(), symmetric_group_v1()]),
    ),
    t282,
    t281,
    t280,
  ])
  let t248 = @tactics.repeat_tac(@tactics.conj_tac)
  let t247 = @simp.rewrite_tac(
    @list.List([@sets.in_inter(), @sets.in_elim_thm()]),
  )
  let t246 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.subgroup_of(),
      symmetric_group_v1(),
      @sets.inter_subset(),
    ]),
  )
  let t284 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t246),
        t247,
      ),
      t248,
    ),
    t283,
  )
  subgroup_restrict_permutes_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ h : ((A) -> A) -> Bool, SUBSET(t, s) && subgroup_of(h, symmetric_group(s)) → subgroup_of(INTER(h, group_carrier(symmetric_group(t))), symmetric_group(t))"),
      t284,
    ),
  )
}

///|
let subgroup_restrict_permutes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBGROUP_RESTRICT_PERMUTES",
)

///|
/// `SUBGROUP_RESTRICT_PERMUTES`
pub fn subgroup_restrict_permutes() -> @kernel.Thm {
  subgroup_restrict_permutes_c.get()
}

///|
/// ALL_TRANSPOSITIONS_GENERATE_SYMMETRIC
fn step_18() -> Unit raise {
  let t295 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t294 = @simp.rewrite_tac(@list.List([symmetric_group_v1()]))
  let t291 = @simp.gen_rewrite_rule(
    fn(
      x290 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x290
    },
    @list.List([@grouptheory.subgroup_of()]),
  )
  let t293 = @tactics.first_x_assum(fn(
    x292 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x287 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s288 = @tactics.mp_tac(x287)
      fn(
        x289 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s288(x289)
      }
    })(t291(x292))
  })
  let t286 = @tactics.match_mp_tac(@permutations.permutes_induct_strong())
  let t285 = @simp.rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.subset(), @sets.in_elim_thm()]),
  )
  let t296 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t285),
          t286,
        ),
        t293,
      ),
      t294,
    ),
    t295,
  )
  all_transpositions_generate_symmetric_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ h : ((A) -> A) -> Bool, FINITE(s) && subgroup_of(h, symmetric_group(s)) && (∀ a : A, ∀ b : A, IN(a, s) && IN(b, s) && !(a == b) → IN(swap((a, b)), h)) → SUBSET(group_carrier(symmetric_group(s)), h)"),
      t296,
    ),
  )
}

///|
let all_transpositions_generate_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ALL_TRANSPOSITIONS_GENERATE_SYMMETRIC",
)

///|
/// `ALL_TRANSPOSITIONS_GENERATE_SYMMETRIC`
pub fn all_transpositions_generate_symmetric() -> @kernel.Thm {
  all_transpositions_generate_symmetric_c.get()
}

///|
/// SYMMETRIC_GROUP_POW
fn step_19() -> Unit raise {
  let t297 = @simp.asm_rewrite_tac(
    @list.List([@grouptheory.group_pow(), symmetric_group_v1()]),
  )
  let t298 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        @tactics.gen_tac,
      ),
      @nums.induct_tac,
    ),
    t297,
  )
  symmetric_group_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ sigma : (A) -> A, ∀ n : Num, group_pow(symmetric_group(s), sigma, n) == group_pow(symmetric_group(t), sigma, n)"),
      t298,
    ),
  )
}

///|
let symmetric_group_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_POW",
)

///|
/// `SYMMETRIC_GROUP_POW`
pub fn symmetric_group_pow() -> @kernel.Thm {
  symmetric_group_pow_c.get()
}

///|
/// SYMMETRIC_GROUP_POW_IN
fn step_20() -> Unit raise {
  let t300 = @meson.asm_meson_tac(
    @list.List([@permutations.permutes_in_image()]),
  )
  let t301 = @list.List([@meson.meson_tac(@list.List([])), t300])
  let t299 = @simp.rewrite_tac(
    @list.List([
      @grouptheory.group_pow(),
      symmetric_group_v1(),
      @trivia.i_thm(),
      @trivia.o_thm(),
    ]),
  )
  let t302 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        @nums.induct_tac,
      ),
      t299,
    ),
    t301,
  )
  symmetric_group_pow_in_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ n : Num, ∀ a : A, permutes(sigma, s) && IN(a, s) → IN(group_pow(symmetric_group(s), sigma, n, a), s)"),
      t302,
    ),
  )
}

///|
let symmetric_group_pow_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SYMMETRIC_GROUP_POW_IN",
)

///|
/// `SYMMETRIC_GROUP_POW_IN`
pub fn symmetric_group_pow_in() -> @kernel.Thm {
  symmetric_group_pow_in_c.get()
}

///|
/// PRIME_ORDER_PERM_NO_FIXPOINT
fn step_21() -> Unit raise {
  let t358 = @meson.asm_meson_tac(
    @list.List([
      @prime.prime_0(),
      @prime.prime_1(),
      @int.arith_rule(
        @term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) → !(p <= p - 1)"),
      ),
    ]),
  )
  let t359 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([@prime.divides_fact_prime()])),
    t358,
  )
  let t357 = @simp.asm_simp_tac(
    @list.List([
      card_symmetric_group(),
      @sets.finite_delete(),
      @sets.card_delete(),
    ]),
  )
  let t356 = @simp.asm_rewrite_tac(@list.List([]))
  let t354 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t355 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("symmetric_group(DELETE((s : (A) -> Bool), (a : A)))"), t354]),
      @grouptheory.group_element_order_divides_group_order(),
    ),
  )
  let t353 = @list.List([
    @simp.asm_simp_tac(
      @list.List([finite_symmetric_group(), @sets.finite_delete()]),
    ),
    @tactics.all_tac,
  ])
  let t360 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("FINITE(group_carrier(symmetric_group(DELETE((s : (A) -> Bool), (a : A)))))"),
              fn(
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
                let s351 = @tactics.assume_tac(x350)
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
              },
            ),
            t353,
          ),
          t355,
        ),
        t356,
      ),
      t357,
    ),
    t359,
  ])
  let t361 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("divides(CARD((s : (A) -> Bool)), FACT(CARD(s) - 1))"),
      fn(
        x347 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s348 = @tactics.mp_tac(x347)
        fn(
          x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s348(x349)
        }
      },
    ),
    t360,
  )
  let t346 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t345 = @simp.rewrite_tac(@list.List([symmetric_group_v1()]))
  let t344 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
      @grouptheory.group_element_order_id(),
    ),
  )
  let t343 = @simp.asm_rewrite_tac(@list.List([symmetric_group_v1()]))
  let t342 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t362 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.ispecl(
                  @list.List([
                    @term_syntax.parse_term("symmetric_group(DELETE((s : (A) -> Bool), (a : A)))"),
                    t342,
                  ]),
                  @grouptheory.group_element_order_eq_1(),
                ),
              ),
              t343,
            ),
            @tactics.disch_tac,
          ),
          t344,
        ),
        t345,
      ),
      t346,
    ),
    t361,
  ])
  let t341 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t340 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.prime()])),
    @tactics.all_tac,
  ])
  let t339 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_element_order(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A)) == 1 || group_element_order(symmetric_group(DELETE(s, a)), sigma) == CARD(s)"),
    fn(
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
      let s337 = @tactics.mp_tac(x336)
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
    },
  )
  let t335 = @list.List([
    @simp.asm_simp_tac(
      @list.List([@equal.gsym(@grouptheory.group_pow_eq_id())]),
    ),
    @tactics.all_tac,
  ])
  let t334 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(group_element_order(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A)), CARD(s))"),
    fn(
      x331 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s332 = @tactics.assume_tac(x331)
      fn(
        x333 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s332(x333)
      }
    },
  )
  let t329 = @simp.asm_rewrite_tac(@list.List([symmetric_group_v1()]))
  let t326 = @term_syntax.parse_term("CARD((s : (A) -> Bool))")
  let t327 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t328 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t330 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("DELETE((s : (A) -> Bool), (a : A))"), t328, t327, t326]),
          symmetric_group_pow(),
        ),
      ),
      t329,
    ),
    @tactics.all_tac,
  ])
  let t325 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_pow(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A), CARD(s)) == group_id(symmetric_group(DELETE(s, a)))"),
    fn(
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
      let s323 = @tactics.assume_tac(x322)
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
    },
  )
  let t321 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @grouptheory.group_pow_eq_id(),
        symmetric_group_v1(),
        @sets.in_elim_thm(),
        @prime.divides_refl(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t320 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), CARD(s)) == group_id(symmetric_group(s))"),
    fn(
      x317 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s318 = @tactics.assume_tac(x317)
      fn(
        x319 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s318(x319)
      }
    },
  )
  let t316 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
    ),
    @tactics.all_tac,
  ])
  let t315 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((sigma : (A) -> A), group_carrier(symmetric_group(DELETE((s : (A) -> Bool), (a : A)))))"),
    fn(
      x312 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s313 = @tactics.assume_tac(x312)
      fn(
        x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s313(x314)
      }
    },
  )
  let t310 = @meson.asm_meson_tac(@list.List([]))
  let t309 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_delete()]))
  let t308 = @simp.asm_rewrite_tac(@list.List([]))
  let t307 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t311 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@permutations.permutes_superset()),
            t307,
          ),
          t308,
        ),
        t309,
      ),
      t310,
    ),
    @tactics.all_tac,
  ])
  let t306 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutes((sigma : (A) -> A), DELETE((s : (A) -> Bool), (a : A)))"),
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
  )
  let t363 = @tactics.thenl(
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
                              @tactics.repeat_tac(@tactics.strip_tac),
                              t306,
                            ),
                            t311,
                          ),
                          t315,
                        ),
                        t316,
                      ),
                      t320,
                    ),
                    t321,
                  ),
                  t325,
                ),
                t330,
              ),
              t334,
            ),
            t335,
          ),
          t339,
        ),
        t340,
      ),
      t341,
    ),
    t362,
  )
  prime_order_perm_no_fixpoint_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ a : A, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(a, s) → !(sigma(a) == a)"),
      t363,
    ),
  )
}

///|
let prime_order_perm_no_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_ORDER_PERM_NO_FIXPOINT",
)

///|
/// `PRIME_ORDER_PERM_NO_FIXPOINT`
pub fn prime_order_perm_no_fixpoint() -> @kernel.Thm {
  prime_order_perm_no_fixpoint_c.get()
}

///|
/// PRIME_ORDER_POW_PERM
fn step_22() -> Unit raise {
  let t377 = @simp.rewrite_tac(@list.List([@arith.div_1()]))
  let t376 = @simp.asm_rewrite_tac(@list.List([]))
  let t374 = @term_syntax.parse_term("(d : Num)")
  let t375 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("CARD((s : (A) -> Bool))"), t374]),
      @int.divides_le(),
    ),
  )
  let t373 = @simp.asm_simp_tac(@list.List([@prime.prime_coprime_eq()]))
  let t378 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@equal.gsym(@prime.coprime_gcd())])),
              t373,
            ),
            @tactics.disch_tac,
          ),
          t375,
        ),
        t376,
      ),
      @int.asm_arith_tac,
    ),
    t377,
  ])
  let t372 = @tactics.subgoal_then(
    @term_syntax.parse_term("gcd((CARD((s : (A) -> Bool)), (d : Num))) == 1"),
    fn(
      x369 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s370 = @tactics.subst1_tac(x369)
      fn(
        x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s370(x371)
      }
    },
  )
  let t368 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("0 < (d : Num) → !(d == 0)"))]),
  )
  let t367 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t364 = @term_syntax.parse_term("(d : Num)")
  let t365 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t366 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"), t365, t364]),
      @grouptheory.group_element_order_pow_gen(),
    ),
  )
  let t379 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t366),
          t367,
        ),
        t368,
      ),
      t372,
    ),
    t378,
  )
  prime_order_pow_perm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ d : Num, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && 0 < d && d < CARD(s) → group_element_order(symmetric_group(s), group_pow(symmetric_group(s), sigma, d)) == CARD(s)"),
      t379,
    ),
  )
}

///|
let prime_order_pow_perm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_ORDER_POW_PERM",
)

///|
/// `PRIME_ORDER_POW_PERM`
pub fn prime_order_pow_perm() -> @kernel.Thm {
  prime_order_pow_perm_c.get()
}

///|
/// PRIME_ORDER_PERM_ORBIT
fn step_23() -> Unit raise {
  let t483 = @simp.rewrite_tac(@list.List([@sets.card_numseg_lt()]))
  let t482 = @simp.asm_rewrite_tac(@list.List([]))
  let t479 = @term_syntax.parse_term("(a : A)")
  let t480 = @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (d : Num))")
  let t481 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t480, t479]),
      prime_order_perm_no_fixpoint(),
    ),
  )
  let t477 = @simp.asm_rewrite_tac(@list.List([]))
  let t478 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(prime_order_pow_perm()), t477),
    @tactics.all_tac,
  ])
  let t476 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_element_order(symmetric_group((s : (A) -> Bool)), group_pow(symmetric_group(s), (sigma : (A) -> A), (d : Num))) == CARD(s)"),
    fn(
      x473 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s474 = @tactics.assume_tac(x473)
      fn(
        x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s474(x475)
      }
    },
  )
  let t471 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t469 = @term_syntax.parse_term("(d : Num)")
  let t470 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t472 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
            t470,
            t469,
          ]),
          @grouptheory.group_pow_v1(),
        ),
      ),
      t471,
    ),
    @tactics.all_tac,
  ])
  let t468 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutes(group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (d : Num)), s)"),
    fn(
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
      let s466 = @tactics.assume_tac(x465)
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
    },
  )
  let t460 = @simp.rewrite_tac(@list.List([]))
  let t459 = @tactics.first_x_assum(fn(
    x457 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_4 = x457
    @simp.rewrite_tac(@list.List([@equal.sym(th_4)]))
  })
  let t456 = @tactics.disch_then(fn(
    x453 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_3 = x453
    let t455 = @equal.ap_thm(th_3, @term_syntax.parse_term("(a : A)"))
    @simp.rewrite_tac(
      @list.List([
        @equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_thm()]))(t455)),
      ]),
    )
  })
  let t461 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(
          @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num)) == o(group_pow(symmetric_group(s), sigma, (j : Num)), group_pow(symmetric_group(s), sigma, i - j))"),
        ),
        t456,
      ),
      t459,
    ),
    t460,
  ])
  let t452 = @tactics.disch_then(fn(
    x449 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x449
    let t451 = @term_syntax.parse_term("(a : A)")
    @tactics.mp_tac(
      @bool.eq_imp_rule(
        @bool.specl(
          @list.List([
            @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num) - (j : Num), (a : A))"),
            t451,
          ]),
          th_2,
        ),
      ).0,
    )
  })
  let t447 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t445 = @term_syntax.parse_term("(j : Num)")
  let t446 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t448 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
            t446,
            t445,
          ]),
          @grouptheory.group_pow_v1(),
        ),
      ),
      t447,
    ),
    @tactics.all_tac,
  ])
  let t443 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t444 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num))"),
        t443,
      ]),
      @permutations.permutes_injective(),
    ),
  )
  let t442 = @simp.rewrite_tac(
    @list.List([symmetric_group_v1(), @trivia.o_thm()]),
  )
  let t441 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("!((i : Num) < (j : Num)) && !(i == j) → j + (i - j) == i"),
      ),
    ]),
  )
  let t440 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t436 = @term_syntax.parse_term("(i : Num) - (j : Num)")
  let t437 = @term_syntax.parse_term("(j : Num)")
  let t438 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t439 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
        t438,
        t437,
        t436,
      ]),
      @grouptheory.group_pow_add(),
    ),
  )
  let t462 = @tactics.thenl(
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
                                @tactics.exists_tac(
                                  @term_syntax.parse_term("(i : Num) - (j : Num)"),
                                ),
                                @tactics.conj_tac,
                              ),
                              @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                            ),
                            @tactics.conj_tac,
                          ),
                          @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                        ),
                        t439,
                      ),
                      t440,
                    ),
                    t441,
                  ),
                  t442,
                ),
                @tactics.disch_tac,
              ),
              t444,
            ),
            @tactics.ants_tac,
          ),
          t448,
        ),
        t452,
      ),
      @tactics.ants_tac,
    ),
    t461,
  )
  let t434 = @simp.rewrite_tac(@list.List([]))
  let t433 = @simp.asm_rewrite_tac(@list.List([]))
  let t432 = @tactics.disch_then(fn(
    x429 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x429
    let t431 = @equal.ap_thm(th_1, @term_syntax.parse_term("(a : A)"))
    @simp.rewrite_tac(
      @list.List([
        @equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_thm()]))(t431)),
      ]),
    )
  })
  let t435 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(
          @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num)) == o(group_pow(symmetric_group(s), sigma, (i : Num)), group_pow(symmetric_group(s), sigma, j - i))"),
        ),
        t432,
      ),
      t433,
    ),
    t434,
  ])
  let t428 = @tactics.disch_then(fn(
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
    let th = x425
    let t427 = @term_syntax.parse_term("(a : A)")
    @tactics.mp_tac(
      @bool.eq_imp_rule(
        @bool.specl(
          @list.List([
            @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num) - (i : Num), (a : A))"),
            t427,
          ]),
          th,
        ),
      ).0,
    )
  })
  let t423 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t421 = @term_syntax.parse_term("(i : Num)")
  let t422 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t424 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
            t422,
            t421,
          ]),
          @grouptheory.group_pow_v1(),
        ),
      ),
      t423,
    ),
    @tactics.all_tac,
  ])
  let t419 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t420 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num))"),
        t419,
      ]),
      @permutations.permutes_injective(),
    ),
  )
  let t418 = @simp.rewrite_tac(
    @list.List([symmetric_group_v1(), @trivia.o_thm()]),
  )
  let t417 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(i : Num) < (j : Num) → i + (j - i) == j")),
    ]),
  )
  let t416 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t412 = @term_syntax.parse_term("(j : Num) - (i : Num)")
  let t413 = @term_syntax.parse_term("(i : Num)")
  let t414 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t415 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
        t414,
        t413,
        t412,
      ]),
      @grouptheory.group_pow_add(),
    ),
  )
  let t463 = @list.List([
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
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.exists_tac(
                                    @term_syntax.parse_term("(j : Num) - (i : Num)"),
                                  ),
                                  @tactics.conj_tac,
                                ),
                                @list.List([
                                  @int.asm_arith_tac, @tactics.all_tac,
                                ]),
                              ),
                              @tactics.conj_tac,
                            ),
                            @list.List([@int.asm_arith_tac, @tactics.all_tac]),
                          ),
                          t415,
                        ),
                        t416,
                      ),
                      t417,
                    ),
                    t418,
                  ),
                  @tactics.disch_tac,
                ),
                t420,
              ),
              @tactics.ants_tac,
            ),
            t424,
          ),
          t428,
        ),
        @tactics.ants_tac,
      ),
      t435,
    ),
    t462,
  ])
  let t464 = @list.List([
    @tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(i : Num) < (j : Num)")), t463),
    @tactics.all_tac,
  ])
  let t411 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ d : Num, 0 < d && d < CARD((s : (A) -> Bool)) && group_pow(symmetric_group(s), (sigma : (A) -> A), d, (a : A)) == a"),
    fn(
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
      let s409 = @tactics.mp_tac(x408)
      fn(
        x410 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s409(x410)
      }
    },
  )
  let t407 = @simp.asm_rewrite_tac(@list.List([]))
  let t406 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t404 = @term_syntax.parse_term("(j : Num)")
  let t405 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(i : Num)"), t404]),
  )
  let t403 = @simp.rewrite_tac(
    @list.List([@sets.finite_numseg_lt(), @sets.in_elim_thm()]),
  )
  let t484 = @list.List([
    @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.match_mp_tac(@sets.card_image_inj()),
                                t403,
                              ),
                              t405,
                            ),
                            @tactics.strip_tac,
                          ),
                          t406,
                        ),
                        t407,
                      ),
                      t411,
                    ),
                    t464,
                  ),
                  @tactics.strip_tac,
                ),
                t468,
              ),
              t472,
            ),
            t476,
          ),
          t478,
        ),
        t481,
      ),
      t482,
    ),
    t483,
  ])
  let t402 = @tactics.exists_tac(
    @term_syntax.parse_term("CARD({(k : Num) | k < CARD((s : (A) -> Bool))})"),
  )
  let t401 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t399 = @simp.asm_rewrite_tac(@list.List([]))
  let t398 = @tactics.match_mp_tac(symmetric_group_pow_in())
  let t397 = @simp.asm_rewrite_tac(@list.List([]))
  let t396 = @tactics.repeat_tac(@tactics.strip_tac)
  let t400 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()]),
            ),
            t396,
          ),
          t397,
        ),
        t398,
      ),
      t399,
    ),
    @tactics.all_tac,
  ])
  let t395 = @simp.asm_rewrite_tac(@list.List([]))
  let t394 = @tactics.match_mp_tac(@sets.card_subset_eq())
  let t392 = @meson.meson_tac(@list.List([]))
  let t391 = @simp.asm_rewrite_tac(@list.List([]))
  let t387 = @term_syntax.parse_term("(x : A)")
  let t390 = @tactics.disch_then(fn(
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
    (fn(
      x384 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s385 = @tactics.mp_tac(x384)
      fn(
        x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s385(x386)
      }
    })(((x388 : @kernel.Thm) => @bool.spec(t387, x388))(x389))
  })
  let t393 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @sets.extension(),
              @sets.in_image(),
              @sets.in_elim_thm(),
            ]),
          ),
          t390,
        ),
        t391,
      ),
      t392,
    ),
  ])
  let t383 = @tactics.subgoal_then(
    @term_syntax.parse_term("IMAGE((k : Num) => group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), k, (a : A)), {(k : Num) | k < CARD(s)}) == s"),
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
      let s381 = @tactics.mp_tac(x380)
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
  let t485 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t383,
                    ),
                    t393,
                  ),
                  t394,
                ),
                t395,
              ),
              @tactics.conj_tac,
            ),
            t400,
          ),
          t401,
        ),
        t402,
      ),
      @tactics.conj_tac,
    ),
    t484,
  )
  prime_order_perm_orbit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ a : A, ∀ x : A, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(a, s) && IN(x, s) → (∃ k : Num, k < CARD(s) && group_pow(symmetric_group(s), sigma, k, a) == x)"),
      t485,
    ),
  )
}

///|
let prime_order_perm_orbit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_ORDER_PERM_ORBIT",
)

///|
/// `PRIME_ORDER_PERM_ORBIT`
pub fn prime_order_perm_orbit() -> @kernel.Thm {
  prime_order_perm_orbit_c.get()
}

///|
/// SWAP_CONJUGATE_IN_SUBGROUP
fn step_24() -> Unit raise {
  let t511 = @simp.asm_rewrite_tac(@list.List([]))
  let t510 = @tactics.match_mp_tac(@grouptheory.in_subgroup_pow())
  let t509 = @simp.asm_rewrite_tac(@list.List([]))
  let t508 = @tactics.match_mp_tac(@grouptheory.in_subgroup_conjugation())
  let t506 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t505 = @tactics.disch_then(fn(
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
    let th = x503
    @simp.rewrite_tac(@list.List([@equal.sym(th)]))
  })
  let t502 = @simp.asm_rewrite_tac(@list.List([]))
  let t498 = @term_syntax.parse_term("(b : A)")
  let t499 = @term_syntax.parse_term("(a : A)")
  let t500 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t501 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num))"),
        t500,
        t499,
        t498,
      ]),
      @permutations.swap_conjugate(),
    ),
  )
  let t507 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @grouptheory.group_conjugation(),
                symmetric_group_v1(),
                @trivia.o_assoc(),
              ]),
            ),
            t501,
          ),
          t502,
        ),
        t505,
      ),
      t506,
    ),
    @tactics.all_tac,
  ])
  let t497 = @tactics.subgoal_then(
    @term_syntax.parse_term("swap((group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num), (a : A)), group_pow(symmetric_group(s), sigma, k, (b : A)))) == group_conjugation(symmetric_group(s), group_pow(symmetric_group(s), sigma, k), swap((a, b)))"),
    fn(
      x494 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s495 = @tactics.subst1_tac(x494)
      fn(
        x496 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s495(x496)
      }
    },
  )
  let t492 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t490 = @term_syntax.parse_term("(k : Num)")
  let t491 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t493 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([
            @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
            t491,
            t490,
          ]),
          @grouptheory.group_pow_v1(),
        ),
      ),
      t492,
    ),
    @tactics.all_tac,
  ])
  let t489 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutes(group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num)), s)"),
    fn(
      x486 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s487 = @tactics.assume_tac(x486)
      fn(
        x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s487(x488)
      }
    },
  )
  let t512 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t489),
                t493,
              ),
              t497,
            ),
            t507,
          ),
          t508,
        ),
        t509,
      ),
      t510,
    ),
    t511,
  )
  swap_conjugate_in_subgroup_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ a : A, ∀ b : A, ∀ h : ((A) -> A) -> Bool, ∀ k : Num, FINITE(s) && subgroup_of(h, symmetric_group(s)) && permutes(sigma, s) && IN(sigma, h) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) → IN(swap((group_pow(symmetric_group(s), sigma, k, a), group_pow(symmetric_group(s), sigma, k, b))), h)"),
      t512,
    ),
  )
}

///|
let swap_conjugate_in_subgroup_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_CONJUGATE_IN_SUBGROUP",
)

///|
/// `SWAP_CONJUGATE_IN_SUBGROUP`
pub fn swap_conjugate_in_subgroup() -> @kernel.Thm {
  swap_conjugate_in_subgroup_c.get()
}

///|
/// TRANSPOSITION_PCYCLE_GENERATES
fn step_25() -> Unit raise {
  let t753 = @simp.asm_rewrite_tac(@list.List([]))
  let t752 = @tactics.match_mp_tac(@grouptheory.in_subgroup_mul())
  let t751 = @simp.asm_rewrite_tac(@list.List([]))
  let t750 = @tactics.match_mp_tac(@grouptheory.in_subgroup_mul())
  let t748 = @meson.asm_meson_tac(@list.List([]))
  let t747 = @tactics.match_mp_tac(@permutations.swap_triple())
  let t746 = @tactics.conv_tac(@equal.sym_conv)
  let t749 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([symmetric_group_v1()])),
          t746,
        ),
        t747,
      ),
      t748,
    ),
    @tactics.all_tac,
  ])
  let t745 = @tactics.subgoal_then(
    @term_syntax.parse_term("swap(((a : A), (tau : (A) -> A)((x0 : A)))) == group_mul(symmetric_group((s : (A) -> Bool)), swap((a, x0)), group_mul(symmetric_group(s), swap((x0, tau(x0))), swap((a, x0))))"),
    fn(
      x742 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s743 = @tactics.subst1_tac(x742)
      fn(
        x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s743(x744)
      }
    },
  )
  let t738 = @simp.asm_rewrite_tac(@list.List([]))
  let t739 = @tactics.then_tac(
    @tactics.match_mp_tac(swap_conjugate_in_subgroup()),
    t738,
  )
  let t737 = @simp.asm_rewrite_tac(@list.List([]))
  let t735 = @tactics.disch_then(fn(
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
    let th_3 = x733
    @simp.rewrite_tac(@list.List([th_3]))
  })
  let t732 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
    ),
    @tactics.all_tac,
  ])
  let t730 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t731 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"), t730]),
      @grouptheory.group_pow_1(),
    ),
  )
  let t729 = @simp.rewrite_tac(
    @list.List([symmetric_group_v1(), @trivia.o_thm()]),
  )
  let t728 = @tactics.disch_then(fn(
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
    let th_2 = x726
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t725 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
    ),
    @tactics.all_tac,
  ])
  let t721 = @term_syntax.parse_term("1")
  let t722 = @term_syntax.parse_term("(k : Num)")
  let t723 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t724 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
        t723,
        t722,
        t721,
      ]),
      @grouptheory.group_pow_add(),
    ),
  )
  let t720 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t719 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @grouptheory.group_pow(),
        symmetric_group_v1(),
        @trivia.o_thm(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t736 = @list.List([
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
                        @tactics.thenl(
                          @tactics.subgoal_then(
                            @term_syntax.parse_term("(tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, SUC(k), a)"),
                            fn(
                              x716 : @kernel.Thm,
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
                              let s717 = @tactics.subst1_tac(x716)
                              fn(
                                x718 : (
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
                                s717(x718)
                              }
                            },
                          ),
                          t719,
                        ),
                        t720,
                      ),
                      t724,
                    ),
                    @tactics.ants_tac,
                  ),
                  t725,
                ),
                t728,
              ),
              t729,
            ),
            t731,
          ),
          @tactics.ants_tac,
        ),
        t732,
      ),
      t735,
    ),
    @tactics.all_tac,
  ])
  let t740 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.subgoal_then(
          @term_syntax.parse_term("(tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, k, tau(a))"),
          fn(
            x713 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s714 = @tactics.subst1_tac(x713)
            fn(
              x715 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s714(x715)
            }
          },
        ),
        t736,
      ),
      t737,
    ),
    t739,
  ])
  let t712 = @tactics.subgoal_then(
    @term_syntax.parse_term("(tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, k, (b : A))"),
    fn(
      x709 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s710 = @tactics.subst1_tac(x709)
      fn(
        x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s710(x711)
      }
    },
  )
  let t741 = @list.List([
    @tactics.thenl(@tactics.then_tac(@simp.expand_tac("x0"), t712), t740),
    @tactics.all_tac,
  ])
  let t708 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(swap(((x0 : A), (tau : (A) -> A)(x0))), (h : ((A) -> A) -> Bool))"),
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
  let t703 = @simp.asm_rewrite_tac(@list.List([]))
  let t701 = @term_syntax.parse_term("(x0 : A)")
  let t702 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t704 = @list.List([
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t702, t701]),
          prime_order_perm_no_fixpoint(),
        ),
      ),
      t703,
    ),
    @tactics.all_tac,
  ])
  let t700 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((tau : (A) -> A)((x0 : A)) == x0)"),
    fn(
      x697 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s698 = @tactics.assume_tac(x697)
      fn(
        x699 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s698(x699)
      }
    },
  )
  let t694 = @simp.rewrite_tac(@list.List([]))
  let t692 = @simp.asm_rewrite_tac(@list.List([]))
  let t690 = @term_syntax.parse_term("SUC((k : Num))")
  let t691 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t693 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t691, t690]),
          prime_order_pow_perm(),
        ),
      ),
      t692,
    ),
    @int.asm_arith_tac,
  )
  let t689 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t687 = @term_syntax.parse_term("SUC((k : Num))")
  let t688 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t695 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([
                @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
                t688,
                t687,
              ]),
              @grouptheory.group_pow_v1(),
            ),
          ),
          t689,
        ),
        t693,
      ]),
    ),
    t694,
  ])
  let t686 = @simp.asm_rewrite_tac(@list.List([]))
  let t683 = @term_syntax.parse_term("(a : A)")
  let t684 = @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), SUC((k : Num)))")
  let t685 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t684, t683]),
      prime_order_perm_no_fixpoint(),
    ),
  )
  let t682 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @grouptheory.group_pow(),
        symmetric_group_v1(),
        @trivia.o_thm(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t681 = @tactics.subgoal_then(
    @term_syntax.parse_term("(tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, SUC(k), a)"),
    fn(
      x678 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s679 = @tactics.subst1_tac(x678)
      fn(
        x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s679(x680)
      }
    },
  )
  let t696 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@simp.expand_tac("x0"), t681),
              t682,
            ),
            t685,
          ),
          t686,
        ),
        @tactics.ants_tac,
      ),
      t695,
    ),
    @tactics.all_tac,
  ])
  let t677 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((tau : (A) -> A)((x0 : A)) == (a : A))"),
    fn(
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
      let s675 = @tactics.assume_tac(x674)
      fn(
        x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s675(x676)
      }
    },
  )
  let t671 = @simp.rewrite_tac(@list.List([]))
  let t669 = @simp.asm_rewrite_tac(@list.List([]))
  let t667 = @term_syntax.parse_term("(k : Num)")
  let t668 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t670 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.ispecl(
          @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t668, t667]),
          prime_order_pow_perm(),
        ),
      ),
      t669,
    ),
    @int.asm_arith_tac,
  )
  let t666 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t664 = @term_syntax.parse_term("(k : Num)")
  let t665 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t672 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.ispecl(
              @list.List([
                @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
                t665,
                t664,
              ]),
              @grouptheory.group_pow_v1(),
            ),
          ),
          t666,
        ),
        t670,
      ]),
    ),
    t671,
  ])
  let t663 = @simp.asm_rewrite_tac(@list.List([]))
  let t660 = @term_syntax.parse_term("(a : A)")
  let t661 = @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num))")
  let t662 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t661, t660]),
      prime_order_perm_no_fixpoint(),
    ),
  )
  let t673 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("x0"), t662), t663),
        @tactics.ants_tac,
      ),
      t672,
    ),
    @tactics.all_tac,
  ])
  let t659 = @tactics.subgoal_then(@term_syntax.parse_term("!((x0 : A) == (a : A))"), fn(
    x656 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s657 = @tactics.assume_tac(x656)
    fn(
      x658 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s657(x658)
    }
  })
  let t654 = @simp.asm_rewrite_tac(@list.List([]))
  let t653 = @tactics.match_mp_tac(symmetric_group_pow_in())
  let t655 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("x0"), t653), t654),
    @tactics.all_tac,
  ])
  let t652 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x0 : A), (s : (A) -> Bool))"), fn(
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
  })
  let t648 = @simp.abbrev_tac(
    @term_syntax.parse_term("(x0 : A) == group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num), (a : A))"),
  )
  let t647 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @grouptheory.group_pow(),
        symmetric_group_v1(),
        @trivia.o_thm(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t646 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), SUC((k : Num)), (a : A)) == tau(group_pow(symmetric_group(s), tau, k, a))"),
    fn(
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
      let s644 = @tactics.subst1_tac(x643)
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
    },
  )
  let t642 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(@tactics.match_mp_tac),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t641 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(swap(((a : A), group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num), a))), (h : ((A) -> A) -> Bool))"),
    fn(
      x638 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s639 = @tactics.assume_tac(x638)
      fn(
        x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s639(x640)
      }
    },
  )
  let t637 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        @arith.one(),
        @grouptheory.group_pow(),
        symmetric_group_v1(),
        @trivia.o_thm(),
        @trivia.i_thm(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t636 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t635 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ k : Num, 0 < k && k < CARD((s : (A) -> Bool)) → IN(swap(((a : A), group_pow(symmetric_group(s), (tau : (A) -> A), k, a))), (h : ((A) -> A) -> Bool))"),
    fn(
      x632 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x632
      let t634 = @simp.asm_rewrite_tac(@list.List([]))
      @tactics.then_tac(@tactics.match_mp_tac(th_1), t634)
    },
  )
  let t631 = @tactics.disch_then(fn(
    x629 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x629
    @simp.rewrite_tac(@list.List([@equal.sym(th)]))
  })
  let t628 = @tactics.undisch_tac(
    @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (n : Num), (a : A)) == (c : A)"),
  )
  let t626 = @meson.asm_meson_tac(@list.List([]))
  let t625 = @simp.asm_rewrite_tac(
    @list.List([@grouptheory.group_pow(), symmetric_group_v1(), @trivia.i_thm()]),
  )
  let t624 = @tactics.undisch_tac(
    @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (n : Num), (a : A)) == (c : A)"),
  )
  let t623 = @simp.asm_rewrite_tac(@list.List([@arith.lt_nz()]))
  let t627 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
            t623,
          ),
          t624,
        ),
        t625,
      ),
      t626,
    ),
    @tactics.all_tac,
  ])
  let t622 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (n : Num)"), fn(
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
    let s620 = @tactics.assume_tac(x619)
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  })
  let t618 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t617 = @simp.asm_rewrite_tac(@list.List([]))
  let t613 = @term_syntax.parse_term("(c : A)")
  let t614 = @term_syntax.parse_term("(a : A)")
  let t615 = @term_syntax.parse_term("(tau : (A) -> A)")
  let t616 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t615, t614, t613]),
      prime_order_perm_orbit(),
    ),
  )
  let t612 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t611 = @tactics.subgoal_then(@term_syntax.parse_term("IN(swap(((a : A), (b : A))), (h : ((A) -> A) -> Bool))"), fn(
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
    let s609 = @tactics.assume_tac(x608)
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
  })
  let t606 = @simp.asm_rewrite_tac(@list.List([]))
  let t605 = @tactics.match_mp_tac(@grouptheory.in_subgroup_pow())
  let t607 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("tau"), t605), t606),
    @tactics.all_tac,
  ])
  let t604 = @tactics.subgoal_then(@term_syntax.parse_term("IN((tau : (A) -> A), (h : ((A) -> A) -> Bool))"), fn(
    x601 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s602 = @tactics.assume_tac(x601)
    fn(
      x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s602(x603)
    }
  })
  let t599 = @simp.asm_rewrite_tac(@list.List([]))
  let t600 = @list.List([
    @tactics.then_tac(@simp.expand_tac("tau"), t599),
    @tactics.all_tac,
  ])
  let t598 = @tactics.subgoal_then(@term_syntax.parse_term("(tau : (A) -> A)((a : A)) == (b : A)"), fn(
    x595 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s596 = @tactics.assume_tac(x595)
    fn(
      x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s596(x597)
    }
  })
  let t593 = @simp.asm_rewrite_tac(@list.List([]))
  let t590 = @term_syntax.parse_term("(m : Num)")
  let t591 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t592 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t591, t590]),
      prime_order_pow_perm(),
    ),
  )
  let t594 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("tau"), t592), t593),
    @tactics.all_tac,
  ])
  let t589 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_element_order(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A)) == CARD(s)"),
    fn(
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
      let s587 = @tactics.assume_tac(x586)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    },
  )
  let t584 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm()]),
  )
  let t581 = @term_syntax.parse_term("(m : Num)")
  let t582 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t583 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"), t582, t581]),
      @grouptheory.group_pow_v1(),
    ),
  )
  let t585 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("tau"), t583), t584),
    @tactics.all_tac,
  ])
  let t580 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutes((tau : (A) -> A), (s : (A) -> Bool))"),
    fn(
      x577 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s578 = @tactics.assume_tac(x577)
      fn(
        x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s578(x579)
      }
    },
  )
  let t576 = @simp.abbrev_tac(
    @term_syntax.parse_term("(tau : (A) -> A) == group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (m : Num))"),
  )
  let t574 = @meson.asm_meson_tac(@list.List([]))
  let t573 = @simp.asm_rewrite_tac(
    @list.List([@grouptheory.group_pow(), symmetric_group_v1(), @trivia.i_thm()]),
  )
  let t572 = @tactics.undisch_tac(
    @term_syntax.parse_term("group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (m : Num), (a : A)) == (b : A)"),
  )
  let t571 = @simp.asm_rewrite_tac(@list.List([@arith.lt_nz()]))
  let t575 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0")),
            t571,
          ),
          t572,
        ),
        t573,
      ),
      t574,
    ),
    @tactics.all_tac,
  ])
  let t570 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (m : Num)"), fn(
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
    let s568 = @tactics.assume_tac(x567)
    fn(
      x569 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s568(x569)
    }
  })
  let t566 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t561 = @term_syntax.parse_term("(b : A)")
  let t562 = @term_syntax.parse_term("(a : A)")
  let t563 = @term_syntax.parse_term("(sigma : (A) -> A)")
  let t564 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t563, t562, t561]),
      prime_order_perm_orbit(),
    ),
  )
  let t560 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : A)"))
  let t556 = @meson.asm_meson_tac(@list.List([]))
  let t555 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t554 = @simp.asm_rewrite_tac(@list.List([]))
  let t557 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@grouptheory.in_subgroup_mul()),
          t554,
        ),
        @tactics.conj_tac,
      ),
      t555,
    ),
    t556,
  )
  let t553 = @meson.asm_meson_tac(@list.List([]))
  let t558 = @list.List([
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t553),
    t557,
  ])
  let t552 = @simp.asm_rewrite_tac(@list.List([]))
  let t551 = @tactics.match_mp_tac(@grouptheory.in_subgroup_mul())
  let t549 = @meson.asm_meson_tac(@list.List([]))
  let t548 = @tactics.match_mp_tac(@permutations.swap_triple_alt())
  let t547 = @tactics.conv_tac(@equal.sym_conv)
  let t550 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([symmetric_group_v1()])),
          t547,
        ),
        t548,
      ),
      t549,
    ),
    @tactics.all_tac,
  ])
  let t546 = @tactics.subgoal_then(
    @term_syntax.parse_term("swap(((x' : A), (y' : A))) == group_mul(symmetric_group((s : (A) -> Bool)), swap(((a : A), x')), group_mul(symmetric_group(s), swap((a, y')), swap((a, x'))))"),
    fn(
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
      let s544 = @tactics.subst1_tac(x543)
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
    },
  )
  let t541 = @meson.asm_meson_tac(@list.List([]))
  let t540 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t542 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(@list.List([@permutations.swap_sym()])),
        t540,
      ),
      t541,
    ),
    @tactics.all_tac,
  ])
  let t539 = @class.asm_cases_tac(@term_syntax.parse_term("(y' : A) == (a : A)"))
  let t537 = @meson.asm_meson_tac(@list.List([]))
  let t536 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t538 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t536),
      t537,
    ),
    @tactics.all_tac,
  ])
  let t535 = @class.asm_cases_tac(@term_syntax.parse_term("(x' : A) == (a : A)"))
  let t534 = @term_syntax.parse_term("(y' : A)")
  let t559 = @list.List([
    @tactics.all_tac,
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
                          @tactics.map_every(
                            @tactics.x_gen_tac,
                            @list.List([@term_syntax.parse_term("(x' : A)"), t534]),
                          ),
                          @tactics.strip_tac,
                        ),
                        t535,
                      ),
                      t538,
                    ),
                    t539,
                  ),
                  t542,
                ),
                t546,
              ),
              t550,
            ),
            t551,
          ),
          t552,
        ),
        @tactics.conj_tac,
      ),
      t558,
    ),
  ])
  let t533 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, IN(x, (s : (A) -> Bool)) && !(x == (a : A)) → IN(swap((a, x)), (h : ((A) -> A) -> Bool))"),
    fn(
      x530 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s531 = @tactics.assume_tac(x530)
      fn(
        x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s531(x532)
      }
    },
  )
  let t529 = @simp.asm_rewrite_tac(@list.List([]))
  let t528 = @tactics.match_mp_tac(all_transpositions_generate_symmetric())
  let t526 = @simp.asm_rewrite_tac(@list.List([]))
  let t525 = @tactics.disch_then(@tactics.match_mp_tac)
  let t524 = @simp.asm_rewrite_tac(
    @list.List([symmetric_group_v1(), @sets.in_elim_thm(), @sets.subset()]),
  )
  let t520 = @term_syntax.parse_term("(h : ((A) -> A) -> Bool)")
  let t523 = @tactics.disch_then(fn(
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
    (fn(
      x517 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s518 = @tactics.mp_tac(x517)
      fn(
        x519 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s518(x519)
      }
    })(((x521 : @kernel.Thm) => @bool.spec(t520, x521))(x522))
  })
  let t527 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(
              @bool.ispec(
                @term_syntax.parse_term("symmetric_group((s : (A) -> Bool))"),
                @grouptheory.subgroup_of_imp_subset(),
              ),
            ),
            t523,
          ),
          t524,
        ),
        t525,
      ),
      t526,
    ),
    @tactics.all_tac,
  ])
  let t516 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutes((sigma : (A) -> A), (s : (A) -> Bool))"),
    fn(
      x513 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s514 = @tactics.assume_tac(x513)
      fn(
        x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s514(x515)
      }
    },
  )
  let t754 = @tactics.then_tac(
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
                                                                                                                  @tactics.thenl(
                                                                                                                    @tactics.then_tac(
                                                                                                                      @tactics.repeat_tac(
                                                                                                                        @tactics.strip_tac,
                                                                                                                      ),
                                                                                                                      t516,
                                                                                                                    ),
                                                                                                                    t527,
                                                                                                                  ),
                                                                                                                  t528,
                                                                                                                ),
                                                                                                                t529,
                                                                                                              ),
                                                                                                              t533,
                                                                                                            ),
                                                                                                            t559,
                                                                                                          ),
                                                                                                          t560,
                                                                                                        ),
                                                                                                        @tactics.strip_tac,
                                                                                                      ),
                                                                                                      t564,
                                                                                                    ),
                                                                                                    t565,
                                                                                                  ),
                                                                                                  t566,
                                                                                                ),
                                                                                                t570,
                                                                                              ),
                                                                                              t575,
                                                                                            ),
                                                                                            t576,
                                                                                          ),
                                                                                          t580,
                                                                                        ),
                                                                                        t585,
                                                                                      ),
                                                                                      t589,
                                                                                    ),
                                                                                    t594,
                                                                                  ),
                                                                                  t598,
                                                                                ),
                                                                                t600,
                                                                              ),
                                                                              t604,
                                                                            ),
                                                                            t607,
                                                                          ),
                                                                          t611,
                                                                        ),
                                                                        t612,
                                                                      ),
                                                                      t616,
                                                                    ),
                                                                    t617,
                                                                  ),
                                                                  t618,
                                                                ),
                                                                t622,
                                                              ),
                                                              t627,
                                                            ),
                                                            t628,
                                                          ),
                                                          t631,
                                                        ),
                                                        t635,
                                                      ),
                                                      @nums.induct_tac,
                                                    ),
                                                    @list.List([
                                                      @int.arith_tac, @tactics.all_tac,
                                                    ]),
                                                  ),
                                                  @tactics.strip_tac,
                                                ),
                                                t636,
                                              ),
                                              t637,
                                            ),
                                            t641,
                                          ),
                                          t642,
                                        ),
                                        t646,
                                      ),
                                      t647,
                                    ),
                                    t648,
                                  ),
                                  t652,
                                ),
                                t655,
                              ),
                              t659,
                            ),
                            t673,
                          ),
                          t677,
                        ),
                        t696,
                      ),
                      t700,
                    ),
                    t704,
                  ),
                  t708,
                ),
                t741,
              ),
              t745,
            ),
            t749,
          ),
          t750,
        ),
        t751,
      ),
      t752,
    ),
    t753,
  )
  transposition_pcycle_generates_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ sigma : (A) -> A, ∀ a : A, ∀ b : A, ∀ h : ((A) -> A) -> Bool, FINITE(s) && prime(CARD(s)) && subgroup_of(h, symmetric_group(s)) && IN(sigma, h) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) && !(a == b) → SUBSET(group_carrier(symmetric_group(s)), h)"),
      t754,
    ),
  )
}

///|
let transposition_pcycle_generates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSPOSITION_PCYCLE_GENERATES",
)

///|
/// `TRANSPOSITION_PCYCLE_GENERATES`
pub fn transposition_pcycle_generates() -> @kernel.Thm {
  transposition_pcycle_generates_c.get()
}

///|
/// TRANSITIVE_TRANSPOSITION_GENERATES_SYMMETRIC
fn step_26() -> Unit raise {
  let t840 = @simp.asm_rewrite_tac(@list.List([]))
  let t837 = @term_syntax.parse_term("(b : A)")
  let t838 = @term_syntax.parse_term("(a : A)")
  let t839 = @tactics.map_every(
    fn(
      x834 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s835 = @tactics.exists_tac(x834)
      fn(
        x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s835(x836)
      }
    },
    @list.List([@term_syntax.parse_term("(sigma : (A) -> A)"), t838, t837]),
  )
  let t833 = @tactics.match_mp_tac(transposition_pcycle_generates())
  let t832 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t831 = @tactics.subgoal_then(@term_syntax.parse_term("IN((sigma : (A) -> A), (h : ((A) -> A) -> Bool))"), fn(
    x828 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s829 = @tactics.assume_tac(x828)
    fn(
      x830 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s829(x830)
    }
  })
  let t826 = @simp.rewrite_tac(
    @list.List([@grouptheory.group_element_order_subgroup_generated()]),
  )
  let t825 = @simp.expand_tac("H")
  let t827 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(
          @term_syntax.parse_term("group_element_order((H : Group[(A) -> A]), (sigma : (A) -> A)) == CARD((s : (A) -> Bool))"),
        ),
        t825,
      ),
      t826,
    ),
    @tactics.all_tac,
  ])
  let t824 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_element_order(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A)) == CARD(s)"),
    fn(
      x821 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s822 = @tactics.assume_tac(x821)
      fn(
        x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s822(x823)
      }
    },
  )
  let t820 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(sigma : (A) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t819 = @simp.asm_rewrite_tac(@list.List([]))
  let t818 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t816 = @term_syntax.parse_term("CARD((s : (A) -> Bool))")
  let t817 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(H : Group[(A) -> A])"), t816]),
      @grouptheory.cauchy_group_theorem(),
    ),
  )
  let t814 = @meson.asm_meson_tac(@list.List([@arith.mult_sym()]))
  let t813 = @tactics.exists_tac(
    @term_syntax.parse_term("CARD(group_stabilizer((H : Group[(A) -> A]), (f : (A) -> A) => (x : A) => f(x), (a : A)))"),
  )
  let t812 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t811 = @simp.asm_rewrite_tac(@list.List([]))
  let t808 = @term_syntax.parse_term("(a : A)")
  let t809 = @term_syntax.parse_term("(f : (A) -> A) => (x : A) => f(x)")
  let t810 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t815 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.ispecl(
                  @list.List([
                    @term_syntax.parse_term("(H : Group[(A) -> A])"),
                    t810,
                    t809,
                    t808,
                  ]),
                  @grouptheory.orbit_stabilizer_mul(),
                ),
              ),
              t811,
            ),
            @tactics.disch_tac,
          ),
          t812,
        ),
        t813,
      ),
      t814,
    ),
    @tactics.all_tac,
  ])
  let t807 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides(CARD((s : (A) -> Bool)), CARD((h : ((A) -> A) -> Bool)))"),
    fn(
      x804 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s805 = @tactics.assume_tac(x804)
      fn(
        x806 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s805(x806)
      }
    },
  )
  let t800 = @simp.asm_rewrite_tac(@list.List([]))
  let t799 = @tactics.exists_tac(@term_syntax.parse_term("(sigma : (A) -> A)"))
  let t798 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(sigma : (A) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t797 = @simp.asm_rewrite_tac(@list.List([]))
  let t792 = @term_syntax.parse_term("(y : A)")
  let t793 = @list.List([@term_syntax.parse_term("(a : A)"), t792])
  let t796 = @tactics.first_x_assum(fn(
    x795 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x789 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s790 = @tactics.mp_tac(x789)
      fn(
        x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s790(x791)
      }
    })(((x794 : @kernel.Thm) => @bool.specl(t793, x794))(x795))
  })
  let t788 = @simp.asm_rewrite_tac(@list.List([]))
  let t787 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t801 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@sets.subset(), @grouptheory.in_group_orbit()]),
                  ),
                  t787,
                ),
                @tactics.disch_tac,
              ),
              t788,
            ),
            t796,
          ),
          t797,
        ),
        t798,
      ),
      t799,
    ),
    t800,
  )
  let t802 = @list.List([
    @simp.rewrite_tac(@list.List([@grouptheory.group_orbit_subset()])),
    t801,
  ])
  let t803 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])),
        @tactics.conj_tac,
      ),
      t802,
    ),
    @tactics.all_tac,
  ])
  let t786 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_orbit((H : Group[(A) -> A]), (s : (A) -> Bool), (f : (A) -> A) => (x : A) => f(x), (a : A)) == s"),
    fn(
      x783 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s784 = @tactics.assume_tac(x783)
      fn(
        x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s784(x785)
      }
    },
  )
  let t781 = @simp.rewrite_tac(@list.List([symmetric_group_action()]))
  let t780 = @tactics.match_mp_tac(@grouptheory.group_action_from_subgroup())
  let t782 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("H"), t780), t781),
    @tactics.all_tac,
  ])
  let t779 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_action((H : Group[(A) -> A]), (s : (A) -> Bool), (f : (A) -> A) => (x : A) => f(x))"),
    fn(
      x776 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s777 = @tactics.assume_tac(x776)
      fn(
        x778 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s777(x778)
      }
    },
  )
  let t775 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t774 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE(group_carrier((H : Group[(A) -> A])))"),
    fn(
      x771 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s772 = @tactics.assume_tac(x771)
      fn(
        x773 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s772(x773)
      }
    },
  )
  let t769 = @simp.asm_rewrite_tac(@list.List([]))
  let t768 = @tactics.match_mp_tac(
    @grouptheory.carrier_subgroup_generated_subgroup(),
  )
  let t770 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("H"), t768), t769),
    @tactics.all_tac,
  ])
  let t767 = @tactics.subgoal_then(
    @term_syntax.parse_term("group_carrier((H : Group[(A) -> A])) == (h : ((A) -> A) -> Bool)"),
    fn(
      x764 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s765 = @tactics.assume_tac(x764)
      fn(
        x766 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s765(x766)
      }
    },
  )
  let t763 = @simp.abbrev_tac(
    @term_syntax.parse_term("(H : Group[(A) -> A]) == subgroup_generated(symmetric_group((s : (A) -> Bool)), (h : ((A) -> A) -> Bool))"),
  )
  let t761 = @meson.asm_meson_tac(
    @list.List([@grouptheory.subgroup_of_imp_subset()]),
  )
  let t760 = @simp.asm_simp_tac(@list.List([finite_symmetric_group()]))
  let t759 = @tactics.exists_tac(
    @term_syntax.parse_term("group_carrier(symmetric_group((s : (A) -> Bool)))"),
  )
  let t762 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t759),
        t760,
      ),
      t761,
    ),
    @tactics.all_tac,
  ])
  let t758 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE((h : ((A) -> A) -> Bool))"),
    fn(
      x755 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s756 = @tactics.assume_tac(x755)
      fn(
        x757 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s756(x757)
      }
    },
  )
  let t841 = @tactics.then_tac(
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
                                                    @tactics.repeat_tac(
                                                      @tactics.strip_tac,
                                                    ),
                                                    t758,
                                                  ),
                                                  t762,
                                                ),
                                                t763,
                                              ),
                                              t767,
                                            ),
                                            t770,
                                          ),
                                          t774,
                                        ),
                                        t775,
                                      ),
                                      t779,
                                    ),
                                    t782,
                                  ),
                                  t786,
                                ),
                                t803,
                              ),
                              t807,
                            ),
                            t815,
                          ),
                          t817,
                        ),
                        @tactics.ants_tac,
                      ),
                      t818,
                    ),
                    t819,
                  ),
                  t820,
                ),
                t824,
              ),
              t827,
            ),
            t831,
          ),
          t832,
        ),
        t833,
      ),
      t839,
    ),
    t840,
  )
  transitive_transposition_generates_symmetric_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, ∀ h : ((A) -> A) -> Bool, FINITE(s) && prime(CARD(s)) && subgroup_of(h, symmetric_group(s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → (∃ sigma : (A) -> A, IN(sigma, h) && sigma(x) == y)) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) && !(a == b) → SUBSET(group_carrier(symmetric_group(s)), h)"),
      t841,
    ),
  )
}

///|
let transitive_transposition_generates_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRANSITIVE_TRANSPOSITION_GENERATES_SYMMETRIC",
)

///|
/// `TRANSITIVE_TRANSPOSITION_GENERATES_SYMMETRIC`
pub fn transitive_transposition_generates_symmetric() -> @kernel.Thm {
  transitive_transposition_generates_symmetric_c.get()
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
}
