// Load-fidelity test for iterate.ml: replays tools/ocaml_ref/iterate_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "iterate matches iterate.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("iterate")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("numseg", () => sthm(@iterate.numseg()))
  log.attempt("FINITE_NUMSEG", () => sthm(@iterate.finite_numseg()))
  log.attempt("NUMSEG_COMBINE_R", () => sthm(@iterate.numseg_combine_r()))
  log.attempt("NUMSEG_COMBINE_L", () => sthm(@iterate.numseg_combine_l()))
  log.attempt("NUMSEG_LREC", () => sthm(@iterate.numseg_lrec()))
  log.attempt("NUMSEG_RREC", () => sthm(@iterate.numseg_rrec()))
  log.attempt("NUMSEG_REC", () => sthm(@iterate.numseg_rec()))
  log.attempt("IN_NUMSEG", () => sthm(@iterate.in_numseg()))
  log.attempt("IN_NUMSEG_0", () => sthm(@iterate.in_numseg_0()))
  log.attempt("NUMSEG_SING", () => sthm(@iterate.numseg_sing()))
  log.attempt("NUMSEG_EMPTY", () => sthm(@iterate.numseg_empty()))
  log.attempt("EMPTY_NUMSEG", () => sthm(@iterate.empty_numseg()))
  log.attempt("FINITE_SUBSET_NUMSEG", () => {
    sthm(@iterate.finite_subset_numseg())
  })
  log.attempt("CARD_NUMSEG_LEMMA", () => sthm(@iterate.card_numseg_lemma()))
  log.attempt("CARD_NUMSEG", () => sthm(@iterate.card_numseg()))
  log.attempt("HAS_SIZE_NUMSEG", () => sthm(@iterate.has_size_numseg()))
  log.attempt("CARD_NUMSEG_1", () => sthm(@iterate.card_numseg_1()))
  log.attempt("HAS_SIZE_NUMSEG_1", () => sthm(@iterate.has_size_numseg_1()))
  log.attempt("NUMSEG_CLAUSES", () => sthm(@iterate.numseg_clauses()))
  log.attempt("FINITE_INDEX_NUMSEG", () => sthm(@iterate.finite_index_numseg()))
  log.attempt("FINITE_INDEX_NUMBERS", () => {
    sthm(@iterate.finite_index_numbers())
  })
  log.attempt("INTER_NUMSEG", () => sthm(@iterate.inter_numseg()))
  log.attempt("DISJOINT_NUMSEG", () => sthm(@iterate.disjoint_numseg()))
  log.attempt("NUMSEG_ADD_SPLIT", () => sthm(@iterate.numseg_add_split()))
  log.attempt("NUMSEG_OFFSET_IMAGE", () => sthm(@iterate.numseg_offset_image()))
  log.attempt("SUBSET_NUMSEG", () => sthm(@iterate.subset_numseg()))
  log.attempt("NUMSEG_LE", () => sthm(@iterate.numseg_le()))
  log.attempt("NUMSEG_LT", () => sthm(@iterate.numseg_lt()))
  log.attempt("TOPOLOGICAL_SORT", () => sthm(@iterate.topological_sort()))
  log.attempt("FINITE_INT_SEG", () => sthm(@iterate.finite_int_seg()))
  log.attempt("neutral", () => sthm(@iterate.neutral()))
  log.attempt("monoidal", () => sthm(@iterate.monoidal()))
  log.attempt("MONOIDAL_AC", () => sthm(@iterate.monoidal_ac()))
  log.attempt("support", () => sthm(@iterate.support()))
  log.attempt("iterate", () => sthm(@iterate.iterate()))
  log.attempt("IN_SUPPORT", () => sthm(@iterate.in_support()))
  log.attempt("SUPPORT_SUPPORT", () => sthm(@iterate.support_support()))
  log.attempt("SUPPORT_EMPTY", () => sthm(@iterate.support_empty()))
  log.attempt("SUPPORT_SUBSET", () => sthm(@iterate.support_subset()))
  log.attempt("FINITE_SUPPORT", () => sthm(@iterate.finite_support()))
  log.attempt("SUPPORT_CLAUSES", () => sthm(@iterate.support_clauses()))
  log.attempt("SUPPORT_DELTA", () => sthm(@iterate.support_delta()))
  log.attempt("FINITE_SUPPORT_DELTA", () => {
    sthm(@iterate.finite_support_delta())
  })
  log.attempt("ITERATE_SUPPORT", () => sthm(@iterate.iterate_support()))
  log.attempt("ITERATE_EXPAND_CASES", () => {
    sthm(@iterate.iterate_expand_cases())
  })
  log.attempt("ITERATE_CLAUSES_GEN", () => sthm(@iterate.iterate_clauses_gen()))
  log.attempt("ITERATE_CLAUSES", () => sthm(@iterate.iterate_clauses()))
  log.attempt("ITERATE_UNION", () => sthm(@iterate.iterate_union()))
  log.attempt("ITERATE_UNION_GEN", () => sthm(@iterate.iterate_union_gen()))
  log.attempt("ITERATE_DIFF", () => sthm(@iterate.iterate_diff()))
  log.attempt("ITERATE_DIFF_GEN", () => sthm(@iterate.iterate_diff_gen()))
  log.attempt("ITERATE_INCL_EXCL", () => sthm(@iterate.iterate_incl_excl()))
  log.attempt("ITERATE_CLOSED", () => sthm(@iterate.iterate_closed()))
  log.attempt("ITERATE_RELATED", () => sthm(@iterate.iterate_related()))
  log.attempt("ITERATE_EQ_NEUTRAL", () => sthm(@iterate.iterate_eq_neutral()))
  log.attempt("ITERATE_SING", () => sthm(@iterate.iterate_sing()))
  log.attempt("ITERATE_CLOSED_NONEMPTY", () => {
    sthm(@iterate.iterate_closed_nonempty())
  })
  log.attempt("ITERATE_RELATED_NONEMPTY", () => {
    sthm(@iterate.iterate_related_nonempty())
  })
  log.attempt("ITERATE_DELETE", () => sthm(@iterate.iterate_delete()))
  log.attempt("ITERATE_DELTA", () => sthm(@iterate.iterate_delta()))
  log.attempt("ITERATE_IMAGE", () => sthm(@iterate.iterate_image()))
  log.attempt("ITERATE_BIJECTION", () => sthm(@iterate.iterate_bijection()))
  log.attempt("ITERATE_ITERATE_PRODUCT", () => {
    sthm(@iterate.iterate_iterate_product())
  })
  log.attempt("ITERATE_EQ", () => sthm(@iterate.iterate_eq()))
  log.attempt("ITERATE_RESTRICT_SET", () => {
    sthm(@iterate.iterate_restrict_set())
  })
  log.attempt("ITERATE_EQ_GENERAL", () => sthm(@iterate.iterate_eq_general()))
  log.attempt("ITERATE_EQ_GENERAL_INVERSES", () => {
    sthm(@iterate.iterate_eq_general_inverses())
  })
  log.attempt("ITERATE_INJECTION", () => sthm(@iterate.iterate_injection()))
  log.attempt("ITERATE_UNION_NONZERO", () => {
    sthm(@iterate.iterate_union_nonzero())
  })
  log.attempt("ITERATE_OP", () => sthm(@iterate.iterate_op()))
  log.attempt("ITERATE_SUPERSET", () => sthm(@iterate.iterate_superset()))
  log.attempt("ITERATE_UNIV", () => sthm(@iterate.iterate_univ()))
  log.attempt("ITERATE_SWAP", () => sthm(@iterate.iterate_swap()))
  log.attempt("ITERATE_IMAGE_NONZERO", () => {
    sthm(@iterate.iterate_image_nonzero())
  })
  log.attempt("ITERATE_IMAGE_GEN", () => sthm(@iterate.iterate_image_gen()))
  log.attempt("ITERATE_CASES", () => sthm(@iterate.iterate_cases()))
  log.attempt("ITERATE_OP_GEN", () => sthm(@iterate.iterate_op_gen()))
  log.attempt("ITERATE_CLAUSES_NUMSEG", () => {
    sthm(@iterate.iterate_clauses_numseg())
  })
  log.attempt("ITERATE_CLAUSES_NUMSEG_LT", () => {
    sthm(@iterate.iterate_clauses_numseg_lt())
  })
  log.attempt("ITERATE_CLAUSES_NUMSEG_LE", () => {
    sthm(@iterate.iterate_clauses_numseg_le())
  })
  log.attempt("ITERATE_PAIR", () => sthm(@iterate.iterate_pair()))
  log.attempt("ITERATE_REFLECT", () => sthm(@iterate.iterate_reflect()))
  log.attempt("iterato", () => sthm(@iterate.iterato()))
  log.attempt("ITERATO_SUPPORT", () => sthm(@iterate.iterato_support()))
  log.attempt("ITERATO_EXPAND_CASES", () => {
    sthm(@iterate.iterato_expand_cases())
  })
  log.attempt("ITERATO_CLAUSES_GEN", () => sthm(@iterate.iterato_clauses_gen()))
  log.attempt("ITERATO_CLAUSES", () => sthm(@iterate.iterato_clauses()))
  log.attempt("ITERATO_CLAUSES_EXISTS", () => {
    sthm(@iterate.iterato_clauses_exists())
  })
  log.attempt("ITERATO_EQ", () => sthm(@iterate.iterato_eq()))
  log.attempt("ITERATO_INDUCT", () => sthm(@iterate.iterato_induct()))
  log.attempt("ITERATO_CLOSED", () => sthm(@iterate.iterato_closed()))
  log.attempt("ITERATO_ITERATE", () => sthm(@iterate.iterato_iterate()))
  log.attempt("ITERATO_CLAUSES_NUMSEG_LEFT", () => {
    sthm(@iterate.iterato_clauses_numseg_left())
  })
  log.attempt("nproduct", () => sthm(@iterate.nproduct()))
  log.attempt("NEUTRAL_MUL", () => sthm(@iterate.neutral_mul()))
  log.attempt("MONOIDAL_MUL", () => sthm(@iterate.monoidal_mul()))
  log.attempt("NPRODUCT_CLAUSES", () => sthm(@iterate.nproduct_clauses()))
  log.attempt("iproduct", () => sthm(@iterate.iproduct()))
  log.attempt("NEUTRAL_INT_MUL", () => sthm(@iterate.neutral_int_mul()))
  log.attempt("MONOIDAL_INT_MUL", () => sthm(@iterate.monoidal_int_mul()))
  log.attempt("IPRODUCT_CLAUSES", () => sthm(@iterate.iproduct_clauses()))
  log.attempt("product", () => sthm(@iterate.product()))
  log.attempt("NEUTRAL_REAL_MUL", () => sthm(@iterate.neutral_real_mul()))
  log.attempt("MONOIDAL_REAL_MUL", () => sthm(@iterate.monoidal_real_mul()))
  log.attempt("PRODUCT_CLAUSES", () => sthm(@iterate.product_clauses()))
  log.attempt("isum", () => sthm(@iterate.isum()))
  log.attempt("NEUTRAL_INT_ADD", () => sthm(@iterate.neutral_int_add()))
  log.attempt("MONOIDAL_INT_ADD", () => sthm(@iterate.monoidal_int_add()))
  log.attempt("ISUM_CLAUSES", () => sthm(@iterate.isum_clauses()))
  log.attempt("nsum", () => sthm(@iterate.nsum()))
  log.attempt("NEUTRAL_ADD", () => sthm(@iterate.neutral_add()))
  log.attempt("MONOIDAL_ADD", () => sthm(@iterate.monoidal_add()))
  log.attempt("NSUM_DEGENERATE", () => sthm(@iterate.nsum_degenerate()))
  log.attempt("NSUM_CLAUSES", () => sthm(@iterate.nsum_clauses()))
  log.attempt("NSUM_UNION", () => sthm(@iterate.nsum_union()))
  log.attempt("NSUM_DIFF", () => sthm(@iterate.nsum_diff()))
  log.attempt("NSUM_INCL_EXCL", () => sthm(@iterate.nsum_incl_excl()))
  log.attempt("NSUM_SUPPORT", () => sthm(@iterate.nsum_support()))
  log.attempt("NSUM_ADD", () => sthm(@iterate.nsum_add()))
  log.attempt("NSUM_ADD_GEN", () => sthm(@iterate.nsum_add_gen()))
  log.attempt("NSUM_EQ_0", () => sthm(@iterate.nsum_eq_0()))
  log.attempt("NSUM_0", () => sthm(@iterate.nsum_0()))
  log.attempt("NSUM_LMUL", () => sthm(@iterate.nsum_lmul()))
  log.attempt("NSUM_RMUL", () => sthm(@iterate.nsum_rmul()))
  log.attempt("NSUM_LE", () => sthm(@iterate.nsum_le()))
  log.attempt("NSUM_LT", () => sthm(@iterate.nsum_lt()))
  log.attempt("NSUM_LT_ALL", () => sthm(@iterate.nsum_lt_all()))
  log.attempt("NSUM_EQ", () => sthm(@iterate.nsum_eq()))
  log.attempt("NSUM_CONST", () => sthm(@iterate.nsum_const()))
  log.attempt("NSUM_POS_BOUND", () => sthm(@iterate.nsum_pos_bound()))
  log.attempt("NSUM_EQ_0_IFF", () => sthm(@iterate.nsum_eq_0_iff()))
  log.attempt("NSUM_POS_LT", () => sthm(@iterate.nsum_pos_lt()))
  log.attempt("NSUM_POS_LT_ALL", () => sthm(@iterate.nsum_pos_lt_all()))
  log.attempt("NSUM_DELETE", () => sthm(@iterate.nsum_delete()))
  log.attempt("NSUM_SING", () => sthm(@iterate.nsum_sing()))
  log.attempt("NSUM_DELTA", () => sthm(@iterate.nsum_delta()))
  log.attempt("NSUM_SWAP", () => sthm(@iterate.nsum_swap()))
  log.attempt("NSUM_IMAGE", () => sthm(@iterate.nsum_image()))
  log.attempt("NSUM_SUPERSET", () => sthm(@iterate.nsum_superset()))
  log.attempt("NSUM_UNIV", () => sthm(@iterate.nsum_univ()))
  log.attempt("NSUM_UNION_RZERO", () => sthm(@iterate.nsum_union_rzero()))
  log.attempt("NSUM_UNION_LZERO", () => sthm(@iterate.nsum_union_lzero()))
  log.attempt("NSUM_RESTRICT", () => sthm(@iterate.nsum_restrict()))
  log.attempt("NSUM_BOUND", () => sthm(@iterate.nsum_bound()))
  log.attempt("NSUM_BOUND_GEN", () => sthm(@iterate.nsum_bound_gen()))
  log.attempt("NSUM_BOUND_LT", () => sthm(@iterate.nsum_bound_lt()))
  log.attempt("NSUM_BOUND_LT_ALL", () => sthm(@iterate.nsum_bound_lt_all()))
  log.attempt("NSUM_BOUND_LT_GEN", () => sthm(@iterate.nsum_bound_lt_gen()))
  log.attempt("NSUM_UNION_EQ", () => sthm(@iterate.nsum_union_eq()))
  log.attempt("NSUM_EQ_SUPERSET", () => sthm(@iterate.nsum_eq_superset()))
  log.attempt("NSUM_RESTRICT_SET", () => sthm(@iterate.nsum_restrict_set()))
  log.attempt("NSUM_NSUM_RESTRICT", () => sthm(@iterate.nsum_nsum_restrict()))
  log.attempt("CARD_EQ_NSUM", () => sthm(@iterate.card_eq_nsum()))
  log.attempt("NSUM_MULTICOUNT_GEN", () => sthm(@iterate.nsum_multicount_gen()))
  log.attempt("NSUM_MULTICOUNT", () => sthm(@iterate.nsum_multicount()))
  log.attempt("NSUM_IMAGE_GEN", () => sthm(@iterate.nsum_image_gen()))
  log.attempt("NSUM_GROUP", () => sthm(@iterate.nsum_group()))
  log.attempt("NSUM_GROUP_RELATION", () => sthm(@iterate.nsum_group_relation()))
  log.attempt("NSUM_SUBSET", () => sthm(@iterate.nsum_subset()))
  log.attempt("NSUM_SUBSET_SIMPLE", () => sthm(@iterate.nsum_subset_simple()))
  log.attempt("NSUM_LE_GEN", () => sthm(@iterate.nsum_le_gen()))
  log.attempt("NSUM_MUL_BOUND", () => sthm(@iterate.nsum_mul_bound()))
  log.attempt("NSUM_IMAGE_NONZERO", () => sthm(@iterate.nsum_image_nonzero()))
  log.attempt("NSUM_BIJECTION", () => sthm(@iterate.nsum_bijection()))
  log.attempt("NSUM_NSUM_PRODUCT", () => sthm(@iterate.nsum_nsum_product()))
  log.attempt("NSUM_EQ_GENERAL", () => sthm(@iterate.nsum_eq_general()))
  log.attempt("NSUM_EQ_GENERAL_INVERSES", () => {
    sthm(@iterate.nsum_eq_general_inverses())
  })
  log.attempt("NSUM_INJECTION", () => sthm(@iterate.nsum_injection()))
  log.attempt("NSUM_UNION_NONZERO", () => sthm(@iterate.nsum_union_nonzero()))
  log.attempt("NSUM_UNIONS_NONZERO", () => sthm(@iterate.nsum_unions_nonzero()))
  log.attempt("NSUM_CASES", () => sthm(@iterate.nsum_cases()))
  log.attempt("NSUM_CLOSED", () => sthm(@iterate.nsum_closed()))
  log.attempt("NSUM_RELATED", () => sthm(@iterate.nsum_related()))
  log.attempt("NSUM_CLOSED_NONEMPTY", () => {
    sthm(@iterate.nsum_closed_nonempty())
  })
  log.attempt("NSUM_RELATED_NONEMPTY", () => {
    sthm(@iterate.nsum_related_nonempty())
  })
  log.attempt("NSUM_ADD_NUMSEG", () => sthm(@iterate.nsum_add_numseg()))
  log.attempt("NSUM_LE_NUMSEG", () => sthm(@iterate.nsum_le_numseg()))
  log.attempt("NSUM_EQ_NUMSEG", () => sthm(@iterate.nsum_eq_numseg()))
  log.attempt("NSUM_CONST_NUMSEG", () => sthm(@iterate.nsum_const_numseg()))
  log.attempt("NSUM_EQ_0_NUMSEG", () => sthm(@iterate.nsum_eq_0_numseg()))
  log.attempt("NSUM_EQ_0_IFF_NUMSEG", () => {
    sthm(@iterate.nsum_eq_0_iff_numseg())
  })
  log.attempt("NSUM_TRIV_NUMSEG", () => sthm(@iterate.nsum_triv_numseg()))
  log.attempt("NSUM_SING_NUMSEG", () => sthm(@iterate.nsum_sing_numseg()))
  log.attempt("NSUM_CLAUSES_NUMSEG", () => sthm(@iterate.nsum_clauses_numseg()))
  log.attempt("NSUM_CLAUSES_NUMSEG_LT", () => {
    sthm(@iterate.nsum_clauses_numseg_lt())
  })
  log.attempt("NSUM_CLAUSES_NUMSEG_LE", () => {
    sthm(@iterate.nsum_clauses_numseg_le())
  })
  log.attempt("NSUM_SWAP_NUMSEG", () => sthm(@iterate.nsum_swap_numseg()))
  log.attempt("NSUM_ADD_SPLIT", () => sthm(@iterate.nsum_add_split()))
  log.attempt("NSUM_OFFSET", () => sthm(@iterate.nsum_offset()))
  log.attempt("NSUM_OFFSET_0", () => sthm(@iterate.nsum_offset_0()))
  log.attempt("NSUM_CLAUSES_LEFT", () => sthm(@iterate.nsum_clauses_left()))
  log.attempt("NSUM_CLAUSES_RIGHT", () => sthm(@iterate.nsum_clauses_right()))
  log.attempt("NSUM_PAIR", () => sthm(@iterate.nsum_pair()))
  log.attempt("NSUM_REFLECT", () => sthm(@iterate.nsum_reflect()))
  log.attempt("MOD_NSUM_MOD", () => sthm(@iterate.mod_nsum_mod()))
  log.attempt("MOD_NSUM_MOD_NUMSEG", () => sthm(@iterate.mod_nsum_mod_numseg()))
  log.attempt("CONG_NSUM", () => sthm(@iterate.cong_nsum()))
  log.attempt("CARD_UNIONS_IMAGE", () => sthm(@iterate.card_unions_image()))
  log.attempt("CARD_UNIONS", () => sthm(@iterate.card_unions()))
  log.attempt("sum", () => sthm(@iterate.sum()))
  log.attempt("NEUTRAL_REAL_ADD", () => sthm(@iterate.neutral_real_add()))
  log.attempt("MONOIDAL_REAL_ADD", () => sthm(@iterate.monoidal_real_add()))
  log.attempt("SUM_DEGENERATE", () => sthm(@iterate.sum_degenerate()))
  log.attempt("SUM_CLAUSES", () => sthm(@iterate.sum_clauses()))
  log.attempt("SUM_UNION", () => sthm(@iterate.sum_union()))
  log.attempt("SUM_DIFF", () => sthm(@iterate.sum_diff()))
  log.attempt("SUM_INCL_EXCL", () => sthm(@iterate.sum_incl_excl()))
  log.attempt("SUM_SUPPORT", () => sthm(@iterate.sum_support()))
  log.attempt("SUM_ADD", () => sthm(@iterate.sum_add()))
  log.attempt("SUM_ADD_GEN", () => sthm(@iterate.sum_add_gen()))
  log.attempt("SUM_EQ_0", () => sthm(@iterate.sum_eq_0()))
  log.attempt("SUM_0", () => sthm(@iterate.sum_0()))
  log.attempt("SUM_LMUL", () => sthm(@iterate.sum_lmul()))
  log.attempt("SUM_RMUL", () => sthm(@iterate.sum_rmul()))
  log.attempt("SUM_NEG", () => sthm(@iterate.sum_neg()))
  log.attempt("SUM_SUB", () => sthm(@iterate.sum_sub()))
  log.attempt("SUM_LE", () => sthm(@iterate.sum_le()))
  log.attempt("SUM_LT", () => sthm(@iterate.sum_lt()))
  log.attempt("SUM_LT_ALL", () => sthm(@iterate.sum_lt_all()))
  log.attempt("SUM_POS_LT", () => sthm(@iterate.sum_pos_lt()))
  log.attempt("SUM_POS_LT_ALL", () => sthm(@iterate.sum_pos_lt_all()))
  log.attempt("SUM_EQ", () => sthm(@iterate.sum_eq()))
  log.attempt("SUM_ABS", () => sthm(@iterate.sum_abs()))
  log.attempt("SUM_ABS_LE", () => sthm(@iterate.sum_abs_le()))
  log.attempt("SUM_CONST", () => sthm(@iterate.sum_const()))
  log.attempt("SUM_POS_LE", () => sthm(@iterate.sum_pos_le()))
  log.attempt("SUM_POS_BOUND", () => sthm(@iterate.sum_pos_bound()))
  log.attempt("SUM_POS_EQ_0", () => sthm(@iterate.sum_pos_eq_0()))
  log.attempt("SUM_ZERO_EXISTS", () => sthm(@iterate.sum_zero_exists()))
  log.attempt("SUM_DELETE", () => sthm(@iterate.sum_delete()))
  log.attempt("SUM_DELETE_CASES", () => sthm(@iterate.sum_delete_cases()))
  log.attempt("SUM_SING", () => sthm(@iterate.sum_sing()))
  log.attempt("SUM_DELTA", () => sthm(@iterate.sum_delta()))
  log.attempt("SUM_SWAP", () => sthm(@iterate.sum_swap()))
  log.attempt("SUM_IMAGE", () => sthm(@iterate.sum_image()))
  log.attempt("SUM_SUPERSET", () => sthm(@iterate.sum_superset()))
  log.attempt("SUM_UNIV", () => sthm(@iterate.sum_univ()))
  log.attempt("SUM_UNION_RZERO", () => sthm(@iterate.sum_union_rzero()))
  log.attempt("SUM_UNION_LZERO", () => sthm(@iterate.sum_union_lzero()))
  log.attempt("SUM_RESTRICT", () => sthm(@iterate.sum_restrict()))
  log.attempt("SUM_BOUND", () => sthm(@iterate.sum_bound()))
  log.attempt("SUM_BOUND_GEN", () => sthm(@iterate.sum_bound_gen()))
  log.attempt("SUM_ABS_BOUND", () => sthm(@iterate.sum_abs_bound()))
  log.attempt("SUM_BOUND_LT", () => sthm(@iterate.sum_bound_lt()))
  log.attempt("SUM_BOUND_LT_ALL", () => sthm(@iterate.sum_bound_lt_all()))
  log.attempt("SUM_BOUND_LT_GEN", () => sthm(@iterate.sum_bound_lt_gen()))
  log.attempt("SUM_UNION_EQ", () => sthm(@iterate.sum_union_eq()))
  log.attempt("SUM_EQ_SUPERSET", () => sthm(@iterate.sum_eq_superset()))
  log.attempt("SUM_RESTRICT_SET", () => sthm(@iterate.sum_restrict_set()))
  log.attempt("SUM_SUM_RESTRICT", () => sthm(@iterate.sum_sum_restrict()))
  log.attempt("CARD_EQ_SUM", () => sthm(@iterate.card_eq_sum()))
  log.attempt("SUM_MULTICOUNT_GEN", () => sthm(@iterate.sum_multicount_gen()))
  log.attempt("SUM_MULTICOUNT", () => sthm(@iterate.sum_multicount()))
  log.attempt("SUM_IMAGE_GEN", () => sthm(@iterate.sum_image_gen()))
  log.attempt("SUM_GROUP", () => sthm(@iterate.sum_group()))
  log.attempt("SUM_GROUP_RELATION", () => sthm(@iterate.sum_group_relation()))
  log.attempt("REAL_OF_NUM_SUM", () => sthm(@iterate.real_of_num_sum()))
  log.attempt("SUM_SUBSET", () => sthm(@iterate.sum_subset()))
  log.attempt("SUM_SUBSET_SIMPLE", () => sthm(@iterate.sum_subset_simple()))
  log.attempt("SUM_MUL_BOUND", () => sthm(@iterate.sum_mul_bound()))
  log.attempt("SUM_IMAGE_NONZERO", () => sthm(@iterate.sum_image_nonzero()))
  log.attempt("SUM_BIJECTION", () => sthm(@iterate.sum_bijection()))
  log.attempt("SUM_SUM_PRODUCT", () => sthm(@iterate.sum_sum_product()))
  log.attempt("SUM_EQ_GENERAL", () => sthm(@iterate.sum_eq_general()))
  log.attempt("SUM_EQ_GENERAL_INVERSES", () => {
    sthm(@iterate.sum_eq_general_inverses())
  })
  log.attempt("SUM_INJECTION", () => sthm(@iterate.sum_injection()))
  log.attempt("SUM_UNION_NONZERO", () => sthm(@iterate.sum_union_nonzero()))
  log.attempt("SUM_UNIONS_NONZERO", () => sthm(@iterate.sum_unions_nonzero()))
  log.attempt("SUM_CASES", () => sthm(@iterate.sum_cases()))
  log.attempt("SUM_CASES_1", () => sthm(@iterate.sum_cases_1()))
  log.attempt("SUM_LE_INCLUDED", () => sthm(@iterate.sum_le_included()))
  log.attempt("SUM_IMAGE_LE", () => sthm(@iterate.sum_image_le()))
  log.attempt("SUM_CLOSED", () => sthm(@iterate.sum_closed()))
  log.attempt("SUM_RELATED", () => sthm(@iterate.sum_related()))
  log.attempt("SUM_CLOSED_NONEMPTY", () => sthm(@iterate.sum_closed_nonempty()))
  log.attempt("SUM_RELATED_NONEMPTY", () => {
    sthm(@iterate.sum_related_nonempty())
  })
  log.attempt("REAL_OF_NUM_SUM_GEN", () => sthm(@iterate.real_of_num_sum_gen()))
  log.attempt("SUM_ADD_NUMSEG", () => sthm(@iterate.sum_add_numseg()))
  log.attempt("SUM_SUB_NUMSEG", () => sthm(@iterate.sum_sub_numseg()))
  log.attempt("SUM_LE_NUMSEG", () => sthm(@iterate.sum_le_numseg()))
  log.attempt("SUM_EQ_NUMSEG", () => sthm(@iterate.sum_eq_numseg()))
  log.attempt("SUM_ABS_NUMSEG", () => sthm(@iterate.sum_abs_numseg()))
  log.attempt("SUM_CONST_NUMSEG", () => sthm(@iterate.sum_const_numseg()))
  log.attempt("SUM_EQ_0_NUMSEG", () => sthm(@iterate.sum_eq_0_numseg()))
  log.attempt("SUM_TRIV_NUMSEG", () => sthm(@iterate.sum_triv_numseg()))
  log.attempt("SUM_POS_LE_NUMSEG", () => sthm(@iterate.sum_pos_le_numseg()))
  log.attempt("SUM_POS_EQ_0_NUMSEG", () => sthm(@iterate.sum_pos_eq_0_numseg()))
  log.attempt("SUM_SING_NUMSEG", () => sthm(@iterate.sum_sing_numseg()))
  log.attempt("SUM_CLAUSES_NUMSEG", () => sthm(@iterate.sum_clauses_numseg()))
  log.attempt("SUM_CLAUSES_NUMSEG_LT", () => {
    sthm(@iterate.sum_clauses_numseg_lt())
  })
  log.attempt("SUM_CLAUSES_NUMSEG_LE", () => {
    sthm(@iterate.sum_clauses_numseg_le())
  })
  log.attempt("SUM_SWAP_NUMSEG", () => sthm(@iterate.sum_swap_numseg()))
  log.attempt("SUM_ADD_SPLIT", () => sthm(@iterate.sum_add_split()))
  log.attempt("SUM_OFFSET", () => sthm(@iterate.sum_offset()))
  log.attempt("SUM_OFFSET_0", () => sthm(@iterate.sum_offset_0()))
  log.attempt("SUM_CLAUSES_LEFT", () => sthm(@iterate.sum_clauses_left()))
  log.attempt("SUM_CLAUSES_RIGHT", () => sthm(@iterate.sum_clauses_right()))
  log.attempt("SUM_PAIR", () => sthm(@iterate.sum_pair()))
  log.attempt("SUM_REFLECT", () => sthm(@iterate.sum_reflect()))
  log.attempt("REAL_OF_NUM_SUM_NUMSEG", () => {
    sthm(@iterate.real_of_num_sum_numseg())
  })
  log.attempt("SUM_PARTIAL_SUC", () => sthm(@iterate.sum_partial_suc()))
  log.attempt("SUM_PARTIAL_PRE", () => sthm(@iterate.sum_partial_pre()))
  log.attempt("SUM_DIFFS", () => sthm(@iterate.sum_diffs()))
  log.attempt("SUM_DIFFS_ALT", () => sthm(@iterate.sum_diffs_alt()))
  log.attempt("SUM_COMBINE_R", () => sthm(@iterate.sum_combine_r()))
  log.attempt("SUM_COMBINE_L", () => sthm(@iterate.sum_combine_l()))
  log.attempt("REAL_SUB_POW", () => sthm(@iterate.real_sub_pow()))
  log.attempt("REAL_SUB_POW_R1", () => sthm(@iterate.real_sub_pow_r1()))
  log.attempt("REAL_SUB_POW_L1", () => sthm(@iterate.real_sub_pow_l1()))
  log.attempt("REAL_SUB_POLYFUN", () => sthm(@iterate.real_sub_polyfun()))
  log.attempt("REAL_SUB_POLYFUN_ALT", () => {
    sthm(@iterate.real_sub_polyfun_alt())
  })
  log.attempt("REAL_POLYFUN_ROOTBOUND", () => {
    sthm(@iterate.real_polyfun_rootbound())
  })
  log.attempt("REAL_POLYFUN_FINITE_ROOTS", () => {
    sthm(@iterate.real_polyfun_finite_roots())
  })
  log.attempt("REAL_POLYFUN_EQ_0", () => sthm(@iterate.real_polyfun_eq_0()))
  log.attempt("REAL_POLYFUN_EQ_CONST", () => {
    sthm(@iterate.real_polyfun_eq_const())
  })
  log.attempt("polynomial_function", () => sthm(@iterate.polynomial_function()))
  log.attempt("POLYNOMIAL_FUNCTION_CONST", () => {
    sthm(@iterate.polynomial_function_const())
  })
  log.attempt("POLYNOMIAL_FUNCTION_ID", () => {
    sthm(@iterate.polynomial_function_id())
  })
  log.attempt("POLYNOMIAL_FUNCTION_I", () => {
    sthm(@iterate.polynomial_function_i())
  })
  log.attempt("POLYNOMIAL_FUNCTION_ADD", () => {
    sthm(@iterate.polynomial_function_add())
  })
  log.attempt("POLYNOMIAL_FUNCTION_LMUL", () => {
    sthm(@iterate.polynomial_function_lmul())
  })
  log.attempt("POLYNOMIAL_FUNCTION_RMUL", () => {
    sthm(@iterate.polynomial_function_rmul())
  })
  log.attempt("POLYNOMIAL_FUNCTION_NEG", () => {
    sthm(@iterate.polynomial_function_neg())
  })
  log.attempt("POLYNOMIAL_FUNCTION_SUB", () => {
    sthm(@iterate.polynomial_function_sub())
  })
  log.attempt("POLYNOMIAL_FUNCTION_MUL", () => {
    sthm(@iterate.polynomial_function_mul())
  })
  log.attempt("POLYNOMIAL_FUNCTION_SUM", () => {
    sthm(@iterate.polynomial_function_sum())
  })
  log.attempt("POLYNOMIAL_FUNCTION_POW", () => {
    sthm(@iterate.polynomial_function_pow())
  })
  log.attempt("POLYNOMIAL_FUNCTION_INDUCT", () => {
    sthm(@iterate.polynomial_function_induct())
  })
  log.attempt("POLYNOMIAL_FUNCTION_o", () => {
    sthm(@iterate.polynomial_function_o())
  })
  log.attempt("POLYNOMIAL_FUNCTION_FINITE_ROOTS", () => {
    sthm(@iterate.polynomial_function_finite_roots())
  })
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
      #|iterate quotations (706):
      #|  (op_dot_dot : (Num, Num, Num) -> Bool)((m : Num), (n : Num)) == {(x : Num) | m <= x && x <= n}
      #|  {(x : Num) | x <= (n : Num)}
      #|  \226\136\128 m : Num, \226\136\128 n : Num, FINITE(op_dot_dot(m, n))
      #|  \226\136\128 m : Num, \226\136\128 p : Num, \226\136\128 n : Num, m <= p + 1 && p <= n \226\134\146 UNION(op_dot_dot(m, p), op_dot_dot(p + 1, n)) == op_dot_dot(m, n)
      #|  \226\136\128 m : Num, \226\136\128 p : Num, \226\136\128 n : Num, m <= p && p <= n + 1 \226\134\146 UNION(op_dot_dot(m, p - 1), op_dot_dot(p, n)) == op_dot_dot(m, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 INSERT(m, op_dot_dot(m + 1, n)) == op_dot_dot(m, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 INSERT(n, op_dot_dot(m, n - 1)) == op_dot_dot(m, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= SUC(n) \226\134\146 op_dot_dot(m, SUC(n)) == INSERT(SUC(n), op_dot_dot(m, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, IN(p, op_dot_dot(m, n)) == (m <= p && p <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, IN(m, op_dot_dot(0, n)) == (m <= n)
      #|  \226\136\128 n : Num, op_dot_dot(n, n) == {n}
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (op_dot_dot(m, n) == {}) == (n < m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, n < m \226\134\146 op_dot_dot(m, n) == {}
      #|  (s : (Num) -> Bool)
      #|  (s : (Num) -> Bool)
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) == (\226\136\131 n : Num, SUBSET(s, op_dot_dot(0, n)))
      #|  !(SUC((n : Num)) <= n)
      #|  (m : Num) <= SUC(m + (d : Num))
      #|  \226\136\128 m : Num, \226\136\128 d : Num, CARD(op_dot_dot(m, m + d)) == d + 1
      #|  (n : Num) < (m : Num) \226\134\146 n + 1 - m == 0
      #|  (n : Num) < (m : Num) || m <= n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, CARD(op_dot_dot(m, n)) == n + 1 - m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(op_dot_dot(m, n), n + 1 - m)
      #|  \226\136\128 n : Num, CARD(op_dot_dot(1, n)) == n
      #|  \226\136\128 n : Num, HAS_SIZE(op_dot_dot(1, n), n)
      #|  (\226\136\128 m : Num, op_dot_dot(m, 0) == (if m == 0 { {0} } else { {} })) && (\226\136\128 m : Num, \226\136\128 n : Num, op_dot_dot(m, SUC(n)) == (if m <= SUC(n) { INSERT(SUC(n), op_dot_dot(m, n)) } else { op_dot_dot(m, n) }))
      #|  (s : (A) -> Bool)
      #|  op_dot_dot(1, CARD((s : (A) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) == (\226\136\131 f : (Num) -> A, (\226\136\128 i : Num, \226\136\128 j : Num, IN(i, op_dot_dot(1, CARD(s))) && IN(j, op_dot_dot(1, CARD(s))) && f(i) == f(j) \226\134\146 i == j) && s == IMAGE(f, op_dot_dot(1, CARD(s))))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) == (\226\136\131 k : (Num) -> Bool, \226\136\131 f : (Num) -> A, (\226\136\128 i : Num, \226\136\128 j : Num, IN(i, k) && IN(j, k) && f(i) == f(j) \226\134\146 i == j) && FINITE(k) && s == IMAGE(f, k))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, INTER(op_dot_dot(m, n), op_dot_dot(p, q)) == op_dot_dot(MAX(m, p), MIN(n, q))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, DISJOINT(op_dot_dot(m, n), op_dot_dot(p, q)) == (n < p || q < m || n < m || q < p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n + 1 \226\134\146 op_dot_dot(m, n + p) == UNION(op_dot_dot(m, n), op_dot_dot(n + 1, n + p))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, op_dot_dot(m + p, n + p) == IMAGE((i : Num) => i + p, op_dot_dot(m, n))
      #|  (x : Num) - (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, SUBSET(op_dot_dot(m, n), op_dot_dot(p, q)) == (n < m || p <= m && n <= q)
      #|  \226\136\128 n : Num, {(x : Num) | x <= n} == op_dot_dot(0, n)
      #|  \226\136\128 n : Num, {(x : Num) | x < n} == (if n == 0 { {} } else { op_dot_dot(0, n - 1) })
      #|  (n : Num) < (m : Num) \226\134\146 op_dot_dot(m, n) == {}
      #|  op_dot_dot((m : Num), m) == {m}
      #|  (m : Num) <= (n : Num) \226\134\146 op_dot_dot(m, n) == INSERT(m, op_dot_dot(SUC(m), n))
      #|  op_dot_dot
      #|  (m : Num)
      #|  (n : Num)
      #|  (k : Num) == 1
      #|  (j : Num) == 1
      #|  (k : Num)
      #|  (j : Num)
      #|  1 <= (x : Num) \226\134\146 1 < x + 1 && !(x + 1 == 1)
      #|  (i : Num) + 1
      #|  (i : Num)
      #|  (b : A) == (a : A)
      #|  (b : A)
      #|  \226\136\128 i : Num, IN(i, op_dot_dot(1, SUC((n : Num)))) == (i == 1 || 1 < i && IN(i - 1, op_dot_dot(1, n)))
      #|  1 <= (k : Num) \226\134\146 !(SUC(k) == 1)
      #|  (k : Num) => if k == 1 { (a : A) } else { (f : (Num) -> A)(k - 1) }
      #|  (f : (Num) -> A)
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  (a : A)
      #|  (s : (A) -> Bool)
      #|  SUC((n : Num))
      #|  (s : (A) -> Bool)
      #|  (b : A)
      #|  (a : A)
      #|  (op_lt_lt : (A, A) -> Bool)((a : A), (b : A))
      #|  (b : A)
      #|  (a : A)
      #|  (s : (A) -> Bool) == {(a : A)}
      #|  IN((a : _), (s : (_) -> Bool)) \226\134\146 (DELETE(s, a) == {}) == (s == {a})
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  (a : A)
      #|  (a : A)
      #|  (s : (A) -> Bool)
      #|  !((a : Bool) && !a)
      #|  \226\136\128 n : Num, \226\136\128 s : (A) -> Bool, HAS_SIZE(s, n) && !(s == {}) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 b : A, IN(b, DELETE(s, a)) \226\134\146 !(op_lt_lt : (A, A) -> Bool)(b, a)))
      #|  \226\136\128 `<<` : (A, A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, `<<`(x, y) && `<<`(y, x) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, `<<`(x, y) && `<<`(y, z) \226\134\146 `<<`(x, z)) \226\134\146 (\226\136\128 n : Num, \226\136\128 s : (A) -> Bool, HAS_SIZE(s, n) \226\134\146 (\226\136\131 f : (Num) -> A, s == IMAGE(f, op_dot_dot(1, n)) && (\226\136\128 j : Num, \226\136\128 k : Num, IN(j, op_dot_dot(1, n)) && IN(k, op_dot_dot(1, n)) && j < k \226\134\146 !`<<`(f(k), f(j)))))
      #|  !((b : _) == (a : _)) \226\134\146 IN(b, (s : (_) -> Bool)) == IN(b, DELETE(s, a))
      #|  num_of_int((x : Int) - (l : Int))
      #|  (x : Int)
      #|  IMAGE((n : Num) => (l : Int) + int_of_num(n), op_dot_dot(0, num_of_int((r : Int) - l)))
      #|  !(int_of_num(0) <= (r : Int) - (l : Int)) \226\134\146 !(l <= (x : Int) && x <= r)
      #|  int_of_num(0) <= (r : Int) - (l : Int)
      #|  ((a : Bool) \226\134\146 (b : Bool)) && a \226\134\146 a && b
      #|  (\226\136\128 l : Int, \226\136\128 r : Int, FINITE({(x : Int) | l <= x && x <= r})) && (\226\136\128 l : Int, \226\136\128 r : Int, FINITE({(x : Int) | l <= x && x < r})) && (\226\136\128 l : Int, \226\136\128 r : Int, FINITE({(x : Int) | l < x && x <= r})) && (\226\136\128 l : Int, \226\136\128 r : Int, FINITE({(x : Int) | l < x && x < r}))
      #|  (neutral : ((A, A) -> A) -> A)((op : (A, A) -> A)) == select((x : A) => \226\136\128 y : A, op(x, y) == y && op(y, x) == y)
      #|  (monoidal : ((A, A) -> A) -> Bool)((op : (A, A) -> A)) == ((\226\136\128 x : A, \226\136\128 y : A, op(x, y) == op(y, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, op(x, op(y, z)) == op(op(x, y), z)) && (\226\136\128 x : A, op(neutral(op), x) == x))
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 (\226\136\128 a : A, op(neutral(op), a) == a) && (\226\136\128 a : A, op(a, neutral(op)) == a) && (\226\136\128 a : A, \226\136\128 b : A, op(a, b) == op(b, a)) && (\226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, op(op(a, b), c) == op(a, op(b, c))) && (\226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, op(a, op(b, c)) == op(b, op(a, c)))
      #|  (support : ((B, B) -> B, (A) -> B, (A) -> Bool, A) -> Bool)((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool)) == {(x : A) | IN(x, s) && !(f(x) == neutral(op))}
      #|  (iterate : ((B, B) -> B, (A) -> Bool, (A) -> B) -> B)((op : (B, B) -> B), (s : (A) -> Bool), (f : (A) -> B)) == (if FINITE(support(op, f, s)) { ITSET((x : A) => (a : B) => op(f(x), a), support(op, f, s), neutral(op)) } else { neutral(op) })
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, IN(x, support(op, f, s)) == (IN(x, s) && !(f(x) == neutral(op)))
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, support(op, f, support(op, f, s)) == support(op, f, s)
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == neutral(op)) == (support(op, f, s) == {})
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, SUBSET(support(op, f, s), s)
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE(support(op, f, s))
      #|  (\226\136\128 f : (A) -> C, support((op : (C, C) -> C), f, {}) == {}) && (\226\136\128 f : (A) -> C, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, support(op, f, INSERT(x, s)) == (if f(x) == neutral(op) { support(op, f, s) } else { INSERT(x, support(op, f, s)) })) && (\226\136\128 f : (A) -> C, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, support(op, f, DELETE(s, x)) == DELETE(support(op, f, s), x)) && (\226\136\128 f : (A) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, support(op, f, UNION(s, t)) == UNION(support(op, f, s), support(op, f, t))) && (\226\136\128 f : (A) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, support(op, f, INTER(s, t)) == INTER(support(op, f, s), support(op, f, t))) && (\226\136\128 f : (A) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, support(op, f, DIFF(s, t)) == DIFF(support(op, f, s), support(op, f, t))) && (\226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 s : (A) -> Bool, support(op, g, IMAGE(f, s)) == IMAGE(f, support(op, o(g, f), s)))
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 a : A, support(op, (x : A) => if x == a { f(x) } else { neutral(op) }, s) == (if IN(a, s) { support(op, f, {a}) } else { {} })
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 a : A, FINITE(support(op, (x : A) => if x == a { f(x) } else { neutral(op) }, (s : (A) -> Bool)))
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, iterate(op, support(op, f, s), f) == iterate(op, s, f)
      #|  \226\136\128 op : (B, B) -> B, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, iterate(op, s, f) == (if FINITE(support(op, f, s)) { iterate(op, support(op, f, s), f) } else { neutral(op) })
      #|  (f : (A) -> B)((x : A)) == neutral((op : (B, B) -> B))
      #|  neutral((op : (B, B) -> B))
      #|  (x : A) => (a : B) => (op : (B, B) -> B)((f : (A) -> B)(x), a)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, iterate(op, {}, f) == neutral(op)) && (\226\136\128 f : (A) -> B, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(support(op, f, s)) \226\134\146 iterate(op, INSERT(x, s), f) == (if IN(x, s) { iterate(op, s, f) } else { op(f(x), iterate(op, s, f)) }))
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> C, iterate(op, {}, f) == neutral(op)) && (\226\136\128 f : (B) -> C, \226\136\128 x : B, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 iterate(op, INSERT(x, s), f) == (if IN(x, s) { iterate(op, s, f) } else { op(f(x), iterate(op, s, f)) }))
      #|  UNION((s : (_) -> Bool), INSERT((x : _), (t : (_) -> Bool))) == INSERT(x, UNION(s, t)) && DISJOINT(s, INSERT(x, t)) == (!IN(x, s) && DISJOINT(s, t))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) \226\134\146 iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(support(op, f, s)) && FINITE(support(op, f, t)) && DISJOINT(support(op, f, s), support(op, f, t)) \226\134\146 iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))
      #|  SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) \226\134\146 s == UNION(DIFF(s, t), t) && DISJOINT(DIFF(s, t), t)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && SUBSET(t, s) \226\134\146 op(iterate(op, DIFF(s, t), f), iterate(op, t, f)) == iterate(op, s, f))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(support(op, f, s)) && SUBSET(support(op, f, t), support(op, f, s)) \226\134\146 op(iterate(op, DIFF(s, t), f), iterate(op, t, f)) == iterate(op, s, f))
      #|  DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), INTER(s, s'))
      #|  DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), INTER(s', s))
      #|  DISJOINT(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), DIFF(s', s))
      #|  DISJOINT(UNION(DIFF((s : (_) -> Bool), (s' : (_) -> Bool)), DIFF(s', s)), INTER(s, s'))
      #|  (t : (A) -> Bool) == UNION(DIFF(t, (s : (A) -> Bool)), INTER(s, t))
      #|  (s : (A) -> Bool) == UNION(DIFF(s, (t : (A) -> Bool)), INTER(s, t))
      #|  UNION((a : (_) -> Bool), (b : (_) -> Bool)) == UNION(UNION(DIFF(a, b), DIFF(b, a)), INTER(a, b))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 f : (A) -> B, FINITE(s) && FINITE(t) \226\134\146 op(iterate(op, s, f), iterate(op, t, f)) == op(iterate(op, UNION(s, t), f), iterate(op, INTER(s, t), f)))
      #|  (s : (A) -> Bool)
      #|  support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 P : (B) -> Bool, P(neutral(op)) && (\226\136\128 x : B, \226\136\128 y : B, P(x) && P(y) \226\134\146 P(op(x, y))) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) && !(f(x) == neutral(op)) \226\134\146 P(f(x))) \226\134\146 P(iterate(op, s, f))))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 R : (B, B) -> Bool, R(neutral(op), neutral(op)) && (\226\136\128 x1 : B, \226\136\128 y1 : B, \226\136\128 x2 : B, \226\136\128 y2 : B, R(x1, x2) && R(y1, y2) \226\134\146 R(op(x1, y1), op(x2, y2))) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(iterate(op, s, f), iterate(op, s, g))))
      #|  support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool)) == {}
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == neutral(op)) \226\134\146 iterate(op, s, f) == neutral(op))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 x : A, iterate(op, {x}, f) == f(x))
      #|  (t : (A) -> Bool) == {}
      #|  (t : (A) -> Bool)
      #|  (a : A)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 P : (B) -> Bool, (\226\136\128 x : B, \226\136\128 y : B, P(x) && P(y) \226\134\146 P(op(x, y))) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 P(f(x))) \226\134\146 P(iterate(op, s, f))))
      #|  (t : (A) -> Bool) == {}
      #|  (t : (A) -> Bool)
      #|  (a : A)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 R : (B, B) -> Bool, (\226\136\128 x1 : B, \226\136\128 y1 : B, \226\136\128 x2 : B, \226\136\128 y2 : B, R(x1, x2) && R(y1, y2) \226\134\146 R(op(x1, y1), op(x2, y2))) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(iterate(op, s, f), iterate(op, s, g))))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) && IN(a, s) \226\134\146 op(f(a), iterate(op, DELETE(s, a), f)) == iterate(op, s, f))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 a : A, \226\136\128 s : (A) -> Bool, iterate(op, s, (x : A) => if x == a { f(x) } else { neutral(op) }) == (if IN(a, s) { f(a) } else { neutral(op) }))
      #|  (a : Bool) == (a' : Bool) && (a' \226\134\146 (b : _) == (b' : _)) \226\134\146 (if a { b } else { (c : _) }) == (if a' { b' } else { c })
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && (f : (A) -> B)(x) == f(y) \226\134\146 x == y) \226\134\146 iterate((op : (C, C) -> C), IMAGE(f, s), (g : (B) -> C)) == iterate(op, s, o(g, f))
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 iterate(op, IMAGE(f, s), g) == iterate(op, s, o(g, f)))
      #|  iterate((op : (B, B) -> B), IMAGE((p : (A) -> A), (s : (A) -> Bool)), (f : (A) -> B))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 y : A, IN(y, s) \226\134\146 existsunique((x : A) => IN(x, s) && p(x) == y)) \226\134\146 iterate(op, s, f) == iterate(op, s, o(f, p)))
      #|  {((i : _), (j : _)) | IN(i, INSERT((a : _), (s : (_) -> Bool))) && IN(j, (t : (_, _) -> Bool)(i))} == UNION(IMAGE((j : _) => (a, j), t(a)), {((i : _), (j : _)) | IN(i, s) && IN(j, t(i))})
      #|  {((a : _), (b : _)) | false} == {}
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 x : (A, B) -> C, FINITE(s) && (\226\136\128 i : A, IN(i, s) \226\134\146 FINITE(t(i))) \226\134\146 iterate(op, s, (i : A) => iterate(op, t(i), x(i))) == iterate(op, {((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) }))
      #|  (t : (A) -> Bool)
      #|  support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))
      #|  FINITE(support((op : (B, B) -> B), (f : (A) -> B), (s : (A) -> Bool))) && (\226\136\128 x : A, IN(x, support(op, f, s)) \226\134\146 f(x) == (g : (A) -> B)(x))
      #|  support((op : (B, B) -> B), (g : (A) -> B), (s : (A) -> Bool)) == support(op, (f : (A) -> B), s)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 iterate(op, s, f) == iterate(op, s, g))
      #|  !((if (P : (_) -> Bool)((x : _)) { (f : (_) -> _)(x) } else { (a : _) }) == a) == (P(x) && !(f(x) == a))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, iterate(op, {(x : A) | IN(x, s) && P(x)}, f) == iterate(op, s, (x : A) => if P(x) { f(x) } else { neutral(op) }))
      #|  iterate((op : (C, C) -> C), (s : (A) -> Bool), o((g : (B) -> C), (h : (A) -> B)))
      #|  (t : (B) -> Bool) == IMAGE((h : (A) -> B), (s : (A) -> Bool))
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> C, \226\136\128 g : (B) -> C, \226\136\128 h : (A) -> B, (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && h(x) == y)) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && g(h(x)) == f(x)) \226\134\146 iterate(op, s, f) == iterate(op, t, g))
      #|  (h : (A) -> B)
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> C, \226\136\128 g : (B) -> C, \226\136\128 h : (A) -> B, \226\136\128 k : (B) -> A, (\226\136\128 y : B, IN(y, t) \226\134\146 IN(k(y), s) && h(k(y)) == y) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) \226\134\146 iterate(op, s, f) == iterate(op, t, g))
      #|  (p : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && p(x) == p(y) \226\134\146 x == y) \226\134\146 iterate(op, s, o(f, p)) == iterate(op, s, f))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && (\226\136\128 x : A, IN(x, INTER(s, t)) \226\134\146 f(x) == neutral(op)) \226\134\146 iterate(op, UNION(s, t), f) == op(iterate(op, s, f), iterate(op, t, f)))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 iterate(op, s, (x : A) => op(f(x), g(x))) == op(iterate(op, s, f), iterate(op, s, g)))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, SUBSET(u, v) && (\226\136\128 x : A, IN(x, v) && !IN(x, u) \226\134\146 f(x) == neutral(op)) \226\134\146 iterate(op, v, f) == iterate(op, u, f))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, SUBSET(support(op, f, UNIV), s) \226\134\146 iterate(op, s, f) == iterate(op, UNIV, f))
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 f : (A, B) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 iterate(op, s, (i : A) => iterate(op, t, f(i))) == iterate(op, t, (j : B) => iterate(op, s, (i : A) => f(i, j))))
      #|  (g : (B) -> C)((f : (A) -> B)((a : A))) == neutral((op : (C, C) -> C))
      #|  iterate((op : (C, C) -> C), (s : (A) -> Bool), o((g : (B) -> C), (f : (A) -> B))) == iterate(op, IMAGE(f, s), g)
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 g : (B) -> C, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) && f(x) == f(y) \226\134\146 g(f(x)) == neutral(op)) \226\134\146 iterate(op, IMAGE(f, s), g) == iterate(op, s, o(g, f)))
      #|  {(y : B) | IN(y, IMAGE((f : (A) -> B), (s : (A) -> Bool))) && f((x : A)) == y} == {f(x)}
      #|  (x : A)
      #|  iterate((op : (C, C) -> C), (s : (A) -> Bool), (x : A) => iterate(op, {(y : B) | IN(y, IMAGE((f : (A) -> B), s)) && f(x) == y}, (y : B) => (g : (A) -> C)(x)))
      #|  \226\136\128 op : (C, C) -> C, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 iterate(op, s, g) == iterate(op, IMAGE(f, s), (y : B) => iterate(op, {(x : A) | IN(x, s) && f(x) == y}, g)))
      #|  (op : (B, B) -> B)(iterate(op, {(x : A) | IN(x, (s : (A) -> Bool)) && (P : (A) -> Bool)(x)}, (x : A) => if P(x) { (f : (A) -> B)(x) } else { (g : (A) -> B)(x) }), iterate(op, {(x : A) | IN(x, s) && !P(x)}, (x : A) => if P(x) { f(x) } else { g(x) }))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, FINITE(s) \226\134\146 iterate(op, s, (x : A) => if P(x) { f(x) } else { g(x) }) == op(iterate(op, {(x : A) | IN(x, s) && P(x)}, f), iterate(op, {(x : A) | IN(x, s) && !P(x)}, g)))
      #|  DISJOINT({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && !P(x)})
      #|  DISJOINT({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && !P(x)})
      #|  iterate((op : (B, B) -> B), UNION(support(op, (f : (A) -> B), (s : (A) -> Bool)), support(op, (g : (A) -> B), s)), (x : A) => op(f(x), g(x)))
      #|  \226\136\128 op : (B, B) -> B, monoidal(op) \226\134\146 (\226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(support(op, f, s)) && FINITE(support(op, g, s)) \226\134\146 iterate(op, s, (x : A) => op(f(x), g(x))) == op(iterate(op, s, f), iterate(op, s, g)))
      #|  !(SUC((n : Num)) <= n)
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 (\226\136\128 m : Num, iterate(op, op_dot_dot(m, 0), (f : (Num) -> A)) == (if m == 0 { f(0) } else { neutral(op) })) && (\226\136\128 m : Num, \226\136\128 n : Num, iterate(op, op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { op(iterate(op, op_dot_dot(m, n), f), f(SUC(n))) } else { iterate(op, op_dot_dot(m, n), f) }))
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 iterate(op, {(i : Num) | i < 0}, (f : (Num) -> A)) == neutral(op) && (\226\136\128 k : Num, iterate(op, {(i : Num) | i < SUC(k)}, f) == op(iterate(op, {(i : Num) | i < k}, f), f(k)))
      #|  !(SUC((k : Num)) <= k)
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 iterate(op, {(i : Num) | i <= 0}, (f : (Num) -> A)) == f(0) && (\226\136\128 k : Num, iterate(op, {(i : Num) | i <= SUC(k)}, f) == op(iterate(op, {(i : Num) | i <= k}, f), f(SUC(k))))
      #|  2 * SUC((n : Num)) + 1 == SUC(SUC(2 * n + 1))
      #|  2 * SUC((n : Num)) == SUC(2 * n + 1)
      #|  (2 * (m : Num) <= SUC(2 * (n : Num) + 1)) == (m <= SUC(n))
      #|  (2 * (m : Num) <= SUC(SUC(2 * (n : Num) + 1))) == (m <= SUC(n))
      #|  2 * SUC((n : Num)) + 1 == SUC(SUC(2 * n + 1))
      #|  (2 * (m : Num) <= SUC(0)) == (m == 0)
      #|  1
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 (\226\136\128 f : (Num) -> A, \226\136\128 m : Num, \226\136\128 n : Num, iterate(op, op_dot_dot(2 * m, 2 * n + 1), f) == iterate(op, op_dot_dot(m, n), (i : Num) => op(f(2 * i), f(2 * i + 1))))
      #|  ((x : Num) == (n : Num) - (y : Num) && 0 <= y && y <= n - (m : Num)) == (y == n - x && x <= n && y <= n - m)
      #|  :A
      #|  :X
      #|  op_dot_dot(0, (n : Num) - (m : Num))
      #|  (x : (Num) -> A)
      #|  (i : Num) => (n : Num) - i
      #|  \226\136\128 op : (A, A) -> A, monoidal(op) \226\134\146 (\226\136\128 x : (Num) -> A, \226\136\128 m : Num, \226\136\128 n : Num, iterate(op, op_dot_dot(m, n), x) == (if n < m { neutral(op) } else { iterate(op, op_dot_dot(0, n - m), (i : Num) => x(n - i)) }))
      #|  ((p : Bool) && (q : Bool) && !(p && !(r : Bool) && q)) == (r && p && q)
      #|  {(i : _) | IN(i, DIFF((k : (_) -> Bool), {(a : _)})) && (P : (_) -> Bool)(i)} == DELETE({(i : _) | IN(i, k) && P(i)}, a)
      #|  (k : (K) -> Bool) => CARD({(i : K) | IN(i, k) && IN((f : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))})
      #|  \226\136\131 itty : ((A) -> Bool, A, (A, A) -> A, (K, K) -> Bool, (K) -> Bool, (K) -> A) -> A, \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, itty(dom, neut, op, `<<=`, k, f) == (if FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && !({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))} == {}) { LET((i : K) => LET_END(op(f(i), itty(dom, neut, op, `<<=`, {(j : K) | IN(j, DELETE(k, i)) && IN(f(j), DIFF(dom, {neut}))}, f))), if (\226\136\131 i : K, IN(i, k) && IN(f(i), DIFF(dom, {neut})) && (\226\136\128 j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) \226\134\146 j == i)) { select((i : K) => IN(i, k) && IN(f(i), DIFF(dom, {neut})) && (\226\136\128 j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) \226\134\146 j == i)) } else { select((i : K) => IN(i, k) && IN(f(i), DIFF(dom, {neut}))) }) } else { neut })
      #|  (IN((y : _), {(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}) && P(y)) == IN(y, {(x : _) | IN(x, s) && P(x)})
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, iterato(dom, neut, op, `<<=`, {(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}, f) == iterato(dom, neut, op, `<<=`, k, f)
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, iterato(dom, neut, op, `<<=`, k, f) == (if FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) { iterato(dom, neut, op, `<<=`, {(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}, f) } else { neut })
      #|  (j : K) == (i : K)
      #|  (j : K)
      #|  !IN((i : _), (k : (_) -> Bool)) \226\134\146 DELETE(INSERT(i, k), i) == k
      #|  select((i' : K) => IN(i', INSERT((i : K), (k : (K) -> Bool))) && IN((f : (K) -> A)(i'), DIFF((dom : (A) -> Bool), {(neut : A)})) && (\226\136\128 j : K, (op_lt_lt_eq : (K, K) -> Bool)(j, i') && IN(j, INSERT(i, k)) && IN(f(j), DIFF(dom, {neut})) \226\134\146 j == i')) == i
      #|  (i : K)
      #|  INSERT((i : K), {(j : K) | IN(j, (k : (K) -> Bool)) && IN((f : (K) -> A)(j), DIFF((dom : (A) -> Bool), {(neut : A)}))})
      #|  (q : Bool) && (p : Bool) && (x : _) == (z : _) \226\134\146 (if p && q { x } else { (y : _) }) == z
      #|  (IN((x : _), (dom : (_) -> Bool)) \226\134\146 x == (a : _)) == !IN(x, DIFF(dom, {a}))
      #|  IN((i : _), (k : (_) -> Bool)) \226\134\146 INSERT(i, k) == k
      #|  IN((i : K), (k : (K) -> Bool))
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (\226\136\128 i : K, \226\136\128 k : (K) -> Bool, FINITE({(j : K) | IN(j, k) && IN(f(j), DIFF(dom, {neut}))}) && (\226\136\128 j : K, IN(j, k) \226\134\146 i == j || `<<=`(i, j) || `<<=`(j, i)) && (\226\136\128 j : K, `<<=`(j, i) && IN(j, k) && IN(f(j), DIFF(dom, {neut})) \226\134\146 j == i) \226\134\146 iterato(dom, neut, op, `<<=`, INSERT(i, k), f) == (if IN(f(i), dom) \226\134\146 f(i) == neut || IN(i, k) { iterato(dom, neut, op, `<<=`, k, f) } else { op(f(i), iterato(dom, neut, op, `<<=`, k, f)) }))
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (\226\136\128 i : K, \226\136\128 k : (K) -> Bool, FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && (\226\136\128 j : K, IN(j, k) \226\134\146 `<<=`(i, j) && !`<<=`(j, i)) \226\134\146 iterato(dom, neut, op, `<<=`, INSERT(i, k), f) == (if IN(f(i), dom) \226\134\146 f(i) == neut || IN(i, k) { iterato(dom, neut, op, `<<=`, k, f) } else { op(f(i), iterato(dom, neut, op, `<<=`, k, f)) }))
      #|  (t : _) == (i : _) \226\134\146 (t == i \226\134\146 (P : (_) -> Bool)(i)) \226\134\146 (\226\136\131 j : _, P(j))
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 f : (K) -> A, iterato(dom, neut, op, `<<=`, {}, f) == neut && (\226\136\128 k : (K) -> Bool, FINITE({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))}) && !({(i : K) | IN(i, k) && IN(f(i), DIFF(dom, {neut}))} == {}) \226\134\146 (\226\136\131 i : K, IN(i, k) && IN(f(i), DIFF(dom, {neut})) && iterato(dom, neut, op, `<<=`, k, f) == op(f(i), iterato(dom, neut, op, `<<=`, DELETE(k, i), f))))
      #|  {(j : _) | IN(j, DELETE((s : (_) -> Bool), (i : _))) && (P : (_) -> Bool)(j)} == DELETE({(j : _) | IN(j, s) && P(j)}, i)
      #|  IN((i : K), (k : (K) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 i : K, (IN(i, (k : (K) -> Bool)) && IN((f : (K) -> A)(i), s)) == (IN(i, k) && IN((g : (K) -> A)(i), s))
      #|  (k : (K) -> Bool) == {}
      #|  (k : (K) -> Bool)
      #|  (n : Num)
      #|  (\226\136\128 n : Num, \226\136\128 k : (_) -> Bool, FINITE(k) && CARD(k) == n \226\134\146 (P : ((_) -> Bool) -> Bool)(k)) \226\134\146 (\226\136\128 k : (_) -> Bool, FINITE(k) \226\134\146 P(k))
      #|  (k : (K) -> Bool)
      #|  {(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}
      #|  FINITE({(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))})
      #|  \226\136\128 i : K, IN(i, {(i : K) | IN(i, (k : (K) -> Bool)) && IN((g : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}) \226\134\146 (f : (K) -> A)(i) == g(i)
      #|  ((p : Bool) && (q : Bool)) == !(p \226\134\146 !q)
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, \226\136\128 g : (K) -> A, (\226\136\128 i : K, IN(i, k) \226\134\146 f(i) == g(i)) \226\134\146 iterato(dom, neut, op, `<<=`, k, f) == iterato(dom, neut, op, `<<=`, k, g)
      #|  ((n : Num) - 1 < n) == !(n == 0)
      #|  (n : Num) - 1
      #|  (i : K)
      #|  ((p : Bool) \226\134\146 (r : Bool)) && ((q : Bool) \226\134\146 r) \226\134\146 (!p \226\134\146 q) \226\134\146 r
      #|  (k : (K) -> Bool)
      #|  (f : (K) -> A)
      #|  (op_lt_lt_eq : (K, K) -> Bool)
      #|  (op : (A, A) -> A)
      #|  (neut : A)
      #|  (dom : (A) -> Bool)
      #|  (k : (K) -> Bool) == {}
      #|  (k : (K) -> Bool)
      #|  (n : Num)
      #|  (\226\136\128 n : Num, \226\136\128 k : (_) -> Bool, FINITE(k) && CARD(k) == n \226\134\146 (P : ((_) -> Bool) -> Bool)(k)) \226\134\146 (\226\136\128 k : (_) -> Bool, FINITE(k) \226\134\146 P(k))
      #|  (k : (K) -> Bool)
      #|  {(i : K) | IN(i, (k : (K) -> Bool)) && IN((f : (K) -> A)(i), DIFF((dom : (A) -> Bool), {(neut : A)}))}
      #|  ((a : Bool) && (p : Bool) \226\134\146 (if (q : Bool) { (r : Bool) } else { true })) == (a \226\134\146 q \226\134\146 p \226\134\146 r)
      #|  (IN((i : _), (k : (_) -> Bool)) && IN((f : (_) -> _)(i), (s : (_) -> Bool)) && !(f(i) == (z : _)) && (Q : Bool)) == (IN(i, {(j : _) | IN(j, k) && IN(f(j), DIFF(s, {z}))}) && Q)
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, \226\136\128 P : (A) -> Bool, P(neut) && (\226\136\128 i : K, \226\136\128 x : A, IN(i, k) && IN(f(i), dom) && !(f(i) == neut) && P(x) \226\134\146 P(op(f(i), x))) \226\134\146 P(iterato(dom, neut, op, `<<=`, k, f))
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> A, \226\136\128 P : (A) -> Bool, P(neut) && (\226\136\128 x : A, \226\136\128 y : A, P(x) && P(y) \226\134\146 P(op(x, y))) && (\226\136\128 i : K, IN(i, k) && IN(f(i), dom) && !(f(i) == neut) \226\134\146 P(f(i))) \226\134\146 P(iterato(dom, neut, op, `<<=`, k, f))
      #|  IN((i : _), (k : (_) -> Bool)) \226\134\146 INSERT(i, DELETE(k, i)) == k
      #|  DELETE((k : (K) -> Bool), (i : K))
      #|  (i : K)
      #|  (f : (K) -> A)
      #|  ((n : Num) - 1 < n) == !(n == 0)
      #|  DELETE((k : (K) -> Bool), (i : K))
      #|  (n : Num) - 1
      #|  (i : K)
      #|  ((p : Bool) \226\134\146 (r : Bool)) && ((q : Bool) \226\134\146 r) \226\134\146 (!p \226\134\146 q) \226\134\146 r
      #|  (k : (K) -> Bool)
      #|  (f : (K) -> A)
      #|  (op_lt_lt_eq : (K, K) -> Bool)
      #|  (op : (A, A) -> A)
      #|  neutral((op : (A, A) -> A))
      #|  (UNIV : (A) -> Bool)
      #|  (k : (K) -> Bool) == {}
      #|  (k : (K) -> Bool)
      #|  (n : Num)
      #|  (\226\136\128 n : Num, \226\136\128 k : (_) -> Bool, FINITE(k) && CARD(k) == n \226\134\146 (P : ((_) -> Bool) -> Bool)(k)) \226\134\146 (\226\136\128 k : (_) -> Bool, FINITE(k) \226\134\146 P(k))
      #|  (k : (K) -> Bool)
      #|  {(i : K) | IN(i, (k : (K) -> Bool)) && !((f : (K) -> A)(i) == neutral((op : (A, A) -> A)))}
      #|  ((p : Bool) \226\134\146 (x : _) == (y : _)) \226\134\146 (if p { x } else { (z : _) }) == (if p { y } else { z })
      #|  (f : (K) -> A)
      #|  (k : (K) -> Bool)
      #|  \226\136\128 op : (A, A) -> A, \226\136\128 `<<=` : (K, K) -> Bool, monoidal(op) \226\134\146 iterato(UNIV, neutral(op), op, `<<=`) == iterate(op)
      #|  !((m : Num) + 1 <= m)
      #|  op_dot_dot((m : Num) + 1, (n : Num))
      #|  (m : Num)
      #|  (f : (Num) -> A)
      #|  op_lt_eq
      #|  (op : (A, A) -> A)
      #|  (neut : A)
      #|  (dom : (A) -> Bool)
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 neut : A, \226\136\128 op : (A, A) -> A, \226\136\128 f : (Num) -> A, \226\136\128 m : Num, \226\136\128 n : Num, iterato(dom, neut, op, op_lt_eq, op_dot_dot(m, n), f) == (if m <= n { if IN(f(m), dom) \226\134\146 f(m) == neut { iterato(dom, neut, op, op_lt_eq, op_dot_dot(m + 1, n), f) } else { op(f(m), iterato(dom, neut, op, op_lt_eq, op_dot_dot(m + 1, n), f)) } } else { neut })
      #|  (nproduct : ((A) -> Bool, (A) -> Num) -> Num) == iterate(op_star)
      #|  neutral(op_star) == 1
      #|  monoidal(op_star)
      #|  (\226\136\128 f : (A) -> Num, nproduct({}, f) == 1) && (\226\136\128 x : B, \226\136\128 f : (B) -> Num, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 nproduct(INSERT(x, s), f) == (if IN(x, s) { nproduct(s, f) } else { f(x) * nproduct(s, f) }))
      #|  (iproduct : ((A) -> Bool, (A) -> Int) -> Int) == iterate(op_star)
      #|  neutral(op_star) == int_of_num(1)
      #|  (monoidal : ((Int, Int) -> Int) -> Bool)(op_star)
      #|  (\226\136\128 f : (A) -> Int, iproduct({}, f) == int_of_num(1)) && (\226\136\128 x : B, \226\136\128 f : (B) -> Int, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 iproduct(INSERT(x, s), f) == (if IN(x, s) { iproduct(s, f) } else { f(x) * iproduct(s, f) }))
      #|  (product : ((A) -> Bool, (A) -> Real) -> Real) == iterate(op_star)
      #|  neutral(op_star) == real_of_num(1)
      #|  (monoidal : ((Real, Real) -> Real) -> Bool)(op_star)
      #|  (\226\136\128 f : (A) -> Real, product({}, f) == real_of_num(1)) && (\226\136\128 x : B, \226\136\128 f : (B) -> Real, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 product(INSERT(x, s), f) == (if IN(x, s) { product(s, f) } else { f(x) * product(s, f) }))
      #|  (isum : ((A) -> Bool, (A) -> Int) -> Int) == iterate(op_plus)
      #|  neutral(op_plus) == int_of_num(0)
      #|  (monoidal : ((Int, Int) -> Int) -> Bool)(op_plus)
      #|  (\226\136\128 f : (A) -> Int, isum({}, f) == int_of_num(0)) && (\226\136\128 x : B, \226\136\128 f : (B) -> Int, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 isum(INSERT(x, s), f) == (if IN(x, s) { isum(s, f) } else { f(x) + isum(s, f) }))
      #|  (nsum : ((A) -> Bool, (A) -> Num) -> Num) == iterate(op_plus)
      #|  neutral(op_plus) == 0
      #|  monoidal(op_plus)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, !FINITE({(x : A) | IN(x, s) && !(f(x) == 0)}) \226\134\146 nsum(s, f) == 0
      #|  (\226\136\128 f : (A) -> Num, nsum({}, f) == 0) && (\226\136\128 x : B, \226\136\128 f : (B) -> Num, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 nsum(INSERT(x, s), f) == (if IN(x, s) { nsum(s, f) } else { f(x) + nsum(s, f) }))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) \226\134\146 nsum(UNION(s, t), f) == nsum(s, f) + nsum(t, f)
      #|  (x : Num) + (z : Num) == (y : Num) \226\134\146 x == y - z
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && SUBSET(t, s) \226\134\146 nsum(DIFF(s, t), f) == nsum(s, f) - nsum(t, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 f : (A) -> Num, FINITE(s) && FINITE(t) \226\134\146 nsum(s, f) + nsum(t, f) == nsum(UNION(s, t), f) + nsum(INTER(s, t), f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, nsum(support(op_plus, f, s), f) == nsum(s, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 nsum(s, (x : A) => f(x) + g(x)) == nsum(s, f) + nsum(s, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE({(x : A) | IN(x, s) && !(f(x) == 0)}) && FINITE({(x : A) | IN(x, s) && !(g(x) == 0)}) \226\134\146 nsum(s, (x : A) => f(x) + g(x)) == nsum(s, f) + nsum(s, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == 0) \226\134\146 nsum(s, f) == 0
      #|  \226\136\128 s : (A) -> Bool, nsum(s, (n : A) => 0) == 0
      #|  (t : (A) -> Bool)
      #|  support(op_plus, (f : (A) -> Num), (s : (A) -> Bool))
      #|  FINITE(support(op_plus, (f : (A) -> Num), (s : (A) -> Bool)))
      #|  support(op_plus, (x : A) => (c : Num) * (f : (A) -> Num)(x), (s : (A) -> Bool)) == support(op_plus, f, s)
      #|  (c : Num) == 0
      #|  \226\136\128 f : (A) -> Num, \226\136\128 c : Num, \226\136\128 s : (A) -> Bool, nsum(s, (x : A) => c * f(x)) == c * nsum(s, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 c : Num, \226\136\128 s : (A) -> Bool, nsum(s, (x : A) => f(x) * c) == nsum(s, f) * c
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= g(x)) \226\134\146 nsum(s, f) <= nsum(s, g)
      #|  IN((a : A), (s : (A) -> Bool))
      #|  (s : (A) -> Bool) == INSERT((a : A), DELETE(s, a))
      #|  (a : A)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= g(x)) && (\226\136\131 x : A, IN(x, s) && f(x) < g(x)) \226\134\146 nsum(s, f) < nsum(s, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < g(x)) \226\134\146 nsum(s, f) < nsum(s, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 nsum(s, f) == nsum(s, g)
      #|  \226\136\128 c : Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 nsum(s, (n : A) => c) == CARD(s) * c
      #|  0 <= (x : Num) && 0 <= (y : Num) && x + y <= (b : Num) \226\134\146 x <= b && y <= b
      #|  \226\136\128 f : (A) -> Num, \226\136\128 b : Num, \226\136\128 s : (A) -> Bool, FINITE(s) && nsum(s, f) <= b \226\134\146 (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b)
      #|  ((n : Num) == 0) == (n <= 0)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (nsum(s, (f : (A) -> Num)) == 0) == (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == 0)
      #|  (0 < (n : Num)) == !(n == 0)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\131 x : A, IN(x, s) && 0 < f(x)) \226\134\146 0 < nsum(s, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, FINITE(s) && !(s == {}) && (\226\136\128 i : A, IN(i, s) \226\134\146 0 < f(i)) \226\134\146 0 < nsum(s, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) && IN(a, s) \226\134\146 f(a) + nsum(DELETE(s, a), f) == nsum(s, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 x : A, nsum({x}, f) == f(x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, nsum(s, (x : A) => if x == a { (b : Num) } else { 0 }) == (if IN(a, s) { b } else { 0 })
      #|  \226\136\128 f : (A, B) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 nsum(s, (i : A) => nsum(t, f(i))) == nsum(t, (j : B) => nsum(s, (i : A) => f(i, j)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 nsum(IMAGE(f, s), g) == nsum(s, o(g, f))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, SUBSET(u, v) && (\226\136\128 x : A, IN(x, v) && !IN(x, u) \226\134\146 f(x) == 0) \226\134\146 nsum(v, f) == nsum(u, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) \226\134\146 nsum(s, f) == nsum(UNIV, f)
      #|  UNION((u : (_) -> Bool), (v : (_) -> Bool)) == UNION(u, DIFF(v, u))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, FINITE(u) && (\226\136\128 x : A, IN(x, v) && !IN(x, u) \226\134\146 f(x) == 0) \226\134\146 nsum(UNION(u, v), f) == nsum(u, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, FINITE(v) && (\226\136\128 x : A, IN(x, u) && !IN(x, v) \226\134\146 f(x) == 0) \226\134\146 nsum(UNION(u, v), f) == nsum(v, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 nsum(s, (x : A) => if IN(x, s) { f(x) } else { 0 }) == nsum(s, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 b : Num, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b) \226\134\146 nsum(s, f) <= CARD(s) * b
      #|  nsum((s : (A) -> Bool), (x : A) => CARD(s) * (f : (A) -> Num)(x)) <= CARD(s) * (b : Num)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 b : Num, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= DIV(b, CARD(s))) \226\134\146 nsum(s, f) <= b
      #|  nsum((s : (A) -> Bool), (x : A) => (b : Num))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 b : Num, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b) && (\226\136\131 x : A, IN(x, s) && f(x) < b) \226\134\146 nsum(s, f) < CARD(s) * b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 b : Num, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < b) \226\134\146 nsum(s, f) < CARD(s) * b
      #|  ((a : Num) + 1 <= (b : Num)) == (a < b)
      #|  nsum((s : (A) -> Bool), (a : A) => (f : (A) -> Num)(a) + 1)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 b : Num, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < DIV(b, CARD(s))) \226\134\146 nsum(s, f) < b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, FINITE(u) && INTER(s, t) == {} && UNION(s, t) == u \226\134\146 nsum(s, (f : (A) -> Num)) + nsum(t, f) == nsum(u, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 x : A, IN(x, t) \226\134\146 f(x) == (g : (A) -> Num)(x)) && (\226\136\128 x : A, IN(x, s) && !IN(x, t) \226\134\146 f(x) == 0) \226\134\146 nsum(s, f) == nsum(t, g)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Num, nsum({(x : A) | IN(x, s) && P(x)}, f) == nsum(s, (x : A) => if P(x) { f(x) } else { 0 })
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 f : (A, B) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 nsum(s, (x : A) => nsum({(y : B) | IN(y, t) && R(x, y)}, (y : B) => f(x, y))) == nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && R(x, y)}, (x : A) => f(x, y)))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 CARD(s) == nsum(s, (x : A) => 1)
      #|  nsum((s : (A) -> Bool), (i : A) => nsum({(j : B) | IN(j, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(i, j)}, (j : B) => 1))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (B) -> Num, FINITE(s) && FINITE(t) && (\226\136\128 j : B, IN(j, t) \226\134\146 CARD({(i : A) | IN(i, s) && R(i, j)}) == k(j)) \226\134\146 nsum(s, (i : A) => CARD({(j : B) | IN(j, t) && R(i, j)})) == nsum(t, (i : B) => k(i))
      #|  nsum((t : (B) -> Bool), (i : B) => (k : Num))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : Num, FINITE(s) && FINITE(t) && (\226\136\128 j : B, IN(j, t) \226\134\146 CARD({(i : A) | IN(i, s) && R(i, j)}) == k) \226\134\146 nsum(s, (i : A) => CARD({(j : B) | IN(j, t) && R(i, j)})) == k * CARD(t)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 nsum(s, g) == nsum(IMAGE(f, s), (y : B) => nsum({(x : A) | IN(x, s) && f(x) == y}, g))
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> Num)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && SUBSET(IMAGE(f, s), t) \226\134\146 nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && f(x) == y}, g)) == nsum(s, g)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> Num)
      #|  (x : A) => select((y : B) => IN(y, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(x, y))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 existsunique((y : B) => IN(y, t) && R(x, y))) \226\134\146 nsum(t, (y : B) => nsum({(x : A) | IN(x, s) && R(x, y)}, g)) == nsum(s, g)
      #|  UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(v, u)) == v
      #|  UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(u, v)) == u
      #|  INTER((u : (A) -> Bool), (v : (A) -> Bool))
      #|  (f : (A) -> Num)
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, \226\136\128 f : (A) -> Num, FINITE(u) && FINITE(v) && (\226\136\128 x : A, IN(x, DIFF(u, v)) \226\134\146 f(x) == 0) \226\134\146 nsum(u, f) <= nsum(v, f)
      #|  DIFF((u : (A) -> Bool), (v : (A) -> Bool))
      #|  DIFF((v : (A) -> Bool), (u : (A) -> Bool))
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, \226\136\128 f : (A) -> Num, FINITE(v) && SUBSET(u, v) \226\134\146 nsum(u, f) <= nsum(v, f)
      #|  nsum({(x : A) | IN(x, (s : (A) -> Bool)) && !((g : (A) -> Num)(x) == 0)}, (f : (A) -> Num))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= g(x)) && FINITE({(x : A) | IN(x, s) && !(g(x) == 0)}) \226\134\146 nsum(s, f) <= nsum(s, g)
      #|  (i : A)
      #|  \226\136\128 a : (A) -> Num, \226\136\128 b : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 nsum(s, (i : A) => a(i) * b(i)) <= nsum(s, a) * nsum(s, b)
      #|  \226\136\128 d : (B) -> Num, \226\136\128 i : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) && i(x) == i(y) \226\134\146 d(i(x)) == 0) \226\134\146 nsum(IMAGE(i, s), d) == nsum(s, o(d, i))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 y : A, IN(y, s) \226\134\146 existsunique((x : A) => IN(x, s) && p(x) == y)) \226\134\146 nsum(s, f) == nsum(s, o(f, p))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 x : (A, B) -> Num, FINITE(s) && (\226\136\128 i : A, IN(i, s) \226\134\146 FINITE(t(i))) \226\134\146 nsum(s, (i : A) => nsum(t(i), x(i))) == nsum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 g : (B) -> Num, \226\136\128 h : (A) -> B, (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && h(x) == y)) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && g(h(x)) == f(x)) \226\134\146 nsum(s, f) == nsum(t, g)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 g : (B) -> Num, \226\136\128 h : (A) -> B, \226\136\128 k : (B) -> A, (\226\136\128 y : B, IN(y, t) \226\134\146 IN(k(y), s) && h(k(y)) == y) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) \226\134\146 nsum(s, f) == nsum(t, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && p(x) == p(y) \226\134\146 x == y) \226\134\146 nsum(s, o(f, p)) == nsum(s, f)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && (\226\136\128 x : A, IN(x, INTER(s, t)) \226\134\146 f(x) == 0) \226\134\146 nsum(UNION(s, t), f) == nsum(s, f) + nsum(t, f)
      #|  (s : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : ((A) -> Bool) -> Bool, FINITE(s) && (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 FINITE(t)) && (\226\136\128 t1 : (A) -> Bool, \226\136\128 t2 : (A) -> Bool, \226\136\128 x : A, IN(t1, s) && IN(t2, s) && !(t1 == t2) && IN(x, t1) && IN(x, t2) \226\134\146 f(x) == 0) \226\134\146 nsum(UNIONS(s), f) == nsum(s, (t : (A) -> Bool) => nsum(t, f))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, FINITE(s) \226\134\146 nsum(s, (x : A) => if P(x) { f(x) } else { g(x) }) == nsum({(x : A) | IN(x, s) && P(x)}, f) + nsum({(x : A) | IN(x, s) && !P(x)}, g)
      #|  (P : (Num) -> Bool)
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, P(0) && (\226\136\128 x : Num, \226\136\128 y : Num, P(x) && P(y) \226\134\146 P(x + y)) && (\226\136\128 a : A, IN(a, s) \226\134\146 P(f(a))) \226\134\146 P(nsum(s, f))
      #|  (R : (Num, Num) -> Bool)
      #|  \226\136\128 R : (Num, Num) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, R(0, 0) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 m' : Num, \226\136\128 n' : Num, R(m, n) && R(m', n') \226\134\146 R(m + m', n + n')) && FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(nsum(s, f), nsum(s, g))
      #|  (P : (Num) -> Bool)
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : Num, \226\136\128 y : Num, P(x) && P(y) \226\134\146 P(x + y)) && (\226\136\128 a : A, IN(a, s) \226\134\146 P(f(a))) \226\134\146 P(nsum(s, f))
      #|  (R : (Num, Num) -> Bool)
      #|  \226\136\128 R : (Num, Num) -> Bool, \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 m' : Num, \226\136\128 n' : Num, R(m, n) && R(m', n') \226\134\146 R(m + m', n + n')) && FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(nsum(s, f), nsum(s, g))
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 g : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == nsum(op_dot_dot(m, n), f) + nsum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 g : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) <= g(i)) \226\134\146 nsum(op_dot_dot(m, n), f) <= nsum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 g : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) == g(i)) \226\134\146 nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(m, n), g)
      #|  \226\136\128 c : Num, \226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(m, n), (n : Num) => c) == (n + 1 - m) * c
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) == 0) \226\134\146 nsum(op_dot_dot(m, n), f) == 0
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, (nsum(op_dot_dot(m, n), f) == 0) == (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) == 0)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, n < m \226\134\146 nsum(op_dot_dot(m, n), f) == 0
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 n : Num, nsum(op_dot_dot(n, n), f) == f(n)
      #|  (\226\136\128 m : Num, nsum(op_dot_dot(m, 0), (f : (Num) -> Num)) == (if m == 0 { f(0) } else { 0 })) && (\226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { nsum(op_dot_dot(m, n), f) + f(SUC(n)) } else { nsum(op_dot_dot(m, n), f) }))
      #|  nsum({(i : Num) | i < 0}, (f : (Num) -> Num)) == 0 && (\226\136\128 k : Num, nsum({(i : Num) | i < SUC(k)}, f) == nsum({(i : Num) | i < k}, f) + f(k))
      #|  nsum({(i : Num) | i <= 0}, (f : (Num) -> Num)) == f(0) && (\226\136\128 k : Num, nsum({(i : Num) | i <= SUC(k)}, f) == nsum({(i : Num) | i <= k}, f) + f(SUC(k)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 d : Num, \226\136\128 f : (Num, Num) -> Num, nsum(op_dot_dot(a, b), (i : Num) => nsum(op_dot_dot(c, d), f(i))) == nsum(op_dot_dot(c, d), (j : Num) => nsum(op_dot_dot(a, b), (i : Num) => f(i, j)))
      #|  (x : Num) < x + 1
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n + 1 \226\134\146 nsum(op_dot_dot(m, n + p), f) == nsum(op_dot_dot(m, n), f) + nsum(op_dot_dot(n + 1, n + p), f)
      #|  \226\136\128 p : Num, \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(m + p, n + p), f) == nsum(op_dot_dot(m, n), (i : Num) => f(i + p))
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(0, n - m), (i : Num) => f(i + m))
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 nsum(op_dot_dot(m, n), f) == f(m) + nsum(op_dot_dot(m + 1, n), f)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, 0 < n && m <= n \226\134\146 nsum(op_dot_dot(m, n), f) == nsum(op_dot_dot(m, n - 1), f) + f(n)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(2 * m, 2 * n + 1), f) == nsum(op_dot_dot(m, n), (i : Num) => f(2 * i) + f(2 * i + 1))
      #|  \226\136\128 x : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, nsum(op_dot_dot(m, n), x) == (if n < m { 0 } else { nsum(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })
      #|  (n : Num) == 0
      #|  \226\136\128 f : (A) -> Num, \226\136\128 n : Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 MOD(nsum(s, f), n) == MOD(nsum(s, (i : A) => MOD(f(i), n)), n)
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, MOD(nsum(op_dot_dot(a, b), f), n) == MOD(nsum(op_dot_dot(a, b), (i : Num) => MOD(f(i), n)), n)
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> Num)
      #|  (f : (A) -> Num)
      #|  (x : Num) => (y : Num) => op_eq_eq(x, y, mod((n : Num)))
      #|  \226\136\128 n : Num, \226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 op_eq_eq(f(x), g(x), mod(n))) \226\134\146 op_eq_eq(nsum(s, f), nsum(s, g), mod(n))
      #|  (\226\136\128 f : (A) -> Num, \226\136\128 g : (A) -> Num, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 nsum(s, (i : A) => f(i)) == nsum(s, g)) && (\226\136\128 f : (Num) -> Num, \226\136\128 g : (Num) -> Num, \226\136\128 a : Num, \226\136\128 b : Num, (\226\136\128 i : Num, a <= i && i <= b \226\134\146 f(i) == g(i)) \226\134\146 nsum(op_dot_dot(a, b), (i : Num) => f(i)) == nsum(op_dot_dot(a, b), g)) && (\226\136\128 f : (_) -> Num, \226\136\128 g : (_) -> Num, \226\136\128 p : (_) -> Bool, (\226\136\128 x : _, p(x) \226\134\146 f(x) == g(x)) \226\134\146 nsum({(y : _) | p(y)}, (i : _) => f(i)) == nsum({(y : _) | p(y)}, g))
      #|  \226\136\128 f : (K, A) -> Bool, \226\136\128 s : (K) -> Bool, FINITE(s) && (\226\136\128 t : K, IN(t, s) \226\134\146 FINITE(f(t))) && (\226\136\128 t : K, \226\136\128 u : K, IN(t, s) && IN(u, s) && !(t == u) \226\134\146 INTER(f(t), f(u)) == {}) \226\134\146 CARD(UNIONS(IMAGE(f, s))) == nsum(s, (i : K) => CARD(f(i)))
      #|  (x : (A) -> Bool) => x
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, FINITE(s) && (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 FINITE(t)) && (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, IN(t, s) && IN(u, s) && !(t == u) \226\134\146 INTER(t, u) == {}) \226\134\146 CARD(UNIONS(s)) == nsum(s, CARD)
      #|  ((n : Num) < (m : Num) \226\134\146 nsum(op_dot_dot(m, n), (f : (Num) -> Num)) == 0) && nsum(op_dot_dot(m, m), f) == f(m) && (m <= n \226\134\146 nsum(op_dot_dot(m, n), f) == f(m) + nsum(op_dot_dot(m + 1, n), f))
      #|  op_dot_dot
      #|  (f : (Num) -> Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (sum : ((A) -> Bool, (A) -> Real) -> Real) == iterate(op_plus)
      #|  neutral(op_plus) == real_of_num(0)
      #|  (monoidal : ((Real, Real) -> Real) -> Bool)(op_plus)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, !FINITE({(x : A) | IN(x, s) && !(f(x) == real_of_num(0))}) \226\134\146 sum(s, f) == real_of_num(0)
      #|  (\226\136\128 f : (A) -> Real, sum({}, f) == real_of_num(0)) && (\226\136\128 x : B, \226\136\128 f : (B) -> Real, \226\136\128 s : (B) -> Bool, FINITE(s) \226\134\146 sum(INSERT(x, s), f) == (if IN(x, s) { sum(s, f) } else { f(x) + sum(s, f) }))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) \226\134\146 sum(UNION(s, t), f) == sum(s, f) + sum(t, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && SUBSET(t, s) \226\134\146 sum(DIFF(s, t), f) == sum(s, f) - sum(t, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 f : (A) -> Real, FINITE(s) && FINITE(t) \226\134\146 sum(s, f) + sum(t, f) == sum(UNION(s, t), f) + sum(INTER(s, t), f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, sum(support(op_plus, f, s), f) == sum(s, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 sum(s, (x : A) => f(x) + g(x)) == sum(s, f) + sum(s, g)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE({(x : A) | IN(x, s) && !(f(x) == real_of_num(0))}) && FINITE({(x : A) | IN(x, s) && !(g(x) == real_of_num(0))}) \226\134\146 sum(s, (x : A) => f(x) + g(x)) == sum(s, f) + sum(s, g)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(s, f) == real_of_num(0)
      #|  \226\136\128 s : (A) -> Bool, sum(s, (n : A) => real_of_num(0)) == real_of_num(0)
      #|  (t : (A) -> Bool)
      #|  support(op_plus, (f : (A) -> Real), (s : (A) -> Bool))
      #|  FINITE(support(op_plus, (f : (A) -> Real), (s : (A) -> Bool)))
      #|  support(op_plus, (x : A) => (c : Real) * (f : (A) -> Real)(x), (s : (A) -> Bool)) == support(op_plus, f, s)
      #|  (c : Real) == real_of_num(0)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 c : Real, \226\136\128 s : (A) -> Bool, sum(s, (x : A) => c * f(x)) == c * sum(s, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 c : Real, \226\136\128 s : (A) -> Bool, sum(s, (x : A) => f(x) * c) == sum(s, f) * c
      #|  -(x : Real) == -real_of_num(1) * x
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, sum(s, (x : A) => -f(x)) == -sum(s, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 sum(s, (x : A) => f(x) - g(x)) == sum(s, f) - sum(s, g)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= g(x)) \226\134\146 sum(s, f) <= sum(s, g)
      #|  IN((a : A), (s : (A) -> Bool))
      #|  (s : (A) -> Bool) == INSERT((a : A), DELETE(s, a))
      #|  (a : A)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= g(x)) && (\226\136\131 x : A, IN(x, s) && f(x) < g(x)) \226\134\146 sum(s, f) < sum(s, g)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < g(x)) \226\134\146 sum(s, f) < sum(s, g)
      #|  sum((s : (A) -> Bool), (i : A) => real_of_num(0))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 real_of_num(0) <= f(x)) && (\226\136\131 x : A, IN(x, s) && real_of_num(0) < f(x)) \226\134\146 real_of_num(0) < sum(s, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, FINITE(s) && !(s == {}) && (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) < f(i)) \226\134\146 real_of_num(0) < sum(s, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 sum(s, f) == sum(s, g)
      #|  abs((a : Real)) <= (b : Real) \226\134\146 abs((x : Real) + a) <= abs(x) + b
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 abs(sum(s, f)) <= sum(s, (x : A) => abs(f(x)))
      #|  sum((s : (A) -> Bool), (x : A) => abs((f : (A) -> Real)(x)))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 abs(f(x)) <= g(x)) \226\134\146 abs(sum(s, f)) <= sum(s, g)
      #|  \226\136\128 c : Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 sum(s, (n : A) => c) == real_of_num(CARD(s)) * c
      #|  {(x : A) | IN(x, (s : (A) -> Bool)) && !((f : (A) -> Real)(x) == real_of_num(0))}
      #|  (f : (A) -> Real)
      #|  (x : A) => real_of_num(0)
      #|  FINITE({(x : A) | IN(x, (s : (A) -> Bool)) && !((f : (A) -> Real)(x) == real_of_num(0))})
      #|  \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 real_of_num(0) <= (f : (A) -> Real)(x)) \226\134\146 real_of_num(0) <= sum(s, f)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && x + y <= (b : Real) \226\134\146 x <= b && y <= b
      #|  \226\136\128 f : (A) -> Real, \226\136\128 b : Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 real_of_num(0) <= f(x)) && sum(s, f) <= b \226\134\146 (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 real_of_num(0) <= f(x)) && sum(s, f) == real_of_num(0) \226\134\146 (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == real_of_num(0))
      #|  ((x : Real) == real_of_num(0)) == (-x == real_of_num(0))
      #|  (\226\136\131 j : A, \226\136\131 k : A, IN(j, (s : (A) -> Bool)) && (u : (A) -> Real)(j) < real_of_num(0) && IN(k, s) && u(k) > real_of_num(0)) || (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) <= u(i)) || (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) <= -u(i))
      #|  (real_of_num(0) <= -(u : Real)) == !(u > real_of_num(0)) && (real_of_num(0) <= u) == !(u < real_of_num(0))
      #|  \226\136\128 u : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && sum(s, u) == real_of_num(0) \226\134\146 (\226\136\128 i : A, IN(i, s) \226\134\146 u(i) == real_of_num(0)) || (\226\136\131 j : A, \226\136\131 k : A, IN(j, s) && u(j) < real_of_num(0) && IN(k, s) && u(k) > real_of_num(0))
      #|  ((y : Real) == (z : Real) - (x : Real)) == (x + y == z)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) && IN(a, s) \226\134\146 sum(DELETE(s, a), f) == sum(s, f) - f(a)
      #|  !IN((a : _), (s : (_) -> Bool)) \226\134\146 DELETE(s, a) == s
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) \226\134\146 sum(DELETE(s, a), f) == (if IN(a, s) { sum(s, f) - f(a) } else { sum(s, f) })
      #|  \226\136\128 f : (A) -> Real, \226\136\128 x : A, sum({x}, f) == f(x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, sum(s, (x : A) => if x == a { (b : Real) } else { real_of_num(0) }) == (if IN(a, s) { b } else { real_of_num(0) })
      #|  \226\136\128 f : (A, B) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 sum(s, (i : A) => sum(t, f(i))) == sum(t, (j : B) => sum(s, (i : A) => f(i, j)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> Real, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 sum(IMAGE(f, s), g) == sum(s, o(g, f))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, SUBSET(u, v) && (\226\136\128 x : A, IN(x, v) && !IN(x, u) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(v, f) == sum(u, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) \226\134\146 sum(s, f) == sum(UNIV, f)
      #|  UNION((u : (_) -> Bool), (v : (_) -> Bool)) == UNION(u, DIFF(v, u))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, FINITE(u) && (\226\136\128 x : A, IN(x, v) && !IN(x, u) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(UNION(u, v), f) == sum(u, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, FINITE(v) && (\226\136\128 x : A, IN(x, u) && !IN(x, v) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(UNION(u, v), f) == sum(v, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 sum(s, (x : A) => if IN(x, s) { f(x) } else { real_of_num(0) }) == sum(s, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b) \226\134\146 sum(s, f) <= real_of_num(CARD(s)) * b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b / real_of_num(CARD(s))) \226\134\146 sum(s, f) <= b
      #|  sum((s : (A) -> Bool), (x : A) => abs((f : (A) -> Real)(x)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 abs(f(x)) <= b) \226\134\146 abs(sum(s, f)) <= real_of_num(CARD(s)) * b
      #|  sum((s : (A) -> Bool), (x : A) => (b : Real))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) <= b) && (\226\136\131 x : A, IN(x, s) && f(x) < b) \226\134\146 sum(s, f) < real_of_num(CARD(s)) * b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < b) \226\134\146 sum(s, f) < real_of_num(CARD(s)) * b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 b : Real, FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) < b / real_of_num(CARD(s))) \226\134\146 sum(s, f) < b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, FINITE(u) && INTER(s, t) == {} && UNION(s, t) == u \226\134\146 sum(s, (f : (A) -> Real)) + sum(t, f) == sum(u, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 x : A, IN(x, t) \226\134\146 f(x) == (g : (A) -> Real)(x)) && (\226\136\128 x : A, IN(x, s) && !IN(x, t) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(s, f) == sum(t, g)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> Real, sum({(x : A) | IN(x, s) && P(x)}, f) == sum(s, (x : A) => if P(x) { f(x) } else { real_of_num(0) })
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 f : (A, B) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 sum(s, (x : A) => sum({(y : B) | IN(y, t) && R(x, y)}, (y : B) => f(x, y))) == sum(t, (y : B) => sum({(x : A) | IN(x, s) && R(x, y)}, (x : A) => f(x, y)))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 real_of_num(CARD(s)) == sum(s, (x : A) => real_of_num(1))
      #|  sum((s : (A) -> Bool), (i : A) => sum({(j : B) | IN(j, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(i, j)}, (j : B) => real_of_num(1)))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (B) -> Num, FINITE(s) && FINITE(t) && (\226\136\128 j : B, IN(j, t) \226\134\146 CARD({(i : A) | IN(i, s) && R(i, j)}) == k(j)) \226\134\146 sum(s, (i : A) => real_of_num(CARD({(j : B) | IN(j, t) && R(i, j)}))) == sum(t, (i : B) => real_of_num(k(i)))
      #|  sum((t : (B) -> Bool), (i : B) => real_of_num((k : Num)))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : Num, FINITE(s) && FINITE(t) && (\226\136\128 j : B, IN(j, t) \226\134\146 CARD({(i : A) | IN(i, s) && R(i, j)}) == k) \226\134\146 sum(s, (i : A) => real_of_num(CARD({(j : B) | IN(j, t) && R(i, j)}))) == real_of_num(k * CARD(t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 sum(s, g) == sum(IMAGE(f, s), (y : B) => sum({(x : A) | IN(x, s) && f(x) == y}, g))
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> Real)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && SUBSET(IMAGE(f, s), t) \226\134\146 sum(t, (y : B) => sum({(x : A) | IN(x, s) && f(x) == y}, g)) == sum(s, g)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> Real)
      #|  (x : A) => select((y : B) => IN(y, (t : (B) -> Bool)) && (R : (A, B) -> Bool)(x, y))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 existsunique((y : B) => IN(y, t) && R(x, y))) \226\134\146 sum(t, (y : B) => sum({(x : A) | IN(x, s) && R(x, y)}, g)) == sum(s, g)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 real_of_num(nsum(s, f)) == sum(s, (x : A) => real_of_num(f(x)))
      #|  real_of_num(0) <= -(x : Real) && real_of_num(0) <= (y : Real) \226\134\146 (a : Real) + x <= a + y
      #|  UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(v, u)) == v
      #|  UNION(INTER((u : (_) -> Bool), (v : (_) -> Bool)), DIFF(u, v)) == u
      #|  INTER((u : (A) -> Bool), (v : (A) -> Bool))
      #|  (f : (A) -> Real)
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, \226\136\128 f : (A) -> Real, FINITE(u) && FINITE(v) && (\226\136\128 x : A, IN(x, DIFF(u, v)) \226\134\146 f(x) <= real_of_num(0)) && (\226\136\128 x : A, IN(x, DIFF(v, u)) \226\134\146 real_of_num(0) <= f(x)) \226\134\146 sum(u, f) <= sum(v, f)
      #|  DIFF((u : (A) -> Bool), (v : (A) -> Bool))
      #|  DIFF((v : (A) -> Bool), (u : (A) -> Bool))
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 v : (A) -> Bool, \226\136\128 f : (A) -> Real, FINITE(v) && SUBSET(u, v) && (\226\136\128 x : A, IN(x, DIFF(v, u)) \226\134\146 real_of_num(0) <= f(x)) \226\134\146 sum(u, f) <= sum(v, f)
      #|  (i : A)
      #|  \226\136\128 a : (A) -> Real, \226\136\128 b : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 i : A, IN(i, s) \226\134\146 real_of_num(0) <= a(i) && real_of_num(0) <= b(i)) \226\134\146 sum(s, (i : A) => a(i) * b(i)) <= sum(s, a) * sum(s, b)
      #|  \226\136\128 d : (B) -> Real, \226\136\128 i : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) && i(x) == i(y) \226\134\146 d(i(x)) == real_of_num(0)) \226\134\146 sum(IMAGE(i, s), d) == sum(s, o(d, i))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 y : A, IN(y, s) \226\134\146 existsunique((x : A) => IN(x, s) && p(x) == y)) \226\134\146 sum(s, f) == sum(s, o(f, p))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 x : (A, B) -> Real, FINITE(s) && (\226\136\128 i : A, IN(i, s) \226\134\146 FINITE(t(i))) \226\134\146 sum(s, (i : A) => sum(t(i), x(i))) == sum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 g : (B) -> Real, \226\136\128 h : (A) -> B, (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && h(x) == y)) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && g(h(x)) == f(x)) \226\134\146 sum(s, f) == sum(t, g)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 g : (B) -> Real, \226\136\128 h : (A) -> B, \226\136\128 k : (B) -> A, (\226\136\128 y : B, IN(y, t) \226\134\146 IN(k(y), s) && h(k(y)) == y) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) \226\134\146 sum(s, f) == sum(t, g)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 p : (A) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(p(x), s)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && p(x) == p(y) \226\134\146 x == y) \226\134\146 sum(s, o(f, p)) == sum(s, f)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && (\226\136\128 x : A, IN(x, INTER(s, t)) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(UNION(s, t), f) == sum(s, f) + sum(t, f)
      #|  (s : ((A) -> Bool) -> Bool)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 f : (A) -> Real, \226\136\128 s : ((A) -> Bool) -> Bool, FINITE(s) && (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 FINITE(t)) && (\226\136\128 t1 : (A) -> Bool, \226\136\128 t2 : (A) -> Bool, \226\136\128 x : A, IN(t1, s) && IN(t2, s) && !(t1 == t2) && IN(x, t1) && IN(x, t2) \226\134\146 f(x) == real_of_num(0)) \226\134\146 sum(UNIONS(s), f) == sum(s, (t : (A) -> Bool) => sum(t, f))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, FINITE(s) \226\134\146 sum(s, (x : A) => if P(x) { f(x) } else { g(x) }) == sum({(x : A) | IN(x, s) && P(x)}, f) + sum({(x : A) | IN(x, s) && !P(x)}, g)
      #|  IN((a : _), (s : (_) -> Bool)) \226\134\146 {(x : _) | IN(x, s) && x == a} == {a}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, FINITE(s) && IN(a, s) \226\134\146 sum(s, (x : A) => if x == a { (y : Real) } else { (f : (A) -> Real)(x) }) == sum(s, f) + (y - f(a))
      #|  sum({(y : B)}, (g : (B) -> Real))
      #|  (y : B)
      #|  (x : A)
      #|  (x : A)
      #|  sum((s : (A) -> Bool), (y : A) => sum({(x : B) | IN(x, (t : (B) -> Bool)) && (i : (B) -> A)(x) == y}, (g : (B) -> Real)))
      #|  sum(IMAGE((i : (B) -> A), (t : (B) -> Bool)), (y : A) => sum({(x : B) | IN(x, t) && i(x) == y}, (g : (B) -> Real)))
      #|  \226\136\128 f : (A) -> Real, \226\136\128 g : (B) -> Real, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 i : (B) -> A, FINITE(s) && FINITE(t) && (\226\136\128 y : B, IN(y, t) \226\134\146 real_of_num(0) <= g(y)) && (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 y : B, IN(y, t) && i(y) == x && f(x) <= g(y))) \226\134\146 sum(s, f) <= sum(t, g)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 real_of_num(0) <= g(f(x))) \226\134\146 sum(IMAGE(f, s), g) <= sum(s, o(g, f))
      #|  (P : (Real) -> Bool)
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, P(real_of_num(0)) && (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) \226\134\146 P(x + y)) && (\226\136\128 a : A, IN(a, s) \226\134\146 P(f(a))) \226\134\146 P(sum(s, f))
      #|  (R : (Real, Real) -> Bool)
      #|  \226\136\128 R : (Real, Real) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, R(real_of_num(0), real_of_num(0)) && (\226\136\128 m : Real, \226\136\128 n : Real, \226\136\128 m' : Real, \226\136\128 n' : Real, R(m, n) && R(m', n') \226\134\146 R(m + m', n + n')) && FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(sum(s, f), sum(s, g))
      #|  (P : (Real) -> Bool)
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) && (\226\136\128 x : Real, \226\136\128 y : Real, P(x) && P(y) \226\134\146 P(x + y)) && (\226\136\128 a : A, IN(a, s) \226\134\146 P(f(a))) \226\134\146 P(sum(s, f))
      #|  (R : (Real, Real) -> Bool)
      #|  \226\136\128 R : (Real, Real) -> Bool, \226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, (\226\136\128 m : Real, \226\136\128 n : Real, \226\136\128 m' : Real, \226\136\128 n' : Real, R(m, n) && R(m', n') \226\134\146 R(m + m', n + n')) && FINITE(s) && !(s == {}) && (\226\136\128 x : A, IN(x, s) \226\134\146 R(f(x), g(x))) \226\134\146 R(sum(s, f), sum(s, g))
      #|  \226\136\128 f : (A) -> Num, \226\136\128 s : (A) -> Bool, FINITE({(i : A) | IN(i, s) && !(f(i) == 0)}) \226\134\146 real_of_num(nsum(s, f)) == sum(s, (x : A) => real_of_num(f(x)))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == sum(op_dot_dot(m, n), f) + sum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (i : Num) => f(i) - g(i)) == sum(op_dot_dot(m, n), f) - sum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) <= g(i)) \226\134\146 sum(op_dot_dot(m, n), f) <= sum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) == g(i)) \226\134\146 sum(op_dot_dot(m, n), f) == sum(op_dot_dot(m, n), g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, abs(sum(op_dot_dot(m, n), f)) <= sum(op_dot_dot(m, n), (i : Num) => abs(f(i)))
      #|  \226\136\128 c : Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (n : Num) => c) == real_of_num(n + 1 - m) * c
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 i : Num, m <= i && i <= n \226\134\146 f(i) == real_of_num(0)) \226\134\146 sum(op_dot_dot(m, n), f) == real_of_num(0)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, n < m \226\134\146 sum(op_dot_dot(m, n), f) == real_of_num(0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, (\226\136\128 p : Num, m <= p && p <= n \226\134\146 real_of_num(0) <= f(p)) \226\134\146 real_of_num(0) <= sum(op_dot_dot(m, n), f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 p : Num, m <= p && p <= n \226\134\146 real_of_num(0) <= f(p)) && sum(op_dot_dot(m, n), f) == real_of_num(0) \226\134\146 (\226\136\128 p : Num, m <= p && p <= n \226\134\146 f(p) == real_of_num(0))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, sum(op_dot_dot(n, n), f) == f(n)
      #|  (\226\136\128 m : Num, sum(op_dot_dot(m, 0), (f : (Num) -> Real)) == (if m == 0 { f(0) } else { real_of_num(0) })) && (\226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { sum(op_dot_dot(m, n), f) + f(SUC(n)) } else { sum(op_dot_dot(m, n), f) }))
      #|  sum({(i : Num) | i < 0}, (f : (Num) -> Real)) == real_of_num(0) && (\226\136\128 k : Num, sum({(i : Num) | i < SUC(k)}, f) == sum({(i : Num) | i < k}, f) + f(k))
      #|  sum({(i : Num) | i <= 0}, (f : (Num) -> Real)) == f(0) && (\226\136\128 k : Num, sum({(i : Num) | i <= SUC(k)}, f) == sum({(i : Num) | i <= k}, f) + f(SUC(k)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 d : Num, \226\136\128 f : (Num, Num) -> Real, sum(op_dot_dot(a, b), (i : Num) => sum(op_dot_dot(c, d), f(i))) == sum(op_dot_dot(c, d), (j : Num) => sum(op_dot_dot(a, b), (i : Num) => f(i, j)))
      #|  (x : Num) < x + 1
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n + 1 \226\134\146 sum(op_dot_dot(m, n + p), f) == sum(op_dot_dot(m, n), f) + sum(op_dot_dot(n + 1, n + p), f)
      #|  \226\136\128 p : Num, \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m + p, n + p), f) == sum(op_dot_dot(m, n), (i : Num) => f(i + p))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 sum(op_dot_dot(m, n), f) == sum(op_dot_dot(0, n - m), (i : Num) => f(i + m))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 sum(op_dot_dot(m, n), f) == f(m) + sum(op_dot_dot(m + 1, n), f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, 0 < n && m <= n \226\134\146 sum(op_dot_dot(m, n), f) == sum(op_dot_dot(m, n - 1), f) + f(n)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(2 * m, 2 * n + 1), f) == sum(op_dot_dot(m, n), (i : Num) => f(2 * i) + f(2 * i + 1))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), x) == (if n < m { real_of_num(0) } else { sum(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(nsum(op_dot_dot(m, n), f)) == sum(op_dot_dot(m, n), (i : Num) => real_of_num(f(i)))
      #|  (n : Num) < SUC(n)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (k : Num) => f(k) * (g(k + 1) - g(k))) == (if m <= n { f(n + 1) * g(n + 1) - f(m) * g(m) - sum(op_dot_dot(m, n), (k : Num) => g(k + 1) * (f(k + 1) - f(k))) } else { real_of_num(0) })
      #|  (n : Num)
      #|  (m : Num)
      #|  (k : Num) => (g : (Num) -> Real)(k - 1)
      #|  (f : (Num) -> Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (k : Num) => f(k) * (g(k) - g(k - 1))) == (if m <= n { f(n + 1) * g(n) - f(m) * g(m - 1) - sum(op_dot_dot(m, n), (k : Num) => g(k) * (f(k + 1) - f(k))) } else { real_of_num(0) })
      #|  (a : Real) - (b : Real) == -real_of_num(1) * (b - a)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Real)(k) - f(k + 1)) == (if m <= n { f(m) - f(n + 1) } else { real_of_num(0) })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, sum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Real)(k + 1) - f(k)) == (if m <= n { f(n + 1) - f(m) } else { real_of_num(0) })
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m <= n + 1 && n <= p \226\134\146 sum(op_dot_dot(m, n), f) + sum(op_dot_dot(n + 1, p), f) == sum(op_dot_dot(m, p), f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, 0 < n && m <= n && n <= p + 1 \226\134\146 sum(op_dot_dot(m, n - 1), f) + sum(op_dot_dot(n, p), f) == sum(op_dot_dot(m, p), f)
      #|  (\226\136\128 f : (A) -> Real, \226\136\128 g : (A) -> Real, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 sum(s, (i : A) => f(i)) == sum(s, g)) && (\226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 a : Num, \226\136\128 b : Num, (\226\136\128 i : Num, a <= i && i <= b \226\134\146 f(i) == g(i)) \226\134\146 sum(op_dot_dot(a, b), (i : Num) => f(i)) == sum(op_dot_dot(a, b), g)) && (\226\136\128 f : (_) -> Real, \226\136\128 g : (_) -> Real, \226\136\128 p : (_) -> Bool, (\226\136\128 x : _, p(x) \226\134\146 f(x) == g(x)) \226\134\146 sum({(y : _) | p(y)}, (i : _) => f(i)) == sum({(y : _) | p(y)}, g))
      #|  ((n : Num) < (m : Num) \226\134\146 sum(op_dot_dot(m, n), (f : (Num) -> Real)) == real_of_num(0)) && sum(op_dot_dot(m, m), f) == f(m) && (m <= n \226\134\146 sum(op_dot_dot(m, n), f) == f(m) + sum(op_dot_dot(m + 1, n), f))
      #|  op_dot_dot
      #|  (f : (Num) -> Real)
      #|  (m : Num)
      #|  (n : Num)
      #|  1 <= (n : Num) && (x : Num) <= n - 1 \226\134\146 n - 1 - x == n - (x + 1) && SUC(n - 1 - x) == n - x
      #|  ((x : Real) - (y : Real)) * ((a : Real) * (b : Real)) == x * a * b - a * (y * b)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 n : Num, 1 <= n \226\134\146 pow(x, n) - pow(y, n) == (x - y) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i) * pow(y, n - 1 - i))
      #|  real_of_num(1)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, 1 <= n \226\134\146 pow(x, n) - real_of_num(1) == (x - real_of_num(1)) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, 1 <= n \226\134\146 real_of_num(1) - pow(x, n) == (real_of_num(1) - x) * sum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))
      #|  (a : Num) - (b : Num) - (c : Num) == a - (b + c)
      #|  GABS((f : ((Num, Num)) -> (Num, Num)) => \226\136\128 x : Num, \226\136\128 y : Num, GEQ(f((x, y)), (y, x)))
      #|  (a : Real) * ((x : Real) * (s : Real)) == x * (a * s)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 n : Num, 1 <= n \226\134\146 sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)) - sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(y, i)) == (x - y) * sum(op_dot_dot(0, n - 1), (j : Num) => sum(op_dot_dot(j + 1, n), (i : Num) => a(i) * pow(y, i - j - 1)) * pow(x, j))
      #|  (k : Num) => (j : Num) + (k + 1)
      #|  (i : Num) => i - ((j : Num) + 1)
      #|  (j : Num)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 n : Num, 1 <= n \226\134\146 sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(x, i)) - sum(op_dot_dot(0, n), (i : Num) => a(i) * pow(y, i)) == (x - y) * sum(op_dot_dot(0, n - 1), (j : Num) => sum(op_dot_dot(0, n - j - 1), (k : Num) => a(j + (k + 1)) * pow(y, k)) * pow(x, j))
      #|  (n : Num) + 1 - n - 1 == 0
      #|  (n : Num)
      #|  FINITE((s : (_) -> Bool)) && CARD(s) <= (n : Num) \226\134\146 FINITE(INSERT((r : _), s)) && CARD(INSERT(r, s)) <= SUC(n)
      #|  (x : Num) <= (n : Num) \226\134\146 SUC(x) <= SUC(n) && x <= SUC(n)
      #|  {(x : _) | x == (c : _) || (P : (_) -> Bool)(x)} == INSERT(c, {(x : _) | P(x)})
      #|  1 <= SUC((n : Num))
      #|  SUC((n : Num))
      #|  (r : Real)
      #|  (x : Real)
      #|  (c : (Num) -> Real)
      #|  (x : Real)
      #|  (r : Real)
      #|  {(x : Real) | sum(op_dot_dot(0, SUC((n : Num))), (i : Num) => (c : (Num) -> Real)(i) * pow(x, i)) == real_of_num(0)} == {}
      #|  (c : (Num) -> Real)(SUC((n : Num))) == real_of_num(0)
      #|  (c : (Num) -> Real)
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, !(\226\136\128 i : Num, IN(i, op_dot_dot(0, n)) \226\134\146 c(i) == real_of_num(0)) \226\134\146 FINITE({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) && CARD({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) <= n
      #|  {(x : Real) | true} == UNIV
      #|  ((a : Bool) && !(b : Bool)) == !(a \226\134\146 b)
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, FINITE({(x : Real) | sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)}) == (\226\136\131 i : Num, IN(i, op_dot_dot(0, n)) && !(c(i) == real_of_num(0)))
      #|  {(x : Real) | true} == UNIV
      #|  (p : Bool) == !!p
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, (\226\136\128 x : Real, sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == real_of_num(0)) == (\226\136\128 i : Num, IN(i, op_dot_dot(0, n)) \226\134\146 c(i) == real_of_num(0))
      #|  (\226\136\128 n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (\226\136\128 n : Num, !(n == 0) \226\134\146 P(n)))
      #|  ((c : Real) - (k : Real) + (s : Real) == real_of_num(0)) == (c + s == k)
      #|  \226\136\128 x : Real, sum(op_dot_dot(0, (n : Num)), (i : Num) => (if i == 0 { (c : (Num) -> Real)(0) - (k : Real) } else { c(i) }) * pow(x, i)) == real_of_num(0)
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, \226\136\128 k : Real, (\226\136\128 x : Real, sum(op_dot_dot(0, n), (i : Num) => c(i) * pow(x, i)) == k) == (c(0) == k && (\226\136\128 i : Num, IN(i, op_dot_dot(1, n)) \226\134\146 c(i) == real_of_num(0)))
      #|  (polynomial_function : ((Real) -> Real) -> Bool)((p : (Real) -> Real)) == (\226\136\131 m : Num, \226\136\131 c : (Num) -> Real, \226\136\128 x : Real, p(x) == sum(op_dot_dot(0, m), (i : Num) => c(i) * pow(x, i)))
      #|  (i : Num) => (c : Real)
      #|  0
      #|  \226\136\128 c : Real, polynomial_function((x : Real) => c)
      #|  (i : Num) => if i == 1 { real_of_num(1) } else { real_of_num(0) }
      #|  SUC(0)
      #|  polynomial_function((x : Real) => x)
      #|  polynomial_function(I)
      #|  (i : Num) => (if i <= (m : Num) { (a : (Num) -> Real)(i) } else { real_of_num(0) }) + (if i <= (n : Num) { (b : (Num) -> Real)(i) } else { real_of_num(0) })
      #|  MAX((m : Num), (n : Num))
      #|  (b : (Num) -> Real)
      #|  (n : Num)
      #|  (a : (Num) -> Real)
      #|  (m : Num)
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) \226\134\146 polynomial_function((x : Real) => p(x) + q(x))
      #|  (i : Num) => (c : Real) * (a : (Num) -> Real)(i)
      #|  (n : Num)
      #|  (a : (Num) -> Real)
      #|  (n : Num)
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 c : Real, polynomial_function(p) \226\134\146 polynomial_function((x : Real) => c * p(x))
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 c : Real, polynomial_function(p) \226\134\146 polynomial_function((x : Real) => p(x) * c)
      #|  -real_of_num(1)
      #|  \226\136\128 p : (Real) -> Real, polynomial_function((x : Real) => -p(x)) == polynomial_function(p)
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) \226\134\146 polynomial_function((x : Real) => p(x) - q(x))
      #|  1
      #|  (i : Num) => if i == 0 { real_of_num(0) } else { (a : (Num) -> Real)(i - 1) }
      #|  (n : Num) + 1
      #|  (a : (Num) -> Real)
      #|  (n : Num)
      #|  (q : (Real) -> Real) == ((x : Real) => (p : (Real) -> Real)(x) * sum(op_dot_dot(0, (m : Num)), (i : Num) => (c : (Num) -> Real)(i + 1) * pow(x, i)))
      #|  (i : Num) => (c : (Num) -> Real)(i + 1)
      #|  1
      #|  (c : (Num) -> Real)
      #|  (\226\136\128 q : _, \226\136\128 m : _, \226\136\128 c : _, (P : (_, _, _) -> Bool)(q, m, c)) == (\226\136\128 m : _, \226\136\128 c : _, \226\136\128 q : _, P(q, m, c))
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) \226\134\146 polynomial_function((x : Real) => p(x) * q(x))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 p : (Real, A) -> Real, FINITE(s) && (\226\136\128 i : A, IN(i, s) \226\134\146 polynomial_function((x : Real) => p(x, i))) \226\134\146 polynomial_function((x : Real) => sum(s, p(x)))
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 n : Num, polynomial_function(p) \226\134\146 polynomial_function((x : Real) => pow(p(x), n))
      #|  1
      #|  (\226\136\128 q : _, \226\136\128 m : _, \226\136\128 c : _, (P : (_, _, _) -> Bool)(q, m, c)) == (\226\136\128 m : _, \226\136\128 c : _, \226\136\128 q : _, P(q, m, c))
      #|  \226\136\128 P : ((Real) -> Real) -> Bool, P((x : Real) => x) && (\226\136\128 c : Real, P((x : Real) => c)) && (\226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, P(p) && P(q) \226\134\146 P((x : Real) => p(x) + q(x))) && (\226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, P(p) && P(q) \226\134\146 P((x : Real) => p(x) * q(x))) \226\134\146 (\226\136\128 p : (Real) -> Real, polynomial_function(p) \226\134\146 P(p))
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 q : (Real) -> Real, polynomial_function(p) && polynomial_function(q) \226\134\146 polynomial_function(o(p, q))
      #|  !((p : Bool) && !(q : Bool)) == (p \226\134\146 q)
      #|  \226\136\128 p : (Real) -> Real, polynomial_function(p) \226\134\146 FINITE({(x : Real) | p(x) == real_of_num(0)}) == !(\226\136\128 x : Real, p(x) == real_of_num(0))
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 a : Real, polynomial_function(p) \226\134\146 FINITE({(x : Real) | p(x) == a}) == !(\226\136\128 x : Real, p(x) == a)
      #|numseg =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) x:num)) ((#<=:fun(num,fun(num,bool)) x:num) n:num))) x:num))))))))))
      #|FINITE_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#FINITE:fun(fun(num,bool),bool) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))))))
      #|NUMSEG_COMBINE_R =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#<=:fun(num,fun(num,bool)) p:num) n:num))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) p:num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))))
      #|NUMSEG_COMBINE_L =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#..:fun(num,fun(num,fun(num,bool))) p:num) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))))
      #|NUMSEG_LREC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) m:num) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))
      #|NUMSEG_RREC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) n:num) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))
      #|NUMSEG_REC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#SUC:fun(num,num) n:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#SUC:fun(num,num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))))))))
      #|IN_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) p:num) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) n:num)))))))))
      #|IN_NUMSEG_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) m:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|NUMSEG_SING =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) n:num)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) n:num) #EMPTY:fun(num,bool)))))
      #|NUMSEG_EMPTY =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) #EMPTY:fun(num,bool))) ((#<:fun(num,fun(num,bool)) n:num) m:num))))))
      #|EMPTY_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) #EMPTY:fun(num,bool)))))))
      #|FINITE_SUBSET_NUMSEG =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(num,bool),bool) (\n:num. ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)))))))
      #|CARD_NUMSEG_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(num,bool),num) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#+:fun(num,fun(num,num)) m:num) d:num)))) ((#+:fun(num,fun(num,num)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|CARD_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(num,bool),num) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))))))
      #|HAS_SIZE_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#HAS_SIZE:fun(fun(num,bool),fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))))))
      #|CARD_NUMSEG_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(num,bool),num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))) n:num)))
      #|HAS_SIZE_NUMSEG_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#HAS_SIZE:fun(fun(num,bool),fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) n:num)))
      #|NUMSEG_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#NUMERAL:fun(num,num) #_0:num))) (((#COND:fun(bool,fun(fun(num,bool),fun(fun(num,bool),fun(num,bool)))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))) #EMPTY:fun(num,bool)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#SUC:fun(num,num) n:num))) (((#COND:fun(bool,fun(fun(num,bool),fun(fun(num,bool),fun(num,bool)))) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#SUC:fun(num,num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num))))))))
      #|FINITE_INDEX_NUMSEG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) j:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) i:num)) (f:fun(num,'A) j:num))))) ((#=:fun(num,fun(num,bool)) i:num) j:num))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))))
      #|FINITE_INDEX_NUMBERS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,bool),bool),bool) (\k:fun(num,bool). (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) k:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) j:num) k:fun(num,bool))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) i:num)) (f:fun(num,'A) j:num))))) ((#=:fun(num,fun(num,bool)) i:num) j:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) k:fun(num,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) k:fun(num,bool))))))))))))
      #|INTER_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) p:num) q:num))) ((#..:fun(num,fun(num,fun(num,bool))) ((#MAX:fun(num,fun(num,num)) m:num) p:num)) ((#MIN:fun(num,fun(num,num)) n:num) q:num)))))))))))
      #|DISJOINT_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) p:num) q:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) q:num) m:num)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#<:fun(num,fun(num,bool)) q:num) p:num)))))))))))))
      #|NUMSEG_ADD_SPLIT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) n:num) p:num)))))))))))
      #|NUMSEG_OFFSET_IMAGE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) (\i:num. ((#+:fun(num,fun(num,num)) i:num) p:num))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)))))))))
      #|SUBSET_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) ((#..:fun(num,fun(num,fun(num,bool))) p:num) q:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) m:num)) ((#<=:fun(num,fun(num,bool)) n:num) q:num))))))))))))
      #|NUMSEG_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%2:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%2:num) ((#<=:fun(num,fun(num,bool)) x:num) n:num)) x:num)))))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))))
      #|NUMSEG_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%3:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%3:num) ((#<:fun(num,fun(num,bool)) x:num) n:num)) x:num)))))) (((#COND:fun(bool,fun(fun(num,bool),fun(fun(num,bool),fun(num,bool)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) #EMPTY:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|TOPOLOGICAL_SORT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\<<:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<:fun('A,fun('A,bool)) x:'A) y:'A)) ((<<:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<:fun('A,fun('A,bool)) x:'A) y:'A)) ((<<:fun('A,fun('A,bool)) y:'A) z:'A))) ((<<:fun('A,fun('A,bool)) x:'A) z:'A)))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)))) (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) j:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) k:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))) ((#<:fun(num,fun(num,bool)) j:num) k:num)))) (#~:fun(bool,bool) ((<<:fun('A,fun('A,bool)) (f:fun(num,'A) k:num)) (f:fun(num,'A) j:num)))))))))))))))))))
      #|FINITE_INT_SEG =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(int,bool),bool) (\l:int. (#forall:fun(fun(int,bool),bool) (\r:int. (#FINITE:fun(fun(int,bool),bool) (#GSPEC:fun(fun(int,bool),fun(int,bool)) (\GEN%PVAR%4:int. (#?:fun(fun(int,bool),bool) (\x:int. (((#SETSPEC:fun(int,fun(bool,fun(int,bool))) GEN%PVAR%4:int) ((#/\:fun(bool,fun(bool,bool)) ((#int_le:fun(int,fun(int,bool)) l:int) x:int)) ((#int_le:fun(int,fun(int,bool)) x:int) r:int))) x:int))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(int,bool),bool) (\l:int. (#forall:fun(fun(int,bool),bool) (\r:int. (#FINITE:fun(fun(int,bool),bool) (#GSPEC:fun(fun(int,bool),fun(int,bool)) (\GEN%PVAR%5:int. (#?:fun(fun(int,bool),bool) (\x:int. (((#SETSPEC:fun(int,fun(bool,fun(int,bool))) GEN%PVAR%5:int) ((#/\:fun(bool,fun(bool,bool)) ((#int_le:fun(int,fun(int,bool)) l:int) x:int)) ((#int_lt:fun(int,fun(int,bool)) x:int) r:int))) x:int))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(int,bool),bool) (\l:int. (#forall:fun(fun(int,bool),bool) (\r:int. (#FINITE:fun(fun(int,bool),bool) (#GSPEC:fun(fun(int,bool),fun(int,bool)) (\GEN%PVAR%6:int. (#?:fun(fun(int,bool),bool) (\x:int. (((#SETSPEC:fun(int,fun(bool,fun(int,bool))) GEN%PVAR%6:int) ((#/\:fun(bool,fun(bool,bool)) ((#int_lt:fun(int,fun(int,bool)) l:int) x:int)) ((#int_le:fun(int,fun(int,bool)) x:int) r:int))) x:int))))))))))) (#forall:fun(fun(int,bool),bool) (\l:int. (#forall:fun(fun(int,bool),bool) (\r:int. (#FINITE:fun(fun(int,bool),bool) (#GSPEC:fun(fun(int,bool),fun(int,bool)) (\GEN%PVAR%7:int. (#?:fun(fun(int,bool),bool) (\x:int. (((#SETSPEC:fun(int,fun(bool,fun(int,bool))) GEN%PVAR%7:int) ((#/\:fun(bool,fun(bool,bool)) ((#int_lt:fun(int,fun(int,bool)) l:int) x:int)) ((#int_lt:fun(int,fun(int,bool)) x:int) r:int))) x:int)))))))))))))
      #|neutral =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#=:fun('A,fun('A,bool)) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))) (#@:fun(fun('A,bool),'A) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) x:'A) y:'A)) y:'A)) ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) y:'A) x:'A)) y:'A)))))))))
      #|monoidal =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#=:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) x:'A) y:'A)) ((op:fun('A,fun('A,'A)) y:'A) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) x:'A) ((op:fun('A,fun('A,'A)) y:'A) z:'A))) ((op:fun('A,fun('A,'A)) ((op:fun('A,fun('A,'A)) x:'A) y:'A)) z:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))) x:'A)) x:'A))))))))
      #|MONOIDAL_AC =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))) a:'A)) a:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) a:'A) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A))))) a:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) a:'A) b:'A)) ((op:fun('A,fun('A,'A)) b:'A) a:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) ((op:fun('A,fun('A,'A)) a:'A) b:'A)) c:'A)) ((op:fun('A,fun('A,'A)) a:'A) ((op:fun('A,fun('A,'A)) b:'A) c:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#=:fun('A,fun('A,bool)) ((op:fun('A,fun('A,'A)) a:'A) ((op:fun('A,fun('A,'A)) b:'A) c:'A))) ((op:fun('A,fun('A,'A)) b:'A) ((op:fun('A,fun('A,'A)) a:'A) c:'A))))))))))))))))
      #|support =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%8:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%8:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))) x:'A))))))))))))
      #|iterate =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#COND:fun(bool,fun('B,fun('B,'B))) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) (\x:'A. (\a:'B. ((op:fun('B,fun('B,'B)) (f:fun('A,'B) x:'A)) a:'B)))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))))))
      #|IN_SUPPORT =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))))))))))
      #|SUPPORT_SUPPORT =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))))))))
      #|SUPPORT_EMPTY =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) #EMPTY:fun('A,bool)))))))))
      #|SUPPORT_SUBSET =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) s:fun('A,bool))))))))
      #|FINITE_SUPPORT =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))))))))))
      #|SUPPORT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) #EMPTY:fun('A,bool))) #EMPTY:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun('C,fun('C,bool)) (f:fun('A,'C) x:'A)) (#neutral:fun(fun('C,fun('C,'C)),'C) op:fun('C,fun('C,'C))))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool))) x:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) t:fun('A,bool))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) t:fun('A,bool))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) s:fun('A,bool))) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) f:fun('A,'C)) t:fun('A,bool))))))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('B,'C),fun(fun('B,bool),fun('B,bool)))) op:fun('C,fun('C,'C))) g:fun('B,'C)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (((#support:fun(fun('C,fun('C,'C)),fun(fun('A,'C),fun(fun('A,bool),fun('A,bool)))) op:fun('C,fun('C,'C))) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) s:fun('A,bool))))))))))))))))
      #|SUPPORT_DELTA =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))) s:fun('A,bool))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))) #EMPTY:fun('A,bool)))))))))))
      #|FINITE_SUPPORT_DELTA =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\a:'A. (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))) s:fun('A,bool)))))))))
      #|ITERATE_SUPPORT =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B)))))))))
      #|ITERATE_EXPAND_CASES =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#COND:fun(bool,fun('B,fun('B,'B))) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) f:fun('A,'B))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))))))
      #|ITERATE_CLAUSES_GEN =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) #EMPTY:fun('A,bool)) f:fun('A,'B))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) f:fun('A,'B))) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) ((op:fun('B,fun('B,'B)) (f:fun('A,'B) x:'A)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))))))))))))))))
      #|ITERATE_CLAUSES =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) #EMPTY:fun('A,bool)) f:fun('A,'C))) (#neutral:fun(fun('C,fun('C,'C)),'C) op:fun('C,fun('C,'C))))))) (#forall:fun(fun(fun('B,'C),bool),bool) (\f:fun('B,'C). (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,'C))) (((#COND:fun(bool,fun('C,fun('C,'C))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) s:fun('B,bool)) f:fun('B,'C))) ((op:fun('C,fun('C,'C)) (f:fun('B,'C) x:'B)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) s:fun('B,bool)) f:fun('B,'C))))))))))))))))
      #|ITERATE_UNION =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B))))))))))))))
      #|ITERATE_UNION_GEN =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) t:fun('A,bool)))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) t:fun('A,bool)))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B))))))))))))))
      #|ITERATE_DIFF =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B)))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B)))))))))))))
      #|ITERATE_DIFF_GEN =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) t:fun('A,bool))) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool))))) ((#=:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B)))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B)))))))))))))
      #|ITERATE_INCL_EXCL =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B)))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))))))))))))))
      #|ITERATE_CLOSED =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('B,bool) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('B,bool) x:'B)) (P:fun('B,bool) y:'B))) (P:fun('B,bool) ((op:fun('B,fun('B,'B)) x:'B) y:'B))))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))) (P:fun('B,bool) (f:fun('A,'B) x:'A)))))) (P:fun('B,bool) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))))))))))))))
      #|ITERATE_RELATED =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\R:fun('B,fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('B,fun('B,bool)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))) (#forall:fun(fun('B,bool),bool) (\x1:'B. (#forall:fun(fun('B,bool),bool) (\y1:'B. (#forall:fun(fun('B,bool),bool) (\x2:'B. (#forall:fun(fun('B,bool),bool) (\y2:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('B,fun('B,bool)) x1:'B) x2:'B)) ((R:fun('B,fun('B,bool)) y1:'B) y2:'B))) ((R:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) x1:'B) y1:'B)) ((op:fun('B,fun('B,'B)) x2:'B) y2:'B))))))))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))))) ((R:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) g:fun('A,'B))))))))))))))))
      #|ITERATE_EQ_NEUTRAL =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))))))))
      #|ITERATE_SING =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))) f:fun('A,'B))) (f:fun('A,'B) x:'A)))))))))
      #|ITERATE_CLOSED_NONEMPTY =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('B,bool) x:'B)) (P:fun('B,bool) y:'B))) (P:fun('B,bool) ((op:fun('B,fun('B,'B)) x:'B) y:'B)))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('B,bool) (f:fun('A,'B) x:'A)))))))) (P:fun('B,bool) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))))))))))))))
      #|ITERATE_RELATED_NONEMPTY =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\R:fun('B,fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x1:'B. (#forall:fun(fun('B,bool),bool) (\y1:'B. (#forall:fun(fun('B,bool),bool) (\x2:'B. (#forall:fun(fun('B,bool),bool) (\y2:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('B,fun('B,bool)) x1:'B) x2:'B)) ((R:fun('B,fun('B,bool)) y1:'B) y2:'B))) ((R:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) x1:'B) y1:'B)) ((op:fun('B,fun('B,'B)) x2:'B) y2:'B)))))))))))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))) ((R:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) g:fun('A,'B))))))))))))))))
      #|ITERATE_DELETE =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) ((op:fun('B,fun('B,'B)) (f:fun('A,'B) a:'A)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A)) f:fun('A,'B)))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B)))))))))))))
      #|ITERATE_DELTA =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (f:fun('A,'B) a:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))))))))))
      #|ITERATE_IMAGE =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) g:fun('B,'C))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))))))))))))))
      #|ITERATE_BIJECTION =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) y:'A))))))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) ((#o:fun(fun('A,'B),fun(fun('A,'A),fun('A,'B))) f:fun('A,'B)) p:fun('A,'A))))))))))))))
      #|ITERATE_ITERATE_PRODUCT =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\x:fun('A,fun('B,'C)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) i:'A))))))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) (\i:'A. (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) (t:fun('A,fun('B,bool)) i:'A)) (x:fun('A,fun('B,'C)) i:'A))))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),'C),'C))) op:fun('C,fun('C,'C))) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%9:prod('A,'B). (#?:fun(fun('A,bool),bool) (\i:'A. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%9:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) (t:fun('A,fun('B,bool)) i:'A)))) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))))))))) (#GABS:fun(fun(fun(prod('A,'B),'C),bool),fun(prod('A,'B),'C)) (\f:fun(prod('A,'B),'C). (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun('B,bool),bool) (\j:'B. ((#GEQ:fun('C,fun('C,bool)) (f:fun(prod('A,'B),'C) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))) ((x:fun('A,fun('B,'C)) i:'A) j:'B))))))))))))))))))))
      #|ITERATE_EQ =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) g:fun('A,'B)))))))))))))
      #|ITERATE_RESTRICT_SET =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%10:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%10:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) (P:fun('A,bool) x:'A)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))))))))))))
      #|ITERATE_EQ_GENERAL =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) x:'A)) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('C,fun('C,bool)) (g:fun('B,'C) (h:fun('A,'B) x:'A))) (f:fun('A,'C) x:'A)))))))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) f:fun('A,'C))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) t:fun('B,bool)) g:fun('B,'C)))))))))))))))))
      #|ITERATE_EQ_GENERAL_INVERSES =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\k:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (k:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) (k:fun('B,'A) y:'B))) y:'B)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (k:fun('B,'A) (h:fun('A,'B) x:'A))) x:'A)) ((#=:fun('C,fun('C,bool)) (g:fun('B,'C) (h:fun('A,'B) x:'A))) (f:fun('A,'C) x:'A))))))))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) f:fun('A,'C))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) t:fun('B,bool)) g:fun('B,'C)))))))))))))))))))
      #|ITERATE_INJECTION =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) (p:fun('A,'A) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) ((#o:fun(fun('A,'B),fun(fun('A,'A),fun('A,'B))) f:fun('A,'B)) p:fun('A,'A)))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B)))))))))))))
      #|ITERATE_UNION_NONZERO =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B)))))))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,'B))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) t:fun('A,bool)) f:fun('A,'B))))))))))))))
      #|ITERATE_OP =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) (\x:'A. ((op:fun('B,fun('B,'B)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) g:fun('A,'B))))))))))))))
      #|ITERATE_SUPERSET =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (#neutral:fun(fun('B,fun('B,'B)),'B) op:fun('B,fun('B,'B))))))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) v:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) u:fun('A,bool)) f:fun('A,'B)))))))))))))
      #|ITERATE_UNIV =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) #UNIV:fun('A,bool))) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) #UNIV:fun('A,bool)) f:fun('A,'B)))))))))))
      #|ITERATE_SWAP =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\f:fun('A,fun('B,'C)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) (\i:'A. (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) t:fun('B,bool)) (f:fun('A,fun('B,'C)) i:'A))))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) t:fun('B,bool)) (\j:'B. (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) (\i:'A. ((f:fun('A,fun('B,'C)) i:'A) j:'B))))))))))))))))
      #|ITERATE_IMAGE_NONZERO =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))) ((#=:fun('C,fun('C,bool)) (g:fun('B,'C) (f:fun('A,'B) x:'A))) (#neutral:fun(fun('C,fun('C,'C)),'C) op:fun('C,fun('C,'C))))))))))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) g:fun('B,'C))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))))))))))))))
      #|ITERATE_IMAGE_GEN =  |- (#forall:fun(fun(fun('C,fun('C,'C)),bool),bool) (\op:fun('C,fun('C,'C)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('C,fun('C,'C)),bool) op:fun('C,fun('C,'C)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('C,fun('C,bool)) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) s:fun('A,bool)) g:fun('A,'C))) (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('B,bool),fun(fun('B,'C),'C))) op:fun('C,fun('C,'C))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (\y:'B. (((#iterate:fun(fun('C,fun('C,'C)),fun(fun('A,bool),fun(fun('A,'C),'C))) op:fun('C,fun('C,'C))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%11:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%11:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A)))))) g:fun('A,'C)))))))))))))))
      #|ITERATE_CASES =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) (P:fun('A,bool) x:'A)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%12:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%12:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%13:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%13:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (P:fun('A,bool) x:'A)))) x:'A)))))) g:fun('A,'B))))))))))))))))
      #|ITERATE_OP_GEN =  |- (#forall:fun(fun(fun('B,fun('B,'B)),bool),bool) (\op:fun('B,fun('B,'B)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('B,fun('B,'B)),bool) op:fun('B,fun('B,'B)))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) f:fun('A,'B)) s:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) (((#support:fun(fun('B,fun('B,'B)),fun(fun('A,'B),fun(fun('A,bool),fun('A,bool)))) op:fun('B,fun('B,'B))) g:fun('A,'B)) s:fun('A,bool))))) ((#=:fun('B,fun('B,bool)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) (\x:'A. ((op:fun('B,fun('B,'B)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))) ((op:fun('B,fun('B,'B)) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) f:fun('A,'B))) (((#iterate:fun(fun('B,fun('B,'B)),fun(fun('A,bool),fun(fun('A,'B),'B))) op:fun('B,fun('B,'B))) s:fun('A,bool)) g:fun('A,'B))))))))))))))
      #|ITERATE_CLAUSES_NUMSEG =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#SUC:fun(num,num) n:num))) f:fun(num,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((op:fun('A,fun('A,'A)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,'A))) (f:fun(num,'A) (#SUC:fun(num,num) n:num)))) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,'A))))))))))))
      #|ITERATE_CLAUSES_NUMSEG_LT =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%14:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%14:num) ((#<:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,'A))) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A))))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%15:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%15:num) ((#<:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,'A))) ((op:fun('A,fun('A,'A)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%16:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%16:num) ((#<:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,'A))) (f:fun(num,'A) k:num)))))))))
      #|ITERATE_CLAUSES_NUMSEG_LE =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%17:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%17:num) ((#<=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,'A))) (f:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%18:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%18:num) ((#<=:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,'A))) ((op:fun('A,fun('A,'A)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%19:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%19:num) ((#<=:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,'A))) (f:fun(num,'A) (#SUC:fun(num,num) k:num))))))))))
      #|ITERATE_PAIR =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,'A))) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((op:fun('A,fun('A,'A)) (f:fun(num,'A) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))) (f:fun(num,'A) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|ITERATE_REFLECT =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) x:fun(num,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))) (((#iterate:fun(fun('A,fun('A,'A)),fun(fun(num,bool),fun(fun(num,'A),'A))) op:fun('A,fun('A,'A))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) m:num))) (\i:num. (x:fun(num,'A) ((#-:fun(num,fun(num,num)) n:num) i:num)))))))))))))))
      #|iterato =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%20:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%20:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K))))))) (#~:fun(bool,bool) ((#=:fun(fun('K,bool),fun(fun('K,bool),bool)) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%21:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%21:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K)))))) #EMPTY:fun('K,bool))))) ((#LET:fun(fun('K,'A),fun('K,'A)) (\i:'K. (#LET_END:fun('A,'A) ((op:fun('A,fun('A,'A)) (f:fun('K,'A) i:'K)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%22:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%22:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) ((#DELETE:fun(fun('K,bool),fun('K,fun('K,bool))) k:fun('K,bool)) i:'K))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) j:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) j:'K)))))) f:fun('K,'A)))))) (((#COND:fun(bool,fun('K,fun('K,'K))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<=:fun('K,fun('K,bool)) j:'K) i:'K)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) j:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))))) ((#=:fun('K,fun('K,bool)) j:'K) i:'K))))))))) (#@:fun(fun('K,bool),'K) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<=:fun('K,fun('K,bool)) j:'K) i:'K)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) j:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))))) ((#=:fun('K,fun('K,bool)) j:'K) i:'K))))))))) (#@:fun(fun('K,bool),'K) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))))))) neut:'A))))))))))))))
      #|ITERATO_SUPPORT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%23:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%23:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K)))))) f:fun('K,'A))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A)))))))))))))))
      #|ITERATO_EXPAND_CASES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%24:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%24:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K))))))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%25:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%25:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K)))))) f:fun('K,'A))) neut:'A))))))))))))))
      #|ITERATO_CLAUSES_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) #EMPTY:fun('K,bool)) f:fun('K,'A))) neut:'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%26:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%26:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) j:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) j:'K))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('K,fun('K,bool)) i:'K) j:'K)) ((#\/:fun(bool,fun(bool,bool)) ((<<=:fun('K,fun('K,bool)) i:'K) j:'K)) ((<<=:fun('K,fun('K,bool)) j:'K) i:'K))))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<=:fun('K,fun('K,bool)) j:'K) i:'K)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) j:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))))) ((#=:fun('K,fun('K,bool)) j:'K) i:'K))))))) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) ((#INSERT:fun('K,fun(fun('K,bool),fun('K,bool))) i:'K) k:fun('K,bool))) f:fun('K,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) dom:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('K,'A) i:'K)) neut:'A)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) ((op:fun('A,fun('A,'A)) (f:fun('K,'A) i:'K)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A)))))))))))))))))))))
      #|ITERATO_CLAUSES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) #EMPTY:fun('K,bool)) f:fun('K,'A))) neut:'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%27:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%27:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K))))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((<<=:fun('K,fun('K,bool)) i:'K) j:'K)) (#~:fun(bool,bool) ((<<=:fun('K,fun('K,bool)) j:'K) i:'K)))))))) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) ((#INSERT:fun('K,fun(fun('K,bool),fun('K,bool))) i:'K) k:fun('K,bool))) f:fun('K,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) dom:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('K,'A) i:'K)) neut:'A)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) ((op:fun('A,fun('A,'A)) (f:fun('K,'A) i:'K)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A)))))))))))))))))))))
      #|ITERATO_CLAUSES_EXISTS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) #EMPTY:fun('K,bool)) f:fun('K,'A))) neut:'A)) (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%28:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%28:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K))))))) (#~:fun(bool,bool) ((#=:fun(fun('K,bool),fun(fun('K,bool),bool)) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%29:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%29:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool)))))) i:'K)))))) #EMPTY:fun('K,bool))))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) dom:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) neut:'A) #EMPTY:fun('A,bool))))) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) ((op:fun('A,fun('A,'A)) (f:fun('K,'A) i:'K)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) ((#DELETE:fun(fun('K,bool),fun('K,fun('K,bool))) k:fun('K,bool)) i:'K)) f:fun('K,'A))))))))))))))))))))))
      #|ITERATO_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (#forall:fun(fun(fun('K,'A),bool),bool) (\g:fun('K,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('K,'A) i:'K)) (g:fun('K,'A) i:'K)))))) ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) g:fun('K,'A))))))))))))))))))
      #|ITERATO_INDUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) neut:'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) dom:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) (f:fun('K,'A) i:'K)) neut:'A))) (P:fun('A,bool) x:'A))))) (P:fun('A,bool) ((op:fun('A,fun('A,'A)) (f:fun('K,'A) i:'K)) x:'A))))))))) (P:fun('A,bool) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))))))))))))))))))
      #|ITERATO_CLOSED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) neut:'A)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A))) (P:fun('A,bool) ((op:fun('A,fun('A,'A)) x:'A) y:'A)))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) dom:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) (f:fun('K,'A) i:'K)) neut:'A))))) (P:fun('A,bool) (f:fun('K,'A) i:'K)))))))) (P:fun('A,bool) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool))) k:fun('K,bool)) f:fun('K,'A))))))))))))))))))
      #|ITERATO_ITERATE =  |- (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun('K,fun('K,bool)),bool),bool) (\<<=:fun('K,fun('K,bool)). ((#==>:fun(bool,fun(bool,bool)) (#monoidal:fun(fun('A,fun('A,'A)),bool) op:fun('A,fun('A,'A)))) ((#=:fun(fun(fun('K,bool),fun(fun('K,'A),'A)),fun(fun(fun('K,bool),fun(fun('K,'A),'A)),bool)) ((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun('K,fun('K,bool)),fun(fun('K,bool),fun(fun('K,'A),'A)))))) #UNIV:fun('A,bool)) (#neutral:fun(fun('A,fun('A,'A)),'A) op:fun('A,fun('A,'A)))) op:fun('A,fun('A,'A))) <<=:fun('K,fun('K,bool)))) (#iterate:fun(fun('A,fun('A,'A)),fun(fun('K,bool),fun(fun('K,'A),'A))) op:fun('A,fun('A,'A)))))))))
      #|ITERATO_CLAUSES_NUMSEG_LEFT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\neut:'A. (#forall:fun(fun(fun('A,fun('A,'A)),bool),bool) (\op:fun('A,fun('A,'A)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun(num,fun(num,bool)),fun(fun(num,bool),fun(fun(num,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) #<=:fun(num,fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,'A))) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun(num,'A) m:num)) dom:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) m:num)) neut:'A))) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun(num,fun(num,bool)),fun(fun(num,bool),fun(fun(num,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) #<=:fun(num,fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) f:fun(num,'A))) ((op:fun('A,fun('A,'A)) (f:fun(num,'A) m:num)) ((((((#iterato:fun(fun('A,bool),fun('A,fun(fun('A,fun('A,'A)),fun(fun(num,fun(num,bool)),fun(fun(num,bool),fun(fun(num,'A),'A)))))) dom:fun('A,bool)) neut:'A) op:fun('A,fun('A,'A))) #<=:fun(num,fun(num,bool))) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) f:fun(num,'A))))) neut:'A))))))))))))))
      #|nproduct =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,num),num)),fun(fun(fun('A,bool),fun(fun('A,num),num)),bool)) #nproduct:fun(fun('A,bool),fun(fun('A,num),num))) (#iterate:fun(fun(num,fun(num,num)),fun(fun('A,bool),fun(fun('A,num),num))) #*:fun(num,fun(num,num))))
      #|NEUTRAL_MUL =  |- ((#=:fun(num,fun(num,bool)) (#neutral:fun(fun(num,fun(num,num)),num) #*:fun(num,fun(num,num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))
      #|MONOIDAL_MUL =  |- (#monoidal:fun(fun(num,fun(num,num)),bool) #*:fun(num,fun(num,num)))
      #|NPRODUCT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#=:fun(num,fun(num,bool)) ((#nproduct:fun(fun('A,bool),fun(fun('A,num),num)) #EMPTY:fun('A,bool)) f:fun('A,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,num),bool),bool) (\f:fun('B,num). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(num,fun(num,bool)) ((#nproduct:fun(fun('B,bool),fun(fun('B,num),num)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#nproduct:fun(fun('B,bool),fun(fun('B,num),num)) s:fun('B,bool)) f:fun('B,num))) ((#*:fun(num,fun(num,num)) (f:fun('B,num) x:'B)) ((#nproduct:fun(fun('B,bool),fun(fun('B,num),num)) s:fun('B,bool)) f:fun('B,num)))))))))))))
      #|iproduct =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,int),int)),fun(fun(fun('A,bool),fun(fun('A,int),int)),bool)) #iproduct:fun(fun('A,bool),fun(fun('A,int),int))) (#iterate:fun(fun(int,fun(int,int)),fun(fun('A,bool),fun(fun('A,int),int))) #int_mul:fun(int,fun(int,int))))
      #|NEUTRAL_INT_MUL =  |- ((#=:fun(int,fun(int,bool)) (#neutral:fun(fun(int,fun(int,int)),int) #int_mul:fun(int,fun(int,int)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|MONOIDAL_INT_MUL =  |- (#monoidal:fun(fun(int,fun(int,int)),bool) #int_mul:fun(int,fun(int,int)))
      #|IPRODUCT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,int),bool),bool) (\f:fun('A,int). ((#=:fun(int,fun(int,bool)) ((#iproduct:fun(fun('A,bool),fun(fun('A,int),int)) #EMPTY:fun('A,bool)) f:fun('A,int))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,int),bool),bool) (\f:fun('B,int). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(int,fun(int,bool)) ((#iproduct:fun(fun('B,bool),fun(fun('B,int),int)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,int))) (((#COND:fun(bool,fun(int,fun(int,int))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#iproduct:fun(fun('B,bool),fun(fun('B,int),int)) s:fun('B,bool)) f:fun('B,int))) ((#int_mul:fun(int,fun(int,int)) (f:fun('B,int) x:'B)) ((#iproduct:fun(fun('B,bool),fun(fun('B,int),int)) s:fun('B,bool)) f:fun('B,int)))))))))))))
      #|product =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,real),real)),fun(fun(fun('A,bool),fun(fun('A,real),real)),bool)) #product:fun(fun('A,bool),fun(fun('A,real),real))) (#iterate:fun(fun(real,fun(real,real)),fun(fun('A,bool),fun(fun('A,real),real))) #real_mul:fun(real,fun(real,real))))
      #|NEUTRAL_REAL_MUL =  |- ((#=:fun(real,fun(real,bool)) (#neutral:fun(fun(real,fun(real,real)),real) #real_mul:fun(real,fun(real,real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|MONOIDAL_REAL_MUL =  |- (#monoidal:fun(fun(real,fun(real,real)),bool) #real_mul:fun(real,fun(real,real)))
      #|PRODUCT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#=:fun(real,fun(real,bool)) ((#product:fun(fun('A,bool),fun(fun('A,real),real)) #EMPTY:fun('A,bool)) f:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,real),bool),bool) (\f:fun('B,real). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(real,fun(real,bool)) ((#product:fun(fun('B,bool),fun(fun('B,real),real)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#product:fun(fun('B,bool),fun(fun('B,real),real)) s:fun('B,bool)) f:fun('B,real))) ((#real_mul:fun(real,fun(real,real)) (f:fun('B,real) x:'B)) ((#product:fun(fun('B,bool),fun(fun('B,real),real)) s:fun('B,bool)) f:fun('B,real)))))))))))))
      #|isum =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,int),int)),fun(fun(fun('A,bool),fun(fun('A,int),int)),bool)) #isum:fun(fun('A,bool),fun(fun('A,int),int))) (#iterate:fun(fun(int,fun(int,int)),fun(fun('A,bool),fun(fun('A,int),int))) #int_add:fun(int,fun(int,int))))
      #|NEUTRAL_INT_ADD =  |- ((#=:fun(int,fun(int,bool)) (#neutral:fun(fun(int,fun(int,int)),int) #int_add:fun(int,fun(int,int)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num)))
      #|MONOIDAL_INT_ADD =  |- (#monoidal:fun(fun(int,fun(int,int)),bool) #int_add:fun(int,fun(int,int)))
      #|ISUM_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,int),bool),bool) (\f:fun('A,int). ((#=:fun(int,fun(int,bool)) ((#isum:fun(fun('A,bool),fun(fun('A,int),int)) #EMPTY:fun('A,bool)) f:fun('A,int))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,int),bool),bool) (\f:fun('B,int). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(int,fun(int,bool)) ((#isum:fun(fun('B,bool),fun(fun('B,int),int)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,int))) (((#COND:fun(bool,fun(int,fun(int,int))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#isum:fun(fun('B,bool),fun(fun('B,int),int)) s:fun('B,bool)) f:fun('B,int))) ((#int_add:fun(int,fun(int,int)) (f:fun('B,int) x:'B)) ((#isum:fun(fun('B,bool),fun(fun('B,int),int)) s:fun('B,bool)) f:fun('B,int)))))))))))))
      #|nsum =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,num),num)),fun(fun(fun('A,bool),fun(fun('A,num),num)),bool)) #nsum:fun(fun('A,bool),fun(fun('A,num),num))) (#iterate:fun(fun(num,fun(num,num)),fun(fun('A,bool),fun(fun('A,num),num))) #+:fun(num,fun(num,num))))
      #|NEUTRAL_ADD =  |- ((#=:fun(num,fun(num,bool)) (#neutral:fun(fun(num,fun(num,num)),num) #+:fun(num,fun(num,num)))) (#NUMERAL:fun(num,num) #_0:num))
      #|MONOIDAL_ADD =  |- (#monoidal:fun(fun(num,fun(num,num)),bool) #+:fun(num,fun(num,num)))
      #|NSUM_DEGENERATE =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%30:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%30:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))) x:'A)))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|NSUM_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) #EMPTY:fun('A,bool)) f:fun('A,num))) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,num),bool),bool) (\f:fun('B,num). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) s:fun('B,bool)) f:fun('B,num))) ((#+:fun(num,fun(num,num)) (f:fun('B,num) x:'B)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) s:fun('B,bool)) f:fun('B,num)))))))))))))
      #|NSUM_UNION =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num)))))))))))
      #|NSUM_DIFF =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,num))) ((#-:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num)))))))))))
      #|NSUM_INCL_EXCL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num)))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,num)))))))))))
      #|NSUM_SUPPORT =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (((#support:fun(fun(num,fun(num,num)),fun(fun('A,num),fun(fun('A,bool),fun('A,bool)))) #+:fun(num,fun(num,num))) f:fun('A,num)) s:fun('A,bool))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num)))))))
      #|NSUM_ADD =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. ((#+:fun(num,fun(num,num)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num)))))))))))
      #|NSUM_ADD_GEN =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%31:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%31:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))) x:'A))))))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%32:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%32:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (g:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))) x:'A)))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. ((#+:fun(num,fun(num,num)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num)))))))))))
      #|NSUM_EQ_0 =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|NSUM_0 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\n:'A. (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num))))
      #|NSUM_LMUL =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. ((#*:fun(num,fun(num,num)) c:num) (f:fun('A,num) x:'A))))) ((#*:fun(num,fun(num,num)) c:num) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_RMUL =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. ((#*:fun(num,fun(num,num)) (f:fun('A,num) x:'A)) c:num)))) ((#*:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) c:num))))))))
      #|NSUM_LE =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_LT =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))))) ((#<:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_LT_ALL =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))))) ((#<:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_EQ =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_CONST =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\n:'A. c:num))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) c:num)))))))
      #|NSUM_POS_BOUND =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) b:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) b:num)))))))))))
      #|NSUM_EQ_0_IFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|NSUM_POS_LT =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (f:fun('A,num) x:'A))))))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))
      #|NSUM_POS_LT_ALL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (f:fun('A,num) i:'A)))))))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))
      #|NSUM_DELETE =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (f:fun('A,num) a:'A)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A)) f:fun('A,num)))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_SING =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))) f:fun('A,num))) (f:fun('A,num) x:'A))))))
      #|NSUM_DELTA =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) b:num) (#NUMERAL:fun(num,num) #_0:num))))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) b:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|NSUM_SWAP =  |- (#forall:fun(fun(fun('A,fun('B,num)),bool),bool) (\f:fun('A,fun('B,num)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (f:fun('A,fun('B,num)) i:'A))))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (\j:'B. ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. ((f:fun('A,fun('B,num)) i:'A) j:'B)))))))))))))
      #|NSUM_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,num),bool),bool) (\g:fun('B,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) g:fun('B,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) ((#o:fun(fun('B,num),fun(fun('A,'B),fun('A,num))) g:fun('B,num)) f:fun('A,'B)))))))))))
      #|NSUM_SUPERSET =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) v:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) u:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_UNIV =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun(num,fun(num,num)),fun(fun('A,num),fun(fun('A,bool),fun('A,bool)))) #+:fun(num,fun(num,num))) f:fun('A,num)) #UNIV:fun('A,bool))) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) #UNIV:fun('A,bool)) f:fun('A,num))))))))
      #|NSUM_UNION_RZERO =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) u:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_UNION_LZERO =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) v:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_RESTRICT =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))
      #|NSUM_BOUND =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) b:num)))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) b:num)))))))))
      #|NSUM_BOUND_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) ((#DIV:fun(num,fun(num,num)) b:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) b:num))))))))
      #|NSUM_BOUND_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) b:num))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) b:num))))))) ((#<:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) b:num)))))))))
      #|NSUM_BOUND_LT_ALL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) b:num))))))) ((#<:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) b:num)))))))))
      #|NSUM_BOUND_LT_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) ((#DIV:fun(num,fun(num,num)) b:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))) ((#<:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) b:num))))))))
      #|NSUM_UNION_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num)))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) u:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_EQ_SUPERSET =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_RESTRICT_SET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%33:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%33:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(num,fun(num,num))) (P:fun('A,bool) x:'A)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|NSUM_NSUM_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,num)),bool),bool) (\f:fun('A,fun('B,num)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%34:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%34:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) y:'B)))))) (\y:'B. ((f:fun('A,fun('B,num)) x:'A) y:'B)))))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (\y:'B. ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%35:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%35:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) x:'A)))))) (\x:'A. ((f:fun('A,fun('B,num)) x:'A) y:'B)))))))))))))))
      #|CARD_EQ_NSUM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|NSUM_MULTICOUNT_GEN =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,num),bool),bool) (\k:fun('B,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\j:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%36:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%36:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) i:'A))))))) (k:fun('B,num) j:'B)))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. (#CARD:fun(fun('B,bool),num) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%37:'B. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%37:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) j:'B))))))))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (\i:'B. (k:fun('B,num) i:'B)))))))))))))
      #|NSUM_MULTICOUNT =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\j:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%38:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%38:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) i:'A))))))) k:num))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. (#CARD:fun(fun('B,bool),num) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%39:'B. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%39:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) j:'B))))))))) ((#*:fun(num,fun(num,num)) k:num) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))))))
      #|NSUM_IMAGE_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (\y:'B. ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%40:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%40:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A)))))) g:fun('A,num))))))))))))
      #|NSUM_GROUP =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (\y:'B. ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%41:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%41:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A)))))) g:fun('A,num))))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))))
      #|NSUM_GROUP_RELATION =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?!:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) (\y:'B. ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%42:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%42:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) x:'A)))))) g:fun('A,num))))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))))
      #|NSUM_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) u:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) v:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_SUBSET_SIMPLE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool)))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) u:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) v:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_LE_GEN =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)))))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%43:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%43:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (g:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num))))) x:'A)))))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))
      #|NSUM_MUL_BOUND =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\a:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\b:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. ((#*:fun(num,fun(num,num)) (a:fun('A,num) i:'A)) (b:fun('A,num) i:'A))))) ((#*:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) a:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) b:fun('A,num)))))))))))
      #|NSUM_IMAGE_NONZERO =  |- (#forall:fun(fun(fun('B,num),bool),bool) (\d:fun('B,num). (#forall:fun(fun(fun('A,'B),bool),bool) (\i:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) (i:fun('A,'B) x:'A)) (i:fun('A,'B) y:'A)))))) ((#=:fun(num,fun(num,bool)) (d:fun('B,num) (i:fun('A,'B) x:'A))) (#NUMERAL:fun(num,num) #_0:num))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) i:fun('A,'B)) s:fun('A,bool))) d:fun('B,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) ((#o:fun(fun('B,num),fun(fun('A,'B),fun('A,num))) d:fun('B,num)) i:fun('A,'B)))))))))))
      #|NSUM_BIJECTION =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) y:'A))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) ((#o:fun(fun('A,num),fun(fun('A,'A),fun('A,num))) f:fun('A,num)) p:fun('A,'A)))))))))))
      #|NSUM_NSUM_PRODUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,num)),bool),bool) (\x:fun('A,fun('B,num)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) i:'A))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) (t:fun('A,fun('B,bool)) i:'A)) (x:fun('A,fun('B,num)) i:'A))))) ((#nsum:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),num),num)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%44:prod('A,'B). (#?:fun(fun('A,bool),bool) (\i:'A. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%44:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) (t:fun('A,fun('B,bool)) i:'A)))) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))))))))) (#GABS:fun(fun(fun(prod('A,'B),num),bool),fun(prod('A,'B),num)) (\f:fun(prod('A,'B),num). (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun('B,bool),bool) (\j:'B. ((#GEQ:fun(num,fun(num,bool)) (f:fun(prod('A,'B),num) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))) ((x:fun('A,fun('B,num)) i:'A) j:'B)))))))))))))))))
      #|NSUM_EQ_GENERAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('B,num),bool),bool) (\g:fun('B,num). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) x:'A)) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (g:fun('B,num) (h:fun('A,'B) x:'A))) (f:fun('A,num) x:'A)))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) g:fun('B,num))))))))))))))
      #|NSUM_EQ_GENERAL_INVERSES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('B,num),bool),bool) (\g:fun('B,num). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\k:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (k:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) (k:fun('B,'A) y:'B))) y:'B)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (k:fun('B,'A) (h:fun('A,'B) x:'A))) x:'A)) ((#=:fun(num,fun(num,bool)) (g:fun('B,num) (h:fun('A,'B) x:'A))) (f:fun('A,num) x:'A))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('B,bool),fun(fun('B,num),num)) t:fun('B,bool)) g:fun('B,num))))))))))))))))
      #|NSUM_INJECTION =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) (p:fun('A,'A) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) ((#o:fun(fun('A,num),fun(fun('A,'A),fun('A,num))) f:fun('A,num)) p:fun('A,'A)))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_UNION_NONZERO =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num)))))))))))
      #|NSUM_UNIONS_NONZERO =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t1:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t2:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t1:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t2:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) t1:fun('A,bool)) t2:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t1:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t2:fun('A,bool))))))) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (#NUMERAL:fun(num,num) #_0:num)))))))))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) f:fun('A,num))) ((#nsum:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),num),num)) s:fun(fun('A,bool),bool)) (\t:fun('A,bool). ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) t:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_CASES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(num,fun(num,num))) (P:fun('A,bool) x:'A)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%45:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%45:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%46:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%46:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (P:fun('A,bool) x:'A)))) x:'A)))))) g:fun('A,num)))))))))))))
      #|NSUM_CLOSED =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) x:num)) (P:fun(num,bool) y:num))) (P:fun(num,bool) ((#+:fun(num,fun(num,num)) x:num) y:num)))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (P:fun(num,bool) (f:fun('A,num) a:'A)))))))) (P:fun(num,bool) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_RELATED =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m':num. (#forall:fun(fun(num,bool),bool) (\n':num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m':num) n':num))) ((R:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) m':num)) ((#+:fun(num,fun(num,num)) n:num) n':num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))))))) ((R:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))))
      #|NSUM_CLOSED_NONEMPTY =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) x:num)) (P:fun(num,bool) y:num))) (P:fun(num,bool) ((#+:fun(num,fun(num,num)) x:num) y:num)))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (P:fun(num,bool) (f:fun('A,num) a:'A))))))))) (P:fun(num,bool) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))))))))
      #|NSUM_RELATED_NONEMPTY =  |- (#forall:fun(fun(fun(num,fun(num,bool)),bool),bool) (\R:fun(num,fun(num,bool)). (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m':num. (#forall:fun(fun(num,bool),bool) (\n':num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(num,fun(num,bool)) m:num) n:num)) ((R:fun(num,fun(num,bool)) m':num) n':num))) ((R:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) m':num)) ((#+:fun(num,fun(num,num)) n:num) n':num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun(num,fun(num,bool)) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A))))))))) ((R:fun(num,fun(num,bool)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))))))))))))
      #|NSUM_ADD_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\g:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#+:fun(num,fun(num,num)) (f:fun(num,num) i:num)) (g:fun(num,num) i:num))))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,num))))))))))))
      #|NSUM_LE_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\g:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#<=:fun(num,fun(num,bool)) (f:fun(num,num) i:num)) (g:fun(num,num) i:num)))))) ((#<=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,num))))))))))))
      #|NSUM_EQ_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\g:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#=:fun(num,fun(num,bool)) (f:fun(num,num) i:num)) (g:fun(num,num) i:num)))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,num))))))))))))
      #|NSUM_CONST_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\n:num. c:num))) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) c:num))))))))
      #|NSUM_EQ_0_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#=:fun(num,fun(num,bool)) (f:fun(num,num) i:num)) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|NSUM_EQ_0_IFF_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#=:fun(num,fun(num,bool)) (f:fun(num,num) i:num)) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|NSUM_TRIV_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|NSUM_SING_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) n:num)) f:fun(num,num))) (f:fun(num,num) n:num))))))
      #|NSUM_CLAUSES_NUMSEG =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#SUC:fun(num,num) n:num))) f:fun(num,num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) (f:fun(num,num) (#SUC:fun(num,num) n:num)))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num)))))))))
      #|NSUM_CLAUSES_NUMSEG_LT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%47:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%47:num) ((#<:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%48:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%48:num) ((#<:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%49:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%49:num) ((#<:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,num))) (f:fun(num,num) k:num))))))
      #|NSUM_CLAUSES_NUMSEG_LE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%50:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%50:num) ((#<=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,num))) (f:fun(num,num) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%51:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%51:num) ((#<=:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%52:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%52:num) ((#<=:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,num))) (f:fun(num,num) (#SUC:fun(num,num) k:num)))))))
      #|NSUM_SWAP_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(fun(num,fun(num,num)),bool),bool) (\f:fun(num,fun(num,num)). ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) (\i:num. ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) c:num) d:num)) (f:fun(num,fun(num,num)) i:num))))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) c:num) d:num)) (\j:num. ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) (\i:num. ((f:fun(num,fun(num,num)) i:num) j:num))))))))))))))))
      #|NSUM_ADD_SPLIT =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,num)))))))))))))
      #|NSUM_OFFSET =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. (f:fun(num,num) ((#+:fun(num,fun(num,num)) i:num) p:num)))))))))))))
      #|NSUM_OFFSET_0 =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) m:num))) (\i:num. (f:fun(num,num) ((#+:fun(num,fun(num,num)) i:num) m:num))))))))))))
      #|NSUM_CLAUSES_LEFT =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#+:fun(num,fun(num,num)) (f:fun(num,num) m:num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) f:fun(num,num)))))))))))
      #|NSUM_CLAUSES_RIGHT =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num))) ((#+:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,num))) (f:fun(num,num) n:num))))))))))
      #|NSUM_PAIR =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#+:fun(num,fun(num,num)) (f:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))) (f:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|NSUM_REFLECT =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\x:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) x:fun(num,num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (#NUMERAL:fun(num,num) #_0:num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) m:num))) (\i:num. (x:fun(num,num) ((#-:fun(num,fun(num,num)) n:num) i:num))))))))))))
      #|MOD_NSUM_MOD =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) n:num)) ((#MOD:fun(num,fun(num,num)) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) (\i:'A. ((#MOD:fun(num,fun(num,num)) (f:fun('A,num) i:'A)) n:num)))) n:num)))))))))
      #|MOD_NSUM_MOD_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#MOD:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) f:fun(num,num))) n:num)) ((#MOD:fun(num,fun(num,num)) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) (\i:num. ((#MOD:fun(num,fun(num,num)) (f:fun(num,num) i:num)) n:num)))) n:num))))))))))
      #|CONG_NSUM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,num),bool),bool) (\g:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) (f:fun('A,num) x:'A)) (g:fun('A,num) x:'A)) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num))))))) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) g:fun('A,num))) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num)))))))))))
      #|CARD_UNIONS_IMAGE =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\f:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\s:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) s:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\t:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) t:'K) s:fun('K,bool))) (#FINITE:fun(fun('A,bool),bool) (f:fun('K,fun('A,bool)) t:'K)))))) (#forall:fun(fun('K,bool),bool) (\t:'K. (#forall:fun(fun('K,bool),bool) (\u:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) t:'K) s:fun('K,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) u:'K) s:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun('K,fun('K,bool)) t:'K) u:'K))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (f:fun('K,fun('A,bool)) t:'K)) (f:fun('K,fun('A,bool)) u:'K))) #EMPTY:fun('A,bool)))))))))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun('K,fun('A,bool)),fun(fun('K,bool),fun(fun('A,bool),bool))) f:fun('K,fun('A,bool))) s:fun('K,bool))))) ((#nsum:fun(fun('K,bool),fun(fun('K,num),num)) s:fun('K,bool)) (\i:'K. (#CARD:fun(fun('A,bool),num) (f:fun('K,fun('A,bool)) i:'K))))))))))
      #|CARD_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool))) #EMPTY:fun('A,bool)))))))))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) ((#nsum:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),num),num)) s:fun(fun('A,bool),bool)) #CARD:fun(fun('A,bool),num))))))
      #|sum =  |- ((#=:fun(fun(fun('A,bool),fun(fun('A,real),real)),fun(fun(fun('A,bool),fun(fun('A,real),real)),bool)) #sum:fun(fun('A,bool),fun(fun('A,real),real))) (#iterate:fun(fun(real,fun(real,real)),fun(fun('A,bool),fun(fun('A,real),real))) #real_add:fun(real,fun(real,real))))
      #|NEUTRAL_REAL_ADD =  |- ((#=:fun(real,fun(real,bool)) (#neutral:fun(fun(real,fun(real,real)),real) #real_add:fun(real,fun(real,real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|MONOIDAL_REAL_ADD =  |- (#monoidal:fun(fun(real,fun(real,real)),bool) #real_add:fun(real,fun(real,real)))
      #|SUM_DEGENERATE =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%53:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%53:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) x:'A)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUM_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) #EMPTY:fun('A,bool)) f:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(fun('B,real),bool),bool) (\f:fun('B,real). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) s:fun('B,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) x:'B) s:fun('B,bool))) f:fun('B,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) s:fun('B,bool)) f:fun('B,real))) ((#real_add:fun(real,fun(real,real)) (f:fun('B,real) x:'B)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) s:fun('B,bool)) f:fun('B,real)))))))))))))
      #|SUM_UNION =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real)))))))))))
      #|SUM_DIFF =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,real))) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real)))))))))))
      #|SUM_INCL_EXCL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real)))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,real)))))))))))
      #|SUM_SUPPORT =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (((#support:fun(fun(real,fun(real,real)),fun(fun('A,real),fun(fun('A,bool),fun('A,bool)))) #real_add:fun(real,fun(real,real))) f:fun('A,real)) s:fun('A,bool))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real)))))))
      #|SUM_ADD =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#real_add:fun(real,fun(real,real)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real)))))))))))
      #|SUM_ADD_GEN =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%54:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%54:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) x:'A))))))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%55:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%55:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) x:'A)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#real_add:fun(real,fun(real,real)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real)))))))))))
      #|SUM_EQ_0 =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUM_0 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\n:'A. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|SUM_LMUL =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun('A,real) x:'A))))) ((#real_mul:fun(real,fun(real,real)) c:real) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_RMUL =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#real_mul:fun(real,fun(real,real)) (f:fun('A,real) x:'A)) c:real)))) ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) c:real))))))))
      #|SUM_NEG =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (#real_neg:fun(real,real) (f:fun('A,real) x:'A))))) (#real_neg:fun(real,real) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))
      #|SUM_SUB =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#real_sub:fun(real,fun(real,real)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real)))))))))))
      #|SUM_LE =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_LT =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A)))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_LT_ALL =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_POS_LT =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))
      #|SUM_POS_LT_ALL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) i:'A)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))
      #|SUM_EQ =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A)))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_ABS =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (#real_abs:fun(real,real) (f:fun('A,real) x:'A))))))))))
      #|SUM_ABS_LE =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun('A,real) x:'A))) (g:fun('A,real) x:'A))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_CONST =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\n:'A. c:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) c:real)))))))
      #|SUM_POS_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))
      #|SUM_POS_BOUND =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) b:real)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) b:real)))))))))))
      #|SUM_POS_EQ_0 =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|SUM_ZERO_EXISTS =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\u:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) u:fun('A,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (u:fun('A,real) i:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#?:fun(fun('A,bool),bool) (\j:'A. (#?:fun(fun('A,bool),bool) (\k:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) j:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (u:fun('A,real) j:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) k:'A) s:fun('A,bool))) ((#real_gt:fun(real,fun(real,bool)) (u:fun('A,real) k:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))
      #|SUM_DELETE =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A)) f:fun('A,real))) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) (f:fun('A,real) a:'A))))))))))
      #|SUM_DELETE_CASES =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A)) f:fun('A,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) (f:fun('A,real) a:'A))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real)))))))))))
      #|SUM_SING =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))) f:fun('A,real))) (f:fun('A,real) x:'A))))))
      #|SUM_DELTA =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUM_SWAP =  |- (#forall:fun(fun(fun('A,fun('B,real)),bool),bool) (\f:fun('A,fun('B,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (f:fun('A,fun('B,real)) i:'A))))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (\j:'B. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((f:fun('A,fun('B,real)) i:'A) j:'B)))))))))))))
      #|SUM_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,real),bool),bool) (\g:fun('B,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) g:fun('B,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) ((#o:fun(fun('B,real),fun(fun('A,'B),fun('A,real))) g:fun('B,real)) f:fun('A,'B)))))))))))
      #|SUM_SUPERSET =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) v:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) u:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_UNIV =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#support:fun(fun(real,fun(real,real)),fun(fun('A,real),fun(fun('A,bool),fun('A,bool)))) #real_add:fun(real,fun(real,real))) f:fun('A,real)) #UNIV:fun('A,bool))) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) #UNIV:fun('A,bool)) f:fun('A,real))))))))
      #|SUM_UNION_RZERO =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) u:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_UNION_LZERO =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) v:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) v:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_RESTRICT =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(real,fun(real,real))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))
      #|SUM_BOUND =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) b:real)))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) b:real)))))))))
      #|SUM_BOUND_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) ((#real_div:fun(real,fun(real,real)) b:real) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) b:real))))))))
      #|SUM_ABS_BOUND =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun('A,real) x:'A))) b:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) b:real)))))))))
      #|SUM_BOUND_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) b:real))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) b:real))))))) ((#real_lt:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) b:real)))))))))
      #|SUM_BOUND_LT_ALL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) b:real))))))) ((#real_lt:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) b:real)))))))))
      #|SUM_BOUND_LT_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) ((#real_div:fun(real,fun(real,real)) b:real) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))))) ((#real_lt:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) b:real))))))))
      #|SUM_UNION_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) u:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_EQ_SUPERSET =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) g:fun('A,real))))))))))
      #|SUM_RESTRICT_SET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%56:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%56:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(real,fun(real,real))) (P:fun('A,bool) x:'A)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|SUM_SUM_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,real)),bool),bool) (\f:fun('A,fun('B,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%57:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%57:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) y:'B)))))) (\y:'B. ((f:fun('A,fun('B,real)) x:'A) y:'B)))))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (\y:'B. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%58:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%58:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) x:'A)))))) (\x:'A. ((f:fun('A,fun('B,real)) x:'A) y:'B)))))))))))))))
      #|CARD_EQ_SUM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|SUM_MULTICOUNT_GEN =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,num),bool),bool) (\k:fun('B,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\j:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%59:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%59:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) i:'A))))))) (k:fun('B,num) j:'B)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. (#real_of_num:fun(num,real) (#CARD:fun(fun('B,bool),num) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%60:'B. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%60:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) j:'B)))))))))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (\i:'B. (#real_of_num:fun(num,real) (k:fun('B,num) i:'B))))))))))))))
      #|SUM_MULTICOUNT =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\j:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%61:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%61:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) i:'A))))))) k:num))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. (#real_of_num:fun(num,real) (#CARD:fun(fun('B,bool),num) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%62:'B. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%62:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) i:'A) j:'B))) j:'B)))))))))) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) k:num) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))))))))))))))
      #|SUM_IMAGE_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (\y:'B. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%63:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%63:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A)))))) g:fun('A,real))))))))))))
      #|SUM_GROUP =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (\y:'B. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%64:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%64:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A)))))) g:fun('A,real))))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))))
      #|SUM_GROUP_RELATION =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?!:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) (\y:'B. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%65:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%65:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))) x:'A)))))) g:fun('A,real))))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))))
      #|REAL_OF_NUM_SUM =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (#real_of_num:fun(num,real) (f:fun('A,num) x:'A))))))))))
      #|SUM_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) v:fun('A,bool)))) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) v:fun('A,bool)) u:fun('A,bool)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A))))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) u:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) v:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_SUBSET_SIMPLE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) v:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) v:fun('A,bool)) u:fun('A,bool)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun('A,real) x:'A)))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) u:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) v:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_MUL_BOUND =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\a:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\b:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (a:fun('A,real) i:'A))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (b:fun('A,real) i:'A)))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((#real_mul:fun(real,fun(real,real)) (a:fun('A,real) i:'A)) (b:fun('A,real) i:'A))))) ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) a:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) b:fun('A,real)))))))))))
      #|SUM_IMAGE_NONZERO =  |- (#forall:fun(fun(fun('B,real),bool),bool) (\d:fun('B,real). (#forall:fun(fun(fun('A,'B),bool),bool) (\i:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) (i:fun('A,'B) x:'A)) (i:fun('A,'B) y:'A)))))) ((#=:fun(real,fun(real,bool)) (d:fun('B,real) (i:fun('A,'B) x:'A))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) i:fun('A,'B)) s:fun('A,bool))) d:fun('B,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) ((#o:fun(fun('B,real),fun(fun('A,'B),fun('A,real))) d:fun('B,real)) i:fun('A,'B)))))))))))
      #|SUM_BIJECTION =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) y:'A))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) ((#o:fun(fun('A,real),fun(fun('A,'A),fun('A,real))) f:fun('A,real)) p:fun('A,'A)))))))))))
      #|SUM_SUM_PRODUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,real)),bool),bool) (\x:fun('A,fun('B,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) i:'A))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\i:'A. ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) (t:fun('A,fun('B,bool)) i:'A)) (x:fun('A,fun('B,real)) i:'A))))) ((#sum:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),real),real)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%66:prod('A,'B). (#?:fun(fun('A,bool),bool) (\i:'A. (#?:fun(fun('B,bool),bool) (\j:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%66:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) j:'B) (t:fun('A,fun('B,bool)) i:'A)))) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))))))))) (#GABS:fun(fun(fun(prod('A,'B),real),bool),fun(prod('A,'B),real)) (\f:fun(prod('A,'B),real). (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun('B,bool),bool) (\j:'B. ((#GEQ:fun(real,fun(real,bool)) (f:fun(prod('A,'B),real) ((#,:fun('A,fun('B,prod('A,'B))) i:'A) j:'B))) ((x:fun('A,fun('B,real)) i:'A) j:'B)))))))))))))))))
      #|SUM_EQ_GENERAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('B,real),bool),bool) (\g:fun('B,real). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) x:'A)) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun(real,fun(real,bool)) (g:fun('B,real) (h:fun('A,'B) x:'A))) (f:fun('A,real) x:'A)))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) g:fun('B,real))))))))))))))
      #|SUM_EQ_GENERAL_INVERSES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('B,real),bool),bool) (\g:fun('B,real). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\k:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (k:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (h:fun('A,'B) (k:fun('B,'A) y:'B))) y:'B)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (h:fun('A,'B) x:'A)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (k:fun('B,'A) (h:fun('A,'B) x:'A))) x:'A)) ((#=:fun(real,fun(real,bool)) (g:fun('B,real) (h:fun('A,'B) x:'A))) (f:fun('A,real) x:'A))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) g:fun('B,real))))))))))))))))
      #|SUM_INJECTION =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (p:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (p:fun('A,'A) x:'A)) (p:fun('A,'A) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) ((#o:fun(fun('A,real),fun(fun('A,'A),fun('A,real))) f:fun('A,real)) p:fun('A,'A)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_UNION_NONZERO =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) f:fun('A,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real)))))))))))
      #|SUM_UNIONS_NONZERO =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t1:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t2:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t1:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t2:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) t1:fun('A,bool)) t2:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t1:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t2:fun('A,bool))))))) ((#=:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) f:fun('A,real))) ((#sum:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),real),real)) s:fun(fun('A,bool),bool)) (\t:fun('A,bool). ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) t:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_CASES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(real,fun(real,real))) (P:fun('A,bool) x:'A)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%67:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%67:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%68:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%68:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (P:fun('A,bool) x:'A)))) x:'A)))))) g:fun('A,real)))))))))))))
      #|SUM_CASES_1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) y:real) (f:fun('A,real) x:'A))))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#real_sub:fun(real,fun(real,real)) y:real) (f:fun('A,real) a:'A)))))))))
      #|SUM_LE_INCLUDED =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('B,real),bool),bool) (\g:fun('B,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,'A),bool),bool) (\i:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (g:fun('B,real) y:'B)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (i:fun('B,'A) y:'B)) x:'A)) ((#real_le:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('B,real) y:'B))))))))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) t:fun('B,bool)) g:fun('B,real))))))))))))))
      #|SUM_IMAGE_LE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,real),bool),bool) (\g:fun('B,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (g:fun('B,real) (f:fun('A,'B) x:'A)))))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun('B,bool),fun(fun('B,real),real)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) g:fun('B,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) ((#o:fun(fun('B,real),fun(fun('A,'B),fun('A,real))) g:fun('B,real)) f:fun('A,'B)))))))))))
      #|SUM_CLOSED =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) (P:fun(real,bool) y:real))) (P:fun(real,bool) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (P:fun(real,bool) (f:fun('A,real) a:'A)))))))) (P:fun(real,bool) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_RELATED =  |- (#forall:fun(fun(fun(real,fun(real,bool)),bool),bool) (\R:fun(real,fun(real,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\n:real. (#forall:fun(fun(real,bool),bool) (\m':real. (#forall:fun(fun(real,bool),bool) (\n':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(real,fun(real,bool)) m:real) n:real)) ((R:fun(real,fun(real,bool)) m':real) n':real))) ((R:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) m:real) m':real)) ((#real_add:fun(real,fun(real,real)) n:real) n':real)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))))))) ((R:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))))
      #|SUM_CLOSED_NONEMPTY =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) (P:fun(real,bool) y:real))) (P:fun(real,bool) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (P:fun(real,bool) (f:fun('A,real) a:'A))))))))) (P:fun(real,bool) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))))))))))
      #|SUM_RELATED_NONEMPTY =  |- (#forall:fun(fun(fun(real,fun(real,bool)),bool),bool) (\R:fun(real,fun(real,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\g:fun('A,real). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\n:real. (#forall:fun(fun(real,bool),bool) (\m':real. (#forall:fun(fun(real,bool),bool) (\n':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun(real,fun(real,bool)) m:real) n:real)) ((R:fun(real,fun(real,bool)) m':real) n':real))) ((R:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) m:real) m':real)) ((#real_add:fun(real,fun(real,real)) n:real) n':real)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun(real,fun(real,bool)) (f:fun('A,real) x:'A)) (g:fun('A,real) x:'A))))))))) ((R:fun(real,fun(real,bool)) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) f:fun('A,real))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) g:fun('A,real))))))))))))
      #|REAL_OF_NUM_SUM_GEN =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%69:'A. (#?:fun(fun('A,bool),bool) (\i:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%69:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('A,num) i:'A)) (#NUMERAL:fun(num,num) #_0:num))))) i:'A))))))) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num)))) ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (\x:'A. (#real_of_num:fun(num,real) (f:fun('A,num) x:'A))))))))))
      #|SUM_ADD_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_SUB_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_LE_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num)))))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_EQ_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num)))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_ABS_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. (#real_abs:fun(real,real) (f:fun(num,real) i:num)))))))))))
      #|SUM_CONST_NUMSEG =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\n:num. c:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))) c:real))))))))
      #|SUM_EQ_0_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) n:num))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|SUM_TRIV_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|SUM_POS_LE_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) n:num))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) p:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))))))))))
      #|SUM_POS_EQ_0_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) n:num))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) p:num)))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) n:num))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) p:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))
      #|SUM_SING_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) n:num)) f:fun(num,real))) (f:fun(num,real) n:num))))))
      #|SUM_CLAUSES_NUMSEG =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) (#SUC:fun(num,num) n:num))) f:fun(num,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (f:fun(num,real) (#SUC:fun(num,num) n:num)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real)))))))))
      #|SUM_CLAUSES_NUMSEG_LT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%70:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%70:num) ((#<:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%71:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%71:num) ((#<:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%72:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%72:num) ((#<:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,real))) (f:fun(num,real) k:num))))))
      #|SUM_CLAUSES_NUMSEG_LE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%73:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%73:num) ((#<=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) f:fun(num,real))) (f:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%74:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%74:num) ((#<=:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%75:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%75:num) ((#<=:fun(num,fun(num,bool)) i:num) k:num)) i:num)))))) f:fun(num,real))) (f:fun(num,real) (#SUC:fun(num,num) k:num)))))))
      #|SUM_SWAP_NUMSEG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) (\i:num. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) c:num) d:num)) (f:fun(num,fun(num,real)) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) c:num) d:num)) (\j:num. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) a:num) b:num)) (\i:num. ((f:fun(num,fun(num,real)) i:num) j:num))))))))))))))))
      #|SUM_ADD_SPLIT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real)))))))))))))
      #|SUM_OFFSET =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) p:num)))))))))))))
      #|SUM_OFFSET_0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) m:num))) (\i:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) m:num))))))))))))
      #|SUM_CLAUSES_LEFT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) m:num)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) f:fun(num,real)))))))))))
      #|SUM_CLAUSES_RIGHT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) (f:fun(num,real) n:num))))))))))
      #|SUM_PAIR =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|SUM_REFLECT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) x:fun(num,real))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) m:num))) (\i:num. (x:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) i:num))))))))))))
      #|REAL_OF_NUM_SUM_NUMSEG =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,num)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\i:num. (#real_of_num:fun(num,real) (f:fun(num,num) i:num)))))))))))
      #|SUM_PARTIAL_SUC =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) k:num)) ((#real_sub:fun(real,fun(real,real)) (g:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (g:fun(num,real) k:num)))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (g:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) m:num)) (g:fun(num,real) m:num)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (g:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|SUM_PARTIAL_PRE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) k:num)) ((#real_sub:fun(real,fun(real,real)) (g:fun(num,real) k:num)) (g:fun(num,real) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (g:fun(num,real) n:num))) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) m:num)) (g:fun(num,real) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (g:fun(num,real) k:num)) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|SUM_DIFFS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) k:num)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) m:num)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUM_DIFFS_ALT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) (\k:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) m:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUM_COMBINE_R =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#<=:fun(num,fun(num,bool)) n:num) p:num))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num)) f:fun(num,real)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) p:num)) f:fun(num,real))))))))))))
      #|SUM_COMBINE_L =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) p:num)) f:fun(num,real)))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) p:num)) f:fun(num,real))))))))))))
      #|REAL_SUB_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))))))))))))))
      #|REAL_SUB_POW_R1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))))))
      #|REAL_SUB_POW_L1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))))))
      #|REAL_SUB_POLYFUN =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) ((#+:fun(num,fun(num,num)) j:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) i:num) j:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) x:real) j:num)))))))))))))))
      #|REAL_SUB_POLYFUN_ALT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\j:num. ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) j:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\k:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) ((#+:fun(num,fun(num,num)) j:num) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) y:real) k:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) j:num)))))))))))))))
      #|REAL_POLYFUN_ROOTBOUND =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) ((#=:fun(real,fun(real,bool)) (c:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%76:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%76:real) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real))))))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun(real,bool),num) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%77:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%77:real) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real))))))) n:num)))))))
      #|REAL_POLYFUN_FINITE_ROOTS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%78:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%78:real) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real))))))) (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (c:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|REAL_POLYFUN_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) ((#=:fun(real,fun(real,bool)) (c:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|REAL_POLYFUN_EQ_CONST =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) k:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (c:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) k:real)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))) ((#=:fun(real,fun(real,bool)) (c:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))
      #|polynomial_function =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#?:fun(fun(num,bool),bool) (\m:num. (#?:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (p:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))))))))))
      #|POLYNOMIAL_FUNCTION_CONST =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#polynomial_function:fun(fun(real,real),bool) (\x:real. c:real))))
      #|POLYNOMIAL_FUNCTION_ID =  |- (#polynomial_function:fun(fun(real,real),bool) (\x:real. x:real))
      #|POLYNOMIAL_FUNCTION_I =  |- (#polynomial_function:fun(fun(real,real),bool) #I:fun(real,real))
      #|POLYNOMIAL_FUNCTION_ADD =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) q:fun(real,real)))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_add:fun(real,fun(real,real)) (p:fun(real,real) x:real)) (q:fun(real,real) x:real)))))))))
      #|POLYNOMIAL_FUNCTION_LMUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (p:fun(real,real) x:real)))))))))
      #|POLYNOMIAL_FUNCTION_RMUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_mul:fun(real,fun(real,real)) (p:fun(real,real) x:real)) c:real))))))))
      #|POLYNOMIAL_FUNCTION_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) (\x:real. (#real_neg:fun(real,real) (p:fun(real,real) x:real))))) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real)))))
      #|POLYNOMIAL_FUNCTION_SUB =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) q:fun(real,real)))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_sub:fun(real,fun(real,real)) (p:fun(real,real) x:real)) (q:fun(real,real) x:real)))))))))
      #|POLYNOMIAL_FUNCTION_MUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) q:fun(real,real)))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_mul:fun(real,fun(real,real)) (p:fun(real,real) x:real)) (q:fun(real,real) x:real)))))))))
      #|POLYNOMIAL_FUNCTION_SUM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(real,fun('A,real)),bool),bool) (\p:fun(real,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((p:fun(real,fun('A,real)) x:real) i:'A)))))))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#sum:fun(fun('A,bool),fun(fun('A,real),real)) s:fun('A,bool)) (p:fun(real,fun('A,real)) x:real)))))))))
      #|POLYNOMIAL_FUNCTION_POW =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) (\x:real. ((#real_pow:fun(real,fun(num,real)) (p:fun(real,real) x:real)) n:num))))))))
      #|POLYNOMIAL_FUNCTION_INDUCT =  |- (#forall:fun(fun(fun(fun(real,real),bool),bool),bool) (\P:fun(fun(real,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(real,real),bool) (\x:real. x:real))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\c:real. (P:fun(fun(real,real),bool) (\x:real. c:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(real,real),bool) p:fun(real,real))) (P:fun(fun(real,real),bool) q:fun(real,real)))) (P:fun(fun(real,real),bool) (\x:real. ((#real_add:fun(real,fun(real,real)) (p:fun(real,real) x:real)) (q:fun(real,real) x:real)))))))))) (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(real,real),bool) p:fun(real,real))) (P:fun(fun(real,real),bool) q:fun(real,real)))) (P:fun(fun(real,real),bool) (\x:real. ((#real_mul:fun(real,fun(real,real)) (p:fun(real,real) x:real)) (q:fun(real,real) x:real))))))))))))) (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (P:fun(fun(real,real),bool) p:fun(real,real))))))))
      #|POLYNOMIAL_FUNCTION_o =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) (#polynomial_function:fun(fun(real,real),bool) q:fun(real,real)))) (#polynomial_function:fun(fun(real,real),bool) ((#o:fun(fun(real,real),fun(fun(real,real),fun(real,real))) p:fun(real,real)) q:fun(real,real))))))))
      #|POLYNOMIAL_FUNCTION_FINITE_ROOTS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) (#polynomial_function:fun(fun(real,real),bool) p:fun(real,real))) ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%79:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%79:real) ((#=:fun(real,fun(real,bool)) (p:fun(real,real) x:real)) a:real)) x:real))))))) (#~:fun(bool,bool) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (p:fun(real,real) x:real)) a:real))))))))))
      #|types = int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 247
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _94348:bool
      #|
    ),
  )
}
