// Translated from upstream Library/jacobi.ml; edit this file directly.

///|
/// COPRIME_IPRODUCT
fn step_1() -> Unit raise {
  let t6 = @tactics.conv_tac(@int.integer_rule)
  let t5 = @tactics.disch_then(@tactics.match_mp_tac)
  let t4 = @simp.rewrite_tac(
    @list.List([@integer.int_coprime_1(), @theorems.imp_conj()]),
  )
  let t1 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t2 = @term_syntax.parse_term("(a : (A) -> Int)")
  let t3 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(i : Int) => coprime(((n : Int), i))"), t2, t1]),
      @products.iproduct_closed(),
    ),
  )
  let t7 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3),
        t4,
      ),
      t5,
    ),
    t6,
  )
  coprime_iproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : (A) -> Int, ∀ n : Int, (∀ i : A, IN(i, s) → coprime((n, a(i)))) → coprime((n, iproduct(s, a)))"),
      t7,
    ),
  )
}

///|
let coprime_iproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COPRIME_IPRODUCT",
)

///|
/// `COPRIME_IPRODUCT`
pub fn coprime_iproduct() -> @kernel.Thm {
  coprime_iproduct_c.get()
}

///|
/// CONG_IPRODUCT
fn step_2() -> Unit raise {
  let t14 = @tactics.conv_tac(@int.integer_rule)
  let t13 = @tactics.disch_then(@tactics.match_mp_tac)
  let t12 = @simp.asm_rewrite_tac(@list.List([]))
  let t8 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t9 = @term_syntax.parse_term("(b : (A) -> Int)")
  let t10 = @term_syntax.parse_term("(a : (A) -> Int)")
  let t11 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([
        @term_syntax.parse_term("(i : Int) => (j : Int) => op_eq_eq(i, j, mod((n : Int)))"),
        t10,
        t9,
        t8,
      ]),
      @products.iproduct_related(),
    ),
  )
  let t15 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t11),
        t12,
      ),
      t13,
    ),
    t14,
  )
  cong_iproduct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : (A) -> Int, ∀ b : (A) -> Int, ∀ n : Int, FINITE(s) && (∀ i : A, IN(i, s) → op_eq_eq(a(i), b(i), mod(n))) → op_eq_eq(iproduct(s, a), iproduct(s, b), mod(n))"),
      t15,
    ),
  )
}

///|
let cong_iproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_IPRODUCT")

///|
/// `CONG_IPRODUCT`
pub fn cong_iproduct() -> @kernel.Thm {
  cong_iproduct_c.get()
}

///|
/// jacobi
fn step_3() -> Unit raise {
  jacobi_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(jacobi : ((Num, Num)) -> Int)(((a : Num), (n : Num))) == (if n == 0 { if a == 1 { int_of_num(1) } else { int_of_num(0) } } else { iproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => pow(if divides(p, a) { int_of_num(0) } else { if (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(p))) { int_of_num(1) } else { -int_of_num(1) } }, index(p, n))) })"),
    ),
  )
}

///|
let jacobi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("jacobi")

///|
/// `jacobi`
pub fn jacobi() -> @kernel.Thm {
  jacobi_c.get()
}

///|
/// JACOBI_BOUND
fn step_4() -> Unit raise {
  let t24 = @tactics.match_mp_tac(@int.int_pow_1_le())
  let t23 = @simp.rewrite_tac(@list.List([@int.int_abs_pow()]))
  let t22 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t21 = @simp.asm_simp_tac(
    @list.List([
      @prime.finite_special_divisors(),
      @sets.forall_in_gspec(),
      @int.int_abs_pos(),
    ]),
  )
  let t20 = @tactics.match_mp_tac(@products.iproduct_le_1())
  let t19 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@products.iproduct_abs()),
      @prime.finite_special_divisors(),
    ]),
  )
  let t17 = @tactics.conv_tac(@int.int_reduce_conv)
  let t18 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @class.cond_cases_tac,
        @simp.asm_rewrite_tac(@list.List([])),
      ),
      t17,
    ),
  )
  let t16 = @simp.rewrite_tac(@list.List([jacobi()]))
  let t25 = @tactics.then_tac(
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
                      t16,
                    ),
                    t18,
                  ),
                  t19,
                ),
                t20,
              ),
              t21,
            ),
            t22,
          ),
          @tactics.strip_tac,
        ),
        t23,
      ),
      t24,
    ),
    @int.int_arith_tac,
  )
  jacobi_bound_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, abs(jacobi((a, n))) <= int_of_num(1)"), t25),
  )
}

///|
let jacobi_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_BOUND")

///|
/// `JACOBI_BOUND`
pub fn jacobi_bound() -> @kernel.Thm {
  jacobi_bound_c.get()
}

///|
/// JACOBI_CASES
fn step_5() -> Unit raise {
  let t26 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t27 = @tactics.then_tac(
    @tactics.then_tac(@tactics.mp_tac(jacobi_bound()), t26),
    @int.int_arith_tac,
  )
  jacobi_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, jacobi((a, n)) == -int_of_num(1) || jacobi((a, n)) == int_of_num(0) || jacobi((a, n)) == int_of_num(1)"),
      t27,
    ),
  )
}

///|
let jacobi_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_CASES")

///|
/// `JACOBI_CASES`
pub fn jacobi_cases() -> @kernel.Thm {
  jacobi_cases_c.get()
}

///|
/// JACOBI_PRIME
fn step_6() -> Unit raise {
  let t38 = @drule.match_mp(@prime.prime_ge_2())
  let t40 = @tactics.first_x_assum(fn(
    x39 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x35 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s36 = @tactics.mp_tac(x35)
      fn(
        x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s36(x37)
      }
    })(t38(x39))
  })
  let t34 = @simp.asm_rewrite_tac(@list.List([@int.int_pow_1()]))
  let t33 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) <= 1"))
  let t32 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.sing_gspec(),
      @products.iproduct_sing(),
      @prime.index_refl(),
    ]),
  )
  let t31 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!(prime((q : Num)) → !(q == (p : Num))) == (prime(p) && q == p)"),
      ),
    ]),
  )
  let t30 = @simp.asm_simp_tac(@list.List([@prime.divides_prime_prime()]))
  let t29 = @simp.once_rewrite_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | !(P(x) → !Q(x))}"),
      ),
    ]),
  )
  let t28 = @simp.asm_simp_tac(@list.List([jacobi(), @prime.prime_imp_nz()]))
  let t41 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t28,
                  ),
                  t29,
                ),
                t30,
              ),
              t31,
            ),
            t32,
          ),
          t33,
        ),
        t34,
      ),
      t40,
    ),
    @int.asm_arith_tac,
  )
  jacobi_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) → jacobi((a, p)) == (if divides(p, a) { int_of_num(0) } else { if (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(p))) { int_of_num(1) } else { -int_of_num(1) } })"),
      t41,
    ),
  )
}

///|
let jacobi_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_PRIME")

///|
/// `JACOBI_PRIME`
pub fn jacobi_prime() -> @kernel.Thm {
  jacobi_prime_c.get()
}

///|
/// JACOBI
fn step_7() -> Unit raise {
  let t50 = @simp.simp_tac(@list.List([jacobi_prime()]))
  let t49 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t48 = @tactics.match_mp_tac(@products.iproduct_eq())
  let t47 = @simp.asm_rewrite_tac(@list.List([]))
  let t46 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t45 = @simp.gen_rewrite_tac(
    fn(
      x42 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s43 = @equal.land_conv(x42)
      fn(x44 : @kernel.Term) -> @kernel.Thm raise { s43(x44) }
    },
    @list.List([jacobi()]),
  )
  let t51 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t45),
            t46,
          ),
          t47,
        ),
        t48,
      ),
      t49,
    ),
    t50,
  )
  jacobi_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, jacobi((a, n)) == (if n == 0 { if a == 1 { int_of_num(1) } else { int_of_num(0) } } else { iproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => pow(jacobi((a, p)), index(p, n))) })"),
      t51,
    ),
  )
}

///|
let jacobi_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI")

///|
/// `JACOBI`
pub fn jacobi_v1() -> @kernel.Thm {
  jacobi_v1_c.get()
}

///|
/// JACOBI_ALT
fn step_8() -> Unit raise {
  let t74 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_elim_thm(),
      @theorems.imp_conj(),
      @prime.index_zero(),
      @int.int_pow_v1(),
    ]),
  )
  let t73 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_elim_thm()])),
  )
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t71 = @tactics.match_mp_tac(@products.iproduct_superset())
  let t70 = @tactics.conv_tac(@equal.sym_conv)
  let t69 = @simp.asm_rewrite_tac(@list.List([]))
  let t75 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.strip_tac,
                @simp.gen_rewrite_tac(
                  fn(
                    x66 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s67 = @equal.land_conv(x66)
                    fn(x68 : @kernel.Term) -> @kernel.Thm raise { s67(x68) }
                  },
                  @list.List([jacobi_v1()]),
                ),
              ),
              t69,
            ),
            t70,
          ),
          t71,
        ),
        t72,
      ),
      t73,
    ),
    t74,
  )
  let t65 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@sets.infinite()),
      @prime.primes_infinite(),
      @prime.divides_0(),
    ]),
  )
  let t64 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")),
  )
  let t61 = @drule.match_mp(@sets.finite_subset())
  let t63 = @tactics.disch_then(fn(
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
    (fn(
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
      let s59 = @tactics.mp_tac(x58)
      fn(
        x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s59(x60)
      }
    })(t61(x62))
  })
  let t57 = @tactics.disch_then(fn(
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
    (fn(
      x53 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s54 = @tactics.mp_tac(x53)
      fn(
        x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s54(x55)
      }
    })(@bool.conjunct1(x56))
  })
  let t76 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.conj_assoc()])),
            t57,
          ),
          t63,
        ),
        t64,
      ),
      t65,
    ),
    t75,
  ])
  let t52 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t77 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t52),
    t76,
  )
  jacobi_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ a : Num, ∀ n : Num, FINITE(s) && SUBSET({(p : Num) | prime(p) && divides(p, n)}, s) && SUBSET(s, {(p : Num) | prime(p)}) → jacobi((a, n)) == iproduct(s, (p : Num) => pow(jacobi((a, p)), index(p, n)))"),
      t77,
    ),
  )
}

///|
let jacobi_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_ALT")

///|
/// `JACOBI_ALT`
pub fn jacobi_alt() -> @kernel.Thm {
  jacobi_alt_c.get()
}

///|
/// JACOBI_EQ_0
fn step_9() -> Unit raise {
  let t101 = @tactics.conv_tac(@int.int_reduce_conv)
  let t100 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([])),
    ),
  )
  let t99 = @simp.asm_simp_tac(@list.List([jacobi_prime()]))
  let t98 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t97 = @simp.asm_rewrite_tac(@list.List([@prime.index_eq_0()]))
  let t96 = @class.asm_cases_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t95 = @simp.asm_rewrite_tac(@list.List([]))
  let t94 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t93 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t92 = @simp.gen_rewrite_tac(
    fn(
      x91 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x91
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t90 = @simp.rewrite_tac(
    @list.List([@prime.coprime_prime_eq(), @class.not_forall_thm()]),
  )
  let t89 = @simp.rewrite_tac(
    @list.List([@sets.exists_in_gspec(), @int.int_pow_eq_0()]),
  )
  let t102 = @tactics.then_tac(
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
                            @simp.asm_simp_tac(
                              @list.List([
                                @products.iproduct_eq_0(),
                                @prime.finite_special_divisors(),
                              ]),
                            ),
                            t89,
                          ),
                          t90,
                        ),
                        @tactics.ap_term_tac,
                      ),
                      t92,
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
    t101,
  )
  let t88 = @tactics.conv_tac(@int.int_reduce_conv)
  let t87 = @simp.asm_rewrite_tac(@list.List([]))
  let t103 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([@prime.coprime_0()])),
          @class.cond_cases_tac,
        ),
        t87,
      ),
      t88,
    ),
    t102,
  ])
  let t86 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t85 = @simp.gen_rewrite_tac(
    fn(
      x84 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x78 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s79 = @equal.land_conv(x78)
        fn(x80 : @kernel.Term) -> @kernel.Thm raise { s79(x80) }
      })(
        (fn(
          x81 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s82 = @equal.land_conv(x81)
          fn(x83 : @kernel.Term) -> @kernel.Thm raise { s82(x83) }
        })(x84),
      )
    },
    @list.List([jacobi_v1()]),
  )
  let t104 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t85),
      t86,
    ),
    t103,
  )
  jacobi_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, (jacobi((a, n)) == int_of_num(0)) == !coprime((a, n))"),
      t104,
    ),
  )
}

///|
let jacobi_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_EQ_0")

///|
/// `JACOBI_EQ_0`
pub fn jacobi_eq_0() -> @kernel.Thm {
  jacobi_eq_0_c.get()
}

///|
/// JACOBI_ZERO
fn step_10() -> Unit raise {
  let t105 = @simp.rewrite_tac(@list.List([jacobi_eq_0()]))
  jacobi_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : _, !coprime((a, (n : Num))) → jacobi((a, n)) == int_of_num(0)"),
      t105,
    ),
  )
}

///|
let jacobi_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_ZERO")

///|
/// `JACOBI_ZERO`
pub fn jacobi_zero() -> @kernel.Thm {
  jacobi_zero_c.get()
}

///|
/// JACOBI_1
fn step_11() -> Unit raise {
  let t123 = @simp.rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t122 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t121 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t120 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : Num, op_eq_eq(EXP(x, 2), 1, mod((p : Num)))"),
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
      let th = x118
      @simp.rewrite_tac(@list.List([th, @int.int_pow_one()]))
    },
  )
  let t117 = @simp.asm_simp_tac(
    @list.List([
      @meson.meson(
        @list.List([@prime.prime_1()]),
        @term_syntax.parse_term("prime((p : Num)) → !(p == 1)"),
      ),
    ]),
  )
  let t116 = @simp.asm_simp_tac(
    @list.List([jacobi_prime(), @int.divides_one()]),
  )
  let t115 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t114 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t113 = @tactics.match_mp_tac(@products.iproduct_eq_1())
  let t112 = @simp.asm_rewrite_tac(@list.List([]))
  let t111 = @simp.simp_tac(
    @list.List([@prime.index_1(), @int.int_pow_v1(), @products.iproduct_one()]),
  )
  let t110 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t109 = @simp.gen_rewrite_tac(
    fn(
      x106 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s107 = @equal.land_conv(x106)
      fn(x108 : @kernel.Term) -> @kernel.Thm raise { s107(x108) }
    },
    @list.List([jacobi_v1()]),
  )
  let t124 = @tactics.then_tac(
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
                                @tactics.repeat_tac(@tactics.strip_tac),
                                t109,
                              ),
                              t110,
                            ),
                            t111,
                          ),
                          @class.cond_cases_tac,
                        ),
                        t112,
                      ),
                      t113,
                    ),
                    t114,
                  ),
                  t115,
                ),
                @tactics.strip_tac,
              ),
              t116,
            ),
            t117,
          ),
          t120,
        ),
        t121,
      ),
      t122,
    ),
    t123,
  )
  jacobi_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, jacobi((1, n)) == int_of_num(1)) && (∀ a : Num, jacobi((a, 1)) == int_of_num(1))"),
      t124,
    ),
  )
}

///|
let jacobi_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_1")

///|
/// `JACOBI_1`
pub fn jacobi_1() -> @kernel.Thm {
  jacobi_1_c.get()
}

///|
/// JACOBI_0
fn step_12() -> Unit raise {
  let t126 = @simp.asm_rewrite_tac(
    @list.List([jacobi_eq_0(), @prime.coprime_0()]),
  )
  let t125 = @simp.asm_rewrite_tac(@list.List([jacobi_1()]))
  let t127 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.strip_tac),
        @class.cond_cases_tac,
      ),
      t125,
    ),
    t126,
  )
  jacobi_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Num, jacobi((0, n)) == (if n == 1 { int_of_num(1) } else { int_of_num(0) })) && (∀ a : Num, jacobi((a, 0)) == (if a == 1 { int_of_num(1) } else { int_of_num(0) }))"),
      t127,
    ),
  )
}

///|
let jacobi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_0")

///|
/// `JACOBI_0`
pub fn jacobi_0() -> @kernel.Thm {
  jacobi_0_c.get()
}

///|
/// JACOBI_2_CASES
fn step_13() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([@arith.odd()]))
  let t131 = @simp.rewrite_tac(@list.List([@arith.not_even()]))
  let t130 = @simp.rewrite_tac(
    @list.List([@arith.even_exp(), @calc_num.arith_eq()]),
  )
  let t129 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_mod_2()]))
  let t128 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((a : Num))"))
  let t133 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.simp_tac(
                @list.List([
                  jacobi_prime(),
                  @prime.prime_2(),
                  @prime.divides_2(),
                  @equal.gsym(@arith.not_even()),
                ]),
              ),
            ),
            t128,
          ),
          t129,
        ),
        t130,
      ),
      t131,
    ),
    t132,
  )
  jacobi_2_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, jacobi((a, 2)) == (if ODD(a) { int_of_num(1) } else { int_of_num(0) })"),
      t133,
    ),
  )
}

///|
let jacobi_2_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_2_CASES")

///|
/// `JACOBI_2_CASES`
pub fn jacobi_2_cases() -> @kernel.Thm {
  jacobi_2_cases_c.get()
}

///|
/// JACOBI_2
fn step_14() -> Unit raise {
  let t135 = @meson.meson_tac(@list.List([]))
  let t134 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_odd()), @class.cond_swap()]),
  )
  let t136 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([jacobi_2_cases(), @arith.mod_2_cases()])),
      ),
      t134,
    ),
    t135,
  )
  jacobi_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, jacobi((a, 2)) == int_of_num(MOD(a, 2))"), t136),
  )
}

///|
let jacobi_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_2")

///|
/// `JACOBI_2`
pub fn jacobi_2() -> @kernel.Thm {
  jacobi_2_c.get()
}

///|
/// JACOBI_EULER
fn step_15() -> Unit raise {
  let t171 = @tactics.conv_tac(@int.integer_rule)
  let t170 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_sub()),
      @arith.le_1(),
      @prime.prime_imp_nz(),
    ]),
  )
  let t172 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@int.num_congruent(), @equal.gsym(@int.int_of_num_pow())]),
      ),
      t170,
    ),
    t171,
  )
  let t169 = @meson.asm_meson_tac(@list.List([@pocklington.cong_sym()]))
  let t173 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.gsym(@int.num_congruent()), @int.int_of_num_pow()]),
      ),
      t169,
    ),
    t172,
  ])
  let t168 = @simp.asm_rewrite_tac(@list.List([]))
  let t167 = @class.asm_cases_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), DIV((p : Num) - 1, 2)), 1, mod(p))"),
  )
  let t166 = @tactics.disch_then(fn(
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
    let s164 = @tactics.subst1_tac(x163)
    fn(
      x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s164(x165)
    }
  })
  let t162 = @simp.asm_rewrite_tac(@list.List([@arith.exp_1()]))
  let t159 = @term_syntax.parse_term("EXP((a : Num), DIV((p : Num) - 1, 2))")
  let t160 = @term_syntax.parse_term("1")
  let t161 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t160, t159]),
      @pocklington.cong_square_1_prime_power(),
    ),
  )
  let t157 = @meson.asm_meson_tac(
    @list.List([@prime.prime_odd(), @arith.not_even()]),
  )
  let t156 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@int.divides_div_mult()),
      @prime.divides_2(),
      @arith.even_sub(),
      @calc_num.arith(),
    ]),
  )
  let t155 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((p : Num) - 1, 2) * 2 == p - 1"),
    fn(
      x153 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x153
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t152 = @simp.rewrite_tac(@list.List([@arith.exp_exp()]))
  let t151 = @simp.asm_simp_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.prime_coprime_eq(),
      ),
    ]),
  )
  let t150 = @term_syntax.parse_term("(p : Num)")
  let t158 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("(a : Num)"), t150]),
                  @pocklington.fermat_little_prime(),
                ),
              ),
              t151,
            ),
            t152,
          ),
          t155,
        ),
        t156,
      ),
      t157,
    ),
    @tactics.all_tac,
  ])
  let t149 = @tactics.subgoal_then(
    @term_syntax.parse_term("op_eq_eq(EXP(EXP((a : Num), DIV((p : Num) - 1, 2)), 2), 1, mod(p))"),
    fn(
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
      let s147 = @tactics.mp_tac(x146)
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
    },
  )
  let t142 = @drule.match_mp(@prime.prime_ge_2())
  let t144 = @tactics.first_assum(fn(
    x143 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(t142(x143))
  })
  let t138 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_pow(),
      @equal.gsym(@int.num_divides()),
      @prime.prime_divexp_eq(),
    ]),
  )
  let t145 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.integer_rule(
                @term_syntax.parse_term("op_eq_eq(int_of_num(0), (a : Int), mod((p : Int))) == divides(p, a)"),
              ),
            ]),
          ),
          t138,
        ),
        t144,
      ),
      @int.asm_arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t137 = @simp.asm_simp_tac(
    @list.List([@primitive.euler_criterion(), jacobi_prime()]),
  )
  let t174 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t137,
                      ),
                      @class.cond_cases_tac,
                    ),
                    t145,
                  ),
                  t149,
                ),
                t158,
              ),
              t161,
            ),
            t162,
          ),
          t166,
        ),
        t167,
      ),
      t168,
    ),
    t173,
  )
  jacobi_euler_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && !(p == 2) → op_eq_eq(jacobi((a, p)), pow(int_of_num(a), DIV(p - 1, 2)), mod(int_of_num(p)))"),
      t174,
    ),
  )
}

///|
let jacobi_euler_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_EULER")

///|
/// `JACOBI_EULER`
pub fn jacobi_euler() -> @kernel.Thm {
  jacobi_euler_c.get()
}

///|
/// JACOBI_EULER_ALT
fn step_16() -> Unit raise {
  let t180 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t179 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@int.num_congruent()),
      @pocklington.cong_mod_2_alt(),
    ]),
  )
  let t178 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_1(), jacobi_2_cases()]),
  )
  let t177 = @tactics.disch_then(fn(
    x176 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t175 = @simp.asm_simp_tac(@list.List([jacobi_euler()]))
  let t181 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @class.cond_cases_tac,
              ),
              t175,
            ),
            t177,
          ),
          t178,
        ),
        @class.cond_cases_tac,
      ),
      t179,
    ),
    t180,
  )
  jacobi_euler_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) → op_eq_eq(jacobi((a, p)), pow(int_of_num(a), if p == 2 { 1 } else { DIV(p - 1, 2) }), mod(int_of_num(p)))"),
      t181,
    ),
  )
}

///|
let jacobi_euler_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_EULER_ALT",
)

///|
/// `JACOBI_EULER_ALT`
pub fn jacobi_euler_alt() -> @kernel.Thm {
  jacobi_euler_alt_c.get()
}

///|
/// JACOBI_RMUL
fn step_17() -> Unit raise {
  let t208 = @simp.asm_simp_tac(@list.List([@prime.index_mul()]))
  let t207 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @equal.gsym(@int.int_pow_add())]),
  )
  let t206 = @tactics.match_mp_tac(@products.iproduct_eq())
  let t205 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@products.iproduct_mul()),
      @prime.finite_special_divisors(),
      @arith.mult_eq_0(),
    ]),
  )
  let t204 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0()]))
  let t203 = @simp.gen_rewrite_tac(
    fn(
      x200 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s201 = @equal.land_conv(x200)
      fn(x202 : @kernel.Term) -> @kernel.Thm raise { s201(x202) }
    },
    @list.List([jacobi_v1()]),
  )
  let t199 = @tactics.repeat_tac(
    @tactics.disch_then(fn(
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
      let s197 = @tactics.subst1_tac(x196)
      fn(
        x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s197(x198)
      }
    }),
  )
  let t195 = @simp.simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @prime.divides_lmul(),
      @prime.divides_rmul(),
    ]),
  )
  let t194 = @simp.asm_simp_tac(
    @list.List([@prime.finite_special_divisors(), @arith.mult_eq_0()]),
  )
  let t193 = @tactics.disch_then(fn(
    x190 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x190
    let t192 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), th))
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), th)),
      t192,
    )
  })
  let t188 = @term_syntax.parse_term("(a : Num)")
  let t189 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("{(p : Num) | prime(p) && divides(p, (m : Num) * (n : Num))}"), t188]),
      jacobi_alt(),
    ),
  )
  let t187 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), jacobi_0(), @int.int_mul_rzero()]),
  )
  let t186 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t185 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), jacobi_0(), @int.int_mul_lzero()]),
  )
  let t184 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t183 = @simp.asm_rewrite_tac(@list.List([jacobi_1(), @int.int_mul_lid()]))
  let t182 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t209 = @tactics.then_tac(
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
                                    t182,
                                  ),
                                  t183,
                                ),
                                t184,
                              ),
                              t185,
                            ),
                            t186,
                          ),
                          t187,
                        ),
                        t189,
                      ),
                      t193,
                    ),
                    t194,
                  ),
                  t195,
                ),
                t199,
              ),
              t203,
            ),
            t204,
          ),
          t205,
        ),
        t206,
      ),
      t207,
    ),
    t208,
  )
  jacobi_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, jacobi((a, m * n)) == jacobi((a, m)) * jacobi((a, n))"),
      t209,
    ),
  )
}

///|
let jacobi_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_RMUL")

///|
/// `JACOBI_RMUL`
pub fn jacobi_rmul() -> @kernel.Thm {
  jacobi_rmul_c.get()
}

///|
/// JACOBI_LMUL
fn step_18() -> Unit raise {
  let t253 = @tactics.conv_tac(@int.integer_rule)
  let t251 = @equal.gsym(@int.int_of_num_mul())
  let t252 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_pow_mul()), t251]),
  )
  let t250 = @tactics.match_mp_tac(
    @int.integer_rule(
      @term_syntax.parse_term("op_eq_eq((a' : Int) * (b' : Int), (c' : Int), mod((p : Int))) → op_eq_eq((a : Int), a', mod(p)) && op_eq_eq((b : Int), b', mod(p)) && op_eq_eq((c : Int), c', mod(p)) → op_eq_eq(c, a * b, mod(p))"),
    ),
  )
  let t249 = @simp.asm_rewrite_tac(
    @list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t247 = @term_syntax.parse_term("(p : Num)")
  let t248 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t247]), jacobi_euler()),
  )
  let t245 = @term_syntax.parse_term("(p : Num)")
  let t246 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(b : Num)"), t245]), jacobi_euler()),
  )
  let t244 = @term_syntax.parse_term("(p : Num)")
  let t254 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("(a : Num) * (b : Num)"), t244]),
                  jacobi_euler(),
                ),
              ),
              t246,
            ),
            t248,
          ),
          t249,
        ),
        t250,
      ),
      t252,
    ),
    t253,
  )
  let t243 = @simp.rewrite_tac(@list.List([jacobi_bound(), @int.int_abs_pos()]))
  let t242 = @tactics.match_mp_tac(@int.int_le_mul2())
  let t241 = @simp.rewrite_tac(@list.List([@int.int_abs_mul()]))
  let t240 = @simp.gen_rewrite_tac(
    fn(
      x237 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s238 = @equal.rand_conv(x237)
      fn(x239 : @kernel.Term) -> @kernel.Thm raise { s238(x239) }
    },
    @list.List([@equal.gsym(@int.int_mul_lid())]),
  )
  let t236 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@prime.odd_prime(), @prime.prime_odd()])),
  ])
  let t235 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_le(), jacobi_bound()]),
  )
  let t255 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(
                    @int.int_arith(
                      @term_syntax.parse_term("abs((x : Int)) <= int_of_num(1) && abs((y : Int)) <= int_of_num(1) && int_of_num(3) <= (p : Int) → abs(x - y) < p"),
                    ),
                  ),
                  t235,
                ),
                @tactics.conj_tac,
              ),
              t236,
            ),
            t240,
          ),
          t241,
        ),
        t242,
      ),
      t243,
    ),
    t254,
  ])
  let t234 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num((p : Num))"))
  let t256 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@integer.int_cong_imp_eq()), t234),
      @tactics.conj_tac,
    ),
    t255,
  )
  let t233 = @tactics.conv_tac(@int.int_reduce_conv)
  let t232 = @simp.asm_rewrite_tac(@list.List([]))
  let t230 = @term_syntax.parse_term("ODD((b : Num))")
  let t231 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("ODD((a : Num))"), t230]),
  )
  let t257 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(
            @list.List([jacobi_2_cases(), @arith.odd_mult()]),
          ),
          t231,
        ),
        t232,
      ),
      t233,
    ),
    t256,
  ])
  let t229 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t228 = @tactics.disch_then(fn(
    x227 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x224 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s225 = @tactics.assume_tac(x224)
      fn(
        x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s225(x226)
      }
    })(@bool.conjunct1(x227))
  })
  let t223 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t222 = @tactics.pop_assum_list(fn(
    x221 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t220 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), @equal.gsym(@int.int_pow_mul())]),
  )
  let t219 = @tactics.match_mp_tac(@products.iproduct_eq())
  let t218 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@products.iproduct_mul()),
      @prime.finite_special_divisors(),
    ]),
  )
  let t215 = @simp.asm_rewrite_tac(@list.List([]))
  let t216 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([jacobi_v1()])),
    t215,
  )
  let t214 = @tactics.conv_tac(@int.int_reduce_conv)
  let t213 = @simp.asm_rewrite_tac(@list.List([]))
  let t211 = @term_syntax.parse_term("(b : Num) == 1")
  let t212 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(a : Num) == 1"), t211]),
  )
  let t217 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([jacobi_0(), @arith.mult_eq_1()])),
          t212,
        ),
        t213,
      ),
      t214,
    ),
    t216,
  ])
  let t210 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t258 = @tactics.thenl(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t210,
                        ),
                        t217,
                      ),
                      t218,
                    ),
                    t219,
                  ),
                  t220,
                ),
                t222,
              ),
              t223,
            ),
            t228,
          ),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t229,
    ),
    t257,
  )
  jacobi_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, jacobi((a * b, n)) == jacobi((a, n)) * jacobi((b, n))"),
      t258,
    ),
  )
}

///|
let jacobi_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_LMUL")

///|
/// `JACOBI_LMUL`
pub fn jacobi_lmul() -> @kernel.Thm {
  jacobi_lmul_c.get()
}

///|
/// JACOBI_REXP
fn step_19() -> Unit raise {
  let t259 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), jacobi_rmul(), jacobi_1(), @int.int_pow_v1()]),
  )
  let t260 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t259,
  )
  jacobi_rexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ k : Num, jacobi((a, EXP(n, k))) == pow(jacobi((a, n)), k)"),
      t260,
    ),
  )
}

///|
let jacobi_rexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_REXP")

///|
/// `JACOBI_REXP`
pub fn jacobi_rexp() -> @kernel.Thm {
  jacobi_rexp_c.get()
}

///|
/// JACOBI_LEXP
fn step_20() -> Unit raise {
  let t262 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_rzero()]))
  let t261 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp(), jacobi_lmul(), jacobi_1(), @int.int_pow_v1()]),
  )
  let t263 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          @nums.induct_tac,
        ),
        t261,
      ),
      @class.cond_cases_tac,
    ),
    t262,
  )
  jacobi_lexp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ k : Num, jacobi((EXP(a, k), n)) == pow(jacobi((a, n)), k)"),
      t263,
    ),
  )
}

///|
let jacobi_lexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_LEXP")

///|
/// `JACOBI_LEXP`
pub fn jacobi_lexp() -> @kernel.Thm {
  jacobi_lexp_c.get()
}

///|
/// JACOBI_EXP_2
fn step_21() -> Unit raise {
  let t268 = @simp.asm_rewrite_tac(
    @list.List([@arith.exp_zero(), @arith.exp_one()]),
  )
  let t267 = @simp.rewrite_tac(@list.List([@arith.mod_2_cases()]))
  let t266 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_pow(), @int.int_of_num_eq()]),
  )
  let t265 = @simp.asm_rewrite_tac(@list.List([@int.int_pow_v1()]))
  let t264 = @simp.rewrite_tac(@list.List([jacobi_rexp(), jacobi_2()]))
  let t269 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t264),
              @class.cond_cases_tac,
            ),
            t265,
          ),
          t266,
        ),
        t267,
      ),
      @class.cond_cases_tac,
    ),
    t268,
  )
  jacobi_exp_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ k : Num, jacobi((a, EXP(2, k))) == (if k == 0 { int_of_num(1) } else { int_of_num(MOD(a, 2)) })"),
      t269,
    ),
  )
}

///|
let jacobi_exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_EXP_2")

///|
/// `JACOBI_EXP_2`
pub fn jacobi_exp_2() -> @kernel.Thm {
  jacobi_exp_2_c.get()
}

///|
/// JACOBI_EXP_2_ALT
fn step_22() -> Unit raise {
  let t272 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_one(), @int.int_pow_zero()]),
  )
  let t271 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((a : Num))"))
  let t270 = @simp.rewrite_tac(@list.List([jacobi_rexp(), jacobi_2_cases()]))
  let t273 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t270),
      t271,
    ),
    t272,
  )
  jacobi_exp_2_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ k : Num, jacobi((a, EXP(2, k))) == (if k == 0 || ODD(a) { int_of_num(1) } else { int_of_num(0) })"),
      t273,
    ),
  )
}

///|
let jacobi_exp_2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_EXP_2_ALT",
)

///|
/// `JACOBI_EXP_2_ALT`
pub fn jacobi_exp_2_alt() -> @kernel.Thm {
  jacobi_exp_2_alt_c.get()
}

///|
/// JACOBI_NPRODUCT_RIGHT
fn step_23() -> Unit raise {
  let t275 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      jacobi_rmul(),
      jacobi_1(),
      @iterate.iproduct_clauses(),
    ]),
  )
  let t274 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t276 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t274,
    ),
    t275,
  )
  jacobi_nproduct_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : (A) -> Num, ∀ k : (A) -> Bool, FINITE(k) → jacobi((a, nproduct(k, n))) == iproduct(k, (i : A) => jacobi((a, n(i))))"),
      t276,
    ),
  )
}

///|
let jacobi_nproduct_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_NPRODUCT_RIGHT",
)

///|
/// `JACOBI_NPRODUCT_RIGHT`
pub fn jacobi_nproduct_right() -> @kernel.Thm {
  jacobi_nproduct_right_c.get()
}

///|
/// JACOBI_NPRODUCT_LEFT
fn step_24() -> Unit raise {
  let t278 = @simp.asm_simp_tac(
    @list.List([
      @iterate.nproduct_clauses(),
      jacobi_lmul(),
      jacobi_1(),
      @iterate.iproduct_clauses(),
    ]),
  )
  let t277 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t279 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      t277,
    ),
    t278,
  )
  jacobi_nproduct_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : (A) -> Num, ∀ n : Num, ∀ k : (A) -> Bool, FINITE(k) → jacobi((nproduct(k, a), n)) == iproduct(k, (i : A) => jacobi((a(i), n)))"),
      t279,
    ),
  )
}

///|
let jacobi_nproduct_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_NPRODUCT_LEFT",
)

///|
/// `JACOBI_NPRODUCT_LEFT`
pub fn jacobi_nproduct_left() -> @kernel.Thm {
  jacobi_nproduct_left_c.get()
}

///|
/// JACOBI_CONG
fn step_25() -> Unit raise {
  let t288 = @meson.asm_meson_tac(
    @list.List([@pocklington.cong_trans(), @pocklington.cong_sym()]),
  )
  let t287 = @tactics.mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides((p : Num), (n : Num)) && op_eq_eq((a : Num), (b : Num), mod(n)) → op_eq_eq(a, b, mod(p))"),
    ),
  )
  let t286 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(@term_syntax.parse_term("divides((p : Num), (a : Num)) == op_eq_eq(0, a, mod(p))")),
    ]),
  )
  let t285 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t284 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t283 = @tactics.match_mp_tac(@products.iproduct_eq())
  let t282 = @simp.asm_rewrite_tac(@list.List([jacobi()]))
  let t281 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mod_0()]))
  let t280 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t289 = @tactics.then_tac(
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
                        t280,
                      ),
                      t281,
                    ),
                    @tactics.disch_tac,
                  ),
                  t282,
                ),
                t283,
              ),
              t284,
            ),
            t285,
          ),
          @tactics.strip_tac,
        ),
        t286,
      ),
      t287,
    ),
    t288,
  )
  jacobi_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ n : Num, op_eq_eq(a, b, mod(n)) → jacobi((a, n)) == jacobi((b, n))"),
      t289,
    ),
  )
}

///|
let jacobi_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_CONG")

///|
/// `JACOBI_CONG`
pub fn jacobi_cong() -> @kernel.Thm {
  jacobi_cong_c.get()
}

///|
/// JACOBI_MOD_GEN
fn step_26() -> Unit raise {
  let t294 = @simp.rewrite_tac(
    @list.List([@int.cong_lmod(), @pocklington.cong_refl()]),
  )
  let t291 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("divides((n : Num), (m : Num)) → op_eq_eq((x : Num), (y : Num), mod(m)) → op_eq_eq(x, y, mod(n))"),
    ),
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
    @tactics.match_mp_tac(t291(x292))
  })
  let t290 = @tactics.match_mp_tac(jacobi_cong())
  let t295 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t290),
      t293,
    ),
    t294,
  )
  jacobi_mod_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, divides(n, m) → jacobi((MOD(a, m), n)) == jacobi((a, n))"),
      t295,
    ),
  )
}

///|
let jacobi_mod_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_MOD_GEN")

///|
/// `JACOBI_MOD_GEN`
pub fn jacobi_mod_gen() -> @kernel.Thm {
  jacobi_mod_gen_c.get()
}

///|
/// JACOBI_MOD
fn step_27() -> Unit raise {
  let t296 = @simp.simp_tac(
    @list.List([jacobi_mod_gen(), @prime.divides_refl()]),
  )
  jacobi_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, jacobi((MOD(a, n), n)) == jacobi((a, n))"),
      t296,
    ),
  )
}

///|
let jacobi_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_MOD")

///|
/// `JACOBI_MOD`
pub fn jacobi_mod() -> @kernel.Thm {
  jacobi_mod_c.get()
}

///|
/// JACOBI_SQUARED
fn step_28() -> Unit raise {
  let t303 = @tactics.conv_tac(@int.int_reduce_conv)
  let t302 = @simp.asm_rewrite_tac(@list.List([]))
  let t300 = @term_syntax.parse_term("(n : Num)")
  let t301 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t300]), jacobi_cases()),
  )
  let t299 = @simp.rewrite_tac(@list.List([@equal.gsym(jacobi_eq_0())]))
  let t298 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.cond_swap())]),
  )
  let t297 = @simp.rewrite_tac(
    @list.List([@arith.exp_2(), jacobi_lmul(), jacobi_rmul()]),
  )
  let t304 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t297),
              t298,
            ),
            t299,
          ),
          t301,
        ),
        @tactics.strip_tac,
      ),
      t302,
    ),
    t303,
  )
  jacobi_squared_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Num, ∀ n : Num, jacobi((EXP(a, 2), n)) == (if coprime((a, n)) { int_of_num(1) } else { int_of_num(0) })) && (∀ a : Num, ∀ n : Num, jacobi((a, EXP(n, 2))) == (if coprime((a, n)) { int_of_num(1) } else { int_of_num(0) }))"),
      t304,
    ),
  )
}

///|
let jacobi_squared_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_SQUARED")

///|
/// `JACOBI_SQUARED`
pub fn jacobi_squared() -> @kernel.Thm {
  jacobi_squared_c.get()
}

///|
/// JACOBI_MINUS1
fn step_29() -> Unit raise {
  let t362 = @simp.rewrite_tac(
    @list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]),
  )
  let t361 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (n : Num), 2) == n"))]),
  )
  let t359 = @equal.gsym(@arith.mult_assoc())
  let t360 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.left_add_distrib()), t359]),
  )
  let t358 = @simp.rewrite_tac(
    @list.List([@arith.suc_sub1(), @arith.add_clauses(), @arith.mult_clauses()]),
  )
  let t354 = @simp.rewrite_rule(@list.List([@arith.odd_exists()]))
  let t355 = @tactics.choose_then(fn(
    x351 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s352 = @tactics.subst_all_tac(x351)
    fn(
      x353 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s352(x353)
    }
  })
  let t357 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
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
      t355(t354(x356))
    }),
  )
  let t350 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t363 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([@equal.gsym(@int.int_pow_add())]),
                    ),
                    t350,
                  ),
                  @tactics.ap_thm_tac,
                ),
                @tactics.ap_thm_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t357,
          ),
          t358,
        ),
        t360,
      ),
      t361,
    ),
    t362,
  )
  let t347 = @tactics.conv_tac(@int.integer_rule)
  let t346 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_mul())]))
  let t345 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_sub()),
      @arith.le_1(),
      @arith.mult_eq_0(),
    ]),
  )
  let t344 = @tactics.match_mp_tac(@integer.int_cong_pow())
  let t343 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @integer.int_cong_trans(),
    ),
  )
  let t342 = @simp.asm_rewrite_tac(@list.List([]))
  let t341 = @term_syntax.parse_term("(p : Num)")
  let t348 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("(p : Num) * (n : Num) - 1"), t341]),
                  jacobi_euler_alt(),
                ),
              ),
              t342,
            ),
            t343,
          ),
          t344,
        ),
        t345,
      ),
      t346,
    ),
    t347,
  )
  let t340 = @simp.rewrite_tac(@list.List([@int.int_le_refl()]))
  let t339 = @simp.rewrite_tac(
    @list.List([
      @int.int_abs_pow(),
      @int.int_abs_neg(),
      @int.int_pow_one(),
      @int.int_abs_num(),
    ]),
  )
  let t338 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@prime.odd_prime(), @prime.prime_odd()])),
  ])
  let t337 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_le(), jacobi_bound()]),
  )
  let t349 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.match_mp_tac(
                @int.int_arith(
                  @term_syntax.parse_term("abs((x : Int)) <= int_of_num(1) && abs((y : Int)) <= int_of_num(1) && int_of_num(3) <= (p : Int) → abs(x - y) < p"),
                ),
              ),
              t337,
            ),
            @tactics.conj_tac,
          ),
          t338,
        ),
        t339,
      ),
      t340,
    ),
    t348,
  ])
  let t336 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num((p : Num))"))
  let t364 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(@integer.int_cong_imp_eq()),
          t336,
        ),
        @tactics.conj_tac,
      ),
      t349,
    ),
    t363,
  ])
  let t335 = @tactics.subgoal_then(
    @term_syntax.parse_term("jacobi(((p : Num) * (n : Num) - 1, p)) == pow(-int_of_num(1), DIV(p - 1, 2))"),
    fn(
      x332 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s333 = @tactics.subst1_tac(x332)
      fn(
        x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s333(x334)
      }
    },
  )
  let t330 = @simp.asm_rewrite_tac(@list.List([]))
  let t329 = @simp.asm_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
      @arith.mult_eq_0(),
    ]),
  )
  let t328 = @tactics.replicate_tac(
    2,
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([@tactics.conv_tac(@int.number_rule), @tactics.all_tac]),
    ),
  )
  let t327 = @tactics.match_mp_tac(@pocklington.cong_sub())
  let t331 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(jacobi_cong()), t327),
        t328,
      ),
      t329,
    ),
    t330,
  ])
  let t326 = @tactics.subgoal_then(
    @term_syntax.parse_term("jacobi(((p : Num) * (n : Num) - 1, n)) == jacobi((n - 1, n))"),
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
  )
  let t320 = @drule.match_mp(@prime.prime_imp_nz())
  let t322 = @tactics.first_assum(fn(
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
    })(t320(x321))
  })
  let t316 = @simp.asm_rewrite_tac(@list.List([jacobi_rmul()]))
  let t315 = @tactics.repeat_tac(@tactics.strip_tac)
  let t314 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t313 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t312 = @simp.asm_rewrite_tac(@list.List([@arith.odd_mult()]))
  let t311 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((n : Num))"))
  let t309 = @term_syntax.parse_term("(n : Num)")
  let t310 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t309]),
  )
  let t308 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t307 = @tactics.conv_tac(@int.int_reduce_conv)
  let t306 = @simp.rewrite_tac(@list.List([jacobi_0()]))
  let t305 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t365 = @tactics.thenl(
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
                                  @tactics.match_mp_tac(
                                    @prime.prime_factor_induct(),
                                  ),
                                  t305,
                                ),
                                t306,
                              ),
                              t307,
                            ),
                            t308,
                          ),
                          t310,
                        ),
                        t311,
                      ),
                      t312,
                    ),
                    t313,
                  ),
                  t314,
                ),
                t315,
              ),
              t316,
            ),
            t322,
          ),
          t326,
        ),
        t331,
      ),
      t335,
    ),
    t364,
  )
  jacobi_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ODD(n) → jacobi((n - 1, n)) == pow(-int_of_num(1), DIV(n - 1, 2))"),
      t365,
    ),
  )
}

///|
let jacobi_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_MINUS1")

///|
/// `JACOBI_MINUS1`
pub fn jacobi_minus1() -> @kernel.Thm {
  jacobi_minus1_c.get()
}

///|
/// JACOBI_MINUS1_CASES
fn step_30() -> Unit raise {
  let t370 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one(), @prime.divides_2()]),
  )
  let t368 = @int.number_rule(
    @term_syntax.parse_term("!((t : Num) == 0) → op_eq_eq(t * (n : Num) + 1, 1, mod(t * t)) == divides(t, n)"),
  )
  let t369 = @simp.simp_tac(
    @list.List([
      @calc_num.arith_eq(),
      @int.arith_rule(@term_syntax.parse_term("4 == 2 * 2")),
      t368,
    ]),
  )
  let t367 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("DIV(2 * (n : Num) + 1 - 1, 2) == n")),
    ]),
  )
  let t366 = @simp.simp_tac(
    @list.List([
      @arith.odd_exists(),
      @arith.add1(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t371 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.simp_tac(@list.List([jacobi_minus1()])), t366),
        t367,
      ),
      t369,
    ),
    t370,
  )
  jacobi_minus1_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ODD(n) → jacobi((n - 1, n)) == (if op_eq_eq(n, 1, mod(4)) { int_of_num(1) } else { -int_of_num(1) })"),
      t371,
    ),
  )
}

///|
let jacobi_minus1_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_MINUS1_CASES",
)

///|
/// `JACOBI_MINUS1_CASES`
pub fn jacobi_minus1_cases() -> @kernel.Thm {
  jacobi_minus1_cases_c.get()
}

///|
/// JACOBI_GAUSS_LEMMA
fn step_31() -> Unit raise {
  let t518 = @simp.rewrite_tac(
    @list.List([@int.int_cong_rrem(), @integer.int_cong_refl()]),
  )
  let t515 = @equal.gsym(@int.int_of_num_mul())
  let t516 = @equal.gsym(@int.int_of_num_rem())
  let t517 = @simp.rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq(-(x : Int), (p : Int) - (a : Int), mod(p)) == op_eq_eq(x, a, mod(p))"),
      ),
      t516,
      t515,
    ]),
  )
  let t514 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_sub()),
      @arith.mod_lt_eq(),
      @prime.prime_imp_nz(),
      @int.int_of_num_eq(),
      @arith.lt_imp_le(),
      @int.int_mul_lid(),
      @int.int_mul_lneg(),
      @int.int_mul_rneg(),
    ]),
  )
  let t513 = @simp.asm_rewrite_tac(@list.List([]))
  let t512 = @simp.rewrite_tac(
    @list.List([@class.cond_swap(), @equal.gsym(@arith.not_le())]),
  )
  let t511 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t510 = @simp.rewrite_tac(
    @list.List([@iterate.finite_numseg(), @iterate.in_numseg()]),
  )
  let t509 = @tactics.match_mp_tac(cong_iproduct())
  let t508 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@products.iproduct_mul()),
      @iterate.finite_numseg(),
      @trivia.o_def(),
    ]),
  )
  let t506 = @tactics.disch_then(fn(
    x501 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x501
    @simp.gen_rewrite_tac(
      fn(
        x503 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s504 = @equal.land_conv(x503)
        fn(x505 : @kernel.Term) -> @kernel.Thm raise { s504(x505) }
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t497 = @term_syntax.parse_term("2 * (r : Num) + 1 == (p : Num)")
  let t498 = @term_syntax.parse_term("(j : Num) <= (r : Num)")
  let t499 = @tactics.map_every(
    fn(
      x494 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s495 = @tactics.undisch_tac(x494)
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
    @list.List([@term_syntax.parse_term("(i : Num) <= (r : Num)"), t498, t497]),
  )
  let t493 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → !(i + (j : Num) == 0)"))]),
  )
  let t490 = @drule.match_mp(@int.divides_le())
  let t492 = @tactics.first_assum(fn(
    x491 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x487 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s488 = @tactics.mp_tac(x487)
      fn(
        x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s488(x489)
      }
    })(t490(x491))
  })
  let t486 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@int.coprime(), @prime.divides_refl(), @prime.prime_1()]),
    ),
    @tactics.all_tac,
  ])
  let t485 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(@arith.left_add_distrib()),
      @prime.prime_divprod_eq(),
      @prime.divides_refl(),
    ]),
  )
  let t482 = @drule.match_mp(@pocklington.cong_divides())
  let t484 = @tactics.disch_then(fn(
    x483 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s480 = @tactics.mp_tac(x479)
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
    })(t482(x483))
  })
  let t478 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t477 = @simp.asm_simp_tac(@list.List([@arith.mod_add_mod()]))
  let t473 = @term_syntax.parse_term("MOD")
  let t470 = @term_syntax.parse_term("(p : Num)")
  let t476 = @tactics.disch_then(fn(
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
    (fn(
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
      })(
        (fn(x471 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x468 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x469 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x468, x469)
            }
          })(x471)(t470)
        })(x472),
      )
    })(((x474 : @kernel.Thm) => @equal.ap_term(t473, x474))(x475))
  })
  let t464 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.cong_v1()])),
    @tactics.all_tac,
  ])
  let t463 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x460 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s461 = @tactics.mp_tac(x460)
      fn(
        x462 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s461(x462)
      }
    }),
  )
  let t459 = @simp.asm_simp_tac(
    @list.List([@arith.mod_lt_eq(), @prime.prime_imp_nz()]),
  )
  let t456 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(if (a : Bool) { (x : Num) } else { (p : Num) - x }) == (if (b : Bool) { (y : Num) } else { p - y }) → x < p && y < p → x == y || x + y == p"),
    ),
  )
  let t458 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s454 = @tactics.mp_tac(x453)
      fn(
        x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s454(x455)
      }
    })(t456(x457))
  })
  let t452 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t451 = @tactics.match_mp_tac(@pocklington.cong_mult_lcancel())
  let t450 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @meson.asm_meson_tac(
          @list.List([
            @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (r : Num) → i < 2 * r + 1")),
          ]),
        ),
        @tactics.all_tac,
      ]),
    ),
  )
  let t449 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t448 = @tactics.match_mp_tac(@pocklington.cong_imp_eq())
  let t447 = @tactics.repeat_tac(@tactics.strip_tac)
  let t446 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t445 = @term_syntax.parse_term("(j : Num)")
  let t500 = @tactics.then_tac(
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
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.map_every(
                                                @tactics.x_gen_tac,
                                                @list.List([
                                                  @term_syntax.parse_term("(i : Num)"),
                                                  t445,
                                                ]),
                                              ),
                                              t446,
                                            ),
                                            t447,
                                          ),
                                          t448,
                                        ),
                                        t449,
                                      ),
                                      t450,
                                    ),
                                    t451,
                                  ),
                                  t452,
                                ),
                                t458,
                              ),
                              t459,
                            ),
                            t463,
                          ),
                          t464,
                        ),
                        t476,
                      ),
                      t477,
                    ),
                    t478,
                  ),
                  t484,
                ),
                t485,
              ),
              @tactics.strip_tac,
            ),
            t486,
          ),
          t492,
        ),
        t493,
      ),
      t499,
    ),
    @int.arith_tac,
  )
  let t442 = @int.arith_rule(@term_syntax.parse_term("!(2 * (r : Num) + 1 <= (i : Num) && i <= r)"))
  let t443 = @meson.asm_meson_tac(
    @list.List([
      @int.divides_le(),
      @int.arith_rule(@term_syntax.parse_term("!(1 <= 0)")),
      t442,
    ]),
  )
  let t444 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@int.coprime(), @prime.divides_refl(), @prime.prime_1()]),
    ),
    t443,
  ])
  let t441 = @simp.asm_simp_tac(@list.List([@prime.prime_divprod_eq()]))
  let t440 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.divides_mod()), @prime.prime_imp_nz()]),
  )
  let t439 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(
      @list.List([
        @arith.division(),
        @arith.not_le(),
        @arith.sub_eq_0(),
        @prime.prime_0(),
      ]),
    ),
  ])
  let t438 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)"))]),
  )
  let t437 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@simp.expand_tac("p"), @int.arith_tac),
  ])
  let t436 = @tactics.repeat_tac(@tactics.strip_tac)
  let t507 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
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
                            @tactics.gen_tac,
                            @simp.rewrite_tac(
                              @list.List([@iterate.in_numseg()]),
                            ),
                          ),
                          t436,
                        ),
                        t437,
                      ),
                      t438,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t439,
                ),
                t440,
              ),
              t441,
            ),
            @tactics.strip_tac,
          ),
          t444,
        ),
        t500,
      ]),
    ),
    t506,
  ])
  let t435 = @simp.rewrite_tac(
    @list.List([@trivia.o_thm(), @iterate.finite_numseg()]),
  )
  let t432 = @term_syntax.parse_term("op_dot_dot(1, (r : Num))")
  let t433 = @term_syntax.parse_term("o((x : Num) => if x <= (r : Num) { x } else { (p : Num) - x }, (x : Num) => MOD((a : Num) * x, p))")
  let t434 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(i : Num) => int_of_num(i)"), t433, t432]),
      @products.iproduct_injection(),
    ),
  )
  let t428 = @simp.rewrite_tac(@list.List([@products.iproduct_restrict_set()]))
  let t427 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@products.iproduct_const()),
      @sets.finite_restrict(),
      @iterate.finite_numseg(),
    ]),
  )
  let t429 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x426 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x422 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            (fn(
              x418 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(
                x412 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s413 = @equal.rator_conv(x412)
                fn(x414 : @kernel.Term) -> @kernel.Thm raise { s413(x414) }
              })(
                (fn(
                  x415 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s416 = @equal.land_conv(x415)
                  fn(x417 : @kernel.Term) -> @kernel.Thm raise { s416(x417) }
                })(x418),
              )
            })(
              (fn(
                x419 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s420 = @equal.land_conv(x419)
                fn(x421 : @kernel.Term) -> @kernel.Thm raise { s420(x421) }
              })(x422),
            )
          })(
            (fn(
              x423 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s424 = @equal.rand_conv(x423)
              fn(x425 : @kernel.Term) -> @kernel.Thm raise { s424(x425) }
            })(x426),
          )
        },
        @list.List([@equal.gsym(@iterate.card_numseg_1())]),
      ),
      t427,
    ),
    t428,
  )
  let t411 = @simp.asm_rewrite_tac(@list.List([]))
  let t410 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t409 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t408 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t407 = @simp.rewrite_tac(
    @list.List([
      @iterate.finite_numseg(),
      @iterate.in_numseg(),
      @equal.gsym(@int.num_coprime()),
    ]),
  )
  let t430 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.match_mp_tac(coprime_iproduct()), t407),
              t408,
            ),
            @tactics.strip_tac,
          ),
          t409,
        ),
        t410,
      ),
      t411,
    ),
    @int.asm_arith_tac,
  )
  let t406 = @simp.rewrite_tac(@list.List([@int.int_pow_one()]))
  let t405 = @tactics.conv_tac(@int.int_reduce_conv)
  let t404 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_pow())]))
  let t431 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(
                @int.int_pow_pow(),
              ),
            ]),
          ),
          t404,
        ),
        t405,
      ),
      t406,
    ),
    t430,
    t429,
  ])
  let t403 = @tactics.repeat_tac(@tactics.conj_tac)
  let t402 = @tactics.exists_tac(
    @term_syntax.parse_term("iproduct(op_dot_dot(1, (r : Num)), (i : Num) => int_of_num(i))"),
  )
  let t401 = @tactics.match_mp_tac(
    @int.integer_rule(
      @term_syntax.parse_term("∀ c : Int, pow((x : Int), 2) == int_of_num(1) && coprime(((p : Int), c)) && op_eq_eq((a : Int) * (x * c), c, mod(p)) → op_eq_eq(a, x, mod(p))"),
    ),
  )
  let t400 = @list.List([
    @tactics.then_tac(@simp.expand_tac("p"), @int.arith_tac),
    @tactics.all_tac,
  ])
  let t399 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((p : Num) - 1, 2) == (r : Num)"), fn(
    x396 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s397 = @tactics.subst1_tac(x396)
    fn(
      x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s397(x398)
    }
  })
  let t395 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @integer.int_cong_trans(),
    ),
  )
  let t394 = @simp.asm_rewrite_tac(@list.List([]))
  let t392 = @term_syntax.parse_term("(p : Num)")
  let t393 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t392]), jacobi_euler()),
  )
  let t390 = @simp.simp_tac(
    @list.List([
      @int.int_abs_pow(),
      @int.int_abs_neg(),
      @int.int_pow_one(),
      @int.int_abs_num(),
      @int.int_le_refl(),
    ]),
  )
  let t389 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([@prime.odd_prime(), @prime.prime_odd()])),
  ])
  let t388 = @simp.rewrite_tac(
    @list.List([@int.int_of_num_le(), jacobi_bound()]),
  )
  let t391 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @int.int_arith(
                @term_syntax.parse_term("abs((x : Int)) <= int_of_num(1) && abs((y : Int)) <= int_of_num(1) && int_of_num(3) <= (p : Int) → abs(x - y) < p"),
              ),
            ),
            t388,
          ),
          @tactics.conj_tac,
        ),
        t389,
      ),
      t390,
    ),
    @tactics.all_tac,
  ])
  let t387 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num((p : Num))"))
  let t386 = @tactics.match_mp_tac(@integer.int_cong_imp_eq())
  let t385 = @tactics.disch_then(fn(
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
    (fn(
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
      let s382 = @tactics.assume_tac(x381)
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
    })(@equal.sym(x384))
  })
  let t380 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t379 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t377 = @simp.rewrite_tac(
    @list.List([@arith.odd_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t378 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.prime_odd(), @prime.odd_prime()])),
    t377,
  ])
  let t376 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(
    x373 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s374 = @tactics.mp_tac(x373)
    fn(
      x375 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s374(x375)
    }
  })
  let t372 = @simp.asm_rewrite_tac(@list.List([jacobi_eq_0()]))
  let t519 = @tactics.then_tac(
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
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.repeat_tac(
                                                                          @tactics.strip_tac,
                                                                        ),
                                                                        @class.cond_cases_tac,
                                                                      ),
                                                                      t372,
                                                                    ),
                                                                    t376,
                                                                  ),
                                                                  t378,
                                                                ),
                                                                t379,
                                                              ),
                                                              t380,
                                                            ),
                                                            t385,
                                                          ),
                                                          t386,
                                                        ),
                                                        t387,
                                                      ),
                                                      @tactics.conj_tac,
                                                    ),
                                                    t391,
                                                  ),
                                                  t393,
                                                ),
                                                t394,
                                              ),
                                              t395,
                                            ),
                                            t399,
                                          ),
                                          t400,
                                        ),
                                        t401,
                                      ),
                                      t402,
                                    ),
                                    t403,
                                  ),
                                  t431,
                                ),
                                t434,
                              ),
                              t435,
                            ),
                            @tactics.ants_tac,
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
                ),
                @tactics.strip_tac,
              ),
              t512,
            ),
            @class.cond_cases_tac,
          ),
          t513,
        ),
        t514,
      ),
      t517,
    ),
    t518,
  )
  jacobi_gauss_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && !(p == 2) → jacobi((a, p)) == (if coprime((a, p)) { pow(-int_of_num(1), CARD({(x : Num) | IN(x, op_dot_dot(1, DIV(p - 1, 2))) && DIV(p - 1, 2) < MOD(a * x, p)})) } else { int_of_num(0) })"),
      t519,
    ),
  )
}

///|
let jacobi_gauss_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_GAUSS_LEMMA",
)

///|
/// `JACOBI_GAUSS_LEMMA`
pub fn jacobi_gauss_lemma() -> @kernel.Thm {
  jacobi_gauss_lemma_c.get()
}

///|
/// JACOBI_OF_2
fn step_32() -> Unit raise {
  let t528 = @simp.rewrite_tac(
    @list.List([
      @prime.divides_2(),
      @arith.even_add(),
      @arith.even_exp(),
      @calc_num.arith_eq(),
    ]),
  )
  let t527 = @tactics.match_mp_tac(@prime.divides_mul_l())
  let t526 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("8 == 4 * 2"))]),
  )
  let t525 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("EXP(2 * (n : Num) + 1, 2) - 1 == 4 * (EXP(n, 2) + n)"),
      ),
    ]),
  )
  let t524 = @tactics.disch_then(fn(
    x521 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s522 = @tactics.subst1_tac(x521)
    fn(
      x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s522(x523)
    }
  })
  let t520 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t529 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(
                  @list.List([
                    @arith.odd_exists(),
                    @arith.add1(),
                    @theorems.left_imp_exists_thm(),
                  ]),
                ),
              ),
              t520,
            ),
            t524,
          ),
          t525,
        ),
        t526,
      ),
      t527,
    ),
    t528,
  )
  let lemma0 = @tactics.prove(
    @term_syntax.parse_term("∀ n : Num, ODD(n) → divides(8, EXP(n, 2) - 1)"),
    t529,
  )
  let t543 = @simp.rewrite_tac(
    @list.List([@prime.divides_2(), @calc_num.arith()]),
  )
  let t542 = @simp.asm_simp_tac(@list.List([lemma0]))
  let t541 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides((e : Num), (d : Num)) && divides(d, (a : Num)) && divides(d, (b : Num)) → divides(d * e, a * b)"),
    ),
  )
  let t544 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @int.number_rule(
            @term_syntax.parse_term("divides((d : Num), (a : Num)) → divides(d, a + (b : Num)) == divides(d, b)"),
          ),
        ),
        t541,
      ),
      t542,
    ),
    t543,
  )
  let t537 = @meson.meson(
    @list.List([@arith.odd()]),
    @term_syntax.parse_term("ODD((n : Num)) → !(n == 0)"),
  )
  let t538 = @equal.gsym(@int.int_of_num_sub())
  let t539 = @equal.gsym(@int.int_of_num_mul())
  let t540 = @equal.gsym(@int.int_of_num_add())
  let t545 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(
        @list.List([
          @equal.gsym(@int.int_of_num_eq()),
          t540,
          t539,
          t538,
          @arith.le_1(),
          @arith.mult_eq_0(),
          @arith.exp_2(),
          t537,
        ]),
      ),
      @int.int_arith_tac,
    ),
    t544,
  ])
  let t536 = @tactics.subgoal_then(
    @term_syntax.parse_term("EXP((m : Num) * (n : Num), 2) - 1 == (EXP(m, 2) - 1) * (EXP(n, 2) - 1) + (EXP(m, 2) - 1 + (EXP(n, 2) - 1))"),
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
      let s534 = @tactics.subst1_tac(x533)
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
  let t532 = @simp.asm_simp_tac(
    @list.List([
      @int.divides_divides_div(),
      lemma0,
      @arith.odd_mult(),
      @prime.divides_add(),
    ]),
  )
  let t530 = @equal.gsym(@prime.divides_2())
  let t531 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.div_add()), lemma0, t530]),
  )
  let t546 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t531),
        t532,
      ),
      t536,
    ),
    t545,
  )
  let lemma1 = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m) && ODD(n) → EVEN(DIV(EXP(m * n, 2) - 1, 8)) == EVEN(DIV(EXP(m, 2) - 1, 8) + DIV(EXP(n, 2) - 1, 8))"),
    t546,
  )
  let t597 = @simp.rewrite_tac(
    @list.List([
      @arith.even_add(),
      @arith.even_mult(),
      @arith.even_exp(),
      @calc_num.arith(),
    ]),
  )
  let t596 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("DIV(EXP(2 * (q : Num) + 1, 2) + (2 * q + 1), 2) == 2 * EXP(q, 2) + (3 * q + 1)"),
      ),
    ]),
  )
  let t595 = @simp.rewrite_tac(
    @list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]),
  )
  let t594 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t593 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("DIV(EXP(2 * (q : Num), 2), 2) == 2 * (q * q)")),
    ]),
  )
  let t592 = @simp.simp_tac(
    @list.List([
      @arith.mod_mult_add(),
      @arith.div_mult_add(),
      @calc_num.arith_eq(),
      @arith.div_mult(),
      @arith.mod_mult(),
    ]),
  )
  let t591 = @simp.asm_rewrite_tac(@list.List([]))
  let t590 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t589 = @simp.rewrite_tac(
    @list.List([
      @arith.add1(),
      @theorems.or_exists_thm(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t587 = @simp.rewrite_rule(
    @list.List([@arith.even_exists(), @arith.odd_exists()]),
  )(@arith.even_or_odd())
  let t588 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Num)"), t587))
  let t586 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("DIV(EXP(2 * (n : Num) + 1, 2) - 1, 8) == DIV(EXP(n, 2) + n, 2)"),
      ),
    ]),
  )
  let t585 = @simp.simp_tac(
    @list.List([@arith.add_sub(), @arith.div_mult(), @calc_num.arith_eq()]),
  )
  let t584 = @tactics.disch_then(fn(
    x581 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s582 = @tactics.subst1_tac(x581)
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
  })
  let t580 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Num)"))
  let t579 = @simp.rewrite_tac(
    @list.List([
      @arith.odd_exists(),
      @arith.add1(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t578 = @tactics.undisch_tac(@term_syntax.parse_term("ODD((p : Num))"))
  let t577 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(n : Num) + 1 - (DIV(n, 2) + 1) == DIV(n, 2) + MOD(n, 2)"),
      ),
    ]),
  )
  let t576 = @simp.asm_simp_tac(@list.List([@arith.even_add(), lemma1]))
  let t575 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t574 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_add())]))
  let t573 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@iterate.numseg()), @iterate.card_numseg()]),
  )
  let t572 = @simp.rewrite_tac(
    @list.List([
      @class.not_imp(),
      @int.arith_rule(
        @term_syntax.parse_term("((1 <= (x : Num) && x <= (b : Num)) && (c : Num) < 2 * x) == (DIV(c, 2) + 1 <= x && x <= b)"),
      ),
    ]),
  )
  let t571 = @simp.asm_simp_tac(
    @list.List([
      @prime.prime_imp_nz(),
      @arith.mod_lt(),
      @int.arith_rule(
        @term_syntax.parse_term("1 <= (x : Num) && x <= DIV((p : Num) - 1, 2) → 2 * x < p"),
      ),
    ]),
  )
  let t570 = @simp.once_rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("(((p : Bool) && (q : Bool)) && (r : Bool)) == !(p && q → !r)")),
    ]),
  )
  let t569 = @simp.asm_simp_tac(
    @list.List([jacobi_gauss_lemma(), @prime.coprime_2(), @iterate.in_numseg()]),
  )
  let t568 = @simp.rewrite_tac(@list.List([jacobi_rmul()]))
  let t567 = @tactics.repeat_tac(@tactics.strip_tac)
  let t566 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t565 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t564 = @simp.asm_rewrite_tac(@list.List([@arith.odd_mult()]))
  let t563 = @class.asm_cases_tac(@term_syntax.parse_term("ODD((n : Num))"))
  let t561 = @term_syntax.parse_term("(n : Num)")
  let t562 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(p : Num)"), t561]),
  )
  let t560 = @tactics.conv_tac(@int.int_reduce_conv)
  let t559 = @simp.rewrite_tac(@list.List([jacobi_1()]))
  let t558 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t557 = @tactics.match_mp_tac(@prime.prime_factor_induct())
  let t555 = @term_syntax.parse_term("(n : Num)")
  let t556 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t555)
  let t551 = @simp.gen_rewrite_rule(
    fn(
      x550 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x550
    },
    @list.List([@arith.not_even()]),
  )
  let t553 = @tactics.first_x_assum(fn(
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
    (fn(
      x547 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s548 = @tactics.mp_tac(x547)
      fn(
        x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s548(x549)
      }
    })(t551(x552))
  })
  let t554 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        jacobi_eq_0(),
        @prime.coprime_2(),
        @equal.gsym(@arith.not_even()),
      ]),
    ),
    t553,
  ])
  let t598 = @tactics.then_tac(
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
                                                                                            @tactics.gen_tac,
                                                                                            @class.cond_cases_tac,
                                                                                          ),
                                                                                          t554,
                                                                                        ),
                                                                                        t556,
                                                                                      ),
                                                                                      t557,
                                                                                    ),
                                                                                    t558,
                                                                                  ),
                                                                                  t559,
                                                                                ),
                                                                                t560,
                                                                              ),
                                                                              t562,
                                                                            ),
                                                                            t563,
                                                                          ),
                                                                          t564,
                                                                        ),
                                                                        t565,
                                                                      ),
                                                                      t566,
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
                                                  @tactics.ap_thm_tac,
                                                ),
                                                @tactics.ap_thm_tac,
                                              ),
                                              @tactics.ap_term_tac,
                                            ),
                                            t576,
                                          ),
                                          @tactics.ap_thm_tac,
                                        ),
                                        @tactics.ap_term_tac,
                                      ),
                                      t577,
                                    ),
                                    t578,
                                  ),
                                  t579,
                                ),
                                t580,
                              ),
                              t584,
                            ),
                            t585,
                          ),
                          t586,
                        ),
                        t588,
                      ),
                      t589,
                    ),
                    t590,
                  ),
                  @tactics.strip_tac,
                ),
                t591,
              ),
              t592,
            ),
            t593,
          ),
          t594,
        ),
        t595,
      ),
      t596,
    ),
    t597,
  )
  jacobi_of_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, jacobi((2, n)) == (if EVEN(n) { int_of_num(0) } else { pow(-int_of_num(1), DIV(EXP(n, 2) - 1, 8)) })"),
      t598,
    ),
  )
}

///|
let jacobi_of_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_OF_2")

///|
/// `JACOBI_OF_2`
pub fn jacobi_of_2() -> @kernel.Thm {
  jacobi_of_2_c.get()
}

///|
/// JACOBI_OF_2_CASES
fn step_33() -> Unit raise {
  let t653 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t652 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t650 = @term_syntax.parse_term("(k : Num)")
  let t651 = @tactics.spec_tac(@term_syntax.parse_term("MOD((p : Num), 8)"), t650)
  let t649 = @tactics.mp_tac(@int.arith_rule(@term_syntax.parse_term("MOD((p : Num), 8) < 8")))
  let t646 = @simp.rewrite_tac(
    @list.List([@pocklington.cong_refl(), @int.cong_lmod()]),
  )
  let t645 = @tactics.repeat_tac(@tactics.conj_tac)
  let t644 = @tactics.match_mp_tac(@pocklington.cong_mult())
  let t647 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.orelse_tac(
          @tactics.match_mp_tac(@pocklington.cong_add()),
          t644,
        ),
        t645,
      ),
      t646,
    ),
  )
  let t643 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t648 = @tactics.thenl(
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
      (fn(
        x636 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let (asl, w) = x636
        let t638 = @term_syntax.parse_term("(p : Num)")
        @tactics.subgoal_then(
          @basics.subst(@list.List([(@term_syntax.parse_term("MOD((p : Num), 8)"), t638)]), w),
          fn(
            x639 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s640 = @tactics.mp_tac(x639)
            fn(
              x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s640(x641)
            }
          },
        )
      })(x642)(x642)
    },
    @list.List([
      @tactics.all_tac,
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@theorems.eq_imp()),
                  @tactics.binop_tac,
                ),
                @list.List([@tactics.all_tac, @tactics.binop_tac]),
              ),
              @tactics.ap_thm_tac,
            ),
            @tactics.ap_term_tac,
          ),
          t643,
        ),
        t647,
      ),
    ]),
  )
  let t635 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t634 = @simp.rewrite_tac(@list.List([@int.divides_mod(), @int.cong_v1()]))
  let t633 = @tactics.disch_then(fn(
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
    let th = x631
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t630 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t629 = @simp.rewrite_tac(@list.List([@equal.gsym(@prime.divides_2())]))
  let t625 = @term_syntax.parse_term("4")
  let t626 = @term_syntax.parse_term("(n : Num)")
  let t627 = @bool.specl(
    @list.List([@term_syntax.parse_term("2"), t626, t625]),
    @prime.divides_lmul2_eq(),
  )
  let t628 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(n : Num)"), t627))
  let t623 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("DIV((2 * (p : Num) + 1) * (2 * p + 1 + 1), 2) == (p + 1) * (2 * p + 1)"),
      ),
    ]),
  )
  let t624 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @int.arith_rule(
          @term_syntax.parse_term("DIV(2 * (p : Num) * (2 * p + 1), 2) == p * (2 * p + 1)"),
        ),
      ]),
    ),
    t623,
  ])
  let t622 = @tactics.disch_then(
    @tactics.disj_cases_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
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
        let s620 = @tactics.subst1_tac(x619)
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
      }),
    ),
  )
  let t617 = @simp.rewrite_rule(
    @list.List([@arith.even_exists(), @arith.odd_exists(), @arith.add1()]),
  )(@arith.even_or_odd())
  let t618 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), t617))
  let t616 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t615 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((n : Num) + 1, 7, mod((p : Num))) == op_eq_eq(n, 6, mod(p))"),
      ),
    ]),
  )
  let t614 = @simp.rewrite_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((n : Num) + 1, 1, mod((p : Num))) == op_eq_eq(n, 0, mod(p))"),
      ),
    ]),
  )
  let t613 = @tactics.disch_then(fn(
    x610 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s611 = @tactics.subst1_tac(x610)
    fn(
      x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s611(x612)
    }
  })
  let t609 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t608 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("DIV(EXP(2 * (m : Num) + 1, 2) - 1, 8) == DIV(m * (m + 1), 2)"),
      ),
    ]),
  )
  let t607 = @simp.simp_tac(
    @list.List([
      @arith.odd_exists(),
      @arith.add1(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t604 = @simp.gen_rewrite_rule(
    fn(
      x603 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x603
    },
    @list.List([@arith.not_even()]),
  )
  let t606 = @tactics.first_x_assum(fn(
    x605 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x600 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s601 = @tactics.mp_tac(x600)
      fn(
        x602 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s601(x602)
      }
    })(t604(x605))
  })
  let t599 = @simp.rewrite_tac(@list.List([]))
  let t654 = @tactics.then_tac(
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
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.then_tac(
                                                          @tactics.gen_tac,
                                                          @simp.rewrite_tac(
                                                            @list.List([
                                                              jacobi_of_2(),
                                                            ]),
                                                          ),
                                                        ),
                                                        @class.cond_cases_tac,
                                                      ),
                                                      t599,
                                                    ),
                                                    t606,
                                                  ),
                                                  t607,
                                                ),
                                                t608,
                                              ),
                                              t609,
                                            ),
                                            t613,
                                          ),
                                          t614,
                                        ),
                                        t615,
                                      ),
                                      t616,
                                    ),
                                    @tactics.ap_thm_tac,
                                  ),
                                  @tactics.ap_thm_tac,
                                ),
                                @tactics.ap_term_tac,
                              ),
                              t618,
                            ),
                            t622,
                          ),
                          t624,
                        ),
                        t628,
                      ),
                      t629,
                    ),
                    t630,
                  ),
                  t633,
                ),
                t634,
              ),
              t635,
            ),
            t648,
          ),
          t649,
        ),
        t651,
      ),
      t652,
    ),
    t653,
  )
  jacobi_of_2_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, jacobi((2, n)) == (if EVEN(n) { int_of_num(0) } else { if op_eq_eq(n, 1, mod(8)) || op_eq_eq(n, 7, mod(8)) { int_of_num(1) } else { -int_of_num(1) } })"),
      t654,
    ),
  )
}

///|
let jacobi_of_2_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_OF_2_CASES",
)

///|
/// `JACOBI_OF_2_CASES`
pub fn jacobi_of_2_cases() -> @kernel.Thm {
  jacobi_of_2_cases_c.get()
}

///|
/// JACOBI_RECIPROCITY_ALT
fn step_34() -> Unit raise {
  let t655 = @simp.simp_tac(
    @list.List([
      @prime.divides_2(),
      @arith.even_sub(),
      @equal.gsym(@arith.not_even()),
      @calc_num.arith(),
    ]),
  )
  let lemma0 = @tactics.prove(
    @term_syntax.parse_term("∀ n : Num, ODD(n) → divides(2, n - 1)"),
    t655,
  )
  let t668 = @simp.asm_rewrite_tac(
    @list.List([@arith.suc_sub1(), @arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t667 = @tactics.repeat_tac(@tactics.strip_tac)
  let t664 = @simp.gen_rewrite_rule(
    fn(
      x663 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x663
    },
    @list.List([@arith.odd_exists()]),
  )
  let t666 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x665 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    }),
  )
  let t659 = @simp.asm_simp_tac(@list.List([@prime.divides_mul2(), lemma0]))
  let t658 = @tactics.match_mp_tac(
    @int.number_rule(
      @term_syntax.parse_term("divides((d : Num), (a : Num) * (b : Num)) && a * b + (a + b) == (c : Num) → divides(d, c) == divides(d, a + b)"),
    ),
  )
  let t657 = @simp.asm_simp_tac(
    @list.List([
      @int.divides_divides_div(),
      @equal.gsym(@prime.divides_2()),
      @arith.odd_mult(),
      @prime.divides_add(),
      lemma0,
    ]),
  )
  let t656 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.div_add()), @prime.divides_2(), lemma0]),
  )
  let t669 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t656),
                t657,
              ),
              t658,
            ),
            t659,
          ),
          t666,
        ),
        t667,
      ),
      t668,
    ),
    @int.arith_tac,
  )
  let lemma1 = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m) && ODD(n) → EVEN(DIV(m * n - 1, 2)) == EVEN(DIV(m - 1, 2) + DIV(n - 1, 2))"),
    t669,
  )
  let t673 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.forall_in_gspec(), @sets.in_cross()]),
  )
  let t672 = @simp.rewrite_tac(
    @list.List([@sets.finite_cross_eq(), @iterate.finite_numseg()]),
  )
  let t671 = @tactics.exists_tac(@term_syntax.parse_term("CROSS(op_dot_dot(1, (r : Num)), op_dot_dot(1, (s : Num)))"))
  let t670 = @tactics.match_mp_tac(@sets.finite_subset())
  let t674 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t670),
        t671,
      ),
      t672,
    ),
    t673,
  )
  let flemma = @tactics.prove(
    @term_syntax.parse_term("∀ r : Num, ∀ s : Num, ∀ p : (Num, Num) -> Bool, FINITE({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, r)) && IN(y, op_dot_dot(1, s)) && p(x, y)})"),
    t674,
  )
  let t785 = @drule.match_mp(@arith.division())
  let t782 = @term_syntax.parse_term("(q : Num) * (x : Num)")
  let t787 = @tactics.disch_then(fn(
    x786 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
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
        let s780 = @tactics.mp_tac(x779)
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
      })(((x783 : @kernel.Thm) => @bool.spec(t782, x783))(x784))
    })(t785(x786))
  })
  let t777 = @kernel.assume_rule(@term_syntax.parse_term("prime((p : Num))"))
  let t778 = @tactics.mp_tac(@drule.match_mp(@prime.prime_imp_nz())(t777))
  let t774 = @list.List([
    @simp.asm_simp_tac(
      @list.List([@arith.le_mult_rcancel(), @prime.prime_imp_nz()]),
    ),
    @tactics.all_tac,
  ])
  let t775 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("(DIV((q : Num) * (x : Num), (p : Num)) + 2) * p <= (y : Num) * p"),
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
        let s772 = @tactics.mp_tac(x771)
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
    ),
    t774,
  )
  let t770 = @list.List([
    @simp.asm_simp_tac(
      @list.List([@arith.le_mult_rcancel(), @prime.prime_imp_nz()]),
    ),
    @tactics.all_tac,
  ])
  let t776 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("(y : Num) * (p : Num) <= DIV((q : Num) * (x : Num), p) * p"),
        fn(
          x767 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s768 = @tactics.mp_tac(x767)
          fn(
            x769 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s768(x769)
          }
        },
      ),
      t770,
    ),
    t775,
  ])
  let t766 = @tactics.repeat_tac(@tactics.strip_tac)
  let t765 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("!((x : Num) <= (y : Num)) && !(y + 2 <= x) → x == y + 1"),
    ),
  )
  let t763 = @meson.asm_meson_tac(
    @list.List([@arith.division(), @prime.prime_imp_nz()]),
  )
  let t761 = @term_syntax.parse_term("DIV((q : Num) * (x : Num), (p : Num))")
  let t762 = @tactics.map_every(
    fn(
      x758 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s759 = @tactics.exists_tac(x758)
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
    @list.List([@term_syntax.parse_term("(p : Num)"), t761]),
  )
  let t757 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("∀ p : Num, ∀ d : Num, 2 * (r : Num) + 1 == p && p * (d + 1) <= d * p + (m : Num) + r → r < m"),
    ),
  )
  let t764 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
            let s755 = @tactics.subst_all_tac(x754)
            fn(
              x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s755(x756)
            }
          }),
          t757,
        ),
        t762,
      ),
      t763,
    ),
  ])
  let t788 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.match_mp_tac(
                    @class.taut(
                      @term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b"),
                    ),
                  ),
                  @tactics.conj_tac,
                ),
                t764,
              ),
              t765,
            ),
            t766,
          ),
          t776,
        ),
        t778,
      ),
      t787,
    ),
    @int.asm_arith_tac,
  )
  let t753 = @tactics.undisch_tac(@term_syntax.parse_term("2 * (r : Num) + 1 == (p : Num)"))
  let t752 = @tactics.first_assum(
    @tactics.conjuncts_then2(
      fn(
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
        let s747 = @tactics.subst1_tac(x746)
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
      },
      fn(
        x749 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s750 = @tactics.mp_tac(x749)
        fn(
          x751 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s750(x751)
        }
      },
    ),
  )
  let t743 = @drule.match_mp(@arith.division())
  let t740 = @term_syntax.parse_term("(q : Num) * (x : Num)")
  let t745 = @tactics.disch_then(fn(
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
    (fn(
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
        let s738 = @tactics.mp_tac(x737)
        fn(
          x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s738(x739)
        }
      })(((x741 : @kernel.Thm) => @bool.spec(t740, x741))(x742))
    })(t743(x744))
  })
  let t736 = @kernel.assume_rule(@term_syntax.parse_term("prime((p : Num))"))
  let t789 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.mp_tac(@drule.match_mp(@prime.prime_imp_nz())(t736)),
            t745,
          ),
          t752,
        ),
        t753,
      ),
      @int.arith_tac,
    ),
    t788,
  ])
  let t734 = @term_syntax.parse_term("(y : Num)")
  let t735 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Num)"), t734]),
  )
  let t790 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.ap_term_tac,
                @simp.rewrite_tac(
                  @list.List([
                    @sets.extension(),
                    @sets.in_elim_pair_thm(),
                    @pair.forall_pair_thm(),
                  ]),
                ),
              ),
              t735,
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.ap_term_tac,
        ),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t789,
  )
  let t731 = @simp.simp_tac(
    @list.List([
      @arith.lt_mult_lcancel(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) < (y : Num) → x + 1 <= y")),
    ]),
  )
  let t728 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(2 * (r : Num) + 1) * (d : Num) + r < (2 * (s : Num) + 1) * r → 2 * r * d < 2 * r * s"),
    ),
  )
  let t730 = @tactics.disch_then(fn(
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
      let s726 = @tactics.mp_tac(x725)
      fn(
        x727 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s726(x727)
      }
    })(t728(x729))
  })
  let t732 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x722 : String,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s723 = @simp.expand_tac(x722)
          fn(
            x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s723(x724)
          }
        },
        @list.List(["p", "q"]),
      ),
      t730,
    ),
    t731,
  )
  let t721 = @meson.asm_meson_tac(
    @list.List([
      @prime.prime_imp_nz(),
      @arith.lt_add_lcancel(),
      @arith.division(),
    ]),
  )
  let t720 = @simp.gen_rewrite_tac(
    fn(
      x719 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x713 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s714 = @equal.land_conv(x713)
        fn(x715 : @kernel.Term) -> @kernel.Thm raise { s714(x715) }
      })(
        (fn(
          x716 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s717 = @equal.once_depth_conv(x716)
          fn(x718 : @kernel.Term) -> @kernel.Thm raise { s717(x718) }
        })(x719),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t712 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t711 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num) * (x : Num)"))
  let t733 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@arith.lte_trans()), t711),
          t712,
        ),
        t720,
      ),
      t721,
    ),
    t732,
  ])
  let t710 = @tactics.subgoal_then(
    @term_syntax.parse_term("(p : Num) * DIV((q : Num) * (x : Num), p) + (r : Num) < q * r"),
    fn(
      x707 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s708 = @tactics.mp_tac(x707)
      fn(
        x709 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s708(x709)
      }
    },
  )
  let t706 = @simp.asm_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]),
  )
  let t705 = @tactics.exists_tac(@term_syntax.parse_term("DIV((q : Num) * (x : Num), (p : Num)) + 1"))
  let t704 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t703 = @simp.simp_tac(@list.List([@pair.pair_eq()]))
  let t702 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t701 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t700 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_gspec(),
      @theorems.exists_unique_thm(),
      @iterate.in_numseg(),
      flemma,
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @sets.exists_in_gspec(),
    ]),
  )
  let t699 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), x))"))
  let t791 = @list.List([
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
                                @tactics.match_mp_tac(@sets.card_image_inj_eq()),
                                t699,
                              ),
                              t700,
                            ),
                            @tactics.conj_tac,
                          ),
                          t701,
                        ),
                        t702,
                      ),
                      @tactics.disch_tac,
                    ),
                    @tactics.disch_tac,
                  ),
                  @tactics.disch_tac,
                ),
                t703,
              ),
              t704,
            ),
            t705,
          ),
          t706,
        ),
        t710,
      ),
      t733,
    ),
    t790,
  ])
  let t698 = @tactics.exists_tac(
    @term_syntax.parse_term("CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && y == DIV((q : Num) * x, (p : Num)) + 1 && r < MOD(q * x, p)})"),
  )
  let t697 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t696 = @list.List([
    @tactics.then_tac(@simp.expand_tac("p"), @int.arith_tac),
    @tactics.all_tac,
  ])
  let t695 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((p : Num) - 1, 2) == (r : Num)"), fn(
    x692 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s693 = @tactics.subst1_tac(x692)
    fn(
      x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s693(x694)
    }
  })
  let t690 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x687 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s688 = @tactics.subst1_tac(x687)
      fn(
        x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s688(x689)
      }
    }),
    @tactics.ap_term_tac,
  )
  let t686 = @simp.rewrite_tac(
    @list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]),
  )
  let t682 = @term_syntax.parse_term("EVEN")
  let t685 = @tactics.disch_then(fn(
    x684 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x683 : @kernel.Thm) => @equal.ap_term(t682, x683))(x684))
  })
  let t691 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("p"), t685), t686),
    t690,
  ])
  let t678 = @simp.asm_rewrite_tac(@list.List([]))
  let t676 = @term_syntax.parse_term("(p : Num)")
  let t677 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(q : Num)"), t676]),
      jacobi_gauss_lemma(),
    ),
  )
  let t675 = @tactics.repeat_tac(@tactics.strip_tac)
  let t792 = @tactics.thenl(
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
                        @simp.once_rewrite_tac(
                          @list.List([@prime.coprime_sym()]),
                        ),
                        t675,
                      ),
                      t677,
                    ),
                    t678,
                  ),
                  @tactics.ants_tac,
                ),
                t691,
              ),
              t695,
            ),
            t696,
          ),
          t697,
        ),
        t698,
      ),
      @tactics.conj_tac,
    ),
    t791,
  )
  let glemma = @tactics.prove(
    @term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, prime(p) && prime(q) && coprime((p, q)) && 2 * r + 1 == p && 2 * s + 1 == q → jacobi((q, p)) == pow(-int_of_num(1), CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, r)) && IN(y, op_dot_dot(1, s)) && q * x < p * y && p * y <= q * x + r}))"),
    t792,
  )
  let t808 = @meson.meson_tac(@list.List([]))
  let t807 = @simp.simp_tac(
    @list.List([@sets.in_elim_pair_thm(), @pair.pair_eq()]),
  )
  let t806 = @simp.rewrite_tac(
    @list.List([
      @theorems.exists_unique_thm(),
      @pair.forall_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t805 = @simp.rewrite_tac(@list.List([flemma]))
  let t804 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x)))"))
  let t803 = @tactics.match_mp_tac(@sets.card_image_inj_eq())
  let t802 = @tactics.disch_then(fn(
    x799 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s800 = @tactics.subst1_tac(x799)
    fn(
      x801 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s800(x801)
    }
  })
  let t798 = @simp.asm_rewrite_tac(@list.List([]))
  let t797 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t793 = @term_syntax.parse_term("(r : Num)")
  let t794 = @term_syntax.parse_term("(s : Num)")
  let t795 = @term_syntax.parse_term("(p : Num)")
  let t796 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(q : Num)"), t795, t794, t793]),
      glemma,
    ),
  )
  let t809 = @tactics.then_tac(
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
                        t796,
                      ),
                      t797,
                    ),
                    t798,
                  ),
                  t802,
                ),
                @tactics.ap_term_tac,
              ),
              t803,
            ),
            t804,
          ),
          t805,
        ),
        t806,
      ),
      t807,
    ),
    t808,
  )
  let hlemma = @tactics.prove(
    @term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, prime(p) && prime(q) && coprime((p, q)) && 2 * r + 1 == p && 2 * s + 1 == q → jacobi((p, q)) == pow(-int_of_num(1), CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, r)) && IN(y, op_dot_dot(1, s)) && p * y < q * x && q * x <= p * y + s}))"),
    t809,
  )
  let t839 = @simp.asm_simp_tac(
    @list.List([
      @sets.card_union(),
      @sets.finite_union(),
      @sets.set_rule(
        @term_syntax.parse_term("(INTER((a : (_) -> Bool), UNION((b : (_) -> Bool), (c : (_) -> Bool))) == {}) == (INTER(a, b) == {} && INTER(a, c) == {})"),
      ),
    ]),
  )
  let t838 = @simp.rewrite_tac(
    @list.List([@lists.pairwise(), @sets.disjoint(), @lists.all()]),
  )
  let t835 = @simp.gen_rewrite_rule(
    fn(
      x834 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x834
    },
    @list.List([@lists.pairwise()]),
  )
  let t837 = @tactics.first_x_assum(fn(
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
    (fn(
      x831 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s832 = @tactics.mp_tac(x831)
      fn(
        x833 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s832(x833)
      }
    })(t835(x836))
  })
  let t830 = @tactics.disch_then(fn(
    x829 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x826 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s827 = @tactics.subst1_tac(x826)
      fn(
        x828 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s827(x828)
      }
    })(@equal.sym(x829))
  })
  let t825 = @simp.simp_tac(
    @list.List([
      @sets.card_cross(),
      @iterate.card_numseg_1(),
      @iterate.finite_numseg(),
    ]),
  )
  let t821 = @term_syntax.parse_term("(CARD : (((Num, Num)) -> Bool) -> Num)")
  let t824 = @tactics.first_x_assum(fn(
    x823 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s819 = @tactics.mp_tac(x818)
      fn(
        x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s819(x820)
      }
    })(((x822 : @kernel.Thm) => @equal.ap_term(t821, x822))(x823))
  })
  let t816 = @simp.rewrite_tac(
    @list.List([@sets.finite_cross_eq(), @iterate.finite_numseg()]),
  )
  let t817 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.finite_union())])),
      t816,
    ),
    @tactics.all_tac,
  ])
  let t815 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE((a : ((Num, Num)) -> Bool)) && FINITE((b : ((Num, Num)) -> Bool)) && FINITE((c : ((Num, Num)) -> Bool)) && FINITE((d : ((Num, Num)) -> Bool))"),
    @tactics.strip_assume_tac,
  )
  let t814 = @tactics.subgoal_then(
    @term_syntax.parse_term("CARD((a : ((Num, Num)) -> Bool)) + (CARD((b : ((Num, Num)) -> Bool)) + (CARD((c : ((Num, Num)) -> Bool)) + CARD((d : ((Num, Num)) -> Bool)))) == (r : Num) * (s : Num)"),
    fn(
      x810 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x810
      let t813 = @tactics.conv_tac(@class.taut)
      let t812 = @simp.asm_rewrite_tac(
        @list.List([
          @arith.even_add(),
          @equal.gsym(@arith.not_even()),
          @arith.even_mult(),
        ]),
      )
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(@equal.ap_term(@term_syntax.parse_term("EVEN"), th)),
          t812,
        ),
        t813,
      )
    },
  )
  let t840 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t814,
                  ),
                  t815,
                ),
                t817,
              ),
              t824,
            ),
            t825,
          ),
          t830,
        ),
        t837,
      ),
      t838,
    ),
    t839,
  )
  let rlemma = @tactics.prove(
    @term_syntax.parse_term("∀ a : ((Num, Num)) -> Bool, ∀ b : ((Num, Num)) -> Bool, ∀ c : ((Num, Num)) -> Bool, ∀ d : ((Num, Num)) -> Bool, ∀ r : Num, ∀ s : Num, UNION(a, UNION(b, UNION(c, d))) == CROSS(op_dot_dot(1, r), op_dot_dot(1, s)) && PAIRWISE(DISJOINT, [a, b, c, d]) && CARD(b) == CARD(c) → (EVEN(CARD(a)) == EVEN(CARD(d))) == !(ODD(r) && ODD(s))"),
    t840,
  )
  let t985 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x984 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x981 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s982 = @tactics.subst_all_tac(x981)
        fn(
          x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s982(x983)
        }
      })(@equal.sym(x984))
    }),
  )
  let t980 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((a : Num) + (x : Num) < (y : Num) + a) == (x < y)")),
    ]),
  )
  let t979 = @simp.asm_simp_tac(
    @list.List([
      @arith.le_mult_lcancel(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (r : Num) → x <= r + 1")),
    ]),
  )
  let t978 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(x : Num) <= (y : Num) && (v : Num) + (y + (z : Num)) < x + (u : Num) → y - x + z < u - v"),
    ),
  )
  let t977 = @tactics.repeat_tac(@tactics.strip_tac)
  let t976 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib()]))
  let t975 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("1 <= (x : Num) && x <= (y : Num) → 1 <= y + 1 - x && y + 1 - x <= y"),
      ),
    ]),
  )
  let t974 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(x : Num) <= (y : Num) → y + 1 - (y + 1 - x) == x"),
      ),
    ]),
  )
  let t972 = @term_syntax.parse_term("(y : Num)")
  let t973 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Num)"), t972]),
  )
  let t971 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
      @iterate.in_numseg(),
      @pair.pair_eq(),
    ]),
  )
  let t970 = @simp.rewrite_tac(@list.List([flemma]))
  let t969 = @tactics.repeat_tac(
    @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), ((r : Num) + 1 - x, (s : Num) + 1 - y)))")),
  )
  let t986 = @tactics.then_tac(
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
                              @tactics.match_mp_tac(@sets.bijections_card_eq()),
                              t969,
                            ),
                            t970,
                          ),
                          t971,
                        ),
                        @tactics.conj_tac,
                      ),
                      t973,
                    ),
                    t974,
                  ),
                  t975,
                ),
                t976,
              ),
              t977,
            ),
            t978,
          ),
          t979,
        ),
        t980,
      ),
      t985,
    ),
    @int.asm_arith_tac,
  )
  let t968 = @simp.expand_tac("p")
  let t967 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t966 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), op_dot_dot(1, (r : Num)))"))
  let t963 = @drule.match_mp(@int.divides_le())
  let t965 = @tactics.first_x_assum(fn(
    x964 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x960 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s961 = @tactics.mp_tac(x960)
      fn(
        x962 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s961(x962)
      }
    })(t963(x964))
  })
  let t959 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@prime.divides_refl(), @prime.prime_1(), @int.coprime()]),
    ),
    @tactics.all_tac,
  ])
  let t958 = @simp.asm_simp_tac(
    @list.List([@prime.prime_divprod_eq(), @prime.divides_refl()]),
  )
  let t954 = @term_syntax.parse_term("divides((p : Num))")
  let t957 = @tactics.disch_then(fn(
    x956 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x951 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s952 = @tactics.mp_tac(x951)
      fn(
        x953 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s952(x953)
      }
    })(((x955 : @kernel.Thm) => @equal.ap_term(t954, x955))(x956))
  })
  let t950 = @tactics.subgoal_then(@term_syntax.parse_term("!((q : Num) * (x : Num) == (p : Num) * (y : Num))"), fn(
    x948 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x948
    @tactics.then_tac(@tactics.mp_tac(th_1), @int.arith_tac)
  })
  let t947 = @simp.asm_simp_tac(@list.List([]))
  let t945 = @term_syntax.parse_term("IN((y : Num), op_dot_dot(1, (s : Num)))")
  let t946 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("IN((x : Num), op_dot_dot(1, (r : Num)))"), t945]),
  )
  let t944 = @term_syntax.parse_term("(y : Num)")
  let t987 = @list.List([
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
                              @list.List([@term_syntax.parse_term("(x : Num)"), t944]),
                            ),
                            t946,
                          ),
                          t947,
                        ),
                        t950,
                      ),
                      t957,
                    ),
                    t958,
                  ),
                  @tactics.strip_tac,
                ),
                t959,
              ),
              t965,
            ),
            t966,
          ),
          t967,
        ),
        t968,
      ),
      @int.arith_tac,
    ),
    @int.arith_tac,
    t986,
  ])
  let t943 = @simp.rewrite_tac(
    @list.List([
      @lists.pairwise(),
      @sets.disjoint(),
      @sets.extension(),
      @sets.not_in_empty(),
      @pair.forall_pair_thm(),
      @lists.all(),
      @sets.in_union(),
      @sets.in_cross(),
      @sets.in_elim_pair_thm(),
      @sets.in_inter(),
    ]),
  )
  let t942 = @tactics.repeat_tac(@tactics.conj_tac)
  let t941 = @tactics.exists_tac(
    @term_syntax.parse_term("{((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && (p : Num) * y + s < (q : Num) * x}"),
  )
  let t940 = @tactics.exists_tac(
    @term_syntax.parse_term("{((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && (q : Num) * x + r < (p : Num) * y}"),
  )
  let t939 = @tactics.match_mp_tac(rlemma)
  let t938 = @simp.rewrite_tac(
    @list.List([@arith.even_add(), @arith.odd_mult()]),
  )
  let t937 = @simp.gen_rewrite_tac(
    fn(
      x934 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s935 = @equal.rand_conv(x934)
      fn(x936 : @kernel.Term) -> @kernel.Thm raise { s935(x936) }
    },
    @list.List([@equal.gsym(@arith.not_odd())]),
  )
  let t933 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t932 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_add())]))
  let t931 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x928 : String,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s929 = @simp.expand_tac(x928)
          fn(
            x930 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s929(x930)
          }
        },
        @list.List(["p", "q"]),
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t926 = @tactics.conjuncts_then(fn(
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
    let s924 = @tactics.subst1_tac(x923)
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
  })
  let t927 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((p : Num) - 1, 2) == (r : Num) && DIV((q : Num) - 1, 2) == (s : Num)"),
    t926,
  )
  let t922 = @tactics.repeat_tac(
    @tactics.disch_then(fn(
      x919 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s920 = @tactics.subst1_tac(x919)
      fn(
        x921 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s920(x921)
      }
    }),
  )
  let t918 = @simp.asm_rewrite_tac(@list.List([]))
  let t914 = @term_syntax.parse_term("(s : Num)")
  let t915 = @term_syntax.parse_term("(r : Num)")
  let t916 = @term_syntax.parse_term("(q : Num)")
  let t917 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t916, t915, t914]),
      hlemma,
    ),
  )
  let t910 = @term_syntax.parse_term("(s : Num)")
  let t911 = @term_syntax.parse_term("(r : Num)")
  let t912 = @term_syntax.parse_term("(q : Num)")
  let t913 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : Num)"), t912, t911, t910]),
      glemma,
    ),
  )
  let t909 = @tactics.disch_then(fn(
    x908 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x905 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s906 = @tactics.assume_tac(x905)
      fn(
        x907 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s906(x907)
      }
    })(@equal.sym(x908))
  })
  let t904 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Num)"))
  let t903 = @tactics.disch_then(fn(
    x902 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x899 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s900 = @tactics.assume_tac(x899)
      fn(
        x901 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s900(x901)
      }
    })(@equal.sym(x902))
  })
  let t898 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t897 = @simp.rewrite_tac(
    @list.List([
      @arith.odd_exists(),
      @arith.add1(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t895 = @term_syntax.parse_term("ODD((p : Num))")
  let t896 = @tactics.map_every(
    fn(
      x892 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s893 = @tactics.undisch_tac(x892)
      fn(
        x894 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s893(x894)
      }
    },
    @list.List([@term_syntax.parse_term("ODD((q : Num))"), t895]),
  )
  let t888 = @simp.asm_simp_tac(@list.List([lemma1]))
  let t887 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t886 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_add())]))
  let t885 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_mul())]))
  let t884 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_pow())]))
  let t883 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t882 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t880 = @simp.simp_tac(@list.List([]))
  let t879 = @simp.once_rewrite_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("(a : Int) * (b : Int) * ((c : Int) * (d : Int)) == a * c * (b * d)"),
      ),
    ]),
  )
  let t878 = @simp.rewrite_tac(
    @list.List([
      @prime.coprime_lmul(),
      @prime.coprime_rmul(),
      @arith.odd_mult(),
      jacobi_lmul(),
      jacobi_rmul(),
    ]),
  )
  let t877 = @term_syntax.parse_term("(n : Num)")
  let t889 = @tactics.then_tac(
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
                                      @term_syntax.parse_term("(m : Num)"),
                                      t877,
                                    ]),
                                  ),
                                  t878,
                                ),
                                t879,
                              ),
                              t880,
                            ),
                            t882,
                          ),
                          @tactics.strip_tac,
                        ),
                        t883,
                      ),
                      t884,
                    ),
                    t885,
                  ),
                  @tactics.ap_thm_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t886,
            ),
            t887,
          ),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t888,
  )
  let t890 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)")),
      @tactics.disch_tac,
    ),
    @tactics.strip_tac,
  )
  let t876 = @tactics.conv_tac(@int.int_reduce_conv)
  let t875 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t891 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            @prime.coprime_1(),
            jacobi_1(),
            @arith.mult_clauses(),
            @arith.odd(),
          ]),
        ),
        t875,
      ),
      t876,
    ),
    t890,
    t889,
  ])
  let t874 = @tactics.repeat_tac(@tactics.conj_tac)
  let t873 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t872 = @tactics.match_mp_tac(@prime.complete_factor_induct())
  let t868 = @simp.asm_simp_tac(@list.List([lemma1]))
  let t867 = @simp.rewrite_tac(
    @list.List([@int.int_pow_neg(), @int.int_pow_one()]),
  )
  let t866 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_add())]))
  let t865 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_mul())]))
  let t864 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_pow_pow())]))
  let t863 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t862 = @tactics.disch_then(fn(
    x861 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t860 = @simp.simp_tac(@list.List([]))
  let t859 = @simp.once_rewrite_tac(
    @list.List([
      @int.int_arith(
        @term_syntax.parse_term("(a : Int) * (b : Int) * ((c : Int) * (d : Int)) == a * c * (b * d)"),
      ),
    ]),
  )
  let t858 = @simp.rewrite_tac(
    @list.List([
      @prime.coprime_lmul(),
      @prime.coprime_rmul(),
      @arith.odd_mult(),
      jacobi_lmul(),
      jacobi_rmul(),
    ]),
  )
  let t857 = @term_syntax.parse_term("(n : Num)")
  let t869 = @tactics.then_tac(
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
                                      @term_syntax.parse_term("(m : Num)"),
                                      t857,
                                    ]),
                                  ),
                                  t858,
                                ),
                                t859,
                              ),
                              t860,
                            ),
                            t862,
                          ),
                          t863,
                        ),
                        @tactics.strip_tac,
                      ),
                      t864,
                    ),
                    t865,
                  ),
                  @tactics.ap_thm_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t866,
            ),
            t867,
          ),
          @tactics.ap_thm_tac,
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t868,
  )
  let t870 = @tactics.then_tac(
    @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")),
    @tactics.disch_tac,
  )
  let t856 = @tactics.conv_tac(@int.int_reduce_conv)
  let t855 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t871 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            @prime.coprime_1(),
            jacobi_1(),
            @arith.mult_clauses(),
            @arith.odd(),
          ]),
        ),
        t855,
      ),
      t856,
    ),
    t870,
    t869,
  ])
  let t854 = @tactics.repeat_tac(@tactics.conj_tac)
  let t853 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t852 = @tactics.match_mp_tac(@prime.complete_factor_induct())
  let t850 = @term_syntax.parse_term("(m : Num)")
  let t851 = @tactics.map_every(
    fn(
      x848 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x848
      @tactics.spec_tac(t, t)
    },
    @list.List([@term_syntax.parse_term("(n : Num)"), t850]),
  )
  let t846 = @equal.gsym(@theorems.conj_assoc())
  let t847 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.imp_conj_alt()), t846]),
  )
  let t845 = @tactics.pop_assum(fn(
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
    let s843 = @tactics.mp_tac(x842)
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
  })
  let t841 = @simp.asm_rewrite_tac(
    @list.List([@int.int_entire(), jacobi_eq_0()]),
  )
  let t988 = @tactics.thenl(
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
                                                            @tactics.thenl(
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
                                                                              @class.cond_cases_tac,
                                                                            ),
                                                                            t841,
                                                                          ),
                                                                          t845,
                                                                        ),
                                                                        t847,
                                                                      ),
                                                                      t851,
                                                                    ),
                                                                    t852,
                                                                  ),
                                                                  t853,
                                                                ),
                                                                t854,
                                                              ),
                                                              t871,
                                                            ),
                                                            t872,
                                                          ),
                                                          t873,
                                                        ),
                                                        t874,
                                                      ),
                                                      t891,
                                                    ),
                                                    t896,
                                                  ),
                                                  t897,
                                                ),
                                                t898,
                                              ),
                                              t903,
                                            ),
                                            t904,
                                          ),
                                          t909,
                                        ),
                                        t913,
                                      ),
                                      t917,
                                    ),
                                    t918,
                                  ),
                                  t922,
                                ),
                                t927,
                              ),
                              t931,
                            ),
                            t932,
                          ),
                          t933,
                        ),
                        @tactics.ap_thm_tac,
                      ),
                      @tactics.ap_thm_tac,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t937,
                ),
                t938,
              ),
              t939,
            ),
            t940,
          ),
          t941,
        ),
        t942,
      ),
      t943,
    ),
    t987,
  )
  jacobi_reciprocity_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m) && ODD(n) → jacobi((m, n)) * jacobi((n, m)) == (if coprime((m, n)) { pow(-int_of_num(1), DIV(m - 1, 2) * DIV(n - 1, 2)) } else { int_of_num(0) })"),
      t988,
    ),
  )
}

///|
let jacobi_reciprocity_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_RECIPROCITY_ALT",
)

///|
/// `JACOBI_RECIPROCITY_ALT`
pub fn jacobi_reciprocity_alt() -> @kernel.Thm {
  jacobi_reciprocity_alt_c.get()
}

///|
/// JACOBI_RECIPROCITY
fn step_35() -> Unit raise {
  let t995 = @meson.asm_meson_tac(
    @list.List([@arith.odd(), @prime.coprime_sym()]),
  )
  let t994 = @simp.asm_rewrite_tac(@list.List([jacobi_eq_0()]))
  let t993 = @simp.rewrite_tac(@list.List([jacobi_cases()]))
  let t992 = @tactics.match_mp_tac(
    @int.int_ring(
      @term_syntax.parse_term("((x : Int) == -int_of_num(1) || x == int_of_num(0) || x == int_of_num(1)) && !(x == int_of_num(0)) → pow(x, 2) == int_of_num(1)"),
    ),
  )
  let t991 = @simp.asm_simp_tac(@list.List([jacobi_reciprocity_alt()]))
  let t990 = @tactics.match_mp_tac(
    @int.int_ring(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, pow(x, 2) == int_of_num(1) && pow(y, 2) == int_of_num(1) && x * y == (z : Int) → y == z * x"),
    ),
  )
  let t989 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([jacobi_eq_0(), @prime.coprime_sym()])),
  ])
  let t996 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    @class.cond_cases_tac,
                  ),
                  t989,
                ),
                t990,
              ),
              t991,
            ),
            @tactics.conj_tac,
          ),
          t992,
        ),
        t993,
      ),
      t994,
    ),
    t995,
  )
  jacobi_reciprocity_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ODD(m) && ODD(n) → jacobi((n, m)) == (if coprime((m, n)) { pow(-int_of_num(1), DIV(m - 1, 2) * DIV(n - 1, 2)) * jacobi((m, n)) } else { int_of_num(0) })"),
      t996,
    ),
  )
}

///|
let jacobi_reciprocity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_RECIPROCITY",
)

///|
/// `JACOBI_RECIPROCITY`
pub fn jacobi_reciprocity() -> @kernel.Thm {
  jacobi_reciprocity_c.get()
}

///|
/// JACOBI_EQ_1
fn step_36() -> Unit raise {
  let t1010 = @meson.asm_meson_tac(
    @list.List([
      @int.number_rule(
        @term_syntax.parse_term("op_eq_eq((a : Num), (b : Num), mod((m : Num))) && divides((n : Num), m) → op_eq_eq(a, b, mod(n))"),
      ),
    ]),
  )
  let t1009 = @simp.rewrite_tac(@list.List([]))
  let t1008 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_prime_eq()])),
    @tactics.all_tac,
  ])
  let t1007 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@int.int_pow_one()]),
      @term_syntax.parse_term("(x : Int) == int_of_num(1) → pow(x, (n : Num)) == int_of_num(1)"),
    ),
  )
  let t1006 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1005 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t1004 = @tactics.match_mp_tac(@products.iproduct_eq_1())
  let t1003 = @simp.asm_rewrite_tac(@list.List([jacobi()]))
  let t1002 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x999 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1000 = @tactics.assume_tac(x999)
      fn(
        x1001 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1000(x1001)
      }
    }),
  )
  let t998 = @simp.asm_simp_tac(@list.List([@prime.coprime_0(), jacobi_1()]))
  let t997 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1011 = @tactics.then_tac(
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
                              @tactics.repeat_tac(@tactics.gen_tac),
                              t997,
                            ),
                            t998,
                          ),
                          t1002,
                        ),
                        t1003,
                      ),
                      t1004,
                    ),
                    t1005,
                  ),
                  t1006,
                ),
                @tactics.strip_tac,
              ),
              t1007,
            ),
            @class.cond_cases_tac,
          ),
          t1008,
        ),
        @class.cond_cases_tac,
      ),
      t1009,
    ),
    t1010,
  )
  jacobi_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, coprime((a, n)) && (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n))) → jacobi((a, n)) == int_of_num(1)"),
      t1011,
    ),
  )
}

///|
let jacobi_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_EQ_1")

///|
/// `JACOBI_EQ_1`
pub fn jacobi_eq_1() -> @kernel.Thm {
  jacobi_eq_1_c.get()
}

///|
/// JACOBI_NE_MINUS1
fn step_37() -> Unit raise {
  let t1014 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1013 = @simp.asm_simp_tac(@list.List([jacobi_zero(), jacobi_eq_1()]))
  let t1012 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((a : Num), (n : Num)))"))
  let t1015 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1012),
      t1013,
    ),
    t1014,
  )
  jacobi_ne_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Num, (∃ x : Num, op_eq_eq(EXP(x, 2), a, mod(n))) → !(jacobi((a, n)) == -int_of_num(1))"),
      t1015,
    ),
  )
}

///|
let jacobi_ne_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "JACOBI_NE_MINUS1",
)

///|
/// `JACOBI_NE_MINUS1`
pub fn jacobi_ne_minus1() -> @kernel.Thm {
  jacobi_ne_minus1_c.get()
}

///|
/// int_jacobi
fn step_38() -> Unit raise {
  int_jacobi_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_jacobi : ((Int, Int)) -> Int)(((a : Int), (n : Int))) == (if n == int_of_num(0) { int_of_num(0) } else { jacobi((num_of_int(rem(a, n)), num_of_int(abs(n)))) })"),
    ),
  )
}

///|
let int_jacobi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_jacobi")

///|
/// `int_jacobi`
pub fn int_jacobi() -> @kernel.Thm {
  int_jacobi_c.get()
}

///|
/// INT_JACOBI_RNEG
fn step_39() -> Unit raise {
  let t1016 = @simp.rewrite_tac(
    @list.List([
      int_jacobi(),
      @int.int_abs_neg(),
      @int.int_neg_eq_0(),
      @int.int_rem_rneg(),
    ]),
  )
  int_jacobi_rneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, int_jacobi((a, -n)) == int_jacobi((a, n))"),
      t1016,
    ),
  )
}

///|
let int_jacobi_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_RNEG",
)

///|
/// `INT_JACOBI_RNEG`
pub fn int_jacobi_rneg() -> @kernel.Thm {
  int_jacobi_rneg_c.get()
}

///|
/// INT_JACOBI_RABS
fn step_40() -> Unit raise {
  let t1017 = @simp.rewrite_tac(
    @list.List([
      int_jacobi(),
      @int.int_abs_abs(),
      @int.int_rem_rabs(),
      @int.int_abs_zero(),
    ]),
  )
  int_jacobi_rabs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, int_jacobi((a, abs(n))) == int_jacobi((a, n))"),
      t1017,
    ),
  )
}

///|
let int_jacobi_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_RABS",
)

///|
/// `INT_JACOBI_RABS`
pub fn int_jacobi_rabs() -> @kernel.Thm {
  int_jacobi_rabs_c.get()
}

///|
/// INT_JACOBI_NUMS
fn step_41() -> Unit raise {
  let t1022 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_of_num_eq(),
      jacobi_0(),
      @arith.mod_zero(),
      jacobi_mod(),
      jacobi_1(),
    ]),
  )
  let t1021 = @simp.rewrite_tac(
    @list.List([
      int_jacobi(),
      @int.int_abs_num(),
      @int.int_of_num_rem(),
      @int.num_of_int_of_num(),
    ]),
  )
  let t1020 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi(), jacobi_0(), jacobi_1(), @int.int_of_num_eq()]),
  )
  let t1018 = @term_syntax.parse_term("(a : Num) == 1")
  let t1019 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(n : Num) == 0"), t1018]),
  )
  let t1023 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1019),
        t1020,
      ),
      t1021,
    ),
    t1022,
  )
  int_jacobi_nums_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, int_jacobi((int_of_num(a), int_of_num(n))) == (if n == 0 && a == 1 { int_of_num(0) } else { jacobi((a, n)) })"),
      t1023,
    ),
  )
}

///|
let int_jacobi_nums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_NUMS",
)

///|
/// `INT_JACOBI_NUMS`
pub fn int_jacobi_nums() -> @kernel.Thm {
  int_jacobi_nums_c.get()
}

///|
/// INT_JACOBI_BOUND
fn step_42() -> Unit raise {
  let t1026 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1025 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([jacobi_bound()])),
    ),
  )
  let t1024 = @simp.rewrite_tac(@list.List([int_jacobi()]))
  let t1027 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1024),
      t1025,
    ),
    t1026,
  )
  int_jacobi_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, abs(int_jacobi((a, n))) <= int_of_num(1)"),
      t1027,
    ),
  )
}

///|
let int_jacobi_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_BOUND",
)

///|
/// `INT_JACOBI_BOUND`
pub fn int_jacobi_bound() -> @kernel.Thm {
  int_jacobi_bound_c.get()
}

///|
/// INT_JACOBI_CASES
fn step_43() -> Unit raise {
  let t1030 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1029 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([jacobi_cases()])),
    ),
  )
  let t1028 = @simp.rewrite_tac(@list.List([int_jacobi()]))
  let t1031 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1028),
      t1029,
    ),
    t1030,
  )
  int_jacobi_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, int_jacobi((a, n)) == -int_of_num(1) || int_jacobi((a, n)) == int_of_num(0) || int_jacobi((a, n)) == int_of_num(1)"),
      t1031,
    ),
  )
}

///|
let int_jacobi_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_CASES",
)

///|
/// `INT_JACOBI_CASES`
pub fn int_jacobi_cases() -> @kernel.Thm {
  int_jacobi_cases_c.get()
}

///|
/// INT_JACOBI_CONG
fn step_44() -> Unit raise {
  let t1034 = @simp.simp_tac(@list.List([@equal.gsym(@int.int_rem_eq())]))
  let t1033 = @simp.asm_simp_tac(@list.List([@integer.int_cong_mod_0()]))
  let t1032 = @simp.rewrite_tac(@list.List([int_jacobi()]))
  let t1035 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1032),
        @class.cond_cases_tac,
      ),
      t1033,
    ),
    t1034,
  )
  int_jacobi_cong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, op_eq_eq(a, b, mod(n)) → int_jacobi((a, n)) == int_jacobi((b, n))"),
      t1035,
    ),
  )
}

///|
let int_jacobi_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_CONG",
)

///|
/// `INT_JACOBI_CONG`
pub fn int_jacobi_cong() -> @kernel.Thm {
  int_jacobi_cong_c.get()
}

///|
/// INT_JACOBI_REM_GEN
fn step_45() -> Unit raise {
  let t1040 = @simp.rewrite_tac(
    @list.List([@int.int_cong_lrem(), @integer.int_cong_refl()]),
  )
  let t1037 = @drule.match_mp(
    @int.number_rule(
      @term_syntax.parse_term("divides((n : Int), (m : Int)) → op_eq_eq((x : Int), (y : Int), mod(m)) → op_eq_eq(x, y, mod(n))"),
    ),
  )
  let t1039 = @tactics.first_x_assum(fn(
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
    @tactics.match_mp_tac(t1037(x1038))
  })
  let t1036 = @tactics.match_mp_tac(int_jacobi_cong())
  let t1041 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1036),
      t1039,
    ),
    t1040,
  )
  int_jacobi_rem_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ m : Int, ∀ n : Int, divides(n, m) → int_jacobi((rem(a, m), n)) == int_jacobi((a, n))"),
      t1041,
    ),
  )
}

///|
let int_jacobi_rem_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_REM_GEN",
)

///|
/// `INT_JACOBI_REM_GEN`
pub fn int_jacobi_rem_gen() -> @kernel.Thm {
  int_jacobi_rem_gen_c.get()
}

///|
/// INT_JACOBI_REM
fn step_46() -> Unit raise {
  let t1042 = @simp.simp_tac(
    @list.List([int_jacobi_rem_gen(), @integer.int_divides_refl()]),
  )
  int_jacobi_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, int_jacobi((rem(a, n), n)) == int_jacobi((a, n))"),
      t1042,
    ),
  )
}

///|
let int_jacobi_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_JACOBI_REM")

///|
/// `INT_JACOBI_REM`
pub fn int_jacobi_rem() -> @kernel.Thm {
  int_jacobi_rem_c.get()
}

///|
/// INT_JACOBI_1
fn step_47() -> Unit raise {
  let t1054 = @simp.asm_rewrite_tac(@list.List([@int.int_abs_zero()]))
  let t1053 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_eq()),
      @int.int_of_num_of_int(),
      @int.int_abs_pos(),
    ]),
  )
  let t1055 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@int.num_of_int_of_num(), jacobi_1()])),
      t1053,
    ),
    t1054,
  )
  let t1056 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@int.int_rem_eq_self()])),
      @int.asm_int_arith_tac,
    ),
    t1055,
  ])
  let t1052 = @tactics.subgoal_then(@term_syntax.parse_term("rem(int_of_num(1), (n : Int)) == int_of_num(1)"), fn(
    x1049 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1050 = @tactics.subst1_tac(x1049)
    fn(
      x1051 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1050(x1051)
    }
  })
  let t1048 = @simp.asm_rewrite_tac(
    @list.List([@int.num_of_int_of_num(), jacobi_1()]),
  )
  let t1047 = @class.asm_cases_tac(@term_syntax.parse_term("abs((n : Int)) == int_of_num(1)"))
  let t1046 = @simp.asm_rewrite_tac(@list.List([]))
  let t1045 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Int)"))
  let t1044 = @simp.rewrite_tac(
    @list.List([@int.num_of_int_of_num(), jacobi_1()]),
  )
  let t1043 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1057 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([int_jacobi()])),
                    t1043,
                  ),
                  t1044,
                ),
                t1045,
              ),
              @class.cond_cases_tac,
            ),
            t1046,
          ),
          t1047,
        ),
        t1048,
      ),
      t1052,
    ),
    t1056,
  )
  int_jacobi_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, int_jacobi((int_of_num(1), n)) == (if n == int_of_num(0) { int_of_num(0) } else { int_of_num(1) })) && (∀ a : Int, int_jacobi((a, int_of_num(1))) == int_of_num(1))"),
      t1057,
    ),
  )
}

///|
let int_jacobi_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_JACOBI_1")

///|
/// `INT_JACOBI_1`
pub fn int_jacobi_1() -> @kernel.Thm {
  int_jacobi_1_c.get()
}

///|
/// INT_JACOBI_0
fn step_48() -> Unit raise {
  let t1062 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@int.int_of_num_eq()),
      @int.int_of_num_of_int(),
      @int.int_abs_pos(),
    ]),
  )
  let t1061 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1060 = @simp.rewrite_tac(
    @list.List([@int.num_of_int_of_num(), jacobi_0()]),
  )
  let t1059 = @simp.asm_rewrite_tac(@list.List([@int.int_rem_zero()]))
  let t1058 = @simp.rewrite_tac(@list.List([int_jacobi()]))
  let t1063 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1058),
            @class.cond_cases_tac,
          ),
          t1059,
        ),
        t1060,
      ),
      t1061,
    ),
    t1062,
  )
  int_jacobi_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, int_jacobi((int_of_num(0), n)) == (if abs(n) == int_of_num(1) { int_of_num(1) } else { int_of_num(0) })) && (∀ a : Int, int_jacobi((a, int_of_num(0))) == int_of_num(0))"),
      t1063,
    ),
  )
}

///|
let int_jacobi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_JACOBI_0")

///|
/// `INT_JACOBI_0`
pub fn int_jacobi_0() -> @kernel.Thm {
  int_jacobi_0_c.get()
}

///|
/// INT_JACOBI_RMUL
fn step_49() -> Unit raise {
  let t1075 = @simp.rewrite_tac(
    @list.List([@int.int_rem_rem_mul(), @int.int_rem_rem()]),
  )
  let t1074 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_rem_eq())]))
  let t1073 = @simp.rewrite_tac(@list.List([@integer.int_cong_mod_abs()]))
  let t1072 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_of_int(),
      @int.int_abs_pos(),
      @int.int_division(),
      @int.int_entire(),
    ]),
  )
  let t1071 = @simp.rewrite_tac(@list.List([@int.num_congruent()]))
  let t1070 = @tactics.match_mp_tac(jacobi_cong())
  let t1069 = @simp.simp_tac(
    @list.List([@int.num_of_int_mul(), @int.int_abs_pos(), jacobi_rmul()]),
  )
  let t1068 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi(), @int.int_entire(), @int.int_abs_mul()]),
  )
  let t1067 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_0(), @int.int_mul_rzero()]),
  )
  let t1066 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t1065 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_0(), @int.int_mul_lzero()]),
  )
  let t1064 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Int) == int_of_num(0)"))
  let t1076 = @tactics.then_tac(
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
                            t1064,
                          ),
                          t1065,
                        ),
                        t1066,
                      ),
                      t1067,
                    ),
                    t1068,
                  ),
                  t1069,
                ),
                @tactics.binop_tac,
              ),
              t1070,
            ),
            t1071,
          ),
          t1072,
        ),
        t1073,
      ),
      t1074,
    ),
    t1075,
  )
  int_jacobi_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ m : Int, ∀ n : Int, int_jacobi((a, m * n)) == int_jacobi((a, m)) * int_jacobi((a, n))"),
      t1076,
    ),
  )
}

///|
let int_jacobi_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_RMUL",
)

///|
/// `INT_JACOBI_RMUL`
pub fn int_jacobi_rmul() -> @kernel.Thm {
  int_jacobi_rmul_c.get()
}

///|
/// INT_JACOBI_LMUL
fn step_50() -> Unit raise {
  let t1083 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@int.int_rem_eq()),
      @int.int_rem_rem(),
      @int.int_mul_rem(),
    ]),
  )
  let t1082 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_of_int(),
      @int.int_le_mul(),
      @int.int_division(),
      @int.int_abs_pos(),
      @equal.gsym(@int.int_of_num_mul()),
      @integer.int_cong_mod_abs(),
    ]),
  )
  let t1081 = @simp.rewrite_tac(@list.List([@int.num_congruent()]))
  let t1080 = @tactics.match_mp_tac(jacobi_cong())
  let t1079 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi(), @equal.gsym(jacobi_lmul())]),
  )
  let t1078 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_0(), @int.int_mul_lzero()]),
  )
  let t1077 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t1084 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1077),
              t1078,
            ),
            t1079,
          ),
          t1080,
        ),
        t1081,
      ),
      t1082,
    ),
    t1083,
  )
  int_jacobi_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, int_jacobi((a * b, n)) == int_jacobi((a, n)) * int_jacobi((b, n))"),
      t1084,
    ),
  )
}

///|
let int_jacobi_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_LMUL",
)

///|
/// `INT_JACOBI_LMUL`
pub fn int_jacobi_lmul() -> @kernel.Thm {
  int_jacobi_lmul_c.get()
}

///|
/// INT_JACOBI_RPOW
fn step_51() -> Unit raise {
  let t1085 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_rmul(), int_jacobi_1(), @int.int_pow_v1()]),
  )
  let t1086 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t1085,
  )
  int_jacobi_rpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ k : Num, int_jacobi((a, pow(n, k))) == pow(int_jacobi((a, n)), k)"),
      t1086,
    ),
  )
}

///|
let int_jacobi_rpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_RPOW",
)

///|
/// `INT_JACOBI_RPOW`
pub fn int_jacobi_rpow() -> @kernel.Thm {
  int_jacobi_rpow_c.get()
}

///|
/// INT_JACOBI_LPOW
fn step_52() -> Unit raise {
  let t1088 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_rzero()]))
  let t1087 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_lmul(), int_jacobi_1(), @int.int_pow_v1()]),
  )
  let t1089 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          @nums.induct_tac,
        ),
        t1087,
      ),
      @class.cond_cases_tac,
    ),
    t1088,
  )
  int_jacobi_lpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ k : Num, int_jacobi((pow(a, k), n)) == (if n == int_of_num(0) { int_of_num(0) } else { pow(int_jacobi((a, n)), k) })"),
      t1089,
    ),
  )
}

///|
let int_jacobi_lpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_LPOW",
)

///|
/// `INT_JACOBI_LPOW`
pub fn int_jacobi_lpow() -> @kernel.Thm {
  int_jacobi_lpow_c.get()
}

///|
/// INT_JACOBI_2
fn step_53() -> Unit raise {
  let t1092 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1091 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_nums(), jacobi_2_cases()]),
  )
  let t1090 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(a : Int)"), @int.int_rem_2_cases()),
  )
  let t1093 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.once_rewrite_tac(@list.List([@equal.gsym(int_jacobi_rem())])),
          ),
          t1090,
        ),
        @tactics.strip_tac,
      ),
      t1091,
    ),
    t1092,
  )
  int_jacobi_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Int, int_jacobi((a, int_of_num(2))) == rem(a, int_of_num(2))"), t1093),
  )
}

///|
let int_jacobi_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_JACOBI_2")

///|
/// `INT_JACOBI_2`
pub fn int_jacobi_2() -> @kernel.Thm {
  int_jacobi_2_c.get()
}

///|
/// INT_JACOBI_POW_2
fn step_54() -> Unit raise {
  let t1097 = @simp.asm_rewrite_tac(
    @list.List([@int.int_pow_zero(), @int.int_pow_one()]),
  )
  let t1096 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(a : Int)"), @int.int_rem_2_cases()),
  )
  let t1095 = @simp.asm_rewrite_tac(@list.List([@int.int_pow_v1()]))
  let t1094 = @simp.rewrite_tac(@list.List([int_jacobi_rpow(), int_jacobi_2()]))
  let t1098 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1094),
            @class.cond_cases_tac,
          ),
          t1095,
        ),
        t1096,
      ),
      @tactics.strip_tac,
    ),
    t1097,
  )
  int_jacobi_pow_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ k : Num, int_jacobi((a, pow(int_of_num(2), k))) == (if k == 0 { int_of_num(1) } else { rem(a, int_of_num(2)) })"),
      t1098,
    ),
  )
}

///|
let int_jacobi_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_POW_2",
)

///|
/// `INT_JACOBI_POW_2`
pub fn int_jacobi_pow_2() -> @kernel.Thm {
  int_jacobi_pow_2_c.get()
}

///|
/// INT_JACOBI_EQ_0
fn step_55() -> Unit raise {
  let t1121 = @simp.simp_tac(@list.List([jacobi_eq_0()]))
  let t1120 = @simp.simp_tac(
    @list.List([
      @int.int_of_num_eq(),
      int_jacobi_nums(),
      @equal.gsym(@int.num_coprime()),
    ]),
  )
  let t1119 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_forall_pos())]),
  )
  let t1117 = @term_syntax.parse_term("(y : Int)")
  let t1118 = @tactics.spec_tac(@term_syntax.parse_term("abs((n : Int))"), t1117)
  let t1116 = @list.List([
    @int.asm_int_arith_tac,
    @simp.rewrite_tac(@list.List([@theorems.imp_conj()])),
  ])
  let t1115 = @tactics.subgoal_then(
    @term_syntax.parse_term("int_of_num(0) <= abs((n : Int)) && !(abs(n) == int_of_num(0))"),
    fn(
      x1112 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1113 = @tactics.mp_tac(x1112)
      fn(
        x1114 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1113(x1114)
      }
    },
  )
  let t1109 = @term_syntax.parse_term("(x : Int)")
  let t1110 = @tactics.spec_tac(@term_syntax.parse_term("rem((a : Int), abs((n : Int)))"), t1109)
  let t1111 = @list.List([
    @simp.asm_simp_tac(@list.List([@int.int_division(), @int.int_abs_zero()])),
    t1110,
  ])
  let t1108 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) <= rem((a : Int), abs((n : Int)))"), fn(
    x1105 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1106 = @tactics.mp_tac(x1105)
    fn(
      x1107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1106(x1107)
    }
  })
  let t1103 = @equal.gsym(int_jacobi_rem())
  let t1104 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@integer.int_coprime_lrem()), t1103]),
  )
  let t1101 = @equal.gsym(@integer.int_coprime_rabs())
  let t1102 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(int_jacobi_rabs()), t1101]),
  )
  let t1100 = @simp.asm_rewrite_tac(@list.List([int_jacobi_0()]))
  let t1099 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t1122 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t1099,
                        ),
                        t1100,
                      ),
                      t1102,
                    ),
                    t1104,
                  ),
                  t1108,
                ),
                t1111,
              ),
              t1115,
            ),
            t1116,
          ),
          t1118,
        ),
        t1119,
      ),
      t1120,
    ),
    t1121,
  )
  int_jacobi_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, (int_jacobi((a, n)) == int_of_num(0)) == (coprime((a, n)) → n == int_of_num(0))"),
      t1122,
    ),
  )
}

///|
let int_jacobi_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_EQ_0",
)

///|
/// `INT_JACOBI_EQ_0`
pub fn int_jacobi_eq_0() -> @kernel.Thm {
  int_jacobi_eq_0_c.get()
}

///|
/// INT_JACOBI_MINUS1
fn step_56() -> Unit raise {
  let t1134 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_eq(),
      @int.int_of_num_sub(),
      @arith.le_1(),
      int_jacobi_nums(),
    ]),
  )
  let t1133 = @tactics.conv_tac(@int.integer_rule)
  let t1135 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(int_jacobi_cong()), t1133),
    t1134,
  ])
  let t1131 = @term_syntax.parse_term("int_jacobi((int_of_num((n : Num)) - int_of_num(1), int_of_num(n)))")
  let t1132 = @tactics.trans_tac(@theorems.eq_trans())(t1131)
  let t1130 = @simp.asm_rewrite_tac(@list.List([@arith.odd()]))
  let t1129 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1128 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1127 = @simp.simp_tac(
    @list.List([
      @prime.divides_2(),
      @arith.not_even(),
      @equal.gsym(jacobi_minus1_cases()),
    ]),
  )
  let t1124 = @equal.gsym(@int.num_congruent())
  let t1125 = @equal.gsym(@int.num_divides())
  let t1126 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_forall_abs()), t1125, t1124]),
  )
  let t1123 = @equal.gsym(@int.int_divides_rabs())
  let t1136 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.once_rewrite_tac(
                      @list.List([@equal.gsym(int_jacobi_rabs()), t1123]),
                    ),
                    t1126,
                  ),
                  t1127,
                ),
                t1128,
              ),
              t1129,
            ),
            t1130,
          ),
          @tactics.disch_tac,
        ),
        t1132,
      ),
      @tactics.conj_tac,
    ),
    t1135,
  )
  int_jacobi_minus1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, !divides(int_of_num(2), n) → int_jacobi((-int_of_num(1), n)) == (if op_eq_eq(abs(n), int_of_num(1), mod(int_of_num(4))) { int_of_num(1) } else { -int_of_num(1) })"),
      t1136,
    ),
  )
}

///|
let int_jacobi_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_MINUS1",
)

///|
/// `INT_JACOBI_MINUS1`
pub fn int_jacobi_minus1() -> @kernel.Thm {
  int_jacobi_minus1_c.get()
}

///|
/// INT_JACOBI_OF_2
fn step_57() -> Unit raise {
  let t1143 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1142 = @simp.simp_tac(@list.List([int_jacobi_nums()]))
  let t1141 = @simp.rewrite_tac(
    @list.List([@prime.divides_2(), @equal.gsym(jacobi_of_2_cases())]),
  )
  let t1138 = @equal.gsym(@int.num_congruent())
  let t1139 = @equal.gsym(@int.num_divides())
  let t1140 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_forall_abs()), t1139, t1138]),
  )
  let t1137 = @equal.gsym(@int.int_divides_rabs())
  let t1144 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(
            @list.List([@equal.gsym(int_jacobi_rabs()), t1137]),
          ),
          t1140,
        ),
        t1141,
      ),
      t1142,
    ),
    t1143,
  )
  int_jacobi_of_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, int_jacobi((int_of_num(2), n)) == (if divides(int_of_num(2), n) { int_of_num(0) } else { if op_eq_eq(abs(n), int_of_num(1), mod(int_of_num(8))) || op_eq_eq(abs(n), int_of_num(7), mod(int_of_num(8))) { int_of_num(1) } else { -int_of_num(1) } })"),
      t1144,
    ),
  )
}

///|
let int_jacobi_of_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_OF_2",
)

///|
/// `INT_JACOBI_OF_2`
pub fn int_jacobi_of_2() -> @kernel.Thm {
  int_jacobi_of_2_c.get()
}

///|
/// INT_JACOBI_LNEG
fn step_58() -> Unit raise {
  let t1147 = @simp.asm_rewrite_tac(@list.List([]))
  let t1146 = @simp.asm_simp_tac(
    @list.List([int_jacobi_lmul(), int_jacobi_minus1()]),
  )
  let t1145 = @simp.once_rewrite_tac(@list.List([@int.int_neg_minus1()]))
  let t1148 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1145),
          t1146,
        ),
        @class.cond_cases_tac,
      ),
      t1147,
    ),
    @int.int_arith_tac,
  )
  int_jacobi_lneg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, !divides(int_of_num(2), n) → int_jacobi((-(a : Int), n)) == (if op_eq_eq(abs(n), int_of_num(1), mod(int_of_num(4))) { int_jacobi((a, n)) } else { -int_jacobi((a, n)) })"),
      t1148,
    ),
  )
}

///|
let int_jacobi_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_LNEG",
)

///|
/// `INT_JACOBI_LNEG`
pub fn int_jacobi_lneg() -> @kernel.Thm {
  int_jacobi_lneg_c.get()
}

///|
/// INT_JACOBI_SQUARED
fn step_59() -> Unit raise {
  let t1158 = @simp.asm_rewrite_tac(@list.List([int_jacobi_eq_0()]))
  let t1157 = @simp.rewrite_tac(@list.List([int_jacobi_cases()]))
  let t1156 = @tactics.match_mp_tac(
    @int.int_ring(
      @term_syntax.parse_term("((x : Int) == -int_of_num(1) || x == int_of_num(0) || x == int_of_num(1)) && !(x == int_of_num(0)) → pow(x, 2) == int_of_num(1)"),
    ),
  )
  let t1155 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1154 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_eq_0(), @int.int_pow_eq_0()]),
  )
  let t1153 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((a : Int), (n : Int)))"))
  let t1152 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1151 = @simp.asm_rewrite_tac(
    @list.List([int_jacobi_eq_0(), @int.int_pow_eq_0()]),
  )
  let t1150 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t1149 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1159 = @tactics.then_tac(
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
                        @list.List([int_jacobi_lpow(), int_jacobi_rpow()]),
                      ),
                      t1149,
                    ),
                    t1150,
                  ),
                  t1151,
                ),
                t1152,
              ),
              t1153,
            ),
            t1154,
          ),
          t1155,
        ),
        t1156,
      ),
      t1157,
    ),
    t1158,
  )
  int_jacobi_squared_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ a : Int, ∀ n : Int, int_jacobi((pow(a, 2), n)) == (if coprime((a, n)) && !(n == int_of_num(0)) { int_of_num(1) } else { int_of_num(0) })) && (∀ a : Int, ∀ n : Int, int_jacobi((a, pow(n, 2))) == (if coprime((a, n)) && !(n == int_of_num(0)) { int_of_num(1) } else { int_of_num(0) }))"),
      t1159,
    ),
  )
}

///|
let int_jacobi_squared_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_JACOBI_SQUARED",
)

///|
/// `INT_JACOBI_SQUARED`
pub fn int_jacobi_squared() -> @kernel.Thm {
  int_jacobi_squared_c.get()
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
}
