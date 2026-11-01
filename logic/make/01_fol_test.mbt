// Logic/fol.ml in its directory's load order: the test block of
// logic/fol/fol_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Logic_fol_ref.expected).

///|
test "Logic/fol matches Logic/fol.ml" {
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
      "define", "Library/analysis", "Library/wo", "Library/rstc", "Examples/reduct",
      "Examples/multiwf", "Logic/fol",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Logic/fol")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("LIST_UNION", () => sthm(@fol.list_union()))
  log.attempt("LIST_UNION_FINITE", () => sthm(@fol.list_union_finite()))
  log.attempt("IN_LIST_UNION", () => sthm(@fol.in_list_union()))
  log.attempt("LIST_UNION_APPEND", () => sthm(@fol.list_union_append()))
  log.attempt("term_raw_INDUCT", () => sthm(@fol.term_raw_induct()))
  log.attempt("term_raw_RECURSION", () => sthm(@fol.term_raw_recursion()))
  log.attempt("term_INDUCT", () => sthm(@fol.term_induct()))
  log.attempt("term_RECURSION", () => sthm(@fol.term_recursion()))
  log.attempt("term_INJ", () => sthm(@fol.term_inj()))
  log.attempt("term_DISTINCT", () => sthm(@fol.term_distinct()))
  log.attempt("term_CASES", () => sthm(@fol.term_cases()))
  log.attempt("form_INDUCTION", () => sthm(@fol.form_induction()))
  log.attempt("form_RECURSION", () => sthm(@fol.form_recursion()))
  log.attempt("form_INJ", () => sthm(@fol.form_inj()))
  log.attempt("form_DISTINCT", () => sthm(@fol.form_distinct()))
  log.attempt("form_CASES", () => sthm(@fol.form_cases()))
  log.attempt("Not_DEF", () => sthm(@fol.not_def()))
  log.attempt("True_DEF", () => sthm(@fol.true_def()))
  log.attempt("Or_DEF", () => sthm(@fol.or_def()))
  log.attempt("And_DEF", () => sthm(@fol.and_def()))
  log.attempt("Iff_DEF", () => sthm(@fol.iff_def()))
  log.attempt("Exists_DEF", () => sthm(@fol.exists_def()))
  log.attempt("functions_term", () => sthm(@fol.functions_term()))
  log.attempt("functions_form", () => sthm(@fol.functions_form()))
  log.attempt("predicates_form", () => sthm(@fol.predicates_form()))
  log.attempt("functions", () => sthm(@fol.functions()))
  log.attempt("predicates", () => sthm(@fol.predicates()))
  log.attempt("language", () => sthm(@fol.language()))
  log.attempt("FUNCTIONS_SING", () => sthm(@fol.functions_sing()))
  log.attempt("LANGUAGE_1", () => sthm(@fol.language_1()))
  log.attempt("Dom_DEF", () => sthm(@fol.dom_def()))
  log.attempt("Fun_DEF", () => sthm(@fol.fun_def()))
  log.attempt("Pred_DEF", () => sthm(@fol.pred_def()))
  log.attempt("MODEL_EQ", () => sthm(@fol.model_eq()))
  log.attempt("MODEL_DECOMP", () => sthm(@fol.model_decomp()))
  log.attempt("FVT", () => sthm(@fol.fvt()))
  log.attempt("FV", () => sthm(@fol.fv()))
  log.attempt("BV", () => sthm(@fol.bv()))
  log.attempt("FVT_FINITE", () => sthm(@fol.fvt_finite()))
  log.attempt("FV_FINITE", () => sthm(@fol.fv_finite()))
  log.attempt("BV_FINITE", () => sthm(@fol.bv_finite()))
  log.attempt("FV_EXISTS", () => sthm(@fol.fv_exists()))
  log.attempt("valmod", () => sthm(@fol.valmod()))
  log.attempt("VALMOD_CLAUSES", () => sthm(@fol.valmod_clauses()))
  log.attempt("VALMOD_TRIV", () => sthm(@fol.valmod_triv()))
  log.attempt("VALMOD_VALMOD", () => sthm(@fol.valmod_valmod()))
  log.attempt("valuation", () => sthm(@fol.valuation()))
  log.attempt("VALUATION_VALMOD", () => sthm(@fol.valuation_valmod()))
  log.attempt("VALUATION_IS_VALMOD", () => sthm(@fol.valuation_is_valmod()))
  log.attempt("termval", () => sthm(@fol.termval()))
  log.attempt("holds", () => sthm(@fol.holds()))
  log.attempt("hold", () => sthm(@fol.hold()))
  log.attempt("satisfies", () => sthm(@fol.satisfies()))
  log.attempt("SATISFIES_1", () => sthm(@fol.satisfies_1()))
  log.attempt("HOLDS", () => sthm(@fol.holds_v1()))
  log.attempt("TERMVAL_VALUATION", () => sthm(@fol.termval_valuation()))
  log.attempt("HOLDS_VALUATION", () => sthm(@fol.holds_valuation()))
  log.attempt("satisfiable", () => sthm(@fol.satisfiable()))
  log.attempt("valid", () => sthm(@fol.valid()))
  log.attempt("entails", () => sthm(@fol.entails()))
  log.attempt("equivalent", () => sthm(@fol.equivalent()))
  log.attempt("interpretation", () => sthm(@fol.interpretation()))
  log.attempt("INTERPRETATION_TERMVAL", () => {
    sthm(@fol.interpretation_termval())
  })
  log.attempt("INTERPRETATION_SUBLANGUAGE", () => {
    sthm(@fol.interpretation_sublanguage())
  })
  log.attempt("termsubst", () => sthm(@fol.termsubst()))
  log.attempt("TERMSUBST_TERMVAL", () => sthm(@fol.termsubst_termval()))
  log.attempt("TERMVAL_TRIV", () => sthm(@fol.termval_triv()))
  log.attempt("TERMVAL_TERMSUBST", () => sthm(@fol.termval_termsubst()))
  log.attempt("TERMSUBST_TERMSUBST", () => sthm(@fol.termsubst_termsubst()))
  log.attempt("TERMSUBST_TRIV", () => sthm(@fol.termsubst_triv()))
  log.attempt("TERMSUBST_VALUATION", () => sthm(@fol.termsubst_valuation()))
  log.attempt("TERMSUBST_FVT", () => sthm(@fol.termsubst_fvt()))
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
  log.attempt("formsubst", () => sthm(@fol.formsubst()))
  log.attempt("FORMSUBST_TRIV", () => sthm(@fol.formsubst_triv()))
  log.attempt("FORMSUBST_VALUATION", () => sthm(@fol.formsubst_valuation()))
  log.attempt("FORMSUBST_FV", () => sthm(@fol.formsubst_fv()))
  log.attempt("HOLDS_FORMSUBST", () => sthm(@fol.holds_formsubst()))
  log.attempt("HOLDS_FORMSUBST1", () => sthm(@fol.holds_formsubst1()))
  log.attempt("HOLDS_RENAME", () => sthm(@fol.holds_rename()))
  log.attempt("HOLDS_ALPHA_FORALL", () => sthm(@fol.holds_alpha_forall()))
  log.attempt("HOLDS_ALPHA_EXISTS", () => sthm(@fol.holds_alpha_exists()))
  log.attempt("FORMSUBST_RENAME", () => sthm(@fol.formsubst_rename()))
  log.attempt("TERMSUBST_FUNCTIONS_TERM", () => {
    sthm(@fol.termsubst_functions_term())
  })
  log.attempt("FORMSUBST_FUNCTIONS_FORM", () => {
    sthm(@fol.formsubst_functions_form())
  })
  log.attempt("FORMSUBST_FUNCTIONS_FORM_1", () => {
    sthm(@fol.formsubst_functions_form_1())
  })
  log.attempt("FORMSUBST_PREDICATES", () => sthm(@fol.formsubst_predicates()))
  log.attempt("FORMSUBST_LANGUAGE_RENAME", () => {
    sthm(@fol.formsubst_language_rename())
  })
  log.attempt("TERMVAL_FUNCTIONS", () => sthm(@fol.termval_functions()))
  log.attempt("HOLDS_FUNCTIONS", () => sthm(@fol.holds_functions()))
  log.attempt("HOLDS_PREDICATES", () => sthm(@fol.holds_predicates()))
  log.attempt("HOLDS_UCLOSE", () => sthm(@fol.holds_uclose()))
  log.attempt("MODEL_DUPLICATE", () => sthm(@fol.model_duplicate()))
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
      #|Warning: inventing type variables
      #|Warning: Benign redefinition
      #|0..0..0..0..2..5..8..26..61..96..solved at 107
      #|0..0..0..0..2..5..8..26..55..84..solved at 129
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..4..7..15..solved at 22
      #|0..0..0..6..14..26..46..74..108..solved at 160
      #|0..0..0..solved at 9
      #|0..0..0..solved at 3
      #|0..0..0..solved at 6
      #|0..0..0..1..2..3..5..7..9..solved at 17
      #|0..0..0..1..2..3..9..15..21..33..solved at 44
      #|0..0..1..3..solved at 7
      #|0..0..0..2..solved at 8
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..3..12..33..72..131..218..401..626..1039..1576..3021..4866..solved at 6996
      #|0..0..0..1..2..3..8..13..18..33..48..63..92..121..150..197..244..291..362..433..504..solved at 555
      #|0..0..1..2..7..13..23..34..49..68..104..152..217..303..467..655..solved at 771
      #|0..0..0..2..5..12..21..46..89..200..395..780..1425..2664..4619..8478..14417..solved at 17340
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 7
      #|0..0..1..2..5..9..15..27..44..72..119..194..301..508..794..1414..2340..4217..7056..12478..20534..35672..57813..97656..solved at 124465
      #|0..0..0..0..0..2..4..6..10..14..18..22..26..30..solved at 42
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..4..solved at 9
      #|0..0..2..5..9..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..3..6..12..24..solved at 52
      #|0..0..2..4..9..15..solved at 35
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..1..4..solved at 10
      #|0..0..0..1..2..3..solved at 9
      #|0..0..1..4..9..15..21..solved at 33
      #|Warning: inventing type variables
      #|0..0..0..3..8..33..66..135..216..425..656..1135..1662..3355..5214..solved at 7668
      #|0..0..0..2..5..16..31..54..83..120..157..224..305..406..539..solved at 710
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..11..26..60..131..234..485..solved at 612
      #|Warning: inventing type variables
      #|0..0..1..5..14..solved at 24
      #|0..0..1..3..7..11..15..28..41..54..79..104..129..solved at 156
      #|0..0..1..5..16..44..112..solved at 212
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..4..12..31..solved at 50
      #|0..0..1..solved at 4
      #|0..0..1..3..8..23..66..212..687..solved at 1815
      #|0..0..1..3..solved at 7
      #|0..0..1..3..5..11..23..37..solved at 62
      #|0..0..1..3..7..16..31..54..97..161..269..447..solved at 463
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..7..16..35..54..77..100..133..166..solved at 225
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..0..0..2..4..6..9..12..15..18..21..24..solved at 35
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 4
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
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
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
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..14..34..70..solved at 77
      #|0..0..2..solved at 5
      #|0..0..1..2..6..12..24..41..67..solved at 96
      #|0..0..2..4..18..46..84..solved at 95
      #|0..0..1..2..9..27..54..solved at 85
      #|0..0..2..4..18..46..84..solved at 116
      #|0..0..1..2..9..27..54..solved at 64
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
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
      #|0..0..2..solved at 5
      #|0..0..1..2..6..12..25..42..69..solved at 96
      #|0..0..1..2..6..11..19..30..41..54..87..120..171..solved at 252
      #|0..0..3..6..solved at 15
      #|0..0..3..6..solved at 15
      #|0..0..3..6..solved at 15
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
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
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..4..8..solved at 14
      #|0..0..4..8..solved at 12
      #|0..0..2..solved at 9
      #|0..0..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..2..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 11
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
      #|0..0..0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..3..7..solved at 15
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 15
      #|0..0..2..solved at 5
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 11
      #|0..0..3..7..solved at 15
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 15
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..4..9..19..39..65..116..183..333..solved at 346
      #|0..0..2..5..12..solved at 18
      #|0..0..2..solved at 5
      #|0..0..2..5..12..25..solved at 35
      #|0..0..2..4..14..27..48..85..127..solved at 146
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..5..14..25..45..84..solved at 93
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 5
      #|0..0..3..solved at 10
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..4..8..16..27..39..54..69..91..123..162..207..324..457..664..solved at 848
      #|0..0..2..solved at 5
      #|0..0..2..4..8..solved at 13
      #|0..0..2..5..13..solved at 19
      #|Logic/fol quotations (210):
      #|  (LIST_UNION : (List[(_) -> Bool], _) -> Bool)(NIL) == {} && LIST_UNION(CONS((h : (_) -> Bool), (t : List[(_) -> Bool]))) == UNION(h, LIST_UNION(t))
      #|  \226\136\128 l : List[(_) -> Bool], ALL(FINITE, l) \226\134\146 FINITE(LIST_UNION(l))
      #|  \226\136\128 x : _, \226\136\128 l : List[(_) -> Bool], IN(x, LIST_UNION(l)) == EX((s : (_) -> Bool) => IN(x, s), l)
      #|  \226\136\128 l1 : List[(_) -> Bool], \226\136\128 l2 : List[(_) -> Bool], LIST_UNION(APPEND(l1, l2)) == UNION(LIST_UNION(l1), LIST_UNION(l2))
      #|  ALL((P : (Term) -> Bool))
      #|  (P : (Term) -> Bool)
      #|  \226\136\128 P : (Term) -> Bool, (\226\136\128 v : Num, P(V(v))) && (\226\136\128 s : Num, \226\136\128 l : List[Term], ALL(P, l) \226\134\146 P(Fn(s, l))) \226\134\146 (\226\136\128 t : Term, P(t))
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  (fn_ : (Term) -> Z)
      #|  (fn_ : (Term) -> Z)
      #|  (mf : (List[Term]) -> List[Z])
      #|  (x : Term) => (y : List[Term]) => (z : Z) => (w : List[Z]) => CONS(z, w)
      #|  (NIL : List[Z])
      #|  (h : (Num, List[Term], List[Z]) -> Z)
      #|  (f : (Num) -> Z)
      #|  \226\136\128 f : (Num) -> Z, \226\136\128 h : (Num, List[Term], List[Z]) -> Z, \226\136\131 fn_ : (Term) -> Z, (\226\136\128 v : Num, fn_(V(v)) == f(v)) && (\226\136\128 s : Num, \226\136\128 l : List[Term], fn_(Fn(s, l)) == h(s, l, MAP(fn_, l)))
      #|  (Not : (Form) -> Form)((p : Form)) == op_minus_minus_gt(p, False)
      #|  (True : Form) == Not(False)
      #|  (op_bar_bar : (Form, Form) -> Form)((p : Form), (q : Form)) == op_minus_minus_gt(op_minus_minus_gt(p, q), q)
      #|  (op_amp_amp : (Form, Form) -> Form)((p : Form), (q : Form)) == Not(op_bar_bar(Not(p), Not(q)))
      #|  (op_lt_minus_gt : (Form, Form) -> Form)((p : Form), (q : Form)) == op_amp_amp(op_minus_minus_gt(p, q), op_minus_minus_gt(q, p))
      #|  (op_q_q : (Num, Form) -> Form)((x : Num), (p : Form)) == Not(op_bang_bang(x, Not(p)))
      #|  (\226\136\128 v : Num, (functions_term : (Term, (Num, Num)) -> Bool)(V(v)) == {}) && (\226\136\128 f : Num, \226\136\128 l : List[Term], functions_term(Fn(f, l)) == INSERT((f, LENGTH(l)), LIST_UNION(MAP(functions_term, l))))
      #|  (functions_form : (Form, (Num, Num)) -> Bool)(False) == {} && functions_form(Atom((a : Num), (l : List[Term]))) == LIST_UNION(MAP(functions_term, l)) && functions_form(op_minus_minus_gt((p : Form), (q : Form))) == UNION(functions_form(p), functions_form(q)) && functions_form(op_bang_bang((x : Num), p)) == functions_form(p)
      #|  (predicates_form : (Form, (Num, Num)) -> Bool)(False) == {} && predicates_form(Atom((a : Num), (l : List[Term]))) == {(a, LENGTH(l))} && predicates_form(op_minus_minus_gt((p : Form), (q : Form))) == UNION(predicates_form(p), predicates_form(q)) && predicates_form(op_bang_bang((x : Num), p)) == predicates_form(p)
      #|  (functions : ((Form) -> Bool, (Num, Num)) -> Bool)((fms : (Form) -> Bool)) == UNIONS({functions_form((f : Form)) | IN(f, fms)})
      #|  (predicates : ((Form) -> Bool, (Num, Num)) -> Bool)((fms : (Form) -> Bool)) == UNIONS({predicates_form((f : Form)) | IN(f, fms)})
      #|  (language : ((Form) -> Bool) -> (((Num, Num)) -> Bool, ((Num, Num)) -> Bool))((fms : (Form) -> Bool)) == (functions(fms), predicates(fms))
      #|  functions({(p : Form)}) == functions_form(p)
      #|  language({(p : Form)}) == (functions_form(p), predicates_form(p))
      #|  (Dom : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), A) -> Bool)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == D
      #|  (Fun : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), Num, List[A]) -> A)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == Funs
      #|  (Pred : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), Num, List[A]) -> Bool)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == Preds
      #|  (p : (_, _, _)) == (FST(p), FST(SND(p)), SND(SND(p)))
      #|  ((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) == (M' : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool))) == (Dom(M) == Dom(M') && Fun(M) == Fun(M') && Pred(M) == Pred(M'))
      #|  (M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) == (Dom(M), Fun(M), Pred(M))
      #|  (\226\136\128 x : Num, (FVT : (Term, Num) -> Bool)(V(x)) == {x}) && (\226\136\128 f : Num, \226\136\128 l : List[Term], FVT(Fn(f, l)) == LIST_UNION(MAP(FVT, l)))
      #|  (FV : (Form, Num) -> Bool)(False) == {} && (\226\136\128 a : Num, \226\136\128 l : List[Term], FV(Atom(a, l)) == LIST_UNION(MAP(FVT, l))) && (\226\136\128 p : Form, \226\136\128 q : Form, FV(op_minus_minus_gt(p, q)) == UNION(FV(p), FV(q))) && (\226\136\128 x : Num, \226\136\128 p : Form, FV(op_bang_bang(x, p)) == DELETE(FV(p), x))
      #|  (BV : (Form, Num) -> Bool)(False) == {} && (\226\136\128 a : Num, \226\136\128 l : List[Term], BV(Atom(a, l)) == {}) && (\226\136\128 p : Form, \226\136\128 q : Form, BV(op_minus_minus_gt(p, q)) == UNION(BV(p), BV(q))) && (\226\136\128 x : Num, \226\136\128 p : Form, BV(op_bang_bang(x, p)) == INSERT(x, BV(p)))
      #|  \226\136\128 t : Term, FINITE(FVT(t))
      #|  \226\136\128 p : Form, FINITE(FV(p))
      #|  \226\136\128 p : Form, FINITE(BV(p))
      #|  FV(op_q_q((x : Num), (p : Form))) == DELETE(FV(p), x)
      #|  (valmod : ((_, _), (_) -> _, _) -> _)(((x : _), (a : _)), (v : (_) -> _)) == ((y : _) => if y == x { a } else { v(y) })
      #|  (\226\136\128 v : (_) -> _, \226\136\128 a : _, \226\136\128 k : _, valmod((k, a), v, k) == a) && (\226\136\128 v : (_) -> _, \226\136\128 a : _, \226\136\128 k : _, \226\136\128 x : _, !(x == k) \226\134\146 valmod((k, a), v, x) == v(x))
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, valmod((x, v(x)), v) == v
      #|  \226\136\128 v : (_) -> _, \226\136\128 a : _, \226\136\128 x : _, \226\136\128 b : _, valmod((x, a), valmod((x, b), v)) == valmod((x, a), v)
      #|  (valuation : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _)) == (\226\136\128 x : Num, IN(v(x), Dom(M)))
      #|  \226\136\128 M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), \226\136\128 a : _, \226\136\128 v : (Num) -> _, valuation(M, v) && IN(a, Dom(M)) \226\134\146 valuation(M, valmod(((x : Num), a), v))
      #|  \226\136\128 v : (_) -> _, \226\136\128 x : _, valmod((x, v(x)), v) == v
      #|  (\226\136\128 x : Num, (termval : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, Term) -> _)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), V(x)) == v(x)) && (\226\136\128 f : Num, \226\136\128 l : List[Term], termval(M, v, Fn(f, l)) == Fun(M, f, MAP(termval(M, v), l)))
      #|  (holds : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, Form) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), False) == false && (\226\136\128 a : Num, \226\136\128 l : List[Term], holds(M, v, Atom(a, l)) == Pred(M, a, MAP(termval(M, v), l))) && (\226\136\128 p : Form, \226\136\128 q : Form, holds(M, v, op_minus_minus_gt(p, q)) == (holds(M, v, p) \226\134\146 holds(M, v, q))) && (\226\136\128 x : Num, \226\136\128 p : Form, holds(M, v, op_bang_bang(x, p)) == (\226\136\128 a : _, IN(a, Dom(M)) \226\134\146 holds(M, valmod((x, a), v), p)))
      #|  (hold : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, (Form) -> Bool) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), (fms : (Form) -> Bool)) == (\226\136\128 p : Form, IN(p, fms) \226\134\146 holds(M, v, p))
      #|  (satisfies : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Form) -> Bool) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (fms : (Form) -> Bool)) == (\226\136\128 v : (Num) -> _, \226\136\128 p : Form, valuation(M, v) && IN(p, fms) \226\134\146 holds(M, v, p))
      #|  satisfies((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), {(p : Form)}) == (\226\136\128 v : (Num) -> _, valuation(M, v) \226\134\146 holds(M, v, p))
      #|  holds((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), False) == false && holds(M, v, True) == true && (\226\136\128 a : Num, \226\136\128 l : List[Term], holds(M, v, Atom(a, l)) == Pred(M, a, MAP(termval(M, v), l))) && (\226\136\128 p : Form, holds(M, v, Not(p)) == !holds(M, v, p)) && (\226\136\128 p : Form, \226\136\128 q : Form, holds(M, v, op_bar_bar(p, q)) == (holds(M, v, p) || holds(M, v, q))) && (\226\136\128 p : Form, \226\136\128 q : Form, holds(M, v, op_amp_amp(p, q)) == (holds(M, v, p) && holds(M, v, q))) && (\226\136\128 p : Form, \226\136\128 q : Form, holds(M, v, op_minus_minus_gt(p, q)) == (holds(M, v, p) \226\134\146 holds(M, v, q))) && (\226\136\128 p : Form, \226\136\128 q : Form, holds(M, v, op_lt_minus_gt(p, q)) == (holds(M, v, p) == holds(M, v, q))) && (\226\136\128 x : Num, \226\136\128 p : Form, holds(M, v, op_bang_bang(x, p)) == (\226\136\128 a : _, IN(a, Dom(M)) \226\134\146 holds(M, valmod((x, a), v), p))) && (\226\136\128 x : Num, \226\136\128 p : Form, holds(M, v, op_q_q(x, p)) == (\226\136\131 a : _, IN(a, Dom(M)) && holds(M, valmod((x, a), v), p)))
      #|  \226\136\128 l : List[Term], \226\136\128 t : Term, \226\136\128 x : Num, IN(x, FVT(t)) && MEM(t, l) \226\134\146 IN(x, LIST_UNION(MAP(FVT, l)))
      #|  (t : Term) => \226\136\128 v : (Num) -> A, \226\136\128 v' : (Num) -> A, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v'(x) == v(x)) \226\134\146 termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v', t) == termval(M, v, t)
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 t : Term, \226\136\128 v : (Num) -> A, \226\136\128 v' : (Num) -> A, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v'(x) == v(x)) \226\134\146 termval(M, v', t) == termval(M, v, t)
      #|  (x : Num) == (p : Num)
      #|  (x : Num)
      #|  (p : Num)
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 p : Form, \226\136\128 v : (Num) -> A, \226\136\128 v' : (Num) -> A, (\226\136\128 x : Num, IN(x, FV(p)) \226\134\146 v'(x) == v(x)) \226\134\146 holds(M, v', p) == holds(M, v, p)
      #|  (satisfiable : ((A) -> Bool, (Form) -> Bool) -> Bool)((U : (A) -> Bool), (fms : (Form) -> Bool)) == (\226\136\131 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), !(Dom(M) == {}) && satisfies(M, fms))
      #|  (valid : ((A) -> Bool, (Form) -> Bool) -> Bool)((U : (A) -> Bool), (fms : (Form) -> Bool)) == (\226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), satisfies(M, fms))
      #|  (entails : ((A) -> Bool, (Form) -> Bool, Form) -> Bool)((U : (A) -> Bool), (A : (Form) -> Bool), (p : Form)) == (\226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 v : (Num) -> A, hold(M, v, A) \226\134\146 holds(M, v, p))
      #|  (equivalent : ((A) -> Bool, Form, Form) -> Bool)((U : (A) -> Bool), (p : Form), (q : Form)) == (\226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 v : (Num) -> A, holds(M, v, p) == holds(M, v, q))
      #|  (interpretation : ((((Num, Num)) -> Bool, ((Num, Num)) -> Bool), ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) -> Bool)(((fns : ((Num, Num)) -> Bool), (preds : ((Num, Num)) -> Bool)), (M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool))) == (\226\136\128 f : Num, \226\136\128 l : List[_], IN((f, LENGTH(l)), fns) && ALL((x : _) => IN(x, Dom(M)), l) \226\134\146 IN(Fun(M, f, l), Dom(M)))
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  MEM((x : Term), (l : List[Term]))
      #|  \226\136\128 any : ((Num, Num)) -> Bool, \226\136\128 M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), \226\136\128 v : (Num) -> _, \226\136\128 t : Term, interpretation((functions_term(t), any), M) && valuation(M, v) \226\134\146 IN(termval(M, v, t), Dom(M))
      #|  \226\136\128 M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), \226\136\128 funs1 : ((Num, Num)) -> Bool, \226\136\128 funs2 : ((Num, Num)) -> Bool, \226\136\128 preds1 : ((Num, Num)) -> Bool, \226\136\128 preds2 : ((Num, Num)) -> Bool, SUBSET(funs2, funs1) \226\134\146 interpretation((funs1, preds1), M) \226\134\146 interpretation((funs2, preds2), M)
      #|  (\226\136\128 x : Num, (termsubst : ((Num) -> Term, Term) -> Term)((v : (Num) -> Term), V(x)) == v(x)) && (\226\136\128 f : Num, \226\136\128 l : List[Term], termsubst(v, Fn(f, l)) == Fn(f, MAP(termsubst(v), l)))
      #|  \226\136\128 M : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Fun(M) == Fn \226\134\146 (\226\136\128 v : (Num) -> Term, \226\136\128 t : Term, termsubst(v, t) == termval(M, v, t))
      #|  \226\136\128 M : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Fun(M) == Fn \226\134\146 (\226\136\128 t : Term, termval(M, V, t) == t)
      #|  \226\136\128 M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), \226\136\128 v : (Num) -> _, \226\136\128 i : (Num) -> Term, \226\136\128 t : Term, termval(M, v, termsubst(i, t)) == termval(M, o(termval(M, v), i), t)
      #|  \226\136\128 i : (Num) -> Term, \226\136\128 j : (Num) -> Term, \226\136\128 t : Term, termsubst(j, termsubst(i, t)) == termsubst(o(termsubst(j), i), t)
      #|  \226\136\128 t : Term, termsubst(V, t) == t
      #|  (Dom(((a : (Term) -> Bool), Fn, (b : (Num, List[Term]) -> Bool))), Fn, Pred((a, Fn, b)))
      #|  \226\136\128 t : Term, \226\136\128 v : (Num) -> Term, \226\136\128 v' : (Num) -> Term, (\226\136\128 x : Num, IN(x, FVT(t)) \226\134\146 v'(x) == v(x)) \226\134\146 termsubst(v', t) == termsubst(v, t)
      #|  {(x : _) | \226\136\131 y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | \226\136\131 y : _, IN(y, s) && P(x, y)}, {(x : _) | \226\136\131 y : _, IN(y, t) && P(x, y)})
      #|  (i : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  \226\136\128 t : Term, \226\136\128 i : (Num) -> Term, FVT(termsubst(i, t)) == {(x : Num) | \226\136\131 y : Num, IN(y, FVT(t)) && IN(x, FVT(i(y)))}
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
      #|  (formsubst : ((Num) -> Term, Form) -> Form)((v : (Num) -> Term), False) == False && formsubst(v, Atom((p : Num), (l : List[Term]))) == Atom(p, MAP(termsubst(v), l)) && formsubst(v, op_minus_minus_gt((q : Form), (r : Form))) == op_minus_minus_gt(formsubst(v, q), formsubst(v, r)) && formsubst(v, op_bang_bang((x : Num), q)) == LET((v' : (Num) -> Term) => LET_END(LET((z : Num) => LET_END(op_bang_bang(z, formsubst(valmod((x, V(z)), v), q))), if (\226\136\131 y : Num, IN(y, FV(op_bang_bang(x, q))) && IN(x, FVT(v'(y)))) { VARIANT(FV(formsubst(v', q))) } else { x })), valmod((x, V(x)), v))
      #|  !(!(p : Bool) && p)
      #|  \226\136\128 p : Form, formsubst(V, p) == p
      #|  (y : Num)
      #|  (x : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a && b) == (a && c)
      #|  (\226\136\131 y : Num, (IN(y, FV((a1 : Form))) && !(y == (p : Num))) && IN(p, FVT(valmod((p, V(p)), (v' : (Num) -> Term), y)))) == (\226\136\131 y : Num, (IN(y, FV(a1)) && !(y == p)) && IN(p, FVT(valmod((p, V(p)), (v : (Num) -> Term), y))))
      #|  (p : Num)
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  \226\136\128 p : Form, \226\136\128 v : (Num) -> Term, \226\136\128 v' : (Num) -> Term, (\226\136\128 x : Num, IN(x, FV(p)) \226\134\146 v'(x) == v(x)) \226\134\146 formsubst(v', p) == formsubst(v, p)
      #|  {(x : _) | \226\136\131 y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | \226\136\131 y : _, IN(y, s) && P(x, y)}, {(x : _) | \226\136\131 y : _, IN(y, t) && P(x, y)})
      #|  (y : Num)
      #|  (a0' : Num) == VARIANT(FV(formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))))
      #|  formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | \226\136\131 y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}
      #|  (x : Num)
      #|  (x : Num)
      #|  !IN((y : Num), FV(formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))))
      #|  (y : Num)
      #|  (x : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a \226\134\146 b) == (a \226\134\146 c)
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, \226\136\128 v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(i, p)) == holds(M, o(termval(M, v), i), p)
      #|  (y : Num)
      #|  \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 p : Form, \226\136\128 v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(valmod((x, t), V), p)) == holds(M, valmod((x, termval(M, v, t)), v), p)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 p : Form, \226\136\128 v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(valmod((x, V(y)), V), p)) == holds(M, valmod((x, v(y)), v), p)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 p : Form, \226\136\128 v : (Num) -> A, !IN(y, FV(op_bang_bang(x, p))) \226\134\146 holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, op_bang_bang(y, formsubst(valmod((x, V(y)), V), p))) == holds(M, v, op_bang_bang(x, p))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 p : Form, \226\136\128 v : (Num) -> A, !IN(y, FV(op_q_q(x, p))) \226\134\146 holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, op_q_q(y, formsubst(valmod((x, V(y)), V), p))) == holds(M, v, op_q_q(x, p))
      #|  \226\136\128 p : Form, \226\136\128 x : Num, \226\136\128 y : Num, DELETE(FV(formsubst(valmod((x, V(y)), V), p)), y) == DELETE(DELETE(FV(p), x), y)
      #|  {(x : _) | \226\136\131 y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | \226\136\131 y : _, IN(y, s) && P(x, y)}, {(x : _) | \226\136\131 y : _, IN(y, t) && P(x, y)})
      #|  (s : (_) -> Bool) == UNION((a : (_) -> Bool), (c : (_) -> Bool)) && (t : (_) -> Bool) == UNION((b : (_) -> Bool), (d : (_) -> Bool)) \226\134\146 UNION(s, t) == UNION(UNION(a, b), UNION(c, d))
      #|  (i : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  \226\136\128 l : List[Term], ALL((t : Term) => \226\136\128 i : (Num) -> Term, functions_term(termsubst(i, t)) == UNION(functions_term(t), {(x : (Num, Num)) | \226\136\131 y : Num, IN(y, FVT(t)) && IN(x, functions_term(i(y)))}), l) \226\134\146 (\226\136\128 i : (Num) -> Term, LIST_UNION(MAP(functions_term, MAP(termsubst(i), l))) == UNION(LIST_UNION(MAP(functions_term, l)), {(x : (Num, Num)) | \226\136\131 y : Num, IN(y, LIST_UNION(MAP(FVT, l))) && IN(x, functions_term(i(y)))}))
      #|  \226\136\128 t : Term, \226\136\128 i : (Num) -> Term, functions_term(termsubst(i, t)) == UNION(functions_term(t), {(x : (Num, Num)) | \226\136\131 y : Num, IN(y, FVT(t)) && IN(x, functions_term(i(y)))})
      #|  {(x : _) | \226\136\131 y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | \226\136\131 y : _, IN(y, s) && P(x, y)}, {(x : _) | \226\136\131 y : _, IN(y, t) && P(x, y)})
      #|  UNION(UNION((a : (_) -> Bool), (b : (_) -> Bool)), UNION((c : (_) -> Bool), (d : (_) -> Bool))) == UNION(UNION(a, c), UNION(b, d))
      #|  (y : Num) == (a0 : Num)
      #|  (i : (Num) -> Term)
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, functions_form(formsubst(i, p)) == UNION(functions_form(p), {(x : (Num, Num)) | \226\136\131 y : Num, IN(y, FV(p)) && IN(x, functions_term(i(y)))})
      #|  \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 p : Form, IN(x, FV(p)) \226\134\146 functions_form(formsubst(valmod((x, t), V), p)) == UNION(functions_form(p), functions_term(t))
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, predicates_form(formsubst(i, p)) == predicates_form(p)
      #|  (!(p : Bool) && p) == false
      #|  language({formsubst(valmod(((x : Num), V((y : Num))), V), (p : Form))}) == language({p})
      #|  (l : List[Term])
      #|  (l : List[Term])
      #|  MEM((x : Term), (l : List[Term]))
      #|  MAP(termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A)), (l : List[Term])) == MAP(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v), l)
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 t : Term, (\226\136\128 f : Num, \226\136\128 zs : List[A], IN((f, LENGTH(zs)), functions_term(t)) \226\134\146 Fun(M, f, zs) == Fun((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs)) \226\134\146 (\226\136\128 v : (Num) -> A, termval(M, v, t) == termval(M', v, t))
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  valmod(((a0 : Num), (a : A)), (v : (Num) -> A))
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  (a1 : List[Term])
      #|  (a1 : List[Term])
      #|  \226\136\128 f : Num, \226\136\128 zs : List[A], IN((f, LENGTH(zs)), functions_form(Atom((a0 : Num), (a1 : List[Term])))) \226\134\146 Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs) == Fun((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs)
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 p : Form, Dom(M) == Dom(M') && (\226\136\128 P : Num, \226\136\128 zs : List[A], Pred(M, P, zs) == Pred(M', P, zs)) && (\226\136\128 f : Num, \226\136\128 zs : List[A], IN((f, LENGTH(zs)), functions_form(p)) \226\134\146 Fun(M, f, zs) == Fun(M', f, zs)) \226\134\146 (\226\136\128 v : (Num) -> A, holds(M, v, p) == holds(M', v, p))
      #|  (v : (Num) -> A)
      #|  valmod(((a0 : Num), (a : A)), (v : (Num) -> A))
      #|  (v : (Num) -> A)
      #|  (v : (Num) -> A)
      #|  \226\136\128 x : Term, termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), x) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, x)
      #|  MAP(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A)), (a1 : List[Term])) == MAP(termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v), a1)
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 p : Form, Dom(M) == Dom(M') && (\226\136\128 f : Num, \226\136\128 zs : List[A], Fun(M, f, zs) == Fun(M', f, zs)) && (\226\136\128 P : Num, \226\136\128 zs : List[A], IN((P, LENGTH(zs)), predicates_form(p)) \226\134\146 Pred(M, P, zs) == Pred(M', P, zs)) \226\134\146 (\226\136\128 v : (Num) -> A, holds(M, v, p) == holds(M', v, p))
      #|  Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 x : Num, \226\136\128 p : Form, (\226\136\128 v : (Num) -> A, valuation(M, v) \226\134\146 holds(M, v, op_bang_bang(x, p))) == (Dom(M) == {} || (\226\136\128 v : (Num) -> A, valuation(M, v) \226\134\146 holds(M, v, p)))
      #|  (v : (Num) -> A) == o((i : (A) -> A), v)
      #|  (v : (Num) -> A)
      #|  SUBSET(functions((s : (Form) -> Bool)), (fns : ((Num, Num)) -> Bool))
      #|  SUBSET(functions_form((p : Form)), (fns : ((Num, Num)) -> Bool))
      #|  IN((p : Form), (s : (Form) -> Bool))
      #|  (p : Form)
      #|  (s : (Form) -> Bool)
      #|  \226\136\128 x : A, IN(x, Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)))) \226\134\146 (i : (A) -> A)(x) == x
      #|  \226\136\128 a : A, o((i : (A) -> A), valmod(((x : Num), a), (v : (Num) -> A))) == valmod((x, i(a)), o(i, v))
      #|  (v : (Num) -> A)
      #|  (p : Form)
      #|  (x : Num)
      #|  \226\136\128 p : Form, SUBSET(functions_form(p), (fns : ((Num, Num)) -> Bool)) \226\134\146 (\226\136\128 v : (Num) -> A, holds((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, p) == holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o((i : (A) -> A), v), p))
      #|  IN(Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (P : Num), MAP(o((i : (A) -> A), termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A))), (args : List[Term]))), Dom(M))
      #|  Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (P : Num), MAP(o((i : (A) -> A), termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A))), (args : List[Term])))
      #|  (v : (Num) -> A)
      #|  \226\136\128 t : Term, MEM(t, (args : List[Term])) \226\134\146 (\226\136\128 v : (Num) -> A, (i : (A) -> A)(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, t)) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o(i, v), t))
      #|  \226\136\128 t : Term, MEM(t, (args : List[Term])) \226\134\146 SUBSET(functions_term(t), (fns : ((Num, Num)) -> Bool))
      #|  IN(((P : Num), LENGTH((args : List[Term]))), (fns : ((Num, Num)) -> Bool))
      #|  (args : List[Term])
      #|  (P : Num)
      #|  \226\136\128 t : Term, SUBSET(functions_term(t), (fns : ((Num, Num)) -> Bool)) \226\134\146 (\226\136\128 v : (Num) -> A, (i : (A) -> A)(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, t)) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o(i, v), t))
      #|  ALL((x : A) => IN(x, (D : (A) -> Bool)), (l : List[A]))
      #|  (b : Bool) && (b \226\134\146 (a : Bool) && (c : Bool)) \226\134\146 a && b && c
      #|  !(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {})
      #|  (x : A)
      #|  \226\136\128 x : A, IN((i : (A) -> A)(x), Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))))
      #|  (M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)) == ((D : (A) -> Bool), (f : Num) => (args : List[A]) => Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, MAP((i : (A) -> A), args)), (P : Num) => (args : List[A]) => Pred(M, P, MAP(i, args)))
      #|  (i : (A) -> A) == ((x : A) => if IN(x, Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)))) { x } else { select((z : A) => IN(z, Dom(M))) })
      #|  \226\136\128 M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), \226\136\128 fns : ((Num, Num)) -> Bool, \226\136\128 preds : ((Num, Num)) -> Bool, \226\136\128 D : (A) -> Bool, interpretation((fns, preds), M) && SUBSET(Dom(M), D) && !(Dom(M) == {}) \226\134\146 (\226\136\131 M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), interpretation((fns, preds), M') && Dom(M') == D && (\226\136\128 s : (Form) -> Bool, SUBSET(functions(s), fns) && SUBSET(predicates(s), preds) \226\134\146 satisfies(M', s) == satisfies(M, s)))
      #|LIST_UNION =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('?1,bool),fun(fun('?1,bool),bool)) (#LIST_UNION:fun(list(fun('?1,bool)),fun('?1,bool)) #NIL:list(fun('?1,bool)))) #EMPTY:fun('?1,bool))) ((#=:fun(fun('?1,bool),fun(fun('?1,bool),bool)) (#LIST_UNION:fun(list(fun('?1,bool)),fun('?1,bool)) ((#CONS:fun(fun('?1,bool),fun(list(fun('?1,bool)),list(fun('?1,bool)))) h:fun('?1,bool)) t:list(fun('?1,bool))))) ((#UNION:fun(fun('?1,bool),fun(fun('?1,bool),fun('?1,bool))) h:fun('?1,bool)) (#LIST_UNION:fun(list(fun('?1,bool)),fun('?1,bool)) t:list(fun('?1,bool))))))
      #|LIST_UNION_FINITE =  |- (#forall:fun(fun(list(fun('?2,bool)),bool),bool) (\l:list(fun('?2,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(fun('?2,bool),bool),fun(list(fun('?2,bool)),bool)) #FINITE:fun(fun('?2,bool),bool)) l:list(fun('?2,bool)))) (#FINITE:fun(fun('?2,bool),bool) (#LIST_UNION:fun(list(fun('?2,bool)),fun('?2,bool)) l:list(fun('?2,bool)))))))
      #|IN_LIST_UNION =  |- (#forall:fun(fun('?3,bool),bool) (\x:'?3. (#forall:fun(fun(list(fun('?3,bool)),bool),bool) (\l:list(fun('?3,bool)). ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('?3,fun(fun('?3,bool),bool)) x:'?3) (#LIST_UNION:fun(list(fun('?3,bool)),fun('?3,bool)) l:list(fun('?3,bool))))) ((#EX:fun(fun(fun('?3,bool),bool),fun(list(fun('?3,bool)),bool)) (\s:fun('?3,bool). ((#IN:fun('?3,fun(fun('?3,bool),bool)) x:'?3) s:fun('?3,bool)))) l:list(fun('?3,bool))))))))
      #|LIST_UNION_APPEND =  |- (#forall:fun(fun(list(fun('?4,bool)),bool),bool) (\l1:list(fun('?4,bool)). (#forall:fun(fun(list(fun('?4,bool)),bool),bool) (\l2:list(fun('?4,bool)). ((#=:fun(fun('?4,bool),fun(fun('?4,bool),bool)) (#LIST_UNION:fun(list(fun('?4,bool)),fun('?4,bool)) ((#APPEND:fun(list(fun('?4,bool)),fun(list(fun('?4,bool)),list(fun('?4,bool)))) l1:list(fun('?4,bool))) l2:list(fun('?4,bool))))) ((#UNION:fun(fun('?4,bool),fun(fun('?4,bool),fun('?4,bool))) (#LIST_UNION:fun(list(fun('?4,bool)),fun('?4,bool)) l1:list(fun('?4,bool)))) (#LIST_UNION:fun(list(fun('?4,bool)),fun('?4,bool)) l2:list(fun('?4,bool)))))))))
      #|term_raw_INDUCT =  |- (#forall:fun(fun(fun(term,bool),bool),bool) (\P0:fun(term,bool). (#forall:fun(fun(fun(list(term),bool),bool),bool) (\P1:fun(list(term),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (P0:fun(term,bool) (#V:fun(num,term) a:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). ((#==>:fun(bool,fun(bool,bool)) (P1:fun(list(term),bool) a1:list(term))) (P0:fun(term,bool) ((#Fn:fun(num,fun(list(term),term)) a0:num) a1:list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) (P1:fun(list(term),bool) #NIL:list(term))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P0:fun(term,bool) a0:term)) (P1:fun(list(term),bool) a1:list(term)))) (P1:fun(list(term),bool) ((#CONS:fun(term,fun(list(term),list(term))) a0:term) a1:list(term)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\x0:term. (P0:fun(term,bool) x0:term)))) (#forall:fun(fun(list(term),bool),bool) (\x1:list(term). (P1:fun(list(term),bool) x1:list(term))))))))))
      #|term_raw_RECURSION =  |- (#forall:fun(fun(fun(num,'Z1),bool),bool) (\f0:fun(num,'Z1). (#forall:fun(fun(fun(num,fun(list(term),fun('Z0,'Z1))),bool),bool) (\f1:fun(num,fun(list(term),fun('Z0,'Z1))). (#forall:fun(fun('Z0,bool),bool) (\f2:'Z0. (#forall:fun(fun(fun(term,fun(list(term),fun('Z1,fun('Z0,'Z0)))),bool),bool) (\f3:fun(term,fun(list(term),fun('Z1,fun('Z0,'Z0)))). (#?:fun(fun(fun(list(term),'Z0),bool),bool) (\fn0:fun(list(term),'Z0). (#?:fun(fun(fun(term,'Z1),bool),bool) (\fn1:fun(term,'Z1). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun('Z1,fun('Z1,bool)) (fn1:fun(term,'Z1) (#V:fun(num,term) a:num))) (f0:fun(num,'Z1) a:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). ((#=:fun('Z1,fun('Z1,bool)) (fn1:fun(term,'Z1) ((#Fn:fun(num,fun(list(term),term)) a0:num) a1:list(term)))) (((f1:fun(num,fun(list(term),fun('Z0,'Z1))) a0:num) a1:list(term)) (fn0:fun(list(term),'Z0) a1:list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(list(term),'Z0) #NIL:list(term))) f2:'Z0)) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(list(term),'Z0) ((#CONS:fun(term,fun(list(term),list(term))) a0:term) a1:list(term)))) ((((f3:fun(term,fun(list(term),fun('Z1,fun('Z0,'Z0)))) a0:term) a1:list(term)) (fn1:fun(term,'Z1) a0:term)) (fn0:fun(list(term),'Z0) a1:list(term)))))))))))))))))))))))
      #|term_INDUCT =  |- (#forall:fun(fun(fun(term,bool),bool),bool) (\P:fun(term,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\v:num. (P:fun(term,bool) (#V:fun(num,term) v:num))))) (#forall:fun(fun(num,bool),bool) (\s:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) P:fun(term,bool)) l:list(term))) (P:fun(term,bool) ((#Fn:fun(num,fun(list(term),term)) s:num) l:list(term)))))))))) (#forall:fun(fun(term,bool),bool) (\t:term. (P:fun(term,bool) t:term))))))
      #|term_RECURSION =  |- (#forall:fun(fun(fun(num,'Z),bool),bool) (\f:fun(num,'Z). (#forall:fun(fun(fun(num,fun(list(term),fun(list('Z),'Z))),bool),bool) (\h:fun(num,fun(list(term),fun(list('Z),'Z))). (#?:fun(fun(fun(term,'Z),bool),bool) (\fn_:fun(term,'Z). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\v:num. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) (#V:fun(num,term) v:num))) (f:fun(num,'Z) v:num))))) (#forall:fun(fun(num,bool),bool) (\s:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun('Z,fun('Z,bool)) (fn_:fun(term,'Z) ((#Fn:fun(num,fun(list(term),term)) s:num) l:list(term)))) (((h:fun(num,fun(list(term),fun(list('Z),'Z))) s:num) l:list(term)) ((#MAP:fun(fun(term,'Z),fun(list(term),list('Z))) fn_:fun(term,'Z)) l:list(term)))))))))))))))
      #|term_INJ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\v:num. (#forall:fun(fun(num,bool),bool) (\v':num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) v:num)) (#V:fun(num,term) v':num))) ((#=:fun(num,fun(num,bool)) v:num) v':num))))))) (#forall:fun(fun(num,bool),bool) (\s:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). (#forall:fun(fun(num,bool),bool) (\s':num. (#forall:fun(fun(list(term),bool),bool) (\l':list(term). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) s:num) l:list(term))) ((#Fn:fun(num,fun(list(term),term)) s':num) l':list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s:num) s':num)) ((#=:fun(list(term),fun(list(term),bool)) l:list(term)) l':list(term)))))))))))))
      #|term_DISTINCT =  |- (#forall:fun(fun(num,bool),bool) (\v:num. (#forall:fun(fun(num,bool),bool) (\s':num. (#forall:fun(fun(list(term),bool),bool) (\l':list(term). (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) (#V:fun(num,term) v:num)) ((#Fn:fun(num,fun(list(term),term)) s':num) l':list(term))))))))))
      #|term_CASES =  |- (#forall:fun(fun(term,bool),bool) (\t:term. ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\v:num. ((#=:fun(term,fun(term,bool)) t:term) (#V:fun(num,term) v:num))))) (#?:fun(fun(num,bool),bool) (\s:num. (#?:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(term,fun(term,bool)) t:term) ((#Fn:fun(num,fun(list(term),term)) s:num) l:list(term))))))))))
      #|form_INDUCTION =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\P:fun(form,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) #False:form)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). (P:fun(form,bool) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(form,bool) a0:form)) (P:fun(form,bool) a1:form))) (P:fun(form,bool) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#==>:fun(bool,fun(bool,bool)) (P:fun(form,bool) a1:form)) (P:fun(form,bool) ((#!!:fun(num,fun(form,form)) a0:num) a1:form))))))))))) (#forall:fun(fun(form,bool),bool) (\x:form. (P:fun(form,bool) x:form))))))
      #|form_RECURSION =  |- (#forall:fun(fun('Z,bool),bool) (\f0:'Z. (#forall:fun(fun(fun(num,fun(list(term),'Z)),bool),bool) (\f1:fun(num,fun(list(term),'Z)). (#forall:fun(fun(fun(form,fun(form,fun('Z,fun('Z,'Z)))),bool),bool) (\f2:fun(form,fun(form,fun('Z,fun('Z,'Z)))). (#forall:fun(fun(fun(num,fun(form,fun('Z,'Z))),bool),bool) (\f3:fun(num,fun(form,fun('Z,'Z))). (#?:fun(fun(fun(form,'Z),bool),bool) (\fn_:fun(form,'Z). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) #False:form)) f0:'Z)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term)))) ((f1:fun(num,fun(list(term),'Z)) a0:num) a1:list(term)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#-->:fun(form,fun(form,form)) a0:form) a1:form))) ((((f2:fun(form,fun(form,fun('Z,fun('Z,'Z)))) a0:form) a1:form) (fn_:fun(form,'Z) a0:form)) (fn_:fun(form,'Z) a1:form)))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(form,'Z) ((#!!:fun(num,fun(form,form)) a0:num) a1:form))) (((f3:fun(num,fun(form,fun('Z,'Z))) a0:num) a1:form) (fn_:fun(form,'Z) a1:form))))))))))))))))))))
      #|form_INJ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(list(term),bool),bool) (\a1':list(term). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term))) ((#Atom:fun(num,fun(list(term),form)) a0':num) a1':list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a0:num) a0':num)) ((#=:fun(list(term),fun(list(term),bool)) a1:list(term)) a1':list(term))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#-->:fun(form,fun(form,form)) a0':form) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) a0:form) a0':form)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#!!:fun(num,fun(form,form)) a0:num) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a0:num) a0':num)) ((#=:fun(form,fun(form,bool)) a1:form) a1':form)))))))))))))
      #|form_DISTINCT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(list(term),bool),bool) (\a1':list(term). (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#Atom:fun(num,fun(list(term),form)) a0':num) a1':list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) #False:form) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). (#forall:fun(fun(form,bool),bool) (\a0':form. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term))) ((#-->:fun(form,fun(form,form)) a0':form) a1':form)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(term),bool),bool) (\a1:list(term). (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term))) ((#!!:fun(num,fun(form,form)) a0':num) a1':form)))))))))))) (#forall:fun(fun(form,bool),bool) (\a0:form. (#forall:fun(fun(form,bool),bool) (\a1:form. (#forall:fun(fun(num,bool),bool) (\a0':num. (#forall:fun(fun(form,bool),bool) (\a1':form. (#~:fun(bool,bool) ((#=:fun(form,fun(form,bool)) ((#-->:fun(form,fun(form,form)) a0:form) a1:form)) ((#!!:fun(num,fun(form,form)) a0':num) a1':form))))))))))))))))
      #|form_CASES =  |- (#forall:fun(fun(form,bool),bool) (\x:form. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) x:form) #False:form)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\a0:num. (#?:fun(fun(list(term),bool),bool) (\a1:list(term). ((#=:fun(form,fun(form,bool)) x:form) ((#Atom:fun(num,fun(list(term),form)) a0:num) a1:list(term)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(form,bool),bool) (\a0:form. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#-->:fun(form,fun(form,form)) a0:form) a1:form))))))) (#?:fun(fun(num,bool),bool) (\a0:num. (#?:fun(fun(form,bool),bool) (\a1:form. ((#=:fun(form,fun(form,bool)) x:form) ((#!!:fun(num,fun(form,form)) a0:num) a1:form)))))))))))
      #|Not_DEF =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) (#Not:fun(form,form) p:form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form))))
      #|True_DEF =  |- ((#=:fun(form,fun(form,bool)) #True:form) (#Not:fun(form,form) #False:form))
      #|Or_DEF =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) ((#||:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) q:form))))))
      #|And_DEF =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) (#Not:fun(form,form) ((#||:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form))))))))
      #|Iff_DEF =  |- (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#&&:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))
      #|Exists_DEF =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form)) (#Not:fun(form,form) ((#!!:fun(num,fun(form,form)) x:num) (#Not:fun(form,form) p:form))))))))
      #|functions_term =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\v:num. ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_term:fun(term,fun(prod(num,num),bool)) (#V:fun(num,term) v:num))) #EMPTY:fun(prod(num,num),bool))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_term:fun(term,fun(prod(num,num),bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) l:list(term)))) ((#INSERT:fun(prod(num,num),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) ((#,:fun(num,fun(num,prod(num,num))) f:num) (#LENGTH:fun(list(term),num) l:list(term)))) (#LIST_UNION:fun(list(fun(prod(num,num),bool)),fun(prod(num,num),bool)) ((#MAP:fun(fun(term,fun(prod(num,num),bool)),fun(list(term),list(fun(prod(num,num),bool)))) #functions_term:fun(term,fun(prod(num,num),bool))) l:list(term))))))))))
      #|functions_form =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) #False:form)) #EMPTY:fun(prod(num,num),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) (#LIST_UNION:fun(list(fun(prod(num,num),bool)),fun(prod(num,num),bool)) ((#MAP:fun(fun(term,fun(prod(num,num),bool)),fun(list(term),list(fun(prod(num,num),bool)))) #functions_term:fun(term,fun(prod(num,num),bool))) l:list(term))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form)) (#functions_form:fun(form,fun(prod(num,num),bool)) q:form)))) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form)))))
      #|predicates_form =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates_form:fun(form,fun(prod(num,num),bool)) #False:form)) #EMPTY:fun(prod(num,num),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates_form:fun(form,fun(prod(num,num),bool)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) ((#INSERT:fun(prod(num,num),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#LENGTH:fun(list(term),num) l:list(term)))) #EMPTY:fun(prod(num,num),bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates_form:fun(form,fun(prod(num,num),bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) (#predicates_form:fun(form,fun(prod(num,num),bool)) p:form)) (#predicates_form:fun(form,fun(prod(num,num),bool)) q:form)))) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates_form:fun(form,fun(prod(num,num),bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) (#predicates_form:fun(form,fun(prod(num,num),bool)) p:form)))))
      #|functions =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions:fun(fun(form,bool),fun(prod(num,num),bool)) fms:fun(form,bool))) (#UNIONS:fun(fun(fun(prod(num,num),bool),bool),fun(prod(num,num),bool)) (#GSPEC:fun(fun(fun(prod(num,num),bool),bool),fun(fun(prod(num,num),bool),bool)) (\GEN%PVAR%1:fun(prod(num,num),bool). (#?:fun(fun(form,bool),bool) (\f:form. (((#SETSPEC:fun(fun(prod(num,num),bool),fun(bool,fun(fun(prod(num,num),bool),bool))) GEN%PVAR%1:fun(prod(num,num),bool)) ((#IN:fun(form,fun(fun(form,bool),bool)) f:form) fms:fun(form,bool))) (#functions_form:fun(form,fun(prod(num,num),bool)) f:form))))))))))
      #|predicates =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates:fun(fun(form,bool),fun(prod(num,num),bool)) fms:fun(form,bool))) (#UNIONS:fun(fun(fun(prod(num,num),bool),bool),fun(prod(num,num),bool)) (#GSPEC:fun(fun(fun(prod(num,num),bool),bool),fun(fun(prod(num,num),bool),bool)) (\GEN%PVAR%2:fun(prod(num,num),bool). (#?:fun(fun(form,bool),bool) (\f:form. (((#SETSPEC:fun(fun(prod(num,num),bool),fun(bool,fun(fun(prod(num,num),bool),bool))) GEN%PVAR%2:fun(prod(num,num),bool)) ((#IN:fun(form,fun(fun(form,bool),bool)) f:form) fms:fun(form,bool))) (#predicates_form:fun(form,fun(prod(num,num),bool)) f:form))))))))))
      #|language =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). ((#=:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),bool)) (#language:fun(fun(form,bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool))) fms:fun(form,bool))) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) (#functions:fun(fun(form,bool),fun(prod(num,num),bool)) fms:fun(form,bool))) (#predicates:fun(fun(form,bool),fun(prod(num,num),bool)) fms:fun(form,bool))))))
      #|FUNCTIONS_SING =  |- ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions:fun(fun(form,bool),fun(prod(num,num),bool)) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) #EMPTY:fun(form,bool)))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form))
      #|LANGUAGE_1 =  |- ((#=:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),bool)) (#language:fun(fun(form,bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool))) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) #EMPTY:fun(form,bool)))) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form)) (#predicates_form:fun(form,fun(prod(num,num),bool)) p:form)))
      #|Dom_DEF =  |- (#forall:fun(fun(fun(num,fun(list('A),'A)),bool),bool) (\Funs:fun(num,fun(list('A),'A)). (#forall:fun(fun(fun(num,fun(list('A),bool)),bool),bool) (\Preds:fun(num,fun(list('A),bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\D:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) ((#,:fun(fun('A,bool),fun(prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))),prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) D:fun('A,bool)) ((#,:fun(fun(num,fun(list('A),'A)),fun(fun(num,fun(list('A),bool)),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) Funs:fun(num,fun(list('A),'A))) Preds:fun(num,fun(list('A),bool)))))) D:fun('A,bool))))))))
      #|Fun_DEF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\D:fun('A,bool). (#forall:fun(fun(fun(num,fun(list('A),bool)),bool),bool) (\Preds:fun(num,fun(list('A),bool)). (#forall:fun(fun(fun(num,fun(list('A),'A)),bool),bool) (\Funs:fun(num,fun(list('A),'A)). ((#=:fun(fun(num,fun(list('A),'A)),fun(fun(num,fun(list('A),'A)),bool)) (#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) ((#,:fun(fun('A,bool),fun(prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))),prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) D:fun('A,bool)) ((#,:fun(fun(num,fun(list('A),'A)),fun(fun(num,fun(list('A),bool)),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) Funs:fun(num,fun(list('A),'A))) Preds:fun(num,fun(list('A),bool)))))) Funs:fun(num,fun(list('A),'A)))))))))
      #|Pred_DEF =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\D:fun('A,bool). (#forall:fun(fun(fun(num,fun(list('A),'A)),bool),bool) (\Funs:fun(num,fun(list('A),'A)). (#forall:fun(fun(fun(num,fun(list('A),bool)),bool),bool) (\Preds:fun(num,fun(list('A),bool)). ((#=:fun(fun(num,fun(list('A),bool)),fun(fun(num,fun(list('A),bool)),bool)) (#Pred:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),bool))) ((#,:fun(fun('A,bool),fun(prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))),prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) D:fun('A,bool)) ((#,:fun(fun(num,fun(list('A),'A)),fun(fun(num,fun(list('A),bool)),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) Funs:fun(num,fun(list('A),'A))) Preds:fun(num,fun(list('A),bool)))))) Preds:fun(num,fun(list('A),bool)))))))))
      #|MODEL_EQ =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),bool)) M:prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool))))) M':prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('?5,bool),fun(fun('?5,bool),bool)) (#Dom:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun('?5,bool)) M:prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))))) (#Dom:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun('?5,bool)) M':prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun(list('?5),'?5)),fun(fun(num,fun(list('?5),'?5)),bool)) (#Fun:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun(num,fun(list('?5),'?5))) M:prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))))) (#Fun:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun(num,fun(list('?5),'?5))) M':prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool))))))) ((#=:fun(fun(num,fun(list('?5),bool)),fun(fun(num,fun(list('?5),bool)),bool)) (#Pred:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun(num,fun(list('?5),bool))) M:prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))))) (#Pred:fun(prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))),fun(num,fun(list('?5),bool))) M':prod(fun('?5,bool),prod(fun(num,fun(list('?5),'?5)),fun(num,fun(list('?5),bool)))))))))
      #|MODEL_DECOMP =  |- ((#=:fun(prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))),fun(prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))),bool)) M:prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool))))) ((#,:fun(fun('?6,bool),fun(prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool))),prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))))) (#Dom:fun(prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))),fun('?6,bool)) M:prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))))) ((#,:fun(fun(num,fun(list('?6),'?6)),fun(fun(num,fun(list('?6),bool)),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool))))) (#Fun:fun(prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))),fun(num,fun(list('?6),'?6))) M:prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))))) (#Pred:fun(prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool)))),fun(num,fun(list('?6),bool))) M:prod(fun('?6,bool),prod(fun(num,fun(list('?6),'?6)),fun(num,fun(list('?6),bool))))))))
      #|FVT =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) (#V:fun(num,term) x:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) #EMPTY:fun(num,bool)))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) l:list(term)))) (#LIST_UNION:fun(list(fun(num,bool)),fun(num,bool)) ((#MAP:fun(fun(term,fun(num,bool)),fun(list(term),list(fun(num,bool)))) #FVT:fun(term,fun(num,bool))) l:list(term)))))))))
      #|FV =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) #False:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) (#LIST_UNION:fun(list(fun(num,bool)),fun(num,bool)) ((#MAP:fun(fun(term,fun(num,bool)),fun(list(term),list(fun(num,bool)))) #FVT:fun(term,fun(num,bool))) l:list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) (#FV:fun(form,fun(num,bool)) q:form)))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) x:num)))))))))
      #|BV =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#BV:fun(form,fun(num,bool)) #False:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#BV:fun(form,fun(num,bool)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) #EMPTY:fun(num,bool))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#BV:fun(form,fun(num,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#BV:fun(form,fun(num,bool)) p:form)) (#BV:fun(form,fun(num,bool)) q:form)))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#BV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) (#BV:fun(form,fun(num,bool)) p:form))))))))))
      #|FVT_FINITE =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#FINITE:fun(fun(num,bool),bool) (#FVT:fun(term,fun(num,bool)) t:term))))
      #|FV_FINITE =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#FINITE:fun(fun(num,bool),bool) (#FV:fun(form,fun(num,bool)) p:form))))
      #|BV_FINITE =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#FINITE:fun(fun(num,bool),bool) (#BV:fun(form,fun(num,bool)) p:form))))
      #|FV_EXISTS =  |- ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) x:num))
      #|valmod =  |- (#forall:fun(fun('?7,bool),bool) (\x:'?7. (#forall:fun(fun('?8,bool),bool) (\a:'?8. (#forall:fun(fun(fun('?7,'?8),bool),bool) (\v:fun('?7,'?8). ((#=:fun(fun('?7,'?8),fun(fun('?7,'?8),bool)) ((#valmod:fun(prod('?7,'?8),fun(fun('?7,'?8),fun('?7,'?8))) ((#,:fun('?7,fun('?8,prod('?7,'?8))) x:'?7) a:'?8)) v:fun('?7,'?8))) (\y:'?7. (((#COND:fun(bool,fun('?8,fun('?8,'?8))) ((#=:fun('?7,fun('?7,bool)) y:'?7) x:'?7)) a:'?8) (v:fun('?7,'?8) y:'?7))))))))))
      #|VALMOD_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('?9,'?10),bool),bool) (\v:fun('?9,'?10). (#forall:fun(fun('?10,bool),bool) (\a:'?10. (#forall:fun(fun('?9,bool),bool) (\k:'?9. ((#=:fun('?10,fun('?10,bool)) (((#valmod:fun(prod('?9,'?10),fun(fun('?9,'?10),fun('?9,'?10))) ((#,:fun('?9,fun('?10,prod('?9,'?10))) k:'?9) a:'?10)) v:fun('?9,'?10)) k:'?9)) a:'?10)))))))) (#forall:fun(fun(fun('?11,'?12),bool),bool) (\v:fun('?11,'?12). (#forall:fun(fun('?12,bool),bool) (\a:'?12. (#forall:fun(fun('?11,bool),bool) (\k:'?11. (#forall:fun(fun('?11,bool),bool) (\x:'?11. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?11,fun('?11,bool)) x:'?11) k:'?11))) ((#=:fun('?12,fun('?12,bool)) (((#valmod:fun(prod('?11,'?12),fun(fun('?11,'?12),fun('?11,'?12))) ((#,:fun('?11,fun('?12,prod('?11,'?12))) k:'?11) a:'?12)) v:fun('?11,'?12)) x:'?11)) (v:fun('?11,'?12) x:'?11))))))))))))
      #|VALMOD_TRIV =  |- (#forall:fun(fun(fun('?13,'?14),bool),bool) (\v:fun('?13,'?14). (#forall:fun(fun('?13,bool),bool) (\x:'?13. ((#=:fun(fun('?13,'?14),fun(fun('?13,'?14),bool)) ((#valmod:fun(prod('?13,'?14),fun(fun('?13,'?14),fun('?13,'?14))) ((#,:fun('?13,fun('?14,prod('?13,'?14))) x:'?13) (v:fun('?13,'?14) x:'?13))) v:fun('?13,'?14))) v:fun('?13,'?14))))))
      #|VALMOD_VALMOD =  |- (#forall:fun(fun(fun('?15,'?16),bool),bool) (\v:fun('?15,'?16). (#forall:fun(fun('?16,bool),bool) (\a:'?16. (#forall:fun(fun('?15,bool),bool) (\x:'?15. (#forall:fun(fun('?16,bool),bool) (\b:'?16. ((#=:fun(fun('?15,'?16),fun(fun('?15,'?16),bool)) ((#valmod:fun(prod('?15,'?16),fun(fun('?15,'?16),fun('?15,'?16))) ((#,:fun('?15,fun('?16,prod('?15,'?16))) x:'?15) a:'?16)) ((#valmod:fun(prod('?15,'?16),fun(fun('?15,'?16),fun('?15,'?16))) ((#,:fun('?15,fun('?16,prod('?15,'?16))) x:'?15) b:'?16)) v:fun('?15,'?16)))) ((#valmod:fun(prod('?15,'?16),fun(fun('?15,'?16),fun('?15,'?16))) ((#,:fun('?15,fun('?16,prod('?15,'?16))) x:'?15) a:'?16)) v:fun('?15,'?16)))))))))))
      #|valuation =  |- (#forall:fun(fun(fun(num,'?17),bool),bool) (\v:fun(num,'?17). (#forall:fun(fun(prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool)))),bool),bool) (\M:prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool)))). ((#=:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool)))),fun(fun(num,'?17),bool)) M:prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool))))) v:fun(num,'?17))) (#forall:fun(fun(num,bool),bool) (\x:num. ((#IN:fun('?17,fun(fun('?17,bool),bool)) (v:fun(num,'?17) x:num)) (#Dom:fun(prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool)))),fun('?17,bool)) M:prod(fun('?17,bool),prod(fun(num,fun(list('?17),'?17)),fun(num,fun(list('?17),bool)))))))))))))
      #|VALUATION_VALMOD =  |- (#forall:fun(fun(prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))),bool),bool) (\M:prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))). (#forall:fun(fun('?18,bool),bool) (\a:'?18. (#forall:fun(fun(fun(num,'?18),bool),bool) (\v:fun(num,'?18). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))),fun(fun(num,'?18),bool)) M:prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool))))) v:fun(num,'?18))) ((#IN:fun('?18,fun(fun('?18,bool),bool)) a:'?18) (#Dom:fun(prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))),fun('?18,bool)) M:prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))))))) ((#valuation:fun(prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool)))),fun(fun(num,'?18),bool)) M:prod(fun('?18,bool),prod(fun(num,fun(list('?18),'?18)),fun(num,fun(list('?18),bool))))) ((#valmod:fun(prod(num,'?18),fun(fun(num,'?18),fun(num,'?18))) ((#,:fun(num,fun('?18,prod(num,'?18))) x:num) a:'?18)) v:fun(num,'?18))))))))))
      #|VALUATION_IS_VALMOD =  |- (#forall:fun(fun(fun('?19,'?20),bool),bool) (\v:fun('?19,'?20). (#forall:fun(fun('?19,bool),bool) (\x:'?19. ((#=:fun(fun('?19,'?20),fun(fun('?19,'?20),bool)) ((#valmod:fun(prod('?19,'?20),fun(fun('?19,'?20),fun('?19,'?20))) ((#,:fun('?19,fun('?20,prod('?19,'?20))) x:'?19) (v:fun('?19,'?20) x:'?19))) v:fun('?19,'?20))) v:fun('?19,'?20))))))
      #|termval =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun('?21,fun('?21,bool)) (((#termval:fun(prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool)))),fun(fun(num,'?21),fun(term,'?21))) M:prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool))))) v:fun(num,'?21)) (#V:fun(num,term) x:num))) (v:fun(num,'?21) x:num))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun('?21,fun('?21,bool)) (((#termval:fun(prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool)))),fun(fun(num,'?21),fun(term,'?21))) M:prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool))))) v:fun(num,'?21)) ((#Fn:fun(num,fun(list(term),term)) f:num) l:list(term)))) (((#Fun:fun(prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool)))),fun(num,fun(list('?21),'?21))) M:prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool))))) f:num) ((#MAP:fun(fun(term,'?21),fun(list(term),list('?21))) ((#termval:fun(prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool)))),fun(fun(num,'?21),fun(term,'?21))) M:prod(fun('?21,bool),prod(fun(num,fun(list('?21),'?21)),fun(num,fun(list('?21),bool))))) v:fun(num,'?21))) l:list(term)))))))))
      #|holds =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) #False:form)) #F:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) (((#Pred:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(num,fun(list('?22),bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) a:num) ((#MAP:fun(fun(term,'?22),fun(list(term),list('?22))) ((#termval:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(term,'?22))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22))) l:list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#==>:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) p:form)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) q:form)))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) v:fun(num,'?22)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) (#forall:fun(fun('?22,bool),bool) (\a:'?22. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?22,fun(fun('?22,bool),bool)) a:'?22) (#Dom:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun('?22,bool)) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))))) (((#holds:fun(prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool)))),fun(fun(num,'?22),fun(form,bool))) M:prod(fun('?22,bool),prod(fun(num,fun(list('?22),'?22)),fun(num,fun(list('?22),bool))))) ((#valmod:fun(prod(num,'?22),fun(fun(num,'?22),fun(num,'?22))) ((#,:fun(num,fun('?22,prod(num,'?22))) x:num) a:'?22)) v:fun(num,'?22))) p:form))))))))))))
      #|hold =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). (#forall:fun(fun(prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool)))),bool),bool) (\M:prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool)))). (#forall:fun(fun(fun(num,'?23),bool),bool) (\v:fun(num,'?23). ((#=:fun(bool,fun(bool,bool)) (((#hold:fun(prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool)))),fun(fun(num,'?23),fun(fun(form,bool),bool))) M:prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool))))) v:fun(num,'?23)) fms:fun(form,bool))) (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(form,fun(fun(form,bool),bool)) p:form) fms:fun(form,bool))) (((#holds:fun(prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool)))),fun(fun(num,'?23),fun(form,bool))) M:prod(fun('?23,bool),prod(fun(num,fun(list('?23),'?23)),fun(num,fun(list('?23),bool))))) v:fun(num,'?23)) p:form)))))))))))
      #|satisfies =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). (#forall:fun(fun(prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool)))),bool),bool) (\M:prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool)))). ((#=:fun(bool,fun(bool,bool)) ((#satisfies:fun(prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool)))),fun(fun(form,bool),bool)) M:prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool))))) fms:fun(form,bool))) (#forall:fun(fun(fun(num,'?24),bool),bool) (\v:fun(num,'?24). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool)))),fun(fun(num,'?24),bool)) M:prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool))))) v:fun(num,'?24))) ((#IN:fun(form,fun(fun(form,bool),bool)) p:form) fms:fun(form,bool)))) (((#holds:fun(prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool)))),fun(fun(num,'?24),fun(form,bool))) M:prod(fun('?24,bool),prod(fun(num,fun(list('?24),'?24)),fun(num,fun(list('?24),bool))))) v:fun(num,'?24)) p:form)))))))))))
      #|SATISFIES_1 =  |- ((#=:fun(bool,fun(bool,bool)) ((#satisfies:fun(prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool)))),fun(fun(form,bool),bool)) M:prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool))))) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) #EMPTY:fun(form,bool)))) (#forall:fun(fun(fun(num,'?25),bool),bool) (\v:fun(num,'?25). ((#==>:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool)))),fun(fun(num,'?25),bool)) M:prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool))))) v:fun(num,'?25))) (((#holds:fun(prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool)))),fun(fun(num,'?25),fun(form,bool))) M:prod(fun('?25,bool),prod(fun(num,fun(list('?25),'?25)),fun(num,fun(list('?25),bool))))) v:fun(num,'?25)) p:form)))))
      #|HOLDS =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) #False:form)) #F:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) #True:form)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#Atom:fun(num,fun(list(term),form)) a:num) l:list(term)))) (((#Pred:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(num,fun(list('?26),bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) a:num) ((#MAP:fun(fun(term,'?26),fun(list(term),list('?26))) ((#termval:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(term,'?26))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26))) l:list(term))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) (#Not:fun(form,form) p:form))) (#~:fun(bool,bool) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) p:form)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#\/:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) p:form)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#/\:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) p:form)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#==>:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) p:form)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) p:form)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) q:form)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) (#forall:fun(fun('?26,bool),bool) (\a:'?26. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?26,fun(fun('?26,bool),bool)) a:'?26) (#Dom:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun('?26,bool)) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))))) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) ((#valmod:fun(prod(num,'?26),fun(fun(num,'?26),fun(num,'?26))) ((#,:fun(num,fun('?26,prod(num,'?26))) x:num) a:'?26)) v:fun(num,'?26))) p:form)))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) v:fun(num,'?26)) ((#??:fun(num,fun(form,form)) x:num) p:form))) (#?:fun(fun('?26,bool),bool) (\a:'?26. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('?26,fun(fun('?26,bool),bool)) a:'?26) (#Dom:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun('?26,bool)) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))))) (((#holds:fun(prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool)))),fun(fun(num,'?26),fun(form,bool))) M:prod(fun('?26,bool),prod(fun(num,fun(list('?26),'?26)),fun(num,fun(list('?26),bool))))) ((#valmod:fun(prod(num,'?26),fun(fun(num,'?26),fun(num,'?26))) ((#,:fun(num,fun('?26,prod(num,'?26))) x:num) a:'?26)) v:fun(num,'?26))) p:form))))))))))))))))))
      #|TERMVAL_VALUATION =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). (#forall:fun(fun(fun(num,'A),bool),bool) (\v':fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun('A,fun('A,bool)) (v':fun(num,'A) x:num)) (v:fun(num,'A) x:num)))))) ((#=:fun('A,fun('A,bool)) (((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v':fun(num,'A)) t:term)) (((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) t:term)))))))))))
      #|HOLDS_VALUATION =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). (#forall:fun(fun(fun(num,'A),bool),bool) (\v':fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun('A,fun('A,bool)) (v':fun(num,'A) x:num)) (v:fun(num,'A) x:num)))))) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v':fun(num,'A)) p:form)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)))))))))))
      #|satisfiable =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\U:fun('A,bool). (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). ((#=:fun(bool,fun(bool,bool)) ((#satisfiable:fun(fun('A,bool),fun(fun(form,bool),bool)) U:fun('A,bool)) fms:fun(form,bool))) (#?:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) #EMPTY:fun('A,bool)))) ((#satisfies:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(form,bool),bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) fms:fun(form,bool))))))))))
      #|valid =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\U:fun('A,bool). (#forall:fun(fun(fun(form,bool),bool),bool) (\fms:fun(form,bool). ((#=:fun(bool,fun(bool,bool)) ((#valid:fun(fun('A,bool),fun(fun(form,bool),bool)) U:fun('A,bool)) fms:fun(form,bool))) (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). ((#satisfies:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(form,bool),bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) fms:fun(form,bool)))))))))
      #|entails =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\U:fun('A,bool). (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (((#entails:fun(fun('A,bool),fun(fun(form,bool),fun(form,bool))) U:fun('A,bool)) A:fun(form,bool)) p:form)) (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (((#hold:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(fun(form,bool),bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) A:fun(form,bool))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)))))))))))))
      #|equivalent =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\U:fun('A,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) (((#equivalent:fun(fun('A,bool),fun(form,fun(form,bool))) U:fun('A,bool)) p:form) q:form)) (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) q:form)))))))))))))
      #|interpretation =  |- (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\preds:fun(prod(num,num),bool). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\fns:fun(prod(num,num),bool). (#forall:fun(fun(prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))),bool),bool) (\M:prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))). ((#=:fun(bool,fun(bool,bool)) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) fns:fun(prod(num,num),bool)) preds:fun(prod(num,num),bool))) M:prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list('?27),bool),bool) (\l:list('?27). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) ((#,:fun(num,fun(num,prod(num,num))) f:num) (#LENGTH:fun(list('?27),num) l:list('?27)))) fns:fun(prod(num,num),bool))) ((#ALL:fun(fun('?27,bool),fun(list('?27),bool)) (\x:'?27. ((#IN:fun('?27,fun(fun('?27,bool),bool)) x:'?27) (#Dom:fun(prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))),fun('?27,bool)) M:prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))))))) l:list('?27)))) ((#IN:fun('?27,fun(fun('?27,bool),bool)) (((#Fun:fun(prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))),fun(num,fun(list('?27),'?27))) M:prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool))))) f:num) l:list('?27))) (#Dom:fun(prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool)))),fun('?27,bool)) M:prod(fun('?27,bool),prod(fun(num,fun(list('?27),'?27)),fun(num,fun(list('?27),bool))))))))))))))))))
      #|INTERPRETATION_TERMVAL =  |- (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\any:fun(prod(num,num),bool). (#forall:fun(fun(prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))),bool),bool) (\M:prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))). (#forall:fun(fun(fun(num,'?28),bool),bool) (\v:fun(num,'?28). (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) (#functions_term:fun(term,fun(prod(num,num),bool)) t:term)) any:fun(prod(num,num),bool))) M:prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))))) ((#valuation:fun(prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))),fun(fun(num,'?28),bool)) M:prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool))))) v:fun(num,'?28)))) ((#IN:fun('?28,fun(fun('?28,bool),bool)) (((#termval:fun(prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))),fun(fun(num,'?28),fun(term,'?28))) M:prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool))))) v:fun(num,'?28)) t:term)) (#Dom:fun(prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))),fun('?28,bool)) M:prod(fun('?28,bool),prod(fun(num,fun(list('?28),'?28)),fun(num,fun(list('?28),bool)))))))))))))))
      #|INTERPRETATION_SUBLANGUAGE =  |- (#forall:fun(fun(prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))),bool),bool) (\M:prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\funs1:fun(prod(num,num),bool). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\funs2:fun(prod(num,num),bool). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\preds1:fun(prod(num,num),bool). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\preds2:fun(prod(num,num),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) funs2:fun(prod(num,num),bool)) funs1:fun(prod(num,num),bool))) ((#==>:fun(bool,fun(bool,bool)) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) funs1:fun(prod(num,num),bool)) preds1:fun(prod(num,num),bool))) M:prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))))) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) funs2:fun(prod(num,num),bool)) preds2:fun(prod(num,num),bool))) M:prod(fun('?29,bool),prod(fun(num,fun(list('?29),'?29)),fun(num,fun(list('?29),bool)))))))))))))))))
      #|termsubst =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) (#V:fun(num,term) x:num))) (v:fun(num,term) x:num))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\l:list(term). ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) ((#Fn:fun(num,fun(list(term),term)) f:num) l:list(term)))) ((#Fn:fun(num,fun(list(term),term)) f:num) ((#MAP:fun(fun(term,term),fun(list(term),list(term))) (#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term))) l:list(term)))))))))
      #|TERMSUBST_TERMVAL =  |- (#forall:fun(fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),bool),bool) (\M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun(list(term),term)),fun(fun(num,fun(list(term),term)),bool)) (#Fun:fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),fun(num,fun(list(term),term))) M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))))) #Fn:fun(num,fun(list(term),term)))) (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)) (((#termval:fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),fun(fun(num,term),fun(term,term))) M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool))))) v:fun(num,term)) t:term)))))))))
      #|TERMVAL_TRIV =  |- (#forall:fun(fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),bool),bool) (\M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun(list(term),term)),fun(fun(num,fun(list(term),term)),bool)) (#Fun:fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),fun(num,fun(list(term),term))) M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))))) #Fn:fun(num,fun(list(term),term)))) (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) (((#termval:fun(prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool)))),fun(fun(num,term),fun(term,term))) M:prod(fun(term,bool),prod(fun(num,fun(list(term),term)),fun(num,fun(list(term),bool))))) #V:fun(num,term)) t:term)) t:term))))))
      #|TERMVAL_TERMSUBST =  |- (#forall:fun(fun(prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool)))),bool),bool) (\M:prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool)))). (#forall:fun(fun(fun(num,'?30),bool),bool) (\v:fun(num,'?30). (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun('?30,fun('?30,bool)) (((#termval:fun(prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool)))),fun(fun(num,'?30),fun(term,'?30))) M:prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool))))) v:fun(num,'?30)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) (((#termval:fun(prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool)))),fun(fun(num,'?30),fun(term,'?30))) M:prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool))))) ((#o:fun(fun(term,'?30),fun(fun(num,term),fun(num,'?30))) ((#termval:fun(prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool)))),fun(fun(num,'?30),fun(term,'?30))) M:prod(fun('?30,bool),prod(fun(num,fun(list('?30),'?30)),fun(num,fun(list('?30),bool))))) v:fun(num,'?30))) i:fun(num,term))) t:term))))))))))
      #|TERMSUBST_TERMSUBST =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\j:fun(num,term). (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) j:fun(num,term)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#o:fun(fun(term,term),fun(fun(num,term),fun(num,term))) (#termsubst:fun(fun(num,term),fun(term,term)) j:fun(num,term))) i:fun(num,term))) t:term))))))))
      #|TERMSUBST_TRIV =  |- (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) #V:fun(num,term)) t:term)) t:term)))
      #|TERMSUBST_VALUATION =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\v':fun(num,term). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#=:fun(term,fun(term,bool)) (v':fun(num,term) x:num)) (v:fun(num,term) x:num)))))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v':fun(num,term)) t:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) t:term)))))))))
      #|TERMSUBST_FVT =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%3:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%3:num) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (i:fun(num,term) y:num))))))) x:num))))))))))
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
      #|formsubst =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) #False:form)) #False:form)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#Atom:fun(num,fun(list(term),form)) p:num) l:list(term)))) ((#Atom:fun(num,fun(list(term),form)) p:num) ((#MAP:fun(fun(term,term),fun(list(term),list(term))) (#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term))) l:list(term))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) q:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) r:form)))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) ((#!!:fun(num,fun(form,form)) x:num) q:form))) ((#LET:fun(fun(fun(num,term),form),fun(fun(num,term),form)) (\v':fun(num,term). (#LET_END:fun(form,form) ((#LET:fun(fun(num,form),fun(num,form)) (\z:num. (#LET_END:fun(form,form) ((#!!:fun(num,fun(form,form)) z:num) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) z:num))) v:fun(num,term))) q:form))))) (((#COND:fun(bool,fun(num,fun(num,num))) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) q:form)))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (v':fun(num,term) y:num))))))) (#VARIANT:fun(fun(num,bool),num) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v':fun(num,term)) q:form)))) x:num))))) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) x:num))) v:fun(num,term)))))))
      #|FORMSUBST_TRIV =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) #V:fun(num,term)) p:form)) p:form)))
      #|FORMSUBST_VALUATION =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\v':fun(num,term). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun(term,fun(term,bool)) (v':fun(num,term) x:num)) (v:fun(num,term) x:num)))))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v':fun(num,term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)))))))))
      #|FORMSUBST_FV =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%4:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%4:num) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) (i:fun(num,term) y:num))))))) x:num))))))))))
      #|HOLDS_FORMSUBST =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) ((#o:fun(fun(term,'A),fun(fun(num,term),fun(num,'A))) ((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A))) i:fun(num,term))) p:form))))))))
      #|HOLDS_FORMSUBST1 =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) t:term)) #V:fun(num,term))) p:form))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) ((#valmod:fun(prod(num,'A),fun(fun(num,'A),fun(num,'A))) ((#,:fun(num,fun('A,prod(num,'A))) x:num) (((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) t:term))) v:fun(num,'A))) p:form))))))))))
      #|HOLDS_RENAME =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) y:num))) #V:fun(num,term))) p:form))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) ((#valmod:fun(prod(num,'A),fun(fun(num,'A),fun(num,'A))) ((#,:fun(num,fun('A,prod(num,'A))) x:num) (v:fun(num,'A) y:num))) v:fun(num,'A))) p:form))))))))))
      #|HOLDS_ALPHA_FORALL =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))))) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#!!:fun(num,fun(form,form)) y:num) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) y:num))) #V:fun(num,term))) p:form)))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#!!:fun(num,fun(form,form)) x:num) p:form))))))))))))
      #|HOLDS_ALPHA_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form))))) ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#??:fun(num,fun(form,form)) y:num) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) y:num))) #V:fun(num,term))) p:form)))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#??:fun(num,fun(form,form)) x:num) p:form))))))))))))
      #|FORMSUBST_RENAME =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) y:num))) #V:fun(num,term))) p:form))) y:num)) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) ((#DELETE:fun(fun(num,bool),fun(num,fun(num,bool))) (#FV:fun(form,fun(num,bool)) p:form)) x:num)) y:num))))))))
      #|TERMSUBST_FUNCTIONS_TERM =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_term:fun(term,fun(prod(num,num),bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term))) ((#UNION:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) (#functions_term:fun(term,fun(prod(num,num),bool)) t:term)) (#GSPEC:fun(fun(prod(num,num),bool),fun(prod(num,num),bool)) (\GEN%PVAR%5:prod(num,num). (#?:fun(fun(prod(num,num),bool),bool) (\x:prod(num,num). (((#SETSPEC:fun(prod(num,num),fun(bool,fun(prod(num,num),bool))) GEN%PVAR%5:prod(num,num)) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) x:prod(num,num)) (#functions_term:fun(term,fun(prod(num,num),bool)) (i:fun(num,term) y:num))))))) x:prod(num,num))))))))))))
      #|FORMSUBST_FUNCTIONS_FORM =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) ((#UNION:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form)) (#GSPEC:fun(fun(prod(num,num),bool),fun(prod(num,num),bool)) (\GEN%PVAR%6:prod(num,num). (#?:fun(fun(prod(num,num),bool),bool) (\x:prod(num,num). (((#SETSPEC:fun(prod(num,num),fun(bool,fun(prod(num,num),bool))) GEN%PVAR%6:prod(num,num)) (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) x:prod(num,num)) (#functions_term:fun(term,fun(prod(num,num),bool)) (i:fun(num,term) y:num))))))) x:prod(num,num))))))))))))
      #|FORMSUBST_FUNCTIONS_FORM_1 =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form))) ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_form:fun(form,fun(prod(num,num),bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) t:term)) #V:fun(num,term))) p:form))) ((#UNION:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),fun(prod(num,num),bool))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form)) (#functions_term:fun(term,fun(prod(num,num),bool)) t:term))))))))))
      #|FORMSUBST_PREDICATES =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates_form:fun(form,fun(prod(num,num),bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (#predicates_form:fun(form,fun(prod(num,num),bool)) p:form))))))
      #|FORMSUBST_LANGUAGE_RENAME =  |- ((#=:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),bool)) (#language:fun(fun(form,bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool))) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#valmod:fun(prod(num,term),fun(fun(num,term),fun(num,term))) ((#,:fun(num,fun(term,prod(num,term))) x:num) (#V:fun(num,term) y:num))) #V:fun(num,term))) p:form)) #EMPTY:fun(form,bool)))) (#language:fun(fun(form,bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool))) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) #EMPTY:fun(form,bool))))
      #|TERMVAL_FUNCTIONS =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list('A),bool),bool) (\zs:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) ((#,:fun(num,fun(num,prod(num,num))) f:num) (#LENGTH:fun(list('A),num) zs:list('A)))) (#functions_term:fun(term,fun(prod(num,num),bool)) t:term))) ((#=:fun('A,fun('A,bool)) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A))) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A))))))))) (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun('A,fun('A,bool)) (((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) t:term)) (((#termval:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(term,'A))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) t:term)))))))))
      #|HOLDS_FUNCTIONS =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\P:num. (#forall:fun(fun(list('A),bool),bool) (\zs:list('A). ((#=:fun(bool,fun(bool,bool)) (((#Pred:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) P:num) zs:list('A))) (((#Pred:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),bool))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) P:num) zs:list('A)))))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list('A),bool),bool) (\zs:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) ((#,:fun(num,fun(num,prod(num,num))) f:num) (#LENGTH:fun(list('A),num) zs:list('A)))) (#functions_form:fun(form,fun(prod(num,num),bool)) p:form))) ((#=:fun('A,fun('A,bool)) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A))) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A))))))))))) (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)))))))))))
      #|HOLDS_PREDICATES =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list('A),bool),bool) (\zs:list('A). ((#=:fun('A,fun('A,bool)) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A))) (((#Fun:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),'A))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) f:num) zs:list('A)))))))) (#forall:fun(fun(num,bool),bool) (\P:num. (#forall:fun(fun(list('A),bool),bool) (\zs:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(prod(num,num),fun(fun(prod(num,num),bool),bool)) ((#,:fun(num,fun(num,prod(num,num))) P:num) (#LENGTH:fun(list('A),num) zs:list('A)))) (#predicates_form:fun(form,fun(prod(num,num),bool)) p:form))) ((#=:fun(bool,fun(bool,bool)) (((#Pred:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) P:num) zs:list('A))) (((#Pred:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(num,fun(list('A),bool))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) P:num) zs:list('A))))))))))) (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form)))))))))))
      #|HOLDS_UCLOSE =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) ((#!!:fun(num,fun(form,form)) x:num) p:form)))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) #EMPTY:fun('A,bool))) (#forall:fun(fun(fun(num,'A),bool),bool) (\v:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#valuation:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A))) (((#holds:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(num,'A),fun(form,bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) v:fun(num,'A)) p:form))))))))))))
      #|MODEL_DUPLICATE =  |- (#forall:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\fns:fun(prod(num,num),bool). (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\preds:fun(prod(num,num),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\D:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) fns:fun(prod(num,num),bool)) preds:fun(prod(num,num),bool))) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) D:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) #EMPTY:fun('A,bool)))))) (#?:fun(fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool),bool) (\M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))). ((#/\:fun(bool,fun(bool,bool)) ((#interpretation:fun(prod(fun(prod(num,num),bool),fun(prod(num,num),bool)),fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),bool)) ((#,:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),prod(fun(prod(num,num),bool),fun(prod(num,num),bool)))) fns:fun(prod(num,num),bool)) preds:fun(prod(num,num),bool))) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#Dom:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun('A,bool)) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))))) D:fun('A,bool))) (#forall:fun(fun(fun(form,bool),bool),bool) (\s:fun(form,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions:fun(fun(form,bool),fun(prod(num,num),bool)) s:fun(form,bool))) fns:fun(prod(num,num),bool))) ((#SUBSET:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#predicates:fun(fun(form,bool),fun(prod(num,num),bool)) s:fun(form,bool))) preds:fun(prod(num,num),bool)))) ((#=:fun(bool,fun(bool,bool)) ((#satisfies:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(form,bool),bool)) M':prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) s:fun(form,bool))) ((#satisfies:fun(prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool)))),fun(fun(form,bool),bool)) M:prod(fun('A,bool),prod(fun(num,fun(list('A),'A)),fun(num,fun(list('A),bool))))) s:fun(form,bool)))))))))))))))))))
      #|types = form/0 term/0 list_204827/0 multiset/1 metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = formsubst VARIANT SETMAX termsubst interpretation equivalent entails valid satisfiable satisfies hold holds termval valuation valmod BV FV FVT Pred Fun Dom language predicates functions predicates_form functions_form functions_term ?? <-> && || True Not !! --> Atom False _204991 _204990 _204989 _204988 _dest_form _mk_form Fn V _204947 _204831 _204830 _204829 _204828 _dest_term _mk_term _dest_list_204827 _mk_list_204827 LIST_UNION morder WFP mdiff munion msing mmember mempty multiplicity multiset JOINABLE LF TREE SN WN WCR CR NORMAL RELPOW INV RSTC STC RTC RSC TC SC RC ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 382
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?31
      #|counter_genvar = _215288:bool
      #|
    ),
  )
}
