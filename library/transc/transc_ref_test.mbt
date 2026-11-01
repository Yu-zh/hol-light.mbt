// Load-fidelity test for Library/transc.ml: replays tools/ocaml_ref/Library_transc_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/transc matches Library/transc.ml" {
  @transc.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/transc",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/transc")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("POWDIFF_LEMMA", () => sthm(@transc.powdiff_lemma()))
  log.attempt("POWDIFF", () => sthm(@transc.powdiff()))
  log.attempt("POWREV", () => sthm(@transc.powrev()))
  log.attempt("POWSER_INSIDEA", () => sthm(@transc.powser_insidea()))
  log.attempt("POWSER_INSIDE", () => sthm(@transc.powser_inside()))
  log.attempt("diffs", () => sthm(@transc.diffs()))
  log.attempt("DIFFS_NEG", () => sthm(@transc.diffs_neg()))
  log.attempt("DIFFS_LEMMA", () => sthm(@transc.diffs_lemma()))
  log.attempt("DIFFS_LEMMA2", () => sthm(@transc.diffs_lemma2()))
  log.attempt("DIFFS_EQUIV", () => sthm(@transc.diffs_equiv()))
  log.attempt("TERMDIFF_LEMMA1", () => sthm(@transc.termdiff_lemma1()))
  log.attempt("TERMDIFF_LEMMA2", () => sthm(@transc.termdiff_lemma2()))
  log.attempt("TERMDIFF_LEMMA3", () => sthm(@transc.termdiff_lemma3()))
  log.attempt("TERMDIFF_LEMMA4", () => sthm(@transc.termdiff_lemma4()))
  log.attempt("TERMDIFF_LEMMA5", () => sthm(@transc.termdiff_lemma5()))
  log.attempt("TERMDIFF", () => sthm(@transc.termdiff()))
  log.attempt("SEQ_NPOW", () => sthm(@transc.seq_npow()))
  log.attempt("TERMDIFF_CONVERGES", () => sthm(@transc.termdiff_converges()))
  log.attempt("TERMDIFF_STRONG", () => sthm(@transc.termdiff_strong()))
  log.attempt("POWSER_0", () => sthm(@transc.powser_0()))
  log.attempt("POWSER_LIMIT_0", () => sthm(@transc.powser_limit_0()))
  log.attempt("POWSER_LIMIT_0_STRONG", () => {
    sthm(@transc.powser_limit_0_strong())
  })
  log.attempt("POWSER_EQUAL_0", () => sthm(@transc.powser_equal_0()))
  log.attempt("POWSER_EQUAL", () => sthm(@transc.powser_equal()))
  log.attempt("MULT_DIV_2", () => sthm(@transc.mult_div_2()))
  log.attempt("EVEN_DIV2", () => sthm(@transc.even_div2()))
  log.attempt("POW_ZERO", () => sthm(@transc.pow_zero()))
  log.attempt("POW_ZERO_EQ", () => sthm(@transc.pow_zero_eq()))
  log.attempt("POW_LT", () => sthm(@transc.pow_lt()))
  log.attempt("POW_EQ", () => sthm(@transc.pow_eq()))
  log.attempt("exp", () => sthm(@transc.exp()))
  log.attempt("sin", () => sthm(@transc.sin()))
  log.attempt("cos", () => sthm(@transc.cos()))
  log.attempt("REAL_EXP_CONVERGES", () => sthm(@transc.real_exp_converges()))
  log.attempt("SIN_CONVERGES", () => sthm(@transc.sin_converges()))
  log.attempt("COS_CONVERGES", () => sthm(@transc.cos_converges()))
  log.attempt("REAL_EXP_FDIFF", () => sthm(@transc.real_exp_fdiff()))
  log.attempt("SIN_FDIFF", () => sthm(@transc.sin_fdiff()))
  log.attempt("COS_FDIFF", () => sthm(@transc.cos_fdiff()))
  log.attempt("SIN_NEGLEMMA", () => sthm(@transc.sin_neglemma()))
  log.attempt("DIFF_EXP", () => sthm(@transc.diff_exp()))
  log.attempt("DIFF_SIN", () => sthm(@transc.diff_sin()))
  log.attempt("DIFF_COS", () => sthm(@transc.diff_cos()))
  log.attempt("DIFF_COMPOSITE", () => sthm(@transc.diff_composite()))
  log.attempt("REAL_EXP_0", () => sthm(@transc.real_exp_0()))
  log.attempt("REAL_EXP_LE_X", () => sthm(@transc.real_exp_le_x()))
  log.attempt("REAL_EXP_LT_1", () => sthm(@transc.real_exp_lt_1()))
  log.attempt("REAL_EXP_ADD_MUL", () => sthm(@transc.real_exp_add_mul()))
  log.attempt("REAL_EXP_NEG_MUL", () => sthm(@transc.real_exp_neg_mul()))
  log.attempt("REAL_EXP_NEG_MUL2", () => sthm(@transc.real_exp_neg_mul2()))
  log.attempt("REAL_EXP_NEG", () => sthm(@transc.real_exp_neg()))
  log.attempt("REAL_EXP_ADD", () => sthm(@transc.real_exp_add()))
  log.attempt("REAL_EXP_POS_LE", () => sthm(@transc.real_exp_pos_le()))
  log.attempt("REAL_EXP_NZ", () => sthm(@transc.real_exp_nz()))
  log.attempt("REAL_EXP_POS_LT", () => sthm(@transc.real_exp_pos_lt()))
  log.attempt("REAL_EXP_N", () => sthm(@transc.real_exp_n()))
  log.attempt("REAL_EXP_SUB", () => sthm(@transc.real_exp_sub()))
  log.attempt("REAL_EXP_MONO_IMP", () => sthm(@transc.real_exp_mono_imp()))
  log.attempt("REAL_EXP_MONO_LT", () => sthm(@transc.real_exp_mono_lt()))
  log.attempt("REAL_EXP_MONO_LE", () => sthm(@transc.real_exp_mono_le()))
  log.attempt("REAL_EXP_INJ", () => sthm(@transc.real_exp_inj()))
  log.attempt("REAL_EXP_TOTAL_LEMMA", () => sthm(@transc.real_exp_total_lemma()))
  log.attempt("REAL_EXP_TOTAL", () => sthm(@transc.real_exp_total()))
  log.attempt("REAL_EXP_BOUND_LEMMA", () => sthm(@transc.real_exp_bound_lemma()))
  log.attempt("ln", () => sthm(@transc.ln()))
  log.attempt("LN_EXP", () => sthm(@transc.ln_exp()))
  log.attempt("REAL_EXP_LN", () => sthm(@transc.real_exp_ln()))
  log.attempt("EXP_LN", () => sthm(@transc.exp_ln()))
  log.attempt("LN_MUL", () => sthm(@transc.ln_mul()))
  log.attempt("LN_INJ", () => sthm(@transc.ln_inj()))
  log.attempt("LN_1", () => sthm(@transc.ln_1()))
  log.attempt("LN_INV", () => sthm(@transc.ln_inv()))
  log.attempt("LN_DIV", () => sthm(@transc.ln_div()))
  log.attempt("LN_MONO_LT", () => sthm(@transc.ln_mono_lt()))
  log.attempt("LN_MONO_LE", () => sthm(@transc.ln_mono_le()))
  log.attempt("LN_POW", () => sthm(@transc.ln_pow()))
  log.attempt("LN_LE", () => sthm(@transc.ln_le()))
  log.attempt("LN_LT_X", () => sthm(@transc.ln_lt_x()))
  log.attempt("LN_POS", () => sthm(@transc.ln_pos()))
  log.attempt("LN_POS_LT", () => sthm(@transc.ln_pos_lt()))
  log.attempt("DIFF_LN", () => sthm(@transc.diff_ln()))
  log.attempt("root", () => sthm(@transc.root()))
  log.attempt("ROOT_LT_LEMMA", () => sthm(@transc.root_lt_lemma()))
  log.attempt("ROOT_LN", () => sthm(@transc.root_ln()))
  log.attempt("ROOT_0", () => sthm(@transc.root_0()))
  log.attempt("ROOT_1", () => sthm(@transc.root_1()))
  log.attempt("ROOT_POW_POS", () => sthm(@transc.root_pow_pos()))
  log.attempt("POW_ROOT_POS", () => sthm(@transc.pow_root_pos()))
  log.attempt("ROOT_POS_POSITIVE", () => sthm(@transc.root_pos_positive()))
  log.attempt("ROOT_POS_UNIQ", () => sthm(@transc.root_pos_uniq()))
  log.attempt("ROOT_MUL", () => sthm(@transc.root_mul()))
  log.attempt("ROOT_INV", () => sthm(@transc.root_inv()))
  log.attempt("ROOT_DIV", () => sthm(@transc.root_div()))
  log.attempt("ROOT_MONO_LT", () => sthm(@transc.root_mono_lt()))
  log.attempt("ROOT_MONO_LE", () => sthm(@transc.root_mono_le()))
  log.attempt("ROOT_MONO_LT_EQ", () => sthm(@transc.root_mono_lt_eq()))
  log.attempt("ROOT_MONO_LE_EQ", () => sthm(@transc.root_mono_le_eq()))
  log.attempt("ROOT_INJ", () => sthm(@transc.root_inj()))
  log.attempt("SQRT_EVEN_POW2", () => sthm(@transc.sqrt_even_pow2()))
  log.attempt("REAL_DIV_SQRT", () => sthm(@transc.real_div_sqrt()))
  log.attempt("DIFF_SQRT", () => sthm(@transc.diff_sqrt()))
  log.attempt("SIN_0", () => sthm(@transc.sin_0()))
  log.attempt("COS_0", () => sthm(@transc.cos_0()))
  log.attempt("SIN_CIRCLE", () => sthm(@transc.sin_circle()))
  log.attempt("SIN_BOUND", () => sthm(@transc.sin_bound()))
  log.attempt("SIN_BOUNDS", () => sthm(@transc.sin_bounds()))
  log.attempt("COS_BOUND", () => sthm(@transc.cos_bound()))
  log.attempt("COS_BOUNDS", () => sthm(@transc.cos_bounds()))
  log.attempt("SIN_COS_ADD", () => sthm(@transc.sin_cos_add()))
  log.attempt("SIN_COS_NEG", () => sthm(@transc.sin_cos_neg()))
  log.attempt("SIN_ADD", () => sthm(@transc.sin_add()))
  log.attempt("COS_ADD", () => sthm(@transc.cos_add()))
  log.attempt("SIN_NEG", () => sthm(@transc.sin_neg()))
  log.attempt("COS_NEG", () => sthm(@transc.cos_neg()))
  log.attempt("SIN_DOUBLE", () => sthm(@transc.sin_double()))
  log.attempt("COS_DOUBLE", () => sthm(@transc.cos_double()))
  log.attempt("COS_ABS", () => sthm(@transc.cos_abs()))
  log.attempt("SIN_PAIRED", () => sthm(@transc.sin_paired()))
  log.attempt("SIN_POS", () => sthm(@transc.sin_pos()))
  log.attempt("COS_PAIRED", () => sthm(@transc.cos_paired()))
  log.attempt("COS_2", () => sthm(@transc.cos_2()))
  log.attempt("COS_ISZERO", () => sthm(@transc.cos_iszero()))
  log.attempt("pi", () => sthm(@transc.pi()))
  log.attempt("PI2", () => sthm(@transc.pi2()))
  log.attempt("COS_PI2", () => sthm(@transc.cos_pi2()))
  log.attempt("PI2_BOUNDS", () => sthm(@transc.pi2_bounds()))
  log.attempt("PI_POS", () => sthm(@transc.pi_pos()))
  log.attempt("SIN_PI2", () => sthm(@transc.sin_pi2()))
  log.attempt("COS_PI", () => sthm(@transc.cos_pi()))
  log.attempt("SIN_PI", () => sthm(@transc.sin_pi()))
  log.attempt("SIN_COS", () => sthm(@transc.sin_cos()))
  log.attempt("COS_SIN", () => sthm(@transc.cos_sin()))
  log.attempt("SIN_PERIODIC_PI", () => sthm(@transc.sin_periodic_pi()))
  log.attempt("COS_PERIODIC_PI", () => sthm(@transc.cos_periodic_pi()))
  log.attempt("SIN_PERIODIC", () => sthm(@transc.sin_periodic()))
  log.attempt("COS_PERIODIC", () => sthm(@transc.cos_periodic()))
  log.attempt("COS_NPI", () => sthm(@transc.cos_npi()))
  log.attempt("SIN_NPI", () => sthm(@transc.sin_npi()))
  log.attempt("SIN_POS_PI2", () => sthm(@transc.sin_pos_pi2()))
  log.attempt("COS_POS_PI2", () => sthm(@transc.cos_pos_pi2()))
  log.attempt("COS_POS_PI", () => sthm(@transc.cos_pos_pi()))
  log.attempt("SIN_POS_PI", () => sthm(@transc.sin_pos_pi()))
  log.attempt("SIN_POS_PI_LE", () => sthm(@transc.sin_pos_pi_le()))
  log.attempt("COS_TOTAL", () => sthm(@transc.cos_total()))
  log.attempt("SIN_TOTAL", () => sthm(@transc.sin_total()))
  log.attempt("COS_ZERO_LEMMA", () => sthm(@transc.cos_zero_lemma()))
  log.attempt("SIN_ZERO_LEMMA", () => sthm(@transc.sin_zero_lemma()))
  log.attempt("COS_ZERO", () => sthm(@transc.cos_zero()))
  log.attempt("SIN_ZERO", () => sthm(@transc.sin_zero()))
  log.attempt("SIN_ZERO_PI", () => sthm(@transc.sin_zero_pi()))
  log.attempt("COS_ONE_2PI", () => sthm(@transc.cos_one_2pi()))
  log.attempt("tan", () => sthm(@transc.tan()))
  log.attempt("TAN_0", () => sthm(@transc.tan_0()))
  log.attempt("TAN_PI", () => sthm(@transc.tan_pi()))
  log.attempt("TAN_NPI", () => sthm(@transc.tan_npi()))
  log.attempt("TAN_NEG", () => sthm(@transc.tan_neg()))
  log.attempt("TAN_PERIODIC", () => sthm(@transc.tan_periodic()))
  log.attempt("TAN_PERIODIC_PI", () => sthm(@transc.tan_periodic_pi()))
  log.attempt("TAN_PERIODIC_NPI", () => sthm(@transc.tan_periodic_npi()))
  log.attempt("TAN_ADD", () => sthm(@transc.tan_add()))
  log.attempt("TAN_DOUBLE", () => sthm(@transc.tan_double()))
  log.attempt("TAN_POS_PI2", () => sthm(@transc.tan_pos_pi2()))
  log.attempt("DIFF_TAN", () => sthm(@transc.diff_tan()))
  log.attempt("TAN_TOTAL_LEMMA", () => sthm(@transc.tan_total_lemma()))
  log.attempt("TAN_TOTAL_POS", () => sthm(@transc.tan_total_pos()))
  log.attempt("TAN_TOTAL", () => sthm(@transc.tan_total()))
  log.attempt("PI2_PI4", () => sthm(@transc.pi2_pi4()))
  log.attempt("TAN_PI4", () => sthm(@transc.tan_pi4()))
  log.attempt("TAN_COT", () => sthm(@transc.tan_cot()))
  log.attempt("TAN_BOUND_PI2", () => sthm(@transc.tan_bound_pi2()))
  log.attempt("TAN_ABS_GE_X", () => sthm(@transc.tan_abs_ge_x()))
  log.attempt("asn", () => sthm(@transc.asn()))
  log.attempt("acs", () => sthm(@transc.acs()))
  log.attempt("atn", () => sthm(@transc.atn()))
  log.attempt("ASN", () => sthm(@transc.asn_v1()))
  log.attempt("ASN_SIN", () => sthm(@transc.asn_sin()))
  log.attempt("ASN_BOUNDS", () => sthm(@transc.asn_bounds()))
  log.attempt("ASN_BOUNDS_LT", () => sthm(@transc.asn_bounds_lt()))
  log.attempt("SIN_ASN", () => sthm(@transc.sin_asn()))
  log.attempt("ACS", () => sthm(@transc.acs_v1()))
  log.attempt("ACS_COS", () => sthm(@transc.acs_cos()))
  log.attempt("ACS_BOUNDS", () => sthm(@transc.acs_bounds()))
  log.attempt("ACS_BOUNDS_LT", () => sthm(@transc.acs_bounds_lt()))
  log.attempt("COS_ACS", () => sthm(@transc.cos_acs()))
  log.attempt("ATN", () => sthm(@transc.atn_v1()))
  log.attempt("ATN_TAN", () => sthm(@transc.atn_tan()))
  log.attempt("ATN_BOUNDS", () => sthm(@transc.atn_bounds()))
  log.attempt("TAN_ATN", () => sthm(@transc.tan_atn()))
  log.attempt("ATN_0", () => sthm(@transc.atn_0()))
  log.attempt("ATN_1", () => sthm(@transc.atn_1()))
  log.attempt("ATN_NEG", () => sthm(@transc.atn_neg()))
  log.attempt("COS_ATN_NZ", () => sthm(@transc.cos_atn_nz()))
  log.attempt("TAN_SEC", () => sthm(@transc.tan_sec()))
  log.attempt("DIFF_ATN", () => sthm(@transc.diff_atn()))
  log.attempt("ATN_MONO_LT", () => sthm(@transc.atn_mono_lt()))
  log.attempt("ATN_MONO_LT_EQ", () => sthm(@transc.atn_mono_lt_eq()))
  log.attempt("ATN_MONO_LE_EQ", () => sthm(@transc.atn_mono_le_eq()))
  log.attempt("ATN_INJ", () => sthm(@transc.atn_inj()))
  log.attempt("ATN_POS_LT", () => sthm(@transc.atn_pos_lt()))
  log.attempt("ATN_POS_LE", () => sthm(@transc.atn_pos_le()))
  log.attempt("ATN_LT_PI4_POS", () => sthm(@transc.atn_lt_pi4_pos()))
  log.attempt("ATN_LT_PI4_NEG", () => sthm(@transc.atn_lt_pi4_neg()))
  log.attempt("ATN_LT_PI4", () => sthm(@transc.atn_lt_pi4()))
  log.attempt("ATN_LE_PI4", () => sthm(@transc.atn_le_pi4()))
  log.attempt("COS_SIN_SQRT", () => sthm(@transc.cos_sin_sqrt()))
  log.attempt("COS_ASN_NZ", () => sthm(@transc.cos_asn_nz()))
  log.attempt("DIFF_ASN_COS", () => sthm(@transc.diff_asn_cos()))
  log.attempt("DIFF_ASN", () => sthm(@transc.diff_asn()))
  log.attempt("SIN_COS_SQRT", () => sthm(@transc.sin_cos_sqrt()))
  log.attempt("SIN_ACS_NZ", () => sthm(@transc.sin_acs_nz()))
  log.attempt("DIFF_ACS_SIN", () => sthm(@transc.diff_acs_sin()))
  log.attempt("DIFF_ACS", () => sthm(@transc.diff_acs()))
  log.attempt("CIRCLE_SINCOS", () => sthm(@transc.circle_sincos()))
  log.attempt("ACS_MONO_LT", () => sthm(@transc.acs_mono_lt()))
  log.attempt("LESS_SUC_EQ", () => sthm(@transc.less_suc_eq()))
  log.attempt("LESS_1", () => sthm(@transc.less_1()))
  log.attempt("division", () => sthm(@transc.division()))
  log.attempt("dsize", () => sthm(@transc.dsize()))
  log.attempt("tdiv", () => sthm(@transc.tdiv()))
  log.attempt("gauge", () => sthm(@transc.gauge()))
  log.attempt("fine", () => sthm(@transc.fine()))
  log.attempt("rsum", () => sthm(@transc.rsum()))
  log.attempt("defint", () => sthm(@transc.defint()))
  log.attempt("DIVISION_0", () => sthm(@transc.division_0()))
  log.attempt("DIVISION_1", () => sthm(@transc.division_1()))
  log.attempt("DIVISION_SINGLE", () => sthm(@transc.division_single()))
  log.attempt("DIVISION_LHS", () => sthm(@transc.division_lhs()))
  log.attempt("DIVISION_THM", () => sthm(@transc.division_thm()))
  log.attempt("DIVISION_RHS", () => sthm(@transc.division_rhs()))
  log.attempt("DIVISION_LT_GEN", () => sthm(@transc.division_lt_gen()))
  log.attempt("DIVISION_LT", () => sthm(@transc.division_lt()))
  log.attempt("DIVISION_LE", () => sthm(@transc.division_le()))
  log.attempt("DIVISION_GT", () => sthm(@transc.division_gt()))
  log.attempt("DIVISION_EQ", () => sthm(@transc.division_eq()))
  log.attempt("DIVISION_LBOUND", () => sthm(@transc.division_lbound()))
  log.attempt("DIVISION_LBOUND_LT", () => sthm(@transc.division_lbound_lt()))
  log.attempt("DIVISION_UBOUND", () => sthm(@transc.division_ubound()))
  log.attempt("DIVISION_UBOUND_LT", () => sthm(@transc.division_ubound_lt()))
  log.attempt("DIVISION_APPEND_LEMMA1", () => {
    sthm(@transc.division_append_lemma1())
  })
  log.attempt("DIVISION_APPEND_LEMMA2", () => {
    sthm(@transc.division_append_lemma2())
  })
  log.attempt("DIVISION_APPEND_EXPLICIT", () => {
    sthm(@transc.division_append_explicit())
  })
  log.attempt("DIVISION_APPEND_STRONG", () => {
    sthm(@transc.division_append_strong())
  })
  log.attempt("DIVISION_APPEND", () => sthm(@transc.division_append()))
  log.attempt("DIVISION_EXISTS", () => sthm(@transc.division_exists()))
  log.attempt("GAUGE_MIN", () => sthm(@transc.gauge_min()))
  log.attempt("FINE_MIN", () => sthm(@transc.fine_min()))
  log.attempt("DINT_UNIQ", () => sthm(@transc.dint_uniq()))
  log.attempt("INTEGRAL_NULL", () => sthm(@transc.integral_null()))
  log.attempt("STRADDLE_LEMMA", () => sthm(@transc.straddle_lemma()))
  log.attempt("FTC1", () => sthm(@transc.ftc1()))
  log.attempt("integrable", () => sthm(@transc.integrable()))
  log.attempt("integral", () => sthm(@transc.integral()))
  log.attempt("INTEGRABLE_DEFINT", () => sthm(@transc.integrable_defint()))
  log.attempt("DIVISION_BOUNDS", () => sthm(@transc.division_bounds()))
  log.attempt("TDIV_BOUNDS", () => sthm(@transc.tdiv_bounds()))
  log.attempt("TDIV_LE", () => sthm(@transc.tdiv_le()))
  log.attempt("DEFINT_WRONG", () => sthm(@transc.defint_wrong()))
  log.attempt("DEFINT_INTEGRAL", () => sthm(@transc.defint_integral()))
  log.attempt("DEFINT_CONST", () => sthm(@transc.defint_const()))
  log.attempt("DEFINT_0", () => sthm(@transc.defint_0()))
  log.attempt("DEFINT_NEG", () => sthm(@transc.defint_neg()))
  log.attempt("DEFINT_CMUL", () => sthm(@transc.defint_cmul()))
  log.attempt("DEFINT_ADD", () => sthm(@transc.defint_add()))
  log.attempt("DEFINT_SUB", () => sthm(@transc.defint_sub()))
  log.attempt("INTEGRAL_LE", () => sthm(@transc.integral_le()))
  log.attempt("DEFINT_LE", () => sthm(@transc.defint_le()))
  log.attempt("DEFINT_TRIANGLE", () => sthm(@transc.defint_triangle()))
  log.attempt("DEFINT_EQ", () => sthm(@transc.defint_eq()))
  log.attempt("INTEGRAL_EQ", () => sthm(@transc.integral_eq()))
  log.attempt("INTEGRATION_BY_PARTS", () => sthm(@transc.integration_by_parts()))
  log.attempt("DIVISION_LE_SUC", () => sthm(@transc.division_le_suc()))
  log.attempt("DIVISION_MONO_LE", () => sthm(@transc.division_mono_le()))
  log.attempt("DIVISION_MONO_LE_SUC", () => sthm(@transc.division_mono_le_suc()))
  log.attempt("DIVISION_INTERMEDIATE", () => {
    sthm(@transc.division_intermediate())
  })
  log.attempt("DIVISION_DSIZE_LE", () => sthm(@transc.division_dsize_le()))
  log.attempt("DIVISION_DSIZE_GE", () => sthm(@transc.division_dsize_ge()))
  log.attempt("DIVISION_DSIZE_EQ", () => sthm(@transc.division_dsize_eq()))
  log.attempt("DIVISION_DSIZE_EQ_ALT", () => {
    sthm(@transc.division_dsize_eq_alt())
  })
  log.attempt("DEFINT_COMBINE", () => sthm(@transc.defint_combine()))
  log.attempt("DEFINT_DELTA_LEFT", () => sthm(@transc.defint_delta_left()))
  log.attempt("DEFINT_DELTA_RIGHT", () => sthm(@transc.defint_delta_right()))
  log.attempt("DEFINT_DELTA", () => sthm(@transc.defint_delta()))
  log.attempt("DEFINT_POINT_SPIKE", () => sthm(@transc.defint_point_spike()))
  log.attempt("DEFINT_FINITE_SPIKE", () => sthm(@transc.defint_finite_spike()))
  log.attempt("GAUGE_MIN_FINITE", () => sthm(@transc.gauge_min_finite()))
  log.attempt("INTEGRABLE_CAUCHY", () => sthm(@transc.integrable_cauchy()))
  log.attempt("SUM_DIFFS", () => sthm(@transc.sum_diffs()))
  log.attempt("RSUM_BOUND", () => sthm(@transc.rsum_bound()))
  log.attempt("RSUM_DIFF_BOUND", () => sthm(@transc.rsum_diff_bound()))
  log.attempt("INTEGRABLE_LIMIT", () => sthm(@transc.integrable_limit()))
  log.attempt("INTEGRABLE_CONST", () => sthm(@transc.integrable_const()))
  log.attempt("INTEGRABLE_COMBINE", () => sthm(@transc.integrable_combine()))
  log.attempt("INTEGRABLE_POINT_SPIKE", () => {
    sthm(@transc.integrable_point_spike())
  })
  log.attempt("INTEGRABLE_CONTINUOUS", () => {
    sthm(@transc.integrable_continuous())
  })
  log.attempt("INTEGRABLE_SPLIT_SIDES", () => {
    sthm(@transc.integrable_split_sides())
  })
  log.attempt("INTEGRABLE_SUBINTERVAL_LEFT", () => {
    sthm(@transc.integrable_subinterval_left())
  })
  log.attempt("INTEGRABLE_SUBINTERVAL_RIGHT", () => {
    sthm(@transc.integrable_subinterval_right())
  })
  log.attempt("INTEGRABLE_SUBINTERVAL", () => {
    sthm(@transc.integrable_subinterval())
  })
  log.attempt("INTEGRAL_CONST", () => sthm(@transc.integral_const()))
  log.attempt("INTEGRAL_CMUL", () => sthm(@transc.integral_cmul()))
  log.attempt("INTEGRAL_ADD", () => sthm(@transc.integral_add()))
  log.attempt("INTEGRAL_SUB", () => sthm(@transc.integral_sub()))
  log.attempt("INTEGRAL_BY_PARTS", () => sthm(@transc.integral_by_parts()))
  log.attempt("MCLAURIN", () => sthm(@transc.mclaurin()))
  log.attempt("MCLAURIN_NEG", () => sthm(@transc.mclaurin_neg()))
  log.attempt("MCLAURIN_BI_LE", () => sthm(@transc.mclaurin_bi_le()))
  log.attempt("MCLAURIN_ALL_LT", () => sthm(@transc.mclaurin_all_lt()))
  log.attempt("MCLAURIN_ZERO", () => sthm(@transc.mclaurin_zero()))
  log.attempt("MCLAURIN_ALL_LE", () => sthm(@transc.mclaurin_all_le()))
  log.attempt("MCLAURIN_EXP_LEMMA", () => sthm(@transc.mclaurin_exp_lemma()))
  log.attempt("MCLAURIN_EXP_LT", () => sthm(@transc.mclaurin_exp_lt()))
  log.attempt("MCLAURIN_EXP_LE", () => sthm(@transc.mclaurin_exp_le()))
  log.attempt("MCLAURIN_LN_POS", () => sthm(@transc.mclaurin_ln_pos()))
  log.attempt("MCLAURIN_LN_NEG", () => sthm(@transc.mclaurin_ln_neg()))
  log.attempt("MCLAURIN_SIN", () => sthm(@transc.mclaurin_sin()))
  log.attempt("MCLAURIN_COS", () => sthm(@transc.mclaurin_cos()))
  log.attempt("REAL_ATN_POWSER_SUMMABLE", () => {
    sthm(@transc.real_atn_powser_summable())
  })
  log.attempt("REAL_ATN_POWSER_DIFFS_SUMMABLE", () => {
    sthm(@transc.real_atn_powser_diffs_summable())
  })
  log.attempt("REAL_ATN_POWSER_DIFFS_SUM", () => {
    sthm(@transc.real_atn_powser_diffs_sum())
  })
  log.attempt("REAL_ATN_POWSER_DIFFS_DIFFS_SUMMABLE", () => {
    sthm(@transc.real_atn_powser_diffs_diffs_summable())
  })
  log.attempt("REAL_ATN_POWSER_DIFFL", () => {
    sthm(@transc.real_atn_powser_diffl())
  })
  log.attempt("REAL_ATN_POWSER", () => sthm(@transc.real_atn_powser()))
  log.attempt("MCLAURIN_ATN", () => sthm(@transc.mclaurin_atn()))
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
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..7..solved at 13
      #|0..0..1..4..7..19..36..65..118..188..solved at 214
      #|0..0..1..5..14..27..solved at 33
      #|0..0..1..5..solved at 10
      #|0..0..1..4..13..26..solved at 32
      #|0..0..1..4..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 13
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..4..12..29..88..202..405..882..solved at 1334
      #|0..0..1..solved at 5
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..9..16..29..51..76..118..203..313..478..733..1034..1488..solved at 1787
      #|0..0..0..0..0..solved at 5
      #|0..0..0..1..4..7..16..29..49..76..114..157..248..343..466..solved at 507
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 14
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..5..11..20..63..solved at 114
      #|0..0..1..10..19..32..solved at 71
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..3..7..12..17..24..31..38..solved at 67
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 765
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 741
      #|0..0..2..7..solved at 11
      #|0..0..1..5..12..25..55..solved at 99
      #|0..0..1..5..11..24..58..solved at 95
      #|0..0..1..3..6..13..28..57..102..180..290..473..750..1141..1743..2638..solved at 3072
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..0..2..4..6..11..18..29..45..67..solved at 85
      #|0..0..solved at 2
      #|0..0..2..6..11..26..53..solved at 60
      #|0..0..2..6..12..27..72..161..326..686..solved at 784
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..3..6..17..36..solved at 43
      #|0..0..3..7..solved at 11
      #|0..0..3..7..solved at 14
      #|0..0..2..4..solved at 8
      #|0..0..2..4..9..21..solved at 28
      #|0..0..1..2..3..4..10..19..31..54..93..151..328..solved at 441
      #|0..0..2..4..9..19..43..85..155..277..499..864..1698..solved at 1810
      #|0..0..3..11..48..120..262..615..1117..2593..4807..solved at 5684
      #|0..0..4..solved at 7
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..6..17..51..solved at 56
      #|0..0..5..14..solved at 22
      #|0..0..5..12..solved at 18
      #|0..0..5..12..32..62..solved at 82
      #|0..0..solved at 3
      #|0..0..6..13..solved at 17
      #|0..0..4..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..5..solved at 8
      #|0..0..4..10..32..61..115..185..291..410..solved at 547
      #|0..0..4..10..30..55..105..170..256..353..solved at 389
      #|0..0..4..solved at 7
      #|0..0..4..9..25..46..90..157..255..413..668..1013..1557..solved at 1574
      #|0..0..5..solved at 8
      #|0..0..1..3..7..15..27..60..107..183..352..618..1081..1877..3199..5523..9477..16174..27871..solved at 46833
      #|0..0..2..6..15..30..74..141..267..463..solved at 505
      #|0..0..2..7..solved at 11
      #|0..0..2..5..10..21..40..70..117..188..solved at 199
      #|0..0..2..5..10..19..35..58..solved at 67
      #|0..0..2..7..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 11
      #|0..0..1..2..9..20..39..70..111..161..250..366..solved at 376
      #|0..0..solved at 2
      #|0..0..4..8..16..32..solved at 43
      #|0..0..0..1..2..3..6..12..19..29..43..57..89..145..solved at 175
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..11..15..solved at 25
      #|0..0..1..3..7..11..15..solved at 24
      #|0..0..solved at 2
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..7..14..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..8..21..42..81..139..213..340..520..762..1126..1617..solved at 1830
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..4..5..8..12..16..21..26..31..solved at 42
      #|0..0..1..2..3..4..5..7..9..11..16..21..26..solved at 37
      #|0..0..1..4..solved at 10
      #|0..0..2..8..15..solved at 22
      #|0..0..2..4..11..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..34..49..69..94..123..158..212..272..347..439..546..669..833..1013..1230..1496..1799..2134..solved at 2276
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..3..10..19..28..42..59..solved at 70
      #|0..0..1..solved at 6
      #|0..0..2..8..24..58..169..462..solved at 794
      #|0..0..2..8..24..58..169..460..solved at 794
      #|0..0..1..2..3..7..14..25..46..71..108..155..212..283..solved at 310
      #|0..0..solved at 3
      #|0..0..1..5..22..114..solved at 609
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Library/transc quotations (2073):
      #|  !((n : Num) < (p : Num))
      #|  (p : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, sum((0, SUC(n)), (p : Num) => pow(x, p) * pow(y, SUC(n) - p)) == y * sum((0, SUC(n)), (p : Num) => pow(x, p) * pow(y, n - p))
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == d + a + (c + b)
      #|  (n : Num)
      #|  SUC((n : Num))
      #|  (a : Real) * ((b : Real) * (c : Real)) == b * (a * c)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, pow(x, SUC(n)) - pow(y, SUC(n)) == (x - y) * sum((0, SUC(n)), (p : Num) => pow(x, p) * pow(y, n - p))
      #|  (p : Num)
      #|  (x : Real) == (y : Real)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, sum((0, SUC(n)), (p : Num) => pow(x, p) * pow(y, n - p)) == sum((0, SUC(n)), (p : Num) => pow(x, n - p) * pow(y, p))
      #|  abs((z : Real))
      #|  (n : Num)
      #|  abs((z : Real)) < real_of_num(0)
      #|  !(abs((x : Real)) == real_of_num(0))
      #|  \226\136\128 n : Num, abs(pow((z : Real), n)) / abs(pow((x : Real), n)) == pow(abs(z) / abs(x), n)
      #|  (K : Real) * inv(real_of_num(1) - abs((z : Real)) / abs((x : Real)))
      #|  pow((z : Real), (n : Num))
      #|  (a : Real) * ((b : Real) * (c : Real)) == a * c * b
      #|  abs((z : Real))
      #|  (n : Num)
      #|  0
      #|  (n : Num) => (K : Real) * abs(pow((z : Real), n)) / abs(pow((x : Real), n))
      #|  (K : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 x : Real, \226\136\128 z : Real, summable((n : Num) => f(n) * pow(x, n)) && abs(z) < abs(x) \226\134\146 summable((n : Num) => abs(f(n)) * pow(z, n))
      #|  (z : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 x : Real, \226\136\128 z : Real, summable((n : Num) => f(n) * pow(x, n)) && abs(z) < abs(x) \226\134\146 summable((n : Num) => f(n) * pow(z, n))
      #|  (diffs : ((Num) -> Real, Num) -> Real)((c : (Num) -> Real)) == ((n : Num) => real_of_num(SUC(n)) * c(SUC(n)))
      #|  \226\136\128 c : (Num) -> Real, diffs((n : Num) => -c(n)) == ((n : Num) => -diffs(c, n))
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, \226\136\128 x : Real, sum((0, n), (n : Num) => diffs(c, n) * pow(x, n)) == sum((0, n), (n : Num) => real_of_num(n) * (c(n) * pow(x, n - 1))) + real_of_num(n) * (c(n) * pow(x, n - 1))
      #|  \226\136\128 n : Num, \226\136\128 c : (Num) -> Real, \226\136\128 x : Real, sum((0, n), (n : Num) => real_of_num(n) * (c(n) * pow(x, n - 1))) == sum((0, n), (n : Num) => diffs(c, n) * pow(x, n)) - real_of_num(n) * (c(n) * pow(x, n - 1))
      #|  summable((n : Num) => diffs((c : (Num) -> Real), n) * pow((x : Real), n))
      #|  tends_num_real((n : Num) => real_of_num(n) * ((c : (Num) -> Real)(n) * pow((x : Real), n - 1)), real_of_num(0))
      #|  \226\136\128 c : (Num) -> Real, \226\136\128 x : Real, summable((n : Num) => diffs(c, n) * pow(x, n)) \226\134\146 sums((n : Num) => real_of_num(n) * (c(n) * pow(x, n - 1)), suminf((n : Num) => diffs(c, n) * pow(x, n)))
      #|  (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 z : Real, \226\136\128 h : Real, sum((0, m), (p : Num) => pow(z + h, m - p) * pow(z, p) - pow(z, m)) == sum((0, m), (p : Num) => pow(z, p) * (pow(z + h, m - p) - pow(z, m - p)))
      #|  (q : Num)
      #|  (d : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  \226\136\128 z : Real, \226\136\128 h : Real, !(h == real_of_num(0)) \226\134\146 (pow(z + h, (n : Num)) - pow(z, n)) / h - real_of_num(n) * pow(z, n - 1) == h * sum((0, n - 1), (p : Num) => pow(z, p) * sum((0, n - 1 - p), (q : Num) => pow(z + h, q) * pow(z, n - 2 - p - q)))
      #|  (e : Num)
      #|  (q : Num) < SUC((d : Num))
      #|  (q : Num)
      #|  SUC((d : Num))
      #|  (d : Num)
      #|  abs((z : Real))
      #|  real_of_num(0) <= (K : Real)
      #|  real_of_num(SUC((d : Num))) * pow((K : Real), d)
      #|  (a : Real) * (b : Real) * (c : Real) == b * (c * a)
      #|  (d : Num)
      #|  (p : Num) < (r : Num)
      #|  2
      #|  (n : Num)
      #|  (r : Num)
      #|  (p : Num)
      #|  \226\136\128 z : Real, \226\136\128 h : Real, \226\136\128 n : Num, \226\136\128 K : Real, !(h == real_of_num(0)) && abs(z) <= K && abs(z + h) <= K \226\134\146 abs((pow(z + h, n) - pow(z, n)) / h - real_of_num(n) * pow(z, n - 1)) <= real_of_num(n) * (real_of_num(n - 1) * (pow(K, n - 2) * abs(h)))
      #|  (e : Real) / (K : Real) / real_of_num(2)
      #|  !((K : Real) == real_of_num(0))
      #|  real_of_num(0) < (K : Real)
      #|  (a : Real) * (b : Real) * (c : Real) == c * a * b
      #|  real_of_num(0) < (K : Real)
      #|  real_of_num(0) < (K : Real)
      #|  (K : Real) * (d : Real)
      #|  (d : Real)
      #|  (K : Real) * abs((h : Real))
      #|  (h : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (k : Real)
      #|  (e : Real) / (K : Real) / real_of_num(2)
      #|  2
      #|  real_of_num(0) < (e : Real) / (K : Real) / real_of_num(2)
      #|  (f : (Real) -> Real)((x : Real))
      #|  real_of_num(0) < (k : Real)
      #|  (k : Real)
      #|  (e : Real)
      #|  abs((f : (Real) -> Real)((k : Real) / real_of_num(2)))
      #|  real_of_num(0) < (k : Real) / real_of_num(2)
      #|  real_of_num(0) < (k : Real)
      #|  (k : Real) / real_of_num(2)
      #|  real_of_num(0) <= (K : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 K : Real, \226\136\128 k : Real, real_of_num(0) < k && (\226\136\128 h : Real, real_of_num(0) < abs(h) && abs(h) < k \226\134\146 abs(f(h)) <= K * abs(h)) \226\134\146 tends_real_real(f, real_of_num(0), real_of_num(0))
      #|  (k : Real)
      #|  suminf((f : (Num) -> Real))
      #|  suminf((n : Num) => abs((g : (Real, Num) -> Real)((h : Real), n)))
      #|  (n : Num)
      #|  0
      #|  (n : Num) => (f : (Num) -> Real)(n) * abs((h : Real))
      #|  summable((n : Num) => abs((g : (Real, Num) -> Real)((h : Real), n)))
      #|  suminf((f : (Num) -> Real)) * abs((h : Real))
      #|  summable((n : Num) => (f : (Num) -> Real)(n) * abs((h : Real)))
      #|  \226\136\128 h : Real, real_of_num(0) < abs(h) && abs(h) < (k : Real) \226\134\146 abs(suminf((g : (Real, Num) -> Real)(h))) <= suminf((f : (Num) -> Real)) * abs(h)
      #|  (h : Real)
      #|  (h : Real)
      #|  sums((f : (Num) -> Real), suminf(f))
      #|  abs((h : Real))
      #|  (h : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Real, Num) -> Real, \226\136\128 k : Real, real_of_num(0) < k && summable(f) && (\226\136\128 h : Real, real_of_num(0) < abs(h) && abs(h) < k \226\134\146 (\226\136\128 n : Num, abs(g(h, n)) <= f(n) * abs(h))) \226\134\146 tends_real_real((h : Real) => suminf(g(h)), real_of_num(0), real_of_num(0))
      #|  abs((x : Real)) + abs((h : Real))
      #|  (n : Num)
      #|  (h : Real)
      #|  abs((x : Real))
      #|  (R : Real) * inv(R) == real_of_num(1)
      #|  (m : Num)
      #|  (n : Num)
      #|  2
      #|  (n : Num)
      #|  (m : Num)
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == b * (c * (a * d))
      #|  (n : Num)
      #|  (R : Real)
      #|  abs((x : Real))
      #|  inv((R : Real)) * R == real_of_num(1)
      #|  (a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * (f : Real))))) == b * (a * (c * (e * (d * f))))
      #|  (n : Num)
      #|  (m : Num)
      #|  ((n : Num) => real_of_num(n) * (real_of_num(SUC(n)) * (abs((c : (Num) -> Real)(SUC(n))) * pow((R : Real), n - 1)))) == ((n : Num) => diffs((m : Num) => real_of_num(m - 1) * (abs(c(m)) / R), n) * pow(R, n))
      #|  \226\136\128 n : Num, diffs(diffs((n : Num) => abs((c : (Num) -> Real)(n))), n) * pow((R : Real), n) == real_of_num(SUC(n)) * (real_of_num(SUC(SUC(n))) * (abs(c(SUC(SUC(n)))) * pow(R, n)))
      #|  abs((x : Real))
      #|  abs((R : Real)) == R
      #|  (K : Real)
      #|  summable((n : Num) => abs(diffs(diffs((c : (Num) -> Real)), n)) * pow((R : Real), n))
      #|  (R : Real) - abs((x : Real))
      #|  (h : Real) => (n : Num) => (c : (Num) -> Real)(n) * ((pow((x : Real) + h, n) - pow(x, n)) / h - real_of_num(n) * pow(x, n - 1))
      #|  (n : Num) => abs((c : (Num) -> Real)(n)) * (real_of_num(n) * (real_of_num(n - 1) * pow((R : Real), n - 2)))
      #|  (R : Real)
      #|  abs((K : Real))
      #|  abs((x : Real))
      #|  (h : Real)
      #|  (K : Real)
      #|  sums((n : Num) => (c : (Num) -> Real)(n) * pow((x : Real), n), suminf((n : Num) => c(n) * pow(x, n))) && sums((n : Num) => c(n) * pow(x + (h : Real), n), suminf((n : Num) => c(n) * pow(x + h, n)))
      #|  (K : Real)
      #|  summable((n : Num) => diffs((c : (Num) -> Real), n) * pow((x : Real), n))
      #|  (h : Real)
      #|  abs((K : Real)) - abs((x : Real))
      #|  (e : Real)
      #|  (h : Real) => suminf((n : Num) => (c : (Num) -> Real)(n) * ((pow((x : Real) + h, n) - pow(x, n)) / h - real_of_num(n) * pow(x, n - 1)))
      #|  (h : Real)
      #|  (K : Real)
      #|  sums((n : Num) => (c : (Num) -> Real)(n) * pow((x : Real), n), suminf((n : Num) => c(n) * pow(x, n))) && sums((n : Num) => c(n) * pow(x + (h : Real), n), suminf((n : Num) => c(n) * pow(x + h, n)))
      #|  (h : Real)
      #|  abs((K : Real)) - abs((x : Real))
      #|  (e : Real)
      #|  (h : Real) => suminf((n : Num) => ((c : (Num) -> Real)(n) * pow((x : Real) + h, n) - c(n) * pow(x, n)) / h)
      #|  \226\136\128 c : (Num) -> Real, \226\136\128 K : Real, summable((n : Num) => c(n) * pow(K, n)) && summable((n : Num) => diffs(c, n) * pow(K, n)) && summable((n : Num) => diffs(diffs(c), n) * pow(K, n)) && abs((x : Real)) < abs(K) \226\134\146 diffl((x : Real) => suminf((n : Num) => c(n) * pow(x, n)), suminf((n : Num) => diffs(c, n) * pow(x, n)), x)
      #|  real_of_num(0)
      #|  real_of_num(0)
      #|  (d : Num)
      #|  (m : Num) <= (n : Num)
      #|  (m : Num) <= (n : Num)
      #|  real_of_num(0) < real_of_num((m : Num))
      #|  (a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * (e : Real)))) == a * d * c * (b * e)
      #|  (m : Num) == SUC((N : Num))
      #|  real_of_num((N : Num))
      #|  SUC((N : Num))
      #|  real_of_num(SUC(SUC((N : Num)))) * (abs((x : Real)) / real_of_num(SUC(N)))
      #|  (N : Num)
      #|  abs((x : Real)) / (real_of_num(1) - abs(x))
      #|  \226\136\128 n : Num, (abs((x : Real)) / (real_of_num(1) - abs(x)) < real_of_num(n)) == (real_of_num(SUC(n)) * abs(x) < real_of_num(n))
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 tends_num_real((n : Num) => real_of_num(n) * pow(x, n), real_of_num(0))
      #|  (a : Real) * (b : Real) * (c : Real) == b * (a * c)
      #|  ((b : Bool) \226\134\146 (c : Bool)) \226\134\146 ((a : Bool) \226\134\146 b) \226\134\146 a \226\134\146 c
      #|  real_of_num(1)
      #|  (x : Real) / (y : Real)
      #|  !((x : Real) == real_of_num(0))
      #|  abs((x : Real)) < abs((y : Real))
      #|  real_of_num(0) < abs((y : Real))
      #|  abs((y : Real)) < (K : Real)
      #|  abs(abs((y : Real))) < abs((abs(y) + (K : Real)) / real_of_num(2)) && abs((abs(y) + K) / real_of_num(2)) < K
      #|  (abs((y : Real)) + (K : Real)) / real_of_num(2)
      #|  (n : Num) => abs((c : (Num) -> Real)(n) * pow((y : Real), n))
      #|  (a : Real) * ((b : Real) * (c : Real) * ((d : Real) * (e : Real))) == a * d * (b * c * e)
      #|  inv((x : Real))
      #|  1
      #|  summable((n : Num) => real_of_num(n) * (c : (Num) -> Real)(n) * pow((x : Real), n))
      #|  abs((x : Real)) < (K : Real)
      #|  (abs((x : Real)) + (K : Real)) / real_of_num(2)
      #|  \226\136\131 y : Real, abs((x : Real)) < abs(y) && abs(y) < (K : Real)
      #|  (1 <= (m : Num)) == !(m == 0)
      #|  sum((0, 1), (n : Num) => diffs((c : (Num) -> Real), n) * pow((x : Real), n))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 K : Real, (\226\136\128 x : Real, abs(x) < K \226\134\146 summable((n : Num) => (c : (Num) -> Real)(n) * pow(x, n))) \226\134\146 (\226\136\128 x : Real, abs(x) < K \226\134\146 summable((n : Num) => diffs(c, n) * pow(x, n)))
      #|  (K : Real)
      #|  \226\136\128 x : Real, abs(x) < abs((K : Real)) \226\134\146 summable((n : Num) => diffs(diffs((c : (Num) -> Real)), n) * pow(x, n))
      #|  \226\136\128 x : Real, abs(x) < abs((K : Real)) \226\134\146 summable((n : Num) => diffs((c : (Num) -> Real), n) * pow(x, n))
      #|  (K : Real)
      #|  abs((x : Real)) < abs((K : Real))
      #|  abs((x : Real)) < abs((abs(x) + abs((K : Real))) / real_of_num(2)) && abs((abs(x) + abs(K)) / real_of_num(2)) < abs(K)
      #|  (abs((x : Real)) + abs((K : Real))) / real_of_num(2)
      #|  \226\136\128 c : (Num) -> Real, \226\136\128 K : Real, \226\136\128 x : Real, summable((n : Num) => c(n) * pow(K, n)) && abs(x) < abs(K) \226\134\146 diffl((x : Real) => suminf((n : Num) => c(n) * pow(x, n)), suminf((n : Num) => diffs(c, n) * pow(x, n)), x)
      #|  (a : (Num) -> Real)(0) == sum((0, 1), (n : Num) => a(n) * pow(real_of_num(0), n))
      #|  \226\136\128 a : (Num) -> Real, sums((n : Num) => a(n) * pow(real_of_num(0), n), a(0))
      #|  (a : Real) == (b : Real) && real_of_num(0) < (e : Real) \226\134\146 abs(a - b) < e
      #|  (s : Real)
      #|  suminf((n : Num) => (a : (Num) -> Real)(n) * pow(real_of_num(0), n)) == a(0)
      #|  real_of_num(0) < (s : Real)
      #|  (f : (Real) -> Real)((s : Real) / real_of_num(2))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) < abs(x)
      #|  real_of_num(0)
      #|  (s : Real) / real_of_num(2)
      #|  (a : (Num) -> Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 s : Real, real_of_num(0) < s && (\226\136\128 x : Real, abs(x) < s \226\134\146 sums((n : Num) => a(n) * pow(x, n), f(x))) \226\134\146 tends_real_real(f, a(0), real_of_num(0))
      #|  1
      #|  (e : Real)
      #|  (x : Real) == real_of_num(0)
      #|  (x : Real)
      #|  (s : Real)
      #|  tends_real_real((x : Real) => if x == real_of_num(0) { (a : (Num) -> Real)(0) } else { (f : (Real) -> Real)(x) }, a(0), real_of_num(0))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 s : Real, real_of_num(0) < s && (\226\136\128 x : Real, real_of_num(0) < abs(x) && abs(x) < s \226\134\146 sums((n : Num) => a(n) * pow(x, n), f(x))) \226\134\146 tends_real_real(f, a(0), real_of_num(0))
      #|  abs((x : Real)) < (s : Real)
      #|  suminf((n : Num) => (b : (Num) -> Real)(n) * pow((x : Real), n))
      #|  abs((x : Real)) < (s : Real)
      #|  suminf((n : Num) => (a : (Num) -> Real)(n) * pow((x : Real), n))
      #|  (h : (Real) -> Real)((x : Real))
      #|  (g : (Real) -> Real)((x : Real))
      #|  (f : (Real) -> Real)((x : Real))
      #|  \226\136\128 f : Real, \226\136\128 g : Real, \226\136\128 h : Real, abs(g - (a : Real)) < (e2 : Real) && abs(h - (b : Real)) < e2 && g == f && h == f \226\134\146 abs(a - b) < e2 + e2
      #|  (e : Real) / real_of_num(2) + e / real_of_num(2)
      #|  abs((a : (Num) -> Real)(0) - (b : (Num) -> Real)(0)) < (e : Real)
      #|  (x : Real)
      #|  (d : Real)
      #|  \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 x : Real, (P : (Real) -> Bool)(x) && real_of_num(0) < abs(x) && abs(x) < e)
      #|  (d : Real)
      #|  (s : Real)
      #|  (d0 : Real)
      #|  (d0 : Real)
      #|  (d2 : Real)
      #|  (d1 : Real)
      #|  (d2 : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (s : Real)
      #|  (b : (Num) -> Real)
      #|  (h : (Real) -> Real)
      #|  (d1 : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (s : Real)
      #|  (a : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (e : Real) == abs((a : (Num) -> Real)(0) - (b : (Num) -> Real)(0))
      #|  !(real_of_num(0) < abs((x : Real) - (y : Real))) \226\134\146 x == y
      #|  (h : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  (s : Real)
      #|  (f : (Real) -> Real)((k : Real))
      #|  (k : Real)
      #|  abs((k : Real))
      #|  (k : Real)
      #|  \226\136\131 s : Real, real_of_num(0) < s && (\226\136\128 x : Real, abs(x) < s \226\134\146 summable((n : Num) => (a : (Num) -> Real)(n) * pow(x, n)) && summable((n : Num) => (b : (Num) -> Real)(n) * pow(x, n)))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 b : (Num) -> Real, \226\136\128 P : (Real) -> Bool, (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 x : Real, P(x) && real_of_num(0) < abs(x) && abs(x) < e)) && (\226\136\128 x : Real, real_of_num(0) < abs(x) && P(x) \226\134\146 sums((n : Num) => a(n) * pow(x, n), f(x)) && sums((n : Num) => b(n) * pow(x, n), f(x))) \226\134\146 a(0) == b(0)
      #|  (f : (Real) -> Real)((x : Real))
      #|  (n : Num) => (b : (Num) -> Real)(n) * pow((x : Real), n)
      #|  (f : (Real) -> Real)((x : Real)) == suminf((n : Num) => (b : (Num) -> Real)(n) * pow(x, n))
      #|  (n : Num) => (a : (Num) -> Real)(n) * pow((x : Real), n)
      #|  (f : (Real) -> Real)((x : Real)) == suminf((n : Num) => (a : (Num) -> Real)(n) * pow(x, n))
      #|  sum((0, (n : Num)), (n : Num) => (b : (Num) -> Real)(n) * pow((x : Real), n)) == sum((0, n), (n : Num) => (a : (Num) -> Real)(n) * pow(x, n))
      #|  ((x : Real) == real_of_num(0)) == !(real_of_num(0) < abs(x))
      #|  (x' : Real) * ((a : Real) * ((b : Real) * (x : Real))) == x * x' * (a * b)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 m : Num, a(m + (n : Num)) * pow((x : Real), m) == inv(pow(x, n)) * (a(m + n) * pow(x, m + n))
      #|  (x : Real)
      #|  (P : (Real) -> Bool)
      #|  (x : Real) => inv(pow(x, (n : Num))) * ((f : (Real) -> Real)(x) - sum((0, n), (n : Num) => (b : (Num) -> Real)(n) * pow(x, n)))
      #|  ((m : Num) => (a : (Num) -> Real)(m + (n : Num)))(0) == ((m : Num) => (b : (Num) -> Real)(m + n))(0)
      #|  !(!(a : Bool) && (b : Bool)) == (b \226\134\146 a)
      #|  (n : Num)
      #|  (p : Bool) == !!p
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 b : (Num) -> Real, \226\136\128 P : (Real) -> Bool, (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 x : Real, P(x) && real_of_num(0) < abs(x) && abs(x) < e)) && (\226\136\128 x : Real, P(x) \226\134\146 sums((n : Num) => a(n) * pow(x, n), f(x)) && sums((n : Num) => b(n) * pow(x, n), f(x))) \226\134\146 a == b
      #|  \226\136\128 n : Num, DIV(2 * n, 2) == n
      #|  1 + 1 == 2 * 1
      #|  (m : Num)
      #|  \226\136\128 n : Num, !EVEN(n) \226\134\146 DIV(SUC(n), 2) == SUC(DIV(n - 1, 2))
      #|  \226\136\128 n : Num, \226\136\128 x : Real, pow(x, n) == real_of_num(0) \226\134\146 x == real_of_num(0)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, (pow(x, SUC(n)) == real_of_num(0)) == (x == real_of_num(0))
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x < y \226\134\146 pow(x, SUC(n)) < pow(y, SUC(n))
      #|  pow((x : Real), SUC((n : Num))) == pow((y : Real), SUC(n))
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y && pow(x, SUC(n)) == pow(y, SUC(n)) \226\134\146 x == y
      #|  (exp : (Real) -> Real)((x : Real)) == suminf((n : Num) => ((n : Num) => inv(real_of_num(FACT(n))))(n) * pow(x, n))
      #|  (sin : (Real) -> Real)((x : Real)) == suminf((n : Num) => ((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(FACT(n)) })(n) * pow(x, n))
      #|  (cos : (Real) -> Real)((x : Real)) == suminf((n : Num) => ((n : Num) => if EVEN(n) { pow(-real_of_num(1), DIV(n, 2)) / real_of_num(FACT(n)) } else { real_of_num(0) })(n) * pow(x, n))
      #|  (n : Num)
      #|  real_of_num((N : Num)) * (c : Real)
      #|  (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  abs((x : Real))
      #|  (c : Real)
      #|  (c : Real)
      #|  (c : Real)
      #|  real_of_num(1)
      #|  \226\136\128 x : Real, sums((n : Num) => ((n : Num) => inv(real_of_num(FACT(n))))(n) * pow(x, n), exp(x))
      #|  (n : Num)
      #|  0
      #|  (n : Num) => ((n : Num) => inv(real_of_num(FACT(n))))(n) * pow(abs((x : Real)), n)
      #|  \226\136\128 x : Real, sums((n : Num) => ((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(FACT(n)) })(n) * pow(x, n), sin(x))
      #|  (n : Num)
      #|  0
      #|  (n : Num) => ((n : Num) => inv(real_of_num(FACT(n))))(n) * pow(abs((x : Real)), n)
      #|  \226\136\128 x : Real, sums((n : Num) => ((n : Num) => if EVEN(n) { pow(-real_of_num(1), DIV(n, 2)) / real_of_num(FACT(n)) } else { real_of_num(0) })(n) * pow(x, n), cos(x))
      #|  !(real_of_num(SUC((n : Num))) == real_of_num(0)) && !(real_of_num(FACT(n)) == real_of_num(0))
      #|  (n : Num)
      #|  diffs((n : Num) => inv(real_of_num(FACT(n)))) == ((n : Num) => inv(real_of_num(FACT(n))))
      #|  !(real_of_num(SUC((n : Num))) == real_of_num(0)) && !(real_of_num(FACT(n)) == real_of_num(0))
      #|  (n : Num)
      #|  diffs((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(FACT(n)) }) == ((n : Num) => if EVEN(n) { pow(-real_of_num(1), DIV(n, 2)) / real_of_num(FACT(n)) } else { real_of_num(0) })
      #|  !(real_of_num(SUC((n : Num))) == real_of_num(0)) && !(real_of_num(FACT(n)) == real_of_num(0))
      #|  (n : Num)
      #|  diffs((n : Num) => if EVEN(n) { pow(-real_of_num(1), DIV(n, 2)) / real_of_num(FACT(n)) } else { real_of_num(0) }) == ((n : Num) => -((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(FACT(n)) })(n))
      #|  (x : Real)
      #|  \226\136\128 x : Real, -sin(x) == suminf((n : Num) => -(((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(FACT(n)) })(n) * pow(x, n)))
      #|  1
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  \226\136\128 x : Real, diffl(exp, exp(x), x)
      #|  1
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  \226\136\128 x : Real, diffl(sin, cos(x), x)
      #|  1
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  abs((x : Real)) + real_of_num(1)
      #|  (n : Num)
      #|  \226\136\128 x : Real, diffl(cos, -sin(x), x)
      #|  (x : Real)
      #|  (k : Real)
      #|  diffl
      #|  (x : Real) => pow(x, (n : Num))
      #|  (diffl((f : (Real) -> Real), (l : Real), (x : Real)) && !(f(x) == real_of_num(0)) \226\134\146 diffl((x : Real) => inv(f(x)), -(l / pow(f(x), 2)), x)) && (diffl(f, l, x) && diffl((g : (Real) -> Real), (m : Real), x) && !(g(x) == real_of_num(0)) \226\134\146 diffl((x : Real) => f(x) / g(x), (l * g(x) - m * f(x)) / pow(g(x), 2), x)) && (diffl(f, l, x) && diffl(g, m, x) \226\134\146 diffl((x : Real) => f(x) + g(x), l + m, x)) && (diffl(f, l, x) && diffl(g, m, x) \226\134\146 diffl((x : Real) => f(x) * g(x), l * g(x) + m * f(x), x)) && (diffl(f, l, x) && diffl(g, m, x) \226\134\146 diffl((x : Real) => f(x) - g(x), l - m, x)) && (diffl(f, l, x) \226\134\146 diffl((x : Real) => -f(x), -l, x)) && (diffl(g, m, x) \226\134\146 diffl((x : Real) => pow(g(x), (n : Num)), real_of_num(n) * pow(g(x), n - 1) * m, x)) && (diffl(g, m, x) \226\134\146 diffl((x : Real) => exp(g(x)), exp(g(x)) * m, x)) && (diffl(g, m, x) \226\134\146 diffl((x : Real) => sin(g(x)), cos(g(x)) * m, x)) && (diffl(g, m, x) \226\134\146 diffl((x : Real) => cos(g(x)), -sin(g(x)) * m, x))
      #|  diffl((f : (Real) -> Real), (l : Real), (x : Real)) \226\134\146 differentiable(f, x)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 x : Real, differentiable(f, x) \226\134\146 contl(f, x)
      #|  1
      #|  (n : Num)
      #|  1
      #|  1
      #|  1
      #|  exp(real_of_num(0)) == real_of_num(1)
      #|  1
      #|  2
      #|  (n : Num) => ((n : Num) => inv(real_of_num(FACT(n))))(n) * pow((x : Real), n)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 real_of_num(1) + x <= exp(x)
      #|  real_of_num(1) + (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_of_num(1) < exp(x)
      #|  (x : Real)
      #|  (x : Real)
      #|  exp((y : Real)) == ((x : Real) => exp(x + y) * exp(-x))(real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, exp(x + y) * exp(-x) == exp(y)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 x : Real, exp(x) * exp(-x) == real_of_num(1)
      #|  \226\136\128 x : Real, exp(-x) * exp(x) == real_of_num(1)
      #|  \226\136\128 x : Real, exp(-x) == inv(exp(x))
      #|  real_mul
      #|  exp((x : Real))
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, exp(x + y) == exp(x) * exp(y)
      #|  \226\136\128 x : Real, real_of_num(0) <= exp(x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, !(exp(x) == real_of_num(0))
      #|  \226\136\128 x : Real, real_of_num(0) < exp(x)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, exp(real_of_num(n) * x) == pow(exp(x), n)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, exp(x - y) == exp(x) / exp(y)
      #|  (real_of_num(1) < exp((y : Real)) / exp((x : Real))) == (real_of_num(1) * exp(x) < exp(y) / exp(x) * exp(x))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 exp(x) < exp(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (exp(x) < exp(y)) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (exp(x) <= exp(y)) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (exp(x) == exp(y)) == (x == y)
      #|  exp((x : Real))
      #|  (x : Real)
      #|  \226\136\128 y : Real, real_of_num(1) <= y \226\134\146 (\226\136\131 x : Real, real_of_num(0) <= x && x <= y - real_of_num(1) && exp(x) == y)
      #|  -(x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  real_of_num(1)
      #|  \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (\226\136\131 x : Real, exp(x) == y)
      #|  inv(real_of_num(2))
      #|  (real_of_num(1) <= real_of_num(1) + real_of_num(2) * (x : Real) - (x + x * (real_of_num(2) * x))) == (x * (real_of_num(2) * x) <= x * real_of_num(1))
      #|  ((a : Real) - (x : Real) < (b : Real) - x) == (a < b)
      #|  (real_of_num(0) <= (x : Real) - (y : Real)) == (y <= x)
      #|  inv(real_of_num(2)) - (x : Real)
      #|  (real_of_num(1) - (x : Real) == real_of_num(0)) == (x == real_of_num(1))
      #|  (real_of_num(1) - (x : Real)) * inv(real_of_num(1) - x) == real_of_num(1)
      #|  real_of_num(1) - (x : Real)
      #|  inv(real_of_num(2))
      #|  suminf((n : Num) => pow((x : Real), n)) == inv(real_of_num(1) - x)
      #|  inv(real_of_num(2))
      #|  inv(real_of_num(1) - (x : Real))
      #|  exp((x : Real))
      #|  1
      #|  suminf((n : Num) => pow((x : Real), n))
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= inv(real_of_num(2)) \226\134\146 exp(x) <= real_of_num(1) + real_of_num(2) * x
      #|  (ln : (Real) -> Real)((x : Real)) == select((u : Real) => exp(u) == x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, ln(exp(x)) == x
      #|  (y : Real)
      #|  \226\136\128 x : Real, (exp(ln(x)) == x) == (real_of_num(0) < x)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 exp(ln(x)) == x
      #|  real_of_num(0) < (x : Real) * (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 ln(x * y) == ln(x) + ln(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 (ln(x) == ln(y)) == (x == y)
      #|  ln(real_of_num(1)) == real_of_num(0)
      #|  (x : Real) * inv(x) == real_of_num(1)
      #|  real_of_num(0) < (x : Real) && real_of_num(0) < inv(x)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 ln(inv(x)) == -ln(x)
      #|  real_of_num(0) < (y : Real)
      #|  real_of_num(0) < (x : Real) && real_of_num(0) < inv((y : Real))
      #|  \226\136\128 x : Real, real_of_num(0) < x && real_of_num(0) < (y : Real) \226\134\146 ln(x / y) == ln(x) - ln(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 (ln(x) < ln(y)) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) < x && real_of_num(0) < y \226\134\146 (ln(x) <= ln(y)) == (x <= y)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) < x \226\134\146 ln(pow(x, n)) == real_of_num(n) * ln(x)
      #|  (x : Real)
      #|  exp((x : Real))
      #|  real_of_num(1) + (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 ln(real_of_num(1) + x) <= x
      #|  ln(real_of_num(1) + (x : Real))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 ln(x) < x
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) < x
      #|  \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 real_of_num(0) <= ln(x)
      #|  real_of_num(1) < (x : Real) \226\134\146 real_of_num(0) < x
      #|  \226\136\128 x : Real, real_of_num(1) < x \226\134\146 real_of_num(0) < ln(x)
      #|  real_of_num(1)
      #|  ln((x : Real))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 diffl(ln, inv(x), x)
      #|  (root : (Num, Real) -> Real)((n : Num), (x : Real)) == select((u : Real) => (real_of_num(0) < x \226\134\146 real_of_num(0) < u) && pow(u, n) == x)
      #|  inv(real_of_num(SUC((n : Num)))) * real_of_num(SUC(n)) == real_of_num(1)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) < x \226\134\146 pow(exp(ln(x) / real_of_num(SUC(n))), SUC(n)) == x
      #|  inv(real_of_num(SUC((n : Num)))) * real_of_num(SUC(n)) == real_of_num(1)
      #|  ln((y : Real)) * real_of_num(SUC((n : Num))) == ln(pow(y, SUC(n))) / real_of_num(SUC(n)) * real_of_num(SUC(n))
      #|  \226\136\128 z : Real, real_of_num(0) < (y : Real) && real_of_num(0) < exp(z)
      #|  (y : Real)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 (\226\136\128 n : Num, root(SUC(n), x) == exp(ln(x) / real_of_num(SUC(n))))
      #|  (n : Num)
      #|  (n : Num)
      #|  (y : Real)
      #|  \226\136\128 n : Num, root(SUC(n), real_of_num(0)) == real_of_num(0)
      #|  \226\136\128 n : Num, root(SUC(n), real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 pow(root(SUC(n), x), SUC(n)) == x
      #|  (n : Num)
      #|  real_of_num(0) <= (x : Real)
      #|  (y : Real)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 root(SUC(n), pow(x, SUC(n))) == x
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x \226\134\146 real_of_num(0) <= root(SUC(n), x)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y && pow(y, SUC(n)) == x \226\134\146 root(SUC(n), x) == y
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 root(SUC(n), x * y) == root(SUC(n), x) * root(SUC(n), y)
      #|  \226\136\128 n : Num, \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 root(SUC(n), inv(x)) == inv(root(SUC(n), x))
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 root(SUC(n), x / y) == root(SUC(n), x) / root(SUC(n), y)
      #|  (x : Real) == pow(root(SUC((n : Num)), x), SUC(n)) && (y : Real) == pow(root(SUC(n), y), SUC(n))
      #|  (x : Real) < (y : Real)
      #|  real_of_num(0) <= (y : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x < y \226\134\146 root(SUC((n : Num)), x) < root(SUC(n), y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && x <= y \226\134\146 root(SUC((n : Num)), x) <= root(SUC(n), y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 (root(SUC((n : Num)), x) < root(SUC(n), y)) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 (root(SUC((n : Num)), x) <= root(SUC(n), y)) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(0) <= x && real_of_num(0) <= y \226\134\146 (root(SUC((n : Num)), x) == root(SUC(n), y)) == (x == y)
      #|  !(2 == 0)
      #|  \226\136\128 n : Num, EVEN(n) \226\134\146 sqrt(pow(real_of_num(2), n)) == pow(real_of_num(2), DIV(n, 2))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 x / sqrt(x) == sqrt(x)
      #|  abs((x : Real) - (y : Real)) < y \226\134\146 real_of_num(0) <= x
      #|  sqrt((x : Real))
      #|  sqrt((x : Real))
      #|  real_of_num(2) * sqrt((x : Real))
      #|  sqrt
      #|  (x : Real) => pow(x, 2)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 diffl(sqrt, inv(real_of_num(2) * sqrt(x)), x)
      #|  \226\136\128 g : (Real) -> Real, \226\136\128 m : Real, \226\136\128 x : Real, diffl(g, m, x) && real_of_num(0) < g(x) \226\134\146 diffl((x : Real) => sqrt(g(x)), inv(real_of_num(2) * sqrt(g(x))) * m, x)
      #|  (n : Num)
      #|  (n : Num)
      #|  0
      #|  sin(real_of_num(0)) == real_of_num(0)
      #|  (n : Num)
      #|  1
      #|  real_of_num(1) / real_of_num(1) == real_of_num(SUC(0))
      #|  2
      #|  0
      #|  DIV(0, 2) == 0
      #|  1
      #|  1
      #|  cos(real_of_num(0)) == real_of_num(1)
      #|  2
      #|  (x : Real)
      #|  (x : Real)
      #|  2
      #|  real_of_num(1) == ((x : Real) => pow(sin(x), 2) + pow(cos(x), 2))(real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, pow(sin(x), 2) + pow(cos(x), 2) == real_of_num(1)
      #|  (a : Real) + ((b : Real) + (c : Real)) == a + c + b
      #|  cos((x : Real))
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Real, abs(sin(x)) <= real_of_num(1)
      #|  \226\136\128 x : Real, -real_of_num(1) <= sin(x) && sin(x) <= real_of_num(1)
      #|  sin((x : Real))
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Real, abs(cos(x)) <= real_of_num(1)
      #|  \226\136\128 x : Real, -real_of_num(1) <= cos(x) && cos(x) <= real_of_num(1)
      #|  (x : Real)
      #|  2
      #|  (x : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, pow(sin(x + y) - (sin(x) * cos(y) + cos(x) * sin(y)), 2) + pow(cos(x + y) - (cos(x) * cos(y) - sin(x) * sin(y)), 2) == real_of_num(0)
      #|  (x : Real)
      #|  2
      #|  (x : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 x : Real, pow(sin(-x) + sin(x), 2) + pow(cos(-x) - cos(x), 2) == real_of_num(0)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, sin(x + y) == sin(x) * cos(y) + cos(x) * sin(y)
      #|  (y : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, cos(x + y) == cos(x) * cos(y) - sin(x) * sin(y)
      #|  (x : Real)
      #|  \226\136\128 x : Real, sin(-x) == -sin(x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, cos(-x) == cos(x)
      #|  \226\136\128 x : Real, sin(real_of_num(2) * x) == real_of_num(2) * (sin(x) * cos(x))
      #|  \226\136\128 x : Real, cos(real_of_num(2) * x) == pow(cos(x), 2) - pow(sin(x), 2)
      #|  \226\136\128 x : Real, cos(abs(x)) == cos(x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, sums((n : Num) => pow(-real_of_num(1), n) / real_of_num(FACT(2 * n + 1)) * pow(x, 2 * n + 1), sin(x))
      #|  real_of_num(2)
      #|  real_of_num
      #|  (a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * (e : Real)))) == a * (b * e) * (c * d)
      #|  \226\136\128 n : Num, !(real_of_num(FACT(n)) == real_of_num(0))
      #|  \226\136\128 n : Num, !(real_of_num(SUC(n)) == real_of_num(0))
      #|  \226\136\128 n : Num, real_of_num(0) < real_of_num(FACT(n))
      #|  \226\136\128 n : Num, real_of_num(0) < real_of_num(SUC(n))
      #|  1
      #|  2
      #|  2
      #|  (n : Num)
      #|  sum((0, 0))
      #|  real_of_num(0)
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < real_of_num(2) \226\134\146 real_of_num(0) < sin(x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, sums((n : Num) => pow(-real_of_num(1), n) / real_of_num(FACT(2 * n)) * pow(x, 2 * n), cos(x))
      #|  1
      #|  2
      #|  3
      #|  4
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == a * (b * d) * c
      #|  \226\136\128 n : Num, !(real_of_num(FACT(n)) == real_of_num(0))
      #|  \226\136\128 n : Num, !(real_of_num(SUC(n)) == real_of_num(0))
      #|  \226\136\128 n : Num, real_of_num(0) < real_of_num(FACT(n))
      #|  \226\136\128 n : Num, real_of_num(0) < real_of_num(SUC(n))
      #|  1
      #|  1
      #|  2
      #|  2
      #|  3
      #|  2
      #|  3
      #|  3
      #|  (d : Num)
      #|  real_of_num(2) * inv(real_of_num(2)) == real_of_num(1)
      #|  real_of_num(2)
      #|  inv(real_of_num(2)) * real_of_num(4) == real_of_num(1) + real_of_num(1)
      #|  2
      #|  1
      #|  1
      #|  2
      #|  3
      #|  4
      #|  3
      #|  4
      #|  3
      #|  sum((0, 3), (n : Num) => -(pow(-real_of_num(1), n) / real_of_num(FACT(2 * n)) * pow(real_of_num(2), 2 * n)))
      #|  real_of_num(2)
      #|  cos(real_of_num(2)) < real_of_num(0)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  cos
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  cos
      #|  -sin((x : Real))
      #|  (\226\136\128 x : Real, differentiable(cos, x)) && (\226\136\128 x : Real, contl(cos, x))
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (a : Bool) == !!a
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  -sin((x : Real))
      #|  (x : Real)
      #|  existsunique((x : Real) => real_of_num(0) <= x && x <= real_of_num(2) && cos(x) == real_of_num(0))
      #|  (pi : Real) == real_of_num(2) * select((x : Real) => real_of_num(0) <= x && x <= real_of_num(2) && cos(x) == real_of_num(0))
      #|  (a : Real) * (b : Real) * (c : Real) == c * a * b
      #|  pi / real_of_num(2) == select((x : Real) => real_of_num(0) <= x && x <= real_of_num(2) && cos(x) == real_of_num(0))
      #|  cos(pi / real_of_num(2)) == real_of_num(0)
      #|  real_of_num(0) < pi / real_of_num(2) && pi / real_of_num(2) < real_of_num(2)
      #|  real_of_num(0) < pi
      #|  real_neg
      #|  pi / real_of_num(2)
      #|  sin(pi / real_of_num(2)) == real_of_num(1)
      #|  pi / real_of_num(2)
      #|  pi / real_of_num(2)
      #|  cos(pi) == -real_of_num(1)
      #|  pi / real_of_num(2)
      #|  pi / real_of_num(2)
      #|  sin(pi) == real_of_num(0)
      #|  \226\136\128 x : Real, sin(x) == cos(pi / real_of_num(2) - x)
      #|  \226\136\128 x : Real, cos(x) == sin(pi / real_of_num(2) - x)
      #|  \226\136\128 x : Real, sin(x + pi) == -sin(x)
      #|  \226\136\128 x : Real, cos(x + pi) == -cos(x)
      #|  \226\136\128 x : Real, sin(x + real_of_num(2) * pi) == sin(x)
      #|  \226\136\128 x : Real, cos(x + real_of_num(2) * pi) == cos(x)
      #|  \226\136\128 n : Num, cos(real_of_num(n) * pi) == pow(-real_of_num(1), n)
      #|  \226\136\128 n : Num, sin(real_of_num(n) * pi) == real_of_num(0)
      #|  pi / real_of_num(2)
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < pi / real_of_num(2) \226\134\146 real_of_num(0) < sin(x)
      #|  (x : Real) < pi / real_of_num(2)
      #|  pi / real_of_num(2)
      #|  (x : Real)
      #|  pi / real_of_num(2)
      #|  (z : Real)
      #|  (z : Real)
      #|  -sin((z : Real))
      #|  (z : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  cos
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < pi / real_of_num(2) \226\134\146 real_of_num(0) < cos(x)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 x : Real, -(pi / real_of_num(2)) < x && x < pi / real_of_num(2) \226\134\146 real_of_num(0) < cos(x)
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < pi \226\134\146 real_of_num(0) < sin(x)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= pi \226\134\146 real_of_num(0) <= sin(x)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  diffl(cos, real_of_num(0), (x : Real))
      #|  (x : Real)
      #|  -sin((x : Real))
      #|  (x : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  cos
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  cos
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  -sin((x : Real))
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 existsunique((x : Real) => real_of_num(0) <= x && x <= pi && cos(x) == y)
      #|  (x : Real) - pi / real_of_num(2)
      #|  (x : Real)
      #|  -(y : Real)
      #|  \226\136\128 x : Real, (-(pi / real_of_num(2)) <= x && x <= pi / real_of_num(2) && sin(x) == (y : Real)) == (real_of_num(0) <= x + pi / real_of_num(2) && x + pi / real_of_num(2) <= pi && cos(x + pi / real_of_num(2)) == -y)
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 existsunique((x : Real) => -(pi / real_of_num(2)) <= x && x <= pi / real_of_num(2) && sin(x) == y)
      #|  SUC(2 * (n : Num))
      #|  pi / real_of_num(2)
      #|  (x : Real) - real_of_num((n : Num)) * pi
      #|  real_of_num(0)
      #|  (x : Real) < real_of_num(SUC((n : Num))) * pi
      #|  real_of_num(0) <= (x : Real) - real_of_num((n : Num)) * pi && x - real_of_num(n) * pi <= pi && cos(x - real_of_num(n) * pi) == real_of_num(0)
      #|  (n : Num)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && cos(x) == real_of_num(0) \226\134\146 (\226\136\131 n : Num, !EVEN(n) && x == real_of_num(n) * (pi / real_of_num(2)))
      #|  2 * (m : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Real)
      #|  (x : Real) + pi / real_of_num(2)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && sin(x) == real_of_num(0) \226\134\146 (\226\136\131 n : Num, EVEN(n) && x == real_of_num(n) * (pi / real_of_num(2)))
      #|  (m : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, (cos(x) == real_of_num(0)) == ((\226\136\131 n : Num, !EVEN(n) && x == real_of_num(n) * (pi / real_of_num(2))) || (\226\136\131 n : Num, !EVEN(n) && x == -(real_of_num(n) * (pi / real_of_num(2)))))
      #|  (a : Real) * (b : Real) * (c : Real) == b * (a * c)
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  \226\136\128 x : Real, (sin(x) == real_of_num(0)) == ((\226\136\131 n : Num, EVEN(n) && x == real_of_num(n) * (pi / real_of_num(2))) || (\226\136\131 n : Num, EVEN(n) && x == -(real_of_num(n) * (pi / real_of_num(2)))))
      #|  \226\136\128 x : Real, (sin(x) == real_of_num(0)) == ((\226\136\131 n : Num, x == real_of_num(n) * pi) || (\226\136\131 n : Num, x == -(real_of_num(n) * pi)))
      #|  (m : Num)
      #|  ((a : Bool) \226\134\146 (a' : Bool)) && ((b : Bool) \226\134\146 (b' : Bool)) \226\134\146 a || b \226\134\146 a' || b'
      #|  ((x : Real) + real_of_num(1) * real_of_num(1) == real_of_num(1)) == (x == real_of_num(0))
      #|  (x : Real)
      #|  \226\136\128 x : Real, (cos(x) == real_of_num(1)) == ((\226\136\131 n : Num, x == real_of_num(n) * (real_of_num(2) * pi)) || (\226\136\131 n : Num, x == -(real_of_num(n) * (real_of_num(2) * pi))))
      #|  (tan : (Real) -> Real)((x : Real)) == sin(x) / cos(x)
      #|  tan(real_of_num(0)) == real_of_num(0)
      #|  tan(pi) == real_of_num(0)
      #|  \226\136\128 n : Num, tan(real_of_num(n) * pi) == real_of_num(0)
      #|  \226\136\128 x : Real, tan(-x) == -tan(x)
      #|  \226\136\128 x : Real, tan(x + real_of_num(2) * pi) == tan(x)
      #|  \226\136\128 x : Real, tan(x + pi) == tan(x)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, tan(x + real_of_num(n) * pi) == tan(x)
      #|  (a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * (f : Real))))) == f * b * (d * a * (c * e))
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == d * b * (a * c)
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == d * a * (c * b)
      #|  !(cos((x : Real) + (y : Real)) == real_of_num(0))
      #|  op_star(cos((x : Real)) * cos((y : Real)))
      #|  real_of_num(1) - sin((x : Real)) / cos(x) * (sin((y : Real)) / cos(y))
      #|  cos((x : Real)) * cos((y : Real))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, !(cos(x) == real_of_num(0)) && !(cos(y) == real_of_num(0)) && !(cos(x + y) == real_of_num(0)) \226\134\146 tan(x + y) == (tan(x) + tan(y)) / (real_of_num(1) - tan(x) * tan(y))
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, !(cos(x) == real_of_num(0)) && !(cos(real_of_num(2) * x) == real_of_num(0)) \226\134\146 tan(real_of_num(2) * x) == real_of_num(2) * tan(x) / (real_of_num(1) - pow(tan(x), 2))
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < pi / real_of_num(2) \226\134\146 real_of_num(0) < tan(x)
      #|  (x : Real)
      #|  (x : Real) => sin(x) / cos(x)
      #|  \226\136\128 x : Real, !(cos(x) == real_of_num(0)) \226\134\146 diffl(tan, inv(pow(cos(x), 2)), x)
      #|  diffl((g : (Real) -> Real), (m : Real), (x : Real)) && !(cos(g(x)) == real_of_num(0)) \226\134\146 diffl((x : Real) => tan(g(x)), inv(pow(cos(g(x)), 2)) * m, x)
      #|  real_of_num(0) < cos(pi / real_of_num(2) - (e : Real)) / sin(pi / real_of_num(2) - e)
      #|  real_of_num(0) < cos(pi / real_of_num(2) - (e : Real)) / sin(pi / real_of_num(2) - e)
      #|  abs((e : Real)) == e
      #|  pi / real_of_num(2) - (e : Real)
      #|  pi / real_of_num(2) - (e : Real)
      #|  (e : Real)
      #|  pi / real_of_num(2)
      #|  (d : Real)
      #|  (d : Real)
      #|  inv((y : Real))
      #|  cos(pi / real_of_num(2))
      #|  -sin(pi / real_of_num(2))
      #|  real_of_num(1)
      #|  tends_real_real((x : Real) => cos(x) / sin(x), real_of_num(0), pi / real_of_num(2))
      #|  \226\136\128 y : Real, real_of_num(0) < y \226\134\146 (\226\136\131 x : Real, real_of_num(0) < x && x < pi / real_of_num(2) && y < tan(x))
      #|  real_of_num(0)
      #|  (x : Real)
      #|  (z : Real)
      #|  (z : Real)
      #|  (x : Real)
      #|  real_of_num(0) <= (z : Real)
      #|  inv(pow(cos((z : Real)), 2))
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  tan
      #|  (x : Real)
      #|  \226\136\128 y : Real, real_of_num(0) <= y \226\134\146 (\226\136\131 x : Real, real_of_num(0) <= x && x < pi / real_of_num(2) && tan(x) == y)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  diffl(tan, real_of_num(0), (x : Real))
      #|  !(cos((x : Real)) == real_of_num(0))
      #|  (x : Real)
      #|  (x : Real)
      #|  inv(pow(cos((x : Real)), 2))
      #|  (x : Real)
      #|  inv(pow(cos((x : Real)), 2))
      #|  (x : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  tan
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (z2 : Real)
      #|  (x2 : Real)
      #|  (z1 : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x2 : Real)
      #|  (x1 : Real)
      #|  (x : Real)
      #|  -(x : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  \226\136\128 y : Real, existsunique((x : Real) => -(pi / real_of_num(2)) < x && x < pi / real_of_num(2) && tan(x) == y)
      #|  pi / real_of_num(2) == real_of_num(2) * (pi / real_of_num(4))
      #|  EVEN
      #|  real_of_num(0) <= (x : Real) \226\134\146 !(real_of_num(1) == -x)
      #|  (a : Real) * ((b : Real) * (c : Real)) == b * (a * c)
      #|  tan(pi / real_of_num(4)) == real_of_num(1)
      #|  \226\136\128 x : Real, tan(pi / real_of_num(2) - x) == inv(tan(x))
      #|  !((x : Real) == real_of_num(0)) && !(real_of_num(0) < x) \226\134\146 real_of_num(0) < -x
      #|  real_of_num(0) < (x : Real) && x < real_of_num(1) \226\134\146 abs(x) < real_of_num(1)
      #|  real_of_num(0) < (x : Real) && x < real_of_num(1) \226\134\146 abs(x) < real_of_num(1)
      #|  (x : Real) == real_of_num(0)
      #|  real_of_num(0) < (x : Real)
      #|  (z : Real) < pi / real_of_num(4)
      #|  (x : Real) < (z : Real)
      #|  (z : Real)
      #|  ((x : Real) < real_of_num(1)) == (real_of_num(0) < real_of_num(1) - x)
      #|  real_of_num(0) < (x : Real)
      #|  (z : Real) <= pi / real_of_num(4)
      #|  (x : Real) <= (z : Real)
      #|  (z : Real)
      #|  pi / real_of_num(4)
      #|  (x : Real)
      #|  (x : Real) => inv(pow(cos(x), 2))
      #|  tan
      #|  real_of_num(0) < (x : Real) && x < (a : Real) \226\134\146 x < real_of_num(2) * a
      #|  \226\136\128 x : Real, real_of_num(0) < x && x < pi / real_of_num(4) \226\134\146 real_of_num(0) < tan(x) && tan(x) < real_of_num(1)
      #|  \226\136\128 x : Real, abs(x) < pi / real_of_num(4) \226\134\146 abs(tan(x)) < real_of_num(1)
      #|  (z : Real)
      #|  (a : Bool) && ((b : Bool) \226\134\146 (c : Bool)) \226\134\146 (a \226\134\146 b) \226\134\146 c
      #|  (y : Real)
      #|  real_of_num(0)
      #|  (x : Real) => inv(pow(cos(x), 2))
      #|  tan
      #|  real_of_num(0) < (x : Real) && (x < (p : Real) \226\134\146 x <= (tx : Real)) \226\134\146 abs(x) < p \226\134\146 abs(x) <= abs(tx)
      #|  (x : Real)
      #|  \226\136\128 y : Real, real_of_num(0) < y && y < pi / real_of_num(2) \226\134\146 y <= tan(y)
      #|  \226\136\128 x : Real, abs(x) < pi / real_of_num(2) \226\134\146 abs(x) <= abs(tan(x))
      #|  (asn : (Real) -> Real)((y : Real)) == select((x : Real) => -(pi / real_of_num(2)) <= x && x <= pi / real_of_num(2) && sin(x) == y)
      #|  (acs : (Real) -> Real)((y : Real)) == select((x : Real) => real_of_num(0) <= x && x <= pi && cos(x) == y)
      #|  (atn : (Real) -> Real)((y : Real)) == select((x : Real) => -(pi / real_of_num(2)) < x && x < pi / real_of_num(2) && tan(x) == y)
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 -(pi / real_of_num(2)) <= asn(y) && asn(y) <= pi / real_of_num(2) && sin(asn(y)) == y
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 sin(asn(y)) == y
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 -(pi / real_of_num(2)) <= asn(y) && asn(y) <= pi / real_of_num(2)
      #|  sin
      #|  (y : Real)
      #|  \226\136\128 y : Real, -real_of_num(1) < y && y < real_of_num(1) \226\134\146 -(pi / real_of_num(2)) < asn(y) && asn(y) < pi / real_of_num(2)
      #|  (x : Real)
      #|  \226\136\128 x : Real, -(pi / real_of_num(2)) <= x && x <= pi / real_of_num(2) \226\134\146 asn(sin(x)) == x
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 real_of_num(0) <= acs(y) && acs(y) <= pi && cos(acs(y)) == y
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 cos(acs(y)) == y
      #|  \226\136\128 y : Real, -real_of_num(1) <= y && y <= real_of_num(1) \226\134\146 real_of_num(0) <= acs(y) && acs(y) <= pi
      #|  cos
      #|  (y : Real)
      #|  \226\136\128 y : Real, -real_of_num(1) < y && y < real_of_num(1) \226\134\146 real_of_num(0) < acs(y) && acs(y) < pi
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= pi \226\134\146 acs(cos(x)) == x
      #|  (y : Real)
      #|  \226\136\128 y : Real, -(pi / real_of_num(2)) < atn(y) && atn(y) < pi / real_of_num(2) && tan(atn(y)) == y
      #|  \226\136\128 y : Real, tan(atn(y)) == y
      #|  \226\136\128 y : Real, -(pi / real_of_num(2)) < atn(y) && atn(y) < pi / real_of_num(2)
      #|  tan((x : Real))
      #|  \226\136\128 x : Real, -(pi / real_of_num(2)) < x && x < pi / real_of_num(2) \226\134\146 atn(tan(x)) == x
      #|  real_of_num(0) < (a : Real) \226\134\146 -a < real_of_num(0) && real_of_num(0) < a
      #|  atn(real_of_num(0)) == real_of_num(0)
      #|  real_of_num(0) < (a : Real) && a < (b : Real) \226\134\146 -b < a && a < b
      #|  atn
      #|  atn(real_of_num(1)) == pi / real_of_num(4)
      #|  -(a : Real) < (x : Real) && x < a \226\134\146 -a < -x && -x < a
      #|  atn((x : Real))
      #|  \226\136\128 x : Real, atn(-x) == -atn(x)
      #|  (x : Real)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 x : Real, !(cos(atn(x)) == real_of_num(0))
      #|  \226\136\128 x : Real, !(cos(x) == real_of_num(0)) \226\134\146 real_of_num(1) + pow(tan(x), 2) == pow(inv(cos(x)), 2)
      #|  2
      #|  real_of_num(1) + pow((x : Real), 2) == real_of_num(0)
      #|  (x : Real)
      #|  inv(pow(cos((z : Real)), 2))
      #|  (d : Real)
      #|  (d : Real)
      #|  \226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 z : Real, abs(z - atn((x : Real))) < d \226\134\146 -(pi / real_of_num(2)) < z && z < pi / real_of_num(2))
      #|  diffl(atn, inv(real_of_num(1) + pow((x : Real), 2)), tan(atn(x)))
      #|  \226\136\128 x : Real, diffl(atn, inv(real_of_num(1) + pow(x, 2)), x)
      #|  diffl((g : (Real) -> Real), (m : Real), (x : Real)) \226\134\146 diffl((x : Real) => atn(g(x)), inv(real_of_num(1) + pow(g(x), 2)) * m, x)
      #|  real_of_num(0) <= (x : Real) \226\134\146 real_of_num(0) < real_of_num(1) + x
      #|  ((a : Real) < (b : Real) + a) == (real_of_num(0) < b)
      #|  (l : Real) - (r : Real) == (d : Real) \226\134\146 l < d + (e : Real) \226\134\146 r < e
      #|  (y : Real)
      #|  (x : Real)
      #|  (x : Real) => inv(real_of_num(1) + pow(x, 2))
      #|  atn
      #|  \226\136\128 x : Real, \226\136\128 y : Real, x < y \226\134\146 atn(x) < atn(y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (atn(x) < atn(y)) == (x < y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (atn(x) <= atn(y)) == (x <= y)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (atn(x) == atn(y)) == (x == y)
      #|  (real_of_num(0) < atn((x : Real))) == (real_of_num(0) < x)
      #|  (real_of_num(0) <= atn((x : Real))) == (real_of_num(0) <= x)
      #|  \226\136\128 x : Real, x < real_of_num(1) \226\134\146 atn(x) < pi / real_of_num(4)
      #|  \226\136\128 x : Real, -real_of_num(1) < x \226\134\146 -(pi / real_of_num(4)) < atn(x)
      #|  (real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) < (y : Real)) && (x < real_of_num(0) \226\134\146 y < real_of_num(0)) && (x == real_of_num(0) \226\134\146 y == real_of_num(0)) && (x < (a : Real) \226\134\146 y < (b : Real)) && (-a < x \226\134\146 -b < y) \226\134\146 abs(x) < a \226\134\146 abs(y) < b
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 abs(atn(x)) < pi / real_of_num(4)
      #|  abs((x : Real)) == (a : Real) \226\134\146 x == a || x == -a
      #|  \226\136\128 x : Real, abs(x) <= real_of_num(1) \226\134\146 abs(atn(x)) <= pi / real_of_num(4)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= cos(x) \226\134\146 cos(x) == sqrt(real_of_num(1) - pow(sin(x), 2))
      #|  -(pi / real_of_num(2)) < asn((x : Real))
      #|  asn((x : Real)) < pi / real_of_num(2)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 !(cos(asn(x)) == real_of_num(0))
      #|  cos((z : Real))
      #|  (z : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 diffl(asn, inv(cos(asn(x))), x)
      #|  sin(asn((x : Real))) == x
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 diffl(asn, inv(sqrt(real_of_num(1) - pow(x, 2))), x)
      #|  diffl((g : (Real) -> Real), (m : Real), (x : Real)) && -real_of_num(1) < g(x) && g(x) < real_of_num(1) \226\134\146 diffl((x : Real) => asn(g(x)), inv(sqrt(real_of_num(1) - pow(g(x), 2))) * m, x)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= sin(x) \226\134\146 sin(x) == sqrt(real_of_num(1) - pow(cos(x), 2))
      #|  real_of_num(0) < acs((x : Real))
      #|  acs((x : Real)) < pi
      #|  (n : Num)
      #|  (n : Num)
      #|  false
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 !(sin(acs(x)) == real_of_num(0))
      #|  -sin((z : Real))
      #|  (z : Real)
      #|  (d : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 diffl(acs, inv(-sin(acs(x))), x)
      #|  cos(acs((x : Real))) == x
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(1) \226\134\146 diffl(acs, -inv(sqrt(real_of_num(1) - pow(x, 2))), x)
      #|  diffl((g : (Real) -> Real), (m : Real), (x : Real)) && -real_of_num(1) < g(x) && g(x) < real_of_num(1) \226\134\146 diffl((x : Real) => acs(g(x)), -inv(sqrt(real_of_num(1) - pow(g(x), 2))) * m, x)
      #|  !(real_of_num(0) <= (y : Real)) && abs(y) == (x : Real) \226\134\146 y == -x
      #|  real_of_num(0) <= (y : Real) && abs(y) == (x : Real) \226\134\146 y == x
      #|  abs((x : Real)) <= real_of_num(1) \226\134\146 -real_of_num(1) <= x && x <= real_of_num(1)
      #|  -acs((x : Real))
      #|  acs((x : Real))
      #|  real_of_num(0) <= (y : Real)
      #|  pow((x : Real), 2) + pow((y : Real), 2) == real_of_num(1)
      #|  abs((y : Real)) == sqrt(real_of_num(1) - pow((x : Real), 2))
      #|  real_of_num(0) <= sin(acs((x : Real)))
      #|  real_of_num(1) * real_of_num(1)
      #|  (real_of_num(1) < (x : Real) \226\134\146 real_of_num(1) < pow(x, 2)) && (real_of_num(1) < (y : Real) \226\134\146 real_of_num(1) < pow(y, 2)) && real_of_num(0) <= pow(x, 2) && real_of_num(0) <= pow(y, 2) && pow(x, 2) + pow(y, 2) <= real_of_num(1) \226\134\146 x <= real_of_num(1) && y <= real_of_num(1)
      #|  abs((x : Real)) <= real_of_num(1) && abs((y : Real)) <= real_of_num(1)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, pow(x, 2) + pow(y, 2) == real_of_num(1) \226\134\146 (\226\136\131 t : Real, x == cos(t) && y == sin(t))
      #|  (real_of_num(0) < real_of_num(1) - (z : Real) * z) == (z * z < real_of_num(1) * real_of_num(1))
      #|  ((a : Real) * -(c : Real) + (x : Real) < x) == (real_of_num(0) < a * c)
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  (x : Real) => -inv(sqrt(real_of_num(1) - pow(x, 2)))
      #|  acs
      #|  \226\136\128 x : Real, \226\136\128 y : Real, -real_of_num(1) < x && x < y && y < real_of_num(1) \226\134\146 acs(y) < acs(x)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m < SUC(n)) == (m <= n)
      #|  1
      #|  \226\136\128 n : Num, (n < 1) == (n == 0)
      #|  (division : ((Real, Real), (Num) -> Real) -> Bool)(((a : Real), (b : Real)), (D : (Num) -> Real)) == (D(0) == a && (\226\136\131 N : Num, (\226\136\128 n : Num, n < N \226\134\146 D(n) < D(SUC(n))) && (\226\136\128 n : Num, n >= N \226\134\146 D(n) == b)))
      #|  (dsize : ((Num) -> Real) -> Num)((D : (Num) -> Real)) == select((N : Num) => (\226\136\128 n : Num, n < N \226\134\146 D(n) < D(SUC(n))) && (\226\136\128 n : Num, n >= N \226\134\146 D(n) == D(N)))
      #|  (tdiv : ((Real, Real), ((Num) -> Real, (Num) -> Real)) -> Bool)(((a : Real), (b : Real)), ((D : (Num) -> Real), (p : (Num) -> Real))) == (division((a, b), D) && (\226\136\128 n : Num, D(n) <= p(n) && p(n) <= D(SUC(n))))
      #|  (gauge : ((Real) -> Bool, (Real) -> Real) -> Bool)((E : (Real) -> Bool), (g : (Real) -> Real)) == (\226\136\128 x : Real, E(x) \226\134\146 real_of_num(0) < g(x))
      #|  (fine : ((Real) -> Real, ((Num) -> Real, (Num) -> Real)) -> Bool)((g : (Real) -> Real), ((D : (Num) -> Real), (p : (Num) -> Real))) == (\226\136\128 n : Num, n < dsize(D) \226\134\146 D(SUC(n)) - D(n) < g(p(n)))
      #|  (rsum : (((Num) -> Real, (Num) -> Real), (Real) -> Real) -> Real)(((D : (Num) -> Real), (p : (Num) -> Real)), (f : (Real) -> Real)) == sum((0, dsize(D)), (n : Num) => f(p(n)) * (D(SUC(n)) - D(n)))
      #|  (defint : ((Real, Real), (Real) -> Real, Real) -> Bool)(((a : Real), (b : Real)), (f : (Real) -> Real), (k : Real)) == (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, gauge((x : Real) => a <= x && x <= b, g) && (\226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, tdiv((a, b), (D, p)) && fine(g, (D, p)) \226\134\146 abs(rsum((D, p), f) - k) < e)))
      #|  0
      #|  (n : Num)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a == b \226\134\146 dsize((n : Num) => if n == 0 { a } else { b }) == 0
      #|  (n : Num) == 0
      #|  1
      #|  (n : Num)
      #|  1
      #|  1
      #|  2
      #|  2
      #|  1
      #|  (n : Num)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a < b \226\134\146 dsize((n : Num) => if n == 0 { a } else { b }) == 1
      #|  0
      #|  1
      #|  (n : Num)
      #|  1
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a <= b \226\134\146 division((a, b), (n : Num) => if n == 0 { a } else { b })
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 D(0) == a
      #|  \226\136\128 n : Num, n >= (N : Num) \226\134\146 (D : (Num) -> Real)(n) == (b : Real)
      #|  (N : Num)
      #|  (M : Num)
      #|  \226\136\128 n : Num, n < (N : Num) \226\134\146 (D : (Num) -> Real)(n) < D(SUC(n))
      #|  SUC((M : Num))
      #|  (N : Num)
      #|  (M : Num)
      #|  \226\136\128 n : Num, n >= (N : Num) \226\134\146 (D : (Num) -> Real)(n) == (b : Real)
      #|  (N : Num)
      #|  (M : Num)
      #|  dsize((D : (Num) -> Real)) == (N : Num)
      #|  (N : Num)
      #|  dsize((D : (Num) -> Real))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) == (D(0) == a && (\226\136\128 n : Num, n < dsize(D) \226\134\146 D(n) < D(SUC(n))) && (\226\136\128 n : Num, n >= dsize(D) \226\134\146 D(n) == b))
      #|  SUC((N : Num))
      #|  (N : Num)
      #|  dsize((D : (Num) -> Real))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 D(dsize(D)) == b
      #|  (D : (Num) -> Real)((m : Num) + SUC((d : Num)))
      #|  (d : Num)
      #|  (d : Num)
      #|  (m : Num) + SUC((d : Num)) <= dsize((D : (Num) -> Real))
      #|  (d : Num)
      #|  (m : Num) < (n : Num)
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 m : Num, \226\136\128 n : Num, division((a, b), D) && m < n && n <= dsize(D) \226\134\146 D(m) < D(n)
      #|  SUC((n : Num))
      #|  (D : (Num) -> Real)(0) == (a : Real)
      #|  (D : (Num) -> Real)(SUC((n : Num)))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 (\226\136\128 n : Num, n < dsize(D) \226\134\146 D(0) < D(SUC(n)))
      #|  dsize((D : (Num) -> Real))
      #|  PRE(dsize((D : (Num) -> Real)))
      #|  dsize((D : (Num) -> Real))
      #|  \226\136\128 n : Num, n >= dsize((D : (Num) -> Real)) \226\134\146 D(n) == (b : Real)
      #|  (D : (Num) -> Real)(0) == (a : Real)
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 a <= b
      #|  (b : Real)
      #|  (a : Real)
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 (\226\136\128 n : Num, n < dsize(D) \226\134\146 D(n) < D(dsize(D)))
      #|  dsize((D : (Num) -> Real))
      #|  PRE(dsize((D : (Num) -> Real)))
      #|  dsize((D : (Num) -> Real))
      #|  \226\136\128 n : Num, n >= dsize((D : (Num) -> Real)) \226\134\146 D(n) == (b : Real)
      #|  (D : (Num) -> Real)(0) == (a : Real)
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), D) \226\134\146 (a == b) == (dsize(D) == 0)
      #|  (D : (Num) -> Real)
      #|  (b : Real)
      #|  SUC((r : Num))
      #|  (D : (Num) -> Real)((r : Num))
      #|  dsize((D : (Num) -> Real))
      #|  SUC((r : Num))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 r : Num, division((a, b), D) \226\134\146 a <= D(r)
      #|  SUC((n : Num))
      #|  SUC((n : Num))
      #|  dsize((D : (Num) -> Real))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 n : Num, division((a, b), D) && !(dsize(D) == 0) \226\134\146 a < D(SUC(n))
      #|  SUC((r : Num))
      #|  dsize((D : (Num) -> Real))
      #|  (r : Num) < 0
      #|  dsize((D : (Num) -> Real)) - (r : Num) == SUC(dsize(D) - SUC(r))
      #|  (D : (Num) -> Real)(dsize(D) - (r : Num))
      #|  (D : (Num) -> Real)
      #|  (r : Num)
      #|  dsize((D : (Num) -> Real)) - SUC((r : Num)) == 0
      #|  dsize((D : (Num) -> Real))
      #|  (r : Num)
      #|  (r : Num) < dsize((D : (Num) -> Real))
      #|  dsize((D : (Num) -> Real)) - (r : Num)
      #|  \226\136\128 r : Num, (D : (Num) -> Real)(dsize(D) - r) <= (b : Real)
      #|  dsize((D : (Num) -> Real))
      #|  (r : Num)
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 r : Num, division((a, b), D) \226\134\146 D(r) <= b
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 n : Num, division((a, b), D) && n < dsize(D) \226\134\146 D(n) < b
      #|  (d : Num)
      #|  dsize((D1 : (Num) -> Real))
      #|  (n : Num) >= dsize((D1 : (Num) -> Real)) + dsize((D2 : (Num) -> Real))
      #|  dsize((D1 : (Num) -> Real)) + (d : Num) < dsize(D1) + dsize((D2 : (Num) -> Real))
      #|  (d : Num)
      #|  !((n : Num) < dsize((D1 : (Num) -> Real)))
      #|  (c : Real)
      #|  (a : Real)
      #|  (b : Real)
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  division(((a : Real), (b : Real)), (D1 : (Num) -> Real))
      #|  SUC((n : Num))
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num)) < dsize((D1 : (Num) -> Real))
      #|  (n : Num)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 D1 : (Num) -> Real, \226\136\128 D2 : (Num) -> Real, division((a, b), D1) && division((b, c), D2) \226\134\146 (\226\136\128 n : Num, n < dsize(D1) + dsize(D2) \226\134\146 ((n : Num) => if n < dsize(D1) { D1(n) } else { D2(n - dsize(D1)) })(n) < ((n : Num) => if n < dsize(D1) { D1(n) } else { D2(n - dsize(D1)) })(SUC(n))) && (\226\136\128 n : Num, n >= dsize(D1) + dsize(D2) \226\134\146 ((n : Num) => if n < dsize(D1) { D1(n) } else { D2(n - dsize(D1)) })(n) == ((n : Num) => if n < dsize(D1) { D1(n) } else { D2(n - dsize(D1)) })(dsize(D1) + dsize(D2)))
      #|  dsize((D1 : (Num) -> Real)) + dsize((D2 : (Num) -> Real))
      #|  dsize((D1 : (Num) -> Real)) <= (n : Num)
      #|  (n : Num)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (b : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  SUC((n : Num))
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num)) < dsize((D1 : (Num) -> Real))
      #|  (n : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  dsize((D1 : (Num) -> Real)) <= (N : Num)
      #|  (c : Real)
      #|  (b : Real)
      #|  (D2 : (Num) -> Real)((N : Num) - dsize((D1 : (Num) -> Real))) < D2(dsize(D2))
      #|  (c : Real)
      #|  (a : Real)
      #|  (b : Real)
      #|  (D1 : (Num) -> Real)((N : Num)) < (D2 : (Num) -> Real)(dsize(D2))
      #|  dsize((D1 : (Num) -> Real)) + dsize((D2 : (Num) -> Real))
      #|  SUC(dsize((D2 : (Num) -> Real)))
      #|  division(((b : Real), (c : Real)), (D2 : (Num) -> Real))
      #|  (x : Num) + (y : Num)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, x <= SUC(x + y)
      #|  dsize((D1 : (Num) -> Real)) + dsize((D2 : (Num) -> Real))
      #|  (N : Num)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 D1 : (Num) -> Real, \226\136\128 D2 : (Num) -> Real, division((a, b), D1) && division((b, c), D2) \226\134\146 dsize((n : Num) => if n < dsize(D1) { D1(n) } else { D2(n - dsize(D1)) }) == dsize(D1) + dsize(D2)
      #|  dsize((D1 : (Num) -> Real)) == SUC((n : Num))
      #|  SUC((n : Num))
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num)) < dsize((D1 : (Num) -> Real))
      #|  (n : Num)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (D2 : (Num) -> Real)
      #|  (D1 : (Num) -> Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (b : Real)
      #|  (c : Real) == ((n : Num) => if n < dsize((D1 : (Num) -> Real)) { D1(n) } else { (D2 : (Num) -> Real)(n - dsize(D1)) })(dsize(D1) + dsize(D2))
      #|  (b : Real)
      #|  (d : Num)
      #|  !((n : Num) < dsize((D1 : (Num) -> Real)))
      #|  SUC((n : Num)) == dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num)) == dsize((D1 : (Num) -> Real))
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num))
      #|  (n : Num) < dsize((D1 : (Num) -> Real))
      #|  SUC((n : Num)) < dsize((D1 : (Num) -> Real))
      #|  (D2 : (Num) -> Real)
      #|  (D1 : (Num) -> Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (n : Num)
      #|  (b : Real)
      #|  (a : Real)
      #|  (D1 : (Num) -> Real)
      #|  (a : Real) == (b : Real)
      #|  dsize((D1 : (Num) -> Real))
      #|  dsize((D1 : (Num) -> Real)) == SUC((k : Num))
      #|  (k : Num) < (n : Num) \226\134\146 (SUC(k) < n) == !(n == SUC(k))
      #|  (k : Num)
      #|  SUC((r : Num) + (d : Num)) - d == SUC(r)
      #|  !(SUC((r : Num) + (d : Num)) < d)
      #|  !((r : Num) + (d : Num) < d)
      #|  (D2 : (Num) -> Real)
      #|  (D1 : (Num) -> Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (p2 : (Num) -> Real)
      #|  (D2 : (Num) -> Real)
      #|  (p1 : (Num) -> Real)
      #|  (D1 : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 g : (Real) -> Real, \226\136\128 d1 : (Num) -> Real, \226\136\128 p1 : (Num) -> Real, \226\136\128 d2 : (Num) -> Real, \226\136\128 p2 : (Num) -> Real, tdiv((a, b), (d1, p1)) && fine(g, (d1, p1)) && tdiv((b, c), (d2, p2)) && fine(g, (d2, p2)) \226\134\146 tdiv((a, c), ((n : Num) => if n < dsize(d1) { d1(n) } else { d2(n - dsize(d1)) }, (n : Num) => if n < dsize(d1) { p1(n) } else { p2(n - dsize(d1)) })) && fine(g, ((n : Num) => if n < dsize(d1) { d1(n) } else { d2(n - dsize(d1)) }, (n : Num) => if n < dsize(d1) { p1(n) } else { p2(n - dsize(d1)) })) && (\226\136\128 f : (Real) -> Real, rsum(((n : Num) => if n < dsize(d1) { d1(n) } else { d2(n - dsize(d1)) }, (n : Num) => if n < dsize(d1) { p1(n) } else { p2(n - dsize(d1)) }), f) == rsum((d1, p1), f) + rsum((d2, p2), f))
      #|  (n : Num) => if n < dsize((D1 : (Num) -> Real)) { (p1 : (Num) -> Real)(n) } else { (p2 : (Num) -> Real)(n - dsize(D1)) }
      #|  (n : Num) => if n < dsize((D1 : (Num) -> Real)) { D1(n) } else { (D2 : (Num) -> Real)(n - dsize(D1)) }
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 D1 : (Num) -> Real, \226\136\128 p1 : (Num) -> Real, \226\136\128 D2 : (Num) -> Real, \226\136\128 p2 : (Num) -> Real, tdiv((a, b), (D1, p1)) && fine((g : (Real) -> Real), (D1, p1)) && tdiv((b, c), (D2, p2)) && fine(g, (D2, p2)) \226\134\146 (\226\136\131 D : (Num) -> Real, \226\136\131 p : (Num) -> Real, tdiv((a, c), (D, p)) && fine(g, (D, p)) && (\226\136\128 f : (Real) -> Real, rsum((D, p), f) == rsum((D1, p1), f) + rsum((D2, p2), f)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, (\226\136\131 D1 : (Num) -> Real, \226\136\131 p1 : (Num) -> Real, tdiv((a, b), (D1, p1)) && fine((g : (Real) -> Real), (D1, p1))) && (\226\136\131 D2 : (Num) -> Real, \226\136\131 p2 : (Num) -> Real, tdiv((b, c), (D2, p2)) && fine(g, (D2, p2))) \226\134\146 (\226\136\131 D : (Num) -> Real, \226\136\131 p : (Num) -> Real, tdiv((a, c), (D, p)) && fine(g, (D, p)))
      #|  1
      #|  (w : Real) <= (y : Real)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Real)
      #|  (w : Real) <= (y : Real)
      #|  (n : Num) => if n == 0 { (x : Real) } else { (y : Real) }
      #|  (n : Num) => if n == 0 { (w : Real) } else { (y : Real) }
      #|  (y : Real)
      #|  (w : Real)
      #|  (g : (Real) -> Real)((x : Real))
      #|  gauge((x : Real) => (a : Real) <= x && x <= (b : Real), (g : (Real) -> Real))
      #|  (x : Real)
      #|  (y : Real)
      #|  (w : Real)
      #|  real_of_num(1)
      #|  (a : Real) <= (x : Real) && x <= (b : Real)
      #|  (x : Real)
      #|  (u : Real)
      #|  (w : Real)
      #|  (v : Real)
      #|  (w : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  fn { (u, v) => (a : Real) <= u && v <= (b : Real) \226\134\146 (\226\136\131 D : (Num) -> Real, \226\136\131 p : (Num) -> Real, tdiv((u, v), (D, p)) && fine((g : (Real) -> Real), (D, p))) }
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 g : (Real) -> Real, a <= b && gauge((x : Real) => a <= x && x <= b, g) \226\134\146 (\226\136\131 D : (Num) -> Real, \226\136\131 p : (Num) -> Real, tdiv((a, b), (D, p)) && fine(g, (D, p)))
      #|  (x : Real)
      #|  \226\136\128 E : (Real) -> Bool, \226\136\128 g1 : (Real) -> Real, \226\136\128 g2 : (Real) -> Real, gauge(E, g1) && gauge(E, g2) \226\134\146 gauge(E, (x : Real) => if g1(x) < g2(x) { g1(x) } else { g2(x) })
      #|  (n : Num)
      #|  \226\136\128 g1 : (Real) -> Real, \226\136\128 g2 : (Real) -> Real, \226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, fine((x : Real) => if g1(x) < g2(x) { g1(x) } else { g2(x) }, (D, p)) \226\134\146 fine(g1, (D, p)) && fine(g2, (D, p))
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == d + a + (c + b)
      #|  abs(rsum(((D : (Num) -> Real), (p : (Num) -> Real)), (f : (Real) -> Real)) - (k2 : Real)) + abs(rsum((D, p), f) - (k1 : Real))
      #|  abs(rsum(((D : (Num) -> Real), (p : (Num) -> Real)), (f : (Real) -> Real)) - (k2 : Real) - (rsum((D, p), f) - (k1 : Real))) < abs(k1 - k2)
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (x : Real) => if (g1 : (Real) -> Real)(x) < (g2 : (Real) -> Real)(x) { g1(x) } else { g2(x) }
      #|  (b : Real)
      #|  (a : Real)
      #|  (g2 : (Real) -> Real)
      #|  (g1 : (Real) -> Real)
      #|  (x : Real) => (a : Real) <= x && x <= (b : Real)
      #|  (g2 : (Real) -> Real)
      #|  (g1 : (Real) -> Real)
      #|  abs((k1 : Real) - (k2 : Real)) / real_of_num(2)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 f : (Real) -> Real, \226\136\128 k1 : Real, \226\136\128 k2 : Real, a <= b && defint((a, b), f, k1) && defint((a, b), f, k2) \226\134\146 k1 == k2
      #|  (x : Real) => real_of_num(1)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, defint((a, a), f, real_of_num(0))
      #|  2
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x * inv(real_of_num(2)) <= y * inv(real_of_num(2))) == (x <= y)
      #|  real_of_num(0) < (e : Real)
      #|  (a : Real) * (b : Real) * (c : Real) == a * c * b
      #|  (v : Real) - (u : Real)
      #|  (e : Real) / real_of_num(2) * abs((x : Real) - (u : Real))
      #|  2
      #|  \226\136\128 x : Real, \226\136\128 y : Real, (x * inv(real_of_num(2)) <= y * inv(real_of_num(2))) == (x <= y)
      #|  real_of_num(0) < (e : Real)
      #|  (a : Real) * (b : Real) * (c : Real) == a * c * b
      #|  (v : Real) - (u : Real)
      #|  (e : Real) / real_of_num(2) * abs((v : Real) - (x : Real))
      #|  (a : Real) + (b : Real) + ((c : Real) + (d : Real)) == b + c + (a + d)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a - b + (b - c) == a - c
      #|  (f : (Real) -> Real)((x : Real)) - f((u : Real)) - (f' : (Real) -> Real)(x) * (x - u)
      #|  (f : (Real) -> Real)((v : Real)) - f((x : Real)) - (f' : (Real) -> Real)(x) * (v - x)
      #|  abs((f : (Real) -> Real)((v : Real)) - f((x : Real)) - (f' : (Real) -> Real)(x) * (v - x)) + abs(f(x) - f((u : Real)) - f'(x) * (x - u))
      #|  (x : Real)
      #|  (u : Real) <= (v : Real)
      #|  (d : Real)
      #|  real_of_num(0) < abs((z : Real) - (x : Real))
      #|  !(real_of_num(0) < abs((z : Real) - (x : Real)))
      #|  real_of_num(0) < abs((z : Real) - (x : Real))
      #|  \226\136\128 z : Real, abs(z - (x : Real)) < (d : Real) \226\134\146 abs((f : (Real) -> Real)(z) - f(x) - (f' : (Real) -> Real)(x) * (z - x)) <= (e : Real) / real_of_num(2) * abs(z - x)
      #|  (d : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (x : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  (a : Real) <= (x : Real) && x <= (b : Real)
      #|  (g : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  \226\136\128 x : Real, (a : Real) <= x && x <= (b : Real) \226\134\146 (\226\136\131 d : Real, real_of_num(0) < d && (\226\136\128 u : Real, \226\136\128 v : Real, u <= x && x <= v && v - u < d \226\134\146 abs((f : (Real) -> Real)(v) - f(u) - (f' : (Real) -> Real)(x) * (v - u)) <= (e : Real) * (v - u)))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 f' : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 e : Real, (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(f, f'(x), x)) && real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, gauge((x : Real) => a <= x && x <= b, g) && (\226\136\128 x : Real, \226\136\128 u : Real, \226\136\128 v : Real, a <= u && u <= x && x <= v && v <= b && v - u < g(x) \226\134\146 abs(f(v) - f(u) - f'(x) * (v - u)) <= e * (v - u)))
      #|  fine((g : (Real) -> Real), ((D : (Num) -> Real), (p : (Num) -> Real)))
      #|  (r : Num)
      #|  ((n : Num) => (D : (Num) -> Real)(SUC(n)) - D(n))((n : Num))
      #|  (e : Real) == sum((0, dsize((D : (Num) -> Real))), (n : Num) => e / ((b : Real) - (a : Real)) * (D(SUC(n)) - D(n)))
      #|  dsize((D : (Num) -> Real))
      #|  0
      #|  (n : Num) => (f : (Real) -> Real)((D : (Num) -> Real)(n))
      #|  (f : (Real) -> Real)((b : Real)) - f((a : Real)) == sum((0, dsize((D : (Num) -> Real))), (n : Num) => f(D(SUC(n))) - f(D(n)))
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  real_of_num(0) < (e : Real) / ((b : Real) - (a : Real))
      #|  (e : Real) / ((b : Real) - (a : Real))
      #|  (b : Real)
      #|  (a : Real)
      #|  (f' : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (e : Real)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (g : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  (e : Real) / real_of_num(2)
      #|  \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, gauge((x : Real) => (a : Real) <= x && x <= (b : Real), g) && (\226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, tdiv((a, b), (D, p)) && fine(g, (D, p)) \226\134\146 abs(rsum((D, p), (f' : (Real) -> Real)) - ((f : (Real) -> Real)(b) - f(a))) <= e))
      #|  (e : Real)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 f' : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(f, f'(x), x)) \226\134\146 defint((a, b), f', f(b) - f(a))
      #|  (integrable : ((Real, Real), (Real) -> Real) -> Bool)(((a : Real), (b : Real)), (f : (Real) -> Real)) == (\226\136\131 i : Real, defint((a, b), f, i))
      #|  (integral : ((Real, Real), (Real) -> Real) -> Real)(((a : Real), (b : Real)), (f : (Real) -> Real)) == select((i : Real) => defint((a, b), f, i))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, integrable((a, b), f) \226\134\146 defint((a, b), f, integral((a, b), f))
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), d) \226\134\146 (\226\136\128 n : Num, a <= d(n) && d(n) <= b)
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 p : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, tdiv((a, b), (d, p)) \226\134\146 (\226\136\128 n : Num, a <= d(n) && d(n) <= b && a <= p(n) && p(n) <= b)
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 p : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, tdiv((a, b), (d, p)) \226\134\146 a <= b
      #|  (b : Real) < (a : Real) \226\134\146 (a <= (x : Real) && x <= b) == false
      #|  (x : Real) => real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 f : (Real) -> Real, \226\136\128 i : Real, b < a \226\134\146 defint((a, b), f, i)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, a <= b && defint((a, b), f, i) \226\134\146 integral((a, b), f) == i
      #|  (x : Real) => (c : Real) * x
      #|  (x : Real)
      #|  (b : Real) < (a : Real) || a <= b
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => (c : Real)
      #|  (x : Real) => (c : Real) * x
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, defint((a, b), (x : Real) => c, c * (b - a))
      #|  real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, defint((a, b), (x : Real) => real_of_num(0), real_of_num(0))
      #|  abs(-(x : Real) - -(y : Real)) == abs(x - y)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, defint((a, b), f, i) \226\134\146 defint((a, b), (x : Real) => -f(x), -i)
      #|  (e : Real) / abs((c : Real))
      #|  (e : Real)
      #|  (c : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (c : Real) == real_of_num(0)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 i : Real, defint((a, b), f, i) \226\134\146 defint((a, b), (x : Real) => c * f(x), c * i)
      #|  abs((x : Real) - (i : Real)) < (e : Real) / real_of_num(2) && abs((y : Real) - (j : Real)) < e / real_of_num(2) \226\134\146 abs(x + y - (i + j)) < e
      #|  (x : Real) => if (g1 : (Real) -> Real)(x) < (g2 : (Real) -> Real)(x) { g1(x) } else { g2(x) }
      #|  (g2 : (Real) -> Real)
      #|  (g1 : (Real) -> Real)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, \226\136\128 j : Real, defint((a, b), f, i) && defint((a, b), g, j) \226\134\146 defint((a, b), (x : Real) => f(x) + g(x), i + j)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, \226\136\128 j : Real, defint((a, b), f, i) && defint((a, b), g, j) \226\134\146 defint((a, b), (x : Real) => f(x) - g(x), i - j)
      #|  (r : Num)
      #|  (ih : Real) - (ig : Real) == (e : Real) && real_of_num(0) < e && (sh : Real) <= (sg : Real) \226\134\146 abs(sg - ig) < e / real_of_num(2) \226\134\146 !(abs(sh - ih) < e / real_of_num(2))
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (x : Real) => if (g1 : (Real) -> Real)(x) < (g2 : (Real) -> Real)(x) { g1(x) } else { g2(x) }
      #|  (b : Real)
      #|  (a : Real)
      #|  (g2 : (Real) -> Real)
      #|  (g1 : (Real) -> Real)
      #|  (real_of_num(0) < (e : Real) / real_of_num(2)) == (real_of_num(0) < e)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real) == integral(((a : Real), (b : Real)), (f : (Real) -> Real)) - integral((a, b), (g : (Real) -> Real))
      #|  !(real_of_num(0) < (x : Real) - (y : Real)) \226\134\146 x <= y
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : _, \226\136\128 j : _, a <= b && integrable((a, b), f) && integrable((a, b), g) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 f(x) <= g(x)) \226\134\146 integral((a, b), f) <= integral((a, b), g)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, \226\136\128 j : Real, a <= b && defint((a, b), f, i) && defint((a, b), g, j) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 f(x) <= g(x)) \226\134\146 i <= j
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => abs((f : (Real) -> Real)(x))
      #|  (f : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (x : Real) => -abs((f : (Real) -> Real)(x))
      #|  -(a : Real) <= (b : Real) && b <= a \226\134\146 abs(b) <= a
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, \226\136\128 j : Real, a <= b && defint((a, b), f, i) && defint((a, b), (x : Real) => abs(f(x)), j) \226\134\146 abs(i) <= j
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, \226\136\128 j : Real, a <= b && defint((a, b), f, i) && defint((a, b), g, j) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 f(x) == g(x)) \226\134\146 i == j
      #|  (x : Real) == (y : Real) \226\134\146 abs(x - (i : Real)) < (e : Real) \226\134\146 abs(y - i) < e
      #|  (p : (Num) -> Real)
      #|  (D : (Num) -> Real)
      #|  (d : (Real) -> Real)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 i : Real, defint((a, b), f, i) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 f(x) == g(x)) \226\134\146 defint((a, b), g, i)
      #|  (a : Real) + (b : Real) * (c : Real) == a + c * b
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 f' : (Real) -> Real, \226\136\128 g' : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(f, f'(x), x)) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(g, g'(x), x)) \226\134\146 defint((a, b), (x : Real) => f'(x) * g(x) + f(x) * g'(x), f(b) * g(b) - f(a) * g(a))
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), d) \226\134\146 (\226\136\128 n : Num, d(n) <= d(SUC(n)))
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), d) \226\134\146 (\226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 d(m) <= d(n))
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, division((a, b), d) \226\134\146 (\226\136\128 n : Num, d(n) <= d(SUC(n)))
      #|  SUC(dsize((d : (Num) -> Real)))
      #|  !(SUC((n : Num)) <= n)
      #|  SUC((n : Num))
      #|  (n : Num)
      #|  (n : Num) => n <= dsize((d : (Num) -> Real)) && d(n) <= (c : Real)
      #|  \226\136\128 d : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, division((a, b), d) && a <= c && c <= b \226\134\146 (\226\136\131 n : Num, n <= dsize(d) && d(n) <= c && c <= d(SUC(n)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 n : Num, division((a, b), d) && d(SUC(n)) == d(n) \226\134\146 dsize(d) <= n
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 n : Num, division((a, b), d) && d(n) < d(SUC(n)) \226\134\146 SUC(n) <= dsize(d)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 n : Num, division((a, b), d) && d(n) < d(SUC(n)) && d(SUC(SUC(n))) == d(SUC(n)) \226\134\146 dsize(d) == SUC(n)
      #|  (d : Num) <= 0 \226\134\146 d == 0
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 n : Num, division((a, b), d) && d(SUC(n)) == d(n) && (\226\136\128 i : Num, i < n \226\134\146 d(i) < d(SUC(i))) \226\134\146 dsize(d) == n
      #|  (m : Num) + (0 + 1) == 0 + (m + 1)
      #|  1 == 0 + 1
      #|  (a : Real) == (b : Real) \226\134\146 (x : Real) + a == b + x
      #|  !((n : Num) == 0)
      #|  (n : Num) == 1 + PRE(n)
      #|  (x : Real) == (y : Real) \226\134\146 abs(x - (i : Real)) < (e : Real) \226\134\146 abs(y - i) < e
      #|  !((k : Num) == 0)
      #|  (d : (Num) -> Real)((k : Num) + (m : Num))
      #|  (d : (Num) -> Real)(SUC((m : Num)))
      #|  !((p : (Num) -> Real)((k : Num) + (m : Num)) < (b : Real))
      #|  (b : Real) <= (a : Real) \226\134\146 (x : Real) < b \226\134\146 x < a
      #|  (b : Real) <= (d : (Num) -> Real)(SUC((m : Num)))
      #|  (d : (Num) -> Real)((m : Num)) <= (b : Real)
      #|  (k : Num) == 0
      #|  ((k : Num) + (m : Num) < m + (n : Num)) == (k < n)
      #|  (k : Num) + (m : Num)
      #|  (k : Num)
      #|  ((k : Num) + (m : Num) < m + (n : Num)) == (k < n)
      #|  (k : Num) < (n : Num)
      #|  (c : Real)
      #|  (b : Real)
      #|  dsize((i : Num) => if i == 0 { (b : Real) } else { (d : (Num) -> Real)(i + (m : Num)) }) == (n : Num)
      #|  ((k : Num) + (m : Num) < m + (n : Num)) == (k < n)
      #|  (k : Num) < (n : Num)
      #|  !((n : Num) == 0)
      #|  (n : Num)
      #|  (m : Num)
      #|  (a : Bool) && (a \226\134\146 (b : Bool) && (b && (c : Bool) \226\134\146 (d : Bool))) \226\134\146 (a && b \226\134\146 c) \226\134\146 d
      #|  (i : Num) => if i == 0 { (b : Real) } else { (p : (Num) -> Real)(i + (m : Num)) }
      #|  (i : Num) => if i == 0 { (b : Real) } else { (d : (Num) -> Real)(i + (m : Num)) }
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, tdiv(((b : Real), (c : Real)), (D, p)) && fine((g2 : (Real) -> Real), (D, p)) \226\134\146 abs(rsum((D, p), (f : (Real) -> Real)) - (j : Real)) < (e : Real) / real_of_num(2)
      #|  (x : Real) == (y : Real) \226\134\146 abs(x - (i : Real)) < (e : Real) \226\134\146 abs(y - i) < e
      #|  (m : Num) + 1 == 0 + SUC(m)
      #|  (k : Num) + SUC((m : Num))
      #|  SUC((m : Num))
      #|  (b : Real) <= (d : (Num) -> Real)(SUC((m : Num)))
      #|  SUC((k : Num) + (m : Num))
      #|  !((p : (Num) -> Real)(SUC((k : Num) + (m : Num))) < (b : Real))
      #|  (b : Real) <= (a : Real) \226\134\146 (x : Real) < b \226\134\146 x < a
      #|  (k : Num) < PRE((n : Num))
      #|  (k : Num) + SUC((m : Num))
      #|  (k : Num)
      #|  (k : Num) < PRE((n : Num))
      #|  SUC(PRE((n : Num)) + (m : Num)) >= m + n && SUC(SUC(PRE(n) + m)) >= m + n
      #|  (c : Real)
      #|  (b : Real)
      #|  dsize((i : Num) => (d : (Num) -> Real)(i + SUC((m : Num)))) == PRE((n : Num))
      #|  !((n : Num) == 0) && (k : Num) >= PRE(n) \226\134\146 SUC(k + (m : Num)) >= m + n
      #|  !((n : Num) == 0) && (k : Num) < PRE(n) \226\134\146 SUC(k + (m : Num)) < m + n
      #|  PRE((n : Num))
      #|  (a : Bool) && (a \226\134\146 (b : Bool) && (b && (c : Bool) \226\134\146 (d : Bool))) \226\134\146 (a && b \226\134\146 c) \226\134\146 d
      #|  (i : Num) => (p : (Num) -> Real)(i + SUC((m : Num)))
      #|  (i : Num) => (d : (Num) -> Real)(i + SUC((m : Num)))
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, tdiv(((b : Real), (c : Real)), (D, p)) && fine((g2 : (Real) -> Real), (D, p)) \226\134\146 abs(rsum((D, p), (f : (Real) -> Real)) - (j : Real)) < (e : Real) / real_of_num(2)
      #|  (d : (Num) -> Real)(SUC((m : Num))) == (b : Real)
      #|  !(SUC(SUC((m : Num))) <= m)
      #|  !(SUC((m : Num)) <= m)
      #|  (b : Real)
      #|  (a : Real)
      #|  !(SUC((m : Num)) <= m)
      #|  dsize((i : Num) => if i <= (m : Num) { (d : (Num) -> Real)(i) } else { (b : Real) }) == SUC(m)
      #|  (i : Num) < (m : Num) \226\134\146 i < m + (n : Num)
      #|  !(SUC((m : Num)) <= m)
      #|  (b : Real)
      #|  (a : Real)
      #|  dsize((i : Num) => if i <= (m : Num) { (d : (Num) -> Real)(i) } else { (b : Real) }) == m
      #|  (d : (Num) -> Real)((m : Num)) == (b : Real)
      #|  (x : Real) == (y : Real) \226\134\146 abs(x - (i : Real)) < (e : Real) \226\134\146 abs(y - i) < e
      #|  gauge((x : Real) => (a : Real) <= x && x <= (b : Real), (g1 : (Real) -> Real))
      #|  (b : Real)
      #|  (a : Real)
      #|  (d : Num) <= SUC((m : Num)) && !((n : Num) == 0) \226\134\146 (k : Num) < d \226\134\146 k < m + n
      #|  (k : Num) <= (m : Num) && !(k == m) \226\134\146 SUC(k) <= m
      #|  (d : (Num) -> Real)(SUC((k : Num)))
      #|  (d : (Num) -> Real)((m : Num))
      #|  (p : (Num) -> Real)((k : Num)) <= (b : Real)
      #|  (k : Num) <= (m : Num) && !((n : Num) == 0) \226\134\146 k < m + n
      #|  (k : Num) <= (m : Num)
      #|  (b : Real) <= (d : (Num) -> Real)(SUC((m : Num)))
      #|  (d : (Num) -> Real)((m : Num)) <= (b : Real)
      #|  ((m : Num) < m + (n : Num)) == !(n == 0)
      #|  (k : Num) == (m : Num)
      #|  (k : Num)
      #|  (SUC((n : Num)) <= (m : Num)) == (n <= m && !(m == n))
      #|  (k : Num)
      #|  (k : Num) < SUC((m : Num)) && !((n : Num) == 0) \226\134\146 k < m + n
      #|  (n : Num) < SUC((m : Num)) \226\134\146 (SUC(n) <= m) == !(m == n)
      #|  (n : Num) < SUC((m : Num)) \226\134\146 n <= m
      #|  (n : Num) >= SUC((m : Num)) \226\134\146 !(n <= m)
      #|  SUC((m : Num))
      #|  (i : Num) < (m : Num) \226\134\146 i < m + (n : Num)
      #|  (n : Num) >= (m : Num) \226\134\146 (n <= m) == (m == n)
      #|  (n : Num) < (m : Num) \226\134\146 n <= m && SUC(n) <= m
      #|  (m : Num)
      #|  (d : (Num) -> Real)((m : Num)) == (b : Real)
      #|  (k : Num) == (m : Num)
      #|  (SUC((n : Num)) <= (m : Num)) == (n <= m && !(m == n))
      #|  (k : Num)
      #|  (a : Bool) && (a \226\134\146 (b : Bool)) && (a && (c : Bool) \226\134\146 (d : Bool)) \226\134\146 (a && b \226\134\146 c) \226\134\146 d
      #|  (i : Num) => if i <= (m : Num) { (p : (Num) -> Real)(i) } else { (b : Real) }
      #|  (i : Num) => if i <= (m : Num) { (d : (Num) -> Real)(i) } else { (b : Real) }
      #|  \226\136\128 D : (Num) -> Real, \226\136\128 p : (Num) -> Real, tdiv(((a : Real), (b : Real)), (D, p)) && fine((g1 : (Real) -> Real), (D, p)) \226\134\146 abs(rsum((D, p), (f : (Real) -> Real)) - (i : Real)) < (e : Real) / real_of_num(2)
      #|  (b : Real)
      #|  \226\136\128 b : Real, abs((s1 : Real) + (x : Real) * (b - (a : Real)) - (i : Real)) < (e : Real) / real_of_num(2) && abs((s2 : Real) + x * ((c : Real) - b) - (j : Real)) < e / real_of_num(2) \226\134\146 abs(s1 + (x * (c - a) + s2) - (i + j)) < e
      #|  (b : Real) <= (d : (Num) -> Real)(SUC((m : Num)))
      #|  (d : (Num) -> Real)((m : Num)) <= (b : Real)
      #|  (m : Num)
      #|  ((m : Num) < m + (n : Num)) == !(n == 0)
      #|  (m : Num)
      #|  (p : (Num) -> Real)((m : Num)) == (b : Real)
      #|  !((n : Num) == 0) \226\134\146 n == 1 + PRE(n)
      #|  (n : Num) == 0
      #|  (n : Num)
      #|  (m : Num)
      #|  (b : Real)
      #|  (c : Real)
      #|  (a : Real)
      #|  (d : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (x : Real) => if x < (b : Real) { min((g1 : (Real) -> Real)(x), b - x) } else { if b < x { min((g2 : (Real) -> Real)(x), x - b) } else { min(g1(x), g2(x)) } }
      #|  (g2 : (Real) -> Real)
      #|  (g1 : (Real) -> Real)
      #|  (e : Real) / real_of_num(2)
      #|  (b : Real) == (c : Real)
      #|  (b : Real) <= (c : Real)
      #|  (a : Real) == (b : Real)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 i : Real, \226\136\128 j : Real, a <= b && b <= c && defint((a, b), f, i) && defint((b, c), f, j) \226\134\146 defint((a, c), f, i + j)
      #|  (e : Real)
      #|  (k : Num)
      #|  (k : Num) + (m : Num)
      #|  (k : Num)
      #|  (k : Num) + (m : Num)
      #|  (k : Num)
      #|  (k : Num) + (m : Num)
      #|  (k : Num)
      #|  (r : Num)
      #|  0
      #|  (r : Num)
      #|  1
      #|  (r : Num)
      #|  (real_of_num(0) <= (x : Real) && x < (e : Real)) && (y : Real) == real_of_num(0) \226\134\146 abs(x + y) < e
      #|  !((n : Num) == 0) \226\134\146 n == 1 + PRE(n)
      #|  dsize((d : (Num) -> Real)) == 0
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (x : Real) => (e : Real)
      #|  (e : Real)
      #|  (b : Real) < (a : Real) || a <= b
      #|  \226\136\128 a : Real, \226\136\128 b : Real, defint((a, b), (x : Real) => if x == a { real_of_num(1) } else { real_of_num(0) }, real_of_num(0))
      #|  (x : Num) < x + 1
      #|  (m : Num) + 1
      #|  (m : Num)
      #|  (m : Num)
      #|  SUC((r : Num))
      #|  (r : Num)
      #|  (r : Num)
      #|  (m : Num) < m + 1
      #|  (real_of_num(0) <= (x : Real) && x < (e : Real)) && (y : Real) == real_of_num(0) \226\134\146 abs(y + x) < e
      #|  (m : Num) == PRE(dsize((d : (Num) -> Real)))
      #|  !((n : Num) == 0) \226\134\146 n == PRE(n) + 1
      #|  dsize((d : (Num) -> Real)) == 0
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (x : Real) => (e : Real)
      #|  (e : Real)
      #|  (b : Real) < (a : Real) || a <= b
      #|  \226\136\128 a : Real, \226\136\128 b : Real, defint((a, b), (x : Real) => if x == b { real_of_num(1) } else { real_of_num(0) }, real_of_num(0))
      #|  (c : Real)
      #|  (x : Real) => real_of_num(0)
      #|  (a : Real) <= (c : Real) && c <= (b : Real)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, defint((a, b), (x : Real) => if x == c { real_of_num(1) } else { real_of_num(0) }, real_of_num(0))
      #|  (i : Real) == i + ((g : (Real) -> Real)((c : Real)) - (f : (Real) -> Real)(c)) * real_of_num(0)
      #|  (x : Real) => (f : (Real) -> Real)(x) + ((g : (Real) -> Real)((c : Real)) - f(c)) * (if x == c { real_of_num(1) } else { real_of_num(0) })
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 i : Real, (\226\136\128 x : Real, a <= x && x <= b && !(x == c) \226\134\146 f(x) == g(x)) && defint((a, b), f, i) \226\134\146 defint((a, b), g, i)
      #|  (c : Real)
      #|  (x : Real) => if x == (c : Real) { (f : (Real) -> Real)(x) } else { (g : (Real) -> Real)(x) }
      #|  (g : (Real) -> Real)
      #|  (s : (Real) -> Bool)
      #|  (c : Real)
      #|  (s : (Real) -> Bool)
      #|  (g : (Real) -> Real)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) \226\134\146 (d : Bool)) == (c \226\134\146 a \226\134\146 b \226\134\146 d)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 s : (Real) -> Bool, \226\136\128 i : Real, FINITE(s) && (\226\136\128 x : Real, a <= x && x <= b && !IN(x, s) \226\134\146 f(x) == g(x)) && defint((a, b), f, i) \226\134\146 defint((a, b), g, i)
      #|  (x : Real) => if (gm : (Real) -> Real)(x) < (gs : (Num, Real) -> Real)(SUC((n : Num)), x) { gm(x) } else { gs(SUC(n), x) }
      #|  (gm : (Real) -> Real)
      #|  ((a : Bool) || (b : Bool) \226\134\146 (c : Bool)) == ((a \226\134\146 c) && (b \226\134\146 c))
      #|  \226\136\128 s : (Real) -> Bool, \226\136\128 gs : (Num, Real) -> Real, \226\136\128 n : Num, (\226\136\128 m : Num, m <= n \226\134\146 gauge(s, gs(m))) \226\134\146 (\226\136\131 g : (Real) -> Real, gauge(s, g) && (\226\136\128 d : (Num) -> Real, \226\136\128 p : (Num) -> Real, fine(g, (d, p)) \226\134\146 (\226\136\128 m : Num, m <= n \226\134\146 fine(gs(m), (d, p)))))
      #|  pow(real_of_num(2), (N2 : Num))
      #|  abs((s1 : Real) - (i : Real)) < (e : Real) / real_of_num(2) \226\134\146 (d : Real) < e / real_of_num(2) \226\134\146 abs((s2 : Real) - s1) < d \226\134\146 abs(s2 - i) < e
      #|  (p : (Num, Num) -> Real)((N1 : Num) + (N2 : Num))
      #|  (d : (Num, Num) -> Real)((N1 : Num) + (N2 : Num))
      #|  (px : (Num) -> Real)
      #|  (dx : (Num) -> Real)
      #|  (N1 : Num) + (N2 : Num)
      #|  (px : (Num) -> Real)
      #|  (dx : (Num) -> Real)
      #|  (G : (Num, Real) -> Real)((N1 : Num) + (N2 : Num))
      #|  (N1 : Num) + (N2 : Num)
      #|  real_of_num(2) / (e : Real)
      #|  (N2 : Num)
      #|  (N1 : Num)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (i : Real)
      #|  (d : Real) < (e : Real) \226\134\146 (x : Real) < d \226\134\146 x < e
      #|  (p : (Num, Num) -> Real)((n : Num))
      #|  (d : (Num, Num) -> Real)((n : Num))
      #|  (p : (Num, Num) -> Real)((m : Num))
      #|  (d : (Num, Num) -> Real)((m : Num))
      #|  (N : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (N : Num)
      #|  real_of_num(1) / (e : Real)
      #|  (e : Real)
      #|  cauchy((n : Num) => rsum(((d : (Num, Num) -> Real)(n), (p : (Num, Num) -> Real)(n)), (f : (Real) -> Real)))
      #|  (p : (Num, Num) -> Real)
      #|  (d : (Num, Num) -> Real)
      #|  (G : (Num, Real) -> Real)((n : Num))
      #|  (b : Real)
      #|  (a : Real)
      #|  (n : Num)
      #|  (G : (Num, Real) -> Real)
      #|  (n : Num)
      #|  (g : (Num, Real) -> Real)
      #|  (x : Real) => (a : Real) <= x && x <= (b : Real)
      #|  (n : Num)
      #|  (g : (Num, Real) -> Real)
      #|  real_of_num(1) / pow(real_of_num(2), (n : Num))
      #|  (n : Num)
      #|  (b : Real) < (a : Real) || a <= b
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p1 : (Num) -> Real)
      #|  (d1 : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (i : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, integrable((a, b), f) == (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, gauge((x : Real) => a <= x && x <= b, g) && (\226\136\128 d1 : (Num) -> Real, \226\136\128 p1 : (Num) -> Real, \226\136\128 d2 : (Num) -> Real, \226\136\128 p2 : (Num) -> Real, tdiv((a, b), (d1, p1)) && fine(g, (d1, p1)) && tdiv((a, b), (d2, p2)) && fine(g, (d2, p2)) \226\134\146 abs(rsum((d1, p1), f) - rsum((d2, p2), f)) < e)))
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p1 : (Num) -> Real)
      #|  (d1 : (Num) -> Real)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, sum((m, n), (i : Num) => (d : (Num) -> Real)(SUC(i)) - d(i)) == d(m + n) - d(m)
      #|  (a : Real) <= (d0 : Real) && (d1 : Real) <= (b : Real) \226\134\146 d1 - d0 <= b - a
      #|  (a : Real)
      #|  (r : Num)
      #|  sum((0, dsize((d : (Num) -> Real))), (i : Num) => (e : Real) * abs(d(SUC(i)) - d(i)))
      #|  sum((0, dsize((d : (Num) -> Real))), (i : Num) => abs((f : (Real) -> Real)((p : (Num) -> Real)(i)) * (d(SUC(i)) - d(i))))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 p : (Num) -> Real, \226\136\128 e : Real, \226\136\128 f : (Real) -> Real, tdiv((a, b), (d, p)) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 abs(f(x)) <= e) \226\134\146 abs(rsum((d, p), f)) <= e * (b - a)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 d : (Num) -> Real, \226\136\128 p : (Num) -> Real, \226\136\128 e : Real, \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, tdiv((a, b), (d, p)) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 abs(f(x) - g(x)) <= e) \226\134\146 abs(rsum((d, p), f) - rsum((d, p), g)) <= e * (b - a)
      #|  (N2 : Num) <= (N1 : Num) + N2
      #|  pow(real_of_num(2), (N2 : Num))
      #|  (real_of_num(1) / (n : Real) * (x : Real) <= (e : Real) / real_of_num(3)) == (real_of_num(3) * x / n <= e)
      #|  real_of_num(1) / pow(real_of_num(2), (N1 : Num) + (N2 : Num)) * ((b : Real) - (a : Real))
      #|  abs((sf : Real) - (sg : Real)) <= (e : Real) / real_of_num(3) \226\134\146 abs((i : Real) - (s : Real)) < e / real_of_num(3) \226\134\146 abs(sg - i) < e / real_of_num(3) \226\134\146 abs(sf - s) < e
      #|  (N1 : Num) <= N1 + (N2 : Num)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (e : Real) / real_of_num(3)
      #|  (N1 : Num) + (N2 : Num)
      #|  (N2 : Num)
      #|  real_of_num(3) * ((b : Real) - (a : Real)) / (e : Real)
      #|  (N1 : Num)
      #|  (e : Real) / real_of_num(3)
      #|  (e : Real)
      #|  (s : Real)
      #|  (real_of_num(2) / (n : Real) * (x : Real) <= (e : Real) / real_of_num(2)) == (real_of_num(4) * x / n <= e)
      #|  real_of_num(1) / pow(real_of_num(2), (n : Num))
      #|  real_of_num(1) / pow(real_of_num(2), (m : Num))
      #|  (f : (Real) -> Real)((x : Real))
      #|  \226\136\128 f : Real, abs(f - (gm : Real)) <= inv((k : Real)) && abs(f - (gn : Real)) <= inv(k) \226\134\146 abs(gm - gn) <= real_of_num(2) / k
      #|  real_of_num(2) / pow(real_of_num(2), (N : Num)) * ((b : Real) - (a : Real))
      #|  abs(rsum(((d : (Num) -> Real), (p : (Num) -> Real)), (g : (Num, Real) -> Real)((m : Num))) - rsum((d, p), g((n : Num)))) <= (e : Real) / real_of_num(2)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (x : Real) => if (gm : (Real) -> Real)(x) < (gn : (Real) -> Real)(x) { gm(x) } else { gn(x) }
      #|  (b : Real)
      #|  (a : Real)
      #|  (gm : (Real) -> Real)
      #|  (gn : (Real) -> Real)
      #|  (e : Real) / real_of_num(4)
      #|  (n : Num)
      #|  (m : Num)
      #|  (N : Num)
      #|  real_of_num(4) * ((b : Real) - (a : Real)) / (e : Real)
      #|  (e : Real)
      #|  cauchy((i : (Num) -> Real))
      #|  (i : (Num) -> Real)
      #|  (g : (Num, Real) -> Real)
      #|  real_of_num(1) / pow(real_of_num(2), (n : Num))
      #|  (n : Num)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, (\226\136\128 x : Real, a <= x && x <= b \226\134\146 abs(f(x) - g(x)) <= e) && integrable((a, b), g))) \226\134\146 integrable((a, b), f)
      #|  (n : Num)
      #|  (m : Num)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, integrable((a, b), (x : Real) => c)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= b && b <= c && integrable((a, b), f) && integrable((b, c), f) \226\134\146 integrable((a, c), f)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, (\226\136\128 x : Real, a <= x && x <= b && !(x == c) \226\134\146 f(x) == g(x)) && integrable((a, b), f) \226\134\146 integrable((a, b), g)
      #|  (x : Real) => (f : (Real) -> Real)((u : Real))
      #|  (v : Real)
      #|  (u : Real)
      #|  (d : Real)
      #|  (x : Real)
      #|  (b : Real) <= (x : Real) && x <= (c : Real) && !(x == b) \226\134\146 !(x <= b)
      #|  (v : Real)
      #|  (h : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  (v : Real)
      #|  (x : Real) => if x <= (v : Real) { (g : (Real) -> Real)(x) } else { (h : (Real) -> Real)(x) }
      #|  (h : (Real) -> Real)
      #|  (g : (Real) -> Real)
      #|  ((a : Bool) && (b : Bool)) && ((c : Bool) && (d : Bool) \226\134\146 (e : Bool)) \226\134\146 (a \226\134\146 c) && (b \226\134\146 d) \226\134\146 e
      #|  (w : Real)
      #|  (v : Real)
      #|  (u : Real)
      #|  (a : Real)
      #|  (b : Real)
      #|  (a : Real) <= (b : Real)
      #|  (d : Real)
      #|  (e : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  (f : (Real) -> Real)
      #|  (e : Real)
      #|  (b : Real) < (a : Real) || a <= b
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\128 x : Real, a <= x && x <= b \226\134\146 contl(f, x)) \226\134\146 integrable((a, b), f)
      #|  (g : (Real) -> Real)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real)
      #|  (i : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= c && c <= b && integrable((a, b), f) \226\134\146 (\226\136\131 i : Real, \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 g : (Real) -> Real, gauge((x : Real) => a <= x && x <= b, g) && (\226\136\128 d1 : (Num) -> Real, \226\136\128 p1 : (Num) -> Real, \226\136\128 d2 : (Num) -> Real, \226\136\128 p2 : (Num) -> Real, tdiv((a, c), (d1, p1)) && fine(g, (d1, p1)) && tdiv((c, b), (d2, p2)) && fine(g, (d2, p2)) \226\134\146 abs(rsum((d1, p1), f) + rsum((d2, p2), f) - i) < e)))
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (b : Real)
      #|  (c : Real)
      #|  (g : (Real) -> Real)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (i : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= c && c <= b && integrable((a, b), f) \226\134\146 integrable((a, c), f)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p1 : (Num) -> Real)
      #|  (d1 : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (p : (Num) -> Real)
      #|  (d : (Num) -> Real)
      #|  (g : (Real) -> Real)
      #|  (c : Real)
      #|  (a : Real)
      #|  (g : (Real) -> Real)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (e : Real)
      #|  (i : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= c && c <= b && integrable((a, b), f) \226\134\146 integrable((c, b), f)
      #|  (p2 : (Num) -> Real)
      #|  (d2 : (Num) -> Real)
      #|  (p1 : (Num) -> Real)
      #|  (d1 : (Num) -> Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a <= c && c <= d && d <= b && integrable((a, b), f) \226\134\146 integrable((c, d), f)
      #|  (\226\136\128 x : Real, contl((f : (Real) -> Real), x)) \226\134\146 integrable(((a : Real), (b : Real)), f)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= b \226\134\146 integral((a, b), (x : Real) => c) == c * (b - a)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 c : Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && integrable((a, b), f) \226\134\146 integral((a, b), (x : Real) => c * f(x)) == c * integral((a, b), f)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && integrable((a, b), f) && integrable((a, b), g) \226\134\146 integral((a, b), (x : Real) => f(x) + g(x)) == integral((a, b), f) + integral((a, b), g)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && integrable((a, b), f) && integrable((a, b), g) \226\134\146 integral((a, b), (x : Real) => f(x) - g(x)) == integral((a, b), f) - integral((a, b), g)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 f' : (Real) -> Real, \226\136\128 g' : (Real) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= b && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(f, f'(x), x)) && (\226\136\128 x : Real, a <= x && x <= b \226\134\146 diffl(g, g'(x), x)) && integrable((a, b), (x : Real) => f'(x) * g(x)) && integrable((a, b), (x : Real) => f(x) * g'(x)) \226\134\146 integral((a, b), (x : Real) => f(x) * g'(x)) == f(b) * g(b) - f(a) * g(a) - integral((a, b), (x : Real) => f'(x) * g(x))
      #|  (t0 : Real)
      #|  (t : Real)
      #|  (t : Real)
      #|  (t0 : Real)
      #|  (difg : (Num, Real) -> Real)(SUC(SUC((m : Num))), (t : Real))
      #|  \226\136\128 t : Real, real_of_num(0) <= t && t <= (t0 : Real) \226\134\146 differentiable((difg : (Num, Real) -> Real)(SUC((m : Num))), t)
      #|  SUC((m : Num))
      #|  (t0 : Real)
      #|  (difg : (Num, Real) -> Real)((m : Num))
      #|  (difg : (Num, Real) -> Real)(SUC((m : Num)), real_of_num(0)) == real_of_num(0)
      #|  \226\136\131 t : Real, real_of_num(0) < t && t < (t0 : Real) && diffl((difg : (Num, Real) -> Real)(SUC((m : Num))), real_of_num(0), t)
      #|  (t0 : Real)
      #|  SUC((m : Num))
      #|  (m : Num) < (n : Num)
      #|  (difg : (Num, Real) -> Real)(0) == (g : (Real) -> Real)
      #|  (difg : (Num, Real) -> Real)(SUC(0), (t : Real))
      #|  \226\136\128 t : Real, real_of_num(0) <= t && t <= (h : Real) \226\134\146 differentiable((g : (Real) -> Real), t)
      #|  (t : Real)
      #|  (difg : (Num, Real) -> Real)((m : Num))
      #|  (t : Real)
      #|  (t : Real)
      #|  \226\136\128 m : Num, m < (n : Num) \226\134\146 (\226\136\131 t : Real, real_of_num(0) < t && t < (h : Real) && diffl((difg : (Num, Real) -> Real)(m), real_of_num(0), t))
      #|  1
      #|  (d : Num)
      #|  (j : (Num) -> Real)
      #|  (j : (Num) -> Real)
      #|  (d : Num)
      #|  (m : Num)
      #|  \226\136\128 m : Num, m < (n : Num) \226\134\146 (difg : (Num, Real) -> Real)(m, real_of_num(0)) == real_of_num(0)
      #|  (a : Real) * (b : Real) * (c : Real) == a * (c * b)
      #|  (difg : (Num, Real) -> Real)(SUC((r : Num)), (t : Real)) == real_of_num(0)
      #|  (t : Real)
      #|  (t : Real)
      #|  (r : Num)
      #|  \226\136\128 m : Num, m < (n : Num) \226\134\146 (\226\136\131 t : Real, real_of_num(0) < t && t < (h : Real) && (difg : (Num, Real) -> Real)(SUC(m), t) == real_of_num(0))
      #|  real_of_num(SUC((k : Num))) == inv(inv(real_of_num(SUC(k))))
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == c * (a * d * b)
      #|  (z : Real)
      #|  (t : Real)
      #|  (k : Num)
      #|  (t : Real)
      #|  (d : Num)
      #|  0
      #|  (p : Num) => (x : Real) => (diff : (Num, Real) -> Real)(p + SUC((m : Num)), real_of_num(0)) / real_of_num(FACT(p)) * pow(x, p)
      #|  (p : Num) => (x : Real) => (diff : (Num, Real) -> Real)(p + 1 + (m : Num), real_of_num(0)) / real_of_num(FACT(p + 1)) * pow(x, p + 1)
      #|  (d : Num)
      #|  (a : Real) * ((b : Real) * ((c : Real) * ((d : Real) * ((e : Real) * ((f : Real) * (g : Real)))))) == b * a * (d * f * (c * g * e))
      #|  (d : Num)
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == b * (a * (d * c))
      #|  (t : Real)
      #|  (t : Real)
      #|  \226\136\128 m : Num, \226\136\128 t : Real, m < (n : Num) && real_of_num(0) <= t && t <= (h : Real) \226\134\146 diffl((difg : (Num, Real) -> Real)(m), difg(SUC(m), t), t)
      #|  (difg : (Num, Real) -> Real)(0) == (g : (Real) -> Real)
      #|  (difg : (Num, Real) -> Real) == ((m : Num) => (t : Real) => (diff : (Num, Real) -> Real)(m, t) - (sum((0, (n : Num) - m), (p : Num) => diff(m + p, real_of_num(0)) / real_of_num(FACT(p)) * pow(t, p)) + (B : Real) * (pow(t, n - m) / real_of_num(FACT(n - m)))))
      #|  1
      #|  (r : Num)
      #|  (j : (Num) -> Real)
      #|  (j : (Num) -> Real)
      #|  (g : (Real) -> Real)(real_of_num(0)) == real_of_num(0) && g((h : Real)) == real_of_num(0)
      #|  (g : (Real) -> Real) == ((t : Real) => (f : (Real) -> Real)(t) - (sum((0, (n : Num)), (m : Num) => (diff : (Num, Real) -> Real)(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(t, m)) + (B : Real) * (pow(t, n) / real_of_num(FACT(n)))))
      #|  (B : Real)
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == d * a * (b * c)
      #|  ((f : (Real) -> Real)((h : Real)) - sum((0, (n : Num)), (m : Num) => (diff : (Num, Real) -> Real)(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(h, m))) * (real_of_num(FACT(n)) / pow(h, n))
      #|  \226\136\131 B : Real, (f : (Real) -> Real)((h : Real)) == sum((0, (n : Num)), (m : Num) => (diff : (Num, Real) -> Real)(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(h, m)) + B * (pow(h, n) / real_of_num(FACT(n)))
      #|  (n : Num)
      #|  (r : Num)
      #|  0 < (n : Num)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 diff : (Num, Real) -> Real, \226\136\128 h : Real, \226\136\128 n : Num, real_of_num(0) < h && 0 < n && diff(0) == f && (\226\136\128 m : Num, \226\136\128 t : Real, m < n && real_of_num(0) <= t && t <= h \226\134\146 diffl(diff(m), diff(SUC(m), t), t)) \226\134\146 (\226\136\131 t : Real, real_of_num(0) < t && t < h && f(h) == sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(h, m)) + diff(n, t) / real_of_num(FACT(n)) * pow(h, n))
      #|  (a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == b * c * (a * d)
      #|  (m : Num)
      #|  -(t : Real)
      #|  (t : Real)
      #|  (z : Real)
      #|  pow(-real_of_num(1), (m : Num))
      #|  (x : Real) => -x
      #|  (t : Real)
      #|  ((a : Bool) && (b : Bool) && (c : Bool)) == (a && c && b)
      #|  (n : Num)
      #|  -(h : Real)
      #|  (n : Num) => (x : Real) => pow(-real_of_num(1), n) * (diff : (Num, Real) -> Real)(n, -x)
      #|  (x : Real) => (f : (Real) -> Real)(-x)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 diff : (Num, Real) -> Real, \226\136\128 h : Real, \226\136\128 n : Num, h < real_of_num(0) && 0 < n && diff(0) == f && (\226\136\128 m : Num, \226\136\128 t : Real, m < n && h <= t && t <= real_of_num(0) \226\134\146 diffl(diff(m), diff(SUC(m), t), t)) \226\134\146 (\226\136\131 t : Real, h < t && t < real_of_num(0) && f(h) == sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(h, m)) + diff(n, t) / real_of_num(FACT(n)) * pow(h, n))
      #|  (x : Real) < (t : Real) && t < real_of_num(0) \226\134\146 abs(t) <= abs(x)
      #|  (x : Real) <= (t : Real) && t <= real_of_num(0) \226\134\146 abs(t) <= abs(x)
      #|  (n : Num)
      #|  (x : Real)
      #|  (diff : (Num, Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  real_of_num(0) < (t : Real) && t < (x : Real) \226\134\146 abs(t) <= abs(x)
      #|  real_of_num(0) <= (t : Real) && t <= (x : Real) \226\134\146 abs(t) <= abs(x)
      #|  (n : Num)
      #|  (x : Real)
      #|  (diff : (Num, Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  !((x : Real) == real_of_num(0)) \226\134\146 real_of_num(0) < x || x < real_of_num(0)
      #|  (n : Num)
      #|  (n : Num)
      #|  !((n : Num) == 0)
      #|  real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  (x : Real)
      #|  (n : Num) == 0
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 diff : (Num, Real) -> Real, \226\136\128 x : Real, \226\136\128 n : Num, diff(0) == f && (\226\136\128 m : Num, \226\136\128 t : Real, m < n && abs(t) <= abs(x) \226\134\146 diffl(diff(m), diff(SUC(m), t), t)) \226\134\146 (\226\136\131 t : Real, abs(t) <= abs(x) && f(x) == sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(x, m)) + diff(n, t) / real_of_num(FACT(n)) * pow(x, n))
      #|  (t : Real) < (x : Real)
      #|  real_of_num(0) < (t : Real)
      #|  (t : Real)
      #|  (t : Real)
      #|  (n : Num)
      #|  (x : Real)
      #|  (diff : (Num, Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (x : Real) < (t : Real)
      #|  (t : Real) < real_of_num(0)
      #|  (t : Real)
      #|  (t : Real)
      #|  (n : Num)
      #|  (x : Real)
      #|  (diff : (Num, Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 diff : (Num, Real) -> Real, diff(0) == f && (\226\136\128 m : Num, \226\136\128 x : Real, diffl(diff(m), diff(SUC(m), x), x)) \226\134\146 (\226\136\128 x : Real, \226\136\128 n : Num, !(x == real_of_num(0)) && 0 < n \226\134\146 (\226\136\131 t : Real, real_of_num(0) < abs(t) && abs(t) < abs(x) && f(x) == sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(x, m)) + diff(n, t) / real_of_num(FACT(n)) * pow(x, n)))
      #|  (n : Num)
      #|  (n : Num)
      #|  0 < (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 diff : (Num, Real) -> Real, \226\136\128 n : Num, \226\136\128 x : Real, x == real_of_num(0) && 0 < n \226\134\146 sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(x, m)) == diff(0, real_of_num(0))
      #|  (t : Real)
      #|  (t : Real)
      #|  pow(real_of_num(0), (n : Num)) == real_of_num(0)
      #|  real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  (x : Real)
      #|  0
      #|  (n : Num)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 diff : (Num, Real) -> Real, diff(0) == f && (\226\136\128 m : Num, \226\136\128 x : Real, diffl(diff(m), diff(SUC(m), x), x)) \226\134\146 (\226\136\128 x : Real, \226\136\128 n : Num, \226\136\131 t : Real, abs(t) <= abs(x) && f(x) == sum((0, n), (m : Num) => diff(m, real_of_num(0)) / real_of_num(FACT(m)) * pow(x, m)) + diff(n, t) / real_of_num(FACT(n)) * pow(x, n))
      #|  ((n : Num) => exp)(0) == exp && (\226\136\128 m : Num, \226\136\128 x : Real, diffl(((n : Num) => exp)(m), ((n : Num) => exp)(SUC(m), x), x))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, !(x == real_of_num(0)) && 0 < n \226\134\146 (\226\136\131 t : Real, real_of_num(0) < abs(t) && abs(t) < abs(x) && exp(x) == sum((0, n), (m : Num) => pow(x, m) / real_of_num(FACT(m))) + exp(t) / real_of_num(FACT(n)) * pow(x, n))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, \226\136\131 t : Real, abs(t) <= abs(x) && exp(x) == sum((0, n), (m : Num) => pow(x, m) / real_of_num(FACT(m))) + exp(t) / real_of_num(FACT(n)) * pow(x, n)
      #|  \226\136\128 g : (Real) -> Real, \226\136\128 m : Real, \226\136\128 x : Real, diffl(g, m, x) && real_of_num(0) < g(x) \226\134\146 diffl((x : Real) => ln(g(x)), inv(g(x)) * m, x)
      #|  real_of_num(0) <= (u : Real)
      #|  (p : Num)
      #|  (m : Num)
      #|  !((m : Num) == 0)
      #|  real_of_num(0) <= (u : Real)
      #|  !(pow(real_of_num(1) + (u : Real), (m : Num)) == real_of_num(0))
      #|  (u : Real)
      #|  real_of_num(0) <= (u : Real)
      #|  (u : Real)
      #|  (m : Num) == 0
      #|  (u : Real)
      #|  (m : Num)
      #|  \226\136\128 t : Real, pow(-real_of_num(1), SUC((n : Num))) * (real_of_num(FACT(PRE(n))) * inv(pow(real_of_num(1) + t, n))) / real_of_num(FACT(n)) * pow((x : Real), n) == pow(-real_of_num(1), SUC(n)) * (pow(x, n) / (real_of_num(n) * pow(real_of_num(1) + t, n)))
      #|  \226\136\128 p : Num, (if p == 0 { real_of_num(0) } else { pow(-real_of_num(1), SUC(p)) * real_of_num(FACT(PRE(p))) }) / real_of_num(FACT(p)) == pow(-real_of_num(1), SUC(p)) * inv(real_of_num(p))
      #|  (p : Num)
      #|  \226\136\128 p : Num, !(p == 0) \226\134\146 real_of_num(FACT(PRE(p))) / real_of_num(FACT(p)) == inv(real_of_num(p))
      #|  0 < (n : Num)
      #|  !((n : Num) == 0)
      #|  (n : Num)
      #|  (x : Real)
      #|  (n : Num) => (x : Real) => if n == 0 { ln(real_of_num(1) + x) } else { pow(-real_of_num(1), SUC(n)) * (real_of_num(FACT(PRE(n))) * inv(pow(real_of_num(1) + x, n))) }
      #|  (x : Real) => ln(real_of_num(1) + x)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) < x && 0 < n \226\134\146 (\226\136\131 t : Real, real_of_num(0) < t && t < x && ln(real_of_num(1) + x) == sum((0, n), (m : Num) => pow(-real_of_num(1), SUC(m)) * (pow(x, m) / real_of_num(m))) + pow(-real_of_num(1), SUC(n)) * (pow(x, n) / (real_of_num(n) * pow(real_of_num(1) + t, n))))
      #|  (u : Real) <= (x : Real)
      #|  (x : Real) < real_of_num(1)
      #|  (p : Num)
      #|  (m : Num)
      #|  !((m : Num) == 0)
      #|  (u : Real) <= (x : Real)
      #|  (x : Real) < real_of_num(1)
      #|  !(pow(real_of_num(1) - (u : Real), (m : Num)) == real_of_num(0))
      #|  (u : Real)
      #|  (u : Real) <= (x : Real)
      #|  (x : Real) < real_of_num(1)
      #|  (u : Real)
      #|  (m : Num) == 0
      #|  (u : Real)
      #|  (m : Num)
      #|  \226\136\128 t : Real, real_of_num(FACT(PRE((n : Num)))) * inv(pow(real_of_num(1) - t, n)) / real_of_num(FACT(n)) * pow((x : Real), n) == pow(x, n) / (real_of_num(n) * pow(real_of_num(1) - t, n))
      #|  \226\136\128 p : Num, (if p == 0 { real_of_num(0) } else { real_of_num(FACT(PRE(p))) }) / real_of_num(FACT(p)) == inv(real_of_num(p))
      #|  (p : Num)
      #|  \226\136\128 p : Num, !(p == 0) \226\134\146 real_of_num(FACT(PRE(p))) / real_of_num(FACT(p)) == inv(real_of_num(p))
      #|  0 < (n : Num)
      #|  !((n : Num) == 0)
      #|  (n : Num)
      #|  (x : Real)
      #|  (n : Num) => (x : Real) => if n == 0 { -ln(real_of_num(1) - x) } else { real_of_num(FACT(PRE(n))) * inv(pow(real_of_num(1) - x, n)) }
      #|  (x : Real) => -ln(real_of_num(1) - x)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) < x && x < real_of_num(1) && 0 < n \226\134\146 (\226\136\131 t : Real, real_of_num(0) < t && t < x && -ln(real_of_num(1) - x) == sum((0, n), (m : Num) => pow(x, m) / real_of_num(m)) + pow(x, n) / (real_of_num(n) * pow(real_of_num(1) - t, n)))
      #|  (x : Num) * 4 == 2 * (2 * x)
      #|  (x : Num) * 4 + 2 == 2 * (2 * x + 1)
      #|  (x : Num) + 3 - 1 == x + 2
      #|  (x : Num) + 1 - 1 == x
      #|  (d : Num)
      #|  MOD((r : Num), 4)
      #|  MOD((r : Num), 4) < 4
      #|  4
      #|  (r : Num)
      #|  (r : Num)
      #|  (x : Real) == (y : Real) && abs((u : Real)) <= (v : Real) \226\134\146 abs(x + u - y) <= v
      #|  (t : Real)
      #|  (n : Num)
      #|  (x : Real)
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num) == MOD((m : Num), 4)
      #|  4
      #|  (m : Num)
      #|  (y : Real)
      #|  (m : Num)
      #|  (n : Num) => (x : Real) => if MOD(n, 4) == 0 { sin(x) } else { if MOD(n, 4) == 1 { cos(x) } else { if MOD(n, 4) == 2 { -sin(x) } else { -cos(x) } } }
      #|  sin
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(sin(x) - sum((0, n), (m : Num) => (if EVEN(m) { real_of_num(0) } else { pow(-real_of_num(1), DIV(m - 1, 2)) / real_of_num(FACT(m)) }) * pow(x, m))) <= inv(real_of_num(FACT(n))) * pow(abs(x), n)
      #|  (x : Num) * 4 + 0 == 2 * (2 * x)
      #|  (x : Num) * 4 + 2 == 2 * (2 * x + 1)
      #|  (d : Num)
      #|  MOD((r : Num), 4)
      #|  MOD((r : Num), 4) < 4
      #|  4
      #|  (r : Num)
      #|  (r : Num)
      #|  (x : Real) == (y : Real) && abs((u : Real)) <= (v : Real) \226\134\146 abs(x + u - y) <= v
      #|  (t : Real)
      #|  (n : Num)
      #|  (x : Real)
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num) == MOD((m : Num), 4)
      #|  4
      #|  (m : Num)
      #|  (y : Real)
      #|  (m : Num)
      #|  (n : Num) => (x : Real) => if MOD(n, 4) == 0 { cos(x) } else { if MOD(n, 4) == 1 { -sin(x) } else { if MOD(n, 4) == 2 { -cos(x) } else { sin(x) } } }
      #|  cos
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(cos(x) - sum((0, n), (m : Num) => (if EVEN(m) { pow(-real_of_num(1), DIV(m, 2)) / real_of_num(FACT(m)) } else { real_of_num(0) }) * pow(x, m))) <= inv(real_of_num(FACT(n))) * pow(abs(x), n)
      #|  inv(real_of_num(1) - abs((x : Real)))
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  0
      #|  (n : Num) => pow(abs((x : Real)), n)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 summable((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow(x, n))
      #|  inv(real_of_num(1) - abs((x : Real)))
      #|  0
      #|  (n : Num) => pow(abs((x : Real)), n)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 summable((n : Num) => diffs((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }, n) * pow(x, n))
      #|  real_of_num(1) + (x : Real) == real_of_num(1) - -x
      #|  sums((n : Num) => pow(-pow((x : Real), 2), n), inv(real_of_num(1) + pow(x, 2)))
      #|  SUC((n : Num)) - 1 == n
      #|  ((n : Num) => sum((2 * n, 2), (n : Num) => diffs((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }, n) * pow((x : Real), n))) == ((n : Num) => pow(-pow(x, 2), n))
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 sums((n : Num) => diffs((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }, n) * pow(x, n), inv(real_of_num(1) + pow(x, 2)))
      #|  (a : Real) <= (b : Real) \226\134\146 a <= b + real_of_num(1)
      #|  real_of_num(1) <= (x : Real) \226\134\146 x <= (y : Real) \226\134\146 real_of_num(1) <= y
      #|  (N : Num)
      #|  \226\136\131 N : Num, real_of_num(1) <= real_of_num(N) * ((c : Real) / abs((x : Real)) - real_of_num(1))
      #|  ((x : Real) + real_of_num(1) <= (y : Real)) == (real_of_num(1) <= y - x * real_of_num(1))
      #|  abs((x : Real)) < (c : Real)
      #|  0
      #|  (x : Real) == real_of_num(0)
      #|  (N : Num)
      #|  \226\136\131 N : Num, \226\136\128 n : Num, n >= N \226\134\146 real_of_num(SUC(SUC(n))) * abs((x : Real)) <= real_of_num(SUC(n)) * (c : Real)
      #|  (c : Real)
      #|  abs((x : Real)) < real_of_num(1)
      #|  (real_of_num(1) + abs((x : Real))) / real_of_num(2)
      #|  \226\136\131 c : Real, abs((x : Real)) < c && c < real_of_num(1)
      #|  0
      #|  (n : Num) => real_of_num(SUC(n)) * pow(abs((x : Real)), n)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 summable((n : Num) => diffs(diffs((n : Num) => if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }), n) * pow(x, n))
      #|  (K : Real)
      #|  abs((x : Real)) < real_of_num(1)
      #|  (real_of_num(1) + abs((x : Real))) / real_of_num(2)
      #|  \226\136\131 K : Real, abs((x : Real)) < abs(K) && abs(K) < real_of_num(1)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 diffl((x : Real) => suminf((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow(x, n)), inv(real_of_num(1) + pow(x, 2)), x)
      #|  (u : Real)
      #|  abs((u : Real)) < real_of_num(1)
      #|  (u : Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  !((x : Real) == real_of_num(0)) \226\134\146 real_of_num(0) < x || x < real_of_num(0)
      #|  (x : Real) => suminf((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow(x, n)) - atn(x)
      #|  (x : Real) == real_of_num(0)
      #|  real_of_num(0) < (x : Real) \226\134\146 -x < real_of_num(0)
      #|  real_of_num(0)
      #|  real_of_num(0)
      #|  (a : Real) == real_of_num(0) && (b : Real) == real_of_num(0) \226\134\146 a - b == real_of_num(0)
      #|  suminf((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow(real_of_num(0), n)) - atn(real_of_num(0)) == real_of_num(0)
      #|  ((a : Real) == (b : Real)) == (a - b == real_of_num(0))
      #|  suminf((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow((x : Real), n)) == atn(x)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 sums((n : Num) => (if EVEN(n) { real_of_num(0) } else { pow(-real_of_num(1), DIV(n - 1, 2)) / real_of_num(n) }) * pow(x, n), atn(x))
      #|  (m : Num) => pow(abs((x : Real)), m + (n : Num))
      #|  (m : Num) => pow(abs((x : Real)), m + (n : Num))
      #|  suminf((m : Num) => abs((if EVEN(m + (n : Num)) { real_of_num(0) } else { pow(-real_of_num(1), DIV(m + n - 1, 2)) / real_of_num(m + n) }) * pow((x : Real), m + n)))
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  \226\136\128 m : Num, abs((if EVEN(m + (n : Num)) { real_of_num(0) } else { pow(-real_of_num(1), DIV(m + n - 1, 2)) / real_of_num(m + n) }) * pow((x : Real), m + n)) <= pow(abs(x), m + n)
      #|  pow(abs((x : Real)), (n : Num))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 abs(abs(x)) < real_of_num(1)
      #|  sums((m : Num) => pow(abs((x : Real)), m + (n : Num)), pow(abs(x), n) * inv(real_of_num(1) - abs(x)))
      #|  abs((r : Real)) <= (e : Real) \226\134\146 (f : Real) - (s : Real) == r \226\134\146 abs(f - s) <= e
      #|  (n : Num)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(x) < real_of_num(1) \226\134\146 abs(atn(x) - sum((0, n), (m : Num) => (if EVEN(m) { real_of_num(0) } else { pow(-real_of_num(1), DIV(m - 1, 2)) / real_of_num(m) }) * pow(x, m))) <= pow(abs(x), n) / (real_of_num(1) - abs(x))
      #|POWDIFF_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) p:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) (#SUC:fun(num,num) n:num)) p:num)))))) ((#real_mul:fun(real,fun(real,real)) y:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) p:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) n:num) p:num)))))))))))))
      #|POWDIFF =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_pow:fun(real,fun(num,real)) y:real) (#SUC:fun(num,num) n:num)))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) p:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) n:num) p:num)))))))))))))
      #|POWREV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) p:num)) ((#real_pow:fun(real,fun(num,real)) y:real) ((#-:fun(num,fun(num,num)) n:num) p:num)))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#SUC:fun(num,num) n:num))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) p:num))) ((#real_pow:fun(real,fun(num,real)) y:real) p:num)))))))))))
      #|POWSER_INSIDEA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) z:real)) (#real_abs:fun(real,real) x:real)))) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) (f:fun(num,real) n:num))) ((#real_pow:fun(real,fun(num,real)) z:real) n:num)))))))))))
      #|POWSER_INSIDE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) z:real)) (#real_abs:fun(real,real) x:real)))) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) z:real) n:num)))))))))))
      #|diffs =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real))) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))) (c:fun(num,real) (#SUC:fun(num,num) n:num)))))))
      #|DIFFS_NEG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (#real_neg:fun(real,real) (c:fun(num,real) n:num))))) (\n:num. (#real_neg:fun(real,real) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num))))))
      #|DIFFS_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|DIFFS_LEMMA2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_sub:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|DIFFS_EQUIV =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))))
      #|TERMDIFF_LEMMA1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\h:real. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\p:num. ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) z:real) h:real)) ((#-:fun(num,fun(num,num)) m:num) p:num))) ((#real_pow:fun(real,fun(num,real)) z:real) p:num))) ((#real_pow:fun(real,fun(num,real)) z:real) m:num))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) z:real) p:num)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) z:real) h:real)) ((#-:fun(num,fun(num,num)) m:num) p:num))) ((#real_pow:fun(real,fun(num,real)) z:real) ((#-:fun(num,fun(num,num)) m:num) p:num)))))))))))))
      #|TERMDIFF_LEMMA2 =  |- (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) h:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) z:real) h:real)) n:num)) ((#real_pow:fun(real,fun(num,real)) z:real) n:num))) h:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) z:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_mul:fun(real,fun(real,real)) h:real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\p:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) z:real) p:num)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num))) (\q:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) z:real) h:real)) q:num)) ((#real_pow:fun(real,fun(num,real)) z:real) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) p:num)) q:num)))))))))))))))
      #|TERMDIFF_LEMMA3 =  |- (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\K:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) h:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) z:real)) K:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) z:real) h:real))) K:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) z:real) h:real)) n:num)) ((#real_pow:fun(real,fun(num,real)) z:real) n:num))) h:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) z:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) K:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) h:real))))))))))))))
      #|TERMDIFF_LEMMA4 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\K:real. (#forall:fun(fun(real,bool),bool) (\k:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) k:real)) (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) h:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) h:real)) k:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) h:real))) ((#real_mul:fun(real,fun(real,real)) K:real) (#real_abs:fun(real,real) h:real)))))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|TERMDIFF_LEMMA5 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(real,fun(num,real)),bool),bool) (\g:fun(real,fun(num,real)). (#forall:fun(fun(real,bool),bool) (\k:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) k:real)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) f:fun(num,real))) (#forall:fun(fun(real,bool),bool) (\h:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) h:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) h:real)) k:real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((g:fun(real,fun(num,real)) h:real) n:num))) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) n:num)) (#real_abs:fun(real,real) h:real))))))))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) (\h:real. (#suminf:fun(fun(num,real),real) (g:fun(real,fun(num,real)) h:real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|TERMDIFF =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\K:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) K:real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) K:real) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) (#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real))) n:num)) ((#real_pow:fun(real,fun(num,real)) K:real) n:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) K:real)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) x:real))))))
      #|SEQ_NPOW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#tends_num_real:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|TERMDIFF_CONVERGES =  |- (#forall:fun(fun(real,bool),bool) (\K:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) K:real)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) K:real)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))))
      #|TERMDIFF_STRONG =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\c:fun(num,real). (#forall:fun(fun(real,bool),bool) (\K:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) K:real) n:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) K:real)))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) (c:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) c:fun(num,real)) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) x:real))))))))
      #|POWSER_0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) n:num)))) (a:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|POWSER_LIMIT_0 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) s:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) s:real)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real))))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (a:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|POWSER_LIMIT_0_STRONG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) s:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) s:real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real))))))) (((#tends_real_real:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (a:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|POWSER_EQUAL_0 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\b:fun(num,real). (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) e:real))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))) (P:fun(real,bool) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (b:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real)))))))) ((#=:fun(real,fun(real,bool)) (a:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (b:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|POWSER_EQUAL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\b:fun(num,real). (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) e:real))))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (b:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (f:fun(real,real) x:real)))))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) a:fun(num,real)) b:fun(num,real)))))))))))
      #|MULT_DIV_2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))
      #|EVEN_DIV2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) ((#=:fun(num,fun(num,bool)) ((#DIV:fun(num,fun(num,num)) (#SUC:fun(num,num) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#SUC:fun(num,num) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|POW_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|POW_ZERO_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|POW_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_pow:fun(real,fun(num,real)) y:real) (#SUC:fun(num,num) n:num))))))))))
      #|POW_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_pow:fun(real,fun(num,real)) y:real) (#SUC:fun(num,num) n:num)))))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))))
      #|exp =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|sin =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|cos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_EXP_CONVERGES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#exp:fun(real,real) x:real))))
      #|SIN_CONVERGES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#sin:fun(real,real) x:real))))
      #|COS_CONVERGES =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#cos:fun(real,real) x:real))))
      #|REAL_EXP_FDIFF =  |- ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))))) (\n:num. (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))))
      #|SIN_FDIFF =  |- ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))))))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|COS_FDIFF =  |- ((#=:fun(fun(num,real),fun(fun(num,real),bool)) (#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (\n:num. (#real_neg:fun(real,real) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))))) n:num))))
      #|SIN_NEGLEMMA =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#sin:fun(real,real) x:real))) (#suminf:fun(fun(num,real),real) (\n:num. (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))
      #|DIFF_EXP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #exp:fun(real,real)) (#exp:fun(real,real) x:real)) x:real)))
      #|DIFF_SIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #sin:fun(real,real)) (#cos:fun(real,real) x:real)) x:real)))
      #|DIFF_COS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #cos:fun(real,real)) (#real_neg:fun(real,real) (#sin:fun(real,real) x:real))) x:real)))
      #|DIFF_COMPOSITE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) l:real) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) l:real) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) m:real) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) l:real) m:real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) l:real) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) m:real) (f:fun(real,real) x:real)))) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_sub:fun(real,fun(real,real)) l:real) m:real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) l:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) l:real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) n:num))) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) m:real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#exp:fun(real,real) (g:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (g:fun(real,real) x:real))) m:real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#sin:fun(real,real) (g:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) (g:fun(real,real) x:real))) m:real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) m:real) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#cos:fun(real,real) (g:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#sin:fun(real,real) (g:fun(real,real) x:real)))) m:real)) x:real)))))))))))
      #|REAL_EXP_0 =  |- ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|REAL_EXP_LE_X =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#exp:fun(real,real) x:real)))))
      #|REAL_EXP_LT_1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#exp:fun(real,real) x:real)))))
      #|REAL_EXP_ADD_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real)))) (#exp:fun(real,real) y:real))))))
      #|REAL_EXP_NEG_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|REAL_EXP_NEG_MUL2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))) (#exp:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|REAL_EXP_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_inv:fun(real,real) (#exp:fun(real,real) x:real)))))
      #|REAL_EXP_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real)))))))
      #|REAL_EXP_POS_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#exp:fun(real,real) x:real))))
      #|REAL_EXP_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|REAL_EXP_POS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#exp:fun(real,real) x:real))))
      #|REAL_EXP_N =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) x:real))) ((#real_pow:fun(real,fun(num,real)) (#exp:fun(real,real) x:real)) n:num))))))
      #|REAL_EXP_SUB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real)))))))
      #|REAL_EXP_MONO_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real)))))))
      #|REAL_EXP_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_EXP_MONO_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_EXP_INJ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) (#exp:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_EXP_TOTAL_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) y:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_sub:fun(real,fun(real,real)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) y:real))))))))
      #|REAL_EXP_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) y:real))))))
      #|REAL_EXP_BOUND_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))))))
      #|ln =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) x:real)) (#@:fun(fun(real,bool),real) (\u:real. ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) u:real)) x:real))))))
      #|LN_EXP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) (#exp:fun(real,real) x:real))) x:real)))
      #|REAL_EXP_LN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) (#ln:fun(real,real) x:real))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))
      #|EXP_LN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) (#ln:fun(real,real) x:real))) x:real))))
      #|LN_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) (#ln:fun(real,real) x:real)) (#ln:fun(real,real) y:real))))))))
      #|LN_INJ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) x:real)) (#ln:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|LN_1 =  |- ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|LN_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) (#real_inv:fun(real,real) x:real))) (#real_neg:fun(real,real) (#ln:fun(real,real) x:real))))))
      #|LN_DIV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) (#ln:fun(real,real) x:real)) (#ln:fun(real,real) y:real))))))
      #|LN_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#ln:fun(real,real) x:real)) (#ln:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|LN_MONO_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#ln:fun(real,real) x:real)) (#ln:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|LN_POW =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) (#ln:fun(real,real) x:real))))))))
      #|LN_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#ln:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) x:real))))
      #|LN_LT_X =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#ln:fun(real,real) x:real)) x:real))))
      #|LN_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#ln:fun(real,real) x:real)))))
      #|LN_POS_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#ln:fun(real,real) x:real)))))
      #|DIFF_LN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #ln:fun(real,real)) (#real_inv:fun(real,real) x:real)) x:real))))
      #|root =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) n:num) x:real)) (#@:fun(fun(real,bool),real) (\u:real. ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) u:real) n:num)) x:real)))))))))
      #|ROOT_LT_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#exp:fun(real,real) ((#real_div:fun(real,fun(real,real)) (#ln:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))))) (#SUC:fun(num,num) n:num))) x:real))))))
      #|ROOT_LN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) (#exp:fun(real,real) ((#real_div:fun(real,fun(real,real)) (#ln:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))))))))))
      #|ROOT_0 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|ROOT_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|ROOT_POW_POS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) (#SUC:fun(num,num) n:num))) x:real))))))
      #|POW_ROOT_POS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num)))) x:real))))))
      #|ROOT_POS_POSITIVE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)))))))
      #|ROOT_POS_UNIQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) y:real) (#SUC:fun(num,num) n:num))) x:real)))) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) y:real))))))))
      #|ROOT_MUL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real))) ((#real_mul:fun(real,fun(real,real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real))))))))))
      #|ROOT_INV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) (#real_inv:fun(real,real) x:real))) (#real_inv:fun(real,real) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real))))))))
      #|ROOT_DIV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) ((#real_div:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real))))))))))
      #|ROOT_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))) ((#real_lt:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real)))))))
      #|ROOT_MONO_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))) ((#real_le:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real)))))))
      #|ROOT_MONO_LT_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|ROOT_MONO_LE_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|ROOT_INJ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) x:real)) ((#root:fun(num,fun(real,real)) (#SUC:fun(num,num) n:num)) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real)))))))
      #|SQRT_EVEN_POW2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|REAL_DIV_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) x:real))) (#sqrt:fun(real,real) x:real)))))
      #|DIFF_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #sqrt:fun(real,real)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) x:real)))) x:real))))
      #|SIN_0 =  |- ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|COS_0 =  |- ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|SIN_CIRCLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#sin:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) (#cos:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|SIN_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#sin:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|SIN_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sin:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|COS_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#cos:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|COS_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#cos:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|SIN_COS_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#cos:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) (#sin:fun(real,real) y:real))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) (#cos:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#sin:fun(real,real) y:real))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|SIN_COS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#sin:fun(real,real) (#real_neg:fun(real,real) x:real))) (#sin:fun(real,real) x:real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#cos:fun(real,real) (#real_neg:fun(real,real) x:real))) (#cos:fun(real,real) x:real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|SIN_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#cos:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) (#sin:fun(real,real) y:real))))))))
      #|COS_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) (#cos:fun(real,real) y:real))) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#sin:fun(real,real) y:real))))))))
      #|SIN_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#sin:fun(real,real) x:real)))))
      #|COS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#real_neg:fun(real,real) x:real))) (#cos:fun(real,real) x:real))))
      #|SIN_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#cos:fun(real,real) x:real))))))
      #|COS_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#cos:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) (#sin:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|COS_ABS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#real_abs:fun(real,real) x:real))) (#cos:fun(real,real) x:real))))
      #|SIN_PAIRED =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sin:fun(real,real) x:real))))
      #|SIN_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sin:fun(real,real) x:real)))))
      #|COS_PAIRED =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))))) (#cos:fun(real,real) x:real))))
      #|COS_2 =  |- ((#real_lt:fun(real,fun(real,bool)) (#cos:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|COS_ISZERO =  |- (#?!:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|pi =  |- ((#=:fun(real,fun(real,bool)) #pi:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#@:fun(fun(real,bool),real) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|PI2 =  |- ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#@:fun(fun(real,bool),real) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|COS_PI2 =  |- ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|PI2_BOUNDS =  |- ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|PI_POS =  |- ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #pi:real)
      #|SIN_PI2 =  |- ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|COS_PI =  |- ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) #pi:real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|SIN_PI =  |- ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) #pi:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|SIN_COS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#cos:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)))))
      #|COS_SIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#sin:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)))))
      #|SIN_PERIODIC_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) #pi:real))) (#real_neg:fun(real,real) (#sin:fun(real,real) x:real)))))
      #|COS_PERIODIC_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) #pi:real))) (#real_neg:fun(real,real) (#cos:fun(real,real) x:real)))))
      #|SIN_PERIODIC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #pi:real)))) (#sin:fun(real,real) x:real))))
      #|COS_PERIODIC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #pi:real)))) (#cos:fun(real,real) x:real))))
      #|COS_NPI =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real))) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|SIN_NPI =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|SIN_POS_PI2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sin:fun(real,real) x:real)))))
      #|COS_POS_PI2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#cos:fun(real,real) x:real)))))
      #|COS_POS_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#cos:fun(real,real) x:real)))))
      #|SIN_POS_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) #pi:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sin:fun(real,real) x:real)))))
      #|SIN_POS_PI_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) #pi:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sin:fun(real,real) x:real)))))
      #|COS_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#?!:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) #pi:real)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) y:real))))))))
      #|SIN_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#?!:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) y:real))))))))
      #|COS_ZERO_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|SIN_ZERO_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|COS_ZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#EVEN:fun(num,bool) n:num))) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|SIN_ZERO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|SIN_ZERO_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real)))))))))
      #|COS_ONE_2PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #pi:real)))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) x:real) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #pi:real))))))))))
      #|tan =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) (#cos:fun(real,real) x:real)))))
      #|TAN_0 =  |- ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|TAN_PI =  |- ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) #pi:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|TAN_NPI =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|TAN_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#tan:fun(real,real) x:real)))))
      #|TAN_PERIODIC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #pi:real)))) (#tan:fun(real,real) x:real))))
      #|TAN_PERIODIC_PI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) #pi:real))) (#tan:fun(real,real) x:real))))
      #|TAN_PERIODIC_NPI =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) #pi:real)))) (#tan:fun(real,real) x:real))))))
      #|TAN_ADD =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) y:real))) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#tan:fun(real,real) x:real)) (#tan:fun(real,real) y:real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (#tan:fun(real,real) x:real)) (#tan:fun(real,real) y:real))))))))))
      #|TAN_DOUBLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) ((#real_div:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#tan:fun(real,real) x:real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#tan:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|TAN_POS_PI2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#tan:fun(real,real) x:real)))))
      #|DIFF_TAN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #tan:fun(real,real)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#cos:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))))
      #|TAN_TOTAL_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) y:real) (#tan:fun(real,real) x:real)))))))))
      #|TAN_TOTAL_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) x:real)) y:real))))))))
      #|TAN_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#?!:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) x:real)) y:real)))))))
      #|PI2_PI4 =  |- ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|TAN_PI4 =  |- ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|TAN_COT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))) (#real_inv:fun(real,real) (#tan:fun(real,real) x:real)))))
      #|TAN_BOUND_PI2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#tan:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|TAN_ABS_GE_X =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_abs:fun(real,real) (#tan:fun(real,real) x:real))))))
      #|asn =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#asn:fun(real,real) y:real)) (#@:fun(fun(real,bool),real) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) y:real))))))))
      #|acs =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#acs:fun(real,real) y:real)) (#@:fun(fun(real,bool),real) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) #pi:real)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) y:real))))))))
      #|atn =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) y:real)) (#@:fun(fun(real,bool),real) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) x:real)) y:real))))))))
      #|ASN =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#asn:fun(real,real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#asn:fun(real,real) y:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) (#asn:fun(real,real) y:real))) y:real))))))
      #|ASN_SIN =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) (#asn:fun(real,real) y:real))) y:real))))
      #|ASN_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#asn:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#asn:fun(real,real) y:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|ASN_BOUNDS_LT =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#asn:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#asn:fun(real,real) y:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|SIN_ASN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) (#asn:fun(real,real) (#sin:fun(real,real) x:real))) x:real))))
      #|ACS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#acs:fun(real,real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#acs:fun(real,real) y:real)) #pi:real)) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#acs:fun(real,real) y:real))) y:real))))))
      #|ACS_COS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#acs:fun(real,real) y:real))) y:real))))
      #|ACS_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#acs:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) (#acs:fun(real,real) y:real)) #pi:real)))))
      #|ACS_BOUNDS_LT =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#acs:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#acs:fun(real,real) y:real)) #pi:real)))))
      #|COS_ACS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) #pi:real))) ((#=:fun(real,fun(real,bool)) (#acs:fun(real,real) (#cos:fun(real,real) x:real))) x:real))))
      #|ATN =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#atn:fun(real,real) y:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#atn:fun(real,real) y:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) (#atn:fun(real,real) y:real))) y:real)))))
      #|ATN_TAN =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) (#tan:fun(real,real) (#atn:fun(real,real) y:real))) y:real)))
      #|ATN_BOUNDS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#atn:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) (#atn:fun(real,real) y:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|TAN_ATN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) (#tan:fun(real,real) x:real))) x:real))))
      #|ATN_0 =  |- ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|ATN_1 =  |- ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|ATN_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) (#atn:fun(real,real) x:real)))))
      #|COS_ATN_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#atn:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|TAN_SEC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#tan:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) (#cos:fun(real,real) x:real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|DIFF_ATN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #atn:fun(real,real)) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real)))
      #|ATN_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#atn:fun(real,real) x:real)) (#atn:fun(real,real) y:real)))))))
      #|ATN_MONO_LT_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#atn:fun(real,real) x:real)) (#atn:fun(real,real) y:real))) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real))))))
      #|ATN_MONO_LE_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#atn:fun(real,real) x:real)) (#atn:fun(real,real) y:real))) ((#real_le:fun(real,fun(real,bool)) x:real) y:real))))))
      #|ATN_INJ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#atn:fun(real,real) x:real)) (#atn:fun(real,real) y:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|ATN_POS_LT =  |- ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#atn:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))
      #|ATN_POS_LE =  |- ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#atn:fun(real,real) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))
      #|ATN_LT_PI4_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#atn:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|ATN_LT_PI4_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#atn:fun(real,real) x:real)))))
      #|ATN_LT_PI4 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#atn:fun(real,real) x:real))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|ATN_LE_PI4 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (#atn:fun(real,real) x:real))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|COS_SIN_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#cos:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#sin:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|COS_ASN_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) (#asn:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DIFF_ASN_COS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #asn:fun(real,real)) (#real_inv:fun(real,real) (#cos:fun(real,real) (#asn:fun(real,real) x:real)))) x:real))))
      #|DIFF_ASN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #asn:fun(real,real)) (#real_inv:fun(real,real) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) x:real))))
      #|SIN_COS_SQRT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#sin:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) (#cos:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|SIN_ACS_NZ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) (#acs:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DIFF_ACS_SIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #acs:fun(real,real)) (#real_inv:fun(real,real) (#real_neg:fun(real,real) (#sin:fun(real,real) (#acs:fun(real,real) x:real))))) x:real))))
      #|DIFF_ACS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) #acs:fun(real,real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) x:real))))
      #|CIRCLE_SINCOS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#cos:fun(real,real) t:real))) ((#=:fun(real,fun(real,bool)) y:real) (#sin:fun(real,real) t:real))))))))))
      #|ACS_MONO_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#acs:fun(real,real) y:real)) (#acs:fun(real,real) x:real)))))))
      #|LESS_SUC_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|LESS_1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))
      #|division =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) (#?:fun(fun(num,bool),bool) (\N:num. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (D:fun(num,real) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) b:real)))))))))))))))
      #|dsize =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) D:fun(num,real))) (#@:fun(fun(num,bool),num) (\N:num. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (D:fun(num,real) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (D:fun(num,real) N:num)))))))))))
      #|tdiv =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (p:fun(num,real) n:num))) ((#real_le:fun(real,fun(real,bool)) (p:fun(num,real) n:num)) (D:fun(num,real) (#SUC:fun(num,num) n:num))))))))))))))))
      #|gauge =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\E:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#=:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) E:fun(real,bool)) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (E:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (g:fun(real,real) x:real))))))))))
      #|fine =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (D:fun(num,real) (#SUC:fun(num,num) n:num))) (D:fun(num,real) n:num))) (g:fun(real,real) (p:fun(num,real) n:num)))))))))))))
      #|rsum =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real))) f:fun(real,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) (\n:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) (p:fun(num,real) n:num))) ((#real_sub:fun(real,fun(real,real)) (D:fun(num,real) (#SUC:fun(num,num) n:num))) (D:fun(num,real) n:num))))))))))))
      #|defint =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\k:real. ((#=:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) k:real)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) g:fun(real,real))) (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real))) f:fun(real,real))) k:real))) e:real)))))))))))))))))))))
      #|DIVISION_0 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) a:real) b:real)))) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DIVISION_1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) a:real) b:real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|DIVISION_SINGLE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) a:real) b:real))))))))
      #|DIVISION_LHS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real))))))))
      #|DIVISION_THM =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (D:fun(num,real) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) b:real)))))))))))))
      #|DIVISION_RHS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#=:fun(real,fun(real,bool)) (D:fun(num,real) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) b:real))))))))
      #|DIVISION_LT_GEN =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))))) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) m:num)) (D:fun(num,real) n:num)))))))))))))
      #|DIVISION_LT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (D:fun(num,real) (#SUC:fun(num,num) n:num)))))))))))))
      #|DIVISION_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))))
      #|DIVISION_GT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real)))) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) (D:fun(num,real) (#dsize:fun(fun(num,real),num) D:fun(num,real))))))))))))))
      #|DIVISION_EQ =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) D:fun(num,real))) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|DIVISION_LBOUND =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#real_le:fun(real,fun(real,bool)) a:real) (D:fun(num,real) r:num)))))))))))
      #|DIVISION_LBOUND_LT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) D:fun(num,real))) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_lt:fun(real,fun(real,bool)) a:real) (D:fun(num,real) (#SUC:fun(num,num) n:num))))))))))))
      #|DIVISION_UBOUND =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#real_le:fun(real,fun(real,bool)) (D:fun(num,real) r:num)) b:real))))))))))
      #|DIVISION_UBOUND_LT =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D:fun(num,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D:fun(num,real))))) ((#real_lt:fun(real,fun(real,bool)) (D:fun(num,real) n:num)) b:real))))))))))
      #|DIVISION_APPEND_LEMMA1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(num,real),bool),bool) (\D1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D1:fun(num,real))) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) D2:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) (#dsize:fun(fun(num,real),num) D1:fun(num,real))) (#dsize:fun(fun(num,real),num) D2:fun(num,real))))) ((#real_lt:fun(real,fun(real,bool)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))) (D1:fun(num,real) n:num)) (D2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))))) n:num)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))) (D1:fun(num,real) n:num)) (D2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))))) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#>=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) (#dsize:fun(fun(num,real),num) D1:fun(num,real))) (#dsize:fun(fun(num,real),num) D2:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))) (D1:fun(num,real) n:num)) (D2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))))) n:num)) ((\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))) (D1:fun(num,real) n:num)) (D2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))))) ((#+:fun(num,fun(num,num)) (#dsize:fun(fun(num,real),num) D1:fun(num,real))) (#dsize:fun(fun(num,real),num) D2:fun(num,real))))))))))))))))))))
      #|DIVISION_APPEND_LEMMA2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(num,real),bool),bool) (\D1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) D1:fun(num,real))) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) D2:fun(num,real)))) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))) (D1:fun(num,real) n:num)) (D2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) D1:fun(num,real)))))))) ((#+:fun(num,fun(num,num)) (#dsize:fun(fun(num,real),num) D1:fun(num,real))) (#dsize:fun(fun(num,real),num) D2:fun(num,real)))))))))))))))
      #|DIVISION_APPEND_EXPLICIT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\d1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\d2:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (d1:fun(num,real) n:num)) (d2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real))))))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (p1:fun(num,real) n:num)) (p2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (d1:fun(num,real) n:num)) (d2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real))))))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (p1:fun(num,real) n:num)) (p2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real))))))))) (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(real,fun(real,bool)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (d1:fun(num,real) n:num)) (d2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real))))))) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#<:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))) (p1:fun(num,real) n:num)) (p2:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#dsize:fun(fun(num,real),num) d1:fun(num,real)))))))) f:fun(real,real))) ((#real_add:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real))) f:fun(real,real))) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))) f:fun(real,real)))))))))))))))))))))))))
      #|DIVISION_APPEND_STRONG =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(num,real),bool),bool) (\D1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D2:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D2:fun(num,real)) p2:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D2:fun(num,real)) p2:fun(num,real))))))) (#?:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(real,fun(real,bool)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real))) f:fun(real,real))) ((#real_add:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D1:fun(num,real)) p1:fun(num,real))) f:fun(real,real))) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D2:fun(num,real)) p2:fun(num,real))) f:fun(real,real)))))))))))))))))))))))))))
      #|DIVISION_APPEND =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(fun(num,real),bool),bool) (\D1:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\p1:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D1:fun(num,real)) p1:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D1:fun(num,real)) p1:fun(num,real))))))))) (#?:fun(fun(fun(num,real),bool),bool) (\D2:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\p2:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D2:fun(num,real)) p2:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D2:fun(num,real)) p2:fun(num,real)))))))))) (#?:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))))))))))))))
      #|DIVISION_EXISTS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) g:fun(real,real)))) (#?:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))))))))))))))
      #|GAUGE_MIN =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\E:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\g1:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g2:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) E:fun(real,bool)) g1:fun(real,real))) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) E:fun(real,bool)) g2:fun(real,real)))) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) E:fun(real,bool)) (\x:real. (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) (g1:fun(real,real) x:real)) (g2:fun(real,real) x:real))) (g1:fun(real,real) x:real)) (g2:fun(real,real) x:real)))))))))))
      #|FINE_MIN =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\g1:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g2:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\D:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) (\x:real. (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) (g1:fun(real,real) x:real)) (g2:fun(real,real) x:real))) (g1:fun(real,real) x:real)) (g2:fun(real,real) x:real)))) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g1:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g2:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) D:fun(num,real)) p:fun(num,real)))))))))))))
      #|DINT_UNIQ =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\k1:real. (#forall:fun(fun(real,bool),bool) (\k2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) k1:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) k2:real)))) ((#=:fun(real,fun(real,bool)) k1:real) k2:real))))))))))))
      #|INTEGRAL_NULL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) a:real)) f:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|STRADDLE_LEMMA =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real))) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) u:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) u:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) v:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) v:real) b:real)) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) v:real) u:real)) (g:fun(real,real) x:real))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) v:real)) (f:fun(real,real) u:real))) ((#real_mul:fun(real,fun(real,real)) (f':fun(real,real) x:real)) ((#real_sub:fun(real,fun(real,real)) v:real) u:real))))) ((#real_mul:fun(real,fun(real,real)) e:real) ((#real_sub:fun(real,fun(real,real)) v:real) u:real))))))))))))))))))))))))
      #|FTC1 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real)))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f':fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (f:fun(real,real) a:real))))))))))))
      #|integrable =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) (#?:fun(fun(real,bool),bool) (\i:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real))))))))))
      #|integral =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) (#@:fun(fun(real,bool),real) (\i:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real))))))))))
      #|INTEGRABLE_DEFINT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))))))))))
      #|DIVISION_BOUNDS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (d:fun(num,real) n:num))) ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) b:real)))))))))))
      #|TDIV_BOUNDS =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (d:fun(num,real) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (p:fun(num,real) n:num))) ((#real_le:fun(real,fun(real,bool)) (p:fun(num,real) n:num)) b:real)))))))))))))))
      #|TDIV_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))))))
      #|DEFINT_WRONG =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) b:real) a:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real))))))))))
      #|DEFINT_INTEGRAL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real))) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) i:real))))))))))
      #|DEFINT_CONST =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. c:real)) ((#real_mul:fun(real,fun(real,real)) c:real) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)))))))))
      #|DEFINT_0 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DEFINT_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) (#real_neg:fun(real,real) i:real)))))))))))
      #|DEFINT_CMUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) c:real) i:real)))))))))))))
      #|DEFINT_ADD =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) j:real))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_add:fun(real,fun(real,real)) i:real) j:real)))))))))))))))
      #|DEFINT_SUB =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) j:real))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) ((#real_sub:fun(real,fun(real,real)) i:real) j:real)))))))))))))))
      #|INTEGRAL_LE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun('?1,bool),bool) (\i:'?1. (#forall:fun(fun('?2,bool),bool) (\j:'?2. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))) ((#real_le:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real))))))))))))))))
      #|DEFINT_LE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) j:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))) ((#real_le:fun(real,fun(real,bool)) i:real) j:real))))))))))))))
      #|DEFINT_TRIANGLE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) j:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) i:real)) j:real))))))))))))
      #|DEFINT_EQ =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) j:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))) ((#=:fun(real,fun(real,bool)) i:real) j:real))))))))))))))
      #|INTEGRAL_EQ =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) i:real))))))))))))
      #|INTEGRATION_BY_PARTS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) (g':fun(real,real) x:real)) x:real))))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f':fun(real,real) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g':fun(real,real) x:real))))) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (g:fun(real,real) b:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) a:real)) (g:fun(real,real) a:real)))))))))))))))))
      #|DIVISION_LE_SUC =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (d:fun(num,real) (#SUC:fun(num,num) n:num))))))))))))
      #|DIVISION_MONO_LE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) m:num)) (d:fun(num,real) n:num))))))))))))))
      #|DIVISION_MONO_LE_SUC =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (d:fun(num,real) (#SUC:fun(num,num) n:num))))))))))))
      #|DIVISION_INTERMEDIATE =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#real_le:fun(real,fun(real,bool)) c:real) b:real)))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#dsize:fun(fun(num,real),num) d:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) c:real)) ((#real_le:fun(real,fun(real,bool)) c:real) (d:fun(num,real) (#SUC:fun(num,num) n:num))))))))))))))))
      #|DIVISION_DSIZE_LE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) ((#=:fun(real,fun(real,bool)) (d:fun(num,real) (#SUC:fun(num,num) n:num))) (d:fun(num,real) n:num)))) ((#<=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) d:fun(num,real))) n:num))))))))))
      #|DIVISION_DSIZE_GE =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) ((#real_lt:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (d:fun(num,real) (#SUC:fun(num,num) n:num))))) ((#<=:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) (#dsize:fun(fun(num,real),num) d:fun(num,real))))))))))))
      #|DIVISION_DSIZE_EQ =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (d:fun(num,real) n:num)) (d:fun(num,real) (#SUC:fun(num,num) n:num)))) ((#=:fun(real,fun(real,bool)) (d:fun(num,real) (#SUC:fun(num,num) (#SUC:fun(num,num) n:num)))) (d:fun(num,real) (#SUC:fun(num,num) n:num)))))) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) d:fun(num,real))) (#SUC:fun(num,num) n:num)))))))))))
      #|DIVISION_DSIZE_EQ_ALT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#division:fun(prod(real,real),fun(fun(num,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) d:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (d:fun(num,real) (#SUC:fun(num,num) n:num))) (d:fun(num,real) n:num))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) ((#real_lt:fun(real,fun(real,bool)) (d:fun(num,real) i:num)) (d:fun(num,real) (#SUC:fun(num,num) i:num))))))))) ((#=:fun(num,fun(num,bool)) (#dsize:fun(fun(num,real),num) d:fun(num,real))) n:num))))))))))
      #|DEFINT_COMBINE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\j:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) f:fun(real,real)) j:real))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) f:fun(real,real)) ((#real_add:fun(real,fun(real,real)) i:real) j:real)))))))))))))))
      #|DEFINT_DELTA_LEFT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DEFINT_DELTA_RIGHT =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|DEFINT_DELTA =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) c:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|DEFINT_POINT_SPIKE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) c:real))))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) i:real))))))))))))))
      #|DEFINT_FINITE_SPIKE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(real,bool),bool) (\i:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) (#~:fun(bool,bool) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool)))))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)) i:real)))) (((#defint:fun(prod(real,real),fun(fun(real,real),fun(real,bool))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)) i:real))))))))))))))
      #|GAUGE_MIN_FINITE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\gs:fun(num,fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) s:fun(real,bool)) (gs:fun(num,fun(real,real)) m:num)))))) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) s:fun(real,bool)) g:fun(real,real))) (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) (gs:fun(num,fun(real,real)) m:num)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))))))))))))))))))))
      #|INTEGRABLE_CAUCHY =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) g:fun(real,real))) (#forall:fun(fun(fun(num,real),bool),bool) (\d1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\d2:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real))) f:fun(real,real))) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))) f:fun(real,real))))) e:real)))))))))))))))))))))))
      #|SUM_DIFFS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\i:num. ((#real_sub:fun(real,fun(real,real)) (d:fun(num,real) (#SUC:fun(num,num) i:num))) (d:fun(num,real) i:num))))) ((#real_sub:fun(real,fun(real,real)) (d:fun(num,real) ((#+:fun(num,fun(num,num)) m:num) n:num))) (d:fun(num,real) m:num)))))))
      #|RSUM_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(real,bool),bool) (\e:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) e:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real))) f:fun(real,real)))) ((#real_mul:fun(real,fun(real,real)) e:real) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))))))))))))))))
      #|RSUM_DIFF_BOUND =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(fun(num,real),bool),bool) (\d:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p:fun(num,real). (#forall:fun(fun(real,bool),bool) (\e:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) e:real)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real))) f:fun(real,real))) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d:fun(num,real)) p:fun(num,real))) g:fun(real,real))))) ((#real_mul:fun(real,fun(real,real)) e:real) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))))))))))))))))))
      #|INTEGRABLE_LIMIT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) e:real))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real))))))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))))))))
      #|INTEGRABLE_CONST =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. c:real))))))))
      #|INTEGRABLE_COMBINE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) b:real) c:real)) f:fun(real,real)))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) f:fun(real,real)))))))))))
      #|INTEGRABLE_POINT_SPIKE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) c:real))))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)))))))))))))
      #|INTEGRABLE_CONTINUOUS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) ((#contl:fun(fun(real,real),fun(real,bool)) f:fun(real,real)) x:real))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))))))))
      #|INTEGRABLE_SPLIT_SIDES =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) b:real)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))))) (#?:fun(fun(real,bool),bool) (\i:real. (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#gauge:fun(fun(real,bool),fun(fun(real,real),bool)) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real)))) g:fun(real,real))) (#forall:fun(fun(fun(num,real),bool),bool) (\d1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p1:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\d2:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\p2:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#tdiv:fun(prod(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) ((#,:fun(real,fun(real,prod(real,real))) c:real) b:real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real)))) ((#fine:fun(fun(real,real),fun(prod(fun(num,real),fun(num,real)),bool)) g:fun(real,real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d1:fun(num,real)) p1:fun(num,real))) f:fun(real,real))) ((#rsum:fun(prod(fun(num,real),fun(num,real)),fun(fun(real,real),real)) ((#,:fun(fun(num,real),fun(fun(num,real),prod(fun(num,real),fun(num,real)))) d2:fun(num,real)) p2:fun(num,real))) f:fun(real,real)))) i:real))) e:real)))))))))))))))))))))))))))
      #|INTEGRABLE_SUBINTERVAL_LEFT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) b:real)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) c:real)) f:fun(real,real)))))))))))
      #|INTEGRABLE_SUBINTERVAL_RIGHT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) b:real)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) c:real) b:real)) f:fun(real,real)))))))))))
      #|INTEGRABLE_SUBINTERVAL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\d:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) c:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) c:real) d:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) d:real) b:real)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) c:real) d:real)) f:fun(real,real)))))))))))))
      #|INTEGRAL_CONST =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. c:real))) ((#real_mul:fun(real,fun(real,real)) c:real) ((#real_sub:fun(real,fun(real,real)) b:real) a:real))))))))))
      #|INTEGRAL_CMUL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) c:real) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real)))))))))))))
      #|INTEGRAL_ADD =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real))))) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))) ((#real_add:fun(real,fun(real,real)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)))))))))))))
      #|INTEGRAL_SUB =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real))))) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))) ((#real_sub:fun(real,fun(real,real)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) f:fun(real,real))) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) g:fun(real,real)))))))))))))
      #|INTEGRAL_BY_PARTS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g':fun(real,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) f:fun(real,real)) (f':fun(real,real) x:real)) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) g:fun(real,real)) (g':fun(real,real) x:real)) x:real))))) ((#/\:fun(bool,fun(bool,bool)) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f':fun(real,real) x:real)) (g:fun(real,real) x:real))))) ((#integrable:fun(prod(real,real),fun(fun(real,real),bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g':fun(real,real) x:real))))))))) ((#=:fun(real,fun(real,bool)) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g':fun(real,real) x:real))))) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) b:real)) (g:fun(real,real) b:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) a:real)) (g:fun(real,real) a:real)))) ((#integral:fun(prod(real,real),fun(fun(real,real),real)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f':fun(real,real) x:real)) (g:fun(real,real) x:real)))))))))))))))))))
      #|MCLAURIN =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) h:real)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) h:real)))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (diff:fun(num,fun(real,real)) m:num)) ((diff:fun(num,fun(real,real)) (#SUC:fun(num,num) m:num)) t:real)) t:real)))))))))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) t:real) h:real)) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) h:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) h:real) m:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) n:num) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) h:real) n:num)))))))))))))))))
      #|MCLAURIN_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) h:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) h:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (diff:fun(num,fun(real,real)) m:num)) ((diff:fun(num,fun(real,real)) (#SUC:fun(num,num) m:num)) t:real)) t:real)))))))))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) h:real) t:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) t:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) h:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) h:real) m:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) n:num) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) h:real) n:num)))))))))))))))))
      #|MCLAURIN_BI_LE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real)))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (diff:fun(num,fun(real,real)) m:num)) ((diff:fun(num,fun(real,real)) (#SUC:fun(num,num) m:num)) t:real)) t:real)))))))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) n:num) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))))))))))
      #|MCLAURIN_ALL_LT =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (diff:fun(num,fun(real,real)) m:num)) ((diff:fun(num,fun(real,real)) (#SUC:fun(num,num) m:num)) x:real)) x:real))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) t:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) n:num) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))))))))))))
      #|MCLAURIN_ZERO =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))) ((#=:fun(real,fun(real,bool)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))) ((diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|MCLAURIN_ALL_LE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\diff:fun(num,fun(real,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (diff:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (diff:fun(num,fun(real,real)) m:num)) ((diff:fun(num,fun(real,real)) (#SUC:fun(num,num) m:num)) x:real)) x:real))))))) (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) m:num) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((diff:fun(num,fun(real,real)) n:num) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))))))))))))
      #|MCLAURIN_EXP_LEMMA =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((\n:num. #exp:fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) #exp:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) ((\n:num. #exp:fun(real,real)) m:num)) (((\n:num. #exp:fun(real,real)) (#SUC:fun(num,num) m:num)) x:real)) x:real))))))
      #|MCLAURIN_EXP_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_abs:fun(real,real) t:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#exp:fun(real,real) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))))))
      #|MCLAURIN_EXP_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (#exp:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#exp:fun(real,real) t:real)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))))))
      #|MCLAURIN_LN_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) t:real) x:real)) ((#=:fun(real,fun(real,bool)) (#ln:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#SUC:fun(num,num) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) (#real_of_num:fun(num,real) m:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#SUC:fun(num,num) n:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) n:num)))))))))))))))
      #|MCLAURIN_LN_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)))) (#?:fun(fun(real,bool),bool) (\t:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) t:real) x:real)) ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#ln:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))) ((#real_add:fun(real,fun(real,real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) m:num)) (#real_of_num:fun(num,real) m:num))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) n:num))))))))))))))
      #|MCLAURIN_SIN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))))) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num)))))))
      #|MCLAURIN_COS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) m:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) m:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))))) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) n:num)))) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num)))))))
      #|REAL_ATN_POWSER_SUMMABLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_ATN_POWSER_DIFFS_SUMMABLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_ATN_POWSER_DIFFS_SUM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|REAL_ATN_POWSER_DIFFS_DIFFS_SUMMABLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#summable:fun(fun(num,real),bool) (\n:num. ((#real_mul:fun(real,fun(real,real)) ((#diffs:fun(fun(num,real),fun(num,real)) (#diffs:fun(fun(num,real),fun(num,real)) (\n:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num)))))) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|REAL_ATN_POWSER_DIFFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. (#suminf:fun(fun(num,real),real) (\n:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real))))
      #|REAL_ATN_POWSER =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#sums:fun(fun(num,real),fun(real,bool)) (\n:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) n:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) n:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (#atn:fun(real,real) x:real)))))
      #|MCLAURIN_ATN =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#atn:fun(real,real) x:real)) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\m:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) m:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) m:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) m:num))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real)))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = integral integrable defint rsum fine gauge tdiv dsize division atn acs asn tan pi root ln cos sin exp diffs differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 316
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|counter_genvar = _129457:bool
      #|
    ),
  )
}
