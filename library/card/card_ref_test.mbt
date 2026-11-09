// Load-fidelity test for Library/card.ml: replays tools/ocaml_ref/Library_card_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/card matches Library/card.ml" {
  @card.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/wo", "Library/card",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/card")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("sum_DISTINCT", () => sthm(@card.sum_distinct()))
  log.attempt("sum_INJECTIVE", () => sthm(@card.sum_injective()))
  log.attempt("sum_CASES", () => sthm(@card.sum_cases()))
  log.attempt("FORALL_SUM_THM", () => sthm(@card.forall_sum_thm()))
  log.attempt("EXISTS_SUM_THM", () => sthm(@card.exists_sum_thm()))
  log.attempt("FLATTEN_LEMMA", () => sthm(@card.flatten_lemma()))
  log.attempt("TARSKI_SET", () => sthm(@card.tarski_set()))
  log.attempt("INJECTIVE_LEFT_INVERSE_NONEMPTY", () => {
    sthm(@card.injective_left_inverse_nonempty())
  })
  log.attempt("BIJECTIVE_INJECTIVE_SURJECTIVE", () => {
    sthm(@card.bijective_injective_surjective())
  })
  log.attempt("BIJECTIVE_INVERSES", () => sthm(@card.bijective_inverses()))
  log.attempt("EQ_C_BIJECTIONS", () => sthm(@card.eq_c_bijections()))
  log.attempt("EQ_C", () => sthm(@card.eq_c()))
  log.attempt("EQ_C_ALT", () => sthm(@card.eq_c_alt()))
  log.attempt("CARD_LE_REFL", () => sthm(@card.card_le_refl()))
  log.attempt("CARD_EMPTY_LE", () => sthm(@card.card_empty_le()))
  log.attempt("CARD_LE_TRANS", () => sthm(@card.card_le_trans()))
  log.attempt("CARD_LT_REFL", () => sthm(@card.card_lt_refl()))
  log.attempt("CARD_LET_TRANS", () => sthm(@card.card_let_trans()))
  log.attempt("CARD_LTE_TRANS", () => sthm(@card.card_lte_trans()))
  log.attempt("CARD_LT_TRANS", () => sthm(@card.card_lt_trans()))
  log.attempt("CARD_EQ_REFL", () => sthm(@card.card_eq_refl()))
  log.attempt("CARD_EQ_REFL_IMP", () => sthm(@card.card_eq_refl_imp()))
  log.attempt("CARD_EQ_SYM", () => sthm(@card.card_eq_sym()))
  log.attempt("CARD_EQ_IMP_LE", () => sthm(@card.card_eq_imp_le()))
  log.attempt("CARD_LT_IMP_LE", () => sthm(@card.card_lt_imp_le()))
  log.attempt("CARD_LE_RELATIONAL", () => sthm(@card.card_le_relational()))
  log.attempt("CARD_LE_RELATIONAL_FULL", () => {
    sthm(@card.card_le_relational_full())
  })
  log.attempt("CARD_LE_EMPTY", () => sthm(@card.card_le_empty()))
  log.attempt("CARD_EQ_EMPTY", () => sthm(@card.card_eq_empty()))
  log.attempt("CARD_LE_ANTISYM", () => sthm(@card.card_le_antisym()))
  log.attempt("CARD_LE_TOTAL", () => sthm(@card.card_le_total()))
  log.attempt("CARD_LET_TOTAL", () => sthm(@card.card_let_total()))
  log.attempt("CARD_LTE_TOTAL", () => sthm(@card.card_lte_total()))
  log.attempt("CARD_LT_TOTAL", () => sthm(@card.card_lt_total()))
  log.attempt("CARD_NOT_LE", () => sthm(@card.card_not_le()))
  log.attempt("CARD_NOT_LT", () => sthm(@card.card_not_lt()))
  log.attempt("CARD_LT_LE", () => sthm(@card.card_lt_le()))
  log.attempt("CARD_LE_LT", () => sthm(@card.card_le_lt()))
  log.attempt("CARD_LE_CONG", () => sthm(@card.card_le_cong()))
  log.attempt("CARD_LT_CONG", () => sthm(@card.card_lt_cong()))
  log.attempt("CARD_EQ_TRANS", () => sthm(@card.card_eq_trans()))
  log.attempt("CARD_EQ_CONG", () => sthm(@card.card_eq_cong()))
  log.attempt("INFINITE_CARD_LE", () => sthm(@card.infinite_card_le()))
  log.attempt("FINITE_CARD_LT", () => sthm(@card.finite_card_lt()))
  log.attempt("CARD_LE_SUBSET", () => sthm(@card.card_le_subset()))
  log.attempt("CARD_LE_UNIV", () => sthm(@card.card_le_univ()))
  log.attempt("CARD_LE_EQ_SUBSET", () => sthm(@card.card_le_eq_subset()))
  log.attempt("CARD_LE_EQ_SUBSET_UNIV", () => {
    sthm(@card.card_le_eq_subset_univ())
  })
  log.attempt("CARD_INFINITE_CONG", () => sthm(@card.card_infinite_cong()))
  log.attempt("CARD_FINITE_CONG", () => sthm(@card.card_finite_cong()))
  log.attempt("CARD_LE_FINITE", () => sthm(@card.card_le_finite()))
  log.attempt("CARD_EQ_FINITE", () => sthm(@card.card_eq_finite()))
  log.attempt("CARD_EQ_INFINITE", () => sthm(@card.card_eq_infinite()))
  log.attempt("CARD_LE_INFINITE", () => sthm(@card.card_le_infinite()))
  log.attempt("CARD_LT_FINITE_INFINITE", () => {
    sthm(@card.card_lt_finite_infinite())
  })
  log.attempt("CARD_LE_FINITE_INFINITE", () => {
    sthm(@card.card_le_finite_infinite())
  })
  log.attempt("CARD_LE_CARD_IMP", () => sthm(@card.card_le_card_imp()))
  log.attempt("CARD_EQ_CARD_IMP", () => sthm(@card.card_eq_card_imp()))
  log.attempt("CARD_LE_CARD", () => sthm(@card.card_le_card()))
  log.attempt("CARD_EQ_CARD", () => sthm(@card.card_eq_card()))
  log.attempt("CARD_LT_CARD", () => sthm(@card.card_lt_card()))
  log.attempt("CARD_HAS_SIZE_CONG", () => sthm(@card.card_has_size_cong()))
  log.attempt("NUMSEG_CARD_LE", () => sthm(@card.numseg_card_le()))
  log.attempt("CARD_LE_IMAGE", () => sthm(@card.card_le_image()))
  log.attempt("CARD_LE_IMAGE_GEN", () => sthm(@card.card_le_image_gen()))
  log.attempt("CARD_EQ_IMAGE", () => sthm(@card.card_eq_image()))
  log.attempt("CARD_GE_PREIMAGE", () => sthm(@card.card_ge_preimage()))
  log.attempt("CARD_LE_PREIMAGE", () => sthm(@card.card_le_preimage()))
  log.attempt("CARD_EQ_PREIMAGE", () => sthm(@card.card_eq_preimage()))
  log.attempt("CARD_LE_IMAGES", () => sthm(@card.card_le_images()))
  log.attempt("CARD_EQ_IMAGES", () => sthm(@card.card_eq_images()))
  log.attempt("LE_C_IMAGE", () => sthm(@card.le_c_image()))
  log.attempt("LE_C_IMAGE_SUBSET", () => sthm(@card.le_c_image_subset()))
  log.attempt("CARD_LE_SING", () => sthm(@card.card_le_sing()))
  log.attempt("CARD_SING_LE", () => sthm(@card.card_sing_le()))
  log.attempt("CARD_EQ_ORDINAL_EXISTS", () => {
    sthm(@card.card_eq_ordinal_exists())
  })
  log.attempt("WF_CARD_LT", () => sthm(@card.wf_card_lt()))
  log.attempt("add_c", () => sthm(@card.add_c()))
  log.attempt("mul_c", () => sthm(@card.mul_c()))
  log.attempt("CARD_LE_ADD", () => sthm(@card.card_le_add()))
  log.attempt("CARD_LE_MUL", () => sthm(@card.card_le_mul()))
  log.attempt("CARD_FUNSPACE_LE", () => sthm(@card.card_funspace_le()))
  log.attempt("CARD_ADD_CONG", () => sthm(@card.card_add_cong()))
  log.attempt("CARD_MUL_CONG", () => sthm(@card.card_mul_cong()))
  log.attempt("CARD_FUNSPACE_CONG", () => sthm(@card.card_funspace_cong()))
  log.attempt("MUL_C_UNIV", () => sthm(@card.mul_c_univ()))
  log.attempt("CARD_FUNSPACE_CURRY", () => sthm(@card.card_funspace_curry()))
  log.attempt("IN_CARD_ADD", () => sthm(@card.in_card_add()))
  log.attempt("IN_CARD_MUL", () => sthm(@card.in_card_mul()))
  log.attempt("CARD_LE_SQUARE", () => sthm(@card.card_le_square()))
  log.attempt("CARD_SQUARE_NUM", () => sthm(@card.card_square_num()))
  log.attempt("UNION_LE_ADD_C", () => sthm(@card.union_le_add_c()))
  log.attempt("CARD_ADD_C", () => sthm(@card.card_add_c()))
  log.attempt("CARD_MUL_C", () => sthm(@card.card_mul_c()))
  log.attempt("CARD_ADD_SYM", () => sthm(@card.card_add_sym()))
  log.attempt("CARD_ADD_ASSOC", () => sthm(@card.card_add_assoc()))
  log.attempt("CARD_MUL_SYM", () => sthm(@card.card_mul_sym()))
  log.attempt("CARD_MUL_ASSOC", () => sthm(@card.card_mul_assoc()))
  log.attempt("CARD_LDISTRIB", () => sthm(@card.card_ldistrib()))
  log.attempt("CARD_RDISTRIB", () => sthm(@card.card_rdistrib()))
  log.attempt("CARD_LE_ADDR", () => sthm(@card.card_le_addr()))
  log.attempt("CARD_LE_ADDL", () => sthm(@card.card_le_addl()))
  log.attempt("CARD_MUL_LID", () => sthm(@card.card_mul_lid()))
  log.attempt("CARD_MUL_RID", () => sthm(@card.card_mul_rid()))
  log.attempt("CARD_ADD_LE_MUL_INFINITE", () => {
    sthm(@card.card_add_le_mul_infinite())
  })
  log.attempt("CARD_DISJOINT_UNION", () => sthm(@card.card_disjoint_union()))
  log.attempt("CARD_LE_EXISTS", () => sthm(@card.card_le_exists()))
  log.attempt("CARD_LT_IMP_SUC_LE", () => sthm(@card.card_lt_imp_suc_le()))
  log.attempt("CARD_SQUARE_INFINITE", () => sthm(@card.card_square_infinite()))
  log.attempt("CARD_ADD_FINITE", () => sthm(@card.card_add_finite()))
  log.attempt("CARD_ADD_FINITE_EQ", () => sthm(@card.card_add_finite_eq()))
  log.attempt("CARD_MUL_FINITE", () => sthm(@card.card_mul_finite()))
  log.attempt("CARD_MUL_FINITE_EQ", () => sthm(@card.card_mul_finite_eq()))
  log.attempt("CARD_MUL_ABSORB_LE", () => sthm(@card.card_mul_absorb_le()))
  log.attempt("CARD_MUL2_ABSORB_LE", () => sthm(@card.card_mul2_absorb_le()))
  log.attempt("CARD_MUL2_ABSORB_LE_ALT", () => {
    sthm(@card.card_mul2_absorb_le_alt())
  })
  log.attempt("CARD_ADD_ABSORB_LE", () => sthm(@card.card_add_absorb_le()))
  log.attempt("CARD_ADD2_ABSORB_LE", () => sthm(@card.card_add2_absorb_le()))
  log.attempt("CARD_MUL_ABSORB", () => sthm(@card.card_mul_absorb()))
  log.attempt("CARD_ADD_ABSORB_LEFT", () => sthm(@card.card_add_absorb_left()))
  log.attempt("CARD_ADD_ABSORB_RIGHT", () => sthm(@card.card_add_absorb_right()))
  log.attempt("CARD_UNION_ABSORB_LEFT", () => {
    sthm(@card.card_union_absorb_left())
  })
  log.attempt("CARD_UNION_ABSORB_RIGHT", () => {
    sthm(@card.card_union_absorb_right())
  })
  log.attempt("CARD_ADD2_ABSORB_LT", () => sthm(@card.card_add2_absorb_lt()))
  log.attempt("CARD_DIFF_ABSORB", () => sthm(@card.card_diff_absorb()))
  log.attempt("CARD_LT_ADD", () => sthm(@card.card_lt_add()))
  log.attempt("CARD_LE_ADD_LCANCEL", () => sthm(@card.card_le_add_lcancel()))
  log.attempt("CARD_LE_ADD_LCANCEL_EQ", () => {
    sthm(@card.card_le_add_lcancel_eq())
  })
  log.attempt("CARD_LE_ADD_RCANCEL", () => sthm(@card.card_le_add_rcancel()))
  log.attempt("CARD_LE_ADD_RCANCEL_EQ", () => {
    sthm(@card.card_le_add_rcancel_eq())
  })
  log.attempt("CARD_EQ_ADD_LCANCEL", () => sthm(@card.card_eq_add_lcancel()))
  log.attempt("CARD_EQ_ADD_LCANCEL_EQ", () => {
    sthm(@card.card_eq_add_lcancel_eq())
  })
  log.attempt("CARD_EQ_ADD_RCANCEL", () => sthm(@card.card_eq_add_rcancel()))
  log.attempt("CARD_EQ_ADD_RCANCEL_EQ", () => {
    sthm(@card.card_eq_add_rcancel_eq())
  })
  log.attempt("CARD_LE_UNIONS2", () => sthm(@card.card_le_unions2()))
  log.attempt("CARD_LE_UNIONS", () => sthm(@card.card_le_unions()))
  log.attempt("CARD_LE_DISJOINT_UNIONS", () => {
    sthm(@card.card_le_disjoint_unions())
  })
  log.attempt("CARD_EQ_DISJOINT_UNIONS", () => {
    sthm(@card.card_eq_disjoint_unions())
  })
  log.attempt("CARD_EQ_IMAGE_MUL_FIBRES", () => {
    sthm(@card.card_eq_image_mul_fibres())
  })
  log.attempt("CARD_DIFF_CONG", () => sthm(@card.card_diff_cong()))
  log.attempt("EQ_C_BIJECTIONS_DISJOINT", () => {
    sthm(@card.eq_c_bijections_disjoint())
  })
  log.attempt("EQ_C_BIJECTIONS_SUBSETS", () => {
    sthm(@card.eq_c_bijections_subsets())
  })
  log.attempt("EQ_C_BIJECTIONS_SUBSETS_LT", () => {
    sthm(@card.eq_c_bijections_subsets_lt())
  })
  log.attempt("EQ_C_BIJECTIONS_EXTEND", () => {
    sthm(@card.eq_c_bijections_extend())
  })
  log.attempt("EQ_C_INVOLUTION", () => sthm(@card.eq_c_involution()))
  log.attempt("CARD_MUL_LT_LEMMA", () => sthm(@card.card_mul_lt_lemma()))
  log.attempt("CARD_MUL_LT_INFINITE", () => sthm(@card.card_mul_lt_infinite()))
  log.attempt("CANTOR_THM", () => sthm(@card.cantor_thm()))
  log.attempt("CANTOR_THM_UNIV", () => sthm(@card.cantor_thm_univ()))
  log.attempt("NUM_COUNTABLE", () => sthm(@card.num_countable()))
  log.attempt("COUNTABLE_ALT", () => sthm(@card.countable_alt()))
  log.attempt("COUNTABLE_CASES", () => sthm(@card.countable_cases()))
  log.attempt("CARD_LE_COUNTABLE", () => sthm(@card.card_le_countable()))
  log.attempt("CARD_EQ_COUNTABLE", () => sthm(@card.card_eq_countable()))
  log.attempt("CARD_COUNTABLE_CONG", () => sthm(@card.card_countable_cong()))
  log.attempt("COUNTABLE_SUBSET", () => sthm(@card.countable_subset()))
  log.attempt("COUNTABLE_RESTRICT", () => sthm(@card.countable_restrict()))
  log.attempt("COUNTABLE_SUBSET_NUM", () => sthm(@card.countable_subset_num()))
  log.attempt("FINITE_IMP_COUNTABLE", () => sthm(@card.finite_imp_countable()))
  log.attempt("CARD_LE_COUNTABLE_INFINITE", () => {
    sthm(@card.card_le_countable_infinite())
  })
  log.attempt("CARD_LT_COUNTABLE_UNCOUNTABLE", () => {
    sthm(@card.card_lt_countable_uncountable())
  })
  log.attempt("COUNTABLE_IMAGE", () => sthm(@card.countable_image()))
  log.attempt("COUNTABLE_IMAGE_INJ_GENERAL", () => {
    sthm(@card.countable_image_inj_general())
  })
  log.attempt("COUNTABLE_IMAGE_INJ_EQ", () => {
    sthm(@card.countable_image_inj_eq())
  })
  log.attempt("COUNTABLE_IMAGE_INJ", () => sthm(@card.countable_image_inj()))
  log.attempt("COUNTABLE_EMPTY", () => sthm(@card.countable_empty()))
  log.attempt("COUNTABLE_INTER", () => sthm(@card.countable_inter()))
  log.attempt("COUNTABLE_UNION_IMP", () => sthm(@card.countable_union_imp()))
  log.attempt("COUNTABLE_UNION", () => sthm(@card.countable_union()))
  log.attempt("COUNTABLE_SING", () => sthm(@card.countable_sing()))
  log.attempt("COUNTABLE_INSERT", () => sthm(@card.countable_insert()))
  log.attempt("COUNTABLE_DELETE", () => sthm(@card.countable_delete()))
  log.attempt("COUNTABLE_DIFF_FINITE", () => sthm(@card.countable_diff_finite()))
  log.attempt("COUNTABLE_DIFF", () => sthm(@card.countable_diff()))
  log.attempt("COUNTABLE_CROSS", () => sthm(@card.countable_cross()))
  log.attempt("COUNTABLE_AS_IMAGE_SUBSET", () => {
    sthm(@card.countable_as_image_subset())
  })
  log.attempt("COUNTABLE_AS_IMAGE_SUBSET_EQ", () => {
    sthm(@card.countable_as_image_subset_eq())
  })
  log.attempt("COUNTABLE_AS_IMAGE", () => sthm(@card.countable_as_image()))
  log.attempt("FORALL_COUNTABLE_AS_IMAGE", () => {
    sthm(@card.forall_countable_as_image())
  })
  log.attempt("COUNTABLE_AS_INJECTIVE_IMAGE", () => {
    sthm(@card.countable_as_injective_image())
  })
  log.attempt("COUNTABLE_AS_IMAGE_NUM_SUBSET", () => {
    sthm(@card.countable_as_image_num_subset())
  })
  log.attempt("COUNTABLE_AS_INJECTIVE_IMAGE_SUBSET", () => {
    sthm(@card.countable_as_injective_image_subset())
  })
  log.attempt("COUNTABLE_UNIONS", () => sthm(@card.countable_unions()))
  log.attempt("COUNTABLE_PRODUCT_DEPENDENT", () => {
    sthm(@card.countable_product_dependent())
  })
  log.attempt("COUNTABLE_CARD_ADD", () => sthm(@card.countable_card_add()))
  log.attempt("COUNTABLE_CARD_ADD_EQ", () => sthm(@card.countable_card_add_eq()))
  log.attempt("COUNTABLE_CARD_MUL", () => sthm(@card.countable_card_mul()))
  log.attempt("COUNTABLE_CARD_MUL_EQ", () => sthm(@card.countable_card_mul_eq()))
  log.attempt("CARD_EQ_PCROSS", () => sthm(@card.card_eq_pcross()))
  log.attempt("COUNTABLE_PCROSS_EQ", () => sthm(@card.countable_pcross_eq()))
  log.attempt("COUNTABLE_PCROSS", () => sthm(@card.countable_pcross()))
  log.attempt("INT_COUNTABLE", () => sthm(@card.int_countable()))
  log.attempt("CARD_EQ_INT_NUM", () => sthm(@card.card_eq_int_num()))
  log.attempt("int_INFINITE", () => sthm(@card.int_infinite()))
  log.attempt("COUNTABLE_CART", () => sthm(@card.countable_cart()))
  log.attempt("EXISTS_COUNTABLE_SUBSET_IMAGE_INJ", () => {
    sthm(@card.exists_countable_subset_image_inj())
  })
  log.attempt("FORALL_COUNTABLE_SUBSET_IMAGE_INJ", () => {
    sthm(@card.forall_countable_subset_image_inj())
  })
  log.attempt("EXISTS_COUNTABLE_SUBSET_IMAGE", () => {
    sthm(@card.exists_countable_subset_image())
  })
  log.attempt("FORALL_COUNTABLE_SUBSET_IMAGE", () => {
    sthm(@card.forall_countable_subset_image())
  })
  log.attempt("COUNTABLE_SUBSET_IMAGE", () => {
    sthm(@card.countable_subset_image())
  })
  log.attempt("COUNTABLE_IMAGE_EQ", () => sthm(@card.countable_image_eq()))
  log.attempt("COUNTABLE_IMAGE_EQ_INJ", () => {
    sthm(@card.countable_image_eq_inj())
  })
  log.attempt("COUNTABLE_FLD", () => sthm(@card.countable_fld()))
  log.attempt("COUNTABLE_UNION_OF_EMPTY", () => {
    sthm(@card.countable_union_of_empty())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_EMPTY", () => {
    sthm(@card.countable_intersection_of_empty())
  })
  log.attempt("COUNTABLE_UNION_OF_INC", () => {
    sthm(@card.countable_union_of_inc())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_INC", () => {
    sthm(@card.countable_intersection_of_inc())
  })
  log.attempt("COUNTABLE_UNION_OF_COMPLEMENT", () => {
    sthm(@card.countable_union_of_complement())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_COMPLEMENT", () => {
    sthm(@card.countable_intersection_of_complement())
  })
  log.attempt("COUNTABLE_UNION_OF_EXPLICIT", () => {
    sthm(@card.countable_union_of_explicit())
  })
  log.attempt("COUNTABLE_UNION_OF_ASCENDING", () => {
    sthm(@card.countable_union_of_ascending())
  })
  log.attempt("COUNTABLE_UNION_OF_IDEMPOT", () => {
    sthm(@card.countable_union_of_idempot())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_IDEMPOT", () => {
    sthm(@card.countable_intersection_of_idempot())
  })
  log.attempt("COUNTABLE_UNION_OF_UNIONS", () => {
    sthm(@card.countable_union_of_unions())
  })
  log.attempt("COUNTABLE_UNION_OF_UNION", () => {
    sthm(@card.countable_union_of_union())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_INTERS", () => {
    sthm(@card.countable_intersection_of_inters())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_INTER", () => {
    sthm(@card.countable_intersection_of_inter())
  })
  log.attempt("COUNTABLE_UNION_OF_INTER_EQ", () => {
    sthm(@card.countable_union_of_inter_eq())
  })
  log.attempt("COUNTABLE_UNION_OF_INTER", () => {
    sthm(@card.countable_union_of_inter())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_UNION_EQ", () => {
    sthm(@card.countable_intersection_of_union_eq())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_UNION", () => {
    sthm(@card.countable_intersection_of_union())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_UNIONS_NONEMPTY", () => {
    sthm(@card.countable_intersection_of_unions_nonempty())
  })
  log.attempt("COUNTABLE_INTERSECTION_OF_UNIONS", () => {
    sthm(@card.countable_intersection_of_unions())
  })
  log.attempt("COUNTABLE_UNION_OF_INTERS_NONEMPTY", () => {
    sthm(@card.countable_union_of_inters_nonempty())
  })
  log.attempt("COUNTABLE_UNION_OF_INTERS", () => {
    sthm(@card.countable_union_of_inters())
  })
  log.attempt("COUNTABLE_DISJOINT_UNION_OF_IDEMPOT", () => {
    sthm(@card.countable_disjoint_union_of_idempot())
  })
  log.attempt("COUNTABLE_ASCENDING_CHAIN", () => {
    sthm(@card.countable_ascending_chain())
  })
  log.attempt("COUNTABLE_DESCENDING_CHAIN", () => {
    sthm(@card.countable_descending_chain())
  })
  log.attempt("CARD_EQ_LIST_GEN", () => sthm(@card.card_eq_list_gen()))
  log.attempt("CARD_EQ_LIST", () => sthm(@card.card_eq_list()))
  log.attempt("CARD_EQ_CART", () => sthm(@card.card_eq_cart()))
  log.attempt("CARD_EQ_REAL", () => sthm(@card.card_eq_real()))
  log.attempt("UNCOUNTABLE_REAL", () => sthm(@card.uncountable_real()))
  log.attempt("CARD_EQ_REAL_IMP_UNCOUNTABLE", () => {
    sthm(@card.card_eq_real_imp_uncountable())
  })
  log.attempt("COUNTABLE_IMP_CARD_LT_REAL", () => {
    sthm(@card.countable_imp_card_lt_real())
  })
  log.attempt("CARD_LT_NUM_REAL", () => sthm(@card.card_lt_num_real()))
  log.attempt("CARD_EQ_REAL_SUBSET", () => sthm(@card.card_eq_real_subset()))
  log.attempt("exp_c", () => sthm(@card.exp_c()))
  log.attempt("EXP_C", () => sthm(@card.exp_c_v1()))
  log.attempt("CARD_EXP_UNIV", () => sthm(@card.card_exp_univ()))
  log.attempt("CARD_EXP_GRAPH", () => sthm(@card.card_exp_graph()))
  log.attempt("CARD_EXP_GRAPH_PAIRED", () => sthm(@card.card_exp_graph_paired()))
  log.attempt("CARD_EXP_0", () => sthm(@card.card_exp_0()))
  log.attempt("CARD_EXP_ZERO", () => sthm(@card.card_exp_zero()))
  log.attempt("CARD_EXP_ADD", () => sthm(@card.card_exp_add()))
  log.attempt("CARD_EXP_MUL", () => sthm(@card.card_exp_mul()))
  log.attempt("CARD_MUL_EXP", () => sthm(@card.card_mul_exp()))
  log.attempt("CARD_EXP_SING", () => sthm(@card.card_exp_sing()))
  log.attempt("CARD_LE_EXP_LEFT", () => sthm(@card.card_le_exp_left()))
  log.attempt("CARD_LE_EXP_RIGHT", () => sthm(@card.card_le_exp_right()))
  log.attempt("CARD_LE_EXP", () => sthm(@card.card_le_exp()))
  log.attempt("CARD_EXP_CONG", () => sthm(@card.card_exp_cong()))
  log.attempt("CARD_EXP_FINITE", () => sthm(@card.card_exp_finite()))
  log.attempt("CARD_EXP_C", () => sthm(@card.card_exp_c()))
  log.attempt("CARD_EXP_POWERSET", () => sthm(@card.card_exp_powerset()))
  log.attempt("CARD_EXP_CANTOR", () => sthm(@card.card_exp_cantor()))
  log.attempt("CARD_EXP_ABSORB", () => sthm(@card.card_exp_absorb()))
  log.attempt("CARD_EXP_LE_REAL", () => sthm(@card.card_exp_le_real()))
  log.attempt("CARD_EXP_EQ_REAL", () => sthm(@card.card_exp_eq_real()))
  log.attempt("CARD_EQ_RESTRICTED_POWERSET", () => {
    sthm(@card.card_eq_restricted_powerset())
  })
  log.attempt("CARD_EQ_LIMITED_POWERSET", () => {
    sthm(@card.card_eq_limited_powerset())
  })
  log.attempt("CARD_EQ_FULLSIZE_POWERSET", () => {
    sthm(@card.card_eq_fullsize_powerset())
  })
  log.attempt("CARD_EQ_EXP_INFINITE_FINITE", () => {
    sthm(@card.card_eq_exp_infinite_finite())
  })
  log.attempt("CARD_EQ_FINITE_SUBSETS", () => {
    sthm(@card.card_eq_finite_subsets())
  })
  log.attempt("CARD_LE_LIST", () => sthm(@card.card_le_list()))
  log.attempt("CARD_LE_SUBPOWERSET", () => sthm(@card.card_le_subpowerset()))
  log.attempt("CARD_LE_FINITE_SUBSETS", () => {
    sthm(@card.card_le_finite_subsets())
  })
  log.attempt("CARD_LE_COUNTABLE_SUBSETS", () => {
    sthm(@card.card_le_countable_subsets())
  })
  log.attempt("CARD_LE_POWERSET", () => sthm(@card.card_le_powerset()))
  log.attempt("CARD_POWERSET_CONG", () => sthm(@card.card_powerset_cong()))
  log.attempt("COUNTABLE_LIST_GEN", () => sthm(@card.countable_list_gen()))
  log.attempt("COUNTABLE_LIST", () => sthm(@card.countable_list()))
  log.attempt("COUNTABLE_FINITE_SUBSETS", () => {
    sthm(@card.countable_finite_subsets())
  })
  log.attempt("CARD_EQ_REAL_SEQUENCES", () => {
    sthm(@card.card_eq_real_sequences())
  })
  log.attempt("CARD_EQ_COUNTABLE_SUBSETS_SUBREAL", () => {
    sthm(@card.card_eq_countable_subsets_subreal())
  })
  log.attempt("CARD_EQ_COUNTABLE_SUBSETS_REAL", () => {
    sthm(@card.card_eq_countable_subsets_real())
  })
  log.attempt("CARD_LE_RESTRICTED_FUNSPACE", () => {
    sthm(@card.card_le_restricted_funspace())
  })
  log.attempt("COUNTABLE_RESTRICTED_FUNSPACE", () => {
    sthm(@card.countable_restricted_funspace())
  })
  log.attempt("CARD_LE_RESTRICTED_FUNSPACE_INFINITE", () => {
    sthm(@card.card_le_restricted_funspace_infinite())
  })
  log.attempt("CARD_EQ_RESTRICTED_FUNSPACE_INFINITE", () => {
    sthm(@card.card_eq_restricted_funspace_infinite())
  })
  log.attempt("CARD_EQ_FUNSPACE", () => sthm(@card.card_eq_funspace()))
  log.attempt("CARTESIAN_PRODUCT_CONST", () => {
    sthm(@card.cartesian_product_const())
  })
  log.attempt("CARD_LE_CARTESIAN_PRODUCT", () => {
    sthm(@card.card_le_cartesian_product())
  })
  log.attempt("CARD_EQ_CARTESIAN_PRODUCT", () => {
    sthm(@card.card_eq_cartesian_product())
  })
  log.attempt("CARD_LE_CARTESIAN_PRODUCT_SUBINDEX", () => {
    sthm(@card.card_le_cartesian_product_subindex())
  })
  log.attempt("FINITE_CARTESIAN_PRODUCT", () => {
    sthm(@card.finite_cartesian_product())
  })
  log.attempt("COUNTABLE_CARTESIAN_PRODUCT", () => {
    sthm(@card.countable_cartesian_product())
  })
  log.attempt("CARD_EXP_FINITE_EQ", () => sthm(@card.card_exp_finite_eq()))
  log.attempt("CARD_EQ_CARTESIAN_PRODUCT_DISJOINT_UNION", () => {
    sthm(@card.card_eq_cartesian_product_disjoint_union())
  })
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
  log.attempt("counter_tyvar", () => stm(tm("(zz_counter : _)")))
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
      #|Library/card quotations (969):
      #|  (\226\136\128 z : Sum[_, _], (P : (Sum[_, _]) -> Bool)(z)) == ((\226\136\128 x : _, P(INL(x))) && (\226\136\128 x : _, P(INR(x))))
      #|  (\226\136\131 z : Sum[_, _], (P : (Sum[_, _]) -> Bool)(z)) == ((\226\136\131 x : _, P(INL(x))) || (\226\136\131 x : _, P(INR(x))))
      #|  (\226\136\128 x : _, IN(x, (s : (_) -> Bool)) \226\134\146 (g : (_) -> _)((f : (_) -> _)(x)) == x) == (\226\136\128 y : _, \226\136\128 x : _, IN(x, s) && y == f(x) \226\134\146 g(y) == x)
      #|  SUBSET((f : ((A) -> Bool, A) -> Bool)((a : (A) -> Bool)), a)
      #|  \226\136\128 b : (A) -> Bool, IN(b, (Y : ((A) -> Bool) -> Bool)) \226\134\146 SUBSET((f : ((A) -> Bool, A) -> Bool)((a : (A) -> Bool)), b)
      #|  \226\136\128 b : (A) -> Bool, IN(b, (Y : ((A) -> Bool) -> Bool)) == SUBSET((f : ((A) -> Bool, A) -> Bool)(b), b)
      #|  (a : (A) -> Bool) == INTERS((Y : ((A) -> Bool) -> Bool))
      #|  (Y : ((A) -> Bool) -> Bool) == {(b : (A) -> Bool) | SUBSET((f : ((A) -> Bool, A) -> Bool)(b), b)}
      #|  \226\136\128 f : ((A) -> Bool, A) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) \226\134\146 SUBSET(f(s), f(t))) \226\134\146 (\226\136\131 s : (A) -> Bool, f(s) == s)
      #|  (\226\136\131 x : _, IN(x, (s : (_) -> Bool))) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, IN(x, s) && IN(y, s) && (f : (_) -> _)(x) == f(y) \226\134\146 x == y) == (\226\136\131 g : (_) -> _, (\226\136\128 y : _, IN(y, (t : (_) -> Bool)) \226\134\146 IN(g(y), s)) && (\226\136\128 x : _, IN(x, s) \226\134\146 g(f(x)) == x))
      #|  ((\226\136\128 x : _, IN(x, (s : (_) -> Bool)) \226\134\146 IN((f : (_) -> _)(x), (t : (_) -> Bool))) && (\226\136\128 y : _, IN(y, t) \226\134\146 existsunique((x : _) => IN(x, s) && f(x) == y))) == ((\226\136\128 x : _, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : _, \226\136\128 y : _, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && (\226\136\128 y : _, IN(y, t) \226\134\146 (\226\136\131 x : _, IN(x, s) && f(x) == y)))
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a && b) == (a && c)
      #|  ((\226\136\128 x : _, IN(x, (s : (_) -> Bool)) \226\134\146 IN((f : (_) -> _)(x), (t : (_) -> Bool))) && (\226\136\128 y : _, IN(y, t) \226\134\146 existsunique((x : _) => IN(x, s) && f(x) == y))) == ((\226\136\128 x : _, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\131 g : (_) -> _, (\226\136\128 y : _, IN(y, t) \226\134\146 IN(g(y), s)) && (\226\136\128 y : _, IN(y, t) \226\134\146 f(g(y)) == y) && (\226\136\128 x : _, IN(x, s) \226\134\146 g(f(x)) == x)))
      #|  (y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (f : (A) -> B)(x) == y)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(s, t) == (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y))
      #|  fn { (x, y) => IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool)) && y == (f : (A) -> B)(x) }
      #|  (f : (A) -> B)
      #|  op_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool)) == (\226\136\131 R : ((A, B)) -> Bool, (\226\136\128 x : A, \226\136\128 y : B, R((x, y)) \226\134\146 IN(x, s) && IN(y, t)) && (\226\136\128 x : A, IN(x, s) \226\134\146 existsunique((y : B) => IN(y, t) && R((x, y)))) && (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && R((x, y)))))
      #|  GABS((f : ((A, B)) -> Bool) => \226\136\128 x : A, \226\136\128 y : B, GEQ(f((x, y)), (R : ((A, B)) -> Bool)((x, y)) && IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool))))
      #|  (R : ((A, B)) -> Bool)
      #|  op_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool)) == (\226\136\131 R : ((A, B)) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 existsunique((y : B) => IN(y, t) && R((x, y)))) && (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && R((x, y)))))
      #|  (x : A) => x
      #|  \226\136\128 s : (A) -> Bool, op_lt_eq_us_c(s, s)
      #|  \226\136\128 s : (B) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(({} : (A) -> Bool), s)
      #|  o((g : (B) -> C), (f : (A) -> B))
      #|  (g : (B) -> C)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, u) \226\134\146 op_lt_eq_us_c(s, u)
      #|  \226\136\128 s : (A) -> Bool, !op_lt_us_c(s, s)
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool)) && ((c' : Bool) && a \226\134\146 (b' : Bool)) \226\134\146 a && b && !b' \226\134\146 c && !c'
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_us_c(t, u) \226\134\146 op_lt_us_c(s, u)
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool)) && (b && (c' : Bool) \226\134\146 (a' : Bool)) \226\134\146 (a && !a') && b \226\134\146 c && !c'
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_lt_us_c(s, t) && op_lt_eq_us_c(t, u) \226\134\146 op_lt_us_c(s, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_lt_us_c(s, t) && op_lt_us_c(t, u) \226\134\146 op_lt_us_c(s, u)
      #|  (x : A) => x
      #|  \226\136\128 s : (A) -> Bool, op_eq_us_c(s, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, s == t \226\134\146 op_eq_us_c(s, t)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_eq_us_c(s, t) == op_eq_us_c(t, s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c(s, t)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_lt_us_c(s, t) \226\134\146 op_lt_eq_us_c(s, t)
      #|  (y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (R : (A, B) -> Bool)(x, y))
      #|  \226\136\128 R : (A, B) -> Bool, (\226\136\128 x : A, \226\136\128 y : B, \226\136\128 y' : B, IN(x, (s : (A) -> Bool)) && R(x, y) && R(x, y') \226\134\146 y == y') \226\134\146 op_lt_eq_us_c({(y : B) | \226\136\131 x : A, IN(x, s) && R(x, y)}, s)
      #|  (y : B) => select((x : A) => IN(x, (s : (A) -> Bool)) && (R : (A, B) -> Bool)(x, y))
      #|  \226\136\128 R : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && R(x, y))) && (\226\136\128 x : A, \226\136\128 y : B, \226\136\128 y' : B, IN(x, s) && IN(y, t) && IN(y', t) && R(x, y) && R(x, y') \226\134\146 y == y') \226\134\146 op_lt_eq_us_c(t, s)
      #|  \226\136\128 s : (_) -> Bool, (op_lt_eq_us_c : ((_) -> Bool, (_) -> Bool) -> Bool)(s, ({} : (_) -> Bool)) == (s == {})
      #|  \226\136\128 s : (_) -> Bool, (op_eq_us_c : ((_) -> Bool, (_) -> Bool) -> Bool)(s, ({} : (_) -> Bool)) == (s == {})
      #|  IN((y : B), IMAGE((f : (A) -> B), DIFF((s : (A) -> Bool), (u : (A) -> Bool))))
      #|  (y : B)
      #|  fn { (x, y) => IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool)) && (!IN(x, (u : (A) -> Bool)) && y == (f : (A) -> B)(x) || IN(x, u) && x == (g : (B) -> A)(y)) }
      #|  (u : (A) -> Bool)
      #|  (X : (A) -> Bool) => IMAGE((g : (B) -> A), DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), DIFF((s : (A) -> Bool), X))))
      #|  (g : (B) -> A)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, s)) == op_eq_us_c(s, t)
      #|  GABS((f : ((A, B)) -> Bool) => \226\136\128 x : A, \226\136\128 y : B, GEQ(f((x, y)), x == (a : A) && y == (b : B) || (R : ((A, B)) -> Bool)((x, y))))
      #|  (b : B)
      #|  (a : A)
      #|  GABS((f : ((A, B)) -> Bool) => \226\136\128 x : A, \226\136\128 y : B, GEQ(f((x, y)), true))
      #|  (\226\136\128 x : A, IN(x, (s : (A) -> Bool)) \226\134\146 (\226\136\131 y : B, IN(y, (t : (B) -> Bool)) && (R : ((A, B)) -> Bool)((x, y)))) || (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && R((x, y))))
      #|  (R : ((A, B)) -> Bool)
      #|  (P : (((A, B)) -> Bool) -> Bool)
      #|  (P : (((A, B)) -> Bool) -> Bool) == ((R : ((A, B)) -> Bool) => (\226\136\128 x : A, \226\136\128 y : B, R((x, y)) \226\134\146 IN(x, (s : (A) -> Bool)) && IN(y, (t : (B) -> Bool))) && (\226\136\128 x : A, \226\136\128 y : B, \226\136\128 y' : B, R((x, y)) && R((x, y')) \226\134\146 y == y') && (\226\136\128 x : A, \226\136\128 x' : A, \226\136\128 y : B, R((x, y)) && R((x', y)) \226\134\146 x == x'))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) || op_lt_eq_us_c(t, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) || op_lt_us_c(t, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_us_c(s, t) || op_lt_eq_us_c(t, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(s, t) || op_lt_us_c(s, t) || op_lt_us_c(t, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, !op_lt_eq_us_c(s, t) == op_lt_us_c(t, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, !op_lt_us_c(s, t) == op_lt_eq_us_c(t, s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_lt_us_c(s, t) == (op_lt_eq_us_c(s, t) && !op_eq_us_c(s, t))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_lt_eq_us_c(s, t) == (op_lt_us_c(s, t) || op_eq_us_c(s, t))
      #|  op_lt_eq_us_c((s : (A) -> Bool), (t' : (D) -> Bool))
      #|  op_lt_eq_us_c((s' : (B) -> Bool), (t : (C) -> Bool))
      #|  \226\136\128 x : Bool, \226\136\128 y : Bool, ((b : Bool) && (e : Bool) \226\134\146 x) && (x && (c : Bool) \226\134\146 (f : Bool)) && ((a : Bool) && f \226\134\146 y) && (y && (d : Bool) \226\134\146 e) \226\134\146 (a && b) && c && d \226\134\146 e == f
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_lt_eq_us_c(s, t) == op_lt_eq_us_c(s', t')
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_lt_us_c(s, t) == op_lt_us_c(s', t')
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(s, t) && op_eq_us_c(t, u) \226\134\146 op_eq_us_c(s, u)
      #|  (t' : (D) -> Bool)
      #|  (s' : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (t : (C) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_eq_us_c(s, t) == op_eq_us_c(s', t')
      #|  \226\136\128 s : (A) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) == (op_lt_eq_us_c : ((Num) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Num) -> Bool), s)
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 s : (A) -> Bool, (FINITE : ((A) -> Bool) -> Bool)(s) == (op_lt_us_c : ((A) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) \226\134\146 op_lt_eq_us_c(s, t)
      #|  op_tilde
      #|  op_tilde
      #|  op_tilde
      #|  op_tilde
      #|  false
      #|  \226\136\128 s : (A) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (A) -> Bool) -> Bool)(s, (UNIV : (A) -> Bool))
      #|  (f : (A) -> B)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  (f : (A) -> B)
      #|  (a : Bool) == (b : Bool) \226\134\146 b \226\134\146 a
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) == (\226\136\131 u : (B) -> Bool, SUBSET(u, t) && op_eq_us_c(s, u))
      #|  \226\136\128 s : (A) -> Bool, (\226\136\131 t : (B) -> Bool, (op_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s)) == (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(s, (UNIV : (B) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(s, t) \226\134\146 INFINITE(s) == INFINITE(t)
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(s, t) \226\134\146 FINITE(s) == FINITE(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 FINITE(s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && op_eq_us_c(s, t) \226\134\146 FINITE(s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(t) && op_eq_us_c(s, t) \226\134\146 INFINITE(s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(s) && op_lt_eq_us_c(s, t) \226\134\146 INFINITE(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && INFINITE(t) \226\134\146 op_lt_us_c(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && INFINITE(t) \226\134\146 op_lt_eq_us_c(s, t)
      #|  (m : Num) == (n : Num) \226\134\146 n <= m
      #|  CARD(IMAGE((f : (A) -> B), (s : (A) -> Bool)))
      #|  (f : (A) -> B)
      #|  FINITE((s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 CARD(s) <= CARD(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(t) && op_eq_us_c(s, t) \226\134\146 CARD(s) == CARD(t)
      #|  (u : (A) -> Bool) == (s : (A) -> Bool)
      #|  (u : (A) -> Bool)
      #|  ((c : Bool) \226\134\146 (a : Bool) \226\134\146 (b : Bool)) \226\134\146 a && !b \226\134\146 !c
      #|  ((a : Bool) \226\134\146 (b : Bool)) && (!a \226\134\146 !b) \226\134\146 a == b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 op_lt_eq_us_c(s, t) == (CARD(s) <= CARD(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 op_eq_us_c(s, t) == (CARD(s) == CARD(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 op_lt_us_c(s, t) == (CARD(s) < CARD(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 n : Num, op_eq_us_c(s, t) \226\134\146 HAS_SIZE(s, n) == HAS_SIZE(t, n)
      #|  FINITE((s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, op_lt_eq_us_c(op_dot_dot(1, (n : Num)), s) == (FINITE(s) \226\134\146 n <= CARD(s))
      #|  \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, op_lt_eq_us_c(IMAGE(f, s), s)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) \226\134\146 op_lt_eq_us_c(t, s)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 op_eq_us_c(IMAGE(f, s), s)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) \226\134\146 op_lt_eq_us_c(t, {(x : A) | IN(x, s) && IN(f(x), t)})
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && IN(f(x), t) && IN(f(y), t) && f(x) == f(y) \226\134\146 x == y) \226\134\146 op_lt_eq_us_c({(x : A) | IN(x, s) && IN(f(x), t)}, t)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && IN(f(x), t) && IN(f(y), t) && f(x) == f(y) \226\134\146 x == y) && SUBSET(t, IMAGE(f, s)) \226\134\146 op_eq_us_c({(x : A) | IN(x, s) && IN(f(x), t)}, t)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool)) == IMAGE((h : (C) -> B), IMAGE((g : (A) -> C), s))
      #|  (h : (C) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && g(x) == g(y) \226\134\146 f(x) == f(y)) \226\134\146 op_lt_eq_us_c(IMAGE(f, s), IMAGE(g, s))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 (f(x) == f(y)) == (g(x) == g(y))) \226\134\146 op_eq_us_c(IMAGE(f, s), IMAGE(g, s))
      #|  (x : B) => if IN((f : (B) -> A)(x), (s : (A) -> Bool)) { f(x) } else { (a : A) }
      #|  (f : (B) -> A)
      #|  (a : A)
      #|  (s : (A) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) == (s == {} || (\226\136\131 f : (B) -> A, IMAGE(f, t) == s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) == (\226\136\131 f : (B) -> A, SUBSET(s, IMAGE(f, t)))
      #|  FINITE((s : (A) -> Bool))
      #|  \226\136\128 c : B, \226\136\128 s : (A) -> Bool, op_lt_eq_us_c(s, {c}) == (\226\136\131 a : A, SUBSET(s, {a}))
      #|  (x : A) => (b : B)
      #|  (b : B)
      #|  (s : (B) -> Bool) == {}
      #|  \226\136\128 a : A, \226\136\128 s : (B) -> Bool, op_lt_eq_us_c({a}, s) == !(s == {})
      #|  ((x : _) => IN(x, (s : (_) -> Bool))) == s
      #|  (x : A) => (y : A) => IN(x, IMAGE((f : (A) -> A), (s : (A) -> Bool))) && IN(y, IMAGE(f, s)) && (l : (A, A) -> Bool)(x, y)
      #|  (f : (A) -> A)
      #|  ((s : (_) -> Bool) == UNIV) == (\226\136\128 x : _, s(x))
      #|  (s : (A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  \226\136\131 l : (A, A) -> Bool, ordinal(l) && (\226\136\128 x : A, fld(l, x))
      #|  \226\136\128 s : (A) -> Bool, \226\136\131 l : (A, A) -> Bool, ordinal(l) && op_eq_us_c(fld(l), s)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (\226\136\128 x : _, (s : (_) -> Bool)(x) \226\134\146 (t : (_) -> Bool)(x)) == SUBSET(s, t)
      #|  !(p : Bool) && (!p && (q : Bool) \226\134\146 (r : Bool)) \226\134\146 p || q \226\134\146 r
      #|  (w : ((A) -> Bool, A, A) -> Bool)((t : (A) -> Bool))
      #|  (w : ((A) -> Bool, A, A) -> Bool)((s : (A) -> Bool))
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  :A
      #|  :B
      #|  (w : ((A) -> Bool, A, A) -> Bool)
      #|  \226\136\131 w : ((A) -> Bool, A, A) -> Bool, (\226\136\128 s : (A) -> Bool, ordinal(w(s))) && (\226\136\128 s : (A) -> Bool, op_eq_us_c(fld(w(s)), s))
      #|  (WF : (((A) -> Bool, (A) -> Bool) -> Bool) -> Bool)((op_lt_us_c : ((A) -> Bool, (A) -> Bool) -> Bool))
      #|  (op_plus_us_c : ((_) -> Bool, (_) -> Bool, Sum[_, _]) -> Bool)((s : (_) -> Bool), (t : (_) -> Bool)) == UNION({INL((x : _)) | IN(x, s)}, {INR((y : _)) | IN(y, t)})
      #|  (op_star_us_c : ((_) -> Bool, (_) -> Bool, (_, _)) -> Bool)((s : (_) -> Bool), (t : (_) -> Bool)) == {((x : _), (y : _)) | IN(x, s) && IN(y, t)}
      #|  (h : (Sum[A, C]) -> Sum[B, D])
      #|  (\226\136\128 x : A, (h : (Sum[A, C]) -> Sum[B, D])(INL(x)) == INL((f : (A) -> B)(x))) && (\226\136\128 y : C, h(INR(y)) == INR((g : (C) -> D)(y)))
      #|  (g : (C) -> D)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))
      #|  fn { (x, y) => ((f : (A) -> B)(x), (g : (C) -> D)(y)) }
      #|  (g : (C) -> D)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') \226\134\146 op_lt_eq_us_c(op_star_us_c(s, t), op_star_us_c(s', t'))
      #|  (h : (A) -> B) => o((g : (B) -> B'), o(h, (f' : (A') -> A)))
      #|  \226\136\131 f' : (A') -> A, \226\136\128 x : A, f'((f : (A) -> A')(x)) == x
      #|  (g : (B) -> B')
      #|  (f : (A) -> A')
      #|  (op_lt_eq_us_c : ((A) -> Bool, (A') -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : (A') -> Bool)) && (op_lt_eq_us_c : ((B) -> Bool, (B') -> Bool) -> Bool)((UNIV : (B) -> Bool), (UNIV : (B') -> Bool)) \226\134\146 (op_lt_eq_us_c : (((A) -> B) -> Bool, ((A') -> B') -> Bool) -> Bool)((UNIV : ((A) -> B) -> Bool), (UNIV : ((A') -> B') -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_eq_us_c(op_star_us_c(s, t), op_star_us_c(s', t'))
      #|  (op_eq_us_c : ((A) -> Bool, (A') -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : (A') -> Bool)) && (op_eq_us_c : ((B) -> Bool, (B') -> Bool) -> Bool)((UNIV : (B) -> Bool), (UNIV : (B') -> Bool)) \226\134\146 (op_eq_us_c : (((A) -> B) -> Bool, ((A') -> B') -> Bool) -> Bool)((UNIV : ((A) -> B) -> Bool), (UNIV : ((A') -> B') -> Bool))
      #|  (op_star_us_c : ((A) -> Bool, (B) -> Bool, (A, B)) -> Bool)((UNIV : (A) -> Bool), (UNIV : (B) -> Bool)) == (UNIV : ((A, B)) -> Bool)
      #|  (g : ((A, B)) -> C) => (x : A) => (y : B) => g((x, y))
      #|  (f : (A, B) -> C) => fn { (x, y) => f(x, y) }
      #|  (op_eq_us_c : (((A, B) -> C) -> Bool, (((A, B)) -> C) -> Bool) -> Bool)((UNIV : ((A, B) -> C) -> Bool), (UNIV : (((A, B)) -> C) -> Bool))
      #|  (\226\136\128 x : _, IN(INL(x), op_plus_us_c((s : (_) -> Bool), (t : (_) -> Bool))) == IN(x, s)) && (\226\136\128 y : _, IN(INR(y), op_plus_us_c(s, t)) == IN(y, t))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, \226\136\128 x : _, \226\136\128 y : _, IN((x, y), op_star_us_c(s, t)) == (IN(x, s) && IN(y, t))
      #|  (x : A) => (x, select((z : A) => IN(z, (s : (A) -> Bool))))
      #|  \226\136\128 s : (A) -> Bool, op_lt_eq_us_c(s, op_star_us_c(s, s))
      #|  GABS((f : ((Num, Num)) -> Num) => \226\136\128 x : Num, \226\136\128 y : Num, GEQ(f((x, y)), NUMPAIR(x, y)))
      #|  (op_eq_us_c : (((Num, Num)) -> Bool, (Num) -> Bool) -> Bool)((op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool)), (UNIV : (Num) -> Bool))
      #|  fn { (INL : (A) -> Sum[A, A])((x : A)) => x; (INR : (A) -> Sum[A, A])((x : A)) => x }
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, op_lt_eq_us_c(UNION(s, t), op_plus_us_c(s, t))
      #|  (INTER(IMAGE((f : (_) -> _), (s : (_) -> Bool)), IMAGE((g : (_) -> _), (t : (_) -> Bool))) == {}) == (\226\136\128 x : _, \226\136\128 y : _, IN(x, s) && IN(y, t) \226\134\146 !(f(x) == g(y)))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(op_plus_us_c(s, t)) == CARD(s) + CARD(t)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(op_star_us_c(s, t)) == CARD(s) * CARD(t)
      #|  (\226\136\128 x : A, (h : (Sum[A, B]) -> Sum[B, A])(INL(x)) == INR(x)) && (\226\136\128 y : B, h(INR(y)) == INL(y))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(t, s))
      #|  (\226\136\128 x : A, (h : (Sum[A, Sum[B, C]]) -> Sum[Sum[A, B], C])(INL(x)) == INL(INL(x))) && (\226\136\128 z : Sum[B, C], h(INR(z)) == (i : (Sum[B, C]) -> Sum[Sum[A, B], C])(z))
      #|  (\226\136\128 u : B, (i : (Sum[B, C]) -> Sum[Sum[A, B], C])(INL(u)) == INL(INR(u))) && (\226\136\128 v : C, i(INR(v)) == INR(v))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_plus_us_c(s, op_plus_us_c(t, u)), op_plus_us_c(op_plus_us_c(s, t), u))
      #|  \226\136\128 x : A, \226\136\128 y : B, (h : ((A, B)) -> (B, A))((x, y)) == (y, x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(op_star_us_c(s, t), op_star_us_c(t, s))
      #|  \226\136\128 x : A, \226\136\128 p : (B, C), (h : ((A, B, C)) -> ((A, B), C))((x, p)) == (i : (A, (B, C)) -> ((A, B), C))(x, p)
      #|  \226\136\128 x : A, \226\136\128 y : B, \226\136\128 z : C, (i : (A, (B, C)) -> ((A, B), C))(x, (y, z)) == ((x, y), z)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_star_us_c(s, op_star_us_c(t, u)), op_star_us_c(op_star_us_c(s, t), u))
      #|  \226\136\128 x : A, \226\136\128 s : Sum[B, C], (h : ((A, Sum[B, C])) -> Sum[(A, B), (A, C)])((x, s)) == (i : (A, Sum[B, C]) -> Sum[(A, B), (A, C)])(x, s)
      #|  (\226\136\128 x : A, \226\136\128 y : B, (i : (A, Sum[B, C]) -> Sum[(A, B), (A, C)])(x, INL(y)) == INL((x, y))) && (\226\136\128 x : A, \226\136\128 z : C, i(x, INR(z)) == INR((x, z)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_star_us_c(s, op_plus_us_c(t, u)), op_plus_us_c(op_star_us_c(s, t), op_star_us_c(s, u)))
      #|  op_plus_us_c(op_star_us_c((u : (C) -> Bool), (s : (A) -> Bool)), op_star_us_c(u, (t : (B) -> Bool)))
      #|  op_star_us_c((u : (C) -> Bool), op_plus_us_c((s : (A) -> Bool), (t : (B) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_star_us_c(op_plus_us_c(s, t), u), op_plus_us_c(op_star_us_c(s, u), op_star_us_c(t, u)))
      #|  (INL : (A) -> Sum[A, B])
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, op_plus_us_c(s, t))
      #|  (INR : (B) -> Sum[A, B])
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(t, op_plus_us_c(s, t))
      #|  (b : B) => ((a : A), b)
      #|  (SND : ((A, B)) -> B)
      #|  \226\136\128 a : A, \226\136\128 t : (B) -> Bool, op_eq_us_c(op_star_us_c({a}, t), t)
      #|  (a : A) => (a, (b : B))
      #|  (FST : ((A, B)) -> A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 b : B, op_eq_us_c(op_star_us_c(s, {b}), s)
      #|  1 == 0
      #|  (h : (Sum[A, A]) -> (A, A))
      #|  (\226\136\128 x : A, (h : (Sum[A, A]) -> (A, A))(INL(x)) == ((f : (Num) -> A)(0), x)) && (\226\136\128 x : A, h(INR(x)) == (f(1), x))
      #|  (f : (Num) -> A)
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, s), op_star_us_c(s, s))
      #|  (if (b : Bool) { (x : Bool) } else { (y : Bool) }) == (b && x || !b && y)
      #|  (x : A) => if IN(x, (s : (A) -> Bool)) { INL(x) } else { INR(x) }
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTER(s, t) == {} \226\134\146 op_eq_us_c(UNION(s, t), op_plus_us_c(s, t))
      #|  op_plus_us_c((s : (A) -> Bool), (u : (B) -> Bool))
      #|  UNION(IMAGE((f : (A) -> B), (s : (A) -> Bool)), DIFF((t : (B) -> Bool), IMAGE(f, s)))
      #|  DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), (s : (A) -> Bool)))
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) == (\226\136\131 u : (B) -> Bool, op_eq_us_c(t, op_plus_us_c(s, u)))
      #|  op_plus_us_c(IMAGE((f : (A) -> B), (s : (A) -> Bool)), {(b : B)})
      #|  !IN((b : _), IMAGE((f : (_) -> _), (s : (_) -> Bool))) == (\226\136\128 x : _, IN(x, s) \226\134\146 !(f(x) == b))
      #|  (b : B)
      #|  (f : (A) -> B)
      #|  \226\136\131 b : B, IN(b, DIFF((t : (B) -> Bool), IMAGE((f : (A) -> B), (s : (A) -> Bool))))
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 a : C, op_lt_us_c(s, t) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, {a}), t)
      #|  INFINITE((s : (A) -> Bool)) && SUBSET(s, (k : (A) -> Bool)) && (\226\136\128 x : (A, A), \226\136\128 y : A, (R : (((A, A), A)) -> Bool)((x, y)) \226\134\146 IN(x, op_star_us_c(s, s)) && IN(y, s)) && (\226\136\128 x : (A, A), IN(x, op_star_us_c(s, s)) \226\134\146 existsunique((y : A) => IN(y, s) && R((x, y)))) && (\226\136\128 y : A, IN(y, s) \226\134\146 existsunique((x : (A, A)) => IN(x, op_star_us_c(s, s)) && R((x, y)))) \226\134\146 s == {(z : A) | \226\136\131 p : (A, A), R((p, z))}
      #|  SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))
      #|  SUBSET((s : (A) -> Bool), (k : (A) -> Bool))
      #|  SUBSET((s : (A) -> Bool), (k : (A) -> Bool))
      #|  SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))
      #|  SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))
      #|  IN((a : A), (d : (A) -> Bool))
      #|  ((b : (A, A)), (a : A))
      #|  (b : (A, A))
      #|  IN((a : A), (d : (A) -> Bool))
      #|  (a : A)
      #|  (FINITE : ((A) -> Bool) -> Bool)
      #|  !((d : (A) -> Bool) == {})
      #|  UNION((s : (A) -> Bool), (d : (A) -> Bool))
      #|  (x : ((A, A), A)) => (R : (((A, A), A)) -> Bool)(x) || (S : (((A, A), A)) -> Bool)(x)
      #|  (S : (((A, A), A)) -> Bool)
      #|  op_plus_us_c((s : (A) -> Bool), s)
      #|  op_plus_us_c((s : (A) -> Bool), op_plus_us_c(s, s))
      #|  op_plus_us_c(op_star_us_c((s : (A) -> Bool), s), op_plus_us_c(op_star_us_c(s, s), op_star_us_c(s, s)))
      #|  (s : (A) -> Bool)
      #|  SUBSET((d : (A) -> Bool), DIFF((k : (A) -> Bool), (s : (A) -> Bool)))
      #|  INTER((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)) == {}
      #|  op_plus_us_c(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), UNION(op_star_us_c(d, s), op_star_us_c(d, d)))
      #|  op_plus_us_c(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), op_plus_us_c(op_star_us_c(d, s), op_star_us_c(d, d)))
      #|  op_eq_us_c(UNION(op_star_us_c((s : (A) -> Bool), (d : (A) -> Bool)), UNION(op_star_us_c(d, s), op_star_us_c(d, d))), d)
      #|  (d : (A) -> Bool)
      #|  op_lt_eq_us_c((s : (A) -> Bool), DIFF((k : (A) -> Bool), s))
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  op_star_us_c((s : (A) -> Bool), s)
      #|  op_star_us_c(op_plus_us_c((s : (A) -> Bool), s), op_plus_us_c(s, s))
      #|  op_star_us_c(op_plus_us_c((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)), op_plus_us_c(s, DIFF(k, s)))
      #|  (k : (A) -> Bool) == UNION((s : (A) -> Bool), DIFF(k, s))
      #|  (s : (A) -> Bool)
      #|  DIFF((k : (A) -> Bool), (s : (A) -> Bool))
      #|  INTER((s : (A) -> Bool), DIFF((k : (A) -> Bool), s)) == {}
      #|  op_star_us_c((s : (A) -> Bool), s)
      #|  op_lt_eq_us_c(op_plus_us_c((s : (A) -> Bool), s), s)
      #|  (R : (((A, A), A)) -> Bool)
      #|  op_eq_us_c(op_star_us_c((s : (A) -> Bool), s), s)
      #|  (s : (A) -> Bool)
      #|  (R : (((A, A), A)) -> Bool)
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool)) == (b \226\134\146 a \226\134\146 c)
      #|  (s : (((A, A), A)) -> Bool)
      #|  (s : (((A, A), A)) -> Bool)
      #|  ((c : Bool) && (d : Bool) \226\134\146 (f : Bool)) && ((a : Bool) && (b : Bool) \226\134\146 (e : Bool)) \226\134\146 a && (b && c) && d \226\134\146 e && f
      #|  ((a : Bool) \226\134\146 (b : Bool) && (c : Bool)) == ((a \226\134\146 b) && (a \226\134\146 c))
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 a == (b && a)
      #|  (P : ((((A, A), A)) -> Bool) -> Bool) == ((R : (((A, A), A)) -> Bool) => INFINITE({(z : A) | \226\136\131 x : A, \226\136\131 y : A, R(((x, y), z))}) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, R(((x, y), z)) \226\134\146 IN(x, (k : (A) -> Bool)) && IN(y, k) && IN(z, k)) && (\226\136\128 x : A, \226\136\128 y : A, (\226\136\131 u : A, \226\136\131 v : A, R(((u, v), x))) && (\226\136\131 u : A, \226\136\131 v : A, R(((u, v), y))) \226\134\146 (\226\136\131 z : A, R(((x, y), z)))) && (\226\136\128 x : A, \226\136\128 y : A, (\226\136\131 z : A, R(((x, y), z))) \226\134\146 (\226\136\131 u : A, \226\136\131 v : A, R(((u, v), x))) && (\226\136\131 u : A, \226\136\131 v : A, R(((u, v), y)))) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z1 : A, \226\136\128 z2 : A, R(((x, y), z1)) && R(((x, y), z2)) \226\134\146 z1 == z2) && (\226\136\128 x1 : A, \226\136\128 y1 : A, \226\136\128 x2 : A, \226\136\128 y2 : A, \226\136\128 z : A, R(((x1, y1), z)) && R(((x2, y2), z)) \226\134\146 x1 == x2 && y1 == y2))
      #|  (s : (A) -> Bool)
      #|  (P : ((((A, A), A)) -> Bool) -> Bool)
      #|  (P : ((((A, A), A)) -> Bool) -> Bool) == ((R : (((A, A), A)) -> Bool) => \226\136\131 s : (A) -> Bool, INFINITE(s) && SUBSET(s, (k : (A) -> Bool)) && (\226\136\128 x : (A, A), \226\136\128 y : A, R((x, y)) \226\134\146 IN(x, op_star_us_c(s, s)) && IN(y, s)) && (\226\136\128 x : (A, A), IN(x, op_star_us_c(s, s)) \226\134\146 existsunique((y : A) => IN(y, s) && R((x, y)))) && (\226\136\128 y : A, IN(y, s) \226\134\146 existsunique((x : (A, A)) => IN(x, op_star_us_c(s, s)) && R((x, y)))))
      #|  \226\136\128 k : (A) -> Bool, INFINITE(k) \226\134\146 op_eq_us_c(op_star_us_c(k, k), k)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE(op_plus_us_c(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(op_plus_us_c(s, t)) == (FINITE(s) && FINITE(t))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE(op_star_us_c(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(op_star_us_c(s, t)) == (s == {} || t == {} || FINITE(s) && FINITE(t))
      #|  op_star_us_c((t : (B) -> Bool), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c(op_star_us_c(s, t), t)
      #|  op_star_us_c((s : (A) -> Bool), (u : (C) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, INFINITE(u) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) \226\134\146 op_lt_eq_us_c(op_star_us_c(s, t), u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, (INFINITE(s) || INFINITE(t)) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) \226\134\146 op_lt_eq_us_c(op_star_us_c(s, t), u)
      #|  op_plus_us_c((t : (B) -> Bool), t)
      #|  op_star_us_c((t : (B) -> Bool), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, t), t)
      #|  op_plus_us_c((s : (A) -> Bool), (u : (C) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, INFINITE(u) && op_lt_eq_us_c(s, u) && op_lt_eq_us_c(t, u) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, t), u)
      #|  (x : B) => ((a : A), x)
      #|  (a : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(t) && !(s == {}) && op_lt_eq_us_c(s, t) \226\134\146 op_eq_us_c(op_star_us_c(s, t), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 op_eq_us_c(op_plus_us_c(s, t), t)
      #|  op_plus_us_c((t : (B) -> Bool), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(s) && op_lt_eq_us_c(t, s) \226\134\146 op_eq_us_c(op_plus_us_c(s, t), s)
      #|  op_plus_us_c((s : (A) -> Bool), (t : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INFINITE(t) && op_lt_eq_us_c(s, t) \226\134\146 op_eq_us_c(UNION(s, t), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INFINITE(s) && op_lt_eq_us_c(t, s) \226\134\146 op_eq_us_c(UNION(s, t), s)
      #|  (s : (A) -> Bool)
      #|  FINITE((s : (A) -> Bool))
      #|  (t : (B) -> Bool)
      #|  FINITE((t : (B) -> Bool))
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  FINITE(op_plus_us_c((s : (A) -> Bool), (t : (B) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, INFINITE(u) && op_lt_us_c(s, u) && op_lt_us_c(t, u) \226\134\146 op_lt_us_c(op_plus_us_c(s, t), u)
      #|  op_plus_us_c(DIFF((s : (A) -> Bool), (t : (A) -> Bool)), t)
      #|  SUBSET((s : (A) -> Bool), UNION(DIFF(s, (t : (A) -> Bool)), t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INFINITE(s) && op_lt_us_c(t, s) \226\134\146 op_eq_us_c(DIFF(s, t), s)
      #|  (t' : (D) -> Bool)
      #|  (s' : (B) -> Bool)
      #|  op_lt_us_c((t : (C) -> Bool), (t' : (D) -> Bool))
      #|  op_lt_us_c((s : (A) -> Bool), (s' : (B) -> Bool))
      #|  FINITE((s : (A) -> Bool)) && FINITE((t : (C) -> Bool))
      #|  FINITE(op_plus_us_c((s' : (B) -> Bool), (t' : (D) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_lt_us_c(s, s') && op_lt_us_c(t, t') \226\134\146 op_lt_us_c(op_plus_us_c(s, t), op_plus_us_c(s', t'))
      #|  op_lt_eq_us_c((s : (A) -> Bool), (t : (B) -> Bool))
      #|  op_lt_eq_us_c((s : (A) -> Bool), (u : (C) -> Bool))
      #|  FINITE((t : (B) -> Bool))
      #|  FINITE((s : (A) -> Bool))
      #|  FINITE((u : (C) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, (FINITE(s) || op_lt_eq_us_c(s, u)) && op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) \226\134\146 op_lt_eq_us_c(t, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, FINITE(s) || op_lt_eq_us_c(s, u) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) == op_lt_eq_us_c(t, u)
      #|  op_lt_eq_us_c(op_plus_us_c((s : (_) -> Bool), (u : (_) -> Bool)), op_plus_us_c((t : (_) -> Bool), u)) == op_lt_eq_us_c(op_plus_us_c(u, s), op_plus_us_c(u, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, (FINITE(u) || op_lt_eq_us_c(u, t)) && op_lt_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) \226\134\146 op_lt_eq_us_c(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, FINITE(u) || op_lt_eq_us_c(u, t) \226\134\146 op_lt_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) == op_lt_eq_us_c(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, (FINITE(s) || op_lt_eq_us_c(s, t) && op_lt_eq_us_c(s, u)) && op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) \226\134\146 op_eq_us_c(t, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, FINITE(s) || op_lt_eq_us_c(s, t) && op_lt_eq_us_c(s, u) \226\134\146 op_eq_us_c(op_plus_us_c(s, t), op_plus_us_c(s, u)) == op_eq_us_c(t, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, (FINITE(u) || op_lt_eq_us_c(u, s) && op_lt_eq_us_c(u, t)) && op_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) \226\134\146 op_eq_us_c(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, FINITE(u) || op_lt_eq_us_c(u, s) && op_lt_eq_us_c(u, t) \226\134\146 op_eq_us_c(op_plus_us_c(s, u), op_plus_us_c(t, u)) == op_eq_us_c(s, t)
      #|  IMAGE(fn { (x, y) => (g : ((A) -> Bool, C) -> A)((f : (B, A) -> Bool)(x), y) }, op_star_us_c((k : (B) -> Bool), (l : (C) -> Bool)))
      #|  (g : ((A) -> Bool, C) -> A)
      #|  (f : (B, A) -> Bool)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, \226\136\128 k : (B) -> Bool, \226\136\128 l : (C) -> Bool, op_lt_eq_us_c(u, k) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 op_lt_eq_us_c(s, l)) \226\134\146 op_lt_eq_us_c(UNIONS(u), op_star_us_c(k, l))
      #|  \226\136\128 k : (B) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, INFINITE(k) && op_lt_eq_us_c(u, k) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 op_lt_eq_us_c(s, k)) \226\134\146 op_lt_eq_us_c(UNIONS(u), k)
      #|  fn { (u, y) => (f : ((A) -> Bool, B) -> A)(u, y) }
      #|  (f : ((A) -> Bool, B) -> A)
      #|  DISJOINT((s : (_) -> Bool), (t : (_) -> Bool)) == (\226\136\128 x : _, !(IN(x, s) && IN(x, t)))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : (B) -> Bool, pairwise(DISJOINT, s) && (\226\136\128 u : (A) -> Bool, IN(u, s) \226\134\146 op_lt_eq_us_c(t, u)) \226\134\146 op_lt_eq_us_c(op_star_us_c(s, t), UNIONS(s))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : (B) -> Bool, pairwise(DISJOINT, s) && (\226\136\128 u : (A) -> Bool, IN(u, s) \226\134\146 op_eq_us_c(u, t)) \226\134\146 op_eq_us_c(UNIONS(s), op_star_us_c(s, t))
      #|  GABS((f : ((B, C)) -> A) => \226\136\128 y : B, \226\136\128 z : C, GEQ(f((y, z)), (k : (A, C) -> A)((h : (B) -> A)(y), z)))
      #|  (h : (B) -> A)
      #|  \226\136\128 y : B, IN(y, IMAGE((f : (A) -> B), (s : (A) -> Bool))) \226\134\146 (\226\136\131 x : A, IN(x, s) && f(x) == y)
      #|  (k : (A, C) -> A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (C) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 op_eq_us_c({(z : A) | IN(z, s) && f(z) == f(x)}, t)) \226\134\146 op_eq_us_c(op_star_us_c(IMAGE(f, s), t), s)
      #|  FINITE((t : (B) -> Bool))
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  INFINITE((s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) && op_eq_us_c(s, t) && op_eq_us_c(s', t') && (INFINITE(s) \226\134\146 op_lt_us_c(s', s)) \226\134\146 op_eq_us_c(DIFF(s, s'), DIFF(t, t'))
      #|  (y : B) => if IN(y, (t : (B) -> Bool)) { (g : (B) -> A)(y) } else { (g' : (B) -> A)(y) }
      #|  (x : A) => if IN(x, (s : (A) -> Bool)) { (f : (A) -> B)(x) } else { (f' : (A) -> B)(x) }
      #|  (g' : (B) -> A)
      #|  (f' : (A) -> B)
      #|  (g : (B) -> A)
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, DISJOINT(s, s') && DISJOINT(t, t') \226\134\146 (op_eq_us_c(s, t) && op_eq_us_c(s', t')) == (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) && (\226\136\128 x : A, IN(x, s') \226\134\146 IN(f(x), t') && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t') \226\134\146 IN(g(y), s') && f(g(y)) == y))
      #|  DISJOINT((t : (_) -> Bool), DIFF((s : (_) -> Bool), t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) \226\134\146 (op_eq_us_c(s', t') && op_eq_us_c(DIFF(s, s'), DIFF(t, t'))) == (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) && IMAGE(f, s') == t' && IMAGE(g, t') == s')
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(s', s) && SUBSET(t', t) && (INFINITE(s) \226\134\146 op_lt_us_c(s', s)) \226\134\146 (op_eq_us_c(s, t) && op_eq_us_c(s', t')) == (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) && IMAGE(f, s') == t' && IMAGE(g, t') == s')
      #|  (y : B) => if IN(y, (t : (B) -> Bool)) { (g : (B) -> A)(y) } else { (g' : (B) -> A)(y) }
      #|  (x : A) => if IN(x, (s : (A) -> Bool)) { (f : (A) -> B)(x) } else { (f' : (A) -> B)(x) }
      #|  (g' : (B) -> A)
      #|  (f' : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> A, \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(s, s') && SUBSET(t, t') && op_eq_us_c(DIFF(s', s), DIFF(t', t)) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) \226\134\146 (\226\136\131 f' : (A) -> B, \226\136\131 g' : (B) -> A, (\226\136\128 x : A, IN(x, s') \226\134\146 IN(f'(x), t') && g'(f'(x)) == x) && (\226\136\128 y : B, IN(y, t') \226\134\146 IN(g'(y), s') && f'(g'(y)) == y) && (\226\136\128 x : A, IN(x, s) \226\134\146 f'(x) == f(x)) && (\226\136\128 y : B, IN(y, t) \226\134\146 g'(y) == g(y)))
      #|  (f : (A) -> A)
      #|  \226\136\128 f : (A) -> A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, IN(x, t) \226\134\146 IN(f(x), s)) && (\226\136\128 x : A, IN(x, s) || IN(x, t) \226\134\146 f(f(x)) == x) \226\134\146 op_eq_us_c(s, t)
      #|  FINITE((t : (B) -> Bool))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (_) -> Bool, op_lt_eq_us_c(s, t) && op_lt_us_c(t, u) && INFINITE(u) \226\134\146 op_lt_us_c(op_star_us_c(s, t), u)
      #|  op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool))
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (_) -> Bool, op_lt_us_c(s, u) && op_lt_us_c(t, u) && INFINITE(u) \226\134\146 op_lt_us_c(op_star_us_c(s, t), u)
      #|  (x : A) => (s : (A) -> Bool)(x) && !(g : (A, A) -> Bool)(x, x)
      #|  (g : (A, A) -> Bool)
      #|  (op_eq : (A, A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, op_lt_us_c(s, {(t : (A) -> Bool) | SUBSET(t, s)})
      #|  (UNIV : (A) -> Bool)
      #|  (op_lt_us_c : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((UNIV : (A) -> Bool), (UNIV : ((A) -> Bool) -> Bool))
      #|  (COUNTABLE : ((Num) -> Bool) -> Bool)((UNIV : (Num) -> Bool))
      #|  \226\136\128 s : (_) -> Bool, (COUNTABLE : ((_) -> Bool) -> Bool)(s) == (op_lt_eq_us_c : ((_) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool))
      #|  \226\136\128 s : (_) -> Bool, (COUNTABLE : ((_) -> Bool) -> Bool)(s) == ((FINITE : ((_) -> Bool) -> Bool)(s) || (op_eq_us_c : ((_) -> Bool, (Num) -> Bool) -> Bool)(s, (UNIV : (Num) -> Bool)))
      #|  (t : (A) -> Bool)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(t) && op_lt_eq_us_c(s, t) \226\134\146 COUNTABLE(s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(t) && op_eq_us_c(s, t) \226\134\146 COUNTABLE(s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, op_eq_us_c(s, t) \226\134\146 COUNTABLE(s) == COUNTABLE(t)
      #|  (t : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(t) && SUBSET(s, t) \226\134\146 COUNTABLE(s)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 P : (_) -> Bool, COUNTABLE(s) \226\134\146 COUNTABLE({(x : _) | IN(x, s) && P(x)})
      #|  \226\136\128 s : (Num) -> Bool, COUNTABLE(s)
      #|  \226\136\128 s : (_) -> Bool, FINITE(s) \226\134\146 COUNTABLE(s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(s) && INFINITE(t) \226\134\146 op_lt_eq_us_c(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(s) && !COUNTABLE(t) \226\134\146 op_lt_us_c(s, t)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, COUNTABLE(s) \226\134\146 COUNTABLE(IMAGE(f, s))
      #|  IMAGE((g : (B) -> A), (A : (B) -> Bool))
      #|  (g : (B) -> A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && COUNTABLE(A) \226\134\146 COUNTABLE({(x : A) | IN(x, s) && IN(f(x), A)})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 COUNTABLE(IMAGE(f, s)) == COUNTABLE(s)
      #|  (UNIV : (A) -> Bool)
      #|  (A : (B) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) && COUNTABLE(A) \226\134\146 COUNTABLE({(x : A) | IN(f(x), A)})
      #|  (COUNTABLE : ((_) -> Bool) -> Bool)(({} : (_) -> Bool))
      #|  ((a : Bool) || (b : Bool) \226\134\146 (c : Bool)) == ((a \226\134\146 c) && (b \226\134\146 c))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, COUNTABLE(s) || COUNTABLE(t) \226\134\146 COUNTABLE(INTER(s, t))
      #|  op_plus_us_c((s : (A) -> Bool), (t : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE(UNION(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(UNION(s, t)) == (COUNTABLE(s) && COUNTABLE(t))
      #|  \226\136\128 x : _, COUNTABLE({x})
      #|  INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)
      #|  \226\136\128 x : _, \226\136\128 s : (_) -> Bool, COUNTABLE(INSERT(x, s)) == COUNTABLE(s)
      #|  COUNTABLE(INSERT((x : A), DELETE((s : (A) -> Bool), x)))
      #|  !IN((x : _), (s : (_) -> Bool)) \226\134\146 DELETE(s, x) == s
      #|  IN((x : A), (s : (A) -> Bool))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, COUNTABLE(DELETE(s, x)) == COUNTABLE(s)
      #|  DIFF((s : (_) -> Bool), INSERT((x : _), (t : (_) -> Bool))) == DELETE(DIFF(s, t), x)
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, FINITE(s) \226\134\146 COUNTABLE(DIFF(t, s)) == COUNTABLE(t)
      #|  SUBSET(DIFF((s : (_) -> Bool), (t : (_) -> Bool)), s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, COUNTABLE(s) \226\134\146 COUNTABLE(DIFF(s, t))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE(CROSS(s, t))
      #|  \226\136\128 s : (_) -> Bool, COUNTABLE(s) \226\134\146 (\226\136\131 f : (Num) -> _, SUBSET(s, IMAGE(f, UNIV)))
      #|  \226\136\128 s : (A) -> Bool, COUNTABLE(s) == (\226\136\131 f : (Num) -> A, SUBSET(s, IMAGE(f, UNIV)))
      #|  (n : Num) => if IN((f : (Num) -> A)(n), (s : (A) -> Bool)) { f(n) } else { (a : A) }
      #|  (f : (Num) -> A)
      #|  (a : A)
      #|  \226\136\128 s : (A) -> Bool, COUNTABLE(s) && !(s == {}) \226\134\146 (\226\136\131 f : (Num) -> A, s == IMAGE(f, UNIV))
      #|  (\226\136\128 d : (_) -> Bool, COUNTABLE(d) \226\134\146 (P : ((_) -> Bool) -> Bool)(d)) == (P({}) && (\226\136\128 f : (Num) -> _, P(IMAGE(f, UNIV))))
      #|  \226\136\128 s : (_) -> Bool, COUNTABLE(s) && INFINITE(s) \226\134\146 (\226\136\131 f : (Num) -> _, s == IMAGE(f, UNIV) && (\226\136\128 m : Num, \226\136\128 n : Num, f(m) == f(n) \226\134\146 m == n))
      #|  FINITE((s : (A) -> Bool))
      #|  ((r : Bool) \226\134\146 (q : Bool)) && (q \226\134\146 (p : Bool)) && (p \226\134\146 r) \226\134\146 p == q && p == r
      #|  (s : (A) -> Bool)
      #|  (\226\136\128 s : (A) -> Bool, COUNTABLE(s) == (\226\136\131 f : (Num) -> A, \226\136\131 k : (Num) -> Bool, s == IMAGE(f, k))) && (\226\136\128 s : (A) -> Bool, COUNTABLE(s) == (\226\136\131 f : (Num) -> A, \226\136\131 k : (Num) -> Bool, s == IMAGE(f, k) && (\226\136\128 m : Num, \226\136\128 n : Num, IN(m, k) && IN(n, k) && f(m) == f(n) \226\134\146 m == n)))
      #|  \226\136\128 A : ((A) -> Bool) -> Bool, COUNTABLE(A) && (\226\136\128 s : (A) -> Bool, IN(s, A) \226\134\146 COUNTABLE(s)) \226\134\146 COUNTABLE(UNIONS(A))
      #|  IMAGE(fn { (m, n) => ((f : (Num) -> A)(m), (g : (A, Num) -> B)(f(m), n)) }, CROSS(UNIV, UNIV))
      #|  (g : (A, Num) -> B)
      #|  (f : (Num) -> A)
      #|  {(f : (A, B) -> C)((x : A), (y : B)) | IN(x, (s : (A) -> Bool)) && IN(y, (t : (A, B) -> Bool)(x))} == IMAGE(fn { (x, y) => f(x, y) }, {((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})
      #|  \226\136\128 f : (A, B) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, COUNTABLE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 COUNTABLE(t(x))) \226\134\146 COUNTABLE({f((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})
      #|  (op_plus_us_c : ((Num) -> Bool, (Num) -> Bool, Sum[Num, Num]) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE(op_plus_us_c(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(op_plus_us_c(s, t)) == (COUNTABLE(s) && COUNTABLE(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE(op_star_us_c(s, t))
      #|  IMAGE(SND, op_star_us_c((s : (A) -> Bool), (t : (B) -> Bool)))
      #|  IMAGE(FST, op_star_us_c((s : (A) -> Bool), (t : (B) -> Bool)))
      #|  {((x : _), (y : _)) | false} == {}
      #|  (t : (B) -> Bool) == {}
      #|  (s : (A) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, COUNTABLE(op_star_us_c(s, t)) == (s == {} || t == {} || COUNTABLE(s) && COUNTABLE(t))
      #|  GABS((f : ((Cart[A, M], Cart[A, N])) -> Cart[A, Finite_sum[M, N]]) => \226\136\128 x : Cart[A, M], \226\136\128 y : Cart[A, N], GEQ(f((x, y)), pastecart(x, y)))
      #|  (z : Cart[A, Finite_sum[M, N]]) => (fstcart(z), sndcart(z))
      #|  \226\136\128 s : (Cart[A, M]) -> Bool, \226\136\128 t : (Cart[A, N]) -> Bool, op_eq_us_c(PCROSS(s, t), op_star_us_c(s, t))
      #|  COUNTABLE(op_star_us_c((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)))
      #|  \226\136\128 s : (Cart[A, M]) -> Bool, \226\136\128 t : (Cart[A, N]) -> Bool, COUNTABLE(PCROSS(s, t)) == (s == {} || t == {} || COUNTABLE(s) && COUNTABLE(t))
      #|  \226\136\128 s : (Cart[A, M]) -> Bool, \226\136\128 t : (Cart[A, N]) -> Bool, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE(PCROSS(s, t))
      #|  UNION(IMAGE((n : Num) => int_of_num(n), UNIV), IMAGE((n : Num) => -int_of_num(n), UNIV))
      #|  (COUNTABLE : ((Int) -> Bool) -> Bool)((UNIV : (Int) -> Bool))
      #|  int_of_num
      #|  (op_eq_us_c : ((Int) -> Bool, (Num) -> Bool) -> Bool)((UNIV : (Int) -> Bool), (UNIV : (Num) -> Bool))
      #|  (INFINITE : ((Int) -> Bool) -> Bool)((UNIV : (Int) -> Bool))
      #|  (n : Num) < (i : Num) && !(i == SUC(n)) \226\134\146 SUC(n) < i
      #|  1 <= SUC((n : Num))
      #|  (i : Num) <= (n : Num) \226\134\146 !(i == SUC(n))
      #|  (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { (select : ((A) -> Bool) -> A)((x : A) => false) } else { (op_dollar : (Cart[A, N], Num) -> A)((v : Cart[A, N]), i) })
      #|  op_dollar((v : Cart[A, N]), SUC((n : Num)))
      #|  (v : Cart[A, N])
      #|  SUC((n : Num)) <= (m : Num) \226\134\146 n <= m
      #|  1 <= SUC((n : Num))
      #|  (IMAGE : (((A, Cart[A, N])) -> Cart[A, N], ((A, Cart[A, N])) -> Bool, Cart[A, N]) -> Bool)(fn { ((x : A), (v : Cart[A, N])) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { x } else { (op_dollar : (Cart[A, N], Num) -> A)(v, i) }) }, {((x : A), (v : Cart[A, N])) | (IN : (A, (A) -> Bool) -> Bool)(x, {(x : A) | (P : (Num, A) -> Bool)(SUC(n), x)}) && (IN : (Cart[A, N], (Cart[A, N]) -> Bool) -> Bool)(v, {(v : Cart[A, N]) | (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n \226\134\146 P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i \226\134\146 (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})})
      #|  {(v : Cart[A, N]) | \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false)} == {(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (select : ((A) -> Bool) -> A)((x : A) => false))}
      #|  (1 <= (i : Num) && i <= (n : Num) && 0 < i) == (1 <= i && i <= n)
      #|  (1 <= (i : Num) && i <= (n : Num) && i <= 0) == false
      #|  (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))
      #|  \226\136\128 n : Num, n <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (COUNTABLE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n \226\134\146 (P : (Num, A) -> Bool)(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i \226\134\146 (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})
      #|  \226\136\128 P : (Num, A) -> Bool, (\226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 (COUNTABLE : ((A) -> Bool) -> Bool)({(x : A) | P(i, x)})) \226\134\146 (COUNTABLE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | \226\136\128 i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) \226\134\146 P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))})
      #|  ((p : Bool) && (q : Bool) && (r : Bool)) == (q && p && r)
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, (\226\136\131 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && (\226\136\128 x : _, \226\136\128 y : _, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) && P(IMAGE(f, t)))
      #|  (\226\136\128 t : _, (p : (_) -> Bool)(t)) == !(\226\136\131 t : _, !p(t))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, (\226\136\128 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && (\226\136\128 x : _, \226\136\128 y : _, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) \226\134\146 P(IMAGE(f, t)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, (\226\136\131 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) && P(IMAGE(f, t)))
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x)) == !(\226\136\131 x : _, !P(x))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 f : (_) -> _, \226\136\128 s : (_) -> Bool, (\226\136\128 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (_) -> Bool, COUNTABLE(t) && SUBSET(t, s) \226\134\146 P(IMAGE(f, t)))
      #|  (t : (B) -> Bool)
      #|  (t : (B) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (COUNTABLE(t) && SUBSET(t, IMAGE(f, s))) == (\226\136\131 s' : (A) -> Bool, COUNTABLE(s') && SUBSET(s', s) && t == IMAGE(f, s'))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, COUNTABLE(IMAGE(f, s)) == (\226\136\131 t : (A) -> Bool, COUNTABLE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t))
      #|  (s : (A) -> Bool)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, COUNTABLE(IMAGE(f, s)) == (\226\136\131 t : (A) -> Bool, COUNTABLE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)))
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
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
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_tilde
      #|  op_bslash_slash
      #|  false
      #|  \226\136\128 l : (A, A) -> Bool, COUNTABLE(fld(l)) == COUNTABLE({((x : A), (y : A)) | l(x, y)})
      #|  (SND : ((A, A)) -> A)
      #|  (FST : ((A, A)) -> A)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, P, {})
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, P, UNIV)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 UNION_OF(COUNTABLE, P, s)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 INTERSECTION_OF(COUNTABLE, P, s)
      #|  {(f : (_) -> _)((y : _)) | IN(y, IMAGE((g : (_) -> _), (s : (_) -> Bool)))} == IMAGE((x : _) => f(g(x)), s)
      #|  IMAGE((c : (A) -> Bool) => DIFF(UNIV, c), (u : ((A) -> Bool) -> Bool))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNION_OF(COUNTABLE, P, s) == INTERSECTION_OF(COUNTABLE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) == UNION_OF(COUNTABLE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  {(t : (Num, A) -> Bool)((n : Num)) | IN(n, UNIV)}
      #|  (t : (Num, A) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (n : Num) => ({} : (A) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P({}) \226\134\146 UNION_OF(COUNTABLE, P, s) == (\226\136\131 t : (Num, A) -> Bool, (\226\136\128 n : Num, P(t(n))) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == s)
      #|  {(f : (_) -> _)((x : _)) | x == (a : _)} == {f(a)}
      #|  {(f : (_) -> _)((x : _)) | (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)} == UNION({f((x : _)) | P(x)}, {f((x : _)) | Q(x)})
      #|  (n : Num) => UNIONS({(t : (Num, A) -> Bool)((m : Num)) | m <= n})
      #|  (t : (Num, A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P({}) && (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, P(t) && P(u) \226\134\146 P(UNION(t, u))) \226\134\146 UNION_OF(COUNTABLE, P, s) == (\226\136\131 t : (Num, A) -> Bool, (\226\136\128 n : Num, P(t(n))) && (\226\136\128 n : Num, SUBSET(t(n), t(SUC(n)))) && UNIONS({t((n : Num)) | IN(n, UNIV)}) == s)
      #|  IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})
      #|  (f : ((A) -> Bool, (A) -> Bool) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, UNION_OF(COUNTABLE, P)) == UNION_OF(COUNTABLE, P)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, INTERSECTION_OF(COUNTABLE, P)) == INTERSECTION_OF(COUNTABLE, P)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, COUNTABLE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 UNION_OF(COUNTABLE, P, s)) \226\134\146 UNION_OF(COUNTABLE, P, UNIONS(u))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) \226\134\146 UNION_OF(COUNTABLE, P, UNION(s, t))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, COUNTABLE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 INTERSECTION_OF(COUNTABLE, P, s)) \226\134\146 INTERSECTION_OF(COUNTABLE, P, INTERS(u))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, \226\136\128 s : (_) -> Bool, \226\136\128 t : (_) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) \226\134\146 INTERSECTION_OF(COUNTABLE, P, INTER(s, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) \226\134\146 UNION_OF(COUNTABLE, P, INTER(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 UNION_OF(COUNTABLE, P, INTER(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(INTER(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(COUNTABLE, P, s) && UNION_OF(COUNTABLE, P, t) \226\134\146 UNION_OF(COUNTABLE, P, INTER(s, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool)) == DIFF(UNIV, UNION(DIFF(UNIV, s), DIFF(UNIV, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  DIFF(UNIV, UNION((s : (_) -> Bool), (t : (_) -> Bool))) == INTER(DIFF(UNIV, s), DIFF(UNIV, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) \226\134\146 INTERSECTION_OF(COUNTABLE, P, UNION(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 INTERSECTION_OF(COUNTABLE, P, UNION(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(COUNTABLE, P, s) && INTERSECTION_OF(COUNTABLE, P, t) \226\134\146 INTERSECTION_OF(COUNTABLE, P, UNION(s, t)))
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) && FINITE(u) && !(u == {}) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 INTERSECTION_OF(COUNTABLE, P, s)) \226\134\146 INTERSECTION_OF(COUNTABLE, P, UNIONS(u))
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, INTERSECTION_OF(COUNTABLE, P, {}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) && FINITE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 INTERSECTION_OF(COUNTABLE, P, s)) \226\134\146 INTERSECTION_OF(COUNTABLE, P, UNIONS(u))
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(INTER(s, t))) && FINITE(u) && !(u == {}) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 UNION_OF(COUNTABLE, P, s)) \226\134\146 UNION_OF(COUNTABLE, P, INTERS(u))
      #|  (u : ((A) -> Bool) -> Bool) == {}
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, UNION_OF(COUNTABLE, P, UNIV) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(INTER(s, t))) && FINITE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 UNION_OF(COUNTABLE, P, s)) \226\134\146 UNION_OF(COUNTABLE, P, INTERS(u))
      #|  (s2 : (A) -> Bool) == (s1 : (A) -> Bool)
      #|  (t2 : (A) -> Bool)
      #|  (s2 : (A) -> Bool)
      #|  (t1 : (A) -> Bool)
      #|  (s1 : (A) -> Bool)
      #|  IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})
      #|  (f : ((A) -> Bool, (A) -> Bool) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool)) == ((x : _) => s(x) && t(x))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), P)) == UNION_OF(INTER(COUNTABLE, pairwise(DISJOINT)), P)
      #|  (UNION((a : (_) -> Bool), (b : (_) -> Bool)) == b) == SUBSET(a, b)
      #|  (UNION((a : (_) -> Bool), (b : (_) -> Bool)) == a) == SUBSET(b, a)
      #|  IN((a : (_) -> Bool), (f : ((_) -> Bool) -> Bool)) && IN((b : (_) -> Bool), f) && (UNION(a, b) == a || UNION(a, b) == b) \226\134\146 IN(UNION(a, b), f)
      #|  (n : Num) => UNIONS(IMAGE((b : (Num, A) -> Bool), op_dot_dot(0, n)))
      #|  (b : (Num, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IN(s, f) && IN(t, f) \226\134\146 SUBSET(s, t) || SUBSET(t, s)) \226\134\146 (\226\136\131 u : (Num, A) -> Bool, (\226\136\128 n : Num, IN(u(n), f)) && (\226\136\128 n : Num, SUBSET(u(n), u(SUC(n)))) && UNIONS({u((n : Num)) | IN(n, UNIV)}) == UNIONS(f))
      #|  (INTER((a : (_) -> Bool), (b : (_) -> Bool)) == b) == SUBSET(b, a)
      #|  (INTER((a : (_) -> Bool), (b : (_) -> Bool)) == a) == SUBSET(a, b)
      #|  IN((a : (_) -> Bool), (f : ((_) -> Bool) -> Bool)) && IN((b : (_) -> Bool), f) && (INTER(a, b) == a || INTER(a, b) == b) \226\134\146 IN(INTER(a, b), f)
      #|  (n : Num) => INTERS(IMAGE((b : (Num, A) -> Bool), op_dot_dot(0, n)))
      #|  (b : (Num, A) -> Bool)
      #|  (f : ((A) -> Bool) -> Bool)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, COUNTABLE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IN(s, f) && IN(t, f) \226\134\146 SUBSET(s, t) || SUBSET(t, s)) \226\134\146 (\226\136\131 u : (Num, A) -> Bool, (\226\136\128 n : Num, IN(u(n), f)) && (\226\136\128 n : Num, SUBSET(u(SUC(n)), u(n))) && INTERS({u((n : Num)) | IN(n, UNIV)}) == INTERS(f))
      #|  \226\136\128 l : List[A], (\226\136\128 x : A, MEM(x, l) \226\134\146 IN(x, (s : (A) -> Bool))) \226\134\146 IN(ITLIST((pair : (A, A) -> A), l, (b : A)), s)
      #|  (l : List[A]) => (LENGTH(l), ITLIST((pair : (A, A) -> A), l, (b : A)))
      #|  \226\136\131 b : A, IN(b, (s : (A) -> Bool))
      #|  (pair : (A, A) -> A)
      #|  op_lt_eq_us_c(op_star_us_c((s : (A) -> Bool), s), s)
      #|  (op_star_us_c : ((Num) -> Bool, (A) -> Bool, (Num, A)) -> Bool)((UNIV : (Num) -> Bool), (s : (A) -> Bool))
      #|  (x : A) => [x]
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 op_eq_us_c({(l : List[A]) | \226\136\128 x : A, MEM(x, l) \226\134\146 IN(x, s)}, s)
      #|  {(x : _) | true} == UNIV
      #|  (INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) \226\134\146 (op_eq_us_c : ((List[A]) -> Bool, (A) -> Bool) -> Bool)((UNIV : (List[A]) -> Bool), (UNIV : (A) -> Bool))
      #|  ((i : Num) < (n : Num) + 1) == (i <= n)
      #|  (i : Num) => op_dollar((x : Cart[A, N]), i)
      #|  (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) + 1
      #|  CONS((f : (Num) -> A)(0), (l : List[A]))
      #|  (l : List[A])
      #|  (i : Num) => (f : (Num) -> A)(SUC(i))
      #|  (f : (Num) -> A)
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> A, \226\136\131 l : List[A], \226\136\128 i : Num, i < n \226\134\146 EL(i, l) == f(i)
      #|  (x : Cart[A, N])
      #|  (l : List[A]) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => EL(i, l))
      #|  (UNIV : (List[A]) -> Bool)
      #|  (x : A) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => x)
      #|  (INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) \226\134\146 (op_eq_us_c : ((Cart[A, N]) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Cart[A, N]) -> Bool), (UNIV : (A) -> Bool))
      #|  (inv((x : Real)) < real_of_num(3) / real_of_num(2) / x) == (real_of_num(0) < inv(x))
      #|  (a : Real) + (j : Real) <= (k : Real) \226\134\146 (x : Real) < j \226\134\146 a + x < k
      #|  SUC((m : Num))
      #|  (n : Num)
      #|  (m : Num) + 1 <= (n : Num)
      #|  (m : Num) <= (n : Num)
      #|  (n : Num) - (m : Num)
      #|  sum(op_dot_dot((m : Num), (n : Num)), (i : Num) => inv(pow(real_of_num(3), i)))
      #|  \226\136\128 s : (Num) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, sum(INTER(s, op_dot_dot(m, n)), (i : Num) => inv(pow(real_of_num(3), i))) < real_of_num(3) / real_of_num(2) / pow(real_of_num(3), m)
      #|  real_of_num(3) / real_of_num(2) / pow(real_of_num(3), 0)
      #|  {sum(INTER((x : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) | IN(n, UNIV)}
      #|  (real_of_num(1) / real_of_num(2) * (x : Real) < x) == (real_of_num(0) < x)
      #|  !((n : Num) == 0) && (m : Num) <= n - 1 \226\134\146 m < n
      #|  (s : Real) == (t : Real) && (d : Real) < (e : Real) \226\134\146 s + d < t + e
      #|  (n : Num) == 0
      #|  SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) \226\134\146 SUBSET(INTER((u : (_) -> Bool), s), INTER(u, t))
      #|  (y : Real) <= (x : Real) && real_of_num(0) <= (d : Real) \226\134\146 y <= x + d
      #|  sum(INTER((y : (Num) -> Bool), op_dot_dot((n : Num) + 1, (p : Num))), (i : Num) => inv(pow(real_of_num(3), i)))
      #|  \226\136\128 d : Real, (s : Real) == (t : Real) + d && d <= (e : Real) \226\134\146 s <= t + e
      #|  (n : Num) <= (p : Num)
      #|  (p : Num)
      #|  sum(INTER((y : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) + real_of_num(3) / real_of_num(2) / pow(real_of_num(3), SUC(n))
      #|  sum(INTER((x : (Num) -> Bool), op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i)))
      #|  \226\136\128 z : Real, (y : Real) < z && z <= (x : Real) \226\134\146 !(x == y)
      #|  (n : Num)
      #|  (y : (Num) -> Bool)
      #|  (x : (Num) -> Bool)
      #|  ((\226\136\128 P : (Num) -> Bool, \226\136\128 Q : (Num) -> Bool, \226\136\128 n : Num, (R : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(P, Q, n) == R(Q, P, n)) && (\226\136\128 P : (Num) -> Bool, \226\136\128 Q : (Num) -> Bool, (S : ((Num) -> Bool, (Num) -> Bool) -> Bool)(P, Q) == S(Q, P))) && (\226\136\128 P : (Num) -> Bool, \226\136\128 Q : (Num) -> Bool, (\226\136\131 n : Num, IN(n, P) && !IN(n, Q) && R(P, Q, n)) \226\134\146 S(P, Q)) \226\134\146 (\226\136\128 P : (Num) -> Bool, \226\136\128 Q : (Num) -> Bool, (\226\136\131 n : Num, !(IN(n, P) == IN(n, Q)) && R(P, Q, n)) \226\134\146 S(P, Q))
      #|  (x : (Num) -> Bool)
      #|  (y : (Num) -> Bool)
      #|  (y : (Num) -> Bool)
      #|  (x : (Num) -> Bool)
      #|  (s : (Num) -> Bool) => sup({sum(INTER(s, op_dot_dot(0, (n : Num))), (i : Num) => inv(pow(real_of_num(3), i))) | IN(n, UNIV)})
      #|  (q : Num)
      #|  (q : Num)
      #|  ((x : Real) < real_of_num(0)) == !(real_of_num(0) <= x)
      #|  real_of_num((p : Num)) * (x : Real)
      #|  (p : Num)
      #|  real_of_num(2)
      #|  (y : Real) - (x : Real)
      #|  !(p : Bool) \226\134\146 p \226\134\146 (q : Bool)
      #|  (pair : ((Num, Num)) -> Num)(((p : Num), (q : Num)))
      #|  (q : Num)
      #|  (p : Num)
      #|  (y : Real)
      #|  (x : Real)
      #|  (x : Real) => (n : Num) => real_of_num(FST((unpair : (Num) -> (Num, Num))(n))) * x <= real_of_num(SND(unpair(n)))
      #|  (unpair : (Num) -> (Num, Num))
      #|  (pair : ((Num, Num)) -> Num)
      #|  (UNIV : (Num) -> Bool)
      #|  (UNIV : (Num) -> Bool)
      #|  abs((x : Real))
      #|  (P : (Num) -> Bool)(0) || P(1) \226\134\146 (\226\136\131 n : Num, P(n))
      #|  (x : Real)
      #|  GABS((f : ((Num, Real)) -> Real) => \226\136\128 n : Num, \226\136\128 x : Real, GEQ(f((n, x)), pow(-real_of_num(1), n) * x))
      #|  (op_star_us_c : ((Num) -> Bool, (Real) -> Bool, (Num, Real)) -> Bool)((UNIV : (Num) -> Bool), {(x : Real) | real_of_num(0) <= x})
      #|  (op_star_us_c : ((Num) -> Bool, ((Num) -> Bool) -> Bool, (Num, (Num) -> Bool)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : ((Num) -> Bool) -> Bool))
      #|  (op_eq_us_c : ((Real) -> Bool, ((Num) -> Bool) -> Bool) -> Bool)((UNIV : (Real) -> Bool), (UNIV : ((Num) -> Bool) -> Bool))
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  !(COUNTABLE : ((Real) -> Bool) -> Bool)((UNIV : (Real) -> Bool))
      #|  (UNIV : (Real) -> Bool)
      #|  \226\136\128 s : (_) -> Bool, (op_eq_us_c : ((_) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) \226\134\146 !(COUNTABLE : ((_) -> Bool) -> Bool)(s)
      #|  \226\136\128 s : (A) -> Bool, (COUNTABLE : ((A) -> Bool) -> Bool)(s) \226\134\146 (op_lt_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool))
      #|  (op_lt_us_c : ((Num) -> Bool, (Real) -> Bool) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Real) -> Bool))
      #|  ((a : Real) < (a + (b : Real)) / real_of_num(2) + (b - a) / real_of_num(2) * (x : Real)) == ((b - a) * -real_of_num(1) < (b - a) * x) && ((a + b) / real_of_num(2) + (b - a) / real_of_num(2) * x < b) == ((b - a) * x < (b - a) * real_of_num(1))
      #|  (x : Real)
      #|  (x : Real) => ((a : Real) + (b : Real)) / real_of_num(2) + (b - a) / real_of_num(2) * (x / (real_of_num(1) + abs(x)))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, a < b && (\226\136\128 x : Real, a < x && x < b \226\134\146 (IN : (Real, (Real) -> Bool) -> Bool)(x, s)) \226\134\146 (op_eq_us_c : ((Real) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool))
      #|  (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == {(f : (B) -> A) | (\226\136\128 x : B, IN(x, t) \226\134\146 IN(f(x), s)) && (\226\136\128 x : B, !IN(x, t) \226\134\146 f(x) == select((y : A) => false))}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_caret_us_c(s, t) == {(f : (B) -> A) | SUBSET(IMAGE(f, t), s) && EXTENSIONAL(t, f)}
      #|  (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)((UNIV : (A) -> Bool), (UNIV : (B) -> Bool)) == (UNIV : ((B) -> A) -> Bool)
      #|  (R : (B, A) -> Bool) => (x : B) => if IN(x, (t : (B) -> Bool)) { select((y : A) => R(x, y)) } else { select((y : A) => false) }
      #|  (f : (B) -> A) => (x : B) => (y : A) => IN(x, (t : (B) -> Bool)) && f(x) == y
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(op_caret_us_c(s, t), {(R : (B, A) -> Bool) | (\226\136\128 x : B, \226\136\128 y : A, R(x, y) \226\134\146 IN(x, t) && IN(y, s)) && (\226\136\128 x : B, IN(x, t) \226\134\146 existsunique((y : A) => R(x, y)))})
      #|  (R : ((B, A)) -> Bool) => (x : B) => (y : A) => R((x, y))
      #|  (R : (B, A) -> Bool) => GABS((f : ((B, A)) -> Bool) => \226\136\128 x : B, \226\136\128 y : A, GEQ(f((x, y)), R(x, y)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(op_caret_us_c(s, t), {(R : ((B, A)) -> Bool) | (\226\136\128 x : B, \226\136\128 y : A, R((x, y)) \226\134\146 IN(x, t) && IN(y, s)) && (\226\136\128 x : B, IN(x, t) \226\134\146 existsunique((y : A) => R((x, y))))})
      #|  {(x : _) | x == (a : _)} == {a}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 c : C, (op_eq_us_c : (((B) -> A) -> Bool, (C) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, ({} : (B) -> Bool)), {c})
      #|  {(x : _) | x == (a : _)} == {a}
      #|  !((s : (_) -> Bool) == {}) \226\134\146 !(\226\136\128 x : _, !IN(x, s))
      #|  \226\136\128 s : (B) -> Bool, \226\136\128 c : C, (op_eq_us_c : (((B) -> A) -> Bool, (C) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(({} : (A) -> Bool), s), if s == {} { {c} } else { {} })
      #|  fn { (g, h) => (z : Sum[B, C]) => if (\226\136\131 x : B, IN(x, (t : (B) -> Bool)) && INL(x) == z) { g(select((x : B) => IN(x, t) && INL(x) == z)) } else { if (\226\136\131 y : C, IN(y, (u : (C) -> Bool)) && INR(y) == z) { h(select((y : C) => IN(y, u) && INR(y) == z)) } else { select((y : A) => false) } } }
      #|  (f : (Sum[B, C]) -> A) => ((x : B) => if IN(x, (t : (B) -> Bool)) { f(INL(x)) } else { select((x : A) => false) }, (x : C) => if IN(x, (u : (C) -> Bool)) { f(INR(x)) } else { select((x : A) => false) })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_caret_us_c(s, op_plus_us_c(t, u)), op_star_us_c(op_caret_us_c(s, t), op_caret_us_c(s, u)))
      #|  (f : (C, B) -> A) => fn { (x, y) => if IN(x, (t : (B) -> Bool)) && IN(y, (u : (C) -> Bool)) { f(y, x) } else { select((x : A) => false) } }
      #|  (f : ((B, C)) -> A) => (y : C) => if IN(y, (u : (C) -> Bool)) { (x : B) => f((x, y)) } else { select((x : (B) -> A) => false) }
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_caret_us_c(s, op_star_us_c(t, u)), op_caret_us_c(op_caret_us_c(s, t), u))
      #|  fn { (g, h) => (x : C) => if IN(x, (u : (C) -> Bool)) { (g(x), h(x)) } else { select((x : (A, B)) => false) } }
      #|  (f : (C) -> (A, B)) => ((x : C) => if IN(x, (u : (C) -> Bool)) { FST(f(x)) } else { select((x : A) => false) }, (x : C) => if IN(x, u) { SND(f(x)) } else { select((x : B) => false) })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_eq_us_c(op_caret_us_c(op_star_us_c(s, t), u), op_star_us_c(op_caret_us_c(s, u), op_caret_us_c(t, u)))
      #|  (x : A) => (y : B) => if y == (b : B) { x } else { select((y : A) => false) }
      #|  (f : (B) -> A) => f((b : B))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 b : B, op_eq_us_c(op_caret_us_c(s, {b}), s)
      #|  (g : (C) -> A) => (z : C) => if IN(z, (t : (C) -> Bool)) { (f : (A) -> B)(g(z)) } else { select((x : B) => false) }
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, op_lt_eq_us_c(s, s') \226\134\146 op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t))
      #|  (f : (B) -> C)((b : B))
      #|  IN((b : B), (t : (B) -> Bool))
      #|  (b : B)
      #|  (l : (B) -> A)
      #|  (k : (B) -> A)
      #|  (g : (B) -> A) => (c : C) => if IN(c, (t' : (C) -> Bool)) { if IN((h : (C) -> B)(c), (t : (B) -> Bool)) { g(h(c)) } else { (a : A) } } else { select((x : A) => false) }
      #|  (h : (C) -> B)
      #|  (f : (B) -> C)
      #|  (a : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (C) -> Bool, !(s == {}) && op_lt_eq_us_c(t, t') \226\134\146 op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s, t'))
      #|  op_caret_us_c((s : (A) -> Bool), (t' : (D) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, !(s == {}) && op_lt_eq_us_c(s, s') && op_lt_eq_us_c(t, t') \226\134\146 op_lt_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t'))
      #|  (s' : (B) -> Bool) == {}
      #|  0
      #|  (t' : (D) -> Bool)
      #|  :A
      #|  :B
      #|  0
      #|  (t : (C) -> Bool)
      #|  (s : (A) -> Bool) == {}
      #|  (t : (C) -> Bool) == {}
      #|  {0}
      #|  (t' : (D) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (B) -> Bool, \226\136\128 t : (C) -> Bool, \226\136\128 t' : (D) -> Bool, op_eq_us_c(s, s') && op_eq_us_c(t, t') \226\134\146 op_eq_us_c(op_caret_us_c(s, t), op_caret_us_c(s', t'))
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE(op_caret_us_c(s, t))
      #|  CARD(op_star_us_c(op_caret_us_c((s : (A) -> Bool), {(b : B)}), op_caret_us_c(s, (t : (B) -> Bool))))
      #|  CARD(op_caret_us_c((s : (A) -> Bool), op_plus_us_c({(b : B)}, (t : (B) -> Bool))))
      #|  (t : (B) -> Bool)
      #|  (b : B)
      #|  0
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(op_caret_us_c(s, t)) == EXP(CARD(s), CARD(t))
      #|  (t : (A) -> Bool) => (x : A) => if IN(x, (s : (A) -> Bool)) { IN(x, t) } else { select((b : Bool) => false) }
      #|  (P : (A) -> Bool) => {(x : A) | IN(x, (s : (A) -> Bool)) && P(x)}
      #|  \226\136\128 s : (A) -> Bool, (op_eq_us_c : (((A) -> Bool) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s), {(t : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(t, s)})
      #|  {(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}
      #|  \226\136\128 s : (A) -> Bool, (op_lt_us_c : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)(s, (op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s))
      #|  (op_caret_us_c : ((Bool) -> Bool, ((B, B)) -> Bool, ((B, B)) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (op_star_us_c : ((B) -> Bool, (B) -> Bool, (B, B)) -> Bool)((t : (B) -> Bool), t))
      #|  (op_caret_us_c : (((B) -> Bool) -> Bool, (B) -> Bool, (B, B) -> Bool) -> Bool)((op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (t : (B) -> Bool)), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (INFINITE : ((B) -> Bool) -> Bool)(t) && (op_lt_eq_us_c : ((Bool) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s) && (op_lt_eq_us_c : ((A) -> Bool, ((B) -> Bool) -> Bool) -> Bool)(s, (op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), t)) \226\134\146 (op_eq_us_c : (((B) -> A) -> Bool, ((B) -> Bool) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t), (op_caret_us_c : ((Bool) -> Bool, (B) -> Bool, (B) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), t))
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (((Num, Num)) -> Bool) -> Bool)
      #|  (UNIV : (Real) -> Bool)
      #|  (UNIV : ((Num, Num) -> Bool) -> Bool)
      #|  (s : (A) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (op_lt_eq_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) && (COUNTABLE : ((B) -> Bool) -> Bool)(t) \226\134\146 (op_lt_eq_us_c : (((B) -> A) -> Bool, (Real) -> Bool) -> Bool)((op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t), (UNIV : (Real) -> Bool))
      #|  (op_caret_us_c : ((Real) -> Bool, (A) -> Bool, (A) -> Real) -> Bool)((UNIV : (Real) -> Bool), {(a : A)})
      #|  \226\136\128 s : (A) -> Bool, (COUNTABLE : ((A) -> Bool) -> Bool)(s) && !(s == ({} : (A) -> Bool)) \226\134\146 (op_eq_us_c : (((A) -> Real) -> Bool, (Real) -> Bool) -> Bool)((op_caret_us_c : ((Real) -> Bool, (A) -> Bool, (A) -> Real) -> Bool)((UNIV : (Real) -> Bool), s), (UNIV : (Real) -> Bool))
      #|  (s : (A) -> Bool)
      #|  (t : (B) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (C) -> Bool, op_lt_eq_us_c(s, t) && op_lt_eq_us_c(t, u) && op_lt_eq_us_c(u, s) \226\134\146 op_eq_us_c(s, u) && op_eq_us_c(t, u)
      #|  (u : ((B, A)) -> Bool)
      #|  (u : ((B, A)) -> Bool)
      #|  IMAGE((p : ((B, A)) -> A))
      #|  (p : ((B, A)) -> A)
      #|  op_lt_eq_us_c(op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool)), s)
      #|  (FST : ((B, A)) -> B)
      #|  (R : ((B, A)) -> Bool)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  {(k : ((B, A)) -> Bool) | SUBSET(k, op_star_us_c((t : (B) -> Bool), (s : (A) -> Bool))) && op_eq_us_c(k, t)}
      #|  ({(a : _)} == {(b : _)}) == (a == b)
      #|  (x : A) => {x}
      #|  INFINITE((s : (A) -> Bool))
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (k : (A) -> Bool) == {}
      #|  (k : (A) -> Bool)
      #|  UNION({{}}, {(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool)) && !(k == {}) && op_lt_eq_us_c(k, (t : (B) -> Bool))})
      #|  (y : B) => if IN(y, (t : (B) -> Bool)) { (f : (B) -> A)(y) } else { select((y : A) => false) }
      #|  (f : (B) -> A)
      #|  (k : (A) -> Bool)
      #|  (f : (B) -> A) => IMAGE(f, (t : (B) -> Bool))
      #|  {(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool)) && !(k == {}) && op_lt_eq_us_c(k, (t : (B) -> Bool))}
      #|  (SUBSET((k : (_) -> Bool), (s : (_) -> Bool)) && k == {}) == (k == {})
      #|  (t : (B) -> Bool) == {}
      #|  (s : (A) -> Bool)
      #|  (k : (A) -> Bool)
      #|  ({(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | P(x)}) == (\226\136\128 x : _, P(x) \226\134\146 Q(x))
      #|  {(k : (A) -> Bool) | SUBSET(k, (s : (A) -> Bool))}
      #|  (k : (A) -> Bool)
      #|  (k : (A) -> Bool)
      #|  INFINITE((s : (A) -> Bool))
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) \226\134\146 (op_eq_us_c : (((A) -> Bool) -> Bool, ((B) -> A) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, if (op_lt_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s) { (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t) } else { ({} : ((B) -> A) -> Bool) })) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) \226\134\146 (if (op_lt_eq_us_c : ((B) -> Bool, (A) -> Bool) -> Bool)(t, s) { (op_eq_us_c : (((A) -> Bool) -> Bool, ((B) -> A) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, (op_caret_us_c : ((A) -> Bool, (B) -> Bool, (B) -> A) -> Bool)(s, t)) } else { (op_eq_us_c : (((A) -> Bool) -> Bool, ((A) -> Bool) -> Bool) -> Bool)({(k : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(k, s) && (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)(k, t)}, (op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), s)) }))
      #|  (op_caret_us_c : ((Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 op_eq_us_c({(t : (A) -> Bool) | SUBSET(t, s) && op_eq_us_c(t, s)}, {(t : (A) -> Bool) | SUBSET(t, s)})
      #|  op_caret_us_c((s : (A) -> Bool), op_plus_us_c({(b : B)}, (t : (B) -> Bool)))
      #|  INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)
      #|  op_star_us_c((s : (A) -> Bool), s)
      #|  (t : (B) -> Bool) == {}
      #|  (t : (B) -> Bool)
      #|  (b : B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(s) && FINITE(t) && !(t == {}) \226\134\146 op_eq_us_c(op_caret_us_c(s, t), s)
      #|  (x : A) => {x}
      #|  list_of_set((t : (A) -> Bool))
      #|  (t : (A) -> Bool)
      #|  (set_of_list : (List[A], A) -> Bool)
      #|  {(l : List[A]) | \226\136\128 x : A, MEM(x, l) \226\134\146 IN(x, (s : (A) -> Bool))}
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 op_eq_us_c({(t : (A) -> Bool) | SUBSET(t, s) && FINITE(t)}, s)
      #|  (p : Bool) && (p \226\134\146 (q : Bool)) \226\134\146 p && q
      #|  MAP((f : (A) -> B))
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c({(l : List[A]) | \226\136\128 x : A, MEM(x, l) \226\134\146 IN(x, s)}, {(l : List[B]) | \226\136\128 x : B, MEM(x, l) \226\134\146 IN(x, t)})
      #|  IMAGE((f : (A) -> B))
      #|  (f : (A) -> B)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) && (\226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(s) \226\134\146 (Q : ((B) -> Bool) -> Bool)(IMAGE(f, s))) \226\134\146 op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && P(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && Q(v)})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && FINITE(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && FINITE(v)})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s) && COUNTABLE(u)}, {(v : (B) -> Bool) | SUBSET(v, t) && COUNTABLE(v)})
      #|  {(x : (_) -> Bool) | SUBSET(x, (y : (_) -> Bool))} == {(x : (_) -> Bool) | SUBSET(x, y) && true}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_lt_eq_us_c(s, t) \226\134\146 op_lt_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s)}, {(v : (B) -> Bool) | SUBSET(v, t)})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_eq_us_c(s, t) \226\134\146 op_eq_us_c({(u : (A) -> Bool) | SUBSET(u, s)}, {(v : (B) -> Bool) | SUBSET(v, t)})
      #|  {(x : _) | true} == UNIV
      #|  \226\136\128 s : (A) -> Bool, COUNTABLE(s) \226\134\146 COUNTABLE({(l : List[A]) | \226\136\128 x : A, MEM(x, l) \226\134\146 IN(x, s)})
      #|  {(x : _) | true} == UNIV
      #|  (UNIV : (A) -> Bool)
      #|  (COUNTABLE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) \226\134\146 (COUNTABLE : ((List[A]) -> Bool) -> Bool)((UNIV : (List[A]) -> Bool))
      #|  {(x : _) | true} == UNIV
      #|  \226\136\128 s : (A) -> Bool, COUNTABLE(s) \226\134\146 COUNTABLE({(t : (A) -> Bool) | SUBSET(t, s) && FINITE(t)})
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (((Num, Num)) -> Bool) -> Bool)
      #|  (UNIV : ((Num, Num) -> Bool) -> Bool)
      #|  (op_eq_us_c : (((Num) -> Real) -> Bool, (Real) -> Bool) -> Bool)((UNIV : ((Num) -> Real) -> Bool), (UNIV : (Real) -> Bool))
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (Real) -> Bool)
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (Num) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, (INFINITE : ((A) -> Bool) -> Bool)(s) && (op_lt_eq_us_c : ((A) -> Bool, (Real) -> Bool) -> Bool)(s, (UNIV : (Real) -> Bool)) \226\134\146 (op_eq_us_c : (((A) -> Bool) -> Bool, (Real) -> Bool) -> Bool)({(t : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(t, s) && (COUNTABLE : ((A) -> Bool) -> Bool)(t)}, (UNIV : (Real) -> Bool))
      #|  (UNIV : (Real) -> Bool)
      #|  (op_eq_us_c : (((Real) -> Bool) -> Bool, (Real) -> Bool) -> Bool)({(s : (Real) -> Bool) | (COUNTABLE : ((Real) -> Bool) -> Bool)(s)}, (UNIV : (Real) -> Bool))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) \226\134\146 op_lt_eq_us_c(t, s)
      #|  (f : (A) -> B)((x : A)) == (k : (A) -> B)(x)
      #|  (x : A)
      #|  IMAGE((x : A) => (x, (f : (A) -> B)(x)), {(x : A) | !(f(x) == (k : (A) -> B)(x))})
      #|  (f : (A) -> B)
      #|  (u : ((A, B)) -> Bool) => (x : A) => if (\226\136\131 y : B, IN((x, y), u)) { select((y : B) => IN((x, y), u)) } else { (k : (A) -> B)(x) }
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, op_lt_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, {(u : ((A, B)) -> Bool) | SUBSET(u, CROSS(s, t)) && FINITE(u)})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, COUNTABLE(s) && COUNTABLE(t) \226\134\146 COUNTABLE({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, INFINITE(s) && !(t == {}) \226\134\146 op_lt_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, op_star_us_c(s, t))
      #|  {(a : A)}
      #|  (b : B)
      #|  (b : B) => (x : A) => if x == (a : A) { b } else { (k : (A) -> B)(x) }
      #|  \226\136\131 a : A, IN(a, (s : (A) -> Bool))
      #|  (a : A)
      #|  (a : A) => (x : A) => if x == a { (f : (A) -> B)(x) } else { (k : (A) -> B)(x) }
      #|  (f : (A) -> B)
      #|  \226\136\128 x : A, \226\136\131 y : B, IN(y, (t : (B) -> Bool)) && !((k : (A) -> B)(x) == y)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, INFINITE(s) && !(\226\136\131 a : B, SUBSET(t, {a})) && SUBSET(IMAGE(k, s), t) \226\134\146 op_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s) && FINITE({(x : A) | !(f(x) == k(x))})}, op_star_us_c(s, t))
      #|  (f : (A) -> B) => (x : A) => if IN(x, (s : (A) -> Bool)) { f(x) } else { (k : (A) -> B)(x) }
      #|  (f : (A) -> B) => (x : A) => if IN(x, (s : (A) -> Bool)) { f(x) } else { ARB }
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, op_eq_us_c({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s)}, op_caret_us_c(t, s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, cartesian_product(t, (i : B) => s) == op_caret_us_c(s, t)
      #|  (i : K)
      #|  (i : K)
      #|  (s : (K, A) -> Bool)
      #|  (k : (K) -> Bool)
      #|  (g : (K) -> A) => (i : K) => if IN(i, (k : (K) -> Bool)) { (f : (K, A) -> B)(i, g(i)) } else { ARB }
      #|  (f : (K, A) -> B)
      #|  \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, B) -> Bool, \226\136\128 k : (K) -> Bool, (\226\136\128 i : K, IN(i, k) \226\134\146 op_lt_eq_us_c(s(i), t(i))) \226\134\146 op_lt_eq_us_c(cartesian_product(k, s), cartesian_product(k, t))
      #|  \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, B) -> Bool, \226\136\128 k : (K) -> Bool, (\226\136\128 i : K, IN(i, k) \226\134\146 op_eq_us_c(s(i), t(i))) \226\134\146 op_eq_us_c(cartesian_product(k, s), cartesian_product(k, t))
      #|  (i : K) => if IN(i, (k : (K) -> Bool)) { (x : (K) -> A)(i) } else { (z : (K) -> A)(i) }
      #|  (x : (K) -> A)
      #|  (z : (K) -> A)
      #|  IMAGE((f : (K) -> A) => (i : K) => if IN(i, (k : (K) -> Bool)) { f(i) } else { ARB }, cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool)))
      #|  \226\136\128 s : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 l : (K) -> Bool, SUBSET(k, l) && !(cartesian_product(l, s) == {}) \226\134\146 op_lt_eq_us_c(cartesian_product(k, s), cartesian_product(l, s))
      #|  (f : (K) -> A)
      #|  {(f : (K) -> A) | SUBSET(IMAGE(f, (l : (K) -> Bool)), UNIONS({(s : (K, A) -> Bool)((i : K)) | IN(i, l)})) && SUBSET({(i : K) | !(f(i) == (if IN(i, (k : (K) -> Bool)) { (a : (K) -> A)(i) } else { ARB }))}, l)}
      #|  (i : K)
      #|  \226\136\131 a : (K) -> A, \226\136\128 i : K, IN(i, DIFF((k : (K) -> Bool), (l : (K) -> Bool))) \226\134\146 (s : (K, A) -> Bool)(i) == {a(i)}
      #|  (l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(\226\136\131 a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}
      #|  (j : K) => if j == (i : K) { (x : A) } else { (z : (K) -> A)(j) }
      #|  (x : A)
      #|  (z : (K) -> A)
      #|  IMAGE((x : (K) -> A) => x((i : K)), cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))
      #|  (i : K)
      #|  true
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (Real) -> Bool)
      #|  (cartesian_product : ((K) -> Bool, (K, Bool) -> Bool, (K) -> Bool) -> Bool)((l : (K) -> Bool), (i : K) => (UNIV : (Bool) -> Bool))
      #|  cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool))
      #|  (l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(\226\136\131 a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}
      #|  FINITE(cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  \226\136\128 s : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, FINITE(cartesian_product(k, s)) == (cartesian_product(k, s) == {} || FINITE({(i : K) | IN(i, k) && !(\226\136\131 a : A, SUBSET(s(i), {a}))}) && (\226\136\128 i : K, IN(i, k) \226\134\146 FINITE(s(i))))
      #|  FINITE((t : (_) -> Bool)) \226\134\146 (SUBSET((s : (_) -> Bool), t) && FINITE(s)) == SUBSET(s, t)
      #|  (f : (K) -> A)
      #|  {(f : (K) -> A) | SUBSET(IMAGE(f, (l : (K) -> Bool)), UNIONS({(s : (K, A) -> Bool)((i : K)) | IN(i, l)})) && SUBSET({(i : K) | !(f(i) == (if IN(i, (k : (K) -> Bool)) { (a : (K) -> A)(i) } else { ARB }))}, l) && FINITE({(i : K) | !(f(i) == (if IN(i, k) { a(i) } else { ARB }))})}
      #|  (i : K)
      #|  \226\136\131 a : (K) -> A, \226\136\128 i : K, IN(i, DIFF((k : (K) -> Bool), (l : (K) -> Bool))) \226\134\146 (s : (K, A) -> Bool)(i) == {a(i)}
      #|  (l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(\226\136\131 a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}
      #|  (j : K) => if j == (i : K) { (x : A) } else { (z : (K) -> A)(j) }
      #|  (x : A)
      #|  (z : (K) -> A)
      #|  IMAGE((x : (K) -> A) => x((i : K)), cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))
      #|  (i : K)
      #|  true
      #|  (UNIV : ((Num) -> Bool) -> Bool)
      #|  (UNIV : (Real) -> Bool)
      #|  (cartesian_product : ((K) -> Bool, (K, Bool) -> Bool, (K) -> Bool) -> Bool)((l : (K) -> Bool), (i : K) => (UNIV : (Bool) -> Bool))
      #|  cartesian_product((l : (K) -> Bool), (s : (K, A) -> Bool))
      #|  (l : (K) -> Bool) == {(i : K) | IN(i, (k : (K) -> Bool)) && !(\226\136\131 a : A, SUBSET((s : (K, A) -> Bool)(i), {a}))}
      #|  COUNTABLE(cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)))
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  \226\136\128 s : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, COUNTABLE(cartesian_product(k, s)) == (cartesian_product(k, s) == {} || FINITE({(i : K) | IN(i, k) && !(\226\136\131 a : A, SUBSET(s(i), {a}))}) && (\226\136\128 i : K, IN(i, k) \226\134\146 COUNTABLE(s(i))))
      #|  !((t : (_) -> Bool) == {}) \226\134\146 (\226\136\128 a : _, IN(a, t) \226\134\146 (P : Bool)) == P
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(\226\136\128 x : _, P(x) \226\134\146 !Q(x))
      #|  \226\136\131 a : A, SUBSET((s : (A) -> Bool), {a})
      #|  (t : (B) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(op_caret_us_c(s, t)) == ((\226\136\131 a : A, SUBSET(s, {a})) || t == {} || FINITE(s) && FINITE(t))
      #|  fn { ((f : (K) -> A), (g : (K) -> A)) => (x : K) => if (IN : (K, (K) -> Bool) -> Bool)(x, (k : (K) -> Bool)) { f(x) } else { g(x) } }
      #|  (f : (K) -> A) => (RESTRICTION((k : (K) -> Bool), f), RESTRICTION((l : (K) -> Bool), f))
      #|  \226\136\128 f : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 l : (K) -> Bool, DISJOINT(k, l) \226\134\146 op_eq_us_c(cartesian_product(UNION(k, l), f), CROSS(cartesian_product(k, f), cartesian_product(l, f)))
      #|sum_DISTINCT =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\a':'B. (#~:fun(bool,bool) ((#=:fun(sum('A,'B),fun(sum('A,'B),bool)) (#INL:fun('A,sum('A,'B)) a:'A)) (#INR:fun('B,sum('A,'B)) a':'B)))))))
      #|sum_INJECTIVE =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\a':'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(sum('A,'B),fun(sum('A,'B),bool)) (#INL:fun('A,sum('A,'B)) a:'A)) (#INL:fun('A,sum('A,'B)) a':'A))) ((#=:fun('A,fun('A,bool)) a:'A) a':'A))))))) (#forall:fun(fun('B,bool),bool) (\a:'B. (#forall:fun(fun('B,bool),bool) (\a':'B. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(sum('A,'B),fun(sum('A,'B),bool)) (#INR:fun('B,sum('A,'B)) a:'B)) (#INR:fun('B,sum('A,'B)) a':'B))) ((#=:fun('B,fun('B,bool)) a:'B) a':'B)))))))
      #|sum_CASES =  |- (#forall:fun(fun(sum('A,'B),bool),bool) (\x:sum('A,'B). ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(sum('A,'B),fun(sum('A,'B),bool)) x:sum('A,'B)) (#INL:fun('A,sum('A,'B)) a:'A))))) (#?:fun(fun('B,bool),bool) (\a:'B. ((#=:fun(sum('A,'B),fun(sum('A,'B),bool)) x:sum('A,'B)) (#INR:fun('B,sum('A,'B)) a:'B)))))))
      #|FORALL_SUM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(sum('?1,'?2),bool),bool) (\z:sum('?1,'?2). (P:fun(sum('?1,'?2),bool) z:sum('?1,'?2))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?1,bool),bool) (\x:'?1. (P:fun(sum('?1,'?2),bool) (#INL:fun('?1,sum('?1,'?2)) x:'?1))))) (#forall:fun(fun('?2,bool),bool) (\x:'?2. (P:fun(sum('?1,'?2),bool) (#INR:fun('?2,sum('?1,'?2)) x:'?2))))))
      #|EXISTS_SUM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(sum('?3,'?4),bool),bool) (\z:sum('?3,'?4). (P:fun(sum('?3,'?4),bool) z:sum('?3,'?4))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('?3,bool),bool) (\x:'?3. (P:fun(sum('?3,'?4),bool) (#INL:fun('?3,sum('?3,'?4)) x:'?3))))) (#?:fun(fun('?4,bool),bool) (\x:'?4. (P:fun(sum('?3,'?4),bool) (#INR:fun('?4,sum('?3,'?4)) x:'?4))))))
      #|FLATTEN_LEMMA =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('?5,bool),bool) (\x:'?5. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?5,fun(fun('?5,bool),bool)) x:'?5) s:fun('?5,bool))) ((#=:fun('?5,fun('?5,bool)) (g:fun('?6,'?5) (f:fun('?5,'?6) x:'?5))) x:'?5))))) (#forall:fun(fun('?6,bool),bool) (\y:'?6. (#forall:fun(fun('?5,bool),bool) (\x:'?5. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?5,fun(fun('?5,bool),bool)) x:'?5) s:fun('?5,bool))) ((#=:fun('?6,fun('?6,bool)) y:'?6) (f:fun('?5,'?6) x:'?5)))) ((#=:fun('?5,fun('?5,bool)) (g:fun('?6,'?5) y:'?6)) x:'?5)))))))
      #|TARSKI_SET =  |- (#forall:fun(fun(fun(fun('A,bool),fun('A,bool)),bool),bool) (\f:fun(fun('A,bool),fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(fun('A,bool),fun('A,bool)) s:fun('A,bool))) (f:fun(fun('A,bool),fun('A,bool)) t:fun('A,bool))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (f:fun(fun('A,bool),fun('A,bool)) s:fun('A,bool))) s:fun('A,bool)))))))
      #|INJECTIVE_LEFT_INVERSE_NONEMPTY =  |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('?7,bool),bool) (\x:'?7. ((#IN:fun('?7,fun(fun('?7,bool),bool)) x:'?7) s:fun('?7,bool))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('?7,bool),bool) (\x:'?7. (#forall:fun(fun('?7,bool),bool) (\y:'?7. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?7,fun(fun('?7,bool),bool)) x:'?7) s:fun('?7,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?7,fun(fun('?7,bool),bool)) y:'?7) s:fun('?7,bool))) ((#=:fun('?8,fun('?8,bool)) (f:fun('?7,'?8) x:'?7)) (f:fun('?7,'?8) y:'?7))))) ((#=:fun('?7,fun('?7,bool)) x:'?7) y:'?7))))))) (#?:fun(fun(fun('?8,'?7),bool),bool) (\g:fun('?8,'?7). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?8,bool),bool) (\y:'?8. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?8,fun(fun('?8,bool),bool)) y:'?8) t:fun('?8,bool))) ((#IN:fun('?7,fun(fun('?7,bool),bool)) (g:fun('?8,'?7) y:'?8)) s:fun('?7,bool)))))) (#forall:fun(fun('?7,bool),bool) (\x:'?7. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?7,fun(fun('?7,bool),bool)) x:'?7) s:fun('?7,bool))) ((#=:fun('?7,fun('?7,bool)) (g:fun('?8,'?7) (f:fun('?7,'?8) x:'?7))) x:'?7)))))))))
      #|BIJECTIVE_INJECTIVE_SURJECTIVE =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?9,bool),bool) (\x:'?9. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) x:'?9) s:fun('?9,bool))) ((#IN:fun('?10,fun(fun('?10,bool),bool)) (f:fun('?9,'?10) x:'?9)) t:fun('?10,bool)))))) (#forall:fun(fun('?10,bool),bool) (\y:'?10. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?10,fun(fun('?10,bool),bool)) y:'?10) t:fun('?10,bool))) (#?!:fun(fun('?9,bool),bool) (\x:'?9. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) x:'?9) s:fun('?9,bool))) ((#=:fun('?10,fun('?10,bool)) (f:fun('?9,'?10) x:'?9)) y:'?10))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?9,bool),bool) (\x:'?9. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) x:'?9) s:fun('?9,bool))) ((#IN:fun('?10,fun(fun('?10,bool),bool)) (f:fun('?9,'?10) x:'?9)) t:fun('?10,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?9,bool),bool) (\x:'?9. (#forall:fun(fun('?9,bool),bool) (\y:'?9. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) x:'?9) s:fun('?9,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) y:'?9) s:fun('?9,bool))) ((#=:fun('?10,fun('?10,bool)) (f:fun('?9,'?10) x:'?9)) (f:fun('?9,'?10) y:'?9))))) ((#=:fun('?9,fun('?9,bool)) x:'?9) y:'?9))))))) (#forall:fun(fun('?10,bool),bool) (\y:'?10. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?10,fun(fun('?10,bool),bool)) y:'?10) t:fun('?10,bool))) (#?:fun(fun('?9,bool),bool) (\x:'?9. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?9,fun(fun('?9,bool),bool)) x:'?9) s:fun('?9,bool))) ((#=:fun('?10,fun('?10,bool)) (f:fun('?9,'?10) x:'?9)) y:'?10))))))))))
      #|BIJECTIVE_INVERSES =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?11,bool),bool) (\x:'?11. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?11,fun(fun('?11,bool),bool)) x:'?11) s:fun('?11,bool))) ((#IN:fun('?12,fun(fun('?12,bool),bool)) (f:fun('?11,'?12) x:'?11)) t:fun('?12,bool)))))) (#forall:fun(fun('?12,bool),bool) (\y:'?12. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?12,fun(fun('?12,bool),bool)) y:'?12) t:fun('?12,bool))) (#?!:fun(fun('?11,bool),bool) (\x:'?11. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?11,fun(fun('?11,bool),bool)) x:'?11) s:fun('?11,bool))) ((#=:fun('?12,fun('?12,bool)) (f:fun('?11,'?12) x:'?11)) y:'?12))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?11,bool),bool) (\x:'?11. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?11,fun(fun('?11,bool),bool)) x:'?11) s:fun('?11,bool))) ((#IN:fun('?12,fun(fun('?12,bool),bool)) (f:fun('?11,'?12) x:'?11)) t:fun('?12,bool)))))) (#?:fun(fun(fun('?12,'?11),bool),bool) (\g:fun('?12,'?11). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?12,bool),bool) (\y:'?12. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?12,fun(fun('?12,bool),bool)) y:'?12) t:fun('?12,bool))) ((#IN:fun('?11,fun(fun('?11,bool),bool)) (g:fun('?12,'?11) y:'?12)) s:fun('?11,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?12,bool),bool) (\y:'?12. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?12,fun(fun('?12,bool),bool)) y:'?12) t:fun('?12,bool))) ((#=:fun('?12,fun('?12,bool)) (f:fun('?11,'?12) (g:fun('?12,'?11) y:'?12))) y:'?12))))) (#forall:fun(fun('?11,bool),bool) (\x:'?11. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?11,fun(fun('?11,bool),bool)) x:'?11) s:fun('?11,bool))) ((#=:fun('?11,fun('?11,bool)) (g:fun('?12,'?11) (f:fun('?11,'?12) x:'?11))) x:'?11))))))))))
      #|EQ_C_BIJECTIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))))))))))))
      #|EQ_C =  |- ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun(prod('A,'B),bool),bool),bool) (\R:fun(prod('A,'B),bool). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) (R:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?!:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (R:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (R:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)))))))))))))
      #|EQ_C_ALT =  |- ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun(prod('A,'B),bool),bool),bool) (\R:fun(prod('A,'B),bool). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?!:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (R:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (R:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))))))
      #|CARD_LE_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#<=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool))))
      #|CARD_EMPTY_LE =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) #EMPTY:fun('A,bool)) s:fun('B,bool))))
      #|CARD_LE_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))))))))
      #|CARD_LT_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#<_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool)))))
      #|CARD_LET_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))) ((#<_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))))))))
      #|CARD_LTE_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))) ((#<_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))))))))
      #|CARD_LT_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))) ((#<_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))))))))
      #|CARD_EQ_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool))))
      #|CARD_EQ_REFL_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))
      #|CARD_EQ_SYM =  |- (#forall:fun(fun(fun('?13,bool),bool),bool) (\s:fun('?13,bool). (#forall:fun(fun(fun('?14,bool),bool),bool) (\t:fun('?14,bool). ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('?13,bool),fun(fun('?14,bool),bool)) s:fun('?13,bool)) t:fun('?14,bool))) ((#=_c:fun(fun('?14,bool),fun(fun('?13,bool),bool)) t:fun('?14,bool)) s:fun('?13,bool)))))))
      #|CARD_EQ_IMP_LE =  |- (#forall:fun(fun(fun('?15,bool),bool),bool) (\s:fun('?15,bool). (#forall:fun(fun(fun('?16,bool),bool),bool) (\t:fun('?16,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('?15,bool),fun(fun('?16,bool),bool)) s:fun('?15,bool)) t:fun('?16,bool))) ((#<=_c:fun(fun('?15,bool),fun(fun('?16,bool),bool)) s:fun('?15,bool)) t:fun('?16,bool)))))))
      #|CARD_LT_IMP_LE =  |- (#forall:fun(fun(fun('?17,bool),bool),bool) (\s:fun('?17,bool). (#forall:fun(fun(fun('?18,bool),bool),bool) (\t:fun('?18,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('?17,bool),fun(fun('?18,bool),bool)) s:fun('?17,bool)) t:fun('?18,bool))) ((#<=_c:fun(fun('?17,bool),fun(fun('?18,bool),bool)) s:fun('?17,bool)) t:fun('?18,bool)))))))
      #|CARD_LE_RELATIONAL =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('B,bool),bool) (\y':'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('B,bool)) x:'A) y:'B)) ((R:fun('A,fun('B,bool)) x:'A) y':'B)))) ((#=:fun('B,fun('B,bool)) y:'B) y':'B))))))))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%1:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%1:'B) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B))))) y:'B)))))) s:fun('A,bool)))))
      #|CARD_LE_RELATIONAL_FULL =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((R:fun('A,fun('B,bool)) x:'A) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('B,bool),bool) (\y':'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y':'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('B,bool)) x:'A) y:'B)) ((R:fun('A,fun('B,bool)) x:'A) y':'B)))))) ((#=:fun('B,fun('B,bool)) y:'B) y':'B)))))))))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))))
      #|CARD_LE_EMPTY =  |- (#forall:fun(fun(fun('?19,bool),bool),bool) (\s:fun('?19,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('?19,bool),fun(fun('?20,bool),bool)) s:fun('?19,bool)) #EMPTY:fun('?20,bool))) ((#=:fun(fun('?19,bool),fun(fun('?19,bool),bool)) s:fun('?19,bool)) #EMPTY:fun('?19,bool)))))
      #|CARD_EQ_EMPTY =  |- (#forall:fun(fun(fun('?21,bool),bool),bool) (\s:fun('?21,bool). ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('?21,bool),fun(fun('?22,bool),bool)) s:fun('?21,bool)) #EMPTY:fun('?22,bool))) ((#=:fun(fun('?21,bool),fun(fun('?21,bool),bool)) s:fun('?21,bool)) #EMPTY:fun('?21,bool)))))
      #|CARD_LE_ANTISYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LE_TOTAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#\/:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_LET_TOTAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#\/:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_LTE_TOTAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#\/:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_LT_TOTAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#\/:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool))))))))
      #|CARD_NOT_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#<_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_NOT_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_LT_LE =  |- (#forall:fun(fun(fun('?23,bool),bool),bool) (\s:fun('?23,bool). (#forall:fun(fun(fun('?24,bool),bool),bool) (\t:fun('?24,bool). ((#=:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('?23,bool),fun(fun('?24,bool),bool)) s:fun('?23,bool)) t:fun('?24,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('?23,bool),fun(fun('?24,bool),bool)) s:fun('?23,bool)) t:fun('?24,bool))) (#~:fun(bool,bool) ((#=_c:fun(fun('?23,bool),fun(fun('?24,bool),bool)) s:fun('?23,bool)) t:fun('?24,bool)))))))))
      #|CARD_LE_LT =  |- (#forall:fun(fun(fun('?25,bool),bool),bool) (\s:fun('?25,bool). (#forall:fun(fun(fun('?26,bool),bool),bool) (\t:fun('?26,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('?25,bool),fun(fun('?26,bool),bool)) s:fun('?25,bool)) t:fun('?26,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('?25,bool),fun(fun('?26,bool),bool)) s:fun('?25,bool)) t:fun('?26,bool))) ((#=_c:fun(fun('?25,bool),fun(fun('?26,bool),bool)) s:fun('?25,bool)) t:fun('?26,bool))))))))
      #|CARD_LE_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) t:fun('C,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('D,bool),bool)) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_LT_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) t:fun('C,bool))) ((#<_c:fun(fun('B,bool),fun(fun('D,bool),bool)) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_EQ_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))))))))
      #|CARD_EQ_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) t:fun('C,bool))) ((#=_c:fun(fun('B,bool),fun(fun('D,bool),bool)) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|INFINITE_CARD_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun(num,bool),fun(fun('A,bool),bool)) #UNIV:fun(num,bool)) s:fun('A,bool)))))
      #|FINITE_CARD_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<_c:fun(fun('A,bool),fun(fun(num,bool),bool)) s:fun('A,bool)) #UNIV:fun(num,bool)))))
      #|CARD_LE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))
      #|CARD_LE_UNIV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#<=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool))))
      #|CARD_LE_EQ_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) u:fun('B,bool)) t:fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) u:fun('B,bool))))))))))
      #|CARD_LE_EQ_SUBSET_UNIV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool))))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) #UNIV:fun('B,bool)))))
      #|CARD_INFINITE_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))
      #|CARD_FINITE_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))
      #|CARD_LE_FINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|CARD_EQ_FINITE =  |- (#forall:fun(fun(fun('?27,bool),bool),bool) (\s:fun('?27,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#=_c:fun(fun('?27,bool),fun(fun('A,bool),bool)) s:fun('?27,bool)) t:fun('A,bool)))) (#FINITE:fun(fun('?27,bool),bool) s:fun('?27,bool)))))))
      #|CARD_EQ_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|CARD_LE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))))))
      #|CARD_LT_FINITE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LE_FINITE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LE_CARD_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))))))))
      #|CARD_EQ_CARD_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))))))))
      #|CARD_LE_CARD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|CARD_EQ_CARD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|CARD_LT_CARD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|CARD_HAS_SIZE_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num)))))))))
      #|NUMSEG_CARD_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(num,bool),fun(fun('A,bool),bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) s:fun('A,bool))) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) n:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))
      #|CARD_LE_IMAGE =  |- (#forall:fun(fun(fun('?28,'?29),bool),bool) (\f:fun('?28,'?29). (#forall:fun(fun(fun('?28,bool),bool),bool) (\s:fun('?28,bool). ((#<=_c:fun(fun('?29,bool),fun(fun('?28,bool),bool)) ((#IMAGE:fun(fun('?28,'?29),fun(fun('?28,bool),fun('?29,bool))) f:fun('?28,'?29)) s:fun('?28,bool))) s:fun('?28,bool))))))
      #|CARD_LE_IMAGE_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))))
      #|CARD_EQ_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) s:fun('A,bool)))))))
      #|CARD_GE_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%2:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%2:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))))))))))
      #|CARD_LE_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) y:'A)) t:fun('B,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%3:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%3:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))) t:fun('B,bool)))))))))
      #|CARD_EQ_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) y:'A)) t:fun('B,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%4:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%4:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))) t:fun('B,bool)))))))))
      #|CARD_LE_IMAGES =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) g:fun('A,'C)) s:fun('A,bool))))))))))
      #|CARD_EQ_IMAGES =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))))))) ((#=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) g:fun('A,'C)) s:fun('A,bool))))))))))
      #|LE_C_IMAGE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) (#?:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) f:fun('B,'A)) t:fun('B,bool))) s:fun('A,bool))))))))))
      #|LE_C_IMAGE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) f:fun('B,'A)) t:fun('B,bool))))))))))
      #|CARD_LE_SING =  |- (#forall:fun(fun('B,bool),bool) (\c:'B. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) c:'B) #EMPTY:fun('B,bool)))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))))))))))
      #|CARD_SING_LE =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))) s:fun('B,bool))) (#~:fun(bool,bool) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) #EMPTY:fun('B,bool))))))))
      #|CARD_EQ_ORDINAL_EXISTS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) s:fun('A,bool)))))))
      #|WF_CARD_LT =  |- (#WF:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),bool) #<_c:fun(fun('A,bool),fun(fun('A,bool),bool)))
      #|add_c =  |- (#forall:fun(fun(fun('?30,bool),bool),bool) (\s:fun('?30,bool). (#forall:fun(fun(fun('?31,bool),bool),bool) (\t:fun('?31,bool). ((#=:fun(fun(sum('?30,'?31),bool),fun(fun(sum('?30,'?31),bool),bool)) ((#+_c:fun(fun('?30,bool),fun(fun('?31,bool),fun(sum('?30,'?31),bool))) s:fun('?30,bool)) t:fun('?31,bool))) ((#UNION:fun(fun(sum('?30,'?31),bool),fun(fun(sum('?30,'?31),bool),fun(sum('?30,'?31),bool))) (#GSPEC:fun(fun(sum('?30,'?31),bool),fun(sum('?30,'?31),bool)) (\GEN%PVAR%5:sum('?30,'?31). (#?:fun(fun('?30,bool),bool) (\x:'?30. (((#SETSPEC:fun(sum('?30,'?31),fun(bool,fun(sum('?30,'?31),bool))) GEN%PVAR%5:sum('?30,'?31)) ((#IN:fun('?30,fun(fun('?30,bool),bool)) x:'?30) s:fun('?30,bool))) (#INL:fun('?30,sum('?30,'?31)) x:'?30))))))) (#GSPEC:fun(fun(sum('?30,'?31),bool),fun(sum('?30,'?31),bool)) (\GEN%PVAR%6:sum('?30,'?31). (#?:fun(fun('?31,bool),bool) (\y:'?31. (((#SETSPEC:fun(sum('?30,'?31),fun(bool,fun(sum('?30,'?31),bool))) GEN%PVAR%6:sum('?30,'?31)) ((#IN:fun('?31,fun(fun('?31,bool),bool)) y:'?31) t:fun('?31,bool))) (#INR:fun('?31,sum('?30,'?31)) y:'?31))))))))))))
      #|mul_c =  |- (#forall:fun(fun(fun('?32,bool),bool),bool) (\s:fun('?32,bool). (#forall:fun(fun(fun('?33,bool),bool),bool) (\t:fun('?33,bool). ((#=:fun(fun(prod('?32,'?33),bool),fun(fun(prod('?32,'?33),bool),bool)) ((#*_c:fun(fun('?32,bool),fun(fun('?33,bool),fun(prod('?32,'?33),bool))) s:fun('?32,bool)) t:fun('?33,bool))) (#GSPEC:fun(fun(prod('?32,'?33),bool),fun(prod('?32,'?33),bool)) (\GEN%PVAR%7:prod('?32,'?33). (#?:fun(fun('?32,bool),bool) (\x:'?32. (#?:fun(fun('?33,bool),bool) (\y:'?33. (((#SETSPEC:fun(prod('?32,'?33),fun(bool,fun(prod('?32,'?33),bool))) GEN%PVAR%7:prod('?32,'?33)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?32,fun(fun('?32,bool),bool)) x:'?32) s:fun('?32,bool))) ((#IN:fun('?33,fun(fun('?33,bool),bool)) y:'?33) t:fun('?33,bool)))) ((#,:fun('?32,fun('?33,prod('?32,'?33))) x:'?32) y:'?33)))))))))))))
      #|CARD_LE_ADD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#<=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'D),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('D,bool),fun(sum('B,'D),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_LE_MUL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#<=_c:fun(fun(prod('A,'C),bool),fun(fun(prod('B,'D),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('C,bool),fun(prod('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#*_c:fun(fun('B,bool),fun(fun('D,bool),fun(prod('B,'D),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_FUNSPACE_LE =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('A',bool),bool)) #UNIV:fun('A,bool)) #UNIV:fun('A',bool))) ((#<=_c:fun(fun('B,bool),fun(fun('B',bool),bool)) #UNIV:fun('B,bool)) #UNIV:fun('B',bool)))) ((#<=_c:fun(fun(fun('A,'B),bool),fun(fun(fun('A','B'),bool),bool)) #UNIV:fun(fun('A,'B),bool)) #UNIV:fun(fun('A','B'),bool)))
      #|CARD_ADD_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'D),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('D,bool),fun(sum('B,'D),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_MUL_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=_c:fun(fun(prod('A,'C),bool),fun(fun(prod('B,'D),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('C,bool),fun(prod('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#*_c:fun(fun('B,bool),fun(fun('D,bool),fun(prod('B,'D),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_FUNSPACE_CONG =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('A',bool),bool)) #UNIV:fun('A,bool)) #UNIV:fun('A',bool))) ((#=_c:fun(fun('B,bool),fun(fun('B',bool),bool)) #UNIV:fun('B,bool)) #UNIV:fun('B',bool)))) ((#=_c:fun(fun(fun('A,'B),bool),fun(fun(fun('A','B'),bool),bool)) #UNIV:fun(fun('A,'B),bool)) #UNIV:fun(fun('A','B'),bool)))
      #|MUL_C_UNIV =  |- ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) #UNIV:fun('A,bool)) #UNIV:fun('B,bool))) #UNIV:fun(prod('A,'B),bool))
      #|CARD_FUNSPACE_CURRY =  |- ((#=_c:fun(fun(fun('A,fun('B,'C)),bool),fun(fun(fun(prod('A,'B),'C),bool),bool)) #UNIV:fun(fun('A,fun('B,'C)),bool)) #UNIV:fun(fun(prod('A,'B),'C),bool))
      #|IN_CARD_ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?34,bool),bool) (\x:'?34. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(sum('?34,'?35),fun(fun(sum('?34,'?35),bool),bool)) (#INL:fun('?34,sum('?34,'?35)) x:'?34)) ((#+_c:fun(fun('?34,bool),fun(fun('?35,bool),fun(sum('?34,'?35),bool))) s:fun('?34,bool)) t:fun('?35,bool)))) ((#IN:fun('?34,fun(fun('?34,bool),bool)) x:'?34) s:fun('?34,bool)))))) (#forall:fun(fun('?35,bool),bool) (\y:'?35. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(sum('?34,'?35),fun(fun(sum('?34,'?35),bool),bool)) (#INR:fun('?35,sum('?34,'?35)) y:'?35)) ((#+_c:fun(fun('?34,bool),fun(fun('?35,bool),fun(sum('?34,'?35),bool))) s:fun('?34,bool)) t:fun('?35,bool)))) ((#IN:fun('?35,fun(fun('?35,bool),bool)) y:'?35) t:fun('?35,bool))))))
      #|IN_CARD_MUL =  |- (#forall:fun(fun(fun('?36,bool),bool),bool) (\s:fun('?36,bool). (#forall:fun(fun(fun('?37,bool),bool),bool) (\t:fun('?37,bool). (#forall:fun(fun('?36,bool),bool) (\x:'?36. (#forall:fun(fun('?37,bool),bool) (\y:'?37. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod('?36,'?37),fun(fun(prod('?36,'?37),bool),bool)) ((#,:fun('?36,fun('?37,prod('?36,'?37))) x:'?36) y:'?37)) ((#*_c:fun(fun('?36,bool),fun(fun('?37,bool),fun(prod('?36,'?37),bool))) s:fun('?36,bool)) t:fun('?37,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?36,fun(fun('?36,bool),bool)) x:'?36) s:fun('?36,bool))) ((#IN:fun('?37,fun(fun('?37,bool),bool)) y:'?37) t:fun('?37,bool))))))))))))
      #|CARD_LE_SQUARE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#<=_c:fun(fun('A,bool),fun(fun(prod('A,'A),bool),bool)) s:fun('A,bool)) ((#*_c:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) s:fun('A,bool)))))
      #|CARD_SQUARE_NUM =  |- ((#=_c:fun(fun(prod(num,num),bool),fun(fun(num,bool),bool)) ((#*_c:fun(fun(num,bool),fun(fun(num,bool),fun(prod(num,num),bool))) #UNIV:fun(num,bool)) #UNIV:fun(num,bool))) #UNIV:fun(num,bool))
      #|UNION_LE_ADD_C =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#<=_c:fun(fun('A,bool),fun(fun(sum('A,'A),bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#+_c:fun(fun('A,bool),fun(fun('A,bool),fun(sum('A,'A),bool))) s:fun('A,bool)) t:fun('A,bool)))))))
      #|CARD_ADD_C =  |- (#forall:fun(fun(fun('?38,bool),bool),bool) (\s:fun('?38,bool). (#forall:fun(fun(fun('?39,bool),bool),bool) (\t:fun('?39,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?38,bool),bool) s:fun('?38,bool))) (#FINITE:fun(fun('?39,bool),bool) t:fun('?39,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(sum('?38,'?39),bool),num) ((#+_c:fun(fun('?38,bool),fun(fun('?39,bool),fun(sum('?38,'?39),bool))) s:fun('?38,bool)) t:fun('?39,bool)))) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('?38,bool),num) s:fun('?38,bool))) (#CARD:fun(fun('?39,bool),num) t:fun('?39,bool)))))))))
      #|CARD_MUL_C =  |- (#forall:fun(fun(fun('?40,bool),bool),bool) (\s:fun('?40,bool). (#forall:fun(fun(fun('?41,bool),bool),bool) (\t:fun('?41,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?40,bool),bool) s:fun('?40,bool))) (#FINITE:fun(fun('?41,bool),bool) t:fun('?41,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(prod('?40,'?41),bool),num) ((#*_c:fun(fun('?40,bool),fun(fun('?41,bool),fun(prod('?40,'?41),bool))) s:fun('?40,bool)) t:fun('?41,bool)))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('?40,bool),num) s:fun('?40,bool))) (#CARD:fun(fun('?41,bool),num) t:fun('?41,bool)))))))))
      #|CARD_ADD_SYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun(sum('A,'B),bool),fun(fun(sum('B,'A),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#+_c:fun(fun('B,bool),fun(fun('A,bool),fun(sum('B,'A),bool))) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_ADD_ASSOC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(sum('A,sum('B,'C)),bool),fun(fun(sum(sum('A,'B),'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun(sum('B,'C),bool),fun(sum('A,sum('B,'C)),bool))) s:fun('A,bool)) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#+_c:fun(fun(sum('A,'B),bool),fun(fun('C,bool),fun(sum(sum('A,'B),'C),bool))) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_MUL_SYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun(prod('A,'B),bool),fun(fun(prod('B,'A),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#*_c:fun(fun('B,bool),fun(fun('A,bool),fun(prod('B,'A),bool))) t:fun('B,bool)) s:fun('A,bool)))))))
      #|CARD_MUL_ASSOC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(prod('A,prod('B,'C)),bool),fun(fun(prod(prod('A,'B),'C),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun(prod('B,'C),bool),fun(prod('A,prod('B,'C)),bool))) s:fun('A,bool)) ((#*_c:fun(fun('B,bool),fun(fun('C,bool),fun(prod('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#*_c:fun(fun(prod('A,'B),bool),fun(fun('C,bool),fun(prod(prod('A,'B),'C),bool))) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_LDISTRIB =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(prod('A,sum('B,'C)),bool),fun(fun(sum(prod('A,'B),prod('A,'C)),bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun(sum('B,'C),bool),fun(prod('A,sum('B,'C)),bool))) s:fun('A,bool)) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#+_c:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'C),bool),fun(sum(prod('A,'B),prod('A,'C)),bool))) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#*_c:fun(fun('A,bool),fun(fun('C,bool),fun(prod('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))))))))))
      #|CARD_RDISTRIB =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(prod(sum('A,'B),'C),bool),fun(fun(sum(prod('A,'C),prod('B,'C)),bool),bool)) ((#*_c:fun(fun(sum('A,'B),bool),fun(fun('C,bool),fun(prod(sum('A,'B),'C),bool))) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool))) ((#+_c:fun(fun(prod('A,'C),bool),fun(fun(prod('B,'C),bool),fun(sum(prod('A,'C),prod('B,'C)),bool))) ((#*_c:fun(fun('A,bool),fun(fun('C,bool),fun(prod('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#*_c:fun(fun('B,bool),fun(fun('C,bool),fun(prod('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool))))))))))
      #|CARD_LE_ADDR =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#<=_c:fun(fun('A,bool),fun(fun(sum('A,'B),bool),bool)) s:fun('A,bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LE_ADDL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#<=_c:fun(fun('B,bool),fun(fun(sum('A,'B),bool),bool)) t:fun('B,bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_MUL_LID =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun(prod('A,'B),bool),fun(fun('B,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))) t:fun('B,bool))) t:fun('B,bool))))))
      #|CARD_MUL_RID =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#=_c:fun(fun(prod('A,'B),bool),fun(fun('A,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) b:'B) #EMPTY:fun('B,bool)))) s:fun('A,bool))))))
      #|CARD_ADD_LE_MUL_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun(sum('A,'A),bool),fun(fun(prod('A,'A),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('A,bool),fun(sum('A,'A),bool))) s:fun('A,bool)) s:fun('A,bool))) ((#*_c:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) s:fun('A,bool))))))
      #|CARD_DISJOINT_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))) ((#=_c:fun(fun('A,bool),fun(fun(sum('A,'A),bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#+_c:fun(fun('A,bool),fun(fun('A,bool),fun(sum('A,'A),bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|CARD_LE_EXISTS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=_c:fun(fun('B,bool),fun(fun(sum('A,'B),bool),bool)) t:fun('B,bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))))))))))
      #|CARD_LT_IMP_SUC_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun('C,bool),bool) (\a:'C. ((#==>:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun(sum('A,'C),bool),fun(fun('B,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) ((#INSERT:fun('C,fun(fun('C,bool),fun('C,bool))) a:'C) #EMPTY:fun('C,bool)))) t:fun('B,bool)))))))))
      #|CARD_SQUARE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) k:fun('A,bool))) ((#=_c:fun(fun(prod('A,'A),bool),fun(fun('A,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) k:fun('A,bool)) k:fun('A,bool))) k:fun('A,bool)))))
      #|CARD_ADD_FINITE =  |- (#forall:fun(fun(fun('?42,bool),bool),bool) (\s:fun('?42,bool). (#forall:fun(fun(fun('?43,bool),bool),bool) (\t:fun('?43,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?42,bool),bool) s:fun('?42,bool))) (#FINITE:fun(fun('?43,bool),bool) t:fun('?43,bool)))) (#FINITE:fun(fun(sum('?42,'?43),bool),bool) ((#+_c:fun(fun('?42,bool),fun(fun('?43,bool),fun(sum('?42,'?43),bool))) s:fun('?42,bool)) t:fun('?43,bool))))))))
      #|CARD_ADD_FINITE_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(sum('A,'B),bool),bool) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))
      #|CARD_MUL_FINITE =  |- (#forall:fun(fun(fun('?44,bool),bool),bool) (\s:fun('?44,bool). (#forall:fun(fun(fun('?45,bool),bool),bool) (\t:fun('?45,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?44,bool),bool) s:fun('?44,bool))) (#FINITE:fun(fun('?45,bool),bool) t:fun('?45,bool)))) (#FINITE:fun(fun(prod('?44,'?45),bool),bool) ((#*_c:fun(fun('?44,bool),fun(fun('?45,bool),fun(prod('?44,'?45),bool))) s:fun('?44,bool)) t:fun('?45,bool))))))))
      #|CARD_MUL_FINITE_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod('A,'B),bool),bool) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))))
      #|CARD_MUL_ABSORB_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#<=_c:fun(fun(prod('A,'B),bool),fun(fun('B,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) t:fun('B,bool)))))))
      #|CARD_MUL2_ABSORB_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))) ((#<=_c:fun(fun(prod('A,'B),bool),fun(fun('C,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_MUL2_ABSORB_LE_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))) ((#<=_c:fun(fun(prod('A,'B),bool),fun(fun('C,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_ADD_ABSORB_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#<=_c:fun(fun(sum('A,'B),bool),fun(fun('B,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) t:fun('B,bool)))))))
      #|CARD_ADD2_ABSORB_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))) ((#<=_c:fun(fun(sum('A,'B),bool),fun(fun('C,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_MUL_ABSORB =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))))) ((#=_c:fun(fun(prod('A,'B),bool),fun(fun('B,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) t:fun('B,bool)))))))
      #|CARD_ADD_ABSORB_LEFT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))) ((#=_c:fun(fun(sum('A,'B),bool),fun(fun('B,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) t:fun('B,bool)))))))
      #|CARD_ADD_ABSORB_RIGHT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))) ((#=_c:fun(fun(sum('A,'B),bool),fun(fun('A,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) s:fun('A,bool)))))))
      #|CARD_UNION_ABSORB_LEFT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) t:fun('A,bool)))))))
      #|CARD_UNION_ABSORB_RIGHT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool)))))))
      #|CARD_ADD2_ABSORB_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))) ((#<_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))) ((#<_c:fun(fun(sum('A,'B),bool),fun(fun('C,bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_DIFF_ABSORB =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<_c:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool)))))))
      #|CARD_LT_ADD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#<_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#<_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'D),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('D,bool),fun(sum('B,'D),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_LE_ADD_LCANCEL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))) ((#<=_c:fun(fun(sum('A,'B),bool),fun(fun(sum('A,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))))))))
      #|CARD_LE_ADD_LCANCEL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(sum('A,'B),bool),fun(fun(sum('A,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))))))))
      #|CARD_LE_ADD_RCANCEL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('B,bool),bool)) u:fun('C,bool)) t:fun('B,bool)))) ((#<=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool))))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))))
      #|CARD_LE_ADD_RCANCEL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('B,bool),bool)) u:fun('C,bool)) t:fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))))))))))
      #|CARD_EQ_ADD_LCANCEL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))))) ((#=_c:fun(fun(sum('A,'B),bool),fun(fun(sum('A,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))))) ((#=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool)))))))))
      #|CARD_EQ_ADD_LCANCEL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) u:fun('C,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun(sum('A,'B),bool),fun(fun(sum('A,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool)))) ((#=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) u:fun('C,bool))))))))))
      #|CARD_EQ_ADD_RCANCEL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('C,bool),fun(fun('A,bool),bool)) u:fun('C,bool)) s:fun('A,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('B,bool),bool)) u:fun('C,bool)) t:fun('B,bool))))) ((#=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool))))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))))
      #|CARD_EQ_ADD_RCANCEL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('C,bool),bool) u:fun('C,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('C,bool),fun(fun('A,bool),bool)) u:fun('C,bool)) s:fun('A,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('B,bool),bool)) u:fun('C,bool)) t:fun('B,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun(sum('A,'C),bool),fun(fun(sum('B,'C),bool),bool)) ((#+_c:fun(fun('A,bool),fun(fun('C,bool),fun(sum('A,'C),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))))))))))
      #|CARD_LE_UNIONS2 =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\k:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\l:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool)) u:fun(fun('A,bool),bool)) k:fun('B,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) ((#<=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) s:fun('A,bool)) l:fun('C,bool))))))) ((#<=_c:fun(fun('A,bool),fun(fun(prod('B,'C),bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) ((#*_c:fun(fun('B,bool),fun(fun('C,bool),fun(prod('B,'C),bool))) k:fun('B,bool)) l:fun('C,bool))))))))))
      #|CARD_LE_UNIONS =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\k:fun('B,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) k:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool)) u:fun(fun('A,bool),bool)) k:fun('B,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) k:fun('B,bool)))))))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) k:fun('B,bool)))))))
      #|CARD_LE_DISJOINT_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) u:fun('A,bool))))))) ((#<=_c:fun(fun(prod(fun('A,bool),'B),bool),fun(fun('A,bool),bool)) ((#*_c:fun(fun(fun('A,bool),bool),fun(fun('B,bool),fun(prod(fun('A,bool),'B),bool))) s:fun(fun('A,bool),bool)) t:fun('B,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))))))))
      #|CARD_EQ_DISJOINT_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) u:fun('A,bool)) t:fun('B,bool))))))) ((#=_c:fun(fun('A,bool),fun(fun(prod(fun('A,bool),'B),bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) ((#*_c:fun(fun(fun('A,bool),bool),fun(fun('B,bool),fun(prod(fun('A,bool),'B),bool))) s:fun(fun('A,bool),bool)) t:fun('B,bool))))))))
      #|CARD_EQ_IMAGE_MUL_FIBRES =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=_c:fun(fun('A,bool),fun(fun('C,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%8:'A. (#?:fun(fun('A,bool),bool) (\z:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%8:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) z:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) z:'A)) (f:fun('A,'B) x:'A)))) z:'A)))))) t:fun('C,bool)))))) ((#=_c:fun(fun(prod('B,'C),bool),fun(fun('A,bool),bool)) ((#*_c:fun(fun('B,bool),fun(fun('C,bool),fun(prod('B,'C),bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('C,bool))) s:fun('A,bool)))))))))
      #|CARD_DIFF_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s':fun('A,bool)) t':fun('B,bool))) ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool)))))))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool))))))))))))
      #|EQ_C_BIJECTIONS_DISJOINT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#DISJOINT:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s':fun('A,bool)) t':fun('B,bool)))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t':fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s':fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B))))))))))))))))))))))
      #|EQ_C_BIJECTIONS_SUBSETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s':fun('A,bool)) t':fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))) t':fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) g:fun('B,'A)) t':fun('B,bool))) s':fun('A,bool)))))))))))))))))))
      #|EQ_C_BIJECTIONS_SUBSETS_LT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) t:fun('B,bool))) ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool)))))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s':fun('A,bool)) t':fun('B,bool)))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))) t':fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) g:fun('B,'A)) t':fun('B,bool))) s':fun('A,bool)))))))))))))))))))
      #|EQ_C_BIJECTIONS_EXTEND =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s':fun('A,bool)) s:fun('A,bool))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t':fun('B,bool)) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f':fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g':fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f':fun('A,'B) x:'A)) t':fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g':fun('B,'A) (f':fun('A,'B) x:'A))) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t':fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g':fun('B,'A) y:'B)) s':fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f':fun('A,'B) (g':fun('B,'A) y:'B))) y:'B)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f':fun('A,'B) x:'A)) (f:fun('A,'B) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g':fun('B,'A) y:'B)) (g:fun('B,'A) y:'B)))))))))))))))))))))))))
      #|EQ_C_INVOLUTION =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('A,'A) x:'A)) t:fun('A,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('A,'A) x:'A)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) x:'A))) x:'A))))))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))))
      #|CARD_MUL_LT_LEMMA =  |- (#forall:fun(fun(fun('?46,bool),bool),bool) (\s:fun('?46,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('?47,bool),bool),bool) (\u:fun('?47,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('?46,bool),fun(fun('B,bool),bool)) s:fun('?46,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('B,bool),fun(fun('?47,bool),bool)) t:fun('B,bool)) u:fun('?47,bool))) (#INFINITE:fun(fun('?47,bool),bool) u:fun('?47,bool))))) ((#<_c:fun(fun(prod('?46,'B),bool),fun(fun('?47,bool),bool)) ((#*_c:fun(fun('?46,bool),fun(fun('B,bool),fun(prod('?46,'B),bool))) s:fun('?46,bool)) t:fun('B,bool))) u:fun('?47,bool)))))))))
      #|CARD_MUL_LT_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('?48,bool),bool),bool) (\u:fun('?48,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('?48,bool),bool)) s:fun('A,bool)) u:fun('?48,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('B,bool),fun(fun('?48,bool),bool)) t:fun('B,bool)) u:fun('?48,bool))) (#INFINITE:fun(fun('?48,bool),bool) u:fun('?48,bool))))) ((#<_c:fun(fun(prod('A,'B),bool),fun(fun('?48,bool),bool)) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('?48,bool)))))))))
      #|CANTOR_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#<_c:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%9:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%9:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool)))))))))
      #|CANTOR_THM_UNIV =  |- ((#<_c:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) #UNIV:fun('A,bool)) #UNIV:fun(fun('A,bool),bool))
      #|NUM_COUNTABLE =  |- (#COUNTABLE:fun(fun(num,bool),bool) #UNIV:fun(num,bool))
      #|COUNTABLE_ALT =  |- (#forall:fun(fun(fun('?49,bool),bool),bool) (\s:fun('?49,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?49,bool),bool) s:fun('?49,bool))) ((#<=_c:fun(fun('?49,bool),fun(fun(num,bool),bool)) s:fun('?49,bool)) #UNIV:fun(num,bool)))))
      #|COUNTABLE_CASES =  |- (#forall:fun(fun(fun('?50,bool),bool),bool) (\s:fun('?50,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?50,bool),bool) s:fun('?50,bool))) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?50,bool),bool) s:fun('?50,bool))) ((#=_c:fun(fun('?50,bool),fun(fun(num,bool),bool)) s:fun('?50,bool)) #UNIV:fun(num,bool))))))
      #|CARD_LE_COUNTABLE =  |- (#forall:fun(fun(fun('?51,bool),bool),bool) (\s:fun('?51,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<=_c:fun(fun('?51,bool),fun(fun('A,bool),bool)) s:fun('?51,bool)) t:fun('A,bool)))) (#COUNTABLE:fun(fun('?51,bool),bool) s:fun('?51,bool)))))))
      #|CARD_EQ_COUNTABLE =  |- (#forall:fun(fun(fun('?52,bool),bool),bool) (\s:fun('?52,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#=_c:fun(fun('?52,bool),fun(fun('A,bool),bool)) s:fun('?52,bool)) t:fun('A,bool)))) (#COUNTABLE:fun(fun('?52,bool),bool) s:fun('?52,bool)))))))
      #|CARD_COUNTABLE_CONG =  |- (#forall:fun(fun(fun('?53,bool),bool),bool) (\s:fun('?53,bool). (#forall:fun(fun(fun('?54,bool),bool),bool) (\t:fun('?54,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('?53,bool),fun(fun('?54,bool),bool)) s:fun('?53,bool)) t:fun('?54,bool))) ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?53,bool),bool) s:fun('?53,bool))) (#COUNTABLE:fun(fun('?54,bool),bool) t:fun('?54,bool))))))))
      #|COUNTABLE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|COUNTABLE_RESTRICT =  |- (#forall:fun(fun(fun('?55,bool),bool),bool) (\s:fun('?55,bool). (#forall:fun(fun(fun('?55,bool),bool),bool) (\P:fun('?55,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?55,bool),bool) s:fun('?55,bool))) (#COUNTABLE:fun(fun('?55,bool),bool) (#GSPEC:fun(fun('?55,bool),fun('?55,bool)) (\GEN%PVAR%10:'?55. (#?:fun(fun('?55,bool),bool) (\x:'?55. (((#SETSPEC:fun('?55,fun(bool,fun('?55,bool))) GEN%PVAR%10:'?55) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?55,fun(fun('?55,bool),bool)) x:'?55) s:fun('?55,bool))) (P:fun('?55,bool) x:'?55))) x:'?55)))))))))))
      #|COUNTABLE_SUBSET_NUM =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#COUNTABLE:fun(fun(num,bool),bool) s:fun(num,bool))))
      #|FINITE_IMP_COUNTABLE =  |- (#forall:fun(fun(fun('?56,bool),bool),bool) (\s:fun('?56,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?56,bool),bool) s:fun('?56,bool))) (#COUNTABLE:fun(fun('?56,bool),bool) s:fun('?56,bool)))))
      #|CARD_LE_COUNTABLE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LT_COUNTABLE_UNCOUNTABLE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))))) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool)))))))
      #|COUNTABLE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))
      #|COUNTABLE_IMAGE_INJ_GENERAL =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#COUNTABLE:fun(fun('B,bool),bool) A:fun('B,bool)))) (#COUNTABLE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%11:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%11:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) A:fun('B,bool)))) x:'A)))))))))))))
      #|COUNTABLE_IMAGE_INJ_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|COUNTABLE_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#COUNTABLE:fun(fun('B,bool),bool) A:fun('B,bool)))) (#COUNTABLE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%12:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%12:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) A:fun('B,bool))) x:'A)))))))))))
      #|COUNTABLE_EMPTY =  |- (#COUNTABLE:fun(fun('?57,bool),bool) #EMPTY:fun('?57,bool))
      #|COUNTABLE_INTER =  |- (#forall:fun(fun(fun('?58,bool),bool),bool) (\s:fun('?58,bool). (#forall:fun(fun(fun('?58,bool),bool),bool) (\t:fun('?58,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?58,bool),bool) s:fun('?58,bool))) (#COUNTABLE:fun(fun('?58,bool),bool) t:fun('?58,bool)))) (#COUNTABLE:fun(fun('?58,bool),bool) ((#INTER:fun(fun('?58,bool),fun(fun('?58,bool),fun('?58,bool))) s:fun('?58,bool)) t:fun('?58,bool))))))))
      #|COUNTABLE_UNION_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool)))) (#COUNTABLE:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|COUNTABLE_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))))))))
      #|COUNTABLE_SING =  |- (#forall:fun(fun('?59,bool),bool) (\x:'?59. (#COUNTABLE:fun(fun('?59,bool),bool) ((#INSERT:fun('?59,fun(fun('?59,bool),fun('?59,bool))) x:'?59) #EMPTY:fun('?59,bool)))))
      #|COUNTABLE_INSERT =  |- (#forall:fun(fun('?60,bool),bool) (\x:'?60. (#forall:fun(fun(fun('?60,bool),bool),bool) (\s:fun('?60,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?60,bool),bool) ((#INSERT:fun('?60,fun(fun('?60,bool),fun('?60,bool))) x:'?60) s:fun('?60,bool)))) (#COUNTABLE:fun(fun('?60,bool),bool) s:fun('?60,bool)))))))
      #|COUNTABLE_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|COUNTABLE_DIFF_FINITE =  |- (#forall:fun(fun(fun('?61,bool),bool),bool) (\s:fun('?61,bool). (#forall:fun(fun(fun('?61,bool),bool),bool) (\t:fun('?61,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?61,bool),bool) s:fun('?61,bool))) ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?61,bool),bool) ((#DIFF:fun(fun('?61,bool),fun(fun('?61,bool),fun('?61,bool))) t:fun('?61,bool)) s:fun('?61,bool)))) (#COUNTABLE:fun(fun('?61,bool),bool) t:fun('?61,bool))))))))
      #|COUNTABLE_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|COUNTABLE_CROSS =  |- (#forall:fun(fun(fun('?62,bool),bool),bool) (\s:fun('?62,bool). (#forall:fun(fun(fun('?63,bool),bool),bool) (\t:fun('?63,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?62,bool),bool) s:fun('?62,bool))) (#COUNTABLE:fun(fun('?63,bool),bool) t:fun('?63,bool)))) (#COUNTABLE:fun(fun(prod('?62,'?63),bool),bool) ((#CROSS:fun(fun('?62,bool),fun(fun('?63,bool),fun(prod('?62,'?63),bool))) s:fun('?62,bool)) t:fun('?63,bool))))))))
      #|COUNTABLE_AS_IMAGE_SUBSET =  |- (#forall:fun(fun(fun('?64,bool),bool),bool) (\s:fun('?64,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?64,bool),bool) s:fun('?64,bool))) (#?:fun(fun(fun(num,'?64),bool),bool) (\f:fun(num,'?64). ((#SUBSET:fun(fun('?64,bool),fun(fun('?64,bool),bool)) s:fun('?64,bool)) ((#IMAGE:fun(fun(num,'?64),fun(fun(num,bool),fun('?64,bool))) f:fun(num,'?64)) #UNIV:fun(num,bool))))))))
      #|COUNTABLE_AS_IMAGE_SUBSET_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) #UNIV:fun(num,bool))))))))
      #|COUNTABLE_AS_IMAGE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) #UNIV:fun(num,bool))))))))
      #|FORALL_COUNTABLE_AS_IMAGE =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?65,bool),bool),bool) (\d:fun('?65,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?65,bool),bool) d:fun('?65,bool))) (P:fun(fun('?65,bool),bool) d:fun('?65,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?65,bool),bool) #EMPTY:fun('?65,bool))) (#forall:fun(fun(fun(num,'?65),bool),bool) (\f:fun(num,'?65). (P:fun(fun('?65,bool),bool) ((#IMAGE:fun(fun(num,'?65),fun(fun(num,bool),fun('?65,bool))) f:fun(num,'?65)) #UNIV:fun(num,bool)))))))
      #|COUNTABLE_AS_INJECTIVE_IMAGE =  |- (#forall:fun(fun(fun('?66,bool),bool),bool) (\s:fun('?66,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?66,bool),bool) s:fun('?66,bool))) (#INFINITE:fun(fun('?66,bool),bool) s:fun('?66,bool)))) (#?:fun(fun(fun(num,'?66),bool),bool) (\f:fun(num,'?66). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('?66,bool),fun(fun('?66,bool),bool)) s:fun('?66,bool)) ((#IMAGE:fun(fun(num,'?66),fun(fun(num,bool),fun('?66,bool))) f:fun(num,'?66)) #UNIV:fun(num,bool)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?66,fun('?66,bool)) (f:fun(num,'?66) m:num)) (f:fun(num,'?66) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))))))
      #|COUNTABLE_AS_IMAGE_NUM_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#?:fun(fun(fun(num,bool),bool),bool) (\k:fun(num,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) k:fun(num,bool))))))))))
      #|COUNTABLE_AS_INJECTIVE_IMAGE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#?:fun(fun(fun(num,bool),bool),bool) (\k:fun(num,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) k:fun(num,bool)))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) m:num) k:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) k:fun(num,bool))) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) m:num)) (f:fun(num,'A) n:num))))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))))))))))
      #|COUNTABLE_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) A:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) A:fun(fun('A,bool),bool))) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))))))) (#COUNTABLE:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))))))
      #|COUNTABLE_PRODUCT_DEPENDENT =  |- (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\f:fun('A,fun('B,'C)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) x:'A))))))) (#COUNTABLE:fun(fun('C,bool),bool) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%13:'C. (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%13:'C) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) (t:fun('A,fun('B,bool)) x:'A)))) ((f:fun('A,fun('B,'C)) x:'A) y:'B))))))))))))))))
      #|COUNTABLE_CARD_ADD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#COUNTABLE:fun(fun(sum('A,'B),bool),bool) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))
      #|COUNTABLE_CARD_ADD_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(sum('A,'B),bool),bool) ((#+_c:fun(fun('A,bool),fun(fun('B,bool),fun(sum('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))))))))
      #|COUNTABLE_CARD_MUL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#COUNTABLE:fun(fun(prod('A,'B),bool),bool) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))
      #|COUNTABLE_CARD_MUL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(prod('A,'B),bool),bool) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))))))))))
      #|CARD_EQ_PCROSS =  |- (#forall:fun(fun(fun(cart('A,'M),bool),bool),bool) (\s:fun(cart('A,'M),bool). (#forall:fun(fun(fun(cart('A,'N),bool),bool),bool) (\t:fun(cart('A,'N),bool). ((#=_c:fun(fun(cart('A,finite_sum('M,'N)),bool),fun(fun(prod(cart('A,'M),cart('A,'N)),bool),bool)) ((#PCROSS:fun(fun(cart('A,'M),bool),fun(fun(cart('A,'N),bool),fun(cart('A,finite_sum('M,'N)),bool))) s:fun(cart('A,'M),bool)) t:fun(cart('A,'N),bool))) ((#*_c:fun(fun(cart('A,'M),bool),fun(fun(cart('A,'N),bool),fun(prod(cart('A,'M),cart('A,'N)),bool))) s:fun(cart('A,'M),bool)) t:fun(cart('A,'N),bool)))))))
      #|COUNTABLE_PCROSS_EQ =  |- (#forall:fun(fun(fun(cart('A,'M),bool),bool),bool) (\s:fun(cart('A,'M),bool). (#forall:fun(fun(fun(cart('A,'N),bool),bool),bool) (\t:fun(cart('A,'N),bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(cart('A,finite_sum('M,'N)),bool),bool) ((#PCROSS:fun(fun(cart('A,'M),bool),fun(fun(cart('A,'N),bool),fun(cart('A,finite_sum('M,'N)),bool))) s:fun(cart('A,'M),bool)) t:fun(cart('A,'N),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(cart('A,'M),bool),fun(fun(cart('A,'M),bool),bool)) s:fun(cart('A,'M),bool)) #EMPTY:fun(cart('A,'M),bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(cart('A,'N),bool),fun(fun(cart('A,'N),bool),bool)) t:fun(cart('A,'N),bool)) #EMPTY:fun(cart('A,'N),bool))) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(cart('A,'M),bool),bool) s:fun(cart('A,'M),bool))) (#COUNTABLE:fun(fun(cart('A,'N),bool),bool) t:fun(cart('A,'N),bool))))))))))
      #|COUNTABLE_PCROSS =  |- (#forall:fun(fun(fun(cart('A,'M),bool),bool),bool) (\s:fun(cart('A,'M),bool). (#forall:fun(fun(fun(cart('A,'N),bool),bool),bool) (\t:fun(cart('A,'N),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(cart('A,'M),bool),bool) s:fun(cart('A,'M),bool))) (#COUNTABLE:fun(fun(cart('A,'N),bool),bool) t:fun(cart('A,'N),bool)))) (#COUNTABLE:fun(fun(cart('A,finite_sum('M,'N)),bool),bool) ((#PCROSS:fun(fun(cart('A,'M),bool),fun(fun(cart('A,'N),bool),fun(cart('A,finite_sum('M,'N)),bool))) s:fun(cart('A,'M),bool)) t:fun(cart('A,'N),bool))))))))
      #|INT_COUNTABLE =  |- (#COUNTABLE:fun(fun(int,bool),bool) #UNIV:fun(int,bool))
      #|CARD_EQ_INT_NUM =  |- ((#=_c:fun(fun(int,bool),fun(fun(num,bool),bool)) #UNIV:fun(int,bool)) #UNIV:fun(num,bool))
      #|int_INFINITE =  |- (#INFINITE:fun(fun(int,bool),bool) #UNIV:fun(int,bool))
      #|COUNTABLE_CART =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\P:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) (#COUNTABLE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%14:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%14:'A) ((P:fun(num,fun('A,bool)) i:num) x:'A)) x:'A)))))))))) (#COUNTABLE:fun(fun(cart('A,'N),bool),bool) (#GSPEC:fun(fun(cart('A,'N),bool),fun(cart('A,'N),bool)) (\GEN%PVAR%15:cart('A,'N). (#?:fun(fun(cart('A,'N),bool),bool) (\v:cart('A,'N). (((#SETSPEC:fun(cart('A,'N),fun(bool,fun(cart('A,'N),bool))) GEN%PVAR%15:cart('A,'N)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) i:num)) ((#<=:fun(num,fun(num,bool)) i:num) (#dimindex:fun(fun('N,bool),num) #UNIV:fun('N,bool))))) ((P:fun(num,fun('A,bool)) i:num) ((#$:fun(cart('A,'N),fun(num,'A)) v:cart('A,'N)) i:num)))))) v:cart('A,'N))))))))))
      #|EXISTS_COUNTABLE_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('?67,bool),bool),bool),bool) (\P:fun(fun('?67,bool),bool). (#forall:fun(fun(fun('?68,'?67),bool),bool) (\f:fun('?68,'?67). (#forall:fun(fun(fun('?68,bool),bool),bool) (\s:fun('?68,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('?67,bool),bool),bool) (\t:fun('?67,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?67,bool),bool) t:fun('?67,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?67,bool),fun(fun('?67,bool),bool)) t:fun('?67,bool)) ((#IMAGE:fun(fun('?68,'?67),fun(fun('?68,bool),fun('?67,bool))) f:fun('?68,'?67)) s:fun('?68,bool)))) (P:fun(fun('?67,bool),bool) t:fun('?67,bool))))))) (#?:fun(fun(fun('?68,bool),bool),bool) (\t:fun('?68,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?68,bool),bool) t:fun('?68,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?68,bool),fun(fun('?68,bool),bool)) t:fun('?68,bool)) s:fun('?68,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?68,bool),bool) (\x:'?68. (#forall:fun(fun('?68,bool),bool) (\y:'?68. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?68,fun(fun('?68,bool),bool)) x:'?68) t:fun('?68,bool))) ((#IN:fun('?68,fun(fun('?68,bool),bool)) y:'?68) t:fun('?68,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?67,fun('?67,bool)) (f:fun('?68,'?67) x:'?68)) (f:fun('?68,'?67) y:'?68))) ((#=:fun('?68,fun('?68,bool)) x:'?68) y:'?68)))))))) (P:fun(fun('?67,bool),bool) ((#IMAGE:fun(fun('?68,'?67),fun(fun('?68,bool),fun('?67,bool))) f:fun('?68,'?67)) t:fun('?68,bool)))))))))))))))
      #|FORALL_COUNTABLE_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('?69,bool),bool),bool),bool) (\P:fun(fun('?69,bool),bool). (#forall:fun(fun(fun('?70,'?69),bool),bool) (\f:fun('?70,'?69). (#forall:fun(fun(fun('?70,bool),bool),bool) (\s:fun('?70,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?69,bool),bool),bool) (\t:fun('?69,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?69,bool),bool) t:fun('?69,bool))) ((#SUBSET:fun(fun('?69,bool),fun(fun('?69,bool),bool)) t:fun('?69,bool)) ((#IMAGE:fun(fun('?70,'?69),fun(fun('?70,bool),fun('?69,bool))) f:fun('?70,'?69)) s:fun('?70,bool))))) (P:fun(fun('?69,bool),bool) t:fun('?69,bool)))))) (#forall:fun(fun(fun('?70,bool),bool),bool) (\t:fun('?70,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?70,bool),bool) t:fun('?70,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?70,bool),fun(fun('?70,bool),bool)) t:fun('?70,bool)) s:fun('?70,bool))) (#forall:fun(fun('?70,bool),bool) (\x:'?70. (#forall:fun(fun('?70,bool),bool) (\y:'?70. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?70,fun(fun('?70,bool),bool)) x:'?70) t:fun('?70,bool))) ((#IN:fun('?70,fun(fun('?70,bool),bool)) y:'?70) t:fun('?70,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?69,fun('?69,bool)) (f:fun('?70,'?69) x:'?70)) (f:fun('?70,'?69) y:'?70))) ((#=:fun('?70,fun('?70,bool)) x:'?70) y:'?70)))))))))) (P:fun(fun('?69,bool),bool) ((#IMAGE:fun(fun('?70,'?69),fun(fun('?70,bool),fun('?69,bool))) f:fun('?70,'?69)) t:fun('?70,bool)))))))))))))
      #|EXISTS_COUNTABLE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('?71,bool),bool),bool),bool) (\P:fun(fun('?71,bool),bool). (#forall:fun(fun(fun('?72,'?71),bool),bool) (\f:fun('?72,'?71). (#forall:fun(fun(fun('?72,bool),bool),bool) (\s:fun('?72,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('?71,bool),bool),bool) (\t:fun('?71,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?71,bool),bool) t:fun('?71,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?71,bool),fun(fun('?71,bool),bool)) t:fun('?71,bool)) ((#IMAGE:fun(fun('?72,'?71),fun(fun('?72,bool),fun('?71,bool))) f:fun('?72,'?71)) s:fun('?72,bool)))) (P:fun(fun('?71,bool),bool) t:fun('?71,bool))))))) (#?:fun(fun(fun('?72,bool),bool),bool) (\t:fun('?72,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?72,bool),bool) t:fun('?72,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?72,bool),fun(fun('?72,bool),bool)) t:fun('?72,bool)) s:fun('?72,bool))) (P:fun(fun('?71,bool),bool) ((#IMAGE:fun(fun('?72,'?71),fun(fun('?72,bool),fun('?71,bool))) f:fun('?72,'?71)) t:fun('?72,bool))))))))))))))
      #|FORALL_COUNTABLE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('?73,bool),bool),bool),bool) (\P:fun(fun('?73,bool),bool). (#forall:fun(fun(fun('?74,'?73),bool),bool) (\f:fun('?74,'?73). (#forall:fun(fun(fun('?74,bool),bool),bool) (\s:fun('?74,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?73,bool),bool),bool) (\t:fun('?73,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?73,bool),bool) t:fun('?73,bool))) ((#SUBSET:fun(fun('?73,bool),fun(fun('?73,bool),bool)) t:fun('?73,bool)) ((#IMAGE:fun(fun('?74,'?73),fun(fun('?74,bool),fun('?73,bool))) f:fun('?74,'?73)) s:fun('?74,bool))))) (P:fun(fun('?73,bool),bool) t:fun('?73,bool)))))) (#forall:fun(fun(fun('?74,bool),bool),bool) (\t:fun('?74,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('?74,bool),bool) t:fun('?74,bool))) ((#SUBSET:fun(fun('?74,bool),fun(fun('?74,bool),bool)) t:fun('?74,bool)) s:fun('?74,bool)))) (P:fun(fun('?73,bool),bool) ((#IMAGE:fun(fun('?74,'?73),fun(fun('?74,bool),fun('?73,bool))) f:fun('?74,'?73)) t:fun('?74,bool)))))))))))))
      #|COUNTABLE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))))))))))))))
      #|COUNTABLE_IMAGE_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))
      #|COUNTABLE_IMAGE_EQ_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))))))
      #|COUNTABLE_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#COUNTABLE:fun(fun(prod('A,'A),bool),bool) (#GSPEC:fun(fun(prod('A,'A),bool),fun(prod('A,'A),bool)) (\GEN%PVAR%16:prod('A,'A). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun(prod('A,'A),fun(bool,fun(prod('A,'A),bool))) GEN%PVAR%16:prod('A,'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))))))))))))
      #|COUNTABLE_UNION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))))
      #|COUNTABLE_INTERSECTION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool))))
      #|COUNTABLE_UNION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|COUNTABLE_INTERSECTION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|COUNTABLE_UNION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|COUNTABLE_INTERSECTION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|COUNTABLE_UNION_OF_EXPLICIT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\t:fun(num,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(fun('A,bool),bool) (t:fun(num,fun('A,bool)) n:num))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%17:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%17:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (t:fun(num,fun('A,bool)) n:num)))))))) s:fun('A,bool)))))))))))
      #|COUNTABLE_UNION_OF_ASCENDING =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) t:fun('A,bool))) (P:fun(fun('A,bool),bool) u:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))))))))) ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\t:fun(num,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(fun('A,bool),bool) (t:fun(num,fun('A,bool)) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (t:fun(num,fun('A,bool)) n:num)) (t:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%18:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%18:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (t:fun(num,fun('A,bool)) n:num)))))))) s:fun('A,bool))))))))))))
      #|COUNTABLE_UNION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|COUNTABLE_INTERSECTION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|COUNTABLE_UNION_OF_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_UNION_OF_UNION =  |- (#forall:fun(fun(fun(fun('?75,bool),bool),bool),bool) (\P:fun(fun('?75,bool),bool). (#forall:fun(fun(fun('?75,bool),bool),bool) (\s:fun('?75,bool). (#forall:fun(fun(fun('?75,bool),bool),bool) (\t:fun('?75,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('?75,bool),bool),bool),fun(fun(fun('?75,bool),bool),fun(fun('?75,bool),bool))) #COUNTABLE:fun(fun(fun('?75,bool),bool),bool)) P:fun(fun('?75,bool),bool)) s:fun('?75,bool))) (((#UNION_OF:fun(fun(fun(fun('?75,bool),bool),bool),fun(fun(fun('?75,bool),bool),fun(fun('?75,bool),bool))) #COUNTABLE:fun(fun(fun('?75,bool),bool),bool)) P:fun(fun('?75,bool),bool)) t:fun('?75,bool)))) (((#UNION_OF:fun(fun(fun(fun('?75,bool),bool),bool),fun(fun(fun('?75,bool),bool),fun(fun('?75,bool),bool))) #COUNTABLE:fun(fun(fun('?75,bool),bool),bool)) P:fun(fun('?75,bool),bool)) ((#UNION:fun(fun('?75,bool),fun(fun('?75,bool),fun('?75,bool))) s:fun('?75,bool)) t:fun('?75,bool))))))))))
      #|COUNTABLE_INTERSECTION_OF_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_INTERSECTION_OF_INTER =  |- (#forall:fun(fun(fun(fun('?76,bool),bool),bool),bool) (\P:fun(fun('?76,bool),bool). (#forall:fun(fun(fun('?76,bool),bool),bool) (\s:fun('?76,bool). (#forall:fun(fun(fun('?76,bool),bool),bool) (\t:fun('?76,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('?76,bool),bool),bool),fun(fun(fun('?76,bool),bool),fun(fun('?76,bool),bool))) #COUNTABLE:fun(fun(fun('?76,bool),bool),bool)) P:fun(fun('?76,bool),bool)) s:fun('?76,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('?76,bool),bool),bool),fun(fun(fun('?76,bool),bool),fun(fun('?76,bool),bool))) #COUNTABLE:fun(fun(fun('?76,bool),bool),bool)) P:fun(fun('?76,bool),bool)) t:fun('?76,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('?76,bool),bool),bool),fun(fun(fun('?76,bool),bool),fun(fun('?76,bool),bool))) #COUNTABLE:fun(fun(fun('?76,bool),bool),bool)) P:fun(fun('?76,bool),bool)) ((#INTER:fun(fun('?76,bool),fun(fun('?76,bool),fun('?76,bool))) s:fun('?76,bool)) t:fun('?76,bool))))))))))
      #|COUNTABLE_UNION_OF_INTER_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|COUNTABLE_UNION_OF_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|COUNTABLE_INTERSECTION_OF_UNION_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|COUNTABLE_INTERSECTION_OF_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|COUNTABLE_INTERSECTION_OF_UNIONS_NONEMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_INTERSECTION_OF_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_UNION_OF_INTERS_NONEMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_UNION_OF_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|COUNTABLE_DISJOINT_UNION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) ((#INTER:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) (#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) ((#INTER:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) (#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))))) P:fun(fun('A,bool),bool)))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) ((#INTER:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),bool))) #COUNTABLE:fun(fun(fun('A,bool),bool),bool)) (#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))))) P:fun(fun('A,bool),bool)))))
      #|COUNTABLE_ASCENDING_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))))))))) (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\u:fun(num,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (u:fun(num,fun('A,bool)) n:num)) f:fun(fun('A,bool),bool))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (u:fun(num,fun('A,bool)) n:num)) (u:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%19:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%19:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (u:fun(num,fun('A,bool)) n:num)))))))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))))))))
      #|COUNTABLE_DESCENDING_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))))))))) (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\u:fun(num,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (u:fun(num,fun('A,bool)) n:num)) f:fun(fun('A,bool),bool))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (u:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num))) (u:fun(num,fun('A,bool)) n:num))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%20:fun('A,bool). (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%20:fun('A,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) #UNIV:fun(num,bool))) (u:fun(num,fun('A,bool)) n:num)))))))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))))))))
      #|CARD_EQ_LIST_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=_c:fun(fun(list('A),bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun(list('A),bool),fun(list('A),bool)) (\GEN%PVAR%21:list('A). (#?:fun(fun(list('A),bool),bool) (\l:list('A). (((#SETSPEC:fun(list('A),fun(bool,fun(list('A),bool))) GEN%PVAR%21:list('A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) x:'A) l:list('A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))) l:list('A))))))) s:fun('A,bool)))))
      #|CARD_EQ_LIST =  |- ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) ((#=_c:fun(fun(list('A),bool),fun(fun('A,bool),bool)) #UNIV:fun(list('A),bool)) #UNIV:fun('A,bool)))
      #|CARD_EQ_CART =  |- ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) ((#=_c:fun(fun(cart('A,'N),bool),fun(fun('A,bool),bool)) #UNIV:fun(cart('A,'N),bool)) #UNIV:fun('A,bool)))
      #|CARD_EQ_REAL =  |- ((#=_c:fun(fun(real,bool),fun(fun(fun(num,bool),bool),bool)) #UNIV:fun(real,bool)) #UNIV:fun(fun(num,bool),bool))
      #|UNCOUNTABLE_REAL =  |- (#~:fun(bool,bool) (#COUNTABLE:fun(fun(real,bool),bool) #UNIV:fun(real,bool)))
      #|CARD_EQ_REAL_IMP_UNCOUNTABLE =  |- (#forall:fun(fun(fun('?77,bool),bool),bool) (\s:fun('?77,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('?77,bool),fun(fun(real,bool),bool)) s:fun('?77,bool)) #UNIV:fun(real,bool))) (#~:fun(bool,bool) (#COUNTABLE:fun(fun('?77,bool),bool) s:fun('?77,bool))))))
      #|COUNTABLE_IMP_CARD_LT_REAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<_c:fun(fun('A,bool),fun(fun(real,bool),bool)) s:fun('A,bool)) #UNIV:fun(real,bool)))))
      #|CARD_LT_NUM_REAL =  |- ((#<_c:fun(fun(num,bool),fun(fun(real,bool),bool)) #UNIV:fun(num,bool)) #UNIV:fun(real,bool))
      #|CARD_EQ_REAL_SUBSET =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))))))) ((#=_c:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #UNIV:fun(real,bool)))))))))
      #|exp_c =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(fun('B,'A),bool),fun(fun(fun('B,'A),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) (#GSPEC:fun(fun(fun('B,'A),bool),fun(fun('B,'A),bool)) (\GEN%PVAR%22:fun('B,'A). (#?:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (((#SETSPEC:fun(fun('B,'A),fun(bool,fun(fun('B,'A),bool))) GEN%PVAR%22:fun('B,'A)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('B,'A) x:'B)) s:fun('A,bool)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool)))) ((#=:fun('A,fun('A,bool)) (f:fun('B,'A) x:'B)) (#@:fun(fun('A,bool),'A) (\y:'A. #F:bool)))))))) f:fun('B,'A)))))))))))
      #|EXP_C =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(fun('B,'A),bool),fun(fun(fun('B,'A),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) (#GSPEC:fun(fun(fun('B,'A),bool),fun(fun('B,'A),bool)) (\GEN%PVAR%23:fun('B,'A). (#?:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). (((#SETSPEC:fun(fun('B,'A),fun(bool,fun(fun('B,'A),bool))) GEN%PVAR%23:fun('B,'A)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('B,'A),fun(fun('B,bool),fun('A,bool))) f:fun('B,'A)) t:fun('B,bool))) s:fun('A,bool))) ((#EXTENSIONAL:fun(fun('B,bool),fun(fun('B,'A),bool)) t:fun('B,bool)) f:fun('B,'A)))) f:fun('B,'A)))))))))))
      #|CARD_EXP_UNIV =  |- ((#=:fun(fun(fun('B,'A),bool),fun(fun(fun('B,'A),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) #UNIV:fun('A,bool)) #UNIV:fun('B,bool))) #UNIV:fun(fun('B,'A),bool))
      #|CARD_EXP_GRAPH =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun(fun('B,'A),bool),fun(fun(fun('B,fun('A,bool)),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) (#GSPEC:fun(fun(fun('B,fun('A,bool)),bool),fun(fun('B,fun('A,bool)),bool)) (\GEN%PVAR%24:fun('B,fun('A,bool)). (#?:fun(fun(fun('B,fun('A,bool)),bool),bool) (\R:fun('B,fun('A,bool)). (((#SETSPEC:fun(fun('B,fun('A,bool)),fun(bool,fun(fun('B,fun('A,bool)),bool))) GEN%PVAR%24:fun('B,fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('B,fun('A,bool)) x:'B) y:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))))))))) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\y:'A. ((R:fun('B,fun('A,bool)) x:'B) y:'A)))))))) R:fun('B,fun('A,bool))))))))))))
      #|CARD_EXP_GRAPH_PAIRED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=_c:fun(fun(fun('B,'A),bool),fun(fun(fun(prod('B,'A),bool),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) (#GSPEC:fun(fun(fun(prod('B,'A),bool),bool),fun(fun(prod('B,'A),bool),bool)) (\GEN%PVAR%25:fun(prod('B,'A),bool). (#?:fun(fun(fun(prod('B,'A),bool),bool),bool) (\R:fun(prod('B,'A),bool). (((#SETSPEC:fun(fun(prod('B,'A),bool),fun(bool,fun(fun(prod('B,'A),bool),bool))) GEN%PVAR%25:fun(prod('B,'A),bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (R:fun(prod('B,'A),bool) ((#,:fun('B,fun('A,prod('B,'A))) x:'B) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))))))))) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\y:'A. (R:fun(prod('B,'A),bool) ((#,:fun('B,fun('A,prod('B,'A))) x:'B) y:'A))))))))) R:fun(prod('B,'A),bool)))))))))))
      #|CARD_EXP_0 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('C,bool),bool) (\c:'C. ((#=_c:fun(fun(fun('B,'A),bool),fun(fun('C,bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) #EMPTY:fun('B,bool))) ((#INSERT:fun('C,fun(fun('C,bool),fun('C,bool))) c:'C) #EMPTY:fun('C,bool)))))))
      #|CARD_EXP_ZERO =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). (#forall:fun(fun('C,bool),bool) (\c:'C. ((#=_c:fun(fun(fun('B,'A),bool),fun(fun('C,bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) #EMPTY:fun('A,bool)) s:fun('B,bool))) (((#COND:fun(bool,fun(fun('C,bool),fun(fun('C,bool),fun('C,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) #EMPTY:fun('B,bool))) ((#INSERT:fun('C,fun(fun('C,bool),fun('C,bool))) c:'C) #EMPTY:fun('C,bool))) #EMPTY:fun('C,bool)))))))
      #|CARD_EXP_ADD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(fun(sum('B,'C),'A),bool),fun(fun(prod(fun('B,'A),fun('C,'A)),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun(sum('B,'C),bool),fun(fun(sum('B,'C),'A),bool))) s:fun('A,bool)) ((#+_c:fun(fun('B,bool),fun(fun('C,bool),fun(sum('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#*_c:fun(fun(fun('B,'A),bool),fun(fun(fun('C,'A),bool),fun(prod(fun('B,'A),fun('C,'A)),bool))) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) u:fun('C,bool))))))))))
      #|CARD_EXP_MUL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(fun(prod('B,'C),'A),bool),fun(fun(fun('C,fun('B,'A)),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun(prod('B,'C),bool),fun(fun(prod('B,'C),'A),bool))) s:fun('A,bool)) ((#*_c:fun(fun('B,bool),fun(fun('C,bool),fun(prod('B,'C),bool))) t:fun('B,bool)) u:fun('C,bool)))) ((#^_c:fun(fun(fun('B,'A),bool),fun(fun('C,bool),fun(fun('C,fun('B,'A)),bool))) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool)))))))))
      #|CARD_MUL_EXP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\u:fun('C,bool). ((#=_c:fun(fun(fun('C,prod('A,'B)),bool),fun(fun(prod(fun('C,'A),fun('C,'B)),bool),bool)) ((#^_c:fun(fun(prod('A,'B),bool),fun(fun('C,bool),fun(fun('C,prod('A,'B)),bool))) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) u:fun('C,bool))) ((#*_c:fun(fun(fun('C,'A),bool),fun(fun(fun('C,'B),bool),fun(prod(fun('C,'A),fun('C,'B)),bool))) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) u:fun('C,bool))) ((#^_c:fun(fun('B,bool),fun(fun('C,bool),fun(fun('C,'B),bool))) t:fun('B,bool)) u:fun('C,bool))))))))))
      #|CARD_EXP_SING =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#=_c:fun(fun(fun('B,'A),bool),fun(fun('A,bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) b:'B) #EMPTY:fun('B,bool)))) s:fun('A,bool))))))
      #|CARD_LE_EXP_LEFT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#<=_c:fun(fun(fun('C,'A),bool),fun(fun(fun('C,'B),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#^_c:fun(fun('B,bool),fun(fun('C,bool),fun(fun('C,'B),bool))) s':fun('B,bool)) t:fun('C,bool))))))))))
      #|CARD_LE_EXP_RIGHT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t':fun('C,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('C,bool),bool)) t:fun('B,bool)) t':fun('C,bool)))) ((#<=_c:fun(fun(fun('B,'A),bool),fun(fun(fun('C,'A),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) t':fun('C,bool))))))))))
      #|CARD_LE_EXP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#<=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool))))) ((#<=_c:fun(fun(fun('C,'A),bool),fun(fun(fun('D,'B),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#^_c:fun(fun('B,bool),fun(fun('D,bool),fun(fun('D,'B),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_EXP_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\s':fun('B,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). (#forall:fun(fun(fun('D,bool),bool),bool) (\t':fun('D,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) s':fun('B,bool))) ((#=_c:fun(fun('C,bool),fun(fun('D,bool),bool)) t:fun('C,bool)) t':fun('D,bool)))) ((#=_c:fun(fun(fun('C,'A),bool),fun(fun(fun('D,'B),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('C,bool),fun(fun('C,'A),bool))) s:fun('A,bool)) t:fun('C,bool))) ((#^_c:fun(fun('B,bool),fun(fun('D,bool),fun(fun('D,'B),bool))) s':fun('B,bool)) t':fun('D,bool))))))))))))
      #|CARD_EXP_FINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#FINITE:fun(fun(fun('B,'A),bool),bool) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))))))))
      #|CARD_EXP_C =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(fun('B,'A),bool),num) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#EXP:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|CARD_EXP_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#^_c:fun(fun(bool,bool),fun(fun('A,bool),fun(fun('A,bool),bool))) #UNIV:fun(bool,bool)) s:fun('A,bool))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%26:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%26:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool)))))))))
      #|CARD_EXP_CANTOR =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#<_c:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) ((#^_c:fun(fun(bool,bool),fun(fun('A,bool),fun(fun('A,bool),bool))) #UNIV:fun(bool,bool)) s:fun('A,bool)))))
      #|CARD_EXP_ABSORB =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun(bool,bool),fun(fun('A,bool),bool)) #UNIV:fun(bool,bool)) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun(fun('B,bool),bool),bool)) s:fun('A,bool)) ((#^_c:fun(fun(bool,bool),fun(fun('B,bool),fun(fun('B,bool),bool))) #UNIV:fun(bool,bool)) t:fun('B,bool)))))) ((#=_c:fun(fun(fun('B,'A),bool),fun(fun(fun('B,bool),bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#^_c:fun(fun(bool,bool),fun(fun('B,bool),fun(fun('B,bool),bool))) #UNIV:fun(bool,bool)) t:fun('B,bool))))))))
      #|CARD_EXP_LE_REAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun(real,bool),bool)) s:fun('A,bool)) #UNIV:fun(real,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#<=_c:fun(fun(fun('B,'A),bool),fun(fun(real,bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) #UNIV:fun(real,bool)))))))
      #|CARD_EXP_EQ_REAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) ((#=_c:fun(fun(fun('A,real),bool),fun(fun(real,bool),bool)) ((#^_c:fun(fun(real,bool),fun(fun('A,bool),fun(fun('A,real),bool))) #UNIV:fun(real,bool)) s:fun('A,bool))) #UNIV:fun(real,bool)))))
      #|CARD_EQ_RESTRICTED_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,'A),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%27:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%27:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) k:fun('A,bool)) s:fun('A,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) k:fun('A,bool)) t:fun('B,bool)))) k:fun('A,bool))))))) (((#COND:fun(bool,fun(fun(fun('B,'A),bool),fun(fun(fun('B,'A),bool),fun(fun('B,'A),bool)))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool))) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) #EMPTY:fun(fun('B,'A),bool))))))))
      #|CARD_EQ_LIMITED_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,'A),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%28:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%28:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) k:fun('A,bool)) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) k:fun('A,bool)) t:fun('B,bool)))) k:fun('A,bool))))))) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%29:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%29:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) k:fun('A,bool)) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) k:fun('A,bool)) t:fun('B,bool)))) k:fun('A,bool))))))) ((#^_c:fun(fun(bool,bool),fun(fun('A,bool),fun(fun('A,bool),bool))) #UNIV:fun(bool,bool)) s:fun('A,bool)))))))))
      #|CARD_EQ_FULLSIZE_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%30:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%30:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#=_c:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) t:fun('A,bool))))))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%31:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%31:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool))))))))))
      #|CARD_EQ_EXP_INFINITE_FINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#~:fun(bool,bool) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool)))))) ((#=_c:fun(fun(fun('B,'A),bool),fun(fun('A,bool),bool)) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool))) s:fun('A,bool)))))))
      #|CARD_EQ_FINITE_SUBSETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%32:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%32:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) t:fun('A,bool))))))) s:fun('A,bool)))))
      #|CARD_LE_LIST =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun(list('A),bool),fun(fun(list('B),bool),bool)) (#GSPEC:fun(fun(list('A),bool),fun(list('A),bool)) (\GEN%PVAR%33:list('A). (#?:fun(fun(list('A),bool),bool) (\l:list('A). (((#SETSPEC:fun(list('A),fun(bool,fun(list('A),bool))) GEN%PVAR%33:list('A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) x:'A) l:list('A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))) l:list('A))))))) (#GSPEC:fun(fun(list('B),bool),fun(list('B),bool)) (\GEN%PVAR%34:list('B). (#?:fun(fun(list('B),bool),bool) (\l:list('B). (((#SETSPEC:fun(list('B),fun(bool,fun(list('B),bool))) GEN%PVAR%34:list('B)) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('B,fun(list('B),bool)) x:'B) l:list('B))) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool)))))) l:list('B))))))))))))
      #|CARD_LE_SUBPOWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (Q:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))))))) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%35:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%35:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('A,bool),bool) u:fun('A,bool)))) u:fun('A,bool))))))) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%36:fun('B,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%36:fun('B,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) v:fun('B,bool)) t:fun('B,bool))) (Q:fun(fun('B,bool),bool) v:fun('B,bool)))) v:fun('B,bool))))))))))))
      #|CARD_LE_FINITE_SUBSETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%37:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%37:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool)))) u:fun('A,bool))))))) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%38:fun('B,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%38:fun('B,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) v:fun('B,bool)) t:fun('B,bool))) (#FINITE:fun(fun('B,bool),bool) v:fun('B,bool)))) v:fun('B,bool))))))))))))
      #|CARD_LE_COUNTABLE_SUBSETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%39:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%39:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) u:fun('A,bool)))) u:fun('A,bool))))))) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%40:fun('B,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%40:fun('B,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) v:fun('B,bool)) t:fun('B,bool))) (#COUNTABLE:fun(fun('B,bool),bool) v:fun('B,bool)))) v:fun('B,bool))))))))))))
      #|CARD_LE_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%41:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%41:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) u:fun('A,bool))))))) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%42:fun('B,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%42:fun('B,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) v:fun('B,bool)) t:fun('B,bool))) v:fun('B,bool))))))))))))
      #|CARD_POWERSET_CONG =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%43:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%43:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))) u:fun('A,bool))))))) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%44:fun('B,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%44:fun('B,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) v:fun('B,bool)) t:fun('B,bool))) v:fun('B,bool))))))))))))
      #|COUNTABLE_LIST_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun(list('A),bool),bool) (#GSPEC:fun(fun(list('A),bool),fun(list('A),bool)) (\GEN%PVAR%45:list('A). (#?:fun(fun(list('A),bool),bool) (\l:list('A). (((#SETSPEC:fun(list('A),fun(bool,fun(list('A),bool))) GEN%PVAR%45:list('A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) x:'A) l:list('A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))) l:list('A))))))))))
      #|COUNTABLE_LIST =  |- ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) (#COUNTABLE:fun(fun(list('A),bool),bool) #UNIV:fun(list('A),bool)))
      #|COUNTABLE_FINITE_SUBSETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%46:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%46:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) t:fun('A,bool))))))))))
      #|CARD_EQ_REAL_SEQUENCES =  |- ((#=_c:fun(fun(fun(num,real),bool),fun(fun(real,bool),bool)) #UNIV:fun(fun(num,real),bool)) #UNIV:fun(real,bool))
      #|CARD_EQ_COUNTABLE_SUBSETS_SUBREAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=_c:fun(fun('A,bool),fun(fun(real,bool),bool)) s:fun('A,bool)) #UNIV:fun(real,bool)))) ((#=_c:fun(fun(fun('A,bool),bool),fun(fun(real,bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%47:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%47:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool)))) t:fun('A,bool))))))) #UNIV:fun(real,bool)))))
      #|CARD_EQ_COUNTABLE_SUBSETS_REAL =  |- ((#=_c:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (#GSPEC:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (\GEN%PVAR%48:fun(real,bool). (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (((#SETSPEC:fun(fun(real,bool),fun(bool,fun(fun(real,bool),bool))) GEN%PVAR%48:fun(real,bool)) (#COUNTABLE:fun(fun(real,bool),bool) s:fun(real,bool))) s:fun(real,bool))))))) #UNIV:fun(real,bool))
      #|CARD_LE_RESTRICTED_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#<=_c:fun(fun(fun('A,'B),bool),fun(fun(fun(prod('A,'B),bool),bool),bool)) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%49:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%49:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%50:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%50:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%51:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%51:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A))))))))) f:fun('A,'B))))))) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%52:fun(prod('A,'B),bool). (#?:fun(fun(fun(prod('A,'B),bool),bool),bool) (\u:fun(prod('A,'B),bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%52:fun(prod('A,'B),bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) u:fun(prod('A,'B),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) (#FINITE:fun(fun(prod('A,'B),bool),bool) u:fun(prod('A,'B),bool)))) u:fun(prod('A,'B),bool)))))))))))))
      #|COUNTABLE_RESTRICTED_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) s:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#COUNTABLE:fun(fun(fun('A,'B),bool),bool) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%53:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%53:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%54:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%54:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%55:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%55:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A))))))))) f:fun('A,'B))))))))))))))
      #|CARD_LE_RESTRICTED_FUNSPACE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))))) ((#<=_c:fun(fun(fun('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%56:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%56:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%57:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%57:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%58:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%58:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A))))))))) f:fun('A,'B))))))) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))))
      #|CARD_EQ_RESTRICTED_FUNSPACE_INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#?:fun(fun('B,bool),bool) (\a:'B. ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) a:'B) #EMPTY:fun('B,bool))))))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) k:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))))) ((#=_c:fun(fun(fun('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%59:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%59:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%60:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%60:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%61:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%61:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A))))))))) f:fun('A,'B))))))) ((#*_c:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))))
      #|CARD_EQ_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#=_c:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%62:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%62:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%63:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%63:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool)))) f:fun('A,'B))))))) ((#^_c:fun(fun('B,bool),fun(fun('A,bool),fun(fun('A,'B),bool))) t:fun('B,bool)) s:fun('A,bool)))))))))
      #|CARTESIAN_PRODUCT_CONST =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(fun('B,'A),bool),fun(fun(fun('B,'A),bool),bool)) ((#cartesian_product:fun(fun('B,bool),fun(fun('B,fun('A,bool)),fun(fun('B,'A),bool))) t:fun('B,bool)) (\i:'B. s:fun('A,bool)))) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool)))))))
      #|CARD_LE_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('B,bool)),bool),bool) (\t:fun('K,fun('B,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('B,bool)) i:'K)))))) ((#<=_c:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'B),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('B,bool)),fun(fun('K,'B),bool))) k:fun('K,bool)) t:fun('K,fun('B,bool)))))))))))
      #|CARD_EQ_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('B,bool)),bool),bool) (\t:fun('K,fun('B,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('B,bool)) i:'K)))))) ((#=_c:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'B),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('B,bool)),fun(fun('K,'B),bool))) k:fun('K,bool)) t:fun('K,fun('B,bool)))))))))))
      #|CARD_LE_CARTESIAN_PRODUCT_SUBINDEX =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,bool),bool),bool) (\l:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('K,bool),fun(fun('K,bool),bool)) k:fun('K,bool)) l:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) l:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))))) ((#<=_c:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) l:fun('K,bool)) s:fun('K,fun('A,bool)))))))))))
      #|FINITE_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('K,'A),bool),bool) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%64:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%64:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\a:'A. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))))))) i:'K))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (#FINITE:fun(fun('A,bool),bool) (s:fun('K,fun('A,bool)) i:'K))))))))))))
      #|COUNTABLE_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun(fun('K,'A),bool),bool) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%65:'K. (#?:fun(fun('K,bool),bool) (\i:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%65:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\a:'A. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))))))) i:'K))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (#COUNTABLE:fun(fun('A,bool),bool) (s:fun('K,fun('A,bool)) i:'K))))))))))))
      #|CARD_EXP_FINITE_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('B,'A),bool),bool) ((#^_c:fun(fun('A,bool),fun(fun('B,bool),fun(fun('B,'A),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\a:'A. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))))
      #|CARD_EQ_CARTESIAN_PRODUCT_DISJOINT_UNION =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\f:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,bool),bool),bool) (\l:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('K,bool),fun(fun('K,bool),bool)) k:fun('K,bool)) l:fun('K,bool))) ((#=_c:fun(fun(fun('K,'A),bool),fun(fun(prod(fun('K,'A),fun('K,'A)),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) ((#UNION:fun(fun('K,bool),fun(fun('K,bool),fun('K,bool))) k:fun('K,bool)) l:fun('K,bool))) f:fun('K,fun('A,bool)))) ((#CROSS:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),fun(prod(fun('K,'A),fun('K,'A)),bool))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) f:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) l:fun('K,bool)) f:fun('K,fun('A,bool))))))))))))
      #|types = tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 279
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?78
      #|counter_genvar = _245366:bool
      #|
    ),
  )
}
