// Load-fidelity test for Library/analysis.ml: replays tools/ocaml_ref/Library_analysis_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/analysis matches Library/analysis.ml" {
  @analysis.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/analysis")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("F_IMP", () => sthm(@analysis.f_imp()))
  log.attempt("LEFT_AND_OVER_OR", () => sthm(@analysis.left_and_over_or()))
  log.attempt("RIGHT_AND_OVER_OR", () => sthm(@analysis.right_and_over_or()))
  log.attempt("LESS_EQUAL_ANTISYM", () => sthm(@analysis.less_equal_antisym()))
  log.attempt("NOT_LESS_0", () => sthm(@analysis.not_less_0()))
  log.attempt("LESS_LEMMA1", () => sthm(@analysis.less_lemma1()))
  log.attempt("LESS_SUC_REFL", () => sthm(@analysis.less_suc_refl()))
  log.attempt("LESS_EQ_SUC_REFL", () => sthm(@analysis.less_eq_suc_refl()))
  log.attempt("LESS_EQUAL_ADD", () => sthm(@analysis.less_equal_add()))
  log.attempt("LESS_EQ_IMP_LESS_SUC", () => {
    sthm(@analysis.less_eq_imp_less_suc())
  })
  log.attempt("LESS_MONO_ADD", () => sthm(@analysis.less_mono_add()))
  log.attempt("LESS_SUC", () => sthm(@analysis.less_suc()))
  log.attempt("LESS_ADD_1", () => sthm(@analysis.less_add_1()))
  log.attempt("SUC_SUB1", () => sthm(@analysis.suc_sub1()))
  log.attempt("LESS_ADD_SUC", () => sthm(@analysis.less_add_suc()))
  log.attempt("OR_LESS", () => sthm(@analysis.or_less()))
  log.attempt("NOT_SUC_LESS_EQ", () => sthm(@analysis.not_suc_less_eq()))
  log.attempt("LESS_LESS_CASES", () => sthm(@analysis.less_less_cases()))
  log.attempt("SUB_SUB", () => sthm(@analysis.sub_sub()))
  log.attempt("LESS_CASES_IMP", () => sthm(@analysis.less_cases_imp()))
  log.attempt("SUB_LESS_EQ", () => sthm(@analysis.sub_less_eq()))
  log.attempt("SUB_EQ_EQ_0", () => sthm(@analysis.sub_eq_eq_0()))
  log.attempt("SUB_LEFT_LESS_EQ", () => sthm(@analysis.sub_left_less_eq()))
  log.attempt("SUB_LEFT_GREATER_EQ", () => sthm(@analysis.sub_left_greater_eq()))
  log.attempt("LESS_0_CASES", () => sthm(@analysis.less_0_cases()))
  log.attempt("LESS_OR", () => sthm(@analysis.less_or()))
  log.attempt("SUB_OLD", () => sthm(@analysis.sub_old()))
  log.attempt("real_le", () => sthm(@analysis.real_le()))
  log.attempt("REAL_10", () => sthm(@analysis.real_10()))
  log.attempt("REAL_LDISTRIB", () => sthm(@analysis.real_ldistrib()))
  log.attempt("REAL_LT_IADD", () => sthm(@analysis.real_lt_iadd()))
  log.attempt("REAL_MUL_RID", () => sthm(@analysis.real_mul_rid()))
  log.attempt("REAL_MUL_RINV", () => sthm(@analysis.real_mul_rinv()))
  log.attempt("REAL_RDISTRIB", () => sthm(@analysis.real_rdistrib()))
  log.attempt("REAL_EQ_LADD", () => sthm(@analysis.real_eq_ladd()))
  log.attempt("REAL_EQ_RADD", () => sthm(@analysis.real_eq_radd()))
  log.attempt("REAL_ADD_LID_UNIQ", () => sthm(@analysis.real_add_lid_uniq()))
  log.attempt("REAL_ADD_RID_UNIQ", () => sthm(@analysis.real_add_rid_uniq()))
  log.attempt("REAL_LNEG_UNIQ", () => sthm(@analysis.real_lneg_uniq()))
  log.attempt("REAL_RNEG_UNIQ", () => sthm(@analysis.real_rneg_uniq()))
  log.attempt("REAL_NEG_ADD", () => sthm(@analysis.real_neg_add()))
  log.attempt("REAL_MUL_LZERO", () => sthm(@analysis.real_mul_lzero()))
  log.attempt("REAL_MUL_RZERO", () => sthm(@analysis.real_mul_rzero()))
  log.attempt("REAL_NEG_LMUL", () => sthm(@analysis.real_neg_lmul()))
  log.attempt("REAL_NEG_RMUL", () => sthm(@analysis.real_neg_rmul()))
  log.attempt("REAL_NEG_NEG", () => sthm(@analysis.real_neg_neg()))
  log.attempt("REAL_NEG_MUL2", () => sthm(@analysis.real_neg_mul2()))
  log.attempt("REAL_LT_LADD", () => sthm(@analysis.real_lt_ladd()))
  log.attempt("REAL_LT_RADD", () => sthm(@analysis.real_lt_radd()))
  log.attempt("REAL_NOT_LT", () => sthm(@analysis.real_not_lt()))
  log.attempt("REAL_LT_ANTISYM", () => sthm(@analysis.real_lt_antisym()))
  log.attempt("REAL_LT_GT", () => sthm(@analysis.real_lt_gt()))
  log.attempt("REAL_NOT_LE", () => sthm(@analysis.real_not_le()))
  log.attempt("REAL_LE_TOTAL", () => sthm(@analysis.real_le_total()))
  log.attempt("REAL_LE_REFL", () => sthm(@analysis.real_le_refl()))
  log.attempt("REAL_LE_LT", () => sthm(@analysis.real_le_lt()))
  log.attempt("REAL_LT_LE", () => sthm(@analysis.real_lt_le()))
  log.attempt("REAL_LT_IMP_LE", () => sthm(@analysis.real_lt_imp_le()))
  log.attempt("REAL_LTE_TRANS", () => sthm(@analysis.real_lte_trans()))
  log.attempt("REAL_LE_TRANS", () => sthm(@analysis.real_le_trans()))
  log.attempt("REAL_NEG_LT0", () => sthm(@analysis.real_neg_lt0()))
  log.attempt("REAL_NEG_GT0", () => sthm(@analysis.real_neg_gt0()))
  log.attempt("REAL_NEG_LE0", () => sthm(@analysis.real_neg_le0()))
  log.attempt("REAL_NEG_GE0", () => sthm(@analysis.real_neg_ge0()))
  log.attempt("REAL_LT_NEGTOTAL", () => sthm(@analysis.real_lt_negtotal()))
  log.attempt("REAL_LE_NEGTOTAL", () => sthm(@analysis.real_le_negtotal()))
  log.attempt("REAL_LE_MUL", () => sthm(@analysis.real_le_mul()))
  log.attempt("REAL_LE_SQUARE", () => sthm(@analysis.real_le_square()))
  log.attempt("REAL_LT_01", () => sthm(@analysis.real_lt_01()))
  log.attempt("REAL_LE_LADD", () => sthm(@analysis.real_le_ladd()))
  log.attempt("REAL_LE_RADD", () => sthm(@analysis.real_le_radd()))
  log.attempt("REAL_LT_ADD2", () => sthm(@analysis.real_lt_add2()))
  log.attempt("REAL_LT_ADD", () => sthm(@analysis.real_lt_add()))
  log.attempt("REAL_LT_ADDNEG", () => sthm(@analysis.real_lt_addneg()))
  log.attempt("REAL_LT_ADDNEG2", () => sthm(@analysis.real_lt_addneg2()))
  log.attempt("REAL_LT_ADD1", () => sthm(@analysis.real_lt_add1()))
  log.attempt("REAL_SUB_ADD", () => sthm(@analysis.real_sub_add()))
  log.attempt("REAL_SUB_ADD2", () => sthm(@analysis.real_sub_add2()))
  log.attempt("REAL_SUB_REFL", () => sthm(@analysis.real_sub_refl()))
  log.attempt("REAL_SUB_0", () => sthm(@analysis.real_sub_0()))
  log.attempt("REAL_LE_DOUBLE", () => sthm(@analysis.real_le_double()))
  log.attempt("REAL_LE_NEGL", () => sthm(@analysis.real_le_negl()))
  log.attempt("REAL_LE_NEGR", () => sthm(@analysis.real_le_negr()))
  log.attempt("REAL_NEG_EQ0", () => sthm(@analysis.real_neg_eq0()))
  log.attempt("REAL_NEG_0", () => sthm(@analysis.real_neg_0()))
  log.attempt("REAL_NEG_SUB", () => sthm(@analysis.real_neg_sub()))
  log.attempt("REAL_SUB_LT", () => sthm(@analysis.real_sub_lt()))
  log.attempt("REAL_SUB_LE", () => sthm(@analysis.real_sub_le()))
  log.attempt("REAL_EQ_LMUL", () => sthm(@analysis.real_eq_lmul()))
  log.attempt("REAL_EQ_RMUL", () => sthm(@analysis.real_eq_rmul()))
  log.attempt("REAL_SUB_LDISTRIB", () => sthm(@analysis.real_sub_ldistrib()))
  log.attempt("REAL_SUB_RDISTRIB", () => sthm(@analysis.real_sub_rdistrib()))
  log.attempt("REAL_NEG_EQ", () => sthm(@analysis.real_neg_eq()))
  log.attempt("REAL_NEG_MINUS1", () => sthm(@analysis.real_neg_minus1()))
  log.attempt("REAL_INV_NZ", () => sthm(@analysis.real_inv_nz()))
  log.attempt("REAL_INVINV", () => sthm(@analysis.real_invinv()))
  log.attempt("REAL_LT_IMP_NE", () => sthm(@analysis.real_lt_imp_ne()))
  log.attempt("REAL_INV_POS", () => sthm(@analysis.real_inv_pos()))
  log.attempt("REAL_LT_LMUL_0", () => sthm(@analysis.real_lt_lmul_0()))
  log.attempt("REAL_LT_RMUL_0", () => sthm(@analysis.real_lt_rmul_0()))
  log.attempt("REAL_LT_LMUL_EQ", () => sthm(@analysis.real_lt_lmul_eq()))
  log.attempt("REAL_LT_RMUL_EQ", () => sthm(@analysis.real_lt_rmul_eq()))
  log.attempt("REAL_LT_RMUL_IMP", () => sthm(@analysis.real_lt_rmul_imp()))
  log.attempt("REAL_LT_LMUL_IMP", () => sthm(@analysis.real_lt_lmul_imp()))
  log.attempt("REAL_LINV_UNIQ", () => sthm(@analysis.real_linv_uniq()))
  log.attempt("REAL_RINV_UNIQ", () => sthm(@analysis.real_rinv_uniq()))
  log.attempt("REAL_NEG_INV", () => sthm(@analysis.real_neg_inv()))
  log.attempt("REAL_INV_1OVER", () => sthm(@analysis.real_inv_1over()))
  log.attempt("REAL", () => sthm(@analysis.real()))
  log.attempt("REAL_POS", () => sthm(@analysis.real_pos()))
  log.attempt("REAL_LE", () => sthm(@analysis.real_le_v1()))
  log.attempt("REAL_LT", () => sthm(@analysis.real_lt()))
  log.attempt("REAL_INJ", () => sthm(@analysis.real_inj()))
  log.attempt("REAL_ADD", () => sthm(@analysis.real_add()))
  log.attempt("REAL_MUL", () => sthm(@analysis.real_mul()))
  log.attempt("REAL_INV1", () => sthm(@analysis.real_inv1()))
  log.attempt("REAL_DIV_LZERO", () => sthm(@analysis.real_div_lzero()))
  log.attempt("REAL_LT_NZ", () => sthm(@analysis.real_lt_nz()))
  log.attempt("REAL_NZ_IMP_LT", () => sthm(@analysis.real_nz_imp_lt()))
  log.attempt("REAL_LT_RDIV_0", () => sthm(@analysis.real_lt_rdiv_0()))
  log.attempt("REAL_LT_RDIV", () => sthm(@analysis.real_lt_rdiv()))
  log.attempt("REAL_LT_FRACTION_0", () => sthm(@analysis.real_lt_fraction_0()))
  log.attempt("REAL_LT_MULTIPLE", () => sthm(@analysis.real_lt_multiple()))
  log.attempt("REAL_LT_FRACTION", () => sthm(@analysis.real_lt_fraction()))
  log.attempt("REAL_LT_HALF1", () => sthm(@analysis.real_lt_half1()))
  log.attempt("REAL_LT_HALF2", () => sthm(@analysis.real_lt_half2()))
  log.attempt("REAL_DOUBLE", () => sthm(@analysis.real_double()))
  log.attempt("REAL_HALF_DOUBLE", () => sthm(@analysis.real_half_double()))
  log.attempt("REAL_SUB_SUB", () => sthm(@analysis.real_sub_sub()))
  log.attempt("REAL_LT_ADD_SUB", () => sthm(@analysis.real_lt_add_sub()))
  log.attempt("REAL_LT_SUB_RADD", () => sthm(@analysis.real_lt_sub_radd()))
  log.attempt("REAL_LT_SUB_LADD", () => sthm(@analysis.real_lt_sub_ladd()))
  log.attempt("REAL_LE_SUB_LADD", () => sthm(@analysis.real_le_sub_ladd()))
  log.attempt("REAL_LE_SUB_RADD", () => sthm(@analysis.real_le_sub_radd()))
  log.attempt("REAL_LT_NEG2", () => sthm(@analysis.real_lt_neg2()))
  log.attempt("REAL_LE_NEG2", () => sthm(@analysis.real_le_neg2()))
  log.attempt("REAL_SUB_LZERO", () => sthm(@analysis.real_sub_lzero()))
  log.attempt("REAL_SUB_RZERO", () => sthm(@analysis.real_sub_rzero()))
  log.attempt("REAL_LTE_ADD2", () => sthm(@analysis.real_lte_add2()))
  log.attempt("REAL_LTE_ADD", () => sthm(@analysis.real_lte_add()))
  log.attempt("REAL_LT_MUL2_ALT", () => sthm(@analysis.real_lt_mul2_alt()))
  log.attempt("REAL_SUB_LNEG", () => sthm(@analysis.real_sub_lneg()))
  log.attempt("REAL_SUB_RNEG", () => sthm(@analysis.real_sub_rneg()))
  log.attempt("REAL_SUB_NEG2", () => sthm(@analysis.real_sub_neg2()))
  log.attempt("REAL_SUB_TRIANGLE", () => sthm(@analysis.real_sub_triangle()))
  log.attempt("REAL_INV_MUL_WEAK", () => sthm(@analysis.real_inv_mul_weak()))
  log.attempt("REAL_LE_LMUL_LOCAL", () => sthm(@analysis.real_le_lmul_local()))
  log.attempt("REAL_LE_RMUL_EQ", () => sthm(@analysis.real_le_rmul_eq()))
  log.attempt("REAL_SUB_INV2", () => sthm(@analysis.real_sub_inv2()))
  log.attempt("REAL_SUB_SUB2", () => sthm(@analysis.real_sub_sub2()))
  log.attempt("REAL_MEAN", () => sthm(@analysis.real_mean()))
  log.attempt("REAL_EQ_LMUL2", () => sthm(@analysis.real_eq_lmul2()))
  log.attempt("REAL_LE_MUL2V", () => sthm(@analysis.real_le_mul2v()))
  log.attempt("REAL_LE_LDIV", () => sthm(@analysis.real_le_ldiv()))
  log.attempt("REAL_LE_RDIV", () => sthm(@analysis.real_le_rdiv()))
  log.attempt("REAL_LT_1", () => sthm(@analysis.real_lt_1()))
  log.attempt("REAL_LE_LMUL_IMP", () => sthm(@analysis.real_le_lmul_imp()))
  log.attempt("REAL_LE_RMUL_IMP", () => sthm(@analysis.real_le_rmul_imp()))
  log.attempt("REAL_INV_LT1", () => sthm(@analysis.real_inv_lt1()))
  log.attempt("REAL_LT_IMP_NZ", () => sthm(@analysis.real_lt_imp_nz()))
  log.attempt("REAL_EQ_RMUL_IMP", () => sthm(@analysis.real_eq_rmul_imp()))
  log.attempt("REAL_EQ_LMUL_IMP", () => sthm(@analysis.real_eq_lmul_imp()))
  log.attempt("REAL_FACT_NZ", () => sthm(@analysis.real_fact_nz()))
  log.attempt("REAL_POSSQ", () => sthm(@analysis.real_possq()))
  log.attempt("REAL_SUMSQ", () => sthm(@analysis.real_sumsq()))
  log.attempt("REAL_EQ_NEG", () => sthm(@analysis.real_eq_neg()))
  log.attempt("REAL_DIV_MUL2", () => sthm(@analysis.real_div_mul2()))
  log.attempt("REAL_MIDDLE1", () => sthm(@analysis.real_middle1()))
  log.attempt("REAL_MIDDLE2", () => sthm(@analysis.real_middle2()))
  log.attempt("ABS_ZERO", () => sthm(@analysis.abs_zero()))
  log.attempt("ABS_0", () => sthm(@analysis.abs_0()))
  log.attempt("ABS_1", () => sthm(@analysis.abs_1()))
  log.attempt("ABS_NEG", () => sthm(@analysis.abs_neg()))
  log.attempt("ABS_TRIANGLE", () => sthm(@analysis.abs_triangle()))
  log.attempt("ABS_POS", () => sthm(@analysis.abs_pos()))
  log.attempt("ABS_MUL", () => sthm(@analysis.abs_mul()))
  log.attempt("ABS_LT_MUL2", () => sthm(@analysis.abs_lt_mul2()))
  log.attempt("ABS_SUB", () => sthm(@analysis.abs_sub()))
  log.attempt("ABS_NZ", () => sthm(@analysis.abs_nz()))
  log.attempt("ABS_INV", () => sthm(@analysis.abs_inv()))
  log.attempt("ABS_ABS", () => sthm(@analysis.abs_abs()))
  log.attempt("ABS_LE", () => sthm(@analysis.abs_le()))
  log.attempt("ABS_REFL", () => sthm(@analysis.abs_refl()))
  log.attempt("ABS_N", () => sthm(@analysis.abs_n()))
  log.attempt("ABS_BETWEEN", () => sthm(@analysis.abs_between()))
  log.attempt("ABS_BOUND", () => sthm(@analysis.abs_bound()))
  log.attempt("ABS_STILLNZ", () => sthm(@analysis.abs_stillnz()))
  log.attempt("ABS_CASES", () => sthm(@analysis.abs_cases()))
  log.attempt("ABS_BETWEEN1", () => sthm(@analysis.abs_between1()))
  log.attempt("ABS_SIGN", () => sthm(@analysis.abs_sign()))
  log.attempt("ABS_SIGN2", () => sthm(@analysis.abs_sign2()))
  log.attempt("ABS_DIV", () => sthm(@analysis.abs_div()))
  log.attempt("ABS_CIRCLE", () => sthm(@analysis.abs_circle()))
  log.attempt("REAL_SUB_ABS", () => sthm(@analysis.real_sub_abs()))
  log.attempt("ABS_SUB_ABS", () => sthm(@analysis.abs_sub_abs()))
  log.attempt("ABS_BETWEEN2", () => sthm(@analysis.abs_between2()))
  log.attempt("ABS_BOUNDS", () => sthm(@analysis.abs_bounds()))
  log.attempt("pow", () => sthm(@analysis.pow()))
  log.attempt("POW_0", () => sthm(@analysis.pow_0()))
  log.attempt("POW_NZ", () => sthm(@analysis.pow_nz()))
  log.attempt("POW_INV", () => sthm(@analysis.pow_inv()))
  log.attempt("POW_ABS", () => sthm(@analysis.pow_abs()))
  log.attempt("POW_PLUS1", () => sthm(@analysis.pow_plus1()))
  log.attempt("POW_ADD", () => sthm(@analysis.pow_add()))
  log.attempt("POW_1", () => sthm(@analysis.pow_1()))
  log.attempt("POW_2", () => sthm(@analysis.pow_2()))
  log.attempt("POW_POS", () => sthm(@analysis.pow_pos()))
  log.attempt("POW_LE", () => sthm(@analysis.pow_le()))
  log.attempt("POW_M1", () => sthm(@analysis.pow_m1()))
  log.attempt("POW_MUL", () => sthm(@analysis.pow_mul()))
  log.attempt("REAL_LE_SQUARE_POW", () => sthm(@analysis.real_le_square_pow()))
  log.attempt("ABS_POW2", () => sthm(@analysis.abs_pow2()))
  log.attempt("REAL_LE1_POW2", () => sthm(@analysis.real_le1_pow2()))
  log.attempt("REAL_LT1_POW2", () => sthm(@analysis.real_lt1_pow2()))
  log.attempt("POW_POS_LT", () => sthm(@analysis.pow_pos_lt()))
  log.attempt("POW_2_LE1", () => sthm(@analysis.pow_2_le1()))
  log.attempt("POW_2_LT", () => sthm(@analysis.pow_2_lt()))
  log.attempt("POW_MINUS1", () => sthm(@analysis.pow_minus1()))
  log.attempt("REAL_SUP_EXISTS", () => sthm(@analysis.real_sup_exists()))
  log.attempt("sup_def", () => sthm(@analysis.sup_def()))
  log.attempt("sup", () => sthm(@analysis.sup()))
  log.attempt("REAL_SUP", () => sthm(@analysis.real_sup()))
  log.attempt("REAL_SUP_UBOUND", () => sthm(@analysis.real_sup_ubound()))
  log.attempt("SETOK_LE_LT", () => sthm(@analysis.setok_le_lt()))
  log.attempt("REAL_SUP_LE", () => sthm(@analysis.real_sup_le()))
  log.attempt("REAL_SUP_UBOUND_LE", () => sthm(@analysis.real_sup_ubound_le()))
  log.attempt("REAL_ARCH_SIMPLE", () => sthm(@analysis.real_arch_simple()))
  log.attempt("REAL_ARCH", () => sthm(@analysis.real_arch()))
  log.attempt("REAL_ARCH_LEAST", () => sthm(@analysis.real_arch_least()))
  log.attempt("REAL_POW_LBOUND", () => sthm(@analysis.real_pow_lbound()))
  log.attempt("REAL_ARCH_POW", () => sthm(@analysis.real_arch_pow()))
  log.attempt("REAL_ARCH_POW2", () => sthm(@analysis.real_arch_pow2()))
  log.attempt("sum_EXISTS", () => sthm(@analysis.sum_exists()))
  log.attempt("sum_DEF", () => sthm(@analysis.sum_def()))
  log.attempt("sum", () => sthm(@analysis.sum()))
  log.attempt("PSUM_SUM", () => sthm(@analysis.psum_sum()))
  log.attempt("PSUM_SUM_NUMSEG", () => sthm(@analysis.psum_sum_numseg()))
  log.attempt("SUM_TWO", () => sthm(@analysis.sum_two()))
  log.attempt("SUM_DIFF", () => sthm(@analysis.sum_diff()))
  log.attempt("ABS_SUM", () => sthm(@analysis.abs_sum()))
  log.attempt("SUM_LE", () => sthm(@analysis.sum_le()))
  log.attempt("SUM_EQ", () => sthm(@analysis.sum_eq()))
  log.attempt("SUM_POS", () => sthm(@analysis.sum_pos()))
  log.attempt("SUM_POS_GEN", () => sthm(@analysis.sum_pos_gen()))
  log.attempt("SUM_ABS", () => sthm(@analysis.sum_abs()))
  log.attempt("SUM_ABS_LE", () => sthm(@analysis.sum_abs_le()))
  log.attempt("SUM_ZERO", () => sthm(@analysis.sum_zero()))
  log.attempt("SUM_ADD", () => sthm(@analysis.sum_add()))
  log.attempt("SUM_CMUL", () => sthm(@analysis.sum_cmul()))
  log.attempt("SUM_NEG", () => sthm(@analysis.sum_neg()))
  log.attempt("SUM_SUB", () => sthm(@analysis.sum_sub()))
  log.attempt("SUM_SUBST", () => sthm(@analysis.sum_subst()))
  log.attempt("SUM_NSUB", () => sthm(@analysis.sum_nsub()))
  log.attempt("SUM_BOUND", () => sthm(@analysis.sum_bound()))
  log.attempt("SUM_GROUP", () => sthm(@analysis.sum_group()))
  log.attempt("SUM_1", () => sthm(@analysis.sum_1()))
  log.attempt("SUM_2", () => sthm(@analysis.sum_2()))
  log.attempt("SUM_OFFSET", () => sthm(@analysis.sum_offset()))
  log.attempt("SUM_REINDEX", () => sthm(@analysis.sum_reindex()))
  log.attempt("SUM_0", () => sthm(@analysis.sum_0()))
  log.attempt("SUM_CANCEL", () => sthm(@analysis.sum_cancel()))
  log.attempt("SUM_HORNER", () => sthm(@analysis.sum_horner()))
  log.attempt("SUM_CONST", () => sthm(@analysis.sum_const()))
  log.attempt("SUM_SPLIT", () => sthm(@analysis.sum_split()))
  log.attempt("SUM_SWAP", () => sthm(@analysis.sum_swap()))
  log.attempt("SUM_EQ_0", () => sthm(@analysis.sum_eq_0()))
  log.attempt("SUM_MORETERMS_EQ", () => sthm(@analysis.sum_moreterms_eq()))
  log.attempt("SUM_DIFFERENCES_EQ", () => sthm(@analysis.sum_differences_eq()))
  log.attempt("re_Union", () => sthm(@analysis.re_union()))
  log.attempt("re_union", () => sthm(@analysis.re_union_v1()))
  log.attempt("re_intersect", () => sthm(@analysis.re_intersect()))
  log.attempt("re_null", () => sthm(@analysis.re_null()))
  log.attempt("re_universe", () => sthm(@analysis.re_universe()))
  log.attempt("re_subset", () => sthm(@analysis.re_subset()))
  log.attempt("re_compl", () => sthm(@analysis.re_compl()))
  log.attempt("SUBSETA_REFL", () => sthm(@analysis.subseta_refl()))
  log.attempt("COMPL_MEM", () => sthm(@analysis.compl_mem()))
  log.attempt("SUBSETA_ANTISYM", () => sthm(@analysis.subseta_antisym()))
  log.attempt("SUBSETA_TRANS", () => sthm(@analysis.subseta_trans()))
  log.attempt("istopology", () => sthm(@analysis.istopology()))
  log.attempt("topology_tybij", () => sthm(@analysis.topology_tybij()))
  log.attempt("TOPOLOGY", () => sthm(@analysis.topology()))
  log.attempt("TOPOLOGY_UNION", () => sthm(@analysis.topology_union()))
  log.attempt("neigh", () => sthm(@analysis.neigh()))
  log.attempt("OPEN_OWN_NEIGH", () => sthm(@analysis.open_own_neigh()))
  log.attempt("OPEN_UNOPEN", () => sthm(@analysis.open_unopen()))
  log.attempt("OPEN_SUBOPEN", () => sthm(@analysis.open_subopen()))
  log.attempt("OPEN_NEIGH", () => sthm(@analysis.open_neigh()))
  log.attempt("closed", () => sthm(@analysis.closed()))
  log.attempt("limpt", () => sthm(@analysis.limpt()))
  log.attempt("CLOSED_LIMPT", () => sthm(@analysis.closed_limpt()))
  log.attempt("ismet", () => sthm(@analysis.ismet()))
  log.attempt("metric_tybij", () => sthm(@analysis.metric_tybij()))
  log.attempt("METRIC_ISMET", () => sthm(@analysis.metric_ismet()))
  log.attempt("METRIC_ZERO", () => sthm(@analysis.metric_zero()))
  log.attempt("METRIC_SAME", () => sthm(@analysis.metric_same()))
  log.attempt("METRIC_POS", () => sthm(@analysis.metric_pos()))
  log.attempt("METRIC_SYM", () => sthm(@analysis.metric_sym()))
  log.attempt("METRIC_TRIANGLE", () => sthm(@analysis.metric_triangle()))
  log.attempt("METRIC_NZ", () => sthm(@analysis.metric_nz()))
  log.attempt("mtop", () => sthm(@analysis.mtop()))
  log.attempt("mtop_istopology", () => sthm(@analysis.mtop_istopology()))
  log.attempt("MTOP_OPEN", () => sthm(@analysis.mtop_open()))
  log.attempt("ball", () => sthm(@analysis.ball()))
  log.attempt("BALL_OPEN", () => sthm(@analysis.ball_open()))
  log.attempt("BALL_NEIGH", () => sthm(@analysis.ball_neigh()))
  log.attempt("MTOP_LIMPT", () => sthm(@analysis.mtop_limpt()))
  log.attempt("ISMET_R1", () => sthm(@analysis.ismet_r1()))
  log.attempt("mr1", () => sthm(@analysis.mr1()))
  log.attempt("MR1_DEF", () => sthm(@analysis.mr1_def()))
  log.attempt("MR1_ADD", () => sthm(@analysis.mr1_add()))
  log.attempt("MR1_SUB", () => sthm(@analysis.mr1_sub()))
  log.attempt("MR1_ADD_LE", () => sthm(@analysis.mr1_add_le()))
  log.attempt("MR1_SUB_LE", () => sthm(@analysis.mr1_sub_le()))
  log.attempt("MR1_ADD_LT", () => sthm(@analysis.mr1_add_lt()))
  log.attempt("MR1_SUB_LT", () => sthm(@analysis.mr1_sub_lt()))
  log.attempt("MR1_BETWEEN1", () => sthm(@analysis.mr1_between1()))
  log.attempt("MR1_LIMPT", () => sthm(@analysis.mr1_limpt()))
  log.attempt("dorder", () => sthm(@analysis.dorder()))
  log.attempt("tends", () => sthm(@analysis.tends()))
  log.attempt("bounded", () => sthm(@analysis.bounded()))
  log.attempt("tendsto", () => sthm(@analysis.tendsto()))
  log.attempt("DORDER_LEMMA", () => sthm(@analysis.dorder_lemma()))
  log.attempt("DORDER_NGE", () => sthm(@analysis.dorder_nge()))
  log.attempt("DORDER_TENDSTO", () => sthm(@analysis.dorder_tendsto()))
  log.attempt("MTOP_TENDS", () => sthm(@analysis.mtop_tends()))
  log.attempt("MTOP_TENDS_UNIQ", () => sthm(@analysis.mtop_tends_uniq()))
  log.attempt("SEQ_TENDS", () => sthm(@analysis.seq_tends()))
  log.attempt("LIM_TENDS", () => sthm(@analysis.lim_tends()))
  log.attempt("LIM_TENDS2", () => sthm(@analysis.lim_tends2()))
  log.attempt("MR1_BOUNDED", () => sthm(@analysis.mr1_bounded()))
  log.attempt("NET_NULL", () => sthm(@analysis.net_null()))
  log.attempt("NET_CONV_BOUNDED", () => sthm(@analysis.net_conv_bounded()))
  log.attempt("NET_CONV_NZ", () => sthm(@analysis.net_conv_nz()))
  log.attempt("NET_CONV_IBOUNDED", () => sthm(@analysis.net_conv_ibounded()))
  log.attempt("NET_NULL_ADD", () => sthm(@analysis.net_null_add()))
  log.attempt("NET_NULL_MUL", () => sthm(@analysis.net_null_mul()))
  log.attempt("NET_NULL_CMUL", () => sthm(@analysis.net_null_cmul()))
  log.attempt("NET_ADD", () => sthm(@analysis.net_add()))
  log.attempt("NET_NEG", () => sthm(@analysis.net_neg()))
  log.attempt("NET_SUB", () => sthm(@analysis.net_sub()))
  log.attempt("NET_MUL", () => sthm(@analysis.net_mul()))
  log.attempt("NET_INV", () => sthm(@analysis.net_inv()))
  log.attempt("NET_DIV", () => sthm(@analysis.net_div()))
  log.attempt("NET_ABS", () => sthm(@analysis.net_abs()))
  log.attempt("NET_SUM", () => sthm(@analysis.net_sum()))
  log.attempt("NET_LE", () => sthm(@analysis.net_le()))
  log.attempt("tends_num_real", () => sthm(@analysis.tends_num_real()))
  log.attempt("SEQ", () => sthm(@analysis.seq()))
  log.attempt("SEQ_CONST", () => sthm(@analysis.seq_const()))
  log.attempt("SEQ_ADD", () => sthm(@analysis.seq_add()))
  log.attempt("SEQ_MUL", () => sthm(@analysis.seq_mul()))
  log.attempt("SEQ_NEG", () => sthm(@analysis.seq_neg()))
  log.attempt("SEQ_INV", () => sthm(@analysis.seq_inv()))
  log.attempt("SEQ_SUB", () => sthm(@analysis.seq_sub()))
  log.attempt("SEQ_DIV", () => sthm(@analysis.seq_div()))
  log.attempt("SEQ_UNIQ", () => sthm(@analysis.seq_uniq()))
  log.attempt("SEQ_NULL", () => sthm(@analysis.seq_null()))
  log.attempt("SEQ_SUM", () => sthm(@analysis.seq_sum()))
  log.attempt("SEQ_TRANSFORM", () => sthm(@analysis.seq_transform()))
  log.attempt("convergent", () => sthm(@analysis.convergent()))
  log.attempt("cauchy", () => sthm(@analysis.cauchy()))
  log.attempt("lim", () => sthm(@analysis.lim()))
  log.attempt("SEQ_LIM", () => sthm(@analysis.seq_lim()))
  log.attempt("subseq", () => sthm(@analysis.subseq()))
  log.attempt("SUBSEQ_SUC", () => sthm(@analysis.subseq_suc()))
  log.attempt("mono", () => sthm(@analysis.mono()))
  log.attempt("MONO_SUC", () => sthm(@analysis.mono_suc()))
  log.attempt("MAX_LEMMA", () => sthm(@analysis.max_lemma()))
  log.attempt("SEQ_BOUNDED", () => sthm(@analysis.seq_bounded()))
  log.attempt("SEQ_BOUNDED_2", () => sthm(@analysis.seq_bounded_2()))
  log.attempt("SEQ_CBOUNDED", () => sthm(@analysis.seq_cbounded()))
  log.attempt("SEQ_ICONV", () => sthm(@analysis.seq_iconv()))
  log.attempt("SEQ_NEG_CONV", () => sthm(@analysis.seq_neg_conv()))
  log.attempt("SEQ_NEG_BOUNDED", () => sthm(@analysis.seq_neg_bounded()))
  log.attempt("SEQ_BCONV", () => sthm(@analysis.seq_bconv()))
  log.attempt("SEQ_MONOSUB", () => sthm(@analysis.seq_monosub()))
  log.attempt("SEQ_SBOUNDED", () => sthm(@analysis.seq_sbounded()))
  log.attempt("SEQ_SUBLE", () => sthm(@analysis.seq_suble()))
  log.attempt("SEQ_DIRECT", () => sthm(@analysis.seq_direct()))
  log.attempt("SEQ_CAUCHY", () => sthm(@analysis.seq_cauchy()))
  log.attempt("SEQ_LE", () => sthm(@analysis.seq_le()))
  log.attempt("SEQ_LE_0", () => sthm(@analysis.seq_le_0()))
  log.attempt("SEQ_SUC", () => sthm(@analysis.seq_suc()))
  log.attempt("SEQ_ABS", () => sthm(@analysis.seq_abs()))
  log.attempt("SEQ_ABS_IMP", () => sthm(@analysis.seq_abs_imp()))
  log.attempt("SEQ_INV0", () => sthm(@analysis.seq_inv0()))
  log.attempt("SEQ_POWER_ABS", () => sthm(@analysis.seq_power_abs()))
  log.attempt("SEQ_POWER", () => sthm(@analysis.seq_power()))
  log.attempt("SEQ_HARMONIC", () => sthm(@analysis.seq_harmonic()))
  log.attempt("SEQ_SUBSEQ", () => sthm(@analysis.seq_subseq()))
  log.attempt("SEQ_POW", () => sthm(@analysis.seq_pow()))
  log.attempt("NEST_LEMMA", () => sthm(@analysis.nest_lemma()))
  log.attempt("NEST_LEMMA_UNIQ", () => sthm(@analysis.nest_lemma_uniq()))
  log.attempt("BOLZANO_LEMMA", () => sthm(@analysis.bolzano_lemma()))
  log.attempt("BOLZANO_LEMMA_ALT", () => sthm(@analysis.bolzano_lemma_alt()))
  log.attempt("sums", () => sthm(@analysis.sums()))
  log.attempt("summable", () => sthm(@analysis.summable()))
  log.attempt("suminf", () => sthm(@analysis.suminf()))
  log.attempt("SUM_SUMMABLE", () => sthm(@analysis.sum_summable()))
  log.attempt("SUMMABLE_SUM", () => sthm(@analysis.summable_sum()))
  log.attempt("SUM_UNIQ", () => sthm(@analysis.sum_uniq()))
  log.attempt("SER_UNIQ", () => sthm(@analysis.ser_uniq()))
  log.attempt("SER_0", () => sthm(@analysis.ser_0()))
  log.attempt("SER_POS_LE", () => sthm(@analysis.ser_pos_le()))
  log.attempt("SER_POS_LT", () => sthm(@analysis.ser_pos_lt()))
  log.attempt("SER_GROUP", () => sthm(@analysis.ser_group()))
  log.attempt("SER_PAIR", () => sthm(@analysis.ser_pair()))
  log.attempt("SER_OFFSET", () => sthm(@analysis.ser_offset()))
  log.attempt("SER_OFFSET_REV", () => sthm(@analysis.ser_offset_rev()))
  log.attempt("SER_POS_LT_PAIR", () => sthm(@analysis.ser_pos_lt_pair()))
  log.attempt("SER_ADD", () => sthm(@analysis.ser_add()))
  log.attempt("SER_CMUL", () => sthm(@analysis.ser_cmul()))
  log.attempt("SER_NEG", () => sthm(@analysis.ser_neg()))
  log.attempt("SER_SUB", () => sthm(@analysis.ser_sub()))
  log.attempt("SER_CDIV", () => sthm(@analysis.ser_cdiv()))
  log.attempt("SER_CAUCHY", () => sthm(@analysis.ser_cauchy()))
  log.attempt("SER_ZERO", () => sthm(@analysis.ser_zero()))
  log.attempt("SER_COMPAR", () => sthm(@analysis.ser_compar()))
  log.attempt("SER_COMPARA", () => sthm(@analysis.ser_compara()))
  log.attempt("SER_LE", () => sthm(@analysis.ser_le()))
  log.attempt("SER_LE2", () => sthm(@analysis.ser_le2()))
  log.attempt("SER_ACONV", () => sthm(@analysis.ser_aconv()))
  log.attempt("SER_ABS", () => sthm(@analysis.ser_abs()))
  log.attempt("GP_FINITE", () => sthm(@analysis.gp_finite()))
  log.attempt("GP", () => sthm(@analysis.gp()))
  log.attempt("ABS_NEG_LEMMA", () => sthm(@analysis.abs_neg_lemma()))
  log.attempt("SER_RATIO", () => sthm(@analysis.ser_ratio()))
  log.attempt("SEQ_TRUNCATION", () => sthm(@analysis.seq_truncation()))
  log.attempt("tends_real_real", () => sthm(@analysis.tends_real_real()))
  log.attempt("LIM", () => sthm(@analysis.lim_v1()))
  log.attempt("LIM_CONST", () => sthm(@analysis.lim_const()))
  log.attempt("LIM_ADD", () => sthm(@analysis.lim_add()))
  log.attempt("LIM_MUL", () => sthm(@analysis.lim_mul()))
  log.attempt("LIM_NEG", () => sthm(@analysis.lim_neg()))
  log.attempt("LIM_INV", () => sthm(@analysis.lim_inv()))
  log.attempt("LIM_SUB", () => sthm(@analysis.lim_sub()))
  log.attempt("LIM_DIV", () => sthm(@analysis.lim_div()))
  log.attempt("LIM_NULL", () => sthm(@analysis.lim_null()))
  log.attempt("LIM_SUM", () => sthm(@analysis.lim_sum()))
  log.attempt("LIM_X", () => sthm(@analysis.lim_x()))
  log.attempt("LIM_UNIQ", () => sthm(@analysis.lim_uniq()))
  log.attempt("LIM_EQUAL", () => sthm(@analysis.lim_equal()))
  log.attempt("LIM_TRANSFORM", () => sthm(@analysis.lim_transform()))
  log.attempt("diffl", () => sthm(@analysis.diffl()))
  log.attempt("contl", () => sthm(@analysis.contl()))
  log.attempt("differentiable", () => sthm(@analysis.differentiable()))
  log.attempt("DIFF_UNIQ", () => sthm(@analysis.diff_uniq()))
  log.attempt("DIFF_CONT", () => sthm(@analysis.diff_cont()))
  log.attempt("CONTL_LIM", () => sthm(@analysis.contl_lim()))
  log.attempt("CONT_X", () => sthm(@analysis.cont_x()))
  log.attempt("CONT_CONST", () => sthm(@analysis.cont_const()))
  log.attempt("CONT_ADD", () => sthm(@analysis.cont_add()))
  log.attempt("CONT_MUL", () => sthm(@analysis.cont_mul()))
  log.attempt("CONT_NEG", () => sthm(@analysis.cont_neg()))
  log.attempt("CONT_INV", () => sthm(@analysis.cont_inv()))
  log.attempt("CONT_SUB", () => sthm(@analysis.cont_sub()))
  log.attempt("CONT_DIV", () => sthm(@analysis.cont_div()))
  log.attempt("CONT_ABS", () => sthm(@analysis.cont_abs()))
  log.attempt("CONT_COMPOSE", () => sthm(@analysis.cont_compose()))
  log.attempt("IVT", () => sthm(@analysis.ivt()))
  log.attempt("IVT2", () => sthm(@analysis.ivt2()))
  log.attempt("DIFF_CONST", () => sthm(@analysis.diff_const()))
  log.attempt("DIFF_ADD", () => sthm(@analysis.diff_add()))
  log.attempt("DIFF_MUL", () => sthm(@analysis.diff_mul()))
  log.attempt("DIFF_CMUL", () => sthm(@analysis.diff_cmul()))
  log.attempt("DIFF_NEG", () => sthm(@analysis.diff_neg()))
  log.attempt("DIFF_SUB", () => sthm(@analysis.diff_sub()))
  log.attempt("DIFF_CARAT", () => sthm(@analysis.diff_carat()))
  log.attempt("DIFF_CHAIN", () => sthm(@analysis.diff_chain()))
  log.attempt("DIFF_X", () => sthm(@analysis.diff_x()))
  log.attempt("DIFF_POW", () => sthm(@analysis.diff_pow()))
  log.attempt("DIFF_XM1", () => sthm(@analysis.diff_xm1()))
  log.attempt("DIFF_INV", () => sthm(@analysis.diff_inv()))
  log.attempt("DIFF_DIV", () => sthm(@analysis.diff_div()))
  log.attempt("DIFF_SUM", () => sthm(@analysis.diff_sum()))
  log.attempt("CONT_BOUNDED", () => sthm(@analysis.cont_bounded()))
  log.attempt("CONT_BOUNDED_ABS", () => sthm(@analysis.cont_bounded_abs()))
  log.attempt("CONT_HASSUP", () => sthm(@analysis.cont_hassup()))
  log.attempt("CONT_ATTAINS", () => sthm(@analysis.cont_attains()))
  log.attempt("CONT_ATTAINS2", () => sthm(@analysis.cont_attains2()))
  log.attempt("CONT_ATTAINS_ALL", () => sthm(@analysis.cont_attains_all()))
  log.attempt("DIFF_LINC", () => sthm(@analysis.diff_linc()))
  log.attempt("DIFF_LDEC", () => sthm(@analysis.diff_ldec()))
  log.attempt("DIFF_LMAX", () => sthm(@analysis.diff_lmax()))
  log.attempt("DIFF_LMIN", () => sthm(@analysis.diff_lmin()))
  log.attempt("DIFF_LCONST", () => sthm(@analysis.diff_lconst()))
  log.attempt("INTERVAL_LEMMA_LT", () => sthm(@analysis.interval_lemma_lt()))
  log.attempt("INTERVAL_LEMMA", () => sthm(@analysis.interval_lemma()))
  log.attempt("ROLLE", () => sthm(@analysis.rolle()))
  log.attempt("MVT_LEMMA", () => sthm(@analysis.mvt_lemma()))
  log.attempt("MVT", () => sthm(@analysis.mvt()))
  log.attempt("MVT_ALT", () => sthm(@analysis.mvt_alt()))
  log.attempt("DIFF_ISCONST_END", () => sthm(@analysis.diff_isconst_end()))
  log.attempt("DIFF_ISCONST", () => sthm(@analysis.diff_isconst()))
  log.attempt("DIFF_ISCONST_END_SIMPLE", () => {
    sthm(@analysis.diff_isconst_end_simple())
  })
  log.attempt("DIFF_ISCONST_ALL", () => sthm(@analysis.diff_isconst_all()))
  log.attempt("INTERVAL_ABS", () => sthm(@analysis.interval_abs()))
  log.attempt("CONT_INJ_LEMMA", () => sthm(@analysis.cont_inj_lemma()))
  log.attempt("CONT_INJ_LEMMA2", () => sthm(@analysis.cont_inj_lemma2()))
  log.attempt("CONT_INJ_RANGE", () => sthm(@analysis.cont_inj_range()))
  log.attempt("CONT_INVERSE", () => sthm(@analysis.cont_inverse()))
  log.attempt("DIFF_INVERSE", () => sthm(@analysis.diff_inverse()))
  log.attempt("DIFF_INVERSE_LT", () => sthm(@analysis.diff_inverse_lt()))
  log.attempt("IVT_DERIVATIVE_0", () => sthm(@analysis.ivt_derivative_0()))
  log.attempt("IVT_DERIVATIVE_POS", () => sthm(@analysis.ivt_derivative_pos()))
  log.attempt("IVT_DERIVATIVE_NEG", () => sthm(@analysis.ivt_derivative_neg()))
  log.attempt("SEQ_CONT_UNIFORM", () => sthm(@analysis.seq_cont_uniform()))
  log.attempt("SER_COMPARA_UNIFORM", () => sthm(@analysis.ser_compara_uniform()))
  log.attempt("SER_COMPARA_UNIFORM_WEAK", () => {
    sthm(@analysis.ser_compara_uniform_weak())
  })
  log.attempt("CONTL", () => sthm(@analysis.contl_v1()))
  log.attempt("CONTL_SEQ", () => sthm(@analysis.contl_seq()))
  log.attempt("SUP_INTERVAL", () => sthm(@analysis.sup_interval()))
  log.attempt("CONT_UNIFORM", () => sthm(@analysis.cont_uniform()))
  log.attempt("CONT_UNIFORM_STRONG", () => sthm(@analysis.cont_uniform_strong()))
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
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..5..solved at 12
      #|0..0..0..1..4..7..28..62..98..175..306..469..729..1116..1619..2577..3946..5710..solved at 5758
      #|Warning: Benign redefinition
      #|0..0..0..solved at 3
      #|0..0..0..3..12..27..60..solved at 71
      #|0..0..1..5..14..solved at 21
      #|0..0..solved at 2
      #|0..0..1..4..9..21..solved at 29
      #|0..0..1..5..13..27..57..95..solved at 104
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..11..34..84..193..424..970..solved at 1151
      #|0..0..1..2..3..11..21..31..63..101..139..solved at 265
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..34..49..69..109..168..243..solved at 373
      #|0..0..1..2..4..7..10..18..29..42..94..158..316..581..1094..1913..3693..solved at 3718
      #|0..0..2..5..12..29..55..solved at 62
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..0..2..5..8..18..30..46..82..120..161..246..339..solved at 357
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..0..0..4..10..19..29..42..56..82..108..167..240..353..486..683..solved at 745
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..5..12..solved at 19
      #|0..0..1..2..5..12..21..35..64..109..193..349..solved at 498
      #|0..0..1..2..6..13..solved at 20
      #|0..0..1..3..6..11..18..29..42..solved at 52
      #|0..0..solved at 2
      #|0..0..1..3..5..8..solved at 14
      #|0..0..0..3..6..9..16..23..30..solved at 43
      #|0..0..1..2..3..7..13..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..5..8..12..solved at 19
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..10..28..59..143..267..501..896..1553..2724..5081..solved at 7620
      #|0..0..1..10..32..71..178..solved at 203
      #|0..0..0..5..24..64..176..352..665..1173..2045..3449..solved at 4190
      #|0..0..1..11..42..96..solved at 122
      #|0..0..1..2..3..7..13..23..40..63..102..160..256..376..592..854..1310..1869..2906..4294..solved at 4901
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..6..15..solved at 20
      #|0..0..1..2..5..9..14..25..40..solved at 55
      #|0..0..0..3..6..9..14..19..26..36..46..56..66..76..86..96..106..126..189..252..solved at 270
      #|0..0..1..3..8..solved at 14
      #|0..0..1..solved at 4
      #|0..0..0..3..6..9..12..15..20..25..30..35..40..45..50..55..60..solved at 73
      #|0..0..solved at 2
      #|0..0..1..5..10..15..20..25..30..35..66..97..128..159..190..221..300..379..458..577..696..815..solved at 833
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..4..7..11..18..26..34..58..82..119..solved at 171
      #|0..0..2..5..9..14..35..90..162..solved at 179
      #|0..0..2..5..9..14..35..90..164..solved at 178
      #|0..0..1..2..4..7..11..17..25..33..55..77..112..solved at 164
      #|0..0..2..5..9..14..35..90..164..solved at 180
      #|0..0..2..5..9..14..35..88..158..solved at 172
      #|Library/analysis quotations (2163):
      #|  \226\136\128 t : Bool, !t \226\134\146 t \226\134\146 false
      #|  forall t1 t2 t3. t1 /\\ (t2 \\/ t3) <=> t1 /\\ t2 \\/ t1 /\\ t3
      #|  forall t1 t2 t3. (t2 \\/ t3) /\\ t1 <=> t2 /\\ t1 \\/ t3 /\\ t1
      #|  \226\136\128 n : Num, n < SUC(n)
      #|  \226\136\128 n : Num, n <= SUC(n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 m < SUC(n)
      #|  \226\136\128 m : Num, SUC(m) - 1 == m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < m + SUC(n)
      #|  \226\136\128 n : Num, \226\136\128 m : Num, !(SUC(n) <= m) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m == n || m < n || n < m
      #|  \226\136\128 b : Num, \226\136\128 c : Num, c <= b \226\134\146 (\226\136\128 a : Num, a - (b - c) == a + c - b)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, !(m < n) && !(m == n) \226\134\146 n < m
      #|  \226\136\128 n : Num, \226\136\128 m : Num, n - m <= n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m - n == m) == (m == 0 || n == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m <= n - p) == (m + p <= n || m <= 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (m >= n - p) == (m + p >= n)
      #|  \226\136\128 m : Num, 0 == m || 0 < m
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 SUC(m) <= n
      #|  (forall m. 0 - m = 0) /\\\n                 (forall m n. (SUC m) - n = (if m < n then 0 else SUC(m - n)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x <= y) == !(y < x)
      #|  !(real_of_num(1) == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, y < z \226\134\146 x + y < x + z
      #|  \226\136\128 x : Real, x * real_of_num(1) == x
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 x * inv(x) == real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y) * z == x * z + y * z
      #|  op_plus(-(x : Real))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y == x + z) == (y == z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + z == y + z) == (x == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == y) == (x == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == x) == (y == real_of_num(0))
      #|  (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == real_of_num(0)) == (x == -y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x + y == real_of_num(0)) == (y == -x)
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == a + c + (b + d)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x + y) == -x + -y
      #|  real_of_num(0) * (x : Real)
      #|  real_of_num(0) * (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) * x == real_of_num(0)
      #|  \226\136\128 x : Real, x * real_of_num(0) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x * y) == -x * y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x * y) == x * -y
      #|  \226\136\128 x : Real, --x == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x * -y == x * y
      #|  -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y < x + z) == (y < z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + z < y + z) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x < y) == (y <= x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x < y && y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 !(y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(x <= y) == (y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x <= y || y <= x
      #|  \226\136\128 x : Real, x <= x
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x <= y) == (x < y || x == y)
      #|  !((a : Bool) && !a)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x < y) == (x <= y && !(x == y))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 x <= y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < y && y <= z \226\134\146 x < z
      #|  (y : Real) < (z : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= y && y <= z \226\134\146 x <= z
      #|  (x : Real)
      #|  real_of_num(0)
      #|  -(x : Real)
      #|  \226\136\128 x : Real, (-x < real_of_num(0)) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, (real_of_num(0) < -x) == (x < real_of_num(0))
      #|  \226\136\128 x : Real, (-x <= real_of_num(0)) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, (real_of_num(0) <= -x) == (x <= real_of_num(0))
      #|  -(x : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 x : Real, x == real_of_num(0) || real_of_num(0) < x || real_of_num(0) < -x
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x || real_of_num(0) <= -x
      #|  real_of_num(0) == (y : Real)
      #|  real_of_num(0) == (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 real_of_num(0) <= x * y
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x * x
      #|  real_of_num(0) < real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y <= x + z) == (y <= z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + z <= y + z) == (x <= y)
      #|  (w : Real) + (z : Real)
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w < x && y < z \226\134\146 w + y < x + z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 real_of_num(0) < x + y
      #|  (z : Real)
      #|  (x : Real) + -(z : Real)
      #|  (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (y < x + -z) == (y + z < x)
      #|  (y : Real)
      #|  (z : Real)
      #|  (x : Real) + -(y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + -y < z) == (x < z + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x <= y \226\134\146 x < y + real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - y + y == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, y + (x - y) == x
      #|  \226\136\128 x : Real, x - x == real_of_num(0)
      #|  real_add
      #|  (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x - y == real_of_num(0)) == (x == y)
      #|  \226\136\128 x : Real, (real_of_num(0) <= x + x) == (real_of_num(0) <= x)
      #|  (x : Real)
      #|  -(x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, (-x <= x) == (real_of_num(0) <= x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, (x <= -x) == (x <= real_of_num(0))
      #|  op_plus(-(x : Real))
      #|  op_plus((x : Real))
      #|  \226\136\128 x : Real, (-x == real_of_num(0)) == (x == real_of_num(0))
      #|  -real_of_num(0) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -(x - y) == y - x
      #|  (y : Real)
      #|  (x : Real) - (y : Real)
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_of_num(0) < x - y) == (y < x)
      #|  (y : Real)
      #|  (x : Real) - (y : Real)
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (real_of_num(0) <= x - y) == (y <= x)
      #|  (x : Real) == real_of_num(0)
      #|  op_star(inv((x : Real)))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x * y == x * z) == (x == real_of_num(0) || y == z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x * z == y * z) == (z == real_of_num(0) || x == y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x * (y - z) == x * y - x * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y) * z == x * z - y * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x == y) == (x == -y)
      #|  \226\136\128 x : Real, -x == -real_of_num(1) * x
      #|  real_mul
      #|  (x : Real)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 !(inv(x) == real_of_num(0))
      #|  inv((x : Real))
      #|  (x : Real)
      #|  inv(inv((x : Real)))
      #|  inv((x : Real)) == real_of_num(0)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 inv(inv(x)) == x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 !(x == y)
      #|  real_of_num(0) < (x : Real)
      #|  real_of_num(0)
      #|  inv((x : Real))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_of_num(0) < inv(x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x \226\134\146 (real_of_num(0) < x * y) == (real_of_num(0) < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (real_of_num(0) < x * y) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x \226\134\146 (x * y < x * z) == (y < z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x * z < y * z) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < y && real_of_num(0) < z \226\134\146 x * z < y * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, y < z && real_of_num(0) < x \226\134\146 x * y < x * z
      #|  op_star(inv((x : Real)))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x * y == real_of_num(1) \226\134\146 x == inv(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x * y == real_of_num(1) \226\134\146 y == inv(x)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 -inv(x) == inv(-x)
      #|  \226\136\128 x : Real, inv(x) == real_of_num(1) / x
      #|  \226\136\128 n : Num, real_of_num(SUC(n)) == real_of_num(n) + real_of_num(1)
      #|  real_of_num((n : Num))
      #|  \226\136\128 n : Num, real_of_num(0) <= real_of_num(n)
      #|  (m : Num)
      #|  real_of_num((n : Num))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) <= real_of_num(n)) == (m <= n)
      #|  op_tilde
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) < real_of_num(n)) == (m < n)
      #|  ((m : Num) == (n : Num)) == (m <= n && n <= m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (real_of_num(m) == real_of_num(n)) == (m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(m) + real_of_num(n) == real_of_num(m + n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, real_of_num(m) * real_of_num(n) == real_of_num(m * n)
      #|  inv(real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 x : Real, real_of_num(0) / x == real_of_num(0)
      #|  real_of_num((n : Num)) == real_of_num(0)
      #|  \226\136\128 n : Num, !(real_of_num(n) == real_of_num(0)) == (real_of_num(0) < real_of_num(n))
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 real_of_num(0) < real_of_num(n)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (real_of_num(0) < y / z) == (real_of_num(0) < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x / z < y / z) == (x < y)
      #|  \226\136\128 n : Num, \226\136\128 d : Real, !(n == 0) \226\134\146 (real_of_num(0) < d / real_of_num(n)) == (real_of_num(0) < d)
      #|  1
      #|  1
      #|  1 < (n : Num)
      #|  1
      #|  \226\136\128 n : Num, \226\136\128 d : Real, 1 < n \226\134\146 (d < real_of_num(n) * d) == (real_of_num(0) < d)
      #|  1 < (n : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 d : Real, 1 < n \226\134\146 (d / real_of_num(n) < d) == (real_of_num(0) < d)
      #|  2
      #|  \226\136\128 d : Real, (real_of_num(0) < d / real_of_num(2)) == (real_of_num(0) < d)
      #|  \226\136\128 d : Real, (d / real_of_num(2) < d) == (real_of_num(0) < d)
      #|  2
      #|  \226\136\128 x : Real, x + x == real_of_num(2) * x
      #|  2
      #|  \226\136\128 x : Real, x / real_of_num(2) + x / real_of_num(2) == x
      #|  (a : Real) + (b : Real) + (c : Real) == c + a + b
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - y - x == -y
      #|  (y : Real)
      #|  (z : Real) - (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x + y < z) == (x < z - y)
      #|  (y : Real)
      #|  (z : Real)
      #|  (x : Real) - (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y < z) == (x < z + y)
      #|  -(z : Real)
      #|  (y : Real)
      #|  (x : Real) + (z : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x < y - z) == (x + z < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x <= y - z) == (x + z <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (x - y <= z) == (x <= z + y)
      #|  (x : Real) + (y : Real)
      #|  -(y : Real)
      #|  -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x < -y) == (y < x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x <= -y) == (y <= x)
      #|  \226\136\128 x : Real, real_of_num(0) - x == -x
      #|  \226\136\128 x : Real, x - real_of_num(0) == x
      #|  \226\136\128 w : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, w < x && y <= z \226\134\146 w + y < x + z
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) <= y \226\134\146 real_of_num(0) < x + y
      #|  (x1 : Real)
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + c + (a + d)
      #|  forall a b c d.\n    (a * b) - (c * d) = ((a * b) - (a * d)) + ((a * d) - (c * d))
      #|  forall x1 x2 y1 y2. &0 <= x1 /\\ &0 <= y1 /\\ x1 < x2 /\\ y1 < y2 ==>\n        (x1 * y1) < (x2 * y2)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x - y == -(x + y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - -y == x + y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -x - -y == y - x
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + c + (a + d)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a - b + (b - c) == a - c
      #|  forall x y. ~(x = &0) /\\ ~(y = &0) ==>\n             (inv(x * y) = inv(x) * inv(y))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x \226\134\146 (x * y <= x * z) == (y <= z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (x * z <= y * z) == (x <= y)
      #|  inv((x : Real) * (y : Real)) == inv(x) * inv(y)
      #|  forall x y. ~(x = &0) /\\ ~(y = &0) ==>\n                (inv(x) - inv(y) = (y - x) / (x * y))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x - (x - y) == y
      #|  (x : Real) + (d : Real)
      #|  (d : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 (\226\136\131 z : Real, x < z && z < y)
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !(x == real_of_num(0)) \226\134\146 (y == z) == (x * y == x * z)
      #|  real_of_num(0) == (y2 : Real)
      #|  real_of_num(0) <= (y1 : Real)
      #|  (y1 : Real) <= (y2 : Real)
      #|  real_of_num(0) == (x2 : Real)
      #|  real_of_num(0) <= (x2 : Real)
      #|  (x1 : Real) == (x2 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  forall x1 x2 y1 y2.\n    (& 0) <= x1 /\\ (& 0) <= y1 /\\ x1 <= x2 /\\ y1 <= y2 ==>\n    (x1 * y1) <= (x2 * y2)
      #|  (y : Real) == y / (x : Real) * x
      #|  (a : Bool) == (b : Bool) \226\134\146 a \226\134\146 b
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x && y <= z * x \226\134\146 y / x <= z
      #|  (z : Real) == z / (x : Real) * x
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) < x && y * x <= z \226\134\146 y <= z / x
      #|  (x : Real)
      #|  (x : Real) / (y : Real) * y == x
      #|  (x : Real)
      #|  ((x : Real) / (y : Real) < real_of_num(1)) == (x / y * y < real_of_num(1) * y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x < y \226\134\146 x / y < real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= x && y <= z \226\134\146 x * y <= x * z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, real_of_num(0) <= x && y <= z \226\134\146 y * x <= z * x
      #|  real_of_num(1) < real_of_num(1)
      #|  inv(inv((x : Real))) == x
      #|  inv
      #|  real_of_num(0) < real_of_num(0)
      #|  real_of_num(1)
      #|  (x : Real)
      #|  real_of_num(1)
      #|  inv((x : Real))
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < real_of_num(1) \226\134\146 real_of_num(1) < inv(x)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !(z == real_of_num(0)) && x * z == y * z \226\134\146 x == y
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !(x == real_of_num(0)) && x * y == x * z \226\134\146 y == z
      #|  \226\136\128 n : Num, !(real_of_num(FACT(n)) == real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, (real_of_num(0) < x * x) == !(x == real_of_num(0))
      #|  forall x y. ((x * x) + (y * y) = &0) <=> (x = &0) /\\ (y = &0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (-x == -y) == (x == y)
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == c * a * (b * d)
      #|  forall x z. ~(x = &0) /\\ ~(z = &0) ==> forall y. y / z = (x * y) / (x * z)
      #|  2
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a <= b \226\134\146 a <= (a + b) / real_of_num(2)
      #|  2
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a <= b \226\134\146 (a + b) / real_of_num(2) <= b
      #|  \226\136\128 x : Real, (abs(x) == real_of_num(0)) == (x == real_of_num(0))
      #|  abs(real_of_num(0)) == real_of_num(0)
      #|  abs(real_of_num(1)) == real_of_num(1)
      #|  (x : Real) <= real_of_num(0)
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 x : Real, abs(-x) == abs(x)
      #|  real_of_num(0)
      #|  (x : Real) + (y : Real) < real_of_num(0)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x + y) <= abs(x) + abs(y)
      #|  (x : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= abs(x)
      #|  (y : Real)
      #|  real_of_num(0) <= (y : Real)
      #|  (x : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x * y) == abs(x) * abs(y)
      #|  forall w x y z. abs(w) < y /\\ abs(x) < z ==> abs(w * x) < (y * z)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) == abs(y - x)
      #|  (!(a : Bool) \226\134\146 (b : Bool)) == (b || a)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) == (real_of_num(0) < abs(x))
      #|  1
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 abs(inv(x)) == inv(abs(x))
      #|  \226\136\128 x : Real, abs(abs(x)) == abs(x)
      #|  \226\136\128 x : Real, x <= abs(x)
      #|  2
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 x : Real, (abs(x) == x) == (real_of_num(0) <= x)
      #|  \226\136\128 n : Num, abs(real_of_num(n)) == real_of_num(n)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real) < y + (d : Real)
      #|  (y : Real)
      #|  (y : Real)
      #|  (x : Real) < x + (d : Real)
      #|  forall x y d. &0 < d /\\ ((x - d) < y) /\\ (y < (x + d)) <=> abs(y - x) < d
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 d : Real, abs(x - y) < d \226\134\146 y < x + d
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < abs(y) \226\134\146 !(x == real_of_num(0))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, x == real_of_num(0) || real_of_num(0) < abs(x)
      #|  (x : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < z && abs(y - x) < z - x \226\134\146 y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < y \226\134\146 real_of_num(0) < x
      #|  -(y : Real)
      #|  -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x - y) < -y \226\134\146 x < real_of_num(0)
      #|  \226\136\128 y : Real, !(y == real_of_num(0)) \226\134\146 (\226\136\128 x : Real, abs(x / y) == abs(x) / abs(y))
      #|  abs((x : Real))
      #|  abs((x : Real)) + abs((h : Real))
      #|  forall x y h. abs(h) < (abs(y) - abs(x)) ==> abs(x + h) < abs(y)
      #|  (y : Real)
      #|  (x : Real)
      #|  abs((x : Real) - (y : Real)) + abs(y) - abs(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(x) - abs(y) <= abs(x - y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, abs(abs(x) - abs(y)) <= abs(x - y)
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + c + (a + d)
      #|  (y0 : Real) - (x0 : Real) == y0 - (y : Real) + (y - x0)
      #|  abs((y0 : Real) - (y : Real)) + abs(y - (x0 : Real))
      #|  abs((y0 : Real) - (x0 : Real)) < (y0 - x0) / real_of_num(2) + (y0 - x0) / real_of_num(2)
      #|  abs((x : Real) - (x0 : Real))
      #|  (x : Real) - (x0 : Real)
      #|  abs((x0 : Real) - (y : Real)) < ((y0 : Real) - x0) / real_of_num(2)
      #|  (a : Bool) == !!a
      #|  (y0 : Real) - (y : Real)
      #|  (y0 : Real) - (x0 : Real) < (y0 - x0) / real_of_num(2)
      #|  abs((y : Real) - (y0 : Real)) < (y0 - (x0 : Real)) / real_of_num(2)
      #|  (y0 : Real) - (x0 : Real)
      #|  !((y0 : Real) <= (y : Real))
      #|  (x0 : Real) - (y : Real)
      #|  (y0 : Real) - (x0 : Real)
      #|  (y0 + --x0) + (x0 + --y) = (--x0 + x0) + (y0 + --y)
      #|  (a : Bool) == !!a
      #|  ((y0 : Real) - (x0 : Real)) / real_of_num(2)
      #|  (y0 : Real) - (x0 : Real)
      #|  (x : Real)
      #|  (x0 : Real)
      #|  (x : Real) < (y0 : Real) && (x0 : Real) < (y : Real)
      #|  forall x0 x y0 y. x0 < y0 /\\ abs(x - x0) < (y0 - x0) / &2 /\\\n                          abs(y - y0) < (y0 - x0) / &2\n        ==> x < y
      #|  -(x : Real)
      #|  ((a : Bool) == (a && (b : Bool))) == (a \226\134\146 b)
      #|  (x : Real)
      #|  ((a : Bool) == ((b : Bool) && a)) == (a \226\134\146 b)
      #|  \226\136\128 x : Real, \226\136\128 k : Real, (abs(x) <= k) == (-k <= x && x <= k)
      #|  \226\136\128 n : Num, pow(real_of_num(0), SUC(n)) == real_of_num(0)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 c : Real, \226\136\128 n : Num, !(c == real_of_num(0)) \226\134\146 !(pow(c, n) == real_of_num(0))
      #|  !(pow((c : Real), (n : Num)) == real_of_num(0))
      #|  pow((c : Real), (n : Num))
      #|  (c : Real)
      #|  \226\136\128 c : Real, \226\136\128 n : Num, !(c == real_of_num(0)) \226\134\146 inv(pow(c, n)) == pow(inv(c), n)
      #|  \226\136\128 c : Real, \226\136\128 n : Num, pow(abs(c), n) == abs(pow(c, n))
      #|  1
      #|  real_of_num(0) < real_of_num(1) + (e : Real)
      #|  (real_of_num(1) + (e : Real)) * (real_of_num(1) + real_of_num((n : Num)) * e)
      #|  \226\136\128 e : Real, \226\136\128 n : Num, real_of_num(0) < e \226\134\146 real_of_num(1) + real_of_num(n) * e <= pow(real_of_num(1) + e, n)
      #|  \226\136\128 c : Real, \226\136\128 m : Num, \226\136\128 n : Num, pow(c, m + n) == pow(c, m) * pow(c, n)
      #|  1
      #|  \226\136\128 x : Real, pow(x, 1) == x
      #|  2
      #|  \226\136\128 x : Real, pow(x, 2) == x * x
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x \226\134\146 real_of_num(0) <= pow(x, n)
      #|  forall n x y. &0 <= x /\\ x <= y ==> (x pow n) <= (y pow n)
      #|  \226\136\128 n : Num, abs(pow(-real_of_num(1), n)) == real_of_num(1)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, pow(x * y, n) == pow(x, n) * pow(y, n)
      #|  \226\136\128 x : Real, real_of_num(0) <= pow(x, 2)
      #|  \226\136\128 x : Real, abs(pow(x, 2)) == pow(x, 2)
      #|  \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 real_of_num(1) <= pow(x, 2)
      #|  \226\136\128 x : Real, real_of_num(1) < x \226\134\146 real_of_num(1) < pow(x, 2)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) < x \226\134\146 real_of_num(0) < pow(x, SUC(n))
      #|  2
      #|  \226\136\128 n : Num, real_of_num(1) <= pow(real_of_num(2), n)
      #|  \226\136\128 n : Num, real_of_num(n) < pow(real_of_num(2), n)
      #|  1
      #|  2
      #|  1
      #|  2
      #|  \226\136\128 n : Num, pow(-real_of_num(1), 2 * n) == real_of_num(1)
      #|  (P : (Real) -> Bool)
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x < z) ==>\n     (?s. forall y. (?x. P x /\\ y < x) <=> y < s)
      #|  sup s = @a. (forall x. x IN s ==> x <= a) /\\\n              (forall b. (forall x. x IN s ==> x <= b) ==> a <= b)
      #|  sup((P : (Real) -> Bool)) == select((s : Real) => \226\136\128 y : Real, (\226\136\131 x : Real, P(x) && y < x) == (y < s))
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x < z) ==>\n          (forall y. (?x. P x /\\ y < x) <=> y < sup P)
      #|  (x : Real)
      #|  (x : Real)
      #|  sup((P : (Real) -> Bool))
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x < z) ==>\n          (forall y. P y ==> y <= sup P)
      #|  (z : Real)
      #|  (z : Real) + real_of_num(1)
      #|  (z : Real)
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x <= z) <=>\n       (?x. P x) /\\ (?z. forall x. P x ==> x < z)
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x <= z) ==>\n           (forall y. (?x. P x /\\ y < x) <=> y < sup P)
      #|  forall P. (?x. P x) /\\ (?z. forall x. P x ==> x <= z) ==>\n          (forall y. P y ==> y <= sup P)
      #|  (\226\136\128 x : Real, (\226\136\131 n : Num, x == real_of_num(n)) \226\134\146 (P : (Real) -> Bool)(x)) == (\226\136\128 n : Num, P(real_of_num(n)))
      #|  !((M : Real) <= M - real_of_num(1))
      #|  (y : Real) => \226\136\131 n : Num, y == real_of_num(n)
      #|  \226\136\128 x : Real, \226\136\131 n : Num, x <= real_of_num(n)
      #|  (n : Num) + 1
      #|  (real_of_num((n : Num)) + real_of_num(1)) * (x : Real)
      #|  sup((z : Real) => \226\136\131 n : Num, z == real_of_num(n) * (x : Real))
      #|  (n : Num)
      #|  (z : Real)
      #|  sup((z : Real) => \226\136\131 n : Num, z == real_of_num(n) * (x : Real)) - x
      #|  (y : Real)
      #|  (n : Num)
      #|  real_of_num((n : Num)) * (x : Real)
      #|  (z : Real) => \226\136\131 n : Num, z == real_of_num(n) * (x : Real)
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 (\226\136\128 y : Real, \226\136\131 n : Num, y < real_of_num(n) * x)
      #|  (x : Real) < real_of_num(0) * (y : Real)
      #|  (n : Num)
      #|  SUC(PRE((n : Num))) == n
      #|  PRE((n : Num))
      #|  PRE((n : Num))
      #|  (n : Num)
      #|  (x : Real)
      #|  forall y. &0 < y ==> forall x. &0 <= x ==>\n                        ?n. (&n * y) <= x /\\ x < (&(SUC n) * y)
      #|  &1 + (n + &1) * x <= (&1 + x) * (&1 + n * x) <=> &0 <= n * x * x
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
      #|  :A->(B->real)->real
      #|  (sum : ((A) -> Bool, (A) -> Real) -> Real)
      #|  (psum : ((Num, Num), (Num) -> Real) -> Real)
      #|  \\(n,m) f. (sm:num->num->(num->real)->real) n m f
      #|  (forall f n. sm n 0 f = &0) /\\\n     (forall f m n. sm  n (SUC m) f = sm n m f + f(n + m))
      #|  ?sum. (forall f n. sum(n,0) f = &0) /\\\n         (forall f m n. sum(n,SUC m) f = sum(n,m) f + f(n + m))
      #|  (sum(n,0) f = &0) /\\\n   (sum(n,SUC m) f = sum(n,m) f + f(n + m))
      #|  op_dot_dot((m : Num), m + (n : Num))
      #|  FINITE {i | m <= i /\\ i < m + n} /\\\n     {i | m <= i /\\ i < m + SUC n} =\n                (m + n) INSERT {i | m <= i /\\ i < m + n}
      #|  {(i : Num) | (m : Num) <= i && i < m + 0} == {}
      #|  forall f m n. sum(m,n) f = sum {i | m <= i /\\ i < m + n} f
      #|  forall f m n. ~(m = 0 /\\ n = 0) ==> sum(m,n) f = sum(m..(m+n)-1) f
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, \226\136\128 p : Num, sum((0, n), f) + sum((n, p), f) == sum((0, n + p), f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, sum((m, n), f) == sum((0, m + n), f) - sum((0, m), f)
      #|  abs(sum(((m : Num), (n : Num)), (f : (Num) -> Real))) + abs(f(m + n))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, abs(sum((m, n), f)) <= sum((m, n), (n : Num) => abs(f(n)))
      #|  (n : Num) + (m : Num)
      #|  forall f g m n. (forall r. m <= r /\\ r < n + m ==> f(r) <= g(r))\n        ==> (sum(m,n) f <= sum(m,n) g)
      #|  forall f g m n. (forall r. m <= r /\\ r < (n + m) ==> (f(r) = g(r)))\n        ==> (sum(m,n) f = sum(m,n) g)
      #|  \226\136\128 f : (Num) -> Real, (\226\136\128 n : Num, real_of_num(0) <= f(n)) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, real_of_num(0) <= sum((m, n), f))
      #|  (n : Num)
      #|  (n : Num)
      #|  forall f m n.\n     (forall n. m <= n ==> &0 <= f(n))\n     ==> &0 <= sum(m,n) f
      #|  (m : Num)
      #|  (m : Num)
      #|  forall f m n. abs(sum(m,n) (\\m. abs(f m))) = sum(m,n) (\\m. abs(f m))
      #|  abs(sum(((m : Num), (n : Num)), (f : (Num) -> Real))) + abs(f(m + n))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, abs(sum((m, n), f)) <= sum((m, n), (n : Num) => abs(f(n)))
      #|  (n : Num)
      #|  (n : Num)
      #|  (d : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  forall f N. (forall n. n >= N ==> (f(n) = &0)) ==>\n         (forall m n. m >= N ==> (sum(m,n) f = &0))
      #|  forall f g m n. sum(m,n) (\\n. f(n) + g(n)) = sum(m,n) f + sum(m,n) g
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 c : Real, \226\136\128 m : Num, \226\136\128 n : Num, sum((m, n), (n : Num) => c * f(n)) == c * sum((m, n), f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, \226\136\128 d : Num, sum((n, d), (n : Num) => -f(n)) == -sum((n, d), f)
      #|  forall f g m n. sum(m,n)(\\n. (f n) - (g n)) = sum(m,n) f - sum(m,n) g
      #|  forall f g m n. (forall p. m <= p /\\ p < (m + n) ==> (f p = g p))\n        ==> (sum(m,n) f = sum(m,n) g)
      #|  forall n f c. sum(0,n) f - (&n * c) = sum(0,n)(\\p. f(p) - c)
      #|  forall f K m n. (forall p. m <= p /\\ p < (m + n) ==> (f(p) <= K))\n        ==> (sum(m,n) f <= (&n * K))
      #|  forall n k f. sum(0,n)(\\m. sum(m * k,k) f) = sum(0,n * k) f
      #|  1
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, sum((n, 1), f) == f(n)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, sum((n, 2), f) == f(n) + f(n + 1)
      #|  (n : Num)
      #|  (n : Num)
      #|  forall f n k. sum(0,n)(\\m. f(m + k)) = sum(0,n + k) f - sum(0,k) f
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 k : Num, \226\136\128 n : Num, sum((m + k, n), f) == sum((m, n), (r : Num) => f(r + k))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, sum((m, n), (r : Num) => real_of_num(0)) == real_of_num(0)
      #|  forall f n d. sum(n,d) (\\n. f(SUC n) - f(n)) = f(n + d) - f(n)
      #|  1
      #|  (n : Num)
      #|  (f : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  (a : Real) * ((b : Real) * (c : Real)) == b * (a * c)
      #|  forall f n x. sum(0,SUC n)(\\i. f(i) * x pow i) =\n           f(0) + x * sum(0,n)(\\i. f(SUC i) * x pow i)
      #|  \226\136\128 c : Real, \226\136\128 n : Num, sum((0, n), (m : Num) => c) == real_of_num(n) * c
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, \226\136\128 p : Num, sum(((m : Num), n), f) + sum((m + n, p), f) == sum((m, n + p), f)
      #|  forall f m1 n1 m2 n2.\n        sum(m1,n1) (\\a. sum(m2,n2) (\\b. f a b)) =\n        sum(m2,n2) (\\b. sum(m1,n1) (\\a. f a b))
      #|  sum(((m : Num), (n : Num)), (r : Num) => real_of_num(0))
      #|  (forall r. m <= r /\\ r < m + n ==> (f(r) = &0)) ==> (sum(m,n) f = &0)
      #|  (m : Num) + (n : Num) + ((p : Num) - n)
      #|  sum(((m : Num) + (n : Num), (p : Num) - n), (f : (Num) -> Real)) == real_of_num(0)
      #|  forall m n p.\n      n <= p /\\ (forall r. m + n <= r /\\ r < m + p ==> (f(r) = &0))\n      ==> (sum(m,p) f = sum(m,n) f)
      #|  ((a : Real) - (b : Real) == (c : Real) - (d : Real)) == (a - c == b - d)
      #|  forall m n p.\n      n <= p /\\ (forall r. m + n <= r /\\ r < m + p ==> (f(r) = g(r)))\n      ==> (sum(m,p) f - sum(m,n) f = sum(m,p) g - sum(m,n) g)
      #|  psum
      #|  1
      #|  sum((0, 1), (f : (Num) -> Real)) == f(0)
      #|  psum
      #|  1
      #|  sum((0, 1), (f : (Num) -> Real)) == f(0)
      #|  (re_Union : (((A) -> Bool) -> Bool, A) -> Bool)((S : ((A) -> Bool) -> Bool)) == ((x : A) => \226\136\131 s : (A) -> Bool, S(s) && s(x))
      #|  (re_union : ((A) -> Bool, (A) -> Bool, A) -> Bool)((P : (A) -> Bool), (Q : (A) -> Bool)) == ((x : A) => P(x) || Q(x))
      #|  (re_intersect : ((A) -> Bool, (A) -> Bool, A) -> Bool)((P : (A) -> Bool), (Q : (A) -> Bool)) == ((x : A) => P(x) && Q(x))
      #|  (re_null : (A) -> Bool) == ((x : A) => false)
      #|  (re_universe : (A) -> Bool) == ((x : A) => true)
      #|  (re_subset : ((A) -> Bool, (A) -> Bool) -> Bool)((P : (A) -> Bool), (Q : (A) -> Bool)) == (\226\136\128 x : A, P(x) \226\134\146 Q(x))
      #|  (re_compl : ((A) -> Bool, A) -> Bool)((S : (A) -> Bool)) == ((x : A) => !S(x))
      #|  \226\136\128 S : (A) -> Bool, re_subset(S, S)
      #|  \226\136\128 S : (A) -> Bool, \226\136\128 x : A, S(x) == !re_compl(S, x)
      #|  (((a : Bool) \226\134\146 (b : Bool)) && (b \226\134\146 a)) == (a == b)
      #|  forall P:A->bool. forall Q. P re_subset Q /\\ Q re_subset P <=> (P = Q)
      #|  (x : A)
      #|  (x : A)
      #|  forall P:A->bool. forall Q R. P re_subset Q /\\ Q re_subset R ==> P re_subset R
      #|  forall L:(A->bool)->bool. istopology L <=>\n            L re_null /\\\n            L re_universe /\\\n     (forall a b. L a /\\ L b ==> L (a re_intersect b)) /\\\n       (forall P. P re_subset L ==> L (re_Union P))
      #|  (re_universe : ((A) -> Bool) -> Bool)
      #|  \226\136\131 t : ((A) -> Bool) -> Bool, istopology(t)
      #|  forall L:(A)topology. open(L) re_null /\\\n                   open(L) re_universe /\\\n            (forall x y. open(L) x /\\ open(L) y ==> open(L) (x re_intersect y)) /\\\n              (forall P. P re_subset (open L) ==> open(L) (re_Union P))
      #|  forall L:(A)topology. forall P. P re_subset (open L) ==> open(L) (re_Union P)
      #|  neigh(top)(N,(x:A)) = ?P. open(top) P /\\ P re_subset N /\\ P x
      #|  (S : (A) -> Bool)
      #|  forall S top. forall x:A. open(top) S /\\ S x ==> neigh(top)(S,x)
      #|  (S : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  forall S top. open(top) S <=>\n           (re_Union (\\P:A->bool. open(top) P /\\ P re_subset S) = S)
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  S = re_Union (\\P:A->bool. open(top) P /\\ P re_subset S)
      #|  (S : (A) -> Bool)
      #|  forall S top. open(top) S <=>\n           forall x:A. S x ==> ?P. P x /\\ open(top) P /\\ P re_subset S
      #|  (N : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  (N : (A) -> Bool)
      #|  (S : (A) -> Bool)
      #|  (S : (A) -> Bool)
      #|  forall S top. open(top) S = forall x:A. S x ==> ?N. neigh(top)(N,x) /\\ N re_subset S
      #|  (closed : (Topology[A], (A) -> Bool) -> Bool)((L : Topology[A]), (S : (A) -> Bool)) == open(L, re_compl(S))
      #|  limpt(top) x S <=>\n      forall N:A->bool. neigh(top)(N,x) ==> ?y. ~(x = y) /\\ S y /\\ N y
      #|  ((a : Bool) == ((b : Bool) || a)) == (b \226\134\146 a)
      #|  ((a : Bool) || (b : Bool) || !(c : Bool)) == (c \226\134\146 a || b)
      #|  (S : (A) -> Bool)((x : A))
      #|  (S : (A) -> Bool)
      #|  re_compl((S : (A) -> Bool))
      #|  (S : (A) -> Bool)
      #|  forall top S. closed(top) S <=> (forall x:A. limpt(top) x S ==> S x)
      #|  ismet (m:A#A->real) <=> (forall x y. (m(x,y) = &0) <=> (x = y)) /\\\n                           (forall x y z. m(y,z) <= m(x,y) + m(x,z))
      #|  (x : A) == (y : A)
      #|  GABS((f : ((A, A)) -> Real) => \226\136\128 x : A, \226\136\128 y : A, GEQ(f((x, y)), if x == y { real_of_num(0) } else { real_of_num(1) }))
      #|  \226\136\131 m : ((A, A)) -> Real, ismet(m)
      #|  \226\136\128 m : Metric[A], ismet(mdist(m))
      #|  (m : Metric[A])
      #|  forall m:(A)metric. forall x y. ((mdist m)(x,y) = &0) <=> (x = y)
      #|  \226\136\128 m : Metric[A], \226\136\128 x : A, mdist(m, (x, x)) == real_of_num(0)
      #|  (y : A)
      #|  (y : A)
      #|  (m : Metric[A])
      #|  (y : A)
      #|  (y : A)
      #|  (x : A)
      #|  (m : Metric[A])
      #|  \226\136\128 m : Metric[A], \226\136\128 x : A, \226\136\128 y : A, real_of_num(0) <= mdist(m, (x, y))
      #|  (z : A)
      #|  (y : A)
      #|  (z : A)
      #|  (z : A)
      #|  (y : A)
      #|  (m : Metric[A])
      #|  \226\136\128 m : Metric[A], \226\136\128 x : A, \226\136\128 y : A, mdist(m, (x, y)) == mdist(m, (y, x))
      #|  (m : Metric[A])
      #|  forall m:(A)metric. forall x y z. (mdist m)(x,z) <= (mdist m)(x,y) + (mdist m)(y,z)
      #|  (!(a : Bool) \226\134\146 (b : Bool)) == (b || a)
      #|  (y : A)
      #|  (x : A)
      #|  (m : Metric[A])
      #|  \226\136\128 m : Metric[A], \226\136\128 x : A, \226\136\128 y : A, !(x == y) \226\134\146 real_of_num(0) < mdist(m, (x, y))
      #|  forall m:(A)metric. mtop m =\n    topology(\\S. forall x. S x ==> ?e. &0 < e /\\ (forall y. (mdist m)(x,y) < e ==> S y))
      #|  (y : (A) -> Bool)
      #|  (z : A)
      #|  (e : Real)
      #|  (y : (A) -> Bool)
      #|  (e2 : Real)
      #|  (e1 : Real)
      #|  (e2 : Real)
      #|  (e2 : Real)
      #|  (e1 : Real)
      #|  (e2 : Real)
      #|  (e1 : Real)
      #|  real_of_num(1)
      #|  forall m:(A)metric. istopology\n    (\\S. forall x. S x ==> ?e. &0 < e /\\ (forall y. (mdist m)(x,y) < e ==> S y))
      #|  (x : A)
      #|  (e : Real)
      #|  forall m:(A)metric. open(mtop m) S <=>\n      (forall x. S x ==> ?e. &0 < e /\\ (forall y. (mdist m(x,y)) < e ==> S y))
      #|  forall m:(A)metric. forall x e. ball(m)(x,e) = \\y. (mdist m)(x,y) < e
      #|  mdist((m : Metric[A]), ((x : A), (z : A))) + mdist(m, (z, (y : A)))
      #|  (y : A)
      #|  (e : Real) - mdist((m : Metric[A]), ((x : A), (z : A)))
      #|  (z : A)
      #|  forall m:(A)metric. forall x e. &0 < e ==> open(mtop(m))(ball(m)(x,e))
      #|  ball((m : Metric[A]), ((x : A), (e : Real)))
      #|  forall m:(A)metric. forall x e. &0 < e ==> neigh(mtop(m))(ball(m)(x,e),x)
      #|  re_subset((P : (A) -> Bool), (N : (A) -> Bool))
      #|  (y : A)
      #|  (y : A)
      #|  (y : A)
      #|  (e : Real)
      #|  (e : Real)
      #|  (x : A)
      #|  (P : (A) -> Bool)
      #|  ball((m : Metric[A]), ((x : A), (e : Real)))
      #|  forall m:(A)metric. forall x S. limpt(mtop m) x S <=>\n      forall e. &0 < e ==> ?y. ~(x = y) /\\ S y /\\ (mdist m)(x,y) < e
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == d + a + (c + b)
      #|  (z : Real) - (y : Real) == (x : Real) - y + (z - x)
      #|  (y : Real)
      #|  (x : Real)
      #|  ismet(GABS((f : ((Real, Real)) -> Real) => \226\136\128 x : Real, \226\136\128 y : Real, GEQ(f((x, y)), abs(y - x))))
      #|  (mr1 : Metric[Real]) == metric(GABS((f : ((Real, Real)) -> Real) => \226\136\128 x : Real, \226\136\128 y : Real, GEQ(f((x, y)), abs(y - x))))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, mdist(mr1, (x, y)) == abs(y - x)
      #|  \226\136\128 x : Real, \226\136\128 d : Real, mdist(mr1, (x, x + d)) == abs(d)
      #|  \226\136\128 x : Real, \226\136\128 d : Real, mdist(mr1, (x, x - d)) == abs(d)
      #|  \226\136\128 x : Real, \226\136\128 d : Real, real_of_num(0) <= d \226\134\146 mdist(mr1, (x, x + d)) == d
      #|  \226\136\128 x : Real, \226\136\128 d : Real, real_of_num(0) <= d \226\134\146 mdist(mr1, (x, x - d)) == d
      #|  \226\136\128 x : Real, \226\136\128 d : Real, real_of_num(0) < d \226\134\146 mdist(mr1, (x, x + d)) == d
      #|  \226\136\128 x : Real, \226\136\128 d : Real, real_of_num(0) < d \226\134\146 mdist(mr1, (x, x - d)) == d
      #|  forall x y z. x < z /\\ (mdist mr1)(x,y) < (z - x) ==> y < z
      #|  real_of_num(0) <= (e : Real) / real_of_num(2)
      #|  (x : Real) + (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  \226\136\128 x : Real, limpt(mtop(mr1), x, re_universe)
      #|  dorder (g:A->A->bool) <=>\n     forall x y. g x x /\\ g y y ==> ?z. g z z /\\ (forall w. g w z ==> g w x /\\ g w y)
      #|  (s tends l)(top,g) <=>\n      forall N:A->bool. neigh(top)(N,l) ==>\n            ?n:B. g n n /\\ forall m:B. g m n ==> N(s m)
      #|  bounded((m:(A)metric),(g:B->B->bool)) f <=>\n      ?k x N. g N N /\\ (forall n. g n N ==> (mdist m)(f(n),x) < k)
      #|  tendsto((m:(A)metric),x) y z <=>\n      &0 < (mdist m)(x,y) /\\ (mdist m)(x,y) <= (mdist m)(x,z)
      #|  (tends : ((_) -> _, _, (Topology[_], (_, _) -> Bool)) -> Bool)
      #|  (m : A)
      #|  (m : A)
      #|  (n : A)
      #|  (n : A)
      #|  (g : (A, A) -> Bool)((N2 : A), N2)
      #|  (g : (A, A) -> Bool)((N1 : A), N1)
      #|  (N2 : A)
      #|  (N1 : A)
      #|  (N2 : A)
      #|  (N1 : A)
      #|  forall g:A->A->bool.\n      dorder g ==>\n        forall P Q. (?n. g n n /\\ (forall m. g m n ==> P m)) /\\\n              (?n. g n n /\\ (forall m. g m n ==> Q m))\n                  ==> (?n. g n n /\\ (forall m. g m n ==> P m /\\ Q m))
      #|  (x : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  (y : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  (dorder : ((Num, Num) -> Bool) -> Bool)(op_gt_eq)
      #|  (u : A)
      #|  (v : A)
      #|  mdist((m : Metric[A]), ((x : A), (u : A)))
      #|  mdist((m : Metric[A]), ((x : A), (v : A)))
      #|  (v : A)
      #|  (u : A)
      #|  \226\136\128 m : Metric[A], \226\136\128 x : A, dorder(tendsto((m, x)))
      #|  re_subset((P : (A) -> Bool), (N : (A) -> Bool))
      #|  (n : B)
      #|  (n : B)
      #|  real_of_num(0) < (d : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (x0 : A)
      #|  open(mtop((d : Metric[A])), (P : (A) -> Bool))
      #|  (P : (A) -> Bool)
      #|  ball((d : Metric[A]), ((x0 : A), (e : Real)))
      #|  forall d g. forall x:B->A. forall x0. (x --> x0)(mtop(d),g) <=>\n     forall e. &0 < e ==> ?n. g n n /\\ forall m. g m n ==> mdist(d)(x(m),x0) < e
      #|  (N : B)
      #|  (N : B)
      #|  mdist((d : Metric[A]), ((x0 : A), (x1 : A))) / real_of_num(2)
      #|  (((a : Bool) \226\134\146 (b : Bool)) && (a \226\134\146 (c : Bool))) == (a \226\134\146 b && c)
      #|  forall g d. dorder (g:B->B->bool) ==>\n      (x --> x0)(mtop(d),g) /\\ (x --> x1)(mtop(d),g) ==> (x0:A = x1)
      #|  forall d:(A)metric. forall x x0. (x --> x0)(mtop(d), (>=) :num->num->bool) <=>\n     forall e. &0 < e ==> ?N. forall n. n >= N ==> mdist(d)(x(n),x0) < e
      #|  mdist((m1 : Metric[A]), ((x0 : A), (y : A)))
      #|  (x : A)
      #|  (y : A)
      #|  (y : A)
      #|  (d : Real)
      #|  limpt(mtop((m1 : Metric[A])), (x0 : A), re_universe)
      #|  (d : Real)
      #|  (x : A)
      #|  (x0 : A)
      #|  (m1 : Metric[A])
      #|  mdist((m1 : Metric[A]), ((x0 : A), (z : A)))
      #|  (z : A)
      #|  real_of_num(0) < (e : Real)
      #|  forall m1:(A)metric. forall m2:(B)metric. forall f x0 y0.\n      limpt(mtop m1) x0 re_universe ==>\n        ((f --> y0)(mtop(m2),tendsto(m1,x0)) <=>\n          forall e. &0 < e ==>\n            ?d. &0 < d /\\ forall x. &0 < (mdist m1)(x,x0) /\\ (mdist m1)(x,x0) <= d\n                ==> (mdist m2)(f(x),y0) < e)
      #|  (d : Real) / real_of_num(2)
      #|  (d : Real) / real_of_num(2)
      #|  (d : Real)
      #|  (d : Real)
      #|  forall m1:(A)metric. forall m2:(B)metric. forall f x0 y0.\n      limpt(mtop m1) x0 re_universe ==>\n        ((f --> y0)(mtop(m2),tendsto(m1,x0)) <=>\n          forall e. &0 < e ==>\n            ?d. &0 < d /\\ forall x. &0 < (mdist m1)(x,x0) /\\ (mdist m1)(x,x0) < d ==>\n              (mdist m2)(f(x),y0) < e)
      #|  real_of_num(0)
      #|  (k : Real)
      #|  abs((f : (A) -> Real)((n : A)) - (x : Real)) + abs(x)
      #|  (x : Real)
      #|  (f : (A) -> Real)((n : A))
      #|  abs((x : Real)) + (k : Real)
      #|  (x : Real)
      #|  (k : Real)
      #|  forall(g:A->A->bool) f. bounded(mr1,g) f <=>\n        ?k N. g N N /\\ (forall n. g n N ==> abs(f n) < k)
      #|  forall g:A->A->bool. forall x x0.\n      (x --> x0)(mtop(mr1),g) <=> ((\\n. x(n) - x0) --> &0)(mtop(mr1),g)
      #|  (N : A)
      #|  (x0 : Real)
      #|  real_of_num(1)
      #|  (N : A)
      #|  1
      #|  1
      #|  real_of_num(1)
      #|  forall g:A->A->bool. forall x x0.\n      (x --> x0)(mtop(mr1),g) ==> bounded(mr1,g) x
      #|  (N : A)
      #|  (N : A)
      #|  abs((x0 : Real))
      #|  forall g:A->A->bool. forall x x0.\n      (x --> x0)(mtop(mr1),g) /\\ ~(x0 = &0) ==>\n        ?N. g N N /\\ (forall n. g n N ==> ~(x n = &0))
      #|  !((x : (A) -> Real)((n : A)) == real_of_num(0))
      #|  2
      #|  !(abs((x0 : Real)) == real_of_num(0)) && !(real_of_num(2) == real_of_num(0))
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == d * a * (b * c)
      #|  real_of_num(2) / abs((x0 : Real)) == inv(abs(x0) / real_of_num(2))
      #|  abs((x0 : Real)) / real_of_num(2)
      #|  real_of_num(0) < abs((x : (A) -> Real)((n : A)))
      #|  (x : (A) -> Real)((n : A))
      #|  (x0 : Real)
      #|  real_abs
      #|  abs((x0 : Real) - (x : (A) -> Real)((n : A))) + abs(x(n))
      #|  abs((x : (A) -> Real)((n : A)))
      #|  abs((x0 : Real)) / real_of_num(2)
      #|  abs((x0 : Real)) / real_of_num(2)
      #|  abs((x0 : Real)) / real_of_num(2) < abs((x : (A) -> Real)((n : A)))
      #|  (n : A)
      #|  (N : A)
      #|  real_of_num(2) / abs((x0 : Real))
      #|  (N : A)
      #|  abs((x0 : Real)) / real_of_num(2)
      #|  forall g:A->A->bool. forall x x0.\n      (x --> x0)(mtop(mr1),g) /\\ ~(x0 = &0) ==>\n        bounded(mr1,g) (\\n. inv(x n))
      #|  abs((x : (A) -> Real)((m : A))) + abs((y : (A) -> Real)(m))
      #|  (N : A)
      #|  (N : A)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  forall g:A->A->bool. dorder g ==>\n        forall x y. (x --> &0)(mtop(mr1),g) /\\ (y --> &0)(mtop(mr1),g) ==>\n                ((\\n. x(n) + y(n)) --> &0)(mtop(mr1),g)
      #|  real_of_num(0) < real_of_num(0)
      #|  (e : Real) == (k : Real) * (e / k)
      #|  (N : A)
      #|  (N : A)
      #|  real_of_num(0) < (e : Real) / (k : Real)
      #|  abs((x : (A) -> Real)((N : A)))
      #|  (N : A)
      #|  (N : A)
      #|  real_of_num(0) < (k : Real)
      #|  (e : Real) / (k : Real)
      #|  (k : Real)
      #|  (e : Real)
      #|  forall g:A->A->bool. dorder g ==>\n      forall x y. bounded(mr1,g) x /\\ (y --> &0)(mtop(mr1),g) ==>\n              ((\\n. x(n) * y(n)) --> &0)(mtop(mr1),g)
      #|  real_of_num(0) < abs((k : Real))
      #|  (e : Real) == abs((k : Real)) * (e / abs(k))
      #|  (N : A)
      #|  (N : A)
      #|  real_of_num(0) < (e : Real) / abs((k : Real))
      #|  (e : Real) / abs((k : Real))
      #|  (N : A)
      #|  (N : A)
      #|  1
      #|  real_of_num(1)
      #|  (k : Real) == real_of_num(0)
      #|  (e : Real)
      #|  forall g:A->A->bool. forall k x.\n      (x --> &0)(mtop(mr1),g) ==> ((\\n. k * x(n)) --> &0)(mtop(mr1),g)
      #|  forall g:A->A->bool x x0 y y0.\n        dorder g\n        ==> (x --> x0)(mtop(mr1),g) /\\ (y --> y0)(mtop(mr1),g)\n            ==> ((\\n. x(n) + y(n)) --> (x0 + y0))(mtop(mr1),g)
      #|  forall g:A->A->bool x x0.\n        dorder g\n        ==> ((x --> x0)(mtop(mr1),g) <=>\n            ((\\n. --(x n)) --> --x0)(mtop(mr1),g))
      #|  -(y : (A) -> Real)((n : A))
      #|  (n : A)
      #|  forall g:A->A->bool x x0 y y0.\n      dorder g\n      ==> (x --> x0)(mtop(mr1),g) /\\ (y --> y0)(mtop(mr1),g)\n          ==> ((\\n. x(n) - y(n)) --> (x0 - y0))(mtop(mr1),g)
      #|  (x0 : Real)
      #|  (x : (A) -> Real)((n : A)) - (x0 : Real)
      #|  (y : (A) -> Real)((n : A)) - (y0 : Real)
      #|  (n : A)
      #|  ((x : (A) -> Real)((n : A)) - (x0 : Real)) * (y0 : Real)
      #|  (n : A)
      #|  (x : (A) -> Real)((n : A)) * ((y : (A) -> Real)(n) - (y0 : Real))
      #|  (n : A)
      #|  forall a b c d. (a * b) - (c * d) = (a * (b - d)) + ((a - c) * d)
      #|  forall g:A->A->bool x y x0 y0.\n        dorder g\n        ==> (x --> x0)(mtop(mr1),g) /\\ (y --> y0)(mtop(mr1),g)\n            ==> ((\\n. x(n) * y(n)) --> (x0 * y0))(mtop(mr1),g)
      #|  real_of_num(0) < abs(inv((x0 : Real)))
      #|  (a : Real) * ((b : Real) * (c : Real) * ((d : Real) * (e : Real))) == e * (b * (a * (c * d)))
      #|  1
      #|  1
      #|  real_of_num(0) < (k : Real)
      #|  !((x0 : Real) == real_of_num(0))
      #|  (e : Real) == e * (abs(inv((x0 : Real))) * abs(x0) * (inv((k : Real)) * k))
      #|  !((x : (A) -> Real)((n : A)) == real_of_num(0))
      #|  !((x0 : Real) == real_of_num(0))
      #|  inv(x n) - inv x0 =\n                inv(x n) * inv x0 * (x0 - x(n:A))
      #|  (n : A)
      #|  (N : A)
      #|  (N : A)
      #|  real_of_num(0) < (e : Real) * (abs((x0 : Real)) * inv((k : Real)))
      #|  abs(inv((x : (A) -> Real)((N : A))))
      #|  (N : A)
      #|  (N : A)
      #|  real_of_num(0) < (k : Real)
      #|  (e : Real) * (abs((x0 : Real)) * inv((k : Real)))
      #|  (e : Real)
      #|  tends((x : (A) -> Real), (x0 : Real), (mtop(mr1), (g : (A, A) -> Bool)))
      #|  (k : Real)
      #|  forall g:A->A->bool x x0.\n        dorder g\n        ==> (x --> x0)(mtop(mr1),g) /\\ ~(x0 = &0)\n            ==> ((\\n. inv(x(n))) --> inv x0)(mtop(mr1),g)
      #|  inv((y : (A) -> Real)((n : A)))
      #|  (n : A)
      #|  forall g:A->A->bool x x0 y y0.\n       dorder g\n       ==> (x --> x0)(mtop(mr1),g) /\\\n           (y --> y0)(mtop(mr1),g) /\\ ~(y0 = &0)\n           ==> ((\\n. x(n) / y(n)) --> (x0 / y0))(mtop(mr1),g)
      #|  mdist(mr1, ((x : (A) -> Real)((n : A)), (x0 : Real)))
      #|  (n : A)
      #|  (N : A)
      #|  (N : A)
      #|  (e : Real)
      #|  forall x x0. (x --> x0)(mtop(mr1),g) ==>\n               ((\\n:A. abs(x n)) --> abs(x0))(mtop(mr1),g)
      #|  (a : Num) < (b : Num) + (c : Num) \226\134\146 a < b + SUC(c)
      #|  (r : Num)
      #|  forall g. dorder g /\\\n       ((\\x. &0) --> &0)(mtop(mr1),g)\n       ==> forall m n. (forall r. m <= r /\\ r < m + n ==> (f r --> l r)(mtop(mr1),g))\n                 ==> ((\\x. sum(m,n) (\\r. f r x)) --> sum(m,n) l)\n                     (mtop(mr1),g)
      #|  (x0 : Real)
      #|  (y0 : Real)
      #|  (N : A)
      #|  (N : A)
      #|  ((x0 : Real) - (y0 : Real)) / real_of_num(2)
      #|  (a : Bool) == !!a
      #|  forall g:A->A->bool x x0 y y0.\n        dorder g\n        ==> (x --> x0)(mtop(mr1),g) /\\\n            (y --> y0)(mtop(mr1),g) /\\\n            (?N. g N N /\\ forall n. g n N ==> x(n) <= y(n))\n            ==> x0 <= y0
      #|  x tends_num_real x0 <=> (x tends x0)(mtop(mr1), (>=) :num->num->bool)
      #|  tends_num_real
      #|  forall x x0. (x --> x0) <=>\n          forall e. &0 < e ==> ?N. forall n. n >= N ==> abs(x(n) - x0) < e
      #|  \226\136\128 k : Real, tends_num_real((x : Num) => k, k)
      #|  forall x x0 y y0. x --> x0 /\\ y --> y0 ==> (\\n. x(n) + y(n)) --> (x0 + y0)
      #|  forall x x0 y y0. x --> x0 /\\ y --> y0 ==> (\\n. x(n) * y(n)) --> (x0 * y0)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 x0 : Real, tends_num_real(x, x0) == tends_num_real((n : Num) => -x(n), -x0)
      #|  forall x x0. x --> x0 /\\ ~(x0 = &0) ==> (\\n. inv(x n)) --> inv x0
      #|  forall x x0 y y0. x --> x0 /\\ y --> y0 ==> (\\n. x(n) - y(n)) --> (x0 - y0)
      #|  forall x x0 y y0. x --> x0 /\\ y --> y0 /\\ ~(y0 = &0) ==>\n                  (\\n. x(n) / y(n)) --> (x0 / y0)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 x1 : Real, \226\136\128 x2 : Real, tends_num_real(x, x1) && tends_num_real(x, x2) \226\134\146 x1 == x2
      #|  \226\136\128 s : (Num) -> Real, \226\136\128 l : Real, tends_num_real(s, l) == tends_num_real((n : Num) => s(n) - l, real_of_num(0))
      #|  forall f l m n.\n      (forall r. m <= r /\\ r < m + n ==> f r --> l r)\n      ==> (\\k. sum(m,n) (\\r. f r k)) --> sum(m,n) l
      #|  (M : Num) + (N : Num) <= (n : Num) \226\134\146 M <= n && N <= n
      #|  forall s t l N. (forall n. N <= n ==> (s n = t n)) /\\ s --> l ==> t --> l
      #|  (convergent : ((Num) -> Real) -> Bool)((f : (Num) -> Real)) == (\226\136\131 l : Real, tends_num_real(f, l))
      #|  cauchy f <=> forall e. &0 < e ==>\n        ?N:num. forall m n. m >= N /\\ n >= N ==> abs(f(m) - f(n)) < e
      #|  (lim : ((Num) -> Real) -> Real)((f : (Num) -> Real)) == select((l : Real) => tends_num_real(f, l))
      #|  lim((f : (Num) -> Real))
      #|  \226\136\128 f : (Num) -> Real, convergent(f) == tends_num_real(f, lim(f))
      #|  subseq (f:num->num) <=> forall m n. m < n ==> (f m) < (f n)
      #|  (f : (Num) -> Num)((m : Num) + SUC((p : Num)))
      #|  (p : Num)
      #|  (p : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 f : (Num) -> Num, subseq(f) == (\226\136\128 n : Num, f(n) < f(SUC(n)))
      #|  mono (f:num->real) <=>\n            (forall m n. m <= n ==> f(m) <= f(n)) \\/\n            (forall m n. m <= n ==> f(m) >= f(n))
      #|  (f : (Num) -> Real)((m : Num) + (p : Num))
      #|  (p : Num)
      #|  (p : Num)
      #|  (p : Num)
      #|  SUC((n : Num))
      #|  (n : Num)
      #|  (n : Num)
      #|  (a : Bool) == (c : Bool) && (b : Bool) == (d : Bool) \226\134\146 (a || b) == (c || d)
      #|  forall f. mono f <=> (forall n. f(SUC n) >= f(n)) \\/ (forall n. f(SUC n) <= f(n))
      #|  (k : Real)
      #|  (n : Num)
      #|  (k : Real)
      #|  abs((s : (Num) -> Real)((N : Num))) + real_of_num(1)
      #|  abs((s : (Num) -> Real)((N : Num)))
      #|  (k : Real)
      #|  (k : Real)
      #|  \226\136\128 s : (Num) -> Real, \226\136\128 N : Num, \226\136\131 k : Real, \226\136\128 n : Num, n < N \226\134\146 abs(s(n)) < k
      #|  0
      #|  (k : Real)
      #|  (k : Real)
      #|  (N : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (k : Real)
      #|  (l : Real)
      #|  (l : Real)
      #|  (k : Real)
      #|  (l : Real)
      #|  (N : Num)
      #|  (s : (Num) -> Real)
      #|  (N : Num)
      #|  (k : Real)
      #|  forall s. bounded(mr1, (>=)) s <=> ?k. forall n:num. abs(s n) < k
      #|  (k : Real)
      #|  real_of_num(0) <= (f : (Num) -> Real)((n : Num))
      #|  abs((k : Real))
      #|  (K : Real)
      #|  abs((K : Real))
      #|  abs((k : Real)) + abs((K : Real))
      #|  abs((k : Real)) + abs((K : Real)) + real_of_num(1)
      #|  forall f k K. (forall n:num. k <= f(n) /\\ f(n) <= K) ==> bounded(mr1, (>=)) f
      #|  (N : Num)
      #|  (N : Num)
      #|  (f : (Num) -> Real)((N : Num))
      #|  real_of_num(1)
      #|  (N : Num)
      #|  real_of_num(1)
      #|  \226\136\128 f : (Num) -> Real, cauchy(f) \226\134\146 bounded((mr1, op_gt_eq), f)
      #|  -sup((x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n))
      #|  sup((x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n))
      #|  (f : (Num) -> Real)((m : Num))
      #|  real_of_num(0)
      #|  (f : (Num) -> Real)((n : Num))
      #|  sup((x : Real) => \226\136\131 m : Num, x == (f : (Num) -> Real)(m)) - (e : Real) < f((m : Num))
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (f : (Num) -> Real)((n : Num))
      #|  (n : Num)
      #|  !((a : Bool) && (b : Bool)) == (a \226\134\146 !b)
      #|  sup((x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n))
      #|  \226\136\128 n : Num, (f : (Num) -> Real)(n) <= sup((x : Real) => \226\136\131 n : Num, x == f(n))
      #|  (n : Num)
      #|  (x : Real)
      #|  sup((x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n)) - (e : Real)
      #|  (e : Real)
      #|  sup((x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n))
      #|  abs((f : (Num) -> Real)((n : Num)))
      #|  (n : Num)
      #|  (k : Real)
      #|  (k : Real)
      #|  0
      #|  (f : (Num) -> Real)(0)
      #|  (x : Real) => \226\136\131 n : Num, x == (f : (Num) -> Real)(n)
      #|  forall f. bounded(mr1, (>=)) f /\\ (forall m n. m >= n ==> f(m) >= f(n))\n           ==> convergent f
      #|  (l : Real)
      #|  -(l : Real)
      #|  (l : Real)
      #|  \226\136\128 f : (Num) -> Real, convergent(f) == convergent((n : Num) => -f(n))
      #|  forall f. bounded(mr1, (>=))(\\n:num. --(f n)) <=> bounded(mr1, (>=)) f
      #|  \226\136\128 f : (Num) -> Real, bounded((mr1, op_gt_eq), f) && mono(f) \226\134\146 convergent(f)
      #|  (f : (Num) -> Num)
      #|  (f : (Num) -> Num)((n : Num))
      #|  SUC((n : Num))
      #|  (f : (Num) -> Num)((n : Num))
      #|  SUC((N : Num))
      #|  (f : (Num) -> Num)(0) >= SUC((N : Num))
      #|  forall n. f(n) >= (SUC N) /\\\n           f(SUC n) > f(n) /\\ s(f n) < s(f(SUC n):num)
      #|  (x : Num) => (n : Num) => select((m : Num) => m > x && (s : (Num) -> Real)(x) < s(m))
      #|  select((m : Num) => m > SUC((N : Num)) && (s : (Num) -> Real)(SUC(N)) < s(m))
      #|  (f : (Num) -> Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  \226\136\128 p : Num, p >= SUC((N : Num)) \226\134\146 (\226\136\131 m : Num, m > p && (s : (Num) -> Real)(p) < s(m))
      #|  !((a : Bool) && (b : Bool)) == (a \226\134\146 !b)
      #|  (N : Num)
      #|  \226\136\128 q : Num, (f : (Num) -> Num)(SUC(q)) >= f(q)
      #|  (q : Num)
      #|  (f : (Num) -> Num)(SUC((q : Num)))
      #|  (q : Num)
      #|  (q : Num)
      #|  \226\136\128 p : Num, \226\136\128 q : Num, p >= (f : (Num) -> Num)(q) \226\134\146 (s : (Num) -> Real)(p) <= s(f(q))
      #|  (f : (Num) -> Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  \\x. \\n:num. @p:num. p > x /\\\n                       (forall m. m >= p ==> (s m) <= (s p))
      #|  select((p : Num) => p > 0 && (\226\136\128 m : Num, m >= p \226\134\146 (s : (Num) -> Real)(m) <= s(p)))
      #|  (f : (Num) -> Num)
      #|  \226\136\128 n : Num, \226\136\131 p : Num, p > n && (\226\136\128 m : Num, m >= p \226\134\146 (s : (Num) -> Real)(m) <= s(p))
      #|  \226\136\128 s : (Num) -> Real, \226\136\131 f : (Num) -> Num, subseq(f) && mono((n : Num) => s(f(n)))
      #|  (f : (Num) -> Num)((n : Num))
      #|  (n : Num)
      #|  0
      #|  (k : Real)
      #|  (k : Real)
      #|  forall s (f:num->num). bounded(mr1, (>=)) s ==> bounded(mr1, (>=)) (\\n. s(f n))
      #|  subseq((f : (Num) -> Num))
      #|  SUC((f : (Num) -> Num)((n : Num)))
      #|  \226\136\128 f : (Num) -> Num, \226\136\128 n : Num, subseq(f) \226\134\146 n <= f(n)
      #|  (N1 : Num)
      #|  (N1 : Num)
      #|  (N2 : Num)
      #|  (N2 : Num)
      #|  (N1 : Num)
      #|  \226\136\128 f : (Num) -> Num, subseq(f) \226\134\146 (\226\136\128 N1 : Num, \226\136\128 N2 : Num, \226\136\131 n : Num, n >= N1 && f(n) >= N2)
      #|  (e : Real)
      #|  abs((f : (Num) -> Real)((m : Num)) - (l : Real)) + abs(l - f((n : Num)))
      #|  (f : (Num) -> Real)((m : Num)) - f((n : Num)) == f(m) - (l : Real) + (l - f(n))
      #|  (N : Num)
      #|  (N : Num)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (l : Real)
      #|  (e : Real)
      #|  abs((f : (Num) -> Real)((m : Num)) - f((g : (Num) -> Num)((n : Num)))) + abs(f(g(n)) - (l : Real))
      #|  (f : (Num) -> Real)((m : Num)) - (l : Real) == f(m) - f((g : (Num) -> Num)((n : Num))) + (f(g(n)) - l)
      #|  (m : Num)
      #|  (g : (Num) -> Num)((n : Num))
      #|  (n : Num)
      #|  \226\136\128 n : Num, n >= (N1 : Num) \226\134\146 abs((f : (Num) -> Real)((g : (Num) -> Num)(n)) - (l : Real)) < (e : Real) / real_of_num(2)
      #|  (m : Num)
      #|  (N2 : Num)
      #|  (n : Num)
      #|  (N2 : Num)
      #|  (N1 : Num)
      #|  (N2 : Num)
      #|  (e : Real) / real_of_num(2)
      #|  cauchy((f : (Num) -> Real))
      #|  (N1 : Num)
      #|  (e : Real) / real_of_num(2)
      #|  tends_num_real((n : Num) => (f : (Num) -> Real)((g : (Num) -> Num)(n)), (l : Real))
      #|  (e : Real)
      #|  (l : Real)
      #|  (l : Real)
      #|  convergent((n : Num) => (f : (Num) -> Real)((g : (Num) -> Num)(n)))
      #|  bounded((mr1, op_gt_eq), (n : Num) => (f : (Num) -> Real)((g : (Num) -> Num)(n)))
      #|  (g : (Num) -> Num)
      #|  (f : (Num) -> Real)
      #|  \226\136\128 f : (Num) -> Real, cauchy(f) == convergent(f)
      #|  (>=) :num->num->bool
      #|  forall f g l m. f --> l /\\ g --> m /\\ (?N. forall n. n >= N ==> f(n) <= g(n))\n        ==> l <= m
      #|  forall f g. f --> &0 /\\ (?N. forall n. n >= N ==> abs(g n) <= abs(f n))\n         ==> g --> &0
      #|  (n : Num)
      #|  (n : Num)
      #|  SUC((N : Num))
      #|  SUC((N : Num))
      #|  (n : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 l : Real, tends_num_real(f, l) == tends_num_real((n : Num) => f(SUC(n)), l)
      #|  (e : Real)
      #|  (e : Real)
      #|  \226\136\128 f : (Num) -> Real, tends_num_real((n : Num) => abs(f(n)), real_of_num(0)) == tends_num_real(f, real_of_num(0))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 l : Real, tends_num_real(f, l) \226\134\146 tends_num_real((n : Num) => abs(f(n)), abs(l))
      #|  (f : (Num) -> Real)((n : Num))
      #|  (e : Real) == inv(inv(e))
      #|  !((f : (Num) -> Real)((n : Num)) == real_of_num(0))
      #|  real_of_num(0) < inv((f : (Num) -> Real)((n : Num)))
      #|  inv((e : Real))
      #|  real_of_num(0) < (f : (Num) -> Real)((n : Num))
      #|  (n : Num)
      #|  (N : Num)
      #|  inv((e : Real))
      #|  (N : Num)
      #|  (e : Real)
      #|  forall f. (forall y. ?N. forall n. n >= N ==> f(n) > y)\n        ==> (\\n. inv(f n)) --> &0
      #|  real_of_num(0) < (e : Real)
      #|  1
      #|  (n : Num)
      #|  (n : Num)
      #|  1
      #|  pow(real_of_num(1) + (inv(abs((c : Real))) - real_of_num(1)), (n : Num))
      #|  real_of_num(1) + real_of_num((n : Num)) * (inv(abs((c : Real))) - real_of_num(1))
      #|  real_of_num((n : Num)) * (inv(abs((c : Real))) - real_of_num(1))
      #|  real_of_num((N : Num)) * (inv(abs((c : Real))) - real_of_num(1))
      #|  (y : Real) < real_of_num((n : Num)) * (inv(abs((c : Real))) - real_of_num(1))
      #|  (n : Num)
      #|  (N : Num)
      #|  (y : Real)
      #|  (N : Num)
      #|  inv(abs((c : Real))) - real_of_num(1)
      #|  real_of_num(0) < inv(abs((c : Real))) - real_of_num(1)
      #|  !(abs((c : Real)) == real_of_num(0))
      #|  (y : Real)
      #|  inv(pow(abs((c : Real)), (n : Num)))
      #|  (n : Num)
      #|  forall n. abs(c) pow n = inv(inv(abs(c) pow n))
      #|  (c : Real)
      #|  \226\136\128 c : Real, abs(c) < real_of_num(1) \226\134\146 tends_num_real((n : Num) => pow(abs(c), n), real_of_num(0))
      #|  \226\136\128 c : Real, abs(c) < real_of_num(1) \226\134\146 tends_num_real((n : Num) => pow(c, n), real_of_num(0))
      #|  (N : Num) + 1 <= (n : Num)
      #|  real_of_num((N : Num)) * (e : Real)
      #|  (N : Num) + 1 <= (n : Num)
      #|  real_of_num(0) < real_of_num((n : Num))
      #|  (n : Num)
      #|  (N : Num) + 1
      #|  (N : Num)
      #|  abs((a : Real))
      #|  (e : Real)
      #|  \226\136\128 a : Real, tends_num_real((n : Num) => a / real_of_num(n), real_of_num(0))
      #|  1 * (n : Num) <= (a : Num) * n \226\134\146 n <= a * n + (b : Num)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 n <= a * n + b
      #|  forall f l. f --> l ==> forall a b. ~(a = 0) ==> (\\n. f(a * n + b)) --> l
      #|  forall f l. (f --> l) ==> forall n. (\\i. f(i) pow n) --> l pow n
      #|  (g : (Num) -> Real)((p : Num) + (m : Num))
      #|  (p : Num)
      #|  (p : Num)
      #|  (g : (Num) -> Real)((p : Num) + (m : Num))
      #|  \226\136\128 p : Num, (g : (Num) -> Real)(p + (m : Num)) < lim(g)
      #|  (p : Num) + (m : Num)
      #|  (p : Num)
      #|  lim((g : (Num) -> Real)) - g((m : Num))
      #|  tends_num_real((g : (Num) -> Real), lim(g))
      #|  (a : Bool) == !!a
      #|  (m : Num)
      #|  (f : (Num) -> Real)((p : Num) + (m : Num))
      #|  (p : Num)
      #|  (p : Num)
      #|  (f : (Num) -> Real)((p : Num) + (m : Num))
      #|  \226\136\128 p : Num, lim((f : (Num) -> Real)) <= f(p + (m : Num))
      #|  (p : Num) + (m : Num)
      #|  (p : Num)
      #|  (f : (Num) -> Real)((m : Num)) - lim(f)
      #|  tends_num_real((f : (Num) -> Real), lim(f))
      #|  (a : Bool) == !!a
      #|  (m : Num)
      #|  (g : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  lim((g : (Num) -> Real))
      #|  lim((f : (Num) -> Real))
      #|  (g : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  (g : (Num) -> Real)((n : Num))
      #|  (f : (Num) -> Real)((m : Num))
      #|  (m : Num)
      #|  SUC((n : Num))
      #|  (f : (Num) -> Real)(SUC((n : Num)))
      #|  (g : (Num) -> Real)(0)
      #|  (f : (Num) -> Real)(0)
      #|  bounded((mr1, op_gt_eq), (g : (Num) -> Real))
      #|  (g : (Num) -> Real)((m : Num))
      #|  (m : Num)
      #|  SUC((n : Num))
      #|  (g : (Num) -> Real)(SUC((n : Num)))
      #|  (f : (Num) -> Real)((n : Num))
      #|  (g : (Num) -> Real)(0)
      #|  (f : (Num) -> Real)(0)
      #|  bounded((mr1, op_gt_eq), (f : (Num) -> Real))
      #|  (g : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  forall f g. (forall n. f(SUC n) >= f(n)) /\\\n         (forall n. g(SUC n) <= g(n)) /\\\n         (forall n. f(n) <= g(n)) ==>\n                ?l m. l <= m /\\ ((forall n. f(n) <= l) /\\ f --> l) /\\\n                                ((forall n. m <= g(n)) /\\ g --> m)
      #|  tends_num_real((n : Num) => (f : (Num) -> Real)(n) - (g : (Num) -> Real)(n), real_of_num(0))
      #|  (m : Real)
      #|  (g : (Num) -> Real)
      #|  (l : Real)
      #|  (f : (Num) -> Real)
      #|  (l : Real) == (m : Real)
      #|  (l : Real)
      #|  (m : Real)
      #|  (l : Real)
      #|  forall f g. (forall n. f(SUC n) >= f(n)) /\\\n         (forall n. g(SUC n) <= g(n)) /\\\n         (forall n. f(n) <= g(n)) /\\\n         (\\n. f(n) - g(n)) --> &0 ==>\n                ?l. ((forall n. f(n) <= l) /\\ f --> l) /\\\n                    ((forall n. l <= g(n)) /\\ g --> l)
      #|  (a : Real) + ((b : Real) + ((c : Real) + (d : Real))) == d + a + (c + b)
      #|  abs(FST(f(N1 + N2:num)) - l) +\n                abs(SND(f(N1 + N2:num)) - l)
      #|  \226\136\128 n : Num, SND((f : (Num) -> (Real, Real))(n)) - FST(f(n)) == ((b : Real) - (a : Real)) / pow(real_of_num(2), n)
      #|  SND((f : (Num) -> (Real, Real))((N1 : Num) + (N2 : Num)))
      #|  FST((f : (Num) -> (Real, Real))((N1 : Num) + (N2 : Num)))
      #|  (N2 : Num)
      #|  (d : Real) / real_of_num(2)
      #|  (N1 : Num)
      #|  (d : Real) / real_of_num(2)
      #|  tends_num_real((n : Num) => FST((f : (Num) -> (Real, Real))(n)), (l : Real))
      #|  tends_num_real((n : Num) => SND((f : (Num) -> (Real, Real))(n)), (l : Real))
      #|  (l : Real)
      #|  (d : Real)
      #|  (l : Real)
      #|  2
      #|  2
      #|  real_of_num(0) < real_of_num(2)
      #|  real_of_num(0)
      #|  (n : Num) => inv(pow(real_of_num(2), n))
      #|  (b : Real) - (a : Real)
      #|  (n : Num) => (b : Real) - (a : Real)
      #|  2
      #|  !(real_of_num(2) == real_of_num(0))
      #|  2
      #|  2
      #|  !(real_of_num(2) == real_of_num(0)) && !(pow(real_of_num(2), (n : Num)) == real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x + y - (x + z) == y - z
      #|  2
      #|  !(real_of_num(2) == real_of_num(0))
      #|  real_of_num(2)
      #|  \226\136\128 n : Num, SND((f : (Num) -> (Real, Real))(n)) - FST(f(n)) == ((b : Real) - (a : Real)) / pow(real_of_num(2), n)
      #|  \226\136\128 n : Num, SND((f : (Num) -> (Real, Real))(SUC(n))) <= SND(f(n))
      #|  (FST((f : (Num) -> (Real, Real))((n : Num))) + SND(f(n))) / real_of_num(2)
      #|  !(P : ((Real, Real)) -> Bool)((FST((f : (Num) -> (Real, Real))((n : Num))), SND(f(n))))
      #|  \226\136\128 n : Num, !(P : ((Real, Real)) -> Bool)((FST((f : (Num) -> (Real, Real))(n)), SND(f(n))))
      #|  \226\136\128 n : Num, FST((f : (Num) -> (Real, Real))(n)) <= FST(f(SUC(n)))
      #|  \226\136\128 n : Num, FST((f : (Num) -> (Real, Real))(n)) <= SND(f(n))
      #|  (n : Num) => SND((f : (Num) -> (Real, Real))(n))
      #|  (n : Num) => FST((f : (Num) -> (Real, Real))(n))
      #|  \\fn_ (n:num). if P(FST fn_,(FST fn_ + SND fn_)/ &2) then\n                        ((FST fn_ + SND fn_)/ &2,SND fn_) else\n                        (FST fn_,(FST fn_ + SND fn_)/ &2)
      #|  ((a : Real), (b : Real))
      #|  (f : (Num) -> (Real, Real))
      #|  (a : Bool) == !!a
      #|  forall P. (forall a b c. a <= b /\\ b <= c /\\ P(a,b) /\\ P(b,c) ==> P(a,c)) /\\\n       (forall x. ?d. &0 < d /\\ forall a b. a <= x /\\ x <= b /\\ (b - a) < d ==> P(a,b))\n      ==> forall a b. a <= b ==> P(a,b)
      #|  GABS((f : ((Real, Real)) -> Bool) => \226\136\128 x : Real, \226\136\128 y : Real, GEQ(f((x, y)), (P : (Real, Real) -> Bool)(x, y)))
      #|  forall P. (forall a b c. a <= b /\\ b <= c /\\ P a b /\\ P b c ==> P a c) /\\\n       (forall x. ?d. &0 < d /\\ (forall a b. a <= x /\\ x <= b /\\ b - a < d ==> P a b))\n       ==> forall a b. a <= b ==> P a b
      #|  (sums : ((Num) -> Real, Real) -> Bool)((f : (Num) -> Real), (s : Real)) == tends_num_real((n : Num) => sum((0, n), f), s)
      #|  (summable : ((Num) -> Real) -> Bool)((f : (Num) -> Real)) == (\226\136\131 s : Real, sums(f, s))
      #|  (suminf : ((Num) -> Real) -> Real)((f : (Num) -> Real)) == select((s : Real) => sums(f, s))
      #|  (l : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 l : Real, sums(f, l) \226\134\146 summable(f)
      #|  \226\136\128 f : (Num) -> Real, summable(f) \226\134\146 sums(f, suminf(f))
      #|  (n : Num) => sum((0, n), (f : (Num) -> Real))
      #|  (x : Real)
      #|  summable((f : (Num) -> Real))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 x : Real, sums(f, x) \226\134\146 x == suminf(f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 x : Real, \226\136\128 y : Real, sums(f, x) && sums(f, y) \226\134\146 x == y
      #|  real_of_num(0)
      #|  (d : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (e : Real)
      #|  forall f n. (forall m. n <= m ==> (f(m) = &0)) ==>\n        f sums (sum(0,n) f)
      #|  (d : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) \226\134\146 (d : Bool)) == (c \226\134\146 a && b \226\134\146 d)
      #|  sum((0, (n : Num)), (f : (Num) -> Real))
      #|  forall f n. summable f /\\ (forall m. n <= m ==> &0 <= f(m))\n        ==> sum(0,n) f <= suminf f
      #|  SUC((n : Num))
      #|  1
      #|  sum((0, (n : Num) + 1), (f : (Num) -> Real))
      #|  forall f n. summable f /\\ (forall m. n <= m ==> &0 < f(m))\n        ==> sum(0,n) f < suminf f
      #|  (k : Num)
      #|  0 < (k : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  forall f k. summable f /\\ 0 < k ==>\n          (\\n. sum(n * k,k) f) sums (suminf f)
      #|  (e : Real)
      #|  2
      #|  1
      #|  forall f. summable f ==> (\\n. sum(2 * n,2) f) sums (suminf f)
      #|  (n : Num)
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + d + (a + c)
      #|  (n : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  forall f. summable f ==> forall k. (\\n. f(n + k)) sums (suminf f - sum(0,k) f)
      #|  (a : Real) - ((b : Real) + (c : Real)) == a - b - c
      #|  (N : Num) + (k : Num) + (d : Num) == k + (N + d)
      #|  (d : Num)
      #|  (n : Num)
      #|  (N : Num) + (k : Num)
      #|  (N : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool) \226\134\146 (c : Bool)) \226\134\146 (a \226\134\146 b) \226\134\146 a \226\134\146 c
      #|  forall f k. summable(\\n. f(n + k)) ==>\n         f sums (sum(0,k) f) + suminf (\\n. f(n + k))
      #|  suminf((f : (Num) -> Real)) + (f((n : Num)) + f(n + 1))
      #|  suminf((f : (Num) -> Real)) <= sum((0, 2 * SUC((N : Num)) + (n : Num)), f)
      #|  sum((0, (n : Num)), (f : (Num) -> Real)) + (f(n) + f(n + 1))
      #|  sum((0, (n : Num) + 2), (f : (Num) -> Real))
      #|  (suminf f + (f(n) + f(n + 1))) <=\n                              sum(0,(2 * (SUC N)) + n) f
      #|  (a : Num) + ((b : Num) + (c : Num)) + (d : Num) == b + (a + (c + d))
      #|  2
      #|  2 * SUC((N : Num)) + (n : Num)
      #|  1
      #|  sum((0, 2 * (M : Num) + (n : Num)), (f : (Num) -> Real))
      #|  2
      #|  2
      #|  2
      #|  (M : Num) == SUC((N : Num))
      #|  (N : Num)
      #|  (N : Num)
      #|  sum((0, (n : Num) + 2), (f : (Num) -> Real)) <= sum((0, 2 * SUC((N : Num)) + n), f)
      #|  (N : Num)
      #|  0
      #|  (f : (Num) -> Real)((n : Num)) + f(n + 1)
      #|  forall f n. summable f /\\\n         (forall d. &0 < (f(n + (2 * d))) +\n               f(n + ((2 * d) + 1)))\n        ==> sum(0,n) f < suminf f
      #|  sum((0, (n : Num)), (y : (Num) -> Real))
      #|  (n : Num)
      #|  sum((0, (n : Num)), (x : (Num) -> Real))
      #|  (n : Num)
      #|  forall x x0 y y0. x sums x0 /\\ y sums y0 ==> (\\n. x(n) + y(n)) sums (x0 + y0)
      #|  tends_num_real((n : Num) => ((n : Num) => (c : Real))(n) * ((n : Num) => sum((0, n), (x : (Num) -> Real)))(n), c * (x0 : Real))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 x0 : Real, \226\136\128 c : Real, sums(x, x0) \226\134\146 sums((n : Num) => c * x(n), c * x0)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 x0 : Real, sums(x, x0) \226\134\146 sums((n : Num) => -x(n), -x0)
      #|  forall x x0 y y0. x sums x0 /\\ y sums y0 ==> (\\n. x(n) - y(n)) sums (x0 - y0)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 x0 : Real, \226\136\128 c : Real, sums(x, x0) \226\134\146 sums((n : Num) => x(n) / c, x0 / c)
      #|  (p : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  (((a : Bool) \226\134\146 (b : Bool)) == (a \226\134\146 (c : Bool))) == (a \226\134\146 b == c)
      #|  forall f. summable f <=>\n          forall e. &0 < e ==> ?N. forall m n. m >= N ==> abs(sum(m,n) f) < e
      #|  SUC(0)
      #|  (n : Num)
      #|  (n : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  summable((f : (Num) -> Real))
      #|  (e : Real)
      #|  \226\136\128 f : (Num) -> Real, summable(f) \226\134\146 tends_num_real(f, real_of_num(0))
      #|  (N1 : Num) + (N2 : Num)
      #|  abs(sum(((m : Num), (n : Num)), (g : (Num) -> Real)))
      #|  (N1 : Num) + (N2 : Num)
      #|  (m : Num)
      #|  (p : Num)
      #|  sum(((m : Num), (n : Num)), (g : (Num) -> Real))
      #|  sum(((m : Num), (n : Num)), (k : Num) => abs((f : (Num) -> Real)(k)))
      #|  (N1 : Num) + (N2 : Num)
      #|  (N2 : Num)
      #|  (e : Real)
      #|  (N1 : Num)
      #|  forall f g. (?N. forall n. n >= N ==> abs(f(n)) <= g(n)) /\\ summable g ==>\n            summable f
      #|  \226\136\128 n : Num, abs((f : (Num) -> Real)(n)) == abs(((k : Num) => abs(f(k)))(n))
      #|  forall f g. (?N. forall n. n >= N ==> abs(f(n)) <= g(n)) /\\ summable g ==>\n            summable (\\k. abs(f k))
      #|  0
      #|  (n : Num) => sum((0, n), (g : (Num) -> Real))
      #|  (n : Num) => sum((0, n), (f : (Num) -> Real))
      #|  forall f g. (forall n. f(n) <= g(n)) /\\ summable f /\\ summable g\n        ==> suminf f <= suminf g
      #|  abs((f : (Num) -> Real)((n : Num)))
      #|  (n : Num)
      #|  (g : (Num) -> Real)
      #|  summable((f : (Num) -> Real))
      #|  forall f g. (forall n. abs(f n) <= g(n)) /\\ summable g ==>\n                summable f /\\ suminf f <= suminf g
      #|  sum(((m : Num), (n : Num)), (m : Num) => abs((f : (Num) -> Real)(m)))
      #|  (N : Num)
      #|  (N : Num)
      #|  (e : Real)
      #|  \226\136\128 f : (Num) -> Real, summable((n : Num) => abs(f(n))) \226\134\146 summable(f)
      #|  (n : Num)
      #|  0
      #|  (n : Num) => sum((0, n), (n : Num) => abs((f : (Num) -> Real)(n)))
      #|  (n : Num) => abs(sum((0, n), (f : (Num) -> Real)))
      #|  forall f. summable(\\n. abs(f n)) ==> abs(suminf f) <= suminf(\\n. abs(f n))
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == c + b + (d + a)
      #|  \226\136\128 p : Real, p / ((x : Real) - real_of_num(1)) * (x - real_of_num(1)) == p
      #|  (x : Real) - real_of_num(1)
      #|  (q : Real)
      #|  (p : Real)
      #|  (q : Real)
      #|  (p : Real)
      #|  !((x : Real) - real_of_num(1) == real_of_num(0))
      #|  forall x. ~(x = &1) ==>\n        forall n. (sum(0,n) (\\n. x pow n) = ((x pow n) - &1) / (x - &1))
      #|  tends_num_real((n : Num) => ((n : Num) => real_of_num(1))(n) - ((n : Num) => pow((x : Real), n))(n), real_of_num(1) - real_of_num(0))
      #|  (\\n. (\\n. &1 - x pow n) n / (\\n. &1 - x) n) --> &1 / (&1 - x)
      #|  !((x : Real) - real_of_num(1) == real_of_num(0))
      #|  x = &1
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 sums((n : Num) => pow(x, n), inv(real_of_num(1) - x))
      #|  abs((y : Real))
      #|  -(c : Real)
      #|  forall c x y. c <= &0 ==> abs(x) <= c * abs(y) ==> (x = &0)
      #|  real_of_num(0) < (c : Real)
      #|  abs((f : (Num) -> Real)((N : Num))) / pow((c : Real), N) * inv(real_of_num(1) - c)
      #|  (a : Real) * ((b : Real) * (c : Real)) == b * (a * c)
      #|  (c : Real) * abs((f : (Num) -> Real)((N : Num) + (d : Num)))
      #|  (d : Num)
      #|  (d : Num)
      #|  !(pow((c : Real), (N : Num)) == real_of_num(0))
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * d * (b * c)
      #|  (d : Num)
      #|  (n : Num)
      #|  (N : Num)
      #|  (n : Num) => abs((f : (Num) -> Real)((N : Num))) / pow((c : Real), N) * pow(c, n)
      #|  SUC((N : Num))
      #|  (n : Num)
      #|  \226\136\128 n : Num, n >= SUC((N : Num)) \226\134\146 (f : (Num) -> Real)(n) == real_of_num(0)
      #|  \226\136\128 n : Num, n >= (N : Num) \226\134\146 (f : (Num) -> Real)(SUC(n)) == real_of_num(0)
      #|  (e : Real)
      #|  real_of_num(0)
      #|  (c : Real)
      #|  forall f c N. c < &1 /\\\n           (forall n. n >= N ==> abs(f(SUC n)) <= c * abs(f(n))) ==>\n       summable f
      #|  (r : Num) => (b : Real)
      #|  (n : Num)
      #|  forall f l n b.\n        f sums l /\\ (forall m. abs(sum(n,m) f) <= b)\n        ==> abs(l - sum(0,n) f) <= b
      #|  (f tends_real_real l)(x0) <=>\n        (f tends l)(mtop(mr1),tendsto(mr1,x0))
      #|  tends_real_real
      #|  (x0 : Real)
      #|  forall f y0 x0. (f --> y0)(x0) <=>\n        forall e. &0 < e ==>\n            ?d. &0 < d /\\ forall x. &0 < abs(x - x0) /\\ abs(x - x0) < d ==>\n                abs(f(x) - y0) < e
      #|  (z : Real)
      #|  (z : Real)
      #|  (e : Real)
      #|  (x : Real)
      #|  \226\136\128 k : Real, \226\136\128 x : Real, tends_real_real((x : Real) => k, k, x)
      #|  forall f g l m. (f --> l)(x) /\\ (g --> m)(x) ==>\n      ((\\x. f(x) + g(x)) --> (l + m))(x)
      #|  forall f g l m. (f --> l)(x) /\\ (g --> m)(x) ==>\n      ((\\x. f(x) * g(x)) --> (l * m))(x)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 l : Real, tends_real_real(f, l, (x : Real)) == tends_real_real((x : Real) => -f(x), -l, x)
      #|  forall f l. (f --> l)(x) /\\ ~(l = &0) ==>\n        ((\\x. inv(f(x))) --> inv l)(x)
      #|  forall f g l m. (f --> l)(x) /\\ (g --> m)(x) ==>\n      ((\\x. f(x) - g(x)) --> (l - m))(x)
      #|  forall f g l m. (f --> l)(x) /\\ (g --> m)(x) /\\ ~(m = &0) ==>\n      ((\\x. f(x) / g(x)) --> (l / m))(x)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 l : Real, \226\136\128 x : Real, tends_real_real(f, l, x) == tends_real_real((x : Real) => f(x) - l, real_of_num(0), x)
      #|  forall f l m n x.\n      (forall r. m <= r /\\ r < m + n ==> (f r --> l r)(x))\n      ==> ((\\x. sum(m,n) (\\r. f r x)) --> sum(m,n) l)(x)
      #|  (e : Real)
      #|  (e : Real)
      #|  \226\136\128 x0 : Real, tends_real_real((x : Real) => x, x0, x0)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 l : Real, \226\136\128 m : Real, \226\136\128 x : Real, tends_real_real(f, l, x) && tends_real_real(f, m, x) \226\134\146 l == m
      #|  (((a : Bool) \226\134\146 (b : Bool)) == (a \226\134\146 (c : Bool))) == (a \226\134\146 b == c)
      #|  forall f g l x0. (forall x. ~(x = x0) ==> (f x = g x)) ==>\n        ((f --> l)(x0) <=> (g --> l)(x0))
      #|  (b : Real)
      #|  (l : Real)
      #|  (g : (Real) -> Real)((x : Real))
      #|  (f : (Real) -> Real)((x : Real))
      #|  abs((f : (Real) -> Real)((x : Real)) - (g : (Real) -> Real)(x)) + abs(g(x) - (l : Real))
      #|  (e : Real) / real_of_num(2) + e / real_of_num(2)
      #|  (x : Real)
      #|  (b : Real)
      #|  (b : Real)
      #|  (d : Real)
      #|  (c : Real)
      #|  (c : Real)
      #|  (d : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  forall f g x0 l. ((\\x. f(x) - g(x)) --> &0)(x0) /\\ (g --> l)(x0)\n        ==> (f --> l)(x0)
      #|  (f diffl l)(x) <=> ((\\h. (f(x+h) - f(x)) / h) --> l)(&0)
      #|  (contl : ((Real) -> Real, Real) -> Bool)((f : (Real) -> Real), (x : Real)) == tends_real_real((h : Real) => f(x + h), f(x), real_of_num(0))
      #|  (differentiable : ((Real) -> Real, Real) -> Bool)((f : (Real) -> Real), (x : Real)) == (\226\136\131 l : Real, diffl(f, l, x))
      #|  forall f l m x. (f diffl l)(x) /\\ (f diffl m)(x) ==> (l = m)
      #|  (e : Real)
      #|  (e : Real)
      #|  (l : Real)
      #|  ((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x)) / h
      #|  (h : Real)
      #|  ((h : Real) => h)((h : Real))
      #|  (z : Real)
      #|  ((\\h. f(x + h) - f(x)) --> &0)(&0) <=>\n                ((\\h. ((f(x + h) - f(x)) / h) * h) --> &0)(&0)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 l : Real, \226\136\128 x : Real, diffl(f, l, x) \226\134\146 contl(f, x)
      #|  (k : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (((a : Bool) \226\134\146 (b : Bool)) == (a \226\134\146 (c : Bool))) == (a \226\134\146 b == c)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 x : Real, contl(f, x) == tends_real_real(f, f(x), x)
      #|  \226\136\128 x : Real, contl((x : Real) => x, x)
      #|  \226\136\128 x : Real, contl((x : Real) => (k : Real), x)
      #|  forall x. f contl x /\\ g contl x ==> (\\x. f(x) + g(x)) contl x
      #|  forall x. f contl x /\\ g contl x ==> (\\x. f(x) * g(x)) contl x
      #|  \226\136\128 x : Real, contl((f : (Real) -> Real), x) \226\134\146 contl((x : Real) => -f(x), x)
      #|  forall x. f contl x /\\ ~(f x = &0) ==> (\\x. inv(f(x))) contl x
      #|  forall x. f contl x /\\ g contl x ==> (\\x. f(x) - g(x)) contl x
      #|  forall x. f contl x /\\ g contl x /\\ ~(g x = &0) ==>\n        (\\x. f(x) / g(x)) contl x
      #|  abs((a : Real) - (b : Real)) < (e : Real) \226\134\146 abs(abs(a) - abs(b)) < e
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 x : Real, contl(f, x) \226\134\146 contl((x : Real) => abs(f(x)), x)
      #|  !(real_of_num(0) < abs((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x)))
      #|  real_of_num(0) < abs((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x))
      #|  real_of_num(0) < abs((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x))
      #|  (h : Real)
      #|  (c : Real)
      #|  (c : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (e : Real)
      #|  forall f g x. f contl x /\\ g contl (f x) ==> (\\x. g(f x)) contl x
      #|  (y : Real)
      #|  (f : (Real) -> Real)((u : Real)) < f((x : Real))
      #|  (v : Real) - (u : Real)
      #|  (y : Real) < (f : (Real) -> Real)((x : Real))
      #|  (u : Real) - (x : Real)
      #|  (y : Real)
      #|  (f : (Real) -> Real)((x : Real)) <= f((v : Real))
      #|  (f : (Real) -> Real)((x : Real)) <= (y : Real)
      #|  (v : Real) - (u : Real)
      #|  (f : (Real) -> Real)((v : Real)) < (y : Real)
      #|  (v : Real) - (x : Real)
      #|  (y : Real)
      #|  (f : (Real) -> Real)((x : Real))
      #|  (v : Real)
      #|  (u : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  abs((y : Real) - (f : (Real) -> Real)((x : Real)))
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 contl((f : (Real) -> Real), x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, !((a : Real) <= x && x <= (b : Real) && (f : (Real) -> Real)(x) == (y : Real))
      #|  (v : Real)
      #|  (u : Real)
      #|  !((a : Real) <= (x : Real) && x <= (b : Real))
      #|  (v : Real)
      #|  (u : Real)
      #|  real_of_num(1)
      #|  (a : Real) <= (x : Real) && x <= (b : Real)
      #|  (x : Real)
      #|  (u : Real)
      #|  (w : Real)
      #|  (f : (Real) -> Real)((v : Real))
      #|  (y : Real)
      #|  (v : Real) <= (w : Real)
      #|  (u : Real) <= (v : Real)
      #|  (w : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  \\(u,v). a <= u /\\ u <= v /\\ v <= b ==> ~(f(u) <= y /\\ y <= f(v))
      #|  forall f a b y. a <= b /\\\n             (f(a) <= y /\\ y <= f(b)) /\\\n             (forall x. a <= x /\\ x <= b ==> f contl x)\n        ==> (?x. a <= x /\\ x <= b /\\ (f(x) = y))
      #|  -(y : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => -(f : (Real) -> Real)(x)
      #|  forall f a b y. (a <= b) /\\ (f(b) <= y /\\ y <= f(a)) /\\\n             (forall x. a <= x /\\ x <= b ==> f contl x) ==>\n        ?x. a <= x /\\ x <= b /\\ (f(x) = y)
      #|  \226\136\128 k : Real, \226\136\128 x : Real, diffl((x : Real) => k, real_of_num(0), x)
      #|  ((g : (Real) -> Real)((x : Real) + (h : Real)) - g(x)) / h
      #|  (h : Real)
      #|  ((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x)) / h
      #|  (h : Real)
      #|  forall f g l m x. (f diffl l)(x) /\\ (g diffl m)(x) ==>\n                   ((\\x. f(x) + g(x)) diffl (l + m))(x)
      #|  (l : Real)
      #|  (g : (Real) -> Real)((x : Real))
      #|  ((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x)) / h
      #|  (f : (Real) -> Real)((x : Real) + (h : Real))
      #|  ((g : (Real) -> Real)((x : Real) + (h : Real)) - g(x)) / h
      #|  (h : Real)
      #|  ((f : (Real) -> Real)((x : Real) + (h : Real)) - f(x)) / h * (g : (Real) -> Real)(x)
      #|  ((g : (Real) -> Real)((x : Real) + (h : Real)) - g(x)) / h * (f : (Real) -> Real)(x + h)
      #|  (h : Real)
      #|  forall a b c d e. ((a * b) + (c * d)) / e = ((b / e) * a) + ((c / e) * d)
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + c + (a + d)
      #|  forall a b c d. (a * b) - (c * d) = ((a * b) - (a * d)) + ((a * d) - (c * d))
      #|  forall f g l m x. (f diffl l)(x) /\\ (g diffl m)(x) ==>\n                  ((\\x. f(x) * g(x)) diffl ((l * g(x)) + (m * f(x))))(x)
      #|  (a : Bool) == (b : Bool) \226\134\146 a \226\134\146 b
      #|  (x : Real)
      #|  (c : Real)
      #|  forall f c l x. (f diffl l)(x) ==> ((\\x. c * f(x)) diffl (c * l))(x)
      #|  forall f l x. (f diffl l)(x) ==> ((\\x. --(f x)) diffl --l)(x)
      #|  forall f g l m x. (f diffl l)(x) /\\ (g diffl m)(x) ==>\n                   ((\\x. f(x) - g(x)) diffl (l - m))(x)
      #|  contl((g : (Real) -> Real), (x : Real))
      #|  (g : (Real) -> Real)
      #|  (z : Real)
      #|  \\z. if z = x then l else (f(z) - f(x)) / (z - x)
      #|  forall f l x. (f diffl l)(x) <=>\n      ?g. (forall z. f(z) - f(x) = g(z) * (z - x)) /\\ g contl x /\\ (g(x) = l)
      #|  (z : Real)
      #|  contl((g' : (Real) -> Real), (x : Real))
      #|  contl((f' : (Real) -> Real), (g : (Real) -> Real)((x : Real)))
      #|  contl((g : (Real) -> Real), (x : Real))
      #|  \\z. if z = x then l * m else (f(g(z):real) - f(g(x))) / (z - x)
      #|  (f' : (Real) -> Real)
      #|  (g' : (Real) -> Real)
      #|  forall f g l m x.\n     (f diffl l)(g x) /\\ (g diffl m)(x) ==> ((\\x. f(g x)) diffl (l * m))(x)
      #|  real_of_num(1)
      #|  (e : Real)
      #|  \226\136\128 x : Real, diffl((x : Real) => x, real_of_num(1), x)
      #|  1
      #|  1
      #|  (n : Num)
      #|  (x : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  forall n x. ((\\x. x pow n) diffl (&n * (x pow (n - 1))))(x)
      #|  (h : Real)
      #|  (x : Real)
      #|  (h : Real)
      #|  (x : Real) + (h : Real)
      #|  (h : Real)
      #|  inv((x : Real))
      #|  inv((x : Real) + (h : Real))
      #|  (h : Real)
      #|  inv((x : Real) + (h : Real)) * inv(x)
      #|  (h : Real)
      #|  real_neg
      #|  !((x : Real) == real_of_num(0))
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * d * (c * b)
      #|  !((x : Real) + (h : Real) == real_of_num(0))
      #|  !((x : Real) == real_of_num(0))
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == c * b * (d * a)
      #|  abs((h : Real)) < abs(-h)
      #|  !((x : Real) + (h : Real) == real_of_num(0))
      #|  real_of_num(0)
      #|  (h : Real)
      #|  abs((x : Real))
      #|  (e : Real)
      #|  (h : Real) => -(inv((x : Real) + h) * inv(x))
      #|  forall x. ~(x = &0) ==> ((\\x. inv(x)) diffl (--(inv(x) pow 2)))(x)
      #|  (x : Real) * (x + (h : Real))
      #|  forall f l x. (f diffl l)(x) /\\ ~(f(x) = &0) ==>\n        ((\\x. inv(f x)) diffl --(l / (f(x) pow 2)))(x)
      #|  diffl((f : (Real) -> Real), (l : Real), (x : Real))
      #|  (x : Real)
      #|  (m : Real)
      #|  (g : (Real) -> Real)
      #|  forall f g l m. (f diffl l)(x) /\\ (g diffl m)(x) /\\ ~(g(x) = &0) ==>\n    ((\\x. f(x) / g(x)) diffl (((l * g(x)) - (m * f(x))) / (g(x) pow 2)))(x)
      #|  (m : Num) + (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  forall f f' m n x. (forall r. m <= r /\\ r < (m + n)\n                 ==> ((\\x. f r x) diffl (f' r x))(x))\n     ==> ((\\x. sum(m,n)(\\n. f n x)) diffl (sum(m,n) (\\r. f' r x)))(x)
      #|  (v : Real) - (z : Real)
      #|  (v : Real) - (x : Real)
      #|  (v : Real) - (u : Real)
      #|  (z : Real) == (x : Real)
      #|  abs((f : (Real) -> Real)((x : Real))) + abs(f((z : Real)) - f(x))
      #|  abs((f : (Real) -> Real)((z : Real)))
      #|  (f : (Real) -> Real)((x : Real))
      #|  (f : (Real) -> Real)((z : Real)) - f((x : Real))
      #|  (z : Real) - (x : Real)
      #|  (z : Real)
      #|  abs((f : (Real) -> Real)((x : Real))) + real_of_num(1)
      #|  (v : Real)
      #|  (u : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  real_of_num(1)
      #|  (x : Real)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 contl((f : (Real) -> Real), x)
      #|  (v : Real)
      #|  (u : Real)
      #|  !((a : Real) <= (x : Real) && x <= (b : Real))
      #|  (v : Real)
      #|  (u : Real)
      #|  real_of_num(1)
      #|  (a : Real) <= (x : Real) && x <= (b : Real)
      #|  (x : Real)
      #|  (M2 : Real)
      #|  (v : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (M1 : Real)
      #|  (M1 : Real)
      #|  (v : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (M2 : Real)
      #|  (M2 : Real)
      #|  (M1 : Real)
      #|  (M2 : Real)
      #|  (M1 : Real)
      #|  (u : Real)
      #|  (a : Real) <= (v : Real)
      #|  (w : Real)
      #|  (v : Real) <= (b : Real)
      #|  (w : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  \\(u,v). a <= u /\\ u <= v /\\ v <= b ==>\n               ?M. forall x. u <= x /\\ x <= v ==> f x <= M
      #|  forall f a b. (a <= b /\\ forall x. a <= x /\\ x <= b ==> f contl x)\n        ==> ?M. forall x. a <= x /\\ x <= b ==> f(x) <= M
      #|  x <= m1 /\\ --x <= m2 ==> abs(x) <= abs(m2) + abs(m1)
      #|  abs((M1 : Real)) + abs((M2 : Real))
      #|  (M2 : Real)
      #|  (M1 : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => -(f : (Real) -> Real)(x)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  !((a : Real) <= (b : Real)) \226\134\146 !(a <= (x : Real) && x <= b)
      #|  (a : Real) <= (b : Real)
      #|  forall f a b. (forall x. a <= x /\\ x <= b ==> f contl x)\n           ==> ?M. forall x. a <= x /\\ x <= b ==> abs(f(x)) <= M
      #|  (y : Real) => \226\136\131 x : Real, (a : Real) <= x && x <= (b : Real) && y == (f : (Real) -> Real)(x)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (N : Real)
      #|  (x : Real)
      #|  (f : (Real) -> Real)((x : Real))
      #|  sup
      #|  (x : Real)
      #|  sup
      #|  (x : Real)
      #|  (y : Real)
      #|  (M : Real)
      #|  (M : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)((a : Real))
      #|  forall f a b. (a <= b /\\ forall x. a <= x /\\ x <= b ==> f contl x)\n        ==> ?M. (forall x. a <= x /\\ x <= b ==> f(x) <= M) /\\\n                (forall N. N < M ==> ?x. a <= x /\\ x <= b /\\ N < f(x))
      #|  (x : Real)
      #|  inv((M : Real) - (f : (Real) -> Real)((a : Real)))
      #|  (k : Real)
      #|  (M : Real) - inv((k : Real) + real_of_num(1))
      #|  \226\136\128 N : Real, N < (M : Real) \226\134\146 (\226\136\131 x : Real, (a : Real) <= x && x <= (b : Real) && N < (f : (Real) -> Real)(x))
      #|  !((M : Real) - (f : (Real) -> Real)((x : Real)) == real_of_num(0))
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 inv((k : Real) + real_of_num(1)) < (M : Real) - (f : (Real) -> Real)(x)
      #|  forall x. a <= x /\\ x <= b ==>\n         inv(k + &1) < inv((\\x. inv(M - (f x))) x)
      #|  (k : Real)
      #|  forall x. a <= x /\\ x <= b ==> (\\x. inv(M - (f x))) x < (k + &1)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 real_of_num(0) < inv((M : Real) - (f : (Real) -> Real)(x))
      #|  (k : Real)
      #|  ?k. forall x. a <= x /\\ x <= b ==> (\\x. inv(M - (f x))) x <= k
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 contl((x : Real) => inv((M : Real) - (f : (Real) -> Real)(x)), x)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 (f : (Real) -> Real)(x) < (M : Real)
      #|  !((a : Bool) && (b : Bool) && (c : Bool)) == (a && b \226\134\146 !c)
      #|  (a : Bool) == !!a
      #|  (M : Real)
      #|  (M : Real)
      #|  forall f a b. (a <= b /\\ forall x. a <= x /\\ x <= b ==> f contl x)\n        ==> ?M. (forall x. a <= x /\\ x <= b ==> f(x) <= M) /\\\n                (?x. a <= x /\\ x <= b /\\ (f(x) = M))
      #|  -(M : Real)
      #|  (M : Real)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 contl((x : Real) => -(f : (Real) -> Real)(x), x)
      #|  forall f a b. (a <= b /\\ forall x. a <= x /\\ x <= b ==> f contl x)\n        ==> ?M. (forall x. a <= x /\\ x <= b ==> M <= f(x)) /\\\n                (?x. a <= x /\\ x <= b /\\ (f(x) = M))
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (f : (Real) -> Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (f : (Real) -> Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (M : Real)
      #|  (L : Real)
      #|  (x2 : Real)
      #|  (M : Real)
      #|  (x1 : Real)
      #|  (L : Real)
      #|  forall f a b. (a <= b /\\ forall x. a <= x /\\ x <= b ==>  f contl x)\n        ==> ?L M. (forall x. a <= x /\\ x <= b ==> L <= f(x) /\\ f(x) <= M) /\\\n                  forall y. L <= y /\\ y <= M ==> ?x. a <= x /\\ x <= b /\\ (f(x) = y)
      #|  (l : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (l : Real)
      #|  forall f x l. (f diffl l)(x) /\\ &0 < l ==>\n      ?d. &0 < d /\\ forall h. &0 < h /\\ h < d ==> f(x) < f(x + h)
      #|  (l : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  -(l : Real)
      #|  forall f x l. (f diffl l)(x) /\\ l < &0 ==>\n      ?d. &0 < d /\\ forall h. &0 < h /\\ h < d ==> f(x) < f(x - h)
      #|  real_of_num(0) <= (d : Real)
      #|  (x : Real) + (d : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (e : Real)
      #|  (k : Real)
      #|  (e : Real)
      #|  real_of_num(0) < (l : Real)
      #|  real_of_num(0) <= (d : Real)
      #|  (x : Real) - (d : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (e : Real)
      #|  (k : Real)
      #|  (e : Real)
      #|  (l : Real) < real_of_num(0)
      #|  real_of_num(0)
      #|  (l : Real)
      #|  (k : Real)
      #|  forall f x l. (f diffl l)(x) /\\\n           (?d. &0 < d /\\ (forall y. abs(x - y) < d ==> f(y) <= f(x))) ==> (l = &0)
      #|  -(l : Real)
      #|  (x : Real)
      #|  (x : Real) => -(f : (Real) -> Real)(x)
      #|  forall f x l. (f diffl l)(x) /\\\n           (?d. &0 < d /\\ (forall y. abs(x - y) < d ==> f(x) <= f(y))) ==> (l = &0)
      #|  (d : Real)
      #|  (x : Real)
      #|  (f : (Real) -> Real)
      #|  (d : Real)
      #|  forall f x l. (f diffl l)(x) /\\\n         (?d. &0 < d /\\ (forall y. abs(x - y) < d ==> (f(y) = f(x)))) ==> (l = &0)
      #|  (b : Real) - (x : Real) <= x - (a : Real)
      #|  (x : Real) + x
      #|  (b : Real)
      #|  (x : Real) - (a : Real) <= (b : Real) - x
      #|  (x : Real) + x
      #|  (a : Real)
      #|  (x : Real)
      #|  (b : Real) - (x : Real)
      #|  (x : Real) - (a : Real)
      #|  (b : Real) - (x : Real)
      #|  (x : Real) - (a : Real)
      #|  forall a b x. a < x /\\ x < b ==>\n        ?d. &0 < d /\\ forall y. abs(x - y) < d ==> a < y /\\ y < b
      #|  (d : Real)
      #|  (d : Real)
      #|  forall a b x. a < x /\\ x < b ==>\n        ?d. &0 < d /\\ forall y. abs(x - y) < d ==> a <= y /\\ y <= b
      #|  (l : Real)
      #|  (d : Real)
      #|  ?l. (f diffl l)(x) /\\\n        (?d. &0 < d /\\ (forall y. abs(x - y) < d ==> (f(y) = f(x))))
      #|  (d : Real)
      #|  (a : Real) < (x : Real) && x < (b : Real)
      #|  (x : Real)
      #|  (a : Real) < (b : Real)
      #|  (x : Real)
      #|  (f : (Real) -> Real)((b : Real)) == (m : Real)
      #|  (f : (Real) -> Real)((b : Real)) == (M : Real)
      #|  (f : (Real) -> Real)((a : Real)) == f((b : Real))
      #|  (f : (Real) -> Real)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 (f : (Real) -> Real)(x) == f(b)
      #|  (l : Real)
      #|  (y : Real)
      #|  (d : Real)
      #|  ?l. (f diffl l)(x2) /\\\n          ?d. &0 < d /\\ (forall y. abs(x2 - y) < d ==> f(x2) <= f(y))
      #|  (x2 : Real)
      #|  (d : Real)
      #|  (a : Real) < (x2 : Real) && x2 < (b : Real)
      #|  (l : Real)
      #|  (y : Real)
      #|  (d : Real)
      #|  ?l. (f diffl l)(x1) /\\\n          ?d. &0 < d /\\ (forall y. abs(x1 - y) < d ==> f(y) <= f(x1))
      #|  (x1 : Real)
      #|  (d : Real)
      #|  (a : Real) < (x1 : Real) && x1 < (b : Real)
      #|  (x2 : Real)
      #|  (m : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  (x1 : Real)
      #|  (M : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  forall f a b. a < b /\\\n           (f(a) = f(b)) /\\\n           (forall x. a <= x /\\ x <= b ==> f contl x) /\\\n           (forall x. a < x /\\ x < b ==> f differentiable x)\n        ==> ?z. a < z /\\ z < b /\\ (f diffl &0)(z)
      #|  (w : Real) + ((x : Real) + ((y : Real) + (z : Real))) == y + w + (x + z)
      #|  (b : Real) - (a : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  (b : Real) == (a : Real)
      #|  forall(f:real->real) a b.\n        (\\x. f(x) - (((f(b) - f(a)) / (b - a)) * x))(a) =\n        (\\x. f(x) - (((f(b) - f(a)) / (b - a)) * x))(b)
      #|  ((\\x. ((f(b) - f(a)) / (b - a)) * x ) diffl\n                      ((f(b) - f(a)) / (b - a)))(z)
      #|  (a : Real) < a
      #|  (z : Real)
      #|  ((f : (Real) -> Real)((b : Real)) - f((a : Real))) / (b - a)
      #|  (z : Real)
      #|  (l : Real) - ((f : (Real) -> Real)((b : Real)) - f((a : Real))) / (b - a)
      #|  (l : Real)
      #|  real_of_num(1)
      #|  (x : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => (f : (Real) -> Real)(x) - (f((b : Real)) - f((a : Real))) / (b - a) * x
      #|  forall f a b. a < b /\\\n           (forall x. a <= x /\\ x <= b ==> f contl x) /\\\n           (forall x. a < x /\\ x < b ==> f differentiable x)\n        ==> ?l z. a < z /\\ z < b /\\ (f diffl l)(z) /\\\n            (f(b) - f(a) = (b - a) * l)
      #|  ?l z. a < z /\\ z < b /\\ (f diffl l) z /\\ (f b - f a = (b - a) * l)
      #|  forall f f' a b.\n        a < b /\\ (forall x. a <= x /\\ x <= b ==> (f diffl f'(x))(x))\n        ==> ?z. a < z /\\ z < b /\\ (f b - f a = (b - a) * f'(z))
      #|  diffl((f : (Real) -> Real), (l : Real), (x : Real))
      #|  ((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == ((a && b) && c && d)
      #|  (x : Real)
      #|  (l : Real)
      #|  real_of_num(0)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  forall f a b. a < b /\\\n           (forall x. a <= x /\\ x <= b ==> f contl x) /\\\n           (forall x. a < x /\\ x < b ==> (f diffl &0)(x))\n        ==> (f b = f a)
      #|  (x : Real)
      #|  (x : Real)
      #|  (z : Real)
      #|  (a : Real) <= (x : Real)
      #|  (x : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  forall f a b. a < b /\\\n           (forall x. a <= x /\\ x <= b ==> f contl x) /\\\n           (forall x. a < x /\\ x < b ==> (f diffl &0)(x))\n        ==> forall x. a <= x /\\ x <= b ==> (f x = f a)
      #|  forall f a b. a < b /\\\n           (forall x. a <= x /\\ x <= b ==> (f diffl &0)(x))\n        ==> (f b = f a)
      #|  (y : Real)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, contl((f : (Real) -> Real), x)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 x : Real, \226\136\128 y : Real, (\226\136\128 x : Real, diffl(f, real_of_num(0), x)) \226\134\146 f(x) == f(y)
      #|  forall x z d. (x - d) <= z /\\ z <= (x + d) <=> abs(z - x) <= d
      #|  (x : Real)
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((x : Real) - (d : Real))) == x - d
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((z : Real))) == z
      #|  (g : (Real) -> Real)
      #|  (z : Real)
      #|  (z : Real)
      #|  (f : (Real) -> Real)((x : Real) - (d : Real))
      #|  (x : Real) + (d : Real)
      #|  (x : Real)
      #|  (f : (Real) -> Real)
      #|  (x : Real)
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((x : Real) + (d : Real))) == x + d
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((z : Real))) == z
      #|  (g : (Real) -> Real)
      #|  (z : Real)
      #|  (z : Real)
      #|  (f : (Real) -> Real)((x : Real) + (d : Real))
      #|  (x : Real)
      #|  (x : Real) - (d : Real)
      #|  (f : (Real) -> Real)
      #|  (f : (Real) -> Real)((x : Real) + (d : Real))
      #|  (f : (Real) -> Real)((x : Real) - (d : Real))
      #|  forall f g x d. &0 < d /\\\n            (forall z. abs(z - x) <= d ==> (g(f(z)) = z)) /\\\n            (forall z. abs(z - x) <= d ==> f contl z) ==>\n     ~(forall z. abs(z - x) <= d ==> f(z) <= f(x))
      #|  (x : Real) + (d : Real)
      #|  (x : Real) - (d : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (y : Real) => (g : (Real) -> Real)(-y)
      #|  (x : Real) => -(f : (Real) -> Real)(x)
      #|  forall f g x d. &0 < d /\\\n            (forall z. abs(z - x) <= d ==> (g(f(z)) = z)) /\\\n            (forall z. abs(z - x) <= d ==> f contl z) ==>\n     ~(forall z. abs(z - x) <= d ==> f(x) <= f(z))
      #|  (f : (Real) -> Real)((x : Real)) + (e : Real)
      #|  (f : (Real) -> Real)((x : Real)) + ((M : Real) - f(x))
      #|  (f : (Real) -> Real)((x : Real)) - (e : Real)
      #|  abs((y : Real) - (f : (Real) -> Real)((x : Real))) <= (e : Real)
      #|  (e : Real)
      #|  (e : Real)
      #|  (M : Real) - (f : (Real) -> Real)((x : Real))
      #|  (f : (Real) -> Real)((x : Real)) - (L : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (g : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (g : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (L : Real) < (f : (Real) -> Real)((x : Real)) && f(x) < (M : Real)
      #|  (L : Real) <= (f : (Real) -> Real)((x : Real)) && f(x) <= (M : Real)
      #|  (M : Real)
      #|  (L : Real)
      #|  (x : Real) + (d : Real)
      #|  (x : Real) - (d : Real)
      #|  (f : (Real) -> Real)
      #|  forall f g x d.  &0 < d /\\\n            (forall z. abs(z - x) <= d ==> (g(f(z)) = z)) /\\\n            (forall z. abs(z - x) <= d ==> f contl z) ==>\n        ?e. &0 < e /\\\n            (forall y. abs(y - f(x)) <= e ==> ?z. abs(z - x) <= d /\\ (f z = y))
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((z : Real))) == z && g(f((x : Real))) == x
      #|  (e : Real)
      #|  (h : Real)
      #|  (k : Real)
      #|  (k : Real)
      #|  (e : Real)
      #|  (x : Real)
      #|  (g : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  \226\136\128 z : Real, abs(z - (x : Real)) <= (d : Real) \226\134\146 contl((f : (Real) -> Real), z)
      #|  \226\136\128 z : Real, abs(z - (x : Real)) <= (d : Real) \226\134\146 (g : (Real) -> Real)((f : (Real) -> Real)(z)) == z
      #|  (e : Real)
      #|  (z : Real)
      #|  \226\136\128 z : Real, abs(z - (x : Real)) <= (e : Real) \226\134\146 contl((f : (Real) -> Real), z)
      #|  (e : Real)
      #|  (z : Real)
      #|  \226\136\128 z : Real, abs(z - (x : Real)) <= (e : Real) \226\134\146 (g : (Real) -> Real)((f : (Real) -> Real)(z)) == z
      #|  (e : Real)
      #|  (d : Real)
      #|  (a : Real)
      #|  (a : Real)
      #|  forall f g x d. &0 < d /\\\n             (forall z. abs(z - x) <= d ==> (g(f(z)) = z)) /\\\n             (forall z. abs(z - x) <= d ==> f contl z)\n        ==> g contl (f x)
      #|  (z : Real)
      #|  abs((h : Real)) <= (k : Real)
      #|  (f : (Real) -> Real)((x : Real)) + (h : Real)
      #|  (z : Real)
      #|  abs((h : Real)) <= (k : Real)
      #|  (f : (Real) -> Real)((x : Real)) + (h : Real)
      #|  (z : Real)
      #|  abs((h : Real)) <= (k : Real)
      #|  (f : (Real) -> Real)((x : Real)) + (h : Real)
      #|  (y : Real)
      #|  (e : Real)
      #|  (e : Real)
      #|  abs((l : Real))
      #|  (d : Real)
      #|  contl((y : Real) => (h : (Real) -> Real)((g : (Real) -> Real)(y)), (f : (Real) -> Real)((x : Real)))
      #|  (e : Real)
      #|  (y : Real)
      #|  (e : Real)
      #|  (e : Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (b : Real)
      #|  ?e. &0 < e /\\\n         forall y. &0 < abs(y - f(x:real)) /\\ abs(y - f(x)) < e\n                    ==> ~((h:real->real)(g(y)) = &0)
      #|  (f : (Real) -> Real)((z : Real)) == (y : Real)
      #|  (z : Real)
      #|  (y : Real)
      #|  (e : Real)
      #|  (e : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (g : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (c : Real)
      #|  ?e. &0 < e /\\\n         forall y. &0 < abs(y - f(x:real)) /\\ abs(y - f(x)) < e ==> (f(g(y)) = y)
      #|  inv((h(g(y))) * (g(y:real) - x)) =\n      inv(h(g(y))) * inv(g(y) - x)
      #|  (f : (Real) -> Real)
      #|  !((g : (Real) -> Real)((y : Real)) - (x : Real) == real_of_num(0))
      #|  real_of_num(0) < (k : Real)
      #|  (f : (Real) -> Real)((g : (Real) -> Real)((y : Real))) == y
      #|  (y : Real) - (f : (Real) -> Real)((x : Real)) == (h : (Real) -> Real)((g : (Real) -> Real)(y)) * (g(y) - x)
      #|  (y : Real)
      #|  (e : Real)
      #|  (k : Real)
      #|  ?e. &0 < e /\\\n                    forall y. &0 < abs(y - f(x:real)) /\\\n                        abs(y - f(x:real)) < e ==>\n                            (f(g(y)) = y) /\\ ~(h(g(y)) = &0)
      #|  (d : Real)
      #|  contl((y : Real) => (h : (Real) -> Real)((g : (Real) -> Real)(y)), (f : (Real) -> Real)((x : Real)))
      #|  (y : Real) => inv(((y : Real) => (h : (Real) -> Real)((g : (Real) -> Real)(y)))(y))
      #|  (y : Real) => inv((h : (Real) -> Real)((g : (Real) -> Real)(y)))
      #|  (g : (Real) -> Real)((f : (Real) -> Real)((x : Real))) == x
      #|  (z : Real)
      #|  \\y. if y = f(x) then\n    inv(h(g y)) else (g(y) - g(f(x:real))) / (y - f(x))
      #|  (h : (Real) -> Real)
      #|  diffl((f : (Real) -> Real), (l : Real), (x : Real))
      #|  forall f g l x d. &0 < d /\\\n               (forall z. abs(z - x) <= d ==> (g(f(z)) = z)) /\\\n               (forall z. abs(z - x) <= d ==> f contl z) /\\\n               (f diffl l)(x) /\\\n               ~(l = &0)\n        ==> (g diffl (inv l))(f x)
      #|  (d : Real) / real_of_num(2)
      #|  (d : Real) / real_of_num(2)
      #|  forall f g l x d. &0 < d /\\\n               (forall z. abs(z - x) < d ==> (g(f(z)) = z)) /\\\n               (forall z. abs(z - x) < d ==> f contl z) /\\\n               (f diffl l)(x) /\\\n               ~(l = &0)\n        ==> (g diffl (inv l))(f x)
      #|  (e : Real) + (a : Real) < (z : Real)
      #|  (e : Real) + (z : Real) < (b : Real)
      #|  (e : Real)
      #|  (z : Real)
      #|  (f : (Real) -> Real)
      #|  (e : Real)
      #|  (b : Real) - (z : Real)
      #|  (z : Real) - (a : Real)
      #|  (a : Real) < (z : Real) && z < (b : Real)
      #|  (e : Real)
      #|  \226\136\128 h : Real, real_of_num(0) < h && h < (d : Real) \226\134\146 (w : Real) < (f : (Real) -> Real)((b : Real) - h)
      #|  (e : Real)
      #|  (b : Real) - (a : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (f' : (Real) -> Real)((b : Real))
      #|  (b : Real)
      #|  (f : (Real) -> Real)
      #|  (z : Real) == (b : Real)
      #|  (z : Real) == (b : Real)
      #|  (e : Real)
      #|  \226\136\128 h : Real, real_of_num(0) < h && h < (d : Real) \226\134\146 (w : Real) < (f : (Real) -> Real)((a : Real) + h)
      #|  (e : Real)
      #|  (b : Real) - (a : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (f' : (Real) -> Real)((a : Real))
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  (z : Real) == (a : Real)
      #|  (z : Real) == (a : Real)
      #|  (z : Real)
      #|  (z : Real)
      #|  ?w. (forall x. a <= x /\\ x <= b ==> f x <= w) /\\\n                    (?x. a <= x /\\ x <= b /\\ (f x = w))
      #|  forall f f' a b.\n        a <= b /\\\n        (forall x. a <= x /\\ x <= b ==> (f diffl f'(x))(x)) /\\\n        f'(a) > &0 /\\ f'(b) < &0\n        ==> ?z. a < z /\\ z < b /\\ (f'(z) = &0)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => (f' : (Real) -> Real)(x) - (y : Real)
      #|  (x : Real) => (f : (Real) -> Real)(x) - (y : Real) * x
      #|  forall f f' a b y.\n        a <= b /\\\n        (forall x. a <= x /\\ x <= b ==> (f diffl f'(x))(x)) /\\\n        f'(a) > y /\\ f'(b) < y\n        ==> ?z. a < z /\\ z < b /\\ (f'(z) = y)
      #|  -(y : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => -(f' : (Real) -> Real)(x)
      #|  (x : Real) => -(f : (Real) -> Real)(x)
      #|  forall f f' a b y.\n        a <= b /\\\n        (forall x. a <= x /\\ x <= b ==> (f diffl f'(x))(x)) /\\\n        f'(a) < y /\\ f'(b) > y\n        ==> ?z. a < z /\\ z < b /\\ (f'(z) = y)
      #|  (M : Num) + (N : Num) >= N
      #|  (e : Real) / real_of_num(3)
      #|  (s : (Num, Real) -> Real)((M : Num) + (N : Num), (x0 : Real))
      #|  (s : (Num, Real) -> Real)((M : Num) + (N : Num), (x : Real))
      #|  forall fx sx fx0 sx0 e3.\n        abs(sx - fx) < e3 /\\ abs(sx0 - fx0) < e3 /\\ abs(sx - sx0) < e3 /\\\n        (&3 * e3 = e)\n        ==> abs(fx - fx0) < e
      #|  (x : Real)
      #|  (d : Real)
      #|  (d2 : Real)
      #|  (d1 : Real)
      #|  (d2 : Real)
      #|  (e : Real) / real_of_num(3)
      #|  (M : Num) + (N : Num)
      #|  (d1 : Real)
      #|  (N : Num)
      #|  (e : Real) / real_of_num(3)
      #|  (e : Real)
      #|  (M : Num)
      #|  forall s f x0. (forall e. &0 < e\n                 ==> ?N d. &0 < d /\\\n                           forall x n. abs(x - x0) < d /\\ n >= N\n                                 ==> abs(s n x - f(x)) < e) /\\\n            (?N:num. forall n. n >= N ==> (s n) contl x0)\n            ==> f contl x0
      #|  abs((x : Real)) < (a : Real) \226\134\146 x < a
      #|  (r : Num)
      #|  sum(((n : Num), (m : Num)), (g : (Num) -> Real))
      #|  sum(((n : Num), (m : Num)), (n : Num) => abs((s : (Real, Num) -> Real)((x : Real), n)))
      #|  abs(snm) < e2 /\\ (&2 * e2 = e)\n    ==> abs((sn + snm) - fx) < e2 ==> abs(sn - fx) < e
      #|  (m : Num) + (n : Num)
      #|  (m : Num)
      #|  (e : Real) / real_of_num(2)
      #|  (x : Real)
      #|  (n : Num) >= (M : Num) + (N : Num) \226\134\146 n >= M && n >= N
      #|  (n : Num)
      #|  (x : Real)
      #|  (M : Num) + (N : Num)
      #|  (M : Num)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (d : Real)
      #|  (f : (Real) -> Real)
      #|  \226\136\128 x : Real, abs(x - (x0 : Real)) < (d : Real) \226\134\146 (\226\136\131 y : Real, sums((s : (Real, Num) -> Real)(x), y))
      #|  forall s x0 g.\n        (?N d. &0 < d /\\\n               forall n x. abs(x - x0) < d /\\ n >= N\n                     ==> abs(s x n) <= g n) /\\ summable g\n        ==> ?f d. &0 < d /\\\n                  forall e. &0 < e\n                      ==> ?N. forall x n. abs(x - x0) < d /\\ n >= N\n                                    ==> abs(sum(0,n) (s x) - f(x)) < e
      #|  forall s x0 g.\n        (?N d. &0 < d /\\\n               forall n x. abs(x - x0) < d /\\ n >= N\n                     ==> abs(s x n) <= g n) /\\ summable g\n        ==> ?f. forall e. &0 < e\n                    ==> ?N d. &0 < d /\\\n                              forall x n. abs(x - x0) < d /\\ n >= N\n                                    ==> abs(sum(0,n) (s x) - f(x)) < e
      #|  abs((x : Real) - x) == real_of_num(0)
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a \226\134\146 b) == (a \226\134\146 c)
      #|  (real_of_num(0) < abs((x : Real) - (y : Real))) == !(x == y)
      #|  forall f x. f contl x <=>\n         forall e. &0 < e ==> ?d. &0 < d /\\ forall x'. abs(x' - x) < d\n                            ==> abs(f(x') - f(x)) < e
      #|  forall f x l. f contl l /\\ x tends_num_real l\n\n           ==> (\\n. f(x n)) tends_num_real f(l)
      #|  (s : Real)
      #|  (s : Real) == sup((x : Real) => (a : Real) <= x && x <= (b : Real) && (P : (Real) -> Bool)(x))
      #|  (x : Real) <= (b : Real) \226\134\146 x < b + real_of_num(1)
      #|  (x : Real) => (a : Real) <= x && x <= (b : Real) && (P : (Real) -> Bool)(x)
      #|  forall P a b.\n        (?x. a <= x /\\ x <= b /\\ P x)\n        ==> ?s. a <= s /\\ s <= b /\\\n                forall y. y < s <=> (?x. a <= x /\\ x <= b /\\ P x /\\ y < x)
      #|  (t : Real)
      #|  (s : Real)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 contl((f : (Real) -> Real), x)
      #|  (d : Real)
      #|  (b : Real) <= (t : Real)
      #|  (t : Real)
      #|  real_of_num(0) < (d : Real) \226\134\146 d <= d * real_of_num(2)
      #|  (d1 : Real) / real_of_num(2)
      #|  (d : Real)
      #|  (s : Real) + (d : Real) / real_of_num(2)
      #|  (r : Real)
      #|  forall r t d d12.\n       ~(x <= r /\\ y <= r) /\\\n      abs(x - y) < d /\\\n      s - d12 < r /\\ t <= s + d /\\\n      x <= t /\\ y <= t /\\ &2 * d12 <= e /\\\n      &2 * d < e ==> abs(x - s) < e /\\ abs(y - s) < e
      #|  forall x y. abs(x - s) < d1 /\\ abs(y - s) < d1 ==> abs(f x - f y) < e
      #|  (x : Real) <= (r : Real) && (y : Real) <= r
      #|  (y : Real)
      #|  (x : Real)
      #|  (d : Real)
      #|  ((s : Real) < s + (d : Real)) == (real_of_num(0) < d)
      #|  (s : Real) + (d : Real) / real_of_num(2)
      #|  (d : Real)
      #|  (d1 : Real) / real_of_num(2)
      #|  (d2 : Real)
      #|  (d2 : Real)
      #|  (r : Real)
      #|  ((x : Real) - (y : Real) < x) == (real_of_num(0) < y)
      #|  (s : Real) - (d1 : Real) / real_of_num(2) < s
      #|  (real_of_num(0) < abs((x : Real) - (s : Real))) == !(x == s)
      #|  (u : Real) == (s : Real)
      #|  (u : Real)
      #|  \226\136\128 x : Real, abs(x - (s : Real)) < (d1 : Real) \226\134\146 abs((f : (Real) -> Real)(x) - f(s)) < (e : Real) / real_of_num(2)
      #|  (f : (Real) -> Real)((s : Real))
      #|  forall a. abs(x - a) < e / &2 /\\ abs(y - a) < e / &2 /\\ (&2 * e / &2 = e)\n            ==> abs(x - y) < e
      #|  forall x y. abs(x - s) < d1 /\\ abs(y - s) < d1\n                        ==> abs(f(x) - f(y)) < e
      #|  ((d : Real) < d * real_of_num(2)) == (real_of_num(0) < d)
      #|  real_of_num(0) < (d1 : Real) / real_of_num(2) && d1 / real_of_num(2) < d1
      #|  (d1 : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (s : Real)
      #|  forall x. a <= x /\\ x <= b ==> f contl x
      #|  ?t. s < t /\\ ?d. &0 < d /\\\n                                 forall x y. a <= x /\\ x <= t /\\ a <= y /\\ y <= t /\\\n                                       abs(x - y) < d ==> abs(f(x) - f(y)) < e
      #|  (s : Real)
      #|  abs((x : Real) - x) == real_of_num(0)
      #|  real_of_num(1)
      #|  (a : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  \\c. ?d. &0 < d /\\\n                       forall x y. a <= x /\\ x <= c /\\\n                             a <= y /\\ y <= c /\\\n                             abs(x - y) < d\n                             ==> abs(f(x) - f(y)) < e
      #|  forall f a b. a <= b /\\ (forall x. a <= x /\\ x <= b ==> f contl x)\n           ==> forall e. &0 < e ==> ?d. &0 < d /\\\n                                  forall x y. a <= x /\\ x <= b /\\\n                                        a <= y /\\ y <= b /\\\n                                        abs(x - y) < d\n                                        ==> abs(f(x) - f(y)) < e
      #|  ~(a <= x) /\\ a <= y /\\ abs(x - y) < d /\\ d < d1\n      ==> abs(x - a) < d1 /\\ abs(y - a) < d1
      #|  (f : (Real) -> Real)((a : Real))
      #|  forall a. abs(x - a) < e / &2 /\\ abs(y - a) < e / &2 /\\ (&2 * e / &2 = e)\n          ==> abs(x - y) < e
      #|  (a : Real) <= (x : Real)
      #|  x <= b /\\ ~(y <= b) /\\ abs(x - y) < d /\\ d < d1\n      ==> abs(x - b) < d1 /\\ abs(y - b) < d1
      #|  (f : (Real) -> Real)((b : Real))
      #|  forall a. abs(x - a) < e / &2 /\\ abs(y - a) < e / &2 /\\ (&2 * e / &2 = e)\n          ==> abs(x - y) < e
      #|  (y : Real) <= (b : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (d3 : Real)
      #|  (d0 : Real)
      #|  (d3 : Real)
      #|  (e : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  (d0 : Real)
      #|  (d2 : Real)
      #|  (d1 : Real)
      #|  (d2 : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (d1 : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (a : Real) <= (b : Real)
      #|  forall f a b. (forall x. a <= x /\\ x <= b ==> f contl x)\n           ==> forall e. &0 < e\n                   ==> ?d. &0 < d /\\\n                           forall x y. (a <= x /\\ x <= b \\/ a <= y /\\ y <= b) /\\\n                                 abs(x - y) < d\n                                 ==> abs(f(x) - f(y)) < e
      #|  (b : Real)
      #|  (b : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|F_IMP =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) t:bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) #F:bool))))
      #|LEFT_AND_OVER_OR =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. (#forall:fun(fun(bool,bool),bool) (\t3:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) ((#\/:fun(bool,fun(bool,bool)) t2:bool) t3:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) t2:bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) t3:bool)))))))))
      #|RIGHT_AND_OVER_OR =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. (#forall:fun(fun(bool,bool),bool) (\t3:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t2:bool) t3:bool)) t1:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t2:bool) t1:bool)) ((#/\:fun(bool,fun(bool,bool)) t3:bool) t1:bool)))))))))
      #|LESS_EQUAL_ANTISYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|NOT_LESS_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#~:fun(bool,bool) ((#<:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))))
      #|LESS_LEMMA1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) m:num) n:num)))))))
      #|LESS_SUC_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num))))
      #|LESS_EQ_SUC_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) (#SUC:fun(num,num) n:num))))
      #|LESS_EQUAL_ADD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) d:num)))))))))
      #|LESS_EQ_IMP_LESS_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num)))))))
      #|LESS_MONO_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num)))))))))
      #|LESS_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num)))))))
      #|LESS_ADD_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|SUC_SUB1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)))
      #|LESS_ADD_SUC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) m:num) (#SUC:fun(num,num) n:num)))))))
      #|OR_LESS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) n:num)) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|NOT_SUC_LESS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) m:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LESS_LESS_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) n:num) m:num)))))))
      #|SUB_SUB =  |- (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) c:num) b:num)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) b:num) c:num))) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) c:num)) b:num)))))))))
      #|LESS_CASES_IMP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#<:fun(num,fun(num,bool)) m:num) n:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) n:num)))) ((#<:fun(num,fun(num,bool)) n:num) m:num))))))
      #|SUB_LESS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#<=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) n:num) m:num)) n:num)))))
      #|SUB_EQ_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) m:num) n:num)) m:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SUB_LEFT_LESS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#-:fun(num,fun(num,num)) n:num) p:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) n:num)) ((#<=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|SUB_LEFT_GREATER_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) ((#-:fun(num,fun(num,num)) n:num) p:num))) ((#>=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) p:num)) n:num))))))))
      #|LESS_0_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num))))
      #|LESS_OR =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) n:num))))))
      #|SUB_OLD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) m:num)) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<:fun(num,fun(num,bool)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) ((#-:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|real_le =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_10 =  |- (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))
      #|REAL_LDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LT_IADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_MUL_RID =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)))
      #|REAL_MUL_RINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_inv:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_RDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_EQ_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real))) ((#=:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_EQ_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_ADD_LID_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) y:real)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_ADD_RID_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) x:real)) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|REAL_LNEG_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_RNEG_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_neg:fun(real,real) x:real)))))))
      #|REAL_NEG_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_MUL_LZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_MUL_RZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_NEG_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) y:real))))))
      #|REAL_NEG_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_NEG_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_neg:fun(real,real) x:real))) x:real)))
      #|REAL_NEG_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_LT_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LT_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_NOT_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LT_ANTISYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_LT_GT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|REAL_NOT_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LE_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LE_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) x:real) x:real)))
      #|REAL_LE_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|REAL_LT_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LT_IMP_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_LTE_TRANS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real))))))))
      #|REAL_LE_TRANS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) z:real))))))))
      #|REAL_NEG_LT0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_NEG_GT0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_NEG_LE0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_NEG_GE0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_LT_NEGTOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real))))))
      #|REAL_LE_NEGTOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_neg:fun(real,real) x:real)))))
      #|REAL_LE_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_LE_SQUARE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))))
      #|REAL_LT_01 =  |- ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_LE_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real))) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_LE_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_LT_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) w:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LT_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_LT_ADDNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) z:real)))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) y:real) z:real)) x:real))))))))
      #|REAL_LT_ADDNEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real))) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_ADD1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_SUB_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) y:real)) x:real)))))
      #|REAL_SUB_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) y:real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) x:real)))))
      #|REAL_SUB_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_SUB_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_LE_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) x:real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_LE_NEGL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|REAL_LE_NEGR =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_NEG_EQ0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_NEG_0 =  |- ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|REAL_NEG_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_SUB_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_SUB_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_EQ_LMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_EQ_RMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_SUB_LDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_SUB_RDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_NEG_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) y:real)) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|REAL_NEG_MINUS1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))
      #|REAL_INV_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_INVINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_inv:fun(real,real) x:real))) x:real))))
      #|REAL_LT_IMP_NE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|REAL_INV_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_LT_LMUL_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)))))))
      #|REAL_LT_RMUL_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))))))
      #|REAL_LT_LMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_LT_RMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LT_RMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))
      #|REAL_LT_LMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LINV_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) x:real) (#real_inv:fun(real,real) y:real)))))))
      #|REAL_RINV_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) y:real) (#real_inv:fun(real,real) x:real)))))))
      #|REAL_NEG_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_inv:fun(real,real) (#real_neg:fun(real,real) x:real))))))
      #|REAL_INV_1OVER =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))))
      #|REAL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_POS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) n:num))))
      #|REAL_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_LT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_INJ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|REAL_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|REAL_INV1 =  |- ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_DIV_LZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_LT_NZ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) n:num)))))
      #|REAL_NZ_IMP_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) n:num)))))
      #|REAL_LT_RDIV_0 =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)))))))
      #|REAL_LT_RDIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) z:real)) ((#real_div:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_LT_FRACTION_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) d:real) (#real_of_num:fun(num,real) n:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)))))))
      #|REAL_LT_MULTIPLE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) d:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) d:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)))))))
      #|REAL_LT_FRACTION =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) d:real) (#real_of_num:fun(num,real) n:num))) d:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)))))))
      #|REAL_LT_HALF1 =  |- (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) d:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real))))
      #|REAL_LT_HALF2 =  |- (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) d:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) d:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real))))
      #|REAL_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))
      #|REAL_HALF_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_div:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)))
      #|REAL_SUB_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) x:real)) (#real_neg:fun(real,real) y:real))))))
      #|REAL_LT_ADD_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_SUB_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_SUB_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) y:real))))))))
      #|REAL_LE_SUB_LADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)) y:real))))))))
      #|REAL_LE_SUB_RADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) z:real)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) z:real) y:real)))))))))
      #|REAL_LT_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LE_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_SUB_LZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#real_neg:fun(real,real) x:real))))
      #|REAL_SUB_RZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real)))
      #|REAL_LTE_ADD2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) w:real) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) w:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))))
      #|REAL_LTE_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_LT_MUL2_ALT =  |- (#forall:fun(fun(real,bool),bool) (\x1:real. (#forall:fun(fun(real,bool),bool) (\x2:real. (#forall:fun(fun(real,bool),bool) (\y1:real. (#forall:fun(fun(real,bool),bool) (\y2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x1:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y1:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x1:real) x2:real)) ((#real_lt:fun(real,fun(real,bool)) y1:real) y2:real))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x1:real) y1:real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y2:real)))))))))))
      #|REAL_SUB_LNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) y:real)) (#real_neg:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_SUB_RNEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real))) ((#real_add:fun(real,fun(real,real)) x:real) y:real))))))
      #|REAL_SUB_NEG2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_SUB_TRIANGLE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) a:real) b:real)) ((#real_sub:fun(real,fun(real,real)) b:real) c:real))) ((#real_sub:fun(real,fun(real,real)) a:real) c:real))))))))
      #|REAL_INV_MUL_WEAK =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) (#real_inv:fun(real,real) y:real))))))))
      #|REAL_LE_LMUL_LOCAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)))))))))
      #|REAL_LE_RMUL_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))))
      #|REAL_SUB_INV2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) (#real_inv:fun(real,real) y:real))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))))))))
      #|REAL_SUB_SUB2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) y:real)))))
      #|REAL_MEAN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) z:real) y:real)))))))))
      #|REAL_EQ_LMUL2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) y:real) z:real)) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))))))))))
      #|REAL_LE_MUL2V =  |- (#forall:fun(fun(real,bool),bool) (\x1:real. (#forall:fun(fun(real,bool),bool) (\x2:real. (#forall:fun(fun(real,bool),bool) (\y1:real. (#forall:fun(fun(real,bool),bool) (\y2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x1:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y1:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x1:real) x2:real)) ((#real_le:fun(real,fun(real,bool)) y1:real) y2:real))))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x1:real) y1:real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y2:real)))))))))))
      #|REAL_LE_LDIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_mul:fun(real,fun(real,real)) z:real) x:real)))) ((#real_le:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) y:real) x:real)) z:real))))))))
      #|REAL_LE_RDIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) y:real) x:real)) z:real))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) x:real)))))))))
      #|REAL_LT_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_LE_LMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LE_RMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) y:real) x:real)) ((#real_mul:fun(real,fun(real,real)) z:real) x:real)))))))))
      #|REAL_INV_LT1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_inv:fun(real,real) x:real)))))
      #|REAL_LT_IMP_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_EQ_RMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|REAL_EQ_LMUL_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))) ((#=:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|REAL_FACT_NZ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_POSSQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|REAL_SUMSQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)) ((#real_mul:fun(real,fun(real,real)) y:real) y:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|REAL_EQ_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x:real)) (#real_neg:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_DIV_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) y:real) z:real)) ((#real_div:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real))))))))))
      #|REAL_MIDDLE1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) a:real) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|REAL_MIDDLE2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) b:real))))))
      #|ABS_ZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|ABS_0 =  |- ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|ABS_1 =  |- ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|ABS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_abs:fun(real,real) x:real))))
      #|ABS_TRIANGLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))
      #|ABS_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))))
      #|ABS_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))))))
      #|ABS_LT_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) w:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) z:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_mul:fun(real,fun(real,real)) w:real) x:real))) ((#real_mul:fun(real,fun(real,real)) y:real) z:real)))))))))))
      #|ABS_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))))))
      #|ABS_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real)))))
      #|ABS_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_inv:fun(real,real) (#real_abs:fun(real,real) x:real))))))
      #|ABS_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_abs:fun(real,real) x:real))) (#real_abs:fun(real,real) x:real))))
      #|ABS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) x:real) (#real_abs:fun(real,real) x:real))))
      #|ABS_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|ABS_N =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) n:num))))
      #|ABS_BETWEEN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) d:real))))))))
      #|ABS_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))))))))
      #|ABS_STILLNZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_abs:fun(real,real) y:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|ABS_CASES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real)))))
      #|ABS_BETWEEN1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) ((#real_sub:fun(real,fun(real,real)) z:real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|ABS_SIGN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))
      #|ABS_SIGN2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) (#real_neg:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|ABS_DIV =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))))))))
      #|ABS_CIRCLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) h:real)) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) y:real)) (#real_abs:fun(real,real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) h:real))) (#real_abs:fun(real,real) y:real)))))))))
      #|REAL_SUB_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|ABS_SUB_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) y:real)))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|ABS_BETWEEN2 =  |- (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y0:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x0:real) y0:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) y0:real) x0:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) y0:real))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) y0:real) x0:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))))))
      #|ABS_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) k:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) k:real)) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) k:real)))))))
      #|pow =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))
      #|POW_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#SUC:fun(num,num) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|POW_NZ =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) c:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|POW_INV =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) c:real) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) c:real)) n:num)))))))
      #|POW_ABS =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) c:real)) n:num)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) c:real) n:num)))))))
      #|POW_PLUS1 =  |- (#forall:fun(fun(real,bool),bool) (\e:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) e:real))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) e:real)) n:num)))))))
      #|POW_ADD =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) c:real) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) c:real) m:num)) ((#real_pow:fun(real,fun(num,real)) c:real) n:num)))))))))
      #|POW_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))
      #|POW_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))))
      #|POW_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|POW_LE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|POW_M1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|POW_MUL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) n:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_pow:fun(real,fun(num,real)) y:real) n:num)))))))))
      #|REAL_LE_SQUARE_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|ABS_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_LE1_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|REAL_LT1_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|POW_POS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))))))))
      #|POW_2_LE1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|POW_2_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|POW_MINUS1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|REAL_SUP_EXISTS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)))))))) (#?:fun(fun(real,bool),bool) (\s:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))) ((#real_lt:fun(real,fun(real,bool)) y:real) s:real)))))))))
      #|sup_def =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) s:fun(real,bool))) (#@:fun(fun(real,bool),real) (\a:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) a:real))))) (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))))))
      #|sup =  |- ((#=:fun(real,fun(real,bool)) (#sup:fun(fun(real,bool),real) P:fun(real,bool))) (#@:fun(fun(real,bool),real) (\s:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))) ((#real_lt:fun(real,fun(real,bool)) y:real) s:real)))))))
      #|REAL_SUP =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)))))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#sup:fun(fun(real,bool),real) P:fun(real,bool)))))))))
      #|REAL_SUP_UBOUND =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)))))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#sup:fun(fun(real,bool),real) P:fun(real,bool)))))))))
      #|SETOK_LE_LT =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) z:real)))))))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real))))))))))
      #|REAL_SUP_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) z:real)))))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#sup:fun(fun(real,bool),real) P:fun(real,bool)))))))))
      #|REAL_SUP_UBOUND_LE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) z:real)))))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#sup:fun(fun(real,bool),real) P:fun(real,bool)))))))))
      #|REAL_ARCH_SIMPLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) n:num))))))
      #|REAL_ARCH =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#forall:fun(fun(real,bool),bool) (\y:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) x:real)))))))))
      #|REAL_ARCH_LEAST =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) y:real)) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))) y:real)))))))))))
      #|REAL_POW_LBOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) n:num)))))))
      #|REAL_ARCH_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))
      #|REAL_ARCH_POW2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))))
      #|sum_EXISTS =  |- (#?:fun(fun(fun(prod(num,num),fun(fun(num,real),real)),bool),bool) (\sum:fun(prod(num,num),fun(fun(num,real),real)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((sum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((sum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((sum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))))
      #|sum_DEF =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))))))))
      #|sum =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num))) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#SUC:fun(num,num) m:num))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) m:num)))))
      #|PSUM_SUM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\i:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#<:fun(num,fun(num,bool)) i:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) i:num)))))) f:fun(num,real)))))))))
      #|PSUM_SUM_NUMSEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))))))))))
      #|SUM_TWO =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num)) f:fun(num,real)))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real)))))))))
      #|SUM_DIFF =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) m:num) n:num))) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) f:fun(num,real))))))))))
      #|ABS_SUM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real)))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num)))))))))))
      #|SUM_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) n:num) m:num)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (g:fun(num,real) r:num)))))) ((#real_le:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_EQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) n:num) m:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (g:fun(num,real) r:num)))))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_POS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) n:num))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))
      #|SUM_POS_GEN =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) n:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))
      #|SUM_ABS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\m:num. (#real_abs:fun(real,real) (f:fun(num,real) m:num)))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\m:num. (#real_abs:fun(real,real) (f:fun(num,real) m:num)))))))))))
      #|SUM_ABS_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real)))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num)))))))))))
      #|SUM_ZERO =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\N:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) N:num)) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))
      #|SUM_ADD =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_CMUL =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(num,real) n:num))))) ((#real_mul:fun(real,fun(real,real)) c:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))))
      #|SUM_NEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) d:num)) (\n:num. (#real_neg:fun(real,real) (f:fun(num,real) n:num))))) (#real_neg:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) d:num)) f:fun(num,real))))))))))
      #|SUM_SUB =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_SUBST =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<:fun(num,fun(num,bool)) p:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) p:num)) (g:fun(num,real) p:num)))))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real))))))))))))
      #|SUM_NSUB =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) c:real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\p:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) p:num)) c:real))))))))))
      #|SUM_BOUND =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\K:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) p:num)) ((#<:fun(num,fun(num,bool)) p:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) p:num)) K:real))))) ((#real_le:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) K:real)))))))))))
      #|SUM_GROUP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) k:num)) k:num)) f:fun(num,real))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#*:fun(num,fun(num,num)) n:num) k:num))) f:fun(num,real)))))))))
      #|SUM_1 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(num,real))) (f:fun(num,real) n:num))))))
      #|SUM_2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|SUM_OFFSET =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) m:num) k:num))))) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) n:num) k:num))) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) f:fun(num,real))))))))))
      #|SUM_REINDEX =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) k:num)) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) r:num) k:num)))))))))))))
      #|SUM_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|SUM_CANCEL =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) d:num)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) (#SUC:fun(num,num) n:num))) (f:fun(num,real) n:num))))) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) d:num))) (f:fun(num,real) n:num)))))))))
      #|SUM_HORNER =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) (#SUC:fun(num,num) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))))))))))
      #|SUM_CONST =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. c:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) c:real))))))
      #|SUM_SPLIT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) n:num)) p:num)) f:fun(num,real)))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) f:fun(num,real)))))))))
      #|SUM_SWAP =  |- (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#forall:fun(fun(num,bool),bool) (\m1:num. (#forall:fun(fun(num,bool),bool) (\n1:num. (#forall:fun(fun(num,bool),bool) (\m2:num. (#forall:fun(fun(num,bool),bool) (\n2:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m1:num) n1:num)) (\a:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m2:num) n2:num)) (\b:num. ((f:fun(num,fun(num,real)) a:num) b:num)))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m2:num) n2:num)) (\b:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m1:num) n1:num)) (\a:num. ((f:fun(num,fun(num,real)) a:num) b:num))))))))))))))))
      #|SUM_EQ_0 =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))
      #|SUM_MORETERMS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) p:num)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) p:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real))))))))))
      #|SUM_DIFFERENCES_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) p:num)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) m:num) n:num)) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) p:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) r:num)) (g:fun(num,real) r:num))))))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num)) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real)))) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num)) g:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) g:fun(num,real)))))))))))
      #|re_Union =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\S:fun(fun('A,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#re_Union:fun(fun(fun('A,bool),bool),fun('A,bool)) S:fun(fun('A,bool),bool))) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (S:fun(fun('A,bool),bool) s:fun('A,bool))) (s:fun('A,bool) x:'A))))))))
      #|re_union =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#re_union:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) P:fun('A,bool)) Q:fun('A,bool))) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))))))
      #|re_intersect =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#re_intersect:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) P:fun('A,bool)) Q:fun('A,bool))) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))))))
      #|re_null =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #re_null:fun('A,bool)) (\x:'A. #F:bool))
      #|re_universe =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #re_universe:fun('A,bool)) (\x:'A. #T:bool))
      #|re_subset =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) Q:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A)))))))))
      #|re_compl =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#re_compl:fun(fun('A,bool),fun('A,bool)) S:fun('A,bool))) (\x:'A. (#~:fun(bool,bool) (S:fun('A,bool) x:'A))))))
      #|SUBSETA_REFL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) S:fun('A,bool))))
      #|COMPL_MEM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#~:fun(bool,bool) ((#re_compl:fun(fun('A,bool),fun('A,bool)) S:fun('A,bool)) x:'A)))))))
      #|SUBSETA_ANTISYM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) Q:fun('A,bool))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) Q:fun('A,bool)) P:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) Q:fun('A,bool)))))))
      #|SUBSETA_TRANS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\R:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) Q:fun('A,bool))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) Q:fun('A,bool)) R:fun('A,bool)))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) R:fun('A,bool)))))))))
      #|istopology =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\L:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#istopology:fun(fun(fun('A,bool),bool),bool) L:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (L:fun(fun('A,bool),bool) #re_null:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (L:fun(fun('A,bool),bool) #re_universe:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (L:fun(fun('A,bool),bool) a:fun('A,bool))) (L:fun(fun('A,bool),bool) b:fun('A,bool)))) (L:fun(fun('A,bool),bool) ((#re_intersect:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) a:fun('A,bool)) b:fun('A,bool))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) L:fun(fun('A,bool),bool))) (L:fun(fun('A,bool),bool) (#re_Union:fun(fun(fun('A,bool),bool),fun('A,bool)) P:fun(fun('A,bool),bool))))))))))))
      #|topology_tybij =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(topology('A),bool),bool) (\a:topology('A). ((#=:fun(topology('A),fun(topology('A),bool)) (#topology:fun(fun(fun('A,bool),bool),topology('A)) (#open:fun(topology('A),fun(fun('A,bool),bool)) a:topology('A)))) a:topology('A))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\r:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#istopology:fun(fun(fun('A,bool),bool),bool) r:fun(fun('A,bool),bool))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#open:fun(topology('A),fun(fun('A,bool),bool)) (#topology:fun(fun(fun('A,bool),bool),topology('A)) r:fun(fun('A,bool),bool)))) r:fun(fun('A,bool),bool))))))
      #|TOPOLOGY =  |- (#forall:fun(fun(topology('A),bool),bool) (\L:topology('A). ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) #re_null:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) #re_universe:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) x:fun('A,bool))) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) y:fun('A,bool)))) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) ((#re_intersect:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) x:fun('A,bool)) y:fun('A,bool))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)))) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) (#re_Union:fun(fun(fun('A,bool),bool),fun('A,bool)) P:fun(fun('A,bool),bool)))))))))))
      #|TOPOLOGY_UNION =  |- (#forall:fun(fun(topology('A),bool),bool) (\L:topology('A). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) P:fun(fun('A,bool),bool)) (#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)))) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) (#re_Union:fun(fun(fun('A,bool),bool),fun('A,bool)) P:fun(fun('A,bool),bool))))))))
      #|neigh =  |- (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). (#forall:fun(fun(fun('A,bool),bool),bool) (\N:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) top:topology('A)) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) N:fun('A,bool)) x:'A))) (#?:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) P:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) N:fun('A,bool))) (P:fun('A,bool) x:'A))))))))))))
      #|OPEN_OWN_NEIGH =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) S:fun('A,bool))) (S:fun('A,bool) x:'A))) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) top:topology('A)) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) S:fun('A,bool)) x:'A)))))))))
      #|OPEN_UNOPEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). ((#=:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) S:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#re_Union:fun(fun(fun('A,bool),bool),fun('A,bool)) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) P:fun('A,bool))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) S:fun('A,bool)))))) S:fun('A,bool)))))))
      #|OPEN_SUBOPEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). ((#=:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) S:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#?:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) P:fun('A,bool))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) S:fun('A,bool))))))))))))))
      #|OPEN_NEIGH =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). ((#=:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) S:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#?:fun(fun(fun('A,bool),bool),bool) (\N:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) top:topology('A)) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) N:fun('A,bool)) x:'A))) ((#re_subset:fun(fun('A,bool),fun(fun('A,bool),bool)) N:fun('A,bool)) S:fun('A,bool)))))))))))))
      #|closed =  |- (#forall:fun(fun(topology('A),bool),bool) (\L:topology('A). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#closed:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) S:fun('A,bool))) ((#open:fun(topology('A),fun(fun('A,bool),bool)) L:topology('A)) (#re_compl:fun(fun('A,bool),fun('A,bool)) S:fun('A,bool))))))))
      #|limpt =  |- (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#limpt:fun(topology('A),fun('A,fun(fun('A,bool),bool))) top:topology('A)) x:'A) S:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\N:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) top:topology('A)) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) N:fun('A,bool)) x:'A))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) (S:fun('A,bool) y:'A)) (N:fun('A,bool) y:'A)))))))))))))))
      #|CLOSED_LIMPT =  |- (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#closed:fun(topology('A),fun(fun('A,bool),bool)) top:topology('A)) S:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (((#limpt:fun(topology('A),fun('A,fun(fun('A,bool),bool))) top:topology('A)) x:'A) S:fun('A,bool))) (S:fun('A,bool) x:'A)))))))))
      #|ismet =  |- (#forall:fun(fun(fun(prod('A,'A),real),bool),bool) (\m:fun(prod('A,'A),real). ((#=:fun(bool,fun(bool,bool)) (#ismet:fun(fun(prod('A,'A),real),bool) m:fun(prod('A,'A),real))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (m:fun(prod('A,'A),real) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#real_le:fun(real,fun(real,bool)) (m:fun(prod('A,'A),real) ((#,:fun('A,fun('A,prod('A,'A))) y:'A) z:'A))) ((#real_add:fun(real,fun(real,real)) (m:fun(prod('A,'A),real) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) (m:fun(prod('A,'A),real) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) z:'A))))))))))))))
      #|metric_tybij =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(metric('A),bool),bool) (\a:metric('A). ((#=:fun(metric('A),fun(metric('A),bool)) (#metric:fun(fun(prod('A,'A),real),metric('A)) (#mdist:fun(metric('A),fun(prod('A,'A),real)) a:metric('A)))) a:metric('A))))) (#forall:fun(fun(fun(prod('A,'A),real),bool),bool) (\r:fun(prod('A,'A),real). ((#=:fun(bool,fun(bool,bool)) (#ismet:fun(fun(prod('A,'A),real),bool) r:fun(prod('A,'A),real))) ((#=:fun(fun(prod('A,'A),real),fun(fun(prod('A,'A),real),bool)) (#mdist:fun(metric('A),fun(prod('A,'A),real)) (#metric:fun(fun(prod('A,'A),real),metric('A)) r:fun(prod('A,'A),real)))) r:fun(prod('A,'A),real))))))
      #|METRIC_ISMET =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#ismet:fun(fun(prod('A,'A),real),bool) (#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)))))
      #|METRIC_ZERO =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))
      #|METRIC_SAME =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) x:'A))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|METRIC_POS =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A)))))))))
      #|METRIC_SYM =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) y:'A) x:'A)))))))))
      #|METRIC_TRIANGLE =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#real_le:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) z:'A))) ((#real_add:fun(real,fun(real,real)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) y:'A) z:'A))))))))))))
      #|METRIC_NZ =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))))))))))
      #|mtop =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). ((#=:fun(topology('A),fun(topology('A),bool)) (#mtop:fun(metric('A),topology('A)) m:metric('A))) (#topology:fun(fun(fun('A,bool),bool),topology('A)) (\S:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) e:real)) (S:fun('A,bool) y:'A)))))))))))))))
      #|mtop_istopology =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#istopology:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) e:real)) (S:fun('A,bool) y:'A))))))))))))))
      #|MTOP_OPEN =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). ((#=:fun(bool,fun(bool,bool)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) (#mtop:fun(metric('A),topology('A)) m:metric('A))) S:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (S:fun('A,bool) x:'A)) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) e:real)) (S:fun('A,bool) y:'A)))))))))))))
      #|ball =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\e:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#ball:fun(metric('A),fun(prod('A,real),fun('A,bool))) m:metric('A)) ((#,:fun('A,fun(real,prod('A,real))) x:'A) e:real))) (\y:'A. ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) e:real)))))))))
      #|BALL_OPEN =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#open:fun(topology('A),fun(fun('A,bool),bool)) (#mtop:fun(metric('A),topology('A)) m:metric('A))) ((#ball:fun(metric('A),fun(prod('A,real),fun('A,bool))) m:metric('A)) ((#,:fun('A,fun(real,prod('A,real))) x:'A) e:real))))))))))
      #|BALL_NEIGH =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) (#mtop:fun(metric('A),topology('A)) m:metric('A))) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) ((#ball:fun(metric('A),fun(prod('A,real),fun('A,bool))) m:metric('A)) ((#,:fun('A,fun(real,prod('A,real))) x:'A) e:real))) x:'A)))))))))
      #|MTOP_LIMPT =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (((#limpt:fun(topology('A),fun('A,fun(fun('A,bool),bool))) (#mtop:fun(metric('A),topology('A)) m:metric('A))) x:'A) S:fun('A,bool))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) (S:fun('A,bool) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) e:real)))))))))))))))
      #|ISMET_R1 =  |- (#ismet:fun(fun(prod(real,real),real),bool) (#GABS:fun(fun(fun(prod(real,real),real),bool),fun(prod(real,real),real)) (\f:fun(prod(real,real),real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#GEQ:fun(real,fun(real,bool)) (f:fun(prod(real,real),real) ((#,:fun(real,fun(real,prod(real,real))) x:real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))))))))))
      #|mr1 =  |- ((#=:fun(metric(real),fun(metric(real),bool)) #mr1:metric(real)) (#metric:fun(fun(prod(real,real),real),metric(real)) (#GABS:fun(fun(fun(prod(real,real),real),bool),fun(prod(real,real),real)) (\f:fun(prod(real,real),real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#GEQ:fun(real,fun(real,bool)) (f:fun(prod(real,real),real) ((#,:fun(real,fun(real,prod(real,real))) x:real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))))))))))
      #|MR1_DEF =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) y:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)))))))
      #|MR1_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))) (#real_abs:fun(real,real) d:real))))))
      #|MR1_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)))) (#real_abs:fun(real,real) d:real))))))
      #|MR1_ADD_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))) d:real))))))
      #|MR1_SUB_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)))) d:real))))))
      #|MR1_ADD_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))) d:real))))))
      #|MR1_SUB_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#=:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)))) d:real))))))
      #|MR1_BETWEEN1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) z:real)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric(real),fun(prod(real,real),real)) #mr1:metric(real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) z:real) x:real)))) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))))))))
      #|MR1_LIMPT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#limpt:fun(topology(real),fun(real,fun(fun(real,bool),bool))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) x:real) #re_universe:fun(real,bool))))
      #|dorder =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) x:'A) x:'A)) ((g:fun('A,fun('A,bool)) y:'A) y:'A))) (#?:fun(fun('A,bool),bool) (\z:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) z:'A) z:'A)) (#forall:fun(fun('A,bool),bool) (\w:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) w:'A) z:'A)) ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) w:'A) x:'A)) ((g:fun('A,fun('A,bool)) w:'A) y:'A))))))))))))))))
      #|tends =  |- (#forall:fun(fun(topology('A),bool),bool) (\top:topology('A). (#forall:fun(fun('A,bool),bool) (\l:'A. (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\g:fun('B,fun('B,bool)). (#forall:fun(fun(fun('B,'A),bool),bool) (\s:fun('B,'A). ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('B,'A),fun('A,fun(prod(topology('A),fun('B,fun('B,bool))),bool))) s:fun('B,'A)) l:'A) ((#,:fun(topology('A),fun(fun('B,fun('B,bool)),prod(topology('A),fun('B,fun('B,bool))))) top:topology('A)) g:fun('B,fun('B,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\N:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#neigh:fun(topology('A),fun(prod(fun('A,bool),'A),bool)) top:topology('A)) ((#,:fun(fun('A,bool),fun('A,prod(fun('A,bool),'A))) N:fun('A,bool)) l:'A))) (#?:fun(fun('B,bool),bool) (\n:'B. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) n:'B) n:'B)) (#forall:fun(fun('B,bool),bool) (\m:'B. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) m:'B) n:'B)) (N:fun('A,bool) (s:fun('B,'A) m:'B))))))))))))))))))))
      #|bounded =  |- (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\g:fun('B,fun('B,bool)). (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun(fun('B,'A),bool),bool) (\f:fun('B,'A). ((#=:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric('A),fun('B,fun('B,bool))),fun(fun('B,'A),bool)) ((#,:fun(metric('A),fun(fun('B,fun('B,bool)),prod(metric('A),fun('B,fun('B,bool))))) m:metric('A)) g:fun('B,fun('B,bool)))) f:fun('B,'A))) (#?:fun(fun(real,bool),bool) (\k:real. (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\N:'B. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) N:'B) N:'B)) (#forall:fun(fun('B,bool),bool) (\n:'B. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) n:'B) N:'B)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) (f:fun('B,'A) n:'B)) x:'A))) k:real))))))))))))))))))
      #|tendsto =  |- (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#=:fun(bool,fun(bool,bool)) (((#tendsto:fun(prod(metric('A),'A),fun('A,fun('A,bool))) ((#,:fun(metric('A),fun('A,prod(metric('A),'A))) m:metric('A)) x:'A)) y:'A) z:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A)))) ((#real_le:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) z:'A)))))))))))))
      #|DORDER_LEMMA =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\n:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) n:'A)) (#forall:fun(fun('A,bool),bool) (\m:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) m:'A) n:'A)) (P:fun('A,bool) m:'A)))))))) (#?:fun(fun('A,bool),bool) (\n:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) n:'A)) (#forall:fun(fun('A,bool),bool) (\m:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) m:'A) n:'A)) (Q:fun('A,bool) m:'A))))))))) (#?:fun(fun('A,bool),bool) (\n:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) n:'A)) (#forall:fun(fun('A,bool),bool) (\m:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) m:'A) n:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) m:'A)) (Q:fun('A,bool) m:'A))))))))))))))))
      #|DORDER_NGE =  |- (#dorder:fun(fun(num,fun(num,bool)),bool) #>=:fun(num,fun(num,bool)))
      #|DORDER_TENDSTO =  |- (#forall:fun(fun(metric('A),bool),bool) (\m:metric('A). (#forall:fun(fun('A,bool),bool) (\x:'A. (#dorder:fun(fun('A,fun('A,bool)),bool) (#tendsto:fun(prod(metric('A),'A),fun('A,fun('A,bool))) ((#,:fun(metric('A),fun('A,prod(metric('A),'A))) m:metric('A)) x:'A)))))))
      #|MTOP_TENDS =  |- (#forall:fun(fun(metric('A),bool),bool) (\d:metric('A). (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\g:fun('B,fun('B,bool)). (#forall:fun(fun(fun('B,'A),bool),bool) (\x:fun('B,'A). (#forall:fun(fun('A,bool),bool) (\x0:'A. ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('B,'A),fun('A,fun(prod(topology('A),fun('B,fun('B,bool))),bool))) x:fun('B,'A)) x0:'A) ((#,:fun(topology('A),fun(fun('B,fun('B,bool)),prod(topology('A),fun('B,fun('B,bool))))) (#mtop:fun(metric('A),topology('A)) d:metric('A))) g:fun('B,fun('B,bool))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun('B,bool),bool) (\n:'B. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) n:'B) n:'B)) (#forall:fun(fun('B,bool),bool) (\m:'B. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('B,fun('B,bool)) m:'B) n:'B)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) d:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) (x:fun('B,'A) m:'B)) x0:'A))) e:real)))))))))))))))))))
      #|MTOP_TENDS_UNIQ =  |- (#forall:fun(fun(fun('B,fun('B,bool)),bool),bool) (\g:fun('B,fun('B,bool)). (#forall:fun(fun(metric('A),bool),bool) (\d:metric('A). ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('B,fun('B,bool)),bool) g:fun('B,fun('B,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('B,'A),fun('A,fun(prod(topology('A),fun('B,fun('B,bool))),bool))) x:fun('B,'A)) x0:'A) ((#,:fun(topology('A),fun(fun('B,fun('B,bool)),prod(topology('A),fun('B,fun('B,bool))))) (#mtop:fun(metric('A),topology('A)) d:metric('A))) g:fun('B,fun('B,bool))))) (((#tends:fun(fun('B,'A),fun('A,fun(prod(topology('A),fun('B,fun('B,bool))),bool))) x:fun('B,'A)) x1:'A) ((#,:fun(topology('A),fun(fun('B,fun('B,bool)),prod(topology('A),fun('B,fun('B,bool))))) (#mtop:fun(metric('A),topology('A)) d:metric('A))) g:fun('B,fun('B,bool)))))) ((#=:fun('A,fun('A,bool)) x0:'A) x1:'A)))))))
      #|SEQ_TENDS =  |- (#forall:fun(fun(metric('A),bool),bool) (\d:metric('A). (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). (#forall:fun(fun('A,bool),bool) (\x0:'A. ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun(num,'A),fun('A,fun(prod(topology('A),fun(num,fun(num,bool))),bool))) x:fun(num,'A)) x0:'A) ((#,:fun(topology('A),fun(fun(num,fun(num,bool)),prod(topology('A),fun(num,fun(num,bool))))) (#mtop:fun(metric('A),topology('A)) d:metric('A))) #>=:fun(num,fun(num,bool))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) d:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) (x:fun(num,'A) n:num)) x0:'A))) e:real))))))))))))))))
      #|LIM_TENDS =  |- (#forall:fun(fun(metric('A),bool),bool) (\m1:metric('A). (#forall:fun(fun(metric('B),bool),bool) (\m2:metric('B). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x0:'A. (#forall:fun(fun('B,bool),bool) (\y0:'B. ((#==>:fun(bool,fun(bool,bool)) (((#limpt:fun(topology('A),fun('A,fun(fun('A,bool),bool))) (#mtop:fun(metric('A),topology('A)) m1:metric('A))) x0:'A) #re_universe:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,'B),fun('B,fun(prod(topology('B),fun('A,fun('A,bool))),bool))) f:fun('A,'B)) y0:'B) ((#,:fun(topology('B),fun(fun('A,fun('A,bool)),prod(topology('B),fun('A,fun('A,bool))))) (#mtop:fun(metric('B),topology('B)) m2:metric('B))) (#tendsto:fun(prod(metric('A),'A),fun('A,fun('A,bool))) ((#,:fun(metric('A),fun('A,prod(metric('A),'A))) m1:metric('A)) x0:'A))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m1:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) x0:'A)))) ((#real_le:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m1:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) x0:'A))) d:real))) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('B),fun(prod('B,'B),real)) m2:metric('B)) ((#,:fun('B,fun('B,prod('B,'B))) (f:fun('A,'B) x:'A)) y0:'B))) e:real))))))))))))))))))))))
      #|LIM_TENDS2 =  |- (#forall:fun(fun(metric('A),bool),bool) (\m1:metric('A). (#forall:fun(fun(metric('B),bool),bool) (\m2:metric('B). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x0:'A. (#forall:fun(fun('B,bool),bool) (\y0:'B. ((#==>:fun(bool,fun(bool,bool)) (((#limpt:fun(topology('A),fun('A,fun(fun('A,bool),bool))) (#mtop:fun(metric('A),topology('A)) m1:metric('A))) x0:'A) #re_universe:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,'B),fun('B,fun(prod(topology('B),fun('A,fun('A,bool))),bool))) f:fun('A,'B)) y0:'B) ((#,:fun(topology('B),fun(fun('A,fun('A,bool)),prod(topology('B),fun('A,fun('A,bool))))) (#mtop:fun(metric('B),topology('B)) m2:metric('B))) (#tendsto:fun(prod(metric('A),'A),fun('A,fun('A,bool))) ((#,:fun(metric('A),fun('A,prod(metric('A),'A))) m1:metric('A)) x0:'A))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m1:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) x0:'A)))) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('A),fun(prod('A,'A),real)) m1:metric('A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) x0:'A))) d:real))) ((#real_lt:fun(real,fun(real,bool)) ((#mdist:fun(metric('B),fun(prod('B,'B),real)) m2:metric('B)) ((#,:fun('B,fun('B,prod('B,'B))) (f:fun('A,'B) x:'A)) y0:'B))) e:real))))))))))))))))))))))
      #|MR1_BOUNDED =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\f:fun('A,real). ((#=:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun('A,fun('A,bool))),fun(fun('A,real),bool)) ((#,:fun(metric(real),fun(fun('A,fun('A,bool)),prod(metric(real),fun('A,fun('A,bool))))) #mr1:metric(real)) g:fun('A,fun('A,bool)))) f:fun('A,real))) (#?:fun(fun(real,bool),bool) (\k:real. (#?:fun(fun('A,bool),bool) (\N:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) N:'A) N:'A)) (#forall:fun(fun('A,bool),bool) (\n:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) N:'A)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun('A,real) n:'A))) k:real))))))))))))))
      #|NET_NULL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_sub:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) x0:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))))))))
      #|NET_CONV_BOUNDED =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) ((#bounded:fun(prod(metric(real),fun('A,fun('A,bool))),fun(fun('A,real),bool)) ((#,:fun(metric(real),fun(fun('A,fun('A,bool)),prod(metric(real),fun('A,fun('A,bool))))) #mr1:metric(real)) g:fun('A,fun('A,bool)))) x:fun('A,real)))))))))
      #|NET_CONV_NZ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#?:fun(fun('A,bool),bool) (\N:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) N:'A) N:'A)) (#forall:fun(fun('A,bool),bool) (\n:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) N:'A)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (x:fun('A,real) n:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))))))
      #|NET_CONV_IBOUNDED =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#bounded:fun(prod(metric(real),fun('A,fun('A,bool))),fun(fun('A,real),bool)) ((#,:fun(metric(real),fun(fun('A,fun('A,bool)),prod(metric(real),fun('A,fun('A,bool))))) #mr1:metric(real)) g:fun('A,fun('A,bool)))) (\n:'A. (#real_inv:fun(real,real) (x:fun('A,real) n:'A)))))))))))
      #|NET_NULL_ADD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_add:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))
      #|NET_NULL_MUL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun('A,fun('A,bool))),fun(fun('A,real),bool)) ((#,:fun(metric(real),fun(fun('A,fun('A,bool)),prod(metric(real),fun('A,fun('A,bool))))) #mr1:metric(real)) g:fun('A,fun('A,bool)))) x:fun('A,real))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_mul:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))
      #|NET_NULL_CMUL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). ((#==>:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_mul:fun(real,fun(real,real)) k:real) (x:fun('A,real) n:'A)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))))))))
      #|NET_ADD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) y0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_add:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) ((#real_add:fun(real,fun(real,real)) x0:real) y0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))))))
      #|NET_NEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. (#real_neg:fun(real,real) (x:fun('A,real) n:'A)))) (#real_neg:fun(real,real) x0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))
      #|NET_SUB =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) y0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_sub:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) ((#real_sub:fun(real,fun(real,real)) x0:real) y0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))))))
      #|NET_MUL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) y0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_mul:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) ((#real_mul:fun(real,fun(real,real)) x0:real) y0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))))))
      #|NET_INV =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. (#real_inv:fun(real,real) (x:fun('A,real) n:'A)))) (#real_inv:fun(real,real) x0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))
      #|NET_DIV =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) y0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. ((#real_div:fun(real,fun(real,real)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A)))) ((#real_div:fun(real,fun(real,real)) x0:real) y0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))))))))))))))
      #|NET_ABS =  |- (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) (\n:'A. (#real_abs:fun(real,real) (x:fun('A,real) n:'A)))) (#real_abs:fun(real,real) x0:real)) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool)))))))))
      #|NET_SUM =  |- (#forall:fun(fun(fun('?1,fun('?1,bool)),bool),bool) (\g:fun('?1,fun('?1,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#dorder:fun(fun('?1,fun('?1,bool)),bool) g:fun('?1,fun('?1,bool)))) (((#tends:fun(fun('?1,real),fun(real,fun(prod(topology(real),fun('?1,fun('?1,bool))),bool))) (\x:'?1. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#,:fun(topology(real),fun(fun('?1,fun('?1,bool)),prod(topology(real),fun('?1,fun('?1,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('?1,fun('?1,bool)))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) (((#tends:fun(fun('?1,real),fun(real,fun(prod(topology(real),fun('?1,fun('?1,bool))),bool))) (f:fun(num,fun('?1,real)) r:num)) (l:fun(num,real) r:num)) ((#,:fun(topology(real),fun(fun('?1,fun('?1,bool)),prod(topology(real),fun('?1,fun('?1,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('?1,fun('?1,bool)))))))) (((#tends:fun(fun('?1,real),fun(real,fun(prod(topology(real),fun('?1,fun('?1,bool))),bool))) (\x:'?1. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. ((f:fun(num,fun('?1,real)) r:num) x:'?1))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) l:fun(num,real))) ((#,:fun(topology(real),fun(fun('?1,fun('?1,bool)),prod(topology(real),fun('?1,fun('?1,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('?1,fun('?1,bool))))))))))))
      #|NET_LE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\g:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,real),bool),bool) (\x:fun('A,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun('A,real),bool),bool) (\y:fun('A,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) (#dorder:fun(fun('A,fun('A,bool)),bool) g:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) x:fun('A,real)) x0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) (((#tends:fun(fun('A,real),fun(real,fun(prod(topology(real),fun('A,fun('A,bool))),bool))) y:fun('A,real)) y0:real) ((#,:fun(topology(real),fun(fun('A,fun('A,bool)),prod(topology(real),fun('A,fun('A,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) g:fun('A,fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\N:'A. ((#/\:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) N:'A) N:'A)) (#forall:fun(fun('A,bool),bool) (\n:'A. ((#==>:fun(bool,fun(bool,bool)) ((g:fun('A,fun('A,bool)) n:'A) N:'A)) ((#real_le:fun(real,fun(real,bool)) (x:fun('A,real) n:'A)) (y:fun('A,real) n:'A))))))))))) ((#real_le:fun(real,fun(real,bool)) x0:real) y0:real)))))))))))))
      #|tends_num_real =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) (((#tends:fun(fun(num,real),fun(real,fun(prod(topology(real),fun(num,fun(num,bool))),bool))) x:fun(num,real)) x0:real) ((#,:fun(topology(real),fun(fun(num,fun(num,bool)),prod(topology(real),fun(num,fun(num,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) #>=:fun(num,fun(num,bool)))))))))
      #|SEQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) n:num)) x0:real))) e:real))))))))))))))
      #|SEQ_CONST =  |- (#forall:fun(fun(real,bool),bool) (\k:real. ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\x:num. k:real)) k:real)))
      #|SEQ_ADD =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_add:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_add:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SEQ_MUL =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_mul:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SEQ_NEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_neg:fun(real,real) (x:fun(num,real) n:num)))) (#real_neg:fun(real,real) x0:real)))))))
      #|SEQ_INV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_inv:fun(real,real) (x:fun(num,real) n:num)))) (#real_inv:fun(real,real) x0:real)))))))
      #|SEQ_SUB =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_sub:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SEQ_DIV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y0:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_div:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_div:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SEQ_UNIQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x1:real. (#forall:fun(fun(real,bool),bool) (\x2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x1:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x2:real))) ((#=:fun(real,fun(real,bool)) x1:real) x2:real))))))))
      #|SEQ_NULL =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) s:fun(num,real)) l:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (s:fun(num,real) n:num)) l:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SEQ_SUM =  |- (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#forall:fun(fun(fun(num,real),bool),bool) (\l:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (f:fun(num,fun(num,real)) r:num)) (l:fun(num,real) r:num)))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\k:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. ((f:fun(num,fun(num,real)) r:num) k:num))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) l:fun(num,real))))))))))))
      #|SEQ_TRANSFORM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\t:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(num,bool),bool) (\N:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#=:fun(real,fun(real,bool)) (s:fun(num,real) n:num)) (t:fun(num,real) n:num)))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) s:fun(num,real)) l:real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) t:fun(num,real)) l:real))))))))))
      #|convergent =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#convergent:fun(fun(num,real),bool) f:fun(num,real))) (#?:fun(fun(real,bool),bool) (\l:real. ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real))))))
      #|cauchy =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#cauchy:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) N:num)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) m:num)) (f:fun(num,real) n:num)))) e:real))))))))))))))
      #|lim =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) (#lim:fun(fun(num,real),real) f:fun(num,real))) (#@:fun(fun(real,bool),real) (\l:real. ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real))))))
      #|SEQ_LIM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#convergent:fun(fun(num,real),bool) f:fun(num,real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) (#lim:fun(fun(num,real),real) f:fun(num,real))))))
      #|subseq =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (f:fun(num,num) m:num)) (f:fun(num,num) n:num))))))))))
      #|SUBSEQ_SUC =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (f:fun(num,num) n:num)) (f:fun(num,num) (#SUC:fun(num,num) n:num))))))))
      #|mono =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#mono:fun(fun(num,real),bool) f:fun(num,real))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) m:num)) (f:fun(num,real) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_ge:fun(real,fun(real,bool)) (f:fun(num,real) m:num)) (f:fun(num,real) n:num)))))))))))
      #|MONO_SUC =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#mono:fun(fun(num,real),bool) f:fun(num,real))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_ge:fun(real,fun(real,bool)) (f:fun(num,real) (#SUC:fun(num,num) n:num))) (f:fun(num,real) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) (#SUC:fun(num,num) n:num))) (f:fun(num,real) n:num))))))))
      #|MAX_LEMMA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (s:fun(num,real) n:num))) k:real))))))))))
      #|SEQ_BOUNDED =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) s:fun(num,real))) (#?:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (s:fun(num,real) n:num))) k:real))))))))
      #|SEQ_BOUNDED_2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(real,bool),bool) (\K:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) k:real) (f:fun(num,real) n:num))) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) K:real))))) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) f:fun(num,real)))))))))
      #|SEQ_CBOUNDED =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#cauchy:fun(fun(num,real),bool) f:fun(num,real))) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) f:fun(num,real)))))
      #|SEQ_ICONV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_ge:fun(real,fun(real,bool)) (f:fun(num,real) m:num)) (f:fun(num,real) n:num))))))))) (#convergent:fun(fun(num,real),bool) f:fun(num,real)))))
      #|SEQ_NEG_CONV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#convergent:fun(fun(num,real),bool) f:fun(num,real))) (#convergent:fun(fun(num,real),bool) (\n:num. (#real_neg:fun(real,real) (f:fun(num,real) n:num)))))))
      #|SEQ_NEG_BOUNDED =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) (\n:num. (#real_neg:fun(real,real) (f:fun(num,real) n:num))))) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) f:fun(num,real)))))
      #|SEQ_BCONV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) f:fun(num,real))) (#mono:fun(fun(num,real),bool) f:fun(num,real)))) (#convergent:fun(fun(num,real),bool) f:fun(num,real)))))
      #|SEQ_MONOSUB =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#?:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#mono:fun(fun(num,real),bool) (\n:num. (s:fun(num,real) (f:fun(num,num) n:num)))))))))
      #|SEQ_SBOUNDED =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) s:fun(num,real))) ((#bounded:fun(prod(metric(real),fun(num,fun(num,bool))),fun(fun(num,real),bool)) ((#,:fun(metric(real),fun(fun(num,fun(num,bool)),prod(metric(real),fun(num,fun(num,bool))))) #mr1:metric(real)) #>=:fun(num,fun(num,bool)))) (\n:num. (s:fun(num,real) (f:fun(num,num) n:num)))))))))
      #|SEQ_SUBLE =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) ((#<=:fun(num,fun(num,bool)) n:num) (f:fun(num,num) n:num)))))))
      #|SEQ_DIRECT =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#forall:fun(fun(num,bool),bool) (\N1:num. (#forall:fun(fun(num,bool),bool) (\N2:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N1:num)) ((#>=:fun(num,fun(num,bool)) (f:fun(num,num) n:num)) N2:num)))))))))))
      #|SEQ_CAUCHY =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#cauchy:fun(fun(num,real),bool) f:fun(num,real))) (#convergent:fun(fun(num,real),bool) f:fun(num,real)))))
      #|SEQ_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) g:fun(num,real)) m:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num)))))))))) ((#real_le:fun(real,fun(real,bool)) l:real) m:real))))))))))
      #|SEQ_LE_0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (g:fun(num,real) n:num))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))))))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) g:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|SEQ_SUC =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (f:fun(num,real) (#SUC:fun(num,num) n:num)))) l:real))))))
      #|SEQ_ABS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SEQ_ABS_IMP =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) (#real_abs:fun(real,real) l:real)))))))
      #|SEQ_INV0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\y:real. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_gt:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) y:real))))))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_inv:fun(real,real) (f:fun(num,real) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SEQ_POWER_ABS =  |- (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) c:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) c:real)) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SEQ_POWER =  |- (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) c:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_pow:fun(real,fun(num,real)) c:real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SEQ_HARMONIC =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_div:fun(real,fun(real,real)) a:real) (#real_of_num:fun(num,real) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|SEQ_SUBSEQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) n:num)) b:num)))) l:real)))))))))))
      #|SEQ_POW =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\i:num. ((#real_pow:fun(real,fun(num,real)) (f:fun(num,real) i:num)) n:num))) ((#real_pow:fun(real,fun(num,real)) l:real) n:num)))))))))
      #|NEST_LEMMA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_ge:fun(real,fun(real,bool)) (f:fun(num,real) (#SUC:fun(num,num) n:num))) (f:fun(num,real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (g:fun(num,real) (#SUC:fun(num,num) n:num))) (g:fun(num,real) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))))) (#?:fun(fun(real,bool),bool) (\l:real. (#?:fun(fun(real,bool),bool) (\m:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) l:real) m:real)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) l:real)))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) m:real) (g:fun(num,real) n:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) g:fun(num,real)) m:real)))))))))))))
      #|NEST_LEMMA_UNIQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_ge:fun(real,fun(real,bool)) (f:fun(num,real) (#SUC:fun(num,num) n:num))) (f:fun(num,real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (g:fun(num,real) (#SUC:fun(num,num) n:num))) (g:fun(num,real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#?:fun(fun(real,bool),bool) (\l:real. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) l:real)))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) l:real) (g:fun(num,real) n:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) g:fun(num,real)) l:real))))))))))
      #|BOLZANO_LEMMA =  |- (#forall:fun(fun(fun(prod(real,real),bool),bool),bool) (\P:fun(prod(real,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(prod(real,real),bool) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))) (P:fun(prod(real,real),bool) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)))))) (P:fun(prod(real,real),bool) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)) d:real)))) (P:fun(prod(real,real),bool) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))))))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (P:fun(prod(real,real),bool) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real))))))))))
      #|BOLZANO_LEMMA_ALT =  |- (#forall:fun(fun(fun(real,fun(real,bool)),bool),bool) (\P:fun(real,fun(real,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((P:fun(real,fun(real,bool)) a:real) b:real)) ((P:fun(real,fun(real,bool)) b:real) c:real))))) ((P:fun(real,fun(real,bool)) a:real) c:real))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)) d:real)))) ((P:fun(real,fun(real,bool)) a:real) b:real))))))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((P:fun(real,fun(real,bool)) a:real) b:real)))))))))
      #|sums =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#=:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) s:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real)))) s:real))))))
      #|summable =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#?:fun(fun(real,bool),bool) (\s:real. ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) s:real))))))
      #|suminf =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) (#suminf:fun(fun(num,real),real) f:fun(num,real))) (#@:fun(fun(real,bool),real) (\s:real. ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) s:real))))))
      #|SUM_SUMMABLE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) (#summable:fun(fun(num,real),bool) f:fun(num,real)))))))
      #|SUMMABLE_SUM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))
      #|SUM_UNIQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) x:real)) ((#=:fun(real,fun(real,bool)) x:real) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))))
      #|SER_UNIQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) x:real)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|SER_0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(real,fun(real,bool)) (f:fun(num,real) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))))))))
      #|SER_POS_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) m:num))))))) ((#real_le:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))))
      #|SER_POS_LT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(num,real) m:num))))))) ((#real_lt:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))))
      #|SER_GROUP =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) k:num))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) n:num) k:num)) k:num)) f:fun(num,real)))) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))))
      #|SER_PAIR =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real)))) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))
      #|SER_OFFSET =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\k:num. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))) ((#real_sub:fun(real,fun(real,real)) (#suminf:fun(fun(num,real),real) f:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) f:fun(num,real)))))))))
      #|SER_OFFSET_REV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num))))) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) k:num)) f:fun(num,real))) (#suminf:fun(fun(num,real),real) (\n:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) k:num)))))))))))
      #|SER_POS_LT_PAIR =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:num)))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) ((#real_lt:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))) (#suminf:fun(fun(num,real),real) f:fun(num,real))))))))
      #|SER_ADD =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#sums:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_add:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_add:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SER_CMUL =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) c:real) (x:fun(num,real) n:num)))) ((#real_mul:fun(real,fun(real,real)) c:real) x0:real)))))))))
      #|SER_NEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. (#real_neg:fun(real,real) (x:fun(num,real) n:num)))) (#real_neg:fun(real,real) x0:real)))))))
      #|SER_SUB =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\y0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#sums:fun(fun(num,real),fun(real,bool)) y:fun(num,real)) y0:real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) n:num)) (y:fun(num,real) n:num)))) ((#real_sub:fun(real,fun(real,real)) x0:real) y0:real)))))))))))
      #|SER_CDIV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) x0:real)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_div:fun(real,fun(real,real)) (x:fun(num,real) n:num)) c:real))) ((#real_div:fun(real,fun(real,real)) x0:real) c:real)))))))))
      #|SER_CAUCHY =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) m:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) f:fun(num,real)))) e:real))))))))))))))
      #|SER_ZERO =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|SER_COMPAR =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) n:num))) (g:fun(num,real) n:num)))))))) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) (#summable:fun(fun(num,real),bool) f:fun(num,real)))))))
      #|SER_COMPARA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) n:num))) (g:fun(num,real) n:num)))))))) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) (#summable:fun(fun(num,real),bool) (\k:num. (#real_abs:fun(real,real) (f:fun(num,real) k:num)))))))))
      #|SER_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (f:fun(num,real) n:num)) (g:fun(num,real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#summable:fun(fun(num,real),bool) g:fun(num,real))))) ((#real_le:fun(real,fun(real,bool)) (#suminf:fun(fun(num,real),real) f:fun(num,real))) (#suminf:fun(fun(num,real),real) g:fun(num,real))))))))
      #|SER_LE2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) n:num))) (g:fun(num,real) n:num))))) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) ((#real_le:fun(real,fun(real,bool)) (#suminf:fun(fun(num,real),real) f:fun(num,real))) (#suminf:fun(fun(num,real),real) g:fun(num,real)))))))))
      #|SER_ACONV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num))))) (#summable:fun(fun(num,real),bool) f:fun(num,real)))))
      #|SER_ABS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#suminf:fun(fun(num,real),real) f:fun(num,real)))) (#suminf:fun(fun(num,real),real) (\n:num. (#real_abs:fun(real,real) (f:fun(num,real) n:num))))))))
      #|GP_FINITE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\n:num. ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_sub:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|GP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) (#real_inv:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))))))
      #|ABS_NEG_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) c:real) (#real_abs:fun(real,real) y:real)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|SER_RATIO =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\N:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) (#SUC:fun(num,num) n:num)))) ((#real_mul:fun(real,fun(real,real)) c:real) (#real_abs:fun(real,real) (f:fun(num,real) n:num))))))))) (#summable:fun(fun(num,real),bool) f:fun(num,real)))))))))
      #|SEQ_TRUNCATION =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) f:fun(num,real)) l:real)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)) f:fun(num,real)))) b:real))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) l:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,real))))) b:real))))))))))
      #|tends_real_real =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x0:real)) (((#tends:fun(fun(real,real),fun(real,fun(prod(topology(real),fun(real,fun(real,bool))),bool))) f:fun(real,real)) l:real) ((#,:fun(topology(real),fun(fun(real,fun(real,bool)),prod(topology(real),fun(real,fun(real,bool))))) (#mtop:fun(metric(real),topology(real)) #mr1:metric(real))) (#tendsto:fun(prod(metric(real),real),fun(real,fun(real,bool))) ((#,:fun(metric(real),fun(real,prod(metric(real),real))) #mr1:metric(real)) x0:real)))))))))))
      #|LIM =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y0:real. (#forall:fun(fun(real,bool),bool) (\x0:real. ((#=:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) y0:real) x0:real)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real)))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) y0:real))) e:real)))))))))))))))))
      #|LIM_CONST =  |- (#forall:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(real,bool),bool) (\x:real. (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. k:real)) k:real) x:real)))))
      #|LIM_ADD =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))
      #|LIM_MUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))
      #|LIM_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) l:real)) x:real))))))
      #|LIM_INV =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) (#real_inv:fun(real,real) l:real)) x:real))))))
      #|LIM_SUB =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_sub:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))
      #|LIM_DIV =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) m:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_div:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))
      #|LIM_NULL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) l:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))))
      #|LIM_SUM =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#forall:fun(fun(fun(num,real),bool),bool) (\l:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (f:fun(num,fun(real,real)) r:num)) (l:fun(num,real) r:num)) x:real))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. ((f:fun(num,fun(real,real)) r:num) x:real))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) l:fun(num,real))) x:real))))))))))))
      #|LIM_X =  |- (#forall:fun(fun(real,bool),bool) (\x0:real. (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. x:real)) x0:real) x0:real)))
      #|LIM_UNIQ =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) m:real) x:real))) ((#=:fun(real,fun(real,bool)) l:real) m:real))))))))))
      #|LIM_EQUAL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) x0:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))))) ((#=:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x0:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) l:real) x0:real)))))))))))
      #|LIM_TRANSFORM =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x0:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) l:real) x0:real))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x0:real))))))))))
      #|diffl =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\h:real. ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) h:real))) (f:fun(real,real) x:real))) h:real))) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|contl =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\h:real. (f:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) h:real)))) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|differentiable =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#differentiable:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) (#?:fun(fun(real,bool),bool) (\l:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real))))))))
      #|DIFF_UNIQ =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) m:real) x:real))) ((#=:fun(real,fun(real,bool)) l:real) m:real))))))))))
      #|DIFF_CONT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))))))
      #|CONTL_LIM =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f:fun(real,real) x:real)) x:real))))))
      #|CONT_X =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. x:real)) x:real)))
      #|CONT_CONST =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. k:real)) x:real)))
      #|CONT_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) x:real))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real))))
      #|CONT_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) x:real))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real))))
      #|CONT_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) x:real))))
      #|CONT_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) x:real))))
      #|CONT_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) x:real))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real))))
      #|CONT_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real))))
      #|CONT_ABS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))
      #|CONT_COMPOSE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) (f:fun(real,real) x:real)))) ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. (g:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))))
      #|IVT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) a:real)) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (f:fun(real,real) b:real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) y:real))))))))))))))
      #|IVT2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) b:real)) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (f:fun(real,real) a:real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) y:real))))))))))))))
      #|DIFF_CONST =  |- (#forall:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. k:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))))
      #|DIFF_ADD =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))))
      #|DIFF_MUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) l:real) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) m:real) (f:fun(real,real) x:real)))) x:real))))))))))))
      #|DIFF_CMUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) c:real) l:real)) x:real))))))))))
      #|DIFF_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) l:real)) x:real))))))))
      #|DIFF_SUB =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_sub:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))))
      #|DIFF_CARAT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) z:real)) (f:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (g:fun(real,real) z:real)) ((#real_sub:fun(real,fun(real,real)) z:real) x:real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) l:real))))))))))))
      #|DIFF_CHAIN =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) (g:fun(real,real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) l:real) m:real)) x:real))))))))))))
      #|DIFF_X =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))
      #|DIFF_POW =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)))))
      #|DIFF_XM1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_inv:fun(real,real) x:real))) (#real_neg:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))))
      #|DIFF_INV =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) l:real) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real))))))))
      #|DIFF_DIV =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) l:real) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) m:real) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))))))))))
      #|DIFF_SUM =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\f':fun(num,fun(real,real)). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) r:num)) ((#<:fun(num,fun(num,bool)) r:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((f:fun(num,fun(real,real)) r:num) x:real))) ((f':fun(num,fun(real,real)) r:num) x:real)) x:real))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\n:num. ((f:fun(num,fun(real,real)) n:num) x:real))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\r:num. ((f':fun(num,fun(real,real)) r:num) x:real)))) x:real))))))))))))
      #|CONT_BOUNDED =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\M:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real)))))))))))))
      #|CONT_BOUNDED_ABS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#?:fun(fun(real,bool),bool) (\M:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) M:real)))))))))))))
      #|CONT_HASSUP =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real))))) (#forall:fun(fun(real,bool),bool) (\N:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) N:real) M:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) N:real) (f:fun(real,real) x:real)))))))))))))))))))
      #|CONT_ATTAINS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real)))))))))))))))
      #|CONT_ATTAINS2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) M:real) (f:fun(real,real) x:real)))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real)))))))))))))))
      #|CONT_ATTAINS_ALL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\L:real. (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) L:real) (f:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) M:real)))))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) L:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) M:real))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) y:real))))))))))))))))))))
      #|DIFF_LINC =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) l:real))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) h:real)) ((#real_lt:fun(real,fun(real,bool)) h:real) d:real))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) h:real))))))))))))))))
      #|DIFF_LDEC =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) h:real)) ((#real_lt:fun(real,fun(real,bool)) h:real) d:real))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) h:real))))))))))))))))
      #|DIFF_LMAX =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real)))))))))) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|DIFF_LMIN =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))))))))) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|DIFF_LCONST =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (f:fun(real,real) x:real)))))))))) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|INTERVAL_LEMMA_LT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) b:real)))))))))))))))
      #|INTERVAL_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)))))))))))))))
      #|ROLLE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) a:real)) (f:fun(real,real) b:real))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) ((#differentiable:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real))))))))))))
      #|MVT_LEMMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(real,fun(real,bool)) ((\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real))) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))) x:real))) a:real)) ((\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real))) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))) x:real))) b:real))))))))
      #|MVT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) ((#differentiable:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))))) (#?:fun(fun(real,bool),bool) (\l:real. (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) z:real)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)) l:real))))))))))))))))
      #|MVT_ALT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real)))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)) (f':fun(real,real) z:real))))))))))))))))
      #|DIFF_ISCONST_END =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real)))))))))
      #|DIFF_ISCONST =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) a:real))))))))))))
      #|DIFF_ISCONST_END_SIMPLE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real)))))))))
      #|DIFF_ISCONST_ALL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))))))))
      #|INTERVAL_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) d:real)) z:real)) ((#real_le:fun(real,fun(real,bool)) z:real) ((#real_add:fun(real,fun(real,real)) x:real) d:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real))))))))
      #|CONT_INJ_LEMMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))))) (#~:fun(bool,bool) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) z:real)) (f:fun(real,real) x:real)))))))))))))))
      #|CONT_INJ_LEMMA2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))))) (#~:fun(bool,bool) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (f:fun(real,real) z:real)))))))))))))))
      #|CONT_INJ_RANGE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))))) (#?:fun(fun(real,bool),bool) (\e:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) (f:fun(real,real) x:real)))) e:real)) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) z:real)) y:real)))))))))))))))))))
      #|CONT_INVERSE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))))) ((#contl:fun(fun(real,real),fun(real,bool)) g:fun(real,real)) (f:fun(real,real) x:real)))))))))))
      #|DIFF_INVERSE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) (#real_inv:fun(real,real) l:real)) (f:fun(real,real) x:real)))))))))))))
      #|DIFF_INVERSE_LT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\l:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) (f:fun(real,real) z:real))) z:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) z:real) x:real))) d:real)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) z:real))))) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) l:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) (#real_inv:fun(real,real) l:real)) (f:fun(real,real) x:real)))))))))))))
      #|IVT_DERIVATIVE_0 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (f':fun(real,real) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) (f':fun(real,real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) ((#=:fun(real,fun(real,bool)) (f':fun(real,real) z:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))
      #|IVT_DERIVATIVE_POS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) (f':fun(real,real) a:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) (f':fun(real,real) b:real)) y:real))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) ((#=:fun(real,fun(real,bool)) (f':fun(real,real) z:real)) y:real))))))))))))))))
      #|IVT_DERIVATIVE_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f':fun(real,real) a:real)) y:real)) ((#real_gt:fun(real,fun(real,bool)) (f':fun(real,real) b:real)) y:real))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) z:real) b:real)) ((#=:fun(real,fun(real,bool)) (f':fun(real,real) z:real)) y:real))))))))))))))))
      #|SEQ_CONT_UNIFORM =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\s:fun(num,fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x0:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((s:fun(num,fun(real,real)) n:num) x:real)) (f:fun(real,real) x:real)))) e:real))))))))))))))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#contl:fun(fun(real,real),fun(real,bool)) (s:fun(num,fun(real,real)) n:num)) x0:real)))))))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x0:real))))))))
      #|SER_COMPARA_UNIFORM =  |- (#forall:fun(fun(fun(real,fun(num,real)),bool),bool) (\s:fun(real,fun(num,real)). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((s:fun(real,fun(num,real)) x:real) n:num))) (g:fun(num,real) n:num))))))))))))) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) (#?:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (s:fun(real,fun(num,real)) x:real))) (f:fun(real,real) x:real)))) e:real)))))))))))))))))))))))
      #|SER_COMPARA_UNIFORM_WEAK =  |- (#forall:fun(fun(fun(real,fun(num,real)),bool),bool) (\s:fun(real,fun(num,real)). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((s:fun(real,fun(num,real)) x:real) n:num))) (g:fun(num,real) n:num))))))))))))) (#summable:fun(fun(num,real),bool) g:fun(num,real)))) (#?:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) x0:real))) d:real)) ((#>=:fun(num,fun(num,bool)) n:num) N:num))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (s:fun(real,fun(num,real)) x:real))) (f:fun(real,real) x:real)))) e:real)))))))))))))))))))))))
      #|CONTL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x':real) x:real))) d:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x':real)) (f:fun(real,real) x:real)))) e:real)))))))))))))))
      #|CONTL_SEQ =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) l:real)) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) x:fun(num,real)) l:real))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. (f:fun(real,real) (x:fun(num,real) n:num)))) (f:fun(real,real) l:real)))))))))
      #|SUP_INTERVAL =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) (P:fun(real,bool) x:real)))))) (#?:fun(fun(real,bool),bool) (\s:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) s:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) s:real) b:real)) (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) y:real) s:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))))))))))))))))
      #|CONT_UNIFORM =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real)))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real)))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))) e:real)))))))))))))))))))
      #|CONT_UNIFORM_STRONG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) d:real)) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) b:real)))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) d:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) y:real)))) e:real)))))))))))))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 296
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?2
      #|counter_genvar = _117809:bool
      #|
    ),
  )
}
