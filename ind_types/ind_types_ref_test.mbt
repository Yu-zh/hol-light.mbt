// Load-fidelity test for ind_types.ml: replays tools/ocaml_ref/ind_types_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "ind_types matches ind_types.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("ind_types")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("INJ_INVERSE2", () => sthm(@ind_types.inj_inverse2()))
  log.attempt("NUMPAIR", () => sthm(@ind_types.numpair()))
  log.attempt("NUMPAIR_INJ_LEMMA", () => sthm(@ind_types.numpair_inj_lemma()))
  log.attempt("NUMPAIR_INJ", () => sthm(@ind_types.numpair_inj()))
  log.attempt("NUMPAIR_DEST", () => sthm(@ind_types.numpair_dest()))
  log.attempt("NUMSUM", () => sthm(@ind_types.numsum()))
  log.attempt("NUMSUM_INJ", () => sthm(@ind_types.numsum_inj()))
  log.attempt("NUMSUM_DEST", () => sthm(@ind_types.numsum_dest()))
  log.attempt("INJN", () => sthm(@ind_types.injn()))
  log.attempt("INJN_INJ", () => sthm(@ind_types.injn_inj()))
  log.attempt("INJA", () => sthm(@ind_types.inja()))
  log.attempt("INJA_INJ", () => sthm(@ind_types.inja_inj()))
  log.attempt("INJF", () => sthm(@ind_types.injf()))
  log.attempt("INJF_INJ", () => sthm(@ind_types.injf_inj()))
  log.attempt("INJP", () => sthm(@ind_types.injp()))
  log.attempt("INJP_INJ", () => sthm(@ind_types.injp_inj()))
  log.attempt("ZCONSTR", () => sthm(@ind_types.zconstr()))
  log.attempt("ZBOT", () => sthm(@ind_types.zbot()))
  log.attempt("ZCONSTR_ZBOT", () => sthm(@ind_types.zconstr_zbot()))
  log.attempt("ZRECSPACE_RULES", () => sthm(@ind_types.zrecspace_rules()))
  log.attempt("ZRECSPACE_INDUCT", () => sthm(@ind_types.zrecspace_induct()))
  log.attempt("ZRECSPACE_CASES", () => sthm(@ind_types.zrecspace_cases()))
  log.attempt("BOTTOM", () => sthm(@ind_types.bottom()))
  log.attempt("CONSTR", () => sthm(@ind_types.constr()))
  log.attempt("MK_REC_INJ", () => sthm(@ind_types.mk_rec_inj()))
  log.attempt("DEST_REC_INJ", () => sthm(@ind_types.dest_rec_inj()))
  log.attempt("CONSTR_BOT", () => sthm(@ind_types.constr_bot()))
  log.attempt("CONSTR_INJ", () => sthm(@ind_types.constr_inj()))
  log.attempt("CONSTR_IND", () => sthm(@ind_types.constr_ind()))
  log.attempt("CONSTR_REC", () => sthm(@ind_types.constr_rec()))
  log.attempt("FCONS", () => sthm(@ind_types.fcons()))
  log.attempt("FCONS_UNDO", () => sthm(@ind_types.fcons_undo()))
  log.attempt("FNIL", () => sthm(@ind_types.fnil()))
  log.attempt("sum_INDUCT", () => sthm(@ind_types.sum_induct()))
  log.attempt("sum_RECURSION", () => sthm(@ind_types.sum_recursion()))
  log.attempt("OUTL", () => sthm(@ind_types.outl()))
  log.attempt("OUTR", () => sthm(@ind_types.outr()))
  log.attempt("option_INDUCT", () => sthm(@ind_types.option_induct()))
  log.attempt("option_RECURSION", () => sthm(@ind_types.option_recursion()))
  log.attempt("list_INDUCT", () => sthm(@ind_types.list_induct()))
  log.attempt("list_RECURSION", () => sthm(@ind_types.list_recursion()))
  log.attempt("FORALL_OPTION_THM", () => sthm(@ind_types.forall_option_thm()))
  log.attempt("EXISTS_OPTION_THM", () => sthm(@ind_types.exists_option_thm()))
  log.attempt("option_DISTINCT", () => sthm(@ind_types.option_distinct()))
  log.attempt("option_INJ", () => sthm(@ind_types.option_inj()))
  log.attempt("ISO", () => sthm(@ind_types.iso()))
  log.attempt("ISO_REFL", () => sthm(@ind_types.iso_refl()))
  log.attempt("ISO_FUN", () => sthm(@ind_types.iso_fun()))
  log.attempt("ISO_USAGE", () => sthm(@ind_types.iso_usage()))
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
  log.attempt("deftype_tree", () => {
    let (a, b) = @ind_types.define_type("tree = Leaf num | Node tree tree")
    sthm(a) + " ;; " + sthm(b)
  })
  log.attempt("deftype_nested", () => {
    let (a, b) = @ind_types.define_type("rose = Rose num (rose list)")
    sthm(a) + " ;; " + sthm(b)
  })
  log.attempt("deftype_mutual", () => {
    let (a, b) = @ind_types.define_type(
      "even_t = Ez | Es odd_t ; odd_t = Os even_t",
    )
    sthm(a) + " ;; " + sthm(b)
  })
  // END EXTRA
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  @testkit.check_axioms()
  inspect(
    log.contents(),
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
      #|ind_types quotations (97):
      #|  (z : C) => select((y : B) => \226\136\131 x : A, (P : (A, B) -> C)(x, y) == z)
      #|  (z : C) => select((x : A) => \226\136\131 y : B, (P : (A, B) -> C)(x, y) == z)
      #|  \226\136\128 P : (A, B) -> C, (\226\136\128 x1 : A, \226\136\128 y1 : B, \226\136\128 x2 : A, \226\136\128 y2 : B, (P(x1, y1) == P(x2, y2)) == (x1 == x2 && y1 == y2)) \226\134\146 (\226\136\131 X : (C) -> A, \226\136\131 Y : (C) -> B, \226\136\128 x : A, \226\136\128 y : B, X(P(x, y)) == x && Y(P(x, y)) == y)
      #|  (NUMPAIR : (Num, Num) -> Num)((x : Num), (y : Num)) == EXP(2, x) * (2 * y + 1)
      #|  EVEN
      #|  \226\136\128 x1 : Num, \226\136\128 y1 : Num, \226\136\128 x2 : Num, \226\136\128 y2 : Num, NUMPAIR(x1, y1) == NUMPAIR(x2, y2) \226\134\146 x1 == x2
      #|  \226\136\128 x1 : Num, \226\136\128 y1 : Num, \226\136\128 x2 : Num, \226\136\128 y2 : Num, (NUMPAIR(x1, y1) == NUMPAIR(x2, y2)) == (x1 == x2 && y1 == y2)
      #|  (NUMSUM : (Bool, Num) -> Num)((b : Bool), (x : Num)) == (if b { SUC(2 * x) } else { 2 * x })
      #|  \226\136\128 b1 : Bool, \226\136\128 x1 : Num, \226\136\128 b2 : Bool, \226\136\128 x2 : Num, (NUMSUM(b1, x1) == NUMSUM(b2, x2)) == (b1 == b2 && x1 == x2)
      #|  EVEN
      #|  (INJN : (Num, Num, A) -> Bool)((m : Num)) == ((n : Num) => (a : A) => n == m)
      #|  (a : A)
      #|  (n1 : Num)
      #|  \226\136\128 n1 : Num, \226\136\128 n2 : Num, ((INJN : (Num, Num, A) -> Bool)(n1) == (INJN : (Num, Num, A) -> Bool)(n2)) == (n1 == n2)
      #|  (INJA : (A, Num, A) -> Bool)((a : A)) == ((n : Num) => (b : A) => b == a)
      #|  (a1 : A)
      #|  \226\136\128 a1 : A, \226\136\128 a2 : A, (INJA(a1) == INJA(a2)) == (a1 == a2)
      #|  (INJF : ((Num, Num, A) -> Bool, Num, A) -> Bool)((f : (Num, Num, A) -> Bool)) == ((n : Num) => f(NUMFST(n), NUMSND(n)))
      #|  NUMPAIR((n : Num), (m : Num))
      #|  (a : A)
      #|  (a : A)
      #|  (m : Num)
      #|  (n : Num)
      #|  \226\136\128 f1 : (Num, Num, A) -> Bool, \226\136\128 f2 : (Num, Num, A) -> Bool, (INJF(f1) == INJF(f2)) == (f1 == f2)
      #|  (INJP : ((Num, A) -> Bool, (Num, A) -> Bool, Num, A) -> Bool)((f1 : (Num, A) -> Bool), (f2 : (Num, A) -> Bool)) == ((n : Num) => (a : A) => if NUMLEFT(n) { f1(NUMRIGHT(n), a) } else { f2(NUMRIGHT(n), a) })
      #|  NUMSUM((b : Bool), (n : Num))
      #|  (b : Bool)
      #|  (n : Num)
      #|  \226\136\128 f1 : (Num, A) -> Bool, \226\136\128 f1' : (Num, A) -> Bool, \226\136\128 f2 : (Num, A) -> Bool, \226\136\128 f2' : (Num, A) -> Bool, (INJP(f1, f2) == INJP(f1', f2')) == (f1 == f1' && f2 == f2')
      #|  false
      #|  true
      #|  (ZCONSTR : (Num, A, (Num, Num, A) -> Bool, Num, A) -> Bool)((c : Num), (i : A), (r : (Num, Num, A) -> Bool)) == INJP(INJN(SUC(c)), INJP(INJA(i), INJF(r)))
      #|  (ZBOT : (Num, A) -> Bool) == INJP(INJN(0), select((z : (Num, A) -> Bool) => true))
      #|  \226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num, Num, A) -> Bool, !(ZCONSTR(c, i, r) == ZBOT)
      #|  (ZRECSPACE : ((Num, A) -> Bool) -> Bool)(ZBOT) && (\226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num, Num, A) -> Bool, (\226\136\128 n : Num, ZRECSPACE(r(n))) \226\134\146 ZRECSPACE(ZCONSTR(c, i, r)))
      #|  (BOTTOM : Recspace[A]) == _mk_rec(ZBOT)
      #|  (CONSTR : (Num, A, (Num) -> Recspace[A]) -> Recspace[A])((c : Num), (i : A), (r : (Num) -> Recspace[A])) == _mk_rec(ZCONSTR(c, i, (n : Num) => _dest_rec(r(n))))
      #|  \226\136\128 x : (Num, A) -> Bool, \226\136\128 y : (Num, A) -> Bool, _mk_rec(x) == _mk_rec(y) \226\134\146 ZRECSPACE(x) && ZRECSPACE(y) \226\134\146 x == y
      #|  (_mk_rec : ((Num, A) -> Bool) -> Recspace[A])
      #|  \226\136\128 x : Recspace[A], \226\136\128 y : Recspace[A], (_dest_rec(x) == _dest_rec(y)) == (x == y)
      #|  \226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num) -> Recspace[A], !(CONSTR(c, i, r) == BOTTOM)
      #|  \226\136\128 c1 : Num, \226\136\128 i1 : A, \226\136\128 r1 : (Num) -> Recspace[A], \226\136\128 c2 : Num, \226\136\128 i2 : A, \226\136\128 r2 : (Num) -> Recspace[A], (CONSTR(c1, i1, r1) == CONSTR(c2, i2, r2)) == (c1 == c2 && i1 == i2 && r1 == r2)
      #|  ((a : Bool) \226\134\146 a && (b : Bool)) == (a \226\134\146 b)
      #|  _dest_rec((x : Recspace[A]))
      #|  (z : (Num, A) -> Bool) => ZRECSPACE(z) && (P : (Recspace[A]) -> Bool)(_mk_rec(z))
      #|  \226\136\128 P : (Recspace[A]) -> Bool, P(BOTTOM) && (\226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num) -> Recspace[A], (\226\136\128 n : Num, P(r(n))) \226\134\146 P(CONSTR(c, i, r))) \226\134\146 (\226\136\128 x : Recspace[A], P(x))
      #|  (fn_ : (Recspace[A]) -> B)
      #|  (fn_ : (Recspace[A]) -> B)
      #|  (w : Num)
      #|  (w : Num)
      #|  (y : (Num) -> B)
      #|  (Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B)((c : Num), (i : A), (r : (Num) -> Recspace[A]), (y : (Num) -> B))
      #|  (y : (Num) -> B)
      #|  \226\136\128 x : Recspace[A], existsunique((y : B) => (Z : (Recspace[A], B) -> Bool)(x, y))
      #|  (Z : (Recspace[A], B) -> Bool)(BOTTOM, (b : B)) && (\226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num) -> Recspace[A], \226\136\128 y : (Num) -> B, (\226\136\128 n : Num, Z(r(n), y(n))) \226\134\146 Z(CONSTR(c, i, r), (Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B)(c, i, r, y)))
      #|  \226\136\128 Fn : (Num, A, (Num) -> Recspace[A], (Num) -> B) -> B, \226\136\131 f : (Recspace[A]) -> B, \226\136\128 c : Num, \226\136\128 i : A, \226\136\128 r : (Num) -> Recspace[A], f(CONSTR(c, i, r)) == Fn(c, i, r, (n : Num) => f(r(n)))
      #|  (\226\136\128 a : A, \226\136\128 f : (Num) -> A, (FCONS : (A, (Num) -> A, Num) -> A)(a, f, 0) == a) && (\226\136\128 a : A, \226\136\128 f : (Num) -> A, \226\136\128 n : Num, FCONS(a, f, SUC(n)) == f(n))
      #|  \226\136\128 f : (Num) -> A, f == FCONS(f(0), o(f, SUC))
      #|  (FNIL : (Num) -> A)((n : Num)) == select((x : A) => true)
      #|  0
      #|  SUC
      #|  true
      #|  (n : Num)
      #|  select((x : Bool) => true)
      #|  (s : (Num) -> Z)
      #|  :Z
      #|  :num
      #|  (OUTL : (Sum[A, B]) -> A)(INL((x : A))) == x
      #|  (OUTR : (Sum[A, B]) -> B)(INR((y : B))) == y
      #|  \226\136\128 P : (Option[A]) -> Bool, (\226\136\128 x : Option[A], P(x)) == (P(NONE) && (\226\136\128 a : A, P(SOME(a))))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x)) == !(\226\136\128 x : _, !P(x))
      #|  \226\136\128 P : (Option[A]) -> Bool, (\226\136\131 x : Option[A], P(x)) == (P(NONE) || (\226\136\131 a : A, P(SOME(a))))
      #|  :num
      #|  ((a : Bool) \226\134\146 false) == !a
      #|  (true == false) == false
      #|  \226\136\128 a : A, !(SOME(a) == NONE)
      #|  \226\136\128 a : A, \226\136\128 b : A, (SOME(a) == SOME(b)) == (a == b)
      #|  (ISO : ((A) -> B, (B) -> A) -> Bool)((f : (A) -> B), (g : (B) -> A)) == ((\226\136\128 x : B, f(g(x)) == x) && (\226\136\128 y : A, g(f(y)) == y))
      #|  ISO((x : A) => x, (x : A) => x)
      #|  ISO((f : (A) -> A'), (f' : (A') -> A)) && ISO((g : (B) -> B'), (g' : (B') -> B)) \226\134\146 ISO((h : (A) -> B) => (a' : A') => g(h(f'(a'))), (h : (A') -> B') => (a : A) => g'(h(f(a))))
      #|  ISO((f : (A) -> B), (g : (B) -> A)) \226\134\146 (\226\136\128 P : (A) -> Bool, (\226\136\128 x : A, P(x)) == (\226\136\128 x : B, P(g(x)))) && (\226\136\128 P : (A) -> Bool, (\226\136\131 x : A, P(x)) == (\226\136\131 x : B, P(g(x)))) && (\226\136\128 a : A, \226\136\128 b : B, (a == g(b)) == (f(a) == b))
      #|  op_q((P : (_) -> Bool)) \226\134\146 (c : _) == select(P) \226\134\146 P(c)
      #|  (p : Bool)
      #|  (if existsunique((x : _) => x == (a : _) && (p : Bool)) { select((x : _) => x == a && p) } else { select((x : _) => false) }) == (if p { a } else { select((x : _) => false) })
      #|  _MATCH((x : _), _SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool))) == (if (\226\136\131 y : _, r(x, y)) { _MATCH(x, r) } else { _MATCH(x, s) }) && _FUNCTION(_SEQPATTERN(r, s), x) == (if (\226\136\131 y : _, r(x, y)) { _FUNCTION(r, x) } else { _FUNCTION(s, x) })
      #|  (\226\136\131 y : _, _UNGUARDED_PATTERN(GEQ((s : _), (t : _)), GEQ((u : _), y))) == (s == t) && (\226\136\131 y : _, _GUARDED_PATTERN(GEQ(s, t), (p : Bool), GEQ(u, y))) == (s == t && p)
      #|  _MATCH((x : _), (y : _) => (z : _) => (P : (_, _) -> Bool)(y, z)) == (if existsunique((z : _) => P(x, z)) { select((z : _) => P(x, z)) } else { select((x : _) => false) }) && _FUNCTION((y : _) => (z : _) => P(y, z), x) == (if existsunique((z : _) => P(x, z)) { select((z : _) => P(x, z)) } else { select((x : _) => false) })
      #|  _UNGUARDED_PATTERN(GEQ((s : _), (t : _)), GEQ((u : _), (y : _))) == (y == u && s == t) && _GUARDED_PATTERN(GEQ(s, t), (p : Bool), GEQ(u, y)) == (y == u && s == t && p)
      #|  (if existsunique((z : _) => z == (k : _)) { select((z : _) => z == k) } else { select((x : _) => false) }) == k
      #|  _FUNCTION((y : _) => (z : _) => (P : (_, _) -> Bool)(y, z), (x : _))
      #|  _MATCH((x : _), (y : _) => (z : _) => (P : (_, _) -> Bool)(y, z))
      #|  _FUNCTION(_SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool)), (x : _))
      #|  _MATCH((x : _), _SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool)))
      #|  (\226\136\128 x : _, (a : _) == x \226\134\146 (q : (_) -> Bool)(x)) == q(a)
      #|  (\226\136\128 x : _, x == (a : _) \226\134\146 (q : (_) -> Bool)(x)) == q(a)
      #|  (\226\136\128 x : _, (a : _) == x && (p : (_) -> Bool)(x) \226\134\146 (q : (_) -> Bool)(x)) == (p(a) \226\134\146 q(a))
      #|  (\226\136\128 x : _, x == (a : _) && (p : (_) -> Bool)(x) \226\134\146 (q : (_) -> Bool)(x)) == (p(a) \226\134\146 q(a))
      #|INJ_INVERSE2 =  |- (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\P:fun('A,fun('B,'C)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x1:'A. (#forall:fun(fun('B,bool),bool) (\y1:'B. (#forall:fun(fun('A,bool),bool) (\x2:'A. (#forall:fun(fun('B,bool),bool) (\y2:'B. ((#=:fun(bool,fun(bool,bool)) ((#=:fun('C,fun('C,bool)) ((P:fun('A,fun('B,'C)) x1:'A) y1:'B)) ((P:fun('A,fun('B,'C)) x2:'A) y2:'B))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x1:'A) x2:'A)) ((#=:fun('B,fun('B,bool)) y1:'B) y2:'B)))))))))))) (#?:fun(fun(fun('C,'A),bool),bool) (\X:fun('C,'A). (#?:fun(fun(fun('C,'B),bool),bool) (\Y:fun('C,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (X:fun('C,'A) ((P:fun('A,fun('B,'C)) x:'A) y:'B))) x:'A)) ((#=:fun('B,fun('B,bool)) (Y:fun('C,'B) ((P:fun('A,fun('B,'C)) x:'A) y:'B))) y:'B)))))))))))))
      #|NUMPAIR =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#NUMPAIR:fun(num,fun(num,num)) x:num) y:num)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|NUMPAIR_INJ_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\x1:num. (#forall:fun(fun(num,bool),bool) (\y1:num. (#forall:fun(fun(num,bool),bool) (\x2:num. (#forall:fun(fun(num,bool),bool) (\y2:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#NUMPAIR:fun(num,fun(num,num)) x1:num) y1:num)) ((#NUMPAIR:fun(num,fun(num,num)) x2:num) y2:num))) ((#=:fun(num,fun(num,bool)) x1:num) x2:num))))))))))
      #|NUMPAIR_INJ =  |- (#forall:fun(fun(num,bool),bool) (\x1:num. (#forall:fun(fun(num,bool),bool) (\y1:num. (#forall:fun(fun(num,bool),bool) (\x2:num. (#forall:fun(fun(num,bool),bool) (\y2:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#NUMPAIR:fun(num,fun(num,num)) x1:num) y1:num)) ((#NUMPAIR:fun(num,fun(num,num)) x2:num) y2:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x1:num) x2:num)) ((#=:fun(num,fun(num,bool)) y1:num) y2:num)))))))))))
      #|NUMPAIR_DEST =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#NUMFST:fun(num,num) ((#NUMPAIR:fun(num,fun(num,num)) x:num) y:num))) x:num)) ((#=:fun(num,fun(num,bool)) (#NUMSND:fun(num,num) ((#NUMPAIR:fun(num,fun(num,num)) x:num) y:num))) y:num))))))
      #|NUMSUM =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(num,fun(num,bool)) ((#NUMSUM:fun(bool,fun(num,num)) b:bool) x:num)) (((#COND:fun(bool,fun(num,fun(num,num))) b:bool) (#SUC:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num)))))))
      #|NUMSUM_INJ =  |- (#forall:fun(fun(bool,bool),bool) (\b1:bool. (#forall:fun(fun(num,bool),bool) (\x1:num. (#forall:fun(fun(bool,bool),bool) (\b2:bool. (#forall:fun(fun(num,bool),bool) (\x2:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#NUMSUM:fun(bool,fun(num,num)) b1:bool) x1:num)) ((#NUMSUM:fun(bool,fun(num,num)) b2:bool) x2:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b1:bool) b2:bool)) ((#=:fun(num,fun(num,bool)) x1:num) x2:num)))))))))))
      #|NUMSUM_DEST =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. (#forall:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#NUMLEFT:fun(num,bool) ((#NUMSUM:fun(bool,fun(num,num)) x:bool) y:num))) x:bool)) ((#=:fun(num,fun(num,bool)) (#NUMRIGHT:fun(num,num) ((#NUMSUM:fun(bool,fun(num,num)) x:bool) y:num))) y:num))))))
      #|INJN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJN:fun(num,fun(num,fun('A,bool))) m:num)) (\n:num. (\a:'A. ((#=:fun(num,fun(num,bool)) n:num) m:num))))))
      #|INJN_INJ =  |- (#forall:fun(fun(num,bool),bool) (\n1:num. (#forall:fun(fun(num,bool),bool) (\n2:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJN:fun(num,fun(num,fun('A,bool))) n1:num)) (#INJN:fun(num,fun(num,fun('A,bool))) n2:num))) ((#=:fun(num,fun(num,bool)) n1:num) n2:num))))))
      #|INJA =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJA:fun('A,fun(num,fun('A,bool))) a:'A)) (\n:num. (\b:'A. ((#=:fun('A,fun('A,bool)) b:'A) a:'A))))))
      #|INJA_INJ =  |- (#forall:fun(fun('A,bool),bool) (\a1:'A. (#forall:fun(fun('A,bool),bool) (\a2:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJA:fun('A,fun(num,fun('A,bool))) a1:'A)) (#INJA:fun('A,fun(num,fun('A,bool))) a2:'A))) ((#=:fun('A,fun('A,bool)) a1:'A) a2:'A))))))
      #|INJF =  |- (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\f:fun(num,fun(num,fun('A,bool))). ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJF:fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))) f:fun(num,fun(num,fun('A,bool))))) (\n:num. ((f:fun(num,fun(num,fun('A,bool))) (#NUMFST:fun(num,num) n:num)) (#NUMSND:fun(num,num) n:num))))))
      #|INJF_INJ =  |- (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\f1:fun(num,fun(num,fun('A,bool))). (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\f2:fun(num,fun(num,fun('A,bool))). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#INJF:fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))) f1:fun(num,fun(num,fun('A,bool))))) (#INJF:fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))) f2:fun(num,fun(num,fun('A,bool)))))) ((#=:fun(fun(num,fun(num,fun('A,bool))),fun(fun(num,fun(num,fun('A,bool))),bool)) f1:fun(num,fun(num,fun('A,bool)))) f2:fun(num,fun(num,fun('A,bool)))))))))
      #|INJP =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f1:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f2:fun(num,fun('A,bool)). ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) f1:fun(num,fun('A,bool))) f2:fun(num,fun('A,bool)))) (\n:num. (\a:'A. (((#COND:fun(bool,fun(bool,fun(bool,bool))) (#NUMLEFT:fun(num,bool) n:num)) ((f1:fun(num,fun('A,bool)) (#NUMRIGHT:fun(num,num) n:num)) a:'A)) ((f2:fun(num,fun('A,bool)) (#NUMRIGHT:fun(num,num) n:num)) a:'A)))))))))
      #|INJP_INJ =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f1:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f1':fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f2:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\f2':fun(num,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) f1:fun(num,fun('A,bool))) f2:fun(num,fun('A,bool)))) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) f1':fun(num,fun('A,bool))) f2':fun(num,fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) f1:fun(num,fun('A,bool))) f1':fun(num,fun('A,bool)))) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) f2:fun(num,fun('A,bool))) f2':fun(num,fun('A,bool)))))))))))))
      #|ZCONSTR =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\r:fun(num,fun(num,fun('A,bool))). ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) r:fun(num,fun(num,fun('A,bool))))) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) (#INJN:fun(num,fun(num,fun('A,bool))) (#SUC:fun(num,num) c:num))) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) (#INJA:fun('A,fun(num,fun('A,bool))) i:'A)) (#INJF:fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))) r:fun(num,fun(num,fun('A,bool)))))))))))))
      #|ZBOT =  |- ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) #ZBOT:fun(num,fun('A,bool))) ((#INJP:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),fun(num,fun('A,bool)))) (#INJN:fun(num,fun(num,fun('A,bool))) (#NUMERAL:fun(num,num) #_0:num))) (#@:fun(fun(fun(num,fun('A,bool)),bool),fun(num,fun('A,bool))) (\z:fun(num,fun('A,bool)). #T:bool))))
      #|ZCONSTR_ZBOT =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\r:fun(num,fun(num,fun('A,bool))). (#~:fun(bool,bool) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) r:fun(num,fun(num,fun('A,bool))))) #ZBOT:fun(num,fun('A,bool))))))))))
      #|ZRECSPACE_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) #ZBOT:fun(num,fun('A,bool)))) (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\r:fun(num,fun(num,fun('A,bool))). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) (r:fun(num,fun(num,fun('A,bool))) n:num))))) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) r:fun(num,fun(num,fun('A,bool)))))))))))))
      #|ZRECSPACE_INDUCT =  |- (#forall:fun(fun(fun(fun(num,fun('A,bool)),bool),bool),bool) (\ZRECSPACE':fun(fun(num,fun('A,bool)),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (ZRECSPACE':fun(fun(num,fun('A,bool)),bool) #ZBOT:fun(num,fun('A,bool)))) (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\r:fun(num,fun(num,fun('A,bool))). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (ZRECSPACE':fun(fun(num,fun('A,bool)),bool) (r:fun(num,fun(num,fun('A,bool))) n:num))))) (ZRECSPACE':fun(fun(num,fun('A,bool)),bool) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) r:fun(num,fun(num,fun('A,bool)))))))))))))) (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\a:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) a:fun(num,fun('A,bool)))) (ZRECSPACE':fun(fun(num,fun('A,bool)),bool) a:fun(num,fun('A,bool)))))))))
      #|ZRECSPACE_CASES =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\a:fun(num,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) a:fun(num,fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) a:fun(num,fun('A,bool))) #ZBOT:fun(num,fun('A,bool)))) (#?:fun(fun(num,bool),bool) (\c:num. (#?:fun(fun('A,bool),bool) (\i:'A. (#?:fun(fun(fun(num,fun(num,fun('A,bool))),bool),bool) (\r:fun(num,fun(num,fun('A,bool))). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) a:fun(num,fun('A,bool))) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) r:fun(num,fun(num,fun('A,bool)))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) (r:fun(num,fun(num,fun('A,bool))) n:num)))))))))))))))
      #|BOTTOM =  |- ((#=:fun(recspace('A),fun(recspace('A),bool)) #BOTTOM:recspace('A)) (#_mk_rec:fun(fun(num,fun('A,bool)),recspace('A)) #ZBOT:fun(num,fun('A,bool))))
      #|CONSTR =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r:fun(num,recspace('A)). ((#=:fun(recspace('A),fun(recspace('A),bool)) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c:num) i:'A) r:fun(num,recspace('A)))) (#_mk_rec:fun(fun(num,fun('A,bool)),recspace('A)) (((#ZCONSTR:fun(num,fun('A,fun(fun(num,fun(num,fun('A,bool))),fun(num,fun('A,bool))))) c:num) i:'A) (\n:num. (#_dest_rec:fun(recspace('A),fun(num,fun('A,bool))) (r:fun(num,recspace('A)) n:num))))))))))))
      #|MK_REC_INJ =  |- (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\x:fun(num,fun('A,bool)). (#forall:fun(fun(fun(num,fun('A,bool)),bool),bool) (\y:fun(num,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(recspace('A),fun(recspace('A),bool)) (#_mk_rec:fun(fun(num,fun('A,bool)),recspace('A)) x:fun(num,fun('A,bool)))) (#_mk_rec:fun(fun(num,fun('A,bool)),recspace('A)) y:fun(num,fun('A,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) x:fun(num,fun('A,bool)))) (#ZRECSPACE:fun(fun(num,fun('A,bool)),bool) y:fun(num,fun('A,bool))))) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) x:fun(num,fun('A,bool))) y:fun(num,fun('A,bool)))))))))
      #|DEST_REC_INJ =  |- (#forall:fun(fun(recspace('A),bool),bool) (\x:recspace('A). (#forall:fun(fun(recspace('A),bool),bool) (\y:recspace('A). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(num,fun('A,bool)),fun(fun(num,fun('A,bool)),bool)) (#_dest_rec:fun(recspace('A),fun(num,fun('A,bool))) x:recspace('A))) (#_dest_rec:fun(recspace('A),fun(num,fun('A,bool))) y:recspace('A)))) ((#=:fun(recspace('A),fun(recspace('A),bool)) x:recspace('A)) y:recspace('A)))))))
      #|CONSTR_BOT =  |- (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r:fun(num,recspace('A)). (#~:fun(bool,bool) ((#=:fun(recspace('A),fun(recspace('A),bool)) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c:num) i:'A) r:fun(num,recspace('A)))) #BOTTOM:recspace('A)))))))))
      #|CONSTR_INJ =  |- (#forall:fun(fun(num,bool),bool) (\c1:num. (#forall:fun(fun('A,bool),bool) (\i1:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r1:fun(num,recspace('A)). (#forall:fun(fun(num,bool),bool) (\c2:num. (#forall:fun(fun('A,bool),bool) (\i2:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r2:fun(num,recspace('A)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(recspace('A),fun(recspace('A),bool)) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c1:num) i1:'A) r1:fun(num,recspace('A)))) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c2:num) i2:'A) r2:fun(num,recspace('A))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) c1:num) c2:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) i1:'A) i2:'A)) ((#=:fun(fun(num,recspace('A)),fun(fun(num,recspace('A)),bool)) r1:fun(num,recspace('A))) r2:fun(num,recspace('A))))))))))))))))))
      #|CONSTR_IND =  |- (#forall:fun(fun(fun(recspace('A),bool),bool),bool) (\P:fun(recspace('A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(recspace('A),bool) #BOTTOM:recspace('A))) (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r:fun(num,recspace('A)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(recspace('A),bool) (r:fun(num,recspace('A)) n:num))))) (P:fun(recspace('A),bool) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c:num) i:'A) r:fun(num,recspace('A))))))))))))) (#forall:fun(fun(recspace('A),bool),bool) (\x:recspace('A). (P:fun(recspace('A),bool) x:recspace('A)))))))
      #|CONSTR_REC =  |- (#forall:fun(fun(fun(num,fun('A,fun(fun(num,recspace('A)),fun(fun(num,'B),'B)))),bool),bool) (\Fn:fun(num,fun('A,fun(fun(num,recspace('A)),fun(fun(num,'B),'B)))). (#?:fun(fun(fun(recspace('A),'B),bool),bool) (\f:fun(recspace('A),'B). (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun('A,bool),bool) (\i:'A. (#forall:fun(fun(fun(num,recspace('A)),bool),bool) (\r:fun(num,recspace('A)). ((#=:fun('B,fun('B,bool)) (f:fun(recspace('A),'B) (((#CONSTR:fun(num,fun('A,fun(fun(num,recspace('A)),recspace('A)))) c:num) i:'A) r:fun(num,recspace('A))))) ((((Fn:fun(num,fun('A,fun(fun(num,recspace('A)),fun(fun(num,'B),'B)))) c:num) i:'A) r:fun(num,recspace('A))) (\n:num. (f:fun(recspace('A),'B) (r:fun(num,recspace('A)) n:num)))))))))))))))
      #|FCONS =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun('A,fun('A,bool)) (((#FCONS:fun('A,fun(fun(num,'A),fun(num,'A))) a:'A) f:fun(num,'A)) (#NUMERAL:fun(num,num) #_0:num))) a:'A)))))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (((#FCONS:fun('A,fun(fun(num,'A),fun(num,'A))) a:'A) f:fun(num,'A)) (#SUC:fun(num,num) n:num))) (f:fun(num,'A) n:num)))))))))
      #|FCONS_UNDO =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(fun(num,'A),fun(fun(num,'A),bool)) f:fun(num,'A)) ((#FCONS:fun('A,fun(fun(num,'A),fun(num,'A))) (f:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) #SUC:fun(num,num))))))
      #|FNIL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (#FNIL:fun(num,'A) n:num)) (#@:fun(fun('A,bool),'A) (\x:'A. #T:bool)))))
      #|sum_INDUCT =  |- (#forall:fun(fun(fun(sum('A,'B),bool),bool),bool) (\P:fun(sum('A,'B),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. (P:fun(sum('A,'B),bool) (#INL:fun('A,sum('A,'B)) a:'A))))) (#forall:fun(fun('B,bool),bool) (\a:'B. (P:fun(sum('A,'B),bool) (#INR:fun('B,sum('A,'B)) a:'B)))))) (#forall:fun(fun(sum('A,'B),bool),bool) (\x:sum('A,'B). (P:fun(sum('A,'B),bool) x:sum('A,'B)))))))
      #|sum_RECURSION =  |- (#forall:fun(fun(fun('A,'Z),bool),bool) (\INL':fun('A,'Z). (#forall:fun(fun(fun('B,'Z),bool),bool) (\INR':fun('B,'Z). (#?:fun(fun(fun(sum('A,'B),'Z),bool),bool) (\fn_:fun(sum('A,'B),'Z). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(sum('A,'B),'Z) (#INL:fun('A,sum('A,'B)) a:'A))) (INL':fun('A,'Z) a:'A))))) (#forall:fun(fun('B,bool),bool) (\a:'B. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(sum('A,'B),'Z) (#INR:fun('B,sum('A,'B)) a:'B))) (INR':fun('B,'Z) a:'B)))))))))))
      #|OUTL =  |- ((#=:fun('A,fun('A,bool)) (#OUTL:fun(sum('A,'B),'A) (#INL:fun('A,sum('A,'B)) x:'A))) x:'A)
      #|OUTR =  |- ((#=:fun('B,fun('B,bool)) (#OUTR:fun(sum('A,'B),'B) (#INR:fun('B,sum('A,'B)) y:'B))) y:'B)
      #|option_INDUCT =  |- (#forall:fun(fun(fun(option('A),bool),bool),bool) (\P:fun(option('A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(option('A),bool) #NONE:option('A))) (#forall:fun(fun('A,bool),bool) (\a:'A. (P:fun(option('A),bool) (#SOME:fun('A,option('A)) a:'A)))))) (#forall:fun(fun(option('A),bool),bool) (\x:option('A). (P:fun(option('A),bool) x:option('A)))))))
      #|option_RECURSION =  |- (#forall:fun(fun('Z,bool),bool) (\NONE':'Z. (#forall:fun(fun(fun('A,'Z),bool),bool) (\SOME':fun('A,'Z). (#?:fun(fun(fun(option('A),'Z),bool),bool) (\fn_:fun(option('A),'Z). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(option('A),'Z) #NONE:option('A))) NONE':'Z)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(option('A),'Z) (#SOME:fun('A,option('A)) a:'A))) (SOME':fun('A,'Z) a:'A)))))))))))
      #|list_INDUCT =  |- (#forall:fun(fun(fun(list('A),bool),bool),bool) (\P:fun(list('A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(list('A),bool) #NIL:list('A))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun(list('A),bool),bool) (\a1:list('A). ((#==>:fun(bool,fun(bool,bool)) (P:fun(list('A),bool) a1:list('A))) (P:fun(list('A),bool) ((#CONS:fun('A,fun(list('A),list('A))) a0:'A) a1:list('A)))))))))) (#forall:fun(fun(list('A),bool),bool) (\x:list('A). (P:fun(list('A),bool) x:list('A)))))))
      #|list_RECURSION =  |- (#forall:fun(fun('Z,bool),bool) (\NIL':'Z. (#forall:fun(fun(fun('A,fun(list('A),fun('Z,'Z))),bool),bool) (\CONS':fun('A,fun(list('A),fun('Z,'Z))). (#?:fun(fun(fun(list('A),'Z),bool),bool) (\fn_:fun(list('A),'Z). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z,fun('Z,bool)) (fn_:fun(list('A),'Z) #NIL:list('A))) NIL':'Z)) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun(list('A),bool),bool) (\a1:list('A). ((#=:fun('Z,fun('Z,bool)) (fn_:fun(list('A),'Z) ((#CONS:fun('A,fun(list('A),list('A))) a0:'A) a1:list('A)))) (((CONS':fun('A,fun(list('A),fun('Z,'Z))) a0:'A) a1:list('A)) (fn_:fun(list('A),'Z) a1:list('A)))))))))))))))
      #|FORALL_OPTION_THM =  |- (#forall:fun(fun(fun(option('A),bool),bool),bool) (\P:fun(option('A),bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(option('A),bool),bool) (\x:option('A). (P:fun(option('A),bool) x:option('A))))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(option('A),bool) #NONE:option('A))) (#forall:fun(fun('A,bool),bool) (\a:'A. (P:fun(option('A),bool) (#SOME:fun('A,option('A)) a:'A))))))))
      #|EXISTS_OPTION_THM =  |- (#forall:fun(fun(fun(option('A),bool),bool),bool) (\P:fun(option('A),bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(option('A),bool),bool) (\x:option('A). (P:fun(option('A),bool) x:option('A))))) ((#\/:fun(bool,fun(bool,bool)) (P:fun(option('A),bool) #NONE:option('A))) (#?:fun(fun('A,bool),bool) (\a:'A. (P:fun(option('A),bool) (#SOME:fun('A,option('A)) a:'A))))))))
      #|option_DISTINCT =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#~:fun(bool,bool) ((#=:fun(option('A),fun(option('A),bool)) (#SOME:fun('A,option('A)) a:'A)) #NONE:option('A)))))
      #|option_INJ =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(option('A),fun(option('A),bool)) (#SOME:fun('A,option('A)) a:'A)) (#SOME:fun('A,option('A)) b:'A))) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))))))
      #|ISO =  |- (#forall:fun(fun(fun('B,'A),bool),bool) (\g:fun('B,'A). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#ISO:fun(fun('A,'B),fun(fun('B,'A),bool)) f:fun('A,'B)) g:fun('B,'A))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\x:'B. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (g:fun('B,'A) x:'B))) x:'B)))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) (g:fun('B,'A) (f:fun('A,'B) y:'A))) y:'A)))))))))
      #|ISO_REFL =  |- ((#ISO:fun(fun('A,'A),fun(fun('A,'A),bool)) (\x:'A. x:'A)) (\x:'A. x:'A))
      #|ISO_FUN =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#ISO:fun(fun('A,'A'),fun(fun('A','A),bool)) f:fun('A,'A')) f':fun('A','A))) ((#ISO:fun(fun('B,'B'),fun(fun('B','B),bool)) g:fun('B,'B')) g':fun('B','B)))) ((#ISO:fun(fun(fun('A,'B),fun('A','B')),fun(fun(fun('A','B'),fun('A,'B)),bool)) (\h:fun('A,'B). (\a':'A'. (g:fun('B,'B') (h:fun('A,'B) (f':fun('A','A) a':'A')))))) (\h:fun('A','B'). (\a:'A. (g':fun('B','B) (h:fun('A','B') (f:fun('A,'A') a:'A)))))))
      #|ISO_USAGE =  |- ((#==>:fun(bool,fun(bool,bool)) ((#ISO:fun(fun('A,'B),fun(fun('B,'A),bool)) f:fun('A,'B)) g:fun('B,'A))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('B,bool),bool) (\x:'B. (P:fun('A,bool) (g:fun('B,'A) x:'B)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('B,bool),bool) (\x:'B. (P:fun('A,bool) (g:fun('B,'A) x:'B)))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('B,bool),bool) (\b:'B. ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a:'A) (g:fun('B,'A) b:'B))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) a:'A)) b:'B)))))))))
      #|types = list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 86
      #|deftype_tree =  |- (#forall:fun(fun(fun(tree,bool),bool),bool) (\P:fun(tree,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (P:fun(tree,bool) (#Leaf:fun(num,tree) a:num))))) (#forall:fun(fun(tree,bool),bool) (\a0:tree. (#forall:fun(fun(tree,bool),bool) (\a1:tree. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(tree,bool) a0:tree)) (P:fun(tree,bool) a1:tree))) (P:fun(tree,bool) ((#Node:fun(tree,fun(tree,tree)) a0:tree) a1:tree))))))))) (#forall:fun(fun(tree,bool),bool) (\x:tree. (P:fun(tree,bool) x:tree)))))) ;;  |- (#forall:fun(fun(fun(num,'Z),bool),bool) (\f0:fun(num,'Z). (#forall:fun(fun(fun(tree,fun(tree,fun('Z,fun('Z,'Z)))),bool),bool) (\f1:fun(tree,fun(tree,fun('Z,fun('Z,'Z)))). (#?:fun(fun(fun(tree,'Z),bool),bool) (\fn_:fun(tree,'Z). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(tree,'Z) (#Leaf:fun(num,tree) a:num))) (f0:fun(num,'Z) a:num))))) (#forall:fun(fun(tree,bool),bool) (\a0:tree. (#forall:fun(fun(tree,bool),bool) (\a1:tree. ((#=:fun('Z,fun('Z,bool)) (fn_:fun(tree,'Z) ((#Node:fun(tree,fun(tree,tree)) a0:tree) a1:tree))) ((((f1:fun(tree,fun(tree,fun('Z,fun('Z,'Z)))) a0:tree) a1:tree) (fn_:fun(tree,'Z) a0:tree)) (fn_:fun(tree,'Z) a1:tree))))))))))))))
      #|deftype_nested =  |- (#forall:fun(fun(fun(rose,bool),bool),bool) (\P0:fun(rose,bool). (#forall:fun(fun(fun(list(rose),bool),bool),bool) (\P1:fun(list(rose),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(rose),bool),bool) (\a1:list(rose). ((#==>:fun(bool,fun(bool,bool)) (P1:fun(list(rose),bool) a1:list(rose))) (P0:fun(rose,bool) ((#Rose:fun(num,fun(list(rose),rose)) a0:num) a1:list(rose))))))))) ((#/\:fun(bool,fun(bool,bool)) (P1:fun(list(rose),bool) #NIL:list(rose))) (#forall:fun(fun(rose,bool),bool) (\a0:rose. (#forall:fun(fun(list(rose),bool),bool) (\a1:list(rose). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P0:fun(rose,bool) a0:rose)) (P1:fun(list(rose),bool) a1:list(rose)))) (P1:fun(list(rose),bool) ((#CONS:fun(rose,fun(list(rose),list(rose))) a0:rose) a1:list(rose))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(rose,bool),bool) (\x0:rose. (P0:fun(rose,bool) x0:rose)))) (#forall:fun(fun(list(rose),bool),bool) (\x1:list(rose). (P1:fun(list(rose),bool) x1:list(rose)))))))))) ;;  |- (#forall:fun(fun(fun(num,fun(list(rose),fun('Z0,'Z1))),bool),bool) (\f0:fun(num,fun(list(rose),fun('Z0,'Z1))). (#forall:fun(fun('Z0,bool),bool) (\f1:'Z0. (#forall:fun(fun(fun(rose,fun(list(rose),fun('Z1,fun('Z0,'Z0)))),bool),bool) (\f2:fun(rose,fun(list(rose),fun('Z1,fun('Z0,'Z0)))). (#?:fun(fun(fun(list(rose),'Z0),bool),bool) (\fn0:fun(list(rose),'Z0). (#?:fun(fun(fun(rose,'Z1),bool),bool) (\fn1:fun(rose,'Z1). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a0:num. (#forall:fun(fun(list(rose),bool),bool) (\a1:list(rose). ((#=:fun('Z1,fun('Z1,bool)) (fn1:fun(rose,'Z1) ((#Rose:fun(num,fun(list(rose),rose)) a0:num) a1:list(rose)))) (((f0:fun(num,fun(list(rose),fun('Z0,'Z1))) a0:num) a1:list(rose)) (fn0:fun(list(rose),'Z0) a1:list(rose))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(list(rose),'Z0) #NIL:list(rose))) f1:'Z0)) (#forall:fun(fun(rose,bool),bool) (\a0:rose. (#forall:fun(fun(list(rose),bool),bool) (\a1:list(rose). ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(list(rose),'Z0) ((#CONS:fun(rose,fun(list(rose),list(rose))) a0:rose) a1:list(rose)))) ((((f2:fun(rose,fun(list(rose),fun('Z1,fun('Z0,'Z0)))) a0:rose) a1:list(rose)) (fn1:fun(rose,'Z1) a0:rose)) (fn0:fun(list(rose),'Z0) a1:list(rose))))))))))))))))))))
      #|deftype_mutual =  |- (#forall:fun(fun(fun(even_t,bool),bool),bool) (\P0:fun(even_t,bool). (#forall:fun(fun(fun(odd_t,bool),bool),bool) (\P1:fun(odd_t,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P0:fun(even_t,bool) #Ez:even_t)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(odd_t,bool),bool) (\a:odd_t. ((#==>:fun(bool,fun(bool,bool)) (P1:fun(odd_t,bool) a:odd_t)) (P0:fun(even_t,bool) (#Es:fun(odd_t,even_t) a:odd_t)))))) (#forall:fun(fun(even_t,bool),bool) (\a:even_t. ((#==>:fun(bool,fun(bool,bool)) (P0:fun(even_t,bool) a:even_t)) (P1:fun(odd_t,bool) (#Os:fun(even_t,odd_t) a:even_t)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(even_t,bool),bool) (\x0:even_t. (P0:fun(even_t,bool) x0:even_t)))) (#forall:fun(fun(odd_t,bool),bool) (\x1:odd_t. (P1:fun(odd_t,bool) x1:odd_t))))))))) ;;  |- (#forall:fun(fun('Z0,bool),bool) (\f0:'Z0. (#forall:fun(fun(fun(odd_t,fun('Z1,'Z0)),bool),bool) (\f1:fun(odd_t,fun('Z1,'Z0)). (#forall:fun(fun(fun(even_t,fun('Z0,'Z1)),bool),bool) (\f2:fun(even_t,fun('Z0,'Z1)). (#?:fun(fun(fun(even_t,'Z0),bool),bool) (\fn0:fun(even_t,'Z0). (#?:fun(fun(fun(odd_t,'Z1),bool),bool) (\fn1:fun(odd_t,'Z1). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(even_t,'Z0) #Ez:even_t)) f0:'Z0)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(odd_t,bool),bool) (\a:odd_t. ((#=:fun('Z0,fun('Z0,bool)) (fn0:fun(even_t,'Z0) (#Es:fun(odd_t,even_t) a:odd_t))) ((f1:fun(odd_t,fun('Z1,'Z0)) a:odd_t) (fn1:fun(odd_t,'Z1) a:odd_t)))))) (#forall:fun(fun(even_t,bool),bool) (\a:even_t. ((#=:fun('Z1,fun('Z1,bool)) (fn1:fun(odd_t,'Z1) (#Os:fun(even_t,odd_t) a:even_t))) ((f2:fun(even_t,fun('Z0,'Z1)) a:even_t) (fn0:fun(even_t,'Z0) a:even_t)))))))))))))))))
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _18372:bool
      #|
    ),
  )
}
