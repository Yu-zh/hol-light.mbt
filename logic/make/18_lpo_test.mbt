// Logic/lpo.ml in its directory's load order: the test block of
// logic/lpo/lpo_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Logic_lpo_ref.expected).

///|
test "Logic/lpo matches Logic/lpo.ml" {
  @testkit.release_output()
  @lpo.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/wo", "Library/rstc", "Examples/reduct",
      "Examples/multiwf", "Logic/fol", "Logic/prenex", "Logic/skolem", "Logic/fol_prop",
      "Logic/canon", "Logic/herbrand", "Logic/fole", "Logic/unif", "Logic/resolution",
      "Logic/given", "Logic/linear", "Logic/support", "Logic/positive", "Logic/givensem",
      "Logic/prolog", "Logic/birkhoff", "Logic/trs", "Logic/lpo",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Logic/lpo")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("ITLIST_ADD_1_POS", () => sthm(@lpo.itlist_add_1_pos()))
  log.attempt("FVT_FUN_EMPTY", () => sthm(@lpo.fvt_fun_empty()))
  log.attempt("NONWF", () => sthm(@lpo.nonwf()))
  log.attempt("NONWF_SUCCESSOR", () => sthm(@lpo.nonwf_successor()))
  log.attempt("WF_NONWF", () => sthm(@lpo.wf_nonwf()))
  log.attempt("NONWF_INDUCT", () => sthm(@lpo.nonwf_induct()))
  log.attempt("WF_MINIMAL_STEP", () => sthm(@lpo.wf_minimal_step()))
  log.attempt("WF_MINIMAL_DCHAIN", () => sthm(@lpo.wf_minimal_dchain()))
  log.attempt("SEQUENCE_SUBSEQUENCE", () => sthm(@lpo.sequence_subsequence()))
  log.attempt("SEQUENCE_PARTITION_LEMMA", () => {
    sthm(@lpo.sequence_partition_lemma())
  })
  log.attempt("termsize_EXISTS", () => sthm(@lpo.termsize_exists()))
  log.attempt("termsize", () => sthm(@lpo.termsize()))
  log.attempt("LEX_DEF", () => sthm(@lpo.lex_def()))
  log.attempt("LEX", () => sthm(@lpo.lex()))
  log.attempt("LEX_LENGTH", () => sthm(@lpo.lex_length()))
  log.attempt("MONO_LEX", () => sthm(@lpo.mono_lex()))
  log.attempt("LEX_MAP", () => sthm(@lpo.lex_map()))
  log.attempt("LEX_REFL", () => sthm(@lpo.lex_refl()))
  log.attempt("LEX_LENGTH_CHAIN", () => sthm(@lpo.lex_length_chain()))
  log.attempt("WF_LEX_STRONG_INDUCT", () => sthm(@lpo.wf_lex_strong_induct()))
  log.attempt("WF_LEX_STRONG", () => sthm(@lpo.wf_lex_strong()))
  log.attempt("LEX_RESTRICT", () => sthm(@lpo.lex_restrict()))
  log.attempt("subterm_RULES", () => sthm(@lpo.subterm_rules()))
  log.attempt("subterm_INDUCT", () => sthm(@lpo.subterm_induct()))
  log.attempt("subterm_CASES", () => sthm(@lpo.subterm_cases()))
  log.attempt("psubterm", () => sthm(@lpo.psubterm()))
  log.attempt("DESCENDANT_SMALLER", () => sthm(@lpo.descendant_smaller()))
  log.attempt("DESCENDANT_DISTINCT", () => sthm(@lpo.descendant_distinct()))
  log.attempt("SUBTERM_REFL", () => sthm(@lpo.subterm_refl()))
  log.attempt("SUBTERM_TRANS", () => sthm(@lpo.subterm_trans()))
  log.attempt("SUBTERM_ANTISYM", () => sthm(@lpo.subterm_antisym()))
  log.attempt("SUBTERM_FVT", () => sthm(@lpo.subterm_fvt()))
  log.attempt("PSUBTERM_ANTISYM", () => sthm(@lpo.psubterm_antisym()))
  log.attempt("SUBTERM_PSUBTERM_TRANS", () => {
    sthm(@lpo.subterm_psubterm_trans())
  })
  log.attempt("PSUBTERM_CASES", () => sthm(@lpo.psubterm_cases()))
  log.attempt("SUBTERM_INSTANTIATION", () => sthm(@lpo.subterm_instantiation()))
  log.attempt("PSUBTERM_INSTANTIATION", () => {
    sthm(@lpo.psubterm_instantiation())
  })
  log.attempt("lpo_RULES", () => sthm(@lpo.lpo_rules()))
  log.attempt("lpo_INDUCT", () => sthm(@lpo.lpo_induct()))
  log.attempt("lpo_CASES", () => sthm(@lpo.lpo_cases()))
  log.attempt("LPO_CASES", () => sthm(@lpo.lpo_cases_v1()))
  log.attempt("LPO_FVT", () => sthm(@lpo.lpo_fvt()))
  log.attempt("LPO_TRANS_INDUCT", () => sthm(@lpo.lpo_trans_induct()))
  log.attempt("LPO_TRANS", () => sthm(@lpo.lpo_trans()))
  log.attempt("LPO_SUBTERM_LEMMA", () => sthm(@lpo.lpo_subterm_lemma()))
  log.attempt("LPO_SUBTERM", () => sthm(@lpo.lpo_subterm()))
  log.attempt("LPO_PSUBTERM", () => sthm(@lpo.lpo_psubterm()))
  log.attempt("LPO_INSTANTIATION", () => sthm(@lpo.lpo_instantiation()))
  log.attempt("LPO_CONGRUENCE", () => sthm(@lpo.lpo_congruence()))
  log.attempt("LPO_REFL", () => sthm(@lpo.lpo_refl()))
  log.attempt("LPO_WF", () => sthm(@lpo.lpo_wf()))
  log.attempt("LPO_SUBTERM_NOT", () => sthm(@lpo.lpo_subterm_not()))
  log.attempt("LEX_TOTAL", () => sthm(@lpo.lex_total()))
  log.attempt("LPO_GROUND_COMPLETE", () => sthm(@lpo.lpo_ground_complete()))
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
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..9..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..1..3..7..solved at 19
      #|0..0..1..3..7..solved at 20
      #|0..0..2..4..8..13..24..solved at 38
      #|0..0..2..4..8..13..24..solved at 38
      #|0..0..1..2..5..solved at 14
      #|0..0..1..3..7..solved at 19
      #|0..0..1..3..7..solved at 20
      #|0..0..2..4..8..13..24..solved at 38
      #|0..0..2..4..8..13..24..solved at 38
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..24..33..44..solved at 73
      #|0..0..1..2..5..9..15..24..33..44..solved at 77
      #|0..0..1..2..5..9..15..24..33..44..solved at 77
      #|0..0..2..4..14..27..65..123..218..379..629..solved at 674
      #|0..0..3..6..17..30..81..156..solved at 166
      #|0..0..2..4..12..22..65..129..solved at 137
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..12..solved at 17
      #|0..0..2..4..13..solved at 18
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..2..5..11..solved at 16
      #|0..0..2..4..8..19..48..81..114..solved at 123
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..16..31..61..108..169..355..772..1813..6513..27758..113592..solved at 176771
      #|0..0..2..4..11..36..solved at 43
      #|0..0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 12
      #|0..0..0..2..4..6..solved at 11
      #|0..0..0..2..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..12..17..30..45..67..148..253..465..solved at 975
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 9
      #|0..0..2..solved at 5
      #|0..0..4..8..solved at 12
      #|0..0..1..2..solved at 9
      #|0..0..1..2..5..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..0..0..4..solved at 10
      #|0..0..3..6..solved at 11
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 8
      #|0..0..3..6..solved at 11
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 9
      #|0..0..3..solved at 6
      #|0..0..solved at 3
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
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..1..2..11..22..53..85..solved at 110
      #|0..0..1..2..7..15..36..67..107..solved at 120
      #|0..63..126..189..268..347..426..582..738..894..solved at 962
      #|0..42..120..198..276..379..482..585..746..907..1068..1309..1550..1791..solved at 2098
      #|0..63..126..189..268..347..426..582..738..894..solved at 962
      #|0..42..120..198..276..379..482..585..746..907..1068..1309..1550..1791..solved at 2094
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..3..7..13..20..29..43..64..87..114..148..186..solved at 221
      #|0..0..1..3..9..17..38..75..145..solved at 203
      #|0..0..2..solved at 5
      #|0..0..2..9..22..52..113..solved at 125
      #|0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..4..10..solved at 17
      #|0..0..2..7..14..solved at 33
      #|0..0..1..solved at 5
      #|0..0..4..8..solved at 12
      #|0..0..4..8..solved at 12
      #|0..0..3..6..17..37..solved at 60
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..32..66..114..184..260..350..491..636..835..1174..1523..solved at 1670
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 11
      #|0..0..1..3..7..14..29..50..84..134..202..286..solved at 346
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..9..14..19..35..51..67..89..111..133..solved at 160
      #|0..0..1..4..9..solved at 16
      #|0..0..1..5..11..solved at 16
      #|0..0..1..2..3..solved at 8
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..9..23..solved at 46
      #|0..0..solved at 2
      #|0..0..1..5..15..32..81..165..312..637..1195..2124..3872..6641..solved at 7478
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 7
      #|0..0..0..0..8..17..30..60..solved at 79
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..2..4..6..8..solved at 15
      #|0..0..1..2..4..10..solved at 20
      #|0..0..1..3..5..12..27..44..74..solved at 123
      #|0..0..2..5..10..solved at 15
      #|0..0..2..5..10..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..0..1..solved at 6
      #|0..0..2..4..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..7..16..27..49..86..134..209..312..solved at 361
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..29..44..68..124..210..solved at 225
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..2..4..6..15..29..solved at 48
      #|0..0..solved at 2
      #|0..0..1..2..3..8..17..solved at 30
      #|0..0..1..2..3..8..16..solved at 25
      #|0..0..1..2..3..8..16..27..50..85..solved at 109
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..5..13..solved at 23
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..2..5..8..16..26..40..64..96..130..solved at 161
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..10..solved at 20
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 10
      #|0..0..0..0..2..solved at 7
      #|0..0..1..4..9..19..37..66..108..162..238..395..641..986..solved at 1180
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..6..13..solved at 23
      #|0..0..5..11..27..62..114..solved at 129
      #|0..0..5..13..solved at 23
      #|0..0..4..10..20..44..solved at 67
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..19..28..37..46..102..164..289..solved at 407
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..15..28..solved at 48
      #|0..0..2..solved at 5
      #|0..0..2..5..10..19..37..solved at 66
      #|0..0..2..4..9..20..38..69..118..solved at 130
      #|0..0..2..5..11..22..40..solved at 55
      #|0..0..2..5..12..solved at 19
      #|0..0..1..6..13..26..solved at 35
      #|0..0..1..solved at 4
      #|0..0..3..10..23..44..solved at 56
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..10..23..44..100..solved at 112
      #|0..0..3..7..solved at 11
      #|0..0..5..14..29..58..125..solved at 137
      #|0..0..5..11..solved at 15
      #|0..0..solved at 2
      #|0..0..4..solved at 9
      #|0..0..3..solved at 6
      #|0..0..2..4..6..8..solved at 14
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..6..8..solved at 14
      #|0..0..1..2..3..4..solved at 10
      #|0..0..3..6..14..29..49..77..121..167..290..solved at 312
      #|0..0..3..6..13..25..42..61..solved at 77
      #|0..0..5..14..29..58..125..solved at 137
      #|0..0..5..11..solved at 15
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..3..10..23..44..101..solved at 113
      #|0..0..3..10..23..44..101..solved at 113
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..7..16..31..54..97..193..solved at 291
      #|0..0..3..7..16..31..54..97..solved at 136
      #|0..0..3..7..16..33..61..102..182..309..solved at 387
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..solved at 6
      #|0..0..2..4..11..solved at 24
      #|0..0..2..4..9..22..42..77..solved at 98
      #|0..0..1..solved at 4
      #|0..0..1..2..3..6..9..12..19..26..33..40..47..54..76..98..120..solved at 136
      #|0..0..0..0..0..3..6..9..14..19..24..29..34..39..solved at 83
      #|0..0..0..0..0..4..8..12..24..36..48..60..72..84..146..208..270..solved at 288
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..95..127..159..solved at 174
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..95..127..159..solved at 188
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..100..137..174..solved at 225
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..100..137..174..solved at 189
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..95..127..159..solved at 174
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..95..127..159..solved at 188
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..100..137..174..solved at 225
      #|0..0..0..0..0..3..6..9..18..27..36..45..54..63..100..137..174..solved at 189
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..0..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..2..solved at 10
      #|0..0..2..solved at 7
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..2..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..solved at 9
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..6..12..26..solved at 57
      #|0..0..0..6..12..26..solved at 50
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 10
      #|0..0..2..4..9..solved at 16
      #|0..0..2..4..9..22..solved at 32
      #|0..0..2..4..9..22..solved at 32
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..6..solved at 15
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 9
      #|0..0..1..2..11..21..37..62..95..137..199..269..solved at 318
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..6..12..solved at 19
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..6..12..solved at 19
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..5..11..22..54..106..206..398..774..1362..2463..4120..solved at 6806
      #|0..0..2..5..9..solved at 15
      #|0..0..2..8..22..47..95..203..406..770..1440..solved at 1489
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 9
      #|0..0..0..2..7..15..31..68..123..213..solved at 256
      #|0..0..0..0..3..16..31..86..172..296..543..887..1338..2177..3297..4751..solved at 6253
      #|0..0..solved at 2
      #|0..0..1..7..23..70..190..444..1146..solved at 1667
      #|0..0..1..solved at 5
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 6
      #|0..0..0..solved at 7
      #|0..0..0..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 6
      #|0..0..0..solved at 8
      #|0..0..0..solved at 9
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 9
      #|0..0..1..solved at 8
      #|0..0..1..solved at 8
      #|0..0..1..solved at 10
      #|0..0..1..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 10
      #|0..0..0..2..8..14..30..49..solved at 60
      #|0..0..0..2..solved at 6
      #|0..0..0..1..8..solved at 13
      #|0..0..0..1..9..26..49..solved at 79
      #|0..0..2..solved at 5
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|0..0..1..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..2..solved at 7
      #|0..0..2..6..11..24..49..solved at 76
      #|0..0..1..6..14..30..58..107..204..335..582..932..1417..2103..3081..4275..6066..solved at 7183
      #|0..0..0..solved at 3
      #|0..0..3..6..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..0..solved at 3
      #|0..0..0..2..8..17..32..solved at 54
      #|0..0..0..solved at 3
      #|0..0..0..2..8..17..32..solved at 54
      #|Warning: inventing type variables
      #|0..0..3..7..solved at 17
      #|0..0..3..7..solved at 18
      #|0..0..4..10..solved at 27
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..6..16..42..solved at 81
      #|0..0..5..10..26..66..128..378..963..solved at 2355
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 7
      #|0..0..2..4..15..29..54..84..122..164..251..0..0..5..12..27..49..82..127..178..245..solved at 266
      #|0..0..5..12..27..49..82..127..178..245..solved at 254
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..solved at 23
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..2..4..7..13..20..46..solved at 92
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
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
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 9
      #|0..0..4..10..23..50..86..solved at 94
      #|0..0..1..solved at 7
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 7
      #|0..0..0..0..solved at 4
      #|0..0..2..4..10..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..12..19..solved at 27
      #|0..0..1..2..5..12..19..solved at 27
      #|0..0..2..5..11..24..63..108..233..388..740..1186..2531..solved at 3905
      #|0..0..2..4..10..22..41..67..103..147..solved at 179
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..6..11..22..solved at 36
      #|0..0..solved at 2
      #|0..0..1..3..7..17..solved at 29
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..10..22..41..67..103..147..solved at 179
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 5
      #|0..0..2..4..6..14..25..39..59..86..116..solved at 136
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..2..4..10..21..solved at 33
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..21..42..solved at 49
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 19
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..9..19..54..106..solved at 182
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..7..17..27..solved at 40
      #|0..0..2..4..25..54..101..solved at 185
      #|0..0..1..2..solved at 9
      #|0..0..1..3..solved at 9
      #|0..0..1..2..solved at 10
      #|0..0..1..3..solved at 10
      #|0..0..1..2..6..solved at 17
      #|0..0..1..5..11..23..61..110..193..311..469..676..1100..solved at 1147
      #|0..0..2..7..17..46..107..236..solved at 254
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..solved at 31
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..6..18..61..129..390..828..solved at 953
      #|0..0..1..4..9..22..42..90..165..solved at 213
      #|0..0..4..solved at 7
      #|0..0..4..9..solved at 14
      #|0..0..4..8..20..40..74..122..190..267..423..622..891..solved at 1601
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..13..18..27..36..45..66..87..108..solved at 199
      #|0..0..1..2..6..13..29..65..solved at 104
      #|0..0..1..2..6..13..29..77..solved at 152
      #|0..0..1..2..7..17..35..57..80..103..136..172..278..409..544..solved at 558
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..9..14..22..32..solved at 46
      #|0..0..1..solved at 4
      #|0..0..1..4..7..10..14..20..26..42..58..74..98..122..146..solved at 168
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..2..4..8..15..35..63..95..165..250..solved at 275
      #|0..0..4..9..26..51..84..137..solved at 156
      #|0..0..3..6..solved at 17
      #|0..0..4..8..16..31..53..82..solved at 105
      #|0..0..4..9..solved at 13
      #|0..0..6..12..47..126..390..solved at 616
      #|0..0..4..8..19..solved at 24
      #|0..0..4..8..solved at 12
      #|0..0..3..6..13..24..40..65..100..143..202..267..355..458..601..solved at 734
      #|0..0..3..solved at 8
      #|0..0..3..7..11..15..20..27..34..solved at 45
      #|0..0..2..4..6..solved at 22
      #|0..0..6..13..solved at 17
      #|0..0..6..13..solved at 17
      #|0..0..7..14..30..solved at 39
      #|0..0..7..14..30..solved at 39
      #|0..0..2..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..7..19..48..solved at 80
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 13
      #|0..0..4..16..45..113..309..solved at 427
      #|0..0..5..10..solved at 14
      #|0..0..5..10..solved at 14
      #|0..0..6..18..77..solved at 313
      #|0..0..5..10..solved at 14
      #|0..0..solved at 2
      #|0..0..6..12..solved at 16
      #|0..0..6..18..75..solved at 315
      #|0..0..6..13..solved at 17
      #|0..0..7..15..solved at 19
      #|0..0..6..19..83..solved at 292
      #|0..0..7..21..87..solved at 344
      #|0..0..6..13..solved at 17
      #|0..0..7..15..solved at 19
      #|0..0..5..11..20..46..90..155..solved at 172
      #|0..0..7..21..84..solved at 344
      #|0..0..4..10..18..36..67..115..solved at 146
      #|0..0..4..solved at 12
      #|0..0..4..solved at 11
      #|0..0..3..7..11..solved at 16
      #|0..0..0..2..solved at 7
      #|0..0..0..2..solved at 8
      #|0..0..1..solved at 5
      #|0..0..1..5..solved at 12
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..0..solved at 7
      #|0..0..1..2..5..10..21..solved at 36
      #|0..0..1..3..11..solved at 22
      #|0..0..0..solved at 3
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..4..9..22..solved at 32
      #|0..0..4..9..22..solved at 31
      #|0..0..0..1..3..8..solved at 15
      #|0..0..0..1..solved at 5
      #|0..0..0..0..2..4..6..10..14..18..26..34..42..solved at 52
      #|0..0..0..0..1..2..3..7..11..15..21..27..33..solved at 45
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..4..10..25..73..228..777..2950..solved at 4656
      #|0..0..1..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 11
      #|0..0..3..solved at 12
      #|0..0..1..3..6..9..solved at 15
      #|0..0..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..7..12..solved at 19
      #|0..0..0..0..3..7..12..22..solved at 30
      #|0..0..1..5..solved at 13
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..3..8..24..solved at 36
      #|0..0..3..8..24..52..solved at 69
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..solved at 15
      #|0..0..0..1..solved at 5
      #|0..0..2..5..9..21..42..72..solved at 87
      #|0..0..2..5..10..25..50..solved at 63
      #|0..0..2..5..10..25..49..solved at 63
      #|0..0..2..6..13..28..55..94..solved at 108
      #|0..0..1..3..7..18..32..53..90..137..196..314..solved at 382
      #|0..0..1..3..6..15..27..43..69..104..146..240..350..489..solved at 595
      #|0..0..4..9..20..43..77..123..206..319..solved at 364
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..4..10..23..48..90..149..253..397..587..908..solved at 1060
      #|0..0..4..10..22..45..85..142..238..362..522..833..solved at 1052
      #|0..0..4..11..25..50..94..157..261..401..579..870..1297..1823..solved at 2169
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..4..solved at 7
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..3..7..12..22..37..solved at 47
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..4..solved at 9
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..2..7..13..25..41..61..87..129..176..241..solved at 342
      #|0..0..solved at 2
      #|0..0..1..2..4..9..15..solved at 22
      #|0..0..1..3..9..solved at 14
      #|0..0..0..solved at 3
      #|0..0..0..2..4..6..solved at 16
      #|0..0..0..2..4..6..solved at 11
      #|0..0..0..1..2..3..8..13..18..26..34..43..53..63..74..85..96..solved at 110
      #|0..0..0..1..2..3..solved at 10
      #|0..0..0..1..2..3..solved at 10
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..12..17..27..38..51..77..103..132..199..solved at 240
      #|0..0..3..6..16..31..61..104..solved at 131
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..2..4..10..solved at 23
      #|0..0..3..6..15..solved at 21
      #|0..0..3..6..solved at 11
      #|0..0..2..4..10..20..37..solved at 59
      #|0..0..0..0..1..4..7..24..51..84..136..208..291..430..631..solved at 702
      #|0..0..3..7..18..34..solved at 41
      #|0..0..3..7..17..34..56..solved at 63
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..0..1..2..3..6..12..solved at 22
      #|0..0..0..0..1..2..3..6..11..19..solved at 31
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..solved at 32
      #|0..0..0..1..3..7..solved at 14
      #|0..0..4..9..23..43..76..116..solved at 127
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..4..9..23..solved at 31
      #|0..0..4..9..23..solved at 31
      #|0..0..4..9..22..43..71..solved at 81
      #|0..0..4..9..22..43..71..solved at 78
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..4..9..23..solved at 31
      #|0..0..4..9..23..solved at 31
      #|0..0..4..9..22..43..71..solved at 78
      #|0..0..4..9..22..43..71..solved at 81
      #|0..0..3..6..16..31..solved at 55
      #|0..0..4..8..20..solved at 26
      #|0..0..4..8..23..42..solved at 51
      #|0..0..4..9..22..43..71..solved at 81
      #|0..0..4..solved at 7
      #|0..0..0..0..0..2..solved at 9
      #|0..0..4..9..22..43..71..solved at 78
      #|0..0..3..8..20..39..68..108..153..218..311..solved at 400
      #|0..0..3..7..18..36..61..95..131..175..242..solved at 324
      #|0..0..5..11..23..solved at 29
      #|0..0..4..11..24..solved at 29
      #|0..0..4..12..29..61..solved at 69
      #|0..0..3..9..27..solved at 62
      #|0..0..4..solved at 11
      #|0..0..4..8..18..34..59..92..140..196..272..solved at 307
      #|0..0..5..11..27..53..solved at 60
      #|0..0..5..11..27..53..96..164..solved at 175
      #|0..0..4..11..28..58..solved at 82
      #|0..0..3..9..27..solved at 62
      #|0..0..4..8..18..34..60..96..146..solved at 159
      #|0..0..4..9..20..solved at 25
      #|0..0..4..10..24..49..92..156..solved at 189
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..7..13..27..solved at 34
      #|0..0..2..4..11..20..33..51..69..87..119..151..191..256..321..394..497..600..711..875..1039..1223..solved at 1386
      #|0..0..0..0..3..solved at 8
      #|0..0..0..0..0..0..1..5..9..18..27..36..50..64..78..110..142..174..solved at 210
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..0..solved at 4
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..5..11..22..solved at 36
      #|0..0..1..solved at 6
      #|0..0..1..5..11..22..solved at 34
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..3..6..9..solved at 16
      #|0..0..0..3..6..9..solved at 14
      #|Warning: inventing type variables
      #|0..0..0..0..0..4..12..solved at 28
      #|0..0..0..1..2..3..4..5..6..solved at 31
      #|0..0..1..2..6..10..14..23..32..41..62..83..108..solved at 125
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..10..21..35..75..142..221..363..538..759..1080..solved at 1316
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..15..solved at 24
      #|0..0..2..6..18..41..88..solved at 96
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..3..7..11..17..29..41..61..solved at 74
      #|0..0..1..3..5..9..15..21..31..41..51..61..71..81..128..solved at 149
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4066
      #|0..0..2..6..14..35..64..100..170..242..322..418..538..695..1142..1656..2222..3226..4286..5444..solved at 7016
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..14..36..68..108..184..265..354..461..598..776..1258..1815..2428..3503..4649..5903..solved at 7133
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..14..36..68..108..184..265..354..461..598..776..1258..1815..2428..3503..4649..5903..solved at 7133
      #|0..0..2..6..14..35..64..102..174..252..340..444..576..749..1212..1750..2351..3390..4507..5744..solved at 7411
      #|0..0..2..6..14..35..64..102..174..252..340..444..576..749..1212..1750..2351..3390..4507..5744..solved at 7411
      #|0..0..3..10..solved at 21
      #|0..0..4..16..solved at 20
      #|0..0..4..12..solved at 24
      #|0..0..3..10..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..8..solved at 17
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..3..10..solved at 22
      #|0..0..4..16..solved at 20
      #|0..0..4..12..solved at 25
      #|0..0..3..10..solved at 22
      #|0..0..1..2..solved at 6
      #|0..0..2..8..solved at 17
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..2..8..solved at 18
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..solved at 3
      #|0..0..3..10..solved at 17
      #|0..0..4..16..solved at 20
      #|0..0..4..16..solved at 23
      #|0..0..4..12..solved at 16
      #|0..0..4..12..solved at 19
      #|0..0..3..10..solved at 14
      #|0..0..3..10..solved at 17
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..6..13..24..45..81..151..238..353..solved at 450
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..23..35..53..73..113..157..217..300..solved at 388
      #|0..0..1..2..7..13..25..49..79..129..239..393..646..solved at 1229
      #|0..0..2..solved at 6
      #|0..0..3..8..19..44..79..126..207..296..399..518..669..872..1365..1944..2594..3682..4856..6178..solved at 7845
      #|0..0..3..8..19..44..79..124..203..286..381..492..631..818..1295..1850..2465..3518..4639..5894..solved at 8024
      #|0..0..4..10..22..51..91..141..227..317..419..543..695..895..1399..1981..2623..3720..4881..6168..solved at 7740
      #|0..0..4..10..22..51..91..143..231..327..437..569..733..949..1469..2075..2752..3884..5102..6468..solved at 8135
      #|0..0..0..solved at 3
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4431
      #|0..0..1..2..7..12..17..34..51..68..85..102..119..204..289..374..solved at 562
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4431
      #|0..0..1..3..5..12..22..37..67..105..solved at 144
      #|0..0..1..2..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..0..1..4..10..solved at 17
      #|0..0..0..1..3..7..13..22..solved at 34
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..5..13..26..45..70..100..solved at 129
      #|0..0..2..5..14..29..52..solved at 75
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..5..11..28..solved at 36
      #|0..0..5..12..31..59..103..solved at 128
      #|0..0..5..11..27..53..88..solved at 100
      #|0..0..5..11..27..53..88..139..solved at 174
      #|0..0..5..11..27..solved at 33
      #|0..0..4..8..solved at 24
      #|0..0..4..solved at 11
      #|0..0..5..11..27..53..88..139..solved at 174
      #|0..0..4..8..solved at 24
      #|0..0..5..10..solved at 14
      #|0..0..5..11..27..solved at 32
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..5..12..30..59..111..solved at 141
      #|0..0..5..11..26..solved at 32
      #|0..0..5..11..25..solved at 31
      #|0..0..5..11..25..50..88..138..solved at 172
      #|0..0..0..solved at 3
      #|0..0..0..2..5..11..24..solved at 39
      #|0..0..6..13..28..solved at 38
      #|0..0..6..13..28..57..solved at 72
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..10..22..solved at 30
      #|0..0..4..8..solved at 24
      #|0..0..5..10..24..46..81..124..186..252..solved at 268
      #|0..0..5..10..24..47..84..129..solved at 139
      #|0..0..solved at 2
      #|0..0..1..2..5..11..solved at 17
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..10..22..solved at 30
      #|0..0..4..8..solved at 24
      #|0..0..0..1..4..solved at 9
      #|0..0..0..1..3..9..17..solved at 25
      #|0..0..5..14..34..71..154..296..solved at 339
      #|0..0..5..11..25..solved at 30
      #|0..0..4..solved at 11
      #|0..0..5..11..25..solved at 30
      #|0..0..0..2..5..8..12..17..22..28..34..40..51..62..73..solved at 98
      #|0..0..2..5..9..solved at 18
      #|0..0..2..6..11..22..38..56..86..solved at 135
      #|0..0..0..1..3..6..15..24..39..55..73..93..113..135..161..187..213..239..265..310..355..403..558..719..894..1075..1260..1455..1715..1983..solved at 2047
      #|0..0..0..1..3..7..17..27..42..58..76..96..116..138..164..190..216..242..268..313..358..406..561..724..904..1088..1274..1471..1728..1993..solved at 2083
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..6..11..20..29..38..77..116..155..194..233..272..351..430..509..670..831..992..solved at 1364
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..2..7..26..solved at 46
      #|0..0..2..7..26..solved at 41
      #|0..0..4..13..40..solved at 74
      #|0..0..4..13..40..solved at 68
      #|0..0..4..14..43..115..303..solved at 515
      #|0..0..4..14..43..109..277..solved at 423
      #|0..0..4..9..19..46..85..solved at 132
      #|0..0..4..9..19..43..78..solved at 110
      #|0..0..4..9..19..46..85..156..solved at 266
      #|0..0..4..9..19..43..78..134..solved at 213
      #|0..0..5..12..29..solved at 45
      #|0..0..5..12..29..solved at 45
      #|0..0..4..10..22..45..85..142..223..solved at 296
      #|0..0..4..10..22..45..84..138..217..solved at 286
      #|0..0..4..10..23..48..92..solved at 136
      #|0..0..4..10..23..48..91..solved at 132
      #|0..0..5..12..31..76..161..307..566..954..1650..2925..solved at 4249
      #|0..0..5..12..31..73..154..283..510..828..1335..2188..solved at 2502
      #|0..0..4..9..20..42..82..solved at 101
      #|0..0..4..9..20..42..81..solved at 97
      #|0..0..5..14..solved at 21
      #|0..0..5..14..solved at 21
      #|0..0..5..16..solved at 23
      #|0..0..5..16..48..solved at 82
      #|0..0..5..17..solved at 24
      #|0..0..5..17..51..140..367..solved at 579
      #|0..0..5..11..23..55..102..solved at 134
      #|0..0..5..11..23..58..109..solved at 156
      #|0..0..5..11..23..55..101..184..solved at 263
      #|0..0..5..11..23..58..108..206..solved at 316
      #|0..0..5..12..27..solved at 44
      #|0..0..5..12..27..solved at 44
      #|0..0..4..10..21..43..76..121..183..solved at 248
      #|0..0..4..10..21..43..77..125..193..solved at 266
      #|0..0..4..10..22..46..83..solved at 124
      #|0..0..4..10..22..46..84..solved at 128
      #|0..0..1..2..6..12..23..39..59..91..141..212..326..solved at 440
      #|0..0..5..12..solved at 19
      #|0..0..5..12..solved at 19
      #|0..0..5..12..30..65..118..solved at 163
      #|0..0..5..12..30..68..125..solved at 187
      #|0..0..4..9..19..39..71..solved at 87
      #|0..0..4..9..19..39..72..solved at 91
      #|0..0..1..2..4..6..8..11..14..17..22..27..32..38..44..50..57..64..71..solved at 117
      #|0..0..2..4..7..13..19..42..70..104..159..215..281..384..537..703..931..1189..1471..1795..2175..solved at 2338
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..8..solved at 12
      #|0..0..solved at 3
      #|0..0..2..4..solved at 8
      #|0..0..3..6..17..41..solved at 50
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..3..7..solved at 17
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..13..18..27..36..45..62..79..96..1816..solved at 2999
      #|0..0..1..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..3..7..11..solved at 20
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..3..7..15..24..38..57..88..124..188..273..383..529..690..882..1106..1375..1676..2038..2456..2905..3437..4022..4650..5348..solved at 5961
      #|0..0..1..2..5..12..24..solved at 38
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..8..17..50..105..200..483..987..1855..3407..6001..10238..solved at 13728
      #|0..0..1..solved at 4
      #|0..0..1..5..10..solved at 16
      #|0..0..2..4..7..12..solved at 19
      #|0..0..solved at 3
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..3..4..9..20..solved at 34
      #|0..0..1..2..3..4..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..5..11..35..83..180..371..solved at 413
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..9..21..52..110..228..419..solved at 491
      #|0..0..3..7..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..4..9..21..52..109..231..431..736..1314..2262..3824..6878..12246..21630..39569..71461..127359..solved at 134414
      #|0..0..solved at 2
      #|0..0..3..7..solved at 19
      #|0..0..0..1..2..3..solved at 10
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..3..6..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..2..3..11..solved at 17
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..8..20..solved at 42
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..3..8..21..solved at 44
      #|0..0..2..solved at 6
      #|0..0..1..6..16..solved at 38
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 12
      #|0..0..1..2..5..11..19..28..40..64..solved at 79
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 8
      #|0..0..1..2..6..11..19..solved at 27
      #|0..0..1..2..4..9..18..solved at 27
      #|0..0..1..4..9..22..solved at 33
      #|0..0..1..2..solved at 7
      #|0..0..1..4..solved at 10
      #|0..0..1..2..6..14..solved at 21
      #|0..0..2..5..15..35..solved at 48
      #|0..0..2..4..10..32..71..solved at 81
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..2..6..14..solved at 23
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..2..4..11..23..solved at 32
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..3..8..23..46..solved at 65
      #|0..0..3..6..solved at 10
      #|0..0..3..6..16..32..solved at 39
      #|0..0..4..8..20..50..100..246..552..1317..3714..solved at 3754
      #|0..0..4..8..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 12
      #|0..0..2..4..solved at 10
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..7..14..31..solved at 40
      #|0..0..7..15..33..solved at 46
      #|0..0..6..12..28..solved at 37
      #|0..0..6..13..30..solved at 43
      #|0..0..6..12..solved at 20
      #|0..0..6..13..solved at 22
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..6..12..26..solved at 40
      #|0..0..6..13..28..solved at 46
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..5..10..solved at 25
      #|0..0..5..11..solved at 27
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..4..8..21..solved at 31
      #|0..0..4..9..23..solved at 37
      #|0..0..4..solved at 7
      #|0..0..1..solved at 4
      #|0..0..4..8..solved at 14
      #|0..0..4..9..23..solved at 30
      #|0..0..4..solved at 7
      #|0..0..7..14..36..solved at 51
      #|0..0..7..15..38..solved at 56
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..6..12..34..solved at 51
      #|0..0..6..13..36..solved at 56
      #|0..0..6..12..solved at 19
      #|0..0..6..13..solved at 21
      #|0..0..6..12..solved at 24
      #|0..0..6..13..solved at 26
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..6..13..33..solved at 58
      #|0..0..6..14..35..solved at 63
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..5..10..solved at 30
      #|0..0..5..11..solved at 32
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..8..solved at 16
      #|0..0..4..9..solved at 18
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 6
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..5..9..13..24..39..59..solved at 79
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..3..6..13..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..6..13..23..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..solved at 8
      #|0..0..2..6..solved at 10
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..0..1..2..3..solved at 8
      #|0..0..4..9..17..38..89..191..432..solved at 484
      #|0..0..2..6..solved at 10
      #|0..0..solved at 2
      #|0..0..4..10..solved at 19
      #|0..0..4..10..solved at 19
      #|0..0..4..10..solved at 18
      #|0..0..2..7..solved at 12
      #|0..0..2..6..solved at 12
      #|0..0..2..6..solved at 12
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..4..8..23..41..solved at 51
      #|0..0..2..4..8..23..41..solved at 51
      #|0..0..0..solved at 5
      #|0..0..1..4..7..13..20..27..45..solved at 68
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..3..7..18..32..solved at 45
      #|0..0..1..3..7..18..32..solved at 45
      #|0..0..1..3..7..18..32..solved at 45
      #|0..0..1..3..7..18..32..solved at 45
      #|0..0..1..3..6..15..27..43..75..solved at 109
      #|0..0..1..3..6..15..27..43..75..solved at 109
      #|0..0..1..3..6..15..27..43..75..solved at 109
      #|0..0..1..3..6..15..27..43..75..solved at 109
      #|0..0..4..9..22..solved at 33
      #|0..0..4..9..22..solved at 33
      #|0..0..4..9..22..solved at 33
      #|0..0..4..9..22..solved at 33
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..4..10..25..54..100..solved at 143
      #|0..0..4..10..25..54..100..solved at 143
      #|0..0..4..10..25..54..100..solved at 143
      #|0..0..4..10..25..54..100..solved at 143
      #|0..0..4..10..22..49..99..solved at 137
      #|0..0..4..10..22..49..99..solved at 137
      #|0..0..4..10..22..49..99..solved at 137
      #|0..0..4..10..22..49..99..solved at 137
      #|0..0..4..11..25..54..110..196..368..solved at 513
      #|0..0..4..11..25..54..110..196..368..solved at 513
      #|0..0..4..11..25..54..110..196..368..solved at 513
      #|0..0..4..11..25..54..110..196..368..solved at 513
      #|0..0..1..6..16..solved at 38
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..5..11..35..83..180..371..solved at 413
      #|0..0..1..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..9..21..52..110..228..419..solved at 491
      #|0..0..3..7..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..4..9..21..52..109..231..431..736..1314..2262..3824..6878..12246..21630..39569..71461..127359..solved at 134414
      #|0..0..solved at 2
      #|0..0..3..7..solved at 19
      #|0..0..0..1..2..3..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..3..5..7..solved at 14
      #|0..0..1..solved at 4
      #|0..0..1..3..5..7..solved at 14
      #|0..0..1..3..7..11..15..29..45..solved at 56
      #|0..0..3..10..40..101..238..solved at 263
      #|0..0..3..10..40..101..242..520..solved at 572
      #|0..0..3..10..40..101..242..520..solved at 572
      #|0..0..3..7..solved at 13
      #|0..0..3..7..solved at 12
      #|0..0..2..6..17..30..54..89..131..solved at 167
      #|0..0..4..9..23..48..78..solved at 86
      #|0..0..3..7..solved at 19
      #|0..0..3..9..25..solved at 42
      #|0..0..3..9..24..41..64..solved at 101
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..14..solved at 28
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 7
      #|0..0..solved at 7
      #|0..0..solved at 7
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 7
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
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
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..13..30..53..88..156..252..397..solved at 638
      #|0..0..6..13..30..53..87..154..248..391..solved at 630
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..11..28..48..76..139..solved at 159
      #|0..0..5..11..28..48..76..139..solved at 159
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..11..solved at 27
      #|0..0..solved at 2
      #|0..0..5..11..solved at 27
      #|0..0..solved at 2
      #|0..0..5..11..solved at 27
      #|0..0..solved at 2
      #|0..0..5..11..solved at 27
      #|0..0..4..11..34..63..116..195..297..443..651..888..1207..1649..2163..solved at 2767
      #|0..0..6..13..35..72..133..223..349..523..783..solved at 840
      #|0..0..6..13..35..73..138..238..381..578..875..solved at 959
      #|0..0..5..11..solved at 33
      #|0..0..5..11..solved at 33
      #|0..0..5..14..39..solved at 68
      #|0..0..5..15..42..solved at 72
      #|0..0..5..14..38..68..116..solved at 192
      #|0..0..5..15..41..73..124..solved at 207
      #|0..0..6..15..39..79..143..236..372..565..812..solved at 902
      #|0..0..6..16..43..86..154..254..409..637..928..solved at 1018
      #|0..0..6..15..39..79..144..240..381..581..836..solved at 936
      #|0..0..6..16..43..86..155..258..418..653..952..solved at 1052
      #|0..0..4..8..solved at 12
      #|0..0..4..8..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..9..20..solved at 46
      #|0..0..solved at 2
      #|0..0..9..20..solved at 46
      #|0..0..solved at 2
      #|0..0..9..20..solved at 46
      #|0..0..8..18..solved at 43
      #|0..0..8..18..solved at 43
      #|0..0..6..13..32..53..78..121..171..246..solved at 306
      #|0..0..6..13..32..53..78..121..171..246..solved at 306
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..6..13..41..81..156..270..429..661..solved at 953
      #|0..0..6..13..41..82..162..284..458..717..solved at 1025
      #|0..0..6..16..43..77..125..198..300..467..721..solved at 848
      #|0..0..6..17..46..82..134..218..345..561..892..solved at 1047
      #|0..0..6..16..42..72..111..164..229..325..507..745..1063..1511..solved at 1917
      #|0..0..6..17..45..77..119..178..256..376..602..912..1324..1924..solved at 2500
      #|0..0..8..17..40..73..solved at 81
      #|0..0..8..17..40..74..solved at 85
      #|0..0..8..17..40..73..solved at 81
      #|0..0..8..17..40..74..solved at 85
      #|0..0..solved at 2
      #|0..0..7..15..44..88..solved at 119
      #|0..0..solved at 2
      #|0..0..7..15..44..89..solved at 120
      #|0..0..solved at 2
      #|0..0..7..15..44..88..solved at 120
      #|0..0..6..13..41..81..solved at 103
      #|0..0..6..13..41..82..solved at 104
      #|0..0..8..17..41..75..128..208..solved at 219
      #|0..0..8..17..41..76..134..226..solved at 240
      #|0..0..8..17..41..75..129..212..solved at 223
      #|0..0..8..17..41..76..135..230..solved at 244
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..7..15..39..70..116..180..279..424..solved at 508
      #|0..0..7..15..39..71..121..195..311..479..solved at 592
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..13..41..81..156..270..434..684..1145..1711..solved at 2348
      #|0..0..6..13..41..82..162..284..463..740..1249..1877..solved at 2556
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..17..42..77..132..213..343..527..solved at 611
      #|0..0..8..17..42..78..137..228..375..582..solved at 695
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|0..0..8..17..41..75..128..208..solved at 219
      #|0..0..8..17..41..76..134..226..solved at 240
      #|0..0..8..17..41..75..129..212..solved at 223
      #|0..0..8..17..41..76..135..230..solved at 244
      #|0..0..8..18..solved at 43
      #|0..0..8..18..solved at 43
      #|0..0..8..18..solved at 43
      #|0..0..8..18..solved at 43
      #|0..0..8..17..42..77..132..213..343..527..solved at 612
      #|0..0..8..17..42..78..137..228..375..582..solved at 696
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|0..0..8..18..solved at 43
      #|0..0..8..18..solved at 43
      #|0..0..6..16..52..105..203..361..594..959..1582..2404..solved at 3011
      #|0..0..6..17..55..111..218..395..668..1109..1856..2860..solved at 3509
      #|0..0..6..16..48..96..169..281..439..700..1143..1778..2631..solved at 3073
      #|0..0..6..17..51..102..184..317..517..857..1430..2272..3407..solved at 3956
      #|0..0..6..16..47..91..155..247..368..557..930..1437..2128..3123..4395..6037..solved at 8130
      #|0..0..6..17..50..97..169..277..428..671..1142..1805..2723..4087..5889..8266..solved at 11415
      #|0..0..3..11..42..107..249..solved at 274
      #|0..0..3..11..42..107..253..542..solved at 594
      #|0..0..3..11..42..107..253..542..solved at 594
      #|0..0..3..8..solved at 13
      #|0..0..0..solved at 3
      #|0..0..0..4..solved at 10
      #|0..0..4..14..29..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..1..3..10..20..31..solved at 38
      #|0..0..solved at 2
      #|0..0..2..7..14..28..45..76..solved at 88
      #|0..0..2..7..14..28..45..76..solved at 87
      #|0..0..solved at 2
      #|0..0..2..7..15..34..56..101..solved at 113
      #|0..0..2..7..15..34..56..101..solved at 112
      #|0..0..solved at 2
      #|0..0..2..7..15..34..56..101..solved at 113
      #|0..0..2..7..15..34..56..101..solved at 112
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..14..25..39..62..85..141..198..solved at 251
      #|0..0..2..7..15..31..50..87..124..214..305..solved at 497
      #|0..0..2..7..15..31..50..87..124..214..305..solved at 497
      #|0..0..2..7..14..25..39..62..85..141..198..solved at 246
      #|0..0..2..7..15..31..50..87..124..214..305..solved at 354
      #|0..0..2..7..15..31..50..87..124..214..305..solved at 491
      #|0..0..6..13..solved at 17
      #|0..0..6..13..solved at 17
      #|0..0..6..13..solved at 17
      #|0..0..6..13..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..13..solved at 20
      #|0..0..6..13..solved at 20
      #|0..0..6..13..solved at 20
      #|0..0..6..13..solved at 20
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..5..11..solved at 15
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..9..21..solved at 30
      #|0..0..4..9..21..solved at 30
      #|0..0..4..9..21..solved at 30
      #|0..0..4..9..21..solved at 30
      #|0..0..3..9..17..25..34..43..52..solved at 70
      #|0..0..4..9..24..44..73..113..164..225..solved at 253
      #|0..0..3..7..24..53..100..185..305..472..781..solved at 1137
      #|0..0..3..9..33..65..135..239..395..685..1123..1842..3149..solved at 4490
      #|0..0..3..9..33..65..135..239..395..683..1115..1824..3117..solved at 3788
      #|0..0..3..9..24..45..solved at 65
      #|0..0..3..9..21..41..63..solved at 86
      #|0..0..3..9..21..41..63..solved at 81
      #|0..0..3..7..18..31..solved at 49
      #|0..0..1..5..11..21..31..43..63..105..147..solved at 158
      #|0..0..2..6..10..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..8..13..18..solved at 28
      #|0..0..4..13..30..69..147..solved at 207
      #|0..0..4..10..22..42..66..100..solved at 110
      #|0..0..4..10..20..38..60..86..122..164..223..solved at 248
      #|0..0..4..10..solved at 18
      #|0..0..3..9..17..solved at 25
      #|0..0..2..5..solved at 11
      #|0..0..2..5..10..solved at 17
      #|0..0..2..6..14..40..solved at 53
      #|0..0..2..6..14..32..67..solved at 77
      #|0..0..2..6..16..40..94..197..solved at 212
      #|0..0..2..4..6..16..28..40..solved at 67
      #|0..0..2..4..6..10..14..solved at 24
      #|0..0..2..4..6..10..14..26..solved at 40
      #|0..0..0..4..11..solved at 20
      #|0..0..0..1..3..5..7..9..11..17..23..29..40..51..62..73..84..95..solved at 115
      #|0..0..2..4..solved at 11
      #|0..0..2..solved at 8
      #|0..0..4..12..37..91..210..482..solved at 1028
      #|0..0..4..12..37..90..203..453..1021..solved at 2137
      #|0..0..1..2..4..11..19..29..47..67..solved at 77
      #|0..0..1..2..3..7..14..22..30..44..60..90..125..167..227..312..404..533..802..1119..solved at 1256
      #|0..0..2..5..solved at 9
      #|0..0..3..8..20..solved at 32
      #|0..0..0..0..0..3..solved at 9
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..3..8..solved at 12
      #|0..0..2..4..10..21..36..59..solved at 96
      #|0..0..1..2..3..4..9..solved at 19
      #|0..0..3..8..17..34..71..117..179..289..424..629..938..solved at 1207
      #|0..0..4..9..17..38..72..120..solved at 140
      #|0..0..4..9..17..38..72..120..solved at 140
      #|0..0..4..9..19..43..82..solved at 100
      #|0..0..4..solved at 7
      #|0..0..4..9..19..43..81..solved at 100
      #|0..0..4..9..19..43..81..solved at 100
      #|0..0..4..10..22..47..88..150..solved at 169
      #|0..0..4..10..solved at 14
      #|0..0..3..7..15..34..60..97..169..258..370..577..solved at 744
      #|0..0..3..7..15..34..60..97..solved at 152
      #|0..0..3..7..14..31..55..87..148..224..317..497..703..962..solved at 1223
      #|0..0..3..7..14..31..55..87..146..220..solved at 298
      #|0..0..6..13..28..60..107..171..302..475..solved at 537
      #|0..0..6..13..28..60..107..171..300..476..solved at 555
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..6..14..31..65..121..198..351..564..840..1300..solved at 1501
      #|0..0..6..14..31..65..121..198..solved at 247
      #|0..0..6..14..30..61..113..187..327..504..733..1165..solved at 1415
      #|0..0..6..14..30..61..113..187..327..512..758..1241..solved at 1625
      #|0..0..6..15..33..66..122..201..349..542..787..1192..1755..2448..solved at 2836
      #|0..0..6..15..33..66..122..201..349..549..814..1259..solved at 1457
      #|0..0..2..6..solved at 10
      #|0..0..1..3..5..7..solved at 13
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..4..9..20..36..solved at 63
      #|0..0..3..8..19..33..58..87..130..187..266..383..562..761..1057..1454..1908..2483..3288..4157..5293..6738..8316..solved at 9347
      #|0..0..3..8..19..33..58..87..130..187..266..383..563..763..1060..1461..1919..2498..3318..4202..5353..6822..8424..solved at 9460
      #|0..0..3..8..19..33..58..87..130..187..266..383..561..759..1054..1447..1897..2464..3250..4100..5209..6614..8152..solved at 9158
      #|0..0..3..8..19..33..58..87..130..187..266..383..562..761..1057..1454..1908..2479..3280..4145..5269..6700..8264..solved at 9278
      #|0..0..3..9..solved at 26
      #|0..0..3..8..solved at 23
      #|0..0..3..10..28..52..97..152..238..357..519..753..1113..1528..2145..2991..3981..5210..6942..8802..11178..14233..17629..solved at 20443
      #|0..0..3..9..25..46..85..136..212..323..479..697..1033..1442..2021..2833..3804..4977..6627..8521..10836..13809..17202..solved at 19348
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 16
      #|0..0..4..10..26..45..82..142..solved at 156
      #|0..0..4..13..42..107..255..599..solved at 1295
      #|0..0..4..13..42..107..255..599..solved at 1295
      #|0..0..4..13..42..106..250..582..solved at 1254
      #|0..0..4..13..42..106..250..582..solved at 1254
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2680..3345..solved at 4357
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2684..3357..solved at 4426
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2636..3287..solved at 4234
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2640..3299..solved at 4303
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..8..20..34..59..95..139..211..316..431..627..840..1072..1406..1800..2223..2880..3646..4465..5624..6908..8313..solved at 10033
      #|0..0..3..8..20..34..59..95..139..213..320..437..640..860..1099..1446..1853..2289..2976..3772..4621..5828..7164..8625..solved at 10457
      #|0..0..3..8..20..34..59..95..139..209..312..425..615..822..1048..1370..1752..2162..2791..3529..4320..5439..6679..8036..solved at 9653
      #|0..0..3..8..20..34..59..95..139..211..316..431..628..842..1075..1410..1805..2228..2887..3655..4476..5643..6935..8348..solved at 10075
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2684..3357..solved at 4426
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2688..3369..solved at 4495
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2640..3299..solved at 4303
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2644..3311..solved at 4372
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2684..3357..solved at 4413
      #|0..0..4..10..24..48..88..137..210..286..381..484..618..779..1019..1315..1662..2135..2688..3369..solved at 4482
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2640..3299..solved at 4290
      #|0..0..4..10..24..47..86..134..206..281..375..477..610..769..1003..1293..1634..2101..2644..3311..solved at 4359
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..7..19..38..64..solved at 82
      #|0..0..3..8..20..34..59..95..139..212..318..434..633..849..1084..1423..1822..2250..2922..3703..4537..5721..7034..8472..solved at 10262
      #|0..0..3..8..20..34..59..95..139..213..320..437..640..860..1099..1446..1853..2289..2980..3780..4633..5843..7186..8658..solved at 10533
      #|0..0..3..8..20..34..59..95..139..210..314..428..621..831..1060..1387..1774..2189..2833..3586..4392..5536..6805..8195..solved at 9883
      #|0..0..3..8..20..34..59..95..139..211..316..431..628..842..1075..1410..1805..2228..2891..3663..4488..5660..6961..8387..solved at 10162
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..13..34..solved at 50
      #|0..0..solved at 11
      #|0..0..9..18..solved at 30
      #|0..0..0..2..4..7..10..13..solved at 20
      #|0..0..2..8..14..22..34..47..solved at 54
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..5..14..26..solved at 34
      #|0..0..5..14..25..solved at 34
      #|0..0..5..14..27..solved at 36
      #|0..0..5..14..26..solved at 36
      #|0..0..4..solved at 10
      #|0..0..4..solved at 10
      #|0..0..4..solved at 10
      #|0..0..4..solved at 10
      #|0..0..5..13..26..solved at 35
      #|0..0..5..13..23..solved at 33
      #|0..0..5..13..27..solved at 37
      #|0..0..5..13..24..solved at 35
      #|0..0..5..15..35..69..132..228..421..761..solved at 823
      #|0..0..5..15..34..64..124..216..379..671..solved at 739
      #|0..0..5..15..36..71..135..233..416..734..solved at 810
      #|0..0..5..15..35..66..125..213..361..627..solved at 693
      #|0..0..4..solved at 11
      #|0..0..5..14..26..solved at 34
      #|0..0..5..14..25..solved at 34
      #|0..0..5..14..27..solved at 36
      #|0..0..5..14..26..solved at 36
      #|0..0..5..14..solved at 20
      #|0..0..5..14..solved at 21
      #|0..0..5..14..solved at 21
      #|0..0..5..14..solved at 22
      #|0..0..4..8..19..40..solved at 46
      #|0..0..5..11..solved at 15
      #|0..0..6..16..solved at 22
      #|0..0..6..16..solved at 23
      #|0..0..6..16..solved at 23
      #|0..0..6..16..solved at 24
      #|0..0..6..12..solved at 16
      #|0..0..6..16..solved at 23
      #|0..0..6..16..solved at 24
      #|0..0..6..16..solved at 24
      #|0..0..6..16..solved at 25
      #|0..0..7..17..43..95..181..306..540..892..solved at 953
      #|0..0..7..17..40..85..162..274..467..745..solved at 821
      #|0..0..7..17..44..97..184..313..534..853..solved at 931
      #|0..0..7..17..41..87..163..273..448..690..solved at 767
      #|0..0..7..17..37..64..105..146..202..289..solved at 304
      #|0..0..7..17..34..56..90..125..169..234..solved at 253
      #|0..0..7..17..38..66..106..149..207..290..solved at 311
      #|0..0..7..17..35..58..91..128..174..236..solved at 261
      #|0..0..solved at 2
      #|0..0..8..16..solved at 20
      #|0..0..7..solved at 13
      #|0..0..7..solved at 13
      #|0..0..7..solved at 13
      #|0..0..7..solved at 13
      #|0..0..7..solved at 12
      #|0..0..7..solved at 12
      #|0..0..7..solved at 12
      #|0..0..7..solved at 12
      #|0..0..8..19..41..solved at 50
      #|0..0..8..19..38..solved at 48
      #|0..0..8..19..42..solved at 52
      #|0..0..8..19..39..solved at 50
      #|0..0..7..18..42..100..solved at 190
      #|0..0..7..18..39..90..solved at 172
      #|0..0..7..18..43..102..solved at 193
      #|0..0..7..18..40..92..solved at 173
      #|0..0..solved at 2
      #|0..0..5..14..solved at 21
      #|0..0..5..14..solved at 22
      #|0..0..5..14..solved at 22
      #|0..0..5..14..solved at 23
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..7..14..32..73..solved at 79
      #|0..0..8..20..47..110..solved at 207
      #|0..0..8..20..44..100..solved at 189
      #|0..0..8..20..48..112..solved at 210
      #|0..0..8..20..45..102..solved at 190
      #|0..0..8..19..40..solved at 49
      #|0..0..8..19..37..solved at 47
      #|0..0..8..19..41..solved at 51
      #|0..0..8..19..38..solved at 49
      #|0..0..solved at 2
      #|0..0..9..solved at 12
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..0..2..solved at 6
      #|0..0..1..3..5..7..9..solved at 20
      #|0..0..1..3..5..7..9..solved at 17
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..9..13..20..32..44..solved at 64
      #|0..0..1..3..5..9..13..20..32..44..solved at 61
      #|0..0..3..7..11..solved at 16
      #|0..0..1..2..5..9..15..30..47..76..solved at 126
      #|0..0..1..2..6..12..solved at 24
      #|0..0..1..2..5..10..17..26..36..46..62..solved at 86
      #|0..0..1..2..5..9..15..25..35..48..68..88..115..solved at 157
      #|0..0..1..2..5..10..17..28..39..52..72..99..132..188..247..317..438..563..720..solved at 883
      #|0..0..1..3..5..10..19..31..50..80..116..173..247..325..solved at 428
      #|0..0..0..0..1..3..5..solved at 11
      #|0..0..1..2..10..19..29..solved at 36
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..10..21..39..72..solved at 85
      #|0..0..1..2..4..10..21..39..72..solved at 85
      #|0..0..1..3..5..12..23..solved at 30
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..2..5..8..13..18..28..48..68..solved at 80
      #|0..0..2..5..8..13..18..28..48..68..solved at 78
      #|0..0..1..2..3..7..13..21..34..solved at 47
      #|0..0..0..0..1..4..9..19..solved at 28
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..13..21..34..solved at 47
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..3..8..24..solved at 36
      #|0..0..3..8..24..solved at 36
      #|0..0..3..8..24..52..solved at 69
      #|0..0..3..8..24..52..solved at 69
      #|0..0..1..5..10..21..52..102..solved at 122
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..solved at 15
      #|0..0..0..1..solved at 5
      #|0..0..2..5..9..21..42..72..solved at 87
      #|0..0..2..5..9..21..42..72..solved at 87
      #|0..0..2..5..10..25..50..solved at 63
      #|0..0..2..5..10..25..50..solved at 63
      #|0..0..2..5..10..25..49..solved at 63
      #|0..0..2..5..10..25..49..solved at 63
      #|0..0..2..6..13..28..55..94..solved at 108
      #|0..0..2..6..13..28..55..94..solved at 108
      #|0..0..1..3..7..18..32..53..91..139..199..320..solved at 391
      #|0..0..1..3..7..18..32..53..91..139..199..320..solved at 391
      #|0..0..1..3..6..15..27..43..70..106..149..246..359..501..solved at 611
      #|0..0..1..3..6..15..27..43..70..106..149..246..359..501..solved at 611
      #|0..0..4..9..20..43..77..123..208..324..solved at 370
      #|0..0..4..9..20..43..77..123..208..324..solved at 370
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..4..10..23..48..90..149..255..403..598..929..solved at 1086
      #|0..0..4..10..23..48..90..149..255..403..598..929..solved at 1086
      #|0..0..4..10..22..45..85..142..239..364..525..840..solved at 1060
      #|0..0..4..10..22..45..85..142..239..364..525..840..solved at 1060
      #|0..0..4..11..25..50..94..157..262..403..582..876..1307..1837..solved at 2184
      #|0..0..4..11..25..50..94..157..262..403..582..876..1307..1837..solved at 2184
      #|0..0..5..10..solved at 17
      #|0..0..5..10..solved at 14
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..4..10..27..solved at 39
      #|0..0..4..10..27..56..solved at 73
      #|0..0..4..10..27..solved at 39
      #|0..0..4..10..27..56..solved at 73
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 9
      #|0..0..0..1..2..3..6..9..12..29..solved at 45
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..3..4..9..solved at 19
      #|0..0..0..1..solved at 5
      #|0..0..3..7..12..30..58..97..solved at 118
      #|0..0..3..7..12..30..58..97..solved at 118
      #|0..0..3..7..15..36..70..solved at 88
      #|0..0..3..7..15..36..70..solved at 88
      #|0..0..3..7..15..36..69..solved at 88
      #|0..0..3..7..15..36..69..solved at 88
      #|0..0..3..8..18..41..77..129..solved at 149
      #|0..0..3..8..18..41..77..129..solved at 149
      #|0..0..2..5..10..25..44..70..115..172..241..384..solved at 473
      #|0..0..2..5..10..25..44..70..115..172..241..384..solved at 473
      #|0..0..2..5..9..22..39..60..94..137..187..304..437..601..solved at 750
      #|0..0..2..5..9..22..39..60..94..137..187..304..437..601..solved at 750
      #|0..0..5..11..23..52..93..148..246..377..solved at 434
      #|0..0..5..11..23..52..93..148..246..377..solved at 434
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..5..12..26..57..108..176..297..464..678..1052..solved at 1259
      #|0..0..5..12..26..57..108..176..297..464..678..1052..solved at 1259
      #|0..0..5..12..25..52..97..161..269..405..579..926..solved at 1176
      #|0..0..5..12..25..52..97..161..269..405..579..926..solved at 1176
      #|0..0..5..13..28..57..106..174..290..442..632..954..1421..1993..solved at 2409
      #|0..0..5..13..28..57..106..174..290..442..632..954..1421..1993..solved at 2409
      #|0..0..4..8..16..33..60..93..152..222..solved at 241
      #|0..0..4..8..16..33..60..93..152..221..solved at 238
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..4..10..27..solved at 39
      #|0..0..4..10..27..56..solved at 73
      #|0..0..4..10..27..solved at 39
      #|0..0..4..10..27..56..solved at 73
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..6..9..12..29..solved at 45
      #|0..0..1..2..5..9..15..28..41..60..solved at 72
      #|0..0..0..0..0..3..6..9..14..19..24..29..34..39..solved at 83
      #|0..0..0..0..0..4..8..12..24..36..48..60..72..84..146..208..270..solved at 288
      #|0..0..0..0..0..4..8..12..24..36..48..60..72..84..146..208..270..solved at 288
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..13..18..31..44..57..70..83..96..139..182..225..solved at 241
      #|0..0..0..2..4..6..11..19..solved at 29
      #|0..0..0..2..4..6..11..18..27..42..solved at 57
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 9
      #|0..0..0..0..solved at 4
      #|0..0..2..6..12..29..58..119..262..553..solved at 721
      #|0..0..2..6..12..29..58..119..262..553..solved at 721
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..8..solved at 13
      #|0..0..solved at 2
      #|0..0..6..14..33..91..214..580..1613..solved at 1709
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 23
      #|0..0..solved at 3
      #|0..0..2..7..13..25..48..77..114..172..solved at 187
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..22..solved at 30
      #|0..0..2..7..16..38..solved at 46
      #|0..0..0..0..0..3..6..9..14..19..24..29..34..39..solved at 50
      #|0..0..1..2..4..solved at 9
      #|0..0..2..4..9..solved at 17
      #|0..0..2..4..7..17..30..48..solved at 62
      #|0..0..2..4..6..14..33..64..solved at 80
      #|0..0..3..6..9..21..45..81..solved at 97
      #|0..0..2..6..solved at 11
      #|0..0..2..6..solved at 10
      #|0..0..3..8..solved at 13
      #|0..0..3..8..solved at 12
      #|0..0..2..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 6
      #|0..0..4..solved at 7
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..solved at 14
      #|0..0..1..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..5..solved at 9
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..3..4..9..18..solved at 29
      #|0..0..0..0..1..solved at 6
      #|0..0..4..9..17..39..73..118..solved at 138
      #|0..0..4..9..17..39..73..118..solved at 138
      #|0..0..4..9..20..45..84..solved at 103
      #|0..0..4..9..20..45..84..solved at 103
      #|0..0..4..9..20..45..83..solved at 101
      #|0..0..4..9..20..45..83..solved at 101
      #|0..0..4..10..23..50..92..150..solved at 171
      #|0..0..4..10..23..50..92..150..solved at 171
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|0..0..3..7..15..34..59..92..145..210..294..452..solved at 564
      #|0..0..3..7..15..34..59..92..145..210..294..452..solved at 564
      #|0..0..3..7..14..31..54..82..124..175..240..372..527..719..solved at 898
      #|0..0..3..7..14..31..54..82..124..175..240..372..527..719..solved at 898
      #|0..0..6..13..28..61..108..170..274..408..solved at 464
      #|0..0..6..13..28..61..108..170..274..408..solved at 464
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..6..14..31..66..123..198..326..500..727..1107..solved at 1315
      #|0..0..6..14..31..66..123..198..326..500..727..1107..solved at 1315
      #|0..0..6..14..30..61..112..183..298..441..629..985..solved at 1234
      #|0..0..6..14..30..61..112..183..298..441..629..985..solved at 1234
      #|0..0..6..15..33..66..121..196..319..478..682..1014..1498..2092..solved at 2509
      #|0..0..6..15..33..66..121..196..319..478..682..1014..1498..2092..solved at 2509
      #|0..0..5..11..27..56..102..solved at 115
      #|0..0..5..11..27..56..101..solved at 115
      #|0..0..0..1..5..13..31..62..120..solved at 136
      #|0..0..0..1..5..13..33..solved at 42
      #|0..0..7..15..solved at 25
      #|0..0..7..15..solved at 25
      #|0..0..6..13..26..59..104..182..317..527..solved at 756
      #|0..0..6..13..26..59..104..182..317..527..solved at 756
      #|0..0..6..12..35..70..solved at 88
      #|0..0..6..12..35..70..solved at 88
      #|0..0..6..15..solved at 33
      #|0..0..6..15..solved at 33
      #|0..0..6..15..solved at 36
      #|0..0..6..15..solved at 36
      #|0..0..5..10..solved at 25
      #|0..0..5..10..solved at 25
      #|0..0..6..14..solved at 19
      #|0..0..6..14..solved at 19
      #|0..0..5..10..solved at 25
      #|0..0..5..10..solved at 25
      #|0..0..6..12..25..solved at 36
      #|0..0..6..12..25..solved at 36
      #|0..0..0..1..3..7..24..49..solved at 95
      #|0..0..1..2..4..6..8..10..12..14..16..18..20..solved at 30
      #|0..0..1..2..4..6..8..10..12..14..16..18..20..solved at 30
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..15..solved at 26
      #|0..0..1..4..7..11..15..19..solved at 30
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..1..2..6..10..14..23..32..41..62..83..108..solved at 125
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..10..21..35..75..142..221..363..538..759..1077..solved at 1310
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..1..solved at 7
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..15..solved at 24
      #|0..0..2..6..18..41..88..solved at 96
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..3..7..11..17..29..41..61..solved at 74
      #|0..0..1..3..5..9..15..21..31..41..51..61..71..81..128..solved at 149
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4066
      #|0..0..2..6..14..35..64..100..170..242..322..418..538..692..1136..1644..2206..3206..4264..5406..solved at 6962
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..14..36..68..108..184..265..354..461..598..773..1252..1803..2412..3483..4624..5859..solved at 7067
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..14..36..68..108..184..265..354..461..598..773..1252..1803..2412..3483..4624..5859..solved at 7067
      #|0..0..2..6..14..35..64..102..174..252..340..444..576..746..1206..1738..2332..3364..4470..5684..solved at 7328
      #|0..0..2..6..14..35..64..102..174..252..340..444..576..746..1206..1738..2332..3364..4470..5684..solved at 7328
      #|0..0..3..10..solved at 21
      #|0..0..4..16..solved at 20
      #|0..0..4..12..solved at 24
      #|0..0..3..10..solved at 21
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..8..solved at 17
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..3..10..solved at 22
      #|0..0..4..16..solved at 20
      #|0..0..4..12..solved at 25
      #|0..0..3..10..solved at 22
      #|0..0..1..2..solved at 6
      #|0..0..2..8..solved at 17
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..2..8..solved at 18
      #|0..0..2..4..solved at 10
      #|0..0..1..2..solved at 7
      #|0..0..solved at 3
      #|0..0..3..10..solved at 17
      #|0..0..4..16..solved at 20
      #|0..0..4..16..solved at 23
      #|0..0..4..12..solved at 16
      #|0..0..4..12..solved at 19
      #|0..0..3..10..solved at 14
      #|0..0..3..10..solved at 17
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..6..13..24..45..81..151..238..353..solved at 450
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..23..35..53..73..110..151..208..290..solved at 378
      #|0..0..1..2..7..13..25..49..79..129..239..393..646..solved at 1229
      #|0..0..2..solved at 6
      #|0..0..3..8..19..44..79..126..207..296..399..518..669..866..1353..1920..2559..3636..4797..6083..solved at 7727
      #|0..0..3..8..19..44..79..124..203..286..381..492..631..812..1283..1826..2433..3478..4595..5821..solved at 7935
      #|0..0..4..10..22..51..91..141..227..317..419..543..695..889..1387..1957..2591..3677..4831..6086..solved at 7642
      #|0..0..4..10..22..51..91..143..231..327..437..569..733..943..1457..2051..2717..3835..5037..6364..solved at 8008
      #|0..0..0..solved at 3
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4431
      #|0..0..1..2..7..12..17..34..51..68..85..102..119..204..289..374..solved at 562
      #|0..0..1..4..7..22..37..52..101..150..199..248..297..346..633..920..1207..1848..2489..3130..solved at 4431
      #|0..0..1..3..5..12..22..36..64..99..148..solved at 207
      #|0..0..1..2..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..2..4..6..8..17..27..78..140..213..350..492..638..818..998..1180..1400..1648..1896..2154..2413..solved at 2463
      #|0..0..2..4..7..10..20..30..80..140..205..335..469..603..774..945..solved at 983
      #|0..0..0..2..5..8..12..17..22..28..34..40..51..62..73..solved at 98
      #|0..0..2..5..9..solved at 18
      #|0..0..2..6..11..22..38..56..86..solved at 135
      #|0..0..0..1..3..6..15..24..39..55..73..93..113..135..161..187..213..239..265..310..355..403..558..719..894..1075..1260..1455..1715..1983..solved at 2047
      #|0..0..0..1..3..7..17..27..42..58..76..96..116..138..164..190..216..242..268..313..358..406..561..724..904..1088..1274..1471..1728..1993..solved at 2083
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..6..11..20..29..38..77..116..155..194..233..272..351..430..509..670..831..992..solved at 1364
      #|0..0..2..4..8..12..16..35..solved at 45
      #|0..0..1..2..4..6..8..11..14..17..22..27..32..38..44..50..57..64..71..solved at 117
      #|0..0..2..4..7..13..19..42..70..104..159..215..281..384..537..703..931..1189..1471..1795..2175..solved at 2338
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..3..7..solved at 17
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..5..solved at 9
      #|0..0..2..5..solved at 12
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..6..13..solved at 17
      #|0..0..solved at 2
      #|0..0..5..solved at 13
      #|0..0..4..solved at 12
      #|0..0..4..9..solved at 13
      #|0..0..1..solved at 5
      #|0..0..1..solved at 7
      #|0..0..4..8..17..solved at 22
      #|0..0..2..4..6..14..26..43..68..100..solved at 135
      #|0..0..2..4..6..14..26..43..67..99..137..197..solved at 240
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..6..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..6..solved at 10
      #|0..0..3..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..7..18..35..79..153..281..560..solved at 671
      #|0..0..3..13..solved at 25
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..13..23..44..87..solved at 155
      #|0..0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..5..15..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 6
      #|0..0..1..2..4..6..12..solved at 18
      #|0..0..1..2..4..6..12..solved at 18
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 6
      #|0..0..1..2..4..6..12..solved at 18
      #|0..0..1..2..4..6..12..solved at 18
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..2..3..8..17..26..43..60..77..94..111..128..157..186..215..268..321..374..467..560..653..754..855..956..1121..1286..1451..solved at 1491
      #|0..0..1..2..3..6..15..24..39..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 9
      #|0..0..1..3..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..9..solved at 19
      #|0..0..1..3..solved at 10
      #|0..0..1..3..10..30..79..solved at 155
      #|0..0..1..5..13..31..70..solved at 130
      #|0..0..1..5..13..31..70..140..solved at 221
      #|0..0..1..solved at 5
      #|0..0..1..2..3..7..12..17..30..44..63..136..239..solved at 273
      #|0..0..1..6..13..27..56..99..174..solved at 203
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..12..17..30..44..63..136..239..solved at 272
      #|0..0..1..6..13..27..56..99..174..solved at 202
      #|0..0..1..solved at 6
      #|0..0..1..3..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..5..solved at 16
      #|0..0..1..5..15..38..solved at 74
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..13..29..64..solved at 123
      #|0..0..1..5..13..29..64..131..solved at 174
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..2..solved at 10
      #|0..0..1..solved at 5
      #|0..0..0..2..solved at 10
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 10
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 10
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..3..4..9..15..21..solved at 33
      #|0..0..0..2..solved at 6
      #|0..0..1..2..5..10..25..48..79..solved at 90
      #|0..0..1..2..7..12..27..50..81..solved at 92
      #|0..0..1..2..5..10..25..48..79..solved at 90
      #|0..0..1..2..7..15..34..63..101..solved at 112
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..0..solved at 7
      #|0..0..0..0..5..18..solved at 31
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 5
      #|0..0..0..0..5..18..solved at 31
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..3..4..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..6..12..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..6..12..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..solved at 5
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..7..16..43..84..189..397..solved at 631
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..1..solved at 4
      #|0..0..6..12..31..58..solved at 81
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..9..18..65..129..305..585..solved at 784
      #|0..0..9..18..65..129..305..585..solved at 779
      #|0..0..1..3..10..26..56..113..238..441..769..1410..solved at 2224
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..9..18..65..129..305..586..solved at 789
      #|0..0..9..18..65..129..305..586..solved at 784
      #|0..0..9..18..65..129..305..586..solved at 779
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..13..35..85..solved at 144
      #|0..0..10..solved at 23
      #|0..0..9..18..62..124..281..546..1086..solved at 1519
      #|0..0..1..2..5..8..15..26..47..88..133..202..290..389..514..661..823..1042..1296..1578..1924..2318..2746..3216..3760..4380..5153..6042..solved at 6559
      #|0..0..1..2..7..16..solved at 22
      #|0..0..2..8..solved at 17
      #|0..0..2..8..24..82..239..solved at 373
      #|0..0..2..5..16..42..solved at 53
      #|0..0..2..7..22..70..solved at 125
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..0..1..2..3..4..5..6..13..20..27..36..45..54..solved at 65
      #|0..0..0..1..2..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..1..2..3..6..9..12..17..22..27..solved at 36
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..3..6..9..14..19..24..29..34..39..solved at 50
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..2..4..13..27..54..89..138..189..259..332..421..solved at 441
      #|0..0..0..1..5..12..25..43..78..120..175..255..386..solved at 565
      #|0..0..1..2..3..7..14..23..solved at 37
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..1..4..8..solved at 13
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..1..2..5..10..17..solved at 28
      #|0..0..1..2..5..12..24..solved at 43
      #|0..0..0..1..3..5..12..23..35..solved at 49
      #|0..0..2..solved at 7
      #|0..0..1..4..13..35..107..solved at 145
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..7..solved at 12
      #|0..0..2..5..solved at 9
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..3..solved at 9
      #|0..0..2..solved at 7
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..4..10..24..49..solved at 88
      #|0..0..8..17..42..99..202..solved at 295
      #|0..0..1..3..solved at 9
      #|0..0..solved at 2
      #|0..0..3..9..15..48..95..189..357..solved at 366
      #|0..0..3..8..14..29..solved at 37
      #|0..0..4..solved at 7
      #|0..0..3..10..solved at 14
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|Warning: inventing type variables
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..5..10..17..26..37..48..66..96..135..200..279..375..511..solved at 634
      #|0..0..1..2..6..11..solved at 18
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..6..13..solved at 22
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..0..0..3..solved at 12
      #|0..0..0..0..solved at 4
      #|0..0..0..0..2..5..8..17..28..41..84..140..solved at 193
      #|0..0..0..0..2..5..8..17..28..41..84..140..solved at 193
      #|0..0..0..0..2..5..8..17..28..41..89..165..solved at 218
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 9
      #|0..0..1..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..10..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..12..solved at 20
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..3..12..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..3..12..solved at 19
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..3..12..solved at 17
      #|0..0..solved at 4
      #|0..0..3..12..26..47..96..155..solved at 192
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..3..12..27..48..solved at 63
      #|0..0..3..8..15..36..solved at 76
      #|0..0..3..8..15..33..solved at 71
      #|0..0..3..8..15..45..solved at 95
      #|0..0..2..6..12..29..solved at 62
      #|0..0..3..8..15..33..solved at 71
      #|0..0..2..6..12..26..solved at 57
      #|0..0..3..8..15..42..solved at 90
      #|0..0..2..6..12..26..solved at 57
      #|0..0..3..8..15..45..solved at 95
      #|0..0..3..8..15..42..solved at 90
      #|0..0..2..6..12..38..solved at 81
      #|0..0..2..6..12..38..solved at 81
      #|0..0..2..6..12..29..solved at 62
      #|0..0..2..6..12..26..solved at 57
      #|0..0..2..6..12..38..solved at 81
      #|0..0..1..4..9..22..solved at 48
      #|0..0..4..8..14..30..57..solved at 138
      #|0..0..4..8..14..27..52..solved at 112
      #|0..0..4..8..14..39..76..solved at 148
      #|0..0..3..6..11..23..43..solved at 97
      #|0..0..4..8..14..27..52..solved at 112
      #|0..0..3..6..11..20..38..solved at 71
      #|0..0..4..8..14..36..71..solved at 122
      #|0..0..3..6..11..20..38..solved at 73
      #|0..0..4..8..14..39..76..solved at 148
      #|0..0..4..8..14..36..71..solved at 122
      #|0..0..3..6..11..32..62..solved at 107
      #|0..0..3..6..11..32..62..solved at 108
      #|0..0..3..6..11..23..43..solved at 97
      #|0..0..3..6..11..20..38..solved at 73
      #|0..0..3..6..11..32..62..solved at 108
      #|0..0..2..4..8..16..29..solved at 56
      #|0..0..4..8..12..37..75..solved at 167
      #|0..0..4..8..12..34..70..solved at 141
      #|0..0..4..8..12..46..94..solved at 177
      #|0..0..3..6..9..30..73..solved at 152
      #|0..0..4..8..12..34..70..solved at 141
      #|0..0..3..6..9..27..56..solved at 100
      #|0..0..4..8..12..43..89..solved at 151
      #|0..0..3..6..9..27..68..solved at 128
      #|0..0..4..8..12..46..94..solved at 177
      #|0..0..4..8..12..43..89..solved at 151
      #|0..0..3..6..9..39..80..solved at 136
      #|0..0..3..6..9..39..92..solved at 163
      #|0..0..3..6..9..30..73..solved at 152
      #|0..0..3..6..9..27..68..solved at 128
      #|0..0..3..6..9..39..92..solved at 163
      #|0..0..2..4..6..23..59..solved at 111
      #|0..0..4..10..18..43..95..solved at 188
      #|0..0..4..10..18..40..90..solved at 162
      #|0..0..4..10..18..52..114..solved at 198
      #|0..0..3..8..15..36..81..solved at 159
      #|0..0..4..10..18..40..90..solved at 162
      #|0..0..3..8..15..33..76..solved at 121
      #|0..0..4..10..18..49..109..solved at 172
      #|0..0..3..8..15..33..76..solved at 135
      #|0..0..4..10..18..52..114..solved at 198
      #|0..0..4..10..18..49..109..solved at 172
      #|0..0..3..8..15..45..100..solved at 157
      #|0..0..3..8..15..45..100..solved at 170
      #|0..0..3..8..15..36..81..solved at 159
      #|0..0..3..8..15..33..76..solved at 135
      #|0..0..3..8..15..45..100..solved at 170
      #|0..0..2..6..12..29..67..solved at 118
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..10..18..40..86..solved at 196
      #|0..0..4..10..18..37..81..solved at 172
      #|0..0..4..10..18..49..105..solved at 206
      #|0..0..3..8..15..33..72..solved at 172
      #|0..0..4..10..18..37..81..solved at 172
      #|0..0..3..8..15..30..67..solved at 131
      #|0..0..4..10..18..46..100..solved at 182
      #|0..0..3..8..15..30..67..solved at 150
      #|0..0..4..10..18..49..105..solved at 206
      #|0..0..4..10..18..46..100..solved at 182
      #|0..0..3..8..15..42..91..solved at 165
      #|0..0..3..8..15..42..91..solved at 183
      #|0..0..3..8..15..33..72..solved at 172
      #|0..0..3..8..15..30..67..solved at 150
      #|0..0..3..8..15..42..91..solved at 183
      #|0..0..2..6..12..26..58..solved at 131
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..6..12..18..51..121..280..541..837..1399..2118..2851..3736..4887..6122..0..0..5..10..15..35..64..solved at 125
      #|0..0..5..10..15..32..59..solved at 97
      #|0..0..5..10..15..38..71..solved at 115
      #|0..0..4..8..12..28..50..solved at 82
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 5
      #|0..0..2..solved at 7
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..0..0..6..17..37..70..126..solved at 197
      #|0..0..0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..3..8..24..78..220..841..2785..solved at 5263
      #|0..0..1..5..10..19..38..66..121..solved at 189
      #|0..0..1..solved at 4
      #|0..0..1..6..16..solved at 23
      #|0..0..2..5..10..solved at 18
      #|0..0..2..5..10..22..38..65..101..145..194..251..312..393..515..655..solved at 740
      #|0..0..2..7..solved at 16
      #|0..0..2..7..16..solved at 37
      #|0..0..1..4..9..19..40..76..152..307..738..solved at 1765
      #|0..0..1..5..9..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 6
      #|0..0..1..2..5..9..solved at 15
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..12..25..solved at 40
      #|0..0..1..2..5..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..17..33..76..150..solved at 189
      #|0..0..2..7..17..33..76..150..solved at 189
      #|0..0..2..6..10..25..solved at 31
      #|0..0..1..2..6..14..31..61..105..solved at 124
      #|0..0..2..4..8..14..26..solved at 35
      #|0..0..solved at 2
      #|0..0..3..6..11..23..solved at 37
      #|0..0..5..10..22..43..solved at 55
      #|0..0..5..10..22..43..solved at 55
      #|0..0..5..10..23..45..solved at 57
      #|0..0..solved at 2
      #|0..0..5..10..20..38..93..179..solved at 198
      #|0..0..5..10..21..40..99..190..solved at 209
      #|0..0..5..10..20..38..solved at 50
      #|0..0..solved at 3
      #|0..0..5..10..21..40..solved at 52
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..5..10..19..35..91..167..solved at 203
      #|0..0..3..6..11..23..39..solved at 52
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..6..12..25..51..88..149..solved at 176
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..8..17..33..68..116..189..solved at 216
      #|Logic/lpo quotations (296):
      #|  \226\136\128 l : List[Num], 0 < ITLIST(op_plus, l, 1)
      #|  \226\136\128 f : Num, \226\136\128 a : Term, \226\136\128 args : List[Term], MEM(a, args) && FVT(Fn(f, args)) == {} \226\134\146 FVT(a) == {}
      #|  (NONWF : ((A, A) -> Bool, A) -> Bool)((R : (A, A) -> Bool), (a : A)) == (\226\136\131 s : (Num) -> A, s(0) == a && (\226\136\128 n : Num, R(s(SUC(n)), s(n))))
      #|  WF((R : (_, _) -> Bool)) == (\226\136\128 a : _, !NONWF(R, a))
      #|  !((n : Num) == 0) \226\134\146 SUC(n) - 1 == SUC(n - 1)
      #|  (n : Num) => if n == 0 { (a : A) } else { (s : (Num) -> A)(n - 1) }
      #|  (s : (Num) -> A)
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 a : A, \226\136\128 b : A, NONWF(R, b) && R(b, a) \226\134\146 NONWF(R, a)
      #|  (s : (Num) -> A)
      #|  0
      #|  (s : (Num) -> A)
      #|  WF((x : A) => (y : A) => (R : (A, A) -> Bool)(x, y) && !NONWF(R, y))
      #|  (\226\136\128 a : _, !NONWF((R : (_, _) -> Bool), a) && (\226\136\128 b : _, R(b, a) \226\134\146 (P : (_) -> Bool)(b)) \226\134\146 P(a)) \226\134\146 (\226\136\128 x : _, !NONWF(R, x) \226\134\146 P(x))
      #|  1
      #|  (n : Num) => (s : (Num) -> A)(SUC(n))
      #|  (s : (Num) -> A)(1)
      #|  (m : (A) -> Num)((s : (Num) -> A)(1))
      #|  (s : (Num) -> A)
      #|  ((b : Bool) \226\134\146 (c : Bool)) && (a : Bool) \226\134\146 a == b \226\134\146 c
      #|  (n : Num) => \226\136\131 c : A, NONWF((R : (A, A) -> Bool), c) && R(c, (a : A)) && (m : (A) -> Num)(c) == n
      #|  \226\136\128 m : (A) -> Num, \226\136\128 a : A, NONWF((R : (A, A) -> Bool), a) \226\134\146 (\226\136\131 b : A, NONWF(R, b) && R(b, a) && (\226\136\128 c : A, NONWF(R, c) && R(c, a) \226\134\146 m(b) <= m(c)))
      #|  SUC((n : Num))
      #|  0
      #|  \226\136\128 n : Num, NONWF((R : (A, A) -> Bool), (t : (Num) -> A)(SUC(n)))
      #|  \226\136\128 d : Bool, (b : Bool) && d && (a : Bool) && (c : Bool) \226\134\146 a && b && c
      #|  (t : (Num) -> A)
      #|  (b : A) => (n : Num) => select((c : A) => NONWF((R : (A, A) -> Bool), c) && R(c, b) && (\226\136\128 d : A, NONWF(R, d) && R(d, b) \226\134\146 (m : (A) -> Num)(c) <= m(d)))
      #|  (a : A)
      #|  \226\136\128 s : A, NONWF((R : (A, A) -> Bool), s) \226\134\146 (m : (A) -> Num)((a : A)) <= m(s)
      #|  (a : A)
      #|  (n_0 : Num)
      #|  (a : Bool) && ((b : Bool) \226\134\146 (c : Bool)) \226\134\146 a == b \226\134\146 c
      #|  (n : Num) => \226\136\131 s : A, NONWF((R : (A, A) -> Bool), s) && (m : (A) -> Num)(s) == n
      #|  \226\136\128 m : (A) -> Num, WF((R : (A, A) -> Bool)) == !(\226\136\131 t : (Num) -> A, (\226\136\128 n : Num, R(t(SUC(n)), t(n))) && (\226\136\128 s : A, NONWF(R, s) \226\134\146 m(t(0)) <= m(s)) && (\226\136\128 n : Num, \226\136\128 s : A, NONWF(R, s) && R(s, t(n)) \226\134\146 m(t(SUC(n))) <= m(s)))
      #|  (s : (Num) -> Num)
      #|  (m : Num) => (p : Num) => (st : (Num) -> Num)(m)
      #|  (st : (Num) -> Num)(0)
      #|  (st : (Num) -> Num)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 x : (Num) -> A, (\226\136\128 n : Num, \226\136\131 m : Num, n < m && P(x(m))) \226\134\146 (\226\136\131 f : (Num) -> Num, subseq(f) && (\226\136\128 n : Num, P(x(f(n)))))
      #|  (x : A) => x == (a : A)
      #|  (a : A)
      #|  (m : Num) + (n : Num) < (p : Num) \226\134\146 m < p && n < p
      #|  (!(a : Bool) && (c : Bool) \226\134\146 (b : Bool)) \226\134\146 (a \226\134\146 b) \226\134\146 c \226\134\146 b
      #|  (s : (A) -> Bool)
      #|  (b : A)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 (\226\136\131 n : Num, \226\136\128 m : Num, n < m \226\134\146 IN((x : (Num) -> A)(m), s)) \226\134\146 (\226\136\131 a : A, \226\136\128 n : Num, \226\136\131 m : Num, n < m && x(m) == a)
      #|  \226\136\131 a : A, \226\136\128 n : Num, \226\136\131 m : Num, n < m && (x : (Num) -> A)(m) == a
      #|  \226\136\128 x : (Num) -> A, \226\136\128 s : (A) -> Bool, FINITE(s) && (\226\136\128 n : Num, IN(x(n), s)) \226\134\146 (\226\136\131 a : A, \226\136\131 f : (Num) -> Num, subseq(f) && (\226\136\128 n : Num, x(f(n)) == a))
      #|  (t : Term) => (ts : List[Term]) => (n : Num) => (ns : List[Num]) => CONS(n, ns)
      #|  (NIL : List[Num])
      #|  (f : Num) => (args : List[Term]) => (ns : List[Num]) => ITLIST(op_plus, ns, 1)
      #|  (x : Num) => 1
      #|  \226\136\131 termsize : (Term) -> Num, (\226\136\128 x : Num, termsize(V(x)) == 1) && (\226\136\128 f : Num, \226\136\128 args : List[Term], termsize(Fn(f, args)) == ITLIST(op_plus, MAP(termsize, args), 1))
      #|  (LEX : ((_, _) -> Bool, List[_], List[_]) -> Bool)((op_lt_lt : (_, _) -> Bool), NIL, (l : List[_])) == false && LEX(op_lt_lt, CONS((h : _), (t : List[_])), l) == (if l == NIL { false } else { if op_lt_lt(h, HD(l)) { LENGTH(t) == LENGTH(TL(l)) } else { h == HD(l) && LEX(op_lt_lt, t, TL(l)) } })
      #|  LEX((op_lt_lt : (_, _) -> Bool), NIL, (l : List[_])) == false && LEX(op_lt_lt, CONS((h1 : _), (t1 : List[_])), NIL) == false && LEX(op_lt_lt, CONS(h1, t1), CONS((h2 : _), (t2 : List[_]))) == (if op_lt_lt(h1, h2) { LENGTH(t1) == LENGTH(t2) } else { h1 == h2 && LEX(op_lt_lt, t1, t2) })
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 R : (_, _) -> Bool, LEX(R, l1, l2) \226\134\146 LENGTH(l1) == LENGTH(l2)
      #|  (x : List[A])
      #|  (x : List[A])
      #|  (y : List[A])
      #|  (y : List[A])
      #|  (\226\136\128 x : A, \226\136\128 y : A, (R : (A, A) -> Bool)(x, y) \226\134\146 (S : (A, A) -> Bool)(x, y)) \226\134\146 LEX(R, (x : List[A]), (y : List[A])) \226\134\146 LEX(S, x, y)
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], LEX((x : _) => (y : _) => (R : (_, _) -> Bool)((f : (_) -> _)(x), f(y)), l1, l2) \226\134\146 LEX(R, MAP(f, l1), MAP(f, l2))
      #|  \226\136\128 R : (_, _) -> Bool, \226\136\128 l : List[_], (\226\136\128 x : _, MEM(x, l) \226\134\146 !R(x, x)) \226\134\146 !LEX(R, l, l)
      #|  \226\136\128 lis : (Num) -> List[_], \226\136\128 R : (_, _) -> Bool, (\226\136\128 n : Num, LEX(R, lis(SUC(n)), lis(n))) \226\134\146 (\226\136\128 n : Num, LENGTH(lis(n)) == LENGTH(lis(0)))
      #|  SUC((p : Num) + (m : Num))
      #|  (m : Num)
      #|  (n : Num) => (tl : (Num) -> List[A])(SUC((p : Num)) + n)
      #|  (n : Num) => (hd : (Num) -> A)(SUC((p : Num)) + n)
      #|  \226\136\128 n : Num, n <= (p : Num) \226\134\146 (hd : (Num) -> A)(n) == (h : A)
      #|  (hd : (Num) -> A)(SUC((p : Num)))
      #|  (p : Num)
      #|  \226\136\131 m : Num, (R : (A, A) -> Bool)((hd : (Num) -> A)(SUC(m)), hd(m))
      #|  (hd : (Num) -> A)
      #|  (h : A)
      #|  (h : A)
      #|  (h : A)
      #|  (hd : (Num) -> A)
      #|  (hd : (Num) -> A)
      #|  !NONWF((R : (A, A) -> Bool), (h : A))
      #|  (h : A) == (hd : (Num) -> A)(0)
      #|  (tl : (Num) -> List[A])
      #|  (tl : (Num) -> List[A])
      #|  \226\136\128 m : Num, LENGTH((tl : (Num) -> List[A])(m)) == (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 a : A, MEM(a, (tl : (Num) -> List[A])(n)) \226\134\146 !NONWF((R : (A, A) -> Bool), a)
      #|  (if (p : Bool) { true } else { (r : Bool) }) == (p || !p && r)
      #|  \226\136\128 m : Num, LENGTH(CONS((hd : (Num) -> A)(m), (tl : (Num) -> List[A])(m))) == SUC((n : Num))
      #|  \226\136\128 n : Num, LEX((R : (A, A) -> Bool), CONS((hd : (Num) -> A)(SUC(n)), (tl : (Num) -> List[A])(SUC(n))), CONS(hd(n), tl(n)))
      #|  ((a : Bool) || (b : Bool) \226\134\146 (c : Bool)) == ((a \226\134\146 c) && (b \226\134\146 c))
      #|  \226\136\128 n : Num, \226\136\128 a : A, MEM(a, CONS((hd : (Num) -> A)(n), (tl : (Num) -> List[A])(n))) \226\134\146 !NONWF((R : (A, A) -> Bool), a)
      #|  (l : List[A])
      #|  (lis : (Num) -> List[A])((m : Num))
      #|  (m : Num)
      #|  \226\136\128 n : Num, !((lis : (Num) -> List[A])(n) == NIL)
      #|  (n : Num) => TL((lis : (Num) -> List[A])(n))
      #|  (n : Num) => HD((lis : (Num) -> List[A])(n))
      #|  \226\136\131 hd : (Num) -> A, \226\136\131 tl : (Num) -> List[A], \226\136\128 n : Num, CONS(hd(n), tl(n)) == (lis : (Num) -> List[A])(n)
      #|  \226\136\128 n : Num, LENGTH((lis : (Num) -> List[A])(n)) == LENGTH(lis(0))
      #|  \226\136\128 n : Num, \226\136\128 lis : (Num) -> List[A], LENGTH(lis(0)) == n \226\134\146 !((\226\136\128 n : Num, \226\136\128 a : A, MEM(a, lis(n)) \226\134\146 !NONWF((R : (A, A) -> Bool), a)) && (\226\136\128 n : Num, LEX(R, lis(SUC(n)), lis(n))))
      #|  (hd : (Num) -> A)(0) == (h : A)
      #|  \226\136\128 n : Num, !NONWF((R : (A, A) -> Bool), (hd : (Num) -> A)(n))
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 lis : (Num) -> List[A], !((\226\136\128 n : Num, \226\136\128 a : A, MEM(a, lis(n)) \226\134\146 !NONWF(R, a)) && (\226\136\128 n : Num, LEX(R, lis(SUC(n)), lis(n))))
      #|  \226\136\128 P : (_) -> Bool, \226\136\128 R : (_, _) -> Bool, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], LEX(R, l1, l2) && (\226\136\128 a : _, MEM(a, l1) \226\134\146 P(a)) && (\226\136\128 a : _, MEM(a, l2) \226\134\146 P(a)) \226\134\146 LEX((x : _) => (y : _) => P(x) && P(y) && R(x, y), l1, l2)
      #|  (\226\136\128 t : Term, (subterm : (Term, Term) -> Bool)(t, t)) && (\226\136\128 s : Term, \226\136\128 a : Term, \226\136\128 f : Num, \226\136\128 args : List[Term], subterm(s, a) && MEM(a, args) \226\134\146 subterm(s, Fn(f, args)))
      #|  (psubterm : (Term, Term) -> Bool)((s : Term), (t : Term)) == (subterm(s, t) && !(s == t))
      #|  (a : Num) < (c : Num) \226\134\146 a < (b : Num) + c
      #|  0 < (b : Num) \226\134\146 (a : Num) < a + b
      #|  \226\136\128 f : Num, \226\136\128 args : List[Term], \226\136\128 s : Term, MEM(s, args) \226\134\146 termsize(s) < termsize(Fn(f, args))
      #|  \226\136\128 f : Num, \226\136\128 args : List[Term], !MEM(Fn(f, args), args)
      #|  \226\136\128 t : Term, subterm(t, t)
      #|  \226\136\128 t : Term, \226\136\128 u : Term, subterm(t, u) \226\134\146 (\226\136\128 s : Term, subterm(s, t) \226\134\146 subterm(s, u))
      #|  \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, subterm(s, t) && subterm(t, u) \226\134\146 subterm(s, u)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, subterm(s, t) && subterm(t, s) \226\134\146 s == t
      #|  \226\136\128 x : Num, \226\136\128 t : Term, IN(x, FVT(t)) \226\134\146 subterm(V(x), t)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, !(psubterm(s, t) && psubterm(t, s))
      #|  \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, subterm(s, t) && psubterm(t, u) \226\134\146 psubterm(s, u)
      #|  (a : Term)
      #|  (a : Term)
      #|  (args : List[Term])
      #|  (f : Num)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, psubterm(s, t) == (\226\136\131 f : Num, \226\136\131 args : List[Term], \226\136\131 u : Term, t == Fn(f, args) && MEM(u, args) && subterm(s, u))
      #|  \226\136\128 i : (Num) -> Term, \226\136\128 s : Term, \226\136\128 t : Term, subterm(s, t) \226\134\146 subterm(termsubst(i, s), termsubst(i, t))
      #|  termsubst((i : (Num) -> Term), (u : Term))
      #|  MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))
      #|  (u : Term)
      #|  (args : List[Term])
      #|  (f : Num)
      #|  \226\136\128 i : (Num) -> Term, \226\136\128 s : Term, \226\136\128 t : Term, psubterm(s, t) \226\134\146 psubterm(termsubst(i, s), termsubst(i, t))
      #|  (\226\136\128 x : Num, \226\136\128 s : Term, IN(x, FVT(s)) && !(s == V(x)) \226\134\146 (op_lt_lt : (Term, Term) -> Bool)(V(x), s)) && (\226\136\128 fs : Num, \226\136\128 sargs : List[Term], \226\136\128 ft : Num, \226\136\128 targs : List[Term], \226\136\128 si : Term, MEM(si, sargs) && (op_lt_lt(Fn(ft, targs), si) || si == Fn(ft, targs)) \226\134\146 op_lt_lt(Fn(ft, targs), Fn(fs, sargs))) && (\226\136\128 fs : Num, \226\136\128 ft : Num, \226\136\128 sargs : List[Term], \226\136\128 targs : List[Term], (fs > ft || fs == ft && LENGTH(sargs) > LENGTH(targs)) && ALL((ti : Term) => op_lt_lt(ti, Fn(fs, sargs)), targs) \226\134\146 op_lt_lt(Fn(ft, targs), Fn(fs, sargs))) && (\226\136\128 f : Num, \226\136\128 sargs : List[Term], \226\136\128 targs : List[Term], ALL((ti : Term) => op_lt_lt(ti, Fn(f, sargs)), targs) && LEX(op_lt_lt, targs, sargs) \226\134\146 op_lt_lt(Fn(f, targs), Fn(f, sargs)))
      #|  (((a : Bool) && (b : Bool)) && (c : Bool)) == !(a && b \226\134\146 !c)
      #|  (\226\136\128 s : Term, \226\136\128 x : Num, op_lt_lt(s, V(x)) == false) && (\226\136\128 x : Num, \226\136\128 t : Term, op_lt_lt(V(x), t) == (IN(x, FVT(t)) && !(t == V(x)))) && (\226\136\128 f : Num, \226\136\128 fargs : List[Term], \226\136\128 g : Num, \226\136\128 gargs : List[Term], op_lt_lt(Fn(f, fargs), Fn(g, gargs)) == ((\226\136\131 gi : Term, MEM(gi, gargs) && (op_lt_lt(Fn(f, fargs), gi) || Fn(f, fargs) == gi)) || (\226\136\128 fi : Term, MEM(fi, fargs) \226\134\146 op_lt_lt(fi, Fn(g, gargs))) && ((f < g || f == g && LENGTH(fargs) < LENGTH(gargs)) || f == g && LEX(op_lt_lt, fargs, gargs))))
      #|  (t : Term)
      #|  Fn((ft : Num), (targs : List[Term]))
      #|  \226\136\128 s : Term, \226\136\128 t : Term, op_lt_lt(s, t) \226\134\146 SUBSET(FVT(s), FVT(t))
      #|  ((a1 : Bool) && (a2 : Bool) \226\134\146 (a3 : Bool)) && ((b1 : Bool) \226\134\146 (b2 : Bool) \226\134\146 (b3 : Bool)) \226\134\146 a1 && b1 \226\134\146 a2 && b2 \226\134\146 a3 && b3
      #|  (ts : List[Term])
      #|  (ss : List[Term])
      #|  (rs : List[Term])
      #|  (b : Term)
      #|  (c : Term)
      #|  (b : Term)
      #|  (a : Term)
      #|  \226\136\128 r : Term, \226\136\128 s : Term, \226\136\128 t : Term, MEM(r, (rs : List[Term])) && MEM(s, (ss : List[Term])) && MEM(t, (ts : List[Term])) && op_lt_lt(t, s) && op_lt_lt(s, r) \226\134\146 op_lt_lt(t, r)
      #|  op_lt_lt(Fn((g : Num), (ss : List[Term])), Fn((f : Num), (rs : List[Term])))
      #|  op_lt_lt(Fn((h : Num), (ts : List[Term])), Fn((g : Num), (ss : List[Term])))
      #|  Fn((g : Num), (ss : List[Term]))
      #|  \226\136\128 ti : Term, MEM(ti, (ts : List[Term])) \226\134\146 op_lt_lt(ti, Fn((f : Num), (rs : List[Term])))
      #|  op_lt_lt(Fn((h : Num), (ts : List[Term])), Fn((g : Num), (ss : List[Term])))
      #|  \226\136\128 ti : Term, MEM(ti, (ts : List[Term])) \226\134\146 op_lt_lt(ti, Fn((g : Num), (ss : List[Term])))
      #|  (si : Term)
      #|  (si : Term)
      #|  \226\136\131 si : Term, MEM(si, (ss : List[Term])) && (op_lt_lt(Fn((h : Num), (ts : List[Term])), si) || Fn(h, ts) == si)
      #|  op_lt_lt(Fn((g : Num), (ss : List[Term])), Fn((f : Num), (rs : List[Term])))
      #|  \226\136\128 si : Term, MEM(si, (ss : List[Term])) \226\134\146 op_lt_lt(si, Fn((f : Num), (rs : List[Term])))
      #|  Fn((g : Num), (ss : List[Term]))
      #|  termsize((ri : Term)) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  (ri : Term)
      #|  (ri : Term)
      #|  \226\136\131 ri : Term, MEM(ri, (rs : List[Term])) && (op_lt_lt(Fn((g : Num), (ss : List[Term])), ri) || Fn(g, ss) == ri)
      #|  (ss : List[Term])
      #|  (g : Num)
      #|  (s : Term)
      #|  (rs : List[Term])
      #|  (f : Num)
      #|  (r : Term)
      #|  (ts : List[Term])
      #|  (h : Num)
      #|  op_lt_lt((s : Term), (r : Term))
      #|  op_lt_lt(V((x : Num)), (s : Term))
      #|  (x : Num)
      #|  (t : Term)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 r : Term, \226\136\128 s : Term, \226\136\128 t : Term, termsize(r) + (termsize(s) + termsize(t)) == n && op_lt_lt(t, s) && op_lt_lt(s, r) \226\134\146 op_lt_lt(t, r)
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))
      #|  \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, op_lt_lt(s, t) && op_lt_lt(t, u) \226\134\146 op_lt_lt(s, u)
      #|  V((x : Num))
      #|  FVT(V((x : Num)))
      #|  (x : Num)
      #|  \226\136\128 f : Num, \226\136\128 args : List[Term], \226\136\128 a : Term, MEM(a, args) \226\134\146 op_lt_lt(a, Fn(f, args))
      #|  (a : Term)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, subterm(s, t) \226\134\146 s == t || op_lt_lt(s, t)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, psubterm(s, t) \226\134\146 op_lt_lt(s, t)
      #|  \226\136\128 i : (Num) -> Term, \226\136\128 s : Term, \226\136\128 t : Term, op_lt_lt(s, t) \226\134\146 op_lt_lt(termsubst(i, s), termsubst(i, t))
      #|  (largs : List[Term])
      #|  (largs : List[Term])
      #|  (u : Term)
      #|  APPEND((largs : List[Term]), CONS((t : Term), (rargs : List[Term])))
      #|  (f : Num)
      #|  (t : Term)
      #|  APPEND((largs : List[Term]), CONS((t : Term), (rargs : List[Term])))
      #|  (f : Num)
      #|  (t : Term)
      #|  (u : Term) == (s : Term)
      #|  (u : Term)
      #|  \226\136\128 s : Term, \226\136\128 t : Term, op_lt_lt(s, t) \226\134\146 op_lt_lt(Fn((f : Num), APPEND((largs : List[Term]), CONS(s, (rargs : List[Term])))), Fn(f, APPEND(largs, CONS(t, rargs))))
      #|  \226\136\128 t : Term, !op_lt_lt(t, t)
      #|  (n : Num) => (args : (Num) -> List[Term])((k : (Num) -> Num)(n))
      #|  (s : Term) => (t : Term) => SUBSET(functions_term(s), (A : ((Num, Num)) -> Bool)) && SUBSET(functions_term(t), A) && op_lt_lt(s, t)
      #|  (k : (Num) -> Num)(SUC((n : Num))) + (m : Num)
      #|  \226\136\128 n : Num, op_lt_lt((t : (Num) -> Term)(SUC(n)), t(n))
      #|  (k : (Num) -> Num)(SUC((n : Num))) + (m : Num)
      #|  (k : (Num) -> Num)(SUC((n : Num)))
      #|  (m : Num)
      #|  (r : Num) => if r == 0 { (a : Term) } else { (t : (Num) -> Term)((k : (Num) -> Num)(SUC((n : Num))) + r) }
      #|  (!(p : Bool) \226\134\146 !(q : Bool) && !(r : Bool)) == (q || r \226\134\146 p)
      #|  MEM((a : Term), (args : (Num) -> List[Term])((k : (Num) -> Num)((n : Num))))
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 !a || b
      #|  \226\136\128 n : Num, \226\136\128 a : Term, !(MEM(a, (args : (Num) -> List[Term])((k : (Num) -> Num)(n))) && (op_lt_lt(Fn((f : Num), args(k(SUC(n)))), a) || Fn(f, args(k(SUC(n)))) == a))
      #|  (n : Num)
      #|  \226\136\128 n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))
      #|  \226\136\128 a : Term, \226\136\128 n : Num, MEM(a, (args : (Num) -> List[Term])(n)) \226\134\146 SUBSET(functions_term(a), (A : ((Num, Num)) -> Bool))
      #|  (k : (Num) -> Num)(SUC((n : Num)))
      #|  (k : (Num) -> Num)((n : Num))
      #|  (n : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 op_lt_lt((t : (Num) -> Term)(n), t(m))
      #|  \226\136\128 n : Num, \226\136\128 d : Num, op_lt_lt((t : (Num) -> Term)(n + d), t(n)) || t(n + d) == t(n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 op_lt_lt((t : (Num) -> Term)(n), t(m)) || t(n) == t(m)
      #|  (k : (Num) -> Num)
      #|  (ar : Num)
      #|  (f : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))
      #|  (n : Num)
      #|  (A : ((Num, Num)) -> Bool)
      #|  \226\136\131 far : (Num, Num), \226\136\131 s : (Num) -> Num, subseq(s) && (\226\136\128 n : Num, ((fn_ : (Num) -> Num)(s(n)), LENGTH((args : (Num) -> List[Term])(s(n)))) == far)
      #|  (args : (Num) -> List[Term])
      #|  (fn_ : (Num) -> Num)
      #|  (u : Term)
      #|  (args : List[Term])
      #|  (f : Num)
      #|  (t : (Num) -> Term)((n : Num))
      #|  (n : Num)
      #|  \226\136\128 n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))
      #|  !((n : Num) == 0) \226\134\146 SUC(n - 1) == n
      #|  (u : Term)
      #|  (n : Num) - 1
      #|  (n : Num) == 0
      #|  (u : Term)
      #|  (n : Num) == 0
      #|  (u : Term)
      #|  (args : List[Term])
      #|  (f : Num)
      #|  (t : (Num) -> Term)((n : Num))
      #|  \226\136\128 n : Num, \226\136\131 f : Num, \226\136\131 args : List[Term], (t : (Num) -> Term)(n) == Fn(f, args) && ALL((t : Term) => !NONWF((s : Term) => (t : Term) => SUBSET(functions_term(s), (A : ((Num, Num)) -> Bool)) && SUBSET(functions_term(t), A) && op_lt_lt(s, t), t), args)
      #|  (t : (Num) -> Term)
      #|  termsize
      #|  \226\136\128 A : ((Num, Num)) -> Bool, FINITE(A) \226\134\146 WF((s : Term) => (t : Term) => SUBSET(functions_term(s), A) && SUBSET(functions_term(t), A) && op_lt_lt(s, t))
      #|  !((n : Num) == 0) \226\134\146 n == SUC(n - 1)
      #|  \226\136\128 t : Term, \226\136\128 s : Term, subterm(s, t) \226\134\146 !op_lt_lt(t, s)
      #|  (ts : List[Term])
      #|  (ts : List[Term])
      #|  (t : Term)
      #|  (ss : List[Term])
      #|  (s : Term)
      #|  \226\136\128 fargs : List[Term], \226\136\128 gargs : List[Term], LENGTH(fargs) == LENGTH(gargs) && (\226\136\128 fi : Term, \226\136\128 gi : Term, MEM(fi, fargs) && MEM(gi, gargs) \226\134\146 op_lt_lt(fi, gi) || op_lt_lt(gi, fi) || fi == gi) \226\134\146 LEX(op_lt_lt, fargs, gargs) || LEX(op_lt_lt, gargs, fargs) || fargs == gargs
      #|  LENGTH((gargs : List[Term]))
      #|  LENGTH((fargs : List[Term]))
      #|  (g : Num)
      #|  (f : Num)
      #|  (\226\136\131 a : Term, MEM(a, (fargs : List[Term])) && (op_lt_lt(Fn((g : Num), (gargs : List[Term])), a) || Fn(g, gargs) == a)) || !(\226\136\131 a : Term, MEM(a, fargs) && (op_lt_lt(Fn(g, gargs), a) || Fn(g, gargs) == a)) && (\226\136\128 a : Term, MEM(a, fargs) \226\134\146 op_lt_lt(a, Fn(g, gargs)))
      #|  (\226\136\131 a : Term, MEM(a, (gargs : List[Term])) && (op_lt_lt(Fn((f : Num), (fargs : List[Term])), a) || Fn(f, fargs) == a)) || !(\226\136\131 a : Term, MEM(a, gargs) && (op_lt_lt(Fn(f, fargs), a) || Fn(f, fargs) == a)) && (\226\136\128 a : Term, MEM(a, gargs) \226\134\146 op_lt_lt(a, Fn(f, fargs)))
      #|  ((a : Num) + (b : Num) < b + (c : Num)) == (a < c)
      #|  ((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == (b && a && c && d)
      #|  termsize(Fn((f : Num), (fargs : List[Term]))) + termsize(Fn((g : Num), (gargs : List[Term]))) == (n : Num)
      #|  (\226\136\128 fi : Term, MEM(fi, (fargs : List[Term])) \226\134\146 op_lt_lt(fi, Fn((g : Num), (gargs : List[Term]))) || op_lt_lt(Fn(g, gargs), fi) || fi == Fn(g, gargs)) && (\226\136\128 gi : Term, MEM(gi, gargs) \226\134\146 op_lt_lt(gi, Fn((f : Num), fargs)) || op_lt_lt(Fn(f, fargs), gi) || gi == Fn(f, fargs)) && (\226\136\128 fi : Term, \226\136\128 gi : Term, MEM(fi, fargs) && MEM(gi, gargs) \226\134\146 op_lt_lt(fi, gi) || op_lt_lt(gi, fi) || fi == gi)
      #|  (gargs : List[Term])
      #|  (g : Num)
      #|  (fargs : List[Term])
      #|  (f : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 s : Term, \226\136\128 t : Term, termsize(s) + termsize(t) == n && FVT(s) == {} && FVT(t) == {} \226\134\146 op_lt_lt(s, t) || op_lt_lt(t, s) || s == t
      #|  \226\136\128 s : Term, \226\136\128 t : Term, FVT(s) == {} && FVT(t) == {} \226\134\146 op_lt_lt(s, t) || op_lt_lt(t, s) || s == t
      #|ITLIST_ADD_1_POS =  |- (#forall:fun(fun(list(num),bool),bool) (\l:list(num). ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) (((#ITLIST:fun(fun(num,fun(num,num)),fun(list(num),fun(num,num))) #+:fun(num,fun(num,num))) l:list(num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|FVT_FUN_EMPTY =  |- (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) a:term) args:list(term))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))) #EMPTY:fun(num,bool)))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) a:term)) #EMPTY:fun(num,bool)))))))))
      #|NONWF =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (#?:fun(fun(fun(num,'A),bool),bool) (\s:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (s:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) a:'A)) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun('A,fun('A,bool)) (s:fun(num,'A) (#SUC:fun(num,num) n:num))) (s:fun(num,'A) n:num))))))))))))
      #|NONWF_SUCCESSOR =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) b:'A)) ((R:fun('A,fun('A,bool)) b:'A) a:'A))) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A))))))))
      #|WF_NONWF =  |- (#WF:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (#~:fun(bool,bool) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) y:'A))))))
      #|NONWF_INDUCT =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?1,bool),bool) (\a:'?1. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#NONWF:fun(fun('?1,fun('?1,bool)),fun('?1,bool)) R:fun('?1,fun('?1,bool))) a:'?1))) (#forall:fun(fun('?1,bool),bool) (\b:'?1. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('?1,fun('?1,bool)) b:'?1) a:'?1)) (P:fun('?1,bool) b:'?1)))))) (P:fun('?1,bool) a:'?1))))) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#NONWF:fun(fun('?1,fun('?1,bool)),fun('?1,bool)) R:fun('?1,fun('?1,bool))) x:'?1))) (P:fun('?1,bool) x:'?1)))))
      #|WF_MINIMAL_STEP =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\m:fun('A,num). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (#?:fun(fun('A,bool),bool) (\b:'A. ((#/\:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) b:'A)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) b:'A) a:'A)) (#forall:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) c:'A)) ((R:fun('A,fun('A,bool)) c:'A) a:'A))) ((#<=:fun(num,fun(num,bool)) (m:fun('A,num) b:'A)) (m:fun('A,num) c:'A))))))))))))))
      #|WF_MINIMAL_DCHAIN =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\m:fun('A,num). ((#=:fun(bool,fun(bool,bool)) (#WF:fun(fun('A,fun('A,bool)),bool) R:fun('A,fun('A,bool)))) (#~:fun(bool,bool) (#?:fun(fun(fun(num,'A),bool),bool) (\t:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((R:fun('A,fun('A,bool)) (t:fun(num,'A) (#SUC:fun(num,num) n:num))) (t:fun(num,'A) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) s:'A)) ((#<=:fun(num,fun(num,bool)) (m:fun('A,num) (t:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num)))) (m:fun('A,num) s:'A)))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\s:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) s:'A)) ((R:fun('A,fun('A,bool)) s:'A) (t:fun(num,'A) n:num)))) ((#<=:fun(num,fun(num,bool)) (m:fun('A,num) (t:fun(num,'A) (#SUC:fun(num,num) n:num)))) (m:fun('A,num) s:'A)))))))))))))))
      #|SEQUENCE_SUBSEQUENCE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) (P:fun('A,bool) (x:fun(num,'A) m:num)))))))) (#?:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun('A,bool) (x:fun(num,'A) (f:fun(num,num) n:num)))))))))))))
      #|SEQUENCE_PARTITION_LEMMA =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun('A,fun(fun('A,bool),bool)) (x:fun(num,'A) n:num)) s:fun('A,bool)))))) (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) f:fun(num,num))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (x:fun(num,'A) (f:fun(num,num) n:num))) a:'A)))))))))))))
      #|termsize_EXISTS =  |- (#?:fun(fun(fun(term,num),bool),bool) (\termsize:fun(term,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(num,fun(num,bool)) (termsize:fun(term,num) (#V:fun(num,term) x:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). ((#=:fun(num,fun(num,bool)) (termsize:fun(term,num) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))) (((#ITLIST:fun(fun(num,fun(num,num)),fun(list(num),fun(num,num))) #+:fun(num,fun(num,num))) ((#MAP:fun(fun(term,num),fun(list(term),list(num))) termsize:fun(term,num)) args:list(term))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|termsize =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(num,fun(num,bool)) (#termsize:fun(term,num) (#V:fun(num,term) x:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). ((#=:fun(num,fun(num,bool)) (#termsize:fun(term,num) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))) (((#ITLIST:fun(fun(num,fun(num,num)),fun(list(num),fun(num,num))) #+:fun(num,fun(num,num))) ((#MAP:fun(fun(term,num),fun(list(term),list(num))) #termsize:fun(term,num)) args:list(term))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|LEX_DEF =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?2,fun('?2,bool)),fun(list('?2),fun(list('?2),bool))) <<:fun('?2,fun('?2,bool))) #NIL:list('?2)) l:list('?2))) #F:bool)) ((#=:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?2,fun('?2,bool)),fun(list('?2),fun(list('?2),bool))) <<:fun('?2,fun('?2,bool))) ((#CONS:fun('?2,fun(list('?2),list('?2))) h:'?2) t:list('?2))) l:list('?2))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#=:fun(list('?2),fun(list('?2),bool)) l:list('?2)) #NIL:list('?2))) #F:bool) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((<<:fun('?2,fun('?2,bool)) h:'?2) (#HD:fun(list('?2),'?2) l:list('?2)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?2),num) t:list('?2))) (#LENGTH:fun(list('?2),num) (#TL:fun(list('?2),list('?2)) l:list('?2))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('?2,fun('?2,bool)) h:'?2) (#HD:fun(list('?2),'?2) l:list('?2)))) (((#LEX:fun(fun('?2,fun('?2,bool)),fun(list('?2),fun(list('?2),bool))) <<:fun('?2,fun('?2,bool))) t:list('?2)) (#TL:fun(list('?2),list('?2)) l:list('?2))))))))
      #|LEX =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?3,fun('?3,bool)),fun(list('?3),fun(list('?3),bool))) <<:fun('?3,fun('?3,bool))) #NIL:list('?3)) l:list('?3))) #F:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?3,fun('?3,bool)),fun(list('?3),fun(list('?3),bool))) <<:fun('?3,fun('?3,bool))) ((#CONS:fun('?3,fun(list('?3),list('?3))) h1:'?3) t1:list('?3))) #NIL:list('?3))) #F:bool)) ((#=:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?3,fun('?3,bool)),fun(list('?3),fun(list('?3),bool))) <<:fun('?3,fun('?3,bool))) ((#CONS:fun('?3,fun(list('?3),list('?3))) h1:'?3) t1:list('?3))) ((#CONS:fun('?3,fun(list('?3),list('?3))) h2:'?3) t2:list('?3)))) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((<<:fun('?3,fun('?3,bool)) h1:'?3) h2:'?3)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?3),num) t1:list('?3))) (#LENGTH:fun(list('?3),num) t2:list('?3)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('?3,fun('?3,bool)) h1:'?3) h2:'?3)) (((#LEX:fun(fun('?3,fun('?3,bool)),fun(list('?3),fun(list('?3),bool))) <<:fun('?3,fun('?3,bool))) t1:list('?3)) t2:list('?3)))))))
      #|LEX_LENGTH =  |- (#forall:fun(fun(list('?4),bool),bool) (\l1:list('?4). (#forall:fun(fun(list('?4),bool),bool) (\l2:list('?4). (#forall:fun(fun(fun('?4,fun('?4,bool)),bool),bool) (\R:fun('?4,fun('?4,bool)). ((#==>:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?4,fun('?4,bool)),fun(list('?4),fun(list('?4),bool))) R:fun('?4,fun('?4,bool))) l1:list('?4)) l2:list('?4))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?4),num) l1:list('?4))) (#LENGTH:fun(list('?4),num) l2:list('?4))))))))))
      #|MONO_LEX =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((S:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#==>:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('A,fun('A,bool)),fun(list('A),fun(list('A),bool))) R:fun('A,fun('A,bool))) x:list('A)) y:list('A))) (((#LEX:fun(fun('A,fun('A,bool)),fun(list('A),fun(list('A),bool))) S:fun('A,fun('A,bool))) x:list('A)) y:list('A))))
      #|LEX_MAP =  |- (#forall:fun(fun(list('?5),bool),bool) (\l1:list('?5). (#forall:fun(fun(list('?5),bool),bool) (\l2:list('?5). ((#==>:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?5,fun('?5,bool)),fun(list('?5),fun(list('?5),bool))) (\x:'?5. (\y:'?5. ((R:fun('?6,fun('?6,bool)) (f:fun('?5,'?6) x:'?5)) (f:fun('?5,'?6) y:'?5))))) l1:list('?5)) l2:list('?5))) (((#LEX:fun(fun('?6,fun('?6,bool)),fun(list('?6),fun(list('?6),bool))) R:fun('?6,fun('?6,bool))) ((#MAP:fun(fun('?5,'?6),fun(list('?5),list('?6))) f:fun('?5,'?6)) l1:list('?5))) ((#MAP:fun(fun('?5,'?6),fun(list('?5),list('?6))) f:fun('?5,'?6)) l2:list('?5))))))))
      #|LEX_REFL =  |- (#forall:fun(fun(fun('?7,fun('?7,bool)),bool),bool) (\R:fun('?7,fun('?7,bool)). (#forall:fun(fun(list('?7),bool),bool) (\l:list('?7). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?7,bool),bool) (\x:'?7. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('?7,fun(list('?7),bool)) x:'?7) l:list('?7))) (#~:fun(bool,bool) ((R:fun('?7,fun('?7,bool)) x:'?7) x:'?7)))))) (#~:fun(bool,bool) (((#LEX:fun(fun('?7,fun('?7,bool)),fun(list('?7),fun(list('?7),bool))) R:fun('?7,fun('?7,bool))) l:list('?7)) l:list('?7))))))))
      #|LEX_LENGTH_CHAIN =  |- (#forall:fun(fun(fun(num,list('?8)),bool),bool) (\lis:fun(num,list('?8)). (#forall:fun(fun(fun('?8,fun('?8,bool)),bool),bool) (\R:fun('?8,fun('?8,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (((#LEX:fun(fun('?8,fun('?8,bool)),fun(list('?8),fun(list('?8),bool))) R:fun('?8,fun('?8,bool))) (lis:fun(num,list('?8)) (#SUC:fun(num,num) n:num))) (lis:fun(num,list('?8)) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?8),num) (lis:fun(num,list('?8)) n:num))) (#LENGTH:fun(list('?8),num) (lis:fun(num,list('?8)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|WF_LEX_STRONG_INDUCT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,list('A)),bool),bool) (\lis:fun(num,list('A)). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) (lis:fun(num,list('A)) (#NUMERAL:fun(num,num) #_0:num)))) n:num)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) a:'A) (lis:fun(num,list('A)) n:num))) (#~:fun(bool,bool) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((#LEX:fun(fun('A,fun('A,bool)),fun(list('A),fun(list('A),bool))) R:fun('A,fun('A,bool))) (lis:fun(num,list('A)) (#SUC:fun(num,num) n:num))) (lis:fun(num,list('A)) n:num)))))))))))
      #|WF_LEX_STRONG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun(num,list('A)),bool),bool) (\lis:fun(num,list('A)). (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('A,fun(list('A),bool)) a:'A) (lis:fun(num,list('A)) n:num))) (#~:fun(bool,bool) ((#NONWF:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((#LEX:fun(fun('A,fun('A,bool)),fun(list('A),fun(list('A),bool))) R:fun('A,fun('A,bool))) (lis:fun(num,list('A)) (#SUC:fun(num,num) n:num))) (lis:fun(num,list('A)) n:num))))))))))
      #|LEX_RESTRICT =  |- (#forall:fun(fun(fun('?9,bool),bool),bool) (\P:fun('?9,bool). (#forall:fun(fun(fun('?9,fun('?9,bool)),bool),bool) (\R:fun('?9,fun('?9,bool)). (#forall:fun(fun(list('?9),bool),bool) (\l1:list('?9). (#forall:fun(fun(list('?9),bool),bool) (\l2:list('?9). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#LEX:fun(fun('?9,fun('?9,bool)),fun(list('?9),fun(list('?9),bool))) R:fun('?9,fun('?9,bool))) l1:list('?9)) l2:list('?9))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('?9,bool),bool) (\a:'?9. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('?9,fun(list('?9),bool)) a:'?9) l1:list('?9))) (P:fun('?9,bool) a:'?9))))) (#forall:fun(fun('?9,bool),bool) (\a:'?9. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('?9,fun(list('?9),bool)) a:'?9) l2:list('?9))) (P:fun('?9,bool) a:'?9))))))) (((#LEX:fun(fun('?9,fun('?9,bool)),fun(list('?9),fun(list('?9),bool))) (\x:'?9. (\y:'?9. ((#/\:fun(bool,fun(bool,bool)) (P:fun('?9,bool) x:'?9)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('?9,bool) y:'?9)) ((R:fun('?9,fun('?9,bool)) x:'?9) y:'?9)))))) l1:list('?9)) l2:list('?9)))))))))))
      #|subterm_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\t:term. ((#subterm:fun(term,fun(term,bool)) t:term) t:term)))) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) a:term)) ((#MEM:fun(term,fun(list(term),bool)) a:term) args:list(term)))) ((#subterm:fun(term,fun(term,bool)) s:term) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))))))))))))
      #|subterm_INDUCT =  |- (#forall:fun(fun(fun(term,fun(term,bool)),bool),bool) (\subterm':fun(term,fun(term,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\t:term. ((subterm':fun(term,fun(term,bool)) t:term) t:term)))) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\a:term. (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((subterm':fun(term,fun(term,bool)) s:term) a:term)) ((#MEM:fun(term,fun(list(term),bool)) a:term) args:list(term)))) ((subterm':fun(term,fun(term,bool)) s:term) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))))))))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#==>:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) a0:term) a1:term)) ((subterm':fun(term,fun(term,bool)) a0:term) a1:term)))))))))
      #|subterm_CASES =  |- (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) a0:term) a1:term)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a1:term) a0:term)) (#?:fun(fun(term,bool),bool) (\a:term. (#?:fun(fun(num,bool),bool) (\f:num. (#?:fun(fun(list(term),bool),bool) (\args:list(term). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a1:term) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) a0:term) a:term)) ((#MEM:fun(term,fun(list(term),bool)) a:term) args:list(term))))))))))))))))
      #|psubterm =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(bool,fun(bool,bool)) ((#psubterm:fun(term,fun(term,bool)) s:term) t:term)) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) s:term) t:term))))))))
      #|DESCENDANT_SMALLER =  |- (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) s:term) args:list(term))) ((#<:fun(num,fun(num,bool)) (#termsize:fun(term,num) s:term)) (#termsize:fun(term,num) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))))))))))
      #|DESCENDANT_DISTINCT =  |- (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). (#~:fun(bool,bool) ((#MEM:fun(term,fun(list(term),bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term))) args:list(term)))))))
      #|SUBTERM_REFL =  |- (#forall:fun(fun(term,bool),bool) (\t:term. ((#subterm:fun(term,fun(term,bool)) t:term) t:term)))
      #|SUBTERM_TRANS =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) ((#subterm:fun(term,fun(term,bool)) t:term) u:term))) ((#subterm:fun(term,fun(term,bool)) s:term) u:term))))))))
      #|SUBTERM_ANTISYM =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) ((#subterm:fun(term,fun(term,bool)) t:term) s:term))) ((#=:fun(term,fun(term,bool)) s:term) t:term))))))
      #|SUBTERM_FVT =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) ((#subterm:fun(term,fun(term,bool)) (#V:fun(num,term) x:num)) t:term))))))
      #|PSUBTERM_ANTISYM =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#psubterm:fun(term,fun(term,bool)) s:term) t:term)) ((#psubterm:fun(term,fun(term,bool)) t:term) s:term)))))))
      #|SUBTERM_PSUBTERM_TRANS =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) ((#psubterm:fun(term,fun(term,bool)) t:term) u:term))) ((#psubterm:fun(term,fun(term,bool)) s:term) u:term))))))))
      #|PSUBTERM_CASES =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(bool,fun(bool,bool)) ((#psubterm:fun(term,fun(term,bool)) s:term) t:term)) (#?:fun(fun(num,bool),bool) (\f:num. (#?:fun(fun(list(term),bool),bool) (\args:list(term). (#?:fun(fun(term,bool),bool) (\u:term. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) t:term) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) u:term) args:list(term))) ((#subterm:fun(term,fun(term,bool)) s:term) u:term))))))))))))))
      #|SUBTERM_INSTANTIATION =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) ((#subterm:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term)))))))))
      #|PSUBTERM_INSTANTIATION =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#psubterm:fun(term,fun(term,bool)) s:term) t:term)) ((#psubterm:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term)))))))))
      #|lpo_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) s:term))) (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) s:term) (#V:fun(num,term) x:num))))) ((#<<:fun(term,fun(term,bool)) (#V:fun(num,term) x:num)) s:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\fs:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(num,bool),bool) (\ft:num. (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). (#forall:fun(fun(term,bool),bool) (\si:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) si:term) sargs:list(term))) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) si:term)) ((#=:fun(term,fun(term,bool)) si:term) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term)))))) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\fs:num. (#forall:fun(fun(num,bool),bool) (\ft:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) fs:num) ft:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) fs:num) ft:num)) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list(term),num) sargs:list(term))) (#LENGTH:fun(list(term),num) targs:list(term)))))) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((#<<:fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))) targs:list(term)))) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))))))))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((#<<:fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term))))) targs:list(term))) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) #<<:fun(term,fun(term,bool))) targs:list(term)) sargs:list(term)))) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term)))))))))))))
      #|lpo_INDUCT =  |- (#forall:fun(fun(fun(term,fun(term,bool)),bool),bool) (\<<':fun(term,fun(term,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) s:term))) (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) s:term) (#V:fun(num,term) x:num))))) ((<<':fun(term,fun(term,bool)) (#V:fun(num,term) x:num)) s:term))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\fs:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(num,bool),bool) (\ft:num. (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). (#forall:fun(fun(term,bool),bool) (\si:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) si:term) sargs:list(term))) ((#\/:fun(bool,fun(bool,bool)) ((<<':fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) si:term)) ((#=:fun(term,fun(term,bool)) si:term) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term)))))) ((<<':fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\fs:num. (#forall:fun(fun(num,bool),bool) (\ft:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) fs:num) ft:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) fs:num) ft:num)) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list(term),num) sargs:list(term))) (#LENGTH:fun(list(term),num) targs:list(term)))))) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((<<':fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))) targs:list(term)))) ((<<':fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))))))))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\sargs:list(term). (#forall:fun(fun(list(term),bool),bool) (\targs:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((<<':fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term))))) targs:list(term))) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) <<':fun(term,fun(term,bool))) targs:list(term)) sargs:list(term)))) ((<<':fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) targs:list(term))) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term)))))))))))))) (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#==>:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) a0:term) a1:term)) ((<<':fun(term,fun(term,bool)) a0:term) a1:term)))))))))
      #|lpo_CASES =  |- (#forall:fun(fun(term,bool),bool) (\a0:term. (#forall:fun(fun(term,bool),bool) (\a1:term. ((#=:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) a0:term) a1:term)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) (#V:fun(num,term) x:num))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) a1:term))) (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) a1:term) (#V:fun(num,term) x:num)))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\fs:num. (#?:fun(fun(list(term),bool),bool) (\sargs:list(term). (#?:fun(fun(num,bool),bool) (\ft:num. (#?:fun(fun(list(term),bool),bool) (\targs:list(term). (#?:fun(fun(term,bool),bool) (\si:term. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a1:term) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) si:term) sargs:list(term))) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term))) si:term)) ((#=:fun(term,fun(term,bool)) si:term) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term)))))))))))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\fs:num. (#?:fun(fun(num,bool),bool) (\ft:num. (#?:fun(fun(list(term),bool),bool) (\sargs:list(term). (#?:fun(fun(list(term),bool),bool) (\targs:list(term). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) ((#Fn:fun(num,fun(list(term),term)) ft:num) targs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a1:term) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) fs:num) ft:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) fs:num) ft:num)) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list(term),num) sargs:list(term))) (#LENGTH:fun(list(term),num) targs:list(term)))))) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((#<<:fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) fs:num) sargs:list(term))))) targs:list(term)))))))))))))) (#?:fun(fun(num,bool),bool) (\f:num. (#?:fun(fun(list(term),bool),bool) (\sargs:list(term). (#?:fun(fun(list(term),bool),bool) (\targs:list(term). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a0:term) ((#Fn:fun(num,fun(list(term),term)) f:num) targs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) a1:term) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term)))) ((#/\:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(term,bool),fun(list(term),bool)) (\ti:term. ((#<<:fun(term,fun(term,bool)) ti:term) ((#Fn:fun(num,fun(list(term),term)) f:num) sargs:list(term))))) targs:list(term))) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) #<<:fun(term,fun(term,bool))) targs:list(term)) sargs:list(term)))))))))))))))))))
      #|LPO_CASES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) (#V:fun(num,term) x:num))) #F:bool)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) (#V:fun(num,term) x:num)) t:term)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term))) (#~:fun(bool,bool) ((#=:fun(term,fun(term,bool)) t:term) (#V:fun(num,term) x:num)))))))))) (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\fargs:list(term). (#forall:fun(fun(num,bool),bool) (\g:num. (#forall:fun(fun(list(term),bool),bool) (\gargs:list(term). ((#=:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) fargs:list(term))) ((#Fn:fun(num,fun(list(term),term)) g:num) gargs:list(term)))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(term,bool),bool) (\gi:term. ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) gi:term) gargs:list(term))) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) fargs:list(term))) gi:term)) ((#=:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) fargs:list(term))) gi:term)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\fi:term. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) fi:term) fargs:list(term))) ((#<<:fun(term,fun(term,bool)) fi:term) ((#Fn:fun(num,fun(list(term),term)) g:num) gargs:list(term))))))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) f:num) g:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) f:num) g:num)) ((#<:fun(num,fun(num,bool)) (#LENGTH:fun(list(term),num) fargs:list(term))) (#LENGTH:fun(list(term),num) gargs:list(term)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) f:num) g:num)) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) #<<:fun(term,fun(term,bool))) fargs:list(term)) gargs:list(term)))))))))))))))))
      #|LPO_FVT =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)) ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))))))
      #|LPO_TRANS_INDUCT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(term,bool),bool) (\r:term. (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#termsize:fun(term,num) r:term)) ((#+:fun(num,fun(num,num)) (#termsize:fun(term,num) s:term)) (#termsize:fun(term,num) t:term)))) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) t:term) s:term)) ((#<<:fun(term,fun(term,bool)) s:term) r:term)))) ((#<<:fun(term,fun(term,bool)) t:term) r:term))))))))))
      #|LPO_TRANS =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)) ((#<<:fun(term,fun(term,bool)) t:term) u:term))) ((#<<:fun(term,fun(term,bool)) s:term) u:term))))))))
      #|LPO_SUBTERM_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\f:num. (#forall:fun(fun(list(term),bool),bool) (\args:list(term). (#forall:fun(fun(term,bool),bool) (\a:term. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) a:term) args:list(term))) ((#<<:fun(term,fun(term,bool)) a:term) ((#Fn:fun(num,fun(list(term),term)) f:num) args:list(term))))))))))
      #|LPO_SUBTERM =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(term,fun(term,bool)) s:term) t:term)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)))))))
      #|LPO_PSUBTERM =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#psubterm:fun(term,fun(term,bool)) s:term) t:term)) ((#<<:fun(term,fun(term,bool)) s:term) t:term))))))
      #|LPO_INSTANTIATION =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)) ((#<<:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) i:fun(num,term)) t:term)))))))))
      #|LPO_CONGRUENCE =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)) ((#<<:fun(term,fun(term,bool)) ((#Fn:fun(num,fun(list(term),term)) f:num) ((#APPEND:fun(list(term),fun(list(term),list(term))) largs:list(term)) ((#CONS:fun(term,fun(list(term),list(term))) s:term) rargs:list(term))))) ((#Fn:fun(num,fun(list(term),term)) f:num) ((#APPEND:fun(list(term),fun(list(term),list(term))) largs:list(term)) ((#CONS:fun(term,fun(list(term),list(term))) t:term) rargs:list(term))))))))))
      #|LPO_REFL =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#~:fun(bool,bool) ((#<<:fun(term,fun(term,bool)) t:term) t:term))))
      #|LPO_WF =  |- (#forall:fun(fun(fun(prod(num,num),bool),bool),bool) (\A:fun(prod(num,num),bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(prod(num,num),bool),bool) A:fun(prod(num,num),bool))) (#WF:fun(fun(term,fun(term,bool)),bool) (\s:term. (\t:term. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_term:fun(term,fun(prod(num,num),bool)) s:term)) A:fun(prod(num,num),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(prod(num,num),bool),fun(fun(prod(num,num),bool),bool)) (#functions_term:fun(term,fun(prod(num,num),bool)) t:term)) A:fun(prod(num,num),bool))) ((#<<:fun(term,fun(term,bool)) s:term) t:term)))))))))
      #|LPO_SUBTERM_NOT =  |- (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) ((#subterm:fun(term,fun(term,bool)) s:term) t:term)) (#~:fun(bool,bool) ((#<<:fun(term,fun(term,bool)) t:term) s:term)))))))
      #|LEX_TOTAL =  |- (#forall:fun(fun(list(term),bool),bool) (\fargs:list(term). (#forall:fun(fun(list(term),bool),bool) (\gargs:list(term). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(term),num) fargs:list(term))) (#LENGTH:fun(list(term),num) gargs:list(term)))) (#forall:fun(fun(term,bool),bool) (\fi:term. (#forall:fun(fun(term,bool),bool) (\gi:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#MEM:fun(term,fun(list(term),bool)) fi:term) fargs:list(term))) ((#MEM:fun(term,fun(list(term),bool)) gi:term) gargs:list(term)))) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) fi:term) gi:term)) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) gi:term) fi:term)) ((#=:fun(term,fun(term,bool)) fi:term) gi:term)))))))))) ((#\/:fun(bool,fun(bool,bool)) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) #<<:fun(term,fun(term,bool))) fargs:list(term)) gargs:list(term))) ((#\/:fun(bool,fun(bool,bool)) (((#LEX:fun(fun(term,fun(term,bool)),fun(list(term),fun(list(term),bool))) #<<:fun(term,fun(term,bool))) gargs:list(term)) fargs:list(term))) ((#=:fun(list(term),fun(list(term),bool)) fargs:list(term)) gargs:list(term)))))))))
      #|LPO_GROUND_COMPLETE =  |- (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) s:term)) #EMPTY:fun(num,bool))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FVT:fun(term,fun(num,bool)) t:term)) #EMPTY:fun(num,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) s:term) t:term)) ((#\/:fun(bool,fun(bool,bool)) ((#<<:fun(term,fun(term,bool)) t:term) s:term)) ((#=:fun(term,fun(term,bool)) s:term) t:term))))))))
      #|types = retval/0 form/0 term/0 list_204827/0 multiset/1 metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = << psubterm subterm LEX termsize NONWF TRS Eqaxiom_Pred_imp Eqclauses Eqclause_Pred Eqclause_Func |--_scong |--_scchain |--_sachain |---- esubterms subtermss subtermsa subterms |--_cong |--_cchain |--_achain |--- |--_axiom |-- |- ibackchain iminmodel gbackchain conclusion hypotheses breakhorn minmodel falsify horn definite level_sem break_sem Sub_SEM Unused_SEM Used_SEM given_sem step_sem resolvents_sem allntresolvents_sem allresolvents_sem isaresolvent_sem semresproof2 semresproof posresproof propflip psemresproof pposresproof allpositive sresproof spresproof psresproof npresproof lresproof suffix lpresproof ppresproof level break_ Sub Unused Used given step insert incorporate replace resolvents allntresolvents allresolvents SUBSUMES subsumes tautologous FIRSTN isaresolvent resproof rename FVS instance_of interp presproof resolve ~~ positive negative clause literal atom renaming ismgu mgu Unifies unifier THE unifies unify CALLORDER CRIGHT MLEFT tpcases termcases SUB1 EQV istriv Exception FF TT _261822 _261821 _261820 _dest_retval _mk_retval CONFLICTFREE SOLVE SOLVEC rightsubst loopcheck LOOPFREE OCC DOWNFROM Eqaxioms Eqaxiom_Pred Eqaxiom_Func Varpairs normal uclose === herbrand_of_prop herbrand herbase LOWMOD term_of_num canon_of_prop prop_of_model canonical terms finsat psatisfiable psatisfies pholds SKOLEM specialize SKOMOD SKOMOD1 SKOLEMIZE form_of_num num_of_form num_of_term NUMLIST unbumpmod unbumpform unbumpterm bumpform bumpterm bumpmod Skopre Skolems Skolem1 Prenex Prenex_left Prenex_right PPAT size universal prenex qfree formsubst VARIANT SETMAX termsubst interpretation equivalent entails valid satisfiable satisfies hold holds termval valuation valmod BV FV FVT Pred Fun Dom language predicates functions predicates_form functions_form functions_term ?? <-> && || True Not !! --> Atom False _204991 _204990 _204989 _204988 _dest_form _mk_form Fn V _204947 _204831 _204830 _204829 _204828 _dest_term _mk_term _dest_list_204827 _mk_list_204827 LIST_UNION morder WFP mdiff munion msing mmember mempty multiplicity multiset JOINABLE LF TREE SN WN WCR CR NORMAL RELPOW INV RSTC STC RTC RSC TC SC RC ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 551
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?10
      #|counter_genvar = _613424:bool
      #|
    ),
  )
}
