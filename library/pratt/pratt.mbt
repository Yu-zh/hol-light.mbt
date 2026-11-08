// Translated from upstream Library/pratt.ml; edit this file directly.

///|
/// Library/pratt.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// num_0
fn step_2() -> Unit raise {
  num_0_c.set(@num.num_of_int64(0L))
}

///|
let num_0_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_0")

///|
/// `num_0`
pub fn num_0() -> @num.Num {
  num_0_c.get()
}

///|
/// num_1
fn step_3() -> Unit raise {
  num_1_c.set(@num.num_of_int64(1L))
}

///|
let num_1_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_1")

///|
/// `num_1`
pub fn num_1() -> @num.Num {
  num_1_c.get()
}

///|
/// num_2
fn step_4() -> Unit raise {
  num_2_c.set(@num.num_of_int64(2L))
}

///|
let num_2_c : @lib.Cell[@num.Num] = @lib.Cell::new("num_2")

///|
/// `num_2`
pub fn num_2() -> @num.Num {
  num_2_c.get()
}

///|
/// nat_mod_lemma
fn step_5() -> Unit raise {
  let t11 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.num_divides()), @int.divides()]),
  )
  let t10 = @simp.asm_simp_tac(
    @list.List([
      @int.int_of_num_sub(),
      @int.arith_rule(
        @term_syntax.parse_term("(x : Num) <= (y : Num) → (y == x + (d : Num)) == (y - x == d)"),
      ),
    ]),
  )
  let t9 = @simp.once_rewrite_tac(
    @list.List([
      @int.integer_rule(
        @term_syntax.parse_term("op_eq_eq((x : Int), (y : Int), mod(int_of_num((n : Num)))) == divides(int_of_num(n), x - y)"),
      ),
    ]),
  )
  let t8 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x2 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s3 = @tactics.mp_tac(x2)
        fn(
          x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s3(x4)
        }
      },
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
    ),
  )
  let t1 = @simp.rewrite_tac(@list.List([@int.num_congruent()]))
  let t12 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1),
          t8,
        ),
        t9,
      ),
      t10,
    ),
    t11,
  )
  nat_mod_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) && y <= x → (∃ q : Num, x == y + n * q)"),
      t12,
    ),
  )
}

///|
let nat_mod_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nat_mod_lemma")

///|
/// `nat_mod_lemma`
pub fn nat_mod_lemma() -> @kernel.Thm {
  nat_mod_lemma_c.get()
}

///|
/// nat_mod
fn step_6() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([
      nat_mod_lemma(),
      @int.arith_rule(@term_syntax.parse_term("(x : Num) + (y : Num) * 0 == x")),
    ]),
  )
  let t24 = @list.List([
    @tactics.all_tac,
    @simp.once_rewrite_tac(
      @list.List([
        @int.number_rule(
          @term_syntax.parse_term("op_eq_eq((x : Num), (y : Num), mod((n : Num))) == op_eq_eq(y, x, mod(n))"),
        ),
      ]),
    ),
  ])
  let t23 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
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
      let s21 = @tactics.mp_tac(x20)
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
    }),
  )
  let t19 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool) → (d : Bool)) == (c && b || c && a → d)"),
      ),
    ]),
  )
  let t17 = @term_syntax.parse_term("(y : Num)")
  let t18 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Num)"), t17]),
      @arith.le_cases(),
    ),
  )
  let t16 = @simp.gen_rewrite_tac(
    fn(
      x13 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s14 = @equal.land_conv(x13)
      fn(x15 : @kernel.Term) -> @kernel.Thm raise { s14(x15) }
    },
    @list.List([@equal.gsym(@int.cong())]),
  )
  let t26 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t16),
                @tactics.eq_tac,
              ),
              @list.List([@tactics.all_tac, @int.number_tac]),
            ),
            t18,
          ),
          t19,
        ),
        t23,
      ),
      t24,
    ),
    t25,
  )
  nat_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, mod(n, x, y) == (∃ q1 : Num, ∃ q2 : Num, x + n * q1 == y + n * q2)"),
      t26,
    ),
  )
}

///|
let nat_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nat_mod")

///|
/// `nat_mod`
pub fn nat_mod() -> @kernel.Thm {
  nat_mod_c.get()
}

///|
/// PRIME
fn step_7() -> Unit raise {
  let t83 = @meson.asm_meson_tac(@list.List([@prime.divides_zero()]))
  let t82 = @tactics.disch_then(fn(
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
    (fn(
      x78 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s79 = @tactics.subst_all_tac(x78)
      fn(
        x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s79(x80)
      }
    })(@equal.sym(x81))
  })
  let t77 = @simp.simp_tac(@list.List([]))
  let t76 = @simp.asm_rewrite_tac(@list.List([]))
  let t75 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == (q : Num)"))
  let t74 = @simp.asm_rewrite_tac(@list.List([@arith.lt_le(), @arith.le_0()]))
  let t71 = @drule.match_mp(@int.divides_le())
  let t73 = @tactics.first_assum(fn(
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
    (fn(
      x68 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s69 = @tactics.mp_tac(x68)
      fn(
        x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s69(x70)
      }
    })(t71(x72))
  })
  let t66 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t65 = @simp.asm_rewrite_tac(@list.List([@prime.divides_refl()]))
  let t64 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))
  let t67 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@int.coprime(), @class.not_forall_thm()]),
          ),
          t64,
        ),
        t65,
      ),
      t66,
    ),
    @tactics.all_tac,
  ])
  let t63 = @tactics.subgoal_then(@term_syntax.parse_term("!coprime(((p : Num), (q : Num)))"), fn(
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
  })
  let t57 = @term_syntax.parse_term("(q : Num)")
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
  let t53 = @tactics.repeat_tac(@tactics.strip_tac)
  let t49 = @drule.match_mp(@prime.prime_factor())
  let t50 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(
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
    let s47 = @tactics.mp_tac(x46)
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
  })
  let t52 = @tactics.first_assum(fn(
    x51 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t50(t49(x51))
  })
  let t44 = @meson.asm_meson_tac(
    @list.List([@arith.not_lt(), @arith.lt_refl(), @int.divides_le()]),
  )
  let t43 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t39 = @term_syntax.parse_term("(m : Num)")
  let t42 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s37 = @tactics.mp_tac(x36)
      fn(
        x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s37(x38)
      }
    })(((x40 : @kernel.Thm) => @bool.spec(t39, x40))(x41))
  })
  let t35 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t33 = @drule.match_mp(@prime.prime_coprime())
  let t45 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_then(fn(
                    x34 : @kernel.Thm,
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
                      x30 : @kernel.Thm,
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
                      let s31 = @tactics.mp_tac(x30)
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
                        s31(x32)
                      }
                    })(t33(x34))
                  }),
                  @tactics.disch_tac,
                ),
                t35,
              ),
              @tactics.strip_tac,
            ),
            t42,
          ),
          @tactics.strip_tac,
        ),
        t43,
      ),
      t44,
    ),
    @tactics.all_tac,
  ])
  let t29 = @simp.asm_rewrite_tac(@list.List([@prime.prime_1()]))
  let t28 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t27 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t84 = @tactics.then_tac(
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
                                        @tactics.gen_tac,
                                        @class.asm_cases_tac(
                                          @term_syntax.parse_term("(p : Num) == 0"),
                                        ),
                                      ),
                                      t27,
                                    ),
                                    t28,
                                  ),
                                  t29,
                                ),
                                @tactics.eq_tac,
                              ),
                              t45,
                            ),
                            t52,
                          ),
                          t53,
                        ),
                        t60,
                      ),
                      t63,
                    ),
                    t67,
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
        ),
        @tactics.disch_tac,
      ),
      t82,
    ),
    t83,
  )
  prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) == (!(p == 0) && !(p == 1) && (∀ m : Num, 0 < m && m < p → coprime((p, m))))"),
      t84,
    ),
  )
}

///|
let prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME")

///|
/// `PRIME`
pub fn prime() -> @kernel.Thm {
  prime_c.get()
}

///|
/// FINITE_NUMBER_SEGMENT
fn step_8() -> Unit raise {
  let t109 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @arith.lt_refl()]),
  )
  let t108 = @simp.simp_tac(
    @list.List([@sets.finite_rules(), @sets.has_size(), @sets.card_clauses()]),
  )
  let t107 = @tactics.pop_assum(fn(
    x104 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s105 = @tactics.mp_tac(x104)
    fn(
      x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s105(x106)
    }
  })
  let t103 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t101 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t102 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert()]),
        ),
        t101,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t110 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.subgoal_then(
                  @term_syntax.parse_term("{(m : Num) | 0 < m && m < SUC((n : Num))} == INSERT(n, {(m : Num) | 0 < m && m < n})"),
                  fn(
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
                    let s99 = @tactics.subst1_tac(x98)
                    fn(
                      x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s99(x100)
                    }
                  },
                ),
                t102,
              ),
              t103,
            ),
            t107,
          ),
          t108,
        ),
        @tactics.disch_tac,
      ),
      t109,
    ),
    @int.arith_tac,
  )
  let t97 = @simp.rewrite_tac(@list.List([@sets.has_size_0()]))
  let t96 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t95 = @simp.asm_rewrite_tac(@list.List([]))
  let t94 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([
          @sets.extension(),
          @sets.in_elim_thm(),
          @sets.not_in_empty(),
        ]),
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t111 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("{(m : Num) | 0 < m && m < SUC((n : Num))} == {}"),
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
                let s92 = @tactics.subst1_tac(x91)
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
            ),
            t94,
          ),
          t95,
        ),
        t96,
      ),
      t97,
    ),
    t110,
  ])
  let t112 = @tactics.thenl(
    @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")),
    t111,
  )
  let t90 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t89 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), @sets.finite_rules(), @sets.card_clauses()]),
  )
  let t88 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_elim_thm(),
        @sets.not_in_empty(),
        @arith.lt(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t113 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.subgoal_then(
              @term_syntax.parse_term("{(m : Num) | 0 < m && m < 0} == {}"),
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
            ),
            t88,
          ),
          t89,
        ),
        t90,
      ),
      t112,
    ]),
  )
  finite_number_segment_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, HAS_SIZE({(m : Num) | 0 < m && m < n}, n - 1)"),
      t113,
    ),
  )
}

///|
let finite_number_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_NUMBER_SEGMENT",
)

///|
/// `FINITE_NUMBER_SEGMENT`
pub fn finite_number_segment() -> @kernel.Thm {
  finite_number_segment_c.get()
}

///|
/// CONG_MOD_0
fn step_9() -> Unit raise {
  cong_mod_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(0)) == (x == y)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mod_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_0")

///|
/// `CONG_MOD_0`
pub fn cong_mod_0() -> @kernel.Thm {
  cong_mod_0_c.get()
}

///|
/// CONG_MOD_1
fn step_10() -> Unit raise {
  cong_mod_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, op_eq_eq(x, y, mod(1))"),
      @int.number_tac,
    ),
  )
}

///|
let cong_mod_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_1")

///|
/// `CONG_MOD_1`
pub fn cong_mod_1() -> @kernel.Thm {
  cong_mod_1_c.get()
}

///|
/// CONG_0
fn step_11() -> Unit raise {
  cong_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ n : Num, op_eq_eq(x, 0, mod(n)) == divides(n, x)"),
      @int.number_tac,
    ),
  )
}

///|
let cong_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_0")

///|
/// `CONG_0`
pub fn cong_0() -> @kernel.Thm {
  cong_0_c.get()
}

///|
/// CONG_SUB_CASES
fn step_12() -> Unit raise {
  let t123 = @tactics.pop_assum(fn(
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
    let s121 = @tactics.mp_tac(x120)
    fn(
      x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s121(x122)
    }
  })
  let t119 = @tactics.repeat_tac(
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t118 = @list.List([
    @simp.gen_rewrite_tac(
      fn(
        x115 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s116 = @equal.land_conv(x115)
        fn(x117 : @kernel.Term) -> @kernel.Thm raise { s116(x117) }
      },
      @list.List([@theorems.swap_exists_thm()]),
    ),
    @tactics.all_tac,
  ])
  let t114 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t124 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114),
            @class.cond_cases_tac,
          ),
          t118,
        ),
        t119,
      ),
      t123,
    ),
    @int.arith_tac,
  )
  cong_sub_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) == (if x <= y { op_eq_eq(y - x, 0, mod(n)) } else { op_eq_eq(x - y, 0, mod(n)) })"),
      t124,
    ),
  )
}

///|
let cong_sub_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SUB_CASES")

///|
/// `CONG_SUB_CASES`
pub fn cong_sub_cases() -> @kernel.Thm {
  cong_sub_cases_c.get()
}

///|
/// CONG_MULT_LCANCEL
fn step_13() -> Unit raise {
  let t140 = @meson.asm_meson_tac(
    @list.List([@prime.coprime_divprod(), @prime.coprime_sym()]),
  )
  let t139 = @simp.asm_rewrite_tac(@list.List([]))
  let t138 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.left_sub_distrib()), cong_0()]),
  )
  let t137 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t136 = @simp.once_rewrite_tac(@list.List([cong_sub_cases()]))
  let t135 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s130 = @tactics.assume_tac(x129)
        fn(
          x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s130(x131)
        }
      },
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
      },
    ),
  )
  let t127 = @simp.simp_tac(@list.List([cong_mod_1()]))
  let t126 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_0()]))
  let t128 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
        t126,
      ),
      t127,
    ),
    @tactics.all_tac,
  ])
  let t125 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t141 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t125),
                  t128,
                ),
                t135,
              ),
              t136,
            ),
            t137,
          ),
          t138,
        ),
        @class.cond_cases_tac,
      ),
      t139,
    ),
    t140,
  )
  cong_mult_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ x : Num, ∀ y : Num, coprime((a, n)) && op_eq_eq(a * x, a * y, mod(n)) → op_eq_eq(x, y, mod(n))"),
      t141,
    ),
  )
}

///|
let cong_mult_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CONG_MULT_LCANCEL",
)

///|
/// `CONG_MULT_LCANCEL`
pub fn cong_mult_lcancel() -> @kernel.Thm {
  cong_mult_lcancel_c.get()
}

///|
/// CONG_REFL
fn step_14() -> Unit raise {
  let t142 = @meson.meson_tac(
    @list.List([
      @int.cong(),
      nat_mod(),
      @arith.add_clauses(),
      @arith.mult_clauses(),
    ]),
  )
  cong_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : Num, op_eq_eq(x, x, mod(n))"), t142),
  )
}

///|
let cong_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_REFL")

///|
/// `CONG_REFL`
pub fn cong_refl() -> @kernel.Thm {
  cong_refl_c.get()
}

///|
/// CONG_SYM
fn step_15() -> Unit raise {
  let t143 = @meson.meson_tac(@list.List([]))
  let t144 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()])),
    t143,
  )
  cong_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) == op_eq_eq(y, x, mod(n))"),
      t144,
    ),
  )
}

///|
let cong_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_SYM")

///|
/// `CONG_SYM`
pub fn cong_sym() -> @kernel.Thm {
  cong_sym_c.get()
}

///|
/// CONG_TRANS
fn step_16() -> Unit raise {
  let t145 = @meson.meson_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(x : Num) + (n : Num) * (q1 : Num) == (y : Num) + n * (q2 : Num) && y + n * (q3 : Num) == (z : Num) + n * (q4 : Num) → x + n * (q1 + q3) == z + n * (q2 + q4)"),
      ),
    ]),
  )
  let t146 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()])),
    t145,
  )
  cong_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, ∀ n : Num, op_eq_eq(x, y, mod(n)) && op_eq_eq(y, z, mod(n)) → op_eq_eq(x, z, mod(n))"),
      t146,
    ),
  )
}

///|
let cong_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_TRANS")

///|
/// `CONG_TRANS`
pub fn cong_trans() -> @kernel.Thm {
  cong_trans_c.get()
}

///|
/// phi
fn step_17() -> Unit raise {
  phi_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(phi : (Num) -> Num)((n : Num)) == CARD({(m : Num) | 0 < m && m <= n && coprime((m, n))})"),
    ),
  )
}

///|
let phi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("phi")

///|
/// `phi`
pub fn phi() -> @kernel.Thm {
  phi_c.get()
}

///|
/// PHI_ALT
fn step_18() -> Unit raise {
  let t164 = @meson.asm_meson_tac(
    @list.List([@arith.le_lt(), @prime.coprime_refl(), @arith.lt_nz()]),
  )
  let t165 = @list.List([
    @meson.asm_meson_tac(@list.List([@prime.coprime_0(), @prime.coprime_sym()])),
    t164,
  ])
  let t163 = @simp.asm_rewrite_tac(@list.List([@arith.lt()]))
  let t162 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t161 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t160 = @simp.asm_rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t158 = @tactics.repeat_tac(@tactics.strip_tac)
  let t157 = @simp.rewrite_tac(@list.List([@prime.coprime_1()]))
  let t156 = @simp.asm_rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_sing()]),
  )
  let t155 = @list.List([
    @tactics.all_tac,
    @simp.simp_tac(
      @list.List([
        @sets.card_clauses(),
        @sets.finite_rules(),
        @sets.not_in_empty(),
      ]),
    ),
  ])
  let t154 = @tactics.conjuncts_then(fn(
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
    let s152 = @tactics.subst1_tac(x151)
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
  })
  let t159 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.subgoal_then(
                @term_syntax.parse_term("{(m : Num) | 0 < m && m <= (n : Num) && coprime((m, n))} == {1} && {(m : Num) | coprime((m, n)) && m < n} == {0}"),
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
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t150 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t148 = @meson.meson_tac(@list.List([@arith.lt(), @arith.not_lt()]))
  let t149 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.ap_term_tac,
        @simp.asm_rewrite_tac(
          @list.List([@sets.extension(), @sets.in_elim_thm()]),
        ),
      ),
      t148,
    ),
    @tactics.all_tac,
  ])
  let t147 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t166 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @simp.rewrite_tac(@list.List([phi()])),
                      t147,
                    ),
                    t149,
                  ),
                  t150,
                ),
                t159,
              ),
              @tactics.ap_term_tac,
            ),
            t160,
          ),
          t161,
        ),
        t162,
      ),
      t163,
    ),
    t165,
  )
  phi_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("phi((n : Num)) == CARD({(m : Num) | coprime((m, n)) && m < n})"),
      t166,
    ),
  )
}

///|
let phi_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_ALT")

///|
/// `PHI_ALT`
pub fn phi_alt() -> @kernel.Thm {
  phi_alt_c.get()
}

///|
/// PHI_ANOTHER
fn step_19() -> Unit raise {
  let t169 = @meson.asm_meson_tac(
    @list.List([
      @arith.le_lt(),
      @prime.coprime_refl(),
      @prime.coprime_1(),
      @arith.lt_nz(),
    ]),
  )
  let t168 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_elim_thm()]),
  )
  let t167 = @simp.rewrite_tac(@list.List([phi()]))
  let t170 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t167),
        @tactics.ap_term_tac,
      ),
      t168,
    ),
    t169,
  )
  phi_another_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 1) → phi(n) == CARD({(m : Num) | 0 < m && m < n && coprime((m, n))})"),
      t170,
    ),
  )
}

///|
let phi_another_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_ANOTHER")

///|
/// `PHI_ANOTHER`
pub fn phi_another() -> @kernel.Thm {
  phi_another_c.get()
}

///|
/// PHI_LIMIT
fn step_20() -> Unit raise {
  let t177 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t176 = @simp.asm_rewrite_tac(@list.List([@sets.finite_numseg_lt()]))
  let t175 = @tactics.match_mp_tac(@sets.card_subset())
  let t174 = @simp.gen_rewrite_tac(
    fn(
      x171 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s172 = @equal.rand_conv(x171)
      fn(x173 : @kernel.Term) -> @kernel.Thm raise { s172(x173) }
    },
    @list.List([@equal.gsym(@sets.card_numseg_lt())]),
  )
  let t178 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([phi_alt()])),
          ),
          t174,
        ),
        t175,
      ),
      t176,
    ),
    t177,
  )
  phi_limit_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, phi(n) <= n"), t178))
}

///|
let phi_limit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_LIMIT")

///|
/// `PHI_LIMIT`
pub fn phi_limit() -> @kernel.Thm {
  phi_limit_c.get()
}

///|
/// PHI_LIMIT_STRONG
fn step_21() -> Unit raise {
  let t191 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t189 = @tactics.match_mp_tac(@sets.card_subset())
  let t188 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s182 = @tactics.assume_tac(x181)
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
      },
      fn(
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
        (fn(
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
          let s185 = @tactics.subst1_tac(x184)
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
        })(@equal.sym(x187))
      },
    ),
  )
  let t180 = @simp.asm_simp_tac(@list.List([phi_another(), @sets.has_size()]))
  let t179 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), finite_number_segment()),
  )
  let t192 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t179),
            t180,
          ),
          t188,
        ),
        t189,
      ),
      t190,
    ),
    t191,
  )
  phi_limit_strong_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 1) → phi(n) <= n - 1"), t192),
  )
}

///|
let phi_limit_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LIMIT_STRONG",
)

///|
/// `PHI_LIMIT_STRONG`
pub fn phi_limit_strong() -> @kernel.Thm {
  phi_limit_strong_c.get()
}

///|
/// PHI_0
fn step_22() -> Unit raise {
  let t193 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t194 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), phi_limit())),
      t193,
    ),
    @int.arith_tac,
  )
  phi_0_c.set(@tactics.prove(@term_syntax.parse_term("phi(0) == 0"), t194))
}

///|
let phi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_0")

///|
/// `PHI_0`
pub fn phi_0() -> @kernel.Thm {
  phi_0_c.get()
}

///|
/// PHI_1
fn step_23() -> Unit raise {
  let t195 = @simp.rewrite_tac(
    @list.List([phi_alt(), @prime.coprime_1(), @sets.card_numseg_lt()]),
  )
  phi_1_c.set(@tactics.prove(@term_syntax.parse_term("phi(1) == 1"), t195))
}

///|
let phi_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_1")

///|
/// `PHI_1`
pub fn phi_1() -> @kernel.Thm {
  phi_1_c.get()
}

///|
/// PHI_LOWERBOUND_1_STRONG
fn step_24() -> Unit raise {
  let t210 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t209 = @simp.rewrite_tac(
    @list.List([@sets.card_numseg_le(), @sets.finite_numseg_le()]),
  )
  let t208 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Num) | b <= (n : Num)}"))
  let t211 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t208),
      t209,
    ),
    t210,
  )
  let t207 = @tactics.pop_assum(fn(
    x204 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s205 = @tactics.mp_tac(x204)
    fn(
      x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s205(x206)
    }
  })
  let t203 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.coprime_1(),
      ),
    ]),
  )
  let t212 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.simp_tac(
              @list.List([
                @sets.subset(),
                @sets.in_insert(),
                @sets.not_in_empty(),
                @sets.in_elim_thm(),
              ]),
            ),
            t203,
          ),
          @tactics.gen_tac,
        ),
        t207,
      ),
      @int.arith_tac,
    ),
    t211,
  ])
  let t202 = @tactics.match_mp_tac(@sets.card_subset())
  let t201 = @simp.rewrite_tac(@list.List([phi()]))
  let t200 = @list.List([
    @simp.simp_tac(
      @list.List([
        @sets.card_clauses(),
        @sets.not_in_empty(),
        @sets.finite_rules(),
        @calc_num.arith(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t199 = @tactics.subgoal_then(@term_syntax.parse_term("1 == CARD({1})"), fn(
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
  })
  let t213 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t199),
            t200,
          ),
          t201,
        ),
        t202,
      ),
      @tactics.conj_tac,
    ),
    t212,
  )
  phi_lowerbound_1_strong_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → 1 <= phi(n)"), t213),
  )
}

///|
let phi_lowerbound_1_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_1_STRONG",
)

///|
/// `PHI_LOWERBOUND_1_STRONG`
pub fn phi_lowerbound_1_strong() -> @kernel.Thm {
  phi_lowerbound_1_strong_c.get()
}

///|
/// PHI_LOWERBOUND_1
fn step_25() -> Unit raise {
  let t214 = @meson.meson_tac(
    @list.List([
      phi_lowerbound_1_strong(),
      @arith.le_trans(),
      @int.arith_rule(@term_syntax.parse_term("1 <= 2")),
    ]),
  )
  phi_lowerbound_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 2 <= n → 1 <= phi(n)"), t214),
  )
}

///|
let phi_lowerbound_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_1",
)

///|
/// `PHI_LOWERBOUND_1`
pub fn phi_lowerbound_1() -> @kernel.Thm {
  phi_lowerbound_1_c.get()
}

///|
/// PHI_LOWERBOUND_2
fn step_26() -> Unit raise {
  let t240 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t239 = @simp.rewrite_tac(
    @list.List([@sets.card_numseg_le(), @sets.finite_numseg_le()]),
  )
  let t238 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Num) | b <= (n : Num)}"))
  let t241 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t238),
      t239,
    ),
    t240,
  )
  let t236 = @simp.asm_simp_tac(@list.List([@prime.divides_sub()]))
  let t237 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("3 <= (n : Num)")),
      @int.arith_tac,
    ),
    t236,
  ])
  let t235 = @tactics.subgoal_then(@term_syntax.parse_term("1 == (n : Num) - (n - 1)"), fn(
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
    let s233 = @tactics.subst1_tac(x232)
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
  })
  let t231 = @simp.asm_rewrite_tac(@list.List([]))
  let t230 = @tactics.disch_then(@tactics.match_mp_tac)
  let t229 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t227 = @bool.conjunct1(@prime.coprime_1())
  let t228 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), t227))
  let t226 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t225 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t224 = @simp.asm_simp_tac(
    @list.List([
      @calc_num.arith(),
      @int.arith_rule(
        @term_syntax.parse_term("3 <= (n : Num) → 0 < n - 1 && n - 1 <= n && 1 <= n"),
      ),
    ]),
  )
  let t223 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t242 = @list.List([
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
                              @simp.simp_tac(
                                @list.List([
                                  @sets.subset(),
                                  @sets.in_insert(),
                                  @sets.not_in_empty(),
                                  @sets.in_elim_thm(),
                                ]),
                              ),
                              @tactics.gen_tac,
                            ),
                            @tactics.strip_tac,
                          ),
                          t223,
                        ),
                        t224,
                      ),
                      t225,
                    ),
                    t226,
                  ),
                  @tactics.strip_tac,
                ),
                t228,
              ),
              t229,
            ),
            t230,
          ),
          t231,
        ),
        t235,
      ),
      t237,
    ),
    t241,
  ])
  let t222 = @tactics.match_mp_tac(@sets.card_subset())
  let t221 = @simp.rewrite_tac(@list.List([phi()]))
  let t219 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → !(1 == n - 1)"))]),
  )
  let t220 = @list.List([
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @sets.card_clauses(),
          @sets.in_insert(),
          @sets.not_in_empty(),
          @sets.finite_rules(),
          @calc_num.arith(),
        ]),
      ),
      t219,
    ),
    @tactics.all_tac,
  ])
  let t218 = @tactics.subgoal_then(@term_syntax.parse_term("2 == CARD({1, (n : Num) - 1})"), fn(
    x215 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s216 = @tactics.subst1_tac(x215)
    fn(
      x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s216(x217)
    }
  })
  let t243 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t218),
            t220,
          ),
          t221,
        ),
        t222,
      ),
      @tactics.conj_tac,
    ),
    t242,
  )
  phi_lowerbound_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, 3 <= n → 2 <= phi(n)"), t243),
  )
}

///|
let phi_lowerbound_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PHI_LOWERBOUND_2",
)

///|
/// `PHI_LOWERBOUND_2`
pub fn phi_lowerbound_2() -> @kernel.Thm {
  phi_lowerbound_2_c.get()
}

///|
/// PHI_PRIME_EQ
fn step_27() -> Unit raise {
  let t266 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t265 = @simp.asm_rewrite_tac(@list.List([]))
  let t264 = @tactics.match_mp_tac(@sets.card_subset_eq())
  let t263 = @simp.simp_tac(@list.List([]))
  let t261 = @tactics.conv_tac(@class.taut)
  let t260 = @simp.rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t262 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@sets.extension(), @sets.in_elim_thm()]),
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.abs_tac,
        ),
        t260,
      ),
      t261,
    ),
  ])
  let t259 = @tactics.exists_tac(
    @term_syntax.parse_term("{(m : Num) | 0 < m && m < (n : Num) && coprime((m, n))} == {(m : Num) | 0 < m && m < n}"),
  )
  let t258 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t257 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x250 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s251 = @tactics.assume_tac(x250)
        fn(
          x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s251(x252)
        }
      },
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
        (fn(
          x253 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s254 = @tactics.subst1_tac(x253)
          fn(
            x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s254(x255)
          }
        })(@equal.sym(x256))
      },
    ),
  )
  let t249 = @simp.asm_simp_tac(@list.List([phi_another(), @sets.has_size()]))
  let t248 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(n : Num)"), finite_number_segment()),
  )
  let t247 = @simp.asm_rewrite_tac(@list.List([phi_1(), @calc_num.arith()]))
  let t246 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t245 = @simp.asm_rewrite_tac(@list.List([]))
  let t244 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t267 = @tactics.then_tac(
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
                                      @tactics.gen_tac,
                                      @simp.rewrite_tac(@list.List([prime()])),
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
                        ),
                        t257,
                      ),
                      t258,
                    ),
                    t259,
                  ),
                  @tactics.conj_tac,
                ),
                t262,
              ),
              @tactics.eq_tac,
            ),
            t263,
          ),
          @tactics.disch_tac,
        ),
        t264,
      ),
      t265,
    ),
    t266,
  )
  phi_prime_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, (phi(n) == n - 1 && !(n == 0) && !(n == 1)) == prime(n)"),
      t267,
    ),
  )
}

///|
let phi_prime_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_PRIME_EQ")

///|
/// `PHI_PRIME_EQ`
pub fn phi_prime_eq() -> @kernel.Thm {
  phi_prime_eq_c.get()
}

///|
/// PHI_PRIME
fn step_28() -> Unit raise {
  let t268 = @meson.meson_tac(@list.List([phi_prime_eq()]))
  phi_prime_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → phi(p) == p - 1"), t268),
  )
}

///|
let phi_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_PRIME")

///|
/// `PHI_PRIME`
pub fn phi_prime() -> @kernel.Thm {
  phi_prime_c.get()
}

///|
/// DIFFERENCE_POS_LEMMA
fn step_29() -> Unit raise {
  let t275 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t274 = @tactics.pop_assum_list(fn(
    x273 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x269 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s270 = @tactics.mp_tac(x269)
      fn(
        x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s270(x271)
      }
    })(
      ((x272 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x272))(
        x273,
      ),
    )
  })
  let t276 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @tactics.exists_tac(@term_syntax.parse_term("(x2 : Num) - (x1 : Num)")),
        ),
        t274,
      ),
      t275,
    ),
    @int.arith_tac,
  )
  difference_pos_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(b : Num) <= (a : Num) && (∃ x1 : Num, ∃ x2 : Num, x1 * (n : Num) + a == x2 * n + b) → (∃ x : Num, a == x * n + b)"),
      t276,
    ),
  )
}

///|
let difference_pos_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIFFERENCE_POS_LEMMA",
)

///|
/// `DIFFERENCE_POS_LEMMA`
pub fn difference_pos_lemma() -> @kernel.Thm {
  difference_pos_lemma_c.get()
}

///|
/// ITSET_MODMULT
fn step_30() -> Unit raise {
  let t362 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t361 = @simp.asm_simp_tac(
    @list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod()]),
  )
  let t360 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t358 = @simp.asm_simp_tac(@list.List([@arith.mod_lt()]))
  let t356 = @simp.asm_rewrite_tac(@list.List([]))
  let t355 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t354 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t357 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())])),
          t354,
        ),
        t355,
      ),
      t356,
    ),
    @tactics.all_tac,
  ])
  let t353 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((b : Num), (n : Num)) == MOD((c : Num), n)"), fn(
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
  })
  let t349 = @tactics.subgoal_then(@term_syntax.parse_term("(b : Num) == (c : Num)"), fn(
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
    let th_2 = x347
    @simp.asm_rewrite_tac(@list.List([th_2]))
  })
  let t346 = @simp.rewrite_tac(@list.List([]))
  let t345 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((b : Num), (s : (Num) -> Bool))"))
  let t344 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t343 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x337 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s338 = @tactics.mp_tac(x337)
        fn(
          x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s338(x339)
        }
      },
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
        let s341 = @tactics.assume_tac(x340)
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
    ),
  )
  let t336 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(
      x333 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s334 = @tactics.mp_tac(x333)
      fn(
        x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s334(x335)
      }
    }),
  )
  let t359 = @list.List([
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
                        @simp.rewrite_tac(@list.List([@sets.in_image()])),
                        t336,
                      ),
                      t343,
                    ),
                    t344,
                  ),
                  @tactics.disch_tac,
                ),
                t345,
              ),
              t346,
            ),
            t349,
          ),
          t353,
        ),
        t357,
      ),
      t358,
    ),
    @tactics.all_tac,
  ])
  let t332 = @tactics.subgoal_then(
    @term_syntax.parse_term("!IN(MOD((a : Num) * (b : Num), (n : Num)), IMAGE((b : Num) => MOD(a * b, n), (s : (Num) -> Bool)))"),
    fn(
      x330 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x330
      @simp.rewrite_tac(@list.List([th_1]))
    },
  )
  let t329 = @simp.rewrite_tac(@list.List([]))
  let t325 = @term_syntax.parse_term("(b : Num)")
  let t328 = @tactics.disch_then(fn(
    x327 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s323 = @tactics.mp_tac(x322)
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
    })(((x326 : @kernel.Thm) => @bool.spec(t325, x326))(x327))
  })
  let t321 = @simp.simp_tac(@list.List([]))
  let t320 = @simp.asm_rewrite_tac(@list.List([]))
  let t319 = @class.asm_cases_tac(@term_syntax.parse_term("∀ b : Num, IN(b, (s : (Num) -> Bool)) → b < (n : Num)"))
  let t318 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t317 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"),
      ),
    ]),
  )
  let t316 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t315 = @tactics.disch_then(
    @tactics.conjuncts_then2(
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
        let s313 = @tactics.mp_tac(x312)
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
      @tactics.strip_assume_tac,
    ),
  )
  let t311 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> Bool)"))
  let t310 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Num)"))
  let t307 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t308 = @tactics.map_every(
    fn(
      x304 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s305 = @tactics.undisch_tac(x304)
      fn(
        x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s305(x306)
      }
    },
    @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t307]),
  )
  let t303 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.mult_clauses()]),
  )
  let t302 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t301 = @tactics.match_mp_tac(@arith.mod_uniq())
  let t300 = @tactics.conv_tac(@equal.sym_conv)
  let t309 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@arith.exp(), @arith.mult_clauses()]),
                  ),
                  @tactics.strip_tac,
                ),
                t300,
              ),
              t301,
            ),
            t302,
          ),
          t303,
        ),
        t308,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t299 = @simp.asm_simp_tac(
    @list.List([
      @sets.image_clauses(),
      @sets.card_clauses(),
      @sets.finite_image(),
    ]),
  )
  let t297 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t298 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([@arith.mod_mult_rmod()])),
      t297,
    ),
    @tactics.all_tac,
  ])
  let t283 = @term_syntax.parse_term("1")
  let t284 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Num) => (y : Num) => MOD(x * y, (n : Num))"), t283]),
      @sets.finite_recursion(),
    ),
  )
  let t282 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t281 = @simp.asm_rewrite_tac(@list.List([]))
  let t280 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((a : Num), (n : Num)))"))
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t278 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t363 = @tactics.then_tac(
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
                                                                @tactics.then_tac(
                                                                  @tactics.gen_tac,
                                                                  @class.asm_cases_tac(
                                                                    @term_syntax.parse_term("(n : Num) == 0"),
                                                                  ),
                                                                ),
                                                                t277,
                                                              ),
                                                              t278,
                                                            ),
                                                            t279,
                                                          ),
                                                          t280,
                                                        ),
                                                        t281,
                                                      ),
                                                      t282,
                                                    ),
                                                    t284,
                                                  ),
                                                  fn(
                                                    x296 : (
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
                                                      x295 : (
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
                                                        x293 : @kernel.Term,
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
                                                        (fn(
                                                          x291 : @kernel.Term,
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
                                                          (fn(
                                                            x285 : @kernel.Term,
                                                          ) -> ((
                                                            (@kernel.Thm) -> ((
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
                                                            ) raise) raise,
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
                                                          ) raise) raise) raise {
                                                            fn(
                                                              x286 : (
                                                                @kernel.Thm,
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
                                                              ) raise) raise,
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
                                                              let s287 = @tactics.subgoal_then(
                                                                x285, x286,
                                                              )
                                                              fn(
                                                                x288 : (
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
                                                                s287(x288)
                                                              }
                                                            }
                                                          })(x291)(fn(
                                                            x289 : @kernel.Thm,
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
                                                            let th = x289
                                                            @simp.rewrite_tac(
                                                              @list.List([th]),
                                                            )
                                                          })
                                                        })(
                                                          ((x292 : @kernel.Term) => {
                                                            @lib.funpow(
                                                              2, @equal.lhand, x292,
                                                            )
                                                          })(x293),
                                                        )
                                                      })(
                                                        (fn(
                                                          x294 : (
                                                            @list.List[
                                                              (
                                                                String,
                                                                @kernel.Thm,
                                                              ),
                                                            ],
                                                            @kernel.Term,
                                                          ),
                                                        ) -> @kernel.Term raise {
                                                          x294.1
                                                        })(x295),
                                                      )
                                                    })(x296)(x296)
                                                  },
                                                ),
                                                t298,
                                              ),
                                              @tactics.strip_tac,
                                            ),
                                            t299,
                                          ),
                                          @tactics.conj_tac,
                                        ),
                                        t309,
                                      ),
                                      t310,
                                    ),
                                    t311,
                                  ),
                                  t315,
                                ),
                                t316,
                              ),
                              t317,
                            ),
                            t318,
                          ),
                          t319,
                        ),
                        t320,
                      ),
                      @tactics.disch_tac,
                    ),
                    t321,
                  ),
                  t328,
                ),
                t329,
              ),
              @tactics.disch_tac,
            ),
            t332,
          ),
          t359,
        ),
        t360,
      ),
      t361,
    ),
    t362,
  )
  itset_modmult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ s : (Num) -> Bool, FINITE(s) && !(n == 0) && !(n == 1) && coprime(((a : Num), n)) → (∀ b : Num, IN(b, s) → b < n) → ITSET((x : Num) => (y : Num) => MOD(x * y, n), IMAGE((b : Num) => MOD(a * b, n), s), 1) == MOD(EXP(a, CARD(s)) * ITSET((x : Num) => (y : Num) => MOD(x * y, n), s, 1), n)"),
      t363,
    ),
  )
}

///|
let itset_modmult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITSET_MODMULT")

///|
/// `ITSET_MODMULT`
pub fn itset_modmult() -> @kernel.Thm {
  itset_modmult_c.get()
}

///|
/// ITSET_MODMULT_COPRIME
fn step_31() -> Unit raise {
  let t399 = @simp.asm_simp_tac(
    @list.List([
      @int.coprime_lmod(),
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.coprime_mul(),
      ),
    ]),
  )
  let t395 = @term_syntax.parse_term("(x : Num)")
  let t398 = @tactics.disch_then(fn(
    x397 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x392 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s393 = @tactics.mp_tac(x392)
      fn(
        x394 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s393(x394)
      }
    })(((x396 : @kernel.Thm) => @bool.spec(t395, x396))(x397))
  })
  let t391 = @simp.asm_rewrite_tac(@list.List([]))
  let t390 = @class.asm_cases_tac(
    @term_syntax.parse_term("∀ b : Num, IN(b, (s : (Num) -> Bool)) → coprime((b, (n : Num)))"),
  )
  let t388 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t389 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Num)"), t388]),
  )
  let t387 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t386 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"),
      ),
    ]),
  )
  let t385 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t384 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(
        @prime.coprime_1(),
      ),
    ]),
  )
  let t383 = @simp.asm_simp_tac(
    @list.List([
      @sets.image_clauses(),
      @sets.card_clauses(),
      @sets.finite_image(),
    ]),
  )
  let t381 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t382 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([@arith.mod_mult_rmod()])),
      t381,
    ),
    @tactics.all_tac,
  ])
  let t367 = @term_syntax.parse_term("1")
  let t368 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(x : Num) => (y : Num) => MOD(x * y, (n : Num))"), t367]),
      @sets.finite_recursion(),
    ),
  )
  let t366 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t365 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t364 = @simp.asm_rewrite_tac(@list.List([]))
  let t400 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
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
                                        @tactics.gen_tac,
                                        @class.asm_cases_tac(
                                          @term_syntax.parse_term("(n : Num) == 0"),
                                        ),
                                      ),
                                      t364,
                                    ),
                                    t365,
                                  ),
                                  t366,
                                ),
                                t368,
                              ),
                              fn(
                                x380 : (
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
                                  x379 : (
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
                                    x377 : @kernel.Term,
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
                                      x375 : @kernel.Term,
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
                                        x369 : @kernel.Term,
                                      ) -> ((
                                        (@kernel.Thm) -> ((
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
                                        ) raise) raise,
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
                                      ) raise) raise) raise {
                                        fn(
                                          x370 : (@kernel.Thm) -> ((
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
                                          ) raise) raise,
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
                                          let s371 = @tactics.subgoal_then(
                                            x369, x370,
                                          )
                                          fn(
                                            x372 : (
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
                                            s371(x372)
                                          }
                                        }
                                      })(x375)(fn(
                                        x373 : @kernel.Thm,
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
                                        let th = x373
                                        @simp.rewrite_tac(@list.List([th]))
                                      })
                                    })(
                                      ((x376 : @kernel.Term) => {
                                        @lib.funpow(2, @equal.lhand, x376)
                                      })(x377),
                                    )
                                  })(
                                    (fn(
                                      x378 : (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> @kernel.Term raise {
                                      x378.1
                                    })(x379),
                                  )
                                })(x380)(x380)
                              },
                            ),
                            t382,
                          ),
                          @tactics.strip_tac,
                        ),
                        t383,
                      ),
                      t384,
                    ),
                    t385,
                  ),
                  t386,
                ),
                t387,
              ),
              t389,
            ),
            t390,
          ),
          t391,
        ),
        @tactics.strip_tac,
      ),
      t398,
    ),
    t399,
  )
  itset_modmult_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ s : (Num) -> Bool, FINITE(s) && (∀ b : Num, IN(b, s) → coprime((b, n))) && !(n == 0) → coprime((ITSET((x : Num) => (y : Num) => MOD(x * y, n), s, 1), n))"),
      t400,
    ),
  )
}

///|
let itset_modmult_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITSET_MODMULT_COPRIME",
)

///|
/// `ITSET_MODMULT_COPRIME`
pub fn itset_modmult_coprime() -> @kernel.Thm {
  itset_modmult_coprime_c.get()
}

///|
/// FERMAT_LITTLE
fn step_32() -> Unit raise {
  let t688 = @simp.asm_simp_tac(
    @list.List([itset_modmult_coprime(), @sets.in_elim_thm()]),
  )
  let t687 = @simp.asm_rewrite_tac(@list.List([]))
  let t686 = @tactics.exists_tac(
    @term_syntax.parse_term("ITSET((x : Num) => (y : Num) => MOD(x * y, (n : Num)), {(b : Num) | 0 < b && b < n && coprime((b, n))}, 1)"),
  )
  let t685 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t684 = @simp.gen_rewrite_tac(
    fn(
      x683 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x679 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x673 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s674 = @equal.land_conv(x673)
          fn(x675 : @kernel.Term) -> @kernel.Thm raise { s674(x675) }
        })(
          (fn(
            x676 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s677 = @equal.rator_conv(x676)
            fn(x678 : @kernel.Term) -> @kernel.Thm raise { s677(x678) }
          })(x679),
        )
      })(
        (fn(
          x680 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s681 = @equal.land_conv(x680)
          fn(x682 : @kernel.Term) -> @kernel.Thm raise { s681(x682) }
        })(x683),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t672 = @simp.gen_rewrite_tac(
    fn(
      x671 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x667 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x661 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s662 = @equal.land_conv(x661)
          fn(x663 : @kernel.Term) -> @kernel.Thm raise { s662(x663) }
        })(
          (fn(
            x664 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s665 = @equal.rator_conv(x664)
            fn(x666 : @kernel.Term) -> @kernel.Thm raise { s665(x666) }
          })(x667),
        )
      })(
        (fn(
          x668 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s669 = @equal.rand_conv(x668)
          fn(x670 : @kernel.Term) -> @kernel.Thm raise { s669(x670) }
        })(x671),
      )
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) == x * 1"))]),
  )
  let t660 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t659 = @simp.asm_simp_tac(@list.List([@arith.mod_mod_refl()]))
  let t655 = @term_syntax.parse_term("(n : Num)")
  let t658 = @tactics.disch_then(fn(
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
    (fn(
      x650 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s651 = @tactics.mp_tac(x650)
      fn(
        x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s651(x652)
      }
    })(
      (fn(x656 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x653 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x654 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x653, x654)
          }
        })(x656)(t655)
      })(x657),
    )
  })
  let t646 = @term_syntax.parse_term("MOD")
  let t649 = @tactics.disch_then(fn(
    x648 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x647 : @kernel.Thm) => @equal.ap_term(t646, x647))(x648))
  })
  let t642 = @simp.asm_simp_tac(@list.List([@equal.gsym(phi_another())]))
  let t641 = @simp.asm_simp_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(itset_modmult()),
    ]),
  )
  let t639 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t638 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        finite_number_segment(),
      ),
    ]),
  )
  let t637 = @tactics.exists_tac(@term_syntax.parse_term("{(b : Num) | 0 < b && b < (n : Num)}"))
  let t636 = @tactics.match_mp_tac(@sets.finite_subset())
  let t640 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.conj_tac,
              @list.List([
                @tactics.all_tac,
                @simp.simp_tac(@list.List([@sets.in_elim_thm()])),
              ]),
            ),
            t636,
          ),
          t637,
        ),
        t638,
      ),
      t639,
    ),
    @tactics.all_tac,
  ])
  let t635 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE({(b : Num) | 0 < b && b < (n : Num) && coprime((b, n))}) && (∀ b : Num, IN(b, {(b : Num) | 0 < b && b < n && coprime((b, n))}) → b < n)"),
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
      let s633 = @tactics.assume_tac(x632)
      fn(
        x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s633(x634)
      }
    },
  )
  let t628 = @term_syntax.parse_term("1")
  let t631 = @tactics.disch_then(fn(
    x630 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x623 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s624 = @tactics.mp_tac(x623)
      fn(
        x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s624(x625)
      }
    })(
      (fn(x629 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x626 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x627 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x626, x627)
          }
        })(x629)(t628)
      })(x630),
    )
  })
  let t619 = @term_syntax.parse_term("ITSET((x : Num) => (y : Num) => MOD(x * y, (n : Num)))")
  let t622 = @tactics.disch_then(fn(
    x621 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x620 : @kernel.Thm) => @equal.ap_term(t619, x620))(x621))
  })
  let t615 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @sets.image(),
        @sets.extension(),
        @sets.in_elim_thm(),
        @theorems.conj_assoc(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t614 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(c : Num) | ∃ b : Num, 0 < b && b < (n : Num) && coprime((b, n)) && c == MOD((a : Num) * b, n)} == IMAGE((b : Num) => MOD(a * b, n), {(b : Num) | 0 < b && b < n && coprime((b, n))})"),
    fn(
      x611 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s612 = @tactics.subst1_tac(x611)
      fn(
        x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s612(x613)
      }
    },
  )
  let t607 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac()]))
  let t606 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.mult_clauses(),
    ]),
  )
  let t605 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.division()])),
    @tactics.all_tac,
  ])
  let t604 = @tactics.subgoal_then(
    @term_syntax.parse_term("(y : Num) == DIV(y, (n : Num)) * n + MOD(y, n)"),
    fn(
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
      let th_3 = x595
      @simp.gen_rewrite_tac(
        fn(
          x603 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x597 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s598 = @equal.land_conv(x597)
            fn(x599 : @kernel.Term) -> @kernel.Thm raise { s598(x599) }
          })(
            (fn(
              x600 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s601 = @equal.once_depth_conv(x600)
              fn(x602 : @kernel.Term) -> @kernel.Thm raise { s601(x602) }
            })(x603),
          )
        },
        @list.List([th_3]),
      )
    },
  )
  let t592 = @drule.match_mp(
    @int.arith_rule(
      @term_syntax.parse_term("(n : Num) * (x : Num) - (a : Num) * (y : Num) == 1 → x * n == a * y + 1"),
    ),
  )
  let t594 = @tactics.first_assum(fn(
    x593 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s590 = @tactics.subst1_tac(x589)
      fn(
        x591 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s590(x591)
      }
    })(t592(x593))
  })
  let t588 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((x : Num) + (a : Num) * ((c : Num) * (n : Num)) == c * (a * n) + (y : Num)) == (x == y)"),
      ),
    ]),
  )
  let t586 = @equal.gsym(@arith.mult_assoc())
  let t587 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.add_assoc()), t586]),
  )
  let t585 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.mult_clauses(),
    ]),
  )
  let t583 = @simp.asm_simp_tac(
    @list.List([@arith.lt_imp_le(), @arith.division()]),
  )
  let t582 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t584 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@arith.mult_assoc()])),
        t582,
      ),
      t583,
    ),
    @tactics.all_tac,
  ])
  let t581 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("(y : Num) <= (n : Num) && (a : Num) + n == (x : Num) + y → a + (n - y) == x"),
    ),
  )
  let t580 = @simp.rewrite_tac(
    @list.List([@arith.left_add_distrib(), @arith.left_sub_distrib()]),
  )
  let t578 = @term_syntax.parse_term("(c : Num) * ((a : Num) * (1 + DIV((y : Num), (n : Num))))")
  let t579 = @tactics.map_every(
    fn(
      x575 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s576 = @tactics.exists_tac(x575)
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
    },
    @list.List([@term_syntax.parse_term("(c : Num) * (x : Num)"), t578]),
  )
  let t573 = @simp.asm_simp_tac(
    @list.List([@arith.division(), @arith.not_le()]),
  )
  let t572 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_0()]))
  let t571 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t570 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t569 = @tactics.undisch_tac(@term_syntax.parse_term("coprime(((a : Num), (n : Num)))"))
  let t568 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")),
      @arith.mult_eq_0(),
      @arith.sub_eq_0(),
      @class.de_morgan_thm(),
    ]),
  )
  let t567 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t574 = @list.List([
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
                          @int.arith_rule(
                            @term_syntax.parse_term("((c : Num) <= (a : Num) * (c * (x : Num))) == (c * 1 <= c * (a * x))"),
                          ),
                        ]),
                      ),
                      t567,
                    ),
                    @tactics.disj2_tac,
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
        @tactics.disch_tac,
      ),
      t573,
    ),
    @tactics.all_tac,
  ])
  let t566 = @tactics.match_mp_tac(difference_pos_lemma())
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t564 = @tactics.match_mp_tac(@arith.mod_uniq())
  let t563 = @tactics.conv_tac(@equal.sym_conv)
  let t562 = @simp.asm_simp_tac(@list.List([@arith.mod_mult_rmod()]))
  let t560 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_add(),
      @prime.divides_lmul(),
      @prime.divides_refl(),
    ]),
  )
  let t559 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t558 = @tactics.repeat_tac(@tactics.strip_tac)
  let t557 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t556 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.division()])),
    @tactics.all_tac,
  ])
  let t555 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Num, (c : Num) * x == DIV(c * x, (n : Num)) * n + MOD(c * x, n)"),
    fn(
      x546 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_2 = x546
      @simp.gen_rewrite_tac(
        fn(
          x554 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x548 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s549 = @equal.land_conv(x548)
            fn(x550 : @kernel.Term) -> @kernel.Thm raise { s549(x550) }
          })(
            (fn(
              x551 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s552 = @equal.once_depth_conv(x551)
              fn(x553 : @kernel.Term) -> @kernel.Thm raise { s552(x553) }
            })(x554),
          )
        },
        @list.List([th_2]),
      )
    },
  )
  let t544 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(m : Num) < (n : Num) → n - m + m == n")),
      @arith.division(),
    ]),
  )
  let t543 = @simp.asm_rewrite_tac(@list.List([]))
  let t542 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - MOD((y : Num), n)"))
  let t541 = @tactics.match_mp_tac(@prime.divides_add_revr())
  let t540 = @simp.asm_simp_tac(
    @list.List([@prime.divides_lmul(), @prime.divides_refl()]),
  )
  let t539 = @tactics.match_mp_tac(@prime.divides_add())
  let t538 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.division()])),
    @tactics.all_tac,
  ])
  let t537 = @tactics.subgoal_then(
    @term_syntax.parse_term("(y : Num) == DIV(y, (n : Num)) * n + MOD(y, n)"),
    fn(
      x534 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s535 = @tactics.subst1_tac(x534)
      fn(
        x536 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s535(x536)
      }
    },
  )
  let t533 = @tactics.match_mp_tac(@prime.divides_lmul())
  let t532 = @simp.asm_simp_tac(
    @list.List([@prime.divides_rmul(), @prime.divides_refl()]),
  )
  let t531 = @tactics.match_mp_tac(@prime.divides_sub())
  let t530 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Num)"))
  let t529 = @tactics.first_x_assum(fn(
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
    (fn(
      x525 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s526 = @tactics.subst1_tac(x525)
      fn(
        x527 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s526(x527)
      }
    })(@equal.sym(x528))
  })
  let t524 = @simp.rewrite_tac(
    @list.List([@int.coprime(), @equal.gsym(@int.divides_one())]),
  )
  let t523 = @simp.asm_rewrite_tac(@list.List([]))
  let t522 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t545 = @list.List([
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
                                      @tactics.match_mp_tac(
                                        @prime.coprime_mul(),
                                      ),
                                      t522,
                                    ),
                                    t523,
                                  ),
                                  t524,
                                ),
                                t529,
                              ),
                              t530,
                            ),
                            @tactics.strip_tac,
                          ),
                          t531,
                        ),
                        t532,
                      ),
                      t533,
                    ),
                    t537,
                  ),
                  t538,
                ),
                t539,
              ),
              t540,
            ),
            t541,
          ),
          t542,
        ),
        t543,
      ),
      t544,
    ),
    @tactics.all_tac,
  ])
  let t561 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("coprime(((n : Num), (c : Num) * (n - MOD((y : Num), n))))"),
                    fn(
                      x519 : @kernel.Thm,
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
                      let s520 = @tactics.mp_tac(x519)
                      fn(
                        x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s520(x521)
                      }
                    },
                  ),
                  t545,
                ),
                t555,
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
    @tactics.all_tac,
  ])
  let t518 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t516 = @simp.asm_simp_tac(@list.List([@prime.coprime_0()]))
  let t515 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t517 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @int.arith_rule(@term_syntax.parse_term("!(0 < (n : Num)) == (n == 0)")),
          ]),
        ),
        t515,
      ),
      t516,
    ),
    @tactics.all_tac,
  ])
  let t514 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(!(a : Bool) → !(c : Bool)) && (b : Bool) && c && (d : Bool) → a && b && c && d"),
    ),
  )
  let t608 = @tactics.then_tac(
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
                                                      @tactics.exists_tac(
                                                        @term_syntax.parse_term("MOD((c : Num) * ((n : Num) - MOD((y : Num), n)), n)"),
                                                      ),
                                                      t514,
                                                    ),
                                                    @tactics.conj_tac,
                                                  ),
                                                  t517,
                                                ),
                                                t518,
                                              ),
                                              @tactics.conj_tac,
                                            ),
                                            t561,
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
                                @tactics.conj_tac,
                              ),
                              t574,
                            ),
                            t579,
                          ),
                          t580,
                        ),
                        t581,
                      ),
                      @tactics.conj_tac,
                    ),
                    t584,
                  ),
                  t585,
                ),
                t587,
              ),
              t588,
            ),
            t594,
          ),
          t604,
        ),
        t605,
      ),
      t606,
    ),
    t607,
  )
  let t513 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.mult_clauses(),
      @arith.mult_ac(),
    ]),
  )
  let t510 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("(a : Num) - (b : Num) == 1 → a == b + 1")),
  )
  let t512 = @tactics.first_assum(fn(
    x511 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x507 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s508 = @tactics.subst1_tac(x507)
      fn(
        x509 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s508(x509)
      }
    })(t510(x511))
  })
  let t506 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("((a : Num) * ((c : Num) * (x : Num)) == (b : Num)) == (c * (a * x) == b)"),
      ),
    ]),
  )
  let t505 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.mult_assoc())]),
  )
  let t504 = @tactics.exists_tac(@term_syntax.parse_term("(c : Num) * (y : Num)"))
  let t503 = @tactics.match_mp_tac(@arith.mod_uniq())
  let t502 = @tactics.conv_tac(@equal.sym_conv)
  let t501 = @simp.asm_simp_tac(@list.List([@arith.mod_mult_rmod()]))
  let t499 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_add(),
      @prime.divides_lmul(),
      @prime.divides_refl(),
    ]),
  )
  let t498 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t497 = @tactics.repeat_tac(@tactics.strip_tac)
  let t496 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t495 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.division()])),
    @tactics.all_tac,
  ])
  let t494 = @tactics.subgoal_then(
    @term_syntax.parse_term("(c : Num) * (x : Num) == DIV(c * x, (n : Num)) * n + MOD(c * x, n)"),
    fn(
      x485 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th_1 = x485
      @simp.gen_rewrite_tac(
        fn(
          x493 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x487 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s488 = @equal.land_conv(x487)
            fn(x489 : @kernel.Term) -> @kernel.Thm raise { s488(x489) }
          })(
            (fn(
              x490 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s491 = @equal.once_depth_conv(x490)
              fn(x492 : @kernel.Term) -> @kernel.Thm raise { s491(x492) }
            })(x493),
          )
        },
        @list.List([th_1]),
      )
    },
  )
  let t483 = @simp.simp_tac(
    @list.List([
      @prime.divides_sub(),
      @prime.divides_lmul(),
      @prime.divides_rmul(),
      @prime.divides_refl(),
    ]),
  )
  let t482 = @tactics.first_x_assum(fn(
    x481 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x478 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s479 = @tactics.subst1_tac(x478)
      fn(
        x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s479(x480)
      }
    })(@equal.sym(x481))
  })
  let t477 = @simp.rewrite_tac(
    @list.List([@int.coprime(), @equal.gsym(@int.divides_one())]),
  )
  let t476 = @simp.asm_rewrite_tac(@list.List([]))
  let t475 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t484 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(@prime.coprime_mul()), t475),
            t476,
          ),
          t477,
        ),
        t482,
      ),
      t483,
    ),
    @tactics.all_tac,
  ])
  let t500 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("coprime(((n : Num), (c : Num) * (x : Num)))"),
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
                      let s473 = @tactics.mp_tac(x472)
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
                        s473(x474)
                      }
                    },
                  ),
                  t484,
                ),
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
    @tactics.all_tac,
  ])
  let t471 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t469 = @simp.asm_simp_tac(@list.List([@prime.coprime_0()]))
  let t468 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t470 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(
          @list.List([
            @int.arith_rule(@term_syntax.parse_term("!(0 < (n : Num)) == (n == 0)")),
          ]),
        ),
        t468,
      ),
      t469,
    ),
    @tactics.all_tac,
  ])
  let t467 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(!(a : Bool) → !(c : Bool)) && (b : Bool) && c && (d : Bool) → a && b && c && d"),
    ),
  )
  let t609 = @list.List([
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
                                @tactics.exists_tac(
                                  @term_syntax.parse_term("MOD((c : Num) * (x : Num), (n : Num))"),
                                ),
                                t467,
                              ),
                              @tactics.conj_tac,
                            ),
                            t470,
                          ),
                          t471,
                        ),
                        @tactics.conj_tac,
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
        ),
        t512,
      ),
      t513,
    ),
    t608,
  ])
  let t466 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.coprime()])),
    @tactics.all_tac,
  ])
  let t465 = @tactics.subgoal_then(@term_syntax.parse_term("(d : Num) == 1"), fn(
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
    let s463 = @tactics.subst_all_tac(x462)
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
  })
  let t458 = @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(
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
    let s456 = @tactics.mp_tac(x455)
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
  let t459 = @tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(t458)
  let t460 = @tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(t459)
  let t461 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(t460),
  )
  let t453 = @term_syntax.parse_term("(n : Num)")
  let t454 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(a : Num)"), t453]),
      @prime.bezout(),
    ),
  )
  let t451 = @simp.asm_simp_tac(
    @list.List([
      @prime.divides_add(),
      @prime.divides_lmul(),
      @prime.divides_refl(),
    ]),
  )
  let t450 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t449 = @tactics.repeat_tac(@tactics.strip_tac)
  let t448 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t447 = @list.List([
    @simp.asm_simp_tac(@list.List([@arith.division()])),
    @tactics.all_tac,
  ])
  let t446 = @tactics.subgoal_then(
    @term_syntax.parse_term("(a : Num) * (b : Num) == DIV(a * b, (n : Num)) * n + MOD(a * b, n)"),
    fn(
      x437 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x437
      @simp.gen_rewrite_tac(
        fn(
          x445 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x439 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s440 = @equal.land_conv(x439)
            fn(x441 : @kernel.Term) -> @kernel.Thm raise { s440(x441) }
          })(
            (fn(
              x442 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s443 = @equal.once_depth_conv(x442)
              fn(x444 : @kernel.Term) -> @kernel.Thm raise { s443(x444) }
            })(x445),
          )
        },
        @list.List([th]),
      )
    },
  )
  let t435 = @simp.asm_rewrite_tac(@list.List([]))
  let t434 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t436 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@prime.coprime_mul()), t434),
      t435,
    ),
    @tactics.all_tac,
  ])
  let t433 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((n : Num), (a : Num) * (b : Num)))"), fn(
    x430 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s431 = @tactics.mp_tac(x430)
    fn(
      x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s431(x432)
    }
  })
  let t429 = @simp.asm_simp_tac(@list.List([@prime.coprime_0()]))
  let t428 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t427 = @simp.simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!(0 < (n : Num)) == (n == 0)"))]),
  )
  let t426 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(b : Bool) && (!(a : Bool) → !b) → a && b")),
  )
  let t425 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t424 = @tactics.disch_then(fn(
    x421 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s422 = @tactics.subst1_tac(x421)
    fn(
      x423 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s422(x423)
    }
  })
  let t420 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x414 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s415 = @tactics.assume_tac(x414)
          fn(
            x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s415(x416)
          }
        },
        fn(
          x417 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s418 = @tactics.mp_tac(x417)
          fn(
            x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s418(x419)
          }
        },
      ),
    ),
  )
  let t452 = @list.List([
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
                                  @tactics.disch_then(
                                    @tactics.x_choose_then(
                                      @term_syntax.parse_term("(b : Num)"),
                                    )(fn(
                                      x411 : @kernel.Thm,
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
                                      let s412 = @tactics.mp_tac(x411)
                                      fn(
                                        x413 : (
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
                                        s412(x413)
                                      }
                                    }),
                                  ),
                                  t420,
                                ),
                                t424,
                              ),
                              t425,
                            ),
                            t426,
                          ),
                          t427,
                        ),
                        t428,
                      ),
                      t429,
                    ),
                    t433,
                  ),
                  t436,
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
    @tactics.all_tac,
  ])
  let t410 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Num)"))
  let t610 = @list.List([
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
                        @simp.rewrite_tac(
                          @list.List([@sets.extension(), @sets.in_elim_thm()]),
                        ),
                        t410,
                      ),
                      @tactics.eq_tac,
                    ),
                    t452,
                  ),
                  @tactics.strip_tac,
                ),
                t454,
              ),
              t461,
            ),
            t465,
          ),
          t466,
        ),
        @tactics.strip_tac,
      ),
      t609,
    ),
    @tactics.all_tac,
  ])
  let t409 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(c : Num) | ∃ b : Num, 0 < b && b < (n : Num) && coprime((b, n)) && c == MOD((a : Num) * b, n)} == {(b : Num) | 0 < b && b < n && coprime((b, n))}"),
    fn(
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
      let s407 = @tactics.mp_tac(x406)
      fn(
        x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s407(x408)
      }
    },
  )
  let t405 = @simp.asm_rewrite_tac(@list.List([cong_mod_1()]))
  let t404 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t403 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t402 = @simp.asm_simp_tac(
    @list.List([@prime.coprime_0(), phi_0(), cong_mod_0()]),
  )
  let t401 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t689 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
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
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.then_tac(
                                                        @tactics.repeat_tac(
                                                          @tactics.gen_tac,
                                                        ),
                                                        t401,
                                                      ),
                                                      t402,
                                                    ),
                                                    t403,
                                                  ),
                                                  t404,
                                                ),
                                                t405,
                                              ),
                                              @tactics.disch_tac,
                                            ),
                                            t409,
                                          ),
                                          t610,
                                        ),
                                        t614,
                                      ),
                                      t615,
                                    ),
                                    t622,
                                  ),
                                  t631,
                                ),
                                t635,
                              ),
                              t640,
                            ),
                            t641,
                          ),
                          t642,
                        ),
                        t649,
                      ),
                      t658,
                    ),
                    t659,
                  ),
                  t660,
                ),
                t672,
              ),
              t684,
            ),
            @tactics.disch_tac,
          ),
          t685,
        ),
        t686,
      ),
      t687,
    ),
    t688,
  )
  fermat_little_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, coprime((a, n)) → op_eq_eq(EXP(a, phi(n)), 1, mod(n))"),
      t689,
    ),
  )
}

///|
let fermat_little_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FERMAT_LITTLE")

///|
/// `FERMAT_LITTLE`
pub fn fermat_little() -> @kernel.Thm {
  fermat_little_c.get()
}

///|
/// FERMAT_LITTLE_PRIME
fn step_33() -> Unit raise {
  let t739 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → SUC(p - 1) == p")),
      @prime.prime_0(),
    ]),
  )
  let t738 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t737 = @simp.gen_rewrite_tac(
    fn(
      x736 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x730 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s731 = @equal.land_conv(x730)
        fn(x732 : @kernel.Term) -> @kernel.Thm raise { s731(x732) }
      })(
        (fn(
          x733 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s734 = @equal.once_depth_conv(x733)
          fn(x735 : @kernel.Term) -> @kernel.Thm raise { s734(x735) }
        })(x736),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t729 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @equal.gsym(@bool.conjunct2(@arith.exp())),
    ]),
  )
  let t725 = @term_syntax.parse_term("op_star((a : Num))")
  let t728 = @tactics.disch_then(fn(
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
      x722 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s723 = @tactics.mp_tac(x722)
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
    })(((x726 : @kernel.Thm) => @equal.ap_term(t725, x726))(x727))
  })
  let t720 = @tactics.x_choose_then(@term_syntax.parse_term("(q2 : Num)"))(fn(
    x717 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s718 = @tactics.mp_tac(x717)
    fn(
      x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s718(x719)
    }
  })
  let t721 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(t720),
  )
  let t716 = @simp.rewrite_tac(@list.List([@int.cong(), nat_mod()]))
  let t715 = @simp.asm_simp_tac(
    @list.List([@bool.eq_imp_rule(@bool.spec_all(phi_prime_eq())).1]),
  )
  let t712 = @drule.match_mp(fermat_little())
  let t714 = @tactics.first_assum(fn(
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
    (fn(
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
      let s710 = @tactics.mp_tac(x709)
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
    })(t712(x713))
  })
  let t706 = @meson.asm_meson_tac(
    @list.List([@prime.divides_exp(), @prime.divides_exp2(), @prime.prime_0()]),
  )
  let t705 = @simp.asm_rewrite_tac(@list.List([cong_0()]))
  let t704 = @simp.gen_rewrite_tac(
    fn(
      x701 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s702 = @equal.rand_conv(x701)
      fn(x703 : @kernel.Term) -> @kernel.Thm raise { s702(x703) }
    },
    @list.List([cong_sym()]),
  )
  let t700 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t707 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(cong_trans()), t700),
        t704,
      ),
      t705,
    ),
    t706,
  )
  let t708 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@arith.exp_one(), cong_refl()])),
    t707,
    @tactics.all_tac,
  ])
  let t699 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t696 = @drule.match_mp(@prime.prime_coprime())
  let t693 = @term_syntax.parse_term("(a : Num)")
  let t698 = @tactics.first_assum(fn(
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
    (fn(
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
        x690 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s691 = @tactics.mp_tac(x690)
        fn(
          x692 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s691(x692)
        }
      })(((x694 : @kernel.Thm) => @bool.spec(t693, x694))(x695))
    })(t696(x697))
  })
  let t740 = @tactics.then_tac(
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
                            t698,
                          ),
                          t699,
                        ),
                        @tactics.strip_tac,
                      ),
                      t708,
                    ),
                    t714,
                  ),
                  t715,
                ),
                t716,
              ),
              t721,
            ),
            t728,
          ),
          t729,
        ),
        t737,
      ),
      t738,
    ),
    t739,
  )
  fermat_little_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, prime(p) → op_eq_eq(EXP(a, p), a, mod(p))"),
      t740,
    ),
  )
}

///|
let fermat_little_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FERMAT_LITTLE_PRIME",
)

///|
/// `FERMAT_LITTLE_PRIME`
pub fn fermat_little_prime() -> @kernel.Thm {
  fermat_little_prime_c.get()
}

///|
/// LUCAS_COPRIME_LEMMA
fn step_34() -> Unit raise {
  let t778 = @simp.asm_simp_tac(
    @list.List([@arith.exp(), @prime.divides_rmul()]),
  )
  let t779 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 0)")),
      @int.arith_tac,
    ),
    t778,
  ])
  let t777 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) == SUC(m - 1)"), fn(
    x774 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s775 = @tactics.subst1_tac(x774)
    fn(
      x776 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s775(x776)
    }
  })
  let t773 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@arith.division()), @prime.divides_lmul()]),
  )
  let t772 = @tactics.exists_tac(@term_syntax.parse_term("DIV(EXP((a : Num), (m : Num)), (n : Num)) * n"))
  let t771 = @tactics.match_mp_tac(@prime.divides_add_revr())
  let t770 = @list.List([
    @tactics.all_tac,
    @simp.asm_simp_tac(@list.List([@int.divides_one()])),
  ])
  let t769 = @tactics.subgoal_then(
    @term_syntax.parse_term("divides((d : Num), MOD(EXP((a : Num), (m : Num)), (n : Num)))"),
    fn(
      x766 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s767 = @tactics.mp_tac(x766)
      fn(
        x768 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s767(x768)
      }
    },
  )
  let t763 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t764 = @tactics.map_every(
    fn(
      x760 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s761 = @tactics.undisch_tac(x760)
      fn(
        x762 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s761(x762)
      }
    },
    @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t763]),
  )
  let t759 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t758 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t765 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t758),
          t759,
        ),
        t764,
      ),
      @int.arith_tac,
    ),
    @tactics.all_tac,
  ])
  let t757 = @tactics.subgoal_then(@term_syntax.parse_term("MOD(1, (n : Num)) == 1"), fn(
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
    let s755 = @tactics.subst1_tac(x754)
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
  })
  let t753 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t752 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t751 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t750 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t749 = @tactics.repeat_tac(@tactics.strip_tac)
  let t748 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_1()]))
  let t747 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t745 = @simp.simp_tac(@list.List([@prime.coprime_1()]))
  let t744 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t743 = @simp.asm_rewrite_tac(@list.List([]))
  let t742 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t746 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.asm_rewrite_tac(@list.List([cong_mod_0(), @arith.exp_eq_1()])),
            t742,
          ),
          t743,
        ),
        t744,
      ),
      t745,
    ),
    @tactics.all_tac,
  ])
  let t741 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t780 = @tactics.thenl(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.thenl(
                                        @tactics.then_tac(
                                          @tactics.repeat_tac(@tactics.gen_tac),
                                          t741,
                                        ),
                                        t746,
                                      ),
                                      t747,
                                    ),
                                    t748,
                                  ),
                                  t749,
                                ),
                                t750,
                              ),
                              t751,
                            ),
                            @tactics.strip_tac,
                          ),
                          t752,
                        ),
                        t753,
                      ),
                      t757,
                    ),
                    t765,
                  ),
                  @tactics.disch_tac,
                ),
                t769,
              ),
              t770,
            ),
            t771,
          ),
          t772,
        ),
        t773,
      ),
      t777,
    ),
    t779,
  )
  lucas_coprime_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Num, !(m == 0) && op_eq_eq(EXP(a, m), 1, mod(n)) → coprime((a, n))"),
      t780,
    ),
  )
}

///|
let lucas_coprime_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LUCAS_COPRIME_LEMMA",
)

///|
/// `LUCAS_COPRIME_LEMMA`
pub fn lucas_coprime_lemma() -> @kernel.Thm {
  lucas_coprime_lemma_c.get()
}

///|
/// LUCAS_WEAK
fn step_35() -> Unit raise {
  let t799 = @simp.asm_simp_tac(
    @list.List([
      phi_lowerbound_1(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → 0 < n")),
    ]),
  )
  let t798 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) → !(a && (b : Bool)) → !b")),
  )
  let t797 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t795 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n - 1 == 0)"))]),
  )
  let t794 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - 1"))
  let t796 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(lucas_coprime_lemma()), t794),
      t795,
    ),
    @tactics.all_tac,
  ])
  let t793 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((a : Num), (n : Num)))"), fn(
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
    @simp.simp_tac(@list.List([fermat_little(), th]))
  })
  let t787 = @term_syntax.parse_term("phi((n : Num))")
  let t790 = @tactics.first_x_assum(fn(
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
    })(((x788 : @kernel.Thm) => @bool.spec(t787, x788))(x789))
  })
  let t781 = @int.arith_rule(
    @term_syntax.parse_term("2 <= (n : Num) → !(n == 0) && !(n == 1)"),
  )
  let t782 = @equal.gsym(@arith.le_antisym())
  let t783 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(phi_prime_eq()), phi_limit_strong(), t782, t781]),
  )
  let t800 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t783),
              t790,
            ),
            t793,
          ),
          t796,
        ),
        t797,
      ),
      t798,
    ),
    t799,
  )
  lucas_weak_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, 2 <= n && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ m : Num, 0 < m && m < n - 1 → !op_eq_eq(EXP(a, m), 1, mod(n))) → prime(n)"),
      t800,
    ),
  )
}

///|
let lucas_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LUCAS_WEAK")

///|
/// `LUCAS_WEAK`
pub fn lucas_weak() -> @kernel.Thm {
  lucas_weak_c.get()
}

///|
/// LUCAS
fn step_36() -> Unit raise {
  let t936 = @simp.rewrite_tac(@list.List([@arith.exp_exp(), @arith.exp_one()]))
  let t935 = @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()]))
  let t931 = @term_syntax.parse_term("MOD")
  let t928 = @term_syntax.parse_term("(n : Num)")
  let t934 = @tactics.disch_then(fn(
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
    (fn(
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
      (fn(
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
        let s924 = @tactics.mp_tac(x923)
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
      })(
        (fn(x929 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x926 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x927 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x926, x927)
            }
          })(x929)(t928)
        })(x930),
      )
    })(((x932 : @kernel.Thm) => @equal.ap_term(t931, x932))(x933))
  })
  let t919 = @term_syntax.parse_term("EXP")
  let t916 = @term_syntax.parse_term("DIV((r : Num), (p : Num))")
  let t922 = @tactics.disch_then(fn(
    x921 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x918 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x911 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s912 = @tactics.mp_tac(x911)
        fn(
          x913 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s912(x913)
        }
      })(
        (fn(x917 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x914 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x915 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x914, x915)
            }
          })(x917)(t916)
        })(x918),
      )
    })(((x920 : @kernel.Thm) => @equal.ap_term(t919, x920))(x921))
  })
  let t910 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t909 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t907 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t906 = @simp.asm_simp_tac(@list.List([@arith.div_mult()]))
  let t905 = @simp.asm_rewrite_tac(@list.List([]))
  let t904 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t903 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (r : Num))"))
  let t902 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @equal.gsym(@arith.mult_assoc())]),
  )
  let t901 = @simp.asm_simp_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → 0 < p"))]),
  )
  let t900 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t899 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t898 = @tactics.undisch_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t897 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t908 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.match_mp_tac(@arith.div_uniq()),
                                t897,
                              ),
                              t898,
                            ),
                            t899,
                          ),
                          t900,
                        ),
                        t901,
                      ),
                      @tactics.disch_tac,
                    ),
                    t902,
                  ),
                  @tactics.ap_term_tac,
                ),
                t903,
              ),
              t904,
            ),
            @tactics.strip_tac,
          ),
          t905,
        ),
        t906,
      ),
      t907,
    ),
    @tactics.all_tac,
  ])
  let t896 = @tactics.subgoal_then(
    @term_syntax.parse_term("DIV((m : Num) * (r : Num), (p : Num)) == m * DIV(r, p)"),
    fn(
      x893 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s894 = @tactics.subst1_tac(x893)
      fn(
        x895 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s894(x895)
      }
    },
  )
  let t892 = @simp.asm_simp_tac(@list.List([@prime.divides_lmul()]))
  let t888 = @term_syntax.parse_term("(p : Num)")
  let t891 = @tactics.disch_then(fn(
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
    (fn(
      x885 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s886 = @tactics.mp_tac(x885)
      fn(
        x887 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s886(x887)
      }
    })(((x889 : @kernel.Thm) => @bool.spec(t888, x889))(x890))
  })
  let t884 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ p : Num, prime(p) && divides(p, (m : Num) * (r : Num)) → !op_eq_eq(EXP((a : Num), DIV(m * r, p)), 1, mod((n : Num)))"),
  )
  let t883 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(
      x880 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s881 = @tactics.mp_tac(x880)
      fn(
        x882 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s881(x882)
      }
    }),
  )
  let t877 = @drule.match_mp(@prime.prime_factor())
  let t879 = @tactics.disch_then(fn(
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
      let s875 = @tactics.mp_tac(x874)
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
  let t872 = @simp.simp_tac(
    @list.List([@arith.mult_clauses(), @arith.lt_refl()]),
  )
  let t871 = @tactics.conv_tac(@class.contrapos_conv)
  let t873 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) < m * (r : Num)")),
        t871,
      ),
      t872,
    ),
    @tactics.all_tac,
  ])
  let t870 = @tactics.subgoal_then(@term_syntax.parse_term("!((r : Num) == 1)"), fn(
    x867 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s868 = @tactics.mp_tac(x867)
    fn(
      x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s868(x869)
    }
  })
  let t866 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(
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
      let s864 = @tactics.subst_all_tac(x863)
      fn(
        x865 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s864(x865)
      }
    }),
  )
  let t862 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t860 = @simp.rewrite_tac(@list.List([@arith.exp_one()]))
  let t859 = @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()]))
  let t858 = @simp.asm_rewrite_tac(@list.List([]))
  let t857 = @list.List([
    @tactics.all_tac,
    @simp.asm_simp_tac(@list.List([@arith.mod_exp_mod()])),
  ])
  let t856 = @tactics.exists_tac(
    @term_syntax.parse_term("MOD(EXP(MOD(EXP((a : Num), (m : Num)), (n : Num)), DIV(n - 1, m)), n)"),
  )
  let t855 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t854 = @tactics.repeat_tac(@tactics.disch_tac)
  let t853 = @simp.asm_simp_tac(@list.List([@int.cong_v1()]))
  let t852 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"))
  let t851 = @tactics.undisch_tac(
    @term_syntax.parse_term("op_eq_eq(EXP((a : Num), (n : Num) - 1), 1, mod(n))"),
  )
  let t850 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t849 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t848 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t847 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.division())]))
  let t846 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t844 = @simp.asm_simp_tac(@list.List([]))
  let t843 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t842 = @tactics.match_mp_tac(lucas_coprime_lemma())
  let t841 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t840 = @tactics.match_mp_tac(@prime.coprime_exp())
  let t845 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])),
              t840,
            ),
            t841,
          ),
          t842,
        ),
        t843,
      ),
      t844,
    ),
    @tactics.all_tac,
  ])
  let t839 = @tactics.exists_tac(
    @term_syntax.parse_term("EXP((a : Num), DIV((n : Num) - 1, (m : Num)) * m)"),
  )
  let t838 = @tactics.match_mp_tac(cong_mult_lcancel())
  let t836 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t835 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t837 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@arith.lt_trans()), t835),
      t836,
    ),
    @tactics.all_tac,
  ])
  let t834 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t830 = @term_syntax.parse_term("MOD((n : Num) - 1, (m : Num))")
  let t833 = @tactics.first_x_assum(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x831 : @kernel.Thm) => @bool.spec(t830, x831))(x832))
  })
  let t826 = @tactics.match_mp_tac(
    @int.arith_rule(@term_syntax.parse_term("!(0 < (n : Num)) → n == 0")),
  )
  let t825 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.mod_eq_0())]))
  let t824 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t861 = @list.List([
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
                                                            @simp.rewrite_tac(
                                                              @list.List([
                                                                @int.divides(),
                                                              ]),
                                                            ),
                                                            t824,
                                                          ),
                                                          t825,
                                                        ),
                                                        t826,
                                                      ),
                                                      @tactics.disch_tac,
                                                    ),
                                                    t833,
                                                  ),
                                                  t834,
                                                ),
                                                @tactics.conj_tac,
                                              ),
                                              t837,
                                            ),
                                            t838,
                                          ),
                                          t839,
                                        ),
                                        @tactics.conj_tac,
                                      ),
                                      t845,
                                    ),
                                    t846,
                                  ),
                                  t847,
                                ),
                                t848,
                              ),
                              t849,
                            ),
                            t850,
                          ),
                          t851,
                        ),
                        t852,
                      ),
                      t853,
                    ),
                    t854,
                  ),
                  t855,
                ),
                t856,
              ),
              @tactics.conj_tac,
            ),
            t857,
          ),
          t858,
        ),
        t859,
      ),
      t860,
    ),
    @tactics.all_tac,
  ])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("divides((m : Num), (n : Num) - 1)"), fn(
    x820 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s821 = @tactics.mp_tac(x820)
    fn(
      x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s821(x822)
    }
  })
  let t817 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) → !(n == 0)")),
  )
  let t819 = @tactics.first_assum(fn(
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
    (fn(
      x814 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s815 = @tactics.assume_tac(x814)
      fn(
        x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s815(x816)
      }
    })(t817(x818))
  })
  let t813 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t812 = @simp.once_rewrite_tac(@list.List([@arith.num_wop()]))
  let t810 = @equal.gsym(@class.not_exists_thm())
  let t811 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == !(a && b)")),
      t810,
    ]),
  )
  let t809 = @simp.asm_rewrite_tac(@list.List([]))
  let t808 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t807 = @tactics.match_mp_tac(lucas_weak())
  let t804 = @drule.match_mp(
    @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")),
  )
  let t806 = @tactics.first_assum(fn(
    x805 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x801 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s802 = @tactics.assume_tac(x801)
      fn(
        x803 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s802(x803)
      }
    })(t804(x805))
  })
  let t937 = @tactics.then_tac(
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
                                                        @tactics.then_tac(
                                                          @tactics.repeat_tac(
                                                            @tactics.strip_tac,
                                                          ),
                                                          t806,
                                                        ),
                                                        t807,
                                                      ),
                                                      t808,
                                                    ),
                                                    t809,
                                                  ),
                                                  t811,
                                                ),
                                                t812,
                                              ),
                                              t813,
                                            ),
                                            t819,
                                          ),
                                          t823,
                                        ),
                                        t861,
                                      ),
                                      t862,
                                    ),
                                    t866,
                                  ),
                                  t870,
                                ),
                                t873,
                              ),
                              t879,
                            ),
                            t883,
                          ),
                          @tactics.strip_tac,
                        ),
                        t884,
                      ),
                      t891,
                    ),
                    t892,
                  ),
                  t896,
                ),
                t908,
              ),
              t909,
            ),
            t910,
          ),
          t922,
        ),
        t934,
      ),
      t935,
    ),
    t936,
  )
  lucas_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, 2 <= n && op_eq_eq(EXP(a, n - 1), 1, mod(n)) && (∀ p : Num, prime(p) && divides(p, n - 1) → !op_eq_eq(EXP(a, DIV(n - 1, p)), 1, mod(n))) → prime(n)"),
      t937,
    ),
  )
}

///|
let lucas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LUCAS")

///|
/// `LUCAS`
pub fn lucas() -> @kernel.Thm {
  lucas_c.get()
}

///|
/// primefact
fn step_37() -> Unit raise {
  primefact_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(primefact : (List[Num], Num) -> Bool)((ps : List[Num]), (n : Num)) == (ITLIST(op_star, ps, 1) == n && (∀ p : Num, MEM(p, ps) → prime(p)))"),
    ),
  )
}

///|
let primefact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("primefact")

///|
/// `primefact`
pub fn primefact() -> @kernel.Thm {
  primefact_c.get()
}

///|
/// PRIMEFACT
fn step_38() -> Unit raise {
  let t984 = @meson.asm_meson_tac(@list.List([]))
  let t983 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.itlist()]))
  let t982 = @tactics.exists_tac(@term_syntax.parse_term("CONS((p : Num), (ps : List[Num]))"))
  let t981 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(ps : List[Num])"))(fn(
      x978 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s979 = @tactics.assume_tac(x978)
      fn(
        x980 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s979(x980)
      }
    }),
  )
  let t977 = @simp.rewrite_tac(@list.List([primefact()]))
  let t975 = @simp.asm_rewrite_tac(
    @list.List([@prime.prime_0(), @prime.prime_1()]),
  )
  let t974 = @tactics.undisch_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t973 = @tactics.repeat_tac(@tactics.strip_tac)
  let t976 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.match_mp_tac(
            @int.arith_rule(
              @term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) → 1 < p"),
            ),
          ),
          t973,
        ),
        t974,
      ),
      t975,
    ),
    @tactics.all_tac,
  ])
  let t972 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (p : Num)"), fn(
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
    let th = x970
    @simp.rewrite_tac(@list.List([th]))
  })
  let t969 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t968 = @simp.gen_rewrite_tac(
    (x967 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        3,
        fn(
          x964 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s965 = @equal.land_conv(x964)
          fn(x966 : @kernel.Term) -> @kernel.Thm raise { s965(x966) }
        },
        x967,
      )
    },
    @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]),
  )
  let t963 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t962 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t961 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) * (m : Num) == 0)"))
  let t957 = @term_syntax.parse_term("(m : Num)")
  let t960 = @tactics.first_x_assum(fn(
    x959 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s955 = @tactics.mp_tac(x954)
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
    })(((x958 : @kernel.Thm) => @bool.spec(t957, x958))(x959))
  })
  let t953 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
      x950 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s951 = @tactics.subst_all_tac(x950)
      fn(
        x952 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s951(x952)
      }
    }),
  )
  let t949 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t948 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t944 = @drule.match_mp(@prime.prime_factor())
  let t945 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(
    @tactics.strip_assume_tac,
  )
  let t947 = @tactics.first_assum(fn(
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
    t945(t944(x946))
  })
  let t942 = @simp.rewrite_tac(
    @list.List([primefact(), @lists.itlist(), @lists.mem()]),
  )
  let t941 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Num])"))
  let t943 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t941),
      t942,
    ),
    @tactics.all_tac,
  ])
  let t940 = @simp.asm_rewrite_tac(@list.List([]))
  let t939 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t938 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t985 = @tactics.then_tac(
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
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.match_mp_tac(
                                                    @arith.num_wf(),
                                                  ),
                                                  t938,
                                                ),
                                                t939,
                                              ),
                                              t940,
                                            ),
                                            t943,
                                          ),
                                          @tactics.disch_tac,
                                        ),
                                        @tactics.disch_tac,
                                      ),
                                      t947,
                                    ),
                                    t948,
                                  ),
                                  t949,
                                ),
                                t953,
                              ),
                              t960,
                            ),
                            t961,
                          ),
                          t962,
                        ),
                        t963,
                      ),
                      @tactics.disch_tac,
                    ),
                    t968,
                  ),
                  t969,
                ),
                t972,
              ),
              t976,
            ),
            t977,
          ),
          t981,
        ),
        t982,
      ),
      t983,
    ),
    t984,
  )
  primefact_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(n == 0) → (∃ ps : List[Num], primefact(ps, n))"),
      t985,
    ),
  )
}

///|
let primefact_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMEFACT")

///|
/// `PRIMEFACT`
pub fn primefact_v1() -> @kernel.Thm {
  primefact_v1_c.get()
}

///|
/// PRIMAFACT_CONTAINS
fn step_39() -> Unit raise {
  let t1010 = @meson.asm_meson_tac(@list.List([@int.prime(), @prime.prime_1()]))
  let t1007 = @drule.match_mp(@prime.prime_divprod())
  let t1009 = @tactics.disch_then(fn(
    x1008 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.disj_cases_tac(t1007(x1008))
  })
  let t1006 = @tactics.disch_then(fn(
    x1003 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1003
    let t1005 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(@bool.conjunct1(th)), t1005)
  })
  let t1002 = @list.List([
    @meson.asm_meson_tac(@list.List([@int.divides_one(), @prime.prime_1()])),
    @tactics.all_tac,
  ])
  let t1001 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem()]))
  let t999 = @term_syntax.parse_term("(ps : List[Num])")
  let t1000 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t999)
  let t998 = @tactics.pop_assum(fn(
    x997 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x994 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s995 = @tactics.subst1_tac(x994)
      fn(
        x996 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s995(x996)
      }
    })(@equal.sym(x997))
  })
  let t993 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
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
        let s988 = @tactics.assume_tac(x987)
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
      },
      fn(
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
        let s991 = @tactics.mp_tac(x990)
        fn(
          x992 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s991(x992)
        }
      },
    ),
  )
  let t986 = @simp.rewrite_tac(@list.List([primefact()]))
  let t1011 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t986,
                        ),
                        t993,
                      ),
                      t998,
                    ),
                    t1000,
                  ),
                  @lists.list_induct_tac,
                ),
                t1001,
              ),
              t1002,
            ),
            @tactics.strip_tac,
          ),
          @tactics.gen_tac,
        ),
        t1006,
      ),
      t1009,
    ),
    t1010,
  )
  primafact_contains_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ ps : List[Num], ∀ n : Num, primefact(ps, n) → (∀ p : Num, prime(p) && divides(p, n) → MEM(p, ps))"),
      t1011,
    ),
  )
}

///|
let primafact_contains_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMAFACT_CONTAINS",
)

///|
/// `PRIMAFACT_CONTAINS`
pub fn primafact_contains() -> @kernel.Thm {
  primafact_contains_c.get()
}

///|
/// PRIMEFACT_VARIANT
fn step_40() -> Unit raise {
  let t1016 = @meson.asm_meson_tac(@list.List([]))
  let t1015 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.all()]))
  let t1013 = @term_syntax.parse_term("(ps : List[Num])")
  let t1014 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t1013)
  let t1012 = @simp.rewrite_tac(@list.List([primefact()]))
  let t1017 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1012),
            @tactics.ap_term_tac,
          ),
          t1014,
        ),
        @lists.list_induct_tac,
      ),
      t1015,
    ),
    t1016,
  )
  primefact_variant_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ ps : List[Num], ∀ n : Num, primefact(ps, n) == (ITLIST(op_star, ps, 1) == n && ALL(prime, ps))"),
      t1017,
    ),
  )
}

///|
let primefact_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIMEFACT_VARIANT",
)

///|
/// `PRIMEFACT_VARIANT`
pub fn primefact_variant() -> @kernel.Thm {
  primefact_variant_c.get()
}

///|
/// LUCAS_PRIMEFACT
fn step_41() -> Unit raise {
  let t1044 = @meson.asm_meson_tac(@list.List([]))
  let t1043 = @simp.simp_tac(@list.List([@lists.all(), @lists.mem()]))
  let t1041 = @term_syntax.parse_term("(ps : List[Num])")
  let t1042 = @tactics.spec_tac(@term_syntax.parse_term("(ps : List[Num])"), t1041)
  let t1040 = @tactics.undisch_tac(
    @term_syntax.parse_term("ALL((p : Num) => prime(p) && !op_eq_eq(EXP((a : Num), DIV((n : Num) - 1, p)), 1, mod(n)), (ps : List[Num]))"),
  )
  let t1039 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x1036 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1037 = @tactics.mp_tac(x1036)
      fn(
        x1038 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1037(x1038)
      }
    }),
  )
  let t1035 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1032 = @drule.match_mp(primafact_contains())
  let t1034 = @tactics.disch_then(fn(
    x1033 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1029 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1030 = @tactics.assume_tac(x1029)
      fn(
        x1031 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1030(x1031)
      }
    })(t1032(x1033))
  })
  let t1027 = @simp.asm_simp_tac(@list.List([]))
  let t1026 = @tactics.exists_tac(
    @term_syntax.parse_term("(p : Num) => prime(p) && !op_eq_eq(EXP((a : Num), DIV((n : Num) - 1, p)), 1, mod(n))"),
  )
  let t1025 = @tactics.match_mp_tac(@lists.all_imp())
  let t1028 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([primefact_variant()])),
          t1025,
        ),
        t1026,
      ),
      t1027,
    ),
    @tactics.all_tac,
  ])
  let t1024 = @tactics.subgoal_then(
    @term_syntax.parse_term("primefact((ps : List[Num]), (n : Num) - 1)"),
    fn(
      x1021 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1022 = @tactics.mp_tac(x1021)
      fn(
        x1023 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1022(x1023)
      }
    },
  )
  let t1020 = @simp.asm_rewrite_tac(@list.List([]))
  let t1019 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t1018 = @tactics.match_mp_tac(lucas())
  let t1045 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t1018,
                          ),
                          t1019,
                        ),
                        t1020,
                      ),
                      t1024,
                    ),
                    t1028,
                  ),
                  t1034,
                ),
                t1035,
              ),
              t1039,
            ),
            t1040,
          ),
          t1042,
        ),
        @lists.list_induct_tac,
      ),
      t1043,
    ),
    t1044,
  )
  lucas_primefact_c.set(
    @tactics.prove(
      @term_syntax.parse_term("2 <= (n : Num) && op_eq_eq(EXP((a : Num), n - 1), 1, mod(n)) && ITLIST(op_star, (ps : List[Num]), 1) == n - 1 && ALL((p : Num) => prime(p) && !op_eq_eq(EXP(a, DIV(n - 1, p)), 1, mod(n)), ps) → prime(n)"),
      t1045,
    ),
  )
}

///|
let lucas_primefact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LUCAS_PRIMEFACT",
)

///|
/// `LUCAS_PRIMEFACT`
pub fn lucas_primefact() -> @kernel.Thm {
  lucas_primefact_c.get()
}

///|
/// `even_num`
pub fn even_num(x1046 : @num.Num) -> Bool raise {
  let n = x1046
  @num.eq_num(@num.mod_num(n, num_2()), num_0())
}

///|
/// odd_num
fn step_42() -> Unit raise {
  odd_num_c.set(fn(x1048 : @num.Num) -> Bool raise {
    (fn(x1047 : Bool) -> Bool raise { !x1047 })(even_num(x1048))
  })
}

///|
let odd_num_c : @lib.Cell[(@num.Num) -> Bool raise] = @lib.Cell::new("odd_num")

///|
/// `odd_num`
pub fn odd_num(x : @num.Num) -> Bool raise {
  odd_num_c.get()(x)
}

///|
/// log2
fn step_43() -> Unit raise {
  fn log2_1(x1049 : @num.Num, x1050 : @num.Num) -> @num.Num raise {
    let x = x1049
    let y = x1050
    if @num.lt_num(x, num_1()) {
      y
    } else {
      let t1051 = @num.add_num(y, num_1())
      log2_1(@num.quo_num(x, num_2()), t1051)
    }
  }
  log2_c.set(fn(x1052 : @num.Num) -> @num.Num raise {
    let x_1 = x1052
    log2_1(@num.sub_num(x_1, num_1()), num_0())
  })
}

///|
let log2_c : @lib.Cell[(@num.Num) -> @num.Num raise] = @lib.Cell::new("log2")

///|
/// `log2`
pub fn log2(x : @num.Num) -> @num.Num raise {
  log2_c.get()(x)
}

///|
/// `powermod`
pub fn powermod(
  x1053 : @num.Num,
  x1054 : @num.Num,
  x1055 : @num.Num,
) -> @num.Num raise {
  let x = x1053
  let m = x1054
  let n = x1055
  if @num.eq_num(m, num_0()) {
    num_1()
  } else {
    let y = powermod(x, @num.quo_num(m, num_2()), n)
    let z = @num.mod_num(@num.mult_num(y, y), n)
    if even_num(m) {
      z
    } else {
      @num.mod_num(@num.mult_num(x, z), n)
    }
  }
}

///|
/// factor
fn step_44() -> Unit raise {
  let suck_file : (String) -> String raise = fn(
    x1056 : String,
  ) -> String raise {
    let s = x1056
    let data = @lib.string_of_file(s)
    @lib.sys_remove(s)
    data
  }
  let extract_output : (String) -> @list.List[(@num.Num, @num.Num)] raise = fn(
    x1057 : String,
  ) -> @list.List[(@num.Num, @num.Num)] raise {
    let s_1 = x1057
    let l0 = @lib.explode(s_1)
    let l0_p = @lib.rev(l0)
    let l1 = @lib.chop_list(@lib.index("]", l0_p), l0_p).1
    let l2 = @lib.rev(@lib.chop_list(@lib.index("[", l1), l1).0).prepend("[")
    // GP prints the factorisation as a matrix `[p1, e1; p2, e2; ...]`: read
    // the numbers off in order and pair them up.
    let nums : Array[@num.Num] = []
    let mut digits = ""
    for c in @lib.implode(l2) {
      if c >= '0' && c <= '9' {
        digits = digits + c.to_string()
      } else if digits != "" {
        nums.push(@num.num_of_string(digits))
        digits = ""
      }
    }
    @list.List(Array::makei(nums.length() / 2, i => (nums[2 * i], nums[2 * i + 1])))
  }
  factor_c.set(fn(x1061 : @num.Num) -> @list.List[(@num.Num, @num.Num)] raise {
    let n = x1061
    if @num.eq_num(n, num_1()) {
      @list.List([])
    } else {
      let filename = @lib.temp_file("pocklington", ".out")
      let t1062 = "))  \n quit' | gp >" + (filename + " 2>/dev/null")
      let s_2 = "echo 'print(factorint(" + (@num.string_of_num(n) + t1062)
      if Int::to_int64(@lib.sys_command(s_2)) == 0L {
        let output = suck_file(filename)
        extract_output(output)
      } else {
        raise Failure("factor: Call to GP/PARI failed")
      }
    }
  })
}

///|
let factor_c : @lib.Cell[(@num.Num) -> @list.List[(@num.Num, @num.Num)] raise] = @lib.Cell::new(
  "factor",
)

///|
/// `factor`
pub fn factor(x : @num.Num) -> @list.List[(@num.Num, @num.Num)] raise {
  factor_c.get()(x)
}

///|
/// multifactor
fn step_45() -> Unit raise {
  multifactor_c.set(fn(x1065 : @num.Num) -> @list.List[@num.Num] raise {
    let n_1 = x1065
    multilist_l(factor(n_1))
  })
}

///|
let multifactor_c : @lib.Cell[(@num.Num) -> @list.List[@num.Num] raise] = @lib.Cell::new(
  "multifactor",
)

///|
/// `multifactor`
pub fn multifactor(x : @num.Num) -> @list.List[@num.Num] raise {
  multifactor_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] multilist_l(
  x1063 : @list.List[(TA, @num.Num)],
) -> @list.List[TA] raise {
  let l = x1063
  if l == @list.List([]) {
    @list.List([])
  } else {
    let (x, n) = @lib.hd(l)
    let t1064 = multilist_l(@lib.tl(l))
    @lib.replicate(x, @lib.int63_to_int(@num.int63_of_num(n))).concat(t1064)
  }
}

///|
/// `certificate`
pub(all) enum Certificate {
  Prime_2
  Primroot_and_factors(
    (
      (@num.Num, @list.List[@num.Num]),
      @num.Num,
      @list.List[(@num.Num, Certificate)],
    )
  )
} derive(Eq, Debug)

///|
pub extend Certificate with Eq::{not_equal, equal}

///|
pub extend Certificate with Debug::{to_repr}

///|
pub extend Certificate with @lib.OCompare::{ocompare}

///|
pub extend Certificate with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Certificate(x : Certificate) -> Int {
  match x {
    Prime_2 => 0
    Primroot_and_factors(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Certificate with fn ocompare(self, other) {
  match (self, other) {
    (Primroot_and_factors(a0), Primroot_and_factors(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Certificate(self).compare(ocaml_rank_Certificate(other))
  }
}

///|
pub impl @lib.OHash for Certificate with fn ohash_visit(self, h) {
  match self {
    Prime_2 => h.int(0L)
    Primroot_and_factors(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// find_primitive_root
fn step_46() -> Unit raise {
  fn find_primitive_root_1(
    x1066 : @num.Num,
    x1067 : @num.Num,
    x1068 : @list.List[@num.Num],
    x1069 : @num.Num,
  ) -> @num.Num raise {
    let a = x1066
    let m = x1067
    let ms = x1068
    let n = x1069
    if @num.eq_num(@num.gcd_num(a, n), num_1()) &&
      @num.eq_num(powermod(a, m, n), num_1()) &&
      @lib.forall(
        fn(x1070 : @num.Num) -> Bool raise {
          let k = x1070
          @num.neq_num(powermod(a, k, n), num_1())
        },
        ms,
      ) {
      a
    } else {
      find_primitive_root_1(@num.add_num(a, num_1()), m, ms, n)
    }
  }
  let find_primitive_root_from_2 : (@num.Num) -> ((@list.List[@num.Num]) -> ((
    @num.Num,
  ) -> @num.Num raise) raise) raise = fn(
    x1074 : @num.Num,
  ) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
    fn(x1075 : @list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise {
      fn(x1076 : @num.Num) -> @num.Num raise {
        ((x1071 : @num.Num, x1072 : @list.List[@num.Num], x1073 : @num.Num) => {
          find_primitive_root_1(num_2(), x1071, x1072, x1073)
        })(x1074, x1075, x1076)
      }
    }
  }
  find_primitive_root_c.set(fn(
    x1077 : @num.Num,
  ) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
    let m_1 = x1077
    fn(x1078 : @list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise {
      let ms_1 = x1078
      fn(x1079 : @num.Num) -> @num.Num raise {
        let n_1 = x1079
        if @num.lt_num(n_1, num_2()) {
          raise Failure("find_primitive_root: input too small")
        } else {
          find_primitive_root_from_2(m_1)(ms_1)(n_1)
        }
      }
    }
  })
}

///|
let find_primitive_root_c : @lib.Cell[
  (@num.Num) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise,
] = @lib.Cell::new("find_primitive_root")

///|
/// `find_primitive_root`
pub fn find_primitive_root(
  x : @num.Num,
) -> ((@list.List[@num.Num]) -> ((@num.Num) -> @num.Num raise) raise) raise {
  find_primitive_root_c.get()(x)
}

///|
/// uniq_num
fn step_47() -> Unit raise {
  fn uniq(
    x1080 : @num.Num,
    x1081 : @list.List[@num.Num],
  ) -> @list.List[@num.Num] raise {
    let x = x1080
    let l = x1081
    match l {
      Empty => raise @lib.Unchanged
      More(h, tail=t) =>
        if @num.eq_num(x, h) {
          uniq(x, t) catch {
            @lib.Unchanged => l
            e => raise e
          }
        } else {
          uniq(h, t).prepend(x)
        }
    }
  }
  uniq_num_c.set(fn(
    x1082 : @list.List[@num.Num],
  ) -> @list.List[@num.Num] raise {
    let l_1 = x1082
    if l_1 == @list.List([]) {
      @list.List([])
    } else {
      let t1083 = @lib.tl(l_1)
      uniq(@lib.hd(l_1), t1083)
    }
  })
}

///|
let uniq_num_c : @lib.Cell[(@list.List[@num.Num]) -> @list.List[@num.Num] raise] = @lib.Cell::new(
  "uniq_num",
)

///|
/// `uniq_num`
pub fn uniq_num(x : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
  uniq_num_c.get()(x)
}

///|
/// `setify_num`
pub fn setify_num(x1084 : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
  let s = x1084
  let s_p = @lib.sort(
    fn(x1085 : @num.Num, x1086 : @num.Num) -> Bool raise {
      @num.le_num(x1085, x1086)
    },
    s,
  )
  uniq_num(s_p) catch {
    @lib.Unchanged => s_p
    e => raise e
  }
}

///|
/// certify_prime
fn step_48() -> Unit raise {
  fn cert_prime(x1087 : @num.Num) -> Certificate raise {
    let n = x1087
    if @num.le_num(n, num_2()) {
      if @num.eq_num(n, num_2()) {
        Certificate::Prime_2
      } else {
        raise Failure("certify_prime: not a prime!")
      }
    } else {
      let m = @num.sub_num(n, num_1())
      let pfact = multifactor(m)
      let primes = setify_num(pfact)
      let ms = @lib.map(
        fn(x1088 : @num.Num) -> @num.Num raise {
          let d = x1088
          @num.div_num(m, d)
        },
        primes,
      )
      let a = find_primitive_root(m)(ms)(n)
      Certificate::Primroot_and_factors(
        (
          (n, pfact),
          a,
          @lib.map(
            fn(x1089 : @num.Num) -> (@num.Num, Certificate) raise {
              let n_1 = x1089
              (n_1, cert_prime(n_1))
            },
            primes,
          ),
        ),
      )
    }
  }
  certify_prime_c.set(fn(x1090 : @num.Num) -> Certificate raise {
    let n_2 = x1090
    if Int::to_int64(@lib.length(multifactor(n_2))) == 1L {
      cert_prime(n_2)
    } else {
      raise Failure("certify_prime: input is not a prime")
    }
  })
}

///|
let certify_prime_c : @lib.Cell[(@num.Num) -> Certificate raise] = @lib.Cell::new(
  "certify_prime",
)

///|
/// `certify_prime`
pub fn certify_prime(x : @num.Num) -> Certificate raise {
  certify_prime_c.get()(x)
}

///|
/// EXP_EQ_MOD_CONV
fn step_49() -> Unit raise {
  let t1099 = @simp.asm_simp_tac(
    @list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod()]),
  )
  let t1098 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1097 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1096 = @simp.asm_simp_tac(
    @list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod()]),
  )
  let t1095 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1094 = @simp.asm_simp_tac(
    @list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod()]),
  )
  let t1093 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1092 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.exp_add()]))
  let t1091 = @simp.rewrite_tac(
    @list.List([@nums.numeral(), @arith.bit0(), @arith.bit1()]),
  )
  let t1100 = @tactics.then_tac(
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
                      @simp.rewrite_tac(@list.List([@arith.exp()])),
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
        ),
        t1097,
      ),
      t1098,
    ),
    t1099,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("!((n : Num) == 0) → MOD(EXP((a : Num), 0), n) == MOD(1, n) && MOD(EXP(a, NUMERAL(BIT0((m : Num)))), n) == LET((b : Num) => LET_END(MOD(b * b, n)), MOD(EXP(a, NUMERAL(m)), n)) && MOD(EXP(a, NUMERAL(BIT1(m))), n) == LET((b : Num) => LET_END(MOD(a * MOD(b * b, n), n)), MOD(EXP(a, NUMERAL(m)), n))"),
    t1100,
  )
  let t1101 = @simp.rewrite_tac(@list.List([@int.cong_v1()]))
  let pth_cong = @tactics.prove(
    @term_syntax.parse_term("!((n : Num) == 0) → op_eq_eq((x : Num), (y : Num), mod(n)) == (MOD(x, n) == MOD(y, n))"),
    t1101,
  )
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let raw_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x1102 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x1102
    let ntm = @kernel.rand(@kernel.rand(tm))
    let th1 = @kernel.inst_rule(@list.List([(ntm, n_tm)]), pth_cong)
    let th2 = @bool.eqf_elim(
      @calc_num.num_eq_conv(@kernel.rand(@equal.lhand(@kernel.concl(th1)))),
    )
    let th3 = @simp.rewr_conv(@bool.mp(th1, th2))(tm)
    let th4 = @bool.mp(@kernel.inst_rule(@list.List([(ntm, n_tm)]), pth), th2)
    let (th4a, th4b) = @bool.conj_pair(th4)
    let conv_base : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
      fn(
        x1103 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1103
      },
      @list.List([th4a]),
    )
    let conv_step : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
      fn(
        x1104 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1104
      },
      @list.List([th4b]),
    )
    fn conv(x1105 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x1105
      conv_base(tm_1) catch {
        Failure(_) =>
          @equal.thenc(
            @equal.thenc(
              @equal.thenc(conv_step, @equal.rand_conv(conv)),
              @pair.let_conv,
            ),
            @calc_num.num_reduce_conv,
          )(tm_1)
        e => raise e
      }
    }
    let t1106 = @kernel.rand(@kernel.concl(th3))
    let th5 = @equal.thenc(@equal.land_conv(conv), @calc_num.num_reduce_conv)(
      t1106,
    )
    @kernel.trans(th3, th5)
  }
  let gconv_net = @lib.itlist(
    fn(
      x1111 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x1112 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s1113 = ((x1110 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x1107 : @kernel.Term,
            x1108 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x1109 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x1107, x1108, x1109)
            }
          },
          x1110,
        )
      })(x1111)
      s1113(x1112)
    },
    @list.List([(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (m : Num)), 1, mod((n : Num)))"), raw_conv)]),
    @nets.empty_net(),
  )
  exp_eq_mod_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let exp_eq_mod_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "EXP_EQ_MOD_CONV",
)

///|
/// `EXP_EQ_MOD_CONV`
pub fn exp_eq_mod_conv(x : @kernel.Term) -> @kernel.Thm raise {
  exp_eq_mod_conv_c.get()(x)
}

///|
/// prime_theorem_cache
fn step_50() -> Unit raise {
  prime_theorem_cache_c.set(Ref::{ val: @list.List([]), })
}

///|
let prime_theorem_cache_c : @lib.Cell[Ref[@list.List[(@num.Num, @kernel.Thm)]]] = @lib.Cell::new(
  "prime_theorem_cache",
)

///|
/// `prime_theorem_cache`
pub fn prime_theorem_cache() -> Ref[@list.List[(@num.Num, @kernel.Thm)]] {
  prime_theorem_cache_c.get()
}

///|
/// `lookup_under_num`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] lookup_under_num(
  x1114 : @num.Num,
  x1115 : @list.List[(@num.Num, TA)],
) -> TA raise {
  let n = x1114
  let l = x1115
  if l == @list.List([]) {
    raise Failure("lookup_under_num")
  } else {
    let h = @lib.hd(l)
    if @num.eq_num(h.0, n) {
      h.1
    } else {
      lookup_under_num(n, @lib.tl(l))
    }
  }
}

///|
/// check_certificate
fn step_51() -> Unit raise {
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let a_tm = @term_syntax.parse_term("(a : Num)")
  let ps_tm = @term_syntax.parse_term("(ps : List[Num])")
  let simple_rewrite_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(
    @list.List([]),
  )
  let conj_ac_sorted = @class.taut(
    @term_syntax.parse_term("((a : Bool) && a && (b : Bool)) == (a && b) && (a && a) == a"),
  )
  let t1119 = @equal.once_depth_conv(
    @equal.orelsec(@calc_num.num_eq_conv, @calc_num.num_le_conv),
  )
  let t1118 = @equal.once_depth_conv(@calc_num.num_div_conv)
  let t1117 = @equal.depth_conv(@calc_num.num_mult_conv)
  let t1116 = @equal.once_depth_conv(@calc_num.num_sub_conv)
  let t1120 = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @simp.rewrite_conv(
              @list.List([@lists.itlist(), @lists.all(), conj_ac_sorted]),
            ),
            t1116,
          ),
          t1117,
        ),
        t1118,
      ),
      t1119,
    ),
    simple_rewrite_conv,
  )
  let clean_rule : (@kernel.Thm) -> @kernel.Thm raise = (x1121 : @kernel.Thm) => {
    @equal.conv_rule(t1120, x1121)
  }
  fn check_certificate_1(x1122 : Certificate) -> @kernel.Thm raise {
    let cert = x1122
    match cert {
      Certificate::Prime_2 => @prime.prime_2()
      Certificate::Primroot_and_factors(((n, ps), a, ncerts)) =>
        lookup_under_num(n, prime_theorem_cache().val) catch {
          Failure(_) => {
            let t1123 = (@nums.mk_numeral(a), a_tm)
            let t1124 = (@lists.mk_flist(@lib.map(@nums.mk_numeral, ps)), ps_tm)
            let th1 = @kernel.inst_rule(
              @list.List([(@nums.mk_numeral(n), n_tm), t1124, t1123]),
              lucas_primefact(),
            )
            let th2 = clean_rule(th1)
            let t1125 = @kernel.concl(th2)
            let th3 = @equal.once_depth_conv(exp_eq_mod_conv)(t1125)
            let th4 = @equal.conv_rule(
              simple_rewrite_conv,
              @kernel.eq_mp(th3, th2),
            )
            let ants = @basics.conjuncts(@equal.lhand(@kernel.concl(th4)))
            let certs = @lib.map(
              fn(x1126 : @kernel.Term) -> Certificate raise {
                let t = x1126
                lookup_under_num(@basics.dest_numeral(@kernel.rand(t)), ncerts)
              },
              ants,
            )
            let ths = @lib.map(check_certificate_1, certs)
            let fth = @bool.mp(th4, @lib.end_itlist(@bool.conj, ths))
            {
              prime_theorem_cache().val = prime_theorem_cache().val.prepend(
                (n, fth),
              )
              ()
            }
            fth
          }
          e => raise e
        }
    }
  }
  check_certificate_c.set(check_certificate_1)
}

///|
let check_certificate_c : @lib.Cell[(Certificate) -> @kernel.Thm raise] = @lib.Cell::new(
  "check_certificate",
)

///|
/// `check_certificate`
pub fn check_certificate(x : Certificate) -> @kernel.Thm raise {
  check_certificate_c.get()(x)
}

///|
/// PROVE_PRIME
fn step_52() -> Unit raise {
  prove_prime_c.set(fn(x1127 : @num.Num) -> @kernel.Thm raise {
    check_certificate(certify_prime(x1127))
  })
}

///|
let prove_prime_c : @lib.Cell[(@num.Num) -> @kernel.Thm raise] = @lib.Cell::new(
  "PROVE_PRIME",
)

///|
/// `PROVE_PRIME`
pub fn prove_prime(x : @num.Num) -> @kernel.Thm raise {
  prove_prime_c.get()(x)
}

///|
/// PROVE_PRIMEFACT
fn step_53() -> Unit raise {
  let pth = @bool.spec_all(primefact_variant())
  let start_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.pure_rewrite_conv(@list.List([@lists.itlist(), @lists.all()])),
    @calc_num.num_reduce_conv,
  )
  let ps_tm = @term_syntax.parse_term("(ps : List[Num])")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  prove_primefact_c.set(fn(x1128 : @num.Num) -> @kernel.Thm raise {
    let n = x1128
    let pfact = multifactor(n)
    let t1129 = (@nums.mk_numeral(n), n_tm)
    let th1 = @kernel.inst_rule(
      @list.List([
        (@lists.mk_flist(@lib.map(@nums.mk_numeral, pfact)), ps_tm),
        t1129,
      ]),
      pth,
    )
    let th2 = @kernel.trans(th1, start_conv(@kernel.rand(@kernel.concl(th1))))
    let ths = @lib.map(prove_prime, pfact)
    let t1130 = @lib.end_itlist(@bool.conj, ths)
    @kernel.eq_mp(@equal.sym(th2), t1130)
  })
}

///|
let prove_primefact_c : @lib.Cell[(@num.Num) -> @kernel.Thm raise] = @lib.Cell::new(
  "PROVE_PRIMEFACT",
)

///|
/// `PROVE_PRIMEFACT`
pub fn prove_primefact(x : @num.Num) -> @kernel.Thm raise {
  prove_primefact_c.get()(x)
}

///|
/// PRIME_TEST
fn step_54() -> Unit raise {
  let t1131 = @meson.meson_tac(@list.List([@int.prime(), @int.divides()]))
  let not_prime_thm = @tactics.prove(
    @term_syntax.parse_term("((m : Num) == 1) == false → (m == (p : Num)) == false → m * (n : Num) == p → prime(p) == false"),
    t1131,
  )
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let p_tm = @term_syntax.parse_term("(p : Num)")
  prime_test_c.set(fn(x1132 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1132
    let p = @basics.dest_numeral(tm)
    if @num.eq_num(p, @num.num_of_int64(0L)) {
      @bool.eqf_intro(@prime.prime_0())
    } else if @num.eq_num(p, @num.num_of_int64(1L)) {
      @bool.eqf_intro(@prime.prime_1())
    } else {
      let pfact = multifactor(p)
      if Int::to_int64(@lib.length(pfact)) == 1L {
        @lib.remark("proving that " + (@num.string_of_num(p) + " is prime"))
        @bool.eqt_intro(prove_prime(p))
      } else {
        @lib.remark("proving that " + (@num.string_of_num(p) + " is composite"))
        let m = @lib.hd(pfact)
        let n = @lib.end_itlist(
          fn(x1133 : @num.Num, x1134 : @num.Num) -> @num.Num raise {
            @num.mult_num(x1133, x1134)
          },
          @lib.tl(pfact),
        )
        let t1135 = (@nums.mk_numeral(p), p_tm)
        let t1136 = (@nums.mk_numeral(n), n_tm)
        let th0 = @kernel.inst_rule(
          @list.List([(@nums.mk_numeral(m), m_tm), t1136, t1135]),
          not_prime_thm,
        )
        let th1 = @bool.mp(
          th0,
          @calc_num.num_eq_conv(@equal.lhand(@equal.lhand(@kernel.concl(th0)))),
        )
        let th2 = @bool.mp(
          th1,
          @calc_num.num_eq_conv(@equal.lhand(@equal.lhand(@kernel.concl(th1)))),
        )
        @bool.mp(
          th2,
          @calc_num.num_mult_conv(
            @equal.lhand(@equal.lhand(@kernel.concl(th2))),
          ),
        )
      }
    }
  })
}

///|
let prime_test_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "PRIME_TEST",
)

///|
/// `PRIME_TEST`
pub fn prime_test(x : @kernel.Term) -> @kernel.Thm raise {
  prime_test_c.get()(x)
}

///|
/// PRIME_CONV
fn step_55() -> Unit raise {
  let prime_tm = @term_syntax.parse_term("prime")
  prime_conv_c.set(fn(x1137 : @kernel.Term) -> @kernel.Thm raise {
    let tm0 = x1137
    let (ptm, tm) = @kernel.dest_comb(tm0)
    if ptm != prime_tm {
      raise Failure("expected term of form prime(n)")
    } else {
      prime_test(tm)
    }
  })
}

///|
let prime_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "PRIME_CONV",
)

///|
/// `PRIME_CONV`
pub fn prime_conv(x : @kernel.Term) -> @kernel.Thm raise {
  prime_conv_c.get()(x)
}

///|
/// Library/pratt.ml:968
fn step_56() -> Unit raise {
  ignore(
    @lib.map(
      fn(x1139 : Int64) -> @kernel.Thm raise {
        ((x1138 : @kernel.Term) => @lib.time(prime_test, x1138))(
          @nums.mk_small_numeral(x1139),
        )
      },
      @lib.range(0L, 50L),
    ),
  )
}

///|
/// Library/pratt.ml:970
fn step_57() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65535")))
}

///|
/// Library/pratt.ml:972
fn step_58() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65536")))
}

///|
/// Library/pratt.ml:974
fn step_59() -> Unit raise {
  ignore(@lib.time(prime_test, @term_syntax.parse_term("65537")))
}

///|
/// Library/pratt.ml:976
fn step_60() -> Unit raise {
  ignore(@lib.time(prove_primefact, @num.num_of_int64(222L)))
}

///|
/// Library/pratt.ml:978
fn step_61() -> Unit raise {
  ignore(@lib.time(prove_primefact, @num.num_of_int64(151L)))
}

///|
/// Library/pratt.ml:984
fn step_62() -> Unit raise {
  ignore(
    @lib.map(
      fn(x1141 : Int64) -> @kernel.Thm raise {
        ((x1140 : @kernel.Term) => @lib.time(prime_test, x1140))(
          @nums.mk_small_numeral(x1141),
        )
      },
      @list.List([
        3L, 5L, 7L, 13L, 23L, 43L, 83L, 163L, 317L, 631L, 1259L, 2503L, 4001L,
      ]),
    ),
  )
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
}
