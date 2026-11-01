// Load-fidelity test for sets.ml: replays tools/ocaml_ref/sets_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "sets matches sets.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("sets")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("IN", () => sthm(@sets.in_()))
  log.attempt("EXTENSION", () => sthm(@sets.extension()))
  log.attempt("GSPEC", () => sthm(@sets.gspec()))
  log.attempt("SETSPEC", () => sthm(@sets.setspec()))
  log.attempt("IN_ELIM_THM", () => sthm(@sets.in_elim_thm()))
  log.attempt("EMPTY", () => sthm(@sets.empty()))
  log.attempt("INSERT_DEF", () => sthm(@sets.insert_def()))
  log.attempt("UNIV", () => sthm(@sets.univ()))
  log.attempt("UNION", () => sthm(@sets.union()))
  log.attempt("UNIONS", () => sthm(@sets.unions()))
  log.attempt("INTER", () => sthm(@sets.inter()))
  log.attempt("INTERS", () => sthm(@sets.inters()))
  log.attempt("DIFF", () => sthm(@sets.diff()))
  log.attempt("INSERT", () => sthm(@sets.insert()))
  log.attempt("DELETE", () => sthm(@sets.delete()))
  log.attempt("SUBSET", () => sthm(@sets.subset()))
  log.attempt("PSUBSET", () => sthm(@sets.psubset()))
  log.attempt("DISJOINT", () => sthm(@sets.disjoint()))
  log.attempt("SING", () => sthm(@sets.sing()))
  log.attempt("FINITE_RULES", () => sthm(@sets.finite_rules()))
  log.attempt("FINITE_INDUCT", () => sthm(@sets.finite_induct()))
  log.attempt("FINITE_CASES", () => sthm(@sets.finite_cases()))
  log.attempt("INFINITE", () => sthm(@sets.infinite()))
  log.attempt("IMAGE", () => sthm(@sets.image()))
  log.attempt("INJ", () => sthm(@sets.inj()))
  log.attempt("SURJ", () => sthm(@sets.surj()))
  log.attempt("BIJ", () => sthm(@sets.bij()))
  log.attempt("CHOICE", () => sthm(@sets.choice()))
  log.attempt("REST", () => sthm(@sets.rest()))
  log.attempt("NOT_IN_EMPTY", () => sthm(@sets.not_in_empty()))
  log.attempt("IN_UNIV", () => sthm(@sets.in_univ()))
  log.attempt("IN_UNION", () => sthm(@sets.in_union()))
  log.attempt("IN_UNIONS", () => sthm(@sets.in_unions()))
  log.attempt("IN_INTER", () => sthm(@sets.in_inter()))
  log.attempt("IN_INTERS", () => sthm(@sets.in_inters()))
  log.attempt("IN_DIFF", () => sthm(@sets.in_diff()))
  log.attempt("IN_INSERT", () => sthm(@sets.in_insert()))
  log.attempt("IN_DELETE", () => sthm(@sets.in_delete()))
  log.attempt("IN_SING", () => sthm(@sets.in_sing()))
  log.attempt("IN_IMAGE", () => sthm(@sets.in_image()))
  log.attempt("IN_REST", () => sthm(@sets.in_rest()))
  log.attempt("FORALL_IN_INSERT", () => sthm(@sets.forall_in_insert()))
  log.attempt("EXISTS_IN_INSERT", () => sthm(@sets.exists_in_insert()))
  log.attempt("FORALL_IN_UNION", () => sthm(@sets.forall_in_union()))
  log.attempt("EXISTS_IN_UNION", () => sthm(@sets.exists_in_union()))
  log.attempt("FORALL_IN_IMAGE", () => sthm(@sets.forall_in_image()))
  log.attempt("EXISTS_IN_IMAGE", () => sthm(@sets.exists_in_image()))
  log.attempt("FORALL_IN_GSPEC", () => sthm(@sets.forall_in_gspec()))
  log.attempt("EXISTS_IN_GSPEC", () => sthm(@sets.exists_in_gspec()))
  log.attempt("UNIONS_IMAGE", () => sthm(@sets.unions_image()))
  log.attempt("INTERS_IMAGE", () => sthm(@sets.inters_image()))
  log.attempt("UNIONS_GSPEC", () => sthm(@sets.unions_gspec()))
  log.attempt("INTERS_GSPEC", () => sthm(@sets.inters_gspec()))
  log.attempt("CHOICE_DEF", () => sthm(@sets.choice_def()))
  log.attempt("NOT_EQUAL_SETS", () => sthm(@sets.not_equal_sets()))
  log.attempt("INSERT_RESTRICT", () => sthm(@sets.insert_restrict()))
  log.attempt("UNIV_1", () => sthm(@sets.univ_1()))
  log.attempt("MEMBER_NOT_EMPTY", () => sthm(@sets.member_not_empty()))
  log.attempt("UNIV_NOT_EMPTY", () => sthm(@sets.univ_not_empty()))
  log.attempt("EMPTY_NOT_UNIV", () => sthm(@sets.empty_not_univ()))
  log.attempt("EQ_UNIV", () => sthm(@sets.eq_univ()))
  log.attempt("SUBSET_TRANS", () => sthm(@sets.subset_trans()))
  log.attempt("SUBSET_REFL", () => sthm(@sets.subset_refl()))
  log.attempt("SUBSET_ANTISYM", () => sthm(@sets.subset_antisym()))
  log.attempt("SUBSET_ANTISYM_EQ", () => sthm(@sets.subset_antisym_eq()))
  log.attempt("EMPTY_SUBSET", () => sthm(@sets.empty_subset()))
  log.attempt("SUBSET_EMPTY", () => sthm(@sets.subset_empty()))
  log.attempt("SUBSET_UNIV", () => sthm(@sets.subset_univ()))
  log.attempt("UNIV_SUBSET", () => sthm(@sets.univ_subset()))
  log.attempt("SING_SUBSET", () => sthm(@sets.sing_subset()))
  log.attempt("SUBSET_RESTRICT", () => sthm(@sets.subset_restrict()))
  log.attempt("PSUBSET_TRANS", () => sthm(@sets.psubset_trans()))
  log.attempt("PSUBSET_SUBSET_TRANS", () => sthm(@sets.psubset_subset_trans()))
  log.attempt("SUBSET_PSUBSET_TRANS", () => sthm(@sets.subset_psubset_trans()))
  log.attempt("PSUBSET_IRREFL", () => sthm(@sets.psubset_irrefl()))
  log.attempt("NOT_PSUBSET_EMPTY", () => sthm(@sets.not_psubset_empty()))
  log.attempt("NOT_UNIV_PSUBSET", () => sthm(@sets.not_univ_psubset()))
  log.attempt("PSUBSET_UNIV", () => sthm(@sets.psubset_univ()))
  log.attempt("PSUBSET_ALT", () => sthm(@sets.psubset_alt()))
  log.attempt("UNION_ASSOC", () => sthm(@sets.union_assoc()))
  log.attempt("UNION_IDEMPOT", () => sthm(@sets.union_idempot()))
  log.attempt("UNION_COMM", () => sthm(@sets.union_comm()))
  log.attempt("SUBSET_UNION", () => sthm(@sets.subset_union()))
  log.attempt("SUBSET_UNION_ABSORPTION", () => {
    sthm(@sets.subset_union_absorption())
  })
  log.attempt("UNION_EMPTY", () => sthm(@sets.union_empty()))
  log.attempt("UNION_UNIV", () => sthm(@sets.union_univ()))
  log.attempt("EMPTY_UNION", () => sthm(@sets.empty_union()))
  log.attempt("UNION_SUBSET", () => sthm(@sets.union_subset()))
  log.attempt("UNION_RESTRICT", () => sthm(@sets.union_restrict()))
  log.attempt("FORALL_SUBSET_UNION", () => sthm(@sets.forall_subset_union()))
  log.attempt("EXISTS_SUBSET_UNION", () => sthm(@sets.exists_subset_union()))
  log.attempt("FORALL_SUBSET_INSERT", () => sthm(@sets.forall_subset_insert()))
  log.attempt("EXISTS_SUBSET_INSERT", () => sthm(@sets.exists_subset_insert()))
  log.attempt("INTER_ASSOC", () => sthm(@sets.inter_assoc()))
  log.attempt("INTER_IDEMPOT", () => sthm(@sets.inter_idempot()))
  log.attempt("INTER_COMM", () => sthm(@sets.inter_comm()))
  log.attempt("INTER_SUBSET", () => sthm(@sets.inter_subset()))
  log.attempt("SUBSET_INTER_ABSORPTION", () => {
    sthm(@sets.subset_inter_absorption())
  })
  log.attempt("INTER_EMPTY", () => sthm(@sets.inter_empty()))
  log.attempt("INTER_UNIV", () => sthm(@sets.inter_univ()))
  log.attempt("SUBSET_INTER", () => sthm(@sets.subset_inter()))
  log.attempt("INTER_RESTRICT", () => sthm(@sets.inter_restrict()))
  log.attempt("UNION_OVER_INTER", () => sthm(@sets.union_over_inter()))
  log.attempt("INTER_OVER_UNION", () => sthm(@sets.inter_over_union()))
  log.attempt("IN_DISJOINT", () => sthm(@sets.in_disjoint()))
  log.attempt("DISJOINT_SYM", () => sthm(@sets.disjoint_sym()))
  log.attempt("DISJOINT_EMPTY", () => sthm(@sets.disjoint_empty()))
  log.attempt("DISJOINT_EMPTY_REFL", () => sthm(@sets.disjoint_empty_refl()))
  log.attempt("DISJOINT_UNION", () => sthm(@sets.disjoint_union()))
  log.attempt("DISJOINT_SING", () => sthm(@sets.disjoint_sing()))
  log.attempt("DIFF_EMPTY", () => sthm(@sets.diff_empty()))
  log.attempt("EMPTY_DIFF", () => sthm(@sets.empty_diff()))
  log.attempt("DIFF_UNIV", () => sthm(@sets.diff_univ()))
  log.attempt("DIFF_DIFF", () => sthm(@sets.diff_diff()))
  log.attempt("DIFF_EQ_EMPTY", () => sthm(@sets.diff_eq_empty()))
  log.attempt("SUBSET_DIFF", () => sthm(@sets.subset_diff()))
  log.attempt("COMPL_COMPL", () => sthm(@sets.compl_compl()))
  log.attempt("DIFF_RESTRICT", () => sthm(@sets.diff_restrict()))
  log.attempt("COMPONENT", () => sthm(@sets.component()))
  log.attempt("DECOMPOSITION", () => sthm(@sets.decomposition()))
  log.attempt("SET_CASES", () => sthm(@sets.set_cases()))
  log.attempt("ABSORPTION", () => sthm(@sets.absorption()))
  log.attempt("INSERT_INSERT", () => sthm(@sets.insert_insert()))
  log.attempt("INSERT_COMM", () => sthm(@sets.insert_comm()))
  log.attempt("INSERT_UNIV", () => sthm(@sets.insert_univ()))
  log.attempt("NOT_INSERT_EMPTY", () => sthm(@sets.not_insert_empty()))
  log.attempt("NOT_EMPTY_INSERT", () => sthm(@sets.not_empty_insert()))
  log.attempt("INSERT_UNION", () => sthm(@sets.insert_union()))
  log.attempt("INSERT_UNION_EQ", () => sthm(@sets.insert_union_eq()))
  log.attempt("INSERT_INTER", () => sthm(@sets.insert_inter()))
  log.attempt("DISJOINT_INSERT", () => sthm(@sets.disjoint_insert()))
  log.attempt("INSERT_SUBSET", () => sthm(@sets.insert_subset()))
  log.attempt("SUBSET_INSERT", () => sthm(@sets.subset_insert()))
  log.attempt("INSERT_DIFF", () => sthm(@sets.insert_diff()))
  log.attempt("INSERT_AC", () => sthm(@sets.insert_ac()))
  log.attempt("INTER_ACI", () => sthm(@sets.inter_aci()))
  log.attempt("UNION_ACI", () => sthm(@sets.union_aci()))
  log.attempt("DELETE_NON_ELEMENT", () => sthm(@sets.delete_non_element()))
  log.attempt("IN_DELETE_EQ", () => sthm(@sets.in_delete_eq()))
  log.attempt("EMPTY_DELETE", () => sthm(@sets.empty_delete()))
  log.attempt("DELETE_DELETE", () => sthm(@sets.delete_delete()))
  log.attempt("DELETE_COMM", () => sthm(@sets.delete_comm()))
  log.attempt("DELETE_SUBSET", () => sthm(@sets.delete_subset()))
  log.attempt("SUBSET_DELETE", () => sthm(@sets.subset_delete()))
  log.attempt("SUBSET_INSERT_DELETE", () => sthm(@sets.subset_insert_delete()))
  log.attempt("DIFF_INSERT", () => sthm(@sets.diff_insert()))
  log.attempt("PSUBSET_INSERT_SUBSET", () => sthm(@sets.psubset_insert_subset()))
  log.attempt("DELETE_INSERT", () => sthm(@sets.delete_insert()))
  log.attempt("INSERT_DELETE", () => sthm(@sets.insert_delete()))
  log.attempt("DELETE_INTER", () => sthm(@sets.delete_inter()))
  log.attempt("DISJOINT_DELETE_SYM", () => sthm(@sets.disjoint_delete_sym()))
  log.attempt("UNIONS_0", () => sthm(@sets.unions_0()))
  log.attempt("UNIONS_1", () => sthm(@sets.unions_1()))
  log.attempt("UNIONS_2", () => sthm(@sets.unions_2()))
  log.attempt("UNIONS_INSERT", () => sthm(@sets.unions_insert()))
  log.attempt("FORALL_IN_UNIONS", () => sthm(@sets.forall_in_unions()))
  log.attempt("EXISTS_IN_UNIONS", () => sthm(@sets.exists_in_unions()))
  log.attempt("EMPTY_UNIONS", () => sthm(@sets.empty_unions()))
  log.attempt("INTER_UNIONS", () => sthm(@sets.inter_unions()))
  log.attempt("UNIONS_SUBSET", () => sthm(@sets.unions_subset()))
  log.attempt("SUBSET_UNIONS", () => sthm(@sets.subset_unions()))
  log.attempt("UNIONS_UNION", () => sthm(@sets.unions_union()))
  log.attempt("INTERS_UNION", () => sthm(@sets.inters_union()))
  log.attempt("UNIONS_MONO", () => sthm(@sets.unions_mono()))
  log.attempt("UNIONS_MONO_IMAGE", () => sthm(@sets.unions_mono_image()))
  log.attempt("UNIONS_UNIV", () => sthm(@sets.unions_univ()))
  log.attempt("UNIONS_INSERT_EMPTY", () => sthm(@sets.unions_insert_empty()))
  log.attempt("UNIONS_DELETE_EMPTY", () => sthm(@sets.unions_delete_empty()))
  log.attempt("INTERS_0", () => sthm(@sets.inters_0()))
  log.attempt("INTERS_1", () => sthm(@sets.inters_1()))
  log.attempt("INTERS_2", () => sthm(@sets.inters_2()))
  log.attempt("INTERS_INSERT", () => sthm(@sets.inters_insert()))
  log.attempt("SUBSET_INTERS", () => sthm(@sets.subset_inters()))
  log.attempt("INTERS_SUBSET", () => sthm(@sets.inters_subset()))
  log.attempt("INTERS_SUBSET_STRONG", () => sthm(@sets.inters_subset_strong()))
  log.attempt("INTERS_ANTIMONO", () => sthm(@sets.inters_antimono()))
  log.attempt("INTERS_EQ_UNIV", () => sthm(@sets.inters_eq_univ()))
  log.attempt("INTERS_ANTIMONO_GEN", () => sthm(@sets.inters_antimono_gen()))
  log.attempt("IMAGE_CLAUSES", () => sthm(@sets.image_clauses()))
  log.attempt("IMAGE_UNION", () => sthm(@sets.image_union()))
  log.attempt("IMAGE_ID", () => sthm(@sets.image_id()))
  log.attempt("IMAGE_I", () => sthm(@sets.image_i()))
  log.attempt("IMAGE_o", () => sthm(@sets.image_o()))
  log.attempt("IMAGE_SUBSET", () => sthm(@sets.image_subset()))
  log.attempt("IMAGE_INTER_INJ", () => sthm(@sets.image_inter_inj()))
  log.attempt("IMAGE_DIFF_INJ", () => sthm(@sets.image_diff_inj()))
  log.attempt("IMAGE_DIFF_INJ_ALT", () => sthm(@sets.image_diff_inj_alt()))
  log.attempt("IMAGE_DELETE_INJ", () => sthm(@sets.image_delete_inj()))
  log.attempt("IMAGE_DELETE_INJ_ALT", () => sthm(@sets.image_delete_inj_alt()))
  log.attempt("IMAGE_EQ_EMPTY", () => sthm(@sets.image_eq_empty()))
  log.attempt("FORALL_IN_IMAGE_2", () => sthm(@sets.forall_in_image_2()))
  log.attempt("IMAGE_CONST", () => sthm(@sets.image_const()))
  log.attempt("SIMPLE_IMAGE", () => sthm(@sets.simple_image()))
  log.attempt("SIMPLE_IMAGE_GEN", () => sthm(@sets.simple_image_gen()))
  log.attempt("IMAGE_UNIONS", () => sthm(@sets.image_unions()))
  log.attempt("FUN_IN_IMAGE", () => sthm(@sets.fun_in_image()))
  log.attempt("SURJECTIVE_IMAGE_EQ", () => sthm(@sets.surjective_image_eq()))
  log.attempt("IMAGE_EQ", () => sthm(@sets.image_eq()))
  log.attempt("EMPTY_GSPEC", () => sthm(@sets.empty_gspec()))
  log.attempt("UNIV_GSPEC", () => sthm(@sets.univ_gspec()))
  log.attempt("SING_GSPEC", () => sthm(@sets.sing_gspec()))
  log.attempt("SING_ALT", () => sthm(@sets.sing_alt()))
  log.attempt("IN_GSPEC", () => sthm(@sets.in_gspec()))
  log.attempt("IN_ELIM_PAIR_THM", () => sthm(@sets.in_elim_pair_thm()))
  log.attempt("IN_ELIM_TRIPLE_THM", () => sthm(@sets.in_elim_triple_thm()))
  log.attempt("IN_ELIM_QUAD_THM", () => sthm(@sets.in_elim_quad_thm()))
  log.attempt("SET_PAIR_THM", () => sthm(@sets.set_pair_thm()))
  log.attempt("SET_PROVE_CASES", () => sthm(@sets.set_prove_cases()))
  log.attempt("UNIONS_SINGS_GEN", () => sthm(@sets.unions_sings_gen()))
  log.attempt("UNIONS_SINGS", () => sthm(@sets.unions_sings()))
  log.attempt("IMAGE_INTERS", () => sthm(@sets.image_inters()))
  log.attempt("DIFF_INTERS", () => sthm(@sets.diff_inters()))
  log.attempt("INTERS_UNIONS", () => sthm(@sets.inters_unions()))
  log.attempt("UNIONS_INTERS", () => sthm(@sets.unions_inters()))
  log.attempt("UNIONS_DIFF", () => sthm(@sets.unions_diff()))
  log.attempt("DIFF_UNIONS", () => sthm(@sets.diff_unions()))
  log.attempt("DIFF_UNIONS_NONEMPTY", () => sthm(@sets.diff_unions_nonempty()))
  log.attempt("INTERS_OVER_UNIONS", () => sthm(@sets.inters_over_unions()))
  log.attempt("INTER_INTERS", () => sthm(@sets.inter_inters()))
  log.attempt("UNIONS_OVER_INTERS", () => sthm(@sets.unions_over_inters()))
  log.attempt("UNIONS_EQ_INTERS", () => sthm(@sets.unions_eq_inters()))
  log.attempt("EXISTS_UNIQUE_UNIONS_INTERS", () => {
    sthm(@sets.exists_unique_unions_inters())
  })
  log.attempt("IMAGE_INTERS_SUBSET", () => sthm(@sets.image_inters_subset()))
  log.attempt("IMAGE_INTER_SUBSET", () => sthm(@sets.image_inter_subset()))
  log.attempt("IMAGE_INTER_SATURATED_GEN", () => {
    sthm(@sets.image_inter_saturated_gen())
  })
  log.attempt("IMAGE_INTERS_SATURATED_GEN", () => {
    sthm(@sets.image_inters_saturated_gen())
  })
  log.attempt("IMAGE_INTER_SATURATED", () => sthm(@sets.image_inter_saturated()))
  log.attempt("IMAGE_INTERS_SATURATED", () => {
    sthm(@sets.image_inters_saturated())
  })
  log.attempt("FINITE_INDUCT_STRONG", () => sthm(@sets.finite_induct_strong()))
  log.attempt("INJECTIVE_ON_ALT", () => sthm(@sets.injective_on_alt()))
  log.attempt("INJECTIVE_ALT", () => sthm(@sets.injective_alt()))
  log.attempt("SURJECTIVE_ON_RIGHT_INVERSE", () => {
    sthm(@sets.surjective_on_right_inverse())
  })
  log.attempt("INJECTIVE_ON_LEFT_INVERSE", () => {
    sthm(@sets.injective_on_left_inverse())
  })
  log.attempt("BIJECTIVE_ON_LEFT_RIGHT_INVERSE", () => {
    sthm(@sets.bijective_on_left_right_inverse())
  })
  log.attempt("SURJECTIVE_RIGHT_INVERSE", () => {
    sthm(@sets.surjective_right_inverse())
  })
  log.attempt("INJECTIVE_LEFT_INVERSE", () => {
    sthm(@sets.injective_left_inverse())
  })
  log.attempt("BIJECTIVE_LEFT_RIGHT_INVERSE", () => {
    sthm(@sets.bijective_left_right_inverse())
  })
  log.attempt("FUNCTION_FACTORS_LEFT_GEN", () => {
    sthm(@sets.function_factors_left_gen())
  })
  log.attempt("FUNCTION_FACTORS_LEFT", () => sthm(@sets.function_factors_left()))
  log.attempt("FUNCTION_FACTORS_RIGHT_GEN", () => {
    sthm(@sets.function_factors_right_gen())
  })
  log.attempt("FUNCTION_FACTORS_RIGHT", () => {
    sthm(@sets.function_factors_right())
  })
  log.attempt("SURJECTIVE_FORALL_THM", () => sthm(@sets.surjective_forall_thm()))
  log.attempt("SURJECTIVE_EXISTS_THM", () => sthm(@sets.surjective_exists_thm()))
  log.attempt("SURJECTIVE_IMAGE_THM", () => sthm(@sets.surjective_image_thm()))
  log.attempt("IMAGE_INJECTIVE_IMAGE_OF_SUBSET", () => {
    sthm(@sets.image_injective_image_of_subset())
  })
  log.attempt("FINITE_EMPTY", () => sthm(@sets.finite_empty()))
  log.attempt("FINITE_SUBSET", () => sthm(@sets.finite_subset()))
  log.attempt("FINITE_RESTRICT", () => sthm(@sets.finite_restrict()))
  log.attempt("FINITE_UNION_IMP", () => sthm(@sets.finite_union_imp()))
  log.attempt("FINITE_UNION", () => sthm(@sets.finite_union()))
  log.attempt("FINITE_INTER", () => sthm(@sets.finite_inter()))
  log.attempt("FINITE_INSERT", () => sthm(@sets.finite_insert()))
  log.attempt("FINITE_SING", () => sthm(@sets.finite_sing()))
  log.attempt("FINITE_DELETE_IMP", () => sthm(@sets.finite_delete_imp()))
  log.attempt("FINITE_DELETE", () => sthm(@sets.finite_delete()))
  log.attempt("FINITE_FINITE_UNIONS", () => sthm(@sets.finite_finite_unions()))
  log.attempt("FINITE_IMAGE_EXPAND", () => sthm(@sets.finite_image_expand()))
  log.attempt("FINITE_IMAGE", () => sthm(@sets.finite_image()))
  log.attempt("FINITE_IMAGE_INJ_GENERAL", () => {
    sthm(@sets.finite_image_inj_general())
  })
  log.attempt("FINITE_FINITE_PREIMAGE_GENERAL", () => {
    sthm(@sets.finite_finite_preimage_general())
  })
  log.attempt("FINITE_FINITE_PREIMAGE", () => {
    sthm(@sets.finite_finite_preimage())
  })
  log.attempt("FINITE_IMAGE_INJ_EQ", () => sthm(@sets.finite_image_inj_eq()))
  log.attempt("FINITE_IMAGE_INJ", () => sthm(@sets.finite_image_inj()))
  log.attempt("FINITE_IMAGE_GEN", () => sthm(@sets.finite_image_gen()))
  log.attempt("INFINITE_IMAGE", () => sthm(@sets.infinite_image()))
  log.attempt("INFINITE_IMAGE_INJ", () => sthm(@sets.infinite_image_inj()))
  log.attempt("INFINITE_NONEMPTY", () => sthm(@sets.infinite_nonempty()))
  log.attempt("INFINITE_DIFF_FINITE", () => sthm(@sets.infinite_diff_finite()))
  log.attempt("SUBSET_IMAGE_INJ", () => sthm(@sets.subset_image_inj()))
  log.attempt("SUBSET_IMAGE", () => sthm(@sets.subset_image()))
  log.attempt("EXISTS_SUBSET_IMAGE", () => sthm(@sets.exists_subset_image()))
  log.attempt("FORALL_SUBSET_IMAGE", () => sthm(@sets.forall_subset_image()))
  log.attempt("EXISTS_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.exists_subset_image_inj())
  })
  log.attempt("FORALL_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.forall_subset_image_inj())
  })
  log.attempt("EXISTS_FINITE_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.exists_finite_subset_image_inj())
  })
  log.attempt("FORALL_FINITE_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.forall_finite_subset_image_inj())
  })
  log.attempt("EXISTS_FINITE_SUBSET_IMAGE", () => {
    sthm(@sets.exists_finite_subset_image())
  })
  log.attempt("FORALL_FINITE_SUBSET_IMAGE", () => {
    sthm(@sets.forall_finite_subset_image())
  })
  log.attempt("FINITE_SUBSET_IMAGE", () => sthm(@sets.finite_subset_image()))
  log.attempt("FINITE_SUBSET_IMAGE_IMP", () => {
    sthm(@sets.finite_subset_image_imp())
  })
  log.attempt("FINITE_IMAGE_EQ", () => sthm(@sets.finite_image_eq()))
  log.attempt("FINITE_IMAGE_EQ_INJ", () => sthm(@sets.finite_image_eq_inj()))
  log.attempt("FINITE_DIFF", () => sthm(@sets.finite_diff()))
  log.attempt("INFINITE_SUPERSET", () => sthm(@sets.infinite_superset()))
  log.attempt("FINITE_TRANSITIVITY_CHAIN", () => {
    sthm(@sets.finite_transitivity_chain())
  })
  log.attempt("UNIONS_MAXIMAL_SETS", () => sthm(@sets.unions_maximal_sets()))
  log.attempt("FINITE_SUBSET_UNIONS", () => sthm(@sets.finite_subset_unions()))
  log.attempt("UNIONS_IN_CHAIN", () => sthm(@sets.unions_in_chain()))
  log.attempt("INTERS_IN_CHAIN", () => sthm(@sets.inters_in_chain()))
  log.attempt("FINITE_SUBSET_UNIONS_DIRECTED_EQ", () => {
    sthm(@sets.finite_subset_unions_directed_eq())
  })
  log.attempt("FINITE_SUBSET_UNIONS_CHAIN_EQ", () => {
    sthm(@sets.finite_subset_unions_chain_eq())
  })
  log.attempt("FINITE_SUBSET_UNIONS_CHAIN", () => {
    sthm(@sets.finite_subset_unions_chain())
  })
  log.attempt("FINREC", () => sthm(@sets.finrec()))
  log.attempt("FINREC_1_LEMMA", () => sthm(@sets.finrec_1_lemma()))
  log.attempt("FINREC_SUC_LEMMA", () => sthm(@sets.finrec_suc_lemma()))
  log.attempt("FINREC_UNIQUE_LEMMA", () => sthm(@sets.finrec_unique_lemma()))
  log.attempt("FINREC_EXISTS_LEMMA", () => sthm(@sets.finrec_exists_lemma()))
  log.attempt("FINREC_FUN_LEMMA", () => sthm(@sets.finrec_fun_lemma()))
  log.attempt("FINREC_FUN", () => sthm(@sets.finrec_fun()))
  log.attempt("SET_RECURSION_LEMMA", () => sthm(@sets.set_recursion_lemma()))
  log.attempt("ITSET", () => sthm(@sets.itset()))
  log.attempt("FINITE_RECURSION", () => sthm(@sets.finite_recursion()))
  log.attempt("FINITE_RECURSION_DELETE", () => {
    sthm(@sets.finite_recursion_delete())
  })
  log.attempt("ITSET_EQ", () => sthm(@sets.itset_eq()))
  log.attempt("CARD", () => sthm(@sets.card()))
  log.attempt("CARD_CLAUSES", () => sthm(@sets.card_clauses()))
  log.attempt("CARD_UNION", () => sthm(@sets.card_union()))
  log.attempt("CARD_DELETE", () => sthm(@sets.card_delete()))
  log.attempt("CARD_UNION_EQ", () => sthm(@sets.card_union_eq()))
  log.attempt("CARD_DIFF", () => sthm(@sets.card_diff()))
  log.attempt("CARD_EQ_0", () => sthm(@sets.card_eq_0()))
  log.attempt("CARD_SING", () => sthm(@sets.card_sing()))
  log.attempt("CARD_LE_2", () => sthm(@sets.card_le_2()))
  log.attempt("CARD_LE_3", () => sthm(@sets.card_le_3()))
  log.attempt("CARD_LE_4", () => sthm(@sets.card_le_4()))
  log.attempt("FINITE_INDUCT_DELETE", () => sthm(@sets.finite_induct_delete()))
  log.attempt("HAS_SIZE", () => sthm(@sets.has_size()))
  log.attempt("HAS_SIZE_CARD", () => sthm(@sets.has_size_card()))
  log.attempt("HAS_SIZE_0", () => sthm(@sets.has_size_0()))
  log.attempt("HAS_SIZE_SUC", () => sthm(@sets.has_size_suc()))
  log.attempt("HAS_SIZE_UNION", () => sthm(@sets.has_size_union()))
  log.attempt("HAS_SIZE_DIFF", () => sthm(@sets.has_size_diff()))
  log.attempt("HAS_SIZE_UNIONS", () => sthm(@sets.has_size_unions()))
  log.attempt("FINITE_HAS_SIZE", () => sthm(@sets.finite_has_size()))
  log.attempt("HAS_SIZE_CLAUSES", () => sthm(@sets.has_size_clauses()))
  log.attempt("CARD_SUBSET_EQ", () => sthm(@sets.card_subset_eq()))
  log.attempt("CARD_SUBSET", () => sthm(@sets.card_subset()))
  log.attempt("CARD_SUBSET_LE", () => sthm(@sets.card_subset_le()))
  log.attempt("SUBSET_CARD_EQ", () => sthm(@sets.subset_card_eq()))
  log.attempt("FINITE_CARD_LE_SUBSET", () => sthm(@sets.finite_card_le_subset()))
  log.attempt("CARD_PSUBSET", () => sthm(@sets.card_psubset()))
  log.attempt("CARD_PSUBSET_IMP", () => sthm(@sets.card_psubset_imp()))
  log.attempt("CARD_PSUBSET_EQ", () => sthm(@sets.card_psubset_eq()))
  log.attempt("CARD_UNION_LE", () => sthm(@sets.card_union_le()))
  log.attempt("FINITE_CARD_LE_UNION", () => sthm(@sets.finite_card_le_union()))
  log.attempt("CARD_UNIONS_LE", () => sthm(@sets.card_unions_le()))
  log.attempt("CARD_UNION_GEN", () => sthm(@sets.card_union_gen()))
  log.attempt("CARD_UNION_OVERLAP_EQ", () => sthm(@sets.card_union_overlap_eq()))
  log.attempt("CARD_UNION_OVERLAP", () => sthm(@sets.card_union_overlap()))
  log.attempt("CARD_IMAGE_INJ", () => sthm(@sets.card_image_inj()))
  log.attempt("HAS_SIZE_IMAGE_INJ", () => sthm(@sets.has_size_image_inj()))
  log.attempt("CARD_IMAGE_LE", () => sthm(@sets.card_image_le()))
  log.attempt("FINITE_CARD_LE_IMAGE", () => sthm(@sets.finite_card_le_image()))
  log.attempt("CARD_IMAGE_INJ_EQ", () => sthm(@sets.card_image_inj_eq()))
  log.attempt("CARD_SUBSET_IMAGE", () => sthm(@sets.card_subset_image()))
  log.attempt("HAS_SIZE_IMAGE_INJ_EQ", () => sthm(@sets.has_size_image_inj_eq()))
  log.attempt("CARD_IMAGE_EQ_INJ", () => sthm(@sets.card_image_eq_inj()))
  log.attempt("EXISTS_SMALL_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.exists_small_subset_image_inj())
  })
  log.attempt("FORALL_SMALL_SUBSET_IMAGE_INJ", () => {
    sthm(@sets.forall_small_subset_image_inj())
  })
  log.attempt("EXISTS_SMALL_SUBSET_IMAGE", () => {
    sthm(@sets.exists_small_subset_image())
  })
  log.attempt("FORALL_SMALL_SUBSET_IMAGE", () => {
    sthm(@sets.forall_small_subset_image())
  })
  log.attempt("CARD_IMAGE_LE2", () => sthm(@sets.card_image_le2()))
  log.attempt("CARD_IMAGE_LT2", () => sthm(@sets.card_image_lt2()))
  log.attempt("CHOOSE_SUBSET_STRONG", () => sthm(@sets.choose_subset_strong()))
  log.attempt("CHOOSE_SUBSET_EQ", () => sthm(@sets.choose_subset_eq()))
  log.attempt("CHOOSE_SUBSET", () => sthm(@sets.choose_subset()))
  log.attempt("CHOOSE_SUBSET_BETWEEN", () => sthm(@sets.choose_subset_between()))
  log.attempt("CARD_LE_UNIONS_CHAIN", () => sthm(@sets.card_le_unions_chain()))
  log.attempt("CARD_LE_1", () => sthm(@sets.card_le_1()))
  log.attempt("INVOLUTION_EVEN_NOFIXPOINTS", () => {
    sthm(@sets.involution_even_nofixpoints())
  })
  log.attempt("INVOLUTION_EVEN_FIXPOINTS", () => {
    sthm(@sets.involution_even_fixpoints())
  })
  log.attempt("HAS_SIZE_PRODUCT_DEPENDENT", () => {
    sthm(@sets.has_size_product_dependent())
  })
  log.attempt("FINITE_PRODUCT_DEPENDENT", () => {
    sthm(@sets.finite_product_dependent())
  })
  log.attempt("FINITE_PRODUCT", () => sthm(@sets.finite_product()))
  log.attempt("CARD_PRODUCT", () => sthm(@sets.card_product()))
  log.attempt("HAS_SIZE_PRODUCT", () => sthm(@sets.has_size_product()))
  log.attempt("CROSS", () => sthm(@sets.cross()))
  log.attempt("IN_CROSS", () => sthm(@sets.in_cross()))
  log.attempt("HAS_SIZE_CROSS", () => sthm(@sets.has_size_cross()))
  log.attempt("FINITE_CROSS", () => sthm(@sets.finite_cross()))
  log.attempt("CARD_CROSS", () => sthm(@sets.card_cross()))
  log.attempt("CROSS_EQ_EMPTY", () => sthm(@sets.cross_eq_empty()))
  log.attempt("CROSS_EMPTY", () => sthm(@sets.cross_empty()))
  log.attempt("CROSS_SING", () => sthm(@sets.cross_sing()))
  log.attempt("CROSS_UNIV", () => sthm(@sets.cross_univ()))
  log.attempt("FINITE_CROSS_EQ", () => sthm(@sets.finite_cross_eq()))
  log.attempt("INFINITE_CROSS_EQ", () => sthm(@sets.infinite_cross_eq()))
  log.attempt("FINITE_CROSS_UNIV", () => sthm(@sets.finite_cross_univ()))
  log.attempt("INFINITE_CROSS_UNIV", () => sthm(@sets.infinite_cross_univ()))
  log.attempt("FINITE_UNIV_PAIR", () => sthm(@sets.finite_univ_pair()))
  log.attempt("INFINITE_UNIV_PAIR", () => sthm(@sets.infinite_univ_pair()))
  log.attempt("FORALL_IN_CROSS", () => sthm(@sets.forall_in_cross()))
  log.attempt("EXISTS_IN_CROSS", () => sthm(@sets.exists_in_cross()))
  log.attempt("SUBSET_CROSS", () => sthm(@sets.subset_cross()))
  log.attempt("CROSS_MONO", () => sthm(@sets.cross_mono()))
  log.attempt("CROSS_EQ", () => sthm(@sets.cross_eq()))
  log.attempt("IMAGE_FST_CROSS", () => sthm(@sets.image_fst_cross()))
  log.attempt("IMAGE_SND_CROSS", () => sthm(@sets.image_snd_cross()))
  log.attempt("IMAGE_PAIRED_CROSS", () => sthm(@sets.image_paired_cross()))
  log.attempt("CROSS_INTER", () => sthm(@sets.cross_inter()))
  log.attempt("CROSS_UNION", () => sthm(@sets.cross_union()))
  log.attempt("CROSS_DIFF", () => sthm(@sets.cross_diff()))
  log.attempt("INTER_CROSS", () => sthm(@sets.inter_cross()))
  log.attempt("CROSS_UNIONS_UNIONS", () => sthm(@sets.cross_unions_unions()))
  log.attempt("CROSS_UNIONS", () => sthm(@sets.cross_unions()))
  log.attempt("CROSS_INTERS_INTERS", () => sthm(@sets.cross_inters_inters()))
  log.attempt("CROSS_INTERS", () => sthm(@sets.cross_inters()))
  log.attempt("DISJOINT_CROSS", () => sthm(@sets.disjoint_cross()))
  log.attempt("ARB", () => sthm(@sets.arb()))
  log.attempt("EXTENSIONAL", () => sthm(@sets.extensional()))
  log.attempt("IN_EXTENSIONAL", () => sthm(@sets.in_extensional()))
  log.attempt("IN_EXTENSIONAL_UNDEFINED", () => {
    sthm(@sets.in_extensional_undefined())
  })
  log.attempt("EXTENSIONAL_EMPTY", () => sthm(@sets.extensional_empty()))
  log.attempt("EXTENSIONAL_UNIV", () => sthm(@sets.extensional_univ()))
  log.attempt("EXTENSIONAL_EQ", () => sthm(@sets.extensional_eq()))
  log.attempt("RESTRICTION", () => sthm(@sets.restriction()))
  log.attempt("RESTRICTION_THM", () => sthm(@sets.restriction_thm()))
  log.attempt("RESTRICTION_DEFINED", () => sthm(@sets.restriction_defined()))
  log.attempt("RESTRICTION_UNDEFINED", () => sthm(@sets.restriction_undefined()))
  log.attempt("RESTRICTION_EQ", () => sthm(@sets.restriction_eq()))
  log.attempt("RESTRICTION_IN_EXTENSIONAL", () => {
    sthm(@sets.restriction_in_extensional())
  })
  log.attempt("RESTRICTION_EXTENSION", () => sthm(@sets.restriction_extension()))
  log.attempt("RESTRICTION_FIXPOINT", () => sthm(@sets.restriction_fixpoint()))
  log.attempt("RESTRICTION_UNIV", () => sthm(@sets.restriction_univ()))
  log.attempt("RESTRICTION_RESTRICTION", () => {
    sthm(@sets.restriction_restriction())
  })
  log.attempt("RESTRICTION_IDEMP", () => sthm(@sets.restriction_idemp()))
  log.attempt("IMAGE_RESTRICTION", () => sthm(@sets.image_restriction()))
  log.attempt("RESTRICTION_COMPOSE_RIGHT", () => {
    sthm(@sets.restriction_compose_right())
  })
  log.attempt("RESTRICTION_COMPOSE_LEFT", () => {
    sthm(@sets.restriction_compose_left())
  })
  log.attempt("RESTRICTION_COMPOSE", () => sthm(@sets.restriction_compose()))
  log.attempt("RESTRICTION_UNIQUE", () => sthm(@sets.restriction_unique()))
  log.attempt("RESTRICTION_UNIQUE_ALT", () => {
    sthm(@sets.restriction_unique_alt())
  })
  log.attempt("cartesian_product", () => sthm(@sets.cartesian_product()))
  log.attempt("IN_CARTESIAN_PRODUCT", () => sthm(@sets.in_cartesian_product()))
  log.attempt("CARTESIAN_PRODUCT", () => sthm(@sets.cartesian_product_v1()))
  log.attempt("RESTRICTION_IN_CARTESIAN_PRODUCT", () => {
    sthm(@sets.restriction_in_cartesian_product())
  })
  log.attempt("CARTESIAN_PRODUCT_AS_RESTRICTIONS", () => {
    sthm(@sets.cartesian_product_as_restrictions())
  })
  log.attempt("CARTESIAN_PRODUCT_EQ_EMPTY", () => {
    sthm(@sets.cartesian_product_eq_empty())
  })
  log.attempt("CARTESIAN_PRODUCT_EMPTY", () => {
    sthm(@sets.cartesian_product_empty())
  })
  log.attempt("CARTESIAN_PRODUCT_EQ_MEMBERS", () => {
    sthm(@sets.cartesian_product_eq_members())
  })
  log.attempt("CARTESIAN_PRODUCT_EQ_MEMBERS_EQ", () => {
    sthm(@sets.cartesian_product_eq_members_eq())
  })
  log.attempt("SUBSET_CARTESIAN_PRODUCT", () => {
    sthm(@sets.subset_cartesian_product())
  })
  log.attempt("CARTESIAN_PRODUCT_EQ", () => sthm(@sets.cartesian_product_eq()))
  log.attempt("INTER_CARTESIAN_PRODUCT", () => {
    sthm(@sets.inter_cartesian_product())
  })
  log.attempt("CARTESIAN_PRODUCT_UNIV", () => {
    sthm(@sets.cartesian_product_univ())
  })
  log.attempt("CARTESIAN_PRODUCT_SINGS", () => {
    sthm(@sets.cartesian_product_sings())
  })
  log.attempt("CARTESIAN_PRODUCT_SINGS_GEN", () => {
    sthm(@sets.cartesian_product_sings_gen())
  })
  log.attempt("IMAGE_PROJECTION_CARTESIAN_PRODUCT", () => {
    sthm(@sets.image_projection_cartesian_product())
  })
  log.attempt("FORALL_CARTESIAN_PRODUCT_ELEMENTS", () => {
    sthm(@sets.forall_cartesian_product_elements())
  })
  log.attempt("FORALL_CARTESIAN_PRODUCT_ELEMENTS_EQ", () => {
    sthm(@sets.forall_cartesian_product_elements_eq())
  })
  log.attempt("EXISTS_CARTESIAN_PRODUCT_ELEMENT", () => {
    sthm(@sets.exists_cartesian_product_element())
  })
  log.attempt("product_map", () => sthm(@sets.product_map()))
  log.attempt("PRODUCT_MAP_RESTRICTION", () => {
    sthm(@sets.product_map_restriction())
  })
  log.attempt("IMAGE_PRODUCT_MAP", () => sthm(@sets.image_product_map()))
  log.attempt("disjoint_union", () => sthm(@sets.disjoint_union_v1()))
  log.attempt("SUBSET_DISJOINT_UNION", () => sthm(@sets.subset_disjoint_union()))
  log.attempt("DISJOINT_UNION_EQ", () => sthm(@sets.disjoint_union_eq()))
  log.attempt("SUBSET_DISJOINT_UNION_EXISTS", () => {
    sthm(@sets.subset_disjoint_union_exists())
  })
  log.attempt("INTER_DISJOINT_UNION", () => sthm(@sets.inter_disjoint_union()))
  log.attempt("UNION_DISJOINT_UNION", () => sthm(@sets.union_disjoint_union()))
  log.attempt("DISJOINT_UNION_EQ_EMPTY", () => {
    sthm(@sets.disjoint_union_eq_empty())
  })
  log.attempt("DISJOINT_DISJOINT_UNION", () => {
    sthm(@sets.disjoint_disjoint_union())
  })
  log.attempt("HAS_SIZE_FUNSPACE", () => sthm(@sets.has_size_funspace()))
  log.attempt("CARD_FUNSPACE", () => sthm(@sets.card_funspace()))
  log.attempt("FINITE_FUNSPACE", () => sthm(@sets.finite_funspace()))
  log.attempt("HAS_SIZE_FUNSPACE_UNIV", () => {
    sthm(@sets.has_size_funspace_univ())
  })
  log.attempt("CARD_FUNSPACE_UNIV", () => sthm(@sets.card_funspace_univ()))
  log.attempt("FINITE_FUNSPACE_UNIV", () => sthm(@sets.finite_funspace_univ()))
  log.attempt("HAS_SIZE_BOOL", () => sthm(@sets.has_size_bool()))
  log.attempt("CARD_BOOL", () => sthm(@sets.card_bool()))
  log.attempt("FINITE_BOOL", () => sthm(@sets.finite_bool()))
  log.attempt("HAS_SIZE_POWERSET", () => sthm(@sets.has_size_powerset()))
  log.attempt("CARD_POWERSET", () => sthm(@sets.card_powerset()))
  log.attempt("FINITE_POWERSET", () => sthm(@sets.finite_powerset()))
  log.attempt("FINITE_POWERSET_EQ", () => sthm(@sets.finite_powerset_eq()))
  log.attempt("FINITE_RESTRICTED_SUBSETS", () => {
    sthm(@sets.finite_restricted_subsets())
  })
  log.attempt("FINITE_UNIONS", () => sthm(@sets.finite_unions()))
  log.attempt("FINITE_CARD_LE_UNIONS", () => sthm(@sets.finite_card_le_unions()))
  log.attempt("POWERSET_CLAUSES", () => sthm(@sets.powerset_clauses()))
  log.attempt("FINITE_IMAGE_INFINITE", () => sthm(@sets.finite_image_infinite()))
  log.attempt("FINITE_RESTRICTED_POWERSET", () => {
    sthm(@sets.finite_restricted_powerset())
  })
  log.attempt("FINITE_RESTRICTED_FUNSPACE", () => {
    sthm(@sets.finite_restricted_funspace())
  })
  log.attempt("NUMSEG_CLAUSES_LT", () => sthm(@sets.numseg_clauses_lt()))
  log.attempt("HAS_SIZE_NUMSEG_LT", () => sthm(@sets.has_size_numseg_lt()))
  log.attempt("CARD_NUMSEG_LT", () => sthm(@sets.card_numseg_lt()))
  log.attempt("FINITE_NUMSEG_LT", () => sthm(@sets.finite_numseg_lt()))
  log.attempt("NUMSEG_CLAUSES_LE", () => sthm(@sets.numseg_clauses_le()))
  log.attempt("HAS_SIZE_NUMSEG_LE", () => sthm(@sets.has_size_numseg_le()))
  log.attempt("FINITE_NUMSEG_LE", () => sthm(@sets.finite_numseg_le()))
  log.attempt("CARD_NUMSEG_LE", () => sthm(@sets.card_numseg_le()))
  log.attempt("num_FINITE", () => sthm(@sets.num_finite()))
  log.attempt("num_FINITE_AVOID", () => sthm(@sets.num_finite_avoid()))
  log.attempt("num_INFINITE_EQ", () => sthm(@sets.num_infinite_eq()))
  log.attempt("num_INFINITE", () => sthm(@sets.num_infinite()))
  log.attempt("string_INFINITE", () => sthm(@sets.string_infinite()))
  log.attempt("FINITE_REAL_INTERVAL", () => sthm(@sets.finite_real_interval()))
  log.attempt("real_INFINITE", () => sthm(@sets.real_infinite()))
  log.attempt("HAS_SIZE_INDEX", () => sthm(@sets.has_size_index()))
  log.attempt("INFINITE_ENUMERATE", () => sthm(@sets.infinite_enumerate()))
  log.attempt("INFINITE_ENUMERATE_EQ", () => sthm(@sets.infinite_enumerate_eq()))
  log.attempt("INFINITE_ENUMERATE_SUBSET", () => {
    sthm(@sets.infinite_enumerate_subset())
  })
  log.attempt("set_of_list", () => sthm(@sets.set_of_list()))
  log.attempt("list_of_set", () => sthm(@sets.list_of_set()))
  log.attempt("LIST_OF_SET_PROPERTIES", () => {
    sthm(@sets.list_of_set_properties())
  })
  log.attempt("SET_OF_LIST_OF_SET", () => sthm(@sets.set_of_list_of_set()))
  log.attempt("LENGTH_LIST_OF_SET", () => sthm(@sets.length_list_of_set()))
  log.attempt("MEM_LIST_OF_SET", () => sthm(@sets.mem_list_of_set()))
  log.attempt("FINITE_SET_OF_LIST", () => sthm(@sets.finite_set_of_list()))
  log.attempt("IN_SET_OF_LIST", () => sthm(@sets.in_set_of_list()))
  log.attempt("SET_OF_LIST_APPEND", () => sthm(@sets.set_of_list_append()))
  log.attempt("SET_OF_LIST_MAP", () => sthm(@sets.set_of_list_map()))
  log.attempt("SET_OF_LIST_EQ_EMPTY", () => sthm(@sets.set_of_list_eq_empty()))
  log.attempt("LIST_OF_SET_EMPTY", () => sthm(@sets.list_of_set_empty()))
  log.attempt("LIST_OF_SET_SING", () => sthm(@sets.list_of_set_sing()))
  log.attempt("pairwise", () => sthm(@sets.pairwise()))
  log.attempt("PAIRWISE_EMPTY", () => sthm(@sets.pairwise_empty()))
  log.attempt("PAIRWISE_SING", () => sthm(@sets.pairwise_sing()))
  log.attempt("PAIRWISE_IMP", () => sthm(@sets.pairwise_imp()))
  log.attempt("PAIRWISE_MONO", () => sthm(@sets.pairwise_mono()))
  log.attempt("PAIRWISE_AND", () => sthm(@sets.pairwise_and()))
  log.attempt("PAIRWISE_INSERT", () => sthm(@sets.pairwise_insert()))
  log.attempt("PAIRWISE_INSERT_SYMMETRIC", () => {
    sthm(@sets.pairwise_insert_symmetric())
  })
  log.attempt("PAIRWISE_IMAGE", () => sthm(@sets.pairwise_image()))
  log.attempt("PAIRWISE_UNION", () => sthm(@sets.pairwise_union()))
  log.attempt("PAIRWISE_CHAIN_UNIONS", () => sthm(@sets.pairwise_chain_unions()))
  log.attempt("DIFF_UNIONS_PAIRWISE_DISJOINT", () => {
    sthm(@sets.diff_unions_pairwise_disjoint())
  })
  log.attempt("INTER_UNIONS_PAIRWISE_DISJOINT", () => {
    sthm(@sets.inter_unions_pairwise_disjoint())
  })
  log.attempt("PSUBSET_UNIONS_PAIRWISE_DISJOINT", () => {
    sthm(@sets.psubset_unions_pairwise_disjoint())
  })
  log.attempt("UNION_OF", () => sthm(@sets.union_of()))
  log.attempt("INTERSECTION_OF", () => sthm(@sets.intersection_of()))
  log.attempt("UNION_OF_INC", () => sthm(@sets.union_of_inc()))
  log.attempt("INTERSECTION_OF_INC", () => sthm(@sets.intersection_of_inc()))
  log.attempt("UNION_OF_MONO", () => sthm(@sets.union_of_mono()))
  log.attempt("INTERSECTION_OF_MONO", () => sthm(@sets.intersection_of_mono()))
  log.attempt("FORALL_UNION_OF", () => sthm(@sets.forall_union_of()))
  log.attempt("FORALL_INTERSECTION_OF", () => {
    sthm(@sets.forall_intersection_of())
  })
  log.attempt("UNION_OF_EMPTY", () => sthm(@sets.union_of_empty()))
  log.attempt("INTERSECTION_OF_EMPTY", () => sthm(@sets.intersection_of_empty()))
  log.attempt("ARBITRARY", () => sthm(@sets.arbitrary()))
  log.attempt("ARBITRARY_UNION_OF_ALT", () => {
    sthm(@sets.arbitrary_union_of_alt())
  })
  log.attempt("ARBITRARY_UNION_OF_EMPTY", () => {
    sthm(@sets.arbitrary_union_of_empty())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_EMPTY", () => {
    sthm(@sets.arbitrary_intersection_of_empty())
  })
  log.attempt("ARBITRARY_UNION_OF_INC", () => {
    sthm(@sets.arbitrary_union_of_inc())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_INC", () => {
    sthm(@sets.arbitrary_intersection_of_inc())
  })
  log.attempt("ARBITRARY_UNION_OF_COMPLEMENT", () => {
    sthm(@sets.arbitrary_union_of_complement())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_COMPLEMENT", () => {
    sthm(@sets.arbitrary_intersection_of_complement())
  })
  log.attempt("ARBITRARY_UNION_OF_IDEMPOT", () => {
    sthm(@sets.arbitrary_union_of_idempot())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_IDEMPOT", () => {
    sthm(@sets.arbitrary_intersection_of_idempot())
  })
  log.attempt("ARBITRARY_UNION_OF_UNIONS", () => {
    sthm(@sets.arbitrary_union_of_unions())
  })
  log.attempt("ARBITRARY_UNION_OF_UNION", () => {
    sthm(@sets.arbitrary_union_of_union())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_INTERS", () => {
    sthm(@sets.arbitrary_intersection_of_inters())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_INTER", () => {
    sthm(@sets.arbitrary_intersection_of_inter())
  })
  log.attempt("ARBITRARY_UNION_OF_INTER_EQ", () => {
    sthm(@sets.arbitrary_union_of_inter_eq())
  })
  log.attempt("ARBITRARY_UNION_OF_INTER", () => {
    sthm(@sets.arbitrary_union_of_inter())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_UNION_EQ", () => {
    sthm(@sets.arbitrary_intersection_of_union_eq())
  })
  log.attempt("ARBITRARY_INTERSECTION_OF_UNION", () => {
    sthm(@sets.arbitrary_intersection_of_union())
  })
  log.attempt("FINITE_UNION_OF_EMPTY", () => sthm(@sets.finite_union_of_empty()))
  log.attempt("FINITE_INTERSECTION_OF_EMPTY", () => {
    sthm(@sets.finite_intersection_of_empty())
  })
  log.attempt("FINITE_UNION_OF_INC", () => sthm(@sets.finite_union_of_inc()))
  log.attempt("FINITE_INTERSECTION_OF_INC", () => {
    sthm(@sets.finite_intersection_of_inc())
  })
  log.attempt("FINITE_UNION_OF_COMPLEMENT", () => {
    sthm(@sets.finite_union_of_complement())
  })
  log.attempt("FINITE_INTERSECTION_OF_COMPLEMENT", () => {
    sthm(@sets.finite_intersection_of_complement())
  })
  log.attempt("FINITE_UNION_OF_IDEMPOT", () => {
    sthm(@sets.finite_union_of_idempot())
  })
  log.attempt("FINITE_INTERSECTION_OF_IDEMPOT", () => {
    sthm(@sets.finite_intersection_of_idempot())
  })
  log.attempt("FINITE_UNION_OF_UNIONS", () => {
    sthm(@sets.finite_union_of_unions())
  })
  log.attempt("FINITE_UNION_OF_UNION", () => sthm(@sets.finite_union_of_union()))
  log.attempt("FINITE_INTERSECTION_OF_INTERS", () => {
    sthm(@sets.finite_intersection_of_inters())
  })
  log.attempt("FINITE_INTERSECTION_OF_INTER", () => {
    sthm(@sets.finite_intersection_of_inter())
  })
  log.attempt("FINITE_UNION_OF_INTER_EQ", () => {
    sthm(@sets.finite_union_of_inter_eq())
  })
  log.attempt("FINITE_UNION_OF_INTER", () => sthm(@sets.finite_union_of_inter()))
  log.attempt("FINITE_INTERSECTION_OF_UNION_EQ", () => {
    sthm(@sets.finite_intersection_of_union_eq())
  })
  log.attempt("FINITE_INTERSECTION_OF_UNION", () => {
    sthm(@sets.finite_intersection_of_union())
  })
  log.attempt("CARD_SET_OF_LIST_LE", () => sthm(@sets.card_set_of_list_le()))
  log.attempt("HAS_SIZE_SET_OF_LIST", () => sthm(@sets.has_size_set_of_list()))
  log.attempt("SURJECTIVE_IFF_INJECTIVE_GEN", () => {
    sthm(@sets.surjective_iff_injective_gen())
  })
  log.attempt("SURJECTIVE_IFF_INJECTIVE", () => {
    sthm(@sets.surjective_iff_injective())
  })
  log.attempt("IMAGE_IMP_INJECTIVE_GEN", () => {
    sthm(@sets.image_imp_injective_gen())
  })
  log.attempt("IMAGE_IMP_INJECTIVE", () => sthm(@sets.image_imp_injective()))
  log.attempt("HAS_SIZE_IMAGE_INJ_RESTRICT", () => {
    sthm(@sets.has_size_image_inj_restrict())
  })
  log.attempt("CARD_LE_INJ", () => sthm(@sets.card_le_inj()))
  log.attempt("FORALL_IN_CLAUSES", () => sthm(@sets.forall_in_clauses()))
  log.attempt("EXISTS_IN_CLAUSES", () => sthm(@sets.exists_in_clauses()))
  log.attempt("INJECTIVE_ON_IMAGE", () => sthm(@sets.injective_on_image()))
  log.attempt("INJECTIVE_IMAGE", () => sthm(@sets.injective_image()))
  log.attempt("SURJECTIVE_ON_IMAGE", () => sthm(@sets.surjective_on_image()))
  log.attempt("SURJECTIVE_IMAGE", () => sthm(@sets.surjective_image()))
  log.attempt("INJECTIVE_ON_PREIMAGE", () => sthm(@sets.injective_on_preimage()))
  log.attempt("SURJECTIVE_ON_PREIMAGE", () => {
    sthm(@sets.surjective_on_preimage())
  })
  log.attempt("INJECTIVE_PREIMAGE", () => sthm(@sets.injective_preimage()))
  log.attempt("SURJECTIVE_PREIMAGE", () => sthm(@sets.surjective_preimage()))
  log.attempt("CARD_EQ_BIJECTION", () => sthm(@sets.card_eq_bijection()))
  log.attempt("CARD_EQ_BIJECTIONS", () => sthm(@sets.card_eq_bijections()))
  log.attempt("CARD_EQ_BIJECTIONS_SPECIAL", () => {
    sthm(@sets.card_eq_bijections_special())
  })
  log.attempt("BIJECTIONS_HAS_SIZE", () => sthm(@sets.bijections_has_size()))
  log.attempt("BIJECTIONS_HAS_SIZE_EQ", () => {
    sthm(@sets.bijections_has_size_eq())
  })
  log.attempt("BIJECTIONS_CARD_EQ", () => sthm(@sets.bijections_card_eq()))
  log.attempt("WF_FINITE", () => sthm(@sets.wf_finite()))
  log.attempt("WF_PSUBSET", () => sthm(@sets.wf_psubset()))
  log.attempt("le_c", () => sthm(@sets.le_c()))
  log.attempt("lt_c", () => sthm(@sets.lt_c()))
  log.attempt("eq_c", () => sthm(@sets.eq_c()))
  log.attempt("ge_c", () => sthm(@sets.ge_c()))
  log.attempt("gt_c", () => sthm(@sets.gt_c()))
  log.attempt("LE_C", () => sthm(@sets.le_c_v1()))
  log.attempt("GE_C", () => sthm(@sets.ge_c_v1()))
  log.attempt("COUNTABLE", () => sthm(@sets.countable()))
  log.attempt("sup", () => sthm(@sets.sup()))
  log.attempt("SUP_EQ", () => sthm(@sets.sup_eq()))
  log.attempt("SUP", () => sthm(@sets.sup_v1()))
  log.attempt("SUP_FINITE_LEMMA", () => sthm(@sets.sup_finite_lemma()))
  log.attempt("SUP_FINITE", () => sthm(@sets.sup_finite()))
  log.attempt("REAL_LE_SUP_FINITE", () => sthm(@sets.real_le_sup_finite()))
  log.attempt("REAL_SUP_LE_FINITE", () => sthm(@sets.real_sup_le_finite()))
  log.attempt("REAL_LT_SUP_FINITE", () => sthm(@sets.real_lt_sup_finite()))
  log.attempt("REAL_SUP_LT_FINITE", () => sthm(@sets.real_sup_lt_finite()))
  log.attempt("REAL_SUP_UNIQUE", () => sthm(@sets.real_sup_unique()))
  log.attempt("REAL_SUP_LE", () => sthm(@sets.real_sup_le()))
  log.attempt("REAL_SUP_LE_SUBSET", () => sthm(@sets.real_sup_le_subset()))
  log.attempt("REAL_SUP_BOUNDS", () => sthm(@sets.real_sup_bounds()))
  log.attempt("REAL_ABS_SUP_LE", () => sthm(@sets.real_abs_sup_le()))
  log.attempt("REAL_SUP_ASCLOSE", () => sthm(@sets.real_sup_asclose()))
  log.attempt("SUP_UNIQUE_FINITE", () => sthm(@sets.sup_unique_finite()))
  log.attempt("SUP_INSERT_FINITE", () => sthm(@sets.sup_insert_finite()))
  log.attempt("SUP_SING", () => sthm(@sets.sup_sing()))
  log.attempt("SUP_INSERT_INSERT", () => sthm(@sets.sup_insert_insert()))
  log.attempt("REAL_LE_SUP", () => sthm(@sets.real_le_sup()))
  log.attempt("REAL_SUP_LE_EQ", () => sthm(@sets.real_sup_le_eq()))
  log.attempt("SUP_UNIQUE", () => sthm(@sets.sup_unique()))
  log.attempt("SUP_UNION", () => sthm(@sets.sup_union()))
  log.attempt("ELEMENT_LE_SUP", () => sthm(@sets.element_le_sup()))
  log.attempt("SUP_APPROACH", () => sthm(@sets.sup_approach()))
  log.attempt("REAL_MAX_SUP", () => sthm(@sets.real_max_sup()))
  log.attempt("inf", () => sthm(@sets.inf()))
  log.attempt("INF_EQ", () => sthm(@sets.inf_eq()))
  log.attempt("INF", () => sthm(@sets.inf_v1()))
  log.attempt("INF_FINITE_LEMMA", () => sthm(@sets.inf_finite_lemma()))
  log.attempt("INF_FINITE", () => sthm(@sets.inf_finite()))
  log.attempt("REAL_LE_INF_FINITE", () => sthm(@sets.real_le_inf_finite()))
  log.attempt("REAL_INF_LE_FINITE", () => sthm(@sets.real_inf_le_finite()))
  log.attempt("REAL_LT_INF_FINITE", () => sthm(@sets.real_lt_inf_finite()))
  log.attempt("REAL_INF_LT_FINITE", () => sthm(@sets.real_inf_lt_finite()))
  log.attempt("REAL_INF_UNIQUE", () => sthm(@sets.real_inf_unique()))
  log.attempt("REAL_LE_INF", () => sthm(@sets.real_le_inf()))
  log.attempt("REAL_LE_INF_SUBSET", () => sthm(@sets.real_le_inf_subset()))
  log.attempt("REAL_INF_BOUNDS", () => sthm(@sets.real_inf_bounds()))
  log.attempt("REAL_ABS_INF_LE", () => sthm(@sets.real_abs_inf_le()))
  log.attempt("REAL_INF_ASCLOSE", () => sthm(@sets.real_inf_asclose()))
  log.attempt("INF_UNIQUE_FINITE", () => sthm(@sets.inf_unique_finite()))
  log.attempt("INF_INSERT_FINITE", () => sthm(@sets.inf_insert_finite()))
  log.attempt("INF_SING", () => sthm(@sets.inf_sing()))
  log.attempt("INF_INSERT_INSERT", () => sthm(@sets.inf_insert_insert()))
  log.attempt("REAL_SUP_EQ_INF", () => sthm(@sets.real_sup_eq_inf()))
  log.attempt("REAL_INF_LE", () => sthm(@sets.real_inf_le()))
  log.attempt("REAL_LE_INF_EQ", () => sthm(@sets.real_le_inf_eq()))
  log.attempt("INF_UNIQUE", () => sthm(@sets.inf_unique()))
  log.attempt("INF_UNION", () => sthm(@sets.inf_union()))
  log.attempt("INF_LE_ELEMENT", () => sthm(@sets.inf_le_element()))
  log.attempt("INF_APPROACH", () => sthm(@sets.inf_approach()))
  log.attempt("REAL_MIN_INF", () => sthm(@sets.real_min_inf()))
  log.attempt("has_inf", () => sthm(@sets.has_inf()))
  log.attempt("has_sup", () => sthm(@sets.has_sup()))
  log.attempt("HAS_INF_LBOUND", () => sthm(@sets.has_inf_lbound()))
  log.attempt("HAS_SUP_UBOUND", () => sthm(@sets.has_sup_ubound()))
  log.attempt("HAS_INF_INF", () => sthm(@sets.has_inf_inf()))
  log.attempt("HAS_SUP_SUP", () => sthm(@sets.has_sup_sup()))
  log.attempt("INF_EXISTS", () => sthm(@sets.inf_exists()))
  log.attempt("SUP_EXISTS", () => sthm(@sets.sup_exists()))
  log.attempt("HAS_INF_APPROACH", () => sthm(@sets.has_inf_approach()))
  log.attempt("HAS_SUP_APPROACH", () => sthm(@sets.has_sup_approach()))
  log.attempt("HAS_INF", () => sthm(@sets.has_inf_v1()))
  log.attempt("HAS_SUP", () => sthm(@sets.has_sup_v1()))
  log.attempt("HAS_INF_LE", () => sthm(@sets.has_inf_le()))
  log.attempt("HAS_SUP_LE", () => sthm(@sets.has_sup_le()))
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
      #|sets quotations (1286):
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 x : A, (IN : (A, (A) -> Bool) -> Bool)(x, P) == P(x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (s == t) == (\226\136\128 x : A, IN(x, s) == IN(x, t))
      #|  (GSPEC : ((A) -> Bool, A) -> Bool)((p : (A) -> Bool)) == p
      #|  (SETSPEC : (A, Bool, A) -> Bool)((v : A), (P : Bool), (t : A)) == (P && v == t)
      #|  (\226\136\128 P : ((Bool, A) -> Bool) -> Bool, \226\136\128 x : A, IN(x, GSPEC((v : A) => P(SETSPEC(v)))) == P((p : Bool) => (t : A) => p && x == t)) && (\226\136\128 p : (A) -> Bool, \226\136\128 x : A, IN(x, GSPEC((v : A) => \226\136\131 y : A, SETSPEC(v, p(y), y))) == p(x)) && (\226\136\128 P : ((Bool, A) -> Bool) -> Bool, \226\136\128 x : A, GSPEC((v : A) => P(SETSPEC(v)), x) == P((p : Bool) => (t : A) => p && x == t)) && (\226\136\128 p : (A) -> Bool, \226\136\128 x : A, GSPEC((v : A) => \226\136\131 y : A, SETSPEC(v, p(y), y), x) == p(x)) && (\226\136\128 p : (A) -> Bool, \226\136\128 x : A, IN(x, (y : A) => p(y)) == p(x))
      #|  (EMPTY : (A) -> Bool) == ((x : A) => false)
      #|  (INSERT : (A, (A) -> Bool, A) -> Bool)((x : A), (s : (A) -> Bool)) == ((y : A) => IN(y, s) || y == x)
      #|  (UNIV : (A) -> Bool) == ((x : A) => true)
      #|  (UNION : ((A) -> Bool, (A) -> Bool, A) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == {(x : A) | IN(x, s) || IN(x, t)}
      #|  (UNIONS : (((A) -> Bool) -> Bool, A) -> Bool)((s : ((A) -> Bool) -> Bool)) == {(x : A) | \226\136\131 u : (A) -> Bool, IN(u, s) && IN(x, u)}
      #|  (INTER : ((A) -> Bool, (A) -> Bool, A) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == {(x : A) | IN(x, s) && IN(x, t)}
      #|  (INTERS : (((A) -> Bool) -> Bool, A) -> Bool)((s : ((A) -> Bool) -> Bool)) == {(x : A) | \226\136\128 u : (A) -> Bool, IN(u, s) \226\134\146 IN(x, u)}
      #|  (DIFF : ((A) -> Bool, (A) -> Bool, A) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == {(x : A) | IN(x, s) && !IN(x, t)}
      #|  INSERT((x : A), (s : (A) -> Bool)) == {(y : A) | IN(y, s) || y == x}
      #|  (DELETE : ((A) -> Bool, A, A) -> Bool)((s : (A) -> Bool), (x : A)) == {(y : A) | IN(y, s) && !(y == x)}
      #|  (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == (\226\136\128 x : A, IN(x, s) \226\134\146 IN(x, t))
      #|  (PSUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == (SUBSET(s, t) && !(s == t))
      #|  (DISJOINT : ((A) -> Bool, (A) -> Bool) -> Bool)((s : (A) -> Bool), (t : (A) -> Bool)) == (INTER(s, t) == {})
      #|  (SING : ((A) -> Bool) -> Bool)((s : (A) -> Bool)) == (\226\136\131 x : A, s == {x})
      #|  (FINITE : ((A) -> Bool) -> Bool)({}) && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE(INSERT(x, s)))
      #|  (INFINITE : ((A) -> Bool) -> Bool)((s : (A) -> Bool)) == !FINITE(s)
      #|  (IMAGE : ((A) -> B, (A) -> Bool, B) -> Bool)((f : (A) -> B), (s : (A) -> Bool)) == {(y : B) | \226\136\131 x : A, IN(x, s) && y == f(x)}
      #|  (INJ : ((A) -> B, (A) -> Bool, (B) -> Bool) -> Bool)((f : (A) -> B), (s : (A) -> Bool), (t : (B) -> Bool)) == ((\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y))
      #|  (SURJ : ((A) -> B, (A) -> Bool, (B) -> Bool) -> Bool)((f : (A) -> B), (s : (A) -> Bool), (t : (B) -> Bool)) == ((\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : B, IN(x, t) \226\134\146 (\226\136\131 y : A, IN(y, s) && f(y) == x)))
      #|  (BIJ : ((A) -> B, (A) -> Bool, (B) -> Bool) -> Bool)((f : (A) -> B), (s : (A) -> Bool), (t : (B) -> Bool)) == (INJ(f, s, t) && SURJ(f, s, t))
      #|  (CHOICE : ((A) -> Bool) -> A)((s : (A) -> Bool)) == select((x : A) => IN(x, s))
      #|  (REST : ((A) -> Bool, A) -> Bool)((s : (A) -> Bool)) == DELETE(s, CHOICE(s))
      #|  \226\136\128 x : A, !IN(x, {})
      #|  \226\136\128 x : A, IN(x, UNIV)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, IN(x, UNION(s, t)) == (IN(x, s) || IN(x, t))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 x : A, IN(x, UNIONS(s)) == (\226\136\131 t : (A) -> Bool, IN(t, s) && IN(x, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, IN(x, INTER(s, t)) == (IN(x, s) && IN(x, t))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 x : A, IN(x, INTERS(s)) == (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 IN(x, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, IN(x, DIFF(s, t)) == (IN(x, s) && !IN(x, t))
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : (A) -> Bool, IN(x, INSERT(y, s)) == (x == y || IN(x, s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, \226\136\128 y : A, IN(x, DELETE(s, y)) == (IN(x, s) && !(x == y))
      #|  \226\136\128 x : A, \226\136\128 y : A, IN(x, {y}) == (x == y)
      #|  \226\136\128 y : B, \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, IN(y, IMAGE(f, s)) == (\226\136\131 x : A, y == f(x) && IN(x, s))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, IN(x, REST(s)) == (IN(x, s) && !(x == CHOICE(s)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, INSERT(a, s)) \226\134\146 P(x)) == (P(a) && (\226\136\128 x : A, IN(x, s) \226\134\146 P(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, \226\136\128 s : (A) -> Bool, (\226\136\131 x : A, IN(x, INSERT(a, s)) && P(x)) == (P(a) || (\226\136\131 x : A, IN(x, s) && P(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\128 x : A, IN(x, UNION(s, t)) \226\134\146 P(x)) == ((\226\136\128 x : A, IN(x, s) \226\134\146 P(x)) && (\226\136\128 x : A, IN(x, t) \226\134\146 P(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\131 x : A, IN(x, UNION(s, t)) && P(x)) == ((\226\136\131 x : A, IN(x, s) && P(x)) || (\226\136\131 x : A, IN(x, t) && P(x)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 y : B, IN(y, IMAGE(f, s)) \226\134\146 (P : (B) -> Bool)(y)) == (\226\136\128 x : A, IN(x, s) \226\134\146 P(f(x)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\131 y : B, IN(y, IMAGE(f, s)) && (P : (B) -> Bool)(y)) == (\226\136\131 x : A, IN(x, s) && P(f(x)))
      #|  (\226\136\128 P : (A) -> Bool, \226\136\128 Q : (B) -> Bool, \226\136\128 f : (A) -> B, (\226\136\128 z : B, IN(z, {f((x : A)) | P(x)}) \226\134\146 Q(z)) == (\226\136\128 x : A, P(x) \226\134\146 Q(f(x)))) && (\226\136\128 P : (A, B) -> Bool, \226\136\128 Q : (C) -> Bool, \226\136\128 f : (A, B) -> C, (\226\136\128 z : C, IN(z, {f((x : A), (y : B)) | P(x, y)}) \226\134\146 Q(z)) == (\226\136\128 x : A, \226\136\128 y : B, P(x, y) \226\134\146 Q(f(x, y)))) && (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 Q : (D) -> Bool, \226\136\128 f : (A, B, C) -> D, (\226\136\128 z : D, IN(z, {f((w : A), (x : B), (y : C)) | P(w, x, y)}) \226\134\146 Q(z)) == (\226\136\128 w : A, \226\136\128 x : B, \226\136\128 y : C, P(w, x, y) \226\134\146 Q(f(w, x, y)))) && (\226\136\128 P : (A, B, C, D) -> Bool, \226\136\128 Q : (E) -> Bool, \226\136\128 f : (A, B, C, D) -> E, (\226\136\128 z : E, IN(z, {f((v : A), (w : B), (x : C), (y : D)) | P(v, w, x, y)}) \226\134\146 Q(z)) == (\226\136\128 v : A, \226\136\128 w : B, \226\136\128 x : C, \226\136\128 y : D, P(v, w, x, y) \226\134\146 Q(f(v, w, x, y))))
      #|  (\226\136\128 P : (A) -> Bool, \226\136\128 Q : (B) -> Bool, \226\136\128 f : (A) -> B, (\226\136\131 z : B, IN(z, {f((x : A)) | P(x)}) && Q(z)) == (\226\136\131 x : A, P(x) && Q(f(x)))) && (\226\136\128 P : (A, B) -> Bool, \226\136\128 Q : (C) -> Bool, \226\136\128 f : (A, B) -> C, (\226\136\131 z : C, IN(z, {f((x : A), (y : B)) | P(x, y)}) && Q(z)) == (\226\136\131 x : A, \226\136\131 y : B, P(x, y) && Q(f(x, y)))) && (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 Q : (D) -> Bool, \226\136\128 f : (A, B, C) -> D, (\226\136\131 z : D, IN(z, {f((w : A), (x : B), (y : C)) | P(w, x, y)}) && Q(z)) == (\226\136\131 w : A, \226\136\131 x : B, \226\136\131 y : C, P(w, x, y) && Q(f(w, x, y)))) && (\226\136\128 P : (A, B, C, D) -> Bool, \226\136\128 Q : (E) -> Bool, \226\136\128 f : (A, B, C, D) -> E, (\226\136\131 z : E, IN(z, {f((v : A), (w : B), (x : C), (y : D)) | P(v, w, x, y)}) && Q(z)) == (\226\136\131 v : A, \226\136\131 w : B, \226\136\131 x : C, \226\136\131 y : D, P(v, w, x, y) && Q(f(v, w, x, y))))
      #|  \226\136\128 f : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, UNIONS(IMAGE(f, s)) == {(y : B) | \226\136\131 x : A, IN(x, s) && IN(y, f(x))}
      #|  \226\136\128 f : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, INTERS(IMAGE(f, s)) == {(y : B) | \226\136\128 x : A, IN(x, s) \226\134\146 IN(y, f(x))}
      #|  (\226\136\128 P : (A) -> Bool, \226\136\128 f : (A, B) -> Bool, UNIONS({f((x : A)) | P(x)}) == {(a : B) | \226\136\131 x : A, P(x) && IN(a, f(x))}) && (\226\136\128 P : (A, B) -> Bool, \226\136\128 f : (A, B, C) -> Bool, UNIONS({f((x : A), (y : B)) | P(x, y)}) == {(a : C) | \226\136\131 x : A, \226\136\131 y : B, P(x, y) && IN(a, f(x, y))}) && (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 f : (A, B, C, D) -> Bool, UNIONS({f((x : A), (y : B), (z : C)) | P(x, y, z)}) == {(a : D) | \226\136\131 x : A, \226\136\131 y : B, \226\136\131 z : C, P(x, y, z) && IN(a, f(x, y, z))})
      #|  (\226\136\128 P : (A) -> Bool, \226\136\128 f : (A, B) -> Bool, INTERS({f((x : A)) | P(x)}) == {(a : B) | \226\136\128 x : A, P(x) \226\134\146 IN(a, f(x))}) && (\226\136\128 P : (A, B) -> Bool, \226\136\128 f : (A, B, C) -> Bool, INTERS({f((x : A), (y : B)) | P(x, y)}) == {(a : C) | \226\136\128 x : A, \226\136\128 y : B, P(x, y) \226\134\146 IN(a, f(x, y))}) && (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 f : (A, B, C, D) -> Bool, INTERS({f((x : A), (y : B), (z : C)) | P(x, y, z)}) == {(a : D) | \226\136\128 x : A, \226\136\128 y : B, \226\136\128 z : C, P(x, y, z) \226\134\146 IN(a, f(x, y, z))})
      #|  \226\136\128 s : (A) -> Bool, !(s == {}) \226\134\146 IN(CHOICE(s), s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, !(s == t) == (\226\136\131 x : A, IN(x, t) == !IN(x, s))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, {(x : A) | IN(x, INSERT(a, s)) && P(x)} == (if P(a) { INSERT(a, {(x : A) | IN(x, s) && P(x)}) } else { {(x : A) | IN(x, s) && P(x)} })
      #|  UNIV == {one}
      #|  \226\136\128 s : (A) -> Bool, (\226\136\131 x : A, IN(x, s)) == !(s == {})
      #|  !((UNIV : (A) -> Bool) == ({} : (A) -> Bool))
      #|  !(({} : (A) -> Bool) == (UNIV : (A) -> Bool))
      #|  (\226\136\128 x : A, IN(x, (s : (A) -> Bool))) == (s == UNIV)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET(s, t) && SUBSET(t, u) \226\134\146 SUBSET(s, u)
      #|  \226\136\128 s : (A) -> Bool, SUBSET(s, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) && SUBSET(t, s) \226\134\146 s == t
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (SUBSET(s, t) && SUBSET(t, s)) == (s == t)
      #|  \226\136\128 s : (A) -> Bool, SUBSET({}, s)
      #|  \226\136\128 s : (A) -> Bool, SUBSET(s, {}) == (s == {})
      #|  \226\136\128 s : (A) -> Bool, SUBSET(s, UNIV)
      #|  \226\136\128 s : (A) -> Bool, SUBSET(UNIV, s) == (s == UNIV)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, SUBSET({x}, s) == IN(x, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 P : (A) -> Bool, SUBSET({(x : A) | IN(x, s) && P(x)}, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, PSUBSET(s, t) && PSUBSET(t, u) \226\134\146 PSUBSET(s, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, PSUBSET(s, t) && SUBSET(t, u) \226\134\146 PSUBSET(s, u)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET(s, t) && PSUBSET(t, u) \226\134\146 PSUBSET(s, u)
      #|  \226\136\128 s : (A) -> Bool, !PSUBSET(s, s)
      #|  \226\136\128 s : (A) -> Bool, !PSUBSET(s, {})
      #|  \226\136\128 s : (A) -> Bool, !PSUBSET(UNIV, s)
      #|  \226\136\128 s : (A) -> Bool, PSUBSET(s, UNIV) == (\226\136\131 x : A, !IN(x, s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, PSUBSET(s, t) == (SUBSET(s, t) && (\226\136\131 a : A, IN(a, t) && !IN(a, s)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, UNION(UNION(s, t), u) == UNION(s, UNION(t, u))
      #|  \226\136\128 s : (A) -> Bool, UNION(s, s) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION(s, t) == UNION(t, s)
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, UNION(s, t))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, UNION(t, s)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) == (UNION(s, t) == t)
      #|  (\226\136\128 s : (A) -> Bool, UNION({}, s) == s) && (\226\136\128 s : (A) -> Bool, UNION(s, {}) == s)
      #|  (\226\136\128 s : (A) -> Bool, UNION(UNIV, s) == UNIV) && (\226\136\128 s : (A) -> Bool, UNION(s, UNIV) == UNIV)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (UNION(s, t) == {}) == (s == {} && t == {})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET(UNION(s, t), u) == (SUBSET(s, u) && SUBSET(t, u))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, {(x : A) | IN(x, UNION(s, t)) && P(x)} == UNION({(x : A) | IN(x, s) && P(x)}, {(x : A) | IN(x, t) && P(x)})
      #|  INTER((s : (A) -> Bool), (u : (A) -> Bool))
      #|  INTER((s : (A) -> Bool), (t : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, (\226\136\128 s : (A) -> Bool, SUBSET(s, UNION(t, u)) \226\134\146 (P : ((A) -> Bool) -> Bool)(s)) == (\226\136\128 t' : (A) -> Bool, \226\136\128 u' : (A) -> Bool, SUBSET(t', t) && SUBSET(u', u) \226\134\146 P(UNION(t', u')))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(\226\136\128 x : _, P(x) \226\134\146 !Q(x))
      #|  \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, (\226\136\131 s : (A) -> Bool, SUBSET(s, UNION(t, u)) && (P : ((A) -> Bool) -> Bool)(s)) == (\226\136\131 t' : (A) -> Bool, \226\136\131 u' : (A) -> Bool, SUBSET(t', t) && SUBSET(u', u) && P(UNION(t', u')))
      #|  SUBSET((s : (_) -> Bool), {(a : _)}) == (s == {} || s == {a})
      #|  INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)
      #|  \226\136\128 a : A, \226\136\128 t : (A) -> Bool, (\226\136\128 s : (A) -> Bool, SUBSET(s, INSERT(a, t)) \226\134\146 (P : ((A) -> Bool) -> Bool)(s)) == (\226\136\128 s : (A) -> Bool, SUBSET(s, t) \226\134\146 P(s) && P(INSERT(a, s)))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(\226\136\128 x : _, P(x) \226\134\146 !Q(x))
      #|  \226\136\128 a : A, \226\136\128 t : (A) -> Bool, (\226\136\131 s : (A) -> Bool, SUBSET(s, INSERT(a, t)) && (P : ((A) -> Bool) -> Bool)(s)) == (\226\136\131 s : (A) -> Bool, SUBSET(s, t) && (P(s) || P(INSERT(a, s))))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, INTER(INTER(s, t), u) == INTER(s, INTER(t, u))
      #|  \226\136\128 s : (A) -> Bool, INTER(s, s) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTER(s, t) == INTER(t, s)
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(INTER(s, t), s)) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(INTER(t, s), s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) == (INTER(s, t) == s)
      #|  (\226\136\128 s : (A) -> Bool, INTER({}, s) == {}) && (\226\136\128 s : (A) -> Bool, INTER(s, {}) == {})
      #|  (\226\136\128 s : (A) -> Bool, INTER(UNIV, s) == s) && (\226\136\128 s : (A) -> Bool, INTER(s, UNIV) == s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET(s, INTER(t, u)) == (SUBSET(s, t) && SUBSET(s, u))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, {(x : A) | IN(x, INTER(s, t)) && P(x)} == INTER({(x : A) | IN(x, s) && P(x)}, {(x : A) | IN(x, t) && P(x)})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, INTER(s, UNION(t, u)) == UNION(INTER(s, t), INTER(s, u))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, UNION(s, INTER(t, u)) == INTER(UNION(s, t), UNION(s, u))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, DISJOINT(s, t) == !(\226\136\131 x : A, IN(x, s) && IN(x, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, DISJOINT(s, t) == DISJOINT(t, s)
      #|  \226\136\128 s : (A) -> Bool, DISJOINT({}, s) && DISJOINT(s, {})
      #|  \226\136\128 s : (A) -> Bool, (s == {}) == DISJOINT(s, s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, DISJOINT(UNION(s, t), u) == (DISJOINT(s, u) && DISJOINT(t, u))
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 a : A, DISJOINT(s, {a}) == !IN(a, s)) && (\226\136\128 s : (A) -> Bool, \226\136\128 a : A, DISJOINT({a}, s) == !IN(a, s))
      #|  \226\136\128 s : (A) -> Bool, DIFF(s, {}) == s
      #|  \226\136\128 s : (A) -> Bool, DIFF({}, s) == {}
      #|  \226\136\128 s : (A) -> Bool, DIFF(s, UNIV) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, DIFF(DIFF(s, t), t) == DIFF(s, t)
      #|  \226\136\128 s : (A) -> Bool, DIFF(s, s) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(DIFF(s, t), s)
      #|  \226\136\128 s : (A) -> Bool, DIFF(UNIV, DIFF(UNIV, s)) == s
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, {(x : A) | IN(x, DIFF(s, t)) && P(x)} == DIFF({(x : A) | IN(x, s) && P(x)}, {(x : A) | IN(x, t) && P(x)})
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, IN(x, INSERT(x, s))
      #|  DELETE((s : (A) -> Bool), (x : A))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, IN(x, s) == (\226\136\131 t : (A) -> Bool, s == INSERT(x, t) && !IN(x, t))
      #|  \226\136\128 s : (A) -> Bool, s == {} || (\226\136\131 x : A, \226\136\131 t : (A) -> Bool, s == INSERT(x, t) && !IN(x, t))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, IN(x, s) == (INSERT(x, s) == s)
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, INSERT(x, INSERT(x, s)) == INSERT(x, s)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : (A) -> Bool, INSERT(x, INSERT(y, s)) == INSERT(y, INSERT(x, s))
      #|  \226\136\128 x : A, INSERT(x, UNIV) == UNIV
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, !(INSERT(x, s) == {})
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, !({} == INSERT(x, s))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION(INSERT(x, s), t) == (if IN(x, t) { UNION(s, t) } else { INSERT(x, UNION(s, t)) })
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION(INSERT(x, s), t) == INSERT(x, UNION(s, t))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTER(INSERT(x, s), t) == (if IN(x, t) { INSERT(x, INTER(s, t)) } else { INTER(s, t) })
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, DISJOINT(INSERT(x, s), t) == (DISJOINT(s, t) && !IN(x, t))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(INSERT(x, s), t) == (IN(x, t) && SUBSET(s, t))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, !IN(x, s) \226\134\146 (\226\136\128 t : (A) -> Bool, SUBSET(s, INSERT(x, t)) == SUBSET(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, DIFF(INSERT(x, s), t) == (if IN(x, t) { DIFF(s, t) } else { INSERT(x, DIFF(s, t)) })
      #|  INSERT((x : A), INSERT((y : A), (s : (A) -> Bool))) == INSERT(y, INSERT(x, s)) && INSERT(x, INSERT(x, s)) == INSERT(x, s)
      #|  INTER((p : (A) -> Bool), (q : (A) -> Bool)) == INTER(q, p) && INTER(INTER(p, q), (r : (A) -> Bool)) == INTER(p, INTER(q, r)) && INTER(p, INTER(q, r)) == INTER(q, INTER(p, r)) && INTER(p, p) == p && INTER(p, INTER(p, q)) == INTER(p, q)
      #|  UNION((p : (A) -> Bool), (q : (A) -> Bool)) == UNION(q, p) && UNION(UNION(p, q), (r : (A) -> Bool)) == UNION(p, UNION(q, r)) && UNION(p, UNION(q, r)) == UNION(q, UNION(p, r)) && UNION(p, p) == p && UNION(p, UNION(p, q)) == UNION(p, q)
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, !IN(x, s) == (DELETE(s, x) == s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, \226\136\128 x' : A, (IN(x, s) == IN(x', s)) == (IN(x, DELETE(s, x')) == IN(x', DELETE(s, x)))
      #|  \226\136\128 x : A, DELETE({}, x) == {}
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, DELETE(DELETE(s, x), x) == DELETE(s, x)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : (A) -> Bool, DELETE(DELETE(s, x), y) == DELETE(DELETE(s, y), x)
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, SUBSET(DELETE(s, x), s)
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, DELETE(t, x)) == (!IN(x, s) && SUBSET(s, t))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, INSERT(x, t)) == SUBSET(DELETE(s, x), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, DIFF(s, INSERT(x, t)) == DIFF(DELETE(s, x), t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, PSUBSET(s, t) == (\226\136\131 x : A, !IN(x, s) && SUBSET(INSERT(x, s), t))
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : (A) -> Bool, DELETE(INSERT(x, s), y) == (if x == y { DELETE(s, y) } else { INSERT(x, DELETE(s, y)) })
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, IN(x, s) \226\134\146 INSERT(x, DELETE(s, x)) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, INTER(DELETE(s, x), t) == DELETE(INTER(s, t), x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 x : A, DISJOINT(DELETE(s, x), t) == DISJOINT(DELETE(t, x), s)
      #|  (UNIONS : (((A) -> Bool) -> Bool, A) -> Bool)(({} : ((A) -> Bool) -> Bool)) == ({} : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, UNIONS({s}) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNIONS({s, t}) == UNION(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, UNIONS(INSERT(s, u)) == UNION(s, UNIONS(u))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : ((A) -> Bool) -> Bool, (\226\136\128 x : A, IN(x, UNIONS(s)) \226\134\146 P(x)) == (\226\136\128 t : (A) -> Bool, \226\136\128 x : A, IN(t, s) && IN(x, t) \226\134\146 P(x))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 s : ((A) -> Bool) -> Bool, (\226\136\131 x : A, IN(x, UNIONS(s)) && P(x)) == (\226\136\131 t : (A) -> Bool, \226\136\131 x : A, IN(t, s) && IN(x, t) && P(x))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, (UNIONS(s) == {}) == (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 t == {})
      #|  (\226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : (A) -> Bool, INTER(UNIONS(s), t) == UNIONS({INTER((x : (A) -> Bool), t) | IN(x, s)})) && (\226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : (A) -> Bool, INTER(t, UNIONS(s)) == UNIONS({INTER(t, (x : (A) -> Bool)) | IN(x, s)}))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(UNIONS(f), t) == (\226\136\128 s : (A) -> Bool, IN(s, f) \226\134\146 SUBSET(s, t))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 g : ((A) -> Bool) -> Bool, SUBSET(f, g) \226\134\146 SUBSET(UNIONS(f), UNIONS(g))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, UNIONS(UNION(s, t)) == UNION(UNIONS(s), UNIONS(t))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, INTERS(UNION(s, t)) == INTER(INTERS(s), INTERS(t))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, (\226\136\128 x : (A) -> Bool, IN(x, s) \226\134\146 (\226\136\131 y : (A) -> Bool, IN(y, t) && SUBSET(x, y))) \226\134\146 SUBSET(UNIONS(s), UNIONS(t))
      #|  \226\136\128 f : (A, B) -> Bool, \226\136\128 g : (A, B) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 SUBSET(f(x), g(x))) \226\134\146 SUBSET(UNIONS(IMAGE(f, s)), UNIONS(IMAGE(g, s)))
      #|  (UNIONS : (((A) -> Bool) -> Bool, A) -> Bool)((UNIV : ((A) -> Bool) -> Bool)) == (UNIV : (A) -> Bool)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, UNIONS(INSERT({}, s)) == UNIONS(s)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, UNIONS(DELETE(s, {})) == UNIONS(s)
      #|  (INTERS : (((A) -> Bool) -> Bool, A) -> Bool)(({} : ((A) -> Bool) -> Bool)) == (UNIV : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, INTERS({s}) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERS({s, t}) == INTER(s, t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, INTERS(INSERT(s, u)) == INTER(s, INTERS(u))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : ((A) -> Bool) -> Bool, SUBSET(s, INTERS(f)) == (\226\136\128 t : (A) -> Bool, IN(t, f) \226\134\146 SUBSET(s, t))
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, !(u == {}) && (\226\136\128 t : (A) -> Bool, IN(t, u) \226\134\146 SUBSET(t, s)) \226\134\146 SUBSET(INTERS(u), s)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\131 t : (A) -> Bool, IN(t, u) && SUBSET(t, s)) \226\134\146 SUBSET(INTERS(u), s)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 g : ((A) -> Bool) -> Bool, SUBSET(g, f) \226\134\146 SUBSET(INTERS(f), INTERS(g))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, (INTERS(f) == UNIV) == (\226\136\128 s : (A) -> Bool, IN(s, f) \226\134\146 s == UNIV)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, (\226\136\128 y : (A) -> Bool, IN(y, t) \226\134\146 (\226\136\131 x : (A) -> Bool, IN(x, s) && SUBSET(x, y))) \226\134\146 SUBSET(INTERS(s), INTERS(t))
      #|  IMAGE((f : (A) -> B), {}) == {} && IMAGE(f, INSERT((x : A), (s : (A) -> Bool))) == INSERT(f(x), IMAGE(f, s))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IMAGE(f, UNION(s, t)) == UNION(IMAGE(f, s), IMAGE(f, t))
      #|  \226\136\128 s : (A) -> Bool, IMAGE((x : A) => x, s) == s
      #|  \226\136\128 s : (A) -> Bool, IMAGE(I, s) == s
      #|  \226\136\128 f : (B) -> C, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, IMAGE(o(f, g), s) == IMAGE(f, IMAGE(g, s))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) \226\134\146 SUBSET(IMAGE(f, s), IMAGE(f, t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) \226\134\146 IMAGE(f, INTER(s, t)) == INTER(IMAGE(f, s), IMAGE(f, t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, t) && f(x) == f(y) \226\134\146 x == y) \226\134\146 IMAGE(f, DIFF(s, t)) == DIFF(IMAGE(f, s), IMAGE(f, t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && SUBSET(t, s) \226\134\146 IMAGE(f, DIFF(s, t)) == DIFF(IMAGE(f, s), IMAGE(f, t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, (\226\136\128 x : A, IN(x, s) && f(x) == f(a) \226\134\146 x == a) \226\134\146 IMAGE(f, DELETE(s, a)) == DELETE(IMAGE(f, s), f(a))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 a : A, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && IN(a, s) \226\134\146 IMAGE(f, DELETE(s, a)) == DELETE(IMAGE(f, s), f(a))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (IMAGE(f, s) == {}) == (s == {})
      #|  \226\136\128 f : (A) -> B, \226\136\128 P : (B, B) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 x : B, \226\136\128 y : B, IN(x, IMAGE(f, s)) && IN(y, IMAGE(f, s)) \226\134\146 P(x, y)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 P(f(x), f(y)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 c : B, IMAGE((x : A) => c, s) == (if s == {} { {} } else { {c} })
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, {f((x : A)) | IN(x, s)} == IMAGE(f, s)
      #|  \226\136\128 f : (A) -> B, \226\136\128 P : (A) -> Bool, {f((x : A)) | P(x)} == IMAGE(f, {(x : A) | P(x)})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : ((A) -> Bool) -> Bool, IMAGE(f, UNIONS(s)) == UNIONS(IMAGE(IMAGE(f), s))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), IMAGE(f, s))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, f(x) == y)) && (\226\136\128 x : A, IN(f(x), t) == IN(x, s)) \226\134\146 IMAGE(f, s) == t
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 IMAGE(f, s) == IMAGE(g, s)
      #|  {(x : A) | false} == {}
      #|  {(x : A) | true} == UNIV
      #|  (\226\136\128 a : A, {(x : A) | x == a} == {a}) && (\226\136\128 a : A, {(x : A) | a == x} == {a})
      #|  \226\136\128 s : (A) -> Bool, (\226\136\131 x : A, s == {x}) == existsunique((x : A) => IN(x, s))
      #|  \226\136\128 s : (A) -> Bool, {(x : A) | IN(x, s)} == s
      #|  \226\136\128 P : (A, B) -> Bool, \226\136\128 a : A, \226\136\128 b : B, IN((a, b), {((x : A), (y : B)) | P(x, y)}) == P(a, b)
      #|  (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 a : A, \226\136\128 b : B, \226\136\128 c : C, IN((a, b, c), {((x : A), (y : B), (z : C)) | P(x, y, z)}) == P(a, b, c)) && (\226\136\128 P : (A, B, C) -> Bool, \226\136\128 a : A, \226\136\128 b : B, \226\136\128 c : C, IN(((a, b), c), {(((x : A), (y : B)), (z : C)) | P(x, y, z)}) == P(a, b, c))
      #|  (\226\136\128 P : (A, B, C, D) -> Bool, \226\136\128 a : A, \226\136\128 b : B, \226\136\128 c : C, \226\136\128 d : D, IN((a, b, c, d), {((w : A), (x : B), (y : C), (z : D)) | P(w, x, y, z)}) == P(a, b, c, d)) && (\226\136\128 P : (A, B, C, D) -> Bool, \226\136\128 a : A, \226\136\128 b : B, \226\136\128 c : C, \226\136\128 d : D, IN(((a, b), c, d), {(((w : A), (x : B)), (y : C), (z : D)) | P(w, x, y, z)}) == P(a, b, c, d)) && (\226\136\128 P : (A, B, C, D) -> Bool, \226\136\128 a : A, \226\136\128 b : B, \226\136\128 c : C, \226\136\128 d : D, IN((((a, b), c), d), {((((w : A), (x : B)), (y : C)), (z : D)) | P(w, x, y, z)}) == P(a, b, c, d))
      #|  \226\136\128 P : ((A, B)) -> Bool, {(p : (A, B)) | P(p)} == {((a : A), (b : B)) | P((a, b))}
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, P({}) && (\226\136\128 a : A, \226\136\128 s : (A) -> Bool, !IN(a, s) \226\134\146 P(INSERT(a, s))) \226\134\146 (\226\136\128 s : (A) -> Bool, P(s))
      #|  \226\136\128 P : (A) -> Bool, UNIONS({{(x : A)} | P(x)}) == {(x : A) | P(x)}
      #|  \226\136\128 s : (A) -> Bool, UNIONS({{(x : A)} | IN(x, s)}) == s
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : ((A) -> Bool) -> Bool, !(s == {}) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, UNIONS(s)) && IN(y, UNIONS(s)) && f(x) == f(y) \226\134\146 x == y) \226\134\146 IMAGE(f, INTERS(s)) == INTERS(IMAGE(IMAGE(f), s))
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 s : ((A) -> Bool) -> Bool, DIFF(u, INTERS(s)) == UNIONS({DIFF(u, (t : (A) -> Bool)) | IN(t, s)})
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, INTERS(s) == DIFF(UNIV, UNIONS({DIFF(UNIV, (t : (A) -> Bool)) | IN(t, s)}))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, UNIONS(s) == DIFF(UNIV, INTERS({DIFF(UNIV, (t : (A) -> Bool)) | IN(t, s)}))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : (A) -> Bool, DIFF(UNIONS(s), t) == UNIONS({DIFF((x : (A) -> Bool), t) | IN(x, s)})
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 s : ((A) -> Bool) -> Bool, DIFF(u, UNIONS(s)) == INTER(u, INTERS({DIFF(u, (t : (A) -> Bool)) | IN(t, s)}))
      #|  \226\136\128 u : (A) -> Bool, \226\136\128 s : ((A) -> Bool) -> Bool, !(s == {}) \226\134\146 DIFF(u, UNIONS(s)) == INTERS({DIFF(u, (t : (A) -> Bool)) | IN(t, s)})
      #|  (b : B)
      #|  \226\136\128 f : (A, (B) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTERS({UNIONS(f((x : A))) | IN(x, s)}) == UNIONS({INTERS({g((x : A)) | IN(x, s)}) | g : (A, B) -> Bool | \226\136\128 x : A, IN(x, s) \226\134\146 IN(g(x), f(x))})
      #|  (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTER(s, INTERS(f)) == (if f == {} { s } else { INTERS({INTER(s, (t : (A) -> Bool)) | IN(t, f)}) })) && (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTER(INTERS(f), s) == (if f == {} { s } else { INTERS({INTER((t : (A) -> Bool), s) | IN(t, f)}) }))
      #|  ((p : Bool) == (q : Bool)) == (!p == !q)
      #|  \226\136\128 f : (A, (B) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNIONS({INTERS(f((x : A))) | IN(x, s)}) == INTERS({UNIONS({g((x : A)) | IN(x, s)}) | g : (A, B) -> Bool | \226\136\128 x : A, IN(x, s) \226\134\146 IN(g(x), f(x))})
      #|  (\226\136\131 s : _, (f : (_) -> Bool) == {s}) == (!(f == {}) && (\226\136\128 s : _, \226\136\128 t : _, IN(s, f) && IN(t, f) \226\134\146 s == t))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, (UNIONS(f) == INTERS(f)) == (\226\136\131 s : (A) -> Bool, f == {s})
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, existsunique((s : (A) -> Bool) => P(s)) == (UNIONS({(s : (A) -> Bool) | P(s)}) == INTERS({(s : (A) -> Bool) | P(s)}))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : ((A) -> Bool) -> Bool, SUBSET(IMAGE(f, INTERS(g)), INTERS(IMAGE(IMAGE(f), g)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(IMAGE(f, INTER(s, t)), INTER(IMAGE(f, s), IMAGE(f, t)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET({(x : A) | IN(x, u) && IN(f(x), IMAGE(f, s))}, s) && SUBSET(t, u) || SUBSET({(x : A) | IN(x, u) && IN(f(x), IMAGE(f, t))}, t) && SUBSET(s, u) \226\134\146 IMAGE(f, INTER(s, t)) == INTER(IMAGE(f, s), IMAGE(f, t))
      #|  !((g : ((_) -> Bool) -> Bool) == {}) && (\226\136\128 t : (_) -> Bool, IN(t, g) \226\134\146 SUBSET(t, (u : (_) -> Bool)) && SUBSET({(x : _) | IN(x, u) && IN((f : (_) -> _)(x), IMAGE(f, t))}, t)) \226\134\146 IMAGE(f, INTERS(g)) == INTERS(IMAGE(IMAGE(f), g))
      #|  (u : (A) -> Bool)
      #|  IMAGE((f : (_) -> _), INTER((s : (_) -> Bool), (t : (_) -> Bool))) == INTER(IMAGE(f, s), IMAGE(f, t)) && IMAGE(f, t) == (u : (_) -> Bool) \226\134\146 IMAGE(f, INTER(s, t)) == INTER(IMAGE(f, s), u)
      #|  DELETE((g : ((A) -> Bool) -> Bool), (s : (A) -> Bool)) == {}
      #|  IN((x : _), (s : (_) -> Bool)) \226\134\146 s == INSERT(x, DELETE(s, x))
      #|  !IN((s : _), (g : (_) -> Bool)) \226\134\146 DELETE(g, s) == g
      #|  IN((s : (A) -> Bool), (g : ((A) -> Bool) -> Bool))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 u : (A) -> Bool, !(g == {}) && (\226\136\128 t : (A) -> Bool, IN(t, g) \226\134\146 SUBSET(t, u)) && (\226\136\128 t : (A) -> Bool, IN(t, DELETE(g, s)) \226\134\146 SUBSET({(x : A) | IN(x, u) && IN(f(x), IMAGE(f, t))}, t)) \226\134\146 IMAGE(f, INTERS(g)) == INTERS(IMAGE(IMAGE(f), g))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET({(x : A) | IN(f(x), IMAGE(f, s))}, s) || SUBSET({(x : A) | IN(f(x), IMAGE(f, t))}, t) \226\134\146 IMAGE(f, INTER(s, t)) == INTER(IMAGE(f, s), IMAGE(f, t))
      #|  (UNIV : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, !(g == {}) && (\226\136\128 t : (A) -> Bool, IN(t, DELETE(g, s)) \226\134\146 SUBSET({(x : A) | IN(f(x), IMAGE(f, t))}, t)) \226\134\146 IMAGE(f, INTERS(g)) == INTERS(IMAGE(IMAGE(f), g))
      #|  IN((x : A), (s : (A) -> Bool))
      #|  INSERT((x : A), (s : (A) -> Bool)) == s
      #|  IN((x : A), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE(s) && (P : ((A) -> Bool) -> Bool)(s)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, P({}) && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, P(s) && !IN(x, s) && FINITE(s) \226\134\146 P(INSERT(x, s))) \226\134\146 (\226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 P(s))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> B, (\226\136\128 x : A, \226\136\128 y : A, P(x) && P(y) && f(x) == f(y) \226\134\146 x == y) == (\226\136\128 x : A, \226\136\128 y : A, P(x) && P(y) \226\134\146 (f(x) == f(y)) == (x == y))
      #|  \226\136\128 f : (A) -> B, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) == (\226\136\128 x : A, \226\136\128 y : A, (f(x) == f(y)) == (x == y))
      #|  \226\136\128 f : (A) -> B, \226\136\128 t : (B) -> Bool, (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, (s : (A) -> Bool)) && f(x) == y)) == (\226\136\131 g : (B) -> A, \226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y)
      #|  (\226\136\128 x : A, IN(x, (s : (A) -> Bool)) \226\134\146 (g : (B) -> A)((f : (A) -> B)(x)) == x) == (\226\136\128 y : B, \226\136\128 x : A, IN(x, s) && y == f(x) \226\134\146 g(y) == x)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) == (\226\136\131 g : (B) -> A, \226\136\128 x : A, IN(x, s) \226\134\146 g(f(x)) == x)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) \226\134\146 ((\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && f(x) == y))) == (\226\136\131 g : (B) -> A, (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s)) && (\226\136\128 y : B, IN(y, t) \226\134\146 f(g(y)) == y) && (\226\136\128 x : A, IN(x, s) \226\134\146 g(f(x)) == x))
      #|  \226\136\128 f : (A) -> B, (\226\136\128 y : B, \226\136\131 x : A, f(x) == y) == (\226\136\131 g : (B) -> A, \226\136\128 y : B, f(g(y)) == y)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) == (\226\136\131 g : (B) -> A, \226\136\128 x : A, g(f(x)) == x)
      #|  (UNIV : (B) -> Bool)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, ((\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) && (\226\136\128 y : B, \226\136\131 x : A, f(x) == y)) == (\226\136\131 g : (B) -> A, (\226\136\128 y : B, f(g(y)) == y) && (\226\136\128 x : A, g(f(x)) == x))
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x) \226\134\146 (f : (_) -> _)(x) == (g : (_) -> _)((k : (_) -> _)(x))) == (\226\136\128 y : _, \226\136\128 x : _, P(x) && y == k(x) \226\134\146 f(x) == g(y))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, (\226\136\128 x : A, \226\136\128 y : A, P(x) && P(y) && g(x) == g(y) \226\134\146 f(x) == f(y)) == (\226\136\131 h : (C) -> B, \226\136\128 x : A, P(x) \226\134\146 f(x) == h(g(x)))
      #|  (x : _) => true
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, (\226\136\128 x : A, \226\136\128 y : A, g(x) == g(y) \226\134\146 f(x) == f(y)) == (\226\136\131 h : (C) -> B, f == o(h, g))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 f : (A) -> C, \226\136\128 g : (B) -> C, (\226\136\128 x : A, P(x) \226\134\146 (\226\136\131 y : B, g(y) == f(x))) == (\226\136\131 h : (A) -> B, \226\136\128 x : A, P(x) \226\134\146 f(x) == g(h(x)))
      #|  \226\136\128 f : (A) -> C, \226\136\128 g : (B) -> C, (\226\136\128 x : A, \226\136\131 y : B, g(y) == f(x)) == (\226\136\131 h : (A) -> B, f == o(g, h))
      #|  \226\136\128 f : (A) -> B, (\226\136\128 y : B, \226\136\131 x : A, f(x) == y) == (\226\136\128 P : (B) -> Bool, (\226\136\128 x : A, P(f(x))) == (\226\136\128 y : B, P(y)))
      #|  (y : B) => \226\136\128 x : A, !((f : (A) -> B)(x) == y)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 y : B, \226\136\131 x : A, f(x) == y) == (\226\136\128 P : (B) -> Bool, (\226\136\131 x : A, P(f(x))) == (\226\136\131 y : B, P(y)))
      #|  (y : B) => true
      #|  \226\136\128 f : (A) -> B, (\226\136\128 y : B, \226\136\131 x : A, f(x) == y) == (\226\136\128 P : (B) -> Bool, IMAGE(f, {(x : A) | P(f(x))}) == {(x : B) | P(x)})
      #|  IMAGE((g : (B) -> A), IMAGE((f : (A) -> B), (s : (A) -> Bool)))
      #|  \226\136\131 g : (B) -> A, \226\136\128 y : B, IN(y, IMAGE((f : (A) -> B), (s : (A) -> Bool))) \226\134\146 IN(g(y), s) && f(g(y)) == y
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\131 t : (A) -> Bool, SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) && f(x) == f(y) \226\134\146 x == y)
      #|  (FINITE : ((A) -> Bool) -> Bool)(({} : (A) -> Bool))
      #|  !IN((x : A), (t : (A) -> Bool))
      #|  SUBSET((t : (A) -> Bool), INSERT((x : A), (u : (A) -> Bool)))
      #|  IN((x : A), (t : (A) -> Bool))
      #|  INSERT((x : A), DELETE((t : (A) -> Bool), x)) == t
      #|  IN((x : A), (t : (A) -> Bool))
      #|  SUBSET((t : (A) -> Bool), INSERT((x : A), (u : (A) -> Bool)))
      #|  FINITE(INSERT((x : A), DELETE((t : (A) -> Bool), x)))
      #|  (t : (A) -> Bool)
      #|  (u : (A) -> Bool)
      #|  (x : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(s, t) \226\134\146 FINITE(s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 P : (A) -> Bool, FINITE(s) \226\134\146 FINITE({(x : A) | IN(x, s) && P(x)})
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION(INSERT(x, s), t) == INSERT(x, UNION(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE(UNION(s, t))
      #|  UNION((s : (A) -> Bool), (t : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(UNION(s, t)) == (FINITE(s) && FINITE(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) || FINITE(t) \226\134\146 FINITE(INTER(s, t))
      #|  INSERT((x : A), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, FINITE(INSERT(x, s)) == FINITE(s)
      #|  \226\136\128 a : A, FINITE({a})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, FINITE(s) \226\134\146 FINITE(DELETE(s, x))
      #|  DELETE((s : (A) -> Bool), (x : A)) == s
      #|  (s : (A) -> Bool) == INSERT((x : A), DELETE(s, x))
      #|  IN((x : A), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 x : A, FINITE(DELETE(s, x)) == FINITE(s)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, FINITE(s) \226\134\146 FINITE(UNIONS(s)) == (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 FINITE(t))
      #|  {(y : B) | \226\136\131 z : A, IN(z, INSERT((x : A), (s : (A) -> Bool))) && y == (f : (A) -> B)(z)} == UNION({(y : B) | \226\136\131 z : A, IN(z, s) && y == f(z)}, {f(x)})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE({(y : B) | \226\136\131 x : A, IN(x, s) && y == f(x)})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE(IMAGE(f, s))
      #|  IMAGE((g : (B) -> A), (A : (B) -> Bool))
      #|  (g : (B) -> A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && FINITE(A) \226\134\146 FINITE({(x : A) | IN(x, s) && IN(f(x), A)})
      #|  {(x : A) | IN(x, (s : (A) -> Bool)) && IN((f : (A) -> B)(x), (t : (B) -> Bool))} == UNIONS(IMAGE((a : B) => {(x : A) | IN(x, s) && f(x) == a}, t))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(t) && (\226\136\128 y : B, IN(y, t) \226\134\146 FINITE({(x : A) | IN(x, s) && f(x) == y})) \226\134\146 FINITE({(x : A) | IN(x, s) && IN(f(x), t)})
      #|  (t : (B) -> Bool)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 t : (B) -> Bool, FINITE(t) && (\226\136\128 y : B, IN(y, t) \226\134\146 FINITE({(x : A) | f(x) == y})) \226\134\146 FINITE({(x : A) | IN(f(x), t)})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 FINITE(IMAGE(f, s)) == FINITE(s)
      #|  (UNIV : (A) -> Bool)
      #|  (A : (B) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) && FINITE(A) \226\134\146 FINITE({(x : A) | IN(f(x), A)})
      #|  IMAGE((g : (A) -> C), (s : (A) -> Bool)) == IMAGE((h : (B) -> C), IMAGE((f : (A) -> B), s))
      #|  (h : (B) -> C)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(IMAGE(f, s), t) && FINITE(t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 g(x) == g(y)) \226\134\146 FINITE(IMAGE(g, s))
      #|  (s : (A) -> Bool) == IMAGE((g : (B) -> A), IMAGE((f : (A) -> B), s))
      #|  (g : (B) -> A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, INFINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 INFINITE(IMAGE(f, s))
      #|  \226\136\128 f : (A) -> B, (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y) \226\134\146 (\226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 INFINITE(IMAGE(f, s)))
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) \226\134\146 !(s == {})
      #|  UNION((t : (A) -> Bool), DIFF((s : (A) -> Bool), t))
      #|  ((b : Bool) && !(c : Bool) \226\134\146 !(a : Bool)) \226\134\146 a && b \226\134\146 c
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INFINITE(s) && FINITE(t) \226\134\146 INFINITE(DIFF(s, t))
      #|  IMAGE((g : (B) -> A), (s : (B) -> Bool))
      #|  (g : (B) -> A)
      #|  SUBSET((s : (_) -> Bool), IMAGE((f : (_) -> _), (t : (_) -> Bool))) \226\134\146 (\226\136\128 x : _, IN(x, s) \226\134\146 (\226\136\131 y : _, IN(y, t) && f(y) == x))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (B) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, IMAGE(f, t)) == (\226\136\131 u : (A) -> Bool, SUBSET(u, t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, u) && IN(y, u) \226\134\146 (f(x) == f(y)) == (x == y)) && s == IMAGE(f, u))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (B) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, IMAGE(f, t)) == (\226\136\131 u : (A) -> Bool, SUBSET(u, t) && s == IMAGE(f, u))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\131 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, SUBSET(t, s) && P(IMAGE(f, t)))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, SUBSET(t, s) \226\134\146 P(IMAGE(f, t)))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\131 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) && P(IMAGE(f, t)))
      #|  (\226\136\128 t : _, (p : (_) -> Bool)(t)) == !(\226\136\131 t : _, !p(t))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 t : (B) -> Bool, SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) \226\134\146 P(IMAGE(f, t)))
      #|  ((p : Bool) && (q : Bool) && (r : Bool)) == (q && p && r)
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\131 t : (B) -> Bool, FINITE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) && P(IMAGE(f, t)))
      #|  (\226\136\128 t : _, (p : (_) -> Bool)(t)) == !(\226\136\131 t : _, !p(t))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 t : (B) -> Bool, FINITE(t) && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) \226\134\146 P(IMAGE(f, t)))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\131 t : (B) -> Bool, FINITE(t) && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && P(IMAGE(f, t)))
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x)) == !(\226\136\131 x : _, !P(x))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 t : (B) -> Bool, FINITE(t) && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) \226\134\146 P(IMAGE(f, t)))
      #|  (t : (B) -> Bool)
      #|  (t : (B) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (FINITE(t) && SUBSET(t, IMAGE(f, s))) == (\226\136\131 s' : (A) -> Bool, FINITE(s') && SUBSET(s', s) && t == IMAGE(f, s'))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(t) && SUBSET(t, IMAGE(f, s)) \226\134\146 (\226\136\131 s' : (A) -> Bool, FINITE(s') && SUBSET(s', s) && SUBSET(t, IMAGE(f, s')))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(IMAGE(f, s)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t))
      #|  (s : (A) -> Bool)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(IMAGE(f, s)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && IMAGE(f, s) == IMAGE(f, t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)))
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
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) \226\134\146 FINITE(DIFF(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INFINITE(s) && SUBSET(s, t) \226\134\146 INFINITE(t)
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, !R(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, R(x, y) && R(y, z) \226\134\146 R(x, z)) && (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 y : A, IN(y, s) && R(x, y))) \226\134\146 s == {}
      #|  {(t : (A) -> Bool) | IN(t, (f : ((A) -> Bool) -> Bool)) && SUBSET((s : (A) -> Bool), t)}
      #|  (t : (A) -> Bool) => (u : (A) -> Bool) => SUBSET((s : (A) -> Bool), t) && PSUBSET(t, u)
      #|  (p : Bool) == !!p
      #|  (s : (A) -> Bool)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, FINITE(f) \226\134\146 UNIONS({(t : (A) -> Bool) | IN(t, f) && (\226\136\128 u : (A) -> Bool, IN(u, f) \226\134\146 !PSUBSET(t, u))}) == UNIONS(f)
      #|  IMAGE((u : (A, A) -> Bool), (s : (A) -> Bool))
      #|  (u : (A, A) -> Bool)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, FINITE(s) && SUBSET(s, UNIONS(f)) \226\134\146 (\226\136\131 f' : ((A) -> Bool) -> Bool, FINITE(f') && SUBSET(f', f) && SUBSET(s, UNIONS(f')))
      #|  UNION((s : (_) -> Bool), (t : (_) -> Bool)) == s || UNION(s, t) == t \226\134\146 IN(t, (f : ((_) -> Bool) -> Bool)) \226\134\146 UNION(s, t) == s || IN(UNION(s, t), f)
      #|  (f : ((A) -> Bool) -> Bool) == {}
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool)) == ((p \226\134\146 q) && (p \226\134\146 r))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, FINITE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IN(s, f) && IN(t, f) \226\134\146 SUBSET(s, t) || SUBSET(t, s)) \226\134\146 IN(UNIONS(f), f)
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool)) == s || INTER(s, t) == t \226\134\146 IN(t, (f : ((_) -> Bool) -> Bool)) \226\134\146 INTER(s, t) == s || IN(INTER(s, t), f)
      #|  (f : ((A) -> Bool) -> Bool) == {}
      #|  (f : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool)) == ((p \226\134\146 q) && (p \226\134\146 r))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, FINITE(f) && !(f == {}) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IN(s, f) && IN(t, f) \226\134\146 SUBSET(s, t) || SUBSET(t, s)) \226\134\146 IN(INTERS(f), f)
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, !(f == {}) && (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, IN(t, f) && IN(u, f) \226\134\146 (\226\136\131 v : (A) -> Bool, IN(v, f) && SUBSET(t, v) && SUBSET(u, v))) && FINITE(s) \226\134\146 SUBSET(s, UNIONS(f)) == (\226\136\131 t : (A) -> Bool, IN(t, f) && SUBSET(s, t))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, !(f == {}) && (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, IN(t, f) && IN(u, f) \226\134\146 SUBSET(t, u) || SUBSET(u, t)) && FINITE(s) \226\134\146 SUBSET(s, UNIONS(f)) == (\226\136\131 t : (A) -> Bool, IN(t, f) && SUBSET(s, t))
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, FINITE(s) && SUBSET(s, UNIONS(f)) && !(f == {}) && (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, IN(t, f) && IN(u, f) \226\134\146 SUBSET(t, u) || SUBSET(u, t)) \226\134\146 (\226\136\131 t : (A) -> Bool, IN(t, f) && SUBSET(s, t))
      #|  (FINREC : ((A, B) -> B, B, (A) -> Bool, B, Num) -> Bool)((f : (A, B) -> B), (b : B), (s : (A) -> Bool), (a : B), 0) == (s == {} && a == b) && FINREC(f, b, s, a, SUC((n : Num))) == (\226\136\131 x : A, \226\136\131 c : B, IN(x, s) && FINREC(f, b, DELETE(s, x), c, n) && a == f(x, c))
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, \226\136\128 s : (A) -> Bool, \226\136\128 a : B, FINREC(f, b, s, a, SUC(0)) == (\226\136\131 x : A, s == {x} && a == f(x, b))
      #|  DELETE(DELETE((s : (A) -> Bool), (x : A)), (y : A)) == DELETE(DELETE(s, y), x)
      #|  (v : B)
      #|  (y : A)
      #|  (f : (A, B) -> B)((y : A), (v : B))
      #|  (v : B)
      #|  (x : A)
      #|  FINREC((f : (A, B) -> B), (b : B), DELETE((s : (A) -> Bool), (y : A)), (c : B), SUC((n : Num)))
      #|  (c : B)
      #|  (x : A) == (y : A)
      #|  (x : A)
      #|  (c : B)
      #|  (y : A)
      #|  (b : B)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 (\226\136\128 n : Num, \226\136\128 s : (A) -> Bool, \226\136\128 z : B, FINREC(f, b, s, z, SUC(n)) \226\134\146 (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 w : B, FINREC(f, b, DELETE(s, x), w, n) && z == f(x, w))))
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 (\226\136\128 n1 : Num, \226\136\128 n2 : Num, \226\136\128 s : (A) -> Bool, \226\136\128 a1 : B, \226\136\128 a2 : B, FINREC(f, b, s, a1, n1) && FINREC(f, b, s, a2, n2) \226\134\146 a1 == a2 && n1 == n2)
      #|  !IN((x : A), (s : (A) -> Bool)) \226\134\146 DELETE(INSERT(x, s), x) == s
      #|  (a : B)
      #|  (x : A)
      #|  SUC((n : Num))
      #|  (f : (A, B) -> B)((x : A), (a : B))
      #|  0
      #|  (b : B)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : B, \226\136\131 n : Num, FINREC(f, b, s, a, n))
      #|  (s : A) => select((a : B) => \226\136\131 n : C, (R : (A, B, C) -> Bool)(s, a, n))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 R : (A, B, C) -> Bool, (\226\136\128 s : A, P(s) \226\134\146 (\226\136\131 a : B, \226\136\131 n : C, R(s, a, n))) && (\226\136\128 n1 : C, \226\136\128 n2 : C, \226\136\128 s : A, \226\136\128 a1 : B, \226\136\128 a2 : B, R(s, a1, n1) && R(s, a2, n2) \226\134\146 a1 == a2 && n1 == n2) \226\134\146 (\226\136\131 f : (A) -> B, \226\136\128 s : A, \226\136\128 a : B, P(s) \226\134\146 (\226\136\131 n : C, R(s, a, n)) == (f(s) == a))
      #|  (n : Num)
      #|  (s : (A) -> Bool)
      #|  FINITE(DELETE((s : (A) -> Bool), (x : A)))
      #|  (g : ((A) -> Bool) -> B)(DELETE((s : (A) -> Bool), (x : A))) == (w : B)
      #|  (w : B)
      #|  (x : A)
      #|  IN((x : A), (s : (A) -> Bool))
      #|  (g : ((A) -> Bool) -> B)((s : (A) -> Bool))
      #|  FINITE((s : (A) -> Bool))
      #|  0
      #|  (FINITE : ((A) -> Bool) -> Bool)(({} : (A) -> Bool))
      #|  (g : ((A) -> Bool) -> B)
      #|  (g : ((A) -> Bool) -> B)
      #|  (b : B)
      #|  (f : (A, B) -> B)
      #|  (b : B)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 (\226\136\131 g : ((A) -> Bool) -> B, g({}) == b && (\226\136\128 s : (A) -> Bool, \226\136\128 x : A, FINITE(s) && IN(x, s) \226\134\146 g(s) == f(x, g(DELETE(s, x)))))
      #|  !IN((x : A), (s : (A) -> Bool))
      #|  FINITE(INSERT((x : A), (s : (A) -> Bool))) && IN(x, INSERT(x, s))
      #|  (g : ((A) -> Bool) -> B)
      #|  (g : ((A) -> Bool) -> B)
      #|  (b : B)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 (\226\136\131 g : ((A) -> Bool) -> B, g({}) == b && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 g(INSERT(x, s)) == (if IN(x, s) { g(s) } else { f(x, g(s)) })))
      #|  (ITSET : ((A, B) -> B, (A) -> Bool, B) -> B)((f : (A, B) -> B), (s : (A) -> Bool), (b : B)) == select((g : ((A) -> Bool) -> B) => g({}) == b && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 g(INSERT(x, s)) == (if IN(x, s) { g(s) } else { f(x, g(s)) })), s)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 ITSET(f, {}, b) == b && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 ITSET(f, INSERT(x, s), b) == (if IN(x, s) { ITSET(f, s, b) } else { f(x, ITSET(f, s, b)) }))
      #|  !IN((x : A), (s : (A) -> Bool))
      #|  IN((x : A), (s : (A) -> Bool))
      #|  (x : A)
      #|  (x : A)
      #|  IN((x : A), (s : (A) -> Bool))
      #|  (b : B)
      #|  \226\136\128 f : (A, B) -> B, \226\136\128 b : B, (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) \226\134\146 ITSET(f, {}, b) == b && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 ITSET(f, s, b) == (if IN(x, s) { f(x, ITSET(f, DELETE(s, x), b)) } else { ITSET(f, DELETE(s, x), b) }))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A, B) -> B, \226\136\128 g : (A, B) -> B, \226\136\128 b : B, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 f(x, f(y, s)) == f(y, f(x, s))) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 s : B, !(x == y) \226\134\146 g(x, g(y, s)) == g(y, g(x, s))) \226\134\146 ITSET(f, s, b) == ITSET(g, s, b)
      #|  (CARD : ((A) -> Bool) -> Num)((s : (A) -> Bool)) == ITSET((x : A) => (n : Num) => SUC(n), s, 0)
      #|  0
      #|  (x : A) => (n : Num) => SUC(n)
      #|  (CARD : ((A) -> Bool) -> Num)(({} : (A) -> Bool)) == 0 && (\226\136\128 x : A, \226\136\128 s : (A) -> Bool, (FINITE : ((A) -> Bool) -> Bool)(s) \226\134\146 (CARD : ((A) -> Bool) -> Num)((INSERT : (A, (A) -> Bool, A) -> Bool)(x, s)) == (if (IN : (A, (A) -> Bool) -> Bool)(x, s) { (CARD : ((A) -> Bool) -> Num)(s) } else { SUC((CARD : ((A) -> Bool) -> Num)(s)) }))
      #|  INTER(INSERT((x : A), (s : (A) -> Bool)), (t : (A) -> Bool)) == {}
      #|  INTER(INSERT((x : A), (s : (A) -> Bool)), (t : (A) -> Bool)) == {}
      #|  !IN((x : A), UNION((s : (A) -> Bool), (t : (A) -> Bool)))
      #|  UNION((s : (A) -> Bool), (t : (A) -> Bool))
      #|  (x : A)
      #|  (s : (A) -> Bool)
      #|  (x : A)
      #|  FINITE(UNION((s : (A) -> Bool), (t : (A) -> Bool))) && FINITE(s)
      #|  UNION(INSERT((x : A), (s : (A) -> Bool)), (t : (A) -> Bool)) == INSERT(x, UNION(s, t))
      #|  (s : (A) -> Bool)
      #|  (x : A)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) \226\134\146 (d : Bool)) == (a \226\134\146 b && c \226\134\146 d)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && INTER(s, t) == {} \226\134\146 CARD(UNION(s, t)) == CARD(s) + CARD(t)
      #|  !IN((x : A), (s : (A) -> Bool))
      #|  IN((x : A), (s : (A) -> Bool))
      #|  (s : (A) -> Bool) == INSERT((x : A), DELETE(s, x))
      #|  \226\136\128 x : A, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 CARD(DELETE(s, x)) == (if IN(x, s) { CARD(s) - 1 } else { CARD(s) })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, FINITE(u) && INTER(s, t) == {} && UNION(s, t) == u \226\134\146 CARD(s) + CARD(t) == CARD(u)
      #|  (a : Num) + (b : Num) == (c : Num) \226\134\146 a == c - b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && SUBSET(t, s) \226\134\146 CARD(DIFF(s, t)) == CARD(s) - CARD(t)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (CARD(s) == 0) == (s == {})
      #|  \226\136\128 a : A, CARD({a}) == 1
      #|  \226\136\128 a : A, \226\136\128 b : A, CARD({a, b}) <= 2
      #|  \226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, CARD({a, b, c}) <= 3
      #|  \226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, \226\136\128 d : A, CARD({a, b, c, d}) <= 4
      #|  ((n : Num) - 1 < n) == !(n == 0)
      #|  DELETE((s : (A) -> Bool), (x : A))
      #|  (x : A)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && ((P : ((A) -> Bool) -> Bool)(DELETE(s, x)) \226\134\146 P(s)))
      #|  (s : (A) -> Bool) == {}
      #|  CARD((s : (A) -> Bool))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, P({}) && (\226\136\128 s : (A) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && (P(DELETE(s, x)) \226\134\146 P(s)))) \226\134\146 (\226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 P(s))
      #|  (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((s : (A) -> Bool), (n : Num)) == (FINITE(s) && CARD(s) == n)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, n) \226\134\146 CARD(s) == n
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, HAS_SIZE(s, 0) == (s == {})
      #|  IN((a : A), (s : (A) -> Bool))
      #|  INSERT((a : A), DELETE((s : (A) -> Bool), a)) == s
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  (a : A)
      #|  (a : A)
      #|  IN((a : A), (s : (A) -> Bool))
      #|  INSERT((a : A), DELETE((s : (A) -> Bool), a)) == s
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  (a : A)
      #|  FINITE((s : (A) -> Bool))
      #|  (s : (A) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, SUC(n)) == (!(s == {}) && (\226\136\128 a : A, IN(a, s) \226\134\146 HAS_SIZE(DELETE(s, a), n)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) && DISJOINT(s, t) \226\134\146 HAS_SIZE(UNION(s, t), m + n)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) && SUBSET(t, s) \226\134\146 HAS_SIZE(DIFF(s, t), m - n)
      #|  DISJOINT((a : (_) -> Bool), UNIONS((s : ((_) -> Bool) -> Bool))) == (\226\136\128 x : (_) -> Bool, IN(x, s) \226\134\146 DISJOINT(a, x))
      #|  SUC((a : Num)) * (b : Num) == b + a * b
      #|  UNIONS({(t : (_, _) -> Bool)((y : _)) | IN(y, INSERT((x : _), (s : (_) -> Bool)))}) == UNION(t(x), UNIONS({t((y : _)) | IN(y, s)}))
      #|  (n : Num)
      #|  (m : Num)
      #|  (t : (A, B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (x : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(s, m) && (\226\136\128 x : A, IN(x, s) \226\134\146 HAS_SIZE(t(x), n)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) \226\134\146 DISJOINT(t(x), t(y))) \226\134\146 HAS_SIZE(UNIONS({t((x : A)) | IN(x, s)}), m * n)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) == HAS_SIZE(s, CARD(s))
      #|  IN((a : _), (s : (_) -> Bool)) \226\134\146 s == INSERT(a, DELETE(s, a))
      #|  HAS_SIZE((s : (A) -> Bool), 0) == (s == {}) && HAS_SIZE(s, SUC((n : Num))) == (\226\136\131 a : A, \226\136\131 t : (A) -> Bool, HAS_SIZE(t, n) && !IN(a, t) && s == INSERT(a, t))
      #|  (!IN((a : A), {}) && (P : Bool)) == P && (!IN(a, {(b : A)}) && P) == (!(a == b) && P) && (!IN(a, INSERT(b, (cs : (A) -> Bool))) && P) == (!(a == b) && !IN(a, cs) && P)
      #|  (\226\136\131 s : (A) -> Bool, HAS_SIZE(s, 0) && (P : ((A) -> Bool) -> Bool)(s)) == P({}) && (\226\136\131 s : (A) -> Bool, HAS_SIZE(s, SUC((n : Num))) && P(s)) == (\226\136\131 a : A, \226\136\131 s : (A) -> Bool, HAS_SIZE(s, n) && !IN(a, s) && P(INSERT(a, s)))
      #|  SUBSET((a : (A) -> Bool), (b : (A) -> Bool))
      #|  DIFF((b : (A) -> Bool), (a : (A) -> Bool)) == {}
      #|  ((a : Num) == a + (b : Num)) == (b == 0)
      #|  SUBSET((a : (A) -> Bool), (b : (A) -> Bool))
      #|  UNION((a : (A) -> Bool), DIFF((b : (A) -> Bool), a)) == b
      #|  INTER((a : (A) -> Bool), DIFF((b : (A) -> Bool), a)) == {}
      #|  (b : (A) -> Bool)
      #|  FINITE(DIFF((b : (A) -> Bool), (a : (A) -> Bool)))
      #|  FINITE((a : (A) -> Bool))
      #|  DIFF((b : (A) -> Bool), (a : (A) -> Bool))
      #|  (a : (A) -> Bool)
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, FINITE(b) && SUBSET(a, b) && CARD(a) == CARD(b) \226\134\146 a == b
      #|  (b : (A) -> Bool)
      #|  (b : (A) -> Bool)
      #|  CARD(UNION((a : (A) -> Bool), DIFF((b : (A) -> Bool), a))) == CARD(a) + CARD(DIFF(b, a))
      #|  SUBSET((a : (A) -> Bool), (b : (A) -> Bool))
      #|  (b : (A) -> Bool) == UNION((a : (A) -> Bool), DIFF(b, a))
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, SUBSET(a, b) && FINITE(b) \226\134\146 CARD(a) <= CARD(b)
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, FINITE(b) && SUBSET(a, b) && CARD(b) <= CARD(a) \226\134\146 a == b
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(s, t) \226\134\146 (CARD(s) == CARD(t)) == (s == t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 n : Num, SUBSET(s, t) && FINITE(t) && CARD(t) <= n \226\134\146 FINITE(s) && CARD(s) <= n
      #|  ((n : Num) - 1 < n) == !(n == 0)
      #|  CARD(DELETE((b : (A) -> Bool), (x : A)))
      #|  (x : A)
      #|  PSUBSET((a : (_) -> Bool), (b : (_) -> Bool)) == (\226\136\131 x : _, IN(x, b) && !IN(x, a) && SUBSET(a, DELETE(b, x)))
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, PSUBSET(a, b) && FINITE(b) \226\134\146 CARD(a) < CARD(b)
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, SUBSET(a, b) && !(CARD(a) == CARD(b)) \226\134\146 PSUBSET(a, b)
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, FINITE(b) && SUBSET(a, b) \226\134\146 PSUBSET(a, b) == (CARD(a) < CARD(b))
      #|  UNION((s : (_) -> Bool), (t : (_) -> Bool)) == UNION(s, DIFF(t, s))
      #|  CARD((s : (A) -> Bool)) + CARD(DIFF((t : (A) -> Bool), s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(UNION(s, t)) <= CARD(s) + CARD(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, (FINITE(s) && CARD(s) <= m) && FINITE(t) && CARD(t) <= n \226\134\146 FINITE(UNION(s, t)) && CARD(UNION(s, t)) <= m + n
      #|  (a : Num) <= (n : Num) && (b : Num) <= (x : Num) * n \226\134\146 a + b <= SUC(x) * n
      #|  {(t : (_) -> _)((x : _)) | IN(x, (s : (_) -> Bool))} == IMAGE(t, s)
      #|  CARD((t : (A, B) -> Bool)((x : A))) + CARD(UNIONS({t((y : A)) | IN(y, (s : (A) -> Bool))}))
      #|  UNIONS({(t : (_, _) -> Bool)((x : _)) | IN(x, INSERT((a : _), (s : (_) -> Bool)))}) == UNION(t(a), UNIONS({t((x : _)) | IN(x, s)}))
      #|  UNIONS({(t : (_, _) -> Bool)((x : _)) | IN(x, {})}) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(s, m) && (\226\136\128 x : A, IN(x, s) \226\134\146 FINITE(t(x)) && CARD(t(x)) <= n) \226\134\146 CARD(UNIONS({t((x : A)) | IN(x, s)})) <= m * n
      #|  DIFF((t : (_) -> Bool), INTER((s : (_) -> Bool), t)) == DIFF(t, s)
      #|  (x : Num) <= (y : Num) \226\134\146 (a : Num) + y - x == a + (y - x)
      #|  UNION((s : (_) -> Bool), (t : (_) -> Bool)) == UNION(s, DIFF(t, s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(UNION(s, t)) == CARD(s) + CARD(t) - CARD(INTER(s, t))
      #|  ((a : Num) - (b : Num) == a) == (b == 0 || a == 0)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) \226\134\146 (CARD(UNION(s, t)) == CARD(s) + CARD(t)) == (INTER(s, t) == {})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(s) && FINITE(t) && CARD(UNION(s, t)) < CARD(s) + CARD(t) \226\134\146 !(INTER(s, t) == {})
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool)) == (b \226\134\146 a \226\134\146 c)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && FINITE(s) \226\134\146 CARD(IMAGE(f, s)) == CARD(s)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && HAS_SIZE(s, n) \226\134\146 HAS_SIZE(IMAGE(f, s), n)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 CARD(IMAGE(f, s)) <= CARD(s)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, FINITE(s) && CARD(s) <= n \226\134\146 FINITE(IMAGE(f, s)) && CARD(IMAGE(f, s)) <= n
      #|  (t : (B) -> Bool) == IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && f(x) == y)) \226\134\146 CARD(t) == CARD(s)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (B) -> Bool, \226\136\128 t : (A) -> Bool, FINITE(t) && SUBSET(s, IMAGE(f, t)) \226\134\146 CARD(s) <= CARD(t)
      #|  (a' : Bool) == (a : Bool) && (a \226\134\146 (b' : Bool) == (b : Bool)) \226\134\146 (a' && b') == (a && b)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) \226\134\146 HAS_SIZE(IMAGE(f, s), n) == HAS_SIZE(s, n)
      #|  ((n : Num) - 1 < n) == !(n == 0)
      #|  CARD(DELETE((s : (A) -> Bool), (y : A)))
      #|  \226\136\128 n : Num, (m : Num) <= n && n < (p : Num) \226\134\146 !(m == p)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool)) == IMAGE(f, DELETE(s, (y : A)))
      #|  CARD(IMAGE((f : (A) -> B), (s : (A) -> Bool))) == CARD(s)
      #|  (x : A) == (y : A)
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (CARD(IMAGE(f, s)) == CARD(s)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y)
      #|  ((p : Bool) \226\134\146 (q : Bool) == (s : Bool)) && (p && s \226\134\146 (r : Bool) == (t : Bool)) \226\134\146 ((p && q) && r) == ((p && s) && t)
      #|  ((p : Bool) && (q : Bool) && (r : Bool) && (s : Bool)) == (r && s && p && q)
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\131 t : (B) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) && P(IMAGE(f, t)))
      #|  (\226\136\128 t : _, (p : (_) -> Bool)(t)) == !(\226\136\131 t : _, !p(t))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\128 t : (B) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, t) && IN(y, t) \226\134\146 (f(x) == f(y)) == (x == y)) \226\134\146 P(IMAGE(f, t)))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\131 t : (B) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, IMAGE(f, s)) && P(t)) == (\226\136\131 t : (A) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, s) && P(IMAGE(f, t)))
      #|  (\226\136\128 t : _, (p : (_) -> Bool)(t)) == !(\226\136\131 t : _, !p(t))
      #|  \226\136\128 P : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, (\226\136\128 t : (B) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, IMAGE(f, s)) \226\134\146 P(t)) == (\226\136\128 t : (A) -> Bool, FINITE(t) && CARD(t) < n && SUBSET(t, s) \226\134\146 P(IMAGE(f, t)))
      #|  CARD(IMAGE(o((h : (C) -> B), (g : (A) -> C)), (s : (A) -> Bool)))
      #|  (h : (C) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && g(x) == g(y) \226\134\146 f(x) == f(y)) \226\134\146 CARD(IMAGE(f, s)) <= CARD(IMAGE(g, s))
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool)) == IMAGE((h : (C) -> B), IMAGE((g : (A) -> C), s))
      #|  (h : (C) -> B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> C, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && g(x) == g(y) \226\134\146 f(x) == f(y)) && !(\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 g(x) == g(y)) \226\134\146 CARD(IMAGE(f, s)) < CARD(IMAGE(g, s))
      #|  INSERT((a : A), (t : (A) -> Bool))
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  !(SUC((n : Num)) <= 0)
      #|  \226\136\128 n : Num, \226\136\128 s : (A) -> Bool, (FINITE(s) \226\134\146 n <= CARD(s)) \226\134\146 (\226\136\131 t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, n))
      #|  CARD((t : (A) -> Bool))
      #|  (t : (A) -> Bool)
      #|  \226\136\128 n : Num, \226\136\128 s : (A) -> Bool, (FINITE(s) \226\134\146 n <= CARD(s)) == (\226\136\131 t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, n))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\128 n : Num, n <= CARD(s) \226\134\146 (\226\136\131 t : (A) -> Bool, SUBSET(t, s) && HAS_SIZE(t, n)))
      #|  (n : Num) == CARD((s : (A) -> Bool)) + (n - CARD(s))
      #|  UNION((s : (A) -> Bool), (t : (A) -> Bool))
      #|  (t : (A) -> Bool)
      #|  SUBSET((u : (_) -> Bool), UNION(DIFF(u, (s : (_) -> Bool)), s))
      #|  !(p : Bool) \226\134\146 p \226\134\146 (q : Bool)
      #|  (n : Num) <= (m : Num) \226\134\146 n - (x : Num) <= m - x
      #|  FINITE((u : (A) -> Bool))
      #|  DIFF((u : (A) -> Bool), (s : (A) -> Bool))
      #|  (n : Num) - CARD((s : (A) -> Bool))
      #|  \226\136\128 n : Num, \226\136\128 s : (A) -> Bool, \226\136\128 u : (A) -> Bool, SUBSET(s, u) && FINITE(s) && CARD(s) <= n && (FINITE(u) \226\134\146 n <= CARD(u)) \226\134\146 (\226\136\131 t : (A) -> Bool, SUBSET(s, t) && SUBSET(t, u) && HAS_SIZE(t, n))
      #|  (s : (A) -> Bool)
      #|  !((x : Num) <= (n : Num)) == (SUC(n) <= x)
      #|  !((p : Bool) && (q : Bool)) == (p \226\134\146 !q)
      #|  (f : ((A) -> Bool) -> Bool) == {}
      #|  \226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 n : Num, (\226\136\128 t : (A) -> Bool, \226\136\128 u : (A) -> Bool, IN(t, f) && IN(u, f) \226\134\146 SUBSET(t, u) || SUBSET(u, t)) && (\226\136\128 t : (A) -> Bool, IN(t, f) \226\134\146 FINITE(t) && CARD(t) <= n) \226\134\146 FINITE(UNIONS(f)) && CARD(UNIONS(f)) <= n
      #|  ((c : Num) <= 1) == (c == 0 || c == 1)
      #|  \226\136\128 s : (A) -> Bool, (FINITE(s) && CARD(s) <= 1) == (\226\136\131 a : A, SUBSET(s, {a}))
      #|  (n : Num) == 2
      #|  ((n : Num) <= 2) == (n == 0 || n == 1 || n == 2)
      #|  DELETE((s : (A) -> Bool), (f : (A) -> A)((a : A)))
      #|  (n : Num) - 2
      #|  (SUC((n : Num)) == 1) == (n == 0)
      #|  (n : Num) == 1
      #|  (f : (A) -> A)((a : A)) == a
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  (n : Num) == 0
      #|  (n : Num)
      #|  (n : Num)
      #|  (s : (A) -> Bool)
      #|  ((p : Bool) \226\134\146 (q : Bool) && (r : Bool) \226\134\146 (s : Bool)) == ((q && p) && r \226\134\146 s)
      #|  (n : Num) == CARD((s : (A) -> Bool))
      #|  \226\136\128 f : (A) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), s) && !(f(x) == x) && f(f(x)) == x) \226\134\146 EVEN(CARD(s))
      #|  (f : (A) -> A)
      #|  ((p : Bool) == (p == (q : Bool))) == q
      #|  INTER({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && !P(x)}) == {}
      #|  EVEN(CARD(UNION({(x : A) | IN(x, (s : (A) -> Bool)) && (f : (A) -> A)(x) == x}, {(x : A) | IN(x, s) && !(f(x) == x)})))
      #|  \226\136\128 f : (A) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), s) && f(f(x)) == x) \226\134\146 EVEN(CARD({(x : A) | IN(x, s) && f(x) == x})) == EVEN(CARD(s))
      #|  {((x : _), (y : _)) | (x == (a : _) || IN(x, (s : (_) -> Bool))) && IN(y, (t : (_, _) -> Bool)(x))} == UNION({((x : _), (y : _)) | IN(x, s) && IN(y, t(x))}, IMAGE((y : _) => (a, y), t(a)))
      #|  CARD((s : (A) -> Bool))
      #|  ((a : Bool) || (b : Bool) \226\134\146 (c : Bool)) == ((a \226\134\146 c) && (b \226\134\146 c))
      #|  (n : Num)
      #|  (t : (A, B) -> Bool)
      #|  (m : Num)
      #|  (s : (A) -> Bool)
      #|  (x : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 m : Num, \226\136\128 t : (A, B) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, m) && (\226\136\128 x : A, IN(x, s) \226\134\146 HAS_SIZE(t(x), n)) \226\134\146 HAS_SIZE({((x : A), (y : B)) | IN(x, s) && IN(y, t(x))}, m * n)
      #|  {((x : A), (y : B)) | IN(x, INSERT((a : A), (s : (A) -> Bool))) && IN(y, (t : (A, B) -> Bool)(x))} == UNION(IMAGE((y : B) => (a, y), t(a)), {((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})
      #|  (t : (A, B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  {((x : A), (y : B)) | IN(x, {}) && IN(y, (t : (A, B) -> Bool)(x))} == {}
      #|  (s : (A) -> Bool)
      #|  (t : (A, B) -> Bool)
      #|  FINITE((s : (A) -> Bool))
      #|  \226\136\128 x : A, IN(x, (s : (A) -> Bool)) \226\134\146 FINITE((t : (A, B) -> Bool)(x))
      #|  IMAGE(fn { (x, y) => (f : (A, B) -> C)(x, y) }, {((x : A), (y : B)) | IN(x, (s : (A) -> Bool)) && IN(y, (t : (A, B) -> Bool)(x))})
      #|  \226\136\128 f : (A, B) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, FINITE(s) && (\226\136\128 x : A, IN(x, s) \226\134\146 FINITE(t(x))) \226\134\146 FINITE({f((x : A), (y : B)) | IN(x, s) && IN(y, t(x))})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE({((x : A), (y : B)) | IN(x, s) && IN(y, t)})
      #|  CARD((t : (B) -> Bool))
      #|  (x : A) => (t : (B) -> Bool)
      #|  CARD((s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD({((x : A), (y : B)) | IN(x, s) && IN(y, t)}) == CARD(s) * CARD(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 m : Num, \226\136\128 t : (B) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) \226\134\146 HAS_SIZE({((x : A), (y : B)) | IN(x, s) && IN(y, t)}, m * n)
      #|  (CROSS : ((A) -> Bool, (B) -> Bool, (A, B)) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == {((x : A), (y : B)) | IN(x, s) && IN(y, t)}
      #|  \226\136\128 x : A, \226\136\128 y : B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, IN((x, y), CROSS(s, t)) == (IN(x, s) && IN(y, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) \226\134\146 HAS_SIZE(CROSS(s, t), m * n)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE(CROSS(s, t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD(CROSS(s, t)) == CARD(s) * CARD(t)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (CROSS(s, t) == {}) == (s == {} || t == {})
      #|  (\226\136\128 s : (A) -> Bool, (CROSS : ((A) -> Bool, (_) -> Bool, (A, _)) -> Bool)(s, ({} : (_) -> Bool)) == ({} : ((A, _)) -> Bool)) && (\226\136\128 t : (B) -> Bool, (CROSS : ((_) -> Bool, (B) -> Bool, (_, B)) -> Bool)(({} : (_) -> Bool), t) == ({} : ((_, B)) -> Bool))
      #|  \226\136\128 x : A, \226\136\128 y : B, CROSS({x}, {y}) == {(x, y)}
      #|  (CROSS : ((A) -> Bool, (B) -> Bool, (A, B)) -> Bool)((UNIV : (A) -> Bool), (UNIV : (B) -> Bool)) == (UNIV : ((A, B)) -> Bool)
      #|  (SND : ((A, B)) -> B)
      #|  (FST : ((A, B)) -> A)
      #|  (t : (B) -> Bool) == {}
      #|  (s : (A) -> Bool) == {}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(CROSS(s, t)) == (s == {} || t == {} || FINITE(s) && FINITE(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, INFINITE(CROSS(s, t)) == (!(s == {}) && INFINITE(t) || INFINITE(s) && !(t == {}))
      #|  (FINITE : (((A, B)) -> Bool) -> Bool)((UNIV : ((A, B)) -> Bool)) == ((FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && (FINITE : ((B) -> Bool) -> Bool)((UNIV : (B) -> Bool)))
      #|  (INFINITE : (((A, B)) -> Bool) -> Bool)((UNIV : ((A, B)) -> Bool)) == ((INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) || (INFINITE : ((B) -> Bool) -> Bool)((UNIV : (B) -> Bool)))
      #|  (FINITE : (((A, A)) -> Bool) -> Bool)((UNIV : ((A, A)) -> Bool)) == (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool))
      #|  (INFINITE : (((A, A)) -> Bool) -> Bool)((UNIV : ((A, A)) -> Bool)) == (INFINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool))
      #|  \226\136\128 P : ((A, B)) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\128 z : (A, B), IN(z, CROSS(s, t)) \226\134\146 P(z)) == (\226\136\128 x : A, \226\136\128 y : B, IN(x, s) && IN(y, t) \226\134\146 P((x, y)))
      #|  \226\136\128 P : ((A, B)) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, (\226\136\131 z : (A, B), IN(z, CROSS(s, t)) && P(z)) == (\226\136\131 x : A, \226\136\131 y : B, IN(x, s) && IN(y, t) && P((x, y)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(CROSS(s, t), CROSS(s', t')) == (s == {} || t == {} || SUBSET(s, s') && SUBSET(t, t'))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(s, s') && SUBSET(t, t') \226\134\146 SUBSET(CROSS(s, t), CROSS(s', t'))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, (CROSS(s, t) == CROSS(s', t')) == ((s == {} || t == {}) && (s' == {} || t' == {}) || s == s' && t == t')
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, IMAGE(FST, CROSS(s, t)) == (if t == {} { {} } else { s })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, IMAGE(SND, CROSS(s, t)) == (if s == {} { {} } else { t })
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (C) -> D, \226\136\128 s : (A) -> Bool, \226\136\128 t : (C) -> Bool, IMAGE(fn { (x, y) => (f(x), g(y)) }, CROSS(s, t)) == CROSS(IMAGE(f, s), IMAGE(g, t))
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(s, INTER(t, u)) == INTER(CROSS(s, t), CROSS(s, u))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(INTER(s, t), u) == INTER(CROSS(s, u), CROSS(t, u)))
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(s, UNION(t, u)) == UNION(CROSS(s, t), CROSS(s, u))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(UNION(s, t), u) == UNION(CROSS(s, u), CROSS(t, u)))
      #|  (\226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(s, DIFF(t, u)) == DIFF(CROSS(s, t), CROSS(s, u))) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 u : (B) -> Bool, CROSS(DIFF(s, t), u) == DIFF(CROSS(s, u), CROSS(t, u)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, INTER(CROSS(s, t), CROSS(s', t')) == CROSS(INTER(s, s'), INTER(t, t'))
      #|  (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 g : ((B) -> Bool) -> Bool, CROSS(UNIONS(f), UNIONS(g)) == UNIONS({CROSS((s : (A) -> Bool), (t : (B) -> Bool)) | IN(s, f) && IN(t, g)})) && (\226\136\128 s : (A) -> Bool, \226\136\128 f : ((A) -> Bool) -> Bool, CROSS(s, UNIONS(f)) == UNIONS({CROSS(s, (t : (A) -> Bool)) | IN(t, f)})) && (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 t : (B) -> Bool, CROSS(UNIONS(f), t) == UNIONS({CROSS((s : (A) -> Bool), t) | IN(s, f)}))
      #|  (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 g : ((B) -> Bool) -> Bool, CROSS(INTERS(f), INTERS(g)) == (if f == {} { INTERS({CROSS(UNIV, (t : (B) -> Bool)) | IN(t, g)}) } else { if g == {} { INTERS({CROSS((s : (A) -> Bool), UNIV) | IN(s, f)}) } else { INTERS({CROSS((s : (A) -> Bool), (t : (B) -> Bool)) | IN(s, f) && IN(t, g)}) } })) && (\226\136\128 s : (A) -> Bool, \226\136\128 f : ((A) -> Bool) -> Bool, CROSS(s, INTERS(f)) == (if f == {} { CROSS(s, UNIV) } else { INTERS({CROSS(s, (t : (A) -> Bool)) | IN(t, f)}) })) && (\226\136\128 f : ((A) -> Bool) -> Bool, \226\136\128 t : (B) -> Bool, CROSS(INTERS(f), t) == (if f == {} { CROSS(UNIV, t) } else { INTERS({CROSS((s : (A) -> Bool), t) | IN(s, f)}) }))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 s' : (A) -> Bool, \226\136\128 t' : (B) -> Bool, DISJOINT(CROSS(s, t), CROSS(s', t')) == (DISJOINT(s, s') || DISJOINT(t, t'))
      #|  (ARB : A) == select((x : A) => false)
      #|  (EXTENSIONAL : ((A) -> Bool, (A) -> B) -> Bool)((s : (A) -> Bool)) == {(f : (A) -> B) | \226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == ARB}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, IN(f, EXTENSIONAL(s)) == (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == ARB)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 x : A, IN(f, EXTENSIONAL(s)) && !IN(x, s) \226\134\146 f(x) == ARB
      #|  (EXTENSIONAL : ((A) -> Bool, (A) -> B) -> Bool)({}) == {(x : A) => (ARB : B)}
      #|  \226\136\128 f : (A) -> B, EXTENSIONAL(UNIV, f)
      #|  IN((x : A), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, IN(f, EXTENSIONAL(s)) && IN(g, EXTENSIONAL(s)) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)) \226\134\146 f == g
      #|  (RESTRICTION : ((A) -> Bool, (A) -> B, A) -> B)((s : (A) -> Bool), (f : (A) -> B), (x : A)) == (if IN(x, s) { f(x) } else { ARB })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, RESTRICTION(s, f) == ((x : A) => if IN(x, s) { f(x) } else { ARB })
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 x : A, IN(x, s) \226\134\146 RESTRICTION(s, f, x) == f(x)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 x : A, !IN(x, s) \226\134\146 RESTRICTION(s, f, x) == ARB
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 x : A, \226\136\128 y : B, IN(x, s) && f(x) == y \226\134\146 RESTRICTION(s, f, x) == y
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, IN(RESTRICTION(s, f), EXTENSIONAL(s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, (RESTRICTION(s, f) == RESTRICTION(s, g)) == (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, (RESTRICTION(s, f) == f) == IN(f, EXTENSIONAL(s))
      #|  \226\136\128 f : (A) -> B, RESTRICTION(UNIV, f) == f
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 f : (A) -> B, SUBSET(s, t) \226\134\146 RESTRICTION(s, RESTRICTION(t, f)) == RESTRICTION(s, f)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, RESTRICTION(s, RESTRICTION(s, f)) == RESTRICTION(s, f)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, t) \226\134\146 IMAGE(RESTRICTION(t, f), s) == IMAGE(f, s)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 s : (A) -> Bool, RESTRICTION(s, o(g, RESTRICTION(s, f))) == RESTRICTION(s, o(g, f))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(IMAGE(f, s), t) \226\134\146 RESTRICTION(s, o(RESTRICTION(t, g), f)) == RESTRICTION(s, o(g, f))
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, SUBSET(IMAGE(f, s), t) \226\134\146 RESTRICTION(s, o(RESTRICTION(t, g), RESTRICTION(s, f))) == RESTRICTION(s, o(g, f))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, (RESTRICTION(s, f) == g) == (EXTENSIONAL(s, g) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, (f == RESTRICTION(s, g)) == (EXTENSIONAL(s, f) && (\226\136\128 x : A, IN(x, s) \226\134\146 f(x) == g(x)))
      #|  (cartesian_product : ((K) -> Bool, (K, A) -> Bool, (K) -> A) -> Bool)((k : (K) -> Bool), (s : (K, A) -> Bool)) == {(f : (K) -> A) | EXTENSIONAL(k, f) && (\226\136\128 i : K, IN(i, k) \226\134\146 IN(f(i), s(i)))}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 x : (K) -> A, IN(x, cartesian_product(k, s)) == (EXTENSIONAL(k, x) && (\226\136\128 i : K, IN(i, k) \226\134\146 IN(x(i), s(i))))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, cartesian_product(k, s) == {(f : (K) -> A) | \226\136\128 i : K, IN(f(i), if IN(i, k) { s(i) } else { {ARB} })}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 f : (K) -> A, IN(RESTRICTION(k, f), cartesian_product(k, s)) == (\226\136\128 i : K, IN(i, k) \226\134\146 IN(f(i), s(i)))
      #|  (x : (K) -> A)
      #|  (x : (K) -> A)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, cartesian_product(k, s) == {RESTRICTION(k, f) | f : (K) -> A | \226\136\128 i : K, IN(i, k) \226\134\146 IN(f(i), s(i))}
      #|  (i : K) => if IN(i, (k : (K) -> Bool)) { (f : (K) -> A)(i) } else { ARB }
      #|  (f : (K) -> A)
      #|  (\226\136\131 i : _, IN(i, (k : (_) -> Bool)) && (s : (_, _) -> Bool)(i) == {}) == !(\226\136\128 i : _, \226\136\131 a : _, IN(i, k) \226\134\146 IN(a, s(i)))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, (cartesian_product(k, s) == {}) == (\226\136\131 i : K, IN(i, k) && s(i) == {})
      #|  \226\136\128 s : (K, A) -> Bool, cartesian_product({}, s) == {(i : K) => ARB}
      #|  (k : (K) -> Bool)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 x : (K) -> A, \226\136\128 y : (K) -> A, IN(x, cartesian_product(k, s)) && IN(y, cartesian_product(k, s)) && (\226\136\128 i : K, IN(i, k) \226\134\146 x(i) == y(i)) \226\134\146 x == y
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 x : (K) -> A, \226\136\128 y : (K) -> A, IN(x, cartesian_product(k, s)) && IN(y, cartesian_product(k, s)) \226\134\146 (x == y) == (\226\136\128 i : K, IN(i, k) \226\134\146 x(i) == y(i))
      #|  (j : K) => if IN(j, (k : (K) -> Bool)) { if j == (i : K) { (x : A) } else { (z : (K) -> A)(j) } } else { ARB }
      #|  (x : A)
      #|  (i : K)
      #|  (z : (K) -> A)
      #|  !(\226\136\131 i : _, IN(i, (k : (_) -> Bool)) && (s : (_, _) -> Bool)(i) == {}) == (\226\136\128 i : _, \226\136\131 a : _, IN(i, k) \226\134\146 IN(a, s(i)))
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, SUBSET(cartesian_product(k, s), cartesian_product(k, t)) == (cartesian_product(k, s) == {} || (\226\136\128 i : K, IN(i, k) \226\134\146 SUBSET(s(i), t(i))))
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  cartesian_product((k : (K) -> Bool), (t : (K, A) -> Bool)) == {}
      #|  \226\136\128 i : K, IN(i, (k : (K) -> Bool)) \226\134\146 (s : (K, A) -> Bool)(i) == (t : (K, A) -> Bool)(i)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, (cartesian_product(k, s) == cartesian_product(k, t)) == (cartesian_product(k, s) == {} && cartesian_product(k, t) == {} || (\226\136\128 i : K, IN(i, k) \226\134\146 s(i) == t(i)))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, INTER(cartesian_product(k, s), cartesian_product(k, t)) == cartesian_product(k, (i : K) => INTER(s(i), t(i)))
      #|  (cartesian_product : ((K) -> Bool, (K, A) -> Bool, (K) -> A) -> Bool)(UNIV, (i : K) => (UNIV : (A) -> Bool)) == (UNIV : ((K) -> A) -> Bool)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 x : (K) -> A, EXTENSIONAL(k, x) \226\134\146 cartesian_product(k, (i : K) => {x(i)}) == {x}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 x : (K) -> A, cartesian_product(k, (i : K) => {x(i)}) == {RESTRICTION(k, x)}
      #|  (j : K) => if j == (i : K) { (x : A) } else { if IN(j, (k : (K) -> Bool)) { (z : (K) -> A)(j) } else { ARB } }
      #|  (z : (K) -> A)
      #|  !(\226\136\131 i : _, IN(i, (k : (_) -> Bool)) && (s : (_, _) -> Bool)(i) == {}) == (\226\136\128 i : _, \226\136\131 a : _, IN(i, k) \226\134\146 IN(a, s(i)))
      #|  (x : A)
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 i : K, IMAGE((x : (K) -> A) => x(i), cartesian_product(k, s)) == (if cartesian_product(k, s) == {} { {} } else { if IN(i, k) { s(i) } else { {ARB} } })
      #|  (i : K)
      #|  (j : K) => if j == (i : K) { (x : A) } else { if IN(j, (k : (K) -> Bool)) { (z : (K) -> A)(j) } else { ARB } }
      #|  (x : A)
      #|  (i : K)
      #|  (z : (K) -> A)
      #|  !(\226\136\131 i : _, IN(i, (k : (_) -> Bool)) && (s : (_, _) -> Bool)(i) == {}) == (\226\136\128 i : _, \226\136\131 x : _, IN(i, k) \226\134\146 IN(x, s(i)))
      #|  cartesian_product((k : (K) -> Bool), (s : (K, A) -> Bool)) == {}
      #|  \226\136\128 P : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, (\226\136\128 z : (K) -> A, \226\136\128 i : K, IN(z, cartesian_product(k, s)) && IN(i, k) \226\134\146 P(i, z(i))) == (cartesian_product(k, s) == {} || (\226\136\128 i : K, \226\136\128 x : A, IN(i, k) && IN(x, s(i)) \226\134\146 P(i, x)))
      #|  \226\136\128 P : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, !(cartesian_product(k, s) == {}) \226\134\146 (\226\136\128 i : K, \226\136\128 x : A, IN(i, k) && IN(x, s(i)) \226\134\146 P(i, x)) == (\226\136\128 z : (K) -> A, \226\136\128 i : K, IN(z, cartesian_product(k, s)) && IN(i, k) \226\134\146 P(i, z(i)))
      #|  \226\136\128 P : (K, A) -> Bool, \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, (\226\136\131 z : (K) -> A, IN(z, cartesian_product(k, s)) && (\226\136\128 i : K, IN(i, k) \226\134\146 P(i, z(i)))) == (\226\136\128 i : K, IN(i, k) \226\134\146 (\226\136\131 x : A, IN(x, s(i)) && P(i, x)))
      #|  (product_map : ((K) -> Bool, (K, A) -> B, (K) -> A, K) -> B)((k : (K) -> Bool), (f : (K, A) -> B)) == ((x : (K) -> A) => RESTRICTION(k, (i : K) => f(i, x(i))))
      #|  \226\136\128 f : (K, A) -> B, \226\136\128 k : (K) -> Bool, \226\136\128 x : (K) -> A, product_map(k, f, RESTRICTION(k, x)) == RESTRICTION(k, (i : K) => f(i, x(i)))
      #|  (g : (K) -> B)
      #|  \226\136\128 f : (K, A) -> B, \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, IMAGE(product_map(k, f), cartesian_product(k, s)) == cartesian_product(k, (i : K) => IMAGE(f(i), s(i)))
      #|  (disjoint_union : ((K) -> Bool, (K, A) -> Bool, (K, A)) -> Bool)((k : (K) -> Bool), (s : (K, A) -> Bool)) == {((i : K), (x : A)) | IN(i, k) && IN(x, s(i))}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, SUBSET(disjoint_union(k, s), disjoint_union(k, t)) == (\226\136\128 i : K, IN(i, k) \226\134\146 SUBSET(s(i), t(i)))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, (disjoint_union(k, s) == disjoint_union(k, t)) == (\226\136\128 i : K, IN(i, k) \226\134\146 s(i) == t(i))
      #|  (i : K) => {(x : A) | IN((i, x), (u : ((K, A)) -> Bool))}
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 u : ((K, A)) -> Bool, SUBSET(u, disjoint_union(k, s)) == (\226\136\131 t : (K, A) -> Bool, u == disjoint_union(k, t) && (\226\136\128 i : K, IN(i, k) \226\134\146 SUBSET(t(i), s(i))))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, INTER(disjoint_union(k, s), disjoint_union(k, t)) == disjoint_union(k, (i : K) => INTER(s(i), t(i)))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, UNION(disjoint_union(k, s), disjoint_union(k, t)) == disjoint_union(k, (i : K) => UNION(s(i), t(i)))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, (disjoint_union(k, s) == {}) == (\226\136\128 i : K, IN(i, k) \226\134\146 s(i) == {})
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 s : (K, A) -> Bool, \226\136\128 t : (K, A) -> Bool, DISJOINT(disjoint_union(k, s), disjoint_union(k, t)) == (\226\136\128 i : K, IN(i, k) \226\134\146 DISJOINT(s(i), t(i)))
      #|  (x : A)
      #|  (x : A)
      #|  (a : A)
      #|  (g : (A) -> B)
      #|  (b : B)
      #|  (x : A) => if IN(x, (s : (A) -> Bool)) { (f : (A) -> B)(x) } else { (d : B) }
      #|  (f : (A) -> B)((a : A))
      #|  (f : (A) -> B)
      #|  {(f : (A) -> B) | (\226\136\128 x : A, IN(x, INSERT((a : A), (s : (A) -> Bool))) \226\134\146 IN(f(x), (t : (B) -> Bool))) && (\226\136\128 x : A, !IN(x, INSERT(a, s)) \226\134\146 f(x) == (d : B))} == IMAGE(fn { (b, g) => (x : A) => if x == a { b } else { g(x) } }, {((b : B), (g : (A) -> B)) | IN(b, t) && IN(g, {(f : (A) -> B) | (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == d)})})
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  (s0 : (A) -> Bool)
      #|  (x : A) => (d : B)
      #|  \226\136\128 d : B, \226\136\128 n : Num, \226\136\128 t : (B) -> Bool, \226\136\128 m : Num, \226\136\128 s : (A) -> Bool, HAS_SIZE(s, m) && HAS_SIZE(t, n) \226\134\146 HAS_SIZE({(f : (A) -> B) | (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == d)}, EXP(n, m))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 CARD({(f : (A) -> B) | (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == (d : B))}) == EXP(CARD(t), CARD(s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) \226\134\146 FINITE({(f : (A) -> B) | (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == (d : B))})
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), m) && (HAS_SIZE : ((B) -> Bool, Num) -> Bool)((UNIV : (B) -> Bool), n) \226\134\146 (HAS_SIZE : (((A) -> B) -> Bool, Num) -> Bool)((UNIV : ((A) -> B) -> Bool), EXP(n, m))
      #|  (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && (FINITE : ((B) -> Bool) -> Bool)((UNIV : (B) -> Bool)) \226\134\146 (CARD : (((A) -> B) -> Bool) -> Num)((UNIV : ((A) -> B) -> Bool)) == EXP((CARD : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)), (CARD : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)))
      #|  (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && (FINITE : ((B) -> Bool) -> Bool)((UNIV : (B) -> Bool)) \226\134\146 (FINITE : (((A) -> B) -> Bool) -> Bool)((UNIV : ((A) -> B) -> Bool))
      #|  UNIV == {false, true}
      #|  (HAS_SIZE : ((Bool) -> Bool, Num) -> Bool)((UNIV : (Bool) -> Bool), 2)
      #|  (CARD : ((Bool) -> Bool) -> Num)((UNIV : (Bool) -> Bool)) == 2
      #|  (FINITE : ((Bool) -> Bool) -> Bool)((UNIV : (Bool) -> Bool))
      #|  false
      #|  true
      #|  {(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))} == {(f : (A) -> Bool) | (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), UNIV)) && (\226\136\128 x : A, !IN(x, s) \226\134\146 f(x) == false)}
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, n) \226\134\146 HAS_SIZE({(t : (A) -> Bool) | SUBSET(t, s)}, EXP(2, n))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 CARD({(t : (A) -> Bool) | SUBSET(t, s)}) == EXP(2, CARD(s))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE({(t : (A) -> Bool) | SUBSET(t, s)})
      #|  FINITE(IMAGE((x : A) => {x}, (s : (A) -> Bool)))
      #|  \226\136\128 s : (A) -> Bool, FINITE({(t : (A) -> Bool) | SUBSET(t, s)}) == FINITE(s)
      #|  {(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE({(t : (A) -> Bool) | SUBSET(t, s) && P(t)})
      #|  FINITE((s : ((A) -> Bool) -> Bool))
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, FINITE(UNIONS(s)) == (FINITE(s) && (\226\136\128 t : (A) -> Bool, IN(t, s) \226\134\146 FINITE(t)))
      #|  CARD((s : (A) -> Bool)) * (n : Num)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A, B) -> Bool, \226\136\128 m : Num, \226\136\128 n : Num, (\226\136\128 x : A, IN(x, s) \226\134\146 FINITE(t(x)) && CARD(t(x)) <= n) && FINITE(s) && CARD(s) <= m \226\134\146 FINITE(UNIONS({t((x : A)) | IN(x, s)})) && CARD(UNIONS({t((x : A)) | IN(x, s)})) <= m * n
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  IN((a : A), (s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  (t : (A) -> Bool)
      #|  (a : A)
      #|  {(s : (A) -> Bool) | SUBSET(s, {})} == {{}} && (\226\136\128 a : A, \226\136\128 t : (A) -> Bool, {(s : (A) -> Bool) | SUBSET(s, INSERT(a, t))} == UNION({(s : (A) -> Bool) | SUBSET(s, t)}, IMAGE((s : (A) -> Bool) => INSERT(a, s), {(s : (A) -> Bool) | SUBSET(s, t)})))
      #|  (s : (A) -> Bool) == UNIONS({{(x : A) | IN(x, s) && (f : (A) -> B)(x) == y} | y : B | IN(y, IMAGE(f, s))})
      #|  !((p : Bool) && (q : Bool)) == (p \226\134\146 !q)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, INFINITE(s) && FINITE(IMAGE(f, s)) \226\134\146 (\226\136\131 a : A, IN(a, s) && INFINITE({(x : A) | IN(x, s) && f(x) == f(a)}))
      #|  ((P : Bool) && IN((x : _), (t : (_) -> Bool))) == (SUBSET({x}, t) && P)
      #|  (x : A)
      #|  UNIONS({(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool)) && HAS_SIZE(t, (n : Num))})
      #|  FINITE((s : (A) -> Bool))
      #|  {(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}
      #|  FINITE((s : (A) -> Bool))
      #|  (SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) && t == {}) == (t == {})
      #|  (n : Num) == 0
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, FINITE({(t : (A) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, n)}) == (FINITE(s) || n == 0)
      #|  (f : (A) -> B)((x : A)) == (k : (A) -> B)(x)
      #|  (x : A)
      #|  IMAGE((x : A) => (x, (f : (A) -> B)(x)), {(x : A) | !(f(x) == (k : (A) -> B)(x))})
      #|  (f : (A) -> B)
      #|  IMAGE((u : ((A, B)) -> Bool) => (x : A) => if (\226\136\131 y : B, IN((x, y), u)) { select((y : B) => IN((x, y), u)) } else { (k : (A) -> B)(x) }, {(u : ((A, B)) -> Bool) | SUBSET(u, CROSS((s : (A) -> Bool), (t : (B) -> Bool)))})
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 k : (A) -> B, FINITE(s) && FINITE(t) \226\134\146 FINITE({(f : (A) -> B) | SUBSET(IMAGE(f, s), t) && SUBSET({(x : A) | !(f(x) == k(x))}, s)})
      #|  {(i : Num) | i < 0} == {} && (\226\136\128 k : Num, {(i : Num) | i < SUC(k)} == INSERT(k, {(i : Num) | i < k}))
      #|  \226\136\128 n : Num, HAS_SIZE({(m : Num) | m < n}, n)
      #|  \226\136\128 n : Num, CARD({(m : Num) | m < n}) == n
      #|  \226\136\128 n : Num, FINITE({(m : Num) | m < n})
      #|  {(i : Num) | i <= 0} == {0} && (\226\136\128 k : Num, {(i : Num) | i <= SUC(k)} == INSERT(SUC(k), {(i : Num) | i <= k}))
      #|  \226\136\128 n : Num, HAS_SIZE({(m : Num) | m <= n}, n + 1)
      #|  \226\136\128 n : Num, FINITE({(m : Num) | m <= n})
      #|  \226\136\128 n : Num, CARD({(m : Num) | m <= n}) == n + 1
      #|  {(m : Num) | m <= (n : Num)}
      #|  (n : Num)
      #|  (s : (Num) -> Bool)
      #|  (s : (Num) -> Bool)
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) == (\226\136\131 a : Num, \226\136\128 x : Num, IN(x, s) \226\134\146 x <= a)
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 (\226\136\131 a : Num, !IN(a, s))
      #|  \226\136\128 s : (Num) -> Bool, INFINITE(s) == (\226\136\128 N : Num, \226\136\131 n : Num, N <= n && IN(n, s))
      #|  (INFINITE : ((Num) -> Bool) -> Bool)((UNIV : (Num) -> Bool))
      #|  (LENGTH : (List[Char]) -> Num)
      #|  (INFINITE : ((List[Char]) -> Bool) -> Bool)((UNIV : (List[Char]) -> Bool))
      #|  (b : Real) <= (a : Real)
      #|  {(x : _) | (p : (_) -> Bool)(x) || (q : (_) -> Bool)(x)} == UNION({(x : _) | p(x)}, {(x : _) | q(x)})
      #|  !((b : Real) == (a : Real)) \226\134\146 (a <= (x : Real) && x <= b) == (a < x && x < b || !(b <= a) && x == a || !(b <= a) && x == b)
      #|  (b : Real) == (a : Real)
      #|  ((a : Real) < (x : Real) && x <= (b : Real)) == (a < x && x < b || !(b <= a) && x == b)
      #|  ((a : Real) <= (x : Real) && x < (b : Real)) == (a < x && x < b || !(b <= a) && x == a)
      #|  {(x : Real) | (b : Real) - real_of_num(1) < x && x < b}
      #|  {(x : Real) | (b : Real) - real_of_num(1) < x && x < b}
      #|  {(x : Real) | (a : Real) < x && x < a + real_of_num(1)}
      #|  {(x : Real) | (a : Real) < x && x < a + real_of_num(1)}
      #|  (a : Real) < (b : Real) \226\134\146 (a + (b - a) / (real_of_num((n : Num)) + real_of_num(2)) == a + (b - a) / (real_of_num((m : Num)) + real_of_num(2))) == (real_of_num(n) == real_of_num(m))
      #|  real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)
      #|  ((x : Real) < x * ((n : Real) + real_of_num(2))) == (real_of_num(0) < x * (n + real_of_num(1)))
      #|  real_of_num(0) < real_of_num((n : Num)) + real_of_num(2)
      #|  ((a : Real) + (x : Real) / (y : Real) < (b : Real)) == (x / y < b - a)
      #|  IMAGE((n : Num) => (a : Real) + ((b : Real) - a) / (real_of_num(n) + real_of_num(2)), UNIV)
      #|  !((a : Real) < (b : Real)) \226\134\146 !(a < (x : Real) && x < b)
      #|  (a : Real) < (b : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, FINITE({(x : Real) | a < x && x < b}) == (b <= a)
      #|  (\226\136\128 a : Real, !FINITE({(x : Real) | a < x})) && (\226\136\128 a : Real, !FINITE({(x : Real) | a <= x})) && (\226\136\128 b : Real, !FINITE({(x : Real) | x < b})) && (\226\136\128 b : Real, !FINITE({(x : Real) | x <= b})) && (\226\136\128 a : Real, \226\136\128 b : Real, FINITE({(x : Real) | a < x && x < b}) == (b <= a)) && (\226\136\128 a : Real, \226\136\128 b : Real, FINITE({(x : Real) | a <= x && x < b}) == (b <= a)) && (\226\136\128 a : Real, \226\136\128 b : Real, FINITE({(x : Real) | a < x && x <= b}) == (b <= a)) && (\226\136\128 a : Real, \226\136\128 b : Real, FINITE({(x : Real) | a <= x && x <= b}) == (b <= a))
      #|  {(x : Real) | real_of_num(0) <= x}
      #|  (INFINITE : ((Real) -> Bool) -> Bool)((UNIV : (Real) -> Bool))
      #|  (a : A) == (x : A)
      #|  (x : A)
      #|  (x : A)
      #|  (m : Num) => if m < (n : Num) { (f : (Num) -> A)(m) } else { (a : A) }
      #|  (f : (Num) -> A)
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  (a : A)
      #|  (a : A)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 n : Num, HAS_SIZE(s, n) \226\134\146 (\226\136\131 f : (Num) -> A, (\226\136\128 m : Num, m < n \226\134\146 IN(f(m), s)) && (\226\136\128 x : A, IN(x, s) \226\134\146 existsunique((m : Num) => m < n && f(m) == x)))
      #|  0
      #|  ((r : Num) < (p : Num)) == (r + 1 <= p)
      #|  SUC((q : Num))
      #|  \226\136\131 q : Num, (p : Num) == (r : (Num) -> Num)(q)
      #|  (p : Num)
      #|  (p : Bool) && ((q : Bool) \226\134\146 (r : Bool)) \226\134\146 p == q \226\134\146 r
      #|  (m : Num) => m < (n : Num) && IN(m, (s : (Num) -> Bool))
      #|  \226\136\131 m : Num, m < (n : Num) && IN(m, (s : (Num) -> Bool))
      #|  (n : Num)
      #|  (m : Num) <= (n : Num) && n + 1 <= (p : Num) \226\134\146 m < p
      #|  (p : Bool) && (p \226\134\146 (q : Bool)) \226\134\146 p && q
      #|  (r : (Num) -> Num)
      #|  (f : (Num) -> Num)(0) == (next : (Num) -> Num)(0) && (\226\136\128 n : Num, f(SUC(n)) == next(f(n) + 1))
      #|  (next : (Num) -> Num)
      #|  ((p : Bool) \226\134\146 !((q : Bool) && (r : Bool))) == (q && p \226\134\146 !r)
      #|  \226\136\128 n : Num, \226\136\131 x : Num, n <= x && IN(x, (s : (Num) -> Bool))
      #|  \226\136\128 s : (Num) -> Bool, INFINITE(s) \226\134\146 (\226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && IMAGE(r, UNIV) == s)
      #|  (r : (Num) -> Num)
      #|  \226\136\128 s : (Num) -> Bool, INFINITE(s) == (\226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && IMAGE(r, UNIV) == s)
      #|  IMAGE((f : (Num) -> A), UNIV)
      #|  IMAGE((f : (Num) -> A), {(m : Num) | m < (n : Num)})
      #|  (n : Num)
      #|  (f : (Num) -> A)
      #|  \226\136\131 f : (Num) -> A, \226\136\128 n : Num, IN(f(n), (s : (A) -> Bool)) && (\226\136\128 m : Num, m < n \226\134\146 !(f(m) == f(n)))
      #|  \226\136\128 s : (A) -> Bool, INFINITE(s) == (\226\136\131 f : (Num) -> A, (\226\136\128 x : Num, IN(f(x), s)) && (\226\136\128 x : Num, \226\136\128 y : Num, f(x) == f(y) \226\134\146 x == y))
      #|  (set_of_list : (List[A], A) -> Bool)(NIL) == {} && set_of_list(CONS((h : A), (t : List[A]))) == INSERT(h, set_of_list(t))
      #|  (list_of_set : ((A) -> Bool) -> List[A])((s : (A) -> Bool)) == select((l : List[A]) => set_of_list(l) == s && LENGTH(l) == CARD(s))
      #|  CONS((x : A), (l : List[A]))
      #|  (NIL : List[A])
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 set_of_list(list_of_set(s)) == s && LENGTH(list_of_set(s)) == CARD(s)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 set_of_list(list_of_set(s)) == s
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 LENGTH(list_of_set(s)) == CARD(s)
      #|  (l : List[A])
      #|  list_of_set((s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\128 x : A, MEM(x, list_of_set(s)) == IN(x, s))
      #|  \226\136\128 l : List[A], FINITE(set_of_list(l))
      #|  \226\136\128 x : A, \226\136\128 l : List[A], IN(x, set_of_list(l)) == MEM(x, l)
      #|  \226\136\128 l1 : List[A], \226\136\128 l2 : List[A], set_of_list(APPEND(l1, l2)) == UNION(set_of_list(l1), set_of_list(l2))
      #|  \226\136\128 f : (A) -> B, \226\136\128 l : List[A], set_of_list(MAP(f, l)) == IMAGE(f, set_of_list(l))
      #|  \226\136\128 l : List[A], (set_of_list(l) == {}) == (l == NIL)
      #|  (list_of_set : ((A) -> Bool) -> List[A])(({} : (A) -> Bool)) == (NIL : List[A])
      #|  \226\136\128 a : A, list_of_set({a}) == [a]
      #|  (INSERT : (A, (A) -> Bool, A) -> Bool)
      #|  ({} : (A) -> Bool)
      #|  (pairwise : ((A, A) -> Bool, (A) -> Bool) -> Bool)((r : (A, A) -> Bool), (s : (A) -> Bool)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) \226\134\146 r(x, y))
      #|  \226\136\128 r : (A, A) -> Bool, pairwise(r, {}) == true
      #|  \226\136\128 r : (A, A) -> Bool, \226\136\128 x : A, pairwise(r, {x}) == true
      #|  \226\136\128 P : (A, A) -> Bool, \226\136\128 Q : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, pairwise(P, s) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && P(x, y) && !(x == y) \226\134\146 Q(x, y)) \226\134\146 pairwise(Q, s)
      #|  \226\136\128 r : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, pairwise(r, s) && SUBSET(t, s) \226\134\146 pairwise(r, t)
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 R' : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, (pairwise(R, s) && pairwise(R', s)) == pairwise((x : A) => (y : A) => R(x, y) && R'(x, y), s)
      #|  \226\136\128 r : (A, A) -> Bool, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, pairwise(r, INSERT(x, s)) == ((\226\136\128 y : A, IN(y, s) && !(y == x) \226\134\146 r(x, y) && r(y, x)) && pairwise(r, s))
      #|  \226\136\128 r : (A, A) -> Bool, \226\136\128 x : A, \226\136\128 s : (A) -> Bool, (\226\136\128 y : A, IN(y, s) \226\134\146 r(x, y) == r(y, x)) \226\134\146 pairwise(r, INSERT(x, s)) == ((\226\136\128 y : A, IN(y, s) && !(y == x) \226\134\146 r(x, y)) && pairwise(r, s))
      #|  \226\136\128 r : (B, B) -> Bool, \226\136\128 f : (A) -> B, pairwise(r, IMAGE(f, (s : (A) -> Bool))) == pairwise((x : A) => (y : A) => !(f(x) == f(y)) \226\134\146 r(f(x), f(y)), s)
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, pairwise(R, UNION(s, t)) == (pairwise(R, s) && pairwise(R, t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, DIFF(s, t)) && IN(y, DIFF(t, s)) \226\134\146 R(x, y) && R(y, x)))
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 c : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, IN(s, c) \226\134\146 pairwise(R, s)) && (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IN(s, c) && IN(t, c) \226\134\146 SUBSET(s, t) || SUBSET(t, s)) \226\134\146 pairwise(R, UNIONS(c))
      #|  UNION((t : (_) -> Bool), (u : (_) -> Bool)) == (s : (_) -> Bool) && DISJOINT(t, u) \226\134\146 DIFF(s, t) == u
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, pairwise(DISJOINT, s) && SUBSET(t, s) \226\134\146 DIFF(UNIONS(s), UNIONS(t)) == UNIONS(DIFF(s, t))
      #|  (u : (A) -> Bool) == (v : (A) -> Bool)
      #|  (v : (A) -> Bool)
      #|  (u : (A) -> Bool)
      #|  (v : (A) -> Bool)
      #|  (u : (A) -> Bool)
      #|  (z : A)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, \226\136\128 t : ((A) -> Bool) -> Bool, pairwise(DISJOINT, UNION(s, t)) \226\134\146 INTER(UNIONS(s), UNIONS(t)) == UNIONS(INTER(s, t))
      #|  SUBSET((u : (_) -> Bool), (v : (_) -> Bool)) && !(DIFF(v, u) == {}) \226\134\146 PSUBSET(u, v)
      #|  \226\136\128 u : ((A) -> Bool) -> Bool, \226\136\128 v : ((A) -> Bool) -> Bool, pairwise(DISJOINT, v) && PSUBSET(u, DELETE(v, {})) \226\134\146 PSUBSET(UNIONS(u), UNIONS(v))
      #|  (UNION_OF : ((((A) -> Bool) -> Bool) -> Bool, ((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((P : (((A) -> Bool) -> Bool) -> Bool), (Q : ((A) -> Bool) -> Bool)) == ((s : (A) -> Bool) => \226\136\131 u : ((A) -> Bool) -> Bool, P(u) && (\226\136\128 c : (A) -> Bool, IN(c, u) \226\134\146 Q(c)) && UNIONS(u) == s)
      #|  (INTERSECTION_OF : ((((A) -> Bool) -> Bool) -> Bool, ((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((P : (((A) -> Bool) -> Bool) -> Bool), (Q : ((A) -> Bool) -> Bool)) == ((s : (A) -> Bool) => \226\136\131 u : ((A) -> Bool) -> Bool, P(u) && (\226\136\128 c : (A) -> Bool, IN(c, u) \226\134\146 Q(c)) && INTERS(u) == s)
      #|  {(s : (A) -> Bool)}
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P({s}) && Q(s) \226\134\146 UNION_OF(P, Q, s)
      #|  {(s : (A) -> Bool)}
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P({s}) && Q(s) \226\134\146 INTERSECTION_OF(P, Q, s)
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, \226\136\128 Q' : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNION_OF(P, Q, s) && (\226\136\128 x : (A) -> Bool, Q(x) \226\134\146 Q'(x)) \226\134\146 UNION_OF(P, Q', s)
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, \226\136\128 Q' : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTERSECTION_OF(P, Q, s) && (\226\136\128 x : (A) -> Bool, Q(x) \226\134\146 Q'(x)) \226\134\146 INTERSECTION_OF(P, Q', s)
      #|  (\226\136\128 s : (A) -> Bool, UNION_OF((P : (((A) -> Bool) -> Bool) -> Bool), (Q : ((A) -> Bool) -> Bool), s) \226\134\146 (R : ((A) -> Bool) -> Bool)(s)) == (\226\136\128 t : ((A) -> Bool) -> Bool, P(t) && (\226\136\128 c : (A) -> Bool, IN(c, t) \226\134\146 Q(c)) \226\134\146 R(UNIONS(t)))
      #|  (\226\136\128 s : (A) -> Bool, INTERSECTION_OF((P : (((A) -> Bool) -> Bool) -> Bool), (Q : ((A) -> Bool) -> Bool), s) \226\134\146 (R : ((A) -> Bool) -> Bool)(s)) == (\226\136\128 t : ((A) -> Bool) -> Bool, P(t) && (\226\136\128 c : (A) -> Bool, IN(c, t) \226\134\146 Q(c)) \226\134\146 R(INTERS(t)))
      #|  ({} : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, P({}) \226\134\146 UNION_OF(P, Q, {})
      #|  ({} : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : (((A) -> Bool) -> Bool) -> Bool, \226\136\128 Q : ((A) -> Bool) -> Bool, P({}) \226\134\146 INTERSECTION_OF(P, Q, UNIV)
      #|  (ARBITRARY : (((A) -> Bool) -> Bool) -> Bool)((s : ((A) -> Bool) -> Bool)) == true
      #|  {(u : (A) -> Bool) | IN(u, (B : ((A) -> Bool) -> Bool)) && SUBSET(u, (s : (A) -> Bool))}
      #|  (s : (A) -> Bool)
      #|  ((p : Bool) == (q : Bool)) == ((p \226\134\146 q) && (q \226\134\146 p))
      #|  \226\136\128 B : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNION_OF(ARBITRARY, B, s) == (\226\136\128 x : A, IN(x, s) \226\134\146 (\226\136\131 u : (A) -> Bool, IN(u, B) && IN(x, u) && SUBSET(u, s)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(ARBITRARY, P, {})
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(ARBITRARY, P, UNIV)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 UNION_OF(ARBITRARY, P, s)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 INTERSECTION_OF(ARBITRARY, P, s)
      #|  {(f : (_) -> _)((y : _)) | IN(y, IMAGE((g : (_) -> _), (s : (_) -> Bool)))} == IMAGE((x : _) => f(g(x)), s)
      #|  IMAGE((c : (A) -> Bool) => DIFF(UNIV, c), (u : ((A) -> Bool) -> Bool))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNION_OF(ARBITRARY, P, s) == INTERSECTION_OF(ARBITRARY, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTERSECTION_OF(ARBITRARY, P, s) == UNION_OF(ARBITRARY, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})
      #|  (f : ((A) -> Bool, (A) -> Bool) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(ARBITRARY, UNION_OF(ARBITRARY, P)) == UNION_OF(ARBITRARY, P)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(ARBITRARY, INTERSECTION_OF(ARBITRARY, P)) == INTERSECTION_OF(ARBITRARY, P)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 UNION_OF(ARBITRARY, P, s)) \226\134\146 UNION_OF(ARBITRARY, P, UNIONS(u))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(ARBITRARY, P, s) && UNION_OF(ARBITRARY, P, t) \226\134\146 UNION_OF(ARBITRARY, P, UNION(s, t))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 INTERSECTION_OF(ARBITRARY, P, s)) \226\134\146 INTERSECTION_OF(ARBITRARY, P, INTERS(u))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(ARBITRARY, P, s) && INTERSECTION_OF(ARBITRARY, P, t) \226\134\146 INTERSECTION_OF(ARBITRARY, P, INTER(s, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(ARBITRARY, P, s) && UNION_OF(ARBITRARY, P, t) \226\134\146 UNION_OF(ARBITRARY, P, INTER(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 UNION_OF(ARBITRARY, P, INTER(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(INTER(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(ARBITRARY, P, s) && UNION_OF(ARBITRARY, P, t) \226\134\146 UNION_OF(ARBITRARY, P, INTER(s, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool)) == DIFF(UNIV, UNION(DIFF(UNIV, s), DIFF(UNIV, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  DIFF(UNIV, UNION((s : (_) -> Bool), (t : (_) -> Bool))) == INTER(DIFF(UNIV, s), DIFF(UNIV, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(ARBITRARY, P, s) && INTERSECTION_OF(ARBITRARY, P, t) \226\134\146 INTERSECTION_OF(ARBITRARY, P, UNION(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 INTERSECTION_OF(ARBITRARY, P, UNION(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(ARBITRARY, P, s) && INTERSECTION_OF(ARBITRARY, P, t) \226\134\146 INTERSECTION_OF(ARBITRARY, P, UNION(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(FINITE, P, {})
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(FINITE, P, UNIV)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 UNION_OF(FINITE, P, s)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, P(s) \226\134\146 INTERSECTION_OF(FINITE, P, s)
      #|  {(f : (_) -> _)((y : _)) | IN(y, IMAGE((g : (_) -> _), (s : (_) -> Bool)))} == IMAGE((x : _) => f(g(x)), s)
      #|  IMAGE((c : (A) -> Bool) => DIFF(UNIV, c), (u : ((A) -> Bool) -> Bool))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, UNION_OF(FINITE, P, s) == INTERSECTION_OF(FINITE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, INTERSECTION_OF(FINITE, P, s) == UNION_OF(FINITE, (s : (A) -> Bool) => P(DIFF(UNIV, s)), DIFF(UNIV, s))
      #|  IMAGE(SND, {((s : (A) -> Bool), (t : (A) -> Bool)) | IN(s, (u : ((A) -> Bool) -> Bool)) && IN(t, (f : ((A) -> Bool, (A) -> Bool) -> Bool)(s))})
      #|  (f : ((A) -> Bool, (A) -> Bool) -> Bool)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, UNION_OF(FINITE, UNION_OF(FINITE, P)) == UNION_OF(FINITE, P)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, INTERSECTION_OF(FINITE, INTERSECTION_OF(FINITE, P)) == INTERSECTION_OF(FINITE, P)
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, FINITE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 UNION_OF(FINITE, P, s)) \226\134\146 UNION_OF(FINITE, P, UNIONS(u))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(FINITE, P, s) && UNION_OF(FINITE, P, t) \226\134\146 UNION_OF(FINITE, P, UNION(s, t))
      #|  (u : ((A) -> Bool) -> Bool)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 u : ((A) -> Bool) -> Bool, FINITE(u) && (\226\136\128 s : (A) -> Bool, IN(s, u) \226\134\146 INTERSECTION_OF(FINITE, P, s)) \226\134\146 INTERSECTION_OF(FINITE, P, INTERS(u))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(FINITE, P, s) && INTERSECTION_OF(FINITE, P, t) \226\134\146 INTERSECTION_OF(FINITE, P, INTER(s, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(FINITE, P, s) && UNION_OF(FINITE, P, t) \226\134\146 UNION_OF(FINITE, P, INTER(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 UNION_OF(FINITE, P, INTER(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(INTER(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, UNION_OF(FINITE, P, s) && UNION_OF(FINITE, P, t) \226\134\146 UNION_OF(FINITE, P, INTER(s, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool)) == DIFF(UNIV, UNION(DIFF(UNIV, s), DIFF(UNIV, t)))
      #|  (\226\136\128 s : (_) -> Bool, (P : ((_) -> Bool) -> Bool)(DIFF(UNIV, s))) == (\226\136\128 s : (_) -> Bool, P(s))
      #|  DIFF(UNIV, UNION((s : (_) -> Bool), (t : (_) -> Bool))) == INTER(DIFF(UNIV, s), DIFF(UNIV, t))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(FINITE, P, s) && INTERSECTION_OF(FINITE, P, t) \226\134\146 INTERSECTION_OF(FINITE, P, UNION(s, t))) == (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 INTERSECTION_OF(FINITE, P, UNION(s, t)))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, P(s) && P(t) \226\134\146 P(UNION(s, t))) \226\134\146 (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, INTERSECTION_OF(FINITE, P, s) && INTERSECTION_OF(FINITE, P, t) \226\134\146 INTERSECTION_OF(FINITE, P, UNION(s, t)))
      #|  \226\136\128 l : List[A], CARD(set_of_list(l)) <= LENGTH(l)
      #|  !(SUC((n : Num)) <= n)
      #|  \226\136\128 l : List[A], HAS_SIZE(set_of_list(l), LENGTH(l)) == PAIRWISE((x : A) => (y : A) => !(x == y), l)
      #|  IMAGE((f : (A) -> B), (s : (A) -> Bool)) == (t : (B) -> Bool)
      #|  ((x : Num) - 1 < x) == !(x == 0)
      #|  CARD(DELETE((s : (A) -> Bool), (y : A)))
      #|  CARD((s : (A) -> Bool)) <= CARD(IMAGE((f : (A) -> B), DELETE(s, (y : A))))
      #|  (x : A) == (y : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> B, FINITE(s) && FINITE(t) && CARD(s) == CARD(t) && SUBSET(IMAGE(f, s), t) \226\134\146 (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && f(x) == y)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> A, FINITE(s) && SUBSET(IMAGE(f, s), s) \226\134\146 (\226\136\128 y : A, IN(y, s) \226\134\146 (\226\136\131 x : A, IN(x, s) && f(x) == y)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y)
      #|  (f : (A) -> B)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> B, FINITE(s) && CARD(s) == CARD(t) && IMAGE(f, s) == t \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 f : (A) -> A, FINITE(s) && IMAGE(f, s) == s \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y)
      #|  (f : (A) -> B)
      #|  (t : (B) -> Bool)
      #|  (s : (A) -> Bool)
      #|  {(x : B) | IN(x, (t : (B) -> Bool)) && (P : (B) -> Bool)(x)} == IMAGE((f : (A) -> B), {(x : A) | IN(x, (s : (A) -> Bool)) && P(f(x))})
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 P : (B) -> Bool, \226\136\128 n : Num, FINITE(s) && FINITE(t) && CARD(s) == CARD(t) && SUBSET(IMAGE(f, s), t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y) && HAS_SIZE({(x : A) | IN(x, s) && P(f(x))}, n) \226\134\146 HAS_SIZE({(x : B) | IN(x, t) && P(x)}, n)
      #|  (z : A) => if z == (x : A) { (y : B) } else { (f : (A) -> B)(z) }
      #|  (f : (A) -> B)
      #|  (t : (B) -> Bool)
      #|  (t : (B) -> Bool)
      #|  (y : B)
      #|  (s : (A) -> Bool)
      #|  (x : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) && CARD(s) <= CARD(t) \226\134\146 (\226\136\131 f : (A) -> B, SUBSET(IMAGE(f, s), t) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y))
      #|  (\226\136\128 P : (A) -> Bool, (\226\136\128 x : A, IN(x, {}) \226\134\146 P(x)) == true) && (\226\136\128 P : (A) -> Bool, \226\136\128 a : A, \226\136\128 s : (A) -> Bool, (\226\136\128 x : A, IN(x, INSERT(a, s)) \226\134\146 P(x)) == (P(a) && (\226\136\128 x : A, IN(x, s) \226\134\146 P(x))))
      #|  (\226\136\128 P : (A) -> Bool, (\226\136\131 x : A, IN(x, {}) && P(x)) == false) && (\226\136\128 P : (A) -> Bool, \226\136\128 a : A, \226\136\128 s : (A) -> Bool, (\226\136\131 x : A, IN(x, INSERT(a, s)) && P(x)) == (P(a) || (\226\136\131 x : A, IN(x, s) && P(x))))
      #|  {(y : A)}
      #|  {(x : A)}
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 u : (A) -> Bool, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, SUBSET(s, u) && SUBSET(t, u) && IMAGE(f, s) == IMAGE(f, t) \226\134\146 s == t) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, u) && IN(y, u) && f(x) == f(y) \226\134\146 x == y)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, IMAGE(f, s) == IMAGE(f, t) \226\134\146 s == t) == (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y)
      #|  {(x : A) | IN(x, (u : (A) -> Bool)) && IN((f : (A) -> B)(x), (t : (B) -> Bool))}
      #|  (t : (B) -> Bool)
      #|  {(y : B)}
      #|  (y : B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 u : (A) -> Bool, \226\136\128 v : (B) -> Bool, (\226\136\128 t : (B) -> Bool, SUBSET(t, v) \226\134\146 (\226\136\131 s : (A) -> Bool, SUBSET(s, u) && IMAGE(f, s) == t)) == (\226\136\128 y : B, IN(y, v) \226\134\146 (\226\136\131 x : A, IN(x, u) && f(x) == y))
      #|  (UNIV : (B) -> Bool)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 t : (B) -> Bool, \226\136\131 s : (A) -> Bool, IMAGE(f, s) == t) == (\226\136\128 y : B, \226\136\131 x : A, f(x) == y)
      #|  ({} : (B) -> Bool)
      #|  {(y : B)}
      #|  (y : B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 u : (B) -> Bool, (\226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, SUBSET(t, u) && SUBSET(t', u) && {(x : A) | IN(x, s) && IN(f(x), t)} == {(x : A) | IN(x, s) && IN(f(x), t')} \226\134\146 t == t') == SUBSET(u, IMAGE(f, s))
      #|  IMAGE((f : (A) -> B), (k : (A) -> Bool))
      #|  (k : (A) -> Bool)
      #|  {(x : A)}
      #|  (y : A)
      #|  (x : A)
      #|  {(x : A)}
      #|  (x : A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 s : (A) -> Bool, \226\136\128 u : (B) -> Bool, (\226\136\128 k : (A) -> Bool, SUBSET(k, s) \226\134\146 (\226\136\131 t : (B) -> Bool, SUBSET(t, u) && {(x : A) | IN(x, s) && IN(f(x), t)} == k)) == (SUBSET(IMAGE(f, s), u) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y))
      #|  (UNIV : (B) -> Bool)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 t : (B) -> Bool, \226\136\128 t' : (B) -> Bool, {(x : A) | IN(f(x), t)} == {(x : A) | IN(f(x), t')} \226\134\146 t == t') == (IMAGE(f, UNIV) == UNIV)
      #|  (UNIV : (B) -> Bool)
      #|  (UNIV : (A) -> Bool)
      #|  (f : (A) -> B)
      #|  \226\136\128 f : (A) -> B, (\226\136\128 k : (A) -> Bool, \226\136\131 t : (B) -> Bool, {(x : A) | IN(f(x), t)} == k) == (\226\136\128 x : A, \226\136\128 y : A, f(x) == f(y) \226\134\146 x == y)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) && CARD(s) == CARD(t) \226\134\146 (\226\136\131 f : (A) -> B, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && f(x) == y)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, FINITE(s) && FINITE(t) && CARD(s) == CARD(t) \226\134\146 (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y))
      #|  (y : B) => if y == (b : B) { (a : A) } else { (g : (B) -> A)(y) }
      #|  (x : A) => if x == (a : A) { (b : B) } else { (f : (A) -> B)(x) }
      #|  (g : (B) -> A)
      #|  (f : (A) -> B)
      #|  DELETE((t : (B) -> Bool), (b : B))
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 a : A, \226\136\128 b : B, FINITE(s) && FINITE(t) && CARD(s) == CARD(t) && IN(a, s) && IN(b, t) \226\134\146 (\226\136\131 f : (A) -> B, \226\136\131 g : (B) -> A, f(a) == b && g(b) == a && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y))
      #|  (t : (B) -> Bool) == IMAGE((f : (A) -> B), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) && HAS_SIZE(s, (n : Num)) \226\134\146 HAS_SIZE(t, n)
      #|  (f : (A) -> B)
      #|  (g : (B) -> A)
      #|  (g : (B) -> A)
      #|  (f : (A) -> B)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) \226\134\146 (d : Bool)) == (a && b \226\134\146 c \226\134\146 d)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> A, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) \226\134\146 (\226\136\128 n : Num, HAS_SIZE(s, n) == HAS_SIZE(t, n))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> A, (FINITE(s) || FINITE(t)) && (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t) && g(f(x)) == x) && (\226\136\128 y : B, IN(y, t) \226\134\146 IN(g(y), s) && f(g(y)) == y) \226\134\146 CARD(s) == CARD(t)
      #|  INSERT((s : (Num) -> A)(0), {(y : A) | (op_lt_lt : (A, A) -> Bool)(y, s(0))})
      #|  (UNIV : (Num) -> Bool)
      #|  (s : (Num) -> A)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 (op_lt_lt : (A, A) -> Bool)((s : (Num) -> A)(n), s(m))
      #|  (s : (Num) -> A)
      #|  \226\136\128 `<<` : (A, A) -> Bool, (\226\136\128 x : A, !`<<`(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, `<<`(x, y) && `<<`(y, z) \226\134\146 `<<`(x, z)) && (\226\136\128 x : A, FINITE({(y : A) | `<<`(y, x)})) \226\134\146 WF(`<<`)
      #|  {(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}
      #|  (t : (A) -> Bool)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 WF((t1 : (A) -> Bool) => (t2 : (A) -> Bool) => PSUBSET(t1, t2) && SUBSET(t2, s))
      #|  (op_lt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == (\226\136\131 f : (A) -> B, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && f(x) == f(y) \226\134\146 x == y))
      #|  (op_lt_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == (op_lt_eq_us_c(s, t) && !op_lt_eq_us_c(t, s))
      #|  (op_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == (\226\136\131 f : (A) -> B, (\226\136\128 x : A, IN(x, s) \226\134\146 IN(f(x), t)) && (\226\136\128 y : B, IN(y, t) \226\134\146 existsunique((x : A) => IN(x, s) && f(x) == y)))
      #|  (op_gt_eq_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == op_lt_eq_us_c(t, s)
      #|  (op_gt_us_c : ((A) -> Bool, (B) -> Bool) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == op_lt_us_c(t, s)
      #|  \226\136\128 s : (B) -> Bool, \226\136\128 t : (A) -> Bool, op_lt_eq_us_c(s, t) == (\226\136\131 g : (A) -> B, \226\136\128 x : B, IN(x, s) \226\134\146 (\226\136\131 y : A, IN(y, t) && g(y) == x))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (B) -> Bool, op_gt_eq_us_c(s, t) == (\226\136\131 f : (A) -> B, \226\136\128 y : B, IN(y, t) \226\134\146 (\226\136\131 x : A, IN(x, s) && y == f(x)))
      #|  (COUNTABLE : ((A) -> Bool) -> Bool)((t : (A) -> Bool)) == (op_gt_eq_us_c : ((Num) -> Bool, (A) -> Bool) -> Bool)((UNIV : (Num) -> Bool), t)
      #|  (sup : ((Real) -> Bool) -> Real)((s : (Real) -> Bool)) == select((a : Real) => (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= a) && (\226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 a <= b))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, (\226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) == (\226\136\128 x : Real, IN(x, t) \226\134\146 x <= b)) \226\134\146 sup(s) == sup(t)
      #|  \226\136\128 s : (Real) -> Bool, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= sup(s)) && (\226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 sup(s) <= b)
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (\226\136\131 b : Real, IN(b, s) && (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b))
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 IN(sup(s), s) && (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= sup(s))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (a <= sup(s)) == (\226\136\131 x : Real, IN(x, s) && a <= x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (sup(s) <= a) == (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= a)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (a < sup(s)) == (\226\136\131 x : Real, IN(x, s) && a < x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (sup(s) < a) == (\226\136\128 x : Real, IN(x, s) \226\134\146 x < a)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) && (\226\136\128 b' : Real, b' < b \226\134\146 (\226\136\131 x : Real, IN(x, s) && b' < x)) \226\134\146 sup(s) == b
      #|  \226\136\128 b : Real, !((s : (Real) -> Bool) == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 sup(s) <= b
      #|  (t : (Real) -> Bool)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, !(s == {}) && SUBSET(s, t) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, t) \226\134\146 x <= b) \226\134\146 sup(s) <= sup(t)
      #|  (s : (Real) -> Bool)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x && x <= b) \226\134\146 a <= sup(s) && sup(s) <= b
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 abs(x) <= a) \226\134\146 abs(sup(s)) <= a
      #|  (abs((x : Real) - (l : Real)) <= (e : Real)) == (l - e <= x && x <= l + e)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 e : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 abs(x - l) <= e) \226\134\146 abs(sup(s) - l) <= e
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (sup(s) == (a : Real)) == (IN(a, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 y <= a))
      #|  \226\136\128 x : Real, \226\136\128 s : (Real) -> Bool, FINITE(s) \226\134\146 sup(INSERT(x, s)) == (if s == {} { x } else { max(x, sup(s)) })
      #|  \226\136\128 a : Real, sup({a}) == a
      #|  \226\136\128 x : Real, IN(x, (s : (Real) -> Bool)) \226\134\146 x <= (c : Real)
      #|  (c : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 s : (Real) -> Bool, sup(INSERT(b, INSERT(a, s))) == sup(INSERT(max(a, b), s))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 y : Real, IN(y, s) && a <= y && (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 a <= sup(s)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 y : Real, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) \226\134\146 (sup(s) <= y) == (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= y)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, (\226\136\128 c : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= c) == (b <= c)) \226\134\146 sup(s) == b
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, !(s == {}) && !(t == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) && (\226\136\131 c : Real, \226\136\128 x : Real, IN(x, t) \226\134\146 x <= c) \226\134\146 sup(UNION(s, t)) == max(sup(s), sup(t))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) && IN(a, s) \226\134\146 a <= sup(s)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 c : Real, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) && c < sup(s) \226\134\146 (\226\136\131 x : Real, IN(x, s) && c < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, max(x, y) == sup({x, y})
      #|  (inf : ((Real) -> Bool) -> Real)((s : (Real) -> Bool)) == select((a : Real) => (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x) && (\226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 b <= a))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, (\226\136\128 a : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x) == (\226\136\128 x : Real, IN(x, t) \226\134\146 a <= x)) \226\134\146 inf(s) == inf(t)
      #|  (a : Real) == sup(IMAGE(op_minus_minus, (s : (Real) -> Bool)))
      #|  IMAGE(op_minus_minus, (s : (Real) -> Bool))
      #|  -sup(IMAGE(op_minus_minus, (s : (Real) -> Bool)))
      #|  \226\136\128 s : (Real) -> Bool, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 (\226\136\128 x : Real, IN(x, s) \226\134\146 inf(s) <= x) && (\226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 b <= inf(s))
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (\226\136\131 b : Real, IN(b, s) && (\226\136\128 x : Real, IN(x, s) \226\134\146 b <= x))
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 IN(inf(s), s) && (\226\136\128 x : Real, IN(x, s) \226\134\146 inf(s) <= x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (a <= inf(s)) == (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (inf(s) <= a) == (\226\136\131 x : Real, IN(x, s) && x <= a)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (a < inf(s)) == (\226\136\128 x : Real, IN(x, s) \226\134\146 a < x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, FINITE(s) && !(s == {}) \226\134\146 (inf(s) < a) == (\226\136\131 x : Real, IN(x, s) && x < a)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) && (\226\136\128 b' : Real, b < b' \226\134\146 (\226\136\131 x : Real, IN(x, s) && x < b')) \226\134\146 inf(s) == b
      #|  \226\136\128 b : Real, !((s : (Real) -> Bool) == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 b <= inf(s)
      #|  (s : (Real) -> Bool)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, !(t == {}) && SUBSET(t, s) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 inf(s) <= inf(t)
      #|  (s : (Real) -> Bool)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x && x <= b) \226\134\146 a <= inf(s) && inf(s) <= b
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 abs(x) <= a) \226\134\146 abs(inf(s)) <= a
      #|  (abs((x : Real) - (l : Real)) <= (e : Real)) == (l - e <= x && x <= l + e)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 e : Real, !(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 abs(x - l) <= e) \226\134\146 abs(inf(s) - l) <= e
      #|  \226\136\128 s : (Real) -> Bool, FINITE(s) && !(s == {}) \226\134\146 (inf(s) == (a : Real)) == (IN(a, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 a <= y))
      #|  \226\136\128 x : Real, \226\136\128 s : (Real) -> Bool, FINITE(s) \226\134\146 inf(INSERT(x, s)) == (if s == {} { x } else { min(x, inf(s)) })
      #|  \226\136\128 a : Real, inf({a}) == a
      #|  \226\136\128 x : Real, IN(x, (s : (Real) -> Bool)) \226\134\146 (c : Real) <= x
      #|  (c : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 s : (Real) -> Bool, inf(INSERT(b, INSERT(a, s))) == inf(INSERT(min(a, b), s))
      #|  !((s : (_) -> Bool) == {}) && (\226\136\128 x : _, IN(x, s) \226\134\146 x == (a : _)) \226\134\146 s == {a}
      #|  sup((s : (Real) -> Bool))
      #|  \226\136\128 s : (Real) -> Bool, !(s == {}) && (\226\136\131 B : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 abs(x) <= B) \226\134\146 (sup(s) == inf(s)) == (\226\136\131 a : Real, s == {a})
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 y : Real, IN(y, s) && y <= b && (\226\136\128 x : Real, IN(x, s) \226\134\146 a <= x) \226\134\146 inf(s) <= b
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 y : Real, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) \226\134\146 (y <= inf(s)) == (\226\136\128 x : Real, IN(x, s) \226\134\146 y <= x)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, (\226\136\128 c : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 c <= x) == (c <= b)) \226\134\146 inf(s) == b
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, !(s == {}) && !(t == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) && (\226\136\131 c : Real, \226\136\128 x : Real, IN(x, t) \226\134\146 c <= x) \226\134\146 inf(UNION(s, t)) == min(inf(s), inf(t))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 a : Real, (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) && IN(a, s) \226\134\146 inf(s) <= a
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 c : Real, !(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) && inf(s) < c \226\134\146 (\226\136\131 x : Real, IN(x, s) && x < c)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, min(x, y) == inf({x, y})
      #|  (has_inf : ((Real) -> Bool, Real) -> Bool)((s : (Real) -> Bool), (b : Real)) == (\226\136\128 c : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 c <= x) == (c <= b))
      #|  (has_sup : ((Real) -> Bool, Real) -> Bool)((s : (Real) -> Bool), (b : Real)) == (\226\136\128 c : Real, (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= c) == (b <= c))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, \226\136\128 x : Real, has_inf(s, b) && IN(x, s) \226\134\146 b <= x
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 b : Real, \226\136\128 x : Real, has_sup(s, b) && IN(x, s) \226\134\146 x <= b
      #|  (l : Real)
      #|  (s : (Real) -> Bool)
      #|  (l : Real) + real_of_num(1)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, has_inf(s, l) == (!(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x) && inf(s) == l)
      #|  (l : Real)
      #|  (s : (Real) -> Bool)
      #|  (l : Real) - real_of_num(1)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, has_sup(s, l) == (!(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b) && sup(s) == l)
      #|  \226\136\128 s : (Real) -> Bool, (\226\136\131 l : Real, has_inf(s, l)) == (!(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 b <= x))
      #|  \226\136\128 s : (Real) -> Bool, (\226\136\131 l : Real, has_sup(s, l)) == (!(s == {}) && (\226\136\131 b : Real, \226\136\128 x : Real, IN(x, s) \226\134\146 x <= b))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 c : Real, has_inf(s, l) && l < c \226\134\146 (\226\136\131 x : Real, IN(x, s) && x < c)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 c : Real, has_sup(s, l) && c < l \226\134\146 (\226\136\131 x : Real, IN(x, s) && c < x)
      #|  (l : Real)
      #|  ((l : Real) + (c : Real)) / real_of_num(2)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, has_inf(s, l) == (!(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 l <= x) && (\226\136\128 c : Real, l < c \226\134\146 (\226\136\131 x : Real, IN(x, s) && x < c)))
      #|  (l : Real)
      #|  ((l : Real) + (c : Real)) / real_of_num(2)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 l : Real, has_sup(s, l) == (!(s == {}) && (\226\136\128 x : Real, IN(x, s) \226\134\146 x <= l) && (\226\136\128 c : Real, c < l \226\134\146 (\226\136\131 x : Real, IN(x, s) && c < x)))
      #|  (y : Real)
      #|  \226\136\131 y : Real, IN(y, (s : (Real) -> Bool)) && y <= (x : Real)
      #|  (c : Real)
      #|  ((l : Real) + (m : Real)) / real_of_num(2)
      #|  \226\136\131 c : Real, (m : Real) < c && c < (l : Real)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 m : Real, has_inf(s, l) && has_inf(t, m) && (\226\136\128 y : Real, IN(y, t) \226\134\146 (\226\136\131 x : Real, IN(x, s) && x <= y)) \226\134\146 l <= m
      #|  (y : Real)
      #|  \226\136\131 y : Real, IN(y, (s : (Real) -> Bool)) && (x : Real) <= y
      #|  (c : Real)
      #|  ((l : Real) + (m : Real)) / real_of_num(2)
      #|  \226\136\131 c : Real, (l : Real) < c && c < (m : Real)
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 t : (Real) -> Bool, \226\136\128 l : Real, \226\136\128 m : Real, has_sup(s, l) && has_sup(t, m) && (\226\136\128 y : Real, IN(y, t) \226\134\146 (\226\136\131 x : Real, IN(x, s) && y <= x)) \226\134\146 m <= l
      #|  op_slash_bslash
      #|IN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) P:fun('A,bool))) (P:fun('A,bool) x:'A))))))
      #|EXTENSION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|GSPEC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) p:fun('A,bool))) p:fun('A,bool))))
      #|SETSPEC =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun('A,bool),bool) (\v:'A. (#forall:fun(fun('A,bool),bool) (\t:'A. ((#=:fun(bool,fun(bool,bool)) (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A) P:bool) t:'A)) ((#/\:fun(bool,fun(bool,bool)) P:bool) ((#=:fun('A,fun('A,bool)) v:'A) t:'A)))))))))
      #|IN_ELIM_THM =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun(bool,fun('A,bool)),bool),bool),bool) (\P:fun(fun(bool,fun('A,bool)),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (P:fun(fun(bool,fun('A,bool)),bool) (#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A)))))) (P:fun(fun(bool,fun('A,bool)),bool) (\p:bool. (\t:'A. ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) x:'A) t:'A))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A) (p:fun('A,bool) y:'A)) y:'A))))))) (p:fun('A,bool) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun(bool,fun('A,bool)),bool),bool),bool) (\P:fun(fun(bool,fun('A,bool)),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (P:fun(fun(bool,fun('A,bool)),bool) (#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A)))) x:'A)) (P:fun(fun(bool,fun('A,bool)),bool) (\p:bool. (\t:'A. ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) x:'A) t:'A))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#GSPEC:fun(fun('A,bool),fun('A,bool)) (\v:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) v:'A) (p:fun('A,bool) y:'A)) y:'A))))) x:'A)) (p:fun('A,bool) x:'A))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\p:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (\y:'A. (p:fun('A,bool) y:'A)))) (p:fun('A,bool) x:'A))))))))))
      #|EMPTY =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) (\x:'A. #F:bool))
      #|INSERT_DEF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))))))
      #|UNIV =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #UNIV:fun('A,bool)) (\x:'A. #T:bool))
      #|UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%1:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%1:'A) ((#\/:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))) x:'A))))))))))
      #|UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%2:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%2:'A) (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool)))))) x:'A))))))))
      #|INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%3:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%3:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))) x:'A))))))))))
      #|INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%4:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%4:'A) (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool)))))) x:'A))))))))
      #|DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%5:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%5:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))) x:'A))))))))))
      #|INSERT =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%6:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%6:'A) ((#\/:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))) y:'A))))))
      #|DELETE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%7:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%7:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) y:'A) x:'A)))) y:'A))))))))))
      #|SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|PSUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))))
      #|DISJOINT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool)))))))
      #|SING =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#SING:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))))))))
      #|FINITE_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))))))))
      #|FINITE_INDUCT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\FINITE':fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (FINITE':fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (FINITE':fun(fun('A,bool),bool) s:fun('A,bool))) (FINITE':fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) (FINITE':fun(fun('A,bool),bool) a:fun('A,bool))))))))
      #|FINITE_CASES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) a:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) #EMPTY:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))))))
      #|INFINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))))
      #|IMAGE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%8:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%8:'B) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) y:'B) (f:fun('A,'B) x:'A)))))) y:'B))))))))))
      #|INJ =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#INJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|SURJ =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) y:'A)) x:'B)))))))))))))))
      #|BIJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#INJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))) (((#SURJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) s:fun('A,bool)) t:fun('B,bool))))))))))
      #|CHOICE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun('A,fun('A,bool)) (#CHOICE:fun(fun('A,bool),'A) s:fun('A,bool))) (#@:fun(fun('A,bool),'A) (\x:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))))
      #|REST =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#REST:fun(fun('A,bool),fun('A,bool)) s:fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) (#CHOICE:fun(fun('A,bool),'A) s:fun('A,bool))))))
      #|NOT_IN_EMPTY =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) #EMPTY:fun('A,bool)))))
      #|IN_UNIV =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) #UNIV:fun('A,bool))))
      #|IN_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|IN_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|IN_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|IN_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))))))))))
      #|IN_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))))))))))
      #|IN_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) s:fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))))))))
      #|IN_DELETE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))
      #|IN_SING =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) #EMPTY:fun('A,bool)))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))
      #|IN_IMAGE =  |- (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) y:'B) (f:fun('A,'B) x:'A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))))))))))
      #|IN_REST =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#REST:fun(fun('A,bool),fun('A,bool)) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) (#CHOICE:fun(fun('A,bool),'A) s:fun('A,bool))))))))))
      #|FORALL_IN_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|EXISTS_IN_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|FORALL_IN_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|EXISTS_IN_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|FORALL_IN_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun('B,bool) y:'B))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('B,bool) (f:fun('A,'B) x:'A))))))))))
      #|EXISTS_IN_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun('B,bool) y:'B))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('B,bool) (f:fun('A,'B) x:'A))))))))))
      #|FORALL_IN_GSPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\Q:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\z:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) z:'B) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%9:'B. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%9:'B) (P:fun('A,bool) x:'A)) (f:fun('A,'B) x:'A)))))))) (Q:fun('B,bool) z:'B))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('B,bool) (f:fun('A,'B) x:'A))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(fun('C,bool),bool),bool) (\Q:fun('C,bool). (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\f:fun('A,fun('B,'C)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('C,bool),bool) (\z:'C. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('C,fun(fun('C,bool),bool)) z:'C) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%10:'C. (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%10:'C) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((f:fun('A,fun('B,'C)) x:'A) y:'B)))))))))) (Q:fun('C,bool) z:'C))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) (Q:fun('C,bool) ((f:fun('A,fun('B,'C)) x:'A) y:'B))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun(fun('D,bool),bool),bool) (\Q:fun('D,bool). (#forall:fun(fun(fun('A,fun('B,fun('C,'D))),bool),bool) (\f:fun('A,fun('B,fun('C,'D))). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('D,bool),bool) (\z:'D. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('D,fun(fun('D,bool),bool)) z:'D) (#GSPEC:fun(fun('D,bool),fun('D,bool)) (\GEN%PVAR%11:'D. (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. (((#SETSPEC:fun('D,fun(bool,fun('D,bool))) GEN%PVAR%11:'D) (((P:fun('A,fun('B,fun('C,bool))) w:'A) x:'B) y:'C)) (((f:fun('A,fun('B,fun('C,'D))) w:'A) x:'B) y:'C)))))))))))) (Q:fun('D,bool) z:'D))))) (#forall:fun(fun('A,bool),bool) (\w:'A. (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('C,bool),bool) (\y:'C. ((#==>:fun(bool,fun(bool,bool)) (((P:fun('A,fun('B,fun('C,bool))) w:'A) x:'B) y:'C)) (Q:fun('D,bool) (((f:fun('A,fun('B,fun('C,'D))) w:'A) x:'B) y:'C))))))))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\P:fun('A,fun('B,fun('C,fun('D,bool)))). (#forall:fun(fun(fun('E,bool),bool),bool) (\Q:fun('E,bool). (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,'E)))),bool),bool) (\f:fun('A,fun('B,fun('C,fun('D,'E)))). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('E,bool),bool) (\z:'E. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('E,fun(fun('E,bool),bool)) z:'E) (#GSPEC:fun(fun('E,bool),fun('E,bool)) (\GEN%PVAR%12:'E. (#?:fun(fun('A,bool),bool) (\v:'A. (#?:fun(fun('B,bool),bool) (\w:'B. (#?:fun(fun('C,bool),bool) (\x:'C. (#?:fun(fun('D,bool),bool) (\y:'D. (((#SETSPEC:fun('E,fun(bool,fun('E,bool))) GEN%PVAR%12:'E) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) v:'A) w:'B) x:'C) y:'D)) ((((f:fun('A,fun('B,fun('C,fun('D,'E)))) v:'A) w:'B) x:'C) y:'D)))))))))))))) (Q:fun('E,bool) z:'E))))) (#forall:fun(fun('A,bool),bool) (\v:'A. (#forall:fun(fun('B,bool),bool) (\w:'B. (#forall:fun(fun('C,bool),bool) (\x:'C. (#forall:fun(fun('D,bool),bool) (\y:'D. ((#==>:fun(bool,fun(bool,bool)) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) v:'A) w:'B) x:'C) y:'D)) (Q:fun('E,bool) ((((f:fun('A,fun('B,fun('C,fun('D,'E)))) v:'A) w:'B) x:'C) y:'D)))))))))))))))))))))
      #|EXISTS_IN_GSPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\Q:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('B,bool),bool) (\z:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) z:'B) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%13:'B. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%13:'B) (P:fun('A,bool) x:'A)) (f:fun('A,'B) x:'A)))))))) (Q:fun('B,bool) z:'B))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('B,bool) (f:fun('A,'B) x:'A))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(fun('C,bool),bool),bool) (\Q:fun('C,bool). (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\f:fun('A,fun('B,'C)). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('C,bool),bool) (\z:'C. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('C,fun(fun('C,bool),bool)) z:'C) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%14:'C. (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%14:'C) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((f:fun('A,fun('B,'C)) x:'A) y:'B)))))))))) (Q:fun('C,bool) z:'C))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) (Q:fun('C,bool) ((f:fun('A,fun('B,'C)) x:'A) y:'B))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun(fun('D,bool),bool),bool) (\Q:fun('D,bool). (#forall:fun(fun(fun('A,fun('B,fun('C,'D))),bool),bool) (\f:fun('A,fun('B,fun('C,'D))). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('D,bool),bool) (\z:'D. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('D,fun(fun('D,bool),bool)) z:'D) (#GSPEC:fun(fun('D,bool),fun('D,bool)) (\GEN%PVAR%15:'D. (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. (((#SETSPEC:fun('D,fun(bool,fun('D,bool))) GEN%PVAR%15:'D) (((P:fun('A,fun('B,fun('C,bool))) w:'A) x:'B) y:'C)) (((f:fun('A,fun('B,fun('C,'D))) w:'A) x:'B) y:'C)))))))))))) (Q:fun('D,bool) z:'D))))) (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. ((#/\:fun(bool,fun(bool,bool)) (((P:fun('A,fun('B,fun('C,bool))) w:'A) x:'B) y:'C)) (Q:fun('D,bool) (((f:fun('A,fun('B,fun('C,'D))) w:'A) x:'B) y:'C))))))))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\P:fun('A,fun('B,fun('C,fun('D,bool)))). (#forall:fun(fun(fun('E,bool),bool),bool) (\Q:fun('E,bool). (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,'E)))),bool),bool) (\f:fun('A,fun('B,fun('C,fun('D,'E)))). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('E,bool),bool) (\z:'E. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('E,fun(fun('E,bool),bool)) z:'E) (#GSPEC:fun(fun('E,bool),fun('E,bool)) (\GEN%PVAR%16:'E. (#?:fun(fun('A,bool),bool) (\v:'A. (#?:fun(fun('B,bool),bool) (\w:'B. (#?:fun(fun('C,bool),bool) (\x:'C. (#?:fun(fun('D,bool),bool) (\y:'D. (((#SETSPEC:fun('E,fun(bool,fun('E,bool))) GEN%PVAR%16:'E) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) v:'A) w:'B) x:'C) y:'D)) ((((f:fun('A,fun('B,fun('C,fun('D,'E)))) v:'A) w:'B) x:'C) y:'D)))))))))))))) (Q:fun('E,bool) z:'E))))) (#?:fun(fun('A,bool),bool) (\v:'A. (#?:fun(fun('B,bool),bool) (\w:'B. (#?:fun(fun('C,bool),bool) (\x:'C. (#?:fun(fun('D,bool),bool) (\y:'D. ((#/\:fun(bool,fun(bool,bool)) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) v:'A) w:'B) x:'C) y:'D)) (Q:fun('E,bool) ((((f:fun('A,fun('B,fun('C,fun('D,'E)))) v:'A) w:'B) x:'C) y:'D)))))))))))))))))))))
      #|UNIONS_IMAGE =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\f:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun('A,fun('B,bool)),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,fun('B,bool))) s:fun('A,bool)))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%17:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%17:'B) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) (f:fun('A,fun('B,bool)) x:'A)))))) y:'B))))))))))
      #|INTERS_IMAGE =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\f:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun('A,fun('B,bool)),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,fun('B,bool))) s:fun('A,bool)))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%18:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%18:'B) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) (f:fun('A,fun('B,bool)) x:'A)))))) y:'B))))))))))
      #|UNIONS_GSPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\f:fun('A,fun('B,bool)). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%19:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%19:fun('B,bool)) (P:fun('A,bool) x:'A)) (f:fun('A,fun('B,bool)) x:'A)))))))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%20:'B. (#?:fun(fun('B,bool),bool) (\a:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%20:'B) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#IN:fun('B,fun(fun('B,bool),bool)) a:'B) (f:fun('A,fun('B,bool)) x:'A)))))) a:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\f:fun('A,fun('B,fun('C,bool))). ((#=:fun(fun('C,bool),fun(fun('C,bool),bool)) (#UNIONS:fun(fun(fun('C,bool),bool),fun('C,bool)) (#GSPEC:fun(fun(fun('C,bool),bool),fun(fun('C,bool),bool)) (\GEN%PVAR%21:fun('C,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(fun('C,bool),fun(bool,fun(fun('C,bool),bool))) GEN%PVAR%21:fun('C,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((f:fun('A,fun('B,fun('C,bool))) x:'A) y:'B)))))))))) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%22:'C. (#?:fun(fun('C,bool),bool) (\a:'C. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%22:'C) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((#IN:fun('C,fun(fun('C,bool),bool)) a:'C) ((f:fun('A,fun('B,fun('C,bool))) x:'A) y:'B)))))))) a:'C))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\f:fun('A,fun('B,fun('C,fun('D,bool)))). ((#=:fun(fun('D,bool),fun(fun('D,bool),bool)) (#UNIONS:fun(fun(fun('D,bool),bool),fun('D,bool)) (#GSPEC:fun(fun(fun('D,bool),bool),fun(fun('D,bool),bool)) (\GEN%PVAR%23:fun('D,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('C,bool),bool) (\z:'C. (((#SETSPEC:fun(fun('D,bool),fun(bool,fun(fun('D,bool),bool))) GEN%PVAR%23:fun('D,bool)) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) (((f:fun('A,fun('B,fun('C,fun('D,bool)))) x:'A) y:'B) z:'C)))))))))))) (#GSPEC:fun(fun('D,bool),fun('D,bool)) (\GEN%PVAR%24:'D. (#?:fun(fun('D,bool),bool) (\a:'D. (((#SETSPEC:fun('D,fun(bool,fun('D,bool))) GEN%PVAR%24:'D) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('C,bool),bool) (\z:'C. ((#/\:fun(bool,fun(bool,bool)) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) ((#IN:fun('D,fun(fun('D,bool),bool)) a:'D) (((f:fun('A,fun('B,fun('C,fun('D,bool)))) x:'A) y:'B) z:'C)))))))))) a:'D))))))))))))
      #|INTERS_GSPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\f:fun('A,fun('B,bool)). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%25:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%25:fun('B,bool)) (P:fun('A,bool) x:'A)) (f:fun('A,fun('B,bool)) x:'A)))))))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%26:'B. (#?:fun(fun('B,bool),bool) (\a:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%26:'B) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#IN:fun('B,fun(fun('B,bool),bool)) a:'B) (f:fun('A,fun('B,bool)) x:'A)))))) a:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\f:fun('A,fun('B,fun('C,bool))). ((#=:fun(fun('C,bool),fun(fun('C,bool),bool)) (#INTERS:fun(fun(fun('C,bool),bool),fun('C,bool)) (#GSPEC:fun(fun(fun('C,bool),bool),fun(fun('C,bool),bool)) (\GEN%PVAR%27:fun('C,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(fun('C,bool),fun(bool,fun(fun('C,bool),bool))) GEN%PVAR%27:fun('C,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((f:fun('A,fun('B,fun('C,bool))) x:'A) y:'B)))))))))) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%28:'C. (#?:fun(fun('C,bool),bool) (\a:'C. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%28:'C) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((#IN:fun('C,fun(fun('C,bool),bool)) a:'C) ((f:fun('A,fun('B,fun('C,bool))) x:'A) y:'B)))))))) a:'C))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\f:fun('A,fun('B,fun('C,fun('D,bool)))). ((#=:fun(fun('D,bool),fun(fun('D,bool),bool)) (#INTERS:fun(fun(fun('D,bool),bool),fun('D,bool)) (#GSPEC:fun(fun(fun('D,bool),bool),fun(fun('D,bool),bool)) (\GEN%PVAR%29:fun('D,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('C,bool),bool) (\z:'C. (((#SETSPEC:fun(fun('D,bool),fun(bool,fun(fun('D,bool),bool))) GEN%PVAR%29:fun('D,bool)) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) (((f:fun('A,fun('B,fun('C,fun('D,bool)))) x:'A) y:'B) z:'C)))))))))))) (#GSPEC:fun(fun('D,bool),fun('D,bool)) (\GEN%PVAR%30:'D. (#?:fun(fun('D,bool),bool) (\a:'D. (((#SETSPEC:fun('D,fun(bool,fun('D,bool))) GEN%PVAR%30:'D) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('C,bool),bool) (\z:'C. ((#==>:fun(bool,fun(bool,bool)) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) ((#IN:fun('D,fun(fun('D,bool),bool)) a:'D) (((f:fun('A,fun('B,fun('C,fun('D,bool)))) x:'A) y:'B) z:'C)))))))))) a:'D))))))))))))
      #|CHOICE_DEF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) (#CHOICE:fun(fun('A,bool),'A) s:fun('A,bool))) s:fun('A,bool)))))
      #|NOT_EQUAL_SETS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))))))))
      #|INSERT_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%31:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%31:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (P:fun('A,bool) x:'A))) x:'A)))))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) (P:fun('A,bool) a:'A)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%32:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%32:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%33:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%33:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))))))))))
      #|UNIV_1 =  |- ((#=:fun(fun(1,bool),fun(fun(1,bool),bool)) #UNIV:fun(1,bool)) ((#INSERT:fun(1,fun(fun(1,bool),fun(1,bool))) #one:1) #EMPTY:fun(1,bool)))
      #|MEMBER_NOT_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))))
      #|UNIV_NOT_EMPTY =  |- (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #UNIV:fun('A,bool)) #EMPTY:fun('A,bool)))
      #|EMPTY_NOT_UNIV =  |- (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) #UNIV:fun('A,bool)))
      #|EQ_UNIV =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool)))
      #|SUBSET_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))
      #|SUBSET_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool))))
      #|SUBSET_ANTISYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))
      #|SUBSET_ANTISYM_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))
      #|EMPTY_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) s:fun('A,bool))))
      #|SUBSET_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))
      #|SUBSET_UNIV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool))))
      #|UNIV_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) #UNIV:fun('A,bool)) s:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool)))))
      #|SING_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))))
      #|SUBSET_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%34:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%34:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) s:fun('A,bool))))))
      #|PSUBSET_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))
      #|PSUBSET_SUBSET_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))
      #|SUBSET_PSUBSET_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool)))))))))
      #|PSUBSET_IRREFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool)))))
      #|NOT_PSUBSET_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))
      #|NOT_UNIV_PSUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) #UNIV:fun('A,bool)) s:fun('A,bool)))))
      #|PSUBSET_UNIV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))))))
      #|PSUBSET_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) t:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))))))))))))
      #|UNION_ASSOC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool))))))))))
      #|UNION_IDEMPOT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s:fun('A,bool))) s:fun('A,bool))))
      #|UNION_COMM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool)))))))
      #|SUBSET_UNION =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool))))))))
      #|SUBSET_UNION_ABSORPTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) t:fun('A,bool)))))))
      #|UNION_EMPTY =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #EMPTY:fun('A,bool)) s:fun('A,bool))) s:fun('A,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #EMPTY:fun('A,bool))) s:fun('A,bool)))))
      #|UNION_UNIV =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))) #UNIV:fun('A,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #UNIV:fun('A,bool))) #UNIV:fun('A,bool)))))
      #|EMPTY_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) #EMPTY:fun('A,bool))))))))
      #|UNION_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))))))))))
      #|UNION_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%35:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%35:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) (P:fun('A,bool) x:'A))) x:'A)))))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%36:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%36:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%37:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%37:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))))))))))
      #|FORALL_SUBSET_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t':fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t':fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u':fun('A,bool)) u:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t':fun('A,bool)) u':fun('A,bool)))))))))))))
      #|EXISTS_SUBSET_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t':fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\u':fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t':fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u':fun('A,bool)) u:fun('A,bool))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t':fun('A,bool)) u':fun('A,bool))))))))))))))
      #|FORALL_SUBSET_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool))))))))))))
      #|EXISTS_SUBSET_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool))))))))))))
      #|INTER_ASSOC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool))))))))))
      #|INTER_IDEMPOT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s:fun('A,bool))) s:fun('A,bool))))
      #|INTER_COMM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool)))))))
      #|INTER_SUBSET =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool))) s:fun('A,bool)))))))
      #|SUBSET_INTER_ABSORPTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool)))))))
      #|INTER_EMPTY =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #EMPTY:fun('A,bool)) s:fun('A,bool))) #EMPTY:fun('A,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #EMPTY:fun('A,bool))) #EMPTY:fun('A,bool)))))
      #|INTER_UNIV =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))) s:fun('A,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #UNIV:fun('A,bool))) s:fun('A,bool)))))
      #|SUBSET_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))))))))))
      #|INTER_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%38:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%38:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) (P:fun('A,bool) x:'A))) x:'A)))))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%39:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%39:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%40:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%40:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))))))))))
      #|UNION_OVER_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) u:fun('A,bool))))))))))
      #|INTER_OVER_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) u:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) u:fun('A,bool))))))))))
      #|IN_DISJOINT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))))))))))
      #|DISJOINT_SYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))))))
      #|DISJOINT_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) s:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))
      #|DISJOINT_EMPTY_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s:fun('A,bool)))))
      #|DISJOINT_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))))))))))
      #|DISJOINT_SING =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))) s:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))))))))
      #|DIFF_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #EMPTY:fun('A,bool))) s:fun('A,bool))))
      #|EMPTY_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #EMPTY:fun('A,bool)) s:fun('A,bool))) #EMPTY:fun('A,bool))))
      #|DIFF_UNIV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) #UNIV:fun('A,bool))) #EMPTY:fun('A,bool))))
      #|DIFF_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) t:fun('A,bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))
      #|DIFF_EQ_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s:fun('A,bool))) #EMPTY:fun('A,bool))))
      #|SUBSET_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool))))))
      #|COMPL_COMPL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool)))) s:fun('A,bool))))
      #|DIFF_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%41:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%41:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) (P:fun('A,bool) x:'A))) x:'A)))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%42:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%42:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%43:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%43:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))))))))))
      #|COMPONENT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))))))
      #|DECOMPOSITION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) t:fun('A,bool)))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))))))))))
      #|SET_CASES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) t:fun('A,bool)))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))))))))))
      #|ABSORPTION =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) s:fun('A,bool)))))))
      #|INSERT_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))))))
      #|INSERT_COMM =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) s:fun('A,bool)))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))))))))))
      #|INSERT_UNIV =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #UNIV:fun('A,bool))) #UNIV:fun('A,bool))))
      #|NOT_INSERT_EMPTY =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) #EMPTY:fun('A,bool)))))))
      #|NOT_EMPTY_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))))))))
      #|INSERT_UNION =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|INSERT_UNION_EQ =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|INSERT_INTER =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|DISJOINT_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))))))))))
      #|INSERT_SUBSET =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|SUBSET_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) t:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|INSERT_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|INSERT_AC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) s:fun('A,bool)))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) y:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))))
      #|INTER_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) r:fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) p:fun('A,bool))) p:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))))))
      #|UNION_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) p:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool))) r:fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) r:fun('A,bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) q:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) r:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) p:fun('A,bool))) p:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) p:fun('A,bool)) q:fun('A,bool)))))))
      #|DELETE_NON_ELEMENT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) s:fun('A,bool)))))))
      #|IN_DELETE_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\x':'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x':'A) s:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x':'A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x':'A) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))))))))))
      #|EMPTY_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) #EMPTY:fun('A,bool)) x:'A)) #EMPTY:fun('A,bool))))
      #|DELETE_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) x:'A)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))))))
      #|DELETE_COMM =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) y:'A)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) y:'A)) x:'A))))))))
      #|DELETE_SUBSET =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) s:fun('A,bool))))))
      #|SUBSET_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) t:fun('A,bool)) x:'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|SUBSET_INSERT_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) t:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) t:fun('A,bool)))))))))
      #|DIFF_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) t:fun('A,bool)))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) t:fun('A,bool)))))))))
      #|PSUBSET_INSERT_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) t:fun('A,bool))))))))))
      #|DELETE_INSERT =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) y:'A)) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) y:'A)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) y:'A))))))))))
      #|INSERT_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) s:fun('A,bool)))))))
      #|DELETE_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) t:fun('A,bool))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) x:'A))))))))
      #|DISJOINT_DELETE_SYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) t:fun('A,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) t:fun('A,bool)) x:'A)) s:fun('A,bool)))))))))
      #|UNIONS_0 =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))
      #|UNIONS_1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) s:fun('A,bool))))
      #|UNIONS_2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) t:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))
      #|UNIONS_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) u:fun(fun('A,bool),bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|FORALL_IN_UNIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (P:fun('A,bool) x:'A))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool)))) (P:fun('A,bool) x:'A)))))))))))
      #|EXISTS_IN_UNIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (P:fun('A,bool) x:'A))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|EMPTY_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) #EMPTY:fun('A,bool))))))))
      #|INTER_UNIONS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) t:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%44:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%44:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) x:fun('A,bool)) t:fun('A,bool)))))))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%45:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%45:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) x:fun('A,bool))))))))))))))
      #|UNIONS_SUBSET =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) t:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|SUBSET_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\g:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) g:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) g:fun(fun('A,bool),bool))))))))
      #|UNIONS_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#UNION:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) t:fun(fun('A,bool),bool)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool))))))))
      #|INTERS_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#UNION:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) t:fun(fun('A,bool),bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool))))))))
      #|UNIONS_MONO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) s:fun(fun('A,bool),bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) y:fun('A,bool)) t:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) y:fun('A,bool))))))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool))))))))
      #|UNIONS_MONO_IMAGE =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\f:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\g:fun('A,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) (f:fun('A,fun('B,bool)) x:'A)) (g:fun('A,fun('B,bool)) x:'A)))))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun('A,fun('B,bool)),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,fun('B,bool))) s:fun('A,bool)))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun('A,fun('B,bool)),fun(fun('A,bool),fun(fun('B,bool),bool))) g:fun('A,fun('B,bool))) s:fun('A,bool)))))))))))
      #|UNIONS_UNIV =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) #UNIV:fun(fun('A,bool),bool))) #UNIV:fun('A,bool))
      #|UNIONS_INSERT_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)) s:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))))
      #|UNIONS_DELETE_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))))
      #|INTERS_0 =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))) #UNIV:fun('A,bool))
      #|INTERS_1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) s:fun('A,bool))))
      #|INTERS_2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) t:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))
      #|INTERS_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) u:fun(fun('A,bool),bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|SUBSET_INTERS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|INTERS_SUBSET =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) u:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) s:fun('A,bool)))))))
      #|INTERS_SUBSET_STRONG =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) u:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) s:fun('A,bool)))))))
      #|INTERS_ANTIMONO =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\g:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) g:fun(fun('A,bool),bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) g:fun(fun('A,bool),bool))))))))
      #|INTERS_EQ_UNIV =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) #UNIV:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #UNIV:fun('A,bool))))))))
      #|INTERS_ANTIMONO_GEN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) y:fun('A,bool)) t:fun(fun('A,bool),bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) y:fun('A,bool))))))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool))))))))
      #|IMAGE_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) #EMPTY:fun('A,bool))) #EMPTY:fun('B,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))
      #|IMAGE_UNION =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#UNION:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))
      #|IMAGE_ID =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) (\x:'A. x:'A)) s:fun('A,bool))) s:fun('A,bool))))
      #|IMAGE_I =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) #I:fun('A,'A)) s:fun('A,bool))) s:fun('A,bool))))
      #|IMAGE_o =  |- (#forall:fun(fun(fun('B,'C),bool),bool) (\f:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('C,bool),fun(fun('C,bool),bool)) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) f:fun('B,'C)) g:fun('A,'B))) s:fun('A,bool))) ((#IMAGE:fun(fun('B,'C),fun(fun('B,bool),fun('C,bool))) f:fun('B,'C)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) g:fun('A,'B)) s:fun('A,bool))))))))))
      #|IMAGE_SUBSET =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))
      #|IMAGE_INTER_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))
      #|IMAGE_DIFF_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))
      #|IMAGE_DIFF_INJ_ALT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))
      #|IMAGE_DELETE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) a:'A)))) ((#=:fun('A,fun('A,bool)) x:'A) a:'A))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A))) ((#DELETE:fun(fun('B,bool),fun('B,fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (f:fun('A,'B) a:'A))))))))))
      #|IMAGE_DELETE_INJ_ALT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A))) ((#DELETE:fun(fun('B,bool),fun('B,fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) (f:fun('A,'B) a:'A))))))))))
      #|IMAGE_EQ_EMPTY =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) #EMPTY:fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))))
      #|FORALL_IN_IMAGE_2 =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\P:fun('B,fun('B,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) ((P:fun('B,fun('B,bool)) x:'B) y:'B))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((P:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))))))))))
      #|IMAGE_CONST =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\c:'B. ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) (\x:'A. c:'B)) s:fun('A,bool))) (((#COND:fun(bool,fun(fun('B,bool),fun(fun('B,bool),fun('B,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) #EMPTY:fun('B,bool)) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) c:'B) #EMPTY:fun('B,bool))))))))
      #|SIMPLE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%46:'B. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%46:'B) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (f:fun('A,'B) x:'A))))))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))))
      #|SIMPLE_IMAGE_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%47:'B. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%47:'B) (P:fun('A,bool) x:'A)) (f:fun('A,'B) x:'A))))))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%48:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%48:'A) (P:fun('A,bool) x:'A)) x:'A)))))))))))
      #|IMAGE_UNIONS =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) (#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B))) s:fun(fun('A,bool),bool))))))))
      #|FUN_IN_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))))
      #|SURJECTIVE_IMAGE_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool)))))))))
      #|IMAGE_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) g:fun('A,'B)) s:fun('A,bool))))))))))
      #|EMPTY_GSPEC =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%49:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%49:'A) #F:bool) x:'A)))))) #EMPTY:fun('A,bool))
      #|UNIV_GSPEC =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%50:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%50:'A) #T:bool) x:'A)))))) #UNIV:fun('A,bool))
      #|SING_GSPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%51:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%51:'A) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) x:'A)))))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%52:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%52:'A) ((#=:fun('A,fun('A,bool)) a:'A) x:'A)) x:'A)))))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))))))
      #|SING_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))))
      #|IN_GSPEC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%53:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%53:'A) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) x:'A)))))) s:fun('A,bool))))
      #|IN_ELIM_PAIR_THM =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%54:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%54:prod('A,'B)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)))))))))) ((P:fun('A,fun('B,bool)) a:'A) b:'B))))))))
      #|IN_ELIM_TRIPLE_THM =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun('C,bool),bool) (\c:'C. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,prod('B,'C)),fun(fun(prod('A,prod('B,'C)),bool),bool)) ((#,:fun('A,fun(prod('B,'C),prod('A,prod('B,'C)))) a:'A) ((#,:fun('B,fun('C,prod('B,'C))) b:'B) c:'C))) (#GSPEC:fun(fun(prod('A,prod('B,'C)),bool),fun(prod('A,prod('B,'C)),bool)) (\GEN%PVAR%55:prod('A,prod('B,'C)). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('C,bool),bool) (\z:'C. (((#SETSPEC:fun(prod('A,prod('B,'C)),fun(bool,fun(prod('A,prod('B,'C)),bool))) GEN%PVAR%55:prod('A,prod('B,'C))) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) ((#,:fun('A,fun(prod('B,'C),prod('A,prod('B,'C)))) x:'A) ((#,:fun('B,fun('C,prod('B,'C))) y:'B) z:'C))))))))))))) (((P:fun('A,fun('B,fun('C,bool))) a:'A) b:'B) c:'C))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\P:fun('A,fun('B,fun('C,bool))). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun('C,bool),bool) (\c:'C. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod(prod('A,'B),'C),fun(fun(prod(prod('A,'B),'C),bool),bool)) ((#,:fun(prod('A,'B),fun('C,prod(prod('A,'B),'C))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B)) c:'C)) (#GSPEC:fun(fun(prod(prod('A,'B),'C),bool),fun(prod(prod('A,'B),'C),bool)) (\GEN%PVAR%56:prod(prod('A,'B),'C). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('C,bool),bool) (\z:'C. (((#SETSPEC:fun(prod(prod('A,'B),'C),fun(bool,fun(prod(prod('A,'B),'C),bool))) GEN%PVAR%56:prod(prod('A,'B),'C)) (((P:fun('A,fun('B,fun('C,bool))) x:'A) y:'B) z:'C)) ((#,:fun(prod('A,'B),fun('C,prod(prod('A,'B),'C))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) z:'C)))))))))))) (((P:fun('A,fun('B,fun('C,bool))) a:'A) b:'B) c:'C)))))))))))
      #|IN_ELIM_QUAD_THM =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\P:fun('A,fun('B,fun('C,fun('D,bool)))). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun('C,bool),bool) (\c:'C. (#forall:fun(fun('D,bool),bool) (\d:'D. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,prod('B,prod('C,'D))),fun(fun(prod('A,prod('B,prod('C,'D))),bool),bool)) ((#,:fun('A,fun(prod('B,prod('C,'D)),prod('A,prod('B,prod('C,'D))))) a:'A) ((#,:fun('B,fun(prod('C,'D),prod('B,prod('C,'D)))) b:'B) ((#,:fun('C,fun('D,prod('C,'D))) c:'C) d:'D)))) (#GSPEC:fun(fun(prod('A,prod('B,prod('C,'D))),bool),fun(prod('A,prod('B,prod('C,'D))),bool)) (\GEN%PVAR%57:prod('A,prod('B,prod('C,'D))). (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. (#?:fun(fun('D,bool),bool) (\z:'D. (((#SETSPEC:fun(prod('A,prod('B,prod('C,'D))),fun(bool,fun(prod('A,prod('B,prod('C,'D))),bool))) GEN%PVAR%57:prod('A,prod('B,prod('C,'D)))) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) w:'A) x:'B) y:'C) z:'D)) ((#,:fun('A,fun(prod('B,prod('C,'D)),prod('A,prod('B,prod('C,'D))))) w:'A) ((#,:fun('B,fun(prod('C,'D),prod('B,prod('C,'D)))) x:'B) ((#,:fun('C,fun('D,prod('C,'D))) y:'C) z:'D)))))))))))))))) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) a:'A) b:'B) c:'C) d:'D))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\P:fun('A,fun('B,fun('C,fun('D,bool)))). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun('C,bool),bool) (\c:'C. (#forall:fun(fun('D,bool),bool) (\d:'D. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod(prod('A,'B),prod('C,'D)),fun(fun(prod(prod('A,'B),prod('C,'D)),bool),bool)) ((#,:fun(prod('A,'B),fun(prod('C,'D),prod(prod('A,'B),prod('C,'D)))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B)) ((#,:fun('C,fun('D,prod('C,'D))) c:'C) d:'D))) (#GSPEC:fun(fun(prod(prod('A,'B),prod('C,'D)),bool),fun(prod(prod('A,'B),prod('C,'D)),bool)) (\GEN%PVAR%58:prod(prod('A,'B),prod('C,'D)). (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. (#?:fun(fun('D,bool),bool) (\z:'D. (((#SETSPEC:fun(prod(prod('A,'B),prod('C,'D)),fun(bool,fun(prod(prod('A,'B),prod('C,'D)),bool))) GEN%PVAR%58:prod(prod('A,'B),prod('C,'D))) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) w:'A) x:'B) y:'C) z:'D)) ((#,:fun(prod('A,'B),fun(prod('C,'D),prod(prod('A,'B),prod('C,'D)))) ((#,:fun('A,fun('B,prod('A,'B))) w:'A) x:'B)) ((#,:fun('C,fun('D,prod('C,'D))) y:'C) z:'D))))))))))))))) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) a:'A) b:'B) c:'C) d:'D))))))))))))) (#forall:fun(fun(fun('A,fun('B,fun('C,fun('D,bool)))),bool),bool) (\P:fun('A,fun('B,fun('C,fun('D,bool)))). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun('C,bool),bool) (\c:'C. (#forall:fun(fun('D,bool),bool) (\d:'D. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod(prod(prod('A,'B),'C),'D),fun(fun(prod(prod(prod('A,'B),'C),'D),bool),bool)) ((#,:fun(prod(prod('A,'B),'C),fun('D,prod(prod(prod('A,'B),'C),'D))) ((#,:fun(prod('A,'B),fun('C,prod(prod('A,'B),'C))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B)) c:'C)) d:'D)) (#GSPEC:fun(fun(prod(prod(prod('A,'B),'C),'D),bool),fun(prod(prod(prod('A,'B),'C),'D),bool)) (\GEN%PVAR%59:prod(prod(prod('A,'B),'C),'D). (#?:fun(fun('A,bool),bool) (\w:'A. (#?:fun(fun('B,bool),bool) (\x:'B. (#?:fun(fun('C,bool),bool) (\y:'C. (#?:fun(fun('D,bool),bool) (\z:'D. (((#SETSPEC:fun(prod(prod(prod('A,'B),'C),'D),fun(bool,fun(prod(prod(prod('A,'B),'C),'D),bool))) GEN%PVAR%59:prod(prod(prod('A,'B),'C),'D)) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) w:'A) x:'B) y:'C) z:'D)) ((#,:fun(prod(prod('A,'B),'C),fun('D,prod(prod(prod('A,'B),'C),'D))) ((#,:fun(prod('A,'B),fun('C,prod(prod('A,'B),'C))) ((#,:fun('A,fun('B,prod('A,'B))) w:'A) x:'B)) y:'C)) z:'D)))))))))))))) ((((P:fun('A,fun('B,fun('C,fun('D,bool)))) a:'A) b:'B) c:'C) d:'D))))))))))))))
      #|SET_PAIR_THM =  |- (#forall:fun(fun(fun(prod('A,'B),bool),bool),bool) (\P:fun(prod('A,'B),bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%60:prod('A,'B). (#?:fun(fun(prod('A,'B),bool),bool) (\p:prod('A,'B). (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%60:prod('A,'B)) (P:fun(prod('A,'B),bool) p:prod('A,'B))) p:prod('A,'B))))))) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%61:prod('A,'B). (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun('B,bool),bool) (\b:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%61:prod('A,'B)) (P:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B)))))))))))
      #|SET_PROVE_CASES =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|UNIONS_SINGS_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%62:fun('A,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%62:fun('A,bool)) (P:fun('A,bool) x:'A)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%63:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%63:'A) (P:fun('A,bool) x:'A)) x:'A))))))))
      #|UNIONS_SINGS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%64:fun('A,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%64:fun('A,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))))))))) s:fun('A,bool))))
      #|IMAGE_INTERS =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) s:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) (#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B))) s:fun(fun('A,bool),bool)))))))))
      #|DIFF_INTERS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%65:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%65:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) t:fun('A,bool)))))))))))))
      #|INTERS_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%66:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%66:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) t:fun('A,bool))))))))))))
      #|UNIONS_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%67:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%67:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) t:fun('A,bool))))))))))))
      #|UNIONS_DIFF =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) t:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%68:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%68:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) x:fun('A,bool)) t:fun('A,bool)))))))))))))
      #|DIFF_UNIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%69:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%69:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) t:fun('A,bool))))))))))))))
      #|DIFF_UNIONS_NONEMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) s:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%70:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%70:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) u:fun('A,bool)) t:fun('A,bool))))))))))))))
      #|INTERS_OVER_UNIONS =  |- (#forall:fun(fun(fun('A,fun(fun('B,bool),bool)),bool),bool) (\f:fun('A,fun(fun('B,bool),bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%71:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%71:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (f:fun('A,fun(fun('B,bool),bool)) x:'A))))))))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%72:fun('B,bool). (#?:fun(fun(fun('A,fun('B,bool)),bool),bool) (\g:fun('A,fun('B,bool)). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%72:fun('B,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) (g:fun('A,fun('B,bool)) x:'A)) (f:fun('A,fun(fun('B,bool),bool)) x:'A)))))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%73:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%73:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (g:fun('A,fun('B,bool)) x:'A))))))))))))))))))
      #|INTER_INTERS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%74:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%74:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) s:fun('A,bool))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%75:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%75:fun('A,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool)))))))))))))))
      #|UNIONS_OVER_INTERS =  |- (#forall:fun(fun(fun('A,fun(fun('B,bool),bool)),bool),bool) (\f:fun('A,fun(fun('B,bool),bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%76:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%76:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) (f:fun('A,fun(fun('B,bool),bool)) x:'A))))))))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%77:fun('B,bool). (#?:fun(fun(fun('A,fun('B,bool)),bool),bool) (\g:fun('A,fun('B,bool)). (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%77:fun('B,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) (g:fun('A,fun('B,bool)) x:'A)) (f:fun('A,fun(fun('B,bool),bool)) x:'A)))))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%78:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%78:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (g:fun('A,fun('B,bool)) x:'A))))))))))))))))))
      #|UNIONS_EQ_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool))))))))
      #|EXISTS_UNIQUE_UNIONS_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#?!:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) s:fun('A,bool))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%79:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%79:fun('A,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) s:fun('A,bool)))))))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%80:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%80:fun('A,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) s:fun('A,bool)))))))))))
      #|IMAGE_INTERS_SUBSET =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\g:fun(fun('A,bool),bool). ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) g:fun(fun('A,bool),bool)))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) (#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B))) g:fun(fun('A,bool),bool))))))))
      #|IMAGE_INTER_SUBSET =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))
      #|IMAGE_INTER_SATURATED_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%81:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%81:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) x:'A)))))) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%82:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%82:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))) x:'A)))))) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|IMAGE_INTERS_SATURATED_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\g:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) g:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) g:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) g:fun(fun('A,bool),bool)) s:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%83:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%83:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))) x:'A)))))) t:fun('A,bool)))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) g:fun(fun('A,bool),bool)))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) (#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B))) g:fun(fun('A,bool),bool)))))))))))))
      #|IMAGE_INTER_SATURATED =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%84:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%84:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) x:'A)))))) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%85:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%85:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) x:'A)))))) t:fun('A,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))
      #|IMAGE_INTERS_SATURATED =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\g:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) g:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) g:fun(fun('A,bool),bool)) s:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%86:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%86:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) x:'A)))))) t:fun('A,bool))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) g:fun(fun('A,bool),bool)))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) (#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B))) g:fun(fun('A,bool),bool)))))))))))
      #|FINITE_INDUCT_STRONG =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))) (P:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|INJECTIVE_ON_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))
      #|INJECTIVE_ALT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|SURJECTIVE_ON_RIGHT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B))))))))))))
      #|INJECTIVE_ON_LEFT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))))))))
      #|BIJECTIVE_ON_LEFT_RIGHT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))))))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A))))))))))))))))
      #|SURJECTIVE_RIGHT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun('B,bool),bool) (\y:'B. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B))))))))
      #|INJECTIVE_LEFT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A))))))))
      #|BIJECTIVE_LEFT_RIGHT_INVERSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))))))) (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))))))
      #|FUNCTION_FACTORS_LEFT_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))) (#?:fun(fun(fun('C,'B),bool),bool) (\h:fun('C,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (h:fun('C,'B) (g:fun('A,'C) x:'A)))))))))))))))
      #|FUNCTION_FACTORS_LEFT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))) (#?:fun(fun(fun('C,'B),bool),bool) (\h:fun('C,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f:fun('A,'B)) ((#o:fun(fun('C,'B),fun(fun('A,'C),fun('A,'B))) h:fun('C,'B)) g:fun('A,'C))))))))))
      #|FUNCTION_FACTORS_RIGHT_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#?:fun(fun('B,bool),bool) (\y:'B. ((#=:fun('C,fun('C,bool)) (g:fun('B,'C) y:'B)) (f:fun('A,'C) x:'A)))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('C,fun('C,bool)) (f:fun('A,'C) x:'A)) (g:fun('B,'C) (h:fun('A,'B) x:'A)))))))))))))))
      #|FUNCTION_FACTORS_RIGHT =  |- (#forall:fun(fun(fun('A,'C),bool),bool) (\f:fun('A,'C). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((#=:fun('C,fun('C,bool)) (g:fun('B,'C) y:'B)) (f:fun('A,'C) x:'A))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) f:fun('A,'C)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) h:fun('A,'B))))))))))
      #|SURJECTIVE_FORALL_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))) (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('B,bool) (f:fun('A,'B) x:'A))))) (#forall:fun(fun('B,bool),bool) (\y:'B. (P:fun('B,bool) y:'B)))))))))
      #|SURJECTIVE_EXISTS_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))) (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('B,bool) (f:fun('A,'B) x:'A))))) (#?:fun(fun('B,bool),bool) (\y:'B. (P:fun('B,bool) y:'B)))))))))
      #|SURJECTIVE_IMAGE_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))) (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%87:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%87:'A) (P:fun('B,bool) (f:fun('A,'B) x:'A))) x:'A))))))) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%88:'B. (#?:fun(fun('B,bool),bool) (\x:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%88:'B) (P:fun('B,bool) x:'B)) x:'B)))))))))))
      #|IMAGE_INJECTIVE_IMAGE_OF_SUBSET =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|FINITE_EMPTY =  |- (#FINITE:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))
      #|FINITE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|FINITE_RESTRICT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%89:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%89:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|FINITE_UNION_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|FINITE_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))))))))
      #|FINITE_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|FINITE_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|FINITE_SING =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#FINITE:fun(fun('A,bool),bool) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))))
      #|FINITE_DELETE_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)))))))
      #|FINITE_DELETE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))))
      #|FINITE_FINITE_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))))))
      #|FINITE_IMAGE_EXPAND =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%90:'B. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%90:'B) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) y:'B) (f:fun('A,'B) x:'A)))))) y:'B)))))))))))
      #|FINITE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))
      #|FINITE_IMAGE_INJ_GENERAL =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#FINITE:fun(fun('B,bool),bool) A:fun('B,bool)))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%91:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%91:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) A:fun('B,bool)))) x:'A)))))))))))))
      #|FINITE_FINITE_PREIMAGE_GENERAL =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%92:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%92:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) x:'A))))))))))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%93:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%93:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))))))))))
      #|FINITE_FINITE_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%94:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%94:'A) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)) x:'A))))))))))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%95:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%95:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) x:'A)))))))))))
      #|FINITE_IMAGE_INJ_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|FINITE_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#FINITE:fun(fun('B,bool),bool) A:fun('B,bool)))) (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%96:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%96:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) A:fun('B,bool))) x:'A)))))))))))
      #|FINITE_IMAGE_GEN =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A)))))))))) (#FINITE:fun(fun('C,bool),bool) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) g:fun('A,'C)) s:fun('A,bool))))))))))))
      #|INFINITE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#INFINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))
      #|INFINITE_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))))))
      #|INFINITE_NONEMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))))
      #|INFINITE_DIFF_FINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) (#INFINITE:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) u:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) u:fun('A,bool))))))))))))))
      #|SUBSET_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) u:fun('A,bool)))))))))))))
      #|EXISTS_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|FORALL_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|EXISTS_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))))
      #|FORALL_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|EXISTS_FINITE_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))))
      #|FORALL_FINITE_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|EXISTS_FINITE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))))
      #|FORALL_FINITE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))
      #|FINITE_SUBSET_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))))))))))))))
      #|FINITE_SUBSET_IMAGE_IMP =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s':fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) s:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s':fun('A,bool))))))))))))))
      #|FINITE_IMAGE_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))
      #|FINITE_IMAGE_EQ_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))))))
      #|FINITE_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))
      #|INFINITE_SUPERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) (#INFINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))))
      #|FINITE_TRANSITIVITY_CHAIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) ((R:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((R:fun('A,fun('A,bool)) x:'A) y:'A))))))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))))
      #|UNIONS_MAXIMAL_SETS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%97:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%97:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) f:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool)))))))) t:fun('A,bool)))))))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))))
      #|FINITE_SUBSET_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f':fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) f':fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f':fun(fun('A,bool),bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f':fun(fun('A,bool),bool))))))))))))
      #|UNIONS_IN_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))))))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) f:fun(fun('A,bool),bool)))))
      #|INTERS_IN_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))))))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) f:fun(fun('A,bool),bool)))))
      #|FINITE_SUBSET_UNIONS_DIRECTED_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) f:fun(fun('A,bool),bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) v:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) v:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool)))))))))))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_SUBSET_UNIONS_CHAIN_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) t:fun('A,bool))))))))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_SUBSET_UNIONS_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) t:fun('A,bool)))))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|FINREC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a:'B) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun('B,fun('B,bool)) a:'B) b:'B)))) ((#=:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a:'B) (#SUC:fun(num,num) n:num))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\c:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) c:'B) n:num)) ((#=:fun('B,fun('B,bool)) a:'B) ((f:fun('A,fun('B,'B)) x:'A) c:'B))))))))))
      #|FINREC_1_LEMMA =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\a:'B. ((#=:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a:'B) (#SUC:fun(num,num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) a:'B) ((f:fun('A,fun('B,'B)) x:'A) b:'B))))))))))))))
      #|FINREC_SUC_LEMMA =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\z:'B. ((#==>:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) z:'B) (#SUC:fun(num,num) n:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun('B,bool),bool) (\w:'B. ((#/\:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) w:'B) n:num)) ((#=:fun('B,fun('B,bool)) z:'B) ((f:fun('A,fun('B,'B)) x:'A) w:'B))))))))))))))))))))
      #|FINREC_UNIQUE_LEMMA =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) (#forall:fun(fun(num,bool),bool) (\n1:num. (#forall:fun(fun(num,bool),bool) (\n2:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('B,bool),bool) (\a1:'B. (#forall:fun(fun('B,bool),bool) (\a2:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a1:'B) n1:num)) (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a2:'B) n2:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) a1:'B) a2:'B)) ((#=:fun(num,fun(num,bool)) n1:num) n2:num))))))))))))))))))
      #|FINREC_EXISTS_LEMMA =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun('B,bool),bool) (\a:'B. (#?:fun(fun(num,bool),bool) (\n:num. (((((#FINREC:fun(fun('A,fun('B,'B)),fun('B,fun(fun('A,bool),fun('B,fun(num,bool))))) f:fun('A,fun('B,'B))) b:'B) s:fun('A,bool)) a:'B) n:num))))))))))))
      #|FINREC_FUN_LEMMA =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,fun('C,bool))),bool),bool) (\R:fun('A,fun('B,fun('C,bool))). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) s:'A)) (#?:fun(fun('B,bool),bool) (\a:'B. (#?:fun(fun('C,bool),bool) (\n:'C. (((R:fun('A,fun('B,fun('C,bool))) s:'A) a:'B) n:'C))))))))) (#forall:fun(fun('C,bool),bool) (\n1:'C. (#forall:fun(fun('C,bool),bool) (\n2:'C. (#forall:fun(fun('A,bool),bool) (\s:'A. (#forall:fun(fun('B,bool),bool) (\a1:'B. (#forall:fun(fun('B,bool),bool) (\a2:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((R:fun('A,fun('B,fun('C,bool))) s:'A) a1:'B) n1:'C)) (((R:fun('A,fun('B,fun('C,bool))) s:'A) a2:'B) n2:'C))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) a1:'B) a2:'B)) ((#=:fun('C,fun('C,bool)) n1:'C) n2:'C))))))))))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\s:'A. (#forall:fun(fun('B,bool),bool) (\a:'B. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) s:'A)) ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('C,bool),bool) (\n:'C. (((R:fun('A,fun('B,fun('C,bool))) s:'A) a:'B) n:'C)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) s:'A)) a:'B))))))))))))))
      #|FINREC_FUN =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) (#?:fun(fun(fun(fun('A,bool),'B),bool),bool) (\g:fun(fun('A,bool),'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) #EMPTY:fun('A,bool))) b:'B)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) s:fun('A,bool))) ((f:fun('A,fun('B,'B)) x:'A) (g:fun(fun('A,bool),'B) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)))))))))))))))))
      #|SET_RECURSION_LEMMA =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) (#?:fun(fun(fun(fun('A,bool),'B),bool),bool) (\g:fun(fun('A,bool),'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) #EMPTY:fun('A,bool))) b:'B)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (g:fun(fun('A,bool),'B) s:fun('A,bool))) ((f:fun('A,fun('B,'B)) x:'A) (g:fun(fun('A,bool),'B) s:fun('A,bool))))))))))))))))))
      #|ITSET =  |- (#forall:fun(fun('B,bool),bool) (\b:'B. (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)) ((#@:fun(fun(fun(fun('A,bool),'B),bool),fun(fun('A,bool),'B)) (\g:fun(fun('A,bool),'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) #EMPTY:fun('A,bool))) b:'B)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (g:fun(fun('A,bool),'B) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (g:fun(fun('A,bool),'B) s:fun('A,bool))) ((f:fun('A,fun('B,'B)) x:'A) (g:fun(fun('A,bool),'B) s:fun('A,bool))))))))))))) s:fun('A,bool)))))))))
      #|FINITE_RECURSION =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) #EMPTY:fun('A,bool)) b:'B)) b:'B)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool))) b:'B)) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)) ((f:fun('A,fun('B,'B)) x:'A) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)))))))))))))))
      #|FINITE_RECURSION_DELETE =  |- (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) #EMPTY:fun('A,bool)) b:'B)) b:'B)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((f:fun('A,fun('B,'B)) x:'A) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) b:'B))) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A)) b:'B))))))))))))))
      #|ITSET_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\f:fun('A,fun('B,'B)). (#forall:fun(fun(fun('A,fun('B,'B)),bool),bool) (\g:fun('A,fun('B,'B)). (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun(fun('B,'B),fun(fun('B,'B),bool)) (f:fun('A,fun('B,'B)) x:'A)) (g:fun('A,fun('B,'B)) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((f:fun('A,fun('B,'B)) x:'A) ((f:fun('A,fun('B,'B)) y:'A) s:'B))) ((f:fun('A,fun('B,'B)) y:'A) ((f:fun('A,fun('B,'B)) x:'A) s:'B))))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('B,bool),bool) (\s:'B. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#=:fun('B,fun('B,bool)) ((g:fun('A,fun('B,'B)) x:'A) ((g:fun('A,fun('B,'B)) y:'A) s:'B))) ((g:fun('A,fun('B,'B)) y:'A) ((g:fun('A,fun('B,'B)) x:'A) s:'B)))))))))))))) ((#=:fun('B,fun('B,bool)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) f:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)) (((#ITSET:fun(fun('A,fun('B,'B)),fun(fun('A,bool),fun('B,'B))) g:fun('A,fun('B,'B))) s:fun('A,bool)) b:'B)))))))))))
      #|CARD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (((#ITSET:fun(fun('A,fun(num,num)),fun(fun('A,bool),fun(num,num))) (\x:'A. (\n:num. (#SUC:fun(num,num) n:num)))) s:fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|CARD_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) #EMPTY:fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#SUC:fun(num,num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))))
      #|CARD_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))))))))
      #|CARD_DELETE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#-:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))
      #|CARD_UNION_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('A,bool))))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) u:fun('A,bool))))))))))
      #|CARD_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#-:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))))))))
      #|CARD_EQ_0 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))))
      #|CARD_SING =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|CARD_LE_2 =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) b:'A) #EMPTY:fun('A,bool))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|CARD_LE_3 =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) b:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) c:'A) #EMPTY:fun('A,bool)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|CARD_LE_4 =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. (#forall:fun(fun('A,bool),bool) (\d:'A. ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) b:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) c:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) d:'A) #EMPTY:fun('A,bool))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|FINITE_INDUCT_DELETE =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) x:'A))) (P:fun(fun('A,bool),bool) s:fun('A,bool))))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) s:fun('A,bool))))))))
      #|HAS_SIZE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) n:num)))))))
      #|HAS_SIZE_CARD =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) n:num))))))
      #|HAS_SIZE_0 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))))
      #|HAS_SIZE_SUC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) (#SUC:fun(num,num) n:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) s:fun('A,bool)) a:'A)) n:num))))))))))
      #|HAS_SIZE_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|HAS_SIZE_DIFF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) ((#-:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|HAS_SIZE_UNIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) (t:fun('A,fun('B,bool)) x:'A)) n:num))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) ((#DISJOINT:fun(fun('B,bool),fun(fun('B,bool),bool)) (t:fun('A,fun('B,bool)) x:'A)) (t:fun('A,fun('B,bool)) y:'A)))))))))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%98:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%98:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (t:fun('A,fun('B,bool)) x:'A)))))))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|FINITE_HAS_SIZE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))
      #|HAS_SIZE_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) (#SUC:fun(num,num) n:num))) (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) t:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) t:fun('A,bool)))))))))))
      #|CARD_SUBSET_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) b:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('A,bool),num) b:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool)))))))
      #|CARD_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) b:fun('A,bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('A,bool),num) b:fun('A,bool))))))))
      #|CARD_SUBSET_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) b:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) b:fun('A,bool))) (#CARD:fun(fun('A,bool),num) a:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool)))))))
      #|SUBSET_CARD_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))))))))
      #|FINITE_CARD_LE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) n:num)))))))))
      #|CARD_PSUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) b:fun('A,bool)))) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('A,bool),num) b:fun('A,bool))))))))
      #|CARD_PSUBSET_IMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('A,bool),num) b:fun('A,bool)))))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool)))))))
      #|CARD_PSUBSET_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) b:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) b:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) a:fun('A,bool))) (#CARD:fun(fun('A,bool),num) b:fun('A,bool)))))))))
      #|CARD_UNION_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))))))))
      #|FINITE_CARD_LE_UNION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) m:num))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|CARD_UNIONS_LE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) x:'A))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) (t:fun('A,fun('B,bool)) x:'A))) n:num))))))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%99:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%99:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (t:fun('A,fun('B,bool)) x:'A))))))))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|CARD_UNION_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|CARD_UNION_OVERLAP_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))))))))
      #|CARD_UNION_OVERLAP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#+:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) #EMPTY:fun('A,bool))))))))
      #|CARD_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))
      #|HAS_SIZE_IMAGE_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) n:num))))))))
      #|CARD_IMAGE_LE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))
      #|FINITE_CARD_LE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) n:num))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) n:num)))))))))
      #|CARD_IMAGE_INJ_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))))
      #|CARD_SUBSET_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) s:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) s:fun('B,bool))) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))))))))))
      #|HAS_SIZE_IMAGE_INJ_EQ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) n:num)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)))))))))
      #|CARD_IMAGE_EQ_INJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))
      #|EXISTS_SMALL_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))))))))
      #|FORALL_SMALL_SUBSET_IMAGE_INJ =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) n:num)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))))
      #|EXISTS_SMALL_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))))))
      #|FORALL_SMALL_SUBSET_IMAGE =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\P:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) n:num)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))))) (P:fun(fun('B,bool),bool) t:fun('B,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))))) (P:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))))))))))))
      #|CARD_IMAGE_LE2 =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))))))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#CARD:fun(fun('C,bool),num) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) g:fun('A,'C)) s:fun('A,bool)))))))))))
      #|CARD_IMAGE_LT2 =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'C),bool),bool) (\g:fun('A,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))) (#~:fun(bool,bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('C,fun('C,bool)) (g:fun('A,'C) x:'A)) (g:fun('A,'C) y:'A))))))))))) ((#<:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) (#CARD:fun(fun('C,bool),num) ((#IMAGE:fun(fun('A,'C),fun(fun('A,bool),fun('C,bool))) g:fun('A,'C)) s:fun('A,bool)))))))))))
      #|CHOOSE_SUBSET_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) n:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num)))))))))
      #|CHOOSE_SUBSET_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) n:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num)))))))))
      #|CHOOSE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num))))))))))
      #|CHOOSE_SUBSET_BETWEEN =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) n:num)) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) u:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) n:num) (#CARD:fun(fun('A,bool),num) u:fun('A,bool)))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num))))))))))))
      #|CARD_LE_UNIONS_CHAIN =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) t:fun('A,bool))) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) n:num)))))))
      #|CARD_LE_1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool))))))))
      #|INVOLUTION_EVEN_NOFIXPOINTS =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('A,'A) x:'A)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) x:'A))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) x:'A))) x:'A)))))))) (#EVEN:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))
      #|INVOLUTION_EVEN_FIXPOINTS =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('A,'A) x:'A)) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) x:'A))) x:'A))))))) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) (#CARD:fun(fun('A,bool),num) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%100:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%100:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) x:'A))) x:'A)))))))) (#EVEN:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))
      #|HAS_SIZE_PRODUCT_DEPENDENT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) (t:fun('A,fun('B,bool)) x:'A)) n:num)))))) ((#HAS_SIZE:fun(fun(prod('A,'B),bool),fun(num,bool)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%101:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%101:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) (t:fun('A,fun('B,bool)) x:'A)))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|FINITE_PRODUCT_DEPENDENT =  |- (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\f:fun('A,fun('B,'C)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) x:'A))))))) (#FINITE:fun(fun('C,bool),bool) (#GSPEC:fun(fun('C,bool),fun('C,bool)) (\GEN%PVAR%102:'C. (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun('C,fun(bool,fun('C,bool))) GEN%PVAR%102:'C) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) (t:fun('A,fun('B,bool)) x:'A)))) ((f:fun('A,fun('B,'C)) x:'A) y:'B))))))))))))))))
      #|FINITE_PRODUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#FINITE:fun(fun(prod('A,'B),bool),bool) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%103:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%103:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))))))))
      #|CARD_PRODUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(prod('A,'B),bool),num) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%104:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%104:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)))))))))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|HAS_SIZE_PRODUCT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num))) ((#HAS_SIZE:fun(fun(prod('A,'B),bool),fun(num,bool)) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%105:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%105:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%106:prod('A,'B). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%106:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)))))))))))))
      #|IN_CROSS =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))))))))))))
      #|HAS_SIZE_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num))) ((#HAS_SIZE:fun(fun(prod('A,'B),bool),fun(num,bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|FINITE_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#FINITE:fun(fun(prod('A,'B),bool),bool) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))
      #|CARD_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(prod('A,'B),bool),num) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#*:fun(num,fun(num,num)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))))))
      #|CROSS_EQ_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) #EMPTY:fun(prod('A,'B),bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))))))))
      #|CROSS_EMPTY =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(prod('A,'?1),bool),fun(fun(prod('A,'?1),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('?1,bool),fun(prod('A,'?1),bool))) s:fun('A,bool)) #EMPTY:fun('?1,bool))) #EMPTY:fun(prod('A,'?1),bool))))) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(prod('?2,'B),bool),fun(fun(prod('?2,'B),bool),bool)) ((#CROSS:fun(fun('?2,bool),fun(fun('B,bool),fun(prod('?2,'B),bool))) #EMPTY:fun('?2,bool)) t:fun('B,bool))) #EMPTY:fun(prod('?2,'B),bool)))))
      #|CROSS_SING =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))) ((#INSERT:fun('B,fun(fun('B,bool),fun('B,bool))) y:'B) #EMPTY:fun('B,bool)))) ((#INSERT:fun(prod('A,'B),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)) #EMPTY:fun(prod('A,'B),bool)))))))
      #|CROSS_UNIV =  |- ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) #UNIV:fun('A,bool)) #UNIV:fun('B,bool))) #UNIV:fun(prod('A,'B),bool))
      #|FINITE_CROSS_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod('A,'B),bool),bool) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))))))))))
      #|INFINITE_CROSS_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(prod('A,'B),bool),bool) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) (#INFINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))))))))))
      #|FINITE_CROSS_UNIV =  |- ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod('A,'B),bool),bool) #UNIV:fun(prod('A,'B),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) #UNIV:fun('B,bool))))
      #|INFINITE_CROSS_UNIV =  |- ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(prod('A,'B),bool),bool) #UNIV:fun(prod('A,'B),bool))) ((#\/:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) (#INFINITE:fun(fun('B,bool),bool) #UNIV:fun('B,bool))))
      #|FINITE_UNIV_PAIR =  |- ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod('A,'A),bool),bool) #UNIV:fun(prod('A,'A),bool))) (#FINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool)))
      #|INFINITE_UNIV_PAIR =  |- ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(prod('A,'A),bool),bool) #UNIV:fun(prod('A,'A),bool))) (#INFINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool)))
      #|FORALL_IN_CROSS =  |- (#forall:fun(fun(fun(prod('A,'B),bool),bool),bool) (\P:fun(prod('A,'B),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(prod('A,'B),bool),bool) (\z:prod('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) z:prod('A,'B)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) (P:fun(prod('A,'B),bool) z:prod('A,'B)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool)))) (P:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B))))))))))))))
      #|EXISTS_IN_CROSS =  |- (#forall:fun(fun(fun(prod('A,'B),bool),bool),bool) (\P:fun(prod('A,'B),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(prod('A,'B),bool),bool) (\z:prod('A,'B). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(prod('A,'B),fun(fun(prod('A,'B),bool),bool)) z:prod('A,'B)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) (P:fun(prod('A,'B),bool) z:prod('A,'B)))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (P:fun(prod('A,'B),bool) ((#,:fun('A,fun('B,prod('A,'B))) x:'A) y:'B)))))))))))))))
      #|SUBSET_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s':fun('A,bool)) t':fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool))))))))))))))
      #|CROSS_MONO =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool)))) ((#SUBSET:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s':fun('A,bool)) t':fun('B,bool))))))))))))
      #|CROSS_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s':fun('A,bool)) t':fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s':fun('A,bool)) #EMPTY:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) #EMPTY:fun('B,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool)))))))))))))
      #|IMAGE_FST_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(prod('A,'B),'A),fun(fun(prod('A,'B),bool),fun('A,bool))) #FST:fun(prod('A,'B),'A)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) #EMPTY:fun('B,bool))) #EMPTY:fun('A,bool)) s:fun('A,bool)))))))
      #|IMAGE_SND_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun(prod('A,'B),'B),fun(fun(prod('A,'B),bool),fun('B,bool))) #SND:fun(prod('A,'B),'B)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))) (((#COND:fun(bool,fun(fun('B,bool),fun(fun('B,bool),fun('B,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) #EMPTY:fun('B,bool)) t:fun('B,bool)))))))
      #|IMAGE_PAIRED_CROSS =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('C,'D),bool),bool) (\g:fun('C,'D). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('C,bool),bool),bool) (\t:fun('C,bool). ((#=:fun(fun(prod('B,'D),bool),fun(fun(prod('B,'D),bool),bool)) ((#IMAGE:fun(fun(prod('A,'C),prod('B,'D)),fun(fun(prod('A,'C),bool),fun(prod('B,'D),bool))) (#GABS:fun(fun(fun(prod('A,'C),prod('B,'D)),bool),fun(prod('A,'C),prod('B,'D))) (\f:fun(prod('A,'C),prod('B,'D)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('C,bool),bool) (\y:'C. ((#GEQ:fun(prod('B,'D),fun(prod('B,'D),bool)) (f:fun(prod('A,'C),prod('B,'D)) ((#,:fun('A,fun('C,prod('A,'C))) x:'A) y:'C))) ((#,:fun('B,fun('D,prod('B,'D))) (f:fun('A,'B) x:'A)) (g:fun('C,'D) y:'C)))))))))) ((#CROSS:fun(fun('A,bool),fun(fun('C,bool),fun(prod('A,'C),bool))) s:fun('A,bool)) t:fun('C,bool)))) ((#CROSS:fun(fun('B,bool),fun(fun('D,bool),fun(prod('B,'D),bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('C,'D),fun(fun('C,bool),fun('D,bool))) g:fun('C,'D)) t:fun('C,bool))))))))))))
      #|CROSS_INTER =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) u:fun('B,bool)))) ((#INTER:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('B,bool))) ((#INTER:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) t:fun('A,bool)) u:fun('B,bool)))))))))))
      #|CROSS_UNION =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) ((#UNION:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) u:fun('B,bool)))) ((#UNION:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('B,bool))) ((#UNION:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) t:fun('A,bool)) u:fun('B,bool)))))))))))
      #|CROSS_DIFF =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) u:fun('B,bool)))) ((#DIFF:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))) u:fun('B,bool))) ((#DIFF:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) u:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) t:fun('A,bool)) u:fun('B,bool)))))))))))
      #|INTER_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#INTER:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s':fun('A,bool)) t':fun('B,bool)))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) s':fun('A,bool))) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) t:fun('B,bool)) t':fun('B,bool))))))))))))
      #|CROSS_UNIONS_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\g:fun(fun('B,bool),bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) g:fun(fun('B,bool),bool)))) (#UNIONS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%107:fun(prod('A,'B),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%107:fun(prod('A,'B),bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) t:fun('B,bool)) g:fun(fun('B,bool),bool)))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))))))))))))))
      #|CROSS_UNIONS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#=:fun(fun(prod('A,'A),bool),fun(fun(prod('A,'A),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun(prod('A,'A),bool),bool),fun(prod('A,'A),bool)) (#GSPEC:fun(fun(fun(prod('A,'A),bool),bool),fun(fun(prod('A,'A),bool),bool)) (\GEN%PVAR%108:fun(prod('A,'A),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun(prod('A,'A),bool),fun(bool,fun(fun(prod('A,'A),bool),bool))) GEN%PVAR%108:fun(prod('A,'A),bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) t:fun('B,bool))) (#UNIONS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%109:fun(prod('A,'B),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%109:fun(prod('A,'B),bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))))))))))))))
      #|CROSS_INTERS_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\g:fun(fun('B,bool),bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('B,bool),bool),fun('B,bool)) g:fun(fun('B,bool),bool)))) (((#COND:fun(bool,fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%110:fun(prod('A,'B),bool). (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%110:fun(prod('A,'B),bool)) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) t:fun('B,bool)) g:fun(fun('B,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) #UNIV:fun('A,bool)) t:fun('B,bool))))))))) (((#COND:fun(bool,fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)))) ((#=:fun(fun(fun('B,bool),bool),fun(fun(fun('B,bool),bool),bool)) g:fun(fun('B,bool),bool)) #EMPTY:fun(fun('B,bool),bool))) (#INTERS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%111:fun(prod('A,'B),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%111:fun(prod('A,'B),bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) #UNIV:fun('B,bool))))))))) (#INTERS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%112:fun(prod('A,'B),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%112:fun(prod('A,'B),bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) t:fun('B,bool)) g:fun(fun('B,bool),bool)))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))))))))))))))))
      #|CROSS_INTERS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). ((#=:fun(fun(prod('A,'A),bool),fun(fun(prod('A,'A),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool)))) (((#COND:fun(bool,fun(fun(prod('A,'A),bool),fun(fun(prod('A,'A),bool),fun(prod('A,'A),bool)))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) #UNIV:fun('A,bool))) (#INTERS:fun(fun(fun(prod('A,'A),bool),bool),fun(prod('A,'A),bool)) (#GSPEC:fun(fun(fun(prod('A,'A),bool),bool),fun(fun(prod('A,'A),bool),bool)) (\GEN%PVAR%113:fun(prod('A,'A),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun(prod('A,'A),bool),fun(bool,fun(fun(prod('A,'A),bool),bool))) GEN%PVAR%113:fun(prod('A,'A),bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('A,bool),fun(prod('A,'A),bool))) s:fun('A,bool)) t:fun('A,bool))))))))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\f:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) f:fun(fun('A,bool),bool))) t:fun('B,bool))) (((#COND:fun(bool,fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) f:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) #UNIV:fun('A,bool)) t:fun('B,bool))) (#INTERS:fun(fun(fun(prod('A,'B),bool),bool),fun(prod('A,'B),bool)) (#GSPEC:fun(fun(fun(prod('A,'B),bool),bool),fun(fun(prod('A,'B),bool),bool)) (\GEN%PVAR%114:fun(prod('A,'B),bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun(prod('A,'B),bool),fun(bool,fun(fun(prod('A,'B),bool),bool))) GEN%PVAR%114:fun(prod('A,'B),bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) f:fun(fun('A,bool),bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool)))))))))))))))
      #|DISJOINT_CROSS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s':fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun(prod('A,'B),bool),fun(fun(prod('A,'B),bool),bool)) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s:fun('A,bool)) t:fun('B,bool))) ((#CROSS:fun(fun('A,bool),fun(fun('B,bool),fun(prod('A,'B),bool))) s':fun('A,bool)) t':fun('B,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) s':fun('A,bool))) ((#DISJOINT:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool))))))))))))
      #|ARB =  |- ((#=:fun('A,fun('A,bool)) #ARB:'A) (#@:fun(fun('A,bool),'A) (\x:'A. #F:bool)))
      #|EXTENSIONAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool))) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%115:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%115:fun('A,'B)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) #ARB:'B))))) f:fun('A,'B)))))))))
      #|IN_EXTENSIONAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) f:fun('A,'B)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) #ARB:'B)))))))))
      #|IN_EXTENSIONAL_UNDEFINED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) f:fun('A,'B)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)))) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) #ARB:'B))))))))
      #|EXTENSIONAL_EMPTY =  |- ((#=:fun(fun(fun('A,'B),bool),fun(fun(fun('A,'B),bool),bool)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) #EMPTY:fun('A,bool))) ((#INSERT:fun(fun('A,'B),fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool))) (\x:'A. #ARB:'B)) #EMPTY:fun(fun('A,'B),bool)))
      #|EXTENSIONAL_UNIV =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) #UNIV:fun('A,bool)) f:fun('A,'B))))
      #|EXTENSIONAL_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) f:fun('A,'B)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) g:fun('A,'B)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f:fun('A,'B)) g:fun('A,'B)))))))))
      #|RESTRICTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)) x:'A)) (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (f:fun('A,'B) x:'A)) #ARB:'B))))))))
      #|RESTRICTION_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (f:fun('A,'B) x:'A)) #ARB:'B)))))))
      #|RESTRICTION_DEFINED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)) x:'A)) (f:fun('A,'B) x:'A)))))))))
      #|RESTRICTION_UNDEFINED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)) x:'A)) #ARB:'B))))))))
      #|RESTRICTION_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))) ((#=:fun('B,fun('B,bool)) (((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)) x:'A)) y:'B))))))))))
      #|RESTRICTION_IN_EXTENSIONAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)))))))
      #|RESTRICTION_EXTENSION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) g:fun('A,'B)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))))))))))
      #|RESTRICTION_FIXPOINT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))) f:fun('A,'B))) ((#IN:fun(fun('A,'B),fun(fun(fun('A,'B),bool),bool)) f:fun('A,'B)) (#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool))))))))
      #|RESTRICTION_UNIV =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) #UNIV:fun('A,bool)) f:fun('A,'B))) f:fun('A,'B))))
      #|RESTRICTION_RESTRICTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) t:fun('A,bool)) f:fun('A,'B)))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))))))))))
      #|RESTRICTION_IDEMP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B)))))))
      #|IMAGE_RESTRICTION =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) t:fun('A,bool)) f:fun('A,'B))) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))))
      #|RESTRICTION_COMPOSE_RIGHT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))))))))))
      #|RESTRICTION_COMPOSE_LEFT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) ((#RESTRICTION:fun(fun('B,bool),fun(fun('B,'C),fun('B,'C))) t:fun('B,bool)) g:fun('B,'C))) f:fun('A,'B)))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B)))))))))))))
      #|RESTRICTION_COMPOSE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) ((#RESTRICTION:fun(fun('B,bool),fun(fun('B,'C),fun('B,'C))) t:fun('B,bool)) g:fun('B,'C))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))))) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'C),fun('A,'C))) s:fun('A,bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B)))))))))))))
      #|RESTRICTION_UNIQUE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) f:fun('A,'B))) g:fun('A,'B))) ((#/\:fun(bool,fun(bool,bool)) ((#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)) g:fun('A,'B))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))))))))
      #|RESTRICTION_UNIQUE_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f:fun('A,'B)) ((#RESTRICTION:fun(fun('A,bool),fun(fun('A,'B),fun('A,'B))) s:fun('A,bool)) g:fun('A,'B)))) ((#/\:fun(bool,fun(bool,bool)) ((#EXTENSIONAL:fun(fun('A,bool),fun(fun('A,'B),bool)) s:fun('A,bool)) f:fun('A,'B))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))))))))
      #|cartesian_product =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) (#GSPEC:fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool)) (\GEN%PVAR%116:fun('K,'A). (#?:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (((#SETSPEC:fun(fun('K,'A),fun(bool,fun(fun('K,'A),bool))) GEN%PVAR%116:fun('K,'A)) ((#/\:fun(bool,fun(bool,bool)) ((#EXTENSIONAL:fun(fun('K,bool),fun(fun('K,'A),bool)) k:fun('K,bool)) f:fun('K,'A))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) (s:fun('K,fun('A,bool)) i:'K))))))) f:fun('K,'A)))))))))))
      #|IN_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) x:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#EXTENSIONAL:fun(fun('K,bool),fun(fun('K,'A),bool)) k:fun('K,bool)) x:fun('K,'A))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (x:fun('K,'A) i:'K)) (s:fun('K,fun('A,bool)) i:'K)))))))))))))
      #|CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) (#GSPEC:fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool)) (\GEN%PVAR%117:fun('K,'A). (#?:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (((#SETSPEC:fun(fun('K,'A),fun(bool,fun(fun('K,'A),bool))) GEN%PVAR%117:fun('K,'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (s:fun('K,fun('A,bool)) i:'K)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) #ARB:'A) #EMPTY:fun('A,bool))))))) f:fun('K,'A)))))))))))
      #|RESTRICTION_IN_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'A),fun('K,'A))) k:fun('K,bool)) f:fun('K,'A))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) (s:fun('K,fun('A,bool)) i:'K))))))))))))
      #|CARTESIAN_PRODUCT_AS_RESTRICTIONS =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) (#GSPEC:fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool)) (\GEN%PVAR%118:fun('K,'A). (#?:fun(fun(fun('K,'A),bool),bool) (\f:fun('K,'A). (((#SETSPEC:fun(fun('K,'A),fun(bool,fun(fun('K,'A),bool))) GEN%PVAR%118:fun('K,'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun('K,'A) i:'K)) (s:fun('K,fun('A,bool)) i:'K)))))) ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'A),fun('K,'A))) k:fun('K,bool)) f:fun('K,'A))))))))))))
      #|CARTESIAN_PRODUCT_EQ_EMPTY =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) #EMPTY:fun('A,bool))))))))))
      #|CARTESIAN_PRODUCT_EMPTY =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) #EMPTY:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#INSERT:fun(fun('K,'A),fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool))) (\i:'K. #ARB:'A)) #EMPTY:fun(fun('K,'A),bool)))))
      #|CARTESIAN_PRODUCT_EQ_MEMBERS =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). (#forall:fun(fun(fun('K,'A),bool),bool) (\y:fun('K,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) x:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) y:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun('A,fun('A,bool)) (x:fun('K,'A) i:'K)) (y:fun('K,'A) i:'K)))))))) ((#=:fun(fun('K,'A),fun(fun('K,'A),bool)) x:fun('K,'A)) y:fun('K,'A)))))))))))
      #|CARTESIAN_PRODUCT_EQ_MEMBERS_EQ =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). (#forall:fun(fun(fun('K,'A),bool),bool) (\y:fun('K,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) x:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) y:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('K,'A),fun(fun('K,'A),bool)) x:fun('K,'A)) y:fun('K,'A))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun('A,fun('A,bool)) (x:fun('K,'A) i:'K)) (y:fun('K,'A) i:'K)))))))))))))))
      #|SUBSET_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K)))))))))))))
      #|CARTESIAN_PRODUCT_EQ =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool)))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K)))))))))))))
      #|INTER_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#INTER:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) (\i:'K. ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K)))))))))))
      #|CARTESIAN_PRODUCT_UNIV =  |- ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) #UNIV:fun('K,bool)) (\i:'K. #UNIV:fun('A,bool)))) #UNIV:fun(fun('K,'A),bool))
      #|CARTESIAN_PRODUCT_SINGS =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). ((#==>:fun(bool,fun(bool,bool)) ((#EXTENSIONAL:fun(fun('K,bool),fun(fun('K,'A),bool)) k:fun('K,bool)) x:fun('K,'A))) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) (\i:'K. ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) (x:fun('K,'A) i:'K)) #EMPTY:fun('A,bool))))) ((#INSERT:fun(fun('K,'A),fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool))) x:fun('K,'A)) #EMPTY:fun(fun('K,'A),bool))))))))
      #|CARTESIAN_PRODUCT_SINGS_GEN =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) (\i:'K. ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) (x:fun('K,'A) i:'K)) #EMPTY:fun('A,bool))))) ((#INSERT:fun(fun('K,'A),fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool))) ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'A),fun('K,'A))) k:fun('K,bool)) x:fun('K,'A))) #EMPTY:fun(fun('K,'A),bool)))))))
      #|IMAGE_PROJECTION_CARTESIAN_PRODUCT =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(fun('K,'A),'A),fun(fun(fun('K,'A),bool),fun('A,bool))) (\x:fun('K,'A). (x:fun('K,'A) i:'K))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) #EMPTY:fun('A,bool)) (((#COND:fun(bool,fun(fun('A,bool),fun(fun('A,bool),fun('A,bool)))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (s:fun('K,fun('A,bool)) i:'K)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) #ARB:'A) #EMPTY:fun('A,bool)))))))))))
      #|FORALL_CARTESIAN_PRODUCT_ELEMENTS =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\P:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('K,'A),bool),bool) (\z:fun('K,'A). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) z:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool)))) ((P:fun('K,fun('A,bool)) i:'K) (z:fun('K,'A) i:'K)))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool))) (#forall:fun(fun('K,bool),bool) (\i:'K. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (s:fun('K,fun('A,bool)) i:'K)))) ((P:fun('K,fun('A,bool)) i:'K) x:'A))))))))))))))
      #|FORALL_CARTESIAN_PRODUCT_ELEMENTS_EQ =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\P:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(fun('K,'A),bool)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('K,bool),bool) (\i:'K. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (s:fun('K,fun('A,bool)) i:'K)))) ((P:fun('K,fun('A,bool)) i:'K) x:'A))))))) (#forall:fun(fun(fun('K,'A),bool),bool) (\z:fun('K,'A). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) z:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool)))) ((P:fun('K,fun('A,bool)) i:'K) (z:fun('K,'A) i:'K)))))))))))))))
      #|EXISTS_CARTESIAN_PRODUCT_ELEMENT =  |- (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\P:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('K,'A),bool),bool) (\z:fun('K,'A). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('K,'A),fun(fun(fun('K,'A),bool),bool)) z:fun('K,'A)) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((P:fun('K,fun('A,bool)) i:'K) (z:fun('K,'A) i:'K))))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (s:fun('K,fun('A,bool)) i:'K))) ((P:fun('K,fun('A,bool)) i:'K) x:'A))))))))))))))
      #|product_map =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,'B)),bool),bool) (\f:fun('K,fun('A,'B)). ((#=:fun(fun(fun('K,'A),fun('K,'B)),fun(fun(fun('K,'A),fun('K,'B)),bool)) ((#product_map:fun(fun('K,bool),fun(fun('K,fun('A,'B)),fun(fun('K,'A),fun('K,'B)))) k:fun('K,bool)) f:fun('K,fun('A,'B)))) (\x:fun('K,'A). ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'B),fun('K,'B))) k:fun('K,bool)) (\i:'K. ((f:fun('K,fun('A,'B)) i:'K) (x:fun('K,'A) i:'K))))))))))
      #|PRODUCT_MAP_RESTRICTION =  |- (#forall:fun(fun(fun('K,fun('A,'B)),bool),bool) (\f:fun('K,fun('A,'B)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). ((#=:fun(fun('K,'B),fun(fun('K,'B),bool)) (((#product_map:fun(fun('K,bool),fun(fun('K,fun('A,'B)),fun(fun('K,'A),fun('K,'B)))) k:fun('K,bool)) f:fun('K,fun('A,'B))) ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'A),fun('K,'A))) k:fun('K,bool)) x:fun('K,'A)))) ((#RESTRICTION:fun(fun('K,bool),fun(fun('K,'B),fun('K,'B))) k:fun('K,bool)) (\i:'K. ((f:fun('K,fun('A,'B)) i:'K) (x:fun('K,'A) i:'K)))))))))))
      #|IMAGE_PRODUCT_MAP =  |- (#forall:fun(fun(fun('K,fun('A,'B)),bool),bool) (\f:fun('K,fun('A,'B)). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(fun('K,'B),bool),fun(fun(fun('K,'B),bool),bool)) ((#IMAGE:fun(fun(fun('K,'A),fun('K,'B)),fun(fun(fun('K,'A),bool),fun(fun('K,'B),bool))) ((#product_map:fun(fun('K,bool),fun(fun('K,fun('A,'B)),fun(fun('K,'A),fun('K,'B)))) k:fun('K,bool)) f:fun('K,fun('A,'B)))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(fun('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) ((#cartesian_product:fun(fun('K,bool),fun(fun('K,fun('B,bool)),fun(fun('K,'B),bool))) k:fun('K,bool)) (\i:'K. ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) (f:fun('K,fun('A,'B)) i:'K)) (s:fun('K,fun('A,bool)) i:'K)))))))))))
      #|disjoint_union =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) (#GSPEC:fun(fun(prod('K,'A),bool),fun(prod('K,'A),bool)) (\GEN%PVAR%119:prod('K,'A). (#?:fun(fun('K,bool),bool) (\i:'K. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(prod('K,'A),fun(bool,fun(prod('K,'A),bool))) GEN%PVAR%119:prod('K,'A)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (s:fun('K,fun('A,bool)) i:'K)))) ((#,:fun('K,fun('A,prod('K,'A))) i:'K) x:'A)))))))))))))
      #|SUBSET_DISJOINT_UNION =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K))))))))))))
      #|DISJOINT_UNION_EQ =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K))))))))))))
      #|SUBSET_DISJOINT_UNION_EXISTS =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun(prod('K,'A),bool),bool),bool) (\u:fun(prod('K,'A),bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) u:fun(prod('K,'A),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool))))) (#?:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) u:fun(prod('K,'A),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (t:fun('K,fun('A,bool)) i:'K)) (s:fun('K,fun('A,bool)) i:'K)))))))))))))))
      #|INTER_DISJOINT_UNION =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#INTER:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),fun(prod('K,'A),bool))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) (\i:'K. ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K)))))))))))
      #|UNION_DISJOINT_UNION =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#UNION:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),fun(prod('K,'A),bool))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) (\i:'K. ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K)))))))))))
      #|DISJOINT_UNION_EQ_EMPTY =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) #EMPTY:fun(prod('K,'A),bool))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) #EMPTY:fun('A,bool))))))))))
      #|DISJOINT_DISJOINT_UNION =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\s:fun('K,fun('A,bool)). (#forall:fun(fun(fun('K,fun('A,bool)),bool),bool) (\t:fun('K,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#DISJOINT:fun(fun(prod('K,'A),bool),fun(fun(prod('K,'A),bool),bool)) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) s:fun('K,fun('A,bool)))) ((#disjoint_union:fun(fun('K,bool),fun(fun('K,fun('A,bool)),fun(prod('K,'A),bool))) k:fun('K,bool)) t:fun('K,fun('A,bool))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool)) (s:fun('K,fun('A,bool)) i:'K)) (t:fun('K,fun('A,bool)) i:'K))))))))))))
      #|HAS_SIZE_FUNSPACE =  |- (#forall:fun(fun('B,bool),bool) (\d:'B. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) m:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num))) ((#HAS_SIZE:fun(fun(fun('A,'B),bool),fun(num,bool)) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%120:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%120:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) d:'B)))))) f:fun('A,'B))))))) ((#EXP:fun(num,fun(num,num)) n:num) m:num)))))))))))))
      #|CARD_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(fun('A,'B),bool),num) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%121:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%121:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) d:'B)))))) f:fun('A,'B)))))))) ((#EXP:fun(num,fun(num,num)) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))
      #|FINITE_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#FINITE:fun(fun(fun('A,'B),bool),bool) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%122:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%122:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) d:'B)))))) f:fun('A,'B))))))))))))
      #|HAS_SIZE_FUNSPACE_UNIV =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) #UNIV:fun('A,bool)) m:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) #UNIV:fun('B,bool)) n:num))) ((#HAS_SIZE:fun(fun(fun('A,'B),bool),fun(num,bool)) #UNIV:fun(fun('A,'B),bool)) ((#EXP:fun(num,fun(num,num)) n:num) m:num)))))))
      #|CARD_FUNSPACE_UNIV =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) #UNIV:fun('B,bool)))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(fun('A,'B),bool),num) #UNIV:fun(fun('A,'B),bool))) ((#EXP:fun(num,fun(num,num)) (#CARD:fun(fun('B,bool),num) #UNIV:fun('B,bool))) (#CARD:fun(fun('A,bool),num) #UNIV:fun('A,bool)))))
      #|FINITE_FUNSPACE_UNIV =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) #UNIV:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) #UNIV:fun('B,bool)))) (#FINITE:fun(fun(fun('A,'B),bool),bool) #UNIV:fun(fun('A,'B),bool)))
      #|HAS_SIZE_BOOL =  |- ((#HAS_SIZE:fun(fun(bool,bool),fun(num,bool)) #UNIV:fun(bool,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|CARD_BOOL =  |- ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(bool,bool),num) #UNIV:fun(bool,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|FINITE_BOOL =  |- (#FINITE:fun(fun(bool,bool),bool) #UNIV:fun(bool,bool))
      #|HAS_SIZE_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) ((#HAS_SIZE:fun(fun(fun('A,bool),bool),fun(num,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%123:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%123:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool))))))) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))))))
      #|CARD_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(fun('A,bool),bool),num) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%124:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%124:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool)))))))) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))
      #|FINITE_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun(fun('A,bool),bool),bool) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%125:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%125:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool))))))))))
      #|FINITE_POWERSET_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%126:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%126:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) t:fun('A,bool)))))))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool)))))
      #|FINITE_RESTRICTED_SUBSETS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun(fun('A,bool),bool),bool) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%127:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%127:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) t:fun('A,bool))))))))))))
      #|FINITE_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool)))))))))
      #|FINITE_CARD_LE_UNIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\t:fun('A,fun('B,bool)). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) (t:fun('A,fun('B,bool)) x:'A))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) (t:fun('A,fun('B,bool)) x:'A))) n:num)))))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) m:num)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%128:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%128:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (t:fun('A,fun('B,bool)) x:'A))))))))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('B,bool),num) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) (#GSPEC:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) (\GEN%PVAR%129:fun('B,bool). (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun(fun('B,bool),fun(bool,fun(fun('B,bool),bool))) GEN%PVAR%129:fun('B,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (t:fun('A,fun('B,bool)) x:'A))))))))) ((#*:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|POWERSET_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%130:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%130:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))) s:fun('A,bool))))))) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%131:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%131:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) t:fun('A,bool)))) s:fun('A,bool))))))) ((#UNION:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%132:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%132:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool))))))) ((#IMAGE:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (\s:fun('A,bool). ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%133:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%133:fun('A,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) s:fun('A,bool))))))))))))))
      #|FINITE_IMAGE_INFINITE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#INFINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%134:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%134:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) a:'A)))) x:'A))))))))))))))
      #|FINITE_RESTRICTED_POWERSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%135:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%135:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) t:fun('A,bool)) n:num))) t:fun('A,bool)))))))) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FINITE_RESTRICTED_FUNSPACE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\k:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) (#FINITE:fun(fun(fun('A,'B),bool),bool) (#GSPEC:fun(fun(fun('A,'B),bool),fun(fun('A,'B),bool)) (\GEN%PVAR%136:fun('A,'B). (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (((#SETSPEC:fun(fun('A,'B),fun(bool,fun(fun('A,'B),bool))) GEN%PVAR%136:fun('A,'B)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%137:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%137:'A) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (k:fun('A,'B) x:'A)))) x:'A)))))) s:fun('A,bool)))) f:fun('A,'B))))))))))))))
      #|NUMSEG_CLAUSES_LT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%138:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%138:num) ((#<:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) #EMPTY:fun(num,bool))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%139:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%139:num) ((#<:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) k:num) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%140:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%140:num) ((#<:fun(num,fun(num,bool)) i:num) k:num)) i:num))))))))))
      #|HAS_SIZE_NUMSEG_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#HAS_SIZE:fun(fun(num,bool),fun(num,bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%141:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%141:num) ((#<:fun(num,fun(num,bool)) m:num) n:num)) m:num)))))) n:num)))
      #|CARD_NUMSEG_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(num,bool),num) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%142:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%142:num) ((#<:fun(num,fun(num,bool)) m:num) n:num)) m:num))))))) n:num)))
      #|FINITE_NUMSEG_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%143:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%143:num) ((#<:fun(num,fun(num,bool)) m:num) n:num)) m:num))))))))
      #|NUMSEG_CLAUSES_LE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%144:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%144:num) ((#<=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) i:num)))))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool)))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%145:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%145:num) ((#<=:fun(num,fun(num,bool)) i:num) (#SUC:fun(num,num) k:num))) i:num)))))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#SUC:fun(num,num) k:num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%146:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%146:num) ((#<=:fun(num,fun(num,bool)) i:num) k:num)) i:num))))))))))
      #|HAS_SIZE_NUMSEG_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#HAS_SIZE:fun(fun(num,bool),fun(num,bool)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%147:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%147:num) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) m:num)))))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|FINITE_NUMSEG_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%148:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%148:num) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) m:num))))))))
      #|CARD_NUMSEG_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(num,bool),num) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%149:num. (#?:fun(fun(num,bool),bool) (\m:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%149:num) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) m:num))))))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|num_FINITE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) s:fun(num,bool))) ((#<=:fun(num,fun(num,bool)) x:num) a:num)))))))))
      #|num_FINITE_AVOID =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(num,bool),bool) (\a:num. (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) a:num) s:fun(num,bool))))))))
      #|num_INFINITE_EQ =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#forall:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) s:fun(num,bool))))))))))
      #|num_INFINITE =  |- (#INFINITE:fun(fun(num,bool),bool) #UNIV:fun(num,bool))
      #|string_INFINITE =  |- (#INFINITE:fun(fun(list(char),bool),bool) #UNIV:fun(list(char),bool))
      #|FINITE_REAL_INTERVAL =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#~:fun(bool,bool) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%150:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%150:real) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) x:real)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#~:fun(bool,bool) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%151:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%151:real) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) x:real)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\b:real. (#~:fun(bool,bool) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%152:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%152:real) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) x:real)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\b:real. (#~:fun(bool,bool) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%153:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%153:real) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) x:real)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%154:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%154:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%155:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%155:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%156:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%156:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%157:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%157:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real)))))))))))))
      #|real_INFINITE =  |- (#INFINITE:fun(fun(real,bool),bool) #UNIV:fun(real,bool))
      #|HAS_SIZE_INDEX =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun(num,'A) m:num)) s:fun('A,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?!:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) m:num)) x:'A)))))))))))))))
      #|INFINITE_ENUMERATE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) r:fun(num,num)) #UNIV:fun(num,bool))) s:fun(num,bool))))))))
      #|INFINITE_ENUMERATE_EQ =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) r:fun(num,num)) #UNIV:fun(num,bool))) s:fun(num,bool))))))))
      #|INFINITE_ENUMERATE_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#INFINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#?:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#IN:fun('A,fun(fun('A,bool),bool)) (f:fun(num,'A) x:num)) s:fun('A,bool))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(num,'A) x:num)) (f:fun(num,'A) y:num))) ((#=:fun(num,fun(num,bool)) x:num) y:num))))))))))))
      #|set_of_list =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) #NIL:list('A))) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) ((#CONS:fun('A,fun(list('A),list('A))) h:'A) t:list('A)))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) h:'A) (#set_of_list:fun(list('A),fun('A,bool)) t:list('A)))))
      #|list_of_set =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(list('A),fun(list('A),bool)) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool))) (#@:fun(fun(list('A),bool),list('A)) (\l:list('A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A))) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) l:list('A))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))))
      #|LIST_OF_SET_PROPERTIES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool)))) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))
      #|SET_OF_LIST_OF_SET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool)))) s:fun('A,bool)))))
      #|LENGTH_LIST_OF_SET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool)))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))
      #|MEM_LIST_OF_SET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) x:'A) (#list_of_set:fun(fun('A,bool),list('A)) s:fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))))))))
      #|FINITE_SET_OF_LIST =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). (#FINITE:fun(fun('A,bool),bool) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A)))))
      #|IN_SET_OF_LIST =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A)))) ((#MEM:fun('A,fun(list('A),bool)) x:'A) l:list('A)))))))
      #|SET_OF_LIST_APPEND =  |- (#forall:fun(fun(list('A),bool),bool) (\l1:list('A). (#forall:fun(fun(list('A),bool),bool) (\l2:list('A). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) ((#APPEND:fun(list('A),fun(list('A),list('A))) l1:list('A)) l2:list('A)))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#set_of_list:fun(list('A),fun('A,bool)) l1:list('A))) (#set_of_list:fun(list('A),fun('A,bool)) l2:list('A))))))))
      #|SET_OF_LIST_MAP =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#set_of_list:fun(list('B),fun('B,bool)) ((#MAP:fun(fun('A,'B),fun(list('A),list('B))) f:fun('A,'B)) l:list('A)))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A))))))))
      #|SET_OF_LIST_EQ_EMPTY =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A))) #EMPTY:fun('A,bool))) ((#=:fun(list('A),fun(list('A),bool)) l:list('A)) #NIL:list('A)))))
      #|LIST_OF_SET_EMPTY =  |- ((#=:fun(list('A),fun(list('A),bool)) (#list_of_set:fun(fun('A,bool),list('A)) #EMPTY:fun('A,bool))) #NIL:list('A))
      #|LIST_OF_SET_SING =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(list('A),fun(list('A),bool)) (#list_of_set:fun(fun('A,bool),list('A)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) #EMPTY:fun('A,bool)))) ((#CONS:fun('A,fun(list('A),list('A))) a:'A) #NIL:list('A)))))
      #|pairwise =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) ((r:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|PAIRWISE_EMPTY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) #EMPTY:fun('A,bool))) #T:bool)))
      #|PAIRWISE_SING =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))) #T:bool)))))
      #|PAIRWISE_IMP =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\P:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\Q:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) P:fun('A,fun('A,bool))) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((P:fun('A,fun('A,bool)) x:'A) y:'A)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))) ((Q:fun('A,fun('A,bool)) x:'A) y:'A)))))))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) Q:fun('A,fun('A,bool))) s:fun('A,bool)))))))))
      #|PAIRWISE_MONO =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) t:fun('A,bool)))))))))
      #|PAIRWISE_AND =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R':fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) s:fun('A,bool))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R':fun('A,fun('A,bool))) s:fun('A,bool)))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R':fun('A,fun('A,bool)) x:'A) y:'A))))) s:fun('A,bool)))))))))
      #|PAIRWISE_INSERT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) y:'A) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) ((r:fun('A,fun('A,bool)) x:'A) y:'A)) ((r:fun('A,fun('A,bool)) y:'A) x:'A)))))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) s:fun('A,bool))))))))))
      #|PAIRWISE_INSERT_SYMMETRIC =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\r:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) ((r:fun('A,fun('A,bool)) x:'A) y:'A)) ((r:fun('A,fun('A,bool)) y:'A) x:'A)))))) ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) y:'A) x:'A)))) ((r:fun('A,fun('A,bool)) x:'A) y:'A))))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) r:fun('A,fun('A,bool))) s:fun('A,bool)))))))))))
      #|PAIRWISE_IMAGE =  |- (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\r:fun('B,fun('B,bool)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('B,fun('B,bool)),fun(fun('B,bool),bool)) r:fun('B,fun('B,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool)))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) (\x:'A. (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))) ((r:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))) s:fun('A,bool)))))))
      #|PAIRWISE_UNION =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) t:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) t:fun('A,bool)) s:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))))))))))))
      #|PAIRWISE_CHAIN_UNIONS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\c:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) s:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) c:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))))))))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) R:fun('A,fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) c:fun(fun('A,bool),bool))))))))
      #|DIFF_UNIONS_PAIRWISE_DISJOINT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) t:fun(fun('A,bool),bool)) s:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DIFF:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) t:fun(fun('A,bool),bool)))))))))
      #|INTER_UNIONS_PAIRWISE_DISJOINT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))) ((#UNION:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) t:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) s:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INTER:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun(fun('A,bool),bool)) t:fun(fun('A,bool),bool)))))))))
      #|PSUBSET_UNIONS_PAIRWISE_DISJOINT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\v:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#pairwise:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),fun(fun(fun('A,bool),bool),bool)) #DISJOINT:fun(fun('A,bool),fun(fun('A,bool),bool))) v:fun(fun('A,bool),bool))) ((#PSUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) u:fun(fun('A,bool),bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) v:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))))) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) v:fun(fun('A,bool),bool))))))))
      #|UNION_OF =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool))) (\s:fun('A,bool). (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) c:fun('A,bool)) u:fun(fun('A,bool),bool))) (Q:fun(fun('A,bool),bool) c:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) s:fun('A,bool))))))))))))
      #|INTERSECTION_OF =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool))) (\s:fun('A,bool). (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) c:fun('A,bool)) u:fun(fun('A,bool),bool))) (Q:fun(fun('A,bool),bool) c:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))) s:fun('A,bool))))))))))))
      #|UNION_OF_INC =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) (Q:fun(fun('A,bool),bool) s:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool)))))))))
      #|INTERSECTION_OF_INC =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) s:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) (Q:fun(fun('A,bool),bool) s:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool)))))))))
      #|UNION_OF_MONO =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q':fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (Q:fun(fun('A,bool),bool) x:fun('A,bool))) (Q':fun(fun('A,bool),bool) x:fun('A,bool))))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q':fun(fun('A,bool),bool)) s:fun('A,bool)))))))))))
      #|INTERSECTION_OF_MONO =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q':fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (Q:fun(fun('A,bool),bool) x:fun('A,bool))) (Q':fun(fun('A,bool),bool) x:fun('A,bool))))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q':fun(fun('A,bool),bool)) s:fun('A,bool)))))))))))
      #|FORALL_UNION_OF =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool))) (R:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) t:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) c:fun('A,bool)) t:fun(fun('A,bool),bool))) (Q:fun(fun('A,bool),bool) c:fun('A,bool))))))) (R:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool)))))))
      #|FORALL_INTERSECTION_OF =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) s:fun('A,bool))) (R:fun(fun('A,bool),bool) s:fun('A,bool)))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\t:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) t:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) c:fun('A,bool)) t:fun(fun('A,bool),bool))) (Q:fun(fun('A,bool),bool) c:fun('A,bool))))))) (R:fun(fun('A,bool),bool) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) t:fun(fun('A,bool),bool)))))))
      #|UNION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) #EMPTY:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))))))
      #|INTERSECTION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun(fun('A,bool),bool),bool),bool),bool) (\P:fun(fun(fun('A,bool),bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Q:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun(fun('A,bool),bool),bool) #EMPTY:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) P:fun(fun(fun('A,bool),bool),bool)) Q:fun(fun('A,bool),bool)) #UNIV:fun('A,bool)))))))
      #|ARBITRARY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#ARBITRARY:fun(fun(fun('A,bool),bool),bool) s:fun(fun('A,bool),bool))) #T:bool)))
      #|ARBITRARY_UNION_OF_ALT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) B:fun(fun('A,bool),bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) B:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) s:fun('A,bool))))))))))))))
      #|ARBITRARY_UNION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))))
      #|ARBITRARY_INTERSECTION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool))))
      #|ARBITRARY_UNION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|ARBITRARY_INTERSECTION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|ARBITRARY_UNION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|ARBITRARY_INTERSECTION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|ARBITRARY_UNION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|ARBITRARY_INTERSECTION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|ARBITRARY_UNION_OF_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|ARBITRARY_UNION_OF_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|ARBITRARY_INTERSECTION_OF_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|ARBITRARY_INTERSECTION_OF_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|ARBITRARY_UNION_OF_INTER_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|ARBITRARY_UNION_OF_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|ARBITRARY_INTERSECTION_OF_UNION_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|ARBITRARY_INTERSECTION_OF_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #ARBITRARY:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_UNION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool))))
      #|FINITE_INTERSECTION_OF_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) #UNIV:fun('A,bool))))
      #|FINITE_UNION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|FINITE_INTERSECTION_OF_INC =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool)))))))
      #|FINITE_UNION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|FINITE_INTERSECTION_OF_COMPLEMENT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) (\s:fun('A,bool). (P:fun(fun('A,bool),bool) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) #UNIV:fun('A,bool)) s:fun('A,bool))))))))
      #|FINITE_UNION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|FINITE_INTERSECTION_OF_IDEMPOT =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))) ((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)))))
      #|FINITE_UNION_OF_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|FINITE_UNION_OF_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|FINITE_INTERSECTION_OF_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\u:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) u:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) s:fun('A,bool)) u:fun(fun('A,bool),bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))))))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) u:fun(fun('A,bool),bool))))))))
      #|FINITE_INTERSECTION_OF_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))))
      #|FINITE_UNION_OF_INTER_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_UNION_OF_INTER =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#UNION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_INTERSECTION_OF_UNION_EQ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|FINITE_INTERSECTION_OF_UNION =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) s:fun('A,bool))) (P:fun(fun('A,bool),bool) t:fun('A,bool)))) (P:fun(fun('A,bool),bool) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) s:fun('A,bool))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) t:fun('A,bool)))) (((#INTERSECTION_OF:fun(fun(fun(fun('A,bool),bool),bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #FINITE:fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) s:fun('A,bool)) t:fun('A,bool)))))))))))
      #|CARD_SET_OF_LIST_LE =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A)))) (#LENGTH:fun(list('A),num) l:list('A)))))
      #|HAS_SIZE_SET_OF_LIST =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) (#set_of_list:fun(list('A),fun('A,bool)) l:list('A))) (#LENGTH:fun(list('A),num) l:list('A)))) ((#PAIRWISE:fun(fun('A,fun('A,bool)),fun(list('A),bool)) (\x:'A. (\y:'A. (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) l:list('A)))))
      #|SURJECTIVE_IFF_INJECTIVE_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool)))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|SURJECTIVE_IFF_INJECTIVE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool))) s:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) y:'A)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))
      #|IMAGE_IMP_INJECTIVE_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))
      #|IMAGE_IMP_INJECTIVE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool))) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|HAS_SIZE_IMAGE_INJ_RESTRICT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\P:fun('B,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%158:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%158:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('B,bool) (f:fun('A,'B) x:'A)))) x:'A)))))) n:num))))))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) (#GSPEC:fun(fun('B,bool),fun('B,bool)) (\GEN%PVAR%159:'B. (#?:fun(fun('B,bool),bool) (\x:'B. (((#SETSPEC:fun('B,fun(bool,fun('B,bool))) GEN%PVAR%159:'B) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) t:fun('B,bool))) (P:fun('B,bool) x:'B))) x:'B)))))) n:num))))))))))))
      #|CARD_LE_INJ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#<=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|FORALL_IN_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) #EMPTY:fun('A,bool))) (P:fun('A,bool) x:'A))))) #T:bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A)))))))))))))
      #|EXISTS_IN_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) #EMPTY:fun('A,bool))) (P:fun('A,bool) x:'A))))) #F:bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) a:'A) s:fun('A,bool)))) (P:fun('A,bool) x:'A))))) ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (P:fun('A,bool) x:'A)))))))))))))
      #|INJECTIVE_ON_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) u:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) u:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|INJECTIVE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) t:fun('A,bool)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|SURJECTIVE_ON_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) v:fun('B,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) u:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) v:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) u:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))))))))))))))
      #|SURJECTIVE_IMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) t:fun('B,bool))))))) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B))))))))
      #|INJECTIVE_ON_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) u:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t':fun('B,bool)) u:fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%160:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%160:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%161:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%161:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t':fun('B,bool)))) x:'A))))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool)))))))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) u:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))))))))))
      #|SURJECTIVE_ON_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\u:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) k:fun('A,bool)) s:fun('A,bool))) (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) u:fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%162:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%162:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))) x:'A)))))) k:fun('A,bool))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) s:fun('A,bool))) u:fun('B,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|INJECTIVE_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t':fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%163:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%163:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) x:'A)))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%164:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%164:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t':fun('B,bool))) x:'A))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) t:fun('B,bool)) t':fun('B,bool)))))))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) #UNIV:fun('A,bool))) #UNIV:fun('B,bool)))))
      #|SURJECTIVE_PREIMAGE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). (#?:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%165:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%165:'A) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) x:'A)))))) k:fun('A,bool))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|CARD_EQ_BIJECTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))))
      #|CARD_EQ_BIJECTIONS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))))))))))))
      #|CARD_EQ_BIJECTIONS_SPECIAL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) b:'B) t:fun('B,bool))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#?:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) a:'A)) b:'B)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) b:'B)) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))))))))))))))))))
      #|BIJECTIONS_HAS_SIZE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)))) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num))))))))))
      #|BIJECTIONS_HAS_SIZE_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) s:fun('A,bool)) n:num)) ((#HAS_SIZE:fun(fun('B,bool),fun(num,bool)) t:fun('B,bool)) n:num)))))))))))))
      #|BIJECTIONS_CARD_EQ =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun('B,bool),bool) t:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool))) ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) x:'A))) x:'A)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) (g:fun('B,'A) y:'B)) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) y:'B))) y:'B)))))))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))) (#CARD:fun(fun('B,bool),num) t:fun('B,bool))))))))))))
      #|WF_FINITE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\<<:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) ((<<:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((<<:fun('A,fun('A,bool)) x:'A) y:'A)) ((<<:fun('A,fun('A,bool)) y:'A) z:'A))) ((<<:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#FINITE:fun(fun('A,bool),bool) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%166:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%166:'A) ((<<:fun('A,fun('A,bool)) y:'A) x:'A)) y:'A))))))))))) (#WF:fun(fun('A,fun('A,bool)),bool) <<:fun('A,fun('A,bool))))))
      #|WF_PSUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#WF:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),bool) (\t1:fun('A,bool). (\t2:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#PSUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t1:fun('A,bool)) t2:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t2:fun('A,bool)) s:fun('A,bool)))))))))
      #|le_c =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|lt_c =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#<_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#~:fun(bool,bool) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))))
      #|eq_c =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('B,fun(fun('B,bool),bool)) (f:fun('A,'B) x:'A)) t:fun('B,bool)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?!:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))))))))))
      #|ge_c =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#>=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|gt_c =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#>_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) ((#<_c:fun(fun('B,bool),fun(fun('A,bool),bool)) t:fun('B,bool)) s:fun('A,bool)))))))
      #|LE_C =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\s:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#<=_c:fun(fun('B,bool),fun(fun('A,bool),bool)) s:fun('B,bool)) t:fun('A,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun('B,bool),bool) (\x:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) x:'B) s:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) t:fun('A,bool))) ((#=:fun('B,fun('B,bool)) (g:fun('A,'B) y:'A)) x:'B))))))))))))))
      #|GE_C =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\t:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) ((#>=_c:fun(fun('A,bool),fun(fun('B,bool),bool)) s:fun('A,bool)) t:fun('B,bool))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('B,fun(fun('B,bool),bool)) y:'B) t:fun('B,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#=:fun('B,fun('B,bool)) y:'B) (f:fun('A,'B) x:'A)))))))))))))))
      #|COUNTABLE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#>=_c:fun(fun(num,bool),fun(fun('A,bool),bool)) #UNIV:fun(num,bool)) t:fun('A,bool)))))
      #|sup =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#@:fun(fun(real,bool),real) (\a:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) a:real))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))))))
      #|SUP_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#sup:fun(fun(real,bool),real) t:fun(real,bool))))))))
      #|SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool))))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))))
      #|SUP_FINITE_LEMMA =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))))))
      #|SUP_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool))))))))))
      #|REAL_LE_SUP_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real))))))))))
      #|REAL_SUP_LE_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) a:real))))))))))
      #|REAL_LT_SUP_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real))))))))))
      #|REAL_SUP_LT_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real))))))))))
      #|REAL_SUP_UNIQUE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))) (#forall:fun(fun(real,bool),bool) (\b':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) b':real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) b':real) x:real))))))))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))
      #|REAL_SUP_LE =  |- (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))
      #|REAL_SUP_LE_SUBSET =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) t:fun(real,bool))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))))) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#sup:fun(fun(real,bool),real) t:fun(real,bool))))))))
      #|REAL_SUP_BOUNDS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) b:real)))))))))
      #|REAL_ABS_SUP_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) a:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#sup:fun(fun(real,bool),real) s:fun(real,bool)))) a:real))))))
      #|REAL_SUP_ASCLOSE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) l:real))) e:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) l:real))) e:real))))))))
      #|SUP_UNIQUE_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) y:real) a:real)))))))))
      #|SUP_INSERT_FINITE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) x:real) s:fun(real,bool)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))) x:real) ((#real_max:fun(real,fun(real,real)) x:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool))))))))))
      #|SUP_SING =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) #EMPTY:fun(real,bool)))) a:real)))
      #|SUP_INSERT_INSERT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) b:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) s:fun(real,bool))))) (#sup:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) ((#real_max:fun(real,fun(real,real)) a:real) b:real)) s:fun(real,bool))))))))))
      #|REAL_LE_SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#real_le:fun(real,fun(real,bool)) a:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool))))))))))))
      #|REAL_SUP_LE_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) y:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))))))
      #|SUP_UNIQUE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))))) ((#real_le:fun(real,fun(real,bool)) b:real) c:real))))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))
      #|SUP_UNION =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) t:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) (#?:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) c:real)))))))))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) s:fun(real,bool)) t:fun(real,bool)))) ((#real_max:fun(real,fun(real,real)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#sup:fun(fun(real,bool),real) t:fun(real,bool)))))))))
      #|ELEMENT_LE_SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) a:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool))))))))
      #|SUP_APPROACH =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#real_lt:fun(real,fun(real,bool)) c:real) (#sup:fun(fun(real,bool),real) s:fun(real,bool)))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) c:real) x:real)))))))))
      #|REAL_MAX_SUP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) (#sup:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) x:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) y:real) #EMPTY:fun(real,bool)))))))))
      #|inf =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) (#@:fun(fun(real,bool),real) (\a:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))) ((#real_le:fun(real,fun(real,bool)) b:real) a:real))))))))))
      #|INF_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)))))))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) (#inf:fun(fun(real,bool),real) t:fun(real,bool))))))))
      #|INF =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) x:real))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))) ((#real_le:fun(real,fun(real,bool)) b:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool))))))))))
      #|INF_FINITE_LEMMA =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) b:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))))))
      #|INF_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) x:real))))))))
      #|REAL_LE_INF_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real))))))))))
      #|REAL_INF_LE_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) a:real))))))))))
      #|REAL_LT_INF_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real))))))))))
      #|REAL_INF_LT_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real))))))))))
      #|REAL_INF_UNIQUE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))) (#forall:fun(fun(real,bool),bool) (\b':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) b:real) b':real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) b':real))))))))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))
      #|REAL_LE_INF =  |- (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real)))))) ((#real_le:fun(real,fun(real,bool)) b:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool))))))
      #|REAL_LE_INF_SUBSET =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) t:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) t:fun(real,bool)) s:fun(real,bool))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) (#inf:fun(fun(real,bool),real) t:fun(real,bool))))))))
      #|REAL_INF_BOUNDS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) b:real)))))))))
      #|REAL_ABS_INF_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) a:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) a:real))))))
      #|REAL_INF_ASCLOSE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) l:real))) e:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) l:real))) e:real))))))))
      #|INF_UNIQUE_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)))))))))
      #|INF_INSERT_FINITE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) x:real) s:fun(real,bool)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool))) x:real) ((#real_min:fun(real,fun(real,real)) x:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool))))))))))
      #|INF_SING =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) #EMPTY:fun(real,bool)))) a:real)))
      #|INF_INSERT_INSERT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) b:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) s:fun(real,bool))))) (#inf:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) ((#real_min:fun(real,fun(real,real)) a:real) b:real)) s:fun(real,bool))))))))))
      #|REAL_SUP_EQ_INF =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\B:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) B:real)))))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\a:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) a:real) #EMPTY:fun(real,bool)))))))))
      #|REAL_INF_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) a:real) x:real))))))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))))))
      #|REAL_LE_INF_EQ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real)))))))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) (#inf:fun(fun(real,bool),real) s:fun(real,bool)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))))))
      #|INF_UNIQUE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) c:real) x:real))))) ((#real_le:fun(real,fun(real,bool)) c:real) b:real))))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) b:real))))))
      #|INF_UNION =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) t:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))) (#?:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) t:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) c:real) x:real)))))))))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) s:fun(real,bool)) t:fun(real,bool)))) ((#real_min:fun(real,fun(real,real)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) (#inf:fun(fun(real,bool),real) t:fun(real,bool)))))))))
      #|INF_LE_ELEMENT =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))) ((#IN:fun(real,fun(fun(real,bool),bool)) a:real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) a:real))))))
      #|INF_APPROACH =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))) ((#real_lt:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) c:real)))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) c:real)))))))))
      #|REAL_MIN_INF =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) (#inf:fun(fun(real,bool),real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) x:real) ((#INSERT:fun(real,fun(fun(real,bool),fun(real,bool))) y:real) #EMPTY:fun(real,bool)))))))))
      #|has_inf =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) b:real)) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) c:real) x:real))))) ((#real_le:fun(real,fun(real,bool)) c:real) b:real)))))))))
      #|has_sup =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) b:real)) (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))))) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)))))))))
      #|HAS_INF_LBOUND =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) b:real)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))))
      #|HAS_SUP_UBOUND =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) b:real)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool)))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))))
      #|HAS_INF_INF =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))) ((#=:fun(real,fun(real,bool)) (#inf:fun(fun(real,bool),real) s:fun(real,bool))) l:real))))))))
      #|HAS_SUP_SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))) ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) l:real))))))))
      #|INF_EXISTS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\l:real. ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) b:real) x:real))))))))))
      #|SUP_EXISTS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\l:real. ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) (#?:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))))))))
      #|HAS_INF_APPROACH =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#real_lt:fun(real,fun(real,bool)) l:real) c:real))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) c:real)))))))))))
      #|HAS_SUP_APPROACH =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#real_lt:fun(real,fun(real,bool)) c:real) l:real))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) c:real) x:real)))))))))))
      #|HAS_INF =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) l:real) x:real))))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) l:real) c:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) x:real) c:real))))))))))))))
      #|HAS_SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) s:fun(real,bool)) #EMPTY:fun(real,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) l:real))))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) l:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) c:real) x:real))))))))))))))
      #|HAS_INF_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) ((#has_inf:fun(fun(real,bool),fun(real,bool)) t:fun(real,bool)) m:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) t:fun(real,bool))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))) ((#real_le:fun(real,fun(real,bool)) l:real) m:real))))))))))
      #|HAS_SUP_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) s:fun(real,bool)) l:real)) ((#/\:fun(bool,fun(bool,bool)) ((#has_sup:fun(fun(real,bool),fun(real,bool)) t:fun(real,bool)) m:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) t:fun(real,bool))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)))))))))) ((#real_le:fun(real,fun(real,bool)) m:real) l:real))))))))))
      #|types = int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 234
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|counter_genvar = _67074:bool
      #|
    ),
  )
}
