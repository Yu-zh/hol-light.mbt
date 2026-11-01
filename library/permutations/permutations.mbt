// Translated from upstream Library/permutations.ml; edit this file directly.

///|
/// Library/permutations.ml:5
fn step_1() -> Unit raise {
  @printer.parse_as_infix("permutes", (12L, "right"))
}

///|
/// permutes
fn step_2() -> Unit raise {
  permutes_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(permutes : ((_) -> _, (_) -> Bool) -> Bool)((p : (_) -> _), (s : (_) -> Bool)) == ((∀ x : _, !IN(x, s) → p(x) == x) && (∀ y : _, existsunique((x : _) => p(x) == y)))"),
    ),
  )
}

///|
let permutes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("permutes")

///|
/// `permutes`
pub fn permutes() -> @kernel.Thm {
  permutes_c.get()
}

///|
/// inverse
fn step_3() -> Unit raise {
  inverse_c.set(
    @pair.new_definition(@term_syntax.parse_term("(inverse : ((_) -> _, _) -> _)((f : (_) -> _)) == ((y : _) => select((x : _) => f(x) == y))")),
  )
}

///|
let inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inverse")

///|
/// `inverse`
pub fn inverse() -> @kernel.Thm {
  inverse_c.get()
}

///|
/// SURJECTIVE_INVERSE
fn step_4() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.surjective_right_inverse(), inverse()])),
    t1,
  )
  surjective_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, (∀ y : _, ∃ x : _, f(x) == y) == (∀ y : _, f(inverse(f, y)) == y)"),
      t2,
    ),
  )
}

///|
let surjective_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SURJECTIVE_INVERSE",
)

///|
/// `SURJECTIVE_INVERSE`
pub fn surjective_inverse() -> @kernel.Thm {
  surjective_inverse_c.get()
}

///|
/// SURJECTIVE_INVERSE_o
fn step_5() -> Unit raise {
  let t3 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @trivia.o_thm(),
      @trivia.i_thm(),
      surjective_inverse(),
    ]),
  )
  surjective_inverse_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, (∀ y : _, ∃ x : _, f(x) == y) == (o(f, inverse(f)) == I)"),
      t3,
    ),
  )
}

///|
let surjective_inverse_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SURJECTIVE_INVERSE_o",
)

///|
/// `SURJECTIVE_INVERSE_o`
pub fn surjective_inverse_o() -> @kernel.Thm {
  surjective_inverse_o_c.get()
}

///|
/// INJECTIVE_INVERSE
fn step_6() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([inverse()]))
  injective_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, (∀ x : _, ∀ x' : _, f(x) == f(x') → x == x') == (∀ x : _, inverse(f, f(x)) == x)"),
      t4,
    ),
  )
}

///|
let injective_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INJECTIVE_INVERSE",
)

///|
/// `INJECTIVE_INVERSE`
pub fn injective_inverse() -> @kernel.Thm {
  injective_inverse_c.get()
}

///|
/// INJECTIVE_INVERSE_o
fn step_7() -> Unit raise {
  let t5 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @trivia.o_thm(),
      @trivia.i_thm(),
      injective_inverse(),
    ]),
  )
  injective_inverse_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, (∀ x : _, ∀ x' : _, f(x) == f(x') → x == x') == (o(inverse(f), f) == I)"),
      t5,
    ),
  )
}

///|
let injective_inverse_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INJECTIVE_INVERSE_o",
)

///|
/// `INJECTIVE_INVERSE_o`
pub fn injective_inverse_o() -> @kernel.Thm {
  injective_inverse_o_c.get()
}

///|
/// INVERSE_UNIQUE_o
fn step_8() -> Unit raise {
  let t6 = @meson.meson_tac(
    @list.List([injective_inverse(), surjective_inverse()]),
  )
  let t7 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
    ),
    t6,
  )
  inverse_unique_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> _, o(f, g) == I && o(g, f) == I → inverse(f) == g"),
      t7,
    ),
  )
}

///|
let inverse_unique_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_UNIQUE_o",
)

///|
/// `INVERSE_UNIQUE_o`
pub fn inverse_unique_o() -> @kernel.Thm {
  inverse_unique_o_c.get()
}

///|
/// INVERSE_I
fn step_9() -> Unit raise {
  let t8 = @simp.rewrite_tac(@list.List([@trivia.i_o_id()]))
  let t9 = @tactics.then_tac(@tactics.match_mp_tac(inverse_unique_o()), t8)
  inverse_i_c.set(@tactics.prove(@term_syntax.parse_term("(inverse : ((_) -> _, _) -> _)((I : (_) -> _)) == (I : (_) -> _)"), t9))
}

///|
let inverse_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_I")

///|
/// `INVERSE_I`
pub fn inverse_i() -> @kernel.Thm {
  inverse_i_c.get()
}

///|
/// INVERSE_UNIQUE_ALT
fn step_10() -> Unit raise {
  let t14 = @meson.asm_meson_tac(@list.List([]))
  let t13 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t12 = @tactics.match_mp_tac(@class.select_unique())
  let t11 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t10 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), inverse()]))
  let t15 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t10),
            t11,
          ),
          t12,
        ),
        t13,
      ),
      @tactics.eq_tac,
    ),
    t14,
  )
  inverse_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> A, ∀ g : (A) -> A, (∀ x : A, f(g(x)) == x) && (∀ x : A, g(f(x)) == x) → inverse(f) == g"),
      t15,
    ),
  )
}

///|
let inverse_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVERSE_UNIQUE_ALT",
)

///|
/// `INVERSE_UNIQUE_ALT`
pub fn inverse_unique_alt() -> @kernel.Thm {
  inverse_unique_alt_c.get()
}

///|
/// swap
fn step_11() -> Unit raise {
  swap_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(swap : ((_, _), _) -> _)(((i : _), (j : _)), (k : _)) == (if k == i { j } else { if k == j { i } else { k } })"),
    ),
  )
}

///|
let swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("swap")

///|
/// `swap`
pub fn swap() -> @kernel.Thm {
  swap_c.get()
}

///|
/// SWAP_REFL
fn step_12() -> Unit raise {
  let t16 = @meson.meson_tac(@list.List([]))
  let t17 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), swap(), @trivia.i_thm()]),
    ),
    t16,
  )
  swap_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : _, swap((a, a)) == I"), t17))
}

///|
let swap_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_REFL")

///|
/// `SWAP_REFL`
pub fn swap_refl() -> @kernel.Thm {
  swap_refl_c.get()
}

///|
/// SWAP_SYM
fn step_13() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([]))
  let t19 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), swap(), @trivia.i_thm()]),
    ),
    t18,
  )
  swap_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : _, ∀ b : _, swap((a, b)) == swap((b, a))"), t19),
  )
}

///|
let swap_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_SYM")

///|
/// `SWAP_SYM`
pub fn swap_sym() -> @kernel.Thm {
  swap_sym_c.get()
}

///|
/// SWAP_IDEMPOTENT
fn step_14() -> Unit raise {
  let t20 = @meson.meson_tac(@list.List([]))
  let t21 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), swap(), @trivia.o_thm(), @trivia.i_thm()]),
    ),
    t20,
  )
  swap_idempotent_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : _, ∀ b : _, o(swap((a, b)), swap((a, b))) == I"), t21),
  )
}

///|
let swap_idempotent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_IDEMPOTENT",
)

///|
/// `SWAP_IDEMPOTENT`
pub fn swap_idempotent() -> @kernel.Thm {
  swap_idempotent_c.get()
}

///|
/// INVERSE_SWAP
fn step_15() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([swap_sym(), swap_idempotent()]))
  let t22 = @tactics.match_mp_tac(inverse_unique_o())
  let t24 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t22),
    t23,
  )
  inverse_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : _, ∀ b : _, inverse(swap((a, b))) == swap((a, b))"),
      t24,
    ),
  )
}

///|
let inverse_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_SWAP")

///|
/// `INVERSE_SWAP`
pub fn inverse_swap() -> @kernel.Thm {
  inverse_swap_c.get()
}

///|
/// SWAP_GALOIS
fn step_16() -> Unit raise {
  let t25 = @meson.meson_tac(@list.List([]))
  let t26 = @tactics.then_tac(@simp.rewrite_tac(@list.List([swap()])), t25)
  swap_galois_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : _, ∀ b : _, ∀ x : _, ∀ y : _, (x == swap((a, b), y)) == (y == swap((a, b), x))"),
      t26,
    ),
  )
}

///|
let swap_galois_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_GALOIS")

///|
/// `SWAP_GALOIS`
pub fn swap_galois() -> @kernel.Thm {
  swap_galois_c.get()
}

///|
/// SWAP_LEFT
fn step_17() -> Unit raise {
  let t27 = @simp.rewrite_tac(@list.List([swap()]))
  swap_left_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, ∀ b : A, swap((a, b), a) == b"), t27),
  )
}

///|
let swap_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_LEFT")

///|
/// `SWAP_LEFT`
pub fn swap_left() -> @kernel.Thm {
  swap_left_c.get()
}

///|
/// SWAP_RIGHT
fn step_18() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([]))
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([swap()])), t28)
  swap_right_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, ∀ b : A, swap((a, b), b) == a"), t29),
  )
}

///|
let swap_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_RIGHT")

///|
/// `SWAP_RIGHT`
pub fn swap_right() -> @kernel.Thm {
  swap_right_c.get()
}

///|
/// SWAP_OTHER
fn step_19() -> Unit raise {
  let t30 = @meson.meson_tac(@list.List([]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([swap()])), t30)
  swap_other_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ x : A, !(x == a) && !(x == b) → swap((a, b), x) == x"),
      t31,
    ),
  )
}

///|
let swap_other_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_OTHER")

///|
/// `SWAP_OTHER`
pub fn swap_other() -> @kernel.Thm {
  swap_other_c.get()
}

///|
/// SWAP_TRIPLE
fn step_20() -> Unit raise {
  let t41 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (c : A)"))
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (b : A)"))
  let t37 = @simp.asm_rewrite_tac(@list.List([]))
  let t36 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (a : A)"))
  let t35 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t34 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), swap()]),
  )
  let t33 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t32 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((b : A) == (a : A)) && !((c : A) == b) && !(c == a)"),
    @tactics.strip_assume_tac,
  )
  let t42 = @tactics.then_tac(
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
                        @tactics.strip_tac,
                      ),
                      t32,
                    ),
                    t33,
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
  )
  swap_triple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == b) && !(b == c) && !(a == c) → o(swap((a, b)), o(swap((b, c)), swap((a, b)))) == swap((a, c))"),
      t42,
    ),
  )
}

///|
let swap_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_TRIPLE")

///|
/// `SWAP_TRIPLE`
pub fn swap_triple() -> @kernel.Thm {
  swap_triple_c.get()
}

///|
/// SWAP_TRIPLE_ALT
fn step_21() -> Unit raise {
  let t52 = @simp.asm_rewrite_tac(@list.List([]))
  let t51 = @class.asm_cases_tac(@term_syntax.parse_term("(z : A) == (y : A)"))
  let t50 = @simp.asm_rewrite_tac(@list.List([]))
  let t49 = @class.asm_cases_tac(@term_syntax.parse_term("(z : A) == (x : A)"))
  let t48 = @simp.asm_rewrite_tac(@list.List([]))
  let t47 = @class.asm_cases_tac(@term_syntax.parse_term("(z : A) == (a : A)"))
  let t46 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : A)"))
  let t45 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), swap()]),
  )
  let t44 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t43 = @tactics.subgoal_then(
    @term_syntax.parse_term("!((x : A) == (a : A)) && !((y : A) == a) && !(y == x)"),
    @tactics.strip_assume_tac,
  )
  let t53 = @tactics.then_tac(
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
                        @tactics.strip_tac,
                      ),
                      t43,
                    ),
                    t44,
                  ),
                  t45,
                ),
                t46,
              ),
              t47,
            ),
            t48,
          ),
          t49,
        ),
        t50,
      ),
      t51,
    ),
    t52,
  )
  swap_triple_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ x : A, ∀ y : A, !(a == x) && !(a == y) && !(x == y) → o(swap((a, x)), o(swap((a, y)), swap((a, x)))) == swap((x, y))"),
      t53,
    ),
  )
}

///|
let swap_triple_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_TRIPLE_ALT",
)

///|
/// `SWAP_TRIPLE_ALT`
pub fn swap_triple_alt() -> @kernel.Thm {
  swap_triple_alt_c.get()
}

///|
/// INVOLUTION_SIZE_2_IS_SWAP
fn step_22() -> Unit raise {
  let t62 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t61 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.in_elim_thm(),
      @sets.in_insert(),
      @sets.not_in_empty(),
      swap(),
    ]),
  )
  let t60 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_exists()),
      @tactics.gen_tac,
    ),
  )
  let t59 = @tactics.first_x_assum(fn(
    x58 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x57 : @kernel.Thm) => @equal.conv_rule(@sets.has_size_conv, x57))(x58))
  })
  let t63 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t59),
        t60,
      ),
      t61,
    ),
    t62,
  )
  involution_size_2_is_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, IN(x, s) → p(p(x)) == x) && HAS_SIZE({(x : A) | IN(x, s) && !(p(x) == x)}, 2) → (∃ a : A, ∃ b : A, IN(a, s) && IN(b, s) && !(a == b) && (∀ x : A, IN(x, s) → p(x) == swap((a, b), x)))"),
      t63,
    ),
  )
}

///|
let involution_size_2_is_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVOLUTION_SIZE_2_IS_SWAP",
)

///|
/// `INVOLUTION_SIZE_2_IS_SWAP`
pub fn involution_size_2_is_swap() -> @kernel.Thm {
  involution_size_2_is_swap_c.get()
}

///|
/// INVOLUTION_MOVES_2_IS_SWAP
fn step_23() -> Unit raise {
  let t66 = @meson.asm_meson_tac(@list.List([]))
  let t65 = @simp.asm_simp_tac(
    @list.List([@sets.has_size(), @sets.finite_restrict()]),
  )
  let t64 = @tactics.match_mp_tac(involution_size_2_is_swap())
  let t67 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t64),
      t65,
    ),
    t66,
  )
  involution_moves_2_is_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, FINITE(s) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, IN(x, s) → p(p(x)) == x) && CARD({(x : A) | IN(x, s) && !(p(x) == x)}) == 2 → (∃ a : A, ∃ b : A, IN(a, s) && IN(b, s) && !(a == b) && (∀ x : A, IN(x, s) → p(x) == swap((a, b), x)))"),
      t67,
    ),
  )
}

///|
let involution_moves_2_is_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INVOLUTION_MOVES_2_IS_SWAP",
)

///|
/// `INVOLUTION_MOVES_2_IS_SWAP`
pub fn involution_moves_2_is_swap() -> @kernel.Thm {
  involution_moves_2_is_swap_c.get()
}

///|
/// PERMUTES_IN_IMAGE
fn step_24() -> Unit raise {
  let t68 = @meson.meson_tac(@list.List([]))
  let t69 = @tactics.then_tac(@simp.rewrite_tac(@list.List([permutes()])), t68)
  permutes_in_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, ∀ x : _, permutes(p, s) → IN(p(x), s) == IN(x, s)"),
      t69,
    ),
  )
}

///|
let permutes_in_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_IN_IMAGE",
)

///|
/// `PERMUTES_IN_IMAGE`
pub fn permutes_in_image() -> @kernel.Thm {
  permutes_in_image_c.get()
}

///|
/// PERMUTES_IMAGE
fn step_25() -> Unit raise {
  let t70 = @meson.meson_tac(@list.List([]))
  let t71 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([permutes(), @sets.extension(), @sets.in_image()]),
    ),
    t70,
  )
  permutes_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → IMAGE(p, s) == s"),
      t71,
    ),
  )
}

///|
let permutes_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_IMAGE")

///|
/// `PERMUTES_IMAGE`
pub fn permutes_image() -> @kernel.Thm {
  permutes_image_c.get()
}

///|
/// PERMUTES_INJECTIVE
fn step_26() -> Unit raise {
  let t72 = @meson.meson_tac(@list.List([]))
  let t73 = @tactics.then_tac(@simp.rewrite_tac(@list.List([permutes()])), t72)
  permutes_injective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → (∀ x : _, ∀ y : _, (p(x) == p(y)) == (x == y))"),
      t73,
    ),
  )
}

///|
let permutes_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INJECTIVE",
)

///|
/// `PERMUTES_INJECTIVE`
pub fn permutes_injective() -> @kernel.Thm {
  permutes_injective_c.get()
}

///|
/// PERMUTES_SURJECTIVE
fn step_27() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([]))
  let t75 = @tactics.then_tac(@simp.rewrite_tac(@list.List([permutes()])), t74)
  permutes_surjective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → (∀ y : _, ∃ x : _, p(x) == y)"),
      t75,
    ),
  )
}

///|
let permutes_surjective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_SURJECTIVE",
)

///|
/// `PERMUTES_SURJECTIVE`
pub fn permutes_surjective() -> @kernel.Thm {
  permutes_surjective_c.get()
}

///|
/// PERMUTES_INVERSES_o
fn step_28() -> Unit raise {
  let t78 = @meson.meson_tac(@list.List([]))
  let t77 = @simp.rewrite_tac(@list.List([permutes()]))
  let t76 = @equal.gsym(surjective_inverse_o())
  let t79 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(injective_inverse_o()), t76])),
      t77,
    ),
    t78,
  )
  permutes_inverses_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → o(p, inverse(p)) == I && o(inverse(p), p) == I"),
      t79,
    ),
  )
}

///|
let permutes_inverses_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSES_o",
)

///|
/// `PERMUTES_INVERSES_o`
pub fn permutes_inverses_o() -> @kernel.Thm {
  permutes_inverses_o_c.get()
}

///|
/// PERMUTES_INVERSES
fn step_29() -> Unit raise {
  let t86 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t83 = @drule.match_mp(permutes_inverses_o())
  let t85 = @tactics.disch_then(fn(
    x84 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x80 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s81 = @tactics.mp_tac(x80)
      fn(
        x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s81(x82)
      }
    })(t83(x84))
  })
  let t87 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t85),
    t86,
  )
  permutes_inverses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → (∀ x : _, p(inverse(p, x)) == x) && (∀ x : _, inverse(p, p(x)) == x)"),
      t87,
    ),
  )
}

///|
let permutes_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSES",
)

///|
/// `PERMUTES_INVERSES`
pub fn permutes_inverses() -> @kernel.Thm {
  permutes_inverses_c.get()
}

///|
/// PERMUTES_SUBSET
fn step_30() -> Unit raise {
  let t88 = @meson.meson_tac(@list.List([]))
  let t89 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @sets.subset()])),
    t88,
  )
  permutes_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, permutes(p, s) && SUBSET(s, t) → permutes(p, t)"),
      t89,
    ),
  )
}

///|
let permutes_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_SUBSET",
)

///|
/// `PERMUTES_SUBSET`
pub fn permutes_subset() -> @kernel.Thm {
  permutes_subset_c.get()
}

///|
/// PERMUTES_EMPTY
fn step_31() -> Unit raise {
  let t90 = @meson.meson_tac(@list.List([]))
  let t91 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        @trivia.i_thm(),
        permutes(),
        @sets.not_in_empty(),
      ]),
    ),
    t90,
  )
  permutes_empty_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : (_) -> _, permutes(p, {}) == (p == I)"), t91),
  )
}

///|
let permutes_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_EMPTY")

///|
/// `PERMUTES_EMPTY`
pub fn permutes_empty() -> @kernel.Thm {
  permutes_empty_c.get()
}

///|
/// PERMUTES_SING
fn step_32() -> Unit raise {
  let t92 = @meson.meson_tac(@list.List([]))
  let t93 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        @trivia.i_thm(),
        permutes(),
        @sets.in_sing(),
      ]),
    ),
    t92,
  )
  permutes_sing_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : (_) -> _, ∀ a : _, permutes(p, {a}) == (p == I)"), t93),
  )
}

///|
let permutes_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_SING")

///|
/// `PERMUTES_SING`
pub fn permutes_sing() -> @kernel.Thm {
  permutes_sing_c.get()
}

///|
/// PERMUTES_UNIV
fn step_33() -> Unit raise {
  let t94 = @meson.meson_tac(@list.List([]))
  let t95 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @sets.in_univ()])),
    t94,
  )
  permutes_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, permutes(p, UNIV) == (∀ y : A, existsunique((x : A) => p(x) == y))"),
      t95,
    ),
  )
}

///|
let permutes_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_UNIV")

///|
/// `PERMUTES_UNIV`
pub fn permutes_univ() -> @kernel.Thm {
  permutes_univ_c.get()
}

///|
/// PERMUTES_INVERSE_EQ
fn step_34() -> Unit raise {
  let t96 = @meson.meson_tac(@list.List([]))
  let t97 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), inverse()])),
    t96,
  )
  permutes_inverse_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → (∀ x : _, ∀ y : _, (inverse(p, y) == x) == (p(x) == y))"),
      t97,
    ),
  )
}

///|
let permutes_inverse_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSE_EQ",
)

///|
/// `PERMUTES_INVERSE_EQ`
pub fn permutes_inverse_eq() -> @kernel.Thm {
  permutes_inverse_eq_c.get()
}

///|
/// PERMUTES_SWAP
fn step_35() -> Unit raise {
  let t98 = @meson.meson_tac(@list.List([]))
  let t99 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), swap()])),
    t98,
  )
  permutes_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : _, ∀ b : _, ∀ s : (_) -> Bool, IN(a, s) && IN(b, s) → permutes(swap((a, b)), s)"),
      t99,
    ),
  )
}

///|
let permutes_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_SWAP")

///|
/// `PERMUTES_SWAP`
pub fn permutes_swap() -> @kernel.Thm {
  permutes_swap_c.get()
}

///|
/// PERMUTES_SUPERSET
fn step_36() -> Unit raise {
  let t100 = @meson.meson_tac(@list.List([]))
  let t101 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @sets.in_diff()])),
    t100,
  )
  permutes_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, permutes(p, s) && (∀ x : _, IN(x, DIFF(s, t)) → p(x) == x) → permutes(p, t)"),
      t101,
    ),
  )
}

///|
let permutes_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_SUPERSET",
)

///|
/// `PERMUTES_SUPERSET`
pub fn permutes_superset() -> @kernel.Thm {
  permutes_superset_c.get()
}

///|
/// PERMUTES_BIJECTIONS
fn step_37() -> Unit raise {
  let t102 = @meson.meson_tac(@list.List([]))
  let t103 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes()])),
    t102,
  )
  permutes_bijections_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, (∀ x : _, IN(x, (s : (_) -> Bool)) → IN(p(x), s)) && (∀ x : _, !IN(x, s) → p(x) == x) && (∀ x : _, IN(x, s) → IN(q(x), s)) && (∀ x : _, !IN(x, s) → q(x) == x) && (∀ x : _, p(q(x)) == x) && (∀ x : _, q(p(x)) == x) → permutes(p, s)"),
      t103,
    ),
  )
}

///|
let permutes_bijections_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_BIJECTIONS",
)

///|
/// `PERMUTES_BIJECTIONS`
pub fn permutes_bijections() -> @kernel.Thm {
  permutes_bijections_c.get()
}

///|
/// PERMUTES_INVERSE_FUNCTION
fn step_38() -> Unit raise {
  let t110 = @meson.asm_meson_tac(@list.List([]))
  let t108 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t109 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("(q : (A) -> A)((x : A))")),
    t108,
  ])
  let t107 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t106 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t105 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t111 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.strip_tac,
              @simp.asm_simp_tac(
                @list.List([permutes(), @sets.subset(), @sets.forall_in_image()]),
              ),
            ),
            t105,
          ),
          t106,
        ),
        t107,
      ),
      t109,
    ),
    t110,
  )
  let t104 = @meson.asm_meson_tac(@list.List([permutes(), permutes_inverses()]))
  let t112 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.exists_tac(@term_syntax.parse_term("inverse((p : (A) -> A))")),
      ),
      t104,
    ),
    t111,
  ])
  let t113 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t112,
  )
  permutes_inverse_function_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, permutes(p, s) == (∃ q : (A) -> A, (∀ x : A, !IN(x, s) → p(x) == x) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, IN(x, s) → p(q(x)) == x && q(p(x)) == x))"),
      t113,
    ),
  )
}

///|
let permutes_inverse_function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSE_FUNCTION",
)

///|
/// `PERMUTES_INVERSE_FUNCTION`
pub fn permutes_inverse_function() -> @kernel.Thm {
  permutes_inverse_function_c.get()
}

///|
/// PERMUTES_ALT
fn step_39() -> Unit raise {
  let t120 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t119 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t118 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((p : (A) -> A), (s : (A) -> Bool))"))
  let t117 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ s : (_) -> Bool, (∀ y : _, !IN(y, s) → (P : (_) -> Bool)(y)) && (∀ y : _, IN(y, s) → P(y)) → (∀ y : _, P(y))"),
    ),
  )
  let t116 = @list.List([@meson.meson_tac(@list.List([])), @tactics.disch_tac])
  let t115 = @simp.simp_tac(@list.List([]))
  let t114 = @simp.rewrite_tac(@list.List([permutes()]))
  let t121 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114),
                @tactics.eq_tac,
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
  )
  permutes_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ s : (A) -> Bool, permutes(p, s) == ((∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, !IN(x, s) → p(x) == x) && (∀ y : A, IN(y, s) → existsunique((x : A) => IN(x, s) && p(x) == y)))"),
      t121,
    ),
  )
}

///|
let permutes_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_ALT")

///|
/// `PERMUTES_ALT`
pub fn permutes_alt() -> @kernel.Thm {
  permutes_alt_c.get()
}

///|
/// PERMUTES_RESTRICT_SET
fn step_40() -> Unit raise {
  let t122 = @sets.set_tac(@list.List([]))
  let t123 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes_alt()])),
    t122,
  )
  permutes_restrict_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ Q : (A) -> Bool, ∀ p : (A) -> A, ∀ s : (A) -> Bool, permutes(p, s) && (∀ x : A, IN(x, s) → Q(p(x)) == Q(x)) → permutes((i : A) => if Q(i) { p(i) } else { i }, {(x : A) | IN(x, s) && Q(x)})"),
      t123,
    ),
  )
}

///|
let permutes_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_RESTRICT_SET",
)

///|
/// `PERMUTES_RESTRICT_SET`
pub fn permutes_restrict_set() -> @kernel.Thm {
  permutes_restrict_set_c.get()
}

///|
/// PERMUTES_RESTRICT
fn step_41() -> Unit raise {
  let t124 = @sets.set_tac(@list.List([]))
  let t125 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes_alt()])),
    t124,
  )
  permutes_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ Q : (A) -> Bool, ∀ p : (A) -> A, ∀ s : (A) -> Bool, permutes(p, s) && (∀ x : A, IN(x, s) → Q(p(x)) == Q(x)) → permutes((i : A) => if Q(i) { p(i) } else { i }, s)"),
      t125,
    ),
  )
}

///|
let permutes_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_RESTRICT",
)

///|
/// `PERMUTES_RESTRICT`
pub fn permutes_restrict() -> @kernel.Thm {
  permutes_restrict_c.get()
}

///|
/// PERMUTES_CARTESIAN_PRODUCT
fn step_42() -> Unit raise {
  let t130 = @meson.meson_tac(@list.List([]))
  let t129 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t128 = @simp.rewrite_tac(@list.List([@class.cond_rator()]))
  let t127 = @simp.rewrite_tac(@list.List([@class.cond_rand()]))
  let t126 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
      @pair.pair_eq(),
      @sets.in_cross(),
    ]),
  )
  let t131 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([permutes(), @theorems.exists_unique_thm()]),
            ),
            t126,
          ),
          t127,
        ),
        t128,
      ),
      t129,
    ),
    t130,
  )
  permutes_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ q : (B) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, permutes(p, s) && permutes(q, t) → permutes(fn { (i, j) => if IN(i, s) && IN(j, t) { (p(i), q(j)) } else { (i, j) } }, CROSS(s, t))"),
      t131,
    ),
  )
}

///|
let permutes_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_CARTESIAN_PRODUCT",
)

///|
/// `PERMUTES_CARTESIAN_PRODUCT`
pub fn permutes_cartesian_product() -> @kernel.Thm {
  permutes_cartesian_product_c.get()
}

///|
/// PERMUTES_TRANSFER_BIJECTIONS
fn step_43() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([]))
  let t133 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @trivia.o_thm()])),
    t132,
  )
  permutes_transfer_bijections_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ f' : (B) -> A, ∀ p : (B) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, (∀ x : A, f'(f(x)) == x) && (∀ y : B, f(f'(y)) == y) && (∀ x : A, IN(x, s) → IN(f(x), t)) && (∀ y : B, IN(y, t) → IN(f'(y), s)) → permutes(o(f', o(p, f)), s) == permutes(p, t)"),
      t133,
    ),
  )
}

///|
let permutes_transfer_bijections_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_TRANSFER_BIJECTIONS",
)

///|
/// `PERMUTES_TRANSFER_BIJECTIONS`
pub fn permutes_transfer_bijections() -> @kernel.Thm {
  permutes_transfer_bijections_c.get()
}

///|
/// PERMUTES_TRANSFER
fn step_44() -> Unit raise {
  let t134 = @sets.set_tac(@list.List([]))
  let t135 = @tactics.then_tac(
    @simp.simp_tac(@list.List([permutes_alt()])),
    t134,
  )
  permutes_transfer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ p : (A) -> A, ∀ q : (B) -> B, ∀ s : (A) -> Bool, permutes(p, s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && (∀ x : A, IN(x, s) → q(f(x)) == f(p(x))) && (∀ y : B, !IN(y, IMAGE(f, s)) → q(y) == y) → permutes(q, IMAGE(f, s))"),
      t135,
    ),
  )
}

///|
let permutes_transfer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_TRANSFER",
)

///|
/// `PERMUTES_TRANSFER`
pub fn permutes_transfer() -> @kernel.Thm {
  permutes_transfer_c.get()
}

///|
/// SWAP_CONJUGATE
fn step_45() -> Unit raise {
  let t167 = @simp.asm_rewrite_tac(@list.List([]))
  let t166 = @simp.asm_simp_tac(@list.List([swap_other()]))
  let t164 = @simp.asm_rewrite_tac(@list.List([]))
  let t161 = @term_syntax.parse_term("(p : (A) -> A)")
  let t165 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conj_tac,
        @tactics.disch_then(fn(
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
            x158 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s159 = @tactics.mp_tac(x158)
            fn(
              x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s159(x160)
            }
          })(((x162 : @kernel.Thm) => @equal.ap_term(t161, x162))(x163))
        }),
      ),
      t164,
    ),
    @tactics.all_tac,
  ])
  let t157 = @tactics.subgoal_then(
    @term_syntax.parse_term("!(inverse((p : (A) -> A), (x : A)) == (a : A)) && !(inverse(p, x) == (b : A))"),
    @tactics.strip_assume_tac,
  )
  let t156 = @list.List([
    @simp.asm_rewrite_tac(@list.List([swap_right()])),
    @tactics.all_tac,
  ])
  let t155 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (p : (A) -> A)((b : A))"))
  let t154 = @list.List([
    @simp.asm_rewrite_tac(@list.List([swap_left()])),
    @tactics.all_tac,
  ])
  let t153 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (p : (A) -> A)((a : A))"))
  let t152 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t151 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm()]),
  )
  let t149 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t150 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("o(inverse((p : (A) -> A)), p) == I")),
      t149,
    ),
    @tactics.all_tac,
  ])
  let t148 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : A, inverse((p : (A) -> A), p(y)) == y"),
    fn(
      x145 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s146 = @tactics.assume_tac(x145)
      fn(
        x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s146(x147)
      }
    },
  )
  let t143 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t144 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("o((p : (A) -> A), inverse(p)) == I")),
      t143,
    ),
    @tactics.all_tac,
  ])
  let t142 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : A, (p : (A) -> A)(inverse(p, y)) == y"),
    fn(
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
      let s140 = @tactics.assume_tac(x139)
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
    },
  )
  let t136 = @drule.match_mp(permutes_inverses_o())
  let t138 = @tactics.first_assum(fn(
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
    @tactics.strip_assume_tac(t136(x137))
  })
  let t168 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.strip_tac),
                                t138,
                              ),
                              t142,
                            ),
                            t144,
                          ),
                          t148,
                        ),
                        t150,
                      ),
                      t151,
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
        t165,
      ),
      t166,
    ),
    t167,
  )
  swap_conjugate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, permutes(p, s) → o(p, o(swap((a, b)), inverse(p))) == swap((p(a), p(b)))"),
      t168,
    ),
  )
}

///|
let swap_conjugate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_CONJUGATE")

///|
/// `SWAP_CONJUGATE`
pub fn swap_conjugate() -> @kernel.Thm {
  swap_conjugate_c.get()
}

///|
/// PERMUTES_ID
fn step_46() -> Unit raise {
  let t169 = @meson.meson_tac(@list.List([]))
  let t170 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes()])),
    t169,
  )
  permutes_id_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, permutes((x : A) => x, s)"), t170),
  )
}

///|
let permutes_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_ID")

///|
/// `PERMUTES_ID`
pub fn permutes_id() -> @kernel.Thm {
  permutes_id_c.get()
}

///|
/// PERMUTES_I
fn step_47() -> Unit raise {
  let t171 = @meson.meson_tac(@list.List([]))
  let t172 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @trivia.i_thm()])),
    t171,
  )
  permutes_i_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, permutes(I, s)"), t172))
}

///|
let permutes_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTES_I")

///|
/// `PERMUTES_I`
pub fn permutes_i() -> @kernel.Thm {
  permutes_i_c.get()
}

///|
/// PERMUTES_COMPOSE
fn step_48() -> Unit raise {
  let t173 = @metis.metis_tac(@list.List([]))
  let t174 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @trivia.o_thm()])),
    t173,
  )
  permutes_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) && permutes(q, s) → permutes(o(q, p), s)"),
      t174,
    ),
  )
}

///|
let permutes_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_COMPOSE",
)

///|
/// `PERMUTES_COMPOSE`
pub fn permutes_compose() -> @kernel.Thm {
  permutes_compose_c.get()
}

///|
/// PERMUTES_INVERSE
fn step_49() -> Unit raise {
  let t186 = @meson.meson_tac(@list.List([]))
  let t185 = @simp.rewrite_tac(@list.List([permutes()]))
  let t184 = @tactics.pop_assum(fn(
    x181 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s182 = @tactics.mp_tac(x181)
    fn(
      x183 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s182(x183)
    }
  })
  let t178 = @drule.match_mp(permutes_inverse_eq())
  let t180 = @tactics.first_assum(fn(
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
    (fn(
      x175 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s176 = @tactics.mp_tac(x175)
      fn(
        x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s176(x177)
      }
    })(t178(x179))
  })
  let t187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t180),
        t184,
      ),
      t185,
    ),
    t186,
  )
  permutes_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → permutes(inverse(p), s)"),
      t187,
    ),
  )
}

///|
let permutes_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSE",
)

///|
/// `PERMUTES_INVERSE`
pub fn permutes_inverse() -> @kernel.Thm {
  permutes_inverse_c.get()
}

///|
/// PERMUTES_INVERSE_INVERSE
fn step_50() -> Unit raise {
  let t188 = @meson.meson_tac(
    @list.List([permutes_inverse_eq(), permutes_inverse()]),
  )
  let t189 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@class.fun_eq_thm()])),
    t188,
  )
  permutes_inverse_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutes(p, (s : (_) -> Bool)) → inverse(inverse(p)) == p"),
      t189,
    ),
  )
}

///|
let permutes_inverse_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVERSE_INVERSE",
)

///|
/// `PERMUTES_INVERSE_INVERSE`
pub fn permutes_inverse_inverse() -> @kernel.Thm {
  permutes_inverse_inverse_c.get()
}

///|
/// PERMUTES_INSERT_LEMMA
fn step_51() -> Unit raise {
  let t192 = @meson.asm_meson_tac(@list.List([]))
  let t193 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@trivia.o_thm(), swap(), @sets.in_insert(), @sets.in_diff()]),
    ),
    t192,
  )
  let t194 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        permutes_swap(),
        permutes_in_image(),
        @sets.in_insert(),
        permutes_compose(),
      ]),
    ),
    t193,
  ])
  let t191 = @tactics.exists_tac(@term_syntax.parse_term("INSERT((a : A), (s : (A) -> Bool))"))
  let t190 = @tactics.match_mp_tac(permutes_superset())
  let t195 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t190),
        t191,
      ),
      @tactics.conj_tac,
    ),
    t194,
  )
  permutes_insert_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ a : A, ∀ s : (A) -> Bool, permutes(p, INSERT(a, s)) → permutes(o(swap((a, p(a))), p), s)"),
      t195,
    ),
  )
}

///|
let permutes_insert_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INSERT_LEMMA",
)

///|
/// `PERMUTES_INSERT_LEMMA`
pub fn permutes_insert_lemma() -> @kernel.Thm {
  permutes_insert_lemma_c.get()
}

///|
/// PERMUTES_INSERT
fn step_52() -> Unit raise {
  let t209 = @meson.asm_meson_tac(
    @list.List([permutes_in_image(), @sets.in_insert()]),
  )
  let t210 = @tactics.then_tac(@tactics.match_mp_tac(permutes_swap()), t209)
  let t211 = @list.List([
    @meson.asm_meson_tac(
      @list.List([permutes_subset(), @sets.subset(), @sets.in_insert()]),
    ),
    t210,
  ])
  let t208 = @tactics.match_mp_tac(permutes_compose())
  let t207 = @simp.asm_rewrite_tac(@list.List([]))
  let t205 = @term_syntax.parse_term("(q : (A) -> A)")
  let t206 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(b : A)"), t205]),
  )
  let t212 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
              t206,
            ),
            @tactics.strip_tac,
          ),
          t207,
        ),
        t208,
      ),
      @tactics.conj_tac,
    ),
    t211,
  )
  let t204 = @meson.asm_meson_tac(
    @list.List([permutes_in_image(), @sets.in_insert()]),
  )
  let t203 = @simp.asm_simp_tac(
    @list.List([
      swap_idempotent(),
      @trivia.o_assoc(),
      @trivia.i_o_id(),
      permutes_insert_lemma(),
    ]),
  )
  let t202 = @term_syntax.parse_term("o(swap(((a : A), (p : (A) -> A)(a))), p)")
  let t213 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @tactics.map_every(
            fn(
              x199 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s200 = @tactics.exists_tac(x199)
              fn(
                x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s200(x201)
              }
            },
            @list.List([@term_syntax.parse_term("(p : (A) -> A)((a : A))"), t202]),
          ),
        ),
        t203,
      ),
      t204,
    ),
    t212,
  ])
  let t198 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t197 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t196 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t214 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @sets.extension(),
                @sets.in_elim_pair_thm(),
                @sets.in_image(),
                @pair.exists_pair_thm(),
              ]),
            ),
            t196,
          ),
          t197,
        ),
        t198,
      ),
      @tactics.eq_tac,
    ),
    t213,
  )
  permutes_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("{(p : (A) -> A) | permutes(p, INSERT((a : A), (s : (A) -> Bool)))} == IMAGE(fn { (b, p) => o(swap((a, b)), p) }, {((b : A), (p : (A) -> A)) | IN(b, INSERT(a, s)) && IN(p, {(p : (A) -> A) | permutes(p, s)})})"),
      t214,
    ),
  )
}

///|
let permutes_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INSERT",
)

///|
/// `PERMUTES_INSERT`
pub fn permutes_insert() -> @kernel.Thm {
  permutes_insert_c.get()
}

///|
/// HAS_SIZE_PERMUTATIONS
fn step_53() -> Unit raise {
  let t266 = @simp.asm_simp_tac(
    @list.List([swap_idempotent(), @trivia.o_assoc(), @trivia.i_o_id()]),
  )
  let t263 = @term_syntax.parse_term("(q : (A) -> A) => o(swap(((a : A), (b : A))), q)")
  let t267 = @tactics.then_tac(
    @tactics.first_x_assum(fn(
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
      })(((x264 : @kernel.Thm) => @equal.ap_term(t263, x264))(x265))
    }),
    t266,
  )
  let t259 = @meson.asm_meson_tac(@list.List([permutes()]))
  let t258 = @tactics.subgoal_then(
    @term_syntax.parse_term("(q : (A) -> A)((a : A)) == a && (r : (A) -> A)(a) == a"),
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
      let t = x256
      @simp.simp_tac(@list.List([t]))
    },
  )
  let t255 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), swap()]))
  let t252 = @term_syntax.parse_term("(a : A)")
  let t268 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
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
            (fn(
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
              let s248 = @tactics.mp_tac(x247)
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
            })(
              (fn(x253 : @kernel.Thm) -> @kernel.Thm raise {
                (fn(
                  x250 : @kernel.Thm,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  fn(x251 : @kernel.Term) -> @kernel.Thm raise {
                    @equal.ap_thm(x250, x251)
                  }
                })(x253)(t252)
              })(x254),
            )
          }),
          t255,
        ),
        t258,
      ),
      t259,
    ),
    t267,
  ])
  let t246 = @tactics.subgoal_then(@term_syntax.parse_term("(c : A) == (b : A)"), fn(
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
    let s244 = @tactics.subst_all_tac(x243)
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
  })
  let t239 = @term_syntax.parse_term("(r : (A) -> A)")
  let t240 = @term_syntax.parse_term("(c : A)")
  let t241 = @term_syntax.parse_term("(q : (A) -> A)")
  let t242 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(b : A)"), t241, t240, t239]),
  )
  let t238 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t237 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
      @sets.in_elim_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t236 = @simp.asm_simp_tac(
    @list.List([
      @sets.has_size_product(),
      @sets.has_size(),
      @sets.finite_insert(),
      @sets.card_clauses(),
    ]),
  )
  let t235 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t234 = @simp.rewrite_tac(@list.List([@arith.fact(), permutes_insert()]))
  let t233 = @tactics.disch_then(fn(
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
    (fn(
      x229 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s230 = @tactics.subst_all_tac(x229)
      fn(
        x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s230(x231)
      }
    })(@equal.sym(x232))
  })
  let t228 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t227 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.has_size())]))
  let t225 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t226 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t225]),
  )
  let t223 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t224 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.disch_then(fn(
          x222 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x219 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s220 = @tactics.subst1_tac(x219)
            fn(
              x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s220(x221)
            }
          })(@equal.sym(x222))
        }),
      ),
      t223,
    ),
    @tactics.all_tac,
  ])
  let t218 = @simp.rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t217 = @simp.simp_tac(
    @list.List([
      @sets.card_clauses(),
      @sets.finite_insert(),
      @sets.finite_empty(),
    ]),
  )
  let t216 = @simp.simp_tac(
    @list.List([
      permutes_empty(),
      @sets.card_clauses(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}")),
    ]),
  )
  let t215 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t269 = @tactics.thenl(
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
                                          @simp.rewrite_tac(
                                            @list.List([
                                              @sets.has_size(),
                                              @theorems.imp_conj(),
                                              @theorems.right_forall_imp_thm(),
                                            ]),
                                          ),
                                          t215,
                                        ),
                                        t216,
                                      ),
                                      t217,
                                    ),
                                    t218,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t224,
                              ),
                              t226,
                            ),
                            t227,
                          ),
                          @tactics.strip_tac,
                        ),
                        t228,
                      ),
                      t233,
                    ),
                    t234,
                  ),
                  t235,
                ),
                t236,
              ),
              t237,
            ),
            t238,
          ),
          t242,
        ),
        @tactics.strip_tac,
      ),
      t246,
    ),
    t268,
  )
  has_size_permutations_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ n : Num, HAS_SIZE(s, n) → HAS_SIZE({(p : (A) -> A) | permutes(p, s)}, FACT(n))"),
      t269,
    ),
  )
}

///|
let has_size_permutations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_PERMUTATIONS",
)

///|
/// `HAS_SIZE_PERMUTATIONS`
pub fn has_size_permutations() -> @kernel.Thm {
  has_size_permutations_c.get()
}

///|
/// FINITE_PERMUTATIONS
fn step_54() -> Unit raise {
  let t270 = @meson.meson_tac(
    @list.List([has_size_permutations(), @sets.has_size()]),
  )
  finite_permutations_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → FINITE({(p : (_) -> _) | permutes(p, s)})"),
      t270,
    ),
  )
}

///|
let finite_permutations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_PERMUTATIONS",
)

///|
/// `FINITE_PERMUTATIONS`
pub fn finite_permutations() -> @kernel.Thm {
  finite_permutations_c.get()
}

///|
/// CARD_PERMUTATIONS
fn step_55() -> Unit raise {
  let t271 = @meson.meson_tac(
    @list.List([@sets.has_size(), has_size_permutations()]),
  )
  card_permutations_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → CARD({(p : (_) -> _) | permutes(p, s)}) == FACT(CARD(s))"),
      t271,
    ),
  )
}

///|
let card_permutations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_PERMUTATIONS",
)

///|
/// `CARD_PERMUTATIONS`
pub fn card_permutations() -> @kernel.Thm {
  card_permutations_c.get()
}

///|
/// PERMUTES_FINITE_INJECTIVE
fn step_56() -> Unit raise {
  let t287 = @meson.asm_meson_tac(@list.List([]))
  let t286 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : A), (s : (A) -> Bool))"))
  let t285 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t284 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.forall_in_image(),
      @theorems.imp_imp(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t281 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      @sets.surjective_iff_injective(),
    ),
  )
  let t278 = @term_syntax.parse_term("(p : (A) -> A)")
  let t283 = @tactics.first_assum(fn(
    x282 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
        x275 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s276 = @tactics.mp_tac(x275)
        fn(
          x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s276(x277)
        }
      })(((x279 : @kernel.Thm) => @bool.spec(t278, x279))(x280))
    })(t281(x282))
  })
  let t274 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t273 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool) == (r : Bool)) → (p && q) == (p && r)"),
    ),
  )
  let t272 = @tactics.repeat_tac(@tactics.strip_tac)
  let t288 = @tactics.then_tac(
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
                          @simp.rewrite_tac(@list.List([permutes()])),
                          t272,
                        ),
                        t273,
                      ),
                      @tactics.disch_tac,
                    ),
                    @tactics.eq_tac,
                  ),
                  t274,
                ),
                @tactics.strip_tac,
              ),
              t283,
            ),
            t284,
          ),
          @tactics.strip_tac,
        ),
        t285,
      ),
      t286,
    ),
    t287,
  )
  permutes_finite_injective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, FINITE(s) → permutes(p, s) == ((∀ x : A, !IN(x, s) → p(x) == x) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y))"),
      t288,
    ),
  )
}

///|
let permutes_finite_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_FINITE_INJECTIVE",
)

///|
/// `PERMUTES_FINITE_INJECTIVE`
pub fn permutes_finite_injective() -> @kernel.Thm {
  permutes_finite_injective_c.get()
}

///|
/// PERMUTES_FINITE_SURJECTIVE
fn step_57() -> Unit raise {
  let t304 = @meson.asm_meson_tac(@list.List([]))
  let t303 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : A), (s : (A) -> Bool))"))
  let t302 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t301 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.forall_in_image(),
      @theorems.imp_imp(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t298 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      @sets.surjective_iff_injective(),
    ),
  )
  let t295 = @term_syntax.parse_term("(p : (A) -> A)")
  let t300 = @tactics.first_assum(fn(
    x299 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
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
        let s293 = @tactics.mp_tac(x292)
        fn(
          x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s293(x294)
        }
      })(((x296 : @kernel.Thm) => @bool.spec(t295, x296))(x297))
    })(t298(x299))
  })
  let t291 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t290 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool) == (r : Bool)) → (p && q) == (p && r)"),
    ),
  )
  let t289 = @tactics.repeat_tac(@tactics.strip_tac)
  let t305 = @tactics.then_tac(
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
                          @simp.rewrite_tac(@list.List([permutes()])),
                          t289,
                        ),
                        t290,
                      ),
                      @tactics.disch_tac,
                    ),
                    @tactics.eq_tac,
                  ),
                  t291,
                ),
                @tactics.strip_tac,
              ),
              t300,
            ),
            t301,
          ),
          @tactics.strip_tac,
        ),
        t302,
      ),
      t303,
    ),
    t304,
  )
  permutes_finite_surjective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, FINITE(s) → permutes(p, s) == ((∀ x : A, !IN(x, s) → p(x) == x) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ y : A, IN(y, s) → (∃ x : A, IN(x, s) && p(x) == y)))"),
      t305,
    ),
  )
}

///|
let permutes_finite_surjective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_FINITE_SURJECTIVE",
)

///|
/// `PERMUTES_FINITE_SURJECTIVE`
pub fn permutes_finite_surjective() -> @kernel.Thm {
  permutes_finite_surjective_c.get()
}

///|
/// RESTRICT_PERMUTES_SUBSET
fn step_58() -> Unit raise {
  let t325 = @meson.asm_meson_tac(@list.List([permutes_injective()]))
  let t324 = @simp.asm_rewrite_tac(@list.List([]))
  let t323 = @simp.rewrite_tac(@list.List([]))
  let t322 = @term_syntax.parse_term("(y : A)")
  let t326 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(x : A)"), t322]),
          ),
          @tactics.strip_tac,
        ),
        t323,
      ),
      t324,
    ),
    t325,
  )
  let t320 = @simp.simp_tac(@list.List([]))
  let t321 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t320])
  let t319 = @tactics.subgoal_then(@term_syntax.parse_term("IN((f : (A) -> A)((x : A)), (t : (A) -> Bool))"), fn(
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
  })
  let t315 = @simp.asm_rewrite_tac(@list.List([]))
  let t314 = @simp.rewrite_tac(@list.List([]))
  let t327 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")),
            @tactics.disch_tac,
          ),
          t314,
        ),
        t315,
      ),
      t319,
    ),
    t321,
  )
  let t313 = @meson.asm_meson_tac(@list.List([]))
  let t312 = @simp.rewrite_tac(@list.List([]))
  let t328 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")),
            @tactics.disch_tac,
          ),
          t312,
        ),
        @class.cond_cases_tac,
      ),
      t313,
    ),
    t327,
    t326,
  ])
  let t311 = @tactics.repeat_tac(@tactics.conj_tac)
  let t310 = @tactics.disch_then(fn(
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
    let th = x308
    @simp.rewrite_tac(@list.List([th]))
  })
  let t307 = @simp.asm_rewrite_tac(@list.List([]))
  let t306 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(t : (A) -> Bool)"), permutes_finite_injective()),
  )
  let t329 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t306),
          t307,
        ),
        t310,
      ),
      t311,
    ),
    t328,
  )
  restrict_permutes_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> A, FINITE(t) && SUBSET(t, s) && permutes(f, s) && IMAGE(f, t) == t → permutes((x : A) => if IN(x, t) { f(x) } else { x }, t)"),
      t329,
    ),
  )
}

///|
let restrict_permutes_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RESTRICT_PERMUTES_SUBSET",
)

///|
/// `RESTRICT_PERMUTES_SUBSET`
pub fn restrict_permutes_subset() -> @kernel.Thm {
  restrict_permutes_subset_c.get()
}

///|
/// RESTRICT_I
fn step_59() -> Unit raise {
  let t330 = @simp.rewrite_tac(@list.List([]))
  let t331 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.i_thm()])),
        ),
        @tactics.gen_tac,
      ),
      @class.cond_cases_tac,
    ),
    t330,
  )
  restrict_i_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : (A) -> Bool, ((x : A) => if IN(x, t) { I(x) } else { x }) == I"),
      t331,
    ),
  )
}

///|
let restrict_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICT_I")

///|
/// `RESTRICT_I`
pub fn restrict_i() -> @kernel.Thm {
  restrict_i_c.get()
}

///|
/// RESTRICT_COMPOSE
fn step_60() -> Unit raise {
  let t341 = @simp.asm_rewrite_tac(@list.List([]))
  let t339 = @simp.asm_simp_tac(@list.List([]))
  let t340 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t339])
  let t338 = @tactics.subgoal_then(@term_syntax.parse_term("IN((g : (A) -> A)((x : A)), (t : (A) -> Bool))"), fn(
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
    let s336 = @tactics.assume_tac(x335)
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
  let t342 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t338),
      t340,
    ),
    t341,
  ])
  let t334 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (t : (A) -> Bool))"))
  let t333 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t332 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm()]),
  )
  let t343 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t332),
        t333,
      ),
      t334,
    ),
    t342,
  )
  restrict_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> A, ∀ g : (A) -> A, SUBSET(t, s) && permutes(f, s) && permutes(g, s) && IMAGE(f, t) == t && IMAGE(g, t) == t → ((x : A) => if IN(x, t) { o(f, g, x) } else { x }) == o((x : A) => if IN(x, t) { f(x) } else { x }, (x : A) => if IN(x, t) { g(x) } else { x })"),
      t343,
    ),
  )
}

///|
let restrict_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RESTRICT_COMPOSE",
)

///|
/// `RESTRICT_COMPOSE`
pub fn restrict_compose() -> @kernel.Thm {
  restrict_compose_c.get()
}

///|
/// RESTRICT_INVERSE
fn step_61() -> Unit raise {
  let t421 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.refl_tac])
  let t420 = @simp.expand_tac("g")
  let t422 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t420),
        @tactics.beta_tac,
      ),
      @class.cond_cases_tac,
    ),
    t421,
  )
  let t419 = @list.List([@tactics.refl_tac, @meson.asm_meson_tac(@list.List([]))])
  let t418 = @simp.expand_tac("g")
  let t417 = @tactics.subgoal_then(
    @term_syntax.parse_term("(g : (A) -> A)(inverse((f : (A) -> A), (y : A))) == f(inverse(f, y))"),
    fn(
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
      let th_2 = x415
      @simp.asm_rewrite_tac(@list.List([th_2]))
    },
  )
  let t414 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t413 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN(inverse((f : (A) -> A), (y : A)), (t : (A) -> Bool))"),
    fn(
      x410 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s411 = @tactics.assume_tac(x410)
      fn(
        x412 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s411(x412)
      }
    },
  )
  let t423 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t413),
                t414,
              ),
              t417,
            ),
            t418,
          ),
          @tactics.beta_tac,
        ),
        @class.cond_cases_tac,
      ),
      t419,
    ),
    t422,
  ])
  let t409 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : A), (t : (A) -> Bool))"))
  let t408 = @tactics.disch_then(fn(
    x406 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x406
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t403 = @drule.match_mp(permutes_inverse_eq())
  let t405 = @tactics.first_assum(fn(
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
    (fn(
      x400 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s401 = @tactics.mp_tac(x400)
      fn(
        x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s401(x402)
      }
    })(t403(x404))
  })
  let t399 = @tactics.match_mp_tac(@theorems.eq_sym())
  let t398 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t397 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t395 = @tactics.disch_then(fn(
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
    let th = x393
    @simp.rewrite_tac(@list.List([th]))
  })
  let t390 = @simp.rewrite_rule(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t392 = @tactics.disch_then(fn(
    x391 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s388 = @tactics.mp_tac(x387)
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
    })(t390(x391))
  })
  let t386 = @tactics.disch_then(fn(
    x385 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s383 = @tactics.mp_tac(x382)
      fn(
        x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s383(x384)
      }
    })(@bool.conjunct1(x385))
  })
  let t381 = @kernel.assume_rule(@term_syntax.parse_term("permutes((f : (A) -> A), (s : (A) -> Bool))"))
  let t396 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.mp_tac(@drule.match_mp(permutes_inverses_o())(t381)),
          ),
          t386,
        ),
        t392,
      ),
      t395,
    ),
    @tactics.all_tac,
  ])
  let t380 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : A, (f : (A) -> A)(inverse(f, y)) == y"),
    fn(
      x377 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s378 = @tactics.assume_tac(x377)
      fn(
        x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s378(x379)
      }
    },
  )
  let t372 = @simp.asm_rewrite_tac(@list.List([]))
  let t371 = @meson.asm_meson_tac(@list.List([]))
  let t368 = @drule.match_mp(permutes_inverse_eq())
  let t370 = @tactics.disch_then(fn(
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
    (fn(
      x365 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s366 = @tactics.mp_tac(x365)
      fn(
        x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s366(x367)
      }
    })(t368(x369))
  })
  let t373 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @kernel.assume_rule(@term_syntax.parse_term("permutes((f : (A) -> A), (s : (A) -> Bool))")),
        ),
        t370,
      ),
      t371,
    ),
    t372,
  ])
  let t364 = @tactics.subgoal_then(
    @term_syntax.parse_term("inverse((f : (A) -> A), (z : A)) == (w : A)"),
    fn(
      x361 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s362 = @tactics.subst1_tac(x361)
      fn(
        x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s362(x363)
      }
    },
  )
  let t360 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(w : A)"))(@tactics.strip_assume_tac),
  )
  let t374 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_image()])), t360),
      t364,
    ),
    t373,
  )
  let t375 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t374])
  let t359 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((z : A), IMAGE((f : (A) -> A), (t : (A) -> Bool)))"),
    fn(
      x356 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s357 = @tactics.mp_tac(x356)
      fn(
        x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s357(x358)
      }
    },
  )
  let t376 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        t359,
      ),
      t375,
    ),
    @tactics.all_tac,
  ])
  let t355 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ z : A, IN(z, (t : (A) -> Bool)) → IN(inverse((f : (A) -> A), z), t)"),
    fn(
      x352 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s353 = @tactics.assume_tac(x352)
      fn(
        x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s353(x354)
      }
    },
  )
  let t350 = @meson.asm_meson_tac(@list.List([]))
  let t349 = @tactics.match_mp_tac(restrict_permutes_subset())
  let t351 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("g"), t349), t350),
    @tactics.all_tac,
  ])
  let t348 = @tactics.subgoal_then(@term_syntax.parse_term("permutes((g : (A) -> A), (t : (A) -> Bool))"), fn(
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
    let s346 = @tactics.assume_tac(x345)
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
  let t344 = @simp.abbrev_tac(
    @term_syntax.parse_term("(g : (A) -> A) == ((x : A) => if IN(x, (t : (A) -> Bool)) { (f : (A) -> A)(x) } else { x })"),
  )
  let t424 = @tactics.thenl(
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
                              @tactics.repeat_tac(@tactics.strip_tac),
                              t344,
                            ),
                            t348,
                          ),
                          t351,
                        ),
                        t355,
                      ),
                      t376,
                    ),
                    t380,
                  ),
                  t396,
                ),
                t397,
              ),
              t398,
            ),
            t399,
          ),
          t405,
        ),
        t408,
      ),
      t409,
    ),
    t423,
  )
  restrict_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> A, FINITE(t) && SUBSET(t, s) && permutes(f, s) && IMAGE(f, t) == t → ((x : A) => if IN(x, t) { inverse(f, x) } else { x }) == inverse((x : A) => if IN(x, t) { f(x) } else { x })"),
      t424,
    ),
  )
}

///|
let restrict_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RESTRICT_INVERSE",
)

///|
/// `RESTRICT_INVERSE`
pub fn restrict_inverse() -> @kernel.Thm {
  restrict_inverse_c.get()
}

///|
/// RESTRICT_SWAP
fn step_62() -> Unit raise {
  let t431 = @meson.asm_meson_tac(@list.List([]))
  let t430 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t429 = @simp.rewrite_tac(@list.List([swap()]))
  let t428 = @simp.asm_rewrite_tac(@list.List([]))
  let t427 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t426 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t425 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t432 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t425),
              t426,
            ),
            t427,
          ),
          t428,
        ),
        t429,
      ),
      t430,
    ),
    t431,
  )
  restrict_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, IN(a, s) && IN(b, s) → ((x : A) => if IN(x, s) { swap((a, b), x) } else { x }) == swap((a, b))"),
      t432,
    ),
  )
}

///|
let restrict_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICT_SWAP")

///|
/// `RESTRICT_SWAP`
pub fn restrict_swap() -> @kernel.Thm {
  restrict_swap_c.get()
}

///|
/// ITERATE_PERMUTE
fn step_63() -> Unit raise {
  let t436 = @meson.asm_meson_tac(@list.List([permutes()]))
  let t433 = @drule.match_mp(@iterate.iterate_bijection())
  let t435 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t433(x434))
  })
  let t437 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t435),
    t436,
  )
  iterate_permute_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ op : (_, _) -> _, monoidal(op) → (∀ f : (_) -> _, ∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → iterate(op, s, f) == iterate(op, s, o(f, p)))"),
      t437,
    ),
  )
}

///|
let iterate_permute_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_PERMUTE",
)

///|
/// `ITERATE_PERMUTE`
pub fn iterate_permute() -> @kernel.Thm {
  iterate_permute_c.get()
}

///|
/// NSUM_PERMUTE
fn step_64() -> Unit raise {
  let t439 = @simp.rewrite_tac(@list.List([@iterate.monoidal_add()]))
  let t438 = @tactics.match_mp_tac(iterate_permute())
  let t440 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.nsum()])), t438),
    t439,
  )
  nsum_permute_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Num, ∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → nsum(s, f) == nsum(s, o(f, p))"),
      t440,
    ),
  )
}

///|
let nsum_permute_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSUM_PERMUTE")

///|
/// `NSUM_PERMUTE`
pub fn nsum_permute() -> @kernel.Thm {
  nsum_permute_c.get()
}

///|
/// NSUM_PERMUTE_NUMSEG
fn step_65() -> Unit raise {
  let t441 = @meson.meson_tac(
    @list.List([nsum_permute(), @iterate.finite_numseg()]),
  )
  nsum_permute_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Num, ∀ p : (Num) -> Num, ∀ m : Num, ∀ n : Num, permutes(p, op_dot_dot(m, n)) → nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(m, n), o(f, p))"),
      t441,
    ),
  )
}

///|
let nsum_permute_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NSUM_PERMUTE_NUMSEG",
)

///|
/// `NSUM_PERMUTE_NUMSEG`
pub fn nsum_permute_numseg() -> @kernel.Thm {
  nsum_permute_numseg_c.get()
}

///|
/// SUM_PERMUTE
fn step_66() -> Unit raise {
  let t443 = @simp.rewrite_tac(@list.List([@iterate.monoidal_real_add()]))
  let t442 = @tactics.match_mp_tac(iterate_permute())
  let t444 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum()])), t442),
    t443,
  )
  sum_permute_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Real, ∀ p : (_) -> _, ∀ s : (_) -> Bool, permutes(p, s) → sum(s, f) == sum(s, o(f, p))"),
      t444,
    ),
  )
}

///|
let sum_permute_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_PERMUTE")

///|
/// `SUM_PERMUTE`
pub fn sum_permute() -> @kernel.Thm {
  sum_permute_c.get()
}

///|
/// SUM_PERMUTE_NUMSEG
fn step_67() -> Unit raise {
  let t445 = @meson.meson_tac(
    @list.List([sum_permute(), @iterate.finite_numseg()]),
  )
  sum_permute_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> Real, ∀ p : (Num) -> Num, ∀ m : Num, ∀ n : Num, permutes(p, op_dot_dot(m, n)) → sum(op_dot_dot(m, n), f) == sum(op_dot_dot(m, n), o(f, p))"),
      t445,
    ),
  )
}

///|
let sum_permute_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PERMUTE_NUMSEG",
)

///|
/// `SUM_PERMUTE_NUMSEG`
pub fn sum_permute_numseg() -> @kernel.Thm {
  sum_permute_numseg_c.get()
}

///|
/// SWAP_COMMON
fn step_68() -> Unit raise {
  let t456 = @meson.asm_meson_tac(@list.List([]))
  let t455 = @simp.asm_rewrite_tac(@list.List([]))
  let t454 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x451 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s452 = @tactics.subst_all_tac(x451)
      fn(
        x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s452(x453)
      }
    }),
  )
  let t448 = @term_syntax.parse_term("(x : A) == (c : A)")
  let t449 = @term_syntax.parse_term("(x : A) == (b : A)")
  let t450 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(x : A) == (a : A)"), t449, t448]),
  )
  let t447 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t446 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), swap(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t457 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t446),
              @tactics.disch_tac,
            ),
            t447,
          ),
          t450,
        ),
        t454,
      ),
      t455,
    ),
    t456,
  )
  swap_common_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == c) && !(b == c) → o(swap((a, b)), swap((a, c))) == o(swap((b, c)), swap((a, b)))"),
      t457,
    ),
  )
}

///|
let swap_common_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_COMMON")

///|
/// `SWAP_COMMON`
pub fn swap_common() -> @kernel.Thm {
  swap_common_c.get()
}

///|
/// SWAP_COMMON'
fn step_69() -> Unit raise {
  let t467 = @simp.rewrite_tac(@list.List([swap_sym()]))
  let t466 = @simp.asm_simp_tac(@list.List([@equal.gsym(swap_common())]))
  let t465 = @simp.gen_rewrite_tac(
    fn(
      x464 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x458 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s459 = @equal.land_conv(x458)
        fn(x460 : @kernel.Term) -> @kernel.Thm raise { s459(x460) }
      })(
        (fn(
          x461 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s462 = @equal.land_conv(x461)
          fn(x463 : @kernel.Term) -> @kernel.Thm raise { s462(x463) }
        })(x464),
      )
    },
    @list.List([swap_sym()]),
  )
  let t468 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t465),
      t466,
    ),
    t467,
  )
  swap_common_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == b) && !(a == c) → o(swap((a, c)), swap((b, c))) == o(swap((b, c)), swap((a, b)))"),
      t468,
    ),
  )
}

///|
let swap_common_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_COMMON'")

///|
/// `SWAP_COMMON'`
pub fn swap_common_p() -> @kernel.Thm {
  swap_common_p_c.get()
}

///|
/// SWAP_INDEPENDENT
fn step_70() -> Unit raise {
  let t479 = @meson.asm_meson_tac(@list.List([]))
  let t478 = @simp.asm_rewrite_tac(@list.List([]))
  let t477 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
      let s475 = @tactics.subst_all_tac(x474)
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
    }),
  )
  let t471 = @term_syntax.parse_term("(x : A) == (c : A)")
  let t472 = @term_syntax.parse_term("(x : A) == (b : A)")
  let t473 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(x : A) == (a : A)"), t472, t471]),
  )
  let t470 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t469 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), swap(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t480 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t469),
              @tactics.disch_tac,
            ),
            t470,
          ),
          t473,
        ),
        t477,
      ),
      t478,
    ),
    t479,
  )
  swap_independent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, !(a == c) && !(a == d) && !(b == c) && !(b == d) → o(swap((a, b)), swap((c, d))) == o(swap((c, d)), swap((a, b)))"),
      t480,
    ),
  )
}

///|
let swap_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_INDEPENDENT",
)

///|
/// `SWAP_INDEPENDENT`
pub fn swap_independent() -> @kernel.Thm {
  swap_independent_c.get()
}

///|
/// three_cycle
fn step_71() -> Unit raise {
  three_cycle_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(three_cycle : (A, A, A, A) -> A)((a : A), (b : A), (c : A)) == ((x : A) => if x == a { b } else { if x == b { c } else { if x == c { a } else { x } } })"),
    ),
  )
}

///|
let three_cycle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("three_cycle")

///|
/// `three_cycle`
pub fn three_cycle() -> @kernel.Thm {
  three_cycle_c.get()
}

///|
/// PERMUTES_THREE_CYCLE
fn step_72() -> Unit raise {
  let t482 = @meson.asm_meson_tac(@list.List([]))
  let t481 = @simp.rewrite_tac(@list.List([permutes(), three_cycle()]))
  let t483 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t481),
    t482,
  )
  permutes_three_cycle_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, ∀ b : A, ∀ c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) → permutes(three_cycle(a, b, c), s)"),
      t483,
    ),
  )
}

///|
let permutes_three_cycle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_THREE_CYCLE",
)

///|
/// `PERMUTES_THREE_CYCLE`
pub fn permutes_three_cycle() -> @kernel.Thm {
  permutes_three_cycle_c.get()
}

///|
/// THREE_CYCLE_COMPOSE_REVERSE
fn step_73() -> Unit raise {
  let t484 = @meson.meson_tac(@list.List([]))
  let t485 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        @trivia.o_thm(),
        @trivia.i_thm(),
        three_cycle(),
      ]),
    ),
    t484,
  )
  three_cycle_compose_reverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == b) && !(b == c) && !(a == c) → o(three_cycle(a, b, c), three_cycle(a, c, b)) == I && o(three_cycle(a, c, b), three_cycle(a, b, c)) == I"),
      t485,
    ),
  )
}

///|
let three_cycle_compose_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_COMPOSE_REVERSE",
)

///|
/// `THREE_CYCLE_COMPOSE_REVERSE`
pub fn three_cycle_compose_reverse() -> @kernel.Thm {
  three_cycle_compose_reverse_c.get()
}

///|
/// THREE_CYCLE_INVERSE
fn step_74() -> Unit raise {
  let t492 = @meson.meson_tac(@list.List([]))
  let t491 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]),
  )
  let t490 = @simp.asm_rewrite_tac(@list.List([]))
  let t487 = @term_syntax.parse_term("(c : A)")
  let t488 = @term_syntax.parse_term("(b : A)")
  let t489 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : A)"), t488, t487]),
      three_cycle_compose_reverse(),
    ),
  )
  let t486 = @tactics.match_mp_tac(inverse_unique_alt())
  let t493 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t486),
          t489,
        ),
        t490,
      ),
      t491,
    ),
    t492,
  )
  three_cycle_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == b) && !(b == c) && !(a == c) → inverse(three_cycle(a, b, c)) == three_cycle(a, c, b)"),
      t493,
    ),
  )
}

///|
let three_cycle_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_INVERSE",
)

///|
/// `THREE_CYCLE_INVERSE`
pub fn three_cycle_inverse() -> @kernel.Thm {
  three_cycle_inverse_c.get()
}

///|
/// THREE_CYCLE_AS_COMMUTATOR
fn step_75() -> Unit raise {
  let t506 = @simp.asm_rewrite_tac(@list.List([]))
  let t505 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t504 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (e : A)"))
  let t503 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t502 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (d : A)"))
  let t501 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t500 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (c : A)"))
  let t499 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t498 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (b : A)"))
  let t497 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t496 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (a : A)"))
  let t495 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t494 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), three_cycle()]),
  )
  let t507 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t494,
                          ),
                          t495,
                        ),
                        t496,
                      ),
                      t497,
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
          t503,
        ),
        t504,
      ),
      t505,
    ),
    t506,
  )
  three_cycle_as_commutator_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, ∀ e : A, !(a == b) && !(a == c) && !(a == d) && !(a == e) && !(b == c) && !(b == d) && !(b == e) && !(c == d) && !(c == e) && !(d == e) → three_cycle(a, b, c) == o(three_cycle(d, c, a), o(three_cycle(c, b, e), o(three_cycle(d, a, c), three_cycle(c, e, b))))"),
      t507,
    ),
  )
}

///|
let three_cycle_as_commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_AS_COMMUTATOR",
)

///|
/// `THREE_CYCLE_AS_COMMUTATOR`
pub fn three_cycle_as_commutator() -> @kernel.Thm {
  three_cycle_as_commutator_c.get()
}

///|
/// THREE_CYCLE_COMMUTATOR
fn step_76() -> Unit raise {
  let t521 = @simp.asm_rewrite_tac(@list.List([]))
  let t520 = @tactics.match_mp_tac(three_cycle_as_commutator())
  let t518 = @meson.asm_meson_tac(@list.List([]))
  let t519 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(three_cycle_inverse()), t518),
    @tactics.all_tac,
  ])
  let t517 = @tactics.subgoal_then(
    @term_syntax.parse_term("inverse(three_cycle((c : A), (e : A), (b : A))) == three_cycle(c, b, e)"),
    fn(
      x514 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s515 = @tactics.subst1_tac(x514)
      fn(
        x516 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s515(x516)
      }
    },
  )
  let t512 = @meson.asm_meson_tac(@list.List([]))
  let t513 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(three_cycle_inverse()), t512),
    @tactics.all_tac,
  ])
  let t511 = @tactics.subgoal_then(
    @term_syntax.parse_term("inverse(three_cycle((d : A), (a : A), (c : A))) == three_cycle(d, c, a)"),
    fn(
      x508 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s509 = @tactics.subst1_tac(x508)
      fn(
        x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s509(x510)
      }
    },
  )
  let t522 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t511),
            t513,
          ),
          t517,
        ),
        t519,
      ),
      t520,
    ),
    t521,
  )
  three_cycle_commutator_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, ∀ e : A, !(a == b) && !(a == c) && !(a == d) && !(a == e) && !(b == c) && !(b == d) && !(b == e) && !(c == d) && !(c == e) && !(d == e) → three_cycle(a, b, c) == o(inverse(three_cycle(d, a, c)), o(inverse(three_cycle(c, e, b)), o(three_cycle(d, a, c), three_cycle(c, e, b))))"),
      t522,
    ),
  )
}

///|
let three_cycle_commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_COMMUTATOR",
)

///|
/// `THREE_CYCLE_COMMUTATOR`
pub fn three_cycle_commutator() -> @kernel.Thm {
  three_cycle_commutator_c.get()
}

///|
/// THREE_CYCLE_NOT_I
fn step_77() -> Unit raise {
  let t523 = @meson.meson_tac(@list.List([]))
  let t524 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), three_cycle(), @trivia.i_thm()]),
    ),
    t523,
  )
  three_cycle_not_i_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, !(a == b) && !(b == c) && !(a == c) → !(three_cycle(a, b, c) == I)"),
      t524,
    ),
  )
}

///|
let three_cycle_not_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "THREE_CYCLE_NOT_I",
)

///|
/// `THREE_CYCLE_NOT_I`
pub fn three_cycle_not_i() -> @kernel.Thm {
  three_cycle_not_i_c.get()
}

///|
let swapseq_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("swapseq_RULES")

///|
/// `swapseq_RULES`
pub fn swapseq_rules() -> @kernel.Thm {
  swapseq_rules_c.get()
}

///|
let swapseq_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("swapseq_INDUCT")

///|
/// `swapseq_INDUCT`
pub fn swapseq_induct() -> @kernel.Thm {
  swapseq_induct_c.get()
}

///|
let swapseq_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("swapseq_CASES")

///|
/// `swapseq_CASES`
pub fn swapseq_cases() -> @kernel.Thm {
  swapseq_cases_c.get()
}

///|
/// swapseq_RULES, swapseq_INDUCT, swapseq_CASES
fn step_78() -> Unit raise {
  let (swapseq_rules, swapseq_induct, swapseq_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(swapseq : (Num, (_) -> _) -> Bool)(0, I) && (∀ a : _, ∀ b : _, ∀ p : (_) -> _, ∀ n : Num, swapseq(n, p) && !(a == b) → swapseq(SUC(n), o(swap((a, b)), p)))"),
  )
  swapseq_rules_c.set(swapseq_rules)
  swapseq_induct_c.set(swapseq_induct)
  swapseq_cases_c.set(swapseq_cases)
}

///|
/// permutation
fn step_79() -> Unit raise {
  permutation_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(permutation : ((_) -> _) -> Bool)((p : (_) -> _)) == (∃ n : Num, swapseq(n, p))"),
    ),
  )
}

///|
let permutation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("permutation")

///|
/// `permutation`
pub fn permutation() -> @kernel.Thm {
  permutation_c.get()
}

///|
/// SWAPSEQ_I
fn step_80() -> Unit raise {
  swapseq_i_c.set(@bool.conjunct1(swapseq_rules()))
}

///|
let swapseq_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAPSEQ_I")

///|
/// `SWAPSEQ_I`
pub fn swapseq_i() -> @kernel.Thm {
  swapseq_i_c.get()
}

///|
/// PERMUTATION_I
fn step_81() -> Unit raise {
  let t525 = @meson.meson_tac(@list.List([swapseq_i()]))
  let t526 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutation()])),
    t525,
  )
  permutation_i_c.set(@tactics.prove(@term_syntax.parse_term("(permutation : ((_) -> _) -> Bool)((I : (_) -> _))"), t526))
}

///|
let permutation_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTATION_I")

///|
/// `PERMUTATION_I`
pub fn permutation_i() -> @kernel.Thm {
  permutation_i_c.get()
}

///|
/// SWAPSEQ_SWAP
fn step_82() -> Unit raise {
  let t528 = @meson.asm_meson_tac(
    @list.List([swapseq_rules(), @trivia.i_o_id(), swapseq_i(), swap_refl()]),
  )
  let t527 = @simp.asm_rewrite_tac(
    @list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))]),
  )
  let t529 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @class.cond_cases_tac,
      ),
      t527,
    ),
    t528,
  )
  swapseq_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : _, ∀ b : _, swapseq(if a == b { 0 } else { 1 }, swap((a, b)))"),
      t529,
    ),
  )
}

///|
let swapseq_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAPSEQ_SWAP")

///|
/// `SWAPSEQ_SWAP`
pub fn swapseq_swap() -> @kernel.Thm {
  swapseq_swap_c.get()
}

///|
/// PERMUTATION_SWAP
fn step_83() -> Unit raise {
  let t530 = @meson.meson_tac(@list.List([swapseq_swap()]))
  let t531 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutation()])),
    t530,
  )
  permutation_swap_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : _, ∀ b : _, permutation(swap((a, b)))"), t531),
  )
}

///|
let permutation_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_SWAP",
)

///|
/// `PERMUTATION_SWAP`
pub fn permutation_swap() -> @kernel.Thm {
  permutation_swap_c.get()
}

///|
/// SWAPSEQ_COMPOSE
fn step_84() -> Unit raise {
  let t534 = @meson.meson_tac(@list.List([swapseq_rules()]))
  let t533 = @simp.rewrite_tac(
    @list.List([
      @arith.add_clauses(),
      @trivia.i_o_id(),
      @equal.gsym(@trivia.o_assoc()),
    ]),
  )
  let t532 = @tactics.match_mp_tac(swapseq_induct())
  let t535 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
        ),
        t532,
      ),
      t533,
    ),
    t534,
  )
  swapseq_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (_) -> _, ∀ m : Num, ∀ q : (_) -> _, swapseq(n, p) && swapseq(m, q) → swapseq(n + m, o(p, q))"),
      t535,
    ),
  )
}

///|
let swapseq_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_COMPOSE",
)

///|
/// `SWAPSEQ_COMPOSE`
pub fn swapseq_compose() -> @kernel.Thm {
  swapseq_compose_c.get()
}

///|
/// PERMUTATION_COMPOSE
fn step_85() -> Unit raise {
  let t536 = @meson.meson_tac(@list.List([swapseq_compose()]))
  let t537 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutation()])),
    t536,
  )
  permutation_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, permutation(p) && permutation(q) → permutation(o(p, q))"),
      t537,
    ),
  )
}

///|
let permutation_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_COMPOSE",
)

///|
/// `PERMUTATION_COMPOSE`
pub fn permutation_compose() -> @kernel.Thm {
  permutation_compose_c.get()
}

///|
/// SWAPSEQ_ENDSWAP
fn step_86() -> Unit raise {
  let t540 = @meson.meson_tac(
    @list.List([@trivia.o_assoc(), swapseq_rules(), @trivia.i_o_id()]),
  )
  let t539 = @simp.rewrite_tac(
    @list.List([@trivia.i_o_id(), @equal.gsym(@trivia.o_assoc())]),
  )
  let t538 = @tactics.match_mp_tac(swapseq_induct())
  let t541 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
        ),
        t538,
      ),
      t539,
    ),
    t540,
  )
  swapseq_endswap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (A) -> A, ∀ a : A, ∀ b : A, swapseq(n, p) && !(a == b) → swapseq(SUC(n), o(p, swap((a, b))))"),
      t541,
    ),
  )
}

///|
let swapseq_endswap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_ENDSWAP",
)

///|
/// `SWAPSEQ_ENDSWAP`
pub fn swapseq_endswap() -> @kernel.Thm {
  swapseq_endswap_c.get()
}

///|
/// SWAPSEQ_INVERSE_EXISTS
fn step_87() -> Unit raise {
  let t563 = @simp.asm_rewrite_tac(
    @list.List([swap_idempotent(), @trivia.i_o_id()]),
  )
  let t562 = @simp.gen_rewrite_tac(
    fn(
      x561 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x557 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x551 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s552 = @equal.binop_conv(x551)
          fn(x553 : @kernel.Term) -> @kernel.Thm raise { s552(x553) }
        })(
          (fn(
            x554 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s555 = @equal.land_conv(x554)
            fn(x556 : @kernel.Term) -> @kernel.Thm raise { s555(x556) }
          })(x557),
        )
      })(
        (fn(
          x558 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s559 = @equal.rand_conv(x558)
          fn(x560 : @kernel.Term) -> @kernel.Thm raise { s559(x560) }
        })(x561),
      )
    },
    @list.List([@trivia.o_assoc()]),
  )
  let t550 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("o((q : (A) -> A), swap(((a : A), (b : A))))"))
  let t548 = @simp.asm_rewrite_tac(@list.List([]))
  let t544 = @term_syntax.parse_term("(b : A)")
  let t545 = @term_syntax.parse_term("(a : A)")
  let t546 = @term_syntax.parse_term("(q : (A) -> A)")
  let t547 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t546, t545, t544]),
      swapseq_endswap(),
    ),
  )
  let t543 = @tactics.repeat_tac(@tactics.strip_tac)
  let t542 = @list.List([
    @meson.meson_tac(@list.List([@trivia.i_o_id(), swapseq_rules()])),
    @tactics.all_tac,
  ])
  let t564 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.match_mp_tac(swapseq_induct()),
                      @tactics.conj_tac,
                    ),
                    t542,
                  ),
                  t543,
                ),
                t547,
              ),
              t548,
            ),
            @tactics.disch_tac,
          ),
          t549,
        ),
        t550,
      ),
      t562,
    ),
    t563,
  )
  swapseq_inverse_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (A) -> A, swapseq(n, p) → (∃ q : (A) -> A, swapseq(n, q) && o(p, q) == I && o(q, p) == I)"),
      t564,
    ),
  )
}

///|
let swapseq_inverse_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_INVERSE_EXISTS",
)

///|
/// `SWAPSEQ_INVERSE_EXISTS`
pub fn swapseq_inverse_exists() -> @kernel.Thm {
  swapseq_inverse_exists_c.get()
}

///|
/// SWAPSEQ_INVERSE
fn step_88() -> Unit raise {
  let t565 = @meson.meson_tac(
    @list.List([swapseq_inverse_exists(), inverse_unique_o()]),
  )
  swapseq_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (_) -> _, swapseq(n, p) → swapseq(n, inverse(p))"),
      t565,
    ),
  )
}

///|
let swapseq_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_INVERSE",
)

///|
/// `SWAPSEQ_INVERSE`
pub fn swapseq_inverse() -> @kernel.Thm {
  swapseq_inverse_c.get()
}

///|
/// PERMUTATION_INVERSE
fn step_89() -> Unit raise {
  let t566 = @meson.meson_tac(@list.List([swapseq_inverse()]))
  let t567 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutation()])),
    t566,
  )
  permutation_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutation(p) → permutation(inverse(p))"),
      t567,
    ),
  )
}

///|
let permutation_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_INVERSE",
)

///|
/// `PERMUTATION_INVERSE`
pub fn permutation_inverse() -> @kernel.Thm {
  permutation_inverse_c.get()
}

///|
/// SYMMETRY_LEMMA
fn step_90() -> Unit raise {
  let t572 = @meson.asm_meson_tac(@list.List([]))
  let t568 = @term_syntax.parse_term("(b : A) == (d : A)")
  let t569 = @term_syntax.parse_term("(b : A) == (c : A)")
  let t570 = @term_syntax.parse_term("(a : A) == (d : A)")
  let t571 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(a : A) == (c : A)"), t570, t569, t568]),
  )
  let t573 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t571),
    t572,
  )
  symmetry_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, (P : (A, A, A, A) -> Bool)(a, b, c, d) → P(a, b, d, c)) && (∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, !(a == b) && !(c == d) && (a == c && b == d || a == c && !(b == d) || !(a == c) && b == d || !(a == c) && !(a == d) && !(b == c) && !(b == d)) → P(a, b, c, d)) → (∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, !(a == b) && !(c == d) → P(a, b, c, d))"),
      t573,
    ),
  )
}

///|
let symmetry_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRY_LEMMA")

///|
/// `SYMMETRY_LEMMA`
pub fn symmetry_lemma() -> @kernel.Thm {
  symmetry_lemma_c.get()
}

///|
/// SWAP_GENERAL
fn step_91() -> Unit raise {
  let t598 = @meson.asm_meson_tac(@list.List([swap_independent()]))
  let t596 = @term_syntax.parse_term("(b : A)")
  let t597 = @term_syntax.parse_term("(d : A)")
  let t599 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disj2_tac,
      @tactics.map_every(
        fn(
          x593 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s594 = @tactics.exists_tac(x593)
          fn(
            x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s594(x595)
          }
        },
        @list.List([@term_syntax.parse_term("(c : A)"), t597, t596]),
      ),
    ),
    t598,
  )
  let t592 = @meson.asm_meson_tac(@list.List([swap_common_p()]))
  let t590 = @term_syntax.parse_term("(c : A)")
  let t591 = @term_syntax.parse_term("(d : A)")
  let t600 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disj2_tac,
      @tactics.map_every(
        fn(
          x587 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s588 = @tactics.exists_tac(x587)
          fn(
            x589 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s588(x589)
          }
        },
        @list.List([@term_syntax.parse_term("(c : A)"), t591, t590]),
      ),
    ),
    t592,
  )
  let t586 = @meson.asm_meson_tac(@list.List([swap_common()]))
  let t584 = @term_syntax.parse_term("(b : A)")
  let t585 = @term_syntax.parse_term("(d : A)")
  let t601 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disj2_tac,
      @tactics.map_every(
        fn(
          x581 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s582 = @tactics.exists_tac(x581)
          fn(
            x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s582(x583)
          }
        },
        @list.List([@term_syntax.parse_term("(b : A)"), t585, t584]),
      ),
    ),
    t586,
  )
  let t602 = @list.List([
    @meson.meson_tac(@list.List([swap_idempotent()])),
    t601,
    t600,
    t599,
  ])
  let t580 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
      let s578 = @tactics.subst_all_tac(x577)
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
    }),
  )
  let t576 = @tactics.repeat_tac(@tactics.strip_tac)
  let t574 = @simp.simp_tac(@list.List([]))
  let t575 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([swap_sym()])), t574),
    @tactics.all_tac,
  ])
  let t603 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.match_mp_tac(symmetry_lemma()),
            @tactics.conj_tac,
          ),
          t575,
        ),
        t576,
      ),
      t580,
    ),
    t602,
  )
  swap_general_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, !(a == b) && !(c == d) → o(swap((a, b)), swap((c, d))) == I || (∃ x : A, ∃ y : A, ∃ z : A, !(x == a) && !(y == a) && !(z == a) && !(x == y) && o(swap((a, b)), swap((c, d))) == o(swap((x, y)), swap((a, z))))"),
      t603,
    ),
  )
}

///|
let swap_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SWAP_GENERAL")

///|
/// `SWAP_GENERAL`
pub fn swap_general() -> @kernel.Thm {
  swap_general_c.get()
}

///|
/// FIXING_SWAPSEQ_DECREASE
fn step_92() -> Unit raise {
  let t703 = @meson.asm_meson_tac(@list.List([swapseq_rules()]))
  let t702 = @simp.rewrite_tac(
    @list.List([
      @nums.not_suc(),
      @arith.suc_sub1(),
      @equal.gsym(@trivia.o_assoc()),
    ]),
  )
  let t701 = @term_syntax.parse_term("(n : Num)")
  let t704 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t701),
        @nums.induct_tac,
      ),
      t702,
    ),
    t703,
  )
  let t700 = @meson.asm_meson_tac(@list.List([]))
  let t699 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), swap()]),
  )
  let t698 = @simp.abbrev_tac(@term_syntax.parse_term("(r : (A) -> A) == o(swap(((a : A), (z : A))), (q : (A) -> A))"))
  let t697 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t696 = @tactics.first_x_assum(fn(
    x695 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x688 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s689 = @tactics.mp_tac(x688)
      fn(
        x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s689(x690)
      }
    })(
      ((x694 : @kernel.Thm) => {
        @lib.check(
          fn(x693 : @kernel.Thm) -> Bool raise {
            (fn(x691 : @kernel.Term) -> Bool raise { @basics.is_eq(x691) })(
              (fn(x692 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x692)
              })(x693),
            )
          },
          x694,
        )
      })(x695),
    )
  })
  let t705 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t696),
            t697,
          ),
          t698,
        ),
        t699,
      ),
      t700,
    ),
    t704,
  ])
  let t682 = @term_syntax.parse_term("(z : A)")
  let t683 = @term_syntax.parse_term("(a : A)")
  let t684 = @list.List([@term_syntax.parse_term("(q : (A) -> A)"), t683, t682])
  let t687 = @tactics.first_x_assum(fn(
    x686 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x679 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s680 = @tactics.mp_tac(x679)
      fn(
        x681 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s680(x681)
      }
    })(((x685 : @kernel.Thm) => @bool.specl(t684, x685))(x686))
  })
  let t678 = @tactics.disch_then(fn(
    x675 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s676 = @tactics.subst_all_tac(x675)
    fn(
      x677 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s676(x677)
    }
  })
  let t674 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x668 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s669 = @tactics.assume_tac(x668)
          fn(
            x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s669(x670)
          }
        },
        fn(
          x671 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s672 = @tactics.mp_tac(x671)
          fn(
            x673 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s672(x673)
          }
        },
      ),
    ),
  )
  let t665 = @term_syntax.parse_term("(z : A)")
  let t666 = @term_syntax.parse_term("(y : A)")
  let t667 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t666, t665]),
  )
  let t664 = @simp.asm_rewrite_tac(
    @list.List([
      @trivia.i_o_id(),
      @arith.suc_sub1(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t663 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
        x657 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s658 = @tactics.subst_all_tac(x657)
        fn(
          x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s658(x659)
        }
      },
      fn(
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      },
    ),
  )
  let t656 = @simp.asm_rewrite_tac(@list.List([]))
  let t652 = @term_syntax.parse_term("(d : A)")
  let t653 = @term_syntax.parse_term("(c : A)")
  let t654 = @term_syntax.parse_term("(b : A)")
  let t655 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : A)"), t654, t653, t652]),
      swap_general(),
    ),
  )
  let t651 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t650 = @tactics.first_x_assum(fn(
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
    let s648 = @tactics.subst_all_tac(x647)
    fn(
      x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s648(x649)
    }
  })
  let t646 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x640 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s641 = @tactics.assume_tac(x640)
        fn(
          x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s641(x642)
        }
      },
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
      },
    ),
  )
  let t639 = @tactics.first_x_assum(fn(
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
    (fn(
      x635 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s636 = @tactics.subst_all_tac(x635)
      fn(
        x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s636(x637)
      }
    })(@equal.sym(x638))
  })
  let t634 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s629 = @tactics.assume_tac(x628)
        fn(
          x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s629(x630)
        }
      },
      fn(
        x631 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s632 = @tactics.mp_tac(x631)
        fn(
          x633 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s632(x633)
        }
      },
    ),
  )
  let t627 = @simp.rewrite_tac(
    @list.List([@nums.suc_inj(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t623 = @term_syntax.parse_term("(m : Num)")
  let t624 = @term_syntax.parse_term("(q : (A) -> A)")
  let t625 = @term_syntax.parse_term("(d : A)")
  let t626 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(c : A)"), t625, t624, t623]),
  )
  let t622 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      @theorems.left_and_exists_thm(),
    ]),
  )
  let t620 = @meson.meson_tac(@list.List([]))
  let t619 = @simp.asm_rewrite_tac(
    @list.List([@trivia.i_thm(), @trivia.o_thm(), swap()]),
  )
  let t621 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(
          @tactics.conjuncts_then2(
            fn(
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
              let s614 = @tactics.assume_tac(x613)
              fn(
                x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s614(x615)
              }
            },
            fn(
              x616 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s617 = @tactics.mp_tac(x616)
              fn(
                x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s617(x618)
              }
            },
          ),
        ),
        t619,
      ),
      t620,
    ),
    @tactics.all_tac,
  ])
  let t612 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t611 = @simp.gen_rewrite_tac(
    fn(
      x610 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x604 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s605 = @equal.land_conv(x604)
        fn(x606 : @kernel.Term) -> @kernel.Thm raise { s605(x606) }
      })(
        (fn(
          x607 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s608 = @equal.land_conv(x607)
          fn(x609 : @kernel.Term) -> @kernel.Thm raise { s608(x609) }
        })(x610),
      )
    },
    @list.List([swapseq_cases()]),
  )
  let t706 = @tactics.thenl(
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
                                                @nums.induct_tac,
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                              ),
                                              t611,
                                            ),
                                            t612,
                                          ),
                                          t621,
                                        ),
                                        t622,
                                      ),
                                      t626,
                                    ),
                                    t627,
                                  ),
                                  t634,
                                ),
                                t639,
                              ),
                              t646,
                            ),
                            t650,
                          ),
                          t651,
                        ),
                        @tactics.strip_tac,
                      ),
                      t655,
                    ),
                    t656,
                  ),
                  t663,
                ),
                t664,
              ),
              t667,
            ),
            t674,
          ),
          t678,
        ),
        t687,
      ),
      @tactics.ants_tac,
    ),
    t705,
  )
  fixing_swapseq_decrease_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (A) -> A, ∀ a : A, ∀ b : A, swapseq(n, p) && !(a == b) && o(swap((a, b)), p, a) == a → !(n == 0) && swapseq(n - 1, o(swap((a, b)), p))"),
      t706,
    ),
  )
}

///|
let fixing_swapseq_decrease_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FIXING_SWAPSEQ_DECREASE",
)

///|
/// `FIXING_SWAPSEQ_DECREASE`
pub fn fixing_swapseq_decrease() -> @kernel.Thm {
  fixing_swapseq_decrease_c.get()
}

///|
/// SWAPSEQ_IDENTITY_EVEN
fn step_93() -> Unit raise {
  let t748 = @simp.rewrite_tac(@list.List([@arith.suc_sub1(), @arith.even()]))
  let t746 = @term_syntax.parse_term("(m : Num)")
  let t747 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t746)
  let t745 = @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 0)"))
  let t744 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) - 1 < SUC(m)"))]),
  )
  let t743 = @tactics.undisch_then(@term_syntax.parse_term("SUC((m : Num)) == (n : Num)"), fn(
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
    (fn(
      x739 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s740 = @tactics.subst_all_tac(x739)
      fn(
        x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s740(x741)
      }
    })(@equal.sym(x742))
  })
  let t735 = @term_syntax.parse_term("(m : Num) - 1")
  let t738 = @tactics.first_x_assum(fn(
    x737 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x732 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s733 = @tactics.mp_tac(x732)
      fn(
        x734 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s733(x734)
      }
    })(((x736 : @kernel.Thm) => @bool.spec(t735, x736))(x737))
  })
  let t731 = @simp.asm_rewrite_tac(@list.List([@trivia.i_thm()]))
  let t727 = @term_syntax.parse_term("(b : A)")
  let t728 = @term_syntax.parse_term("(a : A)")
  let t729 = @term_syntax.parse_term("(p : (A) -> A)")
  let t730 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Num)"), t729, t728, t727]),
      fixing_swapseq_decrease(),
    ),
  )
  let t726 = @tactics.disch_then(fn(
    x725 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x725))
  })
  let t721 = @term_syntax.parse_term("(m : Num)")
  let t722 = @term_syntax.parse_term("(p : (A) -> A)")
  let t723 = @term_syntax.parse_term("(b : A)")
  let t724 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t723, t722, t721]),
  )
  let t720 = @simp.rewrite_tac(
    @list.List([@arith.even(), @theorems.left_imp_exists_thm()]),
  )
  let t719 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
        x715 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          let s713 = @tactics.subst_all_tac(x712)
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
        })(@bool.conjunct1(x715))
      },
      fn(
        x716 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s717 = @tactics.mp_tac(x716)
        fn(
          x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s717(x718)
        }
      },
    ),
  )
  let t711 = @simp.gen_rewrite_tac(
    fn(
      x708 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s709 = @equal.land_conv(x708)
      fn(x710 : @kernel.Term) -> @kernel.Thm raise { s709(x710) }
    },
    @list.List([swapseq_cases()]),
  )
  let t707 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t749 = @tactics.then_tac(
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
                                    @tactics.match_mp_tac(@arith.num_wf()),
                                    t707,
                                  ),
                                  @tactics.disch_tac,
                                ),
                                t711,
                              ),
                              t719,
                            ),
                            t720,
                          ),
                          t724,
                        ),
                        t726,
                      ),
                      t730,
                    ),
                    t731,
                  ),
                  @tactics.strip_tac,
                ),
                t738,
              ),
              t743,
            ),
            t744,
          ),
          t745,
        ),
        t747,
      ),
      @nums.induct_tac,
    ),
    t748,
  )
  swapseq_identity_even_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (swapseq : (Num, (A) -> A) -> Bool)(n, (I : (A) -> A)) → EVEN(n)"),
      t749,
    ),
  )
}

///|
let swapseq_identity_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_IDENTITY_EVEN",
)

///|
/// `SWAPSEQ_IDENTITY_EVEN`
pub fn swapseq_identity_even() -> @kernel.Thm {
  swapseq_identity_even_c.get()
}

///|
/// evenperm
fn step_94() -> Unit raise {
  evenperm_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(evenperm : ((_) -> _) -> Bool)((p : (_) -> _)) == EVEN(select((n : Num) => swapseq(n, p)))"),
    ),
  )
}

///|
let evenperm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("evenperm")

///|
/// `evenperm`
pub fn evenperm() -> @kernel.Thm {
  evenperm_c.get()
}

///|
/// SWAPSEQ_EVEN_EVEN
fn step_95() -> Unit raise {
  let t770 = @simp.simp_tac(@list.List([@arith.even_add()]))
  let t767 = @drule.match_mp(swapseq_identity_even())
  let t769 = @tactics.disch_then(fn(
    x768 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s765 = @tactics.mp_tac(x764)
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
    })(t767(x768))
  })
  let t763 = @simp.asm_simp_tac(@list.List([swapseq_compose()]))
  let t759 = @term_syntax.parse_term("(swapseq : (Num, (A) -> A) -> Bool)((n : Num) + (m : Num))")
  let t762 = @tactics.first_x_assum(fn(
    x761 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x756 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s757 = @tactics.mp_tac(x756)
      fn(
        x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s757(x758)
      }
    })(((x760 : @kernel.Thm) => @equal.ap_term(t759, x760))(x761))
  })
  let t753 = @drule.match_mp(swapseq_inverse_exists())
  let t755 = @tactics.first_x_assum(fn(
    x754 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s751 = @tactics.mp_tac(x750)
      fn(
        x752 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s751(x752)
      }
    })(t753(x754))
  })
  let t771 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t755),
            @tactics.strip_tac,
          ),
          t762,
        ),
        t763,
      ),
      t769,
    ),
    t770,
  )
  swapseq_even_even_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : (A) -> A, swapseq(m, p) && swapseq(n, p) → EVEN(m) == EVEN(n)"),
      t771,
    ),
  )
}

///|
let swapseq_even_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAPSEQ_EVEN_EVEN",
)

///|
/// `SWAPSEQ_EVEN_EVEN`
pub fn swapseq_even_even() -> @kernel.Thm {
  swapseq_even_even_c.get()
}

///|
/// EVENPERM_UNIQUE
fn step_96() -> Unit raise {
  let t772 = @meson.meson_tac(@list.List([swapseq_even_even()]))
  let t773 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([evenperm()])),
    t772,
  )
  evenperm_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : (_) -> _, ∀ b : Bool, swapseq(n, p) && EVEN(n) == b → evenperm(p) == b"),
      t773,
    ),
  )
}

///|
let evenperm_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_UNIQUE",
)

///|
/// `EVENPERM_UNIQUE`
pub fn evenperm_unique() -> @kernel.Thm {
  evenperm_unique_c.get()
}

///|
/// EVENPERM_I
fn step_97() -> Unit raise {
  let t774 = @meson.meson_tac(@list.List([swapseq_rules(), @arith.even()]))
  let t775 = @tactics.then_tac(@tactics.match_mp_tac(evenperm_unique()), t774)
  evenperm_i_c.set(@tactics.prove(@term_syntax.parse_term("(evenperm : ((_) -> _) -> Bool)((I : (_) -> _)) == true"), t775))
}

///|
let evenperm_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVENPERM_I")

///|
/// `EVENPERM_I`
pub fn evenperm_i() -> @kernel.Thm {
  evenperm_i_c.get()
}

///|
/// EVENPERM_ID
fn step_98() -> Unit raise {
  let t776 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@trivia.i_def()), evenperm_i()]),
  )
  evenperm_id_c.set(
    @tactics.prove(@term_syntax.parse_term("evenperm((x : A) => x)"), t776),
  )
}

///|
let evenperm_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVENPERM_ID")

///|
/// `EVENPERM_ID`
pub fn evenperm_id() -> @kernel.Thm {
  evenperm_id_c.get()
}

///|
/// EVENPERM_SWAP
fn step_99() -> Unit raise {
  let t778 = @calc_num.num_red_conv(@term_syntax.parse_term("EVEN(1)"))
  let t779 = @meson.meson_tac(
    @list.List([
      swapseq_swap(),
      @calc_num.num_red_conv(@term_syntax.parse_term("EVEN(0)")),
      t778,
    ]),
  )
  let t777 = @tactics.match_mp_tac(evenperm_unique())
  let t780 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t777),
    t779,
  )
  evenperm_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, ∀ b : A, evenperm(swap((a, b))) == (a == b)"),
      t780,
    ),
  )
}

///|
let evenperm_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVENPERM_SWAP")

///|
/// `EVENPERM_SWAP`
pub fn evenperm_swap() -> @kernel.Thm {
  evenperm_swap_c.get()
}

///|
/// EVENPERM_COMPOSE
fn step_100() -> Unit raise {
  let t787 = @meson.asm_meson_tac(
    @list.List([evenperm_unique(), swapseq_compose(), @arith.even_add()]),
  )
  let t786 = @tactics.disch_then(fn(
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
    let th = x783
    let t785 = @tactics.assume_tac(@drule.match_mp(swapseq_compose())(th))
    @tactics.then_tac(@tactics.assume_tac(th), t785)
  })
  let t782 = @tactics.repeat_tac(@tactics.gen_tac)
  let t781 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t788 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              permutation(),
              @theorems.left_and_exists_thm(),
              @theorems.right_and_exists_thm(),
            ]),
          ),
          t781,
        ),
        t782,
      ),
      t786,
    ),
    t787,
  )
  evenperm_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, permutation(p) && permutation(q) → evenperm(o(p, q)) == (evenperm(p) == evenperm(q))"),
      t788,
    ),
  )
}

///|
let evenperm_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_COMPOSE",
)

///|
/// `EVENPERM_COMPOSE`
pub fn evenperm_compose() -> @kernel.Thm {
  evenperm_compose_c.get()
}

///|
/// EVENPERM_INVERSE
fn step_101() -> Unit raise {
  let t791 = @meson.asm_meson_tac(
    @list.List([swapseq_inverse(), evenperm_unique()]),
  )
  let t790 = @tactics.match_mp_tac(evenperm_unique())
  let t789 = @tactics.repeat_tac(@tactics.strip_tac)
  let t792 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([permutation()])), t789),
      t790,
    ),
    t791,
  )
  evenperm_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutation(p) → evenperm(inverse(p)) == evenperm(p)"),
      t792,
    ),
  )
}

///|
let evenperm_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_INVERSE",
)

///|
/// `EVENPERM_INVERSE`
pub fn evenperm_inverse() -> @kernel.Thm {
  evenperm_inverse_c.get()
}

///|
/// PERMUTATION_BIJECTIVE
fn step_102() -> Unit raise {
  let t801 = @meson.meson_tac(@list.List([]))
  let t800 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @trivia.i_thm(),
      @trivia.o_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t797 = @drule.match_mp(swapseq_inverse_exists())
  let t799 = @tactics.first_x_assum(fn(
    x798 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x794 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s795 = @tactics.mp_tac(x794)
      fn(
        x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s795(x796)
      }
    })(t797(x798))
  })
  let t793 = @tactics.repeat_tac(@tactics.strip_tac)
  let t802 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([permutation()])), t793),
        t799,
      ),
      t800,
    ),
    t801,
  )
  permutation_bijective_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutation(p) → (∀ y : _, existsunique((x : _) => p(x) == y))"),
      t802,
    ),
  )
}

///|
let permutation_bijective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_BIJECTIVE",
)

///|
/// `PERMUTATION_BIJECTIVE`
pub fn permutation_bijective() -> @kernel.Thm {
  permutation_bijective_c.get()
}

///|
/// PERMUTATION_FINITE_SUPPORT
fn step_103() -> Unit raise {
  let t813 = @meson.meson_tac(@list.List([]))
  let t812 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), swap()]))
  let t811 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.finite_insert(),
      @sets.subset(),
      @sets.in_insert(),
      @sets.in_elim_thm(),
    ]),
  )
  let t810 = @tactics.exists_tac(
    @term_syntax.parse_term("INSERT((a : A), INSERT((b : A), {(x : A) | !((p : (A) -> A)(x) == x)}))"),
  )
  let t809 = @tactics.match_mp_tac(@sets.finite_subset())
  let t806 = @term_syntax.parse_term("(p : (A) -> A)")
  let t807 = @term_syntax.parse_term("(b : A)")
  let t808 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t807, t806]),
  )
  let t805 = @simp.rewrite_tac(
    @list.List([
      @trivia.i_thm(),
      @sets.finite_rules(),
      @sets.set_rule(@term_syntax.parse_term("{(x : _) | false} == {}")),
    ]),
  )
  let t804 = @tactics.match_mp_tac(swapseq_induct())
  let t803 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t814 = @tactics.then_tac(
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
                        @list.List([
                          permutation(),
                          @theorems.left_imp_exists_thm(),
                        ]),
                      ),
                      t803,
                    ),
                    t804,
                  ),
                  t805,
                ),
                t808,
              ),
              @tactics.strip_tac,
            ),
            t809,
          ),
          t810,
        ),
        t811,
      ),
      t812,
    ),
    t813,
  )
  permutation_finite_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, permutation(p) → FINITE({(x : A) | !(p(x) == x)})"),
      t814,
    ),
  )
}

///|
let permutation_finite_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_FINITE_SUPPORT",
)

///|
/// `PERMUTATION_FINITE_SUPPORT`
pub fn permutation_finite_support() -> @kernel.Thm {
  permutation_finite_support_c.get()
}

///|
/// PERMUTATION_LEMMA
fn step_104() -> Unit raise {
  let t845 = @meson.asm_meson_tac(@list.List([]))
  let t844 = @simp.asm_rewrite_tac(@list.List([]))
  let t843 = @class.asm_cases_tac(@term_syntax.parse_term("(p : (A) -> A)((a : A)) == a"))
  let t846 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([swap(), @trivia.o_thm()])),
        t843,
      ),
      t844,
    ),
    t845,
  )
  let t842 = @meson.asm_meson_tac(@list.List([]))
  let t841 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("(if (p : Bool) { (x : Bool) } else { (y : Bool) }) == (p && x || !p && y)"),
      ),
    ]),
  )
  let t840 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((if (p : Bool) { (x : _) } else { (y : _) }) == (a : _)) == (if p { x == a } else { y == a })"),
      ),
    ]),
  )
  let t839 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t838 = @simp.asm_rewrite_tac(@list.List([]))
  let t837 = @class.asm_cases_tac(@term_syntax.parse_term("(p : (A) -> A)((a : A)) == a"))
  let t836 = @simp.rewrite_tac(
    @list.List([@theorems.exists_unique_thm(), swap(), @trivia.o_thm()]),
  )
  let t847 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.undisch_tac(
                    @term_syntax.parse_term("∀ y : A, existsunique((x : A) => (p : (A) -> A)(x) == y)"),
                  ),
                  t836,
                ),
                t837,
              ),
              t838,
            ),
            t839,
          ),
          t840,
        ),
        t841,
      ),
      t842,
    ),
    t846,
  ])
  let t835 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t834 = @simp.rewrite_tac(@list.List([permutation_swap()]))
  let t833 = @tactics.match_mp_tac(permutation_compose())
  let t832 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t831 = @list.List([
    @tactics.all_tac,
    @simp.rewrite_tac(@list.List([swap_idempotent(), @trivia.i_o_id()])),
  ])
  let t830 = @tactics.subgoal_then(
    @term_syntax.parse_term("permutation(o(o(swap(((a : A), (p : (A) -> A)(a))), swap((a, p(a)))), p))"),
    fn(
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    },
  )
  let t826 = @tactics.repeat_tac(@tactics.strip_tac)
  let t825 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t823 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t824 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t823]),
  )
  let t821 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.i_thm()]),
  )
  let t820 = @tactics.subgoal_then(@term_syntax.parse_term("(p : (A) -> A) == I"), fn(
    x818 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x818
    @simp.rewrite_tac(@list.List([th, permutation_i()]))
  })
  let t817 = @tactics.repeat_tac(@tactics.strip_tac)
  let t822 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@sets.not_in_empty()])),
          t817,
        ),
        t820,
      ),
      t821,
    ),
    @tactics.all_tac,
  ])
  let t816 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t815 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t848 = @tactics.thenl(
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
                                  @simp.once_rewrite_tac(
                                    @list.List([@theorems.imp_conj()]),
                                  ),
                                  t815,
                                ),
                                t816,
                              ),
                              @tactics.conj_tac,
                            ),
                            t822,
                          ),
                          t824,
                        ),
                        @tactics.strip_tac,
                      ),
                      t825,
                    ),
                    t826,
                  ),
                  t830,
                ),
                t831,
              ),
              t832,
            ),
            t833,
          ),
          t834,
        ),
        t835,
      ),
      @tactics.conj_tac,
    ),
    t847,
  )
  permutation_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : (A) -> A, FINITE(s) && (∀ y : A, existsunique((x : A) => p(x) == y)) && (∀ x : A, !IN(x, s) → p(x) == x) → permutation(p)"),
      t848,
    ),
  )
}

///|
let permutation_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_LEMMA",
)

///|
/// `PERMUTATION_LEMMA`
pub fn permutation_lemma() -> @kernel.Thm {
  permutation_lemma_c.get()
}

///|
/// PERMUTATION
fn step_105() -> Unit raise {
  let t852 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t851 = @tactics.exists_tac(@term_syntax.parse_term("{(x : A) | !((p : (A) -> A)(x) == x)}"))
  let t850 = @tactics.match_mp_tac(permutation_lemma())
  let t849 = @simp.simp_tac(
    @list.List([permutation_bijective(), permutation_finite_support()]),
  )
  let t853 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t849,
          ),
          @tactics.strip_tac,
        ),
        t850,
      ),
      t851,
    ),
    t852,
  )
  permutation_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, permutation(p) == ((∀ y : A, existsunique((x : A) => p(x) == y)) && FINITE({(x : A) | !(p(x) == x)}))"),
      t853,
    ),
  )
}

///|
let permutation_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTATION")

///|
/// `PERMUTATION`
pub fn permutation_v1() -> @kernel.Thm {
  permutation_v1_c.get()
}

///|
/// PERMUTATION_INVERSE_WORKS
fn step_106() -> Unit raise {
  let t854 = @meson.meson_tac(
    @list.List([
      permutation_bijective(),
      surjective_inverse_o(),
      injective_inverse_o(),
    ]),
  )
  permutation_inverse_works_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutation(p) → o(inverse(p), p) == I && o(p, inverse(p)) == I"),
      t854,
    ),
  )
}

///|
let permutation_inverse_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_INVERSE_WORKS",
)

///|
/// `PERMUTATION_INVERSE_WORKS`
pub fn permutation_inverse_works() -> @kernel.Thm {
  permutation_inverse_works_c.get()
}

///|
/// PERMUTATION_INVERSE_COMPOSE
fn step_107() -> Unit raise {
  let t872 = @simp.asm_rewrite_tac(@list.List([@trivia.i_o_id()]))
  let t871 = @simp.gen_rewrite_tac(
    fn(
      x870 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x864 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s865 = @equal.land_conv(x864)
        fn(x866 : @kernel.Term) -> @kernel.Thm raise { s865(x866) }
      })(
        (fn(
          x867 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s868 = @equal.rand_conv(x867)
          fn(x869 : @kernel.Term) -> @kernel.Thm raise { s868(x869) }
        })(x870),
      )
    },
    @list.List([@trivia.o_assoc()]),
  )
  let t863 = @tactics.repeat_tac(@tactics.strip_tac)
  let t862 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t859 = @drule.match_mp(permutation_inverse_works())
  let t861 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
        x856 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s857 = @tactics.mp_tac(x856)
        fn(
          x858 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s857(x858)
        }
      })(t859(x860))
    }),
  )
  let t855 = @tactics.match_mp_tac(inverse_unique_o())
  let t873 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t855),
            t861,
          ),
          t862,
        ),
        t863,
      ),
      t871,
    ),
    t872,
  )
  permutation_inverse_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, permutation(p) && permutation(q) → inverse(o(p, q)) == o(inverse(q), inverse(p))"),
      t873,
    ),
  )
}

///|
let permutation_inverse_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_INVERSE_COMPOSE",
)

///|
/// `PERMUTATION_INVERSE_COMPOSE`
pub fn permutation_inverse_compose() -> @kernel.Thm {
  permutation_inverse_compose_c.get()
}

///|
/// PERMUTATION_COMPOSE_EQ
fn step_108() -> Unit raise {
  let t901 = @simp.rewrite_tac(@list.List([@trivia.i_o_id()]))
  let t900 = @simp.asm_simp_tac(
    @list.List([@trivia.o_assoc(), permutation_inverse_works()]),
  )
  let t899 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@trivia.o_assoc()), permutation_inverse_works()]),
  )
  let t895 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(
      permutation_compose(),
    ),
  )
  let t892 = @term_syntax.parse_term("inverse((q : (A) -> A))")
  let t897 = @tactics.disch_then(fn(
    x896 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x894 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x889 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s890 = @tactics.mp_tac(x889)
        fn(
          x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s890(x891)
        }
      })(((x893 : @kernel.Thm) => @bool.spec(t892, x893))(x894))
    })(t895(x896))
  })
  let t887 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      permutation_compose(),
    ),
  )
  let t884 = @term_syntax.parse_term("inverse((p : (A) -> A))")
  let t898 = @list.List([
    @tactics.disch_then(fn(
      x888 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x886 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          let s882 = @tactics.mp_tac(x881)
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
        })(((x885 : @kernel.Thm) => @bool.spec(t884, x885))(x886))
      })(t887(x888))
    }),
    t897,
  ])
  let t880 = @simp.asm_simp_tac(@list.List([permutation_compose()]))
  let t877 = @drule.match_mp(permutation_inverse())
  let t879 = @tactics.first_assum(fn(
    x878 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x874 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s875 = @tactics.assume_tac(x874)
      fn(
        x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s875(x876)
      }
    })(t877(x878))
  })
  let t902 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t879),
              @tactics.eq_tac,
            ),
            t880,
          ),
          t898,
        ),
        t899,
      ),
      t900,
    ),
    t901,
  )
  permutation_compose_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : (A) -> A, ∀ q : (A) -> A, permutation(p) → permutation(o(p, q)) == permutation(q)) && (∀ p : (A) -> A, ∀ q : (A) -> A, permutation(q) → permutation(o(p, q)) == permutation(p))"),
      t902,
    ),
  )
}

///|
let permutation_compose_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_COMPOSE_EQ",
)

///|
/// `PERMUTATION_COMPOSE_EQ`
pub fn permutation_compose_eq() -> @kernel.Thm {
  permutation_compose_eq_c.get()
}

///|
/// PERMUTATION_COMPOSE_SWAP
fn step_109() -> Unit raise {
  let t903 = @simp.simp_tac(
    @list.List([permutation_compose_eq(), permutation_swap()]),
  )
  permutation_compose_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : (A) -> A, ∀ a : A, ∀ b : A, permutation(o(swap((a, b)), p)) == permutation(p)) && (∀ p : (A) -> A, ∀ a : A, ∀ b : A, permutation(o(p, swap((a, b)))) == permutation(p))"),
      t903,
    ),
  )
}

///|
let permutation_compose_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_COMPOSE_SWAP",
)

///|
/// `PERMUTATION_COMPOSE_SWAP`
pub fn permutation_compose_swap() -> @kernel.Thm {
  permutation_compose_swap_c.get()
}

///|
/// PERMUTATION_PERMUTES
fn step_110() -> Unit raise {
  let t908 = @meson.asm_meson_tac(@list.List([]))
  let t907 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @sets.subset()]),
  )
  let t906 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t909 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t906),
      t907,
    ),
    t908,
  )
  let t905 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t910 = @list.List([
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("{(x : A) | !((p : (A) -> A)(x) == x)}")),
      t905,
    ),
    t909,
  ])
  let t904 = @simp.asm_rewrite_tac(@list.List([]))
  let t911 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([permutation_v1(), permutes()])),
          ),
          @tactics.eq_tac,
        ),
        @tactics.strip_tac,
      ),
      t904,
    ),
    t910,
  )
  permutation_permutes_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, permutation(p) == (∃ s : (A) -> Bool, FINITE(s) && permutes(p, s))"),
      t911,
    ),
  )
}

///|
let permutation_permutes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_PERMUTES",
)

///|
/// `PERMUTATION_PERMUTES`
pub fn permutation_permutes() -> @kernel.Thm {
  permutation_permutes_c.get()
}

///|
/// PERMUTATION_RESTRICT
fn step_111() -> Unit raise {
  let t915 = @meson.asm_meson_tac(@list.List([permutes_restrict()]))
  let t914 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t913 = @simp.rewrite_tac(@list.List([permutation_permutes()]))
  let t912 = @simp.rewrite_tac(@list.List([@theorems.imp_conj_alt()]))
  let t916 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t912),
          @tactics.disch_tac,
        ),
        t913,
      ),
      t914,
    ),
    t915,
  )
  permutation_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ Q : (A) -> Bool, ∀ p : (A) -> A, permutation(p) && (∀ x : A, Q(p(x)) == Q(x)) → permutation((i : A) => if Q(i) { p(i) } else { i })"),
      t916,
    ),
  )
}

///|
let permutation_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_RESTRICT",
)

///|
/// `PERMUTATION_RESTRICT`
pub fn permutation_restrict() -> @kernel.Thm {
  permutation_restrict_c.get()
}

///|
/// PERMUTES_INDUCT
fn step_112() -> Unit raise {
  let t941 = @meson.asm_meson_tac(
    @list.List([
      permutes_in_image(),
      @sets.in_insert(),
      permutes_insert_lemma(),
      permutation_permutes(),
      @sets.finite_insert(),
      permutation_compose(),
      permutation_swap(),
    ]),
  )
  let t940 = @tactics.disch_then(fn(
    x937 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x937
    let t939 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t939)
  })
  let t936 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t935 = @tactics.first_x_assum(fn(
    x934 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x927 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s928 = @tactics.mp_tac(x927)
      fn(
        x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s928(x929)
      }
    })(
      ((x933 : @kernel.Thm) => {
        @lib.check(
          fn(x932 : @kernel.Thm) -> Bool raise {
            (fn(x930 : @kernel.Term) -> Bool raise { @basics.is_imp(x930) })(
              (fn(x931 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x931)
              })(x932),
            )
          },
          x933,
        )
      })(x934),
    )
  })
  let t926 = @list.List([
    @simp.rewrite_tac(
      @list.List([@trivia.o_assoc(), swap_idempotent(), @trivia.i_o_id()]),
    ),
    @tactics.all_tac,
  ])
  let t925 = @tactics.subgoal_then(
    @term_syntax.parse_term("(p : (A) -> A) == o(swap(((x : A), p(x))), o(swap((x, p(x))), p))"),
    fn(
      x922 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s923 = @tactics.subst1_tac(x922)
      fn(
        x924 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s923(x924)
      }
    },
  )
  let t921 = @simp.asm_rewrite_tac(@list.List([]))
  let t920 = @tactics.repeat_tac(@tactics.strip_tac)
  let t919 = @simp.asm_rewrite_tac(
    @list.List([permutes_empty(), @sets.in_insert()]),
  )
  let t918 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t917 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t942 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @simp.once_rewrite_tac(
                                @list.List([
                                  @class.taut(
                                    @term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (b → a → c → d)"),
                                  ),
                                ]),
                              ),
                              t917,
                            ),
                            @tactics.gen_tac,
                          ),
                          @tactics.disch_tac,
                        ),
                        t918,
                      ),
                      t919,
                    ),
                    t920,
                  ),
                  t921,
                ),
                t925,
              ),
              t926,
            ),
            t935,
          ),
          @tactics.ants_tac,
        ),
        t936,
      ),
      t940,
    ),
    t941,
  )
  permutes_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> A) -> Bool, ∀ s : (A) -> Bool, FINITE(s) && P(I) && (∀ a : A, ∀ b : A, ∀ p : (A) -> A, IN(a, s) && IN(b, s) && P(p) && permutation(p) → P(o(swap((a, b)), p))) → (∀ p : (A) -> A, permutes(p, s) → P(p))"),
      t942,
    ),
  )
}

///|
let permutes_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INDUCT",
)

///|
/// `PERMUTES_INDUCT`
pub fn permutes_induct() -> @kernel.Thm {
  permutes_induct_c.get()
}

///|
/// PERMUTES_INDUCT_STRONG
fn step_113() -> Unit raise {
  let t949 = @simp.asm_simp_tac(@list.List([swap_refl(), @trivia.i_o_id()]))
  let t948 = @class.asm_cases_tac(@term_syntax.parse_term("(a : A) == (b : A)"))
  let t946 = @term_syntax.parse_term("(b : A)")
  let t947 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t946]),
  )
  let t945 = @simp.asm_simp_tac(
    @list.List([permutes_i(), permutes_compose(), permutes_swap()]),
  )
  let t944 = @tactics.match_mp_tac(permutes_induct())
  let t943 = @simp.once_rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (p → p && q)"))]),
  )
  let t950 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.strip_tac,
              ),
              t943,
            ),
            t944,
          ),
          t945,
        ),
        t947,
      ),
      t948,
    ),
    t949,
  )
  permutes_induct_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> A) -> Bool, ∀ s : (A) -> Bool, FINITE(s) && P(I) && (∀ a : A, ∀ b : A, ∀ p : (A) -> A, IN(a, s) && IN(b, s) && !(a == b) && P(p) && permutes(p, s) → P(o(swap((a, b)), p))) → (∀ p : (A) -> A, permutes(p, s) → P(p))"),
      t950,
    ),
  )
}

///|
let permutes_induct_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INDUCT_STRONG",
)

///|
/// `PERMUTES_INDUCT_STRONG`
pub fn permutes_induct_strong() -> @kernel.Thm {
  permutes_induct_strong_c.get()
}

///|
/// sign
fn step_114() -> Unit raise {
  sign_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(sign : ((_) -> _) -> Real)((p : (_) -> _)) == (if evenperm(p) { real_of_num(1) } else { -real_of_num(1) })"),
    ),
  )
}

///|
let sign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sign")

///|
/// `sign`
pub fn sign() -> @kernel.Thm {
  sign_c.get()
}

///|
/// SIGN_NZ
fn step_115() -> Unit raise {
  let t951 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([sign()])),
    @calc_rat.real_arith_tac,
  )
  sign_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> _, !(sign(p) == real_of_num(0))"), t951))
}

///|
let sign_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_NZ")

///|
/// `SIGN_NZ`
pub fn sign_nz() -> @kernel.Thm {
  sign_nz_c.get()
}

///|
/// SIGN_I
fn step_116() -> Unit raise {
  let t952 = @simp.rewrite_tac(@list.List([sign(), evenperm_i()]))
  sign_i_c.set(@tactics.prove(@term_syntax.parse_term("(sign : ((_) -> _) -> Real)((I : (_) -> _)) == real_of_num(1)"), t952))
}

///|
let sign_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_I")

///|
/// `SIGN_I`
pub fn sign_i() -> @kernel.Thm {
  sign_i_c.get()
}

///|
/// SIGN_ID
fn step_117() -> Unit raise {
  let t953 = @simp.rewrite_tac(@list.List([sign(), evenperm_id()]))
  sign_id_c.set(@tactics.prove(@term_syntax.parse_term("sign((x : A) => x) == real_of_num(1)"), t953))
}

///|
let sign_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_ID")

///|
/// `SIGN_ID`
pub fn sign_id() -> @kernel.Thm {
  sign_id_c.get()
}

///|
/// SIGN_INVERSE
fn step_118() -> Unit raise {
  let t954 = @tactics.then_tac(
    @simp.simp_tac(@list.List([sign(), evenperm_inverse()])),
    @calc_rat.real_arith_tac,
  )
  sign_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, permutation(p) → sign(inverse(p)) == sign(p)"),
      t954,
    ),
  )
}

///|
let sign_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_INVERSE")

///|
/// `SIGN_INVERSE`
pub fn sign_inverse() -> @kernel.Thm {
  sign_inverse_c.get()
}

///|
/// SIGN_COMPOSE
fn step_119() -> Unit raise {
  let t955 = @tactics.then_tac(
    @simp.simp_tac(@list.List([sign(), evenperm_compose()])),
    @calc_rat.real_arith_tac,
  )
  sign_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (_) -> _, ∀ q : (_) -> _, permutation(p) && permutation(q) → sign(o(p, q)) == sign(p) * sign(q)"),
      t955,
    ),
  )
}

///|
let sign_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_COMPOSE")

///|
/// `SIGN_COMPOSE`
pub fn sign_compose() -> @kernel.Thm {
  sign_compose_c.get()
}

///|
/// SIGN_SWAP
fn step_120() -> Unit raise {
  let t956 = @simp.rewrite_tac(@list.List([sign(), evenperm_swap()]))
  sign_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : _, ∀ b : _, sign(swap((a, b))) == (if a == b { real_of_num(1) } else { -real_of_num(1) })"),
      t956,
    ),
  )
}

///|
let sign_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_SWAP")

///|
/// `SIGN_SWAP`
pub fn sign_swap() -> @kernel.Thm {
  sign_swap_c.get()
}

///|
/// SIGN_IDEMPOTENT
fn step_121() -> Unit raise {
  let t958 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t957 = @simp.asm_rewrite_tac(@list.List([]))
  let t959 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([sign()])),
        ),
        @class.cond_cases_tac,
      ),
      t957,
    ),
    t958,
  )
  sign_idempotent_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : (_) -> _, sign(p) * sign(p) == real_of_num(1)"), t959),
  )
}

///|
let sign_idempotent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SIGN_IDEMPOTENT",
)

///|
/// `SIGN_IDEMPOTENT`
pub fn sign_idempotent() -> @kernel.Thm {
  sign_idempotent_c.get()
}

///|
/// REAL_ABS_SIGN
fn step_122() -> Unit raise {
  let t960 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([sign()])),
    @calc_rat.real_arith_tac,
  )
  real_abs_sign_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : (_) -> _, abs(sign(p)) == real_of_num(1)"), t960),
  )
}

///|
let real_abs_sign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_SIGN")

///|
/// `REAL_ABS_SIGN`
pub fn real_abs_sign() -> @kernel.Thm {
  real_abs_sign_c.get()
}

///|
/// REAL_SGN_SIGN
fn step_123() -> Unit raise {
  let t962 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t961 = @simp.asm_rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t963 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([sign()])),
        ),
        @class.cond_cases_tac,
      ),
      t961,
    ),
    t962,
  )
  real_sgn_sign_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, real_sgn(sign(p)) == sign(p)"),
      t963,
    ),
  )
}

///|
let real_sgn_sign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_SIGN")

///|
/// `REAL_SGN_SIGN`
pub fn real_sgn_sign() -> @kernel.Thm {
  real_sgn_sign_c.get()
}

///|
/// EVENPERM_TRANSFER
fn step_124() -> Unit raise {
  let t1061 = @meson.asm_meson_tac(@list.List([]))
  let t1060 = @simp.asm_simp_tac(@list.List([]))
  let t1058 = @tactics.conjuncts_then2(
    fn(
      x1052 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1053 = @tactics.subst_all_tac(x1052)
      fn(
        x1054 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1053(x1054)
      }
    },
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
  let t1059 = @tactics.first_x_assum(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(t1058),
  )
  let t1051 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1050 = @simp.asm_rewrite_tac(@list.List([]))
  let t1049 = @class.asm_cases_tac(
    @term_syntax.parse_term("∃ x : A, (y : B) == (f : (A) -> B)(x) && IN(x, (s : (A) -> Bool))"),
  )
  let t1048 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1047 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)"))
  let t1046 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([permutes_alt()])),
  )
  let t1045 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_def(), swap()]),
  )
  let t1043 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x1042 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1039 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1040 = @tactics.subst1_tac(x1039)
        fn(
          x1041 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1040(x1041)
        }
      })(@equal.sym(x1042))
    }),
    @tactics.ap_term_tac,
  )
  let t1038 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1037 = @tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t1036 = @tactics.match_mp_tac(permutes_transfer())
  let t1035 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t1034 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool))"))
  let t1044 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([permutation_permutes()])),
              t1034,
            ),
            t1035,
          ),
          t1036,
        ),
        t1037,
      ),
      t1038,
    ),
    t1043,
  ])
  let t1033 = @simp.rewrite_tac(@list.List([permutation_swap()]))
  let t1027 = @drule.part_match(
    fn(x1026 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x1026))
    },
    evenperm_compose(),
  )
  let t1021 = @meson.asm_meson_tac(@list.List([]))
  let t1022 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([evenperm_swap()])), t1021),
    @tactics.all_tac,
  ])
  let t1020 = @tactics.subgoal_then(
    @term_syntax.parse_term("evenperm(swap(((a : A), (b : A)))) == evenperm(swap(((f : (A) -> B)(a), f(b))))"),
    fn(
      x1017 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1018 = @tactics.subst1_tac(x1017)
      fn(
        x1019 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1018(x1019)
      }
    },
  )
  let t1016 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s1013 = @tactics.subst1_tac(x1012)
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
    })(@equal.sym(x1015))
  })
  let t1010 = @tactics.disch_then(fn(
    x1007 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1008 = @tactics.subst1_tac(x1007)
    fn(
      x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1008(x1009)
    }
  })
  let t1011 = @list.List([@meson.asm_meson_tac(@list.List([])), t1010])
  let t1006 = @simp.rewrite_tac(@list.List([permutation_permutes()]))
  let t1005 = @simp.rewrite_tac(@list.List([permutation_swap()]))
  let t999 = @drule.part_match(
    fn(x998 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x998))
    },
    evenperm_compose(),
  )
  let t992 = @term_syntax.parse_term("(p : (A) -> A)")
  let t993 = @term_syntax.parse_term("(b : A)")
  let t994 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t993, t992]),
  )
  let t990 = @simp.rewrite_tac(@list.List([evenperm_i()]))
  let t989 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t991 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.i_thm()])),
      t989,
    ),
    t990,
  ])
  let t988 = @tactics.subgoal_then(
    @term_syntax.parse_term("((x : B) => if IN(x, IMAGE((f : (A) -> B), (s : (A) -> Bool))) { f((g : (B) -> A)(x)) } else { x }) == I"),
    fn(
      x985 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s986 = @tactics.subst1_tac(x985)
      fn(
        x987 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s986(x987)
      }
    },
  )
  let t984 = @simp.asm_rewrite_tac(
    @list.List([@trivia.i_thm(), @trivia.o_thm()]),
  )
  let t983 = @tactics.match_mp_tac(permutes_induct_strong())
  let t981 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @theorems.forall_unwind_thm2(),
    ]),
  )
  let t980 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t982 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
      t980,
    ),
    t981,
  ])
  let t979 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ p : (A) -> A, ∀ q : (B) -> B, ((∀ x : A, IN(x, (s : (A) -> Bool)) → q((f : (A) -> B)(x)) == f(p(x))) && (∀ y : B, !IN(y, IMAGE(f, s)) → q(y) == y)) == (q == ((x : B) => if IN(x, IMAGE(f, s)) { f(p((g : (B) -> A)(x))) } else { x }))"),
    fn(
      x977 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x977
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t974 = @term_syntax.parse_term("(g : (B) -> A)")
  let t976 = @tactics.disch_then((x975 : @kernel.Thm) => {
    @tactics.x_choose_tac(t974, x975)
  })
  let t971 = @simp.gen_rewrite_rule(
    fn(
      x970 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x970
    },
    @list.List([@sets.injective_on_left_inverse()]),
  )
  let t973 = @tactics.first_x_assum(fn(
    x972 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s968 = @tactics.mp_tac(x967)
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
    })(t971(x972))
  })
  let t966 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t965 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t964 = @simp.once_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1062 = @tactics.then_tac(
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
                                                              @tactics.then_tac(
                                                                @tactics.then_tac(
                                                                  @tactics.then_tac(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.then_tac(
                                                                          @tactics.then_tac(
                                                                            @tactics.gen_tac,
                                                                            @tactics.gen_tac,
                                                                          ),
                                                                          t964,
                                                                        ),
                                                                        t965,
                                                                      ),
                                                                      t966,
                                                                    ),
                                                                    @tactics.strip_tac,
                                                                  ),
                                                                  t973,
                                                                ),
                                                                t976,
                                                              ),
                                                              t979,
                                                            ),
                                                            t982,
                                                          ),
                                                          t983,
                                                        ),
                                                        t984,
                                                      ),
                                                      t988,
                                                    ),
                                                    t991,
                                                  ),
                                                  t994,
                                                ),
                                                @tactics.strip_tac,
                                              ),
                                              fn(
                                                x1004 : (
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
                                                (fn(
                                                  x1003 : (
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
                                                    x1001 : @kernel.Term,
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
                                                      x1000 : @kernel.Term,
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
                                                      (fn(
                                                        x995 : @kernel.Thm,
                                                      ) -> ((
                                                        (
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
                                                      ) raise) raise {
                                                        let s996 = @tactics.mp_tac(
                                                          x995,
                                                        )
                                                        fn(
                                                          x997 : (
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
                                                          s996(x997)
                                                        }
                                                      })(t999(x1000))
                                                    })(@kernel.rand(x1001))
                                                  })(
                                                    (fn(
                                                      x1002 : (
                                                        @list.List[
                                                          (String, @kernel.Thm),
                                                        ],
                                                        @kernel.Term,
                                                      ),
                                                    ) -> @kernel.Term raise {
                                                      x1002.1
                                                    })(x1003),
                                                  )
                                                })(x1004)(x1004)
                                              },
                                            ),
                                            t1005,
                                          ),
                                          t1006,
                                        ),
                                        @tactics.ants_tac,
                                      ),
                                      t1011,
                                    ),
                                    t1016,
                                  ),
                                  t1020,
                                ),
                                t1022,
                              ),
                              fn(
                                x1032 : (
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
                                (fn(
                                  x1031 : (
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
                                    x1029 : @kernel.Term,
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
                                      x1028 : @kernel.Term,
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
                                        x1023 : @kernel.Thm,
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
                                        let s1024 = @tactics.mp_tac(x1023)
                                        fn(
                                          x1025 : (
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
                                        ) raise {
                                          s1024(x1025)
                                        }
                                      })(t1027(x1028))
                                    })(@kernel.rand(x1029))
                                  })(
                                    (fn(
                                      x1030 : (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> @kernel.Term raise {
                                      x1030.1
                                    })(x1031),
                                  )
                                })(x1032)(x1032)
                              },
                            ),
                            t1033,
                          ),
                          @tactics.ants_tac,
                        ),
                        t1044,
                      ),
                      t1045,
                    ),
                    t1046,
                  ),
                  t1047,
                ),
                t1048,
              ),
              t1049,
            ),
            t1050,
          ),
          t1051,
        ),
        t1059,
      ),
      t1060,
    ),
    t1061,
  )
  evenperm_transfer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ p : (A) -> A, ∀ q : (B) -> B, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && permutes(p, s) && (∀ x : A, IN(x, s) → q(f(x)) == f(p(x))) && (∀ y : B, !IN(y, IMAGE(f, s)) → q(y) == y) → evenperm(q) == evenperm(p)"),
      t1062,
    ),
  )
}

///|
let evenperm_transfer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_TRANSFER",
)

///|
/// `EVENPERM_TRANSFER`
pub fn evenperm_transfer() -> @kernel.Thm {
  evenperm_transfer_c.get()
}

///|
/// SIGN_TRANSFER
fn step_125() -> Unit raise {
  let t1070 = @simp.rewrite_tac(@list.List([]))
  let t1067 = @drule.match_mp(evenperm_transfer())
  let t1069 = @tactics.disch_then(fn(
    x1068 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1064 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1065 = @tactics.subst1_tac(x1064)
      fn(
        x1066 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1065(x1066)
      }
    })(t1067(x1068))
  })
  let t1063 = @simp.rewrite_tac(@list.List([sign()]))
  let t1071 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1063),
      t1069,
    ),
    t1070,
  )
  sign_transfer_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ p : (A) -> A, ∀ q : (B) -> B, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && permutes(p, s) && (∀ x : A, IN(x, s) → q(f(x)) == f(p(x))) && (∀ y : B, !IN(y, IMAGE(f, s)) → q(y) == y) → sign(q) == sign(p)"),
      t1071,
    ),
  )
}

///|
let sign_transfer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_TRANSFER")

///|
/// `SIGN_TRANSFER`
pub fn sign_transfer() -> @kernel.Thm {
  sign_transfer_c.get()
}

///|
/// SIGN_CARTESIAN_PRODUCT
fn step_126() -> Unit raise {
  let t1117 = @meson.asm_meson_tac(@list.List([]))
  let t1116 = @simp.asm_simp_tac(
    @list.List([@pair.pair_eq(), @sets.in_image(), @pair.forall_pair_thm()]),
  )
  let t1115 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1114 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (x, (b : B))"))
  let t1113 = @tactics.match_mp_tac(sign_transfer())
  let t1112 = @simp.asm_simp_tac(
    @list.List([@sets.card_clauses(), @realax.real_pow(), @sets.in_sing()]),
  )
  let t1110 = @tactics.disch_then(fn(
    x1107 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1108 = @tactics.subst1_tac(x1107)
    fn(
      x1109 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1108(x1109)
    }
  })
  let t1106 = @simp.asm_rewrite_tac(@list.List([permutes_id()]))
  let t1105 = @tactics.match_mp_tac(permutes_cartesian_product())
  let t1104 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_cross_eq(), @sets.finite_sing()]),
  )
  let t1102 = @tactics.exists_tac(
    @term_syntax.parse_term("CROSS((s : (A) -> Bool), (t : (B) -> Bool))"),
  )
  let t1103 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("CROSS((s : (A) -> Bool), {(b : B)})")),
    t1102,
  ])
  let t1111 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([permutation_permutes()])),
              @tactics.conj_tac,
            ),
            t1103,
          ),
          t1104,
        ),
        t1105,
      ),
      t1106,
    ),
    t1110,
  ])
  let t1096 = @drule.part_match(
    fn(x1095 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1095))
    },
    sign_compose(),
  )
  let t1090 = @simp.asm_rewrite_tac(@list.List([]))
  let t1089 = @class.asm_cases_tac(@term_syntax.parse_term("IN((j : B), (t : (B) -> Bool))"))
  let t1088 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t1087 = @class.asm_cases_tac(@term_syntax.parse_term("(j : B) == (b : B)"))
  let t1086 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert()]))
  let t1085 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : A), (s : (A) -> Bool))"))
  let t1083 = @term_syntax.parse_term("(j : B)")
  let t1084 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(i : A)"), t1083]),
  )
  let t1091 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @class.fun_eq_thm(),
                      @pair.forall_pair_thm(),
                      @trivia.o_thm(),
                    ]),
                  ),
                  t1084,
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
    @tactics.all_tac,
  ])
  let t1082 = @tactics.subgoal_then(
    @term_syntax.parse_term("fn { (i, j) => if IN(i, (s : (A) -> Bool)) && IN(j, INSERT((b : B), (t : (B) -> Bool))) { ((p : (A) -> A)(i), j) } else { (i, j) } } == o(fn { (i, j) => if IN(i, s) && IN(j, {b}) { (p(i), j) } else { (i, j) } }, fn { (i, j) => if IN(i, s) && IN(j, t) { (p(i), j) } else { (i, j) } })"),
    fn(
      x1079 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1080 = @tactics.subst1_tac(x1079)
      fn(
        x1081 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1080(x1081)
      }
    },
  )
  let t1076 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1077 = @tactics.then_tac(
    @tactics.map_every(
      @tactics.x_gen_tac,
      @list.List([@term_syntax.parse_term("(b : B)"), t1076]),
    ),
    @tactics.strip_tac,
  )
  let t1075 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@pair.lambda_pair_thm()),
      sign_id(),
      @realax.real_pow(),
    ]),
  )
  let t1078 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@sets.card_clauses(), @sets.not_in_empty()]),
      ),
      t1075,
    ),
    t1077,
  ])
  let t1074 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1073 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1072 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1118 = @tactics.then_tac(
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
                            @tactics.thenl(
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
                                      t1072,
                                    ),
                                    t1073,
                                  ),
                                  t1074,
                                ),
                                @tactics.conj_tac,
                              ),
                              t1078,
                            ),
                            t1082,
                          ),
                          t1091,
                        ),
                        fn(
                          x1101 : (
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
                            x1100 : (
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
                              x1098 : @kernel.Term,
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
                                x1097 : @kernel.Term,
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
                                  x1092 : @kernel.Thm,
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
                                  let s1093 = @tactics.mp_tac(x1092)
                                  fn(
                                    x1094 : (
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
                                    s1093(x1094)
                                  }
                                })(t1096(x1097))
                              })(@equal.lhand(x1098))
                            })(
                              (fn(
                                x1099 : (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> @kernel.Term raise {
                                x1099.1
                              })(x1100),
                            )
                          })(x1101)(x1101)
                        },
                      ),
                      @tactics.ants_tac,
                    ),
                    t1111,
                  ),
                  t1112,
                ),
                @tactics.ap_thm_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t1113,
          ),
          t1114,
        ),
        t1115,
      ),
      t1116,
    ),
    t1117,
  )
  let lemma1 = @tactics.prove(
    @term_syntax.parse_term("∀ p : (A) -> A, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, permutes(p, s) && FINITE(s) && FINITE(t) → sign(fn { (i, j) => if IN(i, s) && IN(j, t) { (p(i), j) } else { (i, j) } }) == pow(sign(p), CARD(t))"),
    t1118,
  )
  let t1135 = @simp.asm_rewrite_tac(@list.List([permutes_id()]))
  let t1134 = @tactics.match_mp_tac(permutes_cartesian_product())
  let t1133 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1132 = @simp.simp_tac(
    @list.List([
      @pair.pair_eq(),
      @sets.in_image(),
      @sets.in_cross(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t1131 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.finite_cross_eq(),
      @pair.forall_pair_thm(),
      @sets.in_cross(),
    ]),
  )
  let t1130 = @tactics.exists_tac(
    @term_syntax.parse_term("CROSS((t : (B) -> Bool), (s : (A) -> Bool))"),
  )
  let t1129 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((B, A)) -> (A, B)) => ∀ i : B, ∀ j : A, GEQ(f((i, j)), (j, i)))"))
  let t1128 = @tactics.match_mp_tac(sign_transfer())
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
      x1123 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1124 = @tactics.subst1_tac(x1123)
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
    })(@equal.sym(x1126))
  })
  let t1122 = @simp.asm_rewrite_tac(@list.List([]))
  let t1119 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1120 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1121 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(p : (B) -> B)"), t1120, t1119]),
      lemma1,
    ),
  )
  let t1136 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t1121,
                        ),
                        t1122,
                      ),
                      t1127,
                    ),
                    t1128,
                  ),
                  t1129,
                ),
                t1130,
              ),
              t1131,
            ),
            t1132,
          ),
          @tactics.conj_tac,
        ),
        t1133,
      ),
      t1134,
    ),
    t1135,
  )
  let lemma2 = @tactics.prove(
    @term_syntax.parse_term("∀ p : (B) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && permutes(p, t) && FINITE(t) → sign(fn { (i, j) => if IN(i, s) && IN(j, t) { (i, p(j)) } else { (i, j) } }) == pow(sign(p), CARD(s))"),
    t1136,
  )
  let t1163 = @simp.asm_simp_tac(@list.List([lemma1, lemma2]))
  let t1161 = @tactics.disch_then(fn(
    x1158 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1159 = @tactics.subst1_tac(x1158)
    fn(
      x1160 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1159(x1160)
    }
  })
  let t1157 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_cross_eq(),
      permutes_cartesian_product(),
      permutes_id(),
    ]),
  )
  let t1156 = @tactics.exists_tac(
    @term_syntax.parse_term("CROSS((s : (A) -> Bool), (t : (B) -> Bool))"),
  )
  let t1162 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([permutation_permutes()])),
          @tactics.conj_tac,
        ),
        t1156,
      ),
      t1157,
    ),
    t1161,
  ])
  let t1149 = @drule.part_match(
    fn(x1148 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1148))
    },
    sign_compose(),
  )
  let t1144 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1143 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([permutes_alt()])),
  )
  let t1142 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([@pair.pair_eq()])),
    ),
  )
  let t1141 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1155 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @class.fun_eq_thm(),
                @pair.forall_pair_thm(),
                @trivia.o_thm(),
              ]),
            ),
            t1141,
          ),
          t1142,
        ),
        t1143,
      ),
      t1144,
    ),
    fn(
      x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1151 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x1150 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x1145 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s1146 = @tactics.mp_tac(x1145)
              fn(
                x1147 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s1146(x1147)
              }
            })(t1149(x1150))
          })(@equal.lhand(x1151))
        })(
          (fn(
            x1152 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x1152.1
          })(x1153),
        )
      })(x1154)(x1154)
    },
  ])
  let t1140 = @tactics.subgoal_then(
    @term_syntax.parse_term("fn { (i, j) => if IN(i, (s : (A) -> Bool)) && IN(j, (t : (B) -> Bool)) { ((p : (A) -> A)(i), (q : (B) -> B)(j)) } else { (i, j) } } == o(fn { (i, j) => if IN(i, s) && IN(j, t) { (p(i), j) } else { (i, j) } }, fn { (i, j) => if IN(i, s) && IN(j, t) { (i, q(j)) } else { (i, j) } })"),
    fn(
      x1137 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1138 = @tactics.subst1_tac(x1137)
      fn(
        x1139 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1138(x1139)
      }
    },
  )
  let t1164 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1140),
          t1155,
        ),
        @tactics.ants_tac,
      ),
      t1162,
    ),
    t1163,
  )
  sign_cartesian_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ q : (B) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) && permutes(p, s) && permutes(q, t) → sign(fn { (i, j) => if IN(i, s) && IN(j, t) { (p(i), q(j)) } else { (i, j) } }) == pow(sign(p), CARD(t)) * pow(sign(q), CARD(s))"),
      t1164,
    ),
  )
}

///|
let sign_cartesian_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SIGN_CARTESIAN_PRODUCT",
)

///|
/// `SIGN_CARTESIAN_PRODUCT`
pub fn sign_cartesian_product() -> @kernel.Thm {
  sign_cartesian_product_c.get()
}

///|
/// PERMUTES_NUMSET_LE
fn step_127() -> Unit raise {
  let t1172 = @meson.asm_meson_tac(
    @list.List([permutes_injective(), @arith.lt_refl()]),
  )
  let t1171 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t1170 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.le_antisym())]))
  let t1169 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([permutes()])),
  ])
  let t1168 = @class.asm_cases_tac(@term_syntax.parse_term("IN((n : Num), (s : (Num) -> Bool))"))
  let t1167 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1166 = @tactics.match_mp_tac(@arith.num_wf())
  let t1165 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.i_thm()]),
  )
  let t1173 = @tactics.then_tac(
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
                      t1165,
                    ),
                    @tactics.strip_tac,
                  ),
                  t1166,
                ),
                t1167,
              ),
              @tactics.disch_tac,
            ),
            t1168,
          ),
          t1169,
        ),
        t1170,
      ),
      t1171,
    ),
    t1172,
  )
  permutes_numset_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Num) -> Num, ∀ s : (Num) -> Bool, permutes(p, s) && (∀ i : Num, IN(i, s) → p(i) <= i) → p == I"),
      t1173,
    ),
  )
}

///|
let permutes_numset_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_NUMSET_LE",
)

///|
/// `PERMUTES_NUMSET_LE`
pub fn permutes_numset_le() -> @kernel.Thm {
  permutes_numset_le_c.get()
}

///|
/// PERMUTES_NUMSET_GE
fn step_128() -> Unit raise {
  let t1176 = @meson.asm_meson_tac(
    @list.List([permutes_inverse_inverse(), inverse_i()]),
  )
  let t1177 = @list.List([
    @meson.asm_meson_tac(
      @list.List([permutes_inverse(), permutes_inverses(), permutes_in_image()]),
    ),
    t1176,
  ])
  let t1174 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t1175 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("inverse((p : (Num) -> Num))"), t1174]),
      permutes_numset_le(),
    ),
  )
  let t1178 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1175),
      @tactics.ants_tac,
    ),
    t1177,
  )
  permutes_numset_ge_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Num) -> Num, ∀ s : (Num) -> Bool, permutes(p, s) && (∀ i : Num, IN(i, s) → i <= p(i)) → p == I"),
      t1178,
    ),
  )
}

///|
let permutes_numset_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_NUMSET_GE",
)

///|
/// `PERMUTES_NUMSET_GE`
pub fn permutes_numset_ge() -> @kernel.Thm {
  permutes_numset_ge_c.get()
}

///|
/// IMAGE_INVERSE_PERMUTATIONS
fn step_129() -> Unit raise {
  let t1179 = @meson.meson_tac(
    @list.List([permutes_inverse_inverse(), permutes_inverse()]),
  )
  let t1180 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()])),
    t1179,
  )
  image_inverse_permutations_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, {inverse((p : (A) -> A)) | permutes(p, s)} == {(p : (A) -> A) | permutes(p, s)}"),
      t1180,
    ),
  )
}

///|
let image_inverse_permutations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_INVERSE_PERMUTATIONS",
)

///|
/// `IMAGE_INVERSE_PERMUTATIONS`
pub fn image_inverse_permutations() -> @kernel.Thm {
  image_inverse_permutations_c.get()
}

///|
/// IMAGE_COMPOSE_PERMUTATIONS_L
fn step_130() -> Unit raise {
  let t1184 = @meson.asm_meson_tac(
    @list.List([permutes_inverses_o(), @trivia.i_o_id()]),
  )
  let t1183 = @simp.asm_simp_tac(
    @list.List([@trivia.o_assoc(), permutes_inverse(), permutes_compose()]),
  )
  let t1185 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.exists_tac(@term_syntax.parse_term("o(inverse((q : (A) -> A)), (p : (A) -> A))")),
      ),
      t1183,
    ),
    t1184,
  )
  let t1186 = @list.List([
    @meson.asm_meson_tac(@list.List([permutes_compose()])),
    t1185,
  ])
  let t1182 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t1181 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1187 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.extension(), @sets.in_elim_thm()]),
            ),
            t1181,
          ),
          @tactics.strip_tac,
        ),
        t1182,
      ),
      @tactics.eq_tac,
    ),
    t1186,
  )
  image_compose_permutations_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ q : (A) -> A, permutes(q, s) → {o(q, (p : (A) -> A)) | permutes(p, s)} == {(p : (A) -> A) | permutes(p, s)}"),
      t1187,
    ),
  )
}

///|
let image_compose_permutations_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_COMPOSE_PERMUTATIONS_L",
)

///|
/// `IMAGE_COMPOSE_PERMUTATIONS_L`
pub fn image_compose_permutations_l() -> @kernel.Thm {
  image_compose_permutations_l_c.get()
}

///|
/// IMAGE_COMPOSE_PERMUTATIONS_R
fn step_131() -> Unit raise {
  let t1191 = @meson.asm_meson_tac(
    @list.List([permutes_inverses_o(), @trivia.i_o_id()]),
  )
  let t1190 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@trivia.o_assoc()),
      permutes_inverse(),
      permutes_compose(),
    ]),
  )
  let t1192 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.exists_tac(@term_syntax.parse_term("o((p : (A) -> A), inverse((q : (A) -> A)))")),
      ),
      t1190,
    ),
    t1191,
  )
  let t1193 = @list.List([
    @meson.asm_meson_tac(@list.List([permutes_compose()])),
    t1192,
  ])
  let t1189 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t1188 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1194 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.extension(), @sets.in_elim_thm()]),
            ),
            t1188,
          ),
          @tactics.strip_tac,
        ),
        t1189,
      ),
      @tactics.eq_tac,
    ),
    t1193,
  )
  image_compose_permutations_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ q : (A) -> A, permutes(q, s) → {o((p : (A) -> A), q) | permutes(p, s)} == {(p : (A) -> A) | permutes(p, s)}"),
      t1194,
    ),
  )
}

///|
let image_compose_permutations_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_COMPOSE_PERMUTATIONS_R",
)

///|
/// `IMAGE_COMPOSE_PERMUTATIONS_R`
pub fn image_compose_permutations_r() -> @kernel.Thm {
  image_compose_permutations_r_c.get()
}

///|
/// PERMUTES_IN_NUMSEG
fn step_132() -> Unit raise {
  let t1195 = @meson.meson_tac(@list.List([]))
  let t1196 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes(), @iterate.in_numseg()])),
    t1195,
  )
  permutes_in_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (Num) -> Num, ∀ n : Num, ∀ i : Num, permutes(p, op_dot_dot(1, n)) && IN(i, op_dot_dot(1, n)) → 1 <= p(i) && p(i) <= n"),
      t1196,
    ),
  )
}

///|
let permutes_in_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_IN_NUMSEG",
)

///|
/// `PERMUTES_IN_NUMSEG`
pub fn permutes_in_numseg() -> @kernel.Thm {
  permutes_in_numseg_c.get()
}

///|
/// SUM_PERMUTATIONS_INVERSE
fn step_133() -> Unit raise {
  let t1217 = @meson.meson_tac(@list.List([permutes_inverse_inverse()]))
  let t1216 = @simp.simp_tac(
    @list.List([
      finite_permutations(),
      @iterate.finite_numseg(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1215 = @tactics.match_mp_tac(@iterate.sum_image())
  let t1214 = @simp.gen_rewrite_tac(
    fn(
      x1213 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1207 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1208 = @equal.rand_conv(x1207)
        fn(x1209 : @kernel.Term) -> @kernel.Thm raise { s1208(x1209) }
      })(
        (fn(
          x1210 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1211 = @equal.rand_conv(x1210)
          fn(x1212 : @kernel.Term) -> @kernel.Thm raise { s1211(x1212) }
        })(x1213),
      )
    },
    @list.List([@equal.gsym(@trivia.o_def())]),
  )
  let t1206 = @simp.gen_rewrite_tac(
    (x1205 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1202 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1203 = @equal.land_conv(x1202)
          fn(x1204 : @kernel.Term) -> @kernel.Thm raise { s1203(x1204) }
        },
        x1205,
      )
    },
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | (p : (_) -> Bool)(x)} == IMAGE(f, {(x : _) | p(x)})")),
    ]),
  )
  let t1201 = @simp.gen_rewrite_tac(
    (x1200 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1197 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1198 = @equal.land_conv(x1197)
          fn(x1199 : @kernel.Term) -> @kernel.Thm raise { s1198(x1199) }
        },
        x1200,
      )
    },
    @list.List([@equal.gsym(image_inverse_permutations())]),
  )
  let t1218 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1201),
            t1206,
          ),
          t1214,
        ),
        t1215,
      ),
      t1216,
    ),
    t1217,
  )
  sum_permutations_inverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((Num) -> Num) -> Real, ∀ m : Num, ∀ n : Num, sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, f) == sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, (p : (Num) -> Num) => f(inverse(p)))"),
      t1218,
    ),
  )
}

///|
let sum_permutations_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PERMUTATIONS_INVERSE",
)

///|
/// `SUM_PERMUTATIONS_INVERSE`
pub fn sum_permutations_inverse() -> @kernel.Thm {
  sum_permutations_inverse_c.get()
}

///|
/// SUM_PERMUTATIONS_COMPOSE_L
fn step_134() -> Unit raise {
  let t1257 = @simp.rewrite_tac(@list.List([@trivia.i_o_id()]))
  let t1253 = @drule.match_mp(permutes_inverses_o())
  let t1254 = @tactics.conjuncts_then(fn(
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
    let s1251 = @tactics.subst1_tac(x1250)
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
  let t1256 = @tactics.every_assum(fn(
    x1255 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1254(t1253(x1255))
  })
  let t1249 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t1245 = @term_syntax.parse_term("(p : (Num) -> Num) => o(inverse((q : (Num) -> Num)), p)")
  let t1248 = @tactics.first_x_assum(fn(
    x1247 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1242 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1243 = @tactics.mp_tac(x1242)
      fn(
        x1244 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1243(x1244)
      }
    })(((x1246 : @kernel.Thm) => @equal.ap_term(t1245, x1246))(x1247))
  })
  let t1241 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1240 = @simp.simp_tac(
    @list.List([
      finite_permutations(),
      @iterate.finite_numseg(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1239 = @tactics.match_mp_tac(@iterate.sum_image())
  let t1238 = @simp.gen_rewrite_tac(
    fn(
      x1237 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1231 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1232 = @equal.rand_conv(x1231)
        fn(x1233 : @kernel.Term) -> @kernel.Thm raise { s1232(x1233) }
      })(
        (fn(
          x1234 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1235 = @equal.rand_conv(x1234)
          fn(x1236 : @kernel.Term) -> @kernel.Thm raise { s1235(x1236) }
        })(x1237),
      )
    },
    @list.List([@equal.gsym(@trivia.o_def())]),
  )
  let t1230 = @simp.gen_rewrite_tac(
    (x1229 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1226 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1227 = @equal.land_conv(x1226)
          fn(x1228 : @kernel.Term) -> @kernel.Thm raise { s1227(x1228) }
        },
        x1229,
      )
    },
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | (p : (_) -> Bool)(x)} == IMAGE(f, {(x : _) | p(x)})")),
    ]),
  )
  let t1225 = @tactics.first_assum(fn(
    x1219 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1219
    @simp.gen_rewrite_tac(
      (x1224 : (@kernel.Term) -> @kernel.Thm raise) => {
        @lib.funpow(
          2,
          fn(
            x1221 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1222 = @equal.land_conv(x1221)
            fn(x1223 : @kernel.Term) -> @kernel.Thm raise { s1222(x1223) }
          },
          x1224,
        )
      },
      @list.List([
        @equal.gsym(@drule.match_mp(image_compose_permutations_l())(th)),
      ]),
    )
  })
  let t1258 = @tactics.then_tac(
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
                      t1225,
                    ),
                    t1230,
                  ),
                  t1238,
                ),
                t1239,
              ),
              t1240,
            ),
            t1241,
          ),
          t1248,
        ),
        t1249,
      ),
      t1256,
    ),
    t1257,
  )
  sum_permutations_compose_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((Num) -> Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ q : (Num) -> Num, permutes(q, op_dot_dot(m, n)) → sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, f) == sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, (p : (Num) -> Num) => f(o(q, p)))"),
      t1258,
    ),
  )
}

///|
let sum_permutations_compose_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PERMUTATIONS_COMPOSE_L",
)

///|
/// `SUM_PERMUTATIONS_COMPOSE_L`
pub fn sum_permutations_compose_l() -> @kernel.Thm {
  sum_permutations_compose_l_c.get()
}

///|
/// SUM_PERMUTATIONS_COMPOSE_R
fn step_135() -> Unit raise {
  let t1297 = @simp.rewrite_tac(@list.List([@trivia.i_o_id()]))
  let t1293 = @drule.match_mp(permutes_inverses_o())
  let t1294 = @tactics.conjuncts_then(fn(
    x1290 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1291 = @tactics.subst1_tac(x1290)
    fn(
      x1292 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1291(x1292)
    }
  })
  let t1296 = @tactics.every_assum(fn(
    x1295 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1294(t1293(x1295))
  })
  let t1289 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t1285 = @term_syntax.parse_term("(p : (Num) -> Num) => o(p, inverse((q : (Num) -> Num)))")
  let t1288 = @tactics.first_x_assum(fn(
    x1287 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1282 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1283 = @tactics.mp_tac(x1282)
      fn(
        x1284 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1283(x1284)
      }
    })(((x1286 : @kernel.Thm) => @equal.ap_term(t1285, x1286))(x1287))
  })
  let t1281 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1280 = @simp.simp_tac(
    @list.List([
      finite_permutations(),
      @iterate.finite_numseg(),
      @sets.in_elim_thm(),
    ]),
  )
  let t1279 = @tactics.match_mp_tac(@iterate.sum_image())
  let t1278 = @simp.gen_rewrite_tac(
    fn(
      x1277 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1271 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1272 = @equal.rand_conv(x1271)
        fn(x1273 : @kernel.Term) -> @kernel.Thm raise { s1272(x1273) }
      })(
        (fn(
          x1274 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1275 = @equal.rand_conv(x1274)
          fn(x1276 : @kernel.Term) -> @kernel.Thm raise { s1275(x1276) }
        })(x1277),
      )
    },
    @list.List([@equal.gsym(@trivia.o_def())]),
  )
  let t1270 = @simp.gen_rewrite_tac(
    (x1269 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1266 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1267 = @equal.land_conv(x1266)
          fn(x1268 : @kernel.Term) -> @kernel.Thm raise { s1267(x1268) }
        },
        x1269,
      )
    },
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | (p : (_) -> Bool)(x)} == IMAGE(f, {(x : _) | p(x)})")),
    ]),
  )
  let t1265 = @tactics.first_assum(fn(
    x1259 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1259
    @simp.gen_rewrite_tac(
      (x1264 : (@kernel.Term) -> @kernel.Thm raise) => {
        @lib.funpow(
          2,
          fn(
            x1261 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1262 = @equal.land_conv(x1261)
            fn(x1263 : @kernel.Term) -> @kernel.Thm raise { s1262(x1263) }
          },
          x1264,
        )
      },
      @list.List([
        @equal.gsym(@drule.match_mp(image_compose_permutations_r())(th)),
      ]),
    )
  })
  let t1298 = @tactics.then_tac(
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
                      t1265,
                    ),
                    t1270,
                  ),
                  t1278,
                ),
                t1279,
              ),
              t1280,
            ),
            t1281,
          ),
          t1288,
        ),
        t1289,
      ),
      t1296,
    ),
    t1297,
  )
  sum_permutations_compose_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((Num) -> Num) -> Real, ∀ m : Num, ∀ n : Num, ∀ q : (Num) -> Num, permutes(q, op_dot_dot(m, n)) → sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, f) == sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, (p : (Num) -> Num) => f(o(p, q)))"),
      t1298,
    ),
  )
}

///|
let sum_permutations_compose_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_PERMUTATIONS_COMPOSE_R",
)

///|
/// `SUM_PERMUTATIONS_COMPOSE_R`
pub fn sum_permutations_compose_r() -> @kernel.Thm {
  sum_permutations_compose_r_c.get()
}

///|
/// CARD_EVEN_PERMUTATIONS
fn step_136() -> Unit raise {
  let t1350 = @simp.asm_simp_tac(
    @list.List([swap_idempotent(), @trivia.o_assoc(), @trivia.i_o_id()]),
  )
  let t1349 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, (f : (_) -> _)(f(x)) == x) → (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) && P(y) && f(x) == f(y) → x == y)"),
    ),
  )
  let t1348 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t1347 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t1346 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(b : Num) == (a : Num) → 2 * a == a + b")),
  )
  let t1344 = @tactics.disch_then(fn(
    x1341 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1342 = @tactics.subst1_tac(x1341)
    fn(
      x1343 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1342(x1343)
    }
  })
  let t1340 = @simp.asm_rewrite_tac(@list.List([evenperm_swap()]))
  let t1339 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), evenperm_compose(), permutation_swap()]),
  )
  let t1345 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @sets.set_rule(
            @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → !P((f : (_) -> _)(x))) → INTER({(x : _) | P(x)}, IMAGE(f, {(x : _) | P(x)})) == {}"),
          ),
        ),
        t1339,
      ),
      t1340,
    ),
    t1344,
  ])
  let t1338 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t1332 = @drule.part_match(
    fn(x1331 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(@kernel.rand(x1331))
    },
    @sets.card_union(),
  )
  let t1351 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  fn(
                    x1337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      x1336 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        x1334 : @kernel.Term,
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
                          x1333 : @kernel.Term,
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
                            x1328 : @kernel.Thm,
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
                            let s1329 = @tactics.mp_tac(x1328)
                            fn(
                              x1330 : (
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
                              s1329(x1330)
                            }
                          })(t1332(x1333))
                        })(@kernel.rand(x1334))
                      })(
                        (fn(
                          x1335 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
                        ) -> @kernel.Term raise {
                          x1335.1
                        })(x1336),
                      )
                    })(x1337)(x1337)
                  },
                  t1338,
                ),
                @tactics.ants_tac,
              ),
              t1345,
            ),
            t1346,
          ),
          t1347,
        ),
        t1348,
      ),
      t1349,
    ),
    t1350,
  )
  let t1327 = @tactics.conv_tac(@class.taut)
  let t1326 = @simp.asm_simp_tac(
    @list.List([
      permutes_compose(),
      permutes_swap(),
      swap_idempotent(),
      @trivia.o_assoc(),
      @trivia.i_o_id(),
      evenperm_compose(),
      permutation_swap(),
      evenperm_swap(),
    ]),
  )
  let t1325 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → P((f : (_) -> _)(x))) && (∀ x : _, f(f(x)) == x) && (∀ x : _, P(x) → (Q : (_) -> Bool)(x) || Q(f(x))) → {(x : _) | P(x)} == UNION({(x : _) | P(x) && Q(x)}, IMAGE(f, {(x : _) | P(x) && Q(x)}))"),
    ),
  )
  let t1323 = @drule.match_mp(card_permutations())
  let t1352 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_assum(fn(
              x1324 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                (fn(
                  x1319 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s1320 = @tactics.subst1_tac(x1319)
                  fn(
                    x1321 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s1320(x1321)
                  }
                })(@equal.sym(x1322))
              })(t1323(x1324))
            }),
            @tactics.ap_term_tac,
          ),
          t1325,
        ),
        t1326,
      ),
      t1327,
    ),
    t1351,
  ])
  let t1318 = @tactics.subgoal_then(
    @term_syntax.parse_term("FACT(CARD((s : (A) -> Bool))) == CARD(UNION({(p : (A) -> A) | permutes(p, s) && evenperm(p)}, IMAGE((p : (A) -> A) => o(swap(((a : A), (b : A))), p), {(p : (A) -> A) | permutes(p, s) && evenperm(p)})))"),
    fn(
      x1315 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1316 = @tactics.subst1_tac(x1315)
      fn(
        x1317 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1316(x1317)
      }
    },
  )
  let t1313 = @simp.asm_simp_tac(
    @list.List([@sets.finite_restrict(), finite_permutations()]),
  )
  let t1314 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.set_rule(
            @term_syntax.parse_term("{(p : (_) -> _) | permutes(p, (s : (_) -> Bool)) && (Q : ((_) -> _) -> Bool)(p)} == {(p : (_) -> _) | IN(p, {(p : (_) -> _) | permutes(p, s)}) && Q(p)}"),
          ),
        ]),
      ),
      t1313,
    ),
    @tactics.all_tac,
  ])
  let t1312 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ Q : ((A) -> A) -> Bool, FINITE({(p : (A) -> A) | permutes(p, (s : (A) -> Bool)) && Q(p)})"),
    fn(
      x1309 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1310 = @tactics.assume_tac(x1309)
      fn(
        x1311 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1310(x1311)
      }
    },
  )
  let t1308 = @list.List([
    @meson.asm_meson_tac(@list.List([permutation_permutes()])),
    @tactics.all_tac,
  ])
  let t1307 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ p : (A) -> A, permutes(p, (s : (A) -> Bool)) → permutation(p)"),
    fn(
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
      let s1305 = @tactics.assume_tac(x1304)
      fn(
        x1306 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1305(x1306)
      }
    },
  )
  let t1302 = @sets.set_tac(@list.List([]))
  let t1301 = @simp.asm_rewrite_tac(
    @list.List([@sets.has_size_conv(@term_syntax.parse_term("HAS_SIZE((s : (_) -> Bool), 2)"))]),
  )
  let t1300 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1303 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.specl(
            @list.List([@term_syntax.parse_term("2"), t1300]),
            @sets.choose_subset_strong(),
          ),
        ),
        t1301,
      ),
      t1302,
    ),
    @tactics.all_tac,
  ])
  let t1299 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ a : A, ∃ b : A, IN(a, (s : (A) -> Bool)) && IN(b, s) && !(a == b)"),
    @tactics.strip_assume_tac,
  )
  let t1353 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t1299,
                ),
                t1303,
              ),
              t1307,
            ),
            t1308,
          ),
          t1312,
        ),
        t1314,
      ),
      t1318,
    ),
    t1352,
  )
  card_even_permutations_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) && 2 <= CARD(s) → 2 * CARD({(p : (A) -> A) | permutes(p, s) && evenperm(p)}) == FACT(CARD(s))"),
      t1353,
    ),
  )
}

///|
let card_even_permutations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_EVEN_PERMUTATIONS",
)

///|
/// `CARD_EVEN_PERMUTATIONS`
pub fn card_even_permutations() -> @kernel.Thm {
  card_even_permutations_c.get()
}

///|
/// PERMUTES_INVOLUTION
fn step_137() -> Unit raise {
  let t1356 = @meson.asm_meson_tac(@list.List([]))
  let t1355 = @tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t1354 = @tactics.match_mp_tac(permutes_bijections())
  let t1357 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1354),
      t1355,
    ),
    t1356,
  )
  permutes_involution_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ s : (A) -> Bool, (∀ x : A, p(p(x)) == x) && (∀ x : A, !IN(x, s) → p(x) == x) → permutes(p, s)"),
      t1357,
    ),
  )
}

///|
let permutes_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_INVOLUTION",
)

///|
/// `PERMUTES_INVOLUTION`
pub fn permutes_involution() -> @kernel.Thm {
  permutes_involution_c.get()
}

///|
/// SIGN_INVOLUTION
fn step_138() -> Unit raise {
  let t1420 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1421 = @tactics.then_tac(
    @tactics.match_mp_tac(@sets.card_subset()),
    t1420,
  )
  let t1419 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1422 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @sets.card_clauses(),
          @sets.finite_rules(),
          @sets.in_sing(),
          @sets.not_in_empty(),
        ]),
      ),
      t1419,
    ),
    t1421,
  ])
  let t1417 = @term_syntax.parse_term("CARD({(a : A), (p : (A) -> A)(a)})")
  let t1418 = @tactics.trans_tac(@arith.le_trans())(t1417)
  let t1416 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → n - 1 - 1 + 2 == n")),
  )
  let t1415 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("(m : Num) + 2 == (n : Num) → SUC(DIV(m, 2)) == DIV(n, 2)")),
  )
  let t1414 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(@realax.real_pow()))]),
  )
  let t1412 = @simp.asm_simp_tac(
    @list.List([
      @sets.card_delete(),
      @sets.in_elim_thm(),
      @sets.finite_delete(),
      @sets.in_delete(),
    ]),
  )
  let t1411 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1410 = @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t1413 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t1410),
      t1411,
    ),
    t1412,
  ])
  let t1409 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE({(x : A) | !((p : (A) -> A)(x) == x)})"),
    fn(
      x1406 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1407 = @tactics.assume_tac(x1406)
      fn(
        x1408 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1407(x1408)
      }
    },
  )
  let t1405 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t1404 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(x : A) | !((p : (A) -> A)(if x == (a : A) { p(a) } else { if x == p(a) { a } else { x } }) == x)} == DELETE(DELETE({(x : A) | !(p(x) == x)}, a), p(a))"),
    fn(
      x1401 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1402 = @tactics.subst1_tac(x1401)
      fn(
        x1403 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1402(x1403)
      }
    },
  )
  let t1400 = @tactics.match_mp_tac(
    @calc_rat.real_ring(
      @term_syntax.parse_term("-real_of_num(1) * (a : Real) == (b : Real) → (s : Real) * -real_of_num(1) == a → s == b"),
    ),
  )
  let t1399 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1398 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), swap()]))
  let t1397 = @simp.asm_simp_tac(
    @list.List([sign_compose(), permutation_swap(), sign_swap()]),
  )
  let t1393 = @term_syntax.parse_term("o((p : (A) -> A), swap(((a : A), p(a))))")
  let t1396 = @tactics.disch_then(fn(
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
    (fn(
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
      let s1391 = @tactics.mp_tac(x1390)
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
    })(((x1394 : @kernel.Thm) => @bool.spec(t1393, x1394))(x1395))
  })
  let t1389 = @list.List([
    @meson.asm_meson_tac(
      @list.List([permutation_permutes(), permutes_involution()]),
    ),
    @tactics.all_tac,
  ])
  let t1388 = @tactics.subgoal_then(@term_syntax.parse_term("permutation((p : (A) -> A))"), fn(
    x1385 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1386 = @tactics.assume_tac(x1385)
    fn(
      x1387 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1386(x1387)
    }
  })
  let t1384 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t1383 = @simp.asm_simp_tac(
    @list.List([
      @sets.card_eq_0(),
      @int.arith_rule(@term_syntax.parse_term("((n : Num) - 1 - 1 < n) == !(n == 0)")),
    ]),
  )
  let t1382 = @simp.asm_simp_tac(
    @list.List([@sets.card_delete(), @sets.finite_delete(), @sets.in_delete()]),
  )
  let t1378 = @term_syntax.parse_term("DELETE(DELETE((s : (A) -> Bool), (a : A)), (p : (A) -> A)(a))")
  let t1381 = @tactics.first_x_assum(fn(
    x1380 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s1376 = @tactics.mp_tac(x1375)
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
    })(((x1379 : @kernel.Thm) => @bool.spec(t1378, x1379))(x1380))
  })
  let t1374 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1373 = @tactics.subgoal_then(
    @term_syntax.parse_term("IN((a : A), (s : (A) -> Bool)) && IN((p : (A) -> A)(a), s)"),
    @tactics.strip_assume_tac,
  )
  let t1372 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t1371 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      @trivia.i_thm(),
      @class.not_forall_thm(),
    ]),
  )
  let t1368 = @simp.gen_rewrite_rule(
    fn(
      x1365 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1366 = @equal.rand_conv(x1365)
      fn(x1367 : @kernel.Term) -> @kernel.Thm raise { s1366(x1367) }
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1370 = @tactics.first_x_assum(fn(
    x1369 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1362 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1363 = @tactics.mp_tac(x1362)
      fn(
        x1364 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1363(x1364)
      }
    })(t1368(x1369))
  })
  let t1361 = @simp.asm_simp_tac(
    @list.List([
      @trivia.i_thm(),
      @sets.empty_gspec(),
      @sets.card_clauses(),
      sign_i(),
      @arith.div_0(),
      @realax.real_pow(),
      @calc_num.arith_eq(),
    ]),
  )
  let t1360 = @class.asm_cases_tac(@term_syntax.parse_term("(p : (A) -> A) == I"))
  let t1359 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1358 = @wf.wf_induct_tac(@term_syntax.parse_term("CARD((s : (A) -> Bool))"))
  let t1423 = @tactics.thenl(
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
                                                                @tactics.then_tac(
                                                                  @tactics.then_tac(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @simp.once_rewrite_tac(
                                                                          @list.List([
                                                                              @theorems.swap_forall_thm(),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        @tactics.gen_tac,
                                                                      ),
                                                                      t1358,
                                                                    ),
                                                                    t1359,
                                                                  ),
                                                                  t1360,
                                                                ),
                                                                t1361,
                                                              ),
                                                              t1370,
                                                            ),
                                                            t1371,
                                                          ),
                                                          t1372,
                                                        ),
                                                        @tactics.disch_tac,
                                                      ),
                                                      t1373,
                                                    ),
                                                    t1374,
                                                  ),
                                                  t1381,
                                                ),
                                                t1382,
                                              ),
                                              t1383,
                                            ),
                                            @tactics.ants_tac,
                                          ),
                                          t1384,
                                        ),
                                        t1388,
                                      ),
                                      t1389,
                                    ),
                                    t1396,
                                  ),
                                  t1397,
                                ),
                                t1398,
                              ),
                              @tactics.ants_tac,
                            ),
                            t1399,
                          ),
                          t1400,
                        ),
                        t1404,
                      ),
                      t1405,
                    ),
                    t1409,
                  ),
                  t1413,
                ),
                t1414,
              ),
              @tactics.ap_term_tac,
            ),
            t1415,
          ),
          t1416,
        ),
        t1418,
      ),
      @tactics.conj_tac,
    ),
    t1422,
  )
  sign_involution_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, p(p(x)) == x) && (∀ x : A, !IN(x, s) → p(x) == x) → sign(p) == pow(-real_of_num(1), DIV(CARD({(x : A) | !(p(x) == x)}), 2))"),
      t1423,
    ),
  )
}

///|
let sign_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SIGN_INVOLUTION",
)

///|
/// `SIGN_INVOLUTION`
pub fn sign_involution() -> @kernel.Thm {
  sign_involution_c.get()
}

///|
/// PERMUTES_CYCLIC
fn step_139() -> Unit raise {
  let t1426 = @simp.simp_tac(
    @list.List([
      @arith.mod_cases(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x + 1 < 2 * n")),
    ]),
  )
  let t1425 = @simp.simp_tac(@list.List([]))
  let t1424 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj(), @sets.in_elim_thm()]),
  )
  let t1427 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.simp_tac(
              @list.List([permutes_finite_injective(), @sets.finite_numseg_lt()]),
            ),
          ),
          t1424,
        ),
        t1425,
      ),
      t1426,
    ),
    @int.arith_tac,
  )
  permutes_cyclic_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, permutes((i : Num) => if i < n { MOD(i + 1, n) } else { i }, {(i : Num) | i < n})"),
      t1427,
    ),
  )
}

///|
let permutes_cyclic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_CYCLIC",
)

///|
/// `PERMUTES_CYCLIC`
pub fn permutes_cyclic() -> @kernel.Thm {
  permutes_cyclic_c.get()
}

///|
/// PERMUTES_CYCLIC_N
fn step_140() -> Unit raise {
  let t1440 = @simp.asm_rewrite_tac(@list.List([permutes_cyclic()]))
  let t1441 = @tactics.then_tac(
    @tactics.match_mp_tac(permutes_compose()),
    t1440,
  )
  let t1439 = @meson.meson_tac(
    @list.List([@arith.mod_add_mod(), @arith.mod_mod_refl()]),
  )
  let t1438 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1437 = @simp.asm_rewrite_tac(@list.List([@arith.mod_lt_eq()]))
  let t1436 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) < (n : Num)"))
  let t1435 = @simp.asm_rewrite_tac(@list.List([@bool.conjunct1(@arith.lt())]))
  let t1434 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1433 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1442 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@class.fun_eq_thm(), @trivia.o_thm()]),
                  ),
                  t1433,
                ),
                t1434,
              ),
              t1435,
            ),
            t1436,
          ),
          t1437,
        ),
        t1438,
      ),
      t1439,
    ),
    t1441,
  ])
  let t1432 = @tactics.subgoal_then(
    @term_syntax.parse_term("((i : Num) => if i < (n : Num) { MOD(SUC(i + (k : Num)), n) } else { i }) == o((i : Num) => if i < n { MOD(i + 1, n) } else { i }, (i : Num) => if i < n { MOD(i + k, n) } else { i })"),
    fn(
      x1429 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1430 = @tactics.subst1_tac(x1429)
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
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1430(x1431)
      }
    },
  )
  let t1428 = @simp.simp_tac(
    @list.List([
      @arith.add_clauses(),
      @arith.mod_lt(),
      @class.cond_id(),
      permutes_id(),
    ]),
  )
  let t1443 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
        t1428,
      ),
      t1432,
    ),
    t1442,
  )
  permutes_cyclic_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, permutes((i : Num) => if i < n { MOD(i + k, n) } else { i }, {(i : Num) | i < n})"),
      t1443,
    ),
  )
}

///|
let permutes_cyclic_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTES_CYCLIC_N",
)

///|
/// `PERMUTES_CYCLIC_N`
pub fn permutes_cyclic_n() -> @kernel.Thm {
  permutes_cyclic_n_c.get()
}

///|
/// PERMUTATION_CYCLIC
fn step_141() -> Unit raise {
  let t1445 = @simp.asm_rewrite_tac(
    @list.List([permutes_cyclic(), @sets.finite_numseg_lt()]),
  )
  let t1444 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | i < (n : Num)}"))
  let t1446 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([permutation_permutes()])),
      ),
      t1444,
    ),
    t1445,
  )
  permutation_cyclic_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, permutation((i : Num) => if i < n { MOD(i + 1, n) } else { i })"),
      t1446,
    ),
  )
}

///|
let permutation_cyclic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_CYCLIC",
)

///|
/// `PERMUTATION_CYCLIC`
pub fn permutation_cyclic() -> @kernel.Thm {
  permutation_cyclic_c.get()
}

///|
/// PERMUTATION_CYCLIC_N
fn step_142() -> Unit raise {
  let t1449 = @simp.asm_rewrite_tac(
    @list.List([permutes_cyclic_n(), @sets.finite_numseg_lt()]),
  )
  let t1448 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | i < (n : Num)}"))
  let t1447 = @simp.rewrite_tac(@list.List([permutation_permutes()]))
  let t1450 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1447),
      t1448,
    ),
    t1449,
  )
  permutation_cyclic_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, permutation((i : Num) => if i < n { MOD(i + k, n) } else { i })"),
      t1450,
    ),
  )
}

///|
let permutation_cyclic_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PERMUTATION_CYCLIC_N",
)

///|
/// `PERMUTATION_CYCLIC_N`
pub fn permutation_cyclic_n() -> @kernel.Thm {
  permutation_cyclic_n_c.get()
}

///|
/// EVENPERM_CYCLIC
fn step_143() -> Unit raise {
  let t1466 = @meson.meson_tac(@list.List([@arith.odd()]))
  let t1465 = @simp.rewrite_tac(@list.List([evenperm_swap()]))
  let t1467 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          evenperm_compose(),
          permutation_swap(),
          permutation_cyclic(),
        ]),
      ),
      t1465,
    ),
    t1466,
  )
  let t1464 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) < (n : Num) → m < SUC(n)"))]),
  )
  let t1463 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) < (n : Num)"))
  let t1462 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(m : Num) + 1 < (n : Num) → m < n && m < SUC(n)")),
    ]),
  )
  let t1461 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) + 1 < (n : Num)"))
  let t1460 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1459 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) + 1 < SUC((n : Num))) == (m < n)"))]),
  )
  let t1458 = @tactics.pop_assum_list(fn(
    x1457 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t1456 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.o_thm(), swap()]),
  )
  let t1468 = @list.List([
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
                        @simp.simp_tac(
                          @list.List([
                            @arith.mod_cases(),
                            @int.arith_rule(
                              @term_syntax.parse_term("(x : Num) < (n : Num) → x + 1 < 2 * n"),
                            ),
                          ]),
                        ),
                        t1456,
                      ),
                      t1458,
                    ),
                    t1459,
                  ),
                  t1460,
                ),
                t1461,
              ),
              t1462,
            ),
            @list.List([@int.asm_arith_tac, @tactics.all_tac]),
          ),
          t1463,
        ),
        t1464,
      ),
      @int.asm_arith_tac,
    ),
    t1467,
  ])
  let t1455 = @tactics.subgoal_then(
    @term_syntax.parse_term("((i : Num) => if i < SUC((n : Num)) { MOD(i + 1, SUC(n)) } else { i }) == o(swap((0, n)), (i : Num) => if i < n { MOD(i + 1, n) } else { i })"),
    fn(
      x1452 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1453 = @tactics.subst1_tac(x1452)
      fn(
        x1454 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1453(x1454)
      }
    },
  )
  let t1451 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t1469 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @nums.induct_tac,
          @simp.rewrite_tac(
            @list.List([
              @bool.conjunct1(@arith.lt()),
              evenperm_id(),
              @arith.odd(),
            ]),
          ),
        ),
        t1451,
      ),
      t1455,
    ),
    t1468,
  )
  evenperm_cyclic_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, evenperm((i : Num) => if i < n { MOD(i + 1, n) } else { i }) == (n == 0 || ODD(n))"),
      t1469,
    ),
  )
}

///|
let evenperm_cyclic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_CYCLIC",
)

///|
/// `EVENPERM_CYCLIC`
pub fn evenperm_cyclic() -> @kernel.Thm {
  evenperm_cyclic_c.get()
}

///|
/// EVENPERM_CYCLIC_N
fn step_144() -> Unit raise {
  let t1487 = @meson.meson_tac(@list.List([@arith.not_even()]))
  let t1486 = @simp.asm_rewrite_tac(@list.List([]))
  let t1485 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1484 = @simp.rewrite_tac(
    @list.List([evenperm_cyclic(), @arith.even(), @arith.not_even()]),
  )
  let t1483 = @simp.asm_simp_tac(
    @list.List([evenperm_compose(), permutation_cyclic_n()]),
  )
  let t1481 = @meson.meson_tac(
    @list.List([@arith.mod_add_mod(), @arith.mod_mod_refl()]),
  )
  let t1480 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1479 = @simp.asm_rewrite_tac(@list.List([@arith.mod_lt_eq()]))
  let t1478 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) < (n : Num)"))
  let t1477 = @simp.asm_rewrite_tac(@list.List([@bool.conjunct1(@arith.lt())]))
  let t1476 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1475 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1482 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@class.fun_eq_thm(), @trivia.o_thm()]),
                  ),
                  t1475,
                ),
                t1476,
              ),
              t1477,
            ),
            t1478,
          ),
          t1479,
        ),
        t1480,
      ),
      t1481,
    ),
    @tactics.all_tac,
  ])
  let t1474 = @tactics.subgoal_then(
    @term_syntax.parse_term("((i : Num) => if i < (n : Num) { MOD(SUC(i + (k : Num)), n) } else { i }) == o((i : Num) => if i < n { MOD(i + 1, n) } else { i }, (i : Num) => if i < n { MOD(i + k, n) } else { i })"),
    fn(
      x1471 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1472 = @tactics.subst1_tac(x1471)
      fn(
        x1473 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1472(x1473)
      }
    },
  )
  let t1470 = @simp.simp_tac(
    @list.List([
      @arith.add_clauses(),
      @arith.mod_lt(),
      @class.cond_id(),
      evenperm_id(),
      @calc_num.arith(),
    ]),
  )
  let t1488 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
                  t1470,
                ),
                t1474,
              ),
              t1482,
            ),
            t1483,
          ),
          t1484,
        ),
        t1485,
      ),
      t1486,
    ),
    t1487,
  )
  evenperm_cyclic_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, evenperm((i : Num) => if i < n { MOD(i + k, n) } else { i }) == (n == 0 || ODD(n) || EVEN(k))"),
      t1488,
    ),
  )
}

///|
let evenperm_cyclic_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EVENPERM_CYCLIC_N",
)

///|
/// `EVENPERM_CYCLIC_N`
pub fn evenperm_cyclic_n() -> @kernel.Thm {
  evenperm_cyclic_n_c.get()
}

///|
/// SIGN_CYCLIC
fn step_145() -> Unit raise {
  let t1492 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 1 || n == 0)")),
    ]),
  )
  let t1491 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_refl(), @calc_num.arith()]),
  )
  let t1490 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1489 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_pow_neg(),
      @real.real_pow_one(),
      @arith.even_sub(),
      @calc_num.arith(),
      @arith.not_even(),
    ]),
  )
  let t1493 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([sign(), evenperm_cyclic()])),
          ),
          t1489,
        ),
        t1490,
      ),
      t1491,
    ),
    t1492,
  )
  sign_cyclic_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, sign((i : Num) => if i < n { MOD(i + 1, n) } else { i }) == pow(-real_of_num(1), n - 1)"),
      t1493,
    ),
  )
}

///|
let sign_cyclic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_CYCLIC")

///|
/// `SIGN_CYCLIC`
pub fn sign_cyclic() -> @kernel.Thm {
  sign_cyclic_c.get()
}

///|
/// SIGN_CYCLIC_N
fn step_146() -> Unit raise {
  let t1499 = @meson.meson_tac(@list.List([]))
  let t1498 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 1 || n == 0)")),
    ]),
  )
  let t1497 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_refl(), @calc_num.arith()]),
  )
  let t1496 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1495 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_pow_neg(),
      @real.real_pow_one(),
      @arith.even_mult(),
      @arith.even_sub(),
      @calc_num.arith(),
      @arith.not_even(),
    ]),
  )
  let t1494 = @simp.rewrite_tac(@list.List([sign(), evenperm_cyclic_n()]))
  let t1500 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1494),
            t1495,
          ),
          t1496,
        ),
        t1497,
      ),
      t1498,
    ),
    t1499,
  )
  sign_cyclic_n_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ k : Num, sign((i : Num) => if i < n { MOD(i + k, n) } else { i }) == pow(-real_of_num(1), k * (n - 1))"),
      t1500,
    ),
  )
}

///|
let sign_cyclic_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_CYCLIC_N")

///|
/// `SIGN_CYCLIC_N`
pub fn sign_cyclic_n() -> @kernel.Thm {
  sign_cyclic_n_c.get()
}

///|
/// PERMSET_CONV
fn step_147() -> Unit raise {
  let t1501 = @sets.set_tac(@list.List([]))
  let t1502 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([permutes_empty()])),
    t1501,
  )
  let pth_empty = @tactics.prove(
    @term_syntax.parse_term("{(p : (_) -> _) | permutes(p, {})} == {I}"),
    t1502,
  )
  let pth_cross = @sets.set_rule(
    @term_syntax.parse_term("IMAGE((f : ((_, _)) -> _), {((x : _), (y : _)) | IN(x, {}) && IN(y, (t : (_) -> Bool))}) == {} && IMAGE(f, {((x : _), (y : _)) | IN(x, INSERT((a : _), (s : (_) -> Bool))) && IN(y, t)}) == UNION(IMAGE((y : _) => f((a, y)), t), IMAGE(f, {((x : _), (y : _)) | IN(x, s) && IN(y, t)}))"),
  )
  let pth_union = @sets.set_rule(
    @term_syntax.parse_term("UNION({}, (t : (_) -> Bool)) == t && UNION(INSERT((x : _), (s : (_) -> Bool)), t) == INSERT(x, UNION(s, t))"),
  )
  fn permset_conv_1(x1503 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1503
    let t1510 = @simp.rewrite_conv(@list.List([swap_refl(), @trivia.i_o_id()]))
    let t1509 = @simp.rewrite_conv(@list.List([pth_union]))
    let t1508 = @simp.rewrite_conv(@list.List([@sets.image_clauses()]))
    let t1507 = @simp.rewrite_conv(@list.List([pth_cross]))
    let t1506 = @equal.once_depth_conv(permset_conv_1)
    let t1511 = @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @simp.gen_rewrite_conv(
                fn(
                  x1505 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  x1505
                },
                @list.List([permutes_insert()]),
              ),
              t1506,
            ),
            t1507,
          ),
          t1508,
        ),
        t1509,
      ),
      t1510,
    )
    @equal.orelsec(
      @simp.gen_rewrite_conv(
        fn(
          x1504 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x1504
        },
        @list.List([pth_empty]),
      ),
      t1511,
    )(tm)
  }
  permset_conv_c.set(permset_conv_1)
}

///|
let permset_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("PERMSET_CONV")

///|
/// `PERMSET_CONV`
pub fn permset_conv(x : @kernel.Term) -> @kernel.Thm raise {
  permset_conv_c.get()(x)
}

///|
/// SUM_OVER_PERMUTATIONS_INSERT
fn step_148() -> Unit raise {
  let t1512 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm(), @trivia.o_thm()]),
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("fn { (b, p) => (f : ((_) -> _) -> _)(o(swap(((a : _), b)), p)) } == o(f, fn { (b, p) => o(swap((a, b)), p) })"),
    t1512,
  )
  let t1546 = @simp.rewrite_tac(
    @list.List([@trivia.o_assoc(), swap_idempotent(), @trivia.i_o_id()]),
  )
  let t1542 = @term_syntax.parse_term("(p : (A) -> A) => o(swap(((a : A), (c : A))), p)")
  let t1545 = @tactics.first_x_assum(fn(
    x1544 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1539 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1540 = @tactics.mp_tac(x1539)
      fn(
        x1541 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1540(x1541)
      }
    })(((x1543 : @kernel.Thm) => @equal.ap_term(t1542, x1543))(x1544))
  })
  let t1547 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x1536 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1537 = @tactics.subst_all_tac(x1536)
        fn(
          x1538 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1537(x1538)
        }
      }),
      t1545,
    ),
    t1546,
  )
  let t1535 = @meson.asm_meson_tac(@list.List([permutes()]))
  let t1534 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), swap()]))
  let t1531 = @term_syntax.parse_term("(a : A)")
  let t1548 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_x_assum(fn(
          x1533 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x1526 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1527 = @tactics.mp_tac(x1526)
            fn(
              x1528 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1527(x1528)
            }
          })(
            (fn(x1532 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(
                x1529 : @kernel.Thm,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                fn(x1530 : @kernel.Term) -> @kernel.Thm raise {
                  @equal.ap_thm(x1529, x1530)
                }
              })(x1532)(t1531)
            })(x1533),
          )
        }),
        t1534,
      ),
      t1535,
    ),
    t1547,
  ])
  let t1525 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t1524 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t1523 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1519 = @term_syntax.parse_term("(q : (A) -> A)")
  let t1520 = @term_syntax.parse_term("(c : A)")
  let t1521 = @term_syntax.parse_term("(p : (A) -> A)")
  let t1522 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(b : A)"), t1521, t1520, t1519]),
  )
  let t1518 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1517 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]),
  )
  let t1516 = @tactics.match_mp_tac(@iterate.sum_image())
  let t1515 = @simp.rewrite_tac(@list.List([lemma]))
  let t1514 = @simp.asm_simp_tac(
    @list.List([
      finite_permutations(),
      @sets.finite_insert(),
      @iterate.sum_sum_product(),
    ]),
  )
  let t1513 = @simp.rewrite_tac(@list.List([permutes_insert()]))
  let t1549 = @tactics.thenl(
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
                          t1513,
                        ),
                        t1514,
                      ),
                      t1515,
                    ),
                    t1516,
                  ),
                  t1517,
                ),
                t1518,
              ),
              t1522,
            ),
            t1523,
          ),
          t1524,
        ),
        t1525,
      ),
      @tactics.conj_tac,
    ),
    t1548,
  )
  sum_over_permutations_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((A) -> A) -> Real, ∀ a : A, ∀ s : (A) -> Bool, FINITE(s) && !IN(a, s) → sum({(p : (A) -> A) | permutes(p, INSERT(a, s))}, f) == sum(INSERT(a, s), (b : A) => sum({(p : (A) -> A) | permutes(p, s)}, (q : (A) -> A) => f(o(swap((a, b)), q))))"),
      t1549,
    ),
  )
}

///|
let sum_over_permutations_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_OVER_PERMUTATIONS_INSERT",
)

///|
/// `SUM_OVER_PERMUTATIONS_INSERT`
pub fn sum_over_permutations_insert() -> @kernel.Thm {
  sum_over_permutations_insert_c.get()
}

///|
/// SUM_OVER_PERMUTATIONS_NUMSEG
fn step_149() -> Unit raise {
  let t1552 = @simp.rewrite_tac(
    @list.List([@iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  let t1551 = @tactics.match_mp_tac(sum_over_permutations_insert())
  let t1550 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@iterate.numseg_lrec())]),
  )
  let t1553 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1550),
        t1551,
      ),
      t1552,
    ),
    @int.arith_tac,
  )
  sum_over_permutations_numseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((Num) -> Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n → sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m, n))}, f) == sum(op_dot_dot(m, n), (i : Num) => sum({(p : (Num) -> Num) | permutes(p, op_dot_dot(m + 1, n))}, (q : (Num) -> Num) => f(o(swap((m, i)), q))))"),
      t1553,
    ),
  )
}

///|
let sum_over_permutations_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUM_OVER_PERMUTATIONS_NUMSEG",
)

///|
/// `SUM_OVER_PERMUTATIONS_NUMSEG`
pub fn sum_over_permutations_numseg() -> @kernel.Thm {
  sum_over_permutations_numseg_c.get()
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
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
}
