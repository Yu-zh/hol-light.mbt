// IEEE/float_thms.hl in its directory's load order: the test block of
// ieee/float_thms/float_thms_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/IEEE_float_thms_ref.expected).

///|
test "IEEE/float_thms matches IEEE/float_thms.ml" {
  @testkit.release_output()
  @float_thms.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "IEEE/common", "IEEE/fixed", "IEEE/fixed_thms", "IEEE/float", "IEEE/float_thms",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("IEEE/float_thms")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("FLFORMAT_SPLIT", () => sthm(@float_thms.flformat_split()))
  log.attempt("FLFORMAT_VALID_IMP_RADIX_LT_1", () => {
    sthm(@float_thms.flformat_valid_imp_radix_lt_1())
  })
  log.attempt("FLFORMAT_VALID_IMP_RADIX_EVEN", () => {
    sthm(@float_thms.flformat_valid_imp_radix_even())
  })
  log.attempt("FLFORMAT_VALID_IMP_PREC_LT_1", () => {
    sthm(@float_thms.flformat_valid_imp_prec_lt_1())
  })
  log.attempt("FLFORMAT_VALID", () => sthm(@float_thms.flformat_valid()))
  log.attempt("FLFORMAT_RADIX_LT_1", () => {
    sthm(@float_thms.flformat_radix_lt_1())
  })
  log.attempt("FLFORMAT_RADIX_LT_0", () => {
    sthm(@float_thms.flformat_radix_lt_0())
  })
  log.attempt("FLFORMAT_RADIX_NE_0", () => {
    sthm(@float_thms.flformat_radix_ne_0())
  })
  log.attempt("FLFORMAT_RADIX_EVEN", () => {
    sthm(@float_thms.flformat_radix_even())
  })
  log.attempt("FLFORMAT_RADIX_LE_2", () => {
    sthm(@float_thms.flformat_radix_le_2())
  })
  log.attempt("FLFORMAT_PREC_LT_1", () => sthm(@float_thms.flformat_prec_lt_1()))
  log.attempt("FLFORMAT_PREC_LT_0", () => sthm(@float_thms.flformat_prec_lt_0()))
  log.attempt("FLFORMAT_PREC_MINUS_1", () => {
    sthm(@float_thms.flformat_prec_minus_1())
  })
  log.attempt("FLFORMAT_PREC_IPOW_EQ_EXP", () => {
    sthm(@float_thms.flformat_prec_ipow_eq_exp())
  })
  log.attempt("FLFORMAT_PREC_EXP_EQ_IPOW", () => {
    sthm(@float_thms.flformat_prec_exp_eq_ipow())
  })
  log.attempt("FLFORMAT_RADIX_IPOW_LE_0", () => {
    sthm(@float_thms.flformat_radix_ipow_le_0())
  })
  log.attempt("FLFORMAT_RADIX_IPOW_LT_0", () => {
    sthm(@float_thms.flformat_radix_ipow_lt_0())
  })
  log.attempt("FLFORMAT_RADIX_IPOW_NEQ_0", () => {
    sthm(@float_thms.flformat_radix_ipow_neq_0())
  })
  log.attempt("FLFORMAT_RADIX_IPOW_ADD_EXP", () => {
    sthm(@float_thms.flformat_radix_ipow_add_exp())
  })
  log.attempt("FLFORMAT_TO_FFORMAT", () => {
    sthm(@float_thms.flformat_to_fformat())
  })
  log.attempt("FLFORMAT_TO_FFORMAT_2", () => {
    sthm(@float_thms.flformat_to_fformat_2())
  })
  log.attempt("FLOAT_IPOW_LE_REAL", () => sthm(@float_thms.float_ipow_le_real()))
  log.attempt("FLOAT_IPOW_LE_REAL_2", () => {
    sthm(@float_thms.float_ipow_le_real_2())
  })
  log.attempt("FLOAT_NEG", () => sthm(@float_thms.float_neg()))
  log.attempt("FLOAT_NOT_ZERO", () => sthm(@float_thms.float_not_zero()))
  log.attempt("is_greatest_e", () => sthm(@float_thms.is_greatest_e()))
  log.attempt("FLOAT_GREATEST_E_EXISTS", () => {
    sthm(@float_thms.float_greatest_e_exists())
  })
  log.attempt("FLOAT_GREATEST_E_UNIQUE", () => {
    sthm(@float_thms.float_greatest_e_unique())
  })
  log.attempt("FLOAT_GREATEST_E_NEG", () => {
    sthm(@float_thms.float_greatest_e_neg())
  })
  log.attempt("is_greatest_m", () => sthm(@float_thms.is_greatest_m()))
  log.attempt("FLOAT_GREATEST_M_EXISTS", () => {
    sthm(@float_thms.float_greatest_m_exists())
  })
  log.attempt("FLOAT_GREATEST_M_UNIQUE", () => {
    sthm(@float_thms.float_greatest_m_unique())
  })
  log.attempt("FLOAT_GREATEST_M_NEG", () => {
    sthm(@float_thms.float_greatest_m_neg())
  })
  log.attempt("FLOAT_GREATEST_R_EXISTS", () => {
    sthm(@float_thms.float_greatest_r_exists())
  })
  log.attempt("FLOAT_GREATEST_R_NEG", () => {
    sthm(@float_thms.float_greatest_r_neg())
  })
  log.attempt("FLOAT_GREATEST_R_LE_0", () => {
    sthm(@float_thms.float_greatest_r_le_0())
  })
  log.attempt("FLOAT_GREATEST_R_LE_0_2", () => {
    sthm(@float_thms.float_greatest_r_le_0_2())
  })
  log.attempt("FLOAT_NORMALIZE_REAL", () => {
    sthm(@float_thms.float_normalize_real())
  })
  log.attempt("FLOAT_NORM_FRAC", () => sthm(@float_thms.float_norm_frac()))
  log.attempt("FLOAT_NORM_M", () => sthm(@float_thms.float_norm_m()))
  log.attempt("FLOAT_NORM_GREATEST", () => {
    sthm(@float_thms.float_norm_greatest())
  })
  log.attempt("FLOAT_NORMALIZE_FLOAT", () => {
    sthm(@float_thms.float_normalize_float())
  })
  log.attempt("FLOAT_EQ_IPOW", () => sthm(@float_thms.float_eq_ipow()))
  log.attempt("FLOAT_EQ_IPOW_R_0", () => sthm(@float_thms.float_eq_ipow_r_0()))
  log.attempt("FLOAT_BETWEEN", () => sthm(@float_thms.float_between()))
  log.attempt("FLOAT_RD_IS_FLOAT", () => sthm(@float_thms.float_rd_is_float()))
  log.attempt("CLOSER_BETWEEN_3", () => sthm(@float_thms.closer_between_3()))
  log.attempt("CLOSER_BETWEEN_4", () => sthm(@float_thms.closer_between_4()))
  log.attempt("CLOSER_BETWEEN_5", () => sthm(@float_thms.closer_between_5()))
  log.attempt("fl_is_closest", () => sthm(@float_thms.fl_is_closest()))
  log.attempt("FLOAT_RD_NEAREST_CLOSEST", () => {
    sthm(@float_thms.float_rd_nearest_closest())
  })
  log.attempt("FLOAT_M_POW_E_IS_FLOAT", () => {
    sthm(@float_thms.float_m_pow_e_is_float())
  })
  log.attempt("FLOAT_NEG_IS_FLOAT", () => sthm(@float_thms.float_neg_is_float()))
  log.attempt("FLOAT_PLUS_FIXED_IS_FLOAT", () => {
    sthm(@float_thms.float_plus_fixed_is_float())
  })
  log.attempt("FLOAT_PLUS_FIXED_IS_FLOAT_2", () => {
    sthm(@float_thms.float_plus_fixed_is_float_2())
  })
  log.attempt("FLOAT_REVERSE_NORMALIZE_FLOAT", () => {
    sthm(@float_thms.float_reverse_normalize_float())
  })
  log.attempt("FLOAT_REVERSE_NORMALIZE_LE", () => {
    sthm(@float_thms.float_reverse_normalize_le())
  })
  log.attempt("FLOAT_REVERSE_NORMALIZE_LE_2", () => {
    sthm(@float_thms.float_reverse_normalize_le_2())
  })
  log.attempt("CLOSEST_LEMMA_1", () => sthm(@float_thms.closest_lemma_1()))
  log.attempt("CLOSEST_LEMMA_2", () => sthm(@float_thms.closest_lemma_2()))
  log.attempt("FLOAT_IS_CLOSEST_FIXED", () => {
    sthm(@float_thms.float_is_closest_fixed())
  })
  log.attempt("fl_norm_frac", () => sthm(@float_thms.fl_norm_frac()))
  log.attempt("fl_to_even", () => sthm(@float_thms.fl_to_even()))
  log.attempt("FLOAT_RD_NEAREST_EVEN", () => {
    sthm(@float_thms.float_rd_nearest_even())
  })
  log.attempt("fl_to_zero", () => sthm(@float_thms.fl_to_zero()))
  log.attempt("FLOAT_RD_ZERO_EXISTS", () => {
    sthm(@float_thms.float_rd_zero_exists())
  })
  log.attempt("fl_to_pinf", () => sthm(@float_thms.fl_to_pinf()))
  log.attempt("FLOAT_RD_PINF_EXISTS", () => {
    sthm(@float_thms.float_rd_pinf_exists())
  })
  log.attempt("fl_to_ninf", () => sthm(@float_thms.fl_to_ninf()))
  log.attempt("FLOAT_RD_NINF_EXISTS", () => {
    sthm(@float_thms.float_rd_ninf_exists())
  })
  log.attempt("FLOAT_RD_NEAR_ABS_ERR", () => {
    sthm(@float_thms.float_rd_near_abs_err())
  })
  log.attempt("FLOAT_RD_ZERO_ABS_ERR", () => {
    sthm(@float_thms.float_rd_zero_abs_err())
  })
  log.attempt("FLOAT_RD_PINF_ABS_ERR", () => {
    sthm(@float_thms.float_rd_pinf_abs_err())
  })
  log.attempt("FLOAT_RD_NINF_ABS_ERR", () => {
    sthm(@float_thms.float_rd_ninf_abs_err())
  })
  log.attempt("FLOAT_RD_NEAR_REL_ERROR", () => {
    sthm(@float_thms.float_rd_near_rel_error())
  })
  log.attempt("FLOAT_RD_ZERO_REL_ERROR", () => {
    sthm(@float_thms.float_rd_zero_rel_error())
  })
  log.attempt("FLOAT_RD_PINF_REL_ERROR", () => {
    sthm(@float_thms.float_rd_pinf_rel_error())
  })
  log.attempt("FLOAT_RD_NINF_REL_ERROR", () => {
    sthm(@float_thms.float_rd_ninf_rel_error())
  })
  log.attempt("FLOAT_RD_NEAR_REL_DELTA", () => {
    sthm(@float_thms.float_rd_near_rel_delta())
  })
  log.attempt("FLOAT_RD_ZERO_REL_DELTA", () => {
    sthm(@float_thms.float_rd_zero_rel_delta())
  })
  log.attempt("FLOAT_RD_PINF_REL_DELTA", () => {
    sthm(@float_thms.float_rd_pinf_rel_delta())
  })
  log.attempt("FLOAT_RD_NINF_REL_DELTA", () => {
    sthm(@float_thms.float_rd_ninf_rel_delta())
  })
  log.attempt("FLOAT_GREATEST_E_OF", () => {
    sthm(@float_thms.float_greatest_e_of())
  })
  log.attempt("FLOAT_RD_LE_0", () => sthm(@float_thms.float_rd_le_0()))
  log.attempt("FLOAT_RD_LE_0_2", () => sthm(@float_thms.float_rd_le_0_2()))
  log.attempt("FLOAT_RD_MONO", () => sthm(@float_thms.float_rd_mono()))
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
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|IEEE/float_thms quotations (1400):
      #|  \226\136\128 fmt : Flformat, dest_flformat(fmt) == (FST(dest_flformat(fmt)), SND(dest_flformat(fmt)))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, is_valid_flformat((r, p)) \226\134\146 1 < FST((r, p))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, is_valid_flformat((r, p)) \226\134\146 EVEN(FST((r, p)))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, is_valid_flformat((r, p)) \226\134\146 1 < SND((r, p))
      #|  \226\136\128 fmt : Flformat, is_valid_flformat(dest_flformat(fmt))
      #|  \226\136\128 fmt : Flformat, 1 < flr(fmt)
      #|  1 < (x : Num) \226\134\146 0 < x
      #|  \226\136\128 fmt : Flformat, 0 < flr(fmt)
      #|  0 < (x : Num) \226\134\146 !(x == 0)
      #|  \226\136\128 fmt : Flformat, !(real_of_num(flr(fmt)) == real_of_num(0))
      #|  \226\136\128 fmt : Flformat, EVEN(flr(fmt))
      #|  ODD(1)
      #|  (x : Num) == 1
      #|  (x : Num) == 0
      #|  \226\136\128 x : Num, !(x == 0) && EVEN(x) \226\134\146 2 <= x
      #|  \226\136\128 fmt : Flformat, 2 <= flr(fmt)
      #|  (x : Num) == 1
      #|  \226\136\128 fmt : Flformat, 1 < flp(fmt)
      #|  1 < (x : Num) \226\134\146 0 < x
      #|  \226\136\128 fmt : Flformat, 0 < flp(fmt)
      #|  (1 <= (n : Num)) == (0 < n)
      #|  (int_of_num(0) <= (x : Int) - int_of_num(1)) == (int_of_num(1) <= x)
      #|  \226\136\128 fmt : Flformat, int_of_num(0) <= int_of_num(flp(fmt)) - int_of_num(1)
      #|  \226\136\128 fmt : Flformat, ipow(real_of_num(flr(fmt)), int_of_num(flp(fmt)) - int_of_num(1)) == real_of_num(EXP(flr(fmt), flp(fmt) - 1))
      #|  int_of_num(0) <= int_of_num((n : Num))
      #|  \226\136\128 fmt : Flformat, \226\136\128 n : Num, real_of_num(EXP(flr(fmt), n)) == ipow(real_of_num(flr(fmt)), int_of_num(n))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, real_of_num(0) <= ipow(real_of_num(flr(fmt)), e)
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, real_of_num(0) < ipow(real_of_num(flr(fmt)), e)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, !(ipow(real_of_num(flr(fmt)), e) == real_of_num(0))
      #|  \226\136\128 fmt : Flformat, \226\136\128 u : Int, \226\136\128 v : Int, ipow(real_of_num(flr(fmt)), u) * ipow(real_of_num(flr(fmt)), v) == ipow(real_of_num(flr(fmt)), u + v)
      #|  is_valid_fformat((flr((fmt : Flformat)), flp(fmt), (e : Int)))
      #|  mk_fformat((flr((fmt : Flformat)), flp(fmt), (e : Int)))
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, \226\136\131 fmt' : Fformat, to_fformat(fmt, e) == fmt' && fr(fmt') == flr(fmt) && fp(fmt') == flp(fmt) && fe(fmt') == e
      #|  is_valid_fformat((flr((fmt : Flformat)), flp(fmt), (e : Int)))
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, fr(to_fformat(fmt, e)) == flr(fmt) && fp(to_fformat(fmt, e)) == flp(fmt) && fe(to_fformat(fmt, e)) == e
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 z : Real, \226\136\131 e : Int, z <= ipow(real_of_num(flr(fmt)), e)
      #|  \226\136\128 fmt : Flformat, \226\136\128 z : Real, real_of_num(0) < z \226\134\146 (\226\136\131 e : Int, ipow(real_of_num(flr(fmt)), e) <= z)
      #|  (fmt : Flformat)
      #|  abs(-(x : Real)) == abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) == is_float(fmt, -x)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  real_of_num((f : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  \226\136\128 y : Real, (x : Real) == y && !(y == real_of_num(0)) \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) \226\134\146 !(x == real_of_num(0))
      #|  (is_greatest_e : (Flformat, Real, Int) -> Bool)((fmt : Flformat), (x : Real), (e : Int)) == (ipow(real_of_num(flr(fmt)), e) <= abs(x) && (\226\136\128 e' : Int, ipow(real_of_num(flr(fmt)), e') <= abs(x) \226\134\146 e' <= e))
      #|  (e' : Int)
      #|  flr((fmt : Flformat))
      #|  (e : Int)
      #|  abs((x : Real))
      #|  (fmt : Flformat)
      #|  \226\136\131 b : Int, \226\136\128 e : Int, IN(e, {(e : Int) | ipow(real_of_num(flr((fmt : Flformat))), e) <= abs((x : Real))}) \226\134\146 e <= b
      #|  !({(e : Int) | ipow(real_of_num(flr((fmt : Flformat))), e) <= abs((x : Real))} == {})
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 e : Int, greatest_e(fmt, x) == e && is_greatest_e(fmt, x, e))
      #|  !((x : Real) == real_of_num(0)) \226\134\146 real_of_num(0) < abs(x)
      #|  (e2 : Int) <= (e1 : Int)
      #|  (e1 : Int) <= (e2 : Int)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 e1 : Int, \226\136\128 e2 : Int, is_greatest_e(fmt, x, e1) && is_greatest_e(fmt, x, e2) \226\134\146 e1 == e2
      #|  abs(-(x : Real)) == abs(x)
      #|  !(-(x : Real) == real_of_num(0))
      #|  -(x : Real)
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 greatest_e(fmt, -x) == greatest_e(fmt, x)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (is_greatest_m : (Flformat, Real, Num) -> Bool)((fmt : Flformat), (x : Real), (m : Num)) == (real_of_num(m) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) <= abs(x) && (\226\136\128 m' : Num, real_of_num(m') * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) <= abs(x) \226\134\146 m' <= m))
      #|  (n' : Num)
      #|  \226\136\128 m : Num, IN(m, {(m : Num) | real_of_num(m) * ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) <= abs(x)}) \226\134\146 m <= flr(fmt)
      #|  real_of_num((k : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  \226\136\128 z : Real, real_of_num(0) <= z && (a : Real) + z <= (b : Real) \226\134\146 a <= b
      #|  real_of_num(flr((fmt : Flformat)) + (k : Num)) * ipow(real_of_num(flr(fmt)), (e : Int)) <= abs((x : Real))
      #|  ((a : Real) + (b : Real)) * (c : Real) == a * c + b * c
      #|  (a : Real) * (b : Real) == b * a
      #|  (fmt : Flformat)
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int) + int_of_num(1)) <= abs((x : Real))
      #|  (m : Num) - flr((fmt : Flformat))
      #|  \226\136\131 k : Num, (m : Num) == flr((fmt : Flformat)) + k
      #|  (m : Num) < flr((fmt : Flformat))
      #|  \226\136\128 m : Num, IN(m, {(m : Num) | real_of_num(m) * ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) <= abs(x)}) \226\134\146 m < flr(fmt)
      #|  1
      #|  !({(m : Num) | real_of_num(m) * ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) <= abs(x)} == {})
      #|  real_of_num(1) * (x : Real) == x
      #|  IN(1, {(m : Num) | real_of_num(m) * ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) <= abs(x)})
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 m : Num, greatest_m(fmt, x) == m && is_greatest_m(fmt, x, m) && 1 <= m && m < flr(fmt))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (m2 : Num) <= (m1 : Num)
      #|  (m1 : Num) <= (m2 : Num)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 m1 : Num, \226\136\128 m2 : Num, is_greatest_m(fmt, x, m1) && is_greatest_m(fmt, x, m2) \226\134\146 m1 == m2
      #|  abs(-(x : Real)) == abs(x)
      #|  !(-(x : Real) == real_of_num(0))
      #|  -(x : Real)
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 greatest_m(fmt, -x) == greatest_m(fmt, x)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (a : Real) * (b : Real) + b == (a + real_of_num(1)) * b
      #|  ((x : Real) - (y : Real) < (z : Real)) == (x < y + z)
      #|  abs((x : Real) + real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) == -x - real_of_num(m) * ipow(real_of_num(flr(fmt)), e)
      #|  (x : Real) + real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (a : Real) * (b : Real) + b == (a + real_of_num(1)) * b
      #|  ((x : Real) - (y : Real) < (z : Real)) == (x < y + z)
      #|  abs((x : Real) - real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) == x - real_of_num(m) * ipow(real_of_num(flr(fmt)), e)
      #|  (x : Real) - real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num(0) <= (x : Real)
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 y : Real, greatest_r(fmt, x) == y && abs(y) < finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !((m : Num) + 1 <= m)
      #|  !((m : Num) + 1 <= m)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 greatest_r(fmt, -x) == -greatest_r(fmt, x)
      #|  (real_of_num(0) <= (z : Real) - (w : Real)) == (w <= z)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= greatest_r(fmt, x)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  (fmt : Flformat)
      #|  ((z : Real) + (w : Real) <= real_of_num(0)) == (w <= -z)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) && !(real_of_num(0) <= x) \226\134\146 greatest_r(fmt, x) <= real_of_num(0)
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 -x == abs(x)
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (if real_of_num(0) <= x { x == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + greatest_r(fmt, x) } else { x == -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + greatest_r(fmt, x) })
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (x : Real) * (y : Real) * (inv(y) * (z : Real)) == y * inv(y) * (x * z)
      #|  real_of_num(EXP(flr((fmt : Flformat)), (n : Num))) * inv(real_of_num(EXP(flr(fmt), n))) == real_of_num(1)
      #|  int_of_num(0) <= int_of_num((n : Num))
      #|  ipow(real_of_num(flr((fmt : Flformat))), int_of_num((n : Num))) == real_of_num(EXP(flr(fmt), n))
      #|  --int_of_num((n : Num)) == int_of_num(n)
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (e : Int) - int_of_num((n : Num)) - int_of_num(flp((fmt : Flformat))) + int_of_num(1) == -int_of_num(n) + (e - int_of_num(flp(fmt)) + int_of_num(1))
      #|  ((a : Num) < (b : Num)) == !(b <= a)
      #|  (n' : Num) < (n : Num)
      #|  (n'' : Num) == flp((fmt : Flformat)) - 1
      #|  (a : Num) * ((b : Num) * (c : Num)) == b * (a * c)
      #|  (fmt : Flformat)
      #|  0 < (a : Num) \226\134\146 !(a == 0)
      #|  ((a : Bool) || (b : Bool)) == (!a \226\134\146 b)
      #|  \226\136\131 n' : Num, (n : Num) == SUC(n')
      #|  (n : Num)
      #|  (e : Int) - int_of_num((n : Num))
      #|  (f : Num) * EXP(flr((fmt : Flformat)), (n : Num))
      #|  (n : Num) * (m : Num) == m * n
      #|  (n : Num) == n * 1
      #|  flp((fmt : Flformat)) - 1
      #|  \226\136\131 n : Num, EXP(flr((fmt : Flformat)), flp(fmt) - 1) <= (f : Num) * EXP(flr(fmt), n)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) \226\134\146 (\226\136\131 f : Num, \226\136\131 e : Int, EXP(flr(fmt), flp(fmt) - 1) <= f && is_frac_and_exp(fmt, x, f, e))
      #|  flr((fmt : Flformat))
      #|  (fmt : Flformat)
      #|  0 < (n : Num) \226\134\146 SUC(n - 1) == n
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  \226\136\128 a : Num, (x : Num) < (y : Num) && !(a == 0) \226\134\146 x < y
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1) - (f' : Num)
      #|  \226\136\128 b : Num, (a : Num) < b && b <= (c : Num) \226\134\146 a < c
      #|  (1 <= (b : Num)) == (0 < b)
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  (f' : Num)
      #|  (e : Int)
      #|  (m : Num)
      #|  \226\136\131 m : Num, \226\136\131 f' : Num, (f : Num) == m * EXP(flr((fmt : Flformat)), flp(fmt) - 1) + f' && f' < EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) \226\134\146 (\226\136\131 m : Num, \226\136\131 e : Int, \226\136\131 f' : Num, f' < EXP(flr(fmt), flp(fmt) - 1) && 1 <= m && m < flr(fmt) && abs(x) == real_of_num(m * EXP(flr(fmt), flp(fmt) - 1) + f') * ipow(real_of_num(flr(fmt)), e - int_of_num(flp(fmt)) + int_of_num(1)))
      #|  (a : Real) * (b : Real) == b * a
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (e : Int) - int_of_num(1) + ((e' : Int) - e + int_of_num(1)) == e'
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (e : Int) - int_of_num(1) + ((e' : Int) - e + int_of_num(1)) == e'
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  real_of_num(EXP(flr((fmt : Flformat)), flp(fmt) - 1)) * ipow(real_of_num(flr(fmt)), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  \226\136\128 b : Real, (a : Real) < b && b == (c : Real) \226\134\146 a < c
      #|  (a : Real) < (b : Real) && (c : Real) == (d : Real) \226\134\146 c + a < d + b
      #|  real_of_num((m : Num) + 1) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  \226\136\128 b : Real, (a : Real) < b && b <= (d : Real) \226\134\146 a < d
      #|  abs((x : Real)) < ipow(real_of_num(flr((fmt : Flformat))), (e : Int) + int_of_num(1))
      #|  1 < (x : Num) \226\134\146 1 <= x
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e' : Int))
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int) + int_of_num(1)) <= abs((x : Real))
      #|  (e : Int) - int_of_num(1) + ((e' : Int) - e + int_of_num(1)) == e'
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (e : Int) - int_of_num(1) + ((e' : Int) - e + int_of_num(1)) == e'
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  real_of_num(EXP(flr((fmt : Flformat)), flp(fmt) - 1)) * ipow(real_of_num(flr(fmt)), (e' : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  \226\136\128 b : Real, (a : Real) < b && b == (c : Real) \226\134\146 a < c
      #|  (a : Real) < (b : Real) && (c : Real) == (d : Real) \226\134\146 c + a < d + b
      #|  abs((x : Real)) < real_of_num((m : Num) + 1) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int))
      #|  real_of_num((m' : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int))
      #|  real_of_num((m : Num) + 1) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int)) <= abs((x : Real))
      #|  (x : Int) - int_of_num(1) + ((e : Int) - x + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) == (b : Real) && real_of_num(0) <= (c : Real) \226\134\146 a <= b + c
      #|  real_of_num((m : Num) * EXP(flr((fmt : Flformat)), flp(fmt) - 1) + (f' : Num)) * ipow(real_of_num(flr(fmt)), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int)) <= abs((x : Real))
      #|  (x : Int) - int_of_num(1) + ((e : Int) - x + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) == (b : Real) && real_of_num(0) <= (c : Real) \226\134\146 a <= b + c
      #|  real_of_num((m : Num) * EXP(flr((fmt : Flformat)), flp(fmt) - 1) + (f' : Num)) * ipow(real_of_num(flr(fmt)), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  (x : Real) == real_of_num(1) * x
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((x : Real))
      #|  (f' : Num)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) \226\134\146 (\226\136\131 f' : Num, f' < EXP(flr(fmt), flp(fmt) - 1) && abs(x) == real_of_num(greatest_m(fmt, x) * EXP(flr(fmt), flp(fmt) - 1) + f') * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x) - int_of_num(flp(fmt)) + int_of_num(1)))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (e : Int) <= (b : Int) \226\134\146 e == b || e < b
      #|  (e : Num) <= (b : Num) \226\134\146 e == b || e < b
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(-x) == x
      #|  (f' : Num)
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  ((a : Real) + (b : Real) == (c : Real) + b) == (a == c)
      #|  (-(a : Real) + (b : Real) == -(c : Real)) == (a == b + c)
      #|  (x : Real) == -abs(x)
      #|  (x : Real) + real_of_num(greatest_m((fmt : Flformat), x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == -(real_of_num((f' : Num)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x) - int_of_num(flp(fmt)) + int_of_num(1)))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (f' : Num)
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  ((a : Real) + (b : Real) == (c : Real) + b) == (a == c)
      #|  ((a : Real) - (b : Real) == (c : Real)) == (a == b + c)
      #|  (x : Real) == abs(x)
      #|  (x : Real) - real_of_num(greatest_m((fmt : Flformat), x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == real_of_num((f' : Num)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  real_of_num(0) <= (x : Real)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) \226\134\146 is_fixed(to_fformat(fmt, greatest_e(fmt, x)), greatest_r(fmt, x)) && (if real_of_num(0) <= x { x == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + greatest_r(fmt, x) } else { x == -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + greatest_r(fmt, x) })
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  real_of_num((m : Num) + 1) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  ((x : Real) < x + (y : Real)) == (real_of_num(0) < y)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  \226\136\128 y : Real, (x : Real) < y && y <= (z : Real) \226\134\146 x < z
      #|  !((i : Real) <= (j : Real)) == (j < i)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  0 < (x : Num) \226\134\146 1 <= x
      #|  (a : Real) * (b : Real) == b * a
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int) + int_of_num(1))
      #|  ((x : Real) < x + (y : Real)) == (real_of_num(0) < y)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  \226\136\128 y : Real, (x : Real) < y && y <= (z : Real) \226\134\146 x < z
      #|  !((i : Real) <= (j : Real)) == (j < i)
      #|  (x : Real) == real_of_num(1) * x
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 e : Int, \226\136\128 m : Num, !(x == real_of_num(0)) && 1 <= m && m < flr(fmt) && abs(x) == real_of_num(m) * ipow(real_of_num(flr(fmt)), e) \226\134\146 greatest_e(fmt, x) == e && greatest_m(fmt, x) == m
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int) && greatest_m(fmt, x) == (m : Num)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 e : Int, \226\136\128 m : Num, !(x == real_of_num(0)) && 1 <= m && m < flr(fmt) && abs(x) == real_of_num(m) * ipow(real_of_num(flr(fmt)), e) \226\134\146 greatest_r(fmt, x) == real_of_num(0)
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  real_of_num((m : Num) + 1) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  \226\136\128 y : Real, (x : Real) < y && y <= (z : Real) \226\134\146 x < z
      #|  !((i : Real) <= (j : Real)) == (j < i)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  0 < (x : Num) \226\134\146 1 <= x
      #|  (a : Real) * (b : Real) == b * a
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int) + int_of_num(1))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  \226\136\128 y : Real, (x : Real) < y && y <= (z : Real) \226\134\146 x < z
      #|  !((i : Real) <= (j : Real)) == (j < i)
      #|  (x : Real) == real_of_num(1) * x
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 e : Int, \226\136\128 m : Num, !(x == real_of_num(0)) && 1 <= m && m < flr(fmt) && real_of_num(m) * ipow(real_of_num(flr(fmt)), e) <= abs(x) && abs(x) < real_of_num(m) * ipow(real_of_num(flr(fmt)), e) + finf(to_fformat(fmt, e)) \226\134\146 greatest_e(fmt, x) == e && greatest_m(fmt, x) == m
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (m : Num) + 1 == flr((fmt : Flformat))
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  real_of_num(fr(to_fformat((fmt : Flformat), (e : Int))))
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  fr(to_fformat((fmt : Flformat), (e : Int)))
      #|  -fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) == ipow(real_of_num(flr(fmt)), e)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) <= real_of_num(0)
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  ((x : Num) - 1 < x) == (0 < x)
      #|  1 <= (x : Num) \226\134\146 0 < x
      #|  greatest_e((fmt : Flformat), (x : Real)) + int_of_num(1)
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  real_of_num(fr(to_fformat((fmt : Flformat), (e : Int))))
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  fr(to_fformat((fmt : Flformat), (e : Int)))
      #|  -fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) == ipow(real_of_num(flr(fmt)), e)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) <= real_of_num(0)
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (fmt : Flformat)
      #|  0 < (x : Num) \226\134\146 SUC(x - 1) == x
      #|  flr((fmt : Flformat)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  1 <= (x : Num) \226\134\146 0 < x
      #|  0 < (m : Num) + 1
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (greatest_m((fmt : Flformat), (x : Real)) + 1) * EXP(flr(fmt), flp(fmt) - 1)
      #|  greatest_m((fmt : Flformat), (x : Real)) < flr(fmt) - 1
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) <= real_of_num(0)
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  ((x : Real) + (y : Real)) * (z : Real) == x * z + y * z
      #|  (0 < (x : Num)) == (SUC(x - 1) == x)
      #|  !((x : Num) == 0) == (x - 1 + 1 == x)
      #|  ((n : Num) - 1) * (z : Num) + z == (n - 1 + 1) * z
      #|  ff(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x))) < EXP(fr(to_fformat(fmt, greatest_e(fmt, x))), fp(to_fformat(fmt, greatest_e(fmt, x))) - 1)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  (flr((fmt : Flformat)) - 1) * EXP(flr(fmt), flp(fmt) - 1) + EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) <= (flr(fmt) - 1) * EXP(flr(fmt), flp(fmt) - 1)
      #|  (0 < (x : Num)) == (1 <= x)
      #|  0 < (x : Num) \226\134\146 0 < x + (y : Num)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) + ff(to_fformat(fmt, greatest_e(fmt, x)), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x)))
      #|  is_fixed(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x)))
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (m : Num) + 1 == flr((fmt : Flformat))
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  real_of_num(fr(to_fformat((fmt : Flformat), (e : Int))))
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  fr(to_fformat((fmt : Flformat), (e : Int)))
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) == ipow(real_of_num(flr(fmt)), e)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  real_of_num(0) <= fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real))
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  ((x : Num) - 1 < x) == (0 < x)
      #|  1 <= (x : Num) \226\134\146 0 < x
      #|  greatest_e((fmt : Flformat), (x : Real)) + int_of_num(1)
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (x : Real) * (y : Real) + y == (x + real_of_num(1)) * y
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  real_of_num(fr(to_fformat((fmt : Flformat), (e : Int))))
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  fr(to_fformat((fmt : Flformat), (e : Int)))
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real)) == ipow(real_of_num(flr(fmt)), e)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  real_of_num(0) <= fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real))
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (fmt : Flformat)
      #|  0 < (x : Num) \226\134\146 SUC(x - 1) == x
      #|  flr((fmt : Flformat)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  1 <= (x : Num) \226\134\146 0 < x
      #|  0 < (m : Num) + 1
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (greatest_m((fmt : Flformat), (x : Real)) + 1) * EXP(flr(fmt), flp(fmt) - 1)
      #|  greatest_m((fmt : Flformat), (x : Real)) < flr(fmt) - 1
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  (e : Int)
      #|  (fmt : Flformat)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  real_of_num(0) <= fround(to_fformat((fmt : Flformat), (e : Int)), (mode : Roundmode), (y : Real))
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (i : Int) - int_of_num(1) + ((e : Int) - i + int_of_num(1)) == e
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  ((x : Real) + (y : Real)) * (z : Real) == x * z + y * z
      #|  (0 < (x : Num)) == (SUC(x - 1) == x)
      #|  !((x : Num) == 0) == (x - 1 + 1 == x)
      #|  ((n : Num) - 1) * (z : Num) + z == (n - 1 + 1) * z
      #|  ff(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x))) < EXP(fr(to_fformat(fmt, greatest_e(fmt, x))), fp(to_fformat(fmt, greatest_e(fmt, x))) - 1)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  (flr((fmt : Flformat)) - 1) * EXP(flr(fmt), flp(fmt) - 1) + EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) <= (flr(fmt) - 1) * EXP(flr(fmt), flp(fmt) - 1)
      #|  (0 < (x : Num)) == (1 <= x)
      #|  0 < (x : Num) \226\134\146 0 < x + (y : Num)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) + ff(to_fformat(fmt, greatest_e(fmt, x)), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x)))
      #|  is_fixed(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), fround(to_fformat(fmt, greatest_e(fmt, x)), (mode : Roundmode), greatest_r(fmt, x)))
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 mode : Roundmode, !(x == real_of_num(0)) \226\134\146 is_float(fmt, flround(fmt, mode, x))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  (x : Num) <= (y : Num) \226\134\146 x < y || x == y
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 abs(x + y) == x + y
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 abs(x + y) == x + y
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 abs(x + y) == x + y
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  (x : Num) <= (y : Num) \226\134\146 x < y || x == y
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && (y : Real) <= real_of_num(0) \226\134\146 abs(-x + y) == x + -y
      #|  (x : Real) <= real_of_num(0) \226\134\146 -x == abs(x)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && (y : Real) <= real_of_num(0) \226\134\146 abs(-x + y) == x + -y
      #|  (x : Real) <= real_of_num(0) \226\134\146 -x == abs(x)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) && (y : Real) <= real_of_num(0) \226\134\146 abs(-x + y) == x + -y
      #|  (x : Real) <= real_of_num(0) \226\134\146 -x == abs(x)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, x < y && y <= a \226\134\146 closer(y, x, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, closer(x, y, a) && (closer(z, x, a) || !closer(x, z, a)) \226\134\146 closer(z, y, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, a <= y && y < x \226\134\146 closer(y, x, a)
      #|  (fl_is_closest : (Flformat, Real, Real) -> Bool)((fmt : Flformat), (x : Real), (y : Real)) == (\226\136\128 s : Real, is_float(fmt, s) && !(s == y) \226\134\146 closer(y, s, x) || !closer(s, y, x))
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  ((x : Real) == (y : Real)) == (-(real_of_num(greatest_m((fmt : Flformat), (s : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, s))) + x == -(real_of_num(greatest_m(fmt, s)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, s))) + y)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (s : Real)) == (e : Int) && greatest_m(fmt, s) == (m : Num)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  real_of_num(0) < (x : Real) \226\134\146 -x < real_of_num(0)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  \226\136\128 y : Real, y < real_of_num(0) && (s : Real) <= y \226\134\146 s < real_of_num(0)
      #|  (s : Real) < real_of_num(0) \226\134\146 !(s == real_of_num(0))
      #|  !((s : Real) == real_of_num(0))
      #|  real_of_num(0) <= (x : Real) \226\134\146 -x <= real_of_num(0)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  (s : Real) <= real_of_num(0)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) - (y : Real) - (x + (z : Real)) == -y - z
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == -finf(to_fformat(fmt, e))
      #|  (s : Real) == -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) - finf(to_fformat(fmt, e))
      #|  !(fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == -finf(to_fformat(fmt, e)))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) - (y : Real) - (x + (z : Real)) == -y - z
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == -finf(to_fformat(fmt, e))
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (-(x : Real) <= -(y : Real)) == (y <= x)
      #|  ((x : Real) + (y : Real) <= real_of_num(0)) == (x <= -y)
      #|  (y' : Real) <= real_of_num(0)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  ((x : Real) + (y : Real) <= x + (z : Real)) == (y <= z)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) - finf(to_fformat(fmt, e))
      #|  (s : Real) < -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) - finf(to_fformat(fmt, e))
      #|  !(fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == real_of_num(0))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) - (x + (z : Real)) == real_of_num(0) - z
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == real_of_num(0)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (-(x : Real) <= -(y : Real)) == (y <= x)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) < (s : Real)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) + fround(to_fformat(fmt, e), To_near, (y : Real))
      #|  !(real_of_num(0) <= (x : Real))
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  ((x : Real) == (y : Real)) == (real_of_num(greatest_m((fmt : Flformat), (s : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, s)) + x == real_of_num(greatest_m(fmt, s)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, s)) + y)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (s : Real)) == (e : Int) && greatest_m(fmt, s) == (m : Num)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  \226\136\128 y : Real, real_of_num(0) < y && y <= (s : Real) \226\134\146 real_of_num(0) < s
      #|  real_of_num(0) < (s : Real) \226\134\146 !(s == real_of_num(0))
      #|  !((s : Real) == real_of_num(0))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num(0) <= (s : Real)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == finf(to_fformat(fmt, e))
      #|  (s : Real) == real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  !(fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == finf(to_fformat(fmt, e)))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == finf(to_fformat(fmt, e))
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (real_of_num(0) <= (x : Real) - (y : Real)) == (y <= x)
      #|  real_of_num(0) <= (y' : Real)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  ((x : Real) + (y : Real) <= x + (z : Real)) == (y <= z)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e)) < (s : Real)
      #|  !(fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == real_of_num(0))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  (x : Real) - (x + (z : Real)) == real_of_num(0) - z
      #|  (x : Real) + (y : Real) - (x + (z : Real)) == y - z
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), To_near, (y : Real)) == real_of_num(0)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (s : Real) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + fround(to_fformat(fmt, e), To_near, (y : Real))
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 z : Real, flround(fmt, To_near, x) == z && fl_is_closest(fmt, x, z))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  1 <= (m' : Num) \226\134\146 0 < m'
      #|  real_of_num(0) <= (s : Real) \226\134\146 abs(s) == s
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 x == -abs(x)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 x == -abs(x)
      #|  (fmt : Flformat)
      #|  (x : Real) <= real_of_num(0) \226\134\146 x == -abs(x)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (fmt : Flformat)
      #|  1 <= (m' : Num) \226\134\146 0 < m'
      #|  (s : Real) <= real_of_num(0) \226\134\146 abs(s) == -s
      #|  (fmt : Flformat)
      #|  !((s : Real) == real_of_num(0)) && s <= real_of_num(0) \226\134\146 !(real_of_num(0) <= s)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  (fmt : Flformat)
      #|  0 < (x : Num) \226\134\146 SUC(x - 1) == x
      #|  flr((fmt : Flformat)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 is_float(fmt, real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  abs(-(x : Real)) == abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, is_float(fmt, x) == is_float(fmt, -x)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  (z : Real) == abs(z)
      #|  (x : Real) * (z : Real) + z == (x + real_of_num(1)) * z
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  ((a : Real) + (b : Real)) * (c : Real) == a * c + b * c
      #|  (fmt : Flformat)
      #|  flp((fmt : Flformat)) == SUC(flp(fmt) - 1)
      #|  (m : Num) * (n : Num) + n == (m + 1) * n
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  abs((z : Real)) < finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) + EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y <= (z : Num) \226\134\146 x < z
      #|  flr((fmt : Flformat)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  0 < (x : Num) \226\134\146 0 < x + (y : Num)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_m((fmt : Flformat), (x : Real)) * EXP(flr(fmt), flp(fmt) - 1) + ff(to_fformat(fmt, greatest_e(fmt, x)), (z : Real))
      #|  (x : Real) * (z : Real) + z == (x + real_of_num(1)) * z
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  flp((fmt : Flformat)) == SUC(flp(fmt) - 1)
      #|  flr((fmt : Flformat)) * EXP(flr(fmt), flp(fmt) - 1)
      #|  \226\136\128 y : Num, (x : Num) < y && y == (z : Num) \226\134\146 x < z
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (greatest_m((fmt : Flformat), (x : Real)) + 1) * EXP(flr(fmt), flp(fmt) - 1)
      #|  (a : Int) + (b : Int) == b + a
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  ((x : Real) - real_of_num(1)) * (z : Real) + z == x * z
      #|  (fmt : Flformat)
      #|  1 <= flr((fmt : Flformat))
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  flr((fmt : Flformat))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  (n : Num) == 1 * n
      #|  (fmt : Flformat)
      #|  0 < (n : Num) \226\134\146 n == SUC(n - 1)
      #|  greatest_e((fmt : Flformat), (x : Real)) + int_of_num(1)
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  greatest_m((fmt : Flformat), (x : Real)) == flr(fmt) - 1
      #|  (z : Real) == finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 abs(x + y) == x + y
      #|  \226\136\128 m : Num, abs(real_of_num(m) * ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) + (z : Real)) == real_of_num(m) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + z
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 z : Real, !(x == real_of_num(0)) && real_of_num(0) <= z && is_fixed(to_fformat(fmt, greatest_e(fmt, x)), z) \226\134\146 is_float(fmt, real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + z)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  -(-(x : Real) + (z : Real)) == x + -z
      #|  real_of_num(0) <= -(z : Real)
      #|  is_fixed(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), -(z : Real))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 z : Real, !(x == real_of_num(0)) && !(real_of_num(0) <= z) && is_fixed(to_fformat(fmt, greatest_e(fmt, x)), z) \226\134\146 is_float(fmt, -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + z)
      #|  greatest_r((fmt : Flformat), (y : Real))
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (y : Real)) == greatest_e(fmt, (x : Real)) && greatest_m(fmt, y) == greatest_m(fmt, x)
      #|  !closer(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + -finf(to_fformat(fmt, greatest_e(fmt, x))), (y : Real), x)
      #|  closer((y : Real), -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + -finf(to_fformat(fmt, greatest_e(fmt, x))), x)
      #|  (x : Real) + ((y : Real) - -(-x + (z : Real))) == y - -z
      #|  (x : Real) + ((y : Real) - (x + (z : Real))) == y - z
      #|  abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (-finf(to_fformat(fmt, greatest_e(fmt, x))) - x)) == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (finf(to_fformat(fmt, greatest_e(fmt, x))) - -x)
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + -finf(to_fformat(fmt, greatest_e(fmt, x))) == (y : Real))
      #|  !(real_of_num(0) <= -(x : Real)) == (real_of_num(0) < x)
      #|  is_float((fmt : Flformat), -(real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + -finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  real_of_num(0) < real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  !closer(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))), (y : Real), x)
      #|  closer((y : Real), real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))), x)
      #|  (x : Real) + ((y : Real) - (x + (z : Real))) == y - z
      #|  abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (finf(to_fformat(fmt, greatest_e(fmt, x))) - x)) == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (finf(to_fformat(fmt, greatest_e(fmt, x))) - x)
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))) == (y : Real))
      #|  is_float((fmt : Flformat), real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  real_of_num(0) <= real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  real_of_num(0) <= (x : Real)
      #|  abs((y : Real)) < real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  !closer(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))), (y : Real), x)
      #|  closer((y : Real), -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))), x)
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) == (y : Real))
      #|  abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) - x) == -x - real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  !closer(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)), (y : Real), x)
      #|  closer((y : Real), real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)), x)
      #|  abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) - x) == x - real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == (y : Real))
      #|  real_of_num(0) <= real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) <= (x : Real)
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) <= abs((y : Real))
      #|  -finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  real_of_num(0) <= (y : Real)
      #|  abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  real_of_num(0)
      #|  (fmt : Flformat)
      #|  ((a : Bool) && (b : Bool)) == (b && a)
      #|  abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 y : Real, !(x == real_of_num(0)) && is_float(fmt, y) && fl_is_closest(fmt, x, y) \226\134\146 (!(abs(y) == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))) \226\134\146 greatest_m(fmt, y) == greatest_m(fmt, x) && greatest_e(fmt, y) == greatest_e(fmt, x)) && (\226\136\131 z : Real, is_fixed(to_fformat(fmt, greatest_e(fmt, x)), z) && (if real_of_num(0) <= y { y == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + z } else { y == -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + z }))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !closer(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)), (y : Real), x)
      #|  closer((y : Real), real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)), x)
      #|  abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) - x) == x - real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == (y : Real))
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == (y : Real)
      #|  real_of_num(0) <= real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 y : Real, !(x == real_of_num(0)) && real_of_num(0) <= x && fl_is_closest(fmt, x, y) \226\134\146 real_of_num(0) <= y
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !closer(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))), (y : Real), x)
      #|  closer((y : Real), -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))), x)
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) == (y : Real))
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) == (y : Real)
      #|  abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) - x) == -x - real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 y : Real, !(x == real_of_num(0)) && !(real_of_num(0) <= x) && fl_is_closest(fmt, x, y) \226\134\146 !(real_of_num(0) <= y)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (closer(x, y, a) || !closer(y, x, a)) && y <= a && z < y \226\134\146 closer(x, z, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, (closer(x, y, a) || !closer(y, x, a)) && a <= y && y < z \226\134\146 closer(x, z, a)
      #|  -(x : Real) * (y : Real) == -(x * y)
      #|  ((y : Real) + (x : Real) == (z : Real)) == (y == -x + z)
      #|  ((y : Real) - (x : Real) == (z : Real)) == (y == x + z)
      #|  greatest_r((fmt : Flformat), (y : Real)) == (z : Real)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  1 < (x : Num) \226\134\146 !(x - 1 == 0)
      #|  ff(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), -finf(to_fformat(fmt, greatest_e(fmt, x)))) == ff(to_fformat(fmt, greatest_e(fmt, x)), finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  (z : Real) == -finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  1 < (x : Num) \226\134\146 !(x - 1 == 0)
      #|  (z : Real) == finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  real_of_num(0) <= (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  ((x : Real) + real_of_num(1)) * (z : Real) == x * z + z
      #|  !(greatest_m((fmt : Flformat), (x : Real)) == flr(fmt) - 1)
      #|  (x : Num) < (y : Num) && !(x == y - 1) \226\134\146 x < y - 1
      #|  ((m : Num) + 1 < flr((fmt : Flformat))) == (m < flr(fmt) - 1)
      #|  (fmt : Flformat)
      #|  greatest_m((fmt : Flformat), (x : Real)) + 1
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  1 < (n : Num) \226\134\146 1 <= n
      #|  real_of_num(flr((fmt : Flformat))) - real_of_num(1) == real_of_num(flr(fmt) - 1)
      #|  (x : Real) * (y : Real) == (x - real_of_num(1)) * y + y
      #|  real_of_num(1) * ((x : Real) * (y : Real)) == y * x
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (fmt : Flformat)
      #|  1
      #|  greatest_e((fmt : Flformat), (x : Real)) + int_of_num(1)
      #|  greatest_m((fmt : Flformat), (x : Real)) == flr(fmt) - 1
      #|  greatest_r((fmt : Flformat), (y : Real)) == real_of_num(0)
      #|  abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (s : Real) == (y : Real))
      #|  is_float((fmt : Flformat), -(real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (s : Real))
      #|  (a : Real) + ((b : Real) - (c : Real)) == a + b - c
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (z : Real) == (y : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (y : Real))
      #|  abs((z : Real) - (y : Real)) == abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (z - (-(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + y)))
      #|  real_of_num(0)
      #|  real_of_num(0) < (s : Real)
      #|  (s : Real) == real_of_num(0)
      #|  real_of_num(0) <= (s : Real)
      #|  real_of_num(0)
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (s : Real) == (y : Real))
      #|  is_float((fmt : Flformat), real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (s : Real))
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (z : Real) == (y : Real)
      #|  (a : Real) + ((b : Real) - (c : Real)) == a + b - c
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (y : Real)
      #|  abs((z : Real) - (y : Real)) == abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (z - (real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + y)))
      #|  real_of_num(0) <= (s : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) == (y : Real))
      #|  (x : Real) == x + real_of_num(0)
      #|  is_float((fmt : Flformat), -(real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))))
      #|  (x : Real) + real_of_num(0) == x
      #|  (x : Real) + (real_of_num(0) - (y : Real)) == x - y
      #|  (a : Real) + ((b : Real) - (c : Real)) == a + b - c
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (z : Real) == (y : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (y : Real))
      #|  abs((z : Real) - (y : Real)) == abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (z - (-(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + y)))
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + real_of_num(0) == (y : Real))
      #|  is_float((fmt : Flformat), real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + real_of_num(0))
      #|  (a : Real) + ((b : Real) - (y : Real)) == a + b - y
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (z : Real) == (y : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (y : Real)
      #|  abs((z : Real) - (y : Real)) == abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (z - (real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + y)))
      #|  real_of_num(0) <= (x : Real)
      #|  closer((z : Real), real_of_num(0), greatest_r((fmt : Flformat), (x : Real))) || !closer(real_of_num(0), z, greatest_r(fmt, x))
      #|  (a : Real) + ((b : Real) - (c : Real)) == a + b - c
      #|  !(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (s : Real) == (y : Real))
      #|  is_float((fmt : Flformat), -(real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (s : Real))
      #|  (x : Real) + (real_of_num(0) - (y : Real)) == x - y
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) == (y : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (y : Real))
      #|  abs((z : Real) - (y : Real)) == abs(-(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + (z - (-(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + y)))
      #|  real_of_num(0) < (s : Real)
      #|  real_of_num(0) <= (s : Real)
      #|  (a : Real) + ((b : Real) - (c : Real)) == a + b - c
      #|  !(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (s : Real) == (y : Real))
      #|  is_float((fmt : Flformat), real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (s : Real))
      #|  (x : Real) + (real_of_num(0) - (y : Real)) == x - y
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) == (y : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (y : Real)
      #|  abs((z : Real) - (y : Real)) == abs(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + (z - (real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + y)))
      #|  real_of_num(0) <= (s : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  greatest_m((fmt : Flformat), (x : Real))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  greatest_r((fmt : Flformat), (y : Real)) == real_of_num(0)
      #|  ((a : Bool) && (b : Bool)) == (b && a)
      #|  !(real_of_num(0) == (y : Real)) \226\134\146 !((x : Real) == x + y)
      #|  !(abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  (z : Real) == real_of_num(0)
      #|  (z : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 y : Real, !(x == real_of_num(0)) && is_float(fmt, y) && fl_is_closest(fmt, x, y) \226\134\146 (\226\136\131 z : Real, is_fixed(to_fformat(fmt, greatest_e(fmt, x)), z) && is_closest(to_fformat(fmt, greatest_e(fmt, x)), greatest_r(fmt, x), z) && (if real_of_num(0) <= y { y == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + z } else { y == -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + z }) && EVEN(ff(to_fformat(fmt, greatest_e(fmt, y)), greatest_r(fmt, y))) == EVEN(ff(to_fformat(fmt, greatest_e(fmt, x)), z)))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  !(abs((y : Real)) == real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + finf(to_fformat(fmt, greatest_e(fmt, x))))
      #|  (fl_norm_frac : (Flformat, Real) -> Num)((fmt : Flformat), (y : Real)) == greatest_m(fmt, y) * EXP(flr(fmt), flp(fmt) - 1) + ff(to_fformat(fmt, greatest_e(fmt, y)), greatest_r(fmt, y))
      #|  (fl_to_even : (Flformat, Real, Real) -> Bool)((fmt : Flformat), (x : Real), (y : Real)) == (\226\136\128 y2 : Real, is_float(fmt, y2) && fl_is_closest(fmt, x, y) && fl_is_closest(fmt, x, y2) && !(y2 == y) \226\134\146 EVEN(fl_norm_frac(fmt, y)))
      #|  (z : Real)
      #|  to_even(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), greatest_r(fmt, x), (z' : Real))
      #|  is_frac(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), (z' : Real), ff(to_fformat(fmt, greatest_e(fmt, x)), z'))
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (y2 : Real))
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= flround((fmt : Flformat), To_near, (x : Real)))
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (y2 : Real)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= flround((fmt : Flformat), To_near, (x : Real))
      #|  real_of_num(0) <= (x : Real)
      #|  !((z : Real) == (z' : Real))
      #|  IN((z : Real), fixed(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))))
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  abs(greatest_r((fmt : Flformat), (x : Real))) <= finf(to_fformat(fmt, greatest_e(fmt, x)))
      #|  !((x : Num) - 1 == 0) == (1 < x)
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + fround(to_fformat(fmt, greatest_e(fmt, x)), To_near, greatest_r(fmt, x)) == flround(fmt, To_near, x)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= flround((fmt : Flformat), To_near, (x : Real)))
      #|  ((x : Real) == (y : Real)) == (-(real_of_num(greatest_m((fmt : Flformat), x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + x == -(real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) + y)
      #|  real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + fround(to_fformat(fmt, greatest_e(fmt, x)), To_near, greatest_r(fmt, x)) == flround(fmt, To_near, x)
      #|  (x : Real)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= flround((fmt : Flformat), To_near, (x : Real))
      #|  ((x : Real) == (y : Real)) == (real_of_num(greatest_m((fmt : Flformat), x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + x == real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) + y)
      #|  real_of_num(0) <= (x : Real)
      #|  fround(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))), To_near, greatest_r(fmt, x)) == (z' : Real)
      #|  is_float((fmt : Flformat), flround(fmt, To_near, (x : Real)))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 fl_to_even(fmt, x, flround(fmt, To_near, x))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))
      #|  (fl_to_zero : (Flformat, Real, Real) -> Bool)((fmt : Flformat), (x : Real), (y : Real)) == (if real_of_num(0) <= x { real_of_num(0) <= y && y <= x && (\226\136\128 y' : Real, is_float(fmt, y') && y' <= x \226\134\146 y' <= y) } else { y <= real_of_num(0) && x <= y && (\226\136\128 y' : Real, is_float(fmt, y') && x <= y' \226\134\146 y <= y') })
      #|  (y'' : Real) == real_of_num(0)
      #|  (y : Real) == real_of_num(0)
      #|  real_of_num(0) <= (y : Real)
      #|  !(real_of_num(0) <= (y : Real))
      #|  (y : Real) <= real_of_num(0)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  (y : Real) <= greatest_r((fmt : Flformat), (y' : Real))
      #|  !(real_of_num(0) <= (y' : Real))
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  real_of_num(0) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  \226\136\128 z : Real, real_of_num(0) < z && (y : Real) <= -z \226\134\146 !(y == real_of_num(0))
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  (y'' : Real) <= real_of_num(0)
      #|  -(y'' : Real) == abs(y'')
      #|  -(-(z : Real) + (y : Real)) == z + -y
      #|  abs((x : Real)) == -x
      #|  abs((x : Real))
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  (real_of_num(0) <= -(x : Real)) == (x <= real_of_num(0))
      #|  (x : Real) < (y : Real) && real_of_num(0) <= (z : Real) \226\134\146 x <= y + z
      #|  (-(z : Real) + (y : Real) <= (y' : Real)) == (-y' <= z + -y)
      #|  -(real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))) < (y' : Real)
      #|  real_of_num(0) <= (y : Real)
      #|  !(real_of_num(0) <= (y : Real))
      #|  (y' : Real) <= real_of_num(0)
      #|  (y : Real) <= real_of_num(0)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  (real_of_num(0) <= -(x : Real)) == (x <= real_of_num(0))
      #|  (-(z : Real) + (y : Real) <= real_of_num(0)) == (real_of_num(0) <= z + -y)
      #|  real_of_num(0) <= (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_m((fmt : Flformat), (x : Real)) == (m : Num)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  greatest_r((fmt : Flformat), (y' : Real)) <= (y : Real)
      #|  real_of_num(0) <= (y' : Real)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  \226\136\128 z : Real, real_of_num(0) < z && z <= (y : Real) \226\134\146 !(y == real_of_num(0))
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  real_of_num(0) <= (y'' : Real)
      #|  (y'' : Real) == abs(y'')
      #|  abs((x : Real)) == x
      #|  abs((x : Real))
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  real_of_num(0) <= real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  (x : Real) < (y : Real) && real_of_num(0) <= (z : Real) \226\134\146 x <= y + z
      #|  (y' : Real) < real_of_num(greatest_m((fmt : Flformat), (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) <= (y : Real)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 fl_to_zero(fmt, x, flround(fmt, To_zero, x))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (y : Real))
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  !(real_of_num(0) <= (y : Real))
      #|  (fl_to_pinf : (Flformat, Real, Real) -> Bool)((fmt : Flformat), (x : Real), (y : Real)) == (x <= y && (\226\136\128 y' : Real, is_float(fmt, y') && x <= y' \226\134\146 y <= y'))
      #|  ((a : Real) <= (b : Real)) == (-(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) + a <= -(real_of_num(m) * ipow(real_of_num(flr(fmt)), e)) + b)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  !(real_of_num(0) <= (y' : Real))
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  (y : Real) <= real_of_num(0)
      #|  -(y : Real) == abs(y)
      #|  -(-(a : Real) + (b : Real)) == a + -b
      #|  abs((x : Real)) == -x
      #|  abs((x : Real))
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  (-(x : Real) < real_of_num(0)) == (real_of_num(0) < x)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  (y' : Real) < real_of_num(0)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  (z : Real) == z + real_of_num(0)
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)))
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) <= (y' : Real)
      #|  ((a : Real) <= (b : Real)) == (real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + a <= real_of_num(m) * ipow(real_of_num(flr(fmt)), e) + b)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  real_of_num(0) <= (y' : Real)
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  abs((x : Real))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  IN(fround(to_fformat((fmt : Flformat), (e : Int)), To_pinf, (y : Real)), fixed(to_fformat(fmt, e)))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e)) <= (y' : Real)
      #|  real_of_num(0) <= (x : Real)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 fl_to_pinf(fmt, x, flround(fmt, To_pinf, x))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fl_to_ninf : (Flformat, Real, Real) -> Bool)((fmt : Flformat), (x : Real), (y : Real)) == (y <= x && (\226\136\128 y' : Real, is_float(fmt, y') && y' <= x \226\134\146 y' <= y))
      #|  ((a : Real) <= (b : Real)) == (-(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) + a <= -(real_of_num(m) * ipow(real_of_num(flr(fmt)), e)) + b)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  !(real_of_num(0) <= (y' : Real))
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  abs((x : Real))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  (y' : Real) < real_of_num(0)
      #|  IN(fround(to_fformat((fmt : Flformat), (e : Int)), To_ninf, (y : Real)), fixed(to_fformat(fmt, e)))
      #|  -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) + -finf(to_fformat(fmt, e))
      #|  (y' : Real) <= -(real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))) + -finf(to_fformat(fmt, e))
      #|  ((a : Real) <= (b : Real)) == (real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + a <= real_of_num(m) * ipow(real_of_num(flr(fmt)), e) + b)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  real_of_num(0) <= (y' : Real)
      #|  (fmt : Flformat)
      #|  greatest_e((fmt : Flformat), (y' : Real)) == (e : Int) && greatest_m(fmt, y') == (m : Num)
      #|  real_of_num(0) <= (y : Real)
      #|  (y : Real) == abs(y)
      #|  abs((x : Real)) == x
      #|  abs((x : Real))
      #|  abs((y' : Real)) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) + finf(to_fformat(fmt, e))
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num(0) <= (y' : Real)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= abs((y' : Real))
      #|  (x : Real) == x + real_of_num(0)
      #|  real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  (a : Real) < (b : Real) \226\134\146 a <= b
      #|  (y' : Real) < real_of_num((m : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int))
      #|  real_of_num(0) <= (x : Real)
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  abs((y : Real)) <= finf(to_fformat((fmt : Flformat), (e : Int)))
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 fl_to_ninf(fmt, x, flround(fmt, To_ninf, x))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  to_fformat((fmt : Flformat), (e : Int))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 abs(flround(fmt, To_near, x) - x) <= fulp(to_fformat(fmt, greatest_e(fmt, x))) / real_of_num(2)
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 abs(flround(fmt, To_zero, x) - x) <= fulp(to_fformat(fmt, greatest_e(fmt, x)))
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 abs(flround(fmt, To_pinf, x) - x) <= fulp(to_fformat(fmt, greatest_e(fmt, x)))
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  (a : Real) + (b : Real) - (a + (c : Real)) == b - c
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 abs(flround(fmt, To_ninf, x) - x) <= fulp(to_fformat(fmt, greatest_e(fmt, x)))
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Flformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  (fmt : Flformat)
      #|  (e : Int) - (p : Int) + int_of_num(1) + -e == int_of_num(1) - p
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) / (b : Real) * (c : Real) == a * c / b
      #|  ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) == inv(ipow(real_of_num(flr(fmt)), -greatest_e(fmt, x)))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) < fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / real_of_num(2)
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / real_of_num(2) / ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < abs((x : Real))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / real_of_num(2) / abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 rerror(x, flround(fmt, To_near, x)) <= fl_eps(fmt)
      #|  (fmt : Flformat)
      #|  (e : Int) - (p : Int) + int_of_num(1) + -e == int_of_num(1) - p
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) / (b : Real) * (c : Real) == a * c / b
      #|  ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) == inv(ipow(real_of_num(flr(fmt)), -greatest_e(fmt, x)))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) < fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < abs((x : Real))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 rerror(x, flround(fmt, To_zero, x)) <= real_of_num(2) * fl_eps(fmt)
      #|  (fmt : Flformat)
      #|  (e : Int) - (p : Int) + int_of_num(1) + -e == int_of_num(1) - p
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) / (b : Real) * (c : Real) == a * c / b
      #|  ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) == inv(ipow(real_of_num(flr(fmt)), -greatest_e(fmt, x)))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) < fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < abs((x : Real))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 rerror(x, flround(fmt, To_pinf, x)) <= real_of_num(2) * fl_eps(fmt)
      #|  (fmt : Flformat)
      #|  (e : Int) - (p : Int) + int_of_num(1) + -e == int_of_num(1) - p
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  (a : Real) / (b : Real) * (c : Real) == a * c / b
      #|  ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real))) == inv(ipow(real_of_num(flr(fmt)), -greatest_e(fmt, x)))
      #|  greatest_e((fmt : Flformat), (x : Real))
      #|  (fmt : Flformat)
      #|  real_of_num(0) < fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real))))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  real_of_num(0) < abs((x : Real))
      #|  fulp(to_fformat((fmt : Flformat), greatest_e(fmt, (x : Real)))) / abs(x)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 rerror(x, flround(fmt, To_ninf, x)) <= real_of_num(2) * fl_eps(fmt)
      #|  (fmt : Flformat)
      #|  \226\136\128 z : Real, z / (x : Real) * x == z
      #|  (flround((fmt : Flformat), To_near, (x : Real)) - x) / x
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 d : Real, flround(fmt, To_near, x) == (real_of_num(1) + d) * x && abs(d) <= fl_eps(fmt))
      #|  \226\136\128 z : Real, z / (x : Real) * x == z
      #|  (flround((fmt : Flformat), To_zero, (x : Real)) - x) / x
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 d : Real, flround(fmt, To_zero, x) == (real_of_num(1) + d) * x && abs(d) <= real_of_num(2) * fl_eps(fmt))
      #|  \226\136\128 z : Real, z / (x : Real) * x == z
      #|  (flround((fmt : Flformat), To_pinf, (x : Real)) - x) / x
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 d : Real, flround(fmt, To_pinf, x) == (real_of_num(1) + d) * x && abs(d) <= real_of_num(2) * fl_eps(fmt))
      #|  \226\136\128 z : Real, z / (x : Real) * x == z
      #|  (flround((fmt : Flformat), To_ninf, (x : Real)) - x) / x
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 (\226\136\131 d : Real, flround(fmt, To_ninf, x) == (real_of_num(1) + d) * x && abs(d) <= real_of_num(2) * fl_eps(fmt))
      #|  real_of_num(1) < (x : Real) \226\134\146 real_of_num(1) <= x
      #|  (e : Int) + ((e2 : Int) - e + int_of_num(1)) == e2 + int_of_num(1)
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  real_of_num(EXP(flr((fmt : Flformat)), flp(fmt))) * ipow(real_of_num(flr(fmt)), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  real_of_num(0) <= real_of_num((f : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  real_of_num(0) <= real_of_num((f : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Flformat)
      #|  real_of_num(flr((fmt : Flformat)))
      #|  real_of_num(EXP(flr((fmt : Flformat)), flp(fmt) - 1)) * ipow(real_of_num(flr(fmt)), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  real_of_num((f : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1))
      #|  (fmt : Flformat)
      #|  EXP(flr((fmt : Flformat)), flp(fmt) - 1)
      #|  0 < (f : Num) \226\134\146 !(f == 0)
      #|  !(real_of_num((f : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e : Int) - int_of_num(flp(fmt)) + int_of_num(1)) == real_of_num(0))
      #|  \226\136\128 fmt : Flformat, \226\136\128 e : Int, \226\136\128 f : Num, EXP(flr(fmt), flp(fmt) - 1) <= f && f < EXP(flr(fmt), flp(fmt)) \226\134\146 greatest_e(fmt, real_of_num(f) * ipow(real_of_num(flr(fmt)), e - int_of_num(flp(fmt)) + int_of_num(1))) == e
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  real_of_num(0) <= fround(to_fformat((fmt : Flformat), (e : Int)), (m : Roundmode), (y : Real))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, !(x == real_of_num(0)) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= flround(fmt, m, x)
      #|  (fmt : Flformat)
      #|  (-(x : Real) + (y : Real) <= real_of_num(0)) == (real_of_num(0) <= x + -y)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  fround(to_fformat((fmt : Flformat), (e : Int)), (m : Roundmode), (y : Real)) <= real_of_num(0)
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, !(x == real_of_num(0)) && !(real_of_num(0) <= x) \226\134\146 flround(fmt, m, x) <= real_of_num(0)
      #|  (fmt : Flformat)
      #|  (x : Real) == x + real_of_num(0)
      #|  -(-(x : Real) + (y : Real)) == x + -y
      #|  (-(x : Real) + (y : Real) <= real_of_num(0)) == (real_of_num(0) <= x + -y)
      #|  -(real_of_num((m' : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int))) + fround(to_fformat(fmt, e'), (m : Roundmode), (y : Real)) <= real_of_num(0)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e' : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  fround(to_fformat((fmt : Flformat), (e' : Int)), (m : Roundmode), (y : Real)) <= real_of_num(0)
      #|  (x : Real) == x + real_of_num(0)
      #|  real_of_num(0) <= real_of_num((m' : Num)) * ipow(real_of_num(flr((fmt : Flformat))), (e' : Int)) + fround(to_fformat(fmt, e'), (m : Roundmode), (y : Real))
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  greatest_e((fmt : Flformat), (x : Real)) == (e' : Int)
      #|  greatest_r((fmt : Flformat), (x : Real)) == (y : Real)
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  real_of_num(0) <= fround(to_fformat((fmt : Flformat), (e' : Int)), (m : Roundmode), (y : Real))
      #|  (x : Real) == real_of_num(1) * x
      #|  real_of_num(1) < (x : Real) \226\134\146 real_of_num(1) <= x
      #|  ipow(real_of_num(flr((fmt : Flformat))), greatest_e(fmt, (x : Real)))
      #|  ipow(real_of_num(flr((fmt : Flformat))), (e : Int)) <= real_of_num(greatest_m(fmt, (x : Real))) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x))
      #|  \226\136\128 fmt : Flformat, \226\136\128 x : Real, \226\136\128 e : Int, \226\136\128 m : Roundmode, !(x == real_of_num(0)) && ipow(real_of_num(flr(fmt)), e) <= abs(x) \226\134\146 ipow(real_of_num(flr(fmt)), e) <= abs(flround(fmt, m, x))
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  (fmt : Flformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (fmt : Flformat)
      #|  (x : Real) <= real_of_num(0) \226\134\146 abs(x) == -x
      #|FLFORMAT_SPLIT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#=:fun(prod(num,num),fun(prod(num,num),bool)) (#dest_flformat:fun(flformat,prod(num,num)) fmt:flformat)) ((#,:fun(num,fun(num,prod(num,num))) (#FST:fun(prod(num,num),num) (#dest_flformat:fun(flformat,prod(num,num)) fmt:flformat))) (#SND:fun(prod(num,num),num) (#dest_flformat:fun(flformat,prod(num,num)) fmt:flformat))))))
      #|FLFORMAT_VALID_IMP_RADIX_LT_1 =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_flformat:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#FST:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))))))))
      #|FLFORMAT_VALID_IMP_RADIX_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_flformat:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))) (#EVEN:fun(num,bool) (#FST:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))))))))
      #|FLFORMAT_VALID_IMP_PREC_LT_1 =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_flformat:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#SND:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) r:num) p:num))))))))
      #|FLFORMAT_VALID =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#is_valid_flformat:fun(prod(num,num),bool) (#dest_flformat:fun(flformat,prod(num,num)) fmt:flformat))))
      #|FLFORMAT_RADIX_LT_1 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#flr:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_RADIX_LT_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#flr:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_RADIX_NE_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|FLFORMAT_RADIX_EVEN =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#EVEN:fun(num,bool) (#flr:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_RADIX_LE_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#flr:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_PREC_LT_1 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#flp:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_PREC_LT_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#flp:fun(flformat,num) fmt:flformat))))
      #|FLFORMAT_PREC_MINUS_1 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#int_le:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num))) ((#int_sub:fun(int,fun(int,int)) (#int_of_num:fun(num,int) (#flp:fun(flformat,num) fmt:flformat))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|FLFORMAT_PREC_IPOW_EQ_EXP =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. ((#=:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#int_sub:fun(int,fun(int,int)) (#int_of_num:fun(num,int) (#flp:fun(flformat,num) fmt:flformat))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|FLFORMAT_PREC_EXP_EQ_IPOW =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) n:num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) (#int_of_num:fun(num,int) n:num)))))))
      #|FLFORMAT_RADIX_IPOW_LE_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))))))
      #|FLFORMAT_RADIX_IPOW_LT_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))))))
      #|FLFORMAT_RADIX_IPOW_NEQ_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FLFORMAT_RADIX_IPOW_ADD_EXP =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\u:int. (#forall:fun(fun(int,bool),bool) (\v:int. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) u:int)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) v:int))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#int_add:fun(int,fun(int,int)) u:int) v:int)))))))))
      #|FLFORMAT_TO_FFORMAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. (#?:fun(fun(fformat,bool),bool) (\fmt':fformat. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fformat,fun(fformat,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) e:int)) fmt':fformat)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#fr:fun(fformat,num) fmt':fformat)) (#flr:fun(flformat,num) fmt:flformat))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#fp:fun(fformat,num) fmt':fformat)) (#flp:fun(flformat,num) fmt:flformat))) ((#=:fun(int,fun(int,bool)) (#fe:fun(fformat,int) fmt':fformat)) e:int))))))))))
      #|FLFORMAT_TO_FFORMAT_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#fr:fun(fformat,num) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) e:int))) (#flr:fun(flformat,num) fmt:flformat))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#fp:fun(fformat,num) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) e:int))) (#flp:fun(flformat,num) fmt:flformat))) ((#=:fun(int,fun(int,bool)) (#fe:fun(fformat,int) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) e:int))) e:int)))))))
      #|FLOAT_IPOW_LE_REAL =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\z:real. (#?:fun(fun(int,bool),bool) (\e:int. ((#real_le:fun(real,fun(real,bool)) z:real) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))))))))
      #|FLOAT_IPOW_LE_REAL_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) (#?:fun(fun(int,bool),bool) (\e:int. ((#real_le:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int)) z:real))))))))
      #|FLOAT_NEG =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) (#real_neg:fun(real,real) x:real)))))))
      #|FLOAT_NOT_ZERO =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|is_greatest_e =  |- ((#=:fun(bool,fun(bool,bool)) (((#is_greatest_e:fun(flformat,fun(real,fun(int,bool))) fmt:flformat) x:real) e:int)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int)) (#real_abs:fun(real,real) x:real))) (#forall:fun(fun(int,bool),bool) (\e':int. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e':int)) (#real_abs:fun(real,real) x:real))) ((#int_le:fun(int,fun(int,bool)) e':int) e:int))))))
      #|FLOAT_GREATEST_E_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(int,bool),bool) (\e:int. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)) e:int)) (((#is_greatest_e:fun(flformat,fun(real,fun(int,bool))) fmt:flformat) x:real) e:int)))))))))
      #|FLOAT_GREATEST_E_UNIQUE =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(int,bool),bool) (\e1:int. (#forall:fun(fun(int,bool),bool) (\e2:int. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#is_greatest_e:fun(flformat,fun(real,fun(int,bool))) fmt:flformat) x:real) e1:int)) (((#is_greatest_e:fun(flformat,fun(real,fun(int,bool))) fmt:flformat) x:real) e2:int))) ((#=:fun(int,fun(int,bool)) e1:int) e2:int))))))))))
      #|FLOAT_GREATEST_E_NEG =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) (#real_neg:fun(real,real) x:real))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))))))
      #|is_greatest_m =  |- ((#=:fun(bool,fun(bool,bool)) (((#is_greatest_m:fun(flformat,fun(real,fun(num,bool))) fmt:flformat) x:real) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) (#real_abs:fun(real,real) x:real))) (#forall:fun(fun(num,bool),bool) (\m':num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m':num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) (#real_abs:fun(real,real) x:real))) ((#<=:fun(num,fun(num,bool)) m':num) m:num))))))
      #|FLOAT_GREATEST_M_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real)) m:num)) ((#/\:fun(bool,fun(bool,bool)) (((#is_greatest_m:fun(flformat,fun(real,fun(num,bool))) fmt:flformat) x:real) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#<:fun(num,fun(num,bool)) m:num) (#flr:fun(flformat,num) fmt:flformat))))))))))))
      #|FLOAT_GREATEST_M_UNIQUE =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m1:num. (#forall:fun(fun(num,bool),bool) (\m2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#is_greatest_m:fun(flformat,fun(real,fun(num,bool))) fmt:flformat) x:real) m1:num)) (((#is_greatest_m:fun(flformat,fun(real,fun(num,bool))) fmt:flformat) x:real) m2:num))) ((#=:fun(num,fun(num,bool)) m1:num) m2:num))))))))))
      #|FLOAT_GREATEST_M_NEG =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) (#real_neg:fun(real,real) x:real))) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real)))))))
      #|FLOAT_GREATEST_R_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) y:real)) (#finf:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))))))))))
      #|FLOAT_GREATEST_R_NEG =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) (#real_neg:fun(real,real) x:real))) (#real_neg:fun(real,real) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real))))))))
      #|FLOAT_GREATEST_R_LE_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)))))))
      #|FLOAT_GREATEST_R_LE_0_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))) ((#real_le:fun(real,fun(real,bool)) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FLOAT_NORMALIZE_REAL =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)))) ((#=:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)))))))))
      #|FLOAT_NORM_FRAC =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) (#?:fun(fun(num,bool),bool) (\f:num. (#?:fun(fun(int,bool),bool) (\e:int. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:num)) ((((#is_frac_and_exp:fun(flformat,fun(real,fun(num,fun(int,bool)))) fmt:flformat) x:real) f:num) e:int)))))))))))
      #|FLOAT_NORM_M =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) (#?:fun(fun(num,bool),bool) (\m:num. (#?:fun(fun(int,bool),bool) (\e:int. (#?:fun(fun(num,bool),bool) (\f':num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) f':num) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#flr:fun(flformat,num) fmt:flformat))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) f':num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) e:int) (#int_of_num:fun(num,int) (#flp:fun(flformat,num) fmt:flformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))))))
      #|FLOAT_NORM_GREATEST =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) (#?:fun(fun(num,bool),bool) (\f':num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) f':num) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real)) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) f':num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)) (#int_of_num:fun(num,int) (#flp:fun(flformat,num) fmt:flformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|FLOAT_NORMALIZE_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)))) ((#=:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real))))))))))
      #|FLOAT_EQ_IPOW =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(int,bool),bool) (\e:int. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#flr:fun(flformat,num) fmt:flformat))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)) e:int)) ((#=:fun(num,fun(num,bool)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real)) m:num)))))))))))
      #|FLOAT_EQ_IPOW_R_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(int,bool),bool) (\e:int. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#flr:fun(flformat,num) fmt:flformat))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))))))) ((#=:fun(real,fun(real,bool)) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|FLOAT_BETWEEN =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(int,bool),bool) (\e:int. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) (#flr:fun(flformat,num) fmt:flformat))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))) (#real_abs:fun(real,real) x:real))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int))) (#finf:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) e:int))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)) e:int)) ((#=:fun(num,fun(num,bool)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real)) m:num)))))))))))
      #|FLOAT_RD_IS_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\mode:roundmode. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) mode:roundmode) x:real)))))))))
      #|CLOSER_BETWEEN_3 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) a:real))) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real))))))))
      #|CLOSER_BETWEEN_4 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) z:real) x:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) z:real) a:real))))) (((#closer:fun(real,fun(real,fun(real,bool))) z:real) y:real) a:real))))))))))
      #|CLOSER_BETWEEN_5 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real))))))))
      #|fl_is_closest =  |- ((#=:fun(bool,fun(bool,bool)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) s:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) s:real) y:real)))) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) s:real) x:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) s:real) y:real) x:real)))))))
      #|FLOAT_RD_NEAREST_CLOSEST =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_near:roundmode) x:real)) z:real)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) z:real)))))))))
      #|FLOAT_M_POW_E_IS_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))))))))
      #|FLOAT_NEG_IS_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) x:real)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) (#real_neg:fun(real,real) x:real)))))))
      #|FLOAT_PLUS_FIXED_IS_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real)) ((#is_fixed:fun(fformat,fun(real,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) z:real)))) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) z:real)))))))))
      #|FLOAT_PLUS_FIXED_IS_FLOAT_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) z:real))) ((#is_fixed:fun(fformat,fun(real,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) z:real)))) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) z:real)))))))))
      #|FLOAT_REVERSE_NORMALIZE_FLOAT =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y:real)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) y:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) (#finf:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) y:real)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) y:real)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) z:real)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) z:real))) ((#=:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) z:real))))))))))))))
      #|FLOAT_REVERSE_NORMALIZE_LE =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))))))))
      #|FLOAT_REVERSE_NORMALIZE_LE_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)))) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)))))))))
      #|CLOSEST_LEMMA_1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) a:real)) ((#real_lt:fun(real,fun(real,bool)) z:real) y:real)))) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) z:real) a:real))))))))))
      #|CLOSEST_LEMMA_2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real)))) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) z:real) a:real))))))))))
      #|FLOAT_IS_CLOSEST_FIXED =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y:real)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)))) (#?:fun(fun(real,bool),bool) (\z:real. ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) z:real)) ((#/\:fun(bool,fun(bool,bool)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) x:real)) z:real)) ((#/\:fun(bool,fun(bool,bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) z:real))) ((#=:fun(real,fun(real,bool)) y:real) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))))) z:real)))) ((#=:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) ((#ff:fun(fformat,fun(real,num)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) y:real))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) y:real)))) (#EVEN:fun(num,bool) ((#ff:fun(fformat,fun(real,num)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real))) z:real)))))))))))))))
      #|fl_norm_frac =  |- ((#=:fun(num,fun(num,bool)) ((#fl_norm_frac:fun(flformat,fun(real,num)) fmt:flformat) y:real)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#greatest_m:fun(flformat,fun(real,num)) fmt:flformat) y:real)) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#ff:fun(fformat,fun(real,num)) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) y:real))) ((#greatest_r:fun(flformat,fun(real,real)) fmt:flformat) y:real))))
      #|fl_to_even =  |- ((#=:fun(bool,fun(bool,bool)) (((#fl_to_even:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y2:real)) ((#/\:fun(bool,fun(bool,bool)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) (((#fl_is_closest:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y2:real)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y2:real) y:real)))))) (#EVEN:fun(num,bool) ((#fl_norm_frac:fun(flformat,fun(real,num)) fmt:flformat) y:real))))))
      #|FLOAT_RD_NEAREST_EVEN =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#fl_to_even:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_near:roundmode) x:real)))))))
      #|fl_to_zero =  |- ((#=:fun(bool,fun(bool,bool)) (((#fl_to_zero:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y':real)) ((#real_le:fun(real,fun(real,bool)) y':real) x:real))) ((#real_le:fun(real,fun(real,bool)) y':real) y:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y':real)) ((#real_le:fun(real,fun(real,bool)) x:real) y':real))) ((#real_le:fun(real,fun(real,bool)) y:real) y':real))))))))
      #|FLOAT_RD_ZERO_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#fl_to_zero:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_zero:roundmode) x:real)))))))
      #|fl_to_pinf =  |- ((#=:fun(bool,fun(bool,bool)) (((#fl_to_pinf:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y':real)) ((#real_le:fun(real,fun(real,bool)) x:real) y':real))) ((#real_le:fun(real,fun(real,bool)) y:real) y':real))))))
      #|FLOAT_RD_PINF_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#fl_to_pinf:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_pinf:roundmode) x:real)))))))
      #|fl_to_ninf =  |- ((#=:fun(bool,fun(bool,bool)) (((#fl_to_ninf:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_float:fun(flformat,fun(real,bool)) fmt:flformat) y':real)) ((#real_le:fun(real,fun(real,bool)) y':real) x:real))) ((#real_le:fun(real,fun(real,bool)) y':real) y:real))))))
      #|FLOAT_RD_NINF_EXISTS =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#fl_to_ninf:fun(flformat,fun(real,fun(real,bool))) fmt:flformat) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_ninf:roundmode) x:real)))))))
      #|FLOAT_RD_NEAR_ABS_ERR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_near:roundmode) x:real)) x:real))) ((#real_div:fun(real,fun(real,real)) (#fulp:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|FLOAT_RD_ZERO_ABS_ERR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_zero:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))))))))
      #|FLOAT_RD_PINF_ABS_ERR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_pinf:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))))))))
      #|FLOAT_RD_NINF_ABS_ERR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_ninf:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) ((#to_fformat:fun(flformat,fun(int,fformat)) fmt:flformat) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) x:real)))))))))
      #|FLOAT_RD_NEAR_REL_ERROR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#rerror:fun(real,fun(real,real)) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_near:roundmode) x:real))) (#fl_eps:fun(flformat,real) fmt:flformat)))))))
      #|FLOAT_RD_ZERO_REL_ERROR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#rerror:fun(real,fun(real,real)) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_zero:roundmode) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat))))))))
      #|FLOAT_RD_PINF_REL_ERROR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#rerror:fun(real,fun(real,real)) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_pinf:roundmode) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat))))))))
      #|FLOAT_RD_NINF_REL_ERROR =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#rerror:fun(real,fun(real,real)) x:real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_ninf:roundmode) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat))))))))
      #|FLOAT_RD_NEAR_REL_DELTA =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_near:roundmode) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:real)) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) d:real)) (#fl_eps:fun(flformat,real) fmt:flformat))))))))))
      #|FLOAT_RD_ZERO_REL_DELTA =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_zero:roundmode) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:real)) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) d:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat)))))))))))
      #|FLOAT_RD_PINF_REL_DELTA =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_pinf:roundmode) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:real)) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) d:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat)))))))))))
      #|FLOAT_RD_NINF_REL_DELTA =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\d:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) #To_ninf:roundmode) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) d:real)) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) d:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#fl_eps:fun(flformat,real) fmt:flformat)))))))))))
      #|FLOAT_GREATEST_E_OF =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(int,bool),bool) (\e:int. (#forall:fun(fun(num,bool),bool) (\f:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) ((#-:fun(num,fun(num,num)) (#flp:fun(flformat,num) fmt:flformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:num)) ((#<:fun(num,fun(num,bool)) f:num) ((#EXP:fun(num,fun(num,num)) (#flr:fun(flformat,num) fmt:flformat)) (#flp:fun(flformat,num) fmt:flformat))))) ((#=:fun(int,fun(int,bool)) ((#greatest_e:fun(flformat,fun(real,int)) fmt:flformat) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) f:num)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) e:int) (#int_of_num:fun(num,int) (#flp:fun(flformat,num) fmt:flformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) e:int))))))))
      #|FLOAT_RD_LE_0 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) m:roundmode) x:real)))))))))
      #|FLOAT_RD_LE_0_2 =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))) ((#real_le:fun(real,fun(real,bool)) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) m:roundmode) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|FLOAT_RD_MONO =  |- (#forall:fun(fun(flformat,bool),bool) (\fmt:flformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(int,bool),bool) (\e:int. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int)) (#real_abs:fun(real,real) x:real)))) ((#real_le:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#flr:fun(flformat,num) fmt:flformat))) e:int)) (#real_abs:fun(real,real) (((#flround:fun(flformat,fun(roundmode,fun(real,real))) fmt:flformat) m:roundmode) x:real))))))))))))
      #|types = flformat/0 roundmode/0 fformat/0 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = fl_to_ninf fl_to_pinf fl_to_zero fl_to_even fl_norm_frac fl_is_closest is_greatest_m is_greatest_e fl_eps flround greatest_r greatest_m greatest_e to_fformat is_float is_frac_and_exp flp flr dest_flformat mk_flformat is_valid_flformat to_ninf to_pinf to_zero to_even is_closest fixed_preimage fixed_corr fround To_ninf To_pinf To_zero To_near _116450 _116449 _116448 _116447 _dest_roundmode _mk_roundmode lub glb is_lub is_ub is_glb is_lb fixed finf fulp is_fixed ff is_frac fe fp fr dest_fformat mk_fformat is_valid_fformat sup_int sup_num is_sup_int is_sup_num closer rerror ipow superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 321
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _131962:bool
      #|
    ),
  )
}
