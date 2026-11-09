// Unity/mk_state_logic.ml in its directory's load order: the test block of
// unity/mk_state_logic/mk_state_logic_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Unity_mk_state_logic_ref.expected).

///|
test "Unity/mk_state_logic matches Unity/mk_state_logic.ml" {
  @testkit.release_output()
  @mk_state_logic.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Examples/hol88", "Unity/aux_definitions", "Unity/mk_state_logic",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Unity/mk_state_logic")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("FALSE_def", () => sthm(@mk_state_logic.false_def()))
  log.attempt("TRUE_def", () => sthm(@mk_state_logic.true_def()))
  log.attempt("NOT_def1", () => sthm(@mk_state_logic.not_def1()))
  log.attempt("NOT_def2", () => sthm(@mk_state_logic.not_def2()))
  log.attempt("AND_def", () => sthm(@mk_state_logic.and_def()))
  log.attempt("OR_def", () => sthm(@mk_state_logic.or_def()))
  log.attempt("FORALL_def", () => sthm(@mk_state_logic.forall_def()))
  log.attempt("EXISTS_def", () => sthm(@mk_state_logic.exists_def()))
  log.attempt("CHOICE_def", () => sthm(@mk_state_logic.choice_def()))
  log.attempt("IMPLIES_def", () => sthm(@mk_state_logic.implies_def()))
  log.attempt("LESS_def", () => sthm(@mk_state_logic.less_def()))
  log.attempt("GREATER_def", () => sthm(@mk_state_logic.greater_def()))
  log.attempt("LESS_EQ_def", () => sthm(@mk_state_logic.less_eq_def()))
  log.attempt("GREATER_EQ_def", () => sthm(@mk_state_logic.greater_eq_def()))
  log.attempt("EQ_def", () => sthm(@mk_state_logic.eq_def()))
  log.attempt("NEQ_def", () => sthm(@mk_state_logic.neq_def()))
  log.attempt("GE_def", () => sthm(@mk_state_logic.ge_def()))
  log.attempt("PLUS_def", () => sthm(@mk_state_logic.plus_def()))
  log.attempt("SUB_def", () => sthm(@mk_state_logic.sub_def()))
  log.attempt("MUL_def", () => sthm(@mk_state_logic.mul_def()))
  log.attempt("SUC_def", () => sthm(@mk_state_logic.suc_def()))
  log.attempt("PRE_def", () => sthm(@mk_state_logic.pre_def()))
  log.attempt("MOD_def", () => sthm(@mk_state_logic.mod_def()))
  log.attempt("DIV_def", () => sthm(@mk_state_logic.div_def()))
  log.attempt("EXP_def", () => sthm(@mk_state_logic.exp_def()))
  log.attempt("IND_def", () => sthm(@mk_state_logic.ind_def()))
  log.attempt("FORALL_LE_def", () => sthm(@mk_state_logic.forall_le_def()))
  log.attempt("EXISTS_LE_def", () => sthm(@mk_state_logic.exists_le_def()))
  log.attempt("EXISTS_LT_def", () => sthm(@mk_state_logic.exists_lt_def()))
  log.attempt("AND_LE_N_def", () => sthm(@mk_state_logic.and_le_n_def()))
  log.attempt("OR_LE_N_def", () => sthm(@mk_state_logic.or_le_n_def()))
  log.attempt("AND_LT_N_def", () => sthm(@mk_state_logic.and_lt_n_def()))
  log.attempt("OR_LT_N_def", () => sthm(@mk_state_logic.or_lt_n_def()))
  log.attempt("IMPLY_WEAK_lemma1", () => {
    sthm(@mk_state_logic.imply_weak_lemma1())
  })
  log.attempt("IMPLY_WEAK_lemma2", () => {
    sthm(@mk_state_logic.imply_weak_lemma2())
  })
  log.attempt("IMPLY_WEAK_lemma3", () => {
    sthm(@mk_state_logic.imply_weak_lemma3())
  })
  log.attempt("IMPLY_WEAK_lemma4", () => {
    sthm(@mk_state_logic.imply_weak_lemma4())
  })
  log.attempt("IMPLY_WEAK_lemma5", () => {
    sthm(@mk_state_logic.imply_weak_lemma5())
  })
  log.attempt("IMPLY_WEAK_lemma6", () => {
    sthm(@mk_state_logic.imply_weak_lemma6())
  })
  log.attempt("IMPLY_WEAK_lemma7", () => {
    sthm(@mk_state_logic.imply_weak_lemma7())
  })
  log.attempt("CONJ_COMM_DISJ_lemma_a", () => {
    sthm(@mk_state_logic.conj_comm_disj_lemma_a())
  })
  log.attempt("CONJ_COMM_DISJ_lemma_b", () => {
    sthm(@mk_state_logic.conj_comm_disj_lemma_b())
  })
  log.attempt("CONJ_COMM_DISJ_lemma", () => {
    sthm(@mk_state_logic.conj_comm_disj_lemma())
  })
  log.attempt("AND_COMM_OR_lemma", () => {
    sthm(@mk_state_logic.and_comm_or_lemma())
  })
  log.attempt("CONJ_DISJ_COMM_lemma_a", () => {
    sthm(@mk_state_logic.conj_disj_comm_lemma_a())
  })
  log.attempt("CONJ_DISJ_COMM_lemma_b", () => {
    sthm(@mk_state_logic.conj_disj_comm_lemma_b())
  })
  log.attempt("CONJ_DISJ_COMM_lemma", () => {
    sthm(@mk_state_logic.conj_disj_comm_lemma())
  })
  log.attempt("AND_OR_COMM_lemma", () => {
    sthm(@mk_state_logic.and_or_comm_lemma())
  })
  log.attempt("DISJ_COMM_CONJ_lemma_a", () => {
    sthm(@mk_state_logic.disj_comm_conj_lemma_a())
  })
  log.attempt("DISJ_COMM_CONJ_lemma_b", () => {
    sthm(@mk_state_logic.disj_comm_conj_lemma_b())
  })
  log.attempt("DISJ_COMM_CONJ_lemma", () => {
    sthm(@mk_state_logic.disj_comm_conj_lemma())
  })
  log.attempt("OR_COMM_AND_lemma", () => {
    sthm(@mk_state_logic.or_comm_and_lemma())
  })
  log.attempt("DISJ_COMM_DISJ_lemma_a", () => {
    sthm(@mk_state_logic.disj_comm_disj_lemma_a())
  })
  log.attempt("DISJ_COMM_DISJ_lemma_b", () => {
    sthm(@mk_state_logic.disj_comm_disj_lemma_b())
  })
  log.attempt("DISJ_COMM_DISJ_lemma", () => {
    sthm(@mk_state_logic.disj_comm_disj_lemma())
  })
  log.attempt("OR_COMM_OR_lemma", () => sthm(@mk_state_logic.or_comm_or_lemma()))
  log.attempt("DISJ_DISJ_COMM_lemma_a", () => {
    sthm(@mk_state_logic.disj_disj_comm_lemma_a())
  })
  log.attempt("DISJ_DISJ_COMM_lemma_b", () => {
    sthm(@mk_state_logic.disj_disj_comm_lemma_b())
  })
  log.attempt("DISJ_DISJ_COMM_lemma", () => {
    sthm(@mk_state_logic.disj_disj_comm_lemma())
  })
  log.attempt("OR_OR_COMM_lemma", () => sthm(@mk_state_logic.or_or_comm_lemma()))
  log.attempt("CONJ_COMM_CONJ_lemma_a", () => {
    sthm(@mk_state_logic.conj_comm_conj_lemma_a())
  })
  log.attempt("CONJ_COMM_CONJ_lemma_b", () => {
    sthm(@mk_state_logic.conj_comm_conj_lemma_b())
  })
  log.attempt("CONJ_COMM_CONJ_lemma", () => {
    sthm(@mk_state_logic.conj_comm_conj_lemma())
  })
  log.attempt("AND_COMM_AND_lemma", () => {
    sthm(@mk_state_logic.and_comm_and_lemma())
  })
  log.attempt("CONJ_CONJ_COMM_lemma_a", () => {
    sthm(@mk_state_logic.conj_conj_comm_lemma_a())
  })
  log.attempt("CONJ_CONJ_COMM_lemma_b", () => {
    sthm(@mk_state_logic.conj_conj_comm_lemma_b())
  })
  log.attempt("CONJ_CONJ_COMM_lemma", () => {
    sthm(@mk_state_logic.conj_conj_comm_lemma())
  })
  log.attempt("AND_AND_COMM_lemma", () => {
    sthm(@mk_state_logic.and_and_comm_lemma())
  })
  log.attempt("DISJ_CONJ_COMM_lemma_a", () => {
    sthm(@mk_state_logic.disj_conj_comm_lemma_a())
  })
  log.attempt("DISJ_CONJ_COMM_lemma_b", () => {
    sthm(@mk_state_logic.disj_conj_comm_lemma_b())
  })
  log.attempt("DISJ_CONJ_COMM_lemma", () => {
    sthm(@mk_state_logic.disj_conj_comm_lemma())
  })
  log.attempt("OR_AND_COMM_lemma", () => {
    sthm(@mk_state_logic.or_and_comm_lemma())
  })
  log.attempt("NOT_NOT_lemma", () => sthm(@mk_state_logic.not_not_lemma()))
  log.attempt("DISJ_COMM_lemma", () => sthm(@mk_state_logic.disj_comm_lemma()))
  log.attempt("OR_COMM_lemma", () => sthm(@mk_state_logic.or_comm_lemma()))
  log.attempt("OR_OR_lemma", () => sthm(@mk_state_logic.or_or_lemma()))
  log.attempt("DISJ_ASSOC_lemma", () => sthm(@mk_state_logic.disj_assoc_lemma()))
  log.attempt("OR_ASSOC_lemma", () => sthm(@mk_state_logic.or_assoc_lemma()))
  log.attempt("CONJ_WEAK_lemma", () => sthm(@mk_state_logic.conj_weak_lemma()))
  log.attempt("AND_IMPLY_WEAK_lemma", () => {
    sthm(@mk_state_logic.and_imply_weak_lemma())
  })
  log.attempt("SYM_CONJ_WEAK_lemma", () => {
    sthm(@mk_state_logic.sym_conj_weak_lemma())
  })
  log.attempt("SYM_AND_IMPLY_WEAK_lemma", () => {
    sthm(@mk_state_logic.sym_and_imply_weak_lemma())
  })
  log.attempt("OR_IMPLY_WEAK_lemma", () => {
    sthm(@mk_state_logic.or_imply_weak_lemma())
  })
  log.attempt("SYM_OR_IMPLY_WEAK_lemma", () => {
    sthm(@mk_state_logic.sym_or_imply_weak_lemma())
  })
  log.attempt("IMPLY_WEAK_AND_lemma", () => {
    sthm(@mk_state_logic.imply_weak_and_lemma())
  })
  log.attempt("IMPLY_WEAK_OR_lemma", () => {
    sthm(@mk_state_logic.imply_weak_or_lemma())
  })
  log.attempt("AND_AND_lemma", () => sthm(@mk_state_logic.and_and_lemma()))
  log.attempt("CONJ_COMM_lemma", () => sthm(@mk_state_logic.conj_comm_lemma()))
  log.attempt("AND_COMM_lemma", () => sthm(@mk_state_logic.and_comm_lemma()))
  log.attempt("CONJ_ASSOC_lemma", () => sthm(@mk_state_logic.conj_assoc_lemma()))
  log.attempt("AND_ASSOC_lemma", () => sthm(@mk_state_logic.and_assoc_lemma()))
  log.attempt("NOT_True_lemma", () => sthm(@mk_state_logic.not_true_lemma()))
  log.attempt("NOT_False_lemma", () => sthm(@mk_state_logic.not_false_lemma()))
  log.attempt("AND_True_lemma", () => sthm(@mk_state_logic.and_true_lemma()))
  log.attempt("OR_True_lemma", () => sthm(@mk_state_logic.or_true_lemma()))
  log.attempt("AND_False_lemma", () => sthm(@mk_state_logic.and_false_lemma()))
  log.attempt("OR_False_lemma", () => sthm(@mk_state_logic.or_false_lemma()))
  log.attempt("P_OR_NOT_P_lemma", () => sthm(@mk_state_logic.p_or_not_p_lemma()))
  log.attempt("P_AND_NOT_P_lemma", () => {
    sthm(@mk_state_logic.p_and_not_p_lemma())
  })
  log.attempt("CONJ_COMPL_DISJ_lemma1", () => {
    sthm(@mk_state_logic.conj_compl_disj_lemma1())
  })
  log.attempt("CONJ_COMPL_DISJ_lemma2", () => {
    sthm(@mk_state_logic.conj_compl_disj_lemma2())
  })
  log.attempt("CONJ_COMPL_DISJ_lemma", () => {
    sthm(@mk_state_logic.conj_compl_disj_lemma())
  })
  log.attempt("AND_COMPL_OR_lemma", () => {
    sthm(@mk_state_logic.and_compl_or_lemma())
  })
  log.attempt("DISJ_NOT_CONJ_lemma1", () => {
    sthm(@mk_state_logic.disj_not_conj_lemma1())
  })
  log.attempt("DISJ_NOT_CONJ_lemma2", () => {
    sthm(@mk_state_logic.disj_not_conj_lemma2())
  })
  log.attempt("DISJ_NOT_CONJ_lemma", () => {
    sthm(@mk_state_logic.disj_not_conj_lemma())
  })
  log.attempt("OR_NOT_AND_lemma", () => sthm(@mk_state_logic.or_not_and_lemma()))
  log.attempt("P_CONJ_Q_DISJ_Q_lemma1", () => {
    sthm(@mk_state_logic.p_conj_q_disj_q_lemma1())
  })
  log.attempt("P_CONJ_Q_DISJ_Q_lemma2", () => {
    sthm(@mk_state_logic.p_conj_q_disj_q_lemma2())
  })
  log.attempt("P_CONJ_Q_DISJ_Q_lemma", () => {
    sthm(@mk_state_logic.p_conj_q_disj_q_lemma())
  })
  log.attempt("P_AND_Q_OR_Q_lemma", () => {
    sthm(@mk_state_logic.p_and_q_or_q_lemma())
  })
  log.attempt("P_DISJ_Q_CONJ_Q_lemma1", () => {
    sthm(@mk_state_logic.p_disj_q_conj_q_lemma1())
  })
  log.attempt("P_DISJ_Q_CONJ_Q_lemma2", () => {
    sthm(@mk_state_logic.p_disj_q_conj_q_lemma2())
  })
  log.attempt("P_DISJ_Q_CONJ_Q_lemma", () => {
    sthm(@mk_state_logic.p_disj_q_conj_q_lemma())
  })
  log.attempt("P_OR_Q_AND_Q_lemma", () => {
    sthm(@mk_state_logic.p_or_q_and_q_lemma())
  })
  log.attempt("NOT_OR_AND_NOT_lemma", () => {
    sthm(@mk_state_logic.not_or_and_not_lemma())
  })
  log.attempt("NOT_AND_OR_NOT_lemma", () => {
    sthm(@mk_state_logic.not_and_or_not_lemma())
  })
  log.attempt("NOT_IMPLY_OR_lemma", () => {
    sthm(@mk_state_logic.not_imply_or_lemma())
  })
  log.attempt("IMPLY_OR_lemma", () => sthm(@mk_state_logic.imply_or_lemma()))
  log.attempt("OR_IMPLY_lemma", () => sthm(@mk_state_logic.or_imply_lemma()))
  log.attempt("NOT_OR_IMPLY_lemma", () => {
    sthm(@mk_state_logic.not_or_imply_lemma())
  })
  log.attempt("DISJ_CONJ_lemma1", () => sthm(@mk_state_logic.disj_conj_lemma1()))
  log.attempt("DISJ_CONJ_lemma2", () => sthm(@mk_state_logic.disj_conj_lemma2()))
  log.attempt("DISJ_CONJ_lemma", () => sthm(@mk_state_logic.disj_conj_lemma()))
  log.attempt("OR_AND_DISTR_lemma", () => {
    sthm(@mk_state_logic.or_and_distr_lemma())
  })
  log.attempt("CONJ_DISJ_lemma1", () => sthm(@mk_state_logic.conj_disj_lemma1()))
  log.attempt("CONJ_DISJ_lemma2", () => sthm(@mk_state_logic.conj_disj_lemma2()))
  log.attempt("CONJ_DISJ_lemma", () => sthm(@mk_state_logic.conj_disj_lemma()))
  log.attempt("AND_OR_DISTR_lemma", () => {
    sthm(@mk_state_logic.and_or_distr_lemma())
  })
  log.attempt("NOT_IMPLIES_False_lemma", () => {
    sthm(@mk_state_logic.not_implies_false_lemma())
  })
  log.attempt("NOT_P_IMPLIES_P_EQ_False_lemma", () => {
    sthm(@mk_state_logic.not_p_implies_p_eq_false_lemma())
  })
  log.attempt("NOT_AND_IMPLIES_lemma", () => {
    sthm(@mk_state_logic.not_and_implies_lemma())
  })
  log.attempt("NOT_AND_IMPLIES_lemma1", () => {
    sthm(@mk_state_logic.not_and_implies_lemma1())
  })
  log.attempt("NOT_AND_IMPLIES_lemma2", () => {
    sthm(@mk_state_logic.not_and_implies_lemma2())
  })
  log.attempt("CONJ_DISJ_IMPLY_lemma1", () => {
    sthm(@mk_state_logic.conj_disj_imply_lemma1())
  })
  log.attempt("CONJ_DISJ_IMPLY_lemma2", () => {
    sthm(@mk_state_logic.conj_disj_imply_lemma2())
  })
  log.attempt("CONJ_DISJ_IMPLY_lemma", () => {
    sthm(@mk_state_logic.conj_disj_imply_lemma())
  })
  log.attempt("CONJ_DISJ_ABS_IMPLY_lemma", () => {
    sthm(@mk_state_logic.conj_disj_abs_imply_lemma())
  })
  log.attempt("AND_OR_EQ_lemma", () => sthm(@mk_state_logic.and_or_eq_lemma()))
  log.attempt("AND_OR_EQ_AND_COMM_OR_lemma", () => {
    sthm(@mk_state_logic.and_or_eq_and_comm_or_lemma())
  })
  log.attempt("IMPLY_WEAK_lemma", () => sthm(@mk_state_logic.imply_weak_lemma()))
  log.attempt("IMPLY_WEAK_lemma_b", () => {
    sthm(@mk_state_logic.imply_weak_lemma_b())
  })
  log.attempt("ALL_AND_lemma1", () => sthm(@mk_state_logic.all_and_lemma1()))
  log.attempt("ALL_OR_lemma1", () => sthm(@mk_state_logic.all_or_lemma1()))
  log.attempt("ALL_OR_lemma", () => sthm(@mk_state_logic.all_or_lemma()))
  log.attempt("ALL_i_OR_lemma1", () => sthm(@mk_state_logic.all_i_or_lemma1()))
  log.attempt("ALL_i_OR_lemma", () => sthm(@mk_state_logic.all_i_or_lemma()))
  // END generated theorem list
  let tm = @term_syntax.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..2..5..8..25..57..89..solved at 97
      #|0..0..0..1..5..10..solved at 15
      #|0..0..0..0..2..5..8..25..57..89..solved at 97
      #|0..0..solved at 2
      #|0..0..2..10..25..solved at 35
      #|0..0..0..1..4..7..solved at 12
      #|0..0..solved at 2
      #|0..0..0..3..6..9..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 13
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..10..25..solved at 35
      #|0..0..solved at 2
      #|0..0..1..3..11..solved at 20
      #|0..0..1..2..4..12..24..45..78..125..solved at 140
      #|0..0..0..2..7..solved at 12
      #|0..0..1..3..13..29..63..128..226..388..642..977..1459..2097..3319..solved at 3649
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..15..41..98..211..420..solved at 656
      #|0..0..1..2..5..9..17..33..55..97..162..262..411..solved at 543
      #|0..0..1..6..23..68..172..410..880..solved at 911
      #|0..0..0..1..4..7..solved at 16
      #|0..0..2..8..24..54..solved at 69
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..8..solved at 12
      #|0..0..2..8..solved at 13
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..1..2..3..4..5..6..9..12..15..solved at 28
      #|0..0..1..2..9..27..54..solved at 63
      #|0..0..0..0..4..11..21..solved at 31
      #|0..0..0..2..5..18..49..94..177..301..448..682..998..1426..2070..3047..4168..6085..8572..solved at 9229
      #|0..0..solved at 2
      #|0..0..3..7..20..54..150..solved at 180
      #|0..0..solved at 2
      #|0..0..2..6..solved at 13
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 8
      #|0..0..2..6..solved at 14
      #|0..0..1..3..solved at 8
      #|0..0..2..4..solved at 11
      #|0..0..5..12..39..solved at 71
      #|0..0..4..10..30..solved at 55
      #|0..0..5..13..38..solved at 66
      #|0..0..4..10..31..solved at 57
      #|0..0..3..6..19..35..60..118..solved at 270
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..4..13..31..solved at 37
      #|0..0..1..2..solved at 6
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..4..12..28..58..118..solved at 128
      #|0..0..2..9..28..85..206..492..solved at 618
      #|0..0..2..9..28..94..222..491..1165..solved at 1499
      #|0..0..2..9..28..94..223..491..1149..solved at 1472
      #|0..0..2..10..28..82..204..solved at 236
      #|0..0..1..4..11..43..116..246..648..1354..solved at 1611
      #|0..0..solved at 2
      #|0..0..1..5..15..51..120..259..solved at 434
      #|0..0..1..5..15..51..120..259..solved at 394
      #|0..0..1..4..13..31..solved at 37
      #|0..0..2..7..24..55..104..223..440..827..1504..solved at 1616
      #|0..0..2..7..24..65..133..290..574..solved at 904
      #|0..0..2..7..24..65..134..294..583..solved at 913
      #|0..0..2..8..25..52..110..solved at 145
      #|0..0..1..2..7..13..26..50..83..132..216..308..447..705..1020..1530..2268..3184..4455..6310..solved at 8365
      #|0..0..1..3..9..17..43..86..154..300..472..714..1138..1664..2466..4129..6181..solved at 6305
      #|0..0..2..7..20..49..89..185..solved at 215
      #|0..0..1..2..7..17..34..70..132..223..396..solved at 427
      #|0..0..1..2..6..12..23..46..74..119..197..285..418..630..886..solved at 1210
      #|0..0..2..8..24..solved at 32
      #|0..0..2..7..24..61..134..280..548..1144..solved at 1169
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..8..18..solved at 48
      #|0..0..1..2..8..18..solved at 55
      #|0..0..1..2..10..24..118..279..1321..3190..solved at 4661
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..28..51..solved at 84
      #|0..0..1..2..6..12..28..57..solved at 90
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..8..18..68..147..solved at 443
      #|0..0..1..2..8..18..67..146..solved at 427
      #|0..0..1..2..8..18..solved at 55
      #|0..0..1..2..8..18..solved at 48
      #|0..0..1..2..7..14..solved at 23
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..12..31..100..solved at 139
      #|0..0..1..2..solved at 8
      #|0..0..1..2..6..13..29..solved at 39
      #|0..0..1..2..6..12..28..51..solved at 80
      #|0..0..1..2..6..13..29..solved at 39
      #|0..0..1..2..6..12..28..51..solved at 80
      #|0..0..1..2..7..15..35..77..161..solved at 177
      #|0..0..1..2..6..12..28..51..104..192..solved at 349
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..1..2..9..20..73..154..solved at 284
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..1..2..9..20..73..154..solved at 229
      #|0..0..1..2..8..18..65..140..472..992..solved at 2047
      #|0..0..0..1..2..3..4..5..6..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..20..52..96..204..356..638..1042..1916..3036..solved at 4498
      #|0..0..1..2..7..16..42..78..161..285..685..solved at 954
      #|0..0..1..2..7..16..42..78..160..281..solved at 672
      #|0..0..2..4..11..21..59..116..239..426..800..1336..solved at 1840
      #|0..0..1..2..7..16..45..86..174..312..724..solved at 772
      #|0..0..1..2..7..16..44..84..168..solved at 185
      #|0..0..2..4..11..21..59..116..239..426..solved at 540
      #|0..0..1..2..7..18..46..solved at 77
      #|0..0..1..2..7..18..47..92..185..solved at 281
      #|0..0..2..4..12..22..solved at 41
      #|0..0..1..2..7..solved at 21
      #|0..0..1..2..7..solved at 18
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..6..13..30..solved at 70
      #|0..0..1..2..6..13..30..solved at 70
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..112..263..solved at 489
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 26
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 13
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..solved at 67
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..solved at 7
      #|0..0..1..5..9..19..44..73..solved at 80
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..5..7..9..13..solved at 22
      #|0..0..1..2..3..5..7..9..13..solved at 22
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..solved at 56
      #|0..0..solved at 2
      #|0..0..2..6..17..43..98..solved at 116
      #|0..0..3..8..16..solved at 33
      #|0..0..3..8..16..solved at 35
      #|0..0..solved at 2
      #|0..0..3..8..16..solved at 35
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..4..10..22..75..155..solved at 209
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 9
      #|0..0..1..3..6..22..49..93..169..273..405..601..837..1131..1577..2127..solved at 2538
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 25
      #|0..0..2..4..6..solved at 18
      #|0..0..1..2..3..14..solved at 25
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..29..solved at 50
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|0..0..1..2..3..10..solved at 16
      #|0..0..1..3..6..12..solved at 21
      #|0..0..1..3..6..16..solved at 33
      #|0..0..1..4..10..23..48..94..solved at 172
      #|0..0..1..4..8..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..19..42..solved at 59
      #|0..0..1..3..6..16..37..70..121..205..325..solved at 432
      #|0..0..1..2..solved at 6
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|0..0..1..4..8..solved at 17
      #|0..0..1..4..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..3..8..15..solved at 20
      #|0..0..3..12..23..40..63..solved at 72
      #|0..0..3..6..18..34..61..94..145..206..solved at 249
      #|0..0..3..14..36..111..307..901..solved at 935
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..35..62..solved at 73
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..19..44..solved at 81
      #|0..0..solved at 2
      #|0..0..1..3..9..25..64..166..437..1159..3190..solved at 4411
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..19..44..112..275..694..solved at 932
      #|0..0..1..3..8..19..40..85..174..348..696..1556..3482..solved at 6840
      #|0..0..1..2..6..12..28..solved at 55
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..19..36..53..76..121..solved at 164
      #|0..0..3..solved at 9
      #|0..0..1..7..solved at 12
      #|0..0..1..5..12..24..solved at 30
      #|0..0..1..5..12..23..solved at 30
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..6..17..34..81..solved at 102
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..9..solved at 16
      #|0..0..0..2..solved at 6
      #|0..0..2..6..16..solved at 22
      #|0..0..1..2..5..15..28..59..solved at 68
      #|0..0..1..2..4..10..19..solved at 27
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 13
      #|0..0..2..4..11..32..75..solved at 142
      #|0..0..2..4..12..33..75..solved at 143
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..17..34..solved at 61
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..18..35..solved at 63
      #|0..0..1..2..solved at 6
      #|0..0..2..4..10..18..34..76..138..336..872..2366..solved at 5076
      #|CPU time (user): <t>
      #|0..0..1..2..7..14..37..72..174..325..solved at 392
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..21..34..52..73..solved at 103
      #|0..0..1..2..3..11..21..solved at 28
      #|0..0..1..2..3..11..21..solved at 28
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..8..17..30..solved at 47
      #|0..0..solved at 3
      #|0..0..2..4..8..solved at 15
      #|0..0..1..2..6..14..39..solved at 73
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..1..3..9..solved at 15
      #|0..0..1..2..5..11..20..solved at 29
      #|0..0..1..2..5..15..29..solved at 49
      #|0..0..1..2..7..19..41..79..146..solved at 200
      #|0..0..1..2..7..19..41..solved at 77
      #|0..0..1..2..7..19..41..79..146..solved at 175
      #|0..0..1..2..7..19..41..solved at 68
      #|0..0..1..2..9..23..64..133..315..solved at 511
      #|0..0..1..2..9..23..64..solved at 116
      #|0..0..1..2..9..23..64..133..315..solved at 415
      #|0..0..1..2..9..23..64..solved at 116
      #|0..0..2..9..solved at 14
      #|0..0..2..9..20..40..87..solved at 94
      #|0..0..2..8..18..34..73..solved at 91
      #|0..0..1..5..12..23..solved at 29
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 13
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..4..9..17..solved at 23
      #|0..0..1..4..solved at 9
      #|0..0..1..5..10..18..solved at 24
      #|0..0..1..5..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 10
      #|0..0..1..2..solved at 8
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 159
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 165
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..45..77..137..solved at 218
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 224
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 230
      #|0..0..1..2..3..7..14..25..51..89..155..solved at 171
      #|0..0..1..2..7..14..33..62..solved at 116
      #|0..0..1..2..3..7..14..25..47..81..143..solved at 224
      #|0..0..1..2..3..7..14..25..49..85..149..solved at 165
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..11..34..84..193..424..970..solved at 1151
      #|0..0..1..2..3..8..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 11
      #|0..0..0..3..solved at 8
      #|0..0..1..7..18..45..solved at 68
      #|0..0..1..5..12..31..92..191..solved at 234
      #|0..0..1..2..3..11..21..31..63..101..139..solved at 265
      #|0..0..2..9..20..50..124..264..solved at 287
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..29..solved at 43
      #|0..0..1..2..8..16..37..solved at 58
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..16..solved at 25
      #|0..0..1..solved at 4
      #|0..0..1..4..9..19..41..75..solved at 84
      #|0..0..1..5..12..solved at 17
      #|0..0..1..solved at 5
      #|0..0..1..4..11..solved at 16
      #|0..0..1..solved at 5
      #|0..0..1..3..8..22..54..118..267..565..1172..solved at 1415
      #|0..0..solved at 2
      #|0..0..1..4..9..21..50..101..195..398..788..1469..solved at 1634
      #|0..0..1..2..3..7..13..21..solved at 29
      #|0..0..1..4..10..25..53..111..256..493..871..1565..2714..4572..7748..12991..solved at 20439
      #|0..0..1..2..3..7..12..17..solved at 25
      #|0..0..1..2..6..11..18..37..59..96..158..229..326..solved at 350
      #|0..0..1..2..5..9..15..30..47..76..solved at 158
      #|0..0..1..2..3..7..13..21..solved at 30
      #|0..0..1..2..4..9..15..21..35..solved at 48
      #|0..0..3..solved at 6
      #|0..0..1..4..12..53..156..809..solved at 3536
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..53..96..175..solved at 250
      #|0..0..2..4..10..20..38..solved at 58
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..5..11..22..49..95..171..305..solved at 319
      #|0..0..1..4..10..20..34..56..88..130..180..238..304..378..468..574..696..850..1032..1258..1520..1834..2228..2782..3536..4510..5728..7250..8852..10582..12504..14450..16716..19194..22436..26450..31796..solved at 33408
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..5..solved at 9
      #|0..0..1..2..5..8..solved at 14
      #|0..0..2..5..11..23..42..71..111..171..262..solved at 304
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..4..6..14..30..53..152..368..solved at 435
      #|Warning: inventing type variables
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..5..14..48..solved at 54
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..12..37..73..solved at 91
      #|0..0..1..2..5..10..solved at 19
      #|0..0..1..2..5..11..27..50..solved at 62
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..2..5..11..solved at 16
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..4..solved at 9
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..5..9..22..solved at 37
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..4..10..23..42..83..solved at 141
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 6 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 8 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..4..11..25..54..solved at 82
      #|0..0..1..4..solved at 12
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..0..2..6..solved at 11
      #|0..0..0..2..6..solved at 11
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..2..7..12..27..solved at 38
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 5 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 17 critical pairs
      #|10 basis elements and 21 critical pairs
      #|10 basis elements and 20 critical pairs
      #|10 basis elements and 19 critical pairs
      #|11 basis elements and 26 critical pairs
      #|11 basis elements and 25 critical pairs
      #|11 basis elements and 24 critical pairs
      #|11 basis elements and 23 critical pairs
      #|12 basis elements and 27 critical pairs
      #|12 basis elements and 26 critical pairs
      #|13 basis elements and 33 critical pairs
      #|13 basis elements and 32 critical pairs
      #|13 basis elements and 31 critical pairs
      #|13 basis elements and 30 critical pairs
      #|13 basis elements and 29 critical pairs
      #|14 basis elements and 37 critical pairs
      #|14 basis elements and 36 critical pairs
      #|14 basis elements and 35 critical pairs
      #|14 basis elements and 34 critical pairs
      #|14 basis elements and 33 critical pairs
      #|14 basis elements and 32 critical pairs
      #|14 basis elements and 31 critical pairs
      #|14 basis elements and 30 critical pairs
      #|15 basis elements and 37 critical pairs
      #|16 basis elements and 46 critical pairs
      #|16 basis elements and 45 critical pairs
      #|17 basis elements and 54 critical pairs
      #|17 basis elements and 53 critical pairs
      #|17 basis elements and 52 critical pairs
      #|17 basis elements and 51 critical pairs
      #|17 basis elements and 50 critical pairs
      #|17 basis elements and 49 critical pairs
      #|17 basis elements and 48 critical pairs
      #|17 basis elements and 47 critical pairs
      #|17 basis elements and 46 critical pairs
      #|17 basis elements and 45 critical pairs
      #|17 basis elements and 44 critical pairs
      #|17 basis elements and 43 critical pairs
      #|17 basis elements and 42 critical pairs
      #|17 basis elements and 41 critical pairs
      #|17 basis elements and 40 critical pairs
      #|17 basis elements and 39 critical pairs
      #|17 basis elements and 38 critical pairs
      #|17 basis elements and 37 critical pairs
      #|17 basis elements and 36 critical pairs
      #|17 basis elements and 35 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|17 basis elements and 30 critical pairs
      #|17 basis elements and 29 critical pairs
      #|17 basis elements and 28 critical pairs
      #|17 basis elements and 27 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|17 basis elements and 24 critical pairs
      #|17 basis elements and 23 critical pairs
      #|17 basis elements and 22 critical pairs
      #|17 basis elements and 21 critical pairs
      #|17 basis elements and 20 critical pairs
      #|17 basis elements and 19 critical pairs
      #|17 basis elements and 18 critical pairs
      #|17 basis elements and 17 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|17 basis elements and 12 critical pairs
      #|17 basis elements and 11 critical pairs
      #|17 basis elements and 10 critical pairs
      #|17 basis elements and 9 critical pairs
      #|17 basis elements and 8 critical pairs
      #|17 basis elements and 7 critical pairs
      #|17 basis elements and 6 critical pairs
      #|17 basis elements and 5 critical pairs
      #|17 basis elements and 4 critical pairs
      #|17 basis elements and 3 critical pairs
      #|17 basis elements and 2 critical pairs
      #|17 basis elements and 1 critical pairs
      #|17 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 14 critical pairs
      #|9 basis elements and 20 critical pairs
      #|10 basis elements and 26 critical pairs
      #|10 basis elements and 25 critical pairs
      #|11 basis elements and 31 critical pairs
      #|12 basis elements and 35 critical pairs
      #|12 basis elements and 34 critical pairs
      #|13 basis elements and 41 critical pairs
      #|13 basis elements and 40 critical pairs
      #|13 basis elements and 39 critical pairs
      #|14 basis elements and 48 critical pairs
      #|14 basis elements and 47 critical pairs
      #|14 basis elements and 46 critical pairs
      #|14 basis elements and 45 critical pairs
      #|14 basis elements and 44 critical pairs
      #|14 basis elements and 43 critical pairs
      #|14 basis elements and 42 critical pairs
      #|15 basis elements and 51 critical pairs
      #|15 basis elements and 50 critical pairs
      #|15 basis elements and 49 critical pairs
      #|16 basis elements and 60 critical pairs
      #|16 basis elements and 59 critical pairs
      #|16 basis elements and 58 critical pairs
      #|16 basis elements and 57 critical pairs
      #|16 basis elements and 56 critical pairs
      #|16 basis elements and 55 critical pairs
      #|16 basis elements and 54 critical pairs
      #|17 basis elements and 67 critical pairs
      #|18 basis elements and 80 critical pairs
      #|19 basis elements and 90 critical pairs
      #|19 basis elements and 89 critical pairs
      #|20 basis elements and 99 critical pairs
      #|20 basis elements and 98 critical pairs
      #|20 basis elements and 97 critical pairs
      #|20 basis elements and 96 critical pairs
      #|20 basis elements and 95 critical pairs
      #|20 basis elements and 94 critical pairs
      #|20 basis elements and 93 critical pairs
      #|20 basis elements and 92 critical pairs
      #|20 basis elements and 91 critical pairs
      #|20 basis elements and 90 critical pairs
      #|20 basis elements and 89 critical pairs
      #|20 basis elements and 88 critical pairs
      #|20 basis elements and 87 critical pairs
      #|20 basis elements and 86 critical pairs
      #|20 basis elements and 85 critical pairs
      #|20 basis elements and 84 critical pairs
      #|20 basis elements and 83 critical pairs
      #|20 basis elements and 82 critical pairs
      #|20 basis elements and 81 critical pairs
      #|20 basis elements and 80 critical pairs
      #|20 basis elements and 79 critical pairs
      #|20 basis elements and 78 critical pairs
      #|20 basis elements and 77 critical pairs
      #|20 basis elements and 76 critical pairs
      #|20 basis elements and 75 critical pairs
      #|20 basis elements and 74 critical pairs
      #|20 basis elements and 73 critical pairs
      #|20 basis elements and 72 critical pairs
      #|20 basis elements and 71 critical pairs
      #|20 basis elements and 70 critical pairs
      #|20 basis elements and 69 critical pairs
      #|20 basis elements and 68 critical pairs
      #|20 basis elements and 67 critical pairs
      #|20 basis elements and 66 critical pairs
      #|20 basis elements and 65 critical pairs
      #|20 basis elements and 64 critical pairs
      #|20 basis elements and 63 critical pairs
      #|21 basis elements and 75 critical pairs
      #|22 basis elements and 88 critical pairs
      #|22 basis elements and 87 critical pairs
      #|22 basis elements and 86 critical pairs
      #|22 basis elements and 85 critical pairs
      #|22 basis elements and 84 critical pairs
      #|22 basis elements and 83 critical pairs
      #|22 basis elements and 82 critical pairs
      #|22 basis elements and 81 critical pairs
      #|22 basis elements and 80 critical pairs
      #|22 basis elements and 79 critical pairs
      #|22 basis elements and 78 critical pairs
      #|23 basis elements and 91 critical pairs
      #|23 basis elements and 90 critical pairs
      #|23 basis elements and 89 critical pairs
      #|23 basis elements and 88 critical pairs
      #|23 basis elements and 87 critical pairs
      #|23 basis elements and 86 critical pairs
      #|23 basis elements and 85 critical pairs
      #|23 basis elements and 84 critical pairs
      #|23 basis elements and 83 critical pairs
      #|23 basis elements and 82 critical pairs
      #|23 basis elements and 81 critical pairs
      #|23 basis elements and 80 critical pairs
      #|23 basis elements and 79 critical pairs
      #|23 basis elements and 78 critical pairs
      #|23 basis elements and 77 critical pairs
      #|23 basis elements and 76 critical pairs
      #|23 basis elements and 75 critical pairs
      #|23 basis elements and 74 critical pairs
      #|23 basis elements and 73 critical pairs
      #|23 basis elements and 72 critical pairs
      #|23 basis elements and 71 critical pairs
      #|23 basis elements and 70 critical pairs
      #|23 basis elements and 69 critical pairs
      #|23 basis elements and 68 critical pairs
      #|23 basis elements and 67 critical pairs
      #|23 basis elements and 66 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|23 basis elements and 62 critical pairs
      #|23 basis elements and 61 critical pairs
      #|23 basis elements and 60 critical pairs
      #|23 basis elements and 59 critical pairs
      #|23 basis elements and 58 critical pairs
      #|23 basis elements and 57 critical pairs
      #|23 basis elements and 56 critical pairs
      #|23 basis elements and 55 critical pairs
      #|23 basis elements and 54 critical pairs
      #|23 basis elements and 53 critical pairs
      #|23 basis elements and 52 critical pairs
      #|23 basis elements and 51 critical pairs
      #|23 basis elements and 50 critical pairs
      #|23 basis elements and 49 critical pairs
      #|23 basis elements and 48 critical pairs
      #|23 basis elements and 47 critical pairs
      #|23 basis elements and 46 critical pairs
      #|23 basis elements and 45 critical pairs
      #|23 basis elements and 44 critical pairs
      #|23 basis elements and 43 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|23 basis elements and 39 critical pairs
      #|23 basis elements and 38 critical pairs
      #|23 basis elements and 37 critical pairs
      #|23 basis elements and 36 critical pairs
      #|23 basis elements and 35 critical pairs
      #|23 basis elements and 34 critical pairs
      #|23 basis elements and 33 critical pairs
      #|23 basis elements and 32 critical pairs
      #|23 basis elements and 31 critical pairs
      #|23 basis elements and 30 critical pairs
      #|23 basis elements and 29 critical pairs
      #|23 basis elements and 28 critical pairs
      #|23 basis elements and 27 critical pairs
      #|23 basis elements and 26 critical pairs
      #|23 basis elements and 25 critical pairs
      #|23 basis elements and 24 critical pairs
      #|23 basis elements and 23 critical pairs
      #|23 basis elements and 22 critical pairs
      #|23 basis elements and 21 critical pairs
      #|23 basis elements and 20 critical pairs
      #|23 basis elements and 19 critical pairs
      #|23 basis elements and 18 critical pairs
      #|23 basis elements and 17 critical pairs
      #|23 basis elements and 16 critical pairs
      #|23 basis elements and 15 critical pairs
      #|23 basis elements and 14 critical pairs
      #|23 basis elements and 13 critical pairs
      #|23 basis elements and 12 critical pairs
      #|23 basis elements and 11 critical pairs
      #|23 basis elements and 10 critical pairs
      #|23 basis elements and 9 critical pairs
      #|23 basis elements and 8 critical pairs
      #|23 basis elements and 7 critical pairs
      #|23 basis elements and 6 critical pairs
      #|23 basis elements and 5 critical pairs
      #|23 basis elements and 4 critical pairs
      #|23 basis elements and 3 critical pairs
      #|23 basis elements and 2 critical pairs
      #|23 basis elements and 1 critical pairs
      #|23 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 19 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 20 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 24 critical pairs
      #|13 basis elements and 23 critical pairs
      #|13 basis elements and 22 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|14 basis elements and 26 critical pairs
      #|14 basis elements and 25 critical pairs
      #|14 basis elements and 24 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|14 basis elements and 16 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|15 basis elements and 23 critical pairs
      #|16 basis elements and 34 critical pairs
      #|16 basis elements and 33 critical pairs
      #|17 basis elements and 46 critical pairs
      #|18 basis elements and 55 critical pairs
      #|18 basis elements and 54 critical pairs
      #|19 basis elements and 69 critical pairs
      #|20 basis elements and 80 critical pairs
      #|20 basis elements and 79 critical pairs
      #|21 basis elements and 93 critical pairs
      #|22 basis elements and 101 critical pairs
      #|22 basis elements and 100 critical pairs
      #|23 basis elements and 115 critical pairs
      #|24 basis elements and 134 critical pairs
      #|25 basis elements and 154 critical pairs
      #|25 basis elements and 153 critical pairs
      #|25 basis elements and 152 critical pairs
      #|25 basis elements and 151 critical pairs
      #|26 basis elements and 170 critical pairs
      #|26 basis elements and 169 critical pairs
      #|27 basis elements and 190 critical pairs
      #|27 basis elements and 189 critical pairs
      #|27 basis elements and 188 critical pairs
      #|28 basis elements and 208 critical pairs
      #|28 basis elements and 207 critical pairs
      #|28 basis elements and 206 critical pairs
      #|28 basis elements and 205 critical pairs
      #|28 basis elements and 204 critical pairs
      #|29 basis elements and 222 critical pairs
      #|29 basis elements and 221 critical pairs
      #|29 basis elements and 220 critical pairs
      #|29 basis elements and 219 critical pairs
      #|29 basis elements and 218 critical pairs
      #|29 basis elements and 217 critical pairs
      #|29 basis elements and 216 critical pairs
      #|29 basis elements and 215 critical pairs
      #|30 basis elements and 237 critical pairs
      #|30 basis elements and 236 critical pairs
      #|30 basis elements and 235 critical pairs
      #|30 basis elements and 234 critical pairs
      #|30 basis elements and 233 critical pairs
      #|30 basis elements and 232 critical pairs
      #|30 basis elements and 231 critical pairs
      #|31 basis elements and 257 critical pairs
      #|32 basis elements and 284 critical pairs
      #|33 basis elements and 312 critical pairs
      #|33 basis elements and 311 critical pairs
      #|33 basis elements and 310 critical pairs
      #|33 basis elements and 309 critical pairs
      #|34 basis elements and 336 critical pairs
      #|34 basis elements and 335 critical pairs
      #|35 basis elements and 368 critical pairs
      #|35 basis elements and 367 critical pairs
      #|35 basis elements and 366 critical pairs
      #|35 basis elements and 365 critical pairs
      #|36 basis elements and 393 critical pairs
      #|36 basis elements and 392 critical pairs
      #|36 basis elements and 391 critical pairs
      #|36 basis elements and 390 critical pairs
      #|36 basis elements and 389 critical pairs
      #|37 basis elements and 421 critical pairs
      #|37 basis elements and 420 critical pairs
      #|37 basis elements and 419 critical pairs
      #|37 basis elements and 418 critical pairs
      #|37 basis elements and 417 critical pairs
      #|37 basis elements and 416 critical pairs
      #|37 basis elements and 415 critical pairs
      #|37 basis elements and 414 critical pairs
      #|37 basis elements and 413 critical pairs
      #|37 basis elements and 412 critical pairs
      #|38 basis elements and 439 critical pairs
      #|38 basis elements and 438 critical pairs
      #|38 basis elements and 437 critical pairs
      #|38 basis elements and 436 critical pairs
      #|38 basis elements and 435 critical pairs
      #|38 basis elements and 434 critical pairs
      #|38 basis elements and 433 critical pairs
      #|39 basis elements and 464 critical pairs
      #|39 basis elements and 463 critical pairs
      #|39 basis elements and 462 critical pairs
      #|39 basis elements and 461 critical pairs
      #|39 basis elements and 460 critical pairs
      #|39 basis elements and 459 critical pairs
      #|39 basis elements and 458 critical pairs
      #|39 basis elements and 457 critical pairs
      #|40 basis elements and 492 critical pairs
      #|41 basis elements and 522 critical pairs
      #|41 basis elements and 521 critical pairs
      #|41 basis elements and 520 critical pairs
      #|41 basis elements and 519 critical pairs
      #|41 basis elements and 518 critical pairs
      #|41 basis elements and 517 critical pairs
      #|41 basis elements and 516 critical pairs
      #|41 basis elements and 515 critical pairs
      #|41 basis elements and 514 critical pairs
      #|41 basis elements and 513 critical pairs
      #|41 basis elements and 512 critical pairs
      #|41 basis elements and 511 critical pairs
      #|41 basis elements and 510 critical pairs
      #|41 basis elements and 509 critical pairs
      #|41 basis elements and 508 critical pairs
      #|41 basis elements and 507 critical pairs
      #|41 basis elements and 506 critical pairs
      #|41 basis elements and 505 critical pairs
      #|41 basis elements and 504 critical pairs
      #|41 basis elements and 503 critical pairs
      #|41 basis elements and 502 critical pairs
      #|41 basis elements and 501 critical pairs
      #|41 basis elements and 500 critical pairs
      #|41 basis elements and 499 critical pairs
      #|41 basis elements and 498 critical pairs
      #|41 basis elements and 497 critical pairs
      #|41 basis elements and 496 critical pairs
      #|41 basis elements and 495 critical pairs
      #|41 basis elements and 494 critical pairs
      #|41 basis elements and 493 critical pairs
      #|41 basis elements and 492 critical pairs
      #|41 basis elements and 491 critical pairs
      #|41 basis elements and 490 critical pairs
      #|41 basis elements and 489 critical pairs
      #|41 basis elements and 488 critical pairs
      #|41 basis elements and 487 critical pairs
      #|41 basis elements and 486 critical pairs
      #|41 basis elements and 485 critical pairs
      #|41 basis elements and 484 critical pairs
      #|41 basis elements and 483 critical pairs
      #|41 basis elements and 482 critical pairs
      #|41 basis elements and 481 critical pairs
      #|41 basis elements and 480 critical pairs
      #|41 basis elements and 479 critical pairs
      #|41 basis elements and 478 critical pairs
      #|41 basis elements and 477 critical pairs
      #|41 basis elements and 476 critical pairs
      #|41 basis elements and 475 critical pairs
      #|41 basis elements and 474 critical pairs
      #|41 basis elements and 473 critical pairs
      #|41 basis elements and 472 critical pairs
      #|41 basis elements and 471 critical pairs
      #|41 basis elements and 470 critical pairs
      #|41 basis elements and 469 critical pairs
      #|41 basis elements and 468 critical pairs
      #|41 basis elements and 467 critical pairs
      #|41 basis elements and 466 critical pairs
      #|41 basis elements and 465 critical pairs
      #|41 basis elements and 464 critical pairs
      #|41 basis elements and 463 critical pairs
      #|41 basis elements and 462 critical pairs
      #|41 basis elements and 461 critical pairs
      #|41 basis elements and 460 critical pairs
      #|41 basis elements and 459 critical pairs
      #|41 basis elements and 458 critical pairs
      #|41 basis elements and 457 critical pairs
      #|41 basis elements and 456 critical pairs
      #|41 basis elements and 455 critical pairs
      #|41 basis elements and 454 critical pairs
      #|41 basis elements and 453 critical pairs
      #|41 basis elements and 452 critical pairs
      #|41 basis elements and 451 critical pairs
      #|41 basis elements and 450 critical pairs
      #|41 basis elements and 449 critical pairs
      #|41 basis elements and 448 critical pairs
      #|41 basis elements and 447 critical pairs
      #|41 basis elements and 446 critical pairs
      #|41 basis elements and 445 critical pairs
      #|41 basis elements and 444 critical pairs
      #|41 basis elements and 443 critical pairs
      #|41 basis elements and 442 critical pairs
      #|41 basis elements and 441 critical pairs
      #|41 basis elements and 440 critical pairs
      #|41 basis elements and 439 critical pairs
      #|41 basis elements and 438 critical pairs
      #|41 basis elements and 437 critical pairs
      #|41 basis elements and 436 critical pairs
      #|41 basis elements and 435 critical pairs
      #|41 basis elements and 434 critical pairs
      #|41 basis elements and 433 critical pairs
      #|41 basis elements and 432 critical pairs
      #|41 basis elements and 431 critical pairs
      #|41 basis elements and 430 critical pairs
      #|41 basis elements and 429 critical pairs
      #|41 basis elements and 428 critical pairs
      #|41 basis elements and 427 critical pairs
      #|41 basis elements and 426 critical pairs
      #|41 basis elements and 425 critical pairs
      #|41 basis elements and 424 critical pairs
      #|41 basis elements and 423 critical pairs
      #|41 basis elements and 422 critical pairs
      #|41 basis elements and 421 critical pairs
      #|41 basis elements and 420 critical pairs
      #|41 basis elements and 419 critical pairs
      #|41 basis elements and 418 critical pairs
      #|41 basis elements and 417 critical pairs
      #|41 basis elements and 416 critical pairs
      #|41 basis elements and 415 critical pairs
      #|41 basis elements and 414 critical pairs
      #|41 basis elements and 413 critical pairs
      #|41 basis elements and 412 critical pairs
      #|41 basis elements and 411 critical pairs
      #|41 basis elements and 410 critical pairs
      #|41 basis elements and 409 critical pairs
      #|41 basis elements and 408 critical pairs
      #|41 basis elements and 407 critical pairs
      #|41 basis elements and 406 critical pairs
      #|41 basis elements and 405 critical pairs
      #|41 basis elements and 404 critical pairs
      #|41 basis elements and 403 critical pairs
      #|41 basis elements and 402 critical pairs
      #|41 basis elements and 401 critical pairs
      #|41 basis elements and 400 critical pairs
      #|41 basis elements and 399 critical pairs
      #|41 basis elements and 398 critical pairs
      #|41 basis elements and 397 critical pairs
      #|41 basis elements and 396 critical pairs
      #|41 basis elements and 395 critical pairs
      #|41 basis elements and 394 critical pairs
      #|41 basis elements and 393 critical pairs
      #|41 basis elements and 392 critical pairs
      #|41 basis elements and 391 critical pairs
      #|41 basis elements and 390 critical pairs
      #|41 basis elements and 389 critical pairs
      #|41 basis elements and 388 critical pairs
      #|41 basis elements and 387 critical pairs
      #|41 basis elements and 386 critical pairs
      #|41 basis elements and 385 critical pairs
      #|41 basis elements and 384 critical pairs
      #|41 basis elements and 383 critical pairs
      #|41 basis elements and 382 critical pairs
      #|41 basis elements and 381 critical pairs
      #|41 basis elements and 380 critical pairs
      #|41 basis elements and 379 critical pairs
      #|41 basis elements and 378 critical pairs
      #|41 basis elements and 377 critical pairs
      #|41 basis elements and 376 critical pairs
      #|41 basis elements and 375 critical pairs
      #|41 basis elements and 374 critical pairs
      #|41 basis elements and 373 critical pairs
      #|41 basis elements and 372 critical pairs
      #|41 basis elements and 371 critical pairs
      #|41 basis elements and 370 critical pairs
      #|41 basis elements and 369 critical pairs
      #|41 basis elements and 368 critical pairs
      #|41 basis elements and 367 critical pairs
      #|41 basis elements and 366 critical pairs
      #|41 basis elements and 365 critical pairs
      #|41 basis elements and 364 critical pairs
      #|41 basis elements and 363 critical pairs
      #|41 basis elements and 362 critical pairs
      #|41 basis elements and 361 critical pairs
      #|41 basis elements and 360 critical pairs
      #|41 basis elements and 359 critical pairs
      #|41 basis elements and 358 critical pairs
      #|41 basis elements and 357 critical pairs
      #|41 basis elements and 356 critical pairs
      #|41 basis elements and 355 critical pairs
      #|41 basis elements and 354 critical pairs
      #|41 basis elements and 353 critical pairs
      #|41 basis elements and 352 critical pairs
      #|41 basis elements and 351 critical pairs
      #|41 basis elements and 350 critical pairs
      #|41 basis elements and 349 critical pairs
      #|41 basis elements and 348 critical pairs
      #|41 basis elements and 347 critical pairs
      #|41 basis elements and 346 critical pairs
      #|41 basis elements and 345 critical pairs
      #|41 basis elements and 344 critical pairs
      #|41 basis elements and 343 critical pairs
      #|41 basis elements and 342 critical pairs
      #|41 basis elements and 341 critical pairs
      #|41 basis elements and 340 critical pairs
      #|41 basis elements and 339 critical pairs
      #|41 basis elements and 338 critical pairs
      #|41 basis elements and 337 critical pairs
      #|41 basis elements and 336 critical pairs
      #|41 basis elements and 335 critical pairs
      #|41 basis elements and 334 critical pairs
      #|41 basis elements and 333 critical pairs
      #|41 basis elements and 332 critical pairs
      #|41 basis elements and 331 critical pairs
      #|41 basis elements and 330 critical pairs
      #|41 basis elements and 329 critical pairs
      #|41 basis elements and 328 critical pairs
      #|41 basis elements and 327 critical pairs
      #|41 basis elements and 326 critical pairs
      #|41 basis elements and 325 critical pairs
      #|41 basis elements and 324 critical pairs
      #|41 basis elements and 323 critical pairs
      #|41 basis elements and 322 critical pairs
      #|41 basis elements and 321 critical pairs
      #|41 basis elements and 320 critical pairs
      #|41 basis elements and 319 critical pairs
      #|41 basis elements and 318 critical pairs
      #|41 basis elements and 317 critical pairs
      #|41 basis elements and 316 critical pairs
      #|41 basis elements and 315 critical pairs
      #|41 basis elements and 314 critical pairs
      #|41 basis elements and 313 critical pairs
      #|41 basis elements and 312 critical pairs
      #|41 basis elements and 311 critical pairs
      #|41 basis elements and 310 critical pairs
      #|41 basis elements and 309 critical pairs
      #|41 basis elements and 308 critical pairs
      #|41 basis elements and 307 critical pairs
      #|41 basis elements and 306 critical pairs
      #|41 basis elements and 305 critical pairs
      #|41 basis elements and 304 critical pairs
      #|41 basis elements and 303 critical pairs
      #|41 basis elements and 302 critical pairs
      #|41 basis elements and 301 critical pairs
      #|41 basis elements and 300 critical pairs
      #|41 basis elements and 299 critical pairs
      #|41 basis elements and 298 critical pairs
      #|41 basis elements and 297 critical pairs
      #|41 basis elements and 296 critical pairs
      #|41 basis elements and 295 critical pairs
      #|41 basis elements and 294 critical pairs
      #|41 basis elements and 293 critical pairs
      #|41 basis elements and 292 critical pairs
      #|41 basis elements and 291 critical pairs
      #|41 basis elements and 290 critical pairs
      #|41 basis elements and 289 critical pairs
      #|41 basis elements and 288 critical pairs
      #|41 basis elements and 287 critical pairs
      #|41 basis elements and 286 critical pairs
      #|41 basis elements and 285 critical pairs
      #|41 basis elements and 284 critical pairs
      #|41 basis elements and 283 critical pairs
      #|41 basis elements and 282 critical pairs
      #|41 basis elements and 281 critical pairs
      #|41 basis elements and 280 critical pairs
      #|41 basis elements and 279 critical pairs
      #|41 basis elements and 278 critical pairs
      #|41 basis elements and 277 critical pairs
      #|41 basis elements and 276 critical pairs
      #|41 basis elements and 275 critical pairs
      #|41 basis elements and 274 critical pairs
      #|41 basis elements and 273 critical pairs
      #|41 basis elements and 272 critical pairs
      #|41 basis elements and 271 critical pairs
      #|41 basis elements and 270 critical pairs
      #|41 basis elements and 269 critical pairs
      #|41 basis elements and 268 critical pairs
      #|41 basis elements and 267 critical pairs
      #|41 basis elements and 266 critical pairs
      #|42 basis elements and 294 critical pairs
      #|43 basis elements and 323 critical pairs
      #|43 basis elements and 322 critical pairs
      #|43 basis elements and 321 critical pairs
      #|43 basis elements and 320 critical pairs
      #|43 basis elements and 319 critical pairs
      #|43 basis elements and 318 critical pairs
      #|43 basis elements and 317 critical pairs
      #|43 basis elements and 316 critical pairs
      #|43 basis elements and 315 critical pairs
      #|43 basis elements and 314 critical pairs
      #|43 basis elements and 313 critical pairs
      #|44 basis elements and 340 critical pairs
      #|44 basis elements and 339 critical pairs
      #|44 basis elements and 338 critical pairs
      #|44 basis elements and 337 critical pairs
      #|44 basis elements and 336 critical pairs
      #|44 basis elements and 335 critical pairs
      #|44 basis elements and 334 critical pairs
      #|44 basis elements and 333 critical pairs
      #|44 basis elements and 332 critical pairs
      #|44 basis elements and 331 critical pairs
      #|44 basis elements and 330 critical pairs
      #|44 basis elements and 329 critical pairs
      #|44 basis elements and 328 critical pairs
      #|44 basis elements and 327 critical pairs
      #|44 basis elements and 326 critical pairs
      #|44 basis elements and 325 critical pairs
      #|44 basis elements and 324 critical pairs
      #|44 basis elements and 323 critical pairs
      #|44 basis elements and 322 critical pairs
      #|44 basis elements and 321 critical pairs
      #|44 basis elements and 320 critical pairs
      #|44 basis elements and 319 critical pairs
      #|44 basis elements and 318 critical pairs
      #|44 basis elements and 317 critical pairs
      #|44 basis elements and 316 critical pairs
      #|44 basis elements and 315 critical pairs
      #|44 basis elements and 314 critical pairs
      #|44 basis elements and 313 critical pairs
      #|44 basis elements and 312 critical pairs
      #|44 basis elements and 311 critical pairs
      #|44 basis elements and 310 critical pairs
      #|44 basis elements and 309 critical pairs
      #|44 basis elements and 308 critical pairs
      #|44 basis elements and 307 critical pairs
      #|44 basis elements and 306 critical pairs
      #|44 basis elements and 305 critical pairs
      #|44 basis elements and 304 critical pairs
      #|44 basis elements and 303 critical pairs
      #|44 basis elements and 302 critical pairs
      #|44 basis elements and 301 critical pairs
      #|44 basis elements and 300 critical pairs
      #|44 basis elements and 299 critical pairs
      #|44 basis elements and 298 critical pairs
      #|44 basis elements and 297 critical pairs
      #|44 basis elements and 296 critical pairs
      #|44 basis elements and 295 critical pairs
      #|44 basis elements and 294 critical pairs
      #|44 basis elements and 293 critical pairs
      #|44 basis elements and 292 critical pairs
      #|44 basis elements and 291 critical pairs
      #|44 basis elements and 290 critical pairs
      #|44 basis elements and 289 critical pairs
      #|44 basis elements and 288 critical pairs
      #|44 basis elements and 287 critical pairs
      #|44 basis elements and 286 critical pairs
      #|44 basis elements and 285 critical pairs
      #|44 basis elements and 284 critical pairs
      #|44 basis elements and 283 critical pairs
      #|44 basis elements and 282 critical pairs
      #|44 basis elements and 281 critical pairs
      #|44 basis elements and 280 critical pairs
      #|44 basis elements and 279 critical pairs
      #|44 basis elements and 278 critical pairs
      #|44 basis elements and 277 critical pairs
      #|44 basis elements and 276 critical pairs
      #|44 basis elements and 275 critical pairs
      #|44 basis elements and 274 critical pairs
      #|44 basis elements and 273 critical pairs
      #|44 basis elements and 272 critical pairs
      #|44 basis elements and 271 critical pairs
      #|44 basis elements and 270 critical pairs
      #|44 basis elements and 269 critical pairs
      #|44 basis elements and 268 critical pairs
      #|44 basis elements and 267 critical pairs
      #|44 basis elements and 266 critical pairs
      #|44 basis elements and 265 critical pairs
      #|44 basis elements and 264 critical pairs
      #|44 basis elements and 263 critical pairs
      #|44 basis elements and 262 critical pairs
      #|44 basis elements and 261 critical pairs
      #|44 basis elements and 260 critical pairs
      #|44 basis elements and 259 critical pairs
      #|44 basis elements and 258 critical pairs
      #|44 basis elements and 257 critical pairs
      #|44 basis elements and 256 critical pairs
      #|44 basis elements and 255 critical pairs
      #|44 basis elements and 254 critical pairs
      #|44 basis elements and 253 critical pairs
      #|44 basis elements and 252 critical pairs
      #|44 basis elements and 251 critical pairs
      #|44 basis elements and 250 critical pairs
      #|44 basis elements and 249 critical pairs
      #|44 basis elements and 248 critical pairs
      #|44 basis elements and 247 critical pairs
      #|44 basis elements and 246 critical pairs
      #|44 basis elements and 245 critical pairs
      #|44 basis elements and 244 critical pairs
      #|44 basis elements and 243 critical pairs
      #|44 basis elements and 242 critical pairs
      #|44 basis elements and 241 critical pairs
      #|44 basis elements and 240 critical pairs
      #|44 basis elements and 239 critical pairs
      #|44 basis elements and 238 critical pairs
      #|44 basis elements and 237 critical pairs
      #|44 basis elements and 236 critical pairs
      #|44 basis elements and 235 critical pairs
      #|44 basis elements and 234 critical pairs
      #|44 basis elements and 233 critical pairs
      #|44 basis elements and 232 critical pairs
      #|44 basis elements and 231 critical pairs
      #|44 basis elements and 230 critical pairs
      #|44 basis elements and 229 critical pairs
      #|44 basis elements and 228 critical pairs
      #|44 basis elements and 227 critical pairs
      #|44 basis elements and 226 critical pairs
      #|44 basis elements and 225 critical pairs
      #|44 basis elements and 224 critical pairs
      #|44 basis elements and 223 critical pairs
      #|44 basis elements and 222 critical pairs
      #|44 basis elements and 221 critical pairs
      #|44 basis elements and 220 critical pairs
      #|44 basis elements and 219 critical pairs
      #|44 basis elements and 218 critical pairs
      #|44 basis elements and 217 critical pairs
      #|44 basis elements and 216 critical pairs
      #|44 basis elements and 215 critical pairs
      #|44 basis elements and 214 critical pairs
      #|44 basis elements and 213 critical pairs
      #|44 basis elements and 212 critical pairs
      #|44 basis elements and 211 critical pairs
      #|44 basis elements and 210 critical pairs
      #|44 basis elements and 209 critical pairs
      #|44 basis elements and 208 critical pairs
      #|44 basis elements and 207 critical pairs
      #|44 basis elements and 206 critical pairs
      #|44 basis elements and 205 critical pairs
      #|44 basis elements and 204 critical pairs
      #|44 basis elements and 203 critical pairs
      #|44 basis elements and 202 critical pairs
      #|44 basis elements and 201 critical pairs
      #|44 basis elements and 200 critical pairs
      #|44 basis elements and 199 critical pairs
      #|44 basis elements and 198 critical pairs
      #|44 basis elements and 197 critical pairs
      #|44 basis elements and 196 critical pairs
      #|44 basis elements and 195 critical pairs
      #|44 basis elements and 194 critical pairs
      #|44 basis elements and 193 critical pairs
      #|44 basis elements and 192 critical pairs
      #|44 basis elements and 191 critical pairs
      #|44 basis elements and 190 critical pairs
      #|44 basis elements and 189 critical pairs
      #|44 basis elements and 188 critical pairs
      #|44 basis elements and 187 critical pairs
      #|44 basis elements and 186 critical pairs
      #|44 basis elements and 185 critical pairs
      #|44 basis elements and 184 critical pairs
      #|44 basis elements and 183 critical pairs
      #|44 basis elements and 182 critical pairs
      #|44 basis elements and 181 critical pairs
      #|44 basis elements and 180 critical pairs
      #|44 basis elements and 179 critical pairs
      #|44 basis elements and 178 critical pairs
      #|44 basis elements and 177 critical pairs
      #|44 basis elements and 176 critical pairs
      #|44 basis elements and 175 critical pairs
      #|44 basis elements and 174 critical pairs
      #|44 basis elements and 173 critical pairs
      #|44 basis elements and 172 critical pairs
      #|44 basis elements and 171 critical pairs
      #|44 basis elements and 170 critical pairs
      #|44 basis elements and 169 critical pairs
      #|44 basis elements and 168 critical pairs
      #|44 basis elements and 167 critical pairs
      #|44 basis elements and 166 critical pairs
      #|44 basis elements and 165 critical pairs
      #|44 basis elements and 164 critical pairs
      #|44 basis elements and 163 critical pairs
      #|44 basis elements and 162 critical pairs
      #|44 basis elements and 161 critical pairs
      #|44 basis elements and 160 critical pairs
      #|44 basis elements and 159 critical pairs
      #|44 basis elements and 158 critical pairs
      #|44 basis elements and 157 critical pairs
      #|44 basis elements and 156 critical pairs
      #|44 basis elements and 155 critical pairs
      #|44 basis elements and 154 critical pairs
      #|44 basis elements and 153 critical pairs
      #|44 basis elements and 152 critical pairs
      #|44 basis elements and 151 critical pairs
      #|44 basis elements and 150 critical pairs
      #|44 basis elements and 149 critical pairs
      #|44 basis elements and 148 critical pairs
      #|44 basis elements and 147 critical pairs
      #|44 basis elements and 146 critical pairs
      #|44 basis elements and 145 critical pairs
      #|44 basis elements and 144 critical pairs
      #|44 basis elements and 143 critical pairs
      #|44 basis elements and 142 critical pairs
      #|44 basis elements and 141 critical pairs
      #|44 basis elements and 140 critical pairs
      #|44 basis elements and 139 critical pairs
      #|44 basis elements and 138 critical pairs
      #|44 basis elements and 137 critical pairs
      #|44 basis elements and 136 critical pairs
      #|44 basis elements and 135 critical pairs
      #|44 basis elements and 134 critical pairs
      #|44 basis elements and 133 critical pairs
      #|44 basis elements and 132 critical pairs
      #|44 basis elements and 131 critical pairs
      #|44 basis elements and 130 critical pairs
      #|44 basis elements and 129 critical pairs
      #|44 basis elements and 128 critical pairs
      #|44 basis elements and 127 critical pairs
      #|44 basis elements and 126 critical pairs
      #|44 basis elements and 125 critical pairs
      #|44 basis elements and 124 critical pairs
      #|44 basis elements and 123 critical pairs
      #|44 basis elements and 122 critical pairs
      #|44 basis elements and 121 critical pairs
      #|44 basis elements and 120 critical pairs
      #|44 basis elements and 119 critical pairs
      #|44 basis elements and 118 critical pairs
      #|44 basis elements and 117 critical pairs
      #|44 basis elements and 116 critical pairs
      #|44 basis elements and 115 critical pairs
      #|44 basis elements and 114 critical pairs
      #|44 basis elements and 113 critical pairs
      #|44 basis elements and 112 critical pairs
      #|44 basis elements and 111 critical pairs
      #|44 basis elements and 110 critical pairs
      #|44 basis elements and 109 critical pairs
      #|44 basis elements and 108 critical pairs
      #|44 basis elements and 107 critical pairs
      #|44 basis elements and 106 critical pairs
      #|44 basis elements and 105 critical pairs
      #|44 basis elements and 104 critical pairs
      #|44 basis elements and 103 critical pairs
      #|44 basis elements and 102 critical pairs
      #|44 basis elements and 101 critical pairs
      #|44 basis elements and 100 critical pairs
      #|44 basis elements and 99 critical pairs
      #|44 basis elements and 98 critical pairs
      #|44 basis elements and 97 critical pairs
      #|44 basis elements and 96 critical pairs
      #|44 basis elements and 95 critical pairs
      #|44 basis elements and 94 critical pairs
      #|44 basis elements and 93 critical pairs
      #|44 basis elements and 92 critical pairs
      #|44 basis elements and 91 critical pairs
      #|44 basis elements and 90 critical pairs
      #|44 basis elements and 89 critical pairs
      #|44 basis elements and 88 critical pairs
      #|44 basis elements and 87 critical pairs
      #|44 basis elements and 86 critical pairs
      #|44 basis elements and 85 critical pairs
      #|44 basis elements and 84 critical pairs
      #|44 basis elements and 83 critical pairs
      #|44 basis elements and 82 critical pairs
      #|44 basis elements and 81 critical pairs
      #|44 basis elements and 80 critical pairs
      #|44 basis elements and 79 critical pairs
      #|44 basis elements and 78 critical pairs
      #|44 basis elements and 77 critical pairs
      #|44 basis elements and 76 critical pairs
      #|44 basis elements and 75 critical pairs
      #|44 basis elements and 74 critical pairs
      #|44 basis elements and 73 critical pairs
      #|44 basis elements and 72 critical pairs
      #|44 basis elements and 71 critical pairs
      #|44 basis elements and 70 critical pairs
      #|44 basis elements and 69 critical pairs
      #|44 basis elements and 68 critical pairs
      #|44 basis elements and 67 critical pairs
      #|44 basis elements and 66 critical pairs
      #|44 basis elements and 65 critical pairs
      #|44 basis elements and 64 critical pairs
      #|44 basis elements and 63 critical pairs
      #|44 basis elements and 62 critical pairs
      #|44 basis elements and 61 critical pairs
      #|44 basis elements and 60 critical pairs
      #|44 basis elements and 59 critical pairs
      #|44 basis elements and 58 critical pairs
      #|44 basis elements and 57 critical pairs
      #|44 basis elements and 56 critical pairs
      #|44 basis elements and 55 critical pairs
      #|44 basis elements and 54 critical pairs
      #|44 basis elements and 53 critical pairs
      #|44 basis elements and 52 critical pairs
      #|44 basis elements and 51 critical pairs
      #|44 basis elements and 50 critical pairs
      #|44 basis elements and 49 critical pairs
      #|44 basis elements and 48 critical pairs
      #|44 basis elements and 47 critical pairs
      #|44 basis elements and 46 critical pairs
      #|44 basis elements and 45 critical pairs
      #|44 basis elements and 44 critical pairs
      #|44 basis elements and 43 critical pairs
      #|44 basis elements and 42 critical pairs
      #|44 basis elements and 41 critical pairs
      #|44 basis elements and 40 critical pairs
      #|44 basis elements and 39 critical pairs
      #|44 basis elements and 38 critical pairs
      #|44 basis elements and 37 critical pairs
      #|44 basis elements and 36 critical pairs
      #|44 basis elements and 35 critical pairs
      #|44 basis elements and 34 critical pairs
      #|44 basis elements and 33 critical pairs
      #|44 basis elements and 32 critical pairs
      #|44 basis elements and 31 critical pairs
      #|44 basis elements and 30 critical pairs
      #|44 basis elements and 29 critical pairs
      #|44 basis elements and 28 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|44 basis elements and 14 critical pairs
      #|44 basis elements and 13 critical pairs
      #|44 basis elements and 12 critical pairs
      #|44 basis elements and 11 critical pairs
      #|44 basis elements and 10 critical pairs
      #|44 basis elements and 9 critical pairs
      #|44 basis elements and 8 critical pairs
      #|44 basis elements and 7 critical pairs
      #|44 basis elements and 6 critical pairs
      #|44 basis elements and 5 critical pairs
      #|44 basis elements and 4 critical pairs
      #|44 basis elements and 3 critical pairs
      #|44 basis elements and 2 critical pairs
      #|44 basis elements and 1 critical pairs
      #|44 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 7 critical pairs
      #|9 basis elements and 11 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|11 basis elements and 11 critical pairs
      #|11 basis elements and 10 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|11 basis elements and 3 critical pairs
      #|11 basis elements and 2 critical pairs
      #|11 basis elements and 1 critical pairs
      #|11 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..7..12..22..47..79..123..solved at 145
      #|0..0..1..3..7..12..22..47..79..123..solved at 145
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..55..132..411..solved at 832
      #|0..0..1..solved at 4
      #|0..0..2..5..15..30..69..187..solved at 492
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..16..27..42..58..77..100..128..160..222..solved at 242
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..12..27..solved at 52
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..15..solved at 37
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..21..34..55..solved at 73
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..1..2..5..solved at 12
      #|0..0..1..2..5..solved at 11
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..2..9..19..47..102..172..273..486..879..solved at 1333
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..6..14..41..82..151..270..441..654..1139..1949..solved at 2548
      #|1 basis elements and 0 critical pairs
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..5..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..solved at 26
      #|0..0..1..2..solved at 6
      #|0..0..1..3..9..17..46..solved at 96
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..5..16..36..114..solved at 121
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..12..21..solved at 31
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..9..18..34..59..100..167..solved at 240
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..3..11..solved at 23
      #|0..0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..0..0..3..11..solved at 23
      #|0..0..1..solved at 5
      #|0..0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..1..3..5..solved at 11
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..3..solved at 9
      #|0..0..2..4..6..14..26..solved at 42
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..solved at 13
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..7..12..solved at 19
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..16..31..solved at 42
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..22..31..44..62..solved at 80
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..2..7..13..solved at 19
      #|0..0..1..3..7..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..2..5..12..22..solved at 33
      #|0..0..1..3..7..solved at 12
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..5..7..9..15..21..27..solved at 44
      #|0..0..0..1..solved at 5
      #|0..0..0..1..3..7..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..1..2..3..7..11..15..28..41..54..solved at 140
      #|0..0..1..2..3..7..12..17..33..49..65..97..129..161..solved at 201
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..0..0..solved at 6
      #|0..0..1..2..5..9..15..25..40..66..123..229..496..solved at 530
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..0..1..2..3..6..12..19..29..44..60..90..132..174..237..347..461..671..924..1242..1638..2121..2674..3528..4540..5883..7460..9417..solved at 9827
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..6..9..12..solved at 20
      #|0..0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..16..solved at 25
      #|0..0..0..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..0..1..2..3..7..11..15..27..39..51..solved at 139
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 9
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..7..11..15..28..41..54..solved at 140
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..20..36..57..80..solved at 102
      #|0..0..0..0..4..10..20..36..solved at 56
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..1..2..3..6..12..20..32..49..67..101..149..197..269..393..521..756..1037..1386..1819..2341..2939..3838..4894..solved at 5394
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..0..3..7..13..23..37..56..84..121..167..232..306..397..505..632..811..1028..1316..1696..2170..2748..3498..4387..5428..6873..8564..10748..13749..solved at 17244
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..14..35..60..99..166..245..378..solved at 392
      #|0..0..4..8..20..44..77..154..265..solved at 316
      #|0..0..4..9..27..63..114..solved at 128
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..3..7..15..solved at 21
      #|0..0..3..6..13..30..55..solved at 72
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..4..10..22..41..solved at 51
      #|0..0..0..0..4..10..solved at 20
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..21..46..solved at 96
      #|0..0..1..2..5..9..15..22..29..36..solved at 45
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..29..44..68..108..150..213..348..523..solved at 570
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..18..40..86..solved at 175
      #|0..0..1..3..7..15..26..46..68..96..129..166..207..268..333..414..solved at 465
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..4..5..6..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..0..0..2..9..20..46..solved at 72
      #|0..0..0..2..6..solved at 11
      #|0..0..1..3..8..17..33..59..98..146..217..solved at 276
      #|0..0..1..2..5..9..15..solved at 24
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..12..21..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..1..3..7..solved at 14
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..9..solved at 15
      #|0..0..0..0..1..4..9..solved at 17
      #|0..0..1..2..3..7..13..21..solved at 34
      #|0..0..1..2..11..25..52..solved at 59
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..7..15..26..46..77..solved at 96
      #|0..0..solved at 2
      #|0..0..0..0..1..4..9..solved at 22
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..0..0..2..4..6..9..12..15..23..31..39..56..73..90..116..142..168..276..solved at 403
      #|0..0..0..0..0..0..2..4..6..10..14..18..27..36..45..61..77..93..120..147..174..213..252..291..465..651..890..solved at 1040
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..11..27..56..102..187..282..507..789..1249..2185..3446..solved at 4008
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..11..27..57..106..191..284..468..692..1090..1990..3213..solved at 3826
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..2..3..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..4..9..17..26..35..50..65..105..solved at 128
      #|0..0..0..0..1..4..9..18..28..39..58..77..solved at 90
      #|0..0..1..3..7..solved at 17
      #|0..0..1..3..7..13..20..solved at 35
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..2..6..11..23..47..91..186..333..537..880..1386..2121..3496..5629..8957..14874..24097..37962..solved at 40441
      #|0..0..2..7..13..27..57..114..242..439..707..1140..1754..2620..4198..6611..10369..17055..27259..42383..solved at 45658
      #|0..0..3..6..13..31..58..118..solved at 181
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 11
      #|0..0..2..solved at 8
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..10..solved at 14
      #|0..0..2..8..solved at 12
      #|0..0..0..2..solved at 6
      #|0..0..0..1..7..18..40..73..113..191..298..467..830..solved at 1350
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..8..16..28..solved at 37
      #|0..0..solved at 2
      #|0..0..1..5..10..15..30..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..8..16..28..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..8..11..28..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..9..17..25..38..51..64..98..132..166..243..320..669..1192..2483..3902..5643..7672..solved at 7764
      #|0..0..1..solved at 5
      #|0..0..1..6..13..solved at 19
      #|0..0..1..10..solved at 21
      #|0..0..1..solved at 8
      #|0..0..1..11..solved at 24
      #|0..0..solved at 2
      #|0..0..1..2..9..19..31..63..105..solved at 121
      #|0..0..solved at 2
      #|CPU time (user): <t>
      #|0..0..1..3..8..14..33..66..99..154..219..284..365..450..535..843..1220..1621..2226..2892..3660..5020..6510..8326..10667..13397..16922..20942..25267..30727..solved at 35152
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..1..5..11..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..7..13..23..34..45..56..80..104..141..237..solved at 327
      #|0..0..1..3..7..17..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..25..35..47..67..87..114..solved at 152
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..18..30..48..66..88..solved at 99
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..4..7..17..31..66..117..228..383..696..1122..1957..solved at 2075
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..2..8..20..49..103..solved at 184
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..37..56..solved at 74
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..7..solved at 13
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..7..15..25..40..62..93..159..253..solved at 294
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..10..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..9..21..44..solved at 58
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..solved at 14
      #|0..0..1..2..4..6..8..10..12..14..solved at 22
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..3..6..16..33..60..123..solved at 148
      #|0..0..2..4..10..20..35..77..136..243..470..842..1459..solved at 2793
      #|0..0..3..9..24..59..112..228..solved at 259
      #|0..0..2..solved at 5
      #|0..0..1..2..9..21..47..87..161..241..405..578..951..1711..2759..solved at 3322
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..solved at 2
      #|0..0..1..2..4..6..8..18..solved at 27
      #|0..0..1..2..9..21..47..87..161..241..405..578..951..1711..2759..solved at 3322
      #|0..0..1..2..6..13..24..41..61..90..135..187..273..solved at 328
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..15..35..68..118..207..306..581..923..1443..2563..4010..solved at 4635
      #|0..0..1..2..11..27..57..106..191..284..468..696..1098..2178..3581..solved at 4197
      #|0..0..1..2..3..7..13..23..36..59..88..140..211..338..488..746..1043..1621..2861..4543..solved at 5474
      #|0..0..1..2..3..7..13..23..36..55..76..116..166..254..389..630..892..1347..1849..2763..4990..7936..solved at 8664
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..1..2..3..7..14..solved at 24
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..8..solved at 21
      #|0..0..1..4..12..30..solved at 48
      #|0..0..1..3..7..15..26..51..82..126..188..259..358..solved at 471
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..1..2..3..7..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..14..41..solved at 109
      #|0..0..1..4..14..41..solved at 109
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..8..13..18..57..118..228..519..solved at 739
      #|0..0..7..17..41..84..159..304..solved at 320
      #|0..0..6..15..37..75..146..284..507..916..1621..2866..solved at 3447
      #|0..0..6..solved at 15
      #|0..0..7..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 5
      #|0..0..1..2..3..7..14..26..47..77..solved at 94
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..15..32..67..114..173..245..344..468..solved at 605
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..2..5..10..solved at 16
      #|0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..0..1..solved at 6
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..6..solved at 10
      #|0..0..2..6..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..15..31..56..96..solved at 122
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..9..16..36..63..98..178..268..solved at 293
      #|0..0..2..5..10..23..40..solved at 54
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..6..9..12..solved at 20
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..23..31..39..solved at 63
      #|0..0..0..1..2..3..6..9..12..solved at 22
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..solved at 14
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..0..4..12..20..39..62..89..solved at 132
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..4..solved at 7
      #|0..0..2..6..14..46..85..182..345..630..solved at 708
      #|0..0..1..3..7..13..24..51..78..126..184..solved at 193
      #|0..0..1..3..5..11..21..32..45..63..81..solved at 90
      #|0..0..1..3..7..13..24..53..82..134..193..solved at 202
      #|0..0..1..3..7..12..20..30..40..71..106..solved at 115
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..8..14..solved at 20
      #|0..0..1..3..8..13..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..4..10..22..42..solved at 53
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..solved at 8
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..5..12..solved at 17
      #|0..0..2..7..14..32..82..191..466..1144..2508..5758..13277..28479..solved at 31328
      #|0..0..1..4..8..15..solved at 34
      #|0..0..1..6..18..solved at 25
      #|0..0..0..2..6..14..solved at 32
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 19
      #|0..0..3..8..solved at 22
      #|0..0..2..6..solved at 19
      #|0..0..solved at 2
      #|0..0..3..8..solved at 22
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..6..solved at 22
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..22..54..solved at 65
      #|0..0..0..4..11..21..46..76..solved at 89
      #|0..0..2..4..14..solved at 32
      #|0..0..1..2..8..solved at 17
      #|0..0..solved at 2
      #|0..0..1..2..8..solved at 18
      #|0..0..1..2..5..12..21..solved at 30
      #|0..0..1..2..5..12..23..solved at 35
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..14..38..solved at 134
      #|0..0..0..2..14..solved at 42
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 8
      #|0..0..solved at 2
      #|0..0..3..7..solved at 11
      #|0..0..solved at 2
      #|0..0..3..7..solved at 11
      #|0..0..solved at 2
      #|0..0..2..5..11..26..solved at 51
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..5..15..41..solved at 49
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..19..40..67..101..solved at 127
      #|0..0..2..4..8..18..31..46..solved at 60
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 19
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..8..28..54..solved at 68
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 19
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..10..22..solved at 31
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..2..4..12..24..solved at 30
      #|0..0..solved at 2
      #|0..0..3..7..15..31..53..solved at 71
      #|0..0..2..5..10..22..44..solved at 56
      #|0..0..2..4..8..solved at 17
      #|0..0..2..4..8..solved at 19
      #|0..0..3..6..13..32..58..solved at 74
      #|0..0..3..6..13..32..58..solved at 70
      #|0..0..2..4..8..solved at 17
      #|0..0..2..4..8..22..48..87..137..213..310..439..solved at 478
      #|0..0..2..4..8..22..48..87..137..213..310..439..solved at 486
      #|0..0..2..4..8..solved at 16
      #|0..0..2..4..8..16..36..71..114..180..267..433..653..908..1270..solved at 1348
      #|Warning: inventing type variables
      #|0..0..2..5..solved at 9
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..8..solved at 20
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..0..0..2..6..13..25..solved at 34
      #|0..0..0..0..2..6..13..25..solved at 34
      #|0..0..1..2..5..12..23..38..64..solved at 78
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..1..2..5..12..23..38..64..solved at 78
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..0..0..0..1..3..5..12..solved at 21
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..1..2..3..7..15..23..35..49..63..solved at 77
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..1..3..6..9..12..solved at 19
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..1..3..6..9..12..solved at 19
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..7..solved at 13
      #|0..0..3..7..15..solved at 28
      #|0..0..solved at 2
      #|0..0..4..9..18..solved at 35
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..22..34..48..69..99..140..211..307..435..642..905..1303..1847..solved at 2499
      #|0..0..1..6..19..47..109..225..399..solved at 564
      #|0..0..0..1..2..3..12..solved at 21
      #|0..0..1..2..5..12..22..36..52..74..106..152..212..321..452..711..1026..1572..2205..3406..5353..8956..solved at 11113
      #|0..0..1..2..5..solved at 13
      #|0..0..2..9..20..43..82..solved at 135
      #|0..0..1..2..5..9..15..22..solved at 40
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..32..solved at 51
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..10..24..51..solved at 66
      #|0..0..solved at 2
      #|0..0..4..8..19..41..solved at 64
      #|0..0..4..8..19..42..solved at 65
      #|0..0..5..10..24..solved at 32
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..5..8..11..14..17..20..36..56..78..109..148..191..248..317..solved at 371
      #|0..0..1..2..5..8..11..14..17..20..36..56..78..109..148..191..248..317..solved at 375
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..2..3..5..7..9..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..4..5..6..9..12..15..21..27..33..solved at 55
      #|0..0..1..2..5..8..11..14..17..20..28..36..44..55..66..77..solved at 97
      #|0..0..1..2..5..8..11..14..17..20..28..36..44..55..66..77..solved at 97
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..5..9..17..26..38..solved at 48
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..5..9..15..23..34..48..solved at 65
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..5..11..solved at 18
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..18..31..46..63..88..solved at 117
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..30..47..76..solved at 120
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..8..15..29..58..solved at 87
      #|0..0..1..3..8..15..solved at 21
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..5..13..34..70..160..300..605..1071..2263..3998..8099..solved at 12555
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..2..solved at 5
      #|0..0..2..5..solved at 10
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..6..9..12..21..30..39..58..77..96..solved at 107
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..7..17..36..76..145..262..solved at 474
      #|0..0..1..6..16..31..71..132..229..443..713..1082..1694..2623..4077..6756..11110..18048..29639..47994..76336..solved at 115499
      #|0..0..2..4..8..22..42..66..112..161..223..297..381..481..707..949..1227..1650..2105..2606..3270..3978..4770..5888..7090..8445..10095..11890..14206..solved at 14609
      #|0..0..2..8..16..42..99..163..346..solved at 408
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..12..30..56..solved at 64
      #|0..0..2..4..11..26..47..solved at 55
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..12..27..47..solved at 54
      #|0..0..2..4..11..26..46..solved at 53
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..8..14..36..77..126..246..516..1204..3264..solved at 3298
      #|0..0..1..solved at 7
      #|0..0..1..7..15..33..83..171..solved at 204
      #|0..0..2..5..10..33..62..93..150..209..272..339..414..499..747..1045..1349..solved at 1473
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..4..8..12..16..solved at 25
      #|0..0..1..5..14..solved at 20
      #|0..0..2..4..8..16..28..44..solved at 54
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..3..10..23..57..122..234..solved at 262
      #|0..0..1..4..12..31..76..162..294..558..959..1533..2548..solved at 2588
      #|0..0..2..4..9..25..48..84..142..210..337..solved at 387
      #|0..0..2..5..11..35..65..100..176..254..338..437..544..687..1040..1443..1912..solved at 2135
      #|0..0..1..5..11..solved at 16
      #|0..0..1..3..7..solved at 17
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1693..2329..3064..solved at 3378
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1693..2329..3064..solved at 3370
      #|0..0..3..6..14..41..79..141..244..366..591..solved at 701
      #|0..0..3..6..14..41..79..141..244..366..591..solved at 662
      #|0..0..1..2..3..10..21..32..55..solved at 64
      #|0..0..2..solved at 5
      #|0..0..0..4..solved at 12
      #|0..0..0..4..solved at 8
      #|0..0..2..solved at 8
      #|0..0..2..solved at 5
      #|0..0..2..solved at 9
      #|0..0..3..12..30..77..192..408..957..2317..5293..solved at 9312
      #|0..0..2..8..solved at 14
      #|0..0..2..10..solved at 17
      #|0..0..3..11..28..74..192..410..solved at 619
      #|0..0..2..10..31..89..255..622..1544..3861..9467..solved at 9606
      #|0..0..2..7..17..36..76..145..262..solved at 483
      #|0..0..1..6..16..31..71..132..229..443..713..1082..1694..2617..4067..6744..11120..18071..29739..48196..76749..solved at 117331
      #|0..0..2..4..8..22..42..66..112..161..223..297..381..481..707..949..1227..1650..2105..2606..3270..3978..4770..5891..7096..8454..10131..11953..14289..solved at 14763
      #|0..0..2..8..16..42..99..163..346..solved at 408
      #|0..0..2..4..12..27..48..solved at 56
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..11..29..55..solved at 63
      #|0..0..2..4..12..27..47..solved at 54
      #|0..0..2..5..13..solved at 18
      #|0..0..1..3..10..solved at 15
      #|0..0..2..4..11..26..46..solved at 53
      #|0..0..1..3..8..14..36..77..126..246..516..1202..3262..solved at 3309
      #|0..0..1..solved at 7
      #|0..0..1..7..15..33..83..171..solved at 204
      #|0..0..2..5..10..33..62..93..150..209..272..339..414..499..749..1049..1355..solved at 1479
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..5..14..solved at 20
      #|0..0..1..4..8..12..16..solved at 27
      #|0..0..2..4..8..16..28..45..solved at 55
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..6..16..41..78..solved at 112
      #|0..0..3..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..2..5..11..43..97..169..307..507..781..1260..1924..solved at 2571
      #|0..0..2..5..11..40..91..161..351..626..solved at 723
      #|0..0..1..4..11..30..75..161..294..559..961..1532..2548..solved at 2599
      #|0..0..2..4..10..26..49..86..143..211..338..solved at 362
      #|0..0..2..5..11..35..65..100..176..254..338..437..544..687..1042..1447..1918..solved at 2141
      #|0..0..1..5..11..solved at 16
      #|0..0..1..3..7..solved at 17
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1695..2333..3070..solved at 3384
      #|0..0..3..8..18..53..99..155..287..423..569..733..913..1145..1695..2333..3070..solved at 3376
      #|0..0..3..6..16..43..81..145..246..368..593..solved at 658
      #|0..0..3..6..16..43..81..145..246..368..593..solved at 619
      #|0..0..1..2..3..10..21..32..55..solved at 64
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 8
      #|0..0..0..0..4..8..12..32..70..solved at 82
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..2..5..11..29..63..103..180..solved at 196
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..2..5..11..29..63..103..180..solved at 196
      #|0..0..1..3..8..18..37..58..91..126..165..204..271..346..451..613..783..1037..1319..1611..1959..2388..2833..3328..solved at 3724
      #|0..0..1..3..8..18..37..58..91..126..165..204..271..346..451..613..783..1037..1319..1611..1959..2387..2831..3323..solved at 3718
      #|0..0..1..2..solved at 6
      #|0..0..0..1..3..5..7..9..11..solved at 18
      #|0..0..1..2..solved at 6
      #|0..0..0..1..3..5..7..9..11..solved at 18
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..7..solved at 11
      #|0..0..0..4..13..solved at 25
      #|0..0..2..7..15..39..100..234..587..1410..3140..7378..16891..solved at 18714
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..24..33..44..67..90..125..solved at 185
      #|0..0..1..2..5..8..11..solved at 19
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..0..0..1..3..5..12..21..41..70..112..159..242..330..451..600..781..1008..1316..1670..solved at 2062
      #|0..0..1..solved at 4
      #|0..0..2..8..19..solved at 25
      #|0..0..2..8..18..solved at 24
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..27..41..66..107..solved at 125
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..19..42..78..127..186..270..412..638..solved at 773
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..23..51..93..156..solved at 190
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..1..2..8..17..53..104..solved at 158
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..11..20..34..72..114..190..381..solved at 438
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 16
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..5..9..15..solved at 22
      #|0..0..solved at 2
      #|0..0..3..6..12..25..46..94..155..254..479..solved at 599
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..53..70..97..132..167..210..282..354..455..576..697..838..1034..1230..1481..solved at 1835
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..8..29..83..252..796..2457..solved at 6383
      #|0..0..1..2..6..solved at 11
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..5..18..39..95..203..357..828..1513..2671..4683..8315..solved at 12845
      #|Warning: inventing type variables
      #|0..0..3..6..13..solved at 24
      #|0..0..2..4..8..16..28..43..67..95..155..236..348..490..727..solved at 823
      #|0..0..4..8..19..solved at 30
      #|0..0..3..6..solved at 13
      #|0..0..1..7..15..31..64..111..solved at 125
      #|0..0..solved at 2
      #|0..0..1..7..15..31..64..111..solved at 125
      #|0..0..0..1..3..7..20..solved at 34
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..35..solved at 65
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 6
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..solved at 31
      #|0..0..solved at 2
      #|0..0..1..5..solved at 9
      #|0..0..3..7..solved at 11
      #|0..0..2..4..12..24..44..84..solved at 142
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..10..22..49..93..171..282..522..811..solved at 842
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 18
      #|0..0..1..2..5..solved at 13
      #|0..0..3..11..31..solved at 42
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..solved at 8
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..8..16..39..83..147..248..472..749..1436..solved at 2196
      #|0..0..4..8..18..solved at 32
      #|0..0..2..4..8..solved at 14
      #|0..0..1..3..solved at 8
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..11..25..55..100..209..399..solved at 697
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..solved at 12
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..3..27..62..115..232..373..528..901..1355..1992..3226..4642..6943..11993..17782..25228..solved at 26787
      #|0..0..1..2..3..27..62..115..232..375..534..921..1398..2034..3299..4800..7116..12226..18239..26036..solved at 27625
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..11..30..94..solved at 127
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..8..18..34..solved at 45
      #|0..0..4..8..18..34..65..114..169..250..357..480..719..986..1285..solved at 1469
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..solved at 13
      #|0..0..2..4..8..solved at 13
      #|0..0..1..2..6..36..79..solved at 105
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..8..16..solved at 24
      #|0..0..solved at 2
      #|0..0..2..4..8..16..28..45..solved at 56
      #|0..0..1..2..3..27..62..115..232..373..528..901..1355..1992..3226..4642..6943..11993..17782..25228..solved at 26787
      #|0..0..1..2..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 4
      #|0..0..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 11
      #|0..0..2..6..13..25..56..95..152..224..327..455..690..976..solved at 1019
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..6..15..30..73..134..229..368..553..800..1208..1747..2508..3645..5152..7046..solved at 7159
      #|0..0..3..6..9..solved at 14
      #|0..0..3..6..9..solved at 14
      #|0..0..2..5..8..solved at 18
      #|0..0..2..solved at 6
      #|0..0..1..3..7..13..30..solved at 37
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..5..15..30..solved at 36
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..5..15..solved at 22
      #|0..0..2..6..22..76..261..solved at 597
      #|0..0..1..2..7..13..26..42..67..97..161..234..375..537..790..1087..1727..2450..solved at 2485
      #|0..0..0..solved at 3
      #|0..0..2..6..15..30..77..142..259..422..679..1002..1619..2374..3785..5636..9224..13422..solved at 13525
      #|0..0..1..2..5..9..15..23..31..39..57..75..103..solved at 139
      #|0..0..1..2..6..11..19..34..49..70..117..164..237..386..553..836..1215..1685..2287..solved at 2745
      #|0..0..1..solved at 5
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..38..52..75..98..130..solved at 171
      #|0..0..solved at 2
      #|0..0..1..2..5..11..19..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..12..30..solved at 51
      #|0..0..solved at 2
      #|0..0..1..3..7..14..32..solved at 40
      #|0..0..solved at 2
      #|0..0..1..3..7..14..30..solved at 38
      #|0..0..2..4..10..18..30..solved at 46
      #|0..0..2..4..8..16..28..59..103..173..solved at 212
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..3..6..solved at 10
      #|0..0..2..4..8..26..55..85..141..solved at 150
      #|0..0..1..4..13..29..64..122..204..solved at 247
      #|0..0..1..7..18..38..78..147..solved at 161
      #|0..0..1..solved at 4
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..2..3..7..13..21..32..solved at 48
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..6..15..30..73..134..229..368..553..800..1208..1747..2508..3645..5152..7046..solved at 7159
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..8..solved at 12
      #|0..0..1..5..15..31..solved at 37
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..6..9..25..47..79..153..solved at 167
      #|0..0..3..6..9..25..48..84..158..solved at 175
      #|0..0..2..5..8..19..37..63..117..solved at 165
      #|0..0..2..solved at 6
      #|0..0..1..2..3..4..9..22..35..56..81..solved at 94
      #|0..0..1..solved at 4
      #|0..0..2..9..16..26..59..solved at 68
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..5..15..solved at 22
      #|0..0..2..6..22..76..261..solved at 597
      #|0..0..1..2..7..13..26..42..67..97..161..234..375..537..790..1087..1727..2450..solved at 2485
      #|0..0..2..5..10..21..39..63..93..148..228..393..701..1290..2397..solved at 3736
      #|0..0..0..solved at 3
      #|0..0..2..6..15..30..77..142..253..408..639..934..1487..2172..3341..4925..7743..11077..solved at 11180
      #|0..0..2..5..10..25..47..75..111..172..258..425..731..1326..2461..4773..8965..solved at 14712
      #|0..0..1..2..5..9..15..23..31..39..57..75..103..solved at 139
      #|0..0..1..2..6..11..19..34..49..70..117..164..237..386..553..836..1213..1681..2277..solved at 2731
      #|0..0..1..solved at 5
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..38..52..75..98..130..solved at 171
      #|0..0..solved at 2
      #|0..0..1..2..5..11..19..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..10..25..solved at 41
      #|0..0..1..solved at 4
      #|0..0..2..4..10..18..30..solved at 46
      #|0..0..2..4..8..16..28..59..103..173..solved at 214
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..0..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..3..6..solved at 10
      #|0..0..2..4..8..26..55..85..141..solved at 150
      #|0..0..1..4..13..29..64..122..204..solved at 247
      #|0..0..1..7..18..38..78..147..solved at 161
      #|0..0..1..2..6..12..28..48..72..100..147..195..316..458..652..894..1207..1592..2128..2732..3491..4404..5471..6812..8440..10222..12256..14610..17294..solved at 19757
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..3..5..10..19..31..60..103..157..249..361..504..748..1123..1718..2921..solved at 3656
      #|Warning: inventing type variables
      #|0..0..1..3..7..16..35..68..116..212..392..759..solved at 1033
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..8..19..39..solved at 69
      #|0..0..solved at 2
      #|0..0..1..5..20..solved at 25
      #|0..0..solved at 2
      #|0..0..2..8..27..solved at 33
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 31
      #|0..0..2..solved at 6
      #|0..0..1..2..5..11..solved at 17
      #|0..0..2..4..10..19..solved at 25
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..30..47..76..solved at 127
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..4..solved at 9
      #|0..0..1..2..5..9..15..30..47..76..solved at 124
      #|0..0..1..2..5..9..15..22..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..10..solved at 16
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..1..2..5..9..15..solved at 30
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..2..5..9..solved at 16
      #|0..0..0..0..4..9..18..30..solved at 42
      #|0..0..0..0..0..4..10..16..26..36..46..64..82..100..131..162..193..solved at 219
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..40..67..116..solved at 201
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..8..15..solved at 40
      #|0..0..solved at 2
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..3..5..10..19..32..60..solved at 97
      #|0..0..1..3..5..10..18..28..52..solved at 83
      #|0..0..2..5..8..17..31..47..86..solved at 135
      #|0..0..1..3..5..10..18..28..51..solved at 81
      #|0..0..2..5..8..17..31..47..87..solved at 133
      #|0..0..2..5..8..17..31..49..92..solved at 144
      #|0..0..3..7..11..24..43..62..111..solved at 167
      #|0..0..1..2..5..9..15..40..67..116..solved at 198
      #|0..0..2..4..8..16..29..65..127..215..solved at 297
      #|0..0..2..4..8..16..31..73..144..245..solved at 327
      #|0..0..3..6..11..23..45..104..216..372..solved at 528
      #|0..0..2..4..8..16..29..65..128..217..solved at 299
      #|0..0..3..6..11..23..43..96..200..344..solved at 500
      #|0..0..3..6..11..23..43..90..185..310..solved at 396
      #|0..0..4..8..14..30..57..127..269..465..solved at 707
      #|0..0..2..4..8..16..30..69..136..231..solved at 313
      #|0..0..3..6..11..23..42..92..192..330..solved at 486
      #|0..0..3..6..11..23..44..94..193..324..solved at 410
      #|0..0..4..8..14..30..56..123..261..451..solved at 693
      #|0..0..3..6..11..23..42..86..177..296..solved at 382
      #|0..0..4..8..14..30..54..115..245..423..solved at 665
      #|0..0..4..8..14..30..54..103..214..353..solved at 447
      #|0..0..5..10..17..37..66..138..294..508..solved at 848
      #|0..0..2..4..8..16..30..69..135..229..solved at 311
      #|0..0..3..6..11..23..42..92..189..324..solved at 480
      #|0..0..3..6..11..23..44..94..194..326..solved at 412
      #|0..0..4..8..14..30..56..123..260..449..solved at 691
      #|0..0..3..6..11..23..44..94..194..326..solved at 412
      #|0..0..4..8..14..30..56..123..260..449..solved at 691
      #|0..0..4..8..14..30..56..111..233..387..solved at 481
      #|0..0..5..10..17..37..68..146..311..538..solved at 878
      #|0..0..3..6..11..23..45..98..202..340..solved at 426
      #|0..0..4..8..14..30..55..119..252..435..solved at 677
      #|0..0..4..8..14..30..57..115..241..401..solved at 495
      #|0..0..5..10..17..37..67..142..303..524..solved at 864
      #|0..0..4..8..14..30..57..115..241..401..solved at 495
      #|0..0..5..10..17..37..67..142..303..524..solved at 864
      #|0..0..5..10..17..37..67..124..260..426..solved at 532
      #|0..0..6..12..20..44..77..157..334..577..solved at 1027
      #|0..0..2..4..8..16..29..65..126..213..solved at 295
      #|0..0..3..6..11..23..43..96..198..340..solved at 465
      #|0..0..3..6..11..23..43..90..185..310..solved at 395
      #|0..0..4..8..14..30..57..127..269..465..solved at 673
      #|0..0..3..6..11..23..43..90..185..310..solved at 395
      #|0..0..4..8..14..30..57..127..269..465..solved at 673
      #|0..0..4..8..14..30..55..107..224..371..solved at 463
      #|0..0..5..10..17..37..69..150..320..554..solved at 857
      #|0..0..3..6..11..23..44..94..193..324..solved at 409
      #|0..0..4..8..14..30..56..123..261..451..solved at 659
      #|0..0..4..8..14..30..56..111..232..385..solved at 477
      #|0..0..5..10..17..37..68..146..312..540..solved at 843
      #|0..0..4..8..14..30..56..111..232..385..solved at 477
      #|0..0..5..10..17..37..68..146..312..540..solved at 843
      #|0..0..5..10..17..37..66..120..251..410..solved at 513
      #|0..0..6..12..20..44..78..161..343..593..solved at 1003
      #|0..0..3..6..11..23..42..86..176..294..solved at 379
      #|0..0..4..8..14..30..54..115..242..417..solved at 625
      #|0..0..4..8..14..30..54..103..217..359..solved at 451
      #|0..0..5..10..17..37..66..138..295..510..solved at 813
      #|0..0..4..8..14..30..56..111..233..387..solved at 479
      #|0..0..5..10..17..37..68..146..311..538..solved at 841
      #|0..0..5..10..17..37..66..120..254..416..solved at 519
      #|0..0..6..12..20..44..78..161..344..595..solved at 1005
      #|0..0..4..8..14..30..57..115..241..401..solved at 493
      #|0..0..5..10..17..37..67..142..303..524..solved at 827
      #|0..0..5..10..17..37..67..124..262..430..solved at 533
      #|0..0..6..12..20..44..77..157..336..581..solved at 991
      #|0..0..5..10..17..37..69..132..278..458..solved at 561
      #|0..0..6..12..20..44..79..165..352..609..solved at 1019
      #|0..0..6..12..20..44..77..133..279..451..solved at 569
      #|0..0..7..14..23..51..87..172..365..630..solved at 1159
      #|0..0..1..8..31..110..474..1716..solved at 3337
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..5..9..15..40..67..116..solved at 201
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 22
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 17
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 16
      #|0..0..3..6..17..36..64..solved at 95
      #|0..0..2..4..13..27..47..solved at 60
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..3..8..14..solved at 20
      #|0..0..1..3..8..13..solved at 19
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..solved at 16
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..1..9..solved at 20
      #|0..0..0..0..3..12..solved at 27
      #|0..0..1..2..6..16..solved at 31
      #|0..0..solved at 2
      #|0..0..1..2..10..23..45..73..109..150..237..341..solved at 482
      #|0..0..2..7..17..57..111..252..solved at 259
      #|0..0..1..2..5..9..15..24..33..44..67..90..125..186..247..334..524..solved at 604
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..11..19..28..37..46..73..100..145..212..279..368..509..650..841..1124..1407..1782..2305..2828..3499..solved at 4403
      #|0..0..1..2..6..12..25..47..84..141..245..solved at 353
      #|0..0..1..2..3..7..35..80..139..252..387..solved at 519
      #|0..0..1..2..3..7..35..80..139..252..387..solved at 463
      #|0..0..1..2..6..11..19..29..39..50..91..141..235..375..577..845..1399..solved at 1533
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..24..45..76..125..208..solved at 288
      #|0..0..2..4..8..16..28..44..69..101..151..223..solved at 286
      #|0..0..2..4..8..16..28..44..69..100..149..220..309..441..solved at 521
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..19..38..65..106..192..292..436..solved at 553
      #|0..0..2..4..9..18..52..121..210..359..620..solved at 701
      #|0..0..2..4..9..18..52..121..210..359..620..solved at 878
      #|0..0..3..6..12..25..83..212..381..638..1118..1786..2598..solved at 2715
      #|Warning: inventing type variables
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..432..589..787..1065..1365..1753..2218..2731..3327..4085..4879..5831..solved at 6125
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..432..589..787..1063..1361..1745..2206..2715..3307..4060..4849..5795..6839..7919..9094..10526..11984..13723..solved at 14089
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..410..545..699..915..1153..1461..1852..2291..2819..3481..4179..5007..5941..6911..7984..9353..10748..12463..14302..16229..18272..20734..23204..26101..solved at 26928
      #|0..0..1..2..7..13..27..43..69..98..153..212..305..410..545..699..915..1153..1461..1852..2291..2819..3479..4175..4999..5929..6895..7964..9326..10714..12419..14242..16153..18174..20613..23060..25933..29025..32229..35676..39609..43606..48073..solved at 49267
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..3..7..15..33..92..182..286..491..717..1000..1344..solved at 1660
      #|0..0..1..2..3..7..15..33..92..182..286..491..717..1000..1344..solved at 1547
      #|0..0..1..2..7..13..26..42..66..109..184..282..450..645..906..1214..1585..solved at 1922
      #|0..0..1..2..7..13..26..42..66..109..184..282..450..645..906..1214..1585..solved at 1922
      #|0..0..1..2..6..12..25..41..68..113..197..307..500..726..1041..1410..1881..solved at 2329
      #|0..0..1..2..6..12..25..41..68..113..197..307..500..726..1041..1410..1881..solved at 2329
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..1..2..3..7..13..23..41..70..112..191..solved at 250
      #|Warning: inventing type variables
      #|0..0..1..2..7..19..42..78..137..solved at 187
      #|0..0..2..4..14..35..68..solved at 84
      #|0..0..2..4..14..35..68..solved at 104
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..19..42..78..140..solved at 193
      #|0..0..2..4..16..39..78..solved at 101
      #|0..0..2..4..16..39..78..solved at 121
      #|0..0..2..4..12..33..80..solved at 109
      #|0..0..1..2..3..7..28..58..93..156..224..320..452..612..798..1098..1416..1822..2337..2900..3583..solved at 4191
      #|0..0..2..4..12..33..80..solved at 89
      #|0..0..1..2..3..7..28..58..93..156..224..320..452..612..798..1098..1416..1822..2337..2900..3583..solved at 4521
      #|0..0..1..2..9..26..54..solved at 83
      #|0..0..1..2..3..7..20..41..67..110..157..227..331..463..620..867..1133..1468..1887..2352..2941..solved at 3821
      #|0..0..1..2..9..26..54..solved at 63
      #|0..0..1..2..3..7..20..41..67..110..157..227..331..463..620..867..1133..1468..1887..2352..2941..solved at 3463
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..25..solved at 45
      #|0..0..1..2..3..10..solved at 17
      #|0..0..1..2..9..26..53..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..9..26..53..solved at 62
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..67..104..175..273..solved at 350
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..6..12..25..41..67..solved at 102
      #|0..0..1..2..3..7..17..30..46..70..97..140..solved at 190
      #|0..0..1..2..9..26..53..solved at 82
      #|0..0..0..solved at 3
      #|0..0..1..2..9..26..53..solved at 62
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..15..22..29..36..53..70..97..161..232..370..554..815..1134..1579..2071..2741..3531..4571..5783..7374..solved at 8357
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..11..33..69..solved at 111
      #|0..0..1..3..11..33..69..solved at 89
      #|0..0..1..4..13..solved at 18
      #|0..0..1..4..13..solved at 19
      #|0..0..1..4..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..3..11..31..61..114..201..302..473..solved at 633
      #|0..0..1..3..11..31..61..114..201..302..473..solved at 562
      #|0..0..1..4..12..27..55..116..196..solved at 236
      #|0..0..1..4..12..27..55..108..178..solved at 219
      #|0..0..2..6..19..50..101..solved at 143
      #|0..0..2..6..19..50..101..solved at 121
      #|0..0..2..7..21..solved at 26
      #|0..0..2..7..21..solved at 27
      #|0..0..1..2..5..11..19..32..solved at 51
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..6..11..28..59..115..212..391..solved at 471
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 12
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..3..7..solved at 12
      #|0..0..3..7..solved at 14
      #|0..0..3..8..solved at 17
      #|0..0..3..7..solved at 15
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..7..solved at 12
      #|0..0..3..7..solved at 14
      #|0..0..3..8..solved at 17
      #|0..0..2..5..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..10..17..solved at 26
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Unity/mk_state_logic quotations (172):
      #|  (False : (A) -> Bool) == ((s : A) => false)
      #|  (True : (A) -> Bool) == ((s : A) => true)
      #|  (Not : ((A) -> Bool, A) -> Bool)((p : (A) -> Bool)) == ((s : A) => !p(s))
      #|  (op_tilde_star : ((A) -> Bool, A) -> Bool)((p : (A) -> Bool)) == ((s : A) => !p(s))
      #|  (op_slash_bslash_star : ((A) -> Bool, (A) -> Bool, A) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool)) == ((s : A) => p(s) && q(s))
      #|  (op_bslash_slash_star : ((A) -> Bool, (A) -> Bool, A) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool)) == ((s : A) => p(s) || q(s))
      #|  (op_bang_star : ((B, A) -> Bool, A) -> Bool)((P : (B, A) -> Bool)) == ((s : A) => \226\136\128 x : B, P(x, s))
      #|  (op_q_star : ((B, A) -> Bool, A) -> Bool)((P : (B, A) -> Bool)) == ((s : A) => \226\136\131 x : B, P(x, s))
      #|  (op_at_star : ((B, A) -> Bool, A) -> B)((P : (B, A) -> Bool)) == ((s : A) => select((x : B) => P(x, s)))
      #|  (op_eq_eq_gt_star : ((A) -> Bool, (A) -> Bool, A) -> Bool)((p : (A) -> Bool), (q : (A) -> Bool)) == ((s : A) => p(s) \226\134\146 q(s))
      #|  (op_lt_star : ((A) -> Num, (A) -> Num, A) -> Bool)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) < q(s))
      #|  (op_gt_star : ((A) -> Num, (A) -> Num, A) -> Bool)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) > q(s))
      #|  (op_lt_eq_star : ((A) -> Num, (A) -> Num, A) -> Bool)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) <= q(s))
      #|  (op_gt_eq_star : ((A) -> Num, (A) -> Num, A) -> Bool)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) >= q(s))
      #|  (op_eq_star : ((A) -> B, (A) -> B, A) -> Bool)((p : (A) -> B), (q : (A) -> B)) == ((s : A) => p(s) == q(s))
      #|  (op_lt_gt_star : ((A) -> B, (A) -> B, A) -> Bool)((p : (A) -> B), (q : (A) -> B)) == ((s : A) => !(p(s) == q(s)))
      #|  (op_eq_gt_star : ((A) -> Bool, (A) -> B, (A) -> B, A) -> B)((p : (A) -> Bool), (r1 : (A) -> B), (r2 : (A) -> B)) == ((s : A) => if p(s) { r1(s) } else { r2(s) })
      #|  (op_plus_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) + q(s))
      #|  (op_minus_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) - q(s))
      #|  (op_star_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => p(s) * q(s))
      #|  (Suc : ((A) -> Num, A) -> Num)((p : (A) -> Num)) == ((s : A) => SUC(p(s)))
      #|  (Pre : ((A) -> Num, A) -> Num)((p : (A) -> Num)) == ((s : A) => PRE(p(s)))
      #|  (op_pct_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => MOD(p(s), q(s)))
      #|  (op_slash_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => DIV(p(s), q(s)))
      #|  (op_star_star_star : ((A) -> Num, (A) -> Num, A) -> Num)((p : (A) -> Num), (q : (A) -> Num)) == ((s : A) => EXP(p(s), q(s)))
      #|  (Ind : ((A, B) -> C, (A) -> B, A) -> C)((a : (A, B) -> C), (i : (A) -> B)) == ((s : A) => a(s, i(s)))
      #|  (op_bang_lt_eq_star : ((Num, A) -> Bool, Num, A) -> Bool)((P : (Num, A) -> Bool), (m : Num)) == ((s : A) => \226\136\128 i : Num, i <= m \226\134\146 P(i, s))
      #|  (op_q_lt_eq_star : ((Num, A) -> Bool, Num, A) -> Bool)((P : (Num, A) -> Bool), (m : Num)) == ((s : A) => \226\136\131 i : Num, i <= m && P(i, s))
      #|  (op_q_lt_star : ((Num, A) -> Bool, Num, A) -> Bool)((P : (Num, A) -> Bool), (m : Num)) == ((s : A) => \226\136\131 i : Num, i < m && P(i, s))
      #|  (\226\136\128 P : (Num, A) -> Bool, (op_slash_lt_eq_bslash_star : ((Num, A) -> Bool, Num, A) -> Bool)(P, 0) == P(0)) && (\226\136\128 P : (Num, A) -> Bool, op_slash_lt_eq_bslash_star(P, SUC((i : Num))) == op_slash_bslash_star(op_slash_lt_eq_bslash_star(P, i), P(SUC(i))))
      #|  (\226\136\128 P : (Num, A) -> Bool, (op_bslash_lt_eq_slash_star : ((Num, A) -> Bool, Num, A) -> Bool)(P, 0) == P(0)) && (\226\136\128 P : (Num, A) -> Bool, op_bslash_lt_eq_slash_star(P, SUC((i : Num))) == op_bslash_slash_star(op_bslash_lt_eq_slash_star(P, i), P(SUC(i))))
      #|  (\226\136\128 P : (Num, A) -> Bool, (op_slash_lt_bslash_star : ((Num, A) -> Bool, Num, A) -> Bool)(P, 0) == False) && (\226\136\128 P : (Num, A) -> Bool, op_slash_lt_bslash_star(P, SUC((i : Num))) == op_slash_bslash_star(op_slash_lt_bslash_star(P, i), P(i)))
      #|  (\226\136\128 P : (Num, A) -> Bool, (op_bslash_lt_slash_star : ((Num, A) -> Bool, Num, A) -> Bool)(P, 0) == False) && (\226\136\128 P : (Num, A) -> Bool, op_bslash_lt_slash_star(P, SUC((i : Num))) == op_bslash_slash_star(op_bslash_lt_slash_star(P, i), P(i)))
      #|  (s : A)
      #|  (p : (A) -> Bool)
      #|  (q : (A) -> Bool)
      #|  (r : (A) -> Bool)
      #|  (i : Num)
      #|  (P : (Num, A) -> Bool)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 p' : (A) -> Bool, \226\136\128 q' : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(p, q'), op_slash_bslash_star(p', q)), op_slash_bslash_star(q, q'), s) \226\134\146 op_bslash_slash_star(q, q', s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 p' : (A) -> Bool, \226\136\128 q' : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), q'), op_slash_bslash_star(Not(p'), q)), op_slash_bslash_star(q, q'), s) \226\134\146 op_bslash_slash_star(q, q', s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(p), r), op_slash_bslash_star(Not(q), q)), op_slash_bslash_star(q, r), s) \226\134\146 r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 p' : (A) -> Bool, \226\136\128 q' : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 r' : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(Not(op_bslash_slash_star(p, p')), op_bslash_slash_star(p, r')), op_slash_bslash_star(Not(op_bslash_slash_star(q, q')), op_bslash_slash_star(q, r))), op_slash_bslash_star(op_bslash_slash_star(q, r), op_bslash_slash_star(p, r')), s) \226\134\146 op_bslash_slash_star(op_slash_bslash_star(p, q), op_bslash_slash_star(r, r'), s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_slash_bslash_star(p, r), op_bslash_slash_star(op_slash_bslash_star(op_bslash_slash_star(p, q), op_bslash_slash_star(q, r)), r), s) \226\134\146 op_bslash_slash_star(q, r, s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 b : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_slash_bslash_star(r, q), op_bslash_slash_star(op_slash_bslash_star(p, b), op_slash_bslash_star(b, q)), s) \226\134\146 op_bslash_slash_star(op_slash_bslash_star(q, r), b, s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 b : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, op_bslash_slash_star(op_bslash_slash_star(op_slash_bslash_star(r, q), op_slash_bslash_star(op_slash_bslash_star(r, p), b)), op_slash_bslash_star(b, q), s) \226\134\146 op_bslash_slash_star(op_slash_bslash_star(q, r), b, s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, r(s) && q(s) || p(s) \226\134\146 q(s) && r(s) || p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, q(s) && r(s) || p(s) \226\134\146 r(s) && q(s) || p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (r(s) && q(s) || p(s)) == (q(s) && r(s) || p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(op_slash_bslash_star(r, q), p) == op_bslash_slash_star(op_slash_bslash_star(q, r), p)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && (r(s) || q(s)) \226\134\146 p(s) && (q(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && (q(s) || r(s)) \226\134\146 p(s) && (r(s) || q(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) && (r(s) || q(s))) == (p(s) && (q(s) || r(s)))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(p, op_bslash_slash_star(r, q)) == op_slash_bslash_star(p, op_bslash_slash_star(q, r))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (r(s) || q(s)) && p(s) \226\134\146 (q(s) || r(s)) && p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (q(s) || r(s)) && p(s) \226\134\146 (r(s) || q(s)) && p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((r(s) || q(s)) && p(s)) == ((q(s) || r(s)) && p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(op_bslash_slash_star(r, q), p) == op_slash_bslash_star(op_bslash_slash_star(q, r), p)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (r(s) || q(s)) || p(s) \226\134\146 (q(s) || r(s)) || p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (q(s) || r(s)) || p(s) \226\134\146 (r(s) || q(s)) || p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((r(s) || q(s)) || p(s)) == ((q(s) || r(s)) || p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(op_bslash_slash_star(r, q), p) == op_bslash_slash_star(op_bslash_slash_star(q, r), p)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) || r(s) || q(s) \226\134\146 p(s) || q(s) || r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) || q(s) || r(s) \226\134\146 p(s) || r(s) || q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) || r(s) || q(s)) == (p(s) || q(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(p, op_bslash_slash_star(r, q)) == op_bslash_slash_star(p, op_bslash_slash_star(q, r))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (r(s) && q(s)) && p(s) \226\134\146 (q(s) && r(s)) && p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (q(s) && r(s)) && p(s) \226\134\146 (r(s) && q(s)) && p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((r(s) && q(s)) && p(s)) == ((q(s) && r(s)) && p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(op_slash_bslash_star(r, q), p) == op_slash_bslash_star(op_slash_bslash_star(q, r), p)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && r(s) && q(s) \226\134\146 p(s) && q(s) && r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && q(s) && r(s) \226\134\146 p(s) && r(s) && q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) && r(s) && q(s)) == (p(s) && q(s) && r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(p, op_slash_bslash_star(r, q)) == op_slash_bslash_star(p, op_slash_bslash_star(q, r))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) || r(s) && q(s) \226\134\146 p(s) || q(s) && r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) || q(s) && r(s) \226\134\146 p(s) || r(s) && q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) || r(s) && q(s)) == (p(s) || q(s) && r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(p, op_slash_bslash_star(r, q)) == op_bslash_slash_star(p, op_slash_bslash_star(q, r))
      #|  \226\136\128 p : (A) -> Bool, Not(Not(p)) == p
      #|  (q : (A) -> Bool)((s : A))
      #|  (p : (A) -> Bool)((s : A))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) || q(s)) == (q(s) || p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) || q(s)) == (q(s) || p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_bslash_slash_star(p, q) == op_bslash_slash_star(q, p)
      #|  \226\136\128 p : (A) -> Bool, op_bslash_slash_star(p, p) == p
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((p(s) || q(s)) || r(s)) == (p(s) || q(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((p(s) || q(s)) || r(s)) == (p(s) || q(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(op_bslash_slash_star(p, q), r) == op_bslash_slash_star(p, op_bslash_slash_star(q, r))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) && q(s) \226\134\146 q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, op_slash_bslash_star(p, q, s) \226\134\146 q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) && q(s) \226\134\146 p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, op_slash_bslash_star(p, q, s) \226\134\146 p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) \226\134\146 op_bslash_slash_star(p, q, s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) \226\134\146 op_bslash_slash_star(q, p, s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, (\226\136\128 s : A, p(s) \226\134\146 q(s)) \226\134\146 (\226\136\128 s : A, op_slash_bslash_star(p, r, s) \226\134\146 op_slash_bslash_star(q, r, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, (\226\136\128 s : A, p(s) \226\134\146 q(s)) \226\134\146 (\226\136\128 s : A, op_bslash_slash_star(p, r, s) \226\134\146 op_bslash_slash_star(q, r, s))
      #|  \226\136\128 p : (A) -> Bool, op_slash_bslash_star(p, p) == p
      #|  (q : (A) -> Bool)((s : A))
      #|  (p : (A) -> Bool)((s : A))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) && q(s)) == (q(s) && p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) && q(s)) == (q(s) && p(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_slash_bslash_star(p, q) == op_slash_bslash_star(q, p)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((p(s) && q(s)) && r(s)) == (p(s) && q(s) && r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, ((p(s) && q(s)) && r(s)) == (p(s) && q(s) && r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(op_slash_bslash_star(p, q), r) == op_slash_bslash_star(p, op_slash_bslash_star(q, r))
      #|  (Not : ((A) -> Bool, A) -> Bool)((True : (A) -> Bool)) == (False : (A) -> Bool)
      #|  (Not : ((A) -> Bool, A) -> Bool)((False : (A) -> Bool)) == (True : (A) -> Bool)
      #|  \226\136\128 p : (A) -> Bool, op_slash_bslash_star(p, True) == p
      #|  \226\136\128 p : (A) -> Bool, op_bslash_slash_star(p, True) == True
      #|  \226\136\128 p : (A) -> Bool, op_slash_bslash_star(p, False) == False
      #|  \226\136\128 p : (A) -> Bool, op_bslash_slash_star(p, False) == p
      #|  \226\136\128 p : (A) -> Bool, op_bslash_slash_star(p, Not(p)) == True
      #|  \226\136\128 p : (A) -> Bool, op_slash_bslash_star(p, Not(p)) == False
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, p && !q || p && q \226\134\146 p
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, p \226\134\146 p && !q || p && q
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, (p && !q || p && q) == p
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_bslash_slash_star(op_slash_bslash_star(p, Not(q)), op_slash_bslash_star(p, q)) == p
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, (p || q) && !q \226\134\146 p && !q
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, p && !q \226\134\146 (p || q) && !q
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, ((p || q) && !q) == (p && !q)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_slash_bslash_star(op_bslash_slash_star(p, q), Not(q)) == op_slash_bslash_star(p, Not(q))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) && q(s) || q(s) \226\134\146 q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, q(s) \226\134\146 p(s) && q(s) || q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) && q(s) || q(s)) == q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_bslash_slash_star(op_slash_bslash_star(p, q), q) == q
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) || q(s)) && q(s) \226\134\146 q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, q(s) \226\134\146 (p(s) || q(s)) && q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, ((p(s) || q(s)) && q(s)) == q(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_slash_bslash_star(op_bslash_slash_star(p, q), q) == q
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, Not(op_bslash_slash_star(p, q)) == op_slash_bslash_star(Not(p), Not(q))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, Not(op_slash_bslash_star(p, q)) == op_bslash_slash_star(Not(p), Not(q))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, Not(p, s) \226\134\146 q(s)) == (\226\136\128 s : A, op_bslash_slash_star(p, q, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, p(s) \226\134\146 q(s)) == (\226\136\128 s : A, op_bslash_slash_star(Not(p), q, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, op_bslash_slash_star(p, q, s)) == (\226\136\128 s : A, Not(p, s) \226\134\146 q(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, op_bslash_slash_star(Not(p), q, s)) == (\226\136\128 s : A, p(s) \226\134\146 q(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) || q(s) && r(s) \226\134\146 (p(s) || q(s)) && (p(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) || q(s)) && (p(s) || r(s)) \226\134\146 p(s) || q(s) && r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) || q(s) && r(s)) == ((p(s) || q(s)) && (p(s) || r(s)))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_bslash_slash_star(p, op_slash_bslash_star(q, r)) == op_slash_bslash_star(op_bslash_slash_star(p, q), op_bslash_slash_star(p, r))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && (q(s) || r(s)) \226\134\146 p(s) && q(s) || p(s) && r(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, p(s) && q(s) || p(s) && r(s) \226\134\146 p(s) && (q(s) || r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, \226\136\128 s : A, (p(s) && (q(s) || r(s))) == (p(s) && q(s) || p(s) && r(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 r : (A) -> Bool, op_slash_bslash_star(p, op_bslash_slash_star(q, r)) == op_bslash_slash_star(op_slash_bslash_star(p, q), op_slash_bslash_star(p, r))
      #|  \226\136\128 p : (A) -> Bool, (\226\136\128 s : A, Not(p, s)) \226\134\146 (\226\136\128 s : A, p(s) == False(s))
      #|  ((s : A) => (p : (A) -> Bool)(s)) == ((s : A) => False(s))
      #|  \226\136\128 p : (A) -> Bool, (\226\136\128 s : A, Not(p, s)) \226\134\146 p == False
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, Not(op_slash_bslash_star(p, q), s)) == (\226\136\128 s : A, p(s) \226\134\146 Not(q, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, Not(op_slash_bslash_star(p, q), s)) \226\134\146 (\226\136\128 s : A, p(s) \226\134\146 Not(q, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, Not(op_slash_bslash_star(p, q), s)) \226\134\146 (\226\136\128 s : A, q(s) \226\134\146 Not(p, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) && (p(s) || q(s)) \226\134\146 p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) \226\134\146 p(s) && (p(s) || q(s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, (p(s) && (p(s) || q(s))) == p(s)
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, ((s : A) => p(s) && (p(s) || q(s))) == p
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_slash_bslash_star(p, op_bslash_slash_star(p, q)) == p
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, op_slash_bslash_star(p, op_bslash_slash_star(q, p)) == op_slash_bslash_star(p, op_bslash_slash_star(p, q))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, (\226\136\128 s : A, p(s)) \226\134\146 (\226\136\128 s : A, op_bslash_slash_star(p, q, s))
      #|  \226\136\128 p : (A) -> Bool, \226\136\128 q : (A) -> Bool, \226\136\128 s : A, p(s) \226\134\146 op_bslash_slash_star(p, q, s)
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 i : Num, \226\136\128 s : A, (\226\136\128 i : Num, P(i, s)) == (P(i, s) && (\226\136\128 i : Num, P(i, s)))
      #|  (i : Num)
      #|  (i : Num)
      #|  (i' : Num)
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 i : Num, \226\136\128 s : A, (\226\136\131 i : Num, P(i, s)) == (P(i, s) || (\226\136\131 i : Num, P(i, s)))
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 i : Num, op_q_star(P) == op_bslash_slash_star(P(i), op_q_star(P))
      #|  SUC((i : Num))
      #|  0
      #|  (P : (Num, A) -> Bool)((i : Num), (s : A))
      #|  SUC((i : Num))
      #|  (i' : Num)
      #|  0
      #|  op_bslash_lt_eq_slash_star((P : (Num, A) -> Bool), (i : Num), (s : A))
      #|  \226\136\128 P : (Num, A) -> Bool, \226\136\128 s : A, (\226\136\131 i : Num, op_bslash_lt_eq_slash_star(P, i, s)) == (\226\136\131 i : Num, P(i, s))
      #|  \226\136\128 P : (Num, A) -> Bool, ((s : A) => \226\136\131 i : Num, op_bslash_lt_eq_slash_star(P, i, s)) == op_q_star(P)
      #|FALSE_def =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #False:fun('A,bool)) (\s:'A. #F:bool))
      #|TRUE_def =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #True:fun('A,bool)) (\s:'A. #T:bool))
      #|NOT_def1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) (\s:'A. (#~:fun(bool,bool) (p:fun('A,bool) s:'A))))))
      #|NOT_def2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#~*:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) (\s:'A. (#~:fun(bool,bool) (p:fun('A,bool) s:'A))))))
      #|AND_def =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) (\s:'A. ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))
      #|OR_def =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) (\s:'A. ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))
      #|FORALL_def =  |- (#forall:fun(fun(fun('B,fun('A,bool)),bool),bool) (\P:fun('B,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#!*:fun(fun('B,fun('A,bool)),fun('A,bool)) P:fun('B,fun('A,bool)))) (\s:'A. (#forall:fun(fun('B,bool),bool) (\x:'B. ((P:fun('B,fun('A,bool)) x:'B) s:'A)))))))
      #|EXISTS_def =  |- (#forall:fun(fun(fun('B,fun('A,bool)),bool),bool) (\P:fun('B,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#?*:fun(fun('B,fun('A,bool)),fun('A,bool)) P:fun('B,fun('A,bool)))) (\s:'A. (#?:fun(fun('B,bool),bool) (\x:'B. ((P:fun('B,fun('A,bool)) x:'B) s:'A)))))))
      #|CHOICE_def =  |- (#forall:fun(fun(fun('B,fun('A,bool)),bool),bool) (\P:fun('B,fun('A,bool)). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (#@*:fun(fun('B,fun('A,bool)),fun('A,'B)) P:fun('B,fun('A,bool)))) (\s:'A. (#@:fun(fun('B,bool),'B) (\x:'B. ((P:fun('B,fun('A,bool)) x:'B) s:'A)))))))
      #|IMPLIES_def =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#==>*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))
      #|LESS_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#<*:fun(fun('A,num),fun(fun('A,num),fun('A,bool))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#<:fun(num,fun(num,bool)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|GREATER_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#>*:fun(fun('A,num),fun(fun('A,num),fun('A,bool))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#>:fun(num,fun(num,bool)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|LESS_EQ_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#<=*:fun(fun('A,num),fun(fun('A,num),fun('A,bool))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#<=:fun(num,fun(num,bool)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|GREATER_EQ_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#>=*:fun(fun('A,num),fun(fun('A,num),fun('A,bool))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#>=:fun(num,fun(num,bool)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|EQ_def =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\p:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\q:fun('A,'B). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#=*:fun(fun('A,'B),fun(fun('A,'B),fun('A,bool))) p:fun('A,'B)) q:fun('A,'B))) (\s:'A. ((#=:fun('B,fun('B,bool)) (p:fun('A,'B) s:'A)) (q:fun('A,'B) s:'A))))))))
      #|NEQ_def =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\p:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\q:fun('A,'B). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#<>*:fun(fun('A,'B),fun(fun('A,'B),fun('A,bool))) p:fun('A,'B)) q:fun('A,'B))) (\s:'A. (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (p:fun('A,'B) s:'A)) (q:fun('A,'B) s:'A)))))))))
      #|GE_def =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\r1:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\r2:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (((#=>*:fun(fun('A,bool),fun(fun('A,'B),fun(fun('A,'B),fun('A,'B)))) p:fun('A,bool)) r1:fun('A,'B)) r2:fun('A,'B))) (\s:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) (p:fun('A,bool) s:'A)) (r1:fun('A,'B) s:'A)) (r2:fun('A,'B) s:'A))))))))))
      #|PLUS_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#+*:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#+:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|SUB_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#-*:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#-:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|MUL_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#**:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#*:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|SUC_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) (#Suc:fun(fun('A,num),fun('A,num)) p:fun('A,num))) (\s:'A. (#SUC:fun(num,num) (p:fun('A,num) s:'A))))))
      #|PRE_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) (#Pre:fun(fun('A,num),fun('A,num)) p:fun('A,num))) (\s:'A. (#PRE:fun(num,num) (p:fun('A,num) s:'A))))))
      #|MOD_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#%*:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#MOD:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|DIV_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#/*:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#DIV:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|EXP_def =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\p:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\q:fun('A,num). ((#=:fun(fun('A,num),fun(fun('A,num),bool)) ((#***:fun(fun('A,num),fun(fun('A,num),fun('A,num))) p:fun('A,num)) q:fun('A,num))) (\s:'A. ((#EXP:fun(num,fun(num,num)) (p:fun('A,num) s:'A)) (q:fun('A,num) s:'A))))))))
      #|IND_def =  |- (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\a:fun('A,fun('B,'C)). (#forall:fun(fun(fun('A,'B),bool),bool) (\i:fun('A,'B). ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) ((#Ind:fun(fun('A,fun('B,'C)),fun(fun('A,'B),fun('A,'C))) a:fun('A,fun('B,'C))) i:fun('A,'B))) (\s:'A. ((a:fun('A,fun('B,'C)) s:'A) (i:fun('A,'B) s:'A))))))))
      #|FORALL_LE_def =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#!<=*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) m:num)) (\s:'A. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) m:num)) ((P:fun(num,fun('A,bool)) i:num) s:'A))))))))))
      #|EXISTS_LE_def =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#?<=*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) m:num)) (\s:'A. (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) m:num)) ((P:fun(num,fun('A,bool)) i:num) s:'A))))))))))
      #|EXISTS_LT_def =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#?<*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) m:num)) (\s:'A. (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) m:num)) ((P:fun(num,fun('A,bool)) i:num) s:'A))))))))))
      #|AND_LE_N_def =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/<=\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) (P:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/<=\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#SUC:fun(num,num) i:num))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/<=\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num)) (P:fun(num,fun('A,bool)) (#SUC:fun(num,num) i:num)))))))
      #|OR_LE_N_def =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\<=/*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) (P:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\<=/*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#SUC:fun(num,num) i:num))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\<=/*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num)) (P:fun(num,fun('A,bool)) (#SUC:fun(num,num) i:num)))))))
      #|AND_LT_N_def =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/<\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) #False:fun('A,bool))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/<\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#SUC:fun(num,num) i:num))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/<\*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num)) (P:fun(num,fun('A,bool)) i:num))))))
      #|OR_LT_N_def =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\</*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) #False:fun('A,bool))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\</*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) (#SUC:fun(num,num) i:num))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\</*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num)) (P:fun(num,fun('A,bool)) i:num))))))
      #|IMPLY_WEAK_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\p':fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q':fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q':fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p':fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) q':fun('A,bool))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) q':fun('A,bool)) s:'A))))))))))))
      #|IMPLY_WEAK_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\p':fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q':fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) q':fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p':fun('A,bool))) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) q':fun('A,bool))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) q':fun('A,bool)) s:'A))))))))))))
      #|IMPLY_WEAK_lemma3 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) r:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool))) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) s:'A)) (r:fun('A,bool) s:'A))))))))))
      #|IMPLY_WEAK_lemma4 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\p':fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q':fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r':fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) p':fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r':fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) q':fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r':fun('A,bool)))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) r':fun('A,bool))) s:'A))))))))))))))))
      #|IMPLY_WEAK_lemma5 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)))) r:fun('A,bool))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)) s:'A))))))))))
      #|IMPLY_WEAK_lemma6 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) b:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) b:fun('A,bool)) q:fun('A,bool)))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) b:fun('A,bool)) s:'A))))))))))))
      #|IMPLY_WEAK_lemma7 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) p:fun('A,bool))) b:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) b:fun('A,bool)) q:fun('A,bool))) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) b:fun('A,bool)) s:'A))))))))))))
      #|CONJ_COMM_DISJ_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|CONJ_COMM_DISJ_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|CONJ_COMM_DISJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|AND_COMM_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) p:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) p:fun('A,bool)))))))))
      #|CONJ_DISJ_COMM_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|CONJ_DISJ_COMM_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))))))
      #|CONJ_DISJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|AND_OR_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|DISJ_COMM_CONJ_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|DISJ_COMM_CONJ_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|DISJ_COMM_CONJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|OR_COMM_AND_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) p:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) p:fun('A,bool)))))))))
      #|DISJ_COMM_DISJ_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|DISJ_COMM_DISJ_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|DISJ_COMM_DISJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|OR_COMM_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) p:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) p:fun('A,bool)))))))))
      #|DISJ_DISJ_COMM_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|DISJ_DISJ_COMM_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))))))
      #|DISJ_DISJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|OR_OR_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|CONJ_COMM_CONJ_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|CONJ_COMM_CONJ_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|CONJ_COMM_CONJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A)))))))))))
      #|AND_COMM_AND_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool))) p:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))) p:fun('A,bool)))))))))
      #|CONJ_CONJ_COMM_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|CONJ_CONJ_COMM_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))))))
      #|CONJ_CONJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|AND_AND_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|DISJ_CONJ_COMM_lemma_a =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|DISJ_CONJ_COMM_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))))))
      #|DISJ_CONJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (r:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|OR_AND_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) r:fun('A,bool)) q:fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|NOT_NOT_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)))) p:fun('A,bool))))
      #|DISJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (p:fun('A,bool) s:'A)))))))))
      #|OR_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)))))))
      #|OR_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) p:fun('A,bool))) p:fun('A,bool))))
      #|DISJ_ASSOC_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (r:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|OR_ASSOC_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) r:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|CONJ_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))))))))
      #|AND_IMPLY_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A)) (q:fun('A,bool) s:'A))))))))
      #|SYM_CONJ_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (p:fun('A,bool) s:'A))))))))
      #|SYM_AND_IMPLY_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A)) (p:fun('A,bool) s:'A))))))))
      #|OR_IMPLY_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A))))))))
      #|SYM_OR_IMPLY_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)) s:'A))))))))
      #|IMPLY_WEAK_AND_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool)) s:'A)) (((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)) s:'A)))))))))))
      #|IMPLY_WEAK_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool)) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)) s:'A)))))))))))
      #|AND_AND_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) p:fun('A,bool))) p:fun('A,bool))))
      #|CONJ_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (p:fun('A,bool) s:'A)))))))))
      #|AND_COMM_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)))))))
      #|CONJ_ASSOC_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (r:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|AND_ASSOC_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) r:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))))))))
      #|NOT_True_lemma =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) #True:fun('A,bool))) #False:fun('A,bool))
      #|NOT_False_lemma =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) #False:fun('A,bool))) #True:fun('A,bool))
      #|AND_True_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) #True:fun('A,bool))) p:fun('A,bool))))
      #|OR_True_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) #True:fun('A,bool))) #True:fun('A,bool))))
      #|AND_False_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) #False:fun('A,bool))) #False:fun('A,bool))))
      #|OR_False_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) #False:fun('A,bool))) p:fun('A,bool))))
      #|P_OR_NOT_P_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)))) #True:fun('A,bool))))
      #|P_AND_NOT_P_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)))) #False:fun('A,bool))))
      #|CONJ_COMPL_DISJ_lemma1 =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool))) p:bool)))))
      #|CONJ_COMPL_DISJ_lemma2 =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)))))))
      #|CONJ_COMPL_DISJ_lemma =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool))) p:bool)))))
      #|AND_COMPL_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) p:fun('A,bool))))))
      #|DISJ_NOT_CONJ_lemma1 =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool)))))))
      #|DISJ_NOT_CONJ_lemma2 =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) (#~:fun(bool,bool) q:bool)))))))
      #|DISJ_NOT_CONJ_lemma =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool)))))))
      #|OR_NOT_AND_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool))))))))
      #|P_CONJ_Q_DISJ_Q_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))))))))
      #|P_CONJ_Q_DISJ_Q_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A)))))))))
      #|P_CONJ_Q_DISJ_Q_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))))))))
      #|P_AND_Q_OR_Q_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) q:fun('A,bool))) q:fun('A,bool))))))
      #|P_DISJ_Q_CONJ_Q_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))))))))
      #|P_DISJ_Q_CONJ_Q_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A)))))))))
      #|P_DISJ_Q_CONJ_Q_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))) (q:fun('A,bool) s:'A))))))))
      #|P_OR_Q_AND_Q_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) q:fun('A,bool))) q:fun('A,bool))))))
      #|NOT_OR_AND_NOT_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool))))))))
      #|NOT_AND_OR_NOT_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Not:fun(fun('A,bool),fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool))))))))
      #|NOT_IMPLY_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)) s:'A)) (q:fun('A,bool) s:'A))))) (#forall:fun(fun('A,bool),bool) (\s:'A. (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A))))))))
      #|IMPLY_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))) (#forall:fun(fun('A,bool),bool) (\s:'A. (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) q:fun('A,bool)) s:'A))))))))
      #|OR_IMPLY_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)) s:'A)) (q:fun('A,bool) s:'A)))))))))
      #|NOT_OR_IMPLY_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) q:fun('A,bool)) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))))))))
      #|DISJ_CONJ_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|DISJ_CONJ_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|DISJ_CONJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|OR_AND_DISTR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool))))))))))
      #|CONJ_DISJ_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|CONJ_DISJ_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|CONJ_DISJ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (r:fun('A,bool) s:'A))))))))))))
      #|AND_OR_DISTR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\r:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool))))))))))
      #|NOT_IMPLIES_False_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (#False:fun('A,bool) s:'A)))))))
      #|NOT_P_IMPLIES_P_EQ_False_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)) s:'A)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) p:fun('A,bool)) #False:fun('A,bool)))))
      #|NOT_AND_IMPLIES_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#Not:fun(fun('A,bool),fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool)) s:'A)))))))))
      #|NOT_AND_IMPLIES_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#Not:fun(fun('A,bool),fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#Not:fun(fun('A,bool),fun('A,bool)) q:fun('A,bool)) s:'A)))))))))
      #|NOT_AND_IMPLIES_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#Not:fun(fun('A,bool),fun('A,bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (q:fun('A,bool) s:'A)) ((#Not:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool)) s:'A)))))))))
      #|CONJ_DISJ_IMPLY_lemma1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) (p:fun('A,bool) s:'A))))))))
      #|CONJ_DISJ_IMPLY_lemma2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))))))))
      #|CONJ_DISJ_IMPLY_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A)))) (p:fun('A,bool) s:'A))))))))
      #|CONJ_DISJ_ABS_IMPLY_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (\s:'A. ((#/\:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) ((#\/:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (q:fun('A,bool) s:'A))))) p:fun('A,bool))))))
      #|AND_OR_EQ_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) p:fun('A,bool))))))
      #|AND_OR_EQ_AND_COMM_OR_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)))) ((#/\*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))))))))
      #|IMPLY_WEAK_lemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. (p:fun('A,bool) s:'A)))) (#forall:fun(fun('A,bool),bool) (\s:'A. (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A))))))))
      #|IMPLY_WEAK_lemma_b =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\q:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (p:fun('A,bool) s:'A)) (((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)) s:'A))))))))
      #|ALL_AND_lemma1 =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun('A,bool)) i:num) s:'A)))) ((#/\:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) i:num) s:'A)) (#forall:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun('A,bool)) i:num) s:'A)))))))))))
      #|ALL_OR_lemma1 =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun('A,bool)) i:num) s:'A)))) ((#\/:fun(bool,fun(bool,bool)) ((P:fun(num,fun('A,bool)) i:num) s:'A)) (#?:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun('A,bool)) i:num) s:'A)))))))))))
      #|ALL_OR_lemma =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#?*:fun(fun(num,fun('A,bool)),fun('A,bool)) P:fun(num,fun('A,bool)))) ((#\/*:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (P:fun(num,fun('A,bool)) i:num)) (#?*:fun(fun(num,fun('A,bool)),fun('A,bool)) P:fun(num,fun('A,bool)))))))))
      #|ALL_i_OR_lemma1 =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\s:'A. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\i:num. (((#\<=/*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num) s:'A)))) (#?:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun('A,bool)) i:num) s:'A))))))))
      #|ALL_i_OR_lemma =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (\s:'A. (#?:fun(fun(num,bool),bool) (\i:num. (((#\<=/*:fun(fun(num,fun('A,bool)),fun(num,fun('A,bool))) P:fun(num,fun('A,bool))) i:num) s:'A))))) (#?*:fun(fun(num,fun('A,bool)),fun('A,bool)) P:fun(num,fun('A,bool))))))
      #|types = tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = \</* /<\* \<=/* /<=\* ?<* ?<=* !<=* Ind *** /* %* Pre Suc ** -* +* =>* <>* =* >=* <=* >* <* ==>* @* ?* !* \/* /\* ~* Not True False superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 296
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _114432:bool
      #|
    ),
  )
}
