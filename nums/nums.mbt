// Translated from upstream nums.ml; edit this file directly.

///|
/// nums.ml:16
fn step_1() -> Unit raise {
  @kernel.new_type("ind", 0L)
}

///|
/// ONE_ONE
fn step_2() -> Unit raise {
  one_one_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(ONE_ONE : ((A) -> B) -> Bool)((f : (A) -> B)) == (∀ x1 : A, ∀ x2 : A, f(x1) == f(x2) → x1 == x2)"),
    ),
  )
}

///|
let one_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONE_ONE")

///|
/// `ONE_ONE`
pub fn one_one() -> @kernel.Thm {
  one_one_c.get()
}

///|
/// ONTO
fn step_3() -> Unit raise {
  onto_c.set(
    @pair.new_definition(@term_syntax.parse_term("(ONTO : ((A) -> B) -> Bool)((f : (A) -> B)) == (∀ y : B, ∃ x : A, y == f(x))")),
  )
}

///|
let onto_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONTO")

///|
/// `ONTO`
pub fn onto() -> @kernel.Thm {
  onto_c.get()
}

///|
/// INFINITY_AX
fn step_4() -> Unit raise {
  infinity_ax_c.set(
    @kernel.new_axiom(
      @term_syntax.parse_term("∃ f : (Ind) -> Ind, ONE_ONE(f) && !ONTO(f)"),
    ),
  )
}

///|
let infinity_ax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITY_AX")

///|
/// `INFINITY_AX`
pub fn infinity_ax() -> @kernel.Thm {
  infinity_ax_c.get()
}

///|
/// IND_SUC_0_EXISTS
fn step_5() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t6 = @simp.rewrite_tac(@list.List([one_one(), onto()]))
  let t5 = @tactics.pop_assum(fn(
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
  })
  let t1 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Ind) -> Ind)"))
  let t8 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_choose_tac(@term_syntax.parse_term("(f : (Ind) -> Ind)"), infinity_ax()),
          t1,
        ),
        t5,
      ),
      t6,
    ),
    t7,
  )
  ind_suc_0_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ f : (Ind) -> Ind, ∃ z : Ind, (∀ x1 : Ind, ∀ x2 : Ind, (f(x1) == f(x2)) == (x1 == x2)) && (∀ x : Ind, !(f(x) == z))"),
      t8,
    ),
  )
}

///|
let ind_suc_0_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IND_SUC_0_EXISTS",
)

///|
/// `IND_SUC_0_EXISTS`
pub fn ind_suc_0_exists() -> @kernel.Thm {
  ind_suc_0_exists_c.get()
}

///|
/// IND_SUC_SPEC
fn step_6() -> Unit raise {
  let th1 = @pair.new_definition(
    @term_syntax.parse_term("(IND_SUC : (Ind) -> Ind) == select((f : (Ind) -> Ind) => ∃ z : Ind, (∀ x1 : Ind, ∀ x2 : Ind, (f(x1) == f(x2)) == (x1 == x2)) && (∀ x : Ind, !(f(x) == z)))"),
  )
  let t9 = @class.select_rule(ind_suc_0_exists())
  let th2 = @simp.rewrite_rule(@list.List([@equal.gsym(th1)]))(t9)
  let th3 = @pair.new_definition(
    @term_syntax.parse_term("(IND_0 : Ind) == select((z : Ind) => (∀ x1 : Ind, ∀ x2 : Ind, (IND_SUC(x1) == IND_SUC(x2)) == (x1 == x2)) && (∀ x : Ind, !(IND_SUC(x) == z)))"),
  )
  let t10 = @class.select_rule(th2)
  ind_suc_spec_c.set(@simp.rewrite_rule(@list.List([@equal.gsym(th3)]))(t10))
}

///|
let ind_suc_spec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IND_SUC_SPEC")

///|
/// `IND_SUC_SPEC`
pub fn ind_suc_spec() -> @kernel.Thm {
  ind_suc_spec_c.get()
}

///|
let ind_suc_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IND_SUC_INJ")

///|
/// `IND_SUC_INJ`
pub fn ind_suc_inj() -> @kernel.Thm {
  ind_suc_inj_c.get()
}

///|
let ind_suc_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IND_SUC_0")

///|
/// `IND_SUC_0`
pub fn ind_suc_0() -> @kernel.Thm {
  ind_suc_0_c.get()
}

///|
/// IND_SUC_INJ, IND_SUC_0
fn step_7() -> Unit raise {
  let (ind_suc_inj, ind_suc_0) = @bool.conj_pair(ind_suc_spec())
  ind_suc_inj_c.set(ind_suc_inj)
  ind_suc_0_c.set(ind_suc_0)
}

///|
let num_rep_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_REP_RULES")

///|
/// `NUM_REP_RULES`
pub fn num_rep_rules() -> @kernel.Thm {
  num_rep_rules_c.get()
}

///|
let num_rep_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_REP_INDUCT")

///|
/// `NUM_REP_INDUCT`
pub fn num_rep_induct() -> @kernel.Thm {
  num_rep_induct_c.get()
}

///|
let num_rep_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_REP_CASES")

///|
/// `NUM_REP_CASES`
pub fn num_rep_cases() -> @kernel.Thm {
  num_rep_cases_c.get()
}

///|
/// NUM_REP_RULES, NUM_REP_INDUCT, NUM_REP_CASES
fn step_8() -> Unit raise {
  let (num_rep_rules, num_rep_induct, num_rep_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(NUM_REP : (Ind) -> Bool)(IND_0) && (∀ i : Ind, NUM_REP(i) → NUM_REP(IND_SUC(i)))"),
  )
  num_rep_rules_c.set(num_rep_rules)
  num_rep_induct_c.set(num_rep_induct)
  num_rep_cases_c.set(num_rep_cases)
}

///|
/// num_tydef
fn step_9() -> Unit raise {
  num_tydef_c.set(
    @kernel.new_basic_type_definition(
      "num",
      "mk_num",
      "dest_num",
      @bool.conjunct1(num_rep_rules()),
    ),
  )
}

///|
let num_tydef_c : @lib.Cell[(@kernel.Thm, @kernel.Thm)] = @lib.Cell::new(
  "num_tydef",
)

///|
/// `num_tydef`
pub fn num_tydef() -> (@kernel.Thm, @kernel.Thm) {
  num_tydef_c.get()
}

///|
/// ZERO_DEF
fn step_10() -> Unit raise {
  zero_def_c.set(@pair.new_definition(@term_syntax.parse_term("(_0 : Num) == mk_num(IND_0)")))
}

///|
let zero_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_DEF")

///|
/// `ZERO_DEF`
pub fn zero_def() -> @kernel.Thm {
  zero_def_c.get()
}

///|
/// SUC_DEF
fn step_11() -> Unit raise {
  suc_def_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(SUC : (Num) -> Num)((n : Num)) == mk_num(IND_SUC(dest_num(n)))"),
    ),
  )
}

///|
let suc_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_DEF")

///|
/// `SUC_DEF`
pub fn suc_def() -> @kernel.Thm {
  suc_def_c.get()
}

///|
/// NOT_SUC
fn step_12() -> Unit raise {
  let t11 = @meson.meson_tac(
    @list.List([num_rep_rules(), num_tydef().0, num_tydef().1, ind_suc_0()]),
  )
  let t12 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([suc_def(), zero_def()])),
    t11,
  )
  not_suc_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(SUC(n) == _0)"), t12))
}

///|
let not_suc_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_SUC")

///|
/// `NOT_SUC`
pub fn not_suc_v1() -> @kernel.Thm {
  not_suc_v1_c.get()
}

///|
/// SUC_INJ
fn step_13() -> Unit raise {
  let t36 = @simp.rewrite_tac(@list.List([num_tydef().0]))
  let t32 = @term_syntax.parse_term("mk_num")
  let t35 = @tactics.disch_then(fn(
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x29 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s30 = @tactics.mp_tac(x29)
      fn(
        x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s30(x31)
      }
    })(((x33 : @kernel.Thm) => @equal.ap_term(t32, x33))(x34))
  })
  let t28 = @simp.asm_rewrite_tac(@list.List([ind_suc_inj()]))
  let t27 = @simp.rewrite_tac(@list.List([num_tydef().0, num_tydef().1]))
  let t26 = @list.List([
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(@bool.conjunct2(num_rep_rules())),
    ),
    @tactics.all_tac,
  ])
  let t25 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ p : Num, NUM_REP(IND_SUC(dest_num(p)))"),
    fn(
      x22 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s23 = @tactics.mp_tac(x22)
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
        s23(x24)
      }
    },
  )
  let t18 = @term_syntax.parse_term("dest_num")
  let t21 = @tactics.pop_assum(fn(
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
    (fn(
      x15 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s16 = @tactics.mp_tac(x15)
      fn(
        x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s16(x17)
      }
    })(((x19 : @kernel.Thm) => @equal.ap_term(t18, x19))(x20))
  })
  let t14 = @simp.asm_rewrite_tac(@list.List([]))
  let t13 = @simp.rewrite_tac(@list.List([suc_def()]))
  let t37 = @tactics.then_tac(
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
                          t13,
                        ),
                        @tactics.eq_tac,
                      ),
                      @tactics.disch_tac,
                    ),
                    t14,
                  ),
                  t21,
                ),
                t25,
              ),
              t26,
            ),
            t27,
          ),
          @tactics.disch_tac,
        ),
        t28,
      ),
      t35,
    ),
    t36,
  )
  suc_inj_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (SUC(m) == SUC(n)) == (m == n)"), t37),
  )
}

///|
let suc_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_INJ")

///|
/// `SUC_INJ`
pub fn suc_inj() -> @kernel.Thm {
  suc_inj_c.get()
}

///|
/// num_INDUCTION
fn step_14() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([num_tydef().0, num_tydef().1]))
  let t74 = @term_syntax.parse_term("dest_num((n : Num))")
  let t78 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x76 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x71 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s72 = @tactics.mp_tac(x71)
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
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      })(((x75 : @kernel.Thm) => @bool.spec(t74, x75))(x76))
    }),
    t77,
  )
  let t66 = @tactics.first_assum(fn(
    x63 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s64 = @tactics.match_accept_tac(x63)
    fn(
      x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s64(x65)
    }
  })
  let t67 = @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t66)
  let t62 = @tactics.first_assum(fn(
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
    let s60 = @tactics.match_accept_tac(x59)
    fn(
      x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s60(x61)
    }
  })
  let t58 = @simp.rewrite_tac(@list.List([@equal.gsym(num_tydef().1)]))
  let t57 = @tactics.conv_tac(@equal.sym_conv)
  let t56 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t68 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.rewrite_tac(@list.List([suc_def()])), t56),
          t57,
        ),
        t58,
      ),
      t62,
    ),
    t67,
  ])
  let t69 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("mk_num(IND_SUC((i : Ind))) == SUC(mk_num(i))"),
      fn(
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
        let s54 = @tactics.subst1_tac(x53)
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
      },
    ),
    t68,
  )
  let t52 = @simp.asm_rewrite_tac(@list.List([]))
  let t70 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@bool.conjunct2(num_rep_rules())),
      t52,
    ),
    t69,
  ])
  let t79 = @list.List([
    @tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t70),
    t78,
  ])
  let t39 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(zero_def()), num_rep_rules()]),
  )
  let t38 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(i : Ind) => NUM_REP(i) && (P : (Num) -> Bool)(mk_num(i))"),
      num_rep_induct(),
    ),
  )
  let t80 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t38),
        t39,
      ),
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
        (fn(
          x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x48 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x46 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x40 : @kernel.Term,
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
                  x41 : (@kernel.Thm) -> ((
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
                  let s42 = @tactics.subgoal_then(x40, x41)
                  fn(
                    x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s42(x43)
                  }
                }
              })(x46)(fn(
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
                let t = x44
                @simp.rewrite_tac(@list.List([t]))
              })
            })(((x47 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x47))(x48))
          })(
            (fn(
              x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x49.1
            })(x50),
          )
        })(x51)(x51)
      },
    ),
    t79,
  )
  num_induction_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(_0) && (∀ n : Num, P(n) → P(SUC(n))) → (∀ n : Num, P(n))"),
      t80,
    ),
  )
}

///|
let num_induction_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "num_INDUCTION",
)

///|
/// `num_INDUCTION`
pub fn num_induction_v1() -> @kernel.Thm {
  num_induction_v1_c.get()
}

///|
/// num_Axiom
fn step_15() -> Unit raise {
  let t151 = @simp.asm_rewrite_tac(@list.List([]))
  let t150 = @tactics.repeat_tac(@tactics.strip_tac)
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t148 = @tactics.match_mp_tac(num_induction_v1())
  let t147 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t152 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t147),
          t148,
        ),
        t149,
      ),
      t150,
    ),
    t151,
  )
  let t144 = @tactics.first_assum(fn(
    x141 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x141
    @simp.gen_rewrite_tac(
      fn(
        x143 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x143
      },
      @list.List([@equal.gsym(th_1)]),
    )
  })
  let t140 = @tactics.first_assum(fn(
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
    @tactics.match_mp_tac(@bool.conjunct2(x139))
  })
  let t138 = @simp.asm_rewrite_tac(@list.List([]))
  let t137 = @tactics.exists_tac(@parser.parse_term("fn:num->A"))
  let t136 = @tactics.disch_then(
    @tactics.x_choose_then(@parser.parse_term("fn:num->A"))(fn(
      x135 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s133 = @tactics.assume_tac(x132)
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
      })(@equal.gsym(x135))
    }),
  )
  let t145 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@class.unique_skolem_alt()])),
                t136,
              ),
              t137,
            ),
            t138,
          ),
          @tactics.gen_tac,
        ),
        t140,
      ),
      t144,
    ),
    @tactics.refl_tac,
  )
  let t131 = @simp.asm_rewrite_tac(@list.List([]))
  let t128 = @tactics.first_assum(@tactics.match_mp_tac)
  let t129 = @tactics.then_tac(
    @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac),
    t128,
  )
  let t127 = @term_syntax.parse_term("(y : A)")
  let t130 = @list.List([
    @tactics.map_every(
      fn(
        x124 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s125 = @tactics.exists_tac(x124)
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
      },
      @list.List([@term_syntax.parse_term("(f : (A, Num) -> A)((y : A), (n : Num))"), t127]),
    ),
    t129,
  ])
  let t123 = @simp.asm_rewrite_tac(@list.List([]))
  let t122 = @tactics.repeat_tac(@tactics.strip_tac)
  let t116 = @term_syntax.parse_term("(y : A)")
  let t121 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x117 : @kernel.Thm) => @tactics.x_choose_tac(t116, x117),
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
        let s119 = @tactics.assume_tac(x118)
        fn(
          x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s119(x120)
        }
      },
    ),
  )
  let t115 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t114 = @tactics.undisch_tac(@term_syntax.parse_term("existsunique((y : A) => (PRG : (Num, A) -> Bool)((n : Num), y))"))
  let t113 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t112 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(not_suc_v1()),
      not_suc_v1(),
      suc_inj(),
      @theorems.exists_unique_refl(),
    ]),
  )
  let t111 = @tactics.first_assum(fn(
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
    let th = x106
    @simp.gen_rewrite_tac(
      fn(
        x108 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s109 = @equal.binder_conv(x108)
        fn(x110 : @kernel.Term) -> @kernel.Thm raise { s109(x110) }
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t105 = @tactics.repeat_tac(@tactics.strip_tac)
  let t146 = @list.List([
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
                          @tactics.match_mp_tac(num_induction_v1()),
                          t105,
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
    t145,
  ])
  let t104 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, existsunique((y : A) => (PRG : (Num, A) -> Bool)(n, y))"),
    fn(
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
    },
  )
  let t100 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x93 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s94 = @tactics.assume_tac(x93)
        fn(
          x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s94(x95)
        }
      },
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
        (fn(
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
          let s97 = @tactics.assume_tac(x96)
          fn(
            x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s97(x98)
          }
        })(@equal.gsym(x99))
      },
    ),
  )
  let t92 = @tactics.disch_then(
    @tactics.choose_then(
      @tactics.conjuncts_then2(
        fn(
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
          let s87 = @tactics.assume_tac(x86)
          fn(
            x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s87(x88)
          }
        },
        fn(
          x89 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s90 = @tactics.mp_tac(x89)
          fn(
            x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s90(x91)
          }
        },
      ),
    ),
  )
  let t85 = @term_syntax.parse_term("(PRG : (Num, A) -> Bool)(_0, (e : A)) && (∀ b : A, ∀ n : Num, PRG(n, b) → PRG(SUC(n), (f : (A, Num) -> A)(b, n)))")
  let t153 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
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
            })(@ind_defs.prove_inductive_relations_exist(t85)),
            t92,
          ),
          t100,
        ),
        t104,
      ),
      t146,
    ),
    t152,
  ])
  let t81 = @simp.once_rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t154 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t81),
      @tactics.conj_tac,
    ),
    t153,
  )
  num_axiom_v1_c.set(
    @tactics.prove(
      @parser.parse_term(
        "forall(e:A) f. ?!fn. (fn _0 = e) /\\\n                   (forall n. fn (SUC n) = f (fn n) n)",
      ),
      t154,
    ),
  )
}

///|
let num_axiom_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_Axiom")

///|
/// `num_Axiom`
pub fn num_axiom_v1() -> @kernel.Thm {
  num_axiom_v1_c.get()
}

///|
/// NUMERAL
fn step_16() -> Unit raise {
  let num_ty = @kernel.type_of(@equal.lhand(@kernel.concl(zero_def())))
  let funn_ty = @basics.mk_fun_ty(num_ty, num_ty)
  let numeral_tm = @kernel.mk_var("NUMERAL", funn_ty)
  let n_tm = @kernel.mk_var("n", num_ty)
  numeral_c.set(
    @pair.new_definition(@basics.mk_eq(@kernel.mk_comb(numeral_tm, n_tm), n_tm)),
  )
}

///|
let numeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMERAL")

///|
/// `NUMERAL`
pub fn numeral() -> @kernel.Thm {
  numeral_c.get()
}

///|
let not_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_SUC")

///|
/// `NOT_SUC`
pub fn not_suc() -> @kernel.Thm {
  not_suc_c.get()
}

///|
let num_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_INDUCTION")

///|
/// `num_INDUCTION`
pub fn num_induction() -> @kernel.Thm {
  num_induction_c.get()
}

///|
let num_axiom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_Axiom")

///|
/// `num_Axiom`
pub fn num_axiom() -> @kernel.Thm {
  num_axiom_c.get()
}

///|
/// NOT_SUC, num_INDUCTION, num_Axiom
fn step_17() -> Unit raise {
  let t155 = @simp.rewrite_tac(@list.List([numeral()]))
  let th = @tactics.prove(@term_syntax.parse_term("_0 == 0"), t155)
  match
    @lib.map(
      @simp.gen_rewrite_rule(
        fn(
          x156 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s157 = @equal.depth_conv(x156)
          fn(x158 : @kernel.Term) -> @kernel.Thm raise { s157(x158) }
        },
        @list.List([th]),
      ),
      @list.List([not_suc_v1(), num_induction_v1(), num_axiom_v1()]),
    ) {
    More(not_suc, tail=More(num_induction, tail=More(num_axiom, tail=Empty))) => {
      not_suc_c.set(not_suc)
      num_induction_c.set(num_induction)
      num_axiom_c.set(num_axiom)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:156:4")
  }
}

///|
/// INDUCT_TAC
fn step_18() -> Unit raise {
  let t159 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
  ])
  induct_tac_c.set(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.match_mp_tac(num_induction()),
        @tactics.conj_tac,
      ),
      t159,
    ),
  )
}

///|
let induct_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("INDUCT_TAC")

///|
/// `INDUCT_TAC`
pub fn induct_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  induct_tac_c.get()(x)
}

///|
/// num_RECURSION
fn step_19() -> Unit raise {
  let avs = @basics.strip_forall(@kernel.concl(num_axiom())).0
  num_recursion_c.set(
    @bool.genl(avs, @bool.existence(@bool.specl(avs, num_axiom()))),
  )
}

///|
let num_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_RECURSION")

///|
/// `num_RECURSION`
pub fn num_recursion() -> @kernel.Thm {
  num_recursion_c.get()
}

///|
/// num_CASES
fn step_20() -> Unit raise {
  let t160 = @tactics.then_tac(induct_tac, @meson.meson_tac(@list.List([])))
  num_cases_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, m == 0 || (∃ n : Num, m == SUC(n))"), t160),
  )
}

///|
let num_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_CASES")

///|
/// `num_CASES`
pub fn num_cases() -> @kernel.Thm {
  num_cases_c.get()
}

///|
/// nums.ml:185
fn step_21() -> Unit raise {
  @class.inductive_type_store().val = @class.inductive_type_store().val.prepend(
    ("num", (2L, num_induction(), num_recursion())),
  )
  ()
}

///|
/// BIT0_DEF
fn step_22() -> Unit raise {
  let funn_ty = @kernel.type_of(
    @kernel.rator(@equal.lhand(@basics.dest_forall(@kernel.concl(numeral())).1)),
  )
  let bit0_tm = @kernel.mk_var("BIT0", funn_ty)
  let def = @pair.new_definition(
    @basics.mk_eq(
      bit0_tm,
      @parser.parse_term("@fn. fn 0 = 0 /\\ (forall n. fn (SUC n) = SUC (SUC(fn n)))"),
    ),
  )
  let t161 = @term_syntax.parse_term("(m : Num) => (n : Num) => SUC(SUC(m))")
  let th = @equal.beta_rule(
    @bool.ispecl(@list.List([@term_syntax.parse_term("0"), t161]), num_recursion()),
  )
  let t162 = @class.select_rule(th)
  bit0_def_c.set(@simp.rewrite_rule(@list.List([@equal.gsym(def)]))(t162))
}

///|
let bit0_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT0_DEF")

///|
/// `BIT0_DEF`
pub fn bit0_def() -> @kernel.Thm {
  bit0_def_c.get()
}

///|
/// BIT1_DEF
fn step_23() -> Unit raise {
  let funn_ty = @kernel.type_of(
    @kernel.rator(@equal.lhand(@equal.lhand(@kernel.concl(bit0_def())))),
  )
  let num_ty = @basics.dest_fun_ty(funn_ty).1
  let n_tm = @kernel.mk_var("n", num_ty)
  let bit1_tm = @kernel.mk_var("BIT1", funn_ty)
  let t163 = @term_syntax.parse_term("SUC(BIT0((n : Num)))")
  bit1_def_c.set(
    @pair.new_definition(@basics.mk_eq(@kernel.mk_comb(bit1_tm, n_tm), t163)),
  )
}

///|
let bit1_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIT1_DEF")

///|
/// `BIT1_DEF`
pub fn bit1_def() -> @kernel.Thm {
  bit1_def_c.get()
}

///|
/// mk_numeral
fn step_24() -> Unit raise {
  let pow24 = @num.pow2(24)
  let num_0 = @num.num_of_int64(0L)
  let zero_tm = @kernel.mk_const("_0", @list.List([]))
  let bit0_tm = @kernel.mk_const("BIT0", @list.List([]))
  let bit1_tm = @kernel.mk_const("BIT1", @list.List([]))
  let numeral_tm = @kernel.mk_const("NUMERAL", @list.List([]))
  fn stripzeros(x164 : @list.List[Bool]) -> @list.List[Bool] raise {
    let l = x164
    match l {
      More(false, tail=t) => stripzeros(t)
      _ => l
    }
  }
  fn raw_list_of_num(
    x165 : @list.List[Bool],
    x166 : @num.Num,
  ) -> @list.List[Bool] raise {
    let l_1 = x165
    let n = x166
    if @num.eq_num(n, num_0) {
      stripzeros(l_1)
    } else {
      let h = @num.int63_of_num(@num.mod_num(n, pow24))
      let t190 = @num.quo_num(n, pow24)
      let t167 = l_1.prepend((h & 1L) != 0L)
      let t168 = t167.prepend((h & 2L) != 0L)
      let t169 = t168.prepend((h & 4L) != 0L)
      let t170 = t169.prepend((h & 8L) != 0L)
      let t171 = t170.prepend((h & 16L) != 0L)
      let t172 = t171.prepend((h & 32L) != 0L)
      let t173 = t172.prepend((h & 64L) != 0L)
      let t174 = t173.prepend((h & 128L) != 0L)
      let t175 = t174.prepend((h & 256L) != 0L)
      let t176 = t175.prepend((h & 512L) != 0L)
      let t177 = t176.prepend((h & 1024L) != 0L)
      let t178 = t177.prepend((h & 2048L) != 0L)
      let t179 = t178.prepend((h & 4096L) != 0L)
      let t180 = t179.prepend((h & 8192L) != 0L)
      let t181 = t180.prepend((h & 16384L) != 0L)
      let t182 = t181.prepend((h & 32768L) != 0L)
      let t183 = t182.prepend((h & 65536L) != 0L)
      let t184 = t183.prepend((h & 131072L) != 0L)
      let t185 = t184.prepend((h & 262144L) != 0L)
      let t186 = t185.prepend((h & 524288L) != 0L)
      let t187 = t186.prepend((h & 1048576L) != 0L)
      let t188 = t187.prepend((h & 2097152L) != 0L)
      let t189 = t188.prepend((h & 4194304L) != 0L)
      raw_list_of_num(t189.prepend((h & 8388608L) != 0L), t190)
    }
  }
  fn numeral_of_list(
    x191 : @kernel.Term,
    x192 : @list.List[Bool],
  ) -> @kernel.Term raise {
    let t_1 = x191
    let l_2 = x192
    match l_2 {
      Empty => t_1
      More(b, tail=r) =>
        numeral_of_list(
          @kernel.mk_comb(if b { bit1_tm } else { bit0_tm }, t_1),
          r,
        )
    }
  }
  let mk_raw_numeral : (@num.Num) -> @kernel.Term raise = fn(
    x193 : @num.Num,
  ) -> @kernel.Term raise {
    let n_1 = x193
    numeral_of_list(zero_tm, raw_list_of_num(@list.List([]), n_1))
  }
  mk_numeral_c.set(fn(x194 : @num.Num) -> @kernel.Term raise {
    let n_2 = x194
    if @num.lt_num(n_2, num_0) {
      raise Failure("mk_numeral: negative argument")
    } else {
      @kernel.mk_comb(numeral_tm, mk_raw_numeral(n_2))
    }
  })
}

///|
let mk_numeral_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_numeral",
)

///|
/// `mk_numeral`
pub fn mk_numeral(x : @num.Num) -> @kernel.Term raise {
  mk_numeral_c.get()(x)
}

///|
/// `mk_small_numeral`
pub fn mk_small_numeral(x195 : Int64) -> @kernel.Term raise {
  let n = x195
  mk_numeral(@num.num_of_int64(n))
}

///|
/// `dest_small_numeral`
pub fn dest_small_numeral(x196 : @kernel.Term) -> Int64 raise {
  let t = x196
  @num.int63_of_num(@basics.dest_numeral(t))
}

///|
/// is_numeral
fn step_25() -> Unit raise {
  is_numeral_c.set((x197 : @kernel.Term) => @lib.can(@basics.dest_numeral, x197))
}

///|
let is_numeral_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new(
  "is_numeral",
)

///|
/// `is_numeral`
pub fn is_numeral(x : @kernel.Term) -> Bool raise {
  is_numeral_c.get()(x)
}

///|
/// the_specifications
fn step_26() -> Unit raise {
  the_specifications_c.set(Ref::{ val: @list.List([]), })
}

///|
let the_specifications_c : @lib.Cell[
  Ref[@list.List[((@list.List[String], @kernel.Thm), @kernel.Thm)]],
] = @lib.Cell::new("the_specifications")

///|
/// `the_specifications`
pub fn the_specifications() -> Ref[
  @list.List[((@list.List[String], @kernel.Thm), @kernel.Thm)],
] {
  the_specifications_c.get()
}

///|
/// new_specification
fn step_27() -> Unit raise {
  let code : (String) -> @kernel.Term raise = fn(
    x198 : String,
  ) -> @kernel.Term raise {
    let c = x198
    mk_small_numeral(Int::to_int64(Char::to_int(@lib.ocaml_string_get(c, 0))))
  }
  let mk_code : (String) -> @kernel.Term raise = fn(
    x199 : String,
  ) -> @kernel.Term raise {
    let name = x199
    @lib.end_itlist(
      (x200 : @kernel.Term, x201 : @kernel.Term) => {
        @lib.curry(@pair.mk_pair, x200, x201)
      },
      @lib.map(code, @lib.explode(name)),
    )
  }
  let specify : (String) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x205 : String,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let name_1 = x205
    fn(x206 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x206
      let ntm = mk_code(name_1)
      let gv = @basics.genvar(@kernel.type_of(ntm))
      let t207 = @bool.gen(gv, th)
      let th0 = @equal.conv_rule(@simp.rewr_conv(@class.skolem_thm()), t207)
      let th1 = @equal.conv_rule(
        @equal.thenc(
          @equal.rator_conv(@simp.rewr_conv(@class.exists_thm())),
          @equal.beta_conv,
        ),
        th0,
      )
      let (l_1, r) = @kernel.dest_comb(@kernel.concl(th1))
      let rn = @kernel.mk_comb(r, ntm)
      let ty = @kernel.type_of(rn)
      let th2 = @pair.new_definition(
        @basics.mk_eq(@kernel.mk_var(name_1, ty), rn),
      )
      let t211 = @bool.spec(ntm, @equal.conv_rule(@equal.beta_conv, th1))
      @simp.gen_rewrite_rule(
        fn(
          x208 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s209 = @equal.once_depth_conv(x208)
          fn(x210 : @kernel.Term) -> @kernel.Thm raise { s209(x210) }
        },
        @list.List([@equal.gsym(th2)]),
      )(t211)
    }
  }
  fn specifies(
    x212 : @list.List[String],
    x213 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let names = x212
    let th_1 = x213
    match names {
      Empty => th_1
      More(name_2, tail=onames) => {
        let th_p = specify(name_2)(th_1)
        specifies(onames, th_p)
      }
    }
  }
  new_specification_c.set(fn(
    x214 : @list.List[String],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let names_1 = x214
    fn(x215 : @kernel.Thm) -> @kernel.Thm raise {
      let th_2 = x215
      let (asl, c_1) = @kernel.dest_thm(th_2)
      if !(asl == @list.List([])) {
        raise Failure("new_specification: Assumptions not allowed in theorem")
      } else if !(@kernel.frees(c_1) == @list.List([])) {
        raise Failure(
          "new_specification: Free variables in predicate: " +
          @lib.string_concat(
            ", ",
            @lib.map(
              fn(x216 : @kernel.Term) -> String raise {
                match x216 {
                  @kernel.Term::Var(name_3, _) => name_3
                  _ => raise @lib.MatchFailure("tscript.ml:286")
                }
              },
              @kernel.frees(c_1),
            ),
          ),
        )
      } else {
        let avs = @basics.strip_exists(c_1).0
        if (if Int::to_int64(@lib.length(names_1)) == 0L {
            true
          } else {
            let t217 = Int::to_int64(@lib.length(avs))
            Int::to_int64(@lib.length(names_1)) > t217
          }) {
          raise Failure(
            "new_specification: Unsuitable number of constant names",
          )
        } else if !check_distinct_l(names_1) {
          raise Failure("new_specification: Constant names not distinct")
        } else {
          try {
            let sth = @lib.find(
                fn(
                  x218 : ((@list.List[String], @kernel.Thm), @kernel.Thm),
                ) -> Bool raise {
                  let ((names_p, th_p_1), sth_p) = x218
                  if names_p == names_1 {
                    let t219 = @kernel.concl(th_2)
                    @basics.aconv(@kernel.concl(th_p_1), t219)
                  } else {
                    false
                  }
                },
                the_specifications().val,
              ).1
            @lib.warn(true, "Benign respecification")
            sth
          } catch {
            Failure(_) => {
              let sth_1 = specifies(names_1, th_2)
              {
                the_specifications().val = the_specifications().val.prepend(
                  ((names_1, th_2), sth_1),
                )
                ()
              }
              sth_1
            }
            e => raise e
          }
        }
      }
    }
  })
}

///|
let new_specification_c : @lib.Cell[
  (@list.List[String]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("new_specification")

///|
/// `new_specification`
pub fn new_specification(
  x : @list.List[String],
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  new_specification_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] check_distinct_l(
  x202 : @list.List[TA],
) -> Bool raise {
  let l = x202
  try {
    ignore(
      @lib.itlist(
        fn(x203 : TA, x204 : @list.List[TA]) -> @list.List[TA] raise {
          let t = x203
          let res = x204
          if @lib.mem(t, res) {
            @lib.failure()
          } else {
            res.prepend(t)
          }
        },
        l,
        @list.List([]),
      ),
    )
    true
  } catch {
    Failure(_) => false
    e => raise e
  }
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
}
