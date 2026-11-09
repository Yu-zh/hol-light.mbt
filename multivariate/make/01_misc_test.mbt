// Multivariate/misc.ml in its directory's load order: the test block of
// multivariate/misc/misc_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Multivariate_misc_ref.expected).

///|
test "Multivariate/misc matches Multivariate/misc.ml" {
  @testkit.release_output()
  @misc.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/wo", "Library/card", "Library/floor", "Multivariate/misc",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Multivariate/misc")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("FORALL_DIFF", () => sthm(@misc.forall_diff()))
  log.attempt("EXISTS_DIFF", () => sthm(@misc.exists_diff()))
  log.attempt("FORALL_DIFF_ALT", () => sthm(@misc.forall_diff_alt()))
  log.attempt("FORALL_DIFF_GEN", () => sthm(@misc.forall_diff_gen()))
  log.attempt("GE_REFL", () => sthm(@misc.ge_refl()))
  log.attempt("FORALL_SUC", () => sthm(@misc.forall_suc()))
  log.attempt("SEQ_MONO_LEMMA", () => sthm(@misc.seq_mono_lemma()))
  log.attempt("REAL_HALF", () => sthm(@misc.real_half()))
  log.attempt("ABS_SQUARE_LT_1", () => sthm(@misc.abs_square_lt_1()))
  log.attempt("ABS_SQUARE_LE_1", () => sthm(@misc.abs_square_le_1()))
  log.attempt("ABS_SQUARE_EQ_1", () => sthm(@misc.abs_square_eq_1()))
  log.attempt("UPPER_BOUND_FINITE_SET", () => {
    sthm(@misc.upper_bound_finite_set())
  })
  log.attempt("UPPER_BOUND_FINITE_SET_REAL", () => {
    sthm(@misc.upper_bound_finite_set_real())
  })
  log.attempt("LOWER_BOUND_FINITE_SET", () => {
    sthm(@misc.lower_bound_finite_set())
  })
  log.attempt("LOWER_BOUND_FINITE_SET_REAL", () => {
    sthm(@misc.lower_bound_finite_set_real())
  })
  log.attempt("REAL_CONVEX_SUM_BOUND_LE", () => {
    sthm(@misc.real_convex_sum_bound_le())
  })
  log.attempt("REAL_CONVEX_SUM_BOUND_LT", () => {
    sthm(@misc.real_convex_sum_bound_lt())
  })
  log.attempt("APPROACHABLE_LT_LE", () => sthm(@misc.approachable_lt_le()))
  log.attempt("REAL_LE_BETWEEN", () => sthm(@misc.real_le_between()))
  log.attempt("REAL_LET_BETWEEN", () => sthm(@misc.real_let_between()))
  log.attempt("REAL_LTE_BETWEEN", () => sthm(@misc.real_lte_between()))
  log.attempt("REAL_LT_BETWEEN", () => sthm(@misc.real_lt_between()))
  log.attempt("REAL_LT_BETWEEN_GEN", () => sthm(@misc.real_lt_between_gen()))
  log.attempt("TRIANGLE_LEMMA", () => sthm(@misc.triangle_lemma()))
  log.attempt("LAMBDA_SKOLEM", () => sthm(@misc.lambda_skolem()))
  log.attempt("EPSILON_DELTA_MINIMAL", () => sthm(@misc.epsilon_delta_minimal()))
  log.attempt("HAS_SIZE_1_EXISTS", () => sthm(@misc.has_size_1_exists()))
  log.attempt("LINEAR_EQUATIONS_1_EQ", () => sthm(@misc.linear_equations_1_eq()))
  log.attempt("LINEAR_EQUATIONS_2_EQ", () => sthm(@misc.linear_equations_2_eq()))
  log.attempt("is_realinterval", () => sthm(@misc.is_realinterval()))
  log.attempt("IS_REALINTERVAL_EMPTY", () => sthm(@misc.is_realinterval_empty()))
  log.attempt("IS_REALINTERVAL_UNION", () => sthm(@misc.is_realinterval_union()))
  log.attempt("IS_REALINTERVAL_UNIV", () => sthm(@misc.is_realinterval_univ()))
  log.attempt("IS_REALINTERVAL_INTER", () => sthm(@misc.is_realinterval_inter()))
  log.attempt("open_real_interval", () => sthm(@misc.open_real_interval()))
  log.attempt("closed_real_interval", () => sthm(@misc.closed_real_interval()))
  log.attempt("real_interval", () => sthm(@misc.real_interval()))
  log.attempt("IN_REAL_INTERVAL", () => sthm(@misc.in_real_interval()))
  log.attempt("EMPTY_AS_REAL_INTERVAL", () => {
    sthm(@misc.empty_as_real_interval())
  })
  log.attempt("REAL_INTERVAL_OPEN_SUBSET_CLOSED", () => {
    sthm(@misc.real_interval_open_subset_closed())
  })
  log.attempt("REAL_INTERVAL_EQ_EMPTY", () => {
    sthm(@misc.real_interval_eq_empty())
  })
  log.attempt("REAL_INTERVAL_NE_EMPTY", () => {
    sthm(@misc.real_interval_ne_empty())
  })
  log.attempt("REAL_INTERVAL_SING", () => sthm(@misc.real_interval_sing()))
  log.attempt("ENDS_IN_REAL_INTERVAL", () => sthm(@misc.ends_in_real_interval()))
  log.attempt("IN_REAL_INTERVAL_REFLECT", () => {
    sthm(@misc.in_real_interval_reflect())
  })
  log.attempt("REFLECT_REAL_INTERVAL", () => sthm(@misc.reflect_real_interval()))
  log.attempt("IS_REALINTERVAL_INTERVAL", () => {
    sthm(@misc.is_realinterval_interval())
  })
  log.attempt("ENDS_IN_UNIT_REAL_INTERVAL", () => {
    sthm(@misc.ends_in_unit_real_interval())
  })
  log.attempt("INTER_REAL_INTERVAL", () => sthm(@misc.inter_real_interval()))
  log.attempt("REAL_OPEN_CLOSED_INTERVAL", () => {
    sthm(@misc.real_open_closed_interval())
  })
  log.attempt("REAL_CLOSED_OPEN_INTERVAL", () => {
    sthm(@misc.real_closed_open_interval())
  })
  log.attempt("IS_REALINTERVAL_SING", () => sthm(@misc.is_realinterval_sing()))
  log.attempt("IS_REALINTERVAL_CONTAINS_INTERVAL", () => {
    sthm(@misc.is_realinterval_contains_interval())
  })
  log.attempt("IS_REALINTERVAL_SHRINK", () => {
    sthm(@misc.is_realinterval_shrink())
  })
  log.attempt("SUBSET_REAL_INTERVAL", () => sthm(@misc.subset_real_interval()))
  log.attempt("vectorize", () => sthm(@misc.vectorize()))
  log.attempt("matrify", () => sthm(@misc.matrify()))
  log.attempt("VECTORIZE_COMPONENT", () => sthm(@misc.vectorize_component()))
  log.attempt("MATRIFY_COMPONENT", () => sthm(@misc.matrify_component()))
  log.attempt("VECTORIZE_MATRIFY", () => sthm(@misc.vectorize_matrify()))
  log.attempt("MATRIFY_VECTORIZE", () => sthm(@misc.matrify_vectorize()))
  log.attempt("FORALL_VECTORIZE", () => sthm(@misc.forall_vectorize()))
  log.attempt("FORALL_MATRIFY", () => sthm(@misc.forall_matrify()))
  log.attempt("EXISTS_VECTORIZE", () => sthm(@misc.exists_vectorize()))
  log.attempt("EXISTS_MATRIFY", () => sthm(@misc.exists_matrify()))
  log.attempt("VECTORIZE_GSPEC", () => sthm(@misc.vectorize_gspec()))
  log.attempt("VECTORIZE_EQ", () => sthm(@misc.vectorize_eq()))
  log.attempt("MATRIFY_EQ", () => sthm(@misc.matrify_eq()))
  log.attempt("hull", () => sthm(@misc.hull()))
  log.attempt("HULL_P", () => sthm(@misc.hull_p()))
  log.attempt("P_HULL", () => sthm(@misc.p_hull()))
  log.attempt("HULL_EQ", () => sthm(@misc.hull_eq()))
  log.attempt("HULL_HULL", () => sthm(@misc.hull_hull()))
  log.attempt("HULL_SUBSET", () => sthm(@misc.hull_subset()))
  log.attempt("HULL_MONO", () => sthm(@misc.hull_mono()))
  log.attempt("HULL_ANTIMONO", () => sthm(@misc.hull_antimono()))
  log.attempt("HULL_UNIV", () => sthm(@misc.hull_univ()))
  log.attempt("HULL_MINIMAL", () => sthm(@misc.hull_minimal()))
  log.attempt("SUBSET_HULL", () => sthm(@misc.subset_hull()))
  log.attempt("HULL_UNIQUE", () => sthm(@misc.hull_unique()))
  log.attempt("HULL_UNION_SUBSET", () => sthm(@misc.hull_union_subset()))
  log.attempt("HULL_UNION", () => sthm(@misc.hull_union()))
  log.attempt("HULL_UNION_LEFT", () => sthm(@misc.hull_union_left()))
  log.attempt("HULL_UNION_RIGHT", () => sthm(@misc.hull_union_right()))
  log.attempt("HULL_INSERT", () => sthm(@misc.hull_insert()))
  log.attempt("HULL_REDUNDANT_EQ", () => sthm(@misc.hull_redundant_eq()))
  log.attempt("HULL_REDUNDANT", () => sthm(@misc.hull_redundant()))
  log.attempt("HULL_INDUCT", () => sthm(@misc.hull_induct()))
  log.attempt("HULL_INC", () => sthm(@misc.hull_inc()))
  log.attempt("HULL_IMAGE_SUBSET", () => sthm(@misc.hull_image_subset()))
  log.attempt("HULL_IMAGE_GALOIS", () => sthm(@misc.hull_image_galois()))
  log.attempt("HULL_IMAGE", () => sthm(@misc.hull_image()))
  log.attempt("IS_HULL", () => sthm(@misc.is_hull()))
  log.attempt("HULLS_EQ", () => sthm(@misc.hulls_eq()))
  log.attempt("HULL_P_AND_Q", () => sthm(@misc.hull_p_and_q()))
  log.attempt("HULL_UNIONS_SUBSET", () => sthm(@misc.hull_unions_subset()))
  log.attempt("HULL_INTERS_SUBSET", () => sthm(@misc.hull_inters_subset()))
  log.attempt("HULL_INTER_SUBSET", () => sthm(@misc.hull_inter_subset()))
  log.attempt("FORALL_POS_MONO", () => sthm(@misc.forall_pos_mono()))
  log.attempt("FORALL_POS_MONO_1", () => sthm(@misc.forall_pos_mono_1()))
  log.attempt("FORALL_POS_MONO_EQ", () => sthm(@misc.forall_pos_mono_eq()))
  log.attempt("FORALL_POS_MONO_1_EQ", () => sthm(@misc.forall_pos_mono_1_eq()))
  log.attempt("REAL_ARCH_RDIV_EQ_0", () => sthm(@misc.real_arch_rdiv_eq_0()))
  log.attempt("FINITE_INDEX_NUMSEG_SPECIAL", () => {
    sthm(@misc.finite_index_numseg_special())
  })
  log.attempt("SUM_GP_BASIC", () => sthm(@misc.sum_gp_basic()))
  log.attempt("SUM_GP_MULTIPLIED", () => sthm(@misc.sum_gp_multiplied()))
  log.attempt("SUM_GP", () => sthm(@misc.sum_gp()))
  log.attempt("SUM_GP_OFFSET", () => sthm(@misc.sum_gp_offset()))
  log.attempt("from", () => sthm(@misc.from()))
  log.attempt("FROM_0", () => sthm(@misc.from_0()))
  log.attempt("IN_FROM", () => sthm(@misc.in_from()))
  log.attempt("FROM_MONO", () => sthm(@misc.from_mono()))
  log.attempt("FROM_INTER_NUMSEG_GEN", () => sthm(@misc.from_inter_numseg_gen()))
  log.attempt("FROM_INTER_NUMSEG_MAX", () => sthm(@misc.from_inter_numseg_max()))
  log.attempt("FROM_INTER_NUMSEG", () => sthm(@misc.from_inter_numseg()))
  log.attempt("INFINITE_FROM", () => sthm(@misc.infinite_from()))
  log.attempt("FINITE_INTER_NUMSEG", () => sthm(@misc.finite_inter_numseg()))
  log.attempt("FROM_NONEMPTY", () => sthm(@misc.from_nonempty()))
  log.attempt("SUBSEQUENCE_STEPWISE", () => sthm(@misc.subsequence_stepwise()))
  log.attempt("SUBSEQUENCE_IMP_INJECTIVE", () => {
    sthm(@misc.subsequence_imp_injective())
  })
  log.attempt("MONOTONE_BIGGER", () => sthm(@misc.monotone_bigger()))
  log.attempt("INFINITE_ENUMERATE_WEAK", () => {
    sthm(@misc.infinite_enumerate_weak())
  })
  log.attempt("INFINITE_ENUMERATE_EQ_ALT", () => {
    sthm(@misc.infinite_enumerate_eq_alt())
  })
  log.attempt("MONOTONE_SUBSEQUENCE", () => sthm(@misc.monotone_subsequence()))
  log.attempt("CONVERGENT_BOUNDED_INCREASING", () => {
    sthm(@misc.convergent_bounded_increasing())
  })
  log.attempt("CONVERGENT_BOUNDED_MONOTONE", () => {
    sthm(@misc.convergent_bounded_monotone())
  })
  log.attempt("STRICTLY_INCREASING_ALT", () => {
    sthm(@misc.strictly_increasing_alt())
  })
  log.attempt("STRICTLY_DECREASING_ALT", () => {
    sthm(@misc.strictly_decreasing_alt())
  })
  log.attempt("REAL_NON_MONOTONE", () => sthm(@misc.real_non_monotone()))
  log.attempt("SUBSEQUENCE_DIAGONALIZATION_LEMMA", () => {
    sthm(@misc.subsequence_diagonalization_lemma())
  })
  log.attempt("COUNTABLE_INTEGER", () => sthm(@misc.countable_integer()))
  log.attempt("CARD_EQ_INTEGER", () => sthm(@misc.card_eq_integer()))
  log.attempt("COUNTABLE_RATIONAL", () => sthm(@misc.countable_rational()))
  log.attempt("CARD_EQ_RATIONAL", () => sthm(@misc.card_eq_rational()))
  log.attempt("COUNTABLE_INTEGER_COORDINATES", () => {
    sthm(@misc.countable_integer_coordinates())
  })
  log.attempt("COUNTABLE_RATIONAL_COORDINATES", () => {
    sthm(@misc.countable_rational_coordinates())
  })
  log.attempt("IRRATIONAL_APPROXIMATION", () => {
    sthm(@misc.irrational_approximation())
  })
  log.attempt("IRRATIONAL_BETWEEN", () => sthm(@misc.irrational_between()))
  log.attempt("IRRATIONAL_BETWEEN_EQ", () => sthm(@misc.irrational_between_eq()))
  log.attempt("IRRATIONAL_APPROXIMATION_STRADDLE", () => {
    sthm(@misc.irrational_approximation_straddle())
  })
  log.attempt("IRRATIONAL_APPROXIMATION_ABOVE", () => {
    sthm(@misc.irrational_approximation_above())
  })
  log.attempt("IRRATIONAL_APPROXIMATION_BELOW", () => {
    sthm(@misc.irrational_approximation_below())
  })
  log.attempt("INFINITE_IRRATIONAL_IN_RANGE", () => {
    sthm(@misc.infinite_irrational_in_range())
  })
  log.attempt("COUNTABLE_LOCAL_MAXIMA", () => {
    sthm(@misc.countable_local_maxima())
  })
  log.attempt("COUNTABLE_LOCAL_MINIMA", () => {
    sthm(@misc.countable_local_minima())
  })
  log.attempt("COUNTABLE_STRICT_LOCAL_MAXIMA", () => {
    sthm(@misc.countable_strict_local_maxima())
  })
  log.attempt("COUNTABLE_STRICT_LOCAL_MINIMA", () => {
    sthm(@misc.countable_strict_local_minima())
  })
  log.attempt("relative_to", () => sthm(@misc.relative_to()))
  log.attempt("RELATIVE_TO_UNIV", () => sthm(@misc.relative_to_univ()))
  log.attempt("RELATIVE_TO_IMP_SUBSET", () => {
    sthm(@misc.relative_to_imp_subset())
  })
  log.attempt("FORALL_RELATIVE_TO", () => sthm(@misc.forall_relative_to()))
  log.attempt("RELATIVE_TO_INC", () => sthm(@misc.relative_to_inc()))
  log.attempt("RELATIVE_TO", () => sthm(@misc.relative_to_v1()))
  log.attempt("RELATIVE_TO_RELATIVE_TO", () => {
    sthm(@misc.relative_to_relative_to())
  })
  log.attempt("RELATIVE_TO_COMPL", () => sthm(@misc.relative_to_compl()))
  log.attempt("RELATIVE_TO_SUBSET", () => sthm(@misc.relative_to_subset()))
  log.attempt("RELATIVE_TO_SUBSET_TRANS", () => {
    sthm(@misc.relative_to_subset_trans())
  })
  log.attempt("RELATIVE_TO_MONO", () => sthm(@misc.relative_to_mono()))
  log.attempt("RELATIVE_TO_SUBSET_INC", () => {
    sthm(@misc.relative_to_subset_inc())
  })
  log.attempt("RELATIVE_TO_INTER", () => sthm(@misc.relative_to_inter()))
  log.attempt("RELATIVE_TO_UNION", () => sthm(@misc.relative_to_union()))
  log.attempt("ARBITRARY_UNION_OF_RELATIVE_TO", () => {
    sthm(@misc.arbitrary_union_of_relative_to())
  })
  log.attempt("FINITE_UNION_OF_RELATIVE_TO", () => {
    sthm(@misc.finite_union_of_relative_to())
  })
  log.attempt("COUNTABLE_UNION_OF_RELATIVE_TO", () => {
    sthm(@misc.countable_union_of_relative_to())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_RELATIVE_TO", () => {
    sthm(@misc.arbitrary_intersection_of_relative_to())
  })
  log.attempt("FINITE_INTERSECTION_OF_RELATIVE_TO", () => {
    sthm(@misc.finite_intersection_of_relative_to())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_RELATIVE_TO", () => {
    sthm(@misc.countable_intersection_of_relative_to())
  })
  log.attempt("FINITE_INTERSECTION_OF_RELATIVE_TO_ALT", () => {
    sthm(@misc.finite_intersection_of_relative_to_alt())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_RELATIVE_TO_ALT", () => {
    sthm(@misc.countable_intersection_of_relative_to_alt())
  })
  log.attempt("ARBITRARY_UNION_OF_NONEMPTY_FINITE_INTERSECTION", () => {
    sthm(@misc.arbitrary_union_of_nonempty_finite_intersection())
  })
  log.attempt("GENERAL_REDUCTION_THEOREM", () => {
    sthm(@misc.general_reduction_theorem())
  })
  log.attempt("GENERAL_REDUCTION_THEOREM_2", () => {
    sthm(@misc.general_reduction_theorem_2())
  })
  log.attempt("BACK_AND_FORTH_ALT", () => sthm(@misc.back_and_forth_alt()))
  log.attempt("BACK_AND_FORTH", () => sthm(@misc.back_and_forth()))
  log.attempt("BACK_AND_FORTH_2", () => sthm(@misc.back_and_forth_2()))
  log.attempt("RECURSION_ON_DYADIC_FRACTIONS", () => {
    sthm(@misc.recursion_on_dyadic_fractions())
  })
  log.attempt("suslin_operation", () => sthm(@misc.suslin_operation()))
  log.attempt("suslin", () => sthm(@misc.suslin()))
  log.attempt("SUSLIN_INC", () => sthm(@misc.suslin_inc()))
  log.attempt("SUSLIN_SUPERSET", () => sthm(@misc.suslin_superset()))
  log.attempt("SUSLIN_SUBSET", () => sthm(@misc.suslin_subset()))
  log.attempt("SUSLIN_MONO", () => sthm(@misc.suslin_mono()))
  log.attempt("SUSLIN_REGULAR", () => sthm(@misc.suslin_regular()))
  log.attempt("SUSLIN_SUSLIN", () => sthm(@misc.suslin_suslin()))
  log.attempt("SUSLIN_INTERS", () => sthm(@misc.suslin_inters()))
  log.attempt("SUSLIN_INTER", () => sthm(@misc.suslin_inter()))
  log.attempt("SUSLIN_UNIONS", () => sthm(@misc.suslin_unions()))
  log.attempt("SUSLIN_UNION", () => sthm(@misc.suslin_union()))
  log.attempt("CARD_SUSLIN_LE", () => sthm(@misc.card_suslin_le()))
  log.attempt("CARD_SUSLIN_EQ", () => sthm(@misc.card_suslin_eq()))
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 8
      #|0..0..2..4..6..solved at 11
      #|0..0..2..4..6..solved at 11
      #|0..0..2..4..6..solved at 11
      #|0..0..2..4..6..12..18..24..solved at 31
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..26..solved at 40
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..solved at 14
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..solved at 14
      #|0..0..solved at 2
      #|0..0..1..2..4..9..15..24..42..64..solved at 92
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..14..28..solved at 46
      #|0..0..1..2..3..7..14..28..solved at 37
      #|0..0..1..2..5..14..27..solved at 38
      #|0..0..solved at 2
      #|0..0..0..3..6..9..25..53..83..140..207..282..422..606..839..1236..1813..2634..4009..5831..8453..12482..18006..solved at 20305
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..4..solved at 10
      #|0..0..0..3..6..15..38..77..136..290..499..solved at 511
      #|0..0..0..3..6..15..38..77..136..290..498..solved at 510
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..0..0..0..2..4..6..9..12..15..20..25..30..54..78..102..142..182..222..solved at 241
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..4..solved at 9
      #|0..0..0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..4..8..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..13..26..solved at 52
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..2..4..6..11..18..27..solved at 41
      #|0..0..1..4..7..17..33..50..89..149..241..406..737..1228..2200..3777..6719..11712..solved at 11860
      #|0..0..solved at 2
      #|0..0..0..2..4..6..11..solved at 20
      #|0..0..1..4..7..17..33..50..89..149..241..405..735..1226..2201..3783..6732..11733..solved at 11889
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..1..7..19..42..103..221..454..solved at 518
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..3..7..19..41..83..136..224..343..519..solved at 565
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..3..7..19..41..83..136..224..343..519..solved at 565
      #|0..0..2..solved at 7
      #|0..0..2..6..solved at 10
      #|0..0..solved at 2
      #|0..0..2..6..solved at 10
      #|0..0..solved at 2
      #|0..0..1..5..12..23..54..97..solved at 148
      #|0..0..1..3..5..7..9..19..33..47..69..91..solved at 103
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..18..31..47..70..93..127..161..195..247..361..477..solved at 572
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..3..solved at 7
      #|0..0..1..4..12..27..solved at 62
      #|0..0..1..4..11..25..solved at 61
      #|0..0..1..5..15..36..88..188..387..797..1479..2551..4305..6977..10874..17244..solved at 24286
      #|0..0..1..4..10..17..26..solved at 43
      #|0..0..0..2..6..15..solved at 25
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 7
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..33..solved at 48
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..33..solved at 47
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..8..31..solved at 41
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..8..31..solved at 48
      #|0..0..0..0..0..2..4..6..10..15..20..25..32..39..57..75..93..113..133..153..173..193..213..307..401..507..solved at 565
      #|0..0..0..0..0..1..3..5..8..11..14..21..28..35..45..55..65..75..85..95..117..139..161..solved at 196
      #|0..0..solved at 2
      #|0..0..1..2..4..11..20..33..56..93..143..246..373..555..811..1230..solved at 1316
      #|0..0..solved at 2
      #|0..0..1..2..4..11..20..33..56..93..143..248..377..561..818..1238..solved at 1324
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 10
      #|0..0..1..2..4..6..8..solved at 16
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..7..19..36..62..103..160..solved at 176
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..5..9..17..solved at 28
      #|0..0..1..2..5..9..17..solved at 24
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..4..9..20..41..91..233..513..1026..2105..3950..7339..13641..24453..solved at 36589
      #|0..0..2..4..6..8..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..3..6..11..23..solved at 34
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..solved at 4
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..5..8..solved at 14
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 11
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..11..21..34..solved at 51
      #|0..0..2..9..18..41..solved at 51
      #|0..0..solved at 2
      #|0..0..0..3..6..11..21..31..48..77..112..156..211..solved at 224
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 9
      #|0..0..2..4..8..solved at 20
      #|0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..2..4..12..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..9..19..38..72..118..181..281..393..566..solved at 613
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..1..2..7..13..25..40..55..solved at 67
      #|0..0..3..11..solved at 17
      #|0..0..3..11..37..95..224..480..945..1999..3847..7001..12852..23137..solved at 27218
      #|0..0..3..11..37..101..251..578..solved at 724
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..11..solved at 18
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
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..10..32..71..165..342..648..1371..2697..5235..10393..19765..36596..73312..solved at 78775
      #|0..0..3..10..32..71..165..342..648..1371..2697..5235..10394..19766..36597..73313..solved at 78776
      #|0..0..2..4..6..16..32..solved at 42
      #|0..0..2..4..6..16..32..solved at 56
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..14..25..48..solved at 69
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..14..25..47..90..148..solved at 196
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..13..solved at 26
      #|0..0..2..9..26..53..108..206..347..570..963..solved at 1279
      #|0..0..3..12..30..62..130..254..475..910..1778..solved at 2235
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..9..23..41..82..139..254..421..755..solved at 793
      #|0..0..1..solved at 4
      #|0..0..1..5..11..solved at 16
      #|0..0..0..solved at 5
      #|0..0..1..5..10..23..58..116..208..437..solved at 458
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..14..33..59..112..solved at 131
      #|0..0..1..2..7..14..33..solved at 48
      #|0..0..1..2..7..16..30..63..113..202..459..869..1617..solved at 2852
      #|0..0..1..2..7..18..40..solved at 54
      #|0..0..1..2..7..13..23..44..71..128..323..solved at 347
      #|0..0..1..2..7..18..34..93..197..423..870..1742..3230..solved at 3316
      #|0..0..0..0..2..4..6..14..29..50..140..280..576..1228..solved at 1310
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..22..solved at 28
      #|0..0..3..6..18..43..85..solved at 182
      #|0..0..4..8..22..solved at 28
      #|0..0..3..6..18..43..85..solved at 183
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..22..solved at 28
      #|0..0..3..6..18..solved at 48
      #|0..0..3..6..18..solved at 48
      #|0..0..2..4..14..solved at 31
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..10..29..solved at 35
      #|0..0..4..8..25..57..113..solved at 241
      #|0..0..4..8..25..61..123..265..548..1075..2115..4125..7742..14469..solved at 22647
      #|0..0..3..6..21..42..83..solved at 177
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..11..29..57..solved at 123
      #|0..0..solved at 2
      #|0..0..2..4..11..29..57..solved at 124
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..11..solved at 34
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..18..43..85..solved at 182
      #|0..0..solved at 2
      #|0..0..2..4..14..28..55..solved at 118
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..6..12..solved at 32
      #|0..0..1..solved at 5
      #|0..0..3..6..16..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..0..1..2..3..solved at 15
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..6..solved at 12
      #|0..0..solved at 2
      #|0..0..0..1..3..9..35..74..solved at 95
      #|0..0..solved at 2
      #|0..0..3..6..11..23..39..56..86..121..164..229..310..398..solved at 422
      #|0..0..solved at 2
      #|0..0..3..6..11..23..39..56..81..107..140..192..248..308..466..632..822..1084..solved at 1250
      #|0..0..1..3..6..13..25..52..114..solved at 145
      #|0..0..0..2..4..8..16..26..39..solved at 56
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..3..solved at 11
      #|0..0..2..4..6..solved at 17
      #|0..0..0..0..0..2..5..8..12..16..20..39..58..solved at 74
      #|0..0..0..2..4..8..21..40..67..solved at 83
      #|0..0..1..3..13..24..35..66..100..134..192..259..326..602..884..1207..1798..2408..3137..4248..5384..6644..8402..10213..12222..solved at 14285
      #|0..0..1..4..7..18..solved at 25
      #|0..0..1..4..7..15..solved at 22
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..7..18..38..solved at 73
      #|0..0..1..5..13..29..58..100..180..288..468..solved at 673
      #|0..0..solved at 2
      #|0..0..1..5..15..28..solved at 39
      #|0..0..1..2..9..17..26..43..61..94..145..196..267..357..447..578..720..862..1164..1602..2158..2807..3632..4659..5945..solved at 6182
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..2..10..19..35..58..81..110..177..244..349..solved at 425
      #|0..0..solved at 2
      #|0..0..4..8..25..54..106..206..solved at 219
      #|0..0..4..8..25..54..108..216..solved at 229
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..25..54..108..216..solved at 229
      #|0..0..4..8..25..54..106..206..solved at 219
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 7
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..4..8..solved at 22
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..4..8..29..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..6..16..51..114..246..solved at 298
      #|0..0..6..16..51..114..246..solved at 298
      #|0..0..solved at 2
      #|0..0..7..14..56..133..287..563..1133..2084..3676..6411..10106..16198..27579..44675..70981..solved at 74473
      #|0..0..7..14..56..133..281..537..1065..1907..3299..5759..9029..14161..24318..39082..61433..solved at 63182
      #|0..0..solved at 3
      #|0..0..6..12..45..106..228..467..964..1845..solved at 2111
      #|0..0..solved at 2
      #|0..0..7..14..56..135..291..569..1144..2103..3722..6572..10440..16580..28075..solved at 29853
      #|0..0..7..14..56..131..277..531..1056..1892..3251..5636..8749..13793..23707..38190..60497..solved at 61633
      #|0..0..5..10..41..96..211..437..890..1733..solved at 2100
      #|0..0..solved at 2
      #|0..0..4..10..27..63..137..solved at 167
      #|0..0..4..10..27..63..137..solved at 167
      #|0..0..3..6..20..51..111..252..536..1074..solved at 1250
      #|0..0..3..6..20..51..111..252..536..1074..solved at 1332
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..10..19..solved at 24
      #|0..0..5..10..19..solved at 24
      #|0..0..3..6..11..solved at 16
      #|0..0..4..8..14..solved at 24
      #|0..0..solved at 2
      #|0..0..5..10..19..solved at 24
      #|0..0..5..10..19..solved at 24
      #|0..0..3..6..11..solved at 16
      #|0..0..4..8..14..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..10..19..solved at 24
      #|0..0..5..10..19..solved at 24
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..10..19..solved at 24
      #|0..0..5..10..19..solved at 24
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..11..solved at 16
      #|0..0..3..6..11..solved at 16
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..14..solved at 19
      #|0..0..4..8..14..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..8..11..14..17..20..28..36..44..solved at 61
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..4..10..20..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..19..32..50..85..144..250..458..878..1720..3515..solved at 3581
      #|0..0..1..4..9..19..32..50..85..144..250..458..882..solved at 926
      #|0..0..solved at 2
      #|0..0..2..4..14..26..48..83..133..solved at 144
      #|0..0..solved at 2
      #|0..0..2..4..14..26..48..83..132..217..358..solved at 374
      #|0..0..2..4..14..29..59..116..213..335..515..743..solved at 753
      #|0..0..solved at 2
      #|0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..15..28..47..solved at 65
      #|0..0..0..2..4..6..solved at 26
      #|0..0..3..6..12..solved at 21
      #|0..0..3..6..12..solved at 21
      #|0..0..3..10..27..59..127..238..433..804..1474..2643..4755..8128..13459..solved at 14546
      #|0..0..3..8..solved at 12
      #|0..0..3..8..solved at 16
      #|0..0..2..6..solved at 10
      #|0..0..2..6..14..36..88..163..solved at 189
      #|0..0..0..0..7..14..21..40..60..80..144..211..278..479..689..899..1349..1819..2289..3418..4602..5826..8450..11164..13988..solved at 14463
      #|0..0..1..2..9..solved at 14
      #|0..0..2..solved at 6
      #|0..0..1..2..9..solved at 14
      #|0..0..2..solved at 6
      #|0..0..4..8..18..40..150..370..753..solved at 929
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..143..362..744..solved at 872
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..143..362..744..solved at 929
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 841
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..143..362..744..solved at 929
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 841
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 907
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..123..316..660..solved at 788
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..143..362..744..solved at 935
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 844
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 913
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..123..316..660..solved at 791
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..134..344..713..solved at 913
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..123..316..660..solved at 791
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..123..316..660..solved at 869
      #|0..0..5..11..solved at 17
      #|0..0..4..8..18..40..110..278..585..solved at 716
      #|0..0..5..11..solved at 17
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..2..4..12..solved at 17
      #|0..0..2..4..12..solved at 17
      #|0..0..3..7..19..solved at 39
      #|0..0..2..4..12..solved at 27
      #|0..0..2..4..12..solved at 20
      #|0..0..3..7..19..solved at 46
      #|0..0..3..7..19..solved at 46
      #|0..0..3..7..19..solved at 39
      #|0..0..4..10..26..solved at 35
      #|0..0..2..4..12..solved at 17
      #|0..0..2..4..12..solved at 17
      #|0..0..3..7..19..solved at 39
      #|0..0..2..4..12..solved at 23
      #|0..0..2..4..12..solved at 18
      #|0..0..3..7..19..solved at 44
      #|0..0..3..7..19..solved at 44
      #|0..0..3..7..19..solved at 39
      #|0..0..4..10..26..solved at 35
      #|0..0..2..4..12..solved at 17
      #|0..0..2..4..12..solved at 17
      #|0..0..3..7..19..solved at 39
      #|0..0..2..4..12..solved at 27
      #|0..0..2..4..12..solved at 20
      #|0..0..3..7..19..solved at 46
      #|0..0..3..7..19..solved at 46
      #|0..0..3..7..19..solved at 39
      #|0..0..4..10..26..solved at 35
      #|0..0..2..4..12..solved at 17
      #|0..0..2..4..12..solved at 17
      #|0..0..3..7..19..solved at 39
      #|0..0..2..4..12..solved at 23
      #|0..0..2..4..12..solved at 18
      #|0..0..3..7..19..solved at 44
      #|0..0..3..7..19..solved at 44
      #|0..0..3..7..19..solved at 39
      #|0..0..4..10..26..solved at 35
      #|0..0..solved at 2
      #|0..0..1..2..11..23..solved at 32
      #|0..0..solved at 2
      #|0..0..2..5..20..48..107..solved at 122
      #|0..0..2..5..20..48..106..solved at 120
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..53..94..167..solved at 227
      #|Warning: inventing type variables
      #|0..0..2..4..10..20..38..solved at 57
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..4..8..15..25..52..110..178..solved at 278
      #|0..0..1..2..8..16..33..67..120..solved at 137
      #|0..0..1..6..13..29..51..78..143..solved at 166
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..22..43..73..142..237..376..632..979..1471..solved at 1751
      #|0..0..1..2..5..9..15..22..29..36..solved at 45
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..29..44..68..108..150..213..348..523..solved at 570
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..32..42..65..88..120..160..solved at 204
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..1..2..6..11..18..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..1..2..3..solved at 10
      #|0..0..solved at 2
      #|0..0..0..0..0..1..3..5..7..9..11..15..19..23..solved at 34
      #|0..0..1..2..5..9..15..28..solved at 48
      #|0..0..1..3..solved at 8
      #|0..0..0..1..2..3..9..17..28..54..solved at 85
      #|0..0..1..2..5..9..15..25..36..50..73..96..127..solved at 164
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..1..3..5..9..solved at 17
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..0..0..0..1..2..3..7..solved at 15
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..22..38..58..82..120..solved at 165
      #|0..0..0..solved at 3
      #|0..0..1..7..18..solved at 25
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..5..7..9..33..60..92..132..187..243..339..444..557..692..880..1076..1383..1735..solved at 1974
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..25..42..68..100..151..228..327..481..731..1042..1522..2111..solved at 2813
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..1..2..5..9..15..23..32..42..63..88..129..181..239..320..422..565..752..992..1271..1654..2104..2683..3373..4228..solved at 5161
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..0..0..3..8..15..29..43..60..85..110..139..solved at 150
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..1..2..3..8..15..22..32..44..60..94..128..169..233..297..365..474..589..712..893..1078..1290..1624..1975..2547..3364..4258..5273..6994..8906..11053..14171..17709..21656..27502..33878..solved at 38215
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..12..solved at 28
      #|0..0..4..8..20..solved at 42
      #|0..0..3..6..15..38..84..150..239..359..534..802..solved at 889
      #|0..0..3..6..15..38..84..150..240..360..533..800..solved at 887
      #|0..0..solved at 2
      #|0..0..0..0..0..0..1..3..5..8..11..14..20..26..32..235..593..1371..2952..6816..16079..39492..solved at 39691
      #|0..0..3..6..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..25..42..68..100..178..287..461..solved at 618
      #|0..0..1..2..5..13..25..42..68..100..181..292..478..solved at 640
      #|0..0..0..2..4..6..11..16..21..58..99..144..232..355..510..743..1032..1352..1775..2318..3004..solved at 3519
      #|0..0..0..2..4..6..11..16..21..58..99..144..232..355..510..743..1032..1352..1772..2309..2980..3910..5103..solved at 6030
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..10..solved at 22
      #|0..0..3..10..solved at 21
      #|0..0..3..10..solved at 14
      #|0..0..solved at 2
      #|0..0..3..10..solved at 24
      #|0..0..3..10..solved at 23
      #|0..0..3..10..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..8..14..solved at 27
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..13..19..32..solved at 47
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..6..12..21..solved at 27
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..21..60..121..287..579..1152..2198..4380..8116..15563..solved at 15679
      #|0..0..1..2..6..11..19..34..49..68..96..124..161..solved at 184
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..38..59..87..133..204..solved at 260
      #|0..0..1..2..6..11..19..34..49..68..93..118..149..208..267..350..solved at 374
      #|0..0..1..2..4..9..15..21..27..33..39..51..63..87..121..155..solved at 168
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..28..42..solved at 61
      #|0..0..1..2..solved at 8
      #|0..0..1..2..5..10..19..solved at 38
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..0..0..1..2..3..6..9..12..17..26..35..46..solved at 59
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..7..solved at 19
      #|0..0..1..3..7..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..0..1..2..3..4..5..6..10..14..18..31..44..57..solved at 109
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..2..4..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..3..9..16..27..50..98..173..311..solved at 325
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..28..37..46..65..84..113..170..227..312..421..530..663..872..1081..1366..1826..2286..2918..solved at 4922
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 7
      #|0..0..0..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..0..0..0..1..4..7..solved at 14
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..3..7..15..27..60..110..188..solved at 301
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..solved at 33
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..0..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..15..solved at 20
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..5..solved at 13
      #|0..0..2..7..14..solved at 22
      #|0..0..1..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 10
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..40..85..157..solved at 396
      #|0..0..1..2..5..9..15..22..36..60..96..164..293..480..799..1402..2301..6261..solved at 13795
      #|0..0..1..2..5..9..15..22..36..60..98..168..301..492..815..1422..2325..6289..solved at 12822
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..3..6..13..38..85..196..solved at 540
      #|0..0..1..2..solved at 8
      #|0..0..0..0..3..7..13..solved at 40
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..3..6..9..23..43..101..180..281..464..837..1354..2275..solved at 2537
      #|0..0..0..2..4..solved at 11
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..5..19..37..66..104..148..238..375..601..solved at 816
      #|0..0..1..2..5..19..37..66..104..148..241..392..673..solved at 906
      #|0..0..1..2..5..19..37..66..104..148..241..392..673..solved at 897
      #|0..0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 8
      #|0..0..2..9..16..solved at 29
      #|0..0..2..solved at 7
      #|0..0..2..9..16..solved at 44
      #|0..0..2..solved at 9
      #|0..0..2..solved at 5
      #|0..0..0..9..22..43..156..385..724..solved at 2097
      #|0..0..1..3..15..28..155..515..solved at 553
      #|0..0..1..4..solved at 13
      #|0..0..1..3..solved at 10
      #|0..0..1..4..18..33..170..solved at 264
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 18
      #|0..0..1..3..solved at 12
      #|0..0..1..4..solved at 13
      #|0..0..1..3..solved at 10
      #|0..0..1..4..solved at 15
      #|0..0..1..4..18..33..170..solved at 264
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..21..38..185..solved at 265
      #|0..0..0..10..25..48..143..304..539..solved at 1405
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 19
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..5..solved at 17
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..24..43..176..426..solved at 471
      #|0..0..0..10..25..48..143..304..539..solved at 1413
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 19
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..5..solved at 16
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..24..43..172..422..solved at 475
      #|0..0..0..11..28..53..130..219..334..solved at 688
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 15
      #|0..0..1..7..solved at 16
      #|0..0..1..6..solved at 15
      #|0..0..1..7..solved at 20
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..solved at 25
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 16
      #|0..0..1..6..solved at 25
      #|0..0..1..7..27..48..163..303..solved at 342
      #|0..0..0..1..18..39..95..277..solved at 463
      #|0..0..1..3..17..32..186..631..1360..solved at 1552
      #|0..0..1..3..17..32..186..631..1360..solved at 1512
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 17
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 22
      #|0..0..1..6..solved at 22
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 16
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 21
      #|0..0..1..6..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 23
      #|0..0..1..7..solved at 23
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 30
      #|0..0..1..7..solved at 30
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 23
      #|0..0..1..6..solved at 23
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..20..37..217..solved at 270
      #|0..0..1..4..20..37..217..solved at 270
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..23..42..212..solved at 367
      #|0..0..1..5..23..42..212..solved at 367
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..23..42..210..solved at 365
      #|0..0..1..5..23..42..210..solved at 365
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 23
      #|0..0..1..7..solved at 23
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..23..42..212..solved at 298
      #|0..0..1..5..23..42..212..solved at 298
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..207..550..1387..solved at 1552
      #|0..0..1..6..26..47..207..550..1370..solved at 1601
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..26..47..205..548..1385..solved at 1495
      #|0..0..1..6..26..47..205..548..1368..solved at 1547
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..200..457..1005..solved at 1237
      #|0..0..1..7..29..52..200..457..982..solved at 1344
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 17
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 22
      #|0..0..1..7..solved at 22
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..23..42..210..solved at 296
      #|0..0..1..5..23..42..210..solved at 296
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..205..548..1368..solved at 1490
      #|0..0..1..6..26..47..205..548..1385..solved at 1670
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..26..47..203..546..1366..solved at 1467
      #|0..0..1..6..26..47..203..546..1383..solved at 1635
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..198..455..980..solved at 1148
      #|0..0..1..7..29..52..198..455..1003..solved at 1456
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 19
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 24
      #|0..0..1..8..solved at 24
      #|0..0..1..6..solved at 23
      #|0..0..1..6..solved at 23
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..200..457..1005..solved at 1176
      #|0..0..1..7..29..52..200..457..1005..solved at 1319
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 14
      #|0..0..1..7..29..52..198..455..1003..solved at 1106
      #|0..0..1..7..29..52..198..455..1003..solved at 1268
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 16
      #|0..0..1..8..32..57..193..360..601..solved at 848
      #|0..0..1..8..32..57..193..360..601..solved at 1107
      #|0..0..0..0..solved at 25
      #|0..0..0..0..solved at 16
      #|0..0..0..0..solved at 23
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..5..9..solved at 18
      #|0..0..1..2..3..5..9..solved at 17
      #|0..0..2..4..9..15..solved at 25
      #|0..0..2..4..9..14..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..solved at 9
      #|0..0..2..10..24..solved at 29
      #|0..0..2..10..22..solved at 27
      #|0..0..4..15..31..solved at 38
      #|0..0..solved at 3
      #|0..0..4..18..43..71..solved at 80
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..4..5..6..10..14..18..34..50..73..103..140..solved at 184
      #|Warning: inventing type variables
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..5..9..18..28..41..56..75..96..147..solved at 200
      #|0..0..1..2..5..9..22..37..63..96..149..212..307..415..606..821..1211..1654..2338..3131..4216..solved at 5211
      #|0..0..0..solved at 3
      #|0..0..0..0..2..4..6..10..14..18..28..40..54..92..145..220..340..498..710..1038..1477..2067..3174..4809..7105..solved at 7940
      #|0..0..1..3..7..15..26..56..96..158..312..555..939..1625..2723..4404..7487..12300..19950..solved at 22248
      #|0..0..1..2..5..9..15..22..29..55..91..146..239..336..457..617..781..978..1399..1822..2477..3473..4521..6002..7920..10215..13177..20774..29957..44857..70387..105288..162273..251151..386153..solved at 497526
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..19..28..37..46..69..92..129..201..277..375..solved at 495
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..8..solved at 19
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..10..solved at 24
      #|0..0..2..solved at 9
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..8..solved at 21
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..10..solved at 26
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..10..22..solved at 28
      #|0..0..1..3..9..solved at 18
      #|0..0..1..3..10..22..solved at 28
      #|0..0..1..3..9..solved at 18
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..18..solved at 26
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..18..solved at 26
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 11
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..7..solved at 14
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..4..10..solved at 15
      #|0..0..4..9..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 11
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..7..solved at 14
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..4..10..solved at 15
      #|0..0..4..9..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..17..24..solved at 32
      #|0..0..2..8..16..28..48..solved at 55
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..1..3..7..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..2..solved at 6
      #|0..0..1..3..7..12..23..solved at 38
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..19..30..49..72..113..174..solved at 213
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..9..17..35..62..101..146..216..292..403..539..solved at 690
      #|0..0..1..8..15..27..61..112..212..374..631..1016..1672..2572..solved at 2632
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..2..6..11..19..33..48..65..98..131..178..268..360..516..solved at 698
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 17
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 16
      #|0..0..3..6..17..36..64..solved at 95
      #|0..0..2..4..13..27..47..solved at 60
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..11..27..56..102..183..274..437..655..987..1746..2662..solved at 2980
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
      #|0..0..1..2..11..27..57..106..187..276..416..594..882..1624..2521..solved at 2830
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..2..3..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..4..9..18..28..39..58..77..solved at 90
      #|0..0..1..3..7..solved at 17
      #|0..0..1..3..7..13..20..solved at 35
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..7..14..24..solved at 41
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|Warning: inventing type variables
      #|Warning: inventing type variables
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
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..2..4..8..18..solved at 29
      #|0..0..2..4..6..12..20..44..102..184..301..484..680..893..1157..1421..solved at 1657
      #|0..0..2..4..6..12..20..44..102..184..301..483..673..876..1118..1360..solved at 1604
      #|0..0..2..4..6..12..20..44..102..184..301..483..673..876..1118..1360..solved at 1606
      #|0..0..2..4..6..12..20..44..102..184..301..484..680..893..1157..1421..solved at 1659
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..solved at 26
      #|0..0..1..2..3..7..14..solved at 23
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..8..15..31..62..114..188..297..solved at 359
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..solved at 26
      #|0..0..1..2..3..7..14..solved at 23
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..8..17..33..65..120..187..309..solved at 374
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..6..19..47..solved at 70
      #|0..0..2..solved at 5
      #|0..0..1..4..8..solved at 18
      #|0..0..0..0..3..11..23..solved at 40
      #|0..0..2..solved at 5
      #|0..0..2..8..16..32..60..102..170..251..364..539..777..1073..1572..2193..3540..5446..8771..solved at 14020
      #|0..0..2..4..10..18..30..54..80..118..196..310..498..779..1165..1692..2966..4706..7892..solved at 13080
      #|0..0..2..4..10..21..37..66..99..142..227..343..528..786..1121..1561..2846..4551..7699..solved at 13131
      #|0..0..1..2..5..9..15..25..36..50..83..141..247..393..614..906..1838..3167..5801..solved at 10237
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..8..16..35..67..118..197..293..421..592..799..1054..1439..1905..2681..3641..4909..solved at 5707
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..10..21..37..70..107..160..257..371..532..776..1052..1428..2135..2933..4086..solved at 4882
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..10..24..44..82..126..184..288..404..562..783..1008..1297..2015..2778..3893..solved at 4689
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..41..63..92..144..202..281..393..507..657..1033..1434..2053..solved at 2878
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..7..12..solved at 18
      #|0..0..2..7..12..20..34..solved at 46
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 13
      #|0..0..2..5..11..solved at 17
      #|0..0..1..3..6..solved at 11
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..solved at 23
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..3..6..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 6
      #|0..0..1..solved at 7
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..2..6..14..solved at 20
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..2..6..14..solved at 20
      #|0..0..7..21..55..125..246..589..solved at 980
      #|0..0..8..22..solved at 59
      #|0..0..5..14..40..83..solved at 149
      #|0..0..solved at 3
      #|0..0..8..24..62..136..266..637..solved at 1080
      #|0..0..9..25..solved at 66
      #|0..0..5..13..solved at 25
      #|0..0..5..14..37..78..solved at 139
      #|0..0..2..5..10..solved at 17
      #|0..0..2..5..10..solved at 17
      #|0..0..1..3..10..20..47..92..168..295..564..996..solved at 1100
      #|0..0..2..5..12..solved at 18
      #|0..0..1..2..3..7..12..17..46..95..165..341..solved at 530
      #|0..0..1..2..3..7..12..17..46..95..165..349..solved at 576
      #|0..0..solved at 2
      #|0..0..2..7..17..solved at 37
      #|0..0..0..0..1..2..3..solved at 9
      #|0..0..1..solved at 5
      #|0..0..2..10..22..solved at 47
      #|0..0..1..solved at 7
      #|0..0..2..10..22..solved at 47
      #|0..0..solved at 2
      #|0..0..2..5..12..solved at 18
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..30..44..62..85..110..139..186..240..310..400..502..618..778..953..1160..1410..1683..1984..2354..2793..3280..3898..4564..5290..6122..7111..8154..9412..10881..12438..14253..16302..18445..20920..solved at 23327
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..37..52..solved at 84
      #|0..0..2..solved at 6
      #|0..0..2..6..12..30..56..97..solved at 181
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..1..2..3..9..15..21..solved at 31
      #|0..0..1..4..solved at 8
      #|0..0..0..1..4..solved at 9
      #|0..0..1..4..12..36..75..185..357..692..solved at 1001
      #|0..0..1..2..3..7..13..21..32..45..59..86..117..154..208..274..346..439..546..solved at 603
      #|0..0..1..2..3..7..13..21..32..45..59..86..117..154..208..274..346..439..546..solved at 599
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..26..solved at 40
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..8..16..33..61..99..solved at 117
      #|0..0..2..8..16..36..67..107..191..285..391..517..669..837..1115..1441..1803..2313..2907..3545..solved at 4006
      #|0..0..2..4..10..19..32..48..solved at 66
      #|0..0..2..4..10..22..38..56..98..140..224..317..452..613..944..1313..1980..2812..4002..5379..solved at 5798
      #|0..0..1..2..5..10..17..26..solved at 44
      #|0..0..1..2..5..13..23..34..69..104..146..192..245..308..421..544..678..892..1117..1363..solved at 1821
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..31..43..56..84..116..154..210..278..354..453..568..solved at 669
      #|0..0..1..2..3..7..13..21..31..43..56..84..116..154..210..278..354..453..568..solved at 665
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..5..14..solved at 19
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..3..8..solved at 19
      #|0..0..3..7..20..46..91..215..418..840..solved at 1224
      #|0..0..2..10..29..72..solved at 90
      #|0..0..2..4..11..21..39..83..149..283..solved at 616
      #|0..0..solved at 3
      #|0..0..4..9..solved at 18
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..7..solved at 16
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..7..14..27..43..solved at 68
      #|0..0..2..solved at 5
      #|0..0..2..solved at 8
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..2..4..6..13..20..27..74..148..314..795..1665..3413..7549..15713..solved at 21919
      #|0..0..1..4..solved at 8
      #|0..0..0..3..8..solved at 18
      #|0..0..2..5..10..28..solved at 34
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..2..4..6..13..20..27..74..148..314..795..1665..3413..7549..15713..solved at 21919
      #|0..0..1..4..solved at 8
      #|0..0..0..3..8..solved at 18
      #|0..0..2..5..10..28..solved at 34
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..21..36..solved at 43
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..31..56..solved at 80
      #|0..0..1..2..5..11..27..48..solved at 66
      #|0..0..1..2..7..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..12..23..47..81..133..237..458..solved at 479
      #|0..0..2..4..12..23..47..81..133..237..458..solved at 479
      #|0..0..2..4..6..solved at 11
      #|0..0..1..5..10..19..solved at 26
      #|0..0..1..solved at 5
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..34..106..solved at 120
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..34..106..252..solved at 271
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..26..42..68..119..208..373..solved at 554
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..solved at 5
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|15 basis elements and 18 critical pairs
      #|15 basis elements and 17 critical pairs
      #|15 basis elements and 16 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 14 critical pairs
      #|18 basis elements and 13 critical pairs
      #|18 basis elements and 12 critical pairs
      #|18 basis elements and 11 critical pairs
      #|18 basis elements and 10 critical pairs
      #|19 basis elements and 14 critical pairs
      #|19 basis elements and 13 critical pairs
      #|19 basis elements and 12 critical pairs
      #|19 basis elements and 11 critical pairs
      #|20 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|15 basis elements and 18 critical pairs
      #|15 basis elements and 17 critical pairs
      #|15 basis elements and 16 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 14 critical pairs
      #|18 basis elements and 13 critical pairs
      #|18 basis elements and 12 critical pairs
      #|18 basis elements and 11 critical pairs
      #|18 basis elements and 10 critical pairs
      #|19 basis elements and 14 critical pairs
      #|19 basis elements and 13 critical pairs
      #|19 basis elements and 12 critical pairs
      #|19 basis elements and 11 critical pairs
      #|20 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..8..17..32..63..114..198..359..solved at 473
      #|0..0..1..3..7..15..solved at 26
      #|0..0..1..3..7..15..31..solved at 47
      #|0..0..0..0..0..4..12..solved at 26
      #|0..0..0..0..0..3..6..9..23..solved at 32
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..3..solved at 7
      #|0..0..2..7..17..solved at 22
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..4..7..11..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..8..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..6..14..28..59..110..solved at 150
      #|0..0..1..2..solved at 6
      #|0..0..0..0..1..3..5..10..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..11..29..60..103..209..392..639..1109..solved at 1593
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
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
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..3..8..25..74..225..solved at 234
      #|0..0..1..2..4..6..8..solved at 14
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 3 critical pairs
      #|4 basis elements and 5 critical pairs
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 4 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..4..solved at 8
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..5..10..24..54..114..solved at 194
      #|0..0..0..2..5..11..solved at 17
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..3..7..13..39..85..133..207..solved at 223
      #|0..0..solved at 3
      #|0..0..2..4..6..15..30..53..94..solved at 132
      #|0..0..3..7..13..39..85..133..207..solved at 223
      #|0..0..solved at 3
      #|0..0..2..4..6..15..30..53..95..solved at 134
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..1..2..3..7..11..15..26..37..48..solved at 132
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|9 basis elements and 17 critical pairs
      #|9 basis elements and 16 critical pairs
      #|10 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|9 basis elements and 17 critical pairs
      #|9 basis elements and 16 critical pairs
      #|9 basis elements and 15 critical pairs
      #|10 basis elements and 21 critical pairs
      #|10 basis elements and 20 critical pairs
      #|11 basis elements and 25 critical pairs
      #|11 basis elements and 24 critical pairs
      #|12 basis elements and 28 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..4..6..8..solved at 20
      #|0..0..2..4..6..8..26..60..100..232..382..solved at 454
      #|0..0..2..4..6..8..26..60..100..232..382..solved at 462
      #|0..0..2..4..6..8..solved at 16
      #|0..0..1..2..3..4..solved at 12
      #|0..0..1..2..3..4..solved at 12
      #|0..0..1..2..3..4..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..33..50..solved at 68
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..14..32..54..80..solved at 129
      #|0..0..1..2..3..4..12..20..28..solved at 46
      #|0..0..1..3..7..12..22..solved at 35
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..11..20..34..61..95..solved at 107
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..7..13..25..40..61..96..133..180..238..solved at 266
      #|0..0..1..4..12..27..45..76..120..solved at 160
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..10..21..36..53..solved at 69
      #|Warning: inventing type variables
      #|0..0..1..5..13..23..33..51..76..101..132..169..206..solved at 244
      #|Warning: inventing type variables
      #|0..0..1..3..9..19..29..solved at 39
      #|Warning: inventing type variables
      #|0..0..1..4..9..solved at 15
      #|0..0..1..3..9..19..29..solved at 39
      #|Warning: inventing type variables
      #|0..0..1..2..9..16..32..50..solved at 58
      #|0..0..1..3..6..13..27..55..98..solved at 161
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..9..24..45..76..126..solved at 150
      #|0..0..1..4..11..28..50..solved at 70
      #|0..0..1..3..7..18..34..55..85..117..155..212..284..374..543..739..1018..1357..solved at 1481
      #|0..0..1..3..9..19..29..solved at 39
      #|0..0..1..3..5..18..57..112..176..245..314..387..480..581..814..1182..1573..2248..3205..4203..5398..6757..8130..9625..11424..13370..15633..18436..21380..solved at 23834
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..25..44..82..161..338..722..solved at 1281
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..0..1..8..solved at 27
      #|0..0..1..2..7..13..solved at 31
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..9..23..45..solved at 52
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..3..9..20..35..solved at 42
      #|0..0..1..3..7..15..28..47..solved at 55
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..11..24..37..solved at 50
      #|0..0..1..3..11..24..37..solved at 48
      #|0..0..1..4..12..22..46..solved at 57
      #|0..0..2..10..35..83..solved at 94
      #|0..0..1..6..25..61..191..solved at 202
      #|0..0..solved at 2
      #|0..0..3..10..solved at 14
      #|0..0..1..2..5..9..15..30..47..76..solved at 122
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 21
      #|0..0..solved at 2
      #|0..0..2..5..11..26..solved at 51
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..9..21..solved at 34
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..17..32..solved at 41
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..17..solved at 38
      #|0..0..2..6..13..29..solved at 61
      #|0..0..1..3..8..19..solved at 34
      #|0..0..solved at 2
      #|0..0..1..3..8..19..solved at 34
      #|0..0..3..8..27..74..252..solved at 382
      #|0..0..3..9..31..solved at 57
      #|0..0..4..11..36..98..306..888..solved at 1648
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..3..11..38..solved at 68
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..3..10..32..89..solved at 125
      #|0..0..solved at 2
      #|0..0..1..3..6..17..solved at 34
      #|0..0..2..6..10..22..42..67..solved at 74
      #|0..0..1..solved at 5
      #|0..0..1..2..3..4..7..18..29..50..71..solved at 85
      #|0..0..solved at 3
      #|0..0..1..2..3..7..13..21..42..69..105..solved at 159
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..11..26..59..123..solved at 143
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..11..26..solved at 32
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..10..19..39..solved at 52
      #|0..0..0..1..10..19..39..solved at 59
      #|0..0..0..1..10..19..39..solved at 59
      #|0..0..0..1..10..19..39..solved at 52
      #|0..0..1..4..9..19..41..75..solved at 84
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..2..4..9..21..41..67..106..solved at 121
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..16..31..90..167..273..solved at 297
      #|0..0..2..7..solved at 12
      #|0..0..0..2..4..7..16..25..solved at 32
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..11..29..60..103..209..392..639..1109..solved at 1593
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..11..31..53..125..227..355..647..972..1329..2036..2771..3600..solved at 3688
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..0..0..2..4..6..8..10..12..19..26..33..43..53..63..75..87..99..113..127..141..solved at 160
      #|0..0..0..0..0..2..4..6..9..12..15..20..25..30..54..78..102..solved at 121
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..1..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
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
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..2..7..15..27..solved at 42
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..7..14..25..solved at 44
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..14..solved at 26
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..3..5..10..16..22..39..56..77..120..168..solved at 222
      #|0..0..0..0..1..4..7..solved at 13
      #|Warning: inventing type variables
      #|0..0..4..8..12..solved at 19
      #|0..0..4..8..12..solved at 18
      #|0..0..4..8..12..solved at 23
      #|0..0..4..8..12..solved at 20
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..6..12..22..38..60..94..165..284..solved at 406
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..0..solved at 12
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 13
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..0..1..2..3..6..9..12..19..26..33..51..69..87..121..155..189..263..337..411..710..1059..1458..2107..2971..4050..solved at 5051
      #|0..0..0..1..2..3..6..9..12..19..26..33..51..69..87..121..155..189..263..337..411..710..1059..1458..2104..2962..4032..solved at 4992
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..12..26..solved at 49
      #|0..0..1..3..5..solved at 10
      #|0..0..0..1..2..3..9..17..31..68..116..solved at 155
      #|0..0..1..2..5..10..20..40..66..143..242..427..solved at 641
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..12..20..solved at 27
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..26..solved at 49
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..20..40..64..124..189..283..488..758..1235..2037..3006..4677..7536..11913..18411..solved at 24712
      #|0..0..1..2..4..13..23..41..solved at 52
      #|0..0..2..4..8..21..40..67..114..192..275..469..746..1144..1876..2916..4428..6893..10808..16554..solved at 16618
      #|0..0..1..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..257..396..602..1031..1590..2588..solved at 3240
      #|0..0..2..4..8..21..41..71..124..215..315..532..837..1286..2212..3650..solved at 4959
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..256..394..600..1030..1590..2588..solved at 3154
      #|0..0..2..4..8..21..40..67..115..199..288..498..793..1213..solved at 1250
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..72..136..270..496..921..1706..3164..5657..10613..18945..solved at 33208
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..71..132..261..480..895..1673..3118..5575..solved at 5590
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..4..10..22..49..99..201..365..656..1120..1852..3096..5120..8630..14677..solved at 15315
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..4..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..4..11..25..54..112..226..412..731..1262..2100..3503..5855..9821..16518..28428..47421..79051..solved at 79973
      #|0..0..0..1..2..3..12..solved at 22
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..264..412..634..1080..1656..2688..solved at 3271
      #|0..0..2..4..8..21..41..71..126..223..332..565..885..1356..solved at 1393
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..264..412..634..1080..1656..2688..solved at 3362
      #|0..0..2..4..8..21..42..75..134..236..346..582..909..1402..solved at 1435
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..72..136..272..503..936..1740..3227..5923..solved at 5942
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..73..140..280..516..952..1760..3252..5965..solved at 5976
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..4..10..22..49..99..201..365..656..1120..1852..3096..5120..8630..14677..solved at 15315
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 7
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..11..25..54..112..226..412..731..1262..2100..3503..5855..9821..16518..28428..47421..79051..solved at 79973
      #|0..0..2..4..7..16..29..50..83..123..176..249..332..445..solved at 480
      #|0..0..1..3..6..13..24..39..58..solved at 92
      #|0..0..1..2..5..10..21..37..solved at 49
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 9 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|11 basis elements and 11 critical pairs
      #|11 basis elements and 10 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..21..solved at 30
      #|0..0..1..2..6..12..21..solved at 30
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..2..8..18..solved at 25
      #|0..0..0..2..8..18..solved at 25
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..2..8..solved at 13
      #|0..0..1..2..7..13..27..43..69..100..155..218..313..426..569..741..973..1239..1595..solved at 1919
      #|0..0..1..3..7..solved at 12
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..9..18..solved at 52
      #|0..0..10..20..solved at 57
      #|0..0..10..20..solved at 57
      #|0..0..11..22..solved at 62
      #|0..0..1..2..solved at 12
      #|0..0..2..4..solved at 14
      #|0..0..2..4..solved at 14
      #|0..0..2..4..solved at 18
      #|0..0..2..4..58..133..solved at 443
      #|0..0..3..6..127..287..solved at 796
      #|0..0..3..6..79..179..solved at 569
      #|0..0..3..6..87..201..solved at 692
      #|0..0..2..4..58..133..solved at 443
      #|0..0..3..6..127..287..solved at 796
      #|0..0..3..6..79..179..solved at 569
      #|0..0..3..6..87..201..solved at 692
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..129..291..solved at 1630
      #|0..0..solved at 2
      #|0..0..4..8..214..477..solved at 2423
      #|0..0..solved at 2
      #|0..0..4..8..158..353..solved at 1944
      #|0..0..solved at 2
      #|0..0..4..8..166..375..solved at 2069
      #|0..0..solved at 2
      #|0..0..3..6..129..291..solved at 1630
      #|0..0..solved at 2
      #|0..0..4..8..214..477..solved at 2424
      #|0..0..solved at 2
      #|0..0..4..8..158..353..solved at 1944
      #|0..0..solved at 2
      #|0..0..4..8..166..375..solved at 2070
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..solved at 24
      #|0..0..2..4..solved at 28
      #|0..0..2..4..solved at 27
      #|0..0..2..4..solved at 32
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..2..4..solved at 44
      #|0..0..3..6..solved at 49
      #|0..0..3..6..solved at 48
      #|0..0..3..6..solved at 54
      #|0..0..3..6..127..solved at 198
      #|0..0..4..8..212..solved at 376
      #|0..0..4..8..156..solved at 231
      #|0..0..4..8..164..374..solved at 1318
      #|0..0..4..8..212..solved at 291
      #|0..0..5..10..313..solved at 493
      #|0..0..5..10..249..solved at 332
      #|0..0..5..10..257..576..solved at 1876
      #|0..0..4..8..156..solved at 231
      #|0..0..5..10..249..solved at 421
      #|0..0..5..10..185..solved at 264
      #|0..0..5..10..193..436..solved at 1524
      #|0..0..4..8..164..375..solved at 1223
      #|0..0..5..10..257..577..solved at 2988
      #|0..0..5..10..193..437..solved at 1425
      #|0..0..5..10..201..456..3475..solved at 5109
      #|0..0..3..6..127..solved at 207
      #|0..0..4..8..212..solved at 385
      #|0..0..4..8..156..solved at 240
      #|0..0..4..8..164..374..solved at 1348
      #|0..0..4..8..212..solved at 300
      #|0..0..5..10..313..solved at 502
      #|0..0..5..10..249..solved at 341
      #|0..0..5..10..257..576..solved at 1912
      #|0..0..4..8..156..solved at 240
      #|0..0..5..10..249..solved at 430
      #|0..0..5..10..185..solved at 273
      #|0..0..5..10..193..436..solved at 1554
      #|0..0..4..8..164..375..solved at 1247
      #|0..0..5..10..257..577..solved at 3016
      #|0..0..5..10..193..437..solved at 1449
      #|0..0..5..10..201..456..3479..solved at 5148
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..1..4..11..34..74..144..299..897..2236..5564..solved at 5583
      #|0..0..1..4..11..solved at 17
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..1..3..solved at 8
      #|0..0..2..6..solved at 11
      #|0..0..1..3..solved at 8
      #|0..0..2..6..13..32..solved at 62
      #|0..0..1..4..9..29..65..123..solved at 133
      #|0..0..0..2..6..25..58..111..236..solved at 744
      #|0..0..1..4..9..32..72..135..279..814..2008..solved at 2025
      #|0..0..2..6..20..62..157..337..802..2420..6499..17735..solved at 28824
      #|0..0..0..solved at 6
      #|0..0..0..solved at 5
      #|0..0..0..solved at 6
      #|0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..2..5..10..solved at 16
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..2..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..solved at 16
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|Multivariate/misc quotations (1146):
      #|  (\226\136\128 s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (A) -> Bool, P(s))
      #|  (\226\136\131 s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\131 s : (A) -> Bool, P(s))
      #|  DIFF((u : (A) -> Bool), (s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 u : (A) -> Bool, (\226\136\128 s : (A) -> Bool, SUBSET(s, u) \226\134\146 (P : ((A) -> Bool) -> Bool)(DIFF(u, s))) == (\226\136\128 s : (A) -> Bool, SUBSET(s, u) \226\134\146 P(s))
      #|  DIFF((u : (A) -> Bool), (s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 u : (A) -> Bool, (\226\136\128 s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(DIFF(u, s))) == (\226\136\128 s : (A) -> Bool, SUBSET(s, u) \226\134\146 P(s))
      #|  \226\136\128 n : Num, n >= n
      #|  (\226\136\128 n : Num, !(n == 0) \226\134\146 (P : (Num) -> Bool)(n)) == (\226\136\128 n : Num, P(SUC(n)))
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 e : (Num) -> Real, (\226\136\128 n : Num, n >= (m : Num) \226\134\146 d(n) < e(n)) && (\226\136\128 n : Num, n >= m \226\134\146 e(n) <= e(m)) \226\134\146 (\226\136\128 n : Num, n >= m \226\134\146 d(n) < e(m))
      #|  (\226\136\128 e : Real, (real_of_num(0) < e / real_of_num(2)) == (real_of_num(0) < e)) && (\226\136\128 e : Real, e / real_of_num(2) + e / real_of_num(2) == e) && (\226\136\128 e : Real, real_of_num(2) * (e / real_of_num(2)) == e)
      #|  \226\136\128 x : Real, (pow(x, 2) < real_of_num(1)) == (abs(x) < real_of_num(1))
      #|  \226\136\128 x : Real, (pow(x, 2) <= real_of_num(1)) == (abs(x) <= real_of_num(1))
      #|  (pow((x : Real), 2) == real_of_num(1)) == (x == real_of_num(1) || x == -real_of_num(1))
      #|  \226\136\128 x : Real, (pow(x, 2) == real_of_num(1)) == (abs(x) == real_of_num(1))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : Num, \226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= a)
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : Real, \226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= a)
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : Num, \226\136\128 x : A, IN(x, s) \226\134\146 a <= f(x))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : Real, \226\136\128 x : A, IN(x, s) \226\134\146 a <= f(x))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  false
      #|  sum((t : (A) -> Bool), (i : A) => (d : Real) * (x : (A) -> Real)(i))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (a : Real) - (b : Real) == a - b * real_of_num(1)
      #|  (if !((a : Real) == real_of_num(0)) { a * (x : Real) } else { real_of_num(0) }) == a * x
      #|  (\226\136\128 i : A, IN(i, (t : (A) -> Bool)) \226\134\146 real_of_num(0) <= (x : (A) -> Real)(i)) && (\226\136\128 i : A, IN(i, t) \226\134\146 abs((a : (A) -> Real)(i) - (b : Real)) <= (d : Real))
      #|  FINITE((t : (A) -> Bool))
      #|  (t : (A) -> Bool) == {(i : A) | IN(i, (s : (A) -> Bool)) && !((x : (A) -> Real)(i) == real_of_num(0))}
      #|  {(x : _) | IN(x, (s : (_) -> Bool)) && !((P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x))} == {(x : _) | IN(x, {(y : _) | IN(y, s) && !Q(y)}) && !P(x)}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 d : Real, \226\136\128 a : (A) -> Real, \226\136\128 b : Real, \226\136\128 x : (A) -> Real, (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) <= x(i)) && sum(s, x) == real_of_num(1) && (\226\136\128 i : A, IN(i, s) \226\134\146 abs(a(i) - b) <= d) \226\134\146 abs(sum(s, (i : A) => a(i) * x(i)) - b) <= d
      #|  sum((t : (A) -> Bool), (i : A) => (d : Real) * (x : (A) -> Real)(i))
      #|  real_of_num(0) < (x : Real) \226\134\146 abs(x) == x
      #|  (a : Real) - (b : Real) == a - b * real_of_num(1)
      #|  (if !((a : Real) == real_of_num(0)) { a * (x : Real) } else { real_of_num(0) }) == a * x
      #|  (real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))
      #|  (\226\136\128 i : A, IN(i, (t : (A) -> Bool)) \226\134\146 real_of_num(0) < (x : (A) -> Real)(i)) && (\226\136\128 i : A, IN(i, t) \226\134\146 abs((a : (A) -> Real)(i) - (b : Real)) < (d : Real))
      #|  FINITE((t : (A) -> Bool))
      #|  (t : (A) -> Bool) == {(i : A) | IN(i, (s : (A) -> Bool)) && !((x : (A) -> Real)(i) == real_of_num(0))}
      #|  {(x : _) | IN(x, (s : (_) -> Bool)) && !((P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x))} == {(x : _) | IN(x, {(y : _) | IN(y, s) && !Q(y)}) && !P(x)}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 d : Real, \226\136\128 a : (A) -> Real, \226\136\128 b : Real, \226\136\128 x : (A) -> Real, (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) <= x(i)) && sum(s, x) == real_of_num(1) && (\226\136\128 i : A, IN(i, s) \226\134\146 abs(a(i) - b) < d) \226\134\146 abs(sum(s, (i : A) => a(i) * x(i)) - b) < d
      #|  real_of_num(0) < (d : Real) \226\134\146 (x : Real) <= d / real_of_num(2) \226\134\146 x < d
      #|  \226\136\128 P : (_) -> Bool, \226\136\128 f : (_) -> Real, (\226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x : _, f(x) < d \226\134\146 P(x))) == (\226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x : _, f(x) <= d \226\134\146 P(x)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (a <= b) == (\226\136\131 x : Real, a <= x && x <= b)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (a < b) == (\226\136\131 x : Real, a <= x && x < b)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (a < b) == (\226\136\131 x : Real, a < x && x <= b)
      #|  ((a : Real) + (b : Real)) / real_of_num(2)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (a < b) == (\226\136\131 x : Real, a < x && x < b)
      #|  (t : Real) < t + real_of_num(1)
      #|  (t : (Real) -> Bool) == {}
      #|  (s : Real) - real_of_num(1) < s
      #|  (s : (Real) -> Bool) == {}
      #|  FINITE((t : (Real) -> Bool)) \226\134\146 (\226\136\128 b : Real, IN(b, t) \226\134\146 (x : Real) < b) == (t == {} || x < inf(t))
      #|  FINITE((s : (Real) -> Bool)) \226\134\146 (\226\136\128 a : Real, IN(a, s) \226\134\146 a < (x : Real)) == (s == {} || sup(s) < x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, FINITE(s) && FINITE(t) \226\134\146 (\226\136\131 x : Real, (\226\136\128 a : Real, IN(a, s) \226\134\146 a < x) && (\226\136\128 b : Real, IN(b, t) \226\134\146 x < b)) == (\226\136\128 a : Real, \226\136\128 b : Real, IN(a, s) && IN(b, t) \226\134\146 a < b)
      #|  ((x : Real) * x + (y : Real) * y <= (x + y) * (x + y)) == (real_of_num(0) <= x * y)
      #|  pow((y : Real) + (z : Real), 2)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= x && real_of_num(0) <= y && real_of_num(0) <= z && pow(x, 2) <= pow(y, 2) + pow(z, 2) \226\134\146 x <= y + z
      #|  (i : Num) => op_dollar((x : Cart[A, N]), i)
      #|  (x : Cart[A, N])
      #|  (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (x : (Num) -> A)(i))
      #|  (x : (Num) -> A)
      #|  (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (\226\136\131 x : A, (P : (Num, A) -> Bool)(i, x))) == (\226\136\131 x : Cart[A, N], \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 P(i, (op_dollar : (Cart[A, N], Num) -> A)(x, i)))
      #|  (d : (A) -> Real)((a : A))
      #|  real_of_num(0) < inf(IMAGE((d : (A) -> Real), {(x : A) | (Q : (A) -> Bool)(x)})) && inf(IMAGE(d, {(x : A) | Q(x)})) <= d((a : A))
      #|  (a : A)
      #|  inf(IMAGE((d : (A) -> Real), {(x : A) | (Q : (A) -> Bool)(x)}))
      #|  (d : (A) -> Real)
      #|  real_of_num(1)
      #|  {(x : A) | (Q : (A) -> Bool)(x)} == {}
      #|  \226\136\128 P : (Real, A) -> Bool, \226\136\128 Q : (A) -> Bool, FINITE({(x : A) | Q(x)}) && (\226\136\128 d : Real, \226\136\128 e : Real, \226\136\128 x : A, Q(x) && real_of_num(0) < e && e < d \226\134\146 P(d, x) \226\134\146 P(e, x)) && (\226\136\128 x : A, Q(x) \226\134\146 (\226\136\131 d : Real, real_of_num(0) < d && P(d, x))) \226\134\146 (\226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x : A, Q(x) \226\134\146 P(d, x)))
      #|  \226\136\128 s : (_) -> Bool, HAS_SIZE(s, 1) == existsunique((x : _) => IN(x, s))
      #|  !((a : Real) == real_of_num(0)) \226\134\146 (a * (x : Real) == (b : Real)) == (x == b / a)
      #|  (b : Real) == real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\131 x : Real, a * x == b) == (a == real_of_num(0) \226\134\146 b == real_of_num(0))
      #|  !((a : Real) == real_of_num(0)) \226\134\146 (a * (x : Real) + (b : Real) * (y : Real) == (u : Real) && (c : Real) * x + (d : Real) * y == (v : Real)) == (x == (u - b * y) / a && (a * d - b * c) * y == a * v - c * u)
      #|  (u : Real) == real_of_num(0) && (v : Real) == real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, \226\136\128 u : Real, \226\136\128 v : Real, (\226\136\131 x : Real, \226\136\131 y : Real, a * x + b * y == u && c * x + d * y == v) == ((a * d == b * c \226\134\146 d * u == b * v && c * u == a * v) && (a == real_of_num(0) && b == real_of_num(0) && c == real_of_num(0) && d == real_of_num(0) \226\134\146 u == real_of_num(0) && v == real_of_num(0)))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  false
      #|  (is_realinterval : ((Real) -> Bool) -> Bool)((s : (Real) -> Bool)) == (\226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, IN(a, s) && IN(b, s) && a <= c && c <= b \226\134\146 IN(c, s))
      #|  is_realinterval({})
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, is_realinterval(s) && is_realinterval(t) && !(INTER(s, t) == {}) \226\134\146 is_realinterval(UNION(s, t))
      #|  is_realinterval(UNIV)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, is_realinterval(s) && is_realinterval(t) \226\134\146 is_realinterval(INTER(s, t))
      #|  (open_real_interval : ((Real, Real), Real) -> Bool)(((a : Real), (b : Real))) == {(x : Real) | a < x && x < b}
      #|  (closed_real_interval : (List[(Real, Real)], Real) -> Bool)([((a : Real), (b : Real))]) == {(x : Real) | a <= x && x <= b}
      #|  :A
      #|  open_real_interval
      #|  closed_real_interval
      #|  real_interval(((a : Real), (b : Real))) == {(x : Real) | a < x && x < b} && real_interval([(a, b)]) == {(x : Real) | a <= x && x <= b}
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 x : Real, IN(x, real_interval([(a, b)])) == (a <= x && x <= b) && IN(x, real_interval((a, b))) == (a < x && x < b)
      #|  {} == real_interval([(real_of_num(1), real_of_num(0))])
      #|  \226\136\128 a : Real, \226\136\128 b : Real, SUBSET(real_interval((a, b)), real_interval([(a, b)]))
      #|  (\226\136\128 a : Real, \226\136\128 b : Real, (real_interval([(a, b)]) == {}) == (b < a)) && (\226\136\128 a : Real, \226\136\128 b : Real, (real_interval((a, b)) == {}) == (b <= a))
      #|  (\226\136\128 a : Real, \226\136\128 b : Real, !(real_interval([(a, b)]) == {}) == (a <= b)) && (\226\136\128 a : Real, \226\136\128 b : Real, !(real_interval((a, b)) == {}) == (a < b))
      #|  \226\136\128 a : Real, real_interval([(a, a)]) == {a} && real_interval((a, a)) == {}
      #|  (\226\136\128 a : Real, \226\136\128 b : Real, IN(a, real_interval([(a, b)])) == !(real_interval([(a, b)]) == {})) && (\226\136\128 a : Real, \226\136\128 b : Real, IN(b, real_interval([(a, b)])) == !(real_interval([(a, b)]) == {})) && (\226\136\128 a : Real, \226\136\128 b : Real, !IN(a, real_interval((a, b)))) && (\226\136\128 a : Real, \226\136\128 b : Real, !IN(b, real_interval((a, b))))
      #|  (\226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 x : Real, IN(-x, real_interval([(-b, -a)])) == IN(x, real_interval([(a, b)]))) && (\226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 x : Real, IN(-x, real_interval((-b, -a))) == IN(x, real_interval((a, b))))
      #|  ((x : Real) == -(y : Real)) == (-x == y)
      #|  (\226\136\128 a : Real, \226\136\128 b : Real, IMAGE(op_minus_minus, real_interval([(a, b)])) == real_interval([(-b, -a)])) && (\226\136\128 a : Real, \226\136\128 b : Real, IMAGE(op_minus_minus, real_interval((a, b))) == real_interval((-b, -a)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, is_realinterval(real_interval((a, b))) && is_realinterval(real_interval([(a, b)]))
      #|  IN(real_of_num(0), real_interval([(real_of_num(0), real_of_num(1))])) && IN(real_of_num(1), real_interval([(real_of_num(0), real_of_num(1))]))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, INTER(real_interval([(a, b)]), real_interval([(c, d)])) == real_interval([(max(a, c), min(b, d))])
      #|  \226\136\128 a : Real, \226\136\128 b : Real, real_interval((a, b)) == DIFF(real_interval([(a, b)]), {a, b})
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a <= b \226\134\146 real_interval([(a, b)]) == UNION(real_interval((a, b)), {a, b})
      #|  \226\136\128 a : Real, is_realinterval({a})
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, is_realinterval(s) && IN(a, s) && IN(b, s) \226\134\146 SUBSET(real_interval([(a, b)]), s)
      #|  (a : Real) <= (x : Real) && x <= (b : Real) && abs(a) < real_of_num(1) && abs(b) < real_of_num(1) \226\134\146 abs(x) < real_of_num(1)
      #|  (q : Bool) == (r : Bool) && (p : Bool) \226\134\146 (p && q) == r
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool)) == ((p \226\134\146 q) && (p \226\134\146 r))
      #|  (\226\136\131 x : Real, x / (real_of_num(1) + abs(x)) == (c : Real) && IN(x, (s : (Real) -> Bool))) == ((\226\136\131 x : Real, x / (real_of_num(1) + abs(x)) == c) && (\226\136\128 x : Real, x / (real_of_num(1) + abs(x)) == c \226\134\146 IN(x, s)))
      #|  IN((y : _), IMAGE((f : (_) -> _), (s : (_) -> Bool))) == (\226\136\131 x : _, f(x) == y && IN(x, s))
      #|  \226\136\128 s : (Real) -> Bool, is_realinterval(IMAGE((x : Real) => x / (real_of_num(1) + abs(x)), s)) == is_realinterval(s)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, SUBSET(real_interval([(a, b)]), real_interval([(c, d)])) == (b < a || c <= a && a <= b && b <= d) && SUBSET(real_interval([(a, b)]), real_interval((c, d))) == (b < a || c < a && a <= b && b < d) && SUBSET(real_interval((a, b)), real_interval([(c, d)])) == (b <= a || c <= a && a < b && b <= d) && SUBSET(real_interval((a, b)), real_interval((c, d))) == (b <= a || c <= a && a < b && b <= d)
      #|  (max((d : Real), (a : Real)) + (b : Real)) / real_of_num(2)
      #|  ((a : Real) + min((b : Real), (c : Real))) / real_of_num(2)
      #|  (max((d : Real), (a : Real)) + (b : Real)) / real_of_num(2)
      #|  ((a : Real) + min((b : Real), (c : Real))) / real_of_num(2)
      #|  (max((d : Real), (a : Real)) + (b : Real)) / real_of_num(2)
      #|  ((a : Real) + min((b : Real), (c : Real))) / real_of_num(2)
      #|  (max((d : Real), (a : Real)) + (b : Real)) / real_of_num(2)
      #|  ((a : Real) + min((b : Real), (c : Real))) / real_of_num(2)
      #|  (vectorize : (Cart[Cart[A, N], M]) -> Cart[A, Finite_prod[M, N]]) == ((x : Cart[Cart[A, N], M]) => (lambda : ((Num) -> A) -> Cart[A, Finite_prod[M, N]])((i : Num) => (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])(x, 1 + DIV(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))), 1 + MOD(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))))
      #|  (matrify : (Cart[A, Finite_prod[M, N]]) -> Cart[Cart[A, N], M]) == ((x : Cart[A, Finite_prod[M, N]]) => (lambda : ((Num) -> Cart[A, N]) -> Cart[Cart[A, N], M])((i : Num) => (lambda : ((Num) -> A) -> Cart[A, N])((j : Num) => (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)(x, (i - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + j))))
      #|  \226\136\128 m : Cart[Cart[A, N], M], \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)((vectorize : (Cart[Cart[A, N], M]) -> Cart[A, Finite_prod[M, N]])(m), i) == (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])(m, 1 + DIV(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))), 1 + MOD(i - 1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))
      #|  \226\136\128 v : Cart[A, Finite_prod[M, N]], \226\136\128 i : Num, \226\136\128 j : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) && 1 <= j && j <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (op_dollar : (Cart[A, N], Num) -> A)((op_dollar : (Cart[Cart[A, N], M], Num) -> Cart[A, N])((matrify : (Cart[A, Finite_prod[M, N]]) -> Cart[Cart[A, N], M])(v), i), j) == (op_dollar : (Cart[A, Finite_prod[M, N]], Num) -> A)(v, (i - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + j)
      #|  1 <= (i : Num) && i - 1 == (d : Num) * (n : Num) + (m : Num) && m < n \226\134\146 d * n + (1 + m) == i
      #|  (1 <= 1 + (x : Num) && 1 + (y : Num) <= (z : Num)) == (y < z)
      #|  (1 <= 1 + (x : Num) && 1 + (y : Num) <= (z : Num)) == (y < z)
      #|  (i : Num)
      #|  \226\136\128 a : Cart[A, Finite_prod[M, N]], vectorize(matrify(a)) == a
      #|  (i : Num) - 1
      #|  (j : Num) - 1
      #|  1 <= (i : Num) && (j : Num) == i - 1 \226\134\146 1 + j == i
      #|  (x : Num) * (n : Num) + n == (x + 1) * n
      #|  ((i : Num) - 1) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))
      #|  (j : Num)
      #|  (i : Num)
      #|  \226\136\128 m : Cart[Cart[A, N], M], matrify(vectorize(m)) == m
      #|  \226\136\128 P : (Cart[_, Finite_prod[_, _]]) -> Bool, (\226\136\128 x : Cart[_, Finite_prod[_, _]], P(x)) == (\226\136\128 x : Cart[Cart[_, _], _], P(vectorize(x)))
      #|  \226\136\128 P : (Cart[Cart[_, _], _]) -> Bool, (\226\136\128 x : Cart[Cart[_, _], _], P(x)) == (\226\136\128 x : Cart[_, Finite_prod[_, _]], P(matrify(x)))
      #|  \226\136\128 P : (Cart[_, Finite_prod[_, _]]) -> Bool, (\226\136\131 x : Cart[_, Finite_prod[_, _]], P(x)) == (\226\136\131 x : Cart[Cart[_, _], _], P(vectorize(x)))
      #|  \226\136\128 P : (Cart[Cart[_, _], _]) -> Bool, (\226\136\131 x : Cart[Cart[_, _], _], P(x)) == (\226\136\131 x : Cart[_, Finite_prod[_, _]], P(matrify(x)))
      #|  \226\136\128 P : (Cart[Cart[A, N], M]) -> Bool, {vectorize((m : Cart[Cart[A, N], M])) | P(m)} == {(v : Cart[A, Finite_prod[M, N]]) | P(matrify(v))}
      #|  \226\136\128 m1 : Cart[Cart[Real, N], M], \226\136\128 m2 : Cart[Cart[Real, N], M], (vectorize(m1) == vectorize(m2)) == (m1 == m2)
      #|  \226\136\128 m1 : Cart[Real, Finite_prod[M, N]], \226\136\128 m2 : Cart[Real, Finite_prod[M, N]], (matrify(m1) == matrify(m2)) == (m1 == m2)
      #|  (hull : (((_) -> Bool) -> Bool, (_) -> Bool, _) -> Bool)((P : ((_) -> Bool) -> Bool), (s : (_) -> Bool)) == INTERS({(t : (_) -> Bool) | P(t) && SUBSET(s, t)})
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, P(s) \226\134\146 hull(P, s) == s
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 P(s)) \226\134\146 P(INTERS(f))) \226\134\146 P(hull(P, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 P(s)) \226\134\146 P(INTERS(f))) \226\134\146 (hull(P, s) == s) == P(s)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, hull(P, hull(P, s)) == hull(P, s)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, SUBSET(s, hull(P, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(s, t) \226\134\146 SUBSET(hull(P, s), hull(P, t))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 Q : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, SUBSET(P, Q) \226\134\146 SUBSET(hull(Q, s), hull(P, s))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, hull(P, UNIV) == UNIV
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(s, t) && P(t) \226\134\146 SUBSET(hull(P, s), t)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, P(t) \226\134\146 SUBSET(hull(P, s), t) == SUBSET(s, t)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(s, t) && P(t) && (\226\136\128 t' : (_) -> Bool, SUBSET(s, t') && P(t') \226\134\146 SUBSET(t, t')) \226\134\146 hull(P, s) == t
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(UNION(hull(P, s), hull(P, t)), hull(P, UNION(s, t)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(hull(P, s), hull(P, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(hull(P, s), t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, hull(P, UNION(s, t)) == hull(P, UNION(s, hull(P, t)))
      #|  INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 a : _, \226\136\128 s : (_) -> Bool, hull(P, INSERT(a, s)) == hull(P, INSERT(a, hull(P, s)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 a : _, \226\136\128 s : (_) -> Bool, IN(a, hull(P, s)) == (hull(P, INSERT(a, s)) == hull(P, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 a : _, \226\136\128 s : (_) -> Bool, IN(a, hull(P, s)) \226\134\146 hull(P, INSERT(a, s)) == hull(P, s)
      #|  {(x : A) | (p : (A) -> Bool)(x)}
      #|  (s : (A) -> Bool)
      #|  (P : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 p : (A) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 p(x)) && P({(x : A) | p(x)}) \226\134\146 (\226\136\128 x : A, IN(x, hull(P, s)) \226\134\146 p(x))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 x : _, IN(x, s) \226\134\146 IN(x, hull(P, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, P(hull(P, s)) && (\226\136\128 s : (_) -> Bool, P(s) \226\134\146 P(IMAGE(f, s))) \226\134\146 SUBSET(hull(P, IMAGE(f, s)), IMAGE(f, hull(P, s)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 g : (_) -> _, \226\136\128 s : (_) -> Bool, (\226\136\128 s : (_) -> Bool, P(hull(P, s))) && (\226\136\128 s : (_) -> Bool, P(s) \226\134\146 P(IMAGE(f, s))) && (\226\136\128 s : (_) -> Bool, P(s) \226\134\146 P(IMAGE(g, s))) && (\226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(s, IMAGE(g, t)) == SUBSET(IMAGE(f, s), t)) \226\134\146 hull(P, IMAGE(f, s)) == IMAGE(f, hull(P, s))
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> A)
      #|  (g : (A) -> A)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 f : (A) -> A, \226\136\128 s : (A) -> Bool, (\226\136\128 s : (A) -> Bool, P(hull(P, s))) && (\226\136\128 s : (A) -> Bool, P(IMAGE(f, s)) == P(s)) && (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) && (\226\136\128 y : A, \226\136\131 x : A, f(x) == y) \226\134\146 hull(P, IMAGE(f, s)) == IMAGE(f, hull(P, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 P(s)) \226\134\146 P(INTERS(f))) \226\134\146 P(s) == (\226\136\131 t : (_) -> Bool, s == hull(P, t))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 P(s)) \226\134\146 P(INTERS(f))) && SUBSET(s, hull(P, t)) && SUBSET(t, hull(P, s)) \226\134\146 hull(P, s) == hull(P, t)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 Q : ((_) -> Bool) -> Bool, (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 P(s)) \226\134\146 P(INTERS(f))) && (\226\136\128 f : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, IN(s, f) \226\134\146 Q(s)) \226\134\146 Q(INTERS(f))) && (\226\136\128 s : (_) -> Bool, Q(s) \226\134\146 Q(hull(P, s))) \226\134\146 hull((x : (_) -> Bool) => P(x) && Q(x), (s : (_) -> Bool)) == hull(P, hull(Q, s))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : ((_) -> Bool) -> Bool, SUBSET(UNIONS({hull(P, (s : (_) -> Bool)) | IN(s, f)}), hull(P, UNIONS(f)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : ((_) -> Bool) -> Bool, SUBSET(hull(P, INTERS(f)), INTERS({hull(P, (s : (_) -> Bool)) | IN(s, f)}))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, SUBSET(hull(P, INTER(s, t)), INTER(hull(P, s), hull(P, t)))
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\128 d : Real, \226\136\128 e : Real, d < e && P(d) \226\134\146 P(e)) && (\226\136\128 n : Num, !(n == 0) \226\134\146 P(inv(real_of_num(n)))) \226\134\146 (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 P(e))
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\128 d : Real, \226\136\128 e : Real, d < e && P(d) \226\134\146 P(e)) && (\226\136\128 n : Num, P(inv(real_of_num(n) + real_of_num(1)))) \226\134\146 (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 P(e))
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\128 d : Real, \226\136\128 e : Real, d < e && P(d) \226\134\146 P(e)) \226\134\146 (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 P(e)) == (\226\136\128 n : Num, !(n == 0) \226\134\146 P(inv(real_of_num(n))))
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\128 d : Real, \226\136\128 e : Real, d < e && P(d) \226\134\146 P(e)) \226\134\146 (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 P(e)) == (\226\136\128 n : Num, P(inv(real_of_num(n) + real_of_num(1))))
      #|  (n : Num) == 0
      #|  (c : Real)
      #|  \226\136\128 x : Real, \226\136\128 c : Real, real_of_num(0) <= x && real_of_num(0) <= c && (\226\136\128 m : Num, 0 < m \226\134\146 real_of_num(m) * x <= c) \226\134\146 x == real_of_num(0)
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  (a : A)
      #|  1
      #|  (s : (A) -> Bool)
      #|  op_dot_dot(1, CARD((s : (A) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) && IN(a, s) \226\134\146 (\226\136\131 f : (Num) -> A, (\226\136\128 i : Num, \226\136\128 j : Num, IN(i, op_dot_dot(1, CARD(s))) && IN(j, op_dot_dot(1, CARD(s))) && f(i) == f(j) \226\134\146 i == j) && s == IMAGE(f, op_dot_dot(1, CARD(s))) && f(1) == a)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, (real_of_num(1) - x) * sum(op_dot_dot(0, n), (i : Num) => pow(x, i)) == real_of_num(1) - pow(x, SUC(n))
      #|  (m : Num) <= (n : Num) \226\134\146 SUC(n - m) + m == SUC(n)
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 (real_of_num(1) - x) * sum(op_dot_dot(m, n), (i : Num) => pow(x, i)) == pow(x, m) - pow(x, SUC(n))
      #|  real_of_num(1) - (x : Real)
      #|  (n : Num) < (m : Num) || !(n < m) && m <= n
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (i : Num) => pow(x, i)) == (if n < m { real_of_num(0) } else { if x == real_of_num(1) { real_of_num(n + 1 - m) } else { (pow(x, m) - pow(x, SUC(n))) / (real_of_num(1) - x) } })
      #|  !((m : Num) + (n : Num) < m)
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, m + n), (i : Num) => pow(x, i)) == (if x == real_of_num(1) { real_of_num(n) + real_of_num(1) } else { pow(x, m) * ((real_of_num(1) - pow(x, SUC(n))) / (real_of_num(1) - x)) })
      #|  (from : (Num, Num) -> Bool)((n : Num)) == {(m : Num) | n <= m}
      #|  from(0) == UNIV
      #|  \226\136\128 m : Num, \226\136\128 n : Num, IN(m, from(n)) == (n <= m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, SUBSET(from(m), from(n)) == (n <= m)
      #|  \226\136\128 k : Num, \226\136\128 m : Num, \226\136\128 n : Num, INTER(from(k), op_dot_dot(m, n)) == (if m < k { op_dot_dot(k, n) } else { op_dot_dot(m, n) })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, INTER(from(p), op_dot_dot(m, n)) == op_dot_dot(MAX(p, m), n)
      #|  \226\136\128 k : Num, \226\136\128 n : Num, INTER(from(k), op_dot_dot(0, n)) == op_dot_dot(k, n)
      #|  from((n : Num)) == DIFF(UNIV, {(i : Num) | i < n})
      #|  \226\136\128 n : Num, INFINITE(from(n))
      #|  \226\136\128 s : (Num) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, FINITE(INTER(s, op_dot_dot(m, n)))
      #|  \226\136\128 n : Num, !(from(n) == {})
      #|  1
      #|  (x : Real) * ((c : Real) * (y : Real)) == c * (x * y)
      #|  sum(op_dot_dot(0, 0), (i : Num) => (c : (Num) -> Real)(i) * pow((x : Real), i)) == c(0) && sum(op_dot_dot(0, SUC((n : Num))), (i : Num) => c(i) * pow(x, i)) == c(0) + x * sum(op_dot_dot(0, n), (i : Num) => c(i + 1) * pow(x, i))
      #|  (n : Num) < SUC(n)
      #|  \226\136\128 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) == (\226\136\128 n : Num, r(n) < r(SUC(n)))
      #|  \226\136\128 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, (r(m) == r(n)) == (m == n))
      #|  (n : Num) <= (m : Num) && m < (p : Num) \226\134\146 SUC(n) <= p
      #|  \226\136\128 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) \226\134\146 (\226\136\128 n : Num, n <= r(n))
      #|  \226\136\128 s : (Num) -> Bool, INFINITE(s) \226\134\146 (\226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && (\226\136\128 n : Num, IN(r(n), s)))
      #|  IMAGE((r : (Num) -> Num), UNIV)
      #|  \226\136\128 s : (Num) -> Bool, INFINITE(s) == (\226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && (\226\136\128 n : Num, IN(r(n), s)))
      #|  \226\136\128 n : Num, (N : Num) < (r : (Num) -> Num)(n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (r : (Num) -> Num)(n) <= m \226\134\146 (s : (Num) -> Real)(m) <= s(r(n))
      #|  (r : (Num) -> Num)(0) == (next : (Num) -> Num)(SUC((N : Num))) && (\226\136\128 n : Num, r(SUC(n)) == next(r(n)))
      #|  (next : (Num) -> Num)
      #|  (N : Num)
      #|  (N : Num) == 0
      #|  \226\136\128 n : Num, \226\136\131 p : Num, n < p && (\226\136\128 m : Num, p <= m \226\134\146 (s : (Num) -> Real)(m) <= s(p))
      #|  \226\136\128 s : (Num) -> Real, \226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && ((\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 s(r(m)) <= s(r(n))) || (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 s(r(n)) <= s(r(m))))
      #|  (x : Real) <= (y : Real) && y <= (l : Real) && !(x <= l - (e : Real)) \226\134\146 abs(y - l) < e
      #|  real_of_num(0) < (e : Real) \226\134\146 !((l : Real) <= l - e)
      #|  (l : Real) - (e : Real)
      #|  (e : Real)
      #|  (l : Real)
      #|  abs((x : Real)) <= (b : Real) \226\134\146 x <= b
      #|  (x : Real) => \226\136\131 n : Num, (s : (Num) -> Real)(n) == x
      #|  \226\136\128 s : (Num) -> Real, \226\136\128 b : Real, (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 s(m) <= s(n)) && (\226\136\128 n : Num, abs(s(n)) <= b) \226\134\146 (\226\136\131 l : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 abs(s(n) - l) < e))
      #|  abs((x : Real) - -(l : Real)) == abs(-x - l)
      #|  (n : Num) => -(s : (Num) -> Real)(n)
      #|  \226\136\128 s : (Num) -> Real, \226\136\128 b : Real, (\226\136\128 n : Num, abs(s(n)) <= b) && ((\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 s(m) <= s(n)) || (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 s(n) <= s(m))) \226\134\146 (\226\136\131 l : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 abs(s(n) - l) < e))
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 f : (Real) -> Real, (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x < y \226\134\146 f(x) < f(y)) == ((\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x <= y \226\134\146 f(x) <= f(y)) && (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && f(x) == f(y) \226\134\146 x == y))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  false
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 f : (Real) -> Real, (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x < y \226\134\146 f(y) < f(x)) == ((\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x <= y \226\134\146 f(y) <= f(x)) && (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && f(x) == f(y) \226\134\146 x == y))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  false
      #|  (v : Real) == (z : Real)
      #|  (v : Real) == (w : Real)
      #|  (u : Real) == (z : Real)
      #|  (u : Real) == (w : Real)
      #|  (a : Real) < (b : Real) \226\134\146 !(b < a)
      #|  (P : (Real) -> Bool)((v : Real)) || P((z : Real)) \226\134\146 (\226\136\131 x : Real, P(x))
      #|  (P : (_, _) -> Bool)((w : _), (u : _)) || P(w, (v : _)) || P(w, (z : _)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  (P : (Real) -> Bool)((v : Real)) || P((z : Real)) \226\134\146 (\226\136\131 x : Real, P(x))
      #|  (P : (_, _) -> Bool)((u : _), (v : _)) || P(u, (w : _)) || P(u, (z : _)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  (P : (_, _, _) -> Bool)((w : _), (v : _), (z : _)) || P(w, z, v) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, \226\136\131 z : _, P(x, y, z))
      #|  (u : Real) == (w : Real) || u < w || w < u
      #|  (z : Real)
      #|  (w : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  ((x : Real) <= (y : Real) && (f : (Real) -> Real)(y) < f(x)) == (x < y && f(y) < f(x)) && (x <= y && f(x) < f(y)) == (x < y && f(x) < f(y))
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 f : (Real) -> Real, ((\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x <= y \226\134\146 f(x) <= f(y)) || (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) && x <= y \226\134\146 f(y) <= f(x))) == !(\226\136\131 x : Real, \226\136\131 y : Real, \226\136\131 z : Real, P(x) && P(y) && P(z) && x < y && y < z && (f(x) < f(y) && f(z) < f(y) || f(y) < f(x) && f(y) < f(z)))
      #|  (i : Num)
      #|  (i : Num)
      #|  (j : Num)
      #|  (kk : (Num, (Num) -> A, Num) -> Num)(SUC((p : Num) + (d : Num)), o((r : (Num) -> A), (rr : (Num, Num) -> Num)(p + d)), (i : Num))
      #|  (i : Num)
      #|  (d : Num)
      #|  (p : Num)
      #|  \226\136\128 p : Num, \226\136\128 d : Num, \226\136\128 i : Num, \226\136\131 j : Num, i <= j && (rr : (Num, Num) -> Num)(p + d, i) == rr(p, j)
      #|  (i : Num)
      #|  (rr : (Num, Num) -> Num)((i : Num))
      #|  (i : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 i : Num, n <= m \226\134\146 (\226\136\131 j : Num, i <= j && (rr : (Num, Num) -> Num)(m, i) == rr(n, j))
      #|  (rr : (Num, Num) -> Num)((n : Num), (m : Num))
      #|  (n : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (i : Num) + (d : Num)
      #|  \226\136\128 f : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 f(m) < f(n)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 f(m) <= f(n))
      #|  (j : Num)
      #|  (j : Num)
      #|  \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, i <= j \226\134\146 (rr : (Num, Num) -> Num)(i, n) <= rr(j, n)
      #|  (\226\136\128 i : Num, \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 (rr : (Num, Num) -> Num)(i, m) < rr(i, n)) && (\226\136\128 i : Num, (P : (Num, (Num) -> A) -> Bool)(i, o((r : (Num) -> A), rr(i))))
      #|  (n : Num) => (rr : (Num, Num) -> Num)(n, n)
      #|  (rr : (Num, Num) -> Num)(0) == (kk : (Num, (Num) -> A, Num) -> Num)(0, (r : (Num) -> A)) && (\226\136\128 n : Num, rr(SUC(n)) == o(rr(n), kk(SUC(n), o(r, rr(n)))))
      #|  (r : (Num) -> A)
      #|  (kk : (Num, (Num) -> A, Num) -> Num)
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool)) == ((p \226\134\146 q) && (p \226\134\146 r))
      #|  \226\136\128 P : (Num, (Num) -> A) -> Bool, (\226\136\128 i : Num, \226\136\128 r : (Num) -> A, \226\136\131 k : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 k(m) < k(n)) && P(i, o(r, k))) && (\226\136\128 i : Num, \226\136\128 r : (Num) -> A, \226\136\128 k1 : (Num) -> Num, \226\136\128 k2 : (Num) -> Num, \226\136\128 N : Num, P(i, o(r, k1)) && (\226\136\128 j : Num, N <= j \226\134\146 (\226\136\131 j' : Num, j <= j' && k2(j) == k1(j'))) \226\134\146 P(i, o(r, k2))) \226\134\146 (\226\136\128 r : (Num) -> A, \226\136\131 k : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 k(m) < k(n)) && (\226\136\128 i : Num, P(i, o(r, k))))
      #|  UNION(IMAGE((n : Num) => real_of_num(n), UNIV), IMAGE((n : Num) => -real_of_num(n), UNIV))
      #|  COUNTABLE(integer)
      #|  real_of_num
      #|  (op_eq_us_c : ((Real) -> Bool, (Num) -> Bool) -> Bool)(integer, (UNIV : (Num) -> Bool))
      #|  IMAGE(GABS((f : ((Real, Real)) -> Real) => \226\136\128 x : Real, \226\136\128 y : Real, GEQ(f((x, y)), x / y)), CROSS(integer, integer))
      #|  COUNTABLE(rational)
      #|  real_of_num
      #|  (op_eq_us_c : ((Real) -> Bool, (Num) -> Bool) -> Bool)(rational, (UNIV : (Num) -> Bool))
      #|  {(x : _) | (P : (_) -> Bool)(x)} == P
      #|  (COUNTABLE : ((Cart[Real, N]) -> Bool) -> Bool)({(x : Cart[Real, N]) | \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 integer((op_dollar : (Cart[Real, N], Num) -> Real)(x, i))})
      #|  {(x : _) | (P : (_) -> Bool)(x)} == P
      #|  (COUNTABLE : ((Cart[Real, N]) -> Bool) -> Bool)({(x : Cart[Real, N]) | \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 rational((op_dollar : (Cart[Real, N], Num) -> Real)(x, i))})
      #|  (z : Real) == (q : Real) - (q - z)
      #|  !rational((z : Real))
      #|  (q : Real) - (z : Real) - (x : Real) == q - (z + x)
      #|  (q : Real) - (z : Real)
      #|  (q : Real)
      #|  (e : Real)
      #|  (z : Real) + (x : Real)
      #|  !((s : (Real) -> Bool) == UNIV) \226\134\146 (\226\136\131 z : Real, !s(z))
      #|  \226\136\131 z : Real, !rational(z)
      #|  \226\136\128 x : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 y : Real, !rational(y) && abs(y - x) < e)
      #|  ((b : Real) - (a : Real)) / real_of_num(4)
      #|  ((a : Real) + (b : Real)) / real_of_num(2)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a < b \226\134\146 (\226\136\131 q : Real, !rational(q) && a < q && q < b)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\131 q : Real, !rational(q) && a < q && q < b) == (a < b)
      #|  (e : Real) / real_of_num(4)
      #|  (x : Real) + (e : Real) / real_of_num(4)
      #|  (e : Real) / real_of_num(4)
      #|  (x : Real) - (e : Real) / real_of_num(4)
      #|  \226\136\128 x : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 a : Real, \226\136\131 b : Real, !rational(a) && !rational(b) && a < x && x < b && abs(b - a) < e)
      #|  (e : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 q : Real, !rational(q) && x < q && q < x + e)
      #|  (e : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 q : Real, !rational(q) && x - e < q && q < x)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 (q : (Num) -> Real)(n) < q(m)
      #|  IMAGE((q : (Num) -> Real), UNIV)
      #|  \226\136\131 q : (Num) -> Real, (\226\136\128 n : Num, !rational(q(n)) && (a : Real) < q(n) && q(n) < (b : Real)) && (\226\136\128 n : Num, q(SUC(n)) < q(n))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a < b \226\134\146 INFINITE({(q : Real) | !rational(q) && a < q && q < b})
      #|  (x : Real)
      #|  (g : Real)
      #|  (a : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  IMAGE(fn { (a, b) => sup({(f : (Real) -> Real)((x : Real)) | a <= x && x <= b}) }, INTER(CROSS(rational, rational), {((a : Real), (b : Real)) | \226\136\131 x : Real, a < x && x < b && (\226\136\128 x' : Real, a <= x' && x' <= b \226\134\146 f(x') <= f(x))}))
      #|  \226\136\128 f : (Real) -> Real, COUNTABLE({f(x) | x : Real | \226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x' : Real, abs(x' - x) < d \226\134\146 f(x') <= f(x))})
      #|  o(op_minus_minus, (f : (Real) -> Real))
      #|  \226\136\128 f : (Real) -> Real, COUNTABLE({f(x) | x : Real | \226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x' : Real, abs(x' - x) < d \226\134\146 f(x) <= f(x'))})
      #|  (P : (_) -> Bool)((x : _)) && (\226\136\128 x : _, \226\136\128 y : _, P(x) && P(y) \226\134\146 x == y) \226\134\146 x == select((y : _) => P(y)) && (\226\136\131 y : _, P(y))
      #|  (g : Real)
      #|  (a : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  IMAGE(fn { (a, b) => select((x : Real) => a < x && x < b && (\226\136\128 x' : Real, a <= x' && x' <= b && !(x' == x) \226\134\146 (f : (Real) -> Real)(x') < f(x))) }, INTER(CROSS(rational, rational), {((a : Real), (b : Real)) | \226\136\131 x : Real, a < x && x < b && (\226\136\128 x' : Real, a <= x' && x' <= b && !(x' == x) \226\134\146 f(x') < f(x))}))
      #|  \226\136\128 f : (Real) -> Real, COUNTABLE({(x : Real) | \226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x' : Real, abs(x' - x) < d && !(x' == x) \226\134\146 f(x') < f(x))})
      #|  o(op_minus_minus, (f : (Real) -> Real))
      #|  \226\136\128 f : (Real) -> Real, COUNTABLE({(x : Real) | \226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 x' : Real, abs(x' - x) < d && !(x' == x) \226\134\146 f(x) < f(x'))})
      #|  (relative_to : (((_) -> Bool) -> Bool, (_) -> Bool, (_) -> Bool) -> Bool)((P : ((_) -> Bool) -> Bool), (s : (_) -> Bool), (t : (_) -> Bool)) == (\226\136\131 u : (_) -> Bool, P(u) && INTER(s, u) == t)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, relative_to(P, UNIV, s) == P(s)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, relative_to(P, s, t) \226\134\146 SUBSET(t, s)
      #|  (\226\136\128 s : (_) -> Bool, relative_to((P : ((_) -> Bool) -> Bool), (u : (_) -> Bool), s) \226\134\146 (Q : ((_) -> Bool) -> Bool)(s)) == (\226\136\128 s : (_) -> Bool, P(s) \226\134\146 Q(INTER(u, s)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 u : (_) -> Bool, \226\136\128 s : (_) -> Bool, P(s) \226\134\146 relative_to(P, u, INTER(u, s))
      #|  relative_to((P : ((_) -> Bool) -> Bool), (u : (_) -> Bool)) == {INTER(u, (s : (_) -> Bool)) | P(s)}
      #|  INTER(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (s' : (_) -> Bool)) == INTER(t, INTER(s, s'))
      #|  {(f : (_) -> _)((x : _)) | {(g : (_) -> _)((y : _)) | (P : (_) -> Bool)(y)}(x)} == {f(g((y : _))) | P(y)}
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, relative_to(relative_to(P, s), t) == relative_to(P, INTER(s, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, \226\136\128 s : (A) -> Bool, SUBSET(s, u) \226\134\146 relative_to(P, u, DIFF(u, s)) == relative_to((c : (A) -> Bool) => P(DIFF(UNIV, c)), u, s)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) && P(s) \226\134\146 relative_to(P, t, s)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, relative_to(P, u, s) && SUBSET(s, t) && SUBSET(t, u) \226\134\146 relative_to(P, t, s)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 Q : ((_) -> Bool) -> Bool, (\226\136\128 s : (_) -> Bool, P(s) \226\134\146 Q(s)) \226\134\146 (\226\136\128 u : (_) -> Bool, relative_to(P, u, (s : (_) -> Bool)) \226\134\146 relative_to(Q, u, s))
      #|  SUBSET((s : (_) -> Bool), (u : (_) -> Bool)) \226\134\146 INTER(u, s) == s
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, \226\136\128 s : (A) -> Bool, SUBSET(s, u) && P(s) \226\134\146 relative_to(P, u, s)
      #|  INTER((c' : (A) -> Bool), (d' : (A) -> Bool))
      #|  (d' : (A) -> Bool)
      #|  (c' : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 c : (A) -> Bool, \226\136\128 d : (A) -> Bool, P(c) && P(d) \226\134\146 P(INTER(c, d))) \226\134\146 (\226\136\128 c : (A) -> Bool, \226\136\128 d : (A) -> Bool, relative_to(P, s, c) && relative_to(P, s, d) \226\134\146 relative_to(P, s, INTER(c, d)))
      #|  UNION((c' : (A) -> Bool), (d' : (A) -> Bool))
      #|  (d' : (A) -> Bool)
      #|  (c' : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 c : (A) -> Bool, \226\136\128 d : (A) -> Bool, P(c) && P(d) \226\134\146 P(UNION(c, d))) \226\134\146 (\226\136\128 c : (A) -> Bool, \226\136\128 d : (A) -> Bool, relative_to(P, s, c) && relative_to(P, s, d) \226\134\146 relative_to(P, s, UNION(c, d)))
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(UNION_OF(ARBITRARY, P), u) == UNION_OF(ARBITRARY, relative_to(P, u))
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(UNION_OF(FINITE, P), u) == UNION_OF(FINITE, relative_to(P, u))
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  UNIONS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(UNION_OF(COUNTABLE, P), u) == UNION_OF(COUNTABLE, relative_to(P, u))
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(INTERSECTION_OF(ARBITRARY, P), u) == relative_to(INTERSECTION_OF(ARBITRARY, relative_to(P, u)), u)
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(INTERSECTION_OF(FINITE, P), u) == relative_to(INTERSECTION_OF(FINITE, relative_to(P, u)), u)
      #|  IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool))
      #|  INTERS(IMAGE((g : ((A) -> Bool, A) -> Bool), (f : ((A) -> Bool) -> Bool)))
      #|  (g : ((A) -> Bool, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  INTER((u : (_) -> Bool), INTER(u, (s : (_) -> Bool))) == INTER(u, s)
      #|  {INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))}
      #|  INTERS({INTER((u : (A) -> Bool), (c : (A) -> Bool)) | IN(c, (f : ((A) -> Bool) -> Bool))})
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, relative_to(INTERSECTION_OF(COUNTABLE, P), u) == relative_to(INTERSECTION_OF(COUNTABLE, relative_to(P, u)), u)
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, \226\136\128 s : (A) -> Bool, P(u) \226\134\146 relative_to(INTERSECTION_OF(FINITE, P), u, s) == (INTERSECTION_OF(FINITE, P, s) && SUBSET(s, u))
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, \226\136\128 s : (A) -> Bool, P(u) \226\134\146 relative_to(INTERSECTION_OF(COUNTABLE, P), u, s) == (INTERSECTION_OF(COUNTABLE, P, s) && SUBSET(s, u))
      #|  (t : ((A) -> Bool) -> Bool)
      #|  (r : (A) -> Bool)
      #|  (t : ((A) -> Bool) -> Bool) == {}
      #|  (t : ((A) -> Bool) -> Bool)
      #|  INTERS((t : ((A) -> Bool) -> Bool))
      #|  (t : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, UNION_OF(ARBITRARY, INTERSECTION_OF((s : ((A) -> Bool) -> Bool) => FINITE(s) && !(s == {}), u)) == UNION_OF(ARBITRARY, relative_to(INTERSECTION_OF(FINITE, u), UNIONS(u)))
      #|  (p : ((Num, Num)) -> Num)
      #|  \226\136\128 p : ((Num, Num)) -> Num, (P : Bool) == (\226\136\131 n : Num, \226\136\131 i : Num, \226\136\131 j : Num, p((i, j)) == n && (Q : (Num, Num) -> Bool)(i, j)) \226\134\146 P == (\226\136\131 i : Num, \226\136\131 j : Num, Q(i, j))
      #|  (p : Bool) \226\134\146 (p && (q : Bool)) == q
      #|  \226\136\131 i : Num, \226\136\131 j : Num, IN((x : A), (d : (Num, Num, A) -> Bool)(i, j))
      #|  (\226\136\131 n : _, \226\136\131 i : _, \226\136\131 j : _, (P : (_, _, _) -> Bool)(n, i, j)) == (\226\136\131 i : _, \226\136\131 j : _, \226\136\131 n : _, P(n, i, j))
      #|  (x : A)
      #|  (q : (Num) -> (Num, Num))
      #|  ((m : Num) < (n : Num) || n < m) == !(m == n)
      #|  (p : ((Num, Num)) -> Num)(((a : Num), (b : Num))) < p(((m : Num), (n : Num))) || p((m, n)) < p((a, b))
      #|  (n : Num)
      #|  (m : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  (j : Num)
      #|  (i : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  SND((q : (Num) -> (Num, Num))((c : Num)))
      #|  FST((q : (Num) -> (Num, Num))((c : Num)))
      #|  (c : Num)
      #|  (p : ((Num, Num)) -> Num)(((a : Num), (b : Num)))
      #|  (b : Num)
      #|  (a : Num)
      #|  (v : (A) -> Bool)
      #|  {(c : (Num, Num, A) -> Bool)((k : Num), (l : Num)) | (p : ((Num, Num)) -> Num)((k, l)) < p(((i : Num), (j : Num)))} == IMAGE((r : Num) => c(FST((q : (Num) -> (Num, Num))(r)), SND(q(r))), {(r : Num) | r < p((i, j))})
      #|  (j : Num)
      #|  (i : Num)
      #|  {(d : (Num, Num, A) -> Bool)((i : Num), (j : Num)) | IN(i, UNIV) && IN(j, UNIV)}
      #|  {(d : (Num, Num, A) -> Bool)(i, j) | i : Num, j : Num | SUBSET(d(i, j), (s : (Num, A) -> Bool)((n : Num))) && (\226\136\128 m : Num, m < n \226\134\146 !SUBSET(d(i, j), s(m)))}
      #|  (n : Num)
      #|  (n : Num) => UNIONS({(d : (Num, Num, A) -> Bool)(i, j) | i : Num, j : Num | SUBSET(d(i, j), (s : (Num, A) -> Bool)(n)) && (\226\136\128 m : Num, m < n \226\134\146 !SUBSET(d(i, j), s(m)))})
      #|  (d : (Num, Num, A) -> Bool) == ((m : Num) => (n : Num) => DIFF((c : (Num, Num, A) -> Bool)(m, n), UNIONS({c((i : Num), (j : Num)) | (p : ((Num, Num)) -> Num)((i, j)) < p((m, n))})))
      #|  (q : (Num) -> (Num, Num))
      #|  (p : ((Num, Num)) -> Num)
      #|  (c : (Num, Num, A) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (n : Num) => ({} : (A) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\131 c : (Num, Num, A) -> Bool, (\226\136\128 n : Num, \226\136\128 m : Num, (P : ((A) -> Bool) -> Bool)(c(n, m))) && (\226\136\128 n : Num, UNIONS({c(n, (m : Num)) | IN(m, UNIV)}) == (s : (Num, A) -> Bool)(n))
      #|  \226\136\128 k : ((A) -> Bool) -> Bool, FINITE(k) && (\226\136\128 i : (A) -> Bool, IN(i, k) \226\134\146 (P : ((A) -> Bool) -> Bool)(i)) \226\134\146 P(UNIONS(k))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, P({}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(DIFF(s, t))) \226\134\146 (\226\136\128 s : (Num, A) -> Bool, (\226\136\128 n : Num, UNION_OF(COUNTABLE, P, s(n))) \226\134\146 (\226\136\131 t : (Num, A) -> Bool, (\226\136\128 n : Num, UNION_OF(COUNTABLE, P, t(n))) && (\226\136\128 n : Num, SUBSET(t(n), s(n))) && pairwise((m : Num) => (n : Num) => DISJOINT(t(m), t(n)), UNIV) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == UNIONS({s((n : Num)) | IN(n, UNIV)})))
      #|  UNION((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == UNION((s' : (_) -> Bool), UNION((t' : (_) -> Bool), (u' : (_) -> Bool))) \226\134\146 u == {} && u' == {} \226\134\146 UNION(s, t) == UNION(s', t')
      #|  1
      #|  UNIV == INSERT(0, INSERT(1, DIFF(UNIV, {0, 1})))
      #|  (\226\136\128 n : Num, (P : (Num) -> Bool)(n)) == (P(0) && P(1) && (\226\136\128 n : Num, !(n == 0) && !(n == 1) \226\134\146 P(n)))
      #|  (\226\136\128 n : Num, (P : (Num) -> Bool)(n)) \226\134\146 P(0) && P(1)
      #|  (v : (Num, A) -> Bool)
      #|  (n : Num) => if n == 0 { (s : (A) -> Bool) } else { if n == 1 { (t : (A) -> Bool) } else { {} } }
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, P({}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(DIFF(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) \226\134\146 (\226\136\131 s' : (A) -> Bool, \226\136\131 t' : (A) -> Bool, UNION_OF(COUNTABLE, P, s') && UNION_OF(COUNTABLE, P, t') && SUBSET(s', s) && SUBSET(t', t) && DISJOINT(s', t') && UNION(s', t') == UNION(s, t)))
      #|  (\226\136\128 x : _, \226\136\128 y : _, (P : (_, _) -> Bool)(x, y) \226\134\146 (Q : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, P(x, y) \226\134\146 Q(x, y) || (R : (_, _) -> Bool)(x, y))
      #|  UNIONS({(R : (Num, (A, B)) -> Bool)((n : Num)) | IN(n, UNIV)})
      #|  INSERT(((w : A), (y : (Num) -> B)((n : Num))), (R : ((A, B)) -> Bool))
      #|  (w : A)
      #|  (y : (Num) -> B)((n : Num))
      #|  (R : ((A, B)) -> Bool)
      #|  IN((y : (Num) -> B)((n : Num)), (t : (B) -> Bool))
      #|  INSERT(((x : (Num) -> A)((n : Num)), (z : B)), (R : ((A, B)) -> Bool))
      #|  INSERT(((w : A), (y : (Num) -> B)((n : Num))), INSERT(((x : (Num) -> A)(n), (z : B)), (R : ((A, B)) -> Bool)))
      #|  (w : A)
      #|  (y : (Num) -> B)((n : Num))
      #|  INSERT(((x : (Num) -> A)((n : Num)), (z : B)), (R : ((A, B)) -> Bool))
      #|  IN((y : (Num) -> B)((n : Num)), (t : (B) -> Bool))
      #|  (z : B)
      #|  (x : (Num) -> A)((n : Num))
      #|  (R : ((A, B)) -> Bool)
      #|  IN((x : (Num) -> A)((n : Num)), (s : (A) -> Bool))
      #|  (R : ((A, B)) -> Bool)
      #|  (n : Num)
      #|  ({} : ((A, B)) -> Bool)
      #|  0
      #|  ((\226\136\128 n : Num, \226\136\128 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x) \226\134\146 (\226\136\131 y : _, (B : (Num, _, _) -> Bool)(n, x, y))) \226\134\146 (X : Bool)) && (\226\136\128 n : Num, \226\136\128 x : _, P(x) && Q(x) && R(x) \226\134\146 (\226\136\131 y : _, B(n, x, y))) \226\134\146 X && (\226\136\128 n : Num, \226\136\128 x : _, P(x) && Q(x) && R(x) && (S : (Num, _) -> Bool)(n, x) \226\134\146 (\226\136\131 y : _, B(SUC(n), x, y)))
      #|  \226\136\131 R : (Num, (A, B)) -> Bool, (\226\136\128 n : Num, FINITE(R(n)) && SUBSET(R(n), CROSS((s : (A) -> Bool), (t : (B) -> Bool))) && pairwise((P : ((A, B), (A, B)) -> Bool), R(n)) && (IN((x : (Num) -> A)(n), s) \226\134\146 IN(x(n), IMAGE(FST, R(n)))) && (IN((y : (Num) -> B)(n), t) \226\134\146 IN(y(n), IMAGE(SND, R(n))))) && (\226\136\128 n : Num, SUBSET(R(n), R(SUC(n))))
      #|  \226\136\131 x : (Num) -> A, \226\136\131 y : (Num) -> B, SUBSET((s : (A) -> Bool), IMAGE(x, UNIV)) && SUBSET((t : (B) -> Bool), IMAGE(y, UNIV))
      #|  \226\136\128 P : ((A, B), (A, B)) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) && (\226\136\128 R : ((A, B)) -> Bool, FINITE(R) && SUBSET(R, CROSS(s, t)) && pairwise(P, R) \226\134\146 (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 y : B, IN(y, t) && pairwise(P, INSERT((x, y), R)))) && (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && pairwise(P, INSERT((x, y), R))))) \226\134\146 (\226\136\131 R : ((A, B)) -> Bool, SUBSET(R, CROSS(s, t)) && pairwise(P, R) && (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 y : B, IN(y, t) && IN((x, y), R))) && (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && IN((x, y), R))))
      #|  (x : A)
      #|  \226\136\131 x : A, IN(x, (s' : (A) -> Bool)) && (f : (A) -> B)(x) == (y : B)
      #|  IN((y : B), (t' : (B) -> Bool))
      #|  IN((y : B), (t : (B) -> Bool))
      #|  (y : B)
      #|  (f : (A) -> B)((x : A))
      #|  IN((x : A), (s' : (A) -> Bool))
      #|  IN((x : A), (s : (A) -> Bool))
      #|  (x : A)
      #|  (x : A) == (y : A)
      #|  (y : A)
      #|  (x : A)
      #|  IMAGE((f : (A) -> B), (s' : (A) -> Bool)) == (t' : (B) -> Bool)
      #|  SUBSET((s' : (A) -> Bool), (s : (A) -> Bool)) && SUBSET((t' : (B) -> Bool), (t : (B) -> Bool))
      #|  \226\136\128 x : A, \226\136\128 y : B, IN((x, y), (r : ((A, B)) -> Bool)) == (IN(x, (s' : (A) -> Bool)) && IN(y, (t' : (B) -> Bool)) && (f : (A) -> B)(x) == y)
      #|  (t' : (B) -> Bool)
      #|  (s' : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  (f : (A) -> B) == ((x : A) => select((y : B) => IN((x, y), (r : ((A, B)) -> Bool))))
      #|  (t' : (B) -> Bool) == IMAGE(SND, (r : ((A, B)) -> Bool))
      #|  (s' : (A) -> Bool) == IMAGE(FST, (r : ((A, B)) -> Bool))
      #|  (r : ((A, B)) -> Bool)
      #|  (x : A) == (y : A)
      #|  (f : (A) -> B)((y : A))
      #|  (y : A)
      #|  (f : (A) -> B)((x : A))
      #|  (x : A)
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 x : A, \226\136\128 y : B, IN(x, (s : (A) -> Bool)) \226\134\146 ((f : (A) -> B)(x) == y) == IN((x, y), (r : ((A, B)) -> Bool))
      #|  (f : (A) -> B)
      #|  (f : (A) -> B) == ((x : A) => select((y : B) => IN((x, y), (r : ((A, B)) -> Bool))))
      #|  (r : ((A, B)) -> Bool)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  fn { (x, y) => fn { (x', y') => (x == x') == (y == y') && (R : (A, A, B, B) -> Bool)(x, x', y, y') } }
      #|  \226\136\128 R : (A, A, B, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : B, IN(x, s) && IN(y, t) \226\134\146 R(x, x, y, y)) && (\226\136\128 x : A, \226\136\128 y : B, \226\136\128 x' : A, \226\136\128 y' : B, IN(x, s) && IN(x', s) && IN(y, t) && IN(y', t) && !(x == x') && !(y == y') && R(x, x', y, y') \226\134\146 R(x', x, y', y)) && COUNTABLE(s) && COUNTABLE(t) && (\226\136\128 f : (A) -> B, \226\136\128 s' : (A) -> Bool, \226\136\128 t' : (B) -> Bool, FINITE(s') && SUBSET(s', s) && FINITE(t') && SUBSET(t', t) && IMAGE(f, s') == t' && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s') && IN(y, s') \226\134\146 (f(x) == f(y)) == (x == y)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s') && IN(y, s') \226\134\146 R(x, y, f(x), f(y))) \226\134\146 (\226\136\128 x : A, IN(x, DIFF(s, s')) \226\134\146 (\226\136\131 y : B, IN(y, DIFF(t, t')) && (\226\136\128 z : A, IN(z, s') \226\134\146 R(x, z, y, f(z))))) && (\226\136\128 y : B, IN(y, DIFF(t, t')) \226\134\146 (\226\136\131 x : A, IN(x, DIFF(s, s')) && (\226\136\128 z : A, IN(z, s') \226\134\146 R(x, z, y, f(z)))))) \226\134\146 (\226\136\131 f : (A) -> B, IMAGE(f, s) == t && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 R(x, y, f(x), f(y))))
      #|  (y : B)
      #|  (s' : (A) -> Bool)
      #|  (t' : (B) -> Bool)
      #|  (g : (B) -> A)
      #|  (y : B)
      #|  (g : (B) -> A)
      #|  (f : (A) -> B)
      #|  (x : A)
      #|  (t' : (B) -> Bool)
      #|  (s' : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 R : (A, A, B, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : B, IN(x, s) && IN(y, t) \226\134\146 R(x, x, y, y)) && (\226\136\128 x : A, \226\136\128 y : B, \226\136\128 x' : A, \226\136\128 y' : B, IN(x, s) && IN(x', s) && IN(y, t) && IN(y', t) && !(x == x') && !(y == y') && R(x, x', y, y') \226\134\146 R(x', x, y', y)) && COUNTABLE(s) && COUNTABLE(t) && (\226\136\128 f : (A) -> B, \226\136\128 s' : (A) -> Bool, \226\136\128 t' : (B) -> Bool, \226\136\128 x : A, FINITE(s') && SUBSET(s', s) && FINITE(t') && SUBSET(t', t) && IMAGE(f, s') == t' && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s') && IN(y, s') \226\134\146 (f(x) == f(y)) == (x == y)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s') && IN(y, s') \226\134\146 R(x, y, f(x), f(y))) && IN(x, DIFF(s, s')) \226\134\146 (\226\136\131 y : B, IN(y, DIFF(t, t')) && (\226\136\128 z : A, IN(z, s') \226\134\146 R(x, z, y, f(z))))) && (\226\136\128 f : (B) -> A, \226\136\128 t' : (B) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 x : B, FINITE(t') && SUBSET(t', t) && FINITE(s') && SUBSET(s', s) && IMAGE(f, t') == s' && (\226\136\128 x : B, \226\136\128 y : B, IN(x, t') && IN(y, t') \226\134\146 (f(x) == f(y)) == (x == y)) && (\226\136\128 x : B, \226\136\128 y : B, IN(x, t') && IN(y, t') \226\134\146 R(f(x), f(y), x, y)) && IN(x, DIFF(t, t')) \226\134\146 (\226\136\131 y : A, IN(y, DIFF(s, s')) && (\226\136\128 z : B, IN(z, t') \226\134\146 R(y, f(z), x, z)))) \226\134\146 (\226\136\131 f : (A) -> B, IMAGE(f, s) == t && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 R(x, y, f(x), f(y))))
      #|  (g : (Num, Num) -> A)((n : Num), (b : Num))
      #|  (g : (Num, Num) -> A)((n : Num), (a : Num) + 1)
      #|  (a : Num) + 1 == (b : Num)
      #|  (g : (Num, Num) -> A)((n : Num), (b : Num))
      #|  (a : Num) == (b : Num)
      #|  (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (b : Num)), (z : A)) && R(z, g(n, b + 1))
      #|  (z : A) == select((z : A) => (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (b : Num)), z) && R(z, g(n, b + 1)))
      #|  (g : (Num, Num) -> A)((n : Num), (a : Num) + 1)
      #|  (b : Num) == (a : Num) + 1
      #|  (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (a : Num)), (w : A)) && R(w, g(n, a + 1))
      #|  (w : A) == select((z : A) => (R : (A, A) -> Bool)((g : (Num, Num) -> A)((n : Num), (a : Num)), z) && R(z, g(n, a + 1)))
      #|  DIV(2 * (a : Num) + 1 + 1, 2) == a + 1
      #|  DIV(2 * (a : Num), 2) == a
      #|  (a : Num)
      #|  (b : Num)
      #|  (k : Num)
      #|  (j : Num)
      #|  (k : Num)
      #|  (j : Num)
      #|  (n : Num)
      #|  ((j1 : Num) < (j2 : Num) && j2 <= EXP(2, 0)) == (j1 == 0 && j2 == 1)
      #|  (n : Num)
      #|  (n1 : Num) + (n2 : Num)
      #|  (j1 : Num)
      #|  EXP(2, (n2 : Num)) * (k1 : Num)
      #|  (j2 : Num)
      #|  EXP(2, (n1 : Num)) * (k2 : Num)
      #|  real_of_num(EXP(2, (n1 : Num)) * (k2 : Num)) <= pow(real_of_num(2), n1 + (n2 : Num))
      #|  pow(real_of_num(2), (n : Num)) * real_of_num((k : Num)) == real_of_num(EXP(2, n) * k)
      #|  real_of_num((k1 : Num)) / pow(real_of_num(2), (n1 : Num)) == pow(real_of_num(2), (n2 : Num)) * real_of_num(k1) / pow(real_of_num(2), n1 + n2) && real_of_num((k2 : Num)) / pow(real_of_num(2), n2) == pow(real_of_num(2), n1) * real_of_num(k2) / pow(real_of_num(2), n1 + n2)
      #|  (n2 : Num)
      #|  (k2 : Num)
      #|  (n1 : Num)
      #|  (k1 : Num)
      #|  real_of_num(1) == real_of_num(1) / pow(real_of_num(2), 0)
      #|  real_of_num(0) == real_of_num(0) / pow(real_of_num(2), 0)
      #|  (f : (Real) -> A)
      #|  DIV(2 * (n : Num), 2) == n
      #|  (\226\136\128 n : _, \226\136\128 n' : _, \226\136\128 d : _, n' == (f : (_, _) -> _)(d, n) \226\134\146 (\226\136\128 m : _, \226\136\128 m' : _, (g : (_, _) -> _)(d, m) == m' \226\134\146 (P : (_, _, _, _) -> Bool)(m, m', n, d))) == (\226\136\128 d : _, \226\136\128 m : _, \226\136\128 n : _, P(m, g(d, m), n, d))
      #|  !((y : Real) == real_of_num(0)) && !((y' : Real) == real_of_num(0)) \226\134\146 ((x : Real) / y == (x' : Real) / y') == (y' / y * x == x')
      #|  (\226\136\128 a : _, \226\136\128 b : _, \226\136\128 c : _, \226\136\128 d : _, (P : (_, _, _, _) -> Bool)(a, b, c, d)) == (\226\136\128 b : _, \226\136\128 d : _, \226\136\128 a : _, \226\136\128 c : _, P(a, b, c, d))
      #|  GABS((f : ((Num, Num)) -> Real) => \226\136\128 k : Num, \226\136\128 n : Num, GEQ(f((k, n)), real_of_num(k) / pow(real_of_num(2), n)))
      #|  GABS((f : ((Num, Num)) -> A) => \226\136\128 k : Num, \226\136\128 n : Num, GEQ(f((k, n)), (g : (Num, Num) -> A)(n, k)))
      #|  \226\136\131 f : (Real) -> A, \226\136\128 k : Num, \226\136\128 n : Num, f(real_of_num(k) / pow(real_of_num(2), n)) == (g : (Num, Num) -> A)(n, k)
      #|  (g : (Num, Num) -> A)
      #|  \226\136\131 f : (Num, Num) -> A, f(0) == ((k : Num) => if k == 0 { (a : A) } else { (b : A) }) && (\226\136\128 n : Num, f(SUC(n)) == ((k : Num) => if EVEN(k) { f(n, DIV(k, 2)) } else { select((z : A) => (R : (A, A) -> Bool)(f(n, DIV(k - 1, 2)), z) && R(z, f(n, DIV(k + 1, 2)))) }))
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 a : A, \226\136\128 b : A, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, R(x, y) && R(y, z) \226\134\146 R(x, z)) && R(a, b) && (\226\136\128 x : A, \226\136\128 y : A, R(x, y) \226\134\146 (\226\136\131 z : A, R(x, z) && R(z, y))) \226\134\146 (\226\136\131 f : (Real) -> A, f(real_of_num(0)) == a && f(real_of_num(1)) == b && (\226\136\128 x : Real, \226\136\128 y : Real, IN(x, {real_of_num((k : Num)) / pow(real_of_num(2), (n : Num)) | k <= EXP(2, n)}) && IN(y, {real_of_num((k : Num)) / pow(real_of_num(2), (n : Num)) | k <= EXP(2, n)}) && x < y \226\134\146 R(f(x), f(y))))
      #|  (suslin_operation : ((List[Num], A) -> Bool, A) -> Bool)((f : (List[Num], A) -> Bool)) == UNIONS({INTERS({f(list_of_seq((s : (Num) -> Num), (n : Num))) | 1 <= n}) | IN(s, UNIV)})
      #|  (suslin : (((_) -> Bool) -> Bool, (_) -> Bool) -> Bool)((u : ((_) -> Bool) -> Bool)) == {suslin_operation((f : (List[Num], _) -> Bool)) | \226\136\128 l : List[Num], !(l == NIL) \226\134\146 IN(f(l), u)}
      #|  (i : List[Num]) => (s : (A) -> Bool)
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, C(s) \226\134\146 suslin(C, s)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, SUBSET(u, suslin(u))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 D : ((A) -> Bool) -> Bool, SUBSET(C, D) \226\134\146 SUBSET(suslin(C), suslin(D))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 D : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 t : (A) -> Bool, C(t) \226\134\146 D(t)) && suslin(C, s) \226\134\146 suslin(D, s)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, 1 <= m && m <= n \226\134\146 list_of_seq((i : Num) => EL(i, list_of_seq((s : (Num) -> Num), n)), m) == list_of_seq(s, m)
      #|  (a : A)
      #|  (s : (Num) -> Num)
      #|  (\226\136\128 x : _, (f : (_) -> _)(x) == (g : (_) -> _)(x)) \226\134\146 IMAGE(f, UNIV) == IMAGE(g, UNIV)
      #|  (q : Num)
      #|  (p : Num)
      #|  (p : Num)
      #|  (x : A)
      #|  (n : Num)
      #|  (m : Num)
      #|  (s : (Num) -> Num)
      #|  (l : List[Num]) => INTERS({(f : (List[Num], A) -> Bool)(list_of_seq((i : Num) => EL(i, l), n)) | n : Num | 1 <= n && n <= LENGTH(l)})
      #|  (f : (List[Num], A) -> Bool)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, (\226\136\128 c : ((A) -> Bool) -> Bool, FINITE(c) && !(c == {}) && SUBSET(c, u) \226\134\146 IN(INTERS(c), u)) \226\134\146 suslin(u) == {suslin_operation((f : (List[Num], A) -> Bool)) | (\226\136\128 l : List[Num], !(l == NIL) \226\134\146 IN(f(l), u)) && (\226\136\128 s : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, 1 <= m && m <= n \226\134\146 SUBSET(f(list_of_seq(s, n)), f(list_of_seq(s, m))))}
      #|  (i : Num)
      #|  3 <= (n : Num) \226\134\146 1 <= n && !(n <= 2)
      #|  (n : Num)
      #|  (n : Num)
      #|  ((kk : Num), (mm : Num))
      #|  IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) \226\134\146 (\226\136\128 y : _, IN(y, t) \226\134\146 (\226\136\131 x : _, IN(x, s) && f(x) == y))
      #|  (mm : Num)
      #|  (kk : Num)
      #|  (j : Num) => (i : Num) => (t : (Num) -> Num)((q : ((Num, Num)) -> Num)((i, j)))
      #|  (i : Num) => (t : (Num) -> Num)((q : ((Num, Num)) -> Num)((i, 0)))
      #|  (t : (Num) -> Num)
      #|  (i : Num)
      #|  !((n : Num) == 0) == (1 <= n)
      #|  (n : Num)
      #|  IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) \226\134\146 (\226\136\128 x : _, IN(x, s) \226\134\146 IN(f(x), t))
      #|  !((n : Num) <= 2) == (3 <= n)
      #|  (n : Num)
      #|  (t : (Num) -> Num)
      #|  (n : Num) => if n == 0 { (p : Num) } else { (t : (Num) -> Num)(n) }
      #|  (p : Num)
      #|  list_of_seq((s' : (Num, Num) -> Num)(1), 1)
      #|  list_of_seq((s : (Num) -> Num), 1)
      #|  (t : (_) -> Bool) == IMAGE((f : (_) -> _), UNIV) \226\134\146 (\226\136\128 y : _, IN(y, t) \226\134\146 (\226\136\131 x : _, f(x) == y))
      #|  (t : (Num) -> Num)
      #|  \226\136\131 t : (Num) -> Num, fn { (i, j) => if j == 0 { (s : (Num) -> Num)(i) } else { (s' : (Num, Num) -> Num)(j, i) } } == o(t, (q : ((Num, Num)) -> Num))
      #|  \226\136\131 t : (Num) -> Num, (h : (Num, A) -> Bool)(t(0)) == (g : (List[Num], List[Num], A) -> Bool)(list_of_seq((s : (Num) -> Num), 1), list_of_seq((s' : (Num, Num) -> Num)(1), 1)) && (\226\136\128 i : Num, t((q : ((Num, Num)) -> Num)((i, 0))) == s(i)) && (\226\136\128 i : Num, \226\136\128 j : Num, 1 <= j \226\134\146 t(q((i, j))) == s'(j, i))
      #|  (s' : (Num, Num) -> Num)
      #|  (s : (Num) -> Num)
      #|  (x : A)
      #|  LENGTH((l : List[Num]))
      #|  IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) \226\134\146 (\226\136\128 x : _, IN(x, s) \226\134\146 IN(f(x), t))
      #|  (l : List[Num])
      #|  (f : (List[Num], A) -> Bool)
      #|  (f : (List[Num], A) -> Bool) == ((l : List[Num]) => if LENGTH(l) <= 2 { (h : (Num, A) -> Bool)(EL(0, l)) } else { (g : (List[Num], List[Num], A) -> Bool)(list_of_seq((i : Num) => EL((q : ((Num, Num)) -> Num)((i, 0)), l), (k : (Num) -> Num)(LENGTH(l))), list_of_seq((i : Num) => EL(q((i, k(LENGTH(l)))), l), (m : (Num) -> Num)(LENGTH(l)))) })
      #|  {(f : (_) -> _)((x : _)) | x == (a : _)} == {f(a)}
      #|  ((i : Num) < 1) == (i == 0)
      #|  (if (p : Bool) { (x : Num) } else { 1 }, if p { (y : Num) } else { 1 }) == (if p { (x, y) } else { (1, 1) })
      #|  (n : Num) => if IN(n, IMAGE((r : ((Num, Num)) -> Num), CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)))) { SND((l : (Num) -> (Num, Num))(n)) } else { 1 }
      #|  (n : Num) => if IN(n, IMAGE((r : ((Num, Num)) -> Num), CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)))) { FST((l : (Num) -> (Num, Num))(n)) } else { 1 }
      #|  (l : (Num) -> (Num, Num))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 (t : (Num) -> Num)(m) < t(n)
      #|  CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)) == IMAGE((p : (Num) -> (Num, Num)), UNIV)
      #|  o((t : (Num) -> Num), (p' : ((Num, Num)) -> Num))
      #|  (2 < (n : Num)) == (3 <= n)
      #|  (\226\136\128 x : _, FINITE((f : (_, _) -> Bool)(x))) \226\134\146 FINITE(f((a : _)))
      #|  (\226\136\131 a : Num, (P : (Num) -> Bool)(SUC(a))) \226\134\146 (\226\136\131 a : Num, P(a))
      #|  (SUBSET((s : (Num) -> Bool), {(a : Num) | a < (y : Num)}) && (x : Num) < y) == SUBSET(INSERT(x, s), {(a : Num) | a < y})
      #|  \226\136\131 t : (Num) -> Num, (\226\136\128 n : Num, SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)((p : (Num) -> (Num, Num))(n))), {(a : Num) | a < t(n)}) && 2 < t(n)) && (\226\136\128 n : Num, t(n) < t(SUC(n)))
      #|  (p : (Num) -> (Num, Num))
      #|  (p' : ((Num, Num)) -> Num)
      #|  DELETE((s : (_) -> Bool), (a : _)) == DIFF(s, {a})
      #|  (op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))
      #|  (op_eq_us_c : (((Num, Num)) -> Bool, (Num) -> Bool) -> Bool)((CROSS : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((DELETE : ((Num) -> Bool, Num, Num) -> Bool)((UNIV : (Num) -> Bool), 0), (DELETE : ((Num) -> Bool, Num, Num) -> Bool)((UNIV : (Num) -> Bool), 0)), (UNIV : (Num) -> Bool))
      #|  \226\136\131 r : ((Num, Num)) -> Num, (\226\136\128 a : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) \226\134\146 IN(r(a), {(n : Num) | 3 <= n})) && (\226\136\128 a : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) \226\134\146 SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)(a)), {(m : Num) | m < r(a)})) && (\226\136\128 a : (Num, Num), \226\136\128 b : (Num, Num), IN(a, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) && IN(b, CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0))) && r(a) == r(b) \226\134\146 a == b)
      #|  \226\136\131 k : (Num) -> Num, \226\136\131 m : (Num) -> Num, IMAGE((n : Num) => (k(n), m(n)), {(n : Num) | 3 <= n}) == CROSS(DELETE(UNIV, 0), DELETE(UNIV, 0)) && (\226\136\128 n : Num, 3 <= n \226\134\146 SUBSET(IMAGE((q : ((Num, Num)) -> Num), (J : ((Num, Num), (Num, Num)) -> Bool)((k(n), m(n)))), {(a : Num) | a < n}))
      #|  (J : ((Num, Num), (Num, Num)) -> Bool) == GABS((f : ((Num, Num), (Num, Num)) -> Bool) => \226\136\128 k : Num, \226\136\128 m : Num, GEQ(f((k, m)), UNION({((i : Num), 0) | i < k}, {((i : Num), k) | i < m})))
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  fn { (a, b) => if (a, b) == (0, 0) { 1 } else { if (a, b) == (0, 1) { 2 } else { (q : ((Num, Num)) -> Num)((a, b)) } } }
      #|  ((p : Bool) \226\134\146 (q : Bool) || (r : Bool)) == (p \226\134\146 !q \226\134\146 r)
      #|  (d : Num)
      #|  (c : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 a' : Num, \226\136\128 b' : Num, (q : ((Num, Num)) -> Num)((a, b)) == q((a', b')) \226\134\146 a == 0 && (b == 0 || b == 1) || a' == 0 && (b' == 0 || b' == 1) || a == a' && b == b'
      #|  (q' : (Num) -> (Num, Num))
      #|  (q : ((Num, Num)) -> Num)
      #|  (UNIV : (Num) -> Bool)
      #|  (UNIV : (Num) -> Bool)
      #|  (UNIV : ((Num, Num)) -> Bool)
      #|  op_eq_us_c(DIFF(UNIV, {(0, 0), (0, 1)}), DIFF(UNIV, {0, 1, 2}))
      #|  \226\136\131 q : ((Num, Num)) -> Num, (\226\136\128 a : Num, \226\136\128 b : Num, 1 <= q((a, b))) && q((0, 0)) == 1 && q((0, 1)) == 2 && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 a' : Num, \226\136\128 b' : Num, (q((a, b)) == q((a', b'))) == (a == a' && b == b'))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x)) \226\134\146 !({(f : (_, _) -> _)((x : _), (y : _)) | P(x) && P(y)} == {})
      #|  (UNIV : (List[Num]) -> Bool)
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  !((x : List[_]) == NIL) == IN(x, {(l : List[_]) | !(l == NIL)})
      #|  \226\136\131 h : (Num, A) -> Bool, {(g : (List[Num], List[Num], A) -> Bool)((l : List[Num]), (m : List[Num])) | !(l == NIL) && !(m == NIL)} == IMAGE(h, UNIV)
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x) \226\134\146 (f : (_) -> _)(x) == (g : (_) -> _)(x)) \226\134\146 {f((x : _)) | P(x)} == {g((x : _)) | P(x)}
      #|  (s : (Num) -> Num)
      #|  suslin_operation((f : (List[Num], A) -> Bool)) == suslin_operation((l : List[Num]) => suslin_operation((g : (List[Num], List[Num], A) -> Bool)(l)))
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool)) == ((p \226\134\146 q) && (p \226\134\146 r))
      #|  (g : (List[Num], List[Num], A) -> Bool)
      #|  (f : (List[Num], A) -> Bool)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, suslin(suslin(u)) == suslin(u)
      #|  (d : Num)
      #|  (c : Num)
      #|  (d : Num)
      #|  (c : Num)
      #|  (d : Num)
      #|  (c : Num)
      #|  (d : Num)
      #|  (c : Num)
      #|  (d : Num)
      #|  (c : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 n : Num, 1 <= SUC(n) && SUC(n) - 1 == n
      #|  (o : ((Num, A) -> Bool, (List[Num]) -> Num, List[Num], A) -> Bool)((f : (Num, A) -> Bool), (o : ((Num) -> Num, (List[Num]) -> Num, List[Num]) -> Num)((n : Num) => n - 1, (LENGTH : (List[Num]) -> Num)))
      #|  (f : (Num, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, IN(s, f) \226\134\146 suslin(C, s)) \226\134\146 suslin(C, INTERS(f))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, suslin(C, s) && suslin(C, t) \226\134\146 suslin(C, INTER(s, t))
      #|  (i : Num) => (n : Num)
      #|  (n : Num)
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x)) && (\226\136\128 x : _, P(x) \226\134\146 (f : (_) -> _)(x) == (a : _)) \226\134\146 {f((x : _)) | P(x)} == {a}
      #|  \226\136\128 f : (Num, A) -> Bool, \226\136\128 s : (Num) -> Num, {f(EL(0, list_of_seq(s, (n : Num)))) | 1 <= n} == {f(s(0))}
      #|  o((f : (Num, A) -> Bool), EL(0))
      #|  (f : (Num, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, IN(s, f) \226\134\146 suslin(C, s)) \226\134\146 suslin(C, UNIONS(f))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, suslin(C, s) && suslin(C, t) \226\134\146 suslin(C, UNION(s, t))
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (op_caret_us_c : (((Num) -> Bool) -> Bool, (Num) -> Bool, (Num, Num) -> Bool) -> Bool)((UNIV : ((Num) -> Bool) -> Bool), (UNIV : (Num) -> Bool))
      #|  (op_caret_us_c : ((Real) -> Bool, (List[Num]) -> Bool, (List[Num]) -> Real) -> Bool)((UNIV : (Real) -> Bool), (UNIV : (List[Num]) -> Bool))
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x) \226\134\146 (f : (_) -> _)(x) == (g : (_) -> _)(x)) \226\134\146 {f((x : _)) | P(x)} == {g((x : _)) | P(x)}
      #|  (l : List[Num]) => if l == NIL { (f : (List[Num], A) -> Bool)([0]) } else { f(l) }
      #|  (f : (List[Num], A) -> Bool)
      #|  (\226\136\128 x : _, IN(x, (s : (_) -> Bool)) \226\134\146 (\226\136\131 y : _, IN(y, (t : (_) -> Bool)) && (f : (_) -> _)(x) == f(y))) \226\134\146 SUBSET(IMAGE(f, s), IMAGE(f, t))
      #|  IMAGE(suslin_operation, op_caret_us_c((C : ((A) -> Bool) -> Bool), UNIV))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, (op_lt_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)(C, (UNIV : (Real) -> Bool)) \226\134\146 (op_lt_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)((suslin : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)(C), (UNIV : (Real) -> Bool))
      #|  \226\136\128 C : ((A) -> Bool) -> Bool, (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)(C, (UNIV : (Real) -> Bool)) \226\134\146 (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)((suslin : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)(C), (UNIV : (Real) -> Bool))
      #|FORALL_DIFF =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) s:fun('A,bool)))))
      #|EXISTS_DIFF =  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) s:fun('A,bool)))))
      #|FORALL_DIFF_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) s:fun('A,bool))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|FORALL_DIFF_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) s:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|GE_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#>=:fun(num,fun(num,bool)) n:num) n:num)))
      #|FORALL_SUC =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (P:fun(num,bool) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) (#SUC:fun(num,num) n:num)))))
      #|SEQ_MONO_LEMMA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\e:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_lt:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (e:fun(num,real) n:num)))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_le:fun(real,fun(real,bool)) (e:fun(num,real) n:num)) (e:fun(num,real) m:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_lt:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (e:fun(num,real) m:num))))))))))
      #|REAL_HALF =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) e:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) e:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_div:fun(real,fun(real,real)) e:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) e:real)))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_div:fun(real,fun(real,real)) e:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) e:real)))))
      #|ABS_SQUARE_LT_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|ABS_SQUARE_LE_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|ABS_SQUARE_EQ_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|UPPER_BOUND_FINITE_SET =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) a:num)))))))))))
      #|UPPER_BOUND_FINITE_SET_REAL =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) a:real)))))))))))
      #|LOWER_BOUND_FINITE_SET =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) a:num) (f:fun('A,num) x:'A))))))))))))
      #|LOWER_BOUND_FINITE_SET_REAL =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) (f:fun('A,real) x:'A))))))))))))
      #|REAL_CONVEX_SUM_BOUND_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(fun('A,real),bool),bool) (\a:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (x:fun('A,real) i:'A)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) x:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (a:fun('A,real) i:'A)) b:real))) d:real))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((#real_mul:fun(real,fun(real,real)) (a:fun('A,real) i:'A)) (x:fun('A,real) i:'A))))) b:real))) d:real))))))))))))
      #|REAL_CONVEX_SUM_BOUND_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(fun('A,real),bool),bool) (\a:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (x:fun('A,real) i:'A)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) x:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (a:fun('A,real) i:'A)) b:real))) d:real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((#real_mul:fun(real,fun(real,real)) (a:fun('A,real) i:'A)) (x:fun('A,real) i:'A))))) b:real))) d:real))))))))))))
      #|APPROACHABLE_LT_LE =  |- (#forall:fun(fun(fun('?1,bool),bool),bool) (\P:fun('?1,bool). (#forall:fun(fun(fun('?1,real),bool),bool) (\f:fun('?1,real). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun('?1,real) x:'?1)) d:real)) (P:fun('?1,bool) x:'?1)))))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (f:fun('?1,real) x:'?1)) d:real)) (P:fun('?1,bool) x:'?1))))))))))))
      #|REAL_LE_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))))))
      #|REAL_LET_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)))))))))
      #|REAL_LTE_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))))))
      #|REAL_LT_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)))))))))
      #|REAL_LT_BETWEEN_GEN =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#FINITE:fun(fun(real,bool),bool) t:fun(real,bool)))) ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) t:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) t:fun(real,bool)))) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real))))))))))))
      #|TRIANGLE_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) z:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|LAMBDA_SKOLEM =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((P:fun(num,fun('A,bool)) i:num) x:'A))))))) (#?:fun(fun(cart('A,'N),bool),bool) (\x:cart('A,'N). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((P:fun(num,fun('A,bool)) i:num) ((#$:fun(cart('A,'N),fun(num,'A)) x:cart('A,'N)) i:num))))))))
      #|EPSILON_DELTA_MINIMAL =  |- (#forall:fun(fun(fun(real,fun('A,bool)),bool),bool) (\P:fun(real,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%1:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%1:'A) (Q:fun('A,bool) x:'A)) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\e:real. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#real_lt:fun(real,fun(real,bool)) e:real) d:real)))) ((#==>:fun(bool,fun(bool,bool)) ((P:fun(real,fun('A,bool)) d:real) x:'A)) ((P:fun(real,fun('A,bool)) e:real) x:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((P:fun(real,fun('A,bool)) d:real) x:'A)))))))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) ((P:fun(real,fun('A,bool)) d:real) x:'A))))))))))))
      #|HAS_SIZE_1_EXISTS =  |- (#forall:fun(fun(fun('?2,bool),bool),bool) (\s:fun('?2,bool). ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('?2,bool),fun(num,bool)) s:fun('?2,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#?!:fun(fun('?2,bool),bool) (\x:'?2. ((#IN:fun('?2,fun(fun('?2,bool),bool)) x:'?2) s:fun('?2,bool)))))))
      #|LINEAR_EQUATIONS_1_EQ =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) x:real)) b:real)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|LINEAR_EQUATIONS_2_EQ =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) a:real) x:real)) ((#real_mul:fun(real,fun(real,real)) b:real) y:real))) u:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) c:real) x:real)) ((#real_mul:fun(real,fun(real,real)) d:real) y:real))) v:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) d:real)) ((#real_mul:fun(real,fun(real,real)) b:real) c:real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) d:real) u:real)) ((#real_mul:fun(real,fun(real,real)) b:real) v:real))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) c:real) u:real)) ((#real_mul:fun(real,fun(real,real)) a:real) v:real))))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) d:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) u:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) v:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))))))))
      #|is_realinterval =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#real_le:fun(real,fun(real,bool)) c:real) b:real))))) ((#IN:fun(real,fun(fun(real,bool),bool)) c:real) s:fun(real,bool))))))))))))
      #|IS_REALINTERVAL_EMPTY =  |- (#is_realinterval:fun(fun(real,bool),bool) #EMPTY:fun(real,bool))
      #|IS_REALINTERVAL_UNION =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) t:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#INTER:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) s:fun(real,bool)) t:fun(real,bool))) #EMPTY:fun(real,bool)))))) (#is_realinterval:fun(fun(real,bool),bool) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) s:fun(real,bool)) t:fun(real,bool))))))))
      #|IS_REALINTERVAL_UNIV =  |- (#is_realinterval:fun(fun(real,bool),bool) #UNIV:fun(real,bool))
      #|IS_REALINTERVAL_INTER =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) s:fun(real,bool))) (#is_realinterval:fun(fun(real,bool),bool) t:fun(real,bool)))) (#is_realinterval:fun(fun(real,bool),bool) ((#INTER:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) s:fun(real,bool)) t:fun(real,bool))))))))
      #|open_real_interval =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%2:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%2:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))))))
      #|closed_real_interval =  |- ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%3:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%3:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))
      #|real_interval =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%4:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%4:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%5:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%5:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real)))))))
      #|IN_REAL_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))))))))))
      #|EMPTY_AS_REAL_INTERVAL =  |- ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) #EMPTY:fun(real,bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(prod(real,real)))))
      #|REAL_INTERVAL_OPEN_SUBSET_CLOSED =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))))))
      #|REAL_INTERVAL_EQ_EMPTY =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) #EMPTY:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) b:real) a:real))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) #EMPTY:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real)))))))
      #|REAL_INTERVAL_NE_EMPTY =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) #EMPTY:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) #EMPTY:fun(real,bool)))) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)))))))
      #|REAL_INTERVAL_SING =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) a:real)) #NIL:list(prod(real,real))))) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) #EMPTY:fun(real,bool)))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) a:real))) #EMPTY:fun(real,bool)))))
      #|ENDS_IN_REAL_INTERVAL =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) #EMPTY:fun(real,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) #EMPTY:fun(real,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#~:fun(bool,bool) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#~:fun(bool,bool) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))))))))))
      #|IN_REAL_INTERVAL_REFLECT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_neg:fun(real,real) x:real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) b:real)) (#real_neg:fun(real,real) a:real))) #NIL:list(prod(real,real)))))) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_neg:fun(real,real) x:real)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) b:real)) (#real_neg:fun(real,real) a:real))))) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))))))))))
      #|REFLECT_REAL_INTERVAL =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#IMAGE:fun(fun(real,real),fun(fun(real,bool),fun(real,bool))) #real_neg:fun(real,real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) b:real)) (#real_neg:fun(real,real) a:real))) #NIL:list(prod(real,real)))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#IMAGE:fun(fun(real,real),fun(fun(real,bool),fun(real,bool))) #real_neg:fun(real,real)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) b:real)) (#real_neg:fun(real,real) a:real)))))))))
      #|IS_REALINTERVAL_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) (#is_realinterval:fun(fun(real,bool),bool) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))))
      #|ENDS_IN_UNIT_REAL_INTERVAL =  |- ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #NIL:list(prod(real,real)))))) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #NIL:list(prod(real,real))))))
      #|INTER_REAL_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#INTER:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)) #NIL:list(prod(real,real)))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) ((#real_max:fun(real,fun(real,real)) a:real) c:real)) ((#real_min:fun(real,fun(real,real)) b:real) d:real))) #NIL:list(prod(real,real)))))))))))))
      #|REAL_OPEN_CLOSED_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) ((#DIFF:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) b:real) #EMPTY:fun(real,bool)))))))))
      #|REAL_CLOSED_OPEN_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) b:real) #EMPTY:fun(real,bool))))))))))
      #|IS_REALINTERVAL_SING =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#is_realinterval:fun(fun(real,bool),bool) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) #EMPTY:fun(real,bool)))))
      #|IS_REALINTERVAL_CONTAINS_INTERVAL =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) s:fun(real,bool))))) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) s:fun(real,bool)))))))))
      #|IS_REALINTERVAL_SHRINK =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(bool,fun(bool,bool)) (#is_realinterval:fun(fun(real,bool),bool) ((#IMAGE:fun(fun(real,real),fun(fun(real,bool),fun(real,bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))) s:fun(real,bool)))) (#is_realinterval:fun(fun(real,bool),bool) s:fun(real,bool)))))
      #|SUBSET_REAL_INTERVAL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)) #NIL:list(prod(real,real)))))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) b:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) b:real) d:real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) b:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) b:real) d:real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)) #NIL:list(prod(real,real)))))) ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) b:real) d:real)))))) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)))) ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) b:real) d:real))))))))))))))))
      #|vectorize =  |- ((#=:fun(fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))),fun(fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))),bool)) #vectorize:fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N)))) (\x:cart(cart('A,'N),'M). (#lambda:fun(fun(num,'A),cart('A,finite_prod('M,'N))) (\i:num. ((#$:fun(cart('A,'N),fun(num,'A)) ((#$:fun(cart(cart('A,'N),'M),fun(num,cart('A,'N))) x:cart(cart('A,'N),'M)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#MOD:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))))))
      #|matrify =  |- ((#=:fun(fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)),fun(fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)),bool)) #matrify:fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M))) (\x:cart('A,finite_prod('M,'N)). (#lambda:fun(fun(num,cart('A,'N)),cart(cart('A,'N),'M)) (\i:num. (#lambda:fun(fun(num,'A),cart('A,'N)) (\j:num. ((#$:fun(cart('A,finite_prod('M,'N)),fun(num,'A)) x:cart('A,finite_prod('M,'N))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) j:num))))))))
      #|VECTORIZE_COMPONENT =  |- (#forall:fun(fun(cart(cart('A,'N),'M),bool),bool) (\m:cart(cart('A,'N),'M). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) ((#*:fun(num,fun(num,num)) (#dimindex:fun(fun('M,bool),num) #UNIV:fun('M,bool))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))) ((#=:fun('A,fun('A,bool)) ((#$:fun(cart('A,finite_prod('M,'N)),fun(num,'A)) (#vectorize:fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))) m:cart(cart('A,'N),'M))) i:num)) ((#$:fun(cart('A,'N),fun(num,'A)) ((#$:fun(cart(cart('A,'N),'M),fun(num,cart('A,'N))) m:cart(cart('A,'N),'M)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#MOD:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))))))))))
      #|MATRIFY_COMPONENT =  |- (#forall:fun(fun(cart('A,finite_prod('M,'N)),bool),bool) (\v:cart('A,finite_prod('M,'N)). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('M,bool),num) #UNIV:fun('M,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) j:num)) ((#<=:fun(num,fun(num,bool)) j:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))))) ((#=:fun('A,fun('A,bool)) ((#$:fun(cart('A,'N),fun(num,'A)) ((#$:fun(cart(cart('A,'N),'M),fun(num,cart('A,'N))) (#matrify:fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)) v:cart('A,finite_prod('M,'N)))) i:num)) j:num)) ((#$:fun(cart('A,finite_prod('M,'N)),fun(num,'A)) v:cart('A,finite_prod('M,'N))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool)))) j:num))))))))))
      #|VECTORIZE_MATRIFY =  |- (#forall:fun(fun(cart('A,finite_prod('M,'N)),bool),bool) (\a:cart('A,finite_prod('M,'N)). ((#=:fun(cart('A,finite_prod('M,'N)),fun(cart('A,finite_prod('M,'N)),bool)) (#vectorize:fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))) (#matrify:fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)) a:cart('A,finite_prod('M,'N))))) a:cart('A,finite_prod('M,'N)))))
      #|MATRIFY_VECTORIZE =  |- (#forall:fun(fun(cart(cart('A,'N),'M),bool),bool) (\m:cart(cart('A,'N),'M). ((#=:fun(cart(cart('A,'N),'M),fun(cart(cart('A,'N),'M),bool)) (#matrify:fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)) (#vectorize:fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))) m:cart(cart('A,'N),'M)))) m:cart(cart('A,'N),'M))))
      #|FORALL_VECTORIZE =  |- (#forall:fun(fun(fun(cart('?3,finite_prod('?4,'?5)),bool),bool),bool) (\P:fun(cart('?3,finite_prod('?4,'?5)),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart('?3,finite_prod('?4,'?5)),bool),bool) (\x:cart('?3,finite_prod('?4,'?5)). (P:fun(cart('?3,finite_prod('?4,'?5)),bool) x:cart('?3,finite_prod('?4,'?5)))))) (#forall:fun(fun(cart(cart('?3,'?5),'?4),bool),bool) (\x:cart(cart('?3,'?5),'?4). (P:fun(cart('?3,finite_prod('?4,'?5)),bool) (#vectorize:fun(cart(cart('?3,'?5),'?4),cart('?3,finite_prod('?4,'?5))) x:cart(cart('?3,'?5),'?4))))))))
      #|FORALL_MATRIFY =  |- (#forall:fun(fun(fun(cart(cart('?6,'?7),'?8),bool),bool),bool) (\P:fun(cart(cart('?6,'?7),'?8),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(cart('?6,'?7),'?8),bool),bool) (\x:cart(cart('?6,'?7),'?8). (P:fun(cart(cart('?6,'?7),'?8),bool) x:cart(cart('?6,'?7),'?8))))) (#forall:fun(fun(cart('?6,finite_prod('?8,'?7)),bool),bool) (\x:cart('?6,finite_prod('?8,'?7)). (P:fun(cart(cart('?6,'?7),'?8),bool) (#matrify:fun(cart('?6,finite_prod('?8,'?7)),cart(cart('?6,'?7),'?8)) x:cart('?6,finite_prod('?8,'?7)))))))))
      #|EXISTS_VECTORIZE =  |- (#forall:fun(fun(fun(cart('?9,finite_prod('?10,'?11)),bool),bool),bool) (\P:fun(cart('?9,finite_prod('?10,'?11)),bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(cart('?9,finite_prod('?10,'?11)),bool),bool) (\x:cart('?9,finite_prod('?10,'?11)). (P:fun(cart('?9,finite_prod('?10,'?11)),bool) x:cart('?9,finite_prod('?10,'?11)))))) (#?:fun(fun(cart(cart('?9,'?11),'?10),bool),bool) (\x:cart(cart('?9,'?11),'?10). (P:fun(cart('?9,finite_prod('?10,'?11)),bool) (#vectorize:fun(cart(cart('?9,'?11),'?10),cart('?9,finite_prod('?10,'?11))) x:cart(cart('?9,'?11),'?10))))))))
      #|EXISTS_MATRIFY =  |- (#forall:fun(fun(fun(cart(cart('?12,'?13),'?14),bool),bool),bool) (\P:fun(cart(cart('?12,'?13),'?14),bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(cart(cart('?12,'?13),'?14),bool),bool) (\x:cart(cart('?12,'?13),'?14). (P:fun(cart(cart('?12,'?13),'?14),bool) x:cart(cart('?12,'?13),'?14))))) (#?:fun(fun(cart('?12,finite_prod('?14,'?13)),bool),bool) (\x:cart('?12,finite_prod('?14,'?13)). (P:fun(cart(cart('?12,'?13),'?14),bool) (#matrify:fun(cart('?12,finite_prod('?14,'?13)),cart(cart('?12,'?13),'?14)) x:cart('?12,finite_prod('?14,'?13)))))))))
      #|VECTORIZE_GSPEC =  |- (#forall:fun(fun(fun(cart(cart('A,'N),'M),bool),bool),bool) (\P:fun(cart(cart('A,'N),'M),bool). ((#=:fun(fun(cart('A,finite_prod('M,'N)),bool),fun(fun(cart('A,finite_prod('M,'N)),bool),bool)) (#GSPEC:fun(fun(cart('A,finite_prod('M,'N)),bool),fun(cart('A,finite_prod('M,'N)),bool)) (\GEN%PVAR%6:cart('A,finite_prod('M,'N)). (#?:fun(fun(cart(cart('A,'N),'M),bool),bool) (\m:cart(cart('A,'N),'M). (((#SETSPEC:fun(cart('A,finite_prod('M,'N)),fun(bool,fun(cart('A,finite_prod('M,'N)),bool))) GEN%PVAR%6:cart('A,finite_prod('M,'N))) (P:fun(cart(cart('A,'N),'M),bool) m:cart(cart('A,'N),'M))) (#vectorize:fun(cart(cart('A,'N),'M),cart('A,finite_prod('M,'N))) m:cart(cart('A,'N),'M)))))))) (#GSPEC:fun(fun(cart('A,finite_prod('M,'N)),bool),fun(cart('A,finite_prod('M,'N)),bool)) (\GEN%PVAR%7:cart('A,finite_prod('M,'N)). (#?:fun(fun(cart('A,finite_prod('M,'N)),bool),bool) (\v:cart('A,finite_prod('M,'N)). (((#SETSPEC:fun(cart('A,finite_prod('M,'N)),fun(bool,fun(cart('A,finite_prod('M,'N)),bool))) GEN%PVAR%7:cart('A,finite_prod('M,'N))) (P:fun(cart(cart('A,'N),'M),bool) (#matrify:fun(cart('A,finite_prod('M,'N)),cart(cart('A,'N),'M)) v:cart('A,finite_prod('M,'N))))) v:cart('A,finite_prod('M,'N))))))))))
      #|VECTORIZE_EQ =  |- (#forall:fun(fun(cart(cart(real,'N),'M),bool),bool) (\m1:cart(cart(real,'N),'M). (#forall:fun(fun(cart(cart(real,'N),'M),bool),bool) (\m2:cart(cart(real,'N),'M). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(cart(real,finite_prod('M,'N)),fun(cart(real,finite_prod('M,'N)),bool)) (#vectorize:fun(cart(cart(real,'N),'M),cart(real,finite_prod('M,'N))) m1:cart(cart(real,'N),'M))) (#vectorize:fun(cart(cart(real,'N),'M),cart(real,finite_prod('M,'N))) m2:cart(cart(real,'N),'M)))) ((#=:fun(cart(cart(real,'N),'M),fun(cart(cart(real,'N),'M),bool)) m1:cart(cart(real,'N),'M)) m2:cart(cart(real,'N),'M)))))))
      #|MATRIFY_EQ =  |- (#forall:fun(fun(cart(real,finite_prod('M,'N)),bool),bool) (\m1:cart(real,finite_prod('M,'N)). (#forall:fun(fun(cart(real,finite_prod('M,'N)),bool),bool) (\m2:cart(real,finite_prod('M,'N)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(cart(cart(real,'N),'M),fun(cart(cart(real,'N),'M),bool)) (#matrify:fun(cart(real,finite_prod('M,'N)),cart(cart(real,'N),'M)) m1:cart(real,finite_prod('M,'N)))) (#matrify:fun(cart(real,finite_prod('M,'N)),cart(cart(real,'N),'M)) m2:cart(real,finite_prod('M,'N))))) ((#=:fun(cart(real,finite_prod('M,'N)),fun(cart(real,finite_prod('M,'N)),bool)) m1:cart(real,finite_prod('M,'N))) m2:cart(real,finite_prod('M,'N))))))))
      #|hull =  |- (#forall:fun(fun(fun(fun('?15,bool),bool),bool),bool) (\P:fun(fun('?15,bool),bool). (#forall:fun(fun(fun('?15,bool),bool),bool) (\s:fun('?15,bool). ((#=:fun(fun('?15,bool),fun(fun('?15,bool),bool)) ((#hull:fun(fun(fun('?15,bool),bool),fun(fun('?15,bool),fun('?15,bool))) P:fun(fun('?15,bool),bool)) s:fun('?15,bool))) (#INTERS:fun(fun(fun('?15,bool),bool),fun('?15,bool)) (#GSPEC:fun(fun(fun('?15,bool),bool),fun(fun('?15,bool),bool)) (\GEN%PVAR%8:fun('?15,bool). (#?:fun(fun(fun('?15,bool),bool),bool) (\t:fun('?15,bool). (((#SETSPEC:fun(fun('?15,bool),fun(bool,fun(fun('?15,bool),bool))) GEN%PVAR%8:fun('?15,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?15,bool),bool) t:fun('?15,bool))) ((#SUBSET:fun(fun('?15,bool),fun(fun('?15,bool),bool)) s:fun('?15,bool)) t:fun('?15,bool)))) t:fun('?15,bool))))))))))))
      #|HULL_P =  |- (#forall:fun(fun(fun(fun('?16,bool),bool),bool),bool) (\P:fun(fun('?16,bool),bool). (#forall:fun(fun(fun('?16,bool),bool),bool) (\s:fun('?16,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?16,bool),bool) s:fun('?16,bool))) ((#=:fun(fun('?16,bool),fun(fun('?16,bool),bool)) ((#hull:fun(fun(fun('?16,bool),bool),fun(fun('?16,bool),fun('?16,bool))) P:fun(fun('?16,bool),bool)) s:fun('?16,bool))) s:fun('?16,bool)))))))
      #|P_HULL =  |- (#forall:fun(fun(fun(fun('?17,bool),bool),bool),bool) (\P:fun(fun('?17,bool),bool). (#forall:fun(fun(fun('?17,bool),bool),bool) (\s:fun('?17,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?17,bool),bool),bool),bool) (\f:fun(fun('?17,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?17,bool),bool),bool) (\s:fun('?17,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?17,bool),fun(fun(fun('?17,bool),bool),bool)) s:fun('?17,bool)) f:fun(fun('?17,bool),bool))) (P:fun(fun('?17,bool),bool) s:fun('?17,bool)))))) (P:fun(fun('?17,bool),bool) (#INTERS:fun(fun(fun('?17,bool),bool),fun('?17,bool)) f:fun(fun('?17,bool),bool))))))) (P:fun(fun('?17,bool),bool) ((#hull:fun(fun(fun('?17,bool),bool),fun(fun('?17,bool),fun('?17,bool))) P:fun(fun('?17,bool),bool)) s:fun('?17,bool))))))))
      #|HULL_EQ =  |- (#forall:fun(fun(fun(fun('?18,bool),bool),bool),bool) (\P:fun(fun('?18,bool),bool). (#forall:fun(fun(fun('?18,bool),bool),bool) (\s:fun('?18,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?18,bool),bool),bool),bool) (\f:fun(fun('?18,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?18,bool),bool),bool) (\s:fun('?18,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?18,bool),fun(fun(fun('?18,bool),bool),bool)) s:fun('?18,bool)) f:fun(fun('?18,bool),bool))) (P:fun(fun('?18,bool),bool) s:fun('?18,bool)))))) (P:fun(fun('?18,bool),bool) (#INTERS:fun(fun(fun('?18,bool),bool),fun('?18,bool)) f:fun(fun('?18,bool),bool))))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('?18,bool),fun(fun('?18,bool),bool)) ((#hull:fun(fun(fun('?18,bool),bool),fun(fun('?18,bool),fun('?18,bool))) P:fun(fun('?18,bool),bool)) s:fun('?18,bool))) s:fun('?18,bool))) (P:fun(fun('?18,bool),bool) s:fun('?18,bool))))))))
      #|HULL_HULL =  |- (#forall:fun(fun(fun(fun('?19,bool),bool),bool),bool) (\P:fun(fun('?19,bool),bool). (#forall:fun(fun(fun('?19,bool),bool),bool) (\s:fun('?19,bool). ((#=:fun(fun('?19,bool),fun(fun('?19,bool),bool)) ((#hull:fun(fun(fun('?19,bool),bool),fun(fun('?19,bool),fun('?19,bool))) P:fun(fun('?19,bool),bool)) ((#hull:fun(fun(fun('?19,bool),bool),fun(fun('?19,bool),fun('?19,bool))) P:fun(fun('?19,bool),bool)) s:fun('?19,bool)))) ((#hull:fun(fun(fun('?19,bool),bool),fun(fun('?19,bool),fun('?19,bool))) P:fun(fun('?19,bool),bool)) s:fun('?19,bool)))))))
      #|HULL_SUBSET =  |- (#forall:fun(fun(fun(fun('?20,bool),bool),bool),bool) (\P:fun(fun('?20,bool),bool). (#forall:fun(fun(fun('?20,bool),bool),bool) (\s:fun('?20,bool). ((#SUBSET:fun(fun('?20,bool),fun(fun('?20,bool),bool)) s:fun('?20,bool)) ((#hull:fun(fun(fun('?20,bool),bool),fun(fun('?20,bool),fun('?20,bool))) P:fun(fun('?20,bool),bool)) s:fun('?20,bool)))))))
      #|HULL_MONO =  |- (#forall:fun(fun(fun(fun('?21,bool),bool),bool),bool) (\P:fun(fun('?21,bool),bool). (#forall:fun(fun(fun('?21,bool),bool),bool) (\s:fun('?21,bool). (#forall:fun(fun(fun('?21,bool),bool),bool) (\t:fun('?21,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?21,bool),fun(fun('?21,bool),bool)) s:fun('?21,bool)) t:fun('?21,bool))) ((#SUBSET:fun(fun('?21,bool),fun(fun('?21,bool),bool)) ((#hull:fun(fun(fun('?21,bool),bool),fun(fun('?21,bool),fun('?21,bool))) P:fun(fun('?21,bool),bool)) s:fun('?21,bool))) ((#hull:fun(fun(fun('?21,bool),bool),fun(fun('?21,bool),fun('?21,bool))) P:fun(fun('?21,bool),bool)) t:fun('?21,bool))))))))))
      #|HULL_ANTIMONO =  |- (#forall:fun(fun(fun(fun('?22,bool),bool),bool),bool) (\P:fun(fun('?22,bool),bool). (#forall:fun(fun(fun(fun('?22,bool),bool),bool),bool) (\Q:fun(fun('?22,bool),bool). (#forall:fun(fun(fun('?22,bool),bool),bool) (\s:fun('?22,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('?22,bool),bool),fun(fun(fun('?22,bool),bool),bool)) P:fun(fun('?22,bool),bool)) Q:fun(fun('?22,bool),bool))) ((#SUBSET:fun(fun('?22,bool),fun(fun('?22,bool),bool)) ((#hull:fun(fun(fun('?22,bool),bool),fun(fun('?22,bool),fun('?22,bool))) Q:fun(fun('?22,bool),bool)) s:fun('?22,bool))) ((#hull:fun(fun(fun('?22,bool),bool),fun(fun('?22,bool),fun('?22,bool))) P:fun(fun('?22,bool),bool)) s:fun('?22,bool))))))))))
      #|HULL_UNIV =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool))) #UNIV:fun('A,bool))))
      #|HULL_MINIMAL =  |- (#forall:fun(fun(fun(fun('?23,bool),bool),bool),bool) (\P:fun(fun('?23,bool),bool). (#forall:fun(fun(fun('?23,bool),bool),bool) (\s:fun('?23,bool). (#forall:fun(fun(fun('?23,bool),bool),bool) (\t:fun('?23,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?23,bool),fun(fun('?23,bool),bool)) s:fun('?23,bool)) t:fun('?23,bool))) (P:fun(fun('?23,bool),bool) t:fun('?23,bool)))) ((#SUBSET:fun(fun('?23,bool),fun(fun('?23,bool),bool)) ((#hull:fun(fun(fun('?23,bool),bool),fun(fun('?23,bool),fun('?23,bool))) P:fun(fun('?23,bool),bool)) s:fun('?23,bool))) t:fun('?23,bool)))))))))
      #|SUBSET_HULL =  |- (#forall:fun(fun(fun(fun('?24,bool),bool),bool),bool) (\P:fun(fun('?24,bool),bool). (#forall:fun(fun(fun('?24,bool),bool),bool) (\s:fun('?24,bool). (#forall:fun(fun(fun('?24,bool),bool),bool) (\t:fun('?24,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?24,bool),bool) t:fun('?24,bool))) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?24,bool),fun(fun('?24,bool),bool)) ((#hull:fun(fun(fun('?24,bool),bool),fun(fun('?24,bool),fun('?24,bool))) P:fun(fun('?24,bool),bool)) s:fun('?24,bool))) t:fun('?24,bool))) ((#SUBSET:fun(fun('?24,bool),fun(fun('?24,bool),bool)) s:fun('?24,bool)) t:fun('?24,bool))))))))))
      #|HULL_UNIQUE =  |- (#forall:fun(fun(fun(fun('?25,bool),bool),bool),bool) (\P:fun(fun('?25,bool),bool). (#forall:fun(fun(fun('?25,bool),bool),bool) (\s:fun('?25,bool). (#forall:fun(fun(fun('?25,bool),bool),bool) (\t:fun('?25,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?25,bool),fun(fun('?25,bool),bool)) s:fun('?25,bool)) t:fun('?25,bool))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?25,bool),bool) t:fun('?25,bool))) (#forall:fun(fun(fun('?25,bool),bool),bool) (\t':fun('?25,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?25,bool),fun(fun('?25,bool),bool)) s:fun('?25,bool)) t':fun('?25,bool))) (P:fun(fun('?25,bool),bool) t':fun('?25,bool)))) ((#SUBSET:fun(fun('?25,bool),fun(fun('?25,bool),bool)) t:fun('?25,bool)) t':fun('?25,bool)))))))) ((#=:fun(fun('?25,bool),fun(fun('?25,bool),bool)) ((#hull:fun(fun(fun('?25,bool),bool),fun(fun('?25,bool),fun('?25,bool))) P:fun(fun('?25,bool),bool)) s:fun('?25,bool))) t:fun('?25,bool)))))))))
      #|HULL_UNION_SUBSET =  |- (#forall:fun(fun(fun(fun('?26,bool),bool),bool),bool) (\P:fun(fun('?26,bool),bool). (#forall:fun(fun(fun('?26,bool),bool),bool) (\s:fun('?26,bool). (#forall:fun(fun(fun('?26,bool),bool),bool) (\t:fun('?26,bool). ((#SUBSET:fun(fun('?26,bool),fun(fun('?26,bool),bool)) ((#UNION:fun(fun('?26,bool),fun(fun('?26,bool),fun('?26,bool))) ((#hull:fun(fun(fun('?26,bool),bool),fun(fun('?26,bool),fun('?26,bool))) P:fun(fun('?26,bool),bool)) s:fun('?26,bool))) ((#hull:fun(fun(fun('?26,bool),bool),fun(fun('?26,bool),fun('?26,bool))) P:fun(fun('?26,bool),bool)) t:fun('?26,bool)))) ((#hull:fun(fun(fun('?26,bool),bool),fun(fun('?26,bool),fun('?26,bool))) P:fun(fun('?26,bool),bool)) ((#UNION:fun(fun('?26,bool),fun(fun('?26,bool),fun('?26,bool))) s:fun('?26,bool)) t:fun('?26,bool))))))))))
      #|HULL_UNION =  |- (#forall:fun(fun(fun(fun('?27,bool),bool),bool),bool) (\P:fun(fun('?27,bool),bool). (#forall:fun(fun(fun('?27,bool),bool),bool) (\s:fun('?27,bool). (#forall:fun(fun(fun('?27,bool),bool),bool) (\t:fun('?27,bool). ((#=:fun(fun('?27,bool),fun(fun('?27,bool),bool)) ((#hull:fun(fun(fun('?27,bool),bool),fun(fun('?27,bool),fun('?27,bool))) P:fun(fun('?27,bool),bool)) ((#UNION:fun(fun('?27,bool),fun(fun('?27,bool),fun('?27,bool))) s:fun('?27,bool)) t:fun('?27,bool)))) ((#hull:fun(fun(fun('?27,bool),bool),fun(fun('?27,bool),fun('?27,bool))) P:fun(fun('?27,bool),bool)) ((#UNION:fun(fun('?27,bool),fun(fun('?27,bool),fun('?27,bool))) ((#hull:fun(fun(fun('?27,bool),bool),fun(fun('?27,bool),fun('?27,bool))) P:fun(fun('?27,bool),bool)) s:fun('?27,bool))) ((#hull:fun(fun(fun('?27,bool),bool),fun(fun('?27,bool),fun('?27,bool))) P:fun(fun('?27,bool),bool)) t:fun('?27,bool)))))))))))
      #|HULL_UNION_LEFT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool))) t:fun('A,bool))))))))))
      #|HULL_UNION_RIGHT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) t:fun('A,bool)))))))))))
      #|HULL_INSERT =  |- (#forall:fun(fun(fun(fun('?28,bool),bool),bool),bool) (\P:fun(fun('?28,bool),bool). (#forall:fun(fun('?28,bool),bool) (\a:'?28. (#forall:fun(fun(fun('?28,bool),bool),bool) (\s:fun('?28,bool). ((#=:fun(fun('?28,bool),fun(fun('?28,bool),bool)) ((#hull:fun(fun(fun('?28,bool),bool),fun(fun('?28,bool),fun('?28,bool))) P:fun(fun('?28,bool),bool)) ((#INSERT:fun('?28,fun(fun('?28,bool),fun('?28,bool))) a:'?28) s:fun('?28,bool)))) ((#hull:fun(fun(fun('?28,bool),bool),fun(fun('?28,bool),fun('?28,bool))) P:fun(fun('?28,bool),bool)) ((#INSERT:fun('?28,fun(fun('?28,bool),fun('?28,bool))) a:'?28) ((#hull:fun(fun(fun('?28,bool),bool),fun(fun('?28,bool),fun('?28,bool))) P:fun(fun('?28,bool),bool)) s:fun('?28,bool)))))))))))
      #|HULL_REDUNDANT_EQ =  |- (#forall:fun(fun(fun(fun('?29,bool),bool),bool),bool) (\P:fun(fun('?29,bool),bool). (#forall:fun(fun('?29,bool),bool) (\a:'?29. (#forall:fun(fun(fun('?29,bool),bool),bool) (\s:fun('?29,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('?29,fun(fun('?29,bool),bool)) a:'?29) ((#hull:fun(fun(fun('?29,bool),bool),fun(fun('?29,bool),fun('?29,bool))) P:fun(fun('?29,bool),bool)) s:fun('?29,bool)))) ((#=:fun(fun('?29,bool),fun(fun('?29,bool),bool)) ((#hull:fun(fun(fun('?29,bool),bool),fun(fun('?29,bool),fun('?29,bool))) P:fun(fun('?29,bool),bool)) ((#INSERT:fun('?29,fun(fun('?29,bool),fun('?29,bool))) a:'?29) s:fun('?29,bool)))) ((#hull:fun(fun(fun('?29,bool),bool),fun(fun('?29,bool),fun('?29,bool))) P:fun(fun('?29,bool),bool)) s:fun('?29,bool))))))))))
      #|HULL_REDUNDANT =  |- (#forall:fun(fun(fun(fun('?30,bool),bool),bool),bool) (\P:fun(fun('?30,bool),bool). (#forall:fun(fun('?30,bool),bool) (\a:'?30. (#forall:fun(fun(fun('?30,bool),bool),bool) (\s:fun('?30,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?30,fun(fun('?30,bool),bool)) a:'?30) ((#hull:fun(fun(fun('?30,bool),bool),fun(fun('?30,bool),fun('?30,bool))) P:fun(fun('?30,bool),bool)) s:fun('?30,bool)))) ((#=:fun(fun('?30,bool),fun(fun('?30,bool),bool)) ((#hull:fun(fun(fun('?30,bool),bool),fun(fun('?30,bool),fun('?30,bool))) P:fun(fun('?30,bool),bool)) ((#INSERT:fun('?30,fun(fun('?30,bool),fun('?30,bool))) a:'?30) s:fun('?30,bool)))) ((#hull:fun(fun(fun('?30,bool),bool),fun(fun('?30,bool),fun('?30,bool))) P:fun(fun('?30,bool),bool)) s:fun('?30,bool))))))))))
      #|HULL_INDUCT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (p:fun('A,bool) x:'A))))) (P:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%9:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%9:'A) (p:fun('A,bool) x:'A)) x:'A)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)))) (p:fun('A,bool) x:'A)))))))))))
      #|HULL_INC =  |- (#forall:fun(fun(fun(fun('?31,bool),bool),bool),bool) (\P:fun(fun('?31,bool),bool). (#forall:fun(fun(fun('?31,bool),bool),bool) (\s:fun('?31,bool). (#forall:fun(fun('?31,bool),bool) (\x:'?31. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?31,fun(fun('?31,bool),bool)) x:'?31) s:fun('?31,bool))) ((#IN:fun('?31,fun(fun('?31,bool),bool)) x:'?31) ((#hull:fun(fun(fun('?31,bool),bool),fun(fun('?31,bool),fun('?31,bool))) P:fun(fun('?31,bool),bool)) s:fun('?31,bool))))))))))
      #|HULL_IMAGE_SUBSET =  |- (#forall:fun(fun(fun(fun('?32,bool),bool),bool),bool) (\P:fun(fun('?32,bool),bool). (#forall:fun(fun(fun('?32,'?32),bool),bool) (\f:fun('?32,'?32). (#forall:fun(fun(fun('?32,bool),bool),bool) (\s:fun('?32,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?32,bool),bool) ((#hull:fun(fun(fun('?32,bool),bool),fun(fun('?32,bool),fun('?32,bool))) P:fun(fun('?32,bool),bool)) s:fun('?32,bool)))) (#forall:fun(fun(fun('?32,bool),bool),bool) (\s:fun('?32,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?32,bool),bool) s:fun('?32,bool))) (P:fun(fun('?32,bool),bool) ((#IMAGE:fun(fun('?32,'?32),fun(fun('?32,bool),fun('?32,bool))) f:fun('?32,'?32)) s:fun('?32,bool)))))))) ((#SUBSET:fun(fun('?32,bool),fun(fun('?32,bool),bool)) ((#hull:fun(fun(fun('?32,bool),bool),fun(fun('?32,bool),fun('?32,bool))) P:fun(fun('?32,bool),bool)) ((#IMAGE:fun(fun('?32,'?32),fun(fun('?32,bool),fun('?32,bool))) f:fun('?32,'?32)) s:fun('?32,bool)))) ((#IMAGE:fun(fun('?32,'?32),fun(fun('?32,bool),fun('?32,bool))) f:fun('?32,'?32)) ((#hull:fun(fun(fun('?32,bool),bool),fun(fun('?32,bool),fun('?32,bool))) P:fun(fun('?32,bool),bool)) s:fun('?32,bool)))))))))))
      #|HULL_IMAGE_GALOIS =  |- (#forall:fun(fun(fun(fun('?33,bool),bool),bool),bool) (\P:fun(fun('?33,bool),bool). (#forall:fun(fun(fun('?33,'?33),bool),bool) (\f:fun('?33,'?33). (#forall:fun(fun(fun('?33,'?33),bool),bool) (\g:fun('?33,'?33). (#forall:fun(fun(fun('?33,bool),bool),bool) (\s:fun('?33,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?33,bool),bool),bool) (\s:fun('?33,bool). (P:fun(fun('?33,bool),bool) ((#hull:fun(fun(fun('?33,bool),bool),fun(fun('?33,bool),fun('?33,bool))) P:fun(fun('?33,bool),bool)) s:fun('?33,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?33,bool),bool),bool) (\s:fun('?33,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?33,bool),bool) s:fun('?33,bool))) (P:fun(fun('?33,bool),bool) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) f:fun('?33,'?33)) s:fun('?33,bool))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?33,bool),bool),bool) (\s:fun('?33,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?33,bool),bool) s:fun('?33,bool))) (P:fun(fun('?33,bool),bool) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) g:fun('?33,'?33)) s:fun('?33,bool))))))) (#forall:fun(fun(fun('?33,bool),bool),bool) (\s:fun('?33,bool). (#forall:fun(fun(fun('?33,bool),bool),bool) (\t:fun('?33,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?33,bool),fun(fun('?33,bool),bool)) s:fun('?33,bool)) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) g:fun('?33,'?33)) t:fun('?33,bool)))) ((#SUBSET:fun(fun('?33,bool),fun(fun('?33,bool),bool)) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) f:fun('?33,'?33)) s:fun('?33,bool))) t:fun('?33,bool))))))))))) ((#=:fun(fun('?33,bool),fun(fun('?33,bool),bool)) ((#hull:fun(fun(fun('?33,bool),bool),fun(fun('?33,bool),fun('?33,bool))) P:fun(fun('?33,bool),bool)) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) f:fun('?33,'?33)) s:fun('?33,bool)))) ((#IMAGE:fun(fun('?33,'?33),fun(fun('?33,bool),fun('?33,bool))) f:fun('?33,'?33)) ((#hull:fun(fun(fun('?33,bool),bool),fun(fun('?33,bool),fun('?33,bool))) P:fun(fun('?33,bool),bool)) s:fun('?33,bool)))))))))))))
      #|HULL_IMAGE =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool)))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\y:'A. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) y:'A))))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool)))) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) ((#hull:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))))))
      #|IS_HULL =  |- (#forall:fun(fun(fun(fun('?34,bool),bool),bool),bool) (\P:fun(fun('?34,bool),bool). (#forall:fun(fun(fun('?34,bool),bool),bool) (\s:fun('?34,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?34,bool),bool),bool),bool) (\f:fun(fun('?34,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?34,bool),bool),bool) (\s:fun('?34,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?34,bool),fun(fun(fun('?34,bool),bool),bool)) s:fun('?34,bool)) f:fun(fun('?34,bool),bool))) (P:fun(fun('?34,bool),bool) s:fun('?34,bool)))))) (P:fun(fun('?34,bool),bool) (#INTERS:fun(fun(fun('?34,bool),bool),fun('?34,bool)) f:fun(fun('?34,bool),bool))))))) ((#=:fun(bool,fun(bool,bool)) (P:fun(fun('?34,bool),bool) s:fun('?34,bool))) (#?:fun(fun(fun('?34,bool),bool),bool) (\t:fun('?34,bool). ((#=:fun(fun('?34,bool),fun(fun('?34,bool),bool)) s:fun('?34,bool)) ((#hull:fun(fun(fun('?34,bool),bool),fun(fun('?34,bool),fun('?34,bool))) P:fun(fun('?34,bool),bool)) t:fun('?34,bool)))))))))))
      #|HULLS_EQ =  |- (#forall:fun(fun(fun(fun('?35,bool),bool),bool),bool) (\P:fun(fun('?35,bool),bool). (#forall:fun(fun(fun('?35,bool),bool),bool) (\s:fun('?35,bool). (#forall:fun(fun(fun('?35,bool),bool),bool) (\t:fun('?35,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?35,bool),bool),bool),bool) (\f:fun(fun('?35,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?35,bool),bool),bool) (\s:fun('?35,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?35,bool),fun(fun(fun('?35,bool),bool),bool)) s:fun('?35,bool)) f:fun(fun('?35,bool),bool))) (P:fun(fun('?35,bool),bool) s:fun('?35,bool)))))) (P:fun(fun('?35,bool),bool) (#INTERS:fun(fun(fun('?35,bool),bool),fun('?35,bool)) f:fun(fun('?35,bool),bool))))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?35,bool),fun(fun('?35,bool),bool)) s:fun('?35,bool)) ((#hull:fun(fun(fun('?35,bool),bool),fun(fun('?35,bool),fun('?35,bool))) P:fun(fun('?35,bool),bool)) t:fun('?35,bool)))) ((#SUBSET:fun(fun('?35,bool),fun(fun('?35,bool),bool)) t:fun('?35,bool)) ((#hull:fun(fun(fun('?35,bool),bool),fun(fun('?35,bool),fun('?35,bool))) P:fun(fun('?35,bool),bool)) s:fun('?35,bool)))))) ((#=:fun(fun('?35,bool),fun(fun('?35,bool),bool)) ((#hull:fun(fun(fun('?35,bool),bool),fun(fun('?35,bool),fun('?35,bool))) P:fun(fun('?35,bool),bool)) s:fun('?35,bool))) ((#hull:fun(fun(fun('?35,bool),bool),fun(fun('?35,bool),fun('?35,bool))) P:fun(fun('?35,bool),bool)) t:fun('?35,bool))))))))))
      #|HULL_P_AND_Q =  |- (#forall:fun(fun(fun(fun('?36,bool),bool),bool),bool) (\P:fun(fun('?36,bool),bool). (#forall:fun(fun(fun(fun('?36,bool),bool),bool),bool) (\Q:fun(fun('?36,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?36,bool),bool),bool),bool) (\f:fun(fun('?36,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?36,bool),bool),bool) (\s:fun('?36,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?36,bool),fun(fun(fun('?36,bool),bool),bool)) s:fun('?36,bool)) f:fun(fun('?36,bool),bool))) (P:fun(fun('?36,bool),bool) s:fun('?36,bool)))))) (P:fun(fun('?36,bool),bool) (#INTERS:fun(fun(fun('?36,bool),bool),fun('?36,bool)) f:fun(fun('?36,bool),bool))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('?36,bool),bool),bool),bool) (\f:fun(fun('?36,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?36,bool),bool),bool) (\s:fun('?36,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('?36,bool),fun(fun(fun('?36,bool),bool),bool)) s:fun('?36,bool)) f:fun(fun('?36,bool),bool))) (Q:fun(fun('?36,bool),bool) s:fun('?36,bool)))))) (Q:fun(fun('?36,bool),bool) (#INTERS:fun(fun(fun('?36,bool),bool),fun('?36,bool)) f:fun(fun('?36,bool),bool))))))) (#forall:fun(fun(fun('?36,bool),bool),bool) (\s:fun('?36,bool). ((#==>:fun(bool,fun(bool,bool)) (Q:fun(fun('?36,bool),bool) s:fun('?36,bool))) (Q:fun(fun('?36,bool),bool) ((#hull:fun(fun(fun('?36,bool),bool),fun(fun('?36,bool),fun('?36,bool))) P:fun(fun('?36,bool),bool)) s:fun('?36,bool))))))))) ((#=:fun(fun('?36,bool),fun(fun('?36,bool),bool)) ((#hull:fun(fun(fun('?36,bool),bool),fun(fun('?36,bool),fun('?36,bool))) (\x:fun('?36,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?36,bool),bool) x:fun('?36,bool))) (Q:fun(fun('?36,bool),bool) x:fun('?36,bool))))) s:fun('?36,bool))) ((#hull:fun(fun(fun('?36,bool),bool),fun(fun('?36,bool),fun('?36,bool))) P:fun(fun('?36,bool),bool)) ((#hull:fun(fun(fun('?36,bool),bool),fun(fun('?36,bool),fun('?36,bool))) Q:fun(fun('?36,bool),bool)) s:fun('?36,bool)))))))))
      #|HULL_UNIONS_SUBSET =  |- (#forall:fun(fun(fun(fun('?37,bool),bool),bool),bool) (\P:fun(fun('?37,bool),bool). (#forall:fun(fun(fun(fun('?37,bool),bool),bool),bool) (\f:fun(fun('?37,bool),bool). ((#SUBSET:fun(fun('?37,bool),fun(fun('?37,bool),bool)) (#UNIONS:fun(fun(fun('?37,bool),bool),fun('?37,bool)) (#GSPEC:fun(fun(fun('?37,bool),bool),fun(fun('?37,bool),bool)) (\GEN%PVAR%10:fun('?37,bool). (#?:fun(fun(fun('?37,bool),bool),bool) (\s:fun('?37,bool). (((#SETSPEC:fun(fun('?37,bool),fun(bool,fun(fun('?37,bool),bool))) GEN%PVAR%10:fun('?37,bool)) ((#IN:fun(fun('?37,bool),fun(fun(fun('?37,bool),bool),bool)) s:fun('?37,bool)) f:fun(fun('?37,bool),bool))) ((#hull:fun(fun(fun('?37,bool),bool),fun(fun('?37,bool),fun('?37,bool))) P:fun(fun('?37,bool),bool)) s:fun('?37,bool))))))))) ((#hull:fun(fun(fun('?37,bool),bool),fun(fun('?37,bool),fun('?37,bool))) P:fun(fun('?37,bool),bool)) (#UNIONS:fun(fun(fun('?37,bool),bool),fun('?37,bool)) f:fun(fun('?37,bool),bool))))))))
      #|HULL_INTERS_SUBSET =  |- (#forall:fun(fun(fun(fun('?38,bool),bool),bool),bool) (\P:fun(fun('?38,bool),bool). (#forall:fun(fun(fun(fun('?38,bool),bool),bool),bool) (\f:fun(fun('?38,bool),bool). ((#SUBSET:fun(fun('?38,bool),fun(fun('?38,bool),bool)) ((#hull:fun(fun(fun('?38,bool),bool),fun(fun('?38,bool),fun('?38,bool))) P:fun(fun('?38,bool),bool)) (#INTERS:fun(fun(fun('?38,bool),bool),fun('?38,bool)) f:fun(fun('?38,bool),bool)))) (#INTERS:fun(fun(fun('?38,bool),bool),fun('?38,bool)) (#GSPEC:fun(fun(fun('?38,bool),bool),fun(fun('?38,bool),bool)) (\GEN%PVAR%11:fun('?38,bool). (#?:fun(fun(fun('?38,bool),bool),bool) (\s:fun('?38,bool). (((#SETSPEC:fun(fun('?38,bool),fun(bool,fun(fun('?38,bool),bool))) GEN%PVAR%11:fun('?38,bool)) ((#IN:fun(fun('?38,bool),fun(fun(fun('?38,bool),bool),bool)) s:fun('?38,bool)) f:fun(fun('?38,bool),bool))) ((#hull:fun(fun(fun('?38,bool),bool),fun(fun('?38,bool),fun('?38,bool))) P:fun(fun('?38,bool),bool)) s:fun('?38,bool)))))))))))))
      #|HULL_INTER_SUBSET =  |- (#forall:fun(fun(fun(fun('?39,bool),bool),bool),bool) (\P:fun(fun('?39,bool),bool). (#forall:fun(fun(fun('?39,bool),bool),bool) (\s:fun('?39,bool). (#forall:fun(fun(fun('?39,bool),bool),bool) (\t:fun('?39,bool). ((#SUBSET:fun(fun('?39,bool),fun(fun('?39,bool),bool)) ((#hull:fun(fun(fun('?39,bool),bool),fun(fun('?39,bool),fun('?39,bool))) P:fun(fun('?39,bool),bool)) ((#INTER:fun(fun('?39,bool),fun(fun('?39,bool),fun('?39,bool))) s:fun('?39,bool)) t:fun('?39,bool)))) ((#INTER:fun(fun('?39,bool),fun(fun('?39,bool),fun('?39,bool))) ((#hull:fun(fun(fun('?39,bool),bool),fun(fun('?39,bool),fun('?39,bool))) P:fun(fun('?39,bool),bool)) s:fun('?39,bool))) ((#hull:fun(fun(fun('?39,bool),bool),fun(fun('?39,bool),fun('?39,bool))) P:fun(fun('?39,bool),bool)) t:fun('?39,bool))))))))))
      #|FORALL_POS_MONO =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) d:real) e:real)) (P:fun(real,bool) d:real))) (P:fun(real,bool) e:real))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (P:fun(real,bool) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) n:num)))))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (P:fun(real,bool) e:real)))))))
      #|FORALL_POS_MONO_1 =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) d:real) e:real)) (P:fun(real,bool) d:real))) (P:fun(real,bool) e:real))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(real,bool) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (P:fun(real,bool) e:real)))))))
      #|FORALL_POS_MONO_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) d:real) e:real)) (P:fun(real,bool) d:real))) (P:fun(real,bool) e:real))))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (P:fun(real,bool) e:real))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (P:fun(real,bool) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) n:num))))))))))
      #|FORALL_POS_MONO_1_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\d:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) d:real) e:real)) (P:fun(real,bool) d:real))) (P:fun(real,bool) e:real))))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (P:fun(real,bool) e:real))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(real,bool) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|REAL_ARCH_RDIV_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) c:real)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) x:real)) c:real))))))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FINITE_INDEX_NUMSEG_SPECIAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) j:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) i:num)) (f:fun(num,'A) j:num))))) ((#=:fun(num,fun(num,bool)) i:num) j:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:'A))))))))))
      #|SUM_GP_BASIC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))))))))
      #|SUM_GP_MULTIPLIED =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num)))))))))))
      #|SUM_GP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num)))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))))))))))
      #|SUM_GP_OFFSET =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num)))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))))))))))
      #|from =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#from:fun(num,fun(num,bool)) n:num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%12:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%12:num) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) m:num))))))))
      #|FROM_0 =  |- ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) #UNIV:fun(num,bool))
      #|IN_FROM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) m:num) (#from:fun(num,fun(num,bool)) n:num))) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|FROM_MONO =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) (#from:fun(num,fun(num,bool)) m:num)) (#from:fun(num,fun(num,bool)) n:num))) ((#<=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|FROM_INTER_NUMSEG_GEN =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#from:fun(num,fun(num,bool)) k:num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))) (((#COND:fun(bool,fun(fun(num,bool),fun(fun(num,bool),fun(num,bool)))) ((#<:fun(num,fun(num,bool)) m:num) k:num)) ((#..:fun(num,fun(num,fun(num,bool))) k:num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))))
      #|FROM_INTER_NUMSEG_MAX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#from:fun(num,fun(num,bool)) p:num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) ((#MAX:fun(num,fun(num,num)) p:num) m:num)) n:num))))))))
      #|FROM_INTER_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#from:fun(num,fun(num,bool)) k:num)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) k:num) n:num))))))
      #|INFINITE_FROM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#INFINITE:fun(fun(num,bool),bool) (#from:fun(num,fun(num,bool)) n:num))))
      #|FINITE_INTER_NUMSEG =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#FINITE:fun(fun(num,bool),bool) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))))
      #|FROM_NONEMPTY =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#from:fun(num,fun(num,bool)) n:num)) #EMPTY:fun(num,bool)))))
      #|SUBSEQUENCE_STEPWISE =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (r:fun(num,num) n:num)) (r:fun(num,num) (#SUC:fun(num,num) n:num))))))))
      #|SUBSEQUENCE_IMP_INJECTIVE =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|MONOTONE_BIGGER =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) (r:fun(num,num) n:num)))))))
      #|INFINITE_ENUMERATE_WEAK =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun(num,fun(fun(num,bool),bool)) (r:fun(num,num) n:num)) s:fun(num,bool))))))))))
      #|INFINITE_ENUMERATE_EQ_ALT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun(num,fun(fun(num,bool),bool)) (r:fun(num,num) n:num)) s:fun(num,bool))))))))))
      #|MONOTONE_SUBSEQUENCE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (s:fun(num,real) (r:fun(num,num) m:num))) (s:fun(num,real) (r:fun(num,num) n:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (s:fun(num,real) (r:fun(num,num) n:num))) (s:fun(num,real) (r:fun(num,num) m:num))))))))))))))
      #|CONVERGENT_BOUNDED_INCREASING =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (s:fun(num,real) m:num)) (s:fun(num,real) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (s:fun(num,real) n:num))) b:real))))) (#?:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (s:fun(num,real) n:num)) l:real))) e:real))))))))))))))))
      #|CONVERGENT_BOUNDED_MONOTONE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (s:fun(num,real) n:num))) b:real)))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (s:fun(num,real) m:num)) (s:fun(num,real) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (s:fun(num,real) n:num)) (s:fun(num,real) m:num)))))))))) (#?:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (s:fun(num,real) n:num)) l:real))) e:real))))))))))))))))
      #|STRICTLY_INCREASING_ALT =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real))))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))))))
      #|STRICTLY_DECREASING_ALT =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real))))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))))))
      #|REAL_NON_MONOTONE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real))))))))) (#~:fun(bool,bool) (#?:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(real,bool),bool) (\y:real. (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) z:real)) (f:fun(real,real) y:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) z:real)))))))))))))))))))))
      #|SUBSEQUENCE_DIAGONALIZATION_LEMMA =  |- (#forall:fun(fun(fun(num,fun(fun(num,'A),bool)),bool),bool) (\P:fun(num,fun(fun(num,'A),bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(num,'A),bool),bool) (\r:fun(num,'A). (#?:fun(fun(fun(num,num),bool),bool) (\k:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (k:fun(num,num) m:num)) (k:fun(num,num) n:num)))))))) ((P:fun(num,fun(fun(num,'A),bool)) i:num) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) r:fun(num,'A)) k:fun(num,num))))))))))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(num,'A),bool),bool) (\r:fun(num,'A). (#forall:fun(fun(fun(num,num),bool),bool) (\k1:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\k2:fun(num,num). (#forall:fun(fun(num,bool),bool) (\N:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((P:fun(num,fun(fun(num,'A),bool)) i:num) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) r:fun(num,'A)) k1:fun(num,num)))) (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) j:num)) (#?:fun(fun(num,bool),bool) (\j':num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) j:num) j':num)) ((#=:fun(num,fun(num,bool)) (k2:fun(num,num) j:num)) (k1:fun(num,num) j':num)))))))))) ((P:fun(num,fun(fun(num,'A),bool)) i:num) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) r:fun(num,'A)) k2:fun(num,num)))))))))))))))) (#forall:fun(fun(fun(num,'A),bool),bool) (\r:fun(num,'A). (#?:fun(fun(fun(num,num),bool),bool) (\k:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (k:fun(num,num) m:num)) (k:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\i:num. ((P:fun(num,fun(fun(num,'A),bool)) i:num) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) r:fun(num,'A)) k:fun(num,num)))))))))))))
      #|COUNTABLE_INTEGER =  |- (#COUNTABLE:fun(fun(real,bool),bool) #integer:fun(real,bool))
      #|CARD_EQ_INTEGER =  |- ((#=_c:fun(fun(real,bool),fun(fun(num,bool),bool)) #integer:fun(real,bool)) #UNIV:fun(num,bool))
      #|COUNTABLE_RATIONAL =  |- (#COUNTABLE:fun(fun(real,bool),bool) #rational:fun(real,bool))
      #|CARD_EQ_RATIONAL =  |- ((#=_c:fun(fun(real,bool),fun(fun(num,bool),bool)) #rational:fun(real,bool)) #UNIV:fun(num,bool))
      #|COUNTABLE_INTEGER_COORDINATES =  |- (#COUNTABLE:fun(fun(cart(real,'N),bool),bool) (#GSPEC:fun(fun(cart(real,'N),bool),fun(cart(real,'N),bool)) (\GEN%PVAR%13:cart(real,'N). (#?:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (((#SETSPEC:fun(cart(real,'N),fun(bool,fun(cart(real,'N),bool))) GEN%PVAR%13:cart(real,'N)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) (#integer:fun(real,bool) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))))) x:cart(real,'N)))))))
      #|COUNTABLE_RATIONAL_COORDINATES =  |- (#COUNTABLE:fun(fun(cart(real,'N),bool),bool) (#GSPEC:fun(fun(cart(real,'N),bool),fun(cart(real,'N),bool)) (\GEN%PVAR%14:cart(real,'N). (#?:fun(fun(cart(real,'N),bool),bool) (\x:cart(real,'N). (((#SETSPEC:fun(cart(real,'N),fun(bool,fun(cart(real,'N),bool))) GEN%PVAR%14:cart(real,'N)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) (#rational:fun(real,bool) ((#$:fun(cart(real,'N),fun(num,real)) x:cart(real,'N)) i:num)))))) x:cart(real,'N)))))))
      #|IRRATIONAL_APPROXIMATION =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) e:real)))))))))
      #|IRRATIONAL_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\q:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) q:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) q:real)) ((#real_lt:fun(real,fun(real,bool)) q:real) b:real))))))))))
      #|IRRATIONAL_BETWEEN_EQ =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\q:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) q:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) q:real)) ((#real_lt:fun(real,fun(real,bool)) q:real) b:real)))))) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real))))))
      #|IRRATIONAL_APPROXIMATION_STRADDLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) a:real))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) b:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))) e:real))))))))))))))
      #|IRRATIONAL_APPROXIMATION_ABOVE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\q:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) q:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) q:real)) ((#real_lt:fun(real,fun(real,bool)) q:real) ((#real_add:fun(real,fun(real,real)) x:real) e:real)))))))))))
      #|IRRATIONAL_APPROXIMATION_BELOW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\q:real. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) q:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) e:real)) q:real)) ((#real_lt:fun(real,fun(real,bool)) q:real) x:real))))))))))
      #|INFINITE_IRRATIONAL_IN_RANGE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#INFINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%15:real. (#?:fun(fun(real,bool),bool) (\q:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%15:real) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#rational:fun(real,bool) q:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) q:real)) ((#real_lt:fun(real,fun(real,bool)) q:real) b:real)))) q:real)))))))))))
      #|COUNTABLE_LOCAL_MAXIMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#COUNTABLE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%16:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%16:real) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x':real) x:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x':real)) (f:fun(real,real) x:real))))))))) (f:fun(real,real) x:real)))))))))
      #|COUNTABLE_LOCAL_MINIMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#COUNTABLE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%17:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%17:real) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x':real) x:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) x':real))))))))) (f:fun(real,real) x:real)))))))))
      #|COUNTABLE_STRICT_LOCAL_MAXIMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#COUNTABLE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%18:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%18:real) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x':real) x:real))) d:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x':real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x':real)) (f:fun(real,real) x:real))))))))) x:real))))))))
      #|COUNTABLE_STRICT_LOCAL_MINIMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#COUNTABLE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%19:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%19:real) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x':real) x:real))) d:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x':real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) x':real))))))))) x:real))))))))
      #|relative_to =  |- ((#=:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('?40,bool),bool),fun(fun('?40,bool),fun(fun('?40,bool),bool))) P:fun(fun('?40,bool),bool)) s:fun('?40,bool)) t:fun('?40,bool))) (#?:fun(fun(fun('?40,bool),bool),bool) (\u:fun('?40,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?40,bool),bool) u:fun('?40,bool))) ((#=:fun(fun('?40,bool),fun(fun('?40,bool),bool)) ((#INTER:fun(fun('?40,bool),fun(fun('?40,bool),fun('?40,bool))) s:fun('?40,bool)) u:fun('?40,bool))) t:fun('?40,bool))))))
      #|RELATIVE_TO_UNIV =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|RELATIVE_TO_IMP_SUBSET =  |- (#forall:fun(fun(fun(fun('?41,bool),bool),bool),bool) (\P:fun(fun('?41,bool),bool). (#forall:fun(fun(fun('?41,bool),bool),bool) (\s:fun('?41,bool). (#forall:fun(fun(fun('?41,bool),bool),bool) (\t:fun('?41,bool). ((#==>:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('?41,bool),bool),fun(fun('?41,bool),fun(fun('?41,bool),bool))) P:fun(fun('?41,bool),bool)) s:fun('?41,bool)) t:fun('?41,bool))) ((#SUBSET:fun(fun('?41,bool),fun(fun('?41,bool),bool)) t:fun('?41,bool)) s:fun('?41,bool)))))))))
      #|FORALL_RELATIVE_TO =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?42,bool),bool),bool) (\s:fun('?42,bool). ((#==>:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('?42,bool),bool),fun(fun('?42,bool),fun(fun('?42,bool),bool))) P:fun(fun('?42,bool),bool)) u:fun('?42,bool)) s:fun('?42,bool))) (Q:fun(fun('?42,bool),bool) s:fun('?42,bool)))))) (#forall:fun(fun(fun('?42,bool),bool),bool) (\s:fun('?42,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?42,bool),bool) s:fun('?42,bool))) (Q:fun(fun('?42,bool),bool) ((#INTER:fun(fun('?42,bool),fun(fun('?42,bool),fun('?42,bool))) u:fun('?42,bool)) s:fun('?42,bool)))))))
      #|RELATIVE_TO_INC =  |- (#forall:fun(fun(fun(fun('?43,bool),bool),bool),bool) (\P:fun(fun('?43,bool),bool). (#forall:fun(fun(fun('?43,bool),bool),bool) (\u:fun('?43,bool). (#forall:fun(fun(fun('?43,bool),bool),bool) (\s:fun('?43,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?43,bool),bool) s:fun('?43,bool))) (((#relative_to:fun(fun(fun('?43,bool),bool),fun(fun('?43,bool),fun(fun('?43,bool),bool))) P:fun(fun('?43,bool),bool)) u:fun('?43,bool)) ((#INTER:fun(fun('?43,bool),fun(fun('?43,bool),fun('?43,bool))) u:fun('?43,bool)) s:fun('?43,bool))))))))))
      #|RELATIVE_TO =  |- ((#=:fun(fun(fun('?44,bool),bool),fun(fun(fun('?44,bool),bool),bool)) ((#relative_to:fun(fun(fun('?44,bool),bool),fun(fun('?44,bool),fun(fun('?44,bool),bool))) P:fun(fun('?44,bool),bool)) u:fun('?44,bool))) (#GSPEC:fun(fun(fun('?44,bool),bool),fun(fun('?44,bool),bool)) (\GEN%PVAR%20:fun('?44,bool). (#?:fun(fun(fun('?44,bool),bool),bool) (\s:fun('?44,bool). (((#SETSPEC:fun(fun('?44,bool),fun(bool,fun(fun('?44,bool),bool))) GEN%PVAR%20:fun('?44,bool)) (P:fun(fun('?44,bool),bool) s:fun('?44,bool))) ((#INTER:fun(fun('?44,bool),fun(fun('?44,bool),fun('?44,bool))) u:fun('?44,bool)) s:fun('?44,bool))))))))
      #|RELATIVE_TO_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool))) t:fun('A,bool))) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|RELATIVE_TO_COMPL =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) s:fun('A,bool)))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (\c:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) c:fun('A,bool))))) u:fun('A,bool)) s:fun('A,bool))))))))))
      #|RELATIVE_TO_SUBSET =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))))))))
      #|RELATIVE_TO_SUBSET_TRANS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))))))))))
      #|RELATIVE_TO_MONO =  |- (#forall:fun(fun(fun(fun('?45,bool),bool),bool),bool) (\P:fun(fun('?45,bool),bool). (#forall:fun(fun(fun(fun('?45,bool),bool),bool),bool) (\Q:fun(fun('?45,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?45,bool),bool),bool) (\s:fun('?45,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('?45,bool),bool) s:fun('?45,bool))) (Q:fun(fun('?45,bool),bool) s:fun('?45,bool)))))) (#forall:fun(fun(fun('?45,bool),bool),bool) (\u:fun('?45,bool). ((#==>:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('?45,bool),bool),fun(fun('?45,bool),fun(fun('?45,bool),bool))) P:fun(fun('?45,bool),bool)) u:fun('?45,bool)) s:fun('?45,bool))) (((#relative_to:fun(fun(fun('?45,bool),bool),fun(fun('?45,bool),fun(fun('?45,bool),bool))) Q:fun(fun('?45,bool),bool)) u:fun('?45,bool)) s:fun('?45,bool))))))))))
      #|RELATIVE_TO_SUBSET_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool)))))))))
      #|RELATIVE_TO_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) c:fun('A,bool))) (P:fun(fun('A,bool),bool) d:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) c:fun('A,bool)) d:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) c:fun('A,bool))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) d:fun('A,bool)))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) c:fun('A,bool)) d:fun('A,bool)))))))))))))
      #|RELATIVE_TO_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) c:fun('A,bool))) (P:fun(fun('A,bool),bool) d:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) c:fun('A,bool)) d:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) c:fun('A,bool))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) d:fun('A,bool)))) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) c:fun('A,bool)) d:fun('A,bool)))))))))))))
      #|ARBITRARY_UNION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool))))))))
      #|FINITE_UNION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool))))))))
      #|COUNTABLE_UNION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool))))))))
      #|ARBITRARY_INTERSECTION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)))) u:fun('A,bool)))))))
      #|FINITE_INTERSECTION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)))) u:fun('A,bool)))))))
      #|COUNTABLE_INTERSECTION_OF_RELATIVE_TO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool))) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) P:fun(fun('A,bool),bool)) u:fun('A,bool)))) u:fun('A,bool)))))))
      #|FINITE_INTERSECTION_OF_RELATIVE_TO_ALT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) u:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))))
      #|COUNTABLE_INTERSECTION_OF_RELATIVE_TO_ALT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) u:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool))) u:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))))
      #|ARBITRARY_UNION_OF_NONEMPTY_FINITE_INTERSECTION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (\s:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) s:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))))) u:fun(fun('A,bool),bool)))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#relative_to:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool)))))))
      #|GENERAL_REDUCTION_THEOREM =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\s:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (s:fun(num,fun('A,bool)) n:num))))) (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\t:fun(num,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (t:fun(num,fun('A,bool)) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (t:fun(num,fun('A,bool)) n:num)) (s:fun(num,fun('A,bool)) n:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(num,fun(num,bool)),fun(fun(num,bool),bool)) (\m:num. (\n:num. ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) (t:fun(num,fun('A,bool)) m:num)) (t:fun(num,fun('A,bool)) n:num))))) #UNIV:fun(num,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%21:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%21:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (t:fun(num,fun('A,bool)) n:num)))))))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%22:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%22:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (s:fun(num,fun('A,bool)) n:num)))))))))))))))))))
      #|GENERAL_REDUCTION_THEOREM_2 =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t':fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t':fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) t':fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s':fun('A,bool)) t':fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))))))))))))
      #|BACK_AND_FORTH_ALT =  |- (#forall:fun(fun(fun(prod('A,'B),fun(prod('A,'B),bool)),bool),bool) (\P:fun(prod('A,'B),fun(prod('A,'B),bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun(fun(prod('A,'B),bool),bool),bool) (\R:fun(prod('A,'B),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod('A,'B),bool),bool) R:fun(prod('A,'B),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) R:fun(prod('A,'B),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#pairwise:fun(fun(prod('A,'B),fun(prod('A,'B),bool)),fun(fun(prod('A,'B),bool),bool)) P:fun(prod('A,'B),fun(prod('A,'B),bool))) R:fun(prod('A,'B),bool))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#pairwise:fun(fun(prod('A,'B),fun(prod('A,'B),bool)),fun(fun(prod('A,'B),bool),bool)) P:fun(prod('A,'B),fun(prod('A,'B),bool))) ((#INSERT:fun(prod('A,'B),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) R:fun(prod('A,'B),bool)))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#pairwise:fun(fun(prod('A,'B),fun(prod('A,'B),bool)),fun(fun(prod('A,'B),bool),bool)) P:fun(prod('A,'B),fun(prod('A,'B),bool))) ((#INSERT:fun(prod('A,'B),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) R:fun(prod('A,'B),bool)))))))))))))))) (#?:fun(fun(fun(prod('A,'B),bool),bool),bool) (\R:fun(prod('A,'B),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) R:fun(prod('A,'B),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(prod('A,'B),fun(prod('A,'B),bool)),fun(fun(prod('A,'B),bool),bool)) P:fun(prod('A,'B),fun(prod('A,'B),bool))) R:fun(prod('A,'B),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) R:fun(prod('A,'B),bool))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) R:fun(prod('A,'B),bool))))))))))))))))))))
      #|BACK_AND_FORTH =  |- (#forall:fun(fun(fun('A,fun('A,fun('B,fun('B,bool)))),bool),bool) (\R:fun('A,fun('A,fun('B,fun('B,bool)))). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) x:'A) y:'B) y:'B))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('A,bool),bool) (\x':'A. (#forall:fun(fun('B,bool),bool) (\y':'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x':'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y':'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) x':'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) y:'B) y':'B))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) x':'A) y:'B) y':'B)))))))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x':'A) x:'A) y':'B) y:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s':fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s':fun('A,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) y:'A) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool)))) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool)))) (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) z:'A) s':fun('A,bool))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) z:'A) y:'B) (f:fun('A,'B) z:'A)))))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) z:'A) s':fun('A,bool))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) z:'A) y:'B) (f:fun('A,'B) z:'A)))))))))))))))))))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) y:'A) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))))))))))))))
      #|BACK_AND_FORTH_2 =  |- (#forall:fun(fun(fun('A,fun('A,fun('B,fun('B,bool)))),bool),bool) (\R:fun('A,fun('A,fun('B,fun('B,bool)))). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) x:'A) y:'B) y:'B))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('A,bool),bool) (\x':'A. (#forall:fun(fun('B,bool),bool) (\y':'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x':'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y':'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) x':'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) y:'B) y':'B))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) x':'A) y:'B) y':'B)))))))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x':'A) x:'A) y':'B) y:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s':fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s':fun('A,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) y:'A) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool))))))))))) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool)))) (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) z:'A) s':fun('A,bool))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) z:'A) y:'B) (f:fun('A,'B) z:'A)))))))))))))))))) (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) f:fun('B,'A)) t':fun('B,bool))) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t':fun('B,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t':fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('B,'A) x:'B)) (f:fun('B,'A) y:'B))) ((#=:fun('B,fun('B,bool)) x:'B) y:'B)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t':fun('B,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t':fun('B,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) (f:fun('B,'A) x:'B)) (f:fun('B,'A) y:'B)) x:'B) y:'B))))))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool))))))))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool)))) (#forall:fun(fun('B,bool),bool) (\z:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) z:'B) t':fun('B,bool))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) y:'A) (f:fun('B,'A) z:'B)) x:'B) z:'B)))))))))))))))))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((((R:fun('A,fun('A,fun('B,fun('B,bool)))) x:'A) y:'A) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))))))))))))))
      #|RECURSION_ON_DYADIC_FRACTIONS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a:'A) b:'A)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (#?:fun(fun('A,bool),bool) (\z:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) z:'A)) ((R:fun('A,fun('A,bool)) z:'A) y:'A)))))))))))) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) a:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) b:'A)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%23:real. (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%23:real) ((#<=:fun(num,fun(num,bool)) k:num) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) k:num)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%24:real. (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%24:real) ((#<=:fun(num,fun(num,bool)) k:num) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) k:num)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))))))))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))) ((R:fun('A,fun('A,bool)) (f:fun(real,'A) x:real)) (f:fun(real,'A) y:real))))))))))))))))))
      #|suslin_operation =  |- (#forall:fun(fun(fun(list(num),fun('A,bool)),bool),bool) (\f:fun(list(num),fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#suslin_operation:fun(fun(list(num),fun('A,bool)),fun('A,bool)) f:fun(list(num),fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%25:fun('A,bool). (#?:fun(fun(fun(num,num),bool),bool) (\s:fun(num,num). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%25:fun('A,bool)) ((#IN:fun(fun(num,num),fun(fun(fun(num,num),bool),bool)) s:fun(num,num)) #UNIV:fun(fun(num,num),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%26:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%26:fun('A,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (f:fun(list(num),fun('A,bool)) ((#list_of_seq:fun(fun(num,num),fun(num,list(num))) s:fun(num,num)) n:num)))))))))))))))))
      #|suslin =  |- (#forall:fun(fun(fun(fun('?46,bool),bool),bool),bool) (\u:fun(fun('?46,bool),bool). ((#=:fun(fun(fun('?46,bool),bool),fun(fun(fun('?46,bool),bool),bool)) (#suslin:fun(fun(fun('?46,bool),bool),fun(fun('?46,bool),bool)) u:fun(fun('?46,bool),bool))) (#GSPEC:fun(fun(fun('?46,bool),bool),fun(fun('?46,bool),bool)) (\GEN%PVAR%27:fun('?46,bool). (#?:fun(fun(fun(list(num),fun('?46,bool)),bool),bool) (\f:fun(list(num),fun('?46,bool)). (((#SETSPEC:fun(fun('?46,bool),fun(bool,fun(fun('?46,bool),bool))) GEN%PVAR%27:fun('?46,bool)) (#forall:fun(fun(list(num),bool),bool) (\l:list(num). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(num),fun(list(num),bool)) l:list(num)) #NIL:list(num)))) ((#IN:fun(fun('?46,bool),fun(fun(fun('?46,bool),bool),bool)) (f:fun(list(num),fun('?46,bool)) l:list(num))) u:fun(fun('?46,bool),bool)))))) (#suslin_operation:fun(fun(list(num),fun('?46,bool)),fun('?46,bool)) f:fun(list(num),fun('?46,bool)))))))))))
      #|SUSLIN_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (C:fun(fun('A,bool),bool) s:fun('A,bool))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|SUSLIN_SUPERSET =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) u:fun(fun('A,bool),bool)))))
      #|SUSLIN_SUBSET =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\D:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) C:fun(fun('A,bool),bool)) D:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool))) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) D:fun(fun('A,bool),bool))))))))
      #|SUSLIN_MONO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\D:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (C:fun(fun('A,bool),bool) t:fun('A,bool))) (D:fun(fun('A,bool),bool) t:fun('A,bool)))))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool)))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) D:fun(fun('A,bool),bool)) s:fun('A,bool)))))))))
      #|SUSLIN_REGULAR =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\c:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) c:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) c:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) c:fun(fun('A,bool),bool)) u:fun(fun('A,bool),bool))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) c:fun(fun('A,bool),bool))) u:fun(fun('A,bool),bool)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) u:fun(fun('A,bool),bool))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%28:fun('A,bool). (#?:fun(fun(fun(list(num),fun('A,bool)),bool),bool) (\f:fun(list(num),fun('A,bool)). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%28:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(list(num),bool),bool) (\l:list(num). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(num),fun(list(num),bool)) l:list(num)) #NIL:list(num)))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (f:fun(list(num),fun('A,bool)) l:list(num))) u:fun(fun('A,bool),bool)))))) (#forall:fun(fun(fun(num,num),bool),bool) (\s:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(list(num),fun('A,bool)) ((#list_of_seq:fun(fun(num,num),fun(num,list(num))) s:fun(num,num)) n:num))) (f:fun(list(num),fun('A,bool)) ((#list_of_seq:fun(fun(num,num),fun(num,list(num))) s:fun(num,num)) m:num)))))))))))) (#suslin_operation:fun(fun(list(num),fun('A,bool)),fun('A,bool)) f:fun(list(num),fun('A,bool))))))))))))
      #|SUSLIN_SUSLIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) u:fun(fun('A,bool),bool)))) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) u:fun(fun('A,bool),bool)))))
      #|SUSLIN_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool)))))))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))))))
      #|SUSLIN_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) t:fun('A,bool)))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|SUSLIN_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool)))))))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))))))
      #|SUSLIN_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) s:fun('A,bool))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) t:fun('A,bool)))) ((#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|CARD_SUSLIN_LE =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(real,bool),bool)) C:fun(fun('A,bool),bool)) #UNIV:fun(real,bool))) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(real,bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool))) #UNIV:fun(real,bool)))))
      #|CARD_SUSLIN_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(real,bool),bool)) C:fun(fun('A,bool),bool)) #UNIV:fun(real,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(real,bool),bool)) (#suslin:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) C:fun(fun('A,bool),bool))) #UNIV:fun(real,bool)))))
      #|types = tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 292
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?47
      #|counter_genvar = _314325:bool
      #|
    ),
  )
}
