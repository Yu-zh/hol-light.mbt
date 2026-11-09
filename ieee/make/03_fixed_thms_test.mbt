// IEEE/fixed_thms.hl in its directory's load order: the test block of
// ieee/fixed_thms/fixed_thms_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/IEEE_fixed_thms_ref.expected).

///|
test "IEEE/fixed_thms matches IEEE/fixed_thms.ml" {
  @testkit.release_output()
  @fixed_thms.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "IEEE/common", "IEEE/fixed", "IEEE/fixed_thms",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("IEEE/fixed_thms")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("FFORMAT_SPLIT", () => sthm(@fixed_thms.fformat_split()))
  log.attempt("FFORMAT_VALID_IMP_RADIX_LT_1", () => {
    sthm(@fixed_thms.fformat_valid_imp_radix_lt_1())
  })
  log.attempt("FFORMAT_VALID_IMP_RADIX_EVEN", () => {
    sthm(@fixed_thms.fformat_valid_imp_radix_even())
  })
  log.attempt("FFORMAT_VALID_IMP_PREC_LT_0", () => {
    sthm(@fixed_thms.fformat_valid_imp_prec_lt_0())
  })
  log.attempt("FFORMAT_VALID", () => sthm(@fixed_thms.fformat_valid()))
  log.attempt("FFORMAT_RADIX_LT_1", () => sthm(@fixed_thms.fformat_radix_lt_1()))
  log.attempt("FFORMAT_RADIX_LT_0", () => sthm(@fixed_thms.fformat_radix_lt_0()))
  log.attempt("FFORMAT_RADIX_NE_0", () => sthm(@fixed_thms.fformat_radix_ne_0()))
  log.attempt("FFORMAT_RADIX_EVEN", () => sthm(@fixed_thms.fformat_radix_even()))
  log.attempt("FFORMAT_PREC_LT_0", () => sthm(@fixed_thms.fformat_prec_lt_0()))
  log.attempt("FFORMAT_PREC_MINUS_1", () => {
    sthm(@fixed_thms.fformat_prec_minus_1())
  })
  log.attempt("FFORMAT_PREC_IPOW_EQ_EXP", () => {
    sthm(@fixed_thms.fformat_prec_ipow_eq_exp())
  })
  log.attempt("FFORMAT_RADIX_IPOW_LE_0", () => {
    sthm(@fixed_thms.fformat_radix_ipow_le_0())
  })
  log.attempt("FFORMAT_RADIX_IPOW_LT_0", () => {
    sthm(@fixed_thms.fformat_radix_ipow_lt_0())
  })
  log.attempt("FFORMAT_RADIX_IPOW_NEQ_0", () => {
    sthm(@fixed_thms.fformat_radix_ipow_neq_0())
  })
  log.attempt("FFORMAT_RADIX_IPOW_ADD_EXP", () => {
    sthm(@fixed_thms.fformat_radix_ipow_add_exp())
  })
  log.attempt("FIXED_NEG_SYM", () => sthm(@fixed_thms.fixed_neg_sym()))
  log.attempt("FIXED_FINF_IN_FIXED", () => {
    sthm(@fixed_thms.fixed_finf_in_fixed())
  })
  log.attempt("FIXED_ZERO_IN_FIXED", () => {
    sthm(@fixed_thms.fixed_zero_in_fixed())
  })
  log.attempt("FIXED_FULP_IN_FIXED", () => {
    sthm(@fixed_thms.fixed_fulp_in_fixed())
  })
  log.attempt("FIXED_FINF_BOUNDS", () => sthm(@fixed_thms.fixed_finf_bounds()))
  log.attempt("FIXED_FRAC_LT_0", () => sthm(@fixed_thms.fixed_frac_lt_0()))
  log.attempt("FIXED_FF_EXISTS", () => sthm(@fixed_thms.fixed_ff_exists()))
  log.attempt("FIXED_FF_UNIQUE", () => sthm(@fixed_thms.fixed_ff_unique()))
  log.attempt("FIXED_FULP_LE_0", () => sthm(@fixed_thms.fixed_fulp_le_0()))
  log.attempt("FIXED_FULP_LT_0", () => sthm(@fixed_thms.fixed_fulp_lt_0()))
  log.attempt("FIXED_FULP_LE_FINF", () => sthm(@fixed_thms.fixed_fulp_le_finf()))
  log.attempt("FIXED_FF_LE", () => sthm(@fixed_thms.fixed_ff_le()))
  log.attempt("FIXED_FF_LT", () => sthm(@fixed_thms.fixed_ff_lt()))
  log.attempt("FIXED_FF_FINF", () => sthm(@fixed_thms.fixed_ff_finf()))
  log.attempt("FIXED_FF_NEG", () => sthm(@fixed_thms.fixed_ff_neg()))
  log.attempt("FIXED_FF_REP", () => sthm(@fixed_thms.fixed_ff_rep()))
  log.attempt("FIXED_FF_ZERO", () => sthm(@fixed_thms.fixed_ff_zero()))
  log.attempt("FIXED_CORR", () => sthm(@fixed_thms.fixed_corr()))
  log.attempt("FIXED_PREIMAGE", () => sthm(@fixed_thms.fixed_preimage()))
  log.attempt("FIXED_IN_IMAGE", () => sthm(@fixed_thms.fixed_in_image()))
  log.attempt("FIXED_FINITE", () => sthm(@fixed_thms.fixed_finite()))
  log.attempt("FIXED_NONEMPTY", () => sthm(@fixed_thms.fixed_nonempty()))
  log.attempt("FIXED_GLB_EXISTS", () => sthm(@fixed_thms.fixed_glb_exists()))
  log.attempt("FIXED_LUB_EXISTS", () => sthm(@fixed_thms.fixed_lub_exists()))
  log.attempt("FIXED_GLB_UNIQUE", () => sthm(@fixed_thms.fixed_glb_unique()))
  log.attempt("FIXED_LUB_UNIQUE", () => sthm(@fixed_thms.fixed_lub_unique()))
  log.attempt("FIXED_GLB_IS_FIXED", () => sthm(@fixed_thms.fixed_glb_is_fixed()))
  log.attempt("FIXED_LUB_IS_FIXED", () => sthm(@fixed_thms.fixed_lub_is_fixed()))
  log.attempt("FIXED_PLUS_FULP_NNEG", () => {
    sthm(@fixed_thms.fixed_plus_fulp_nneg())
  })
  log.attempt("FIXED_PLUS_FULP_NEG", () => {
    sthm(@fixed_thms.fixed_plus_fulp_neg())
  })
  log.attempt("FIXED_FULP_DISTANCE", () => {
    sthm(@fixed_thms.fixed_fulp_distance())
  })
  log.attempt("FIXED_GLB_LUB_BOUNDS", () => {
    sthm(@fixed_thms.fixed_glb_lub_bounds())
  })
  log.attempt("FIXED_GLB_LUB_DIST", () => sthm(@fixed_thms.fixed_glb_lub_dist()))
  log.attempt("FIXED_GLB_LUB_DIST_2", () => {
    sthm(@fixed_thms.fixed_glb_lub_dist_2())
  })
  log.attempt("FIXED_GLB_LUB_FRAC", () => sthm(@fixed_thms.fixed_glb_lub_frac()))
  log.attempt("FIXED_GLB_LUB_DISCRETE", () => {
    sthm(@fixed_thms.fixed_glb_lub_discrete())
  })
  log.attempt("FIXED_GLB_LE_0", () => sthm(@fixed_thms.fixed_glb_le_0()))
  log.attempt("FIXED_GLB_LE_0_2", () => sthm(@fixed_thms.fixed_glb_le_0_2()))
  log.attempt("FIXED_LUB_LE_0", () => sthm(@fixed_thms.fixed_lub_le_0()))
  log.attempt("FIXED_LUB_LE_0_2", () => sthm(@fixed_thms.fixed_lub_le_0_2()))
  log.attempt("CLOSER_LOWER", () => sthm(@fixed_thms.closer_lower()))
  log.attempt("CLOSER_HIGHER", () => sthm(@fixed_thms.closer_higher()))
  log.attempt("CLOSER_EQ", () => sthm(@fixed_thms.closer_eq()))
  log.attempt("CLOSER_NEG", () => sthm(@fixed_thms.closer_neg()))
  log.attempt("CLOSER_TRANS", () => sthm(@fixed_thms.closer_trans()))
  log.attempt("CLOSER_TRANS_2", () => sthm(@fixed_thms.closer_trans_2()))
  log.attempt("CLOSER_BETWEEN_1", () => sthm(@fixed_thms.closer_between_1()))
  log.attempt("CLOSER_BETWEEN_2", () => sthm(@fixed_thms.closer_between_2()))
  log.attempt("is_closest", () => sthm(@fixed_thms.is_closest()))
  log.attempt("to_even", () => sthm(@fixed_thms.to_even()))
  log.attempt("FIXED_RD_NEAREST_CLOSEST", () => {
    sthm(@fixed_thms.fixed_rd_nearest_closest())
  })
  log.attempt("FIXED_RD_NEAREST_EVEN", () => {
    sthm(@fixed_thms.fixed_rd_nearest_even())
  })
  log.attempt("FIXED_RD_NEAREST_EXISTS", () => {
    sthm(@fixed_thms.fixed_rd_nearest_exists())
  })
  log.attempt("to_zero", () => sthm(@fixed_thms.to_zero()))
  log.attempt("FIXED_RD_ZERO_EXISTS", () => {
    sthm(@fixed_thms.fixed_rd_zero_exists())
  })
  log.attempt("to_pinf", () => sthm(@fixed_thms.to_pinf()))
  log.attempt("FIXED_RD_PINF_EXISTS", () => {
    sthm(@fixed_thms.fixed_rd_pinf_exists())
  })
  log.attempt("to_ninf", () => sthm(@fixed_thms.to_ninf()))
  log.attempt("FIXED_RD_NINF_EXISTS", () => {
    sthm(@fixed_thms.fixed_rd_ninf_exists())
  })
  log.attempt("FIXED_RD_IS_GLB_LUB", () => {
    sthm(@fixed_thms.fixed_rd_is_glb_lub())
  })
  log.attempt("FIXED_RD_IS_GLB_LUB_2", () => {
    sthm(@fixed_thms.fixed_rd_is_glb_lub_2())
  })
  log.attempt("FIXED_RD_LE_0", () => sthm(@fixed_thms.fixed_rd_le_0()))
  log.attempt("FIXED_RD_LE_0_2", () => sthm(@fixed_thms.fixed_rd_le_0_2()))
  log.attempt("FIXED_RD_MONO", () => sthm(@fixed_thms.fixed_rd_mono()))
  log.attempt("FIXED_RD_MONO_2", () => sthm(@fixed_thms.fixed_rd_mono_2()))
  log.attempt("FIXED_RD_EQ_0", () => sthm(@fixed_thms.fixed_rd_eq_0()))
  log.attempt("FIXED_RD_IS_FIXED", () => sthm(@fixed_thms.fixed_rd_is_fixed()))
  log.attempt("FIXED_RD_NEAREST_ABS_ERROR", () => {
    sthm(@fixed_thms.fixed_rd_nearest_abs_error())
  })
  log.attempt("FIXED_RD_ZERO_ABS_ERROR", () => {
    sthm(@fixed_thms.fixed_rd_zero_abs_error())
  })
  log.attempt("FIXED_RD_PINF_ABS_ERROR", () => {
    sthm(@fixed_thms.fixed_rd_pinf_abs_error())
  })
  log.attempt("FIXED_RD_NINF_ABS_ERROR", () => {
    sthm(@fixed_thms.fixed_rd_ninf_abs_error())
  })
  log.attempt("FIXED_RD_NEAREST_TO_GLB", () => {
    sthm(@fixed_thms.fixed_rd_nearest_to_glb())
  })
  log.attempt("FIXED_RD_NEAREST_TO_LUB", () => {
    sthm(@fixed_thms.fixed_rd_nearest_to_lub())
  })
  log.attempt("FIXED_RD_NEAREST_TO_0", () => {
    sthm(@fixed_thms.fixed_rd_nearest_to_0())
  })
  log.attempt("FIXED_RD_NEAREST_REL_ERROR", () => {
    sthm(@fixed_thms.fixed_rd_nearest_rel_error())
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
      #|IEEE/fixed_thms quotations (590):
      #|  \226\136\128 fmt : Fformat, dest_fformat(fmt) == (FST(dest_fformat(fmt)), FST(SND(dest_fformat(fmt))), SND(SND(dest_fformat(fmt))))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, \226\136\128 e : Int, is_valid_fformat((r, p, e)) \226\134\146 1 < FST((r, p, e))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, \226\136\128 e : Int, is_valid_fformat((r, p, e)) \226\134\146 EVEN(FST((r, p, e)))
      #|  \226\136\128 r : Num, \226\136\128 p : Num, \226\136\128 e : Int, is_valid_fformat((r, p, e)) \226\134\146 0 < FST(SND((r, p, e)))
      #|  \226\136\128 fmt : Fformat, is_valid_fformat(dest_fformat(fmt))
      #|  \226\136\128 fmt : Fformat, 1 < fr(fmt)
      #|  1 < (x : Num) \226\134\146 0 < x
      #|  \226\136\128 fmt : Fformat, 0 < fr(fmt)
      #|  0 < (x : Num) \226\134\146 !(x == 0)
      #|  \226\136\128 fmt : Fformat, !(real_of_num(fr(fmt)) == real_of_num(0))
      #|  \226\136\128 fmt : Fformat, EVEN(fr(fmt))
      #|  \226\136\128 fmt : Fformat, 0 < fp(fmt)
      #|  (1 <= (n : Num)) == (0 < n)
      #|  (int_of_num(0) <= (x : Int) - int_of_num(1)) == (int_of_num(1) <= x)
      #|  \226\136\128 fmt : Fformat, int_of_num(0) <= int_of_num(fp(fmt)) - int_of_num(1)
      #|  \226\136\128 fmt : Fformat, ipow(real_of_num(fr(fmt)), int_of_num(fp(fmt)) - int_of_num(1)) == real_of_num(EXP(fr(fmt), fp(fmt) - 1))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  \226\136\128 fmt : Fformat, \226\136\128 e : Int, real_of_num(0) <= ipow(real_of_num(fr(fmt)), e)
      #|  \226\136\128 fmt : Fformat, \226\136\128 e : Int, real_of_num(0) < ipow(real_of_num(fr(fmt)), e)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 fmt : Fformat, \226\136\128 e : Int, !(ipow(real_of_num(fr(fmt)), e) == real_of_num(0))
      #|  \226\136\128 fmt : Fformat, \226\136\128 u : Int, \226\136\128 v : Int, ipow(real_of_num(fr(fmt)), u) * ipow(real_of_num(fr(fmt)), v) == ipow(real_of_num(fr(fmt)), u + v)
      #|  abs(-(x : Real)) == abs(x)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, IN(x, fixed(fmt)) == IN(-x, fixed(fmt))
      #|  (fmt : Fformat)
      #|  fe((fmt : Fformat))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  (x : Int) - (y : Int) + ((z : Int) - x + y) == z
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  fr((fmt : Fformat))
      #|  (x : Num) <= x
      #|  EXP(fr((fmt : Fformat)), fp(fmt) - 1)
      #|  IN(finf((fmt : Fformat)), fixed(fmt))
      #|  \226\136\128 fmt : Fformat, IN(finf(fmt), fixed(fmt)) && IN(-finf(fmt), fixed(fmt))
      #|  (fmt : Fformat)
      #|  0
      #|  \226\136\128 fmt : Fformat, IN(real_of_num(0), fixed(fmt))
      #|  fe((fmt : Fformat)) - int_of_num(fp(fmt)) + int_of_num(1)
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  1
      #|  \226\136\128 fmt : Fformat, IN(fulp(fmt), fixed(fmt))
      #|  (z : Real) <= abs(z)
      #|  abs((x : Real))
      #|  -(z : Real) <= abs(z)
      #|  abs((x : Real))
      #|  (-(x : Real) <= (y : Real)) == (-y <= x)
      #|  ((x : Real) * (y : Real) <= (z : Real) * y) == (y * x <= y * z)
      #|  fe((fmt : Fformat)) == int_of_num(fp(fmt)) - int_of_num(1) + (fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  real_of_num((f : Num)) * ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)) <= finf(fmt)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, IN(x, fixed(fmt)) \226\134\146 -finf(fmt) <= x && x <= finf(fmt)
      #|  !((f : Num) == 0) \226\134\146 0 < f
      #|  \226\136\128 fmt : Fformat, \226\136\128 u : Real, \226\136\128 f : Num, !(u == real_of_num(0)) && is_frac(fmt, u, f) \226\134\146 0 < f
      #|  !((u : Real) == real_of_num(0)) == !(abs(u) == real_of_num(0))
      #|  (f : Num)
      #|  ff((fmt : Fformat), (x : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, IN(x, fixed(fmt)) \226\134\146 (\226\136\131 f : Num, ff(fmt, x) == f && is_frac(fmt, x, f))
      #|  (fmt : Fformat)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 f1 : Num, \226\136\128 f2 : Num, is_frac(fmt, x, f1) && is_frac(fmt, x, f2) \226\134\146 f1 == f2
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, real_of_num(0) <= fulp(fmt)
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, real_of_num(0) < fulp(fmt)
      #|  (x : Int) - (y : Int) + ((z : Int) - x + y) == z
      #|  (fmt : Fformat)
      #|  real_of_num(fr((fmt : Fformat)))
      #|  (fmt : Fformat)
      #|  fr((fmt : Fformat))
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  0 < (n : Num) \226\134\146 0 <= n - 1
      #|  (fmt : Fformat)
      #|  fr((fmt : Fformat))
      #|  1 == EXP(fr((fmt : Fformat)), 0)
      #|  (x : Real) == real_of_num(1) * x
      #|  real_of_num(EXP(fr((fmt : Fformat)), fp(fmt) - 1)) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  \226\136\128 fmt : Fformat, fulp(fmt) <= finf(fmt)
      #|  is_frac((fmt : Fformat), (x : Real), ff(fmt, x))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, is_fixed(fmt, x) \226\134\146 ff(fmt, x) <= EXP(fr(fmt), fp(fmt) - 1)
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Fformat)
      #|  real_of_num(fr((fmt : Fformat)))
      #|  real_of_num(0) < ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  (fmt : Fformat)
      #|  fr((fmt : Fformat))
      #|  real_of_num(ff((fmt : Fformat), (x : Real))) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)) < finf(fmt)
      #|  is_frac((fmt : Fformat), (x : Real), ff(fmt, x))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, is_fixed(fmt, x) && abs(x) < finf(fmt) \226\134\146 ff(fmt, x) < EXP(fr(fmt), fp(fmt) - 1)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  finf((fmt : Fformat)) == abs(finf(fmt))
      #|  (e : Int) - int_of_num(1) + ((e2 : Int) - e + int_of_num(1)) == e2
      #|  (fmt : Fformat)
      #|  real_of_num(fr((fmt : Fformat)))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  (fmt : Fformat)
      #|  fr((fmt : Fformat))
      #|  is_frac((fmt : Fformat), finf(fmt), ff(fmt, finf(fmt)))
      #|  \226\136\128 fmt : Fformat, ff(fmt, finf(fmt)) == EXP(fr(fmt), fp(fmt) - 1)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  abs(-(x : Real)) == abs(x)
      #|  is_frac((fmt : Fformat), (x : Real), ff(fmt, -x))
      #|  is_frac((fmt : Fformat), (x : Real), ff(fmt, x))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, is_fixed(fmt, x) \226\134\146 ff(fmt, -x) == ff(fmt, x)
      #|  is_frac((fmt : Fformat), (x : Real), ff(fmt, x))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, is_fixed(fmt, x) \226\134\146 abs(x) == real_of_num(ff(fmt, x)) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  real_of_num(0) * (x : Real) == abs(real_of_num(0))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)) == real_of_num(0)
      #|  \226\136\128 b : Bool, !b && ((a : Bool) || b) \226\134\146 a
      #|  is_frac((fmt : Fformat), real_of_num(0), ff(fmt, real_of_num(0)))
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, ff(fmt, real_of_num(0)) == 0
      #|  (fixed_corr : (Fformat, Num) -> Real)((fmt : Fformat), (n : Num)) == (if n == 0 { real_of_num(0) } else { if ODD(n) { -real_of_num(DIV(n + 1, 2)) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)) } else { real_of_num(DIV(n, 2)) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1)) } })
      #|  (fixed_preimage : (Fformat, Num) -> Bool)((fmt : Fformat)) == {(n : Num) | 0 <= n && n <= 2 * EXP(fr(fmt), fp(fmt) - 1)}
      #|  (x : Real) == -abs(x)
      #|  DIV(2 * (f : Num) - 1 + 1, 2) == f
      #|  2 * (f : Num) - 1
      #|  real_of_num(0) <= (x : Real)
      #|  DIV(2 * (z : Num), 2) == z
      #|  ODD(2 * (f : Num))
      #|  (f : Num) == 0
      #|  2 * (f : Num)
      #|  real_of_num(0) <= (x : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, IN(x, fixed(fmt)) \226\134\146 (\226\136\131 n : Num, IN(n, fixed_preimage(fmt)) && fixed_corr(fmt, n) == x)
      #|  real_of_num(0) * (x : Real) == real_of_num(0)
      #|  !(real_of_num(0) <= (x : Real))
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 !(x == real_of_num(0))
      #|  (fmt : Fformat)
      #|  ((x : Real) == (y : Real) * (z : Real)) == (-y * z == -x)
      #|  !ODD(2 * (f : Num) - 1)
      #|  (!(a : Bool) && a) == false
      #|  {(y : Real) | \226\136\131 n : Num, IN(n, fixed_preimage((fmt : Fformat))) && y == fixed_corr(fmt, n)}
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, SUBSET(fixed(fmt), {(y : Real) | \226\136\131 n : Num, IN(n, fixed_preimage(fmt)) && y == fixed_corr(fmt, n)})
      #|  \226\136\128 fmt : Fformat, FINITE({(y : Real) | \226\136\131 n : Num, IN(n, fixed_preimage(fmt)) && y == fixed_corr(fmt, n)})
      #|  \226\136\128 fmt : Fformat, FINITE(fixed_preimage(fmt))
      #|  \226\136\128 fmt : Fformat, FINITE(fixed(fmt))
      #|  fp((fmt : Fformat)) - 1 == 0
      #|  (fmt : Fformat)
      #|  real_of_num(0) * (x : Real) == real_of_num(0)
      #|  0
      #|  real_of_num(0)
      #|  \226\136\128 fmt : Fformat, !(fixed(fmt) == {})
      #|  sup({(z : Real) | IN(z, fixed((fmt : Fformat))) && z <= (x : Real)})
      #|  -finf((fmt : Fformat))
      #|  !({(z : Real) | IN(z, fixed((fmt : Fformat))) && z <= (x : Real)} == {})
      #|  (a : Bool) && (b : Bool) \226\134\146 a
      #|  fixed((fmt : Fformat))
      #|  FINITE({(z : Real) | IN(z, fixed((fmt : Fformat))) && z <= (x : Real)})
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, glb(fmt, x) == y && is_glb(fmt, x, y))
      #|  inf({(z : Real) | IN(z, fixed((fmt : Fformat))) && (x : Real) <= z})
      #|  finf((fmt : Fformat))
      #|  !({(z : Real) | IN(z, fixed((fmt : Fformat))) && (x : Real) <= z} == {})
      #|  (a : Bool) && (b : Bool) \226\134\146 a
      #|  fixed((fmt : Fformat))
      #|  FINITE({(z : Real) | IN(z, fixed((fmt : Fformat))) && (x : Real) <= z})
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, lub(fmt, x) == y && is_lub(fmt, x, y))
      #|  (y2 : Real) <= (y1 : Real)
      #|  (y1 : Real) <= (y2 : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 y1 : Real, \226\136\128 y2 : Real, abs(x) <= finf(fmt) && is_glb(fmt, x, y1) && is_glb(fmt, x, y2) \226\134\146 y1 == y2
      #|  (y2 : Real) <= (y1 : Real)
      #|  (y1 : Real) <= (y2 : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 y1 : Real, \226\136\128 y2 : Real, abs(x) <= finf(fmt) && is_lub(fmt, x, y1) && is_lub(fmt, x, y2) \226\134\146 y1 == y2
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 IN(glb(fmt, x), fixed(fmt))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 IN(lub(fmt, x), fixed(fmt))
      #|  real_of_num((x : Num)) * (y : Real) + y == (real_of_num(x) + real_of_num(1)) * y
      #|  \226\136\128 fmt : Fformat, \226\136\128 u : Real, \226\136\128 f : Num, real_of_num(0) <= u && is_frac(fmt, u, f) \226\134\146 u + fulp(fmt) == real_of_num(f + 1) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  -(real_of_num((x : Num)) * (y : Real)) + y == -(real_of_num(x) - real_of_num(1)) * y
      #|  \226\136\128 fmt : Fformat, \226\136\128 u : Real, \226\136\128 f : Num, u < real_of_num(0) && is_frac(fmt, u, f) \226\134\146 u + fulp(fmt) == -real_of_num(f - 1) * ipow(real_of_num(fr(fmt)), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  (x : Real) < real_of_num(0) \226\134\146 (abs(x) == (z : Real)) == (x == -z)
      #|  (u : Real) < real_of_num(0) \226\134\146 !(u == real_of_num(0))
      #|  0 < (f : Num) \226\134\146 1 <= f
      #|  -(a : Real) * (b : Real) == -(a * b)
      #|  -((a : Real) * (b : Real)) == -a * b
      #|  (x : Real) * (z : Real) - real_of_num(1) * z == (x - real_of_num(1)) * z
      #|  ((x : Real) <= (y : Real) + (z : Real)) == (x - z <= y)
      #|  ((x : Real) + real_of_num(1)) * (y : Real) == x * y + real_of_num(1) * y
      #|  fe((fmt : Fformat)) - int_of_num(fp(fmt)) + int_of_num(1)
      #|  real_of_num(fr((fmt : Fformat)))
      #|  ((a : Num) == (b : Num)) == (b == a)
      #|  ((x : Real) == (y : Real) - real_of_num(1)) == (x + real_of_num(1) == y)
      #|  -(a : Real) * (b : Real) == -(a * b)
      #|  (u : Real) + fulp((fmt : Fformat))
      #|  (v : Real) <= real_of_num(0)
      #|  (real_of_num(0) <= (x : Real) - real_of_num(1)) == (real_of_num(1) <= x)
      #|  (real_of_num(0) <= (x : Real) * (y : Real)) == (real_of_num(0) * y <= x * y)
      #|  (-(x : Real) <= real_of_num(0)) == (real_of_num(0) <= x)
      #|  -(a : Real) * (b : Real) == -(a * b)
      #|  (u : Real) + fulp((fmt : Fformat)) <= real_of_num(0)
      #|  !(real_of_num(0) <= (u : Real))
      #|  fe((fmt : Fformat)) - int_of_num(fp(fmt)) + int_of_num(1)
      #|  real_of_num(fr((fmt : Fformat)))
      #|  real_of_num(0) <= (u : Real) && is_frac((fmt : Fformat), u, (f1 : Num))
      #|  real_of_num(0) <= (u : Real)
      #|  real_of_num(0) <= (u : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 u : Real, \226\136\128 v : Real, IN(u, fixed(fmt)) && IN(v, fixed(fmt)) && u <= v && v <= u + fulp(fmt) \226\134\146 v == u || v == u + fulp(fmt)
      #|  (f1 : Num)
      #|  (f2 : Num)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 x < real_of_num(0)
      #|  !(real_of_num(0) <= (u : Real)) \226\134\146 !(u == real_of_num(0))
      #|  (fmt : Fformat)
      #|  0 < (x : Num) \226\134\146 1 <= x
      #|  (x : Real) < real_of_num(0) \226\134\146 (abs(x) == (z : Real)) == (x == -z)
      #|  (x : Real) <= real_of_num(0) \226\134\146 (abs(x) == (z : Real)) == (x == -z)
      #|  0 < (x : Num) \226\134\146 1 <= x
      #|  0 < (n : Num) \226\134\146 1 <= n
      #|  is_ub((fmt : Fformat), (x : Real), (y1 : Real) + fulp(fmt))
      #|  !((y1 : Real) + fulp((fmt : Fformat)) <= (x : Real))
      #|  !((z : Real) <= (y : Real)) \226\134\146 y <= z
      #|  (fmt : Fformat)
      #|  ((x : Real) < x + (y : Real)) == (real_of_num(0) < y)
      #|  (y1 : Real) < y1 + fulp((fmt : Fformat))
      #|  is_lb((fmt : Fformat), (x : Real), (y1 : Real) + fulp(fmt))
      #|  (y1 : Real) + fulp((fmt : Fformat)) <= (x : Real)
      #|  (y1 : Real) + fulp((fmt : Fformat)) <= (x : Real)
      #|  (-(x : Real) == (a : Real) * (b : Real)) == (x == -a * b)
      #|  (-(a : Real) * (b : Real) <= real_of_num(0)) == (real_of_num(0) <= a * b)
      #|  (x : Real) <= real_of_num(0) && -x == (y : Real) \226\134\146 abs(x) == y
      #|  (f1 : Num) - 1
      #|  IN((y1 : Real) + fulp((fmt : Fformat)), fixed(fmt))
      #|  (x : Num) <= (y : Num) \226\134\146 x - 1 <= y
      #|  (f1 : Num) - 1 <= EXP(fr((fmt : Fformat)), fp(fmt) - 1)
      #|  (y1 : Real)
      #|  (fmt : Fformat)
      #|  0 < (f1 : Num)
      #|  !(real_of_num(0) <= (y1 : Real))
      #|  !(real_of_num(0) <= (y : Real)) == (y < real_of_num(0))
      #|  -finf((fmt : Fformat)) <= (x : Real) && x <= finf(fmt) \226\134\146 x <= finf(fmt)
      #|  real_of_num(0) <= (z : Real) && (x : Real) <= (y : Real) \226\134\146 x <= y + z
      #|  -finf((fmt : Fformat)) <= (x : Real) && x <= finf(fmt) \226\134\146 x <= finf(fmt)
      #|  ((x : Real) <= (y : Real)) == !(y < x)
      #|  ((x : Real) == (y : Real)) == (x <= y && y <= x)
      #|  (y1 : Real) == finf((fmt : Fformat))
      #|  is_ub((fmt : Fformat), (x : Real), (y1 : Real) + fulp(fmt))
      #|  !((y1 : Real) + fulp((fmt : Fformat)) <= (x : Real))
      #|  !((z : Real) <= (y : Real)) \226\134\146 y <= z
      #|  (fmt : Fformat)
      #|  ((x : Real) < x + (y : Real)) == (real_of_num(0) < y)
      #|  (y1 : Real) < y1 + fulp((fmt : Fformat))
      #|  is_lb((fmt : Fformat), (x : Real), (y1 : Real) + fulp(fmt))
      #|  (y1 : Real) + fulp((fmt : Fformat)) <= (x : Real)
      #|  (y1 : Real) + fulp((fmt : Fformat)) <= (x : Real)
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 real_of_num(0) <= x + y
      #|  real_of_num(0) <= (x : Real) && x == (y : Real) \226\134\146 abs(x) == y
      #|  (f1 : Num) + 1
      #|  IN((y1 : Real) + fulp((fmt : Fformat)), fixed(fmt))
      #|  (a : Real) * (b : Real) == b * a
      #|  (x : Int) - (y : Int) + int_of_num(1) + (y - int_of_num(1)) == x
      #|  (fmt : Fformat)
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  (x : Num) < (y : Num) \226\134\146 x + 1 <= y
      #|  (f1 : Num) + 1 <= EXP(fr((fmt : Fformat)), fp(fmt) - 1)
      #|  (y1 : Real) < finf((fmt : Fformat))
      #|  real_of_num(0) <= (y1 : Real)
      #|  real_of_num(0) <= (y1 : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 glb(fmt, x) <= lub(fmt, x) && lub(fmt, x) <= glb(fmt, x) + fulp(fmt)
      #|  (fmt : Fformat)
      #|  (y1 : Real)
      #|  (fmt : Fformat)
      #|  (y2 : Real)
      #|  (f1 : Num)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (f1 : Num)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == ((a && b) && c && d)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 lub(fmt, x) == glb(fmt, x) || lub(fmt, x) == glb(fmt, x) + fulp(fmt)
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (x : Real) + (y : Real) - x == y
      #|  (fmt : Fformat)
      #|  abs((x : Real) - x) == real_of_num(0)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 abs(lub(fmt, x) - glb(fmt, x)) <= fulp(fmt)
      #|  (fmt : Fformat)
      #|  (-(a : Real) * (b : Real) <= real_of_num(0)) == (real_of_num(0) <= a * b)
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x) + fulp(fmt)
      #|  lub((fmt : Fformat), (x : Real)) <= real_of_num(0)
      #|  (a : Real) * (b : Real) == -(-a * b)
      #|  (fmt : Fformat)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  (x : Real)
      #|  glb((fmt : Fformat), (x : Real))
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= (y : Real) \226\134\146 real_of_num(0) <= y
      #|  real_of_num(0) <= lub((fmt : Fformat), (x : Real))
      #|  (fmt : Fformat)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  real_of_num(0) <= glb((fmt : Fformat), (x : Real))
      #|  (fmt : Fformat)
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  ipow(real_of_num(fr((fmt : Fformat))), fe(fmt) - int_of_num(fp(fmt)) + int_of_num(1))
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x)
      #|  glb((fmt : Fformat), (x : Real))
      #|  (fmt : Fformat)
      #|  (f2 : Num) == (f : Num)
      #|  lub((fmt : Fformat), (x : Real))
      #|  (fmt : Fformat)
      #|  (f1 : Num) == (f' : Num)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 f1 : Num, \226\136\128 f2 : Num, abs(x) <= finf(fmt) \226\134\146 is_frac(fmt, lub(fmt, x), f1) && is_frac(fmt, glb(fmt, x), f2) \226\134\146 f1 == f2 && lub(fmt, x) == glb(fmt, x) || f1 == f2 + 1 || f1 == f2 - 1
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= glb((fmt : Fformat), (x : Real))
      #|  (x : Real) == (y : Real) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= y
      #|  (fmt : Fformat)
      #|  !(real_of_num(0) <= glb((fmt : Fformat), (x : Real)))
      #|  (x : Real) == (y : Real) && !(real_of_num(0) <= x) \226\134\146 y < real_of_num(0)
      #|  (fmt : Fformat)
      #|  (x : Real) == (y : Real) || x == (z : Real) \226\134\146 x <= y || z <= x
      #|  !((s : Real) < glb((fmt : Fformat), (x : Real)) || lub(fmt, x) < s)
      #|  !((x : Real) < (y : Real) || (z : Real) < x) == (y <= x && x <= z)
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x) + fulp(fmt)
      #|  (s : Real) < glb((fmt : Fformat), (x : Real)) || lub(fmt, x) < s
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\128 s : Real, IN(s, fixed(fmt)) \226\134\146 s <= glb(fmt, x) || lub(fmt, x) <= s)
      #|  IN((s : Real), fixed((fmt : Fformat)))
      #|  (fmt : Fformat)
      #|  is_lb((fmt : Fformat), (x : Real), real_of_num(0))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= glb(fmt, x)
      #|  (x : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && x <= real_of_num(0) \226\134\146 glb(fmt, x) <= real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= lub(fmt, x)
      #|  is_ub((fmt : Fformat), (x : Real), real_of_num(0))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && x <= real_of_num(0) \226\134\146 lub(fmt, x) <= real_of_num(0)
      #|  abs((y : Real) - (z : Real)) == z - y
      #|  abs((x : Real) - (z : Real)) == z - x
      #|  (x : Real) < (z : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < y && y <= z \226\134\146 closer(y, x, z)
      #|  abs((y : Real) - (z : Real)) == z - y
      #|  abs((x : Real) - (z : Real)) == z - x
      #|  (x : Real) < (z : Real)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= y && y < z \226\134\146 closer(y, z, x)
      #|  \226\136\128 x : Real, \226\136\128 y : Real, closer(y, y, x) == false
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, closer(x, y, a) \226\134\146 !closer(y, x, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, closer(x, y, a) && closer(y, z, a) \226\134\146 closer(x, z, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, !closer(x, y, a) && !closer(y, x, a) && closer(y, z, a) \226\134\146 closer(x, z, a)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, (closer(x, y, a) || !closer(y, x, a)) && x <= a && a <= y \226\134\146 abs(x - a) <= abs(y - x) / real_of_num(2)
      #|  \226\136\128 a : Real, \226\136\128 x : Real, \226\136\128 y : Real, (closer(y, x, a) || !closer(x, y, a)) && x <= a && a <= y \226\134\146 abs(y - a) <= abs(y - x) / real_of_num(2)
      #|  (is_closest : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (\226\136\128 s : Real, IN(s, fixed(fmt)) && !(s == y) \226\134\146 closer(y, s, x) || !closer(s, y, x))
      #|  (to_even : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (\226\136\128 y2 : Real, \226\136\128 f : Num, IN(y2, fixed(fmt)) && is_closest(fmt, x, y) && is_closest(fmt, x, y2) && !(y2 == y) && is_frac(fmt, y, f) \226\134\146 EVEN(f))
      #|  (s : Real) == lub((fmt : Fformat), (x : Real))
      #|  (y : Real)
      #|  (s : Real) == glb((fmt : Fformat), (x : Real))
      #|  (y' : Real)
      #|  (y' : Real)
      #|  (s : Real) == lub((fmt : Fformat), (x : Real))
      #|  (s : Real) == glb((fmt : Fformat), (x : Real))
      #|  (y : Real)
      #|  (y : Real)
      #|  (s : Real) == glb((fmt : Fformat), (x : Real))
      #|  (y' : Real)
      #|  (y' : Real)
      #|  (s : Real) == lub((fmt : Fformat), (x : Real))
      #|  (s : Real) < glb((fmt : Fformat), (x : Real))
      #|  (y : Real)
      #|  lub((fmt : Fformat), (x : Real)) == (hi : Real)
      #|  glb((fmt : Fformat), (x : Real)) == (lo : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_near, x) == y && is_fixed(fmt, y) && is_closest(fmt, x, y))
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  1 == SUC(0)
      #|  (f' : Num) == (f : Num) - 1
      #|  (f' : Num) == (f : Num) + 1
      #|  (f' : Num) == (f : Num) + 1 || f' == f - 1
      #|  (y' : Real)
      #|  !is_closest((fmt : Fformat), (x : Real), (y2 : Real))
      #|  (y2 : Real) == lub((fmt : Fformat), (x : Real))
      #|  (y : Real)
      #|  (y : Real)
      #|  (y' : Real)
      #|  !is_closest((fmt : Fformat), (x : Real), (y2 : Real))
      #|  (y2 : Real) == glb((fmt : Fformat), (x : Real))
      #|  (y2 : Real) == glb((fmt : Fformat), (x : Real))
      #|  !((y' : Real) == (y : Real))
      #|  (y' : Real)
      #|  (y : Real)
      #|  !((y2 : Real) == lub((fmt : Fformat), (x : Real)))
      #|  (y : Real)
      #|  (y : Real)
      #|  (y2 : Real) == glb((fmt : Fformat), (x : Real))
      #|  (y' : Real)
      #|  !is_closest((fmt : Fformat), (x : Real), (y2 : Real))
      #|  (y' : Real)
      #|  (y' : Real)
      #|  (y' : Real)
      #|  (y2 : Real) == lub((fmt : Fformat), (x : Real))
      #|  !((y2 : Real) == glb((fmt : Fformat), (x : Real)))
      #|  (y : Real)
      #|  !is_closest((fmt : Fformat), (x : Real), (y2 : Real))
      #|  (y : Real)
      #|  lub((fmt : Fformat), (x : Real)) == (hi : Real)
      #|  glb((fmt : Fformat), (x : Real)) == (lo : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_near, x) == y && is_fixed(fmt, y) && to_even(fmt, x, y))
      #|  (fmt : Fformat)
      #|  ((a : Bool) && !a) == false
      #|  (fmt : Fformat)
      #|  ((a : Bool) && !a) == false
      #|  (fmt : Fformat)
      #|  (fy : Num)
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  ((a : Bool) && !a) == false
      #|  (y2 : Real) == lub((fmt : Fformat), (x : Real))
      #|  ((a : Bool) && !a) == false
      #|  ((a : Bool) && !a) == false
      #|  (fmt : Fformat)
      #|  (fy : Num)
      #|  (fmt : Fformat)
      #|  (fmt : Fformat)
      #|  (y : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_near, x) == y && is_fixed(fmt, y) && is_closest(fmt, x, y) && to_even(fmt, x, y))
      #|  (to_zero : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (if real_of_num(0) <= x { real_of_num(0) <= y && y <= x && (\226\136\128 y' : Real, IN(y', fixed(fmt)) && y' <= x \226\134\146 y' <= y) } else { y <= real_of_num(0) && x <= y && (\226\136\128 y' : Real, IN(y', fixed(fmt)) && x <= y' \226\134\146 y <= y') })
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 x <= real_of_num(0)
      #|  is_ub((fmt : Fformat), (x : Real), real_of_num(0))
      #|  (y' : Real)
      #|  is_lb((fmt : Fformat), (x : Real), real_of_num(0))
      #|  (y : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_zero, x) == y && is_fixed(fmt, y) && to_zero(fmt, x, y))
      #|  (to_pinf : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (x <= y && (\226\136\128 y' : Real, IN(y', fixed(fmt)) && x <= y' \226\134\146 y <= y'))
      #|  (y' : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_pinf, x) == y && is_fixed(fmt, y) && to_pinf(fmt, x, y))
      #|  (to_ninf : (Fformat, Real, Real) -> Bool)((fmt : Fformat), (x : Real), (y : Real)) == (y <= x && (\226\136\128 y' : Real, IN(y', fixed(fmt)) && y' <= x \226\134\146 y' <= y))
      #|  (y : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 (\226\136\131 y : Real, fround(fmt, To_ninf, x) == y && is_fixed(fmt, y) && to_ninf(fmt, x, y))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, \226\136\128 y : Real, fround(fmt, m, x) == y \226\134\146 y == glb(fmt, x) || y == lub(fmt, x)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, fround(fmt, m, x) == glb(fmt, x) || fround(fmt, m, x) == lub(fmt, x)
      #|  (m : Roundmode)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, abs(x) <= finf(fmt) && real_of_num(0) <= x \226\134\146 real_of_num(0) <= fround(fmt, m, x)
      #|  (m : Roundmode)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, abs(x) <= finf(fmt) && x <= real_of_num(0) \226\134\146 fround(fmt, m, x) <= real_of_num(0)
      #|  (m : Roundmode)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  lub((fmt : Fformat), (x : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 m : Roundmode, abs(x) <= finf(fmt) && is_fixed(fmt, y) && x <= y \226\134\146 fround(fmt, m, x) <= y
      #|  (m : Roundmode)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  glb((fmt : Fformat), (x : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 m : Roundmode, abs(x) <= finf(fmt) && is_fixed(fmt, y) && y <= x \226\134\146 y <= fround(fmt, m, x)
      #|  abs(real_of_num(0)) == real_of_num(0)
      #|  fround((fmt : Fformat), (m : Roundmode), real_of_num(0)) <= real_of_num(0)
      #|  abs(real_of_num(0)) == real_of_num(0)
      #|  real_of_num(0) <= fround((fmt : Fformat), (m : Roundmode), real_of_num(0))
      #|  \226\136\128 fmt : Fformat, \226\136\128 m : Roundmode, fround(fmt, m, real_of_num(0)) == real_of_num(0)
      #|  (m : Roundmode)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, \226\136\128 m : Roundmode, abs(x) <= finf(fmt) \226\134\146 is_fixed(fmt, fround(fmt, m, x))
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (y : Real) + (x : Real) - y == x
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!a || b)
      #|  (y' : Real) == (y : Real) + fulp((fmt : Fformat))
      #|  abs((y' : Real) - (y : Real)) / real_of_num(2)
      #|  (x : Real) <= (y : Real) && !(x == y) \226\134\146 x < y
      #|  (x : Real)
      #|  \226\136\128 x : Real, (z1 : Real) <= x && x < (z2 : Real) \226\134\146 !(z2 == z1)
      #|  !((y' : Real) == (y : Real))
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 real_of_num(0) <= x / real_of_num(2)
      #|  abs((y' : Real) - y') == real_of_num(0)
      #|  (x : Real) == (y' : Real)
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (y : Real) + (x : Real) - y == x
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!a || b)
      #|  (y' : Real) == (y : Real) + fulp((fmt : Fformat))
      #|  abs((y' : Real) - (y : Real)) / real_of_num(2)
      #|  (y : Real) <= (x : Real) && !(x == y) \226\134\146 y < x
      #|  (x : Real)
      #|  \226\136\128 x : Real, (z1 : Real) < x && x <= (z2 : Real) \226\134\146 !(z2 == z1)
      #|  !((y' : Real) == (y : Real))
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real) \226\134\146 real_of_num(0) <= x / real_of_num(2)
      #|  abs((y : Real) - y) == real_of_num(0)
      #|  (x : Real) == (y : Real)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 abs(fround(fmt, To_near, x) - x) <= fulp(fmt) / real_of_num(2)
      #|  (y'' : Real) == glb((fmt : Fformat), (x : Real))
      #|  !((y' : Real) == (y : Real))
      #|  (y'' : Real) == lub((fmt : Fformat), (x : Real))
      #|  !((y' : Real) == (y : Real))
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(w - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(z - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 abs(fround(fmt, To_zero, x) - x) <= fulp(fmt)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(w - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(z - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 abs(fround(fmt, To_pinf, x) - x) <= fulp(fmt)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(w - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  (z : Real) <= (a : Real) && a <= (w : Real) \226\134\146 abs(z - a) <= abs(w - z)
      #|  abs((y' : Real) - (y : Real))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) \226\134\146 abs(fround(fmt, To_ninf, x) - x) <= fulp(fmt)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  (x : Real)
      #|  (fmt : Fformat)
      #|  ((x : Real) - (z : Real) < (y : Real)) == (x < z + y)
      #|  (x : Real) + (y : Real) - x == y
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x) + fulp(fmt)
      #|  (real_of_num(2) * ((x : Real) - (y : Real)) < (y' : Real) - y) == (x - y < (y' - y) / real_of_num(2))
      #|  real_of_num(2) * (x : Real) - real_of_num(2) * (y : Real) == real_of_num(2) * (x - y)
      #|  (real_of_num(2) * (x : Real) - (y : Real) < (y' : Real)) == (real_of_num(2) * x - real_of_num(2) * y < y' - y)
      #|  ((x : Real) - (y : Real) < (y' : Real) - x) == (real_of_num(2) * x - y < y')
      #|  closer(glb((fmt : Fformat), (x : Real)), lub(fmt, x), x)
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && x < glb(fmt, x) + fulp(fmt) / real_of_num(2) \226\134\146 fround(fmt, To_near, x) == glb(fmt, x)
      #|  (y : Real) <= (x : Real) \226\134\146 abs(y - x) == x - y
      #|  (y : Real) <= (x : Real) \226\134\146 abs(x - y) == x - y
      #|  ((x : Real) - (z : Real) < (y : Real)) == (x - y < z)
      #|  (x : Real) + (y : Real) - x == y
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x) + fulp(fmt)
      #|  ((y' : Real) - (x : Real) < x - (y : Real)) == (y' - x < (y' - y) / real_of_num(2))
      #|  closer(lub((fmt : Fformat), (x : Real)), glb(fmt, x), x)
      #|  lub((fmt : Fformat), (x : Real)) == glb(fmt, x)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && lub(fmt, x) - fulp(fmt) / real_of_num(2) < x \226\134\146 fround(fmt, To_near, x) == lub(fmt, x)
      #|  (y : Real) <= (x : Real) \226\134\146 abs(y - x) == x - y
      #|  (y : Real) <= (x : Real) \226\134\146 abs(x - y) == x - y
      #|  real_of_num(0) - (x : Real) == -x
      #|  lub((fmt : Fformat), (x : Real)) - fulp(fmt) / real_of_num(2) < x
      #|  -fulp((fmt : Fformat)) / real_of_num(2)
      #|  \226\136\128 y : Real, (x : Real) < y && y <= (z : Real) \226\134\146 x < z
      #|  (x : Real) < (y : Real) \226\134\146 !(y == x)
      #|  !((y' : Real) == -fulp((fmt : Fformat)))
      #|  -(x : Real) + x == real_of_num(0)
      #|  (y' : Real) <= -fulp((fmt : Fformat)) + fulp(fmt)
      #|  IN(-fulp((fmt : Fformat)), fixed(fmt))
      #|  -fulp((fmt : Fformat)) <= (y' : Real)
      #|  (y' : Real) <= real_of_num(0)
      #|  !(real_of_num(0) <= (x : Real))
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 x <= real_of_num(0)
      #|  is_lub((fmt : Fformat), (x : Real), real_of_num(0))
      #|  real_of_num(0) <= (x : Real)
      #|  real_of_num(0) <= (x : Real) \226\134\146 x == abs(x)
      #|  real_of_num(0) + (x : Real) == x
      #|  (x : Real) < glb((fmt : Fformat), x) + fulp(fmt) / real_of_num(2)
      #|  ((x : Real) / real_of_num(2) < x) == (real_of_num(0) < x)
      #|  fulp((fmt : Fformat)) / real_of_num(2)
      #|  \226\136\128 y : Real, (x : Real) <= y && y < (z : Real) \226\134\146 x < z
      #|  real_of_num(0) + (x : Real) == x
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((y' : Real) == real_of_num(0) + fulp((fmt : Fformat)))
      #|  (y' : Real) <= real_of_num(0) + fulp((fmt : Fformat))
      #|  real_of_num(0) <= (y' : Real)
      #|  is_glb((fmt : Fformat), (x : Real), real_of_num(0))
      #|  real_of_num(0) <= (x : Real)
      #|  (fmt : Fformat)
      #|  fulp((fmt : Fformat))
      #|  abs((x : Real)) <= finf((fmt : Fformat))
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) < fulp(fmt) / real_of_num(2) \226\134\146 fround(fmt, To_near, x) == real_of_num(0)
      #|  real_of_num(0) <= (y' : Real)
      #|  (fmt : Fformat)
      #|  real_of_num(0) <= (x : Real)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (fmt : Fformat)
      #|  !(real_of_num(0) <= (x : Real))
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 (abs(x) < (z : Real)) == (x > -z)
      #|  !(real_of_num(0) <= (x : Real))
      #|  !(real_of_num(0) <= (x : Real)) \226\134\146 (abs(x) < (z : Real)) == (x > -z)
      #|  fulp((fmt : Fformat)) / real_of_num(2)
      #|  (a : Real) * abs(real_of_num(1)) == a
      #|  (a : Real) * ((b : Real) / (c : Real)) == b * (a / c)
      #|  (x : Real) * real_of_num(1) == x
      #|  abs((x : Real))
      #|  abs(-(x : Real)) == abs(x)
      #|  (real_of_num(0) - (x : Real)) / x == -(x / x)
      #|  abs((x : Real)) < fulp((fmt : Fformat)) / real_of_num(2)
      #|  abs((x : Real)) < fulp((fmt : Fformat)) / real_of_num(2)
      #|  \226\136\128 fmt : Fformat, \226\136\128 x : Real, abs(x) <= finf(fmt) && !(x == real_of_num(0)) \226\134\146 rerror(x, fround(fmt, To_near, x)) <= real_of_num(1)
      #|FFORMAT_SPLIT =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#=:fun(prod(num,prod(num,int)),fun(prod(num,prod(num,int)),bool)) (#dest_fformat:fun(fformat,prod(num,prod(num,int))) fmt:fformat)) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) (#FST:fun(prod(num,prod(num,int)),num) (#dest_fformat:fun(fformat,prod(num,prod(num,int))) fmt:fformat))) ((#,:fun(num,fun(int,prod(num,int))) (#FST:fun(prod(num,int),num) (#SND:fun(prod(num,prod(num,int)),prod(num,int)) (#dest_fformat:fun(fformat,prod(num,prod(num,int))) fmt:fformat)))) (#SND:fun(prod(num,int),int) (#SND:fun(prod(num,prod(num,int)),prod(num,int)) (#dest_fformat:fun(fformat,prod(num,prod(num,int))) fmt:fformat))))))))
      #|FFORMAT_VALID_IMP_RADIX_LT_1 =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(int,bool),bool) (\e:int. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_fformat:fun(prod(num,prod(num,int)),bool) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int)))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#FST:fun(prod(num,prod(num,int)),num) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int)))))))))))
      #|FFORMAT_VALID_IMP_RADIX_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(int,bool),bool) (\e:int. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_fformat:fun(prod(num,prod(num,int)),bool) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int)))) (#EVEN:fun(num,bool) (#FST:fun(prod(num,prod(num,int)),num) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int)))))))))))
      #|FFORMAT_VALID_IMP_PREC_LT_0 =  |- (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(int,bool),bool) (\e:int. ((#==>:fun(bool,fun(bool,bool)) (#is_valid_fformat:fun(prod(num,prod(num,int)),bool) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int)))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#FST:fun(prod(num,int),num) (#SND:fun(prod(num,prod(num,int)),prod(num,int)) ((#,:fun(num,fun(prod(num,int),prod(num,prod(num,int)))) r:num) ((#,:fun(num,fun(int,prod(num,int))) p:num) e:int))))))))))))
      #|FFORMAT_VALID =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#is_valid_fformat:fun(prod(num,prod(num,int)),bool) (#dest_fformat:fun(fformat,prod(num,prod(num,int))) fmt:fformat))))
      #|FFORMAT_RADIX_LT_1 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#fr:fun(fformat,num) fmt:fformat))))
      #|FFORMAT_RADIX_LT_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#fr:fun(fformat,num) fmt:fformat))))
      #|FFORMAT_RADIX_NE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|FFORMAT_RADIX_EVEN =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#EVEN:fun(num,bool) (#fr:fun(fformat,num) fmt:fformat))))
      #|FFORMAT_PREC_LT_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (#fp:fun(fformat,num) fmt:fformat))))
      #|FFORMAT_PREC_MINUS_1 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#int_le:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) #_0:num))) ((#int_sub:fun(int,fun(int,int)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|FFORMAT_PREC_IPOW_EQ_EXP =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#=:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_sub:fun(int,fun(int,int)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) ((#EXP:fun(num,fun(num,num)) (#fr:fun(fformat,num) fmt:fformat)) ((#-:fun(num,fun(num,num)) (#fp:fun(fformat,num) fmt:fformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|FFORMAT_RADIX_IPOW_LE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(int,bool),bool) (\e:int. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) e:int))))))
      #|FFORMAT_RADIX_IPOW_LT_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(int,bool),bool) (\e:int. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) e:int))))))
      #|FFORMAT_RADIX_IPOW_NEQ_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(int,bool),bool) (\e:int. (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) e:int)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FFORMAT_RADIX_IPOW_ADD_EXP =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(int,bool),bool) (\u:int. (#forall:fun(fun(int,bool),bool) (\v:int. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) u:int)) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) v:int))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) u:int) v:int)))))))))
      #|FIXED_NEG_SYM =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_neg:fun(real,real) x:real)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat)))))))
      #|FIXED_FINF_IN_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) (#finf:fun(fformat,real) fmt:fformat)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_neg:fun(real,real) (#finf:fun(fformat,real) fmt:fformat))) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat)))))
      #|FIXED_ZERO_IN_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#IN:fun(real,fun(fun(real,bool),bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))))
      #|FIXED_FULP_IN_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#IN:fun(real,fun(fun(real,bool),bool)) (#fulp:fun(fformat,real) fmt:fformat)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))))
      #|FIXED_FINF_BOUNDS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#finf:fun(fformat,real) fmt:fformat))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#finf:fun(fformat,real) fmt:fformat))))))))
      #|FIXED_FRAC_LT_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(num,bool),bool) (\f:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) u:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) u:real) f:num))) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) f:num))))))))
      #|FIXED_FF_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) (#?:fun(fun(num,bool),bool) (\f:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) x:real)) f:num)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) x:real) f:num)))))))))
      #|FIXED_FF_UNIQUE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\f1:num. (#forall:fun(fun(num,bool),bool) (\f2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) x:real) f1:num)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) x:real) f2:num))) ((#=:fun(num,fun(num,bool)) f1:num) f2:num))))))))))
      #|FIXED_FULP_LE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#fulp:fun(fformat,real) fmt:fformat))))
      #|FIXED_FULP_LT_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#fulp:fun(fformat,real) fmt:fformat))))
      #|FIXED_FULP_LE_FINF =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#real_le:fun(real,fun(real,bool)) (#fulp:fun(fformat,real) fmt:fformat)) (#finf:fun(fformat,real) fmt:fformat))))
      #|FIXED_FF_LE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) x:real)) ((#<=:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) x:real)) ((#EXP:fun(num,fun(num,num)) (#fr:fun(fformat,num) fmt:fformat)) ((#-:fun(num,fun(num,num)) (#fp:fun(fformat,num) fmt:fformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|FIXED_FF_LT =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat)))) ((#<:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) x:real)) ((#EXP:fun(num,fun(num,num)) (#fr:fun(fformat,num) fmt:fformat)) ((#-:fun(num,fun(num,num)) (#fp:fun(fformat,num) fmt:fformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|FIXED_FF_FINF =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#=:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) (#finf:fun(fformat,real) fmt:fformat))) ((#EXP:fun(num,fun(num,num)) (#fr:fun(fformat,num) fmt:fformat)) ((#-:fun(num,fun(num,num)) (#fp:fun(fformat,num) fmt:fformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|FIXED_FF_NEG =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) x:real)) ((#=:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) (#real_neg:fun(real,real) x:real))) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) x:real)))))))
      #|FIXED_FF_REP =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) x:real)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) x:real))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) (#fe:fun(fformat,int) fmt:fformat)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|FIXED_FF_ZERO =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. ((#=:fun(num,fun(num,bool)) ((#ff:fun(fformat,fun(real,num)) fmt:fformat) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num))))
      #|FIXED_CORR =  |- ((#=:fun(real,fun(real,bool)) ((#fixed_corr:fun(fformat,fun(num,real)) fmt:fformat) n:num)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#COND:fun(bool,fun(real,fun(real,real))) (#ODD:fun(num,bool) n:num)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) ((#DIV:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) (#fe:fun(fformat,int) fmt:fformat)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#DIV:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) (#fe:fun(fformat,int) fmt:fformat)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|FIXED_PREIMAGE =  |- ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#fixed_preimage:fun(fformat,fun(num,bool)) fmt:fformat)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\n:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) (#fr:fun(fformat,num) fmt:fformat)) ((#-:fun(num,fun(num,num)) (#fp:fun(fformat,num) fmt:fformat)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) n:num))))))
      #|FIXED_IN_IMAGE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) n:num) (#fixed_preimage:fun(fformat,fun(num,bool)) fmt:fformat))) ((#=:fun(real,fun(real,bool)) ((#fixed_corr:fun(fformat,fun(num,real)) fmt:fformat) n:num)) x:real)))))))))
      #|FIXED_FINITE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#FINITE:fun(fun(real,bool),bool) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))))
      #|FIXED_NONEMPTY =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat)) #EMPTY:fun(real,bool)))))
      #|FIXED_GLB_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) y:real)) (((#is_glb:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)))))))))
      #|FIXED_LUB_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) y:real)) (((#is_lub:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)))))))))
      #|FIXED_GLB_UNIQUE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y1:real. (#forall:fun(fun(real,bool),bool) (\y2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) (((#is_glb:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y1:real)) (((#is_glb:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y2:real)))) ((#=:fun(real,fun(real,bool)) y1:real) y2:real))))))))))
      #|FIXED_LUB_UNIQUE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y1:real. (#forall:fun(fun(real,bool),bool) (\y2:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) (((#is_lub:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y1:real)) (((#is_lub:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y2:real)))) ((#=:fun(real,fun(real,bool)) y1:real) y2:real))))))))))
      #|FIXED_GLB_IS_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#IN:fun(real,fun(fun(real,bool),bool)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat)))))))
      #|FIXED_LUB_IS_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#IN:fun(real,fun(fun(real,bool),bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat)))))))
      #|FIXED_PLUS_FULP_NNEG =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(num,bool),bool) (\f:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) u:real)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) u:real) f:num))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) (#fulp:fun(fformat,real) fmt:fformat))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) f:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) (#fe:fun(fformat,int) fmt:fformat)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|FIXED_PLUS_FULP_NEG =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(num,bool),bool) (\f:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) u:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) u:real) f:num))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) u:real) (#fulp:fun(fformat,real) fmt:fformat))) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) f:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#ipow:fun(real,fun(int,real)) (#real_of_num:fun(num,real) (#fr:fun(fformat,num) fmt:fformat))) ((#int_add:fun(int,fun(int,int)) ((#int_sub:fun(int,fun(int,int)) (#fe:fun(fformat,int) fmt:fformat)) (#int_of_num:fun(num,int) (#fp:fun(fformat,num) fmt:fformat)))) (#int_of_num:fun(num,int) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|FIXED_FULP_DISTANCE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\v:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) u:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) v:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) u:real) v:real)) ((#real_le:fun(real,fun(real,bool)) v:real) ((#real_add:fun(real,fun(real,real)) u:real) (#fulp:fun(fformat,real) fmt:fformat))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) v:real) u:real)) ((#=:fun(real,fun(real,bool)) v:real) ((#real_add:fun(real,fun(real,real)) u:real) (#fulp:fun(fformat,real) fmt:fformat)))))))))))
      #|FIXED_GLB_LUB_BOUNDS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real))) ((#real_le:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#real_add:fun(real,fun(real,real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#fulp:fun(fformat,real) fmt:fformat)))))))))
      #|FIXED_GLB_LUB_DIST =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real))) ((#=:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#real_add:fun(real,fun(real,real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#fulp:fun(fformat,real) fmt:fformat)))))))))
      #|FIXED_GLB_LUB_DIST_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)))) (#fulp:fun(fformat,real) fmt:fformat)))))))
      #|FIXED_GLB_LUB_FRAC =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\f1:num. (#forall:fun(fun(num,bool),bool) (\f2:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) f1:num)) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) f2:num))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) f1:num) f2:num)) ((#=:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) f1:num) ((#+:fun(num,fun(num,num)) f2:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) f1:num) ((#-:fun(num,fun(num,num)) f2:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))
      #|FIXED_GLB_LUB_DISCRETE =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) s:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) s:real) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real))) ((#real_le:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) s:real))))))))))
      #|FIXED_GLB_LE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)))))))
      #|FIXED_GLB_LE_0_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FIXED_LUB_LE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)))))))
      #|FIXED_LUB_LE_0_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|CLOSER_LOWER =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) z:real))))))))
      #|CLOSER_HIGHER =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) z:real))) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) z:real) x:real))))))))
      #|CLOSER_EQ =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) y:real) x:real)) #F:bool)))))
      #|CLOSER_NEG =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real)))))))))
      #|CLOSER_TRANS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) z:real) a:real))) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) z:real) a:real))))))))))
      #|CLOSER_TRANS_2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real))) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) z:real) a:real)))) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) z:real) a:real))))))))))
      #|CLOSER_BETWEEN_1 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) a:real)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) a:real))) ((#real_div:fun(real,fun(real,real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|CLOSER_BETWEEN_2 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) x:real) a:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) x:real) y:real) a:real)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) a:real)) ((#real_le:fun(real,fun(real,bool)) a:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) a:real))) ((#real_div:fun(real,fun(real,real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) y:real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|is_closest =  |- ((#=:fun(bool,fun(bool,bool)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) s:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) s:real) y:real)))) ((#\/:fun(bool,fun(bool,bool)) (((#closer:fun(real,fun(real,fun(real,bool))) y:real) s:real) x:real)) (#~:fun(bool,bool) (((#closer:fun(real,fun(real,fun(real,bool))) s:real) y:real) x:real)))))))
      #|to_even =  |- ((#=:fun(bool,fun(bool,bool)) (((#to_even:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y2:real. (#forall:fun(fun(num,bool),bool) (\f:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y2:real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y2:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) y2:real) y:real))) (((#is_frac:fun(fformat,fun(real,fun(num,bool))) fmt:fformat) y:real) f:num)))))) (#EVEN:fun(num,bool) f:num)))))))
      #|FIXED_RD_NEAREST_CLOSEST =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real))))))))))
      #|FIXED_RD_NEAREST_EVEN =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) (((#to_even:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real))))))))))
      #|FIXED_RD_NEAREST_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) ((#/\:fun(bool,fun(bool,bool)) (((#is_closest:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) (((#to_even:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)))))))))))
      #|to_zero =  |- ((#=:fun(bool,fun(bool,bool)) (((#to_zero:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y':real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) y':real) x:real))) ((#real_le:fun(real,fun(real,bool)) y':real) y:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y':real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) x:real) y':real))) ((#real_le:fun(real,fun(real,bool)) y:real) y':real))))))))
      #|FIXED_RD_ZERO_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_zero:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) (((#to_zero:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real))))))))))
      #|to_pinf =  |- ((#=:fun(bool,fun(bool,bool)) (((#to_pinf:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y':real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) x:real) y':real))) ((#real_le:fun(real,fun(real,bool)) y:real) y':real))))))
      #|FIXED_RD_PINF_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_pinf:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) (((#to_pinf:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real))))))))))
      #|to_ninf =  |- ((#=:fun(bool,fun(bool,bool)) (((#to_ninf:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)) (#forall:fun(fun(real,bool),bool) (\y':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y':real) (#fixed:fun(fformat,fun(real,bool)) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) y':real) x:real))) ((#real_le:fun(real,fun(real,bool)) y':real) y:real))))))
      #|FIXED_RD_NINF_EXISTS =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_ninf:roundmode) x:real)) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) (((#to_ninf:fun(fformat,fun(real,fun(real,bool))) fmt:fformat) x:real) y:real))))))))))
      #|FIXED_RD_IS_GLB_LUB =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)) y:real)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) y:real) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real))) ((#=:fun(real,fun(real,bool)) y:real) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real))))))))))))
      #|FIXED_RD_IS_GLB_LUB_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real))) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)))))))))
      #|FIXED_RD_LE_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)))))))))
      #|FIXED_RD_LE_0_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|FIXED_RD_MONO =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)))) ((#real_le:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)) y:real))))))))))
      #|FIXED_RD_MONO_2 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#/\:fun(bool,fun(bool,bool)) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)))) ((#real_le:fun(real,fun(real,bool)) y:real) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)))))))))))
      #|FIXED_RD_EQ_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|FIXED_RD_IS_FIXED =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(roundmode,bool),bool) (\m:roundmode. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#is_fixed:fun(fformat,fun(real,bool)) fmt:fformat) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) m:roundmode) x:real)))))))))
      #|FIXED_RD_NEAREST_ABS_ERROR =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) x:real))) ((#real_div:fun(real,fun(real,real)) (#fulp:fun(fformat,real) fmt:fformat)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|FIXED_RD_ZERO_ABS_ERROR =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_zero:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) fmt:fformat)))))))
      #|FIXED_RD_PINF_ABS_ERROR =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_pinf:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) fmt:fformat)))))))
      #|FIXED_RD_NINF_ABS_ERROR =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_ninf:roundmode) x:real)) x:real))) (#fulp:fun(fformat,real) fmt:fformat)))))))
      #|FIXED_RD_NEAREST_TO_GLB =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_add:fun(real,fun(real,real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#real_div:fun(real,fun(real,real)) (#fulp:fun(fformat,real) fmt:fformat)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) ((#glb:fun(fformat,fun(real,real)) fmt:fformat) x:real)))))))
      #|FIXED_RD_NEAREST_TO_LUB =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) ((#real_lt:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)) ((#real_div:fun(real,fun(real,real)) (#fulp:fun(fformat,real) fmt:fformat)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) x:real))) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) ((#lub:fun(fformat,fun(real,real)) fmt:fformat) x:real)))))))
      #|FIXED_RD_NEAREST_TO_0 =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) ((#real_div:fun(real,fun(real,real)) (#fulp:fun(fformat,real) fmt:fformat)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#=:fun(real,fun(real,bool)) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|FIXED_RD_NEAREST_REL_ERROR =  |- (#forall:fun(fun(fformat,bool),bool) (\fmt:fformat. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#finf:fun(fformat,real) fmt:fformat))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) ((#rerror:fun(real,fun(real,real)) x:real) (((#fround:fun(fformat,fun(roundmode,fun(real,real))) fmt:fformat) #To_near:roundmode) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|types = roundmode/0 fformat/0 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = to_ninf to_pinf to_zero to_even is_closest fixed_preimage fixed_corr fround To_ninf To_pinf To_zero To_near _116450 _116449 _116448 _116447 _dest_roundmode _mk_roundmode lub glb is_lub is_ub is_glb is_lb fixed finf fulp is_fixed ff is_frac fe fp fr dest_fformat mk_fformat is_valid_fformat sup_int sup_num is_sup_int is_sup_num closer rerror ipow superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 302
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _122036:bool
      #|
    ),
  )
}
