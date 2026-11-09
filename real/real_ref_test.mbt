// Load-fidelity test for real.ml: replays tools/ocaml_ref/real_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "real matches real.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("real")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("REAL_OF_NUM_LT", () => sthm(@real.real_of_num_lt()))
  log.attempt("REAL_OF_NUM_GE", () => sthm(@real.real_of_num_ge()))
  log.attempt("REAL_OF_NUM_GT", () => sthm(@real.real_of_num_gt()))
  log.attempt("REAL_OF_NUM_MAX", () => sthm(@real.real_of_num_max()))
  log.attempt("REAL_OF_NUM_MIN", () => sthm(@real.real_of_num_min()))
  log.attempt("REAL_OF_NUM_SUC", () => sthm(@real.real_of_num_suc()))
  log.attempt("REAL_OF_NUM_SUB", () => sthm(@real.real_of_num_sub()))
  log.attempt("REAL_OF_NUM_SUB_CASES", () => sthm(@real.real_of_num_sub_cases()))
  log.attempt("REAL_OF_NUM_CLAUSES", () => sthm(@real.real_of_num_clauses()))
  log.attempt("REAL_MUL_AC", () => sthm(@real.real_mul_ac()))
  log.attempt("REAL_ADD_RDISTRIB", () => sthm(@real.real_add_rdistrib()))
  log.attempt("REAL_LT_LADD_IMP", () => sthm(@real.real_lt_ladd_imp()))
  log.attempt("REAL_LT_MUL", () => sthm(@real.real_lt_mul()))
  log.attempt("REAL_EQ_ADD_LCANCEL_0", () => sthm(@real.real_eq_add_lcancel_0()))
  log.attempt("REAL_EQ_ADD_RCANCEL_0", () => sthm(@real.real_eq_add_rcancel_0()))
  log.attempt("REAL_LNEG_UNIQ", () => sthm(@real.real_lneg_uniq()))
  log.attempt("REAL_RNEG_UNIQ", () => sthm(@real.real_rneg_uniq()))
  log.attempt("REAL_NEG_LMUL", () => sthm(@real.real_neg_lmul()))
  log.attempt("REAL_NEG_RMUL", () => sthm(@real.real_neg_rmul()))
  log.attempt("REAL_NEG_MUL2", () => sthm(@real.real_neg_mul2()))
  log.attempt("REAL_LT_LADD", () => sthm(@real.real_lt_ladd()))
  log.attempt("REAL_LT_RADD", () => sthm(@real.real_lt_radd()))
  log.attempt("REAL_LT_ANTISYM", () => sthm(@real.real_lt_antisym()))
  log.attempt("REAL_LT_GT", () => sthm(@real.real_lt_gt()))
  log.attempt("REAL_NOT_EQ", () => sthm(@real.real_not_eq()))
  log.attempt("REAL_NOT_LE", () => sthm(@real.real_not_le()))
  log.attempt("REAL_LET_ANTISYM", () => sthm(@real.real_let_antisym()))
  log.attempt("REAL_NEG_LT0", () => sthm(@real.real_neg_lt0()))
  log.attempt("REAL_NEG_GT0", () => sthm(@real.real_neg_gt0()))
  log.attempt("REAL_NEG_LE0", () => sthm(@real.real_neg_le0()))
  log.attempt("REAL_NEG_GE0", () => sthm(@real.real_neg_ge0()))
  log.attempt("REAL_LT_TOTAL", () => sthm(@real.real_lt_total()))
  log.attempt("REAL_LT_NEGTOTAL", () => sthm(@real.real_lt_negtotal()))
  log.attempt("REAL_LE_01", () => sthm(@real.real_le_01()))
  log.attempt("REAL_LT_01", () => sthm(@real.real_lt_01()))
  log.attempt("REAL_LE_LADD", () => sthm(@real.real_le_ladd()))
  log.attempt("REAL_LE_RADD", () => sthm(@real.real_le_radd()))
  log.attempt("REAL_LT_ADD2", () => sthm(@real.real_lt_add2()))
  log.attempt("REAL_LE_ADD2", () => sthm(@real.real_le_add2()))
  log.attempt("REAL_LT_LNEG", () => sthm(@real.real_lt_lneg()))
  log.attempt("REAL_LT_RNEG", () => sthm(@real.real_lt_rneg()))
  log.attempt("REAL_LT_ADDNEG", () => sthm(@real.real_lt_addneg()))
  log.attempt("REAL_LT_ADDNEG2", () => sthm(@real.real_lt_addneg2()))
  log.attempt("REAL_LT_ADD1", () => sthm(@real.real_lt_add1()))
  log.attempt("REAL_SUB_ADD", () => sthm(@real.real_sub_add()))
  log.attempt("REAL_SUB_ADD2", () => sthm(@real.real_sub_add2()))
  log.attempt("REAL_SUB_REFL", () => sthm(@real.real_sub_refl()))
  log.attempt("REAL_LE_DOUBLE", () => sthm(@real.real_le_double()))
  log.attempt("REAL_LE_NEGL", () => sthm(@real.real_le_negl()))
  log.attempt("REAL_LE_NEGR", () => sthm(@real.real_le_negr()))
  log.attempt("REAL_NEG_EQ_0", () => sthm(@real.real_neg_eq_0()))
  log.attempt("REAL_ADD_SUB", () => sthm(@real.real_add_sub()))
  log.attempt("REAL_NEG_EQ", () => sthm(@real.real_neg_eq()))
  log.attempt("REAL_NEG_MINUS1", () => sthm(@real.real_neg_minus1()))
  log.attempt("REAL_LT_IMP_NE", () => sthm(@real.real_lt_imp_ne()))
  log.attempt("REAL_LE_ADDR", () => sthm(@real.real_le_addr()))
  log.attempt("REAL_LE_ADDL", () => sthm(@real.real_le_addl()))
  log.attempt("REAL_LT_ADDR", () => sthm(@real.real_lt_addr()))
  log.attempt("REAL_LT_ADDL", () => sthm(@real.real_lt_addl()))
  log.attempt("REAL_SUB_SUB", () => sthm(@real.real_sub_sub()))
  log.attempt("REAL_LT_ADD_SUB", () => sthm(@real.real_lt_add_sub()))
  log.attempt("REAL_LT_SUB_RADD", () => sthm(@real.real_lt_sub_radd()))
  log.attempt("REAL_LT_SUB_LADD", () => sthm(@real.real_lt_sub_ladd()))
  log.attempt("REAL_LE_SUB_LADD", () => sthm(@real.real_le_sub_ladd()))
  log.attempt("REAL_LE_SUB_RADD", () => sthm(@real.real_le_sub_radd()))
  log.attempt("REAL_ADD2_SUB2", () => sthm(@real.real_add2_sub2()))
  log.attempt("REAL_SUB_LZERO", () => sthm(@real.real_sub_lzero()))
  log.attempt("REAL_SUB_RZERO", () => sthm(@real.real_sub_rzero()))
  log.attempt("REAL_LET_ADD2", () => sthm(@real.real_let_add2()))
  log.attempt("REAL_LTE_ADD2", () => sthm(@real.real_lte_add2()))
  log.attempt("REAL_SUB_LNEG", () => sthm(@real.real_sub_lneg()))
  log.attempt("REAL_SUB_RNEG", () => sthm(@real.real_sub_rneg()))
  log.attempt("REAL_SUB_NEG2", () => sthm(@real.real_sub_neg2()))
  log.attempt("REAL_SUB_TRIANGLE", () => sthm(@real.real_sub_triangle()))
  log.attempt("REAL_EQ_SUB_LADD", () => sthm(@real.real_eq_sub_ladd()))
  log.attempt("REAL_EQ_SUB_RADD", () => sthm(@real.real_eq_sub_radd()))
  log.attempt("REAL_SUB_SUB2", () => sthm(@real.real_sub_sub2()))
  log.attempt("REAL_ADD_SUB2", () => sthm(@real.real_add_sub2()))
  log.attempt("REAL_EQ_IMP_LE", () => sthm(@real.real_eq_imp_le()))
  log.attempt("REAL_LT_IMP_NZ", () => sthm(@real.real_lt_imp_nz()))
  log.attempt("REAL_DIFFSQ", () => sthm(@real.real_diffsq()))
  log.attempt("REAL_EQ_NEG2", () => sthm(@real.real_eq_neg2()))
  log.attempt("REAL_LT_NEG2", () => sthm(@real.real_lt_neg2()))
  log.attempt("REAL_SUB_LDISTRIB", () => sthm(@real.real_sub_ldistrib()))
  log.attempt("REAL_SUB_RDISTRIB", () => sthm(@real.real_sub_rdistrib()))
  log.attempt("REAL_ABS_ZERO", () => sthm(@real.real_abs_zero()))
  log.attempt("REAL_ABS_0", () => sthm(@real.real_abs_0()))
  log.attempt("REAL_ABS_1", () => sthm(@real.real_abs_1()))
  log.attempt("REAL_ABS_TRIANGLE", () => sthm(@real.real_abs_triangle()))
  log.attempt("REAL_ABS_TRIANGLE_LE", () => sthm(@real.real_abs_triangle_le()))
  log.attempt("REAL_ABS_TRIANGLE_LT", () => sthm(@real.real_abs_triangle_lt()))
  log.attempt("REAL_ABS_POS", () => sthm(@real.real_abs_pos()))
  log.attempt("REAL_ABS_SUB", () => sthm(@real.real_abs_sub()))
  log.attempt("REAL_ABS_NZ", () => sthm(@real.real_abs_nz()))
  log.attempt("REAL_ABS_ABS", () => sthm(@real.real_abs_abs()))
  log.attempt("REAL_ABS_LE", () => sthm(@real.real_abs_le()))
  log.attempt("REAL_ABS_REFL", () => sthm(@real.real_abs_refl()))
  log.attempt("REAL_ABS_BETWEEN", () => sthm(@real.real_abs_between()))
  log.attempt("REAL_ABS_BOUND", () => sthm(@real.real_abs_bound()))
  log.attempt("REAL_ABS_STILLNZ", () => sthm(@real.real_abs_stillnz()))
  log.attempt("REAL_ABS_CASES", () => sthm(@real.real_abs_cases()))
  log.attempt("REAL_ABS_BETWEEN1", () => sthm(@real.real_abs_between1()))
  log.attempt("REAL_ABS_SIGN", () => sthm(@real.real_abs_sign()))
  log.attempt("REAL_ABS_SIGN2", () => sthm(@real.real_abs_sign2()))
  log.attempt("REAL_ABS_CIRCLE", () => sthm(@real.real_abs_circle()))
  log.attempt("REAL_SUB_ABS", () => sthm(@real.real_sub_abs()))
  log.attempt("REAL_ABS_SUB_ABS", () => sthm(@real.real_abs_sub_abs()))
  log.attempt("REAL_ABS_BETWEEN2", () => sthm(@real.real_abs_between2()))
  log.attempt("REAL_ABS_BOUNDS", () => sthm(@real.real_abs_bounds()))
  log.attempt("REAL_BOUNDS_LE", () => sthm(@real.real_bounds_le()))
  log.attempt("REAL_BOUNDS_LT", () => sthm(@real.real_bounds_lt()))
  log.attempt("REAL_MIN_MAX", () => sthm(@real.real_min_max()))
  log.attempt("REAL_MAX_MIN", () => sthm(@real.real_max_min()))
  log.attempt("REAL_MAX_MAX", () => sthm(@real.real_max_max()))
  log.attempt("REAL_MIN_MIN", () => sthm(@real.real_min_min()))
  log.attempt("REAL_MAX_SYM", () => sthm(@real.real_max_sym()))
  log.attempt("REAL_MIN_SYM", () => sthm(@real.real_min_sym()))
  log.attempt("REAL_LE_MAX", () => sthm(@real.real_le_max()))
  log.attempt("REAL_LE_MIN", () => sthm(@real.real_le_min()))
  log.attempt("REAL_LT_MAX", () => sthm(@real.real_lt_max()))
  log.attempt("REAL_LT_MIN", () => sthm(@real.real_lt_min()))
  log.attempt("REAL_MAX_LE", () => sthm(@real.real_max_le()))
  log.attempt("REAL_MIN_LE", () => sthm(@real.real_min_le()))
  log.attempt("REAL_MAX_LT", () => sthm(@real.real_max_lt()))
  log.attempt("REAL_MIN_LT", () => sthm(@real.real_min_lt()))
  log.attempt("REAL_MAX_ASSOC", () => sthm(@real.real_max_assoc()))
  log.attempt("REAL_MIN_ASSOC", () => sthm(@real.real_min_assoc()))
  log.attempt("REAL_MAX_ACI", () => sthm(@real.real_max_aci()))
  log.attempt("REAL_MIN_ACI", () => sthm(@real.real_min_aci()))
  log.attempt("REAL_ABS_MUL", () => sthm(@real.real_abs_mul()))
  log.attempt("REAL_POW_LE", () => sthm(@real.real_pow_le()))
  log.attempt("REAL_POW_LT", () => sthm(@real.real_pow_lt()))
  log.attempt("REAL_ABS_POW", () => sthm(@real.real_abs_pow()))
  log.attempt("REAL_LE_LMUL", () => sthm(@real.real_le_lmul()))
  log.attempt("REAL_LE_RMUL", () => sthm(@real.real_le_rmul()))
  log.attempt("REAL_LT_LMUL", () => sthm(@real.real_lt_lmul()))
  log.attempt("REAL_LT_RMUL", () => sthm(@real.real_lt_rmul()))
  log.attempt("REAL_EQ_MUL_LCANCEL", () => sthm(@real.real_eq_mul_lcancel()))
  log.attempt("REAL_EQ_MUL_RCANCEL", () => sthm(@real.real_eq_mul_rcancel()))
  log.attempt("REAL_MUL_LINV_UNIQ", () => sthm(@real.real_mul_linv_uniq()))
  log.attempt("REAL_MUL_RINV_UNIQ", () => sthm(@real.real_mul_rinv_uniq()))
  log.attempt("REAL_INV_INV", () => sthm(@real.real_inv_inv()))
  log.attempt("REAL_EQ_INV2", () => sthm(@real.real_eq_inv2()))
  log.attempt("REAL_INV_EQ_0", () => sthm(@real.real_inv_eq_0()))
  log.attempt("REAL_LT_INV", () => sthm(@real.real_lt_inv()))
  log.attempt("REAL_LT_INV_EQ", () => sthm(@real.real_lt_inv_eq()))
  log.attempt("REAL_INV_NEG", () => sthm(@real.real_inv_neg()))
  log.attempt("REAL_LE_INV_EQ", () => sthm(@real.real_le_inv_eq()))
  log.attempt("REAL_LE_INV", () => sthm(@real.real_le_inv()))
  log.attempt("REAL_MUL_RINV", () => sthm(@real.real_mul_rinv()))
  log.attempt("REAL_INV_1", () => sthm(@real.real_inv_1()))
  log.attempt("REAL_INV_EQ_1", () => sthm(@real.real_inv_eq_1()))
  log.attempt("REAL_DIV_1", () => sthm(@real.real_div_1()))
  log.attempt("REAL_DIV_REFL", () => sthm(@real.real_div_refl()))
  log.attempt("REAL_DIV_RMUL", () => sthm(@real.real_div_rmul()))
  log.attempt("REAL_DIV_LMUL", () => sthm(@real.real_div_lmul()))
  log.attempt("REAL_DIV_EQ_1", () => sthm(@real.real_div_eq_1()))
  log.attempt("REAL_ABS_INV", () => sthm(@real.real_abs_inv()))
  log.attempt("REAL_ABS_DIV", () => sthm(@real.real_abs_div()))
  log.attempt("REAL_INV_MUL", () => sthm(@real.real_inv_mul()))
  log.attempt("REAL_INV_DIV", () => sthm(@real.real_inv_div()))
  log.attempt("REAL_POW_MUL", () => sthm(@real.real_pow_mul()))
  log.attempt("REAL_POW_INV", () => sthm(@real.real_pow_inv()))
  log.attempt("REAL_INV_POW", () => sthm(@real.real_inv_pow()))
  log.attempt("REAL_POW_DIV", () => sthm(@real.real_pow_div()))
  log.attempt("REAL_DIV_EQ_0", () => sthm(@real.real_div_eq_0()))
  log.attempt("REAL_POW_ADD", () => sthm(@real.real_pow_add()))
  log.attempt("REAL_POW_NZ", () => sthm(@real.real_pow_nz()))
  log.attempt("REAL_POW_SUB", () => sthm(@real.real_pow_sub()))
  log.attempt("REAL_LT_LCANCEL_IMP", () => sthm(@real.real_lt_lcancel_imp()))
  log.attempt("REAL_LT_RCANCEL_IMP", () => sthm(@real.real_lt_rcancel_imp()))
  log.attempt("REAL_LE_LCANCEL_IMP", () => sthm(@real.real_le_lcancel_imp()))
  log.attempt("REAL_LE_RCANCEL_IMP", () => sthm(@real.real_le_rcancel_imp()))
  log.attempt("REAL_LE_RMUL_EQ", () => sthm(@real.real_le_rmul_eq()))
  log.attempt("REAL_LE_LMUL_EQ", () => sthm(@real.real_le_lmul_eq()))
  log.attempt("REAL_LT_RMUL_EQ", () => sthm(@real.real_lt_rmul_eq()))
  log.attempt("REAL_LT_LMUL_EQ", () => sthm(@real.real_lt_lmul_eq()))
  log.attempt("REAL_LE_MUL_EQ", () => sthm(@real.real_le_mul_eq()))
  log.attempt("REAL_LT_MUL_EQ", () => sthm(@real.real_lt_mul_eq()))
  log.attempt("REAL_MUL_POS_LT", () => sthm(@real.real_mul_pos_lt()))
  log.attempt("REAL_MUL_POS_LE", () => sthm(@real.real_mul_pos_le()))
  log.attempt("REAL_LE_RDIV_EQ", () => sthm(@real.real_le_rdiv_eq()))
  log.attempt("REAL_LE_LDIV_EQ", () => sthm(@real.real_le_ldiv_eq()))
  log.attempt("REAL_LT_RDIV_EQ", () => sthm(@real.real_lt_rdiv_eq()))
  log.attempt("REAL_LT_LDIV_EQ", () => sthm(@real.real_lt_ldiv_eq()))
  log.attempt("REAL_EQ_RDIV_EQ", () => sthm(@real.real_eq_rdiv_eq()))
  log.attempt("REAL_EQ_LDIV_EQ", () => sthm(@real.real_eq_ldiv_eq()))
  log.attempt("REAL_LT_DIV2_EQ", () => sthm(@real.real_lt_div2_eq()))
  log.attempt("REAL_LE_DIV2_EQ", () => sthm(@real.real_le_div2_eq()))
  log.attempt("REAL_MUL_2", () => sthm(@real.real_mul_2()))
  log.attempt("REAL_POW_EQ_0", () => sthm(@real.real_pow_eq_0()))
  log.attempt("REAL_LE_MUL2", () => sthm(@real.real_le_mul2()))
  log.attempt("REAL_LT_MUL2", () => sthm(@real.real_lt_mul2()))
  log.attempt("REAL_LT_SQUARE", () => sthm(@real.real_lt_square()))
  log.attempt("REAL_POW_1", () => sthm(@real.real_pow_1()))
  log.attempt("REAL_POW_ONE", () => sthm(@real.real_pow_one()))
  log.attempt("REAL_LT_INV2", () => sthm(@real.real_lt_inv2()))
  log.attempt("REAL_LE_INV2", () => sthm(@real.real_le_inv2()))
  log.attempt("REAL_LT_LINV", () => sthm(@real.real_lt_linv()))
  log.attempt("REAL_LT_RINV", () => sthm(@real.real_lt_rinv()))
  log.attempt("REAL_LE_LINV", () => sthm(@real.real_le_linv()))
  log.attempt("REAL_LE_RINV", () => sthm(@real.real_le_rinv()))
  log.attempt("REAL_INV_LE_1", () => sthm(@real.real_inv_le_1()))
  log.attempt("REAL_INV_1_LE", () => sthm(@real.real_inv_1_le()))
  log.attempt("REAL_INV_LT_1", () => sthm(@real.real_inv_lt_1()))
  log.attempt("REAL_INV_1_LT", () => sthm(@real.real_inv_1_lt()))
  log.attempt("REAL_SUB_INV", () => sthm(@real.real_sub_inv()))
  log.attempt("REAL_DOWN", () => sthm(@real.real_down()))
  log.attempt("REAL_DOWN2", () => sthm(@real.real_down2()))
  log.attempt("REAL_POW_LE2", () => sthm(@real.real_pow_le2()))
  log.attempt("REAL_POW_LE_1", () => sthm(@real.real_pow_le_1()))
  log.attempt("REAL_POW_1_LE", () => sthm(@real.real_pow_1_le()))
  log.attempt("REAL_POW_MONO", () => sthm(@real.real_pow_mono()))
  log.attempt("REAL_POW_LT2", () => sthm(@real.real_pow_lt2()))
  log.attempt("REAL_POW_LT_1", () => sthm(@real.real_pow_lt_1()))
  log.attempt("REAL_POW_1_LT", () => sthm(@real.real_pow_1_lt()))
  log.attempt("REAL_POW_MONO_LT", () => sthm(@real.real_pow_mono_lt()))
  log.attempt("REAL_POW_POW", () => sthm(@real.real_pow_pow()))
  log.attempt("REAL_EQ_RCANCEL_IMP", () => sthm(@real.real_eq_rcancel_imp()))
  log.attempt("REAL_EQ_LCANCEL_IMP", () => sthm(@real.real_eq_lcancel_imp()))
  log.attempt("REAL_LT_DIV", () => sthm(@real.real_lt_div()))
  log.attempt("REAL_LE_DIV", () => sthm(@real.real_le_div()))
  log.attempt("REAL_DIV_POW2", () => sthm(@real.real_div_pow2()))
  log.attempt("REAL_DIV_POW2_ALT", () => sthm(@real.real_div_pow2_alt()))
  log.attempt("REAL_LT_POW2", () => sthm(@real.real_lt_pow2()))
  log.attempt("REAL_LE_POW2", () => sthm(@real.real_le_pow2()))
  log.attempt("REAL_POW2_ABS", () => sthm(@real.real_pow2_abs()))
  log.attempt("REAL_LE_SQUARE_ABS", () => sthm(@real.real_le_square_abs()))
  log.attempt("REAL_LT_SQUARE_ABS", () => sthm(@real.real_lt_square_abs()))
  log.attempt("REAL_EQ_SQUARE_ABS", () => sthm(@real.real_eq_square_abs()))
  log.attempt("REAL_LE_POW_2", () => sthm(@real.real_le_pow_2()))
  log.attempt("REAL_LT_POW_2", () => sthm(@real.real_lt_pow_2()))
  log.attempt("REAL_SOS_EQ_0", () => sthm(@real.real_sos_eq_0()))
  log.attempt("REAL_POW_ZERO", () => sthm(@real.real_pow_zero()))
  log.attempt("REAL_POW_MONO_INV", () => sthm(@real.real_pow_mono_inv()))
  log.attempt("REAL_POW_LE2_REV", () => sthm(@real.real_pow_le2_rev()))
  log.attempt("REAL_POW_LT2_REV", () => sthm(@real.real_pow_lt2_rev()))
  log.attempt("REAL_POW_EQ", () => sthm(@real.real_pow_eq()))
  log.attempt("REAL_POW_EQ_ABS", () => sthm(@real.real_pow_eq_abs()))
  log.attempt("REAL_POW_EQ_1_IMP", () => sthm(@real.real_pow_eq_1_imp()))
  log.attempt("REAL_POW_EQ_1", () => sthm(@real.real_pow_eq_1()))
  log.attempt("REAL_POW_LT2_ODD", () => sthm(@real.real_pow_lt2_odd()))
  log.attempt("REAL_POW_LE2_ODD", () => sthm(@real.real_pow_le2_odd()))
  log.attempt("REAL_POW_LT2_ODD_EQ", () => sthm(@real.real_pow_lt2_odd_eq()))
  log.attempt("REAL_POW_LE2_ODD_EQ", () => sthm(@real.real_pow_le2_odd_eq()))
  log.attempt("REAL_POW_EQ_ODD_EQ", () => sthm(@real.real_pow_eq_odd_eq()))
  log.attempt("REAL_POW_EQ_ODD", () => sthm(@real.real_pow_eq_odd()))
  log.attempt("REAL_POW_EQ_EQ", () => sthm(@real.real_pow_eq_eq()))
  log.attempt("REAL_EVENPOW_ABS", () => sthm(@real.real_evenpow_abs()))
  log.attempt("REAL_OF_NUM_MOD", () => sthm(@real.real_of_num_mod()))
  log.attempt("REAL_OF_NUM_DIV", () => sthm(@real.real_of_num_div()))
  log.attempt("REAL_CONVEX_BOUND2_LT", () => sthm(@real.real_convex_bound2_lt()))
  log.attempt("REAL_CONVEX_BOUND2_LE", () => sthm(@real.real_convex_bound2_le()))
  log.attempt("REAL_CONVEX_BOUND_LT", () => sthm(@real.real_convex_bound_lt()))
  log.attempt("REAL_CONVEX_BOUND_LE", () => sthm(@real.real_convex_bound_le()))
  log.attempt("REAL_CONVEX_BOUND_GT", () => sthm(@real.real_convex_bound_gt()))
  log.attempt("REAL_CONVEX_BOUND_GE", () => sthm(@real.real_convex_bound_ge()))
  log.attempt("REAL_CONVEX_BOUNDS_LE", () => sthm(@real.real_convex_bounds_le()))
  log.attempt("REAL_CONVEX_BOUNDS_LT", () => sthm(@real.real_convex_bounds_lt()))
  log.attempt("REAL_ARCH_SIMPLE", () => sthm(@real.real_arch_simple()))
  log.attempt("REAL_ARCH_LT", () => sthm(@real.real_arch_lt()))
  log.attempt("REAL_ARCH", () => sthm(@real.real_arch()))
  log.attempt("REAL_ARCH_INV", () => sthm(@real.real_arch_inv()))
  log.attempt("REAL_POW_LBOUND", () => sthm(@real.real_pow_lbound()))
  log.attempt("REAL_ARCH_POW", () => sthm(@real.real_arch_pow()))
  log.attempt("REAL_ARCH_POW2", () => sthm(@real.real_arch_pow2()))
  log.attempt("REAL_ARCH_POW_INV", () => sthm(@real.real_arch_pow_inv()))
  log.attempt("real_sgn", () => sthm(@real.real_sgn()))
  log.attempt("REAL_SGN_0", () => sthm(@real.real_sgn_0()))
  log.attempt("REAL_SGN_NEG", () => sthm(@real.real_sgn_neg()))
  log.attempt("REAL_SGN_ABS", () => sthm(@real.real_sgn_abs()))
  log.attempt("REAL_SGN_ABS_ALT", () => sthm(@real.real_sgn_abs_alt()))
  log.attempt("REAL_EQ_SGN_ABS", () => sthm(@real.real_eq_sgn_abs()))
  log.attempt("REAL_ABS_SGN", () => sthm(@real.real_abs_sgn()))
  log.attempt("REAL_SGN", () => sthm(@real.real_sgn_v1()))
  log.attempt("REAL_SGN_MUL", () => sthm(@real.real_sgn_mul()))
  log.attempt("REAL_SGN_INV", () => sthm(@real.real_sgn_inv()))
  log.attempt("REAL_SGN_DIV", () => sthm(@real.real_sgn_div()))
  log.attempt("REAL_SGN_EQ", () => sthm(@real.real_sgn_eq()))
  log.attempt("REAL_SGN_CASES", () => sthm(@real.real_sgn_cases()))
  log.attempt("REAL_SGN_INEQS", () => sthm(@real.real_sgn_ineqs()))
  log.attempt("REAL_SGN_POW", () => sthm(@real.real_sgn_pow()))
  log.attempt("REAL_SGN_POW_2", () => sthm(@real.real_sgn_pow_2()))
  log.attempt("REAL_SGN_REAL_SGN", () => sthm(@real.real_sgn_real_sgn()))
  log.attempt("REAL_INV_SGN", () => sthm(@real.real_inv_sgn()))
  log.attempt("REAL_SGN_EQ_INEQ", () => sthm(@real.real_sgn_eq_ineq()))
  log.attempt("REAL_SGNS_EQ", () => sthm(@real.real_sgns_eq()))
  log.attempt("REAL_SGNS_EQ_ALT", () => sthm(@real.real_sgns_eq_alt()))
  log.attempt("REAL_WLOG_LE", () => sthm(@real.real_wlog_le()))
  log.attempt("REAL_WLOG_LT", () => sthm(@real.real_wlog_lt()))
  log.attempt("REAL_WLOG_LE_3", () => sthm(@real.real_wlog_le_3()))
  log.attempt("sqrt", () => sthm(@real.sqrt()))
  log.attempt("SQRT_UNIQUE", () => sthm(@real.sqrt_unique()))
  log.attempt("POW_2_SQRT", () => sthm(@real.pow_2_sqrt()))
  log.attempt("SQRT_0", () => sthm(@real.sqrt_0()))
  log.attempt("SQRT_1", () => sthm(@real.sqrt_1()))
  log.attempt("POW_2_SQRT_ABS", () => sthm(@real.pow_2_sqrt_abs()))
  log.attempt("SQRT_WORKS_GEN", () => sthm(@real.sqrt_works_gen()))
  log.attempt("SQRT_UNIQUE_GEN", () => sthm(@real.sqrt_unique_gen()))
  log.attempt("SQRT_NEG", () => sthm(@real.sqrt_neg()))
  log.attempt("REAL_SGN_SQRT", () => sthm(@real.real_sgn_sqrt()))
  log.attempt("SQRT_WORKS", () => sthm(@real.sqrt_works()))
  log.attempt("REAL_POS_EQ_SQUARE", () => sthm(@real.real_pos_eq_square()))
  log.attempt("SQRT_POS_LE", () => sthm(@real.sqrt_pos_le()))
  log.attempt("SQRT_POW_2", () => sthm(@real.sqrt_pow_2()))
  log.attempt("SQRT_POW2", () => sthm(@real.sqrt_pow2()))
  log.attempt("SQRT_MUL", () => sthm(@real.sqrt_mul()))
  log.attempt("SQRT_INV", () => sthm(@real.sqrt_inv()))
  log.attempt("SQRT_DIV", () => sthm(@real.sqrt_div()))
  log.attempt("SQRT_LT_0", () => sthm(@real.sqrt_lt_0()))
  log.attempt("SQRT_EQ_0", () => sthm(@real.sqrt_eq_0()))
  log.attempt("SQRT_LE_0", () => sthm(@real.sqrt_le_0()))
  log.attempt("REAL_ABS_SQRT", () => sthm(@real.real_abs_sqrt()))
  log.attempt("SQRT_MONO_LT", () => sthm(@real.sqrt_mono_lt()))
  log.attempt("SQRT_MONO_LE", () => sthm(@real.sqrt_mono_le()))
  log.attempt("SQRT_MONO_LT_EQ", () => sthm(@real.sqrt_mono_lt_eq()))
  log.attempt("SQRT_MONO_LE_EQ", () => sthm(@real.sqrt_mono_le_eq()))
  log.attempt("SQRT_INJ", () => sthm(@real.sqrt_inj()))
  log.attempt("SQRT_EQ_1", () => sthm(@real.sqrt_eq_1()))
  log.attempt("SQRT_POS_LT", () => sthm(@real.sqrt_pos_lt()))
  log.attempt("REAL_LE_LSQRT", () => sthm(@real.real_le_lsqrt()))
  log.attempt("REAL_LE_RSQRT", () => sthm(@real.real_le_rsqrt()))
  log.attempt("REAL_LT_LSQRT", () => sthm(@real.real_lt_lsqrt()))
  log.attempt("REAL_LT_RSQRT", () => sthm(@real.real_lt_rsqrt()))
  log.attempt("SQRT_EVEN_POW2", () => sthm(@real.sqrt_even_pow2()))
  log.attempt("REAL_DIV_SQRT", () => sthm(@real.real_div_sqrt()))
  log.attempt("REAL_RSQRT_LE", () => sthm(@real.real_rsqrt_le()))
  log.attempt("REAL_LSQRT_LE", () => sthm(@real.real_lsqrt_le()))
  log.attempt("REAL_SQRT_POW_2", () => sthm(@real.real_sqrt_pow_2()))
  log.attempt("REAL_ABS_LE_SQRT_POS", () => sthm(@real.real_abs_le_sqrt_pos()))
  log.attempt("REAL_ABS_LE_SQRT", () => sthm(@real.real_abs_le_sqrt()))
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
  log.attempt("arith_lin", () => {
    sthm(@realarith.real_arith(tm("(x : Real) < (y : Real) → x + real_of_num(1) < y + real_of_num(1)")))
  })
  log.attempt("arith_abs", () => {
    sthm(@realarith.real_arith(tm("abs((x : Real)) <= real_of_num(1) → -real_of_num(1) <= x")))
  })
  log.attempt("arith_max", () => sthm(@realarith.real_arith(tm("max((x : Real), (y : Real)) >= x"))))
  log.attempt("arith_chain", () => {
    sthm(@realarith.real_arith(tm("(a : Real) <= (b : Real) && b <= (c : Real) && c <= a → a == c")))
  })
  log.attempt("arith_fail", () => sthm(@realarith.real_arith(tm("(x : Real) * x >= real_of_num(0)"))))
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
      #|real quotations (529):
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) < real_of_num(n)) == (m < n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) >= real_of_num(n)) == (m >= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) > real_of_num(n)) == (m > n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, max(real_of_num(m), real_of_num(n)) == real_of_num(MAX(m, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, min(real_of_num(m), real_of_num(n)) == real_of_num(MIN(m, n))
      #|  \226\136\128 n : Num, real_of_num(n) + real_of_num(1) == real_of_num(SUC(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 real_of_num(n) - real_of_num(m) == real_of_num(n - m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(m) - real_of_num(n) == (if n <= m { real_of_num(m - n) } else { -real_of_num(n - m) })
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) == real_of_num(n)) == (m == n)) && (\226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) >= real_of_num(n)) == (m >= n)) && (\226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) > real_of_num(n)) == (m > n)) && (\226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) <= real_of_num(n)) == (m <= n)) && (\226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) < real_of_num(n)) == (m < n)) && (\226\136\128 m : Num, \226\136\128 n : Num, max(real_of_num(m), real_of_num(n)) == real_of_num(MAX(m, n))) && (\226\136\128 m : Num, \226\136\128 n : Num, min(real_of_num(m), real_of_num(n)) == real_of_num(MIN(m, n))) && (\226\136\128 m : Num, \226\136\128 n : Num, real_of_num(m) + real_of_num(n) == real_of_num(m + n)) && (\226\136\128 m : Num, \226\136\128 n : Num, real_of_num(m) * real_of_num(n) == real_of_num(m * n)) && (\226\136\128 x : Num, \226\136\128 n : Num, pow(real_of_num(x), n) == real_of_num(EXP(x, n)))
      #|  (m : Real) * (n : Real) == n * m && m * n * (p : Real) == m * (n * p) && m * (n * p) == n * (m * p)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y) * z == x * z + y * z
      #|  -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, y < z \226\134\146 x + y < x + z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 real_of_num(0) < x * y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == x) == (y == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == y) == (x == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == real_of_num(0)) == (x == -y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == real_of_num(0)) == (y == -x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x * y) == -x * y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x * y) == x * -y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x * -y == x * y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y < x + z) == (y < z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + z < y + z) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x < y && y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 !(y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x == y) == (x < y || y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x <= y) == (y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x <= y && y < x)
      #|  \226\136\128 x : Real, (-x < real_of_num(0)) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, (real_of_num(0) < -x) == (x < real_of_num(0))
      #|  \226\136\128 x : Real, (-x <= real_of_num(0)) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, (real_of_num(0) <= -x) == (x <= real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x == y || x < y || y < x
      #|  \226\136\128 x : Real, x == real_of_num(0) || real_of_num(0) < x || real_of_num(0) < -x
      #|  real_of_num(0) <= real_of_num(1)
      #|  real_of_num(0) < real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y <= x + z) == (y <= z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + z <= y + z) == (x <= y)
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w < x && y < z \226\134\146 w + y < x + z
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w <= x && y <= z \226\134\146 w + y <= x + z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x < y) == (real_of_num(0) < x + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x < -y) == (x + y < real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (y < x + -z) == (y + z < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + -y < z) == (x < z + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x <= y \226\134\146 x < y + real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - y + y == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, y + (x - y) == x
      #|  \226\136\128 x : Real, x - x == real_of_num(0)
      #|  \226\136\128 x : Real, (real_of_num(0) <= x + x) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, (-x <= x) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, (x <= -x) == (x <= real_of_num(0))
      #|  \226\136\128 x : Real, (-x == real_of_num(0)) == (x == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x + y - x == y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x == y) == (x == -y)
      #|  \226\136\128 x : Real, -x == -real_of_num(1) * x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 !(x == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x <= x + y) == (real_of_num(0) <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (y <= x + y) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x < x + y) == (real_of_num(0) < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (y < x + y) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - y - x == -y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y < z) == (x < z - y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y < z) == (x < z + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x < y - z) == (x + z < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x <= y - z) == (x + z <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y <= z) == (x <= z + y)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a + b - (c + d) == a - c + (b - d)
      #|  \226\136\128 x : Real, real_of_num(0) - x == -x
      #|  \226\136\128 x : Real, x - real_of_num(0) == x
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w <= x && y < z \226\134\146 w + y < x + z
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w < x && y <= z \226\134\146 w + y < x + z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x - y == -(x + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - -y == x + y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x - -y == y - x
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a - b + (b - c) == a - c
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x == y - z) == (x + z == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y == z) == (x == z + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - (x - y) == y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - (x + y) == -y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x == y \226\134\146 x <= y
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y) * (x - y) == x * x - y * y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x == -y) == (x == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x < -y) == (y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x * (y - z) == x * y - x * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y) * z == x * z - y * z
      #|  \226\136\128 x : Real, (abs(x) == real_of_num(0)) == (x == real_of_num(0))
      #|  abs(real_of_num(0)) == real_of_num(0)
      #|  abs(real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x + y) <= abs(x) + abs(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, abs(x) + abs(y - x) <= z \226\134\146 abs(y) <= z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, abs(x) + abs(y - x) < z \226\134\146 abs(y) < z
      #|  \226\136\128 x : Real, real_of_num(0) <= abs(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) == abs(y - x)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) == (real_of_num(0) < abs(x))
      #|  \226\136\128 x : Real, abs(abs(x)) == abs(x)
      #|  \226\136\128 x : Real, x <= abs(x)
      #|  \226\136\128 x : Real, (abs(x) == x) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 d : Real, (real_of_num(0) < d && x - d < y && y < x + d) == (abs(y - x) < d)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 d : Real, abs(x - y) < d \226\134\146 y < x + d
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < abs(y) \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 x : Real, x == real_of_num(0) || real_of_num(0) < abs(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < z && abs(y - x) < z - x \226\134\146 y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < y \226\134\146 real_of_num(0) < x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < -y \226\134\146 x < real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 h : Real, abs(h) < abs(y) - abs(x) \226\134\146 abs(x + h) < abs(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x) - abs(y) <= abs(x - y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(abs(x) - abs(y)) <= abs(x - y)
      #|  \226\136\128 x0 : Real, \226\136\128 x : Real, \226\136\128 y0 : Real, \226\136\128 y : Real, x0 < y0 && real_of_num(2) * abs(x - x0) < y0 - x0 && real_of_num(2) * abs(y - y0) < y0 - x0 \226\134\146 x < y
      #|  \226\136\128 x : Real, \226\136\128 k : Real, (abs(x) <= k) == (-k <= x && x <= k)
      #|  \226\136\128 x : Real, \226\136\128 k : Real, (-k <= x && x <= k) == (abs(x) <= k)
      #|  \226\136\128 x : Real, \226\136\128 k : Real, (-k < x && x < k) == (abs(x) < k)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, min(x, y) == -max(-x, -y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, max(x, y) == -min(-x, -y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x <= max(x, y) && y <= max(x, y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, min(x, y) <= x && min(x, y) <= y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, max(x, y) == max(y, x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, min(x, y) == min(y, x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (z <= max(x, y)) == (z <= x || z <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (z <= min(x, y)) == (z <= x && z <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (z < max(x, y)) == (z < x || z < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (z < min(x, y)) == (z < x && z < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (max(x, y) <= z) == (x <= z && y <= z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (min(x, y) <= z) == (x <= z || y <= z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (max(x, y) < z) == (x < z && y < z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (min(x, y) < z) == (x < z || y < z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, max(x, max(y, z)) == max(max(x, y), z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, min(x, min(y, z)) == min(min(x, y), z)
      #|  max((x : Real), (y : Real)) == max(y, x) && max(max(x, y), (z : Real)) == max(x, max(y, z)) && max(x, max(y, z)) == max(y, max(x, z)) && max(x, x) == x && max(x, max(x, y)) == max(x, y)
      #|  min((x : Real), (y : Real)) == min(y, x) && min(min(x, y), (z : Real)) == min(x, min(y, z)) && min(x, min(y, z)) == min(y, min(x, z)) && min(x, x) == x && min(x, min(x, y)) == min(x, y)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x * y) == abs(x) * abs(y)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x \226\134\146 real_of_num(0) <= pow(x, n)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) < x \226\134\146 real_of_num(0) < pow(x, n)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(pow(x, n)) == pow(abs(x), n)
      #|  ((x : Real) <= (y : Real)) == (real_of_num(0) <= y - x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= x && y <= z \226\134\146 x * y <= x * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= y && real_of_num(0) <= z \226\134\146 x * z <= y * z
      #|  ((x : Real) < (y : Real)) == (real_of_num(0) < y - x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x && y < z \226\134\146 x * y < x * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < y && real_of_num(0) < z \226\134\146 x * z < y * z
      #|  ((x : Real) == (y : Real)) == (x - y == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x * y == x * z) == (x == real_of_num(0) || y == z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x * z == y * z) == (x == y || z == real_of_num(0))
      #|  (y : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x * y == real_of_num(1) \226\134\146 inv(y) == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x * y == real_of_num(1) \226\134\146 inv(x) == y
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, inv(inv(x)) == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (inv(x) == inv(y)) == (x == y)
      #|  \226\136\128 x : Real, (inv(x) == real_of_num(0)) == (x == real_of_num(0))
      #|  real_of_num(0) < (x : Real)
      #|  inv((x : Real)) * x == real_of_num(1)
      #|  real_of_num(0) < -inv((x : Real)) * x
      #|  inv((x : Real))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_of_num(0) < inv(x)
      #|  \226\136\128 x : Real, (real_of_num(0) < inv(x)) == (real_of_num(0) < x)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, inv(-x) == -inv(x)
      #|  \226\136\128 x : Real, (real_of_num(0) <= inv(x)) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 real_of_num(0) <= inv(x)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 x * inv(x) == real_of_num(1)
      #|  inv(real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 x : Real, (inv(x) == real_of_num(1)) == (x == real_of_num(1))
      #|  \226\136\128 x : Real, x / real_of_num(1) == x
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 x / x == real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(y == real_of_num(0)) \226\134\146 x / y * y == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(y == real_of_num(0)) \226\134\146 y * (x / y) == x
      #|  op_star((y : Real))
      #|  (y : Real) == real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x / y == real_of_num(1)) == (x == y && !(x == real_of_num(0)) && !(y == real_of_num(0)))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, abs(inv(x)) == inv(abs(x))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x / y) == abs(x) / abs(y)
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)
      #|  (y : Real) == real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, inv(x * y) == inv(x) * inv(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, inv(x / y) == y / x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 n : Num, pow(x * y, n) == pow(x, n) * pow(y, n)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, pow(inv(x), n) == inv(pow(x, n))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, inv(pow(x, n)) == pow(inv(x), n)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 n : Num, pow(x / y, n) == pow(x, n) / pow(y, n)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x / y == real_of_num(0)) == (x == real_of_num(0) || y == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, pow(x, m + n) == pow(x, m) * pow(x, n)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, !(x == real_of_num(0)) \226\134\146 !(pow(x, n) == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, !(x == real_of_num(0)) && m <= n \226\134\146 pow(x, n - m) == pow(x, n) / pow(x, m)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x && x * y < x * z \226\134\146 y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z && x * z < y * z \226\134\146 x < y
      #|  (x : Real)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x && x * y <= x * z \226\134\146 y <= z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z && x * z <= y * z \226\134\146 x <= y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x * z <= y * z) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (z * x <= z * y) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x * z < y * z) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (z * x < z * y) == (x < y)
      #|  (\226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x \226\134\146 (real_of_num(0) <= x * y) == (real_of_num(0) <= y)) && (\226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (real_of_num(0) <= x * y) == (real_of_num(0) <= x))
      #|  (\226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x \226\134\146 (real_of_num(0) < x * y) == (real_of_num(0) < y)) && (\226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (real_of_num(0) < x * y) == (real_of_num(0) < x))
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_of_num(0) < x * y) == (real_of_num(0) < x && real_of_num(0) < y || x < real_of_num(0) && y < real_of_num(0))
      #|  (real_of_num(0) <= (x : Real)) == (x == real_of_num(0) || real_of_num(0) < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_of_num(0) <= x * y) == (x == real_of_num(0) || y == real_of_num(0) || real_of_num(0) < x && real_of_num(0) < y || x < real_of_num(0) && y < real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x <= y / z) == (x * z <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z <= y) == (x <= y * z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x < y / z) == (x * z < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z < y) == (x < y * z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x == y / z) == (x * z == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z == y) == (x == y * z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z < y / z) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z <= y / z) == (x <= y)
      #|  \226\136\128 x : Real, real_of_num(2) * x == x + x
      #|  \226\136\128 x : Real, \226\136\128 n : Num, (pow(x, n) == real_of_num(0)) == (x == real_of_num(0) && !(n == 0))
      #|  (y : Real)
      #|  (w : Real) * (z : Real)
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= w && w <= x && real_of_num(0) <= y && y <= z \226\134\146 w * y <= x * z
      #|  (y : Real)
      #|  (w : Real) * (z : Real)
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= w && w < x && real_of_num(0) <= y && y < z \226\134\146 w * y < x * z
      #|  \226\136\128 x : Real, (real_of_num(0) < x * x) == !(x == real_of_num(0))
      #|  1
      #|  \226\136\128 x : Real, pow(x, 1) == x
      #|  \226\136\128 n : Num, pow(real_of_num(1), n) == real_of_num(1)
      #|  inv((x : Real)) * x == real_of_num(1) && inv((y : Real)) * y == real_of_num(1)
      #|  (x : Real) * (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && x < y \226\134\146 inv(y) < inv(x)
      #|  (x : Real) == (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && x <= y \226\134\146 inv(y) <= inv(x)
      #|  (x : Real)
      #|  inv((y : Real))
      #|  (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y && inv(y) < x \226\134\146 inv(x) < y
      #|  inv((y : Real))
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && x < inv(y) \226\134\146 y < inv(x)
      #|  (x : Real)
      #|  inv((y : Real))
      #|  (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y && inv(y) <= x \226\134\146 inv(x) <= y
      #|  inv((y : Real))
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && x <= inv(y) \226\134\146 y <= inv(x)
      #|  \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 inv(x) <= real_of_num(1)
      #|  \226\136\128 x : Real, real_of_num(0) < x && x <= real_of_num(1) \226\134\146 real_of_num(1) <= inv(x)
      #|  \226\136\128 x : Real, real_of_num(1) < x \226\134\146 inv(x) < real_of_num(1)
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < real_of_num(1) \226\134\146 real_of_num(1) < inv(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x == real_of_num(0)) && !(y == real_of_num(0)) \226\134\146 inv(x) - inv(y) == (y - x) / (x * y)
      #|  real_of_num(0) < (d : Real)
      #|  real_of_num(2)
      #|  !(real_of_num(2) == real_of_num(0))
      #|  real_of_num(0) < real_of_num(2)
      #|  (d : Real) / real_of_num(2)
      #|  \226\136\128 d : Real, real_of_num(0) < d \226\134\146 (\226\136\131 e : Real, real_of_num(0) < e && e < d)
      #|  (e : Real)
      #|  (e : Real)
      #|  (d2 : Real)
      #|  (d1 : Real)
      #|  (d2 : Real)
      #|  (d1 : Real)
      #|  \226\136\128 d1 : Real, \226\136\128 d2 : Real, real_of_num(0) < d1 && real_of_num(0) < d2 \226\134\146 (\226\136\131 e : Real, real_of_num(0) < e && e < d1 && e < d2)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x <= y \226\134\146 pow(x, n) <= pow(y, n)
      #|  (x : Real)
      #|  real_of_num(1)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 real_of_num(1) <= pow(x, n)
      #|  real_of_num(1)
      #|  (x : Real)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) <= x && x <= real_of_num(1) \226\134\146 pow(x, n) <= real_of_num(1)
      #|  real_of_num(1)
      #|  (d : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(1) <= x && m <= n \226\134\146 pow(x, m) <= pow(x, n)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, !(n == 0) && real_of_num(0) <= x && x < y \226\134\146 pow(x, n) < pow(y, n)
      #|  (x : Real)
      #|  real_of_num(1)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, !(n == 0) && real_of_num(1) < x \226\134\146 real_of_num(1) < pow(x, n)
      #|  real_of_num(1)
      #|  (x : Real)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, !(n == 0) && real_of_num(0) <= x && x < real_of_num(1) \226\134\146 pow(x, n) < real_of_num(1)
      #|  (d : Num)
      #|  (d : Num)
      #|  real_of_num(1)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(1) < x && m < n \226\134\146 pow(x, m) < pow(x, n)
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, pow(pow(x, m), n) == pow(x, m * n)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !(z == real_of_num(0)) && x * z == y * z \226\134\146 x == y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !(z == real_of_num(0)) && z * x == z * y \226\134\146 x == y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 real_of_num(0) < x / y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 real_of_num(0) <= x / y
      #|  !((n : Num) <= (m : Num))
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, !(x == real_of_num(0)) \226\134\146 pow(x, m) / pow(x, n) == (if n <= m { pow(x, m - n) } else { inv(pow(x, n - m)) })
      #|  (m : Num) <= (n : Num)
      #|  \226\136\128 x : Real, \226\136\128 m : Num, \226\136\128 n : Num, !(x == real_of_num(0)) \226\134\146 pow(x, m) / pow(x, n) == (if n < m { pow(x, m - n) } else { inv(pow(x, n - m)) })
      #|  \226\136\128 n : Num, real_of_num(0) < pow(real_of_num(2), n)
      #|  pow(real_of_num(2), 0)
      #|  \226\136\128 n : Num, real_of_num(1) <= pow(real_of_num(2), n)
      #|  \226\136\128 x : Real, pow(abs(x), 2) == pow(x, 2)
      #|  2 == 0
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (abs(x) <= abs(y)) == (pow(x, 2) <= pow(y, 2))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (abs(x) < abs(y)) == (pow(x, 2) < pow(y, 2))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (abs(x) == abs(y)) == (pow(x, 2) == pow(y, 2))
      #|  \226\136\128 x : Real, real_of_num(0) <= pow(x, 2)
      #|  (real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))
      #|  \226\136\128 x : Real, (real_of_num(0) < pow(x, 2)) == !(x == real_of_num(0))
      #|  (x : Real) + (y : Real) == real_of_num(0) \226\134\146 real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 x == real_of_num(0) && y == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (pow(x, 2) + pow(y, 2) == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))
      #|  \226\136\128 n : Num, pow(real_of_num(0), n) == (if n == 0 { real_of_num(1) } else { real_of_num(0) })
      #|  (n : Num) <= (m : Num)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) <= x && x <= real_of_num(1) && n <= m \226\134\146 pow(x, m) <= pow(x, n)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, !(n == 0) && real_of_num(0) <= y && pow(x, n) <= pow(y, n) \226\134\146 x <= y
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= y && pow(x, n) < pow(y, n) \226\134\146 x < y
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, !(n == 0) && real_of_num(0) <= x && real_of_num(0) <= y && pow(x, n) == pow(y, n) \226\134\146 x == y
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, !(n == 0) && pow(x, n) == pow(y, n) \226\134\146 abs(x) == abs(y)
      #|  (n : Num)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, !(n == 0) && pow(x, n) == real_of_num(1) \226\134\146 abs(x) == real_of_num(1)
      #|  abs((x : Real)) == (a : Real) \226\134\146 x == a || x == -a
      #|  abs((x : Real)) == real_of_num(1)
      #|  (n : Num) == 0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, (pow(x, n) == real_of_num(1)) == (abs(x) == real_of_num(1) && (x < real_of_num(0) \226\134\146 EVEN(n)) || n == 0)
      #|  pow(-(y : Real), (n : Num)) < pow(-(x : Real), n)
      #|  real_of_num(0) < pow(-(x : Real), (n : Num)) && real_of_num(0) <= pow((y : Real), n)
      #|  real_of_num(0) <= (x : Real) || real_of_num(0) < -x
      #|  (y : Real)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, x < y && ODD(n) \226\134\146 pow(x, n) < pow(y, n)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, x <= y && ODD(n) \226\134\146 pow(x, n) <= pow(y, n)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, ODD(n) \226\134\146 (pow(x, n) < pow(y, n)) == (x < y)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, ODD(n) \226\134\146 (pow(x, n) <= pow(y, n)) == (x <= y)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, ODD(n) \226\134\146 (pow(x, n) == pow(y, n)) == (x == y)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, ODD(n) && pow(x, n) == pow(y, n) \226\134\146 x == y
      #|  (m : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, (pow(x, n) == pow(y, n)) == (if EVEN(n) { n == 0 || abs(x) == abs(y) } else { x == y })
      #|  \226\136\128 x : Real, \226\136\128 n : Num, EVEN(n) \226\134\146 pow(abs(x), n) == pow(x, n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(MOD(m, n)) == real_of_num(m) - real_of_num(DIV(m, n)) * real_of_num(n)
      #|  real_of_num((n : Num))
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(DIV(m, n)) == real_of_num(m) / real_of_num(n) - real_of_num(MOD(m, n)) / real_of_num(n)
      #|  (u : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, x < a && y < (b : Real) && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 u * x + v * y < u * a + v * b
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, x <= a && y <= (b : Real) && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 u * x + v * y <= u * a + v * b
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, x < a && y < a && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 u * x + v * y < a
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, x <= a && y <= a && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 u * x + v * y <= a
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, a < x && a < y && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 a < u * x + v * y
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 u : Real, \226\136\128 v : Real, a <= x && a <= y && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 a <= u * x + v * y
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 u : Real, \226\136\128 v : Real, a <= x && x <= b && a <= y && y <= b && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 a <= u * x + v * y && u * x + v * y <= b
      #|  (u : Real) + (v : Real) == real_of_num(1) \226\134\146 u * (a : Real) + v * a == a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 u : Real, \226\136\128 v : Real, a < x && x < b && a < y && y < b && real_of_num(0) <= u && real_of_num(0) <= v && u + v == real_of_num(1) \226\134\146 a < u * x + v * y && u * x + v * y < b
      #|  (\226\136\128 x : Real, (\226\136\131 n : Num, x == real_of_num(n)) \226\134\146 (P : (Real) -> Bool)(x)) == (\226\136\128 n : Num, P(real_of_num(n)))
      #|  !((M : Real) <= M - real_of_num(1))
      #|  (y : Real) => \226\136\131 n : Num, y == real_of_num(n)
      #|  \226\136\128 x : Real, \226\136\131 n : Num, x <= real_of_num(n)
      #|  (x : Real) <= (n : Real) \226\134\146 x < n + real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\131 n : Num, x < real_of_num(n)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 (\226\136\128 y : Real, \226\136\131 n : Num, y < real_of_num(n) * x)
      #|  inv((e : Real))
      #|  \226\136\128 e : Real, (real_of_num(0) < e) == (\226\136\131 n : Num, !(n == 0) && real_of_num(0) < inv(real_of_num(n)) && inv(real_of_num(n)) < e)
      #|  (real_of_num(1) + ((n : Real) + real_of_num(1)) * (x : Real) <= (real_of_num(1) + x) * (real_of_num(1) + n * x)) == (real_of_num(0) <= n * (x * x))
      #|  real_of_num(0) <= (x : Real) \226\134\146 real_of_num(0) <= real_of_num(1) + x
      #|  (real_of_num(1) + (x : Real)) * (real_of_num(1) + real_of_num((n : Num)) * x)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x \226\134\146 real_of_num(1) + real_of_num(n) * x <= pow(real_of_num(1) + x, n)
      #|  real_of_num(1) < (x : Real) \226\134\146 real_of_num(0) <= x - real_of_num(1)
      #|  (x : Real) < (y : Real) \226\134\146 x < real_of_num(1) + y
      #|  real_of_num(1) + real_of_num((n : Num)) * ((x : Real) - real_of_num(1))
      #|  (n : Num)
      #|  (y : Real)
      #|  (x : Real) - real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(1) < x \226\134\146 (\226\136\131 n : Num, y < pow(x, n))
      #|  \226\136\128 x : Real, \226\136\131 n : Num, x < pow(real_of_num(2), n)
      #|  inv((y : Real))
      #|  inv(real_of_num(1)) < inv((x : Real))
      #|  real_of_num(0) < (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y && x < real_of_num(1) \226\134\146 (\226\136\131 n : Num, pow(x, n) < y)
      #|  (real_sgn : (Real) -> Real)((x : Real)) == (if real_of_num(0) < x { real_of_num(1) } else { if x < real_of_num(0) { -real_of_num(1) } else { real_of_num(0) } })
      #|  real_sgn(real_of_num(0)) == real_of_num(0)
      #|  \226\136\128 x : Real, real_sgn(-x) == -real_sgn(x)
      #|  \226\136\128 x : Real, real_sgn(x) * abs(x) == x
      #|  \226\136\128 x : Real, real_sgn(x) * x == abs(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x == y) == (real_sgn(x) == real_sgn(y) && abs(x) == abs(y))
      #|  \226\136\128 x : Real, abs(real_sgn(x)) == real_sgn(abs(x))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, real_sgn(x) == x / abs(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_sgn(x * y) == real_sgn(x) * real_sgn(y)
      #|  ((x : Real) < real_of_num(0)) == (real_of_num(0) < -x)
      #|  \226\136\128 x : Real, real_sgn(inv(x)) == real_sgn(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_sgn(x / y) == real_sgn(x) / real_sgn(y)
      #|  (\226\136\128 x : Real, (real_sgn(x) == real_of_num(0)) == (x == real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) == real_of_num(1)) == (x > real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) == -real_of_num(1)) == (x < real_of_num(0)))
      #|  \226\136\128 x : Real, real_sgn(x) == real_of_num(0) || real_sgn(x) == real_of_num(1) || real_sgn(x) == -real_of_num(1)
      #|  (\226\136\128 x : Real, (real_of_num(0) <= real_sgn(x)) == (real_of_num(0) <= x)) && (\226\136\128 x : Real, (real_of_num(0) < real_sgn(x)) == (real_of_num(0) < x)) && (\226\136\128 x : Real, (real_of_num(0) >= real_sgn(x)) == (real_of_num(0) >= x)) && (\226\136\128 x : Real, (real_of_num(0) > real_sgn(x)) == (real_of_num(0) > x)) && (\226\136\128 x : Real, (real_of_num(0) == real_sgn(x)) == (real_of_num(0) == x)) && (\226\136\128 x : Real, (real_sgn(x) <= real_of_num(0)) == (x <= real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) < real_of_num(0)) == (x < real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) >= real_of_num(0)) == (x >= real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) > real_of_num(0)) == (x > real_of_num(0))) && (\226\136\128 x : Real, (real_sgn(x) == real_of_num(0)) == (x == real_of_num(0)))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_sgn(pow(x, n)) == pow(real_sgn(x), n)
      #|  real_of_num(0) <= (x : Real) \226\134\146 (x <= real_of_num(0)) == (x == real_of_num(0))
      #|  \226\136\128 x : Real, real_sgn(pow(x, 2)) == real_sgn(abs(x))
      #|  \226\136\128 x : Real, real_sgn(real_sgn(x)) == real_sgn(x)
      #|  \226\136\128 x : Real, inv(real_sgn(x)) == real_sgn(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_sgn(x) == real_sgn(y)) == (x == y || abs(x - y) < max(abs(x), abs(y)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_sgn(x) == real_sgn(y)) == ((x == real_of_num(0)) == (y == real_of_num(0)) && (x > real_of_num(0)) == (y > real_of_num(0)) && (x < real_of_num(0)) == (y < real_of_num(0)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_sgn(x) == real_sgn(y)) == ((x == real_of_num(0) \226\134\146 y == real_of_num(0)) && (x > real_of_num(0) \226\134\146 y > real_of_num(0)) && (x < real_of_num(0) \226\134\146 y < real_of_num(0)))
      #|  (\226\136\128 x : Real, \226\136\128 y : Real, (P : (Real, Real) -> Bool)(x, y) == P(y, x)) && (\226\136\128 x : Real, \226\136\128 y : Real, x <= y \226\134\146 P(x, y)) \226\134\146 (\226\136\128 x : Real, \226\136\128 y : Real, P(x, y))
      #|  (\226\136\128 x : Real, (P : (Real, Real) -> Bool)(x, x)) && (\226\136\128 x : Real, \226\136\128 y : Real, P(x, y) == P(y, x)) && (\226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 P(x, y)) \226\134\146 (\226\136\128 x : Real, \226\136\128 y : Real, P(x, y))
      #|  \226\136\128 P : (Real, Real, Real) -> Bool, (\226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, P(x, y, z) \226\134\146 P(y, x, z) && P(x, z, y)) && (\226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= y && y <= z \226\134\146 P(x, y, z)) \226\134\146 (\226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, P(x, y, z))
      #|  (sqrt : (Real) -> Real)((x : Real)) == select((y : Real) => real_sgn(y) == real_sgn(x) && pow(y, 2) == abs(x))
      #|  (pow((x : Real), 2) == pow((y : Real), 2)) == ((x - y) * (x - -y) == real_of_num(0))
      #|  (z : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= y && pow(y, 2) == x \226\134\146 sqrt(x) == y
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 sqrt(pow(x, 2)) == x
      #|  sqrt(real_of_num(0)) == real_of_num(0)
      #|  sqrt(real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 x : Real, sqrt(pow(x, 2)) == abs(x)
      #|  (a : Real) * inv((b : Real)) * (c : Real) == a * c * inv(b)
      #|  ((y : Real) - pow((x : Real), 2)) / (real_of_num(2) * abs(x) + real_of_num(2)) * (real_of_num(2) * abs(x) + real_of_num(1))
      #|  pow((x : Real) + (e : Real), 2) == e * (real_of_num(2) * x + e) + pow(x, 2)
      #|  real_of_num(0) < (y : Real) \226\134\146 (x : Real) < abs(x) + min(real_of_num(1), y)
      #|  real_of_num(0) < real_of_num(2) * abs((x : Real)) + real_of_num(1) && real_of_num(0) < real_of_num(2) * abs(x) + real_of_num(2)
      #|  abs((x : Real)) + min(real_of_num(1), ((y : Real) - pow(x, 2)) / (real_of_num(2) * abs(x) + real_of_num(2)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, pow(x, 2) < y \226\134\146 (\226\136\131 x' : Real, x < x' && pow(x', 2) < y)
      #|  inv((x' : Real))
      #|  (x' : Real)
      #|  inv((y : Real))
      #|  inv(abs((x : Real)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y && y < pow(x, 2) \226\134\146 (\226\136\131 x' : Real, x' < x && real_of_num(0) < x' && y < pow(x', 2))
      #|  abs((z : Real)) <= (s : Real) \226\134\146 s < z \226\134\146 false
      #|  (z : Real)
      #|  (y : Real)
      #|  (s : Real)
      #|  pow((z : Real), 2)
      #|  (x : Real)
      #|  (z : Real)
      #|  real_of_num(0) < (y : Real)
      #|  (s : Real) == real_of_num(0)
      #|  (y : Real) < pow((s : Real), 2)
      #|  (y : Real)
      #|  (s : Real)
      #|  (s : Real)
      #|  real_of_num(0) < (y : Real) && real_of_num(0) < pow(y, 2) \226\134\146 y <= pow(y + real_of_num(1), 2)
      #|  pow((y : Real) + real_of_num(1), 2)
      #|  (x : Real)
      #|  (y : Real) + real_of_num(1)
      #|  real_of_num(0)
      #|  (x : Real) => real_of_num(0) <= x && pow(x, 2) <= (y : Real)
      #|  \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (\226\136\131 x : Real, pow(x, 2) == y)
      #|  (real_of_num(0) < abs((x : Real))) == !(x == real_of_num(0))
      #|  real_sgn((x : Real)) * (y : Real)
      #|  (y : Real)
      #|  abs((x : Real))
      #|  (x : Real) == real_of_num(0)
      #|  abs((y : Real))
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 (\226\136\131 y : Real, real_of_num(0) < y && pow(y, 2) == x)
      #|  \226\136\128 x : Real, real_sgn(sqrt(x)) == real_sgn(x) && pow(sqrt(x), 2) == abs(x)
      #|  (-(x : Real) == x) == (x == real_of_num(0))
      #|  (pow((x : Real), 2) == pow((y : Real), 2)) == ((x - y) * (x - -y) == real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_sgn(y) == real_sgn(x) && pow(y, 2) == abs(x) \226\134\146 sqrt(x) == y
      #|  \226\136\128 x : Real, sqrt(-x) == -sqrt(x)
      #|  \226\136\128 x : Real, real_sgn(sqrt(x)) == real_sgn(x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 real_of_num(0) <= sqrt(x) && pow(sqrt(x), 2) == x
      #|  \226\136\128 x : Real, (real_of_num(0) <= x) == (\226\136\131 y : Real, pow(y, 2) == x)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 real_of_num(0) <= sqrt(x)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 pow(sqrt(x), 2) == x
      #|  \226\136\128 x : Real, (pow(sqrt(x), 2) == x) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, sqrt(x * y) == sqrt(x) * sqrt(y)
      #|  \226\136\128 x : Real, sqrt(inv(x)) == inv(sqrt(x))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, sqrt(x / y) == sqrt(x) / sqrt(y)
      #|  \226\136\128 x : Real, (real_of_num(0) < sqrt(x)) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, (sqrt(x) == real_of_num(0)) == (x == real_of_num(0))
      #|  (real_of_num(0) <= (x : Real)) == (real_of_num(0) < x || x == real_of_num(0))
      #|  \226\136\128 x : Real, (real_of_num(0) <= sqrt(x)) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, abs(sqrt(x)) == sqrt(abs(x))
      #|  -(x : Real)
      #|  -(y : Real)
      #|  real_of_num(0)
      #|  real_of_num(0) <= (y : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  2
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x < y \226\134\146 sqrt(x) < sqrt(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 sqrt(x) < sqrt(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x <= y \226\134\146 sqrt(x) <= sqrt(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (sqrt(x) < sqrt(y)) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (sqrt(x) <= sqrt(y)) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (sqrt(x) == sqrt(y)) == (x == y)
      #|  \226\136\128 x : Real, (sqrt(x) == real_of_num(1)) == (x == real_of_num(1))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_of_num(0) < sqrt(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= y && x <= pow(y, 2) \226\134\146 sqrt(x) <= y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, pow(x, 2) <= y \226\134\146 x <= sqrt(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= y && x < pow(y, 2) \226\134\146 sqrt(x) < y
      #|  abs((x : Real)) < (a : Real) \226\134\146 x < a
      #|  \226\136\128 x : Real, \226\136\128 y : Real, pow(x, 2) < y \226\134\146 x < sqrt(y)
      #|  \226\136\128 n : Num, EVEN(n) \226\134\146 sqrt(pow(real_of_num(2), n)) == pow(real_of_num(2), DIV(n, 2))
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 x / sqrt(x) == sqrt(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y && x <= sqrt(y) \226\134\146 pow(x, 2) <= y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && sqrt(x) <= y \226\134\146 x <= pow(y, 2)
      #|  \226\136\128 x : Real, pow(sqrt(x), 2) == abs(x)
      #|  ((x : Real) - (y : Real)) * (x + y) == pow(x, 2) - pow(y, 2)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 abs(x - y) <= abs(x + y)
      #|  abs(sqrt((x : Real)) - sqrt((y : Real))) * abs(sqrt(x) + sqrt(y))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 abs(sqrt(x) - sqrt(y)) <= sqrt(abs(x - y))
      #|  pow((x : Real) - (y : Real), 2) == pow(x, 2) + pow(y, 2) - real_of_num(2) * (x * y)
      #|  sqrt(-(x : Real)) - sqrt((y : Real))
      #|  !(real_of_num(0) <= (x : Real)) && real_of_num(0) <= (y : Real) \226\134\146 abs(x - y) == y - x
      #|  abs((x : Real)) <= real_of_num(2) * abs(x)
      #|  sqrt(abs(-(x : Real) - -(y : Real)))
      #|  abs((x : Real) - (y : Real)) == abs(-x - -y)
      #|  real_of_num(0) <= (y : Real)
      #|  abs((x : Real)) <= real_of_num(2) * abs(x)
      #|  sqrt(abs((x : Real) - (y : Real)))
      #|  real_of_num(0) <= (x : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(sqrt(x) - sqrt(y)) <= sqrt(real_of_num(2) * abs(x - y))
      #|REAL_OF_NUM_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_OF_NUM_GE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_ge:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#>=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_OF_NUM_GT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#>:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_OF_NUM_MAX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#MAX:fun(num,fun(num,num)) m:num) n:num)))))))
      #|REAL_OF_NUM_MIN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#MIN:fun(num,fun(num,num)) m:num) n:num)))))))
      #|REAL_OF_NUM_SUC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num)))))
      #|REAL_OF_NUM_SUB =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) m:num))) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) m:num))))))))
      #|REAL_OF_NUM_SUB_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) m:num) n:num))) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) m:num)))))))))
      #|REAL_OF_NUM_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_ge:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#>=:fun(num,fun(num,bool)) m:num) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#>:fun(num,fun(num,bool)) m:num) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#MAX:fun(num,fun(num,num)) m:num) n:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#MIN:fun(num,fun(num,num)) m:num) n:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) x:num)) n:num)) (#real_of_num:fun(num,real) ((#EXP:fun(num,fun(num,num)) x:num) n:num))))))))))))))))
      #|REAL_MUL_AC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) m:real) n:real)) ((#real_mul:fun(real,fun(real,real)) n:real) m:real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) m:real) n:real)) p:real)) ((#real_mul:fun(real,fun(real,real)) m:real) ((#real_mul:fun(real,fun(real,real)) n:real) p:real)))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) m:real) ((#real_mul:fun(real,fun(real,real)) n:real) p:real))) ((#real_mul:fun(real,fun(real,real)) n:real) ((#real_mul:fun(real,fun(real,real)) m:real) p:real)))))
      #|REAL_ADD_RDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_LT_LADD_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LT_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_EQ_ADD_LCANCEL_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) x:real)) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_EQ_ADD_RCANCEL_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) y:real)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_LNEG_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_RNEG_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_neg:fun(real,real) x:real)))))))
      #|REAL_NEG_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) y:real))))))
      #|REAL_NEG_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_NEG_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_LT_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LT_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LT_ANTISYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_LT_GT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_NOT_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_NOT_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LET_ANTISYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_NEG_LT0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_NEG_GT0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_NEG_LE0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_NEG_GE0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_LT_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_LT_NEGTOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))))))
      #|REAL_LE_01 =  |- ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_LT_01 =  |- ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_LE_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real))) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LE_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LT_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) w:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LE_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) w:real) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LT_LNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_LT_RNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_LT_ADDNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) z:real)))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) y:real) z:real)) x:real))))))))
      #|REAL_LT_ADDNEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real))) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_ADD1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_SUB_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) y:real)) x:real)))))
      #|REAL_SUB_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) y:real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) x:real)))))
      #|REAL_SUB_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_LE_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) x:real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_LE_NEGL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_LE_NEGR =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_NEG_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_ADD_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) x:real)) y:real)))))
      #|REAL_NEG_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) y:real)) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_NEG_MINUS1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))
      #|REAL_LT_IMP_NE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|REAL_LE_ADDR =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))))))
      #|REAL_LE_ADDL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))
      #|REAL_LT_ADDR =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))))))
      #|REAL_LT_ADDL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))
      #|REAL_SUB_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) x:real)) (#real_neg:fun(real,real) y:real))))))
      #|REAL_LT_ADD_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_SUB_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_SUB_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) y:real))))))))
      #|REAL_LE_SUB_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) y:real))))))))
      #|REAL_LE_SUB_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_ADD2_SUB2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) a:real) b:real)) ((#real_add:fun(real,fun(real,real)) c:real) d:real))) ((#real_add:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) a:real) c:real)) ((#real_sub:fun(real,fun(real,real)) b:real) d:real)))))))))))
      #|REAL_SUB_LZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#real_neg:fun(real,real) x:real))))
      #|REAL_SUB_RZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real)))
      #|REAL_LET_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) w:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LTE_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) w:real) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_SUB_LNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) y:real)) (#real_neg:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_SUB_RNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real))) ((#real_add:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_SUB_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_SUB_TRIANGLE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) a:real) b:real)) ((#real_sub:fun(real,fun(real,real)) b:real) c:real))) ((#real_sub:fun(real,fun(real,real)) a:real) c:real))))))))
      #|REAL_EQ_SUB_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) y:real))))))))
      #|REAL_EQ_SUB_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_SUB_SUB2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) y:real)))))
      #|REAL_ADD_SUB2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) (#real_neg:fun(real,real) y:real))))))
      #|REAL_EQ_IMP_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_LT_IMP_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_DIFFSQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)) ((#real_mul:fun(real,fun(real,real)) y:real) y:real)))))))
      #|REAL_EQ_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_LT_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_SUB_LDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_SUB_RDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_ABS_ZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_ABS_0 =  |- ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|REAL_ABS_1 =  |- ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_ABS_TRIANGLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))
      #|REAL_ABS_TRIANGLE_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))) z:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) y:real)) z:real))))))))
      #|REAL_ABS_TRIANGLE_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))) z:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) y:real)) z:real))))))))
      #|REAL_ABS_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))))
      #|REAL_ABS_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))))))
      #|REAL_ABS_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real)))))
      #|REAL_ABS_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_abs:fun(real,real) x:real))) (#real_abs:fun(real,real) x:real))))
      #|REAL_ABS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) x:real) (#real_abs:fun(real,real) x:real))))
      #|REAL_ABS_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_ABS_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) d:real))))))))
      #|REAL_ABS_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))))))))
      #|REAL_ABS_STILLNZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_abs:fun(real,real) y:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_ABS_CASES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real)))))
      #|REAL_ABS_BETWEEN1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) ((#real_sub:fun(real,fun(real,real)) z:real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_ABS_SIGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))
      #|REAL_ABS_SIGN2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_neg:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_ABS_CIRCLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) h:real)) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) y:real)) (#real_abs:fun(real,real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) h:real))) (#real_abs:fun(real,real) y:real)))))))))
      #|REAL_SUB_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_ABS_SUB_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_ABS_BETWEEN2 =  |- (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y0:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x0:real) y0:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real)))) ((#real_sub:fun(real,fun(real,real)) y0:real) x0:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) y0:real)))) ((#real_sub:fun(real,fun(real,real)) y0:real) x0:real))))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))))
      #|REAL_ABS_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) k:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) k:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) k:real)))))))
      #|REAL_BOUNDS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) k:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) k:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) k:real))))))
      #|REAL_BOUNDS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) k:real)) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) k:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) k:real))))))
      #|REAL_MIN_MAX =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) (#real_neg:fun(real,real) ((#real_max:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))))))))
      #|REAL_MAX_MIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) (#real_neg:fun(real,real) ((#real_min:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))))))))
      #|REAL_MAX_MAX =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_max:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_max:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_MIN_MIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) y:real))))))
      #|REAL_MAX_SYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) ((#real_max:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_MIN_SYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) ((#real_min:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_LE_MAX =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) z:real) ((#real_max:fun(real,fun(real,real)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) z:real) x:real)) ((#real_le:fun(real,fun(real,bool)) z:real) y:real)))))))))
      #|REAL_LE_MIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) z:real) ((#real_min:fun(real,fun(real,real)) x:real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) z:real) x:real)) ((#real_le:fun(real,fun(real,bool)) z:real) y:real)))))))))
      #|REAL_LT_MAX =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) ((#real_max:fun(real,fun(real,real)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) z:real) y:real)))))))))
      #|REAL_LT_MIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) ((#real_min:fun(real,fun(real,real)) x:real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) z:real) y:real)))))))))
      #|REAL_MAX_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) z:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_MIN_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) z:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_MAX_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_MIN_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_MAX_ASSOC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) ((#real_max:fun(real,fun(real,real)) y:real) z:real))) ((#real_max:fun(real,fun(real,real)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|REAL_MIN_ASSOC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) ((#real_min:fun(real,fun(real,real)) y:real) z:real))) ((#real_min:fun(real,fun(real,real)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|REAL_MAX_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) ((#real_max:fun(real,fun(real,real)) y:real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_max:fun(real,fun(real,real)) x:real) ((#real_max:fun(real,fun(real,real)) y:real) z:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) ((#real_max:fun(real,fun(real,real)) y:real) z:real))) ((#real_max:fun(real,fun(real,real)) y:real) ((#real_max:fun(real,fun(real,real)) x:real) z:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) x:real)) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) ((#real_max:fun(real,fun(real,real)) x:real) y:real))) ((#real_max:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_MIN_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) ((#real_min:fun(real,fun(real,real)) y:real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) ((#real_min:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_min:fun(real,fun(real,real)) x:real) ((#real_min:fun(real,fun(real,real)) y:real) z:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) ((#real_min:fun(real,fun(real,real)) y:real) z:real))) ((#real_min:fun(real,fun(real,real)) y:real) ((#real_min:fun(real,fun(real,real)) x:real) z:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) x:real)) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) x:real) ((#real_min:fun(real,fun(real,real)) x:real) y:real))) ((#real_min:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_ABS_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))
      #|REAL_POW_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_POW_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_ABS_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num))))))
      #|REAL_LE_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LE_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_LT_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LT_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_EQ_MUL_LCANCEL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_EQ_MUL_RCANCEL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|REAL_MUL_LINV_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) y:real)) x:real))))))
      #|REAL_MUL_RINV_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) y:real))))))
      #|REAL_INV_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_inv:fun(real,real) x:real))) x:real)))
      #|REAL_EQ_INV2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_inv:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_INV_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_LT_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_LT_INV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_INV_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#real_inv:fun(real,real) x:real)))))
      #|REAL_LE_INV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_LE_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_MUL_RINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_inv:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_INV_1 =  |- ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_INV_EQ_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_DIV_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)))
      #|REAL_DIV_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_DIV_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) y:real)) x:real))))))
      #|REAL_DIV_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) y:real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) x:real))))))
      #|REAL_DIV_EQ_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|REAL_ABS_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_inv:fun(real,real) (#real_abs:fun(real,real) x:real)))))
      #|REAL_ABS_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))
      #|REAL_INV_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) (#real_inv:fun(real,real) y:real)))))))
      #|REAL_INV_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_POW_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) n:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_POW_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) x:real)) n:num)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_INV_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) x:real)) n:num))))))
      #|REAL_POW_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) n:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_DIV_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_POW_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_POW_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_POW_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))))))))
      #|REAL_LT_LCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LT_RCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LE_LCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LE_RCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LE_RMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LE_LMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) z:real) x:real)) ((#real_mul:fun(real,fun(real,real)) z:real) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LT_RMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LT_LMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) z:real) x:real)) ((#real_mul:fun(real,fun(real,real)) z:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LE_MUL_EQ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))))
      #|REAL_LT_MUL_EQ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))))
      #|REAL_MUL_POS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|REAL_MUL_POS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|REAL_LE_RDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) y:real)))))))))
      #|REAL_LE_LDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))))))))))
      #|REAL_LT_RDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) y:real)))))))))
      #|REAL_LT_LDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))))))))))
      #|REAL_EQ_RDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) y:real)))))))))
      #|REAL_EQ_LDIV_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) y:real)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))))))))))
      #|REAL_LT_DIV2_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LE_DIV2_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_MUL_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_add:fun(real,fun(real,real)) x:real) x:real))))
      #|REAL_POW_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_LE_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) w:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) w:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LT_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) w:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) w:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LT_SQUARE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_POW_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))
      #|REAL_POW_ONE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|REAL_LT_INV2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_inv:fun(real,real) y:real)) (#real_inv:fun(real,real) x:real)))))))
      #|REAL_LE_INV2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_inv:fun(real,real) y:real)) (#real_inv:fun(real,real) x:real)))))))
      #|REAL_LT_LINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_inv:fun(real,real) y:real)) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) y:real))))))
      #|REAL_LT_RINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_inv:fun(real,real) y:real)))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_inv:fun(real,real) x:real)))))))
      #|REAL_LE_LINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) (#real_inv:fun(real,real) y:real)) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) y:real))))))
      #|REAL_LE_RINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_inv:fun(real,real) y:real)))) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_inv:fun(real,real) x:real)))))))
      #|REAL_INV_LE_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_INV_1_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_INV_LT_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_INV_1_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_SUB_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) (#real_inv:fun(real,real) y:real))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))))))))
      #|REAL_DOWN =  |- (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#real_lt:fun(real,fun(real,bool)) e:real) d:real)))))))
      #|REAL_DOWN2 =  |- (#forall:fun(fun(real,bool),bool) (\d1:real. (#forall:fun(fun(real,bool),bool) (\d2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d1:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d2:real))) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) e:real) d1:real)) ((#real_lt:fun(real,fun(real,bool)) e:real) d2:real))))))))))
      #|REAL_POW_LE2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_POW_LE_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_POW_1_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_POW_MONO =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_POW_LT2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_POW_LT_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_POW_1_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_POW_MONO_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#<:fun(num,fun(num,bool)) m:num) n:num))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_POW_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|REAL_EQ_RCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_EQ_LCANCEL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) z:real) x:real)) ((#real_mul:fun(real,fun(real,real)) z:real) y:real)))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LT_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_LE_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_DIV_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) m:num) n:num))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) m:num))))))))))))
      #|REAL_DIV_POW2_ALT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) m:num) n:num))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) m:num))))))))))))
      #|REAL_LT_POW2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|REAL_LE_POW2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|REAL_POW2_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_LE_SQUARE_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_LT_SQUARE_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_EQ_SQUARE_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_LE_POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_LT_POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_SOS_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_POW_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) n:num)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_POW_MONO_INV =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_POW_LE2_REV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_POW_LT2_REV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_POW_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_POW_EQ_ABS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))))
      #|REAL_POW_EQ_1_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_POW_EQ_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#EVEN:fun(num,bool) n:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_POW_LT2_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#ODD:fun(num,bool) n:num))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_POW_LE2_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#ODD:fun(num,bool) n:num))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_POW_LT2_ODD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_POW_LE2_ODD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_POW_EQ_ODD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_POW_EQ_ODD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_POW_EQ_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) (#EVEN:fun(num,bool) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_EVENPOW_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_OF_NUM_MOD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#DIV:fun(num,fun(num,num)) m:num) n:num))) (#real_of_num:fun(num,real) n:num))))))))
      #|REAL_OF_NUM_DIV =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#DIV:fun(num,fun(num,num)) m:num) n:num))) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#MOD:fun(num,fun(num,num)) m:num) n:num))) (#real_of_num:fun(num,real) n:num))))))))
      #|REAL_CONVEX_BOUND2_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) a:real)) ((#real_mul:fun(real,fun(real,real)) v:real) b:real))))))))))))))
      #|REAL_CONVEX_BOUND2_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) a:real)) ((#real_mul:fun(real,fun(real,real)) v:real) b:real))))))))))))))
      #|REAL_CONVEX_BOUND_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) a:real))))))))))))
      #|REAL_CONVEX_BOUND_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) a:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) a:real))))))))))))
      #|REAL_CONVEX_BOUND_GT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_lt:fun(real,fun(real,bool)) a:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))))))))))))))
      #|REAL_CONVEX_BOUND_GE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_le:fun(real,fun(real,bool)) a:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))))))))))))))
      #|REAL_CONVEX_BOUNDS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) b:real)))))))))))))))
      #|REAL_CONVEX_BOUNDS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) v:real)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) v:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real)))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) u:real) x:real)) ((#real_mul:fun(real,fun(real,real)) v:real) y:real))) b:real)))))))))))))))
      #|REAL_ARCH_SIMPLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) n:num))))))
      #|REAL_ARCH_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) n:num))))))
      #|REAL_ARCH =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#forall:fun(fun(real,bool),bool) (\y:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) x:real)))))))))
      #|REAL_ARCH_INV =  |- (#forall:fun(fun(real,bool),bool) (\e:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) n:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) n:num))) e:real))))))))
      #|REAL_POW_LBOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) n:num)))))))
      #|REAL_ARCH_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_ARCH_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))))
      #|REAL_ARCH_POW_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) y:real))))))))
      #|real_sgn =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_SGN_0 =  |- ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|REAL_SGN_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#real_sgn:fun(real,real) x:real)))))
      #|REAL_SGN_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_sgn:fun(real,real) x:real)) (#real_abs:fun(real,real) x:real))) x:real)))
      #|REAL_SGN_ABS_ALT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_sgn:fun(real,real) x:real)) x:real)) (#real_abs:fun(real,real) x:real))))
      #|REAL_EQ_SGN_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))))))))
      #|REAL_ABS_SGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_sgn:fun(real,real) x:real))) (#real_sgn:fun(real,real) (#real_abs:fun(real,real) x:real)))))
      #|REAL_SGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) x:real) (#real_abs:fun(real,real) x:real)))))
      #|REAL_SGN_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real)))))))
      #|REAL_SGN_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_sgn:fun(real,real) x:real))))
      #|REAL_SGN_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real)))))))
      #|REAL_SGN_EQ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_gt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_SGN_CASES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_SGN_INEQS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_sgn:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_sgn:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_ge:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_sgn:fun(real,real) x:real))) ((#real_ge:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_sgn:fun(real,real) x:real))) ((#real_gt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_sgn:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_ge:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_ge:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_gt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))))
      #|REAL_SGN_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_sgn:fun(real,real) x:real)) n:num))))))
      #|REAL_SGN_POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_sgn:fun(real,real) (#real_abs:fun(real,real) x:real)))))
      #|REAL_SGN_REAL_SGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#real_sgn:fun(real,real) x:real))) (#real_sgn:fun(real,real) x:real))))
      #|REAL_INV_SGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_sgn:fun(real,real) x:real))) (#real_sgn:fun(real,real) x:real))))
      #|REAL_SGN_EQ_INEQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_max:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))))
      #|REAL_SGNS_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_gt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|REAL_SGNS_EQ_ALT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) x:real)) (#real_sgn:fun(real,real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_gt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|REAL_WLOG_LE =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((P:fun(real,fun(real,bool)) x:real) y:real)) ((P:fun(real,fun(real,bool)) y:real) x:real))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((P:fun(real,fun(real,bool)) x:real) y:real)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((P:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_WLOG_LT =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((P:fun(real,fun(real,bool)) x:real) x:real)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((P:fun(real,fun(real,bool)) x:real) y:real)) ((P:fun(real,fun(real,bool)) y:real) x:real))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((P:fun(real,fun(real,bool)) x:real) y:real))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((P:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_WLOG_LE_3 =  |- (#forall:fun(fun(fun(real,fun(real,fun(real,bool))),bool),bool) (\P:fun(real,fun(real,fun(real,bool))). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) (((P:fun(real,fun(real,fun(real,bool))) x:real) y:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) (((P:fun(real,fun(real,fun(real,bool))) y:real) x:real) z:real)) (((P:fun(real,fun(real,fun(real,bool))) x:real) z:real) y:real)))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) (((P:fun(real,fun(real,fun(real,bool))) x:real) y:real) z:real)))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (((P:fun(real,fun(real,fun(real,bool))) x:real) y:real) z:real))))))))))
      #|sqrt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#@:fun(fun(real,bool),real) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) y:real)) (#real_sgn:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) x:real))))))))
      #|SQRT_UNIQUE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) y:real))))))
      #|POW_2_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))))
      #|SQRT_0 =  |- ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|SQRT_1 =  |- ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|POW_2_SQRT_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) x:real))))
      #|SQRT_WORKS_GEN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#sqrt:fun(real,real) x:real))) (#real_sgn:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) x:real)))))
      #|SQRT_UNIQUE_GEN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) y:real)) (#real_sgn:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) x:real)))) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) y:real))))))
      #|SQRT_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#sqrt:fun(real,real) x:real)))))
      #|REAL_SGN_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_sgn:fun(real,real) (#sqrt:fun(real,real) x:real))) (#real_sgn:fun(real,real) x:real))))
      #|SQRT_WORKS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sqrt:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)))))
      #|REAL_POS_EQ_SQUARE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#?:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))))
      #|SQRT_POS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sqrt:fun(real,real) x:real)))))
      #|SQRT_POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))
      #|SQRT_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|SQRT_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))))))
      #|SQRT_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_inv:fun(real,real) (#sqrt:fun(real,real) x:real)))))
      #|SQRT_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))))))
      #|SQRT_LT_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sqrt:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|SQRT_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SQRT_LE_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sqrt:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_ABS_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#sqrt:fun(real,real) x:real))) (#sqrt:fun(real,real) (#real_abs:fun(real,real) x:real)))))
      #|SQRT_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))))))
      #|SQRT_MONO_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))))))
      #|SQRT_MONO_LT_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))
      #|SQRT_MONO_LE_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|SQRT_INJ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|SQRT_EQ_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|SQRT_POS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sqrt:fun(real,real) x:real)))))
      #|REAL_LE_LSQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) y:real))))))
      #|REAL_LE_RSQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#sqrt:fun(real,real) y:real)))))))
      #|REAL_LT_LSQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) y:real))))))
      #|REAL_LT_RSQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#sqrt:fun(real,real) y:real)))))))
      #|SQRT_EVEN_POW2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_DIV_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) x:real))) (#sqrt:fun(real,real) x:real)))))
      #|REAL_RSQRT_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#sqrt:fun(real,real) y:real))))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real))))))
      #|REAL_LSQRT_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#sqrt:fun(real,real) x:real)) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_SQRT_POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) x:real))))
      #|REAL_ABS_LE_SQRT_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))) (#sqrt:fun(real,real) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))))
      #|REAL_ABS_LE_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sqrt:fun(real,real) x:real)) (#sqrt:fun(real,real) y:real)))) (#sqrt:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))))
      #|types = real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 150
      #|arith_lin =  |- ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|arith_abs =  |- ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))
      #|arith_max =  |- ((#real_ge:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) x:real) y:real)) x:real)
      #|arith_chain =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)) ((#real_le:fun(real,fun(real,bool)) c:real) a:real)))) ((#=:fun(real,fun(real,bool)) a:real) c:real))
      #|arith_fail ! linear_ineqs: no contradiction
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _27914:bool
      #|
    ),
  )
}
