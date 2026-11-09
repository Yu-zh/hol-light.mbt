// Arithmetic/fol.ml in its directory's load order: the test block of
// arithmetic/fol/fol_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Arithmetic_fol_ref.expected).

///|
test "Arithmetic/fol matches Arithmetic/fol.ml" {
  @testkit.release_output()
  @fol.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/rstc", "Library/prime", "Arithmetic/fol",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Arithmetic/fol")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("term_INDUCT", () => sthm(@fol.term_induct()))
  log.attempt("term_RECURSION", () => sthm(@fol.term_recursion()))
  log.attempt("term_CASES", () => sthm(@fol.term_cases()))
  log.attempt("term_DISTINCT", () => sthm(@fol.term_distinct()))
  log.attempt("term_INJ", () => sthm(@fol.term_inj()))
  log.attempt("form_INDUCT", () => sthm(@fol.form_induct()))
  log.attempt("form_RECURSION", () => sthm(@fol.form_recursion()))
  log.attempt("form_CASES", () => sthm(@fol.form_cases()))
  log.attempt("form_DISTINCT", () => sthm(@fol.form_distinct()))
  log.attempt("form_INJ", () => sthm(@fol.form_inj()))
  log.attempt("valmod", () => sthm(@fol.valmod()))
  log.attempt("termval", () => sthm(@fol.termval()))
  log.attempt("holds", () => sthm(@fol.holds()))
  log.attempt("arithtrue", () => sthm(@fol.arithtrue()))
  log.attempt("VALMOD", () => sthm(@fol.valmod_v1()))
  log.attempt("VALMOD_BASIC", () => sthm(@fol.valmod_basic()))
  log.attempt("VALMOD_VALMOD_BASIC", () => sthm(@fol.valmod_valmod_basic()))
  log.attempt("VALMOD_REPEAT", () => sthm(@fol.valmod_repeat()))
  log.attempt("FORALL_VALMOD", () => sthm(@fol.forall_valmod()))
  log.attempt("VALMOD_SWAP", () => sthm(@fol.valmod_swap()))
  log.attempt("VALMOD_TRIVIAL", () => sthm(@fol.valmod_trivial()))
  log.attempt("assign", () => sthm(@fol.assign()))
  log.attempt("ASSIGN", () => sthm(@fol.assign_v1()))
  log.attempt("ASSIGN_TRIV", () => sthm(@fol.assign_triv()))
  log.attempt("FVT", () => sthm(@fol.fvt()))
  log.attempt("FV", () => sthm(@fol.fv()))
  log.attempt("FVT_FINITE", () => sthm(@fol.fvt_finite()))
  log.attempt("FV_FINITE", () => sthm(@fol.fv_finite()))
  log.attempt("axiom_RULES", () => sthm(@fol.axiom_rules()))
  log.attempt("axiom_INDUCT", () => sthm(@fol.axiom_induct()))
  log.attempt("axiom_CASES", () => sthm(@fol.axiom_cases()))
  log.attempt("proves_RULES", () => sthm(@fol.proves_rules()))
  log.attempt("proves_INDUCT", () => sthm(@fol.proves_induct()))
  log.attempt("proves_CASES", () => sthm(@fol.proves_cases()))
  log.attempt("TERMVAL_VALUATION", () => sthm(@fol.termval_valuation()))
  log.attempt("HOLDS_VALUATION", () => sthm(@fol.holds_valuation()))
  log.attempt("TERMVAL_VALMOD_OTHER", () => sthm(@fol.termval_valmod_other()))
  log.attempt("HOLDS_VALMOD_OTHER", () => sthm(@fol.holds_valmod_other()))
  log.attempt("AXIOMS_TRUE", () => sthm(@fol.axioms_true()))
  log.attempt("THEOREMS_TRUE", () => sthm(@fol.theorems_true()))
  log.attempt("MAX_SYM", () => sthm(@fol.max_sym()))
  log.attempt("MAX_ASSOC", () => sthm(@fol.max_assoc()))
  log.attempt("SETMAX", () => sthm(@fol.setmax()))
  log.attempt("VARIANT", () => sthm(@fol.variant()))
  log.attempt("SETMAX_LEMMA", () => sthm(@fol.setmax_lemma()))
  log.attempt("SETMAX_MEMBER", () => sthm(@fol.setmax_member()))
  log.attempt("SETMAX_THM", () => sthm(@fol.setmax_thm()))
  log.attempt("SETMAX_UNION", () => sthm(@fol.setmax_union()))
  log.attempt("VARIANT_FINITE", () => sthm(@fol.variant_finite()))
  log.attempt("VARIANT_THM", () => sthm(@fol.variant_thm()))
  log.attempt("NOT_IN_VARIANT", () => sthm(@fol.not_in_variant()))
  log.attempt("termsubst", () => sthm(@fol.termsubst()))
  log.attempt("TERMVAL_TERMSUBST", () => sthm(@fol.termval_termsubst()))
  log.attempt("TERMSUBST_TERMSUBST", () => sthm(@fol.termsubst_termsubst()))
  log.attempt("TERMSUBST_TRIV", () => sthm(@fol.termsubst_triv()))
  log.attempt("TERMSUBST_EQ", () => sthm(@fol.termsubst_eq()))
  log.attempt("TERMSUBST_FVT", () => sthm(@fol.termsubst_fvt()))
  log.attempt("TERMSUBST_ASSIGN", () => sthm(@fol.termsubst_assign()))
  log.attempt("TERMSUBST_TRIVIAL", () => sthm(@fol.termsubst_trivial()))
  log.attempt("formsubst", () => sthm(@fol.formsubst()))
  log.attempt("FORMSUBST_PROPERTIES", () => sthm(@fol.formsubst_properties()))
  log.attempt("FORMSUBST_FV", () => sthm(@fol.formsubst_fv()))
  log.attempt("HOLDS_FORMSUBST", () => sthm(@fol.holds_formsubst()))
  log.attempt("FORMSUBST_EQ", () => sthm(@fol.formsubst_eq()))
  log.attempt("FORMSUBST_TRIV", () => sthm(@fol.formsubst_triv()))
  log.attempt("FORMSUBST_TRIVIAL", () => sthm(@fol.formsubst_trivial()))
  log.attempt("safe_for", () => sthm(@fol.safe_for()))
  log.attempt("SAFE_FOR_V", () => sthm(@fol.safe_for_v()))
  log.attempt("SAFE_FOR_VALMOD", () => sthm(@fol.safe_for_valmod()))
  log.attempt("SAFE_FOR_ASSIGN", () => sthm(@fol.safe_for_assign()))
  log.attempt("FORMSUBST_SAFE_FOR", () => sthm(@fol.formsubst_safe_for()))
  log.attempt("qsubst", () => sthm(@fol.qsubst()))
  log.attempt("FV_QSUBST", () => sthm(@fol.fv_qsubst()))
  log.attempt("HOLDS_QSUBST", () => sthm(@fol.holds_qsubst()))
  log.attempt("numeral", () => sthm(@fol.numeral()))
  log.attempt("TERMVAL_NUMERAL", () => sthm(@fol.termval_numeral()))
  log.attempt("FVT_NUMERAL", () => sthm(@fol.fvt_numeral()))
  log.attempt("closed", () => sthm(@fol.closed()))
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
      #|0..0..1..4..9..21..45..solved at 54
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..20..40..76..154..solved at 181
      #|0..0..2..4..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..4..solved at 8
      #|0..0..1..4..11..20..35..62..solved at 77
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 9
      #|0..0..1..3..5..8..11..14..solved at 21
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..3..9..20..35..solved at 45
      #|0..0..1..solved at 4
      #|0..0..1..2..5..15..27..solved at 35
      #|0..0..1..2..5..11..26..50..89..134..211..309..421..590..799..1042..solved at 1258
      #|0..0..1..2..7..17..30..solved at 41
      #|0..0..1..2..7..18..33..solved at 49
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..6..solved at 12
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..1..4..9..16..solved at 26
      #|0..0..1..3..7..12..solved at 22
      #|0..0..1..4..9..16..27..41..solved at 54
      #|0..0..1..solved at 4
      #|0..0..1..3..7..solved at 13
      #|0..0..solved at 2
      #|0..0..1..4..solved at 9
      #|0..0..1..4..8..14..solved at 22
      #|0..0..1..4..9..15..solved at 23
      #|0..0..1..4..9..16..27..41..solved at 52
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..solved at 8
      #|0..0..1..4..solved at 8
      #|0..0..1..3..10..22..41..77..130..206..solved at 241
      #|0..0..1..3..solved at 8
      #|0..0..1..4..solved at 8
      #|0..0..1..3..10..22..41..77..130..206..solved at 241
      #|0..0..1..2..5..12..20..solved at 28
      #|0..0..0..2..5..12..solved at 23
      #|0..0..0..0..1..5..11..21..31..43..71..99..144..solved at 222
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..29..39..53..79..105..173..solved at 197
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..6..13..27..55..99..solved at 128
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..solved at 13
      #|0..0..2..solved at 6
      #|0..0..1..4..11..25..53..96..solved at 119
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..solved at 13
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..29..39..53..79..105..173..solved at 193
      #|0..0..1..solved at 4
      #|0..0..1..4..7..17..40..80..solved at 95
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..2..5..13..26..48..94..157..254..428..643..solved at 739
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..28..37..50..67..84..123..solved at 139
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..4..8..18..43..87..solved at 112
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..2..6..16..41..84..solved at 102
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..19..solved at 27
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..4..solved at 9
      #|0..0..2..7..20..46..85..solved at 99
      #|0..0..1..3..solved at 8
      #|0..0..1..3..10..25..48..solved at 62
      #|0..0..1..3..solved at 12
      #|0..0..2..7..17..35..62..solved at 76
      #|0..0..1..3..solved at 8
      #|0..0..1..3..10..25..48..solved at 62
      #|0..0..1..3..11..21..solved at 34
      #|0..0..2..6..16..34..61..solved at 75
      #|0..0..1..3..solved at 8
      #|0..0..1..3..10..25..48..solved at 62
      #|0..0..1..3..10..20..solved at 33
      #|0..0..1..4..11..24..45..solved at 54
      #|0..0..1..4..solved at 13
      #|0..0..1..2..5..10..19..29..39..53..79..105..173..solved at 197
      #|0..0..1..2..6..14..22..solved at 30
      #|0..0..1..2..solved at 8
      #|0..0..1..2..5..12..27..solved at 38
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..5..10..19..28..37..50..67..84..123..solved at 139
      #|0..0..1..2..5..9..solved at 15
      #|0..0..1..2..4..8..solved at 14
      #|0..0..3..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 13
      #|0..0..3..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..4..13..solved at 29
      #|0..0..3..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..4..12..solved at 28
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 11
      #|0..0..1..2..5..10..19..29..39..51..77..103..177..269..361..467..657..847..1037..1258..1479..1724..solved at 1767
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..20..solved at 28
      #|0..0..1..2..5..12..20..solved at 28
      #|0..0..1..2..5..12..20..solved at 28
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 9
      #|0..0..1..4..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..7..14..23..38..66..104..163..250..solved at 301
      #|0..0..1..2..4..9..16..30..66..solved at 79
      #|0..0..0..1..2..3..6..9..12..27..solved at 39
      #|0..0..1..2..4..9..16..32..solved at 42
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 14
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
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
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..6..20..solved at 25
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 5
      #|0..0..1..4..7..solved at 12
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
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
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
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
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
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
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
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
      #|0..0..1..3..11..36..117..361..solved at 627
      #|0..0..1..3..11..37..118..368..solved at 393
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|13 basis elements and 10 critical pairs
      #|13 basis elements and 9 critical pairs
      #|13 basis elements and 8 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|16 basis elements and 12 critical pairs
      #|16 basis elements and 11 critical pairs
      #|16 basis elements and 10 critical pairs
      #|16 basis elements and 9 critical pairs
      #|16 basis elements and 8 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 17 critical pairs
      #|18 basis elements and 16 critical pairs
      #|18 basis elements and 15 critical pairs
      #|19 basis elements and 22 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|20 basis elements and 25 critical pairs
      #|20 basis elements and 24 critical pairs
      #|20 basis elements and 23 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|21 basis elements and 24 critical pairs
      #|21 basis elements and 23 critical pairs
      #|21 basis elements and 22 critical pairs
      #|21 basis elements and 21 critical pairs
      #|21 basis elements and 20 critical pairs
      #|21 basis elements and 19 critical pairs
      #|21 basis elements and 18 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|22 basis elements and 18 critical pairs
      #|22 basis elements and 17 critical pairs
      #|22 basis elements and 16 critical pairs
      #|22 basis elements and 15 critical pairs
      #|22 basis elements and 14 critical pairs
      #|22 basis elements and 13 critical pairs
      #|22 basis elements and 12 critical pairs
      #|22 basis elements and 11 critical pairs
      #|22 basis elements and 10 critical pairs
      #|22 basis elements and 9 critical pairs
      #|22 basis elements and 8 critical pairs
      #|22 basis elements and 7 critical pairs
      #|23 basis elements and 11 critical pairs
      #|23 basis elements and 10 critical pairs
      #|23 basis elements and 9 critical pairs
      #|23 basis elements and 8 critical pairs
      #|23 basis elements and 7 critical pairs
      #|23 basis elements and 6 critical pairs
      #|24 basis elements and 17 critical pairs
      #|24 basis elements and 16 critical pairs
      #|24 basis elements and 15 critical pairs
      #|24 basis elements and 14 critical pairs
      #|24 basis elements and 13 critical pairs
      #|24 basis elements and 12 critical pairs
      #|24 basis elements and 11 critical pairs
      #|24 basis elements and 10 critical pairs
      #|25 basis elements and 16 critical pairs
      #|25 basis elements and 15 critical pairs
      #|25 basis elements and 14 critical pairs
      #|25 basis elements and 13 critical pairs
      #|25 basis elements and 12 critical pairs
      #|25 basis elements and 11 critical pairs
      #|26 basis elements and 19 critical pairs
      #|26 basis elements and 18 critical pairs
      #|26 basis elements and 17 critical pairs
      #|26 basis elements and 16 critical pairs
      #|26 basis elements and 15 critical pairs
      #|26 basis elements and 14 critical pairs
      #|26 basis elements and 13 critical pairs
      #|27 basis elements and 19 critical pairs
      #|27 basis elements and 18 critical pairs
      #|27 basis elements and 17 critical pairs
      #|27 basis elements and 16 critical pairs
      #|27 basis elements and 15 critical pairs
      #|27 basis elements and 14 critical pairs
      #|28 basis elements and 22 critical pairs
      #|28 basis elements and 21 critical pairs
      #|28 basis elements and 20 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|29 basis elements and 29 critical pairs
      #|29 basis elements and 28 critical pairs
      #|29 basis elements and 27 critical pairs
      #|29 basis elements and 26 critical pairs
      #|29 basis elements and 25 critical pairs
      #|29 basis elements and 24 critical pairs
      #|29 basis elements and 23 critical pairs
      #|29 basis elements and 22 critical pairs
      #|29 basis elements and 21 critical pairs
      #|29 basis elements and 20 critical pairs
      #|29 basis elements and 19 critical pairs
      #|29 basis elements and 18 critical pairs
      #|29 basis elements and 17 critical pairs
      #|29 basis elements and 16 critical pairs
      #|29 basis elements and 15 critical pairs
      #|29 basis elements and 14 critical pairs
      #|29 basis elements and 13 critical pairs
      #|29 basis elements and 12 critical pairs
      #|29 basis elements and 11 critical pairs
      #|29 basis elements and 10 critical pairs
      #|30 basis elements and 18 critical pairs
      #|30 basis elements and 17 critical pairs
      #|30 basis elements and 16 critical pairs
      #|30 basis elements and 15 critical pairs
      #|30 basis elements and 14 critical pairs
      #|30 basis elements and 13 critical pairs
      #|30 basis elements and 12 critical pairs
      #|30 basis elements and 11 critical pairs
      #|30 basis elements and 10 critical pairs
      #|30 basis elements and 9 critical pairs
      #|30 basis elements and 8 critical pairs
      #|30 basis elements and 7 critical pairs
      #|30 basis elements and 6 critical pairs
      #|30 basis elements and 5 critical pairs
      #|30 basis elements and 4 critical pairs
      #|30 basis elements and 3 critical pairs
      #|30 basis elements and 2 critical pairs
      #|30 basis elements and 1 critical pairs
      #|30 basis elements and 0 critical pairs
      #|11 basis elements and 7 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|14 basis elements and 14 critical pairs
      #|15 basis elements and 18 critical pairs
      #|16 basis elements and 25 critical pairs
      #|17 basis elements and 32 critical pairs
      #|18 basis elements and 36 critical pairs
      #|19 basis elements and 42 critical pairs
      #|20 basis elements and 49 critical pairs
      #|21 basis elements and 57 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|23 basis elements and 66 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|23 basis elements and 62 critical pairs
      #|23 basis elements and 61 critical pairs
      #|24 basis elements and 70 critical pairs
      #|25 basis elements and 79 critical pairs
      #|26 basis elements and 86 critical pairs
      #|26 basis elements and 85 critical pairs
      #|27 basis elements and 96 critical pairs
      #|27 basis elements and 95 critical pairs
      #|28 basis elements and 106 critical pairs
      #|28 basis elements and 105 critical pairs
      #|28 basis elements and 104 critical pairs
      #|28 basis elements and 103 critical pairs
      #|28 basis elements and 102 critical pairs
      #|28 basis elements and 101 critical pairs
      #|29 basis elements and 119 critical pairs
      #|30 basis elements and 128 critical pairs
      #|30 basis elements and 127 critical pairs
      #|31 basis elements and 146 critical pairs
      #|31 basis elements and 145 critical pairs
      #|31 basis elements and 144 critical pairs
      #|31 basis elements and 143 critical pairs
      #|31 basis elements and 142 critical pairs
      #|31 basis elements and 141 critical pairs
      #|31 basis elements and 140 critical pairs
      #|31 basis elements and 139 critical pairs
      #|31 basis elements and 138 critical pairs
      #|31 basis elements and 137 critical pairs
      #|31 basis elements and 136 critical pairs
      #|32 basis elements and 156 critical pairs
      #|33 basis elements and 177 critical pairs
      #|34 basis elements and 197 critical pairs
      #|35 basis elements and 216 critical pairs
      #|36 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 11 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|15 basis elements and 24 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|15 basis elements and 21 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|21 basis elements and 45 critical pairs
      #|22 basis elements and 50 critical pairs
      #|22 basis elements and 49 critical pairs
      #|22 basis elements and 48 critical pairs
      #|22 basis elements and 47 critical pairs
      #|22 basis elements and 46 critical pairs
      #|22 basis elements and 45 critical pairs
      #|22 basis elements and 44 critical pairs
      #|22 basis elements and 43 critical pairs
      #|22 basis elements and 42 critical pairs
      #|22 basis elements and 41 critical pairs
      #|22 basis elements and 40 critical pairs
      #|22 basis elements and 39 critical pairs
      #|22 basis elements and 38 critical pairs
      #|22 basis elements and 37 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|24 basis elements and 47 critical pairs
      #|24 basis elements and 46 critical pairs
      #|24 basis elements and 45 critical pairs
      #|24 basis elements and 44 critical pairs
      #|25 basis elements and 49 critical pairs
      #|26 basis elements and 58 critical pairs
      #|26 basis elements and 57 critical pairs
      #|26 basis elements and 56 critical pairs
      #|26 basis elements and 55 critical pairs
      #|26 basis elements and 54 critical pairs
      #|26 basis elements and 53 critical pairs
      #|26 basis elements and 52 critical pairs
      #|27 basis elements and 62 critical pairs
      #|27 basis elements and 61 critical pairs
      #|28 basis elements and 73 critical pairs
      #|28 basis elements and 72 critical pairs
      #|28 basis elements and 71 critical pairs
      #|28 basis elements and 70 critical pairs
      #|28 basis elements and 69 critical pairs
      #|29 basis elements and 80 critical pairs
      #|29 basis elements and 79 critical pairs
      #|29 basis elements and 78 critical pairs
      #|29 basis elements and 77 critical pairs
      #|29 basis elements and 76 critical pairs
      #|29 basis elements and 75 critical pairs
      #|29 basis elements and 74 critical pairs
      #|29 basis elements and 73 critical pairs
      #|29 basis elements and 72 critical pairs
      #|30 basis elements and 85 critical pairs
      #|30 basis elements and 84 critical pairs
      #|30 basis elements and 83 critical pairs
      #|30 basis elements and 82 critical pairs
      #|30 basis elements and 81 critical pairs
      #|30 basis elements and 80 critical pairs
      #|30 basis elements and 79 critical pairs
      #|30 basis elements and 78 critical pairs
      #|30 basis elements and 77 critical pairs
      #|30 basis elements and 76 critical pairs
      #|30 basis elements and 75 critical pairs
      #|30 basis elements and 74 critical pairs
      #|30 basis elements and 73 critical pairs
      #|30 basis elements and 72 critical pairs
      #|30 basis elements and 71 critical pairs
      #|31 basis elements and 79 critical pairs
      #|31 basis elements and 78 critical pairs
      #|31 basis elements and 77 critical pairs
      #|31 basis elements and 76 critical pairs
      #|31 basis elements and 75 critical pairs
      #|31 basis elements and 74 critical pairs
      #|31 basis elements and 73 critical pairs
      #|31 basis elements and 72 critical pairs
      #|31 basis elements and 71 critical pairs
      #|31 basis elements and 70 critical pairs
      #|31 basis elements and 69 critical pairs
      #|31 basis elements and 68 critical pairs
      #|31 basis elements and 67 critical pairs
      #|31 basis elements and 66 critical pairs
      #|31 basis elements and 65 critical pairs
      #|31 basis elements and 64 critical pairs
      #|31 basis elements and 63 critical pairs
      #|31 basis elements and 62 critical pairs
      #|31 basis elements and 61 critical pairs
      #|32 basis elements and 70 critical pairs
      #|32 basis elements and 69 critical pairs
      #|32 basis elements and 68 critical pairs
      #|32 basis elements and 67 critical pairs
      #|32 basis elements and 66 critical pairs
      #|32 basis elements and 65 critical pairs
      #|32 basis elements and 64 critical pairs
      #|32 basis elements and 63 critical pairs
      #|33 basis elements and 70 critical pairs
      #|33 basis elements and 69 critical pairs
      #|33 basis elements and 68 critical pairs
      #|33 basis elements and 67 critical pairs
      #|33 basis elements and 66 critical pairs
      #|33 basis elements and 65 critical pairs
      #|33 basis elements and 64 critical pairs
      #|33 basis elements and 63 critical pairs
      #|33 basis elements and 62 critical pairs
      #|33 basis elements and 61 critical pairs
      #|33 basis elements and 60 critical pairs
      #|33 basis elements and 59 critical pairs
      #|33 basis elements and 58 critical pairs
      #|33 basis elements and 57 critical pairs
      #|33 basis elements and 56 critical pairs
      #|33 basis elements and 55 critical pairs
      #|33 basis elements and 54 critical pairs
      #|33 basis elements and 53 critical pairs
      #|33 basis elements and 52 critical pairs
      #|33 basis elements and 51 critical pairs
      #|33 basis elements and 50 critical pairs
      #|33 basis elements and 49 critical pairs
      #|33 basis elements and 48 critical pairs
      #|33 basis elements and 47 critical pairs
      #|33 basis elements and 46 critical pairs
      #|33 basis elements and 45 critical pairs
      #|33 basis elements and 44 critical pairs
      #|33 basis elements and 43 critical pairs
      #|33 basis elements and 42 critical pairs
      #|33 basis elements and 41 critical pairs
      #|33 basis elements and 40 critical pairs
      #|33 basis elements and 39 critical pairs
      #|34 basis elements and 45 critical pairs
      #|34 basis elements and 44 critical pairs
      #|34 basis elements and 43 critical pairs
      #|35 basis elements and 52 critical pairs
      #|36 basis elements and 61 critical pairs
      #|36 basis elements and 60 critical pairs
      #|36 basis elements and 59 critical pairs
      #|36 basis elements and 58 critical pairs
      #|36 basis elements and 57 critical pairs
      #|36 basis elements and 56 critical pairs
      #|36 basis elements and 55 critical pairs
      #|36 basis elements and 54 critical pairs
      #|36 basis elements and 53 critical pairs
      #|36 basis elements and 52 critical pairs
      #|36 basis elements and 51 critical pairs
      #|36 basis elements and 50 critical pairs
      #|36 basis elements and 49 critical pairs
      #|36 basis elements and 48 critical pairs
      #|36 basis elements and 47 critical pairs
      #|36 basis elements and 46 critical pairs
      #|36 basis elements and 45 critical pairs
      #|36 basis elements and 44 critical pairs
      #|36 basis elements and 43 critical pairs
      #|36 basis elements and 42 critical pairs
      #|36 basis elements and 41 critical pairs
      #|36 basis elements and 40 critical pairs
      #|36 basis elements and 39 critical pairs
      #|36 basis elements and 38 critical pairs
      #|36 basis elements and 37 critical pairs
      #|36 basis elements and 36 critical pairs
      #|36 basis elements and 35 critical pairs
      #|36 basis elements and 34 critical pairs
      #|36 basis elements and 33 critical pairs
      #|37 basis elements and 43 critical pairs
      #|37 basis elements and 42 critical pairs
      #|37 basis elements and 41 critical pairs
      #|37 basis elements and 40 critical pairs
      #|37 basis elements and 39 critical pairs
      #|37 basis elements and 38 critical pairs
      #|37 basis elements and 37 critical pairs
      #|37 basis elements and 36 critical pairs
      #|37 basis elements and 35 critical pairs
      #|37 basis elements and 34 critical pairs
      #|37 basis elements and 33 critical pairs
      #|37 basis elements and 32 critical pairs
      #|38 basis elements and 38 critical pairs
      #|38 basis elements and 37 critical pairs
      #|38 basis elements and 36 critical pairs
      #|38 basis elements and 35 critical pairs
      #|38 basis elements and 34 critical pairs
      #|38 basis elements and 33 critical pairs
      #|38 basis elements and 32 critical pairs
      #|38 basis elements and 31 critical pairs
      #|38 basis elements and 30 critical pairs
      #|38 basis elements and 29 critical pairs
      #|38 basis elements and 28 critical pairs
      #|38 basis elements and 27 critical pairs
      #|38 basis elements and 26 critical pairs
      #|38 basis elements and 25 critical pairs
      #|38 basis elements and 24 critical pairs
      #|38 basis elements and 23 critical pairs
      #|38 basis elements and 22 critical pairs
      #|38 basis elements and 21 critical pairs
      #|38 basis elements and 20 critical pairs
      #|38 basis elements and 19 critical pairs
      #|38 basis elements and 18 critical pairs
      #|38 basis elements and 17 critical pairs
      #|38 basis elements and 16 critical pairs
      #|38 basis elements and 15 critical pairs
      #|38 basis elements and 14 critical pairs
      #|38 basis elements and 13 critical pairs
      #|38 basis elements and 12 critical pairs
      #|38 basis elements and 11 critical pairs
      #|38 basis elements and 10 critical pairs
      #|38 basis elements and 9 critical pairs
      #|39 basis elements and 13 critical pairs
      #|39 basis elements and 12 critical pairs
      #|39 basis elements and 11 critical pairs
      #|39 basis elements and 10 critical pairs
      #|39 basis elements and 9 critical pairs
      #|39 basis elements and 8 critical pairs
      #|40 basis elements and 22 critical pairs
      #|40 basis elements and 21 critical pairs
      #|40 basis elements and 20 critical pairs
      #|40 basis elements and 19 critical pairs
      #|40 basis elements and 18 critical pairs
      #|40 basis elements and 17 critical pairs
      #|40 basis elements and 16 critical pairs
      #|40 basis elements and 15 critical pairs
      #|40 basis elements and 14 critical pairs
      #|40 basis elements and 13 critical pairs
      #|41 basis elements and 19 critical pairs
      #|41 basis elements and 18 critical pairs
      #|41 basis elements and 17 critical pairs
      #|41 basis elements and 16 critical pairs
      #|41 basis elements and 15 critical pairs
      #|41 basis elements and 14 critical pairs
      #|42 basis elements and 24 critical pairs
      #|42 basis elements and 23 critical pairs
      #|42 basis elements and 22 critical pairs
      #|42 basis elements and 21 critical pairs
      #|42 basis elements and 20 critical pairs
      #|42 basis elements and 19 critical pairs
      #|42 basis elements and 18 critical pairs
      #|42 basis elements and 17 critical pairs
      #|42 basis elements and 16 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|45 basis elements and 35 critical pairs
      #|45 basis elements and 34 critical pairs
      #|45 basis elements and 33 critical pairs
      #|45 basis elements and 32 critical pairs
      #|45 basis elements and 31 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|45 basis elements and 18 critical pairs
      #|45 basis elements and 17 critical pairs
      #|45 basis elements and 16 critical pairs
      #|45 basis elements and 15 critical pairs
      #|45 basis elements and 14 critical pairs
      #|45 basis elements and 13 critical pairs
      #|45 basis elements and 12 critical pairs
      #|45 basis elements and 11 critical pairs
      #|46 basis elements and 19 critical pairs
      #|46 basis elements and 18 critical pairs
      #|46 basis elements and 17 critical pairs
      #|46 basis elements and 16 critical pairs
      #|46 basis elements and 15 critical pairs
      #|46 basis elements and 14 critical pairs
      #|46 basis elements and 13 critical pairs
      #|46 basis elements and 12 critical pairs
      #|46 basis elements and 11 critical pairs
      #|46 basis elements and 10 critical pairs
      #|46 basis elements and 9 critical pairs
      #|46 basis elements and 8 critical pairs
      #|46 basis elements and 7 critical pairs
      #|46 basis elements and 6 critical pairs
      #|46 basis elements and 5 critical pairs
      #|46 basis elements and 4 critical pairs
      #|46 basis elements and 3 critical pairs
      #|46 basis elements and 2 critical pairs
      #|46 basis elements and 1 critical pairs
      #|46 basis elements and 0 critical pairs
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|14 basis elements and 15 critical pairs
      #|15 basis elements and 18 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 30 critical pairs
      #|18 basis elements and 34 critical pairs
      #|19 basis elements and 39 critical pairs
      #|20 basis elements and 45 critical pairs
      #|21 basis elements and 53 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|22 basis elements and 58 critical pairs
      #|22 basis elements and 57 critical pairs
      #|22 basis elements and 56 critical pairs
      #|22 basis elements and 55 critical pairs
      #|23 basis elements and 61 critical pairs
      #|23 basis elements and 60 critical pairs
      #|23 basis elements and 59 critical pairs
      #|23 basis elements and 58 critical pairs
      #|23 basis elements and 57 critical pairs
      #|23 basis elements and 56 critical pairs
      #|24 basis elements and 64 critical pairs
      #|25 basis elements and 72 critical pairs
      #|26 basis elements and 79 critical pairs
      #|26 basis elements and 78 critical pairs
      #|27 basis elements and 88 critical pairs
      #|27 basis elements and 87 critical pairs
      #|28 basis elements and 97 critical pairs
      #|28 basis elements and 96 critical pairs
      #|28 basis elements and 95 critical pairs
      #|28 basis elements and 94 critical pairs
      #|28 basis elements and 93 critical pairs
      #|28 basis elements and 92 critical pairs
      #|29 basis elements and 109 critical pairs
      #|30 basis elements and 118 critical pairs
      #|30 basis elements and 117 critical pairs
      #|31 basis elements and 135 critical pairs
      #|31 basis elements and 134 critical pairs
      #|31 basis elements and 133 critical pairs
      #|31 basis elements and 132 critical pairs
      #|31 basis elements and 131 critical pairs
      #|31 basis elements and 130 critical pairs
      #|31 basis elements and 129 critical pairs
      #|31 basis elements and 128 critical pairs
      #|31 basis elements and 127 critical pairs
      #|31 basis elements and 126 critical pairs
      #|31 basis elements and 125 critical pairs
      #|32 basis elements and 144 critical pairs
      #|33 basis elements and 164 critical pairs
      #|34 basis elements and 183 critical pairs
      #|35 basis elements and 201 critical pairs
      #|36 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 11 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|15 basis elements and 24 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|15 basis elements and 21 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|21 basis elements and 45 critical pairs
      #|22 basis elements and 50 critical pairs
      #|22 basis elements and 49 critical pairs
      #|22 basis elements and 48 critical pairs
      #|22 basis elements and 47 critical pairs
      #|22 basis elements and 46 critical pairs
      #|22 basis elements and 45 critical pairs
      #|22 basis elements and 44 critical pairs
      #|22 basis elements and 43 critical pairs
      #|22 basis elements and 42 critical pairs
      #|22 basis elements and 41 critical pairs
      #|22 basis elements and 40 critical pairs
      #|22 basis elements and 39 critical pairs
      #|22 basis elements and 38 critical pairs
      #|22 basis elements and 37 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|24 basis elements and 47 critical pairs
      #|24 basis elements and 46 critical pairs
      #|24 basis elements and 45 critical pairs
      #|24 basis elements and 44 critical pairs
      #|25 basis elements and 49 critical pairs
      #|26 basis elements and 58 critical pairs
      #|26 basis elements and 57 critical pairs
      #|26 basis elements and 56 critical pairs
      #|26 basis elements and 55 critical pairs
      #|26 basis elements and 54 critical pairs
      #|26 basis elements and 53 critical pairs
      #|26 basis elements and 52 critical pairs
      #|27 basis elements and 62 critical pairs
      #|27 basis elements and 61 critical pairs
      #|28 basis elements and 73 critical pairs
      #|28 basis elements and 72 critical pairs
      #|28 basis elements and 71 critical pairs
      #|28 basis elements and 70 critical pairs
      #|28 basis elements and 69 critical pairs
      #|29 basis elements and 80 critical pairs
      #|29 basis elements and 79 critical pairs
      #|29 basis elements and 78 critical pairs
      #|29 basis elements and 77 critical pairs
      #|29 basis elements and 76 critical pairs
      #|29 basis elements and 75 critical pairs
      #|29 basis elements and 74 critical pairs
      #|29 basis elements and 73 critical pairs
      #|29 basis elements and 72 critical pairs
      #|30 basis elements and 85 critical pairs
      #|30 basis elements and 84 critical pairs
      #|30 basis elements and 83 critical pairs
      #|30 basis elements and 82 critical pairs
      #|30 basis elements and 81 critical pairs
      #|30 basis elements and 80 critical pairs
      #|30 basis elements and 79 critical pairs
      #|30 basis elements and 78 critical pairs
      #|30 basis elements and 77 critical pairs
      #|30 basis elements and 76 critical pairs
      #|30 basis elements and 75 critical pairs
      #|30 basis elements and 74 critical pairs
      #|30 basis elements and 73 critical pairs
      #|30 basis elements and 72 critical pairs
      #|30 basis elements and 71 critical pairs
      #|31 basis elements and 79 critical pairs
      #|31 basis elements and 78 critical pairs
      #|31 basis elements and 77 critical pairs
      #|31 basis elements and 76 critical pairs
      #|31 basis elements and 75 critical pairs
      #|31 basis elements and 74 critical pairs
      #|31 basis elements and 73 critical pairs
      #|31 basis elements and 72 critical pairs
      #|31 basis elements and 71 critical pairs
      #|31 basis elements and 70 critical pairs
      #|31 basis elements and 69 critical pairs
      #|31 basis elements and 68 critical pairs
      #|31 basis elements and 67 critical pairs
      #|31 basis elements and 66 critical pairs
      #|31 basis elements and 65 critical pairs
      #|31 basis elements and 64 critical pairs
      #|31 basis elements and 63 critical pairs
      #|31 basis elements and 62 critical pairs
      #|31 basis elements and 61 critical pairs
      #|32 basis elements and 70 critical pairs
      #|32 basis elements and 69 critical pairs
      #|32 basis elements and 68 critical pairs
      #|32 basis elements and 67 critical pairs
      #|32 basis elements and 66 critical pairs
      #|32 basis elements and 65 critical pairs
      #|32 basis elements and 64 critical pairs
      #|32 basis elements and 63 critical pairs
      #|33 basis elements and 70 critical pairs
      #|33 basis elements and 69 critical pairs
      #|33 basis elements and 68 critical pairs
      #|33 basis elements and 67 critical pairs
      #|33 basis elements and 66 critical pairs
      #|33 basis elements and 65 critical pairs
      #|33 basis elements and 64 critical pairs
      #|33 basis elements and 63 critical pairs
      #|33 basis elements and 62 critical pairs
      #|33 basis elements and 61 critical pairs
      #|33 basis elements and 60 critical pairs
      #|33 basis elements and 59 critical pairs
      #|33 basis elements and 58 critical pairs
      #|33 basis elements and 57 critical pairs
      #|33 basis elements and 56 critical pairs
      #|33 basis elements and 55 critical pairs
      #|33 basis elements and 54 critical pairs
      #|33 basis elements and 53 critical pairs
      #|33 basis elements and 52 critical pairs
      #|33 basis elements and 51 critical pairs
      #|33 basis elements and 50 critical pairs
      #|33 basis elements and 49 critical pairs
      #|33 basis elements and 48 critical pairs
      #|33 basis elements and 47 critical pairs
      #|33 basis elements and 46 critical pairs
      #|33 basis elements and 45 critical pairs
      #|33 basis elements and 44 critical pairs
      #|33 basis elements and 43 critical pairs
      #|33 basis elements and 42 critical pairs
      #|33 basis elements and 41 critical pairs
      #|33 basis elements and 40 critical pairs
      #|33 basis elements and 39 critical pairs
      #|34 basis elements and 45 critical pairs
      #|34 basis elements and 44 critical pairs
      #|34 basis elements and 43 critical pairs
      #|35 basis elements and 52 critical pairs
      #|36 basis elements and 61 critical pairs
      #|36 basis elements and 60 critical pairs
      #|36 basis elements and 59 critical pairs
      #|36 basis elements and 58 critical pairs
      #|36 basis elements and 57 critical pairs
      #|36 basis elements and 56 critical pairs
      #|36 basis elements and 55 critical pairs
      #|36 basis elements and 54 critical pairs
      #|36 basis elements and 53 critical pairs
      #|36 basis elements and 52 critical pairs
      #|36 basis elements and 51 critical pairs
      #|36 basis elements and 50 critical pairs
      #|36 basis elements and 49 critical pairs
      #|36 basis elements and 48 critical pairs
      #|36 basis elements and 47 critical pairs
      #|36 basis elements and 46 critical pairs
      #|36 basis elements and 45 critical pairs
      #|36 basis elements and 44 critical pairs
      #|36 basis elements and 43 critical pairs
      #|36 basis elements and 42 critical pairs
      #|36 basis elements and 41 critical pairs
      #|36 basis elements and 40 critical pairs
      #|36 basis elements and 39 critical pairs
      #|36 basis elements and 38 critical pairs
      #|36 basis elements and 37 critical pairs
      #|36 basis elements and 36 critical pairs
      #|36 basis elements and 35 critical pairs
      #|36 basis elements and 34 critical pairs
      #|36 basis elements and 33 critical pairs
      #|37 basis elements and 43 critical pairs
      #|37 basis elements and 42 critical pairs
      #|37 basis elements and 41 critical pairs
      #|37 basis elements and 40 critical pairs
      #|37 basis elements and 39 critical pairs
      #|37 basis elements and 38 critical pairs
      #|37 basis elements and 37 critical pairs
      #|37 basis elements and 36 critical pairs
      #|37 basis elements and 35 critical pairs
      #|37 basis elements and 34 critical pairs
      #|37 basis elements and 33 critical pairs
      #|37 basis elements and 32 critical pairs
      #|38 basis elements and 38 critical pairs
      #|38 basis elements and 37 critical pairs
      #|38 basis elements and 36 critical pairs
      #|38 basis elements and 35 critical pairs
      #|38 basis elements and 34 critical pairs
      #|38 basis elements and 33 critical pairs
      #|38 basis elements and 32 critical pairs
      #|38 basis elements and 31 critical pairs
      #|38 basis elements and 30 critical pairs
      #|38 basis elements and 29 critical pairs
      #|38 basis elements and 28 critical pairs
      #|38 basis elements and 27 critical pairs
      #|38 basis elements and 26 critical pairs
      #|38 basis elements and 25 critical pairs
      #|38 basis elements and 24 critical pairs
      #|38 basis elements and 23 critical pairs
      #|38 basis elements and 22 critical pairs
      #|38 basis elements and 21 critical pairs
      #|38 basis elements and 20 critical pairs
      #|38 basis elements and 19 critical pairs
      #|38 basis elements and 18 critical pairs
      #|38 basis elements and 17 critical pairs
      #|38 basis elements and 16 critical pairs
      #|38 basis elements and 15 critical pairs
      #|38 basis elements and 14 critical pairs
      #|38 basis elements and 13 critical pairs
      #|38 basis elements and 12 critical pairs
      #|38 basis elements and 11 critical pairs
      #|38 basis elements and 10 critical pairs
      #|38 basis elements and 9 critical pairs
      #|39 basis elements and 13 critical pairs
      #|39 basis elements and 12 critical pairs
      #|39 basis elements and 11 critical pairs
      #|39 basis elements and 10 critical pairs
      #|39 basis elements and 9 critical pairs
      #|39 basis elements and 8 critical pairs
      #|40 basis elements and 22 critical pairs
      #|40 basis elements and 21 critical pairs
      #|40 basis elements and 20 critical pairs
      #|40 basis elements and 19 critical pairs
      #|40 basis elements and 18 critical pairs
      #|40 basis elements and 17 critical pairs
      #|40 basis elements and 16 critical pairs
      #|40 basis elements and 15 critical pairs
      #|40 basis elements and 14 critical pairs
      #|40 basis elements and 13 critical pairs
      #|41 basis elements and 19 critical pairs
      #|41 basis elements and 18 critical pairs
      #|41 basis elements and 17 critical pairs
      #|41 basis elements and 16 critical pairs
      #|41 basis elements and 15 critical pairs
      #|41 basis elements and 14 critical pairs
      #|42 basis elements and 24 critical pairs
      #|42 basis elements and 23 critical pairs
      #|42 basis elements and 22 critical pairs
      #|42 basis elements and 21 critical pairs
      #|42 basis elements and 20 critical pairs
      #|42 basis elements and 19 critical pairs
      #|42 basis elements and 18 critical pairs
      #|42 basis elements and 17 critical pairs
      #|42 basis elements and 16 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|45 basis elements and 35 critical pairs
      #|45 basis elements and 34 critical pairs
      #|45 basis elements and 33 critical pairs
      #|45 basis elements and 32 critical pairs
      #|45 basis elements and 31 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|45 basis elements and 18 critical pairs
      #|45 basis elements and 17 critical pairs
      #|45 basis elements and 16 critical pairs
      #|45 basis elements and 15 critical pairs
      #|45 basis elements and 14 critical pairs
      #|45 basis elements and 13 critical pairs
      #|45 basis elements and 12 critical pairs
      #|45 basis elements and 11 critical pairs
      #|46 basis elements and 19 critical pairs
      #|46 basis elements and 18 critical pairs
      #|46 basis elements and 17 critical pairs
      #|46 basis elements and 16 critical pairs
      #|46 basis elements and 15 critical pairs
      #|46 basis elements and 14 critical pairs
      #|46 basis elements and 13 critical pairs
      #|46 basis elements and 12 critical pairs
      #|46 basis elements and 11 critical pairs
      #|46 basis elements and 10 critical pairs
      #|46 basis elements and 9 critical pairs
      #|46 basis elements and 8 critical pairs
      #|46 basis elements and 7 critical pairs
      #|46 basis elements and 6 critical pairs
      #|46 basis elements and 5 critical pairs
      #|46 basis elements and 4 critical pairs
      #|46 basis elements and 3 critical pairs
      #|46 basis elements and 2 critical pairs
      #|46 basis elements and 1 critical pairs
      #|46 basis elements and 0 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|14 basis elements and 15 critical pairs
      #|15 basis elements and 19 critical pairs
      #|16 basis elements and 26 critical pairs
      #|17 basis elements and 33 critical pairs
      #|18 basis elements and 37 critical pairs
      #|19 basis elements and 43 critical pairs
      #|20 basis elements and 50 critical pairs
      #|21 basis elements and 58 critical pairs
      #|22 basis elements and 65 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|23 basis elements and 67 critical pairs
      #|24 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 9 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|15 basis elements and 10 critical pairs
      #|16 basis elements and 12 critical pairs
      #|17 basis elements and 17 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 17 critical pairs
      #|18 basis elements and 16 critical pairs
      #|18 basis elements and 15 critical pairs
      #|19 basis elements and 21 critical pairs
      #|19 basis elements and 20 critical pairs
      #|19 basis elements and 19 critical pairs
      #|19 basis elements and 18 critical pairs
      #|19 basis elements and 17 critical pairs
      #|19 basis elements and 16 critical pairs
      #|19 basis elements and 15 critical pairs
      #|19 basis elements and 14 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|22 basis elements and 32 critical pairs
      #|22 basis elements and 31 critical pairs
      #|22 basis elements and 30 critical pairs
      #|22 basis elements and 29 critical pairs
      #|22 basis elements and 28 critical pairs
      #|22 basis elements and 27 critical pairs
      #|22 basis elements and 26 critical pairs
      #|22 basis elements and 25 critical pairs
      #|22 basis elements and 24 critical pairs
      #|22 basis elements and 23 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|23 basis elements and 26 critical pairs
      #|23 basis elements and 25 critical pairs
      #|23 basis elements and 24 critical pairs
      #|23 basis elements and 23 critical pairs
      #|23 basis elements and 22 critical pairs
      #|23 basis elements and 21 critical pairs
      #|23 basis elements and 20 critical pairs
      #|23 basis elements and 19 critical pairs
      #|23 basis elements and 18 critical pairs
      #|24 basis elements and 22 critical pairs
      #|24 basis elements and 21 critical pairs
      #|24 basis elements and 20 critical pairs
      #|24 basis elements and 19 critical pairs
      #|24 basis elements and 18 critical pairs
      #|24 basis elements and 17 critical pairs
      #|24 basis elements and 16 critical pairs
      #|24 basis elements and 15 critical pairs
      #|24 basis elements and 14 critical pairs
      #|24 basis elements and 13 critical pairs
      #|24 basis elements and 12 critical pairs
      #|24 basis elements and 11 critical pairs
      #|24 basis elements and 10 critical pairs
      #|24 basis elements and 9 critical pairs
      #|24 basis elements and 8 critical pairs
      #|25 basis elements and 12 critical pairs
      #|25 basis elements and 11 critical pairs
      #|25 basis elements and 10 critical pairs
      #|25 basis elements and 9 critical pairs
      #|25 basis elements and 8 critical pairs
      #|25 basis elements and 7 critical pairs
      #|25 basis elements and 6 critical pairs
      #|26 basis elements and 17 critical pairs
      #|26 basis elements and 16 critical pairs
      #|26 basis elements and 15 critical pairs
      #|26 basis elements and 14 critical pairs
      #|26 basis elements and 13 critical pairs
      #|26 basis elements and 12 critical pairs
      #|26 basis elements and 11 critical pairs
      #|26 basis elements and 10 critical pairs
      #|26 basis elements and 9 critical pairs
      #|26 basis elements and 8 critical pairs
      #|27 basis elements and 14 critical pairs
      #|27 basis elements and 13 critical pairs
      #|27 basis elements and 12 critical pairs
      #|27 basis elements and 11 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|28 basis elements and 16 critical pairs
      #|28 basis elements and 15 critical pairs
      #|28 basis elements and 14 critical pairs
      #|28 basis elements and 13 critical pairs
      #|28 basis elements and 12 critical pairs
      #|28 basis elements and 11 critical pairs
      #|29 basis elements and 17 critical pairs
      #|29 basis elements and 16 critical pairs
      #|29 basis elements and 15 critical pairs
      #|29 basis elements and 14 critical pairs
      #|30 basis elements and 22 critical pairs
      #|30 basis elements and 21 critical pairs
      #|30 basis elements and 20 critical pairs
      #|30 basis elements and 19 critical pairs
      #|30 basis elements and 18 critical pairs
      #|30 basis elements and 17 critical pairs
      #|30 basis elements and 16 critical pairs
      #|31 basis elements and 28 critical pairs
      #|31 basis elements and 27 critical pairs
      #|31 basis elements and 26 critical pairs
      #|31 basis elements and 25 critical pairs
      #|31 basis elements and 24 critical pairs
      #|31 basis elements and 23 critical pairs
      #|31 basis elements and 22 critical pairs
      #|31 basis elements and 21 critical pairs
      #|31 basis elements and 20 critical pairs
      #|31 basis elements and 19 critical pairs
      #|31 basis elements and 18 critical pairs
      #|31 basis elements and 17 critical pairs
      #|31 basis elements and 16 critical pairs
      #|31 basis elements and 15 critical pairs
      #|31 basis elements and 14 critical pairs
      #|31 basis elements and 13 critical pairs
      #|31 basis elements and 12 critical pairs
      #|31 basis elements and 11 critical pairs
      #|31 basis elements and 10 critical pairs
      #|31 basis elements and 9 critical pairs
      #|31 basis elements and 8 critical pairs
      #|31 basis elements and 7 critical pairs
      #|32 basis elements and 15 critical pairs
      #|32 basis elements and 14 critical pairs
      #|32 basis elements and 13 critical pairs
      #|32 basis elements and 12 critical pairs
      #|32 basis elements and 11 critical pairs
      #|32 basis elements and 10 critical pairs
      #|32 basis elements and 9 critical pairs
      #|32 basis elements and 8 critical pairs
      #|32 basis elements and 7 critical pairs
      #|32 basis elements and 6 critical pairs
      #|32 basis elements and 5 critical pairs
      #|32 basis elements and 4 critical pairs
      #|32 basis elements and 3 critical pairs
      #|32 basis elements and 2 critical pairs
      #|32 basis elements and 1 critical pairs
      #|32 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 39 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|21 basis elements and 49 critical pairs
      #|21 basis elements and 48 critical pairs
      #|22 basis elements and 57 critical pairs
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
      #|24 basis elements and 60 critical pairs
      #|24 basis elements and 59 critical pairs
      #|24 basis elements and 58 critical pairs
      #|25 basis elements and 66 critical pairs
      #|25 basis elements and 65 critical pairs
      #|25 basis elements and 64 critical pairs
      #|25 basis elements and 63 critical pairs
      #|26 basis elements and 74 critical pairs
      #|26 basis elements and 73 critical pairs
      #|26 basis elements and 72 critical pairs
      #|26 basis elements and 71 critical pairs
      #|27 basis elements and 80 critical pairs
      #|28 basis elements and 90 critical pairs
      #|28 basis elements and 89 critical pairs
      #|28 basis elements and 88 critical pairs
      #|28 basis elements and 87 critical pairs
      #|28 basis elements and 86 critical pairs
      #|28 basis elements and 85 critical pairs
      #|28 basis elements and 84 critical pairs
      #|29 basis elements and 99 critical pairs
      #|29 basis elements and 98 critical pairs
      #|29 basis elements and 97 critical pairs
      #|30 basis elements and 107 critical pairs
      #|30 basis elements and 106 critical pairs
      #|30 basis elements and 105 critical pairs
      #|30 basis elements and 104 critical pairs
      #|31 basis elements and 116 critical pairs
      #|31 basis elements and 115 critical pairs
      #|31 basis elements and 114 critical pairs
      #|31 basis elements and 113 critical pairs
      #|31 basis elements and 112 critical pairs
      #|31 basis elements and 111 critical pairs
      #|31 basis elements and 110 critical pairs
      #|31 basis elements and 109 critical pairs
      #|31 basis elements and 108 critical pairs
      #|31 basis elements and 107 critical pairs
      #|32 basis elements and 119 critical pairs
      #|32 basis elements and 118 critical pairs
      #|32 basis elements and 117 critical pairs
      #|32 basis elements and 116 critical pairs
      #|32 basis elements and 115 critical pairs
      #|32 basis elements and 114 critical pairs
      #|32 basis elements and 113 critical pairs
      #|32 basis elements and 112 critical pairs
      #|32 basis elements and 111 critical pairs
      #|32 basis elements and 110 critical pairs
      #|32 basis elements and 109 critical pairs
      #|32 basis elements and 108 critical pairs
      #|32 basis elements and 107 critical pairs
      #|32 basis elements and 106 critical pairs
      #|32 basis elements and 105 critical pairs
      #|32 basis elements and 104 critical pairs
      #|32 basis elements and 103 critical pairs
      #|33 basis elements and 111 critical pairs
      #|33 basis elements and 110 critical pairs
      #|33 basis elements and 109 critical pairs
      #|33 basis elements and 108 critical pairs
      #|33 basis elements and 107 critical pairs
      #|33 basis elements and 106 critical pairs
      #|34 basis elements and 117 critical pairs
      #|34 basis elements and 116 critical pairs
      #|34 basis elements and 115 critical pairs
      #|34 basis elements and 114 critical pairs
      #|34 basis elements and 113 critical pairs
      #|34 basis elements and 112 critical pairs
      #|34 basis elements and 111 critical pairs
      #|34 basis elements and 110 critical pairs
      #|34 basis elements and 109 critical pairs
      #|34 basis elements and 108 critical pairs
      #|35 basis elements and 114 critical pairs
      #|36 basis elements and 120 critical pairs
      #|37 basis elements and 126 critical pairs
      #|38 basis elements and 132 critical pairs
      #|38 basis elements and 131 critical pairs
      #|38 basis elements and 130 critical pairs
      #|38 basis elements and 129 critical pairs
      #|38 basis elements and 128 critical pairs
      #|38 basis elements and 127 critical pairs
      #|38 basis elements and 126 critical pairs
      #|38 basis elements and 125 critical pairs
      #|38 basis elements and 124 critical pairs
      #|38 basis elements and 123 critical pairs
      #|38 basis elements and 122 critical pairs
      #|38 basis elements and 121 critical pairs
      #|38 basis elements and 120 critical pairs
      #|38 basis elements and 119 critical pairs
      #|38 basis elements and 118 critical pairs
      #|38 basis elements and 117 critical pairs
      #|38 basis elements and 116 critical pairs
      #|38 basis elements and 115 critical pairs
      #|38 basis elements and 114 critical pairs
      #|38 basis elements and 113 critical pairs
      #|38 basis elements and 112 critical pairs
      #|38 basis elements and 111 critical pairs
      #|38 basis elements and 110 critical pairs
      #|38 basis elements and 109 critical pairs
      #|38 basis elements and 108 critical pairs
      #|38 basis elements and 107 critical pairs
      #|38 basis elements and 106 critical pairs
      #|38 basis elements and 105 critical pairs
      #|38 basis elements and 104 critical pairs
      #|39 basis elements and 111 critical pairs
      #|39 basis elements and 110 critical pairs
      #|39 basis elements and 109 critical pairs
      #|39 basis elements and 108 critical pairs
      #|39 basis elements and 107 critical pairs
      #|39 basis elements and 106 critical pairs
      #|39 basis elements and 105 critical pairs
      #|39 basis elements and 104 critical pairs
      #|39 basis elements and 103 critical pairs
      #|39 basis elements and 102 critical pairs
      #|39 basis elements and 101 critical pairs
      #|39 basis elements and 100 critical pairs
      #|39 basis elements and 99 critical pairs
      #|39 basis elements and 98 critical pairs
      #|39 basis elements and 97 critical pairs
      #|39 basis elements and 96 critical pairs
      #|39 basis elements and 95 critical pairs
      #|39 basis elements and 94 critical pairs
      #|39 basis elements and 93 critical pairs
      #|39 basis elements and 92 critical pairs
      #|39 basis elements and 91 critical pairs
      #|39 basis elements and 90 critical pairs
      #|39 basis elements and 89 critical pairs
      #|40 basis elements and 99 critical pairs
      #|40 basis elements and 98 critical pairs
      #|41 basis elements and 109 critical pairs
      #|41 basis elements and 108 critical pairs
      #|41 basis elements and 107 critical pairs
      #|41 basis elements and 106 critical pairs
      #|41 basis elements and 105 critical pairs
      #|41 basis elements and 104 critical pairs
      #|41 basis elements and 103 critical pairs
      #|41 basis elements and 102 critical pairs
      #|41 basis elements and 101 critical pairs
      #|41 basis elements and 100 critical pairs
      #|41 basis elements and 99 critical pairs
      #|41 basis elements and 98 critical pairs
      #|41 basis elements and 97 critical pairs
      #|41 basis elements and 96 critical pairs
      #|41 basis elements and 95 critical pairs
      #|41 basis elements and 94 critical pairs
      #|41 basis elements and 93 critical pairs
      #|41 basis elements and 92 critical pairs
      #|41 basis elements and 91 critical pairs
      #|41 basis elements and 90 critical pairs
      #|41 basis elements and 89 critical pairs
      #|41 basis elements and 88 critical pairs
      #|41 basis elements and 87 critical pairs
      #|41 basis elements and 86 critical pairs
      #|41 basis elements and 85 critical pairs
      #|41 basis elements and 84 critical pairs
      #|41 basis elements and 83 critical pairs
      #|41 basis elements and 82 critical pairs
      #|41 basis elements and 81 critical pairs
      #|41 basis elements and 80 critical pairs
      #|41 basis elements and 79 critical pairs
      #|41 basis elements and 78 critical pairs
      #|41 basis elements and 77 critical pairs
      #|41 basis elements and 76 critical pairs
      #|41 basis elements and 75 critical pairs
      #|41 basis elements and 74 critical pairs
      #|41 basis elements and 73 critical pairs
      #|41 basis elements and 72 critical pairs
      #|41 basis elements and 71 critical pairs
      #|41 basis elements and 70 critical pairs
      #|41 basis elements and 69 critical pairs
      #|41 basis elements and 68 critical pairs
      #|41 basis elements and 67 critical pairs
      #|41 basis elements and 66 critical pairs
      #|41 basis elements and 65 critical pairs
      #|41 basis elements and 64 critical pairs
      #|41 basis elements and 63 critical pairs
      #|41 basis elements and 62 critical pairs
      #|41 basis elements and 61 critical pairs
      #|41 basis elements and 60 critical pairs
      #|41 basis elements and 59 critical pairs
      #|41 basis elements and 58 critical pairs
      #|41 basis elements and 57 critical pairs
      #|41 basis elements and 56 critical pairs
      #|41 basis elements and 55 critical pairs
      #|41 basis elements and 54 critical pairs
      #|41 basis elements and 53 critical pairs
      #|41 basis elements and 52 critical pairs
      #|41 basis elements and 51 critical pairs
      #|41 basis elements and 50 critical pairs
      #|41 basis elements and 49 critical pairs
      #|41 basis elements and 48 critical pairs
      #|42 basis elements and 59 critical pairs
      #|42 basis elements and 58 critical pairs
      #|42 basis elements and 57 critical pairs
      #|42 basis elements and 56 critical pairs
      #|42 basis elements and 55 critical pairs
      #|42 basis elements and 54 critical pairs
      #|42 basis elements and 53 critical pairs
      #|42 basis elements and 52 critical pairs
      #|42 basis elements and 51 critical pairs
      #|42 basis elements and 50 critical pairs
      #|42 basis elements and 49 critical pairs
      #|42 basis elements and 48 critical pairs
      #|42 basis elements and 47 critical pairs
      #|42 basis elements and 46 critical pairs
      #|42 basis elements and 45 critical pairs
      #|42 basis elements and 44 critical pairs
      #|42 basis elements and 43 critical pairs
      #|43 basis elements and 50 critical pairs
      #|43 basis elements and 49 critical pairs
      #|43 basis elements and 48 critical pairs
      #|43 basis elements and 47 critical pairs
      #|43 basis elements and 46 critical pairs
      #|43 basis elements and 45 critical pairs
      #|43 basis elements and 44 critical pairs
      #|43 basis elements and 43 critical pairs
      #|43 basis elements and 42 critical pairs
      #|43 basis elements and 41 critical pairs
      #|43 basis elements and 40 critical pairs
      #|43 basis elements and 39 critical pairs
      #|43 basis elements and 38 critical pairs
      #|43 basis elements and 37 critical pairs
      #|43 basis elements and 36 critical pairs
      #|43 basis elements and 35 critical pairs
      #|43 basis elements and 34 critical pairs
      #|43 basis elements and 33 critical pairs
      #|43 basis elements and 32 critical pairs
      #|43 basis elements and 31 critical pairs
      #|43 basis elements and 30 critical pairs
      #|43 basis elements and 29 critical pairs
      #|43 basis elements and 28 critical pairs
      #|43 basis elements and 27 critical pairs
      #|43 basis elements and 26 critical pairs
      #|43 basis elements and 25 critical pairs
      #|43 basis elements and 24 critical pairs
      #|43 basis elements and 23 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|46 basis elements and 27 critical pairs
      #|46 basis elements and 26 critical pairs
      #|46 basis elements and 25 critical pairs
      #|46 basis elements and 24 critical pairs
      #|47 basis elements and 35 critical pairs
      #|47 basis elements and 34 critical pairs
      #|47 basis elements and 33 critical pairs
      #|47 basis elements and 32 critical pairs
      #|47 basis elements and 31 critical pairs
      #|47 basis elements and 30 critical pairs
      #|47 basis elements and 29 critical pairs
      #|47 basis elements and 28 critical pairs
      #|47 basis elements and 27 critical pairs
      #|47 basis elements and 26 critical pairs
      #|47 basis elements and 25 critical pairs
      #|48 basis elements and 33 critical pairs
      #|48 basis elements and 32 critical pairs
      #|48 basis elements and 31 critical pairs
      #|48 basis elements and 30 critical pairs
      #|49 basis elements and 42 critical pairs
      #|49 basis elements and 41 critical pairs
      #|49 basis elements and 40 critical pairs
      #|49 basis elements and 39 critical pairs
      #|49 basis elements and 38 critical pairs
      #|49 basis elements and 37 critical pairs
      #|49 basis elements and 36 critical pairs
      #|49 basis elements and 35 critical pairs
      #|49 basis elements and 34 critical pairs
      #|50 basis elements and 52 critical pairs
      #|50 basis elements and 51 critical pairs
      #|50 basis elements and 50 critical pairs
      #|50 basis elements and 49 critical pairs
      #|50 basis elements and 48 critical pairs
      #|50 basis elements and 47 critical pairs
      #|50 basis elements and 46 critical pairs
      #|50 basis elements and 45 critical pairs
      #|50 basis elements and 44 critical pairs
      #|50 basis elements and 43 critical pairs
      #|50 basis elements and 42 critical pairs
      #|50 basis elements and 41 critical pairs
      #|50 basis elements and 40 critical pairs
      #|50 basis elements and 39 critical pairs
      #|50 basis elements and 38 critical pairs
      #|50 basis elements and 37 critical pairs
      #|50 basis elements and 36 critical pairs
      #|50 basis elements and 35 critical pairs
      #|50 basis elements and 34 critical pairs
      #|50 basis elements and 33 critical pairs
      #|50 basis elements and 32 critical pairs
      #|50 basis elements and 31 critical pairs
      #|50 basis elements and 30 critical pairs
      #|50 basis elements and 29 critical pairs
      #|50 basis elements and 28 critical pairs
      #|50 basis elements and 27 critical pairs
      #|50 basis elements and 26 critical pairs
      #|50 basis elements and 25 critical pairs
      #|50 basis elements and 24 critical pairs
      #|50 basis elements and 23 critical pairs
      #|50 basis elements and 22 critical pairs
      #|50 basis elements and 21 critical pairs
      #|50 basis elements and 20 critical pairs
      #|50 basis elements and 19 critical pairs
      #|50 basis elements and 18 critical pairs
      #|50 basis elements and 17 critical pairs
      #|50 basis elements and 16 critical pairs
      #|50 basis elements and 15 critical pairs
      #|51 basis elements and 27 critical pairs
      #|51 basis elements and 26 critical pairs
      #|51 basis elements and 25 critical pairs
      #|51 basis elements and 24 critical pairs
      #|51 basis elements and 23 critical pairs
      #|51 basis elements and 22 critical pairs
      #|51 basis elements and 21 critical pairs
      #|51 basis elements and 20 critical pairs
      #|51 basis elements and 19 critical pairs
      #|51 basis elements and 18 critical pairs
      #|51 basis elements and 17 critical pairs
      #|51 basis elements and 16 critical pairs
      #|51 basis elements and 15 critical pairs
      #|51 basis elements and 14 critical pairs
      #|51 basis elements and 13 critical pairs
      #|51 basis elements and 12 critical pairs
      #|51 basis elements and 11 critical pairs
      #|51 basis elements and 10 critical pairs
      #|51 basis elements and 9 critical pairs
      #|51 basis elements and 8 critical pairs
      #|51 basis elements and 7 critical pairs
      #|51 basis elements and 6 critical pairs
      #|51 basis elements and 5 critical pairs
      #|51 basis elements and 4 critical pairs
      #|51 basis elements and 3 critical pairs
      #|51 basis elements and 2 critical pairs
      #|51 basis elements and 1 critical pairs
      #|51 basis elements and 0 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 13 critical pairs
      #|15 basis elements and 16 critical pairs
      #|16 basis elements and 21 critical pairs
      #|17 basis elements and 26 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 43 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|20 basis elements and 40 critical pairs
      #|20 basis elements and 39 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|21 basis elements and 42 critical pairs
      #|22 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 39 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|21 basis elements and 49 critical pairs
      #|21 basis elements and 48 critical pairs
      #|22 basis elements and 57 critical pairs
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
      #|24 basis elements and 60 critical pairs
      #|24 basis elements and 59 critical pairs
      #|24 basis elements and 58 critical pairs
      #|25 basis elements and 66 critical pairs
      #|25 basis elements and 65 critical pairs
      #|25 basis elements and 64 critical pairs
      #|25 basis elements and 63 critical pairs
      #|26 basis elements and 74 critical pairs
      #|26 basis elements and 73 critical pairs
      #|26 basis elements and 72 critical pairs
      #|26 basis elements and 71 critical pairs
      #|27 basis elements and 80 critical pairs
      #|28 basis elements and 90 critical pairs
      #|28 basis elements and 89 critical pairs
      #|28 basis elements and 88 critical pairs
      #|28 basis elements and 87 critical pairs
      #|28 basis elements and 86 critical pairs
      #|28 basis elements and 85 critical pairs
      #|28 basis elements and 84 critical pairs
      #|29 basis elements and 99 critical pairs
      #|29 basis elements and 98 critical pairs
      #|29 basis elements and 97 critical pairs
      #|30 basis elements and 107 critical pairs
      #|30 basis elements and 106 critical pairs
      #|30 basis elements and 105 critical pairs
      #|30 basis elements and 104 critical pairs
      #|31 basis elements and 116 critical pairs
      #|31 basis elements and 115 critical pairs
      #|31 basis elements and 114 critical pairs
      #|31 basis elements and 113 critical pairs
      #|31 basis elements and 112 critical pairs
      #|31 basis elements and 111 critical pairs
      #|31 basis elements and 110 critical pairs
      #|31 basis elements and 109 critical pairs
      #|31 basis elements and 108 critical pairs
      #|31 basis elements and 107 critical pairs
      #|32 basis elements and 119 critical pairs
      #|32 basis elements and 118 critical pairs
      #|32 basis elements and 117 critical pairs
      #|32 basis elements and 116 critical pairs
      #|32 basis elements and 115 critical pairs
      #|32 basis elements and 114 critical pairs
      #|32 basis elements and 113 critical pairs
      #|32 basis elements and 112 critical pairs
      #|32 basis elements and 111 critical pairs
      #|32 basis elements and 110 critical pairs
      #|32 basis elements and 109 critical pairs
      #|32 basis elements and 108 critical pairs
      #|32 basis elements and 107 critical pairs
      #|32 basis elements and 106 critical pairs
      #|32 basis elements and 105 critical pairs
      #|32 basis elements and 104 critical pairs
      #|32 basis elements and 103 critical pairs
      #|33 basis elements and 111 critical pairs
      #|33 basis elements and 110 critical pairs
      #|33 basis elements and 109 critical pairs
      #|33 basis elements and 108 critical pairs
      #|33 basis elements and 107 critical pairs
      #|33 basis elements and 106 critical pairs
      #|34 basis elements and 117 critical pairs
      #|34 basis elements and 116 critical pairs
      #|34 basis elements and 115 critical pairs
      #|34 basis elements and 114 critical pairs
      #|34 basis elements and 113 critical pairs
      #|34 basis elements and 112 critical pairs
      #|34 basis elements and 111 critical pairs
      #|34 basis elements and 110 critical pairs
      #|34 basis elements and 109 critical pairs
      #|34 basis elements and 108 critical pairs
      #|35 basis elements and 114 critical pairs
      #|36 basis elements and 120 critical pairs
      #|37 basis elements and 126 critical pairs
      #|38 basis elements and 132 critical pairs
      #|38 basis elements and 131 critical pairs
      #|38 basis elements and 130 critical pairs
      #|38 basis elements and 129 critical pairs
      #|38 basis elements and 128 critical pairs
      #|38 basis elements and 127 critical pairs
      #|38 basis elements and 126 critical pairs
      #|38 basis elements and 125 critical pairs
      #|38 basis elements and 124 critical pairs
      #|38 basis elements and 123 critical pairs
      #|38 basis elements and 122 critical pairs
      #|38 basis elements and 121 critical pairs
      #|38 basis elements and 120 critical pairs
      #|38 basis elements and 119 critical pairs
      #|38 basis elements and 118 critical pairs
      #|38 basis elements and 117 critical pairs
      #|38 basis elements and 116 critical pairs
      #|38 basis elements and 115 critical pairs
      #|38 basis elements and 114 critical pairs
      #|38 basis elements and 113 critical pairs
      #|38 basis elements and 112 critical pairs
      #|38 basis elements and 111 critical pairs
      #|38 basis elements and 110 critical pairs
      #|38 basis elements and 109 critical pairs
      #|38 basis elements and 108 critical pairs
      #|38 basis elements and 107 critical pairs
      #|38 basis elements and 106 critical pairs
      #|38 basis elements and 105 critical pairs
      #|38 basis elements and 104 critical pairs
      #|39 basis elements and 111 critical pairs
      #|39 basis elements and 110 critical pairs
      #|39 basis elements and 109 critical pairs
      #|39 basis elements and 108 critical pairs
      #|39 basis elements and 107 critical pairs
      #|39 basis elements and 106 critical pairs
      #|39 basis elements and 105 critical pairs
      #|39 basis elements and 104 critical pairs
      #|39 basis elements and 103 critical pairs
      #|39 basis elements and 102 critical pairs
      #|39 basis elements and 101 critical pairs
      #|39 basis elements and 100 critical pairs
      #|39 basis elements and 99 critical pairs
      #|39 basis elements and 98 critical pairs
      #|39 basis elements and 97 critical pairs
      #|39 basis elements and 96 critical pairs
      #|39 basis elements and 95 critical pairs
      #|39 basis elements and 94 critical pairs
      #|39 basis elements and 93 critical pairs
      #|39 basis elements and 92 critical pairs
      #|39 basis elements and 91 critical pairs
      #|39 basis elements and 90 critical pairs
      #|39 basis elements and 89 critical pairs
      #|40 basis elements and 99 critical pairs
      #|40 basis elements and 98 critical pairs
      #|41 basis elements and 109 critical pairs
      #|41 basis elements and 108 critical pairs
      #|41 basis elements and 107 critical pairs
      #|41 basis elements and 106 critical pairs
      #|41 basis elements and 105 critical pairs
      #|41 basis elements and 104 critical pairs
      #|41 basis elements and 103 critical pairs
      #|41 basis elements and 102 critical pairs
      #|41 basis elements and 101 critical pairs
      #|41 basis elements and 100 critical pairs
      #|41 basis elements and 99 critical pairs
      #|41 basis elements and 98 critical pairs
      #|41 basis elements and 97 critical pairs
      #|41 basis elements and 96 critical pairs
      #|41 basis elements and 95 critical pairs
      #|41 basis elements and 94 critical pairs
      #|41 basis elements and 93 critical pairs
      #|41 basis elements and 92 critical pairs
      #|41 basis elements and 91 critical pairs
      #|41 basis elements and 90 critical pairs
      #|41 basis elements and 89 critical pairs
      #|41 basis elements and 88 critical pairs
      #|41 basis elements and 87 critical pairs
      #|41 basis elements and 86 critical pairs
      #|41 basis elements and 85 critical pairs
      #|41 basis elements and 84 critical pairs
      #|41 basis elements and 83 critical pairs
      #|41 basis elements and 82 critical pairs
      #|41 basis elements and 81 critical pairs
      #|41 basis elements and 80 critical pairs
      #|41 basis elements and 79 critical pairs
      #|41 basis elements and 78 critical pairs
      #|41 basis elements and 77 critical pairs
      #|41 basis elements and 76 critical pairs
      #|41 basis elements and 75 critical pairs
      #|41 basis elements and 74 critical pairs
      #|41 basis elements and 73 critical pairs
      #|41 basis elements and 72 critical pairs
      #|41 basis elements and 71 critical pairs
      #|41 basis elements and 70 critical pairs
      #|41 basis elements and 69 critical pairs
      #|41 basis elements and 68 critical pairs
      #|41 basis elements and 67 critical pairs
      #|41 basis elements and 66 critical pairs
      #|41 basis elements and 65 critical pairs
      #|41 basis elements and 64 critical pairs
      #|41 basis elements and 63 critical pairs
      #|41 basis elements and 62 critical pairs
      #|41 basis elements and 61 critical pairs
      #|41 basis elements and 60 critical pairs
      #|41 basis elements and 59 critical pairs
      #|41 basis elements and 58 critical pairs
      #|41 basis elements and 57 critical pairs
      #|41 basis elements and 56 critical pairs
      #|41 basis elements and 55 critical pairs
      #|41 basis elements and 54 critical pairs
      #|41 basis elements and 53 critical pairs
      #|41 basis elements and 52 critical pairs
      #|41 basis elements and 51 critical pairs
      #|41 basis elements and 50 critical pairs
      #|41 basis elements and 49 critical pairs
      #|41 basis elements and 48 critical pairs
      #|42 basis elements and 59 critical pairs
      #|42 basis elements and 58 critical pairs
      #|42 basis elements and 57 critical pairs
      #|42 basis elements and 56 critical pairs
      #|42 basis elements and 55 critical pairs
      #|42 basis elements and 54 critical pairs
      #|42 basis elements and 53 critical pairs
      #|42 basis elements and 52 critical pairs
      #|42 basis elements and 51 critical pairs
      #|42 basis elements and 50 critical pairs
      #|42 basis elements and 49 critical pairs
      #|42 basis elements and 48 critical pairs
      #|42 basis elements and 47 critical pairs
      #|42 basis elements and 46 critical pairs
      #|42 basis elements and 45 critical pairs
      #|42 basis elements and 44 critical pairs
      #|42 basis elements and 43 critical pairs
      #|43 basis elements and 50 critical pairs
      #|43 basis elements and 49 critical pairs
      #|43 basis elements and 48 critical pairs
      #|43 basis elements and 47 critical pairs
      #|43 basis elements and 46 critical pairs
      #|43 basis elements and 45 critical pairs
      #|43 basis elements and 44 critical pairs
      #|43 basis elements and 43 critical pairs
      #|43 basis elements and 42 critical pairs
      #|43 basis elements and 41 critical pairs
      #|43 basis elements and 40 critical pairs
      #|43 basis elements and 39 critical pairs
      #|43 basis elements and 38 critical pairs
      #|43 basis elements and 37 critical pairs
      #|43 basis elements and 36 critical pairs
      #|43 basis elements and 35 critical pairs
      #|43 basis elements and 34 critical pairs
      #|43 basis elements and 33 critical pairs
      #|43 basis elements and 32 critical pairs
      #|43 basis elements and 31 critical pairs
      #|43 basis elements and 30 critical pairs
      #|43 basis elements and 29 critical pairs
      #|43 basis elements and 28 critical pairs
      #|43 basis elements and 27 critical pairs
      #|43 basis elements and 26 critical pairs
      #|43 basis elements and 25 critical pairs
      #|43 basis elements and 24 critical pairs
      #|43 basis elements and 23 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|46 basis elements and 27 critical pairs
      #|46 basis elements and 26 critical pairs
      #|46 basis elements and 25 critical pairs
      #|46 basis elements and 24 critical pairs
      #|47 basis elements and 35 critical pairs
      #|47 basis elements and 34 critical pairs
      #|47 basis elements and 33 critical pairs
      #|47 basis elements and 32 critical pairs
      #|47 basis elements and 31 critical pairs
      #|47 basis elements and 30 critical pairs
      #|47 basis elements and 29 critical pairs
      #|47 basis elements and 28 critical pairs
      #|47 basis elements and 27 critical pairs
      #|47 basis elements and 26 critical pairs
      #|47 basis elements and 25 critical pairs
      #|48 basis elements and 33 critical pairs
      #|48 basis elements and 32 critical pairs
      #|48 basis elements and 31 critical pairs
      #|48 basis elements and 30 critical pairs
      #|49 basis elements and 42 critical pairs
      #|49 basis elements and 41 critical pairs
      #|49 basis elements and 40 critical pairs
      #|49 basis elements and 39 critical pairs
      #|49 basis elements and 38 critical pairs
      #|49 basis elements and 37 critical pairs
      #|49 basis elements and 36 critical pairs
      #|49 basis elements and 35 critical pairs
      #|49 basis elements and 34 critical pairs
      #|50 basis elements and 52 critical pairs
      #|50 basis elements and 51 critical pairs
      #|50 basis elements and 50 critical pairs
      #|50 basis elements and 49 critical pairs
      #|50 basis elements and 48 critical pairs
      #|50 basis elements and 47 critical pairs
      #|50 basis elements and 46 critical pairs
      #|50 basis elements and 45 critical pairs
      #|50 basis elements and 44 critical pairs
      #|50 basis elements and 43 critical pairs
      #|50 basis elements and 42 critical pairs
      #|50 basis elements and 41 critical pairs
      #|50 basis elements and 40 critical pairs
      #|50 basis elements and 39 critical pairs
      #|50 basis elements and 38 critical pairs
      #|50 basis elements and 37 critical pairs
      #|50 basis elements and 36 critical pairs
      #|50 basis elements and 35 critical pairs
      #|50 basis elements and 34 critical pairs
      #|50 basis elements and 33 critical pairs
      #|50 basis elements and 32 critical pairs
      #|50 basis elements and 31 critical pairs
      #|50 basis elements and 30 critical pairs
      #|50 basis elements and 29 critical pairs
      #|50 basis elements and 28 critical pairs
      #|50 basis elements and 27 critical pairs
      #|50 basis elements and 26 critical pairs
      #|50 basis elements and 25 critical pairs
      #|50 basis elements and 24 critical pairs
      #|50 basis elements and 23 critical pairs
      #|50 basis elements and 22 critical pairs
      #|50 basis elements and 21 critical pairs
      #|50 basis elements and 20 critical pairs
      #|50 basis elements and 19 critical pairs
      #|50 basis elements and 18 critical pairs
      #|50 basis elements and 17 critical pairs
      #|50 basis elements and 16 critical pairs
      #|50 basis elements and 15 critical pairs
      #|51 basis elements and 27 critical pairs
      #|51 basis elements and 26 critical pairs
      #|51 basis elements and 25 critical pairs
      #|51 basis elements and 24 critical pairs
      #|51 basis elements and 23 critical pairs
      #|51 basis elements and 22 critical pairs
      #|51 basis elements and 21 critical pairs
      #|51 basis elements and 20 critical pairs
      #|51 basis elements and 19 critical pairs
      #|51 basis elements and 18 critical pairs
      #|51 basis elements and 17 critical pairs
      #|51 basis elements and 16 critical pairs
      #|51 basis elements and 15 critical pairs
      #|51 basis elements and 14 critical pairs
      #|51 basis elements and 13 critical pairs
      #|51 basis elements and 12 critical pairs
      #|51 basis elements and 11 critical pairs
      #|51 basis elements and 10 critical pairs
      #|51 basis elements and 9 critical pairs
      #|51 basis elements and 8 critical pairs
      #|51 basis elements and 7 critical pairs
      #|51 basis elements and 6 critical pairs
      #|51 basis elements and 5 critical pairs
      #|51 basis elements and 4 critical pairs
      #|51 basis elements and 3 critical pairs
      #|51 basis elements and 2 critical pairs
      #|51 basis elements and 1 critical pairs
      #|51 basis elements and 0 critical pairs
      #|11 basis elements and 7 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|14 basis elements and 10 critical pairs
      #|15 basis elements and 13 critical pairs
      #|16 basis elements and 18 critical pairs
      #|17 basis elements and 23 critical pairs
      #|18 basis elements and 29 critical pairs
      #|19 basis elements and 35 critical pairs
      #|20 basis elements and 40 critical pairs
      #|20 basis elements and 39 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|20 basis elements and 35 critical pairs
      #|20 basis elements and 34 critical pairs
      #|21 basis elements and 39 critical pairs
      #|21 basis elements and 38 critical pairs
      #|21 basis elements and 37 critical pairs
      #|22 basis elements and 43 critical pairs
      #|23 basis elements and 49 critical pairs
      #|24 basis elements and 59 critical pairs
      #|25 basis elements and 65 critical pairs
      #|26 basis elements and 75 critical pairs
      #|27 basis elements and 82 critical pairs
      #|27 basis elements and 81 critical pairs
      #|27 basis elements and 80 critical pairs
      #|27 basis elements and 79 critical pairs
      #|27 basis elements and 78 critical pairs
      #|27 basis elements and 77 critical pairs
      #|27 basis elements and 76 critical pairs
      #|27 basis elements and 75 critical pairs
      #|28 basis elements and 87 critical pairs
      #|29 basis elements and 101 critical pairs
      #|30 basis elements and 115 critical pairs
      #|31 basis elements and 131 critical pairs
      #|31 basis elements and 130 critical pairs
      #|31 basis elements and 129 critical pairs
      #|32 basis elements and 145 critical pairs
      #|32 basis elements and 144 critical pairs
      #|33 basis elements and 163 critical pairs
      #|34 basis elements and 181 critical pairs
      #|35 basis elements and 193 critical pairs
      #|36 basis elements and 210 critical pairs
      #|37 basis elements and 231 critical pairs
      #|38 basis elements and 252 critical pairs
      #|39 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 8 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 7 critical pairs
      #|8 basis elements and 6 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 6 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|12 basis elements and 6 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 7 critical pairs
      #|8 basis elements and 6 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 6 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|12 basis elements and 6 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 7 critical pairs
      #|8 basis elements and 6 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 6 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|12 basis elements and 6 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 7 critical pairs
      #|8 basis elements and 6 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 6 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|12 basis elements and 6 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 9 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|15 basis elements and 10 critical pairs
      #|16 basis elements and 12 critical pairs
      #|17 basis elements and 17 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 17 critical pairs
      #|18 basis elements and 16 critical pairs
      #|18 basis elements and 15 critical pairs
      #|19 basis elements and 21 critical pairs
      #|19 basis elements and 20 critical pairs
      #|19 basis elements and 19 critical pairs
      #|19 basis elements and 18 critical pairs
      #|19 basis elements and 17 critical pairs
      #|19 basis elements and 16 critical pairs
      #|19 basis elements and 15 critical pairs
      #|19 basis elements and 14 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|22 basis elements and 32 critical pairs
      #|22 basis elements and 31 critical pairs
      #|22 basis elements and 30 critical pairs
      #|22 basis elements and 29 critical pairs
      #|22 basis elements and 28 critical pairs
      #|22 basis elements and 27 critical pairs
      #|22 basis elements and 26 critical pairs
      #|22 basis elements and 25 critical pairs
      #|22 basis elements and 24 critical pairs
      #|22 basis elements and 23 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|23 basis elements and 26 critical pairs
      #|23 basis elements and 25 critical pairs
      #|23 basis elements and 24 critical pairs
      #|23 basis elements and 23 critical pairs
      #|23 basis elements and 22 critical pairs
      #|23 basis elements and 21 critical pairs
      #|23 basis elements and 20 critical pairs
      #|23 basis elements and 19 critical pairs
      #|23 basis elements and 18 critical pairs
      #|24 basis elements and 22 critical pairs
      #|24 basis elements and 21 critical pairs
      #|24 basis elements and 20 critical pairs
      #|24 basis elements and 19 critical pairs
      #|24 basis elements and 18 critical pairs
      #|24 basis elements and 17 critical pairs
      #|24 basis elements and 16 critical pairs
      #|24 basis elements and 15 critical pairs
      #|24 basis elements and 14 critical pairs
      #|24 basis elements and 13 critical pairs
      #|24 basis elements and 12 critical pairs
      #|24 basis elements and 11 critical pairs
      #|24 basis elements and 10 critical pairs
      #|24 basis elements and 9 critical pairs
      #|24 basis elements and 8 critical pairs
      #|25 basis elements and 12 critical pairs
      #|25 basis elements and 11 critical pairs
      #|25 basis elements and 10 critical pairs
      #|25 basis elements and 9 critical pairs
      #|25 basis elements and 8 critical pairs
      #|25 basis elements and 7 critical pairs
      #|25 basis elements and 6 critical pairs
      #|26 basis elements and 17 critical pairs
      #|26 basis elements and 16 critical pairs
      #|26 basis elements and 15 critical pairs
      #|26 basis elements and 14 critical pairs
      #|26 basis elements and 13 critical pairs
      #|26 basis elements and 12 critical pairs
      #|26 basis elements and 11 critical pairs
      #|26 basis elements and 10 critical pairs
      #|26 basis elements and 9 critical pairs
      #|26 basis elements and 8 critical pairs
      #|27 basis elements and 14 critical pairs
      #|27 basis elements and 13 critical pairs
      #|27 basis elements and 12 critical pairs
      #|27 basis elements and 11 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|28 basis elements and 16 critical pairs
      #|28 basis elements and 15 critical pairs
      #|28 basis elements and 14 critical pairs
      #|28 basis elements and 13 critical pairs
      #|28 basis elements and 12 critical pairs
      #|28 basis elements and 11 critical pairs
      #|29 basis elements and 17 critical pairs
      #|29 basis elements and 16 critical pairs
      #|29 basis elements and 15 critical pairs
      #|29 basis elements and 14 critical pairs
      #|30 basis elements and 22 critical pairs
      #|30 basis elements and 21 critical pairs
      #|30 basis elements and 20 critical pairs
      #|30 basis elements and 19 critical pairs
      #|30 basis elements and 18 critical pairs
      #|30 basis elements and 17 critical pairs
      #|30 basis elements and 16 critical pairs
      #|31 basis elements and 28 critical pairs
      #|31 basis elements and 27 critical pairs
      #|31 basis elements and 26 critical pairs
      #|31 basis elements and 25 critical pairs
      #|31 basis elements and 24 critical pairs
      #|31 basis elements and 23 critical pairs
      #|31 basis elements and 22 critical pairs
      #|31 basis elements and 21 critical pairs
      #|31 basis elements and 20 critical pairs
      #|31 basis elements and 19 critical pairs
      #|31 basis elements and 18 critical pairs
      #|31 basis elements and 17 critical pairs
      #|31 basis elements and 16 critical pairs
      #|31 basis elements and 15 critical pairs
      #|31 basis elements and 14 critical pairs
      #|31 basis elements and 13 critical pairs
      #|31 basis elements and 12 critical pairs
      #|31 basis elements and 11 critical pairs
      #|31 basis elements and 10 critical pairs
      #|31 basis elements and 9 critical pairs
      #|31 basis elements and 8 critical pairs
      #|31 basis elements and 7 critical pairs
      #|32 basis elements and 15 critical pairs
      #|32 basis elements and 14 critical pairs
      #|32 basis elements and 13 critical pairs
      #|32 basis elements and 12 critical pairs
      #|32 basis elements and 11 critical pairs
      #|32 basis elements and 10 critical pairs
      #|32 basis elements and 9 critical pairs
      #|32 basis elements and 8 critical pairs
      #|32 basis elements and 7 critical pairs
      #|32 basis elements and 6 critical pairs
      #|32 basis elements and 5 critical pairs
      #|32 basis elements and 4 critical pairs
      #|32 basis elements and 3 critical pairs
      #|32 basis elements and 2 critical pairs
      #|32 basis elements and 1 critical pairs
      #|32 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 39 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|21 basis elements and 49 critical pairs
      #|21 basis elements and 48 critical pairs
      #|22 basis elements and 57 critical pairs
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
      #|24 basis elements and 60 critical pairs
      #|24 basis elements and 59 critical pairs
      #|24 basis elements and 58 critical pairs
      #|25 basis elements and 66 critical pairs
      #|25 basis elements and 65 critical pairs
      #|25 basis elements and 64 critical pairs
      #|25 basis elements and 63 critical pairs
      #|26 basis elements and 74 critical pairs
      #|26 basis elements and 73 critical pairs
      #|26 basis elements and 72 critical pairs
      #|26 basis elements and 71 critical pairs
      #|27 basis elements and 80 critical pairs
      #|28 basis elements and 90 critical pairs
      #|28 basis elements and 89 critical pairs
      #|28 basis elements and 88 critical pairs
      #|28 basis elements and 87 critical pairs
      #|28 basis elements and 86 critical pairs
      #|28 basis elements and 85 critical pairs
      #|28 basis elements and 84 critical pairs
      #|29 basis elements and 99 critical pairs
      #|29 basis elements and 98 critical pairs
      #|29 basis elements and 97 critical pairs
      #|30 basis elements and 107 critical pairs
      #|30 basis elements and 106 critical pairs
      #|30 basis elements and 105 critical pairs
      #|30 basis elements and 104 critical pairs
      #|31 basis elements and 116 critical pairs
      #|31 basis elements and 115 critical pairs
      #|31 basis elements and 114 critical pairs
      #|31 basis elements and 113 critical pairs
      #|31 basis elements and 112 critical pairs
      #|31 basis elements and 111 critical pairs
      #|31 basis elements and 110 critical pairs
      #|31 basis elements and 109 critical pairs
      #|31 basis elements and 108 critical pairs
      #|31 basis elements and 107 critical pairs
      #|32 basis elements and 119 critical pairs
      #|32 basis elements and 118 critical pairs
      #|32 basis elements and 117 critical pairs
      #|32 basis elements and 116 critical pairs
      #|32 basis elements and 115 critical pairs
      #|32 basis elements and 114 critical pairs
      #|32 basis elements and 113 critical pairs
      #|32 basis elements and 112 critical pairs
      #|32 basis elements and 111 critical pairs
      #|32 basis elements and 110 critical pairs
      #|32 basis elements and 109 critical pairs
      #|32 basis elements and 108 critical pairs
      #|32 basis elements and 107 critical pairs
      #|32 basis elements and 106 critical pairs
      #|32 basis elements and 105 critical pairs
      #|32 basis elements and 104 critical pairs
      #|32 basis elements and 103 critical pairs
      #|33 basis elements and 111 critical pairs
      #|33 basis elements and 110 critical pairs
      #|33 basis elements and 109 critical pairs
      #|33 basis elements and 108 critical pairs
      #|33 basis elements and 107 critical pairs
      #|33 basis elements and 106 critical pairs
      #|34 basis elements and 117 critical pairs
      #|34 basis elements and 116 critical pairs
      #|34 basis elements and 115 critical pairs
      #|34 basis elements and 114 critical pairs
      #|34 basis elements and 113 critical pairs
      #|34 basis elements and 112 critical pairs
      #|34 basis elements and 111 critical pairs
      #|34 basis elements and 110 critical pairs
      #|34 basis elements and 109 critical pairs
      #|34 basis elements and 108 critical pairs
      #|35 basis elements and 114 critical pairs
      #|36 basis elements and 120 critical pairs
      #|37 basis elements and 126 critical pairs
      #|38 basis elements and 132 critical pairs
      #|38 basis elements and 131 critical pairs
      #|38 basis elements and 130 critical pairs
      #|38 basis elements and 129 critical pairs
      #|38 basis elements and 128 critical pairs
      #|38 basis elements and 127 critical pairs
      #|38 basis elements and 126 critical pairs
      #|38 basis elements and 125 critical pairs
      #|38 basis elements and 124 critical pairs
      #|38 basis elements and 123 critical pairs
      #|38 basis elements and 122 critical pairs
      #|38 basis elements and 121 critical pairs
      #|38 basis elements and 120 critical pairs
      #|38 basis elements and 119 critical pairs
      #|38 basis elements and 118 critical pairs
      #|38 basis elements and 117 critical pairs
      #|38 basis elements and 116 critical pairs
      #|38 basis elements and 115 critical pairs
      #|38 basis elements and 114 critical pairs
      #|38 basis elements and 113 critical pairs
      #|38 basis elements and 112 critical pairs
      #|38 basis elements and 111 critical pairs
      #|38 basis elements and 110 critical pairs
      #|38 basis elements and 109 critical pairs
      #|38 basis elements and 108 critical pairs
      #|38 basis elements and 107 critical pairs
      #|38 basis elements and 106 critical pairs
      #|38 basis elements and 105 critical pairs
      #|38 basis elements and 104 critical pairs
      #|39 basis elements and 111 critical pairs
      #|39 basis elements and 110 critical pairs
      #|39 basis elements and 109 critical pairs
      #|39 basis elements and 108 critical pairs
      #|39 basis elements and 107 critical pairs
      #|39 basis elements and 106 critical pairs
      #|39 basis elements and 105 critical pairs
      #|39 basis elements and 104 critical pairs
      #|39 basis elements and 103 critical pairs
      #|39 basis elements and 102 critical pairs
      #|39 basis elements and 101 critical pairs
      #|39 basis elements and 100 critical pairs
      #|39 basis elements and 99 critical pairs
      #|39 basis elements and 98 critical pairs
      #|39 basis elements and 97 critical pairs
      #|39 basis elements and 96 critical pairs
      #|39 basis elements and 95 critical pairs
      #|39 basis elements and 94 critical pairs
      #|39 basis elements and 93 critical pairs
      #|39 basis elements and 92 critical pairs
      #|39 basis elements and 91 critical pairs
      #|39 basis elements and 90 critical pairs
      #|39 basis elements and 89 critical pairs
      #|40 basis elements and 99 critical pairs
      #|40 basis elements and 98 critical pairs
      #|41 basis elements and 109 critical pairs
      #|41 basis elements and 108 critical pairs
      #|41 basis elements and 107 critical pairs
      #|41 basis elements and 106 critical pairs
      #|41 basis elements and 105 critical pairs
      #|41 basis elements and 104 critical pairs
      #|41 basis elements and 103 critical pairs
      #|41 basis elements and 102 critical pairs
      #|41 basis elements and 101 critical pairs
      #|41 basis elements and 100 critical pairs
      #|41 basis elements and 99 critical pairs
      #|41 basis elements and 98 critical pairs
      #|41 basis elements and 97 critical pairs
      #|41 basis elements and 96 critical pairs
      #|41 basis elements and 95 critical pairs
      #|41 basis elements and 94 critical pairs
      #|41 basis elements and 93 critical pairs
      #|41 basis elements and 92 critical pairs
      #|41 basis elements and 91 critical pairs
      #|41 basis elements and 90 critical pairs
      #|41 basis elements and 89 critical pairs
      #|41 basis elements and 88 critical pairs
      #|41 basis elements and 87 critical pairs
      #|41 basis elements and 86 critical pairs
      #|41 basis elements and 85 critical pairs
      #|41 basis elements and 84 critical pairs
      #|41 basis elements and 83 critical pairs
      #|41 basis elements and 82 critical pairs
      #|41 basis elements and 81 critical pairs
      #|41 basis elements and 80 critical pairs
      #|41 basis elements and 79 critical pairs
      #|41 basis elements and 78 critical pairs
      #|41 basis elements and 77 critical pairs
      #|41 basis elements and 76 critical pairs
      #|41 basis elements and 75 critical pairs
      #|41 basis elements and 74 critical pairs
      #|41 basis elements and 73 critical pairs
      #|41 basis elements and 72 critical pairs
      #|41 basis elements and 71 critical pairs
      #|41 basis elements and 70 critical pairs
      #|41 basis elements and 69 critical pairs
      #|41 basis elements and 68 critical pairs
      #|41 basis elements and 67 critical pairs
      #|41 basis elements and 66 critical pairs
      #|41 basis elements and 65 critical pairs
      #|41 basis elements and 64 critical pairs
      #|41 basis elements and 63 critical pairs
      #|41 basis elements and 62 critical pairs
      #|41 basis elements and 61 critical pairs
      #|41 basis elements and 60 critical pairs
      #|41 basis elements and 59 critical pairs
      #|41 basis elements and 58 critical pairs
      #|41 basis elements and 57 critical pairs
      #|41 basis elements and 56 critical pairs
      #|41 basis elements and 55 critical pairs
      #|41 basis elements and 54 critical pairs
      #|41 basis elements and 53 critical pairs
      #|41 basis elements and 52 critical pairs
      #|41 basis elements and 51 critical pairs
      #|41 basis elements and 50 critical pairs
      #|41 basis elements and 49 critical pairs
      #|41 basis elements and 48 critical pairs
      #|42 basis elements and 59 critical pairs
      #|42 basis elements and 58 critical pairs
      #|42 basis elements and 57 critical pairs
      #|42 basis elements and 56 critical pairs
      #|42 basis elements and 55 critical pairs
      #|42 basis elements and 54 critical pairs
      #|42 basis elements and 53 critical pairs
      #|42 basis elements and 52 critical pairs
      #|42 basis elements and 51 critical pairs
      #|42 basis elements and 50 critical pairs
      #|42 basis elements and 49 critical pairs
      #|42 basis elements and 48 critical pairs
      #|42 basis elements and 47 critical pairs
      #|42 basis elements and 46 critical pairs
      #|42 basis elements and 45 critical pairs
      #|42 basis elements and 44 critical pairs
      #|42 basis elements and 43 critical pairs
      #|43 basis elements and 50 critical pairs
      #|43 basis elements and 49 critical pairs
      #|43 basis elements and 48 critical pairs
      #|43 basis elements and 47 critical pairs
      #|43 basis elements and 46 critical pairs
      #|43 basis elements and 45 critical pairs
      #|43 basis elements and 44 critical pairs
      #|43 basis elements and 43 critical pairs
      #|43 basis elements and 42 critical pairs
      #|43 basis elements and 41 critical pairs
      #|43 basis elements and 40 critical pairs
      #|43 basis elements and 39 critical pairs
      #|43 basis elements and 38 critical pairs
      #|43 basis elements and 37 critical pairs
      #|43 basis elements and 36 critical pairs
      #|43 basis elements and 35 critical pairs
      #|43 basis elements and 34 critical pairs
      #|43 basis elements and 33 critical pairs
      #|43 basis elements and 32 critical pairs
      #|43 basis elements and 31 critical pairs
      #|43 basis elements and 30 critical pairs
      #|43 basis elements and 29 critical pairs
      #|43 basis elements and 28 critical pairs
      #|43 basis elements and 27 critical pairs
      #|43 basis elements and 26 critical pairs
      #|43 basis elements and 25 critical pairs
      #|43 basis elements and 24 critical pairs
      #|43 basis elements and 23 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|46 basis elements and 27 critical pairs
      #|46 basis elements and 26 critical pairs
      #|46 basis elements and 25 critical pairs
      #|46 basis elements and 24 critical pairs
      #|47 basis elements and 35 critical pairs
      #|47 basis elements and 34 critical pairs
      #|47 basis elements and 33 critical pairs
      #|47 basis elements and 32 critical pairs
      #|47 basis elements and 31 critical pairs
      #|47 basis elements and 30 critical pairs
      #|47 basis elements and 29 critical pairs
      #|47 basis elements and 28 critical pairs
      #|47 basis elements and 27 critical pairs
      #|47 basis elements and 26 critical pairs
      #|47 basis elements and 25 critical pairs
      #|48 basis elements and 33 critical pairs
      #|48 basis elements and 32 critical pairs
      #|48 basis elements and 31 critical pairs
      #|48 basis elements and 30 critical pairs
      #|49 basis elements and 42 critical pairs
      #|49 basis elements and 41 critical pairs
      #|49 basis elements and 40 critical pairs
      #|49 basis elements and 39 critical pairs
      #|49 basis elements and 38 critical pairs
      #|49 basis elements and 37 critical pairs
      #|49 basis elements and 36 critical pairs
      #|49 basis elements and 35 critical pairs
      #|49 basis elements and 34 critical pairs
      #|50 basis elements and 52 critical pairs
      #|50 basis elements and 51 critical pairs
      #|50 basis elements and 50 critical pairs
      #|50 basis elements and 49 critical pairs
      #|50 basis elements and 48 critical pairs
      #|50 basis elements and 47 critical pairs
      #|50 basis elements and 46 critical pairs
      #|50 basis elements and 45 critical pairs
      #|50 basis elements and 44 critical pairs
      #|50 basis elements and 43 critical pairs
      #|50 basis elements and 42 critical pairs
      #|50 basis elements and 41 critical pairs
      #|50 basis elements and 40 critical pairs
      #|50 basis elements and 39 critical pairs
      #|50 basis elements and 38 critical pairs
      #|50 basis elements and 37 critical pairs
      #|50 basis elements and 36 critical pairs
      #|50 basis elements and 35 critical pairs
      #|50 basis elements and 34 critical pairs
      #|50 basis elements and 33 critical pairs
      #|50 basis elements and 32 critical pairs
      #|50 basis elements and 31 critical pairs
      #|50 basis elements and 30 critical pairs
      #|50 basis elements and 29 critical pairs
      #|50 basis elements and 28 critical pairs
      #|50 basis elements and 27 critical pairs
      #|50 basis elements and 26 critical pairs
      #|50 basis elements and 25 critical pairs
      #|50 basis elements and 24 critical pairs
      #|50 basis elements and 23 critical pairs
      #|50 basis elements and 22 critical pairs
      #|50 basis elements and 21 critical pairs
      #|50 basis elements and 20 critical pairs
      #|50 basis elements and 19 critical pairs
      #|50 basis elements and 18 critical pairs
      #|50 basis elements and 17 critical pairs
      #|50 basis elements and 16 critical pairs
      #|50 basis elements and 15 critical pairs
      #|51 basis elements and 27 critical pairs
      #|51 basis elements and 26 critical pairs
      #|51 basis elements and 25 critical pairs
      #|51 basis elements and 24 critical pairs
      #|51 basis elements and 23 critical pairs
      #|51 basis elements and 22 critical pairs
      #|51 basis elements and 21 critical pairs
      #|51 basis elements and 20 critical pairs
      #|51 basis elements and 19 critical pairs
      #|51 basis elements and 18 critical pairs
      #|51 basis elements and 17 critical pairs
      #|51 basis elements and 16 critical pairs
      #|51 basis elements and 15 critical pairs
      #|51 basis elements and 14 critical pairs
      #|51 basis elements and 13 critical pairs
      #|51 basis elements and 12 critical pairs
      #|51 basis elements and 11 critical pairs
      #|51 basis elements and 10 critical pairs
      #|51 basis elements and 9 critical pairs
      #|51 basis elements and 8 critical pairs
      #|51 basis elements and 7 critical pairs
      #|51 basis elements and 6 critical pairs
      #|51 basis elements and 5 critical pairs
      #|51 basis elements and 4 critical pairs
      #|51 basis elements and 3 critical pairs
      #|51 basis elements and 2 critical pairs
      #|51 basis elements and 1 critical pairs
      #|51 basis elements and 0 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 13 critical pairs
      #|15 basis elements and 16 critical pairs
      #|16 basis elements and 21 critical pairs
      #|17 basis elements and 26 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 43 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|20 basis elements and 40 critical pairs
      #|20 basis elements and 39 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|21 basis elements and 42 critical pairs
      #|22 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|19 basis elements and 39 critical pairs
      #|19 basis elements and 38 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|21 basis elements and 49 critical pairs
      #|21 basis elements and 48 critical pairs
      #|22 basis elements and 57 critical pairs
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
      #|24 basis elements and 60 critical pairs
      #|24 basis elements and 59 critical pairs
      #|24 basis elements and 58 critical pairs
      #|25 basis elements and 66 critical pairs
      #|25 basis elements and 65 critical pairs
      #|25 basis elements and 64 critical pairs
      #|25 basis elements and 63 critical pairs
      #|26 basis elements and 74 critical pairs
      #|26 basis elements and 73 critical pairs
      #|26 basis elements and 72 critical pairs
      #|26 basis elements and 71 critical pairs
      #|27 basis elements and 80 critical pairs
      #|28 basis elements and 90 critical pairs
      #|28 basis elements and 89 critical pairs
      #|28 basis elements and 88 critical pairs
      #|28 basis elements and 87 critical pairs
      #|28 basis elements and 86 critical pairs
      #|28 basis elements and 85 critical pairs
      #|28 basis elements and 84 critical pairs
      #|29 basis elements and 99 critical pairs
      #|29 basis elements and 98 critical pairs
      #|29 basis elements and 97 critical pairs
      #|30 basis elements and 107 critical pairs
      #|30 basis elements and 106 critical pairs
      #|30 basis elements and 105 critical pairs
      #|30 basis elements and 104 critical pairs
      #|31 basis elements and 116 critical pairs
      #|31 basis elements and 115 critical pairs
      #|31 basis elements and 114 critical pairs
      #|31 basis elements and 113 critical pairs
      #|31 basis elements and 112 critical pairs
      #|31 basis elements and 111 critical pairs
      #|31 basis elements and 110 critical pairs
      #|31 basis elements and 109 critical pairs
      #|31 basis elements and 108 critical pairs
      #|31 basis elements and 107 critical pairs
      #|32 basis elements and 119 critical pairs
      #|32 basis elements and 118 critical pairs
      #|32 basis elements and 117 critical pairs
      #|32 basis elements and 116 critical pairs
      #|32 basis elements and 115 critical pairs
      #|32 basis elements and 114 critical pairs
      #|32 basis elements and 113 critical pairs
      #|32 basis elements and 112 critical pairs
      #|32 basis elements and 111 critical pairs
      #|32 basis elements and 110 critical pairs
      #|32 basis elements and 109 critical pairs
      #|32 basis elements and 108 critical pairs
      #|32 basis elements and 107 critical pairs
      #|32 basis elements and 106 critical pairs
      #|32 basis elements and 105 critical pairs
      #|32 basis elements and 104 critical pairs
      #|32 basis elements and 103 critical pairs
      #|33 basis elements and 111 critical pairs
      #|33 basis elements and 110 critical pairs
      #|33 basis elements and 109 critical pairs
      #|33 basis elements and 108 critical pairs
      #|33 basis elements and 107 critical pairs
      #|33 basis elements and 106 critical pairs
      #|34 basis elements and 117 critical pairs
      #|34 basis elements and 116 critical pairs
      #|34 basis elements and 115 critical pairs
      #|34 basis elements and 114 critical pairs
      #|34 basis elements and 113 critical pairs
      #|34 basis elements and 112 critical pairs
      #|34 basis elements and 111 critical pairs
      #|34 basis elements and 110 critical pairs
      #|34 basis elements and 109 critical pairs
      #|34 basis elements and 108 critical pairs
      #|35 basis elements and 114 critical pairs
      #|36 basis elements and 120 critical pairs
      #|37 basis elements and 126 critical pairs
      #|38 basis elements and 132 critical pairs
      #|38 basis elements and 131 critical pairs
      #|38 basis elements and 130 critical pairs
      #|38 basis elements and 129 critical pairs
      #|38 basis elements and 128 critical pairs
      #|38 basis elements and 127 critical pairs
      #|38 basis elements and 126 critical pairs
      #|38 basis elements and 125 critical pairs
      #|38 basis elements and 124 critical pairs
      #|38 basis elements and 123 critical pairs
      #|38 basis elements and 122 critical pairs
      #|38 basis elements and 121 critical pairs
      #|38 basis elements and 120 critical pairs
      #|38 basis elements and 119 critical pairs
      #|38 basis elements and 118 critical pairs
      #|38 basis elements and 117 critical pairs
      #|38 basis elements and 116 critical pairs
      #|38 basis elements and 115 critical pairs
      #|38 basis elements and 114 critical pairs
      #|38 basis elements and 113 critical pairs
      #|38 basis elements and 112 critical pairs
      #|38 basis elements and 111 critical pairs
      #|38 basis elements and 110 critical pairs
      #|38 basis elements and 109 critical pairs
      #|38 basis elements and 108 critical pairs
      #|38 basis elements and 107 critical pairs
      #|38 basis elements and 106 critical pairs
      #|38 basis elements and 105 critical pairs
      #|38 basis elements and 104 critical pairs
      #|39 basis elements and 111 critical pairs
      #|39 basis elements and 110 critical pairs
      #|39 basis elements and 109 critical pairs
      #|39 basis elements and 108 critical pairs
      #|39 basis elements and 107 critical pairs
      #|39 basis elements and 106 critical pairs
      #|39 basis elements and 105 critical pairs
      #|39 basis elements and 104 critical pairs
      #|39 basis elements and 103 critical pairs
      #|39 basis elements and 102 critical pairs
      #|39 basis elements and 101 critical pairs
      #|39 basis elements and 100 critical pairs
      #|39 basis elements and 99 critical pairs
      #|39 basis elements and 98 critical pairs
      #|39 basis elements and 97 critical pairs
      #|39 basis elements and 96 critical pairs
      #|39 basis elements and 95 critical pairs
      #|39 basis elements and 94 critical pairs
      #|39 basis elements and 93 critical pairs
      #|39 basis elements and 92 critical pairs
      #|39 basis elements and 91 critical pairs
      #|39 basis elements and 90 critical pairs
      #|39 basis elements and 89 critical pairs
      #|40 basis elements and 99 critical pairs
      #|40 basis elements and 98 critical pairs
      #|41 basis elements and 109 critical pairs
      #|41 basis elements and 108 critical pairs
      #|41 basis elements and 107 critical pairs
      #|41 basis elements and 106 critical pairs
      #|41 basis elements and 105 critical pairs
      #|41 basis elements and 104 critical pairs
      #|41 basis elements and 103 critical pairs
      #|41 basis elements and 102 critical pairs
      #|41 basis elements and 101 critical pairs
      #|41 basis elements and 100 critical pairs
      #|41 basis elements and 99 critical pairs
      #|41 basis elements and 98 critical pairs
      #|41 basis elements and 97 critical pairs
      #|41 basis elements and 96 critical pairs
      #|41 basis elements and 95 critical pairs
      #|41 basis elements and 94 critical pairs
      #|41 basis elements and 93 critical pairs
      #|41 basis elements and 92 critical pairs
      #|41 basis elements and 91 critical pairs
      #|41 basis elements and 90 critical pairs
      #|41 basis elements and 89 critical pairs
      #|41 basis elements and 88 critical pairs
      #|41 basis elements and 87 critical pairs
      #|41 basis elements and 86 critical pairs
      #|41 basis elements and 85 critical pairs
      #|41 basis elements and 84 critical pairs
      #|41 basis elements and 83 critical pairs
      #|41 basis elements and 82 critical pairs
      #|41 basis elements and 81 critical pairs
      #|41 basis elements and 80 critical pairs
      #|41 basis elements and 79 critical pairs
      #|41 basis elements and 78 critical pairs
      #|41 basis elements and 77 critical pairs
      #|41 basis elements and 76 critical pairs
      #|41 basis elements and 75 critical pairs
      #|41 basis elements and 74 critical pairs
      #|41 basis elements and 73 critical pairs
      #|41 basis elements and 72 critical pairs
      #|41 basis elements and 71 critical pairs
      #|41 basis elements and 70 critical pairs
      #|41 basis elements and 69 critical pairs
      #|41 basis elements and 68 critical pairs
      #|41 basis elements and 67 critical pairs
      #|41 basis elements and 66 critical pairs
      #|41 basis elements and 65 critical pairs
      #|41 basis elements and 64 critical pairs
      #|41 basis elements and 63 critical pairs
      #|41 basis elements and 62 critical pairs
      #|41 basis elements and 61 critical pairs
      #|41 basis elements and 60 critical pairs
      #|41 basis elements and 59 critical pairs
      #|41 basis elements and 58 critical pairs
      #|41 basis elements and 57 critical pairs
      #|41 basis elements and 56 critical pairs
      #|41 basis elements and 55 critical pairs
      #|41 basis elements and 54 critical pairs
      #|41 basis elements and 53 critical pairs
      #|41 basis elements and 52 critical pairs
      #|41 basis elements and 51 critical pairs
      #|41 basis elements and 50 critical pairs
      #|41 basis elements and 49 critical pairs
      #|41 basis elements and 48 critical pairs
      #|42 basis elements and 59 critical pairs
      #|42 basis elements and 58 critical pairs
      #|42 basis elements and 57 critical pairs
      #|42 basis elements and 56 critical pairs
      #|42 basis elements and 55 critical pairs
      #|42 basis elements and 54 critical pairs
      #|42 basis elements and 53 critical pairs
      #|42 basis elements and 52 critical pairs
      #|42 basis elements and 51 critical pairs
      #|42 basis elements and 50 critical pairs
      #|42 basis elements and 49 critical pairs
      #|42 basis elements and 48 critical pairs
      #|42 basis elements and 47 critical pairs
      #|42 basis elements and 46 critical pairs
      #|42 basis elements and 45 critical pairs
      #|42 basis elements and 44 critical pairs
      #|42 basis elements and 43 critical pairs
      #|43 basis elements and 50 critical pairs
      #|43 basis elements and 49 critical pairs
      #|43 basis elements and 48 critical pairs
      #|43 basis elements and 47 critical pairs
      #|43 basis elements and 46 critical pairs
      #|43 basis elements and 45 critical pairs
      #|43 basis elements and 44 critical pairs
      #|43 basis elements and 43 critical pairs
      #|43 basis elements and 42 critical pairs
      #|43 basis elements and 41 critical pairs
      #|43 basis elements and 40 critical pairs
      #|43 basis elements and 39 critical pairs
      #|43 basis elements and 38 critical pairs
      #|43 basis elements and 37 critical pairs
      #|43 basis elements and 36 critical pairs
      #|43 basis elements and 35 critical pairs
      #|43 basis elements and 34 critical pairs
      #|43 basis elements and 33 critical pairs
      #|43 basis elements and 32 critical pairs
      #|43 basis elements and 31 critical pairs
      #|43 basis elements and 30 critical pairs
      #|43 basis elements and 29 critical pairs
      #|43 basis elements and 28 critical pairs
      #|43 basis elements and 27 critical pairs
      #|43 basis elements and 26 critical pairs
      #|43 basis elements and 25 critical pairs
      #|43 basis elements and 24 critical pairs
      #|43 basis elements and 23 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|44 basis elements and 19 critical pairs
      #|44 basis elements and 18 critical pairs
      #|44 basis elements and 17 critical pairs
      #|44 basis elements and 16 critical pairs
      #|44 basis elements and 15 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|46 basis elements and 27 critical pairs
      #|46 basis elements and 26 critical pairs
      #|46 basis elements and 25 critical pairs
      #|46 basis elements and 24 critical pairs
      #|47 basis elements and 35 critical pairs
      #|47 basis elements and 34 critical pairs
      #|47 basis elements and 33 critical pairs
      #|47 basis elements and 32 critical pairs
      #|47 basis elements and 31 critical pairs
      #|47 basis elements and 30 critical pairs
      #|47 basis elements and 29 critical pairs
      #|47 basis elements and 28 critical pairs
      #|47 basis elements and 27 critical pairs
      #|47 basis elements and 26 critical pairs
      #|47 basis elements and 25 critical pairs
      #|48 basis elements and 33 critical pairs
      #|48 basis elements and 32 critical pairs
      #|48 basis elements and 31 critical pairs
      #|48 basis elements and 30 critical pairs
      #|49 basis elements and 42 critical pairs
      #|49 basis elements and 41 critical pairs
      #|49 basis elements and 40 critical pairs
      #|49 basis elements and 39 critical pairs
      #|49 basis elements and 38 critical pairs
      #|49 basis elements and 37 critical pairs
      #|49 basis elements and 36 critical pairs
      #|49 basis elements and 35 critical pairs
      #|49 basis elements and 34 critical pairs
      #|50 basis elements and 52 critical pairs
      #|50 basis elements and 51 critical pairs
      #|50 basis elements and 50 critical pairs
      #|50 basis elements and 49 critical pairs
      #|50 basis elements and 48 critical pairs
      #|50 basis elements and 47 critical pairs
      #|50 basis elements and 46 critical pairs
      #|50 basis elements and 45 critical pairs
      #|50 basis elements and 44 critical pairs
      #|50 basis elements and 43 critical pairs
      #|50 basis elements and 42 critical pairs
      #|50 basis elements and 41 critical pairs
      #|50 basis elements and 40 critical pairs
      #|50 basis elements and 39 critical pairs
      #|50 basis elements and 38 critical pairs
      #|50 basis elements and 37 critical pairs
      #|50 basis elements and 36 critical pairs
      #|50 basis elements and 35 critical pairs
      #|50 basis elements and 34 critical pairs
      #|50 basis elements and 33 critical pairs
      #|50 basis elements and 32 critical pairs
      #|50 basis elements and 31 critical pairs
      #|50 basis elements and 30 critical pairs
      #|50 basis elements and 29 critical pairs
      #|50 basis elements and 28 critical pairs
      #|50 basis elements and 27 critical pairs
      #|50 basis elements and 26 critical pairs
      #|50 basis elements and 25 critical pairs
      #|50 basis elements and 24 critical pairs
      #|50 basis elements and 23 critical pairs
      #|50 basis elements and 22 critical pairs
      #|50 basis elements and 21 critical pairs
      #|50 basis elements and 20 critical pairs
      #|50 basis elements and 19 critical pairs
      #|50 basis elements and 18 critical pairs
      #|50 basis elements and 17 critical pairs
      #|50 basis elements and 16 critical pairs
      #|50 basis elements and 15 critical pairs
      #|51 basis elements and 27 critical pairs
      #|51 basis elements and 26 critical pairs
      #|51 basis elements and 25 critical pairs
      #|51 basis elements and 24 critical pairs
      #|51 basis elements and 23 critical pairs
      #|51 basis elements and 22 critical pairs
      #|51 basis elements and 21 critical pairs
      #|51 basis elements and 20 critical pairs
      #|51 basis elements and 19 critical pairs
      #|51 basis elements and 18 critical pairs
      #|51 basis elements and 17 critical pairs
      #|51 basis elements and 16 critical pairs
      #|51 basis elements and 15 critical pairs
      #|51 basis elements and 14 critical pairs
      #|51 basis elements and 13 critical pairs
      #|51 basis elements and 12 critical pairs
      #|51 basis elements and 11 critical pairs
      #|51 basis elements and 10 critical pairs
      #|51 basis elements and 9 critical pairs
      #|51 basis elements and 8 critical pairs
      #|51 basis elements and 7 critical pairs
      #|51 basis elements and 6 critical pairs
      #|51 basis elements and 5 critical pairs
      #|51 basis elements and 4 critical pairs
      #|51 basis elements and 3 critical pairs
      #|51 basis elements and 2 critical pairs
      #|51 basis elements and 1 critical pairs
      #|51 basis elements and 0 critical pairs
      #|11 basis elements and 7 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|14 basis elements and 10 critical pairs
      #|15 basis elements and 13 critical pairs
      #|16 basis elements and 18 critical pairs
      #|17 basis elements and 23 critical pairs
      #|18 basis elements and 29 critical pairs
      #|19 basis elements and 35 critical pairs
      #|20 basis elements and 40 critical pairs
      #|20 basis elements and 39 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|20 basis elements and 35 critical pairs
      #|20 basis elements and 34 critical pairs
      #|21 basis elements and 39 critical pairs
      #|21 basis elements and 38 critical pairs
      #|21 basis elements and 37 critical pairs
      #|22 basis elements and 43 critical pairs
      #|23 basis elements and 49 critical pairs
      #|24 basis elements and 59 critical pairs
      #|25 basis elements and 65 critical pairs
      #|26 basis elements and 75 critical pairs
      #|27 basis elements and 82 critical pairs
      #|27 basis elements and 81 critical pairs
      #|27 basis elements and 80 critical pairs
      #|27 basis elements and 79 critical pairs
      #|27 basis elements and 78 critical pairs
      #|27 basis elements and 77 critical pairs
      #|27 basis elements and 76 critical pairs
      #|27 basis elements and 75 critical pairs
      #|28 basis elements and 87 critical pairs
      #|29 basis elements and 101 critical pairs
      #|30 basis elements and 115 critical pairs
      #|31 basis elements and 131 critical pairs
      #|31 basis elements and 130 critical pairs
      #|31 basis elements and 129 critical pairs
      #|32 basis elements and 145 critical pairs
      #|32 basis elements and 144 critical pairs
      #|33 basis elements and 163 critical pairs
      #|34 basis elements and 181 critical pairs
      #|35 basis elements and 193 critical pairs
      #|36 basis elements and 210 critical pairs
      #|37 basis elements and 231 critical pairs
      #|38 basis elements and 252 critical pairs
      #|39 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|9 basis elements and 5 critical pairs
      #|9 basis elements and 4 critical pairs
      #|9 basis elements and 3 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|10 basis elements and 4 critical pairs
      #|10 basis elements and 3 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|12 basis elements and 4 critical pairs
      #|12 basis elements and 3 critical pairs
      #|12 basis elements and 2 critical pairs
      #|12 basis elements and 1 critical pairs
      #|12 basis elements and 0 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 7 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 9 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 22 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|14 basis elements and 25 critical pairs
      #|14 basis elements and 24 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|15 basis elements and 26 critical pairs
      #|16 basis elements and 32 critical pairs
      #|16 basis elements and 31 critical pairs
      #|17 basis elements and 38 critical pairs
      #|17 basis elements and 37 critical pairs
      #|17 basis elements and 36 critical pairs
      #|17 basis elements and 35 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 39 critical pairs
      #|18 basis elements and 38 critical pairs
      #|18 basis elements and 37 critical pairs
      #|18 basis elements and 36 critical pairs
      #|18 basis elements and 35 critical pairs
      #|18 basis elements and 34 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|18 basis elements and 26 critical pairs
      #|18 basis elements and 25 critical pairs
      #|18 basis elements and 24 critical pairs
      #|19 basis elements and 29 critical pairs
      #|19 basis elements and 28 critical pairs
      #|19 basis elements and 27 critical pairs
      #|19 basis elements and 26 critical pairs
      #|19 basis elements and 25 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|20 basis elements and 25 critical pairs
      #|20 basis elements and 24 critical pairs
      #|20 basis elements and 23 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|20 basis elements and 18 critical pairs
      #|21 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|9 basis elements and 5 critical pairs
      #|9 basis elements and 4 critical pairs
      #|9 basis elements and 3 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|10 basis elements and 4 critical pairs
      #|10 basis elements and 3 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|12 basis elements and 4 critical pairs
      #|12 basis elements and 3 critical pairs
      #|12 basis elements and 2 critical pairs
      #|12 basis elements and 1 critical pairs
      #|12 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|9 basis elements and 5 critical pairs
      #|9 basis elements and 4 critical pairs
      #|9 basis elements and 3 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|10 basis elements and 4 critical pairs
      #|10 basis elements and 3 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|12 basis elements and 4 critical pairs
      #|12 basis elements and 3 critical pairs
      #|12 basis elements and 2 critical pairs
      #|12 basis elements and 1 critical pairs
      #|12 basis elements and 0 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 7 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 9 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 22 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|14 basis elements and 25 critical pairs
      #|14 basis elements and 24 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|14 basis elements and 21 critical pairs
      #|15 basis elements and 27 critical pairs
      #|16 basis elements and 33 critical pairs
      #|16 basis elements and 32 critical pairs
      #|17 basis elements and 39 critical pairs
      #|17 basis elements and 38 critical pairs
      #|17 basis elements and 37 critical pairs
      #|17 basis elements and 36 critical pairs
      #|17 basis elements and 35 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 39 critical pairs
      #|18 basis elements and 38 critical pairs
      #|18 basis elements and 37 critical pairs
      #|18 basis elements and 36 critical pairs
      #|18 basis elements and 35 critical pairs
      #|18 basis elements and 34 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|18 basis elements and 26 critical pairs
      #|18 basis elements and 25 critical pairs
      #|18 basis elements and 24 critical pairs
      #|18 basis elements and 23 critical pairs
      #|19 basis elements and 30 critical pairs
      #|19 basis elements and 29 critical pairs
      #|19 basis elements and 28 critical pairs
      #|19 basis elements and 27 critical pairs
      #|19 basis elements and 26 critical pairs
      #|19 basis elements and 25 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|21 basis elements and 33 critical pairs
      #|21 basis elements and 32 critical pairs
      #|21 basis elements and 31 critical pairs
      #|21 basis elements and 30 critical pairs
      #|21 basis elements and 29 critical pairs
      #|21 basis elements and 28 critical pairs
      #|21 basis elements and 27 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|21 basis elements and 24 critical pairs
      #|21 basis elements and 23 critical pairs
      #|21 basis elements and 22 critical pairs
      #|21 basis elements and 21 critical pairs
      #|21 basis elements and 20 critical pairs
      #|22 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|9 basis elements and 5 critical pairs
      #|9 basis elements and 4 critical pairs
      #|9 basis elements and 3 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|10 basis elements and 4 critical pairs
      #|10 basis elements and 3 critical pairs
      #|11 basis elements and 5 critical pairs
      #|11 basis elements and 4 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|12 basis elements and 4 critical pairs
      #|12 basis elements and 3 critical pairs
      #|12 basis elements and 2 critical pairs
      #|12 basis elements and 1 critical pairs
      #|12 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|13 basis elements and 10 critical pairs
      #|13 basis elements and 9 critical pairs
      #|13 basis elements and 8 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|16 basis elements and 12 critical pairs
      #|16 basis elements and 11 critical pairs
      #|16 basis elements and 10 critical pairs
      #|16 basis elements and 9 critical pairs
      #|16 basis elements and 8 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 17 critical pairs
      #|18 basis elements and 16 critical pairs
      #|18 basis elements and 15 critical pairs
      #|19 basis elements and 22 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|20 basis elements and 25 critical pairs
      #|20 basis elements and 24 critical pairs
      #|20 basis elements and 23 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|21 basis elements and 24 critical pairs
      #|21 basis elements and 23 critical pairs
      #|21 basis elements and 22 critical pairs
      #|21 basis elements and 21 critical pairs
      #|21 basis elements and 20 critical pairs
      #|21 basis elements and 19 critical pairs
      #|21 basis elements and 18 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|22 basis elements and 18 critical pairs
      #|22 basis elements and 17 critical pairs
      #|22 basis elements and 16 critical pairs
      #|22 basis elements and 15 critical pairs
      #|22 basis elements and 14 critical pairs
      #|22 basis elements and 13 critical pairs
      #|22 basis elements and 12 critical pairs
      #|22 basis elements and 11 critical pairs
      #|22 basis elements and 10 critical pairs
      #|22 basis elements and 9 critical pairs
      #|22 basis elements and 8 critical pairs
      #|22 basis elements and 7 critical pairs
      #|23 basis elements and 11 critical pairs
      #|23 basis elements and 10 critical pairs
      #|23 basis elements and 9 critical pairs
      #|23 basis elements and 8 critical pairs
      #|23 basis elements and 7 critical pairs
      #|23 basis elements and 6 critical pairs
      #|24 basis elements and 17 critical pairs
      #|24 basis elements and 16 critical pairs
      #|24 basis elements and 15 critical pairs
      #|24 basis elements and 14 critical pairs
      #|24 basis elements and 13 critical pairs
      #|24 basis elements and 12 critical pairs
      #|24 basis elements and 11 critical pairs
      #|24 basis elements and 10 critical pairs
      #|25 basis elements and 16 critical pairs
      #|25 basis elements and 15 critical pairs
      #|25 basis elements and 14 critical pairs
      #|25 basis elements and 13 critical pairs
      #|25 basis elements and 12 critical pairs
      #|25 basis elements and 11 critical pairs
      #|26 basis elements and 19 critical pairs
      #|26 basis elements and 18 critical pairs
      #|26 basis elements and 17 critical pairs
      #|26 basis elements and 16 critical pairs
      #|26 basis elements and 15 critical pairs
      #|26 basis elements and 14 critical pairs
      #|26 basis elements and 13 critical pairs
      #|27 basis elements and 19 critical pairs
      #|27 basis elements and 18 critical pairs
      #|27 basis elements and 17 critical pairs
      #|27 basis elements and 16 critical pairs
      #|27 basis elements and 15 critical pairs
      #|27 basis elements and 14 critical pairs
      #|28 basis elements and 22 critical pairs
      #|28 basis elements and 21 critical pairs
      #|28 basis elements and 20 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|29 basis elements and 29 critical pairs
      #|29 basis elements and 28 critical pairs
      #|29 basis elements and 27 critical pairs
      #|29 basis elements and 26 critical pairs
      #|29 basis elements and 25 critical pairs
      #|29 basis elements and 24 critical pairs
      #|29 basis elements and 23 critical pairs
      #|29 basis elements and 22 critical pairs
      #|29 basis elements and 21 critical pairs
      #|29 basis elements and 20 critical pairs
      #|29 basis elements and 19 critical pairs
      #|29 basis elements and 18 critical pairs
      #|29 basis elements and 17 critical pairs
      #|29 basis elements and 16 critical pairs
      #|29 basis elements and 15 critical pairs
      #|29 basis elements and 14 critical pairs
      #|29 basis elements and 13 critical pairs
      #|29 basis elements and 12 critical pairs
      #|29 basis elements and 11 critical pairs
      #|29 basis elements and 10 critical pairs
      #|30 basis elements and 18 critical pairs
      #|30 basis elements and 17 critical pairs
      #|30 basis elements and 16 critical pairs
      #|30 basis elements and 15 critical pairs
      #|30 basis elements and 14 critical pairs
      #|30 basis elements and 13 critical pairs
      #|30 basis elements and 12 critical pairs
      #|30 basis elements and 11 critical pairs
      #|30 basis elements and 10 critical pairs
      #|30 basis elements and 9 critical pairs
      #|30 basis elements and 8 critical pairs
      #|30 basis elements and 7 critical pairs
      #|30 basis elements and 6 critical pairs
      #|30 basis elements and 5 critical pairs
      #|30 basis elements and 4 critical pairs
      #|30 basis elements and 3 critical pairs
      #|30 basis elements and 2 critical pairs
      #|30 basis elements and 1 critical pairs
      #|30 basis elements and 0 critical pairs
      #|11 basis elements and 7 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|14 basis elements and 14 critical pairs
      #|15 basis elements and 18 critical pairs
      #|16 basis elements and 25 critical pairs
      #|17 basis elements and 32 critical pairs
      #|18 basis elements and 36 critical pairs
      #|19 basis elements and 42 critical pairs
      #|20 basis elements and 49 critical pairs
      #|21 basis elements and 57 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|23 basis elements and 66 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|23 basis elements and 62 critical pairs
      #|23 basis elements and 61 critical pairs
      #|24 basis elements and 70 critical pairs
      #|25 basis elements and 79 critical pairs
      #|26 basis elements and 86 critical pairs
      #|26 basis elements and 85 critical pairs
      #|27 basis elements and 96 critical pairs
      #|27 basis elements and 95 critical pairs
      #|28 basis elements and 106 critical pairs
      #|28 basis elements and 105 critical pairs
      #|28 basis elements and 104 critical pairs
      #|28 basis elements and 103 critical pairs
      #|28 basis elements and 102 critical pairs
      #|28 basis elements and 101 critical pairs
      #|29 basis elements and 119 critical pairs
      #|30 basis elements and 128 critical pairs
      #|30 basis elements and 127 critical pairs
      #|31 basis elements and 146 critical pairs
      #|31 basis elements and 145 critical pairs
      #|31 basis elements and 144 critical pairs
      #|31 basis elements and 143 critical pairs
      #|31 basis elements and 142 critical pairs
      #|31 basis elements and 141 critical pairs
      #|31 basis elements and 140 critical pairs
      #|31 basis elements and 139 critical pairs
      #|31 basis elements and 138 critical pairs
      #|31 basis elements and 137 critical pairs
      #|31 basis elements and 136 critical pairs
      #|32 basis elements and 156 critical pairs
      #|33 basis elements and 177 critical pairs
      #|34 basis elements and 197 critical pairs
      #|35 basis elements and 216 critical pairs
      #|36 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 11 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|15 basis elements and 24 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|15 basis elements and 21 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|21 basis elements and 45 critical pairs
      #|22 basis elements and 50 critical pairs
      #|22 basis elements and 49 critical pairs
      #|22 basis elements and 48 critical pairs
      #|22 basis elements and 47 critical pairs
      #|22 basis elements and 46 critical pairs
      #|22 basis elements and 45 critical pairs
      #|22 basis elements and 44 critical pairs
      #|22 basis elements and 43 critical pairs
      #|22 basis elements and 42 critical pairs
      #|22 basis elements and 41 critical pairs
      #|22 basis elements and 40 critical pairs
      #|22 basis elements and 39 critical pairs
      #|22 basis elements and 38 critical pairs
      #|22 basis elements and 37 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|24 basis elements and 47 critical pairs
      #|24 basis elements and 46 critical pairs
      #|24 basis elements and 45 critical pairs
      #|24 basis elements and 44 critical pairs
      #|25 basis elements and 49 critical pairs
      #|26 basis elements and 58 critical pairs
      #|26 basis elements and 57 critical pairs
      #|26 basis elements and 56 critical pairs
      #|26 basis elements and 55 critical pairs
      #|26 basis elements and 54 critical pairs
      #|26 basis elements and 53 critical pairs
      #|26 basis elements and 52 critical pairs
      #|27 basis elements and 62 critical pairs
      #|27 basis elements and 61 critical pairs
      #|28 basis elements and 73 critical pairs
      #|28 basis elements and 72 critical pairs
      #|28 basis elements and 71 critical pairs
      #|28 basis elements and 70 critical pairs
      #|28 basis elements and 69 critical pairs
      #|29 basis elements and 80 critical pairs
      #|29 basis elements and 79 critical pairs
      #|29 basis elements and 78 critical pairs
      #|29 basis elements and 77 critical pairs
      #|29 basis elements and 76 critical pairs
      #|29 basis elements and 75 critical pairs
      #|29 basis elements and 74 critical pairs
      #|29 basis elements and 73 critical pairs
      #|29 basis elements and 72 critical pairs
      #|30 basis elements and 85 critical pairs
      #|30 basis elements and 84 critical pairs
      #|30 basis elements and 83 critical pairs
      #|30 basis elements and 82 critical pairs
      #|30 basis elements and 81 critical pairs
      #|30 basis elements and 80 critical pairs
      #|30 basis elements and 79 critical pairs
      #|30 basis elements and 78 critical pairs
      #|30 basis elements and 77 critical pairs
      #|30 basis elements and 76 critical pairs
      #|30 basis elements and 75 critical pairs
      #|30 basis elements and 74 critical pairs
      #|30 basis elements and 73 critical pairs
      #|30 basis elements and 72 critical pairs
      #|30 basis elements and 71 critical pairs
      #|31 basis elements and 79 critical pairs
      #|31 basis elements and 78 critical pairs
      #|31 basis elements and 77 critical pairs
      #|31 basis elements and 76 critical pairs
      #|31 basis elements and 75 critical pairs
      #|31 basis elements and 74 critical pairs
      #|31 basis elements and 73 critical pairs
      #|31 basis elements and 72 critical pairs
      #|31 basis elements and 71 critical pairs
      #|31 basis elements and 70 critical pairs
      #|31 basis elements and 69 critical pairs
      #|31 basis elements and 68 critical pairs
      #|31 basis elements and 67 critical pairs
      #|31 basis elements and 66 critical pairs
      #|31 basis elements and 65 critical pairs
      #|31 basis elements and 64 critical pairs
      #|31 basis elements and 63 critical pairs
      #|31 basis elements and 62 critical pairs
      #|31 basis elements and 61 critical pairs
      #|32 basis elements and 70 critical pairs
      #|32 basis elements and 69 critical pairs
      #|32 basis elements and 68 critical pairs
      #|32 basis elements and 67 critical pairs
      #|32 basis elements and 66 critical pairs
      #|32 basis elements and 65 critical pairs
      #|32 basis elements and 64 critical pairs
      #|32 basis elements and 63 critical pairs
      #|33 basis elements and 70 critical pairs
      #|33 basis elements and 69 critical pairs
      #|33 basis elements and 68 critical pairs
      #|33 basis elements and 67 critical pairs
      #|33 basis elements and 66 critical pairs
      #|33 basis elements and 65 critical pairs
      #|33 basis elements and 64 critical pairs
      #|33 basis elements and 63 critical pairs
      #|33 basis elements and 62 critical pairs
      #|33 basis elements and 61 critical pairs
      #|33 basis elements and 60 critical pairs
      #|33 basis elements and 59 critical pairs
      #|33 basis elements and 58 critical pairs
      #|33 basis elements and 57 critical pairs
      #|33 basis elements and 56 critical pairs
      #|33 basis elements and 55 critical pairs
      #|33 basis elements and 54 critical pairs
      #|33 basis elements and 53 critical pairs
      #|33 basis elements and 52 critical pairs
      #|33 basis elements and 51 critical pairs
      #|33 basis elements and 50 critical pairs
      #|33 basis elements and 49 critical pairs
      #|33 basis elements and 48 critical pairs
      #|33 basis elements and 47 critical pairs
      #|33 basis elements and 46 critical pairs
      #|33 basis elements and 45 critical pairs
      #|33 basis elements and 44 critical pairs
      #|33 basis elements and 43 critical pairs
      #|33 basis elements and 42 critical pairs
      #|33 basis elements and 41 critical pairs
      #|33 basis elements and 40 critical pairs
      #|33 basis elements and 39 critical pairs
      #|34 basis elements and 45 critical pairs
      #|34 basis elements and 44 critical pairs
      #|34 basis elements and 43 critical pairs
      #|35 basis elements and 52 critical pairs
      #|36 basis elements and 61 critical pairs
      #|36 basis elements and 60 critical pairs
      #|36 basis elements and 59 critical pairs
      #|36 basis elements and 58 critical pairs
      #|36 basis elements and 57 critical pairs
      #|36 basis elements and 56 critical pairs
      #|36 basis elements and 55 critical pairs
      #|36 basis elements and 54 critical pairs
      #|36 basis elements and 53 critical pairs
      #|36 basis elements and 52 critical pairs
      #|36 basis elements and 51 critical pairs
      #|36 basis elements and 50 critical pairs
      #|36 basis elements and 49 critical pairs
      #|36 basis elements and 48 critical pairs
      #|36 basis elements and 47 critical pairs
      #|36 basis elements and 46 critical pairs
      #|36 basis elements and 45 critical pairs
      #|36 basis elements and 44 critical pairs
      #|36 basis elements and 43 critical pairs
      #|36 basis elements and 42 critical pairs
      #|36 basis elements and 41 critical pairs
      #|36 basis elements and 40 critical pairs
      #|36 basis elements and 39 critical pairs
      #|36 basis elements and 38 critical pairs
      #|36 basis elements and 37 critical pairs
      #|36 basis elements and 36 critical pairs
      #|36 basis elements and 35 critical pairs
      #|36 basis elements and 34 critical pairs
      #|36 basis elements and 33 critical pairs
      #|37 basis elements and 43 critical pairs
      #|37 basis elements and 42 critical pairs
      #|37 basis elements and 41 critical pairs
      #|37 basis elements and 40 critical pairs
      #|37 basis elements and 39 critical pairs
      #|37 basis elements and 38 critical pairs
      #|37 basis elements and 37 critical pairs
      #|37 basis elements and 36 critical pairs
      #|37 basis elements and 35 critical pairs
      #|37 basis elements and 34 critical pairs
      #|37 basis elements and 33 critical pairs
      #|37 basis elements and 32 critical pairs
      #|38 basis elements and 38 critical pairs
      #|38 basis elements and 37 critical pairs
      #|38 basis elements and 36 critical pairs
      #|38 basis elements and 35 critical pairs
      #|38 basis elements and 34 critical pairs
      #|38 basis elements and 33 critical pairs
      #|38 basis elements and 32 critical pairs
      #|38 basis elements and 31 critical pairs
      #|38 basis elements and 30 critical pairs
      #|38 basis elements and 29 critical pairs
      #|38 basis elements and 28 critical pairs
      #|38 basis elements and 27 critical pairs
      #|38 basis elements and 26 critical pairs
      #|38 basis elements and 25 critical pairs
      #|38 basis elements and 24 critical pairs
      #|38 basis elements and 23 critical pairs
      #|38 basis elements and 22 critical pairs
      #|38 basis elements and 21 critical pairs
      #|38 basis elements and 20 critical pairs
      #|38 basis elements and 19 critical pairs
      #|38 basis elements and 18 critical pairs
      #|38 basis elements and 17 critical pairs
      #|38 basis elements and 16 critical pairs
      #|38 basis elements and 15 critical pairs
      #|38 basis elements and 14 critical pairs
      #|38 basis elements and 13 critical pairs
      #|38 basis elements and 12 critical pairs
      #|38 basis elements and 11 critical pairs
      #|38 basis elements and 10 critical pairs
      #|38 basis elements and 9 critical pairs
      #|39 basis elements and 13 critical pairs
      #|39 basis elements and 12 critical pairs
      #|39 basis elements and 11 critical pairs
      #|39 basis elements and 10 critical pairs
      #|39 basis elements and 9 critical pairs
      #|39 basis elements and 8 critical pairs
      #|40 basis elements and 22 critical pairs
      #|40 basis elements and 21 critical pairs
      #|40 basis elements and 20 critical pairs
      #|40 basis elements and 19 critical pairs
      #|40 basis elements and 18 critical pairs
      #|40 basis elements and 17 critical pairs
      #|40 basis elements and 16 critical pairs
      #|40 basis elements and 15 critical pairs
      #|40 basis elements and 14 critical pairs
      #|40 basis elements and 13 critical pairs
      #|41 basis elements and 19 critical pairs
      #|41 basis elements and 18 critical pairs
      #|41 basis elements and 17 critical pairs
      #|41 basis elements and 16 critical pairs
      #|41 basis elements and 15 critical pairs
      #|41 basis elements and 14 critical pairs
      #|42 basis elements and 24 critical pairs
      #|42 basis elements and 23 critical pairs
      #|42 basis elements and 22 critical pairs
      #|42 basis elements and 21 critical pairs
      #|42 basis elements and 20 critical pairs
      #|42 basis elements and 19 critical pairs
      #|42 basis elements and 18 critical pairs
      #|42 basis elements and 17 critical pairs
      #|42 basis elements and 16 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|45 basis elements and 35 critical pairs
      #|45 basis elements and 34 critical pairs
      #|45 basis elements and 33 critical pairs
      #|45 basis elements and 32 critical pairs
      #|45 basis elements and 31 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|45 basis elements and 18 critical pairs
      #|45 basis elements and 17 critical pairs
      #|45 basis elements and 16 critical pairs
      #|45 basis elements and 15 critical pairs
      #|45 basis elements and 14 critical pairs
      #|45 basis elements and 13 critical pairs
      #|45 basis elements and 12 critical pairs
      #|45 basis elements and 11 critical pairs
      #|46 basis elements and 19 critical pairs
      #|46 basis elements and 18 critical pairs
      #|46 basis elements and 17 critical pairs
      #|46 basis elements and 16 critical pairs
      #|46 basis elements and 15 critical pairs
      #|46 basis elements and 14 critical pairs
      #|46 basis elements and 13 critical pairs
      #|46 basis elements and 12 critical pairs
      #|46 basis elements and 11 critical pairs
      #|46 basis elements and 10 critical pairs
      #|46 basis elements and 9 critical pairs
      #|46 basis elements and 8 critical pairs
      #|46 basis elements and 7 critical pairs
      #|46 basis elements and 6 critical pairs
      #|46 basis elements and 5 critical pairs
      #|46 basis elements and 4 critical pairs
      #|46 basis elements and 3 critical pairs
      #|46 basis elements and 2 critical pairs
      #|46 basis elements and 1 critical pairs
      #|46 basis elements and 0 critical pairs
      #|11 basis elements and 9 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|14 basis elements and 15 critical pairs
      #|15 basis elements and 18 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 30 critical pairs
      #|18 basis elements and 34 critical pairs
      #|19 basis elements and 39 critical pairs
      #|20 basis elements and 45 critical pairs
      #|21 basis elements and 53 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|22 basis elements and 58 critical pairs
      #|22 basis elements and 57 critical pairs
      #|22 basis elements and 56 critical pairs
      #|22 basis elements and 55 critical pairs
      #|23 basis elements and 61 critical pairs
      #|23 basis elements and 60 critical pairs
      #|23 basis elements and 59 critical pairs
      #|23 basis elements and 58 critical pairs
      #|23 basis elements and 57 critical pairs
      #|23 basis elements and 56 critical pairs
      #|24 basis elements and 64 critical pairs
      #|25 basis elements and 72 critical pairs
      #|26 basis elements and 79 critical pairs
      #|26 basis elements and 78 critical pairs
      #|27 basis elements and 88 critical pairs
      #|27 basis elements and 87 critical pairs
      #|28 basis elements and 97 critical pairs
      #|28 basis elements and 96 critical pairs
      #|28 basis elements and 95 critical pairs
      #|28 basis elements and 94 critical pairs
      #|28 basis elements and 93 critical pairs
      #|28 basis elements and 92 critical pairs
      #|29 basis elements and 109 critical pairs
      #|30 basis elements and 118 critical pairs
      #|30 basis elements and 117 critical pairs
      #|31 basis elements and 135 critical pairs
      #|31 basis elements and 134 critical pairs
      #|31 basis elements and 133 critical pairs
      #|31 basis elements and 132 critical pairs
      #|31 basis elements and 131 critical pairs
      #|31 basis elements and 130 critical pairs
      #|31 basis elements and 129 critical pairs
      #|31 basis elements and 128 critical pairs
      #|31 basis elements and 127 critical pairs
      #|31 basis elements and 126 critical pairs
      #|31 basis elements and 125 critical pairs
      #|32 basis elements and 144 critical pairs
      #|33 basis elements and 164 critical pairs
      #|34 basis elements and 183 critical pairs
      #|35 basis elements and 201 critical pairs
      #|36 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|11 basis elements and 11 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|15 basis elements and 24 critical pairs
      #|15 basis elements and 23 critical pairs
      #|15 basis elements and 22 critical pairs
      #|15 basis elements and 21 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|20 basis elements and 36 critical pairs
      #|21 basis elements and 45 critical pairs
      #|22 basis elements and 50 critical pairs
      #|22 basis elements and 49 critical pairs
      #|22 basis elements and 48 critical pairs
      #|22 basis elements and 47 critical pairs
      #|22 basis elements and 46 critical pairs
      #|22 basis elements and 45 critical pairs
      #|22 basis elements and 44 critical pairs
      #|22 basis elements and 43 critical pairs
      #|22 basis elements and 42 critical pairs
      #|22 basis elements and 41 critical pairs
      #|22 basis elements and 40 critical pairs
      #|22 basis elements and 39 critical pairs
      #|22 basis elements and 38 critical pairs
      #|22 basis elements and 37 critical pairs
      #|23 basis elements and 42 critical pairs
      #|23 basis elements and 41 critical pairs
      #|23 basis elements and 40 critical pairs
      #|24 basis elements and 47 critical pairs
      #|24 basis elements and 46 critical pairs
      #|24 basis elements and 45 critical pairs
      #|24 basis elements and 44 critical pairs
      #|25 basis elements and 49 critical pairs
      #|26 basis elements and 58 critical pairs
      #|26 basis elements and 57 critical pairs
      #|26 basis elements and 56 critical pairs
      #|26 basis elements and 55 critical pairs
      #|26 basis elements and 54 critical pairs
      #|26 basis elements and 53 critical pairs
      #|26 basis elements and 52 critical pairs
      #|27 basis elements and 62 critical pairs
      #|27 basis elements and 61 critical pairs
      #|28 basis elements and 73 critical pairs
      #|28 basis elements and 72 critical pairs
      #|28 basis elements and 71 critical pairs
      #|28 basis elements and 70 critical pairs
      #|28 basis elements and 69 critical pairs
      #|29 basis elements and 80 critical pairs
      #|29 basis elements and 79 critical pairs
      #|29 basis elements and 78 critical pairs
      #|29 basis elements and 77 critical pairs
      #|29 basis elements and 76 critical pairs
      #|29 basis elements and 75 critical pairs
      #|29 basis elements and 74 critical pairs
      #|29 basis elements and 73 critical pairs
      #|29 basis elements and 72 critical pairs
      #|30 basis elements and 85 critical pairs
      #|30 basis elements and 84 critical pairs
      #|30 basis elements and 83 critical pairs
      #|30 basis elements and 82 critical pairs
      #|30 basis elements and 81 critical pairs
      #|30 basis elements and 80 critical pairs
      #|30 basis elements and 79 critical pairs
      #|30 basis elements and 78 critical pairs
      #|30 basis elements and 77 critical pairs
      #|30 basis elements and 76 critical pairs
      #|30 basis elements and 75 critical pairs
      #|30 basis elements and 74 critical pairs
      #|30 basis elements and 73 critical pairs
      #|30 basis elements and 72 critical pairs
      #|30 basis elements and 71 critical pairs
      #|31 basis elements and 79 critical pairs
      #|31 basis elements and 78 critical pairs
      #|31 basis elements and 77 critical pairs
      #|31 basis elements and 76 critical pairs
      #|31 basis elements and 75 critical pairs
      #|31 basis elements and 74 critical pairs
      #|31 basis elements and 73 critical pairs
      #|31 basis elements and 72 critical pairs
      #|31 basis elements and 71 critical pairs
      #|31 basis elements and 70 critical pairs
      #|31 basis elements and 69 critical pairs
      #|31 basis elements and 68 critical pairs
      #|31 basis elements and 67 critical pairs
      #|31 basis elements and 66 critical pairs
      #|31 basis elements and 65 critical pairs
      #|31 basis elements and 64 critical pairs
      #|31 basis elements and 63 critical pairs
      #|31 basis elements and 62 critical pairs
      #|31 basis elements and 61 critical pairs
      #|32 basis elements and 70 critical pairs
      #|32 basis elements and 69 critical pairs
      #|32 basis elements and 68 critical pairs
      #|32 basis elements and 67 critical pairs
      #|32 basis elements and 66 critical pairs
      #|32 basis elements and 65 critical pairs
      #|32 basis elements and 64 critical pairs
      #|32 basis elements and 63 critical pairs
      #|33 basis elements and 70 critical pairs
      #|33 basis elements and 69 critical pairs
      #|33 basis elements and 68 critical pairs
      #|33 basis elements and 67 critical pairs
      #|33 basis elements and 66 critical pairs
      #|33 basis elements and 65 critical pairs
      #|33 basis elements and 64 critical pairs
      #|33 basis elements and 63 critical pairs
      #|33 basis elements and 62 critical pairs
      #|33 basis elements and 61 critical pairs
      #|33 basis elements and 60 critical pairs
      #|33 basis elements and 59 critical pairs
      #|33 basis elements and 58 critical pairs
      #|33 basis elements and 57 critical pairs
      #|33 basis elements and 56 critical pairs
      #|33 basis elements and 55 critical pairs
      #|33 basis elements and 54 critical pairs
      #|33 basis elements and 53 critical pairs
      #|33 basis elements and 52 critical pairs
      #|33 basis elements and 51 critical pairs
      #|33 basis elements and 50 critical pairs
      #|33 basis elements and 49 critical pairs
      #|33 basis elements and 48 critical pairs
      #|33 basis elements and 47 critical pairs
      #|33 basis elements and 46 critical pairs
      #|33 basis elements and 45 critical pairs
      #|33 basis elements and 44 critical pairs
      #|33 basis elements and 43 critical pairs
      #|33 basis elements and 42 critical pairs
      #|33 basis elements and 41 critical pairs
      #|33 basis elements and 40 critical pairs
      #|33 basis elements and 39 critical pairs
      #|34 basis elements and 45 critical pairs
      #|34 basis elements and 44 critical pairs
      #|34 basis elements and 43 critical pairs
      #|35 basis elements and 52 critical pairs
      #|36 basis elements and 61 critical pairs
      #|36 basis elements and 60 critical pairs
      #|36 basis elements and 59 critical pairs
      #|36 basis elements and 58 critical pairs
      #|36 basis elements and 57 critical pairs
      #|36 basis elements and 56 critical pairs
      #|36 basis elements and 55 critical pairs
      #|36 basis elements and 54 critical pairs
      #|36 basis elements and 53 critical pairs
      #|36 basis elements and 52 critical pairs
      #|36 basis elements and 51 critical pairs
      #|36 basis elements and 50 critical pairs
      #|36 basis elements and 49 critical pairs
      #|36 basis elements and 48 critical pairs
      #|36 basis elements and 47 critical pairs
      #|36 basis elements and 46 critical pairs
      #|36 basis elements and 45 critical pairs
      #|36 basis elements and 44 critical pairs
      #|36 basis elements and 43 critical pairs
      #|36 basis elements and 42 critical pairs
      #|36 basis elements and 41 critical pairs
      #|36 basis elements and 40 critical pairs
      #|36 basis elements and 39 critical pairs
      #|36 basis elements and 38 critical pairs
      #|36 basis elements and 37 critical pairs
      #|36 basis elements and 36 critical pairs
      #|36 basis elements and 35 critical pairs
      #|36 basis elements and 34 critical pairs
      #|36 basis elements and 33 critical pairs
      #|37 basis elements and 43 critical pairs
      #|37 basis elements and 42 critical pairs
      #|37 basis elements and 41 critical pairs
      #|37 basis elements and 40 critical pairs
      #|37 basis elements and 39 critical pairs
      #|37 basis elements and 38 critical pairs
      #|37 basis elements and 37 critical pairs
      #|37 basis elements and 36 critical pairs
      #|37 basis elements and 35 critical pairs
      #|37 basis elements and 34 critical pairs
      #|37 basis elements and 33 critical pairs
      #|37 basis elements and 32 critical pairs
      #|38 basis elements and 38 critical pairs
      #|38 basis elements and 37 critical pairs
      #|38 basis elements and 36 critical pairs
      #|38 basis elements and 35 critical pairs
      #|38 basis elements and 34 critical pairs
      #|38 basis elements and 33 critical pairs
      #|38 basis elements and 32 critical pairs
      #|38 basis elements and 31 critical pairs
      #|38 basis elements and 30 critical pairs
      #|38 basis elements and 29 critical pairs
      #|38 basis elements and 28 critical pairs
      #|38 basis elements and 27 critical pairs
      #|38 basis elements and 26 critical pairs
      #|38 basis elements and 25 critical pairs
      #|38 basis elements and 24 critical pairs
      #|38 basis elements and 23 critical pairs
      #|38 basis elements and 22 critical pairs
      #|38 basis elements and 21 critical pairs
      #|38 basis elements and 20 critical pairs
      #|38 basis elements and 19 critical pairs
      #|38 basis elements and 18 critical pairs
      #|38 basis elements and 17 critical pairs
      #|38 basis elements and 16 critical pairs
      #|38 basis elements and 15 critical pairs
      #|38 basis elements and 14 critical pairs
      #|38 basis elements and 13 critical pairs
      #|38 basis elements and 12 critical pairs
      #|38 basis elements and 11 critical pairs
      #|38 basis elements and 10 critical pairs
      #|38 basis elements and 9 critical pairs
      #|39 basis elements and 13 critical pairs
      #|39 basis elements and 12 critical pairs
      #|39 basis elements and 11 critical pairs
      #|39 basis elements and 10 critical pairs
      #|39 basis elements and 9 critical pairs
      #|39 basis elements and 8 critical pairs
      #|40 basis elements and 22 critical pairs
      #|40 basis elements and 21 critical pairs
      #|40 basis elements and 20 critical pairs
      #|40 basis elements and 19 critical pairs
      #|40 basis elements and 18 critical pairs
      #|40 basis elements and 17 critical pairs
      #|40 basis elements and 16 critical pairs
      #|40 basis elements and 15 critical pairs
      #|40 basis elements and 14 critical pairs
      #|40 basis elements and 13 critical pairs
      #|41 basis elements and 19 critical pairs
      #|41 basis elements and 18 critical pairs
      #|41 basis elements and 17 critical pairs
      #|41 basis elements and 16 critical pairs
      #|41 basis elements and 15 critical pairs
      #|41 basis elements and 14 critical pairs
      #|42 basis elements and 24 critical pairs
      #|42 basis elements and 23 critical pairs
      #|42 basis elements and 22 critical pairs
      #|42 basis elements and 21 critical pairs
      #|42 basis elements and 20 critical pairs
      #|42 basis elements and 19 critical pairs
      #|42 basis elements and 18 critical pairs
      #|42 basis elements and 17 critical pairs
      #|42 basis elements and 16 critical pairs
      #|43 basis elements and 22 critical pairs
      #|43 basis elements and 21 critical pairs
      #|43 basis elements and 20 critical pairs
      #|43 basis elements and 19 critical pairs
      #|43 basis elements and 18 critical pairs
      #|43 basis elements and 17 critical pairs
      #|44 basis elements and 27 critical pairs
      #|44 basis elements and 26 critical pairs
      #|44 basis elements and 25 critical pairs
      #|44 basis elements and 24 critical pairs
      #|44 basis elements and 23 critical pairs
      #|44 basis elements and 22 critical pairs
      #|44 basis elements and 21 critical pairs
      #|44 basis elements and 20 critical pairs
      #|45 basis elements and 35 critical pairs
      #|45 basis elements and 34 critical pairs
      #|45 basis elements and 33 critical pairs
      #|45 basis elements and 32 critical pairs
      #|45 basis elements and 31 critical pairs
      #|45 basis elements and 30 critical pairs
      #|45 basis elements and 29 critical pairs
      #|45 basis elements and 28 critical pairs
      #|45 basis elements and 27 critical pairs
      #|45 basis elements and 26 critical pairs
      #|45 basis elements and 25 critical pairs
      #|45 basis elements and 24 critical pairs
      #|45 basis elements and 23 critical pairs
      #|45 basis elements and 22 critical pairs
      #|45 basis elements and 21 critical pairs
      #|45 basis elements and 20 critical pairs
      #|45 basis elements and 19 critical pairs
      #|45 basis elements and 18 critical pairs
      #|45 basis elements and 17 critical pairs
      #|45 basis elements and 16 critical pairs
      #|45 basis elements and 15 critical pairs
      #|45 basis elements and 14 critical pairs
      #|45 basis elements and 13 critical pairs
      #|45 basis elements and 12 critical pairs
      #|45 basis elements and 11 critical pairs
      #|46 basis elements and 19 critical pairs
      #|46 basis elements and 18 critical pairs
      #|46 basis elements and 17 critical pairs
      #|46 basis elements and 16 critical pairs
      #|46 basis elements and 15 critical pairs
      #|46 basis elements and 14 critical pairs
      #|46 basis elements and 13 critical pairs
      #|46 basis elements and 12 critical pairs
      #|46 basis elements and 11 critical pairs
      #|46 basis elements and 10 critical pairs
      #|46 basis elements and 9 critical pairs
      #|46 basis elements and 8 critical pairs
      #|46 basis elements and 7 critical pairs
      #|46 basis elements and 6 critical pairs
      #|46 basis elements and 5 critical pairs
      #|46 basis elements and 4 critical pairs
      #|46 basis elements and 3 critical pairs
      #|46 basis elements and 2 critical pairs
      #|46 basis elements and 1 critical pairs
      #|46 basis elements and 0 critical pairs
      #|11 basis elements and 8 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|14 basis elements and 15 critical pairs
      #|15 basis elements and 19 critical pairs
      #|16 basis elements and 26 critical pairs
      #|17 basis elements and 33 critical pairs
      #|18 basis elements and 37 critical pairs
      #|19 basis elements and 43 critical pairs
      #|20 basis elements and 50 critical pairs
      #|21 basis elements and 58 critical pairs
      #|22 basis elements and 65 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|23 basis elements and 67 critical pairs
      #|24 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
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
      #|13 basis elements and 8 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|16 basis elements and 9 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|17 basis elements and 9 critical pairs
      #|18 basis elements and 10 critical pairs
      #|18 basis elements and 9 critical pairs
      #|18 basis elements and 8 critical pairs
      #|18 basis elements and 7 critical pairs
      #|18 basis elements and 6 critical pairs
      #|18 basis elements and 5 critical pairs
      #|18 basis elements and 4 critical pairs
      #|18 basis elements and 3 critical pairs
      #|18 basis elements and 2 critical pairs
      #|18 basis elements and 1 critical pairs
      #|18 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|13 basis elements and 8 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|16 basis elements and 9 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|17 basis elements and 9 critical pairs
      #|18 basis elements and 10 critical pairs
      #|18 basis elements and 9 critical pairs
      #|18 basis elements and 8 critical pairs
      #|18 basis elements and 7 critical pairs
      #|18 basis elements and 6 critical pairs
      #|18 basis elements and 5 critical pairs
      #|18 basis elements and 4 critical pairs
      #|18 basis elements and 3 critical pairs
      #|18 basis elements and 2 critical pairs
      #|18 basis elements and 1 critical pairs
      #|18 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|13 basis elements and 8 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|16 basis elements and 9 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|17 basis elements and 9 critical pairs
      #|18 basis elements and 10 critical pairs
      #|18 basis elements and 9 critical pairs
      #|18 basis elements and 8 critical pairs
      #|18 basis elements and 7 critical pairs
      #|18 basis elements and 6 critical pairs
      #|18 basis elements and 5 critical pairs
      #|18 basis elements and 4 critical pairs
      #|18 basis elements and 3 critical pairs
      #|18 basis elements and 2 critical pairs
      #|18 basis elements and 1 critical pairs
      #|18 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|13 basis elements and 7 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|15 basis elements and 7 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
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
      #|13 basis elements and 7 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|15 basis elements and 7 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
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
      #|13 basis elements and 7 critical pairs
      #|14 basis elements and 8 critical pairs
      #|15 basis elements and 8 critical pairs
      #|15 basis elements and 7 critical pairs
      #|16 basis elements and 8 critical pairs
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
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
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|9 basis elements and 3 critical pairs
      #|9 basis elements and 2 critical pairs
      #|9 basis elements and 1 critical pairs
      #|9 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 19 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 35 critical pairs
      #|16 basis elements and 43 critical pairs
      #|16 basis elements and 42 critical pairs
      #|16 basis elements and 41 critical pairs
      #|17 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 35 critical pairs
      #|16 basis elements and 43 critical pairs
      #|16 basis elements and 42 critical pairs
      #|16 basis elements and 41 critical pairs
      #|17 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|9 basis elements and 3 critical pairs
      #|9 basis elements and 2 critical pairs
      #|9 basis elements and 1 critical pairs
      #|9 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 19 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 35 critical pairs
      #|16 basis elements and 43 critical pairs
      #|16 basis elements and 42 critical pairs
      #|16 basis elements and 41 critical pairs
      #|17 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|14 basis elements and 9 critical pairs
      #|14 basis elements and 8 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 6 critical pairs
      #|8 basis elements and 5 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 35 critical pairs
      #|16 basis elements and 43 critical pairs
      #|16 basis elements and 42 critical pairs
      #|16 basis elements and 41 critical pairs
      #|17 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|9 basis elements and 6 critical pairs
      #|9 basis elements and 5 critical pairs
      #|10 basis elements and 7 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|14 basis elements and 16 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|14 basis elements and 11 critical pairs
      #|14 basis elements and 10 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|15 basis elements and 10 critical pairs
      #|15 basis elements and 9 critical pairs
      #|15 basis elements and 8 critical pairs
      #|15 basis elements and 7 critical pairs
      #|15 basis elements and 6 critical pairs
      #|15 basis elements and 5 critical pairs
      #|15 basis elements and 4 critical pairs
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
      #|16 basis elements and 5 critical pairs
      #|16 basis elements and 4 critical pairs
      #|16 basis elements and 3 critical pairs
      #|17 basis elements and 11 critical pairs
      #|17 basis elements and 10 critical pairs
      #|17 basis elements and 9 critical pairs
      #|17 basis elements and 8 critical pairs
      #|17 basis elements and 7 critical pairs
      #|17 basis elements and 6 critical pairs
      #|18 basis elements and 11 critical pairs
      #|18 basis elements and 10 critical pairs
      #|18 basis elements and 9 critical pairs
      #|18 basis elements and 8 critical pairs
      #|18 basis elements and 7 critical pairs
      #|18 basis elements and 6 critical pairs
      #|18 basis elements and 5 critical pairs
      #|18 basis elements and 4 critical pairs
      #|18 basis elements and 3 critical pairs
      #|18 basis elements and 2 critical pairs
      #|18 basis elements and 1 critical pairs
      #|18 basis elements and 0 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 14 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 20 critical pairs
      #|14 basis elements and 22 critical pairs
      #|15 basis elements and 26 critical pairs
      #|16 basis elements and 31 critical pairs
      #|17 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|9 basis elements and 11 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 23 critical pairs
      #|14 basis elements and 28 critical pairs
      #|14 basis elements and 27 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 30 critical pairs
      #|15 basis elements and 29 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|18 basis elements and 39 critical pairs
      #|18 basis elements and 38 critical pairs
      #|18 basis elements and 37 critical pairs
      #|19 basis elements and 41 critical pairs
      #|20 basis elements and 49 critical pairs
      #|20 basis elements and 48 critical pairs
      #|20 basis elements and 47 critical pairs
      #|20 basis elements and 46 critical pairs
      #|20 basis elements and 45 critical pairs
      #|20 basis elements and 44 critical pairs
      #|21 basis elements and 53 critical pairs
      #|21 basis elements and 52 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|22 basis elements and 58 critical pairs
      #|22 basis elements and 57 critical pairs
      #|22 basis elements and 56 critical pairs
      #|22 basis elements and 55 critical pairs
      #|22 basis elements and 54 critical pairs
      #|22 basis elements and 53 critical pairs
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
      #|24 basis elements and 43 critical pairs
      #|24 basis elements and 42 critical pairs
      #|24 basis elements and 41 critical pairs
      #|24 basis elements and 40 critical pairs
      #|24 basis elements and 39 critical pairs
      #|24 basis elements and 38 critical pairs
      #|24 basis elements and 37 critical pairs
      #|25 basis elements and 44 critical pairs
      #|25 basis elements and 43 critical pairs
      #|25 basis elements and 42 critical pairs
      #|25 basis elements and 41 critical pairs
      #|25 basis elements and 40 critical pairs
      #|25 basis elements and 39 critical pairs
      #|25 basis elements and 38 critical pairs
      #|25 basis elements and 37 critical pairs
      #|25 basis elements and 36 critical pairs
      #|25 basis elements and 35 critical pairs
      #|25 basis elements and 34 critical pairs
      #|25 basis elements and 33 critical pairs
      #|25 basis elements and 32 critical pairs
      #|25 basis elements and 31 critical pairs
      #|26 basis elements and 36 critical pairs
      #|26 basis elements and 35 critical pairs
      #|26 basis elements and 34 critical pairs
      #|27 basis elements and 41 critical pairs
      #|27 basis elements and 40 critical pairs
      #|27 basis elements and 39 critical pairs
      #|27 basis elements and 38 critical pairs
      #|27 basis elements and 37 critical pairs
      #|27 basis elements and 36 critical pairs
      #|27 basis elements and 35 critical pairs
      #|27 basis elements and 34 critical pairs
      #|27 basis elements and 33 critical pairs
      #|27 basis elements and 32 critical pairs
      #|27 basis elements and 31 critical pairs
      #|27 basis elements and 30 critical pairs
      #|27 basis elements and 29 critical pairs
      #|27 basis elements and 28 critical pairs
      #|27 basis elements and 27 critical pairs
      #|27 basis elements and 26 critical pairs
      #|27 basis elements and 25 critical pairs
      #|27 basis elements and 24 critical pairs
      #|27 basis elements and 23 critical pairs
      #|27 basis elements and 22 critical pairs
      #|27 basis elements and 21 critical pairs
      #|27 basis elements and 20 critical pairs
      #|28 basis elements and 28 critical pairs
      #|28 basis elements and 27 critical pairs
      #|28 basis elements and 26 critical pairs
      #|28 basis elements and 25 critical pairs
      #|28 basis elements and 24 critical pairs
      #|28 basis elements and 23 critical pairs
      #|28 basis elements and 22 critical pairs
      #|28 basis elements and 21 critical pairs
      #|28 basis elements and 20 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|28 basis elements and 16 critical pairs
      #|28 basis elements and 15 critical pairs
      #|28 basis elements and 14 critical pairs
      #|28 basis elements and 13 critical pairs
      #|28 basis elements and 12 critical pairs
      #|28 basis elements and 11 critical pairs
      #|28 basis elements and 10 critical pairs
      #|28 basis elements and 9 critical pairs
      #|28 basis elements and 8 critical pairs
      #|28 basis elements and 7 critical pairs
      #|28 basis elements and 6 critical pairs
      #|29 basis elements and 9 critical pairs
      #|29 basis elements and 8 critical pairs
      #|29 basis elements and 7 critical pairs
      #|29 basis elements and 6 critical pairs
      #|29 basis elements and 5 critical pairs
      #|30 basis elements and 16 critical pairs
      #|30 basis elements and 15 critical pairs
      #|30 basis elements and 14 critical pairs
      #|30 basis elements and 13 critical pairs
      #|30 basis elements and 12 critical pairs
      #|30 basis elements and 11 critical pairs
      #|30 basis elements and 10 critical pairs
      #|30 basis elements and 9 critical pairs
      #|31 basis elements and 14 critical pairs
      #|31 basis elements and 13 critical pairs
      #|31 basis elements and 12 critical pairs
      #|31 basis elements and 11 critical pairs
      #|31 basis elements and 10 critical pairs
      #|31 basis elements and 9 critical pairs
      #|31 basis elements and 8 critical pairs
      #|31 basis elements and 7 critical pairs
      #|31 basis elements and 6 critical pairs
      #|31 basis elements and 5 critical pairs
      #|31 basis elements and 4 critical pairs
      #|31 basis elements and 3 critical pairs
      #|31 basis elements and 2 critical pairs
      #|31 basis elements and 1 critical pairs
      #|31 basis elements and 0 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 13 critical pairs
      #|12 basis elements and 16 critical pairs
      #|13 basis elements and 19 critical pairs
      #|14 basis elements and 22 critical pairs
      #|15 basis elements and 25 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|17 basis elements and 32 critical pairs
      #|17 basis elements and 31 critical pairs
      #|18 basis elements and 39 critical pairs
      #|18 basis elements and 38 critical pairs
      #|19 basis elements and 46 critical pairs
      #|19 basis elements and 45 critical pairs
      #|19 basis elements and 44 critical pairs
      #|19 basis elements and 43 critical pairs
      #|19 basis elements and 42 critical pairs
      #|20 basis elements and 54 critical pairs
      #|20 basis elements and 53 critical pairs
      #|21 basis elements and 61 critical pairs
      #|21 basis elements and 60 critical pairs
      #|22 basis elements and 73 critical pairs
      #|22 basis elements and 72 critical pairs
      #|22 basis elements and 71 critical pairs
      #|22 basis elements and 70 critical pairs
      #|22 basis elements and 69 critical pairs
      #|22 basis elements and 68 critical pairs
      #|22 basis elements and 67 critical pairs
      #|22 basis elements and 66 critical pairs
      #|22 basis elements and 65 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|23 basis elements and 76 critical pairs
      #|24 basis elements and 90 critical pairs
      #|24 basis elements and 89 critical pairs
      #|24 basis elements and 88 critical pairs
      #|24 basis elements and 87 critical pairs
      #|24 basis elements and 86 critical pairs
      #|24 basis elements and 85 critical pairs
      #|24 basis elements and 84 critical pairs
      #|24 basis elements and 83 critical pairs
      #|24 basis elements and 82 critical pairs
      #|24 basis elements and 81 critical pairs
      #|25 basis elements and 91 critical pairs
      #|25 basis elements and 90 critical pairs
      #|25 basis elements and 89 critical pairs
      #|25 basis elements and 88 critical pairs
      #|25 basis elements and 87 critical pairs
      #|25 basis elements and 86 critical pairs
      #|25 basis elements and 85 critical pairs
      #|25 basis elements and 84 critical pairs
      #|25 basis elements and 83 critical pairs
      #|25 basis elements and 82 critical pairs
      #|25 basis elements and 81 critical pairs
      #|25 basis elements and 80 critical pairs
      #|25 basis elements and 79 critical pairs
      #|25 basis elements and 78 critical pairs
      #|25 basis elements and 77 critical pairs
      #|25 basis elements and 76 critical pairs
      #|25 basis elements and 75 critical pairs
      #|26 basis elements and 88 critical pairs
      #|27 basis elements and 104 critical pairs
      #|27 basis elements and 103 critical pairs
      #|27 basis elements and 102 critical pairs
      #|27 basis elements and 101 critical pairs
      #|27 basis elements and 100 critical pairs
      #|27 basis elements and 99 critical pairs
      #|27 basis elements and 98 critical pairs
      #|28 basis elements and 114 critical pairs
      #|28 basis elements and 113 critical pairs
      #|28 basis elements and 112 critical pairs
      #|28 basis elements and 111 critical pairs
      #|28 basis elements and 110 critical pairs
      #|28 basis elements and 109 critical pairs
      #|28 basis elements and 108 critical pairs
      #|28 basis elements and 107 critical pairs
      #|29 basis elements and 117 critical pairs
      #|29 basis elements and 116 critical pairs
      #|29 basis elements and 115 critical pairs
      #|29 basis elements and 114 critical pairs
      #|29 basis elements and 113 critical pairs
      #|29 basis elements and 112 critical pairs
      #|30 basis elements and 130 critical pairs
      #|30 basis elements and 129 critical pairs
      #|30 basis elements and 128 critical pairs
      #|30 basis elements and 127 critical pairs
      #|30 basis elements and 126 critical pairs
      #|30 basis elements and 125 critical pairs
      #|30 basis elements and 124 critical pairs
      #|30 basis elements and 123 critical pairs
      #|30 basis elements and 122 critical pairs
      #|30 basis elements and 121 critical pairs
      #|31 basis elements and 134 critical pairs
      #|31 basis elements and 133 critical pairs
      #|31 basis elements and 132 critical pairs
      #|31 basis elements and 131 critical pairs
      #|31 basis elements and 130 critical pairs
      #|31 basis elements and 129 critical pairs
      #|31 basis elements and 128 critical pairs
      #|31 basis elements and 127 critical pairs
      #|31 basis elements and 126 critical pairs
      #|31 basis elements and 125 critical pairs
      #|31 basis elements and 124 critical pairs
      #|31 basis elements and 123 critical pairs
      #|32 basis elements and 143 critical pairs
      #|32 basis elements and 142 critical pairs
      #|32 basis elements and 141 critical pairs
      #|32 basis elements and 140 critical pairs
      #|32 basis elements and 139 critical pairs
      #|33 basis elements and 156 critical pairs
      #|33 basis elements and 155 critical pairs
      #|33 basis elements and 154 critical pairs
      #|33 basis elements and 153 critical pairs
      #|33 basis elements and 152 critical pairs
      #|33 basis elements and 151 critical pairs
      #|33 basis elements and 150 critical pairs
      #|34 basis elements and 173 critical pairs
      #|34 basis elements and 172 critical pairs
      #|34 basis elements and 171 critical pairs
      #|34 basis elements and 170 critical pairs
      #|34 basis elements and 169 critical pairs
      #|34 basis elements and 168 critical pairs
      #|35 basis elements and 188 critical pairs
      #|35 basis elements and 187 critical pairs
      #|35 basis elements and 186 critical pairs
      #|35 basis elements and 185 critical pairs
      #|35 basis elements and 184 critical pairs
      #|36 basis elements and 205 critical pairs
      #|36 basis elements and 204 critical pairs
      #|36 basis elements and 203 critical pairs
      #|36 basis elements and 202 critical pairs
      #|36 basis elements and 201 critical pairs
      #|36 basis elements and 200 critical pairs
      #|36 basis elements and 199 critical pairs
      #|36 basis elements and 198 critical pairs
      #|36 basis elements and 197 critical pairs
      #|36 basis elements and 196 critical pairs
      #|36 basis elements and 195 critical pairs
      #|36 basis elements and 194 critical pairs
      #|36 basis elements and 193 critical pairs
      #|36 basis elements and 192 critical pairs
      #|36 basis elements and 191 critical pairs
      #|37 basis elements and 217 critical pairs
      #|37 basis elements and 216 critical pairs
      #|37 basis elements and 215 critical pairs
      #|37 basis elements and 214 critical pairs
      #|37 basis elements and 213 critical pairs
      #|38 basis elements and 239 critical pairs
      #|38 basis elements and 238 critical pairs
      #|38 basis elements and 237 critical pairs
      #|38 basis elements and 236 critical pairs
      #|38 basis elements and 235 critical pairs
      #|38 basis elements and 234 critical pairs
      #|38 basis elements and 233 critical pairs
      #|38 basis elements and 232 critical pairs
      #|38 basis elements and 231 critical pairs
      #|38 basis elements and 230 critical pairs
      #|38 basis elements and 229 critical pairs
      #|38 basis elements and 228 critical pairs
      #|39 basis elements and 253 critical pairs
      #|39 basis elements and 252 critical pairs
      #|39 basis elements and 251 critical pairs
      #|39 basis elements and 250 critical pairs
      #|39 basis elements and 249 critical pairs
      #|39 basis elements and 248 critical pairs
      #|39 basis elements and 247 critical pairs
      #|39 basis elements and 246 critical pairs
      #|39 basis elements and 245 critical pairs
      #|39 basis elements and 244 critical pairs
      #|39 basis elements and 243 critical pairs
      #|39 basis elements and 242 critical pairs
      #|39 basis elements and 241 critical pairs
      #|39 basis elements and 240 critical pairs
      #|39 basis elements and 239 critical pairs
      #|39 basis elements and 238 critical pairs
      #|39 basis elements and 237 critical pairs
      #|39 basis elements and 236 critical pairs
      #|39 basis elements and 235 critical pairs
      #|39 basis elements and 234 critical pairs
      #|39 basis elements and 233 critical pairs
      #|39 basis elements and 232 critical pairs
      #|39 basis elements and 231 critical pairs
      #|39 basis elements and 230 critical pairs
      #|40 basis elements and 252 critical pairs
      #|40 basis elements and 251 critical pairs
      #|40 basis elements and 250 critical pairs
      #|40 basis elements and 249 critical pairs
      #|40 basis elements and 248 critical pairs
      #|40 basis elements and 247 critical pairs
      #|40 basis elements and 246 critical pairs
      #|40 basis elements and 245 critical pairs
      #|40 basis elements and 244 critical pairs
      #|40 basis elements and 243 critical pairs
      #|40 basis elements and 242 critical pairs
      #|40 basis elements and 241 critical pairs
      #|40 basis elements and 240 critical pairs
      #|40 basis elements and 239 critical pairs
      #|40 basis elements and 238 critical pairs
      #|40 basis elements and 237 critical pairs
      #|40 basis elements and 236 critical pairs
      #|40 basis elements and 235 critical pairs
      #|40 basis elements and 234 critical pairs
      #|40 basis elements and 233 critical pairs
      #|40 basis elements and 232 critical pairs
      #|40 basis elements and 231 critical pairs
      #|40 basis elements and 230 critical pairs
      #|40 basis elements and 229 critical pairs
      #|40 basis elements and 228 critical pairs
      #|40 basis elements and 227 critical pairs
      #|40 basis elements and 226 critical pairs
      #|40 basis elements and 225 critical pairs
      #|40 basis elements and 224 critical pairs
      #|40 basis elements and 223 critical pairs
      #|40 basis elements and 222 critical pairs
      #|40 basis elements and 221 critical pairs
      #|40 basis elements and 220 critical pairs
      #|40 basis elements and 219 critical pairs
      #|40 basis elements and 218 critical pairs
      #|40 basis elements and 217 critical pairs
      #|40 basis elements and 216 critical pairs
      #|40 basis elements and 215 critical pairs
      #|40 basis elements and 214 critical pairs
      #|40 basis elements and 213 critical pairs
      #|40 basis elements and 212 critical pairs
      #|40 basis elements and 211 critical pairs
      #|40 basis elements and 210 critical pairs
      #|40 basis elements and 209 critical pairs
      #|40 basis elements and 208 critical pairs
      #|40 basis elements and 207 critical pairs
      #|40 basis elements and 206 critical pairs
      #|40 basis elements and 205 critical pairs
      #|40 basis elements and 204 critical pairs
      #|40 basis elements and 203 critical pairs
      #|40 basis elements and 202 critical pairs
      #|40 basis elements and 201 critical pairs
      #|40 basis elements and 200 critical pairs
      #|40 basis elements and 199 critical pairs
      #|40 basis elements and 198 critical pairs
      #|40 basis elements and 197 critical pairs
      #|40 basis elements and 196 critical pairs
      #|40 basis elements and 195 critical pairs
      #|40 basis elements and 194 critical pairs
      #|40 basis elements and 193 critical pairs
      #|40 basis elements and 192 critical pairs
      #|40 basis elements and 191 critical pairs
      #|40 basis elements and 190 critical pairs
      #|40 basis elements and 189 critical pairs
      #|40 basis elements and 188 critical pairs
      #|40 basis elements and 187 critical pairs
      #|40 basis elements and 186 critical pairs
      #|40 basis elements and 185 critical pairs
      #|40 basis elements and 184 critical pairs
      #|40 basis elements and 183 critical pairs
      #|40 basis elements and 182 critical pairs
      #|40 basis elements and 181 critical pairs
      #|40 basis elements and 180 critical pairs
      #|40 basis elements and 179 critical pairs
      #|40 basis elements and 178 critical pairs
      #|40 basis elements and 177 critical pairs
      #|40 basis elements and 176 critical pairs
      #|40 basis elements and 175 critical pairs
      #|40 basis elements and 174 critical pairs
      #|40 basis elements and 173 critical pairs
      #|40 basis elements and 172 critical pairs
      #|40 basis elements and 171 critical pairs
      #|40 basis elements and 170 critical pairs
      #|40 basis elements and 169 critical pairs
      #|40 basis elements and 168 critical pairs
      #|40 basis elements and 167 critical pairs
      #|40 basis elements and 166 critical pairs
      #|40 basis elements and 165 critical pairs
      #|40 basis elements and 164 critical pairs
      #|40 basis elements and 163 critical pairs
      #|40 basis elements and 162 critical pairs
      #|40 basis elements and 161 critical pairs
      #|40 basis elements and 160 critical pairs
      #|40 basis elements and 159 critical pairs
      #|40 basis elements and 158 critical pairs
      #|40 basis elements and 157 critical pairs
      #|40 basis elements and 156 critical pairs
      #|40 basis elements and 155 critical pairs
      #|40 basis elements and 154 critical pairs
      #|40 basis elements and 153 critical pairs
      #|40 basis elements and 152 critical pairs
      #|40 basis elements and 151 critical pairs
      #|40 basis elements and 150 critical pairs
      #|40 basis elements and 149 critical pairs
      #|41 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|9 basis elements and 11 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 23 critical pairs
      #|14 basis elements and 28 critical pairs
      #|14 basis elements and 27 critical pairs
      #|14 basis elements and 26 critical pairs
      #|15 basis elements and 30 critical pairs
      #|15 basis elements and 29 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|17 basis elements and 34 critical pairs
      #|17 basis elements and 33 critical pairs
      #|18 basis elements and 39 critical pairs
      #|18 basis elements and 38 critical pairs
      #|18 basis elements and 37 critical pairs
      #|19 basis elements and 41 critical pairs
      #|20 basis elements and 49 critical pairs
      #|20 basis elements and 48 critical pairs
      #|20 basis elements and 47 critical pairs
      #|20 basis elements and 46 critical pairs
      #|20 basis elements and 45 critical pairs
      #|20 basis elements and 44 critical pairs
      #|21 basis elements and 53 critical pairs
      #|21 basis elements and 52 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|22 basis elements and 61 critical pairs
      #|22 basis elements and 60 critical pairs
      #|22 basis elements and 59 critical pairs
      #|22 basis elements and 58 critical pairs
      #|22 basis elements and 57 critical pairs
      #|22 basis elements and 56 critical pairs
      #|22 basis elements and 55 critical pairs
      #|22 basis elements and 54 critical pairs
      #|22 basis elements and 53 critical pairs
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
      #|24 basis elements and 43 critical pairs
      #|24 basis elements and 42 critical pairs
      #|24 basis elements and 41 critical pairs
      #|24 basis elements and 40 critical pairs
      #|24 basis elements and 39 critical pairs
      #|24 basis elements and 38 critical pairs
      #|24 basis elements and 37 critical pairs
      #|25 basis elements and 44 critical pairs
      #|25 basis elements and 43 critical pairs
      #|25 basis elements and 42 critical pairs
      #|25 basis elements and 41 critical pairs
      #|25 basis elements and 40 critical pairs
      #|25 basis elements and 39 critical pairs
      #|25 basis elements and 38 critical pairs
      #|25 basis elements and 37 critical pairs
      #|25 basis elements and 36 critical pairs
      #|25 basis elements and 35 critical pairs
      #|25 basis elements and 34 critical pairs
      #|25 basis elements and 33 critical pairs
      #|25 basis elements and 32 critical pairs
      #|25 basis elements and 31 critical pairs
      #|26 basis elements and 36 critical pairs
      #|26 basis elements and 35 critical pairs
      #|26 basis elements and 34 critical pairs
      #|27 basis elements and 41 critical pairs
      #|27 basis elements and 40 critical pairs
      #|27 basis elements and 39 critical pairs
      #|27 basis elements and 38 critical pairs
      #|27 basis elements and 37 critical pairs
      #|27 basis elements and 36 critical pairs
      #|27 basis elements and 35 critical pairs
      #|27 basis elements and 34 critical pairs
      #|27 basis elements and 33 critical pairs
      #|27 basis elements and 32 critical pairs
      #|27 basis elements and 31 critical pairs
      #|27 basis elements and 30 critical pairs
      #|27 basis elements and 29 critical pairs
      #|27 basis elements and 28 critical pairs
      #|27 basis elements and 27 critical pairs
      #|27 basis elements and 26 critical pairs
      #|27 basis elements and 25 critical pairs
      #|27 basis elements and 24 critical pairs
      #|27 basis elements and 23 critical pairs
      #|27 basis elements and 22 critical pairs
      #|27 basis elements and 21 critical pairs
      #|27 basis elements and 20 critical pairs
      #|28 basis elements and 28 critical pairs
      #|28 basis elements and 27 critical pairs
      #|28 basis elements and 26 critical pairs
      #|28 basis elements and 25 critical pairs
      #|28 basis elements and 24 critical pairs
      #|28 basis elements and 23 critical pairs
      #|28 basis elements and 22 critical pairs
      #|28 basis elements and 21 critical pairs
      #|28 basis elements and 20 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|28 basis elements and 16 critical pairs
      #|28 basis elements and 15 critical pairs
      #|28 basis elements and 14 critical pairs
      #|28 basis elements and 13 critical pairs
      #|28 basis elements and 12 critical pairs
      #|28 basis elements and 11 critical pairs
      #|28 basis elements and 10 critical pairs
      #|28 basis elements and 9 critical pairs
      #|28 basis elements and 8 critical pairs
      #|28 basis elements and 7 critical pairs
      #|28 basis elements and 6 critical pairs
      #|29 basis elements and 9 critical pairs
      #|29 basis elements and 8 critical pairs
      #|29 basis elements and 7 critical pairs
      #|29 basis elements and 6 critical pairs
      #|29 basis elements and 5 critical pairs
      #|30 basis elements and 16 critical pairs
      #|30 basis elements and 15 critical pairs
      #|30 basis elements and 14 critical pairs
      #|30 basis elements and 13 critical pairs
      #|30 basis elements and 12 critical pairs
      #|30 basis elements and 11 critical pairs
      #|30 basis elements and 10 critical pairs
      #|30 basis elements and 9 critical pairs
      #|31 basis elements and 14 critical pairs
      #|31 basis elements and 13 critical pairs
      #|31 basis elements and 12 critical pairs
      #|31 basis elements and 11 critical pairs
      #|31 basis elements and 10 critical pairs
      #|31 basis elements and 9 critical pairs
      #|31 basis elements and 8 critical pairs
      #|31 basis elements and 7 critical pairs
      #|31 basis elements and 6 critical pairs
      #|31 basis elements and 5 critical pairs
      #|31 basis elements and 4 critical pairs
      #|31 basis elements and 3 critical pairs
      #|31 basis elements and 2 critical pairs
      #|31 basis elements and 1 critical pairs
      #|31 basis elements and 0 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 13 critical pairs
      #|12 basis elements and 16 critical pairs
      #|13 basis elements and 19 critical pairs
      #|14 basis elements and 22 critical pairs
      #|15 basis elements and 25 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|17 basis elements and 31 critical pairs
      #|17 basis elements and 30 critical pairs
      #|18 basis elements and 38 critical pairs
      #|18 basis elements and 37 critical pairs
      #|19 basis elements and 45 critical pairs
      #|19 basis elements and 44 critical pairs
      #|19 basis elements and 43 critical pairs
      #|19 basis elements and 42 critical pairs
      #|19 basis elements and 41 critical pairs
      #|20 basis elements and 53 critical pairs
      #|20 basis elements and 52 critical pairs
      #|21 basis elements and 60 critical pairs
      #|21 basis elements and 59 critical pairs
      #|22 basis elements and 72 critical pairs
      #|22 basis elements and 71 critical pairs
      #|22 basis elements and 70 critical pairs
      #|22 basis elements and 69 critical pairs
      #|22 basis elements and 68 critical pairs
      #|22 basis elements and 67 critical pairs
      #|22 basis elements and 66 critical pairs
      #|22 basis elements and 65 critical pairs
      #|22 basis elements and 64 critical pairs
      #|22 basis elements and 63 critical pairs
      #|22 basis elements and 62 critical pairs
      #|23 basis elements and 75 critical pairs
      #|24 basis elements and 89 critical pairs
      #|25 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..3..13..solved at 20
      #|0..0..1..5..14..78..238..2015..solved at 3656
      #|0..0..1..5..14..78..238..2013..solved at 3654
      #|0..0..0..0..10..28..54..solved at 61
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..2..4..10..20..solved at 27
      #|0..0..2..4..10..20..solved at 27
      #|0..0..2..4..10..20..32..49..68..91..131..204..287..395..557..738..962..solved at 1007
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 24 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|15 basis elements and 30 critical pairs
      #|16 basis elements and 40 critical pairs
      #|16 basis elements and 39 critical pairs
      #|16 basis elements and 38 critical pairs
      #|17 basis elements and 45 critical pairs
      #|17 basis elements and 44 critical pairs
      #|17 basis elements and 43 critical pairs
      #|17 basis elements and 42 critical pairs
      #|17 basis elements and 41 critical pairs
      #|17 basis elements and 40 critical pairs
      #|17 basis elements and 39 critical pairs
      #|17 basis elements and 38 critical pairs
      #|18 basis elements and 44 critical pairs
      #|18 basis elements and 43 critical pairs
      #|18 basis elements and 42 critical pairs
      #|18 basis elements and 41 critical pairs
      #|19 basis elements and 48 critical pairs
      #|19 basis elements and 47 critical pairs
      #|19 basis elements and 46 critical pairs
      #|19 basis elements and 45 critical pairs
      #|19 basis elements and 44 critical pairs
      #|20 basis elements and 52 critical pairs
      #|21 basis elements and 62 critical pairs
      #|21 basis elements and 61 critical pairs
      #|21 basis elements and 60 critical pairs
      #|21 basis elements and 59 critical pairs
      #|21 basis elements and 58 critical pairs
      #|21 basis elements and 57 critical pairs
      #|21 basis elements and 56 critical pairs
      #|21 basis elements and 55 critical pairs
      #|21 basis elements and 54 critical pairs
      #|21 basis elements and 53 critical pairs
      #|21 basis elements and 52 critical pairs
      #|21 basis elements and 51 critical pairs
      #|21 basis elements and 50 critical pairs
      #|21 basis elements and 49 critical pairs
      #|21 basis elements and 48 critical pairs
      #|21 basis elements and 47 critical pairs
      #|21 basis elements and 46 critical pairs
      #|21 basis elements and 45 critical pairs
      #|22 basis elements and 54 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|23 basis elements and 62 critical pairs
      #|24 basis elements and 74 critical pairs
      #|25 basis elements and 90 critical pairs
      #|25 basis elements and 89 critical pairs
      #|25 basis elements and 88 critical pairs
      #|25 basis elements and 87 critical pairs
      #|25 basis elements and 86 critical pairs
      #|25 basis elements and 85 critical pairs
      #|25 basis elements and 84 critical pairs
      #|25 basis elements and 83 critical pairs
      #|25 basis elements and 82 critical pairs
      #|25 basis elements and 81 critical pairs
      #|25 basis elements and 80 critical pairs
      #|26 basis elements and 98 critical pairs
      #|27 basis elements and 117 critical pairs
      #|27 basis elements and 116 critical pairs
      #|27 basis elements and 115 critical pairs
      #|27 basis elements and 114 critical pairs
      #|27 basis elements and 113 critical pairs
      #|27 basis elements and 112 critical pairs
      #|27 basis elements and 111 critical pairs
      #|27 basis elements and 110 critical pairs
      #|27 basis elements and 109 critical pairs
      #|27 basis elements and 108 critical pairs
      #|27 basis elements and 107 critical pairs
      #|27 basis elements and 106 critical pairs
      #|27 basis elements and 105 critical pairs
      #|27 basis elements and 104 critical pairs
      #|27 basis elements and 103 critical pairs
      #|27 basis elements and 102 critical pairs
      #|27 basis elements and 101 critical pairs
      #|27 basis elements and 100 critical pairs
      #|27 basis elements and 99 critical pairs
      #|27 basis elements and 98 critical pairs
      #|27 basis elements and 97 critical pairs
      #|27 basis elements and 96 critical pairs
      #|27 basis elements and 95 critical pairs
      #|27 basis elements and 94 critical pairs
      #|27 basis elements and 93 critical pairs
      #|27 basis elements and 92 critical pairs
      #|27 basis elements and 91 critical pairs
      #|27 basis elements and 90 critical pairs
      #|27 basis elements and 89 critical pairs
      #|27 basis elements and 88 critical pairs
      #|27 basis elements and 87 critical pairs
      #|27 basis elements and 86 critical pairs
      #|27 basis elements and 85 critical pairs
      #|27 basis elements and 84 critical pairs
      #|27 basis elements and 83 critical pairs
      #|28 basis elements and 94 critical pairs
      #|28 basis elements and 93 critical pairs
      #|28 basis elements and 92 critical pairs
      #|28 basis elements and 91 critical pairs
      #|28 basis elements and 90 critical pairs
      #|28 basis elements and 89 critical pairs
      #|28 basis elements and 88 critical pairs
      #|28 basis elements and 87 critical pairs
      #|28 basis elements and 86 critical pairs
      #|28 basis elements and 85 critical pairs
      #|28 basis elements and 84 critical pairs
      #|28 basis elements and 83 critical pairs
      #|28 basis elements and 82 critical pairs
      #|28 basis elements and 81 critical pairs
      #|28 basis elements and 80 critical pairs
      #|28 basis elements and 79 critical pairs
      #|28 basis elements and 78 critical pairs
      #|28 basis elements and 77 critical pairs
      #|28 basis elements and 76 critical pairs
      #|28 basis elements and 75 critical pairs
      #|28 basis elements and 74 critical pairs
      #|28 basis elements and 73 critical pairs
      #|28 basis elements and 72 critical pairs
      #|28 basis elements and 71 critical pairs
      #|28 basis elements and 70 critical pairs
      #|28 basis elements and 69 critical pairs
      #|28 basis elements and 68 critical pairs
      #|28 basis elements and 67 critical pairs
      #|28 basis elements and 66 critical pairs
      #|28 basis elements and 65 critical pairs
      #|28 basis elements and 64 critical pairs
      #|28 basis elements and 63 critical pairs
      #|28 basis elements and 62 critical pairs
      #|28 basis elements and 61 critical pairs
      #|28 basis elements and 60 critical pairs
      #|28 basis elements and 59 critical pairs
      #|28 basis elements and 58 critical pairs
      #|28 basis elements and 57 critical pairs
      #|28 basis elements and 56 critical pairs
      #|28 basis elements and 55 critical pairs
      #|28 basis elements and 54 critical pairs
      #|28 basis elements and 53 critical pairs
      #|28 basis elements and 52 critical pairs
      #|28 basis elements and 51 critical pairs
      #|28 basis elements and 50 critical pairs
      #|28 basis elements and 49 critical pairs
      #|28 basis elements and 48 critical pairs
      #|28 basis elements and 47 critical pairs
      #|28 basis elements and 46 critical pairs
      #|28 basis elements and 45 critical pairs
      #|28 basis elements and 44 critical pairs
      #|28 basis elements and 43 critical pairs
      #|28 basis elements and 42 critical pairs
      #|28 basis elements and 41 critical pairs
      #|28 basis elements and 40 critical pairs
      #|28 basis elements and 39 critical pairs
      #|28 basis elements and 38 critical pairs
      #|28 basis elements and 37 critical pairs
      #|28 basis elements and 36 critical pairs
      #|28 basis elements and 35 critical pairs
      #|28 basis elements and 34 critical pairs
      #|28 basis elements and 33 critical pairs
      #|28 basis elements and 32 critical pairs
      #|28 basis elements and 31 critical pairs
      #|28 basis elements and 30 critical pairs
      #|28 basis elements and 29 critical pairs
      #|28 basis elements and 28 critical pairs
      #|28 basis elements and 27 critical pairs
      #|28 basis elements and 26 critical pairs
      #|28 basis elements and 25 critical pairs
      #|28 basis elements and 24 critical pairs
      #|28 basis elements and 23 critical pairs
      #|28 basis elements and 22 critical pairs
      #|28 basis elements and 21 critical pairs
      #|28 basis elements and 20 critical pairs
      #|28 basis elements and 19 critical pairs
      #|28 basis elements and 18 critical pairs
      #|28 basis elements and 17 critical pairs
      #|28 basis elements and 16 critical pairs
      #|28 basis elements and 15 critical pairs
      #|28 basis elements and 14 critical pairs
      #|28 basis elements and 13 critical pairs
      #|28 basis elements and 12 critical pairs
      #|28 basis elements and 11 critical pairs
      #|28 basis elements and 10 critical pairs
      #|28 basis elements and 9 critical pairs
      #|28 basis elements and 8 critical pairs
      #|28 basis elements and 7 critical pairs
      #|28 basis elements and 6 critical pairs
      #|28 basis elements and 5 critical pairs
      #|28 basis elements and 4 critical pairs
      #|28 basis elements and 3 critical pairs
      #|28 basis elements and 2 critical pairs
      #|28 basis elements and 1 critical pairs
      #|28 basis elements and 0 critical pairs
      #|7 basis elements and 10 critical pairs
      #|8 basis elements and 13 critical pairs
      #|9 basis elements and 16 critical pairs
      #|10 basis elements and 20 critical pairs
      #|10 basis elements and 19 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 22 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 21 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|14 basis elements and 16 critical pairs
      #|14 basis elements and 15 critical pairs
      #|14 basis elements and 14 critical pairs
      #|15 basis elements and 17 critical pairs
      #|16 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|9 basis elements and 13 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|11 basis elements and 22 critical pairs
      #|11 basis elements and 21 critical pairs
      #|12 basis elements and 27 critical pairs
      #|12 basis elements and 26 critical pairs
      #|13 basis elements and 28 critical pairs
      #|13 basis elements and 27 critical pairs
      #|14 basis elements and 30 critical pairs
      #|14 basis elements and 29 critical pairs
      #|15 basis elements and 35 critical pairs
      #|15 basis elements and 34 critical pairs
      #|15 basis elements and 33 critical pairs
      #|16 basis elements and 36 critical pairs
      #|16 basis elements and 35 critical pairs
      #|16 basis elements and 34 critical pairs
      #|16 basis elements and 33 critical pairs
      #|16 basis elements and 32 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|17 basis elements and 33 critical pairs
      #|18 basis elements and 38 critical pairs
      #|19 basis elements and 44 critical pairs
      #|19 basis elements and 43 critical pairs
      #|19 basis elements and 42 critical pairs
      #|19 basis elements and 41 critical pairs
      #|19 basis elements and 40 critical pairs
      #|19 basis elements and 39 critical pairs
      #|19 basis elements and 38 critical pairs
      #|19 basis elements and 37 critical pairs
      #|19 basis elements and 36 critical pairs
      #|19 basis elements and 35 critical pairs
      #|20 basis elements and 46 critical pairs
      #|20 basis elements and 45 critical pairs
      #|20 basis elements and 44 critical pairs
      #|20 basis elements and 43 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|20 basis elements and 40 critical pairs
      #|20 basis elements and 39 critical pairs
      #|20 basis elements and 38 critical pairs
      #|20 basis elements and 37 critical pairs
      #|21 basis elements and 48 critical pairs
      #|22 basis elements and 61 critical pairs
      #|23 basis elements and 69 critical pairs
      #|23 basis elements and 68 critical pairs
      #|23 basis elements and 67 critical pairs
      #|23 basis elements and 66 critical pairs
      #|23 basis elements and 65 critical pairs
      #|23 basis elements and 64 critical pairs
      #|23 basis elements and 63 critical pairs
      #|24 basis elements and 71 critical pairs
      #|25 basis elements and 81 critical pairs
      #|26 basis elements and 83 critical pairs
      #|26 basis elements and 82 critical pairs
      #|26 basis elements and 81 critical pairs
      #|26 basis elements and 80 critical pairs
      #|26 basis elements and 79 critical pairs
      #|26 basis elements and 78 critical pairs
      #|26 basis elements and 77 critical pairs
      #|26 basis elements and 76 critical pairs
      #|26 basis elements and 75 critical pairs
      #|26 basis elements and 74 critical pairs
      #|26 basis elements and 73 critical pairs
      #|26 basis elements and 72 critical pairs
      #|26 basis elements and 71 critical pairs
      #|26 basis elements and 70 critical pairs
      #|26 basis elements and 69 critical pairs
      #|26 basis elements and 68 critical pairs
      #|26 basis elements and 67 critical pairs
      #|27 basis elements and 76 critical pairs
      #|27 basis elements and 75 critical pairs
      #|27 basis elements and 74 critical pairs
      #|27 basis elements and 73 critical pairs
      #|27 basis elements and 72 critical pairs
      #|27 basis elements and 71 critical pairs
      #|27 basis elements and 70 critical pairs
      #|27 basis elements and 69 critical pairs
      #|27 basis elements and 68 critical pairs
      #|27 basis elements and 67 critical pairs
      #|27 basis elements and 66 critical pairs
      #|27 basis elements and 65 critical pairs
      #|27 basis elements and 64 critical pairs
      #|27 basis elements and 63 critical pairs
      #|27 basis elements and 62 critical pairs
      #|27 basis elements and 61 critical pairs
      #|27 basis elements and 60 critical pairs
      #|27 basis elements and 59 critical pairs
      #|27 basis elements and 58 critical pairs
      #|27 basis elements and 57 critical pairs
      #|27 basis elements and 56 critical pairs
      #|27 basis elements and 55 critical pairs
      #|27 basis elements and 54 critical pairs
      #|27 basis elements and 53 critical pairs
      #|27 basis elements and 52 critical pairs
      #|27 basis elements and 51 critical pairs
      #|27 basis elements and 50 critical pairs
      #|27 basis elements and 49 critical pairs
      #|27 basis elements and 48 critical pairs
      #|27 basis elements and 47 critical pairs
      #|27 basis elements and 46 critical pairs
      #|27 basis elements and 45 critical pairs
      #|27 basis elements and 44 critical pairs
      #|27 basis elements and 43 critical pairs
      #|27 basis elements and 42 critical pairs
      #|27 basis elements and 41 critical pairs
      #|27 basis elements and 40 critical pairs
      #|27 basis elements and 39 critical pairs
      #|27 basis elements and 38 critical pairs
      #|27 basis elements and 37 critical pairs
      #|27 basis elements and 36 critical pairs
      #|27 basis elements and 35 critical pairs
      #|27 basis elements and 34 critical pairs
      #|27 basis elements and 33 critical pairs
      #|27 basis elements and 32 critical pairs
      #|27 basis elements and 31 critical pairs
      #|27 basis elements and 30 critical pairs
      #|27 basis elements and 29 critical pairs
      #|27 basis elements and 28 critical pairs
      #|27 basis elements and 27 critical pairs
      #|27 basis elements and 26 critical pairs
      #|27 basis elements and 25 critical pairs
      #|27 basis elements and 24 critical pairs
      #|27 basis elements and 23 critical pairs
      #|27 basis elements and 22 critical pairs
      #|27 basis elements and 21 critical pairs
      #|27 basis elements and 20 critical pairs
      #|27 basis elements and 19 critical pairs
      #|27 basis elements and 18 critical pairs
      #|27 basis elements and 17 critical pairs
      #|27 basis elements and 16 critical pairs
      #|27 basis elements and 15 critical pairs
      #|27 basis elements and 14 critical pairs
      #|27 basis elements and 13 critical pairs
      #|27 basis elements and 12 critical pairs
      #|27 basis elements and 11 critical pairs
      #|27 basis elements and 10 critical pairs
      #|27 basis elements and 9 critical pairs
      #|27 basis elements and 8 critical pairs
      #|27 basis elements and 7 critical pairs
      #|27 basis elements and 6 critical pairs
      #|27 basis elements and 5 critical pairs
      #|27 basis elements and 4 critical pairs
      #|27 basis elements and 3 critical pairs
      #|27 basis elements and 2 critical pairs
      #|27 basis elements and 1 critical pairs
      #|27 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
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
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|5 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..solved at 5
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|9 basis elements and 4 critical pairs
      #|10 basis elements and 8 critical pairs
      #|10 basis elements and 7 critical pairs
      #|10 basis elements and 6 critical pairs
      #|10 basis elements and 5 critical pairs
      #|10 basis elements and 4 critical pairs
      #|10 basis elements and 3 critical pairs
      #|10 basis elements and 2 critical pairs
      #|10 basis elements and 1 critical pairs
      #|11 basis elements and 3 critical pairs
      #|11 basis elements and 2 critical pairs
      #|11 basis elements and 1 critical pairs
      #|11 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 13 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 15 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 18 critical pairs
      #|12 basis elements and 21 critical pairs
      #|12 basis elements and 20 critical pairs
      #|13 basis elements and 24 critical pairs
      #|13 basis elements and 23 critical pairs
      #|13 basis elements and 22 critical pairs
      #|14 basis elements and 27 critical pairs
      #|14 basis elements and 26 critical pairs
      #|14 basis elements and 25 critical pairs
      #|15 basis elements and 30 critical pairs
      #|15 basis elements and 29 critical pairs
      #|16 basis elements and 35 critical pairs
      #|16 basis elements and 34 critical pairs
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
      #|18 basis elements and 34 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|19 basis elements and 35 critical pairs
      #|19 basis elements and 34 critical pairs
      #|19 basis elements and 33 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|19 basis elements and 30 critical pairs
      #|19 basis elements and 29 critical pairs
      #|19 basis elements and 28 critical pairs
      #|20 basis elements and 35 critical pairs
      #|20 basis elements and 34 critical pairs
      #|20 basis elements and 33 critical pairs
      #|20 basis elements and 32 critical pairs
      #|20 basis elements and 31 critical pairs
      #|20 basis elements and 30 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|20 basis elements and 25 critical pairs
      #|21 basis elements and 31 critical pairs
      #|21 basis elements and 30 critical pairs
      #|21 basis elements and 29 critical pairs
      #|21 basis elements and 28 critical pairs
      #|21 basis elements and 27 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|21 basis elements and 24 critical pairs
      #|21 basis elements and 23 critical pairs
      #|21 basis elements and 22 critical pairs
      #|22 basis elements and 30 critical pairs
      #|22 basis elements and 29 critical pairs
      #|22 basis elements and 28 critical pairs
      #|22 basis elements and 27 critical pairs
      #|22 basis elements and 26 critical pairs
      #|22 basis elements and 25 critical pairs
      #|22 basis elements and 24 critical pairs
      #|22 basis elements and 23 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|22 basis elements and 18 critical pairs
      #|22 basis elements and 17 critical pairs
      #|22 basis elements and 16 critical pairs
      #|22 basis elements and 15 critical pairs
      #|22 basis elements and 14 critical pairs
      #|22 basis elements and 13 critical pairs
      #|22 basis elements and 12 critical pairs
      #|22 basis elements and 11 critical pairs
      #|22 basis elements and 10 critical pairs
      #|22 basis elements and 9 critical pairs
      #|22 basis elements and 8 critical pairs
      #|22 basis elements and 7 critical pairs
      #|22 basis elements and 6 critical pairs
      #|22 basis elements and 5 critical pairs
      #|22 basis elements and 4 critical pairs
      #|22 basis elements and 3 critical pairs
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
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 13 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 15 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 18 critical pairs
      #|12 basis elements and 21 critical pairs
      #|12 basis elements and 20 critical pairs
      #|13 basis elements and 24 critical pairs
      #|13 basis elements and 23 critical pairs
      #|13 basis elements and 22 critical pairs
      #|14 basis elements and 27 critical pairs
      #|14 basis elements and 26 critical pairs
      #|14 basis elements and 25 critical pairs
      #|15 basis elements and 30 critical pairs
      #|15 basis elements and 29 critical pairs
      #|16 basis elements and 35 critical pairs
      #|16 basis elements and 34 critical pairs
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
      #|18 basis elements and 34 critical pairs
      #|18 basis elements and 33 critical pairs
      #|18 basis elements and 32 critical pairs
      #|18 basis elements and 31 critical pairs
      #|18 basis elements and 30 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|19 basis elements and 35 critical pairs
      #|19 basis elements and 34 critical pairs
      #|19 basis elements and 33 critical pairs
      #|19 basis elements and 32 critical pairs
      #|19 basis elements and 31 critical pairs
      #|19 basis elements and 30 critical pairs
      #|19 basis elements and 29 critical pairs
      #|19 basis elements and 28 critical pairs
      #|20 basis elements and 35 critical pairs
      #|20 basis elements and 34 critical pairs
      #|20 basis elements and 33 critical pairs
      #|20 basis elements and 32 critical pairs
      #|20 basis elements and 31 critical pairs
      #|20 basis elements and 30 critical pairs
      #|20 basis elements and 29 critical pairs
      #|20 basis elements and 28 critical pairs
      #|20 basis elements and 27 critical pairs
      #|20 basis elements and 26 critical pairs
      #|20 basis elements and 25 critical pairs
      #|21 basis elements and 31 critical pairs
      #|21 basis elements and 30 critical pairs
      #|21 basis elements and 29 critical pairs
      #|21 basis elements and 28 critical pairs
      #|21 basis elements and 27 critical pairs
      #|21 basis elements and 26 critical pairs
      #|21 basis elements and 25 critical pairs
      #|21 basis elements and 24 critical pairs
      #|21 basis elements and 23 critical pairs
      #|21 basis elements and 22 critical pairs
      #|22 basis elements and 30 critical pairs
      #|22 basis elements and 29 critical pairs
      #|22 basis elements and 28 critical pairs
      #|22 basis elements and 27 critical pairs
      #|22 basis elements and 26 critical pairs
      #|22 basis elements and 25 critical pairs
      #|22 basis elements and 24 critical pairs
      #|22 basis elements and 23 critical pairs
      #|22 basis elements and 22 critical pairs
      #|22 basis elements and 21 critical pairs
      #|22 basis elements and 20 critical pairs
      #|22 basis elements and 19 critical pairs
      #|22 basis elements and 18 critical pairs
      #|22 basis elements and 17 critical pairs
      #|22 basis elements and 16 critical pairs
      #|22 basis elements and 15 critical pairs
      #|22 basis elements and 14 critical pairs
      #|22 basis elements and 13 critical pairs
      #|22 basis elements and 12 critical pairs
      #|22 basis elements and 11 critical pairs
      #|22 basis elements and 10 critical pairs
      #|22 basis elements and 9 critical pairs
      #|22 basis elements and 8 critical pairs
      #|22 basis elements and 7 critical pairs
      #|22 basis elements and 6 critical pairs
      #|22 basis elements and 5 critical pairs
      #|22 basis elements and 4 critical pairs
      #|22 basis elements and 3 critical pairs
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
      #|8 basis elements and 8 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|9 basis elements and 8 critical pairs
      #|9 basis elements and 7 critical pairs
      #|10 basis elements and 10 critical pairs
      #|10 basis elements and 9 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|13 basis elements and 9 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|13 basis elements and 5 critical pairs
      #|13 basis elements and 4 critical pairs
      #|13 basis elements and 3 critical pairs
      #|13 basis elements and 2 critical pairs
      #|13 basis elements and 1 critical pairs
      #|14 basis elements and 7 critical pairs
      #|14 basis elements and 6 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|14 basis elements and 3 critical pairs
      #|14 basis elements and 2 critical pairs
      #|14 basis elements and 1 critical pairs
      #|14 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..4..13..47..107..solved at 114
      #|0..0..solved at 2
      #|0..0..4..12..40..86..220..504..1113..2573..5675..12115..25614..53148..solved at 53273
      #|0..0..3..6..16..33..65..solved at 116
      #|0..0..3..6..solved at 10
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..2..4..13..22..solved at 31
      #|0..0..2..4..6..solved at 11
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 6
      #|0..0..2..5..13..27..48..86..155..258..397..664..solved at 715
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..12..24..solved at 40
      #|0..0..3..6..20..39..71..125..188..285..447..solved at 467
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..3..6..16..33..59..104..160..solved at 179
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 12
      #|3 basis elements and 3 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 8 critical pairs
      #|8 basis elements and 7 critical pairs
      #|8 basis elements and 6 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..3..12..31..75..167..305..488..872..1722..4070..12411..solved at 33092
      #|0..0..4..12..31..59..119..249..506..1066..2304..5045..11498..solved at 25052
      #|0..0..1..2..8..21..49..solved at 65
      #|0..0..solved at 2
      #|0..0..0..0..4..9..16..solved at 25
      #|0..0..2..6..19..44..72..solved at 88
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..14..26..51..86..136..263..solved at 411
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..18..41..80..153..255..406..678..solved at 1075
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..9..21..48..92..170..279..437..716..solved at 1129
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..15..solved at 29
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..10..27..62..120..218..352..solved at 367
      #|0..0..2..4..solved at 8
      #|0..0..4..8..solved at 18
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..5..10..17..solved at 24
      #|0..0..2..4..12..24..36..56..82..solved at 91
      #|0..0..2..4..9..solved at 20
      #|0..0..2..4..9..22..42..83..solved at 93
      #|0..0..3..6..9..12..solved at 18
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..4..9..20..37..66..105..162..248..392..solved at 445
      #|0..0..2..4..6..8..solved at 14
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..4..8..22..64..150..solved at 224
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..3..6..solved at 21
      #|0..0..1..2..10..20..solved at 34
      #|0..0..1..2..solved at 9
      #|0..0..1..2..10..20..solved at 32
      #|0..0..solved at 2
      #|0..0..3..7..15..solved at 20
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..5..15..solved at 21
      #|0..0..2..5..15..51..163..563..2403..9741..solved at 9763
      #|0..0..2..5..15..51..163..563..2403..9741..solved at 9762
      #|0..0..2..5..15..solved at 21
      #|0..0..1..2..solved at 6
      #|0..0..4..10..20..42..84..solved at 105
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..6..10..32..solved at 49
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..2..4..solved at 10
      #|0..0..0..solved at 3
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
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..0..0..1..2..3..4..5..6..7..8..9..15..21..27..36..45..54..84..114..156..216..276..659..1105..2036..3108..5444..8021..solved at 11519
      #|0..0..3..8..17..34..65..113..180..277..404..582..866..solved at 953
      #|0..0..2..4..solved at 8
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 9
      #|0..0..3..6..solved at 10
      #|0..0..1..2..solved at 6
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 17
      #|0..0..5..10..solved at 14
      #|0..0..solved at 2
      #|0..0..6..12..30..solved at 38
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..36..53..76..115..154..209..304..399..530..723..916..1169..1554..1939..2456..solved at 2470
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..5..15..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..4..8..22..49..87..164..285..424..629..947..1303..2196..3516..4981..8224..12783..17578..29208..solved at 31848
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..14..45..112..301..solved at 314
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..11..22..solved at 34
      #|0..0..1..2..3..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..3..9..38..88..183..solved at 216
      #|0..0..5..12..41..92..171..solved at 211
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|1 basis elements and 0 critical pairs
      #|0..0..4..8..14..solved at 19
      #|0..0..4..8..14..45..92..solved at 104
      #|1 basis elements and 0 critical pairs
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
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..4..8..18..solved at 31
      #|0..0..3..6..14..solved at 27
      #|0..0..1..2..solved at 6
      #|0..0..4..8..20..40..73..140..solved at 209
      #|0..0..1..2..6..11..18..solved at 42
      #|0..0..1..2..6..11..18..solved at 36
      #|0..0..3..6..17..37..114..378..solved at 615
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..3..6..17..39..87..183..385..751..solved at 1180
      #|0..0..solved at 2
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..8..15..30..solved at 38
      #|0..0..1..4..solved at 9
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..1..5..10..19..33..49..solved at 56
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..solved at 27
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..4..11..25..56..111..solved at 120
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..3..9..17..33..61..solved at 77
      #|0..0..1..5..12..32..86..285..1151..5826..31036..solved at 31055
      #|0..0..4..8..16..solved at 24
      #|0..0..3..8..15..35..64..103..202..324..solved at 438
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..3..8..18..44..91..171..313..545..878..1497..solved at 1547
      #|0..0..2..4..10..26..52..100..199..333..527..solved at 560
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 12 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|9 basis elements and 11 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
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
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..24..51..155..solved at 163
      #|0..0..solved at 2
      #|0..0..2..4..10..24..51..155..solved at 163
      #|0..0..solved at 2
      #|0..0..2..4..17..49..125..479..1433..solved at 2052
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..solved at 27
      #|0..0..solved at 2
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..12..28..solved at 40
      #|0..0..2..6..23..solved at 29
      #|0..0..2..6..23..solved at 29
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..2..4..9..19..41..77..148..265..solved at 276
      #|0..0..2..4..9..19..41..77..148..265..solved at 275
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..6..13..solved at 18
      #|0..0..1..2..5..12..26..53..100..solved at 158
      #|0..0..2..solved at 6
      #|0..0..1..2..5..13..31..75..177..solved at 392
      #|0..0..2..solved at 6
      #|0..0..2..4..11..21..36..solved at 104
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..solved at 11
      #|0..0..3..solved at 10
      #|0..0..2..4..9..18..33..77..171..345..1012..2622..6134..solved at 6616
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 8
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 8
      #|0..0..4..solved at 7
      #|0..0..4..10..22..50..solved at 58
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..solved at 36
      #|0..0..2..4..solved at 8
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..6..solved at 11
      #|0..0..1..5..14..29..61..118..202..341..571..899..1456..solved at 1584
      #|0..0..1..5..14..29..61..118..202..341..571..899..1456..solved at 1955
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..15..26..solved at 48
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..15..40..114..286..solved at 610
      #|0..0..1..2..6..12..25..solved at 36
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..7..15..32..solved at 49
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 256
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 256
      #|0..0..2..8..22..78..229..649..1858..4805..solved at 6002
      #|0..0..2..4..12..35..73..207..453..1237..3268..8111..solved at 16571
      #|0..0..2..4..12..35..73..208..455..1240..3274..8120..solved at 10607
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..14..solved at 33
      #|0..0..4..solved at 10
      #|0..0..3..14..solved at 34
      #|0..0..4..solved at 10
      #|0..0..4..16..solved at 20
      #|0..0..5..solved at 11
      #|0..0..2..solved at 7
      #|0..0..3..11..21..39..solved at 48
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..6..11..18..solved at 27
      #|0..0..1..2..solved at 6
      #|0..0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|0..0..1..2..6..14..33..70..160..solved at 208
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..3..solved at 10
      #|0..0..3..solved at 8
      #|0..0..0..2..4..6..12..21..36..58..88..121..180..241..326..444..588..749..977..1226..1524..1897..2319..2778..3333..3923..4578..5315..6113..6961..7970..9027..10273..11694..13324..15022..16986..19018..21397..24121..27192..30436..34113..37979..42434..47468..53071..59015..65779..72884..81446..0..0..1..8..33..84..solved at 93
      #|0..0..1..7..29..70..solved at 79
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..8..35..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..7..33..solved at 42
      #|0..0..2..8..25..solved at 36
      #|0..0..2..7..24..solved at 35
      #|0..0..1..8..33..84..solved at 93
      #|0..0..1..7..29..70..solved at 79
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..8..35..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..7..33..solved at 42
      #|0..0..2..8..25..solved at 36
      #|0..0..2..7..24..solved at 35
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 256
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 256
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 256
      #|0..0..1..2..6..14..31..solved at 50
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 252
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 252
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 252
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 252
      #|0..0..1..2..9..17..33..53..85..123..187..solved at 206
      #|0..0..1..2..9..17..33..53..85..123..186..260..405..solved at 428
      #|0..0..2..4..solved at 8
      #|0..0..1..2..9..17..33..53..85..123..187..solved at 206
      #|0..0..1..2..9..17..33..53..85..123..186..260..405..solved at 428
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..14..34..70..154..solved at 194
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..3..8..17..35..71..118..solved at 135
      #|0..0..solved at 2
      #|0..0..2..6..14..26..52..86..solved at 103
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..7..18..55..149..384..1013..2503..solved at 3131
      #|Arithmetic/fol quotations (84):
      #|  (op_bar_minus_gt : (A, B, (A) -> B, A) -> B)((x : A), (a : B), (v : (A) -> B)) == ((y : A) => if y == x { a } else { v(y) })
      #|  (termval : ((Num) -> Num, Term) -> Num)((v : (Num) -> Num), Z) == 0 && termval(v, V((n : Num))) == v(n) && termval(v, Suc((t : Term))) == SUC(termval(v, t)) && termval(v, op_plus_plus((s : Term), t)) == termval(v, s) + termval(v, t) && termval(v, op_star_star(s, t)) == termval(v, s) * termval(v, t)
      #|  (holds : ((Num) -> Num, Form) -> Bool)((v : (Num) -> Num), False) == false && holds(v, True) == true && holds(v, op_eq_eq_eq((s : Term), (t : Term))) == (termval(v, s) == termval(v, t)) && holds(v, op_lt_lt(s, t)) == (termval(v, s) < termval(v, t)) && holds(v, op_lt_lt_eq(s, t)) == (termval(v, s) <= termval(v, t)) && holds(v, Not((p : Form))) == !holds(v, p) && holds(v, op_amp_amp(p, (q : Form))) == (holds(v, p) && holds(v, q)) && holds(v, op_bar_bar(p, q)) == (holds(v, p) || holds(v, q)) && holds(v, op_minus_minus_gt(p, q)) == (holds(v, p) \226\134\146 holds(v, q)) && holds(v, op_lt_minus_gt(p, q)) == (holds(v, p) == holds(v, q)) && holds(v, op_bang_bang((x : Num), p)) == (\226\136\128 a : Num, holds(op_bar_minus_gt(x, a, v), p)) && holds(v, op_q_q(x, p)) == (\226\136\131 a : Num, holds(op_bar_minus_gt(x, a, v), p))
      #|  (arithtrue : (Form) -> Bool)((p : Form)) == (\226\136\128 v : (Num) -> Num, holds(v, p))
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, \226\136\128 y : _, \226\136\128 a : _, op_bar_minus_gt(x, y, v, a) == (if a == x { y } else { v(a) })
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, \226\136\128 y : _, op_bar_minus_gt(x, y, v, x) == y
      #|  \226\136\128 v : (_) -> _, \226\136\128 a : _, \226\136\128 b : _, \226\136\128 x : _, op_bar_minus_gt(x, a, op_bar_minus_gt(x, b, v)) == op_bar_minus_gt(x, a, v)
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, op_bar_minus_gt(x, v(x), v) == v
      #|  \226\136\128 x : _, (\226\136\128 v : (_) -> _, \226\136\128 a : _, (P : ((_) -> _) -> Bool)(op_bar_minus_gt(x, a, v))) == (\226\136\128 v : (_) -> _, P(v))
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, \226\136\128 y : _, \226\136\128 a : _, \226\136\128 b : _, !(x == y) \226\134\146 op_bar_minus_gt(x, a, op_bar_minus_gt(y, b, v)) == op_bar_minus_gt(y, b, op_bar_minus_gt(x, a, v))
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, v(x) == (t : _) \226\134\146 op_bar_minus_gt(x, t, v) == v
      #|  (op_bar_eq_gt : (Num, Term, Num) -> Term)((x : Num), (a : Term)) == op_bar_minus_gt(x, a, V)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 a : Term, op_bar_eq_gt(x, a, y) == (if y == x { a } else { V(y) })
      #|  \226\136\128 x : Num, op_bar_eq_gt(x, V(x)) == V
      #|  (FVT : (Term, Num) -> Bool)(Z) == {} && FVT(V((n : Num))) == {n} && FVT(Suc((t : Term))) == FVT(t) && FVT(op_plus_plus((s : Term), t)) == UNION(FVT(s), FVT(t)) && FVT(op_star_star(s, t)) == UNION(FVT(s), FVT(t))
      #|  (FV : (Form, Num) -> Bool)(False) == {} && FV(True) == {} && FV(op_eq_eq_eq((s : Term), (t : Term))) == UNION(FVT(s), FVT(t)) && FV(op_lt_lt(s, t)) == UNION(FVT(s), FVT(t)) && FV(op_lt_lt_eq(s, t)) == UNION(FVT(s), FVT(t)) && FV(Not((p : Form))) == FV(p) && FV(op_amp_amp(p, (q : Form))) == UNION(FV(p), FV(q)) && FV(op_bar_bar(p, q)) == UNION(FV(p), FV(q)) && FV(op_minus_minus_gt(p, q)) == UNION(FV(p), FV(q)) && FV(op_lt_minus_gt(p, q)) == UNION(FV(p), FV(q)) && FV(op_bang_bang((x : Num), p)) == DELETE(FV(p), x) && FV(op_q_q(x, p)) == DELETE(FV(p), x)
      #|  \226\136\128 t : Term, FINITE(FVT(t))
      #|  \226\136\128 p : Form, FINITE(FV(p))
      #|  (\226\136\128 p : Form, \226\136\128 q : Form, (axiom : (Form) -> Bool)(op_minus_minus_gt(p, op_minus_minus_gt(q, p)))) && (\226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))) && (\226\136\128 p : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))) && (\226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, axiom(op_minus_minus_gt(op_bang_bang(x, op_minus_minus_gt(p, q)), op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q))))) && (\226\136\128 x : Num, \226\136\128 p : Form, !IN(x, FV(p)) \226\134\146 axiom(op_minus_minus_gt(p, op_bang_bang(x, p)))) && (\226\136\128 x : Num, \226\136\128 t : Term, !IN(x, FVT(t)) \226\134\146 axiom(op_q_q(x, op_eq_eq_eq(V(x), t)))) && (\226\136\128 t : Term, axiom(op_eq_eq_eq(t, t))) && (\226\136\128 s : Term, \226\136\128 t : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(Suc(s), Suc(t))))) && (\226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_plus_plus(s, u), op_plus_plus(t, v)))))) && (\226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_star_star(s, u), op_star_star(t, v)))))) && (\226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_eq_eq_eq(s, u), op_eq_eq_eq(t, v)))))) && (\226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt(s, u), op_lt_lt(t, v)))))) && (\226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt_eq(s, u), op_lt_lt_eq(t, v)))))) && (\226\136\128 p : Form, \226\136\128 q : Form, axiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(p, q)))) && (\226\136\128 p : Form, \226\136\128 q : Form, axiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(q, p)))) && (\226\136\128 p : Form, \226\136\128 q : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(op_minus_minus_gt(q, p), op_lt_minus_gt(p, q))))) && axiom(op_lt_minus_gt(True, op_minus_minus_gt(False, False))) && (\226\136\128 p : Form, axiom(op_lt_minus_gt(Not(p), op_minus_minus_gt(p, False)))) && (\226\136\128 p : Form, \226\136\128 q : Form, axiom(op_lt_minus_gt(op_amp_amp(p, q), op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, False)), False)))) && (\226\136\128 p : Form, \226\136\128 q : Form, axiom(op_lt_minus_gt(op_bar_bar(p, q), Not(op_amp_amp(Not(p), Not(q)))))) && (\226\136\128 x : Num, \226\136\128 p : Form, axiom(op_lt_minus_gt(op_q_q(x, p), Not(op_bang_bang(x, Not(p))))))
      #|  (\226\136\128 p : Form, axiom(p) || IN(p, (A : (Form) -> Bool)) \226\134\146 (op_bar_minus_minus : ((Form) -> Bool, Form) -> Bool)(A, p)) && (\226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) && op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, q)) && (\226\136\128 p : Form, \226\136\128 x : Num, op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, op_bang_bang(x, p)))
      #|  \226\136\128 t : Term, \226\136\128 v : (Num) -> Num, \226\136\128 v' : (Num) -> Num, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v'(x) == v(x)) \226\134\146 termval(v', t) == termval(v, t)
      #|  \226\136\128 p : Form, \226\136\128 v : (Num) -> Num, \226\136\128 v' : (Num) -> Num, (\226\136\128 x : Num, IN(x, FV(p)) \226\134\146 v'(x) == v(x)) \226\134\146 holds(v', p) == holds(v, p)
      #|  \226\136\128 v : (Num) -> Num, \226\136\128 x : Num, \226\136\128 a : Num, \226\136\128 t : Term, !IN(x, FVT(t)) \226\134\146 termval(op_bar_minus_gt(x, a, v), t) == termval(v, t)
      #|  \226\136\128 v : (Num) -> Num, \226\136\128 x : Num, \226\136\128 a : Num, \226\136\128 p : Form, !IN(x, FV(p)) \226\134\146 holds(op_bar_minus_gt(x, a, v), p) == holds(v, p)
      #|  termval((v : (Num) -> Num), (t : Term))
      #|  \226\136\128 p : Form, axiom(p) \226\134\146 arithtrue(p)
      #|  ((a : Bool) || (b : Bool) \226\134\146 (c : Bool)) == ((a \226\134\146 c) && (b \226\134\146 c))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, (\226\136\128 q : Form, IN(q, A) \226\134\146 arithtrue(q)) && op_bar_minus_minus(A, p) \226\134\146 arithtrue(p)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, MAX(x, y) == MAX(y, x)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, MAX(x, MAX(y, z)) == MAX(MAX(x, y), z)
      #|  (SETMAX : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == ITSET(MAX, s, 0)
      #|  (VARIANT : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == SETMAX(s) + 1
      #|  (y : Num) <= (x : Num)
      #|  (x : Num) <= (y : Num)
      #|  (y : Num) <= (s : Num)
      #|  (x : Num) <= (s : Num)
      #|  SETMAX({}) == 0 && (\226\136\128 x : Num, \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 SETMAX(INSERT(x, s)) == (if IN(x, s) { SETMAX(s) } else { MAX(x, SETMAX(s)) }))
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 (\226\136\128 x : Num, IN(x, s) \226\134\146 x <= SETMAX(s))
      #|  SETMAX({}) == 0 && (\226\136\128 x : Num, \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 SETMAX(INSERT(x, s)) == MAX(x, SETMAX(s)))
      #|  UNION(INSERT((x : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == INSERT(x, UNION(s, t))
      #|  \226\136\128 t : (Num) -> Bool, FINITE(t) \226\134\146 (\226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t)))
      #|  \226\136\128 s : (Num) -> Bool, \226\136\128 t : (Num) -> Bool, FINITE(UNION(s, t)) \226\134\146 SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t))
      #|  !((x : Num) + 1 <= x)
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 !IN(VARIANT(s), s)
      #|  \226\136\128 p : Form, !IN(VARIANT(FV(p)), FV(p))
      #|  \226\136\128 s : (Num) -> Bool, \226\136\128 t : (Num) -> Bool, FINITE(s) && SUBSET(t, s) \226\134\146 !IN(VARIANT(s), t)
      #|  (termsubst : ((Num) -> Term, Term) -> Term)((v : (Num) -> Term), Z) == Z && (\226\136\128 x : Num, termsubst(v, V(x)) == v(x)) && (\226\136\128 t : Term, termsubst(v, Suc(t)) == Suc(termsubst(v, t))) && (\226\136\128 s : Term, \226\136\128 t : Term, termsubst(v, op_plus_plus(s, t)) == op_plus_plus(termsubst(v, s), termsubst(v, t))) && (\226\136\128 s : Term, \226\136\128 t : Term, termsubst(v, op_star_star(s, t)) == op_star_star(termsubst(v, s), termsubst(v, t)))
      #|  \226\136\128 v : (Num) -> Num, \226\136\128 i : (Num) -> Term, \226\136\128 t : Term, termval(v, termsubst(i, t)) == termval(o(termval(v), i), t)
      #|  \226\136\128 i : (Num) -> Term, \226\136\128 j : (Num) -> Term, \226\136\128 t : Term, termsubst(j, termsubst(i, t)) == termsubst(o(termsubst(j), i), t)
      #|  \226\136\128 t : Term, termsubst(V, t) == t
      #|  \226\136\128 t : Term, \226\136\128 v : (Num) -> Term, \226\136\128 v' : (Num) -> Term, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v'(x) == v(x)) \226\134\146 termsubst(v', t) == termsubst(v, t)
      #|  \226\136\128 t : Term, \226\136\128 i : (Num) -> Term, FVT(termsubst(i, t)) == {(x : Num) | \226\136\131 y : Num, IN(y, FVT(t)) && IN(x, FVT(i(y)))}
      #|  \226\136\128 x : Num, \226\136\128 s : Term, \226\136\128 t : Term, !IN(x, FVT(t)) \226\134\146 termsubst(op_bar_eq_gt(x, s), t) == t
      #|  \226\136\128 v : (Num) -> Term, \226\136\128 t : Term, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v(x) == V(x)) \226\134\146 termsubst(v, t) == t
      #|  (formsubst : ((Num) -> Term, Form) -> Form)((v : (Num) -> Term), False) == False && formsubst(v, True) == True && formsubst(v, op_eq_eq_eq((s : Term), (t : Term))) == op_eq_eq_eq(termsubst(v, s), termsubst(v, t)) && formsubst(v, op_lt_lt(s, t)) == op_lt_lt(termsubst(v, s), termsubst(v, t)) && formsubst(v, op_lt_lt_eq(s, t)) == op_lt_lt_eq(termsubst(v, s), termsubst(v, t)) && formsubst(v, Not((p : Form))) == Not(formsubst(v, p)) && formsubst(v, op_amp_amp(p, (q : Form))) == op_amp_amp(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_bar_bar(p, q)) == op_bar_bar(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_minus_minus_gt(p, q)) == op_minus_minus_gt(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_lt_minus_gt(p, q)) == op_lt_minus_gt(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_bang_bang((x : Num), q)) == LET((z : Num) => LET_END(op_bang_bang(z, formsubst(op_bar_minus_gt(x, V(z), v), q))), if (\226\136\131 y : Num, IN(y, FV(op_bang_bang(x, q))) && IN(x, FVT(v(y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(x, V(x), v), q))) } else { x }) && formsubst(v, op_q_q(x, q)) == LET((z : Num) => LET_END(op_q_q(z, formsubst(op_bar_minus_gt(x, V(z), v), q))), if (\226\136\131 y : Num, IN(y, FV(op_q_q(x, q))) && IN(x, FVT(v(y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(x, V(x), v), q))) } else { x })
      #|  formsubst(op_bar_minus_gt((x : Num), V(x), (i : (Num) -> Term)), (p : Form))
      #|  !(\226\136\131 y : Num, IN(y, DELETE(FV((p : Form)), (x : Num))) && IN((z : Num), FVT((i : (Num) -> Term)(y))))
      #|  (i : (Num) -> Term)
      #|  (p : Form)
      #|  (x : Num)
      #|  \226\136\128 p : Form, (\226\136\128 i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | \226\136\131 y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}) && (\226\136\128 i : (Num) -> Term, \226\136\128 v : (Num) -> Num, holds(v, formsubst(i, p)) == holds(o(termval(v), i), p))
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | \226\136\131 y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, \226\136\128 v : (Num) -> Num, holds(v, formsubst(i, p)) == holds(o(termval(v), i), p)
      #|  (a : Bool) && (a \226\134\146 (b : Bool)) \226\134\146 a && b
      #|  (j : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  (p : Form)
      #|  (x : Num)
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, \226\136\128 j : (Num) -> Term, (\226\136\128 x : Num, IN(x, FV(p)) \226\134\146 i(x) == j(x)) \226\134\146 formsubst(i, p) == formsubst(j, p)
      #|  \226\136\128 p : Form, formsubst(V, p) == p
      #|  \226\136\128 v : (Num) -> Term, \226\136\128 p : Form, (\226\136\128 x : Num, IN(x, FV(p)) \226\134\146 v(x) == V(x)) \226\134\146 formsubst(v, p) == p
      #|  (safe_for : (Num, (Num) -> Term) -> Bool)((x : Num), (v : (Num) -> Term)) == (\226\136\128 y : Num, IN(x, FVT(v(y))) \226\134\146 y == x)
      #|  \226\136\128 x : Num, safe_for(x, V)
      #|  \226\136\128 v : (Num) -> Term, \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 t : Term, safe_for(x, v) && (IN(x, FVT(t)) \226\134\146 y == x) \226\134\146 safe_for(x, op_bar_minus_gt(y, t, v))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 t : Term, safe_for(x, op_bar_eq_gt(y, t)) == (IN(x, FVT(t)) \226\134\146 y == x)
      #|  (\226\136\128 v : (Num) -> Term, \226\136\128 x : Num, \226\136\128 p : Form, safe_for(x, v) \226\134\146 formsubst(v, op_bang_bang(x, p)) == op_bang_bang(x, formsubst(op_bar_minus_gt(x, V(x), v), p))) && (\226\136\128 v : (Num) -> Term, \226\136\128 x : Num, \226\136\128 p : Form, safe_for(x, v) \226\134\146 formsubst(v, op_q_q(x, p)) == op_q_q(x, formsubst(op_bar_minus_gt(x, V(x), v), p)))
      #|  (qsubst : ((Num, Term), Form) -> Form)(((x : Num), (t : Term)), (p : Form)) == op_q_q(x, op_amp_amp(op_eq_eq_eq(V(x), t), p))
      #|  \226\136\128 x : Num, \226\136\128 n : _, \226\136\128 p : Form, FV(qsubst((x, (t : Term)), p)) == DELETE(UNION(FV(p), FVT(t)), x)
      #|  \226\136\128 v : (Num) -> Num, \226\136\128 z : Num, termval(op_bar_minus_gt((x : Num), z, v), (t : Term)) == termval(v, t)
      #|  \226\136\128 v : _, \226\136\128 t : Term, \226\136\128 p : Form, \226\136\128 v : (Num) -> Num, !IN((x : Num), FVT(t)) \226\134\146 holds(v, qsubst((x, t), p)) == holds(op_bar_minus_gt(x, termval(v, t), v), p)
      #|  (numeral : (Num) -> Term)(0) == Z && (\226\136\128 n : Num, numeral(SUC(n)) == Suc(numeral(n)))
      #|  \226\136\128 v : (Num) -> Num, \226\136\128 n : Num, termval(v, numeral(n)) == n
      #|  \226\136\128 n : Num, FVT(numeral(n)) == {}
      #|  (closed : (Form) -> Bool)((p : Form)) == (FV(p) == {})
      #|term_INDUCT =  |- (#forall:fun(fun(fun(term,bool),bool),bool) (\P:fun(term,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(term,bool) #Z:term)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (P:fun(term,bool) (#V:fun(num,term) a:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a:term. ((#==>:fun(bool,fun(bool,bool)) (P:fun(term,bool) a:term)) (P:fun(term,bool) (#Suc:fun(term,term) a:term)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(term,bool) a0:term)) (P:fun(term,bool) a1:term))) (P:fun(term,bool) ((#++:fun(term,fun(term,term)) a0:term) a1:term)))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(term,bool) a0:term)) (P:fun(term,bool) a1:term))) (P:fun(term,bool) ((#**:fun(term,fun(term,term)) a0:term) a1:term)))))))))))) (#forall:fun(fun(term,bool),bool) (\x:term. (P:fun(term,bool) x:term))))))
      #|term_RECURSION =  |- (#forall:fun(fun('Z,bool),bool) (\f0:'Z. (#forall:fun(fun(fun(num,'Z),bool),bool) (\f1:fun(num,'Z). (#forall:fun(fun(fun(term,fun('Z,'Z)),bool),bool) (\f2:fun(term,fun('Z,'Z)). (#forall:fun(fun(fun(term,fun(term,fun('Z,fun('Z,'Z)))),bool),bool) (\f3:fun(term,fun(term,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(term,fun(term,fun('Z,fun('Z,'Z)))),bool),bool) (\f4:fun(term,fun(term,fun('Z,fun('Z,'Z)))). (#?:fun(fun(fun(term,'Z),bool),bool) (\fn_:fun(term,'Z). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) #Z:term)) f0:'Z)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) (#V:fun(num,term) a:num))) (f1:fun(num,'Z) a:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) (#Suc:fun(term,term) a:term))) ((f2:fun(term,fun('Z,'Z)) a:term) (fn_:fun(term,'Z) a:term)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) ((#++:fun(term,fun(term,term)) a0:term) a1:term))) ((((f3:fun(term,fun(term,fun('Z,fun('Z,'Z)))) a0:term) a1:term) (fn_:fun(term,'Z) a0:term)) (fn_:fun(term,'Z) a1:term)))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) ((#**:fun(term,fun(term,term)) a0:term) a1:term))) ((((f4:fun(term,fun(term,fun('Z,fun('Z,'Z)))) a0:term) a1:term) (fn_:fun(term,'Z) a0:term)) (fn_:fun(term,'Z) a1:term)))))))))))))))))))))))
      #|term_CASES =  |- (#forall:fun(fun(term,bool),bool) (\x:term. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) x:term) #Z:term)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\a:num. ((#=:fun(term,fun(term,bool)) x:term) (#V:fun(num,term) a:num))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\a:term. ((#=:fun(term,fun(term,bool)) x:term) (#Suc:fun(term,term) a:term))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\a0:term. (#?:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(term,fun(term,bool)) x:term) ((#++:fun(term,fun(term,term)) a0:term) a1:term))))))) (#?:fun(fun(term,bool),bool) (\a0:term. (#?:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(term,fun(term,bool)) x:term) ((#**:fun(term,fun(term,term)) a0:term) a1:term))))))))))))
      #|term_DISTINCT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a':num. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) #Z:term) (#V:fun(num,term) a':num)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) #Z:term) (#Suc:fun(term,term) a':term)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) #Z:term) ((#++:fun(term,fun(term,term)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) #Z:term) ((#**:fun(term,fun(term,term)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(term,bool),bool) (\a':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) a:num)) (#Suc:fun(term,term) a':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) a:num)) ((#++:fun(term,fun(term,term)) a0':term) a1':term)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) a:num)) ((#**:fun(term,fun(term,term)) a0':term) a1':term)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#Suc:fun(term,term) a:term)) ((#++:fun(term,fun(term,term)) a0':term) a1':term)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#Suc:fun(term,term) a:term)) ((#**:fun(term,fun(term,term)) a0':term) a1':term)))))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) ((#++:fun(term,fun(term,term)) a0:term) a1:term)) ((#**:fun(term,fun(term,term)) a0':term) a1':term))))))))))))))))))))
      #|term_INJ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\a':num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) a:num)) (#V:fun(num,term) a':num))) ((#=:fun(num,fun(num,bool)) a:num) a':num))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(term,bool),bool) (\a':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) (#Suc:fun(term,term) a:term)) (#Suc:fun(term,term) a':term))) ((#=:fun(term,fun(term,bool)) a:term) a':term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) ((#++:fun(term,fun(term,term)) a0:term) a1:term)) ((#++:fun(term,fun(term,term)) a0':term) a1':term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) a0':term)) ((#=:fun(term,fun(term,bool)) a1:term) a1':term)))))))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) ((#**:fun(term,fun(term,term)) a0:term) a1:term)) ((#**:fun(term,fun(term,term)) a0':term) a1':term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) a0':term)) ((#=:fun(term,fun(term,bool)) a1:term) a1':term))))))))))))))
      #|form_INDUCT =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\P:fun(form,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) #False:form)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) #True:form)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (P:fun(form,bool) ((#===:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (P:fun(form,bool) ((#<<:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (P:fun(form,bool) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. ((#==>:fun(bool,fun(bool,bool)) (P:fun(form,bool) a:form)) (P:fun(form,bool) (#Not:fun(form,form) a:form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) a0:form)) (P:fun(form,bool) a1:form))) (P:fun(form,bool) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) a0:form)) (P:fun(form,bool) a1:form))) (P:fun(form,bool) ((#||:fun(form,fun(form,form)) a0:form) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) a0:form)) (P:fun(form,bool) a1:form))) (P:fun(form,bool) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) a0:form)) (P:fun(form,bool) a1:form))) (P:fun(form,bool) ((#<->:fun(form,fun(form,form)) a0:form) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) (P:fun(form,bool) a1:form)) (P:fun(form,bool) ((#!!:fun(num,fun(form,form)) a0:num) a1:form)))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) (P:fun(form,bool) a1:form)) (P:fun(form,bool) ((#??:fun(num,fun(form,form)) a0:num) a1:form))))))))))))))))))) (#forall:fun(fun(form,bool),bool) (\x:form. (P:fun(form,bool) x:form))))))
      #|form_RECURSION =  |- (#forall:fun(fun('Z,bool),bool) (\f0:'Z. (#forall:fun(fun('Z,bool),bool) (\f1:'Z. (#forall:fun(fun(fun(term,fun(term,'Z)),bool),bool) (\f2:fun(term,fun(term,'Z)). (#forall:fun(fun(fun(term,fun(term,'Z)),bool),bool) (\f3:fun(term,fun(term,'Z)). (#forall:fun(fun(fun(term,fun(term,'Z)),bool),bool) (\f4:fun(term,fun(term,'Z)). (#forall:fun(fun(fun(form,fun('Z,'Z)),bool),bool) (\f5:fun(form,fun('Z,'Z)). (#forall:fun(fun(fun(form,fun(form,fun('Z,fun('Z,'Z)))),bool),bool) (\f6:fun(form,fun(form,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(form,fun(form,fun('Z,fun('Z,'Z)))),bool),bool) (\f7:fun(form,fun(form,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(form,fun(form,fun('Z,fun('Z,'Z)))),bool),bool) (\f8:fun(form,fun(form,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(form,fun(form,fun('Z,fun('Z,'Z)))),bool),bool) (\f9:fun(form,fun(form,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(num,fun(form,fun('Z,'Z))),bool),bool) (\f10:fun(num,fun(form,fun('Z,'Z))). (#forall:fun(fun(fun(num,fun(form,fun('Z,'Z))),bool),bool) (\f11:fun(num,fun(form,fun('Z,'Z))). (#?:fun(fun(fun(form,'Z),bool),bool) (\fn_:fun(form,'Z). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) #False:form)) f0:'Z)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) #True:form)) f1:'Z)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#===:fun(term,fun(term,form)) a0:term) a1:term))) ((f2:fun(term,fun(term,'Z)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#<<:fun(term,fun(term,form)) a0:term) a1:term))) ((f3:fun(term,fun(term,'Z)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term))) ((f4:fun(term,fun(term,'Z)) a0:term) a1:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) (#Not:fun(form,form) a:form))) ((f5:fun(form,fun('Z,'Z)) a:form) (fn_:fun(form,'Z) a:form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#&&:fun(form,fun(form,form)) a0:form) a1:form))) ((((f6:fun(form,fun(form,fun('Z,fun('Z,'Z)))) a0:form) a1:form) (fn_:fun(form,'Z) a0:form)) (fn_:fun(form,'Z) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#||:fun(form,fun(form,form)) a0:form) a1:form))) ((((f7:fun(form,fun(form,fun('Z,fun('Z,'Z)))) a0:form) a1:form) (fn_:fun(form,'Z) a0:form)) (fn_:fun(form,'Z) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#-->:fun(form,fun(form,form)) a0:form) a1:form))) ((((f8:fun(form,fun(form,fun('Z,fun('Z,'Z)))) a0:form) a1:form) (fn_:fun(form,'Z) a0:form)) (fn_:fun(form,'Z) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#<->:fun(form,fun(form,form)) a0:form) a1:form))) ((((f9:fun(form,fun(form,fun('Z,fun('Z,'Z)))) a0:form) a1:form) (fn_:fun(form,'Z) a0:form)) (fn_:fun(form,'Z) a1:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#!!:fun(num,fun(form,form)) a0:num) a1:form))) (((f10:fun(num,fun(form,fun('Z,'Z))) a0:num) a1:form) (fn_:fun(form,'Z) a1:form)))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#??:fun(num,fun(form,form)) a0:num) a1:form))) (((f11:fun(num,fun(form,fun('Z,'Z))) a0:num) a1:form) (fn_:fun(form,'Z) a1:form))))))))))))))))))))))))))))))))))))))))))))
      #|form_CASES =  |- (#forall:fun(fun(form,bool),bool) (\x:form. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) x:form) #False:form)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) x:form) #True:form)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\a0:term. (#?:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(form,fun(form,bool)) x:form) ((#===:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\a0:term. (#?:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(form,fun(form,bool)) x:form) ((#<<:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\a0:term. (#?:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(form,fun(form,bool)) x:form) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a:form. ((#=:fun(form,fun(form,bool)) x:form) (#Not:fun(form,form) a:form))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a0:form. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#&&:fun(form,fun(form,form)) a0:form) a1:form))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a0:form. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#||:fun(form,fun(form,form)) a0:form) a1:form))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a0:form. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#-->:fun(form,fun(form,form)) a0:form) a1:form))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a0:form. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#<->:fun(form,fun(form,form)) a0:form) a1:form))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\a0:num. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#!!:fun(num,fun(form,form)) a0:num) a1:form))))))) (#?:fun(fun(num,bool),bool) (\a0:num. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#??:fun(num,fun(form,form)) a0:num) a1:form)))))))))))))))))))
      #|form_DISTINCT =  |- ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) #True:form))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#===:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#<<:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#<<=:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) (#Not:fun(form,form) a':form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#===:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#<<:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#<<=:fun(term,fun(term,form)) a0':term) a1':term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) (#Not:fun(form,form) a':form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #True:form) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#<<:fun(term,fun(term,form)) a0':term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#<<=:fun(term,fun(term,form)) a0':term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) (#Not:fun(form,form) a':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#<<=:fun(term,fun(term,form)) a0':term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) (#Not:fun(form,form) a':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) (#Not:fun(form,form) a':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#&&:fun(form,fun(form,form)) a0':form) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#||:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) a0:form) a1:form)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) a0:form) a1:form)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) a0:form) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) a0:form) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<->:fun(form,fun(form,form)) a0:form) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#<->:fun(form,fun(form,form)) a0:form) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#!!:fun(num,fun(form,form)) a0:num) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
      #|form_INJ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#===:fun(term,fun(term,form)) a0:term) a1:term)) ((#===:fun(term,fun(term,form)) a0':term) a1':term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) a0':term)) ((#=:fun(term,fun(term,bool)) a1:term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#<<:fun(term,fun(term,form)) a0:term) a1:term)) ((#<<:fun(term,fun(term,form)) a0':term) a1':term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) a0':term)) ((#=:fun(term,fun(term,bool)) a1:term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. (#forall:fun(fun(term,bool),bool) (\a0':term. (#forall:fun(fun(term,bool),bool) (\a1':term. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#<<=:fun(term,fun(term,form)) a0:term) a1:term)) ((#<<=:fun(term,fun(term,form)) a0':term) a1':term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) a0':term)) ((#=:fun(term,fun(term,bool)) a1:term) a1':term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a:form. (#forall:fun(fun(form,bool),bool) (\a':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) a:form)) (#Not:fun(form,form) a':form))) ((#=:fun(form,fun(form,bool)) a:form) a':form))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) a0:form) a1:form)) ((#&&:fun(form,fun(form,form)) a0':form) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a0:form) a0':form)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) a0:form) a1:form)) ((#||:fun(form,fun(form,form)) a0':form) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a0:form) a0':form)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a0:form) a0':form)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#<->:fun(form,fun(form,form)) a0:form) a1:form)) ((#<->:fun(form,fun(form,form)) a0':form) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a0:form) a0':form)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#!!:fun(num,fun(form,form)) a0:num) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a0:num) a0':num)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#??:fun(num,fun(form,form)) a0:num) a1:form)) ((#??:fun(num,fun(form,form)) a0':num) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a0:num) a0':num)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form))))))))))))))))))))
      #|valmod =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\a:'B. (#forall:fun(fun(fun('A,'B),bool),bool) (\v:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (((#|->:fun('A,fun('B,fun(fun('A,'B),fun('A,'B)))) x:'A) a:'B) v:fun('A,'B))) (\y:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) ((#=:fun('A,fun('A,bool)) y:'A) x:'A)) a:'B) (v:fun('A,'B) y:'A))))))))))
      #|termval =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) #Z:term)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) (#V:fun(num,term) n:num))) (v:fun(num,num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) (#Suc:fun(term,term) t:term))) (#SUC:fun(num,num) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) ((#++:fun(term,fun(term,term)) s:term) t:term))) ((#+:fun(num,fun(num,num)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) s:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) ((#**:fun(term,fun(term,term)) s:term) t:term))) ((#*:fun(num,fun(num,num)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) s:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))))))
      #|holds =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) #False:form)) #F:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) #True:form)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) s:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#<<:fun(term,fun(term,form)) s:term) t:term))) ((#<:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) s:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#<<=:fun(term,fun(term,form)) s:term) t:term))) ((#<=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) s:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) (#Not:fun(form,form) p:form))) (#~:fun(bool,bool) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#/\:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#\/:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#==>:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) (#forall:fun(fun(num,bool),bool) (\a:num. ((#holds:fun(fun(num,num),fun(form,bool)) (((#|->:fun(num,fun(num,fun(fun(num,num),fun(num,num)))) x:num) a:num) v:fun(num,num))) p:form))))) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#??:fun(num,fun(form,form)) x:num) p:form))) (#?:fun(fun(num,bool),bool) (\a:num. ((#holds:fun(fun(num,num),fun(form,bool)) (((#|->:fun(num,fun(num,fun(fun(num,num),fun(num,num)))) x:num) a:num) v:fun(num,num))) p:form)))))))))))))))
      #|arithtrue =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (#arithtrue:fun(form,bool) p:form)) (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form))))))
      #|VALMOD =  |- (#forall:fun(fun(fun('?1,'?2),bool),bool) (\v:fun('?1,'?2). (#forall:fun(fun('?1,bool),bool) (\x:'?1. (#forall:fun(fun('?2,bool),bool) (\y:'?2. (#forall:fun(fun('?1,bool),bool) (\a:'?1. ((#=:fun('?2,fun('?2,bool)) ((((#|->:fun('?1,fun('?2,fun(fun('?1,'?2),fun('?1,'?2)))) x:'?1) y:'?2) v:fun('?1,'?2)) a:'?1)) (((#COND:fun(bool,fun('?2,fun('?2,'?2))) ((#=:fun('?1,fun('?1,bool)) a:'?1) x:'?1)) y:'?2) (v:fun('?1,'?2) a:'?1)))))))))))
      #|VALMOD_BASIC =  |- (#forall:fun(fun(fun('?3,'?4),bool),bool) (\v:fun('?3,'?4). (#forall:fun(fun('?3,bool),bool) (\x:'?3. (#forall:fun(fun('?4,bool),bool) (\y:'?4. ((#=:fun('?4,fun('?4,bool)) ((((#|->:fun('?3,fun('?4,fun(fun('?3,'?4),fun('?3,'?4)))) x:'?3) y:'?4) v:fun('?3,'?4)) x:'?3)) y:'?4)))))))
      #|VALMOD_VALMOD_BASIC =  |- (#forall:fun(fun(fun('?5,'?6),bool),bool) (\v:fun('?5,'?6). (#forall:fun(fun('?6,bool),bool) (\a:'?6. (#forall:fun(fun('?6,bool),bool) (\b:'?6. (#forall:fun(fun('?5,bool),bool) (\x:'?5. ((#=:fun(fun('?5,'?6),fun(fun('?5,'?6),bool)) (((#|->:fun('?5,fun('?6,fun(fun('?5,'?6),fun('?5,'?6)))) x:'?5) a:'?6) (((#|->:fun('?5,fun('?6,fun(fun('?5,'?6),fun('?5,'?6)))) x:'?5) b:'?6) v:fun('?5,'?6)))) (((#|->:fun('?5,fun('?6,fun(fun('?5,'?6),fun('?5,'?6)))) x:'?5) a:'?6) v:fun('?5,'?6)))))))))))
      #|VALMOD_REPEAT =  |- (#forall:fun(fun(fun('?7,'?8),bool),bool) (\v:fun('?7,'?8). (#forall:fun(fun('?7,bool),bool) (\x:'?7. ((#=:fun(fun('?7,'?8),fun(fun('?7,'?8),bool)) (((#|->:fun('?7,fun('?8,fun(fun('?7,'?8),fun('?7,'?8)))) x:'?7) (v:fun('?7,'?8) x:'?7)) v:fun('?7,'?8))) v:fun('?7,'?8))))))
      #|FORALL_VALMOD =  |- (#forall:fun(fun('?9,bool),bool) (\x:'?9. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?9,'?10),bool),bool) (\v:fun('?9,'?10). (#forall:fun(fun('?10,bool),bool) (\a:'?10. (P:fun(fun('?9,'?10),bool) (((#|->:fun('?9,fun('?10,fun(fun('?9,'?10),fun('?9,'?10)))) x:'?9) a:'?10) v:fun('?9,'?10)))))))) (#forall:fun(fun(fun('?9,'?10),bool),bool) (\v:fun('?9,'?10). (P:fun(fun('?9,'?10),bool) v:fun('?9,'?10)))))))
      #|VALMOD_SWAP =  |- (#forall:fun(fun(fun('?11,'?12),bool),bool) (\v:fun('?11,'?12). (#forall:fun(fun('?11,bool),bool) (\x:'?11. (#forall:fun(fun('?11,bool),bool) (\y:'?11. (#forall:fun(fun('?12,bool),bool) (\a:'?12. (#forall:fun(fun('?12,bool),bool) (\b:'?12. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?11,fun('?11,bool)) x:'?11) y:'?11))) ((#=:fun(fun('?11,'?12),fun(fun('?11,'?12),bool)) (((#|->:fun('?11,fun('?12,fun(fun('?11,'?12),fun('?11,'?12)))) x:'?11) a:'?12) (((#|->:fun('?11,fun('?12,fun(fun('?11,'?12),fun('?11,'?12)))) y:'?11) b:'?12) v:fun('?11,'?12)))) (((#|->:fun('?11,fun('?12,fun(fun('?11,'?12),fun('?11,'?12)))) y:'?11) b:'?12) (((#|->:fun('?11,fun('?12,fun(fun('?11,'?12),fun('?11,'?12)))) x:'?11) a:'?12) v:fun('?11,'?12)))))))))))))))
      #|VALMOD_TRIVIAL =  |- (#forall:fun(fun(fun('?13,'?14),bool),bool) (\v:fun('?13,'?14). (#forall:fun(fun('?13,bool),bool) (\x:'?13. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?14,fun('?14,bool)) (v:fun('?13,'?14) x:'?13)) t:'?14)) ((#=:fun(fun('?13,'?14),fun(fun('?13,'?14),bool)) (((#|->:fun('?13,fun('?14,fun(fun('?13,'?14),fun('?13,'?14)))) x:'?13) t:'?14) v:fun('?13,'?14))) v:fun('?13,'?14)))))))
      #|assign =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\a:term. ((#=:fun(fun(num,term),fun(fun(num,term),bool)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) a:term)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) a:term) #V:fun(num,term)))))))
      #|ASSIGN =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(term,bool),bool) (\a:term. ((#=:fun(term,fun(term,bool)) (((#|=>:fun(num,fun(term,fun(num,term))) x:num) a:term) y:num)) (((#COND:fun(bool,fun(term,fun(term,term))) ((#=:fun(num,fun(num,bool)) y:num) x:num)) a:term) (#V:fun(num,term) y:num)))))))))
      #|ASSIGN_TRIV =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(fun(num,term),fun(fun(num,term),bool)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) (#V:fun(num,term) x:num))) #V:fun(num,term))))
      #|FVT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) #Z:term)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) (#V:fun(num,term) n:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) n:num) #EMPTY:fun(num,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) (#Suc:fun(term,term) t:term))) (#FVT:fun(term,fun(num,bool)) t:term))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#++:fun(term,fun(term,term)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#**:fun(term,fun(term,term)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))))))
      #|FV =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) #False:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) #True:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#<<:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#<<=:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) (#Not:fun(form,form) p:form))) (#FV:fun(form,fun(num,bool)) p:form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FV:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FV:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FV:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FV:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) x:num))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) x:num)))))))))))))
      #|FVT_FINITE =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#FINITE:fun(fun(num,bool),bool) (#FVT:fun(term,fun(num,bool)) t:term))))
      #|FV_FINITE =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#FINITE:fun(fun(num,bool),bool) (#FV:fun(form,fun(num,bool)) p:form))))
      #|axiom_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) #False:form)) p:form))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) p:form))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) (#axiom:fun(form,bool) ((#??:fun(num,fun(form,form)) x:num) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\t:term. (#axiom:fun(form,bool) ((#===:fun(term,fun(term,form)) t:term) t:term))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) (#Suc:fun(term,term) s:term)) (#Suc:fun(term,term) t:term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#++:fun(term,fun(term,term)) s:term) u:term)) ((#++:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#**:fun(term,fun(term,term)) s:term) u:term)) ((#**:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) u:term)) ((#===:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<:fun(term,fun(term,form)) s:term) u:term)) ((#<<:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<=:fun(term,fun(term,form)) s:term) u:term)) ((#<<=:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)) ((#<->:fun(form,fun(form,form)) p:form) q:form))))))))) ((#/\:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) ((#<->:fun(form,fun(form,form)) #True:form) ((#-->:fun(form,fun(form,form)) #False:form) #False:form)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#axiom:fun(form,bool) ((#<->:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form))) #False:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#axiom:fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#||:fun(form,fun(form,form)) p:form) q:form)) (#Not:fun(form,form) ((#&&:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form)))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#axiom:fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) (#Not:fun(form,form) ((#!!:fun(num,fun(form,form)) x:num) (#Not:fun(form,form) p:form)))))))))))))))))))))))))))))
      #|axiom_INDUCT =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\axiom':fun(form,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) #False:form)) p:form))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) p:form))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) (axiom':fun(form,bool) ((#??:fun(num,fun(form,form)) x:num) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\t:term. (axiom':fun(form,bool) ((#===:fun(term,fun(term,form)) t:term) t:term))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) (#Suc:fun(term,term) s:term)) (#Suc:fun(term,term) t:term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#++:fun(term,fun(term,term)) s:term) u:term)) ((#++:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#**:fun(term,fun(term,term)) s:term) u:term)) ((#**:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) u:term)) ((#===:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<:fun(term,fun(term,form)) s:term) u:term)) ((#<<:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<=:fun(term,fun(term,form)) s:term) u:term)) ((#<<=:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)) ((#<->:fun(form,fun(form,form)) p:form) q:form))))))))) ((#/\:fun(bool,fun(bool,bool)) (axiom':fun(form,bool) ((#<->:fun(form,fun(form,form)) #True:form) ((#-->:fun(form,fun(form,form)) #False:form) #False:form)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (axiom':fun(form,bool) ((#<->:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form))) #False:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (axiom':fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#||:fun(form,fun(form,form)) p:form) q:form)) (#Not:fun(form,form) ((#&&:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form)))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (axiom':fun(form,bool) ((#<->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) (#Not:fun(form,form) ((#!!:fun(num,fun(form,form)) x:num) (#Not:fun(form,form) p:form)))))))))))))))))))))))))))))) (#forall:fun(fun(form,bool),bool) (\a:form. ((#==>:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) a:form)) (axiom':fun(form,bool) a:form)))))))
      #|axiom_CASES =  |- (#forall:fun(fun(form,bool),bool) (\a:form. ((#=:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) a:form)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. (#?:fun(fun(form,bool),bool) (\r:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) #False:form)) p:form))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(form,bool),bool) (\p:form. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) p:form)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(term,bool),bool) (\t:term. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a:form) ((#??:fun(num,fun(form,form)) x:num) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\t:term. ((#=:fun(form,fun(form,bool)) a:form) ((#===:fun(term,fun(term,form)) t:term) t:term))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) (#Suc:fun(term,term) s:term)) (#Suc:fun(term,term) t:term))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. (#?:fun(fun(term,bool),bool) (\u:term. (#?:fun(fun(term,bool),bool) (\v:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#++:fun(term,fun(term,term)) s:term) u:term)) ((#++:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. (#?:fun(fun(term,bool),bool) (\u:term. (#?:fun(fun(term,bool),bool) (\v:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#**:fun(term,fun(term,term)) s:term) u:term)) ((#**:fun(term,fun(term,term)) t:term) v:term)))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. (#?:fun(fun(term,bool),bool) (\u:term. (#?:fun(fun(term,bool),bool) (\v:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) u:term)) ((#===:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. (#?:fun(fun(term,bool),bool) (\u:term. (#?:fun(fun(term,bool),bool) (\v:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<:fun(term,fun(term,form)) s:term) u:term)) ((#<<:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\s:term. (#?:fun(fun(term,bool),bool) (\t:term. (#?:fun(fun(term,bool),bool) (\u:term. (#?:fun(fun(term,bool),bool) (\v:term. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<=:fun(term,fun(term,form)) s:term) u:term)) ((#<<=:fun(term,fun(term,form)) t:term) v:term)))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)) ((#<->:fun(form,fun(form,form)) p:form) q:form))))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a:form) ((#<->:fun(form,fun(form,form)) #True:form) ((#-->:fun(form,fun(form,form)) #False:form) #False:form)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) a:form) ((#<->:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#<->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form))) #False:form)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) a:form) ((#<->:fun(form,fun(form,form)) ((#||:fun(form,fun(form,form)) p:form) q:form)) (#Not:fun(form,form) ((#&&:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form)))))))))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) a:form) ((#<->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) (#Not:fun(form,form) ((#!!:fun(num,fun(form,form)) x:num) (#Not:fun(form,form) p:form))))))))))))))))))))))))))))))))
      #|proves_RULES =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) p:form)) ((#IN:fun(form,fun(fun(form,bool),bool)) p:form) A:fun(form,bool)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) q:form))))))) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form)))))))))))
      #|proves_INDUCT =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(fun(form,bool),bool),bool) (\|--':fun(form,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) p:form)) ((#IN:fun(form,fun(fun(form,bool),bool)) p:form) A:fun(form,bool)))) (|--':fun(form,bool) p:form))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (|--':fun(form,bool) ((#-->:fun(form,fun(form,form)) p:form) q:form))) (|--':fun(form,bool) p:form))) (|--':fun(form,bool) q:form))))))) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (|--':fun(form,bool) p:form)) (|--':fun(form,bool) ((#!!:fun(num,fun(form,form)) x:num) p:form)))))))))) (#forall:fun(fun(form,bool),bool) (\a:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) a:form)) (|--':fun(form,bool) a:form)))))))))
      #|proves_CASES =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\a:form. ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) a:form)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) a:form)) ((#IN:fun(form,fun(fun(form,bool),bool)) a:form) A:fun(form,bool)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\p:form. ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) a:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))))) (#?:fun(fun(form,bool),bool) (\p:form. (#?:fun(fun(num,bool),bool) (\x:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a:form) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form)))))))))))))
      #|TERMVAL_VALUATION =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\v':fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(num,fun(num,bool)) (v':fun(num,num) x:num)) (v:fun(num,num) x:num)))))) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v':fun(num,num)) t:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))))))))
      #|HOLDS_VALUATION =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\v':fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun(num,fun(num,bool)) (v':fun(num,num) x:num)) (v:fun(num,num) x:num)))))) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v':fun(num,num)) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)))))))))
      #|TERMVAL_VALMOD_OTHER =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) (((#|->:fun(num,fun(num,fun(fun(num,num),fun(num,num)))) x:num) a:num) v:fun(num,num))) t:term)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)))))))))))
      #|HOLDS_VALMOD_OTHER =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) (((#|->:fun(num,fun(num,fun(fun(num,num),fun(num,num)))) x:num) a:num) v:fun(num,num))) p:form)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) p:form)))))))))))
      #|AXIOMS_TRUE =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#axiom:fun(form,bool) p:form)) (#arithtrue:fun(form,bool) p:form))))
      #|THEOREMS_TRUE =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(form,fun(fun(form,bool),bool)) q:form) A:fun(form,bool))) (#arithtrue:fun(form,bool) q:form))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))) (#arithtrue:fun(form,bool) p:form))))))
      #|MAX_SYM =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#MAX:fun(num,fun(num,num)) x:num) y:num)) ((#MAX:fun(num,fun(num,num)) y:num) x:num))))))
      #|MAX_ASSOC =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#=:fun(num,fun(num,bool)) ((#MAX:fun(num,fun(num,num)) x:num) ((#MAX:fun(num,fun(num,num)) y:num) z:num))) ((#MAX:fun(num,fun(num,num)) ((#MAX:fun(num,fun(num,num)) x:num) y:num)) z:num))))))))
      #|SETMAX =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool))) (((#ITSET:fun(fun(num,fun(num,num)),fun(fun(num,bool),fun(num,num))) #MAX:fun(num,fun(num,num))) s:fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|VARIANT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#=:fun(num,fun(num,bool)) (#VARIANT:fun(fun(num,bool),num) s:fun(num,bool))) ((#+:fun(num,fun(num,num)) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|SETMAX_LEMMA =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) #EMPTY:fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) s:fun(num,bool)))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) s:fun(num,bool))) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool))) ((#MAX:fun(num,fun(num,num)) x:num) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool)))))))))))
      #|SETMAX_MEMBER =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) s:fun(num,bool))) ((#<=:fun(num,fun(num,bool)) x:num) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool)))))))))
      #|SETMAX_THM =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) #EMPTY:fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) s:fun(num,bool)))) ((#MAX:fun(num,fun(num,num)) x:num) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool))))))))))
      #|SETMAX_UNION =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(fun(num,bool),bool),bool) (\t:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) t:fun(num,bool)))) ((#=:fun(num,fun(num,bool)) (#SETMAX:fun(fun(num,bool),num) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) t:fun(num,bool)))) ((#MAX:fun(num,fun(num,num)) (#SETMAX:fun(fun(num,bool),num) s:fun(num,bool))) (#SETMAX:fun(fun(num,bool),num) t:fun(num,bool)))))))))
      #|VARIANT_FINITE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) (#VARIANT:fun(fun(num,bool),num) s:fun(num,bool))) s:fun(num,bool))))))
      #|VARIANT_THM =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) (#VARIANT:fun(fun(num,bool),num) (#FV:fun(form,fun(num,bool)) p:form))) (#FV:fun(form,fun(num,bool)) p:form)))))
      #|NOT_IN_VARIANT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(fun(num,bool),bool),bool) (\t:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) s:fun(num,bool))) ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) t:fun(num,bool)) s:fun(num,bool)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) (#VARIANT:fun(fun(num,bool),num) s:fun(num,bool))) t:fun(num,bool))))))))
      #|termsubst =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) #Z:term)) #Z:term)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) (#V:fun(num,term) x:num))) (v:fun(num,term) x:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) (#Suc:fun(term,term) t:term))) (#Suc:fun(term,term) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) ((#++:fun(term,fun(term,term)) s:term) t:term))) ((#++:fun(term,fun(term,term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))))))) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) ((#**:fun(term,fun(term,term)) s:term) t:term))) ((#**:fun(term,fun(term,term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))))))))))
      #|TERMVAL_TERMSUBST =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) ((#termval:fun(fun(num,num),fun(term,num)) ((#o:fun(fun(term,num),fun(fun(num,term),fun(num,num))) (#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num))) i:fun(num,term))) t:term))))))))
      #|TERMSUBST_TERMSUBST =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\j:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) j:fun(num,term)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#o:fun(fun(term,term),fun(fun(num,term),fun(num,term))) (#termsubst:fun(fun(num,term),fun(term,term)) j:fun(num,term))) i:fun(num,term))) t:term))))))))
      #|TERMSUBST_TRIV =  |- (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) #V:fun(num,term)) t:term)) t:term)))
      #|TERMSUBST_EQ =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\v':fun(num,term). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(term,fun(term,bool)) (v':fun(num,term) x:num)) (v:fun(num,term) x:num)))))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v':fun(num,term)) t:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))))))))
      #|TERMSUBST_FVT =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (i:fun(num,term) y:num))))))) x:num))))))))))
      #|TERMSUBST_ASSIGN =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) s:term)) t:term)) t:term))))))))
      #|TERMSUBST_TRIVIAL =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(term,fun(term,bool)) (v:fun(num,term) x:num)) (#V:fun(num,term) x:num)))))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)) t:term))))))
      #|formsubst =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) #False:form)) #False:form)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) #True:form)) #True:form)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#===:fun(term,fun(term,form)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#<<:fun(term,fun(term,form)) s:term) t:term))) ((#<<:fun(term,fun(term,form)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#<<=:fun(term,fun(term,form)) s:term) t:term))) ((#<<=:fun(term,fun(term,form)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) (#Not:fun(form,form) p:form))) (#Not:fun(form,form) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#&&:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#||:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#-->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#<->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#!!:fun(num,fun(form,form)) x:num) q:form))) ((#LET:fun(fun(num,form),fun(num,form)) (\z:num. (#LET_END:fun(form,form) ((#!!:fun(num,fun(form,form)) z:num) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) z:num)) v:fun(num,term))) q:form))))) (((#COND:fun(bool,fun(num,fun(num,num))) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) q:form)))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (v:fun(num,term) y:num))))))) (#VARIANT:fun(fun(num,bool),num) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) x:num)) v:fun(num,term))) q:form)))) x:num)))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#??:fun(num,fun(form,form)) x:num) q:form))) ((#LET:fun(fun(num,form),fun(num,form)) (\z:num. (#LET_END:fun(form,form) ((#??:fun(num,fun(form,form)) z:num) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) z:num)) v:fun(num,term))) q:form))))) (((#COND:fun(bool,fun(num,fun(num,num))) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) ((#??:fun(num,fun(form,form)) x:num) q:form)))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (v:fun(num,term) y:num))))))) (#VARIANT:fun(fun(num,bool),num) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) x:num)) v:fun(num,term))) q:form)))) x:num))))))))))))))
      #|FORMSUBST_PROPERTIES =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%2:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%2:num) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (i:fun(num,term) y:num))))))) x:num))))))))) (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) ((#holds:fun(fun(num,num),fun(form,bool)) ((#o:fun(fun(term,num),fun(fun(num,term),fun(num,num))) (#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num))) i:fun(num,term))) p:form)))))))))
      #|FORMSUBST_FV =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%3:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%3:num) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (i:fun(num,term) y:num))))))) x:num))))))))))
      #|HOLDS_FORMSUBST =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) ((#holds:fun(fun(num,num),fun(form,bool)) ((#o:fun(fun(term,num),fun(fun(num,term),fun(num,num))) (#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num))) i:fun(num,term))) p:form))))))))
      #|FORMSUBST_EQ =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\j:fun(num,term). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun(term,fun(term,bool)) (i:fun(num,term) x:num)) (j:fun(num,term) x:num)))))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) j:fun(num,term)) p:form)))))))))
      #|FORMSUBST_TRIV =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) #V:fun(num,term)) p:form)) p:form)))
      #|FORMSUBST_TRIVIAL =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun(term,fun(term,bool)) (v:fun(num,term) x:num)) (#V:fun(num,term) x:num)))))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)) p:form))))))
      #|safe_for =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(bool,fun(bool,bool)) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) v:fun(num,term))) (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (v:fun(num,term) y:num)))) ((#=:fun(num,fun(num,bool)) y:num) x:num)))))))))
      #|SAFE_FOR_V =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) #V:fun(num,term))))
      #|SAFE_FOR_VALMOD =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) v:fun(num,term))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(num,fun(num,bool)) y:num) x:num)))) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) y:num) t:term) v:fun(num,term))))))))))))
      #|SAFE_FOR_ASSIGN =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(bool,fun(bool,bool)) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) ((#|=>:fun(num,fun(term,fun(num,term))) y:num) t:term))) ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(num,fun(num,bool)) y:num) x:num)))))))))
      #|FORMSUBST_SAFE_FOR =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) v:fun(num,term))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#!!:fun(num,fun(form,form)) x:num) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) x:num)) v:fun(num,term))) p:form))))))))))) (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) v:fun(num,term))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#??:fun(num,fun(form,form)) x:num) p:form))) ((#??:fun(num,fun(form,form)) x:num) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) (#V:fun(num,term) x:num)) v:fun(num,term))) p:form)))))))))))
      #|qsubst =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) ((#qsubst:fun(prod(num,term),fun(form,form)) ((#,:fun(num,fun(term,prod(num,term))) x:num) t:term)) p:form)) ((#??:fun(num,fun(form,form)) x:num) ((#&&:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term)) p:form)))))))))
      #|FV_QSUBST =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun('?15,bool),bool) (\n:'?15. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#qsubst:fun(prod(num,term),fun(form,form)) ((#,:fun(num,fun(term,prod(num,term))) x:num) t:term)) p:form))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FVT:fun(term,fun(num,bool)) t:term))) x:num))))))))
      #|HOLDS_QSUBST =  |- (#forall:fun(fun('?16,bool),bool) (\v:'?16. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#=:fun(bool,fun(bool,bool)) ((#holds:fun(fun(num,num),fun(form,bool)) v:fun(num,num)) ((#qsubst:fun(prod(num,term),fun(form,form)) ((#,:fun(num,fun(term,prod(num,term))) x:num) t:term)) p:form))) ((#holds:fun(fun(num,num),fun(form,bool)) (((#|->:fun(num,fun(num,fun(fun(num,num),fun(num,num)))) x:num) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) t:term)) v:fun(num,num))) p:form)))))))))))
      #|numeral =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) (#numeral:fun(num,term) (#NUMERAL:fun(num,num) #_0:num))) #Z:term)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(term,fun(term,bool)) (#numeral:fun(num,term) (#SUC:fun(num,num) n:num))) (#Suc:fun(term,term) (#numeral:fun(num,term) n:num))))))
      #|TERMVAL_NUMERAL =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\v:fun(num,num). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#termval:fun(fun(num,num),fun(term,num)) v:fun(num,num)) (#numeral:fun(num,term) n:num))) n:num)))))
      #|FVT_NUMERAL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) (#numeral:fun(num,term) n:num))) #EMPTY:fun(num,bool))))
      #|closed =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (#closed:fun(form,bool) p:form)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) p:form)) #EMPTY:fun(num,bool)))))
      #|types = form/0 term/0 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = closed numeral qsubst safe_for formsubst termsubst VARIANT SETMAX |-- axiom FV FVT |=> arithtrue holds termval |-> ?? !! <-> --> || && Not <<= << === True False _132768 _132767 _132766 _132765 _132764 _132763 _132762 _132761 _132760 _132759 _132758 _132757 _dest_form _mk_form ** ++ Suc V Z _132631 _132630 _132629 _132628 _132627 _dest_term _mk_term index RELPOW INV RSTC STC RTC RSC TC SC RC superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 324
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?17
      #|counter_genvar = _144270:bool
      #|
    ),
  )
}
