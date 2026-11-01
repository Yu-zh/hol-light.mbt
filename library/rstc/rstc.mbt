// Translated from upstream Library/rstc.ml; edit this file directly.

///|
/// Library/rstc.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// RULE_INDUCT_TAC
fn step_2() -> Unit raise {
  rule_induct_tac_c.set(fn(
    x4 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      (fn(
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
        (fn(
          x1 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          @tactics.match_mp_tac(@bool.disch_all(x1))
        })(@bool.spec_all(x2))
      })(@bool.undisch(x3))
    })(@bool.spec_all(x4))
  })
}

///|
let rule_induct_tac_c : @lib.Cell[(@kernel.Thm) -> @tactics.Tactic raise] = @lib.Cell::new(
  "RULE_INDUCT_TAC",
)

///|
/// `RULE_INDUCT_TAC`
pub fn rule_induct_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  rule_induct_tac_c.get()(x)
}

///|
/// SYM_ALT
fn step_3() -> Unit raise {
  let t15 = @tactics.first_assum(fn(
    x12 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s13 = @tactics.match_accept_tac(x12)
    fn(
      x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s13(x14)
    }
  })
  let t10 = @tactics.first_assum(fn(
    x7 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x7
    @simp.gen_rewrite_tac(
      fn(
        x9 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x9
      },
      @list.List([th]),
    )
  })
  let t6 = @tactics.first_assum(@tactics.match_mp_tac)
  let t11 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.eq_tac, @tactics.disch_tac),
      t6,
    ),
    t10,
  ])
  let t5 = @tactics.repeat_tac(@tactics.strip_tac)
  let t16 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
        t5,
      ),
      t11,
    ),
    t15,
  )
  sym_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) == (∀ x : A, ∀ y : A, R(x, y) == R(y, x))"),
      t16,
    ),
  )
}

///|
let sym_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYM_ALT")

///|
/// `SYM_ALT`
pub fn sym_alt() -> @kernel.Thm {
  sym_alt_c.get()
}

///|
/// TRANS_ALT
fn step_4() -> Unit raise {
  let t18 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @simp.once_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t19 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t17),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t18,
  )
  trans_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, ∀ U : (A, A) -> Bool, (∀ x : A, ∀ z : A, (∃ y : A, R(x, y) && S(y, z)) → U(x, z)) == (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && S(y, z) → U(x, z))"),
      t19,
    ),
  )
}

///|
let trans_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANS_ALT")

///|
/// `TRANS_ALT`
pub fn trans_alt() -> @kernel.Thm {
  trans_alt_c.get()
}

///|
let rc_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_RULES")

///|
/// `RC_RULES`
pub fn rc_rules() -> @kernel.Thm {
  rc_rules_c.get()
}

///|
let rc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_INDUCT")

///|
/// `RC_INDUCT`
pub fn rc_induct() -> @kernel.Thm {
  rc_induct_c.get()
}

///|
let rc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_CASES")

///|
/// `RC_CASES`
pub fn rc_cases() -> @kernel.Thm {
  rc_cases_c.get()
}

///|
/// RC_RULES, RC_INDUCT, RC_CASES
fn step_5() -> Unit raise {
  let (rc_rules, rc_induct, rc_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → (RC : ((A, A) -> Bool, A, A) -> Bool)(R, x, y)) && (∀ x : A, RC(R, x, x))"),
  )
  rc_rules_c.set(rc_rules)
  rc_induct_c.set(rc_induct)
  rc_cases_c.set(rc_cases)
}

///|
/// RC_INC
fn step_6() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([rc_rules()]))
  rc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → RC(R, x, y)"),
      t20,
    ),
  )
}

///|
let rc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_INC")

///|
/// `RC_INC`
pub fn rc_inc() -> @kernel.Thm {
  rc_inc_c.get()
}

///|
/// RC_REFL
fn step_7() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([rc_rules()]))
  rc_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, RC(R, x, x)"), t21),
  )
}

///|
let rc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_REFL")

///|
/// `RC_REFL`
pub fn rc_refl() -> @kernel.Thm {
  rc_refl_c.get()
}

///|
/// RC_EXPLICIT
fn step_8() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([rc_cases(), @theorems.eq_sym_eq()]))
  rc_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RC(R, x, y) == (R(x, y) || x == y)"),
      t22,
    ),
  )
}

///|
let rc_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_EXPLICIT")

///|
/// `RC_EXPLICIT`
pub fn rc_explicit() -> @kernel.Thm {
  rc_explicit_c.get()
}

///|
/// RC_MONO
fn step_9() -> Unit raise {
  let t23 = @meson.meson_tac(@list.List([rc_cases()]))
  rc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, RC(R, x, y) → RC(S, x, y))"),
      t23,
    ),
  )
}

///|
let rc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_MONO")

///|
/// `RC_MONO`
pub fn rc_mono() -> @kernel.Thm {
  rc_mono_c.get()
}

///|
/// RC_CLOSED
fn step_10() -> Unit raise {
  let t24 = @meson.meson_tac(@list.List([]))
  let t25 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), rc_explicit()])),
    t24,
  )
  rc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (RC(R) == R) == (∀ x : A, R(x, x))"),
      t25,
    ),
  )
}

///|
let rc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_CLOSED")

///|
/// `RC_CLOSED`
pub fn rc_closed() -> @kernel.Thm {
  rc_closed_c.get()
}

///|
/// RC_IDEMP
fn step_11() -> Unit raise {
  let t26 = @simp.rewrite_tac(@list.List([rc_closed(), rc_refl()]))
  rc_idemp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, RC(RC(R)) == RC(R)"), t26),
  )
}

///|
let rc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_IDEMP")

///|
/// `RC_IDEMP`
pub fn rc_idemp() -> @kernel.Thm {
  rc_idemp_c.get()
}

///|
/// RC_SYM
fn step_12() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([rc_cases()]))
  rc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) → (∀ x : A, ∀ y : A, RC(R, x, y) → RC(R, y, x))"),
      t27,
    ),
  )
}

///|
let rc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_SYM")

///|
/// `RC_SYM`
pub fn rc_sym() -> @kernel.Thm {
  rc_sym_c.get()
}

///|
/// RC_TRANS
fn step_13() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([]))
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rc_cases()])), t28)
  rc_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) → (∀ x : A, ∀ y : A, ∀ z : A, RC(R, x, y) && RC(R, y, z) → RC(R, x, z))"),
      t29,
    ),
  )
}

///|
let rc_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_TRANS")

///|
/// `RC_TRANS`
pub fn rc_trans() -> @kernel.Thm {
  rc_trans_c.get()
}

///|
let sc_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_RULES")

///|
/// `SC_RULES`
pub fn sc_rules() -> @kernel.Thm {
  sc_rules_c.get()
}

///|
let sc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_INDUCT")

///|
/// `SC_INDUCT`
pub fn sc_induct() -> @kernel.Thm {
  sc_induct_c.get()
}

///|
let sc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_CASES")

///|
/// `SC_CASES`
pub fn sc_cases() -> @kernel.Thm {
  sc_cases_c.get()
}

///|
/// SC_RULES, SC_INDUCT, SC_CASES
fn step_14() -> Unit raise {
  let (sc_rules, sc_induct, sc_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → (SC : ((A, A) -> Bool, A, A) -> Bool)(R, x, y)) && (∀ x : A, ∀ y : A, SC(R, x, y) → SC(R, y, x))"),
  )
  sc_rules_c.set(sc_rules)
  sc_induct_c.set(sc_induct)
  sc_cases_c.set(sc_cases)
}

///|
/// SC_INC
fn step_15() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([sc_rules()]))
  sc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → SC(R, x, y)"),
      t30,
    ),
  )
}

///|
let sc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_INC")

///|
/// `SC_INC`
pub fn sc_inc() -> @kernel.Thm {
  sc_inc_c.get()
}

///|
/// SC_SYM
fn step_16() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([sc_rules()]))
  sc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(R, x, y) → SC(R, y, x)"),
      t31,
    ),
  )
}

///|
let sc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_SYM")

///|
/// `SC_SYM`
pub fn sc_sym() -> @kernel.Thm {
  sc_sym_c.get()
}

///|
/// SC_EXPLICIT
fn step_17() -> Unit raise {
  let t33 = @meson.meson_tac(@list.List([sc_cases()]))
  let t32 = @meson.meson_tac(@list.List([]))
  let t34 = @list.List([
    @tactics.then_tac(rule_induct_tac(sc_induct()), t32),
    t33,
  ])
  let t35 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
    t34,
  )
  sc_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, SC(R, (x : A), (y : A)) == (R(x, y) || R(y, x))"),
      t35,
    ),
  )
}

///|
let sc_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_EXPLICIT")

///|
/// `SC_EXPLICIT`
pub fn sc_explicit() -> @kernel.Thm {
  sc_explicit_c.get()
}

///|
/// SC_MONO
fn step_18() -> Unit raise {
  let t36 = @meson.meson_tac(@list.List([sc_explicit()]))
  sc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, SC(R, x, y) → SC(S, x, y))"),
      t36,
    ),
  )
}

///|
let sc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_MONO")

///|
/// `SC_MONO`
pub fn sc_mono() -> @kernel.Thm {
  sc_mono_c.get()
}

///|
/// SC_CLOSED
fn step_19() -> Unit raise {
  let t37 = @meson.meson_tac(@list.List([]))
  let t38 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), sc_explicit()])),
    t37,
  )
  sc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (SC(R) == R) == (∀ x : A, ∀ y : A, R(x, y) → R(y, x))"),
      t38,
    ),
  )
}

///|
let sc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_CLOSED")

///|
/// `SC_CLOSED`
pub fn sc_closed() -> @kernel.Thm {
  sc_closed_c.get()
}

///|
/// SC_IDEMP
fn step_20() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([sc_closed(), sc_sym()]))
  sc_idemp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, SC(SC(R)) == SC(R)"), t39),
  )
}

///|
let sc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_IDEMP")

///|
/// `SC_IDEMP`
pub fn sc_idemp() -> @kernel.Thm {
  sc_idemp_c.get()
}

///|
/// SC_REFL
fn step_21() -> Unit raise {
  let t40 = @meson.meson_tac(@list.List([sc_explicit()]))
  sc_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, R(x, x)) → (∀ x : A, SC(R, x, x))"),
      t40,
    ),
  )
}

///|
let sc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_REFL")

///|
/// `SC_REFL`
pub fn sc_refl() -> @kernel.Thm {
  sc_refl_c.get()
}

///|
let tc_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_RULES")

///|
/// `TC_RULES`
pub fn tc_rules() -> @kernel.Thm {
  tc_rules_c.get()
}

///|
let tc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_INDUCT")

///|
/// `TC_INDUCT`
pub fn tc_induct() -> @kernel.Thm {
  tc_induct_c.get()
}

///|
let tc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_CASES")

///|
/// `TC_CASES`
pub fn tc_cases() -> @kernel.Thm {
  tc_cases_c.get()
}

///|
/// TC_RULES, TC_INDUCT, TC_CASES
fn step_22() -> Unit raise {
  let (tc_rules, tc_induct, tc_cases) = @ind_defs.new_inductive_definition(
    @term_syntax.parse_term("(∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → (TC : ((A, A) -> Bool, A, A) -> Bool)(R, x, y)) && (∀ x : A, ∀ y : A, ∀ z : A, TC(R, x, y) && TC(R, y, z) → TC(R, x, z))"),
  )
  tc_rules_c.set(tc_rules)
  tc_induct_c.set(tc_induct)
  tc_cases_c.set(tc_cases)
}

///|
/// TC_INC
fn step_23() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([tc_rules()]))
  tc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → TC(R, x, y)"),
      t41,
    ),
  )
}

///|
let tc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_INC")

///|
/// `TC_INC`
pub fn tc_inc() -> @kernel.Thm {
  tc_inc_c.get()
}

///|
/// TC_TRANS
fn step_24() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([tc_rules()]))
  tc_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, TC(R, x, y) && TC(R, y, z) → TC(R, x, z)"),
      t42,
    ),
  )
}

///|
let tc_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_TRANS")

///|
/// `TC_TRANS`
pub fn tc_trans() -> @kernel.Thm {
  tc_trans_c.get()
}

///|
/// TC_MONO
fn step_25() -> Unit raise {
  let t44 = @meson.asm_meson_tac(@list.List([tc_rules()]))
  let t43 = @tactics.match_mp_tac(tc_induct())
  let t45 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @tactics.strip_tac,
      ),
      t43,
    ),
    t44,
  )
  tc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, TC(R, x, y) → TC(S, x, y))"),
      t45,
    ),
  )
}

///|
let tc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_MONO")

///|
/// `TC_MONO`
pub fn tc_mono() -> @kernel.Thm {
  tc_mono_c.get()
}

///|
/// TC_CLOSED
fn step_26() -> Unit raise {
  let t49 = @meson.meson_tac(@list.List([tc_rules()]))
  let t48 = @meson.asm_meson_tac(@list.List([]))
  let t50 = @list.List([
    @tactics.then_tac(rule_induct_tac(tc_induct()), t48),
    t49,
  ])
  let t46 = @tactics.repeat_tac(@tactics.strip_tac)
  let t47 = @list.List([@meson.meson_tac(@list.List([tc_rules()])), t46])
  let t51 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
          ),
          @tactics.eq_tac,
        ),
        t47,
      ),
      @tactics.eq_tac,
    ),
    t50,
  )
  tc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (TC(R) == R) == (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z))"),
      t51,
    ),
  )
}

///|
let tc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_CLOSED")

///|
/// `TC_CLOSED`
pub fn tc_closed() -> @kernel.Thm {
  tc_closed_c.get()
}

///|
/// TC_IDEMP
fn step_27() -> Unit raise {
  let t52 = @simp.rewrite_tac(@list.List([tc_closed(), tc_trans()]))
  tc_idemp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, TC(TC(R)) == TC(R)"), t52),
  )
}

///|
let tc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_IDEMP")

///|
/// `TC_IDEMP`
pub fn tc_idemp() -> @kernel.Thm {
  tc_idemp_c.get()
}

///|
/// TC_REFL
fn step_28() -> Unit raise {
  let t53 = @meson.meson_tac(@list.List([tc_inc()]))
  tc_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, R(x, x)) → (∀ x : A, TC(R, x, x))"),
      t53,
    ),
  )
}

///|
let tc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_REFL")

///|
/// `TC_REFL`
pub fn tc_refl() -> @kernel.Thm {
  tc_refl_c.get()
}

///|
/// TC_SYM
fn step_29() -> Unit raise {
  let t55 = @meson.asm_meson_tac(@list.List([tc_rules()]))
  let t54 = @tactics.match_mp_tac(tc_induct())
  let t56 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
      t54,
    ),
    t55,
  )
  tc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) → (∀ x : A, ∀ y : A, TC(R, x, y) → TC(R, y, x))"),
      t56,
    ),
  )
}

///|
let tc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_SYM")

///|
/// `TC_SYM`
pub fn tc_sym() -> @kernel.Thm {
  tc_sym_c.get()
}

///|
/// RC_SC
fn step_30() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([]))
  let t58 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), rc_explicit(), sc_explicit()]),
    ),
    t57,
  )
  rc_sc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, RC(SC(R)) == SC(RC(R))"),
      t58,
    ),
  )
}

///|
let rc_sc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_SC")

///|
/// `RC_SC`
pub fn rc_sc() -> @kernel.Thm {
  rc_sc_c.get()
}

///|
/// SC_RC
fn step_31() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([rc_sc()]))
  sc_rc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, SC(RC(R)) == RC(SC(R))"),
      t59,
    ),
  )
}

///|
let sc_rc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_RC")

///|
/// `SC_RC`
pub fn sc_rc() -> @kernel.Thm {
  sc_rc_c.get()
}

///|
/// RC_TC
fn step_32() -> Unit raise {
  let t62 = @meson.meson_tac(@list.List([rc_trans(), tc_rules(), rc_mono()]))
  let t63 = @tactics.then_tac(rule_induct_tac(tc_induct()), t62)
  let t61 = @meson.meson_tac(@list.List([tc_rules(), rc_rules(), tc_mono()]))
  let t64 = @list.List([
    @tactics.then_tac(rule_induct_tac(rc_induct()), t61),
    t63,
  ])
  let t60 = @tactics.repeat_tac(@tactics.gen_tac)
  let t65 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
        t60,
      ),
      @tactics.eq_tac,
    ),
    t64,
  )
  rc_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, RC(TC(R)) == TC(RC(R))"),
      t65,
    ),
  )
}

///|
let rc_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_TC")

///|
/// `RC_TC`
pub fn rc_tc() -> @kernel.Thm {
  rc_tc_c.get()
}

///|
/// TC_RC
fn step_33() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([rc_tc()]))
  tc_rc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, TC(RC(R)) == RC(TC(R))"),
      t66,
    ),
  )
}

///|
let tc_rc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_RC")

///|
/// `TC_RC`
pub fn tc_rc() -> @kernel.Thm {
  tc_rc_c.get()
}

///|
/// TC_SC
fn step_34() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([tc_mono(), tc_sym(), sc_rules()]))
  let t68 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(sc_induct())),
    t67,
  )
  tc_sc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(TC(R), x, y) → TC(SC(R), x, y)"),
      t68,
    ),
  )
}

///|
let tc_sc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_SC")

///|
/// `TC_SC`
pub fn tc_sc() -> @kernel.Thm {
  tc_sc_c.get()
}

///|
/// SC_TC
fn step_35() -> Unit raise {
  let t69 = @simp.rewrite_tac(@list.List([tc_sc()]))
  sc_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(TC(R), x, y) → TC(SC(R), x, y)"),
      t69,
    ),
  )
}

///|
let sc_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_TC")

///|
/// `SC_TC`
pub fn sc_tc() -> @kernel.Thm {
  sc_tc_c.get()
}

///|
/// TC_TRANS_L
fn step_36() -> Unit raise {
  let t70 = @meson.meson_tac(@list.List([tc_rules()]))
  tc_trans_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, TC(R, x, y) && R(y, z) → TC(R, x, z)"),
      t70,
    ),
  )
}

///|
let tc_trans_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_TRANS_L")

///|
/// `TC_TRANS_L`
pub fn tc_trans_l() -> @kernel.Thm {
  tc_trans_l_c.get()
}

///|
/// TC_TRANS_R
fn step_37() -> Unit raise {
  let t71 = @meson.meson_tac(@list.List([tc_rules()]))
  tc_trans_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && TC(R, y, z) → TC(R, x, z)"),
      t71,
    ),
  )
}

///|
let tc_trans_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_TRANS_R")

///|
/// `TC_TRANS_R`
pub fn tc_trans_r() -> @kernel.Thm {
  tc_trans_r_c.get()
}

///|
/// TC_CASES_L
fn step_38() -> Unit raise {
  let t73 = @meson.meson_tac(@list.List([tc_rules()]))
  let t72 = @meson.meson_tac(@list.List([tc_rules()]))
  let t74 = @list.List([
    @tactics.then_tac(rule_induct_tac(tc_induct()), t72),
    t73,
  ])
  let t75 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t74,
  )
  tc_cases_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, TC(R, x, z) == (R(x, z) || (∃ y : A, TC(R, x, y) && R(y, z)))"),
      t75,
    ),
  )
}

///|
let tc_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_CASES_L")

///|
/// `TC_CASES_L`
pub fn tc_cases_l() -> @kernel.Thm {
  tc_cases_l_c.get()
}

///|
/// TC_CASES_R
fn step_39() -> Unit raise {
  let t77 = @meson.meson_tac(@list.List([tc_rules()]))
  let t76 = @meson.meson_tac(@list.List([tc_rules()]))
  let t78 = @list.List([
    @tactics.then_tac(rule_induct_tac(tc_induct()), t76),
    t77,
  ])
  let t79 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t78,
  )
  tc_cases_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, TC(R, x, z) == (R(x, z) || (∃ y : A, R(x, y) && TC(R, y, z)))"),
      t79,
    ),
  )
}

///|
let tc_cases_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_CASES_R")

///|
/// `TC_CASES_R`
pub fn tc_cases_r() -> @kernel.Thm {
  tc_cases_r_c.get()
}

///|
/// TC_INDUCT_L
fn step_40() -> Unit raise {
  let t85 = @meson.asm_meson_tac(@list.List([tc_cases_r()]))
  let t84 = @meson.asm_meson_tac(@list.List([]))
  let t86 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(tc_induct()), t84),
    t85,
  ])
  let t83 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : A, ∀ z : A, TC((R : (A, A) -> Bool), y, z) → (∀ x : A, (P : (A, A) -> Bool)(x, y) → P(x, z))"),
    fn(
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
    },
  )
  let t87 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @tactics.strip_tac,
      ),
      t83,
    ),
    t86,
  )
  tc_induct_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, ∀ y : A, ∀ z : A, P(x, y) && R(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, TC(R, x, y) → P(x, y))"),
      t87,
    ),
  )
}

///|
let tc_induct_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_INDUCT_L")

///|
/// `TC_INDUCT_L`
pub fn tc_induct_l() -> @kernel.Thm {
  tc_induct_l_c.get()
}

///|
/// TC_INDUCT_R
fn step_41() -> Unit raise {
  let t93 = @meson.asm_meson_tac(@list.List([tc_cases_l()]))
  let t92 = @meson.asm_meson_tac(@list.List([]))
  let t94 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(tc_induct()), t92),
    t93,
  ])
  let t91 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, TC((R : (A, A) -> Bool), x, y) → (∀ z : A, (P : (A, A) -> Bool)(y, z) → P(x, z))"),
    fn(
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
      let s89 = @tactics.mp_tac(x88)
      fn(
        x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s89(x90)
      }
    },
  )
  let t95 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(@tactics.gen_tac),
        @tactics.strip_tac,
      ),
      t91,
    ),
    t94,
  )
  tc_induct_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, ∀ z : A, (∃ y : A, R(x, y) && P(y, z)) → P(x, z)) → (∀ x : A, ∀ y : A, TC(R, x, y) → P(x, y))"),
      t95,
    ),
  )
}

///|
let tc_induct_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_INDUCT_R")

///|
/// `TC_INDUCT_R`
pub fn tc_induct_r() -> @kernel.Thm {
  tc_induct_r_c.get()
}

///|
/// WF_TC
fn step_42() -> Unit raise {
  let t105 = @meson.meson_tac(@list.List([tc_cases_l()]))
  let t104 = @simp.rewrite_tac(@list.List([]))
  let t100 = @term_syntax.parse_term("(y : A) => ∃ z : A, (P : (A) -> Bool)(z) && TC((R : (A, A) -> Bool), z, y)")
  let t103 = @tactics.first_x_assum(fn(
    x102 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x97 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s98 = @tactics.mp_tac(x97)
      fn(
        x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s98(x99)
      }
    })(((x101 : @kernel.Thm) => @bool.spec(t100, x101))(x102))
  })
  let t96 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)"))
  let t106 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@wf.wf()])),
            @tactics.disch_tac,
          ),
          t96,
        ),
        t103,
      ),
      t104,
    ),
    t105,
  )
  let t107 = @list.List([
    @meson.meson_tac(@list.List([@wf.wf_subset(), tc_inc()])),
    t106,
  ])
  let t108 = @tactics.thenl(
    @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
    t107,
  )
  wf_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, WF(TC(R)) == WF(R)"),
      t108,
    ),
  )
}

///|
let wf_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_TC")

///|
/// `WF_TC`
pub fn wf_tc() -> @kernel.Thm {
  wf_tc_c.get()
}

///|
/// RSC
fn step_43() -> Unit raise {
  rsc_c.set(
    @pair.new_definition(@term_syntax.parse_term("(RSC : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == RC(SC(R))")),
  )
}

///|
let rsc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC")

///|
/// `RSC`
pub fn rsc() -> @kernel.Thm {
  rsc_c.get()
}

///|
/// RSC_INC
fn step_44() -> Unit raise {
  let t109 = @meson.meson_tac(@list.List([rc_inc(), sc_inc()]))
  let t110 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rsc()])), t109)
  rsc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → RSC(R, x, y)"),
      t110,
    ),
  )
}

///|
let rsc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_INC")

///|
/// `RSC_INC`
pub fn rsc_inc() -> @kernel.Thm {
  rsc_inc_c.get()
}

///|
/// RSC_REFL
fn step_45() -> Unit raise {
  let t111 = @simp.rewrite_tac(@list.List([rsc(), rc_refl()]))
  rsc_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, RSC(R, x, x)"), t111),
  )
}

///|
let rsc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_REFL")

///|
/// `RSC_REFL`
pub fn rsc_refl() -> @kernel.Thm {
  rsc_refl_c.get()
}

///|
/// RSC_SYM
fn step_46() -> Unit raise {
  let t112 = @simp.rewrite_tac(@list.List([rsc(), rc_sc(), sc_sym()]))
  rsc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RSC(R, x, y) → RSC(R, y, x)"),
      t112,
    ),
  )
}

///|
let rsc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_SYM")

///|
/// `RSC_SYM`
pub fn rsc_sym() -> @kernel.Thm {
  rsc_sym_c.get()
}

///|
/// RSC_CASES
fn step_47() -> Unit raise {
  let t113 = @simp.rewrite_tac(
    @list.List([rsc(), rc_explicit(), sc_explicit(), @theorems.disj_aci()]),
  )
  rsc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RSC(R, x, y) == (x == y || R(x, y) || R(y, x))"),
      t113,
    ),
  )
}

///|
let rsc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_CASES")

///|
/// `RSC_CASES`
pub fn rsc_cases() -> @kernel.Thm {
  rsc_cases_c.get()
}

///|
/// RSC_INDUCT
fn step_48() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([]))
  let t115 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rsc(), rc_explicit(), sc_explicit()])),
    t114,
  )
  rsc_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, P(x, x)) && (∀ x : A, ∀ y : A, P(x, y) → P(y, x)) → (∀ x : A, ∀ y : A, RSC(R, x, y) → P(x, y))"),
      t115,
    ),
  )
}

///|
let rsc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_INDUCT")

///|
/// `RSC_INDUCT`
pub fn rsc_induct() -> @kernel.Thm {
  rsc_induct_c.get()
}

///|
/// RSC_MONO
fn step_49() -> Unit raise {
  let t116 = @meson.meson_tac(@list.List([sc_mono(), rc_mono()]))
  let t117 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rsc()])), t116)
  rsc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, RSC(R, x, y) → RSC(S, x, y))"),
      t117,
    ),
  )
}

///|
let rsc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_MONO")

///|
/// `RSC_MONO`
pub fn rsc_mono() -> @kernel.Thm {
  rsc_mono_c.get()
}

///|
/// RSC_CLOSED
fn step_50() -> Unit raise {
  let t118 = @meson.meson_tac(@list.List([]))
  let t119 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), rsc(), rc_explicit(), sc_explicit()]),
    ),
    t118,
  )
  rsc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (RSC(R) == R) == ((∀ x : A, R(x, x)) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)))"),
      t119,
    ),
  )
}

///|
let rsc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_CLOSED")

///|
/// `RSC_CLOSED`
pub fn rsc_closed() -> @kernel.Thm {
  rsc_closed_c.get()
}

///|
/// RSC_IDEMP
fn step_51() -> Unit raise {
  let t120 = @simp.rewrite_tac(
    @list.List([rsc_closed(), rsc_refl(), rsc_sym()]),
  )
  rsc_idemp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, RSC(RSC(R)) == RSC(R)"),
      t120,
    ),
  )
}

///|
let rsc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_IDEMP")

///|
/// `RSC_IDEMP`
pub fn rsc_idemp() -> @kernel.Thm {
  rsc_idemp_c.get()
}

///|
/// RTC
fn step_52() -> Unit raise {
  rtc_c.set(
    @pair.new_definition(@term_syntax.parse_term("(RTC : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == RC(TC(R))")),
  )
}

///|
let rtc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC")

///|
/// `RTC`
pub fn rtc() -> @kernel.Thm {
  rtc_c.get()
}

///|
/// RTC_INC
fn step_53() -> Unit raise {
  let t121 = @meson.meson_tac(@list.List([rc_inc(), tc_inc()]))
  let t122 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rtc()])), t121)
  rtc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → RTC(R, x, y)"),
      t122,
    ),
  )
}

///|
let rtc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INC")

///|
/// `RTC_INC`
pub fn rtc_inc() -> @kernel.Thm {
  rtc_inc_c.get()
}

///|
/// RTC_REFL
fn step_54() -> Unit raise {
  let t123 = @simp.rewrite_tac(@list.List([rtc(), rc_refl()]))
  rtc_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, RTC(R, x, x)"), t123),
  )
}

///|
let rtc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_REFL")

///|
/// `RTC_REFL`
pub fn rtc_refl() -> @kernel.Thm {
  rtc_refl_c.get()
}

///|
/// RTC_TRANS
fn step_55() -> Unit raise {
  let t124 = @simp.rewrite_tac(@list.List([rtc(), rc_tc(), tc_trans()]))
  rtc_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, RTC(R, x, y) && RTC(R, y, z) → RTC(R, x, z)"),
      t124,
    ),
  )
}

///|
let rtc_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_TRANS")

///|
/// `RTC_TRANS`
pub fn rtc_trans() -> @kernel.Thm {
  rtc_trans_c.get()
}

///|
/// RTC_RULES
fn step_56() -> Unit raise {
  let t125 = @simp.rewrite_tac(@list.List([rtc_inc(), rtc_refl(), rtc_trans()]))
  rtc_rules_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → RTC(R, x, y)) && (∀ x : A, RTC(R, x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, RTC(R, x, y) && RTC(R, y, z) → RTC(R, x, z))"),
      t125,
    ),
  )
}

///|
let rtc_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_RULES")

///|
/// `RTC_RULES`
pub fn rtc_rules() -> @kernel.Thm {
  rtc_rules_c.get()
}

///|
/// RTC_TRANS_L
fn step_57() -> Unit raise {
  let t126 = @meson.meson_tac(@list.List([tc_trans_l(), rc_inc()]))
  let t127 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_tc()])),
    t126,
  )
  rtc_trans_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, RTC(R, x, y) && R(y, z) → RTC(R, x, z)"),
      t127,
    ),
  )
}

///|
let rtc_trans_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_TRANS_L")

///|
/// `RTC_TRANS_L`
pub fn rtc_trans_l() -> @kernel.Thm {
  rtc_trans_l_c.get()
}

///|
/// RTC_TRANS_R
fn step_58() -> Unit raise {
  let t128 = @meson.meson_tac(@list.List([tc_trans_r(), rc_inc()]))
  let t129 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_tc()])),
    t128,
  )
  rtc_trans_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && RTC(R, y, z) → RTC(R, x, z)"),
      t129,
    ),
  )
}

///|
let rtc_trans_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_TRANS_R")

///|
/// `RTC_TRANS_R`
pub fn rtc_trans_r() -> @kernel.Thm {
  rtc_trans_r_c.get()
}

///|
/// RTC_CASES
fn step_59() -> Unit raise {
  let t130 = @meson.meson_tac(@list.List([tc_trans()]))
  let t131 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_explicit()])),
    t130,
  )
  rtc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RTC(R, x, z) == (x == z || (∃ y : A, RTC(R, x, y) && RTC(R, y, z)))"),
      t131,
    ),
  )
}

///|
let rtc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_CASES")

///|
/// `RTC_CASES`
pub fn rtc_cases() -> @kernel.Thm {
  rtc_cases_c.get()
}

///|
/// RTC_CASES_L
fn step_60() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([tc_cases_l(), tc_trans_l()]))
  let t133 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_explicit()])),
    t132,
  )
  rtc_cases_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RTC(R, x, z) == (x == z || (∃ y : A, RTC(R, x, y) && R(y, z)))"),
      t133,
    ),
  )
}

///|
let rtc_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_CASES_L")

///|
/// `RTC_CASES_L`
pub fn rtc_cases_l() -> @kernel.Thm {
  rtc_cases_l_c.get()
}

///|
/// RTC_CASES_R
fn step_61() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([tc_cases_r(), tc_trans_r()]))
  let t135 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_explicit()])),
    t134,
  )
  rtc_cases_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RTC(R, x, z) == (x == z || (∃ y : A, R(x, y) && RTC(R, y, z)))"),
      t135,
    ),
  )
}

///|
let rtc_cases_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_CASES_R")

///|
/// `RTC_CASES_R`
pub fn rtc_cases_r() -> @kernel.Thm {
  rtc_cases_r_c.get()
}

///|
/// RTC_INDUCT
fn step_62() -> Unit raise {
  let t139 = @meson.asm_meson_tac(@list.List([]))
  let t138 = @simp.rewrite_tac(@list.List([rc_explicit()]))
  let t137 = @tactics.match_mp_tac(tc_induct())
  let t136 = @simp.rewrite_tac(@list.List([rtc(), rc_tc()]))
  let t140 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t136,
        ),
        t137,
      ),
      t138,
    ),
    t139,
  )
  rtc_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, P(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, P(x, y) && P(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, RTC(R, x, y) → P(x, y))"),
      t140,
    ),
  )
}

///|
let rtc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INDUCT")

///|
/// `RTC_INDUCT`
pub fn rtc_induct() -> @kernel.Thm {
  rtc_induct_c.get()
}

///|
/// RTC_INDUCT_L
fn step_63() -> Unit raise {
  let t144 = @meson.asm_meson_tac(@list.List([]))
  let t143 = @simp.rewrite_tac(@list.List([rc_explicit()]))
  let t142 = @tactics.match_mp_tac(tc_induct_l())
  let t141 = @simp.rewrite_tac(@list.List([rtc(), rc_tc()]))
  let t145 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t141,
        ),
        t142,
      ),
      t143,
    ),
    t144,
  )
  rtc_induct_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, P(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, P(x, y) && R(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, RTC(R, x, y) → P(x, y))"),
      t145,
    ),
  )
}

///|
let rtc_induct_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INDUCT_L")

///|
/// `RTC_INDUCT_L`
pub fn rtc_induct_l() -> @kernel.Thm {
  rtc_induct_l_c.get()
}

///|
/// RTC_INDUCT_R
fn step_64() -> Unit raise {
  let t149 = @meson.asm_meson_tac(@list.List([]))
  let t148 = @simp.rewrite_tac(@list.List([rc_explicit()]))
  let t147 = @tactics.match_mp_tac(tc_induct_r())
  let t146 = @simp.rewrite_tac(@list.List([rtc(), rc_tc()]))
  let t150 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t146,
        ),
        t147,
      ),
      t148,
    ),
    t149,
  )
  rtc_induct_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, P(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && P(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, RTC(R, x, y) → P(x, y))"),
      t150,
    ),
  )
}

///|
let rtc_induct_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INDUCT_R")

///|
/// `RTC_INDUCT_R`
pub fn rtc_induct_r() -> @kernel.Thm {
  rtc_induct_r_c.get()
}

///|
/// RTC_MONO
fn step_65() -> Unit raise {
  let t151 = @meson.meson_tac(@list.List([rc_mono(), tc_mono()]))
  let t152 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rtc()])), t151)
  rtc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, RTC(R, x, y) → RTC(S, x, y))"),
      t152,
    ),
  )
}

///|
let rtc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_MONO")

///|
/// `RTC_MONO`
pub fn rtc_mono() -> @kernel.Thm {
  rtc_mono_c.get()
}

///|
/// RTC_CLOSED
fn step_66() -> Unit raise {
  let t153 = @meson.meson_tac(@list.List([tc_closed(), tc_rules()]))
  let t154 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), rtc(), rc_explicit()])),
    t153,
  )
  rtc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (RTC(R) == R) == ((∀ x : A, R(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)))"),
      t154,
    ),
  )
}

///|
let rtc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_CLOSED")

///|
/// `RTC_CLOSED`
pub fn rtc_closed() -> @kernel.Thm {
  rtc_closed_c.get()
}

///|
/// RTC_IDEMP
fn step_67() -> Unit raise {
  let t155 = @simp.rewrite_tac(
    @list.List([rtc_closed(), rtc_refl(), rtc_trans()]),
  )
  rtc_idemp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, RTC(RTC(R)) == RTC(R)"),
      t155,
    ),
  )
}

///|
let rtc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_IDEMP")

///|
/// `RTC_IDEMP`
pub fn rtc_idemp() -> @kernel.Thm {
  rtc_idemp_c.get()
}

///|
/// RTC_SYM
fn step_68() -> Unit raise {
  let t156 = @meson.meson_tac(@list.List([rc_sym(), tc_sym()]))
  let t157 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rtc()])), t156)
  rtc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) → (∀ x : A, ∀ y : A, RTC(R, x, y) → RTC(R, y, x))"),
      t157,
    ),
  )
}

///|
let rtc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_SYM")

///|
/// `RTC_SYM`
pub fn rtc_sym() -> @kernel.Thm {
  rtc_sym_c.get()
}

///|
/// RTC_STUTTER
fn step_69() -> Unit raise {
  let t160 = @meson.meson_tac(@list.List([]))
  let t159 = @simp.rewrite_tac(@list.List([rc_cases()]))
  let t158 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t161 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([rc_tc(), rtc()])),
          @tactics.ap_term_tac,
        ),
        t158,
      ),
      t159,
    ),
    t160,
  )
  rtc_stutter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("RTC((R : (_, _) -> Bool)) == RTC((x : _) => (y : _) => R(x, y) && !(x == y))"),
      t161,
    ),
  )
}

///|
let rtc_stutter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_STUTTER")

///|
/// `RTC_STUTTER`
pub fn rtc_stutter() -> @kernel.Thm {
  rtc_stutter_c.get()
}

///|
/// TC_RTC_CASES_L
fn step_70() -> Unit raise {
  let t162 = @meson.meson_tac(@list.List([tc_cases_l(), tc_inc()]))
  let t163 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_cases()])),
    t162,
  )
  tc_rtc_cases_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("TC((R : (_, _) -> Bool), (x : _), (z : _)) == (∃ y : _, RTC(R, x, y) && R(y, z))"),
      t163,
    ),
  )
}

///|
let tc_rtc_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_RTC_CASES_L")

///|
/// `TC_RTC_CASES_L`
pub fn tc_rtc_cases_l() -> @kernel.Thm {
  tc_rtc_cases_l_c.get()
}

///|
/// TC_RTC_CASES_R
fn step_71() -> Unit raise {
  let t164 = @meson.meson_tac(@list.List([tc_cases_r(), tc_inc()]))
  let t165 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_cases()])),
    t164,
  )
  tc_rtc_cases_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ x : _, ∀ z : _, TC(R, x, z) == (∃ y : _, R(x, y) && RTC(R, y, z))"),
      t165,
    ),
  )
}

///|
let tc_rtc_cases_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_RTC_CASES_R")

///|
/// `TC_RTC_CASES_R`
pub fn tc_rtc_cases_r() -> @kernel.Thm {
  tc_rtc_cases_r_c.get()
}

///|
/// TC_TC_RTC_CASES
fn step_72() -> Unit raise {
  let t166 = @meson.meson_tac(@list.List([tc_trans()]))
  let t167 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_cases()])),
    t166,
  )
  tc_tc_rtc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ x : _, ∀ z : _, TC(R, x, z) == (∃ y : _, TC(R, x, y) && RTC(R, y, z))"),
      t167,
    ),
  )
}

///|
let tc_tc_rtc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TC_TC_RTC_CASES",
)

///|
/// `TC_TC_RTC_CASES`
pub fn tc_tc_rtc_cases() -> @kernel.Thm {
  tc_tc_rtc_cases_c.get()
}

///|
/// TC_RTC_TC_CASES
fn step_73() -> Unit raise {
  let t168 = @meson.meson_tac(@list.List([tc_trans()]))
  let t169 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rtc(), rc_cases()])),
    t168,
  )
  tc_rtc_tc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ x : _, ∀ z : _, TC(R, x, z) == (∃ y : _, RTC(R, x, y) && TC(R, y, z))"),
      t169,
    ),
  )
}

///|
let tc_rtc_tc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TC_RTC_TC_CASES",
)

///|
/// `TC_RTC_TC_CASES`
pub fn tc_rtc_tc_cases() -> @kernel.Thm {
  tc_rtc_tc_cases_c.get()
}

///|
/// RTC_NE_IMP_TC
fn step_74() -> Unit raise {
  let t172 = @meson.meson_tac(@list.List([tc_inc(), tc_cases()]))
  let t171 = @simp.rewrite_tac(@list.List([]))
  let t170 = @tactics.match_mp_tac(rtc_induct())
  let t173 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.once_rewrite_tac(@list.List([@equal.gsym(@theorems.imp_imp())])),
        ),
        t170,
      ),
      t171,
    ),
    t172,
  )
  rtc_ne_imp_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ x : _, ∀ y : _, RTC(R, x, y) && !(x == y) → TC(R, x, y)"),
      t173,
    ),
  )
}

///|
let rtc_ne_imp_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_NE_IMP_TC")

///|
/// `RTC_NE_IMP_TC`
pub fn rtc_ne_imp_tc() -> @kernel.Thm {
  rtc_ne_imp_tc_c.get()
}

///|
/// STC
fn step_75() -> Unit raise {
  stc_c.set(
    @pair.new_definition(@term_syntax.parse_term("(STC : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == TC(SC(R))")),
  )
}

///|
let stc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC")

///|
/// `STC`
pub fn stc() -> @kernel.Thm {
  stc_c.get()
}

///|
/// STC_INC
fn step_76() -> Unit raise {
  let t174 = @meson.meson_tac(@list.List([sc_inc(), tc_inc()]))
  let t175 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t174)
  stc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → STC(R, x, y)"),
      t175,
    ),
  )
}

///|
let stc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_INC")

///|
/// `STC_INC`
pub fn stc_inc() -> @kernel.Thm {
  stc_inc_c.get()
}

///|
/// STC_SYM
fn step_77() -> Unit raise {
  let t176 = @meson.meson_tac(@list.List([tc_sym(), sc_sym()]))
  let t177 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t176)
  stc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, STC(R, x, y) → STC(R, y, x)"),
      t177,
    ),
  )
}

///|
let stc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_SYM")

///|
/// `STC_SYM`
pub fn stc_sym() -> @kernel.Thm {
  stc_sym_c.get()
}

///|
/// STC_TRANS
fn step_78() -> Unit raise {
  let t178 = @simp.rewrite_tac(@list.List([stc(), tc_trans()]))
  stc_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, STC(R, x, y) && STC(R, y, z) → STC(R, x, z)"),
      t178,
    ),
  )
}

///|
let stc_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_TRANS")

///|
/// `STC_TRANS`
pub fn stc_trans() -> @kernel.Thm {
  stc_trans_c.get()
}

///|
/// STC_TRANS_L
fn step_79() -> Unit raise {
  let t179 = @meson.meson_tac(@list.List([tc_trans_l(), sc_inc()]))
  let t180 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t179)
  stc_trans_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, STC(R, x, y) && R(y, z) → STC(R, x, z)"),
      t180,
    ),
  )
}

///|
let stc_trans_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_TRANS_L")

///|
/// `STC_TRANS_L`
pub fn stc_trans_l() -> @kernel.Thm {
  stc_trans_l_c.get()
}

///|
/// STC_TRANS_R
fn step_80() -> Unit raise {
  let t181 = @meson.meson_tac(@list.List([tc_trans_r(), sc_inc()]))
  let t182 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t181)
  stc_trans_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && STC(R, y, z) → STC(R, x, z)"),
      t182,
    ),
  )
}

///|
let stc_trans_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_TRANS_R")

///|
/// `STC_TRANS_R`
pub fn stc_trans_r() -> @kernel.Thm {
  stc_trans_r_c.get()
}

///|
/// STC_CASES
fn step_81() -> Unit raise {
  let t183 = @meson.meson_tac(
    @list.List([sc_sym(), tc_sym(), tc_inc(), tc_trans(), sc_inc()]),
  )
  let t184 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t183)
  stc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, STC(R, x, z) == (R(x, z) || STC(R, z, x) || (∃ y : A, STC(R, x, y) && STC(R, y, z)))"),
      t184,
    ),
  )
}

///|
let stc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_CASES")

///|
/// `STC_CASES`
pub fn stc_cases() -> @kernel.Thm {
  stc_cases_c.get()
}

///|
/// STC_CASES_L
fn step_82() -> Unit raise {
  let t185 = @meson.meson_tac(
    @list.List([sc_sym(), tc_sym(), tc_inc(), tc_trans(), sc_inc()]),
  )
  let t186 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t185)
  stc_cases_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, STC(R, x, z) == (R(x, z) || STC(R, z, x) || (∃ y : A, STC(R, x, y) && R(y, z)))"),
      t186,
    ),
  )
}

///|
let stc_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_CASES_L")

///|
/// `STC_CASES_L`
pub fn stc_cases_l() -> @kernel.Thm {
  stc_cases_l_c.get()
}

///|
/// STC_CASES_R
fn step_83() -> Unit raise {
  let t187 = @meson.meson_tac(
    @list.List([sc_sym(), tc_sym(), tc_inc(), tc_trans(), sc_inc()]),
  )
  let t188 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t187)
  stc_cases_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, STC(R, x, z) == (R(x, z) || STC(R, z, x) || (∃ y : A, R(x, y) && STC(R, y, z)))"),
      t188,
    ),
  )
}

///|
let stc_cases_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_CASES_R")

///|
/// `STC_CASES_R`
pub fn stc_cases_r() -> @kernel.Thm {
  stc_cases_r_c.get()
}

///|
/// STC_INDUCT
fn step_84() -> Unit raise {
  let t191 = @meson.asm_meson_tac(@list.List([sc_explicit()]))
  let t190 = @tactics.match_mp_tac(tc_induct())
  let t189 = @simp.rewrite_tac(@list.List([stc()]))
  let t192 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.strip_tac,
        ),
        t189,
      ),
      t190,
    ),
    t191,
  )
  stc_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, ∀ y : A, P(x, y) → P(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, P(x, y) && P(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, STC(R, x, y) → P(x, y))"),
      t192,
    ),
  )
}

///|
let stc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_INDUCT")

///|
/// `STC_INDUCT`
pub fn stc_induct() -> @kernel.Thm {
  stc_induct_c.get()
}

///|
/// STC_MONO
fn step_85() -> Unit raise {
  let t193 = @meson.meson_tac(@list.List([sc_mono(), tc_mono()]))
  let t194 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t193)
  stc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, STC(R, x, y) → STC(S, x, y))"),
      t194,
    ),
  )
}

///|
let stc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_MONO")

///|
/// `STC_MONO`
pub fn stc_mono() -> @kernel.Thm {
  stc_mono_c.get()
}

///|
/// STC_CLOSED
fn step_86() -> Unit raise {
  let t201 = @meson.meson_tac(@list.List([]))
  let t200 = @equal.gsym(tc_closed())
  let t202 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(sc_closed()), t200])),
    t201,
  )
  let t199 = @meson.meson_tac(@list.List([tc_trans(), tc_sym(), sc_sym()]))
  let t203 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x198 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x195 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s196 = @tactics.subst1_tac(x195)
          fn(
            x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s196(x197)
          }
        })(@equal.sym(x198))
      }),
      t199,
    ),
    t202,
  ])
  let t204 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([stc(), sc_explicit()])),
      ),
      @tactics.eq_tac,
    ),
    t203,
  )
  stc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (STC(R) == R) == ((∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)))"),
      t204,
    ),
  )
}

///|
let stc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_CLOSED")

///|
/// `STC_CLOSED`
pub fn stc_closed() -> @kernel.Thm {
  stc_closed_c.get()
}

///|
/// STC_IDEMP
fn step_87() -> Unit raise {
  let t205 = @simp.rewrite_tac(
    @list.List([stc_closed(), stc_sym(), stc_trans()]),
  )
  stc_idemp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, STC(STC(R)) == STC(R)"),
      t205,
    ),
  )
}

///|
let stc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_IDEMP")

///|
/// `STC_IDEMP`
pub fn stc_idemp() -> @kernel.Thm {
  stc_idemp_c.get()
}

///|
/// STC_REFL
fn step_88() -> Unit raise {
  let t206 = @meson.meson_tac(@list.List([stc_inc()]))
  stc_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, R(x, x)) → (∀ x : A, STC(R, x, x))"),
      t206,
    ),
  )
}

///|
let stc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_REFL")

///|
/// `STC_REFL`
pub fn stc_refl() -> @kernel.Thm {
  stc_refl_c.get()
}

///|
/// RSTC
fn step_89() -> Unit raise {
  rstc_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(RSTC : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == RC(TC(SC(R)))"),
    ),
  )
}

///|
let rstc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC")

///|
/// `RSTC`
pub fn rstc() -> @kernel.Thm {
  rstc_c.get()
}

///|
/// RSTC_INC
fn step_90() -> Unit raise {
  let t207 = @meson.meson_tac(@list.List([rc_inc(), tc_inc(), sc_inc()]))
  let t208 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rstc()])), t207)
  rstc_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, R(x, y) → RSTC(R, x, y)"),
      t208,
    ),
  )
}

///|
let rstc_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC")

///|
/// `RSTC_INC`
pub fn rstc_inc() -> @kernel.Thm {
  rstc_inc_c.get()
}

///|
/// RSTC_REFL
fn step_91() -> Unit raise {
  let t209 = @simp.rewrite_tac(@list.List([rstc(), rc_refl()]))
  rstc_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, RSTC(R, x, x)"), t209),
  )
}

///|
let rstc_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_REFL")

///|
/// `RSTC_REFL`
pub fn rstc_refl() -> @kernel.Thm {
  rstc_refl_c.get()
}

///|
/// RSTC_SYM
fn step_92() -> Unit raise {
  let t210 = @meson.meson_tac(@list.List([sc_sym(), tc_sym(), rc_sym()]))
  let t211 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rstc()])), t210)
  rstc_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RSTC(R, x, y) → RSTC(R, y, x)"),
      t211,
    ),
  )
}

///|
let rstc_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_SYM")

///|
/// `RSTC_SYM`
pub fn rstc_sym() -> @kernel.Thm {
  rstc_sym_c.get()
}

///|
/// RSTC_TRANS
fn step_93() -> Unit raise {
  let t212 = @simp.rewrite_tac(@list.List([rstc(), rc_tc(), tc_trans()]))
  rstc_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, RSTC(R, x, y) && RSTC(R, y, z) → RSTC(R, x, z)"),
      t212,
    ),
  )
}

///|
let rstc_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_TRANS")

///|
/// `RSTC_TRANS`
pub fn rstc_trans() -> @kernel.Thm {
  rstc_trans_c.get()
}

///|
/// RSTC_RULES
fn step_94() -> Unit raise {
  let t213 = @simp.rewrite_tac(
    @list.List([rstc_inc(), rstc_refl(), rstc_sym(), rstc_trans()]),
  )
  rstc_rules_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → RSTC(R, x, y)) && (∀ x : A, RSTC(R, x, x)) && (∀ x : A, ∀ y : A, RSTC(R, x, y) → RSTC(R, y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, RSTC(R, x, y) && RSTC(R, y, z) → RSTC(R, x, z))"),
      t213,
    ),
  )
}

///|
let rstc_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_RULES")

///|
/// `RSTC_RULES`
pub fn rstc_rules() -> @kernel.Thm {
  rstc_rules_c.get()
}

///|
/// RSTC_TRANS_L
fn step_95() -> Unit raise {
  let t214 = @meson.meson_tac(@list.List([tc_trans_l(), rc_inc(), sc_inc()]))
  let t215 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rstc(), rc_tc()])),
    t214,
  )
  rstc_trans_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, RSTC(R, x, y) && R(y, z) → RSTC(R, x, z)"),
      t215,
    ),
  )
}

///|
let rstc_trans_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_TRANS_L")

///|
/// `RSTC_TRANS_L`
pub fn rstc_trans_l() -> @kernel.Thm {
  rstc_trans_l_c.get()
}

///|
/// RSTC_TRANS_R
fn step_96() -> Unit raise {
  let t216 = @meson.meson_tac(@list.List([tc_trans_r(), rc_inc(), sc_inc()]))
  let t217 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rstc(), rc_tc()])),
    t216,
  )
  rstc_trans_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && RSTC(R, y, z) → RSTC(R, x, z)"),
      t217,
    ),
  )
}

///|
let rstc_trans_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_TRANS_R")

///|
/// `RSTC_TRANS_R`
pub fn rstc_trans_r() -> @kernel.Thm {
  rstc_trans_r_c.get()
}

///|
/// RSTC_CASES
fn step_97() -> Unit raise {
  let t219 = @meson.meson_tac(@list.List([stc_cases(), rc_cases()]))
  let t218 = @simp.rewrite_tac(@list.List([@equal.gsym(stc())]))
  let t220 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([rstc(), rc_tc(), rc_sc()])),
      t218,
    ),
    t219,
  )
  rstc_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RSTC(R, x, z) == (x == z || R(x, z) || RSTC(R, z, x) || (∃ y : A, RSTC(R, x, y) && RSTC(R, y, z)))"),
      t220,
    ),
  )
}

///|
let rstc_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_CASES")

///|
/// `RSTC_CASES`
pub fn rstc_cases() -> @kernel.Thm {
  rstc_cases_c.get()
}

///|
/// RSTC_CASES_L
fn step_98() -> Unit raise {
  let t222 = @meson.meson_tac(@list.List([stc_cases_l(), rc_cases()]))
  let t221 = @simp.rewrite_tac(@list.List([@equal.gsym(stc())]))
  let t223 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([rstc(), rc_tc(), rc_sc()])),
      t221,
    ),
    t222,
  )
  rstc_cases_l_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RSTC(R, x, z) == (x == z || R(x, z) || RSTC(R, z, x) || (∃ y : A, RSTC(R, x, y) && R(y, z)))"),
      t223,
    ),
  )
}

///|
let rstc_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_CASES_L")

///|
/// `RSTC_CASES_L`
pub fn rstc_cases_l() -> @kernel.Thm {
  rstc_cases_l_c.get()
}

///|
/// RSTC_CASES_R
fn step_99() -> Unit raise {
  let t225 = @meson.meson_tac(@list.List([stc_cases_r(), rc_cases()]))
  let t224 = @simp.rewrite_tac(@list.List([@equal.gsym(stc())]))
  let t226 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([rstc(), rc_tc(), rc_sc()])),
      t224,
    ),
    t225,
  )
  rstc_cases_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ z : A, RSTC(R, x, z) == (x == z || R(x, z) || RSTC(R, z, x) || (∃ y : A, R(x, y) && RSTC(R, y, z)))"),
      t226,
    ),
  )
}

///|
let rstc_cases_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_CASES_R")

///|
/// `RSTC_CASES_R`
pub fn rstc_cases_r() -> @kernel.Thm {
  rstc_cases_r_c.get()
}

///|
/// RSTC_INDUCT
fn step_100() -> Unit raise {
  let t231 = @meson.asm_meson_tac(@list.List([]))
  let t230 = @simp.rewrite_tac(@list.List([rc_explicit()]))
  let t229 = @tactics.match_mp_tac(stc_induct())
  let t228 = @simp.rewrite_tac(@list.List([@equal.gsym(stc())]))
  let t227 = @simp.rewrite_tac(@list.List([rstc(), rc_tc(), rc_sc()]))
  let t232 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @tactics.strip_tac,
            ),
            t227,
          ),
          t228,
        ),
        t229,
      ),
      t230,
    ),
    t231,
  )
  rstc_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) && (∀ x : A, P(x, x)) && (∀ x : A, ∀ y : A, P(x, y) → P(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, P(x, y) && P(y, z) → P(x, z)) → (∀ x : A, ∀ y : A, RSTC(R, x, y) → P(x, y))"),
      t232,
    ),
  )
}

///|
let rstc_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INDUCT")

///|
/// `RSTC_INDUCT`
pub fn rstc_induct() -> @kernel.Thm {
  rstc_induct_c.get()
}

///|
/// RSTC_MONO
fn step_101() -> Unit raise {
  let t233 = @meson.meson_tac(@list.List([rc_mono(), sc_mono(), tc_mono()]))
  let t234 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rstc()])), t233)
  rstc_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ S : (A, A) -> Bool, (∀ x : A, ∀ y : A, R(x, y) → S(x, y)) → (∀ x : A, ∀ y : A, RSTC(R, x, y) → RSTC(S, x, y))"),
      t234,
    ),
  )
}

///|
let rstc_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_MONO")

///|
/// `RSTC_MONO`
pub fn rstc_mono() -> @kernel.Thm {
  rstc_mono_c.get()
}

///|
/// RSTC_CLOSED
fn step_102() -> Unit raise {
  let t238 = @meson.meson_tac(@list.List([stc_inc()]))
  let t237 = @simp.rewrite_tac(@list.List([rc_explicit(), @class.fun_eq_thm()]))
  let t235 = @equal.gsym(stc_closed())
  let t236 = @simp.rewrite_tac(@list.List([@equal.gsym(stc()), t235]))
  let t239 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([rstc()])), t236),
      t237,
    ),
    t238,
  )
  rstc_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (RSTC(R) == R) == ((∀ x : A, R(x, x)) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)))"),
      t239,
    ),
  )
}

///|
let rstc_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_CLOSED")

///|
/// `RSTC_CLOSED`
pub fn rstc_closed() -> @kernel.Thm {
  rstc_closed_c.get()
}

///|
/// RSTC_IDEMP
fn step_103() -> Unit raise {
  let t240 = @simp.rewrite_tac(
    @list.List([rstc_closed(), rstc_refl(), rstc_sym(), rstc_trans()]),
  )
  rstc_idemp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, RSTC(RSTC(R)) == RSTC(R)"),
      t240,
    ),
  )
}

///|
let rstc_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_IDEMP")

///|
/// `RSTC_IDEMP`
pub fn rstc_idemp() -> @kernel.Thm {
  rstc_idemp_c.get()
}

///|
/// RSC_INC_RC
fn step_104() -> Unit raise {
  let t241 = @simp.rewrite_tac(@list.List([rsc(), rc_sc(), sc_inc()]))
  rsc_inc_rc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RC(R, x, y) → RSC(R, x, y)"),
      t241,
    ),
  )
}

///|
let rsc_inc_rc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_INC_RC")

///|
/// `RSC_INC_RC`
pub fn rsc_inc_rc() -> @kernel.Thm {
  rsc_inc_rc_c.get()
}

///|
/// RSC_INC_SC
fn step_105() -> Unit raise {
  let t242 = @simp.rewrite_tac(@list.List([rsc(), rc_inc()]))
  rsc_inc_sc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(R, x, y) → RSC(R, x, y)"),
      t242,
    ),
  )
}

///|
let rsc_inc_sc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_INC_SC")

///|
/// `RSC_INC_SC`
pub fn rsc_inc_sc() -> @kernel.Thm {
  rsc_inc_sc_c.get()
}

///|
/// RTC_INC_RC
fn step_106() -> Unit raise {
  let t243 = @simp.rewrite_tac(@list.List([rtc(), rc_tc(), tc_inc()]))
  rtc_inc_rc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RC(R, x, y) → RTC(R, x, y)"),
      t243,
    ),
  )
}

///|
let rtc_inc_rc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INC_RC")

///|
/// `RTC_INC_RC`
pub fn rtc_inc_rc() -> @kernel.Thm {
  rtc_inc_rc_c.get()
}

///|
/// RTC_INC_TC
fn step_107() -> Unit raise {
  let t244 = @simp.rewrite_tac(@list.List([rtc(), rc_inc()]))
  rtc_inc_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, TC(R, x, y) → RTC(R, x, y)"),
      t244,
    ),
  )
}

///|
let rtc_inc_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INC_TC")

///|
/// `RTC_INC_TC`
pub fn rtc_inc_tc() -> @kernel.Thm {
  rtc_inc_tc_c.get()
}

///|
/// STC_INC_SC
fn step_108() -> Unit raise {
  let t245 = @simp.rewrite_tac(@list.List([stc(), tc_inc()]))
  stc_inc_sc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(R, x, y) → STC(R, x, y)"),
      t245,
    ),
  )
}

///|
let stc_inc_sc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_INC_SC")

///|
/// `STC_INC_SC`
pub fn stc_inc_sc() -> @kernel.Thm {
  stc_inc_sc_c.get()
}

///|
/// STC_INC_TC
fn step_109() -> Unit raise {
  let t246 = @meson.meson_tac(@list.List([tc_mono(), sc_inc()]))
  let t247 = @tactics.then_tac(@simp.rewrite_tac(@list.List([stc()])), t246)
  stc_inc_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, TC(R, x, y) → STC(R, x, y)"),
      t247,
    ),
  )
}

///|
let stc_inc_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_INC_TC")

///|
/// `STC_INC_TC`
pub fn stc_inc_tc() -> @kernel.Thm {
  stc_inc_tc_c.get()
}

///|
/// RSTC_INC_RC
fn step_110() -> Unit raise {
  let t248 = @simp.rewrite_tac(
    @list.List([rstc(), rc_tc(), rc_sc(), @equal.gsym(stc()), stc_inc()]),
  )
  rstc_inc_rc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RC(R, x, y) → RSTC(R, x, y)"),
      t248,
    ),
  )
}

///|
let rstc_inc_rc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_RC")

///|
/// `RSTC_INC_RC`
pub fn rstc_inc_rc() -> @kernel.Thm {
  rstc_inc_rc_c.get()
}

///|
/// RSTC_INC_SC
fn step_111() -> Unit raise {
  let t249 = @simp.rewrite_tac(
    @list.List([rstc(), @equal.gsym(rtc()), rtc_inc()]),
  )
  rstc_inc_sc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, SC(R, x, y) → RSTC(R, x, y)"),
      t249,
    ),
  )
}

///|
let rstc_inc_sc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_SC")

///|
/// `RSTC_INC_SC`
pub fn rstc_inc_sc() -> @kernel.Thm {
  rstc_inc_sc_c.get()
}

///|
/// RSTC_INC_TC
fn step_112() -> Unit raise {
  let t250 = @meson.meson_tac(@list.List([tc_mono(), rsc_inc()]))
  let t251 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([rstc(), rc_tc(), @equal.gsym(rsc())])),
    t250,
  )
  rstc_inc_tc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, TC(R, x, y) → RSTC(R, x, y)"),
      t251,
    ),
  )
}

///|
let rstc_inc_tc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_TC")

///|
/// `RSTC_INC_TC`
pub fn rstc_inc_tc() -> @kernel.Thm {
  rstc_inc_tc_c.get()
}

///|
/// RSTC_INC_RSC
fn step_113() -> Unit raise {
  let t252 = @simp.rewrite_tac(@list.List([rsc(), rstc(), rc_tc(), tc_inc()]))
  rstc_inc_rsc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RSC(R, x, y) → RSTC(R, x, y)"),
      t252,
    ),
  )
}

///|
let rstc_inc_rsc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_RSC")

///|
/// `RSTC_INC_RSC`
pub fn rstc_inc_rsc() -> @kernel.Thm {
  rstc_inc_rsc_c.get()
}

///|
/// RSTC_INC_RTC
fn step_114() -> Unit raise {
  let t253 = @meson.meson_tac(@list.List([rtc_mono(), sc_inc()]))
  let t254 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(rtc()), rstc()])),
    t253,
  )
  rstc_inc_rtc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RTC(R, x, y) → RSTC(R, x, y)"),
      t254,
    ),
  )
}

///|
let rstc_inc_rtc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_RTC")

///|
/// `RSTC_INC_RTC`
pub fn rstc_inc_rtc() -> @kernel.Thm {
  rstc_inc_rtc_c.get()
}

///|
/// RSTC_INC_STC
fn step_115() -> Unit raise {
  let t255 = @simp.rewrite_tac(
    @list.List([@equal.gsym(stc()), rstc(), rc_inc()]),
  )
  rstc_inc_stc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, STC(R, x, y) → RSTC(R, x, y)"),
      t255,
    ),
  )
}

///|
let rstc_inc_stc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INC_STC")

///|
/// `RSTC_INC_STC`
pub fn rstc_inc_stc() -> @kernel.Thm {
  rstc_inc_stc_c.get()
}

///|
/// INV
fn step_116() -> Unit raise {
  inv_c.set(
    @pair.new_definition(@term_syntax.parse_term("(INV : ((B, A) -> Bool, A, B) -> Bool)((R : (B, A) -> Bool), (x : A), (y : B)) == R(y, x)")),
  )
}

///|
let inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV")

///|
/// `INV`
pub fn inv() -> @kernel.Thm {
  inv_c.get()
}

///|
/// RC_INV
fn step_117() -> Unit raise {
  let t256 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      rc_explicit(),
      inv(),
      @theorems.eq_sym_eq(),
    ]),
  )
  rc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("RC(INV((R : (_, _) -> Bool))) == INV(RC(R))"), t256),
  )
}

///|
let rc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RC_INV")

///|
/// `RC_INV`
pub fn rc_inv() -> @kernel.Thm {
  rc_inv_c.get()
}

///|
/// SC_INV
fn step_118() -> Unit raise {
  let t257 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), sc_explicit(), inv(), @theorems.disj_sym()]),
  )
  sc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("SC(INV((R : (_, _) -> Bool))) == INV(SC(R))"), t257),
  )
}

///|
let sc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_INV")

///|
/// `SC_INV`
pub fn sc_inv() -> @kernel.Thm {
  sc_inv_c.get()
}

///|
/// SC_INV_STRONG
fn step_119() -> Unit raise {
  let t258 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), sc_explicit(), inv(), @theorems.disj_sym()]),
  )
  sc_inv_strong_c.set(
    @tactics.prove(@term_syntax.parse_term("SC(INV((R : (_, _) -> Bool))) == SC(R)"), t258),
  )
}

///|
let sc_inv_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SC_INV_STRONG")

///|
/// `SC_INV_STRONG`
pub fn sc_inv_strong() -> @kernel.Thm {
  sc_inv_strong_c.get()
}

///|
/// TC_INV
fn step_120() -> Unit raise {
  let t261 = @meson.meson_tac(@list.List([inv(), tc_rules()]))
  let t260 = rule_induct_tac(tc_induct())
  let t259 = @tactics.repeat_tac(@tactics.gen_tac)
  let t262 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), inv()])),
          t259,
        ),
        @tactics.eq_tac,
      ),
      t260,
    ),
    t261,
  )
  tc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("TC(INV((R : (_, _) -> Bool))) == INV(TC(R))"), t262),
  )
}

///|
let tc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_INV")

///|
/// `TC_INV`
pub fn tc_inv() -> @kernel.Thm {
  tc_inv_c.get()
}

///|
/// RSC_INV
fn step_121() -> Unit raise {
  let t263 = @simp.rewrite_tac(@list.List([rsc(), rc_inv(), sc_inv()]))
  rsc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("RSC(INV((R : (_, _) -> Bool))) == INV(RSC(R))"), t263),
  )
}

///|
let rsc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSC_INV")

///|
/// `RSC_INV`
pub fn rsc_inv() -> @kernel.Thm {
  rsc_inv_c.get()
}

///|
/// RTC_INV
fn step_122() -> Unit raise {
  let t264 = @simp.rewrite_tac(@list.List([rtc(), rc_inv(), tc_inv()]))
  rtc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("RTC(INV((R : (_, _) -> Bool))) == INV(RTC(R))"), t264),
  )
}

///|
let rtc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_INV")

///|
/// `RTC_INV`
pub fn rtc_inv() -> @kernel.Thm {
  rtc_inv_c.get()
}

///|
/// STC_INV
fn step_123() -> Unit raise {
  let t265 = @simp.rewrite_tac(@list.List([stc(), sc_inv(), tc_inv()]))
  stc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("STC(INV((R : (_, _) -> Bool))) == INV(STC(R))"), t265),
  )
}

///|
let stc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STC_INV")

///|
/// `STC_INV`
pub fn stc_inv() -> @kernel.Thm {
  stc_inv_c.get()
}

///|
/// RSTC_INV
fn step_124() -> Unit raise {
  let t266 = @simp.rewrite_tac(
    @list.List([rstc(), rc_inv(), sc_inv(), tc_inv()]),
  )
  rstc_inv_c.set(
    @tactics.prove(@term_syntax.parse_term("RSTC(INV((R : (_, _) -> Bool))) == INV(RSTC(R))"), t266),
  )
}

///|
let rstc_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RSTC_INV")

///|
/// `RSTC_INV`
pub fn rstc_inv() -> @kernel.Thm {
  rstc_inv_c.get()
}

///|
/// RELPOW
fn step_125() -> Unit raise {
  let t267 = @term_syntax.parse_term("(RELPOW : (Num, (A, A) -> Bool, A, A) -> Bool)(0, (R : (A, A) -> Bool), (x : A), (y : A)) == (x == y) && RELPOW(SUC((n : Num)), R, x, y) == (∃ z : A, RELPOW(n, R, x, z) && R(z, y))")
  relpow_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t267))
}

///|
let relpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW")

///|
/// `RELPOW`
pub fn relpow() -> @kernel.Thm {
  relpow_c.get()
}

///|
/// RELPOW_R
fn step_126() -> Unit raise {
  let t273 = @meson.asm_meson_tac(@list.List([relpow()]))
  let t270 = @term_syntax.parse_term("(n : Num)")
  let t271 = @term_syntax.parse_term("(y : A)")
  let t272 = @tactics.map_every(
    fn(
      x268 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x268
      @tactics.spec_tac(t, t)
    },
    @list.List([@term_syntax.parse_term("(x : A)"), t271, t270]),
  )
  let t274 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.conj_tac,
          @list.List([
            @simp.rewrite_tac(@list.List([relpow()])),
            @tactics.all_tac,
          ]),
        ),
        t272,
      ),
      @nums.induct_tac,
    ),
    t273,
  )
  relpow_r_c.set(
    @tactics.prove(
      @term_syntax.parse_term("RELPOW(0, (R : (A, A) -> Bool), (x : A), (y : A)) == (x == y) && RELPOW(SUC((n : Num)), R, x, y) == (∃ z : A, R(x, z) && RELPOW(n, R, z, y))"),
      t274,
    ),
  )
}

///|
let relpow_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW_R")

///|
/// `RELPOW_R`
pub fn relpow_r() -> @kernel.Thm {
  relpow_r_c.get()
}

///|
/// RELPOW_M
fn step_127() -> Unit raise {
  let t275 = @meson.meson_tac(@list.List([]))
  let t276 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(
        @list.List([@arith.add_clauses(), relpow_r(), @theorems.unwind_thm1()]),
      ),
    ),
    t275,
  )
  relpow_m_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ x : A, ∀ y : A, RELPOW(m + n, (R : (A, A) -> Bool), x, y) == (∃ z : A, RELPOW(m, R, x, z) && RELPOW(n, R, z, y))"),
      t276,
    ),
  )
}

///|
let relpow_m_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW_M")

///|
/// `RELPOW_M`
pub fn relpow_m() -> @kernel.Thm {
  relpow_m_c.get()
}

///|
/// RTC_RELPOW
fn step_128() -> Unit raise {
  let t282 = @meson.asm_meson_tac(@list.List([rtc_refl(), rtc_trans_l()]))
  let t281 = @simp.rewrite_tac(@list.List([relpow()]))
  let t280 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t278 = @term_syntax.parse_term("(y : A)")
  let t279 = @tactics.spec_tac(@term_syntax.parse_term("(y : A)"), t278)
  let t283 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
            t279,
          ),
          t280,
        ),
        @nums.induct_tac,
      ),
      t281,
    ),
    t282,
  )
  let t277 = @meson.meson_tac(@list.List([relpow()]))
  let t284 = @list.List([
    @tactics.then_tac(rule_induct_tac(rtc_induct_l()), t277),
    t283,
  ])
  let t285 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t284,
  )
  rtc_relpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, RTC(R, x, y) == (∃ n : Num, RELPOW(n, R, x, y))"),
      t285,
    ),
  )
}

///|
let rtc_relpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_RELPOW")

///|
/// `RTC_RELPOW`
pub fn rtc_relpow() -> @kernel.Thm {
  rtc_relpow_c.get()
}

///|
/// TC_RELPOW
fn step_129() -> Unit raise {
  let t290 = @meson.meson_tac(@list.List([]))
  let t289 = @simp.rewrite_tac(@list.List([rtc(), rc_explicit()]))
  let t288 = @simp.once_rewrite_tac(@list.List([tc_cases_l()]))
  let t287 = @simp.rewrite_tac(
    @list.List([@theorems.left_exists_and_thm(), @equal.gsym(rtc_relpow())]),
  )
  let t286 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t291 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@simp.rewrite_tac(@list.List([relpow()])), t286),
          t287,
        ),
        t288,
      ),
      t289,
    ),
    t290,
  )
  tc_relpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, TC(R, x, y) == (∃ n : Num, RELPOW(SUC(n), R, x, y))"),
      t291,
    ),
  )
}

///|
let tc_relpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_RELPOW")

///|
/// `TC_RELPOW`
pub fn tc_relpow() -> @kernel.Thm {
  tc_relpow_c.get()
}

///|
/// RELPOW_SEQUENCE
fn step_130() -> Unit raise {
  let t318 = @meson.asm_meson_tac(@list.List([]))
  let t317 = @simp.asm_rewrite_tac(@list.List([]))
  let t316 = @tactics.first_assum(@tactics.match_mp_tac)
  let t315 = @tactics.repeat_tac(@tactics.strip_tac)
  let t314 = @simp.asm_rewrite_tac(@list.List([]))
  let t319 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> A)")),
            t314,
          ),
          t315,
        ),
        t316,
      ),
      t317,
    ),
    t318,
  ])
  let t320 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> A)((n : Num))")),
      @tactics.conj_tac,
    ),
    t319,
  )
  let t311 = @simp.asm_rewrite_tac(@list.List([]))
  let t310 = @tactics.first_assum(@tactics.match_mp_tac)
  let t309 = @simp.asm_rewrite_tac(@list.List([@arith.le_lt()]))
  let t308 = @simp.asm_rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t307 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.le_refl(),
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
    ]),
  )
  let t306 = @tactics.repeat_tac(@tactics.strip_tac)
  let t305 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.le_0(),
      @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")),
    ]),
  )
  let t312 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.exists_tac(
                  @term_syntax.parse_term("(i : Num) => if i <= (n : Num) { (f : (Num) -> A)(i) } else { (y : A) }"),
                ),
                t305,
              ),
              t306,
            ),
            t307,
          ),
          t308,
        ),
        t309,
      ),
      t310,
    ),
    t311,
  )
  let t304 = @meson.asm_meson_tac(@list.List([]))
  let t303 = @simp.asm_rewrite_tac(@list.List([@nums.not_suc()]))
  let t302 = @tactics.repeat_tac(@tactics.strip_tac)
  let t301 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @arith.lt()]))
  let t313 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(
              @term_syntax.parse_term("(i : Num) => if i == 0 { (x : A) } else { (y : A) }"),
            ),
            t301,
          ),
          t302,
        ),
        t303,
      ),
      t304,
    ),
    t312,
  ])
  let t321 = @list.List([
    @tactics.thenl(
      @tactics.disj_cases_tac(
        @int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || 0 < n")),
      ),
      t313,
    ),
    t320,
  ])
  let t300 = @tactics.repeat_tac(@tactics.strip_tac)
  let t322 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t300,
    ),
    t321,
  )
  let t298 = @meson.meson_tac(@list.List([]))
  let t297 = @simp.rewrite_tac(@list.List([]))
  let t296 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (y : A)"))
  let t299 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x293 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s294 = @tactics.subst1_tac(x293)
          fn(
            x295 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s294(x295)
          }
        }),
        t296,
      ),
      t297,
    ),
    t298,
  ])
  let t323 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t299,
    ),
    t322,
  ])
  let t292 = @simp.asm_rewrite_tac(@list.List([@arith.lt(), relpow()]))
  let t324 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t292,
    ),
    t323,
  )
  relpow_sequence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ n : Num, ∀ x : A, ∀ y : A, RELPOW(n, R, x, y) == (∃ f : (Num) -> A, f(0) == x && f(n) == y && (∀ i : Num, i < n → R(f(i), f(SUC(i)))))"),
      t324,
    ),
  )
}

///|
let relpow_sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RELPOW_SEQUENCE",
)

///|
/// `RELPOW_SEQUENCE`
pub fn relpow_sequence() -> @kernel.Thm {
  relpow_sequence_c.get()
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
}
