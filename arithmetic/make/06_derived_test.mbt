// Arithmetic/derived.ml in its directory's load order: the test block of
// arithmetic/derived/derived_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Arithmetic_derived_ref.expected).

///|
test "Arithmetic/derived matches Arithmetic/derived.ml" {
  @testkit.release_output()
  @derived.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/rstc", "Library/prime", "Arithmetic/fol", "Arithmetic/definability",
      "Arithmetic/tarski", "Arithmetic/arithprov", "Arithmetic/godel", "Arithmetic/derived",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Arithmetic/derived")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("negativef", () => sthm(@derived.negativef()))
  log.attempt("negatef", () => sthm(@derived.negatef()))
  log.attempt("axiom_addimp", () => sthm(@derived.axiom_addimp()))
  log.attempt("axiom_distribimp", () => sthm(@derived.axiom_distribimp()))
  log.attempt("axiom_doubleneg", () => sthm(@derived.axiom_doubleneg()))
  log.attempt("axiom_allimp", () => sthm(@derived.axiom_allimp()))
  log.attempt("axiom_impall", () => sthm(@derived.axiom_impall()))
  log.attempt("axiom_existseq", () => sthm(@derived.axiom_existseq()))
  log.attempt("axiom_eqrefl", () => sthm(@derived.axiom_eqrefl()))
  log.attempt("axiom_funcong", () => sthm(@derived.axiom_funcong()))
  log.attempt("axiom_predcong", () => sthm(@derived.axiom_predcong()))
  log.attempt("axiom_iffimp1", () => sthm(@derived.axiom_iffimp1()))
  log.attempt("axiom_iffimp2", () => sthm(@derived.axiom_iffimp2()))
  log.attempt("axiom_impiff", () => sthm(@derived.axiom_impiff()))
  log.attempt("axiom_true", () => sthm(@derived.axiom_true()))
  log.attempt("axiom_not", () => sthm(@derived.axiom_not()))
  log.attempt("axiom_and", () => sthm(@derived.axiom_and()))
  log.attempt("axiom_or", () => sthm(@derived.axiom_or()))
  log.attempt("axiom_exists", () => sthm(@derived.axiom_exists()))
  log.attempt("assume", () => sthm(@derived.assume_()))
  log.attempt("modusponens", () => sthm(@derived.modusponens()))
  log.attempt("gen", () => sthm(@derived.gen()))
  log.attempt("iff_imp1", () => sthm(@derived.iff_imp1()))
  log.attempt("iff_imp2", () => sthm(@derived.iff_imp2()))
  log.attempt("imp_antisym", () => sthm(@derived.imp_antisym()))
  log.attempt("add_assum", () => sthm(@derived.add_assum()))
  log.attempt("imp_refl", () => sthm(@derived.imp_refl()))
  log.attempt("imp_add_assum", () => sthm(@derived.imp_add_assum()))
  log.attempt("imp_unduplicate", () => sthm(@derived.imp_unduplicate()))
  log.attempt("imp_trans", () => sthm(@derived.imp_trans()))
  log.attempt("imp_swap", () => sthm(@derived.imp_swap()))
  log.attempt("imp_trans_chain_2", () => sthm(@derived.imp_trans_chain_2()))
  log.attempt("imp_trans_th", () => sthm(@derived.imp_trans_th()))
  log.attempt("imp_add_concl", () => sthm(@derived.imp_add_concl()))
  log.attempt("imp_trans2", () => sthm(@derived.imp_trans2()))
  log.attempt("imp_swap_th", () => sthm(@derived.imp_swap_th()))
  log.attempt("contrapos", () => sthm(@derived.contrapos()))
  log.attempt("imp_truefalse", () => sthm(@derived.imp_truefalse()))
  log.attempt("imp_insert", () => sthm(@derived.imp_insert()))
  log.attempt("imp_mono_th", () => sthm(@derived.imp_mono_th()))
  log.attempt("ex_falso", () => sthm(@derived.ex_falso()))
  log.attempt("imp_contr", () => sthm(@derived.imp_contr()))
  log.attempt("imp_contrf", () => sthm(@derived.imp_contrf()))
  log.attempt("contrad", () => sthm(@derived.contrad()))
  log.attempt("bool_cases", () => sthm(@derived.bool_cases()))
  log.attempt("imp_false_rule", () => sthm(@derived.imp_false_rule()))
  log.attempt("imp_true_rule", () => sthm(@derived.imp_true_rule()))
  log.attempt("truth", () => sthm(@derived.truth()))
  log.attempt("and_left", () => sthm(@derived.and_left()))
  log.attempt("and_right", () => sthm(@derived.and_right()))
  log.attempt("and_pair", () => sthm(@derived.and_pair()))
  log.attempt("META_AND", () => sthm(@derived.meta_and()))
  log.attempt("shunt", () => sthm(@derived.shunt()))
  log.attempt("ante_conj", () => sthm(@derived.ante_conj()))
  log.attempt("not_not_false", () => sthm(@derived.not_not_false()))
  log.attempt("iff_sym", () => sthm(@derived.iff_sym()))
  log.attempt("iff_trans", () => sthm(@derived.iff_trans()))
  log.attempt("not_not", () => sthm(@derived.not_not()))
  log.attempt("contrapos_eq", () => sthm(@derived.contrapos_eq()))
  log.attempt("or_left", () => sthm(@derived.or_left()))
  log.attempt("or_right", () => sthm(@derived.or_right()))
  log.attempt("ante_disj", () => sthm(@derived.ante_disj()))
  log.attempt("iff_def", () => sthm(@derived.iff_def()))
  log.attempt("iff_refl", () => sthm(@derived.iff_refl()))
  log.attempt("eq_sym", () => sthm(@derived.eq_sym()))
  log.attempt("icongruence_general", () => sthm(@derived.icongruence_general()))
  log.attempt("icongruence", () => sthm(@derived.icongruence()))
  log.attempt("icongruence_var", () => sthm(@derived.icongruence_var()))
  log.attempt("gen_right", () => sthm(@derived.gen_right()))
  log.attempt("genimp", () => sthm(@derived.genimp()))
  log.attempt("eximp", () => sthm(@derived.eximp()))
  log.attempt("exists_imp", () => sthm(@derived.exists_imp()))
  log.attempt("subspec", () => sthm(@derived.subspec()))
  log.attempt("subalpha", () => sthm(@derived.subalpha()))
  log.attempt("complexity", () => sthm(@derived.complexity()))
  log.attempt("COMPLEXITY_FORMSUBST", () => {
    sthm(@derived.complexity_formsubst())
  })
  log.attempt("isubst_general", () => sthm(@derived.isubst_general()))
  log.attempt("isubst", () => sthm(@derived.isubst()))
  log.attempt("isubst_var", () => sthm(@derived.isubst_var()))
  log.attempt("alpha", () => sthm(@derived.alpha()))
  log.attempt("VARS", () => sthm(@derived.vars()))
  log.attempt("VARS_FINITE", () => sthm(@derived.vars_finite()))
  log.attempt("FV_SUBSET_VARS", () => sthm(@derived.fv_subset_vars()))
  log.attempt("TERMSUBST_TWICE_GENERAL", () => {
    sthm(@derived.termsubst_twice_general())
  })
  log.attempt("TERMSUBST_TWICE", () => sthm(@derived.termsubst_twice()))
  log.attempt("FORMSUBST_TWICE_GENERAL", () => {
    sthm(@derived.formsubst_twice_general())
  })
  log.attempt("FORMSUBST_TWICE", () => sthm(@derived.formsubst_twice()))
  log.attempt("ispec_lemma", () => sthm(@derived.ispec_lemma()))
  log.attempt("ispec", () => sthm(@derived.ispec()))
  log.attempt("spec", () => sthm(@derived.spec()))
  log.attempt("spec_var", () => sthm(@derived.spec_var()))
  log.attempt("instantiation", () => sthm(@derived.instantiation()))
  log.attempt("PROVES_MONO", () => sthm(@derived.proves_mono()))
  log.attempt("DEDUCTION_LEMMA", () => sthm(@derived.deduction_lemma()))
  log.attempt("DEDUCTION", () => sthm(@derived.deduction()))
  log.attempt("eq_trans", () => sthm(@derived.eq_trans()))
  log.attempt("spec_right", () => sthm(@derived.spec_right()))
  log.attempt("eq_trans_rule", () => sthm(@derived.eq_trans_rule()))
  log.attempt("eq_sym_rule", () => sthm(@derived.eq_sym_rule()))
  log.attempt("allimp", () => sthm(@derived.allimp()))
  log.attempt("alliff", () => sthm(@derived.alliff()))
  log.attempt("exiff", () => sthm(@derived.exiff()))
  log.attempt("cong_suc", () => sthm(@derived.cong_suc()))
  log.attempt("cong_add", () => sthm(@derived.cong_add()))
  log.attempt("cong_mul", () => sthm(@derived.cong_mul()))
  log.attempt("cong_eq", () => sthm(@derived.cong_eq()))
  log.attempt("cong_le", () => sthm(@derived.cong_le()))
  log.attempt("cong_lt", () => sthm(@derived.cong_lt()))
  log.attempt("iexists", () => sthm(@derived.iexists()))
  log.attempt("exists_intro", () => sthm(@derived.exists_intro()))
  log.attempt("impex", () => sthm(@derived.impex()))
  log.attempt("ichoose", () => sthm(@derived.ichoose()))
  log.attempt("eq_trans_imp", () => sthm(@derived.eq_trans_imp()))
  log.attempt("TERMSUBST_NUMERAL", () => sthm(@derived.termsubst_numeral()))
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
      #|0..0..1..2..5..9..18..29..46..solved at 69
      #|0..0..2..5..16..39..110..257..812..1900..6371..15397..solved at 73786
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..10..29..72..136..252..solved at 399
      #|0..0..3..7..34..71..140..239..376..589..884..1342..2020..2899..4314..6314..solved at 6476
      #|0..0..1..3..9..23..56..solved at 70
      #|0..0..3..6..solved at 10
      #|0..0..3..6..15..31..56..solved at 63
      #|0..0..0..solved at 3
      #|0..0..1..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..9..solved at 14
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..15..36..70..130..231..392..solved at 402
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..1..8..15..24..33..42..51..60..69..90..111..132..157..182..207..232..257..282..solved at 298
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..14..31..solved at 57
      #|0..0..0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..7..15..43..solved at 82
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..4..7..solved at 19
      #|0..0..0..2..4..7..solved at 18
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..8..solved at 15
      #|0..0..0..2..4..7..solved at 19
      #|0..0..2..6..16..29..solved at 56
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..27..52..102..202..solved at 325
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..6..solved at 14
      #|0..0..1..3..7..20..45..solved at 75
      #|0..0..1..3..8..23..54..123..238..469..solved at 609
      #|0..0..1..3..8..23..54..123..238..469..solved at 606
      #|0..0..solved at 2
      #|0..0..1..3..9..18..solved at 30
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..27..52..102..202..740..1705..4333..11356..29852..solved at 72918
      #|0..0..1..2..6..12..27..52..102..202..740..1705..4333..11356..29852..solved at 72109
      #|0..0..1..2..6..12..27..52..102..202..740..1705..4333..11356..29852..solved at 71299
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..27..52..102..202..solved at 519
      #|0..0..1..2..6..12..27..52..102..202..solved at 497
      #|0..0..1..3..6..solved at 14
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..6..17..44..80..131..204..285..solved at 413
      #|0..0..1..3..6..17..44..80..131..204..285..solved at 404
      #|0..0..1..3..6..17..44..80..131..204..285..solved at 395
      #|0..0..1..3..7..20..53..solved at 91
      #|0..0..1..3..8..23..62..139..291..570..solved at 785
      #|0..0..1..3..8..23..62..139..291..570..solved at 782
      #|0..0..1..3..8..23..62..139..291..570..solved at 779
      #|0..0..1..3..8..23..62..139..291..570..solved at 776
      #|0..0..1..3..7..20..52..107..solved at 175
      #|0..0..1..3..7..20..52..107..solved at 172
      #|0..0..solved at 2
      #|0..0..1..3..9..18..solved at 30
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..9..22..49..114..269..698..solved at 1005
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..2..5..11..25..53..92..solved at 116
      #|0..0..1..3..7..18..42..solved at 69
      #|0..0..1..3..8..21..51..113..224..442..solved at 572
      #|0..0..1..3..8..21..51..113..224..442..solved at 569
      #|0..0..2..solved at 5
      #|0..0..0..1..2..3..6..9..12..20..28..36..solved at 68
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..1..3..8..solved at 15
      #|0..0..1..5..12..solved at 22
      #|0..0..1..3..6..solved at 14
      #|0..0..1..3..6..solved at 12
      #|0..0..3..7..12..31..68..120..181..414..solved at 514
      #|0..0..3..7..12..31..68..120..181..414..solved at 475
      #|0..0..3..7..12..31..68..120..181..414..solved at 436
      #|0..0..1..3..7..20..53..solved at 97
      #|0..0..1..3..8..23..62..145..297..588..solved at 825
      #|0..0..1..3..8..23..62..145..297..588..solved at 822
      #|0..0..1..3..8..23..62..145..297..588..solved at 819
      #|0..0..1..3..8..23..62..145..297..588..solved at 816
      #|0..0..1..3..7..20..52..113..solved at 181
      #|0..0..1..3..6..17..44..87..solved at 134
      #|0..0..1..3..7..20..52..113..solved at 160
      #|0..0..1..3..7..20..52..113..solved at 178
      #|0..0..1..3..6..17..44..87..solved at 131
      #|0..0..1..3..7..20..52..113..solved at 157
      #|0..0..2..solved at 5
      #|0..0..0..1..2..3..6..9..12..20..28..36..solved at 68
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..12..17..29..42..63..111..183..299..639..solved at 952
      #|0..0..0..1..2..3..6..9..12..30..52..81..132..solved at 170
      #|0..0..1..2..3..7..12..17..29..42..63..111..183..299..639..solved at 952
      #|0..0..0..1..2..3..6..9..12..30..52..81..132..solved at 170
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..solved at 11
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..7..13..solved at 30
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 14
      #|0..0..0..0..0..0..0..0..solved at 8
      #|0..0..0..0..0..0..0..0..0..0..0..solved at 11
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..0..0..0..0..solved at 10
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 16
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 16
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 16
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 16
      #|0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..0..solved at 16
      #|0..0..0..0..0..0..0..0..solved at 8
      #|0..0..0..0..0..0..0..0..solved at 8
      #|0..0..0..0..0..0..0..0..0..0..0..0..solved at 12
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..0..0..0..0..solved at 7
      #|0..0..0..0..0..0..0..0..0..0..0..0..solved at 12
      #|0..0..0..0..0..0..0..0..0..0..0..solved at 11
      #|0..0..0..0..0..0..0..0..solved at 8
      #|0..0..0..1..2..3..10..19..solved at 29
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..7..11..15..solved at 27
      #|0..0..0..1..2..3..7..11..15..solved at 26
      #|0..0..0..1..3..9..26..68..149..401..864..2237..5032..13185..solved at 23398
      #|0..0..1..4..solved at 10
      #|0..0..1..3..6..16..solved at 24
      #|0..0..1..3..6..16..34..solved at 41
      #|0..0..1..3..8..22..52..115..221..solved at 302
      #|0..0..1..3..7..19..42..solved at 69
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..6..9..12..19..26..33..51..69..87..solved at 314
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..12..17..solved at 29
      #|0..0..1..2..solved at 6
      #|0..0..0..0..0..1..2..3..4..5..6..7..8..9..36..63..90..solved at 225
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..8..solved at 13
      #|0..0..1..4..8..solved at 16
      #|0..0..1..4..8..solved at 13
      #|0..0..1..4..8..solved at 16
      #|0..0..1..4..8..solved at 13
      #|0..0..1..4..8..solved at 16
      #|0..0..1..4..8..solved at 13
      #|0..0..1..4..8..solved at 16
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..6..14..solved at 22
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..8..18..solved at 26
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..3..6..9..12..21..30..39..48..57..66..81..96..111..solved at 125
      #|0..0..1..2..3..6..9..12..21..30..39..48..57..66..85..104..123..solved at 137
      #|0..0..1..2..3..6..9..12..21..30..39..48..57..66..85..104..123..solved at 137
      #|0..0..1..2..3..6..9..12..21..30..39..48..57..66..81..96..111..solved at 125
      #|0..0..1..4..8..18..30..147..400..925..4513..solved at 5401
      #|0..0..1..4..8..15..23..123..solved at 137
      #|0..0..1..4..8..15..23..123..solved at 137
      #|0..0..0..0..2..4..6..10..14..18..26..34..42..solved at 52
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..3..5..11..25..46..solved at 58
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..5..8..21..47..104..solved at 178
      #|0..0..2..5..8..21..46..100..solved at 169
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 12
      #|0..0..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 12
      #|0..0..2..solved at 8
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..2..7..solved at 12
      #|0..0..2..7..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..9..solved at 15
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..solved at 21
      #|0..0..1..3..8..solved at 16
      #|0..0..1..2..6..13..solved at 30
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..7..16..solved at 25
      #|0..0..1..3..9..21..46..95..solved at 135
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 13
      #|0..0..1..2..4..10..solved at 18
      #|0..0..1..2..6..solved at 11
      #|0..0..1..4..8..12..16..32..48..64..solved at 79
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..14..24..45..solved at 78
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..5..10..20..36..66..118..solved at 146
      #|0..0..2..solved at 5
      #|0..0..1..2..7..16..43..94..solved at 132
      #|0..0..1..3..6..11..solved at 22
      #|0..0..1..3..8..23..63..220..730..2422..8909..33165..122937..solved at 182005
      #|0..0..1..2..5..17..37..147..solved at 447
      #|0..0..1..2..5..solved at 13
      #|0..0..1..3..7..14..25..52..95..solved at 152
      #|0..0..1..3..7..14..25..50..solved at 73
      #|0..0..1..4..12..37..102..334..1051..solved at 1836
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..1..2..6..15..solved at 31
      #|0..0..1..2..4..9..solved at 17
      #|0..0..1..2..3..solved at 9
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..1..2..4..6..8..12..16..20..26..32..38..44..50..56..62..68..74..solved at 90
      #|0..0..1..2..6..11..21..36..61..97..185..311..569..946..solved at 1028
      #|0..0..1..4..8..12..16..32..48..64..solved at 78
      #|0..0..1..solved at 4
      #|0..0..1..3..6..11..17..33..54..84..solved at 99
      #|0..0..1..3..6..11..17..33..54..84..solved at 99
      #|0..0..1..6..20..65..176..446..1288..3364..8997..25977..solved at 55255
      #|0..0..1..2..4..6..8..10..12..14..16..18..20..solved at 72
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..14..28..89..solved at 176
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 9
      #|0..0..1..3..12..33..90..241..solved at 379
      #|0..0..1..3..12..33..90..241..solved at 379
      #|0..0..1..2..3..7..13..23..36..56..79..120..167..291..452..solved at 703
      #|0..0..2..5..12..27..53..113..solved at 154
      #|0..0..1..2..5..solved at 10
      #|0..0..1..4..8..12..16..32..48..64..111..solved at 131
      #|0..0..2..5..10..solved at 16
      #|0..0..2..4..solved at 8
      #|0..0..2..5..10..29..68..213..600..1825..solved at 2788
      #|0..0..2..4..7..12..18..solved at 28
      #|0..0..3..7..14..25..40..66..solved at 81
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 26
      #|0..0..1..2..3..solved at 26
      #|0..0..1..2..3..solved at 26
      #|0..0..1..5..14..28..46..86..158..260..solved at 284
      #|0..0..1..5..14..28..46..86..158..260..solved at 284
      #|0..0..1..5..14..28..46..86..158..260..solved at 284
      #|0..0..1..2..7..25..55..solved at 118
      #|0..0..1..5..14..28..46..86..158..260..solved at 284
      #|0..0..1..5..14..28..46..86..158..260..solved at 284
      #|0..0..1..7..18..34..54..96..170..274..solved at 298
      #|0..0..1..7..18..34..54..96..170..274..solved at 298
      #|0..0..1..7..18..34..54..96..170..274..solved at 298
      #|0..0..1..3..7..solved at 17
      #|0..0..2..6..14..solved at 25
      #|0..0..1..3..7..solved at 17
      #|0..0..2..6..14..solved at 25
      #|0..0..6..12..21..49..solved at 57
      #|0..0..6..14..25..55..solved at 63
      #|0..0..6..14..25..55..solved at 63
      #|0..0..6..14..25..55..solved at 63
      #|0..0..1..2..3..9..17..30..52..91..142..285..482..1028..1870..solved at 3863
      #|0..0..solved at 2
      #|0..0..2..5..10..20..solved at 26
      #|0..0..3..8..17..33..66..111..solved at 131
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..6..14..50..90..solved at 98
      #|0..0..3..10..24..93..172..553..1081..solved at 2005
      #|0..0..solved at 3
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..6..13..29..solved at 62
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..6..13..29..solved at 62
      #|0..0..2..5..12..32..68..145..315..681..1423..3328..7341..17722..41918..103569..solved at 103675
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..6..solved at 15
      #|0..0..3..solved at 9
      #|0..0..2..4..18..35..58..95..138..203..335..solved at 448
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..6..solved at 15
      #|0..0..3..solved at 9
      #|0..0..2..4..18..35..58..95..138..203..335..solved at 448
      #|0..0..3..6..solved at 19
      #|0..0..2..4..solved at 12
      #|0..0..3..6..solved at 19
      #|0..0..2..4..solved at 12
      #|0..0..solved at 3
      #|0..0..3..6..solved at 16
      #|0..0..solved at 2
      #|0..0..2..5..10..22..45..77..solved at 98
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..15..solved at 23
      #|0..0..solved at 2
      #|0..0..4..8..20..solved at 28
      #|0..0..4..8..20..solved at 28
      #|0..0..1..2..5..solved at 13
      #|0..0..2..4..10..solved at 25
      #|0..0..2..5..10..22..solved at 28
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..0..solved at 3
      #|0..0..1..2..6..11..18..31..44..57..81..105..136..solved at 209
      #|0..0..1..3..8..18..32..64..101..151..214..295..383..solved at 558
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..4..8..solved at 13
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 6
      #|0..0..1..5..solved at 12
      #|0..0..solved at 2
      #|0..0..1..5..solved at 11
      #|0..0..1..2..4..9..solved at 15
      #|0..0..2..4..7..17..30..50..solved at 60
      #|0..0..1..4..12..27..51..95..186..361..841..solved at 1585
      #|0..0..1..4..solved at 11
      #|0..0..1..3..11..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..9..solved at 15
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..4..6..8..14..20..26..solved at 35
      #|0..0..1..2..4..6..8..14..20..26..solved at 35
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..11..solved at 23
      #|0..0..1..2..4..11..solved at 23
      #|0..0..1..2..4..12..solved at 26
      #|0..0..1..2..4..12..26..76..162..464..solved at 1079
      #|0..0..1..2..4..12..solved at 26
      #|0..0..1..2..4..12..26..76..162..464..solved at 1079
      #|0..0..1..2..4..12..solved at 26
      #|0..0..1..2..4..12..26..76..162..464..solved at 1079
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..4..11..solved at 17
      #|Arithmetic/derived quotations (221):
      #|  (negativef : (Form) -> Bool)((p : Form)) == (\226\136\131 q : Form, p == op_minus_minus_gt(q, False))
      #|  (negatef : (Form) -> Form)((p : Form)) == (if negativef(p) { select((q : Form) => p == op_minus_minus_gt(q, False)) } else { op_minus_minus_gt(p, False) })
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, p)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, op_minus_minus_gt(p, q)), op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, !IN(x, FV(p)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, op_bang_bang(x, p)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 t : Term, !IN(x, FVT(t)) \226\134\146 op_bar_minus_minus(A, op_q_q(x, op_eq_eq_eq(V(x), t)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 t : Term, op_bar_minus_minus(A, op_eq_eq_eq(t, t))
      #|  (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(Suc(s), Suc(t))))) && (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_plus_plus(s, u), op_plus_plus(t, v)))))) && (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_star_star(s, u), op_star_star(t, v))))))
      #|  (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_eq_eq_eq(s, u), op_eq_eq_eq(t, v)))))) && (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt(s, u), op_lt_lt(t, v)))))) && (\226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt_eq(s, u), op_lt_lt_eq(t, v))))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(p, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(q, p)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(op_minus_minus_gt(q, p), op_lt_minus_gt(p, q))))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_lt_minus_gt(True, op_minus_minus_gt(False, False)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_lt_minus_gt(Not(p), op_minus_minus_gt(p, False)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(op_amp_amp(p, q), op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, False)), False)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(op_bar_bar(p, q), Not(op_amp_amp(Not(p), Not(q)))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, op_bar_minus_minus(A, op_lt_minus_gt(op_q_q(x, p), Not(op_bang_bang(x, Not(p)))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, IN(p, A) \226\134\146 op_bar_minus_minus(A, p)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, (q : Form))) && op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, q)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 x : Num, op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, op_bang_bang(x, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(q, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) && op_bar_minus_minus(A, op_minus_minus_gt(q, p)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(p, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, q) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(q, r)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(p, q))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) && op_bar_minus_minus(A, op_minus_minus_gt(q, (r : Form))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, r))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(q, op_minus_minus_gt(p, r)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q1 : Form, \226\136\128 q2 : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q1)) && op_bar_minus_minus(A, op_minus_minus_gt(p, q2)) && op_bar_minus_minus(A, op_minus_minus_gt(q1, op_minus_minus_gt(q2, r))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(q, r), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(q, r), op_minus_minus_gt(p, r)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, \226\136\128 s : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, r))) && op_bar_minus_minus(A, op_minus_minus_gt(r, s)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, s)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(q, op_minus_minus_gt(p, r))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(Not(q), Not(p)))
      #|  \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt(q, False), op_minus_minus_gt(p, op_minus_minus_gt(op_minus_minus_gt(p, q), False))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, r)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, r)))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt((p' : Form), (p : Form)), op_minus_minus_gt(op_minus_minus_gt((q : Form), (q' : Form)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q')))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(False, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : _, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, False), op_minus_minus_gt(p, (r : Form))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(negatef(p), r)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, False), p)) \226\134\146 op_bar_minus_minus(A, p)
      #|  \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(p, q)) && op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, False), q)) \226\134\146 op_bar_minus_minus(A, q)
      #|  \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt(q, False), op_minus_minus_gt(p, r))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, q), False), r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, False), r)) && op_bar_minus_minus(A, op_minus_minus_gt(q, r)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_minus_minus_gt(p, q), r))
      #|  \226\136\128 A : (Form) -> Bool, op_bar_minus_minus(A, True)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_amp_amp(p, q), p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_amp_amp(p, q), q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, op_amp_amp(p, q))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_amp_amp(p, q)) == (op_bar_minus_minus(A, p) && op_bar_minus_minus(A, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(op_amp_amp(p, q), r)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, r)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_minus_minus_gt(q, r))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_amp_amp(p, q), r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_lt_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) == op_bar_minus_minus(A, op_lt_minus_gt(q, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) && op_bar_minus_minus(A, op_lt_minus_gt(q, r)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(p, r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_lt_minus_gt(Not(Not(p)), p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(Not(p), Not(q))) == op_bar_minus_minus(A, op_minus_minus_gt(q, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(q, op_bar_bar(p, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, op_bar_bar(p, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 r : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, r)) && op_bar_minus_minus(A, op_minus_minus_gt(q, r)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bar_bar(p, q), r))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(op_lt_minus_gt(p, q), op_amp_amp(op_minus_minus_gt(p, q), op_minus_minus_gt(q, p))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(t, s)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : _, \226\136\128 x : Num, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 tm : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(termsubst(op_bar_minus_gt(x, s, (v : (Num) -> Term)), tm), termsubst(op_bar_minus_gt(x, t, v), tm))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 tm : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(termsubst(op_bar_eq_gt(x, s), tm), termsubst(op_bar_eq_gt(x, t), tm))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 tm : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(V(x), t), op_eq_eq_eq(tm, termsubst(op_bar_eq_gt(x, t), tm))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, !IN(x, FV(p)) && op_bar_minus_minus(A, op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, op_bang_bang(x, q)))
      #|  \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q)))
      #|  \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_q_q(x, p), op_q_q(x, q)))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt((q : Form), False), op_bang_bang((x : Num), Not(op_minus_minus_gt((p : Form), q)))), op_minus_minus_gt(op_minus_minus_gt(q, False), False)))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt((q : Form), False), op_minus_minus_gt(op_bang_bang((x : Num), (p : Form)), op_bang_bang(x, Not(op_minus_minus_gt(p, q))))))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_minus_minus_gt((q : Form), False), op_bang_bang((x : Num), op_minus_minus_gt((p : Form), Not(op_minus_minus_gt(p, q))))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_q_q(x, op_minus_minus_gt(p, q))) && !IN(x, FV(q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 p : Form, \226\136\128 q : Form, !IN(x, FVT(t)) && !IN(x, FV(q)) && op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(V(x), t), op_minus_minus_gt(p, q))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), q))
      #|  V((y : Num))
      #|  (x : Num) == (y : Num)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 p : Form, \226\136\128 q : Form, (x == y || !IN(x, FV(q)) && !IN(y, FV(p))) && op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(V(x), V(y)), op_minus_minus_gt(p, q))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(y, q)))
      #|  (complexity : (Form) -> Num)(False) == 1 && complexity(True) == 1 && (\226\136\128 s : Term, \226\136\128 t : Term, complexity(op_eq_eq_eq(s, t)) == 1) && (\226\136\128 s : Term, \226\136\128 t : Term, complexity(op_lt_lt(s, t)) == 1) && (\226\136\128 s : Term, \226\136\128 t : Term, complexity(op_lt_lt_eq(s, t)) == 1) && (\226\136\128 p : Form, complexity(Not(p)) == complexity(p) + 3) && (\226\136\128 p : Form, \226\136\128 q : Form, complexity(op_amp_amp(p, q)) == complexity(p) + (complexity(q) + 6)) && (\226\136\128 p : Form, \226\136\128 q : Form, complexity(op_bar_bar(p, q)) == complexity(p) + (complexity(q) + 16)) && (\226\136\128 p : Form, \226\136\128 q : Form, complexity(op_minus_minus_gt(p, q)) == complexity(p) + (complexity(q) + 1)) && (\226\136\128 p : Form, \226\136\128 q : Form, complexity(op_lt_minus_gt(p, q)) == 2 * (complexity(p) + complexity(q)) + 9) && (\226\136\128 x : Num, \226\136\128 p : Form, complexity(op_bang_bang(x, p)) == complexity(p) + 1) && (\226\136\128 x : Num, \226\136\128 p : Form, complexity(op_q_q(x, p)) == complexity(p) + 8)
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, complexity(formsubst(i, p)) == complexity(p)
      #|  (w : Num) == (u : Num)
      #|  (w : Num)
      #|  !IN((y : Num), FV(formsubst(op_bar_minus_gt((v : Num), (t : Term), (i : (Num) -> Term)), op_bang_bang((u : Num), (p : Form)))))
      #|  (z : Num) == (y : Num)
      #|  !IN((x : Num), FV(formsubst(op_bar_minus_gt((v : Num), (s : Term), (i : (Num) -> Term)), op_bang_bang((u : Num), (p : Form)))))
      #|  (z : Num) == (x : Num)
      #|  (z : Num)
      #|  UNION(FVT((s : Term)), UNION(FVT((t : Term)), UNION(FV(formsubst(op_bar_minus_gt((u : Num), V((x : Num)), op_bar_minus_gt((v : Num), s, (i : (Num) -> Term))), (p : Form))), FV(formsubst(op_bar_minus_gt(u, V((y : Num)), op_bar_minus_gt(v, t, i)), p)))))
      #|  op_bang_bang((z : Num), op_minus_minus_gt(formsubst(op_bar_minus_gt((v : Num), (s : Term), op_bar_minus_gt((u : Num), V(z), (i : (Num) -> Term))), (p : Form)), formsubst(op_bar_minus_gt(v, (t : Term), op_bar_minus_gt(u, V(z), i)), p)))
      #|  op_minus_minus_gt(op_bang_bang((z : Num), formsubst(op_bar_minus_gt((v : Num), (s : Term), op_bar_minus_gt((u : Num), V(z), (i : (Num) -> Term))), (p : Form))), op_bang_bang(z, formsubst(op_bar_minus_gt(v, (t : Term), op_bar_minus_gt(u, V(z), i)), p)))
      #|  (z : Num)
      #|  \226\136\131 z : Num, !IN(z, FVT((s : Term))) && !IN(z, FVT((t : Term))) && op_bar_minus_minus((A : (Form) -> Bool), op_minus_minus_gt(op_bang_bang((x : Num), formsubst(op_bar_minus_gt((u : Num), V(x), op_bar_minus_gt((v : Num), s, (i : (Num) -> Term))), (p : Form))), op_bang_bang(z, formsubst(op_bar_minus_gt(u, V(z), op_bar_minus_gt(v, s, i)), p)))) && op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(z, formsubst(op_bar_minus_gt(u, V(z), op_bar_minus_gt(v, t, i)), p)), op_bang_bang((y : Num), formsubst(op_bar_minus_gt(u, V(y), op_bar_minus_gt(v, t, i)), p))))
      #|  (w : Num) == (u : Num)
      #|  (w : Num)
      #|  !IN((y : Num), FV(formsubst(op_bar_minus_gt((v : Num), (t : Term), (i : (Num) -> Term)), op_bang_bang((u : Num), (p : Form)))))
      #|  !IN((x : Num), FV(formsubst(op_bar_minus_gt((v : Num), (s : Term), (i : (Num) -> Term)), op_bang_bang((u : Num), (p : Form)))))
      #|  (y : Num) == (x : Num)
      #|  (v : Num) == (u : Num)
      #|  !IN((x : Num), FV(formsubst(op_bar_minus_gt((v : Num), (s : Term), (i : (Num) -> Term)), op_bang_bang((u : Num), (p : Form))))) && !IN((y : Num), FV(formsubst(op_bar_minus_gt(v, (t : Term), i), op_bang_bang(u, p))))
      #|  (y : Num) == (if (\226\136\131 y : Num, IN(y, FV(op_bang_bang((u : Num), (p : Form)))) && IN(u, FVT(op_bar_minus_gt((v : Num), (t : Term), (i : (Num) -> Term), y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(u, V(u), op_bar_minus_gt(v, t, i)), p))) } else { u })
      #|  (x : Num) == (if (\226\136\131 y : Num, IN(y, FV(op_bang_bang((u : Num), (p : Form)))) && IN(u, FVT(op_bar_minus_gt((v : Num), (s : Term), (i : (Num) -> Term), y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(u, V(u), op_bar_minus_gt(v, s, i)), p))) } else { u })
      #|  (t : Term)
      #|  (s : Term)
      #|  (i : (Num) -> Term)
      #|  (v : Num)
      #|  ((a : Num) < (b : Num) + 1) == (a <= b)
      #|  (p : Form)
      #|  (u : Num)
      #|  Not(op_bang_bang((x : Num), Not((p : Form))))
      #|  (p : Form)
      #|  (x : Num)
      #|  op_amp_amp(op_minus_minus_gt((p : Form), (q : Form)), op_minus_minus_gt(q, p))
      #|  (q : Form)
      #|  (p : Form)
      #|  (p : Num) < p + ((q : Num) + 1) && q < p + (q + 1)
      #|  (q : Form)
      #|  (p : Form)
      #|  Not(op_amp_amp(Not((p : Form)), Not((q : Form))))
      #|  (q : Form)
      #|  (p : Form)
      #|  op_minus_minus_gt(op_minus_minus_gt((p : Form), op_minus_minus_gt((q : Form), False)), False)
      #|  (q : Form)
      #|  (p : Form)
      #|  op_minus_minus_gt((p : Form), False)
      #|  (p : Form)
      #|  (p : Form)
      #|  (p : Form)
      #|  complexity((p : Form))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 x : Num, \226\136\128 v : (Num) -> Term, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(formsubst(op_bar_minus_gt(x, s, v), p), formsubst(op_bar_minus_gt(x, t, v), p))))
      #|  (q : Form)
      #|  (p : Form)
      #|  op_eq((z : Num))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 x : Num, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(formsubst(op_bar_eq_gt(x, s), p), formsubst(op_bar_eq_gt(x, t), p))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 x : Num, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(V(x), t), op_minus_minus_gt(p, formsubst(op_bar_eq_gt(x, t), p))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 z : Num, \226\136\128 p : Form, !IN(z, FV(p)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(z, formsubst(op_bar_eq_gt(x, V(z)), p))))
      #|  (VARS : (Form, Num) -> Bool)(False) == {} && VARS(True) == {} && VARS(op_eq_eq_eq((s : Term), (t : Term))) == UNION(FVT(s), FVT(t)) && VARS(op_lt_lt(s, t)) == UNION(FVT(s), FVT(t)) && VARS(op_lt_lt_eq(s, t)) == UNION(FVT(s), FVT(t)) && VARS(Not((p : Form))) == VARS(p) && VARS(op_amp_amp(p, (q : Form))) == UNION(VARS(p), VARS(q)) && VARS(op_bar_bar(p, q)) == UNION(VARS(p), VARS(q)) && VARS(op_minus_minus_gt(p, q)) == UNION(VARS(p), VARS(q)) && VARS(op_lt_minus_gt(p, q)) == UNION(VARS(p), VARS(q)) && VARS(op_bang_bang((x : Num), p)) == INSERT(x, VARS(p)) && VARS(op_q_q(x, p)) == INSERT(x, VARS(p))
      #|  \226\136\128 p : Form, FINITE(VARS(p))
      #|  \226\136\128 p : Form, SUBSET(FV(p), VARS(p))
      #|  \226\136\128 x : Num, \226\136\128 z : Num, \226\136\128 t : Term, \226\136\128 v : (Num) -> Term, \226\136\128 s : Term, !IN(z, FVT(s)) \226\134\146 termsubst(op_bar_minus_gt(x, t, v), s) == termsubst(op_bar_minus_gt(z, t, v), termsubst(op_bar_eq_gt(x, V(z)), s))
      #|  \226\136\128 x : Num, \226\136\128 z : Num, \226\136\128 t : Term, \226\136\128 s : Term, !IN(z, FVT(s)) \226\134\146 termsubst(op_bar_eq_gt(x, t), s) == termsubst(op_bar_eq_gt(z, t), termsubst(op_bar_eq_gt(x, V(z)), s))
      #|  (w : Num)
      #|  (y : Num)
      #|  (z : Num) == VARIANT({(x' : Num) | \226\136\131 y : Num, IN(y, FV((p : Form))) && IN(x', FVT(op_bar_minus_gt((x : Num), V(x), o(termsubst((j : (Num) -> Term)), (i : (Num) -> Term)), y)))})
      #|  (y : Num) == (x : Num)
      #|  IN((y : Num), FV((p : Form)))
      #|  (y : Num)
      #|  (z : Num)
      #|  {(x' : Num) | \226\136\131 y : Num, (\226\136\131 y' : Num, IN(y', FV((p : Form))) && IN(y, FVT(op_bar_minus_gt((x : Num), V(x), (i : (Num) -> Term), y')))) && IN(x', FVT(op_bar_minus_gt(x, V(x), (j : (Num) -> Term), y)))} == {(x' : Num) | \226\136\131 y : Num, IN(y, FV(p)) && IN(x', FVT(op_bar_minus_gt(x, V(x), o(termsubst(j), i), y)))}
      #|  IN((x : Num), FVT((j : (Num) -> Term)((z : Num))))
      #|  (z : Num)
      #|  (y : Num) == (x : Num)
      #|  IN((y : Num), FV((p : Form)))
      #|  (y : Num)
      #|  (\226\136\131 y : Num, ((\226\136\131 y' : Num, IN(y', FV((p : Form))) && IN(y, FVT(op_bar_minus_gt((x : Num), V(x), (i : (Num) -> Term), y')))) && !(y == x)) && IN(x, FVT((j : (Num) -> Term)(y)))) == (\226\136\131 y : Num, (IN(y, FV(p)) && !(y == x)) && (\226\136\131 y' : Num, IN(y', FVT(i(y))) && IN(x, FVT(j(y')))))
      #|  (j : (Num) -> Term)
      #|  (i : (Num) -> Term)
      #|  (p : Form)
      #|  (x : Num)
      #|  ((p : Bool) || (q : Bool) \226\134\146 (r : Bool)) == ((p \226\134\146 r) && (q \226\134\146 r))
      #|  \226\136\128 p : Form, \226\136\128 i : (Num) -> Term, \226\136\128 j : (Num) -> Term, (\226\136\128 x : Num, IN(x, VARS(p)) \226\134\146 safe_for(x, i)) \226\134\146 formsubst(j, formsubst(i, p)) == formsubst(o(termsubst(j), i), p)
      #|  \226\136\128 z : Num, \226\136\128 p : Form, \226\136\128 x : Num, \226\136\128 t : Term, !IN(z, VARS(p)) \226\134\146 formsubst(op_bar_eq_gt(z, t), formsubst(op_bar_eq_gt(x, V(z)), p)) == formsubst(op_bar_eq_gt(x, t), p)
      #|  (t : Term)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 t : Term, !IN(x, FVT(t)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), formsubst(op_bar_eq_gt(x, t), p)))
      #|  formsubst(op_bar_eq_gt((x : Num), (t : Term)), (p : Form)) == formsubst(op_bar_eq_gt((z : Num), t), formsubst(op_bar_eq_gt(x, V(z)), p))
      #|  op_bang_bang((z : Num), formsubst(op_bar_eq_gt((x : Num), V(z)), (p : Form)))
      #|  (z : Num) == VARIANT(UNION(FVT((t : Term)), VARS((p : Form))))
      #|  IN((x : Num), FVT((t : Term)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 t : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), formsubst(op_bar_eq_gt(x, t), p)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 t : Term, op_bar_minus_minus(A, op_bang_bang(x, p)) \226\134\146 op_bar_minus_minus(A, formsubst(op_bar_eq_gt(x, t), p))
      #|  V((x : Num))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, op_bar_minus_minus(A, op_bang_bang(x, p)) \226\134\146 op_bar_minus_minus(A, p)
      #|  op_q_q((x : Num), op_eq_eq_eq(V(x), (v : (Num) -> Term)(x)))
      #|  (x : Num)
      #|  formsubst((v : (Num) -> Term), (p : Form)) == formsubst(op_bar_minus_gt((x : Num), v(x), v), p)
      #|  (x : Num)
      #|  op_bar_minus_gt((x : Num), V(x), (v : (Num) -> Term))
      #|  (p : Form)
      #|  (x : Num)
      #|  \226\136\128 x : Num, IN(x, FV((p : Form))) \226\134\146 (v : (Num) -> Term)(x) == V(x)
      #|  CARD({(x : Num) | IN(x, FV((p : Form))) && !((v : (Num) -> Term)(x) == V(x))})
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 v : (Num) -> Term, (\226\136\128 x : Num, \226\136\128 y : Num, IN(x, FV(p)) && IN(y, FV(p)) && IN(x, FVT(v(y))) \226\134\146 x == y && v(x) == V(x)) && op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, formsubst(v, p))
      #|  (x : Num) < (n : Num) && (y : Num) < n \226\134\146 !(x == y + n)
      #|  !(p : Bool) && (q : Bool) \226\134\146 ((r : Bool) || q \226\134\146 p) \226\134\146 (s : Bool)
      #|  (x : Num) + (n : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  {(x : _) | \226\136\131 y : _, IN(y, (s : (_) -> Bool)) && x == (f : (_) -> _)(y)} == IMAGE(f, s)
      #|  !((x : Num) + (n : Num) < n)
      #|  formsubst((v : (Num) -> Term), (p : Form)) == formsubst((i : Num) => v(i - (n : Num)), formsubst((i : Num) => V(i + n), p))
      #|  SUC(SETMAX(UNION(VARS((p : Form)), FV(formsubst((v : (Num) -> Term), p)))))
      #|  \226\136\131 n : Num, \226\136\128 x : Num, IN(x, VARS((p : Form))) || IN(x, FV(formsubst((v : (Num) -> Term), p))) \226\134\146 x < n
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 v : (Num) -> Term, \226\136\128 p : Form, op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(A, formsubst(v, p))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 B : (Form) -> Bool, \226\136\128 p : Form, SUBSET(A, B) && op_bar_minus_minus(A, p) \226\134\146 op_bar_minus_minus(B, p)
      #|  (r : Form)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(INSERT(p, A), q) && closed(p) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, q))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, closed(p) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, q)) == op_bar_minus_minus(INSERT(p, A), q)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(t, u), op_eq_eq_eq(s, u))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 p : Form, \226\136\128 q : Form, \226\136\128 x : Num, op_bar_minus_minus(A, op_minus_minus_gt(p, op_bang_bang(x, q))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(p, formsubst(op_bar_eq_gt(x, (t : Term)), q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(t, u)) \226\134\146 op_bar_minus_minus(A, op_eq_eq_eq(s, u))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) == op_bar_minus_minus(A, op_eq_eq_eq(t, s))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_lt_minus_gt(p, q)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(op_q_q(x, p), op_q_q(x, q)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) \226\134\146 op_bar_minus_minus(A, op_eq_eq_eq(Suc(s), Suc(t)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(u, v)) \226\134\146 op_bar_minus_minus(A, op_eq_eq_eq(op_plus_plus(s, u), op_plus_plus(t, v)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(u, v)) \226\134\146 op_bar_minus_minus(A, op_eq_eq_eq(op_star_star(s, u), op_star_star(t, v)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(u, v)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(op_eq_eq_eq(s, u), op_eq_eq_eq(t, v)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(u, v)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(op_lt_lt_eq(s, u), op_lt_lt_eq(t, v)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 s : Term, \226\136\128 t : Term, \226\136\128 u : Term, \226\136\128 v : Term, op_bar_minus_minus(A, op_eq_eq_eq(s, t)) && op_bar_minus_minus(A, op_eq_eq_eq(u, v)) \226\134\146 op_bar_minus_minus(A, op_lt_minus_gt(op_lt_lt(s, u), op_lt_lt(t, v)))
      #|  Not(formsubst(op_bar_eq_gt((x : Num), (t : Term)), Not((p : Form))))
      #|  Not(op_bang_bang((x : Num), Not((p : Form))))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 p : Form, op_bar_minus_minus(A, op_minus_minus_gt(formsubst(op_bar_eq_gt(x, t), p), op_q_q(x, p)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 t : Term, \226\136\128 p : Form, op_bar_minus_minus(A, formsubst(op_bar_eq_gt(x, t), p)) \226\134\146 op_bar_minus_minus(A, op_q_q(x, p))
      #|  Not(op_bang_bang((x : Num), Not((p : Form))))
      #|  Not(Not((p : Form)))
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, !IN(x, FV(p)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_q_q(x, p), p))
      #|  (x : Num)
      #|  \226\136\128 A : (Form) -> Bool, \226\136\128 x : Num, \226\136\128 p : Form, \226\136\128 q : Form, op_bar_minus_minus(A, op_bang_bang(x, op_minus_minus_gt(p, q))) && !IN(x, FV(q)) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_q_q(x, p), q))
      #|  op_bar_minus_minus((A : (Form) -> Bool), op_eq_eq_eq((s : Term), (s' : Term))) && op_bar_minus_minus(A, op_eq_eq_eq((t : Term), (t' : Term))) \226\134\146 op_bar_minus_minus(A, op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(s', t')))
      #|  \226\136\128 v : (Num) -> Term, \226\136\128 n : Num, termsubst(v, numeral(n)) == numeral(n)
      #|negativef =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(bool,fun(bool,bool)) (#negativef:fun(form,bool) p:form)) (#?:fun(fun(form,bool),bool) (\q:form. ((#=:fun(form,fun(form,bool)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form)))))))
      #|negatef =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(form,fun(form,bool)) (#negatef:fun(form,form) p:form)) (((#COND:fun(bool,fun(form,fun(form,form))) (#negativef:fun(form,bool) p:form)) (#@:fun(fun(form,bool),form) (\q:form. ((#=:fun(form,fun(form,bool)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form))))) ((#-->:fun(form,fun(form,form)) p:form) #False:form)))))
      #|axiom_addimp =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))))
      #|axiom_distribimp =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|axiom_doubleneg =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) #False:form)) p:form))))))
      #|axiom_allimp =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))))
      #|axiom_impall =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) p:form))))))))))
      #|axiom_existseq =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#??:fun(num,fun(form,form)) x:num) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term))))))))))
      #|axiom_eqrefl =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) t:term) t:term))))))
      #|axiom_funcong =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) (#Suc:fun(term,term) s:term)) (#Suc:fun(term,term) t:term))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#++:fun(term,fun(term,term)) s:term) u:term)) ((#++:fun(term,fun(term,term)) t:term) v:term)))))))))))))))) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#===:fun(term,fun(term,form)) ((#**:fun(term,fun(term,term)) s:term) u:term)) ((#**:fun(term,fun(term,term)) t:term) v:term)))))))))))))))))
      #|axiom_predcong =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) u:term)) ((#===:fun(term,fun(term,form)) t:term) v:term)))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<:fun(term,fun(term,form)) s:term) u:term)) ((#<<:fun(term,fun(term,form)) t:term) v:term)))))))))))))))) (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) u:term) v:term)) ((#-->:fun(form,fun(form,form)) ((#<<=:fun(term,fun(term,form)) s:term) u:term)) ((#<<=:fun(term,fun(term,form)) t:term) v:term)))))))))))))))))
      #|axiom_iffimp1 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|axiom_iffimp2 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))))
      #|axiom_impiff =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) p:form)) ((#<->:fun(form,fun(form,form)) p:form) q:form))))))))))
      #|axiom_true =  |- ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) #True:form) ((#-->:fun(form,fun(form,form)) #False:form) #False:form)))
      #|axiom_not =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)))))))
      #|axiom_and =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) #False:form))) #False:form)))))))))
      #|axiom_or =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#||:fun(form,fun(form,form)) p:form) q:form)) (#Not:fun(form,form) ((#&&:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form)))))))))))
      #|axiom_exists =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) (#Not:fun(form,form) ((#!!:fun(num,fun(form,form)) x:num) (#Not:fun(form,form) p:form)))))))))))
      #|assume =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(form,fun(fun(form,bool),bool)) p:form) A:fun(form,bool))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))))))
      #|modusponens =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) q:form))))))
      #|gen =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form)))))))))
      #|iff_imp1 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|iff_imp2 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))))
      #|imp_antisym =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|add_assum =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) q:form)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|imp_refl =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) p:form))))))
      #|imp_add_assum =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|imp_unduplicate =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) p:form) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|imp_trans =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) r:form)))))))))
      #|imp_swap =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|imp_trans_chain_2 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q1:form. (#forall:fun(fun(form,bool),bool) (\q2:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q1:form))) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q2:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q1:form) ((#-->:fun(form,fun(form,form)) q2:form) r:form)))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) r:form)))))))))))))
      #|imp_trans_th =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) r:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|imp_add_concl =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) r:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|imp_trans2 =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. (#forall:fun(fun(form,bool),bool) (\s:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) r:form) s:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) s:form))))))))))))))
      #|imp_swap_th =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))) ((#-->:fun(form,fun(form,form)) q:form) ((#-->:fun(form,fun(form,form)) p:form) r:form))))))))))))
      #|contrapos =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) (#Not:fun(form,form) q:form)) (#Not:fun(form,form) p:form))))))))))
      #|imp_truefalse =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) #False:form)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) #False:form))))))))
      #|imp_insert =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) r:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))))))))))))
      #|imp_mono_th =  |- ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p':form) p:form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) q':form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) p':form) q':form)))))
      #|ex_falso =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) #False:form) p:form))))))
      #|imp_contr =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun('?1,bool),bool) (\q:'?1. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form)))))))))
      #|imp_contrf =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) (#negatef:fun(form,form) p:form)) r:form)))))))))
      #|contrad =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))))))
      #|bool_cases =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) q:form))))))
      #|imp_false_rule =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) q:form) #False:form)) ((#-->:fun(form,fun(form,form)) p:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) #False:form)) r:form)))))))))
      #|imp_true_rule =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) r:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) r:form)))))))))))
      #|truth =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) #True:form)))
      #|and_left =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) p:form))))))))
      #|and_right =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) q:form))))))))
      #|and_pair =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) ((#&&:fun(form,fun(form,form)) p:form) q:form))))))))))
      #|META_AND =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) q:form)))))))))
      #|shunt =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) r:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form))))))))))))
      #|ante_conj =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#&&:fun(form,fun(form,form)) p:form) q:form)) r:form)))))))))))
      #|not_not_false =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) #False:form)) #False:form)) p:form))))))
      #|iff_sym =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) q:form) p:form)))))))))
      #|iff_trans =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) r:form)))))))))))
      #|not_not =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) (#Not:fun(form,form) (#Not:fun(form,form) p:form))) p:form))))))
      #|contrapos_eq =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) (#Not:fun(form,form) p:form)) (#Not:fun(form,form) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) p:form)))))))))
      #|or_left =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) ((#||:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|or_right =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#||:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|ante_disj =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(form,bool),bool) (\r:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) r:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) q:form) r:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#||:fun(form,fun(form,form)) p:form) q:form)) r:form)))))))))))
      #|iff_def =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#<->:fun(form,fun(form,form)) p:form) q:form)) ((#&&:fun(form,fun(form,form)) ((#-->:fun(form,fun(form,form)) p:form) q:form)) ((#-->:fun(form,fun(form,form)) q:form) p:form))))))))))
      #|iff_refl =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) p:form))))))
      #|eq_sym =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) t:term) s:term)))))))))
      #|icongruence_general =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun('?2,bool),bool) (\p:'?2. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\tm:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) ((#termsubst:fun(fun(num,term),fun(term,term)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) s:term) v:fun(num,term))) tm:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) t:term) v:fun(num,term))) tm:term))))))))))))))))
      #|icongruence =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\tm:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) s:term)) tm:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) tm:term))))))))))))))
      #|icongruence_var =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\tm:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term)) ((#===:fun(term,fun(term,form)) tm:term) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) tm:term))))))))))))
      #|gen_right =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))))
      #|genimp =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))
      #|eximp =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) ((#??:fun(num,fun(form,form)) x:num) q:form))))))))))
      #|exists_imp =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#??:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) q:form))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) q:form)))))))))))
      #|subspec =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) q:form)))))))))))))
      #|subalpha =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) y:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) q:form)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) y:num) (#FV:fun(form,fun(num,bool)) p:form)))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) (#V:fun(num,term) y:num))) ((#-->:fun(form,fun(form,form)) p:form) q:form))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) y:num) q:form))))))))))))))
      #|complexity =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) #False:form)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) #True:form)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#===:fun(term,fun(term,form)) s:term) t:term))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#<<:fun(term,fun(term,form)) s:term) t:term))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#<<=:fun(term,fun(term,form)) s:term) t:term))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) (#Not:fun(form,form) p:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) q:form)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) q:form)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) q:form)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) (#complexity:fun(form,num) q:form)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#??:fun(num,fun(form,form)) x:num) p:form))) ((#+:fun(num,fun(num,num)) (#complexity:fun(form,num) p:form)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))
      #|COMPLEXITY_FORMSUBST =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). ((#=:fun(num,fun(num,bool)) (#complexity:fun(form,num) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) (#complexity:fun(form,num) p:form))))))
      #|isubst_general =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) s:term) v:fun(num,term))) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) t:term) v:fun(num,term))) p:form))))))))))))))))
      #|isubst =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) s:term)) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form))))))))))))))
      #|isubst_var =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) (#V:fun(num,term) x:num)) t:term)) ((#-->:fun(form,fun(form,form)) p:form) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form))))))))))))
      #|alpha =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\z:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) z:num) (#FV:fun(form,fun(num,bool)) p:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) z:num) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) (#V:fun(num,term) z:num))) p:form)))))))))))))
      #|VARS =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) #False:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) #True:form)) #EMPTY:fun(num,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#<<:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#<<=:fun(term,fun(term,form)) s:term) t:term))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#FVT:fun(term,fun(num,bool)) s:term)) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) (#Not:fun(form,form) p:form))) (#VARS:fun(form,fun(num,bool)) p:form))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#&&:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#VARS:fun(form,fun(num,bool)) p:form)) (#VARS:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#||:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#VARS:fun(form,fun(num,bool)) p:form)) (#VARS:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#VARS:fun(form,fun(num,bool)) p:form)) (#VARS:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#UNION:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) (#VARS:fun(form,fun(num,bool)) p:form)) (#VARS:fun(form,fun(num,bool)) q:form)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) (#VARS:fun(form,fun(num,bool)) p:form)))) ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#VARS:fun(form,fun(num,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) x:num) (#VARS:fun(form,fun(num,bool)) p:form))))))))))))))
      #|VARS_FINITE =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#FINITE:fun(fun(num,bool),bool) (#VARS:fun(form,fun(num,bool)) p:form))))
      #|FV_SUBSET_VARS =  |- (#forall:fun(fun(form,bool),bool) (\p:form. ((#SUBSET:fun(fun(num,bool),fun(fun(num,bool),bool)) (#FV:fun(form,fun(num,bool)) p:form)) (#VARS:fun(form,fun(num,bool)) p:form))))
      #|TERMSUBST_TWICE_GENERAL =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\z:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) z:num) (#FVT:fun(term,fun(num,bool)) s:term)))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) x:num) t:term) v:fun(num,term))) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) (((#|->:fun(num,fun(term,fun(fun(num,term),fun(num,term)))) z:num) t:term) v:fun(num,term))) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) (#V:fun(num,term) z:num))) s:term))))))))))))))
      #|TERMSUBST_TWICE =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\z:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\s:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) z:num) (#FVT:fun(term,fun(num,bool)) s:term)))) ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) s:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) z:num) t:term)) ((#termsubst:fun(fun(num,term),fun(term,term)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) (#V:fun(num,term) z:num))) s:term))))))))))))
      #|FORMSUBST_TWICE_GENERAL =  |- (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(fun(num,term),bool),bool) (\i:fun(num,term). (#forall:fun(fun(fun(num,term),bool),bool) (\j:fun(num,term). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#VARS:fun(form,fun(num,bool)) p:form))) ((#safe_for:fun(num,fun(fun(num,term),bool)) x:num) i:fun(num,term)))))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) j:fun(num,term)) ((#formsubst:fun(fun(num,term),fun(form,form)) i:fun(num,term)) p:form))) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#o:fun(fun(term,term),fun(fun(num,term),fun(num,term))) (#termsubst:fun(fun(num,term),fun(term,term)) j:fun(num,term))) i:fun(num,term))) p:form)))))))))
      #|FORMSUBST_TWICE =  |- (#forall:fun(fun(num,bool),bool) (\z:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) z:num) (#VARS:fun(form,fun(num,bool)) p:form)))) ((#=:fun(form,fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) z:num) t:term)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) (#V:fun(num,term) z:num))) p:form))) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form)))))))))))
      #|ispec_lemma =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FVT:fun(term,fun(num,bool)) t:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form))))))))))))
      #|ispec =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(term,bool),bool) (\t:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form)))))))))))
      #|spec =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form)))))))))))
      #|spec_var =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#!!:fun(num,fun(form,form)) x:num) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))))))))
      #|instantiation =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) v:fun(num,term)) p:form)))))))))
      #|PROVES_MONO =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(fun(form,bool),bool),bool) (\B:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(form,bool),fun(fun(form,bool),bool)) A:fun(form,bool)) B:fun(form,bool))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) B:fun(form,bool)) p:form))))))))
      #|DEDUCTION_LEMMA =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) A:fun(form,bool))) q:form)) (#closed:fun(form,bool) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form)))))))))
      #|DEDUCTION =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) (#closed:fun(form,bool) p:form)) ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) ((#INSERT:fun(form,fun(fun(form,bool),fun(form,bool))) p:form) A:fun(form,bool))) q:form)))))))))
      #|eq_trans =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) t:term) u:term)) ((#===:fun(term,fun(term,form)) s:term) u:term))))))))))))
      #|spec_right =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#!!:fun(num,fun(form,form)) x:num) q:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) q:form))))))))))))
      #|eq_trans_rule =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) t:term) u:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) u:term)))))))))))
      #|eq_sym_rule =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#=:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) t:term) s:term)))))))))
      #|allimp =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))))
      #|alliff =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#!!:fun(num,fun(form,form)) x:num) p:form)) ((#!!:fun(num,fun(form,form)) x:num) q:form))))))))))))
      #|exiff =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) p:form) q:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) ((#??:fun(num,fun(form,form)) x:num) q:form))))))))))))
      #|cong_suc =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) (#Suc:fun(term,term) s:term)) (#Suc:fun(term,term) t:term))))))))))
      #|cong_add =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) u:term) v:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) ((#++:fun(term,fun(term,term)) s:term) u:term)) ((#++:fun(term,fun(term,term)) t:term) v:term))))))))))))))
      #|cong_mul =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) u:term) v:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) ((#**:fun(term,fun(term,term)) s:term) u:term)) ((#**:fun(term,fun(term,term)) t:term) v:term))))))))))))))
      #|cong_eq =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) u:term) v:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) u:term)) ((#===:fun(term,fun(term,form)) t:term) v:term))))))))))))))
      #|cong_le =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) u:term) v:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#<<=:fun(term,fun(term,form)) s:term) u:term)) ((#<<=:fun(term,fun(term,form)) t:term) v:term))))))))))))))
      #|cong_lt =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(term,bool),bool) (\s:term. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(term,bool),bool) (\u:term. (#forall:fun(fun(term,bool),bool) (\v:term. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) t:term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) u:term) v:term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#<->:fun(form,fun(form,form)) ((#<<:fun(term,fun(term,form)) s:term) u:term)) ((#<<:fun(term,fun(term,form)) t:term) v:term))))))))))))))
      #|iexists =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form)) ((#??:fun(num,fun(form,form)) x:num) p:form)))))))))))
      #|exists_intro =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(term,bool),bool) (\t:term. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#formsubst:fun(fun(num,term),fun(form,form)) ((#|=>:fun(num,fun(term,fun(num,term))) x:num) t:term)) p:form))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#??:fun(num,fun(form,form)) x:num) p:form)))))))))))
      #|impex =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) p:form)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) p:form)))))))))
      #|ichoose =  |- (#forall:fun(fun(fun(form,bool),bool),bool) (\A:fun(form,bool). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(form,bool),bool) (\p:form. (#forall:fun(fun(form,bool),bool) (\q:form. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#!!:fun(num,fun(form,form)) x:num) ((#-->:fun(form,fun(form,form)) p:form) q:form)))) (#~:fun(bool,bool) ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) (#FV:fun(form,fun(num,bool)) q:form))))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#??:fun(num,fun(form,form)) x:num) p:form)) q:form)))))))))))
      #|eq_trans_imp =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) s:term) s':term))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#===:fun(term,fun(term,form)) t:term) t':term)))) ((#|--:fun(fun(form,bool),fun(form,bool)) A:fun(form,bool)) ((#-->:fun(form,fun(form,form)) ((#===:fun(term,fun(term,form)) s:term) t:term)) ((#===:fun(term,fun(term,form)) s':term) t':term))))
      #|TERMSUBST_NUMERAL =  |- (#forall:fun(fun(fun(num,term),bool),bool) (\v:fun(num,term). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(term,fun(term,bool)) ((#termsubst:fun(fun(num,term),fun(term,term)) v:fun(num,term)) (#numeral:fun(num,term) n:num))) (#numeral:fun(num,term) n:num))))))
      #|types = form/0 term/0 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = VARS complexity negatef negativef consistent sound_for complete_for ground gsentence hsentence DELTA PI SIGMA sigmapi arith_prov arith_prov1 arith_axiom arith_freeform arith_freeform1 arith_freeterm arith_freeterm1 arith_form arith_form1 arith_term arith_term1 isaprove PROV PROV1 AXIOM isafform FREEFORM FREEFORM1 isafterm FREETERM FREETERM1 isagform FORM FORM1 isagterm TERM TERM1 ALLN definable definable_by fixpoint diagonalize arith_qdiag qdiag arith_gnumeral arith_gnumeral1' arith_gnumeral1 gnumeral gform gterm denumber number arith_primrec arith_primrecstep arith_rtcp RTCP arith_rtc arith_primepow arith_prime arith_divides arith_pair PSEQ primepow NPAIR closed numeral qsubst safe_for formsubst termsubst VARIANT SETMAX |-- axiom FV FVT |=> arithtrue holds termval |-> ?? !! <-> --> || && Not <<= << === True False _132768 _132767 _132766 _132765 _132764 _132763 _132762 _132761 _132760 _132759 _132758 _132757 _dest_form _mk_form ** ++ Suc V Z _132631 _132630 _132629 _132628 _132627 _dest_term _mk_term index RELPOW INV RSTC STC RTC RSC TC SC RC superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 392
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|counter_genvar = _183918:bool
      #|
    ),
  )
}
