// Load-fidelity test for arith.ml: replays tools/ocaml_ref/arith_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "arith matches arith.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("arith")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("PRE", () => sthm(@arith.pre()))
  log.attempt("ADD", () => sthm(@arith.add()))
  log.attempt("ADD_0", () => sthm(@arith.add_0()))
  log.attempt("ADD_SUC", () => sthm(@arith.add_suc()))
  log.attempt("ADD_CLAUSES", () => sthm(@arith.add_clauses()))
  log.attempt("ADD_SYM", () => sthm(@arith.add_sym()))
  log.attempt("ADD_ASSOC", () => sthm(@arith.add_assoc()))
  log.attempt("ADD_AC", () => sthm(@arith.add_ac()))
  log.attempt("ADD_EQ_0", () => sthm(@arith.add_eq_0()))
  log.attempt("EQ_ADD_LCANCEL", () => sthm(@arith.eq_add_lcancel()))
  log.attempt("EQ_ADD_RCANCEL", () => sthm(@arith.eq_add_rcancel()))
  log.attempt("EQ_ADD_LCANCEL_0", () => sthm(@arith.eq_add_lcancel_0()))
  log.attempt("EQ_ADD_RCANCEL_0", () => sthm(@arith.eq_add_rcancel_0()))
  log.attempt("BIT0", () => sthm(@arith.bit0()))
  log.attempt("BIT1", () => sthm(@arith.bit1()))
  log.attempt("BIT0_THM", () => sthm(@arith.bit0_thm()))
  log.attempt("BIT1_THM", () => sthm(@arith.bit1_thm()))
  log.attempt("ONE", () => sthm(@arith.one()))
  log.attempt("TWO", () => sthm(@arith.two()))
  log.attempt("ADD1", () => sthm(@arith.add1()))
  log.attempt("MULT", () => sthm(@arith.mult()))
  log.attempt("MULT_0", () => sthm(@arith.mult_0()))
  log.attempt("MULT_SUC", () => sthm(@arith.mult_suc()))
  log.attempt("MULT_CLAUSES", () => sthm(@arith.mult_clauses()))
  log.attempt("MULT_SYM", () => sthm(@arith.mult_sym()))
  log.attempt("LEFT_ADD_DISTRIB", () => sthm(@arith.left_add_distrib()))
  log.attempt("RIGHT_ADD_DISTRIB", () => sthm(@arith.right_add_distrib()))
  log.attempt("MULT_ASSOC", () => sthm(@arith.mult_assoc()))
  log.attempt("MULT_AC", () => sthm(@arith.mult_ac()))
  log.attempt("MULT_EQ_0", () => sthm(@arith.mult_eq_0()))
  log.attempt("EQ_MULT_LCANCEL", () => sthm(@arith.eq_mult_lcancel()))
  log.attempt("EQ_MULT_RCANCEL", () => sthm(@arith.eq_mult_rcancel()))
  log.attempt("MULT_2", () => sthm(@arith.mult_2()))
  log.attempt("MULT_EQ_1", () => sthm(@arith.mult_eq_1()))
  log.attempt("EXP", () => sthm(@arith.exp()))
  log.attempt("EXP_EQ_0", () => sthm(@arith.exp_eq_0()))
  log.attempt("EXP_EQ_1", () => sthm(@arith.exp_eq_1()))
  log.attempt("EXP_ZERO", () => sthm(@arith.exp_zero()))
  log.attempt("EXP_ADD", () => sthm(@arith.exp_add()))
  log.attempt("EXP_ONE", () => sthm(@arith.exp_one()))
  log.attempt("EXP_1", () => sthm(@arith.exp_1()))
  log.attempt("EXP_2", () => sthm(@arith.exp_2()))
  log.attempt("MULT_EXP", () => sthm(@arith.mult_exp()))
  log.attempt("EXP_MULT", () => sthm(@arith.exp_mult()))
  log.attempt("EXP_EXP", () => sthm(@arith.exp_exp()))
  log.attempt("LE", () => sthm(@arith.le()))
  log.attempt("LT", () => sthm(@arith.lt()))
  log.attempt("GE", () => sthm(@arith.ge()))
  log.attempt("GT", () => sthm(@arith.gt()))
  log.attempt("MAX", () => sthm(@arith.max()))
  log.attempt("MIN", () => sthm(@arith.min()))
  log.attempt("LE_SUC_LT", () => sthm(@arith.le_suc_lt()))
  log.attempt("LT_SUC_LE", () => sthm(@arith.lt_suc_le()))
  log.attempt("LE_SUC", () => sthm(@arith.le_suc()))
  log.attempt("LT_SUC", () => sthm(@arith.lt_suc()))
  log.attempt("LE_0", () => sthm(@arith.le_0()))
  log.attempt("LT_0", () => sthm(@arith.lt_0()))
  log.attempt("LE_REFL", () => sthm(@arith.le_refl()))
  log.attempt("LT_REFL", () => sthm(@arith.lt_refl()))
  log.attempt("LT_IMP_NE", () => sthm(@arith.lt_imp_ne()))
  log.attempt("LE_ANTISYM", () => sthm(@arith.le_antisym()))
  log.attempt("LT_ANTISYM", () => sthm(@arith.lt_antisym()))
  log.attempt("LET_ANTISYM", () => sthm(@arith.let_antisym()))
  log.attempt("LTE_ANTISYM", () => sthm(@arith.lte_antisym()))
  log.attempt("LE_TRANS", () => sthm(@arith.le_trans()))
  log.attempt("LT_TRANS", () => sthm(@arith.lt_trans()))
  log.attempt("LET_TRANS", () => sthm(@arith.let_trans()))
  log.attempt("LTE_TRANS", () => sthm(@arith.lte_trans()))
  log.attempt("LE_CASES", () => sthm(@arith.le_cases()))
  log.attempt("LT_CASES", () => sthm(@arith.lt_cases()))
  log.attempt("LET_CASES", () => sthm(@arith.let_cases()))
  log.attempt("LTE_CASES", () => sthm(@arith.lte_cases()))
  log.attempt("LE_LT", () => sthm(@arith.le_lt()))
  log.attempt("LT_LE", () => sthm(@arith.lt_le()))
  log.attempt("NOT_LE", () => sthm(@arith.not_le()))
  log.attempt("NOT_LT", () => sthm(@arith.not_lt()))
  log.attempt("LT_IMP_LE", () => sthm(@arith.lt_imp_le()))
  log.attempt("EQ_IMP_LE", () => sthm(@arith.eq_imp_le()))
  log.attempt("LT_NZ", () => sthm(@arith.lt_nz()))
  log.attempt("LE_1", () => sthm(@arith.le_1()))
  log.attempt("LE_EXISTS", () => sthm(@arith.le_exists()))
  log.attempt("LT_EXISTS", () => sthm(@arith.lt_exists()))
  log.attempt("LE_ADD", () => sthm(@arith.le_add()))
  log.attempt("LE_ADDR", () => sthm(@arith.le_addr()))
  log.attempt("LT_ADD", () => sthm(@arith.lt_add()))
  log.attempt("LT_ADDR", () => sthm(@arith.lt_addr()))
  log.attempt("LE_ADD_LCANCEL", () => sthm(@arith.le_add_lcancel()))
  log.attempt("LE_ADD_RCANCEL", () => sthm(@arith.le_add_rcancel()))
  log.attempt("LT_ADD_LCANCEL", () => sthm(@arith.lt_add_lcancel()))
  log.attempt("LT_ADD_RCANCEL", () => sthm(@arith.lt_add_rcancel()))
  log.attempt("LE_ADD2", () => sthm(@arith.le_add2()))
  log.attempt("LET_ADD2", () => sthm(@arith.let_add2()))
  log.attempt("LTE_ADD2", () => sthm(@arith.lte_add2()))
  log.attempt("LT_ADD2", () => sthm(@arith.lt_add2()))
  log.attempt("LT_MULT", () => sthm(@arith.lt_mult()))
  log.attempt("LE_MULT2", () => sthm(@arith.le_mult2()))
  log.attempt("LT_LMULT", () => sthm(@arith.lt_lmult()))
  log.attempt("LE_MULT_LCANCEL", () => sthm(@arith.le_mult_lcancel()))
  log.attempt("LE_MULT_RCANCEL", () => sthm(@arith.le_mult_rcancel()))
  log.attempt("LT_MULT_LCANCEL", () => sthm(@arith.lt_mult_lcancel()))
  log.attempt("LT_MULT_RCANCEL", () => sthm(@arith.lt_mult_rcancel()))
  log.attempt("LT_MULT2", () => sthm(@arith.lt_mult2()))
  log.attempt("LE_SQUARE_REFL", () => sthm(@arith.le_square_refl()))
  log.attempt("LT_POW2_REFL", () => sthm(@arith.lt_pow2_refl()))
  log.attempt("WLOG_LE", () => sthm(@arith.wlog_le()))
  log.attempt("WLOG_LT", () => sthm(@arith.wlog_lt()))
  log.attempt("WLOG_LE_3", () => sthm(@arith.wlog_le_3()))
  log.attempt("num_WF", () => sthm(@arith.num_wf()))
  log.attempt("num_WOP", () => sthm(@arith.num_wop()))
  log.attempt("num_MAX", () => sthm(@arith.num_max()))
  log.attempt("LE_INDUCT", () => sthm(@arith.le_induct()))
  log.attempt("num_INDUCTION_DOWN", () => sthm(@arith.num_induction_down()))
  log.attempt("EVEN", () => sthm(@arith.even()))
  log.attempt("ODD", () => sthm(@arith.odd()))
  log.attempt("NOT_EVEN", () => sthm(@arith.not_even()))
  log.attempt("NOT_ODD", () => sthm(@arith.not_odd()))
  log.attempt("EVEN_OR_ODD", () => sthm(@arith.even_or_odd()))
  log.attempt("EVEN_AND_ODD", () => sthm(@arith.even_and_odd()))
  log.attempt("EVEN_ADD", () => sthm(@arith.even_add()))
  log.attempt("EVEN_MULT", () => sthm(@arith.even_mult()))
  log.attempt("EVEN_EXP", () => sthm(@arith.even_exp()))
  log.attempt("ODD_ADD", () => sthm(@arith.odd_add()))
  log.attempt("ODD_MULT", () => sthm(@arith.odd_mult()))
  log.attempt("ODD_EXP", () => sthm(@arith.odd_exp()))
  log.attempt("EVEN_DOUBLE", () => sthm(@arith.even_double()))
  log.attempt("ODD_DOUBLE", () => sthm(@arith.odd_double()))
  log.attempt("EVEN_EXISTS_LEMMA", () => sthm(@arith.even_exists_lemma()))
  log.attempt("EVEN_EXISTS", () => sthm(@arith.even_exists()))
  log.attempt("ODD_EXISTS", () => sthm(@arith.odd_exists()))
  log.attempt("EVEN_ODD_DECOMPOSITION", () => {
    sthm(@arith.even_odd_decomposition())
  })
  log.attempt("SUB", () => sthm(@arith.sub()))
  log.attempt("SUB_0", () => sthm(@arith.sub_0()))
  log.attempt("SUB_PRESUC", () => sthm(@arith.sub_presuc()))
  log.attempt("SUB_SUC", () => sthm(@arith.sub_suc()))
  log.attempt("SUB_REFL", () => sthm(@arith.sub_refl()))
  log.attempt("ADD_SUB", () => sthm(@arith.add_sub()))
  log.attempt("ADD_SUB2", () => sthm(@arith.add_sub2()))
  log.attempt("SUB_EQ_0", () => sthm(@arith.sub_eq_0()))
  log.attempt("ADD_SUBR2", () => sthm(@arith.add_subr2()))
  log.attempt("ADD_SUBR", () => sthm(@arith.add_subr()))
  log.attempt("SUB_ADD", () => sthm(@arith.sub_add()))
  log.attempt("SUB_ADD_LCANCEL", () => sthm(@arith.sub_add_lcancel()))
  log.attempt("SUB_ADD_RCANCEL", () => sthm(@arith.sub_add_rcancel()))
  log.attempt("LEFT_SUB_DISTRIB", () => sthm(@arith.left_sub_distrib()))
  log.attempt("RIGHT_SUB_DISTRIB", () => sthm(@arith.right_sub_distrib()))
  log.attempt("SUC_SUB1", () => sthm(@arith.suc_sub1()))
  log.attempt("EVEN_SUB", () => sthm(@arith.even_sub()))
  log.attempt("ODD_SUB", () => sthm(@arith.odd_sub()))
  log.attempt("FACT", () => sthm(@arith.fact()))
  log.attempt("FACT_LT", () => sthm(@arith.fact_lt()))
  log.attempt("FACT_LE", () => sthm(@arith.fact_le()))
  log.attempt("FACT_NZ", () => sthm(@arith.fact_nz()))
  log.attempt("FACT_MONO", () => sthm(@arith.fact_mono()))
  log.attempt("EXP_LT_0", () => sthm(@arith.exp_lt_0()))
  log.attempt("LT_EXP", () => sthm(@arith.lt_exp()))
  log.attempt("LE_EXP", () => sthm(@arith.le_exp()))
  log.attempt("EQ_EXP", () => sthm(@arith.eq_exp()))
  log.attempt("EXP_MONO_LE_IMP", () => sthm(@arith.exp_mono_le_imp()))
  log.attempt("EXP_MONO_LT_IMP", () => sthm(@arith.exp_mono_lt_imp()))
  log.attempt("EXP_MONO_LE", () => sthm(@arith.exp_mono_le()))
  log.attempt("EXP_MONO_LT", () => sthm(@arith.exp_mono_lt()))
  log.attempt("EXP_MONO_EQ", () => sthm(@arith.exp_mono_eq()))
  log.attempt("DIVMOD_EXIST", () => sthm(@arith.divmod_exist()))
  log.attempt("DIVMOD_EXIST_0", () => sthm(@arith.divmod_exist_0()))
  log.attempt("DIVISION_0", () => sthm(@arith.division_0()))
  log.attempt("DIVISION", () => sthm(@arith.division()))
  log.attempt("DIV_ZERO", () => sthm(@arith.div_zero()))
  log.attempt("MOD_ZERO", () => sthm(@arith.mod_zero()))
  log.attempt("DIVISION_SIMP", () => sthm(@arith.division_simp()))
  log.attempt("EQ_DIVMOD", () => sthm(@arith.eq_divmod()))
  log.attempt("MOD_LT_EQ", () => sthm(@arith.mod_lt_eq()))
  log.attempt("MOD_LT_EQ_LT", () => sthm(@arith.mod_lt_eq_lt()))
  log.attempt("DIVMOD_UNIQ_LEMMA", () => sthm(@arith.divmod_uniq_lemma()))
  log.attempt("DIVMOD_UNIQ", () => sthm(@arith.divmod_uniq()))
  log.attempt("MOD_UNIQ", () => sthm(@arith.mod_uniq()))
  log.attempt("DIV_UNIQ", () => sthm(@arith.div_uniq()))
  log.attempt("DIV_0", () => sthm(@arith.div_0()))
  log.attempt("MOD_0", () => sthm(@arith.mod_0()))
  log.attempt("DIV_MULT", () => sthm(@arith.div_mult()))
  log.attempt("MOD_MULT", () => sthm(@arith.mod_mult()))
  log.attempt("MOD_LT", () => sthm(@arith.mod_lt()))
  log.attempt("MOD_EQ_SELF", () => sthm(@arith.mod_eq_self()))
  log.attempt("MOD_CASES", () => sthm(@arith.mod_cases()))
  log.attempt("MOD_ADD_CASES", () => sthm(@arith.mod_add_cases()))
  log.attempt("MOD_EQ", () => sthm(@arith.mod_eq()))
  log.attempt("DIV_LE", () => sthm(@arith.div_le()))
  log.attempt("DIV_MUL_LE", () => sthm(@arith.div_mul_le()))
  log.attempt("MOD_LE_TWICE", () => sthm(@arith.mod_le_twice()))
  log.attempt("DIV_1", () => sthm(@arith.div_1()))
  log.attempt("MOD_1", () => sthm(@arith.mod_1()))
  log.attempt("DIV_LT", () => sthm(@arith.div_lt()))
  log.attempt("MOD_MOD", () => sthm(@arith.mod_mod()))
  log.attempt("MOD_MOD_REFL", () => sthm(@arith.mod_mod_refl()))
  log.attempt("MOD_MOD_LE", () => sthm(@arith.mod_mod_le()))
  log.attempt("MOD_EVEN_2", () => sthm(@arith.mod_even_2()))
  log.attempt("DIV_MULT2", () => sthm(@arith.div_mult2()))
  log.attempt("MOD_MULT2", () => sthm(@arith.mod_mult2()))
  log.attempt("MOD_EXISTS", () => sthm(@arith.mod_exists()))
  log.attempt("LE_RDIV_EQ", () => sthm(@arith.le_rdiv_eq()))
  log.attempt("RDIV_LT_EQ", () => sthm(@arith.rdiv_lt_eq()))
  log.attempt("LE_LDIV_EQ", () => sthm(@arith.le_ldiv_eq()))
  log.attempt("LDIV_LT_EQ", () => sthm(@arith.ldiv_lt_eq()))
  log.attempt("LE_LDIV", () => sthm(@arith.le_ldiv()))
  log.attempt("DIV_MONO", () => sthm(@arith.div_mono()))
  log.attempt("DIV_MONO_LT", () => sthm(@arith.div_mono_lt()))
  log.attempt("DIV_EQ_0", () => sthm(@arith.div_eq_0()))
  log.attempt("MOD_DIV_EQ_0", () => sthm(@arith.mod_div_eq_0()))
  log.attempt("MOD_EQ_0", () => sthm(@arith.mod_eq_0()))
  log.attempt("DIV_EQ_SELF", () => sthm(@arith.div_eq_self()))
  log.attempt("MOD_REFL", () => sthm(@arith.mod_refl()))
  log.attempt("EVEN_MOD", () => sthm(@arith.even_mod()))
  log.attempt("ODD_MOD", () => sthm(@arith.odd_mod()))
  log.attempt("MOD_2_CASES", () => sthm(@arith.mod_2_cases()))
  log.attempt("EVEN_MOD_EVEN", () => sthm(@arith.even_mod_even()))
  log.attempt("ODD_MOD_EVEN", () => sthm(@arith.odd_mod_even()))
  log.attempt("HALF_DOUBLE", () => sthm(@arith.half_double()))
  log.attempt("DOUBLE_HALF", () => sthm(@arith.double_half()))
  log.attempt("MOD_MULT_RMOD", () => sthm(@arith.mod_mult_rmod()))
  log.attempt("MOD_MULT_LMOD", () => sthm(@arith.mod_mult_lmod()))
  log.attempt("MOD_MULT_MOD2", () => sthm(@arith.mod_mult_mod2()))
  log.attempt("MOD_EXP_MOD", () => sthm(@arith.mod_exp_mod()))
  log.attempt("MOD_MULT_ADD", () => sthm(@arith.mod_mult_add()))
  log.attempt("DIV_MULT_ADD", () => sthm(@arith.div_mult_add()))
  log.attempt("MOD_ADD_MOD", () => sthm(@arith.mod_add_mod()))
  log.attempt("DIV_ADD_MOD", () => sthm(@arith.div_add_mod()))
  log.attempt("MOD_ADD_EQ_EQ", () => sthm(@arith.mod_add_eq_eq()))
  log.attempt("DIV_ADD_EQ_EQ", () => sthm(@arith.div_add_eq_eq()))
  log.attempt("DIV_ADD_EQ", () => sthm(@arith.div_add_eq()))
  log.attempt("MOD_ADD_EQ", () => sthm(@arith.mod_add_eq()))
  log.attempt("DIV_REFL", () => sthm(@arith.div_refl()))
  log.attempt("MOD_LE", () => sthm(@arith.mod_le()))
  log.attempt("DIV_MONO2", () => sthm(@arith.div_mono2()))
  log.attempt("DIV_LE_EXCLUSION", () => sthm(@arith.div_le_exclusion()))
  log.attempt("DIV_EQ_EXCLUSION", () => sthm(@arith.div_eq_exclusion()))
  log.attempt("MULT_DIV_LE", () => sthm(@arith.mult_div_le()))
  log.attempt("DIV_DIV", () => sthm(@arith.div_div()))
  log.attempt("DIV_MOD", () => sthm(@arith.div_mod()))
  log.attempt("MOD_MULT_MOD", () => sthm(@arith.mod_mult_mod()))
  log.attempt("MOD_MOD_EXP_MIN", () => sthm(@arith.mod_mod_exp_min()))
  log.attempt("DIV_EXP", () => sthm(@arith.div_exp()))
  log.attempt("MOD_EXP", () => sthm(@arith.mod_exp()))
  log.attempt("FORALL_LT_MOD_THM", () => sthm(@arith.forall_lt_mod_thm()))
  log.attempt("FORALL_MOD_THM", () => sthm(@arith.forall_mod_thm()))
  log.attempt("EXISTS_LT_MOD_THM", () => sthm(@arith.exists_lt_mod_thm()))
  log.attempt("EXISTS_MOD_THM", () => sthm(@arith.exists_mod_thm()))
  log.attempt("PRE_ELIM_THM", () => sthm(@arith.pre_elim_thm()))
  log.attempt("PRE_ELIM_THM'", () => sthm(@arith.pre_elim_thm_p()))
  log.attempt("SUB_ELIM_THM", () => sthm(@arith.sub_elim_thm()))
  log.attempt("SUB_ELIM_THM'", () => sthm(@arith.sub_elim_thm_p()))
  log.attempt("DIVMOD_ELIM_THM", () => sthm(@arith.divmod_elim_thm()))
  log.attempt("DIVMOD_ELIM_THM'", () => sthm(@arith.divmod_elim_thm_p()))
  log.attempt("minimal", () => sthm(@arith.minimal()))
  log.attempt("MINIMAL", () => sthm(@arith.minimal_v1()))
  log.attempt("MINIMAL_UNIQUE", () => sthm(@arith.minimal_unique()))
  log.attempt("LE_MINIMAL", () => sthm(@arith.le_minimal()))
  log.attempt("MINIMAL_LE", () => sthm(@arith.minimal_le()))
  log.attempt("MINIMAL_UBOUND", () => sthm(@arith.minimal_ubound()))
  log.attempt("MINIMAL_LBOUND", () => sthm(@arith.minimal_lbound()))
  log.attempt("MINIMAL_MONO", () => sthm(@arith.minimal_mono()))
  log.attempt("TRANSITIVE_STEPWISE_LT_EQ", () => {
    sthm(@arith.transitive_stepwise_lt_eq())
  })
  log.attempt("TRANSITIVE_STEPWISE_LT", () => {
    sthm(@arith.transitive_stepwise_lt())
  })
  log.attempt("TRANSITIVE_STEPWISE_LE_EQ", () => {
    sthm(@arith.transitive_stepwise_le_eq())
  })
  log.attempt("TRANSITIVE_STEPWISE_LE", () => {
    sthm(@arith.transitive_stepwise_le())
  })
  log.attempt("DEPENDENT_CHOICE_FIXED", () => {
    sthm(@arith.dependent_choice_fixed())
  })
  log.attempt("DEPENDENT_CHOICE", () => sthm(@arith.dependent_choice()))
  // END generated theorem list
  let tm = @parser.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  @testkit.check_axioms()
  inspect(
    log.contents(),
    content=(
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..7..15..26..54..86..136..solved at 208
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 10
      #|0..0..1..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..22..38..70..solved at 116
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..41..76..solved at 108
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..5..13..solved at 26
      #|0..0..1..5..13..solved at 26
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..1..2..5..9..15..29..44..68..142..260..solved at 420
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..solved at 2
      #|0..0..2..12..solved at 18
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..3..13..37..solved at 48
      #|0..0..3..solved at 8
      #|0..0..2..8..solved at 23
      #|0..0..solved at 2
      #|0..0..0..1..3..5..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..solved at 31
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..2..7..19..39..74..156..solved at 223
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|0..0..1..4..solved at 10
      #|0..0..2..8..31..79..254..629..1685..solved at 3183
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..4..13..29..74..solved at 99
      #|0..0..1..4..19..49..130..solved at 165
      #|0..0..3..10..29..63..170..solved at 283
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 17
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..6..12..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..7..16..32..solved at 45
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..6..15..solved at 21
      #|0..0..2..6..15..57..160..883..4135..solved at 8792
      #|0..0..1..2..7..15..43..86..233..456..solved at 886
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..11..38..157..solved at 291
      #|0..0..2..11..solved at 16
      #|0..0..2..10..39..151..solved at 158
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..6..13..28..55..102..solved at 169
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..6..14..solved at 19
      #|0..0..2..solved at 5
      #|0..0..2..6..13..45..solved at 52
      #|0..0..2..solved at 5
      #|0..0..2..6..18..42..solved at 52
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..1..3..5..10..19..31..52..solved at 74
      #|0..0..2..4..10..24..solved at 34
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 11
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..8..solved at 12
      #|0..0..2..6..17..solved at 25
      #|0..0..2..solved at 5
      #|0..0..2..4..11..34..77..165..solved at 194
      #|0..0..1..2..solved at 7
      #|0..0..1..2..7..solved at 13
      #|0..0..2..solved at 6
      #|0..0..2..5..11..22..40..solved at 53
      #|0..0..1..solved at 4
      #|0..0..3..6..14..32..57..102..188..solved at 204
      #|0..0..3..6..22..41..72..122..175..248..386..solved at 407
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..1..3..6..15..34..67..132..266..solved at 510
      #|0..0..1..3..6..13..29..59..110..solved at 162
      #|0..0..1..3..6..15..34..68..130..solved at 182
      #|0..0..1..3..6..15..34..67..132..266..solved at 510
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..3..10..solved at 15
      #|0..0..3..10..solved at 14
      #|0..0..solved at 3
      #|0..0..2..6..21..solved at 27
      #|0..0..solved at 2
      #|0..0..2..6..21..69..246..solved at 261
      #|0..0..2..8..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..solved at 17
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..5..16..32..solved at 40
      #|0..0..1..5..18..37..solved at 48
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..solved at 17
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..14..66..287..1310..solved at 1325
      #|0..0..solved at 3
      #|0..0..2..5..16..72..302..solved at 311
      #|0..0..1..2..3..7..12..17..23..29..35..solved at 84
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..7..solved at 21
      #|0..0..2..4..solved at 10
      #|0..0..0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..14..37..solved at 59
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..6..18..31..solved at 38
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..10..solved at 18
      #|0..0..1..5..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..112..263..solved at 489
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..7..14..22..33..57..84..141..221..305..441..638..849..solved at 1042
      #|0..0..0..1..2..3..4..5..6..11..16..21..40..59..78..103..128..153..192..231..270..358..446..534..650..766..882..1036..1190..1344..solved at 3172
      #|arith quotations (790):
      #|  (PRE : (Num) -> Num)(0) == 0 && (\226\136\128 n : Num, PRE(SUC(n)) == n)
      #|  (\226\136\128 n : Num, (op_plus : (Num, Num) -> Num)(0, n) == n) && (\226\136\128 m : Num, \226\136\128 n : Num, op_plus(SUC(m), n) == SUC(op_plus(m, n)))
      #|  \226\136\128 m : Num, m + 0 == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m + SUC(n) == SUC(m + n)
      #|  (\226\136\128 n : Num, 0 + n == n) && (\226\136\128 m : Num, m + 0 == m) && (\226\136\128 m : Num, \226\136\128 n : Num, SUC(m) + n == SUC(m + n)) && (\226\136\128 m : Num, \226\136\128 n : Num, m + SUC(n) == SUC(m + n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m + n == n + m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m + (n + p) == m + n + p
      #|  (m : Num) + (n : Num) == n + m && m + n + (p : Num) == m + (n + p) && m + (n + p) == n + (m + p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m + n == 0) == (m == 0 && n == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + n == m + p) == (n == p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + p == n + p) == (m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m + n == m) == (n == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m + n == n) == (m == 0)
      #|  \226\136\128 n : Num, BIT0(n) == n + n
      #|  \226\136\128 n : Num, BIT1(n) == SUC(n + n)
      #|  \226\136\128 n : Num, NUMERAL(BIT0(n)) == NUMERAL(n) + NUMERAL(n)
      #|  \226\136\128 n : Num, NUMERAL(BIT1(n)) == SUC(NUMERAL(n) + NUMERAL(n))
      #|  1 == SUC(0)
      #|  2 == SUC(1)
      #|  \226\136\128 m : Num, SUC(m) == m + 1
      #|  (\226\136\128 n : Num, (op_star : (Num, Num) -> Num)(0, n) == 0) && (\226\136\128 m : Num, \226\136\128 n : Num, op_star(SUC(m), n) == op_star(m, n) + n)
      #|  \226\136\128 m : Num, m * 0 == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m * SUC(n) == m + m * n
      #|  (\226\136\128 n : Num, 0 * n == 0) && (\226\136\128 m : Num, m * 0 == 0) && (\226\136\128 n : Num, 1 * n == n) && (\226\136\128 m : Num, m * 1 == m) && (\226\136\128 m : Num, \226\136\128 n : Num, SUC(m) * n == m * n + n) && (\226\136\128 m : Num, \226\136\128 n : Num, m * SUC(n) == m + m * n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m * n == n * m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m * (n + p) == m * n + m * p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + n) * p == m * p + n * p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m * (n * p) == m * n * p
      #|  (m : Num) * (n : Num) == n * m && m * n * (p : Num) == m * (n * p) && m * (n * p) == n * (m * p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m * n == 0) == (m == 0 || n == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * n == m * p) == (m == 0 || n == p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * p == n * p) == (m == n || p == 0)
      #|  \226\136\128 n : Num, 2 * n == n + n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m * n == 1) == (m == 1 && n == 1)
      #|  (\226\136\128 m : Num, (EXP : (Num, Num) -> Num)(m, 0) == 1) && (\226\136\128 m : Num, \226\136\128 n : Num, EXP(m, SUC(n)) == m * EXP(m, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (EXP(m, n) == 0) == (m == 0 && !(n == 0))
      #|  \226\136\128 x : Num, \226\136\128 n : Num, (EXP(x, n) == 1) == (x == 1 || n == 0)
      #|  \226\136\128 n : Num, EXP(0, n) == (if n == 0 { 1 } else { 0 })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, EXP(m, n + p) == EXP(m, n) * EXP(m, p)
      #|  \226\136\128 n : Num, EXP(1, n) == 1
      #|  \226\136\128 n : Num, EXP(n, 1) == n
      #|  \226\136\128 n : Num, EXP(n, 2) == n * n
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, EXP(m * n, p) == EXP(m, p) * EXP(n, p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, EXP(m, n * p) == EXP(EXP(m, n), p)
      #|  \226\136\128 x : Num, \226\136\128 m : Num, \226\136\128 n : Num, EXP(EXP(x, m), n) == EXP(x, m * n)
      #|  (\226\136\128 m : Num, (op_lt_eq : (Num, Num) -> Bool)(m, 0) == (m == 0)) && (\226\136\128 m : Num, \226\136\128 n : Num, op_lt_eq(m, SUC(n)) == (m == SUC(n) || op_lt_eq(m, n)))
      #|  (\226\136\128 m : Num, (op_lt : (Num, Num) -> Bool)(m, 0) == false) && (\226\136\128 m : Num, \226\136\128 n : Num, op_lt(m, SUC(n)) == (m == n || op_lt(m, n)))
      #|  (op_gt_eq : (Num, Num) -> Bool)((m : Num), (n : Num)) == (n <= m)
      #|  (op_gt : (Num, Num) -> Bool)((m : Num), (n : Num)) == (n < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MAX : (Num, Num) -> Num)(m, n) == (if m <= n { n } else { m })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MIN : (Num, Num) -> Num)(m, n) == (if m <= n { m } else { n })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (SUC(m) <= n) == (m < n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m < SUC(n)) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (SUC(m) <= SUC(n)) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (SUC(m) < SUC(n)) == (m < n)
      #|  \226\136\128 n : Num, 0 <= n
      #|  \226\136\128 n : Num, 0 < SUC(n)
      #|  \226\136\128 n : Num, n <= n
      #|  \226\136\128 n : Num, !(n < n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 !(m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m <= n && n <= m) == (m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m < n && n < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m <= n && n < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m < n && n <= m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n && n <= p \226\134\146 m <= p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m < n && n < p \226\134\146 m < p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n && n < p \226\134\146 m < p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m < n && n <= p \226\134\146 m < p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n || n <= m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n || n < m || m == n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n || n < m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n || n <= m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m <= n) == (m < n || m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m < n) == (m <= n && !(m == n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m <= n) == (n < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m < n) == (n <= m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 m <= n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m == n \226\134\146 m <= n
      #|  \226\136\128 n : Num, (0 < n) == !(n == 0)
      #|  (\226\136\128 n : Num, !(n == 0) \226\134\146 0 < n) && (\226\136\128 n : Num, !(n == 0) \226\134\146 1 <= n) && (\226\136\128 n : Num, 0 < n \226\134\146 !(n == 0)) && (\226\136\128 n : Num, 0 < n \226\134\146 1 <= n) && (\226\136\128 n : Num, 1 <= n \226\134\146 0 < n) && (\226\136\128 n : Num, 1 <= n \226\134\146 !(n == 0))
      #|  SUC((d : Num))
      #|  (d : Num)
      #|  0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m <= n) == (\226\136\131 d : Num, n == m + d)
      #|  SUC((d : Num))
      #|  (d : Num)
      #|  0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m < n) == (\226\136\131 d : Num, n == m + SUC(d))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= m + n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, n <= m + n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m < m + n) == (0 < n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (n < m + n) == (0 < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + n <= m + p) == (n <= p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + p <= n + p) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + n < m + p) == (n < p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m + p < n + p) == (m < n)
      #|  (a : Num) + (b : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m <= p && n <= q \226\134\146 m + n <= p + q
      #|  (a : Num) + (b : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m <= p && n < q \226\134\146 m + n < p + q
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m < p && n <= q \226\134\146 m + n < p + q
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m < p && n < q \226\134\146 m + n < p + q
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (0 < m * n) == (0 < m && 0 < n)
      #|  (a : Num) * (p : Num) + ((m : Num) * (b : Num) + a * b)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m <= n && p <= q \226\134\146 m * p <= n * q
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(m == 0) && n < p \226\134\146 m * n < m * p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * n <= m * p) == (m == 0 || n <= p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * p <= n * p) == (m <= n || p == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * n < m * p) == (!(m == 0) && n < p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m * p < n * p) == (m < n && !(p == 0))
      #|  (m : Num) < (n : Num)
      #|  (n : Num) * (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m < n && p < q \226\134\146 m * p < n * q
      #|  \226\136\128 n : Num, n <= n * n
      #|  \226\136\128 n : Num, n < EXP(2, n)
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, (P : (Num, Num) -> Bool)(m, n) == P(n, m)) && (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 P(m, n)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, P(m, n))
      #|  (\226\136\128 m : Num, (P : (Num, Num) -> Bool)(m, m)) && (\226\136\128 m : Num, \226\136\128 n : Num, P(m, n) == P(n, m)) && (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 P(m, n)) \226\134\146 (\226\136\128 m : Num, \226\136\128 y : Num, P(m, y))
      #|  \226\136\128 P : (Num, Num, Num) -> Bool, (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, P(x, y, z) \226\134\146 P(y, x, z) && P(x, z, y)) && (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, x <= y && y <= z \226\134\146 P(x, y, z)) \226\134\146 (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, P(x, y, z))
      #|  (n : Num) => \226\136\128 m : Num, m < n \226\134\146 (P : (Num) -> Bool)(m)
      #|  \226\136\128 P : (Num) -> Bool, (\226\136\128 n : Num, (\226\136\128 m : Num, m < n \226\134\146 P(m)) \226\134\146 P(n)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  \226\136\128 P : (Num) -> Bool, (\226\136\131 n : Num, P(n)) == (\226\136\131 n : Num, P(n) && (\226\136\128 m : Num, m < n \226\134\146 !P(m)))
      #|  (m : Num)
      #|  (p : Num) == SUC((m : Num))
      #|  (p : Num)
      #|  (p : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool) && a) == (a && b \226\134\146 c)
      #|  (m : Num)
      #|  (a : Num)
      #|  \226\136\128 P : (Num) -> Bool, ((\226\136\131 x : Num, P(x)) && (\226\136\131 M : Num, \226\136\128 x : Num, P(x) \226\134\146 x <= M)) == (\226\136\131 m : Num, P(m) && (\226\136\128 x : Num, P(x) \226\134\146 x <= m))
      #|  (m : Num)
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 (R : (Num, Num) -> Bool)(m, n)) == (\226\136\128 m : Num, \226\136\128 d : Num, R(m, m + d))
      #|  \226\136\128 P : (Num, Num) -> Bool, (\226\136\128 m : Num, P(m, m)) && (\226\136\128 m : Num, \226\136\128 n : Num, m <= n && P(m, n) \226\134\146 P(m, SUC(n))) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 P(m, n))
      #|  !(!(p : Bool) && (q : Bool)) == (q \226\134\146 p)
      #|  (!(p : Bool) \226\134\146 (q : Bool)) == (!q \226\134\146 p)
      #|  (q : Bool) && !(r : Bool) \226\134\146 ((p : Bool) && q) == r \226\134\146 !p
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x)) == !(\226\136\131 x : _, !P(x))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 m : Num, (\226\136\128 n : Num, m <= n \226\134\146 P(n)) && (\226\136\128 n : Num, n < m && P(n + 1) \226\134\146 P(n)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  (EVEN : (Num) -> Bool)(0) == true && (\226\136\128 n : Num, EVEN(SUC(n)) == !EVEN(n))
      #|  (ODD : (Num) -> Bool)(0) == false && (\226\136\128 n : Num, ODD(SUC(n)) == !ODD(n))
      #|  \226\136\128 n : Num, !EVEN(n) == ODD(n)
      #|  \226\136\128 n : Num, !ODD(n) == EVEN(n)
      #|  \226\136\128 n : Num, EVEN(n) || ODD(n)
      #|  !((p : Bool) && !p)
      #|  \226\136\128 n : Num, !(EVEN(n) && ODD(n))
      #|  (p : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(m + n) == (EVEN(m) == EVEN(n))
      #|  (p : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(m * n) == (EVEN(m) || EVEN(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(EXP(m, n)) == (EVEN(m) && !(n == 0))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, ODD(m + n) == !(ODD(m) == ODD(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, ODD(m * n) == (ODD(m) && ODD(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, ODD(EXP(m, n)) == (ODD(m) || n == 0)
      #|  \226\136\128 n : Num, EVEN(2 * n)
      #|  \226\136\128 n : Num, ODD(SUC(2 * n))
      #|  (m : Num)
      #|  SUC((m : Num))
      #|  (m : Num)
      #|  0
      #|  \226\136\128 n : Num, (EVEN(n) \226\134\146 (\226\136\131 m : Num, n == 2 * m)) && (!EVEN(n) \226\134\146 (\226\136\131 m : Num, n == SUC(2 * m)))
      #|  \226\136\128 n : Num, EVEN(n) == (\226\136\131 m : Num, n == 2 * m)
      #|  \226\136\128 n : Num, ODD(n) == (\226\136\131 m : Num, n == SUC(2 * m))
      #|  SUC((k : Num))
      #|  (k : Num)
      #|  (p : Num)
      #|  (m : Num) == 0
      #|  (m : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, (\226\136\131 k : Num, \226\136\131 m : Num, ODD(m) && n == EXP(2, k) * m) == !(n == 0)
      #|  (\226\136\128 m : Num, (op_minus : (Num, Num) -> Num)(m, 0) == m) && (\226\136\128 m : Num, \226\136\128 n : Num, op_minus(m, SUC(n)) == PRE(op_minus(m, n)))
      #|  \226\136\128 m : Num, 0 - m == 0 && m - 0 == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, PRE(SUC(m) - n) == m - n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, SUC(m) - SUC(n) == m - n
      #|  \226\136\128 n : Num, n - n == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m + n - n == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m + n - m == n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m - n == 0) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m - (m + n) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, n - (m + n) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, n <= m \226\134\146 m - n + n == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m + n - (m + p) == n - p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m + p - (n + p) == m - n
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m * (n - p) == m * n - m * p
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m - n) * p == m * p - n * p
      #|  \226\136\128 n : Num, SUC(n) - 1 == n
      #|  EVEN
      #|  (n : Num)
      #|  (m : Num)
      #|  (m : Num) <= (n : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(m - n) == (m <= n || EVEN(m) == EVEN(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, ODD(m - n) == (n < m && !(ODD(m) == ODD(n)))
      #|  (FACT : (Num) -> Num)(0) == 1 && (\226\136\128 n : Num, FACT(SUC(n)) == SUC(n) * FACT(n))
      #|  \226\136\128 n : Num, 0 < FACT(n)
      #|  \226\136\128 n : Num, 1 <= FACT(n)
      #|  \226\136\128 n : Num, !(FACT(n) == 0)
      #|  FACT((m : Num) + (d : Num))
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 FACT(m) <= FACT(n)
      #|  \226\136\128 n : Num, \226\136\128 x : Num, (0 < EXP(x, n)) == (!(x == 0) || n == 0)
      #|  !((x : Num) == 0)
      #|  (x : Num) * 1
      #|  EXP((x : Num), (m : Num) + SUC((d : Num)))
      #|  2 * EXP((x : Num), (m : Num))
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  !((x : Num) == 0)
      #|  1 * EXP((x : Num), (n : Num) + (d : Num))
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Num) == 0
      #|  \226\136\128 x : Num, \226\136\128 m : Num, \226\136\128 n : Num, (EXP(x, m) < EXP(x, n)) == (2 <= x && m < n || x == 0 && !(m == 0) && n == 0)
      #|  \226\136\128 x : Num, \226\136\128 m : Num, \226\136\128 n : Num, (EXP(x, m) <= EXP(x, n)) == (if x == 0 { m == 0 \226\134\146 n == 0 } else { x == 1 || m <= n })
      #|  \226\136\128 x : Num, \226\136\128 m : Num, \226\136\128 n : Num, (EXP(x, m) == EXP(x, n)) == (if x == 0 { (m == 0) == (n == 0) } else { x == 1 || m == n })
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, x <= y \226\134\146 EXP(x, n) <= EXP(y, n)
      #|  (x : Num) * EXP((y : Num), (n : Num))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, x < y && !(n == 0) \226\134\146 EXP(x, n) < EXP(y, n)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, (EXP(x, n) <= EXP(y, n)) == (x <= y || n == 0)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, (EXP(x, n) < EXP(y, n)) == (x < y && !(n == 0))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, (EXP(x, n) == EXP(y, n)) == (x == y || n == 0)
      #|  (q : Num) + 1
      #|  (d : Num)
      #|  (d : Num)
      #|  (q : Num)
      #|  (r : Num)
      #|  0
      #|  (m : Num)
      #|  (r : Num) => \226\136\131 q : Num, (m : Num) == q * (n : Num) + r
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\131 q : Num, \226\136\131 r : Num, m == q * n + r && r < n)
      #|  (r : Num)
      #|  (q : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\131 q : Num, \226\136\131 r : Num, (if n == 0 { q == 0 && r == m } else { m == q * n + r && r < n })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 m == DIV(m, n) * n + MOD(m, n) && MOD(m, n) < n
      #|  \226\136\128 n : Num, DIV(n, 0) == 0
      #|  \226\136\128 n : Num, MOD(n, 0) == n
      #|  (n : Num) == 0
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, DIV(m, n) * n + MOD(m, n) == m) && (\226\136\128 m : Num, \226\136\128 n : Num, n * DIV(m, n) + MOD(m, n) == m)
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, (DIV(m, p) == DIV(n, p) && MOD(m, p) == MOD(n, p)) == (m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MOD(m, n) < n) == !(n == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MOD(m, n) < n) == (0 < n)
      #|  (n : Num) == 0
      #|  (r2 : Num) < (n : Num)
      #|  (m : Num) == (q1 : Num) * (n : Num) + (r2 : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  (r2 : Num) < (n : Num)
      #|  (r1 : Num) < (n : Num)
      #|  (d : Num)
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (m : Num) == (q2 : Num) * (n : Num) + (r2 : Num)
      #|  (r1 : Num) == (r2 : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 q1 : Num, \226\136\128 r1 : Num, \226\136\128 q2 : Num, \226\136\128 r2 : Num, (m == q1 * n + r1 && r1 < n) && m == q2 * n + r2 && r2 < n \226\134\146 q1 == q2 && r1 == r2
      #|  (r : Num) < (n : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 q : Num, \226\136\128 r : Num, m == q * n + r && r < n \226\134\146 DIV(m, n) == q && MOD(m, n) == r
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 q : Num, \226\136\128 r : Num, m == q * n + r && r < n \226\134\146 MOD(m, n) == r
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 q : Num, \226\136\128 r : Num, m == q * n + r && r < n \226\134\146 DIV(m, n) == q
      #|  (n : Num) == 0
      #|  (\226\136\128 n : Num, DIV(0, n) == 0) && (\226\136\128 n : Num, MOD(0, n) == 0)
      #|  (m : Num) == 0
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, !(m == 0) \226\134\146 DIV(m * n, m) == n) && (\226\136\128 m : Num, \226\136\128 n : Num, MOD(m * n, m) == 0)
      #|  0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 MOD(m, n) == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MOD(m, n) == m) == (n == 0 || m < n)
      #|  1
      #|  \226\136\128 n : Num, \226\136\128 p : Num, n < 2 * p \226\134\146 MOD(n, p) == (if n < p { n } else { n - p })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m < p && n < p \226\134\146 MOD(m + n, p) == (if m + n < p { m + n } else { m + n - p })
      #|  (n : Num)
      #|  (q : Num) + DIV((n : Num), (p : Num))
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, m == n + q * p \226\134\146 MOD(m, p) == MOD(n, p)
      #|  (n : Num)
      #|  (n : Num)
      #|  !((n : Num) == 0)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, DIV(m, n) <= m
      #|  (m : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, n * DIV(m, n) <= m
      #|  ((n : Num) - (m : Num) < m) == (n - m + m < m + m)
      #|  1
      #|  MOD((n : Num), (m : Num)) == n - m
      #|  (m : Num) + MOD((n : Num), m)
      #|  2 * (m : Num)
      #|  2 * (m : Num) <= (n : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, 0 < m && m <= n \226\134\146 2 * MOD(n, m) <= n
      #|  (\226\136\128 n : Num, DIV(n, 1) == n) && (\226\136\128 n : Num, MOD(n, 1) == 0)
      #|  (m : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 DIV(m, n) == 0
      #|  (n : Num) * (p : Num)
      #|  (m : Num)
      #|  DIV((m : Num), (n : Num) * (p : Num)) * p
      #|  (n : Num) == 0
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(MOD(m, n * p), n) == MOD(m, n)
      #|  1
      #|  (n : Num)
      #|  (m : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, MOD(MOD(m, n), n) == MOD(m, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(n == 0) && n <= p \226\134\146 MOD(MOD(m, n), p) == MOD(m, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(n) \226\134\146 MOD(MOD(m, n), 2) == MOD(m, 2)
      #|  (a : Num) * ((b : Num) * (c : Num)) == b * (a * c)
      #|  (m : Num) * MOD((n : Num), (p : Num))
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(m == 0) \226\134\146 DIV(m * n, m * p) == DIV(n, p)
      #|  (a : Num) * ((b : Num) * (c : Num)) == b * (a * c)
      #|  DIV((n : Num), (p : Num))
      #|  (m : Num) == 0
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(m * n, m * p) == m * MOD(n, p)
      #|  (m : Num) == DIV(m, (n : Num)) * n + MOD(m, n)
      #|  DIV((m : Num), (n : Num))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\131 q : Num, m == n * q) == (if n == 0 { m == 0 } else { MOD(m, n) == 0 })
      #|  DIV((b : Num), (a : Num)) * a + MOD(b, a)
      #|  (a : Num) * (n : Num) < a * (DIV((b : Num), a) + 1)
      #|  (a : Num) * DIV((b : Num), a)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (n <= DIV(b, a)) == (a * n <= b)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (DIV(b, a) < n) == (b < a * n)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (DIV(b, a) <= n) == (b < a * (n + 1))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (n < DIV(b, a)) == (a * (n + 1) <= b)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) && b <= a * n \226\134\146 DIV(b, a) <= n
      #|  (\226\136\128 k : Num, k <= (a : Num) \226\134\146 k <= (b : Num)) \226\134\146 a <= b
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n \226\134\146 DIV(m, p) <= DIV(n, p)
      #|  (\226\136\128 k : Num, k <= (a : Num) \226\134\146 k + 1 <= (b : Num)) \226\134\146 a < b
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(p == 0) && m + p <= n \226\134\146 DIV(m, p) < DIV(n, p)
      #|  (m : Num)
      #|  (m : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 (DIV(m, n) == 0) == (m < n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(MOD(m, n), n) == 0
      #|  (m : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MOD(m, n) == 0) == (\226\136\131 q : Num, m == q * n)
      #|  (n : Num) == 0
      #|  (n : Num) == 1
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (DIV(m, n) == m) == (m == 0 || n == 1)
      #|  \226\136\128 n : Num, MOD(n, n) == 0
      #|  \226\136\128 n : Num, EVEN(n) == (MOD(n, 2) == 0)
      #|  (n : Num)
      #|  MOD((n : Num), 2)
      #|  MOD((n : Num), 2) < 2
      #|  \226\136\128 n : Num, ODD(n) == (MOD(n, 2) == 1)
      #|  \226\136\128 n : Num, MOD(n, 2) == (if EVEN(n) { 0 } else { 1 })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(n) \226\134\146 EVEN(MOD(m, n)) == EVEN(m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EVEN(n) \226\134\146 ODD(MOD(m, n)) == ODD(m)
      #|  (\226\136\128 n : Num, DIV(2 * n, 2) == n) && (\226\136\128 n : Num, DIV(n * 2, 2) == n)
      #|  (\226\136\128 n : Num, EVEN(n) \226\134\146 2 * DIV(n, 2) == n) && (\226\136\128 n : Num, EVEN(n) \226\134\146 DIV(n, 2) * 2 == n)
      #|  (m : Num) * DIV((p : Num), (n : Num))
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(m * MOD(p, n), n) == MOD(m * p, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(MOD(m, n) * p, n) == MOD(m * p, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(MOD(m, n) * MOD(p, n), n) == MOD(m * p, n)
      #|  MOD((m : Num) * MOD(EXP(MOD(m, (n : Num)), (p : Num)), n), n)
      #|  (p : Num)
      #|  (p : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(EXP(MOD(m, n), p), n) == MOD(EXP(m, p), n)
      #|  (m : Num) + DIV((p : Num), (n : Num))
      #|  (n : Num) == 0
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(m * n + p, n) == MOD(p, n)) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(n * m + p, n) == MOD(p, n)) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(p + m * n, n) == MOD(p, n)) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(p + n * m, n) == MOD(p, n))
      #|  MOD((b : Num), (n : Num))
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(a * n + b, n) == a + DIV(b, n)) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(n * a + b, n) == a + DIV(b, n)) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(b + a * n, n) == DIV(b, n) + a) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(b + n * a, n) == DIV(b, n) + a)
      #|  (a : Num) + (b : Num) + ((c : Num) + (d : Num)) == c + a + (d + b)
      #|  DIV((a : Num), (n : Num)) + DIV((b : Num), n)
      #|  (n : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, MOD(MOD(a, n) + MOD(b, n), n) == MOD(a + b, n)
      #|  (a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 (MOD(a + b, n) == MOD(a, n) + MOD(b, n)) == (DIV(a + b, n) == DIV(a, n) + DIV(b, n))
      #|  (b : Num)
      #|  (a : Num)
      #|  (a : Num) + (b : Num)
      #|  op_plus
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, (MOD(x + y, n) == MOD(x, n) + MOD(y, n)) == (n == 0 || MOD(x, n) + MOD(y, n) < n)
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, (DIV(x + y, n) == DIV(x, n) + DIV(y, n)) == (n == 0 || MOD(x, n) + MOD(y, n) < n)
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, MOD(x, n) + MOD(y, n) < n \226\134\146 DIV(x + y, n) == DIV(x, n) + DIV(y, n)
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, MOD(x, n) + MOD(y, n) < n \226\134\146 MOD(x + y, n) == MOD(x, n) + MOD(y, n)
      #|  (n : Num)
      #|  (n : Num)
      #|  0
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 DIV(n, n) == 1
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, MOD(m, n) <= m
      #|  (m : Num)
      #|  (n : Num)
      #|  (m : Num) * DIV((n : Num), m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(p == 0) && p <= m \226\134\146 DIV(n, m) <= DIV(n, p)
      #|  (b : Num) * ((d : Num) * (k : Num)) <= b * (c : Num) \226\134\146 b * k * d < ((a : Num) + 1) * d
      #|  (k : Num)
      #|  (\226\136\128 k : Num, k <= (a : Num) \226\134\146 k <= (b : Num)) \226\134\146 a <= b
      #|  (d : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 d : Num, !(b == 0) && b * c < (a + 1) * d \226\134\146 DIV(c, d) <= DIV(a, b)
      #|  (d : Num) == 0
      #|  (b : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 d : Num, b * c < (a + 1) * d && a * d < (c + 1) * b \226\134\146 DIV(a, b) == DIV(c, d)
      #|  (n : Num)
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m * DIV(n, p) <= DIV(m * n, p)
      #|  (\226\136\128 k : Num, (k <= (m : Num)) == (k <= (n : Num))) \226\134\146 m == n
      #|  (n : Num) == 0
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, DIV(DIV(m, n), p) == DIV(m, n * p)
      #|  (n : Num) * (p : Num)
      #|  (m : Num)
      #|  (p : Num)
      #|  DIV((m : Num), (n : Num))
      #|  (k : Num) + (p : Num) * DIV(DIV((m : Num), (n : Num)), p) <= DIV(m, n)
      #|  (k : Num)
      #|  (\226\136\128 k : Num, (k <= (m : Num)) == (k <= (n : Num))) \226\134\146 m == n
      #|  (n : Num) == 0
      #|  (p : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(DIV(m, n), p) == DIV(MOD(m, n * p), n)
      #|  (d : Num) * ((n : Num) * (p : Num)) == n * (d * p)
      #|  DIV(DIV((m : Num), (n : Num)), (p : Num)) * (n * p)
      #|  (\226\136\131 a : Num, a + (x : Num) == a + (y : Num)) \226\134\146 x == y
      #|  (p : Num) == 0
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, MOD(m, n * p) == n * MOD(DIV(m, n), p) + MOD(m, n)
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  \226\136\131 d : Num, (m : Num) == (n : Num) + d
      #|  EXP((p : Num), (m : Num))
      #|  (m : Num) <= (n : Num)
      #|  (m : Num) <= (n : Num)
      #|  (m : Num) == 0
      #|  (p : Num) == 0
      #|  \226\136\128 x : Num, \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, MOD(MOD(x, EXP(p, m)), EXP(p, n)) == MOD(x, EXP(p, MIN(m, n)))
      #|  (m : Num) == 1
      #|  (p : Num) <= (n : Num)
      #|  (m : Num) == 0
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(m == 0) \226\134\146 DIV(EXP(m, n), EXP(m, p)) == (if p <= n { EXP(m, n - p) } else { if m == 1 { 1 } else { 0 } })) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, !(m == 0) \226\134\146 MOD(EXP(m, n), EXP(m, p)) == (if p <= n || m == 1 { 0 } else { EXP(m, n) }))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, (\226\136\128 a : Num, a < n \226\134\146 P(a)) == (n == 0 || (\226\136\128 a : Num, P(MOD(a, n))))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\128 a : Num, P(MOD(a, n))) == (\226\136\128 a : Num, a < n \226\134\146 P(a))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, (\226\136\131 a : Num, a < n && P(a)) == (!(n == 0) && (\226\136\131 a : Num, P(MOD(a, n))))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\131 a : Num, P(MOD(a, n))) == (\226\136\131 a : Num, a < n && P(a))
      #|  (n : Num)
      #|  (n : Num)
      #|  (P : (Num) -> Bool)(PRE((n : Num))) == (\226\136\128 m : Num, n == SUC(m) || m == 0 && n == 0 \226\134\146 P(m))
      #|  (P : (Num) -> Bool)
      #|  (x : Num) => !(P : (Num) -> Bool)(x)
      #|  (P : (Num) -> Bool)(PRE((n : Num))) == (\226\136\131 m : Num, (n == SUC(m) || m == 0 && n == 0) && P(m))
      #|  (e : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  (P : (Num) -> Bool)((a : Num) - (b : Num)) == (\226\136\128 d : Num, a == b + d || a < b && d == 0 \226\134\146 P(d))
      #|  (P : (Num) -> Bool)
      #|  (x : Num) => !(P : (Num) -> Bool)(x)
      #|  (P : (Num) -> Bool)((a : Num) - (b : Num)) == (\226\136\131 d : Num, (a == b + d || a < b && d == 0) && P(d))
      #|  (n : Num) == 0
      #|  (P : (Num, Num) -> Bool)(DIV((m : Num), (n : Num)), MOD(m, n)) == (\226\136\128 q : Num, \226\136\128 r : Num, n == 0 && q == 0 && r == m || m == q * n + r && r < n \226\134\146 P(q, r))
      #|  (P : (Num, Num) -> Bool)
      #|  (x : Num) => (y : Num) => !(P : (Num, Num) -> Bool)(x, y)
      #|  (P : (Num, Num) -> Bool)(DIV((m : Num), (n : Num)), MOD(m, n)) == (\226\136\131 q : Num, \226\136\131 r : Num, (n == 0 && q == 0 && r == m || m == q * n + r && r < n) && P(q, r))
      #|  MOD(SUC(MOD((m : Num), (n : Num))), n) == MOD(SUC(m), n)
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  op_plus
      #|  (op_eq : (Num, Num) -> Bool)
      #|  (minimal : ((Num) -> Bool) -> Num)((P : (Num) -> Bool)) == select((n : Num) => P(n) && (\226\136\128 m : Num, m < n \226\134\146 !P(m)))
      #|  \226\136\128 P : (Num) -> Bool, (\226\136\131 n : Num, P(n)) == (P(minimal(P)) && (\226\136\128 m : Num, m < minimal(P) \226\134\146 !P(m)))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, P(n) && (\226\136\128 m : Num, m < n \226\134\146 !P(m)) \226\134\146 minimal(P) == n
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, (\226\136\131 r : Num, P(r)) \226\134\146 (n <= minimal(P)) == (\226\136\128 i : Num, P(i) \226\134\146 n <= i)
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, (\226\136\131 r : Num, P(r)) \226\134\146 (minimal(P) <= n) == (\226\136\131 i : Num, i <= n && P(i))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, P(n) \226\134\146 minimal(P) <= n
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 n : Num, (\226\136\131 r : Num, P(r)) && (\226\136\128 m : Num, m < n \226\134\146 !P(m)) \226\134\146 n <= minimal(P)
      #|  (\226\136\128 p : Num, p <= (m : Num) \226\134\146 p <= (n : Num)) \226\134\146 m <= n
      #|  \226\136\131 n : Num, (Q : (Num) -> Bool)(n)
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 Q : (Num) -> Bool, (\226\136\131 n : Num, P(n)) && (\226\136\128 n : Num, P(n) \226\134\146 Q(n)) \226\134\146 minimal(Q) <= minimal(P)
      #|  \226\136\128 R : (Num, Num) -> Bool, (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, R(x, y) && R(y, z) \226\134\146 R(x, z)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 R(m, n)) == (\226\136\128 n : Num, R(n, SUC(n)))
      #|  ((a : Bool) \226\134\146 (c : Bool) == (b : Bool)) \226\134\146 a && b \226\134\146 c
      #|  \226\136\128 R : (Num, Num) -> Bool, (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, R(x, y) && R(y, z) \226\134\146 R(x, z)) && (\226\136\128 n : Num, R(n, SUC(n))) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 R(m, n))
      #|  \226\136\128 R : (Num, Num) -> Bool, (\226\136\128 x : Num, R(x, x)) && (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, R(x, y) && R(y, z) \226\134\146 R(x, z)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 R(m, n)) == (\226\136\128 n : Num, R(n, SUC(n)))
      #|  ((a : Bool) && (a' : Bool) \226\134\146 (c : Bool) == (b : Bool)) \226\134\146 a && a' && b \226\134\146 c
      #|  \226\136\128 R : (Num, Num) -> Bool, (\226\136\128 x : Num, R(x, x)) && (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, R(x, y) && R(y, z) \226\134\146 R(x, z)) && (\226\136\128 n : Num, R(n, SUC(n))) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 R(m, n))
      #|  (\226\136\128 n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (\226\136\128 n : Num, P(SUC(n))))
      #|  (f : (Num) -> A)(0) == (a : A) && (\226\136\128 n : Num, f(SUC(n)) == select((y : A) => (P : (Num, A) -> Bool)(SUC(n), y) && (R : (Num, A, A) -> Bool)(n, f(n), y)))
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 R : (Num, A, A) -> Bool, \226\136\128 a : A, P(0, a) && (\226\136\128 n : Num, \226\136\128 x : A, P(n, x) \226\134\146 (\226\136\131 y : A, P(SUC(n), y) && R(n, x, y))) \226\134\146 (\226\136\131 f : (Num) -> A, f(0) == a && (\226\136\128 n : Num, P(n, f(n))) && (\226\136\128 n : Num, R(n, f(n), f(SUC(n)))))
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 R : (Num, A, A) -> Bool, (\226\136\131 a : A, P(0, a)) && (\226\136\128 n : Num, \226\136\128 x : A, P(n, x) \226\134\146 (\226\136\131 y : A, P(SUC(n), y) && R(n, x, y))) \226\134\146 (\226\136\131 f : (Num) -> A, (\226\136\128 n : Num, P(n, f(n))) && (\226\136\128 n : Num, R(n, f(n), f(SUC(n)))))
      #|  ((m : Num) == (n : Num)) == (NUMERAL(m) == n)
      #|  0
      #|  ((m : Num) == (n : Num)) == (BIT0(m) == 2 * n) && (m == n) == (BIT1(m) == 2 * n + 1)
      #|  (n : Num)
      #|  (m : Num)
      #|PRE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#PRE:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#PRE:fun(num,num) (#SUC:fun(num,num) n:num))) n:num))))
      #|ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) n:num)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num)) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))
      #|ADD_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) m:num)))
      #|ADD_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|ADD_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) n:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) m:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num)) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))
      #|ADD_SYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) n:num) m:num))))))
      #|ADD_ASSOC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#+:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num))))))))
      #|ADD_AC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) n:num) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#+:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) m:num) p:num)))))
      #|ADD_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|EQ_ADD_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) p:num))) ((#=:fun(num,fun(num,bool)) n:num) p:num))))))))
      #|EQ_ADD_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|EQ_ADD_LCANCEL_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) m:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|EQ_ADD_RCANCEL_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|BIT0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#BIT0:fun(num,num) n:num)) ((#+:fun(num,fun(num,num)) n:num) n:num))))
      #|BIT1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#BIT1:fun(num,num) n:num)) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) n:num)))))
      #|BIT0_THM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) n:num))) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) n:num)) (#NUMERAL:fun(num,num) n:num)))))
      #|BIT1_THM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) n:num))) (#SUC:fun(num,num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) n:num)) (#NUMERAL:fun(num,num) n:num))))))
      #|ONE =  |- ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#SUC:fun(num,num) (#NUMERAL:fun(num,num) #_0:num)))
      #|TWO =  |- ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#SUC:fun(num,num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|ADD1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|MULT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) n:num)))))))
      #|MULT_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))
      #|MULT_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) ((#+:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|MULT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) n:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) n:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) ((#+:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|MULT_SYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) n:num) m:num))))))
      #|LEFT_ADD_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num)))))))))
      #|RIGHT_ADD_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|MULT_ASSOC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) p:num))))))))
      #|MULT_AC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) n:num) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num)))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#*:fun(num,fun(num,num)) n:num) ((#*:fun(num,fun(num,num)) m:num) p:num)))))
      #|MULT_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|EQ_MULT_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) p:num)))))))))
      #|EQ_MULT_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|MULT_2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) ((#+:fun(num,fun(num,num)) n:num) n:num))))
      #|MULT_EQ_1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|EXP =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) ((#*:fun(num,fun(num,num)) m:num) ((#EXP:fun(num,fun(num,num)) m:num) n:num))))))))
      #|EXP_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|EXP_EQ_1 =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|EXP_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)))))
      #|EXP_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) ((#EXP:fun(num,fun(num,num)) m:num) p:num)))))))))
      #|EXP_ONE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|EXP_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))
      #|EXP_2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) n:num) n:num))))
      #|MULT_EXP =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) p:num)) ((#EXP:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|EXP_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#EXP:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) p:num))))))))
      #|EXP_EXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) x:num) m:num)) n:num)) ((#EXP:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|LE =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|LT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) #F:bool)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|GE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|GT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) m:num))))))
      #|MAX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MAX:fun(num,fun(num,num)) m:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) n:num) m:num))))))
      #|MIN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MIN:fun(num,fun(num,num)) m:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) m:num) n:num))))))
      #|LE_SUC_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) n:num)) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LT_SUC_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LE_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) (#SUC:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LT_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) (#SUC:fun(num,num) n:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LE_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)))
      #|LT_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))))
      #|LE_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) n:num)))
      #|LT_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#<:fun(num,fun(num,bool)) n:num) n:num))))
      #|LT_IMP_NE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|LE_ANTISYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LT_ANTISYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) m:num)))))))
      #|LET_ANTISYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) m:num)))))))
      #|LTE_ANTISYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))))))
      #|LE_TRANS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) p:num))) ((#<=:fun(num,fun(num,bool)) m:num) p:num))))))))
      #|LT_TRANS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) p:num))) ((#<:fun(num,fun(num,bool)) m:num) p:num))))))))
      #|LET_TRANS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) p:num))) ((#<:fun(num,fun(num,bool)) m:num) p:num))))))))
      #|LTE_TRANS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) p:num))) ((#<:fun(num,fun(num,bool)) m:num) p:num))))))))
      #|LE_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|LT_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|LET_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) m:num))))))
      #|LTE_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|LE_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|LT_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|NOT_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#<:fun(num,fun(num,bool)) n:num) m:num))))))
      #|NOT_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<:fun(num,fun(num,bool)) m:num) n:num))) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|LT_IMP_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|EQ_IMP_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LT_NZ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))
      #|LE_1 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|LE_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) d:num)))))))))
      #|LT_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) d:num))))))))))
      #|LE_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))
      #|LE_ADDR =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))
      #|LT_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))))))
      #|LT_ADDR =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num))))))
      #|LE_ADD_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) p:num))) ((#<=:fun(num,fun(num,bool)) n:num) p:num))))))))
      #|LE_ADD_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|LT_ADD_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) p:num))) ((#<:fun(num,fun(num,bool)) n:num) p:num))))))))
      #|LT_ADD_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|LE_ADD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) n:num) q:num))) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))))))))))
      #|LET_ADD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<:fun(num,fun(num,bool)) n:num) q:num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))))))))))
      #|LTE_ADD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) n:num) q:num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))))))))))
      #|LT_ADD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) p:num)) ((#<:fun(num,fun(num,bool)) n:num) q:num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))))))))))
      #|LT_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)))))))
      #|LE_MULT2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) p:num) q:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) q:num)))))))))))
      #|LT_LMULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) n:num) p:num))) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num)))))))))
      #|LE_MULT_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#<=:fun(num,fun(num,bool)) n:num) p:num)))))))))
      #|LE_MULT_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|LT_MULT_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) n:num) p:num)))))))))
      #|LT_MULT_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|LT_MULT2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) p:num) q:num))) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) q:num)))))))))))
      #|LE_SQUARE_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) n:num) n:num))))
      #|LT_POW2_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) n:num) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))))
      #|WLOG_LE =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((P:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) n:num) m:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) m:num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((P:fun(num,fun(num,bool)) m:num) n:num))))))
      #|WLOG_LT =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((P:fun(num,fun(num,bool)) m:num) m:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((P:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) n:num) m:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) m:num) n:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((P:fun(num,fun(num,bool)) m:num) y:num))))))
      #|WLOG_LE_3 =  |- (#forall:fun(fun(fun(num,fun(num,fun(num,bool))),bool),bool) (\P:fun(num,fun(num,fun(num,bool))). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) (((P:fun(num,fun(num,fun(num,bool))) x:num) y:num) z:num)) ((#/\:fun(bool,fun(bool,bool)) (((P:fun(num,fun(num,fun(num,bool))) y:num) x:num) z:num)) (((P:fun(num,fun(num,fun(num,bool))) x:num) z:num) y:num)))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) x:num) y:num)) ((#<=:fun(num,fun(num,bool)) y:num) z:num))) (((P:fun(num,fun(num,fun(num,bool))) x:num) y:num) z:num)))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. (((P:fun(num,fun(num,fun(num,bool))) x:num) y:num) z:num))))))))))
      #|num_WF =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (P:fun(num,bool) m:num))))) (P:fun(num,bool) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))
      #|num_WOP =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num)))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) (P:fun(num,bool) m:num)))))))))))
      #|num_MAX =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. (P:fun(num,bool) x:num)))) (#?:fun(fun(num,bool),bool) (\M:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) x:num)) ((#<=:fun(num,fun(num,bool)) x:num) M:num)))))))) (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) m:num)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) x:num)) ((#<=:fun(num,fun(num,bool)) x:num) m:num))))))))))
      #|LE_INDUCT =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\P:fun(num,fun(num,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((P:fun(num,fun(num,bool)) m:num) m:num)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) m:num) n:num))) ((P:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((P:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|num_INDUCTION_DOWN =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) (P:fun(num,bool) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (P:fun(num,bool) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (P:fun(num,bool) n:num)))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))))
      #|EVEN =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) #T:bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) (#SUC:fun(num,num) n:num))) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))))))
      #|ODD =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) #F:bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#SUC:fun(num,num) n:num))) (#~:fun(bool,bool) (#ODD:fun(num,bool) n:num))))))
      #|NOT_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) (#ODD:fun(num,bool) n:num))))
      #|NOT_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#ODD:fun(num,bool) n:num))) (#EVEN:fun(num,bool) n:num))))
      #|EVEN_OR_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#ODD:fun(num,bool) n:num))))
      #|EVEN_AND_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#ODD:fun(num,bool) n:num)))))
      #|EVEN_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) m:num)) (#EVEN:fun(num,bool) n:num)))))))
      #|EVEN_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) m:num)) (#EVEN:fun(num,bool) n:num)))))))
      #|EVEN_EXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#EXP:fun(num,fun(num,num)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) m:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|ODD_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) ((#+:fun(num,fun(num,num)) m:num) n:num))) (#~:fun(bool,bool) ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) m:num)) (#ODD:fun(num,bool) n:num))))))))
      #|ODD_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) m:num)) (#ODD:fun(num,bool) n:num)))))))
      #|ODD_EXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) ((#EXP:fun(num,fun(num,num)) m:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) m:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|EVEN_DOUBLE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#EVEN:fun(num,bool) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))))
      #|ODD_DOUBLE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#ODD:fun(num,bool) (#SUC:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))))
      #|EVEN_EXISTS_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#?:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)))))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) (#?:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)))))))))
      #|EVEN_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#?:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)))))))
      #|ODD_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) (#?:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))))))))
      #|EVEN_ODD_DECOMPOSITION =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) m:num)) ((#=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) m:num)))))))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SUB =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) m:num)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num))) (#PRE:fun(num,num) ((#-:fun(num,fun(num,num)) m:num) n:num))))))))
      #|SUB_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) #_0:num))) m:num))))
      #|SUB_PRESUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#PRE:fun(num,num) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num))) ((#-:fun(num,fun(num,num)) m:num) n:num))))))
      #|SUB_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) (#SUC:fun(num,num) n:num))) ((#-:fun(num,fun(num,num)) m:num) n:num))))))
      #|SUB_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) n:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))))
      #|ADD_SUB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) n:num)) m:num)))))
      #|ADD_SUB2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) m:num)) n:num)))))
      #|SUB_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|ADD_SUBR2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) (#NUMERAL:fun(num,num) #_0:num))))))
      #|ADD_SUBR =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SUB_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) n:num)) n:num)) m:num))))))
      #|SUB_ADD_LCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) p:num))) ((#-:fun(num,fun(num,num)) n:num) p:num))))))))
      #|SUB_ADD_RCANCEL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#-:fun(num,fun(num,num)) m:num) n:num))))))))
      #|LEFT_SUB_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#-:fun(num,fun(num,num)) n:num) p:num))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num)))))))))
      #|RIGHT_SUB_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|SUC_SUB1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))
      #|EVEN_SUB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#-:fun(num,fun(num,num)) m:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) m:num)) (#EVEN:fun(num,bool) n:num))))))))
      #|ODD_SUB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) ((#-:fun(num,fun(num,num)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (#~:fun(bool,bool) ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) m:num)) (#ODD:fun(num,bool) n:num)))))))))
      #|FACT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#FACT:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#FACT:fun(num,num) (#SUC:fun(num,num) n:num))) ((#*:fun(num,fun(num,num)) (#SUC:fun(num,num) n:num)) (#FACT:fun(num,num) n:num))))))
      #|FACT_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#FACT:fun(num,num) n:num))))
      #|FACT_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#FACT:fun(num,num) n:num))))
      #|FACT_NZ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (#FACT:fun(num,num) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|FACT_MONO =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) (#FACT:fun(num,num) m:num)) (#FACT:fun(num,num) n:num)))))))
      #|EXP_LT_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) ((#EXP:fun(num,fun(num,num)) x:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|LT_EXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) m:num)) ((#EXP:fun(num,fun(num,num)) x:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num)) ((#<:fun(num,fun(num,bool)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|LE_EXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) m:num)) ((#EXP:fun(num,fun(num,num)) x:num) n:num))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))))))
      #|EQ_EXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) m:num)) ((#EXP:fun(num,fun(num,num)) x:num) n:num))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))))
      #|EXP_MONO_LE_IMP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) x:num) y:num)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num)))))))))
      #|EXP_MONO_LT_IMP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) x:num) y:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num)))))))))
      #|EXP_MONO_LE =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) x:num) y:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|EXP_MONO_LT =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) x:num) y:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|EXP_MONO_EQ =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) y:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|DIVMOD_EXIST =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\r:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num)))))))))))
      #|DIVMOD_EXIST_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\r:num. (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) q:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) r:num) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num)))))))))))
      #|DIVISION_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)))) ((#<:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)))))))
      #|DIVISION =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)))) ((#<:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)))))))
      #|DIV_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))
      #|MOD_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) #_0:num))) n:num)))
      #|DIVISION_SIMP =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) m:num)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) ((#DIV:fun(num,fun(num,num)) m:num) n:num))) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) m:num))))))
      #|EQ_DIVMOD =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) p:num)) ((#DIV:fun(num,fun(num,num)) n:num) p:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) p:num)) ((#MOD:fun(num,fun(num,num)) n:num) p:num)))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|MOD_LT_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|MOD_LT_EQ_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))))))
      #|DIVMOD_UNIQ_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q1:num. (#forall:fun(fun(num,bool),bool) (\r1:num. (#forall:fun(fun(num,bool),bool) (\q2:num. (#forall:fun(fun(num,bool),bool) (\r2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q1:num) n:num)) r1:num))) ((#<:fun(num,fun(num,bool)) r1:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q2:num) n:num)) r2:num))) ((#<:fun(num,fun(num,bool)) r2:num) n:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) q1:num) q2:num)) ((#=:fun(num,fun(num,bool)) r1:num) r2:num)))))))))))))))
      #|DIVMOD_UNIQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) q:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) r:num)))))))))))
      #|MOD_UNIQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) r:num))))))))))
      #|DIV_UNIQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) q:num))))))))))
      #|DIV_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#NUMERAL:fun(num,num) #_0:num))))
      #|MOD_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (#NUMERAL:fun(num,num) #_0:num))))
      #|DIV_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) m:num)) n:num))))))
      #|MOD_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) m:num)) (#NUMERAL:fun(num,num) #_0:num))))))
      #|MOD_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) m:num))))))
      #|MOD_EQ_SELF =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) m:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|MOD_CASES =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) p:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<:fun(num,fun(num,bool)) n:num) p:num)) n:num) ((#-:fun(num,fun(num,num)) n:num) p:num))))))))
      #|MOD_ADD_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) p:num)) ((#<:fun(num,fun(num,bool)) n:num) p:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num))))))))))
      #|MOD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) ((#*:fun(num,fun(num,num)) q:num) p:num)))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) p:num)) ((#MOD:fun(num,fun(num,num)) n:num) p:num)))))))))))
      #|DIV_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) m:num)))))
      #|DIV_MUL_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) n:num) ((#DIV:fun(num,fun(num,num)) m:num) n:num))) m:num)))))
      #|MOD_LE_TWICE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#MOD:fun(num,fun(num,num)) n:num) m:num))) n:num))))))
      #|DIV_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))
      #|MOD_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num))))
      #|DIV_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|MOD_MOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num))))))))
      #|MOD_MOD_REFL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num))))))
      #|MOD_MOD_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) n:num) p:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|MOD_EVEN_2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#MOD:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|DIV_MULT2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))) ((#DIV:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|MOD_MULT2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))) ((#*:fun(num,fun(num,num)) m:num) ((#MOD:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|MOD_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) m:num) ((#*:fun(num,fun(num,num)) n:num) q:num))))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|LE_RDIV_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) ((#DIV:fun(num,fun(num,num)) b:num) a:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) n:num)) b:num)))))))))
      #|RDIV_LT_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) b:num) a:num)) n:num)) ((#<:fun(num,fun(num,bool)) b:num) ((#*:fun(num,fun(num,num)) a:num) n:num))))))))))
      #|LE_LDIV_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) b:num) a:num)) n:num)) ((#<:fun(num,fun(num,bool)) b:num) ((#*:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|LDIV_LT_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) ((#DIV:fun(num,fun(num,num)) b:num) a:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) b:num)))))))))
      #|LE_LDIV =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) b:num) ((#*:fun(num,fun(num,num)) a:num) n:num)))) ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) b:num) a:num)) n:num))))))))
      #|DIV_MONO =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) p:num)) ((#DIV:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|DIV_MONO_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) n:num))) ((#<:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) p:num)) ((#DIV:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|DIV_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|MOD_DIV_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|MOD_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) m:num) ((#*:fun(num,fun(num,num)) q:num) n:num)))))))))
      #|DIV_EQ_SELF =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) m:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|MOD_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))))
      #|EVEN_MOD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) #_0:num)))))
      #|ODD_MOD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|MOD_2_CASES =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#COND:fun(bool,fun(num,fun(num,num))) (#EVEN:fun(num,bool) n:num)) (#NUMERAL:fun(num,num) #_0:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|EVEN_MOD_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) (#EVEN:fun(num,bool) m:num)))))))
      #|ODD_MOD_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) (#ODD:fun(num,bool) m:num)))))))
      #|HALF_DOUBLE =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|DOUBLE_HALF =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))))
      #|MOD_MULT_RMOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) ((#MOD:fun(num,fun(num,num)) p:num) n:num))) n:num)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) p:num)) n:num))))))))
      #|MOD_MULT_LMOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) p:num)) n:num)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) p:num)) n:num))))))))
      #|MOD_MULT_MOD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) ((#MOD:fun(num,fun(num,num)) p:num) n:num))) n:num)) ((#MOD:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) p:num)) n:num))))))))
      #|MOD_EXP_MOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) p:num)) n:num)) ((#MOD:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) p:num)) n:num))))))))
      #|MOD_MULT_ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) p:num)) n:num)) ((#MOD:fun(num,fun(num,num)) p:num) n:num))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) m:num)) p:num)) n:num)) ((#MOD:fun(num,fun(num,num)) p:num) n:num))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) m:num) n:num))) n:num)) ((#MOD:fun(num,fun(num,num)) p:num) n:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) n:num) m:num))) n:num)) ((#MOD:fun(num,fun(num,num)) p:num) n:num)))))))))))
      #|DIV_MULT_ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) n:num)) b:num)) n:num)) ((#+:fun(num,fun(num,num)) a:num) ((#DIV:fun(num,fun(num,num)) b:num) n:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) a:num)) b:num)) n:num)) ((#+:fun(num,fun(num,num)) a:num) ((#DIV:fun(num,fun(num,num)) b:num) n:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) b:num) ((#*:fun(num,fun(num,num)) a:num) n:num))) n:num)) ((#+:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) b:num) n:num)) a:num)))))))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) b:num) ((#*:fun(num,fun(num,num)) n:num) a:num))) n:num)) ((#+:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) b:num) n:num)) a:num))))))))))))
      #|MOD_ADD_MOD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) a:num) n:num)) ((#MOD:fun(num,fun(num,num)) b:num) n:num))) n:num)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) b:num)) n:num))))))))
      #|DIV_ADD_MOD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) b:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) a:num) n:num)) ((#MOD:fun(num,fun(num,num)) b:num) n:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) b:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) a:num) n:num)) ((#DIV:fun(num,fun(num,num)) b:num) n:num)))))))))))
      #|MOD_ADD_EQ_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num))) n:num)))))))))
      #|DIV_ADD_EQ_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) x:num) n:num)) ((#DIV:fun(num,fun(num,num)) y:num) n:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num))) n:num)))))))))
      #|DIV_ADD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num))) n:num)) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) x:num) n:num)) ((#DIV:fun(num,fun(num,num)) y:num) n:num))))))))))
      #|MOD_ADD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num))) n:num)) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) n:num)) ((#+:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) n:num)) ((#MOD:fun(num,fun(num,num)) y:num) n:num))))))))))
      #|DIV_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) n:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|MOD_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) n:num)) m:num)))))
      #|DIV_MONO2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) p:num) m:num))) ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) n:num) m:num)) ((#DIV:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|DIV_LE_EXCLUSION =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) b:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) b:num) c:num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:num)))) ((#<=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) c:num) d:num)) ((#DIV:fun(num,fun(num,num)) a:num) b:num)))))))))))
      #|DIV_EQ_EXCLUSION =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) b:num) c:num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:num))) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) d:num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) c:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) b:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) a:num) b:num)) ((#DIV:fun(num,fun(num,num)) c:num) d:num)))))))))))
      #|MULT_DIV_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#DIV:fun(num,fun(num,num)) n:num) p:num))) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) p:num))))))))
      #|DIV_DIV =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#DIV:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|DIV_MOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#DIV:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) n:num))))))))
      #|MOD_MULT_MOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) ((#MOD:fun(num,fun(num,num)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) p:num))) ((#MOD:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|MOD_MOD_EXP_MIN =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#MOD:fun(num,fun(num,num)) x:num) ((#EXP:fun(num,fun(num,num)) p:num) m:num))) ((#EXP:fun(num,fun(num,num)) p:num) n:num))) ((#MOD:fun(num,fun(num,num)) x:num) ((#EXP:fun(num,fun(num,num)) p:num) ((#MIN:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|DIV_EXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) ((#EXP:fun(num,fun(num,num)) m:num) p:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<=:fun(num,fun(num,bool)) p:num) n:num)) ((#EXP:fun(num,fun(num,num)) m:num) ((#-:fun(num,fun(num,num)) n:num) p:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|MOD_EXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) ((#EXP:fun(num,fun(num,num)) m:num) p:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) n:num)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) #_0:num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num))))))))))
      #|FORALL_LT_MOD_THM =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) n:num)) (P:fun(num,bool) a:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\a:num. (P:fun(num,bool) ((#MOD:fun(num,fun(num,num)) a:num) n:num))))))))))
      #|FORALL_MOD_THM =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (P:fun(num,bool) ((#MOD:fun(num,fun(num,num)) a:num) n:num))))) (#forall:fun(fun(num,bool),bool) (\a:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) n:num)) (P:fun(num,bool) a:num))))))))))
      #|EXISTS_LT_MOD_THM =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\a:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) n:num)) (P:fun(num,bool) a:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\a:num. (P:fun(num,bool) ((#MOD:fun(num,fun(num,num)) a:num) n:num))))))))))
      #|EXISTS_MOD_THM =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\a:num. (P:fun(num,bool) ((#MOD:fun(num,fun(num,num)) a:num) n:num))))) (#?:fun(fun(num,bool),bool) (\a:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) n:num)) (P:fun(num,bool) a:num))))))))))
      #|PRE_ELIM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#PRE:fun(num,num) n:num))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) (P:fun(num,bool) m:num)))))
      #|PRE_ELIM_THM' =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#PRE:fun(num,num) n:num))) (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) (P:fun(num,bool) m:num)))))
      #|SUB_ELIM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(num,bool) ((#-:fun(num,fun(num,num)) a:num) b:num))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#+:fun(num,fun(num,num)) b:num) d:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) b:num)) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) #_0:num))))) (P:fun(num,bool) d:num)))))
      #|SUB_ELIM_THM' =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(num,bool) ((#-:fun(num,fun(num,num)) a:num) b:num))) (#?:fun(fun(num,bool),bool) (\d:num. ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#+:fun(num,fun(num,num)) b:num) d:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) b:num)) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) #_0:num))))) (P:fun(num,bool) d:num)))))
      #|DIVMOD_ELIM_THM =  |- ((#=:fun(bool,fun(bool,bool)) ((P:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) q:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) r:num) m:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num)))) ((P:fun(num,fun(num,bool)) q:num) r:num)))))))
      #|DIVMOD_ELIM_THM' =  |- ((#=:fun(bool,fun(bool,bool)) ((P:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) m:num) n:num)) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\r:num. ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) q:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) r:num) m:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#<:fun(num,fun(num,bool)) r:num) n:num)))) ((P:fun(num,fun(num,bool)) q:num) r:num)))))))
      #|minimal =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(num,fun(num,bool)) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))) (#@:fun(fun(num,bool),num) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) (P:fun(num,bool) m:num)))))))))))
      #|MINIMAL =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num)))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#minimal:fun(fun(num,bool),num) P:fun(num,bool)))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#minimal:fun(fun(num,bool),num) P:fun(num,bool)))) (#~:fun(bool,bool) (P:fun(num,bool) m:num)))))))))
      #|MINIMAL_UNIQUE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) (P:fun(num,bool) m:num))))))) ((#=:fun(num,fun(num,bool)) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))) n:num))))))
      #|LE_MINIMAL =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\r:num. (P:fun(num,bool) r:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#minimal:fun(fun(num,bool),num) P:fun(num,bool)))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) i:num)) ((#<=:fun(num,fun(num,bool)) n:num) i:num))))))))))
      #|MINIMAL_LE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\r:num. (P:fun(num,bool) r:num)))) ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))) n:num)) (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) (P:fun(num,bool) i:num))))))))))
      #|MINIMAL_UBOUND =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) ((#<=:fun(num,fun(num,bool)) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))) n:num))))))
      #|MINIMAL_LBOUND =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\r:num. (P:fun(num,bool) r:num)))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#~:fun(bool,bool) (P:fun(num,bool) m:num))))))) ((#<=:fun(num,fun(num,bool)) n:num) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))))))))
      #|MINIMAL_MONO =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(fun(num,bool),bool),bool) (\Q:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (Q:fun(num,bool) n:num)))))) ((#<=:fun(num,fun(num,bool)) (#minimal:fun(fun(num,bool),num) Q:fun(num,bool))) (#minimal:fun(fun(num,bool),num) P:fun(num,bool))))))))
      #|TRANSITIVE_STEPWISE_LT_EQ =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) x:num) y:num)) ((R:fun(num,fun(num,bool)) y:num) z:num))) ((R:fun(num,fun(num,bool)) x:num) z:num))))))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m:num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num))))))))
      #|TRANSITIVE_STEPWISE_LT =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) x:num) y:num)) ((R:fun(num,fun(num,bool)) y:num) z:num))) ((R:fun(num,fun(num,bool)) x:num) z:num))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|TRANSITIVE_STEPWISE_LE_EQ =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((R:fun(num,fun(num,bool)) x:num) x:num)))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) x:num) y:num)) ((R:fun(num,fun(num,bool)) y:num) z:num))) ((R:fun(num,fun(num,bool)) x:num) z:num)))))))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m:num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num))))))))
      #|TRANSITIVE_STEPWISE_LE =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((R:fun(num,fun(num,bool)) x:num) x:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) x:num) y:num)) ((R:fun(num,fun(num,bool)) y:num) z:num))) ((R:fun(num,fun(num,bool)) x:num) z:num))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|DEPENDENT_CHOICE_FIXED =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,fun('A,bool))),bool),bool) (\R:fun(num,fun('A,fun('A,bool))). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num)) a:'A)) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) n:num) x:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num)) y:'A)) (((R:fun(num,fun('A,fun('A,bool))) n:num) x:'A) y:'A))))))))))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((P:fun(num,fun('A,bool)) n:num) (f:fun(num,'A) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((R:fun(num,fun('A,fun('A,bool))) n:num) (f:fun(num,'A) n:num)) (f:fun(num,'A) (#SUC:fun(num,num) n:num))))))))))))))))
      #|DEPENDENT_CHOICE =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,fun('A,bool))),bool),bool) (\R:fun(num,fun('A,fun('A,bool))). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\a:'A. ((P:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num)) a:'A)))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) n:num) x:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num)) y:'A)) (((R:fun(num,fun('A,fun('A,bool))) n:num) x:'A) y:'A))))))))))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((P:fun(num,fun('A,bool)) n:num) (f:fun(num,'A) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((R:fun(num,fun('A,fun('A,bool))) n:num) (f:fun(num,'A) n:num)) (f:fun(num,'A) (#SUC:fun(num,num) n:num)))))))))))))
      #|types = num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 58
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _6923:bool
      #|
    ),
  )
}
